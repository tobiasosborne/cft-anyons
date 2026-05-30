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
end
