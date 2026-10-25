# F3 — Reflection coherence: proof ledger in progress

2026-10-25. Started 05:04 UTC. Initial statement and ledger recorded before
05:14 UTC. Scope: this directory only; no network, report edits, commits or Julia.
This note, including its local convention declarations and checks, is the
research record for this deliberately isolated round.

## Statement under investigation

ASSUME a general unitary fusion category C, the unitary spherical duality of
CONVENTIONS (b),(r), nonzero site O, the CA-86 linear tile T(t)=1+t h,
and the CA-92 oriented bend rot. Put W+=O⊗Obar, W-=Obar⊗O and
K_s(T)=s†rot(T), retaining all charges and multiplicities.

PROVE OR REFUTE:
(a) At L1, braiding and the unitary pivotal structure determine a unitary
canonical seam s:W+→W- with s coev_O=ev_O†, natural under unitary braided
equivalences.
(b) At L1, or L0 with any unitary self-duality psi:O→Obar, conjugate duality
supplies a coherent antiunitary reflection on every cut; its square has only
the stated Frobenius–Schur sign and is trivial on observables; the induced
seam obeys the cup equation; K_s(h) is Hermitian iff this reflection fixes h.
(c) With the uniform CA-92 Schur criterion, these data give spatial RP of all
reflection-symmetric CA-86 brick histories, a positive spatial transfer, and
a unitary crossing relating temporal and spatial transfers.

Setting: periodic/full; a chiral variant requires an explicitly twisted
reflection. Algebraic claims will be stated at setting any when possible.
Data: L1 for (a); L0 plus declared self-duality/reflection data for the general
branch. Target: finite ingredient →R3 only; no R1–R5 is assumed reached.

## Conventions and dependency boundaries

Use CONVENTIONS (ak),(al),(aq),(at),(au), including H=-sum h_j, raw cups of
norm squared d_O, inner products linear in their second slot, and the
complex-linear bend rather than a dagger. Entry (at) distinguishes linear
parity from antiunitary reflection; (au), not (at), defines the spatial seam.
New notation will be declared here before use, because the brief forbids
editing CONVENTIONS.md. CA-80 Lemmas 80.1–80.5 and CA-92 Theorems 92.3,92.5,
Lemma 92.8 are dependencies, not conclusions to rederive.

## Proofs and counterexamples

### A. A canonical algebraic seam at L1 — proven

**Tags:** (any; L1; finite →R3). This theorem supplies the morphism s,
not Definition 92.1's entire reflection rule. Let [P] denote Penneys' local
notes, with exact path and anchors in Sources used.

**ASSUME** unitary braided fusion C, nonzero O, its specified unitary
spherical duals. For each simple a define

    lambda_a = d_a^(-1) ev_a c_(a,abar) coev_a,
    t_O = sum_a lambda_a^(-1) p_a,
    s_can = c_(O,Obar) (t_O ⊗ 1_Obar),                       (A1)

where p_a is the canonical isotypic projection of O; the summation includes
only occurring isomorphism classes. The symbol t_O is a cup-correction
endomorphism, not the time step t. We do not need a ribbon-twist theorem.

**PROVE** s_can is unitary, s_can coev_O=ev_O†, and this construction is
natural under unitary braided equivalences (with their canonical unitary
comparison of spherical duals). The correction t_O is uniquely determined
by the displayed cup equation within the form (A1).

<1>1. Hom(1,abar⊗a) has dimension one: rigidity identifies it with
End(abar), which is C. Both c_(a,abar)coev_a and ev_a† have norm sqrt(d_a).
Thus

    c_(a,abar)coev_a = lambda_a ev_a†,   |lambda_a|=1.         (A2)

BY [P]:425–430 (Frobenius reciprocity), :1012–1030 (positive spherical
normalization), and unitarity of c. Applying ev_a identifies the scalar
with (A1), since ev_a ev_a†=d_a.

<1>2. t_O is a central unitary, independent of the chosen simple-copy
inclusions. It is natural for every categorical morphism f:O→Q:
`t_Q f=f t_O`. BY orthogonal isotypic decomposition and the fact that f
has no matrix entries between inequivalent simples ([P]:219–237).

