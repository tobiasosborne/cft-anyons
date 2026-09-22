# Smooth coset stress limits and their microscopic unitaries

**Status:** local analytic construction using CR-1/CR-2 and a registered
energy-bound/self-adjointness theorem. No finite-lattice Virasoro identity,
local quartic Hamiltonian, or coset observable OAR identification is inferred.
This closes a symmetry convergence gap without claiming those separate results.

Conventions: (z),(ab). Source abbreviations:

- CW: `references/cft-machine/coset-symmetry/CarpiWeiner2004/source.tex`.
  `:721–747` gives a mode-energy bound with constant depending only on c;
  `:750–788` defines weighted Fourier sums on Dom L0; `:864–936` proves
  essential self-adjointness; `:939–976` gives strong resolvent continuity.
  `:390–445` relates the irreducible representation to smooth Diff flows.
- GKO: `references/cft-machine/virasoro/GoddardKentOlive1986/source.txt:35–82,165–233`,
  unitary highest-weight representations, coset stress and branching.
- OS: `references/text/CFTFromLatticeFermions.txt:1451–1558`, global CAR
  inductive/GNS construction and operator seminorms; `:3497–3530`, the
  strong-resolvent to compact-time strong-unitary implication.
- KL: `references/cft-machine/realisation/KawahigashiLongo2002/source.tex:624–635,1008–1024`,
  the vacuum Virasoro representation/net and diagonal coset identification.
- Local dependencies: `coset_route.md`, CR-1 and CR-2, including its
  no-wrap prescription, auxiliary free energy E and adjointness proof.

## Construction and statement

Fix k>=1 and the CR-1 ambient sea GNS representation with finitely many
flavors. Write D=union_e Ran(P_e), where P_e is the finite-free-energy
projection of CR-2; these are not spectral cutoffs of the coset Hamiltonian.
For real f put fhat_n=(2pi)^(-1) integral f(x)exp(-inx)dx and assume

`||f||_(3/2)=sum_n |fhat_n|(1+|n|^(3/2))<infty`.

Smooth real f satisfies this condition. The continuum operator is
T(f)=closure(sum_n fhat_n C_n). At even microscopic M use THREE cutoffs:

`R_M=floor(M/8), K_M=floor(M/16),`
`T_M(f)=sum_(|n|<=K_M) fhat_n C_(M,n,R_M)`.

This is an explicit finite CAR polynomial of degree at most four. Its
represented lift is `A_M(f)=pi_infty(alpha_infty^M(T_M(f)))` on the full
ambient Hilbert space. It is **not** the corner extension V_M T_M V_M*:
the CAR homomorphism acts as the identity on spectator algebra factors.
Each A_M(f) is bounded and self-adjoint by conjugate symmetry of fhat and
CR-2 finite adjointness. No uniform bound on ||A_M(f)|| is assumed.

For an effective input, f must supply its finitely requested Fourier
coefficients to certified accuracy. Real-conjugate approximations also work
if the norm of the resulting finite CAR polynomial error tends to zero.
A computable upper bound is the sum of absolute monomial coefficients:
normalized CAR generators have norm at most one, so this bound requires
no many-body diagonalization. Choose coefficient accuracy using that finite
bound. Smoothness and Fourier-tail summability are hypotheses, not properties
certified by a finite coefficient list.

**THEOREM SC-2 (proved below):** A_M(f) converges to T(f) on D and in the
strong resolvent sense. Their unitary groups converge strongly, uniformly
for t in compact real intervals. Finite products of such unitary groups
also converge strongly. On the coset vacuum module the limit is the sourced
projective Diff stress representation. No assertion identifies the entire
ambient sector sum with a single vacuum representation.

## SC-1: the common core and spectator multiplicities

**ASSUME** the CR-1 Virasoro representation on D, adjoint pairing, and
[E,C_n]=-n C_n. E>=0 has finite-dimensional eigenspaces and half-integer
spectrum; this follows from finitely many flavors and excitation energies
|r|>=1/2. Import the unitary highest-weight Virasoro energy estimate and
self-adjoint smeared operators from CW on each irreducible module.
**PROVE** the continuum T(f) has a self-adjoint closure with D a core and
satisfies the c-dependent bound
`||T(f)xi||<=r_c ||f||_(3/2) ||(1+C_0)xi||` on Dom C_0.

<1>1. D decomposes orthogonally into unitary highest-weight modules.
  <2>1. Work in increasing E-eigenspaces. Previously generated descendant
  modules are invariant under every C_n; their algebraic orthogonal
  complement is invariant by adjoint pairing and preserved by E.
  At the lowest remaining E, all positive C_n annihilate.
  <2>2. C_0 preserves this finite-dimensional space and is Hermitian.
  Diagonalize it and choose orthonormal seed vectors v. If C_0v=hv,
  then ||C_-1 v||²=2h||v||², so h>=0. Descendants carry C_0 energies
  h+j and free energies E(v)+j for integers j>=0.
  <2>3. Descendants of orthogonal seeds are orthogonal: move positive
  modes to the other side of the inner product using adjoints, then the
  Virasoro relations reduce equal-grade inner products to polynomials
  in h,c times seed inner products. Seeds chosen from a previous module's
  orthogonal complement remain orthogonal at every grade.
  <2>4. Any proper reducing submodule has a lowest-grade vector, since
  the C_0 spectrum is graded and bounded below; that vector is singular.
  A cyclic unitary highest-weight module has no such nonzero vector: a positive-grade singular descendant would be
  orthogonal to every descendant of its seed after moving raising modes,
  and hence to itself. Its norm would vanish. This identifies the usual
  irreducible unitary highest-weight quotient of GKO:35–82.
  <2>5. Finite E multiplicity makes the construction exhaust each E block
  after finitely many seeds at that grade. Thus the Hilbert completion is
  a countable orthogonal sum of these modules, including multiplicities.
  QED BY <2>1–<2>4 and density of D.

