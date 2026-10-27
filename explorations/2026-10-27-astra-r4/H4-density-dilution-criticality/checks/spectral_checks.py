#!/usr/bin/env python3
"""Small spectral calibrations of NOTE A0--A3, never continuum proofs.

The two-dimensional fibre is Hom(y,y⊕y) for any simple y in any C.
Only unitors move the particle; no model-specific F data enter.
Run: python3 <this path> [--mutate laplacian|quartic|twist]
"""
import argparse
from itertools import combinations
import numpy as np
import sympy as s

parser = argparse.ArgumentParser()
parser.add_argument("--mutate", choices=["laplacian", "quartic", "twist"])
args = parser.parse_args()
tol = 2e-10

# Fixed two-channel positive hopping, same charge, arbitrary unitary basis.
T = np.array([[2., 1. / 3], [1. / 3, 1.]])
tmin = np.linalg.eigvalsh(T)[0]
previous = 0.
print("two-channel one-particle gap: L, gap, L^2 gap")
for length in [8, 16, 32, 64]:
    lap = np.diag([1.] + [2.] * (length - 2) + [1.])
    lap += np.diag(-np.ones(length - 1), 1)
    lap += np.diag(-np.ones(length - 1), -1)
    if args.mutate == "laplacian":
        lap[0, 0] += 1
        lap[-1, -1] += 1
    H = np.kron(lap, T)
    eig = np.linalg.eigvalsh(H)
    assert np.max(np.abs(eig[:2])) < tol, "two fibre ground modes"
    expected = tmin * 4 * np.sin(np.pi / (2 * length)) ** 2
    gap = eig[2]
    assert abs(gap - expected) < tol, "exact path dispersion"
    scaled = length ** 2 * gap
    assert scaled > previous and scaled < tmin * np.pi ** 2
    previous = scaled
    print(f"{length:3d} {gap:.12g} {scaled:.12g}")
assert abs(previous / (tmin * np.pi ** 2) - 1) < 3e-4

# Symbolic unitary gauge cancellation for a scalar fusion-fibre operator.
c, d = s.symbols("c d", real=True)
F = s.Matrix([[c, d], [-d, c]])
assert F.T * F == (c*c + d*d) * s.eye(2)
assert s.simplify((F.T * s.eye(2) * F).subs(d*d, 1-c*c)) == s.eye(2)
print("PASS symbolic orthogonal F-fibre gauge identity (c^2+d^2=1)")

k = s.symbols("k", real=True)
off = s.sin(k) if args.mutate != "quartic" else s.Rational(9, 10)*s.sin(k)
A = s.Matrix([[2*(1-s.cos(k)), off], [off, 1]])
assert s.trigsimp(A.det() - (1-s.cos(k))**2) == 0, "quartic determinant"
trace = s.trace(A)
lower = (trace - s.sqrt(trace**2 - 4*A.det())) / 2
assert s.series(lower, k, 0, 6).removeO() == k**4/4
for length in [16, 32, 64, 128]:
    p = 2*np.pi/length
    a = np.array([[2*(1-np.cos(p)), np.sin(p)], [np.sin(p), 1.]])
    lo = np.linalg.eigvalsh(a)[0]
    assert lo >= -tol
    print(f"quartic {length:3d} L^4*lambda={length**4*lo:.12g}")
print("PASS positive NN quartic symbol, exact k^4/4 Taylor coefficient")

# Direct fixed-n ring diagonalization, with an interacting contact term.
length, particles, phi, contact = 8, 2, 0.31, 0.7
basis = [sum(1 << j for j in occ) for occ in combinations(range(length), particles)]
index = {state: j for j, state in enumerate(basis)}
dim = len(basis)
H = np.zeros((dim, dim), complex)
hop = np.zeros_like(H)
shift = np.zeros_like(H)
for col, state in enumerate(basis):
    rotated = ((state << 1) & ((1 << length)-1)) | (state >> (length-1))
    shift[index[rotated], col] = 1
    for j in range(length):
        nxt = (j+1) % length
        nj, nk = (state >> j) & 1, (state >> nxt) & 1
        if nj != nk:
            H[col, col] += 1
            row = index[state ^ (1 << j) ^ (1 << nxt)]
            value = -np.exp(1j * phi * (nj-nk))
            H[row, col] += value
            hop[row, col] += value
        elif nj:
            H[col, col] += contact
assert np.linalg.norm(H-H.conj().T) < tol
assert np.linalg.norm(H@shift-shift@H) < tol
eig, vectors = np.linalg.eigh(H)
psi, E0 = vectors[:, 0], eig[0]
assert abs(abs(np.vdot(psi, shift@psi))-1) < tol
positions = np.array([sum((j+1)*((state>>j)&1) for j in range(length)) for state in basis])
hopmean = np.vdot(psi, hop@psi).real
for r in [1, 2]:
    q = 2*np.pi*r/length
    plus, minus = np.exp(1j*q*positions)*psi, np.exp(-1j*q*positions)*psi
    ep, em = np.vdot(plus, H@plus).real, np.vdot(minus, H@minus).real
    factor = 2 if args.mutate != "twist" else 1
    assert abs(ep+em-2*E0-factor*(np.cos(q)-1)*hopmean) < tol, "twist second difference"
    assert ep-E0 <= 2*particles*q*q + tol
    assert eig[r]-E0 <= 2*particles*q*q + tol
print(f"PASS interacting twist identity and min-max bounds, sector dimension {dim}")
print("ALL SPECTRAL CHECKS PASSED; largest dense matrix 128 x 128")
