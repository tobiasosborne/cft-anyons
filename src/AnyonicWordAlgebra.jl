# AnyonicWordAlgebra.jl
#
# Fibonacci anyonic word algebra (CA-65/CA-66) and the vacuum-insertion
# refinement (CA-67/CA-68 drafts). Concrete, finite, fail-loud — no general
# category machinery, only the Fibonacci fusion rules.
#
# Site object O = 1 ⊕ τ. A basis of Hom(X_c, O^{⊗L}) is enumerated as pairs
# (S, path): S ⊆ {1,…,L} is the occupied (τ-carrying) set, and `path` is the
# admissible LEFT-ASSOCIATED cumulative-charge sequence x_1..x_L (with x_0 = 1
# implicit) ending at charge c. Empty sites carry the charge forward unchanged;
# a τ-letter branches only when the running charge is already τ.
#
# Conventions: CONVENTIONS.md (a) unit-first Irr order, (b) unitary gauge (so
# f* = f†), (c) left-associated path basis, (r) site object O = 1 ⊕ X.
# Cross-checks (CA-66): (m_1(L), m_τ(L)) = (F_{2L-1}, F_{2L}); dim H_L = F_{2L+1};
# dim A_L = m_1^2 + m_τ^2 = F_{4L-1}.

const _FIB_CHARGES = (:one, :tau)

_check_charge(charge::Symbol) =
    charge in _FIB_CHARGES || error("charge must be :one or :tau, got $charge")

# Admissible cumulative charges after fusing running charge `prev` with one site
# letter. Fibonacci fusion: a ⊗ 1 = a; 1 ⊗ τ = τ; τ ⊗ τ = 1 ⊕ τ.
function _allowed_next(prev::Symbol, letter::Symbol)
    letter === :one && return (prev,)
    letter === :tau || error("site letter must be :one or :tau, got $letter")
    prev === :one && return (:tau,)
    prev === :tau && return (:one, :tau)
    error("cumulative charge must be :one or :tau, got $prev")
end

# Letters of the length-L word whose occupied (τ) sites are `S`.
function _fib_letters(S, L::Integer)
    letters = fill(:one, L)
    for s in S
        1 <= s <= L || error("occupied site $s outside 1:$L")
        letters[s] = :tau
    end
    return letters
end

_path_final(path) = isempty(path) ? :one : path[end]

# True iff `xs` is an admissible left-associated cumulative-charge path for
# `letters` (x_0 = :one implicit).
function _path_admissible(letters, xs)
    length(xs) == length(letters) || return false
    prev = :one
    for (letter, x) in zip(letters, xs)
        x in _allowed_next(prev, letter) || return false
        prev = x
    end
    return true
end

# Fail-loud path-admissibility guard used by the refinement constructor.
function _require_admissible_path(letters, xs)
    _path_admissible(letters, xs) ||
        error("inadmissible fusion path $xs for letters $letters")
    return xs
end

# All admissible cumulative-charge paths for `letters` ending at `charge`.
function _admissible_paths(letters, charge::Symbol)
    paths = [Symbol[]]
    for letter in letters
        newpaths = Vector{Symbol}[]
        for path in paths
            for nxt in _allowed_next(_path_final(path), letter)
                push!(newpaths, vcat(path, nxt))
            end
        end
        paths = newpaths
    end
    return [p for p in paths if _path_final(p) === charge]
end

"""
    fibonacci_word_sector_basis(L, charge) -> Vector{Tuple{Vector{Int},Vector{Symbol}}}

Ordered basis of `Hom(X_c, O^{⊗L})` for Fibonacci `O = 1 ⊕ τ`: pairs `(S, xs)`
with `S` the sorted occupied set and `xs` an admissible cumulative-charge path
ending at `charge` (`:one` or `:tau`). Enumeration is deterministic: subsets by
ascending bitmask, then paths in generation order.
"""
function fibonacci_word_sector_basis(L::Integer, charge::Symbol)
    L >= 0 || error("L must be nonnegative, got $L")
    _check_charge(charge)
    basis = Tuple{Vector{Int},Vector{Symbol}}[]
    for mask in 0:(2^L - 1)
        S = [s for s in 1:L if (mask >> (s - 1)) & 1 == 1]
        letters = _fib_letters(S, L)
        for xs in _admissible_paths(letters, charge)
            push!(basis, (S, xs))
        end
    end
    return basis
end

