"""Independent reviewer checks for G6 (2026-10-27). NumPy, no network.

Run:  python3 -I review_g6_checks.py            (expected: all PASS lines, GREEN)
      python3 -I review_g6_checks.py --mutation chi_both_s1
      python3 -I review_g6_checks.py --mutation chi_target_only
      python3 -I review_g6_checks.py --mutation shift_per_site
Each mutation must end in an AssertionError (RED).

Scope (scoped conventions, not global): Hilb_fd(Z_q) with trivial associator,
grades additive mod q, unit grade 0. Site basis = list of grades (multiplicity
labels = list positions). A relative transport is t_Y(y (x) v) = chi(y,v) v (x) y
for a bicharacter chi on Z_q (chi(y,0)=1 gives the point identity; chi
multiplicative in y gives tensoriality; grade-preserving because Z_q abelian).
chi = 1 is the note's flip. B_L is built INDEPENDENTLY of the note's script:
by explicit adjacent crossings old_j x new_i (i<j), each carrying its chi phase,
as a monomial matrix, and every identity is checked on dense matrices.

Parts:
 A  G6-B intertwining (trailing, every interval [j,k], delta) for B1/B2 instances.
 B  Mechanism test: chi-twisted H; translation by s works iff s is chi-transparent
    in the tested cases (claimed by the reviewer only for these instances).
 C  Point-augmented record: block size of the all-vacancy minimal projection
    p_1...p_L in A_L. Different sizes => no record isomorphism preserving the p_j.
 D  G6-C1: gamma = Ad(1 (x) u^{(x)(L-1)}) commutes with delta, fixes p_j,
    moves translation T and the hop h.
"""
import argparse
import itertools
import numpy as np

TOL = 1e-12


def words(d, L):
    return list(itertools.product(range(d), repeat=L))


def index(w, d):
    i = 0
    for x in w:
        i = i * d + x
    return i


def mono_kron(A, B):
    (pa, fa), (pb, fb) = A, B
    nb = len(pb)
    return ((pa[:, None] * nb + pb[None, :]).ravel(), (fa[:, None] * fb[None, :]).ravel())


def mono_pow(M, L):
    out = (np.zeros(1, dtype=int), np.ones(1, dtype=complex))
    for _ in range(L):
        out = mono_kron(out, M)
    return out


def mono_eye(n):
    return (np.arange(n), np.ones(n, dtype=complex))


def conj(M, X):
    """M X M^dagger for monomial M = sum_i phase[i] |perm[i]><i|."""
    perm, ph = M
    Y = np.zeros(X.shape, dtype=complex)
    Y[np.ix_(perm, perm)] = ph[:, None] * X * np.conj(ph)[None, :]
    return Y


def mono_is_unitary(M):
    perm, ph = M
    return sorted(perm.tolist()) == list(range(len(perm))) and np.allclose(np.abs(ph), 1)


def shuffle(grades, q, L, chi):
    """B_L: W_L (x) W_L -> W_2L by adjacent crossings old_j over new_i, i<j."""
    d = len(grades)
    n = d ** (2 * L)
    perm = np.zeros(n, dtype=int)
    phase = np.ones(n, dtype=complex)
    for w in words(d, 2 * L):
        seq = [('o', j, w[j]) for j in range(L)] + [('n', i, w[L + i]) for i in range(L)]
        ph = 1.0 + 0j
        for i in range(L):
            pos = next(p for p, s in enumerate(seq) if s[0] == 'n' and s[1] == i)
            while pos > 2 * i + 1:  # 0-based target position of new_i is 2i+1
                left, right = seq[pos - 1], seq[pos]
                assert left[0] == 'o' and left[1] > i, 'only old_j with j>i is crossed'
                ph *= chi(grades[left[2]], grades[right[2]])  # t_O on old (x) new
                seq[pos - 1], seq[pos] = right, left
                pos -= 1
        out = tuple(s[2] for s in seq)
        assert [s[0] for s in seq] == ['o', 'n'] * L
        perm[index(w, d)] = index(out, d)
        phase[index(w, d)] = ph
    return (perm, phase)


def site_unitary(src, tgt, s, q):
    """U: basis of O -> basis of O' carrying grade a to a+s, keeping multiplicity order."""
    used, perm = set(), []
    for g in src:
        j = min(j for j in range(len(tgt)) if j not in used and tgt[j] == (g + s) % q)
        used.add(j)
        perm.append(j)
    return (np.array(perm), np.ones(len(src), dtype=complex))


