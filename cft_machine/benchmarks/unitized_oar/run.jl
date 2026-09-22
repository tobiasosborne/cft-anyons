using TOML,SHA
include("CosetTower.jl")
using .CosetTower
using .CosetTower.UnitizedOAR
rows=[]
for k in (1,2), b in 0:3
    coarse=stage_data(8,k,b);fine=stage_data(16,k,min(b+1,3))
    s,t=coarse.stage,fine.stage;J=connecting_matrix(coarse,fine)
    h=hamiltonian(s,b+1)
    a=Element([i+im*j for i in eachindex(s.grades),j in eachindex(s.grades)],2)
    @assert refine(s,t,J,unit(s))==unit(t)
    @assert refine(s,t,J,star(s,a)*a)==star(t,refine(s,t,J,a))*refine(s,t,J,a)
    @assert energy_commutator(t,refine(s,t,J,a))==refine(s,t,J,energy_commutator(s,a))
    push!(rows,Dict("coset_level"=>k,"cutoff_grade"=>b,"grades"=>s.grades,
        "gram"=>[[string(z) for z in s.gram[i,:]] for i in axes(s.gram,1)],
        "hamiltonian_flag_energy"=>string(h.scalar),
        "hamiltonian_vacuum_expectation"=>string(expectation(s,h)),
        "coarse_sites"=>8,"fine_sites"=>16,
        "unit_preserved"=>true,"multiplication_preserved"=>true,
        "dynamics_derivation_preserved"=>true))
end
files=[joinpath(@__DIR__,n) for n in ("UnitizedOAR.jl","CosetTower.jl","run.jl","test.jl","test_descendants.jl")]
append!(files,[joinpath(@__DIR__,"../coset_hamiltonian/CosetHamiltonian.jl"),
               joinpath(@__DIR__,"../coset/SparseCoset.jl")])
hashes=Dict(relpath(abspath(p),pwd())=>bytes2hex(sha256(read(p))) for p in files)
out=joinpath(@__DIR__,"runs","2026-09-22","results.toml")
open(out,"w") do io
    TOML.print(io,Dict("julia"=>string(VERSION),"source_sha256"=>hashes,
       "scope"=>"exact constrained finite-algebra OAR; fusion-space locality unproved",
       "stages"=>rows);sorted=true)
end
println("Wrote ",length(rows)," exact finite-algebra stages to ",out)
