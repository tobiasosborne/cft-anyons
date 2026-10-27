# H1 — Exact worldline net gas on a pointed anyonic carrier

Started 2026-10-27, 13:10 UTC. Initial open ledger written within the first
ten minutes and updated after each completed proof group. This is an
exploration, not a report-shard promotion.
Scope: P2 (categorically evaluated spacetime histories), inseparably P1
(vacancies and number-changing events on the pointed carrier).

## Statement under investigation

**Verdict:** H1 as a whole is false as stated. Its exact finite diagrammatic
core holds. Probability requires scalar positivity and full exterior
connectivity data; the proposed loop-coefficient “iff” fails in both
directions under its stated raw convention. The strongest replacements
proved below include a category-wide F-positivity classification and a
finite-volume phase-gauge criterion. Scaling and unrestricted local positive
re-encoding remain open.

For an arbitrary unitary fusion category C, pointed O = 1 ⊕ X (including
occupied unit copies), and declared self-adjoint h in End_C(O ⊗ O), expand
each exact tile exp(t h) in a complete diagram basis. Prove the exact finite
net expansion, categorical local relations, and cut sewing. Determine the
extra assumptions under which these amplitudes define a probability law,
and distinguish its conditional laws from algebraic sewing and temporal
reflection positivity. State a conditional scaling conjecture, not a CFT
existence theorem.

Tags throughout unless strengthened explicitly: **any; L0** (fusion,
associator, dagger and the positive spherical duality) **+ declared pointed
site, density, ordered brick patch, diagram basis and boundary contraction;
finite, →R1/→R3; no new rung reached**. L1–L4 are not assumed. R0 carrier
facts are imported from CA-66 and CA-77, not re-proved.

## Local convention proposals (recorded before use)

The user restricts edits to this directory, so new conventions are proposed
here for later registration in CONVENTIONS.md; no global convention is
silently changed. Existing signs/cuts are CONVENTIONS (r), (ak), (al), (am).
In particular H = −Σ h_j, k_j = −h_j, T_j(t) = exp(t h_j). The word
“positive” for k_j in (al) specifies the sign convention, not k_j ≥ 0.

Keep orientations, multiplicity indices, and a vacancy flag distinct from
the simple-object label 1. Use isometric trivalent inclusions
u^{ab}_{c,μ}: c → a⊗b, u†_μ u_ν = δ_{μν} id_c. When isotropic vertices
are needed put V^{ab}_{c,μ} = (d_a d_b/d_c)^(1/4) u^{ab}_{c,μ}; hence
V†_μ V_ν = δ_{μν} sqrt(d_a d_b/d_c) id_c. This is the normalization of
Penneys:528–568, and specializes to (aj); a raw cup is V^{a ā}_{1} with
V†V = d_a. Keep oriented evaluation distinct from the adjoint of a
self-dually identified cup: Penneys:1032–1047 records the possible FS sign.
No all-positive or tetrahedrally symmetric gauge is assumed. The symbol v
in a *site subscript* below denotes the vacancy flag; the raw cup morphism
v in H1-D1 has an explicitly stated type. They are never identified.

## H1-A. Exact finite net representation [proven]

**Tags:** any; L0 + the preceding declarations, including ordered planar
ports and a boundary functional if a scalar is wanted; finite →R1/→R3.
This makes CA-78 Proposition 78.2 / CA-80's exact patch sum explicit; it
does not claim a new Trotter theorem. Fix the following complete dictionary.

Write X = ⊕_a C^(m_a)⊗a, with isometric inclusions i_(a,r):a→O.
Let I = {v} ⊔ {(a,r):1≤r≤m_a}, i_v=η, a_v=1; v is the *vacancy flag*.
The occupied flags (1,r) are different from v even though a_(1,r)=a_v.
For p=(i,j,μ) in the c channel set

    s_p^c = (i_i⊗i_j)u^{a_i a_j}_{c,μ},
    g_p = (d_(a_i)d_(a_j)/d_c)^(1/4),  S_p^c=g_p s_p^c,
    E^c_qp=s_q^c(s_p^c)†,             D^c_qp=S_q^c(S_p^c)†.       (A1)

Unitors/associators are inserted for the fixed bracketings. A tile D^c_qp
is a lower fusion vertex (S_p)† joined by a c edge to an upper splitting
vertex S_q. Erase only *categorical* unit strands; keep their occupancy/copy
flags in the configuration. Every fusion vertex carries its μ index.

**ASSUME** the dictionary (A1), h=h†, and a finite patch P of exact gates,
with half-time gates at the two ends of a symmetrized row when appropriate.
**PROVE**

    Z_P = Σ_Γ [∏_(p in P) w_(p,α_p)(t_p)] Ev_C(Γ),
    w^c_qp(t) = [exp(t h^c)]_qp/(g_q g_p),
    h^c_qp id_c = (s_q^c)† h s_p^c.                              (A2)

Here Γ ranges over **tile-decorated** nets with the internal indices of
(A1), rather than over bare embedded graphs with unspecified multiplicities.
Ev_C(Γ) belongs to Hom_C(W_in,W_out); boundary vectors are contracted
afterward. Arbitrary boundary vectors need not be single label states.

<1>1. The s_p^c form orthonormal simple inclusions, and
Σ_(c,p) s_p^c(s_p^c)†=id_(O⊗O).
  <2>1. Expand the orthogonal sum O⊗O into the (i,j) summands.
  BY Penneys:219–237 and the chosen splitting of the pointed object.
  <2>2. In each a_i⊗a_j use Σ_(c,μ)u_μu_μ†=id and u_μ†u_ν=δ_μν id_c.
  BY Penneys:528–547 after dividing its vertices by g_p.
  <2>3. Orthogonality of different site copies gives the claimed identity.
  BY <2>1–<2>2.
<1>2. The E^c_qp are matrix units and D^c_qp=(g_qg_p)E^c_qp are a basis.
BY <1>1: E^c_qp E^b_sr=δ_cb δ_ps E^c_qr, and every g_p>0.
<1>3. Formula (A2) is the exact gate expansion.
BY <1>2, functional calculus on each finite matrix block, and CA-78:44–68.
<1>4. Substitute <1>3 at every plaquette and distribute the finite sums.
Each choice of local indices is exactly the net in (A1); incompatible
indices contract to zero. Tensor composition is its C-evaluation.
BY multilinearity, Penneys:394–398, and CA-80:70–83. QED.

**Dictionary and occupation consequences [proven corollary].** Through
projectors are sums of E_pp; a hop is D_(v,a,r),(a,r,v) with unitors;
the raw birth tile is

    b_(a,r;ā,s)=(i_(a,r)⊗i_(ā,s)) coev_a (η†⊗η†),
    death=b†,       cup-cap=bb†.
    ν^R_(a,r;b,s;c,l;μ)=(i_(a,r)⊗i_(b,s))V^{ab}_{c,μ}(η†⊗i_(c,l)†),
    ν^L_(a,r;b,s;c,l;μ)=(i_(a,r)⊗i_(b,s))V^{ab}_{c,μ}(i_(c,l)†⊗η†).

