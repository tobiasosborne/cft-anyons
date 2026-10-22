"""Reviewer's independent checks for E3 (REVIEW.md); run from the repo root.

Independent of check_seams.py / check_categories.py: own bending code with
explicit associators, own permutation arithmetic, random Schur tests.
Categories are calibration instances only (AGENTS.md Rule 16).
Vec_G^omega: references/text/PenneysUnitaryFusionCategories.md:285-287
(alpha_{g,h,k} = omega(g,h,k) id), duality :400-410.
"""
import itertools
import sys
import numpy as np
import sympy as S
from sympy.combinatorics import Permutation

rng = np.random.default_rng(20261022)
TOL = 1e-10


def check(cond, msg):
    if not cond:
        raise AssertionError(msg)
    print('PASS', msg)


# ---------- 1. Vec_G^omega bending with explicit associators ----------------
def make_cocycle(n, p):
    """Normalized U(1) 3-cocycle on Z_n: exp(2 pi i p a (b+c-[b+c]) / n^2)."""
    return lambda a, b, c: np.exp(2j*np.pi*p*a*(b + c - (b + c) % n)/n**2)


def vec_zn(n, p, S_set):
    om = make_cocycle(n, p)
    for a, b, c, d in itertools.product(range(n), repeat=4):  # pentagon
        lhs = om(b, c, d)*om(a, (b+c) % n, d)*om(a, b, c)
        rhs = om((a+b) % n, c, d)*om(a, b, (c+d) % n)
        assert abs(lhs-rhs) < TOL
    inv = lambda a: (-a) % n
    kap = {a: 1.0+0j for a in S_set}
    eps = {a: 1/om(a, inv(a), a) for a in S_set}           # zigzag 1
    for b in S_set:                                         # zigzag 2
        assert abs(kap[b]*eps[b]/om(inv(b), b, inv(b)) - 1) < TOL
    return om, inv, kap, eps


def rot_kernel(T, n, p, S_set, sigma_off=None):
    """K_s(T)=s^dag rot(T) on W_+ = O (x) barO, basis (p,q)<->e_p(x)e*_q."""
    om, inv, kap, eps = vec_zn(n, p, S_set)
    idx = {(a, b): i for i, (a, b) in enumerate(itertools.product(S_set, S_set))}
    phi = lambda a, b, c, d: om(a, b, (c+d) % n)/om(b, c, d)
    m = len(idx)
    rot = np.zeros((m, m), complex)   # rows: e*_i (x) e_k in W_-; cols e_p(x)e*_q
    for (pp, q), col in idx.items():
        for i in S_set:
            for k in S_set:
                amp = T[idx[(k, q)], idx[(i, pp)]]
                if amp == 0:
                    continue
                rot[idx[(i, k)], col] += (np.conj(eps[i])*phi(inv(i), i, pp, inv(q))
                                          * amp/phi(inv(i), k, q, inv(q))*np.conj(kap[q]))
    s = np.zeros((m, m), complex)     # s: e_p(x)e*_q -> sigma e*_q(x)e_p
    for (pp, q), col in idx.items():
        sig = np.conj(eps[pp])/kap[pp] if pp == q else (sigma_off or {}).get((pp, q), 1)
        s[idx[(q, pp)], col] = sig
    u = np.array([kap[a] if a == b else 0 for (a, b) in idx], complex)
    evd = np.array([np.conj(eps[a]) if a == b else 0 for (a, b) in idx], complex)
    assert np.allclose(s @ u, evd) and np.allclose(s.conj().T @ s, np.eye(m))
    return s.conj().T @ rot, u, idx


