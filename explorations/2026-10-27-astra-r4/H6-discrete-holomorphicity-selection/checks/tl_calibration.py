#!/usr/bin/env python3
"""Exact finite loop calibration; no categorical defect identification.

Run from repo root:
  python3 explorations/2026-10-27-astra-r4/H6-discrete-holomorphicity-selection/checks/tl_calibration.py
Mutations (--mutate-weight, --mutate-spin, --mutate-loop-sign) must fail.
Pillars P2/P3; finite scalar connectivity observable, no continuum rung.
See tl_calibration.md for declarations, local proof and claim boundaries.

Sources (original files are read-only):
  references/lattice-symmetry/ZhouBatchelor1997/source/9611156.tex:120-145
    nine dilute weights, n=-2 cos(4 lambda), honeycomb specializations.
  references/lattice-symmetry/ChelkakGlazmanSmirnov2016/source/StressTensor.tex:589-603
    open-path loop observable, winding exponent and both branches.
  references/category-theory/RowellStongWang2009Classification/source/RSWfinal3.tex:2441-2474
    Ising fusion and twist, used solely as an example check.
"""

import argparse
import sys

import sympy as s


parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument("--mutate-weight", action="store_true")
parser.add_argument("--mutate-spin", action="store_true")
parser.add_argument("--mutate-loop-sign", action="store_true")
args = parser.parse_args()
print(f"Python {sys.version.split()[0]}; SymPy {s.__version__}")
print(f"Mutations: weight={args.mutate_weight}, spin={args.mutate_spin}, "
      f"loop_sign={args.mutate_loop_sign}")

lam, u = s.symbols("lambda u", real=True)
den = s.sin(2 * lam) * s.sin(3 * lam)
rho = [
    1 + s.sin(u) * s.sin(3 * lam - u) / den,
    s.sin(3 * lam - u) / s.sin(3 * lam),
    s.sin(3 * lam - u) / s.sin(3 * lam),
    s.sin(u) / s.sin(3 * lam),
    s.sin(u) / s.sin(3 * lam),
    s.sin(u) * s.sin(3 * lam - u) / den,
    s.sin(u) * s.sin(3 * lam - u) / den,
    s.sin(2 * lam - u) * s.sin(3 * lam - u) / den,
    -s.sin(u) * s.sin(lam - u) / den,
]
if args.mutate_weight:
    rho[5] *= 2

# Exact rational-function oracle after z=exp(i lambda). No numerical tolerance.
z = s.symbols("z", nonzero=True)


def laurent(expr):
    """Map trig polynomials in integral multiples of lambda to C(z)."""
    expr = expr.replace(s.tan, lambda theta: s.sin(theta)/s.cos(theta))
    expr = s.expand_trig(expr)
    expr = expr.subs({s.sin(lam): (z - 1 / z) / (2 * s.I),
                      s.cos(lam): (z + 1 / z) / 2})
    return s.cancel(expr)


def assert_zero(label, expr):
    residual = laurent(expr)
    assert residual.free_symbols <= {z}, f"unconverted symbolic input: {residual}"
    print(f"{label}: residual={residual}")
    assert residual == 0, f"{label}: exact residual {residual}"


at_zero = [s.simplify(w.subs(u, 0)) for w in rho]
assert at_zero == [1, 1, 1, 0, 0, 0, 0, 1, 0], at_zero
print(f"u=0 identity coefficients: {at_zero}")

x = 1 / (2 * s.cos(lam))
n = -2 * s.cos(4 * lam)
at_honeycomb = [s.cancel(w.subs(u, lam)) for w in rho]
target = [1, x, x, x**2, x**2, x**2, x**2, x**2, 0]
for k, expected in enumerate(target, 1):
    # Cross multiplication avoids silently dividing by a possible zero.
    assert_zero(f"u=lambda, rho_{k}=rho_1*target_{k}",
                at_honeycomb[k - 1] - at_honeycomb[0] * expected)
print("Normalized honeycomb weights: [1,x,x,x^2,x^2,x^2,x^2,x^2,0]")
print("Domain: sin(2lambda)*sin(3lambda)*rho_1(lambda) != 0")
assert_zero("branch denominator identity", 1 / x**2 - 2 - 2*s.cos(2*lam))
assert_zero("branch radical identity", 2 - n - 4*s.cos(2*lam)**2)
print("cos(2lambda)>=0: x^-2=2+sqrt(2-n); "
      "cos(2lambda)<0: x^-2=2-sqrt(2-n), for cos(lambda)>0")

