# E5 — Two-sided fidelity through normal expectations

Date: 2026-10-22. Status: **proved implication with explicit convergence hypotheses**;
no lattice realization or category-to-net existence theorem is asserted.

The finite-dimensional limit step is repaired below without commutants, Kosaki
index, or complete positivity of the **difference** `E_k - lambda id`.
Ordinary Pimsner–Popa inequalities suffice. A common normal auxiliary state
constructs the normal limiting expectation; exact compatibility gives an
equality of expectation-specific PP costs. A scalar normal-extension criterion
characterizes precisely the continuity needed in the compatible case.

Two qualifications to the brief are essential. The bounds must apply to the
expectations used in the convergence certificate, or these expectations must
be proved asymptotically minimizing. Also, `Z(C)` is the category of the
**doubled chiral subnet**, not the finite localized sector category of its
diagonal full extension. The latter assertion is false for every nontrivial
modular C with a net realization; the corrected corollary is proved below.

## Dependencies and scoped notation

Read: AGENTS.md, README.md, CONVENTIONS (a)–(ap), report maps and master,
CA-75 and CA-80, the latest worklog, and D5 NOTE/REVIEW/INTEGRATION.
CA-80 Proposition 80.8, Theorem 80.9, and Lemma 80.10 are dependencies, not
new results here. In particular neither scalar fusion operators nor a
vacuum-preserving annular expectation supplies the missing certificate.

Source abbreviations used with line numbers below:

- KLM = `references/cft-machine/realisation/KawahigashiLongoMuger1999/source.tex`.
- B = `references/cft-machine/realisation/Bischoff2018/source.tex`.
- FRS = `references/categorical-reconstruction/FuchsRunkelSchweigert2002/source/hep.tex`.
- CA80 = `report/sections/80_lattice_sewing_and_fidelity_certificate.tex`.

The following are definitions confined to this exploration, recorded before
use because the brief forbids editing CONVENTIONS.md. They refine (al), not
its index normalization. All inclusions and embeddings are common-unit.

1. For a normal unital completely positive N-bimodule projection
   `E:M -> N`, put
   `K(E)=inf{b>=1 : E(x)>=b^{-1}x for every x in M_+}` and
   `q(N⊂M)=inf_E K(E)`. Thus **cost** is the inverse of the best lower
   PP constant. The brief's inequality `PP<=Dim(C)` is read as an inequality
   for costs. KLM:430–443 supplies this normalization. For finite K the
   infimum in K(E) is attained by closedness of the positive cone.
   No assertion identifies finite-dimensional K(E) with a commutant index.
2. `D=Dim(C)=sum_i d_i^2`; `C_fus` forgets braiding only.
   `Cbar=C^rev` reverses braiding, `c^rev_{a,b}=c_{b,a}^*`, as in B:643–645.
   The center is `Z(C_fus)`. No numerical F/R gauge is introduced.
   A dagger tensor functor here has unitary unit and tensorator maps.
3. `E_geo=I_1 union I_3`; reserve `E` without subscript for an expectation.
   `N=A(E_geo)` and `M=A(E_geo')'` are the actual represented annular
   algebras of (al), not a tube algebra or an energy compression.
4. `s*` means strong convergence of operators and adjoints on a specified
   Hilbert space; `uw` means ultraweak convergence. Normality means
   preservation of bounded increasing positive suprema. We use the usual
   equivalent ultraweak continuity for bounded positive linear maps.
5. A **bounded exhaustion** by increasing algebras means that every x has
   bounded approximants `x_k in M_k`, `x_k -> x` in s*, and likewise for N.
   This is an explicit hypothesis. It avoids an implicit sequential-density
   assumption on a nonseparable representation. The usual bounded-density
   argument is used locally at Zini–Wang `source/main.tex:1133–1135`; it is
   not necessary to import a separate density theorem into our hypotheses.
6. `psi` is an auxiliary normal state, not the physical vacuum. Initially
   only `phi=psi|N` need be faithful. Finite PP will force psi faithful on M.
   The GNS vector `Omega_psi` is distinguished from the physical vacuum.

The operator-algebra statements G/L/J/N/X below have no categorical or
chirality input and by themselves reach no new CFT rung. F is chiral,
L2+L4, R4; D is the separately stated full-setting corollary. All proofs are
ordinary structured mathematical proofs, not proof-assistant verification.

## G. The minimal positive-graph passage

**Lemma E5-G [proven].** ASSUME a normal expectation `F:M->N`, normal
expectations `E_k:M_k->N_k` represented inside the same M,N, and
`b=liminf K(E_k)<infinity`. Choose `k_j` with `K(E_{k_j})->b`.
For every `x in M_+` ASSUME bounded positive `x_j in M_{k_j}` such that

    x_j -> x uw,             E_{k_j}(x_j) -> F(x) uw.               (G)

PROVE `K(F)<=b`, hence `q(N⊂M)<=b`.

