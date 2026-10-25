# F6 — What the right-insertion tower remembers

2026-10-25. **Verdict: F6 needs correction.** The bare trailing AF limit
remembers the rooted scaled ordered dimension group, generally less than the
fusion ring. The corrected AF, K_0, trace and isomorphism claims are proved
below. The abstract dyadic diagram forgets F/H, while a more richly marked
finite refinement recovers H. The intermediate interval-filtered algebra
with its dilation remains explicitly unresolved.

Session began 05:04 UTC; the initial statement and all-open ledger were
written within the first ten minutes (05:06 UTC checkpoint). Each completed
proof block was then saved with its updated ledger. The final ledger below
replaces, rather than conceals, those initial open statuses.

The task's directory-only, no-network, no-commit restriction overrides the
usual repository landing workflow. All supplementary conventions are recorded
here; CONVENTIONS.md and the report are not edited. This is a mathematical
proof record, not a proof-assistant certificate.

## Corrected statement and conventions

**ASSUME** C is a unitary fusion category and O is **nonzero**. Set
D = <O>, W_L = O^{⊗L}, W_0 = 1, A_L = End_C(W_L), and
i_L(a) = a ⊗ id_O. The bracketing, dagger, and positive spherical dimension
are those of CONVENTIONS (a),(b),(r),(am). In this note i_L is the trailing
inclusion; alpha_L is reserved for the distinct CA-90 dyadic map (as).
The brief's reference to (ar) is Ward-to-KS notation; (as) is the relevant
crossing convention. No periodic seam is assumed.

For x,y in I = Irr(D), use **column multiplicities**:
N[y,x] = dim Hom(y,x⊗O), m_L[x] = dim Hom(x,W_L),
m_0 = e_1, m_{L+1} = N m_L, S_L = {x : m_L[x]>0}.
Ordinary matrix traces are unnormalised; a rank-one projection has trace 1.
K_0 means the Grothendieck group of stable Murray–von Neumann projection
classes, with its positive cone and distinguished class of the identity.
An AF algebra here is the norm completion of an increasing union of
finite-dimensional C*-algebras. All isomorphisms preserve the *-structure.
Nonzero O is necessary: O=0 kills A_0=C at the first step and has d_O=0,
so the claimed injective unital tower and normalized trace do not apply.
In source abbreviations below, Penneys means
`references/text/PenneysUnitaryFusionCategories.md`; ENO means
`references/text/EtingofNikshychOstrikFusionCategories.txt` unless `.md` is
specified. CA numbers refer to the existing report shards listed at the end.

**PROVE or delimit** the following, in Lamport structured form:

1. The AF tower has the **rooted, reachable unfolding** of N as its Bratteli
   diagram; K_0 is the ordered limit of Z^{S_L} with the restricted incidence
   matrices and unit [m_L,L]. The full stationary group on Z^I requires a
   qualification; determine the exact order ideal selected by e_1.
2. The compatible trace has rank-one weights d_x/d_O^L, with uniqueness
   when N is primitive. Block weights include the factor m_L[x].
3. Same rooted incidence data give isomorphic filtered towers, irrespective
   of F. Determine/prove the scaled ordered K_0 classification without
   silently citing an unavailable Elliott theorem. Refute recovery of the
   whole fusion ring if it is false, with explicit general families.
4. Distinguish a bare dyadic inductive system, the trailing limit with a
   compatible dyadic endomorphism, and a system marked by all local interval
   embeddings. Determine precisely which conclusions about half-braidings
   or associators each permits.
5. State the resulting R0 fidelity obstruction and a correctly conditional
   ladder statement; neither “exactly the fusion ring” nor “F first enters
   at R1” is assumed.

## 1. The rooted AF algebra and its ordered group

**F6-A [proven; any; L0; R0^u, trailing geometry].**
**ASSUME** the conventions above. **PROVE**

\[
 A_L\cong\bigoplus_{x\in S_L}M_{m_L[x]}(\mathbb C),\qquad
 (K_0(A_\infty),K_0(A_\infty)^+,[1])
 \cong\varinjlim_L(\mathbb Z^{S_L},\mathbb Z_+^{S_L},m_L;
                    N|_{S_{L+1}\times S_L}).                 \tag{1}
\]

Its Bratteli diagram has vertices **S_L at level L**, rooted at the unit
at level 0, and N[y,x] edges from x to y. “Fusion graph” in F6(a) must
mean this rooted unfolding, not every vertex at every level.

`<1>1.` The asserted finite decomposition and incidence hold.
BY orthogonal semisimple splitting (Penneys:219–237,470–478) and the
already established incidence of CA-77 Proposition 77.1. More explicitly,

\[
 \operatorname{Hom}(y,W_L\otimes O)
 \cong\bigoplus_{x\in S_L}\operatorname{Hom}(x,W_L)
                       \otimes\operatorname{Hom}(y,x\otimes O).
\]

Composition sends a⊗1 to a_x⊗1 on this summand, so its multiplicity
is N[y,x]. This identifies the inclusion on minimal projection ranks,
not just on dimensions of the algebras. There is no M_0 summand.

