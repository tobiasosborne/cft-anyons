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

const PoincareBasisKey = Tuple{Symbol, Int, Int}

_p_key(mu::Integer)::PoincareBasisKey = (:P, Int(mu), 0)

function _m_key(mu::Integer, nu::Integer)
    mu == nu && return nothing, 0
    if mu < nu
        return (:M, Int(mu), Int(nu)), 1
    else
        return (:M, Int(nu), Int(mu)), -1
    end
end

function _metric_entry(mu::Integer, nu::Integer)
    mu == nu || return 0
    return mu == 0 ? 1 : -1
end

function _add_coeff!(out, key, coeff)
    (key === nothing || coeff == 0) && return out
    out[key] = get(out, key, 0) + coeff
    out[key] == 0 && delete!(out, key)
    return out
end

"""
    poincare_vector_field_bracket(a, b, spatial_dim) -> Dict

Return the Poincare vector-field Lie bracket in ``d + 1`` dimensions.

Basis keys are ``(:P, μ, 0)`` for translations and ``(:M, μ, ν)`` for
Lorentz generators, with zero-based spacetime indices and ``μ < ν`` for
canonical ``M`` keys. The convention is
``M_{μν} = x_μ ∂_ν - x_ν ∂_μ`` for metric ``diag(1,-1,...,-1)``.
"""
function poincare_vector_field_bracket(a::PoincareBasisKey, b::PoincareBasisKey, spatial_dim::Integer)
    spatial_dim < 1 && error("spatial_dim must be positive, got $spatial_dim")
    max_index = spatial_dim
    for key in (a, b)
        if key[1] == :M
            key[2] < key[3] || error("Lorentz basis key must have μ < ν, got $key")
        elseif key[1] != :P
            error("unknown Poincare basis kind $(key[1])")
        end
        for idx in key[2:3]
            key[1] == :P && idx == 0 && continue
            0 <= idx <= max_index || error("index $idx outside 0:$max_index")
        end
    end

    kind_a, mu, nu = a
    kind_b, rho, sigma = b
    out = Dict{PoincareBasisKey, Int}()

    if kind_a == :P && kind_b == :P
        return out
    elseif kind_a == :M && kind_b == :P
        _add_coeff!(out, _p_key(mu), _metric_entry(nu, rho))
        _add_coeff!(out, _p_key(nu), -_metric_entry(mu, rho))
    elseif kind_a == :P && kind_b == :M
        neg = poincare_vector_field_bracket(b, a, spatial_dim)
        for (key, coeff) in neg
            _add_coeff!(out, key, -coeff)
        end
    elseif kind_a == :M && kind_b == :M
        key, sign = _m_key(mu, sigma)
        _add_coeff!(out, key, _metric_entry(nu, rho) * sign)
        key, sign = _m_key(nu, sigma)
        _add_coeff!(out, key, -_metric_entry(mu, rho) * sign)
        key, sign = _m_key(nu, rho)
        _add_coeff!(out, key, _metric_entry(mu, sigma) * sign)
        key, sign = _m_key(mu, rho)
        _add_coeff!(out, key, -_metric_entry(nu, sigma) * sign)
    else
        error("unknown Poincare basis kinds $(kind_a), $(kind_b)")
    end

    return out
end

include("GalileiAlgebras.jl")
include("GaussianBosons.jl")
include("GaussianBosonNumerics.jl")

"""
    nearest_neighbor_boost_current_coefficients(positions) -> Vector

Return coefficients multiplying ``i[h_j,h_{j+1}]`` in the local derivation of
``i[sum_j h_j, sum_j x_j h_j]`` for nearest-neighbour commuting densities.
"""
function nearest_neighbor_boost_current_coefficients(positions)
    length(positions) >= 2 || error("need at least two lattice positions")
    return [positions[j + 1] - positions[j] for j in 1:(length(positions) - 1)]
end

end # module CftAnyons
