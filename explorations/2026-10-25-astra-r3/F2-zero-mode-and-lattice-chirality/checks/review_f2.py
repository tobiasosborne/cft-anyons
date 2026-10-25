#!/usr/bin/env python3
"""Independent F2-G norm oracle and F2-R support counterexample.

Run from the repository root with python3 -B and OPENBLAS_NUM_THREADS=1.
--mutate omit-shifted-tail deliberately drops the s+1 transport term in
F2-G and must fail. No files are written by this script.

Provenance: NOTE.md:71-96 (G), :463-475 (R); VR-1 in
cft_machine/research/virasoro_routes.md:55-137. Pauli multiplication below
defines the review-local convention X Y = i Z. The user prohibits editing
root CONVENTIONS; these declarations and REVIEW.md record the convention.

Oracle 1 uses the entire operator norm, not selected vector convergence.
Oracle 2 is a support test, not a counterexample to the KS continuum claim.
All float comparisons use absolute tolerance 1e-10 (norms here < 2e4).
"""
import argparse
import platform
import numpy as np

parser = argparse.ArgumentParser()
parser.add_argument("--mutate", choices=("omit-shifted-tail",))
args = parser.parse_args()
TOL = 1e-10
print(f"Python {platform.python_version()}; NumPy {np.__version__}; atol={TOL}")


def comm(a, b):
    return a @ b - b @ a


def graph_norm(a, weights, s, loss):
    weighted = weights[:, None]**s * a * weights[None, :]**(-s-loss)
    return np.linalg.norm(weighted, ord=2)


# A1: constant H_r=C^2, J_r=I, K=diag(1,M). A2: L_r=2^-r X,
# S_r=K. Limits are 0 and K, hence commute. A3 has exact defects
# eL_(r,s)=2^(-r-1)||K^s X K^(-s-1)|| and eS=0.
# Its infinite tail is exactly 2^-r times that norm.
X = np.array([[0., 1.], [1., 0.]])
checked = 0
for weight in (3., 7., 19.):
    weights = np.array([1., weight])
    K = np.diag(weights)
    for s in range(3):
        A_s = graph_norm(X, weights, s, 1)
        A_next = graph_norm(X, weights, s+1, 1)
        C_s = graph_norm(K, weights, s, 1)
        C_next = graph_norm(K, weights, s+1, 1)
        for r in range(9):
            scale = 2.**(-r)
            finite = graph_norm(comm(scale*X, K), weights, s, 2)
            tail = scale*A_s*C_next
            if args.mutate != "omit-shifted-tail":
                tail += C_s*scale*A_next
            # A separate closed-form singular-value calculation is an oracle.
            exact = scale*(weight-1)*weight**s
            assert abs(finite-exact) < TOL, ("direct norm vs exact", finite, exact)
            assert finite <= tail+TOL, ("F2-G tail", weight, s, r, finite, tail)
            checked += 1
print(f"PASS: F2-G full weighted commutator <= exact A3 tail, {checked} cases")
print("  M=7, s=1, r=0: commutator norm=42; full tail=56; mutated tail=7")


# Removing summable transport really changes the theorem. At stage r,
# on the newest K=r block take L=r X and S=r Z, zero on all older blocks.
# Fixed coarse vectors eventually see zero, but weighted commutator norm=2.
# The inclusion transports K exactly; the one-step (s,1) defect is 1.
Z = np.diag([1., -1.])
for r in (2, 4, 8, 16):
    block_weights = np.full(2, float(r))
    actual = graph_norm(comm(r*X, r*Z), block_weights, 2, 2)
    assert abs(actual-2) < TOL
    assert abs(graph_norm(r*X, block_weights, 2, 1)-1) < TOL
print("PASS: moving-block control has weighted commutator 2 and A3 defect 1")
print("  This control violates A3 and does not refute F2-G.")


# Exact Pauli dictionary, avoiding any exponentially large matrices.
multiply_nontrivial = {
    ("X", "Y"): (1j, "Z"), ("Y", "X"): (-1j, "Z"),
    ("Y", "Z"): (1j, "X"), ("Z", "Y"): (-1j, "X"),
    ("Z", "X"): (1j, "Y"), ("X", "Z"): (-1j, "Y"),
}


def product(a, b):
    result = {}
    for wa, ca in a.items():
        for wb, cb in b.items():
            coefficient = ca*cb
            word = []
            for left, right in zip(wa, wb):
                if left == "I":
                    word.append(right)
                elif right == "I":
                    word.append(left)
                elif left == right:
                    word.append("I")
                else:
                    phase, letter = multiply_nontrivial[(left, right)]
                    coefficient *= phase
                    word.append(letter)
            key = tuple(word)
            result[key] = result.get(key, 0)+coefficient
    return {w: c for w, c in result.items() if c != 0}


def add(a, b, coefficient=1):
    result = dict(a)
    for w, c in b.items():
        result[w] = result.get(w, 0)+coefficient*c
    return {w: c for w, c in result.items() if c != 0}


def bracket(a, b):
    return add(product(a, b), product(b, a), -1)


for N in (7, 11):
    # Site j has unprimed position 2j, primed position 2j+1.
    def monomial(entries):
        word = ["I"]*(2*N)
        for position, letter in entries.items():
            word[position] = letter
        return {tuple(word): 1}

    identity = monomial({})
    global_string = monomial({2*j+1: "Z" for j in range(N)})
    common_factor = add(identity, global_string)
    densities = []
    for j in range(N):
        # h_j = X_j X_(j+1) + Z_j, k_j = h_j (1+prod Z'_l).
        h = add(monomial({2*j: "X", 2*((j+1) % N): "X"}),
                monomial({2*j: "Z"}))
        densities.append(product(h, common_factor))
    for j in range(N):
        for k in range(N):
            if min((j-k) % N, (k-j) % N) > 1:
                assert bracket(densities[j], densities[k]) == {}
    current = {w: 1j*c for w, c in bracket(densities[0], densities[1]).items()}
    predicted = product(monomial({0: "X", 2: "Y"}), common_factor)
    predicted = {w: 4*c for w, c in predicted.items()}
    assert current == predicted, ("current formula", N, current, predicted)
    for remote in range(N):
        assert bracket(current, monomial({2*remote+1: "X"})) != {}
    print(f"PASS: N={N}, commutation range 1 but current acts on all {N} primed sites")
print("All independent baseline checks passed; no all-scale physical theorem inferred.")
