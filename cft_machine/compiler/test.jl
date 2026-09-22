using Test, LinearAlgebra
include("IsingCompiler.jl")
using .IsingCompiler
const FB=IsingCompiler.FermionBenchmark
@testset "exact Cyclo16 and Ising category compiler" begin
    z=ZETA16; d=ising_datum()
    @test z^8 == -1
    @test z^16 == 1
    @test z*conj(z) == 1
    @test SQRT2^2 == 2
    @test conj(SQRT2)==SQRT2
    @test (z+2)*(z-2)==z^2-4
    @test conj(z+2z^3)==conj(z)+2conj(z^3)
    @test d.S*d.S==Matrix{Cyclo16}(I,3,3)
    @test d.S'==d.S
    @test (d.S*Diagonal(d.theta))^3==ZETA16*Matrix{Cyclo16}(I,3,3)
    @test d.c==1//2
    reps=[(1,1),(1,2),(1,3)]
    weights=[((4p-3q)^2-1)//48 for (p,q) in reps]
    @test weights==[0//1,1//16,1//2]
    @test d.theta==[z^Int(16h) for h in weights]
    for a in 1:3,b in 1:3,c in 1:3
        @test d.fusion[a,b,c]==count(==(reps[c]),minimal_model_fusion(reps[a],reps[b]))
        # Source balancing and fusion diagonalization, independent of matrix construction.
        @test d.theta[a]*d.theta[b]*d.S[a,b] ==
            sum(d.fusion[a,b,t]*d.S[t,1]*d.theta[t] for t in 1:3)
        @test sum(d.fusion[a,b,t]*d.S[t,c]*d.S[1,c] for t in 1:3)==d.S[a,c]*d.S[b,c]
    end
    p=[1,3,2]; renamed=relabel(d,p;labels=["vacuum","fermion","spin"])
    @test compile_ising(renamed).input_to_canonical==[p]
    @test compile_ising(d).input_to_canonical==[[1,2,3]]
    @test_throws ArgumentError relabel(d,[2,1,3])
    badtheta=copy(d.theta);badtheta[2]=conj(badtheta[2])
    @test_throws UnsupportedCategory compile_ising(ModularDatum(d.labels,d.S,badtheta,d.fusion,d.c))
    @test_throws UnsupportedCategory compile_ising(ModularDatum(d.labels,d.S,d.theta,d.fusion,17//2))
    badfusion=copy(d.fusion);badfusion[2,2,3]=0
    @test_throws UnsupportedCategory compile_ising(ModularDatum(d.labels,d.S,d.theta,badfusion,d.c))
    @test_throws ArgumentError ModularDatum(d.labels,complex_value.(d.S),d.theta,d.fusion,d.c)
    @test_throws ArgumentError compile_product(ModularDatum[])
    product=compile_product([d,renamed]); data=product_modular_data(product)
    @test data.labels==[[a,b] for a in 1:3 for b in 1:3]
    @test data.S==kron(d.S,d.S)
    @test data.S*data.S==Matrix{Cyclo16}(I,9,9)
    @test data.theta==[d.theta[a]*d.theta[b] for a in 1:3 for b in 1:3]
    @test data.order==:canonical_factorwise
    @test data.input_product_to_canonical==[1,3,2,4,6,5,7,9,8]
    @test data.input_labels_for_canonical[2]==["1","spin"]
    @test_throws MethodError IsingRecipe([[1,2,3]],[["1","sigma","psi"]])
    @test (data.S*Diagonal(data.theta))^3==ZETA16^2*Matrix{Cyclo16}(I,9,9)
    @test data.c==1
    @test data.character_T.vacuum_phase_exponent==-1//24
    @test findall(!iszero,data.fusion[5,5,:])==[1,3,7,9]
    @test_throws ArgumentError product_modular_data(compile_product([d,d,d]))
end
@testset "category-selected concrete Majorana towers" begin
    for k in 1:2
        recipe=compile_product(fill(ising_datum(),k))
        previous_error=Inf
        for M in (8,16)
            run=realize(recipe,M,[-2,-1,0,1,2])
            @test length(run.factors)==k
            @test length(run.total_modes[2])==k
            @test run.central_charge==k//2
            @test [t.factor for t in run.total_hamiltonian]==collect(1:k)
            central=0.0
            for f in run.factors
                H=f.hamiltonian;S=H.covariance;R=H.conjugation
                @test H.matrix==H.matrix'
                @test R*S*R==I-S
                @test tr(S*H.matrix)/2+H.scalar==0
                @test f.factor_modes[2].matrix'==f.factor_modes[-2].matrix
                # Spatial nearest-neighbour derivative, including AP seam and sign.
                @test f.spatial_one_particle[1,2]≈-im*M/(4pi)
                @test f.spatial_one_particle[M,1]≈im*M/(4pi)
                @test count(!iszero,f.spatial_one_particle)==2M
                @test f.spatial_quadratic_factor==1//2
                central+=FB.majorana_cocycle(f.factor_modes[2].matrix,f.factor_modes[-2].matrix,S)
                B=FB.mode(M,2;continuum=true);Bm=FB.mode(M,-2;continuum=true)
                @test FB.majorana_cocycle(B,Bm,S)==1//4
            end
            error=abs(central-k/4)
            @test error<previous_error
            previous_error=error
            @test run.refinement.materialized==(M==8)
        end
        J=refinement(recipe,8,16).factors[1].one_particle
        @test J'*J==I
        @test FB.inclusion(8,16)*FB.inclusion(4,8)==FB.inclusion(4,16)
        @test J'*FB.sea(16)*J==FB.sea(8)
    end
    @test_throws ArgumentError realize(compile_ising(ising_datum()),32,[0])
end

@testset "factorwise even observables and local sampling" begin
    recipe=compile_product([ising_datum(),ising_datum()])
    @test observable_word(recipe,Int[])
    @test observable_word(recipe,[1,1,2,2])
    @test !observable_word(recipe,[1,2]) # total-even would incorrectly admit this
    @test !observable_word(recipe,[1])
    @test length(local_observable_recipe(recipe,8).spatial_generators)==2*binomial(8,2)
    interval=(pi/2,3pi/2)
    f(x)=abs(2*(x-pi)/pi)<1 ? (1-(2*(x-pi)/pi)^2)^2 : 0.0
    # C1 compact polynomial is a finite sampler oracle. Exact Riemann sums
    # below are rational; its continuum norm integral is 128*pi/315.
    errors=Float64[]
    for M in (8,16)
        sampled=sample_local_field(M,f,interval)
        exact_values=[abs(4j//M-2)<1 ? (1-(4j//M-2)^2)^2 : 0//1 for j in 0:M-1]
        norm_oracle=(2pi/M)*sum(abs2,exact_values)
        @test isapprox(norm(sampled.spatial)^2,norm_oracle;atol=1e-11,rtol=0)
        @test isapprox(norm(sampled.momentum)^2,norm_oracle;atol=1e-11,rtol=0)
        @test all(i -> interval[1]<sampled.positions[i]<interval[2] || iszero(sampled.spatial[i]),1:M)
        coefficient=sqrt(2pi)/M*sum(exact_values[j+1]*exp(-im*(1//2)*2pi*j/M) for j in 0:M-1)
        half=findfirst(==(1//2),sampled.mode_labels)
        @test isapprox(sampled.momentum[half],coefficient;atol=1e-11,rtol=0)
        push!(errors,abs(norm_oracle-128pi/315))
    end
    @test errors[2]<errors[1]
    @test_throws ArgumentError sample_local_field(8,x->1.0,interval)
end