For matching input copies, (ν^R_μ)†ν^R_ν =
δ_μν sqrt(d_a d_b/d_c) P_(v,c,l), and similarly on the left. Thus a
raw θ diagram has value sqrt(d_a d_b d_c), not an unnormalized δ.
BY substitution of the convention V=g u. These ν are the general
multiplicity-resolved version of (ak), and specialize to (aj)'s norm.
Pair creation requires both a and ā in X. Hom(X,X⊗X) supplies splitting
and merging. If Hom(1,X)≠0, additional unary occupied-unit/vacancy
conversion tiles are present. The nine geometric loop tiles plus a single
ν do **not** span End_C(O⊗O) for general X. BY (A1) and CA-77:102–105.

On each temporal cut the occupation is the sum of the non-v flags, so
birth/death change it by ±2 and ν by ±1. Histories with these events must
live on the indefinite-N carrier, not a fixed-N summand. BY CA-66:65–89,
128–152 and CA-77:90–116. This is a statement about these reactions; a
special h may set all their coefficients to zero. The configuration-Fock
carrier is already Theorem 77.8, CA-77:207–226.

**Two exactness qualifications.** The finite patch identity is exact for
R(t)^M and for every ordered product, but R(t)^M=e^(−βH) at t=β/M is
generally false at finite M. The fixed-volume limit is CA-80:106–115.
Also, forgetting tile or copy decorations can make several Γ represent
one bare net; its coefficient is then a **sum of products**, not necessarily
one product. No quotient of configurations is taken in (A2).

## H1-B. Local rules, traces and the precise loop removal [proven]

**Tags:** any; L0 + (A1), positive spherical duality and declared planar
closure; finite →R3. No braiding or ribbon crossing is used.

**ASSUME** a contractible, unmarked oriented circle labelled a is a
disconnected component of a planar diagram Γ. **PROVE** its removal
multiplies Ev_C by d_a; bubble orthogonality and F recoupling hold, and the
categorical trace obeys the identities (B1) below.

<1>1. An oriented simple circle has value tr_C(id_a)=d_a>0.
BY the raw-cup convention and Penneys:1010–1019. Composing a scalar
endomorphism of 1 into a diagram multiplies its value; remove the circle
inside a disk (or use spherical isotopy for its exterior). Thus
Ev_C(Γ ⊔ circle_a)=d_a Ev_C(Γ).
<1>2. The **isometric** bubble is u_μ†u_ν=δ_μν id_c, whereas the
isotropic-vertex bubble is V_μ†V_ν=δ_μν sqrt(d_a d_b/d_c) id_c.
BY the declared normalization. Inserting the inverse norm in the dual
vertex restores δ. Distinct simple intermediate objects have zero overlap
by semisimplicity. Thus “bubble=δ” requires the dual-basis normalization;
it is not literally V†V=δ in the raw normalization.
<1>3. Two fully indexed trivalent trees with the same external labels are
bases of the same Hom space; their change-of-basis is the unitary F.
BY Penneys:549–568. Replacing one tree by its F expansion preserves the
morphism, including all multiplicity sums. No weights are transformed
unless one also changes the tile presentation.
<1>4. For W=⊕_(c,p)c, the trace is
tr_C(T)=Σ_c d_c Tr(T^c). In fact tr_C(s_q s_p†)=tr_C(s_p†s_q)=δ_pq d_c.
BY Penneys:937–961, <1>1, and (A1). Consequently

    tr_C(fg)=tr_C(gf),
    tr_C(f⊗id_a)=d_a tr_C(f),
    tr_(W⊗a)(T)=tr_W(ptr_a T),
    τ_(L+1)(T⊗id_O)=τ_L(T),  τ_L=tr_C/d_O^L.                 (B1)

The third identity defines ptr_a by closing only the a legs; closing the
remaining legs is the same diagram. The second follows by a detached
circle; the last follows with a replaced by O and d_O=Σ_c m_c(O)d_c.
BY <1>1, graphical composition and cyclicity. These are the categorical
**Markov trace/partial-trace identities** used here. QED.

**What the assertion excludes [negative qualification].** An unbranched
component carrying a coupon A contributes tr_a(A), not necessarily d_a;
a branching component is a whole closed-net evaluation, e.g. the θ value
above. A noncontractible loop around a retained boundary charge cannot be
erased by a disk move; its effect belongs to the declared closure/seam.
Even a removable circle decouples only from Ev_C: its tile weights and
exclusion of other configurations remain in the statistical weight. This
does not assert statistical independence of loops. Levin–Wen's four rules
are local diagram identities (strnet.tex:497–524), not such independence.

**Gibbs trace declaration [proven].** The ordinary Hilbert trace on
H_L=⊕_c Hom(c,O^L) is Tr_H(T)=Σ_c Tr(T^c); it is generally different
from tr_C(T). Let J_L=Σ_c d_c^(−1)P_c, a central boundary insertion. Then

    Tr_H(T)=tr_C(J_L T),
    ω_(β,H)(A)=tr_C(J_L e^(−βH) A)/tr_C(J_L e^(−βH)).        (B2)

BY <1>4, blockwise. At finite brick depth replace e^(−βH) by R(t)^M;
(A2) gives its exact history expansion. A *categorically traced* Gibbs
state instead omits J_L and weights total charges by d_c. A fixed-charge
trace uses P_c/d_c. In particular a single a-sector identity has ordinary
trace 1 but categorical trace d_a: the unqualified claim that **every**
ordinary Gibbs closure attaches d_a to **every** closed component is false
whenever a reachable d_a≠1. Contractible loop removal away from the boundary
insertion remains true. Arbitrary charge weights must be declared.

**Data audit.** Distributivity, matrix units and F-change of basis need
semisimple fusion/associator data (dagger for orthonormality); rigidity types
the cups. Pivotal structure permits planar bending with coupons carried
along, spherical structure identifies the two closures, and unitarity with
the canonical spherical structure supplies positive d_a. Erasing arrows
and identifying both bends with the same raw cup adds an FS condition:
Penneys:907,947–961,1032–1047. We never assume those extra identifications
for arbitrary C.

## H1-C. Sewing and the domain Markov statement [proven / conditional]

**Tags:** any; L0 + (A1), cuts along tile legs, full cut tensors; finite
→R3. The probabilistic part additionally assumes scalar nonnegative
configuration weights and a nonzero finite partition function.

**ASSUME** a cut γ with H_γ=⊕_a Hom(a,W_γ), a charge-respecting basis
u_A and Gram G_AB=⟨u_A,u_B⟩ (linear in the second slot). Quotient a redundant
spanning list by its null space first. **PROVE** exact sewing, and the
conditional formula (C2) whenever a probability measure exists.