<1>1. `E_{k_j}(x_j)-K(E_{k_j})^{-1}x_j >= 0`, BY the definition of K.
<1>2. Its ultraweak limit is `F(x)-b^{-1}x`, BY (G), boundedness and
`K(E_{k_j})^{-1}->b^{-1}`. For every normal positive functional f,
`f(F(x)-b^{-1}x)=lim_j f(E_{k_j}(x_j)-K(E_{k_j})^{-1}x_j)>=0`.
Normal vector functionals separate the positive cone. BY the quadratic-form
definition of positivity, `F(x)>=b^{-1}x`.
<1>3. QED BY <1>2 for every positive x and the definitions of K and q.

This is the weakest **convergence used by the order argument**: only the
positive graph along a subsequence realizing the liminf, tested by normal
positive functionals. Strong convergence, exact compatibility, Jones
projections, and matrix amplifications are unnecessary for this lemma.
Existence and normality of F are hypotheses here, not conclusions disguised
as convergence. There is no topology-independent claim of a unique
"weakest possible hypothesis". L constructs F; N gives an exact iff
criterion when the finite maps are compatible.

## L. Constructing the normal limit from finite expectations

**Theorem E5-L [proven].** ASSUME:

- increasing represented `N_k⊂M_k`, with bounded exhaustions of `N⊂M`;
- normal conditional expectations `E_k:M_k->N_k`;
- a normal state psi on M, faithful on N, with
  `psi(E_k(a))=psi(a)` for every `a in M_k`;
- `b=liminf_k K(E_k)<infinity`.

PROVE there is a unique psi-preserving normal expectation `E:M->N`,
`K(E)<=b`, E and psi are faithful, and (G) holds. The construction of the
normal expectation does not require the last hypothesis, nor does it
require `E_l|M_k=E_k`.

<1>1. Establish the pairing which determines every possible limit.

<2>1. For `n in N_r`, `k>=r`, and `a in M_k`,

    psi(n* E_k(a)) = psi(E_k(n* a)) = psi(n* a).                   (P)

BY bimodularity and state preservation.
<2>2. For any bounded `a_k in M_k` with `a_k -> x` in s*, the bounded
sequence `E_k(a_k)` has ultraweak cluster subnets in N. BY contractivity,
ultraweak compactness of a von Neumann algebra's closed bounded ball,
and ultraweak closedness of N. Every cluster y satisfies

    phi(n* y) = psi(n* x),              n in union_r N_r.          (Q)

BY (P) and normality of psi. The bounded strong limits here are ultraweak
limits; this follows by approximation of normal functionals by sums of
vector functionals. KLM:2758–2770 uses the same bounded-cluster method.
<2>3. Such y is unique. If y,z satisfy (Q), bounded approximation in N
extends `phi(n*(y-z))=0` to every n in N. Take `n=y-z` to get
`phi((y-z)*(y-z))=0`, hence y=z BY faithfulness of phi.

<1>2. Define `E(x)=y` using any bounded exhaustion of x. It is independent
of that choice; indeed (Q) characterizes it without reference to a sequence.
Every bounded approximating sequence has its images converging uw to E(x),
since all its cluster subnets have that same limit. BY <1>1.

<1>3. E is linear, unital, completely positive, maps into N, and fixes N.

<2>1. Add and scale bounded approximants; (Q) and uniqueness give
linearity. The constant unit sequence gives `E(1)=1`.
<2>2. For x positive, approximate its square root by bounded `a_k in M_k`.
Then `a_k* a_k -> x` in s*. Their positive E_k-images have positive
ultraweak limit E(x), BY <1>2 and closedness of the positive cone.
<2>3. For any positive matrix X over M, approximate the entries of
`X^{1/2}` simultaneously in M_k. The resulting matrices Y_k are uniformly
bounded (matrix size is fixed), and `Y_k*Y_k -> X` entrywise s*.
Apply the completely positive E_k entrywise and take the positive uw limit.
Thus every matrix amplification of E is positive.
<2>4. For `n in N`, bounded approximants `n_k in N_k` satisfy
`E_k(n_k)=n_k`; hence `E(n)=n`, BY <1>2. E is therefore a projection.

<1>4. E preserves psi and is normal.

<2>1. Set n=1 in (Q): `phi(E(x))=psi(x)`. Since E(x) lies in N,
this is `psi(E(x))=psi(x)`.
<2>2. If `0<=x_alpha increasing to x`, set `y=sup_alpha E(x_alpha)`
in N. Positivity gives `0<=y<=E(x)`, and

    phi(E(x)-y) = psi(x)-lim_alpha psi(x_alpha) = 0.

BY normality of phi and psi. Faithfulness of phi gives `y=E(x)`, proving
normality. This step is exactly what finite-stage normality alone cannot do.

<1>5. E is N-bimodular. For fixed `n in N_r` and bounded `a_k -> x`,
the identities `E_k(n a_k)=n E_k(a_k)` and `E_k(a_k n)=E_k(a_k)n`
hold for k>=r. Take uw limits using <1>2. Approximate an arbitrary n in N
boundedly by N_r and use normality from <1>4 to pass those identities to n.
BY separate ultraweak continuity of multiplication by a fixed operator.
Together with <1>3 this proves the conditional-expectation assertion.