<1>3. For orthonormal simple-copy inclusions i_(a,mu):a→O, put
j_(a,mu)=(i_(a,mu)^vee)†:abar→Obar. Standard direct-sum duality gives

    coev_O = sum_(a,mu) (i_(a,mu)⊗j_(a,mu)) coev_a,
    ev_O†  = sum_(a,mu) (j_(a,mu)⊗i_(a,mu)) ev_a†.          (A3)

BY [P]:1029–1030, or by substituting the orthogonal resolution into the
snake equations and positive trace normalization. Any other specified
unitary spherical dual is related by the unitary comparison of
[P]:1017–1030; transport (A3) by that comparison.

<2>1. Braiding naturality moves each i⊗j through c; (A2) cancels the
factor lambda_a^(-1) from t_O. Summing (A3) proves the cup equation.
<2>2. c and t_O⊗1 are unitary, so s_can is unitary. BY <1>2.

<1>4. The map `f↦(f⊗1)coev_O` is an isomorphism from End(O) to
Hom(1,O⊗Obar) by the snake equations; following with c is still an
isomorphism. Hence its prescribed value ev_O† determines t_O uniquely.
BY [P]:398–430. This is uniqueness of the **cup-correction construction**,
not uniqueness among all seams (CA-92 Definition 92.1 retains its gauge).

<1>5. For a unitary braided equivalence F, transport ev, coev and c through
its unitary tensorators and its unitary spherical dual comparison. The
scalar lambda_a and positive d_a are preserved, and F transports p_a to
the corresponding isotypic projection. Therefore it transports t_O and
s_can to t_(FO) and s_can(FO). BY (A1)–(A3) and [P]:1017–1030.
QED. No basis choice, self-duality, or h enters the construction.

**F-S sign audit.** If a simple a is identified with abar by a unitary
self-duality and its raw cup is v, oriented ev† is nu_a v, where
nu_a=±1; it must not be silently replaced by v. If c(v)=R_1^(aa)v,
(A2) gives lambda_a=nu_a R_1^(aa), so
`t_a=nu_a (R_1^(aa))^(-1)`. In the local ribbon convention
`R_1^(aa)=nu_a theta_a^(-1)`, this is theta_a, not theta_a^(-1).
BY [P]:919–941,1032–1047 and RSW:2311–2314. The general proof above
uses oriented duals and does not require identifying any object with its dual.

**Basis-free formula and the twist sign (additional proved identity).**
ASSUME §A and write j_O:O→Obarbar for the canonical pivotal unitary.
PROVE the following typed formula for the same t_O:

    t_O=(1_O⊗ev_O)(c_(O,Obar)^(-1)⊗1_O)(ev_O†⊗1_O).        (A4)

<1>1. Apply the inverse of the currying isomorphism in §A <1>4 to
`c^(-1)ev†`. Its inverse sends b to `(1⊗ev)(b⊗1)`; the snake equation
proves both compositions are identities. This gives (A4).
<1>2. Set `q_O=(ev_O⊗1_O)(c_(O,Obar)⊗1_O)(1_O⊗ev_O†)`.
Unitarity of c gives q_O†=t_O. The pivotal relation [P]:1004 gives
`coev_Obar=(1_Obar⊗j_O)ev_O†`, by cancelling a snake in (3.8.3).
<1>3. Substitute this into the Drinfeld morphism

    u_O=(ev_O⊗1_Obarbar)(c_(O,Obar)⊗1_Obarbar)
         (1_O⊗coev_Obar).

Then `u_O=j_O q_O=j_O t_O†`, so `t_O=u_O^(-1)j_O`.
BY the displayed computation; the Drinfeld formula is locally sourced in
`literature/md/2201.00192/2201.00192.md:264–268`.
QED. Thus, if theta denotes this pivotal twist, the seam uses **theta**,
not its inverse. No ribbon dual-compatibility assertion is needed below.

### B. Two independent failures of the proposed reflection — proven negative

**Tags:** (any; L0, also L1; finite). These counterexamples use the unit
multiplicity corner present in every C, so their scope is model-independent.
Use O=1⊕1 as allowed by CONVENTIONS (am), standard spherical duality, and
the symmetric braiding. Then s_can is the ordinary mixed-port flip.

**ASSUME** a unitary self-duality psi on this O. With K_0 ordinary
coordinate conjugation, the covariant conjugate-dual functor induces
`J=psi† K_0` on its underlying two-dimensional carrier. **PROVE** its
square need not be a sign or act trivially on End(O).

