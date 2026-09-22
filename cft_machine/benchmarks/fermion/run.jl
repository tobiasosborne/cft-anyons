using LinearAlgebra, TOML, SHA
include("FermionBenchmark.jl")
using .FermionBenchmark
include("WilsonStates.jl")
using .WilsonStates
BLAS.set_num_threads(1)
results = []
for M in (8,16,32)
    S = sea(M)
    for n in 1:3
        A, B = mode(M,n), mode(M,n;continuum=true)
        # A larger reference window captures any core-shift output.
        J = inclusion(M,2M)
        target = mode(2M,n;continuum=true)*J
        err = opnorm((J*A-target)[:,core(M)])
        bound = maximum(coefficient_bound(M,n,r) for r in momenta(M)[core(M)])
        # M=8,n=3 is intentionally outside the no-edge core hypothesis.
        core_inside = all(r -> first(momenta(M)) <= r-n <= last(momenta(M)),
                          momenta(M)[core(M)])
        central = cocycle(A,mode(M,-n),S)
        push!(results,Dict("sites"=>M,"mode"=>n,"epsilon"=>2pi/M,
            "core_error"=>err,"analytic_bound"=>bound,"core_inside"=>core_inside,
            "majorana_schwinger"=>majorana_cocycle(A,mode(M,-n),S),
            "majorana_continuum_schwinger"=>Float64((n^3-n)//24),
            "majorana_quadratic_terms"=>length(majorana_recipe(M,n).terms),
            "schwinger"=>central,"continuum_schwinger"=>Float64((n^3-n)//12),
            "wrapped_schwinger"=>cocycle(mode(M,n;wrap=true),mode(M,-n;wrap=true),S)))
    end
end
triangles = []
for M in (8,16), n in 1:2
    J = inclusion(M,2M)
    defect = opnorm((mode(2M,n)*J-J*mode(M,n))[:,core(M)])
    bound = maximum(coefficient_bound(M,n,r)+coefficient_bound(2M,n,r)
                    for r in momenta(M)[core(M)])
    push!(triangles,Dict("coarse_sites"=>M,"mode"=>n,"defect"=>defect,"bound"=>bound))
end
wilson = []
for M in (4,8), Q in (M,2M,4M)
    error = opnorm(covariance_row(M,Q)-continuum_covariance(M))
    push!(wilson,Dict("coarse_momenta"=>M,"fine_momenta"=>Q,
        "covariance_error"=>error,
        "covariance_bound"=>(2pi/Q)*maximum(abs,momenta(M))/4,
        "dual_state_tail_bound"=>state_tail(M,Q)))
end
out = joinpath(@__DIR__,"runs","2026-09-22","results.toml")
open(out,"w") do io
    TOML.print(io,Dict("julia"=>string(VERSION),"blas_threads"=>BLAS.get_num_threads(),
        "status"=>"source-formula benchmark; category realization not certified",
        "source_sha256"=>bytes2hex(sha256(read(joinpath(@__DIR__,"FermionBenchmark.jl")))),
        "wilson_source_sha256"=>bytes2hex(sha256(read(joinpath(@__DIR__,"WilsonStates.jl")))),
        "modes"=>results,"triangles"=>triangles,"wilson_rows"=>wilson))
end
println("Wrote ",out)
