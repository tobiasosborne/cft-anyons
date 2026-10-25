"""Independent small F4.4 audit (no large tensor matrices).

Definitions: ../NOTE.md (F6)-(F10); CONVENTIONS.md (ap) KS modes.
Reproduce: PYTHONDONTWRITEBYTECODE=1 OPENBLAS_NUM_THREADS=1 python3
explorations/2026-10-25-astra-r3/F4-ward-to-residual/checks/reviewer_qutrit.py
Exact occupancy masks check recursive K; Float64 local matrices and a
Pauli-word oracle check the five-site coefficient, tolerance 1e-10.
The coupling a is 1 or 2 for the algebraic check; its arbitrary scale
appears only as a polynomial factor a^4, not as an enormous float.
"""
from collections import defaultdict
import numpy as np

P = np.diag([0., 1., 1.])
X = np.zeros((3, 3), dtype=complex)
Y = X.copy()
Z = X.copy()
X[1:, 1:] = [[0, 1], [1, 0]]
Y[1:, 1:] = [[0, -1j], [1j, 0]]
Z[1:, 1:] = [[1, 0], [0, -1]]
k = np.kron(P, P) + np.kron(X, Z)
assert np.min(np.linalg.eigvalsh(k)) > -1e-10
assert np.max(np.linalg.eigvalsh(k)) < 2 + 1e-10
assert np.max(abs(1j*(np.kron(k, np.eye(3)) @ np.kron(np.eye(3), k)
                         - np.kron(np.eye(3), k) @ np.kron(k, np.eye(3)))
                         + 2*np.kron(np.kron(X, Y), Z))) < 1e-10


def rotate(mask, N):
    return ((mask << 1) & ((1 << N)-1)) | (mask >> (N-1))


def insert(mask, N):
    return sum(((mask >> j) & 1) << (2*j) for j in range(N))


def control_label(mask, N):
    """1 means vacuum; N>=8 denotes eigenvalue lambda_N, left symbolic."""
    if mask == 0:
        return 1
    if N == 8:
        return 8
    parity_masks = [sum(1 << j for j in range(parity, N, 2))
                    for parity in (0, 1)]
    for parity, allowed in enumerate(parity_masks):
        if mask & ~allowed == 0:
            small = sum(((mask >> (2*j+parity)) & 1) << j
                        for j in range(N//2))
            return control_label(small, N//2)
    return N


for N in (8, 16):
    for mask in range(1 << N):
        assert control_label(mask, N) == control_label(rotate(mask, N), N)
        adjacent = any((mask >> j) & (mask >> ((j+1) % N)) & 1
                       for j in range(N))
        if adjacent:
            assert control_label(mask, N) == N
for mask in range(1 << 8):
    assert control_label(insert(mask, 8), 16) == control_label(mask, 8)
    assert rotate(rotate(insert(mask, 8), 16), 16) == insert(rotate(mask, 8), 8)

paulis = [np.eye(2), np.array([[0, 1], [1, 0]]),
          np.array([[0, -1j], [1j, 0]]), np.diag([1, -1])]
product = {}
for u, A in enumerate(paulis):
    for v, B in enumerate(paulis):
        coefficients = [np.trace(C @ A @ B)/2 for C in paulis]
        nonzero = [j for j, c in enumerate(coefficients) if abs(c) > 1e-10]
        assert len(nonzero) == 1
        w = nonzero[0]
        product[u, v] = w, coefficients[w]


def word(N, j, labels):
    out = [0]*N
    for q, label in enumerate(labels):
        out[(j+q) % N] = label
    return tuple(out)


def modes(N, n, a):
    out = defaultdict(complex)
    for j in range(N):
        f = N/(4*np.pi)*np.exp(2j*np.pi*n*j/N)
        out[(0,)*N] += a*f
        out[word(N, j, (1, 3))] += a*f
        out[word(N, j, (1, 2, 3))] += 2*a*a*f
    return out


def multiply(A, B):
    out = defaultdict(complex)
    for u, a in A.items():
        for v, b in B.items():
            phase = 1
            labels = []
            for x, y in zip(u, v):
                label, z = product[x, y]
                labels.append(label)
                phase *= z
            out[tuple(labels)] += a*b*phase
    return out


for N in (8, 16, 32):
    for a in (1, 2):
        A, B = modes(N, 1, a), modes(N, -1, a)
        AB, BA = multiply(A, B), multiply(B, A)
        target = word(N, 0, (1, 2, 2, 2, 3))
        observed = AB[target]-BA[target]
        expected = N*N*a**4*np.sin(4*np.pi/N)/np.pi**2
        assert abs(observed-expected) < 1e-10
        # Sign mutation must be rejected by the independent matrix oracle.
        assert abs(-observed-expected) > 1e-4
        print(f'N={N}, a={a}, five-site coefficient={observed.real:.12g}; '
              f'formula error={abs(observed-expected):.3g}')

print('PASS: qutrit positivity/current, recursive translation-invariant K, '
      'exact K transport, fine translation covariance, active-bond scalar '
      'control block, Pauli coefficient, and sign mutation rejection')
