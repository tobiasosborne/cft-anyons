# H2 — Finite lattice cells: sewing, Ward defects, and deformation identities

Started 2026-10-27 13:09 UTC. Initial ledger written before the ten-minute deadline.
Scope: this note and `checks/` only; no network, commits, or repository-wide changes.

## Statement under investigation

**Verdict: H2 as an automatic full-system assertion is false; an explicit
finite equality complex and corrected Ward calculus are proved below.**
For arbitrary unitary fusion C and pointed `(O,eta)`, fixed-network cells sew
exactly, and genuine differential Ward errors obey the product rule. Dyadic
comparison instead obeys a twisted rule. The literal same-cut anisotropy
commutator equation forces h=0. A nontrivial linear two-site system requires
a separately declared response and frozen generator; actual KS currents
need the associator-sensitive three-site placement algebra.

For every declared finite lattice equality presentation with the compatible
operations below and an exact solution, (C.1)–(C.6) supply explicit off-shell
identities. They prove `D_2 D_1=0` and the formal deformation/obstruction
interpretations of H1/H2. Reflection positivity remains a cone constraint;
canonical-seam whole-history coherence and geometric Ward-to-KS matching
are not inferred. Section D proves the conditional implication into
CA-89/95 and identifies every additional estimate. No nontrivial conformal
tile solution or continuum theorem is obtained.

**Layer tags:** finite cell statements: any setting, L0 plus the microscopic
declarations below, finite `->R2, ->R3`, no continuum rung claimed. Canonical
seams require L1. Dyadic lifts require the actual CA-90/96 transport data.
The KS transfer implication uses the declared periodic/full setting, one
chiral family at a time, and the same positive quotient/state/refinement.
Open boundaries use a fixed finite semisimple unitary C-module category;
boundary choice is not a research question here.

**Pillar served:** P3 on P2: put local equations and their honest compatibility
identities on the C-evaluated histories of the indefinite-number P1 carrier.
The final conditional implication connects these defects to P4.

## Scoped conventions, declared before use

The task forbids editing `CONVENTIONS.md`; all additional notation is scoped
here. Existing conventions (r), (ak)–(aw) are retained. In particular
`h=sum c_alpha D_alpha`, `T(t)=exp(t h)`, `k=-h/v` (`v=1` unless declared),
and `J_j=i[k_j,k_(j+1)]`. The two central constants remain distinct.
The residual requested in the brief is `R=dZ-B_out Z+Z B_in`; it has the
opposite connection sign to LC-1's `W=dZ+B_out Z-Z B_in`. We will never
identify these without replacing the connection by its negative.
Fixed-network recutting, infinitesimal parameter differentiation and
discrete refinement are distinct operations. No geometric equivalence of
different weighted graphs is assumed. Positivity is an inequality.

Write `A_n=End_C(O^n)` with left-associated words. A cut means its **whole
ordered categorical word**, with charge/fusion junctions retained; four sides
are not four independent tensor factors of a constrained Hilbert space.
`nabla X=dX-B_out X+X B_in`; its underlying connection is `C=-B`, with
curvature `F_C=-dB+B wedge B`, not `-F_B`. Differential parameters are
ordinary real/complex chart variables, and `epsilon` denotes a separate
formal deformation parameter. Taylor jets have factorial denominators in
the displayed exponential expansions; formal deformation coefficients do not.
For the checks, matrix vectorisation is column-major; the pointed rank-two
three-site basis is the left-associated ordered occupation-word basis.

## A. Typed lattice grammar and the extent of exact sewing

### A1. Typing and temporal sewing — proven

**Tags:** any setting; L0 + pointed O, unitary module category M and its
coherence, fixed oriented brick graph, tiles and cut bases; finite `->R3`.

**ASSUME** the declared M is finite semisimple and its C-action is unitary.
For simple boundary objects a,b and ordered cut word W define

    V_i(W)=Hom_C(i,W),    H_ab(W)=Hom_M(b,W acting on a).

The formal opposite orientation carries the dual Hilbert space. No further
identification with a cut of dual categorical word is made without its
specified rigidity/module comparison and normalisation. A bulk cut carries
the CA-80 space `H(W)=direct-sum_i V_i(W)`. Rectangles and their subpatches
retain all four oriented words and every exposed fusion junction. Temporal
sewing is admitted along tile legs; a straight cut through a tile retains
that tile as an explicit interface tensor, as in A2. Elementary exact weights
are those of CA-78 Proposition 78.2, not `t c_alpha` truncations.

**PROVE** categorical C0 and C2/C3 for regroupings of this fixed graph, and
identify its boundary channels without assuming continuum carriers.

<1>1. Choose isometries `u_i,mu:i->W` resolving `1_W`. Then

    direct-sum_i V_i(W) tensor Hom_M(b,i acting on a) -> H_ab(W),
    u tensor q |-> (u acting on 1_a) q

is unitary. **BY** orthogonality: the inner product of two images is the
product inner product; the inverse components are `(u^dagger acting on 1_a)f`;
their recombination is f because `sum u u^dagger=1_W`. These are the unitary
direct-sum rules in Penneys:219–237 and isometry inner product at :528–530.

<1>2. Dagger identifies `Hom_M(b,i acting on a)` with the conjugate of
LC-1's `M_ab^i=Hom_M(i acting on a,b)`. Thus the reversed cut has the linear
channel presentation `direct-sum_i M_ab^i tensor V_i(W)^*`. In the regular
module M=C, a=1, b=i, the original H_ab(W) is `Hom_C(i,W)=V_i(W)`;
its reversed dual is `V_i(W)^*`. **BY** <1>1 and dagger.
This specifies the orientation/dual in (a1); the finite `V_i(W)` are not
claimed to be the unknown continuum `V_i` of LC-1:25–39. The local internal-hom
adjunction is `literature/md/1905.04924/1905.04924.md:688–718`.

<1>3. Every history is a composite of supplied C-morphisms and module-action
morphisms. Changing a channel tree conjugates/transports coordinates by its
specified F/module-F map, so forbidden channels remain absent. **BY** the
definition of evaluation, coherence of the supplied category/module, and
Penneys:396–398. Weight factors do not change types. This is lattice C0.

<1>4. Temporal sewing inserts `U G^{-1} U^dagger=1` on the shared cut;
therefore `Z_(Q o P)=Z_Q Z_P`. Successive sewings are associative and their
finite sums can be regrouped. **BY** CA-80 Lemma 80.1 (:70–83), applied also
to the finite Hilbert spaces in <1>1. No new temporal-sewing theorem is assumed.
An F basis change uses the corresponding dual transformation `F^{-T}`.

<1>5. **QED.** This is C3 for decompositions of one weighted graph only.
Different brick graphs at the same outer rectangle are different inputs
until an additional tile-move equation identifies them (LC-1:89–99).
For example a swap of overlapping gates would require `[h_12,h_23]=0`
at order `t^2`, since
`e^(t h_12)e^(t h_23)-e^(t h_23)e^(t h_12)=t^2[h_12,h_23]+O(t^3)`.
**BY** multiplication of the second-order Taylor expansions. Associator
coherence does not impose this dynamical equation.

**C1 boundary.** Identity maps and dagger reflection are literal finite
ones. Temporal RP and positive palindromic transfers are CA-80:87–115.
For fixed width an energy subtraction makes a positive self-adjoint collar
contractive; a finite spectral sum is trace class. A brick sweep as a function
of step size need not be a one-parameter semigroup. No spatial RP, common
null quotient, or continuum collar bound follows from A1.

### A2. Spatial seam: recutting versus coherence — proven, with a conditional extension

**Tags:** any; L0 + duals, an algebraic seam s and a specified cut grammar;
L1 suffices to choose the canonical s; finite `->R3`.

**ASSUME** `W_+=O tensor Obar`, `W_-=Obar tensor O`, unitary
`s:W_+->W_-`, `s coev_O=ev_O^dagger`, fixed before the tiles. Use
`K_s(T)=s^dagger rot(T)` with exactly CA-92 (92.1), including its associators.
For longer cuts choose ordered tensor products and explicit associators;
no unprovided crossing is inserted. A crossing tile belongs once to the
interface strip, rather than being silently deleted from both rectangles.

**PROVE** fixed-network spatial contraction is exact, state the precise
additional requirement for a presentation-independent seam grammar, and
exclude an automatic same-product interpretation of K_s.

