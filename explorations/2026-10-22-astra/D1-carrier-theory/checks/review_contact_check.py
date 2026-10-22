#!/usr/bin/env python3
"""Reviewer check (REVIEW.md, D1-C robustness): collision boundary condition of
the NOTE's hopping form versus the standard hard-core hopping chain.

Scalar fibre (C = Hilb_fd, X = 1-dim) is used ONLY as a calibration instance of
the general form: the collision condition is a property of the scalar hopping
part and is fibre-independent because D_hop acts as identity on the fibre.

H_note = eps^-2 sum_j D_j^dag D_j, D = pi_X0 - pi_0X  (NOTE.md:35-38)
       = eps^-2 sum_j [n_j(1-n_{j+1}) + (1-n_j)n_{j+1} - hop_j]
H_std  = eps^-2 sum_j [n_j + n_{j+1} - hop_j]   (constant chemical potential)
They differ by the contact term -2 eps^-2 sum_j n_j n_{j+1}.
Continuum predictions for N=2 ordered particles on (0,1), Neumann outer ends:
  Neumann at collision (bosons):      E0 = 0
  Dirichlet at collision (fermions):  E0 = pi^2 (levels 0 and pi^2)
Command: python3 explorations/2026-10-22-astra/D1-carrier-theory/checks/review_contact_check.py
"""
import itertools
import numpy as np

def sector(L, N, standard):
    eps = 1.0 / L
    confs = list(itertools.combinations(range(L), N))
    idx = {c: i for i, c in enumerate(confs)}
    H = np.zeros((len(confs), len(confs)))
    for c, i in idx.items():
        occ = set(c)
        for j in range(L - 1):
            a, b = j in occ, (j + 1) in occ
            if standard:
                H[i, i] += (a + b) / eps**2
            else:
                H[i, i] += (a != b) / eps**2
            if a != b:  # hop the single particle across bond (j,j+1)
                new = tuple(sorted((occ - {j, j + 1}) | ({j + 1} if a else {j})))
                H[i, idx[new]] -= 1 / eps**2
    return np.linalg.eigvalsh(H)

for L in (20, 40, 60):
    en = sector(L, 2, standard=False)[:2]
    es = sector(L, 2, standard=True)[:2]
    # the standard chain carries a boundary chemical-potential offset; compare gaps
    print(f"L={L}: note-form E0,E1 = {en[0]:.4f},{en[1]:.4f} | standard E0 = {es[0]:.4f}")
print("pi^2 =", np.pi**2)
