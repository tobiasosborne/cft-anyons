"""REVIEWER check (Opus reconciler, 2026-10-22), not part of the Astra note.
Run from repo root: python3 -I <this path>. numpy only; largest matrix 64x64.
Reviewer check: braided unital lift of dyadic vacuum insertion.
Instance only (Rule 16): pointed braided category Vec_{Z_N}, trivial associator,
bicharacter braiding R(a,b)=exp(2 pi i a b / N); site object O = 1 + X, X = 1 in Z_N.
Claim tested: alpha(T) = B (T (x) id) B^{-1} is a unital *-hom End_C(O^L) -> End_C(O^2L),
alpha(T) V = V T for the interleaved vacuum insertion V, and alpha(local 2-site t at sites j,j+1)
is supported on fine sites 2j-1,2j,2j+1. Also tests P1 arithmetic (1) for V.
LIMITATION: in this pointed instance the plain (phase-free) interleaving is also a
valid lift, so the check does not discriminate braiding phases; it calibrates the
naturality argument of REVIEW.md R1 only weakly. A non-pointed instance is future work."""
import itertools as it, numpy as np
rng = np.random.default_rng(1)
N = 3
def basis(L): return list(it.product((0,1), repeat=L))
def charge(s): return sum(s) % N
def rand_morphism(L):
    idx = basis(L); d = len(idx); T = np.zeros((d,d), complex)
    for i,a in enumerate(idx):
        for j,b in enumerate(idx):
            if charge(a)==charge(b): T[i,j] = rng.normal()+1j*rng.normal()
    return T
def interleave(L):
    # B: (o1..oL, n1..nL) -> (o1,n1,...,oL,nL); new strand n_k crosses old o_m for m>k
    src = basis(2*L); d = len(src); B = np.zeros((d,d), complex)
    pos = {s:i for i,s in enumerate(src)}
    for s in src:
        o, n = s[:L], s[L:]
        tgt = tuple(x for k in range(L) for x in (o[k], n[k]))
        ph = np.prod([np.exp(2j*np.pi*o[m]*n[k]/N) for k in range(L) for m in range(k+1,L)])
        B[pos[tgt], pos[s]] = ph
    return B
def check(L, width=3):
    B = interleave(L); assert np.allclose(B.conj().T@B, np.eye(len(B)))
    dL = 2**L
    alpha = lambda T: B@np.kron(T, np.eye(dL))@B.conj().T
    # V: insert vacuum at even fine sites
    V = np.zeros((4**L, dL)); fine = {s:i for i,s in enumerate(basis(2*L))}
    for j,s in enumerate(basis(L)):
        V[fine[tuple(x for k in range(L) for x in (s[k],0))], j] = 1
    S, T = rand_morphism(L), rand_morphism(L)
    assert np.allclose(alpha(np.eye(dL)), np.eye(4**L))
    assert np.allclose(alpha(S@T), alpha(S)@alpha(T))
    assert np.allclose(alpha(S.conj().T), alpha(S).conj().T)
    assert np.allclose(alpha(S)@V, V@S), 'alpha does not extend theta'
    # alpha lands in End_C: commutes with total charge
    Q = np.diag([np.exp(2j*np.pi*charge(s)/N) for s in basis(2*L)])
    assert np.allclose(alpha(S)@Q, Q@alpha(S))
    # locality: 2-site t on coarse sites j,j+1 -> fine sites 2j-1..2j+1 (1-indexed)
    for j in range(L-1):
        t = rand_morphism(2)
        Tloc = np.kron(np.kron(np.eye(2**j), t), np.eye(2**(L-j-2)))
        A = alpha(Tloc).reshape([2]*(4*L))
        left, right = 2*j, 2*j+width   # fine 0-indexed support [2j, 2j+2]
        # check A acts as identity on fine sites outside [left,right)
        for f in list(range(0,left))+list(range(right,2*L)):
            Am = np.moveaxis(A, [f, 2*L+f], [0, 1]).reshape(2,2,-1)
            red = Am.reshape(2,2,-1)
            # A = id_f (x) rest  <=> A[a,b,...] = delta_ab * A[0,0,...]
            assert np.allclose(red[0,1], 0) and np.allclose(red[1,0], 0) and np.allclose(red[0,0], red[1,1]), f'nonlocal at fine site {f}'
    # P1 arithmetic for theta = V . V^dagger, block by Z_N charge c
    m = lambda L,c: sum(1 for s in basis(L) if charge(s)==c)
    for c in range(N):
        comp = m(2*L,c) - m(L,c)
        q = [sum(1 for s in basis(L) if (a+charge(s))%N==c) - (a==c) for a in range(N)]
        assert all(x>=0 for x in q) and comp == sum(q[a]*m(L,a) for a in range(N))
    return True
import platform
print('numpy', np.__version__, 'python', platform.python_version())
for L in (2,3):
    print('PASS L=',L,': unital *-hom, extends theta, in End_C, range-3 local; P1 (1) holds:', check(L))
try:
    check(3, width=2)
except AssertionError as e:
    print('RED mutation rejected (claim range 2 instead of 3):', e)
else:
    raise AssertionError('mutation escaped')
