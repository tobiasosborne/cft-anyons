# D1 — Pointed categorical carriers, blocking, and continuum configuration space

Status: exploratory research, 2026-10-22. Finite categorical results and the
configuration-space carrier theorem below are proved by structured arguments;
the headline analytic convergence statement is conjectural. No CFT is constructed.

## Headline conjecture

**D1-C — Local categorical collision-sewing regularisation.**
Let C be any unitary fusion category, and choose a finite object X and the
pointed site O = 1 ⊕ X. Supply finitely many categorical morphisms
`bα:X→X⊗X`, `vβ:1→X⊗X`, nonnegative real couplings λα, κβ, and μ>0.
No self-duality, multiplicity-free fusion, braiding, or algebra structure on O
is assumed. For categorical completeness require, additionally, that every
simple of C occurs in some tensor power of O.

Use the ordered-configuration Hilbert space, collision measure, trace maps,
and open-boundary form domain defined below. Suppose the nonnegative form

```
q(ψ) = ΣN,c ∫ΔN (Σi ||∂iψN,c||² + μN||ψN,c||²)
     + Σα λα ΣN≥1,c Σi=1..N ∫ΔN ||Ti ψN+1,c − Bα,i ψN,c||²
     + Σβ κβ ΣN≥0,c Σi=0..N ∫ΓN,i ||Ti+1 ψN+2,c − Vβ,i ψN,c||²
```

on its maximal finite-energy domain is densely defined and closed, and admits
a core of finite-particle, sectorwise smooth functions on closed chambers.
These analytic hypotheses are declared extra data, not consequences asserted
of a fusion category. Include as analytic input a positive self-adjoint H
representing q: `D(q)=D(H^(1/2))`, `q(ψ)=||H^(1/2)ψ||²`.
Thus no unsourced form-representation existence theorem is required here.
The conjecture is that the explicit **nearest-neighbour** categorical matrices

```
Hε = Σj [ε⁻² Dhop,j†Dhop,j
        + Σα λα ε⁻¹ Dbα,j†Dbα,j
        + Σβ κβ ε⁻¹ Dvβ,j†Dvβ,j] + μ N̂,
Dhop = πX0 − π0X,
Db   = πXX − √ε b πX0,
Dv   = πXX − ε v π00,
```

with ε=2⁻ⁿ, converge to H in the following precise sense. With the explicit
isometries `Kε:Hε,carrier→F_C,X(0,1)` of D1-T6, for every λ>0 and ψ in F,

```
Kε (Hε+λ)⁻¹ Kε† ψ → (H+λ)⁻¹ ψ  in Hilbert norm.
```

The symbol `Hε,carrier` denotes the carrier space, not the Hamiltonian.
The same conclusion is conjectured for every nested uniform subdivision
sequence whose mesh tends to zero. It must be natural under unitary tensor
equivalences carrying the declared reaction morphisms to each other.

This is a general rigorous continuum regularisation conjecture for local
number-changing categorical fields. It does not postulate an unknown lattice
Hamiltonian: every finite matrix above is specified. D1-T6 proves the exact
continuum carrier; D1-T7 proves smooth-core form consistency and reduces the
remaining analytic problem to collision-trace lower bounds. The conjecture
does not assert conformal invariance, relativistic locality, or modular fidelity.
Its intended contribution is to make indefinite number a precise constructive
mechanism on which those further requirements can be imposed.

## Conventions proposed

These are local declarations under the brief's exception to editing
CONVENTIONS.md. Existing (a), (b), (r), (t), and (u) have been checked.

1. C has simple unit 1 and its given dagger. Tensor powers are left associated;
   displayed omissions of associators/unitors mean coherent transport, not
   trivial numerical F-symbols. Hom spaces from a simple c use
   `s†t=〈s,t〉id_c`; we choose orthonormal bases when matrices are needed.
   Penneys:219–237,394–430,528–538 supplies these structures. Its displayed
   graphical vertex normalization at :534 is not silently our orthonormal one.
2. A *pointed object* is `(O,η)` with `η:1→O`, `η†η=1`.
   Set `p0=ηη†`, `p1=1−p0`, and choose an orthogonal splitting `ι:X→O`
   of p1. Thus O≅1⊕X; X may contain other copies of 1. Connected means
   `dim Hom(1,O)=1`, equivalently `Hom(1,X)=0`. An object without a unit
   summand has an observable tensor tower but no such vacuum insertion.
3. `π00:O²→1`, `πX0,π0X:O²→X`, `πXX:O²→X²` are the four orthogonal
   summand projections, with unitors included. The first three D maps above
   have codomain X, X², X² respectively; their dagger squares lie in End(O²).
   In Db the surviving single particle occupies the left site. Couplings are
   nonnegative, the Hamiltonian is the positive expression displayed, and
   no CA-86 sign convention is imported.
4. `F_c,N=Hom(c,X^N)`, `F_c,0=Hom(c,1)`; all sums include only nonzero
   spaces. `ΔN={(x1,...,xN):0<x1<...<xN<1}`, with ordinary dx1...dxN,
   and Δ0 is a point of mass one. There is **no N! factor**.
   `F=⊕̂c,N L²(ΔN;F_c,N)`. This is a definition of ordered configuration
   Fock space; no symmetric, antisymmetric, or braided quotient is assumed.
