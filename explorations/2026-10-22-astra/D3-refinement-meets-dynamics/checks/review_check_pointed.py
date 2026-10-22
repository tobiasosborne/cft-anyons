"""Reviewer check (REVIEW.md): D3-5 identities on a constrained, non-self-dual,
multiplicity-carrying carrier. Pointed Z3 instance: O = 1 + X, X = g + g
(multiplicity two, g non-self-dual), trivial associator. The carrier is one
total-charge block of O^{tensor 2L}; local operators are charge-conserving.
This tests only that D3-5 uses no self-duality, multiplicity-freeness or
tensor-factorized Hilbert space; it is not evidence for D3-C.
Run: python3 review_check_pointed.py   (numpy only; matrices <= 729x729)
"""
import itertools, numpy as np
from scipy.linalg import expm, sqrtm, polar
rng = np.random.default_rng(7)
d, Lc = 3, 3                  # local labels: 0 = unit, 1,2 = two copies of g
Lf = 2 * Lc
chg = lambda s: sum(1 for x in s if x) % 3
fine = [s for s in itertools.product(range(d), repeat=Lf)]
coarse = [s for s in itertools.product(range(d), repeat=Lc)]
c = 2                          # a total charge sector whose dual differs (g^2 = gbar)
F = [s for s in fine if chg(s) == c]; C = [s for s in coarse if chg(s) == c]
fi = {s: i for i, s in enumerate(F)}
# dyadic vacuum insertion: coarse site j -> fine 2j, fine 2j+1 empty
V = np.zeros((len(F), len(C)))
for j, s in enumerate(C):
    t = []
    for x in s: t += [x, 0]
    V[fi[tuple(t)], j] = 1
def local_op(sites, M):
    """embed a charge-conserving operator on consecutive sites into the block"""
    A = np.zeros((len(F), len(F)), complex)
    k = len(sites)
    for s in F:
        loc = tuple(s[i] for i in sites)
        for loc2 in itertools.product(range(d), repeat=k):
            a = M[np.ravel_multi_index(loc2, (d,)*k), np.ravel_multi_index(loc, (d,)*k)]
            if a == 0: continue
            t = list(s)
            for i, x in zip(sites, loc2): t[i] = x
            A[fi[tuple(t)], fi[s]] += a
    return A
def rand_conserving():
    labs = list(itertools.product(range(d), repeat=2))
    M = rng.normal(size=(9, 9)) + 1j * rng.normal(size=(9, 9))
    for a in range(9):
        for b in range(9):
            if chg(labs[a]) != chg(labs[b]): M[a, b] = 0
    return (M + M.conj().T) / 2
Zs = [(j, j + 1) for j in range(Lf - 1)]
hs = [local_op(z, rand_conserving()) for z in Zs]
H = sum(hs)
def vac_proj(sites):
    p = np.diag([1, 0, 0]).astype(complex)
    A = np.eye(len(F), dtype=complex)
    for i in sites:
        if i % 2 == 1: A = A @ local_op((i,), p)
    return A
P = V @ V.T
assert np.allclose(P, vac_proj(range(Lf)))
Aloc = sum(vac_proj(z) @ h - h @ vac_proj(z) for z, h in zip(Zs, hs))
assert np.allclose(Aloc, -Aloc.conj().T)
assert np.allclose(Aloc @ V, -(np.eye(len(F)) - P) @ H @ V)
# finite-difference tangent of polar refinement W(t) = e^{-tH}V G^{-1/2}
def W(t):
    T = expm(-t * H) @ V
    G = T.conj().T @ T
    return T @ np.linalg.inv(sqrtm(G))
eps = 1e-6
dW = (W(eps) - W(-eps)) / (2 * eps)
assert np.allclose(dW, Aloc @ V, atol=1e-6)
assert np.allclose(W(0.3).conj().T @ W(0.3), np.eye(len(C)))
Heff = lambda t: W(t).conj().T @ H @ W(t)
dHe = (Heff(eps) - Heff(-eps)) / (2 * eps)
assert np.allclose(dHe, -2 * V.T @ H @ (np.eye(len(F)) - P) @ H @ V, atol=1e-5)
# disconnected pairs (no shared inserted site) vanish
Q = np.eye(len(F)) - P
for (z, hz), (y, hy) in itertools.product(zip(Zs, hs), repeat=2):
    shared = [i for i in set(z) & set(y) if i % 2 == 1]
    val = np.abs(V.T @ hz @ Q @ hy @ V).max()
    if not shared: assert val < 1e-10, (z, y, val)
print('block dim fine', len(F), 'coarse', len(C))
print('PASS D3-5 tangent, isometry, energy derivative, pair locality on pointed Z3 carrier with multiplicity 2')
