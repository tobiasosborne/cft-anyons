# H6 — Discrete holomorphicity as a categorical selection equation

Started 2026-10-27 13:10 UTC; initial all-open ledger written at 13:12 UTC.
Proofs and ledger updated incrementally; final verification recorded below.
This exploration serves **P3 on P2**, on the pointed, indefinite-number carrier of P1.
All conventions below are proposed **note-local** registrations: the brief prohibits
editing `CONVENTIONS.md`, worklog, report, or other files. No network or commits.

## Outcome and precise replacement

**H6 requires reformulation.** The literal endpoint sum lacks scalarization,
path-counting and spin/framing data; its unit-reduction and harmonicity claims
are false without repairs. The proved replacement is a finite categorical
endpoint compiler (B5–B8), a globally consistent charged-edge realization
(B9–B12), a finite phase-cohomology obstruction, and exact lattice Stokes.
It applies to arbitrary unitary fusion C with pointed O=1⊕X. Neither a critical
Hamiltonian nor a continuum rung is selected.

More precisely: given a centre object (Y,γ), an endpoint q:Y⊗O→O, specified
geometry and scalar edge phases, the local contour is the explicitly computed
matrix A^q w. Its vanishing is equivalent to a local Hom-space identity and
suffices for every boundary contraction of the charged-edge field. Necessity
requires separating exterior tests. The spin-zero identity-gate obstruction
B4 shows why even a nonzero finite kernel need not give a regular Hamiltonian
family. A separate exact scalar-loop calibration passes; equality with H6's
centre-strand observable remains unproved.

**Tags:** any local bulk patch, including patches in a periodic/full system or
an open system with declared module boundary; L0 + chosen Z(C) datum, O,
endpoint/closure, geometry, framing and real winding exponent; finite →R2/R3,
**no new rung reached**. A chosen centre object does not assert that C itself
is braided. L1 supplies centre choices via a specified braiding, but still
supplies neither an endpoint field nor a physical conformal-weight lift.
All primary-source aliases below are resolved to path:line in “Sources used”.

## Proposed convention block (before derivations)

Use complex-linear scalar contractions on fully typed boundary morphisms; otherwise
retain the observable as a vector in a specified finite Hom space. Write γ_A:
Y⊗A → A⊗Y, keeping the chosen left-associated fusion trees, dagger, and spherical
duals. Use exact tile weights w, never identify them with coefficients of h.
Faces will have positively oriented polygonal boundaries, edge displacement Δz_e,
and one common edge value F(e)=F(reverse e); the oriented 1-cochain is
ω(e)=Δz_e F(e). Winding will mean total signed turn of a framed oriented path,
with endpoint tangent directions and a real spin lift explicitly fixed.
The following statements specify the needed path, endpoint, phase and seam data
before each construction uses them.

## H6-A0. What fails in the literal statement

**Tags:** any; L0 + centre datum, pointed O; finite negative; no rung.
**ASSUME** H6(a)'s data, without unmentioned endpoint, path or framing rules.
**PROVE** those data do not define the asserted scalar observable or imply its
unit reduction; a scalar spin is not available for arbitrary centre objects.

<1>1. A patch with external labels free is a morphism, not a number.
BY CA-80:58–66. To add an open Y line one must specify its endpoint Hom spaces
and contractions, or keep the result in a declared boundary space.

<1>2. This ambiguity occurs for every C: choose the central object
Y = 1 ⊕ 1. An undecorated open Y strand is id_Y ∈ End_C(Y) = M₂(C).
Closing it by spherical trace gives 2; normalized trace gives 1; a chosen
matrix entry gives a third prescription. None is selected in H6(a).
BY orthogonal direct sums and End(1)=C, Penneys:118–129,219;
trace conventions Penneys:1010–1030. If termination into the vacuum is
required instead, the missing datum lies in Hom(1,Y), which may be zero.

<1>3. Fix a finite nonempty route set P_e, identity endpoint closures, Y=1_Z(C),
s=0, and sum independently over routes as well as over net histories. Then

    F_1(e) = Σ_Γ [∏_p w_{p,α_p}] Ev_C(Γ) · |P_e| = |P_e| Z_P.

BY the unit strand erasure and distributivity. For a patch admitting two routes
and Z_P≠0 the claimed equality F_1=Z_P fails. Identity gates with normalized
vacuum closure give Z_P=1 in every C, so the two-route value is explicitly 2.
If route counts depend on Γ, each history is reweighted by that count.
Unrestricted walks require a convergence prescription as well.

<1>4. If the centre has an object V with scalar twist t≠1, the object
1⊕V has twist id_1 ⊕ t id_V, and no scalar e^{2πis} equals that operator.
BY twist naturality with summand inclusions (FRS:1086–1096) and linearity.
Thus one must restrict to a scalar-twist sector, or replace the scalar spin
factor by an explicitly specified operator-valued rule. Even in a scalar
sector, s and s+k give the same twist but their phases differ by e^{-ikW};
for W=π/2 and k=1 that factor is −i. BY displayed computation.

<1>5. A framed path, its endpoint tangent directions, a real spin lift,
and its allowed deformation class are necessary to test phase invariance.
Moving in a noncontractible homotopy class is not a consequence of a local
half-braiding identity. BY the local nature of the hexagon and naturality
(Wolf:1170–1196); AFM-D:53–68 explicitly retains defect topology.

<1>6. QED. These are failures of H6 for its general class, not objections
peculiar to a model. The repairs used below are declarations, not hidden
consequences of C. A path forming part of a modified net ensemble is a
separate construction from the independent path sum of step 3.

## H6-A1. Repaired finite defect evaluation

**Additional note-local conventions (proposed registration).**
Fix a finite embedded patch, exact tiles and a finite list of decorated
histories. For each history choose one oriented defect route, or a specified
finite weighted route list with scalar route weights independent of w. Declare
endpoint tensors (possibly in a module category), all boundary contractions, and a linear closure ℓ to C. In the
unit sector the total route weight must be one and endpoints erase to the
ordinary boundary tensors if the unit reduction is wanted. Declare framed
endpoint tangents and a continuous real angle lift along each piecewise smooth
route; W is final minus initial lifted tangent angle, including rounded corner
turns. Positive turns are counterclockwise. Fix s∈R in a scalar-twist sector.
Throughout, “the unit defect” means the
**tensor unit of Z(C)**, with its trivial half-braiding (Wolf:1260), not merely
a central object whose underlying object is 1. The latter can have a nontrivial
half-braiding, and γ_1=id_Y alone would not erase it.
No sum over all unspecified curves, no quotient of physically distinct
routes, and no orientation identification is implicit.

Use γ_A:Y⊗A→A⊗Y, the **inverse** of Wolf's crossing at :1173; in coherent
notation (all associators restored by the fixed fusion-tree convention),

    γ_B (1_Y⊗f) = (f⊗1_Y) γ_A,       f:A→B,                    (A1)
    γ_{A⊗B} = (1_A⊗γ_B)(γ_A⊗1_B).                           (A2)

