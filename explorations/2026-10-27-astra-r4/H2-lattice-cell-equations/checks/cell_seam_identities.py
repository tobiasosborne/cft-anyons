#!/usr/bin/env python3
"""Exact A2/B1/B2 calibration on universal matrix multiplicity spaces.

Run from repository root: python3 explorations/2026-10-27-astra-r4/H2-lattice-cell-equations/checks/cell_seam_identities.py
Sources: CA-80:70-83,127-135; CA-92:83-94,125-139,157-165;
CA-98:122-158; reconstruction/01_cells.md:164-195; H2 NOTE A2/B1/B2.
Scope: pillar P3 on P2; O=1+1 exists in every unitary fusion category.
The matrix calculations assert no reflection positivity for arbitrary networks.
R=dZ-B_out Z+Z B_in. Physical pair order is 00,01,10,11;
pair indices below are categorical tensor indices, not operator vectorisation.
"""
import hashlib
import itertools
from pathlib import Path
import platform

import sympy as s


def expanded(value):
    return value.applyfunc(s.expand)


def zero(value, label):
    result = expanded(value)
    assert result == s.zeros(*result.shape), f"{label}: residual {result}"


def red(label, value):
    try:
        zero(value, label)
    except AssertionError:
        result = expanded(value)
        row, col = next((i, j) for i in range(result.rows)
                        for j in range(result.cols) if result[i, j] != 0)
        entry = result[row, col]
        substitutions = {symbol: index + 1 for index, symbol in
                         enumerate(sorted(entry.free_symbols - {t}, key=str))}
        witness = entry.subs(substitutions | {t: 1})
        assert witness != 0, f"Nonzero polynomial lost its declared witness: {label}"
        print(f"RED expected: {label}; residual[{row},{col}] witness={witness}")
    else:
        raise AssertionError(f"Mutation escaped: {label}")


def polynomial_matrix(name, degree):
    return sum((s.Matrix(2, 2, s.symbols(f"{name}{k}_0:4")) * t**k
                for k in range(degree + 1)), s.zeros(2))


def ward(value, out, incoming):
    return value.diff(t) - out * value + value * incoming


print(f"Python {platform.python_version()}; SymPy {s.__version__}")
print("command: python3 " + str(Path(__file__).relative_to(Path.cwd())))
print("producer_sha256", hashlib.sha256(Path(__file__).read_bytes()).hexdigest())
t = s.symbols("t", real=True)
P, Q = polynomial_matrix("p", 2), polynomial_matrix("q", 2)
B0, B1, B2 = (polynomial_matrix(f"b{j}", 1) for j in range(3))
Rp, Rq = ward(P, B1, B0), ward(Q, B2, B1)
zero(ward(Q * P, B2, B0) - Rq * P - Q * Rp, "Ward sewing")
print("PASS independent polynomial 2x2 off-shell Ward sewing with shared B1")
D = s.Matrix([[0, 1], [0, 0]])
wrong = ward(Q * P, B2, B0) - ward(Q, B2, B1 + D) * P - Q * Rp
zero(wrong + Q * D * P, "wrong-middle connection defect")
red("wrong middle connection B1+D", wrong)
zero(ward(Q * P, B2, B0) - Rq * P - Q * Rp, "restored Ward sewing")
print("GREEN restored: Ward sewing; wrong-middle defect is exactly -Q D P")
G = s.Matrix([[1 + t, t**2], [t, 2 - t]])
pairing_defect = (Q * G * P).diff(t) - Q.diff(t) * G * P - Q * G * P.diff(t)
zero(pairing_defect - Q * G.diff(t) * P, "pairing derivative")
red("omit nonconstant pairing derivative Q G' P", pairing_defect)
red("wrong pairing-derivative sign", pairing_defect + Q * G.diff(t) * P)
zero(ward(Q * G * P, B2, B0) - Rq * G * P - Q * G * Rp
     - Q * (G.diff(t) - B1 * G + G * B1) * P, "covariant pairing defect")
print("GREEN restored: ordinary and covariant pairing-derivative corrections")

I2 = s.eye(2)
a, b = s.Matrix([[1, 2], [0, -1]]), s.Matrix([[0, 1], [3, 2]])
alpha = lambda x: s.kronecker_product(x, I2)
beta = lambda x: s.kronecker_product(I2, x)
delta = lambda x: alpha(x) - beta(x)
zero(alpha(a * b) - alpha(a) * alpha(b), "alpha multiplicative")
zero(beta(a * b) - beta(a) * beta(b), "beta multiplicative")
zero(delta(a * b) - delta(a) * beta(b) - alpha(a) * delta(b), "twisted law")
ordinary = delta(a * b) - delta(a) * beta(b) - beta(a) * delta(b)
zero(ordinary - delta(a) * delta(b), "missing quadratic term")
red("ordinary relative-beta Leibniz omits Delta(a)Delta(b)", ordinary)
zero(ordinary - delta(a) * delta(b), "restored finite difference")
print("GREEN restored: multiplicative alpha=a tensor I, beta=I tensor a; twisted law")


