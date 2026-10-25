# F3 — Canonical seams, reflection defects, and the coherence obstruction

2026-10-25. Started 05:04 UTC; initial all-open ledger written 05:05 UTC.
**Verdict: (a) proven as an algebraic seam; (b) false; (c) RP remains
conditional, while universal unitary crossing is false.** Scope: this directory only; no network, report edits, commits or Julia.
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
editing CONVENTIONS.md. The supplied braiding is
`c_(X,Y):X⊗Y→Y⊗X`; its inverse is used only where written explicitly.
In pointed checks, Penneys' associator is
`alpha_(a,b,c):a⊗(b⊗c)→(a⊗b)⊗c=omega(a,b,c)`; reversing this arrow
inverts omega. Oriented evaluation is fixed by the snake equations before
any bend is computed. CA-80 Lemmas 80.1–80.5 and CA-92 Theorems 92.3,92.5,
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

The scalar lambda_a is unchanged by a unitary isomorphism of simple
representatives and by the unitary comparison of their spherical duals:
transport both cups in (A2), using braiding naturality. Thus it is indexed
by an isomorphism class, not by a representative.

<1>2. t_O is a central unitary, independent of the chosen simple-copy
inclusions. It is natural for every categorical morphism f:O→Q:
`t_Q f=f t_O`. BY orthogonal isotypic decomposition and the fact that f
has no matrix entries between inequivalent simples ([P]:118–135,219–237).

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
BY (A2),(A3) and naturality of c.
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
BY §A <1>4 and [P]:398–430.
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
F-S argument of [P]:919–933. If the self-duality must fix the pointed
vacuum, take O=1⊕1⊕1 and psi=diag(1,psi_(B1)); it fixes the first
unit inclusion and has the same noncentral defect on the other two copies.
This strengthened witness is checked in check_core.py.

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

<1>1. All factors are unitary. BY §C and unitarity of psi,j.
<1>2. Naturality of the dual mate yields
`(psi⊗(psi^vee)^(-1))coev_O=coev_DO`. Since psi^vee is unitary,
its inverse is D(psi). BY [P]:684 and the snake equations.
<1>3. `(1_DO⊗j_O†)coev_DO=ev_O†`, BY the pivotal identity used in §A step <1>2 following (A4).
Composing it with step <1>2 of this proof gives the cup equation. QED.

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

**A sharper extension obstruction (proved, with a small pointed witness).**
ASSUME a reflection R of the **same** tile algebra B=End_C(O⊗O), with
R conjugate-linear, R²=1 on observables, and R preserving or reversing
ordinary vertical composition. PROVE that the equivalence
`R(h)=h iff K_s(h) is Hermitian` for every h forces sharp_s to have that
same multiplicative variance.

<1>1. Every h has the unique decomposition h=x+i y with x,y fixed by
sharp_s: `x=(h+sharp_s(h))/2`, `y=(h-sharp_s(h))/(2i)`.
BY §F involutivity.
<1>2. The assumed fixed-point equivalence gives R(x)=x,R(y)=y; anti-linearity
gives R(h)=x−i y=sharp_s(h). Thus the two operations coincide on B.
BY <1>1 and the fixed-point hypothesis.
<1>3. Apply the composition law of R to AB. Hence a pair A,B with
`sharp_s(AB)!=sharp_s(A)sharp_s(B)` and
`sharp_s(AB)!=sharp_s(B)sharp_s(A)` rules out **either** variance. BY <1>2 and the stated composition law.
QED. The braided pointed examples at the end supply precisely such a pair.
This does not exclude a graph-dependent operation changing the composition
direction or its boundary identifications. Those changes would be extra
reflection data, not the fixed-cut functor claimed in F3(b).

### G. Whole-history RP: the precise surviving implication — conditional

**Tags:** (full, chiral only with declared twist; L0 plus the following
microscopic data, or L1 with §A supplying the individual seam; finite →R3).

**ASSUME** a reflection-symmetric CA-86 linear brick patch, with its
boundary and flux data explicitly included. Supply the following certificate:

- (G1) The reflected half-amplitudes, read on the cut, are the adjoints
  of the original half-amplitudes (RH in CA-92).