These are precisely naturality and the inverted half-braiding hexagon,
Wolf:1170–1196,1263–1269; Penneys:394–398 licenses coherent notation.
An allowed move is reassociation, a duality snake, inverse-crossing cancellation,
or a slide (A1)/(A2), preserving endpoints and W. This is the exact equivalence
relation asserted here. For more general framed moves, a positive ribbon twist
is **declared** to act by θ_Y; if the same move increases W by 2π, its combined
multiplier is θ_Y e^{-2πis}. Twist compensation holds iff this is 1. We do not
identify a ribbon twist with every planar path deformation.

**Tags:** any; L0 + (Y,γ), spherical duals and the foregoing microscopic data;
finite →R2/R3; no rung.
**ASSUME** these declarations and (A1)–(A2).
**PROVE** the finite scalar sum

    F(e)=Σ_(Γ,r) μ_Γ(r) [∏_p w_{p,α_p}]
                       e^{-isW(r)} ℓ(Ev_C(Γ with r and endpoints))          (A3)

is well defined modulo the allowed moves, is multilinear in independently
assigned tile weights, and obeys F_1(e)=Z_P with the stated unit normalization.

<1>1. Every decorated term is a finite, typed composition and tensor product
of morphisms, cups/caps, γ and γ^{-1}. It has a definite value in its declared
Hom space; ℓ gives a scalar. BY finite semisimplicity (Penneys:118–131),
coherence (:394–407) and declared endpoint types.

<1>2. Each generating move preserves evaluation: reassociation by coherence,
snakes by duality, inverse pairs by invertibility, and vertex slides by (A1),
with composite strands handled by (A2). BY those identities. Since W is
preserved, e^{-isW} is unchanged; concatenating finitely many moves proves
invariance. A twist-compensated move has multiplier 1 by its displayed test.

<1>3. The unit identity follows without a further assumption: (A2) at A=B=1
gives γ_1=γ_1²; invertibility implies γ_1=1_Y. With f=η:1→O in (A1),

    γ_O(1_Y⊗η)=η⊗1_Y.                                     (A4)

Hence vacancies are transparent. Applying (A1) to cups, caps and fusion
vertices also gives their sliding identities; number-changing tiles are included.
BY (A1)–(A2). This is the direct connection to the P1 carrier and P2 histories.

<1>4. The sum is finite, and each term contains exactly one scalar coefficient
from each ordinary tile. Thus it exists and is multilinear in those weights.
BY finite distributivity, also CA-78.2 for the undecorated exact expansion.
The same statement holds componentwise without ℓ.

<1>5. For Y=1_Z(C), s=0, the prescribed identity endpoints and trivial γ erase termwise;
Σ_r μ_Γ(r)=1 for every Γ gives F_1(e)=Z_P. BY step 3 and (A3).

<1>6. QED. This is well-defined **declared defect evaluation**, not an
existence or uniqueness theorem for a nonzero holomorphic endpoint field.

## H6-A2. Transport is not a selection equation

**Tags:** any; L0 + (Y,γ), O and arbitrary categorical tiles; finite negative.
**ASSUME** (A1)–(A2). **PROVE** central transport imposes no restriction on h or w.

<1>1. Put A=B=O⊗O and f=D_α in (A1). Then

    γ_{O⊗O}(1_Y⊗D_α) − (D_α⊗1_Y)γ_{O⊗O} = 0.             (A5)

<1>2. Multiply by arbitrary w_α and sum. The result holds for every T∈B₂,
including T=e^{th}, for every h∈B₂. BY linearity and CA-78.2.

<1>3. For the repaired unit observable, F_1(e)=Z_P. Any polygon has
Σ_e Δz_e=0, so its contour vanishes for every choice of weights. BY A1 step 5
and telescoping vertex coordinates. Its selection matrix is identically zero.

<1>4. QED. Neither a compulsory nonzero F/γ dependence nor weight selection
follows for arbitrary Y. This agrees with CA-78:192–205 and AFM-D:53–68,
165–188: topological defect transport exists independently of critical tuning.

## H6-B0. Averaged equations and local equations are different

**Tags:** any; L0 + A1's declarations; finite negative and finite identity.
**ASSUME** a patch with m tiles and A1's weight-independent finite route rule.
**PROVE** its contour is multiaffine in independently assigned tile weights,
but generally a polynomial of degree m in common homogeneous weights, not a
local linear system with category-only coefficients.

<1>1. Distribute the finite sum (A3). For each edge,

    F_P(e;w)=Σ_(α₁,…,α_m) C_e(α₁,…,α_m) ∏_(p=1)^m w_{p,α_p}.           (B0)

The C_e include all endpoint, path and closure data. BY A1 step 4.

<1>2. Taking a contour changes C_e to Σ_e Δz_e C_e and leaves the products.
After setting all w_p=w, those products have degree m. BY substitution.
Vanishing of one scalar contraction need not make the uncontracted local
tensor vanish. A functional ℓ with nonzero kernel cannot separate that tensor.

<1>3. This failure is available in every C with a nonzero occupied summand:
p₀⊗p₀ and p₁⊗p₁ are nonzero orthogonal projections in B₂. For
T=a(p₀⊗p₀)+b(p₁⊗p₁), two copies give T²=a²(p₀⊗p₀)+b²(p₁⊗p₁).
A fixed functional taking these projections to +1 and −1 gives a²−b².
Its zero set is the union a=b or a=−b and is not a linear subspace.
It can be realized as a contour allowed by A1: choose Y=1_Z(C)⊕1_Z(C),
s=0, endpoint coupons selecting one summand, and one route per edge. On one
chosen edge e₀ give its route weight 1/Δz_{e₀}; give other routes weight zero.
The contour is exactly a²−b². This deliberately unrestricted rule is permitted
by A1, which normalizes routes only in the separate unit-defect sector; it is
not proposed as a physical field. It proves why A1 alone cannot imply the
stronger local-linear equivalence.
BY orthogonality from the pointed splitting, CONVENTIONS (am).

<1>4. QED. The valid local linear assertion requires an **all-exteriors local
identity**, or a specified family of exterior tests, as in B1. Normalizing by
a nonzero Z does not improve this: clearing the denominator restores (B0).

## H6-B1. Explicit finite endpoint compiler

**New declarations, made before use.** Choose a geometric face with vertices
0,a,a+b,b, Im(conj(a)b)>0, and ports (left,bottom,top,right).
Its counterclockwise edge displacements are (−b,a,−a,b). It is an embedded
rhombus when |a|=|b|; the theorem also permits the rectangular brick drawing.
Incoming ports are left,bottom and outgoing ports top,right, as in (ak).
Choose a reference local defect entry, one extension to each endpoint, and
relative winding increments ω_L,ω_B,ω_T,ω_R. Define

    ζ_L=−b e^{-isω_L},  ζ_B=a e^{-isω_B},
    ζ_T=−a e^{-isω_T},  ζ_R=b e^{-isω_R}.                    (B1)

The increments must come from the chosen framed extension rule when a path
interpretation is asserted. They are not determined by the multiplication
algebra B₂. Fix that rule independently of the weights.

Here is one completely typed endpoint ansatz for arbitrary C. Set

    V=O⊗O,  U=Y⊗V,  B₂=End_C(V),
    Q=Hom_C(Y⊗O,O),  H_Y=Hom_C(U,V).