5. `Ti ψN+1` is the trace at positions i,i+1 coinciding, written on ΔN
   by duplicating its ith coordinate. Its measure is collapsed-coordinate
   Lebesgue measure, equal to Euclidean face measure divided by √2.
   `Bα,i` postcomposes with `id^(i−1)⊗bα⊗id^(N−i)`.
   `ΓN,i={(y1<...<yi<x<y(i+1)<...<yN) in (0,1)^(N+1)}` uses dy dx.
   `Vβ,i` inserts vβ between spectator factors i and i+1; its input ψN(y)
   is independent of x. The trace in this term duplicates x.
6. The form domain in D1-C consists of sectorwise H¹ functions for which
   **all** displayed nonnegative sums are finite. Outer endpoints have no
   Dirichlet restriction or added penalty. Thus the bulk form uses the
   natural open, Neumann boundary prescription. Collision conditions are
   determined by the reaction terms; no matching condition is imposed first.
   The core hypothesis means density in `sqrt(q+||·||²)` of finite-particle
   functions smooth on each closed chamber, among those in this domain.
7. The particle operator N̂ has eigenvalue N on F_c,N. Interval subdivisions
   use positive square-root length weights. Cell sample points for D1-T7
   are cell centres. All identities/checks use exact arithmetic.
   Raw cups still have norm squared d as in (r); a vβ is arbitrary supplied
   data, and any normalization change changes κβ or vβ explicitly.
8. Duals use the positive spherical convention now sourced in (r).
   Write dO for its dimension, equal to FPdim(O). Normalized spherical trace
   is `τL(a)=Tr_C(a)/dO^L`; ordinary carrier trace is a different state.

## 1. What the carrier invariant actually contains

The foundation is the sourced categorical direct sum and dagger calculus,
not an assumed identification with an unconstrained spin tensor product.
The following results are new local derivations extending CA-65–CA-73.

**D1-T1 (proved): pointed carrier and its three levels of structure.**

ASSUME a pointed object as above. Define

```
AL=End_C(O^L),  HL,c=Hom(c,O^L),  L≥0, O^0=1,
αL(a)=a⊗id_O,
Vφ:O^k→O^l  inserts η outside an order-preserving injection φ:[k]→[l],
θφ(a)=Vφ a Vφ†,  Pφ=Vφ Vφ†.
```

PROVE α is a unital injective *-map, V is a coherent isometric placement
functor, θ is an injective *-map onto a corner, and these are distinct data.

`<1>1.` Tensoring with identities preserves multiplication, unit and dagger.
If `a⊗id_O=0`, compression with `id⊗η` gives a=0. BY pointedness.
`<1>2.` `Vφ†Vφ=1`: cancel each η†η and use coherence. Composing placements
puts each old factor in its composite slot and η in every other slot;
hence `VψVφ=Vψφ`. BY monoidal functoriality, Penneys:394–398.
`<1>3.` `θφ(a)θφ(b)=θφ(ab)` and `θφ(1)=Pφ`. Any corner element B has
inverse image `Vφ†BVφ`. BY `<1>2`.
`<1>4.` A pointed unitary u:O→O' gives compatible maps Ad(u^⊗L), and
intertwines every placement. The same construction works across a unitary
tensor equivalence, using its tensorators. BY uη=η' and coherence.
`<1>5.` QED. For a fixed O all unit vectors in Hom(1,O) are related by a
unitary of its unit-isotypic block, so the pointed isomorphism class has no
extra orbit invariant. Remembering the chosen η still matters for formulas.

The unital tower has multiplicity vector `m_c(L)=dim HL,c` and incidence
`m_d(L+1)=Σc m_c(L) N^d_(c,O)`. This is CA-65's fusion-graph tower.
The corner tower has block maps `a_c↦J_c a_c J_c†`; it does not have that
Bratteli incidence. Calling vacuum insertion a unital inclusion is false.

**D1-T2 (proved): reconstruction requires the marked tensor structure.**

ASSUME that, besides all AL and θφ, one retains concatenation of operators
and the placement partial isometries `VφVψ†∈Al` for parallel placements.
PROVE these data reconstruct the full tensor subcategory generated by O,
after finite sums and projection splittings. If O tensor-generates C they
reconstruct C up to unitary monoidal equivalence, preserving its point.

`<1>1.` For r≥m,n take trailing-vacuum embeddings Wm,Wn into O^r.
There is a bijection
`Hom(O^m,O^n) ↔ (WnWn†) Ar (WmWm†)`, `f↦Wn f Wm†`.
Its inverse is `a↦Wn†aWm`. BY Wk†Wk=1.
`<1>2.` Enlarging r identifies these spaces by θ; composition and dagger
are multiplication and adjoint in a common Ar. BY cancellation of W†W.
`<1>3.` Concatenating corner representatives gives f⊗g with intermediate
vacuum gaps. The retained placement partial isometries move those gaps to
the trailing position. This reconstructs tensor product and its coherence.
Merely retaining the dimensions of these corners would not suffice.
`<1>4.` Split every projection and add finite direct sums. The resulting
objects are exactly sums of subobjects of powers of O. Morphisms are full
corner Hom spaces by `<1>1`. BY semisimplicity and Penneys:219–241,358–362.
`<1>5.` Every simple lies here under the generator hypothesis, hence the
functor to C is fully faithful and essentially surjective. QED.

