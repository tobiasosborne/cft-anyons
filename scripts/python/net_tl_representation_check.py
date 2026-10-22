#!/usr/bin/env python3
"""Net (chromatic) representation of Temperley-Lieb on the dilute Fibonacci chain.

Checks (CA-87): on the open chain of L sites with site object O = 1 + tau
(CONVENTIONS (r)), unitary-gauge F-symbols (CONVENTIONS (b)), define
    e_{2j-1} = phi * P0_j              (site j vacant),      j = 1..L
    e_{2j}   = F_{j,j+1}               (the "flip" tile combination), j = 1..L-1
with F = phi(|u><u| (+) |w><w|) in the pair basis
    1-block  {|11>, |tt;1>}:          u = (phi^-1, s_c phi^-1/2)
    tau-block {|1t>, |t1>, |tt;t>}:   w = (phi^-1, phi^-1, s_r phi^-3/2)
and verify the Temperley-Lieb relations e_i^2 = phi e_i, e_i e_{i+-1} e_i = e_i,
[e_i, e_k] = 0 for |i-k| >= 2, for all sign choices s_c, s_r = +-1 and L = 3..6.
Also records the spectrum of H = -sum_i e_i (the Q = phi+1 Potts chain at its
self-dual point in the net representation) for L = 3..8.

Run:  python3 scripts/python/net_tl_representation_check.py
Writes: runs/2026-09-23-net-tl-representation/results.txt
"""
import itertools, sys, os
import numpy as np

PHI = (1 + 5 ** 0.5) / 2
ONE, TAU = 0, 1
FUSE = {(ONE, ONE): [ONE], (ONE, TAU): [TAU], (TAU, ONE): [TAU], (TAU, TAU): [ONE, TAU]}
FTTT = np.array([[1 / PHI, PHI ** -0.5], [PHI ** -0.5, -1 / PHI]])  # CONVENTIONS (b)


def fsym(a, b, c, d, e, f):
    """[F^{abc}_d]_{e f}: e in a(x)b, d in e(x)c ; f in b(x)c, d in a(x)f."""
    if e not in FUSE[(a, b)] or d not in FUSE[(e, c)] or f not in FUSE[(b, c)] or d not in FUSE[(a, f)]:
        return 0.0
    if a == b == c == d == TAU:
        return FTTT[e, f]
    return 1.0


def basis(L):
    """Left-associated fusion paths: list of (x tuple, c tuple), c_0 = 1 implicit."""
    out = []
    def rec(x, c):
        if len(x) == L:
            out.append((tuple(x), tuple(c))); return
        prev = c[-1] if c else ONE
        for xs in (ONE, TAU):
            for cs in FUSE[(prev, xs)]:
                rec(x + [xs], c + [cs])
    rec([], [])
    return out


PAIR_ONE = [(ONE, ONE), (TAU, TAU)]                 # |11>, |tt;1>
PAIR_TAU = [(ONE, TAU), (TAU, ONE), (TAU, TAU)]     # |1t>, |t1>, |tt;t>
PAIR = {ONE: PAIR_ONE, TAU: PAIR_TAU}


def two_site_operator(L, j, blocks, B, index):
    """Embed a pair-basis operator (dict y -> matrix on PAIR[y]) at sites j, j+1 (1-based)."""
    dim = len(B)
    M = np.zeros((dim, dim))
    for col, (x, c) in enumerate(B):
        a = c[j - 2] if j >= 2 else ONE
        xj, xk = x[j - 1], x[j]
        cj, b = c[j - 1], c[j]
        # left-assoc -> right-assoc: amplitude on |a (xj xk; y)>_b
        for y in FUSE[(xj, xk)]:
            amp_in = fsym(a, xj, xk, b, cj, y)
            if amp_in == 0.0:
                continue
            blk = blocks[y]
            pb = PAIR[y]
            col_p = pb.index((xj, xk))
            for row_p, (xj2, xk2) in enumerate(pb):
                o = blk[row_p, col_p]
                if o == 0.0:
                    continue
                # right-assoc -> left-assoc with new letters
                for cj2 in FUSE[(a, xj2)]:
                    amp_out = fsym(a, xj2, xk2, b, cj2, y)  # F real symmetric, self-inverse
                    if amp_out == 0.0:
                        continue
                    x2 = list(x); x2[j - 1] = xj2; x2[j] = xk2
                    c2 = list(c); c2[j - 1] = cj2
                    row = index[(tuple(x2), tuple(c2))]
                    M[row, col] += amp_out * o * amp_in
    return M


def one_site_vacancy(L, j, B):
    return np.diag([1.0 if x[j - 1] == ONE else 0.0 for (x, c) in B])



def dense_basis(M):
    """Dense tau chain: all x_j = tau; fusion labels c_j with c_0 = 1."""
    out = []
    def rec(c):
        if len(c) == M:
            out.append(tuple(c)); return
        prev = c[-1] if c else ONE
        for cs in FUSE[(prev, TAU)]:
            rec(c + [cs])
    rec([])
    return out