An endpoint is q∈Q. In coherent tensor notation put

    Q_L = q⊗1_O,
    Q_R = (1_O⊗q)(γ_O⊗1_O),                both U→V,         (B2)
    K_L(T)=T Q_L,          K_B(T)=T Q_R,
    K_T(T)=Q_L(1_Y⊗T),    K_R(T)=Q_R(1_Y⊗T).               (B3)

For example Q_L includes the associator U→(Y⊗O)⊗O; Q_R first uses this
associator, then γ_O⊗1, then rebrackets to O⊗(Y⊗O). The four K describe
absorption at the two incoming or the two outgoing legs. No map with a free
Y output is silently replaced by a number. Rigidity gives
Q≅Hom_C(Y,O⊗O^vee) (Penneys:427–430); thus Q can be zero. A larger puncture space or a module
boundary is another declaration, not automatically the same ansatz.

Choose bases D_α of B₂ and E_μ of H_Y, with

    G_{μν}=tr_U(E_μ† E_ν),
    σ^μ(E)=Σ_ν (G^{-1})_{μν} tr_U(E_ν† E).                  (B4)

If H_Y=0, the target matrix has zero rows and selects nothing. Otherwise G is
positive definite: on simple-charge blocks it is a sum of d_c-weighted matrix
Hilbert-Schmidt inner products, d_c>0 (Penneys:118–131,1010–1030; CA-78.1).
The explicit coefficient matrix is

    A^q_{μα}=σ^μ( ζ_L D_α Q_L + ζ_B D_α Q_R
                  +ζ_T Q_L(1_Y⊗D_α)+ζ_R Q_R(1_Y⊗D_α) ).    (B5)

For several q_j stack the matrices A^{q_j}. Taking a basis of Q gives the
resolved **all-endpoints** version without choosing a privileged q. It is
an ansatz to impose, not a theorem that a physical field obeys every such row.

To implement (B5), resolve all object words into simple charges and multiplicity
indices, insert the actual F matrices to reach the declared brackets, γ on the
crossed strand, q at the chosen vertex and the spherical cups if a leg is bent,
then contract. This is a finite algorithm in the supplied exact numerical or
symbolic category data. It needs the Hom-module actions, not just B₂'s abstract
multiplication table. Explicitly, for Q_i=Σ_ν q_i^ν E_ν set

    L_{αν}^μ=σ^μ(D_α E_ν),
    R_{αν}^μ=σ^μ(E_ν(1_Y⊗D_α));
    A^q_{μα}=Σ_ν[(ζ_L q_L^ν+ζ_B q_R^ν)L_{αν}^μ
                 +(ζ_T q_L^ν+ζ_R q_R^ν)R_{αν}^μ].           (B6)

B₂'s M constants from CA-78.1 compute its products; L and R encode its actions
on the extra Hom space. Endpoint tensors, geometric lengths/directions and
relative windings are further coefficients missing from H6(b)'s list (i)–(iii).

**The local-to-global hypothesis (LG).** For each face p away from sources and
for each exterior configuration ξ, the four endpoint configurations can be
restricted to a **common** exterior. Their amplitudes have the form

    F_P(e_i)=Σ_ξ a_ξ(w_out) e^{-isW_ξ} ℓ_ξ(K_i(T_p)) e^{-isω_i},           (B7)

with the same coefficients a_ξ and linear contractions ℓ_ξ for all four ports.
All path multiplicities must be included. Adjacent faces assign the same scalar
F_P(e) to their shared edge. These are nontrivial gluing/route requirements;
A1 alone does not prove them. A single local disk with a fixed exterior supplies
a finite test of (B7); a consistent all-patch endpoint ensemble is additional.

**Tags:** any local bulk face; L0 + centre datum, O, q (or Q), geometry and
endpoint extensions; finite →R2/R3, no rung. The global implication also assumes LG.
**ASSUME** (B1)–(B6). **PROVE** the local tensor contour is zero iff A^q w=0;
under LG this suffices for every scalar face contour. Its necessity holds when
the admitted exterior contractions separate H_Y and are tested individually.

<1>1. Each K_i in (B3) is linear B₂→H_Y, with Q_L,Q_R fixed by (B2):
composition and tensor product with a fixed morphism are linear. BY the
displayed typed formulas.

<1>2. For T=Σ_α w_αD_α define R_q(T)=Σ_i ζ_i K_i(T). Then

    R_q(T)=Σ_μ (A^q w)_μ E_μ.                              (B8)

BY step 1, (B4)–(B5). Basis independence implies R_q(T)=0 iff A^q w=0.
There are dim(B₂) columns and dim(H_Y) rows per q and face type. For finitely
many geometries or endpoint types, stacking remains finite. For an unrestricted
continuum of face angles it is a family of systems, not one finite matrix.

<1>3. Under LG, take the oriented contour of (B7): it is
Σ_ξ a_ξ e^{-isW_ξ} ℓ_ξ(R_q(T_p)). This is zero when (B8) vanishes.
BY finite distributivity. This is the rigorous linear sufficient condition.

<1>4. Conversely, if each admitted exterior ℓ has ℓ(R_q(T))=0, and those ℓ
span H_Y*, then every coordinate of R_q(T) vanishes. BY separation in a finite
vector space. For an arbitrary available exterior span E⊂H_Y*, the **exact**
necessary and sufficient local test is R_q(T)∈E^perp, equivalently BA^q w=0,
where B contains the coordinates of a spanning list of E. For one fixed
partition sum there is no such necessity without separation. BY linear algebra.

<1>5. All-endpoint stacking is equivalent to testing every q∈Q, since (B2)–(B5)
are linear in q. Formula (B6) follows by substituting Q_L,Q_R in their basis.
BY finite distributivity. No arbitrary-category kernel is asserted nonzero.

<1>6. QED. This proves a concrete endpoint-augmented finite compiler. It does
not prove that the data in the original H6 determine an endpoint prescription,
that LG holds for it, or that the physical intersection of ker A is nonempty.

## H6-B2. What data enter, and what can be selected

**Tags:** any; L0 + centre datum and B1's declarations; finite, no rung.
**ASSUME** B1. **PROVE** the following precise dependence and selection statements.

<1>1. B5 uses the F-dependent tensor placements, the half-braiding in Q_R,
the endpoint q, and the spin/geometry factors ζ. BY inspection of the fully
typed formulas. This is dependence of the compiler on those data, not a theorem
that every entry or every kernel changes when any datum changes. A2's unit
sector is an explicit zero-matrix exception in every C (q=id_O, s=0, trivial γ).
A transparent restriction of γ or a zero q can likewise erase dependence.

<1>2. An abstract B₂ multiplication table cannot specify q, H_Y, or its right
action through 1_Y⊗D. In a matrix-unit basis B₂ is just ⊕_c M_{m_c}(C),
whose multiplication is δ_{jk}E_{il}; the associator appears in tensor
placements and module actions instead. BY CA-78.1 and (B2),(B6).
Therefore H6(b)'s proposed coefficient list is insufficient without endpoint
and geometric data; no theorem recovering F from the resulting kernel follows.

<1>3. Under an invertible tile-basis change D'=D S and a target-basis change
E'=E R, the matrix becomes A'=R^{-1}AS, with w'=S^{-1}w. A unitary tensor
equivalence transports γ, q and duals and gives the same relation after these
identifications. BY (B8), functoriality of composition/tensoring, and coherent
transport of the declared brackets. Thus associator **gauge** is not a physical
selection parameter. Inequivalent associators may enter the construction, but
universal sensitivity to them is not proved and is false in the unit sector.