def word_grades(grades, q, L):
    d = len(grades)
    return np.array([sum(grades[x] for x in w) % q for w in words(d, L)])


def basis(grades, q, L):
    g = word_grades(grades, q, L)
    n = len(g)
    for a in range(n):
        for b in range(n):
            if g[a] == g[b]:
                E = np.zeros((n, n))
                E[a, b] = 1.0
                yield E


def is_categorical(X, grades, q, L):
    g = word_grades(grades, q, L)
    return np.all(np.abs(X[g[:, None] != g[None, :]]) < TOL)


def in_interval(X, grades, q, L, j, k):
    """X in 1_{W_{j-1}} (x) End_D(W_{k-j+1}) (x) 1_{W_{L-k}} (1-based j<=k)."""
    d = len(grades)
    a, n, c = d ** (j - 1), d ** (k - j + 1), d ** (L - k)
    T = X.reshape(a, n, c, a, n, c)
    b = np.einsum('ixkiyk->xy', T) / (a * c)
    rebuilt = np.kron(np.kron(np.eye(a), b), np.eye(c))
    return np.allclose(rebuilt, X, atol=TOL) and is_categorical(b, grades, q, k - j + 1)


def part_A_B(src, s, q, chi_src, chi_tgt, Lmax, label, mutation=None):
    tgt = tuple(sorted((g + s) % q for g in src))
    d = len(src)
    U = site_unitary(src, tgt, s, q)
    if mutation == 'shift_per_site':  # non-uniform: translate the 2nd site by 2s
        U2 = site_unitary(src, tgt, s, q)
        alt = site_unitary(src, tuple(sorted((g + 2 * s) % q for g in src)), 2 * s, q)
        Us = lambda L: mono_kron(U2, mono_pow(alt, L - 1)) if L > 1 else U2
    else:
        Us = lambda L: mono_pow(U, L)
    phi = lambda X, L: conj(Us(L), X)
    # trailing and categorical
    for L in range(1, Lmax + 2):
        for E in basis(src, q, L):
            Y = phi(E, L)
            assert is_categorical(Y, tgt, q, L), ('phi_L not into A_L', label, L)
            if L <= Lmax:
                assert np.allclose(phi(np.kron(E, np.eye(d)), L + 1), np.kron(Y, np.eye(d)), atol=TOL), ('trailing', label, L)
    # every named interval, onto (dimension count + membership)
    L = Lmax + 1
    nint = 0
    for j in range(1, L + 1):
        for k in range(j, L + 1):
            a, c = d ** (j - 1), d ** (L - k)
            for b in basis(src, q, k - j + 1):
                X = np.kron(np.kron(np.eye(a), b), np.eye(c))
                assert in_interval(phi(X, L), tgt, q, L, j, k), ('interval', label, j, k)
            dsrc = sum(1 for _ in basis(src, q, k - j + 1))
            dtgt = sum(1 for _ in basis(tgt, q, k - j + 1))
            assert dsrc == dtgt, ('interval dimension', label, j, k)
            nint += 1
    # dilation: phi_{2L} alpha_L = alpha'_L phi_L
    count = 0
    for L in range(1, Lmax + 1):
        B, Bp = shuffle(src, q, L, chi_src), shuffle(tgt, q, L, chi_tgt)
        assert mono_is_unitary(B) and mono_is_unitary(Bp)
        I = np.eye(d ** L)
        for E in basis(src, q, L):
            lhs = phi(conj(B, np.kron(E, I)), 2 * L)
            rhs = conj(Bp, np.kron(phi(E, L), I))
            assert np.allclose(lhs, rhs, atol=TOL), ('dilation', label, L)
            count += 1
    print(f'PASS {label}: O={src} -> O\'={tgt}; trailing+categorical L<={Lmax+1}; '
          f'{nint} intervals at L={Lmax+1} onto; {count} dilation identities (L<={Lmax})')


def mults(grades, q, L):
    g = word_grades(grades, q, L)
    return np.bincount(g, minlength=q)


def part_C(src, s, q, Lmax, label):
    tgt = tuple(sorted((g + s) % q for g in src))
    sizes = [(int(mults(src, q, L)[0]), int(mults(tgt, q, L)[0])) for L in range(1, Lmax + 1)]
    sep = next((L + 1 for L, (x, y) in enumerate(sizes) if x != y), None)
    print(f'INFO {label}: block size of p_1..p_L (source, target), L=1..{Lmax}: {sizes}; '
          f'first separating L = {sep}')
    return sep


