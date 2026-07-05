# Finite witnesses for the full-window qubit moment compactness theorem
# (shard CA-63). The derivation proves: exact feasibility of the monotone
# full-window qubit moment hierarchy at every level implies a translation-
# invariant state on the quasi-local spin algebra. These helpers realise the
# proof's finite ingredients as exact numerical objects:
#
#   * a Pauli word -> dense matrix on a window,
#   * the density matrix  rho_N = 2^{-|I_N|} sum_s y_s P_s  (Lemma 3, 63.5),
#   * the moment (Gram) matrix  M_N(y)_{u,v} = <P_u^* P_v>   (63.2, 63.4),
#   * the product-trace conditional expectation extension (Lemma 4),
#
# so a test can assert the equivalence  M_N >= 0  <=>  rho_N >= 0  and the
# extension/nesting facts that make the K_N nested, nonempty, and compact.
#
# Per AGENTS.md Rule 1 every helper fails loud on malformed input.

"""
    pauli_word_matrix(word, start, len) -> Matrix{ComplexF64}

Dense `2^len x 2^len` matrix of the positioned Pauli word `word` on the window
of `len` sites beginning at zero-based lattice site `start`. Sites of `word`
outside the window are a hard error (the word does not act on this algebra).
"""
function pauli_word_matrix(word::PauliWord, start::Integer, len::Integer)
    len >= 1 || error("window length must be positive, got $len")
    stop = start + len - 1
    for s in word.sites
        start <= s <= stop || error("word site $s outside window [$start, $stop]")
    end
    label_at = Dict(word.sites[k] => word.labels[k] for k in 1:length(word.sites))
    out = PAULI_BASIS[get(label_at, start, 0) + 1]
    for site in (start + 1):stop
        out = kron(out, PAULI_BASIS[get(label_at, site, 0) + 1])
    end
    return Matrix{ComplexF64}(out)
end

"""
    moment_value(y, word) -> Float64

Value `y_s` of the translation-invariant moment vector `y` (a dict keyed by
canonical words) on the positioned Pauli word `word`. The empty word is unital
(`y_∅ = 1`, eq. 63.1). A missing canonical key is a hard error rather than a
silent default: the caller must supply the full window moment data.
"""
function moment_value(y::AbstractDict, word::PauliWord)
    isempty(word.sites) && return 1.0
    key = canonical_moment_word(word)
    haskey(y, key) || error("moment vector missing canonical word $key (from $word)")
    return float(y[key])
end

"""
    density_matrix_from_moments(y, start, len) -> Matrix{ComplexF64}

Reconstruct `rho = 2^{-len} sum_{s in window} y_s P_s` over the window of `len`
sites at `start` (eq. 63.5). Sums over *all* `4^len` Pauli words supported in
the window, so this is the exact Pauli-basis inverse of the moment map.
"""
function density_matrix_from_moments(y::AbstractDict, start::Integer, len::Integer)
    len >= 1 || error("window length must be positive, got $len")
    dim = 2^len
    rho = zeros(ComplexF64, dim, dim)
    for w in window_pauli_words(start, len)
        rho .+= moment_value(y, w) .* pauli_word_matrix(w, start, len)
    end
    return rho ./ dim
end

"""
    moment_matrix_from_moments(words, y) -> Matrix{ComplexF64}

Hermitian moment matrix `M_{u,v} = <P_u^* P_v>` for the Pauli basis `words`
(eq. 63.2). Pauli words are self-adjoint, so `P_u^* = P_u`; the product
`P_u P_v = phase * P_w` is evaluated exactly via `multiply_pauli_words`, and the
canonical value is read from `y`. This is precisely the Gram matrix of the
functional `omega(X) = sum y_s <P_s, X>`, whence `c^* M c = omega(X^* X)`.
"""
function moment_matrix_from_moments(words::AbstractVector{PauliWord}, y::AbstractDict)
    k = length(words)
    k >= 1 || error("need at least one Pauli word to build a moment matrix")
    M = zeros(ComplexF64, k, k)
    for i in 1:k, j in 1:k
        phase, prod = multiply_pauli_words(words[i], words[j])
        M[i, j] = phase * moment_value(y, prod)
    end
    return M
end

"""
    is_moment_psd(A; atol = 1e-10) -> Bool

Whether the (Hermitised) matrix `A` is positive semidefinite to tolerance
`atol`, i.e. `eigmin >= -atol`. Used to certify both `rho_N >= 0` and
`M_N >= 0` and, per the theorem (63.4/63.5), their equivalence.
"""
function is_moment_psd(A::AbstractMatrix; atol::Real = 1e-10)
    size(A, 1) == size(A, 2) || error("PSD check needs a square matrix, got $(size(A))")
    H = Hermitian((A + A') / 2)
    return eigmin(H) >= -atol
end

"""
    extend_density_matrix(rho, n_left, n_right) -> Matrix{ComplexF64}

Product-trace extension (Lemma 4 / 63): tensor `n_left` normalized identities
`I/2` on the left and `n_right` on the right of the window density matrix `rho`.
This is the density-matrix form of the unital completely positive conditional
expectation `E_N`; it preserves every moment supported on the original window.
"""
function extend_density_matrix(rho::AbstractMatrix, n_left::Integer, n_right::Integer)
    size(rho, 1) == size(rho, 2) || error("density matrix must be square, got $(size(rho))")
    n_left >= 0 || error("n_left must be nonnegative, got $n_left")
    n_right >= 0 || error("n_right must be nonnegative, got $n_right")
    half = ComplexF64[0.5 0; 0 0.5]
    out = Matrix{ComplexF64}(rho)
    for _ in 1:n_left
        out = kron(half, out)
    end
    for _ in 1:n_right
        out = kron(out, half)
    end
    return out
end

"""
    product_state_moment_vector(bloch, start, len) -> Dict{PauliWord, Float64}

Translation-invariant product-state moment vector on the window `[start,
start+len-1]`: every site carries the same Bloch vector `bloch = (bx, by, bz)`,
so `<P_s> = prod_k bloch[label_k]`. Keyed by canonical words (eq. 63.1); the
build asserts translation consistency, so any indexing bug fails loud.
"""
function product_state_moment_vector(bloch, start::Integer, len::Integer)
    length(bloch) == 3 || error("bloch vector must have 3 components (bx, by, bz)")
    y = Dict{PauliWord, Float64}()
    for w in window_pauli_words(start, len)
        key = canonical_moment_word(w)
        val = 1.0
        for lab in w.labels
            val *= float(bloch[lab])
        end
        if haskey(y, key)
            isapprox(y[key], val; atol = 1e-12) ||
                error("inconsistent translation-invariant moment for $key: $(y[key]) vs $val")
        else
            y[key] = val
        end
    end
    return y
end
