# Microscopic Virasoro: a graph-norm refinement bridge

Status: research proposal with a conditional local derivation below. This note
constructs limiting operators from microscopic certificates; it does not prove
that a general input category supplies those certificates.

Sources and dependencies (paths are repository-relative):

- **OS**: `references/text/CFTFromLatticeFermions.txt:221–247`, Theorem A:
  strong Koo–Saleur convergence on a common finite-energy core in the massless
  free-fermion scaling-limit representation; `:4221–4228`, Theorem 5.1:
  smeared current convergence; `:4248–4251`, level-one nonabelian currents.
- **ZW**: `references/lattice-symmetry/ZiniWang2018/source/main.tex:125–129`
  separates proved Ising from conjectural general unitary minimal models;
  `:418` records the RSOS/anyon Hamiltonian relation;
  `:437–442` records energy-shift and cutoff-error hypotheses;
  `:447–462` distinguishes recovering observables as an algebra from obtaining
  individual limiting operators.
- **HKV**: `references/lattice-symmetry/HonglerKytolaViklund2022/source/lattice-virasoro-updates-final.tex:565–605`
  defines correlation-null lattice fields and states the exact lattice Sugawara
  construction on their quotient; `:2900–2909` gives the dGFF Virasoro theorem.
- **OAR**: `literature/md/2010.11121/2010.11121.md:101–111`, strict unital
  scaling morphisms and their composition law.
- **Soft**: `literature/md/2306.16063/2306.16063.md:350–360`, Lemma 24:
  asymptotic intertwining and composition for uniformly bounded operators
  between inductive systems. The derivation below is a graph-norm version of
  this mechanism with an explicit summable-error certificate.

## Route choice

The missing bridge selected here is **transport of energy-controlled operator
products through refinement**. Spectral matching and vacuum commutator fits do
not provide this transport. A compiler should construct microscopic modes and
refinements jointly, with an error certificate for their compatibility.

| Route | Existing mathematical resource | Remaining bridge for this compiler |
|---|---|---|
| Integrable/RSOS/anyon chains | ZW's Ising theorem and explicit energy-local approximation conjecture | Prove quantitative bounds beyond the proved model and supply compatible local scaling morphisms |
| Discrete holomorphic/Sugawara | HKV exact Virasoro on correlation-equivalence classes | Construct a positive quantum Hilbert realization and OAR comparison; the quotient is not automatically a GNS quotient |
| Free fermion/current construction | OS strong modes and smeared-current convergence | Extend the controlled current sector and prove the intended sector category, rather than assuming the input MTC |
| Inverse CFT discretization | Proposed spectral compression of an independently supplied rigorous target | Prove microscopic locality and category-derived construction; compression alone presupposes the target |
| Categorical anyon words | The repo's explicit finite observable tower, CA-65–CA-73 | Find dynamics, state, and refinements satisfying analytic estimates, then prove continuum locality and fidelity |

The recommendation is a two-track construction: use the sourced free-fermion
route as an analytic calibration, and search the categorical tower for the same
operator-product certificates. This does not require lattice modes to satisfy
an exact Virasoro algebra at each finite size. HKV supplies a different exact
algebraic carrier, not a contradiction to that distinction.

## Theorem VR-1: summable transport constructs the mode algebra

Conventions: CONVENTIONS (u), (v), and the central ledger (s). The result is a
local derivation inspired by Soft Lemma 24, not a theorem attributed to OS.

ASSUME:

A1. Each H_N is a finite-dimensional Hilbert space, J_N is isometric,
and K_N is positive with K_N >= 1 and K_(N+1) J_N = J_N K_N.
K_N is an auxiliary regularity control, not necessarily the Hamiltonian.
Let i_N:H_N -> H be the embeddings in the completed Hilbert inductive limit.

A2. For every integer n and nonnegative integer s, there is a finite constant
C_(n,s), independent of N, such that
`||T_(N,n) v||_(N,s) <= C_(n,s) ||v||_(N,s+1)`.
The microscopic adjoints satisfy `T_(N,n)^* = T_(N,-n)`.