<1>1. Bending/unbending is a linear bijection of the typed morphism spaces.
Inserting it at a crossing and undoing it at the matching external ports
leaves the tensor unchanged. Likewise `s s^dagger=1` cancels at a paired
internal interface. **BY** CA-98 Lemma 98.5 (:122–135), the snakes, and
unitarity. Spatial gluing is a finite contraction including `rot(T)=sK_s(T)`;
it is not `Z_Q tensor Z_P` without that interface.

<1>2. A basis change of an interface merely replaces its resolution of the
identity. Summation over all shared labels commutes with other finite sums.
Consequently every order of contraction of the same interface-decorated
network gives the original `Z_P`. **BY** <1>1 and A1<1>4. This holds for
every algebraic s when its inverse/adjoint and the port transports are retained.
It uses no reflection-positivity assumption and no tensor-factorisation of H.

<1>3. More generally let `V_gamma,d` identify a presented cut with a fixed
reference cut. Demand, for every elementary recutting/rebracketing,

    V_gamma,d' U_(d' <- d) = V_gamma,d,
    U_reverse=U_forward^{-1},
    U_(d'' <- d') U_(d' <- d) = U_(d'' <- d).

Also require compatibility with each independently prescribed contraction:

    V_out C_d = C_reference (tensor of the V_in),             (A.1)

with all actual dual ports and fusion vertices included. Tensoring disjoint
cuts uses the specified associator and the tensor product of their identifications;
this notation does not factor the fusion-constrained carrier. If contractions
are defined by transport, (A.1) is automatic. These equations are sufficient for decomposition
independence: cancel adjacent transports and use <1>2. They are necessary
on the admitted full-span boundary probes: any two resulting interface maps
have equal matrix elements on a basis, hence are equal. **BY** finite linear
algebra. If the admitted probes span only a subspace, necessity holds only
on that subspace. This is an explicit, finite test for a **finite** grammar.

<1>4. For one algebra transported through a bijection K, the product that
always works is

    C_s(X,Y)=K_s(K_s^{-1}(X) K_s^{-1}(Y)),   unit = K_s(1).

It is associative because both bracketings equal `K_s(abc)`. A different
physical spatial gluing must transport its actual typed tensor contraction,
not assume this product is ordinary matrix multiplication. **BY** substitution.
For a rectangular grammar this formula is used only at types where the
indicated composition is defined; the general rule is the same transport of
the typed multilinear contraction.

<1>5. In general K_s cannot preserve the temporal matrix product. For every
allowed C,O, `K_s(1)=u u^dagger=d_O P`, where `u=coev_O` and P projects onto
`u/sqrt(d_O)` in the faithful cut representation (CA-92:128–139). If the cut
space has dimension greater than one, this has rank one and is not its
identity. A surjective multiplicative linear map of unital algebras sends
the identity to the identity: its image acts as a two-sided identity on the
whole target. Contradiction. **BY** CA-98's bijectivity and the displayed rank.
This is a general obstruction, also for canonical seams. It does not obstruct
the correctly transported, direction-dependent operations in <1>1–4.

<1>6. CA-98 Theorem 98.1 supplies a natural algebraic s at L1; it does not
prove its G1/G2 reflection/coherence hypotheses (:162–180). Spatial RP requires
those hypotheses plus `K_s(T)>=0` on each relevant charge block (CA-92:99–120).
For reflected multi-tile patches the proven conclusion is conditional on
their compatible factorisation. **QED** for fixed-network recutting; the
automatic geometrically reflected canonical-seam extension remains conditional.

## B. Ward propagation and the single-tile equation

### B1. Differential product law and the interface term — proven

**Tags:** any; L0 + finite typed cells, differentiable parameter and declared
cut connections (standard KS when defined); finite `->R2, ->R3`.

**ASSUME** `Z_P:E_0->E_1`, `Z_Q:E_1->E_2`, one derivation d on their
parameter families, and the same B_1 on the shared cut. Define
`R_P=dZ_P-B_1 Z_P+Z_P B_0`, likewise for Q and Q o P.
**PROVE** the brief's propagation law in precisely this setting.

<1>1. Expand

    R_Q Z_P+Z_Q R_P
      =(dZ_Q)Z_P+Z_Q(dZ_P)-B_2 Z_Q Z_P+Z_Q Z_P B_0.

The middle `Z_Q B_1 Z_P` terms cancel. **BY** distributivity.
<1>2. `d(Z_Q Z_P)=(dZ_Q)Z_P+Z_Q(dZ_P)` and A1 give
`R_(Q o P)=R_Q Z_P+Z_Q R_P`. **BY** Leibniz. This is LC-W/CA-80.6 with
connection `C=-B`. It is valid whether or not any residual vanishes.
<1>3. For a parameter-dependent spatial contraction C, define its connection
defect explicitly by

    F_C^Ward(X,Y)=nabla[C(X,Y)]-C(nabla X,Y)-C(X,nabla Y).

Then the propagation law gains exactly `F_C^Ward(Z_Q,Z_P)`; in constant
frames this includes the derivative of the seam and inverse Gram. In
particular `dG^{-1}=-G^{-1}(dG)G^{-1}`. **BY** differentiating the contraction
(LC-1:184–186; LC-10:126–134). It vanishes only for a covariantly constant
pairing, not merely because the seam is unitary. **QED.**

### B2. Dyadic comparison is a twisted, finite product law — proven negative and repair

**Tags:** any finite width; L0 + actual CA-90 relative transport or CA-96
blocked transport, refined cells and cut identifications; existing R0^u used,
finite `->R2`. Applying it to periodic KS requires a supplied periodic-compatible
extension on the same system; the open lift alone does not supply one.

**ASSUME** a unital multiplicative lift `alpha:A_l->A_2l`, and a chosen
refinement of each graph **in the endomorphic bulk-cut grammar**, so
`Z_P in A_l`, `Z'_P in A_2l`. Put `E_P=Z'_P-alpha(Z_P)`. This has a type, unlike
`alpha(Z_P)-Z_P` before embedding the coarse operator.
**PROVE** the exact law and show the ordinary differential law is false.

<1>1. Exact sewing at both scales and multiplicativity give

    E_(Q o P)=E_Q alpha(Z_P)+Z'_Q E_P
             =E_Q alpha(Z_P)+alpha(Z_Q)E_P+E_Q E_P.       (B.1)

**BY** adding/subtracting `Z'_Q alpha(Z_P)` in
`Z'_Q Z'_P-alpha(Z_Q)alpha(Z_P)`.
<1>2. The omitted `E_Q E_P` need not vanish: in every C choose scalar
cells `Z_P=Z_Q=1`, `Z'_P=Z'_Q=(1+a)1`. The exact composite defect is
`(2a+a^2)1`, versus `2a1`. These scalar cells are positive exact scalar
gates for `a>-1`. **BY** multiplication. This universal witness refutes the
ordinary law for finite dilation, independently of any F-symbol choice.
<1>3. Equivalently, for two algebra maps into a common algebra,
`Delta=alpha-beta` obeys `Delta(ab)=Delta(a)beta(b)+alpha(a)Delta(b)`.
For inter-scale cut maps J the typed defect
`E_P=Z'_P J_in-J_out Z_P` obeys
`E_(Q o P)=E_Q Z_P+Z'_Q E_P`. **BY** the same telescoping.
The generators of J, if it belongs to a differentiable family, are additional
data; alpha alone is not an infinitesimal KS coordinate action. **QED.**
The J formula applies to arbitrary typed/module-cut maps. Using alpha on
those maps instead requires a declared composition-preserving extension
to their entire retained morphism grammar; CA-90 does not supply it.

### B3. The one-tile jet and the exact boundary of linearity — proven

**Tags:** any; L0 + fixed basis of A_2, h=h^dagger, v, cut connections and
specified parameter variation; finite `->R2`. No conformality claim.

**ASSUME** `D_alpha D_beta=sum_gamma M^gamma_(alpha beta) D_gamma`,
`h=sum c_alpha D_alpha`, and initially t-independent `B_+,B_-` in A_2.
This last assumption describes an isolated two-site test. Genuine bulk
standard KS currents are treated below and normally live in A_3.
**PROVE** the exact first jet, its equations, and the category dependence.

