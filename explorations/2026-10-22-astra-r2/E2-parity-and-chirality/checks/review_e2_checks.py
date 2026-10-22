"""Independent reviewer check for E2 (numpy, float64, tol 1e-9).
Instance: Vec_Z3, site O = 1 (+) g (g non-self-dual, g^vee = g^2), carrier
Hom(c, O^N) = {0,1}-strings (all charges c retained). C-morphisms on two sites
= block diagonal in pair charge {00}, {01,10}, {11}. Reflection x -> 1-x.
"""
import numpy as np, itertools
rng = np.random.default_rng(7)
TOL = 1e-9
def comm(a,b): return a@b-b@a

def chain(N, h2):
    D = 2**N
    def place(j):
        M = np.zeros((D,D),complex)
        for col in range(D):
            bits = [(col>>(N-1-i))&1 for i in range(N)]
            a,b = bits[j%N], bits[(j+1)%N]
            for out in range(4):
                amp = h2[out, 2*a+b]
                if abs(amp)<1e-15: continue
                nb = bits.copy(); nb[j%N], nb[(j+1)%N] = out>>1, out&1
                row = sum(x<<(N-1-i) for i,x in enumerate(nb))
                M[row,col] += amp
        return M
    k = [place(j) for j in range(N)]
    P = np.zeros((D,D))
    for col in range(D):
        bits = [(col>>(N-1-i))&1 for i in range(N)]
        rb = [bits[(1-i)%N] for i in range(N)]
        P[sum(x<<(N-1-i) for i,x in enumerate(rb)), col] = 1
    return k, P

def modes(k, N):
    z = np.exp(2j*np.pi/N); a = N/(4*np.pi)
    J = [1j*comm(k[j], k[(j+1)%N]) for j in range(N)]
    E = lambda n: a*sum(z**(n*j)*k[j] for j in range(N))
    B = lambda n: a*sum(z**(n*j)*J[j] for j in range(N))
    return z, a, J, E, B

def sym_density(generic=True):
    # pair-charge blocks: 00 (1x1), {01,10} (2x2), 11 (1x1); swap-symmetric
    h = np.zeros((4,4),complex)
    h[0,0] = rng.normal(); h[3,3] = rng.normal()
    d = rng.normal(); t = rng.normal() + (1j*rng.normal() if generic else 0)
    # swap symmetry SWAP h SWAP = h forces h[1,1]=h[2,2], h[1,2]=h[2,1] (real by hermiticity)
    t = t.real
    h[1,1] = h[2,2] = d; h[1,2] = h[2,1] = t
    return h

for N in (5,6):
    h = sym_density()
    k, P = chain(N, h)
    SW = np.eye(4)[[0,2,1,3]]
    assert np.allclose(SW@h@SW, h)
    for j in range(N):
        assert np.allclose(P@k[j]@P.T, k[(-j)%N]), "P k_j P* != k_-j"
        for l in range(N):
            if min((j-l)%N,(l-j)%N) > 1:
                assert np.allclose(comm(k[j],k[l]),0)
    z,a,J,E,B = modes(k,N)
    L = lambda n: E(n)-B(n); S = lambda n: E(n)+B(n)
    for n in range(-3,4):
        lhs = P@L(n)@P.T - S(-n)
        assert np.allclose(lhs, (z**(-n)-1)*B(-n), atol=TOL), ("(3) fails", n)
        bad = np.abs(lhs-(z**(n)-1)*B(-n)).max()
        assert (2*n)%N==0 or bad>1e-6, "mutation z^n not rejected"
    for m,n in [(1,-1),(2,1),(0,3),(-2,-1)]:
        kap = -1j*a*(z**n-z**m)
        assert np.allclose(comm(E(m),E(n)), kap*B(m+n), atol=TOL)
        A = comm(L(m),S(n))-comm(L(n),S(m))
        FL = comm(L(m),L(n))-(m-n)*L(m+n)
        FR = comm(S(m),S(n))+(m-n)*S(m+n)   # = F^R_{-m,-n} + z^R scalar
        rhs = (4*kap-2*(n-m))*B(m+n) - FL - FR
        assert np.allclose(A, rhs, atol=1e-8), ("(6) fails", m, n)
    Q = sum(J); H = sum(k)
    assert np.allclose(P@Q@P.T, -Q)
    Z0 = comm(L(0),S(0)); assert np.allclose(Z0, 2*a*a*comm(H,Q), atol=1e-8)
    print(f"N={N}: (3) all n in -3..3, (6) four pairs, Z0, PQP*=-Q pass; "
          f"generic sym density ||[H,Q]|| = {np.linalg.norm(comm(H,Q),2):.3e}")

