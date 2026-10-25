#!/usr/bin/env python3
"""Small independent matrix checks of F2-R and the nonlocal Fourier kernel.

Float64, absolute tolerance 1e-10. At most 2^7 x 2^7 matrices.
The NOTE proofs, not finite samples, establish the all-N statements.
"""
import numpy as np

tol = 1e-10
sites, rho = 7, 2
X = np.array([[0., 1.], [1., 0.]])
Z = np.diag([1., -1.])


def local(op, site):
    result = np.ones((1, 1))
    for index in range(sites):
        result = np.kron(result, op if index == site % sites else np.eye(2))
    return result


def comm(a, b):
    return a @ b-b @ a


def check_zero(matrix, label):
    error = np.linalg.norm(matrix)
    assert error < tol, (label, error)
    return error


xs, zs = [local(X, j) for j in range(sites)], [local(Z, j) for j in range(sites)]
dens = [xs[j] @ zs[(j+1) % sites] @ xs[(j+2) % sites]
        +zs[j]/3+xs[j] @ zs[(j+1) % sites]/5 for j in range(sites)]
curr = {(j, d): 1j*comm(dens[j], dens[(j+d) % sites])
        for j in range(sites) for d in range(1, rho+1)}
cuts = [sum(curr[((j-ell) % sites, d)]
            for d in range(1, rho+1) for ell in range(d)) for j in range(sites)]
ham = sum(dens)
worst = 0.
for j in range(sites):
    worst = max(worst, check_zero(1j*comm(ham, dens[j])-cuts[(j-1) % sites]+cuts[j],
                                  "range continuity"))
check_zero(sum(cuts)-sum(d*curr[(j, d)] for j in range(sites)
                        for d in range(1, rho+1)), "total cut current")
a, z = sites/(4*np.pi), np.exp(2j*np.pi/sites)
for m, n in [(0, 1), (1, -1), (1, 2), (-2, 1)]:
    em = a*sum(z**(m*j)*dens[j] for j in range(sites))
    en = a*sum(z**(n*j)*dens[j] for j in range(sites))
    comps = {d: a*sum(z**((m+n)*j)*curr[(j, d)] for j in range(sites))
             for d in range(1, rho+1)}
    rhs = sum(-1j*a*(z**(n*d)-z**(m*d))*comps[d] for d in comps)
    worst = max(worst, check_zero(comm(em, en)-rhs, "range Fourier bracket"))
    for d in comps:
        h = sum(z**((m+n)*ell) for ell in range(d))
        rem = -4j*a*(z**(n*d)-z**(m*d))-2*(n-m)*h
        bound = 2*np.pi/sites*((m*m+n*n)*d*d+abs(n-m)*abs(m+n)*d*(d-1))
        assert abs(rem) <= bound+tol
print(f"PASS: range-two continuity, Fourier identity and remainder bound; max error={worst:.3g}")

worst = 0.
for size in (4, 6, 8, 10):
    momenta = np.arange(size)-size/2+0.5
    for sep in range(1, size):
        raw = np.mean(momenta*np.exp(2j*np.pi*momenta*sep/size))
        formula = -1j*(-1)**sep/(2*np.sin(np.pi*sep/size))
        worst = max(worst, abs(raw-formula))
        assert abs(raw-formula) < tol
print(f"PASS: exact-formula comparison for all nonzero hopping separations; max error={worst:.3g}")
print("No large-system computation or inference of a conformal limit from these finite checks.")