<1>1. For the literal variation `d=partial_t`,

    R_T(t)= h-B_++B_- + t(h^2-B_+h+hB_-) + O(t^2),        (B.2)
    (R_0)_gamma=c_gamma-b^+_gamma+b^-_gamma,
    (R_1)_gamma=sum_alpha,beta M^gamma_(alpha beta)
                 (c_alpha c_beta-b^+_alpha c_beta+c_alpha b^-_beta).

**BY** `T=1+t h+t^2 h^2/2+O(t^3)` and `partial_t T=h+t h^2+O(t^2)`.
For t-dependent B the extra coefficient is `-dot B_+(0)+dot B_-(0)`.
Thus differentiating a first-order gate truncation is insufficient to find
the residual's first-order coefficient.

<1>2. On identically framed incoming/outgoing cuts with the same standard
density, `B_+=B_-=B(c)` and `R_0=h`. Therefore

    R_T=O(t) iff h=0 iff R_T=O(t^2) iff R_T is identically zero.  (B.3)

In a basis this is precisely the linear system `c_alpha=0`. Its coefficient
matrix is the identity. **BY** <1>1, even when B depends on c. This is the
strongest literal two-site linear system in the brief, but it selects only
the zero tile generator. For unequal B, (B.2) is generally a polynomial
system: after its constant equation, the linear coefficient also imposes
`[B_-,h]=0`. No unrestricted nontrivial linearity theorem follows.

<1>3. This failure comes from the chosen variation. A collar obeys
`partial_t T=hT=-v k T`, not an isospectral commutator equation. In the
brief's sign convention it is horizontal with `B_out=h, B_in=0` for that
one-sided boundary displacement; this differs from assigning the same KS
connection to both cuts. For two sewn collars moving their lengths
independently, their coordinate vector fields and cut connections must
also be specified compatibly before applying B1. **BY** direct differentiation
and LC-1:108–120. Rescaling to `t partial_t` with equal B gives first term
`t(h-[B,h])`; for Hermitian h its vanishing still forces h=0, since
`Tr(h[B,h])=0` but `Tr(h^2)>0` for h nonzero in the faithful finite carrier.

<1>4. A genuine, **different** linear single-algebra system is available
after prescribing a metric variation `partial_q h=L(h)`, with L a fixed
linear operator independent of h, and holding the common B fixed
independently of h. At q=0,

    partial_q T-[B,T]=t{L(h)-[B,h]}+O(t^2),
    A_(gamma alpha)=L_(gamma alpha)
       -sum_beta b_beta (M^gamma_(beta alpha)-M^gamma_(alpha beta)),
    A c=0.                                                (B.4)

**BY** CA-80.6's Duhamel identity and coefficient comparison. Hermiticity
adds real-linear equations `h=h^dagger`. The coefficient matrix needs L
and B as well as M; it is not determined by M alone. This frozen-generator
fragment is not C7 for varying microscopic h. In fact (B.4) is equivalent
to the exact Ward identity at q=0 for every t: if `L(h)=[B,h]`, Duhamel gives

    partial_q e^(t h)=integral_0^t e^((t-u)h)[B,h]e^(u h)du
                     =[B,e^(t h)],

since the integrand is `partial_u(e^((t-u)h) B e^(u h))`. Conversely
differentiate the exact identity at t=0. No identity at other q is claimed
without the same tangent equation there.

<1>5. Every expression in (B.2)/(B.4) uses only the pointed *algebra data
`(A_2,1,dagger;B_+,B_-,L)` and its structure constants. Under a *algebra
isomorphism preserving these declarations it transports identically.
Indeed `A_2=direct-sum_a M_(m_a)(C)` with
`m_a=dim Hom_C(a,O tensor O)` (CA-78:44–53), and in isometry matrix units
`E^a_mu,nu E^b_rho,sigma=delta_ab delta_nu,rho E^a_mu,sigma`.
No associator occurs in this multiplication. **BY** the displayed product.
Diagrammatic two-site bases may encode F or pivotal normalisations in the
change of coordinates; that is not extra invariant information beyond the
specified algebra and marked basis. Dependence can also enter through a
chosen B or L, which is why the preservation clause is essential.

<1>6. The actual standard current uses the two overlapping placements

    A_alpha=D_alpha tensor 1,
    C_beta=F^dagger(1 tensor D_beta)F,
    J_1=(i/v^2) sum_alpha,beta c_alpha c_beta [A_alpha,C_beta].  (B.5)

**BY** CONVENTIONS (ao),(ap), CA-78:44–53, and `k=-h/v`.
Consequently a bulk chiral KS density includes a quadratic, three-site
operator; it cannot in general be an element of A_2. Its coefficients
require the marked embeddings into A_3, hence generally the associator,
in addition to the abstract multiplication of A_2. The commutator of this
KS generator with h can be cubic in c. Explicitly, write
`H_A=sum c_alpha A_alpha`, `H_C=sum c_beta C_beta`. For the single standard
local density `B=k_1-J_1=-H_A/v-(i/v^2)[H_A,H_C]`, embedded with the tile,

    partial_q e^(t H_A)-[B,e^(t H_A)]
      =t{L(H_A)+(i/v^2)[[H_A,H_C],H_A]}+O(t^2).             (B.6)

This is an A_3 polynomial with cubic coefficients; multiplying B by its
declared Fourier/mode factor multiplies that commutator term accordingly.
It exhibits why the nontrivial KS equation is not the frozen linear map
(B.4). The actual mode sums retain the remaining neighboring insertions.
F-symbol gauge changes transport
all marked maps together; a genuine change of associator is a different
input. **QED.** (B.3) is a literal negative, (B.4) is the strongest frozen
linear repair, and (B.5) states the actual finite nonlinear C7 interface.

## C. Equality complex and positivity

### C0. A genuinely finite presentation is an additional declaration

**Tags throughout C1–C3:** any setting; L0 + A/B's microscopic data, a fixed
finite graph/overlap and coordinate-jet presentation, chosen gauges and an
exact solution; finite `->R2, ->R3`. L1 is used only if s is canonical.

Fix finitely many cells, subcells and composable pairs/triples at the cutoffs
being compared. Every identity used below must retain all its composites
and parameter jets. For example a Ward identity through coordinate order J
uses amplitudes/sewing residuals through J+1; curvature rows consume another
derivative. Retain higher jets as variables and omit identity rows that
would demand unavailable jets. One can instead work with genuine analytic
families, but their whole Taylor space is not finite-dimensional.

Thus finite Hilbert spaces alone do not make all C0–C7 a finite presentation
or a decidable existence problem (LC-1:197–228). Exact linear algebra is
effective when the retained coefficient field and its equality operations
are supplied; arbitrary real-number oracles are not implicitly available.

For explicit nonzero equation rows, introduce independent composite
amplitudes Z and impose sewing. If every Z is defined as a contraction of
the elementary tiles, sewing is an identity for all h and its Jacobian is
zero. It is then only the Ward/stress/refinement equations that can select
dynamics. Both presentations describe the same fixed-network evaluation
once the auxiliary Z variables have been eliminated.

### C1. Explicit equation and identity operators — proven for the declared equality system

**ASSUME** a finite real analytic chart x for Hermitian tile coefficients,
retained weight/amplitude jets, seams, and any declared metric-response data.
Keep C, F and module coherence fixed as morphisms. A seam chart may be
`s=s_0 exp(v)`, `v^dagger=-v`, `v coev_O=0`; this enforces its unitary/cup
conditions. Independent weight coordinates obey the exact gate constraints
`G=T-exp(t h)=0` (or their retained jets); h and w are not independent physics.
`B=KS(h)` includes every actual placement, velocity, smearing and subtraction
chosen in the prescribed finite density formula. If an independent geometric
B is retained, include `B-KS(h)=0` among the equations.

Use the following equality residuals wherever the indicated operation is
in the declared grammar; RP is deliberately separate:

    S_(g,f)=Z_gf-Z_g Z_f,                 R_f=nabla Z_f,
    S^x_(g,f)=Z_gf-C_s(Z_g,Z_f),
    E_f=Z'_f-alpha(Z_f),
    A_C(X,Y,Z)=C_s(C_s(X,Y),Z)-C_s(X,C_s(Y,Z)),
    F_C^Ward(X,Y)=nabla C_s(X,Y)-C_s(nabla X,Y)-C_s(X,nabla Y),
    V_f(X,Y)=F_C,out(X,Y)Z_f-Z_f F_C,in(X,Y).

