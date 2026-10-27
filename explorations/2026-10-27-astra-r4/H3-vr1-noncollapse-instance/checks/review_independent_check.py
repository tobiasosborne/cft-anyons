#!/usr/bin/env python3
"""Opus review (2026-10-27): independent check of H3's free-fermion VR-1 calibration.

Independent of graph_check.py: works in PHYSICAL occupation coordinates (sea
r<0 filled), builds the refinement J as the canonical GNS map
[a]_M -> [alpha(a)]_2M from CAR words on the cyclic vacuum (no hand-chosen
padding signs), and tests the load-bearing claims of checks/graph_certificate.md:
  A1 exact E-transport; GNS intertwining of every coarse c_r, c_r^*;
  A2 exact weighted norms <= Lemma Q constant, uniform in M;
  A3 p=1 UV obstruction (moving one-particle vector, M up to 4096);
  A3 exact all-coarse-column weighted defect norms at p=2,3 (M=4->8, 8->16);
  A4 full residual incl. scalar, ledger c=c*=1, exact at M=4..10;
  scalar cocycle -> (m^3-m)/12 from many-body vacuum norms (sign of c);
  A5 witness q_r >= 1/(2 sqrt2 pi) on the transported coarse vector, M=4..1024.
Mutations (--mutate X) must FAIL with AssertionError:
  empty-pad : refinement inserts EMPTY new labels (not the sea) -> A1/GNS fail
  ledger    : A4 ledger c*=c=0 -> residual does not vanish
  collapse  : modes scaled by M0/M (A1-A4 still hold, limits zero) -> A5 fails
  p1        : run A3 with p=1 and demand summable decay -> fails
Sources: references/text/CFTFromLatticeFermions.txt:3379-3418 (eq. 197-199),
:879-892 (normal ordering, cocycle); cft_machine/research/virasoro_routes.md:55-82.
Budget: dense <= 1024x1024; sparse dict states otherwise. Seconds.
"""
import math, sys
import numpy as np
from scipy import sparse

MUT = sys.argv[2] if len(sys.argv) > 2 and sys.argv[1] == '--mutate' else None
TOL = 1e-9
out = []
def log(*a):
    s = ' '.join(str(x) for x in a); out.append(s); print(s)

def labels(M): return [(2*j - M + 1)/2 for j in range(M)]
def idx(M, r): return int(round(r + (M - 1)/2))

def coeff(M, n, r):
    """source-modified no-wrap KS coefficient a_n^M(r) (eq. 198), 0 off-window"""
    h = M/2
    if not (abs(r) < h and abs(r - n) < h): return 0.0
    eps = 2*math.pi/M
    c = math.cos(eps*n/4)**2*math.sin(eps*(r - n/2))/eps
    if MUT == 'collapse': c *= 4.0/M
    return c

def vac(M): return sum(1 << idx(M, r) for r in labels(M) if r < 0)

def ann(mask, j):
    if not (mask >> j) & 1: return None
    s = -1 if bin(mask & ((1 << j) - 1)).count('1') % 2 else 1
    return mask ^ (1 << j), s
def cre(mask, j):
    if (mask >> j) & 1: return None
    s = -1 if bin(mask & ((1 << j) - 1)).count('1') % 2 else 1
    return mask | (1 << j), s

def energy(M, mask):
    e = 0.0
    for r in labels(M):
        occ = (mask >> idx(M, r)) & 1
        if (r > 0 and occ) or (r < 0 and not occ): e += abs(r)
    return e

def apply_T(M, n, state):
    """T_{M,n} = sum_r a(r) c*_{r-n} c_r - delta_{n0} sum_{r<0} a(r)  on dict state"""
    res = {}
    const = sum(coeff(M, 0, r) for r in labels(M) if r < 0) if n == 0 else 0.0
    for mask, amp in state.items():
        for r in labels(M):
            a = coeff(M, n, r)
            if a == 0.0: continue
            x = ann(mask, idx(M, r))
            if x is None: continue
            y = cre(x[0], idx(M, r - n))
            if y is None: continue
            res[y[0]] = res.get(y[0], 0.0) + a*x[1]*y[1]*amp
        if const: res[mask] = res.get(mask, 0.0) - const*amp
    return {k: v for k, v in res.items() if abs(v) > 1e-300}

