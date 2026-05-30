function _check_spatial_dimension(spatial_dim::Integer)
    spatial_dim in 1:3 || error("spatial_dim must be 1, 2, or 3, got $spatial_dim")
end

function _check_k_vector(k)
    length(k) in 1:3 || error("momentum vector dimension must be 1, 2, or 3, got $(length(k))")
end

"""
    kg_lattice_omega_squared(k; mass, spacing = 1)

Nearest-neighbour lattice Klein-Gordon dispersion
``m^2 + 2 ε^-2 sum_a (1 - cos(ε k_a))`` in spatial dimensions 1, 2, or 3.
"""
function kg_lattice_omega_squared(k; mass, spacing = 1)
    _check_k_vector(k)
    spacing > 0 || error("spacing must be positive, got $spacing")
    return mass^2 + 2 / spacing^2 * sum(1 - cos(spacing * ka) for ka in k)
end

"""
    kg_lattice_boost_time_symbol(k; spacing = 1)

Return ``1/2 ∂_a omega(k)^2`` for the nearest-neighbour lattice
Klein-Gordon dispersion.
"""
function kg_lattice_boost_time_symbol(k; spacing = 1)
    _check_k_vector(k)
    spacing > 0 || error("spacing must be positive, got $spacing")
    return [sin(spacing * ka) / spacing for ka in k]
end

"""
    continuum_kg_omega_squared(k; mass, speed = 1)

Continuum Klein-Gordon dispersion ``m^2 + c^2 |k|^2``.
"""
function continuum_kg_omega_squared(k; mass, speed = 1)
    _check_k_vector(k)
    speed > 0 || error("speed must be positive, got $speed")
    return mass^2 + speed^2 * sum(abs2, k)
end

"""
    continuum_kg_boost_time_symbol(k; speed = 1)

Return ``1/2 ∂_a omega(k)^2`` for ``omega(k)^2 = m^2 + c^2 |k|^2``.
"""
function continuum_kg_boost_time_symbol(k; speed = 1)
    _check_k_vector(k)
    speed > 0 || error("speed must be positive, got $speed")
    return [speed^2 * ka for ka in k]
end

"""
    kg_nearest_neighbor_coefficients(spatial_dim; mass, spacing = 1)

Return coefficient pairs ``(offset, coefficient)`` for the scalar quadratic
symbol of the nearest-neighbour lattice Klein-Gordon potential.
"""
function kg_nearest_neighbor_coefficients(spatial_dim::Integer; mass, spacing = 1)
    _check_spatial_dimension(spatial_dim)
    spacing > 0 || error("spacing must be positive, got $spacing")

    coeffs = Tuple{Vector{Int}, typeof(float(mass + spacing))}[]
    push!(coeffs, (zeros(Int, spatial_dim), float(mass)^2 + 2 * spatial_dim / spacing^2))
    for axis in 1:spatial_dim
        plus = zeros(Int, spatial_dim)
        minus = zeros(Int, spatial_dim)
        plus[axis] = 1
        minus[axis] = -1
        push!(coeffs, (plus, -1 / spacing^2))
        push!(coeffs, (minus, -1 / spacing^2))
    end
    return coeffs
end

"""
    scalar_quadratic_symbol(coefficients, k; spacing = 1)

Evaluate ``sum_r V_r exp(i ε k⋅r)`` for real-space scalar quadratic
coefficients.
"""
function scalar_quadratic_symbol(coefficients, k; spacing = 1)
    _check_k_vector(k)
    spacing > 0 || error("spacing must be positive, got $spacing")
    total = 0.0 + 0.0im
    for (offset, coeff) in coefficients
        length(offset) == length(k) || error("offset $offset has dimension $(length(offset)); expected $(length(k))")
        total += coeff * cis(spacing * sum(offset[a] * k[a] for a in eachindex(k)))
    end
    abs(imag(total)) < 1e-10 || error("quadratic symbol has non-negligible imaginary part $(imag(total))")
    return real(total)
end

"""
    boost_time_symbol_from_coefficients(coefficients, k; spacing = 1)

Evaluate the vector ``1/2 ∇_k omega(k)^2`` from real-space scalar quadratic
coefficients.
"""
function boost_time_symbol_from_coefficients(coefficients, k; spacing = 1)
    _check_k_vector(k)
    spacing > 0 || error("spacing must be positive, got $spacing")
    out = zeros(Float64, length(k))
    for axis in eachindex(k)
        total = 0.0 + 0.0im
        for (offset, coeff) in coefficients
            length(offset) == length(k) || error("offset $offset has dimension $(length(offset)); expected $(length(k))")
            phase = spacing * sum(offset[a] * k[a] for a in eachindex(k))
            total += 0.5im * spacing * offset[axis] * coeff * cis(phase)
        end
        abs(imag(total)) < 1e-10 || error("boost-time symbol has non-negligible imaginary part $(imag(total))")
        out[axis] = real(total)
    end
    return out
end
