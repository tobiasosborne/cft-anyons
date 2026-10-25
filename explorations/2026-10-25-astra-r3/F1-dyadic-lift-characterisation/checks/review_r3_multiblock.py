#!/usr/bin/env python3
"""Independent b=3 audit with multiple blocks, nontrivial transport and tails.

Run from repo root: python3 -I <this file> [--mutate-tail-transport].
Sources: NOTE.md F1.1a/b; CA-90:69-105; Penneys:20,277-288,319-321.
Local review conventions (no canonical-file edits authorized): Vec_(Z/2),
O=0+1, vacuum bit 0, untwisted associator, left-to-right bit words.
P=O^3 has a signed involution rho(1) on its homogeneous basis, fixing
000 but mixing occupation numbers. No code is imported from the author.
Matrix coefficients are exact integers. Tests are finite calibrations.
"""
import argparse
from collections import defaultdict
from itertools import product

parser = argparse.ArgumentParser()
parser.add_argument("--mutate-tail-transport", action="store_true")
args = parser.parse_args()
BLOCK = 3


def words(n):
    return tuple(product((0, 1), repeat=n))


def parity(word):
    return sum(word) % 2


def number(word):
    value = 0
    for bit in word:
        value = 2 * value + bit
    return value


block_words = words(BLOCK)
# Each exchanged pair has the same parity; 010 <-> 111 changes occupancy.
permutation = (0, 4, 7, 5, 1, 3, 6, 2)
phases = (1, 1, -1, 1, 1, 1, 1, -1)
for index, word in enumerate(block_words):
    target = permutation[index]
    assert permutation[target] == index
    assert phases[index] * phases[target] == 1
    assert parity(word) == parity(block_words[target])
assert permutation[0] == 0 and phases[0] == 1


def circuit(old, new):
    """Slide each actual new P block left one old site at a time."""
    length = len(old)
    state = list(old + new)
    sign = 1
    m, q = divmod(length, BLOCK)
    for cell in range(m):
        start = length + cell * BLOCK
        destination = (2 * cell + 1) * BLOCK
        first_crossing = True
        while start > destination:
            old_bit = state[start - 1]
            ancilla = tuple(state[start:start + BLOCK])
            # Mutant skips transport across the last old site of a tail,
            # but retains the geometric move. All other gates are unchanged.
            skip = args.mutate_tail_transport and q and first_crossing
            if old_bit and not skip:
                label = number(ancilla)
                ancilla = block_words[permutation[label]]
                sign *= phases[label]
            state[start - 1:start + BLOCK] = list(ancilla) + [old_bit]
            start -= 1
            first_crossing = False
    # Stable adjacent vacancy-swap circuit, including every incomplete cell.
    for offset, size in [(2 * i * BLOCK, BLOCK) for i in range(m)] + (
            [(2 * m * BLOCK, q)] if q else []):
        for i in range(size):
            position = offset + size + i
            target = offset + 2 * i + 1
            while position > target:
                a, b = state[position - 1:position + 1]
                if (a == 0) != (b == 0):
                    state[position - 1:position + 1] = [b, a]
                position -= 1
    return tuple(state), sign


total_units = total_entries = 0
for length in range(1, 8):
    coarse = words(length)
    images = {(old, new): circuit(old, new)
              for old, new in product(coarse, repeat=2)}
    assert len({out for out, _ in images.values()}) == 2 ** (2 * length)
    for (old, new), (out, sign) in images.items():
        assert parity(old + new) == parity(out) and sign in (-1, 1)
    for old in coarse:
        out, sign = images[old, (0,) * length]
        expected = tuple(bit for value in old for bit in (value, 0))
        assert (out, sign) == (expected, 1), ("exact insertion", length, old)
    count = 0
    for start in range(length):
        for end in range(start + 1, length + 1):
            size = end - start
            if length > 4 and size > 3:
                continue  # Explicit cutoff: all <=3-site intervals for L=5..7.
            left = 2 * BLOCK * (start // BLOCK)
            right = min(2 * length, 2 * BLOCK * ((end - 1) // BLOCK + 1))
            assert left >= max(0, 2 * start - (2 * BLOCK - 1))
            assert right <= min(2 * length, 2 * end - 1 + (2 * BLOCK - 1))
            outside_count = 2 ** (2 * length - (right - left))
            for row, col in product(words(size), repeat=2):
                if parity(row) != parity(col):
                    continue
                entries = defaultdict(dict)
                for prefix, suffix, ancillary in product(
                        words(start), words(length - end), coarse):
                    out_row, row_sign = images[prefix + row + suffix, ancillary]
                    out_col, col_sign = images[prefix + col + suffix, ancillary]
                    exterior = out_row[:left] + out_row[right:]
                    assert exterior == out_col[:left] + out_col[right:], (
                        "interval exterior changed", length, start, end, row, col)
                    local_row, local_col = out_row[left:right], out_col[left:right]
                    assert parity(local_row) == parity(local_col)
                    contexts = entries[local_row, local_col]
                    assert exterior not in contexts, "duplicate matrix entry"
                    contexts[exterior] = row_sign * col_sign
                    total_entries += 1
                for contexts in entries.values():
                    assert len(contexts) == outside_count, (
                        "missing exterior contexts", length, start, end)
                    assert len(set(contexts.values())) == 1, (
                        "exterior-dependent coefficient", length, start, end)
                count += 1
    total_units += count
    print(f"L={length}, blocks/tail={divmod(length, BLOCK)}: signed categorical "
          f"unitarity, exact V and {count} interval matrix units PASS", flush=True)
print(f"PASS: b=3; {total_units} interval units; {total_entries} matrix entries; "
      "multiple blocks, tails 0/1/2, and L<b; no all-L inference", flush=True)