def dense_tl_generator(M, j, Bd, idx):
    """e_j = phi P_1^{(j,j+1)} on the dense chain: <c'|e_j|c> = phi F[c_j,1] F[c'_j,1] (a=c_{j-1}, b=c_{j+1})."""
    E = np.zeros((len(Bd), len(Bd)))
    for col, c in enumerate(Bd):
        a = c[j - 2] if j >= 2 else ONE
        b = c[j]
        for cj2 in FUSE[(a, TAU)]:
            amp = fsym(a, TAU, TAU, b, c[j - 1], ONE) * fsym(a, TAU, TAU, b, cj2, ONE)
            if amp == 0.0:
                continue
            c2 = list(c); c2[j - 1] = cj2
            E[idx[tuple(c2)], col] += PHI * amp
    return E


def flip_blocks(sc, sr):
    u = np.array([1 / PHI, sc * PHI ** -0.5])
    w = np.array([1 / PHI, 1 / PHI, sr * PHI ** -1.5])
    return {ONE: PHI * np.outer(u, u), TAU: PHI * np.outer(w, w)}


def tl_check(L, sc, sr):
    B = basis(L); index = {s: i for i, s in enumerate(B)}
    blocks = flip_blocks(sc, sr)
    gens = []
    for j in range(1, L + 1):
        gens.append(PHI * one_site_vacancy(L, j, B))
        if j < L:
            gens.append(two_site_operator(L, j, blocks, B, index))
    n = len(gens)
    worst = 0.0
    for i, e in enumerate(gens):
        worst = max(worst, np.abs(e @ e - PHI * e).max(), np.abs(e - e.T).max())
        if i + 1 < n:
            f = gens[i + 1]
            worst = max(worst, np.abs(e @ f @ e - e).max(), np.abs(f @ e @ f - f).max())
        for k in range(i + 2, n):
            worst = max(worst, np.abs(e @ gens[k] - gens[k] @ e).max())
    H = -sum(gens)
    ev = np.linalg.eigvalsh(H)
    return len(B), n, worst, ev


def main():
    os.makedirs("runs/2026-09-23-net-tl-representation", exist_ok=True)
    lines = []
    fib = lambda n: int(round(((1 + 5 ** 0.5) / 2) ** n / 5 ** 0.5))
    ok_all = True
    for L in range(3, 7):
        for sc, sr in itertools.product((1, -1), repeat=2):
            dim, n, worst, ev = tl_check(L, sc, sr)
            assert dim == fib(2 * L + 1), (dim, fib(2 * L + 1))
            # expected: relations hold iff s_c = +1 (cup sign tied to the F-gauge of
            # CONVENTIONS (b)); the vertex sign s_r is a free gauge.
            passed = worst < 1e-12
            status = ("PASS" if passed else "FAIL") + (" (as expected)" if passed == (sc == 1) else " (UNEXPECTED)")
            if passed != (sc == 1): ok_all = False
            lines.append(f"L={L} dim={dim}=F_{2*L+1} generators={n} s_c={sc:+d} s_r={sr:+d} max TL-relation residual={worst:.2e} {status}")
    lines.append("")
    lines.append("Spectrum of H = -sum_i e_i (net representation, s_c=s_r=+1); N = 2L-1 generators")
    for L in range(3, 9):
        dim, n, worst, ev = tl_check(L, 1, 1)
        lines.append(f"L={L} N={n} dim={dim} E0={ev[0]:.10f} E0/N={ev[0]/n:.10f} gaps={np.round(ev[1:5]-ev[0],6).tolist()}")
    # cross-check: the dense tau chain (golden chain, RSOS representation of the
    # same TL(phi)) H = -sum_j phi P1_{j,j+1}; bulk energy per generator must agree.
    lines.append("")
    lines.append("Golden chain (dense tau chain, e_j = phi P_1 on sites j,j+1), M sites, N = M-1 generators;")
    lines.append("same TL_{M} as the net representation with L = M/2 sites: spectra must agree module by module")
    for M in range(6, 19, 2):
        Bd = dense_basis(M); idx = {s: i for i, s in enumerate(Bd)}
        Hd = np.zeros((len(Bd), len(Bd)))
        for j in range(1, M):
            Hd -= dense_tl_generator(M, j, Bd, idx)
        evd = np.linalg.eigvalsh(Hd)
        lines.append(f"M={M} N={M-1} dim={len(Bd)} E0={evd[0]:.10f} E0/N={evd[0]/(M-1):.10f} gaps={np.round(evd[1:5]-evd[0],6).tolist()}")
    # mutation: perturb the vertex entry -> relations must FAIL
    B = basis(4); index = {s: i for i, s in enumerate(B)}
    blocks = flip_blocks(1, 1); blocks[TAU] = blocks[TAU].copy(); blocks[TAU][2, 2] *= 1.01
    F1 = two_site_operator(4, 1, blocks, B, index); F2 = two_site_operator(4, 2, blocks, B, index)
    mut = max(np.abs(F1 @ F1 - PHI * F1).max(), np.abs(F1 @ F2 - F2 @ F1).max())
    lines.append("")
    lines.append(f"Mutation (vertex diagonal entry x1.01, L=4): max residual={mut:.3e} -> {'RED as required' if mut > 1e-6 else 'UNEXPECTED GREEN'}")
    lines.append(f"ALL TL CHECKS PASS: {ok_all}")
    text = "\n".join(lines)
    print(text)
    with open("runs/2026-09-23-net-tl-representation/results.txt", "w") as fh:
        fh.write(text + "\n")
    if not ok_all or mut < 1e-6:
        sys.exit(1)


if __name__ == "__main__":
    main()
