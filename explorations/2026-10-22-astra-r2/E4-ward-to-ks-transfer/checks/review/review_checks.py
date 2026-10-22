#!/usr/bin/env python3
"""Reviewer's independent checks for E4 (REVIEW.md sections R1-R4).

Run from repository root:
  python3 explorations/2026-10-22-astra-r2/E4-ward-to-ks-transfer/checks/review/review_checks.py
Category-free finite linear algebra; qubit chains N<=8 are calibration
instances of C=Vec, O=C^2 only (Rule 16), not the subject.
"""
import itertools
import numpy as np
import sympy as s

rng = np.random.default_rng(20261022)
comm = lambda A, B: A @ B - B @ A

# R1. W1+W2 tautology: for ARBITRARY operators Q_j and constants, defining
# X := 0 and W := [S_m,Q_j] - (Ward rhs) makes W1 hold identically, and the
# assembled E of W2 equals [S_m,S_n] - beta_N S_{m+n} - z^{(r)}_{mn} exactly.
N, dim = 7, 3
ell = 2 * np.pi / N
Q = [rng.normal(size=(dim, dim)) + 1j * rng.normal(size=(dim, dim)) for _ in range(N)]
k3, k1, b = 0.37, -1.1, 0.25
f = lambda m, j: np.exp(1j * m * 2 * np.pi * j / N)
dN = lambda m: np.sin(m * ell) / ell
Id = np.eye(dim)
S = lambda m: sum(f(m, j) * Q[j] for j in range(N)) / N + b * (m == 0) * Id
DQ = lambda j: (Q[(j + 1) % N] - Q[(j - 1) % N]) / (2j * ell)
worst = 0.0
for m, n in itertools.product(range(-3, 4), repeat=2):
    W = [comm(S(m), Q[j]) - (f(m, j) * DQ(j) + 2 * dN(m) * f(m, j) * Q[j]
         + (k3 * dN(m) ** 3 + k1 * dN(m)) * f(m, j) * Id) for j in range(N)]
    E = sum(f(n, j) * W[j] for j in range(N)) / N
    beta = 2 * dN(m) - dN(m + n)
    z = (m + n == 0) * (k3 * dN(m) ** 3 + (k1 - 2 * b) * dN(m))
    worst = max(worst, np.abs(E - (comm(S(m), S(n)) - beta * S(m + n) - z * Id)).max())
assert worst < 1e-10, worst
print(f"PASS R1: W2's E equals the beta_N-residual of (8) for arbitrary Q (max dev {worst:.1e})")

# R2. Literal K = 1 + (H - E0)/v violates A2 at (n,s)=(0,0): T0+Tbar0 = N(K-1)/(2pi)+2b.
X = np.array([[0, 1], [1, 0]]); Y = np.array([[0, -1j], [1j, 0]]); Z = np.diag([1., -1.])
def site(op, j, L):
    out = np.array([[1.0]])
    for i in range(L):
        out = np.kron(out, op if i == j else np.eye(2))
    return out
ratios = []
for L in (4, 6, 8):
    v = 1.0
    k = [sum(site(P, j, L) @ site(P, (j + 1) % L, L) for P in (X, Y, Z)).real / v for j in range(L)]
    H = sum(k)
    ev = np.linalg.eigvalsh(H); E0 = ev[0]
    eps = E0 / (L * v)
    Jc = [1j * comm(k[j], k[(j + 1) % L]) for j in range(L)]
    T0 = L / (4 * np.pi) * sum(k[j] - eps * np.eye(2 ** L) - Jc[j] for j in range(L))
    Tb0 = L / (4 * np.pi) * sum(k[j] - eps * np.eye(2 ** L) + Jc[j] for j in range(L))
    K = np.eye(2 ** L) + (H - E0 * np.eye(2 ** L)) / v
    assert np.abs(T0 + Tb0 - L / (2 * np.pi) * (K - np.eye(2 ** L))).max() < 1e-9
    Kinv = np.linalg.inv(K)
    r = max(np.linalg.norm(T0 @ Kinv, 2), np.linalg.norm(Tb0 @ Kinv, 2))
    ratios.append(r)
    print(f"  L={L}: max(|T0 K^-1|,|Tbar0 K^-1|) = {r:.3f}; bound N w/(4pi(1+w)) with w={ev[-1]-E0:.2f}: "
          f"{L*(ev[-1]-E0)/(4*np.pi*(1+ev[-1]-E0)):.3f}")
assert ratios[0] < ratios[1] < ratios[2]
print("PASS R2: A2 at (0,0) for the brief's literal K grows linearly in N (calibration instance)")

# R3. Translation phase and odd-mode anticommutation used by E4-N3 (L=6 Heisenberg).
L = 6; D = 2 ** L
perm = np.zeros((D, D))
for idx in range(D):
    bits = [(idx >> (L - 1 - i)) & 1 for i in range(L)]
    nb = [bits[(i - 1) % L] for i in range(L)]           # U moves site j to j+1
    perm[int("".join(map(str, nb)), 2), idx] = 1
k = [sum(site(P, j, L) @ site(P, (j + 1) % L, L) for P in (X, Y, Z)).real for j in range(L)]
assert np.abs(perm @ k[0] @ perm.T - k[1]).max() < 1e-12
Jc = [1j * comm(k[j], k[(j + 1) % L]) for j in range(L)]
T = lambda n: L / (4 * np.pi) * sum(np.exp(2j * np.pi * n * j / L) * (k[j] - Jc[j]) for j in range(L))
for n in (-3, -1, 1, 2, 3):
    assert np.abs(perm @ T(n) @ perm.T - np.exp(-2j * np.pi * n / L) * T(n)).max() < 1e-10
Wt = np.linalg.matrix_power(perm, L // 2)
for n in (-3, -1, 1, 3):
    assert np.abs(T(n) @ Wt + Wt @ T(n)).max() < 1e-10
print("PASS R3: U T_n U* = e^{-2 pi i n/N} T_n and W T_n = -T_n W for odd n")

# R4. Reviewer strengthening of E4-N3: if all odd modes vanish in graph norm,
# A4 with the anchor forces z_{1,-1}/2 = z_{3,-3}/6, i.e. c* = 0.
cs, c = s.symbols("cstar c")
z = lambda m: (m ** 3 * cs - m * c) / 12
sol = s.solve(s.Eq(z(1) / 2, z(3) / 6), cs)
assert sol == [0], sol
print("PASS R4: z_1/2 = z_3/6 iff c* = 0")
print("ALL REVIEW CHECKS PASS")