<1>6. The expectation is unique among psi-preserving normal expectations:
any such F satisfies `phi(n*F(x))=psi(n*x)` for every n in N.
Apply the uniqueness argument in <1>1.<2>3.

<1>7. Pass the PP bound. A subsequence realizing the finite liminf is
cofinal. Bounded positive approximants along it are obtained as in
<1>3.<2>2. Their images converge uw to E(x), BY <1>2. Apply E5-G to get
`E(x)>=b^{-1}x` for all x positive, hence `K(E)<=b`.

<1>8. If E(x)=0 with x positive, <1>7 gives x=0. If psi(x)=0, then
`phi(E(x))=0`, so E(x)=0 and x=0. Thus E and psi are faithful.
QED BY <1>2–8.

In particular, type-I summands and nonfactor finite approximants cause no
problem. We never pass their PP constants through commutants. The proof
needs positivity of `E_k-lambda id`, not its complete positivity.

## J and N. Jones convergence, compatibility, and the exact normality criterion

**Corollary E5-J [proven].** Under E5-L, work in the faithful normal GNS
representation of psi and write `Omega=Omega_psi`. Set

    H_k = closure(M_k Omega),   p_k = projection onto H_k,
    e_k = projection onto closure(N_k Omega),
    e   = projection onto closure(N Omega).

PROVE `p_k -> 1`, `e_k -> e` strongly; `e_k|H_k` and e implement E_k
and E respectively. For bounded `x_k in M_k` converging s* to x in this
representation, `E_k(x_k)->E(x)` in s*.

<1>1. The subspaces increase and their unions are dense in the indicated
limits, BY bounded exhaustion. For increasing closed subspaces, the
distance-to-subspace characterization of orthogonal projections gives
strong convergence of their projections. This proves the two limits.
<1>2. For n in N_k,
`<n Omega,E_k(a)Omega>=psi(n* a)`, BY (P). Since E_k(a)Omega lies in
closure(N_k Omega), `e_k a Omega=E_k(a)Omega` for a in M_k.
The same computation with E gives `e x Omega=E(x)Omega`.
These are the Jones projections in the state-preserving GNS constructions,
with e_k extended by zero on `H_k^perp`; the definition is fixed here.
<1>3. `e_k x_k Omega -> e x Omega`, BY <1>1 and boundedness. Apply the
same argument to adjoints. Thus both E_k(x_k) and their adjoints converge
on Omega to E(x) and E(x)*.
<1>4. Omega is separating for M, BY faithfulness of psi. It is cyclic
for M': the projection P onto closure(M' Omega) belongs to M and
`(1-P)Omega=0`, so P=1. On `a' Omega`, a' in M', output convergence
follows by commuting a' through the outputs. Uniform boundedness extends
it to every vector. QED BY <1>3–4.

The auxiliary GNS representation is normal and faithful, hence bounded
exhaustions transfer to it. Jones convergence is consequently a *derived*
certificate here, not a substitute for normality or for exhausting M.

**Corollary E5-N [proven; sharp compatible version].** ASSUME increasing
bounded exhaustions `N_k⊂M_k` of `N⊂M`, normal conditional expectations
E_k, and `E_l|M_k=E_k` for l>=k. No common state or finite PP bound is
assumed initially. Write `M_0=union M_k`, `N_0=union N_k`, and
`E_0|M_k=E_k`. Fix any faithful normal state phi on N. PROVE:

    E_0 has a normal expectation extension M -> N
    iff phi o E_0 extends to a normal positive functional psi on M. (N)

When `b=liminf K(E_k)<infinity`, either condition gives

    K(E) = sup_k K(E_k) = lim_k K(E_k) = b.                       (K)

<1>1. Necessity: for a normal expectation extension E, set `psi=phi o E`.
It is normal and positive, and restricts to `phi o E_0`. BY composition.
<1>2. Sufficiency: such psi is a state since `psi(1)=1`; its restriction
to N is phi since both are normal and agree on the dense N_0. For a in M_k,
`psi(E_k(a))=phi(E_0(E_k(a)))=phi(E_0(a))=psi(a)`.
Apply the construction <1>1–6 of L, which does not use the PP hypothesis.
For fixed a in M_r, the constant sequence a has `E_k(a)=E_r(a)` for
k>=r, so its limiting image is E_r(a). This proves extension.
<1>3. A PP inequality for E_l restricts to one for E_k when l>=k;
therefore `K(E_k)<=K(E_l)`. A PP inequality for E restricts to every E_k,
so `sup_k K(E_k)<=K(E)`. L supplies the reverse inequality. QED.

(N) is an exact normal-continuity criterion, not just a sufficient topology
chosen for convenience. Finite normal states agreeing under refinement are
not enough: their state on M_0 must be normal in the **actual** representation.
When the bound is finite, the extension psi in (N) is automatically faithful,
by L.<1>8. No modular-invariance theorem is being assumed to construct E.

