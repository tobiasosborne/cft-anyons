using Test
include("CosetHamiltonian.jl")
using .CosetHamiltonian, .CosetHamiltonian.SparseCoset
@testset "Raw coset positivity obstruction" begin
    for M in (8,16),R in (3,4)
        v=polarized(M)
        h=stress(v,M,1,0,R)
        expected=-big((M-R)*(M-R-1))//12 # CH-1 independently summed CAR/spin oracle.
        @test norm2(v)==1
        @test inner(v,h)==expected
        @test real(inner(v,h))<0
        @test energy(v,M,1)==add(Vec(),v,big(M*M)//2)
    end
end
@testset "Computed vacuum spaces and positive repair" begin
    for k in (1,2),M in (8,16),b in 0:3
        data=basis_data(M,k,b)
        c=1-big(6)//((k+2)*(k+3)) # Source GKO Eq.(2.19), independent norm oracle.
        @test data.grades==(b<2 ? [0] : b==2 ? [0,2] : [0,2,3])
        for (i,v) in enumerate(data.vectors)
            g=data.grades[i]
            @test energy(v,M,k)==add(Vec(),v,g)
            @test project(v,data)==v
            @test regularized(v,data)==add(Vec(),v,g)
            g==0 || @test data.gram[i,i]==c*(g^3-g)/12
        end
        omega=sea(M,k)
        # A charged state is rigorously outside the neutral vacuum module.
        outsider=ladder(omega,orbital(M,1,M,1),true)
        @test norm2(outsider)==1
        @test isempty(project(outsider,data))
        @test regularized(outsider,data)==add(Vec(),outsider,b+1)
        v=add(add(omega,outsider,2),data.vectors[end],amp(im))
        hv=regularized(v,data)
        @test real(inner(v,hv))>=0 && iszero(imag(inner(v,hv)))
        @test project(project(v,data),data)==project(v,data)
        @test inner(outsider,regularized(v,data))==inner(regularized(outsider,data),v)
        refined=basis_data(16,k,b)
        for (i,u) in enumerate(data.vectors)
            @test refine(u,M,16,k)==refined.vectors[i]
        end
    end
    for k in (1,2),M in (8,16)
        d=basis_data(M,k,3)
        @test stress(d.vectors[2],M,k,-1,3)==d.vectors[3]
        @test isempty(regularized(sea(M,k),d))
    end
    @test max_states_seen[]<=5000
end
println("Maximum sparse intermediate states: ",max_states_seen[])