This supplies an exact equivalence criterion for **marked tensor towers**:
their structure-preserving isomorphism is equivalent to an equivalence of
the generated pointed tensor categories. In a fixed C, a pointed site-unitary
is sufficient; allowing a tensor autoequivalence is a broader equivalence.
No such converse is claimed for naked sequences of algebras. Braiding and
twist must additionally be marked to reconstruct braided/ribbon data.

**D1-N1 (proved negative): the corner limit forgets fusion.**
Along any countable nested placement schedule with lengths tending to infinity,
let `H∞,c=lim HL,c`. Then
`lim(AL,θ)=⊕c K(H∞,c)` over reachable charges.

ASSUME the stated schedule. PROVE this equality in the represented norm.
`<1>1.` In charge c the stages are full matrix algebras on increasing
finite-dimensional subspaces, extended by zero on orthogonal complements.
`<1>2.` Their union contains rank-one operators between vectors in any
common stage. Those vectors are dense in H∞,c.
`<1>3.` Every finite-rank operator is a norm limit of such operators; every
stage operator is compact. There are finitely many c. QED BY `<1>1–3`.

Thus only the block Hilbert dimensions survive in this unmarked limit.
Even the unital tower records a chosen fusion graph, not automatically the
whole tensor category; see the final examples table. D1-T2 is the stronger
categorical statement actually available for fidelity.
At a single refinement step the corner is full exactly when every fine charge
already occurs at the coarse stage: a nonzero projection generates each full
matrix block it meets. Fullness eventually holds once reachable charge support
stabilises, but this C*-Morita statement does not reconstruct tensor structure.

## 2. Number-changing morphisms are a linking algebra

**D1-T3 (proved): intrinsic occupation grading and bimodules.**
Let `Q_L,n` be the sum of occupation-pattern projections with n copies of p1.
Then `Z_L,n=⊕|S|=n X^⊗n`, `N̂L=Σn n Q_L,n`, and

```
AL = ⊕m,n Hom(Z_L,n,Z_L,m),
AL^(k) = ⊕m−n=k Q_L,m AL Q_L,n,
AL^(k) AL^(l) ⊆ AL^(k+l),  (AL^(k))†=AL^(−k).
```

ASSUME the orthogonal splitting of O. PROVE these formulas and compatibility.
`<1>1.` Distribute O^L over its orthogonal summands and group by occupancy.
BY Penneys:219 and tensor distributivity.
`<1>2.` Insert `1=Σn Q_L,n` on both sides of a∈AL. Orthogonality proves
the direct sum and the multiplication/adjoint rules. QED for the grading.
`<1>3.` Each `Hom(Z_n,Z_m)` is an `(End Z_m,End Z_n)` bimodule by
composition; in charge c it is a rectangular matrix space of size
`[binom(L,m) dim F_c,m] × [binom(L,n) dim F_c,n]`.
`<1>4.` Placements preserve n exactly: `N̂l Vφ=Vφ N̂k`.
The subspaces with n≤r form a compatible carrier filtration. Separately,
the operator bandwidth filtration `F_r AL=⊕|k|≤r AL^(k)` is multiplicative.
Neither says a Hamiltonian preserves N. QED.

For two sites, `Z0=1`, `Z1=X⊕X`, `Z2=X²`. The number-preserving algebra
is `D=End Z0 ⊕ End Z1 ⊕ End Z2`; its off-diagonal complement is a
D-bimodule, **not** in general an algebra or ideal. If Hom(1,X)=0, put
`s=dim Hom(1,X²)`, `t=dim Hom(X,X²)`. Then

```
dim A2^(+2)=s,  dim A2^(+1)=2t,
dim(number-changing part)=2s+4t.
```

If X has unit summands, add `2 dim Hom(1,X)` to dim A2^(+1).
These identities are a complete two-site diagnostic, including multiplicities.
Parity preservation of the **full** tower is equivalent to
`Hom(X^m,X^n)=0` whenever m−n is odd: take occupied corners for necessity,
and use `<1>1` for sufficiency. Testing only t=0 does not prove that all-scale
condition. CA-69's pairing-diagram subalgebra can therefore be proper for a
structural reason independent of any named example.

## 3. Blocking is decidable; Morita class is too coarse

**D1-T4 (proved): exact paired-site obstruction and transport.**
Write `[O]=Σc o_c[c]`. There exists Y with O≅Y⊗Ȳ if and only if the
following finite integer system has a solution:

```
o_c = Σa,b y_a y_b N^c_(a,b̄),    y_a≥0 integers,
Σa y_a² = o_1.
```

ASSUME the fusion coefficients and dagger structure. PROVE the criterion.
`<1>1.` Decompose Y=⊕a y_a a and distribute Y⊗Ȳ; its multiplicities are
exactly the first expression. BY the definition of fusion coefficients.
`<1>2.` Rigidity gives `N^1_(a,b̄)=δab`, hence the second expression.
Each y_a≤floor(sqrt(o_1)), so exhaustive search terminates, including o_1=0.
BY Penneys:427–487. No numerical algebraic-number comparison is required.
`<1>3.` A solution gives equal simple multiplicities, hence an isomorphism;
polar decomposition makes it unitary. BY semisimplicity, Penneys:233.
`<1>4.` For connected O, o_1=1 forces Y simple. Necessary quick rejections
are self-duality of O and `FPdim(O)=FPdim(Y)^2`; neither alone is a
sufficiency test. QED.

