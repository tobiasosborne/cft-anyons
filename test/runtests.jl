using Test
using CftAnyons
using LinearAlgebra

@testset "CftAnyons seed invariants" begin
    φ = CftAnyons.golden_ratio()

    # Fibonacci fusion rule τ ⊗ τ ≅ 1 ⊕ τ ⇒ quantum dimension obeys d² = 1 + d.
    @test φ^2 ≈ 1 + φ

    # φ is the largest root of x² - x - 1; the conjugate root 1 - φ < 0 obeys the
    # same relation, but only φ is a valid (positive) quantum dimension.
    @test φ > 1
    @test (1 - φ)^2 ≈ 1 + (1 - φ)

    # Pin the numerical value (a known-correct answer, not a tolerance-free check).
    @test isapprox(φ, 1.618033988749895; atol = 1e-15)
end

@testset "finite symmetry sector projectors" begin
    I2 = Matrix{ComplexF64}(I, 2, 2)
    swap = ComplexF64[0 1; 1 0]

    P = CftAnyons.finite_group_average_projector([I2, swap])
    Q = I2 - P

    @test CftAnyons.is_orthogonal_projection(P)
    @test CftAnyons.is_orthogonal_projection(Q)
    @test P * Q ≈ zeros(ComplexF64, 2, 2)
    @test P ≈ ComplexF64[1//2 1//2; 1//2 1//2]

    invariant_vector = ComplexF64[1, 1]
    anti_invariant_vector = ComplexF64[1, -1]
    @test P * invariant_vector ≈ invariant_vector
    @test P * anti_invariant_vector ≈ zeros(ComplexF64, 2)

    @test_throws ErrorException CftAnyons.finite_group_average_projector([])
    @test_throws ErrorException CftAnyons.finite_group_average_projector([ComplexF64[1 1; 0 1]])
end

@testset "two-qubit exchange projectors" begin
    I4 = Matrix{ComplexF64}(I, 4, 4)
    swap_slots = ComplexF64[
        1 0 0 0
        0 0 1 0
        0 1 0 0
        0 0 0 1
    ]

    P_symmetric = (I4 + swap_slots) / 2
    P_antisymmetric = (I4 - swap_slots) / 2

    @test CftAnyons.is_orthogonal_projection(P_symmetric)
    @test CftAnyons.is_orthogonal_projection(P_antisymmetric)
    @test P_symmetric * P_antisymmetric ≈ zeros(ComplexF64, 4, 4)
    @test tr(P_symmetric) ≈ 3
    @test tr(P_antisymmetric) ≈ 1

    e0 = ComplexF64[1, 0]
    e1 = ComplexF64[0, 1]
    e00 = kron(e0, e0)
    e11 = kron(e1, e1)
    symmetric_cross = (kron(e0, e1) + kron(e1, e0)) / sqrt(2)
    antisymmetric_cross = (kron(e0, e1) - kron(e1, e0)) / sqrt(2)

    @test P_symmetric * e00 ≈ e00
    @test P_symmetric * symmetric_cross ≈ symmetric_cross
    @test P_symmetric * e11 ≈ e11
    @test P_symmetric * antisymmetric_cross ≈ zeros(ComplexF64, 4)
    @test P_antisymmetric * antisymmetric_cross ≈ antisymmetric_cross
    @test P_antisymmetric * e00 ≈ zeros(ComplexF64, 4)
end

@testset "Fibonacci fusion path counts" begin
    counts = CftAnyons.fibonacci_fusion_path_counts(7)

    @test counts == [
        (1, 0),
        (0, 1),
        (1, 1),
        (1, 2),
        (2, 3),
        (3, 5),
        (5, 8),
        (8, 13),
    ]

    one_counts = first.(counts)
    tau_counts = last.(counts)
    @test tau_counts[1:7] == [0, 1, 1, 2, 3, 5, 8]
    @test one_counts[2:end] == tau_counts[1:end-1]
    @test tau_counts[3:end] == tau_counts[2:end-1] .+ tau_counts[1:end-2]
    @test_throws ErrorException CftAnyons.fibonacci_fusion_path_counts(-1)
end

@testset "Poincare vector-field brackets" begin
    P(μ) = (:P, μ, 0)
    M(μ, ν) = μ < ν ? (:M, μ, ν) : (:M, ν, μ)
    bracket(a, b) = CftAnyons.poincare_vector_field_bracket(a, b, 3)

    @test bracket(P(0), P(1)) == Dict{Tuple{Symbol, Int, Int}, Int}()
    @test bracket(M(0, 1), P(0)) == Dict(P(1) => -1)
    @test bracket(M(0, 1), P(1)) == Dict(P(0) => -1)
    @test bracket(M(1, 2), P(1)) == Dict(P(2) => 1)
    @test bracket(M(1, 2), M(2, 3)) == Dict(M(1, 3) => -1)
    @test bracket(M(0, 1), M(0, 2)) == Dict(M(1, 2) => -1)
    @test_throws ErrorException CftAnyons.poincare_vector_field_bracket(P(4), P(0), 3)
    @test_throws ErrorException CftAnyons.poincare_vector_field_bracket((:M, 2, 1), P(0), 3)
end

@testset "nearest-neighbour boost current coefficients" begin
    @test CftAnyons.nearest_neighbor_boost_current_coefficients(0:5) == ones(Int, 5)
    @test CftAnyons.nearest_neighbor_boost_current_coefficients([0, 1, 3, 6]) == [1, 2, 3]
    @test_throws ErrorException CftAnyons.nearest_neighbor_boost_current_coefficients([0])
end

@testset "Galilei vector-field brackets" begin
    H = (:H, 0, 0)
    P(a) = (:P, a, 0)
    G(a) = (:G, a, 0)
    J(a, b) = a < b ? (:J, a, b) : (:J, b, a)
    bracket(a, b) = CftAnyons.galilei_vector_field_bracket(a, b, 3)

    @test bracket(P(1), P(2)) == Dict{Tuple{Symbol, Int, Int}, Int}()
    @test bracket(G(1), G(2)) == Dict{Tuple{Symbol, Int, Int}, Int}()
    @test bracket(P(1), G(2)) == Dict{Tuple{Symbol, Int, Int}, Int}()
    @test bracket(H, G(1)) == Dict(P(1) => 1)
    @test bracket(G(1), H) == Dict(P(1) => -1)
    @test bracket(J(1, 2), P(1)) == Dict(P(2) => -1)
    @test bracket(J(1, 2), P(2)) == Dict(P(1) => 1)
    @test bracket(J(1, 2), G(1)) == Dict(G(2) => -1)
    @test bracket(J(1, 2), J(2, 3)) == Dict(J(1, 3) => 1)
    @test_throws ErrorException CftAnyons.galilei_vector_field_bracket((:J, 2, 1), H, 3)
    @test_throws ErrorException CftAnyons.galilei_vector_field_bracket(P(4), H, 3)
end

@testset "Galilei mass central coefficient" begin
    @test CftAnyons.galilei_mass_central_coefficient(7, 1, 1) == 7
    @test CftAnyons.galilei_mass_central_coefficient(7, 1, 2) == 0
    @test CftAnyons.galilei_mass_central_coefficient(2.5, 3, 3) == 2.5
    @test_throws ErrorException CftAnyons.galilei_mass_central_coefficient(1, 0, 1)
    @test_throws ErrorException CftAnyons.galilei_mass_central_coefficient(1, 1, 0)
end

@testset "first-moment continuity current coefficients" begin
    @test CftAnyons.first_moment_continuity_current_coefficients(0:4) == ones(Int, 4)
    @test CftAnyons.first_moment_continuity_current_coefficients([-1, 0, 2, 5]) == [1, 2, 3]
    @test_throws ErrorException CftAnyons.first_moment_continuity_current_coefficients([0])
end

gaussian_symbol_isapprox(actual, expected) = isapprox(actual, expected; atol = CftAnyons.GAUSSIAN_SYMBOL_VALUE_ATOL, rtol = CftAnyons.GAUSSIAN_SYMBOL_VALUE_RTOL)
gaussian_eigenvalue_isapprox(actual, expected) = isapprox(actual, expected; atol = CftAnyons.GAUSSIAN_EIGENVALUE_ATOL, rtol = CftAnyons.GAUSSIAN_EIGENVALUE_RTOL)
gaussian_small_spacing_isapprox(actual, expected) = isapprox(actual, expected; atol = CftAnyons.GAUSSIAN_SMALL_SPACING_RESIDUAL_ATOL, rtol = CftAnyons.GAUSSIAN_SMALL_SPACING_RESIDUAL_RTOL)
const GAUSSIAN_FINITE_DIFFERENCE_ATOL = 2e-8
const GAUSSIAN_FINITE_DIFFERENCE_RTOL = 2e-8
gaussian_finite_difference_isapprox(actual, expected) =
    isapprox(actual, expected; atol = GAUSSIAN_FINITE_DIFFERENCE_ATOL, rtol = GAUSSIAN_FINITE_DIFFERENCE_RTOL)

function central_difference_half_gradient(coefficients, k; spacing = 1, step = 1e-5)
    out = zeros(Float64, length(k))
    for axis in eachindex(k)
        plus = copy(k)
        minus = copy(k)
        plus[axis] += step
        minus[axis] -= step
        forward = CftAnyons.scalar_quadratic_symbol(coefficients, plus; spacing)
        backward = CftAnyons.scalar_quadratic_symbol(coefficients, minus; spacing)
        out[axis] = (forward - backward) / (4 * step)
    end
    return out
end

periodic_label_momentum(label, sizes; spacing = 1) =
    [2 * pi * label[axis] / (spacing * sizes[axis]) for axis in eachindex(sizes)]

function assert_periodic_fourier_eigenvectors(coefficients, sizes, labels; spacing = 1, radius = 1)
    @test all(L -> L > 2radius, sizes)
    stiffness = CftAnyons.periodic_stiffness_matrix(coefficients, sizes)
    for label in labels
        fourier_vector = CftAnyons.periodic_fourier_vector(sizes, label)
        momentum = periodic_label_momentum(label, sizes; spacing)
        symbol = CftAnyons.scalar_quadratic_symbol(coefficients, momentum; spacing)

        @test gaussian_eigenvalue_isapprox(norm(fourier_vector), 1)
        @test gaussian_eigenvalue_isapprox(stiffness * fourier_vector, symbol * fourier_vector)
    end
end

raw_periodic_symbol(coefficients, label, sizes) =
    sum(coeff * cis(2 * pi * sum(offset[axis] * label[axis] / sizes[axis]
                                 for axis in eachindex(sizes)))
        for (offset, coeff) in coefficients)

@testset "Gaussian boson numerical tolerance policy" begin
    @test CftAnyons.GAUSSIAN_SYMBOL_IMAG_ATOL == 1e-10
    @test CftAnyons.GAUSSIAN_SYMBOL_IMAG_RTOL == 1e-10
    @test CftAnyons.GAUSSIAN_EIGENVALUE_ATOL == 1e-10
    @test CftAnyons.GAUSSIAN_EIGENVALUE_RTOL == 1e-10
    @test CftAnyons.GAUSSIAN_MINIMUM_COUNT_ATOL == 1e-10
    @test CftAnyons.GAUSSIAN_MINIMUM_COUNT_RTOL == 1e-10
    @test CftAnyons.GAUSSIAN_SMALL_SPACING_RESIDUAL_ATOL == 5e-4
    @test CftAnyons.GAUSSIAN_SMALL_SPACING_RESIDUAL_RTOL == 1e-10

    near_flat = [([0], 1.0), ([1], -2e-11), ([-1], -2e-11)]
    @test CftAnyons.count_periodic_symbol_minima(near_flat, [2]; spacing = 1) == 2
    @test CftAnyons.count_periodic_symbol_minima(near_flat, [2]; spacing = 1, atol = 1e-13, rtol = 0.0) == 1
end

@testset "Gaussian boson scalar coefficient validation" begin
    valid = [([0], 2.0), ([1], -0.5), ([-1], -0.5)]
    duplicated = [([0], 2.0), ([1], -0.2), ([1], -0.3), ([-1], -0.5)]

    @test CftAnyons.validate_scalar_coefficients(valid) == 1
    @test CftAnyons.validate_scalar_coefficients(duplicated; spatial_dim = 1) == 1

    @test_throws ErrorException CftAnyons.validate_scalar_coefficients([([0], 2.0), ([1], -0.5)])
    @test_throws ErrorException CftAnyons.validate_scalar_coefficients([([0], 2.0), ([1], -0.5), ([-1], -0.4)])
    @test_throws ErrorException CftAnyons.validate_scalar_coefficients([([0], 1.0 + 0.1im)])
    @test_throws ErrorException CftAnyons.validate_scalar_coefficients([([0, 0], 1.0), ([1], -0.5), ([-1], -0.5)])
    @test_throws ErrorException CftAnyons.validate_scalar_coefficients([([0.5], 1.0)])
    @test_throws ErrorException CftAnyons.scalar_quadratic_symbol([([0], 2.0), ([1], -0.5)], [0.2])
    @test_throws ErrorException CftAnyons.boost_time_symbol_from_coefficients([([0], 2.0), ([1], -0.5)], [0.2])
end

@testset "Gaussian quadratic commutator sign convention" begin
    q_energy = [1 0; 0 0]
    p_energy = [0 0; 0 1]

    # i[q^2 / 2, p^2 / 2] = -(q p + p q) / 2.
    @test CftAnyons.quadratic_commutator_matrix(q_energy, p_energy) == [0 -1; -1 0]
    @test CftAnyons.quadratic_commutator_matrix(p_energy, q_energy) == [0 1; 1 0]
    @test CftAnyons.canonical_phase_space_symplectic(1) == [0 1; -1 0]
    @test_throws ErrorException CftAnyons.quadratic_commutator_matrix(zeros(3, 3), zeros(3, 3))
end

@testset "Gaussian open-chain energy current continuity" begin
    N = 5
    onsite = 7.25
    bond = -1.5
    densities = CftAnyons.open_chain_gaussian_energy_density_matrices(N; onsite, bond)
    hamiltonian = CftAnyons.open_chain_gaussian_hamiltonian_matrix(N; onsite, bond)
    currents = CftAnyons.open_chain_gaussian_energy_current_matrices(densities)
    shifted_currents = CftAnyons.open_chain_gaussian_energy_current_matrices(N; onsite = onsite + 3.0, bond)

    @test length(densities) == N
    @test length(currents) == N - 1
    @test gaussian_symbol_isapprox(sum(densities), hamiltonian)
    @test gaussian_symbol_isapprox(hamiltonian[1:N, 1:N], SymTridiagonal(fill(onsite, N), fill(bond, N - 1)))
    @test gaussian_symbol_isapprox(hamiltonian[N + 1:2N, N + 1:2N], Matrix{Float64}(I, N, N))

    for j in 1:(N - 1)
        closed_form = CftAnyons.open_chain_gaussian_energy_current_closed_form_matrix(N, j; bond)
        @test gaussian_symbol_isapprox(currents[j], closed_form)
        @test gaussian_symbol_isapprox(currents[j], shifted_currents[j])
        @test gaussian_symbol_isapprox(closed_form[j + 1, N + j], bond / 2)
        @test gaussian_symbol_isapprox(closed_form[j, N + j + 1], -bond / 2)
    end

    continuity_residuals = CftAnyons.open_chain_gaussian_energy_continuity_residuals(N; onsite, bond)
    @test all(residual -> gaussian_symbol_isapprox(residual, zeros(2N, 2N)), continuity_residuals)

    lhs = [CftAnyons.quadratic_commutator_matrix(hamiltonian, densities[j]) for j in 1:N]
    @test gaussian_symbol_isapprox(lhs[1], -currents[1])
    for j in 2:(N - 1)
        @test gaussian_symbol_isapprox(lhs[j], currents[j - 1] - currents[j])
    end
    @test gaussian_symbol_isapprox(lhs[N], currents[N - 1])
end

@testset "Gaussian boson Klein-Gordon symbols" begin
    for d in 1:3
        k = collect(0.1:0.1:(0.1d))
        mass = 0.7
        spacing = 0.25
        coeffs = CftAnyons.kg_nearest_neighbor_coefficients(d; mass, spacing)

        @test length(coeffs) == 1 + 2d
        @test gaussian_symbol_isapprox(CftAnyons.scalar_quadratic_symbol(coeffs, k; spacing),
            CftAnyons.kg_lattice_omega_squared(k; mass, spacing))
        @test gaussian_symbol_isapprox(CftAnyons.continuum_kg_omega_squared(k; mass), mass^2 + sum(abs2, k))
    end

    @test_throws ErrorException CftAnyons.kg_lattice_omega_squared([0.0, 0.1, 0.2, 0.3]; mass = 1)
    @test_throws ErrorException CftAnyons.kg_nearest_neighbor_coefficients(4; mass = 1)
end

@testset "Gaussian boson boost-time symbols" begin
    for d in 1:3
        k = [0.1 * (-1)^a * a for a in 1:d]
        mass = 0.4
        spacing = 0.2
        coeffs = CftAnyons.kg_nearest_neighbor_coefficients(d; mass, spacing)

        @test gaussian_symbol_isapprox(CftAnyons.boost_time_symbol_from_coefficients(coeffs, k; spacing),
            CftAnyons.kg_lattice_boost_time_symbol(k; spacing))
        @test gaussian_symbol_isapprox(CftAnyons.continuum_kg_boost_time_symbol(k), k)
    end

    k = [0.3, -0.2, 0.1]
    ε = 0.05
    lattice_symbol = CftAnyons.kg_lattice_boost_time_symbol(k; spacing = ε)
    @test gaussian_small_spacing_isapprox(lattice_symbol, k)
    @test_throws ErrorException CftAnyons.kg_lattice_boost_time_symbol([0.0]; spacing = 0)
end

@testset "Gaussian boson current-symbol equivalence" begin
    for spacing in (1.0, 0.4, 0.125)
        bond = -1 / spacing^2
        for k in ([-0.7], [-0.2], [0.0], [0.35], [1.1])
            current_symbol = CftAnyons.nearest_neighbor_integrated_energy_current_symbol(k;
                bond, spacing)
            kg_current_symbol = CftAnyons.kg_nearest_neighbor_integrated_energy_current_symbol(k;
                spacing)
            boost_time_symbol = CftAnyons.kg_lattice_boost_time_symbol(k; spacing)

            @test gaussian_symbol_isapprox(current_symbol, kg_current_symbol)
            @test gaussian_symbol_isapprox(current_symbol, boost_time_symbol)
        end
    end

    spacing = 0.3
    k = [0.8]
    positive_orientation = CftAnyons.kg_nearest_neighbor_integrated_energy_current_symbol(k;
        spacing)
    reversed_bond_symbol = CftAnyons.nearest_neighbor_integrated_energy_current_symbol(k;
        bond = 1 / spacing^2, spacing)

    @test positive_orientation[1] > 0
    @test reversed_bond_symbol[1] < 0
    @test gaussian_symbol_isapprox(positive_orientation, CftAnyons.kg_lattice_boost_time_symbol(k; spacing))
    @test !gaussian_symbol_isapprox(reversed_bond_symbol, CftAnyons.kg_lattice_boost_time_symbol(k; spacing))

    for spacing in (0.05, 0.025), k in ([-0.9], [-0.25], [0.4], [0.85])
        @test gaussian_small_spacing_isapprox(
            CftAnyons.kg_nearest_neighbor_integrated_energy_current_symbol(k; spacing),
            k)
    end

    @test_throws ErrorException CftAnyons.nearest_neighbor_integrated_energy_current_symbol([0.1, 0.2];
        bond = -1, spacing = 1)
    @test_throws ErrorException CftAnyons.nearest_neighbor_integrated_energy_current_symbol([0.1];
        bond = -1, spacing = 0)
end

@testset "Gaussian boson finite-difference boost-time oracle" begin
    cases = [
        (
            [([0], 2.1), ([1], -0.37), ([-1], -0.37), ([2], 0.08), ([-2], 0.08)],
            [0.37],
            0.7,
        ),
        (
            [
                ([0, 0], 2.6),
                ([1, 0], -0.22), ([-1, 0], -0.22),
                ([0, 1], -0.31), ([0, -1], -0.31),
                ([1, 1], 0.13), ([-1, -1], 0.13),
                ([2, -1], -0.04), ([-2, 1], -0.04),
            ],
            [0.31, -0.24],
            0.8,
        ),
        (
            [
                ([0, 0, 0], 3.4),
                ([1, 0, 0], -0.18), ([-1, 0, 0], -0.18),
                ([0, 1, 0], -0.21), ([0, -1, 0], -0.21),
                ([0, 0, 1], -0.16), ([0, 0, -1], -0.16),
                ([1, 1, 0], 0.09), ([-1, -1, 0], 0.09),
                ([1, -2, 1], -0.035), ([-1, 2, -1], -0.035),
            ],
            [0.17, -0.29, 0.23],
            0.6,
        ),
    ]

    for (coefficients, k, spacing) in cases
        closed_form = CftAnyons.boost_time_symbol_from_coefficients(coefficients, k; spacing)
        finite_difference = central_difference_half_gradient(coefficients, k; spacing)

        @test norm(finite_difference) > 0.01
        @test gaussian_finite_difference_isapprox(closed_form, finite_difference)
    end
end

@testset "Gaussian boson rotation and boost-boost symbol residuals" begin
    for d in 1:3
        k = [0.13 * (-1)^axis * axis for axis in 1:d]
        spacing = 0.03
        coeffs = CftAnyons.kg_nearest_neighbor_coefficients(d; mass = 0.5, spacing)
        rotation = CftAnyons.rotation_hamiltonian_residual_from_coefficients(coeffs, k; spacing)
        boost_boost = CftAnyons.boost_boost_residual_coefficients_from_coefficients(coeffs, k; spacing)

        @test gaussian_small_spacing_isapprox(rotation, zeros(d, d))
        @test gaussian_small_spacing_isapprox(boost_boost, zeros(d, d, d))
    end

    speeds = [1.0, 1.4, 0.7]
    anisotropic = CftAnyons.anisotropic_kg_nearest_neighbor_coefficients(speeds; mass = 0.4, spacing = 0.05)
    anisotropic_k = [0.4, -0.3, 0.2]
    anisotropic_rotation = CftAnyons.rotation_hamiltonian_residual_from_coefficients(anisotropic, anisotropic_k; spacing = 0.05)
    anisotropic_boost_boost = CftAnyons.boost_boost_residual_coefficients_from_coefficients(anisotropic, anisotropic_k; spacing = 0.05)
    anisotropic_boost_time = CftAnyons.boost_time_residual_from_coefficients(anisotropic, anisotropic_k; spacing = 0.05)

    @test abs(anisotropic_rotation[1, 2]) > 0.15
    @test gaussian_symbol_isapprox(anisotropic_rotation + anisotropic_rotation', zeros(3, 3))
    @test norm(anisotropic_boost_boost) > 0.25
    @test gaussian_symbol_isapprox(anisotropic_boost_boost + permutedims(anisotropic_boost_boost, (2, 1, 3)), zeros(3, 3, 3))
    @test gaussian_symbol_isapprox(anisotropic_boost_boost[1, 2, 1], anisotropic_boost_time[2])
    @test gaussian_symbol_isapprox(anisotropic_boost_boost[1, 2, 2], -anisotropic_boost_time[1])

    doubler = CftAnyons.doubler_quadratic_coefficients(2; mass = 0, spacing = 1)
    doubler_rotation = CftAnyons.rotation_hamiltonian_residual_from_coefficients(doubler, [pi / 2, pi / 4]; spacing = 1)
    doubler_boost_boost = CftAnyons.boost_boost_residual_coefficients_from_coefficients(doubler, [pi, 0.0]; spacing = 1)

    @test abs(doubler_rotation[1, 2]) > 1
    @test gaussian_symbol_isapprox(CftAnyons.scalar_quadratic_symbol(doubler, [pi, 0.0]; spacing = 1), 0)
    @test abs(doubler_boost_boost[1, 2, 2]) > 3
    @test_throws ErrorException CftAnyons.rotation_hamiltonian_residual_from_coefficients([([0], 2.0), ([1], -0.5)], [0.2])
    @test_throws ErrorException CftAnyons.boost_boost_residual_coefficients_from_coefficients(doubler, [0.1, 0.2]; speed = 0)
end

@testset "Gaussian boson Lorentz Hessian examples" begin
    for d in 1:3
        spacing = 0.35
        coeffs = CftAnyons.kg_nearest_neighbor_coefficients(d; mass = 0.6, spacing)
        hessian = CftAnyons.low_energy_hessian_from_coefficients(coeffs, d; spacing)
        residual = CftAnyons.lorentz_hessian_residual(coeffs, d; spacing)

        @test gaussian_symbol_isapprox(hessian, 2 * Matrix{Float64}(I, d, d))
        @test gaussian_symbol_isapprox(residual, zeros(d, d))
    end

    speeds = [1.0, 1.5, 0.5]
    anisotropic = CftAnyons.anisotropic_kg_nearest_neighbor_coefficients(speeds; mass = 0.4, spacing = 0.25)
    hessian = CftAnyons.low_energy_hessian_from_coefficients(anisotropic, 3; spacing = 0.25)
    residual = CftAnyons.lorentz_hessian_residual(anisotropic, 3; spacing = 0.25)

    @test gaussian_symbol_isapprox(diag(hessian), 2 .* speeds .^ 2)
    @test norm(residual) > 1
end

@testset "Gaussian boson centered periodic momentum labels" begin
    even_grid = CftAnyons.centered_periodic_momentum_grid([4]; spacing = 1)
    @test [entry.label[1] for entry in even_grid] == [0, 1, -2, -1]
    @test gaussian_symbol_isapprox([entry.momentum[1] for entry in even_grid], [0, pi / 2, -pi, -pi / 2])
    @test gaussian_symbol_isapprox(CftAnyons.periodic_momentum_grid([4]; spacing = 1)[4], [3pi / 2])
    @test even_grid[4].label == [-1]
    @test gaussian_symbol_isapprox(even_grid[4].momentum, [-pi / 2])

    odd_grid = CftAnyons.centered_periodic_momentum_grid([5]; spacing = 2)
    @test [entry.label[1] for entry in odd_grid] == [0, 1, 2, -2, -1]
    @test gaussian_symbol_isapprox([entry.momentum[1] for entry in odd_grid],
        [0, pi / 5, 2pi / 5, -2pi / 5, -pi / 5])
    @test_throws ErrorException CftAnyons.centered_periodic_momentum_grid([4]; spacing = 0)
end

@testset "Gaussian boson finite periodic massive coefficient spectra" begin
    for sizes in ([5], [4, 3], [3, 2, 2])
        d = length(sizes)
        spacing = 0.4
        coeffs = CftAnyons.kg_nearest_neighbor_coefficients(d; mass = 0.8, spacing)
        stiffness = CftAnyons.periodic_stiffness_matrix(coeffs, sizes)
        spectrum = sort(eigvals(Symmetric(stiffness)))
        symbols = sort(CftAnyons.periodic_symbol_values(coeffs, sizes; spacing))

        @test gaussian_eigenvalue_isapprox(stiffness, stiffness')
        @test gaussian_eigenvalue_isapprox(spectrum, symbols)
    end

    spacing = 0.4
    off_axis = [
        ([0, 0], 2.0),
        ([1, 0], -0.3), ([-1, 0], -0.3),
        ([0, 1], -0.2), ([0, -1], -0.2),
        ([1, 1], 0.17), ([-1, -1], 0.17),
    ]
    fourier_cases = [
        (CftAnyons.kg_nearest_neighbor_coefficients(1; mass = 0.8, spacing), [5], [[0], [1], [4]]),
        (off_axis, [4, 5], [[0, 0], [1, 2], [3, 4]]),
        (CftAnyons.kg_nearest_neighbor_coefficients(3; mass = 0.8, spacing), [3, 4, 5],
            [[1, 0, 2], [2, 3, 4]]),
    ]

    for (coeffs, sizes, labels) in fourier_cases
        assert_periodic_fourier_eigenvectors(coeffs, sizes, labels; spacing, radius = 1)
    end

    # One-sided shift sentinel: not a scalar Gaussian Hamiltonian, but it pins
    # the finite Fourier offset direction that symmetric kernels cannot detect.
    one_sided = [([0], 0.0), ([1], 1.0)]
    label = [1]
    shift_vector = CftAnyons.periodic_fourier_vector([5], label)
    shift_symbol = raw_periodic_symbol(one_sided, label, [5])
    @test_throws ErrorException CftAnyons.periodic_stiffness_matrix(one_sided, [5])
    shift_matrix = CftAnyons.periodic_stiffness_matrix(one_sided, [5]; validate_coefficients = false)
    @test gaussian_eigenvalue_isapprox(shift_matrix * shift_vector, shift_symbol * shift_vector)
    @test !gaussian_eigenvalue_isapprox(shift_matrix * shift_vector, conj(shift_symbol) * shift_vector)
    @test_throws ErrorException CftAnyons.periodic_fourier_vector([3], [0, 1])
    @test_throws ErrorException CftAnyons.periodic_fourier_vector([3], [0.5])
end

@testset "Gaussian boson finite-grid minimum data" begin
    unstable = [([0], 0.0), ([1], 1.0), ([-1], 1.0), ([2], -0.5), ([-2], -0.5)]
    residual = CftAnyons.lorentz_hessian_residual(unstable, 1; spacing = 1, speed = 1)
    data = CftAnyons.symbol_minimum_data(unstable, [4]; spacing = 1)

    @test gaussian_symbol_isapprox(residual, zeros(1, 1))
    @test gaussian_symbol_isapprox(data.minimum_value, -3)
    @test data.minimum_count == 1
    @test data.minima[1].value == data.minimum_value
    @test data.minima[1].location == [3]
    @test data.minima[1].label == [2]
    @test gaussian_symbol_isapprox(data.minima[1].momentum, [pi])
    @test data.minima[1].centered_label == [-2]
    @test gaussian_symbol_isapprox(data.minima[1].centered_momentum, [-pi])
    @test_throws ErrorException CftAnyons.symbol_minimum_data(unstable, [4]; spacing = 1, require_nonnegative = true)
end

@testset "Gaussian boson massless doubler coefficient rejection" begin
    # This is a coefficient-level zero-mode witness, not positive-dispersion
    # Fock-generator evidence; see CONVENTIONS.md (j).
    for d in 1:3
        sizes = fill(4, d)
        doubler = CftAnyons.doubler_quadratic_coefficients(d; mass = 0, spacing = 1)
        residual = CftAnyons.lorentz_hessian_residual(doubler, d; spacing = 1, speed = 1)
        data = CftAnyons.symbol_minimum_data(doubler, sizes; spacing = 1, require_nonnegative = true)
        expected_labels = Set(Tuple(label) for label in Iterators.product(ntuple(_ -> (0, 2), d)...))
        expected_centered_labels = Set(Tuple(label) for label in Iterators.product(ntuple(_ -> (0, -2), d)...))
        expected_locations = Set(Tuple(label) for label in Iterators.product(ntuple(_ -> (1, 3), d)...))

        @test gaussian_symbol_isapprox(CftAnyons.scalar_quadratic_symbol(doubler, zeros(d); spacing = 1), 0)
        @test gaussian_symbol_isapprox(residual, zeros(d, d))
        @test gaussian_symbol_isapprox(data.minimum_value, 0)
        @test data.minimum_count == 2^d
        @test CftAnyons.count_periodic_symbol_minima(doubler, sizes; spacing = 1) == 2^d
        @test Set(Tuple(minimum.label) for minimum in data.minima) == expected_labels
        @test Set(Tuple(minimum.centered_label) for minimum in data.minima) == expected_centered_labels
        @test Set(Tuple(minimum.location) for minimum in data.minima) == expected_locations
        @test all(minimum -> gaussian_symbol_isapprox(minimum.value, 0), data.minima)
    end
    @test_throws ErrorException CftAnyons.periodic_stiffness_matrix([([0, 0], 1.0)], [3])
end
