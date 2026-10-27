#!/usr/bin/env python3
"""Independent referee check of G1.3 (dihedral counterexample) and G1.2 (Lambda invariant).

Run (from the G1 directory):  python3 -B checks/review_g1_independent.py [--mutate X]
  X in {K, u, transport, point, dress, centralO}; each mutation must turn one
  named assertion RED.  X=authorpoint replays the author's --mutate-point and
  must stay GREEN (it only relabels the point to the other rho-fixed vector E1).  No network; numpy for dense random tests (Float64,
  tolerance 1e-9 on entries of size O(1)); all combinatorial checks are exact.

Independence from checks/dihedral_lift.py: the dihedral group is modelled as
permutations of Z/m (a: i->-i, b: i->1-i, composition (xy)(i)=x(y(i)), so
r=ab: i->i-1); T_L is built by literally moving each new K strand leftward one
adjacent crossing at a time (no closed-form suffix x_i); alpha_L is tested on
dense RANDOM block-diagonal elements of A_L and of interval algebras, and
interval membership is tested by tensor reshaping, not by matrix units.

Untwisted Vec_G (associator identity): ENO.md:45, Penneys.md:277-288,319-321.
A morphism W->W' is a grade-preserving linear map; End(O^n) = grade-block
matrices; A_[j,k] = 1 (x) End(O^(k-j+1)) (x) 1  (CA-96:53, CONVENTIONS (as)).
"""
import argparse
import itertools as it
import sys
from collections import Counter

import numpy as np

P = argparse.ArgumentParser()
P.add_argument('--mutate', default=None,
               choices=['K', 'u', 'transport', 'point', 'dress', 'centralO', 'authorpoint'])
ARGS = P.parse_args()
MUT = ARGS.mutate
RNG = np.random.default_rng(20261027)
TOL = 1e-9
TOT = Counter()


def need(cond, msg):
    if not cond:
        raise AssertionError(msg)


def dihedral(m):
    a = tuple((-i) % m for i in range(m))
    b = tuple((1 - i) % m for i in range(m))
    e = tuple(range(m))

    def mul(x, y):
        return tuple(x[y[i]] for i in range(m))

    def inv(x):
        out = [0] * m
        for i, xi in enumerate(x):
            out[xi] = i
        return tuple(out)
    G, frontier = {e}, [e]
    while frontier:
        g = frontier.pop()
        for s in (a, b):
            h = mul(g, s)
            if h not in G:
                G.add(h)
                frontier.append(h)
    need(len(G) == 2 * m, f"|D_{m}| != 2m")
    return e, a, b, mul, inv, sorted(G)


