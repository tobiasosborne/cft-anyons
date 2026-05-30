module CftAnyons

using LinearAlgebra

# Seed module for the cft-anyons computational backend. Per AGENTS.md Rule 7,
# the accompanying tests assert real mathematical invariants, not "it loaded".
# This file is intentionally tiny; extend it as the pipeline (CA-01) grows.

"""
    golden_ratio() -> Float64

The golden ratio ``φ = (1 + √5)/2``.

It is the quantum dimension ``d_τ`` of the non-trivial simple object ``τ`` in the
Fibonacci fusion category, fixed by the fusion rule ``τ ⊗ τ ≅ 1 ⊕ τ`` — which
forces the quantum-dimension relation ``d_τ² = 1 + d_τ``. The seed test suite
checks exactly this invariant, establishing the project's "tests assert a known
value / identity" convention.
"""
golden_ratio() = (1 + sqrt(5)) / 2

"""
    finite_group_average_projector(unitaries) -> Matrix

Average a finite list of same-size unitary matrices.

For a finite unitary representation ``U : G -> U(H)``, the average
``|G|^-1 * sum_g U(g)`` is the orthogonal projection onto the invariant sector.
The function checks only the finite matrix preconditions; the caller supplies
the group law evidence by passing a representation image.
"""
function finite_group_average_projector(unitaries)
    isempty(unitaries) && error("cannot average an empty finite group representation")

    first_size = size(first(unitaries))
    length(first_size) == 2 || error("expected matrices, got first object with size $first_size")
    first_size[1] == first_size[2] || error("expected square matrices, got first size $first_size")

    T = promote_type(map(eltype, unitaries)...)
    P = zeros(T, first_size)
    for (idx, U) in pairs(unitaries)
        size(U) == first_size || error("matrix $idx has size $(size(U)); expected $first_size")
        U' * U ≈ I || error("matrix $idx is not unitary within default isapprox tolerance")
        P .+= U
    end
    return P / length(unitaries)
end

"""
    is_orthogonal_projection(P; atol = 1e-12) -> Bool

Return whether ``P`` is self-adjoint and idempotent to numerical tolerance.
"""
function is_orthogonal_projection(P; atol = 1e-12)
    size(P, 1) == size(P, 2) || return false
    return isapprox(P, P'; atol) && isapprox(P * P, P; atol)
end

"""
    fibonacci_fusion_path_counts(max_n) -> Vector{Tuple{Int, Int}}

Count left-associated admissible fusion paths for ``n`` Fibonacci ``τ`` anyons.

The returned entry at index ``n + 1`` is ``(one_count, tau_count)``, the number
of paths with total charge ``1`` and ``τ`` after fusing ``n`` copies of ``τ``.
The recurrence is the fusion-rule transition
``1 ⊗ τ = τ`` and ``τ ⊗ τ = 1 ⊕ τ``.
"""
function fibonacci_fusion_path_counts(max_n::Integer)
    max_n < 0 && error("max_n must be nonnegative, got $max_n")

    counts = Vector{Tuple{Int, Int}}(undef, max_n + 1)
    one_count = 1
    tau_count = 0
    counts[1] = (one_count, tau_count)

    for n in 1:max_n
        one_count, tau_count = tau_count, one_count + tau_count
        counts[n + 1] = (one_count, tau_count)
    end

    return counts
end

end # module CftAnyons
