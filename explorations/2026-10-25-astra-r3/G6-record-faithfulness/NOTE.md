# G6 — The information boundary of the interval/dilation record

2026-10-25. Initial checkpoint: 06:00 UTC; session began 05:56 UTC.
**Checkpoint: the universal positive conjecture is false.** G6-B below gives
an exact counterexample family, including connected pointed sites. The
different-associator calibration and full mark inventory are still being
checked. The initial all-open skeleton was saved within the first ten minutes.

The task permits writes only in this directory, no commits and no network.
It overrides the usual convention/worklog/report landing workflow. Scoped
notations introduced here will not silently alter CONVENTIONS.md. Existing
(am), (aq), (as) govern pointed sites, layers, and crossings; (ar) is the
Ward-to-KS convention and is not a tower convention.

## Statement and proof obligations

**ASSUME** a unitary fusion category D, a tensor-generating pointed object
eta:1 -> O with eta^dagger eta=1, and one fixed pointed unitary relative
half-braiding H on D, as in CA-90 Definition 90.H. Write W_L=O^tensor L,
A_L=End_D(W_L), with trailing inclusion a -> a tensor 1_O, and let
A_infinity be its norm inductive limit. The named interval algebras are
A_[j,k]=1^(j-1) tensor End_D(W_(k-j+1)) inside that limit, with the fixed
associators. Delta is the endomorphism from F6-C1's fixed-H shuffle.
The record R=(A_infinity,{A_[j,k]},delta) retains no named point,
corner embeddings, rectangular maps h/i/j, or identifications of translated
intervals. An isomorphism preserves every interval label and intertwines delta.

**PROVE or refute:** isomorphism of R forces unitary tensor equivalence of
(D,O,eta,H). A negative answer must give a simultaneous interval/dilation
intertwiner, not just equality of dimension groups or separate diagram
isomorphisms. Determine which missing marks are intrinsic, which require
choices, and the precise effect on the CA-88 fidelity ladder.

The common tags are **any, with ordered open geometry; L0 + fixed pointed
H; R0^u information only**. No continuum or periodic-seam claim is included.

## Proof record

F6 (7)--(10) and CA-77 Proposition 77.2 are prior results, not re-proved here.
The following is a general counterexample mechanism for the stated class of
inputs, not an assumption restricting the construction to a model.

### G6-A. What the cut relative commutant actually computes

**[proven; any/open; L0; R0 finite information].**
**ASSUME** arbitrary unitary fusion D and nonzero O, as above. At a cut
between m and n sites put V_m^x=Hom_D(x,W_m),
V_n^y=Hom_D(y,W_n), and F_xy^z=Hom_D(z,x tensor y). Omit zero summands.
The embeddings use the fixed unitary associators.
**PROVE** the finite inclusion of the two adjacent interval algebras is

    A_(m+n) = direct-sum_z End( direct-sum_(x,y)
                                V_m^x tensor V_n^y tensor F_xy^z ),
    (A_[1,m] vee A_[m+1,m+n])' intersect A_(m+n)
       = direct-sum_(z,x,y) 1_(V_m^x tensor V_n^y) tensor End(F_xy^z).
                                                               (G6.0)

Equality here is under the stated orthogonal decomposition; the formula
does not claim that the displayed simple labels are intrinsically named.

`<1>1.` Choose orthonormal isometric simple splittings of W_m,W_n,
and x tensor y. Composing their tensor products gives the displayed
orthogonal splitting of W_(m+n). BY semisimple splitting and tensor dagger
at Penneys:219-237,319,470-478, with coherent associators at :394-398.
The left/right interval algebras act as End(V_m^x) and End(V_n^y) on
the first two factors and as identity on F_xy^z. This also proves that
their product embedding is faithful: every x tensor y is nonzero, since
its positive categorical dimension is d_x d_y>0 (ENO.txt:1459-1487).

