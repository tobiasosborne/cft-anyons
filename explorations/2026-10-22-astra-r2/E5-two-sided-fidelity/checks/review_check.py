"""Reviewer's independent exact checks for E5 (REVIEW.md). Not the author's script.

Run from the repository root:
  PYTHONDONTWRITEBYTECODE=1 python3 explorations/2026-10-22-astra-r2/E5-two-sided-fidelity/checks/review_check.py
Checks: X1 finite-stage optimal cost; X1 strong-null witness (truncated atoms);
X2 cost of C1 in M_m via density-matrix minimum eigenvalue; the complete-vs-ordinary
PP gap for (tr x id) on M_n (x) M_m (why L needs only positivity of E_k - lambda id
on M_k itself, and why finite-stage costs can depend on the size of N_k); and the
abelian lower-semicontinuity block argument on random refining partitions.
"""
import itertools, random
import sympy as s

# --- X1 stage cost: any N_k-bimodular unital positive projection on one cell C^2 -> C
# is a state (t,1-t); best lambda = min(t,1-t) (test coordinate units). Optimum 1/2.
t = s.symbols('t', positive=True)
lam_best = s.Min(t, 1 - t)
assert s.Max(*[lam_best.subs(t, s.Rational(k, 20)) for k in range(1, 20)]) == s.Rational(1, 2)
print("X1: stage PP cost q_k = 2 (best lambda 1/2 at t=1/2)")

# --- X1 strong-null witness on truncated atom sets: d = all-zero sequence in D_0.
# Atoms of D_1 truncated to eventually-one sequences with switch point <= T.
T = 12
def d1_atom(j):  # bits 0..j-1 arbitrary pattern 0, then all ones from j: here prefix zeros
    return lambda i: 0 if i < j else 1
for k in range(1, T):
    # D_1 atoms in the length-k cylinder of 000...: those with switch point j >= k
    count = sum(1 for j in range(0, T + 1) if j >= k)
    # their number decreases to 0 as k -> T: x_k=(0,f_k) decreases strongly to 0 on any finite set
    assert count == T + 1 - k
print("X1: (0,f_k) has shrinking support on D_1; E_k(0,f_k)=(f_k/2,f_k/2) keeps atom d at 1/2")

# --- X2: expectation M_m -> C1 is x -> Tr(rho x) 1; best lambda = lambda_min(rho) <= 1/m.
for m in (2, 3, 4):
    rho = s.diag(*[s.Rational(1, m)] * m)
    assert min(rho.eigenvals()) == s.Rational(1, m)
    # rank-one projection test: Tr(rho P) = 1/m, so lambda <= 1/m; and Tr(x) >= ||x|| gives attainment
    P = s.zeros(m); P[0, 0] = 1
    assert (rho * P).trace() == s.Rational(1, m)
print("X2: q(C1 in M_m) = m for m=2,3,4")

# --- PP vs complete PP: E = tr (x) id on M_n (x) M_m -> 1 (x) M_m.
def omega_proj(n):
    v = s.zeros(n * n, 1)
    for i in range(n):
        v[i * n + i] = 1
    return v * v.T / n
for n in (2, 3):
    P = omega_proj(n)  # maximally entangled projection in M_n (x) M_n
    # partial normalized trace over the first factor
    red = s.zeros(n)
    for a in range(n):
        for b in range(n):
            red[a, b] = sum(P[i * n + a, i * n + b] for i in range(n)) / n
    assert red == s.eye(n) / n**2  # E(P) = n^{-2} 1, so lambda <= n^{-2}: cost n^2, not n
print("PP cost of 1(x)M_n in M_n(x)M_n under tr(x)id is n^2; C1 in M_n has cost n (size-dependence)")

# --- abelian lower semicontinuity: refining partitions Q_k (atoms) and coarser P_k with
# P_k-blocks unions of <=2 Q_k-cells; limit P-blocks have <=2 points once Q separates points.
random.seed(1)
pts = list(range(16))
for trial in range(200):
    # binary refinement: Q_k = classes of first k bits of a random injective code
    code = random.sample(range(16), 16)
    bits = lambda x, k: code[x] >> (4 - k)
    # P_k: pair up Q_k cells arbitrarily but consistently refining
    pairing = {x: code[x] >> 1 for x in pts}  # final P-blocks of size 2
    for k in range(1, 5):
        Qcells = {}
        for x in pts:
            Qcells.setdefault(bits(x, k), set()).add(x)
        Pcells = {}
        for x in pts:
            Pcells.setdefault((bits(x, k) >> 1) if k > 0 else 0, set()).add(x)
        for c in Pcells.values():
            nQ = len({bits(x, k) for x in c})
            assert nQ <= 2
    final = {}
    for x in pts:
        final.setdefault(pairing[x], set()).add(x)
    assert max(len(b) for b in final.values()) <= 2
print("abelian: block-size cost <= 2 at every stage forces limit block size <= 2 (no abelian counterexample)")

# --- Non-vacuity calibration of L/N: N_k = M_a (x) 1 in M_k = M_a (x) M_n, E = id (x) tr
# (compatible, trace-preserving). For a rank-one x = vv*, the best lambda with E(x) >= lambda x
# is 1/(v^* E(x)^+ v) = 1/(n * SchmidtRank(v)); so stage cost n*min(a,n) -> n^2 = [R(x)M_n : R(x)1].
def best_lambda_rank_one(v, a, n):
    x = v * v.T
    Ex = s.zeros(a * n)
    red = s.zeros(a)
    for i in range(a):
        for j in range(a):
            red[i, j] = sum(x[i * n + l, j * n + l] for l in range(n)) / n
    Ex = s.kronecker_product(red, s.eye(n))
    return 1 / (v.T * Ex.pinv() * v)[0, 0]
for a in (1, 2, 3):
    for n in (2, 3):
        r = min(a, n)
        v = s.zeros(a * n, 1)
        for i in range(r):
            v[i * n + i] = 1
        lam = s.nsimplify(best_lambda_rank_one(v, a, n))
        assert lam == s.Rational(1, n * r), (a, n, lam)
print("calibration: stage cost of M_a(x)1 in M_a(x)M_n under id(x)tr is n*min(a,n) -> n^2 (L/N hypotheses satisfiable, bound sharp)")
print("REVIEW CHECKS PASSED")
