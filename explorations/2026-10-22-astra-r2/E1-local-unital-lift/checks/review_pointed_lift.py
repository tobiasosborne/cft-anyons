"""REVIEWER check (Opus proof-checker, 2026-10-22), not part of the E1 note.
Run from repo root:  OPENBLAS_NUM_THREADS=1 python3 -I <this path>
numpy only; largest matrix 729 x 729 (coarse L<=3, fine 2L<=6 sites); no diagonalisation.

Purpose: independent test of NOTE.md E1.1/E1.2/E1.5 on degenerate inputs the note's
Fibonacci calibration does not reach (Rule 16: instances only):
  I1  Vec_{Z3}, bicharacter braiding, O = 1+g          (X non-self-dual)
  I2  semion Vec_{Z2}^omega, R=i, O = 1+g+g             (nontrivial associator, multiplicity 2)
  I3  Vec_{Z2}^omega semion braiding, O = 1+1'+g        (unit summand inside X)
  I4  Vec_{Z3}^omega, omega nontrivial, O = 1+g         (NOT braided: E1.5 half-braiding route)
plus mutations that must fail (non-natural crossing phases, label-preserving crossing,
non-central point), the 'no braiding exists' claim for I4, and the E1.7 circuit schedule.

Model: skeletal Vec_{Z_n}^omega, left-associated chain basis = words of letters
(grade, label); associator alpha_{a,b,c} = omega(a,b,c) * id; omega normalised.
Interval embedding (1_U (x) a' (x) 1_W): conjugate by Phi(P;v)=prod_r omega(P,V_{r-1},v_r),
P = prefix grade.  Crossing t_Y: Y (x) O -> O (x) Y of adjacent letters (a,b) -> phase(a,b) (b,a).
The pentagon is asserted (catches convention bugs) via embedding coherence.
"""
import itertools as it
import platform
import sys
import numpy as np

TOL = 1e-10


def close(a, b, label):
    err = np.max(np.abs(a - b)) if a.size else 0.0
    assert err <= TOL, f'{label}: max entry error {err:.3e}'


class Pointed:
    def __init__(self, n, omega, letters):
        self.n, self.omega, self.letters = n, omega, letters  # letters: list of (grade,label)
        self._basis = {}
        self._diag = {}

    def basis(self, m):
        if m not in self._basis:
            self._basis[m] = list(it.product(range(len(self.letters)), repeat=m))
        return self._basis[m]

    def g(self, word):
        return sum(self.letters[x][0] for x in word) % self.n

    def phi(self, P, v):
        ph, V = 1.0 + 0j, None
        for r, x in enumerate(v):
            if r > 0:
                ph *= self.omega(P, V, self.letters[x][0])
            V = self.letters[x][0] if r == 0 else (V + self.letters[x][0]) % self.n
        return ph

    def embed(self, a, start, m, M):
        """a acts on m-letter words (left-assoc); place it on sites start..start+m-1 (0-based).
        E = D^* (1 (x) a (x) 1) D with D = diag Phi(prefix grade, middle word)."""
        key = (start, m, M)
        if key not in self._diag:
            self._diag[key] = np.array([self.phi(self.g(w[:start]), w[start:start + m])
                                        for w in self.basis(M)])
        d = self._diag[key]
        k = len(self.letters)
        full = np.kron(np.kron(np.eye(k ** start), a), np.eye(k ** (M - start - m)))
        return np.conj(d)[:, None] * full * d[None, :]

    def is_morphism(self, a, m):
        gr = np.array([self.g(w) for w in self.basis(m)])
        return np.max(np.abs(a[gr[:, None] != gr[None, :]]), initial=0.0) <= TOL

    def randmor(self, m, rng):
        gr = np.array([self.g(w) for w in self.basis(m)])
        a = rng.normal(size=(len(gr), len(gr))) + 1j * rng.normal(size=(len(gr), len(gr)))
        return a * (gr[:, None] == gr[None, :])

    def units(self, m):
        B = self.basis(m)
        for i, w in enumerate(B):
            for j, v in enumerate(B):
                if self.g(w) == self.g(v):
                    e = np.zeros((len(B), len(B)), complex)
                    e[i, j] = 1
                    yield e

    def crossing(self, phase, M, s):
        """t on sites s,s+1: (old a, new b) -> phase(a,b) (b,a); label of each strand travels with it."""
        B2 = self.basis(2)
        pos = {w: i for i, w in enumerate(B2)}
        loc = np.zeros((len(B2), len(B2)), complex)
        for j, (a, b) in enumerate(B2):
            loc[pos[(b, a)], j] = phase(a, b)
        return self.embed(loc, s, 2, M)

    def B(self, phase, L):
        """sequential one-gap composite of NOTE E1.2: beta_(M_i,s_i), s_i = 2i-1 (1-based)."""
        U = np.eye(len(self.basis(L)), dtype=complex)
        for i in range(1, L + 1):
            M = L + i - 1
            # b_(M,s): new strand appended at 0-based position M, moved left to 0-based position 2i-1
            b = np.eye(len(self.basis(M + 1)), dtype=complex)
            for p in range(M - 1, 2 * i - 2, -1):   # cross sites p,p+1 (0-based), new strand moves left
                b = self.crossing(phase, M + 1, p) @ b
            U = b @ self.embed(U, 0, M, M + 1)
        return U

    def V(self, L, vac=0):
        Bc, Bf = self.basis(L), self.basis(2 * L)
        pos = {w: i for i, w in enumerate(Bf)}
        out = np.zeros((len(Bf), len(Bc)), complex)
        for j, w in enumerate(Bc):
            out[pos[tuple(x for c in w for x in (c, vac))], j] = 1
        return out


