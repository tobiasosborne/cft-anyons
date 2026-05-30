function _check_spatial_dimension(spatial_dim::Integer)
    spatial_dim in 1:3 || error("spatial_dim must be 1, 2, or 3, got $spatial_dim")
end

function _check_k_vector(k)
    length(k) in 1:3 || error("momentum vector dimension must be 1, 2, or 3, got $(length(k))")
end

const GAUSSIAN_SYMBOL_IMAG_ATOL = 1e-10
const GAUSSIAN_SYMBOL_IMAG_RTOL = 1e-10
const GAUSSIAN_SYMBOL_VALUE_ATOL = 1e-10
const GAUSSIAN_SYMBOL_VALUE_RTOL = 1e-10
const GAUSSIAN_EIGENVALUE_ATOL = 1e-10
const GAUSSIAN_EIGENVALUE_RTOL = 1e-10
const GAUSSIAN_MINIMUM_COUNT_ATOL = 1e-10
const GAUSSIAN_MINIMUM_COUNT_RTOL = 1e-10
const GAUSSIAN_SMALL_SPACING_RESIDUAL_ATOL = 5e-4
const GAUSSIAN_SMALL_SPACING_RESIDUAL_RTOL = 1e-10

"""
    validate_scalar_coefficients(coefficients; spatial_dim = nothing) -> Int

Validate scalar Gaussian coefficient data against CONVENTIONS.md (j).

The checked structure is finite-entry data with integer offsets, a common
spatial dimension ``d in {1,2,3}``, real coefficients, and aggregate paired
equality ``V_r = V_-r`` after repeated offsets are summed.
"""
function validate_scalar_coefficients(coefficients; spatial_dim = nothing)
    expected_dim = nothing
    if spatial_dim !== nothing
        spatial_dim isa Integer || error("spatial_dim must be an integer, got $spatial_dim")
        _check_spatial_dimension(spatial_dim)
        expected_dim = Int(spatial_dim)
    end

    saw_entry = false
    aggregates = Dict{Tuple{Vararg{Int}}, Any}()
    for (entry_index, entry) in pairs(coefficients)
        saw_entry = true
        length(entry) == 2 || error("coefficient entry $entry_index must be an (offset, coefficient) pair, got $entry")
        offset, coeff = entry
        offset_dim = length(offset)
        offset_dim in 1:3 || error("offset $offset has dimension $offset_dim; expected dimension 1, 2, or 3")
        if expected_dim === nothing
            expected_dim = offset_dim
        else
            offset_dim == expected_dim || error("offset $offset has dimension $offset_dim; expected $expected_dim")
        end
        all(component -> component isa Integer, offset) ||
            error("offset $offset has non-integer entries; scalar Gaussian offsets must be integer lattice displacements")
        coeff isa Real || error("coefficient for offset $offset must be real, got $coeff")

        key = ntuple(axis -> Int(offset[axis]), offset_dim)
        aggregates[key] = get(aggregates, key, zero(coeff)) + coeff
    end

    saw_entry || error("scalar Gaussian coefficient data must be nonempty")
    for (offset, coeff) in aggregates
        partner = ntuple(axis -> -offset[axis], length(offset))
        haskey(aggregates, partner) ||
            error("offset $(collect(offset)) is missing paired offset $(collect(partner))")
        partner_coeff = aggregates[partner]
        coeff == partner_coeff ||
            error("paired aggregate coefficients disagree: V_$(collect(offset)) = $coeff, V_$(collect(partner)) = $partner_coeff")
    end
    return expected_dim
end

function _real_symbol_value(total, label; atol = GAUSSIAN_SYMBOL_IMAG_ATOL, rtol = GAUSSIAN_SYMBOL_IMAG_RTOL)
    real_total = real(total)
    isapprox(total, complex(real_total, zero(real_total)); atol, rtol) ||
        error("$label has non-negligible imaginary part $(imag(total))")
    return real_total
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
    scalar_quadratic_symbol(coefficients, k; spacing = 1,
        imag_atol = GAUSSIAN_SYMBOL_IMAG_ATOL,
        imag_rtol = GAUSSIAN_SYMBOL_IMAG_RTOL,
        validate_coefficients = true)

Evaluate ``sum_r V_r exp(i ε k⋅r)`` for real-space scalar quadratic
coefficients.
"""
function scalar_quadratic_symbol(coefficients, k; spacing = 1,
        imag_atol = GAUSSIAN_SYMBOL_IMAG_ATOL, imag_rtol = GAUSSIAN_SYMBOL_IMAG_RTOL,
        validate_coefficients = true)
    _check_k_vector(k)
    spacing > 0 || error("spacing must be positive, got $spacing")
    validate_coefficients && validate_scalar_coefficients(coefficients; spatial_dim = length(k))
    total = 0.0 + 0.0im
    for (offset, coeff) in coefficients
        length(offset) == length(k) || error("offset $offset has dimension $(length(offset)); expected $(length(k))")
        total += coeff * cis(spacing * sum(offset[a] * k[a] for a in eachindex(k)))
    end
    return _real_symbol_value(total, "quadratic symbol"; atol = imag_atol, rtol = imag_rtol)
end

"""
    boost_time_symbol_from_coefficients(coefficients, k; spacing = 1,
        imag_atol = GAUSSIAN_SYMBOL_IMAG_ATOL,
        imag_rtol = GAUSSIAN_SYMBOL_IMAG_RTOL,
        validate_coefficients = true)

Evaluate the vector ``1/2 ∇_k omega(k)^2`` from real-space scalar quadratic
coefficients.
"""
function boost_time_symbol_from_coefficients(coefficients, k; spacing = 1,
        imag_atol = GAUSSIAN_SYMBOL_IMAG_ATOL, imag_rtol = GAUSSIAN_SYMBOL_IMAG_RTOL,
        validate_coefficients = true)
    _check_k_vector(k)
    spacing > 0 || error("spacing must be positive, got $spacing")
    validate_coefficients && validate_scalar_coefficients(coefficients; spatial_dim = length(k))
    out = zeros(Float64, length(k))
    for axis in eachindex(k)
        total = 0.0 + 0.0im
        for (offset, coeff) in coefficients
            length(offset) == length(k) || error("offset $offset has dimension $(length(offset)); expected $(length(k))")
            phase = spacing * sum(offset[a] * k[a] for a in eachindex(k))
            total += 0.5im * spacing * offset[axis] * coeff * cis(phase)
        end
        out[axis] = _real_symbol_value(total, "boost-time symbol"; atol = imag_atol, rtol = imag_rtol)
    end
    return out
end