"""
    fibonacci_word_sector_dimension(L, charge) -> Int

Dimension of `Hom(X_c, O^{⊗L})` by direct enumeration over occupied subsets and
admissible fusion paths. This enumeration is the source of truth for the
multiplicity closed forms.
"""
fibonacci_word_sector_dimension(L::Integer, charge::Symbol) =
    length(fibonacci_word_sector_basis(L, charge))

"""
    fibonacci_word_multiplicity_recurrence(L) -> Tuple{Int,Int}

`(m_1(L), m_τ(L))` via the fusion incidence matrix `[[1,1],[1,2]]` iterated from
`(1, 0)` (the Bratteli step for `O = 1 ⊕ τ`: `m_d(L+1) = Σ_c m_c(L) N^d_{c,O}`;
CA-66 T66.2).
"""
function fibonacci_word_multiplicity_recurrence(L::Integer)
    L >= 0 || error("L must be nonnegative, got $L")
    m1, mτ = 1, 0
    for _ in 1:L
        m1, mτ = m1 + mτ, m1 + 2mτ
    end
    return (m1, mτ)
end

"""
    fibonacci_dense_corner_pairs(n) -> Vector{Tuple{Int,Int}}

Dense-corner (`O = τ`) path counts via the incidence matrix `[[0,1],[1,1]]`
iterated from `(1, 0)`; entry `n+1` is the count-pair after fusing `n` copies of
`τ`. Equals the CA-09 Fibonacci path-count sequence, cross-checking
`fibonacci_fusion_path_counts`.
"""
function fibonacci_dense_corner_pairs(n::Integer)
    n >= 0 || error("n must be nonnegative, got $n")
    pairs = Vector{Tuple{Int,Int}}(undef, n + 1)
    a, b = 1, 0
    pairs[1] = (a, b)
    for k in 1:n
        a, b = b, a + b
        pairs[k + 1] = (a, b)
    end
    return pairs
end

"""
    vacuum_insertion_matrix(L, charge) -> Matrix{Int}

Matrix of the vacuum-insertion refinement `V_L : O^{⊗L} → O^{⊗2L}` on the
charge-`charge` sector, in the `(S, xs)` basis. Old site `j` maps to fine site
`2j-1`; even fine sites are vacuum (`1`). A basis vector `(S, xs)` maps to
`(2S-1, xs doubled)`: the running charge is unchanged across an empty site, so
each coarse cumulative label appears twice on the fine chain.

Fail-loud: every image is verified admissible and located in the fine basis, and
the result is asserted to be `0/1` with exactly one `1` per column — hence an
exact integer isometry `V' V = I`.
"""
function vacuum_insertion_matrix(L::Integer, charge::Symbol)
    L >= 0 || error("L must be nonnegative, got $L")
    _check_charge(charge)
    coarse = fibonacci_word_sector_basis(L, charge)
    fine = fibonacci_word_sector_basis(2L, charge)
    index = Dict((Tuple(S), Tuple(xs)) => i for (i, (S, xs)) in enumerate(fine))
    V = zeros(Int, length(fine), length(coarse))
    for (col, (S, xs)) in enumerate(coarse)
        fine_S = [2s - 1 for s in S]
        fine_xs = Symbol[]
        for x in xs
            push!(fine_xs, x)
            push!(fine_xs, x)
        end
        _require_admissible_path(_fib_letters(fine_S, 2L), fine_xs)
        row = get(index, (Tuple(fine_S), Tuple(fine_xs)), nothing)
        row === nothing &&
            error("vacuum-insertion image ($fine_S, $fine_xs) not in fine basis")
        V[row, col] = 1
    end
    for col in axes(V, 2)
        sum(@view V[:, col]) == 1 ||
            error("column $col of V_L is not a single 0/1 image")
    end
    return V
end

"""
    occupation_number_matrix(L, j, charge) -> Diagonal{Int}

Diagonal occupied/empty indicator for site `j` on the charge-`charge` sector
basis: entry `1` iff `j ∈ S`.
"""
function occupation_number_matrix(L::Integer, j::Integer, charge::Symbol)
    L >= 0 || error("L must be nonnegative, got $L")
    1 <= j <= L || error("site j=$j outside 1:$L")
    _check_charge(charge)
    basis = fibonacci_word_sector_basis(L, charge)
    return Diagonal([j in S ? 1 : 0 for (S, _) in basis])
end
