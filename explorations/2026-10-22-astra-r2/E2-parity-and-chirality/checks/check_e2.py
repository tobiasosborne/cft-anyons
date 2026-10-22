"""Exact finite checks for NOTE.md (3), (6), (9), (11), (17), E2-V.

Run from repo root: python3 -B <this path>. No files outside this bundle.
The finite instances calibrate identities, not an all-scale KS certificate.
"""
import sympy as sp


def comm(a, b):
    return a * b - b * a


def equal(a, b):
    return all(sp.simplify(x) == 0 for x in a - b)


def rejects(label, a, b):
    try:
        assert equal(a, b), label
    except AssertionError:
        print("RED mutation rejected:", label)
    else:
        raise AssertionError("mutation survived: " + label)


I2 = sp.eye(2)
X = sp.Matrix([[0, 1], [1, 0]])
Y = sp.Matrix([[0, -sp.I], [sp.I, 0]])
Z = sp.diag(1, -1)


def word(n, factors):
    return sp.kronecker_product(*(factors.get(j, I2) for j in range(n)))


N = 4  # auxiliary unit-multiplicity flags; no nontrivial anyon computation
zero = sp.zeros(2**N)
g = [word(N, {j: X, (j + 1) % N: X})
     + word(N, {j: Z, (j + 1) % N: Z}) for j in range(N)]
curr = [sp.I * comm(g[j], g[(j + 1) % N]) for j in range(N)]
Q = sum(curr, zero)
expected = 2 * sum((word(N, {j: X, (j + 1) % N: Y, (j + 2) % N: Z})
                   - word(N, {j: Z, (j + 1) % N: Y, (j + 2) % N: X})
                   for j in range(N)), zero)
rejects("reversed current sign", Q, -expected)
assert equal(Q, expected)
assert sp.trace(Q.H * Q) == 4 * (2 * N) * 2**N
print("GREEN ancillary current (17); squared HS norm =", sp.trace(Q.H * Q))

# Site reflection x -> 1-x sends the bond label j to -j.
P = sp.zeros(2**N)
for col in range(2**N):
    bits = [(col >> (N - 1 - j)) & 1 for j in range(N)]
    reflected = [bits[(1 - j) % N] for j in range(N)]
    row = sum(b << (N - 1 - j) for j, b in enumerate(reflected))
    P[row, col] = 1
assert P * P == sp.eye(2**N)
for j in range(N):
    assert equal(P * g[j] * P, g[-j % N])
    assert equal(P * curr[j] * P, -curr[(-j - 1) % N])
assert equal(P * Q * P, -Q)

z = sp.I  # exp(2 pi i/4), exact
# Keep the actual (ap) prefactor; simplify only scalar expressions.
a = sp.Rational(N, 4) / sp.pi


def E(n):
    return a * sum((z**(n*j) * g[j] for j in range(N)), zero)


def B(n):
    return a * sum((z**(n*j) * curr[j] for j in range(N)), zero)


def L(n):
    return E(n) - B(n)


def S(n):
    return E(n) + B(n)


def C(m, n):
    return comm(L(m), S(n))


def FL(m, n):
    return comm(L(m), L(n)) - (m-n) * L(m+n)


def FS(m, n):
    return comm(S(m), S(n)) + (m-n) * S(m+n)


delta = P * L(1) * P - S(-1)
rejects("wrong reflection phase z^n", delta, (z-1) * B(-1))
assert equal(delta, (z**-1 - 1) * B(-1))
for n in (-2, -1, 0, 1, 2):
    assert equal(P * L(n) * P - S(-n), (z**(-n)-1) * B(-n))
print("GREEN exact reflection offset (3), modes -2..2")

m, n = 1, -1
kappa = -sp.I * a * (z**n-z**m)
assert equal(comm(E(m), E(n)), kappa * B(m+n))
antisym = C(m, n) - C(n, m)
rhs = (4*kappa-2*(n-m)) * B(m+n) - FL(m, n) - FS(m, n)
rejects("omitted KS Taylor coefficient", antisym, -FL(m, n)-FS(m, n))
assert equal(antisym, rhs)
print("GREEN KS residual identity (6)")

# Independent exact arbitrary 3x3 matrices check the Jacobi rearrangements.
def matrix(seed):
    return sp.Matrix(3, 3, lambda i, j:
                     ((seed + 3*i + 5*j)**2 % 17) - 8)


ls = {k: matrix(2*k+20) for k in range(-7, 8)}
ss = {k: matrix(3*k+40) for k in range(-7, 8)}


def cc(m, n):
    return comm(ls[m], ss[n])


def ff(m, n):
    return comm(ls[m], ls[n]) - (m-n) * ls[m+n]


def vv(m, n):
    return comm(ff(0, m), ss[n]) + comm(ls[m], cc(0, n))


for m, n in [(1, -1), (0, 2), (-2, 1)]:
    emn = cc(m, n) - cc(n, m)
    rhs = comm(ls[0], emn) + n*emn - vv(m, n) + vv(n, m)
    assert equal((n-m)*cc(m, n), rhs)
    rejects("omitted W/F correction for (%s,%s)" % (m, n),
            (n-m)*cc(m, n), comm(ls[0], emn) + n*emn)
for n in range(-2, 3):
    aa = abs(n) + 1
    bb = n - aa
    rhs = comm(ls[aa], cc(bb, n)) - comm(ls[bb], cc(aa, n))
    rhs -= comm(ff(aa, bb), ss[n])
    assert equal((aa-bb)*cc(n, n), rhs)
print("GREEN arbitrary-matrix Jacobi identities (9), (11)")

# E2-Z's cyclic Jacobi reduction, retaining its error terms at finite scale.
for triple in [(1, 2, -1), (1, -1, 0), (-2, 1, 2)]:
    residual = sp.zeros(3)
    for m, n, kk in [triple, triple[1:]+triple[:1], triple[2:]+triple[:2]]:
        residual += comm(ls[m], cc(n, kk)-cc(kk, n))
        residual -= (m-n)*cc(m+n, kk) + comm(ff(m, n), ss[kk])
    assert equal(residual, sp.zeros(3))
q = sp.symbols("q")
assert sp.expand(-q*(q-1)+q*(q+1)-2*q) == 0
print("GREEN E2-Z cyclic Jacobi identity and final 2q coefficient")

k, m, n = sp.symbols("k m n")
coefficient = ((k-n/2)*(k-n-m/2) - (k-m/2)*(k-m-n/2))
assert sp.expand(coefficient - (m-n)*(k-(m+n)/2)) == 0
assert coefficient.subs({k: 1, m: 1, n: -1}) == 2
print("GREEN exact E2-V Witt bracket; mixed (1,-1)e_1 = 2e_1")
print("PASS: finite identities and 6 deliberately wrong mutations rejected")