For the brief's *minimal inclusion* constants `q_k=q(N_k⊂M_k)`, the
precise sufficient extra assertion is a choice of the above expectations
with, along a subsequence `q_{k_j}->liminf q_k`,

    K(E_{k_j}) <= q_{k_j}+delta_j,       delta_j -> 0.              (O)

Then `liminf K(E_k)<=liminf q_k`. Independently minimizing each finite
inclusion does not by itself prove preservation of one normal state or
compatibility. Conversely, optimality is unnecessary if a directly certified
cost bound `liminf K(E_k)<=D` is already available.

## X. Counterexamples to weaker convergence claims

**E5-X1 [negative, proven: compatible finite normality does not extend].**
Let D_0 and D_1 be the disjoint countable subsets of `{0,1}^N` consisting
of eventually-zero and eventually-one sequences. Each meets every finite
cylinder. On `ell2(D_0 disjoint-union D_1)` let

    M_k = functions of the first k bits, independently on the two copies,
    N_k = the same first-k-bit function on both copies,
    E_k(f_0,f_1)=((f_0+f_1)/2,(f_0+f_1)/2).

PROVE compatibility, finite normality, `K(E_k)=q_k=2`, and bounded strong
exhaustion of the *same* diagonal algebra `N=M=ell-infinity(D_0 disjoint-union D_1)`,
but no normal expectation on M extends E_0.

<1>1. The definitions give increasing unital finite-dimensional algebras,
normal expectations and exact compatibility. For positive f_0,f_1,
`E_k(f_0,f_1)-(f_0,f_1)/2=(f_1/2,f_0/2)>=0`.
The input `(1,0)` excludes a better constant for E_k. Any expectation
averages the two copies with weights t_w,1-t_w in each cylinder w;
testing the two coordinate units gives `lambda<=min(t_w,1-t_w)<=1/2`.
Thus K(E_k)=q_k=2. BY these displayed positive-cone computations.
<1>2. Enumerate the atoms. Choose strictly increasing k_r so the first r
atoms have distinct length-k_r prefixes. At that stage assign their desired
values to those cylinders and zero elsewhere. At every intervening stage
k use the function from the last k_r<=k (and zero before k_1).
The norms stay bounded by the target norm; every atom eventually has its
desired value. This is bounded diagonal pointwise, hence strong-*,
approximation of every element of M by an element of N_k at every k.
Thus both exhaustions equal M=N. BY dominated convergence in ell2.
<1>3. Let `P_0=(1,0)`, which belongs to every M_k. Then `E_0(P_0)=1/2`,
whereas an expectation M->N=M must fix P_0. Hence no such extension exists.
<1>4. The failure is explicitly a failure of normal continuity. Choose
`d in D_0` and let f_k indicate its length-k cylinder. Then
`x_k=(0,f_k)` decreases strongly to zero: D_1 contains no d. But
`E_k(x_k)=(f_k/2,f_k/2)` decreases strongly to `p_d/2 !=0`.
If psi were normal and faithful on N and preserved every E_k, then
`psi(x_k)->0` and `psi(E_k(x_k))->psi(p_d)/2>0`, a contradiction.
QED BY <1>1–4.

Equal-copy, uniform-cylinder probability measures do give compatible
faithful states at every finite stage. They have no normal extension in
this atomic representation: every singleton has decreasing cylinder
probabilities `2^{-k-1}->0`, whereas normality on a countable atomic algebra
would require their total mass to be 1. This counterexample refutes normal
extension of the selected maps, **not** numerical index semicontinuity:
here the limiting inclusion has q=1<=2.

**E5-X2 [negative, proven: Jones convergence alone does not bound index].**
Fix `m>=2`, `M=M_m(C)`, `N=C1`, and normalized trace tau. On L2(M,tau)
let `N_k=M_k=C1` for all k, with identity expectations. PROVE the
zero-extended finite Jones projections converge strongly to the actual
Jones projection e_N, although `q(N⊂M)=m>1=liminf q_k`.

<1>1. Both the finite projection and e_N project onto `C1` in L2(M,tau),
so they are equal for every k. The stage expectations are compatible,
tau-preserving, and have cost 1. BY their definitions.
<1>2. An expectation M->C1 is `x->f(x)1` for a state f. Its least
density-matrix eigenvalue is at most 1/m. Testing a rank-one projection
onto such an eigenvector gives `K>=m`. The trace expectation attains m,
since `Tr(x)1>=x` for x positive. Hence q=m.
<1>3. M_k fails to exhaust M: `p_k=e_N !=1`. Thus strong convergence of
Jones projections, even to the correct e_N, cannot replace exhaustion of
the ambient algebra or the positive-graph condition (G). QED.

Both counterexamples concern the general operator-algebra step, not a
preferred category. X1 isolates the missing normality; X2 actually violates
the desired numerical bound after the ambient-exhaustion hypothesis is dropped.

