#!/usr/bin/env python3
"""D2 exact structural checks; no chain simulation or category-specific data.

Run from repository root:
python3 explorations/2026-10-22-astra/D2-selection-principle/checks/exact_checks.py
Mutation flags deliberately break an implementation, and must exit nonzero.
"""
import argparse
import sys
import sympy as s

parser = argparse.ArgumentParser()
parser.add_argument('--mutate-brick-order', action='store_true')
parser.add_argument('--mutate-gram-inverse', action='store_true')
args = parser.parse_args()
print('Python', sys.version.split()[0], 'SymPy', s.__version__, flush=True)


def zero_matrix(mat):
    return all(s.simplify(x) == 0 for x in mat)


# General TL_3 witness only. No claim that d=5/3 extends to a fusion category.
d = s.Rational(5, 3)
e = s.diag(d, 0)
f = s.Matrix([[s.Rational(3, 5), s.Rational(4, 5)],
              [s.Rational(4, 5), s.Rational(16, 15)]])
I = s.eye(2)
for residual in (e*e-d*e, f*f-d*f, e*f*e-e, f*e*f-f):
    assert zero_matrix(residual), 'TL relation failed'
assert e != f
x, y, z = s.symbols('x y z')
lhs = (I+x*e)*(I+z*f)*(I+y*e)
rhs = (I+y*f)*(I+z*e)*(I+x*f)
expected = (x+y+d*x*y+x*y*z-z)*(e-f)
assert zero_matrix(lhs-rhs-expected), 'TL YBE scalar reduction failed'
print('PASS TL relations and scalar YBE residual', flush=True)


def brick(t):
    if args.mutate_brick_order:
        return (I+t*f)*(I+t*e)
    return (I+t*e)*(I+t*f)


residual = brick(x)*brick(y)-brick(y)*brick(x)
assert zero_matrix(residual-x*y*(y-x)*(f-e)), 'brick commutator oracle failed'
assert not zero_matrix(residual.subs({x: 1, y: 2}))
print('PASS YBE tiles do not imply arbitrary brick commutativity', flush=True)

# Trigonometric addition law in algebraic sin/cos coordinates, independent d.
sl, cl, su, cu, sv, cv = s.symbols('sl cl su cu sv cv')
denu, denv = sl*cu-cl*su, sl*cv-cl*sv
znum, zden = su*cv+cu*sv, sl*(cu*cv-su*sv)-cl*(su*cv+cu*sv)
num = s.expand(znum*(denu*denv-su*sv)
               -zden*(su*denv+sv*denu+2*cl*su*sv))
assert s.rem(s.Poly(num, sl), s.Poly(sl**2+cl**2-1, sl)).is_zero
print('PASS trigonometric TL addition law modulo sin(lambda)^2+cos(lambda)^2=1')

# Free noncommutative expansion is independent of the TL matrix witness.
u, v = s.symbols('u v', commutative=True)
A, B, P, Q, U, V = s.symbols('A B P Q U V', commutative=False)


def series(t, first, second, third):
    return 1+t*first+t*t*second+t**3*third


yb = s.expand(series(u,A,P,U)*series(u+v,B,Q,V)*series(v,A,P,U)
              -series(v,B,Q,V)*series(u+v,A,P,U)*series(u,B,Q,V))
uv = s.expand(yb).coeff(u,1).coeff(v,1)
uuv = s.expand(yb).coeff(u,2).coeff(v,1)
assert s.expand(uv-(2*(Q-P)+A*A-B*B)) == 0
jet = 3*(V-U)+P*A-P*B+Q*A+A*Q-B*P-B*Q+A*B*A-B*A*B
assert s.expand(uuv-jet) == 0
C, D = s.symbols('C D', commutative=False)
comm = A*B-B*A
double = (A+B)*comm-comm*(A+B)
normalized = uuv.subs({P:A*A/2,Q:B*B/2,U:C/6,V:D/6}, simultaneous=True)
oracle = ((D-B**3)-(C-A**3)-double)/2
assert s.expand(normalized-oracle) == 0
print('PASS uv and u^2 v free-word YBE jets; cubic Hamiltonian obstruction')

# General braid-word expansion; only the constant braid relation is used.
br = s.expand((1+x*A)*(1+z*B)*(1+y*A)
              -(1+y*B)*(1+z*A)*(1+x*B))
br_oracle = (x+y-z)*(A-B)+x*y*(A*A-B*B)+x*y*z*(A*B*A-B*A*B)
assert s.expand(br-br_oracle) == 0
print('PASS braid relation leaves a quadratic spectralisation obstruction')

# Diagonal projector construction: all brick transfers commute, YBE fails.
p = s.diag(0,1)
h = s.kronecker_product(p,p)
h12, h23 = s.kronecker_product(h,I), s.kronecker_product(I,h)
assert h12*h23 == h23*h12 and h12 != h23
g = lambda t: t+t*t
exp_difference = s.expand(g(u)+g(v)-g(u+v))*(h12-h23)
assert zero_matrix(exp_difference+2*u*v*(h12-h23))
assert not zero_matrix(exp_difference.subs({u:1,v:1}))
print('PASS commuting positive gate family violates additive YBE')

# Derivative of projectively normalized degree-four blocking map.
a, b = s.symbols('a b', real=True)
raw = s.Matrix([a**4+a*b**3, b**4+a**3*b])
ell = s.Matrix([[1,0]])
fixed = s.Matrix([1,1])
point = {a:1,b:1}
normalized_map = raw/raw[0]
formula = (s.eye(2)-fixed*ell)*raw.jacobian([a,b]).subs(point)/2
assert zero_matrix(normalized_map.jacobian([a,b]).subs(point)-formula)
assert zero_matrix(normalized_map.subs(point)-fixed)
print('PASS normalized blocking Jacobian, including normalization projection')

# Physical Gram metric, not entrywise coefficient norms.
Gin, Gout = s.diag(4,9), s.diag(1,16)
sqrtout = s.diag(1,4)
invsqrtin = s.diag(s.Rational(1,2),s.Rational(1,3))
Delta = s.Matrix([[1,2],[0,1]])
right = s.diag(2,3) if args.mutate_gram_inverse else invsqrtin
physical = sqrtout*Delta*right
oracle = invsqrtin*Delta.T*Gout*Delta*invsqrtin
assert zero_matrix(physical.T*physical-oracle), 'Gram inverse oracle failed'
assert s.trace(physical.T*physical) <= 4*s.trace(Delta.T*Delta)
print('PASS Gram transport and conservative squared norm bound', flush=True)
print('ALL 8 EXACT CHECK GROUPS PASSED', flush=True)
