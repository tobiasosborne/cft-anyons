# RefinementPlacements.jl
#
# CA-71 placement layer over the Fibonacci word algebra (AnyonicWordAlgebra.jl).
# A *placement* is an order-preserving injection phi: {1..k} -> {1..l} of coarse
# sites into fine slots. It lifts the (S, path) basis of Hom(X_c, O^{⊗k}) into
# Hom(X_c, O^{⊗l}) by (i) relocating the occupied set S ↦ phi(S) and (ii)
# repeating the running cumulative charge across the vacuum slots. Placements form
# a category (objects = chain lengths, arrows = placements); the refinement is a
# functor into integer isometries. CA-68 vacuum insertion is the special case
# phi = (j ↦ 2j-1). Concrete, finite, fail-loud — no new deps.
#
# Conventions: CONVENTIONS.md (b) unitary gauge — unit-label F-moves are trivial,
# so repeating the running charge across vacuum slots is EXACT, not a truncation.
# Cross-checks (CA-71): V'V = I per charge block; V_ψ V_φ = V_{ψ∘φ} (functor);
# V_φ n_i = n_{φ(i)} V_φ (occupation covariance).

"""
    Placement(k, l, slots)

Order-preserving injection `phi: {1..k} -> {1..l}`, stored as the strictly
increasing `slots::Vector{Int}` (length `k`, entries in `1..l`). Here `k` is the
coarse chain length and `l` the fine chain length; `k = length(slots)`. Fail-loud
on a slot count that disagrees with `k`, non-increasing slots, or an out-of-range
slot.
"""
struct Placement
    k::Int
    l::Int
    slots::Vector{Int}
    function Placement(k::Integer, l::Integer, slots::AbstractVector{<:Integer})
        k >= 0 || error("placement domain size k=$k must be nonnegative")
        l >= 0 || error("placement codomain size l=$l must be nonnegative")
        length(slots) == k ||
            error("placement declares k=$k but has $(length(slots)) slots $slots")
        for i in eachindex(slots)
            1 <= slots[i] <= l ||
                error("placement slot $(slots[i]) (position $i) outside 1:$l")
            if i > 1 && slots[i] <= slots[i - 1]
                error("placement slots must be strictly increasing, got $slots")
            end
        end
        return new(Int(k), Int(l), collect(Int, slots))
    end
end

# Value equality (the default struct `==` compares the `slots` vector by identity).
Base.:(==)(a::Placement, b::Placement) =
    a.k == b.k && a.l == b.l && a.slots == b.slots
Base.hash(p::Placement, h::UInt) = hash(p.slots, hash(p.l, hash(p.k, h)))

"""
    compose(psi, phi) -> Placement

Categorical composite `psi ∘ phi` of placements `phi: [k]->[l]` and
`psi: [l]->[m]`. Errors unless `psi.k == phi.l`. The composite slots relabel via
`psi.slots[phi.slots]`, so `(psi ∘ phi)(i) = psi(phi(i))`.
"""
function compose(psi::Placement, phi::Placement)
    psi.k == phi.l ||
        error("compose: inner codomain l=$(phi.l) != outer domain k=$(psi.k)")
    return Placement(phi.k, psi.l, psi.slots[phi.slots])
end

# Fine cumulative-charge path induced by `phi` from a coarse path `xs` (length k).
# Coarse letter i lands at fine slot phi.slots[i] carrying its cumulative charge
# xs[i]; every vacuum slot repeats the running charge (unchanged across a unit
# letter — CONVENTIONS (b)). This duplication is what makes the lift EXACT.
function _placement_fine_path(phi::Placement, xs)
    length(xs) == phi.k ||
        error("coarse path length $(length(xs)) != domain size k=$(phi.k)")
    fine_xs = Vector{Symbol}(undef, phi.l)
    prev = :one
    nxt = 1
    for p in 1:phi.l
        if nxt <= phi.k && p == phi.slots[nxt]
            prev = xs[nxt]
            nxt += 1
        end
        fine_xs[p] = prev
    end
    nxt == phi.k + 1 ||
        error("placement $(phi.slots) did not consume all coarse letters")
    return fine_xs
end

"""
    placement_refinement_matrix(phi, charge) -> Matrix{Int}

Matrix of the refinement `V_phi` induced by `phi: [k]->[l]` on the charge-`charge`
sector, in the `(S, xs)` basis. A coarse basis vector `(S, xs)` maps to
`(phi(S), fine path)`: the occupied set relocates by `S ↦ phi.slots[S]` and the
fine path is `_placement_fine_path(phi, xs)`. Fail-loud: each fine image is
verified admissible (the module's `_require_admissible_path` guard) and located in
the fine basis, and the columns are asserted distinct 0/1 standard basis vectors —
hence an exact integer isometry `V' V = I`. Reduces to
`vacuum_insertion_matrix(L, charge)` at `phi = Placement(L, 2L, [2j-1 ...])`.
"""
function placement_refinement_matrix(phi::Placement, charge::Symbol)
    _check_charge(charge)
    coarse = fibonacci_word_sector_basis(phi.k, charge)
    fine = fibonacci_word_sector_basis(phi.l, charge)
    index = Dict((Tuple(S), Tuple(xs)) => i for (i, (S, xs)) in enumerate(fine))
    V = zeros(Int, length(fine), length(coarse))
    rows = Int[]
    for (col, (S, xs)) in enumerate(coarse)
        fine_S = [phi.slots[s] for s in S]
        fine_xs = _placement_fine_path(phi, xs)
        _require_admissible_path(_fib_letters(fine_S, phi.l), fine_xs)
        row = get(index, (Tuple(fine_S), Tuple(fine_xs)), nothing)
        row === nothing &&
            error("placement image ($fine_S, $fine_xs) not in fine basis of length $(phi.l)")
        V[row, col] = 1
        push!(rows, row)
    end
    length(unique(rows)) == length(rows) ||
        error("placement columns are not distinct standard basis vectors: rows $rows")
    for col in axes(V, 2)
        sum(@view V[:, col]) == 1 ||
            error("column $col of placement matrix is not a single 0/1 image")
    end
    return V
end

"""
    uniform_cell_placement(phi_cell, M) -> Placement

Whole-chain placement `[M*k] -> [M*l]` tiling `phi_cell: [k]->[l]` across `M`
cells: cell `m` occupies coarse sites `(m-1)*k + 1 .. m*k` and fine slots
`(m-1)*l + 1 .. m*l`, placed by `phi_cell`. `M = 1` returns `phi_cell` unchanged.
"""
function uniform_cell_placement(phi_cell::Placement, M::Integer)
    M >= 1 || error("cell count M=$M must be positive")
    slots = Int[]
    for m in 1:M, s in phi_cell.slots
        push!(slots, (m - 1) * phi_cell.l + s)
    end
    return Placement(M * phi_cell.k, M * phi_cell.l, slots)
end
