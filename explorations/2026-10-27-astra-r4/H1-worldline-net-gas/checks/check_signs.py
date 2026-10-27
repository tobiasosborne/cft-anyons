#!/usr/bin/env python3
"""Exact D2 loop-sign checks, raw FS algebra, and a temporal-RP witness.

Conventions: NOTE.md H1-D1, raw b^*b=d P_vv, H=-sum h. Abstract loop
parameter d>0, symmetric self-duality for the D2 loop rule. The FS check
instead retains its raw snake sign. Finite algebra examples assert no
specific categorical realization or continuum claim. P1/P2; any; L0 plus
the declared loop/closure data; finite ingredient, no new rung.
Source: references/text/PenneysUnitaryFusionCategories.md:1032-1047;
report/sections/80_lattice_sewing_and_fidelity_certificate.tex:70-101.
"""
import hashlib
import platform
from time import perf_counter
from datetime import datetime, timezone
from fractions import Fraction as Q
from itertools import product
from pathlib import Path
import sympy as sp

started = perf_counter()


def equal(a, b, message):
    residual = (a-b).applyfunc(lambda x: sp.simplify(sp.expand(x.rewrite(sp.exp))))
    assert residual == sp.zeros(*a.shape), message+': '+str(residual)


print('UTC:', datetime.now(timezone.utc).isoformat())
print('Python:', platform.python_version(), 'SymPy:', sp.__version__)
print('Command: python3 '+str(Path(__file__).relative_to(Path.cwd())))
print('SHA256:', hashlib.sha256(Path(__file__).read_bytes()).hexdigest())
d, s = sp.symbols('d s', positive=True)
I = sp.eye(3)
P0, Ppair = sp.diag(1, 0, 0), sp.diag(0, 1, 0)
b = sp.zeros(3)
b[1, 0] = sp.sqrt(d)
cap, e = b.T, b*b.T
equal(cap*b, d*P0, 'raw cup norm')
equal(e/d, Ppair, 'pair projector normalization')

for sign in (1, -1):
    h = sign*(b+cap)
    exact = ((s/sp.sqrt(d))*h).exp()
    d2 = I+(sp.cosh(s)-1)*(P0+e/d)+sign*sp.sinh(s)/sp.sqrt(d)*(b+cap)
    equal(exact, d2, 'D2 exact exponential sign '+str(sign))
    equal(h.T, h, 'selfadjoint h')
    equal(h*h, d*(P0+Ppair), 'h squared')
print('PASS: D2 exact for both signs, arbitrary d>0 and s>0, including spectator complement.')
print('For h_minus both raw cup/cap coefficients = -sinh(s)/sqrt(d) < 0.')
print('At s=log(2): cosh(s)=5/4; sinh(s)=3/4 (exact).')

# Evaluate every tile-decorated closed word of lengths 1..6 at s=log(2).
# After including the raw matrix entries, these transition weights are
# rational and independent of d: raw cup sqrt(d) cancels its coefficient.
# The list distinguishes the identity, P0 and cup-cap tiles, even when
# their actions overlap. State 0 is vv, state 1 is normalized pair.
names = ('I', 'P0', 'e', 'b', 'cap')
transitions = (
    {0: (0, Q(1)), 1: (1, Q(1))},
    {0: (0, Q(1, 4))},
    {1: (1, Q(1, 4))},
    {0: (1, Q(3, 4))},
    {1: (0, Q(3, 4))},
)


def closed_word(word, sign, mutate_first_cup=False):
    """Ordinary two-state trace; report each compatible closed path."""
    paths = []
    for start in (0, 1):
        state, weight, births, deaths = start, Q(1), 0, 0
        for step, tile in enumerate(word):
            edge = transitions[tile].get(state)
            if edge is None:
                break
            state, amplitude = edge
            phase = sign if tile in (3, 4) else 1
            if mutate_first_cup and step == 0 and tile == 3:
                phase = -phase  # exactly one first-gate cup coefficient
            weight *= phase*amplitude
            births += tile == 3
            deaths += tile == 4
        else:
            if state == start:
                assert births == deaths, 'occupation failed to close'
                paths.append(weight)
    return paths


