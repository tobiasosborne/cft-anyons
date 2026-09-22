module CosetTower
using LinearAlgebra
include("UnitizedOAR.jl")
include("../coset_hamiltonian/CosetHamiltonian.jl")
using .UnitizedOAR
const CH=CosetHamiltonian
const SC=CH.SparseCoset
export stage_data, connecting_matrix, compressed_mode

# Actual low-grade sparse-CAR descendants; conventions (aa), CH-2 and CR-3.
function stage_data(M::Int,k::Int,b::Int)
    data=CH.basis_data(M,k,b)
    vacuum=zeros(Int,length(data.grades));vacuum[1]=1
    stage=Stage(data.grades,data.gram,vacuum)
    (;data,stage)
end
function connecting_matrix(coarse,fine)
    a,b=coarse.data,fine.data
    @assert a.k==b.k && a.b<=b.b && a.M<=b.M "nested same-level stages required"
    J=zeros(Complex{Rational{BigInt}},length(b.grades),length(a.grades))
    for j in eachindex(a.vectors)
        mapped=SC.refine(a.vectors[j],a.M,b.M,a.k)
        overlaps=[SC.inner(v,mapped) for v in b.vectors]
        J[:,j]=b.gram \ overlaps
        rebuilt=SC.Vec()
        for i in eachindex(b.vectors)
            rebuilt=SC.add(rebuilt,b.vectors[i],J[i,j])
        end
        @assert rebuilt==mapped "fine descendant basis does not contain refined vector"
    end
    J
end
function compressed_mode(input,n::Int)
    data=input.data
    @assert abs(n)<=3 "low-grade preview mode budget is |n|<=3"
    overlaps=zeros(eltype(data.gram),length(data.vectors),length(data.vectors))
    for (j,w) in enumerate(data.vectors)
        # CR-2: [E,C_n]=-n C_n, exactly even before taking a limit.
        data.grades[j]-n in data.grades || continue
        image=SC.stress(w,data.M,data.k,n,data.R)
        for (i,v) in enumerate(data.vectors)
            overlaps[i,j]=SC.inner(v,image)
        end
    end
    data.gram \ overlaps
end
end