# XXZ-type (integrable) block: diag(Delta, 0, 0, Delta) + hopping -> expect [H,Q]=0
for N in (5,6):
    h = np.zeros((4,4)); h[0,0]=h[3,3]=0.37; h[1,2]=h[2,1]=1.0
    k,P = chain(N,h); H=sum(k); Q=sum(1j*comm(k[j],k[(j+1)%N]) for j in range(N))
    print(f"N={N}: XXZ-type density ||[H,Q]|| = {np.linalg.norm(comm(H,Q),2):.3e}")
# generic: add a pair-charge-0/2 asymmetric potential still swap-symmetric -> nonintegrable
for N in (5,6):
    h = np.zeros((4,4)); h[0,0]=0.3; h[3,3]=-0.8; h[1,1]=h[2,2]=0.5; h[1,2]=h[2,1]=1.0
    k,P = chain(N,h); H=sum(k); Q=sum(1j*comm(k[j],k[(j+1)%N]) for j in range(N))
    print(f"N={N}: diag(0.3,.5,.5,-0.8)+hop ||[H,Q]|| = {np.linalg.norm(comm(H,Q),2):.3e}")

# ---- Part 2: antiunitary reflection Theta = P o conj preserves chirality ----
for N in (5,6):
    h = np.zeros((4,4)); h[0,0]=0.3; h[3,3]=-0.8; h[1,1]=h[2,2]=0.5; h[1,2]=h[2,1]=1.0
    k,P = chain(N,h); z,a,J,E,B = modes(k,N)
    for j in range(N): assert np.allclose(P@k[j].conj()@P.T, k[(-j)%N])
    for n in (1,2,-1):
        ThL = P@(E(n)-B(n)).conj()@P.T
        assert np.allclose(ThL, E(n)-z**n*B(n), atol=TOL)
        assert not np.allclose(ThL, E(-n)+z**(-n)*B(-n))  # not Tbar-type
    print(f"N={N}: antiunitary Theta L_n Theta* = E_n - z^n B_n exactly (n=1,2,-1): same chirality")

# ---- Part 3: E2-V weighted A4 residual decay, p=2 ----
def Aw(n,M):
    ks=np.arange(-M,M+1); X=np.zeros((len(ks),len(ks)))
    for c,kk in enumerate(ks):
        if abs(kk-n)<=M: X[c-n,c]=kk-n/2
    return X, ks
p=2
for (m,n) in [(1,-1)]:
    out=[]
    for M in (8,16,32,64,128):
        Am,ks=Aw(m,M); An,_=Aw(n,M); Amn,_=Aw(m+n,M)
        Ki=np.diag((1+abs(ks))**(-float(p)))
        R=Am@An-An@Am-(m-n)*Amn
        out.append(np.linalg.norm(R@Ki@Ki,2))
    print("E2-V (s=0,(1,-1)) weighted A4 residual, M=8..128:", ["%.2e"%x for x in out])
A1,ks=Aw(1,16); Am1,_=Aw(-1,16); e=np.zeros(len(ks)); e[list(ks).index(1)]=1
print("E2-V mixed [T_1,Tbar_-1]e_1 =", (A1@Am1-Am1@A1)@e@e)