## F. The repaired two-sided fidelity theorem

**Theorem E5-F [proven]. Setting: chiral. Data: L2 + L4. Rung: R4.**
ASSUME C is a UMTC, A is a declared completely rational conformal net on
a separable Hilbert space, and

- `Phi:C -> DHR_fin(A)` is a fully faithful, dimension-preserving braided
  dagger tensor functor with the declared orientation;
- the actual four-interval inclusion has the bounded exhaustions and
  expectations of L, with a common normal state faithful on N and
  `liminf K(E_k)<=D`; equivalently, in the compatible version it suffices
  to provide (N) and this bound. Minimal inclusion bounds may replace
  the chosen costs only with a selection certificate such as (O).

PROVE `mu_A=D` and Phi is a braided dagger equivalence onto the complete
finite-sector category; there are no additional irreducible sectors.

<1>1. L or N constructs a normal expectation E with `E(x)>=D^{-1}x`.
Thus `mu_A=q(N⊂M)<=K(E)<=D`, BY KLM:430–443 and (al).
<1>2. Apply the already established two-sided theorem CA80:168–185
(Theorem 80.9) with `B=C`: its F1 and F2 are our first assumptions, and
its F3' is <1>1. Conformality supplies modular PCT, BY KLM:782–792.
The functor preserves the conjugate equations and the norms of their
standard solutions; dimension preservation makes these solutions standard
in the target as well, BY B:604–621. Thus the canonical positive spherical
structure is preserved. The twists and ribbon traces formed from these
evaluation/coevaluation maps and the braiding are therefore preserved,
as required in CA80's F2 (B:620–645); no independent choice of a nonpositive
pivotal structure is allowed.
The theorem gives `mu_A=D` and the braided equivalence. This
uses KLM:1719–1729, `mu_A=sum_rho d(rho)^2`; no part of the faulty
commutant exhaustion argument KLM:507–556 is used.
<1>3. KLM:1899–1900 excludes an extra infinite-dimensional irreducible
sector: every sector is a direct sum of finite-dimensional sectors.
This does **not** say every arbitrary sector is a finite direct sum;
the finite-sum restriction is appropriate to DHR_fin (B:1150–1154).
The inverse equivalence may be chosen dagger by choosing unitary object
identifications and transporting the fully faithful dagger Hom maps.
QED BY <1>1–3.

Unitarity uses the canonical positive spherical structure (B:620–645);
no separate numerical ribbon normalization is inferred. The conclusion
identifies sector data, including categorical twists with that structure.
It does not identify a particular central-charge lift, complete characters,
or OPE coefficients. Such enriched L3/L4 fidelity needs additional tests,
as already separated in CONVENTIONS (u) and CA80:184–185.

For a nontrivial inclusion the state used in L/N cannot be the physical
vacuum, BY CA80:206–212 (Lemma 80.10). This is a substantive lattice
obligation, not a harmless change of notation for the OAR vacuum.

## D. The full-setting corollary and the false interpretation

**Corollary E5-D [proven]. Setting: full, with a named chiral subnet.
Data: L2+L4, including the reflected right copy. Rung: R4 for that subnet.**
ASSUME E5-F. Form the doubled chiral subnet `A_2=A tensor Abar`, with
right braiding reversed. PROVE

    DHR_fin(A_2) equivalent C boxtimes C^rev equivalent Z(C_fus),
    Dim(DHR_fin(A_2)) = D^2.                                     (D)

Its canonical diagonal Longo–Rehren full extension B_2 exists by the
locally sourced construction; its finite bounded-localized DHR sectors
are trivial. Thus calling (D) "the symmetry category of the diagonal
theory" is legitimate only when it explicitly means the doubled chiral
category or the center of its defect category, not DHR_fin(B_2).