def tile_check():
    for (n, p, S_set) in [(2, 1, [0, 1]), (3, 1, [0, 1]), (3, 2, [0, 1, 2])]:
        m = len(S_set)**2
        K1, u, idx = rot_kernel(np.eye(m), n, p, S_set)
        check(np.allclose(K1, np.outer(u, u.conj())),
              f'Vec_Z{n}^omega(p={p}), O={S_set}: K_s(1)=u u^dag (E3-L <1>1) with associators')
    # omega genuinely enters: hopping tile e_0 e_1 <-> e_1 e_0 on Z_2, O=1+g.
    S_set = [0, 1]
    idx2 = {(a, b): i for i, (a, b) in enumerate(itertools.product(S_set, S_set))}
    hop = np.zeros((4, 4))
    hop[idx2[(1, 0)], idx2[(0, 1)]] = hop[idx2[(0, 1)], idx2[(1, 0)]] = 1
    gg = np.zeros((4, 4)); gg[idx2[(1, 1)], idx2[(1, 1)]] = 1
    for h, name in [(hop, 'hop'), (gg, 'P_gg')]:
        K0 = rot_kernel(h, 2, 0, S_set)[0]
        K1 = rot_kernel(h, 2, 1, S_set)[0]
        print(f'  {name}: K(omega=1)=\n{np.round(K0.real, 6)}\n  K(omega=semion)=\n{np.round(K1.real, 6)}')
    # Generic grade-preserving T: omega changes K beyond the s-gauge (singular
    # values move), but the vacuum block (a,a),(b,b) equals T_(ab),(ab) for
    # pointed multiplicity-free O, independent of omega.
    for (n, p, S_set) in [(2, 1, [0, 1]), (3, 1, [0, 1, 2])]:
        idx = {(a, b): i for i, (a, b) in enumerate(itertools.product(S_set, S_set))}
        m = len(idx)
        T = np.zeros((m, m), complex)
        for x in idx:
            for y in idx:
                if sum(x) % n == sum(y) % n:
                    T[idx[x], idx[y]] = rng.normal() + 1j*rng.normal()
        K0 = rot_kernel(T, n, 0, S_set)[0]; K1 = rot_kernel(T, n, p, S_set)[0]
        sv = lambda K: np.linalg.svd(K, compute_uv=False)
        check(not np.allclose(sv(K0), sv(K1)),
              f'Vec_Z{n}^omega: cocycle changes K_s(T) beyond left s-gauge (singular values differ)')
        vac = [idx[(a, a)] for a in S_set]
        diagT = np.array([[T[idx[(a, b)], idx[(a, b)]] for b in S_set] for a in S_set])
        check(np.allclose(K1[np.ix_(vac, vac)], diagT) and np.allclose(K0[np.ix_(vac, vac)], diagT),
              f'Vec_Z{n}^omega: vacuum block of K_s(T) = [T_(ab),(ab)], omega-independent')

    # E3-N transferred to a CONNECTED site O=1+g (convention (r)), cocycle on:
    for (n, p) in [(2, 1), (3, 1)]:
        Zs = np.diag([1., -1.]); t = 0.2
        T = np.eye(4) - t*np.kron(Zs, Zs)
        K = rot_kernel(T, n, p, [0, 1])[0]
        check(np.allclose(K, K.conj().T) and np.linalg.eigvalsh(K).min() < -t,
              f'Vec_Z{n}^omega, connected O=1+g: h=-Z(x)Z (Z=P_1-P_g) self-adjoint, K_s(1+th) has eigenvalue -2t')


# ---------- 2. Schur-complement criterion (E3-L) on random data --------------
def schur_check(trials=300):
    for _ in range(trials):
        dim = rng.integers(2, 6)
        d_O = rng.uniform(0.5, 4)
        r = rng.integers(1, dim)            # rank of C on QH (dim-1)
        X = rng.normal(size=(dim-1, r)) + 1j*rng.normal(size=(dim-1, r))
        C = X @ X.conj().T
        b = C @ (rng.normal(size=dim-1) + 1j*rng.normal(size=dim-1))
        a = rng.normal()*3
        A = np.zeros((dim, dim), complex)
        A[0, 0] = a; A[1:, 0] = b; A[0, 1:] = b.conj(); A[1:, 1:] = C
        P = np.zeros((dim, dim)); P[0, 0] = 1
        gap = b.conj() @ np.linalg.pinv(C) @ b - a
        for t in rng.uniform(0, 5, size=6):
            lam = np.linalg.eigvalsh(d_O*P + t*A).min()
            pred = d_O - t*gap.real >= -1e-9
            if pred != (lam >= -1e-8):
                raise AssertionError((t, lam, gap))
    # range violation: b not in Ran C fails for every t>0
    A = np.array([[0, 0, 1], [0, 1, 0], [1, 0, 0]], float)  # C=diag(1,0), b=(0,1)
    P = np.diag([1., 0, 0])
    check(all(np.linalg.eigvalsh(P + t*A).min() < 0 for t in [1e-6, 1e-3, 0.1, 1]),
          'E3-L range condition: b outside Ran C fails at every tested t>0')
    check(True, f'E3-L Schur criterion (5) matches eigenvalue test on {trials} random pencils')


# ---------- 3. Vec: Hermiticity of K <=> flip-reflection invariance ---------
def kernel_vec(T, n):
    return np.array([[T[i*n+l, k*n+j] for j in range(n) for l in range(n)]
                     for i in range(n) for k in range(n)])


