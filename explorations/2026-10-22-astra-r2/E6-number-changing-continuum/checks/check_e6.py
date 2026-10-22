#!/usr/bin/env python3
"""Small invariants for E6 NOTE.md; not a numerical proof of convergence.

Run from repo root: python3 explorations/2026-10-22-astra-r2/E6-number-changing-continuum/checks/check_e6.py
Only finite scalar/vector coordinate checks; no category model is assumed.
"""
import hashlib
import itertools
from pathlib import Path

import numpy as np
import sympy as sp


def reject(label, check):
    try:
        check()
    except AssertionError:
        print(f"RED mutation rejected: {label}")
    else:
        raise AssertionError(f"Mutation survived: {label}")


def scaling(fusion_exponent, pair_exponent):
    # NOTE P1: n spectators, face count epsilon^(-(n+1)).
    n = sp.symbols("n", integer=True, nonnegative=True)
    fusion = sp.simplify(fusion_exponent + (n + 1) / 2 + (n + 2) / 2 - (n + 1))
    pair = sp.simplify(pair_exponent + n / 2 + (n + 2) / 2 - (n + 1))
    assert fusion == 0 and pair == 0, (fusion, pair)


def gram(shift=0):
    # Rectangular fibre maps and an exact weighted moment decomposition (§7).
    mean = sp.Matrix([[1, 2], [0, 1], [1, -1]])
    d1 = sp.Matrix([[0, 1], [1, 0], [0, 0]])
    d2 = sp.Matrix([[1, 0], [0, 0], [1, 1]])
    maps = [mean + 2*d1, mean - 2*d1, mean + 2*d2, mean - 2*d2]
    weights = [sp.Rational(1, 4)] * 4
    beta = sum((w*b for w, b in zip(weights, maps)), sp.zeros(3, 2))
    moment = sum((w*b.T*b for w, b in zip(weights, maps)), sp.zeros(2))
    assert beta == mean
    assert moment - beta.T*beta == 2*(d1.T*d1 + d2.T*d2) + shift*sp.eye(2)
    u = sp.Matrix([2, -1, 3])
    x = sp.Matrix([1, 4])
    direct = sum(w*((u-b*x).T*(u-b*x))[0] for w, b in zip(weights, maps))
    aggregate = (u.T*u - u.T*beta*x - x.T*beta.T*u + x.T*moment*x)[0]
    assert direct == aggregate


def contact(diagonal=2):
    # Basis 00, X0, 0X, XX: exact D1 REVIEW:79 identity.
    hop = sp.zeros(4)
    hop[1, 2] = hop[2, 1] = 1
    nleft = sp.diag(0, 1, 0, 1)
    nright = sp.diag(0, 0, 1, 1)
    d = sp.Matrix([[0, 1, -1, 0]])
    assert d.T*d == nleft+nright-hop-diagonal*nleft*nright


def collar():
    # Exact integer arithmetic for finite vector-valued exclusion collars.
    length, number, m = 10, 3, 3
    eps = sp.Rational(1, length)
    configs = list(itertools.combinations(range(1, length+1), number))
    values = {j: sp.Matrix([sum(x*x for x in j), j[0]*j[1]-j[2]]) for j in configs}
    energy = 0
    for j in configs:
        for k in range(number):
            nxt = list(j)
            nxt[k] += 1
            nxt = tuple(nxt)
            if nxt in values:
                diff = values[nxt]-values[j]
                energy += (diff.T*diff)[0]
    energy *= eps**(number-2)
    lhs = 0
    paths = set()
    for j in range(1, length):
        for spectator in range(j+m+2, length+1):
            start = (j, j+1, spectator)
            seq = [(j, j+1+r, spectator) for r in range(m)]
            mean = sum((values[p] for p in seq), sp.zeros(2, 1))/m
            diff = values[start]-mean
            lhs += eps**(number-1)*(diff.T*diff)[0]
            for p, q in zip(seq, seq[1:]):
                assert (p, q) not in paths, "A collar edge was counted twice"
                paths.add((p, q))
    assert lhs <= m*eps*energy
    print(f"GREEN collar: exact lhs={lhs}, bound={m*eps*energy}, unique edges={len(paths)}")


def counterexample():
    # C² compactly supported probes (enough for the difference bound), size <=128.
    residuals = []
    responses = []
    for length in (16, 32, 64, 128):
        eps = 1/length
        x = (np.arange(length)+0.5)*eps
        y = (x-0.2)*(0.8-x)
        probe = np.zeros(length)
        probe[y > 0] = y[y > 0]**3
        probe *= np.sqrt(eps)
        probe /= np.linalg.norm(probe)
        h = -length**2*(np.eye(length, k=1)+np.eye(length, k=-1))
        residual = h@probe + 2*length**2*probe
        response = np.linalg.solve(h-1j*np.eye(length), probe)
        bound = (1+np.linalg.norm(residual))/abs(-2*length**2-1j)
        assert np.linalg.norm(response) <= bound*(1+1e-12)
        residuals.append(np.linalg.norm(residual))
        responses.append(np.linalg.norm(response))
        print(f"pure hop L={length}: residual={residuals[-1]:.9g}, resolvent norm={responses[-1]:.9g}, proved bound={bound:.9g}")
    assert max(residuals) < 100
    assert responses[-1] < responses[0]/40


if __name__ == "__main__":
    print("E6 local invariant checks; no continuum conclusion is inferred from these finite runs.")
    print(f"numpy={np.__version__}, sympy={sp.__version__}")
    reject("brief's uniform reaction exponents", lambda: scaling(-1, -1))
    scaling(-sp.Rational(1, 2), 0)
    print("GREEN corrected reaction powers")
    reject("missing contact attraction", lambda: contact(0))
    contact()
    print("GREEN exact contact identity")
    reject("wrong Gram moment", lambda: gram(1))
    gram()
    print("GREEN exact coefficient-image identity")
    collar()
    counterexample()
    print("GREEN all 5 invariant groups; 3 deliberately wrong mutations caught")
    print("producer_sha256="+hashlib.sha256(Path(__file__).read_bytes()).hexdigest())