`<1>2.` The commuting central projections of the left and right
algebras force a commuting endomorphism, inside each fixed z-block of
A_(m+n), to preserve every pair (x,y). On that pair, commuting with
all matrix units of End(V_m^x) tensor End(V_n^y) forces the operator
to have the form 1 tensor c, c in End(F_xy^z). To verify the last
assertion directly, write T as a matrix (T_ij) with entries on F_xy^z:
commutation with E_ii kills off-diagonal entries and commutation with
E_ij makes all diagonal entries equal. BY this matrix-unit computation.
Conversely every such operator commutes. This proves (G6.0).

`<1>3.` Any isomorphism of the intermediate record carries these relative
commutants, their centers, and all inclusion diagrams between them onto
their counterparts, since Phi([a,b])=[Phi(a),Phi(b)]. It also carries
every intersection involving delta^r(A_I) onto its counterpart by
intertwining. These are intrinsic invariants of the record. QED.

**Insufficiency of this computation [proven; G6-B family].** For the
abelian graded family below, F_xy^z is one-dimensional iff z=xy.
Consequently the joint commutant is the commutative algebra with one
minimal projection per supported pair (x,y). Under the exact isomorphism
G6-B, its labels change as

    (x at length m, y at length n, z at length m+n)
       -> (s^m x, s^n y, s^(m+n) z).

The equation z=xy is preserved. No computation of these commutants
selects a charge called 'the unit at every length': the whole inclusion
diagram is carried along. Nor can adding delta-moved cuts remove this
ambiguity: (G6.4) intertwines every such diagram, not merely its dimensions.
This is the precise failure of the proposed commutant reconstruction.

### G6-B. Translation of the charge origin is invisible

**[proven; any/open; L0 + the explicitly supplied symmetric H; R0^u].**
**ASSUME** G is a finite abelian group, D=Hilb_fd(G,1), and
O=direct-sum_(a in G) C^(m(a)) in grade a. Its support generates G.
Fix s in G with m(e)>0 and m(s^(-1))>0, and define O' by translating
every grade a to sa, keeping its multiplicity space. Assume the translated
support also generates G. Choose any unit vectors eta in O_e and eta'
in O'_e. Give O and O' the relative transports
t_Y(y tensor v)=v tensor y, the ordinary Hilbert-space flip.

**PROVE** the two intermediate records are isomorphic. In fact the
isomorphism preserves all translated copies of endomorphisms and their
endomorphism concatenations. If no automorphism of G carries the
multiplicity function of O to that of O', the pointed inputs are inequivalent.

`<1>1.` These are valid pointed tensor-generating inputs with H.
BY the graded construction in
`references/text/PenneysUnitaryFusionCategories.md:277-288,319-321`.
The trivial associator and the usual unit identifications are used. The flip
is grade-preserving because G is abelian; for any grade-preserving f,
flip(f tensor 1)=(1 tensor f)flip. On pure tensors its tensor identity
is y tensor z tensor v -> v tensor y tensor z in either order, and its
point identity is y tensor eta -> eta tensor y. Its inverse and dagger
are the reverse flip. These displayed computations check every clause of
CA-90 H, without invoking an unsourced braiding theorem. The point and
generation hypotheses are the stated assumptions.

