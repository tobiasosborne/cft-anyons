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
