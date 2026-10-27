#!/usr/bin/env python3
"""Exact H2 checks; run: python3 checks/rank_two_ward.py [--mutate-f].

Pillars P1/P2/P3: vacancy tiles and finite Ward coefficients; no continuum claim.
Layer: unbraided finite algebra, neither chiral nor full target fixed. The rings
1,x; x*x=1+m*x below are FORMAL for symbolic m>=0: no categorifiability asserted.
If an actual semisimple category is supplied, O=1+x gives A2=M2+M_(m+2).
An arbitrary symbolic orthogonal 2x2 matrix is a test parameter, NOT F-data.
Only the pointed m=0 witness has categorical F-data; its full cocycle is checked.

Sources: CONVENTIONS.md (r),(ao); CA-78, lines 44--67 (matrix-unit compiler).
references/text/PenneysUnitaryFusionCategories.md:594--608: pointed F=omega;
omega(x,x,x)=-1, all other values 1. We also check omega=1 independently.
Conventions scoped in ../NOTE.md: column-major block coordinates, commutator
[A,B]=AB-BA, R=partial T-B*T+T*B, T=exp(t*h), k=-h (velocity 1).
Pointed basis: lexicographic words in 0=1,1=x, left associated, total XOR charge.
The pair-creation matrix unit is a partial isometry, never identified with a cap.
"""

import argparse
import itertools
import time
import sympy as s


def check_zero(matrix, message):
    assert all(s.expand(entry) == 0 for entry in matrix), message


def vec(matrix):
    return s.Matrix([matrix[i, j] for j in range(matrix.cols)
                     for i in range(matrix.rows)])


def f_free(matrix, forbidden):
    assert not matrix.free_symbols.intersection(forbidden), "F leaked into A2"


def ring_product(left, right, m):
    a, b = left
    c, d = right
    return (s.expand(a*c+b*d), s.expand(a*d+b*c+m*b*d))


def rank_two_check(m, forbidden, mutate=False):
    # Ring associativity is checked, not used to assert categorifiability.
    simples = [(1, 0), (0, 1)]
    for a, b, c in itertools.product(simples, repeat=3):
        assert ring_product(ring_product(a, b, m), c, m) == \
            ring_product(a, ring_product(b, c, m), m)
    assert ring_product((1, 1), (1, 1), m) == (2, m+2)
    sizes = [2, m+2]
    offsets = [0, 2]
    labels = [(block, i, j) for block, n in enumerate(sizes)
              for j in range(n) for i in range(n)]
    index = {label: a for a, label in enumerate(labels)}
    dimension = len(labels)
    c = s.Matrix(s.symbols(f"c{m}_0:{dimension}"))
    b = s.Matrix(s.symbols(f"b{m}_0:{dimension}"))

    def matrix(coordinates):
        result = s.zeros(sum(sizes))
        for a, (block, i, j) in enumerate(labels):
            result[offsets[block]+i, offsets[block]+j] = coordinates[a]
        return result

    def coordinates(result):
        return s.Matrix([result[offsets[block]+i, offsets[block]+j]
                         for block, i, j in labels])

    h, fixed_b = matrix(c), matrix(b)
    commutator = fixed_b*h-h*fixed_b
    direct_ad = coordinates(commutator).jacobian(c)
    kron_ad = s.diag(*[s.kronecker_product(s.eye(n), fixed_b[o:o+n, o:o+n])
                       - s.kronecker_product(fixed_b[o:o+n, o:o+n].T, s.eye(n))
                       for n, o in zip(sizes, offsets)])
    # Independently enumerate M^gamma_(alpha beta) from Eij Ekl=delta_jk Eil.
    constants_ad = s.zeros(dimension)
    product_count = 0
    for a, (u, i, j) in enumerate(labels):
        for beta, (v, k, ell) in enumerate(labels):
            if u == v and j == k:
                gamma = index[(u, i, ell)]
                constants_ad[gamma, beta] += b[a]
                constants_ad[gamma, a] -= b[beta]
                product_count += 1
    check_zero(direct_ad-kron_ad, "Kronecker commutator convention mismatch")
    check_zero(direct_ad-constants_ad, "matrix-unit structure constants mismatch")

    t, q = s.symbols("t q", real=True)
    tile = s.eye(sum(sizes))+t*h+t**2*h*h/2
    same_cut = s.diff(tile, t)-fixed_b*tile+tile*fixed_b
    constant = same_cut.subs(t, 0)
    linear = same_cut.applyfunc(lambda e: s.expand(e).coeff(t, 1))
    check_zero(constant-h, "single-tile constant coefficient is not h")
    check_zero(linear-(h*h-commutator), "single-tile first coefficient wrong")
    assert coordinates(constant) == c, "R=O(t^2) failed to force all c=0"

    # Arbitrary fixed linear L:A2->A2; its coefficients and B are independent c.
    linear_map = s.Matrix(dimension, dimension,
                          lambda i, j: s.Symbol(f"L{m}_{i}_{j}"))
    dh = matrix(linear_map*c)
    hq = h+q*dh
    metric_tile = s.eye(sum(sizes))+t*hq+t**2*hq*hq/2
    metric_r = (s.diff(metric_tile, q)-fixed_b*metric_tile
                +metric_tile*fixed_b).subs(q, 0)
    metric_linear = coordinates(metric_r.applyfunc(
        lambda e: s.expand(e).coeff(t, 1)))
    check_zero(metric_r.subs(t, 0), "metric R0 must vanish on the same cut")
    coefficient_map = linear_map-constants_ad
    if mutate:
        coefficient_map[0, 0] += next(iter(forbidden))
    f_free(coefficient_map, forbidden)
    check_zero(metric_linear-coefficient_map*c, "metric Ward coefficient mismatch")
    # The independent F parameter must be detected if injected by a regression.
    poisoned = coefficient_map.copy()
    poisoned[0, 0] += next(iter(forbidden))
    try:
        f_free(poisoned, forbidden)
    except AssertionError as error:
        print(f"RED OBSERVED m={m}: injected F coefficient rejected: {error}")
    else:
        raise AssertionError("mutation was not detected")
    print(f"PASS m={m}: blocks={sizes}, dim(A2)={dimension}, "
          f"nonzero matrix-unit products={product_count}; "
          "R0=h; R1=h^2-[B,h]; metric coefficient=L-ad_B; no F")