def setup(m):
    e, a, b, mul, inv, G = dihedral(m)
    r = mul(a, b)
    ri = inv(r)
    need(r != ri and len({e, a, b, r}) == 4, "need m>=3")
    O = [e, a, b, r]                       # labels 0:1 1:a 2:b 3:r
    if MUT == 'centralO':
        O = [e, e, r, ri]                  # central class, for detector RED
    K = [e, e, r, ri]                      # E0 E1 R+ R-
    if MUT == 'K':
        K = [e, e, r, r]                   # noncentral class 2+2r
    names = {'1': 0, 'a': 1, 'b': 2, 'r': 3}
    kn = {'E0': 0, 'E1': 1, 'R+': 2, 'R-': 3}
    # Table transcribed by NAME from NOTE.md:206-220.
    table = [('1', 'E0', '1', '1'), ('a', 'E0', 'a', '1'), ('b', 'E0', 'b', '1'),
             ('r', 'E0', 'r', '1'), ('1', 'E1', 'a', 'a'), ('a', 'E1', '1', 'a'),
             ('b', 'E1', 'a', 'r'), ('r', 'E1', 'a', 'b'), ('1', 'R+', '1', 'r'),
             ('a', 'R+', '1', 'b'), ('b', 'R+', 'b', 'r'), ('r', 'R+', 'r', 'r'),
             ('1', 'R-', 'b', 'a'), ('a', 'R-', 'r', 'a'), ('b', 'R-', 'r', 'b'),
             ('r', 'R-', 'b', 'b')]
    u = {(names[g], kn[h]): (names[x], names[y]) for g, h, x, y in table}
    if MUT == 'authorpoint':                # author's --mutate-point; expected to stay GREEN
        for g in range(4):
            u[g, 0], u[g, 1] = u[g, 1], u[g, 0]
    if MUT == 'u':                          # swap outputs of two rows of different grade
        u[0, 1], u[1, 1] = u[1, 1], u[0, 1]
    # NB: exchanging the E0/E1 rows of u (the author's --mutate-point) is NOT a
    # mutation: E1 is also rho-fixed, so it is a valid new point.  The genuine
    # point mutation below lets reflections exchange E0<->E1 (sign character):
    # rho stays a grade-correct unitary action, but kappa=E0 is no longer fixed.

    def rho(x, h):                          # conjugation action on K basis
        if MUT == 'transport':
            return h
        if h < 2:
            if MUT == 'point' and (x[1] - x[0]) % m != 1:   # x a reflection
                return 1 - h
            return h
        target = mul(mul(x, K[h]), inv(x))
        cands = [k for k in (2, 3) if K[k] == target]
        need(len(cands) >= 1, f"m={m}: rho ill-defined: K not closed under conjugation")
        return cands[0] if len(cands) == 1 else h
    return dict(m=m, e=e, mul=mul, inv=inv, G=G, O=O, K=K, u=u, rho=rho, r=r, a=a)


def grade(S, labels, word):
    g = S['e']
    for i in word:
        g = S['mul'](g, labels[i])
    return g


def check_data(S):
    m, mul, O, K, u, rho = S['m'], S['mul'], S['O'], S['K'], S['u'], S['rho']
    need(len(set(u.values())) == 16, f"m={m}: u not a bijection")
    for (g, h), (x, y) in u.items():
        need(mul(O[g], K[h]) == mul(O[x], O[y]), f"m={m}: u not grade-preserving at {(g, h)}")
        TOT['u_rows'] += 1
    for g in range(4):
        if MUT not in ('point', 'authorpoint'):   # V test is the invariant
            need(u[g, 0] == (g, 0), f"m={m}: u(1_O (x) kappa) != 1_O (x) eta at g={g}")
    if MUT == 'transport':      # under 'transport' the T-morphism test must catch it
        return
    for x in S['G']:
        for h in range(4):
            need(mul(x, K[h]) == mul(K[rho(x, h)], x), f"m={m}: transport grade (H) fails")
            if MUT != 'point':
                need(rho(x, 0) == 0, "point axiom")
            for y in S['G']:
                need(rho(mul(x, y), h) == rho(x, rho(y, h)), "tensor axiom")
                TOT['H_tensor'] += 1


def build_T(S, L):
    """Literal schedule: from O_1..O_L K_1..K_L move K_i left to just after O_i."""
    O, rho, u = S['O'], S['rho'], S['u']
    T = {}
    for old in it.product(range(4), repeat=L):
        for anc in it.product(range(4), repeat=L):
            strands = [('O', g) for g in old] + [('K', h) for h in anc]
            for i in range(L):
                # the i-th K strand in left-to-right order is K_i (K strands never cross)
                kpos = [p for p, s in enumerate(strands) if s[0] == 'K']
                pos = kpos[i]
                target = 2 * i + 1                 # just right of O_i (0-based)
                while pos > target:
                    left = strands[pos - 1]
                    need(left[0] == 'O', "a K strand would cross a K strand")
                    strands[pos - 1], strands[pos] = ('K', rho(O[left[1]], strands[pos][1])), left
                    pos -= 1
            fine = []
            for i in range(L):
                (o, g), (k, h) = strands[2 * i], strands[2 * i + 1]
                need(o == 'O' and k == 'K', "interleave failed")
                fine.extend(u[g, h])
            T[old, anc] = tuple(fine)
    need(len(set(T.values())) == 16 ** L, f"L={L}: T not a bijection")
    for (old, anc), fine in T.items():
        need(S['mul'](grade(S, S['O'], old), grade(S, S['K'], anc)) == grade(S, S['O'], fine),
             f"m={S['m']},L={L}: T not a morphism (grade) at {old},{anc}")
        TOT['T_entries'] += 1
    return T


