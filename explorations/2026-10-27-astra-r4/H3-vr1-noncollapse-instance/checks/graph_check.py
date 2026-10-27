#!/usr/bin/env python3
"""Finite all-carrier invariants for graph_certificate.md; no extrapolated proof.
Run: python3 checks/graph_check.py [--mutation wrap|normal-order|energy]
Only sparse matrices on <=256 input states; no many-body diagonalization.
Source coefficients: references/text/CFTFromLatticeFermions.txt:3379--3414.
Normal ordering / cocycle: same:848--855,881--892. Conventions: root (w),
../NOTE.md and graph_certificate.md. Float64 absolute tolerance 2e-10.
"""
import argparse
import json
import math
import numpy as np
from scipy import sparse

parser = argparse.ArgumentParser()
parser.add_argument('--mutation', choices=['wrap', 'normal-order', 'energy'])
MUTATION = parser.parse_args().mutation
TOL = 2e-10


def labels(M):
    assert M >= 4 and M % 2 == 0
    return np.arange(-M + 1, M, 2, dtype=float) / 2


def mode(M, n, continuum=False):
    A = np.zeros((M, M))
    eps = 2 * math.pi / M
    for j, r in enumerate(labels(M)):
        i = j - n
        if 0 <= i < M or MUTATION == 'wrap':
            q = r - n / 2
            A[i % M, j] = q if continuum else (
                math.cos(eps * n / 4)**2 * math.sin(eps * q) / eps)
    return A


def elementary(mask, index, create):
    occupied = (mask >> index) & 1
    if occupied == int(create):
        return None
    sign = -1 if (mask & ((1 << index) - 1)).bit_count() % 2 else 1
    return mask ^ (1 << index), sign


def energies(M):
    rs = labels(M)
    weights = np.abs(rs)
    if MUTATION == 'energy':
        eps = 2 * math.pi / M
        weights = np.abs(np.sin(eps * rs)) / eps
    return np.array([sum(weights[j] for j in range(M) if b >> j & 1)
                     for b in range(1 << M)])


def quadratic(M, A, masks=None):
    rs = labels(M)
    masks = list(range(1 << M)) if masks is None else list(masks)
    rows, cols, data = [], [], []
    edges = list(zip(*np.nonzero(A)))
    sea_trace = sum(A[j, j] for j, r in enumerate(rs) if r < 0)
    for column, mask in enumerate(masks):
        for i, j in edges:
            # Physical c_j is excitation f_j (r>0) or f_j^* (r<0).
            first = elementary(mask, j, rs[j] < 0)
            if first is None:
                continue
            middle, sign1 = first
            second = elementary(middle, i, rs[i] > 0)
            if second is not None:
                output, sign2 = second
                rows.append(output); cols.append(column)
                data.append(A[i, j] * sign1 * sign2)
        if sea_trace and MUTATION != 'normal-order':
            rows.append(mask); cols.append(column); data.append(-sea_trace)
    return sparse.coo_matrix((data, (rows, cols)),
                             shape=(1 << M, len(masks))).tocsr()


def padding(M, Q):
    indices = [int(np.flatnonzero(labels(Q) == r)[0]) for r in labels(M)]
    masks = [sum(((b >> j) & 1) << i for j, i in enumerate(indices))
             for b in range(1 << M)]
    J = sparse.coo_matrix((np.ones(1 << M), (masks, range(1 << M))),
                          shape=(1 << Q, 1 << M)).tocsr()
    return J, masks


def maximum(A):
    return float(np.max(np.abs(A.data), initial=0))


def schur(A):
    X = abs(A)
    return math.sqrt(float(np.max(np.asarray(X.sum(axis=0)), initial=0)) *
                     float(np.max(np.asarray(X.sum(axis=1)), initial=0)))


def weighted(A, Eout, Ein, p, s, loss):
    return sparse.diags((1 + Eout)**(p*s)) @ A @ sparse.diags(
        (1 + Ein)**(-p*(s+loss)))


def cocycle(A, B, M):
    S = np.diag((labels(M) < 0).astype(float))
    return np.trace(S @ A @ (np.eye(M)-S) @ B @ S -
                    S @ B @ (np.eye(M)-S) @ A @ S)


report = {'scope': 'finite all-carrier invariants; analytic proof in graph_certificate.md',
          'tolerance': TOL, 'full_fock_brackets': [], 'refinements': []}