<1>1. `J²=psi† conjugate(psi†)`. BY composition of anti-linear maps.
Choose the real rotation psi=[[3/5,-4/5],[4/5,3/5]]. Then

    J² = [[-7/25,24/25],[-24/25,-7/25]],                    (B1)

which is not scalar. It does not commute with Z=diag(1,-1).
<1>2. `(Ad_J)²(Z)=J² Z (J²)† != Z`, because the nonzero off-diagonal
entries in (B1) imply `[J²,Z]!=0`. BY <1>1. QED.
The exact correction to the claim is **centrality of the square defect**,
not unitarity of psi. For a scalar sign, the stronger real/pseudoreal
self-duality equation is needed. Simplicity is essential in the scalar
F-S argument of [P]:919–933.

**ASSUME** instead the standard real self-duality psi=1; write P for
swapping the two unit-multiplicity factors. On two-site operators the
specified conjugate-dual functor is

    D_2(h)=P conjugate(h) P,

whereas CA-92 Remark 92.7 gives the bent-kernel Hermiticity operation

    rho_flip(h)=P h† P.                                   (B2)

**PROVE** neither fixed-point condition implies the other, even for
self-adjoint tile densities.

<1>1. Let Y=[[0,-i],[i,0]], Z=diag(1,-1), and
`h=Y⊗Z−Z⊗Y`. Then h†=h, conjugate(h)=−h, and PhP=−h, so D_2(h)=h.
BY direct multiplication.
<1>2. By CA-92 Proposition 92.6's matrix-unit formula,

    K_flip(h)=|vec Y><vec Z|−|vec Z><vec Y|,

which is nonzero and anti-Hermitian: vec Y and vec Z are nonzero,
orthogonal vectors. Therefore K_flip(h) is not Hermitian.
<1>3. For `g=Y⊗1+1⊗Y`, g†=g and PgP=g, so K_flip(g) is Hermitian
by CA-92 Remark 92.7, while D_2(g)=−g!=g. QED.

The obstruction is structural. D(f)=(f^vee)† preserves composition
because dual and dagger each reverse it ([P]:682–698,995). Thus it acts
as a conjugate-linear algebra **automorphism**. By contrast rho_flip
reverses composition. Conjugation by an antiunitary cannot equal this
anti-automorphism on a noncommutative tile algebra. This distinction
invalidates (b)(iii) even when the square defect vanishes.


### C. What conjugate duality actually proves — proven

**Tags:** (any, with dual-oriented cuts; L0; finite →R3).
Declare D(X)=X^vee and D(f)=(f^vee)†; its anti-monoidal tensorator is the
unitary dual tensorator, with its direction chosen to reverse the ordered
word. Use j_X:X→D²X for the canonical pivotal unitary. This is an operation
on oriented cuts, not yet a reflection endomorphism of a fixed chain.

**ASSUME** the standard unitary spherical dual functor. **PROVE** D induces
antiunitaries between each cut and its dual-oriented mirror, respects
CA-80 sewing, and squares to the identity after pivotal comparison.

<1>1. `D(gf)=D(g)D(f)`, `D(f†)=D(f)†`, and D is conjugate-linear.
Duality and dagger each reverse composition; only dagger conjugates
scalars. Tensor order reverses once, by duality. BY [P]:145–148,682–708,
992–1008. The tensorator is unitary, so reassociation is coherent.

<1>2. For simple a and f,g:a→W,

    D(f)†D(g)=D(f†g)=overline(<f,g>) 1_Da.                  (C1)

Thus f↦D(f) is an antiunitary
`Hom(a,W)→Hom(Da,DW)`. Surjectivity follows from dual equivalence and
dagger. Summing over a gives an antiunitary to the mirror cut with its
simple labels explicitly changed to Da. BY <1>1 and [P]:698–704.

<1>3. If u_A is a cut basis with Gram G, its mirror has Gram conjugate(G)
and inverse Gram conjugate(G^(-1)). Apply D to the identity resolution
in CA-80 Lemma 80.1. The result is exactly the identity resolution on
the mirror cut; applying D to sewn amplitudes preserves their composition
by <1>1. Hence this mirror respects the sewing of any finite patch along
legs, including all multiplicities and nonorthonormal bases. BY (C1),
CA-80:70–83 and the unitary dual tensorator; no plaquette-RP assertion enters.

