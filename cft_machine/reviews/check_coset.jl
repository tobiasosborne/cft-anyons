# Exact additional checks run by the independent coset referee.
# Sources/conventions: ../research/coset_route.md CR-2; root CONVENTIONS (z).
using Test
include(joinpath(@__DIR__, "..", "benchmarks", "coset", "SparseCoset.jl"))
using .SparseCoset
@testset "Independent boundary adjoints and zero currents" begin
    M=8
    k=1
    omega=sea(M,k)
    for pos in (orbital(M,1,5,1),orbital(M,1,8,1))
        v=ladder(omega,pos,true)
        for a in 1:3,p in (-2,2)
            x=current(current(v,M,k,1:k,p,a),M,k,1:k,0,a)
            y=current(current(v,M,k,1:k,0,a),M,k,1:k,p,a)
            @test x==y
        end
        for n in (1,2,3)
            w=stress(v,M,k,-n,3)
            @test inner(v,stress(w,M,k,n,3))==inner(stress(v,M,k,-n,3),w)
        end
    end
end
println(max_states_seen[])
