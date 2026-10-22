"""Exact finite witnesses for E5, not an instance of a continuum certificate.

Run from the repository root with PYTHONDONTWRITEBYTECODE=1 python3 and
this file's path. Sources and infinite proofs: ../NOTE.md, E5-L/J/N/X.
PP cost K is inverse to the best lower constant lambda.
Conventions: copy-major coordinate order, normalized probabilities,
real exact rational matrix witnesses; all adjoints below are transposes.
"""

import hashlib
from pathlib import Path
import platform

import sympy as s


def expect(t, cells=1):
    return s.kronecker_product(s.Matrix([[t, 1-t], [t, 1-t]]), s.eye(cells))


def metric(t, cells):
    return s.diag(*([t/cells] * cells + [(1-t)/cells] * cells))


def positive_on_abelian_cone(a):
    # Linear map on coordinatewise ordered real vectors: positivity iff
    # every matrix entry is nonnegative, testing the positive coordinate units.
    assert all(v >= 0 for v in a), "negative image of a positive coordinate unit"


def assert_psd(a):
    assert a == a.T, "witness is not symmetric"
    assert all(v >= 0 for v in a.eigenvals()), "negative eigenvalue"


def reject(label, check):
    try:
        check()
    except AssertionError:
        print(f"RED (expected mutation rejected): {label}")
    else:
        raise AssertionError(f"mutation escaped: {label}")


def unit_check(a):
    one = s.ones(a.rows, 1)
    assert a * one == one, "not unital"


def weighted_adjoint_check(a, g):
    assert a.T * g == g * a, "not self-adjoint in the preserved-state metric"


def run_mutations():
    t = s.Rational(1, 3)
    a = expect(t)
    reject("replace lambda=min(t,1-t) by max(t,1-t)",
           lambda: positive_on_abelian_cone(a - (1-t) * s.eye(2)))
    reject("halve the expectation's normalization", lambda: unit_check(a/2))
    reject("use uniform rather than preserved-state Jones metric",
           lambda: weighted_adjoint_check(a, s.eye(2)))
    p0 = s.Matrix([1, 0])
    reject("extend the two-copy expectation as identity after N=M",
           lambda: assert_equal(expect(s.Rational(1, 2)) * p0, p0))
    # X2: stage PP cost 1 mistakenly substituted for target C1 subset M_2.
    p = s.diag(1, 0)
    reject("infer cost 1 from the converged Jones projection",
           lambda: assert_psd(s.eye(2)/2 - p))


def assert_equal(a, b):
    assert a == b, "matrices/vectors differ"


def weighted_expectations():
    for t in map(s.Rational, ("1/2", "1/3", "2/3")):
        for cells in (1, 2, 4):
            a = expect(t, cells)
            g = metric(t, cells)
            unit_check(a)
            assert a*a == a
            weighted_adjoint_check(a, g)
            weights = s.ones(1, 2*cells) * g
            assert weights*a == weights
            lam = min(t, 1-t)
            positive_on_abelian_cone(a-lam*s.eye(2*cells))
            # A coordinate witness excludes every larger constant; test a
            # definite rational increase as an exact regression witness.
            assert min(a-(lam+s.Rational(1, 100))*s.eye(2*cells)) < 0
            root = s.diag(*(s.sqrt(g[i, i]) for i in range(2*cells)))
            jones = root*a*root.inv()
            assert jones.T == jones and jones*jones == jones
    print("GREEN: weighted expectations, exact optimal PP constants, Jones metrics")


def refinement():
    for cells in (1, 2, 4):
        t = s.Rational(1, 3)
        r0 = s.kronecker_product(s.eye(cells), s.ones(2, 1))
        r = s.diag(r0, r0)
        coarse, fine = expect(t, cells), expect(t, 2*cells)
        assert fine*r == r*coarse
        assert r.T*metric(t, 2*cells)*r == metric(t, cells)
    print("GREEN: exact compatibility and isometric GNS refinement")


def cylinder_witness():
    for k in range(1, 5):
        cells = 2**k
        x = s.zeros(2*cells, 1)
        x[cells] = 1  # (0, indicator of all-zero prefix)
        expected = s.zeros(2*cells, 1)
        expected[0] = expected[cells] = s.Rational(1, 2)
        a = expect(s.Rational(1, 2), cells)
        assert a*x == expected
        weights = s.ones(1, 2*cells)/(2*cells)
        assert (weights*x)[0] == s.Rational(1, 2**(k+1))
        assert weights*(a*x) == weights*x
    print("GREEN: cylinder strong-null witness formula; finite states are compatible")


def missing_ambient_exhaustion():
    for m in (2, 3):
        one = s.Matrix([int(i == j) for i in range(m) for j in range(m)])
        e = one*one.T/m
        assert e*e == e and e.T == e
        assert e != s.eye(m*m) and e.rank() == 1
        p = s.diag(1, *([0]*(m-1)))
        assert_psd(s.eye(m)/m - p/m)
        assert min((s.eye(m)/m - p).eigenvals()) == s.Rational(1, m)-1
    print("GREEN: equal Jones projections, stage cost 1, target costs 2 and 3")


if __name__ == "__main__":
    print(f"Python {platform.python_version()}; SymPy {s.__version__}")
    print(f"producer SHA256 {hashlib.sha256(Path(__file__).read_bytes()).hexdigest()}")
    run_mutations()
    weighted_expectations()
    refinement()
    cylinder_witness()
    missing_ambient_exhaustion()
    print("ACCEPTED: 5 mutations rejected, 4 exact invariant groups passed.")
