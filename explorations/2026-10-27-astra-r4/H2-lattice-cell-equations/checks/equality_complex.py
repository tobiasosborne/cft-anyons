#!/usr/bin/env python3
"""Exact finite calibration of H2 NOTE section C; no CFT/KS conclusion.

Run from repository root:
python3 explorations/2026-10-27-astra-r4/H2-lattice-cell-equations/checks/equality_complex.py

Sources: reconstruction/01_cells.md:164-186 (Ward product rule),
03_sewing_deformations.md:143-158 (identities needed for obstruction complex),
10_four_port_linearization.md:114-180 (real Jacobian and positivity boundary).
New identities are expanded independently below. NOTE scoped conventions:
R=dZ-B_out Z+Z B_in; ordinary first geometry jet; column-major vec;
formal deformation epsilon is distinct from the geometry coordinate.
Pillar P3: equality identities and RP boundary, on a universal matrix fragment.
"""
import hashlib
import itertools
from pathlib import Path
import platform

import sympy as s


def matrix(name):
    """Independent 2x2 entries, generated and vectorized column first."""
    entries = s.symbols(f"{name}_0:4")
    return s.Matrix(2, 2, lambda row, col: entries[row + 2 * col])


def vec(value):
    return [value[row, col] for col in range(value.cols)
            for row in range(value.rows)]


def stack(values):
    return s.Matrix([entry for value in values for entry in vec(value)])


def zero(value):
    return all(s.expand(entry) == 0 for entry in value)


def witness(value):
    for row in range(value.rows):
        for col in range(value.cols):
            if value[row, col] != 0:
                return row, col, value[row, col]
    raise AssertionError("expected a nonzero matrix witness")


arrows = list(itertools.combinations(range(4), 2))
triples = list(itertools.combinations(range(4), 3))
Z = {(i, j, order): matrix(f"z{i}{j}_{order}")
     for i, j in arrows for order in range(2)}
B = {i: matrix(f"b{i}") for i in range(4)}
S = {}
for i, j, k in triples:
    S[i, j, k, 0] = Z[i, k, 0] - Z[j, k, 0] * Z[i, j, 0]
    S[i, j, k, 1] = (Z[i, k, 1] - Z[j, k, 1] * Z[i, j, 0]
                     - Z[j, k, 0] * Z[i, j, 1])
R = {(i, j): Z[i, j, 1] - B[j] * Z[i, j, 0]
     + Z[i, j, 0] * B[i] for i, j in arrows}

# Universal off-shell identities, with no specialization to the base point.
assoc0 = (S[0, 2, 3, 0] + Z[2, 3, 0] * S[0, 1, 2, 0]
          - S[0, 1, 3, 0] - S[1, 2, 3, 0] * Z[0, 1, 0])
assoc1 = (S[0, 2, 3, 1] + Z[2, 3, 1] * S[0, 1, 2, 0]
          + Z[2, 3, 0] * S[0, 1, 2, 1] - S[0, 1, 3, 1]
          - S[1, 2, 3, 1] * Z[0, 1, 0]
          - S[1, 2, 3, 0] * Z[0, 1, 1])
assert zero(assoc0) and zero(assoc1), "off-shell associativity syzygies"
for i, j, k in triples:
    identity = (R[i, k] - R[j, k] * Z[i, j, 0]
                - Z[j, k, 0] * R[i, j] - S[i, j, k, 1]
                + B[k] * S[i, j, k, 0] - S[i, j, k, 0] * B[i])
    assert zero(identity), ("off-shell Ward-sewing", i, j, k)

# An actual 56x64 Jacobian at Z_0=I, Z_1=0, B_i=diag(1,2).
I = s.eye(2)
common = s.diag(1, 2)
variable_blocks = [Z[i, j, order] for i, j in arrows for order in range(2)]
variable_blocks += list(B.values())
variables = stack(variable_blocks)
base_blocks = [I if order == 0 else s.zeros(2)
               for i, j in arrows for order in range(2)] + [common] * 4
base = dict(zip(variables, stack(base_blocks)))
residuals = stack([S[i, j, k, order] for i, j, k in triples
                   for order in range(2)] + [R[arrow] for arrow in arrows])
assert zero(residuals.subs(base)), "declared base must solve every residual"
D1 = residuals.jacobian(variables).subs(base)

