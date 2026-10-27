#!/usr/bin/env python3
"""Exact checks for NOTE H5-SYMBOL; no numerical continuum inference.

Run: python3 -B <this path> [--mutate omit-matrix-commutator]
Conventions and derivations: ../NOTE.md, (H5.6)--(H5.9).
Local polynomials test the product rule; the bundle check is periodic.
"""
import argparse
from math import comb
import sympy as sp

parser = argparse.ArgumentParser()
parser.add_argument("--mutate", choices=["omit-matrix-commutator"])
args = parser.parse_args()
x = sp.symbols("x", real=True)
I = sp.I
zero = sp.zeros(2)


def simp(matrix):
    return matrix.applyfunc(lambda z: sp.simplify(sp.expand_trig(z)))


def compose(left, right):
    """Generic Leibniz composition, coefficients of ordinary partial_x."""
    out = {}
    for a, ca in left.items():
        for b, cb in right.items():
            for k in range(a + 1):
                order = a - k + b
                out[order] = out.get(order, zero) + comb(a, k) * ca * cb.diff(x, k)
    return {k: simp(v) for k, v in out.items()}


def subtract(left, right):
    return {k: simp(left.get(k, zero) - right.get(k, zero))
            for k in left.keys() | right.keys()}


def bracket(left, right):
    return subtract(compose(left, right), compose(right, left))


def same(left, right, label):
    differences = subtract(left, right)
    assert all(v == zero for v in differences.values()), (label, differences)


def mode(f, A, B, F):
    return {1: -I * f * A, 0: f * B + sp.diff(f, x) * F}


# Noncommuting, variable Hermitian coefficients: the correction is nonzero.
A = sp.Matrix([[x, 1 + I*x], [1 - I*x, x*x]])
H = sp.Matrix([[x*x, x], [x, -1]])
C = sp.Matrix([[2, x + 2*I], [x - 2*I, -x]])
assert A == A.H and H == H.H and C == C.H
B, F = C - I*A.diff(x)/2, H - I*A/2
f, g = x*x + 2*x + 1, x**3 - x + 2
W = f*sp.diff(g, x) - g*sp.diff(f, x)
commutator = A*H - H*A
assert simp(commutator) != zero
matrix_correction = zero if args.mutate else I*commutator
claimed = {1: -W*(A*A + matrix_correction),
           0: W*(-I*A*B - I*A*F.diff(x) + B*F - F*B)
              - I*sp.diff(W, x)*A*F}
same(bracket(mode(f, A, B, F), mode(g, A, B, F)), claimed,
     "general coefficient identity (mutation-sensitive)")
print("PASS: general noncommuting variable-matrix coefficient identity")

# Periodic variable rank-one projections. Sandwiching is the independent oracle.
rotation = sp.Matrix([[sp.cos(x), -sp.sin(x)], [sp.sin(x), sp.cos(x)]])
P = simp(rotation * sp.diag(1, 0) * rotation.T)
Q = sp.eye(2) - P
assert simp(P*P-P) == zero and simp(P*Q) == zero


def supported(f, projection, eta, connection, sign=1):
    scalar_op = {1: -I*f*sp.eye(2),
                 0: ((eta-I/2)*sp.diff(f, x)+connection*f)*sp.eye(2)}
    result = compose(compose({0: projection}, scalar_op), {0: projection})
    return {k: simp(sign*v) for k, v in result.items()}


for m, n in [(0, 0), (1, -1), (2, 1)]:
    fm, fn = sp.exp(-I*m*x), sp.exp(-I*n*x)
    Lm = supported(fm, P, 2, sp.Rational(1, 3))
    Ln = supported(fn, P, 2, sp.Rational(1, 3))
    Sm = supported(fm, Q, -1, sp.Rational(2, 5), -1)
    Sn = supported(fn, Q, -1, sp.Rational(2, 5), -1)
    total = sp.exp(-I*(m+n)*x)
    same(bracket(Lm, Ln), supported((m-n)*total, P, 2, sp.Rational(1, 3)),
         "left internal Witt")
    same(bracket(Sm, Sn), supported((n-m)*total, Q, -1, sp.Rational(2, 5), -1),
         "right opposite Witt")
    same(compose(Lm, Sn), {}, "left-right product")
    same(compose(Sn, Lm), {}, "right-left product")
print("PASS: variable periodic projections, improvements, both internal brackets, mixed products")
print("Scope: exact finite-symbol checks; no microscopic DS certificate asserted")
