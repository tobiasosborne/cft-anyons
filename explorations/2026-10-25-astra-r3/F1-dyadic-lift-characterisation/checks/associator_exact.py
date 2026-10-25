#!/usr/bin/env python3
"""Exact calibration of associator_proof.md; integer phases/matrices only.

Run: python3 -I <this file> [--mutate-associator]
Sources: Penneys .md:284-288,319-321; ENO .md:45-51.
Conventions and all derived factors are in associator_proof.md H/T/P2.
The mutation erases omega and must fail the noncommutative multiplier check.
"""

import argparse
from collections import Counter
from itertools import product


parser = argparse.ArgumentParser()
parser.add_argument("--mutate-associator", action="store_true")
args = parser.parse_args()


def add(a, b, p):
    return tuple((x + y) % p for x, y in zip(a, b))


def omega_exponent(a, b, c, p):
    if args.mutate_associator:
        return 0
    return a[0] * b[1] * c[2] % p


def beta_exponent(g, x, y, p):
    return (omega_exponent(g, x, y, p)
            + omega_exponent(x, y, g, p)
            - omega_exponent(x, g, y, p)) % p


for p in (2, 3):
    group = tuple(product(range(p), repeat=3))
    zero = (0, 0, 0)
    for a, b, c, d in product(group, repeat=4):
        defect = (omega_exponent(b, c, d, p)
                  - omega_exponent(add(a, b, p), c, d, p)
                  + omega_exponent(a, add(b, c, p), d, p)
                  - omega_exponent(a, b, add(c, d, p), p)
                  + omega_exponent(a, b, c, p)) % p
        assert defect == 0, ("pentagon", p, a, b, c, d)
    e1, e2, e3 = (1, 0, 0), (0, 1, 0), (0, 0, 1)
    assert beta_exponent(e1, e2, e3, p) == 1, (
        "associator obstruction disappeared", p)
    assert beta_exponent(e1, e3, e2, p) == 0
    for g, x, y, z in product(group, repeat=4):
        defect = (beta_exponent(g, x, y, p)
                  + beta_exponent(g, add(x, y, p), z, p)
                  - beta_exponent(g, x, add(y, z, p), p)
                  - beta_exponent(g, y, z, p)) % p
        assert defect == 0, ("slant cocycle", p, g, x, y, z)
    print(f"p={p}: all {len(group)**4} pentagons and slant cocycles exact; "
          "grade-e1 scalar half-braiding excluded")


def mul(a, b):
    return tuple(tuple(sum(a[i][k] * b[k][j] for k in range(2))
                       for j in range(2)) for i in range(2))


def scale(s, a):
    return tuple(tuple(s * x for x in row) for row in a)


def transpose(a):
    return tuple(tuple(a[j][i] for j in range(2)) for i in range(2))


identity = ((1, 0), (0, 1))
pauli_x = ((0, 1), (1, 0))
pauli_z = ((1, 0), (0, -1))
table = {
    (1, 0, 0): (identity, pauli_x, pauli_z),
    (0, 1, 0): (pauli_x, identity, pauli_z),
    (0, 0, 1): (pauli_x, pauli_z, identity),
    (1, 1, 0): (pauli_x, pauli_x, pauli_z),
    (1, 0, 1): (pauli_x, pauli_z, pauli_x),
    (0, 1, 1): (pauli_x, pauli_z, pauli_z),
}
group2 = tuple(product(range(2), repeat=3))
support = ((0, 0, 0), (1, 0, 0), (0, 1, 0), (0, 0, 1))
multiplicities = Counter(add(a, b, 2) for a, b in product(support, repeat=2))
assert multiplicities[(0, 0, 0)] == 4
assert multiplicities[(1, 1, 1)] == 0
assert set(multiplicities) - {(0, 0, 0)} == set(table)
assert all(multiplicities[g] == 2 for g in table)


def rho(g, x):
    result = identity
    for bit, matrix in zip(x, table[g]):
        if bit:
            result = mul(result, matrix)
    return result


for g, x in product(table, group2):
    assert mul(transpose(rho(g, x)), rho(g, x)) == identity
    for y in group2:
        lhs = mul(rho(g, y), rho(g, x))
        rhs = scale((-1) ** beta_exponent(g, x, y, 2),
                    rho(g, add(x, y, 2)))
        assert lhs == rhs, ("hexagon", g, x, y, lhs, rhs)
print("p=2: O^2 multiplicities exact; all 384 half-braiding matrix "
      "equations and 48 unitarity equations exact; grade-0 point fixed")

# Exact group-ring coefficient calibration of the all-p argument P1.
for p in (2, 3):
    zero = (0, 0, 0)
    coefficients = Counter({zero: 1})
    for _ in range(p**3):
        updated = Counter()
        for a, multiplicity in coefficients.items():
            for b in support:
                updated[add(a, b, p)] += multiplicity
        coefficients = updated
    assert sum(coefficients.values()) == 4**(p**3)
    assert all(n % p**3 == 0 for g, n in coefficients.items() if g != zero)
    assert coefficients[zero] % p**3 == pow(4, p**2, p**3)
    print(f"p={p}: O^(p^3) nonzero-grade multiplicities divisible by p^3 exact")

print("PASS: integer-only calibration; no floating-point tolerance")
