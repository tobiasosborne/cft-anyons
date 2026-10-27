#!/usr/bin/env python3
"""Finite checks of same_system.md. Run from repo root; no network.
Ground truth: references/text/CFTFromLatticeFermions.txt:1176-1205,
2372-2384,3379-3418; cft_machine/benchmarks/fermion/WILSON_PROOF.md:9-93.
All-size proof: same_system.md. Complex128; absolute tolerance 2e-12.
Mutation: --mutate flips the Wilson limit's sign and must fail.
"""
import argparse
import json
import math
import numpy as np

parser = argparse.ArgumentParser()
parser.add_argument('--mutate', action='store_true')
args = parser.parse_args()
tol = 2e-12
sy = np.array([[0, -1j], [1j, 0]])
U = np.array([[1, 1], [1j, -1j]]) / math.sqrt(2)
pplus = np.outer(U[:, 0], U[:, 0].conj())
assert np.linalg.norm(U.conj().T @ U - np.eye(2)) < tol
assert np.linalg.norm(U.conj().T @ sy @ U - np.diag([1, -1])) < tol


def grid(M):
    return np.arange(-M + 1, M, 2) / 2


def mode(M, n):
    eps = 2 * math.pi / M
    A = np.zeros((M, M))
    for j, r in enumerate(grid(M)):
        if 0 <= j - n < M:
            A[j - n, j] = math.cos(eps*n/4)**2 * math.sin(eps*(r-n/2))/eps
    return A


def cocycle(S, A, B):
    I = np.eye(len(S))
    return np.trace(S @ A @ (I-S) @ B @ S - S @ B @ (I-S) @ A @ S)


output = []
for M in (8, 16, 32):
    rs, eps = grid(M), 2*math.pi/M
    max_error, finite_mix = 0.0, 0.0
    for r in rs:
        sign = 1 if r > 0 else -1
        Pinf = (np.eye(2) + (1 if args.mutate else -1)*sign*sy) / 2
        expected = np.diag([int(r < 0), int(r > 0)])
        error = np.linalg.norm(U.conj().T @ Pinf @ U - expected)
        assert error < tol, 'Wilson limit must be S_negative plus S_positive'
        max_error = max(max_error, error)
        h = np.array([[0, np.exp(-1j*eps*r)-1],
                      [np.exp(1j*eps*r)-1, 0]]) / eps
        energy = 2*abs(math.sin(eps*r/2))/eps
        P = (np.eye(2) - h/energy) / 2
        assert np.linalg.norm(P@P-P) < tol, 'actual finite covariance is pure'
        err = np.linalg.norm(P-Pinf, ord=2)
        assert abs(err-math.sin(abs(eps*r)/4)) < tol, 'WS-1 exact row error'
        finite_mix = max(finite_mix, abs((U.conj().T @ P @ U)[0, 1]))
    assert finite_mix > 0.1, 'finite Dirac state must not be replaced by chiral product'
    # The same fixed spinor change commutes with nested momentum inclusion.
    j = np.zeros((2*M, M))
    for col, r in enumerate(rs):
        j[np.flatnonzero(grid(2*M) == r)[0], col] = 1
    jf = np.kron(j, np.eye(2))
    um, uf = np.kron(np.eye(M), U), np.kron(np.eye(2*M), U)
    assert np.linalg.norm(uf.conj().T @ jf @ um - jf) < tol
    Sminus = np.diag((rs < 0).astype(float))
    Splus = np.eye(M)-Sminus
    reflection = np.eye(M)[::-1]
    assert np.array_equal(reflection @ Splus @ reflection, Sminus)
    for n in (-2, -1, 0, 1, 2):
        A = mode(M, n)
        diagonalized = um.conj().T @ np.kron(A, pplus) @ um
        assert np.linalg.norm(diagonalized-np.kron(A, np.diag([1, 0]))) < tol
        B = reflection @ A @ reflection
        direct = np.zeros_like(B)
        for col, r in enumerate(rs):
            if 0 <= col+n < M:
                direct[col+n, col] = -math.cos(eps*n/4)**2*math.sin(eps*(r+n/2))/eps
        assert np.linalg.norm(B-direct) < tol, 'source right coefficient under reflection'
        left_z = cocycle(Sminus, A, mode(M, -n))
        right_z = cocycle(Splus, B, reflection @ mode(M, -n) @ reflection)
        assert abs(left_z-right_z) < tol, 'same central ledger in complementary sea'
    output.append(dict(M=M, covariance_error=max_error,
                       finite_chiral_mixing=float(finite_mix)))
print(json.dumps({'status': 'GREEN', 'tolerance': tol,
                  'checks': 'Wilson covariance, refinement, projected modes, reflected sea',
                  'sizes': output}, indent=2))
