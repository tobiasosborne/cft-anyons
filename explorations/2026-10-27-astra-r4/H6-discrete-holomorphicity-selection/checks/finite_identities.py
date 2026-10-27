#!/usr/bin/env python3
"""Exact finite checks for NOTE B3/B4/D1. P1/P2/P3, no limit rung.

Category and half-braiding are defined in half_braiding_witness.md.
This example tests the general proof; it does not replace it.
Run from repo root with python3 PATH/finite_identities_runner.py.
Largest matrices are 64x64; all entries are exact Gaussian rationals.
"""
import argparse
import itertools
import sys
import sympy as s

p = argparse.ArgumentParser()
p.add_argument('--mutate-prefix', action='store_true')
p.add_argument('--mutate-shared-edge', action='store_true')
args = p.parse_args()
print(f'Python {sys.version.split()[0]}; SymPy {s.__version__}')
print(f'Mutations: {vars(args)}')
# Labels 0,a,b,a+b with XOR group law; chi is negative precisely on b,a+b.
a, b = 1, 2
chi = lambda g: 1 if g < 2 else -1
pairs = list(itertools.product(range(4), repeat=2))
words = list(itertools.product(range(4), repeat=3))
idx2 = {word: j for j, word in enumerate(pairs)}
idx3 = {word: j for j, word in enumerate(words)}
I4, I16, I64 = s.eye(4), s.eye(16), s.eye(64)

# A number-changing categorical pair tile: |0,0> <-> |b,b>.
D = s.zeros(16)
D[idx2[(b,b)], idx2[(0,0)]] = 1
D[idx2[(0,0)], idx2[(b,b)]] = 1
assert D.H == D
assert all(D[r,c] == 0 for r,gh in enumerate(pairs) for c,jk in enumerate(pairs)
           if (gh[0] ^ gh[1]) != (jk[0] ^ jk[1]))
N2 = s.diag(*[sum(g != 0 for g in gh) for gh in pairs])
assert N2*D-D*N2 != s.zeros(16)
print('Pair tile is charge-preserving and Hermitian, with nonzero occupation commutator')

QL = s.zeros(16)
QR = s.zeros(16)
for c,(g,h) in enumerate(pairs):
    QL[idx2[(g ^ a,h)],c] = 1
    QR[idx2[(g,h ^ a)],c] = chi(g)


def global_q(j):
    result = s.zeros(64)
    for c,word in enumerate(words):
        prefix = word[:j]
        if args.mutate_prefix and j == 2:
            prefix = prefix[:1]  # Deliberately omit one necessary half-braiding.
        phase = s.prod(chi(g) for g in prefix)
        out = list(word)
        out[j] ^= a
        result[idx3[tuple(out)], c] = phase
    return result


def lift(K, i):
    """Independent entrywise version of B12, i=0 or 1."""
    result = s.zeros(64)
    for c, word in enumerate(words):
        local_col = idx2[word[i:i+2]]
        phase = s.prod(chi(g) for g in word[:i])
        for local_row, out_pair in enumerate(pairs):
            if K[local_row, local_col] != 0:
                out = word[:i] + out_pair + word[i+2:]
                result[idx3[out],c] += phase*K[local_row,local_col]
    return result

Q = [global_q(j) for j in range(3)]
T0, T1 = s.kronecker_product(D,I4), s.kronecker_product(I4,D)
# This is the critical invariance: a pair birth lies inside the crossed prefix.
assert Q[2]*T0 == T0*Q[2], 'missing prefix half-braiding breaks cut independence'
assert Q[0]*T1 == T1*Q[0]
print('Cut moves across a pair-birth tile: prefix naturality and disjoint interchange PASS')
for i in (0,1):
    assert lift(QL,i) == Q[i]
    assert lift(QR,i) == Q[i+1]
    Ti = T0 if i == 0 else T1
    assert lift(D*QL,i) == Ti*Q[i]
    assert lift(D*QR,i) == Ti*Q[i+1]
    assert lift(QL*D,i) == Q[i]*Ti
    assert lift(QR*D,i) == Q[i+1]*Ti
print('All four local insertions equal their global lifts at both adjacent positions')
A, B = I64 + 2*T1, I64 + 3*T1
local_residual = -s.I*D*QL + D*QR - QL*D + s.I*QR*D
four_global = (-s.I*B*T0*Q[0]*A + B*T0*Q[1]*A
               - B*Q[0]*T0*A + s.I*B*Q[1]*T0*A)
assert four_global == B*lift(local_residual,0)*A
print('A nontrivial exterior gives exactly the single common-exterior face residual')
identity_residual = -s.I*QL + QR - QL + s.I*QR
assert identity_residual == (1+s.I)*(QR-QL)
assert identity_residual != s.zeros(16)
print('Spin-zero identity tile fails for this nonvacuum endpoint, as B4 predicts')

# Formal cochain Stokes: two adjacent squares and arbitrary edge variables.
w = s.symbols('w0:7')
left = w[0]+w[6]-w[4]-w[5]
right = w[1]+w[2]-w[3]-w[6]
if args.mutate_shared_edge:
    right += 2*w[6]  # Wrong orientation on the shared edge.
outer = w[0]+w[1]+w[2]-w[3]-w[4]-w[5]
assert s.expand(left+right-outer) == 0, 'shared edge did not cancel'
print('Stokes for two cells holds for seven algebraically independent edge values')
m,n = s.symbols('m n', integer=True)
potential = lambda x,y: x*x
lap = sum(potential(x,y) for x,y in [(m+1,n),(m-1,n),(m,n+1),(m,n-1)])-4*potential(m,n)
assert s.expand(lap) == 2
horizontal = s.expand(potential(m+1,n)-potential(m,n))
vertical = (potential(m,n+1)-potential(m,n))/s.I
assert horizontal == 2*m+1 and vertical == 0
face = horizontal+s.I*vertical-horizontal-s.I*vertical
assert face == 0
print('Closed cochain from G=m^2: horizontal F=2m+1, vertical F=0; Laplacian(G)=2')
print('PASS: charged-edge gluing, number-changing cut move, identity obstruction and Stokes')