<1>1. Every irreducible finite sector of the doubled subnet is a pair
`rho_i tensor rho_j^o`, with no additional pairs omitted or extra sectors,
BY KLM:969–972,1518–1559. The representation and separability hypotheses
there hold for the completely rational net in F.
<1>2. Tensor products, junctions, and transported exchanges factor between
the copies. Intertwiners between irreducible pairs are zero unless both
labels match, and scalar when they match, BY irreducibility in <1>1;
finite direct sums give the tensor-product Hom spaces. The right exchange
uses the adjoint reverse crossing, BY KLM:1089–1092 and B:643–645.
Together with F this proves the first braided equivalence in (D).
<1>3. `Z(C_fus) equivalent C boxtimes C^rev`, BY modularity and
B:660–664. Pair dimensions multiply, so summing their squares gives
`sum_ij (d_i d_j)^2=D^2`. QED for (D) BY <1>1–3.
<1>4. KLM:1086–1098 constructs the canonical LR net with diagonal
canonical object `direct-sum_i rho_i tensor rho_i^o`, as the time-zero
fields of the canonical two-dimensional net. The right-dual relabelling
turns charge conjugation into the usual diagonal terminology
(FRS:8238–8241). This is an abstract net construction, not lattice convergence.
<1>5. Since C is nondegenerately braided, the LR net has no nontrivial
finite-index bounded-localized endomorphism, BY KLM:1578–1587;
KLM:1861–1879 also gives its annular index 1. Consequently its finite
localized sector category is Vec. This also excludes finite double-cone
sectors of B_2: the zero-time diamonds `D(I)` defining its time-zero net
are cofinal among bounded double cones. In light-ray coordinates, every
bounded rectangle lies in `(-R,R) times (-R,R)` for sufficiently large R,
the diamond based on the time-zero interval (-R,R). Hence both nets have
the same quasilocal algebra. A double-cone-localized sector is localized
in some D(I), and fixes every B_2(D(J)) for J disjoint from I; it is an
interval-localized LR sector. Its conjugate equations, dimension and
intertwiners are unchanged on this same quasilocal algebra; transportability
transfers by transporting into each D(I). LR triviality
therefore gives full finite-sector triviality. Spatial translations of
the time-zero net do not satisfy a chiral positive-energy condition
(KLM:1094–1098); that condition is not used in this restriction argument.
<1>6. If C has a nonunit simple a, (a,1) is a nonunit simple of the doubled
category in <1>1, whereas <1>5 has none. Hence these categories cannot be
equivalent. This is an explicit family of counterexamples to the unqualified
claim about DHR of the full diagonal extension. QED BY <1>4–6.

For completeness, the Cardy defect interpretation gives C_fus itself:
FRS:641–646 identifies defects with bimodules over the chosen algebra;
for the unit algebra the two unit actions are forced, so these are just
objects of C with its tensor product. Its **center** is (D). A general full
extension has its own bimodule category (B:3323–3337); it must be declared.

## What a lattice construction must supply: lemmas, not fitted diagnostics

Each implication below is proved under its stated certificates. Producing
those certificates for arbitrary C remains open. Let L_k be chain size;
k is a refinement index, not an identification of size with energy cutoff.

**Lemma E5-EP [conditional endpoint certificate, L2+L4 -> F(i)].** ASSUME
finite charged endpoint operators/correspondences, junction matrices for
bases of `Hom_C(a,b)`, tensorators, conjugate-pair operators, and transporters.
They act in specified charged representations of the same observable tower;
they need not be endomorphisms of one finite full matrix algebra. ASSUME:

1. Their bounded product and adjoint limits exist on the identified local
   observable algebras; the limiting charge maps are unital, multiplicative,
   locally normal, localized in a chosen interval, and transportable to
   every interval. Normality and localization are proved, not inferred
   from strong convergence alone.
2. Finite junction/tensorator identities have errors tending to zero in
   these product limits: unit, composition, dagger, pentagon, naturality,
   and the oriented DHR exchange identity. Include both unitary identities
   `U_k*U_k -> 1` and `U_k U_k* -> 1` for every unit/tensorator map, so
   their limits are unitary. Every source Hom basis has
   linearly independent limit images. A limiting normalized conjugate
   pair is proved **standard** and has squared norm d_a; mere satisfaction
   of conjugate equations gives only an upper dimension bound (B:604–621).
3. Fullness certificate: for every limiting intertwiner T between images
   of a,b, there are bounded approximants T_k and junction images T_{r,k},
   with `T_k -> T`, `T_{r,k}->T_r` strongly and
   `T_k-sum_r c_{r,k}T_{r,k}->0` strongly; the finitely many coefficients
   c_{r,k} are uniformly bounded. For zero source Hom the sum is zero.

PROVE the endpoint limits define the functor in F(i).
<1>1. Pass every finite identity in item 2 to its limit using item 1's
product/adjoint convergence. This yields a braided dagger tensor functor;
item 1 puts its objects in DHR. Standardness and the norm in item 2 give
the statistical dimensions, BY B:617–621.
<1>2. Linear independence gives faithfulness. For any T in item 3, choose
a subsequence on which its bounded finite coefficient vector converges
to c. Product limits give `T=sum_r c_r T_r`. Hence the Hom map is onto.
Apply this to finite sums/subobjects as well as simple labels, or extend
using the declared semisimple decompositions. QED BY <1>1–2.

**Lemma E5-AN [conditional annular certificate -> F(ii)].** ASSUME at each
finite chain scale a represented complement algebra B_k and actual unital
inclusion `N_k⊂M_k`, with `N_k` representing the two selected intervals and
`M_k` the declared annular algebra (often a finite complementary commutant).
ASSUME refinement gives increasing represented inclusions; prove
`N_k⊂N`, `M_k⊂A(E_geo')'` and bounded exhaustions of **both** N and M.
For M, the D5-A uniform commutator-repair estimate is one sufficient route,
only with probes exactly in the continuum complementary algebra
(D5 NOTE:458–504, REVIEW:167–171). No automatic interchange of a commutant
and a scaling limit is allowed. ASSUME finite expectation matrices E_k,
with unitality, range, bimodularity and positive-cone inequalities

    E_k(x) >= b_k^{-1} x     for every x in (M_k)_+,
    liminf b_k <= D.