Given u:O→Y⊗Ȳ, tensoring u identifies all local algebras and multiplies
interaction ranges by two. The correct dense chain is alternating Y,Ȳ;
a homogeneous chain needs Y≅Ȳ and an explicit choice of that identification.
Choose u so `uη=dY^−1/2 coevY`; this is always possible by a unitary on
the unit-isotypic component. Then vacuum insertion becomes insertion of a
**normalized cup pair**. Number becomes the number of pairs outside this
distinguished vacuum channel. The observable and refinement interpretations
are transported together, not erased by blocking.

The same argument works for any supplied factorisation
`O≅Z1⊗...⊗Zr`: an interaction on k coarse sites has range rk, and η is
transported to a chosen vector of Hom(1,Z1...Zr). Thus failure of D1-T4
excludes only *dual-pair blocking inside this C*. It does not exclude other
finite words, enlarging C, dualities using module categories, or equality of
continuum universality classes. Nor does successful blocking select a dense
Hamiltonian or critical point. These are precise limits to CA-87 Lemma 87.1.

**D1-N2 (proved negative): no classification by Morita class alone.**
A bare O is not an algebra object: multiplication and unit axioms are extra
data (FRS:2272–2284). Consequently notation C_O for modules is undefined
until an algebra structure on O has been chosen.
The object `M(O)=O⊗Ō` does admit the matrix-algebra structure obtained by
evaluation in the middle and coevaluation as unit (FRS:2331–2336).
Its Morita class forgets matrix-size information relevant here.

ASSUME nonzero pointed O. PROVE a counterfamily within arbitrary C.
`<1>1.` Let O'=O⊕O, pointed by η into the first copy.
Then `End(O')≅M2(End O)` and its vector-space dimension is four times larger.
Thus no level-preserving tower isomorphism exists already at level one.
`<1>2.` `M(O')` is the 2×2 matrix amplification of M(O).
The column and row bimodules implement the usual matrix Morita equivalence:
matrix-unit multiplication contracts row⊗column to the original algebra,
and column⊗row to its matrix amplification. The identities are the
matrix-unit equations, valid in the direct-sum envelope of C.
`<1>3.` Hence their module categories agree while their pointed towers do
not. QED. FRS:2913–2920 independently records that all U⊗U∨ examples
lie in the same Morita class in its setting.

An algebra-object multiplication, a distinguished module/generator, its
vacuum vector, and tensor action can enrich the invariant; the unmarked
module category or Morita class cannot replace those data. An arbitrary
algebra structure on O does not imply O is a matrix object Y⊗Ȳ.

## 4. Refinement, locality, and the Jones comparison

**D1-T5 (proved): the actual universal property of vacuum insertion.**
For every object T, composition with Vφ is a bijection

```
Hom(T,O^k) → {f:T→O^l : Pφ f=f},   inverse f↦Vφ†f.
```

ASSUME the placement of D1-T1. PROVE the claim and its scope.
`<1>1.` The two compositions are identities by `Vφ†Vφ=1` and `Pφf=f`.
They commute with precomposition in T. Thus Vφ represents exactly the
functor of maps whose unused slots are vacant. QED for the property.
`<1>2.` Any isometry with the same range is Vφu for a domain unitary u;
requiring `Vφ†W=1` singles out Vφ. Charge preservation and locality alone
do not single it out: D1-T6 gives a different local isometry.
`<1>3.` More generally any two categorical isometries from the same object
into the same finite target differ by a target unitary. In each simple-charge
block extend the unitary between their equal-dimensional images to their
equal-dimensional orthogonal complements. QED.

Step `<1>3` proves **cellwise** `W=UV`; it does not give a bounded-depth
circuit for a general globally specified many-cell W. That additional locality
statement must be proved, not inferred from finite-dimensional extension.

The category of finite ordered sets and increasing injections, **including
the empty set**, has the expected generation by inserting η and identities:
each injection is an ordered tensor word of these maps. Associativity of
concatenation and exchange of insertions give D1-T1's functoriality directly.
For a site-unitary u, `u^⊗l Vφ=V'φ u^⊗k` is its naturality equation.
A right caret alone cannot insert before the first existing strand, so it
does not generate every such placement. Nor is `⊕c Hom(c,O^L)` a strong
monoidal functor to ordinary Hilbert tensor products. Consequently CA-71's
general Thompson-V conclusion is not inherited here from that caret alone;
the concrete-target hypotheses of Brothier–Stottmeister:522–541 need checking.
Composing the categorical forest functor with the Hom-space functor still
gives an ordinary covariant Hilbert-isometry functor, so the sourced ordinary
Thompson-F construction at :500–511 is not excluded by this qualification.

There is also a locality distinction absent from the slogan “local V”.
For a coarse local a embedded in the whole chain,
`θL(a)=VL a VL†` contains vacancy projectors at **all** inserted sites,
including sites outside the support of a. It is not a support-preserving
map of the whole quasi-local net. Applying the cell map only on a's interval
and extending by identities gives a local operator agreeing on the code
subspace, but generally a different operator on the complement.
Likewise a polynomial with constants transports as
`θ(F(a;1))=F(θ(a);P)`, not `F(θ(a);1)`. These qualifications apply when
using CA-73's residual transport; they are not edits to that historical shard.