<1>1. If U is synthesis in this basis, G=U†U and

    I_γ = Σ_AB |u_A⟩(G^−1)_AB⟨u_B| = U G^−1 U†.             (C1)

BY CA-80 Lemma 80.1. Substituting (C1) at every interface gives the
uncontracted composition of patch maps, including all charge blocks.
<1>2. Fix an exterior tile configuration ξ of P\Q and the outer boundary
contraction. Contract it down to a linear functional L_ξ on the interior
boundary tensor space, including its own local weights. Then the scalar
weight of a completed history is

    a(η,ξ) = w_Q(η) L_ξ(Ev_C(η)).

BY (A2) and <1>1; this statement also holds for complex amplitudes.
For a rectangular Q one can regard L_ξ as a functional on
Hom_C(W_in,W_out); for a general boundary bend its legs with the declared
oriented dualities. It is **not** a list of independent onsite spins.
<1>3. If a(η,ξ)≥0 for every completed configuration, Z_P=Σa>0, and
ξ has positive marginal probability, finite conditional probability is

    μ(η | ξ) = w_Q(η)L_ξ(Ev_C(η)) / L_ξ(Z_Q).                (C2)

BY dividing μ(η,ξ)=a(η,ξ)/Z_P by Σ_η μ(η,ξ); the denominator is strictly
positive. The exterior matters only through its induced functional L_ξ
(up to a common positive factor). Summing successive interiors gives the
same law by associativity of finite summation. QED.

This is the exact **boundary-tensor domain Markov property**. Without
positivity or with a zero denominator, <1>2 remains an algebraic gluing
identity and <1>3 is not a conditional probability. Inverse Gram entries
are contraction coefficients, not transition probabilities.

**Negative C-labels (general class).** In any unoriented loop sector with
a simple symmetrically self-dual a and d=d_a>1, four boundary endpoints
all carrying a admit pairings A=(12)(34), B=(14)(23). Take equal interior
local products. Exterior A gives completion weights (d²,d), exterior B
gives (d,d²). Their ratios d and 1/d differ. **Proof:** stacking identical
pairings closes two circles; stacking different pairings closes one;
apply H1-B. Thus endpoint species/occupancies do not determine the
conditional law. Outside connectivity, or its full categorical tensor,
must be retained. This is a counterexample for the entire indicated class,
not a claim about one category. Indeed the cut Gram is

    G=[[d²,d],[d,d²]],
    G^−1=(d^4−d²)^−1 [[d²,−d],[−d,d²]],                       (C3)

so sewing uses negative coefficients even though these loop laws are positive.

For explorations by successive exposed tiles, (C2) also holds at each
finite stopping step by conditioning on each possible revealed history.
It carries L_ξ as part of the exploration state. It supplies neither
conformal invariance nor a theorem that this state reduces to the usual
unlabelled slit-domain data of an SLE or CLE. Disjoint remaining components
are conditionally independent when L_ξ factorizes on their attainable
boundary tensors; sewing alone supplies no such factorization. Necessity
would concern only the span of attainable tensors, not unused cut directions.

## H1-D1. Loop signs: corrected theorem and two failures [proven]

**Tags:** any; L0 + a specified loop presentation and planar scalar closure;
finite →R3. All assertions about coefficients refer to that presentation;
if tiles are linearly dependent their expansion is additional data.

**ASSUME** properly oriented, colour/copy-resolved nonbranching tiles,
with no residual coupons on their components. Alternatively assume a simple
self-dual X with raw cup v†v=d_X and FS sign κ_X=+1, and use the associated
unoriented loop calculus. **PROVE** nonnegative tile coefficients imply
nonnegative closed-history weights. The converse is false.

<1>1. Successively remove each circle of a closed planar history. Its
weight is

    a(Γ)=∏_p w_(p,α_p) ∏_(loops ℓ) d_(a_ℓ).                 (D1)

BY H1-B and the absence of coupons. Every d_a is positive, so w≥0 suffices.
<1>2. For a raw self-dual cup, define b as in H1-A, e=bb† and
P_pair=e/d. The pair subspace is |vv⟩ plus v/√d; there
h_±=±(b+b†)=±√d [[0,1],[1,0]]. It is zero on the orthogonal complement.
Therefore, for t>0 and s=t√d,

    exp(t h_±)=I+(cosh s−1)(P_vv+e/d)
                    ± (sinh s/√d)(b+b†).                  (D2)

BY the power series and h_±²=d(P_vv+P_pair). All diagonal/through and
cup-cap coefficients are nonnegative; the two cup/cap coefficients for
h_- are strictly negative.
<1>3. A closed history of (D2) has as many births as deaths, since its
initial and final occupation agree and no other tile changes occupation.
Its number of negative factors is even. Thus both h_+ and h_- have
nonnegative weights (D1) for every such closed history. Equivalently
U=P_0+iP_1 at each site gives h_-=(U⊗U)h_+(U⊗U)†; internal phases cancel.
BY occupation bookkeeping from CA-77:90–116. QED: necessity fails even for
exact self-adjoint exponential tiles, throughout this class.

**Sharp phase criterion [proven].** In (D1), discard zero-weight histories
and put ε_(p,α)=w_(p,α)/|w_(p,α)|. All closed weights are nonnegative iff

    ∏_p ε_(p,α_p)=1  for every realizable closed history.     (D3)

BY division of (D1) by its strictly positive modulus. For real coefficients
this says an even number of negative factors on every history; it does
not say each factor is positive. Occupation coboundaries
w_α↦exp(iθ ΔN_α)w_α leave (D3) unchanged. This is a necessary-and-sufficient
criterion on the specified histories; it need not reduce to a local test.

**Negative D-FS (missing hypothesis in H1(d)(i)).** For a simple
self-dual X with κ_X=−1 the raw v,v† convention satisfies

    (v†⊗1)(1⊗v)=κ_X id_X,
    v†(1⊗v†⊗1)(v⊗v)=κ_X d_X.                              (D4)

The second equality follows by applying the first to the middle two
strands; associators are those of C. BY Penneys:1032–1047. The second
diagram is one component with two births and two deaths. On four vacant
sites it is realized by b_12, b_34, d_23, hops 4→3→2, then d_12;
identities fill a brick schedule. This is a nearest-neighbour history.

For h=b+b†+λ(hop_++hop_-), λ>0, the two summands act in orthogonal
occupation sectors. Its exponential is (D2) with the plus sign, plus

    sinh(tλ)(hop_++hop_-)+(cosh(tλ)−1)(P_Xv+P_vX).

All displayed geometric coefficients are nonnegative, yet the history
(D4) has negative weight. **Thus sufficiency also fails as H1 was worded**
if only self-duality and v†v=d are assumed. The separating hypothesis is
κ=+1 for the collapsed unoriented convention, or the use of correctly
oriented duality/pivotal morphisms with their actual coefficients. A proper
spherical circle still equals +d; (D4) is not that circle with its pivotal
data preserved. Changing the phase of v changes neither κ nor (D4).

