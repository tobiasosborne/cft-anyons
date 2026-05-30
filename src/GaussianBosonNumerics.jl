"""
    anisotropic_kg_nearest_neighbor_coefficients(speeds; mass, spacing = 1)

Return nearest-neighbour scalar coefficients with continuum symbol
``m^2 + sum_a c_a^2 k_a^2`` to quadratic order at ``k=0``.
"""
function anisotropic_kg_nearest_neighbor_coefficients(speeds; mass, spacing = 1)
    _check_k_vector(speeds)
    spacing > 0 || error("spacing must be positive, got $spacing")
    all(c -> c > 0, speeds) || error("all speeds must be positive, got $speeds")

    spatial_dim = length(speeds)
    coeffs = Tuple{Vector{Int}, Float64}[]
    push!(coeffs, (zeros(Int, spatial_dim), float(mass)^2 + 2 * sum(abs2, speeds) / spacing^2))
    for axis in 1:spatial_dim
        plus = zeros(Int, spatial_dim)
        minus = zeros(Int, spatial_dim)
        plus[axis] = 1
        minus[axis] = -1
        coeff = -float(speeds[axis])^2 / spacing^2
        push!(coeffs, (plus, coeff))
        push!(coeffs, (minus, coeff))
    end
    return coeffs
end

"""
    doubler_quadratic_coefficients(spatial_dim; mass, spacing = 1)

Return a finite-range example with symbol
``m^2 + sum_a sin(epsilon k_a)^2 / epsilon^2``.  It has several Brillouin-zone minima on
even periodic grids, so it is a counterexample to the single-minimum condition.
"""
function doubler_quadratic_coefficients(spatial_dim::Integer; mass, spacing = 1)
    _check_spatial_dimension(spatial_dim)
    spacing > 0 || error("spacing must be positive, got $spacing")

    coeffs = Tuple{Vector{Int}, Float64}[]
    push!(coeffs, (zeros(Int, spatial_dim), float(mass)^2 + spatial_dim / (2 * spacing^2)))
    for axis in 1:spatial_dim
        plus = zeros(Int, spatial_dim)
        minus = zeros(Int, spatial_dim)
        plus[axis] = 2
        minus[axis] = -2
        push!(coeffs, (plus, -1 / (4 * spacing^2)))
        push!(coeffs, (minus, -1 / (4 * spacing^2)))
    end
    return coeffs
end

"""
    low_energy_hessian_from_coefficients(coefficients, spatial_dim; spacing = 1)

Return the Hessian of ``omega(k)^2`` at ``k=0`` for real-space scalar
coefficients.
"""
function low_energy_hessian_from_coefficients(coefficients, spatial_dim::Integer; spacing = 1)
    _check_spatial_dimension(spatial_dim)
    spacing > 0 || error("spacing must be positive, got $spacing")
    hessian = zeros(Float64, spatial_dim, spatial_dim)
    for (offset, coeff) in coefficients
        length(offset) == spatial_dim || error("offset $offset has dimension $(length(offset)); expected $spatial_dim")
        isreal(coeff) || error("coefficient for offset $offset is not real: $coeff")
        for a in 1:spatial_dim, b in 1:spatial_dim
            hessian[a, b] -= spacing^2 * float(real(coeff)) * offset[a] * offset[b]
        end
    end
    return hessian
end

"""
    lorentz_hessian_residual(coefficients, spatial_dim; spacing = 1, speed = 1)

Return ``1/2 Hessian(omega^2)(0) - c^2 I``.  Vanishing is the quadratic
low-energy Lorentz-speed condition for the scalar tier.
"""
function lorentz_hessian_residual(coefficients, spatial_dim::Integer; spacing = 1, speed = 1)
    speed > 0 || error("speed must be positive, got $speed")
    hessian = low_energy_hessian_from_coefficients(coefficients, spatial_dim; spacing)
    return 0.5 * hessian - float(speed)^2 * Matrix{Float64}(I, spatial_dim, spatial_dim)
end

function _check_periodic_sizes(sizes)
    length(sizes) in 1:3 || error("periodic lattice dimension must be 1, 2, or 3, got $(length(sizes))")
    all(L -> L isa Integer && L > 0, sizes) || error("periodic sizes must be positive integers, got $sizes")
end

"""
    periodic_momentum_grid(sizes; spacing = 1)

Return Brillouin-zone momenta ``2 pi n_a / (epsilon L_a)`` for a periodic hypercubic
grid.
"""
function periodic_momentum_grid(sizes; spacing = 1)
    _check_periodic_sizes(sizes)
    spacing > 0 || error("spacing must be positive, got $spacing")
    dims = Tuple(Int.(sizes))
    return [[2 * pi * (Tuple(site)[axis] - 1) / (spacing * dims[axis]) for axis in eachindex(dims)]
            for site in vec(collect(CartesianIndices(dims)))]
end

"""
    periodic_symbol_values(coefficients, sizes; spacing = 1)

Evaluate the scalar quadratic symbol on the finite periodic momentum grid.
"""
function periodic_symbol_values(coefficients, sizes; spacing = 1)
    return [scalar_quadratic_symbol(coefficients, k; spacing) for k in periodic_momentum_grid(sizes; spacing)]
end

"""
    periodic_stiffness_matrix(coefficients, sizes)

Build the finite periodic stiffness matrix whose Fourier eigenvalues are the
periodic symbol values.
"""
function periodic_stiffness_matrix(coefficients, sizes)
    _check_periodic_sizes(sizes)
    dims = Tuple(Int.(sizes))
    spatial_dim = length(dims)
    sites = CartesianIndices(dims)
    linear = LinearIndices(dims)
    stiffness = zeros(Float64, length(sites), length(sites))
    for site in sites
        source = linear[site]
        site_tuple = Tuple(site)
        for (offset, coeff) in coefficients
            length(offset) == spatial_dim || error("offset $offset has dimension $(length(offset)); expected $spatial_dim")
            isreal(coeff) || error("coefficient for offset $offset is not real: $coeff")
            target_tuple = ntuple(a -> mod1(site_tuple[a] + offset[a], dims[a]), spatial_dim)
            stiffness[source, linear[CartesianIndex(target_tuple)]] += float(real(coeff))
        end
    end
    return stiffness
end

"""
    count_periodic_symbol_minima(coefficients, sizes; spacing = 1, atol = 1e-10)

Count periodic-grid momenta whose symbol value is within ``atol`` of the
minimum.
"""
function count_periodic_symbol_minima(coefficients, sizes; spacing = 1, atol = 1e-10)
    values = periodic_symbol_values(coefficients, sizes; spacing)
    minimum_value = minimum(values)
    return count(value -> abs(value - minimum_value) <= atol, values)
end