- (G2) The disjoint crossing-tile identifications tensor and reassociate
  to that **same** cut identification; restrictions to charge sectors
  use CA-80's identity resolution. The reverse identification is adjoint.
- (G3) Every crossing tile uses the **same fixed h**, independent of N,M
  (or a fixed family with a common step bound), and is 1+t h with the
  CA-92 Theorem 92.5 Schur
  criterion and its scalar step bound; any further seam insertion belongs
  inside a positive reflected factorization. Bulk weights and the outer
  boundary are paired by (G1).

**PROVE** all-insertion spatial RP, uniformly in the number of bricks
for every admissible patch carrying this certificate.

<1>1. Each crossing kernel is positive by CA-92 Theorem 92.5. Its allowed
step interval is determined by the single-tile data, not N or M.
<1>2. Apply CA-92 Proposition 92.4, whose exact hypotheses are (G1)–(G3).
It gives a positive compressed tensor product and hence all-insertion RP.
QED. This is an application, not a new proof of that proposition.

**What is and is not discharged:** §A removes the separate declaration of
an **individual algebraic seam** at L1. §C proves sewing for the oriented
conjugate-dual mirror. It does not identify that mirror with the canonical
seam's adjoint pairing, as §§B,F explicitly obstruct. Thus (G1),(G2) remain
separate hypotheses; checking the one-tile Schur condition and D(h)=h is
not a proof of them. The universal multi-tile clause of F3(c) is not proved
or labelled refuted solely from the failure of (b). A specified paired
construction satisfying (G1),(G2) does satisfy the implication above.

### H. Finite OS reconstruction needs no prior upper bound — proven

**Tags:** (any; category-free plus declared translation; finite →R3).
This slightly strengthens the finite part of CA-92 Lemma 92.8; it does not
produce a translated strip form from categorical data.

**ASSUME** finite V, nonzero PSD Hermitian form q0, a linear shift
`tau:V→V`, and the compatible form `q1(f,g)=q0(f,tau g)` is PSD.
**PROVE** tau descends to a positive operator T on V/rad(q0); a single
positive scalar normalization makes T a contraction. No assumed inequality
q1≤q0 is required at finite size.

<1>1. If z∈rad(q0), then q1(z,f)=q0(z,tau f)=0 for every f. Hermiticity
of q1 yields q1(f,z)=0, hence q0(f,tau z)=0 for every f. Therefore
`tau z∈rad(q0)`. BY the displayed identities.
<1>2. T[f]=[tau f] is well-defined and
`<[f],T[g]>=q1(f,g)`, so T=T†≥0 on the finite positive quotient.
BY <1>1 and the definition of q1.
<1>3. Choose rho≥max(1,||T||), set tau'=tau/rho and T'=T/rho.
Then `0≤q1/rho≤q0` and `0≤T'≤1`. Apply CA-92 Lemma 92.8 to obtain
its multi-time positive kernels and, if T is injective, the logarithmic
Hamiltonian on the whole quotient. If T has a kernel, the logarithm only
exists after a further restriction to its positive spectral support;
that restriction is not a statement about arbitrary zero-time probes.
QED. Normalizing shifts the energy origin; it does not establish a
specified vacuum is at zero energy or a volume-independent normalization.

The still essential hypotheses are a shift-closed insertion space and a
positive **compatible translated form** q1. Positivity of q0 alone does
not give them (CA-92:188–195). The new lemma removes the upper-bound
obstacle at a fixed finite volume, not these geometry/dynamics obstacles.

### I. Unitary directional crossing is false even for the whole history

**Tags:** (full finite torus; L0, also symmetric L1; finite negative).
This strengthens the local rank warning of CA-92 Proposition 92.9 to a
completely specified whole-history example.

**ASSUME** any C, the unit-multiplicity site `O=1^⊕d`, integer d≥2, and
h=0. Take N≥2 sites and M≥2 periodic time slices. Every CA-86 brick is
the identity; its two strands are vertical identity Kronecker deltas.
**PROVE** there is no unitary relating the temporal and spatial transfers,
even if their uncompressed carrier dimensions happen to match.

