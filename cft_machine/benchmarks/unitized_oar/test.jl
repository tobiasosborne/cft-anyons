using Test, LinearAlgebra
include("UnitizedOAR.jl")
using .UnitizedOAR

@testset "Exact scalar-augmented OAR invariants" begin
    s=Stage([0,2], [1 0;0 1//4], [1,0])
    t=Stage([0,2,3], Matrix{Int}(I,3,3), [1,0,0])
    u=Stage([0,2,3,4], Matrix{Int}(I,4,4), [1,0,0,0])
    J=[1 0;0 1//2;0 0]
    K=[1 0 0;0 1 0;0 0 1;0 0 0]
    a=Element([1 2+im;3-im 4],2)
    # This pair has omega(a*b) != omega(a)*omega(b), so a character
    # substitution cannot accidentally pass the multiplicativity sentinel.
    b=Element([0 1;1 2],-1)
    identity_s=unit(s)
    @test metric_adjoint(s,[0 0;1 0])==[0 1//4;0 0]
    @test refine(s,t,J,identity_s)==unit(t)
    @test refine(s,t,J,a*b)==refine(s,t,J,a)*refine(s,t,J,b)
    @test refine(s,t,J,star(s,a))==star(t,refine(s,t,J,a))
    @test refine(t,u,K,refine(s,t,J,a))==refine(s,u,K*J,a)
    @test expectation(t,refine(s,t,J,a))==expectation(s,a)
    @test expectation(s,identity_s)==1
    positive_value=expectation(s,star(s,a)*a)
    @test isreal(positive_value) && real(positive_value)>=0
    @test expectation(t,star(t,refine(s,t,J,a))*refine(s,t,J,a))==
          expectation(s,star(s,a)*a)
    hs,ht=hamiltonian(s,3),hamiltonian(t,4)
    @test star(s,hs)==hs
    @test energy_commutator(t,refine(s,t,J,a))==
          refine(s,t,J,energy_commutator(s,a))
    # The Hamiltonians differ on the added shell, but their derivations agree.
    @test refine(s,t,J,hs)!=ht
    @test (ht-refine(s,t,J,hs))*refine(s,t,J,a)==
          refine(s,t,J,a)*(ht-refine(s,t,J,hs))
    # A state-character completion fails multiplicativity; independent lambda matters.
    x=[0 0;1 0]; xs=metric_adjoint(s,x)
    @test expectation(s,Element(xs*x,0))==1//4
    @test expectation(s,Element(x,0))==0
    @test expectation(s,Element(xs,0))==0
    @test_throws AssertionError Stage([0,1],[1 0;0 -1],[1,0])
    @test_throws AssertionError Stage([0,1],[1 0;0 0],[1,0])
    @test_throws AssertionError refine(s,t,[1 0;0 1;0 0],a)
end