`<1>2.` The maps i_L are unital injective *-homomorphisms, including
when O is not pointed. BY tensor dagger/interchange (Penneys:319).
For injectivity, the positive dimension character gives
Σ_y N[y,x]d_y=d_x d_O>0 for every x (ENO:1459–1487,1700–1706).
Thus every source matrix block occurs in some target block in `<1>1`;
no nonzero source block is killed. These maps are isometric: their
norm is the maximum of the norms of the represented source blocks.
The algebraic direct limit therefore has a well-defined C*-norm, and its
completion is a unital AF algebra by the definition above. The norm-limit
construction agrees with the strict system in
`literature/md/2010.11121/2010.11121.md:164–176`.

`<1>3.` For B=⊕_x M_{b_x}, stable projections are classified by their
nonnegative integer block ranks. BY diagonalising each finite matrix;
equal ranks give partial isometries blockwise, and a partial isometry
preserves ranks. Every nonnegative rank vector occurs in a sufficiently
large matrix amplification of B. Hence V(B)=Z_+^{blocks}, K_0(B)=Z^{blocks},
and [1_B]=(b_x). A multiplicity matrix T acts by v↦Tv, by the same
rank computation. Here V denotes the stable projection-class monoid.

`<1>4.` V and K_0 commute with the particular norm completion in `<1>2`.
The needed continuity fact is proved here, rather than imported as a
K-theory theorem.

`<2>1.` Given a projection p in M_k(A_∞), approximate it by a
self-adjoint b in M_k(A_L) with ||b−p||<ε<1/4. Its spectrum lies within
ε of {0,1}: outside those neighbourhoods the inverse of p−z and a
Neumann series invert b−z. Set q=1_[1/2,∞)(b) in that finite algebra.
Finite spectral calculus gives ||q−b||≤ε, hence ||q−p||<1.

`<2>2.` Close projections are equivalent, explicitly. Put
z=qp+(1−q)(1−p). Then z−1=(q−p)(2p−1), so z is invertible,
zp=qz, and z*z commutes with p. Thus
u=z(z*z)^(-1/2) is unitary and upu*=q. The inverse square root belongs
to the algebra: rescale the positive invertible z*z and use its
norm-convergent binomial series. Consequently every stable projection
class comes from a finite stage.

`<2>3.` Suppose finite-stage projections p,q become equivalent in
M_k(A_∞), with v*v=p and vv*=q (enlarge k to accommodate stabilisation).
Choose a later-stage w sufficiently close to v and put x=qwp. Then
x*x is within 1 of p in pM_k(A_L)p, and xx* is within 1 of q in
qM_k(A_L)q. Both are invertible in their corners. Finite polar calculus
gives s=x(x*x)^(-1/2) with s*s=p, ss*=q, at this finite stage.
The zero-projection case is immediate. Thus equivalence is witnessed
at a finite stage; no relation is created only at completion.

`<2>4.` `<2>1`–`<2>3` prove V(A_∞)=lim V(A_L). Taking formal differences
commutes with this limit: any equality of differences is witnessed by
adding one monoid element, which also comes from a finite stage, and then
applying `<2>3`. The positive cone is the image of V and the unit is
represented by m_L at every level. This proves (1).

`<1>5.` QED BY `<1>1`–`<1>4`. The group in (1) is a dimension group
in the usual ordered-group sense as well: it is directed; if ng≥0 for
an integer n>0, positivity is witnessed at a finite stage and n v≥0
there implies v≥0; and four inequalities a_i≤b_j can be witnessed at
one stage, where the coordinatewise maximum of the two lower vectors
interpolates. Passing this vector to the limit proves interpolation.

**F6-A' [proven correction / negative to the unqualified formula;
any; L0; R0^u].** Define the full stationary ordered group

\[
 G_N=\varinjlim(\mathbb Z^I,\mathbb Z_+^I;N),\qquad u=[e_1,0].
\]

**PROVE** the exact replacement for the stationary assertion is

\[
 K_0(A_\infty)\cong I_u:=\{g\in G_N:\ -nu\le g\le nu
                              \text{ for some }n\in\mathbb N\},
 \quad [1]\longmapsto u.                                \tag{2}
\]

`<1>1.` Extending supported vectors by zero embeds the direct system
in (1) into the full stationary one: N sends S_L-supported vectors
to S_(L+1)-supported vectors. An element vanishes in either limit
exactly when its image vanishes at a later finite stage. This proves
injectivity of the induced group map and also preservation/reflection
of positivity. BY the equivalence relation defining an algebraic limit.

`<1>2.` Every vector v supported on S_L satisfies
−n m_L≤v≤n m_L for sufficiently large n, since m_L[x]>0 on S_L.
Thus its image lies in I_u. Conversely let −nu≤[v,L]≤nu.
Represent both inequalities at a common later stage K. They become
−n m_K≤N^(K−L)v≤n m_K, forcing zero coordinates outside S_K.
Hence [v,L] is in the image of (1). BY coordinatewise order at that stage.
This proves (2), including the inherited cone and unit.

`<1>3.` If m_K is strictly positive on all I at some level K and
remains so thereafter, the supported and full systems have a common
tail, so I_u=G_N. A sufficient condition is **N primitive**: N^p>0
implies N^L e_1>0 for L≥p. Indeed a primitive matrix has no zero rows,
which preserves strict positivity under multiplication.

