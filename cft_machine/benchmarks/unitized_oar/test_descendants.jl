using Test,LinearAlgebra
include("CosetTower.jl")
using .CosetTower
using .CosetTower.UnitizedOAR

@testset "Computed coset descendants form exact unital OAR stages" begin
    for k in (1,2)
        coarse=[stage_data(8,k,b) for b in 0:3]
        fine=[stage_data(16,k,b) for b in 0:3]
        for b in 0:3
            x=coarse[b+1];s=x.stage
            @test compressed_mode(x,0)==Matrix(Diagonal(s.grades))
            modes=Dict(n=>compressed_mode(x,n) for n in -3:3)
            for n in -3:3
                @test metric_adjoint(s,modes[n])==modes[-n]
            end
            for B in b:3
                y=fine[B+1];t=y.stage
                J=connecting_matrix(x,y)
                a=Element([i+im*j for i in eachindex(s.grades),j in eachindex(s.grades)],2)
                aa=star(s,a)*a
                @test refine(s,t,J,unit(s))==unit(t)
                @test refine(s,t,J,aa)==star(t,refine(s,t,J,a))*refine(s,t,J,a)
                @test expectation(t,refine(s,t,J,a))==expectation(s,a)
                @test energy_commutator(t,refine(s,t,J,a))==
                    refine(s,t,J,energy_commutator(s,a))
                @test J'*t.gram*J==s.gram
                h=hamiltonian(s,b+1)
                @test expectation(s,h)==0
                @test count(==(0),s.grades)==1 && real(h.scalar)>0
            end
        end
        # Nested physical placement and descendant-grade inclusion commute.
        x=coarse[1];y=coarse[3];z=fine[4]
        J,K=connecting_matrix(x,y),connecting_matrix(y,z)
        @test K*J==connecting_matrix(x,z)
        a=Element(reshape([3],1,1),2)
        @test refine(y.stage,z.stage,K,refine(x.stage,y.stage,J,a))==
            refine(x.stage,z.stage,K*J,a)
        # Same-smearing compression is not exact algebraic refinement.
        a2=Element(compressed_mode(coarse[3],3)+compressed_mode(coarse[3],-3),0)
        b3=Element(compressed_mode(fine[4],3)+compressed_mode(fine[4],-3),0)
        @test iszero(norm(a2.matrix)) && !iszero(norm(b3.matrix))
        @test refine(coarse[3].stage,fine[4].stage,
                     connecting_matrix(coarse[3],fine[4]),a2)!=b3
    end
end
