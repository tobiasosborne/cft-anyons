#!/usr/bin/env python3
"""Exact audit of the H3 noncollapse review's finite algebra.

Run: python3 explorations/2026-10-27-astra-r4/H3-vr1-noncollapse-instance/checks/noncollapse_symbolic.py
Mutation: append --mutate; the altered cross Gram entry must fail.
Source oracle: references/cft/Schottenloher2008/Schottenloher2008.md:2937-2947.
This checks finite identities, not existence or integration of a CFT.
"""

from functools import lru_cache
import sys
import sympy as S

h, c = S.symbols("h c", real=True)


@lru_cache(None)
def vacuum_expectation(word):
    """Normal order using the declared Vir bracket and a unit primary."""
    if not word:
        return S.Integer(1)
    if 0 in word:
        j = word.index(0)
        return S.expand((h - sum(word[j + 1 :])) *
                        vacuum_expectation(word[:j] + word[j + 1 :]))
    if word[0] < 0 or word[-1] > 0:
        return S.Integer(0)
    for j in range(len(word) - 1):
        m, n = word[j : j + 2]
        if m > 0 and n < 0:
            prefix, suffix = word[:j], word[j + 2 :]
            value = vacuum_expectation(prefix + (n, m) + suffix)
            value += (m - n) * vacuum_expectation(prefix + (m + n,) + suffix)
            if m + n == 0:
                value += c * S.Rational(m**3 - m, 12) * vacuum_expectation(prefix + suffix)
            return S.expand(value)
    raise AssertionError(f"Unresolved ordering: {word}")


g11 = vacuum_expectation((2, -2))
g12 = vacuum_expectation((2, -1, -1))
g22 = vacuum_expectation((1, 1, -1, -1))
if "--mutate" in sys.argv:
    g12 -= h

assert S.expand(g11 - (4 * h + c / 2)) == 0
assert S.expand(g12 - 6 * h) == 0
assert S.expand(g22 - (8 * h**2 + 4 * h)) == 0
det_primary = S.factor(S.Matrix([[g11, g12], [g12, g22]]).det())
assert S.expand(det_primary - 2 * h * (16 * h**2 - 10 * h + 2 * h * c + c)) == 0
print("PASS primary Gram entries from independent normal ordering")
print("PASS primary Gram determinant:", det_primary)

mu, nu, k = S.symbols("mu nu k", real=True)
restricted_gram = S.Matrix([[4 * mu / k, 6 * mu / k],
                            [6 * mu / k, 8 * nu / k**2 + 4 * mu / k]])
det_restricted = S.factor(restricted_gram.det())
assert S.expand(det_restricted - 4 * mu * (8 * nu - 5 * k * mu) / k**3) == 0
assert det_restricted.subs({mu: 1, nu: 1, k: 2}) == -1
assert S.factor(det_restricted.subs({mu: h, nu: h**2})) == 4 * h**2 * (8 * h - 5 * k) / k**3
print("PASS restricted-vector Gram determinant:", det_restricted)
print("PASS explicit negative determinant at mu=nu=1, k=2")

linear, cubic, m = S.symbols("linear cubic m", real=True)
shift = (cubic - linear) / 24
old_central = (cubic * m**3 - linear * m) / 12
new_central = old_central - 2 * m * shift
assert S.expand(new_central - cubic * (m**3 - m) / 12) == 0
print("PASS normalized L0 shift sign and unchanged cubic ledger")

J = S.Matrix([[1, 0], [0, 1], [0, 0]])
K0, K1 = S.diag(2, 3), S.diag(2, 3, 5)
T0 = S.Matrix([[1, 2], [3, 4]])
T1 = S.Matrix([[2, 1, 3], [0, 4, 5], [1, 2, 6]])
assert K1 * J == J * K0
for t in range(3):
    B0 = K0**t * T0 * K0**(-t - 1)
    B1 = K1**t * T1 * K1**(-t - 1)
    assert B1 * J - J * B0 == K1**t * (T1 * J - J * T0) * K0**(-t - 1)
print("PASS exact graph-weight transport at t=0,1,2")

# A non-self-adjoint mode may have zero diagonal in a preferred basis.
A = S.Matrix([[0, 1], [0, 0]])
v = S.Matrix([1, 1]) / S.sqrt(2)
assert A[0, 0] == A[1, 1] == 0
assert (v.conjugate().T * A * v)[0] == S.Rational(1, 2)
print("PASS coherent coarse superposition detects an off-diagonal mode")
