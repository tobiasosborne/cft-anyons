# Exact Q(zeta_16), zeta_16^8=-1. CONVENTIONS (y).
# Algebraic presentations from the registered RSW Ising data; arithmetic
# below is a local polynomial reduction, checked by independent identities.
struct Cyclo16 <: Number
    coefficients::NTuple{8,Rational{BigInt}}
end
const BigRat = Rational{BigInt}
Cyclo16(x::Union{Integer,Rational}) =
    Cyclo16(ntuple(i -> i == 1 ? BigRat(x) : BigRat(0), 8))
Base.convert(::Type{Cyclo16}, x::Union{Integer,Rational}) = Cyclo16(x)
Base.convert(::Type{Cyclo16}, x::Cyclo16) = x
Base.promote_rule(::Type{Cyclo16}, ::Type{T}) where {T<:Integer} = Cyclo16
Base.promote_rule(::Type{Cyclo16}, ::Type{Rational{T}}) where {T<:Integer} = Cyclo16
Base.zero(::Type{Cyclo16}) = Cyclo16(0)
Base.zero(::Cyclo16) = Cyclo16(0)
Base.one(::Type{Cyclo16}) = Cyclo16(1)
Base.one(::Cyclo16) = Cyclo16(1)
Base.iszero(a::Cyclo16) = all(iszero, a.coefficients)
Base.:(==)(a::Cyclo16,b::Cyclo16) = a.coefficients == b.coefficients
Base.:(==)(a::Cyclo16,b::Union{Integer,Rational}) = a == Cyclo16(b)
Base.:(==)(a::Union{Integer,Rational},b::Cyclo16) = Cyclo16(a) == b
Base.:+(a::Cyclo16,b::Cyclo16) =
    Cyclo16(ntuple(i -> a.coefficients[i]+b.coefficients[i],8))
Base.:-(a::Cyclo16) = Cyclo16(ntuple(i -> -a.coefficients[i],8))
Base.:-(a::Cyclo16,b::Cyclo16) = a + (-b)
function Base.:*(a::Cyclo16,b::Cyclo16)
    c = zeros(BigRat,8)
    for i in 0:7, j in 0:7
        d = i+j
        c[mod(d,8)+1] += (d<8 ? 1 : -1)*a.coefficients[i+1]*b.coefficients[j+1]
    end
    Cyclo16(Tuple(c))
end
for op in (:+,:-,:*)
    @eval Base.$op(a::Cyclo16,b::Union{Integer,Rational}) = Base.$op(a,Cyclo16(b))
    @eval Base.$op(a::Union{Integer,Rational},b::Cyclo16) = Base.$op(Cyclo16(a),b)
end
function Base.:/(a::Cyclo16,b::Union{Integer,Rational})
    iszero(b) && throw(DivideError())
    Cyclo16(ntuple(i -> a.coefficients[i]/BigRat(b),8))
end
function Base.:^(a::Cyclo16,n::Integer)
    n >= 0 || throw(ArgumentError("negative field powers not implemented"))
    b, x = one(Cyclo16), a
    while n > 0
        isodd(n) && (b *= x)
        n >>= 1
        n > 0 && (x *= x)
    end
    b
end
Base.conj(a::Cyclo16) = Cyclo16(ntuple(i ->
    i == 1 ? a.coefficients[1] : -a.coefficients[10-i],8))
Base.adjoint(a::Cyclo16) = conj(a)
Base.transpose(a::Cyclo16) = a
const ZETA16 = Cyclo16(ntuple(i -> BigRat(i==2),8))
const SQRT2 = ZETA16^2-ZETA16^6
complex_value(a::Cyclo16) = sum(ComplexF64(a.coefficients[i])*cispi((i-1)/8) for i in 1:8)
function exact_string(a::Cyclo16)
    terms = ["($(a.coefficients[i]))*z^$(i-1)" for i in 1:8 if !iszero(a.coefficients[i])]
    isempty(terms) ? "0" : join(terms," + ")
end
Base.show(io::IO,a::Cyclo16) = print(io,exact_string(a))
