"""Exact finite calibration of G6-B; standard library, no network.

Scoped conventions: additive cyclic grades, unit 0, canonical sorted site
basis. Endomorphisms are sparse matrix units (output,input); tensor words
are left associated, with trivial associator and ordinary flip transport.
Independent paths use direct interleaving versus adjacent bubble swaps.
The proof for every length is in NOTE.md G6-B; these are regression checks.
Sources: PenneysUnitaryFusionCategories.md:277-288,319-338; CA-90:110-141.
Run: python3 -I <this file> [--mutation grade|interval|dilation]
"""
import argparse
from collections import Counter
from itertools import product


def words(d, n):
    return list(product(range(d), repeat=n))


def charge(w, grades, q):
    return sum(grades[i] for i in w) % q


def matrix_units(d, n, grades, q):
    return [(u, v) for u in words(d, n) for v in words(d, n)
            if charge(u, grades, q) == charge(v, grades, q)]


def interleave(a, b):
    return tuple(x for pair in zip(a, b) for x in pair)


def bubble(a, b, mutation):
    w = list(a+b)
    labels = [('o', i) for i in range(len(a))]+[('n', i) for i in range(len(b))]
    for i in range(len(b)):
        pos = labels.index(('n', i))
        dest = 2*i if mutation == 'dilation' else 2*i+1
        while pos > dest:
            w[pos-1], w[pos] = w[pos], w[pos-1]
            labels[pos-1], labels[pos] = labels[pos], labels[pos-1]
            pos -= 1
    return tuple(w)


def phi(op, perm):
    return {(tuple(perm[x] for x in u), tuple(perm[x] for x in v))
            for u, v in op}


def interval(unit, d, length, start):
    u, v = unit
    return {(p+u+t, p+v+t) for p in words(d, start)
            for t in words(d, length-start-len(u))}


def main(mutation):
    for q, source, shift, max_old in [(2, (0, 0, 1), 1, 3),
                                      (4, (0, 1, 1, 2, 3), 1, 2)]:
        target = tuple(sorted((x+shift) % q for x in source))
        d = len(source)
        unused = set(range(d))
        perm = []
        for g in source:
            j = min(j for j in unused if target[j] == (g+shift) % q)
            unused.remove(j)
            perm.append(j)
        if mutation == 'grade':
            perm[0], perm[-1] = perm[-1], perm[0]
        assert sorted(perm) == list(range(d))
        counts = []
        for n in range(1, 5):
            units = matrix_units(d, n, source, q)
            target_units = set(matrix_units(d, n, target, q))
            assert phi(units, perm) == target_units, ('grade blocks', q, n)
            assert all(charge(tuple(perm[x] for x in w), target, q)
                       == (charge(w, source, q)+n*shift) % q
                       for w in words(d, n)), 'total-charge translation'
            counts.append(len(units))
        print(f'PASS C{q}: all matrix units through L=4; dimensions {counts}; U={perm}')

        # All local units, positions and enclosing intervals through four sites.
        count = 0
        for length in range(1, 5):
            for n in range(1, length+1):
                for start in range(length-n+1):
                    for unit in matrix_units(d, n, source, q):
                        left = phi(interval(unit, d, length, start), perm)
                        mapped = next(iter(phi({unit}, perm)))
                        where = (start+1) % (length-n+1) if mutation == 'interval' else start
                        right = interval(mapped, d, length, where)
                        assert left == right, ('interval intertwining', q, length, n, start)
                        count += 1
        print(f'PASS C{q}: {count} exact interval/trailing matrix-unit identities')

        count = 0
        for n in range(1, max_old+1):
            ancillas = words(d, n)
            for u, v in matrix_units(d, n, source, q):
                source_alpha = {(interleave(u, a), interleave(v, a)) for a in ancillas}
                pu, pv = tuple(perm[x] for x in u), tuple(perm[x] for x in v)
                target_alpha = {(bubble(pu, a, mutation), bubble(pv, a, mutation))
                                for a in ancillas}
                assert phi(source_alpha, perm) == target_alpha, ('dilation intertwining', q, n, u, v)
                count += 1
        print(f'PASS C{q}: {count} exact dilation identities; old L<= {max_old}, fine L<= {2*max_old}')

        # Charge-pair central projections are the joint relative commutant
        # of the two full one-site algebras in A_2 (proved in NOTE G6-A).
        pairs = {(x, y): {w for w in words(d, 2)
                         if (source[w[0]], source[w[1]]) == (x, y)}
                 for x in range(q) for y in range(q)}
        assert all(pairs.values()) and sum(map(len, pairs.values())) == d*d
        for (x, y), basis in pairs.items():
            translated = {tuple(perm[i] for i in w) for w in basis}
            expected = {w for w in words(d, 2)
                        if (target[w[0]], target[w[1]]) == ((x+shift) % q, (y+shift) % q)}
            assert translated == expected, 'relative-commutant charge-pair projections'
        print(f'PASS C{q}: all {q*q} joint-relative-commutant blocks translated exactly')

        eta = source.index(0)
        eta_prime = target.index(0)
        assert perm[eta] != eta_prime and target[perm[eta]] == shift
        for automorphism in range(q):
            if len({automorphism*x % q for x in range(q)}) != q:
                continue
            assert Counter(automorphism*x % q for x in source) != Counter(target), 'object inequivalence'
        assert Counter(source)[0] == (2 if q == 2 else 1)
        assert Counter(target)[0] == 1
        print(f'PASS C{q}: point corner NOT preserved; all group automorphisms excluded; connected={q==4}')
    print('GREEN: exact all-interval AND dilation checks for the two counterexample instances')


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('--mutation', choices=('grade', 'interval', 'dilation'))
    main(parser.parse_args().mutation)
