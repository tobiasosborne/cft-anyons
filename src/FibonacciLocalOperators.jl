# FibonacciLocalOperators.jl
#
# CA-73 (categorical residual set), FILE 1: two-site local operators on the
# (S, path) cumulative-charge basis of Hom(X_c, O^{⊗L}) with O = 1 ⊕ τ
# (AnyonicWordAlgebra.jl). A two-site operator on sites (j, j+1) is given as a
# pair of blocks in the FUSED two-site basis (below); `local_two_site_matrix`
# embeds it into A_L = End_C(O^{⊗L}) restricted to a charge sector, and the
# Tier-1 dilute generators (occupancies, hop a+a^t, raw-cup pair b+b^t, dense
# e_j = b^t b) are built as such blocks. Concrete, finite, fail-loud.
#
# Two-site fused basis of Hom(X_c, O⊗O) (FIXED ordering, mirrored in the tests):
#   c = :one (dim 2):  1 => ∅∅,  2 => (ττ→1)
#   c = :tau (dim 3):  1 => τ∅,  2 => ∅τ,  3 => (ττ→τ)
# The block label c is the FUSED CHANNEL y of the pair (both letters fused
# first); every Tier-1 generator preserves y, hence the "pair of blocks".
#
# F-CONVENTION. Embedding a fused-basis operator into the left-associated
# (S, path) basis is a change of basis on the intermediate charge x_j only.
# For the tree move ((x_{j-1}·O_j)·O_{j+1} → x_{j+1}) ↔ (x_{j-1}·(O_j·O_{j+1}))
# every F with a unit external label is the identity (CONVENTIONS (b)); the ONLY
# nontrivial move is both letters τ with x_{j-1}=x_{j+1}=τ, where x_j ∈ {1,τ}
# and the pair channel y ∈ {1,τ} are related by the Fibonacci F-matrix
#   F^{τττ}_τ = [[φ⁻¹, φ^{-1/2}], [φ^{-1/2}, -φ⁻¹]]  (basis {:one,:tau}),
# a real symmetric orthogonal involution (F = Fᵀ = F⁻¹).
# Source: references/text/TrebstShortIntroductionFibonacciAnyons.txt:320-323 (eq. 2.4)
#         "F^{τττ}_τ = [[ϕ⁻¹, ϕ^{-1/2}], [ϕ^{-1/2}, -ϕ⁻¹]]"; :310 trivial-label F=1.
# Also CONVENTIONS.md (b):62-84. Cup normalization √φ per CONVENTIONS (r):646-648
# (raw cup v†v = φ·id ⇒ (b^t b)² = φ (b^t b)).

# --- Fibonacci F-matrix in central-edge basis {:one, :tau}. ---
_fib_charge_index(c::Symbol) = c === :one ? 1 : (c === :tau ? 2 :
    error("charge must be :one or :tau, got $c"))

"""
    fibonacci_f_matrix() -> Matrix{Float64}

The unitary-gauge Fibonacci F-matrix `F^{τττ}_τ` in central-edge basis
`{:one, :tau}` (Trebst eq. 2.4; CONVENTIONS (b)). Real symmetric orthogonal:
`F = Fᵀ = F⁻¹`.
"""
function fibonacci_f_matrix()
    φ = golden_ratio()
    return [1/φ 1/sqrt(φ); 1/sqrt(φ) -1/φ]
end

_fib_F(a::Symbol, b::Symbol) =
    fibonacci_f_matrix()[_fib_charge_index(a), _fib_charge_index(b)]

# Letters (l_j, l_{j+1}) of a fused internal state (y-block c, internal index s).
function _two_site_internal_letters(c::Symbol, s::Integer)
    if c === :one
        s == 1 && return (:one, :one)      # ∅∅
        s == 2 && return (:tau, :tau)      # ττ→1
        error("fused :one block index must be 1 or 2, got $s")
    elseif c === :tau
        s == 1 && return (:tau, :one)      # τ∅
        s == 2 && return (:one, :tau)      # ∅τ
        s == 3 && return (:tau, :tau)      # ττ→τ
        error("fused :tau block index must be 1..3, got $s")
    end
    error("fused block label must be :one or :tau, got $c")
end

