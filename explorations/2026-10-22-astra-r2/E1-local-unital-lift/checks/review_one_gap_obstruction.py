"""REVIEWER check (Opus proof-checker, 2026-10-22), not part of the E1 note.
Run from repo root:  python3 -I <this path>      (pure Python, integer arithmetic, < 1 s)

Reviewer Proposition R-1 (REVIEW.md): if a unital *-hom beta: End(J (x) R) -> End(J (x) O (x) R)
restricts to a (x) b |-> a (x) 1_O (x) b on End(J) (x) End(R)  [forced by the E1.1 support pattern
plus intertwining], then the Bratteli inclusion matrix Lambda of beta must satisfy
    sum_c N_ij^c Lambda_{c c'} = dim Hom(c', s_i (x) O (x) s_j)        for all i in J, j in R.
Row i=1 forces Lambda_{x c'} = [O x]^{c'}, row j=1 forces Lambda_{x c'} = [x O]^{c'}; hence
Delta_{x,c'} = [O x]^{c'} - [x O]^{c'} must vanish for every simple x common to J and R.
Instance (Rule 16, calibration only): Vec_{S3}, O = 1 + g + h, g,h noncommuting transpositions;
control O = 1 + g (cyclic generated subcategory, Delta = 0 on <O>, nonzero only outside <O>).
"""
import itertools as it

G = list(it.permutations(range(3)))
mul = lambda p, q: tuple(p[q[i]] for i in range(3))   # (pq)(i) = p(q(i))
e, g, h = (0, 1, 2), (1, 0, 2), (0, 2, 1)
assert mul(g, h) != mul(h, g)


def obj(*xs):
    out = {}
    for x in xs:
        out[x] = out.get(x, 0) + 1
    return out


def tensor(A, B):
    out = {}
    for a, m in A.items():
        for b, n in B.items():
            c = mul(a, b)
            out[c] = out.get(c, 0) + m * n
    return out


def power(O, m):
    W = obj(e)
    for _ in range(m):
        W = tensor(W, O)
    return W


def bratteli(O, s, r):
    """Return the list of (x, c') where rows i=1 and j=1 force different Lambda entries,
    and whether the full system is solvable with the forced Lambda."""
    J, R = power(O, s), power(O, r)
    Lam_left = {x: tensor(O, obj(x)) for x in R}    # from i = 1:  Lambda_{x,.} = [O x]
    Lam_right = {x: tensor(obj(x), O) for x in J}   # from j = 1:  Lambda_{x,.} = [x O]
    clash = [(x, c) for x in set(J) & set(R) for c in G
             if Lam_left[x].get(c, 0) != Lam_right[x].get(c, 0)]
    return clash


def delta_on(O, simples):
    return {x: {c: tensor(O, obj(x)).get(c, 0) - tensor(obj(x), O).get(c, 0) for c in G}
            for x in simples}


def generated(O):
    S, frontier = {e}, {e}
    while frontier:
        new = {mul(a, b) for a in frontier for b in O} - S
        S |= new
        frontier = new
    return S


O1 = obj(e, g, h)
clash = bratteli(O1, 1, 1)
print('Vec_S3, O=1+g+h, M=2, s=1: clashing (x, c) entries:', len(clash), sorted(clash)[:4])
assert clash, 'expected a ring-level obstruction'
D1 = delta_on(O1, generated(O1))
assert any(v != 0 for d in D1.values() for v in d.values())
print('  Delta nonzero on <O> = S3: no one-gap lift with the E1.1 support pattern exists, any M>=2, 1<=s<M')

O2 = obj(e, g)
assert not bratteli(O2, 1, 1) and not bratteli(O2, 2, 3)
D2in = delta_on(O2, generated(O2))
D2out = delta_on(O2, [h])
assert all(v == 0 for d in D2in.values() for v in d.values())
assert any(v != 0 for d in D2out.values() for v in d.values())
print('Control Vec_S3, O=1+g: Delta = 0 on <O> = {1,g} (E1.5 applies); nonzero only for h outside <O>')
print('PASS reviewer Proposition R-1 instance and control')