`<1>4.` The pointed setting of CA-77 also has full support eventually.
Here is an explicit justification, including why dual closure is harmless.
Let S be the simples occurring in any nonnegative power of O. It contains
1 and is closed under tensor products and summands. BY distributing products
of powers.
For x∈S, left multiplication by x on the whole fusion ring has both the
positive left and right dimension eigenvector d: the left identity is
multiplicativity, and the right follows from
N_{x y}^z=N_{x* z}^y and d_(x*)=d_x (Penneys:487; the latter follows
also because x↦d_(x*) is a positive character, unique by ENO:1482–1487).
Make its edge matrix column-stochastic by
P[z,y]=N_{x y}^z d_z/(d_x d_y); π_y=d_y²/Σ_z d_z² is strictly positive
and stationary. No edge exits S, by closure under x. Stationarity summed
over S then forces no edge to enter S either. The edge x*→1 exists, so
x*∈S. Hence S is dual-closed and equals Irr(D). If 1 is a summand of O, the S_L
increase. Each simple in this finite set occurs at some level; taking
the maximum gives eventual full support. This uses only finite sums,
not a Markov convergence theorem. In fact N is then primitive: if O^K
contains every simple, for each x,y choose a simple z⊂x*⊗y.
Reciprocity gives N_{x z}^y>0, hence (N^K)[y,x]>0.

`<1>5.` For a general non-pointed O the assertion with the full G_N
is false. In a pointed category, if O is an invertible generator of a
cyclic group of order q>1, A_L=C and i_L=id for all L. The rooted group
is Z with unit 1. N is the cyclic permutation matrix; its full limit is
Z^q with the coordinate cone, and u selects only one coordinate under
the identifications N^(-L). Thus u is not an order unit of G_N.
BY one-dimensional Hom spaces and the explicit inverse permutation.
This is a general family, with a concrete instance in the closing table.

`<1>6.` QED. An unqualified stationary formula needs an order-unit/full-
support qualification; tensor-generation of D alone does not supply it.

## 2. The trace and the primitive case

**F6-T [proven; any; L0; R0^u plus a compatible tracial state].**
**ASSUME** F6-A and the canonical positive spherical dimensions d_x,
λ=d_O>0. **PROVE**

\[
 \tau_L(a)=\lambda^{-L}\sum_{x\in S_L}d_x\operatorname{Tr}(a_x)
                                                               \tag{3}
\]

defines a compatible tracial state on A_∞. If N is primitive this trace
is unique. In particular uniqueness holds in the pointed CA-77 setting.
The value on a minimal projection of the x block is d_x/λ^L; the
weight of that block's **identity** is m_L[x]d_x/λ^L.

`<1>1.` d^T N=λd^T and d^T m_L=λ^L. BY the dimension-character
theorem (ENO:1459–1487), m_L=N^L e_1, and d_1=1. Therefore (3) is
positive, tracial, has value 1 at the identity, and
τ_(L+1)i_L=τ_L by the multiplicity formula of F6-A. Its norm is 1,
so it extends uniquely and positively from the union to the completion.
This is the trace of CA-77:55–56, now expressed in block coordinates.

`<1>2.` A trace on the limit restricts to weights w_L[x]≥0 on minimal
projections, with m_L^T w_L=1 and w_L=N^T w_(L+1) once all supports
are full. BY a matrix trace being constant on equivalent rank-one
projections, and the incidence formula. Assume N^p>0 from now on.

`<1>3.` The vectors r_L[x]=λ^L w_L[x]/d_x are uniformly bounded
for L≥p. Indeed, for L≥0,

\[
 \frac{m_{L+p}[y]}{\lambda^{L+p}}
 =\sum_x\frac{(N^p)[y,x]}{\lambda^p d_x}
           \frac{d_x m_L[x]}{\lambda^L}
 \ge c_y:=\min_x\frac{(N^p)[y,x]}{\lambda^p d_x}>0.
\]

The coefficients d_x m_L[x]/λ^L sum to 1 by `<1>1`.
Normalization and nonnegativity give w_L[y]≤1/m_L[y], hence
0≤r_L[y]≤1/(c_y d_y) for L≥p.

`<1>4.` Let P[x,y]=N[y,x]d_y/(λd_x). Then P is row-stochastic,
P^p>0, and r_L=P r_(L+1). BY `<1>1`–`<1>2`. Put s=|I| and
δ=min_(x,y)(P^p)[x,y]>0. If sδ<1, write
P^p=δJ_s+(1−sδ)Q with Q row-stochastic. For any real vector v,
osc(Qv)≤osc(v), where osc(v)=max v−min v; J_s v is constant.
Thus osc(P^p v)≤(1−sδ)osc(v). If sδ=1 the oscillation is zero
directly. Iterating and using `<1>3` gives osc(r_L)=0 for each L≥p.

`<1>5.` Consequently r_L is constant, and m_L^T w_L=1 together with
`<1>1` makes that constant exactly 1. Thus w_L[x]=d_x/λ^L.
Earlier restrictions are fixed by compatibility. QED BY `<1>1`–`<1>4`.
No Perron spectral-gap or convergence theorem is being quoted: the
oscillation estimate proves exactly the uniqueness used here.

