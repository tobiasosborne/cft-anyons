#!/usr/bin/env python3
"""Independent exact matrix-unit audit of the b=2 construction, at L<=3.

Command: python3 -I review_block_exact.py [--mutate-shuffle]
Sources: ENO .md:45; Penneys .md:319-321; CA-90 .tex:59-77,89-105.
This is a finite calibration, not the all-category/all-L proof.
No dense matrices, floating point, Julia, network, or external packages.
"""

from argparse import ArgumentParser
from collections import Counter
from itertools import permutations, product

parser = ArgumentParser()
parser.add_argument("--mutate-shuffle", action="store_true")
args = parser.parse_args()

# Multiplication is function composition, right permutation first.
group = tuple(permutations(range(3)))
identity = tuple(range(3))


def mul(a, b):
    return tuple(a[b[i]] for i in range(3))


def inv(a):
    return tuple(a.index(i) for i in range(3))


g = (1, 0, 2)
assert mul(g, g) == identity
assert any(mul(g, h) != mul(h, g) for h in group)
# O=R+g, with basis 0 the specified point, and another g-vector last.
grades = (identity,) + tuple(h for h in group if h != identity) + (g,)
d = len(grades)
assert d == 7
point = 0


def degree(word):
    answer = identity
    for label in word:
        answer = mul(answer, grades[label])
    return answer


p_basis = {h: [] for h in group}
for pair in product(range(d), repeat=2):
    p_basis[degree(pair)].append(pair)
assert p_basis[identity][0] == (point, point)
assert len(p_basis[identity]) == 9
assert all(len(p_basis[h]) == 8 for h in group if h != identity)
p_index = {pair: (h, i) for h, pairs in p_basis.items()
           for i, pair in enumerate(pairs)}


def rho(k, pair):
    h, i = p_index[pair]
    return p_basis[mul(mul(k, h), inv(k))][i]


for k, ell, pair in product(group, group, p_index):
    assert rho(k, rho(ell, pair)) == rho(mul(k, ell), pair)
    assert rho(k, (point, point)) == (point, point)


def vacancy_swap(word, i):
    if (word[i] == point) != (word[i + 1] == point):
        word[i], word[i + 1] = word[i + 1], word[i]


def block_map(old, new):
    """Explicit gamma permutation followed by the independent S circuit."""
    length = len(old)
    m, q = divmod(length, 2)
    out = []
    for cell in range(m):
        end = 2 * cell + 2
        out.extend(old[end - 2:end])
        out.extend(rho(degree(old[end:]), new[end - 2:end]))
    if q:
        out.extend((old[-1], new[-1]))
    if not args.mutate_shuffle:
        for cell in range(m):
            vacancy_swap(out, 4 * cell + 1)
    return tuple(out)


def complement(word, left, right):
    return word[:left] + word[right:]


total_units = 0
total_entries = 0
for length in (1, 2, 3):
    words = tuple(product(range(d), repeat=length))
    images = {(old, new): block_map(old, new)
              for old, new in product(words, repeat=2)}
    assert len(set(images.values())) == d ** (2 * length), "not unitary"
    for (old, new), out in images.items():
        assert degree(old + new) == degree(out), "not a categorical morphism"
    for old in words:
        expected = tuple(x for label in old for x in (label, point))
        assert images[old, (point,) * length] == expected, (
            "exact dyadic point identity failed", length, old)

    for j in range(length):
        for k in range(j + 1, length + 1):
            n = k - j
            subwords = tuple(product(range(d), repeat=n))
            # Test the sharper complete-cell hull, not only the claimed r=3.
            left = 4 * (j // 2)
            right = min(4 * ((k - 1) // 2 + 1), 2 * length)
            assert left >= max(0, 2 * j - 3)
            assert right <= min(2 * length, 2 * k - 1 + 3)
            outside_count = d ** (2 * length - (right - left))
            contexts = tuple(product(product(range(d), repeat=j),
                                     product(range(d), repeat=length-k)))
            for source, target in product(subwords, repeat=2):
                if degree(source) != degree(target):
                    continue
                entries = Counter()
                for (prefix, suffix), ancilla in product(contexts, words):
                    fine_in = images[prefix + source + suffix, ancilla]
                    fine_out = images[prefix + target + suffix, ancilla]
                    assert complement(fine_in, left, right) == complement(
                        fine_out, left, right), ("outside action", length, j, k)
                    in_local = fine_in[left:right]
                    out_local = fine_out[left:right]
                    assert degree(in_local) == degree(out_local)
                    entries[in_local, out_local] += 1
                    total_entries += 1
                # I_outside tensor f: every local matrix entry must occur
                # exactly once in every outside basis context. This is
                # stronger than merely commuting with outside endomorphisms.
                assert entries and set(entries.values()) == {outside_count}, (
                    "interval membership failed", length, j, k, source, target)
                total_units += 1
    print(f"L={length}: exact categorical unitarity, V identity, and every "
          "interval matrix unit has complete-cell interval membership")

print(f"PASS: {total_units} interval matrix units; {total_entries} nonzero "
      "fine matrix entries; exact integers; O noncentral and O^2 central")
