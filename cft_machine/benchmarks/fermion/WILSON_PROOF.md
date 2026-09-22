# Actual microscopic Dirac states in the Wilson triangle

**Status:** local derivation for the source Hamiltonian and refinement,
with finite checked instances. Conventions: root (w),(x).
Source: `references/text/CFTFromLatticeFermions.txt`, Eqs. (7), (44)–(48),
(110). Unlike the exactly compatible chiral sea, these finite Dirac states
change with the fine scale. Matrices use interleaved component ordering.

Let P_Q(r)=(I-h_Q(r)/E_Q(r))/2 be the negative-energy spectral projection
of the massless two-component source Hamiltonian, with ε_Q=2π/Q and
E_Q(r)=2|sin(ε_Q r/2)|/ε_Q. The actual pure quasi-free microscopic state
has covariance P_Q. Its pullback to the coarse CAR algebra with M momenta
has covariance P_(M,Q)=J_M,Q* P_Q J_M,Q, with J=J_momentum tensor I_2.
All statements below fix M while Q increases dyadically.

## Proposition WS-1: a nontrivial computable horizontal limit

**ASSUME:** fixed even coarse window M, nested fine windows Q>=M increasing
by factors of two, the preceding massless Dirac negative-energy quasi-free
states, and the source sharp momentum CAR refinements.

**PROVE:** exact row pullback composition, the stated covariance-error
formula, and a summable dual state-norm drift with computable tail
ε_Q sum_(r in Γ_M)|r|/2 for this fixed row.

**PROOF:**

<1>1. The row covariance limit is the block matrix
P_(M,infty)(r)=(I-sign(r) sigma_y)/2, and
||P_(M,Q)-P_(M,infty)||=sin(ε_Q max_(r in Γ_M)|r|/4).

  <2>1. Put x=ε_Q r; since r belongs to Γ_Q, |x|<π and r!=0.
  Dividing the source symbol by its positive energy gives the unit vector
  (-|sin(x/2)|,sign(r)cos(x/2),0) in Pauli coordinates.
  <2>2. The limiting unit vector is (0,sign(r),0). The difference of
  the associated half-projectors has norm one-half the Euclidean vector
  difference, equal to sin(|x|/4). This follows directly by squaring the
  difference and using sigma_x sigma_y+sigma_y sigma_x=0.
  <2>3. The full matrix is a direct sum of these blocks. Its norm is the
  maximum block norm, which gives the formula and the bound
  ε_Q max|r|/4. Tests verify the nonzero drift and the exact expression.

<1>2. Adjacent fine scales have block distance
||P_Q(r)-P_(2Q)(r)||=sin(ε_Q|r|/8).

  <2>1. Their Pauli unit vectors differ by an angle ε_Q|r|/4.
  The same half-projector calculation gives the stated sine.
  <2>2. Pullback composition holds exactly: J_M,2Q=J_Q,2Q J_M,Q.
  Therefore iterated and direct covariance rows agree. This is the actual
  Wilson refinement triangle, not a comparison of unrelated states.

<1>3. The quasi-free state on a fixed coarse row factors over its M
independent two-mode momentum blocks, each with density matrix
rho_Q(r)=0 direct-sum P_Q(r) direct-sum 0 on Fock dimensions 1+2+1.

  <2>1. Each P_Q(r) has rank one. The displayed density is the one-particle
  occupied-orbital pure state, with two-point covariance P_Q(r).
  <2>2. Fix any ordering of the momentum blocks. The tensor product of these
  even states has zero cross-block covariance. Within blocks, the two-point
  function agrees; higher correlations obey the determinant formula Eq. (7),
  lines 738–742, since the covariance is block diagonal. That formula
  determines the finite quasi-free state on CAR monomials, proving equality.
  <2>3. Although this proof refers to the finite Fock algebra, the code
  constructs only the individual 4-dimensional density matrices as an
  independent oracle. It never builds the full many-body tensor product.

<1>4. The adjacent **dual state-norm**, not just covariance-norm, drift obeys
||omega_(M,2Q)-omega_(M,Q)|| <= ε_Q sum_(r in Γ_M)|r|/4.

  <2>1. In finite matrix algebras the norm of a functional with density
  difference D equals its trace norm: diagonalize Hermitian D; the upper
  bound is sum|eigenvalues|, attained on its sign matrix.
  <2>2. For a single block the trace norm distance is twice the
  half-projector norm, hence 2sin(ε_Q|r|/8)<=ε_Q|r|/4.
  <2>3. Telescope the tensor products one block at a time. A density matrix
  tensor factor has trace norm one, and trace norm is multiplicative on
  tensor products (diagonalize the positive absolute values). Triangle
  inequality therefore bounds the full distance by the sum of block
  distances. Combine with <2>2.

<1>5. The dyadic tail is explicitly bounded by
||omega_(M,infty)-omega_(M,Q)|| <= ε_Q sum_(r in Γ_M)|r|/2.

  <2>1. Sum <1>4 over Q,2Q,4Q,...; the spacings form a geometric series
  with sum 2ε_Q. This is WT-1's summable drift hypothesis, with a computable
  row-wise modulus, now derived from microscopic states.
  <2>2. Alternatively telescope against the product limiting state and use
  the direct block distance 2sin(ε_Q|r|/4)<=ε_Q|r|/2.
  <2>3. Both arguments give the same bound. The numerical value may exceed
  the universal state-distance bound 2 at small Q; this makes it loose,
  not false. No assertion of a uniform-in-M tail is made.

<1>6. QED BY <1>1–<1>5.

This establishes the horizontal state component for the source's sharp
momentum CAR refinement. Sharp momentum refinement is spatially nonlocal
(Eq. (112), lines 1880–1889). Local-net reconstruction and the Majorana
observable-sector bridge still require their separate sourced results.