def pointed_associator_check():
    a, b = s.symbols("a b", real=True)
    # Basis 00,01,10,11: independent cup-pair and hopping matrix units.
    k = s.Matrix([[0, 0, 0, a], [0, 0, b, 0],
                  [0, b, 0, 0], [a, 0, 0, 0]])
    charge2 = s.diag(1, -1, -1, 1)
    check_zero(k.H-k, "pointed tile is not self-adjoint")
    check_zero(k*charge2-charge2*k, "pointed tile changes total charge")
    words = list(itertools.product((0, 1), repeat=3))
    charge3 = s.diag(*[(-1)**sum(w) for w in words])
    k12 = s.kronecker_product(k, s.eye(2))
    right_tile = s.kronecker_product(s.eye(2), k)
    currents = {}
    for zeta in (1, -1):
        def omega(x, y, z):
            return zeta if (x, y, z) == (1, 1, 1) else 1

        for x, y, z, w in itertools.product((0, 1), repeat=4):
            assert omega(y, z, w)*omega(x, y ^ z, w)*omega(x, y, z) == \
                omega(x ^ y, z, w)*omega(x, y, z ^ w), "pentagon/cocycle fails"
        for x, y in itertools.product((0, 1), repeat=2):
            assert omega(0, x, y) == omega(x, 0, y) == omega(x, y, 0) == 1
        f3 = s.diag(*[omega(*word) for word in words])
        check_zero(f3.H*f3-s.eye(8), "pointed associator is not unitary")
        k23 = f3.H*right_tile*f3
        check_zero(k23.H-k23, "neighbor placement lost self-adjointness")
        check_zero(k23*charge3-charge3*k23, "neighbor placement changes charge")
        current = s.I*(k12*k23-k23*k12)
        check_zero(current.H-current, "current is not self-adjoint")
        currents[zeta] = current
    delta = currents[-1]-currents[1]
    expected = s.zeros(8)
    expected[1, 4], expected[4, 1] = -2*s.I*a**2, 2*s.I*a**2
    expected[2, 7], expected[7, 2] = -2*s.I*a*b, 2*s.I*a*b
    check_zero(delta-expected, "associator-sensitive current changed")
    assert delta.subs({a: 1, b: 1}) != s.zeros(8)
    # End2 and all two-site products have no zeta: the very same k is used.
    check_zero(k*k-s.diag(a*a, b*b, b*b, a*a), "two-site algebra changed")
    print("PASS pointed m=0: omega=+/-1 normalized; all 16 cocycle identities "
          "per sign; unitary F3; full O^3 basis; charge and dagger preserved")
    print("PASS J(-)-J(+): (001,100)=-2*i*a^2, "
          "(010,111)=-2*i*a*b, conjugate entries; same two-site k/algebra")
    # Symbolic pointed F3 lives over R[zeta]/(zeta^2-1), zeta real.
    zeta = s.Symbol("zeta", real=True)
    reduce = lambda e: s.rem(s.expand(e), zeta*zeta-1, zeta)
    symbolic_omega = lambda x, y, z: zeta if (x, y, z) == (1, 1, 1) else 1
    for x, y, z, w in itertools.product((0, 1), repeat=4):
        assert reduce(symbolic_omega(y, z, w)*symbolic_omega(x, y ^ z, w)
                      * symbolic_omega(x, y, z)-symbolic_omega(x ^ y, z, w)
                      * symbolic_omega(x, y, z ^ w)) == 0
    symbolic_f3 = s.diag(*[symbolic_omega(*word) for word in words])
    check_zero((symbolic_f3.H*symbolic_f3-s.eye(8)).applyfunc(reduce),
               "symbolic pointed unitarity modulo zeta^2-1 failed")
    symbolic_k23 = symbolic_f3.H*right_tile*symbolic_f3
    symbolic_j = (s.I*(k12*symbolic_k23-symbolic_k23*k12)).applyfunc(reduce)
    for sign in (1, -1):
        check_zero(symbolic_j.subs(zeta, sign)-currents[sign],
                   "symbolic pointed current specialization failed")
    assert s.expand(symbolic_j[1, 4]-s.I*(a*a*zeta-b*b)) == 0
    print("PASS symbolic pointed F3: real zeta, zeta^2=1; cocycle and unitarity "
          "modulo relation; J[001,100]=i*(a^2*zeta-b^2); +/- specializations")
    # At zeta=+1 the occupation presentation is an ordinary tensor product.
    # Traceless X,Z,Y kills every term missing at least one of the three sites.
    pauli_x, pauli_z = s.Matrix([[0, 1], [1, 0]]), s.diag(1, -1)
    pauli_y = s.Matrix([[0, -s.I], [s.I, 0]])
    support_witness = s.kronecker_product(pauli_x, pauli_z, pauli_y)
    support_coefficient = s.expand(s.trace(support_witness*currents[1])/8)
    assert support_coefficient == (a*a-b*b)/2
    assert all(s.trace(p) == 0 for p in (pauli_x, pauli_z, pauli_y))
    print("PASS zeta=+1: Tr((X tensor Z tensor Y)J)/8=(a^2-b^2)/2; "
          "genuine three-site support when a^2!=b^2")
    print("Boundary: no criticality, Ward solution, KS convergence or CFT fidelity")


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--mutate-f", action="store_true",
                        help="inject F into two-site coefficient: must fail")
    args = parser.parse_args()
    started = time.perf_counter()
    u = s.Symbol("u_F", real=True)
    placeholder = s.Matrix([[1-u*u, 2*u], [-2*u, 1-u*u]])/(1+u*u)
    check_zero((placeholder.T*placeholder-s.eye(2)).applyfunc(s.cancel),
               "formal independent 2x2 matrix is not orthogonal")
    print(f"SymPy {s.__version__}; exact arithmetic; no numeric tolerance")
    print("ASSUMPTIONS: formal rank-two rings only; actual category needed for "
          "categorification; generic h,B,L independent; fixed same-cut B")
    print("Independent orthogonal 2x2 placeholder is not categorical F-data")
    formal_m = s.Symbol("m", integer=True, nonnegative=True)
    for a, b, c in itertools.product(((1, 0), (0, 1)), repeat=3):
        assert ring_product(ring_product(a, b, formal_m), c, formal_m) == \
            ring_product(a, ring_product(b, c, formal_m), formal_m)
    assert ring_product((1, 1), (1, 1), formal_m) == (2, formal_m+2)
    print("PASS symbolic m>=0 integer: ring associativity; O^2=(2,m+2)")
    for m in (0, 1, 2):
        rank_two_check(m, {u}, args.mutate_f)
    pointed_associator_check()
    print(f"ALL CHECKS PASS; elapsed_seconds={time.perf_counter()-started:.3f}")


if __name__ == "__main__":
    main()