# Gauge jets u_i,u'_i: delta B_i=[u_i,B]+u'_i for this R sign.
u = {i: matrix(f"u{i}") for i in range(4)}
up = {i: matrix(f"up{i}") for i in range(4)}
gauge_variables = stack(list(u.values()) + list(up.values()))
gauge_blocks = []
for i, j in arrows:
    gauge_blocks += [u[j] - u[i], up[j] - up[i]]
gauge_blocks += [u[i] * common - common * u[i] + up[i] for i in range(4)]
D0 = stack(gauge_blocks).jacobian(gauge_variables)

# Construct independent residual coordinates, then the explicit identity map.
q = {(i, j, k, order): matrix(f"s{i}{j}{k}_{order}")
     for i, j, k in triples for order in range(2)}
r = {arrow: matrix(f"r{arrow[0]}{arrow[1]}") for arrow in arrows}
residual_coordinates = stack(list(q.values()) + list(r.values()))
identity_rows = [q[0, 2, 3, order] + q[0, 1, 2, order]
                 - q[0, 1, 3, order] - q[1, 2, 3, order]
                 for order in range(2)]
for i, j, k in triples:
    identity_rows.append(r[i, k] - r[j, k] - r[i, j]
                         - q[i, j, k, 1] + common * q[i, j, k, 0]
                         - q[i, j, k, 0] * common)
D2 = stack(identity_rows).jacobian(residual_coordinates)
assert max(max(value.shape) for value in (D0, D1, D2)) <= 128
assert zero(D1 * D0), "gauge directions must lie in the Jacobian kernel"
assert zero(D2 * D1), "off-shell identities must annihilate the Jacobian"

# RED: flip the minus sign on s_012,1 in the first Ward identity row.
mutated_rows = list(identity_rows)
mutated_rows[2] = mutated_rows[2] + 2 * q[0, 1, 2, 1]
mutated = stack(mutated_rows).jacobian(residual_coordinates)
broken = mutated * D1
print(f"Python {platform.python_version()}; SymPy {s.__version__}")
print("command: python3 explorations/2026-10-27-astra-r4/H2-lattice-cell-equations/checks/equality_complex.py")
print("producer_sha256", hashlib.sha256(Path(__file__).read_bytes()).hexdigest())
print("PASS off-shell associativity syzygies at geometry jets 0 and 1")
print("PASS four full off-shell Ward-sewing syzygies")
try:
    assert zero(broken), "D2 D1 must vanish"
except AssertionError:
    bad_row, bad_col, bad_value = witness(broken)
    print(f"RED expected: Ward s1 sign mutation gives (D2_bad D1)[{bad_row},{bad_col}]={bad_value}")
else:
    raise AssertionError("mutation survived: the regression test is broken")
assert zero(D2 * D1), "restored identity must pass"
print("GREEN restored: D1 D0=0 and D2 D1=0 exactly")
for name, value in (("D0", D0), ("D1", D1), ("D2", D2)):
    print(f"{name} shape={value.shape}, rank={value.rank()}")

# Singular RP: a feasible first derivative needs a second-order correction.
t = s.symbols("t", real=True)
K0, H = s.diag(1, 0), s.Matrix([[0, 1], [1, 0]])
assert (K0 + t * H).det() == -t**2
positive_path = s.Matrix([[1, t], [t, t**2]])
assert positive_path == s.Matrix([1, t]) * s.Matrix([[1, t]])
assert positive_path.diff(t).subs(t, 0) == H
assert positive_path.det() == 0
print("PASS RP: det(K0+tH)=-t^2; corrected K(t)=(1,t)^T(1,t) is PSD")

# A left-null Jacobian row is not necessarily a nonlinear syzygy.
x, epsilon = s.symbols("x epsilon")
scalar_residual = x**2
scalar_J = s.diff(scalar_residual, x).subs(x, 0)
b2 = s.expand(scalar_residual.subs(x, epsilon)).coeff(epsilon, 2)
assert scalar_J == 0 and b2 == 1
assert s.Matrix([[1]]) * s.Matrix([[scalar_J]]) == s.zeros(1)
assert s.Matrix([[1]]) * s.Matrix([[b2]]) != s.zeros(1)
print("PASS trap: R=x^2 at 0 has D2 J=0 for D2=1, but D2 b2=1")
print("SCOPE: finite equality calibration; RP is separate; no selected-KS or CFT claim")