**General X [proven reduction].** Decompose X as in (A1). An oriented
turn pairs a with ā; for simple a≄ā, Hom(1,a⊗a)=0 by rigidity and Schur,
so the purported same-species pair tile does not exist. When both species
occur, all multiplicities and arrows are retained. In a purely oriented
loop presentation (D1)–(D3) apply colour by colour. If turns change copy
indices or carry coupons, resolve their matrix entries as additional local
coefficients; before resolution a component contributes a trace of their
ordered product, not merely d_a. With suppressed self-duality flags,
replace the right side of (D3) by cancellation of the **actual** evaluated
phase, including FS signs. On a reducible self-dual object the rotation
operator is an involution on multiplicity data, not one FS scalar
(Penneys:917–935). These distinctions are necessary; d_X>0 alone is no
positivity criterion for arbitrary maps or arbitrary self-duality choices.

## H1-D2. What categorical signs do and do not obstruct [proven]

**Tags:** any; L0 + unitary fusion-vertex bases; finite. For the gas
criterion also declare O,h, closure and the resolved representation.

**Theorem D-F (category-only statement). ASSUME** D is the fusion
subcategory generated by X. **PROVE** D admits simple-object unitary
fusion bases in which *all* F entries are real nonnegative iff every simple
of D is invertible and its associator class in H³(G,U(1)) is trivial,
where G is the group of simple objects. This means complete recoupling
positivity, not positivity of a chosen Hamiltonian's histories.

<1>1. A square unitary matrix with nonnegative entries is a permutation
matrix. For distinct columns j,k, 0=Σ_i U_ij U_ik is a sum of nonnegative
terms; their supports are disjoint. Each of n nonzero columns has at least
one support position among n rows, so each has exactly one, of value 1.
BY this displayed computation and the column norm identity.
<1>2. If a is noninvertible simple, d_a>1: a⊗ā contains 1 once and at
least one other summand, so d_a²=1+Σ_(c≠1)N^c_(aā)d_c>1.
BY rigidity/Schur and the dimension identity (AFM-F:85–88).
<1>3. Let R_a:1→a⊗ā and Rbar_a:1→ā⊗a be the standard oriented
conjugate cups, both of norm √d_a and satisfying the conjugate equations.
The vacuum-channel trees

    L=(R_a⊗id_a)/√d_a,
    V=(id_a⊗Rbar_a)/√d_a

are isometries a→a⊗ā⊗a (with the respective brackets). Their overlap
has modulus 1/d_a, by the zigzag identity. These vacuum channels have
multiplicity one, so fusion-basis changes only multiply this entry by
phases. It is an entry of the corresponding F matrix.
BY Penneys:400–419,528–555 and the spherical dualities; equivalently
L†V=d_a^−1 id_a in compatible oriented conventions.
<1>4. A noninvertible a therefore contradicts <1>1, since 0<1/d_a<1.
BY <1>2–<1>3. Thus all simples must be invertible.
<1>5. In that case simples form G, every admissible fusion space is
one-dimensional, and the F symbols are phases ω(g,h,k). The pentagon is
the 3-cocycle equation. Rephase the vertex gh→g⊗h by β(g,h); the two
tree phases differ by

    β(g,h)β(gh,k) / [β(h,k)β(g,hk)].

Thus F changes by a coboundary (or its inverse according to F direction).
A nonnegative unit-modulus scalar equals 1, so such a gauge exists exactly
when [ω]=0. Conversely a trivial class gives F=1 throughout.
BY this basis-change calculation; Penneys:284–288,595–608 and
ENO:139–144,1970–1971. QED.

**Consequence for the proposed claim.** For *simple nonunit* X,
Hom(X,X⊗X)≠0 indeed forces noninvertibility: if X were invertible,
X⊗X≅X would imply X≅1. Theorem D-F then obstructs a globally
nonnegative recoupling gauge, even without assuming that particular Hom
space is nonzero. For the brief's general, possibly reducible X, the
condition alone is insufficient: in **every C**, taking X=1 gives that
Hom space nonzero but the generated subcategory has F=1; occupied unit
copies do not change this. The allowed class itself supplies the witness.
An obstructed F gauge also does not imply a negative weight in every gas:
h=0 can be expanded in occupancy identities with positive closed values.

**Fixed-gas criterion. ASSUME** a finite patch class, diagram library and
scalar boundary contractions as in (A2). **PROVE** that termwise positive
representation in this *specified* library is equivalent to

    Im[w(Γ) B(Ev_C Γ)]=0,
    Re[w(Γ) B(Ev_C Γ)]≥0                                  (D5)

for every allowed decorated Γ, with Z>0 for a probability law.
BY the definition of the configuration weights in (A2). Every finite
patch test is a finite set of real polynomial inequalities/equalities in
the tile coefficients and the declared F/pivotal/boundary entries.
An allowed fusion-basis gauge adds unitary variables and their equations;
quantify over them if gauge changes are part of “representation”. There
is no asserted finite universal test over all patch sizes. This exact
criterion includes evaluation phases, which a sign test on F alone omits.

**A more usable criterion for a different resolved representation.**
Fix a volume L and an orthonormal fusion-path basis in each total-charge
block. Place each local h_j in it, with the required F conjugations.
Resolve every time cut in these basis states; this sums some of the
diagrammatic information and is called a *path representation* here.

**ASSUME** all h_j=h_j†. **PROVE** there is a common diagonal phase
matrix D such that every D†exp(t h_j)D is entrywise nonnegative for all
t≥0 iff every closed walk of the following multigraph has phase product +1
(equivalently every oriented cycle, including parallel-edge two-cycles):
vertices are basis states, an edge x→y records a nonzero off-diagonal
(h_j)_yx, its phase is (h_j)_yx/|(h_j)_yx|, and different j give parallel
edges. Reverse edges have conjugate phase. Conditions are separate per
connected component; the diagonal entries of h_j are real and unrestricted.

<1>1. Entrywise positivity for arbitrarily small positive t forces each
off-diagonal entry of D†h_jD to be ≥0, by differentiation at t=0.
Conversely, if these entries are ≥0, choose c so D†h_jD+cI is entrywise
nonnegative; its exponential power series has nonnegative entries and
e^(−ct)>0. BY the Taylor series (finite dimension).
<1>2. A diagonal phase choice cancels along every cycle, so it cannot
change its phase product. BY telescoping edge phases.
<1>3. If all cycle phases are 1, choose a root in each component and let
d_x be the phase product on a path from the root to x. Reverse paths and
the cycle condition make d_x path-independent. Then every edge phase is
d_y/d_x, and D=diag(d_x) makes D†h_jD off-diagonal nonnegative.
BY the definition and <1>2. QED.

With nonnegative diagonal charge weights this gives a positive closed-path
ensemble and the usual finite conditional law; it need not make each
original net term in (A2) positive, and the phases D may depend on L and
need not arise from local categorical vertex gauges. The entries used in
this test are computed from **C,O,h**, not from a distinguished model.
The existence of some positive representation with unrestricted extra
variables, regroupings or nonlocal changes is not classified here.

