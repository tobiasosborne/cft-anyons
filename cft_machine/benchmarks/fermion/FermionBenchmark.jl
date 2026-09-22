module FermionBenchmark
using LinearAlgebra
export momenta, mode, inclusion, sea, cocycle, dirac, coefficient_bound, core
export charge_conjugation, majorana_cocycle, majorana_recipe
# Source: references/text/CFTFromLatticeFermions.txt:953, Eq. (37).
function momenta(M::Int)
    @assert 4 <= M <= 64 && iseven(M) "even one-particle dimension 4..64 required"
    collect((-M+1):2:(M-1)) .// 2
end
# Source: same:3380-3420, Eqs. (197)-(199); CONVENTIONS (w).
# continuum=true is the exact rational compression of Eq. (181).
function mode(M::Int, n::Int; continuum=false, wrap=false)
    rs = momenta(M)
    A = continuum ? zeros(Rational{Int}, M, M) : zeros(M, M)
    epsilon = 2pi/M
    for (j,r) in enumerate(rs)
        i = j-n
        if wrap || 1 <= i <= M
            q = r-n//2
            A[mod1(i,M),j] = continuum ? q : cos(epsilon*n/4)^2*sin(epsilon*q)/epsilon
        end
    end
    A
end
# Source: same:1845-1877, Eq. (110), Prop. 3.10 in normalized coordinates.
function inclusion(M::Int, Q::Int)
    @assert Q >= M && iseven(Q) "nested even momentum windows required"
    small, big = momenta(M), momenta(Q)
    J = zeros(Int,Q,M)
    for (j,r) in enumerate(small)
        J[only(findall(==(r),big)),j] = 1
    end
    J
end
sea(M) = Diagonal(Int.(momenta(M) .< 0))
core(M, cutoff=3//2) = findall(r -> abs(r) <= cutoff, momenta(M))
# Source: same:886, Eq. (27). Keep both off-diagonal products explicit.
function cocycle(A,B,S)
    C = I-S
    tr(S*A*C*B*S-S*B*C*A*S)
end
# Source: same:1020-1041, Eqs. (45)-(46), mass lambda=0.
function dirac(M::Int)
    @assert 2M <= 64 "Dirac single-particle budget is 64"
    epsilon = 2pi/M
    H = zeros(ComplexF64,2M,2M)
    for (j,r) in enumerate(momenta(M))
        z = (exp(-im*epsilon*r)-1)/epsilon
        H[2j-1,2j] = z
        H[2j,2j-1] = conj(z)
    end
    H
end
# Source: same:830-840, Eqs. (19)-(20). Gamma = reflection * conjugation.
charge_conjugation(M::Int) = reverse(Matrix{Int}(I,M,M); dims=1)
# Source: same:892, Eq. (28); exact rational factor is intentional.
majorana_cocycle(A,B,S) = (1//2)*cocycle(A,B,S)
# Formal self-dual CAR polynomial, not a many-body representation:
# sum t.coefficient * Psi(e_t.row)^* Psi(e_t.column) + scalar*1.
# Source: same:837-840,879-881, Eqs. (20),(26).
function majorana_recipe(M::Int,n::Int; continuum=false)
    A, R, S = mode(M,n;continuum), charge_conjugation(M), sea(M)
    @assert isapprox(R*conj(A')*R,-A; atol=1e-11) "self-dual constraint failed"
    terms = [(row=i,column=j,coefficient=(1//2)*A[i,j])
             for i in 1:M for j in 1:M if !iszero(A[i,j])]
    (; matrix=A, conjugation=R, covariance=S, terms,
       scalar=-(1//2)*tr(S*A), algebra=:self_dual_CAR,
       ordering=:normal_ordered, parity=:even)
end
# Local derivation: PROOF.md <1>3. No empirical fit enters this bound.
coefficient_bound(M,n,r) = (2pi/M)^2*(abs(r-n//2)^3/6+n^2*abs(r-n//2)/16)
end