def part_D(Lmax):
    q, grades = 2, (0, 1, 0)  # O = 1 + g + 1, eta = basis 0, extra unit copy = basis 2
    d = 3
    u = (np.arange(3), np.array([1.0, 1.0, -1.0], dtype=complex))
    C = lambda L: mono_kron(mono_eye(d), mono_pow(u, L - 1))
    gam = lambda X, L: conj(C(L), X)
    one = lambda x, y: 1.0
    for L in range(1, Lmax + 1):
        B = shuffle(grades, q, L, one)
        I = np.eye(d ** L)
        for E in basis(grades, q, L):
            lhs = gam(conj(B, np.kron(E, I)), 2 * L)
            rhs = conj(B, np.kron(gam(E, L), I))
            assert np.allclose(lhs, rhs, atol=TOL), ('G6-C1 delta', L)
    p0 = np.diag([1.0, 0, 0])
    for L in range(1, Lmax + 1):
        for j in range(L):
            P = np.kron(np.kron(np.eye(d ** j), p0), np.eye(d ** (L - j - 1)))
            assert np.allclose(gam(P, L), P)
    b = np.zeros((3, 3)); b[0, 2] = 1  # matrix unit between the two unit copies
    T = np.kron(np.eye(d), b)
    assert not np.allclose(gam(T, 2), np.kron(np.eye(d), gam(b, 1)))
    eta = np.array([1.0, 0, 0])
    r = np.kron(eta[:, None], np.eye(d)); l = np.kron(np.eye(d), eta[:, None])
    h = r @ l.T
    assert not np.allclose(gam(h, 2), h)
    print(f'PASS G6-C1 (O=1+g+1 in Hilb(Z2), flip): gamma commutes with delta (L<={Lmax}), '
          f'fixes all p_j, moves T and h')


def main(mutation):
    flip = lambda x, y: 1.0
    sign = lambda x, y: (-1.0) ** (x * y)
    quart = lambda x, y: 1j ** (x * y)
    if mutation == 'chi_both_s1':
        part_A_B((0, 1, 1, 2, 3), 1, 4, sign, sign, 2, 'MUT chi=(-1)^ab both, s=1')
        return
    if mutation == 'chi_target_only':
        part_A_B((0, 1, 1, 2, 3), 1, 4, flip, sign, 2, 'MUT flip vs (-1)^ab')
        return
    if mutation == 'shift_per_site':
        part_A_B((0, 1, 1, 2, 3), 1, 4, flip, flip, 2, 'MUT non-uniform shift', mutation)
        return
    part_A_B((0, 0, 1), 1, 2, flip, flip, 2, 'B1 Z2')
    part_A_B((0, 1, 1, 2, 3), 1, 4, flip, flip, 2, 'B2 Z4 (a=1,b=2)')
    part_A_B((0, 1, 1, 2, 3, 4, 5), 1, 6, flip, flip, 1, 'B2 Z6 (a=1,b=2)')
    part_A_B((0, 0, 1, 2, 3), 2, 4, sign, sign, 2, 'B1 Z4, chi=(-1)^ab, s=2 transparent')
    # mechanism boundary: non-transparent translation fails for the same phi
    for lab, chi, s, src in [('chi=(-1)^ab, s=1', sign, 1, (0, 1, 1, 2, 3)),
                             ('chi=i^ab, s=1', quart, 1, (0, 1, 1, 2, 3)),
                             ('chi=i^ab, s=2', quart, 2, (0, 0, 1, 2, 3))]:
        try:
            part_A_B(src, s, 4, chi, chi, 2, lab)
            raise RuntimeError('unexpected PASS: ' + lab)
        except AssertionError as e:
            print(f'PASS (expected failure of plain translation) {lab}: {e.args[0][0]}')
    seps = [part_C((0, 0, 1), 1, 2, 6, 'B1 Z2'),
            part_C((0, 1, 1, 2, 3), 1, 4, 6, 'B2 Z4'),
            part_C((0, 1, 1, 2, 3, 4, 5), 1, 6, 6, 'B2 Z6')]
    assert all(x is not None for x in seps), 'point-block invariant fails to separate'
    print('PASS C: the named points p_j obstruct every point-preserving record iso in these instances')
    part_D(2)
    print('GREEN: reviewer checks')


if __name__ == '__main__':
    ap = argparse.ArgumentParser()
    ap.add_argument('--mutation', choices=('chi_both_s1', 'chi_target_only', 'shift_per_site'))
    main(ap.parse_args().mutation)
