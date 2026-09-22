# Sources: RSWfinal3.tex:2441-2474; KL source.tex:647-669,1106-1157.
# Full paths and theorem applications are in PROOF.md; CONVENTIONS (y).
struct UnsupportedCategory <: Exception
    message::String
end
Base.showerror(io::IO,e::UnsupportedCategory) = print(io,e.message)
struct ModularDatum
    labels::Vector{String}
    S::Matrix{Cyclo16}
    theta::Vector{Cyclo16}
    fusion::Array{Int,3}
    c::BigRat
    function ModularDatum(labels,S,theta,fusion,c::Union{Integer,Rational})
        n=length(labels)
        n>0 && length(unique(labels))==n || throw(ArgumentError("distinct unit-first labels required"))
        size(S)==(n,n) && length(theta)==n && size(fusion)==(n,n,n) ||
            throw(DimensionMismatch("inconsistent modular datum sizes"))
        all(x -> x isa Cyclo16 || x isa Integer || x isa Rational,S) ||
            throw(ArgumentError("S must use exact Cyclo16/rational entries"))
        all(x -> x isa Cyclo16 || x isa Integer || x isa Rational,theta) ||
            throw(ArgumentError("twists must use exact Cyclo16/rational entries"))
        all(x -> x isa Integer && x>=0,fusion) || throw(ArgumentError("fusion multiplicities must be nonnegative integers"))
        new(String.(labels),Cyclo16.(S),Cyclo16.(theta),Int.(fusion),BigRat(c))
    end
end
Cyclo16(a::Cyclo16)=a
function ising_datum()
    S = Cyclo16[1 SQRT2 1; SQRT2 0 -SQRT2; 1 -SQRT2 1]./2
    theta = Cyclo16[1,ZETA16,-1]
    N=zeros(Int,3,3,3)
    for a in 1:3
        N[1,a,a]=1; N[a,1,a]=1
    end
    N[2,2,1]=1;N[2,2,3]=1;N[2,3,2]=1;N[3,2,2]=1;N[3,3,1]=1
    ModularDatum(["1","sigma","psi"],S,theta,N,1//2)
end
function relabel(d::ModularDatum,p::Vector{Int};labels=d.labels[p])
    sort(p)==collect(eachindex(d.labels)) && p[1]==1 ||
        throw(ArgumentError("permutation must preserve the unit at index 1"))
    ModularDatum(labels,d.S[p,p],d.theta[p],d.fusion[p,p,p],d.c)
end
struct IsingRecipe
    # Maps each factor's input order to canonical (1,sigma,psi).
    input_to_canonical::Vector{Vector{Int}}
    input_labels::Vector{Vector{String}}
    function IsingRecipe(factors::AbstractVector{ModularDatum})
        isempty(factors) && throw(ArgumentError("at least one explicit Ising factor required"))
        new([match_ising(d) for d in factors],[copy(d.labels) for d in factors])
    end
end
function match_ising(d::ModularDatum)
    length(d.labels)==3 || throw(UnsupportedCategory("supported seed has exactly three sectors"))
    ref=ising_datum()
    for p in ([1,2,3],[1,3,2])
        if d.S==ref.S[p,p] && d.theta==ref.theta[p] &&
                d.fusion==ref.fusion[p,p,p] && d.c==ref.c
            return p
        end
    end
    throw(UnsupportedCategory("unsupported exact S, twists, fusion or real c; Ising fusion alone is insufficient"))
end
compile_ising(d::ModularDatum)=IsingRecipe([d])
function compile_product(factors::AbstractVector{ModularDatum})
    IsingRecipe(factors)
end
# Product expansion is a bounded diagnostic, not factorization inference.
function product_modular_data(recipe::IsingRecipe;maxrank=9)
    k=length(recipe.input_labels)
    big(3)^k<=maxrank || throw(ArgumentError("product rank exceeds declared expansion budget"))
    labels=[Int[]]
    for _ in 1:k
        labels=[vcat(t,a) for t in labels for a in 1:3]
    end
    ref=ising_datum(); n=length(labels)
    S=Matrix{Cyclo16}(undef,n,n); theta=Vector{Cyclo16}(undef,n)
    N=zeros(Int,n,n,n)
    for a in 1:n
        theta[a]=prod(ref.theta[labels[a][f]] for f in 1:k)
        for b in 1:n
            S[a,b]=prod(ref.S[labels[a][f],labels[b][f]] for f in 1:k)
            for c in 1:n
                N[a,b,c]=prod(ref.fusion[labels[a][f],labels[b][f],labels[c][f]] for f in 1:k)
            end
        end
    end
    c=BigInt(k)//BigInt(2)
    input_labels_for_canonical=[[recipe.input_labels[f][invperm(recipe.input_to_canonical[f])[t[f]]] for f in 1:k] for t in labels]
    input_product_to_canonical=[1+sum((recipe.input_to_canonical[f][t[f]]-1)*3^(k-f) for f in 1:k) for t in labels]
    (;labels,order=:canonical_factorwise,input_labels_for_canonical,input_product_to_canonical,
      S,theta,fusion=N,c,character_T=(vacuum_phase_exponent=-c/24,twists=theta))
end
# Independent oracle: source minimal-model fusion formula at m=3.
function minimal_model_fusion(pq,pqprime;m=3)
    p,q=pq; pp,qq=pqprime
    terms=Tuple{Int,Int}[]
    for r in abs(p-pp)+1:2:min(p+pp-1,2m-p-pp-1)
        for s in abs(q-qq)+1:2:min(q+qq-1,2(m+1)-q-qq-1)
            pair=r==1 ? (r,s) : (m-r,m+1-s)
            push!(terms,pair)
        end
    end
    terms
end
