#!/usr/bin/env python3
"""Exact H1-A/C algebra checks; synthetic 2-channel three-factor block.

Conventions: NOTE.md H1-A/C; CONVENTIONS (ai),(al). Linear in second
slot; tree basis columns obey t_L=F t_R. Thus the coordinate change from
left to right is C=F.T, and a right gate in left coordinates is C^* T_R C.
Formal phase z has z*=z^-1. Rotation r is real. No pentagon, fusion rule,
or categorical realizability of this arbitrary unitary block is asserted.
Sources: references/text/PenneysUnitaryFusionCategories.md:528-568;
report/sections/80_lattice_sewing_and_fidelity_certificate.tex:52-83.
Pillars P2 (exact history expansion) and P1 (complete multiplicity blocks).
Layer: any; finite dagger-linear algebra ingredient at L0; no new rung.
"""
import hashlib
import platform
from time import perf_counter
from datetime import datetime, timezone
from pathlib import Path
from itertools import product
import sympy as sp

started = perf_counter()


def clean(m):
    return m.applyfunc(sp.cancel) if isinstance(m, sp.MatrixBase) else sp.cancel(m)


def equal(a, b, message):
    assert clean(a-b) == sp.zeros(*a.shape), message


def mutation(name, actual, expected):
    """The production invariant must actually raise on the changed object."""
    try:
        equal(actual, expected, name)
    except AssertionError:
        print('MUTATION DETECTED:', name, '; witness residual =', clean(actual-expected))
    else:
        raise AssertionError('Mutation escaped: '+name)


print('UTC:', datetime.now(timezone.utc).isoformat())
print('Python:', platform.python_version(), 'SymPy:', sp.__version__)
print('Command: python3 '+str(Path(__file__).relative_to(Path.cwd())))
print('SHA256:', hashlib.sha256(Path(__file__).read_bytes()).hexdigest())
r = sp.symbols('r', real=True)
z = sp.symbols('z', nonzero=True)
x, y = sp.symbols('x y', positive=True)  # x=e^t, y=e^u, no truncation
I = sp.eye(2)


def adj(m):
    return clean(m.conjugate().T.subs(sp.conjugate(z), 1/z))


c, s = (1-r*r)/(1+r*r), 2*r/(1+r*r)
F = sp.Matrix([[c, s*z], [-s/z, c]])
equal(adj(F)*F, I, 'formal F unitarity')
equal(F*adj(F), I, 'formal F co-unitarity')
C = F.T  # Do not confuse a column of basis kets with coefficient columns.
print('PASS: symbolic rational rotation / formal phase F is unitary.')

# Each gate is a general spectral exponential of a declared involution.
# In a genuine category this models one total-charge block of three factors,
# with the left and right bond resolved in their respective fusion trees.
A = sp.Matrix([[sp.Rational(3, 5), sp.Rational(4, 5)],
               [sp.Rational(4, 5), -sp.Rational(3, 5)]])
B = sp.Matrix([[sp.Rational(5, 13), sp.Rational(12, 13)],
               [sp.Rational(12, 13), -sp.Rational(5, 13)]])
for density in (A, B):
    equal(density*density, I, 'density involution')
    equal(adj(density), density, 'density selfadjointness')
TL = (x+1/x)/2*I + (x-1/x)/2*A
TR = (y+1/y)/2*I + (y-1/y)/2*B
equal(TL, x*(I+A)/2 + (I-A)/(2*x), 'spectral exponential left')
equal(TR, y*(I+B)/2 + (I-B)/(2*y), 'spectral exponential right')
right = adj(C)*TR*C
patch = clean(right*TL)


def unit(q, p):
    out = sp.zeros(2)
    out[q, p] = 1
    return out


# Raw vertex rescalings are arbitrary positive test parameters; they are
# not asserted to be dimensions of a realized category. Cancellation is A2.
gL, gR = (sp.Integer(2), sp.Integer(3)), (sp.Integer(5), sp.Integer(7))
tile_sum = sp.zeros(2)
for q, p, v, w in product(range(2), repeat=4):
    DL = gL[q]*gL[p]*unit(q, p)
    DR = adj(C)*(gR[v]*gR[w]*unit(v, w))*C
    weight = TL[q, p]*TR[v, w]/(gL[q]*gL[p]*gR[v]*gR[w])
    tile_sum += weight*DR*DL
equal(tile_sum, patch, '16 decorated-tile matrix sum')

# Independent indexed scalar contraction: no constructed tile matrices.
contraction = sp.zeros(2)
for out, inn in product(range(2), repeat=2):
    contraction[out, inn] = sum(
        sp.conjugate(C[v, out]).subs(sp.conjugate(z), 1/z)
        *TR[v, w]*C[w, k]*TL[k, inn]
        for v, w, k in product(range(2), repeat=3))
equal(contraction, tile_sum, 'independent indexed contraction')
print('PASS: all 16 exact rescaled tile products = independent contraction = two-gate patch.')

# A genuinely complex nonorthogonal basis catches both inverse-metric and
# dagger mistakes that real orthogonal examples conceal.
U = sp.Matrix([[1, sp.I], [0, 2]])
G = adj(U)*U
equal(U*G.inv()*adj(U), I, 'inverse Gram resolution')
equal(right*U*G.inv()*adj(U)*TL, patch, 'nonorthogonal seam')
print('PASS: complex Gram G =', G, '; det(G) =', G.det())

# CA-80's t_L=F t_R is a column of basis vectors. Its linear-dual column
# transforms by F^-T, independently of a Hermitian adjoint convention.
dual = clean(F.inv().T)
equal(dual*F.T, I, 'linear dual F^-T')
equal(dual, adj(F).T, 'unitary F^-T = conjugate F')
print('PASS: dual F^-T = conjugate(F), and dual*F.T = I.')
sample = {r: sp.Rational(1, 2), z: sp.I, x: 2, y: 3}
mutation('omit Gram inverse', clean((right*U*adj(U)*TL).subs(sample)), patch.subs(sample))
mutation('use transpose instead of seam dagger',
         clean((right*U*G.inv()*U.T*TL).subs(sample)), patch.subs(sample))
mutation('use F instead of conjugate F for dual', (F*F.T).subs(sample), I)
mutation('use C.T instead of C dagger for right gate',
         clean((C.T*TR*C*TL).subs(sample)), patch.subs(sample))

# Exact Taylor oracle follows from the two involutions, with order R L.
# Check the x=e^t,y=e^t exact expression independently by derivatives.
t = sp.symbols('t', real=True)
Bleft = clean(adj(C)*B*C)
for order, expected in [(0, I), (1, A+Bleft), (2, 2*(I+Bleft*A))]:
    derivative = patch.subs({x: sp.exp(t), y: sp.exp(t)}).diff(t, order).subs(t, 0)
    equal(derivative, expected, 'exact gate Taylor order '+str(order))
bad_left = I+t*A+t*t*I  # mutated coefficient: 1 rather than 1/2
right_to_second_order = I+t*Bleft+t*t/2*I
wrong_second_order = (right_to_second_order*bad_left).diff(t, 2).subs(t, 0)/2
mutation('wrong t^2/2 gate term changed to t^2', wrong_second_order, I+Bleft*A)
print('PASS: exact patch Taylor coefficients through order two; order is right then left.')
print('ALL PATCH CHECKS PASSED; 5 deliberate mutations rejected.')
print('Elapsed seconds:', round(perf_counter()-started, 3))