**D1-N3 (proved negative): compression is not a faithful Jones expectation.**
`E(B)=V†BV` is UCP, `Eθ=id`, and `E(1−P)=0`.
For trailing vacuum insertion it is an α-bimodule map, so `αE` is a unital
conditional expectation onto α(Ak). Its nonzero positive kernel when P≠1
precludes a bound `αE(B)≥λB` for all B≥0 with λ>0.
Indeed set B=1−P. These identities follow by direct multiplication.
Hollands:1193–1204 starts its basic construction from a finite-index inclusion
and a faithful-state setup; that is additional structure, not this corner
compression. A forest construction named after Jones and a Jones basic
construction are different constructions. A selected Q-system/subfactor can
provide a related relative-commutant tower, but no identification is proved here.

**D1-T5b (proved): the defect is conditioning weight, not index.**
For p=ω(P)>0 the normalized corner pullback has GNS vacuum vector
`π(P)Ω/√p`. Therefore its squared distance from Ω is `2(1−√p)`, with
`1−p ≤ 2(1−√p) ≤ 2(1−p)`.
Proof: its norm is one and its overlap with Ω is √p; rationalise 1−√p.
This derives CA-72's scalar as a normalized projection overlap.
For coherent successive GNS maps, `Σ sqrt(1−p_n)<∞` is a sufficient
telescoping condition for convergence of transported vacuum vectors; it
does not by itself establish WT-1's unital observable hypotheses.

For the spherical trace, `τl(Pφ)=dO^(k−l)`, since the categorical trace of
an isometry's range projection is the dimension of its domain. Conjugating
Pφ by any categorical unitary leaves that value unchanged. Thus trace states
cannot approach weight one under extensive insertion when dO>1, even after
unitary dressing. A selected physical state is indispensable.
Finally the CA-72 completion has defect `covχ(S,T)(1−P)`; its operator norm
is |covχ(S,T)| when P≠1, irrespective of ω(P). Small GNS defect alone is
not operator-norm asymptotic multiplicativity. This limits the claimed soft
system interpretation unless the required topology is supplied separately.

## 5. A continuum Fock carrier exists for every pointed category

**D1-T6 (proved): coherent local spreading gives ordered configuration Fock.**
For child interval lengths a,b>0 define R_a,b:O→O² by

```
Rη = η⊗η,
Rι = sqrt(a/(a+b)) (ι⊗η) + sqrt(b/(a+b)) (η⊗ι).
```

ASSUME C,(O,η), the splitting X, and nested partitions of (0,1) with mesh→0.
PROVE R gives exact charge- and number-preserving local refinements, and
their completed Hilbert inductive limit is F defined in the conventions.

`<1>1.` The vacuum, left occupied, and right occupied summands are orthogonal.
Thus `R†R=1`. Postcomposition preserves each charge and occupation number.
`<1>2.` Under any iterated subdivision, the coefficient for the one particle
to land in a specified final child J of parent I is `sqrt(|J|/|I|)`:
the intermediate length ratios telescope. Vacuum maps to all vacua.
Consequently different parenthesisations of subdivision agree, including
unequal subdivisions. Tensoring over parent cells proves exact coherence.
This is not unweighted coassociativity of a single fixed 50:50 caret for
arbitrary binary trees: their intermediate cell lengths must also be kept.
`<1>3.` For a partition π=(I1,...,IL), distribute O^L as in D1-T3.
Map a vector t∈F_c,N in occupied cells j1<...<jN to

```
Kπ(t at {j1,...,jN})(x)
  = [Πr |Ijr|^(-1/2) 1_Ijr(xr)] t.
```

Different occupied boxes are orthogonal and each has squared integral one.
Thus Kπ is an isometry. It respects total charge and N exactly.
`<1>4.` Expanding a parent box into child boxes proves `Kσ Jσπ=Kπ`:
the coefficient in `<1>2` cancels the child normalization in `<1>3`.
`<1>5.` Fix N. The complement of distinct-cell boxes lies where two ordered
coordinates share a cell; its points satisfy some `|xi−xj|≤mesh(π)`.
Every strictly ordered configuration eventually lies outside that set.
For a continuous function with compact support inside ΔN, sufficiently
fine cell averages approximate uniformly on its support. Such functions
are dense in L²(ΔN); collision faces have Lebesgue measure zero.
Hence the nested union of these step spaces is dense in each N,c sector.
`<1>6.` Finite sums of sectors are dense in the Hilbert direct sum. Therefore
the Kπ extend to a surjective unitary from the inductive limit onto F.
QED BY `<1>1–5`.

This is a continuum carrier theorem without assuming a Hilbert-space tensor
factorisation of fusion constraints. For adjacent intervals I,J, its correct
factorisation, after semisimple decompositions, is

```
F_c(I∪J) ≅ ⊕̂a,b F_a(I) ⊗ F_b(J) ⊗ Hom(c,a⊗b).
```

Split an ordered configuration by its left/right particle numbers, then
resolve X^m and X^n into simple summands; composition gives the displayed
unitary by the isometry inner product. Associators relate repeated splits.
This retains categorical fusion fibres, rather than declaring them to be
ordinary independent onsite degrees of freedom. Braiding has not been used.