# FORWARD map: express a chain state (letters l_j,l_{j+1}; context x_{j-1},x_{j+1};
# intermediate x_j) in the fused basis. Returns [(y, s, amp)] with amp = ⟨fused|chain⟩.
function _fused_forward(lj::Symbol, ljp1::Symbol, xjm1::Symbol, xj::Symbol, xjp1::Symbol)
    if lj === :one && ljp1 === :one
        return [(:one, 1, 1.0)]
    elseif lj === :tau && ljp1 === :one
        return [(:tau, 1, 1.0)]
    elseif lj === :one && ljp1 === :tau
        return [(:tau, 2, 1.0)]
    else  # ττ: y ∈ {1, τ}
        if xjm1 === :tau && xjp1 === :tau
            return [(:one, 2, _fib_F(xj, :one)), (:tau, 3, _fib_F(xj, :tau))]
        else
            forced_y = xjm1 === :one ? xjp1 : :tau
            return forced_y === :one ? [(:one, 2, 1.0)] : [(:tau, 3, 1.0)]
        end
    end
end

# BACKWARD map (inverse of forward; F is its own inverse): express a fused state
# (y=c, internal s; context x_{j-1}, x_{j+1}) in chain intermediates. Returns
# [(x_j, amp)]; the new letters are `_two_site_internal_letters(c, s)`.
function _fused_backward(c::Symbol, s::Integer, xjm1::Symbol, xjp1::Symbol)
    lj, ljp1 = _two_site_internal_letters(c, s)
    if lj === :one && ljp1 === :one
        return [(xjm1, 1.0)]               # x_j = x_{j-1} = x_{j+1}
    elseif lj === :tau && ljp1 === :one
        return [(xjp1, 1.0)]               # x_j = x_{j+1}
    elseif lj === :one && ljp1 === :tau
        return [(xjm1, 1.0)]               # x_j = x_{j-1}
    else  # ττ
        if xjm1 === :tau && xjp1 === :tau
            return [(:one, _fib_F(c, :one)), (:tau, _fib_F(c, :tau))]
        else
            return [(:tau, 1.0)]           # x_j forced τ
        end
    end
end

_check_two_site_blocks(op) = begin
    haskey(op, :one) && haskey(op, :tau) ||
        error("two-site op needs :one and :tau blocks, got keys $(collect(keys(op)))")
    size(op[:one]) == (2, 2) || error("two-site :one block must be 2×2, got $(size(op[:one]))")
    size(op[:tau]) == (3, 3) || error("two-site :tau block must be 3×3, got $(size(op[:tau]))")
    op
end

"""
    local_two_site_matrix(op, j, L, charge) -> Matrix{Float64}

Embed the two-site operator `op` (a `Dict(:one => 2×2, :tau => 3×3)` in the
fused two-site basis) at sites `(j, j+1)` of the length-`L` chain, as a matrix on
`Hom(X_charge, O^{⊗L})` in the `(S, path)` basis. Mechanics: change basis from
the left-associated intermediate `x_j` to the pair channel `y` (only nontrivial
via the Fibonacci F-matrix on the ττ / x_{j-1}=x_{j+1}=τ subspace), apply the
`y`-block of `op`, change back. Fail-loud: images are located in the basis.
"""
function local_two_site_matrix(op, j::Integer, L::Integer, charge::Symbol)
    _check_charge(charge)
    _check_two_site_blocks(op)
    1 <= j <= L - 1 || error("bond j=$j outside 1:$(L-1) for L=$L")
    b = fibonacci_word_sector_basis(L, charge)
    index = Dict((Tuple(S), Tuple(xs)) => i for (i, (S, xs)) in enumerate(b))
    n = length(b)
    M = zeros(Float64, n, n)
    for (col, (S, xs)) in enumerate(b)
        lj = j in S ? :tau : :one
        ljp1 = (j + 1) in S ? :tau : :one
        xjm1 = j == 1 ? :one : xs[j - 1]
        xj = xs[j]
        xjp1 = xs[j + 1]
        for (y, s_in, a1) in _fused_forward(lj, ljp1, xjm1, xj, xjp1)
            blk = op[y]
            for s_out in axes(blk, 1)
                v = blk[s_out, s_in]
                v == 0 && continue
                for (xj_new, a2) in _fused_backward(y, s_out, xjm1, xjp1)
                    amp = a1 * v * a2
                    amp == 0 && continue
                    lo, lop1 = _two_site_internal_letters(y, s_out)
                    Snew = sort(vcat([s for s in S if s != j && s != j + 1],
                                     lo === :tau ? [j] : Int[],
                                     lop1 === :tau ? [j + 1] : Int[]))
                    xnew = copy(xs)
                    xnew[j] = xj_new
                    row = get(index, (Tuple(Snew), Tuple(xnew)), nothing)
                    row === nothing &&
                        error("two-site image (S=$Snew, x=$xnew) not in sector basis")
                    M[row, col] += amp
                end
            end
        end
    end
    return M
end