Finally ASSUME either the common normal state in L or, for compatible E_k,
a faithful normal phi on N and a normal extension of `phi o E_0` as in N.
PROVE the annular upper bound and Jones/expectation convergence.
<1>1. `K(E_k)<=b_k`, BY the full positive-cone inequalities.
<1>2. Apply L (or N) and J. QED. In finite algebras all map identities and
cone certificates are matrix data; the normal-state and exhaustion
requirements are all-scale analytic lemmas, not consequences of those data.

The normality test in N can be stated operationally as the need to prove
that the finite scalar functionals extend normally in the actual continuum
representation. In particular any bounded positive sequence from M_0
converging strongly to zero must have `phi(E_0(x_k))->0`. X1 supplies an
explicit failing sequence. A finite list of vacuum or low-energy probes
cannot replace this universal continuity requirement or the PP cone test.

**Lemma E5-ALL [conditional assembly].** ASSUME the same lattice/OAR
system has an identified completely rational conformal net A, including
locality, strong additivity, split property and conformal covariance;
EP and AN hold in that same representation and with the declared C.
PROVE R4 sector fidelity. <1>1. EP supplies F(i); AN supplies F(ii).
<1>2. Apply F. QED. This lemma does not derive R1, R2 or R3 from category
data, does not prove convergence to the LR full extension, and gives no R5
functoriality. Full-theory lattice convergence requires its own extension
fields, diagonal spectrum and sewing/convergence certificates.

## Verification and local research record

The main proof uses the closed positive cone and normal scalar pairings.
It repairs exactly CA-80's missing finite-approximation implication, rather
than reproving the two-sided dimension count. Two read-only GPT-6.1 xhigh
collaborators independently checked the normal-extension argument and the
full-theory category distinction. The strengthened noncompatible version
of L was checked separately; N is the requested compatible specialization.

The finite checks are algebraic regression witnesses, not a proof of any
continuum approximation family. Reproduce from the repository root with

```bash
PYTHONDONTWRITEBYTECODE=1 python3 explorations/2026-10-22-astra-r2/E5-two-sided-fidelity/checks/check_expectations.py
```

Output and mutation results are retained in `checks/raw_output.txt`, with
the command, file hashes and finite matrix budget in `checks/provenance.json`.
The check uses exact rational/SymPy arithmetic; no random samples,
eigensolver tolerances, Julia suite, network, report rebuild, or commits.
Only this directory is written. No acquisition gap remains for the proved
ordinary-PP route; a Kosaki/Watatani or complete-PP comparison is neither
used nor claimed. Frictions: the original constants conflated selection of
maps with optimization over maps; stage normality did not guarantee limit
normality; "full symmetry category" conflated a subnet with its extension.

## Results ledger

- E5-G — **proven:** positive ultraweak graph convergence along a liminf subsequence passes an ordinary PP upper cost bound.
- E5-L — **proven:** a common normal state faithful on N constructs the normal expectation and passes the liminf bound; exact map compatibility is unnecessary.
- E5-J — **proven:** faithful auxiliary GNS realizes strong Jones-projection and bounded strong-* expectation convergence.
- E5-N — **proven:** compatible maps extend normally iff one faithful normal output state composed with E_0 extends normally; expectation cost equals the supremum of stage costs.
- E5-X1 — **negative:** compatible finite normal maps, coherent stage states, full exhaustions and uniform PP cost do not ensure normal extension of those maps.
- E5-X2 — **negative:** Jones convergence without ambient exhaustion can underestimate the actual minimal PP cost.
- E5-F — **proven:** the precise endpoint-plus-normal-expectation certificate implies complete chiral sector fidelity and mu_A=Dim(C).
- E5-D — **proven:** the doubled chiral subnet has category Z(C_fus)=C boxtimes C^rev and dimension D^2.
- Unqualified full-extension DHR=Z(C) assertion — **negative:** the canonical diagonal LR extension has trivial finite localized sectors when C is modular and nontrivial.
- E5-EP / E5-AN / E5-ALL — **conditional:** explicit lattice certificates imply F; no general family satisfying their hypotheses is constructed.
- Bare minimal-index bound with no control of the selected expectations — **conjectural here:** neither proved nor refuted by X1; (O) removes this unresolved inference.

## Layer tags

| Statement | Setting | Data layer | Rung reached |
|---|---|---|---|
| G, L, J, N, X | Pure operator algebra; chirality independent | Represented inclusions, expectations and normal-state/exhaustion data; no categorical input | No R1–R3 construction; ingredient for an R4 bound |
| F | Chiral conformal net | L2 modular C + L4 declared A, endpoint and annular certificates | R4 sector equivalence; no enriched-theory uniqueness or R5 |
| D | Full setting, distinguished doubled chiral subnet and LR extension | L2+L4 plus reflected right orientation and canonical extension | R4 for the named sector/defect target; not lattice realization |
| EP, AN, ALL | Chiral, or an identified chiral subnet of a full limit | L2+L4 with finite operators and analytic certificates | Conditional R3->R4; prior rungs must already be proved |

