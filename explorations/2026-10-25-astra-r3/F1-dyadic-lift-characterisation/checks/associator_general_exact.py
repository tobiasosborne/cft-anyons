#!/usr/bin/env python3
"""Exact symbolic G1 and non-bilinear cocycle calibration of general theorem G.

Run: python3 -I associator_general_exact.py [--mutate-sign]
No floating point or dependencies. See associator_general.md for conventions.
"""

import argparse
from collections import Counter
from itertools import product

parser = argparse.ArgumentParser()
parser.add_argument("--mutate-sign", action="store_true")
args = parser.parse_args()


def add(a, b, modulus=None):
    values = tuple(x + y for x, y in zip(a, b))
    return values if modulus is None else tuple(x % modulus for x in values)


def combine(*terms):
    result = Counter()
    for sign, monomial in terms:
        for key, value in monomial.items():
            result[key] += sign * value
    return {key: value for key, value in result.items() if value}


def symbol(a, b, c):
    return {(a, b, c): 1}


def beta(g, x, y):
    return combine((1, symbol(g, x, y)), (1, symbol(x, y, g)),
                   (-1, symbol(x, g, y)))


def q(a, b, c, d):
    return combine((1, symbol(b, c, d)), (-1, symbol(add(a, b), c, d)),
                   (1, symbol(a, add(b, c), d)),
                   (-1, symbol(a, b, add(c, d))), (1, symbol(a, b, c)))


g, x, y, z = tuple(tuple(int(i == j) for i in range(4)) for j in range(4))
lhs = combine((1, beta(g, y, z)), (-1, beta(g, add(x, y), z)),
              (1, beta(g, x, add(y, z))), (-1, beta(g, x, y)))
rhs = combine((-1, q(g, x, y, z)), (1, q(x, g, y, z)),
              (1 if args.mutate_sign else -1, q(x, y, g, z)),
              (1, q(x, y, z, g)))
assert lhs == rhs, "G1 formal monomial identity failed (sign mutation detected)"
assert len(lhs) == 12
print("G1: exact free-abelian monomial identity; all 12 residual terms match")

group = tuple(product(range(2), repeat=3))
zero, e1, e2 = (0, 0, 0), (1, 0, 0), (0, 1, 0)


def cochain(a, b):
    # Normalized but not bilinear. Values are powers of i.
    return int(a == e1 and b == e2)


def omega(a, b, c):
    coboundary = (cochain(b, c) - cochain(add(a, b, 2), c)
                  + cochain(a, add(b, c, 2)) - cochain(a, b))
    return (2 * a[0] * b[1] * c[2] + coboundary) % 4


def multiplier(g, x, y):
    return (omega(g, x, y) + omega(x, y, g) - omega(x, g, y)) % 4


assert any(omega(a, b, c) % 2 for a, b, c in product(group, repeat=3))
for a, b, c, d in product(group, repeat=4):
    defect = (omega(b, c, d) - omega(add(a, b, 2), c, d)
              + omega(a, add(b, c, 2), d) - omega(a, b, add(c, d, 2))
              + omega(a, b, c)) % 4
    assert defect == 0, ("nonbilinear pentagon", a, b, c, d)
    slant_defect = (multiplier(a, c, d) - multiplier(a, add(b, c, 2), d)
                   + multiplier(a, b, add(c, d, 2))
                   - multiplier(a, b, c)) % 4
    assert slant_defect == 0, ("nonbilinear slant", a, b, c, d)
    # R_a(b)R_a(c)v_d versus c_a(b,c)R_a(b+c)v_d.
    lhs_phase = multiplier(a, d, c) + multiplier(a, add(c, d, 2), b)
    rhs_phase = multiplier(a, c, b) + multiplier(a, d, add(b, c, 2))
    assert (lhs_phase - rhs_phase) % 4 == 0, ("regular representation", a, b, c, d)
print("Nonbilinear omega: 4096 exact pentagons, slant cocycles and regular "
      "representation products")

for p, dimension in ((2, 3), (3, 2), (5, 1)):
    grades = tuple(product(range(p), repeat=dimension))
    zero = (0,) * dimension
    multiplicities = {grade: sum(grade) + 1 for grade in grades}
    total_dimension = sum(multiplicities.values())
    order = p**dimension
    coefficients = {zero: 1}
    for _ in range(order):
        updated = Counter()
        for a, coefficient in coefficients.items():
            for b, multiplicity in multiplicities.items():
                updated[add(a, b, p)] += coefficient * multiplicity
        coefficients = updated
    assert sum(coefficients.values()) == total_dimension**order
    assert all(value % order == 0 for grade, value in coefficients.items()
               if grade != zero)
    assert coefficients[zero] % order == pow(total_dimension, p**(dimension-1), order)
    print(f"p={p}, d={dimension}: declared positive multiplicity coefficients "
          "satisfy G2 exactly")

for cyclic_orders, d, e in (((4,), 2, 2), ((4, 2), 3, 2)):
    p = 2
    grades = tuple(product(*(range(order) for order in cyclic_orders)))
    zero = (0,) * len(cyclic_orders)
    multiplicities = {grade: sum(grade) + 1 for grade in grades}
    total_dimension = sum(multiplicities.values())
    order = p**d
    block_length = p**(e+d-1)
    assert len(grades) == order
    coefficients = {zero: 1}
    for _ in range(block_length):
        updated = Counter()
        for a, coefficient in coefficients.items():
            for b, multiplicity in multiplicities.items():
                output_grade = tuple((x+y) % modulus
                                     for x, y, modulus in zip(a, b, cyclic_orders))
                updated[output_grade] += coefficient * multiplicity
        coefficients = updated
    assert sum(coefficients.values()) == total_dimension**block_length
    assert all(value % order == 0 for grade, value in coefficients.items()
               if grade != zero)
    assert coefficients[zero] % order == pow(total_dimension, p**(d-1), order)
    print(f"cyclic factors={cyclic_orders}, b={block_length}: declared positive "
          "multiplicity coefficients satisfy G3 exactly")
print("PASS: symbolic identity and finite calibration; all arithmetic exact")
