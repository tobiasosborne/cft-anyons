#!/usr/bin/env python3
"""Reviewer check (REVIEW.md): independent recomputation of E6-N1 and of the
grading hypothesis G_r in the N3 example.

N1: pure-hop density k = -(hop), H_eps = eps^-2 sum_j k_j, on the full open chain
of L sites, restricted to N <= 1 (exactly invariant: k preserves N). Scalar
fibre: the one-particle sector of any C is Hom(c,X) (x) l^2(sites) with the hop
acting as identity on the fibre, so a 1-dim fibre is a faithful calibration.
For several real shifts s, the projected resolvent K (H-s-i)^{-1} K^* applied
to a fixed smooth one-particle f tends to 0, while on the vacuum it is the fixed
nonzero number (-s-i)^{-1}: no full-Fock resolvent limit.
N3 example: Hilb(Z_d) with X = generator; Hom(X^p,X^q) != 0 iff p = q mod d.
Command: python3 explorations/2026-10-22-astra-r2/E6-number-changing-continuum/checks/review_N1_N3.py
"""
import numpy as np

def projected_resolvent_norm(L, s):
    eps = 1.0 / L
    x = (np.arange(L) + 0.5) * eps
    f = np.exp(-60 * (x - 0.5) ** 2) * (np.abs(x - 0.5) < 0.4)  # smooth enough probe
    # K^* f: cell averages times sqrt(eps) (box isometry of CA-77 Thm 77.8)
    fine = 64
    xs = (np.arange(L * fine) + 0.5) * eps / fine
    fs = np.exp(-60 * (xs - 0.5) ** 2) * (np.abs(xs - 0.5) < 0.4)
    kstar = fs.reshape(L, fine).mean(axis=1) * np.sqrt(eps)
    H = -(np.eye(L, k=1) + np.eye(L, k=-1)) / eps ** 2
    r = np.linalg.solve(H - (s + 1j) * np.eye(L), kstar)
    return np.linalg.norm(r)  # K is an isometry

for s in (0.0, -50.0, 37.5):
    norms = [projected_resolvent_norm(L, s) for L in (16, 32, 64, 128, 256)]
    vac = abs(1 / (-s - 1j))
    print(f"s={s}: ||P R P f|| = {np.round(norms, 7)}, vacuum response |(-s-i)^-1| = {vac:.5f}")
    assert norms[-1] < norms[0] / 100 and vac > 0.01
print("N1 GREEN: one-particle projected resolvent -> 0 for every fixed real shift; vacuum response fixed")

for d, r in ((3, 2), (4, 3), (5, 2)):
    hom = lambda p, q: 1 if (p - q) % d == 0 else 0
    Gr = all(hom(p, q) == 0 for p in range(r + 1) for q in range(r + 1) if p != q)
    same = hom(2, d + 2) == 1
    print(f"Hilb(Z_{d}), range r={r}: G_r holds = {Gr}; X^2 and X^(d+2) share a simple = {same}")
    assert Gr and same
r_bad = 3
assert not all(((p - q) % 3) != 0 for p in range(r_bad + 1) for q in range(r_bad + 1) if p != q)
print("N3 example GREEN (and d=3 correctly fails G_3, so range must stay < d)")
