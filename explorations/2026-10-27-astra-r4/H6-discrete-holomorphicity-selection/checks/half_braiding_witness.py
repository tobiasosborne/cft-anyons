#!/usr/bin/env python3
"""Exact B5 half-braiding sensitivity; the category is defined in companion .md.

Run from repository root:
python3 explorations/2026-10-27-astra-r4/H6-discrete-holomorphicity-selection/checks/half_braiding_witness.py
Pillars P2/P3; finite ingredient only; no limit or physical gluing claim.
Reference for the chosen compiler: ../NOTE.md, H6-B1 equations B1-B5.
No external categorical example or theorem is imported.
"""

import itertools
import sys
import sympy as s

G = [(0, 0), (1, 0), (0, 1), (1, 1)]
zero, a, b, ab = G
add = lambda g, h: (g[0] ^ h[0], g[1] ^ h[1])
chars = [lambda g: 1, lambda g: (-1)**g[1]]
V = list(itertools.product(G, repeat=2))
index = {gh: k for k, gh in enumerate(V)}
I = s.eye(16)
print(f"Python {sys.version.split()[0]}; SymPy {s.__version__}")
print(f"Group order: {G}; pair basis is lexicographic in these four labels")

assert all(add(add(g,h),k) == add(g,add(h,k))
           for g,h,k in itertools.product(G, repeat=3))
assert all(add(g,zero) == g and add(g,g) == zero for g in G)
for j, chi in enumerate(chars):
    assert chi(zero) == 1 and chi(a) == 1
    assert all(chi(add(g,h)) == chi(g)*chi(h) for g,h in V)
    gamma = s.diag(*[chi(g) for g in G])
    assert gamma.H*gamma == s.eye(4)
    print(f"chi_{j}: {[chi(g) for g in G]}; unit, character, dagger, chi(a)=1 checked")
print("Associator is identity; group associativity checked; pentagon scalars are all 1")

def port_matrix(kind, chi):
    M = s.zeros(16)
    for j, (g,h) in enumerate(V):
        out = (add(a,g),h) if kind == "L" else (g,add(a,h))
        M[index[out],j] = 1 if kind == "L" else chi(g)
        # U input charge is a+g+h, V output charge must agree.
        assert add(*out) == add(a,add(g,h))
    assert M.H*M == I
    return M

L = port_matrix("L", chars[0])
Rs = [port_matrix("R", chi) for chi in chars]
assert all(L*R == R*L for R in Rs)
print("Both Q_L and Q_R are charge-correct morphisms U->V and unitary matrices")

# All charge-preserving matrix units of End_C(V): four charge blocks, each 4x4.
matrix_units = [(r,c) for r,gh in enumerate(V) for c,jk in enumerate(V)
                if add(*gh) == add(*jk)]
assert len(matrix_units) == 64
print(f"dim V=16; End_C(V) has {len(matrix_units)} matrix units")

def residual(T, R):
    return -s.I*T*L + T*R - L*T + s.I*R*T

def require_charge_preserving(T):
    assert all(T[r,c] == 0 for r in range(16) for c in range(16)
               if (r,c) not in matrix_units)

S = s.zeros(16)
for j, (g,h) in enumerate(V):
    S[index[(h,g)],j] = 1
require_charge_preserving(S)
assert S.H == S and S*S == I
assert residual(S,Rs[0]) == s.zeros(16)
assert residual(S,Rs[1]) != s.zeros(16)

# Check the explicit formula on every input pair, independently of matrix products.
for j,(g,h) in enumerate(V):
    expected = s.zeros(16,1)
    expected[index[(add(h,a),g)]] += chars[1](g)-1
    expected[index[(h,add(g,a))]] += s.I*(chars[1](h)-1)
    assert residual(S,Rs[1])[:,j] == expected
print("Swap S: Hermitian, unitary, charge-preserving; R_chi0(S)=0, R_chi1(S)!=0")
column = residual(S,Rs[1])[:,index[(b,zero)]]
expected = s.zeros(16,1)
expected[index[(a,b)]] = -2
assert column == expected
print("Explicit witness: R_chi1(S)|(0,1),(0,0)>=-2|(1,0),(0,1)>")

# Stronger optional witness: the SAME fixed matrix P is a positive projection.
P = (I+L*Rs[0])/2
require_charge_preserving(P)
assert P.H == P and P*P == P and s.trace(P) == 8
assert residual(P,Rs[0]) == s.zeros(16)
assert residual(P,Rs[1]) != s.zeros(16)
expected = s.zeros(16,1)
expected[index[(ab,zero)]] = -(1+s.I)
expected[index[(b,a)]] = -(1+s.I)
assert residual(P,Rs[1])[:,index[(b,zero)]] == expected
print("P=(I+Q_L Q_R^chi0)/2: Hermitian projection, rank8, charge-preserving")
print("R_chi0(P)=0; R_chi1(P)|b,0>=-(1+i)(|a+b,0>+|b,a>)!=0")
print("Both choices use the SAME O,Y,q,geometry,spin0; only the half-braiding changes")
print("PASS: explicit different kernels, even on Hermitian positive semidefinite tiles")
