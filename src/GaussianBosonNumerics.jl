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

function _centered_periodic_dual_label(label::Integer, size::Integer)
    return mod(label + size ÷ 2, size) - size ÷ 2
end

"""
    centered_periodic_momentum_grid(sizes; spacing = 1)

Return branch-aware periodic momenta in the same Cartesian order as
`periodic_momentum_grid`.  Each entry is a named tuple `(label, momentum)`,
where `label[a]` is the centered integer dual representative modulo `sizes[a]`
and `momentum[a] = 2 pi label[a] / (spacing * sizes[a])`.

For each size `L`, the branch is `-floor(L / 2), ..., ceil(L / 2) - 1`;
for even `L = 2r`, this is `-r, ..., 0, ..., r - 1`.
"""
function centered_periodic_momentum_grid(sizes; spacing = 1)
    _check_periodic_sizes(sizes)
    spacing > 0 || error("spacing must be positive, got $spacing")
    dims = Tuple(Int.(sizes))

    # Source: literature/md/2010.11121/2010.11121.md:274--293 uses the
    # centered dual-lattice labels {-r, ..., 0, ..., r-1} for side length 2r.
    return map(vec(collect(CartesianIndices(dims)))) do site
        site_tuple = Tuple(site)
        label = [_centered_periodic_dual_label(site_tuple[axis] - 1, dims[axis])
                 for axis in eachindex(dims)]
        momentum = [2 * pi * label[axis] / (spacing * dims[axis]) for axis in eachindex(dims)]
        return (label = label, momentum = momentum)
    end
end

"""
    periodic_symbol_values(coefficients, sizes; spacing = 1)

Evaluate the scalar quadratic symbol on the finite periodic momentum grid.
"""
function periodic_symbol_values(coefficients, sizes; spacing = 1)
    return [scalar_quadratic_symbol(coefficients, k; spacing) for k in periodic_momentum_grid(sizes; spacing)]
end

"""
    periodic_fourier_vector(sizes, label)

Return the normalized finite periodic Fourier vector with integer dual label
``label`` in the same Cartesian site order as `periodic_stiffness_matrix`.
For label ``n`` and site ``x`` with zero-based coordinates, the entry is
``|Λ|^-1/2 exp(2π i sum_a n_a x_a / L_a)``.
"""
function periodic_fourier_vector(sizes, label)
    _check_periodic_sizes(sizes)
    length(label) == length(sizes) || error("Fourier label $label has dimension $(length(label)); expected $(length(sizes))")
    all(n -> n isa Integer, label) || error("Fourier label entries must be integers, got $label")

    dims = Tuple(Int.(sizes))
    dual_label = Tuple(Int.(label))
    normalization = inv(sqrt(prod(dims)))
    return [normalization *
            cis(2 * pi * sum(dual_label[axis] * (Tuple(site)[axis] - 1) / dims[axis]
                             for axis in eachindex(dims)))
            for site in vec(collect(CartesianIndices(dims)))]
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
    count_periodic_symbol_minima(coefficients, sizes; spacing = 1,
        atol = GAUSSIAN_MINIMUM_COUNT_ATOL,
        rtol = GAUSSIAN_MINIMUM_COUNT_RTOL)

Count periodic-grid momenta whose symbol value is numerically equal to the
minimum under the Gaussian minima-count tolerance convention.
"""
function count_periodic_symbol_minima(coefficients, sizes; spacing = 1,
        atol = GAUSSIAN_MINIMUM_COUNT_ATOL, rtol = GAUSSIAN_MINIMUM_COUNT_RTOL)
    values = periodic_symbol_values(coefficients, sizes; spacing)
    minimum_value = minimum(values)
    return count(value -> isapprox(value, minimum_value; atol, rtol), values)
end