<1>4. Pivotal naturality gives

    D²(f)=j_W f j_a†.                                      (C2)

Transporting both external labels back by j makes the double mirror the
identity. BY [P]:706–715,897–905,997–1008. QED.

A braiding does **not** produce an isomorphism O≅Obar. It supplies the
composite seam of §A, while D still changes the site label. The braided
non-self-dual check below makes this distinction explicit. Thus (C1) is a
mirror-between-cuts theorem, not the claimed fixed-cut Theta_x theorem.

### D. Exact self-duality defect and F-S bookkeeping — proven

**Tags:** (any; L0 plus declared unitary identifications; finite).
**ASSUME** unitary r_X:X→DX on each object to be identified with its mirror.
Declare

    rho_X(A)=r_X† D(A) r_X,
    z_X=r_X† D(r_X†) j_X ∈ End_C(X).                       (D1)

**PROVE** rho_X²=Ad_(z_X), and that its square is trivial on the full
categorical observable algebra precisely when z_X is central there.

<1>1. Every factor of z_X is unitary. Substitution gives

    rho_X²(A)=r_X†D(r_X†)D²(A)D(r_X)r_X
             =z_X A z_X†.                                (D2)

BY §C (C2). Consequently rho_X² fixes every A iff `[z_X,A]=0` for every A.
For a smaller declared observable algebra replace centrality by membership
in its commutant. This is an iff, not merely a sufficient condition.

<1>2. On a self-dual charge sector with a chosen unitary r_a, the actual
cut antiunitary is `J_(a,W)(f)=r_W†D(f)r_a`. From (C1) it is antiunitary,
and direct substitution gives

    J_(a,W)²(f)=z_W f z_a†.                                (D3)

BY (D1),(C2); the right factor is
`j_a†D(r_a)r_a=z_a†`. For non-self-dual external charges this formula
requires paired comparison maps to the conjugate sector; a self-duality
r_a must not be invented. The oriented theorem §C already applies without
such choices.

<1>3. Because D(r_X†)=r_X^vee, one has
`z_X=r_X† (r_X^vee j_X)`. For **simple** self-dual X the pivotal transpose
`r_X^vee j_X=nu_X r_X`, with nu_X=±1, hence z_X=nu_X 1.
BY [P]:919–933 (the square of pivotal transpose on self-dual morphisms).
Therefore (D3) contains the **ratio** nu_W/nu_a when both are scalar
signs. In particular, W=a pseudoreal gives J²=+1 on Hom(a,a)=C.
A one-dimensional complex Hilbert space admits no antiunitary of square −1:
`J(v)=lambda conjugate(v)` has J²=|lambda|²=1. BY direct computation.

<1>4. On arbitrary tensor words one must check `z_W` against the actual
observable algebra of **each** admitted cut. A statement that checks only
z_O has not checked operators mixing equal-charge copies in larger words.
The arbitrary-psi counterexample §B violates (D2) already on one site.
QED. This is the exact missing hypothesis for observable involutivity;
it does not assert a compatible seam-Hermiticity identity.

### E. A constructive L0 seam from self-duality — proven

**Tags:** (any; L0 plus declared unitary psi; finite →R3).
**ASSUME** any unitary psi:O→DO. **PROVE**

    s_psi=psi ⊗ [j_O†D(psi)]: O⊗DO → DO⊗O                 (E1)

is unitary and satisfies s_psi coev_O=ev_O†.

<1>1. All factors are unitary by §C and unitarity of psi,j.
<1>2. Naturality of the dual mate yields
`(psi⊗(psi^vee)^(-1))coev_O=coev_DO`. Since psi^vee is unitary,
its inverse is D(psi). BY [P]:684 and the snake equations.
<1>3. `(1_DO⊗j_O†)coev_DO=ev_O†`, the pivotal identity used in §A
<1>2 following (A4). Composing proves the cup equation. QED.

In the unit-multiplicity corner s_psi=U⊗conjugate(U); psi=1 gives the
factorwise identity seam, whereas s_can is the flip. Therefore the two
branches in F3(b) are **different choices of reflection pairing** even
where both are available. The equation (E1) does not imply (D2) is trivial.

### F. The exact Hermiticity involution for any seam — proven

