#!/usr/bin/env python3
"""Exact finite calibration of AUDIT-BLOCKING.md; standard-library only.

Source: ENO fusion-category notes :45; Penneys UFC :319-321; CA-90 :89-105.
Convention: permutations compose p(q(i)); O=(1,c,c^2,g), eta=letter 0.
Commands: python3 checks/check_blocked_lift.py [--omit-vacancy-shuffle]
The mutation must fail; neither this finite check nor its cutoff proves B2.
"""
import argparse
import itertools
from collections import Counter, defaultdict


GROUP = tuple(itertools.permutations(range(3)))
UNIT = (0, 1, 2)
CYCLE = (1, 2, 0)
TRANS = (1, 0, 2)


def mul(p, q):
    return tuple(p[q[i]] for i in range(3))


def inv(p):
    return tuple(p.index(i) for i in range(3))


ALPHABET = (UNIT, CYCLE, mul(CYCLE, CYCLE), TRANS)


def words(n):
    return tuple(itertools.product(range(4), repeat=n))


def grade(word):
    result = UNIT
    for letter in word:
        result = mul(result, ALPHABET[letter])
    return result


PAIR_BASES = {h: tuple(w for w in words(2) if grade(w) == h) for h in GROUP}
PAIR_INDEX = {w: i for basis in PAIR_BASES.values() for i, w in enumerate(basis)}


def rho(k, pair):
    h = grade(pair)
    return PAIR_BASES[mul(mul(k, h), inv(k))][PAIR_INDEX[pair]]


def blocked_permutation(old, ancilla, omit_shuffle):
    """Construct transport through the actual suffix, then disjoint cell U."""
    size = len(old)
    blocks, tail = divmod(size, 2)
    state = old
    for i in range(blocks):
        boundary = 2 * (2 * i + 1)
        prefix, suffix = state[:boundary], state[boundary:]
        new_pair = ancilla[2 * i:2 * i + 2]
        state = prefix + rho(grade(suffix), new_pair) + suffix
    state += ancilla[2 * blocks:]
    if not omit_shuffle:
        state = list(state)
        for i in range(blocks):
            left, right = 4 * i + 1, 4 * i + 2
            if (state[left] == 0) != (state[right] == 0):
                state[left], state[right] = state[right], state[left]
        state = tuple(state)
    assert len(state) == 2 * size and tail in (0, 1)
    return state


def image_unit(B, size, j, k, row, col):
    """alpha of an interval matrix unit, identities on coarse spectators."""
    entries = set()
    for left in words(j):
        for right in words(size - k):
            for ancillary in words(size):
                fine_row = B[left + row + right + ancillary]
                fine_col = B[left + col + right + ancillary]
                pair = (fine_row, fine_col)
                assert pair not in entries, "duplicate sparse matrix entry"
                entries.add(pair)
    return entries


def assert_membership(entries, size, lo, hi):
    """Exact tensor identity: all exterior contexts have equal coefficient."""
    counts = Counter()
    for row, col in entries:
        assert row[:lo] + row[hi:] == col[:lo] + col[hi:], "exterior changed"
        assert grade(row[lo:hi]) == grade(col[lo:hi]), "interior charge changed"
        counts[row[lo:hi], col[lo:hi]] += 1
    exterior_count = 4 ** (2 * size - hi + lo)
    assert counts and all(n == exterior_count for n in counts.values()), (
        "exterior-context coefficients differ", size, lo, hi, counts)


def sparse_product(left, right):
    by_row = defaultdict(list)
    for row, col in right:
        by_row[row].append(col)
    result = Counter()
    for row, middle in left:
        for col in by_row[middle]:
            result[row, col] += 1
    return dict(result)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--omit-vacancy-shuffle", action="store_true")
    args = parser.parse_args()
    assert tuple(len(PAIR_BASES[h]) for h in GROUP) == (4, 2, 2, 3, 3, 2)
    for k, l, pair in itertools.product(GROUP, GROUP, words(2)):
        assert rho(k, rho(l, pair)) == rho(mul(k, l), pair)
        assert grade(rho(k, pair)) == mul(mul(k, grade(pair)), inv(k))
        assert rho(k, (0, 0)) == (0, 0)
    assert all(len({rho(k, pair) for pair in words(2)}) == 16 for k in GROUP)
    print("PASS pointed P-action: exact conjugation grading and group law", flush=True)
    for size in (1, 2, 3):
        coarse = words(size)
        fine = words(2 * size)
        B = {w: blocked_permutation(w[:size], w[size:], args.omit_vacancy_shuffle)
             for w in fine}
        assert len(set(B.values())) == len(fine), "B is not a permutation"
        assert all(grade(w) == grade(B[w]) for w in fine), "B changes total charge"
        for old in coarse:
            expected = tuple(x for letter in old for x in (letter, 0))
            assert B[old + (0,) * size] == expected, (
                "exact dyadic V fails", size, old, B[old + (0,) * size], expected)
        unit_image = set().union(*(image_unit(B, size, 0, size, w, w) for w in coarse))
        assert unit_image == {(w, w) for w in fine}, "alpha is not unital"
        sectors = defaultdict(list)
        for w in coarse:
            sectors[grade(w)].append(w)
        products = 0
        for sector in sectors.values():
            u, v, w = sector[0], sector[len(sector) // 2], sector[-1]
            e_uv = image_unit(B, size, 0, size, u, v)
            e_vw = image_unit(B, size, 0, size, v, w)
            e_uw = image_unit(B, size, 0, size, u, w)
            assert sparse_product(e_uv, e_vw) == {p: 1 for p in e_uw}
            assert {(c, r) for r, c in e_uv} == image_unit(B, size, 0, size, v, u)
            products += 1
        checked = 0
        for j in range(size):
            for k in range(j + 1, size + 1):
                interval_words = words(k - j)
                lo, hi = 4 * (j // 2), min(2 * size, 4 * ((k - 1) // 2 + 1))
                target_lo, target_hi = max(0, 2 * j - 3), min(2 * size, 2 * k + 2)
                for row, col in itertools.product(interval_words, repeat=2):
                    if grade(row) != grade(col):
                        continue
                    entries = image_unit(B, size, j, k, row, col)
                    assert_membership(entries, size, lo, hi)
                    assert_membership(entries, size, target_lo, target_hi)
                    checked += 1
        print(f"PASS L={size}: {len(fine)}-point graded permutation; exact V; "
              f"unital, dagger, {products} products; {checked} local matrix units "
              "in cell support and r=3 support", flush=True)
    print("GREEN: all exact sparse checks passed; finite calibration only", flush=True)


if __name__ == "__main__":
    main()
