#!/usr/bin/env python3
"""Independent reviewer inequalities for graph_certificate.md (pillar P4).

Run from repository root: python3 <this-path> > <this-path-with-.json>
Uses the reviewed basis constructors, independently checks signed polynomial
Schur bounds, physical CAR intertwiners and all-bracket scalar majorants.
No many-body matrix exceeds 256 states. Source and conventions are those of
graph_certificate.md; Float64 absolute tolerance is 2e-10.
"""
import ast
import json
import math
from pathlib import Path

import numpy as np
from scipy import sparse


TOL = 2e-10
source = Path(__file__).with_name('graph_check.py')
tree = ast.parse(source.read_text())
definitions = [node for node in tree.body if isinstance(
    node, (ast.Import, ast.ImportFrom, ast.FunctionDef))]
ns = {'MUTATION': None, 'TOL': TOL}
exec(compile(ast.Module(body=definitions, type_ignores=[]), str(source), 'exec'), ns)

schur_checks = 0
for M in (4, 8):
    rs, E = ns['labels'](M), ns['energies'](M)
    Q = 1 + E
    for k in range(-3, 4):
        for q in (1, 1.5, 2, 4):
            C = np.zeros((M, M))
            for j, r in enumerate(rs):
                i = j - k
                if 0 <= i < M:
                    C[i, j] = (-1)**j * (1 + abs(r))**q
            D = ns['quadratic'](M, C)
            F = (1 + abs(k))**q * (3**q + abs(k))
            column = np.asarray(abs(D).sum(axis=0)).ravel()
            row = np.asarray(abs(D).sum(axis=1)).ravel()
            assert np.all(column <= F * Q**q + TOL), 'column-energy bound'
            assert np.all(row <= F * (1 + abs(k))**q * Q**q + TOL), 'row-energy bound'
            for t in (0, 0.5, 2, 4):
                Y = sparse.diags(Q**t) @ D @ sparse.diags(Q**(-t-q))
                assert ns['schur'](Y) <= F * (1 + abs(k))**(t+q) + TOL
                schur_checks += 1


def physical_annihilator(size, index):
    """c_r=f_r for r>0 and c_r=f_r^* for r<0, without sea subtraction."""
    rs = ns['labels'](size)
    rows, columns, data = [], [], []
    for mask in range(1 << size):
        step = ns['elementary'](mask, index, rs[index] < 0)
        if step is not None:
            output, phase = step
            rows.append(output)
            columns.append(mask)
            data.append(phase)
    return sparse.coo_matrix((data, (rows, columns)),
                             shape=(1 << size, 1 << size)).tocsr()


M = 4
J, masks = ns['padding'](M, 2*M)
car_checks = 0
for j, r in enumerate(ns['labels'](M)):
    jf = int(np.flatnonzero(ns['labels'](2*M) == r)[0])
    A = physical_annihilator(M, j)
    B = physical_annihilator(2*M, jf)
    assert ns['maximum'](B @ J - J @ A) < TOL, 'physical annihilator refinement'
    assert ns['maximum'](B.T @ J - J @ A.T) < TOL, 'physical creator refinement'
    car_checks += 2


def coefficient(M, n, r):
    eps = 2 * math.pi / M
    if abs(r) >= M/2 or abs(r-n) >= M/2:
        return 0.0
    return math.cos(eps*n/4)**2 * math.sin(eps*(r-n/2)) / eps


def majorant(n, alpha):
    g = 1 + abs(n)/2
    d = g**3/6 + n*n*g/16 + g
    return g, (2*g)**(1-alpha/2) * d**(alpha/2)


coefficient_checks = 0
for M in (32, 64, 128):
    eps = 2 * math.pi / M
    for m in range(-3, 4):
        for n in range(-3, 4):
            assert M >= 4 * (max(abs(m), abs(n), abs(m+n)) + 1)
            for alpha in (0.5, 1, 2):
                gm, hm = majorant(m, alpha)
                gn, hn = majorant(n, alpha)
                _, hsum = majorant(m+n, alpha)
                H = (hm*(1+abs(n))**(1+alpha)*gn
                     + gm*(1+abs(n))*hn
                     + hn*(1+abs(m))**(1+alpha)*gm
                     + gn*(1+abs(m))*hm + abs(m-n)*hsum)
                for r in np.arange(-M+0.5, M, 1.0):
                    C = (coefficient(M, m, r-n)*coefficient(M, n, r)
                         - coefficient(M, n, r-m)*coefficient(M, m, r)
                         - (m-n)*coefficient(M, m+n, r))
                    assert abs(C) <= H*eps**alpha*(1+abs(r))**(2+alpha) + TOL
                    coefficient_checks += 1

print(json.dumps({'status': 'PASS', 'tolerance': TOL,
                  'signed_polynomial_schur_checks': schur_checks,
                  'physical_CAR_refinement_generator_checks': car_checks,
                  'all_bracket_scalar_majorant_checks': coefficient_checks,
                  'alphas': [0.5, 1, 2]}, indent=2))