def extract(cat, X, start, m, M):
    """Read off the would-be local block from the all-vacuum context, then re-embed."""
    B, Bm = cat.basis(M), cat.basis(m)
    pos = {w: i for i, w in enumerate(B)}
    Y = np.zeros((len(Bm), len(Bm)), complex)
    ctx = lambda v: (0,) * start + v + (0,) * (M - start - m)
    for i, v in enumerate(Bm):
        for j, w in enumerate(Bm):
            Y[i, j] = X[pos[ctx(v)], pos[ctx(w)]]
    return Y


def is_local(cat, X, start, m, M):
    Y = extract(cat, X, start, m, M)
    return np.max(np.abs(cat.embed(Y, start, m, M) - X)) <= TOL


def run_lift(cat, phase, L, name, expect_pass=True):
    U = cat.B(phase, L)
    close(U.conj().T @ U, np.eye(len(U)), f'{name}: B unitary')
    V = cat.V(L)
    alpha = lambda a: U @ cat.embed(a, 0, L, 2 * L) @ U.conj().T
    N = lambda M: np.diag([sum(cat.letters[x][0] != 0 or cat.letters[x][1] != 0 for x in w)
                           for w in cat.basis(M)]).astype(complex)
    NL, N2L = N(L), N(2 * L)
    ok = True
    rng = np.random.default_rng(7)
    for j in range(L):                      # coarse 0-based start
        for m in range(1, L - j + 1):
            # random Gaussian morphisms: a linear subspace contains a generic element of a space
            # only if it contains the space (probability-one test of the linear support claim)
            for a in [cat.randmor(m, rng) for _ in range(3)]:
                A = cat.embed(a, j, m, L)
                X = alpha(A)
                close(X @ V, V @ A, f'{name}: intertwining')
                if not cat.is_morphism(X, 2 * L):
                    raise AssertionError(f'{name}: image not a C-morphism')
                loc = is_local(cat, X, 2 * j, 2 * m - 1, 2 * L)
                ok &= loc
                if expect_pass:
                    assert loc, f'{name}: support [2j-1,2k-1] fails at j={j+1}, m={m}'
                    close(N2L @ X - X @ N2L, alpha(NL @ A - A @ NL), f'{name}: grading')
    if expect_pass:
        for _ in range(4):
            a, e = cat.randmor(L, rng), cat.randmor(L, rng)
            close(alpha(a @ e), alpha(a) @ alpha(e), f'{name}: multiplicative')
            close(alpha(a.conj().T), alpha(a).conj().T, f'{name}: dagger')
        close(alpha(np.eye(len(cat.basis(L)))), np.eye(len(cat.basis(2 * L))), f'{name}: unital')
    return ok


def omega_cyclic(n, p):
    w = lambda a, b, c: np.exp(2j * np.pi * p * a * (b + c - ((b + c) % n)) / n**2)
    return w


def check_pentagon(cat):
    n, w = cat.n, cat.omega
    for a, b, c, d in it.product(range(n), repeat=4):
        lhs = w((a + b) % n, c, d) * w(a, b, (c + d) % n)
        rhs = w(a, b, c) * w(a, (b + c) % n, d) * w(b, c, d)
        assert abs(lhs - rhs) < TOL, 'pentagon'
    # embedding coherence: a 2-site op inside a 3-site block, block into a 4-site chain
    for a in list(cat.units(2))[:6]:
        direct = cat.embed(a, 2, 2, 4)
        via = cat.embed(cat.embed(a, 1, 2, 3), 1, 3, 4)
        close(direct, via, 'embedding coherence')


