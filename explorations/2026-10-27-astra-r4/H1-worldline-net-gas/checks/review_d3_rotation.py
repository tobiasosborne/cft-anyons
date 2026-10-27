#!/usr/bin/env python3
"""Opus REVIEW check for H1-D3 (presentation dependence of the RP witness).

NOTE H1-D3 (D6): h = S on three isometric copies of one charge block,
S = [[0,1,-1],[1,0,1],[-1,1,0]]; closed matrix-unit triangle negative.
Claim checked here: the sign is an artefact of the chosen multiplicity
basis.  S is real symmetric, so a real orthogonal change of the three
isometric inclusions (an allowed unitary change of fusion-multiplicity
basis of that block, CONVENTIONS (al) cut bases) diagonalises exp(tS) with
entries e^t, e^t, e^{-2t} > 0, so every history in the rotated presentation
is positive on a single bond.  Mutation: un-rotated basis must still give
the NOTE's -343/1728.  Setting any; L0 (any C, unit-copy block); finite.
"""
import sympy as sp
S = sp.Matrix([[0, 1, -1], [1, 0, 1], [-1, 1, 0]])
t = sp.log(2)
T = (t*S).exp().applyfunc(sp.nsimplify)
vecs = [v for val, mult, vs in S.eigenvects() for v in vs]
P = sp.Matrix.hstack(*sp.GramSchmidt(vecs, orthonormal=True))
assert (P.T*P).applyfunc(sp.simplify) == sp.eye(3), 'orthogonal rotation'
R = (P.T*T*P).applyfunc(sp.simplify)
assert all(R[i, j] == 0 for i in range(3) for j in range(3) if i != j)
assert sorted(R[i, i] for i in range(3)) == [sp.Rational(1, 4), 2, 2]
print('PASS: rotated seam is diagonal with entries', [R[i, i] for i in range(3)])
tri = sp.nsimplify(T[1, 0]*T[2, 1]*T[0, 2])
assert tri == -sp.Rational(343, 1728), tri
print('MUTATION (unrotated basis) reproduces NOTE triangle', tri)
print('VERDICT: D3 separates RP from termwise positivity in a FIXED presentation;'
      ' at one bond a multiplicity-basis rotation removes the sign.')
