#!/usr/bin/env python3
"""Independent finite checks of F5 L1; no imports from the author's checks.

Source/claim: ../NOTE.md L1 <1>1--3, <2>1--3 (lines 330--393).
Conventions: scalar complex fibre, unordered graph edges, eps=1/L;
N=eps^2 sum |f|^2, E=sum_edges |df|^2. This is a category-free finite
invariant, feeding the off-ladder z=2 theorem, not a compactness proof.
Run from repo root with OPENBLAS_NUM_THREADS=1 python3 -B this_file.py.
Tolerances: 2e-10 for matrix quadratic inequalities; 2e-12 for quadrature.
Mutation: zero the final diagonal extension node instead of repeating it.
This makes a constant triangular array acquire square-gradient energy.
"""
from itertools import combinations
from fractions import Fraction
import hashlib
from pathlib import Path
import platform
import sys
import numpy as np


def graph_matrix(vertices, neighbours):
    index = {v: k for k, v in enumerate(vertices)}
    out = np.zeros((len(vertices), len(vertices)))
    for v, k in index.items():
        for w in neighbours(v):
            if w in index and k < index[w]:
                row = np.zeros(len(vertices))
                row[k], row[index[w]] = 1, -1
                out += np.outer(row, row)
    return out


def matrices(L, mutation=False):
    tri = list(combinations(range(L), 2))
    square = [(i, j) for i in range(L) for j in range(L)]
    ix = {v: k for k, v in enumerate(tri)}
    def nn(v):
        i, j = v
        return [(i-1, j), (i+1, j), (i, j-1), (i, j+1)]
    E = graph_matrix(tri, nn)
    G = graph_matrix(square, nn)
    M = np.zeros((L*L, len(tri)))
    for row, (i, j) in enumerate(square):
        if i != j:
            M[row, ix[tuple(sorted((i, j)))]] = 1
        elif not (mutation and i == L-1):
            M[row, ix[(i, i+1) if i < L-1 else (L-2, L-1)]] = 1
    return E, G, M


def main():
    print('COMMAND: OPENBLAS_NUM_THREADS=1 python3 -B ' + str(Path(__file__)))
    print('VERSIONS', sys.version.split()[0], 'NumPy', np.__version__, platform.platform())
    print('SHA256', hashlib.sha256(Path(__file__).read_bytes()).hexdigest())
    rng = np.random.default_rng(252026)
    for L in (2, 3, 4, 7, 11):
        E, G, M = matrices(L)
        # Check the whole finite quadratic form, not merely sampled vectors.
        gap_E = np.linalg.eigvalsh(6*E-M.T@G@M).min()
        gap_N = np.linalg.eigvalsh(4*np.eye(E.shape[0])-M.T@M).min()
        assert gap_E >= -2e-10, 'L1 square extension exceeds 6E'
        assert gap_N >= -2e-10, 'L1 square extension exceeds 4N'
        f = rng.normal(size=len(E))+1j*rng.normal(size=len(E))
        g = (M@f).reshape((L, L)); eps = 1/L
        # Integrate affine triangle gradients directly, then clamped strips.
        integral = 0.
        for i in range(L-1):
            for j in range(L-1):
                a, b, c, d = g[i,j], g[i+1,j], g[i,j+1], g[i+1,j+1]
                integral += (abs(b-a)**2+abs(d-b)**2+abs(d-c)**2+abs(c-a)**2)/2
        for edge in (g[0,:], g[-1,:], g[:,0], g[:,-1]):
            integral += np.sum(np.abs(np.diff(edge))**2)/2
        expected = float(np.vdot(M@f, G@(M@f)).real)
        assert abs(integral-expected) < 2e-12*max(1, expected)
        # Exact rational half-cell integrals: 2 int_0^(eps/2) (s/eps)^2 ds.
        e = Fraction(1, L)
        coefficient = 2*(e/2)**3/(3*e**2)
        assert coefficient == e/12
        print(f'GREEN L={L}: min(6E-M*G*M)={gap_E:.3e}, '
              f'min(4I-M*M)={gap_N:.3e}, gradient_error={integral-expected:.3e}, '
              f'trace_half_cell={coefficient}')
    E, G, bad = matrices(4, mutation=True)
    constant = np.ones(len(E))
    triangle = float(constant@E@constant)
    square = float(constant@bad.T@G@bad@constant)
    assert triangle == 0 and square == 2
    try:
        assert square <= 6*triangle, 'zero-last-node mutation violates energy extension'
    except AssertionError as exc:
        print(f'RED CAUGHT: E_triangle={triangle}, E_square={square}; {exc}')
    else:
        raise AssertionError('mutation escaped')
    print('ALL GREEN: finite global trace-extension invariants and caught endpoint mutation')


if __name__ == '__main__':
    main()
