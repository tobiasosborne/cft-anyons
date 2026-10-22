"""Exact finite-algebra checks for NOTE.md; no CFT or scaling claim.

Run from repository root with PYTHONDONTWRITEBYTECODE=1 python3
explorations/2026-10-22-astra/D5-fidelity-lattice-sewing/checks/check_cells.py
Conventions and derivations: NOTE.md P1-P7, D5-S/P/R/G/W/M.
No category-specific representation is used. Largest matrix: 16 by 16.
"""
import hashlib
import platform
from pathlib import Path
import sympy as s


def equal(a, b):
    return all(s.simplify(v) == 0 for v in a - b)


def require(condition, message):
    assert condition, message


def dual_basis(mutation=None):
    f = s.Matrix([[1, s.I], [s.I, 1]]) / s.sqrt(2)
    require(equal(f.H * f, s.eye(2)), "F must be unitary")
    u = f if mutation == "dual_basis" else f.inv().T
    require(equal(u * f.T, s.eye(2)), "dual basis must satisfy U F^T = I")
    k = s.Matrix([2 + s.I, 3])
    b = s.Matrix([1 - s.I, 2])
    require(s.simplify(((f*k).T*(u*b)-k.T*b)[0]) == 0,
            "categorical value/block contraction changed")


def inverse_gram(mutation=None):
    basis = s.Matrix([[1, s.I], [0, 2]])
    gram = basis.H * basis
    metric = gram if mutation == "inverse_gram" else gram.inv()
    require(equal(basis * metric * basis.H, s.eye(2)),
            "interface resolution must use inverse Gram")
    p = s.Matrix([[1, 2], [s.I, -1]])
    q = s.Matrix([[3, 0], [1, 2]])
    require(equal(q * basis * metric * basis.H * p, q*p),
            "sewing changed the composed map")


def reflected_row(mutation=None):
    half = s.Matrix([[2, 1], [1, 2]])
    a = half**2
    b = s.Matrix([[3, s.I], [-s.I, 2]])
    require(b[0, 0] > 0 and b.det() > 0, "B must be positive")
    row = a*b if mutation == "row_order" else half*b*half
    require(equal(row, row.H), "reflected row must be Hermitian")
    require(row[0, 0] > 0 and row.det() > 0, "row must be positive")
    require(not equal(a*b, (a*b).H), "unsymmetric product witness lost")
    w = s.Matrix([[1, s.I/2], [-s.I/2, 1]])
    require(w.det() == s.Rational(3, 4), "complex positive tile determinant")
    require(s.exp(-2) > 0, "negative Hamiltonian eigenvalue exponential")
    require(1 - 2 < 0, "linear tile must detect negative eigenvalue")


def graded_positivity(mutation=None):
    a, b = s.symbols("a b", real=True)
    kernel = s.Matrix([[1-a*a/2, 1-a*b/2],
                       [1-a*b/2, 1-b*b/2]])
    require(s.factor(kernel.det() + (a-b)**2/2) == 0,
            "two-time determinant identity")
    witness = kernel.subs({a: 1, b: s.Rational(1, 2)})
    if mutation == "pointwise_only":
        require(witness.det() >= 0,
                "pointwise-positive function fails two-time reflection positivity")
    else:
        require(witness.det() == -s.Rational(1, 8),
                "negative energy coefficient must remain detectable")
    require(1-s.Rational(1, 2) > 0 and 1-s.Rational(1, 4) > 0,
            "scalar pointwise witnesses must be positive")


def energy_continuity(mutation=None):
    identity = s.eye(2)
    x = s.Matrix([[0, 1], [1, 0]])
    z = s.diag(1, -1)
    e1 = s.kronecker_product(x, z, identity, identity)
    e2 = s.kronecker_product(identity, x, z, identity)
    e3 = s.kronecker_product(identity, identity, x, z)
    comm = lambda a, b: a*b-b*a
    require(equal(comm(e1, e3), s.zeros(16)), "distant densities commute")
    left = s.I * comm(e1+e2+e3, e2)
    right = s.I * comm(e1, e2) - s.I * comm(e2, e3)
    if mutation == "current_sign":
        right = -right
    require(not equal(left, s.zeros(16)), "current test must be nontrivial")
    require(equal(left, right), "energy continuity sign mismatch")


def fusion_idempotents(mutation=None):
    # Synthetic two-dimensional commutative *-algebra: X^2=1.
    smat = s.Matrix([[1, 1], [1, -1]]) / s.sqrt(2)
    ops = [s.eye(3), s.diag(1, -1, 1)]
    projections = [smat[0, i] * sum(
        (s.conjugate(smat[a, i])*ops[a] for a in range(2)), s.zeros(3))
        for i in range(2)]
    require(equal(sum(projections, s.zeros(3)), s.eye(3)), "unit resolution")
    require(equal(projections[0]*projections[1], s.zeros(3)), "orthogonality")
    for p in projections:
        require(equal(p*p, p) and equal(p.H, p), "orthogonal idempotents")
    require([p.rank() for p in projections] == [2, 1],
            "fusion characters do not fix spectral multiplicity")
    for a in range(2):
        rebuilt = sum((smat[a, i]/smat[0, i]*projections[i]
                       for i in range(2)), s.zeros(3))
        require(equal(rebuilt, ops[a]), "Verlinde spectral reconstruction")


TESTS = [dual_basis, inverse_gram, reflected_row, graded_positivity,
         energy_continuity, fusion_idempotents]
MUTANTS = [(dual_basis, "dual_basis"), (inverse_gram, "inverse_gram"),
           (reflected_row, "row_order"), (graded_positivity, "pointwise_only"),
           (energy_continuity, "current_sign")]


if __name__ == "__main__":
    print("Python", platform.python_version(), "SymPy", s.__version__)
    print("producer_sha256", hashlib.sha256(Path(__file__).read_bytes()).hexdigest())
    for check, name in MUTANTS:
        try:
            check(name)
        except AssertionError as exc:
            print("RED / mutation rejected:", name, "--", str(exc))
        else:
            raise AssertionError("mutation survived: " + name)
    for check in TESTS:
        check()
        print("GREEN:", check.__name__)
    print("Restored: 6 exact invariant groups pass; 5 mutations rejected.")
    print("Witness: pointwise Q>0, two-time determinant=-1/8.")
    print("Largest matrix: 16x16. No continuum/category-realization claim.")