# --- Tier-1 dilute generators as fused two-site blocks. ---
# Zero blocks helper.
_zero_blocks() = Dict(:one => zeros(2, 2), :tau => zeros(3, 3))

"""
    hop_blocks() -> Dict

Hopping `a_j + a_j^t` (dilute τ mobility, source Dtl_pgl_ell.06.tex:638-640):
τ∅ ↔ ∅τ with amplitude 1 (unit coherence, no F). Hermitian; :one block zero.
"""
function hop_blocks()
    op = _zero_blocks()
    op[:tau] = [0.0 1.0 0.0; 1.0 0.0 0.0; 0.0 0.0 0.0]  # τ∅↔∅τ
    return op
end

"""
    pair_creation_blocks() / pair_annihilation_blocks() -> Dict

Raw-cup pair operators `b_j^t` (∅∅ → ττ→1) and `b_j` (ττ→1 → ∅∅), each carrying
the raw-cup weight `√φ` so that `(b^t b)² = φ (b^t b)` (CONVENTIONS (r):646-648,
v†v = φ·id). :tau block zero.
"""
function pair_creation_blocks()
    op = _zero_blocks()
    op[:one] = [0.0 0.0; sqrt(golden_ratio()) 0.0]     # ∅∅ → ττ→1
    return op
end
function pair_annihilation_blocks()
    op = _zero_blocks()
    op[:one] = [0.0 sqrt(golden_ratio()); 0.0 0.0]     # ττ→1 → ∅∅
    return op
end

"""
    pair_blocks() -> Dict

Pair creation/annihilation `b_j + b_j^t` (Hermitian; source :638-640).
"""
function pair_blocks()
    op = _zero_blocks()
    s = sqrt(golden_ratio())
    op[:one] = [0.0 s; s 0.0]
    return op
end

"""
    dense_e_blocks() -> Dict

Dense Temperley–Lieb generator `e_j = u_j = b_j^t b_j = φ·P_{ττ→1}` (source
Dtl_pgl_ell.06.tex:773 `u_i = b_i^t b_i`; loop weight β=φ). Diagonal `diag(0, φ)`
on the :one block ⇒ `e_j² = φ e_j`. On the fully-occupied corner `{e_j}` is the
ordinary TL_L(φ) (dense corner π_A dTL π_A ≅ TL_{|A|}, source :891-895).
"""
function dense_e_blocks()
    op = _zero_blocks()
    op[:one] = [0.0 0.0; 0.0 golden_ratio()]
    return op
end

"""
    occupancy_blocks(side) -> Dict

Diagonal occupancy of the `:left` (site j) or `:right` (site j+1) member of the
pair — the dilute single-site occupied projector `e_i = 1 - x_i`, source
Dtl_pgl_ell.06.tex:773 `e_i + x_i = id`. Embedded, `:left` at bond j reproduces
`occupation_number_matrix(L, j, ·)` (invariant B).
"""
function occupancy_blocks(side::Symbol)
    op = _zero_blocks()
    if side === :left
        op[:one] = [0.0 0.0; 0.0 1.0]                  # ∅∅→0, ττ→1
        op[:tau] = [1.0 0.0 0.0; 0.0 0.0 0.0; 0.0 0.0 1.0]  # τ∅,τττ occupied at left
    elseif side === :right
        op[:one] = [0.0 0.0; 0.0 1.0]
        op[:tau] = [0.0 0.0 0.0; 0.0 1.0 0.0; 0.0 0.0 1.0]  # ∅τ,τττ occupied at right
    else
        error("occupancy side must be :left or :right, got $side")
    end
    return op
end

"""
    occupation_parity_matrix(L, charge) -> Diagonal{Int}

The occupation-parity operator `(-1)^N`, `N = Σ_j n_j`: diagonal `(-1)^{|S|}` on
each `(S, path)` basis vector. Every parity-preserving dilute generator commutes
with it (invariant D; CA-69 parity ideal, source :775-776).
"""
function occupation_parity_matrix(L::Integer, charge::Symbol)
    _check_charge(charge)
    basis = fibonacci_word_sector_basis(L, charge)
    return Diagonal([iseven(length(S)) ? 1 : -1 for (S, _) in basis])
end

"""
    dense_corner_projector(L, charge) -> Diagonal{Int}

Projector onto the fully-occupied (all sites τ) corner `S = {1,…,L}`, where the
dense generators `{e_j}` close into TL_L(φ) (CA-69 dense corner).
"""
function dense_corner_projector(L::Integer, charge::Symbol)
    _check_charge(charge)
    basis = fibonacci_word_sector_basis(L, charge)
    return Diagonal([length(S) == L ? 1 : 0 for (S, _) in basis])
end
