#!/usr/bin/env python3
"""Exact sparse calibration of alternative-ancilla dihedral dyadic lifts.

Run: python3 -B checks/dihedral_lift.py [--mutate-transport|--mutate-point]
No floating arithmetic, numerical tolerance, network, or third-party modules.
Sources: references/text/EtingofNikshychOstrikFusionCategories.md:45-49
  (Vec_G grades, tensor rule, associator); references/text/
  PenneysUnitaryFusionCategories.md:319-321 (unitary graded Hilbert category).
Construction/proof interface: report/sections/90_local_unital_lift.tex:89-105
  (heterogeneous one-gap proof); report/sections/76_corner_to_wilson_bridge.tex:
  123-138 (representation multiplicities). The general all-L proof is in
  the accompanying NOTE.md; these finite checks only calibrate that proof.
Conventions: G=(Z/m) semidirect Z/2, (n,e)(q,d)=(n+(-1)^e q,e+d).
  O=(1,a,b,r), a=(0,1), b=(-1,1), r=(1,0)=ab.
  K=(E0,E1,R,Rm), grades=(1,1,r,r^-1), point E0; O point 1.
  Matrix units E_(g,h) send word h to word g; sparse dictionaries map
  input fine words to output fine words. Products act right first.
"""
import argparse
from collections import Counter, defaultdict
from itertools import product
import sys


def require(condition, context):
    if not condition:
        raise AssertionError(context)


def compose(left, right):
    return {x: left[y] for x, y in right.items() if y in left}


