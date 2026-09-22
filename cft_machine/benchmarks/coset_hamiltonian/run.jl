using TOML,SHA
include("CosetHamiltonian.jl")
using .CosetHamiltonian, .CosetHamiltonian.SparseCoset
raw=[]
for M in (8,16),R in (3,4)
    v=polarized(M); observed=inner(v,stress(v,M,1,0,R))
    expected=-big((M-R)*(M-R-1))//12
    @assert observed==expected && real(observed)<0
    push!(raw,Dict("sites"=>M,"current_cutoff"=>R,"level"=>1,
        "raw_energy"=>string(real(observed)),"derived_energy"=>string(expected),
        "state_auxiliary_energy"=>string(real(inner(v,energy(v,M,1))))))
end
spaces=[]
for k in (1,2),M in (8,16),b in 0:3
    d=basis_data(M,k,b)
    @assert isempty(regularized(sea(M,k),d))
    push!(spaces,Dict("level"=>k,"sites"=>M,"cutoff_b"=>b,
        "dimension"=>length(d.vectors),"grades"=>d.grades,
        "gram_diagonal"=>[string(real(d.gram[i,i])) for i in eachindex(d.vectors)],
        "sparse_terms"=>length.(d.vectors),"penalty"=>b+1,
        "complete_through_b3"=>true,"cutoff_source"=>"CR-3 plus CH-2 grade<=3 reduction"))
end
out=joinpath(@__DIR__,"runs","2026-09-22","results.toml")
open(out,"w") do io
    TOML.print(io,Dict("status"=>"raw zero mode not positive; extracted nonlocal Hamiltonian positive",
        "julia"=>string(VERSION),"arithmetic"=>"Complex{Rational{BigInt}}",
        "maximum_intermediate_states"=>max_states_seen[],"state_budget"=>5000,
        "helper_sha256"=>bytes2hex(sha256(read(joinpath(@__DIR__,"CosetHamiltonian.jl")))),
        "sparse_coset_sha256"=>bytes2hex(sha256(read(joinpath(@__DIR__,"../coset/SparseCoset.jl")))),
        "raw_witnesses"=>raw,"vacuum_spaces"=>spaces))
end
println("Wrote ",out,"; max sparse states=",max_states_seen[])
