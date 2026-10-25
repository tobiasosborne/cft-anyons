"""Exact finite calibrations for NOTE.md; no numerical limit inference.

Sources: PenneysUnitaryFusionCategories.md:277-288,319-338,474-487;
ENO FusionCategories.txt:1459-1487; CA-90:69-77,110-141.
All matrices, cocycles and counterexamples are derived in NOTE.md.
Run from repository root; Python standard library only, no network.
"""
import argparse
from fractions import Fraction
from itertools import product


def words(n):
    return list(product((0, 1), repeat=n))


def mv(a, v):
    return [sum(x * y for x, y in zip(row, v)) for row in a]


def fusion_matrix(group, multiply):
    return [[sum(multiply(x, g) == y for g in group) for x in group]
            for y in group]


def omega(a, b, c):
    return (-1) ** (a * b * c)


def trailing(a):
    """Sparse operator a -> a tensor identity, binary site alphabet."""
    return {(out + (b,), inp + (b,)): value
            for (out, inp), value in a.items() for b in (0, 1)}


def alpha(a, length, sign):
    """Exact uniform CA-90 shuffle in the untwisted order-two category."""
    result = {}
    for (out, inp), value in a.items():
        assert len(out) == len(inp) == length
        assert (sum(out) - sum(inp)) % 2 == 0, "not a categorical morphism"
        for ancilla in words(length):
            phase = sign ** sum((out[j] + inp[j]) * ancilla[i]
                                for i in range(length) for j in range(i + 1, length))
            fine_out = tuple(v for pair in zip(out, ancilla) for v in pair)
            fine_in = tuple(v for pair in zip(inp, ancilla) for v in pair)
            result[fine_out, fine_in] = value * phase
    return result


def check(mutation):
    for a, b, c, d in product((0, 1), repeat=4):
        lhs = omega(b, c, d) * omega(a, (b + c) % 2, d) * omega(a, b, c)
        rhs = omega((a + b) % 2, c, d) * omega(a, b, (c + d) % 2)
        assert lhs == rhs, "pentagon"
    assert omega(1, 1, 1) == -1
    # For arbitrary normalized beta, its nonzero beta(1,1) cancels.
    for value in (-3, -1, 1, 2, 5):
        beta = {(0, 0): 1, (0, 1): 1, (1, 0): 1, (1, 1): value}
        boundary = Fraction(beta[1, 1] * beta[1, 0], beta[0, 1] * beta[1, 1])
        assert boundary == 1 and boundary != omega(1, 1, 1)
    print("PASS: all 16 cocycle pentagons; normalized coboundary obstruction")

    cyclic = list(range(4))
    klein = words(2)
    c_matrix = fusion_matrix(cyclic, lambda x, g: (x + g) % 4)
    k_matrix = fusion_matrix(klein, lambda x, g: tuple(a ^ b for a, b in zip(x, g)))
    assert c_matrix == k_matrix == [[1] * 4 for _ in range(4)]
    assert (1 + 1) % 4 != 0 and all(tuple(a ^ a for a in g) == (0, 0) for g in klein)
    print("PASS: distinct based group rings C4 and C2xC2 give identical J4")

    for q in range(2, 6):
        n = [[1] * q for _ in range(q)]
        multiplicity = [1] + [0] * (q - 1)
        for length in range(1, 7):
            multiplicity = mv(n, multiplicity)
            assert multiplicity == [q ** (length - 1)] * q
            denominator = q ** (length - (mutation == "trace"))
            weights = [Fraction(1, denominator)] * q
            trace_one = sum(m * w for m, w in zip(multiplicity, weights))
            assert trace_one == 1, f"trace normalization: q={q}, L={length}, got {trace_one}"
            assert Fraction(sum(multiplicity), q ** length) == 1
        for v in product(range(-1, 2), repeat=q):
            nv = mv(n, v)
            assert Fraction(sum(nv), q ** 2) == Fraction(sum(v), q)
            assert (nv == [0] * q) == (sum(v) == 0)
            assert all(x >= 0 for x in nv) == (sum(v) >= 0)
    print("PASS: regular-object multiplicities, trace units, quotient map/order identities q=2..5")

    n = [[0, 0, 1], [1, 0, 0], [0, 1, 0]]
    multiplicity = [1, 0, 0]
    for length in range(7):
        support = [i for i, value in enumerate(multiplicity) if value]
        if mutation == "support":
            support = list(range(3))
        assert len(support) == 1, "full stationary vertices are not the rooted support"
        assert multiplicity[support[0]] == 1
        multiplicity = mv(n, multiplicity)
    assert mv(n, mv(n, mv(n, [2, 3, 5]))) == [2, 3, 5]
    print("PASS: cyclic generator has rooted rank 1, while N^3=I on full rank 3")

    # h = (eta tensor 1)(1 tensor eta*) includes the vacuum-vacuum component.
    hop = {((0, a), (a, 0)): 1 for a in (0, 1)}
    for sign in (1, -1):
        actual_sign = 1 if mutation == "crossing" else sign
        image = alpha(hop, 2, actual_sign)
        for inp in words(2):
            for out in words(2):
                compressed = image.get(((0,) + out + (0,), inp + (0, 0)), 0)
                expected = sign ** (inp[0] * inp[1]) if out == inp[::-1] else 0
                assert compressed == expected, "marked alpha2 crossing extraction"
        for out in words(2):
            for inp in words(2):
                if (sum(out) - sum(inp)) % 2:
                    continue
                unit = {(out, inp): 1}
                assert alpha(trailing(unit), 3, sign) == trailing(trailing(alpha(unit, 2, sign)))
    print("PASS: exact marked crossing extraction and fixed-H square on all 8 A2 matrix units")

    plus = trailing(trailing(alpha(hop, 2, 1)))
    minus = alpha(trailing(hop), 3, -1)
    coordinate = ((0, 1, 1, 0, 0, 0), (1, 1, 0, 0, 0, 0))
    assert plus[coordinate] == 1 and minus[coordinate] == -1
    assert plus != minus
    print("PASS: mixed-H square fails with exact coefficients +1 versus -1")
    print("GREEN: 6 invariant groups; exact integer/Fraction arithmetic; no asymptotic claim")


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--mutation", choices=("trace", "support", "crossing"))
    check(parser.parse_args().mutation)