Fusion data (L0) alone do not define the braided endpoint functor; L1
braiding alone does not supply the UMTC target in F. L3 conformal enrichment
is not reconstructed by a global-dimension equality. The category is general
throughout; no model-specific identity enters any proof.

## What this gives the integration

CA-75 item 13 / CA-80 Theorem 80.9 now have a proved finite-stage upper-bound
route: expectation cone inequalities + actual annular exhaustion + normal
continuity produce the needed continuum expectation. N identifies the exact
normality obligation for compatible maps; J supplies the requested Jones
convergence in a common auxiliary GNS space. This closes an implication, not
the universal synthesis problem. EP keeps endpoint fullness and dimensions
separate from the scalar-loop falsifier. D prevents the integration from
assigning one sector category to both a subnet and its full extension.

## Open problems

1. Construct the represented annular exhaustions, especially the complement
   commutant, for a general categorical lattice family.
2. Construct finite expectations with cost tending to D and a common state
   normal in the actual limit representation; or prove the scalar criterion
   (N). Stage compatibility by itself fails in X1.
3. If only q_k is computable, prove the near-optimal selection (O) with
   normal convergence. No general theorem supplying that selection is claimed.
4. Prove EP's local normality, transportability, full intertwiner exhaustion,
   oriented braiding and **standard** dimension identification.
5. Supply the upstream R1–R3 proof, extended chiral content, c lift and all
   desired enriched fidelity. Establish the actual full-extension lattice
   limit if that, rather than its chiral subnet, is the declared target.
6. Determine whether a numerical index-semicontinuity theorem survives with
   weaker assumptions than those here. X1 is not a counterexample to it.

## Examples table

| Instance / calibration | Exact conclusion | Boundary |
|---|---|---|
| Any UMTC C satisfying F | mu_A=D, complete braided equivalence | Existence of such a net/lattice is assumed |
| Any nontrivial realized UMTC | doubled subnet Z(C_fus); diagonal LR finite localized category Vec | The distinction applies uniformly, not to one model |
| Two-copy cylinder algebras X1 | every finite cost=2; no normal extension of E_0 | Limit inclusion itself is equality, so this is not an index-counterexample |
| C1⊂M_m, m>=2, X2 | stage cost 1, actual minimal cost m, identical Jones projections | Ambient exhaustion is absent |
| Two-copy weighted averages in checks | K=1/min(t,1-t), compatible weighted Jones projections | Finite algebra calibration only |

## Sources used

- `references/cft-machine/realisation/KawahigashiLongoMuger1999/source.tex:430–443`: PP normalization; `:507–556`: commutant proof route explicitly not used.
- Same file `:688–719,782–792`: complete rationality, annular inclusion, transportability and modular PCT; `:1719–1729`: mu equals sum of squared statistical dimensions.
- Same file `:1899–1900`: arbitrary sectors are direct sums of finite-dimensional sectors, not necessarily finite direct sums.
- Same file `:969–972,1518–1559`: completeness of tensor-product sectors.
- Same file `:1086–1098,1578–1587,1861–1879`: canonical LR extension, time-zero interpretation, and absence of nontrivial finite localized sectors.
- Same file `:2758–2770`: bounded ultraweak cluster/uniqueness method as local analytic precedent; L gives its own full argument.
- `references/cft-machine/realisation/Bischoff2018/source.tex:604–645`: conjugate equations, standard dimensions, positive spherical structure; `:643–664`: reverse braiding and center equivalence.
- Same file `:1150–1154`: finite statistical dimension and finite direct sums; `:3323–3337`: full extension, doubled chiral subnet and defects distinguished.
- `references/categorical-reconstruction/FuchsRunkelSchweigert2002/source/hep.tex:641–646,8238–8241`: bimodule defects, unit-algebra/charge-conjugation convention.
- `references/lattice-symmetry/ZiniWang2018/source/main.tex:1133–1135`: bounded-density precedent; bounded exhaustion is explicit here.
- `references/cft-machine/realisation/SOURCES.md:34–51,79–109` and `references/categorical-reconstruction/SOURCES.md:87–108`: local source registrations.
- `report/sections/80_lattice_sewing_and_fidelity_certificate.tex:153–159,168–212`: scalar falsifier, existing two-sided theorem, limit gap and vacuum obstruction.
- `explorations/2026-10-22-astra/D5-fidelity-lattice-sewing/NOTE.md:346–515,525–577`; `REVIEW.md:70–80,144–178`; `INTEGRATION.md:111–134`: prior certificate, annular exhaustion and review boundaries.
- `CONVENTIONS.md:773–792,1431–1448`: fidelity/ribbon distinction, Lamport style and annular index normalization.
- New elementary derivations: E5-G/L/J/N/X and the explicit finite check script in this directory; no external result is attributed to an unsourced recollection.
