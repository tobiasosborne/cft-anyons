#!/usr/bin/env python3
"""Exact C1/C2/D1/D2 checks; no category-specific conclusion.

Instance: two flags with a Z/2 occupation grade, checked only here.
The fusion rule is grade addition (PenneysUnitaryFusionCategories.md:321).
All matrices act on the direct sum of both total-grade sectors.
Run from repo root: python3 <this path> [--mutate number|pullback|refill]
"""
import argparse
from itertools import product
import sympy as s

parser = argparse.ArgumentParser()
parser.add_argument("--mutate", choices=["number", "pullback", "refill"])
args = parser.parse_args()


def bits(length):
    return list(product((0, 1), repeat=length))


def number(length):
    return s.diag(*(sum(word) for word in bits(length)))


def vacancy(length):
    coarse, fine = bits(length), bits(2 * length)
    loc = {word: j for j, word in enumerate(fine)}
    mat = s.zeros(len(fine), len(coarse))
    for col, word in enumerate(coarse):
        target = tuple(x for old in word for x in (old, 0))
        mat[loc[target], col] = 1
    return mat


L = 2
V, Nc, Nf = vacancy(L), number(L), number(2 * L)
assert V.T * V == s.eye(4)
target_number = Nc if args.mutate != "number" else 2 * Nc
assert Nf * V == V * target_number, "absolute-number intertwining"
for n in range(5):
    Qc = s.diag(*(int(sum(w) == n) for w in bits(2)))
    Qf = s.diag(*(int(sum(w) == n) for w in bits(4)))
    assert V.T * Qf * V == Qc, "sector probability transport"
assert V.T * (Nf / 4) * V == Nc / 4
print("PASS exact V isometry, number, all sector projections, density halving")

# Contiguous old1,old2,new1,new2 -> old1,new1,old2,new2.
words = bits(4)
position = {word: j for j, word in enumerate(words)}
S = s.zeros(16)
for col, (a, b, c, d) in enumerate(words):
    S[position[(a, c, b, d)], col] = 1
assert S.T * S == s.eye(16)
assert Nf * S == S * Nf
alpha_N = S * s.kronecker_product(Nc, s.eye(4)) * S.T
Nodd = s.diag(*(w[0] + w[2] for w in words))
Neven = Nf - Nodd
assert alpha_N == Nodd
if args.mutate == "pullback":
    assert alpha_N / 2 == Nf / 4, "false arbitrary-state density identity"
assert alpha_N / 2 != Nf / 4
f = s.zeros(16, 1)
f[position[(1, 0, 0, 0)], 0] = 1
assert (f.T * alpha_N * f)[0] / 2 == s.Rational(1, 2)
assert (f.T * Nf * f)[0] / 4 == s.Rational(1, 4)
assert s.trace(alpha_N) / 16 == s.trace(Nc) / 4
assert s.trace(Nc / 2) / 4 == s.trace(Nf / 4) / 16 == s.Rational(1, 2)
print("PASS unital occupation image is N_odd; false pullback identity rejected")
print("PASS trace states: exact compatibility, density 1/2 at both scales")

# Neutral two-occupation ancilla rotation: exact sin=4/5, cos=3/5.
u = s.eye(4)
u[0, 0] = u[3, 3] = s.Rational(3, 5)
u[3, 0], u[0, 3] = s.Rational(4, 5), -s.Rational(4, 5)
assert u.T * u == s.eye(4)
U = S * s.kronecker_product(s.eye(4), u) * S.T
W = U * V
gain = s.Rational(32, 25)
if args.mutate == "refill":
    gain = s.Rational(16, 25)
assert W.T * Nf * W == Nc + gain * s.eye(4), "neutral refill coefficient"
assert W.T * W == s.eye(4)
assert Nf * U != U * Nf
assert V.T * U.T * (Nf * U - U * Nf) * V == gain * s.eye(4)
charge = s.diag(*((-1) ** sum(w) for w in words))
assert charge * U == U * charge
print("PASS exact neutral refill gain 32/25, isometry, charge, commutator balance")

# This symmetric-instance ancilla dressing leaves the old-factor algebra intact.
for row in range(4):
    for col in range(4):
        a = s.zeros(4)
        a[row, col] = 1
        alpha_a = S * s.kronecker_product(a, s.eye(4)) * S.T
        assert U * alpha_a == alpha_a * U
print("PASS number-changing ancilla refill can leave the unital lift unchanged")
print("ALL EXACT ALGEBRA CHECKS PASSED; largest matrix 16 x 16")