for M in (4, 8):
    rs, E = labels(M), energies(M)
    Ts = {n: quadratic(M, mode(M, n)) for n in range(-4, 5)}
    assert maximum(Ts[0][:, 0]) < TOL, 'sea normal ordering must kill vacuum at n=0'
    assert mode(M, 1)[-1, 0] == 0, 'no UV periodic wrap is allowed'
    D = sparse.diags(E)
    for n in range(-3, 4):
        assert maximum(Ts[n].T - Ts[-n]) < TOL, 'adjoint pairing'
        assert maximum(D @ Ts[n] - Ts[n] @ D + n*Ts[n]) < TOL, 'exact energy shift'
    worst = 0.0
    for m in range(-2, 3):
        for n in range(-2, 3):
            A, B = mode(M, m), mode(M, n)
            C = A @ B - B @ A - (m-n)*mode(M, m+n)
            scalar = cocycle(A, B, M)
            R = Ts[m] @ Ts[n] - Ts[n] @ Ts[m] - (m-n)*Ts[m+n]
            oracle = quadratic(M, C) + scalar*sparse.eye(1 << M)
            assert maximum(R - oracle) < TOL, 'normal-ordered Schwinger identity'
            z = (m**3-m)/12 if m+n == 0 else 0
            R = R - z*sparse.eye(1 << M)
            worst = max(worst, schur(weighted(R, E, E, 2, 0, 2)))
    report['full_fock_brackets'].append(dict(M=M, dimension=1 << M,
                                           max_p2_s0_residual_schur=worst))
    J, masks = padding(M, 2*M)
    Ef = energies(2*M)
    assert maximum(J.T @ J - sparse.eye(1 << M)) < TOL, 'isometric refinement'
    assert np.array_equal(Ef[masks], E), 'exact linear energy transport'
    for n in (-2, -1, 0, 1, 2):
        fine_columns = quadratic(2*M, mode(2*M, n), masks=masks)
        defect = fine_columns - J @ Ts[n]
        shift_error = sparse.diags(Ef) @ defect - defect @ D + n*defect
        assert maximum(shift_error) < TOL, 'all-input refinement defect energy shift'
        for p in (2, 3):
            bound = schur(weighted(defect, Ef, E, p, 1, 1))
            if M >= 4*(abs(n)+1):
                alpha, q = min(p-1, 2), min(p, 3)
                g = 1+abs(n)/2
                d = g**3/6+n*n*g/16+g
                h = (2*g)**(1-alpha/2)*d**(alpha/2)
                B = (1+abs(n))**q*(3**q+abs(n))*(1+abs(n))**(p+q)
                e = h*(1+2**(-alpha))*(2*math.pi/M)**alpha*B
                assert bound <= e+TOL, 'analytic whole-carrier A3 majorant'
            report['refinements'].append(dict(M=M, n=n, p=p, s=1, schur=bound))

# Global coefficients: sample omitted input/output edges as well as allowed ones.
for M in (16, 32, 64, 128):
    eps = 2*math.pi/M
    for n in range(-3, 4):
        g = 1 + abs(n)/2
        d = g**3/6 + n*n*g/16 + g
        for r in np.arange(-M, M, 0.5):
            if r % 1 == 0:
                continue
            inside = abs(r) < M/2 and abs(r-n) < M/2
            f = (math.cos(eps*n/4)**2*math.sin(eps*(r-n/2))/eps) if inside else 0
            delta = abs(f - (r-n/2))
            assert delta <= d*eps**2*(1+abs(r))**3 + TOL, 'global cubic bound'
            assert delta <= math.sqrt(2*g*d)*eps*(1+abs(r))**2 + TOL, 'p2 interpolation'

limit = 2*(math.sqrt(2)-1)/math.pi
uv = []
for M in (64, 256, 1024, 1048576):
    eps, r = 2*math.pi/M, M/4-0.5
    error = (2*math.sin(eps*r/2)-math.sin(eps*r))/eps
    ratio = error/(1+r)
    assert ratio > 0.2, 'p1 refinement defect has nonzero UV lower bound'
    uv.append(dict(M=M, p1_lower=ratio, p2_lower=error/(1+r)**2))
assert abs(uv[-1]['p1_lower']-limit) < 2e-6, 'independent explicit UV limit'
report['p1_counterexample'] = dict(limit=limit, samples=uv)

norms = []
for M in (4, 8, 16, 64, 1024):
    eps = 2*math.pi/M
    direct = math.sqrt(2)*math.cos(eps/2)**2*math.sin(eps/2)/eps
    assert direct > 0.3, 'fixed coarse-vector non-collapse witness'
    if M <= 8:
        vacuum_column = quadratic(M, mode(M, -2), masks=[0])
        assert abs(float(sparse.linalg.norm(vacuum_column))-direct) < TOL
        w = vacuum_column.toarray()[:, 0]/direct
        v = w/math.sqrt(2)
        v[0] = 1/math.sqrt(2)
        for p in (2, 3):
            T = quadratic(M, mode(M, -2))
            diagonal = float(v @ (T @ ((1+energies(M))**(-p)*v)))
            assert abs(diagonal-direct/2) < TOL, 'fixed diagonal A5 witness'
            assert diagonal >= 1/(2*math.sqrt(2)*math.pi), 'uniform A5 lower bound'
    norms.append(dict(M=M, vacuum_Lminus2_norm=direct))
assert abs(norms[-1]['vacuum_Lminus2_norm']-1/math.sqrt(2)) < 2e-5
report['noncollapse'] = norms
print(json.dumps(report, indent=2))