A3. For every n,s there are certified nonnegative errors e_(N,n,s) with
`sum_N e_(N,n,s) < infinity` and
`||(T_(N+1,n) J_N - J_N T_(N,n))v||_(N+1,s)
 <= e_(N,n,s) ||v||_(N,s+1)`.

A4. For every m,n define, with fixed real c and c_star,
`z_mn = delta_(m+n,0) (m^3 c_star - m c)/12` and
`R_(N,m,n) = [T_(N,m),T_(N,n)] -(m-n)T_(N,m+n)-z_mn 1_(H_N)`.
There are q_(N,m,n,s) -> 0 such that
`||R_(N,m,n)v||_(N,s) <= q_(N,m,n,s)||v||_(N,s+2)`.

PROVE: There is a dense invariant smooth domain D in H and operators T_n on D
with adjoint pairing, every finite word of microscopic modes converges on D,
and `[T_m,T_n]=(m-n)T_(m+n)+z_mn 1` on D.
This is an algebraic positive-inner-product representation on a common domain;
positive energy and group integration are not conclusions.

<1>1. Construct the regularity spaces H_s and the smooth domain D.
  <2>1. Complete the algebraic union of i_N H_N in norm ||K_N^s v||.
         The norm is well-defined across embeddings BY A1.
  <2>2. K_N commutes with the projection onto every earlier embedded space:
         an invariant subspace of a finite-dimensional self-adjoint operator
         is reducing. Consequently P_N=i_N i_N^* is contractive on every H_s,
         and P_N -> 1 strongly on H_s BY density of the algebraic union.
  <2>3. H_(s+1) embeds continuously and injectively into H_s. One explicit
         verification decomposes the union into successive orthogonal
         complements of i_(N-1)H_(N-1) in i_N H_N; K is block diagonal there,
         so H_s is the weighted Hilbert sum of the same finite blocks.
  <2>4. Set D=intersection_(s>=0) H_s. It contains the algebraic union,
         so it is dense in H=H_0 BY <2>1–<2>3.
  <2>5. QED BY <2>1–<2>4.

<1>2. Construct each limiting mode with a quantitative tail bound.
  <2>1. For v in H_N and M>N, telescope the adjacent defects in A3:
         `||i_M T_(M,n) J_(M<-N)v-i_N T_(N,n)v||_s
           <= (sum_(k=N)^(M-1) e_(k,n,s)) ||v||_(N,s+1)`.
         Here J_(M<-N) is the ordered composition of refinements.
         All transported norms agree BY A1.
  <2>2. These sequences converge in H_s BY A3 and completeness.
         The limits for different s agree under the embeddings of <1>1.
         Changing the initial scale gives the same limit BY the same sequence.
  <2>3. Define T_n on the algebraic union by that limit. It extends to a
         bounded map H_(s+1)->H_s of norm at most C_(n,s) BY A2 and density.
         The extensions agree; in particular T_n(D) is contained in D.
  <2>4. Write d_(N,n,s)=sum_(k>=N)e_(k,n,s). For v in H_N,
         `||T_n i_N v-i_N T_(N,n)v||_s <= d_(N,n,s)||v||_(N,s+1)`.
         For arbitrary v in H_(s+1), writing A_(N,n)=i_N T_(N,n)i_N^*,
         `||(A_(N,n)-T_n)v||_s <= d_(N,n,s)||v||_(s+1)
                                      + C_(n,s)||(1-P_N)v||_(s+1)`.
  <2>5. QED BY <2>1–<2>4. Both terms in <2>4 tend to zero.