<1>4. If centre data and endpoint tests are a direct sum, retaining each
summand separately stacks the matrices; the solution space is the intersection
of their kernels. A chosen scalar combination may instead cancel between
summands and has a larger kernel. BY linearity and projection to summands.
Changing Y also changes H_Y and Q, which can vanish; no universal nonzero
observable or useful kernel follows from the choice of Y alone.

<1>5. The finite equation is on **T**, not directly on h. To extract h (bond
energy k=−h), declare a differentiable solution family T(u), with T(0)=1 and
h=T'(0); keep H=−Σ_j h_j as in (ak). For a varying matrix A(u), differentiating
A(u)w(u)=0 gives A(0)c=−A'(0)w(0), c the coefficients of h. This is necessary,
not sufficient, for a full family. BY the product rule and CA-78.2.
For a fixed matrix A and exact gates T(t)=e^{th}, the all-t condition is
R_q(h^k)=0 for every k≥0, by the power series. It reduces to finitely many k: choose the first linear dependence
h^r=Σ_(k<r) b_k h^k, which exists because B₂ is finite dimensional; multiplying
by h and inducting reduces every later power to the first r. A one-parameter
spectral family is not automatically an exponential semigroup. BY this displayed
finite-dimensional reduction and
CA-78:165–174's transfer-family qualification.

<1>6. QED. A useful selection needs a nonzero matrix, a nonzero admissible
solution, nonzero endpoint correlations, and a regular physical family. Those
requirements, including which Y and q to use, remain separate from compilation.

## H6-B3. A concrete globally consistent charged-edge field

This construction removes LG as an unverified hypothesis **for this specified
algebraic endpoint ensemble**. It does not identify every independent-path
observable or the calibration's connectivity observable with that ensemble.

**Declarations and tags:** any local bulk brick rectangle, L0 + (Y,γ), pointed O,
q∈Q, exact categorical gates, a fixed linear boundary closure, scalar edge
phases; finite →R2/R3, no rung. Set W=O^L. All cuts below are chronological
cuts along legs, intersecting each wire once. Equivalently a cut is an order
ideal in the causal poset generated by the order of tiles along their wires.
No straight cut through a tile or undeclared reflection seam is used.

For wire j define the global absorption morphism

    Q_j^W=(1_{O^(j−1)}⊗q⊗1_{O^(L−j)})
                   (γ_{O^(j−1)}⊗1_{O^(L−j+1)}):Y⊗W→W.     (B9)

Declare a closure ℓ:Hom_C(Y⊗W,W)→C. For an edge e on wire j, choose any such
cut through e, with ordered gate products Z_< before and Z_> after the cut.
Define

    F_alg(e)=ℓ[ Z_> Q_j^W (1_Y⊗Z_<) ],
    F(e)=exp(−is Φ_e) F_alg(e),                            (B10)

where Φ_e is a fixed real number assigned to the unoriented edge, independently
of this cut and of the tile weights. If a path interpretation is desired,
Φ_e must agree with the declared winding of a reference defect route. A
previously prescribed local winding rule is compatible exactly when
exp(−isΦ_{e_i})=exp(−isχ_p)exp(−isω_{p,i}) for some common face phase χ_p.
This compatibility is not inferred merely from a topological slide.

**ASSUME** these data. **PROVE** F is cut-independent and satisfies the common-
exterior formula of B1, with ω_{p,i}=Φ_{e_i} (or the compatible local rule).
Consequently the explicit B5 matrix, for every face, suffices for its contours.

<1>1. For a tile T_i supported on wires i,i+1 disjoint from j,

    Q_j^W(1_Y⊗T_i)=T_i Q_j^W.                              (B11)

<2>1. If j<i, all factors of Q_j lie on the prefix through j, so this is the
tensor interchange law. BY (B9).
<2>2. If i+1<j, T_i lies inside the word crossed by γ_{O^(j−1)}. Naturality
(A1) moves T_i through that half-braiding; it then lies to the left of q and
commutes past q by tensor interchange. BY A1 and (B9).
<2>3. These are all disjoint cases. QED.

<1>2. Two admissible cuts through the same e include precisely the same tiles
on wire j. Their order ideals I,J differ only by tiles disjoint from j.
Remove maximal elements of I\J until I∩J, then add minimal elements of J\I.
Each intermediate set is an order ideal and each step crosses a disjoint tile.
(B11) leaves (B10) unchanged at every step. BY finite poset ordering and step 1.
Changes of the total order among incomparable gates also do nothing because
such gates act on disjoint wires. Thus F_alg, and then F, is well defined.

<1>3. Fix a face p on wires i,i+1 and a cut immediately before its tile T.
Put P=O^(i−1), S=O^(L−i−1), and for K∈H_Y define

    Lift_i(K)=(1_P⊗K⊗1_S)(γ_P⊗1_{O²⊗S}),
    ℓ_p(K)=ℓ[ Z_> Lift_i(K)(1_Y⊗Z_<) ].                   (B12)

Here Z_< and Z_> omit p. Hexagon (A2) gives Q_i^W=Lift_i(Q_L) and
Q_(i+1)^W=Lift_i(Q_R). The four insertions before/after p are precisely
ℓ_p(K_L(T)), ℓ_p(K_B(T)), ℓ_p(K_T(T)), ℓ_p(K_R(T)).
BY (B3), (B9), tensor interchange, and step 2's cut independence.

<1>4. Multiply these four values by their edge displacements and phases:
the face contour is ℓ_p(R_q(T)) with ζ_i=Δz_i exp(−isΦ_{e_i}). It vanishes
if A_p^q w_p=0. BY B1 step 2. Expanding Z_< and Z_> into exact tiles gives
(B7), with a common exterior for each term and W_ξ=0. BY CA-78.2/CA-80.1.
If the compatible local phase rule is used, a common exp(−isχ_p) factors out.

<1>5. QED. This provides an explicit finite **categorical** edge observable and
a sufficient linear local selection test for arbitrary C with declared q and
phases. It proves no nonzero kernel, positive solution, criticality, or that
these algebraic phases are the spin-winding factors of the original conjecture.
It also supplies no endpoint morphism in a Q space that happens to be zero.

## H6-B4. An identity-gate obstruction for the endpoint ansatz

**Tags:** any; L0 + (Y,γ), pointed O and q as in B1, fixed nondegenerate
parallelogram geometry, s=0; finite negative, no rung.
**ASSUME** the four-port ansatz and T=1. **PROVE** its contour vanishes iff
Q_L=Q_R. This forces q=f⊗1_O for f:Y→1 satisfying

    (1_O⊗f) γ_O = f⊗1_O.                                  (B13)

In particular, if Hom_C(Y,1)=0, no nonzero q in this ansatz admits any continuous regular family T(u)→1
satisfying the fixed-geometry equation down to u=0 (including e^{th}).

<1>1. At s=0, (B1)–(B3) give
R_q(1)=(a+b)(Q_R−Q_L). A nondegenerate parallelogram has a+b≠0.
Thus R_q(1)=0 iff Q_L=Q_R. BY substitution.