The refinement is an explicit depth-one dressing of CA-68's V.
On the multiplicity pair `X0⊕0X`, take the real unitary matrix
`[[√t,−√(1−t)],[√(1−t),√t]]`, t=a/(a+b), tensored with id_X;
on 00 and XX take the identity. Then `R=U(id_O⊗η)`.
No new particles are needed to repair this particular isometry: it preserves N.
Number-changing morphisms supply interactions, not the proof of this spreading.

**D1-N4 (proved boundary): bare placement has a different continuum meaning.**
Under dyadic odd-slot placement, label slots by their left endpoints so a
one-particle basis vector remains at a persistent dyadic location. The union
completes to ℓ² of
that countable position set, with fusion fibres for finite occupied subsets.
Moving such a vector to a different arbitrarily nearby dyadic point changes
it by norm √2. Thus the position-permutation action on these atomic vectors
cannot give strongly continuous geometric translations. This does not deny
abstract Hilbert-space isomorphisms or all possible group representations;
it rejects the geometric continuum interpretation of bare insertion.

Also, N̂ need not count physical asymptotic particles of a CFT. The carrier
contains superpositions of N and permits its change. A filled critical state
may have infinite microscopic particle density and require a GNS representation
inequivalent to this finite-configuration representation. No argument here
identifies the empty configuration with a conformal vacuum.

## 6. Structural evidence and the exact analytic gap in D1-C

**D1-T7 (proved partial result): local reaction scaling and smooth recovery.**

ASSUME a finite-particle smooth vector ψ in D1-C's core. At mesh ε let
`uε(S)=ε^(N/2) ψ_N(cell centres of S)`, with its categorical fibre unchanged.
PROVE `Kε uε→ψ` and `〈uε,Hεuε〉→q(ψ)`.

`<1>1.` Ordinary Riemann sums on distinct-cell boxes give norm convergence;
the omitted collision neighbourhood has volume tending to zero. BY smoothness
on compact closed chambers and finitely many nonzero sectors.
`<1>2.` The hopping term is a sum over unordered nearest-neighbour allowed
particle moves of `ε⁻² ||uε(S')−uε(S)||²`. Taylor expansion in that coordinate
gives the integral of `||∂iψ||²`. Moves are counted once, not twice.
Missing moves across collision/outer boundaries occupy shrinking strips;
bounded derivatives make their error vanish. This produces the stated
bulk coefficient and no imposed Dirichlet boundary condition.
`<1>3.` In a fusion event with n spectator particles there are n+1 collapsed
coordinates, and the two amplitudes scale as ε^((n+2)/2) and ε^((n+1)/2).
The local squared defect is
`ε⁻¹ ||u_XX−√ε b u_X0||²`.
It is therefore ε^(n+1) times the continuum squared face defect.
Summing face grid points gives the Δ_(n+1) integral with collapsed-coordinate
measure. The left-site anchoring error is O(ε) for the smooth functions.
`<1>4.` For pair creation with n spectators the amplitudes scale as
ε^((n+2)/2) and ε^(n/2). Hence
`ε⁻¹ ||u_XX−ε v u_00||²` has the same ε^(n+1) face weight.
Its sum includes the insertion position and becomes the Γ_n,i integral.
`<1>5.` Different spectator patterns are orthogonal summands. Unit-label
transport and categorical b,v give exactly the inserted fibre maps.
Neighbouring multiple collisions remove only lower-dimensional grid strips;
bounded smooth amplitudes make their face Riemann errors vanish.
`<1>6.` Include reactions whose output sector is zero: even a vector supported
at N contributes the lower-input square in the N+1 or N+2 face term.
Only finitely many such sectors occur here. The μN term converges by `<1>1`.
QED BY `<1>1–6`.

The remaining statement is not a matter of F-symbol manipulation.
For arbitrary sequences `Kεuε ⇀ ψ` with bounded discrete energy, one needs
the lower bound `q(ψ)≤liminf〈uε,Hεuε〉`. Small L² error does not control
collision traces. Required work is a sectorwise discrete H¹ interpolation
and trace estimate on ordered exclusion grids, including corners where
several particles collide and coupling different particle sectors.
No such all-sector lower-bound theorem is proved or locally sourced here.

Once that lower bound is proved on every finite collection of bulk/face
terms, positivity gives the full lower bound by taking the supremum over
finite collections. D1-T7 plus the declared smooth form core supplies a
diagonal recovery sequence for every finite-energy vector: first approximate
in form norm by a fixed core vector, then refine its grid.
The μN term additionally bounds particle-number tails in norm by energy/(μM).
These are concrete reductions; they do not replace the missing trace estimate.

There is also a proved bound on the lower-sector source terms:
`ΣN,i ||B_iψ_N||² ≤ ||b||² ΣN N||ψ_N||²`, and
`ΣN,i ∫ΓN,i ||V_iψ_N||² = (v†v) ΣN ||ψ_N||²`.
ASSUME ψ has finite bulk form norm. PROVE these bounds.
`<1>1.` Each insertion of b has norm at most ||b|| and there are N positions.
Integrate and sum to obtain the first inequality.
`<1>2.` For fixed spectator configuration y, the N+1 permitted gaps for x
partition (0,1) except finitely many points. Their lengths sum to one.
`<1>3.` Since v†v is scalar on 1, insertion multiplies squared fibre norm
by that scalar. Integrate in x and then y. QED.
Consequently the source terms are bounded in the bulk μN form norm.
This suggests proving closedness/core by graph norms of sectorwise traces,
then particle truncation and smoothing. That additional domain proof is not
claimed here; it identifies why the input assumptions may be removable.

