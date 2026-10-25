"""Independent F4 audit, with no imports from author check implementations.

Source definitions: ../NOTE.md:64-111 (physical probe forms), :220-325
(local KS density and F9), :347-380 (critical/subcritical heat bounds).
Conventions: CONVENTIONS (m), (ap), (ar); Hermitian forms linear in slot 2.
Finite tests assert invariants, not an asymptotic theorem. Largest dense
matrix: 256x256 on the N=8 all-active block; no diagonalization of a chain.
Run: PYTHONDONTWRITEBYTECODE=1 OPENBLAS_NUM_THREADS=1 python3 <this file>
Mutations: --mutate-half-current or --mutate-drop-gram must fail assertions.
Raw outputs are saved by the reviewer beside this file as review_*.txt.
"""
import argparse
import json
import math
import numpy as np

TOL = 1e-9
I = np.eye(2, dtype=complex)
X = np.array([[0, 1], [1, 0]], dtype=complex)
Y = np.array([[0, -1j], [1j, 0]], dtype=complex)
Z = np.diag([1, -1]).astype(complex)


def tensor_word(N, placements):
    result = np.ones((1, 1), dtype=complex)
    for j in range(N):
        result = np.kron(result, placements.get(j, I))
    return result


def dense_current_check(mutated):
    """Derive currents from actual matrices, never from a Pauli sign table."""
    N, a = 8, 1.7
    identity = np.eye(2**N, dtype=complex)
    densities = [a * (identity + tensor_word(N, {j: X, (j+1) % N: Z}))
                 for j in range(N)]
    currents = [1j * (densities[j] @ densities[(j+1) % N]
                     - densities[(j+1) % N] @ densities[j]) for j in range(N)]
    current_errors = []
    for j, current in enumerate(currents):
        oracle = -2*a*a*tensor_word(N, {j: X, (j+1) % N: Y, (j+2) % N: Z})
        current_errors.append(float(np.max(np.abs(current - oracle))))
    assert max(current_errors) < TOL, "forward current sign/factor"
    if mutated:
        currents = [current / 2 for current in currents]

    def mode(n):
        return N/(4*math.pi) * sum(
            np.exp(2j*math.pi*n*j/N) * (densities[j] - currents[j])
            for j in range(N))

    plus, minus, zero = mode(1), mode(-1), mode(0)
    assert np.max(np.abs(plus.conj().T - minus)) < TOL, "mode adjoints"
    beta = 2*math.sin(2*math.pi/N)/(2*math.pi/N)
    residual = plus @ minus - minus @ plus - beta*zero
    expected = N*N*a**4*math.sin(4*math.pi/N)/(math.pi**2)
    observed = []
    for j in range(N):
        witness = tensor_word(N, {j: X, (j+1) % N: Y, (j+2) % N: Y,
                                 (j+3) % N: Y, (j+4) % N: Z})
        coefficient = np.einsum("ij,ji->", witness, residual)/(2**N)
        assert abs(coefficient - expected) < TOL, (
            "F9 five-site coefficient", j, coefficient, expected)
        assert abs(np.einsum("ij,ji->", witness, zero)) < TOL
        observed.append(float(coefficient.real))
    print(json.dumps(dict(test="F4.4 dense all-active N=8 KS oracle",
                          matrix_dimension=2**N, coupling=a,
                          max_current_error=max(current_errors),
                          expected_coefficient=expected, observed=observed)))


def gram_check(mutated):
    """Nonorthogonal complex probes; coordinate norm is not physical norm."""
    V = np.array([[1, 1j], [0, .05]], dtype=complex)
    R = np.array([[0, 1+1j], [2-1j, 3]], dtype=complex)
    G, B = V.conj().T @ V, V.conj().T @ R @ V
    values, vectors = np.linalg.eigh(G)
    inverse_root = (vectors / np.sqrt(values)) @ vectors.conj().T
    physical = np.linalg.norm(R, 2)
    candidate = np.linalg.norm(B if mutated else inverse_root @ B @ inverse_root, 2)
    assert abs(candidate - physical) < TOL, (
        "F4.1 physical Gram norm", candidate, physical)
    assert abs(np.linalg.norm(B, 2) - physical) > .1
    # Directly use singular vectors to attain the norm in physical probes.
    U, singular, Vh = np.linalg.svd(R)
    u, v = U[:, 0], Vh.conj().T[:, 0]
    assert abs(abs(np.vdot(u, R @ v)) - physical) < TOL
    print(json.dumps(dict(test="F4.1 complex probe Gram invariance",
                          physical_norm=physical, corrected_norm=float(candidate),
                          raw_coordinate_norm=float(np.linalg.norm(B, 2)))))


def heat_threshold_check():
    """Exact rank-one spectral optimum explains the converse obstruction.

    K=diag(1,lambda), R=(lambda^2/N^2)|1><1|. Then q=N^-2,
    b_(s,alpha)=p^p exp(-p) q lambda^(1-alpha), p=s+1+alpha,
    provided lambda>=p. This is a scalar calculation, not a KS substitute.
    """
    rows = []
    for s in (0, 1, 2):
        for alpha in (.25, .5, .75):
            previous = None
            for N in (8, 16, 32):
                loglam, q, p = float(N*N), 1/(N*N), s+1+alpha
                logb = p*math.log(p)-p+math.log(q)+(1-alpha)*loglam
                # Direct log evaluation at t=p/lambda, avoiding overflow.
                logt = math.log(p)-loglam
                direct = p*logt+(s+2)*loglam+math.log(q)-p
                assert abs(direct-logb) < 1e-9
                if previous is not None:
                    assert q < previous[0] and logb > previous[1]
                previous = (q, logb)
                rows.append(dict(s=s, alpha=alpha, N=N, q=q, log_b=logb))
    # At critical alpha=1 the exponential factor disappears exactly.
    for s in (0, 1, 2):
        p = s+2
        assert abs(math.exp(p*math.log(p)-p) - (p/math.e)**p) < TOL
    print(json.dumps(dict(test="F4.5 exact critical/subcritical separation", rows=rows)))


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--mutate-half-current", action="store_true")
    parser.add_argument("--mutate-drop-gram", action="store_true")
    args = parser.parse_args()
    gram_check(args.mutate_drop_gram)
    dense_current_check(args.mutate_half_current)
    heat_threshold_check()
    print("PASS: all independent invariants; finite checks support, do not replace, the proofs")


if __name__ == "__main__":
    main()