**Boundary.** This compatible AF trace is not a conformal-vacuum selection
theorem. On the trailing inductive system it supplies a zero-drift state
family, but R1 in the intended scaling geometry still requires that geometry
and its state contract. On a fixed CA-90 dyadic system the same traces are
also compatible: (3) is a normalized spherical trace, invariant under B_L,
and its restriction along a↦a⊗1_(W_L) is τ_L by L-fold compatibility.
This supplies a tracial zero-drift R1 instance there, without R2–R4 content.
The trace may remain identical for inequivalent categorical inputs (§4).

## 3. What classifies the unmarked AF algebra

**Source audit.** Searching `references/` and `literature/md/` for
“Bratteli”, “AF algebra”, “dimension group”, “Elliott”, and “Perron” located
fusion-graph and Perron material, OAR inductive limits, and AF mentions
(`literature/md/2306.16063/2306.16063.md:49`,
`literature/md/2102.04562/2102.04562.md:184–192,391`). It did **not** locate
a statement/proof of AF classification or ordered K_0 continuity. Elliott
name hits were bibliographic or Elliott Lieb. No external classification
theorem is invoked below: the needed **sequential unital AF case** is proved
from finite matrices and the continuity argument in F6-A. A local source
for historical attribution remains absent; no network was used.

**F6-B0 [proven; any; category-free finite lemma; used at L0/R0].**
**ASSUME** B=⊕_(i=1)^r M_(b_i), C=⊕_(j=1)^s M_(c_j), all sizes positive.
**PROVE:** unital *-homomorphisms B→C up to target-unitary conjugacy are
exactly matrices T∈M_(s×r)(Z_+) with Tb=c. Their K_0 map is T.

`<1>1.` In the jth target block the source central projections split
C^(c_j) orthogonally. Inside the i-part, source matrix units e_(kl)
give mutually orthogonal ranges of e_(kk), all with equal dimension
T[j,i], since e_(kl) is an isometry between those ranges. Their sum
has dimension b_i T[j,i]. Choosing a basis in the first range and
transporting it with e_(k1) identifies this representation with
a_i↦a_i⊗1_(T[j,i]). BY the matrix-unit identities.

`<1>2.` Summing dimensions gives Tb=c. Conversely these tensor blocks
construct a unital representation for any such T. The same construction
of bases intertwines any two representations with that T by a unitary in
each target block. Minimal projection ranks give the K_0 map T, as in
F6-A `<1>3`. QED.

