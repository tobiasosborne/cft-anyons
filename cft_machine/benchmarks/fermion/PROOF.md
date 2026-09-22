# A source-modified free-fermion machine instance

**Status:** source-local construction plus checked finite arithmetic and local
proofs. This is an analytic benchmark backend, not an implementation of a
functor from an arbitrary category. Conventions: root `CONVENTIONS.md` (w).
Source registry: `references/cft-machine/fermion/SOURCES.md`.
All source line numbers below refer to
`references/text/CFTFromLatticeFermions.txt`.

## Objects and claims

Let Γ_M={-M/2+1/2,...,M/2-1/2}, ε_M=2π/M, and let {e_r} be
orthonormal. Define a_n^M(r)=cos²(ε_M n/4)sin(ε_M(r-n/2))/ε_M.
The matrix A_n^M maps e_r to a_n^M(r)e_(r-n) when both labels lie in
Γ_M, and to zero otherwise. It is the **modified** chiral KS mode
(Eqs. (197)–(199), lines 3379–3420). The corresponding continuum mode
B_n e_r=(r-n/2)e_(r-n) acts on finite-support half-integer sequences.

### Proposition: refinement, modes and the Wilson triangle

**ASSUME:** the preceding AP grids and source-modified coefficients; nested
finite windows; for every core estimate all shifted core labels stay inside
the coarse window. Continuum operators act on finite-support sequences.

**PROVE:** exact refinement composition and isometry, adjointness, the
continuum Witt identity, the displayed summable generator-triangle bound,
and exact pullback compatibility of the limiting chiral sea.

**PROOF:**

<1>1. The zero-padding maps J_M,Q compose exactly and preserve the scalar product.

  <2>1. For nested windows M<=Q<=R each basis e_r is mapped to the same label.
  <2>2. Orthogonality gives J_M,Q* J_M,Q=I and J_Q,R J_M,Q=J_M,R.
  <2>3. This is Definition 3.9 / Proposition 3.10, lines 1843–1879,
  expressed in orthonormal momentum coordinates. Second quantization through
  CAR generators gives the source's unital injective algebra map, not a
  corner embedding of many-body matrix algebras.

<1>2. A_n*=A_-n, and [B_m,B_n]=(m-n)B_(m+n) on finite support.

  <2>1. Reverse a permitted transition r -> r-n. Its reverse midpoint is
  (r-n)-(-n)/2=r-n/2, and cos² is even. The reverse coefficient agrees.
  <2>2. Write x=r-(m+n)/2. The two product coefficients are
  (x+m/2)(x-n/2) and (x+n/2)(x-m/2). Their difference is (m-n)x.
  <2>3. Exact rational tests use compressed B matrices only on columns where
  all intermediate and final labels stay in the window. No full finite
  matrix Witt algebra is asserted.

<1>3. On a fixed core |r|<=R whose shifted labels remain in Γ_M,
|| (A_n^M-B_n) P_R || <= max_|r|<=R D_M(n,r), where
D_M(n,r)=ε_M²(|r-n/2|³/6+n²|r-n/2|/16).

  <2>1. Put q=r-n/2, u=ε_M n/4. The fundamental theorem of calculus
  gives |sin x-x|<=|x|³/6: integrate |cos t-1|<=t²/2, obtained by
  integrating |sin s|<=|s|. Also |1-cos²u|=sin²u<=u².
  <2>2. Subtract q from cos²u sin(ε_M q)/ε_M and use the triangle
  inequality, |cos²u|<=1 and the two preceding inequalities. This is D_M.
  <2>3. Different input labels map to distinct output labels. The norm of
  the restricted weighted shift is the maximum absolute coefficient.
  <2>4. Add and subtract the common continuum B_n under the inclusions.
  Thus ||(A_n^(2M)J_M,2M-J_M,2M A_n^M)P_R|| is bounded by
  max_|r|<=R [D_2M(n,r)+D_M(n,r)]. This proves a summable O(4^-N)
  defect along M=2^N M_0, after the finite boundary threshold is passed.
  It is an analytic bound, not an exponent extracted from plotted data.

<1>4. The compatible chiral sea S_M=1_(r<0) satisfies
J_M,Q* S_Q J_M,Q=S_M.

  <2>1. Both sides have identical diagonal entries on every coarse label.
  <2>2. This is the limiting chiral sea of Eq. (169), lines 2794–2811.
  It is not asserted to equal the two-component lattice Dirac ground-state
  covariance at finite ε. Cutoff compatibility is not strict spatial locality
  (Eq. (112), lines 1880–1889).

<1>5. QED BY <1>1–<1>4.

### Proposition: normal ordering produces the central term

**ASSUME:** the preceding source-modified AP modes, fixed positive integer
n with M/2>n, and the negative-momentum projection S. Quantization uses
source Eqs. (26)–(28).

**PROVE:** the continuum complex Schwinger term is n(n²-1)/12 and the finite
modified cocycles converge to it; periodic wrapping invalidates this recipe.

**PROOF:**

<1>1. With S=1_(r<0), the Schwinger cocycle is
c_S(A,B)=Tr(S A(1-S)B S-S B(1-S)A S).

  <2>1. This is Eq. (27), line 886; Eq. (28), lines 890–892 inserts it
  into the commutator of normal-ordered complex second quantizations.
  It is not a central term of finite one-particle matrices themselves.

