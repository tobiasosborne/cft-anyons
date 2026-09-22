module UnitizedOAR
using LinearAlgebra
export Stage, Element, unit, star, refine, expectation, metric_adjoint,
       hamiltonian, energy_commutator

# CONVENTIONS (aa); exact Gram-coordinate presentation of B(V_b) direct-sum C.
# Derivation: research/coset_observable_system.md (scalar augmentation).
const Rat=Rational{BigInt}
const Exact=Complex{Rat}
struct Stage
    grades::Vector{Int}
    gram::Matrix{Exact}
    vacuum::Vector{Exact}
    function Stage(grades,gram,vacuum)
        d=length(grades)
        @assert 1<=d<=16 "finite preview dimension must be in 1..16"
        @assert size(gram)==(d,d) && length(vacuum)==d "stage dimensions disagree"
        @assert all(g->g isa Integer && g>=0,grades) "nonnegative integer grades required"
        G=Exact.(gram); v=Exact.(vacuum)
        @assert G==G' "Gram matrix must be Hermitian"
        # A checked LDL* factorization is a constructive positivity certificate.
        residual=copy(G); L=Matrix{Exact}(I,d,d); diagonal=zeros(Rat,d)
        for j in 1:d
            pivot=residual[j,j]
            @assert isreal(pivot) && real(pivot)>0 "Gram matrix must be positive definite"
            diagonal[j]=real(pivot)
            for i in j+1:d
                L[i,j]=residual[i,j]/pivot
            end
            for i in j+1:d,k in j+1:d
                residual[i,k]-=L[i,j]*pivot*conj(L[k,j])
            end
        end
        @assert L*Diagonal(diagonal)*L'==G "Gram positivity factorization failed"
        @assert dot(v,G*v)==1 "vacuum must have Gram norm one"
        E=Diagonal(grades)
        @assert E*v==zeros(Int,d) "vacuum must have grade zero"
        @assert E*G==G*E "different grades must be Gram orthogonal"
        new(Int.(grades),G,v)
    end
end
struct Element
    matrix::Matrix{Exact}
    scalar::Exact
    function Element(matrix,scalar)
        @assert size(matrix,1)==size(matrix,2) "algebra block must be square"
        new(Exact.(matrix),Exact(scalar))
    end
end
Base.:(==)(a::Element,b::Element)=a.matrix==b.matrix && a.scalar==b.scalar
Base.:+(a::Element,b::Element)=Element(a.matrix+b.matrix,a.scalar+b.scalar)
Base.:-(a::Element,b::Element)=Element(a.matrix-b.matrix,a.scalar-b.scalar)
Base.:*(a::Element,b::Element)=Element(a.matrix*b.matrix,a.scalar*b.scalar)
function metric_adjoint(s::Stage,a::AbstractMatrix)
    @assert size(a)==size(s.gram) "operator and stage dimensions disagree"
    s.gram \ (Exact.(a)'*s.gram)
end
unit(s::Stage)=Element(Matrix{Int}(I,length(s.grades),length(s.grades)),1)
star(s::Stage,a::Element)=Element(metric_adjoint(s,a.matrix),conj(a.scalar))
function expectation(s::Stage,a::Element)
    @assert size(a.matrix)==size(s.gram) "operator and stage dimensions disagree"
    dot(s.vacuum,s.gram*a.matrix*s.vacuum)
end
function refine(s::Stage,t::Stage,J::AbstractMatrix,a::Element)
    @assert size(a.matrix)==size(s.gram) "coarse operator dimension mismatch"
    @assert size(J)==(length(t.grades),length(s.grades)) "refinement shape mismatch"
    V=Exact.(J)
    @assert V'*t.gram*V==s.gram "refinement must preserve the Gram metric"
    @assert V*s.vacuum==t.vacuum "refinement must preserve vacuum"
    @assert Diagonal(t.grades)*V==V*Diagonal(s.grades) "refinement must preserve grades"
    adj=s.gram \ (V'*t.gram)
    P=V*adj
    Element(V*a.matrix*adj+a.scalar*(I-P),a.scalar)
end
function hamiltonian(s::Stage,flag_energy::Integer)
    @assert flag_energy>maximum(s.grades) "flag energy must exceed retained grades"
    Element(Matrix(Diagonal(s.grades)),flag_energy)
end
function energy_commutator(s::Stage,a::Element)
    H=Matrix(Diagonal(s.grades))
    Element(H*a.matrix-a.matrix*H,0)
end
end
