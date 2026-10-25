"""Independent finite checks for F4.4; no many-body dense matrices.

Reproduce from repository root:
  PYTHONDONTWRITEBYTECODE=1 OPENBLAS_NUM_THREADS=1 python3 \
    explorations/2026-10-25-astra-r3/F4-ward-to-residual/checks/ks_converse_check.py
Add --mutate-current-factor: the five-site coefficient assertion must fail.
Conventions: NOTE.md F6--F10; CA-79:52--64; CONVENTIONS (ap), (ar).
All tolerances here concern the displayed finite matrix/sparse-word checks;
the asymptotic theorem in NOTE.md is analytic, not inferred from these sizes.
"""
import argparse
import hashlib
import itertools
import json
import math
from pathlib import Path
import platform

import numpy as np

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[3]
ATOL = 2e-9
PAULI = (np.eye(2, dtype=complex),
         np.array([[0, 1], [1, 0]], dtype=complex),
         np.array([[0, -1j], [1j, 0]], dtype=complex),
         np.diag([1., -1.]).astype(complex))


def matrix_oracle():
    """Derive multiplication data from explicit 2x2 matrices, not a sign table."""
    table = {}
    for i, j in itertools.product(range(4), repeat=2):
        direct = PAULI[i] @ PAULI[j]
        coeffs = [np.trace(p.conj().T @ direct) / 2 for p in PAULI]
        nonzero = [q for q, value in enumerate(coeffs) if abs(value) > ATOL]
        assert len(nonzero) == 1
        q = nonzero[0]
        phase = coeffs[q]
        assert np.linalg.norm(direct - phase * PAULI[q]) < ATOL
        assert abs(abs(phase) - 1) < ATOL
        table[i, j] = phase, q
    for i, j, k in itertools.product(range(4), repeat=3):
        phase1, q1 = table[i, j]
        phase2, q2 = table[q1, k]
        direct = PAULI[i] @ PAULI[j] @ PAULI[k]
        assert np.linalg.norm(direct - phase1 * phase2 * PAULI[q2]) < ATOL
    return table


TABLE = matrix_oracle()


def word_product(left, right):
    phase, letters = 1. + 0j, []
    for i, j in zip(left, right):
        factor, letter = TABLE[i, j]
        phase *= factor
        letters.append(letter)
    return phase, tuple(letters)


def local_word(N, j, letters):
    word = [0] * N
    for offset, letter in enumerate(letters):
        word[(j + offset) % N] = letter
    return tuple(word)


def accumulate(result, word, value):
    result[word] = result.get(word, 0j) + value


def mode(N, n, coupling, current_factor):
    result = {}
    for j in range(N):
        fourier = N / (4 * np.pi) * np.exp(2j * np.pi * n * j / N)
        accumulate(result, (0,) * N, fourier * coupling)
        accumulate(result, local_word(N, j, (1, 3)), fourier * coupling)
        accumulate(result, local_word(N, j, (1, 2, 3)),
                   fourier * current_factor * coupling**2)
    return result


def commutator(left, right):
    result = {}
    for u, c in left.items():
        for v, d in right.items():
            phase1, word1 = word_product(u, v)
            phase2, word2 = word_product(v, u)
            assert word1 == word2
            accumulate(result, word1, c * d * (phase1 - phase2))
    return result


def qutrit_checks(coupling):
    P = np.diag([0., 1., 1.])
    extended = []
    for matrix in PAULI[1:]:
        out = np.zeros((3, 3), dtype=complex)
        out[1:, 1:] = matrix
        extended.append(out)
    X, Y, Z = extended
    density = coupling * (np.kron(P, P) + np.kron(X, Z))
    eigenvalues = np.linalg.eigvalsh(density)
    assert min(eigenvalues) >= -ATOL
    assert np.linalg.norm(eigenvalues - np.array([0.] * 7 + [2 * coupling] * 2)) < ATOL
    k12, k23 = np.kron(density, np.eye(3)), np.kron(np.eye(3), density)
    current = 1j * (k12 @ k23 - k23 @ k12)
    oracle = -2 * coupling**2 * np.kron(np.kron(X, Y), Z)
    assert np.linalg.norm(current - oracle) < ATOL
    assert abs(np.linalg.norm(current, 2) - 2 * coupling**2) < ATOL
    vacancy = np.array([1., 0., 0.])
    for e in np.eye(3):
        assert np.linalg.norm(density @ np.kron(vacancy, e)) < ATOL
        assert np.linalg.norm(density @ np.kron(e, vacancy)) < ATOL
    return dict(density_dimension=9, current_dimension=27,
                density_eigenvalues=eigenvalues.tolist(),
                current_identity_error=float(np.linalg.norm(current - oracle)))