def calibrate(m, args, totals):
    unit = (0, 0)
    group = tuple(product(range(m), range(2)))

    def mul(g, h):
        return ((g[0] + (-1) ** g[1] * h[0]) % m, (g[1] + h[1]) % 2)

    o = (unit, (0, 1), ((m - 1) % m, 1), (1, 0))
    kg = (unit, unit, (1, 0), (m - 1, 0))
    # A grade-preserving basis bijection valid even in infinite dihedral G.
    u = {(g, 0): (g, 0) for g in range(4)}
    u.update({(2, 2): (2, 3), (0, 3): (2, 1), (1, 2): (0, 2),
              (2, 1): (1, 3), (0, 1): (1, 1), (3, 3): (2, 2),
              (1, 1): (0, 1), (2, 3): (3, 2), (0, 2): (0, 3),
              (3, 1): (1, 2), (1, 3): (3, 1), (3, 2): (3, 3)})
    if args.mutate_point:
        for g in range(4):
            u[g, 0], u[g, 1] = u[g, 1], u[g, 0]
    require(len(set(u.values())) == 16, f"m={m}: u not unitary permutation")
    for (g, h), (x, y) in u.items():
        require(mul(o[g], kg[h]) == mul(o[x], o[y]), f"m={m}: u grade")
        totals['u_entries'] += 1
    for g in range(4):
        require(u[g, 0] == (g, 0), f"m={m}: exact V fails at u point g={g}")

    def sigma(g, h):
        return 5 - h if g[1] and h >= 2 else h

    def convolution(left, right):
        result = Counter()
        for g, n in left.items():
            for h, q in right.items():
                result[mul(g, h)] += n * q
        return result

    s, central_k = Counter(o), Counter(kg)
    require(convolution(s, s) == convolution(s, central_k), "O K != O^2")
    for g in group:
        singleton = Counter({g: 1})
        require(convolution(central_k, singleton) == convolution(singleton, central_k),
                "K class not central")
    power = Counter({unit: 1})
    generator = Counter({o[1]: 1})
    for n in range(1, 7):
        power = convolution(power, s)
        require(convolution(power, generator) != convolution(generator, power),
                f"m={m}: noncentral power calibration n={n}")
        totals['noncentral_powers'] += 1

    for g, h in product(group, range(4)):
        require(mul(g, kg[h]) == mul(kg[sigma(g, h)], g), "H grade")
        require(sigma(unit, h) == h, "H unit")
        require(sigma(g, 0) == 0, "H point")
        for f in group:
            require(sigma(g, sigma(f, h)) == sigma(mul(g, f), h), "H tensor")
            totals['H_tensor_instances'] += 1
    # Naturality on all matrix units of two copies of each simple.
    for g in group:
        crossing = {(copy, h): (sigma(g, h), copy)
                    for copy, h in product(range(2), range(4))}
        require(len(set(crossing.values())) == 8, "H unitary permutation")
        for source, target in product(range(2), repeat=2):
            before = {(source, h): (target, h) for h in range(4)}
            after = {(h, source): (h, target) for h in range(4)}
            require(compose(after, crossing) == compose(crossing, before),
                    f"H multiplicity naturality {source}->{target}")
            totals['H_naturality_units'] += 1

    def grade(word):
        g = unit
        for i in word:
            g = mul(g, o[i])
        return g

    def tensor_grade(word, ancillary):
        g = grade(word)
        for h in ancillary:
            g = mul(g, kg[h])
        return g

    tables, words = {}, {}
    for length in range(1, 4):
        w = tuple(product(range(4), repeat=length))
        words[length] = w
        table = {}
        for old, ancillary in product(w, repeat=2):
            fine = []
            for i, (g, h) in enumerate(zip(old, ancillary)):
                suffix = grade(old[i + 1:])
                transported = h if args.mutate_transport else sigma(suffix, h)
                fine.extend(u[g, transported])
            fine = tuple(fine)
            require(grade(fine) == tensor_grade(old, ancillary),
                    f"m={m},L={length}: T grade failed old={old},K={ancillary}")
            table[old, ancillary] = fine
            totals['T_entries'] += 1
        require(len(set(table.values())) == 4 ** (2 * length), "T not unitary")
        for old in w:
            vacuum = tuple(x for g in old for x in (g, 0))
            require(table[old, (0,) * length] == vacuum, "T exact V")
            totals['V_words'] += 1
        tables[length] = table

    reps = {}

    def rep(length, g, h):
        key = (length, g, h)
        if key not in reps:
            table = tables[length]
            reps[key] = {table[h, ancillary]: table[g, ancillary]
                         for ancillary in words[length]}
        return reps[key]

    for length in range(1, 4):
        w, table = words[length], tables[length]
        blocks = defaultdict(list)
        for old in w:
            blocks[grade(old)].append(old)
        identity = {}
        for block in blocks.values():
            for g, h in product(block, repeat=2):
                matrix = rep(length, g, h)
                require({y: x for x, y in matrix.items()} == rep(length, h, g),
                        "dagger matrix unit")
                require(len(matrix) == 4 ** length, "injective matrix unit")
                totals['dagger_units'] += 1
                if g == h:
                    identity.update(matrix)
                for v in block:
                    require(compose(matrix, rep(length, h, v)) == rep(length, g, v),
                            "composable matrix-unit product")
                    totals['products'] += 1
                if len(block) > 1:
                    x = block[(block.index(h) + 1) % len(block)]
                    require(not compose(matrix, rep(length, x, g)), "zero product")
                    totals['zero_products'] += 1
        require(identity == {fine: fine for fine in table.values()}, "unitality")
        totals['unital_lengths'] += 1

        for j in range(length):
            for k in range(j + 1, length + 1):
                size = k - j
                local_blocks = defaultdict(list)
                for local in words[size]:
                    local_blocks[grade(local)].append(local)
                prefixes = tuple(product(range(4), repeat=j))
                suffixes = tuple(product(range(4), repeat=length - k))
                for block in local_blocks.values():
                    for g, h in product(block, repeat=2):
                        expected = rep(size, g, h)
                        actual_size = 0
                        for before, after in product(prefixes, suffixes):
                            actual = rep(length, before + g + after, before + h + after)
                            actual_size += len(actual)
                            for x, y in actual.items():
                                require(x[:2*j] == y[:2*j] and x[2*k:] == y[2*k:],
                                        f"m={m},L={length}: interval exterior changed")
                                require(expected.get(x[2*j:2*k]) == y[2*j:2*k],
                                        f"m={m},L={length}: interval tensor membership")
                                totals['interval_entries'] += 1
                        require(actual_size == len(expected) * 4 ** (2 * (length - size)),
                                "interval identity multiplicity")
                        totals['interval_units'] += 1
        print(f"m={m}, L={length}: exact unital/dagger/product/V and all intervals PASS",
              flush=True)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--mutate-transport', action='store_true')
    parser.add_argument('--mutate-point', action='store_true')
    args = parser.parse_args()
    print('COMMAND: python3 -B ' + ' '.join(sys.argv), flush=True)
    print('BUDGET: m=3,4; L=1,2,3; all homogeneous interval matrix units; exact integers',
          flush=True)
    totals = Counter()
    for m in (3, 4):
        calibrate(m, args, totals)
    print('TOTALS: ' + ', '.join(f'{key}={value}' for key, value in sorted(totals.items())),
          flush=True)
    print('HEADLINE: alternative-ancilla dihedral lifts pass exact finite invariants; '
          'all-L proof remains algebraic in NOTE.md.', flush=True)


if __name__ == '__main__':
    main()