The alpha/E rows are restricted to the bulk endomorphism grammar of B2;
general cut maps require its J version or the declared functorial extension.
Both S and S' (the fine-scale sewing residuals) are retained equation slots.
Here X,Y in V are coordinate vector fields; arguments of A_C and
`F_C^Ward` are arbitrary typed amplitudes. The letter C in `F_C,out` means
connection `-B`, not the spatial product C_s. Tensor notation is evaluated
on bases of its finite argument spaces. Impose A_C=0 only when the two
spatial bracketings describe the same admitted graph; for transported
composition it vanishes identically. Impose `F_C^Ward=0` only for genuine
homogeneous coordinate directions. For modulus insertions replace it and
R by their inhomogeneous versions with the insertion rule included.
Also include gate, unit, adjoint, and specified microscopic matching
equalities. Call their combined map `mathcal E(x)`.

**PROVE** explicit operators `D_1=d mathcal E_(x0)` and `D_2` satisfy
`D_2 D_1=0` at any exact solution `mathcal E(x0)=0`.

<1>1. For a variation `(dot h,z=dot Z,b=dot B,dot s)`, the equation rows are

    dot G=dot T-integral_0^t e^((t-u)h) dot h e^(u h) du,
    dot S_(g,f)=z_gf-z_g Z_f-Z_g z_f,
    dot R_f=nabla z_f-b_out Z_f+Z_f b_in,
    dot S^x_(g,f)=z_gf-C_s(z_g,Z_f)-C_s(Z_g,z_f)-dot C_s(Z_g,Z_f),
    dot E_f=z'_f-alpha(z_f)                 [alpha fixed],
    dot K_s(T)=-s^dagger dot s K_s(T)+K_s(dot T).

For variable alpha add `-dot alpha(Z_f)` and its multiplicativity/naturality
equations. We use fixed alpha below. `dot A_C`, `dot F_C^Ward`, `dot V_f`
are their displayed finite expressions differentiated by the product rule;
in particular `dot F_C=-d b+b wedge B+B wedge b`. In KS rows,
`dot J_j=i([dot k_j,k_(j+1)]+[k_j,dot k_(j+1)])`; therefore dot B is determined
by dot h and the declared scalar data, rather than independently adjusted.
**BY** Duhamel (CA-80.6), differentiating `s^dagger s=1`, and the product rule.
These formulas, evaluation on bases and jet coefficient extraction specify
every entry of D_1.

<1>2. Four **off-shell** identities, holding for all x rather than only x0,
are the following. Their zero right-hand sides do not assume any equation:

    I_assoc = S_(h,gf)+Z_h S_(g,f)-S_(hg,f)-S_(h,g)Z_f =0;       (C.1)
    I_Ward  = R_gf-R_g Z_f-Z_g R_f-nabla S_(g,f) =0;            (C.2)
    I_ref   = E_gf-E_g alpha(Z_f)-Z'_g E_f-S'_(g,f)
                        +alpha(S_(g,f)) =0;                  (C.3)
    I_curv  = nabla_X R_f(Y)-nabla_Y R_f(X)-R_f([X,Y])
                        -V_f(X,Y) =0.                        (C.4)

<2>1. Expanding (C.1) yields each of `Z_hgf`, `Z_h Z_gf`,
`Z_hg Z_f`, `Z_h Z_g Z_f` twice with opposite signs. **BY** associativity
of actual matrix composition and a common geometry/line chart.
<2>2. Substitute `S=Z_gf-Z_g Z_f` into (C.2), apply B1, and cancel.
**BY** the ordinary differential product rule, including shared B.
<2>3. Substitute `E=Z'-alpha Z`, `S=Z_gf-Z_gZ_f` into (C.3).
Every fine/coarse product cancels using `alpha(Z_gZ_f)=alpha(Z_g)alpha(Z_f)`.
**BY** multiplicativity, not a nonexistent infinitesimal dilation.
<2>4. Expand the two induced covariant derivatives in (C.4): the second
derivatives cancel; the remaining left/right actions are `F_C,out Z_f`
and `-Z_f F_C,in`. **BY** the defining curvature formula, also CA-80.6 and
LC-2:161–184. In a single coordinate direction this row is vacuous.

<1>3. The corresponding spatial identities are

    S^x_(h,gf)+C_s(Z_h,S^x_(g,f))-S^x_(hg,f)
      -C_s(S^x_(h,g),Z_f)-A_C(Z_h,Z_g,Z_f)=0;                 (C.5)
    R_gf-C_s(R_g,Z_f)-C_s(Z_g,R_f)-nabla S^x_(g,f)
      -F_C^Ward(Z_g,Z_f)=0.                                 (C.6)

**BY** expansion: the first four terms of (C.5) leave
`C_s(C_s(Z_h,Z_g),Z_f)-C_s(Z_h,C_s(Z_g,Z_f))`; (C.6) is precisely the
definition of the pairing defect. These rows include seam variations and
prevent the false inference that a unitary seam is automatically parallel.
Typed associator/port transports are included in C_s before this expansion.

<1>4. Regard (C.1)–(C.6), with the admitted jet projections, as

    mathcal K(x) mathcal E(x) identically = 0.

They are linear in equation residual slots; their coefficients depend on x.
Unused gate, dagger or KS residual slots have zero coefficient in these rows.
At x0 define `D_2=mathcal K(x0)` into the finite direct sum of these identity
slots. For example its temporal rows, acting on residual variations `(s,r,e,v)`, are

    s_(h,gf)+Z_h^0 s_(g,f)-s_(hg,f)-s_(h,g) Z_f^0,
    r_gf-r_g Z_f^0-Z_g^0 r_f-nabla^0 s_(g,f),
    e_gf-e_g alpha(Z_f^0)-Z'_g^0 e_f-s'_(g,f)+alpha(s_(g,f)),
    nabla_X^0 r_f(Y)-nabla_Y^0 r_f(X)-r_f([X,Y])-v_f(X,Y).

The spatial rows are (C.5)–(C.6) with one residual slot and all other
coefficients at x0, including `-a_C(Z_h^0,Z_g^0,Z_f^0)` and
`-f_C(Z_g^0,Z_f^0)`. Thus D_2 is explicit, not a computed arbitrary left nullspace.

<1>5. Differentiate the off-shell identity in any tangent direction v:

    (d mathcal K[v]) mathcal E(x0)+mathcal K(x0) D_1 v=0.

The first term vanishes at an exact solution. Hence `D_2 D_1=0`.
**BY** <1>4 and `mathcal E(x0)=0`. **QED.** Adding further equality rows
with zero identity coefficients preserves this conclusion, but does not
claim all identities of the larger presentation have been found.

**What fails without the correction.** If finite refinement E is assigned
the ordinary differential sewing identity, its off-shell remainder is
`E_g E_f` by (B.1). If a nonparallel seam is assigned the Ward identity
without `F_C^Ward`, its remainder is precisely that tensor. Linearisation
at zero E can hide the former error: its first derivative vanishes, while
its second-order forcing survives. Finite dimension does not repair this.
Already the scalar residual `mathcal E(x)=x^2` at x0=0 has `D_1=0`.
Choosing `D_2=1` gives `D_2D_1=0` but for v=1 the quadratic forcing is
`b_2=1` and `D_2 b_2=1`. Thus left-null vectors of D_1 alone cannot justify
an H2 obstruction theorem; genuine off-shell identities are the separating
hypothesis. This scalar germ can be placed on the unit block in every C.

### C2. Gauge, first-order equality deformations and obstructions — proven

**ASSUME** C1 and the allowed gauge group of changes of orthonormal cut
bases/line frames, acting on all coherence/placement tensors in coordinates.
Only gauges preserving the microscopic ansatz, or transporting that ansatz
with its marks, are admitted. Arbitrary independent matrices on cuts do
not silently preserve a frozen numerical F presentation. Use gauges equal
to the identity at epsilon=0.
Require verified covariance of the **full** selected equality map under
this gauge group. In particular its Lie algebra must satisfy, on selected
KS rows,

    [u,B]+d u = d(KS)_h[dot h]