`<1>2.` Let U:underlying(O)->underlying(O') be the identity on the named
multiplicity bases, regarded as a Hilbert unitary of degree s. It is
**not** a D-morphism unless s=e. Put U_L=U^tensor L. For a word
w=(a_1,...,a_L), including multiplicity labels, write |w|=a_1...a_L.
Then |U_L w|=s^L |w|. Thus two words have equal total charge before
translation iff they do afterwards. Every categorical matrix unit
|w><v| is therefore carried to a categorical matrix unit, bijectively:

    phi_L(a)=U_L a U_L^dagger : A_L -> A'_L.                 (G6.1)

This is a unital isometric *-isomorphism. BY the grade calculation and
the matrix-unit description of grade-preserving endomorphisms. At L=0
take phi_0=id_C; no change of the categorical tensor unit is asserted.

`<1>3.` The trailing and all interval identifications are simultaneous:

    phi_(L+1)(a tensor 1_O)=phi_L(a) tensor 1_O',
    phi_L(1^(j-1) tensor b tensor 1^(L-k))
      =1^(j-1) tensor phi_(k-j+1)(b) tensor 1^(L-k).         (G6.2)

BY U_(L+1)=U_L tensor U and factorwise conjugation. The second equality
holds for every categorical b, including operators not generated by
one-site observables, and gives equality onto the target interval algebra.
More strongly, phi_(L+M)(a tensor b)=phi_L(a) tensor phi_M(b).

`<1>4.` With the H of `<1>1`, the CA-90 shuffle B_L is exactly the
ordinary tensor permutation interleaving the two length-L words. Thus

    U_(2L) B_L = B'_L (U_L tensor U_L),
    phi_(2L) alpha_L = alpha'_L phi_L.                     (G6.3)

The first identity sends a pure tensor (w,v) to the same interleaved
translated tensor on both sides. The second follows by conjugating
a tensor 1 in the first identity and using (90.2). This is exact at every
length, not equality only on K_0 or on a cofinal diagram.

`<1>5.` The phi_L extend uniquely to a *-isomorphism Phi of the trailing
norm completions. BY (G6.2), their isometry, and density; the same argument
for their inverses gives surjectivity. For every a in A_L,

    Phi delta kappa_L(a)
      = kappa'_(2L) phi_(2L) alpha_L(a)
      = kappa'_(2L) alpha'_L phi_L(a)
      = delta' Phi kappa_L(a).                            (G6.4)

BY F6-C1 (7) and (G6.3). Continuity extends equality to A_infinity.
Equation (G6.2) proves Phi(A_[j,k])=A'_[j,k] for every named interval.
Consequently Phi is an intermediate-record isomorphism in the exact sense
asked for, also preserving endomorphism concatenation.

`<1>6.` Any tensor equivalence D->D permutes the invertible simple
objects by a group automorphism, and preserves their multiplicities in an
object. BY F6-N2 `<1>1` (or the tensorator definition at Penneys:325-348).
Hence absence of the asserted multiplicity-preserving automorphism rules
out a unitary tensor equivalence carrying O to O', before point or H
compatibility is considered. BY `<1>1`--`<1>5`, QED.

**Corollary G6-B1 [proven negative; same tags].** For every nontrivial finite
abelian G and s!=e, let R_G=direct-sum_(a in G) a,
O=R_G direct-sum 1 and O'=R_G direct-sum s. All hypotheses hold and
dim Hom(1,O)=2 differs from dim Hom(1,O')=1. Thus the conjectured
faithfulness fails for a whole family. BY G6-B and preservation of the unit.

**Corollary G6-B2 [proven negative, connected sites; same tags].** Suppose
G has a,b!=e in different automorphism orbits. Set s=ba^(-1),
O=R_G direct-sum a and O'=R_G direct-sum b. Both have unit multiplicity
one, so are connected in (am); both generate. Translation by s identifies
the records, but the uniquely doubled simple must be carried from a to b
under any object-preserving equivalence. This is impossible by assumption.
BY G6-B. Different orders of a and b are a sufficient elementary condition
for distinct automorphism orbits. The concrete small instance is confined
to the Examples table and checks.

### G6-C. Missing maps do not follow from their range projections

**G6-C1 [proven; any/open; L0+H; R0 mark obstruction].**
**ASSUME** any input as in the statement and, additionally, a unitary
u in End_D(O) such that

    u eta=eta,
    t_Y(1_Y tensor u)=(u tensor 1_Y)t_Y for every Y in D,    (G6.5)

and u is noncentral in End_D(O). The second condition is an explicit
condition on the ancillary variable, not a consequence of H-naturality
in Y. **PROVE** the record has an automorphism fixing every named
single-site point projection but moving its standard translation,
concatenation, and some point-insertion corner maps.

`<1>1.` Put C_0=C_1=1 and C_L=1_O tensor u^tensor(L-1) for L>=2,
and gamma_L=Ad C_L. These unitaries are categorical morphisms. The
gamma_L commute with trailing inclusions, since C_(L+1)=C_L tensor u.
On every interval their action is conjugation by the product of the
onsite unitaries in that interval, hence maps the whole interval algebra
onto itself. BY tensor interchange. The limit automorphism gamma exists
by the same isometric density argument as G6-B `<1>5`.

`<1>2.` H-naturality transports u on every old strand, and (G6.5)
transports u on every ancillary strand, through each crossing of B_L.
Give old_1 the identity and every other old or ancillary strand u.
The final interleaved word has the identity at site 1 and u at all
other sites. Therefore, with associators coherently retained,

    B_L(C_L tensor u^tensor L)=C_(2L) B_L.                 (G6.6)

BY the two displayed transport equations, once per crossing, and tensor
interchange; no permutation-Hilbert-space assumption is made here.
Conjugating a tensor 1 by (G6.6) cancels the ancillary u factors and
proves gamma_(2L) alpha_L=alpha_L gamma_L. F6-C1 then gives gamma delta
=delta gamma. BY (7) on the dense trailing union.

`<1>3.` Since u eta=eta, every p_j=(eta eta^dagger)^(j) is fixed.
Choose b in End_D(O) with ubu^dagger!=b, which exists by noncentrality.
The usual translation T:A_[1,1]->A_[2,2] has T(b)=1 tensor b, so

    gamma_2 T(b)=1 tensor ubu^dagger != T gamma_1(b).

Likewise the endomorphism concatenation c_(1,1)(a,b)=a tensor b is
not intertwined by gamma_2 versus gamma_1 on its two arguments. The
left-insertion corner theta(b)=p0 tensor b satisfies
gamma_2 theta(b)=p0 tensor ubu^dagger !=theta gamma_1(b), even though
its range projection p0 tensor 1 is fixed. Nonzero p0 makes the
inequality faithful (or compress its first factor by eta). BY these
displayed computations.

`<1>4.` In F6-C3's notation r=eta tensor 1, l=1 tensor eta, h=rl^dagger.
Directly, C_2 r=ru and C_2 l=l, so gamma_2(h)=rul^dagger!=h.
The inequality follows after multiplication by r^dagger and l, since
u!=1. Thus even all the point projections together do not make the
specific h intrinsic. Its initial/final projections are nonetheless fixed.
This is the missing phase/identification information in a proposed use
of F6 (10), beyond merely finding its corner ranges. QED.

`<1>5.` The hypothesis has general instances: replace any pointed
central object (O,H) by O direct-sum 1, extending H by its unit
transport, and keep eta in the old summand. The two central-unit copies
admit u=+1 on the chosen eta and -1 on the extra copy, identity on
their orthogonal complement. This u satisfies (G6.5), fixes eta, and
fails to commute with the matrix unit between the two unit copies.
The enlarged site still generates D. BY direct-sum naturality and the
matrix-unit computation. Hence the obstruction is not restricted to one
category; a minimal finite instance is in the Examples table.

**G6-C2 [proven inventory, with explicit unresolved questions].** An
'intrinsically recovered mark' below means one transported by **every**
record isomorphism. This is stronger than existence of a choice, and
different from recovery of an equivalence class of the entire input.

| Datum | What R determines / what is extra | Evidence |
|---|---|---|
| A_[1,L], trailing inclusions, all named interval inclusions | Recovered exactly as subalgebras and inclusion maps | Definition of R |
| Centers, finite block sizes, relative commutants, products of already embedded disjoint observables | Recovered, including diagrams with delta-moved cuts | G6-A and algebra multiplication |
| Refinement and identifications along j -> 2j-1 | Recovered exactly by restricting delta; no arbitrary translation is asserted | R and CA-90 Theorem 90.1(ii) |
| Named unit-charge block and point p_j | Genuinely extra in general; G6-B1 admits no point-preserving isomorphism even on A_[1,1] | Source point has central support M_2, target point central support C; matrix sizes cannot be swapped |
| Range projections for vacuum insertion | Once p_j are supplied, recovered as products of the p_j at omitted sites | Tensor interchange; this does not identify domain with range |
| Full placement/corner maps and h | Genuinely extra as natural marks, even after all p_j are supplied | G6-C1 fixes their range projections and moves their maps |
| Identification of A_[1,m] with a translated interval; endomorphism concatenation from named abstract factors | Genuinely extra as natural marks, even with all p_j | G6-C1 `<1>3`; the product of already embedded factors remains intrinsic |
| Rectangular i,j/compression identifications in F6 (10) | Not supplied by merely specifying their range projections; add coherent placement identifications to apply (10) | G6-C1 `<1>4`, F6-C3:590-634 |
| Full tensor-equivalence class of D, or H when O is fixed appropriately | General recovery unresolved here | G6-B changes the site, not D; G6-D below detects a particular associator change |

G6-B preserves even the extra endomorphism concatenations. Thus adding
those maps alone does not repair pointed-input faithfulness. Conversely,
the **sufficient** repair already proved in CA-77 Proposition 77.2 and
F6-C3 is the coherent pointed tensor/placement/partial-isometry record,
including the typed compression identifications in (10): it recovers D
and the supplied H. No assertion of a *minimal* sufficient subset is made.
The automorphism argument does not rule out recovery only up to a
noncanonical coherent choice; G6-B, separately, rules out universal
recovery of the whole pointed input even up to equivalence.

## Results ledger

- G6-A: exact cut relative commutant and its charge-origin ambiguity, including delta-moved cuts — **proven**.
- G6-B/B1/B2: general charge-translation counterexample, including connected sites, with simultaneous all-interval/dilation intertwining — **proven**.
- G6-C1/C2: intrinsic mark inventory; point ambiguity and a point-fixing automorphism moving corners/h/concatenation — **proven**, with the stated distinction between natural mark recovery and equivalence-class recovery.
- G6-D: exact same-ring/different-associator finite checks — **open**.
- G6-E: consequences for the R0/R4 information boundary — **open**.

## Layer tags

Setting: any, ordered open geometry. Data: L0 + fixed pointed H.
Rung reached: inherited R0^u existence only. Rung claimed: R0 information
boundary; no R1--R5 attainment.

## What this gives the integration

The proposed faithfulness of the full pointed transported input is false,
even with connected sites and even if endomorphism concatenations are added.
Whether the underlying category D alone is recovered is a separate, still
open question: this counterexample uses the same D on both sides.

## Open problems

Recover the missing marks up to equivalence, or produce a simultaneous
interval/dilation counterexample. Distinguish literal mark recovery from
equivalence-class reconstruction.

## Examples table

| Instance | Intended use | Status |
|---|---|---|
| F6 E-F, two normalized order-two associators with their supplied H | Exact simultaneous interval/dilation discrimination or intertwining | open |
| F6 E-H, two transports on the same fusion category | Test whether H survives the record | open |

## Sources used

- F6 `explorations/2026-10-25-astra-r3/F6-what-the-tower-remembers/NOTE.md:520-644`: simultaneous square, diagram gauge, marked extraction, and open boundary.
- Same directory `REVIEW.md:195-212`, `INTEGRATION.md:155-173`: precise next lemma and caution against separate conjugacies.
- `report/sections/77_pointed_carrier_invariants.tex:47-86`: richer reconstruction record.
- `report/sections/90_local_unital_lift.tex:60-141`: supplied H and local shuffle.
- `CONVENTIONS.md:1450-1468,1524-1576`: pointed sites, layers, crossings.
- `references/text/PenneysUnitaryFusionCategories.md:219-237,277-288,319-348,394-419`: splitting, graded categories, tensor/dagger coherence, duality.
- `references/manifest/SOURCES.md:34-35,55-57`: local source registration.