def matrix_unit(i, j):
    return s.eye(4)[:, i] * s.eye(4)[j, :]


def kflip(tile):
    result = s.zeros(4)
    for i, j, k, ell in itertools.product(range(2), repeat=4):
        result[2 * i + k, 2 * j + ell] = tile[2 * i + ell, 2 * k + j]
    return result


def unflip(kernel):
    result = s.zeros(4)
    for i, j, k, ell in itertools.product(range(2), repeat=4):
        result[2 * i + ell, 2 * k + j] = kernel[2 * i + k, 2 * j + ell]
    return result


flip = sum((matrix_unit(2 * j + i, 2 * i + j)
            for i, j in itertools.product(range(2), repeat=2)), s.zeros(4))
W, u = s.diag(1, 1, -1, 1), s.Matrix([1, 0, 0, 1])
seam = flip * W
ks = lambda tile: seam.H * flip * kflip(tile)
invks = lambda kernel: unflip(flip.H * seam * kernel)
sharp = lambda tile: invks(ks(tile).H)
product = lambda x, y: ks(invks(x) * invks(y))
zero(seam.H * seam - s.eye(4), "seam unitary")
zero(seam * u - u, "seam cup condition")
zero(ks(s.eye(4)) - u * u.H, "bent identity kernel")
assert ks(s.eye(4)).rank() == 1 and s.eye(4).rank() == 4
for i, j in itertools.product(range(4), repeat=2):
    unit = matrix_unit(i, j)
    zero(invks(ks(unit)) - unit, "bend inverse on matrix units")
    zero(ks(invks(unit)) - unit, "inverse bend on matrix units")
    zero(sharp(sharp(unit)) - unit, "sharp involution")
print("PASS universal multiplicity seam: unitary, cup-preserving; K_s(1)=u u^dagger rank 1")
print("PASS all 16 matrix units: both bend inverses and sharp involution")
coupling = s.symbols("coupling", real=True)
z2 = s.diag(1, -1)
h_pair = s.kronecker_product(z2, z2)
zero(h_pair * h_pair - s.eye(4), "exact pair gate involution")
tile = s.cosh(t * coupling) * s.eye(4) + s.sinh(t * coupling) * h_pair
zero(tile.diff(t) - coupling * h_pair * tile, "exact pair gate ODE")
zero(tile.subs(t, 0) - s.eye(4), "exact pair gate initial condition")
zvec = s.Matrix([1, 0, 0, -1])
zero(kflip(tile) - s.cosh(t * coupling) * u * u.H
     - s.sinh(t * coupling) * zvec * zvec.H, "exact gate spatial RP cone")
assert (u.H * zvec)[0] == 0
zero(kflip(tile) * zvec - 2 * s.sinh(t * coupling) * zvec,
     "sign-sensitive spatial RP eigenvalue")
print("PASS exact gate RP cone: h=a Z tensor Z; spatial kernel has eigenvalues "
      "2*cosh(t*a), 2*sinh(t*a), 0, 0; for t>0 positivity iff a>=0")
L = s.eye(4) + matrix_unit(0, 1) + 2 * matrix_unit(2, 3)
M = matrix_unit(1, 0) + matrix_unit(3, 2) + matrix_unit(0, 2)
N = s.eye(4) + matrix_unit(2, 0) + matrix_unit(1, 3)
X, Y, Z = ks(L), ks(M), ks(N)
zero(product(product(X, Y), Z) - product(X, product(Y, Z)), "transported associativity")
zero(product(product(X, Y), Z) - ks(L * M * N), "transported product value")
zero(product(ks(s.eye(4)), X) - X, "transported left unit")
zero(product(X, ks(s.eye(4))) - X, "transported right unit")
red("K_s preserves ordinary temporal matrix multiplication", ks(L * M) - X * Y)
print("PASS actual-matrix transported product is associative with unit K_s(1)")
A, B = matrix_unit(0, 1), matrix_unit(1, 0)
zero(sharp(A) + matrix_unit(2, 0), "sharp A witness")
zero(sharp(B) - matrix_unit(0, 2), "sharp B witness")
zero(sharp(A * B) - matrix_unit(0, 0), "sharp AB witness")
red("same-algebra reflection covariant variance", sharp(A * B) - sharp(A) * sharp(B))
red("same-algebra reflection contravariant variance", sharp(A * B) - sharp(B) * sharp(A))
print("GREEN exact witnesses: sharp(AB)=E00,00; covariant product=-E10,10; reverse product=-E00,00")
print("SCOPE: universal unit-multiplicity calibration in every C; no arbitrary-network RP or continuum claim")