with any declared scalar/mark variations included. Constant compatible
frame changes transporting all KS marks are allowed; unrestricted
coordinate-dependent frame changes are not. For instance at h=B=0,
`U(q)=exp(q u)` gives B'=u while KS(U h U^{-1})=0. It does not preserve the
selected equality unless its extra frame-connection term is also declared.
**PROVE** a concrete three-step deformation complex and its precise H1/H2 meaning.

<1>1. For an infinitesimal cut gauge u, with `u^dagger=-u`, set

    (D_0 u)_Z = u_out Z-Z u_in,
    (D_0 u)_B = [u,B]+d u.

Transport seams, products and all other tensor indices by the same gauge.
On this preserving gauge algebra these follow by differentiating
`Z'=U_out Z U_in^{-1}` and
`B'=U B U^{-1}+(dU)U^{-1}`. Consequently each equality transforms covariantly
and is zero along the gauge orbit of x0. **BY** substitution in nabla and
tensor contractions (LC-2:194–205 with connection sign reversed).

<1>2. Differentiating that zero equality gives `D_1 D_0=0`. With C1 this is

    C^0=Lie(gauges) --D_0--> C^1=T_x0(chart)
         --D_1--> C^2=(equality residuals)
         --D_2--> C^3=(displayed identities) --> 0.            (C.7)

The last zero map is a truncation, not a theorem identifying all higher
relations. **BY** <1>1 and C1<1>5.

<1>3. Expanding `mathcal E(x0+epsilon v)` modulo epsilon² gives `D_1v=0`.
A first-order gauge changes v by D_0u. Thus

    H^1=ker D_1 / im D_0

classifies **formal first-order equality deformations modulo infinitesimal
gauge**. It need not be the tangent of a smooth moduli space or a set of
integrable solution curves. The base stabilizer may further act if gauges
not fixed at epsilon=0 are also quotiented. **BY** Taylor expansion.

<1>4. For `v in ker D_1`, put `b_2=(1/2)d²mathcal E_(x0)[v,v]`. Expansion gives

    mathcal E(x0+epsilon v+epsilon² w)
          =epsilon²(D_1w+b_2)+O(epsilon³).

Expanding `mathcal K(x0+epsilon v)mathcal E(x0+epsilon v)=0` to order epsilon²
gives `D_2 b_2=0`; the lower residual coefficients vanish. Therefore

    extension through epsilon² exists iff [b_2]=0 in
    H^2=ker D_2 / im D_1.                                  (C.8)

**BY** C1's off-shell identity and the definition of the quotient.
The same coefficient argument works at order n after an equality solution
through n-1: `D_1 x_n=-b_n`, `D_2 b_n=0`. Analytic convergence is not implied.
Gauge-related lower jets have corresponding extension problems by the
gauge action; at second order their obstruction classes agree under the
induced residual-space identification. **BY** applying the gauge to the
displayed truncated series and using covariance.

<1>5. **QED.** This H2 depends on the declared presentation and the proved
identity rows. Completeness of those rows is not needed for (C.8), since
vanishing means exactly membership in im D_1; it is needed for stronger
claims of canonical obstruction theory. This advances LC-3 §4/LC-10 FP-J
for the retained finite lattice equality system. It is not a complete
complex for analytic C0–C7 or their positivity hierarchy.

### C3. RP is a cone condition; the central CE class is a different invariant

**Tags:** RP: any, L0 + a declared positive quotient/seam factorisation;
CE: any, category-free finite Lie-action lift in that carrier; finite `->R3`.

**ASSUME** a Hermitian seam matrix K0>=0 and its kernel projection Q.
**PROVE** unrestricted RP deformations are not classified by the vector-space
cohomology (C.7), and give the regime where that cohomology remains applicable.

<1>1. A one-sided differentiable PSD path `K(t)=K0+tH+o(t)` satisfies
`QHQ>=0`: evaluate its quadratic form on ker K0, divide by t and let t down
to zero. These feasible first derivatives need not form a vector space;
at K0=0 they are exactly the PSD matrices, since `K(t)=tH` realizes each.
**BY** positivity. Hence they cannot be the kernel of a linear equation
operator in the original tangent variables, except after extra restrictions.
This is not confined to abstract matrices: in every C the allowed pointed
unit-multiplicity site admits `h=a Z tensor Z`, `Z=diag(1,-1)`, and the flip
seam. At any fixed tile time t>0 its exact bent gate is
`cosh(t a)|vec I><vec I|+sinh(t a)|vec Z><vec Z|`. The two vectors are
orthogonal, so its RP condition is exactly a>=0, while the temporal gate
is positive for either sign. **BY** `(Z tensor Z)^2=I`, expansion of the
exponential and CA-92:157–160's bending formula. Thus local RP already
gives a genuine one-sided cone of tile directions at h=0.

<1>2. Even a two-sided feasible derivative need not preserve RP along its
straight line. On any two-dimensional multiplicity subspace take

    K0=[[1,0],[0,0]], H=[[0,1],[1,0]].

Then `QHQ=0` but `det(K0+tH)=-t²`. The actual path
`[[1,t],[t,t²]]=(1,t)^T(1,t)` is PSD and has the same derivative.
**BY** the determinant and displayed factorisation. This witnesses the
need for second-order positivity information in the general matrix class;
it is not asserted to be the bent exponential of every tile family.

<1>3. On a fixed positive cut quotient, finitely many **strictly positive
seam operators** stay positive in a sufficiently small neighbourhood, by
`lambda_min(K0+H)>=lambda_min(K0)-||H||`. Thus, when every RP test is already
reduced to these seam operators by a proved factorisation, the equality
complex describes the local formal constraints and sufficiently short real
paths satisfying the equalities remain RP. A fixed-rank seam stratum also
has local smooth charts, but that rank restriction is extra data and still
requires the chosen quotient to be invariant under all operations.
**BY** the norm inequality and CA-80:87–104/CA-92:113–120. One must not demand
strict positivity of all probe Gram matrices: redundant probes force nulls.
This proves the claimed boundary, not integrability of arbitrary H1 classes.

**ASSUME NOW** a declared Lie algebra g and a finite-dimensional linear
lift `A:g->u(V)` implementing a Lie derivation action, with scalar defect
`[A_v,A_w]-A_[v,w]=i kappa(v,w) I`.
**PROVE** the precise relation, and non-identification, with central CE H2.

<1>4. The defect is a CE cocycle, scalar counterterms change it by CE
coboundaries, and its class tests removal/matching of an anomaly.
**BY** LC-2 Proposition 2 (:67–115), whose source is Schottenloher:2200–2264.
This is not (C.8)'s deformation obstruction: its arguments are Lie vector
fields and its coefficients are scalars, rather than the full equation space.

<1>5. There is an explicit compatibility row if this projective-lift problem
is adjoined. For arbitrary A and scalar kappa set

    F_A(v,w)=[A_v,A_w]-A_[v,w],
    T_A=F_A-i kappa I,    c_kappa=d_CE kappa,
    (d_A F)(u,v,w)=cyclic([A_u,F(v,w)]-F([u,v],w)).

Jacobi in End(V) and g gives `d_A F_A=0` by expanding the six commutators
and three iterated brackets. Since `[A,i kappa I]=0`,

    d_A T_A+i c_kappa I identically = 0.

**BY** substitution; this supplies another legitimate D_2 row at a projective
base, but no isomorphism between the two H2 groups. Even `d_A²=0` on general
coefficients requires the appropriate representation/central-curvature
hypothesis, not a name for the operator.

<1>6. In fact the exact finite-dimensional kappa above is a coboundary:
if d=dim V, tracing gives
`i d kappa(v,w)=-Tr A_[v,w]`, so for `a(v)=Tr A_v/(i d)`,
`kappa(v,w)=-a([v,w])=d_CE a(v,w)`. **BY** LC-2 Proposition 5 (:210–224).
Nontrivial Virasoro central charge must enter through controlled asymptotic
residuals/domains, not an exact finite-matrix nontrivial CE class. The
continuum conditional contact identification remains `c*=12 kappa_3`,
`c=24 b-12 kappa_1` (CA-89), with the two constants kept distinct. **QED.**

LC-5's existing mixed Hochschild/CE complex applies when a genuine Lie
derivation action and associative product are frozen as specified there.
It is not automatically the dyadic problem: B2 is a discrete comparison.
Its degree-two first-order deformation grading becomes degree one only
after an explicit shift; a degree-three obstruction interpretation would
additionally need the nonlinear compatibility identities (LC-5:160–167).
No second derivation or
Virasoro bracket is manufactured from the two available lattice operations.