## H1-D3. Temporal reflection positivity is independent of termwise signs

**Tags:** any; L0 + O,h, temporal dagger reflection and spanning half-patch
insertions; finite →R3. Spatial reflection requires CA-92's separate data.

**ASSUME** h_j=h_j†. **PROVE** each exact temporal seam exp(t h_j) is
strictly positive and the symmetric row R is positive, but neither fact
implies nonnegative closed net weights.

<1>1. By CA-80 Lemma 80.2 the reflected form is
q(x,y)=⟨x,Σy⟩, and all-insertion RP is equivalent to Σ≥0.
For Σ=exp(t h), its eigenvalues are exp(tλ)>0. BY spectral calculus and
CA-80:87–104. This is operator positivity, not entrywise positivity.
<1>2. With odd/even positive commuting layers A,B, the symmetric row is
R=A^(1/2)BA^(1/2)=(B^(1/2)A^(1/2))†(B^(1/2)A^(1/2))>0.
BY CA-80 Lemma 80.4. This also proves positivity for the row seam.
<1>3. Whenever a charge multiplicity block of End_C(O²) has dimension
at least three, take three isometric inclusions and set h=S on them,
zero elsewhere, with

    S=[[0,1,−1],[1,0,1],[−1,1,0]],  S²=2I−S,
    exp(tS)=a(t)I+b(t)S,
    a(t)=(2e^t+e^(−2t))/3,  b(t)=(e^t−e^(−2t))/3>0 (t>0).   (D6)

BY direct multiplication; the eigenvalues are 1,1,−2. Three successive
exact tiles have the closed E-matrix-unit history 1→2→3→1 with coefficient
product −b(t)^3 and categorical closure d_c>0. In the D normalization
the coefficient product is divided by g_1²g_2²g_3² and the closure is
multiplied by that same factor. Hence its weight is
−d_c b(t)^3<0, while all seams satisfy <1>1–<1>2. Every C admits this
microscopic declaration, for example O=1_v⊕(1⊕1); no model-specific F
data is needed. The triangular phase product is −1, so the path-gauge
criterion in D2 cannot remove it. QED.

**Converse separation [proven, outside the exponential subclass].** The
matrix [[1,2],[2,1]] gives strictly positive finite path weights and is
reflection-symmetric, but its eigenvalue on (1,−1) is −1. Thus positive
classical weights do not imply all-insertion temporal RP. BY direct
matrix multiplication and CA-80 Lemma 80.2. It cannot be exp(t h) for
self-adjoint h, so it does not contradict the theorem just proved.
Conversely, a positive probabilistic gluing which factors as
Σ_s p_s overline(f_s)g_s with p_s≥0 *does* imply RP, since its quadratic
form is Σ_s p_s|f_s|². Such reflected factorization is extra structure.

These results settle the relation requested in H1(d)(iii). They do not
prove spatial RP or whole-history OS positivity in both directions:
CA-92:96–120 requires a declared seam, reflected-half compatibility and
its bent-kernel conditions.

## H1-E. Exact time-step response; continuum conjecture kept separate

**E-finite [proven]. Tags:** any; L0 + O,h, a fixed tile basis and a
declared geometric conversion; finite →R3, with a prospective P3 interface.

**ASSUME** h=Σ_α c_αD_α, D_αD_β=Σ_γ M^γ_(αβ)D_γ, and positive
numbers a_x,v_* fixing units. Define the dimensionless *declared*
time/space ratio η=v_*t/a_x. **PROVE**

    w(t)=exp(t M_c)w(0),
    (M_c)^γ_β=Σ_α c_α M^γ_(αβ),  w_α(0)=τ^α(id),
    ∂_η w = (a_x/v_*) M_c w.                                (E1)

<1>1. The coefficient ODE is CA-78 Proposition 78.2, equations 78.1;
its constant-coefficient solution is (E1). BY uniqueness of the finite
linear ODE, or direct differentiation of its convergent matrix power series.
<1>2. Substitute t=ηa_x/v_* and apply the chain rule. BY the definition
of η. This is exact at finite t, not w_α=t c_α.
<1>3. For a differentiable geometric parameter s which also varies h,
differentiate each exponential by CA-80 Lemma 80.6:

    ∂_s exp(t h(s)) = ∫_0^t exp((t-u)h) (∂_s h) exp(u h) du

when t is held fixed, with the additional term (∂_s t)h exp(th) when t
varies. The patch derivative is the sum over replacing one tile by this
derivative. BY CA-80:127–135 and the product rule. QED.

No physical velocity or conformal modulus has been obtained by defining
η. Determining v_* from dispersion/metric response and identifying (E1)
with a continuum stress insertion are separate lemmas. Rescaling h↦q h
changes w(t) to w(qt), with identical C and O. Thus categorical data alone
does not fix this conversion. An additive spectral parameter of an
integrable face family is extra data; it need not coincide with t or η,
and its face operator need not equal exp(t h) at finite parameter.
The model-specific checks in the Examples table make no such identification.
CA-86:273–279 also corrects its brick-row commutativity and ground-state
eigenvector assertions; those uncorrected assertions are not used here.

**E-scaling [conjectural, conditional on a selected positive critical
family]. Tags:** any (chirality undecided); L0 + O,h(λ), positive
presentation, boundary tensors, critical tuning, macroscopic geometry and
configuration topology; finite reached, a conformally covariant marked-net
law claimed. Such a law would be an ingredient →R3, not by itself R3/R4.

Here is a precise target with the quantifiers separated from selection.
For arbitrary C and pointed O, fix a translation-periodic finite brick
model with a specified positive presentation (D5), a real coupling λ,
and **one fixed** critical choice λ_*. Consider its rescalings of mesh
ε→0 in every bounded simply connected Jordan domain D, with boundary
conditions b_ε converging to b in a declared boundary-data space (including
the locations of marked points and their fixed-fibre tensor coefficients).
Do not alternate between different models
as ε changes. By a nondegenerate continuous critical choice we require:

1. An infinite-volume state is selected and the exponential decay rate of
   a declared occupied-net connection event is zero. This event and the
   chosen state are part of the data, not inferred from h being gapless.
2. For every fixed annulus shape, the probability of that connection
   crossing its rescalings is bounded between q and 1−q, for some q>0
   depending on the shape. The bound is uniform for ε/r sufficiently small,
   with r the annulus scale and the rescaled annulus and a fixed-size
   surrounding collar contained in the bulk. This
   excludes a frozen configuration and a dilute ensemble of vanishing loops.
3. Fix the microscopic row step t_*>0 and reference spacing a_x>0.
   Select v_*>0 and put η_*=v_*t_*/a_x. In coordinates
   (x,y)=(εj,εη_*n), every subsequential bulk law, whenever it exists,
   is invariant under translations and rotations. This is a declared
   Euclidean-isotropy hypothesis, weaker than (E2); proving it for the
   selected model is an open part of tuning, not a consequence of (E1).

