"""Independent exact check of F6-C1/C3; no imports from the author's check.

Scoped conventions (review only): grades Z/3, unit 0, O=0+1+2; basis words
are left associated. Scalars are powers of zeta_9, stored as exponents mod 9;
dagger negates the exponent. No floating tolerance or dimension truncation.
Associator ((a b) c)->(a (b c)) is omega(a,b,c). A normalized 2-cochain
changes omega by d beta, and changes the crossing by beta(b,a)/beta(a,b).
These are finite instances, not assumptions on the general theorem.

Sources: references/text/PenneysUnitaryFusionCategories.md:277-288,319-338,
394-398; report/sections/90_local_unital_lift.tex:69-77,110-141;
../NOTE.md:533-558,590-634. The cocycle and gauge formulas below are checked
exhaustively against the defining pentagon/H equations before being used.
Run: python3 -I <this file> [--mutation dagger|extraction]
"""
import argparse
from itertools import product

Q, MOD = 3, 9


def words(n):
    return list(product(range(Q), repeat=n))


def beta(a, b, gauge):
    return {(1, 1): 3, (1, 2): 1, (2, 1): 2, (2, 2): 4}.get((a, b), 0) * gauge


def omega(a, b, c, gauge):
    coboundary = (beta(b, c, gauge) + beta(a, (b+c) % Q, gauge)
                  - beta((a+b) % Q, c, gauge) - beta(a, b, gauge))
    return (3*a*((b+c)//Q) + coboundary) % MOD


def crossing(a, b, gauge):
    return (-a*b + beta(b, a, gauge) - beta(a, b, gauge)) % MOD


def adjacent(word, k, gauge):
    """Reassociate to expose sites k,k+1, cross, then reassociate back."""
    s, a, b = sum(word[:k]) % Q, word[k], word[k+1]
    exponent = (omega(s, a, b, gauge) + crossing(a, b, gauge)
                - omega(s, b, a, gauge)) % MOD
    out = word[:k] + (b, a) + word[k+2:]
    return out, exponent


def shuffle(word, length, gauge):
    """Bubble each named new strand left; no closed phase-sum formula."""
    labels = [('old', k) for k in range(length)] + [('new', k) for k in range(length)]
    exponent = 0
    for k in range(length):
        pos, target = labels.index(('new', k)), 2*k+1
        while pos > target:
            word, phase = adjacent(word, pos-1, gauge)
            exponent = (exponent + phase) % MOD
            labels[pos-1], labels[pos] = labels[pos], labels[pos-1]
            pos -= 1
    return word, exponent


def alpha(unit, length, gauge, mutation):
    """Conjugate a categorical matrix unit by the independently built shuffle."""
    out, inp = unit
    assert len(out) == len(inp) == length and (sum(out)-sum(inp)) % Q == 0
    result = {}
    for anc in words(length):
        out_fine, po = shuffle(out+anc, length, gauge)
        in_fine, pi = shuffle(inp+anc, length, gauge)
        phase = po + pi if mutation == 'dagger' else po - pi
        result[out_fine, in_fine] = phase % MOD
    return result


def extend(operator, count):
    return {(out+tail, inp+tail): phase
            for (out, inp), phase in operator.items() for tail in words(count)}


def check(mutation):
    checked_units = 0
    for gauge in (0, 1):
        for a, b, c, d in product(range(Q), repeat=4):
            lhs = omega(b,c,d,gauge)+omega(a,(b+c)%Q,d,gauge)+omega(a,b,c,gauge)
            rhs = omega((a+b)%Q,c,d,gauge)+omega(a,b,(c+d)%Q,gauge)
            assert (lhs-rhs) % MOD == 0, ('pentagon', gauge, a,b,c,d)
        for a, c, b in product(range(Q), repeat=3):
            rhs = (omega(a,c,b,gauge)-omega(a,b,c,gauge)+omega(b,a,c,gauge)
                   +crossing(a,b,gauge)+crossing(c,b,gauge))
            assert (crossing((a+c)%Q,b,gauge)-rhs) % MOD == 0, 'H tensor identity'
            if 0 in (a,c,b):
                assert omega(a,c,b,gauge) == 0, 'unit normalization'
        assert crossing(0,1,gauge) == crossing(1,0,gauge) == 0, 'point/naturality'
        print(f'PASS gauge={gauge}: 81 pentagons, 27 H equations, unit/point identities', flush=True)

        # Equation (8) as an equality of whole shuffle morphisms on all 3^6 words.
        for word in words(6):
            left_word, left_phase = shuffle(word, 3, gauge)
            right_word, right_phase = word, 0
            # First move old_3 across new_1,new_2; then B_2 on the first four sites.
            for k in (2, 3):
                right_word, phase = adjacent(right_word, k, gauge)
                right_phase += phase
            first, phase = shuffle(right_word[:4], 2, gauge)
            right_word = first + right_word[4:]
            assert left_word == right_word and (left_phase-right_phase-phase) % MOD == 0, 'shuffle factorization'
        print(f'PASS gauge={gauge}: equation (8) on all 729 six-site words', flush=True)

        for out, inp in product(words(2), repeat=2):
            if (sum(out)-sum(inp)) % Q:
                continue
            unit = out, inp
            small = alpha(unit, 2, gauge, mutation)
            if out == inp:
                assert all(phase == 0 for phase in small.values()), 'dagger: diagonal projections acquire phases'
            big = {}
            for old_last in range(Q):
                big.update(alpha((out+(old_last,),inp+(old_last,)),3,gauge,mutation))
            assert big == extend(small, 2), ('trailing square (7)',gauge,unit)
            checked_units += 1

        # h=rl^dagger, with its vacuum component retained. i,j have unit phases
        # because only grade-zero factors are inserted in these named positions.
        hop = {}
        for a in range(Q):
            hop.update(alpha(((0,a),(a,0)),2,gauge,mutation))
        for inp, out in product(words(2), repeat=2):
            value = hop.get(((0,)+out+(0,),inp+(0,0)))
            expected = crossing(*inp,gauge) if out == inp[::-1] else None
            if mutation == 'extraction' and expected is not None:
                expected = -expected % MOD
            assert value == expected, ('compression (10)',gauge,inp,out,value,expected)
        print(f'PASS gauge={gauge}: equations (7),(10) on all 27 A2 matrix units / 81 compression entries', flush=True)

    assert checked_units == 54, 'exhaustive matrix-unit count'
    # This witness prevents the nontrivial gauge from being a cosmetic test.
    assert any(omega(s,a,b,1) != omega(s,b,a,1) for s,a,b in product(range(Q),repeat=3))
    assert crossing(1,1,0) not in (0, MOD//2), 'the witness must have a non-real phase'
    print('GREEN: complex-phase, nontrivial-associator-gauge check; 54 matrix units; no infinite-limit inference')


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('--mutation', choices=('dagger', 'extraction'))
    check(parser.parse_args().mutation)
