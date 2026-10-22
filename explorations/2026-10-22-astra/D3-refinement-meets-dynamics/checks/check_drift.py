"""D3 finite algebra checks. Run from repo root; matrices have size <=16.

Exact SymPy arithmetic; --mutate NAME deliberately corrupts a claim.
Conventions and mathematical derivations: ../NOTE.md, D3-1 through D3-6.
This is an invariant check, not evidence for the headline conjecture.
"""
import argparse
import platform
import sympy as s

parser = argparse.ArgumentParser()
parser.add_argument('--mutate', choices=['factor', 'complement', 'polar', 'unit', 'local'])
mutation = parser.parse_args().mutate
I = s.eye
R = s.Rational


def same(a, b):
    assert s.simplify(a - b) == s.zeros(*a.shape), (a, b)


def trace_norm(a):
    assert a == a.H
    return s.simplify(sum(m * s.Abs(v) for v, m in a.eigenvals().items()))


print('Python', platform.python_version(), 'SymPy', s.__version__)
print('Mutation:', mutation or 'none')

# D3-1: the CA-72 scalar is a squared vector norm, not a state distance.
p = R(9, 25)
q = 1-p
delta2 = 2*(1-s.sqrt(p))
assert s.simplify(q - (delta2-delta2**2/4)) == 0
print('PASS corner defect: p=9/25, q=16/25, delta^2=4/5')

W = s.Matrix([[1, 0], [0, 1], [0, 0]])
P = W*W.H
Q = I(3)-P
S = s.Matrix([[1, 2], [2, 3]])
T = s.Matrix([[0, s.I], [-s.I, 1]])


def aug(a, z):
    return W*a*W.H + z*(P if mutation == 'complement' else Q)


same(aug(I(2), 1), I(3))
same(aug(S*T, 6), aug(S, 2)*aug(T, 3))
V = s.Matrix([[1, 0, 0], [0, 1, 0], [0, 0, 1], [0, 0, 0]])
same(V*aug(S, 2)*V.H+2*(I(4)-V*V.H),
     V*W*S*W.H*V.H+2*(I(4)-V*W*W.H*V.H))
print('PASS scalar augmentation: unit, multiplicativity, composition')

Z = s.diag(1, -1)
chi = lambda a: s.trace(a)/2
phi = lambda a: W*a*W.H+chi(a)*Q
defect = phi(Z*Z)-phi(Z)*phi(Z)
same(defect, Q)
rho = s.diag(1, 0, 0)
assert trace_norm(defect) == 1 and s.trace(rho*defect.H*defect) == 0
print('PASS CP defect: operator norm 1 while selected GNS seminorm is 0')

psi = s.Matrix([R(3, 5), 0, R(4, 5)])
fine = psi*psi.H
coarse = s.diag(0, 1)
tau = (W.H*fine*W)/p
actual = trace_norm(W.H*fine*W-coarse)+q
upper = p*trace_norm(tau-coarse)+2*q
assert actual == upper == 2
center_difference = (W*I(2)*W.H-P) - (W*I(2)*W.H-p*I(3))
assert s.trace(fine*center_difference.H*center_difference) == p*q
print('PASS independent-state augmented drift=2; centering variance=p*q')

# A global corner pins a distant inserted site, even for a local input.
X = s.Matrix([[0, 1], [1, 0]])
vac = s.diag(1, 0)
theta_local = s.kronecker_product(Z, vac, I(2), vac)
distant = s.kronecker_product(I(2), I(2), I(2), X)
assert theta_local*distant-distant*theta_local != s.zeros(16)
corner_unit = I(16) if mutation == 'unit' else s.kronecker_product(I(2), vac, I(2), vac)
same(s.kronecker_product(I(2), vac, I(2), vac), corner_unit)
print('PASS global corner support and corner-unit correction (16x16)')

# D3-3/4: the spectral-state bound is saturated by a two-level pure state.
v = s.Matrix([R(3, 5), R(4, 5)])
ground = s.diag(1, 0)
K = s.diag(0, 3)
energy = (v.H*K*v)[0]
residual2 = (v.H*K*K*v)[0]
distance = trace_norm(v*v.H-ground)
factor = 1 if mutation == 'factor' else 2
assert distance <= factor*s.sqrt(energy/3)
assert distance <= factor*s.sqrt(residual2)/3
assert distance == R(8, 5)
print('PASS sharp state distance=8/5; energy/gap and residual/gap both saturate')

# D3-5: first derivative of polar(e^{-tH}W) and effective energy descent.
H = s.Matrix([[1, 2, 3], [2, 4, 5], [3, 5, 6]])
dW = -(I(3)-P)*H*W
sign = -1 if mutation == 'polar' else 1
generator = sign*(P*H-H*P)
same(generator*W, dW)
same(dW.H*W+W.H*dW, s.zeros(2))
same(dW.H*H*W+W.H*H*dW, -2*W.H*H*(I(3)-P)*H*W)
print('PASS polar tangent and effective-energy derivative -2 V*H(1-P)HV')

# D3-5: independently assemble the tangent using local inserted-site projectors.
ket0 = s.Matrix([1, 0])
V4 = s.kronecker_product(I(2), ket0, I(2), ket0)
P4 = V4*V4.H
h12 = s.kronecker_product(Z, X, I(2), I(2))
h23 = s.kronecker_product(I(2), Z, X, I(2))
h34 = s.kronecker_product(I(2), I(2), Z, X)
p12 = s.kronecker_product(I(2), vac, I(2), I(2))
p23 = p12
p34 = s.kronecker_product(I(2), I(2), I(2), vac)
local_pairs = [(p12, h12), (p23, h23), (p34, h34)]
A4 = sum((p*h-h*p for p, h in local_pairs), s.zeros(16))
if mutation == 'local':
    A4 = -A4
H4 = h12+h23+h34
same(A4.H, -A4)
same(A4*V4, -(I(16)-P4)*H4*V4)
same(V4.H*h12*(I(16)-P4)*h34*V4, s.zeros(4))
print('PASS local tangent assembly; disconnected defect pairs vanish (16x16)')

# Local extension of a general tangent; Hermitian pieces cancel across patches.
x12 = s.I*h12+p12
x23 = s.I*h23-p12
local_extension = s.zeros(16)
for p, x in [(p12, x12), (p23, x23)]:
    a = x*p-p*x.H-R(1, 2)*p*(x-x.H)*p
    same(a.H, -a)
    local_extension += a
same(local_extension*V4, (x12+x23)*V4)
print('PASS local extension lemma, including cancellation between patches')

# D3-6: positive UV gap alone cannot select the intended IR vacuum.
t = R(1, 10)
delta = t*t/2
H3 = s.Matrix([[0, 0, 0], [0, delta, t], [0, t, 1]])
assert H3[1:3, 1:3].det() < 0
assert H3[0, 0] == 0
assert all(vec[0] == 0 for val, _, vecs in H3.eigenvects()
           if val.is_negative for vec in vecs)
print('PASS UV-gap counterexample: lower block determinant=-1/200, ground orthogonal')

# Pure excited eigenstates have zero variance; energy-origin control is essential.
excited = s.Matrix([0, 1])
mean = (excited.H*K*excited)[0]
variance = (excited.H*(K-mean*I(2))**2*excited)[0]
assert variance == 0 and trace_norm(excited*excited.H-ground) == 2
print('PASS zero-variance counterexample: excited state distance=2')
print('ALL 11 invariant groups PASS; largest matrix 16x16; no chain diagonalization')