Declare a Polish configuration space N(D), an embedding of the discrete
labelled nets into it, a topology retaining macroscopic connectivity,
orientation, simple labels and junction marks, and compatible restriction
and conformal-image maps. Require finitely many components of diameter
above each cutoff on compact subsets. For nets with arbitrarily dense
branching, constructing such an admissible marked topology is itself an
open lemma; ordinary loop topology cannot silently be substituted.

**Conjecture:** for admissible data just specified the probability laws
μ^b_(D,ε) have a unique scaling limit μ_D^b with positive-diameter features
and nontrivial probabilities for the specified macroscopic connection events
(retaining the q,1−q bounds on continuity events), and for every
conformal bijection f:D→D′,

    f_* μ_D^b = μ_(D′)^(f_*b).                               (E2)

Here pushforward transports geometry and categorical labels; (E2) concerns
normalized laws, not a claim that
unnormalized partition functions have no conformal anomaly. The minimal
sufficient hypotheses for this universality claim may need strengthening;
criticality and the finite identities are not a proof of it. No existence
of λ_* (or of a suitable positive presentation) for every C,O is asserted.

**Separate conjectural kernel lemma E-Markov.** For each test subdomain Q,
construct a measurable limiting boundary-state space B_Q, maps taking the
finite exterior rays [L_ξ] to B_Q, an extraction map β_Q from limiting
exteriors, and probability kernels K_Q(ℓ,·). Prove joint convergence of
the rescaled exterior and the kernels defined by (C2), tested against
bounded continuous interior/exterior functions, and prove

    μ_D^b(A | exterior of Q)=K_Q(β_Q(exterior),A)  a.s.

Nested Q must obey the same sewing consistency. Neither B_Q nor this
kernel convergence is constructed here. Growing cut spaces prevent reading
(C2) as a literal continuum ratio without this additional lemma.

This is a **conformal marked-net** conjecture. Only in an appropriate
nonbranching, unlabelled marginal could one additionally ask for a
particular CLE law. Ordinary CLE structure, an SLE exploration parameter,
and a map from d_a to such a parameter are not assigned to arbitrary C.
Signed/complex net amplitudes remain meaningful via H1-A but are not
probability laws to which this conjecture directly applies. A positive
path re-encoding is insufficient unless it also reconstructs the required
geometric nets and their boundary-conditioning data.

**What is proved and what a limit proof consumes.** H1-B gives the exact
contractible-loop fugacity d_a. H1-C gives finite boundary-tensor Markov
consistency *after* positivity; E1 gives the exact microscopic derivative.
None supplies tightness of macroscopic curves, uniqueness, conformal
covariance, convergence of conditional kernels after revealing a random
slit, a local stress observable, or a faithful categorical CFT. In
particular weak convergence alone does not justify passing conditional
probabilities through a limit. Each missing implication is listed below
as an independent lemma obligation.

## Offline source audit and acceptance

The reproducible search is `checks/source_audit.py`; raw matches, including
duplicate extractions and bibliography-only hits, are in
`checks/source_audit_output.txt`. Searches cover `references/` and
`literature/md/`, with the required terms Markov, loop model, O(n), CLE and
Schramm, plus domain Markov and SLE. A failed text search is not treated as
a proof that a result does not exist.

The brief's blanket absence claim needs correction. AFM-S:71–89,128–139
already explicitly writes the local-weight times categorical-evaluation
geometric ensemble, includes dilute distinguished objects, and describes
arrows and multiplicity indices. CA-78:56–68 already removes the tile
truncation. H1-A consolidates those facts with the complete pointed-site
dictionary, rather than claiming the exact expansion was previously absent.

CGS:527–532,572–615,784–796 discusses CLE/SLE and explicitly distinguishes
its conjectures from a special proved case (listed below). Schottenloher:
7335–7349 gives an SLE overview and pointers. HKV13:1234–1239 uses a
domain Markov property for a different field model; it does not establish
H1-C for signed categorical nets. HKV22:202–216 also discusses SLE/CFT.
BR24:2214 references SLE loop measures and anomalies. The Markov-trace
search contains algebraic traces, which are distinct from probabilistic
domain Markov laws. Two of the four case-insensitive “CLE” matches are
line-break/OCR fragments, not references to conformal loop ensembles.

**Source gaps retained, without network acquisition:** (SG1) a primary
construction/characterization source giving the exact SLE and CLE Markov
axioms and the applicable configuration topology; (SG2) a theorem passing
discrete explorations and conditional laws to their limits; (SG3) a
general labelled *branching-net* analogue, with categorical boundary
tensors; (SG4) a general-C conformal-limit and stress/Ward theorem. None
was located with the needed scope. Schramm's original scaling-limit paper
and Lawler's *Conformally Invariant Processes in the Plane* are specific
acquisition leads listed locally at Schottenloher:7373–7374, not imported
theorems. A primary CLE characterization/exploration source still needs
identification and registration. The local CGS source is usable now as
motivation with its stated scope; it is not a general-C proof. The OCR
Loewner formula in Schottenloher:7343 is visibly unreliable and is not used.

**Checks completed.** Commands and conventions are in `checks/README.txt`.
All are finite exact calculations, with no Julia suite or large matrices.

- `check_patch.py` / `check_patch_output.txt`: sixteen rescaled tile
  products equal an independent indexed contraction in a symbolic unitary
  F block; complex inverse-Gram sewing and F^−T duality hold. Five actual
  mutated equalities fail. The arbitrary F block tests the algebra required
  of any category; it is not asserted to solve categorical pentagons.
- `check_signs.py` / `check_signs_output.txt`: formula (D2) holds for
  arbitrary d>0; 1,098 compatible decorated closed paths per sign through
  length six are positive. A one-cup mutation gives −9/16 and is caught.
  That mutation intentionally breaks adjoint pairing. The script also
  verifies the raw FS contraction and the exact positive-seam/negative-cycle
  matrix witness. The all-length proof is the occupation argument, not
  the finite enumeration.
- `check_fs_instance.py` / `fs_instance_output.txt`: an independently
  sourced category satisfies all sixteen cocycle pentagons; the actual
  four-site history in (D4) has evaluation −1 and weight −729/4096 with
  positive exact geometric coefficients. Instance details are below.
- `check_anisotropy.py` / `anisotropy_output.txt`: the sourced face weights
  pass regularity, the special spectral-parameter reduction and branch
  arithmetic; the wrong cup-cap sign is detected by its Hamiltonian tangent.