For completeness, the variational implication needs no imported convergence
theorem. A resolvent vector uniquely minimizes
`q(u)+λ||u||²−2 Re〈f,u〉`. For the discrete version replace f by Kε†f.
Recovery bounds the minimum from above; weak compactness and the lower bound
identify every weak cluster point with the unique continuum minimizer.
For a recovery vε of that minimizer, the quadratic identity for the discrete
minimum gives `λ||uε−vε||² ≤ Fε(vε)−Fε(uε)→0`.
Thus minima and minimizers converge strongly, proving exactly D1-C's
projected-resolvent conclusion **conditional on** that missing lower bound.

The available sources ground fusion, dagger positivity, and lattice/OAR
interfaces. They do not provide this collision-form regularisation theorem.
No paper is being paraphrased as if it did. Supplying b,v, couplings, a closed
form/core, and eventually conformal Ward estimates remains extra synthesis.
This benchmark deliberately permits an easier nonrelativistic continuum;
it is a test of the carrier mechanism, not a claim to have solved CFT dynamics.

## 7. Small checks and skeptical audit record

Run from the repository root:

```
python3 explorations/2026-10-22-astra/D1-carrier-theory/checks/carrier_checks.py
```

The script checks exact orthogonal-block identities, unequal-length refinement
composition, a tiny configuration-grid embedding, corner/GNS defects, and
reaction scaling. It records deliberately rejected mutations. These are
finite shadows of the proofs, not tests of D1-C's unproved analytic estimate.
Raw output, a producer hash and a dependency manifest are in checks/; no Julia
or large matrix run is used. Four invariant groups pass and four deliberate
mutations are rejected before restoration. This directory is the whole run
bundle under the write restriction.

An independent skeptical collaborator checked the corner/tensor distinction,
finite blocking search, reconstruction, and the configuration theorem. The
audit caught two essential qualifications incorporated above: collision-face
measure is dS/√2, and open hopping requires an explicit Neumann form-domain
prescription. It also confirmed the global-support and Hilbert-tensor-functor
limitations in older shards. The author remains responsible for these proofs;
none is machine-checked or an external theorem without a source anchor.

## Results ledger

- D1-C — **conjectural**: explicit nearest-neighbour collision Hamiltonians have the stated continuum resolvent limit.
- D1-T1 — **proved**: pointed placement functor, distinct unital tensor and corner towers, pointed naturality.
- D1-T2 — **proved**: the marked tensor/placement tower reconstructs the tensor-generated category; braiding needs marking.
- D1-N1 — **proved negative**: unmarked corner limit is a finite sum of compact-operator algebras and loses fusion information.
- D1-T3 — **proved**: intrinsic occupation grading, rectangular bimodules, two-site dimensions, all-scale parity criterion.
- D1-T4 — **proved**: finite exact fusion-ring criterion for dual-pair blocking and transport of the pointed refinement.
- D1-N2 — **proved negative**: matrix-algebra Morita class/module category alone cannot classify the pointed tower.
- D1-T5 — **proved**: vacancy-range representing property and finite-cell unitary extension; global circuit locality is additional.
- D1-N3 — **proved negative**: vacuum compression is nonfaithful and does not automatically supply a Jones tower.
- D1-T5b — **proved**: conditioning interpretation, trace-weight obstruction, and topology qualification for the GNS defect.
- D1-T6 — **proved**: length-weighted local spreading has the exact ordered-configuration Fock limit for arbitrary C,X.
- D1-N4 — **proved negative**: bare insertion gives atomic positions, incompatible with their geometric strong continuity.
- D1-T7 — **proved partial**: smooth-core recovery/form consistency and source-term bounds; resolvent conclusion conditional on the missing lower bound.
- Exact script — **finite checked evidence** only; mutation rejection does not establish continuum analysis.

## What this gives the integration

CA-65/66 gain a precise pointed input, number bimodules and a reconstruction
criterion. CA-68/71 gain an explicit general local dressing with a fully proved
continuum **carrier**, while their corner maps remain distinct from unital
OAR maps. CA-72 gains the conditioning/trace interpretation and the explicit
operator-norm caveat. CA-73's global corner transport requires its support
and transported-unit qualifications before it can be used as a local net map.

CA-87's useful statement becomes a decidable test and a transported local
equivalence, with no model-specific dynamics inferred. D1-C's b and v are
the general fusion and pair-creation tiles that can feed CA-86's spacetime
dictionary. The form coefficients carry the dynamical metric information;
category evaluation alone does not fix them.

WT-1 still needs unital observable refinements and the same physical state;
VR-1 still needs actual graph-norm mode estimates. Neither follows from Kε.
LC-1–LC-5 and LC-9/10 can supply candidate local sewing/reaction data, but
their conformal equations do not automatically imply D1-C's analytic
hypotheses or its converse. LC-4's microscopic certificates remain separate.
The tensor fibres in D1-T2/T6 preserve input information; identifying the
*complete continuum sector category* and its modular data is a further task.
No real central-charge lift or extended chiral algebra is selected here.

