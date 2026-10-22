#!/usr/bin/env python3
"""Reviewer check for D2 REVIEW.md (not part of the Astra note's own bundle).

Strengthens the converse half of D2-L5: a commuting brick family that admits
NO reparametrisation u -> phi(u) satisfying additive YBE.  Needs only
End_C(O) != C (a nontrivial one-site projection p); the 2x2 blocks below are
a calibration instance (C = Vec, O = 1+1), not a model claim.
Run: python3 explorations/2026-10-22-astra/D2-selection-principle/review_checks.py
     (add --mutate to make g scalar; the check must then fail)
"""
import sys
import sympy as s

p, I2, kp = s.diag(0, 1), s.eye(2), s.kronecker_product
h = kp(p, I2) + kp(I2, p)                    # sum of one-site terms
g = s.eye(4) if '--mutate' in sys.argv else kp(p, p)
H12, H23, G12, G23 = kp(h, I2), kp(I2, h), kp(g, I2), kp(I2, g)
for A in (H12, H23, G12, G23):
    for B in (H12, H23, G12, G23):
        assert A*B == B*A, 'family must be mutually commuting'
dH, dG = H12 - H23, G12 - G23
assert s.Matrix([list(dH), list(dG)]).rank() == 2, 'g must be non-scalar'

a, b, c = s.symbols('a b c')      # a = phi(u), b = phi(v), c = phi(u+v)
# All generators commute, so each YBE side is exp(sum of exponents).
lhs = (a + b)*H12 + (a**2 + b**2)*G12 + c*H23 + c**2*G23
rhs = c*H12 + c**2*G12 + (a + b)*H23 + (a**2 + b**2)*G23
assert (lhs - rhs - ((a + b - c)*dH + (a**2 + b**2 - c**2)*dG)).expand() == s.zeros(8)
# YBE <=> both independent coefficients vanish <=> phi(u)phi(v) = 0.
basis = s.groebner([a + b - c, a**2 + b**2 - c**2], c, a, b, order='lex')
assert any(s.expand(q - a*b) == 0 for q in basis.exprs), basis
print('PASS commuting brick family: additive YBE under any reparametrisation '
      'forces phi(u)phi(v)=0; needs only End_C(O) != C')
