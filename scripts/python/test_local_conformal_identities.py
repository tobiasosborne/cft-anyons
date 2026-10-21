"""Universal symbolic identities, not a CFT example or a numerical fit.

Run: python3 scripts/python/test_local_conformal_identities.py
Mutation controls include algebra, Ward, circle, Taylor and mixed-action errors.
Source/derivation map: reconstruction/02_obstructions.md and
reconstruction/03_sewing_deformations.md; CONVENTIONS (ae).
"""
import unittest
import sympy as sp
from local_conformal_identities import (
    atom, add, scale, op, hoch, associator, deformation_coefficients,
    ward_derivative, circle_nonscalar_defect, ward_taylor_next, lie_on,
)


class LocalConsistencyIdentities(unittest.TestCase):
    def setUp(self):
        self.a, self.b, self.c, self.d = map(atom, "abcd")

    def test_hochschild_square_zero_on_one_cochain(self):
        f = lambda a: op("f", a)
        df = lambda a, b: hoch(f, (a, b))
        self.assertEqual(hoch(df, (self.a, self.b, self.c)), {})

    def test_hochschild_square_zero_on_two_cochain(self):
        f = lambda a, b: op("p", a, b)
        df = lambda a, b, c: hoch(f, (a, b, c))
        self.assertEqual(hoch(df, (self.a, self.b, self.c, self.d)), {})

    def test_first_and_second_order_obstruction_signs(self):
        a, b, c = self.a, self.b, self.c
        coefficients = deformation_coefficients(a, b, c)
        p, q = (lambda x, y: op("p", x, y)), (lambda x, y: op("q", x, y))
        self.assertEqual(coefficients[0], {})
        self.assertEqual(coefficients[1], scale(-1, hoch(p, (a, b, c))))
        obstruction = add(p(p(a, b), c), scale(-1, p(a, p(b, c))))
        self.assertEqual(coefficients[2], add(obstruction, scale(-1, hoch(q, (a, b, c)))))

    def test_associator_five_term_identity_without_associativity(self):
        a, b, c, d = self.a, self.b, self.c, self.d
        u = lambda x, y: op("u", x, y)  # No associative normalization.
        r = lambda x, y, z: associator(u, x, y, z)
        identity = add(u(a, r(b, c, d)), scale(-1, r(u(a, b), c, d)),
                       r(a, u(b, c), d), scale(-1, r(a, b, u(c, d))),
                       u(r(a, b, c), d))
        self.assertEqual(identity, {})

    def test_ward_equation_propagates_through_sewing(self):
        z1, z2, b0, b1, b2 = map(atom, ("Z1", "Z2", "B0", "B1", "B2"))
        dz1 = ward_derivative(z1, b0, b1)
        dz2 = ward_derivative(z2, b1, b2)
        residual = add(op("m", dz2, z1), op("m", z2, dz1),
                       op("m", b2, z2, z1), scale(-1, op("m", z2, z1, b0)))
        self.assertEqual(residual, {})

    def test_lift_bianchi_is_operator_jacobi(self):
        comm = lambda x, y: add(op("m", x, y), scale(-1, op("m", y, x)))
        result = {}
        for x, y, z in (("x", "y", "z"), ("y", "z", "x"), ("z", "x", "y")):
            ax, ay, az, ayz, axyz = map(atom, (x, y, z, y+z, x+"("+y+z+")"))
            fyz = add(comm(ay, az), scale(-1, ayz))
            fxyz = add(comm(ax, ayz), scale(-1, axyz))
            result = add(result, comm(ax, fyz), fxyz, axyz)
        self.assertEqual(result, {})

    def test_virasoro_cocycle_jacobi_polynomial(self):
        m, n = sp.symbols("m n")
        k = -m-n  # Otherwise every Kronecker-supported central term is zero.
        p = lambda x: x**3-x
        expression = (m-n)*p(m+n)+(n-k)*p(n+k)+(k-m)*p(k+m)
        self.assertEqual(sp.expand(expression), 0)
        self.assertEqual([p(j) for j in (-1, 0, 1)], [0, 0, 0])

    def test_circle_exponential_bracket_sign(self):
        m, n = sp.symbols("m n")
        self.assertEqual(sp.expand(circle_nonscalar_defect(m, n)), 0)

    def test_sewing_cocycle_is_rephasing_invariant(self):
        p, q, r, qp, rq, rqp = sp.symbols("bP bQ bR bQP bRQ bRQP", nonzero=True)
        left_multiplier = (rqp/(r*qp))*(qp/(q*p))
        right_multiplier = (rqp/(rq*p))*(rq/(r*q))
        self.assertEqual(sp.cancel(left_multiplier/right_multiplier), 1)

    def test_taylor_ward_coefficient_matches_differentiation(self):
        z0, z1, p0, p1, m0, m1 = map(atom, ("Z0", "Z1", "P0", "P1", "M0", "M1"))
        plus = add(op("m", p0, z1), op("m", p1, z0))
        minus = add(op("m", z1, m0), op("m", z0, m1))
        z2 = ward_taylor_next(1, plus, minus)
        # q coefficient of dZ/dq+Bplus*Z-Z*Bminus for Z=Z0+qZ1+q^2 Z2.
        residual = add(scale(2, z2), plus, scale(-1, minus))
        self.assertEqual(residual, {})

    def test_hochschild_differential_is_equivariant(self):
        p = lambda a, b: op("p", a, b)
        lp = lambda a, b: lie_on(p, (a, b))
        dp = lambda a, b, c: hoch(p, (a, b, c))
        args = self.a, self.b, self.c
        self.assertEqual(add(hoch(lp, args), scale(-1, lie_on(dp, args))), {})


if __name__ == "__main__":
    unittest.main(verbosity=2)