## D. Conditional continuum implication

### D1. Accumulated cell defects imply W2 under the geometric identification — conditional

**Tags:** periodic/full, one chiral family at a time; L0 plus a declared
periodic microscopic realisation and positive quotient, all port transports,
coordinate/contact rules, states, controls and refinements; category-free
estimate once these are supplied; finite `->R2`, no rung reached here.

**ASSUME** finite positive quotients H_r with controls K_r>=1, and likewise
declared positive controls K_gamma>=1 on every intermediate cut appearing
below. All forms descend through nulls and all comparisons use the same
system. Assume N_r tends to infinity, so eventually N_r>|m+n| for each fixed
mode pair. Use (ar)

    |X|_(s,d)^(b<-a) = ||K_b^s X K_a^(-s-d)||.

Let geometric modes S, Fourier factors, `beta_N=2d_N(m)-d_N(m+n)` and contact
`z^(r)_mn` be exactly CA-89:58–61,123–131. The geometric hypothesis is a
finite sequence of sewn diagrams on these quotients whose endpoint
difference is the actual commutator `[S_m,S_n]`, up to an endpoint defect,
and whose transported contacts sum to `beta_N S_(m+n)+z^(r)_mn I`, up to
chart/exchange defects. This is CA-95 G1/G2, not a consequence of recutting.
In particular both insertion orders and the cylinder contact normalisation
must be identified; no plane contact is silently substituted.

Suppose their remaining Ward errors are the **actual** R_P of the supplied
coordinate/insertion rules, including the spatial pairing corrections and
the finite-comparison terms where required. After telescoping, assume the
typed residual terms have the explicit representation

    E_(r,m,n):=[S_m,S_n]-beta_N S_(m+n)-z^(r)_mn I
       =E_end+E_chart+E_exch+sum_i lambda_i A_i R_(P_i) C_i.   (D.1)

Here every A_i and C_i is a named finite port transport/attached cell
amplitude; no boundedness is inferred from the bare notation. They map
between the correct cut Hilbert spaces. For each fixed m,n,s assume

    q_r=|E_end|_(s,2)+|E_chart|_(s,2)+|E_exch|_(s,2)
        +sum_i |lambda_i| |A_i|_(s,0)
                    |R_(P_i)|_(s,2) |C_i|_(s+2,0) -> 0.    (D.2)

**PROVE** W2 of CA-89, with an explicit bound; then state the additional
hypotheses that give standard-KS A4 and A3.

<1>1. Telescoping the declared diagram sequence cancels internal diagrams.
The endpoint/contact hypotheses give (D.1), with the signs of residuals
absorbed in lambda_i. **BY** finite summation, exactly CA-95:62–77.
This is where the unproved geometric realisation enters, not into a norm estimate.

<1>2. Insert adjacent powers of the controls to obtain

    |A R C|_(s,2) <= |A|_(s,0) |R|_(s,2) |C|_(s+2,0).

For example the middle weights cancel as
`K_out^s A K_a^(-s) · K_a^s R K_b^(-s-2) · K_b^(s+2) C K_in^(-s-2)`.
**BY** submultiplicativity, i.e. CA-89 Lemma 89.2 with types retained.

<1>3. The triangle inequality in (D.1) gives `|E_(r,m,n)|_(s,2)<=q_r->0`.
This is exactly W2. If all transport factors are bounded by a common M_s,
there are n_r terms with `|lambda_i|<=L_r`, and local errors are bounded by
epsilon_r,s, a sufficient condition is
`n_r L_r M_s^2 epsilon_r,s ->0`, together with the endpoint/chart/exchange
decay. Per-tile convergence without this accumulation bound is insufficient.
**BY** <1>2. This is sufficient, not necessary: cancellations can improve it.

<1>4. Alternatively assume the assembled error form, uniformly for **all
linear combinations** of physical probes, obeys

    |<K_r^s u, E_(r,m,n) e^(-t K_r) v>|
        <= B_(r,m,n,s) t^(-s-1-alpha_s) ||u|| ||v||,
    0<t<=1,  0<=alpha_s<1,  B_(r,m,n,s)->0.

CA-95 Lemma 95.1 then gives W2 with
`|E|_(s,2)<=C_(s,alpha_s) B_(r,m,n,s)` and
`C_(s,alpha)=1/((s+1)!(1-alpha))+sum_(j=0)^(s+1)1/j!`.
**BY** the already proved physical-probe lifting theorem; no new proof of
it is claimed here. One must first quotient nulls and include inverse-Gram
normalisation. A bound for each fixed word with word-dependent constants
does not suffice (CA-95 Negative 95.4).

<1>5. Assume in addition A2 for S, `|S_(r,n)|_(s,1)<=M_(n,s)`, convergent
real contacts `kappa_(i,r)->kappa_i` and real shifts `b_r->b`, and the standard KS discrepancy
`d_(r,n,s)=|T_(r,n)-S_(r,n)|_(s,1)->0` at all required orders. Then

    q^S_(r,m,n,s) <= q_r
       +(2 pi/N_r)^2 (2|m|^3+|m+n|^3) M_(m+n,s)/6
       +|z^(r)_mn-z_mn| ->0,
    z_mn=delta_(m+n,0){kappa_3 m^3+(kappa_1-2b)m}.

**BY** CA-89 Lemma 89.5 (finite Fourier summation and sine bound), or
CA-95 Proposition 95.3. The algebraic transfer estimate (89-transfer),
CA-89:103–110, transfers A2/A4 to the
**prescribed** KS modes, with `c*=12 kappa_3`, `c=24b-12 kappa_1`.
The product terms in that transfer are controlled at consecutive graph
orders s and s+1; mere unweighted insertion matching is not substituted.

<1>6. To get A3 additionally assume A1, a common coordinate-resolved
holomorphic family `mathcal B_(r,n)(eta)` with derivative S_(r,n) at zero,
eta-independent J_r,K_r, with both adjacent-scale families holomorphic on
a neighbourhood of the same closed disk `|eta|<=rho_(r,n)`, and

    sup_(|eta|=rho_(r,n))
      |mathcal B_(r+1,n)(eta) J_r-J_r mathcal B_(r,n)(eta)|_(s,1)
          <=u_(r,n,s),
    sum_r u_(r,n,s)/rho_(r,n)<infinity,  sum_r d_(r,n,s)<infinity.

Then Cauchy's derivative estimate and the discrepancy comparison give

    |T_(r+1,n)J_r-J_rT_(r,n)|_(s,1)
       <=u_(r,n,s)/rho_(r,n)+d_(r+1,n,s)+d_(r,n,s),

which is summable. **BY** CA-89:146–163. A directly proved summable
derivative-level matching estimate is an allowed replacement. Two-loss
W2 decay alone gives no such one-loss derivative estimate; real gate
closeness is insufficient (CA-89 Propositions 89.6/89.7).

<1>7. **QED for the implication.** With A1 and the microscopic adjoint
pairing on that same state/refinement system, A2–A4 permit VR-1 to produce
its mode representation. Nothing here verifies (D.1), (D.2), A1/A2 or
the matching estimates for a general categorical chain. With two chiral
families, mixed brackets still need their own certificate. R3 also needs
positive energy, local field/net reconstruction, suitable self-adjointness
and projective-unitary integration (VR-1:151–177). Small R_P alone proves
neither C-limit nor R3.

**The missing estimate and geometric lemma.** Prove a contour-exchange
realisation giving (D.1) for the same categorical stress insertions, then
prove the all-scale majorant (D.2), or CA-95's uniform probe bound including
endpoint and cylinder-chart errors. Derive one-loss KS matching and
summable differentiated refinement separately. Naming a residual W2
without these steps would merely rename the commutator residual (CA-89
Remark F1). They remain explicit open obligations here.

## Verification and scoped research record

**Context / choices.** The initial NOTE and all-open ledger were written
within the first ten minutes. Work serves P3 on the existing P2 cells,
not a search within a chosen model. Root conventions, worklog and index
are untouched by the explicit scope restriction; this section records
the scoped conventions, run commands and acceptance evidence instead.