**Tags:** (any; L0 plus an algebraic seam, supplied canonically at L1;
finite →R3). Define `sharp_s = K_s^(-1) ∘ dagger ∘ K_s` on the tile
vector space. The inverse here is a linear inverse of the **map** K_s;
it is not the matrix inverse of an individual kernel.

**ASSUME** any unitary seam s:W+→W- obeying the cup equation. **PROVE**
sharp_s is a conjugate-linear involution, and

    K_s(h) is Hermitian  iff  sharp_s(h)=h.                 (F1)

<1>1. rot is a linear bijection by two rigid adjunctions. Explicitly, if
`u=coev_O`, `v=ev_O†`, its inverse on r:O⊗Obar→Obar⊗O is

    rot^(-1)(r)=(u†⊗1_O⊗1_O)(1_O⊗r⊗1_O)
                 (1_O⊗1_O⊗v).                            (F2)

Insert the same associators as in the typed expressions. The two
compositions cancel using
`(u†⊗1_O)(1_O⊗v)=1_O` and
`(1_Obar⊗u†)(v⊗1_Obar)=1_Obar`, the daggers of the two snakes.
BY [P]:398–430. Thus K_s is a linear bijection onto End_C(W+).
<1>2. Dagger is a conjugate-linear involution of End_C(W+); conjugating it
by that linear bijection proves the assertion and (F1). QED.

This is not a proof that sharp_s is a geometric reflection. In particular,
for s_can=flip it is the anti-automorphism (B2); for the identity seam in
the same corner it is instead `P conjugate(h) P`, an automorphism.
Hence no multiplicative variance or sewing action may be assumed for a
general sharp_s. Its extension to all bricks is precisely the remaining
compatibility question. The pointed checks exercise (F1) on every allowed
matrix unit, with all cocycle phases retained.

## Results ledger

- A1 — canonical L1 algebraic seam and naturality: proven (§A); no full reflection rule claimed.
- B1 — conjugate-dual mirror between oriented cut spaces and sewing: proven (§C); fixed-carrier claim not implied.
- B2 — arbitrary self-duality gives only an F-S sign and trivial observable square: negative (§B, B1).
- B3 — induced L0 seam s_psi satisfies the cup equation: proven (§E); it differs from s_can.
- B4 — conjugate-dual reflection iff bent-kernel Hermiticity: negative (§B, B2); exact intrinsic replacement proven (§F).
- C1 — whole-history spatial reflection positivity: open.
- C2 — finite OS spatial transfer: open.
- C3 — unitary temporal/spatial crossing: open.
- X1 — pointed cocycles, non-braiding obstruction and braided coboundary check: proven (checks/pointed_output.txt).
- X2 — non-pointed pseudoreal sign and categorical Hermiticity falsifier: proven (checks/nonpointed_output.txt).

## Layer tags

Setting: any for categorical identities; full for untwisted spatial RP;
chiral only with a declared twist. Data: L0 or L1 as indicated above.
Rung reached: none yet. Rung claimed: finite →R3, never R3 itself.

## What this gives the integration

Pending: decide whether only the algebraic seam, or also the entire
reflection rule, loses the declared-s hypothesis at L1. No continuum cell
moves merely from finite reflection positivity.

## Open problems

Cut-space and sewing correction, patch-level sufficiency, translated OS forms, and requested category checks remain to be completed.

## Examples table

| Instance | Purpose | Status |
|---|---|---|
| Vec_Z3^omega, nontrivial cocycle | Non-self-dual and possible braiding test | open |
| Self-dual non-pointed category | F-S square and Hermiticity test | open |

## Sources used

- `references/text/PenneysUnitaryFusionCategories.md:398-430`: oriented duality and snakes.
- Same file `:682-708`: anti-monoidal contravariant dual functor.
- Same file `:917-943`: self-duality and simple/non-simple F-S distinction.
- Same file `:992-1030`: unitary duality and positive spherical structure.
- `report/sections/80_lattice_sewing_and_fidelity_certificate.tex:70-125`: sewing and finite positivity dependencies.
- `report/sections/92_spatial_seams_and_reflection_positivity.tex`: round-2 results and explicit open coherence hypothesis.
- `explorations/2026-10-22-astra-r2/E3-reflection-positivity/REVIEW.md:109-141`: reflection/coherence gap.
- Same directory `INTEGRATION.md:124-136`: target under investigation.
