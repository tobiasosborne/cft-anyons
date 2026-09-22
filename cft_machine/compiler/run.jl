using TOML, LinearAlgebra, SHA
include("IsingCompiler.jl")
using .IsingCompiler
const FB=IsingCompiler.FermionBenchmark
out=joinpath(@__DIR__,"runs","2026-09-22")
mkpath(out)
rows=Dict{String,Any}[]; recipes=Dict{String,Any}[]
for k in 1:2
    # Input labels deliberately differ in factor 2, so matching is exercised.
    factors=[f==1 ? ising_datum() : relabel(ising_datum(),[1,3,2];
        labels=["vacuum","fermion","spin"]) for f in 1:k]
    compiler=compile_product(factors)
    modular=product_modular_data(compiler)
    for M in (8,16)
        run=realize(compiler,M,[-2,-1,0,1,2])
        central=sum(FB.majorana_cocycle(f.factor_modes[2].matrix,
                    f.factor_modes[-2].matrix,f.state.covariance) for f in run.factors)
        push!(rows,Dict("factors"=>k,"sites_per_factor"=>M,"rank"=>3^k,
            "central_charge"=>string(modular.c),"n2_finite_schwinger"=>central,
            "n2_exact_limit"=>k/4,"exact_modular_data_match"=>true,
            "materialized_refinement"=>run.refinement.materialized,
            "target"=>string(run.target)))
        factor_outputs=Dict{String,Any}[]
        for f in run.factors
            mode_outputs=Dict{String,Any}[]
            for n in sort(collect(keys(f.factor_modes)))
                q=f.factor_modes[n]
                push!(mode_outputs,Dict("mode"=>n,"normal_order_scalar"=>q.scalar,
                    "terms"=>[Dict("row"=>t.row,"column"=>t.column,
                                "coefficient"=>t.coefficient) for t in q.terms]))
            end
            push!(factor_outputs,Dict("placement"=>f.factor,"input_labels"=>f.input_labels,
                "input_to_canonical"=>f.input_to_canonical,"hamiltonian_mode"=>0,
                "quadratic_convention"=>"sum a_ij Psi(e_i)^* Psi(e_j) + scalar I",
                "modes"=>mode_outputs,"momentum_labels"=>string.(FB.momenta(M)),
                "conjugation_permutation"=>collect(M:-1:1),
                "sea_diagonal"=>collect(diag(f.state.covariance)),
                "spatial_hamiltonian"=>[Dict("row"=>i,"column"=>j,
                    "real"=>real(f.spatial_one_particle[i,j]),
                    "imag"=>imag(f.spatial_one_particle[i,j]))
                    for i in 1:M for j in 1:M if !iszero(f.spatial_one_particle[i,j])],
                "spatial_selfdual_quadratic_factor"=>"1//2"))
        end
        next=Dict{String,Any}("target_sites"=>2M,"rule"=>run.refinement.rule,
                             "materialized"=>run.refinement.materialized)
        if run.refinement.materialized
            J=run.refinement.finite_preview.factors[1].one_particle
            next["nonzero_entries"]=[Dict("row"=>i,"column"=>j,"value"=>J[i,j])
                                      for i in axes(J,1) for j in axes(J,2) if J[i,j]!=0]
        end
        push!(recipes,Dict("factors"=>k,"sites_per_factor"=>M,
            "category_S"=>[[exact_string(modular.S[i,j]) for j in axes(modular.S,2)] for i in axes(modular.S,1)],
            "category_twists"=>exact_string.(modular.theta),
            "character_vacuum_phase_exponent"=>string(modular.character_T.vacuum_phase_exponent),
            "sector_labels"=>modular.labels,"sector_order"=>string(modular.order),
            "input_labels_for_canonical"=>modular.input_labels_for_canonical,
            "input_product_to_canonical"=>modular.input_product_to_canonical,"factor_recipes"=>factor_outputs,
            "next_refinement"=>next,
            "observable_algebra"=>string(run.observable_algebra.algebra),
            "independent_parity_factors"=>length(run.observable_algebra.parity_group),
            "local_generators"=>[Dict("factor"=>g.factor,"sites"=>collect(g.sites),
                "coefficient"=>"i","word"=>"Psi_x Psi_y") for g in run.observable_algebra.spatial_generators],
            "local_reconstruction"=>string(run.observable_algebra.local_reconstruction),
            "total_mode_rule"=>"sum the placed factor modes; retain individual families"))
    end
end
repo=normpath(joinpath(@__DIR__,"../.."))
source_files=[joinpath(@__DIR__,f) for f in ("Cyclo16.jl","ModularInput.jl","Microscopic.jl",
               "LocalObservables.jl","IsingCompiler.jl","run.jl","test.jl")]
push!(source_files,normpath(joinpath(@__DIR__,"../benchmarks/fermion/FermionBenchmark.jl")))
source_sha256=Dict(relpath(p,repo)=>bytes2hex(sha256(read(p))) for p in source_files)
open(joinpath(out,"results.toml"),"w") do io
    TOML.print(io,Dict("julia_version"=>string(VERSION),"blas_threads"=>BLAS.get_num_threads(),
        "source_sha256"=>source_sha256,
        "scope"=>"exact Ising input matching; supported theorem application and finite microscopic witnesses",
        "samples"=>rows);sorted=true)
end
open(joinpath(out,"recipes.toml"),"w") do io
    TOML.print(io,Dict("recipes"=>recipes);sorted=true)
end
println("Wrote ",length(rows)," supported Ising/product instances; k<=2, M<=16; no many-body matrices.")