<1>2. For n>0 and M/2>n, c_S(B_n,B_-n)=(n³-n)/12.

  <2>1. The second trace vanishes, since B_n lowers momentum and cannot
  carry a negative occupied label into the positive unoccupied half-line.
  <2>2. The first trace sums squares over r=1/2,3/2,...,n-1/2:
  sum_(j=0)^(n-1) (j+(1-n)/2)².
  <2>3. Substituting sum j=n(n-1)/2 and sum j²=n(n-1)(2n-1)/6,
  each provable by induction, yields n(n²-1)/12.
  The code checks both the rational matrix trace and this independent sum.

<1>3. c_S(A_n^M,A_-n^M) converges to the same number.

  <2>1. The no-wrap convention restricts the two traces to exactly the same
  finite n transitions at the Fermi surface.
  <2>2. Each coefficient converges by <1>3 of the preceding proposition;
  the finite sum of squares therefore converges. The off-diagonal
  Hilbert–Schmidt error is bounded by the square root of the sum of D_M²
  over these transitions. This is the finite-sum mechanism of Eq. (201).
  <2>3. The source's Eq. (170), lines 2814–2828, identifies this with
  central charge c=1 and vacuum conformal weight zero.

<1>4. Periodic momentum wrap is a rejected alternative for this calculation.

  <2>1. It adds a second occupied/unoccupied crossing at the UV edge.
  <2>2. The negative control and a mutation of the implementation detect it.
  Removing those transitions is sourced Eq. (197), not a numerical filter.

<1>5. QED BY <1>1–<1>4.

## Lattice dynamics and theorem boundary

The implemented two-component massless Hamiltonian is Eq. (45), lines
1020–1034. The independent position-space oracle reconstructs the nearest
neighbor hopping of Eq. (44), including a minus sign across the AP seam.
The exact invariant h_M(r)²=[2sin(ε_M r/2)/ε_M]² I tests its dispersion.
This Dirac Hamiltonian and its projected chiral modified KS modes share the
source construction; the chiral zero mode alone is not the entire Dirac
Hamiltonian. No numerical ground-state-to-category identification is made.

Lemma 4.10 (lines 3459–3480) and Theorem 4.11 (lines 3483–3502) provide
strong convergence on the algebraic finite-excitation Fock core for this
modified cutoff construction. Corollaries 4.12–4.13 (lines 3506–3530)
provide the source's unitary and Bogoliubov convergence. These are **existing
theorem applications**, not conclusions inferred from nine finite matrices.
The local bound and finite Schwinger support above expose the hypotheses
used by that application. A local net reconstruction and the passage from
graded fermionic fields to bosonic observables remain distinct interfaces.

## Self-dual Majorana specialization

**ASSUME:** the same AP modes and sea; source self-dual CAR Eqs. (19),
(20), (26), (28); Gamma acts as antiunitary momentum reflection.

**PROVE:** self-dual admissibility, the explicit even quadratic recipe,
and the sourced half-cocycle n(n²-1)/24, without a sector-category claim.

**PROOF:**

<1>1. Let Gamma be the antiunitary conjugation Gamma e_r=e_(-r).
Then Gamma S Gamma=I-S and Gamma (A_n^M)* Gamma=-A_n^M.

  <2>1. Reflection interchanges the negative and positive half-integer labels;
  there is no zero label in the AP sector. This proves the covariance identity.
  <2>2. The transpose reverses a transition, reflection reverses it again,
  and changes its midpoint sign. Sine is odd, cos² is even, and the symmetric
  no-wrap support is preserved. Thus its coefficient is negated.
  <2>3. This verifies the self-dual admissibility condition Eq. (19),
  lines 827–832, rather than assuming a complex matrix defines a Majorana mode.

<1>2. `majorana_recipe(M,n)` defines an even normal-ordered self-dual CAR
polynomial Q_n^M=(1/2) sum_ij A_n^M[i,j] Psi(e_i)* Psi(e_j)
                 -(1/2)Tr(S A_n^M) I.

  <2>1. Eq. (20), lines 833–840, defines the quadratic prescription;
  expansion of Psi(A e_j)* in the orthonormal basis gives these coefficients.
  Eq. (26), lines 879–881, gives the scalar subtraction.
  <2>2. Each quadratic monomial is even under Psi -> -Psi. This proves
  parity only; it does not identify the observable conformal net.
  <2>3. The code returns explicit row, column, coefficient triples and the
  scalar, together with the one-particle matrix and covariance. Tests
  reconstruct the matrix and verify zero normal-ordered expectation.

<1>3. The normal-ordered self-dual commutator has half the complex cocycle.

  <2>1. This is the source's Eq. (28), line 892, for admissible self-dual
  operators verified at <1>1. Applying the preceding Schwinger proposition
  gives n(n²-1)/24 for Q_n,Q_-n, exactly checked with rational arithmetic.
  <2>2. The source identifies c=1/2,h=0 in Eqs. (177)–(180),
  lines 2887–2911, and explicitly extends Theorem 4.11 to this setting.
  Its proof supplies the same finite-excitation convergence route.

<1>4. QED BY <1>1–<1>3 and the preceding Schwinger proposition.

The Majorana specialization therefore supplies sourced even microscopic
quadratic modes and their Virasoro limit. An Ising sector-category claim
still requires the independent identification of the limiting Virasoro net
and its representation category. The whole graded Majorana field algebra
is not identified with that bosonic net by this recipe.