**Review and friction.** Two independent skeptical collaborators checked
the general statements. Their concrete corrections are incorporated:
conditional independence only needs factorization on attainable tensors;
E versus D matrix-unit norms cancel in the negative triangle; cycle tests
include parallel-edge two-cycles; the scaling aspect ratio is η_*, not the
velocity v_*; annuli must be resolved by the mesh; continuum boundary kernels
need their own state-space/convergence lemma. A third collaborator wrote
and ran the patch/sign checks, which were read against the displayed proofs.
No reviewer claim substitutes for those proofs or source anchors. The
main dead end was the requested universal positive-measure conclusion:
its two sign counterexamples require reformulation, not an extra estimate.

## Results ledger

- H1-A, complete tile-to-net dictionary and exact patch expansion — proven.
- H1-B, normalized bubble/F/contractible-loop rules and precise Markov trace — proven.
- H1-B2, ordinary Gibbs trace requires the boundary factor J_L — proven.
- Unrestricted loop decoupling, and exact Gibbs equality at finite Trotter step — negative.
- H1-C-algebra, inverse-Gram sewing and exterior-boundary functional — proven.
- H1-C-probability, boundary-tensor domain Markov law — conditional on nonnegative scalar weights and positive conditioning denominator; the implication is proved.
- H1-C-labels, endpoint labels alone suffice; inverse Gram is stochastic — negative.
- H1-D1, corrected loop positivity and phase criterion — proven.
- H1-D1-original, coefficient nonnegativity iff closed-weight positivity — negative in both directions without the stated extra hypotheses.
- H1-D2-F, nonnegative complete unitary F calculus iff pointed with trivial associator class — proven.
- H1-D2-original, Hom(X,X⊗X)≠0 universally forces intrinsic F signs — negative for the allowed general X.
- H1-D2-gas, fixed-presentation positivity criterion and finite-volume path-gauge cycle criterion — proven; unrestricted positive re-encoding is not classified.
- H1-D3, temporal reflection positivity does not imply positive net weights (and converse cone separation) — proven.
- H1-E-finite, exact weight ODE and declared time/space-response identity — proven.
- H1-E-metric, interpretation of the declared ratio as physical conformal anisotropy — conditional on additional velocity/metric identification, not supplied.
- H1-E-scaling, conformally covariant critical marked-net scaling law — conjectural.
- H1-E-Markov, common limiting boundary space and convergence of conditional kernels — conjectural.
- H1-checks, symbolic patch, inverse-Gram, sign, FS and face-weight invariants with eight rejected mutations — proven by the recorded exact runs, within their declared scope.
- H1-source-audit, recorded local evidence and qualified source gaps SG1–SG4 — proven as a reproducible search record, not as a literature completeness claim.

## Layer tags

| Statements | Setting | Input layer and microscopic declarations | Rung reached | Rung claimed |
|---|---|---|---|---|
| A–C algebra, B trace | any | L0; pointed O, h, oriented decorated tiles, full cuts, declared closure/charge weights | finite, on the existing R0 carrier | →R1/→R3 ingredient |
| C probability, D1 | any | L0; additionally nonnegative scalar weights, nonzero normalization, oriented or κ=+ loop convention as specified | conditional finite law | →R3 ingredient |
| D-F | any | L0; generated subcategory and simple-object unitary fusion bases | finite categorical obstruction/classification | no continuum rung |
| D2 gas/path tests, D3 | any | L0; additionally specified representation, h placements, temporal dagger seam, spanning probes | finite tests and counterexamples | →R3 ingredient |
| E1 | any | L0; h, tile structure constants, a_x,t,v_* declared | finite response | →R3 ingredient, no KS matching proved |
| E2 and E-Markov | any; chirality unchosen | L0 plus selected positive critical family, geometry, topology, boundary-limit data | finite ingredients only | conformal marked-net law, itself →R3 |

The inherited R0^c and trailing R0^u facts are CA-77, not new claims.
No OAR R1, Virasoro R2, local conformal theory R3, faithful R4 or functorial
R5 conclusion follows here. L1–L4 must be added where a later target
requires braiding, modular fidelity, enrichment or a specified theory.

## Pillar served

**P2 first:** the exact C-evaluated spacetime net gas is the finite object
on which geometric response and scaling questions can be posed. Its
probability interpretation is precisely separated from its always-defined
amplitudes. **P1 inseparably:** the pointed occupancy flags and all allowed
number-changing matrix elements are retained, including occupied unit
copies; reaction histories cannot be restricted to one N. E1 exposes an
interface to P3, but no discrete conformal equation is solved. P4 is not
proved; the finite Gibbs/Trotter comparison is not an OAR construction.

## What this gives the integration

The **finite (any,L0,→R3) ingredient cell** occupied by CA-78/80/86 gains
the explicit general pointed net dictionary, the trace declaration, and
the exact probabilistic obstruction/conditional-law statement. This is the
P2 object itself, not a new rung. No CA-88 R1–R5 existence cell moves.

It opens **CA-75 Link (a)** concretely: (a2) has exact leg-cut sewing and
full boundary conditioning; a straight seam cutting plaquettes still needs
the CA-92/98 machinery and its hypotheses. (a3) now has the exact local
weight response (E1) to feed metric/Ward equations; identifying it with KS
and proving vanishing total residual are open. (a1)'s module-category
boundary identification and (a4)'s conformal/anomaly-line limit are not
solved. Boundary choices remain declared data, not a new research priority.

## Open problems

Each item is a sharp missing implication; none is smuggled into “proven”.

1. **Positive local net realization.** Given (C,O,h) and an explicitly
   bounded local class of gauge changes/auxiliary variables/regroupings,
   decide whether all closed decorated weights admit a nonnegative
   representation retaining the categorical geometry. D-F classifies only
   complete recoupling positivity; D5 and the path-cycle criterion are
   narrower tests. A global spectral sum would be positive but would not
   solve this local geometric problem.
2. **Critical selection/noncollapse.** Construct λ_* and boundary states
   meeting E's connection bounds for a general declared categorical input,
   with number-changing reactions active where permitted. No special
   category's critical weights are a substitute for this lemma.
3. **Metric/anisotropy identification.** Prove a finite positive physical
   conversion v_* and Euclidean bulk isotropy, and identify the derivative
   of E1 with a renormalized geometric stress insertion. The identity
   h↦q h rules out a category-only numerical conversion.
4. **Tightness and marked topology.** Produce N(D), control macroscopic
   components/junctions, and prove tightness without losing labels or
   connectivity. Uniform crossing estimates alone are not used as a
   tightness theorem here.
5. **Continuum kernel lemma.** Prove E-Markov, including compatibility of
   changing cut spaces and continuity under a random revealed slit.
   Determine when the boundary state reduces to ordinary SLE/CLE data;
   otherwise formulate the required richer marked-net specification.
6. **Conformal identification/uniqueness.** Prove E2 from a sourced
   observable or local conformal-equation certificate, including domain
   approximation and boundary convergence. No universal d_a→κ relation
   for arbitrary C has been derived.
7. **P3/P4 join.** Prove the discrete Ward insertion is the KS stress on
   the same refinement/state system, with the analytic bounds needed by
   CA-81/89/95. Then prove local reconstruction and, separately, categorical
   fidelity at the declared target layer. A conformal random geometry alone
   is not a proof of those steps.
