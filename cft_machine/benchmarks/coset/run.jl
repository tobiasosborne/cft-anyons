using TOML, SHA
include("SparseCoset.jl")
using .SparseCoset
rows=[]
for k in (1,2), M in (8,16), n in (2,3), R in (3,4)
    c=1-big(6)//((k+2)*(k+3))
    v=stress(sea(M,k),M,k,-n,R)
    expected=c*(n^3-n)/12
    @assert norm2(v)==expected "source GKO vacuum norm mismatch"
    push!(rows,Dict("level"=>k,"minimal_m"=>k+2,"sites"=>M,"mode"=>-n,
        "current_cutoff"=>R,"central_charge"=>string(c),"norm_squared"=>string(norm2(v)),
        "source_expected"=>string(expected),"sparse_terms"=>length(v),
        "occupation_bits"=>2M*(k+1),"general_CR2_threshold"=>(R>n && M//2-1//2>2R),
        "vacuum_CR3_threshold"=>(R>=n && M//2-1//2>n)))
end
out=joinpath(@__DIR__,"runs","2026-09-22","results.toml")
open(out,"w") do io
    TOML.print(io,Dict("status"=>"exact sparse coset vacuum witnesses; local lattice CFT not certified",
        "julia"=>string(VERSION),"arithmetic"=>"Complex{Rational{BigInt}}",
        "maximum_intermediate_states"=>max_states_seen[],"state_budget"=>5000,
        "code_sha256"=>bytes2hex(sha256(read(joinpath(@__DIR__,"SparseCoset.jl")))),"rows"=>rows))
end
println("Wrote ",out,"; max sparse states=",max_states_seen[])