<1>3. Every finite word converges, with a computable coarse-vector error.
  <2>1. For w=(n_1,...,n_r) let W_N=T_(N,n_1)...T_(N,n_r).
         A2 gives `||W_N||_(H_(N,s+r)->H_(N,s))
                       <= product_(j=1)^r C_(n_j,s+j-1)`.
  <2>2. Expand the difference between a refined word and the coarse word
         by replacing one factor at a time. A3 bounds its one-step error by
         `E_(N,w,s) = sum_(a=1)^r e_(N,n_a,s+a-1)
                          product_(j != a) C_(n_j,s+j-1)`
         times the input H_(N,s+r) norm. There are exactly r terms; all
         term is a fine-scale prefix, the defect
         `(T_(N+1,n_a)J_N-J_N T_(N,n_a))`, and a coarse-scale suffix.
         This direct telescoping identity requires no cancellation of `J_N J_N^*`.
  <2>3. Repeating <1>2 gives convergence and, for v in H_N, error at most
         `(sum_(k>=N) E_(k,w,s)) ||v||_(N,s+r)`.
  <2>4. The limiting word is T_(n_1)...T_(n_r), not a new operation:
         use the identity AB-ab=A(B-b)+(A-a)b between consecutive graph
         spaces, strong convergence in <1>2, and uniform bounds in <2>1.
         Induct on word length. For arbitrary v in H_(s+r), add
         `(product_j C_(n_j,s+j-1))||(1-P_N)v||_(s+r)` to the tail estimate.
  <2>5. QED BY <2>1–<2>4.

<1>4. The residuals give the bracket and the adjoint pairing survives.
  <2>1. Under i_N, the finite identity becomes P_N, not 1_H. Its limit is
         1_H on every H_s BY <1>1. Thus the embedded residual tends to the
         asserted bracket BY <1>2 and <1>3, and tends to zero BY A4.
  <2>2. For v,w in D, pass to the limit in
         `<A_(N,n)v,w>=<v,A_(N,-n)w>` using <1>2 at s=0.
         This proves adjoint pairing on D, not equality of closed-operator
         adjoints or essential self-adjointness.
  <2>3. QED BY <2>1–<2>2.

<1>5. QED BY <1>1–<1>4.

## What this construction does and does not buy

The compiler can now search finite matrices for T, J, K jointly and seek
analytic majorants, e.g. `e_(N,n,s)<=a_(n,s)rho^N` with a certified `rho<1`.
Then `d_(N,n,s)<=a_(n,s)rho^N/(1-rho)` feeds the explicit word estimate.
A finite observed decay trend is not a proof of this all-scale bound. In
particular, Hilbert-space operator norms without the graph weights can grow
while every stated certificate remains valid.

An OAR application still needs local unital scaling morphisms and compatible
states that produce these J_N in their GNS representations. Arbitrary Hilbert
isometries do not provide them: `a -> J_N a J_N^*` maps the unit to a corner
projection. This theorem tracks P_N correctly but does not turn that corner
map into a unital local observable embedding. State descent and multiplicative
transport must be separately verified, as must locality of limiting fields.

The theorem is deliberately stringent in its exact K intertwining. K is a
regularity scale that one may build from compatible blocks; proving uniform
mode bounds relative to it is the substantive condition. Replacing exact K
intertwining by uniformly equivalent transported graph norms with summable
norm distortion is a possible extension, not proved here.

The two central constants remain separate. Their equality in a chosen
normalization, positivity of the rotation generator, essential
self-adjointness of real smeared fields, integration to the required
projective unitary symmetry, and modular fidelity remain independent proof
obligations. No step identifies a sector category from Virasoro alone.

## Obstruction VR-2: vacuum-null does not imply operator-null

ASSUME H is the two-dimensional Hilbert space with orthonormal basis e_0,e_1,
Omega=e_0, R=|e_1><e_1| and B=|e_1><e_0|+|e_0><e_1|.
PROVE: R annihilates the vacuum but does not annihilate its observable orbit.

<1>1. R Omega=0 BY the orthogonality of the two basis vectors.
<1>2. B Omega=e_1, so RB Omega=e_1 and ||RB Omega||=1 BY the definitions.
<1>3. QED BY <1>1–<1>2.

This exact finite calculation rejects a vacuum-only replacement for A4. A
usable weaker residual hypothesis must control R applied to a dense,
energy-controlled family of observable words, including the products needed
when taking limits. It is not enough to make the vacuum residual small.
