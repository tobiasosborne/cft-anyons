#!/usr/bin/env python3
"""Three-state finite chain calibration, in an invariant <=512-dimensional sector.

The full carrier is (C|vac> + C^2)^{tensor N}. The checked sector contains
all translates of a five-active-site block; each block has 2^5 spin states.
It reduces every density. Append-vacuum refinement is on the FULL carrier;
only its action on the specified fixed coarse vector is measured here.
See README.md for conventions, all-scale dilution certificate and scope.
Run: OPENBLAS_NUM_THREADS=1 python3 -B <this path> [--mutate omit-second-term]
"""
import argparse
import numpy as np
from scipy import sparse as sp

parser = argparse.ArgumentParser()
parser.add_argument("--mutate", choices=["omit-second-term"])
args = parser.parse_args()
tol = 2e-10
X = np.array([[0, 1], [1, 0]], dtype=complex)
Y = np.array([[0, -1j], [1j, 0]], dtype=complex)
Z = np.diag([1., -1.]).astype(complex)
I = np.eye(2)
assert np.array_equal(X @ Y, 1j * Z)
h = (np.kron(X, X) + .5*np.kron(Z, Z)
     + .25*(np.kron(Z, I)+np.kron(I, Z)) + 2*np.eye(4))
assert np.linalg.eigvalsh(h).min() >= .5 - tol
local = [sp.csr_matrix(np.kron(np.eye(2**j), np.kron(h, np.eye(2**(3-j)))))
         for j in range(4)]
zero = sp.csr_matrix((32, 32), dtype=complex)


def bracket(a, b):
    return a @ b - b @ a


def close(a, b, label):
    error = sp.linalg.norm(a - b)
    assert error < tol, (label, error)


def permutation(rows):
    return sp.csr_matrix((np.ones(len(rows)), (rows, np.arange(len(rows)))),
                         shape=(len(rows), len(rows)))


def ks(k, current, n, barred=False):
    N = len(k)
    phases = np.exp(((-1 if barred else 1)*2j*np.pi*n/N)*np.arange(N))
    sign = 1 if barred else -1
    return N/(4*np.pi)*sum((phases[j]*(k[j]+sign*current[j]) for j in range(N)),
                           sp.csr_matrix(k[0].shape))


# Independent exact-dyadic 32-dimensional oracle, cf. README derivation.
Hblock = sum(local, zero)
Qblock = sum((1j*bracket(local[j], local[j+1]) for j in range(3)), zero)
vblock = np.eye(32)[:, 16]  # active |down,up,up,up,up>, then vacancies
oracle = np.zeros(32, dtype=complex)
oracle[[8, 16, 19, 28]] = [-9j/4, 4j, 15j/4, -4j]
assert np.linalg.norm(bracket(Hblock, Qblock) @ vblock - oracle) < tol
assert abs(np.vdot(oracle, oracle).real - 409/8) < tol
print("PASS: positive active bond; exact commutator vector; norm squared = 409/8")
print("N, checked_dimension, norm_Zv_unscaled, norm_Zv_lambda_N^-4, local_identity_error")
previous = None
for N in [6, 8, 12, 16]:
    # All placements are translates of precisely the same local 3-state density.
    k = []
    for j in range(N):
        blocks = [local[(j-start) % N] if (j-start) % N < 4 else zero
                  for start in range(N)]
        k.append(sp.block_diag(blocks, format="csr"))
    dim = 32*N
    Urows = [32*((start+1) % N)+bits for start in range(N) for bits in range(32)]
    Prows = [32*((2-start-5) % N)+int(f"{bits:05b}"[::-1], 2)
             for start in range(N) for bits in range(32)]
    U, P = permutation(Urows), permutation(Prows)
    identity = sp.eye(dim, format="csr")
    close(U.getH()@U, identity, "unitary translation")
    close(P@P, identity, "linear reflection involution")
    indices = np.arange(dim)
    for _ in range(N):
        indices = np.asarray(Urows)[indices]
    assert np.array_equal(indices, np.arange(dim))
    current = [1j*bracket(k[j], k[(j+1) % N]) for j in range(N)]
    H = sum(k, sp.csr_matrix((dim, dim)))
    Q = sum(current, sp.csr_matrix((dim, dim)))
    for j in range(N):
        close(U@k[j]@U.getH(), k[(j+1) % N], "density translation")
        close(P@k[j]@P, k[-j % N], "density reflection")
    close(P@Q@P, -Q, "current oddness")
    defect = bracket(H, Q)
    R = []
    for j in range(N):
        outer = k[j] if args.mutate else k[j]+k[(j+1) % N]
        R.append(bracket(outer, bracket(k[j], k[(j+1) % N])))
    local_rhs = 1j*sum(R, sp.csr_matrix((dim, dim)))
    close(defect, local_rhs, "three-site defect (mutation-sensitive)")
    for n in [1, 2]:
        L, bar = ks(k, current, n), ks(k, current, n, True)
        close(U@L@U.getH(), np.exp(-2j*np.pi*n/N)*L, "left Fourier covariance")
        close(U@bar@U.getH(), np.exp(2j*np.pi*n/N)*bar, "right Fourier covariance")
        close(L.getH(), ks(k, current, -n), "adjoint pairing")
    v = np.zeros(dim, dtype=complex)
    v[16] = 1
    raw = np.linalg.norm(N*N/(8*np.pi**2)*(defect@v))
    expected = N*N*np.sqrt(409/8)/(8*np.pi**2)
    assert abs(raw-expected) < tol
    def phase_projection(w, q):
        acc = np.zeros(dim, dtype=complex)
        translated = w.copy()
        for j in range(N):
            acc += np.exp(-2j*np.pi*q*j/N)*translated/N
            translated = U@translated
        return acc
    block_square = sum(np.linalg.norm(phase_projection(R[0]@phase_projection(v, q), q))**2
                       for q in range(N))
    assert abs(raw**2-N**6*block_square/(64*np.pi**4)) < tol
    gram_vectors = np.column_stack([rj@v for rj in R])
    gram = gram_vectors.conj().T@gram_vectors
    assert abs(raw**2-N**4*np.sum(gram)/(64*np.pi**4)) < tol
    lam = N**-4
    diluted = raw*lam**3  # H is linear and Q is quadratic in density.
    print(f"{N}, {dim}, {raw:.12e}, {diluted:.12e}, {sp.linalg.norm(defect-local_rhs):.3e}")
    # For this vector, the zero-mode action lies in the first block. Its
    # append-vacuum transport is the same 32 coefficients at every N.
    current_block = N/(4*np.pi)*(Hblock-Qblock)@vblock
    if previous is not None:
        oldN, old_action = previous
        observed = np.linalg.norm(current_block-old_action)
        expected_a3 = (N-oldN)/(4*np.pi)*np.linalg.norm((Hblock-Qblock)@vblock)
        assert abs(observed-expected_a3) < tol
        print(f"A3 diagnostic {oldN}->{N}: unscaled zero-mode defect {observed:.12e}")
    previous = (N, current_block)
print("PASS: local identity, parity, both Fourier covariances, transported-vector scaling")
print("PASS: independent phase projections and local-defect Gram norm identity")
print("Unscaled chain is NOT a VR-1 counterexample; N^-4 dilution has zero limiting modes.")
