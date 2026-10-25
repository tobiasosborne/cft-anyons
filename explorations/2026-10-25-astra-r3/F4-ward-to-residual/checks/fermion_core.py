"""F4 finite CAR checks; conventions fixed here before use (root writes forbidden).

Source: references/text/CFTFromLatticeFermions.txt:879-892 (normal ordering),
3379-3420 (modified positive-chiral no-wrap matrices). Port of benchmark, not
the standard local two-chiral KS prescription. Circle 2*pi, AP labels,
Float64 atol=1e-10. Physical occupations use increasing momentum bit order.
Sea fills r<0. Q=sum |r| per particle/hole excitation; E_D uses positive
Dirac dispersion 2*sin(pi*|r|/M)/(2*pi/M) on the SAME proxy occupation space.
E_D is a declared spectral proxy, not the finite Dirac ground-state GNS space.
All cutoff norms have Q<=cut on INPUT and retain every generated OUTPUT.
"""
import math
import numpy as np

ATOL = 1e-10


def momenta(M):
    assert M in (4, 8, 16, 32)
    return np.arange(-M + 1, M, 2) / 2


def mode(M, n, continuum=False, wrap=False):
    rs, eps = momenta(M), 2 * np.pi / M
    A = np.zeros((M, M))
    for j, r in enumerate(rs):
        i, q = j - n, r - n / 2
        if wrap or 0 <= i < M:
            A[i % M, j] = q if continuum else np.cos(eps*n/4)**2*np.sin(eps*q)/eps
    return A


def cocycle(A, B):
    M = len(A)
    S = np.diag((momenta(M) < 0).astype(float))
    C = np.eye(M) - S
    return float(np.trace(S@A@C@B@S-S@B@C@A@S))


def sea(M):
    return (1 << (M // 2)) - 1


def ladder(bits, j, create):
    occupied = bool(bits & (1 << j))
    if occupied == create:
        return None
    sign = (-1) ** ((bits & ((1 << j) - 1)).bit_count())
    return bits ^ (1 << j), sign


def quadratic(A, bits):
    """:dGamma(A): on a physical occupation; no output compression."""
    M, out = len(A), {}
    for i, j in zip(*np.nonzero(A)):
        a = ladder(bits, int(j), False)
        b = None if a is None else ladder(a[0], int(i), True)
        if b is not None:
            out[b[0]] = out.get(b[0], 0.0) + A[i,j]*a[1]*b[1]
    out[bits] = out.get(bits, 0.0) - np.trace(A[:M//2,:M//2])
    return {b: x for b, x in out.items() if x != 0}


def add_action(out, A, vector, factor=1):
    for b, x in vector.items():
        for c, y in quadratic(A, b).items():
            out[c] = out.get(c, 0.0) + factor*x*y


def residual(A, B, C, m, n, bits, central):
    out = {}
    add_action(out, A, quadratic(B, bits))
    add_action(out, B, quadratic(A, bits), -1)
    add_action(out, C, {bits: 1}, -(m-n))
    out[bits] = out.get(bits, 0.0) - central
    return {b:x for b,x in out.items() if abs(x) > 1e-13}


def excitation_energy(M, bits, control):
    eps, rs = 2*np.pi/M, momenta(M)
    assert control in ('Q','E_D','E_chiral')
    weights = (abs(rs) if control == 'Q' else
               abs(np.sin(eps*rs))/eps if control == 'E_chiral' else
               2*np.sin(eps*abs(rs)/2)/eps)
    different = bits ^ sea(M)
    return sum(w for j,w in enumerate(weights) if different & (1 << j))


def inputs(M, cut):
    candidates = [(0, 0.0)]
    for j, w in enumerate(abs(momenta(M))):
        candidates += [(b ^ (1 << j), E+w) for b,E in candidates if E+w <= cut]
    return sorted(sea(M) ^ b for b,E in candidates)


def action_matrix(actions, initial):
    output = sorted(set(initial).union(*(a.keys() for a in actions)))
    index = {b:j for j,b in enumerate(output)}
    R = np.zeros((len(output),len(initial)))
    for j, col in enumerate(actions):
        for b,x in col.items():
            R[index[b],j] = x
    return R, output


def norm(A):
    return float(np.linalg.svd(A, compute_uv=False)[0]) if A.size else 0.0


def bounds(M, R, initial, output, control, s):
    ki = np.array([1+excitation_energy(M,b,control) for b in initial])
    ko = np.array([1+excitation_energy(M,b,control) for b in output])
    W = ko[:,None]**s * R / ki[None,:]**(s+2)
    schur = math.sqrt(np.max(np.sum(abs(W),axis=0))*np.max(np.sum(abs(W),axis=1)))
    upper = min(float(np.linalg.norm(W)), schur)
    # t^(s+1+alpha)||K_out^s R exp(-tK_in)P||, 0<t<=1, alpha=1/2.
    # Maximize each column's scalar factor separately, then use Frobenius.
    p = s+1.5
    t = np.minimum(1.0, p/ki)
    collar = float(np.linalg.norm(ko[:,None]**s*R*(t**p*np.exp(-t*ki))[None,:]))
    C = 2/math.factorial(s+1)+sum(1/math.factorial(k) for k in range(s+2))
    actual=norm(W)
    assert actual<=upper+ATOL and actual<=C*collar+ATOL
    return dict(norm=actual, frobenius_or_schur_upper=upper,
                collar_b_upper=collar, collar_to_two_loss_constant=C,
                collar_implied_upper=C*collar, input_dimension=len(initial),
                output_dimension=len(output), input_K_max=float(max(ki)))


def car_oracle():
    """Independent full 16x16 Kronecker CAR oracle at M=4 only."""
    M=4
    I,Z,a=np.eye(2),np.diag([1.,-1.]),np.array([[0.,1.],[0.,0.]])
    annih=[]
    for j in range(M):
        op=np.array([[1.]])
        # Bit 0 is the rightmost tensor factor, unlike increasing loop order.
        for k in range(M-1,-1,-1):
            op=np.kron(op,a if k==j else Z if k<j else I)
        annih.append(op)
    for i in range(M):
        for j in range(M):
            target=np.eye(2**M) if i==j else np.zeros((2**M,2**M))
            assert norm(annih[i]@annih[j].T+annih[j].T@annih[i]-target)<ATOL
    def lift(A):
        F=sum(A[i,j]*annih[i].T@annih[j] for i in range(M) for j in range(M))
        return F-np.trace(A[:M//2,:M//2])*np.eye(2**M)
    A,B=mode(M,2),mode(M,-2)
    for C in (A,B,A@B-B@A):
        independent=lift(C)
        for bits in range(2**M):
            col=np.zeros(2**M)
            for b,x in quadratic(C,bits).items(): col[b]=x
            assert norm((col-independent[:,bits])[:,None])<ATOL
    defect=lift(A)@lift(B)-lift(B)@lift(A)-lift(A@B-B@A)-cocycle(A,B)*np.eye(2**M)
    assert norm(defect)<ATOL
    return dict(dimension=16, car_and_normal_ordered_commutator_error=norm(defect))
