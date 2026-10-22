#!/usr/bin/env python3
"""Reviewer check (REVIEW.md): laptop-scale sanity test of E6-T1 on sectors N<=2.

Scalar fibres (C = Vec, X = 1, so O = 1+1 is NOT connected) are a calibration
instance only: T1's analytics sees C only through finite fibres and the maps b, v.
H_eps is the D1-C / E6 section-2 family, compressed to the occupation subspace
N <= 2 (Galerkin compression P H P; the continuum analogue is q restricted to
psi_n = 0 for n >= 3, which is again closed and covered by the same L3/T1 proof).
Test 1 (convergence): lowest eigenvalues are Cauchy as L doubles.
Test 2 (coupling survives): the N=0/N=2 mixing weight of the ground state stays
          bounded away from zero (genuinely number-changing limit, nu != 0).
Test 3 (mutation, brief's uniform eps^-1 scaling of fixed v): vacuum diagonal
          energy grows like L, i.e. diverges (E6-P1).
Command: python3 explorations/2026-10-22-astra-r2/E6-number-changing-continuum/checks/review_tuned_convergence.py
"""
import itertools
import numpy as np
import scipy.sparse as sps
import scipy.sparse.linalg as spl

def build(L, lam=1.0, b=0.7, kap=1.0, v=1.3, mu=1.0, v_power=1.0, b_power=0.5):
    eps = 1.0 / L
    confs = [()] + [(j,) for j in range(L)] + list(itertools.combinations(range(L), 2))
    idx = {c: i for i, c in enumerate(confs)}
    rows, cols, vals = [], [], []
    def add(func, w):  # w * r r^T for a functional r given as {conf: coeff}
        items = [(idx[c], a) for c, a in func.items() if c in idx]
        for i, a in items:
            for k, bb in items:
                rows.append(i); cols.append(k); vals.append(w * a * bb)
    for j in range(L - 1):
        others = [s for s in range(L) if s not in (j, j + 1)]
        for r in range(0, 3):
            for R in itertools.combinations(others, r):
                R = set(R)
                cj = tuple(sorted(R | {j})); cj1 = tuple(sorted(R | {j + 1}))
                cjj = tuple(sorted(R | {j, j + 1})); c0 = tuple(sorted(R))
                add({cj: 1.0, cj1: -1.0}, eps ** -2)                       # D_hop
                add({cjj: 1.0, cj: -(eps ** b_power) * b}, lam / eps)       # D_b
                add({cjj: 1.0, c0: -(eps ** v_power) * v}, kap / eps)       # D_v
    n = len(confs)
    H = sps.coo_matrix((vals, (rows, cols)), shape=(n, n)).tocsr()
    H = H + sps.diags([mu * len(c) for c in confs])
    return H, confs

def low(L, k=4, **kw):
    H, confs = build(L, **kw)
    w, V = spl.eigsh(H, k=k, sigma=-1.0, which='LM')
    o = np.argsort(w); w, V = w[o], V[:, o]
    g = V[:, 0]
    weights = [sum(abs(g[i]) ** 2 for i, c in enumerate(confs) if len(c) == n) for n in range(3)]
    return w, weights, H[0, 0]

if __name__ == "__main__":
    prev = None; diffs = []
    for L in (12, 24, 48, 96):
        w, wt, h00 = low(L)
        print(f"L={L}: lowest = {np.round(w, 5)}, ground-state sector weights N=0,1,2 = {np.round(wt, 4)}, <Omega|H|Omega>={h00:.5f}")
        if prev is not None:
            diffs.append(np.max(np.abs(w - prev)))
        prev = w
        assert wt[0] > 0.05 and wt[2] > 0.05, "pair coupling disappeared"
    print("successive max differences:", np.round(diffs, 5))
    assert diffs[-1] < diffs[0] / 2.5, "no Cauchy convergence"
    # mutation: v at the brief's uniform eps^-1 scaling (v_power = 0)
    h00s = [build(L, v_power=0.0)[0][0, 0] for L in (12, 24, 48)]
    print("mutation (fixed v, eps^-1): <Omega|H|Omega> =", np.round(h00s, 3))
    assert h00s[2] > 3.5 * h00s[0], "mutation did not diverge"
    print("GREEN: Cauchy convergence, retained N0/N2 mixing, brief-scaling mutation diverges")