<1>2. CW applies modulewise with one constant r_c.
  <2>1. Each seed is a unitary positive-energy highest-weight Virasoro
  module at the fixed CR-1 c. GKO:35–82 restricts its h to the unitary
  minimal list; uniqueness by (c,h), CW:390–445, and the minimal-net
  sector covariance in KL:1161–1178 supply the source representation. CW:721–747 explicitly makes r_c
  independent of lowest weight. Squaring and summing its bound extends
  it to arbitrary multiplicities.
  <2>2. CW:864–936 gives a self-adjoint T(f) in each module, with its
  finite-C_0-energy vectors as a core. The direct sum of those closures
  is self-adjoint, since its resolvents are the bounded direct sums of
  the component resolvents at nonreal spectral parameters.
  <2>3. The algebraic sum of these component cores is D: each module
  starts at a finite free energy, and each fixed E block is exhausted
  in <1>1. Finite direct sums of graph approximations establish that D
  is a core for the direct-sum T(f).
  <2>4. The C_0 operator is likewise the self-adjoint direct sum of its
  finite E-block restrictions. Summing the CW estimates gives the stated
  bound on Dom C_0. QED BY <2>1–<2>3.

<1>3. QED BY <1>1–<1>2.

The entire ambient sum can contain distinct lowest weights h, so
exp(2pi*i*C_0) need not be scalar there. We do not use CW's global scalar
rotation-phase assumption on that ambient sum. The import is modulewise;
one-parameter groups and direct sums are well defined regardless. The
vacuum module h=0 has the sourced projective Diff(S1) representation.

## SC-2: simultaneous Fourier/current cutoff convergence

**ASSUME** SC-1, the displayed cutoffs, and the source CAR lifts above.
**PROVE** the stated core, strong-resolvent and unitary limits.

<1>1. On every fixed P_e, all retained microscopic modes agree exactly
with their continuum modes for sufficiently large M.
  <2>1. CR-2 requires R_M>e+|n| and M/2-1/2>e+2R_M.
  For every |n|<=K_M it suffices that R_M>e+K_M.
  <2>2. The bounds R_M>=M/8-1, K_M<=M/16 show
  R_M-K_M>=M/16-1. Also 2R_M<=M/4. Thus both conditions eventually
  hold simultaneously for all retained n; M>=32(e+1) is sufficient.
  <2>3. Consequently A_M(f)xi=sum_(|n|<=K_M) fhat_n C_n xi for
  xi in P_e. This is equality of operator actions, not merely of vacuum
  expectations. QED BY <2>1–<2>2 and CR-2.

<1>2. A_M(f)xi converges to T(f)xi for every xi in D.
  <2>1. After the threshold in <1>1 the difference consists only of the
  continuum Fourier tail. SC-1 bounds its norm by
  `r_c ||(1+C_0)xi|| sum_(|n|>K_M)|fhat_n|(1+|n|^(3/2))`.
  <2>2. The scalar tail tends to zero by the displayed summability
  hypothesis. No finite-lattice energy estimate or exchange of infinite
  sums is needed. QED BY <2>1.

<1>3. The convergence is strong resolvent convergence on the ambient H.
  <2>1. Let A=T(f). For xi in its core D,
  `(A_M-i)^(-1)(A-i)xi-xi=(A_M-i)^(-1)(A-A_M)xi`.
  Its norm tends to zero by <1>2 and ||(A_M-i)^(-1)||<=1.
  <2>2. The set (A-i)D is dense because A is self-adjoint and D is its
  graph core. Resolvent norms are uniformly bounded, so convergence
  extends from this set to every vector. The same argument applies at
  -i. QED BY <2>1, SC-1, and bounded extension from a dense set.

<1>4. `exp(it A_M(f))xi -> exp(it T(f))xi` strongly, uniformly for t
in compact sets, and finite products converge.
  <2>1. Apply the self-adjoint strong-resolvent/unitary implication used
  explicitly in OS:3497–3516. Its hypotheses are exactly <1>3 and finite
  self-adjointness, not an assumed lattice projective group relation.
  CW:954–976 independently records the same implication for stress sums.
  <2>2. For finitely many f,t, telescope the product difference and use
  that all factors have operator norm one. Each difference acts on a
  fixed limiting vector and tends strongly to zero.
  <2>3. QED BY <2>1–<2>2.

<1>5. QED BY <1>1–<1>4.

## What this supplies, and what it does not

For real smooth interval-supported f, the limit restricted to the coset
vacuum module is its stress-flow unitary. KL's continuum coset theorem
identifies the corresponding Virasoro net. The finite polynomials are
explicit microscopic symmetry approximants; exponentiating them is a
well-defined finite CAR algebra operation. No exponentiation was computed
on a large many-body space in this work.

The theorem does not claim finite A_M(f) preserve the continuum vacuum
module exactly. They act in the ambient lattice/CAR construction and converge
there; the reducing vacuum module belongs to the **limit** representation.
Nor does one-parameter convergence supply a finite lattice representation
of Diff(S1), or remove ambient current and charge sectors. A local positive
Hamiltonian and a coherent category-faithful coset observable system remain
separate problems.

This result is stronger than convergence of each fixed mode, but weaker
than a general uniform energy bound for arbitrary finite-lattice smearings.
It relies on the coordinated schedules K_M and R_M and on the exact CR-2
finite-section identity. If a different microscopic model loses that exact
identity, the continuum tail estimate alone does not control its lattice
tail, and a new uniform bound is necessary.
