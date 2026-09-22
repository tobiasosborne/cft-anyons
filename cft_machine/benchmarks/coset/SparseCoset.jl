module SparseCoset
# Source: research/coset_route.md; root CONVENTIONS (z).
# CAR sign: references/text/CFTFromLatticeFermions.txt:694-714, Eqs.(2)-(3).
export Vec, amp, basis, sea, ladder, current, stress, inner, norm2, add,
       refine, embed, orbital, max_states_seen
const Rat = Rational{BigInt}
const Amp = Complex{Rat}
const Vec = Dict{BigInt,Amp}
const max_states_seen = Ref(0)
amp(x) = convert(Amp,x)
basis(bits::Integer) = Vec(big(bits)=>amp(1))
function put!(out::Vec,b::BigInt,z)
    v = get(out,b,amp(0))+z
    iszero(v) ? delete!(out,b) : (out[b]=v)
    max_states_seen[] = max(max_states_seen[],length(out))
    @assert length(out)<=5000 "sparse state budget 5000 exceeded"
    out
end
function add(v::Vec,w::Vec,c=1)
    out=copy(v)
    for (b,z) in w; put!(out,b,c*z); end
    out
end
inner(v::Vec,w::Vec) = sum((conj(z)*get(w,b,amp(0)) for (b,z) in v);init=amp(0))
norm2(v::Vec) = real(inner(v,v))
occupied(b,i) = !iszero(b & (big(1)<<i))
function step(b::BigInt,i::Int,creation::Bool)
    @assert i>=0
    occupied(b,i)==creation && return nothing # Exact CAR annihilation, not an error.
    sign = isodd(count_ones(b & ((big(1)<<i)-1))) ? -1 : 1
    (xor(b,big(1)<<i),sign)
end
function ladder(v::Vec,i::Int,creation::Bool)
    out=Vec()
    for (b,z) in v
        s=step(b,i,creation)
        isnothing(s) || put!(out,s[1],s[2]*z)
    end
    out
end
orbital(M,u,j,f) = ((u-1)*M+j-1)*2+f-1
function valid(M,k)
    @assert M in (8,16) && k in (1,2) "physical budget: M=8,16; k=1,2"
end
function sea(M::Int,k::Int)
    valid(M,k); b=big(0)
    for u in 1:k+1,j in 1:M÷2,f in 1:2
        b |= big(1)<<orbital(M,u,j,f)
    end
    basis(b)
end
# Entries of t^a=sigma_a/2, exact including the imaginary Pauli matrix.
function entries(a::Int)
    h=big(1)//2
    a==1 && return ((1,2,amp(h)),(2,1,amp(h)))
    a==2 && return ((1,2,amp(-im*h)),(2,1,amp(im*h)))
    @assert a==3
    ((1,1,amp(h)),(2,2,amp(-h)))
end
function current(v::Vec,M::Int,k::Int,copies,p::Int,a::Int)
    valid(M,k); out=Vec(); es=entries(a)
    for (b,z) in v,u in copies,j in 1:M
        dest=j-p
        1<=dest<=M || continue # Required no-wrap finite section.
        for (f,g,t) in es
            s=step(b,orbital(M,u,j,g),false)
            isnothing(s) && continue
            q=step(s[1],orbital(M,u,dest,f),true)
            isnothing(q) || put!(out,q[1],z*t*s[2]*q[2])
        end
    end
    # Explicit sea normal-order subtraction; traceless su(2) makes it zero.
    if p==0
        scalar=sum((t for (f,g,t) in es if f==g);init=amp(0))*(M÷2)*length(copies)
        out=add(out,v,-scalar)
    end
    out
end
function sug(v::Vec,M,k,copies,level,n,R)
    out=Vec()
    for a in 1:3,p in -R:R
        abs(n-p)<=R || continue
        left,right = n-p>=0 ? (p,n-p) : (n-p,p)
        temp=current(v,M,k,copies,right,a)
        isempty(temp) && continue
        out=add(out,current(temp,M,k,copies,left,a),big(1)//(level+2))
    end
    out
end
function stress(v::Vec,M::Int,k::Int,n::Int,R::Int)
    @assert abs(n)<=3 && R in (3,4) "stress diagnostic mode/cutoff budget"
    a=sug(v,M,k,1:k,k,n,R)
    b=sug(v,M,k,(k+1):(k+1),1,n,R)
    d=sug(v,M,k,1:k+1,k+1,n,R)
    add(add(a,b),d,-1)
end
function embed(v::Vec,mapping::Vector{Int},added::BigInt,coarse_sea::BigInt)
    @assert issorted(mapping) && allunique(mapping) && all(i->i>=0,mapping)
    @assert added>=0 && coarse_sea>=0 && iszero(coarse_sea>>length(mapping))
    @assert all(i->!occupied(added,i),mapping)
    function phase(bits)
        count=sum((count_ones(added & ((big(1)<<mapping[j])-1))
                   for j in eachindex(mapping) if occupied(bits,j-1));init=0)
        isodd(count) ? -1 : 1
    end
    normphase=phase(coarse_sea); out=Vec()
    for (b,z) in v
        @assert b>=0 && iszero(b>>length(mapping)) "coarse bit lies outside embedding domain"
        fine=added
        for j in eachindex(mapping)
            occupied(b,j-1) && (fine |= big(1)<<mapping[j])
        end
        put!(out,fine,z*phase(b)*normphase)
    end
    out
end
function refine(v::Vec,M::Int,Q::Int,k::Int)
    valid(M,k); valid(Q,k); @assert Q>=M
    delta=(Q-M)÷2
    mapping=[orbital(Q,u,j+delta,f) for u in 1:k+1 for j in 1:M for f in 1:2]
    cs=only(keys(sea(M,k))); fs=only(keys(sea(Q,k)))
    image=big(0)
    for (i,pos) in enumerate(mapping)
        occupied(cs,i-1) && (image |= big(1)<<pos)
    end
    embed(v,mapping,xor(fs,image),cs)
end
end
