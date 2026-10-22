"""Small non-pointed calibration, not the proof of the general theorem.
Run: OPENBLAS_NUM_THREADS=1 python3 -I <this-file> [--phase-free]
Four O sites maximum; largest matrix 34 x 34; no diagonalisation.
F, R: references/category-theory/RowellStongWang2009Classification/source/
RSWfinal3.tex:2379-2407. Unit conventions: CONVENTIONS (b),(r),(ah).
Left-associated orthonormal paths, 0=unit, 1=tau; positive crossing R.
Tolerance: max absolute matrix-entry error <= 2e-12, rtol=0.
The --phase-free mutation must fail the block-naturality assertion.
"""
import itertools
import platform
import sys
from functools import lru_cache
import numpy as np

TOL = 2e-12
PHI = (1 + np.sqrt(5)) / 2
FM = np.array([[1 / PHI, 1 / np.sqrt(PHI)],
               [1 / np.sqrt(PHI), -1 / PHI]])
MUTATE = '--phase-free' in sys.argv


def fusion(a, b):
    return (b,) if a == 0 else ((a,) if b == 0 else (0, 1))


@lru_cache(None)
def basis(n):
    rows = [((), (0,))]
    for _ in range(n):
        rows = [(s + (a,), p + (b,)) for s, p in rows
                for a in (0, 1) for b in fusion(p[-1], a)]
    return tuple(rows)


def fmove(a, b, c, d, u, v):
    if u not in fusion(a, b) or d not in fusion(u, c):
        return 0.
    if v not in fusion(b, c) or d not in fusion(a, v):
        return 0.
    return FM[u, v] if (a, b, c, d) == (1, 1, 1, 1) else 1.


def close(a, b, label):
    err = np.max(np.abs(a - b))
    assert err <= TOL, f'{label}: max entry error {err:.16g}'


def units(n):
    rows = basis(n)
    for i, (_, p) in enumerate(rows):
        for j, (_, q) in enumerate(rows):
            if p[-1] == q[-1]:
                e = np.zeros((len(rows), len(rows)), complex)
                e[i, j] = 1
                yield i, j, e


def prefix(a, m, n):
    pos = {x: i for i, x in enumerate(basis(m))}
    out = np.zeros((len(basis(n)), len(basis(n))), complex)
    for i, (s, p) in enumerate(basis(n)):
        for j, (t, q) in enumerate(basis(n)):
            if s[m:] == t[m:] and p[m:] == q[m:]:
                out[i, j] = a[pos[s[:m], p[:m+1]], pos[t[:m], q[:m+1]]]
    return out


def two(a, start, n):
    """Embed a two-site morphism by explicit associator, independent of R."""
    pos = {x: i for i, x in enumerate(basis(2))}
    out = np.zeros((len(basis(n)), len(basis(n))), complex)
    for i, (s, p) in enumerate(basis(n)):
        for j, (t, q) in enumerate(basis(n)):
            if (s[:start] != t[:start] or s[start+2:] != t[start+2:]
                    or p[:start+1] != q[:start+1] or p[start+2:] != q[start+2:]):
                continue
            for v in (0, 1):
                so, ti = s[start:start+2], t[start:start+2]
                bo, bi = (so, (0, so[0], v)), (ti, (0, ti[0], v))
                if bo in pos and bi in pos:
                    out[i, j] += (fmove(p[start], *so, p[start+2], p[start+1], v)
                                  * a[pos[bo], pos[bi]]
                                  * fmove(q[start], *ti, q[start+2], q[start+1], v))
    return out


def braid(n, start):
    local = np.zeros((len(basis(2)), len(basis(2))), complex)
    pos = {x: i for i, x in enumerate(basis(2))}
    for j, (s, p) in enumerate(basis(2)):
        swapped = s[::-1]
        phase = 1
        if s == (1, 1) and not MUTATE:
            phase = np.exp(1j * np.pi * (-4 if p[-1] == 0 else 3) / 5)
        local[pos[swapped, (0, swapped[0], p[-1])], j] = phase
    return two(local, start, n)


def vacancy_lift():
    out = np.zeros((len(basis(4)), len(basis(2))), complex)
    pos = {x: i for i, x in enumerate(basis(4))}
    for j, (s, p) in enumerate(basis(2)):
        out[pos[(s[0], 0, s[1], 0), (0, p[1], p[1], p[2], p[2])], j] = 1
    return out


def main():
    print('python', platform.python_version(), 'numpy', np.__version__)
    print('mode', 'phase-free MUTATION' if MUTATE else 'sourced F,R')
    print('carrier dimensions', [len(basis(n)) for n in (1, 2, 3, 4)])
    close(FM.T @ FM, np.eye(2), 'F unitary')
    for n in (2, 3, 4):
        for start in range(n-1):
            b = braid(n, start)
            close(b.conj().T @ b, np.eye(len(b)), 'local braid unitary')
    b1, b2 = braid(3, 0), braid(3, 1)
    # c_(O^2,O)=c_12 c_23. Test every matrix unit, not random samples.
    crossing = b1 @ b2
    for _, _, a in units(2):
        close(crossing @ prefix(a, 2, 3), two(a, 1, 3) @ crossing,
              'block naturality')
    close(b1 @ b2 @ b1, b2 @ b1 @ b2, 'braid relation')
    print('PASS F/R unitarity, braid relation, all 13 block-naturality tests')
    b, v = braid(4, 1), vacancy_lift()
    alpha = lambda a: b @ prefix(a, 2, 4) @ b.conj().T
    close(v.conj().T @ v, np.eye(5), 'V isometric')
    close(alpha(np.eye(5)), np.eye(34), 'alpha unital')
    number = np.diag([sum(s) for s, _ in basis(4)])
    matrix_units = list(units(2))
    for i, j, a in matrix_units:
        aa = alpha(a)
        close(aa @ v, v @ a, 'intertwining')
        close(alpha(a.conj().T), aa.conj().T, 'dagger')
        local = b2 @ prefix(a, 2, 3) @ b2.conj().T
        close(aa, prefix(local, 3, 4), 'three-site support')
        degree = sum(basis(2)[i][0]) - sum(basis(2)[j][0])
        close(number @ aa - aa @ number, degree * aa, 'occupation degree')
        for _, _, e in matrix_units:
            close(alpha(a @ e), aa @ alpha(e), 'multiplication')
    for site in (0, 1):
        p = np.diag([int(s[site] == 0) for s, _ in basis(2)])
        target = np.diag([int(s[2*site] == 0) for s, _ in basis(4)])
        close(alpha(p), target, 'one-site support')
    print('PASS unitality, dagger, 169 products, corner intertwining, support, grading')
    # Sharp support witness: the hop changes both fine endpoint occupations.
    pos = {x: i for i, x in enumerate(basis(2))}
    hop = np.zeros((5, 5), complex)
    hop[pos[((1, 0), (0, 1, 1))], pos[((0, 1), (0, 0, 1))]] = 1
    for site in (0, 2):
        p = np.diag([int(s[site] == 0) for s, _ in basis(4)])
        assert np.max(np.abs(alpha(hop) @ p - p @ alpha(hop))) > .9
    print('PASS range-two claim refuted by endpoint commutators')


if __name__ == '__main__':
    main()
