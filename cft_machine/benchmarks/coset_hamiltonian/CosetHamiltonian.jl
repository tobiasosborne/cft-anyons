module CosetHamiltonian
include("../coset/SparseCoset.jl")
using .SparseCoset
export basis_data, polarized, project, regularized, energy
# Source: research/coset_hamiltonian.md CH-1, CONVENTIONS (aa).
function polarized(M::Int)
    @assert M in (8,16)
    bits=big(0)
    for u in 1:2,j in 1:M
        bits |= big(1)<<orbital(M,u,j,1)
    end
    basis(bits)
end
# CH-2 and CR-3: complete independent basis at grades <=3.
# Metric is retained; no irrational normalization or floating rank decision.
function basis_data(M::Int,k::Int,b::Int;R::Int=3)
    @assert M in (8,16) && k in (1,2) && 0<=b<=3 && R in (3,4)
    omega=sea(M,k); vectors=[omega]; grades=[0]
    for n in 2:b
        @assert R>=n && M//2-1//2>n "CR-3 vacuum safe window failed"
        push!(vectors,stress(omega,M,k,-n,R)); push!(grades,n)
    end
    gram=[inner(v,w) for v in vectors,w in vectors]
    for i in eachindex(vectors),j in eachindex(vectors)
        @assert i==j ? (isreal(gram[i,i]) && real(gram[i,i])>0) : iszero(gram[i,j])
    end
    (;vectors,gram,grades,M,k,b,R)
end
function project(v::Vec,data)
    out=Vec()
    for (i,u) in enumerate(data.vectors)
        out=add(out,u,inner(u,v)/data.gram[i,i])
    end
    out
end
# CH-3: exact positive energy-block repair, not the original quartic operator.
function regularized(v::Vec,data)
    p=project(v,data); graded=Vec()
    for (i,u) in enumerate(data.vectors)
        graded=add(graded,u,data.grades[i]*inner(u,v)/data.gram[i,i])
    end
    penalty=data.b+1
    add(graded,add(v,p,-1),penalty)
end
function energy(v::Vec,M::Int,k::Int)
    @assert M in (8,16) && k in (1,2)
    out=Vec()
    for (bits,z) in v
        e=big(0)//1
        for u in 1:k+1,j in 1:M,f in 1:2
            r=big(2j-M-1)//2
            occ=SparseCoset.occupied(bits,orbital(M,u,j,f))
            e += r>0 ? r*occ : (-r)*(!occ)
        end
        out=add(out,basis(bits),e*z)
    end
    out
end
end