# Local proof input: ports p,q,r have outgoing directions 1,j,jbar.
# Keep endpoint half-edge weights: each occupied half-edge contributes sqrt(x).
# Class A: exterior has source->p only; local completions stop at p or
# join p->q / p->r, relative winding 0,-pi/3,+pi/3 and weights 1,x,x.
# Class B: source->p, exterior q--r; local completions have endpoint p/q/r,
# relative windings 0,-4pi/3,+4pi/3 and weights xn,x,x.
# Each row below includes the contour direction of the endpoint.
spin = 1 - 3*lam/s.pi
if args.mutate_spin:
    spin += 1  # Same topological twist, different local winding phases.
loop_coefficient = -n if args.mutate_loop_sign else n
phase_a = (2 + spin)*s.pi/3
phase_b = (2 + 4*spin)*s.pi/3
A = 1 + 2*x*s.cos(phase_a)
B = loop_coefficient + 2*s.cos(phase_b)
print("Local contour: F(p)+j F(q)+jbar F(r), j=exp(2pi i/3)")
print("Exterior A: (endpoint,relative_weight,relative_winding/pi)")
print("  (p,1,0), (q,x,-1/3), (r,x,+1/3)")
print("Exterior B: (p,x*n,0), (q,x,-4/3), (r,x,+4/3)")
assert_zero("scalar open-path contour class A", s.trigsimp(A))
assert_zero("scalar open-path contour class B", s.trigsimp(B))
print("Both exterior classes cancel exactly at spin=1-3lambda/pi.")
print("This checks a scalar loop connectivity observable, not H6 centre-line F.")

# General dimension obstruction: simple nonunit self-dual X, N=N_XX^X,
# other channel multiplicities a_i. End((1+X)^2) has dimension
# 4+(2+N)^2+sum(a_i^2). Equality nine forces N=0 and sum(a_i^2)=1.
N, rest = s.symbols("N rest", nonnegative=True, integer=True)
dim = 4 + (2 + N)**2 + rest
assert s.expand(dim - 9) == N**2 + 4*N + rest - 1
print("General dimension: dimEnd-9=N^2+4N+sum(a_i^2)-1")
print("Thus dimension 9 iff N=0 and precisely one other channel has multiplicity 1.")

# Examples only: no model-dependent input enters the general contour proof.
assert dim.subs({N: 1, rest: 0}) == 13  # X^2=1+X.
assert dim.subs({N: 0, rest: 1}) == 9   # X^2=1+Z, Z distinct.
print("Examples: X^2=1+X -> dimEnd=13; X^2=1+Z -> dimEnd=9")

ising_lambda = [3*s.pi/16, 5*s.pi/16]
ising_spins = [s.simplify(spin.subs(lam, value)) for value in ising_lambda]
assert ising_spins == [s.Rational(7, 16), s.Rational(1, 16)], ising_spins
for value in ising_lambda:
    assert s.simplify(n.subs(lam, value) - s.sqrt(2)) == 0
print(f"Ising n=sqrt(2): branch lambdas={ising_lambda}; loop spins={ising_spins}")
print("Standard braided Ising X=sigma has twist exp(2pi*i/16).")
print("Branch-1 spin 7/16 differs modulo integers from that twist spin 1/16.")
assert s.Rational(7,16) - s.Rational(1,16) == s.Rational(3,8)
twist_spin = s.Rational(1, 16)
wrong_A = 1 + s.cos((2 + twist_spin)*s.pi/3)/s.cos(3*s.pi/16)
wrong_expected = 1 - s.sin(3*s.pi/16)/s.cos(3*s.pi/16)
assert s.simplify(wrong_A - wrong_expected) == 0
# Strict nonvanishing also follows from 0<3pi/16<pi/4 and tan increasing.
assert wrong_A.is_positive is True
print("Branch-1 scalar contour with twist-spin 1/16: A=1-tan(3pi/16)>0")
print("This blocks identifying two observables; no categorical-contour refutation is claimed.")
print("PASS: weights, both scalar contour classes, dimensions, branch-spin distinction")