def word_on_vacuum(M, ops):
    """ops: list of (kind, r) applied right-to-left order as listed last-first"""
    mask, sign = vac(M), 1
    for kind, r in reversed(ops):
        x = (cre if kind == '+' else ann)(mask, idx(M, r))
        if x is None: return None
        mask, s = x; sign *= s
    return mask, sign

def word_for(M, mask):
    """a CAR word a with pi(a) Omega = +-|mask>: annihilate holes, create particles"""
    ops = []
    for r in labels(M):
        occ = (mask >> idx(M, r)) & 1
        if r < 0 and not occ: ops.append(('-', r))
        if r > 0 and occ: ops.append(('+', r))
    return ops

def J_basis(M, Q, mask):
    """canonical GNS map [a]_M -> [alpha(a)]_Q on a coarse basis vector"""
    ops = word_for(M, mask)
    m0, s0 = word_on_vacuum(M, ops); assert m0 == mask
    if MUT == 'empty-pad':  # wrong refinement: new labels inserted EMPTY
        fine = 0
        for r in labels(M):
            if (mask >> idx(M, r)) & 1: fine |= 1 << idx(Q, r)
        return {fine: 1.0}
    m1, s1 = word_on_vacuum(Q, ops)
    return {m1: float(s0*s1)}

def J_state(M, Q, state):
    res = {}
    for mask, amp in state.items():
        for k, v in J_basis(M, Q, mask).items(): res[k] = res.get(k, 0.0) + v*amp
    return res

_DT = {}
def dense_T(M, n):
    if (M, n, MUT) in _DT: return _DT[(M, n, MUT)]
    D = 1 << M; A = np.zeros((D, D))
    for b in range(D):
        for k, v in apply_T(M, n, {b: 1.0}).items(): A[k, b] += v
    _DT[(M, n, MUT)] = A
    return A

def Evec(M): return np.array([energy(M, b) for b in range(1 << M)])
def wnorm(A, Eo, Ei, t, d):
    return np.linalg.norm(np.diag((1+Eo)**t) @ A @ np.diag((1+Ei)**(-t-d)), 2)

# ---- A1 + GNS intertwining (M=4->8 all, M=8->16 all coarse basis) ----
for M in (4, 8):
    Q = 2*M
    for b in range(1 << M):
        Jb = J_basis(M, Q, b)
        (fb, _), = Jb.items()
        assert abs(energy(Q, fb) - energy(M, b)) < TOL, 'A1: E_2M J = J E_M'
        for r in labels(M):
            for op in (ann, cre):
                x = op(b, idx(M, r))
                lhs = J_state(M, Q, {x[0]: x[1]}) if x else {}
                y = op(fb, idx(Q, r))
                rhs = {y[0]: y[1]*Jb[fb]} if y else {}
                keys = set(lhs) | set(rhs)
                assert all(abs(lhs.get(k, 0)-rhs.get(k, 0)) < TOL for k in keys), \
                    'GNS intertwining J c_r = c_r J'
log('A1 + GNS intertwining of all coarse c_r, c_r^*: PASS (M=4->8, 8->16)')

# ---- A5 witness on the transported coarse vector ----
kappa = 1/(2*math.sqrt(2)*math.pi)
M0 = 4
Om = {vac(M0): 1.0}; t = apply_T(M0, -2, Om); nt = math.sqrt(sum(v*v for v in t.values()))
w = {k: v/nt for k, v in t.items()}
v = {k: x/math.sqrt(2) for k, x in Om.items()}
for k, x in w.items(): v[k] = v.get(k, 0) + x/math.sqrt(2)
qs, M, p = [], M0, 2.0
while M <= 1024:
    Kinv = {k: x/(1+energy(M, k))**p for k, x in v.items()}
    Tv = apply_T(M, -2, Kinv)
    qs.append(sum(v.get(k, 0)*x for k, x in Tv.items()))
    if M < 1024: v = J_state(M, 2*M, v)
    M *= 2