def idx(word):
    n = 0
    for x in word:
        n = 4 * n + x
    return n


def dense_tests(S, L, T):
    m = S['m']
    dimL, dim2 = 4 ** L, 16 ** L
    Tm = np.zeros((dim2, dimL * dimL))
    for (old, anc), fine in T.items():
        Tm[idx(fine), idx(old) * dimL + idx(anc)] = 1.0
    if MUT == 'dress' and L == 2:   # nonlocal grade-preserving unitary fixing range(V_L)
        w1, w2 = (1, 1, 2, 2), (0, 2, 2, 0)        # (a,a,b,b), (1,b,b,1): grade 1, off range(V)
        need(grade(S, S['O'], w1) == grade(S, S['O'], w2), "dress grades")
        D = np.eye(dim2)
        D[[idx(w1), idx(w2)]] = D[[idx(w2), idx(w1)]]
        Tm = D @ Tm
    V = np.zeros((dim2, dimL))
    for old in it.product(range(4), repeat=L):
        V[idx(tuple(x for g in old for x in (g, 0))), idx(old)] = 1.0
    words = list(it.product(range(4), repeat=L))
    gr = [grade(S, S['O'], w) for w in words]

    def rand_block(n_sites):
        ws = list(it.product(range(4), repeat=n_sites))
        g = [grade(S, S['O'], w) for w in ws]
        X = RNG.normal(size=(len(ws), len(ws))) + 1j * RNG.normal(size=(len(ws), len(ws)))
        mask = np.array([[g[i] == g[j] for j in range(len(ws))] for i in range(len(ws))])
        return X * mask

    def alpha(a):
        return Tm @ np.kron(a, np.eye(dimL)) @ Tm.T
    a1, a2 = rand_block(L), rand_block(L)
    A1 = alpha(a1)
    need(np.abs(A1 @ V - V @ a1).max() < TOL, f"m={m},L={L}: alpha(a)V != Va")
    need(np.abs(alpha(a1 @ a2) - A1 @ alpha(a2)).max() < TOL, "not multiplicative")
    need(np.abs(alpha(a1.conj().T) - A1.conj().T).max() < TOL, "not *-preserving")
    need(np.abs(alpha(np.eye(dimL)) - np.eye(dim2)).max() < TOL, "not unital")
    need(np.abs(Tm.T @ Tm - np.eye(dim2)).max() < TOL, "T not unitary")
    TOT['dense_alg'] += 1
    # interval membership with slack 1: A_[j,k] -> A_[2j-1, 2k] (1-based)
    for j in range(1, L + 1):
        for k in range(j, L + 1):
            X = rand_block(k - j + 1)
            a = np.kron(np.kron(np.eye(4 ** (j - 1)), X), np.eye(4 ** (L - k)))
            Y = alpha(a)
            lo, hi = 2 * j - 1, 2 * k                       # window, 1-based inclusive
            nl, nw, nr = 16 ** (j - 1), 4 ** (hi - lo + 1), 4 ** (2 * L - hi)
            Yt = Y.reshape(nl, nw, nr, nl, nw, nr)
            core = Yt[0, :, 0, 0, :, 0]
            recon = np.kron(np.kron(np.eye(nl), core), np.eye(nr))
            need(np.abs(recon - Y).max() < TOL,
                 f"m={m},L={L}: alpha(A_[{j},{k}]) not in A_[{lo},{hi}]")
            ws = list(it.product(range(4), repeat=hi - lo + 1))
            g = [grade(S, S['O'], w) for w in ws]
            off = max((abs(core[p, q]) for p in range(nw) for q in range(nw) if g[p] != g[q]),
                      default=0.0)
            need(off < TOL, "window operator not a categorical endomorphism")
            TOT['interval_tests'] += 1
    return Tm, V