<1>2. Put v=q(1_Y⊗η):Y→O. Precompose Q_L=Q_R with
1_Y⊗η⊗1_O. By vacancy transparency (A4), the result is
v⊗1_O=η⊗q. Postcompose with η†⊗1_O and obtain
q=(η†v)⊗1_O=:f⊗1_O. BY η†η=1.

<1>3. Substitute this q back in Q_L=Q_R. The equality becomes (B13) tensored
with 1_O; it is equivalent to (B13), since inserting and removing η on that
last factor cancels it. Conversely (B13) and q=f⊗1_O imply Q_L=Q_R.
BY the displayed compositions. These are precisely vacuum-valued endpoint
maps transparent to the O strands, not an arbitrary nonvacuum charge.

<1>4. If Hom(Y,1)=0, then f=0 and q=0. If T(u) solved the equation with T(u)→1, continuity would give
R_q(1)=0 and the same conclusion. BY steps 1–3 and linearity of R_q. QED.

This explains why a finite nonzero kernel—even one containing a positive
semidefinite tile—is insufficient to select an exact Hamiltonian family.
Nonzero spin, varying/degenerating face geometry, or another endpoint grammar
require separate analysis; no such repair is proved by this obstruction.
Changing the regular spectral parametrization alone cannot evade it.

## H6-B5. The finite obstruction to consistent scalar edge phases

**Tags:** any; category-free face/edge incidence graph and declared phases
u_{pe}∈U(1) (in B1, u_{pe}=exp(−isω_{pe})); finite P3 ingredient, no rung.
**ASSUME** these phases on every incidence of a face p with an edge e.
**PROVE** there exist g_e,c_p∈U(1) with

    g_e=c_p u_{pe}                                         (B14)

iff the ordered product of u_{pe} on every cycle of the bipartite incidence
graph is 1, using u_{pe} for p→e and u_{pe}^{−1} for e→p. A finite spanning-
tree test decides this; the solution is unique up to one constant per connected
component. This is exactly the scalar compatibility required after (B10).

<1>1. If (B14) holds, write v_p=c_p and v_e=g_e. Each incidence phase is
v_e/v_p. Products around a cycle telescope to 1. BY cancellation.

<1>2. Conversely choose a root in each component, set v_root=1, and propagate
values along a spanning tree by v_e=u_{pe}v_p (or its inverse). This assigns a
unit-modulus value to every vertex. Each extra incidence completes a unique
cycle with the tree; cycle product 1 is precisely the missing relation
v_e=u_{pe}v_p. BY substitution along that tree path. There are finitely many
extra incidences, and these tests suffice; no infinite family is needed.

<1>3. For two solutions the ratios v'/v agree across each incidence, hence
are constant on each connected component. QED BY connectedness.

Thus local phase prescriptions define a multiplicative 1-cochain; the
obstruction is its class modulo vertex phase changes, detected by cycle
products. This explicit quotient is the only cohomology claim here. For
example, if neighboring faces p,q share e, their ratio must be
c_q/c_p=u_{pe}/u_{qe}; transporting these ratios around a closed sequence
of faces must return 1. This is a finite obstruction test, not a claim that
geometric spin phases from an arbitrary centre endpoint always pass it.
Even when it passes, identifying g_e with the actual total turning of a
physical defect path remains a separate geometric assertion. Nontrivial
holonomy rejects a single-valued scalar phase on this complex; a specified
cover or local system can carry it, but changes the declaration used in D1.

## H6-D1. Exact lattice consequence and its sharp limitation

**Definition (the imposed contour condition).** On the embedded brick/rhombus
cell complex, F(e) is one value per unoriented edge, at its midpoint. For an
oriented edge e=(v,v'), set Δz_e=z(v')−z(v), ω(e)=Δz_e F(e), so ω(−e)=−ω(e).
The condition is

    (dω)(p):=Σ_(e in ∂p) ω(e)=0                            (D1)

for each counterclockwise face p disjoint from endpoint sources, punctures and
chosen branch cuts. This is a definition, not an imported discrete-complex-
analysis theorem. B1 plus LG proves it for the specified endpoint ansatz.
For a spinor/local-system-valued field, choose a single flat trivialization
on the region before applying this scalar statement; otherwise transports must
be inserted, and curvature/holonomy are additional data.

**Tags:** any; category-free finite cell complex and edge cochain; finite →R3,
no rung. With categorical F, also A1/B1's data and LG.
**ASSUME** (D1). **PROVE** exact Stokes cancellation; a primitive iff the periods
vanish; face closure alone does not imply a discrete harmonic conjugate pair.

<1>1. Let c=Σ_p n_p p be any finite oriented face 2-chain on which (D1) holds.
Then

    Σ_(e in ∂c) ω(e)=Σ_p n_p Σ_(e in ∂p)ω(e)=0.              (D2)

BY distributivity and cancellation of the two opposite orientations of every
interior edge. This proves the contour identity for every such finite region,
including disconnected regions and regions with all their inner boundaries.
It does not remove a singular face from the right-hand side: an outer contour
surrounding an excluded source equals the sum of its inner source contours.

<1>2. Suppose the complex is connected and every cycle is a linear combination
of its face boundaries (the precise condition used for a simply connected
patch), or more generally ω has zero period on every cycle. Fix v₀ and define
G(v)=Σ_(e on a path v₀→v) ω(e). Two paths differ by a cycle; their sums agree.
Then ω(v,v')=G(v')−G(v). Conversely such differences telescope to zero on every
cycle. BY step 1 and finite path subtraction. On a periodic complex, (D1)
leaves the noncontractible periods undetermined. The exact obstruction is the
class of ω in ker(d:C¹→C²)/im(d:C⁰→C¹); this quotient statement is a definition
plus the preceding proof, not an appeal to a continuum cohomology theorem.