counts = {}
for sign in (1, -1):
    closed, minimum = 0, None
    for length in range(1, 7):
        count = 0
        for word in product(range(5), repeat=length):
            for weight in closed_word(word, sign):
                assert weight >= 0, 'negative unmutated closed path'
                count += 1
                minimum = weight if minimum is None else min(minimum, weight)
        counts[length] = count
        closed += count
    print('PASS: sign', sign, '; compatible decorated closed paths by length =', counts,
          '; total =', closed, '; minimum =', minimum)

# General all-length reason checked above in each finite path: only b/cap
# change occupation, so closure forces births=deaths and sign^(2 births)=1.
print('All-length invariant: closed occupation forces births=deaths, hence even sign parity.')
witness = closed_word((3, 4), -1, mutate_first_cup=True)
assert witness == [-Q(9, 16)], 'one-cup mutation must create a negative loop'
try:
    assert all(weight >= 0 for weight in witness), 'negative mutated closed path'
except AssertionError:
    print('MUTATION DETECTED: first-gate cup sign only; b then cap closed weight =', witness[0])
else:
    raise AssertionError('one-cup mutation escaped')
good_gate = sp.Matrix([[sp.Rational(5, 4), -sp.Rational(3, 4)],
                      [-sp.Rational(3, 4), sp.Rational(5, 4)]])
bad_gate = good_gate.copy()
bad_gate[1, 0] *= -1
assert bad_gate != bad_gate.T, 'mutation must break dagger pairing'
print('Mutation changes only one cup coefficient and breaks selfadjointness; it is a sign-test sentinel.')

# Raw FS contractions only: the symmetric/antisymmetric bilinear cups are
# concrete tensors. They test D4 algebra; no fusion-category data inferred.
for kappa in (1, -1):
    cup = sp.Matrix([0, 1, kappa, 0])
    snake = sp.kronecker_product(cup.T, sp.eye(2))*sp.kronecker_product(sp.eye(2), cup)
    equal(snake, kappa*sp.eye(2), 'raw FS snake')
    scalar = (cup.T*sp.kronecker_product(sp.eye(2), cup.T, sp.eye(2))
              *sp.kronecker_product(cup, cup))[0]
    assert scalar == 2*kappa and (cup.T*cup)[0] == 2, 'D4 raw contraction'
    print('PASS: raw cup norm d=2, kappa =', kappa, '; four-cup scalar =', scalar)

# A finite multiplicity-block RP calibration, with matrix-unit histories.
# S is real symmetric, S^2=2I-S, so spectrum {1,1,-2}. Thus exp(tS)>0.
# Its three off-diagonal matrix-unit entries have a negative cycle product.
S = sp.Matrix([[0, 1, -1], [1, 0, 1], [-1, 1, 0]])
equal(S*S, 2*I-S, 'signed triangle quadratic relation')
t = sp.symbols('t', real=True)
T = (2*sp.exp(t)+sp.exp(-2*t))/3*I + (sp.exp(t)-sp.exp(-2*t))/3*S
equal(T.diff(t), S*T, 'exponential ODE')
equal(T.subs(t, 0), I, 'exponential initial value')
T2 = T.subs(t, sp.log(2))
assert T2.eigenvals() == {sp.Integer(2): 2, sp.Rational(1, 4): 1}, 'strictly PSD seam'
triangle = T2[1, 0]*T2[2, 1]*T2[0, 2]
assert triangle == -sp.Rational(343, 1728), 'negative closed triangle'
print('PASS: temporal seam exp(log(2) S) eigenvalues =', T2.eigenvals(),
      '; closed matrix-unit triangle =', triangle)
print('ALL SIGN CHECKS PASSED; one-cup mutation rejected; RP does not force positive matrix-unit histories.')
print('Elapsed seconds:', round(perf_counter()-started, 3))