**F6-B1 [proven; any; L0; R0^u].**
**ASSUME** two pairs have a based fusion-ring isomorphism carrying unit
to unit and [O] to [O']. **PROVE:** their entire **stage-filtered trailing
towers** are isomorphic (not necessarily their interval-local markings).

`<1>1.` The isomorphism identifies m_L, S_L and all incidence matrices
N|_(S_(L+1)×S_L). BY multiplication in the based ring and m_0=e_1.

`<1>2.` Choose the unit identification at stage 0. Inductively, if φ_L
preserves the prescribed block labels, any block isomorphism
ρ:A_(L+1)→A'_(L+1) matching those same labels makes
ρi_L and i'_Lφ_L have the same multiplicities. F6-B0 supplies a target
unitary u with Ad_u ρi_L=i'_Lφ_L. Set φ_(L+1)=Ad_u ρ.

`<1>3.` These φ_L define an isometric isomorphism on the algebraic
union, and hence on its norm completion, carrying each stage onto its
counterpart. QED. Neither F, braiding, nor pivotal choices enter the
multiplicity data. The isomorphism is noncanonical and need not preserve
concatenation, marked junctions, local interval embeddings, or dyadic maps.
Positive spherical dimensions themselves are already determined by the
based ring (ENO:1482–1487,1700–1706); the claim does not posit multiple
canonical positive spherical structures on one unitary fusion category.

**F6-B2 [proven; any; category-free; applied at L0/R0].**
**ASSUME** A=lim A_n and B=lim B_m are sequential unital AF algebras
with injective connecting maps. **PROVE**

\[
 A\cong_* B\quad\Longleftrightarrow\quad
 (K_0(A),K_0(A)^+,[1_A])\cong
 (K_0(B),K_0(B)^+,[1_B]).                                \tag{4}
\]

`<1>1.` A *-isomorphism sends projections, equivalences, direct sums,
and identity to the corresponding data, so induces the right side.
BY the definition of K_0. It is automatically unital, since its image
of 1 acts as the identity on every element of the surjective image.

`<1>2.` **Finite-stage positive lifting.** Let κ:K_0(A_n)→K_0(B)
be a positive homomorphism taking the stage unit b to [1_B]. Each
κ(e_i) has a nonnegative integer representative at some B_m by F6-A.
Move the finitely many representatives to a common stage. Their columns
form a nonnegative matrix T. The equality κ(b)=[1_B] says Tb−c_m
vanishes at a later stage, by the direct-limit equality relation.
Moving there gives Tb=c exactly. F6-B0 realises T by a unital
*-homomorphism A_n→B_m. This proves lifting, including the unit;
κ need not be injective on this finite-stage group.

`<1>3.` **Finite-stage equality.** If two integer group maps out of
K_0(A_n) have the same maps into K_0(B), their columns become equal
at one sufficiently late stage, since there are finitely many columns.
If realised by unital *-maps there, those maps are target-unitarily
conjugate by F6-B0. BY the direct-limit equality relation and F6-B0.

`<1>4.` Let g be an order-unit isomorphism of the groups in (4).
Construct a zigzag of cofinal stages and unital *-maps

\[
 A_{n_1}\xrightarrow{\phi_1}B_{m_1}
 \xrightarrow{\psi_1}A_{n_2}
 \xrightarrow{\phi_2}B_{m_2}
 \xrightarrow{\psi_2}\cdots
\]

whose group maps represent g and g^(-1), and for which
ψ_kφ_k is the A connecting map and φ_(k+1)ψ_k is the B connecting map.

`<2>1.` Compose the stage-to-limit map with g and lift by `<1>2` to
obtain φ_1. Compose the B-stage-to-limit map with g^(-1) and lift to
ψ_1 at an A stage beyond n_1. (Stage K_0 maps need not be injective.)
The group map of ψ_1φ_1 equals that of the A inclusion in the limit.
By `<1>3`, pass to a later A stage and conjugate ψ_1 by a target unitary
so ψ_1φ_1 equals the inclusion **as an algebra map**.

`<2>2.` Lift g from this new A stage to a B stage beyond m_1,
then use `<1>3` and target conjugacy to impose φ_2ψ_1 equal to the
B inclusion. Repeat these two operations. At each choice also require
the stage index to exceed the previous one, so both subsequences are
cofinal. Target inner conjugacy changes no K_0 map: a projection and
its unitary conjugate are equivalent by the partial isometry up.

`<2>3.` These adjustments do not change any earlier triangle. Two
successive triangles imply
φ_(k+1) i_(n_k,n_(k+1))=i'_(m_k,m_(k+1))φ_k, and similarly for ψ.
Each φ_k and ψ_k is injective, since its composition in a completed
triangle is an injective connecting map. Hence it is isometric by the
finite-block norm description.

`<1>5.` The compatible φ_k and ψ_k extend by norm continuity to
mutually inverse *-homomorphisms A↔B; their compositions are the
identity on the dense cofinal unions, by the triangles. QED BY
`<1>1`–`<1>4`. This is a complete proof of (4) for the algebras in
question, not a conditional appeal to an unavailable classification source.

**Consequence.** Combining (1)/(2) and (4) proves F6(b)'s isomorphism
criterion after correcting the group. It is a condition **computed from**
the based fusion rings and chosen object classes. It is not an equivalence
between isomorphism of AF algebras and isomorphism of fusion rings.

## 4. Explicit information loss, with general counterexample families

**F6-N1 [proven / negative to F6(d)'s “exactly”; any; L0; R0^u].**
**ASSUME** G is any finite group of order q, ω is any normalized
unitary 3-cocycle, C=Hilb_fd(G,ω), and O=⊕_(g∈G)g.
These categories are the graded construction of Penneys:277–288,321
and `references/text/EtingofNikshychOstrikFusionCategories.md:39–51`;
the associator acts by the declared unitary ω. **PROVE**

\[
 N=J_q,\quad m_L=q^{L-1}{\bf1}\ (L\ge1),\quad
 (K_0,K_0^+,[1])=(\mathbb Z[1/q],\mathbb Z[1/q]_{\ge0},1),
 \quad A_\infty\cong\varinjlim(M_{q^L},b\mapsto b\otimes1_q).
                                                               \tag{5}
\]

For q=1 read Z[1/q]=Z and the limit as C.

`<1>1.` For each x,y exactly one summand g=x^(-1)y of O makes
xg=y, and that Hom space is one-dimensional. Thus N[y,x]=1.
Induction on L gives m_L, and d_g=1, d_O=q: g has an inverse and
positive dimensions are multiplicative, or equivalently the constant
dimension vector is the unique positive character. BY the graded
tensor product and ENO:1482–1487.

`<1>2.` The map [v,L]↦q^(-L)Σ_x v_x, L≥1, is well-defined because
Σ J_qv=qΣv. It is onto Z[1/q]. If Σv=0, J_qv=0, so its kernel is
zero in the limit. If Σv>0, J_qv has all coordinates positive; this
proves order reflection, as well as preservation. The unit m_L has
sum q^L, hence maps to 1. BY the displayed computations.

`<1>3.` An explicit algebra interleaving also proves (5), independently
of F6-B2. Use the canonical model
B_L=⊕_(g∈G)M_(q^(L−1)), whose connecting map sends (a_g)_g to
q copies of diag(a_g). F6-B1/B0 identify the original tower with this
model. Put C_L=M_(q^L), let f_L:B_L→C_L be block-diagonal inclusion,
and g_L:C_L→B_(L+1) send b to (b,…,b). Then g_L f_L is the B
inclusion, while f_(L+1)g_L is b↦diag(b,…,b), the C inclusion.
The two exact triangles give mutually inverse limit maps, as in
F6-B2 `<1>5`. A tensor-factor permutation conjugates diag(b,…,b)
to b⊗1_q if that convention is desired.

`<1>4.` The same C limit is the tower for the category Vec and site
O'=1^(⊕q), whose matrix at each step is the 1×1 matrix (q).
For q>1 its fusion ring has rank 1, whereas C's has rank q.
Both matrices are primitive, both sites are pointed, and both generate
their category. Therefore even **primitivity, pointedness and tensor
generation together do not make the AF invariant recover the fusion ring**.
For equal-order nonisomorphic groups, even N itself can agree while
the based fusion rings disagree. Specific instances are in the table.

`<1>5.` Nor is [O] recovered even after the category is fixed.
For any integer q≥2 and k≥2, the Vec towers for q·1 and q^k·1
have isomorphic limits: the latter is the cofinal subsequence of the
former at lengths divisible by k. Their site classes differ in Z.
BY the definition of the two matrix towers. QED.

**F6-N2 [proven existence of inequivalent F; any; L0; R0^u].**
**ASSUME** the family of F6-N1, and two cocycles not related by a group
automorphism and a 2-cochain coboundary. **PROVE:** the two categories
are monoidally inequivalent, but the pointed inputs have isomorphic
unmarked stage-filtered trailing towers with matching trace states.
Example E-F below proves this hypothesis is realised explicitly.

`<1>1.` A tensor equivalence between two graded categories permutes
their invertible simples by a group isomorphism σ: it preserves the
unit and products. On simple pairs its tensorator is a scalar
β(a,b)≠0. With e the group identity, unital coherence permits normalization
to β(e,a)=β(a,e)=1. BY the monoidal functor/unit
diagrams in Penneys:325–338: the unit constraint makes these two
values the same fixed scalar, removed by rescaling the unit/tensorator.
Associativity coherence requires the two 3-cocycles, after σ, to
differ by

\[
 (\partial\beta)(a,b,c)
 =\frac{\beta(b,c)\beta(a,bc)}{\beta(ab,c)\beta(a,b)}.       \tag{6}
\]

The reciprocal convention gives the same obstruction below.

`<1>2.` The assumed failure of (6) for every σ rules out an equivalence
by `<1>1`. This proves **non-equivalence**, which is enough for F6(b);
no Morita-inequivalence claim is needed or made.

`<1>3.` F6-B1 and (5) identify their trailing towers for the
regular site, with the same trace (3). Trace preservation follows already
from the matched block weights; uniqueness in F6-T gives it again.
QED. The concrete witness in E-F falsifies general associator recovery;
no specific category is used in F6-A/T/B or C1–C3's positive proofs.

## 5. The refinement record: three different questions

The symbol alpha_L in the question is a map A_L→A_(2L), not an
endomorphism of A_L. Three records must be distinguished: (i) its abstract
dyadic directed system; (ii) the **simultaneous** trailing AF algebra,
identified stages/interval algebras, and a descended dilation; (iii) the
fully marked pointed tensor record of CA-77 Proposition 77.2. Claims
about (i) cannot be transferred to (ii) or (iii) by forgetting this distinction.

**F6-C1 [proven; any, open geometry; L0+H; R0^u].**
**ASSUME** the same pointed relative half-braiding H and the CA-90
uniform shuffle formula at every length. **PROVE** alpha descends to
one unital injective AF endomorphism δ, with δ_*=id on ordered K_0:

\[
 \alpha_{L+1}(a\otimes1_O)=\alpha_L(a)\otimes1_O\otimes1_O,
 \qquad\delta\kappa_L=\kappa_{2L}\alpha_L .                \tag{7}
\]

Here κ_L:A_L→A_∞ is the trailing embedding. Its powers give a discrete
semigroup; no continuous one-parameter flow is asserted.

`<1>1.` Let S_L:O⊗W_L→W_L⊗O move the last old strand across the
first L new strands using the chosen t_O. The shuffle factors as

\[
 B_{L+1}=(B_L\otimes1_O\otimes1_O)
          (1_{W_L}\otimes S_L\otimes1_O).                 \tag{8}
\]

BY the old/new crossing description of CA-90 Theorem 90.1 and its
commutation-only shuffle argument, Proposition 90.3. The second factor
first performs all crossings involving old_(L+1), in their required order.
For every other strand its relative crossing order is unchanged; all
other interchanges are between disjoint coupons. Tensor interchange and
coherence (Penneys:319,394–398) give (8), without an extra braid relation.

`<1>2.` The right factor of (8) acts after the first L tensor factors
and hence commutes with a⊗1_(W_(L+2)). Conjugating proves (7).
Thus δ is well-defined on the algebraic trailing union, multiplicative,
unital and norm-preserving by CA-90 Theorem 90.1(i); it extends injectively
to the completion. BY density and continuity.

`<1>3.` At stage L, alpha_L differs from the L-fold trailing inclusion
by the inner conjugation Ad_(B_L). Inner conjugation fixes stable
projection classes, so δ_*[v,L]=[N^L v,2L]=[v,L]. BY F6-A and
the direct-limit relation. Also τδ=τ for the canonical trace, by the
calculation after F6-T. QED.

**F6-C2 [proven loss of data; any; L0+H; R0^u].**
**ASSUME** only the abstract directed diagram with L_n=2^nL_0 and
connecting maps alpha_(L_n), forgetting the simultaneous trailing and
interval-local markings. **PROVE:** this diagram is isomorphic to the
trailing cofinal diagram; in particular it alone cannot recover H or F.

`<1>1.` Write j_n(a)=a⊗1_(W_(L_n)), so alpha_n=Ad_(B_(L_n))j_n.
Set U_0=1 and U_(n+1)=j_n(U_n) B_(L_n)^†. Then

\[
 \operatorname{Ad}_{U_{n+1}}\alpha_n
       =j_n\operatorname{Ad}_{U_n}.                       \tag{9}
\]

BY multiplication of the three unitaries. This gives an exact
stage-preserving diagram isomorphism and hence an AF isomorphism.
It may move every additional interval/junction mark; it is not claimed
to intertwine the **simultaneous** trailing inclusions as well.

`<1>2.` For the same based ring and [O], F6-B1 compares the resulting
trailing diagrams, so the abstract dyadic diagrams also agree whenever
the chosen H exists. This is independence from F as an abstract diagram,
not a theorem that every category with that ring admits H.

`<1>3.` H itself is not recovered: Example E-H verifies two inequivalent
pointed half-braidings on the same input. Equation (9) identifies their
abstract diagrams. Example E-F also supplies H on both inequivalent
associator inputs, so `<1>2` gives an actual F-forgetting pair, not just
a conditional comparison of possibly nonexistent lifts. QED.

**F6-C3 [proven recovery with specified marks; any; L0+H; R0^u].**
**ASSUME** the pointed categorical record and the following named
vacuum placements, their adjoints and their boundary compressions, in
addition to **alpha_2 from CA-90's fixed-H formula**. These are part of
CA-77 Proposition 77.2's richer
record, not of an unmarked AF algebra. **PROVE:** t_O, and hence H on
D, can be recovered exactly. Define typed maps

\[
 r=\eta\otimes1_O,\quad l=1_O\otimes\eta:O\to W_2,
 \quad h=rl^\dagger\in A_2,
\]
\[
 i=1_O\otimes1_O\otimes\eta\otimes\eta:W_2\to W_4,
 \quad j=\eta\otimes1_O\otimes1_O\otimes\eta:W_2\to W_4.
\]

Then the reconstruction is

\[
                       t_O=j^\dagger\alpha_2(h)i.         \tag{10}
\]

`<1>1.` H-naturality for η:1→O gives
t_O(η⊗1_O)=1_O⊗η. Put B=1_O⊗t_O⊗1_O, as in CA-90.
Then B^†i=1_O⊗η⊗1_O⊗η. BY unitarity and tensor interchange.

`<1>2.` h(1_O⊗η)=η⊗1_O by η^†η=1. Consequently
(h⊗1_O⊗1_O)B^†i=j, while Bj=jt_O. Hence
j^†B(h⊗1⊗1)B^†i=t_O, since j^†j=1. BY these displayed
compositions, all typed W_2→W_4 or W_2→W_2. This proves (10).

`<1>3.` The tensor identity H determines t_(W_n) from t_O. If
v:Y→W_n is an isometry, naturality determines

\[
             t_Y=(1_O\otimes v^\dagger)t_{W_n}(v\otimes1_O).
\]

Every simple of D is a summand of some power by F6-A' `<1>4`;
finite direct sums extend the formula to every object of D. Naturality
makes it independent of the chosen splitting. QED. An equivalence
transporting the named placements and tensor structure transports this
recovered H; changing unitary coordinates gives precisely the transported
half-braiding, not new scalar invariants of an unmarked matrix presentation.

**What remains undetermined.** Whether the intermediate record (ii),
retaining only the simultaneous interval filtration and δ but not the
named h,i,j/compression identifications, recovers H up to gauge or the
associator is **open here**. Formula (9) does not prove its data loss;
formula (10) does not prove its recovery. A precise equivalence notion
must specify which interval inclusions, point projections and corner
identifications are preserved. There is no claimed classification of
AF endomorphisms by their K_0 action; C1 only proves that this invariant
cannot distinguish the choices.

**Further qualification [negative; any; L0+length-dependent H; R0].**
Finite CA-90 locality/intertwining axioms and a dyadic directed system
alone do not imply (7). The explicitly calculated mixed-H instance E-H
below has all those finite properties and fails the square with coefficients
+1 and −1. Thus C1 assumes **one fixed H at every length**. This does not
refute CA-90's actual fixed-H construction or solve its converse problem.

## 6. The corrected R0 row of the fidelity ladder

**F6-D [proven obstruction and conditional implication; tags below].**
**ASSUME** the appropriate record and extra hypotheses in each clause.
**PROVE** the following precise ladder statements.

`<1>1.` At (any; L0; R0^u), the **unmarked trailing norm-limit** is
classified exactly by the rooted scaled ordered group (1)/(2), by F6-B2.
This is a quotient invariant of (K_fus(D),[O]), generally strictly weaker
than that pair by F6-N1. F6-N2 shows it forgets monoidal equivalence class
even if the ring and [O] are held fixed. Braiding was never an input to
this construction. Additional pivotal/ribbon marks are not part of its
output. These statements describe the selected forgetful construction,
not every possible object on the CA-88 R0 row.

`<1>2.` No assignment depending only on this AF isomorphism class
(even with its canonical trace or its trailing stage filtration) can
recover the input category up to tensor equivalence for every pair.
Otherwise apply it to the two inequivalent inputs of F6-N2: their
isomorphic output records would have to decode to two different tensor
equivalence classes. This contradicts dependence only on the output
record. BY F6-B1, F6-N2 and elementary composition of maps on isomorphism
classes. This rules out a universal faithful reconstruction factoring
through that forgetful record. It does not rule out choosing extra
states, Hamiltonians, junctions or sector marks using the original C.

`<1>3.` “F and R first enter at R1” is false as a universal ladder
claim. CA-77 Proposition 77.2 already reconstructs the generated tensor
category from the **fully marked** R0 record with concatenation,
placements and partial isometries; its assumptions are not AF invariants.
CA-90's finite equations (90.5) already involve associators, and F6-C3
recovers the relative crossing from a marked finite map. Conversely,
adding the compatible trace alone does not recover F, by F6-N2.
Thus neither “first enter” nor “state necessarily restores” follows.

`<1>4.` For a **declared completely rational chiral limit net** on
the same system, assume a fully faithful unitary tensor functor
Φ:C→DHR_fin(A), and assume CA-93 Lemma 93.2's represented inclusions,
bounded exhaustions of both algebras, common normal auxiliary state
faithful on the smaller algebra and preserved by all expectations, and
liminf of expectation costs at most Dim(C). Then CA-93 Theorem 93.8
gives μ_A=Dim(C) and tensor equivalence onto all finite sectors.
At L1, if Φ is braided it gives braided equivalence (and modularity).
BY that theorem, without re-proving it. Tags: chiral; L0+L4 or L1+L4;
**R4 conditional on R3 and these certificates**. Full-setting versions
refer to an identified chiral subnet or the precise doubled net of
CA-93 Corollary 93.9, not the diagonal extension's DHR category.

`<1>5.` This is not supplied by a trace on an AF algebra. CA-93's ψ
is an **auxiliary normal state on the specified von Neumann inclusion**,
not a statement that F is encoded by a physical vacuum; its normality,
exhaustion and expectation hypotheses are additional. BY CA-93:56–64,
81–114 and CA-80 Lemma 80.10. R2/R3 need their independent analytic
certificates; L3 supplies conformal enrichment; R5 coherence of CFT
synthesis remains untouched. QED BY `<1>1`–`<1>4` and CA-88.

## Results ledger

- F6-A — **proven:** AF existence, rooted incidence, supported ordered K_0 formula (1).
- F6-A' — **proven:** order-ideal formula (2); **negative:** unqualified full stationary formula for arbitrary O.
- F6-T — **proven:** compatible dimension trace (3), block normalization, primitive uniqueness by contraction.
- F6-B0/B1 — **proven:** finite-map multiplicity classification and same-ring isomorphism of trailing towers.
- F6-B2 — **proven:** scaled ordered K_0 classification (4), by a finite-stage intertwining proof.
- F6-N1 — **negative:** AF recovery of the fusion ring or [O], even with primitive pointed tensor-generating input; (5) is proven.
- F6-N2 — **proven:** explicit inequivalent associators give identical trailing towers and canonical trace states.
- F6-C1 — **proven:** the fixed-H shuffle descends to one AF endomorphism; its ordered K_0 action is the identity.
- F6-C2 — **proven:** the abstract dyadic diagram forgets H and, when the datum exists, does not add F to the rooted incidence invariant.
- F6-C3 — **proven:** marked alpha_2 and named vacuum-placement compressions recover t_O and H exactly by (10).
- Intermediate simultaneous interval-filtered (A_∞,δ) reconstruction — **conjectural/open:** neither recovery nor forgetting of F/H proved for that weaker marking.
- Automatic descent from lengthwise finite axioms — **negative:** mixed half-braiding choices violate (7).
- F6-D — **proven:** unmarked-R0 decoding obstruction; **conditional:** R4 only under the separately stated CA-93 hypotheses.

## Layer tags

Setting: **any**, microscopic geometry an ordered open chain.
Data layer: **L0**, with declared nonzero O; F6-C adds the pointed object and
relative half-braiding H of CA-90 (L1 suffices).
Rung reached: none yet in this initial ledger.
Rung claimed: **R0^u** for the trailing tower and its information loss;
an obstruction relevant to **R4**, not R4 attainment. No R2, R3, or R5 claim.

## What this gives the integration

Pending proof: a precise description of the information discarded by the
unmarked R0 limit, complementing CA-80 Proposition 80.8. The CA-88 R1–R5
existence/fidelity cells are not to be promoted from an AF calculation.

## Open problems

Complete the proof obligations above; separate missing literature from
statements that can be derived here from finite-dimensional algebra.

## Examples table

Pending; models will appear only as instances of general results or checks.

## Sources used

- `references/text/PenneysUnitaryFusionCategories.md:219–237,277–288,319–338,394–398,474–487`:
  orthogonal splitting, graded categories, monoidal structure, fusion graph.
- `references/text/EtingofNikshychOstrikFusionCategories.txt:1459–1487,1700–1706`:
  positive dimension character and positive spherical structure.
- `report/sections/77_pointed_carrier_invariants.tex:53–91`: trailing tower,
  incidence, and distinction from a fully marked categorical reconstruction.
- `report/sections/90_local_unital_lift.tex:60–141`: H and the dyadic construction.
- `report/sections/88_layered_targets.tex:84–131`: data and target ladders.