<1>3. No discrete Laplacian or Hodge-star compatibility has yet been imposed.
For an explicit category-independent counterexample take the unit square grid
and G(m,n)=m². Define F on every edge by (G(v')−G(v))/Δz_e. Thus horizontal
F is 2m+1, vertical F is 0, and every face contour is zero. But the usual
five-point Laplacian gives

    Δ₅ Re G(m,n)=(m+1)²+(m−1)²+2m²−4m²=2,
    Im G=0.                                                 (D3)

Hence the resulting real/imaginary primitives are not a harmonic conjugate
pair for that explicitly named Laplacian. BY direct computation. Calling the
edge field itself harmonic would additionally require a declared edge Laplacian
and constraints tying its directional components together. Those are absent.

<1>4. QED. The exact general conclusion is **closed cochain with controlled
periods**, not harmonicity. This is the finite P3 cohomological content.

## H6-D2. A proved conditional analytic bridge

**Tags:** any bulk chart; category-free analytic assumptions below (plus the
categorical declarations if those supply F_δ); a holomorphic function only,
no R2/R3. This is a sufficient condition, not an optimal compactness theorem.

**ASSUME** square meshes δ→0 in a plane domain D away from sources, fields F_δ
satisfying (D1), scalar normalizations a_δ independent of e, and a function
f∈C¹(D) such that for every compact K⊂D,

    sup_(edge midpoint z_e in K) |a_δ F_δ(e)−f(z_e)| → 0.     (D4)

**PROVE** f is holomorphic. These regularity and convergence hypotheses are
not proved for the categorical ensemble in this note.

<1>1. For an axis-aligned rectangle R compactly contained in D, choose grid
rectangles R_δ whose four sides approach its sides. Their perimeters stay
bounded and δ→0. D1 gives Σ_∂Rδ a_δ F_δ(e) Δz_e=0. BY D1 step 1.

<1>2. Replace a_δF_δ(e) by f(z_e). The error is at most
perimeter(R_δ)·sup_K|a_δF_δ−f|→0. The resulting midpoint sums converge to
∮_∂R f dz by uniform continuity of f on K and convergence of the four sides.
Thus ∮_∂R f dz=0. BY (D4) and the elementary Riemann-sum definition.

<1>3. Writing R=[x₀,x₁]×[y₀,y₁], the fundamental theorem of calculus on each
pair of opposite sides gives

    ∮_∂R f dz = ∫_(x₀)^(x₁) ∫_(y₀)^(y₁)
                       [i∂_x f−∂_y f] dy dx.              (D5)

Indeed the horizontal pair is −∫∫∂_y f and the vertical pair is i∫∫∂_x f.
Since this integral is zero on every rectangle, continuity of its integrand
implies ∂_y f=i∂_x f pointwise (divide by area and shrink the rectangle).
BY step 2 and the displayed computation.

<1>4. Real differentiability now gives, for h∈C,

    f(z+h)−f(z) = ∂_x f(z) Re h + ∂_y f(z) Im h + o(|h|)
               = ∂_x f(z) h + o(|h|).

The complex derivative exists at every z, so f is holomorphic. BY step 3.
QED. The proof also works in each flat local trivialization for a declared
covariant field, but gives no transformation law between domains by itself.

**Why holomorphicity does not determine the ensemble.** The repaired unit
observable, normalized by any nonzero Z_P, is identically 1 for every ensemble.
It satisfies D1 and D4 with f=1 regardless of all tile weights. BY A2 step 3.
Even a nonconstant holomorphic function assigned independently of a measure
cannot determine that measure. A probability law is additional structure;
categorical diagram amplitudes need not be nonnegative (CA-80:97–104).

**A precise conditional ensemble theorem.**
**Tags:** any full bulk domain with declared boundary data; category-free
probability/analytic assumptions, L0 + A1/B1 only if these construct its input;
conformal invariance of an ensemble, not an OAR conformal net or Virasoro modes.
**ASSUME** (i) normalized positive lattice laws have subsequential limiting
probability laws μ_D on declared curve/net configuration spaces;
(ii) convergence and uniform integrability identify expectations of a family
T_D of bounded continuous tests that separates probability measures;
(iii) for every allowed conformal bijection φ:D→D', the geometric pushforward
of configurations is defined and the limiting expectations obey

    E_(μ_D)[t∘φ] = E_(μ_D')[t],             for every t∈T_D'.              (D6)

These expectations may be established by unique, conformally covariant boundary
value problems for a sufficiently rich family of normalized observables, but
neither their richness nor uniqueness is supplied by one face equation.
**PROVE** φ_*μ_D=μ_D'; also all subsequential limits coincide if (ii) prescribes
the same expectations for every subsequence.

<1>1. By definition of pushforward, E_(φ_*μ_D)[t]=E_(μ_D)[t∘φ].
<1>2. By (D6), this equals E_(μ_D')[t] for each separating test.
<1>3. Separation implies equality of the two laws. The same comparison between
subsequences proves uniqueness. QED BY the stated separating-family hypothesis.

This theorem states exactly what an observable route must still establish:
positivity, subsequential limits, integrability, a measure-determining family,
and covariant boundary-value identification. A special SLE/CLE or martingale
identification needs further interface/domain-Markov hypotheses and sources;
no general-C result of that kind is imported here. None of D1–D6 supplies a
stress tensor, Ward contacts, a positive-energy representation, or VR-1's
uniform graph-norm estimates on the same refinement/state system (CA-81).

## Calibration and source comparison

The entire model-specific calculation is in `checks/tl_calibration.md` and its
exact SymPy run. It defines the scalar loop/path observable from CGS, proves
its two exterior-connectivity cancellations and checks the nine specialized
weights. It does **not** identify that observable with (A3) or with the chosen B3 field.
The precise equality needed for H6(c) is an open endpoint-identification lemma.

For the requested CGS comparison, the discrepancies are source-local:
CGS:1409–1423 uses the unique path **in** an endpoint-modified configuration,
fixed half-edge directions, direction prefactors and division by Z. Its
s-holomorphic projection relations at :1461–1474 supply additional structure
absent here; its harmonic corner components at :1478–1479 use that structure.
An identification between the source graph/field and our cochain is not proved.
Stress expectations at :1517–1545 are derivatives of fermionic two-point
functions. Thus neither “one centre endpoint equals the stress tensor” nor
“the winding phase alone identifies the observable” is proved. The proposed
sector identification in the brief remains an additional dictionary, not a
consequence of equal spins.

**Source gaps, carefully scoped.** The original Smirnov and Ikhlef–Cardy papers
required for their general parafermionic theorems were not found as local
primary sources in the targeted search. CGS itself *does* contain a scalar
observable and both spin branches at :589–603, with an attribution of rhombic
relations at :681–696; those displayed definitions are used in the check.
CGS:613–618 reports the special proved convergence and leaves the broader
case open in that source. No arbitrary-category compactness, conformal-limit,
endpoint-identification, or SLE/CLE theorem has been located or assumed.
No network acquisition was attempted, as the brief prohibits it.

## Verification and session record

A0–B4, D1–D2 and the scalar-loop calibration were checked
by a skeptical research reviewer; repairs clarified the central unit, supplied
a genuine global charged-edge field, made the nonlinear contour witness literal,
and strengthened B4 from exponentials to all continuous regular families.
The primary agent independently read the cited definitions and reran the checks.
This is an exploration result. This session edited only this note and its
checks and executed no git mutation commands; unrelated workspace changes
were left untouched.

Run commands from the repository root (all output files stay in this directory):

```bash
python3 explorations/2026-10-27-astra-r4/H6-discrete-holomorphicity-selection/checks/tl_calibration_runner.py
python3 explorations/2026-10-27-astra-r4/H6-discrete-holomorphicity-selection/checks/finite_identities_runner.py
python3 explorations/2026-10-27-astra-r4/H6-discrete-holomorphicity-selection/checks/half_braiding_witness.py > explorations/2026-10-27-astra-r4/H6-discrete-holomorphicity-selection/checks/half_braiding_witness.txt
python3 explorations/2026-10-27-astra-r4/H6-discrete-holomorphicity-selection/checks/phase_compatibility.py > explorations/2026-10-27-astra-r4/H6-discrete-holomorphicity-selection/checks/phase_compatibility.txt
```

- `checks/tl_calibration.txt`: exact weights and both connectivity contours pass;
  weight, spin and loop-sign mutations fail, restored baseline passes.
- `checks/finite_identities.txt`: number-changing cut transport, all four endpoint
  lifts, the common exterior, identity obstruction and Stokes pass; omitted
  half-braiding and reversed shared-edge mutations fail, restored baseline passes.
- `checks/half_braiding_witness.txt`: changing only the half-braiding, at fixed
  twist and real spin, changes the kernel, even on Hermitian positive projections.
- `checks/phase_compatibility.txt`: spanning-tree reconstruction satisfies all
  incidences; one sign mutation produces holonomy −1 and is rejected.
- `checks/source_search.txt`: recorded local searches for holomorph/parafermion/
  Cauchy/contour/spin and targeted filenames/metadata; scope is recorded rather
  than an unsupported claim of exhaustive absence.

Python 3.12.3 and SymPy 1.12; exact arithmetic, no numerical tolerances; largest
matrices 64×64. The first phase-check run caught Python integer division
introducing floats; explicitly converting the input scalars to SymPy exact
numbers fixed the convention error. No Julia suite, network, or report build
was run: only this note and its checks were changed.

## Results ledger

- H6-A0 — **negative**: arbitrary centre data alone do not define the stated scalar/unit-normalized/spin observable.
- H6-A1 — **proven**: declared finite defect evaluation, allowed-move invariance, unit reduction and vacancy/number-change transparency.
- H6-A2 — **negative**: central transport and the unit contour impose no weight selection.
- H6-B0 — **proven**: global multiaffinity, homogeneous-polynomial specialization and an explicit nonlinear averaged-contour witness.
- H6-B1 — **proven**: explicit endpoint matrix; equivalence to the local tensor identity; necessity for individually tested separating exteriors.
- H6-B1-G — **conditional**: arbitrary decorated ensembles inherit face contours if their common-exterior hypothesis LG holds.
- H6-B2 — **proven**: module/geometry/endpoint dependence, gauge covariance, direct-sum resolution and exact-weight versus h-family distinctions.
- H6-B2-U — **negative**: obligatory nontrivial F/γ sensitivity for every Y; the central-unit sector is a universal exception.
- H6-B3 — **proven**: a cut-independent charged-edge field that realizes LG with fixed scalar edge phases.
- H6-B3-W — **conditional**: identification with prescribed geometric winding requires the explicit phase compatibility and an actual route interpretation.
- H6-B4 — **negative**: a nonvacuum spin-zero endpoint cannot admit a continuous identity-normalized family at fixed nondegenerate geometry in this ansatz.
- H6-B5 — **proven**: edge-phase consistency iff finite incidence-cycle products equal one; uniqueness up to componentwise phase.
- H6-C1 — **proven**: exact scalar-loop weight and contour calibration, branch identification and dimension restriction in checks only.
- H6-C2 — **conjectural**: identification of that scalar connectivity observable with the proposed categorical endpoint field.
- H6-D1 — **proven**: lattice Stokes, the primitive/period criterion and the cohomological obstruction to a global primitive.
- H6-D1-H — **negative**: contour closure alone does not imply discrete harmonic conjugacy.
- H6-D2-A — **conditional**: local-uniform edge convergence to a C¹ function implies holomorphicity, with a full proof of the implication.
- H6-D2-B — **conditional**: covariant limiting expectations of a separating test family imply conformal invariance of the ensemble law.
- H6-selection — **conjectural**: a physical nonzero categorical endpoint construction selecting a critical h for arbitrary input C.

## Layer tags

| Statements | Setting | Input layer and additional declarations | Rung reached / rung claimed |
|---|---|---|---|
| A0–A2, B0–B4 | Any bulk patch; B3 uses a chronological brick rectangle | L0 + chosen centre object (or a specified L1 braiding); pointed O, exact tiles, endpoint q, boundary closure, geometry and phases; A1 additionally fixes paths/framing | finite only; →R2/R3 ingredients, no rung claimed |
| B5, D1 | Any cell/incidence complex | Category-free phases/cochains; source/period exclusions | finite only; no rung |
| D2-A | Any bulk chart away from sources | Category-free convergence, normalization and C¹-limit hypotheses; categorical microscopic data if supplying the approximants | holomorphic observable only; no R2/R3 |
| D2-B | Full bulk ensemble with declared boundaries | Positive limiting laws, integrability, separating observable family and covariant expectation identification | conditional ensemble invariance; no OAR/Virasoro/net rung |
| C1/C2 | Only the checks and examples below | C1 declares scalar connectivity weights and winding; C2 also needs a verified categorical endpoint dictionary | C1 finite; C2 unproved; no rung |

The real exponent s here is a microscopic winding convention. Identifying it
with a chosen theory's conformal weight is additional L3/L4 information.
The L0 carrier and R0 results are reused, not reproved or promoted. B3 sews only
along legs, as CA-80.1 does; bent spatial seams use the separate CA-92/98 data.
CA-98.2's conjugate-dual mirror changes both charge and word labels and is not
an unmentioned linear endpoint identification. No reflection positivity is
inferred from a contour equation.

## Pillar served

**P3 on P2:** a general-C finite local equation, an actual charged-edge
realization, and two precise cohomological questions—edge-phase compatibility
and closed-cochain periods. **P1:** vacancy transparency and number-changing
morphism slides preserve the pointed indefinite-number carrier throughout.
**P4:** the output is a candidate finite input, not a WT-1 or VR-1 certificate.

## What this gives the integration

CA-88 gains an ingredient at **(any; L0 + centre/endpoint/geometry declarations;
finite →R2/R3)**: one can compile and test endpoint contour equations on exact
P2 tiles, with B3 giving a consistent finite field and B4 a necessary rejection
test for regular families. The half-braiding can enter the kernel nontrivially,
as the end-table witness checks. No R0–R5 cell moves up a rung.

CA-75 row (2) gains a concrete **endpoint-dependent selection test on tile
weights**, not a category-only prescription for h. Link (a) gains a finite
local identity and its propagation over leg-sewn patches. It does not obtain
(a1)'s full module/continuum channel dictionary, (a2)'s spatial anomaly seam,
or (a3)'s geometric-stress-to-KS identification and vanishing residual bounds.
CA-78's distinction between defect symmetry and criticality remains intact;
CA-81's same-system analytic contract remains wholly to be verified.

## Open problems

1. **Endpoint identification lemma.** Construct nonzero endpoint tensors for a
   chosen centre sector from declared categorical microscopic data, and prove
   that the intended random-interface observable equals an explicitly typed
   field such as B3. A zero Q space or a vanishing contracted field must be
   detected, not called holomorphic progress.
2. **Geometric phase lemma.** For a specified framed local route grammar, compute
   its incidence phases and pass B5's exact cycle tests; then prove the resulting
   shared-edge phases equal actual path winding with the required twist rule.
   B5 solves the scalar compatibility test, not the geometric identification.
3. **Feasibility lemma.** Determine when ker A contains a normalized nonzero tile
   with the required positivity/reflection constraints and a nonzero endpoint
   observable. The endpoint grammar and normalization are part of this lemma;
   a kernel dimension by itself is insufficient.
4. **Regular-family lemma.** Produce a differentiable/analytic solution family
   T(u), with a controlled regular limit and self-adjoint derivative h, and
   prove how it relates to the exact e^{th} tiles. At spin zero with fixed
   nondegenerate geometry, B4 forbids this for Hom(Y,1)=0 and nonzero q; at least
   one stated hypothesis must change. A reparametrization alone is ineffective.
5. **Calibration dictionary lemma.** Identify the scalar loop connectivity field
   with a specified centre endpoint, including all branch-dependent spin lifts,
   endpoint tensors and multiplicities. Matching a fugacity or twist alone does
   not prove it; the example below gives an explicit branch mismatch.
6. **Analytic non-collapse lemma.** Establish a normalization, nonzero limiting
   correlators and compactness/regularity strong enough for D2-A, then covariant
   boundary-value uniqueness for a measure-determining family as in D2-B.
7. **Stress/OAR transfer lemma.** Identify a stress insertion and its Ward
   contacts, and prove the same-system graph-norm and refinement estimates of
   CA-81/CA-89. A closed endpoint cochain supplies none of these estimates.

## Examples table

| Instance (checks only) | Exact finding | What it does not establish |
|---|---|---|
| Every C, Y=the central unit, s=0 | F=Z after the declared repair; A=0 for every weight | A nontrivial selection principle |
| Scalar TL-type loop calibration, u=λ | `rho/rho1=(1,x,x,x²,x²,x²,x²,x²,0)`, `x=(2cosλ)^−1`, `n=−2cos4λ`, `σ=1−3λ/π`; both exterior classes cancel | Equality to H6's extra centre-strand observable; categorical criticality |
| Same scalar calibration, two branches | `cos2λ≥0` gives `x^−2=2+sqrt(2−n)`; `cos2λ<0` gives `2−sqrt(2−n)`; singular original weights excluded | A universal choice between branches |
| Standard braided Ising, X=σ | Full two-site dimension nine; branch-one scalar spin 7/16 differs from categorical spin 1/16, leaving residual `1−tan(3π/16)>0`; branch two has spin 1/16 | Automatic endpoint identification on either branch |
| Same braided category, centre object 1⊕ψ | Twist diag(1,−1), explicitly witnessing A0's nonscalar-twist obstruction | A single scalar spin for arbitrary centre objects |
| CGS fermionic construction, proposed Y=ψ, s=1/2 | The half-spin winding factor agrees; CGS uses endpoint-modified paths, projection equations and derivatives of two-point functions for stress | Identification with an external central strand or with a single stress insertion |
| Explicit bit-pair graded category, fixed O,Y,q,s=0 | Two half-braidings with the same twist give different B5 kernels; a fixed swap and positive projection pass only one (`half_braiding_witness.*`) | A continuous identity-normalized physical family; B4 obstructs it here |
| Same finite graded check with pair creation/annihilation | Cut transport and all four lifts hold exactly; omitting a prefix crossing fails | A scaling limit or a restriction to conserved particle number |
| Square-grid cochain G(m,n)=m² | Closed contours but Δ₅ Re G=2 | Discrete harmonic conjugacy from closure alone |

## Sources used

Primary aliases, all local (line numbers refer to these exact local files):

- **Penneys:** `references/text/PenneysUnitaryFusionCategories.md:118–131,219–237,394–430,682–715,1010–1030` — finite Hom spaces, orthogonal sums, coherent typed diagrams, duality and positive spherical trace.
- **ENO:** `references/text/EtingofNikshychOstrikFusionCategories.md:127–132` and `references/text/EtingofNikshychOstrikFusionCategories.txt:1700–1706` — centre/context and unitary spherical structure; no missing half-braiding axiom is inferred from these paragraphs.
- **Wolf:** `literature/md/rwolfthesis/tex/3_Subfactors.tex:1165–1196,1260–1269` — complete centre definition and hexagon; crossing inverted for the convention in A1.
- `literature/md/1704.04221/1704.04221.md:298–307` — centre objects and crossing orientation; its phrase “natural conditions” is supplemented by Wolf, not silently expanded from memory.
- **FRS:** `references/categorical-reconstruction/FuchsRunkelSchweigert2002/source/hep.tex:1023–1029,1086–1096` — ribbon consistency and twist naturality.
- **AFM-D:** `references/cft/AasenFendleyMong2020/source/_Topological_defect_lines.tex:41–68,80–94,163–188` — fixed-path defect sums, pulling-through independent of integrability, identity defect and transfer commutation.
- **Levin–Wen:** `references/string-net/LevinWen2005/source/strnet.tex:497–529,548–577` — local diagram relations and their fixed-point motivation; no critical-chain theorem imported.
- **CGS:** `references/lattice-symmetry/ChelkakGlazmanSmirnov2016/source/StressTensor.tex:589–624,681–696,1409–1423,1461–1479,1510,1517–1545,2229–2236` — scalar path observables/branches, source convergence boundary, s-holomorphic structure, closed-loop turning and stress/derivative distinctions.
- **Zhou–Batchelor:** `references/lattice-symmetry/ZhouBatchelor1997/source/9611156.tex:120–145,270–276` — weights and branch calibration, used only in checks and the examples table.
- **RSW:** `references/category-theory/RowellStongWang2009Classification/source/RSWfinal3.tex:2447–2452` — the example's fusion, dimensions and twists.
- Provenance read: `references/manifest/SOURCES.md:25–35`; `references/category-theory/SOURCES.md:122–147`; `references/string-net/SOURCES.md:19–48`; `references/cft/SOURCES.md:74–117`; `references/lattice-symmetry/SOURCES.md:1163–1194,1731–1776`.

Prior lab-book results and declarations, reused by number:

- **CA-75:** `report/sections/75_integration_map.tex:64–97,115–135` — row (2) and Link (a).
- **CA-78:** `report/sections/78_categorical_selection_equations.tex:44–68,79–97,165–174,192–229` — exact compiler/gates, blocking boundary, transfer erratum, defect symmetry and analytic interfaces.
- **CA-80:** `report/sections/80_lattice_sewing_and_fidelity_certificate.tex:52–83,87–115,127–140` — external labels, exact leg sewing, separate positivity and Ward residual bookkeeping.
- **CA-81:** `report/sections/81_cft_machine_oar_contract.tex:95–114` — VR-1 and the same-state/system boundary.
- **CA-86:** `report/sections/86_spacetime_trotter_dictionary.tex:61–110,154–217,268–278` — histories, calibration, original endpoint proposal and transfer qualification.
- **CA-87:** `report/sections/87_dilute_fibonacci_is_blocked_golden.tex:55–71,83–86` — existing general blocking and the calibration's full-algebra/subalgebra distinction; not rederived.
- **CA-88:** `report/sections/88_layered_targets.tex:82–125,142–151` — data layers, rung distinctions and finite ingredients.
- **CA-92:** `report/sections/92_spatial_seams_and_reflection_positivity.tex:53–109` — declared seam and bent-kernel hypotheses, separate from the endpoint equations.
- **CA-98:** `report/sections/98_canonical_seams_reflection_coherence.tex:53–96` — algebraic seam, typed twist and conjugate-dual mirror.
- `CONVENTIONS.md:631–694,1397–1642`; `worklog/023_2026-10-27_status_overview.md` §§0,1,4 — pointed indefinite-number setting, exact weights, layer tags, four pillars and missing selection principle.

New displayed derivations are contained in this note. Their finite independent
instances and mutation output are the adjacent `checks/` files listed above.
No absent parafermionic or SLE/CLE theorem is used as a premise.
