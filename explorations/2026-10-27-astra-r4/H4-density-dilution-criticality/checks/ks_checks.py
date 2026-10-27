#!/usr/bin/env python3
"""B2/B4 finite identities on unit multiplicities (available in every C).

Run: OPENBLAS_NUM_THREADS=1 python3 <this path> [--mutate sine|current]
No Virasoro certificate is claimed by these finite checks.
"""
import argparse
import numpy as np
import sympy as s

parser = argparse.ArgumentParser()
parser.add_argument("--mutate", choices=["sine", "current"])
args = parser.parse_args()
tol = 2e-8


def comm(a, b):
    return a @ b - b @ a


def embed(op, sites, length):
    sites = list(sites)
    out = np.zeros((2**length, 2**length), complex)
    for col in range(2**length):
        inp = sum(((col >> site) & 1) << (len(sites)-1-i) for i, site in enumerate(sites))
        for local_out in range(2**len(sites)):
            value = op[local_out, inp]
            if value == 0:
                continue
            row = col
            for i, site in enumerate(sites):
                bit = (local_out >> (len(sites)-1-i)) & 1
                row = (row & ~(1 << site)) | (bit << site)
            out[row, col] += value
    return out


# Exact three-site check of the improvement/current sign, independent of Fourier sums.
i = s.I
M = s.Matrix([[1, i/3, s.Rational(1, 4)], [0, 1, i/5], [0, 0, 1]])
kp = s.zeros(4)
kp[1:4, 1:4] = M.conjugate().T * M
u = (2+i)/3
A = s.Matrix([[0, s.conjugate(u)], [u, 0]])
Id = s.eye(2)
imp = s.kronecker_product(A, Id)-s.kronecker_product(Id, A)
k = kp + imp
k12, k23 = s.kronecker_product(k, Id), s.kronecker_product(Id, k)
kp12, kp23 = s.kronecker_product(kp, Id), s.kronecker_product(Id, kp)
A2 = s.kronecker_product(Id, A, Id)
diff = i*(k12*k23-k23*k12-kp12*kp23+kp23*kp12)
sign = 1 if args.mutate != "current" else -1
expected = sign*i*((kp12+kp23)*A2-A2*(kp12+kp23))
assert s.simplify(diff-expected) == s.zeros(8), "exact current-improvement sign"
print("PASS exact three-site current-improvement identity")

kp = np.array(kp, complex)
A = np.array(A, complex)
u = complex(u)
B = np.array([[0, -1j*np.conj(u)], [1j*u, 0]], complex)
rng = np.random.default_rng(27042026)

for length in [6, 7, 8]:
    dim = 2**length
    vac = np.zeros(dim, complex)
    vac[0] = 1
    number = np.array([state.bit_count() for state in range(dim)])
    bonds = [embed(kp, [j, (j+1) % length], length) for j in range(length)]
    currents = [1j*comm(bonds[j], bonds[(j+1) % length]) for j in range(length)]
    stress = [bonds[j]-currents[j] for j in range(length)]
    assert all(np.linalg.norm(t@vac) < tol for t in stress)
    bound_M = max(np.linalg.norm(t, 2) for t in stress)
    psi = rng.normal(size=dim)+1j*rng.normal(size=dim)
    psi /= np.linalg.norm(psi)
    rho = np.vdot(psi, number*psi).real/length
    a, q = length/(4*np.pi), 2*np.pi/length
    vectors = [t@psi for t in stress]
    C = []
    for d in [1, 2]:
        val = sum(np.vdot(vectors[j], vectors[(j+d) % length])
                  - np.vdot(vectors[(j+d) % length], vectors[j]) for j in range(length))
        assert abs(val) <= 2*bound_M**2*(3+d)*length*rho+tol
        C.append(val)
    W = []
    for m in [1, 2]:
        T = a*sum(np.exp(1j*m*q*j)*stress[j] for j in range(length))
        val = np.linalg.norm(T.conj().T@psi)**2-np.linalg.norm(T@psi)**2
        factor = -2j if args.mutate != "sine" else 2j
        expected = factor*a*a*sum(np.sin(m*q*d)*C[d-1] for d in [1, 2])
        assert abs(val-expected) < tol, "Fourier sine commutator coefficient"
        W.append(val)
    combo = W[1]-2*W[0]
    assert abs(combo) <= 88*np.pi*bound_M**2*rho+tol
    print(f"PASS B2 L={length}, density={rho:.6g}, cubic-combination={combo:.6g}")

    # B4: add a telescopic energy density; do not alter the periodic H.
    As = [embed(A, [j], length) for j in range(length)]
    Bs = [embed(B, [j], length) for j in range(length)]
    improved = [bonds[j]+As[j]-As[(j+1) % length] for j in range(length)]
    Hprime = sum(bonds)
    assert np.linalg.norm(sum(improved)-Hprime) < tol
    J = [1j*comm(improved[j], improved[(j+1) % length]) for j in range(length)]
    for j in range(length):
        assert np.linalg.norm(J[j]-currents[j]-1j*comm(Hprime, As[(j+1) % length])) < tol
    ts = [improved[j]-J[j] for j in range(length)]
    uvec = []
    for j in range(length):
        v = np.zeros(dim, complex)
        v[1 << j] = u
        uvec.append(v)
    for m in [0, 1, 2]:
        p = m*q
        Up = sum(np.exp(1j*p*j)*uvec[j] for j in range(length))
        Um = sum(np.exp(-1j*p*j)*uvec[j] for j in range(length))
        Ep = np.vdot(Up, Hprime@Up).real/length
        Em = np.vdot(Um, Hprime@Um).real/length
        T = a*sum(np.exp(1j*p*j)*ts[j] for j in range(length))
        rhs = a*((1-np.exp(-1j*p))*Up-1j*np.exp(-1j*p)*(Hprime@Up))
        assert np.linalg.norm(T@vac-rhs) < tol, "B7 empty mode action"
        for probes, expected in [
            (As, 1j*np.exp(-1j*p)*(Ep+Em)),
            (Bs, 2j*(1-np.exp(-1j*p))*abs(u)**2+np.exp(-1j*p)*(Ep-Em))]:
            probe = sum(np.exp(-1j*p*j)*probes[j] for j in range(length))
            actual = np.vdot(T.conj().T@vac, probe@vac)-np.vdot(probe.conj().T@vac, T@vac)
            assert abs(actual/(a*length)-expected) < tol, "B8 probe polynomial"
    print(f"PASS B4 L={length}, original H retained, both probe polynomials")
print("ALL KS IDENTITY CHECKS PASSED; largest dense matrix 256 x 256")