def noncentral_powers(S, nmax):
    mul, O, a = S['mul'], S['O'], S['a']
    s = Counter(O)
    p = Counter({S['e']: 1})
    for n in range(1, nmax + 1):
        q = Counter()
        for g, c in p.items():
            for h, d in s.items():
                q[mul(g, h)] += c * d
        p = q
        left = Counter({mul(a, g): c for g, c in p.items()})
        right = Counter({mul(g, a): c for g, c in p.items()})
        need(left != right, f"m={S['m']}: [O]^{n} commutes with a (detector)")
        TOT['noncentral_powers'] += 1


def rep_identity():
    import sympy as sp
    th = sp.symbols('theta', real=True)
    A = sp.diag(1, -1)
    R = sp.Matrix([[sp.cos(th), -sp.sin(th)], [sp.sin(th), sp.cos(th)]])
    B = A * R
    I2 = sp.eye(2)
    need(sp.simplify(B * B - I2) == sp.zeros(2), "B^2 != I")
    need(sp.simplify(A * B - R) == sp.zeros(2), "AB != R")
    M = (I2 + A) * (I2 + B)
    lam = 2 * (1 + sp.cos(th))
    need(sp.simplify(M - sp.Matrix([[lam, -2 * sp.sin(th)], [0, 0]])) == sp.zeros(2), "M form")
    need(sp.simplify(M * M - lam * M) == sp.zeros(2), "M^2 != lambda M")
    need(sp.simplify((M * A - A * M)[0, 1] - 4 * sp.sin(th)) == 0, "[M,A]_12")
    ph = sp.symbols('phi', real=True)
    Rp = R.subs(th, ph)
    need(sp.simplify(sp.expand_trig(R * Rp - R.subs(th, th + ph))) == sp.zeros(2),
         "rotation addition R(t)R(p)=R(t+p)")   # hence R(2pi/m)^m = R(2pi) = I by induction
    need(R.subs(th, 2 * sp.pi) == I2, "R(2pi) != I")
    for m in range(3, 9):                        # Float64 spot check of R^m = I
        Rn = np.array(R.subs(th, 2 * sp.pi / m).evalf(), dtype=float)
        need(np.abs(np.linalg.matrix_power(Rn, m) - np.eye(2)).max() < TOL, f"R^{m} != I")
    TOT['rep_identity'] += 1


def lambda_g12():
    """G1.2 at G=D_3=S_3, O=regular: Lambda of the K=N.1 lift vs a CA-90 lift."""
    e, a, b, mul, inv, G = dihedral(3)
    N = len(G)
    gi = {g: i for i, g in enumerate(G)}
    for L in (1, 2):
        words = list(it.product(range(N), repeat=L))

        def gr(w):
            g = e
            for i in w:
                g = mul(g, G[i])
            return g
        lam_alt, lam_tr = Counter(), Counter()
        for w in words:
            c = gr(w)
            for anc in it.product(range(N), repeat=L):   # K = N copies of 1
                fine = []
                for gidx, h in zip(w, anc):
                    fine += [gi[mul(G[gidx], inv(G[h]))], h]
                lam_alt[c, gr(fine)] += 1
                # CA-90 lift with conjugation half-braiding on O=R (b=1): new_i crosses old_j, j>i
                strands = list(w) + list(anc)
                new = list(anc)
                for i in range(L):
                    x = e
                    for j in range(i + 1, L):
                        x = mul(x, G[w[j]])
                    new[i] = gi[mul(mul(x, G[anc[i]]), inv(x))]
                fine2 = [t for pair in zip(w, new) for t in pair]
                lam_tr[c, gr(fine2)] += 1
        # each input block c (grade c) has N^(L-1) words; divide to get per-copy multiplicity
        per = N ** (L - 1)
        for c in G:
            for d in G:
                need(lam_alt[c, d] % per == 0 and lam_tr[c, d] % per == 0, "block counting")
                la, lt = lam_alt[c, d] // per, lam_tr[c, d] // per
                need(la == (N ** L if c == d else 0), f"L={L}: Lambda_alt formula (G) fails")
                need(lt == N ** (L - 1), f"L={L}: Lambda_tr formula (G) fails")
                TOT['lambda_entries'] += 1
        need(any(lam_alt[c, d] != lam_tr[c, d] for c in G for d in G), "Lambdas coincide")


