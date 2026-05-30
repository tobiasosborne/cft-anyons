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
