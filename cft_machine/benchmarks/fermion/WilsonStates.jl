module WilsonStates
using LinearAlgebra
using ..FermionBenchmark: momenta, dirac, inclusion
export covariance, continuum_covariance, dirac_inclusion, covariance_row, state_tail
# Source: references/text/CFTFromLatticeFermions.txt Eqs.(45)-(48),(7).
# Negative-energy spectral projection of the actual finite Dirac Hamiltonian.
function covariance(M::Int)
    H, eps = dirac(M),2pi/M
    P = zeros(ComplexF64,2M,2M)
    for (j,r) in enumerate(momenta(M))
        ix = 2j-1:2j
        E = 2abs(sin(eps*r/2))/eps
        P[ix,ix] = (I-H[ix,ix]/E)/2
    end
    P
end
function continuum_covariance(M::Int)
    P = zeros(ComplexF64,2M,2M)
    sigma_y = [0 -im; im 0]
    for (j,r) in enumerate(momenta(M))
        P[2j-1:2j,2j-1:2j] = (I-sign(r)*sigma_y)/2
    end
    P
end
dirac_inclusion(M::Int,Q::Int) = kron(inclusion(M,Q), Matrix{Int}(I,2,2))
function covariance_row(M::Int,Q::Int)
    J = dirac_inclusion(M,Q)
    J'*covariance(Q)*J
end
# WILSON_PROOF.md: dual state-norm tail, not just a covariance norm.
state_tail(M::Int,Q::Int) = (2pi/Q)*sum(abs,momenta(M))/2
end