def herm_check(trials=200):
    n = 2
    Pm = np.zeros((n*n, n*n))
    for i, j in itertools.product(range(n), repeat=2):
        Pm[i*n+j, j*n+i] = 1
    for _ in range(trials):
        h = rng.normal(size=(4, 4)) + 1j*rng.normal(size=(4, 4))
        if rng.random() < 0.5:
            h = (h + Pm @ h.conj().T @ Pm)/2          # Theta_x-invariant part
        K = kernel_vec(h, n)
        invariant = np.allclose(Pm @ h.conj().T @ Pm, h)
        assert invariant == np.allclose(K, K.conj().T)
    check(True, 'Vec: K_flip(h) Hermitian iff P h^dag P = h (spatial, not temporal, dagger pairing)')
    Z = np.diag([1., -1]); h = -np.kron(Z, Z); t = 0.3
    ev = np.linalg.eigvalsh(kernel_vec(np.eye(4) + t*h, 2))
    check(np.allclose(sorted(ev), sorted([2, -2*t, 0, 0])),
          'E3-N <1>2: spectrum of K(1+t h) for h=-Z(x)Z is {2,-2t,0,0}')
    # Same h, reflection composed with the on-site flip X (s' = s (X (x) Xbar)):
    X = np.array([[0., 1], [1, 0]]); W = np.kron(X, X)   # W vec(1)=vec(1), W vec(Z)=-vec(Z)
    Kp = W.conj().T @ kernel_vec(np.eye(4) + t*h, 2)
    check(np.allclose(W @ np.eye(2).reshape(4), np.eye(2).reshape(4)) and
          np.allclose(Kp, Kp.conj().T) and np.linalg.eigvalsh(Kp).min() > -TOL and
          np.allclose(np.kron(X, X) @ h @ np.kron(X, X), h),
          'E3-N <1>2 is pairing-specific: with Theta_x composed with global X, K_s\'(1-tZZ)>=0')
    E = np.array([[0, 1], [0, 0]]); h = np.kron(E, E.T)
    check(np.linalg.eigvalsh(kernel_vec(np.eye(4)+t*h, 2)).min() > -TOL and not np.allclose(h, h.T.conj()),
          'E3-N <1>3: non-self-adjoint h with PSD spatial kernel')


# ---------- 4. Vec_S3 port multiplicities, both composition conventions -----
def s3_check():
    G = [Permutation(list(p)) for p in itertools.permutations(range(3))]
    e, a, b = Permutation([0, 1, 2]), Permutation([1, 0, 2]), Permutation([1, 2, 0])
    for name, O in [('O=1+(12)+(123) [not self-dual]', [e, a, b]),
                    ('O=1+(12)+(13)+(23) [self-dual]', [e, a, Permutation([2, 1, 0]), Permutation([0, 2, 1])])]:
        res = []
        for mul in [lambda x, y: x*y, lambda x, y: y*x]:
            plus = sorted(str(mul(x, ~y)) for x in O for y in O)
            minus = sorted(str(mul(~x, y)) for x in O for y in O)
            res.append(plus == minus)
        print(f'  Vec_S3 {name}: W_+ ~ W_- multiplicities equal? {res}')
        if 'not' in name:
            check(not any(res), 'Vec_S3 non-self-dual O: no unitary s:W_+->W_- (either convention)')
        else:
            check(all(res), 'Vec_S3 self-dual O: port multiplicities agree (s can exist at L0)')


# ---------- 5. Opposite-sweep cubic commutator (12) -------------------------
def bch_check():
    from scipy.linalg import expm
    A = rng.normal(size=(4, 4)); B = rng.normal(size=(4, 4))
    cm = lambda x, y: x@y - y@x
    pred = -cm(A+B, cm(A, B))
    for dlt in [1e-2, 5e-3]:
        X = expm(dlt*A)@expm(dlt*B); Y = expm(dlt*B)@expm(dlt*A)
        rel = np.linalg.norm(cm(X, Y)/dlt**3 - pred)/np.linalg.norm(pred)
        assert rel < 50*dlt, rel
    check(True, '(12): [e^{dA}e^{dB}, e^{dB}e^{dA}] = -d^3[A+B,[A,B]] + O(d^4) (random 4x4)')


if __name__ == '__main__':
    print('Python', sys.version.split()[0], 'NumPy', np.__version__, 'SymPy', S.__version__)
    tile_check()
    schur_check()
    herm_check()
    s3_check()
    bch_check()