**Friction / corrections.** Literal collar differentiation, finite dilation
and genuine coordinate changes initially share notation in the brief but
obey different laws. The repair keeps their types and sources separate.
Read-only skeptical review checked the proofs and prompted explicit
contraction compatibility (A.1), the formal-dual boundary orientation,
the bulk-only alpha domain and the gauge restriction for selected KS.
The two-sided RP matrix example illustrates a tangent issue; the exact
gate cone in C3 supplies the corresponding microscopic one-sided witness.
No missing source was replaced by memory or by an internet acquisition.

**Acceptance.** Three exact SymPy scripts and raw outputs are kept in
`checks/`. They run in seconds; the largest deformation Jacobian is 56x64
(physical matrices at most 8x8), and they require no Julia
or report build. The independent reruns passed; mutations produced the
expected failures before restoration. Numerical ranks below are exact
integer/rational calculations, not tolerance-based observations.

From the repository root:

```bash
python3 explorations/2026-10-27-astra-r4/H2-lattice-cell-equations/checks/rank_two_ward.py
python3 explorations/2026-10-27-astra-r4/H2-lattice-cell-equations/checks/equality_complex.py
python3 explorations/2026-10-27-astra-r4/H2-lattice-cell-equations/checks/cell_seam_identities.py
python3 explorations/2026-10-27-astra-r4/H2-lattice-cell-equations/checks/rank_two_ward.py --mutate-f
```

The last command **must exit nonzero**; its traceback is saved in
`rank_two_ward_output.txt`. Each other script includes caught deliberate
mutations and exits zero only when the correct invariants also pass.
The equality-matrix calibration treats B as independent and complexifies
its gauge variables; its larger gauge space is not asserted to preserve
the selected KS formula. The general proof restricts that space explicitly.

## Results ledger

- A1 / typed bulk and module cuts, C0: **proven**.
- A1 / exact temporal sewing and C3 for one fixed weighted graph: **proven** (application of CA-80).
- A2 / exact spatial recutting with the interface and inverse transports retained: **proven**.
- A2 / full-span contraction/coherence equations (A.1) as the exact criterion for the declared grammar: **proven**.
- A2 / canonical seam alone supplies geometric whole-history reflection coherence: **conjectural**; CA-98 G1/G2 remain unproved.
- A2 / bending preserves unchanged ordinary matrix multiplication in general: **negative** (rank-one image of the identity).
- B1 / differential residual product law and required pairing correction: **proven**.
- B2 / ordinary differential Leibniz law for finite dyadic defects: **negative** (universal scalar witness).
- B2 / twisted finite comparison law (B.1), with correct bulk/J types: **proven**.
- B3 / nonzero h solves the literal same-cut anisotropy commutator Ward equation: **negative** (R(0)=h).
- B3 / first tile jet (B.2), frozen linear system (B.4), and its exact Duhamel equivalence: **proven**.
- B3 / invariant two-site algebra blindness with B,L fixed versus marked three-site KS/F dependence: **proven**; categorical variation checked separately.
- C1 / explicit equality D1,D2 with D2 D1=0 around a solution of the retained finite system: **proven**.
- C2 / H1 formal equality deformations modulo preserving infinitesimal gauge: **proven**.
- C2 / H2 formal extension obstruction at each order for this equality presentation: **proven**.
- C3 / unrestricted RP tangent feasibility represented by a vector-space kernel: **negative** (PSD cone / exact gate cone).
- C3 / local strict-positive-seam regime and explicit CE compatibility row: **proven**.
- C3 / exact finite-matrix scalar CE defect is a coboundary: **proven** (LC-2 P5); no identification with sewing H2 asserted.
- D1 / geometric identification plus accumulated two-loss estimates and KS matching gives W2/A4: **conditional**, with the implication proved.
- D1 / coordinate-resolved summable derivative matching additionally gives A3: **conditional**, with the implication proved.
- Whole H2 / nontrivial selected KS cell solution, C6 reconstruction and C-limit to R3: **conjectural**; not established by this note.
- Checks / algebra, symbolic associator, seam, equality matrices and rejection mutations: **proven finite check results**.

## Layer tags

| Statements | Setting | Data layer and all additional classes of declarations | Rung reached here | Rung fed / claimed |
|---|---|---|---|---|
| A1, B1 | Any; fixed boundary module for open ports | L0, pointed O, duals/module coherence, exact h/weights, oriented graphs, Gram bases; differentiable cut connections for B1 | Finite only | `->R3`, B1 also `->R2` |
| A2 | Any oriented finite graph; reflection only with its own identification | L0 + s, port transports, contraction grammar; canonical s at L1; RH/G1/G2 and PSD separately | Finite only | `->R3` |
| B2 | Bulk endomorphism cuts; typed module cuts only with J or a supplied extension | L0 + actual CA-90/96 transport, chosen refined cells and cut comparisons; periodic extension if applying periodic KS | Uses existing R0^u, no new rung | `->R2` |
| B3 | Any local algebra; standard periodic mode normalisation only after declaring it | L0, marked A2/A3 bases, h, v and placements; B,L frozen for the linear fragment; actual prescribed KS for (B.5)/(B.6) | Finite only | `->R2` |
| C0–C3 | Any, same declared cell grammar | L0 plus the above microscopic data, finite overlap/jet presentation, exact solution, preserving gauge group, RP strata; declared Lie lift only in the CE subproblem | Finite only | `->R2, ->R3`; no automatic higher complex or CFT |
| D1 | Periodic/full, per chiral family | L0 + quotient/state/refinement/translation/controls, geometric insertion and contact identification, accumulated bounds, prescribed KS matching and differentiated refinement; no L4 target assumed | No certified rung | Conditional R2 implication; R3 needs further analytic hypotheses |

No statement reaches R1, R2, R3, R4 or R5 for an arbitrary categorical input.
Boundary choices are data; no open-versus-periodic construction question
is substituted for these equations. The same-system clause of CA-88:122–125
applies to every conditional combination.

## Pillar served

**P3 on P2:** exact finite C-evaluated cells now carry a specified residual
presentation and six explicit identities among equality residuals. They
separate categorical recoupling from conformal dynamics and identify the
precise conditions under which H1/H2 have deformation meaning.
**P1 retained:** O remains pointed and all occupation/charge multiplicities
are retained; the current check includes pair creation/annihilation, not a
fixed-number replacement. **P4 interface:** (D.2) is the accumulated graph-norm
estimate needed after the separate geometric contour identification.

## What this gives the integration

- **CA-75 (a1):** finite module-cut channel typing with the required dual
  orientation is supplied; identification with continuum channel carriers
  remains open.
- **CA-75 (a2):** temporal sewing is reused; spatial cutting now includes
  the actual interface strip and explicit transported contractions. Exact
  recutting of a fixed graph is settled at this level. Automatic canonical
  reflected coherence and any anomaly-line limit remain open.
- **CA-75 (a3):** the finite residual grammar, tile jets, correct refinement
  law and actual equality compatibility maps are explicit. The nontrivial
  geometry-to-KS response/selection problem remains open; merely setting
  the collar derivative equal to a same-cut commutator kills h.
- **CA-75 (a4):** only the exact conditional path (D.1)/(D.2) to W2 and
  standard-KS A4, with a separate A3 clause, is supplied. No convergence is proved.
- **CA-88:** the L0/any finite `->R3` CA-80/92 row and the L0 finite-cell
  counterpart to the LC rows gain an explicit presentation-level complex.
  The periodic/full `->R2` CA-89/95 row gains a typed accumulation interface.
  The D2-C selection pointer gains the algebra-versus-placement distinction.
  **No cell moves up a rung:** R0^u is reused; R1–R5 remain at their prior status.
  In particular C6 internal stress/field locality is not proved by declaring
  the standard local density, and fidelity cannot be read from this H2.

## Open problems

1. **Microscopic geometry-to-stress lemma.** On the general pointed carrier,
   specify local coordinate/insertion deformations (distinguishing collars
   from moduli) and prove their boundary response equals the prescribed
   energy/current KS combination up to a controlled residual. A dyadic
   algebra homomorphism is not this response by itself.
2. **Coherent spatial reflection lemma.** For a declared s, prove (A.1)
   and CA-98 G1/G2 for the proposed whole-history reflection and all allowed
   tile sewings, or exhibit its failure. Canonical s existence alone is insufficient.
