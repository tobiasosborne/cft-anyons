# Concrete recipes invoke the independently implemented Majorana backend.
# Source OS Eqs. (19),(20),(26),(110),(197)-(199); CONVENTIONS (w),(y).
# Each factor is retained: the total stress alone generates a smaller net.
const COMPILER_ATOL=1e-11
function spatial_hamiltonian(M::Int)
    epsilon=2pi/M
    forward=zeros(ComplexF64,M,M)
    for x in 1:M-1
        forward[x,x+1]=1
    end
    forward[M,1]=-1 # antiperiodic seam
    (forward-forward')/(2im*epsilon)
end
function refinement(recipe::IsingRecipe,M::Int,Q::Int)
    J=FermionBenchmark.inclusion(M,Q)
    R=FermionBenchmark.charge_conjugation
    @assert J'*J==Matrix{Int}(I,M,M) "CAR refinement must be isometric"
    @assert J*R(M)==R(Q)*J "CAR refinement must preserve conjugation"
    @assert J'*FermionBenchmark.sea(Q)*J==FermionBenchmark.sea(M) "sea must pull back"
    (; factors=[(;factor=f,one_particle=copy(J),
        generator_action="Psi_f(v) -> Psi_f(J*v)") for f in eachindex(recipe.input_labels)],
       algebra_action=:unital_self_dual_CAR_homomorphism,
       observable_action=:restriction_to_factorwise_parity_fixed_points,
       state_action=:compatible_quasifree_covariance_pullback)
end
function realize(recipe::IsingRecipe,M::Int,mode_numbers::AbstractVector{Int};max_factors=2)
    1<=length(recipe.input_labels)<=max_factors || throw(ArgumentError("factor count exceeds finite-preview budget"))
    M in (4,8,16) || throw(ArgumentError("compiler finite preview permits M=4,8,16 only"))
    length(unique(mode_numbers))==length(mode_numbers) || throw(ArgumentError("distinct mode numbers required"))
    rs=FermionBenchmark.momenta(M)
    U=ComplexF64[exp(2pi*im*x*r/M)/sqrt(M) for x in 0:M-1,r in rs]
    factors=map(eachindex(recipe.input_labels)) do f
        H=FermionBenchmark.majorana_recipe(M,0)
        modes=Dict(n=>FermionBenchmark.majorana_recipe(M,n) for n in mode_numbers)
        Aposition=spatial_hamiltonian(M)
        @assert isapprox(U*H.matrix*U',Aposition;atol=COMPILER_ATOL,rtol=0) "sine Hamiltonian must be AP nearest-neighbor"
        (;factor=f,site_count=M,input_labels=recipe.input_labels[f],
          input_to_canonical=recipe.input_to_canonical[f],hamiltonian=H,
          factor_modes=modes,spatial_one_particle=Aposition,
          spatial_quadratic_factor=1//2,
          state=(kind=:quasifree_self_dual_CAR,covariance=H.covariance),
          local_target=:vacuum_cyclic_Virasoro_net_c_half,
          theorem="OS Theorem 4.11/self-dual specialization and Theorem 6.3; KL c<1 DHR identification")
    end
    # These are concrete placed sums, not tensor-product matrices.
    total_hamiltonian=[(;factor=f.factor,quadratic=f.hamiltonian) for f in factors]
    total_modes=Dict(n=>[(;factor=f.factor,quadratic=f.factor_modes[n]) for f in factors] for n in mode_numbers)
    next_refinement=(next_sites=2M, rule="Psi_f(e_r) -> Psi_f(e_r) at the same half-integer label",
                     materialized=2M<=16,
                     finite_preview=2M<=16 ? refinement(recipe,M,2M) : :outside_run_budget)
    (; factors,total_hamiltonian,total_modes,refinement=next_refinement,
       central_charge=BigInt(length(factors))//BigInt(2),
       target=:tensor_product_of_factor_resolved_local_Virasoro_nets,
       observable_algebra=local_observable_recipe(recipe,M),
       microscopic_algebra=:graded_tensor_product_self_dual_CAR,
       observable_policy=:factorwise_even_CAR_with_all_factor_stress_families)
end