def s3_carrier_no_blocked_ancilla(bmax, positive_control=False):
    """Reviewer extension: O=1+g+h in Vec_S3 (CA-90/CA-96 open carrier).  A blocked
    ancilla datum (K transportable on D=C, unitary u:O^b(x)K->O^(2b)) forces
    [K] central with [O]^b[K]=[O]^(2b).  Enumerate all central K with nonnegative
    coefficients and FPdim 3^b; assert none solves it (b<=bmax)."""
    e, a, b, mul, inv, G = dihedral(3)
    r = mul(a, b)
    C3 = [r, inv(r)]
    C2 = [g for g in G if g not in (e, r, inv(r))]
    need(len(C2) == 3, "reflection class")

    def conv(x, y):
        z = Counter()
        for g, c in x.items():
            for h, d in y.items():
                z[mul(g, h)] += c * d
        return z
    O = Counter({e: 1, a: 1, b: 1})
    if positive_control:      # G1.3's O=1+a+b+ab must have the class solution K=2+r+r^-1
        O = Counter({e: 1, a: 1, b: 1, r: 1})
    for bb in range(1, bmax + 1):
        Ob = Counter({e: 1})
        for _ in range(bb):
            Ob = conv(Ob, O)
        O2b = conv(Ob, Ob)
        n = sum(O.values()) ** bb
        sols = 0
        for gam in range(n // 3 + 1):
            for bet in range((n - 3 * gam) // 2 + 1):
                alp = n - 3 * gam - 2 * bet
                Kc = Counter({e: alp})
                for g in C3:
                    Kc[g] += bet
                for g in C2:
                    Kc[g] += gam
                if +conv(Ob, Kc) == +O2b:
                    sols += 1
        if positive_control:
            need(sols >= 1, f"positive control: no class solution for 1+a+b+r at b={bb}")
            return sols
        need(sols == 0, f"S3 carrier: blocked ancilla class solution at b={bb}")
        TOT['s3_b_values'] += 1
        # and [O]^b itself is never central (it would be a solution K=O^b)
        need(conv(Ob, Counter({a: 1})) != conv(Counter({a: 1}), Ob), "S3 power central")


def descent_and_occupation(S):
    """Sparse: (i) 97.11 trailing descent alpha_{L+1}(a(x)1)=alpha_L(a)(x)1(x)1 on all
    matrix units, L=1,2 (asserted to HOLD); (ii) (am) occupation degree preserved by
    alpha_2 on matrix units (asserted to FAIL: G1.3 lifts are not degree-preserving)."""
    T = {L: build_T(S, L) for L in (1, 2, 3)}

    def pairs(L, w, wp):
        return {(T[L][w, anc], T[L][wp, anc]) for anc in it.product(range(4), repeat=L)}
    for L in (1, 2):
        for w, wp in it.product(it.product(range(4), repeat=L), repeat=2):
            if grade(S, S['O'], w) != grade(S, S['O'], wp):
                continue
            lhs = set()
            for g in range(4):
                lhs |= pairs(L + 1, w + (g,), wp + (g,))
            rhs = {(x + f, y + f) for (x, y) in pairs(L, w, wp)
                   for f in it.product(range(4), repeat=2)}
            need(lhs == rhs, f"m={S['m']}: 97.11 descent fails at L={L}")
            TOT['descent_units'] += 1
    occ = lambda w: sum(1 for x in w if x != 0)
    viol = 0
    for w, wp in it.product(it.product(range(4), repeat=2), repeat=2):
        if grade(S, S['O'], w) == grade(S, S['O'], wp):
            viol += sum(occ(x) - occ(y) != occ(w) - occ(wp) for x, y in pairs(2, w, wp))
    need(viol > 0, "G1.3 lift unexpectedly preserves occupation degree")
    return viol


def mark_extraction(S, Tm):
    """97.13's formula t_O = j^dag alpha_2(h) i applied to the G1.3 lift (informational)."""
    dim2, dim4 = 16, 256
    def vec(w):
        return idx(w)
    r_ = np.zeros((16, 4)); l_ = np.zeros((16, 4))
    for g in range(4):
        r_[vec((0, g)), g] = 1; l_[vec((g, 0)), g] = 1
    h = r_ @ l_.T
    i_ = np.zeros((dim4, dim2)); j_ = np.zeros((dim4, dim2))
    for g1, g2 in it.product(range(4), repeat=2):
        i_[vec((g1, g2, 0, 0)), vec((g1, g2))] = 1
        j_[vec((0, g1, g2, 0)), vec((g1, g2))] = 1
    X = j_.T @ (Tm @ np.kron(h, np.eye(16)) @ Tm.T) @ i_
    return np.abs(X.conj().T @ X - np.eye(16)).max(), np.linalg.matrix_rank(X)


def main():
    print('COMMAND: python3 -B ' + ' '.join(sys.argv), flush=True)
    print(f'MUTATION: {MUT}', flush=True)
    rep_identity()
    print('PASS 2x2 representation identities (K) symbolic in theta; addition law; R^m=I spot m=3..8', flush=True)
    lambda_g12()
    print('PASS G1.2 Lambda: K=N.1 lift gives N^L delta, CA-90 conj lift gives N^(L-1), S_3, L=1,2',
          flush=True)
    nsol = s3_carrier_no_blocked_ancilla(1, positive_control=True)
    print(f'PASS positive control: O=1+a+b+r in Vec_S3 has {nsol} central class solution(s) at b=1',
          flush=True)
    s3_carrier_no_blocked_ancilla(5)
    print('PASS S3 carrier O=1+g+h: no central K with [O]^b[K]=[O]^(2b), b<=5 (class level)',
          flush=True)
    for m in (3, 4, 5, 6):
        S = setup(m)
        noncentral_powers(S, 12)
        check_data(S)
        for L in (1, 2):
            T = build_T(S, L)
            Tm, V = dense_tests(S, L, T)
            if L == 2 and m == 3 and MUT is None:
                defect, rank = mark_extraction(S, Tm)
                print(f'INFO m=3: 97.13 mark j^+ alpha_2(h) i: unitarity defect {defect:.3f}, '
                      f'rank {rank}/16 (no half-braiding exists to recover)', flush=True)
        if m in (3, 4) and MUT is None:
            v = descent_and_occupation(S)
            print(f'PASS m={m}: 97.11 trailing descent holds L=1,2; occupation degree '
                  f'violated in {v} entries of alpha_2 (not (am)-degree-preserving)', flush=True)
        print(f'PASS m={m}: u, transport H, [O]^n noncentral n<=12, T_L morphism/bijection, '
              f'exact V, *-hom, slack-1 interval membership (L=1,2)', flush=True)
    print('TOTALS: ' + ', '.join(f'{k}={v}' for k, v in sorted(TOT.items())), flush=True)
    print('HEADLINE: G1.3 dihedral lifts verified independently; no power of [O] central; '
          'G1.2 Lambda mismatch reproduced.', flush=True)


if __name__ == '__main__':
    main()