3. **Nontrivial selected solution lemma.** Find h with actual occupation-changing
   entries satisfying the geometric, seam and selected-KS equations, with
   RP and a noncollapse condition. The frozen B,L linear system cannot
   substitute for this nonlinear, generally F-sensitive problem.
4. **Finite-presentation/completion lemma.** Prove a specified set of cell
   moves generates all relevant decompositions and identify higher relations,
   or retain the full infinite presentation. Prove positive, invariant null
   quotients and convergent geometry jets; finite linear algebra does not do so.
5. **Contour-to-operator lemma.** Realise both insertion orders and all
   cylinder contacts on the same quotient, yielding (D.1) with explicitly
   named endpoint, chart and exchange errors (CA-95 G1/G2).
6. **Accumulated two-loss estimate.** Prove (D.2) uniformly for every fixed
   mode pair and graph order, including the cut Gram conditioning and growing
   cell count, or its uniform physical-probe replacement. Separate one-loss
   KS discrepancy and summable differentiated refinement estimates are required.
7. **OAR/C6 completion.** Verify the state/refinement certificate and
   noncollapse, then local internal stress, positive energy and full
   projective-unitary integration. No equality cohomology calculation here
   proves those analytic or fidelity conclusions.

## Examples table

Instances below only check general formulas; none is a construction target.

| Check instance | Exact invariant / result | Scope and artifact |
|---|---|---|
| Formal rank-two rule `x²=1+m x`, pointed `O=1+x` | Symbolic ring associativity; `O²=2·1+(m+2)x`; matrix-unit Ward systems on blocks (2,2), (2,3), (2,4), dimensions 8,13,20; direct, structure-constant and Kronecker computations agree | No categorifiability asserted for generic m; `checks/rank_two_ward_output.txt` |
| Pointed `Hilb_fd(Z2,omega)`, `omega(1,1,1)=zeta`, `zeta²=1` (labels 0=unit, 1=nonunit) | All 16 cocycle identities and unitarity hold; `J[001,100]=i(a² zeta-b²)` for pair/hop coefficients a,b; changing valid zeta changes current but not A2 | Genuine symbolic associator test; no cap identification or braiding used; same artifact |
| Universal matrix multiplicities on `O=1+1` in every C | Shared-connection Ward product, pairing derivative, twisted refinement, all 16 bend inverse checks, transported seam associativity and exact gate RP cone; ordinary same-product/reflection shortcuts fail | `checks/cell_seam_identities_output.txt`; does not assert arbitrary-network RP |
| Four-object path presentation with 2x2 amplitude jets | D0 shape 64x32 rank 28, D1 56x64 rank 36, D2 24x56 rank 20; D1D0=D2D1=0; wrong Ward sign produces entry -2 | Independent-B algebraic fragment only; `checks/equality_complex_output.txt` |
| Singular 2x2 PSD seam / scalar germ | Straight PSD pencil fails at order two; corrected path PSD. For `E(x)=x²`, a Jacobian left-null row need not annihilate quadratic forcing | Same artifact; tests the need for off-shell identities and RP handling |

The rank-two script's independent orthogonal 2x2 placeholder is explicitly
**not** a categorical F-matrix. Arbitrarily varying symbolic F entries while
ignoring pentagon/unitarity would not be a test within the conjecture's
general class. The actual mutation above changes the checked cocycle;
the separate `--mutate-f` regression test injects an illicit F term into
the two-site compiler and must fail.

## Sources used

All citations are local. New statements have displayed derivations above;
checks validate identities and witnesses, not the unproved geometric estimates.

- `references/text/PenneysUnitaryFusionCategories.md:219–237,396–430,528–568,589–608,682–708,1010–1019`: unitary sums, coherent graphical calculus, oriented duals, channel bases, cocycle instance and spherical positivity.
- `literature/md/1905.04924/1905.04924.md:688–718`: module internal-hom adjunction and composition.
- `references/categorical-reconstruction/FuchsRunkelSchweigert2002/source/hep.tex:2278–2285,2396–2408`: algebra-object equations and their F-dependent categorical coordinates.
- `references/lattice-symmetry/GransSamuelssonEtAl2020/source/Linnea11.5.tex:791–820`: energy/current and KS prescription; not a general convergence theorem.
- `references/cft/Schottenloher2008/Schottenloher2008.md:2200–2264`: central CE cocycle and splitting/counterterm criterion.
- `references/categorical-reconstruction/BrehmRunkel2024/source/main.tex:598–607,680–692,799–809`: supplied-CFT carriers, Weyl anomaly and cutting; no category-to-CFT existence imported.
- `references/categorical-reconstruction/SOURCES.md:1–136`, `references/category-theory/SOURCES.md:1–100`, `references/lattice-symmetry/SOURCES.md:1–100`: local provenance/import boundaries consulted.
- `CONVENTIONS.md:631–703,1196–1237,1397–1665`: pointed sites, signs, exact weights, algebra and placement constants, KS, layers, graph norms, seams and scoped round-3 notation.
- `reconstruction/01_cells.md:17–53,57–162,164–228`: module channels, C0–C7, differential Ward propagation and analytic/finite-presentation boundary.
- `reconstruction/02_obstructions.md:38–115,144–230`: innerness, central CE versus geometry, curvature, gauges and finite-matrix coboundary obstruction.
- `reconstruction/03_sewing_deformations.md:57–158`: binary fragment and the missing full-system identity map.
- `reconstruction/05_mixed_complex.md:20–107,109–167`: specified mixed algebra/action complex, first-order quotient and scope limitation.
- `reconstruction/10_four_port_linearization.md:125–180`: inverse-Gram differentiation, fixed quotient, equality cokernel and identity requirement.
- `report/sections/14_koo_saleur_prototype.tex:57–106,120–127`: density/current prescription and its scaling boundary.
- `report/sections/75_integration_map.tex:115–138`: Link (a1)–(a4).
- `report/sections/78_categorical_selection_equations.tex:37–68,70–97`: matrix-unit compiler, three-site F placements, exact gate ODE and metric-response boundary.
- `report/sections/80_lattice_sewing_and_fidelity_certificate.tex:52–140`: exact cells, inverse-Gram sewing, temporal RP, Duhamel and accumulated Ward residuals.
- `report/sections/86_spacetime_trotter_dictionary.tex:61–110`: history dictionary and the geometric weight factor.
- `report/sections/88_layered_targets.tex:54–56,82–155,179–188,242–251`: declarations, rung grid, same-system rule and selection interface.
- `report/sections/89_ward_ks_transfer.tex:51–84,88–163,165–185`: graph norms, W2, transfer, differentiated matching and failed simpler inferences.
- `report/sections/90_local_unital_lift.tex:59–85,110–143`: actual transport hypotheses, alpha and its endomorphism domain.
- `report/sections/92_spatial_seams_and_reflection_positivity.tex:53–153,157–165`: seam typing, bent kernel, conditional spatial RP and exact-gate witness.
- `report/sections/95_probe_word_ward_lifting.tex:38–91,135–145`: uniform physical-probe lifting, geometric G1/G2, accumulated bounds and fixed-word failure.
- `report/sections/96_blocked_dyadic_lifts.tex:75–106`: blocked transport hypothesis and the original-site algebra lift.
- `report/sections/98_canonical_seams_reflection_coherence.tex:53–96,122–180`: canonical seam, oriented duals, invertible bending and the still-conditional G1/G2.
- `cft_machine/research/virasoro_routes.md:50–82,151–177`: VR-1 A1–A4 and excluded analytic/fidelity conclusions.
- `explorations/2026-10-22-astra/D2-selection-principle/REVIEW.md:76–87`: the precise category-blindness warning, not an F-independence theorem for placements.
- `worklog/023_2026-10-27_status_overview.md:16–87,171–206`: four-pillars priority, current ladder and structural diagnosis.
- `checks/rank_two_ward.py:1–230`, `checks/rank_two_ward_output.txt:1–35`: local exact producer, coefficient and symbolic associator checks, mutation transcript.
- `checks/equality_complex.py:1–159`, `checks/equality_complex_output.txt:1–13`: actual finite differential matrices, off-shell expansions and mutation/PSD witnesses.
- `checks/cell_seam_identities.py:1–163`, `checks/cell_seam_identities_output.txt:1–20`: exact seam, connection and refinement checks with rejected shortcuts.