<1>1. Split each identity brick into its two identity strands and contract
redundant identity segments. The temporal transfer on `(C^d)^⊗N` is
`T_t=1`, and the periodic partition sum is `Tr(T_t^M)=d^N`.
BY the identity tensor entries, or CA-86 Lemma 86.1 with h=0.

<1>2. A column history is sigma=(sigma_1,...,sigma_M). Its periodic
vertical weight is

    w(sigma)=product_(r=1)^M delta_(sigma_r,sigma_(r+1)),
    v_sigma=sqrt(w(sigma))=w(sigma),   sigma_(M+1)=sigma_1.

Columns are independent. Assigning half of each column weight to either
side gives the symmetric spatial transfer

    (T_x)_(sigma,sigma')=v_sigma v_sigma',   T_x=|v><v|.     (I1)

Multiplying N such transfers counts exactly the same column histories:
`Tr(T_x^N)=(v†v)^N=d^N`. There are d constant histories, so v†v=d.
BY direct finite summation, including open column boundary indices.

<1>3. T_t has rank d^N, whereas T_x has rank one. If N=M the two raw
carrier dimensions are equal, d^N, but their ranks still differ; no
unitary conjugacy is possible, even allowing nonzero scalar normalizations.
For unequal N,M, dimension alone is another obstruction. After the natural
spatial OS support quotient the spatial carrier is one-dimensional, while
the temporal full-span form q0(x,y)=<x,y> has no null vectors. A unitary equivalence of those
quotients is also impossible. BY (I1) and invariance of rank under unitary
maps. QED.

All premises about one-tile positivity hold: h=0 is fixed by every
reflection, K_s(1)=uu†≥0 and the Schur data vanish. Thus the unitary-crossing
clause is not rescued by strengthening the local positivity assumptions.
The correct unconditional relation is equality of contractions of the
**same** closed tensor network, not unitary equivalence of transfers.
The exact N=M=d=2 calculation is in checks/core_output.txt.

## Verification and research record

This round uses the local convention declarations above because the brief
forbids changes to CONVENTIONS, INDEX, worklog and report sources. The early
all-open ledger was written after the entry-point/source reads; the note
was updated after the seam proof, both reflection counterexamples, the
mirror/defect identities, and the history/OS conclusions.

Two research collaborators independently audited the seam and reflection
branches; a separate skeptical reviewer checked §§A–I, the local source
anchors and all three scripts. The review additionally tested nontrivial
complex dual-gauge changes without adding files. The retained checks,
not that unrecorded auxiliary run, are the reproducibility evidence.

Frictions that matter: the conjecture conflates a cup-normalized morphism
with a reflection of the entire grammar; it also conflates conjugate duality
with the seam's pulled-back adjoint. The preferred central cup correction
in §A is natural for all categorical morphisms; a rank-one vector correction
would only settle weaker object-unitary naturality and was not used.
The pointed associator arrow had to be fixed explicitly: the old E3 script
used the inverse convention relative to Penneys' displayed arrow. The new
script derives both snakes and all rebracketings in one declared convention
rather than importing that output. No contradiction with the old invariant
K(1)=uu† is claimed. Nonzero H^3 class on Z3 cannot be used as a braided
test: the two hexagons themselves forbid it; a nonconstant coboundary gives
the separate braided calibration.

Command, from the repository root (all output remains under checks/):

```bash
PYTHONDONTWRITEBYTECODE=1 python3 explorations/2026-10-25-astra-r3/F3-reflection-coherence/checks/run_checks.py
```

The exact SymPy scripts and their raw output are:

- `checks/check_core.py` → `checks/core_output.txt`: 16 matrix-unit
  adjoint tests, two self-adjoint reflection falsifiers, noncentral square,
  inverse-Gram sewing, finite OS normalization and whole-history rank test.
- `checks/check_pointed.py` → `checks/pointed_output.txt`: all pentagons,
  both snakes, two independent bend implementations and explicit inverse
  (F2), all six allowed Hom matrix units, intrinsic Hermiticity, positive
  pencils, both hexagons where possible, and the composition obstruction.
- `checks/check_nonpointed.py` → `checks/nonpointed_output.txt`: constructed
  finite group/irreducibility, negative F-S sign with positive cup norm,
  relative cut sign, 16 matrix-unit tests for the simple pseudoreal psi
  seam, and the connected non-pointed categorical counterexample.

Intentional mutations replace dagger by conjugation, reverse an oriented
cup phase, and drop the F-S minus sign. Each is rejected by an invariant;
raw failures are `checks/mutation_{dagger,cup,fs}.txt`. The harness asserts
that each normal run succeeds and each mutation fails at the expected
assertion, and records source/producer hashes in `checks/provenance.json`.
Largest explicit four-leg operator is 16×16; the non-pointed tile is 9×9.
These checks calibrate exact finite statements, never universal conclusions
by sampling. No Julia, network, report build, commits or edits elsewhere.

## Results ledger

- A1 — **proven:** canonical natural unitary L1 algebraic seam, equations (A1)–(A4), including the positive twist sign; no full reflection rule inferred.
- B1/C — **proven:** conjugate-dual antiunitary mirror between oriented cut spaces, inverse-Gram sewing and double-mirror pivotal comparison.
- B2 — **negative:** arbitrary unitary self-duality need not square to a sign or act trivially on observables; exact rational witness (B1).
- D — **proven:** square defect (D2), centrality iff trivial observable action, and source-charge-corrected cut formula (D3).
- B3/E — **proven:** s_psi is a unitary cup-normalized L0 seam for every unitary psi; it generally differs from s_can.
- B4 — **negative:** canonical braided-seam Hermiticity is not conjugate-dual invariance, even for self-adjoint densities and connected non-pointed sites.
- F1 — **proven:** sharp_s=K_s^(-1) dagger K_s is the exact intrinsic Hermiticity involution, with explicit inverse bend.
- F extension — **negative:** sharp_s_can need not preserve or reverse ordinary composition, obstructing a fixed-tile-algebra reflection functor with the claimed fixed points.
- C1/G — **conditional:** whole-history RP follows from a compatible reflected pairing and the uniform local Schur certificate; automatic canonical-seam coherence is not proved.
- C2/H — **proven:** a positive compatible translated form yields a finite positive OS operator and a contraction after scalar normalization; the history-to-translated-form step is conditional.
- C3/I — **negative:** universal unitary temporal/spatial crossing fails for whole identity histories, before and after their natural OS support quotients.
- X1 — **proven:** exact pointed cocycle and braiding checks, including the non-braiding obstruction for nonzero Z3 H^3 class and a braided nonconstant coboundary.
- X2 — **proven:** exact self-dual non-pointed F-S and categorical Hermiticity checks, with all three mutation regressions detected.

## Layer tags

| Statement | Setting | Input data and declarations | Rung reached | Rung claimed |
|---|---|---|---|---|
| A, canonical seam | any | L1; O and standard spherical duals | finite ingredient →R3 | same; no R3 or R5 |
| C, oriented mirror/sewing | any | L0; oriented cut words | finite ingredient →R3 | same |
| D,E, defect and psi-seam | any | L0 plus typed unitary identifications, and named observable algebra | finite ingredient →R3 | same |
| B,F, reflection negatives/repair | any algebraically; full for intended untwisted RP | L0 with s, or L1 s_can | finite, no new tower rung | F3(b) refuted |
| G, spatial RP | full; chiral only with a supplied twist satisfying G1–G3 | L0 plus coherent reflected pairing, boundary and fixed h; L1 only supplies individual s_can | conditional finite →R3 | unconditional L1 whole-history RP not established |
| H, OS normalization | any | category-free; q0,tau and positive compatible q1 | finite →R3 | same |
| I, directional-transfer obstruction | periodic/full finite torus | L0, already symmetric L1 | finite negative | unitary crossing refuted |

No new R0 tower is built; no R1 limit state, R2 modes, R3 local conformal
theory, R4 fidelity, or R5 construction functor is reached. Naturality of
the seam alone must not be reported as R5. A chiral twisted variant must
specify the twist, cut comparisons and translated forms anew; none is
certified solely by the antiunitary mirror.

## What this gives the integration

CA-88's CA-92 row can split its data column precisely:
**the algebraic seam and bent-kernel/Schur compiler move from
“L0 + declared s” to “L1, s_can determined by the supplied braiding and
standard spherical duality.”** The formerly unsourced braiding–twist
formula is proved, with its sign, in §A. At L0, (E1) makes the
self-dual-site seam explicit instead of choosing multiplicity bases.

The **spatial RP interpretation and whole-history cell retain the
reflection certificate (G1),(G2)**. Braiding does not identify O with Obar,
does not force an arbitrary self-duality defect to be central, and does not
identify the conjugate-dual operation with sharp_s_can. The small braided
witness even excludes a same-tile-algebra functor of either composition
variance with that sharp as its reflection. The replacement datum is a
coherent family of typed cut identifications and reflected tile/boundary
maps satisfying (G1),(G2), with the appropriate square defects central;
one may need a different seam, a restricted tile grammar, or an explicitly
oriented mirror construction. These are microscopic declarations, not L3.

CA-92's finite OS step can drop an a priori contraction bound at a fixed
finite volume if q1 is positive and compatible: §H supplies normalization.
It still requires construction of that translated form from the same
history. The temporal/spatial unitary-crossing claim should be removed;
equality of closed-network contractions survives. No CA-88 cell moves up
a target rung, and CA-80's temporal positivity results are unchanged.

## Open problems

1. **Canonical-seam graph coherence lemma.** Specify an orientation-changing
   operation on entire cut diagrams, including charge and flux boundaries,
   whose local adjoint pairing is K_s_can and prove (G1),(G2). If its
   restriction is a same-algebra (anti-)functor, §F's witness obstructs it;
   any successful version must say exactly how it changes the composition
   direction, boundary identifications, seam, or allowed tile grammar.
2. **Coherent self-duality lemma.** Characterize families of identifications
   for which every relevant word defect z_W is central and the induced
   seam has the required adjoint identity. Centrality is necessary and
   sufficient for the observable square, not sufficient by itself for RH.
3. **Translated-strip lemma.** Construct a shift-closed V and q1=q0(tau·)
   from the same periodic brick history and prove q1≥0. §H then supplies
   the finite positive transfer; a uniform normalization and a declared
   ground-state/vacuum remain separate questions.
4. **Continuum lemma.** Obtain compatible limits of reflected forms,
   semigroups, local observables and covariance identities. Finite RP and
   the seam's naturality alone imply none of R1–R5.

## Examples table

| Instance (checks only) | Explicit datum and finding |
|---|---|
| Unit multiplicity corner of every C | O=1⊕1, psi=[[3/5,−4/5],[4/5,3/5]] gives noncentral square (B1). With psi=1 and flip seam, h=Y⊗Z−Z⊗Y is self-adjoint and conjugate-dual invariant but has non-Hermitian K; g=Y⊗1+1⊗Y gives the converse failure. `core_output.txt`. |
| Vec_Z3^omega, nonzero cocycle class | zeta=exp(2πi/3), omega_p(a,b,c)=zeta^(p a floor((b+c)/3)), p=1,2, O=1+g. Product_b omega(1,b,1)=zeta^p proves nonzero class; the two hexagons require r(1,1)^3=zeta^p=zeta^(−p), impossible. Thus this is L0 with a declared seam. Both snakes, all six allowed tile units, F2 and F1 pass. g is non-self-dual, so no ± self-duality sign is assigned. `pointed_output.txt`. |
| Braided nonconstant Z3 coboundary | omega(a,b,c)=zeta^(abc), beta(a,b)=zeta^(a b²), r(a,b)=zeta^(b a²−a b²+a b), O=1+g. Both hexagons pass; s_can has phases (1,1,zeta,zeta) on the ordered mixed-port inputs (00,01,10,11), followed by flip. This checks nontrivial associator phases with actual L1 data. `pointed_output.txt`. |
| Braided Z3, same composition obstruction in the preceding coboundary or trivial-associator gauge | In basis (00,01,10,11), A=E_(01,10), B=E_(10,01), AB=P_01. Exact computation gives sharp(A)=A, sharp(B)=zeta² B, sharp(AB)=P_10. Hence neither composition variance is possible. For trivial omega take r(a,b)=zeta^(ab); both hexagons and the canonical cup equation are checked. |
| Rep^dagger(Q8), self-dual non-pointed V | G generated by i diag(1,−1) and U=[[0,1],[−1,0]], order 8; V is irreducible of dimension 2. psi=U is antisymmetric: nu_V=−1, but J²=+1 on Hom(V,V). On connected O=1+V, put b=ket(00), v=ket(12)−ket(21), h=i(bv†−vb†). It commutes with every G action, is self-adjoint and conjugate-dual invariant; K_s_can(h)†=−K_s_can(h)≠0. `nonpointed_output.txt`. |
| Identity history in every C's multiplicity corner | d=N=M=2, h=0. T_t=I_4 while T_x=vv†, v=(1,0,0,1); spectra {1,1,1,1} and {2,0,0,0}, with equal torus contraction 4. `core_output.txt`. |

## Sources used

Ground truth (all local; no network):

- **[P]** `references/text/PenneysUnitaryFusionCategories.md:118–135`
  (simple objects/semisimplicity), `:145–148` (dagger), `:219–237`
  (orthogonal sums), `:259–288` (associator direction and cocycle categories),
  `:290–294,319–323` (unitary graded and representation categories),
  `:398–430` (graphical calculus, oriented duals, snakes, adjunction),
  `:682–708` (dual functor and tensorator), `:917–935` (self-duality and
  the simple F-S sign), `:992–1030` (unitary spherical duality/pivotal
  structure, positive traces and direct sums), `:1032–1047` (raw-cup F-S
  convention). Registered in `references/manifest/SOURCES.md:35,57`
  and `references/category-theory/SOURCES.md:115–147`.
- `literature/md/2201.00192/2201.00192.md:264–268`: Drinfeld morphism
  and its typed relationship to pivotal structures; used in (A4).
- **RSW:** `references/category-theory/RowellStongWang2009Classification/source/RSWfinal3.tex:2311–2314`:
  R_1^(aa)=nu_a theta_a^(-1), used solely to align the named twist/FS
  convention; §A's general proof does not import model R-symbol values.
  Registration: `references/category-theory/SOURCES.md:27–112`.
- `references/cft/AasenFendleyMong2020/source/_fusion_categories_and_diagrammatics.tex:175–190`:
  its simplifying assumptions include self-duality, multiplicity-free
  fusion, FS=+1 and trivial bending phases; `:251–265`: dagger gluing;
  `:353–380`: FS and gauge-dependent bending phases. These passages
  explain why its convenient unoriented diagram rules cannot prove F3 for
  arbitrary C without tracking the omitted data. Registration:
  `references/cft/SOURCES.md:74–122`.

Established repository dependencies and claim boundary:

- `report/sections/80_lattice_sewing_and_fidelity_certificate.tex:70–125`:
  Lemmas 80.1–80.5, exact leg-cut sewing and temporal positivity.
- `report/sections/86_spacetime_trotter_dictionary.tex:61–110`: linear
  history grammar and its finite tensor contraction, used in §I.
- `report/sections/88_layered_targets.tex:21–113,233–254`: data/rung grid
  and round-2 verdict placement; `CONVENTIONS.md:1524–1543,1577–1605`:
  tags, parity distinction, spatial seam.
- `report/sections/92_spatial_seams_and_reflection_positivity.tex:53–79`:
  oriented seam and previous existence result; `:81–149`: K_s,
  conditional one-tile/multi-tile results and Schur criterion;
  `:153–177`: unit-multiplicity formula and flip Hermiticity;
  `:181–205`: finite OS and directional-transfer boundary;
  `:226–240`: the original coherence proposal.
- `explorations/2026-10-22-astra-r2/E3-reflection-positivity/NOTE.md:14–55,122–214,286–362`:
  original conventions and conditional statements (its old layer tags
  and initial refutation wording are superseded by the review).
- Same directory `REVIEW.md:67–147,166–184,236–254` and
  `INTEGRATION.md:47–136`: corrected round-2 interpretation, unsourced
  canonical-seam remark and target for this round.

New claims are proved in numbered steps above. Category-specific formulas
not quoted from a source are constructed and checked exactly in checks/;
the raw outputs and provenance manifest identify their producing scripts.