8. **Source and convention integration.** Acquire/register SG1–SG4 as
   needed; propose the vertex/trace/closure conventions above to the global
   record only in a later authorized integration. This task deliberately
   changes neither CONVENTIONS nor the worklog/report/index.

## Examples table

| Instance (checks only) | What it checks; what it does not establish |
|---|---|
| Synthetic 2-channel unitary F(r,z), z*=z^−1 | Sixteen-term exact patch identity, rescaled vertices, Gram and dual conventions. No pentagon or categorical realizability claim; `checks/check_patch.py`. |
| Abstract raw pair block, any d>0 | Exact exp(±t(b+b†)), sign-coboundary invariant and one-cup mutation. The enumeration tests the block, not all spatial nets; `checks/check_signs.py`. |
| Hilb_fd(Z/2,ω), ω(a,b,c)=(−1)^(abc), O=1_v⊕g | Local Penneys:595–603,931 gives a pseudoreal simple g. All sixteen cocycle pentagons pass; the four-site FS history has Ev=−1 and negative weight despite positive coefficients. `checks/check_fs_instance.py`; a witness for D-FS, not the general subject. |
| A three-dimensional unit-copy block in any C | exp(log(2)S) has eigenvalues 2,2,1/4 but the closed triangle weighs −343/1728. Checks the category-independent multiplicity obstruction of D3. |
| Dilute TL-type face weights of Zhou–Batchelor | At u=0, four projector coefficients are 1. At u=λ, ρ_9=0, ρ_(2,3)/ρ_1=x and ρ_(4,…,8)/ρ_1=x², x=1/(2cosλ), n=−2cos4λ. sqrt(2−n)=2|cos2λ| gives the two branch identities of CA-86. `checks/check_anisotropy.py`; no general-C spectral parameter or conformal proof. |
| Ising parameter n=1 in CGS | Source-local stress/correlation convergence, CGS:527–532 and theorem labels at :876,:909,:927. It does not prove E2 for general C or general n; no run of that theorem here. |

## Sources used

The short names used above expand to the following exact local anchors.
External works cited by these sources are **not** thereby treated as read.

- **Penneys:** `references/text/PenneysUnitaryFusionCategories.md:219–237`
  (orthogonal sums), `:284–288` (cocycle), `:394–430` (graphical calculus,
  oriented duals), `:528–568` (vertex norms and F), `:589–608` (gauges and
  pointed data), `:907–961` (pivotal/spherical traces and self-duality),
  `:1010–1047` (positive spherical trace; raw FS signs).
- **ENO:** `references/text/EtingofNikshychOstrikFusionCategories.txt:134–144`
  (associator cocycles), `:1970–1971` (pointed categories).
- **Levin–Wen:** `references/string-net/LevinWen2005/source/strnet.tex:497–524`
  (local graphical rules); their coefficients/normalizations are translated
  via the explicit u/V dual-basis convention rather than silently copied.
- **AFM-F:** `references/cft/AasenFendleyMong2020/source/_fusion_categories_and_diagrammatics.tex:30–88`
  (fusion and dimension identities), `:175–184` (restrictions in that paper),
  `:353–380` (FS and bending phases).
- **AFM-S:** `references/cft/AasenFendleyMong2020/source/_Statistical_mechanics_from_fusion_categories.tex:17–21`
  (integrability requires extra tuning), `:39–89` (geometric ensembles),
  `:128–139` (dilute, oriented, multiplicity extensions), `:536–553`
  (weights and Hamiltonian limit), `:785–788` (multiplicities).
- **Zhou–Batchelor:** `references/lattice-symmetry/ZhouBatchelor1997/source/9611156.tex:104–145`
  (loop ensemble and exact spectral face weights; calibration only).
- **CGS:** `references/lattice-symmetry/ChelkakGlazmanSmirnov2016/source/StressTensor.tex:527–532`
  (proved/conjectured scope), `:558–615` (critical-loop/SLE/CLE discussion),
  `:784–796` (Conjecture T), `:876,:909,:927` (special-case theorem labels).
- **Schottenloher:** `references/cft/Schottenloher2008/Schottenloher2008.md:7335–7349`
  (SLE overview, not its OCR formula), `:7373–7374` (acquisition leads).
- **HKV13:** `references/lattice-symmetry/HonglerJohanssonKytola2013/source/vir_20130715.tex:1234–1239`
  (located field-model Markov statement, not a net theorem).
- **HKV22:** `references/lattice-symmetry/HonglerKytolaViklund2022/source/lattice-virasoro-updates-final.tex:202–216`
  (located SLE/CFT discussion).
- **BR24:** `references/categorical-reconstruction/BrehmRunkel2024/source/main.tex:2214`
  (SLE-loop anomaly reference; no theorem imported).
- **CA-66:** `report/sections/66_anyonic_states_variable_n_fock.tex:54–106,128–152`.
- **CA-77:** `report/sections/77_pointed_carrier_invariants.tex:47–60,90–116,207–226`.
- **CA-78:** `report/sections/78_categorical_selection_equations.tex:44–68`
  (compiler and exact gate ODE), `:90–97` (topological versus conformal response).
- **CA-80:** `report/sections/80_lattice_sewing_and_fidelity_certificate.tex:52–140`
  (exact patches, Gram sewing, temporal RP, Duhamel and limits of coverage).
- **CA-86:** `report/sections/86_spacetime_trotter_dictionary.tex:61–110,154–217,273–279`
  (first-order dictionary, calibration and erratum).
- **CA-87/77 boundary:** `report/sections/87_dilute_fibonacci_is_blocked_golden.tex:54–69`
  and CA-77:124–158 (blocking is conditional, not an input restriction here).
- **CA-88:** `report/sections/88_layered_targets.tex:54–56,82–130,141–151`.
- **CA-92:** `report/sections/92_spatial_seams_and_reflection_positivity.tex:53–121`.
- **CA-75:** `report/sections/75_integration_map.tex:115–138` (Link (a)).
- **Conventions/status:** `CONVENTIONS.md:631–694,1397–1464,1486–1543,1595–1608`;
  `worklog/023_2026-10-27_status_overview.md:18–89,158–195` (read as status,
  not as proof; the source-gap wording is qualified by this audit).
- **Registration manifests:** `references/manifest/SOURCES.md:15,35,57`;
  `references/category-theory/SOURCES.md:134–147`;
  `references/string-net/SOURCES.md:19–85`;
  `references/cft/SOURCES.md:9–28,73–116`;
  `references/lattice-symmetry/SOURCES.md:104–143,1164–1195,1731–1782`;
  `references/categorical-reconstruction/SOURCES.md:33–51`.
- **Reproducible evidence:** this directory's `checks/README.txt`, all five
  scripts, and their corresponding raw output files. Source audit is a
  search index; the other four scripts assert exact finite invariants.
