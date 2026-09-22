using Test
include("SparseCoset.jl")
using .SparseCoset
@testset "Exact sparse CAR and embedding" begin
    for b in 0:3, i in 0:1, j in 0:1
        v=basis(b)
        lhs=add(ladder(ladder(v,j,true),i,false),ladder(ladder(v,i,false),j,true))
        @test lhs==(i==j ? v : Vec())
        @test isempty(add(ladder(ladder(v,j,false),i,false),ladder(ladder(v,i,false),j,false)))
    end
    # An odd added sea orbital makes the embedding phase nontrivial.
    # Actual paired-flavor windows have even added-left counts, so need this witness.
    mapping=[1,2]; added=big(1); cs=big(1)
    for b in 0:3, i in 0:1, create in (false,true)
        v=basis(b)
        @test embed(ladder(v,i,create),mapping,added,cs)==
              ladder(embed(v,mapping,added,cs),mapping[i+1],create)
    end
    @test embed(basis(cs),mapping,added,cs)==basis(3)
    @test norm2(embed(basis(2),mapping,added,cs))==1
    # Composition with a further inserted occupied orbital, including phase.
    for b in 0:3
        first=embed(basis(b),mapping,added,cs)
        second=embed(first,[1,2,3],big(1),big(3))
        @test second==embed(basis(b),[2,3],big(3),cs)
    end
end
@testset "Affine current signs and level" begin
    for k in (1,2)
        M=8; v=sea(M,k)
        plus=current(current(v,M,k,1:k,-1,3),M,k,1:k,1,3)
        minus=current(current(v,M,k,1:k,1,3),M,k,1:k,-1,3)
        @test add(plus,minus,-1)==add(Vec(),v,big(k)//2)
        # [J^1_0,J^2_-1]=i J^3_-1 includes a noncentral, imaginary sign.
        a=current(current(v,M,k,1:k,-1,2),M,k,1:k,0,1)
        b=current(current(v,M,k,1:k,0,1),M,k,1:k,-1,2)
        rhs=current(v,M,k,1:k,-1,3)
        @test add(a,b,-1)==add(Vec(),rhs,amp(im))
    end
end
@testset "GKO vacuum central invariants" begin
    for k in (1,2)
        c=1-big(6)//((k+2)*(k+3)) # GKO Eq.(2.19): 1/2, 7/10.
        for M in (8,16)
            omega=sea(M,k)
            @test norm2(omega)==1
            for n in -1:3
                @test isempty(stress(omega,M,k,n,3))
            end
            for n in (2,3)
                v=stress(omega,M,k,-n,3)
                @test norm2(v)==c*(n^3-n)/12
                @test v==stress(omega,M,k,-n,4)
                raised=stress(v,M,k,n,3)
                @test raised==add(Vec(),omega,c*(n^3-n)/12)
                @test inner(v,stress(omega,M,k,-n,3))==inner(stress(v,M,k,n,3),omega)
            end
        end
        omega=sea(8,k)
        @test refine(omega,8,16,k)==sea(16,k)
        @test refine(omega,8,8,k)==omega
        for n in (2,3)
            v=stress(omega,8,k,-n,3)
            @test refine(v,8,16,k)==stress(sea(16,k),16,k,-n,3)
            @test norm2(refine(v,8,16,k))==norm2(v)
        end
    end
    @test max_states_seen[]<=5000
end
println("Maximum sparse intermediate states: ",max_states_seen[])