def main():
    print('python', platform.python_version(), 'numpy', np.__version__)
    trivial = lambda a, b, c: 1.0
    # I1: Vec_Z3, bicharacter braiding, X = g non-self-dual
    z3 = Pointed(3, trivial, [(0, 0), (1, 0)])
    om = np.exp(2j * np.pi / 3)
    br = lambda a, b: om ** (z3.letters[a][0] * z3.letters[b][0])
    for L in (2, 3):
        run_lift(z3, br, L, f'I1 Vec_Z3 L={L}')
    print('PASS I1 Vec_Z3 (non-self-dual X): hom, unital, aV=Va, support [2j-1,2k-1], grading, L=2,3')
    roots = np.exp(2j * np.pi * np.arange(27) / 27)
    # L<=3 cannot see the g-g crossing phase on the 2-letter chain (it cancels in every
    # same-grade pair of words of length <=2); a block of three old sites does (ggg vs 000).
    scan = [k for k in range(27) if run_lift(
        z3, lambda a, b, k=k: roots[k] if (a, b) == (1, 1) else 1.0, 4, 'I1 scan', expect_pass=False)]
    print('I1 scan at L=4, g-g crossing phase exp(2 pi i k/27) passing support: k =', scan)
    assert scan == [0, 9, 18], 'I1 discrimination: expected exactly the three cube roots'
    # I2: semion, O = 1 + g + g (multiplicity 2); omega(1,1,1) = -1, R(g,g) = i (x) label flip
    sem = lambda a, b, c: -1.0 if (a, b, c) == (1, 1, 1) else 1.0
    s2 = Pointed(2, sem, [(0, 0), (1, 0), (1, 1)])
    check_pentagon(s2)
    Rs = lambda a, b: 1j if (s2.letters[a][0], s2.letters[b][0]) == (1, 1) else 1.0
    for L in (2, 3):
        run_lift(s2, Rs, L, f'I2 semion mult-2 L={L}')
    print('PASS I2 semion, O=1+2g (multiplicity, nontrivial associator): all lift properties, L=2,3')
    # mutation: phase-free crossings fail (hexagon violated by R=1 with omega=-1)
    ok = run_lift(s2, lambda a, b: 1.0, 3, 'I2 phase-free mutation', expect_pass=False)
    assert not ok, 'phase-free mutation escaped in semion'
    print('RED  I2 phase-free crossing: support claim fails (as it must)')
    # I3: unit inside X: O = 1 + 1' + g; eta into first unit copy
    s3 = Pointed(2, sem, [(0, 0), (0, 1), (1, 0)])
    Rs3 = lambda a, b: 1j if (s3.letters[a][0], s3.letters[b][0]) == (1, 1) else 1.0
    run_lift(s3, Rs3, 3, 'I3 unit-in-X L=3')
    print("PASS I3 semion, O=1+1'+g (unit summand in X): all lift properties, L=3")
    # I4: Vec_Z3^omega, p=1: find pointed half-braidings of O=1+g by brute force over 27th roots
    w1 = omega_cyclic(3, 1)
    t4 = Pointed(3, w1, [(0, 0), (1, 0)])
    check_pentagon(Pointed(3, w1, [(0, 0), (1, 0), (2, 0)]))
    sols = [k for k in range(27) if run_lift(
        t4, lambda a, b, k=k: roots[k] if (a, b) == (1, 1) else 1.0, 4, 'I4 scan', expect_pass=False)]
    print('I4 Vec_Z3^omega, O=1+g: g-g crossing exponents k passing L=4 support:', sols)
    assert len(sols) == 3, 'I4: expected exactly three pointed half-braidings of 1+g'
    ph = lambda a, b: roots[sols[0]] if (a, b) == (1, 1) else 1.0
    run_lift(t4, ph, 4, 'I4 half-braiding L=4')
    print('PASS I4 Vec_Z3^omega (non-braided C), O=1+g, E1.5 crossing: all lift properties, L=4')
    # I4 is not braided: no family R(a,b), a,b in Z3, passes both one-sided naturality tests
    full = Pointed(3, w1, [(0, 0), (1, 0), (2, 0)])
    def natural(phase, M=3):
        # right strand moves left past a 2-letter block (t), and left strand moves right (other hexagon)
        Bm = list(full.units(2))
        T = full.crossing(phase, M, 0) @ full.crossing(phase, M, 1)          # new strand at site 2 -> 0
        for a in Bm:
            if np.max(np.abs(T @ full.embed(a, 0, 2, M) @ T.conj().T - full.embed(a, 1, 2, M))) > TOL:
                return False
        return True
    def natural_left(phase, M=3):
        Bm = list(full.units(2))
        T = full.crossing(phase, M, 1) @ full.crossing(phase, M, 0)          # strand at site 0 -> 2
        for a in Bm:
            if np.max(np.abs(T @ full.embed(a, 1, 2, M) @ T.conj().T - full.embed(a, 0, 2, M))) > TOL:
                return False
        return True
    per_new = {}
    for b in (1, 2):   # half-braiding of letter b (as the moving right strand) with all old letters
        per_new[b] = []
        for k1, k2 in it.product(range(27), repeat=2):
            vals = {1: roots[k1], 2: roots[k2]}
            ph = lambda a, c, b=b, vals=vals: vals[a] if (c == b and a != 0) else 1.0
            Bm = list(full.units(2))
            T = full.crossing(ph, 3, 0) @ full.crossing(ph, 3, 1)
            good = True
            for a in Bm:
                X = T @ full.embed(a, 0, 2, 3) @ T.conj().T - full.embed(a, 1, 2, 3)
                # restrict to inputs (after-frame) whose moved strand, now at site 0, is b
                cols = [i for i, w in enumerate(full.basis(3)) if w[0] == b]
                if np.max(np.abs(X[:, cols])) > TOL:
                    good = False
                    break
            if good:
                per_new[b].append((k1, k2))
    braidings = 0
    for (k11, k21), (k12, k22) in it.product(per_new[1], per_new[2]):
        R = {(1, 1): roots[k11], (2, 1): roots[k21], (1, 2): roots[k12], (2, 2): roots[k22]}
        ph = lambda a, c, R=R: R.get((a, c), 1.0)
        if natural(ph) and natural_left(ph):
            braidings += 1
    print('I4 half-braidings per object (27th-root grid):', {b: len(v) for b, v in per_new.items()},
          '; braidings passing both naturalities:', braidings)
    assert braidings == 0, 'I4 unexpectedly braided'
    k1 = per_new[1][0]
    k2 = per_new[2][0]
    # the g-g phases of g's half-braidings on the full Z3 alphabet are exactly the 2-letter chain solutions
    assert {v[0] for v in per_new[1]} == set(sols), (per_new[1], sols)
    hb = {(1, 1): roots[k1[0]], (2, 1): roots[k1[1]], (1, 2): roots[k2[0]], (2, 2): roots[k2[1]]}
    run_lift(full, lambda a, c: hb.get((a, c), 1.0), 3, 'I4b O=1+g+g^2 L=3')
    bad = dict(hb)
    bad[(1, 1)] = hb[(1, 1)] * roots[1]
    ok = run_lift(full, lambda a, c: bad.get((a, c), 1.0), 3, 'I4b mutation', expect_pass=False)
    assert not ok, 'I4b mutation escaped'
    print('PASS I4b O=1+g+g^2 (X = g+gbar) with relative half-braiding: all lift properties, L=3;',
          'RED mutated phase fails support')
    # control: trivial omega on Z3 admits braidings on the same grid
    ctl = Pointed(3, trivial, [(0, 0), (1, 0), (2, 0)])
    R0 = lambda a, c: om ** (a * c)
    full_backup = full
    full = ctl
    assert natural(R0) and natural_left(R0), 'control braiding failed'
    full = full_backup
    print('PASS I4 is not braided on the 27th-root grid (control: Vec_Z3 bicharacter passes)')
    # non-central point (note's Vec_Z2 example): chi(g)=-1 on the vacuum summand
    z2 = Pointed(2, trivial, [(0, 0), (1, 0)])
    nc = lambda a, b: -1.0 if (z2.letters[a][0], z2.letters[b][0]) == (1, 0) else 1.0
    U = z2.B(nc, 2)
    V = z2.V(2)
    pos = {w: i for i, w in enumerate(z2.basis(2))}
    hop = np.zeros((4, 4), complex)
    hop[pos[(1, 0)], pos[(0, 1)]] = 1
    X = U @ z2.embed(hop, 0, 2, 4) @ U.conj().T
    close(X @ V, -V @ hop, 'non-central point gives alpha(h)V = -Vh')
    print('PASS note example: non-central eta gives alpha(h)V = -V h (intertwining fails)')
    # E1.7 schedule: layer t crosses positions p,p+1 with p = L-t+2i-1, i=1..t (1-based)
    for L in range(1, 14):
        strands = [('o', j) for j in range(1, L + 1)] + [('n', i) for i in range(1, L + 1)]
        crossed = set()
        for t in range(1, L):
            used = set()
            for i in range(1, t + 1):
                p = L - t + 2 * i - 1
                assert p not in used and p + 1 not in used
                used |= {p, p + 1}
                x, y = strands[p - 1], strands[p]
                assert x[0] == 'o' and y[0] == 'n' and x[1] > y[1], (L, t, i, x, y)
                assert x[1] == L + y[1] - t
                crossed.add((x[1], y[1]))
                strands[p - 1], strands[p] = y, x
        target = [s for j in range(1, L + 1) for s in (('o', j), ('n', j))]
        assert strands == target and len(crossed) == L * (L - 1) // 2
    print('PASS E1.7 schedule: disjoint adjacent old/new crossings, each i<j once, interleaved, L<=13')


if __name__ == '__main__':
    main()
