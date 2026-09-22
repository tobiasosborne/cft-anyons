using Test, LinearAlgebra
include("FermionBenchmark.jl")
using .FermionBenchmark
BLAS.set_num_threads(1)
@testset "Source-modified fermion construction" begin
    for M in (8,16,32)
        rs, S = momenta(M), sea(M)
        @test S*S == S == S'
        for n in -3:3
            A, B = mode(M,n), mode(M,n;continuum=true)
            @test A' ≈ mode(M,-n) atol=1e-11
            @test B' == mode(M,-n;continuum=true)
            for j in eachindex(rs)
                1 <= j-n <= M || continue
                @test abs(A[j-n,j]-B[j-n,j]) <= coefficient_bound(M,n,rs[j])+1e-11
            end
        end
        # Independent oracle: finite Fermi-surface sum of half-integer squares.
        for n in 1:3
            B, Bminus = mode(M,n;continuum=true), mode(M,-n;continuum=true)
            exact = (n^3-n)//12
            @test sum((r-n//2)^2 for r in (1:2:(2n-1)).//2) == exact
            @test cocycle(B,Bminus,S) == exact
            A, Aminus = mode(M,n), mode(M,-n)
            scalar = sum((cos(pi*n/(2M))^2*sin(2pi*(r-n//2)/M)/(2pi/M))^2
                         for r in (1:2:(2n-1)).//2)
            @test cocycle(A,Aminus,S) ≈ scalar atol=1e-11
            @test cocycle(A,Aminus,S) <= Float64(exact)+1e-11
        end
        # Exact Witt algebra only on a core away from compression boundaries.
        for m in -1:1, n in -1:1
            A,B = mode(M,m;continuum=true),mode(M,n;continuum=true)
            @test (A*B-B*A-(m-n)*mode(M,m+n;continuum=true))[:,core(M)] == zeros(M,4)
        end
        H, eps = dirac(M), 2pi/M
        @test H ≈ H' atol=1e-11
        # Independent site-space oracle for Eq. (44): AP forward hopping.
        U = [exp(im*Float64(r)*x*eps)/sqrt(M) for x in 0:M-1, r in rs]
        shift = zeros(M,M)
        for j in 1:M-1
            shift[j+1,j] = 1
        end
        shift[1,M] = -1
        @test U*U' ≈ I atol=1e-11
        @test U*H[1:2:2M,2:2:2M]*U' ≈ (shift-I)/eps atol=1e-11
        for (j,r) in enumerate(rs)
            block = H[2j-1:2j,2j-1:2j]
            energy = 2abs(sin(eps*r/2))/eps
            @test block*block ≈ energy^2*I atol=1e-11
        end
    end
    for M in (8,16)
        J, K = inclusion(M,2M), inclusion(2M,4M)
        @test J'*J == I
        @test K*J == inclusion(M,4M)
        @test J'*sea(2M)*J == sea(M)
        for n in -2:2
            defect = (mode(2M,n)*J-J*mode(M,n))[:,core(M)]
            bound = maximum(coefficient_bound(M,n,r)+coefficient_bound(2M,n,r)
                            for r in momenta(M)[core(M)])
            @test opnorm(defect) <= bound+1e-11
        end
    end
    @test_throws AssertionError momenta(65)
    @test_throws AssertionError dirac(64)
    # Negative control: momentum wrapping changes the sea cocycle.
    @test abs(cocycle(mode(16,2;wrap=true),mode(16,-2;wrap=true),sea(16))-0.5) > 0.1
end

@testset "Self-dual Majorana specialization" begin
    for M in (8,16,32)
        R,S = charge_conjugation(M),sea(M)
        @test R*R == I
        @test R*conj(S)*R == I-S
        for n in -3:3
            A = mode(M,n)
            @test R*conj(A')*R ≈ -A atol=1e-11
            recipe = majorana_recipe(M,n)
            reconstructed = zeros(M,M)
            for term in recipe.terms
                reconstructed[term.row,term.column] += 2term.coefficient
            end
            @test reconstructed == A
            # Vacuum expectation of the normal-ordered polynomial is zero.
            @test sum(term.coefficient*S[term.column,term.row] for term in recipe.terms;
                      init=0.0)+recipe.scalar ≈ 0 atol=1e-11
        end
        for n in 1:3
            A,B = mode(M,n;continuum=true),mode(M,-n;continuum=true)
            @test R*conj(A')*R == -A
            @test majorana_cocycle(A,B,S) == (n^3-n)//24
            @test majorana_cocycle(mode(M,n),mode(M,-n),S) ≈
                cocycle(mode(M,n),mode(M,-n),S)/2 atol=1e-11
        end
    end
end