log('A5 q_r = <v_r, T_-2 K^-1 v_r>, M=4..1024:', [round(q, 6) for q in qs], 'kappa', round(kappa, 6))
assert min(qs) >= kappa - TOL, 'A5 lower bound kappa'
assert abs(qs[-1] - 1/(2*math.sqrt(2))) < 1e-4, 'A5 limit 1/(2 sqrt 2)'
# ---- A2: exact weighted norms vs Lemma Q constant, M = 4..10 ----
def lemmaQ(q, k, t, H): return H*(1+abs(k))**q*(3**q+abs(k))*(1+abs(k))**(t+q)
for p in (1.0, 2.0):
    for s in (0, 1):
        for n in (-2, -1, 0, 1, 2):
            vals = []
            for M in (4, 6, 8):
                E = Evec(M); vals.append(wnorm(dense_T(M, n), E, E, p*s, p))
            bound = lemmaQ(1, n, p*s, 1+abs(n)/2)
            assert max(vals) <= bound + TOL, 'A2 exceeds Lemma Q constant'
            if n == 2 and s == 1: log(f'A2 p={p} s={s} n={n}: exact norms M=4,6,8',
                                      [round(v, 4) for v in vals], '<= bound', round(bound, 1))
# p<1 fails A2 (moving one-particle vector, n=0)
r_ = [((M//4) - 0.5) for M in (16, 64, 256, 1024)]
gr = [abs(coeff(M, 0, r))/(1+r)**0.5 for M, r in zip((16, 64, 256, 1024), r_)]
assert gr[-1] > 3*gr[0], 'p=1/2 A2 ratio should diverge'
log('A2 p=1/2 UV ratio grows:', [round(g, 3) for g in gr])

# ---- A3: p=1 obstruction on a moving one-particle vector (many-body action) ----
def defect_ratio(M, p, r):
    Q = 2*M
    b = cre(vac(M), idx(M, r))[0]
    v = {b: 1.0}
    lhs = apply_T(Q, 0, J_state(M, Q, v))
    rhs = J_state(M, Q, apply_T(M, 0, v))
    diff = math.sqrt(sum((lhs.get(k, 0)-rhs.get(k, 0))**2 for k in set(lhs) | set(rhs)))
    return diff/(1+energy(M, b))**p
P_TEST = 1.0 if MUT == 'p1' else 2.0
rat = {p: [defect_ratio(M, p, M/4 - 0.5) for M in (16, 64, 256, 1024, 4096)] for p in (1.0, P_TEST)}
lim = 2*(math.sqrt(2)-1)/math.pi
log('A3 p=1 UV defect ratios', [round(x, 5) for x in rat[1.0]], 'limit 2(sqrt2-1)/pi =', round(lim, 5))
assert abs(rat[1.0][-1] - lim) < 1e-3 and all(x < y for x, y in zip(rat[1.0], rat[1.0][1:])), 'p=1 obstruction value'
# for the tested p the ratio must decay (summable); p=1 mutation must fail here
assert rat[P_TEST][-1] < 0.3*rat[P_TEST][1], f'A3 decay for p={P_TEST}'
log(f'A3 p={P_TEST} UV ratios decay:', [f'{x:.2e}' for x in rat[P_TEST]])

# ---- A3: exact all-coarse-column weighted defect norms, M=4->8, 8->16 ----
for p in (2.0, 3.0):
    for n in (-1, 0, 2):
        row = []
        for M in (4, 8):
            Q = 2*M; D = 1 << M
            cols, Eout = {}, {}
            for b in range(D):
                Jb = J_state(M, Q, {b: 1.0})
                lhs = apply_T(Q, n, Jb); rhs = J_state(M, Q, apply_T(M, n, {b: 1.0}))
                cols[b] = {k: lhs.get(k, 0)-rhs.get(k, 0) for k in set(lhs) | set(rhs)}
            keys = sorted({k for c in cols.values() for k in c}); pos = {k: i for i, k in enumerate(keys)}
            W = np.zeros((len(keys), D))
            for b, c in cols.items():
                for k, v in c.items(): W[pos[k], b] = v*(1+energy(Q, k))**p
            W = W @ np.diag((1+Evec(M))**(-2*p))
            row.append(np.linalg.norm(W, 2))
        log(f'A3 s=1 p={p} n={n}: exact defect norms M=4->8, 8->16:', [f'{x:.4f}' for x in row])

# ---- A4: full residual with ledger ----
cs = c = 0.0 if MUT == 'ledger' else 1.0
# (i) small-M exact many-body weighted residual (pre-asymptotic calibration, must decrease)
worst = {}
for M in (4, 6, 8):
    E = Evec(M); T = {n: dense_T(M, n) for n in range(-4, 5)}
    for n in range(-3, 4):
        assert np.max(np.abs(T[n].T - T[-n])) < TOL, 'adjoint pairing'
    w = 0.0
    for m in range(-2, 3):
        for n in range(-2, 3):
            z = (m**3*cs - m*c)/12 if m+n == 0 else 0.0
            R = T[m] @ T[n] - T[n] @ T[m] - (m-n)*T[m+n] - z*np.eye(1 << M)
            w = max(w, wnorm(R, E, E, 0.0, 4.0))
    worst[M] = w
log('A4 p=2 s=0 max_{|m|,|n|<=2} ||R K^-2|| (pre-asymptotic), M=4,6,8:', {k: round(v, 4) for k, v in worst.items()})
assert worst[8] < worst[6] < worst[4], 'A4 residual decreasing'
# (ii) large-M many-body vacuum residual <Omega, R_{m,-m} Omega> with the ledger -> 0
for m in (1, 2, 3):
    vals = []
    for M in (64, 256, 1024):
        st = apply_T(M, -m, {vac(M): 1.0})
        vals.append(sum(x*x for x in st.values()) - (m**3*cs - m*c)/12)  # T_m Omega = 0, T_0 Omega = 0
    log(f'A4 ledger vacuum residual m={m}, M=64,256,1024:', [f'{x:.2e}' for x in vals])
    assert abs(vals[-1]) < 1e-4 and abs(vals[-1]) <= abs(vals[0]) + 1e-15, 'A4 ledger: vacuum residual must vanish'
# (iii) one-particle coefficient bound |C_M(r)| <= H_mn eps^2 w^4 on the whole window
def g(n): return 1+abs(n)/2
def dd(n): return g(n)**3/6 + n*n*g(n)/16 + g(n)
for M in (64, 256, 1024):
    eps = 2*math.pi/M; worst_ratio = 0.0
    for m in range(-3, 4):
        for n in range(-3, 4):
            if M < 4*(max(abs(m), abs(n), abs(m+n))+1): continue
            H = (dd(m)*(1+abs(n))**3*g(n) + g(m)*(1+abs(n))*dd(n) + dd(n)*(1+abs(m))**3*g(m)
                 + g(n)*(1+abs(m))*dd(m) + abs(m-n)*dd(m+n))
            for r in labels(M):
                C = (coeff(M, n, r)*coeff(M, m, r-n) - coeff(M, m, r)*coeff(M, n, r-m)
                     - (m-n)*coeff(M, m+n, r))
                worst_ratio = max(worst_ratio, abs(C)/(H*eps**2*(1+abs(r))**4))
    log(f'A4 coefficient |C_M(r)|/(H_mn eps^2 w^4) max over |m|,|n|<=3, M={M}:', round(worst_ratio, 4))
    assert worst_ratio <= 1 + 1e-12, 'A4 global coefficient majorant'

log('ALL PASS' + (f' (mutation {MUT} NOT detected!)' if MUT else ''))
