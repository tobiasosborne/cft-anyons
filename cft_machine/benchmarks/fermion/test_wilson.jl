using Test, LinearAlgebra
include("FermionBenchmark.jl")
include("WilsonStates.jl")
using .FermionBenchmark, .WilsonStates
BLAS.set_num_threads(1)
@testset "Actual microscopic Dirac Wilson rows" begin
    for M in (8,16,32)
        P,H = covariance(M),dirac(M)
        @test P ≈ P' atol=1e-11
        @test P*P ≈ P atol=1e-11
        @test H*P ≈ P*H atol=1e-11
        @test tr(P) ≈ M atol=1e-11
    end
    for M in (4,8), Q in (M,2M,4M)
        row,target = covariance_row(M,Q),continuum_covariance(M)
        @test norm(row-target) > 1e-4 # genuinely drifting microscopic state
        @test opnorm(row-target) ≈ sin((2pi/Q)*maximum(abs,momenta(M))/4) atol=1e-11
        @test opnorm(row-target) <= (2pi/Q)*maximum(abs,momenta(M))/4+1e-11
        for (j,r) in enumerate(momenta(M))
            block = row[2j-1:2j,2j-1:2j]
            @test block*block ≈ block atol=1e-11
            # Two CAR modes, one occupied orbital: density is zero on vacuum
            # and double occupancy and equals block on the one-particle space.
            rho = zeros(ComplexF64,4,4)
            rho[2:3,2:3] = block
            rho_inf = zeros(ComplexF64,4,4)
            rho_inf[2:3,2:3] = target[2j-1:2j,2j-1:2j]
            @test sum(svdvals(rho-rho_inf)) ≈ 2sin((2pi/Q)*abs(r)/4) atol=1e-11
        end
        @test state_tail(M,Q) == (2pi/Q)*sum(abs,momenta(M))/2
    end
    for M in (4,8)
        J,K = dirac_inclusion(M,2M),dirac_inclusion(2M,4M)
        @test K*J == dirac_inclusion(M,4M)
        @test J'*(K'*covariance(4M)*K)*J ≈ covariance_row(M,4M) atol=1e-11
        @test J'*J == I
        coarse,fine = covariance_row(M,2M),covariance_row(M,4M)
        @test opnorm(coarse-fine) ≈ sin((2pi/(2M))*maximum(abs,momenta(M))/8) atol=1e-11
    end
end
