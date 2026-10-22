#!/usr/bin/env python3
"""Exact finite checks for NOTE.md; no CFT existence claim.

Run from repository root:
  python3 explorations/2026-10-22-astra-r2/E4-ward-to-ks-transfer/checks/check.py
Source: ../NOTE.md equations (3), (8), (11), (15), (17), (19), (21).
Independent oracle: Schottenloher2008.md:2610-2634 (cocycle recurrence).
Largest matrices: 3 by 3. No floating-point tolerances or network.
"""
import argparse
import sympy as s

parser = argparse.ArgumentParser()
parser.add_argument("--mutate", choices=["ward_weight", "shift_sign",
                                      "mixed_product", "recurrence", "derivative"])
mutate = parser.parse_args().mutate


def zero(expr, label):
    if isinstance(expr, s.MatrixBase):
        assert expr.applyfunc(s.simplify) == s.zeros(*expr.shape), label
    else:
        assert s.simplify(expr) == 0, label


# Direct periodic summation, independent of the asserted beta formula.
N = 4
ell = s.Symbol("ell", positive=True)
Q = [s.Matrix([[j + 1, j * s.I], [-j * s.I, j * j]]) for j in range(N)]
f = lambda m, j: s.I ** (m * j)
dn = lambda m: (s.I ** m - s.I ** (-m)) / (2 * s.I * ell)
D = lambda seq, j: (seq[(j + 1) % N] - seq[(j - 1) % N]) / (2 * s.I * ell)
b, k3, k1 = s.symbols("b k3 k1", real=True)
mode = lambda m: sum((f(m, j) * Q[j] / N for j in range(N)), s.zeros(2))
for m in (-1, 0, 1):
    for n in (-1, 0, 1):
        weight = 1 if mutate == "ward_weight" else 2
        actual = sum((f(n, j) * (f(m, j) * D(Q, j)
                     + weight * dn(m) * f(m, j) * Q[j]) / N
                      for j in range(N)), s.zeros(2))
        beta = 2 * dn(m) - dn(m + n)
        zero(actual - beta * mode(m + n), "Ward weight and summation by parts")
        central = (k3 * dn(m) ** 3 + k1 * dn(m)) * int(m + n == 0)
        full = actual + central * s.eye(2)
        shifted_mode = mode(m + n) + b * int(m + n == 0) * s.eye(2)
        sign = 1 if mutate == "shift_sign" else -1
        predicted_z = int(m + n == 0) * (k3 * dn(m) ** 3
                                       + (k1 + sign * 2 * b) * dn(m))
        zero(full - beta * shifted_mode - predicted_z * s.eye(2),
             "central zero-mode shift sign")
assert s.simplify(2 * dn(1) - dn(2)) != 0, "finite diagonal needs residual"
print("PASS exact periodic Ward contraction, central shift, finite antisymmetry caveat")

# Formal plane residues and independent coefficient system.
m, n, p = s.symbols("m n p", integer=True)
cstar, c, a1, a2 = s.symbols("cstar c a1 a2")
a = lambda x: ((a2 - 2 * a1) * (x ** 3 - x) / 6 + a1 * x)
sign = 1 if mutate == "recurrence" else -1
zero((m - 1) * a(m + 1) - (m + 2) * a(m) - sign * (2 * m + 1) * a1,
     "cocycle recurrence")
aa = lambda x: (cstar * x ** 3 - c * x) / 12
jacobi = (m - n) * aa(p) + (n - p) * aa(m) + (p - m) * aa(n)
zero(jacobi.subs(p, -m - n), "scalar Jacobi")
sol = s.solve([aa(1) - a1, aa(2) - a2], [cstar, c])
zero(sol[cstar] - 2 * (a2 - 2 * a1), "cstar reconstruction")
zero(sol[c] - (2 * a2 - 16 * a1), "linear coefficient reconstruction")
zero(aa(m).subs(sol) - a(m), "recurrence versus independent linear solve")
w, cw = s.symbols("w cw")
for mi in range(-4, 5):
    for ni in range(-4, 5):
        contact = cw / 12 * s.diff(w ** (mi + 1), w, 3) * w ** (ni + 1)
        expected = int(mi + ni == 0) * cw * (mi ** 3 - mi) / 12
        zero(s.residue(contact, w, 0) - expected, "double-residue central term")
print("PASS plane residues, scalar Jacobi, recurrence, independent central reconstruction")

# Matrix identities test all six product terms in the comparison expansion.
Sm = s.Matrix([[1, s.I], [-s.I, 3]])
Sn = s.Matrix([[2, 1], [1, -1]])
Dm = s.Matrix([[s.Rational(1, 3), 1], [0, 0]])
Dn = s.Matrix([[0, 0], [2, s.Rational(1, 5)]])
comm = lambda A, B: A * B - B * A
rhs = comm(Sm, Dn) + comm(Dm, Sn) + comm(Dm, Dn)
if mutate == "mixed_product":
    rhs += Dn * Sm  # Deliberately remove one ordered mixed product.
zero(comm(Sm + Dm, Sn + Dn) - comm(Sm, Sn) - rhs, "mixed products retained")
A, B = s.diag(1, 0), s.Matrix([[0, 1], [1, 0]])
for r in (1, 2, 5, 10):
    residual = comm(2 ** r * A, s.Rational(1, 2 ** r) * B)
    zero(residual.H * residual - s.eye(2), "nonvanishing small-error commutator")
print("PASS full commutator expansion and norm-one counterexample")

# Exact positive-gate scalar eigenvalue, so derivative is an independent oracle.
eps, eta, t = s.symbols("eps eta t", positive=True)
gate = s.exp(-t * (1 + eps * s.sin(eta / eps ** 2)))
actual_derivative = s.diff(gate, eta).subs(eta, 0)
predicted_derivative = -t * s.exp(-t) * (eps if mutate == "derivative" else 1 / eps)
zero(actual_derivative - predicted_derivative, "gate derivative amplification")
zero(gate.subs(t, 0) - 1, "gate regularity")
zero(gate.subs(eta, 0) - s.exp(-t), "gate common metric origin")
print("PASS exact gate derivative amplification and zero-time regularity")

# Rectangular transport and fixed graph weights: no JJ* = 1 substitution.
J = s.Matrix([[1, 0], [0, 1], [0, 0]])
Ki, Ko = s.diag(1, 2), s.diag(1, 2, 3)
Si, Di = Sm, Dm
So = s.Matrix([[1, 2, 3], [0, 1, 4], [2, 0, -1]])
Do = s.Matrix([[0, 1, 0], [2, 0, 1], [1, 1, 1]])
zero(J.H * J - s.eye(2), "refinement isometry")
zero(Ko * J - J * Ki, "exact graph transport")
zero((So + Do) * J - J * (Si + Di)
     - (So * J - J * Si + Do * J - J * Di), "rectangular defect split")
for order in (0, 1, 3):
    zero(Ko ** order * Do * J * Ki ** (-order - 1)
         - Ko ** order * Do * Ko ** (-order - 1) * J,
         "fine discrepancy graph factors")
    zero(Ko ** order * J * Di * Ki ** (-order - 1)
         - J * Ki ** order * Di * Ki ** (-order - 1),
         "coarse discrepancy graph factors")
print("PASS rectangular transport identity and graph-factor placement")
print("ALL 5 GROUPS PASS; exact finite identities only, no continuum certificate")