## Open problems

1. Prove or refute the finite-sector discrete collision-trace lower bound
   in D1-C; begin with general finite-dimensional b,v rather than a category
   example. Establish its domain at multiple-collision corners explicitly.
2. Derive sufficient uniform conditions for the form's closedness and smooth
   finite-particle core from b,v and couplings; remove those input hypotheses.
3. Construct local **unital** observable scaling maps compatible with a
   selected interacting state. The corner construction does not solve this.
4. Determine which critical states are normal in configuration Fock and which
   require a different GNS sector; microscopic occupancy is not CFT particle number.
5. Couple the local categorical reaction data to LC Ward/stress equations,
   then prove standard KS estimates and full projective-unitary symmetry.
6. Study other word-blockings and enriched module-category descriptions;
   absence of a dual-pair root is not a universal novelty certificate.
7. Add explicitly transported braiding/ribbon data when modular fidelity is
   the target. Ordered one-dimensional configurations alone do not implement exchange.

## Examples table

The general arguments above do not use any row of this table.

| Instance | Calibration or falsification | Local evidence |
|---|---|---|
| Fibonacci, O=1⊕τ | τ⊗τ=1⊕τ passes the connected square test. Blocking transports occupancy to the non-vacuum channel of each pair; no critical Hamiltonian is selected. | Penneys:610–631; CA-87 Lemma 87.1 only. |
| Finite-dimensional Hilbert spaces, O=C² and O'=C³ | Both matrix algebra objects are Morita trivial; End(O)=M2 and End(O')=M3 differ. The former has no dual-pair root since 2 is not an integer square. | Penneys:423; FRS:2331–2336,2913–2920; ordinary dimension calculation. |
| Graded Hilbert spaces for finite groups G, regular O=⊕g g | For |G|=r, m_g(L)=r^(L−1) for L≥1, and every unital incidence is one. Both unmarked tower types lose the group law; for example C4 and C2×C2 have the same such towers, but different groups of invertible simples. | Penneys:277–288,522; count the final label after choosing the first L−1 labels. |

## Sources used

All paths below are local. Line anchors refer to the files read in this session.
New results are the explicitly numbered derivations above, not attributed to
the cited authors. No network acquisition was performed.

- `references/text/PenneysUnitaryFusionCategories.md:195–241`: unitary
  categories, orthogonal sums, polar decomposition, projection splittings.
- Same file `:277–288,350–362,394–430`: graded categories, coherence,
  tensor completions, duals and Frobenius reciprocity.
- Same file `:470–512,522–538`: fusion multiplicities, unit/dual identity,
  FP dimension, regular-object graph and Hom inner product.
- Same file `:610–631`: the single named fusion calibration in the table.
- Same file `:1010–1019`, and
  `references/text/EtingofNikshychOstrikFusionCategories.txt:1700–1706`:
  positive spherical trace and equality with FP dimension.
- `references/text/GaugingDefectsQuantumSpinSystems.txt:174–221`:
  maybe-site expansion and its explicitly kinematic status.
- `references/categorical-reconstruction/FuchsRunkelSchweigert2002/source/hep.tex:2272–2284,2331–2336,2913–2920,4471–4480`:
  algebra-object data, matrix objects, Morita warning, bimodule terminology.
- `references/text/HollandsAnyonicChainsAlphaInduction.txt:1193–1204,1240–1271`:
  basic construction and cup-derived Jones projections under subfactor hypotheses.
- `references/refinement/BrothierStottmeister2019Gauge/source/main.tex:499–541`:
  forest functors and the concrete tensor-functor hypotheses; not assumed for H_c,L.
- `literature/md/2010.11121/2010.11121.md:126–180` and
  `literature/md/2306.16063/2306.16063.md:568–575`: strict and soft
  observable-system interfaces, not a theorem about the present collision forms.
- Source manifests read: `references/manifest/SOURCES.md:32–36,53–58`,
  `references/category-theory/SOURCES.md:1–25`,
  `references/refinement/SOURCES.md`,
  `references/categorical-reconstruction/SOURCES.md:86–125`.
- Local dependencies: `report/sections/65_anyonic_word_algebra.tex:46–137`,
  `report/sections/66_anyonic_states_variable_n_fock.tex:54–161`,
  `report/sections/68_variable_n_refinement_maps.tex:51–153`,
  `report/sections/69_dilute_tl_word_algebra.tex:46–67`,
  `report/sections/71_refinement_placement_category.tex:49–180`,
  `report/sections/72_gns_descent_corner_calculus.tex:44–195`,
  `report/sections/73_categorical_residual_set.tex:166–200`.
- CA-87 was read with `git show`, without checkout or modification:
  `origin/claude/festive-franklin-rl8kty:report/sections/87_dilute_fibonacci_is_blocked_golden.tex:55–69`,
  branch commit `1f402aaf96d2ffb9d8efb0684836d4771bbd5f60`.
  Only its categorical blocking lemma is used, not its other claims.
- Integration dependencies: `cft_machine/research/wilson_triangle.md:1–38`,
  `cft_machine/research/virasoro_routes.md:52–80,165–183`,
  `reconstruction/04_cutoff_oar.md:16–31,84–160`, and
  `reconstruction/README.md:19–39`. Their unproved analytic interfaces
  have not been promoted to results.