def recursive_control_checks(coupling):
    """Only diagonal occupation data; N=2 is a structural toy, not a KS size."""
    shift = lambda state: state[-1:] + state[:-1]
    states = list(itertools.product(range(3), repeat=2))
    control = {state: (1. if not any(state) else coupling**2 * 2**3)
               for state in states}
    results = []
    for N in (4, 8):
        fine_states = list(itertools.product(range(3), repeat=N))
        fine = {state: coupling**2 * N**3 for state in fine_states}
        plus, minus = set(), set()
        for state, value in control.items():
            embedded = tuple(x for old in state for x in (old, 0))
            translated = shift(embedded)
            plus.add(embedded)
            minus.add(translated)
            fine[embedded] = value
            fine[translated] = value
        assert plus & minus == {(0,) * N}
        assert min(fine.values()) == 1
        assert all(fine[state] == fine[shift(state)] for state in fine_states)
        for state, value in control.items():
            embedded = tuple(x for old in state for x in (old, 0))
            assert fine[embedded] == value
        assert all(not any(state[j] and state[(j + 1) % N] for j in range(N))
                   for state in plus | minus)
        assert all(fine[state] == coupling**2 * N**3
                   for state in itertools.product((1, 2), repeat=N))
        results.append(dict(sites=N, diagonal_entries=len(fine),
                            plus_dimension=len(plus), minus_dimension=len(minus),
                            intersection_dimension=len(plus & minus),
                            exact_transport_and_translation=True))
        control = fine
    return results


def sparse_checks(N, coupling, mutated):
    factor = 1. if mutated else 2.
    Tplus, Tminus = mode(N, 1, coupling, factor), mode(N, -1, coupling, factor)
    Tzero = mode(N, 0, coupling, factor)
    residual = commutator(Tplus, Tminus)
    beta = 2 * np.sin(2 * np.pi / N) / (2 * np.pi / N)
    for word, coefficient in Tzero.items():
        accumulate(residual, word, -beta * coefficient)
    expected = N**2 * coupling**4 * np.sin(4 * np.pi / N) / np.pi**2
    observed = []
    for j in range(N):
        five = local_word(N, j, (1, 2, 2, 2, 3))
        assert five not in Tzero, 'linear beta subtraction reached a five-site word'
        actual = residual.get(five, 0j)
        assert abs(actual - expected) < ATOL, (
            f'five-site coefficient F9 failed: N={N}, site={j}, '
            f'observed={actual}, expected={expected}, current_factor={factor}')
        observed.append(float(actual.real))
    lambda_value = coupling**2 * N**3
    L = N**2 * coupling**2 / np.pi
    l1 = sum(abs(coefficient) for coefficient in residual.values())
    triangle_bound = (2 * L**2 + 2 * L) / lambda_value**2
    F8 = 2 / (np.pi**2 * N**2) + 2 / (np.pi * coupling**2 * N**4)
    assert l1 / lambda_value**2 <= triangle_bound + ATOL
    assert triangle_bound <= F8 + ATOL
    assert L / lambda_value <= 1 / (np.pi * N) + ATOL
    assert expected >= 8 * N * coupling**4 / np.pi**2 - ATOL
    return dict(sites=N, coupling=coupling, five_site_expected=float(expected),
                coefficient_max_error=max(abs(v - expected) for v in observed),
                residual_pauli_terms=int(sum(abs(c) > ATOL for c in residual.values())),
                residual_l1_upper_bound=float(l1),
                weighted_residual_l1_upper_bound=float(l1 / lambda_value**2),
                F8_upper_bound=float(F8), A2_upper_bound=float(1 / (np.pi * N)))


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--mutate-current-factor', action='store_true')
    args = parser.parse_args()
    coupling = 1.3
    local = qutrit_checks(coupling)
    print('PASS explicit-matrix Pauli oracle: 16 products, 64 triples', flush=True)
    print('PASS qutrit density positivity, vacancy kernel, 27x27 current identity', flush=True)
    recursion = recursive_control_checks(coupling)
    print('PASS diagonal recursive K: N=2 -> 4 -> 8; exact transport, U covariance', flush=True)
    sparse = []
    for N in (8, 16, 32):
        result = sparse_checks(N, coupling, args.mutate_current_factor)
        sparse.append(result)
        print('PASS F9 coefficient and F8 bound:', json.dumps(result, sort_keys=True), flush=True)
    results = dict(local=local, recursive_controls=recursion, sparse=sparse,
                   scope='Finite identities/bounds only; no numerical proof of asymptotic theorem.')
    result_path = HERE / 'ks_converse_results.json'
    result_path.write_text(json.dumps(results, indent=2, sort_keys=True) + '\n')
    sources = [Path(__file__), ROOT / 'report/sections/79_ks_shell_and_refinement_defect.tex',
               ROOT / 'CONVENTIONS.md',
               ROOT / 'explorations/2026-10-22-astra/D2-selection-principle/NOTE.md']
    manifest = dict(command='PYTHONDONTWRITEBYTECODE=1 OPENBLAS_NUM_THREADS=1 python3 '
                    + str(Path(__file__).relative_to(ROOT)), python=platform.python_version(),
                    numpy=np.__version__, tolerance=ATOL,
                    source_sha256={str(p.relative_to(ROOT)): sha(p) for p in sources},
                    result_sha256=sha(result_path),
                    mutation='--mutate-current-factor must fail five-site coefficient F9')
    (HERE / 'ks_converse_manifest.json').write_text(json.dumps(manifest, indent=2, sort_keys=True) + '\n')
    print('PASS all six groups; results and SHA256 manifest saved', flush=True)


if __name__ == '__main__':
    main()
