# D6 — A typed categorical compiler and its layered obstruction theory

**Status (2026-10-22):** one universal conjecture; conditional structural theorems,
an explicit formal presentation complex, and negative results about insufficient
certificates. No general categorical CFT construction is proved here.

## Headline conjecture

**D6-C — Effective enriched categorical realization [conjectural].**
There is one algorithm which terminates on every finite algebraic presentation
of a unitary modular tensor category C (including certified dagger, associator,
braiding, duality and nondegeneracy) with the following output, encoded by
finite programs for infinite coefficient sequences, towers and error moduli.
It selects a nonnegative rational conformal charge c lifting the topological
charge, nonnegative rational sector weights lifting the twists, computable
finite-grade character multiplicities, and a presentation of the vacuum chiral
field algebra, allowing generators beyond stress. It constructs a tower satisfying
K0–K12 below, with computable error moduli, whose OAR limit is a completely rational
local conformal net with that c, those characters, and a specified unitary braided
equivalence `C ≃ Rep(A)`. Its standard Hamiltonian-derived KS modes converge to
the internal stress of A, including finite products on a common domain and real
smooth smearings generating the full positive-energy projective unitary
`Diff_+(S^1)` action. Local cutoff dimensions may grow; interaction range in the
declared fusion-space support structure remains uniformly bounded.

Moreover the selected enriched outputs admit coherent transport along **all
enrichment-preserving unitary braided equivalences**: compilation is a functor
on their equivalence groupoid into the OAR localization defined below.
Enrichment is selected objectwise; no functorial choice along bare-category
equivalences that change the selected enrichment is asserted.
It need not choose the same microscopic Hamiltonian for different presentations.
The conjecture concerns chiral realization; full CFTs require the separately
typed left/right and extension data below. Fusion-only input needs a declared
modular target or a separate defect realization problem.

The quantifiers matter. This is an algorithm selecting a compatible enrichment
for every C, **not** a claim that every proposed c lift or character vector is
realizable. For a supplied fixed enrichment the compiler is partial, and must
preserve it when it succeeds. Its failure is not a category exclusion.
No pre-existing CFT, completed sewing solution, all-scale error certificate, or
termination oracle is an input to D6-C. Supplying one would define a materially
weaker inverse-discretization problem. The source problem is already open at
the continuum level [S1]; this conjecture adds locality, standard KS, effective
OAR convergence, sector completeness, and coherent choice over enriched inputs.

**Exact proved boundary.** This note proves a conditional corner-to-Wilson
estimate (P2), a finite unital-extension criterion (P1), an exact history-sewing
identity (P3), a formal obstruction theorem (P4), and continuum transport (P5).
P6 supplies a quantitative correction lemma. None constructs the initial
positive conformal lift or the all-scale bounds required by D6-C.

## Conventions proposed

These are local proposals, not edits to the root convention ledger. Root
entries (a)–(ai) were read. We use (r) for categorical dagger/left-associated
chains, (s) for two central coefficients, (u) for fidelity, (v),(x) for
WT/VR, and (ac)–(ai) for sewing, domains, Fourier signs and positive quotients.

- `n≥0` is refinement scale; `k,m∈Z` are mode indices; `t` is a formal
  deformation variable; `u≥0` is Euclidean time. These are different parameters.
- Write `H_n^raw=Σ_j h_(n,j)` and `G_(n,j)(u)=exp(-u h_(n,j))`.
  Thus our h is **minus** the h in branch CA-86:62. The density current is
  `J_(n,j)=i[h_(n,j),h_(n,j+1)]`, as in (af).
- Circle charts have length `2π`. Periodic nearest-neighbour KS, when used,
  has exactly LC-4:63–82's normalization, offsets and two chiral signs.
  Open-chain categorical placements do not thereby acquire periodic coherence.
- Microscopic states are `σ_n`; horizontal limit states are `ω_n`.
  Physical categorical carrier isometries are W; canonical GNS isometries
  are J. Identifying them requires a unitary comparison, not matching dimensions.
- Formal coefficient spaces are real when adjoints or Gram forms vary.
  Dagger charts use independent real/imaginary coordinates. The full equality
  complex is numbered gauge/variables/equations/identities = degrees 0/1/2/3.
  Thus its H² corresponds to binary Hochschild H³, not Hochschild H².
- `c` is fixed in a fixed-enrichment deformation; running Hamiltonian couplings
  are `g_n`. Changing c to remove an obstruction changes the problem.
- Norms in WT are dual operator norms; VR uses specified graph norms.
  A cyclic GNS seminorm is never silently substituted for either.
- No numerical R-symbol gauge is selected here. Braiding is used as abstract
  supplied coherence data, transported with its dagger; no model matrices enter.

## 1. Source: a moduli problem before a single-valued compiler

**Definition D1 [proposed type].** A trial source object is `s=(C,E,B)`.
C is a presented unitary modular category; E is the conformal specification;
B is optional microscopic/boundary design data. Precisely:

| Slot | Data and equality demanded of source morphisms | Why it is declared |
|---|---|---|
| C | Fusion spaces, unit, dagger, F, braiding, duality, ribbon structure | Fusion rules or S,Θ alone do not specify C [S2] |
| E.chirality | Chiral, full, or defect-only target | These have different sector and symmetry assertions |
| E.energy | c and h_i with h_unit=0, c≥0, h_i≥0, `exp(2πi h_i)=θ_i` | The category fixes residues, not absolute energies [S1,S3] |
| E.carriers | `χ_i(q)=q^(h_i-c/24)Σ_(r≥0)d_(i,r)q^r`, integer d_(i,r)≥0, d_(unit,0)=1; computable coefficients and convergence requirements | Categorical multiplicity is not descendant multiplicity; characters are constraints, not a CFT |
| E.fields | A chosen graded generator/relation search presentation with a distinguished conformal vector, or the instruction to synthesize one | Stress alone is not required to generate the whole chiral algebra |
| E.fidelity | Modular-data matching or the stronger braided equivalence; D6-C chooses the latter | Equal S,Θ does not imply braided equivalence [S2] |
| B | Optional site object O, vacuum inclusion, module category, boundary algebra, support grammar, regulator schedule | These are construction choices; they are not invariants of a bare C |

Trial means **no solvability asserted**. No theorem identifies a minimal
sufficient finite enrichment. The minimal defensible *declaration* consists of
target type, fidelity level, energy-lift policy, and what analytic carrier/field
data are supplied versus synthesized. Characters constrain dimensions and do
not supply OPE coefficients. A complete chiral algebra, if supplied instead,
must be labelled as additional input, with its analytic status stated.

For a full target, replace E by two chiral specifications plus a pairing/local
extension specification and state which chiral category must reproduce C.
A Frobenius algebra construction relative to an existing chiral theory is
source-supported [S4]; it is not a construction of that chiral theory.
For a fusion-only C, use an explicit unitary tensor functor into a declared
modular category D together with its intended role, or request C as defects.
Taking D=Z(C) changes the requested sector category and must be stated [S1].

Source 1-morphisms are unitary braided tensor equivalences F with specified
unitary identifications transporting every supplied slot; on characters this
is exact sector relabelling. Source 2-morphisms are unitary monoidal natural
isomorphisms respecting those identifications [S5]. This defines a 2-groupoid.
For the concrete functor below we pass to its homotopy 1-groupoid S: arrows
are 1-morphisms modulo those 2-isomorphisms. A future pseudofunctor retaining
2-cells must also specify unit/composition comparison maps and their pentagon.

The always-defined answer to a trial input is the groupoid `Sol(s)` of
certified constructions, possibly empty. Transport is easier to define on
all constructions than to choose one. A single-valued compiler is a coherent
section of this solution assignment; objectwise nonemptiness is insufficient.
The headline asserts both nonempty suitable fibres and coherent effective choice.

## 2. Target and the reconciled contract

**Definition D2 [proposed type].** A candidate tower is
`T=(s; Λ_n,A_n(I),α_n,h_n,σ_n,T_(n,k),K_n; Z,D,ε)`.
The finite unital C*-algebras have faithful finite representations and a specified
interval-support assignment; `α_n:A_n→A_(n+1)` are unital injective *-maps.
Z denotes cell data/comparison maps, D denotes defect/charged-sector data,
and ε collects certificates with quantifiers, constants and error moduli.
For a categorical backend one may take `A_n=End_C(O_n^⊗N_n)`; this is an
option, not an axiom restricting the whole programme. The preferred vacancy
backend has `O=1⊕X`. Its global fusion constraints are part of the carrier.

K0–K12 are a single acceptance contract, not thirteen already-proved theorems.
“Construction” in the table means an available ingredient; every unfilled
obligation remains the compiler's responsibility.

| Axiom | Precise requirement | Available construction / outstanding obligation |
|---|---|---|
| K0 typing | Supply D1, unitary bases, boundary/seam conventions, quotient/null policy and effective encoding | CA-01, CA-62, LC-1 specify inputs; conformal enrichment is unsynthesized |
| K1 locality | Isotony and commuting disjoint interval algebras; each h_(n,j) has ≤R neighbouring cells, R independent of n; α enlarges physical supports by ≤r a_n with Σ_n a_n<∞ | CA-65 finite categorical locality; CA-67 support contract; periodic seam and dressed-map locality need proof |
| K2 refinement | Exact unital injective *-maps with coherent composites; Hilbert refinement is canonical GNS J after K4, or explicitly identified with it | CA-71 supplies bare W and corner composition, not unital α; P1 isolates the missing extension |
| K3 dynamics and KS | Self-adjoint density, named ground-energy subtraction, positive microscopic Hamiltonian/state tier; T_(n,k) is the prescribed KS expression from that density/current | CA-15, CA-73 and LC-4 provide residual calculus; CA-86 supplies transfer tiles; no general critical coupling construction |
| K4 Wilson states | `||σ_(n+1)α_(n+1)^k−σ_nα_n^k||≤d_(k,n)`, summable in n for each k, with computable tails | WT-1/CA-81 prove the limit conditional on these bounds; P2 links a strict corner extension to them |
| K5 one representation | `ω_k=lim_n σ_nα_n^k`; `H_k=GNS(A_k,ω_k)` and `J_k[a]=[α_k(a)]`; every stress/defect estimate uses these same spaces | WT-1 proves isometry and cyclic-vector preservation; CA-72 uses different normalized corner states unless compared |
| K6 controlled mode algebra | All VR-1 A1–A4, for every mode and graph order; two central coefficients converge to the declared c; all finite words converge | VR-1 is a conditional theorem; no general categorical instance, and no instance of this exact certificate is assumed here |
| K7 geometry and histories | Typed cell maps, reflected positive forms, null descent, coherent anomaly lines, all same-geometry sewings, internal Ward/stress equations; microscopic transfer/history comparison with controlled errors | LC-1–3, LC-9–10 give equations; CA-86/P3 give finite tile sewing only; the comparison theorem is missing |
| K8 dynamics identification | Refined `exp(itH_n)` conjugations converge in the K5 representation; limit generator agrees with normalized stress energy | CA-15/67 demand it; source [S6] treats it separately from state convergence |
| K9 integration and local covariance | Positive L0, unique Möbius-invariant vacuum, essential self-adjointness of real smooth stress, unitary convergence and strongly continuous projective Diff action; `U(g)A(I)U(g)*=A(gI)` and localized implementers | CA-15 and LC-4 identify the gap; [S7] supplies definitions and conditional representation results, not general existence |
| K10 sectors and defects | A tensor action with junctions/duals; localized charged sectors and transporters survive with their intertwiners, braiding and positive norms | CA-62 finite defect motivation; CA-73 residual transport is not a sector theorem; [S8] leaves persistence open |
| K11 completeness | Split property, finite μ-index and identification of **all** irreducible DHR sectors with the supplied C; characters and twists match E | Fidelity note and [S1,S2]; finite fusion/MPO actions do not prove this |
| K12 effectiveness and coherence | Algorithms for finite data and norm majorants; computable WT/VR/sewing tails; functorial transport of selected constructions | WT-2 proves evaluation once moduli exist; coherent selection and their synthesis remain open |

In K3 the density split is part of the data. For the periodic tier of (af),
`T_(n,k)=N_n/(4π)Σ_j exp(2πikj/N_n)(h_(n,j)−e_n1−J_(n,j))+b_nδ_(k,0)1`.
The barred tier has the opposite Fourier sign and `+J`; include it only when
specified by the target. The LC-4 conditions `b_n→c/24`, `c_n,c*_n→c`
must be reconciled with the chosen energy origin, not inserted from category
data. Physical velocity normalization is an obligation before this formula.

For clarity K6 means `K_n≥1`, `K_(n+1)J_n=J_nK_n`, and, for every s≥0,

    ||K_n^s T_(n,k) K_n^(-s-1)|| ≤ C_s(1+|k|)^p_s,
    ||K_(n+1)^s(T_(n+1,k)J_n−J_nT_(n,k))K_n^(-s-1)|| ≤ ε_(n,k,s),
    Σ_n ε_(n,k,s)<∞,
    ||K_n^s R_(n;k,m) K_n^(-s-2)|| ≤ η_(n;k,m,s) → 0,

with adjoint pairing and analogous mixed residuals when both chiralities occur.
`R=[T_k,T_m]−(k−m)T_(k+m)−δ_(k+m,0)(k³c*_n−kc_n)1/12`.
Polynomial mode bounds strengthen the per-mode VR-1 interface to support a
smearing programme; they still do not prove K9 by themselves.

For K10 a closed-loop operator list is insufficient. One concrete formal
type assigns to every defect a finite `A_n`–`A_n` bimodule `D_(n,a)`,
junction maps realizing the categorical fusion/associator, duals and refinement
intertwiners. Composition is relative tensor product, not ordinary operator
multiplication [S9]. A charged-sector backend instead uses localized
representations and transporters. The compiler must state the comparison
between these types; the category of full-CFT defects need not equal its
chiral DHR category. K11 requires a fully faithful, essentially surjective
braided functor, not merely an action of the fusion ring.

The time-zero local algebra is generated by represented observables whose
entire subsequent refinement support stays inside I, followed by weak closure;
take unions over compact subintervals of I. The support budget in K1 makes
this definition coherent [S6]. Additivity and recovery of all desired local
fields remain obligations. A chosen sampled-field definition needs a proved
comparison to this net; it cannot be swapped in midway through the proof.

## 3. Morphisms, OAR equivalence, and what a functor would mean

**Definition D3 [proposed].** Initially use scale-preserving tower morphisms
`β:T→T'` over a source arrow. They are unital injective *-maps β_n such that

    β_(n+1)α_n=α'_nβ_n,       σ'_nβ_n=σ_n.

They preserve interval support, density conventions and all defect/field
markings; an allowed vanishing physical support slack must be separately
bounded. They induce GNS isometries `S_n[a]=[β_n(a)]` by K4–K5.
Require `S_nK_n=K'_nS_n` and, for each fixed k,s,

    ||K'_n^s(T'_(n,k)S_n−S_nT_(n,k))K_n^(-s-1)|| → 0.

Require the corresponding dynamics and marked defect intertwinings on their
declared domains. Exact intertwining is allowed. These conditions compose:
the composite mode defect is `E'_n S_n+S'_n E_n`; graph-isometry and the
triangle inequality preserve convergence to zero. Identities satisfy them.
This category uses the fixed common scale set N. Cofinal subsequence changes
are not silently declared morphisms: microscopic states need not be exactly
compatible with refinement, and two subsequences need not intersect.
The effective tier records moduli for the comparisons actually admitted.

**OAR equivalence** of certified towers means a unitary V between their
limiting GNS spaces preserving vacuum, every interval algebra, stress
closures/projective action, and the marked sector/defect data, up to the
specified source relabelling. This is an equivalence relation by composition
and inversion of V. It is stronger than isomorphism of global AF algebras,
equal modular data, equal central charge, or Morita equivalence of matrices.

Let W be the class of tower morphisms whose limiting GNS map is onto and
whose limiting local-algebra inclusions are equalities, with the foregoing
markings intertwined. Use the ordinary category localization `Tow[W^-1]`
(formal zigzags, modulo composition and inverse relations; no calculus of
fractions is assumed). Its isomorphisms give a **certified sufficient** OAR
equivalence. We do not assert that every continuum equivalence lifts to such
a zigzag. Equivalently one can retain continuum intertwiners as explicit
witnesses; deciding equivalence is not claimed algorithmic.

**P5 [conditional, proved].** The continuum construction factors through
this localization on the subcategory satisfying K0–K12.
**ASSUME:** such towers and D3 morphisms; the local completeness and integration
certificates are available. **PROVE:** every W-arrow induces the stated
unitary equivalence, and equivalent diagrams have the same continuum map.

<1>1. Coherence defines a unital map of inductive algebras. State preservation
passes to each horizontal limit by K4; the GNS formula gives a compatible
isometry S of Hilbert inductive limits. BY D3 and the WT-1 norm identity.
<1>2. The graph comparison, VR-1 convergence and density show `ST_k=T'_kS`
on the smooth common domains. BY adding and subtracting the finite modes;
each of the three resulting errors tends to zero. Products use K6.
<1>3. For W, S is onto. Interval equality, K9's chosen closures and K10
give the required vacuum, local-net, unitary and sector intertwining.
<1>4. GNS formulas preserve identities/composition on cyclic vectors, hence
on their completions. Send each formal inverse W-arrow to S inverse.
Relations defining the localization hold for these maps. QED BY <1>1–3.

This proves functorial **passage to limits**, not a functor choosing the input
towers. For a fixed finite group, EQ-1/EQ-2 give a useful compatible operation
on exactly equivariant towers; they do not construct twisted sectors or K11.
A cofinal restriction that still satisfies the contract is directly OAR
equivalent to its original tower: its algebraic/Hilbert unions are dense in
the same limits, and convergent state/mode sequences have the same subsequence
limits. Local support and sector comparisons must be retained. This does not
identify a cofinal restriction with a D3 arrow or assert a fraction calculus.

## 4. The corner-to-Wilson link, with its missing hypothesis exposed

**P1 — Unital extension obstruction [proved finite algebra statement].**
**ASSUME:** `A=⊕_a M_(d_a)`, `B=⊕_b M_(e_b)`, and an injective corner
*-map θ with θ(1)=P. In block b its representation of source block a has
multiplicity r_ba. **PROVE:** a unital *-map α extending θ as a reducing
corner, `Pα(x)P=θ(x)` and `[P,α(x)]=0`, exists iff there are integers

    q_ba≥0 such that e_b−Σ_a r_ba d_a = Σ_a q_ba d_a, for every b.       (1)

<1>1. In any representation of M_d, images of its diagonal matrix units
are orthogonal projections with equal rank: off-diagonal matrix units are
partial isometries between their ranges. Thus its carrier dimension is d
times a nonnegative integer. Central units partition a representation of A.
<1>2. If α exists, restrict it to `(1−P)B(1−P)` in each block. Apply <1>1
to obtain (1). The existing corner consumes precisely Σ_a r_ba d_a dimensions.
<1>3. Conversely, use the q_ba copies of each defining matrix representation
on the complementary subspaces; their direct sum β has unit 1−P. Set
`α(x)=θ(x)+β(x)`. Orthogonal supports give multiplicativity and unitality;
θ's injectivity gives injectivity of α. QED BY <1>1–3.

This obstruction survives conjugating P by any unitary dressing U in B: the block ranks
do not change. Increasing the carrier or changing the algebra can remove it,
but unitary dressing alone cannot. It is a finite representation-multiplicity
obstruction, not an HH or CE class. Passing (1) proves neither local support
nor coherence between different placement paths. Independent scalar augmentation
can change this arithmetic; it also changes the target observable prescription.

**P2 — Corner weight supplies a Wilson bound [proved conditional bridge].**
**ASSUME:** W is an isometry implementing θ, `P=WW*`; σ is a state on B;
`p=σ(P)>0`; `τ=σθ/p` on A; ρ is a chosen coarse state. A unital injective
*-map α satisfies `α(a)W=Wa` for every a∈A. **PROVE:**

    ||σα−ρ|| ≤ p||τ−ρ||+2(1−p).                                (2)

<1>1. The intertwining equation for a and a* shows that ran W is reducing
for α(A). Hence α(a)=θ(a)+(1−P)α(a)(1−P). BY taking adjoints.
<1>2. If p<1, `η(a)=σ((1−P)α(a)(1−P))/(1−p)` is a state, and
`σα=pτ+(1−p)η`. For p=1 positivity makes the complement contribution zero.
<1>3. Subtract ρ and use `||η−ρ||≤2`. This proves (2), including p=1.
<1>4. At consecutive scales let `e_n=||τ_n−σ_n||`. Contractivity of
pullback by `α_n^k` gives `d_(k,n)≤p_n e_n+2(1−p_n)` for all k≤n.
Thus summability of these upper bounds, with effective tails, supplies WT-1.
QED BY <1>1–4 and WT-1:20–38.

CA-72:82–109 computes `v_n²=2(1−√p_n)` for its normalized corner GNS
isometry. Consequently `2(1−p_n)=(1+√p_n)v_n²≤2v_n²`. Summability of
`e_n+v_n²` suffices in this exact reducing-extension tier. The stronger
summability of v_n is unnecessary for this particular estimate. In an
approximate tier an additional quantified map/intertwining error is required.
Notice that p_n controls only one contribution. Even p_n=1 says nothing
about the independently chosen coarse state unless e_n is controlled.

**Negative N1 — the CP shortcut does not close the link.** For
`Φ_χ(a)=θ(a)+χ(a)(1−P)`, CA-72:158–182 proves the same mixture formula
and defect `Φ_χ(ab)−Φ_χ(a)Φ_χ(b)=(χ(ab)−χ(a)χ(b))(1−P)`.
This does give a one-step state estimate. It does not give strict α or the
operator-norm multiplicativity required by [S10]. When P≠1 the norm of this
defect is `|χ(ab)−χ(a)χ(b)|`, independently of σ(1−P).
Take A=M₂, B=M₄, θ in the first block, χ=Tr/2, a=b=diag(1,−1).
The defect is 1−P of norm one even if σ(P)=1. Its cyclic GNS seminorm is
zero. Thus the norm-softness reading of CA-72 Corollary 72.8:184–193 does
not follow from its preceding lemma. All-scale composition and the relevant
norm condition need separate proof. A vacuum-null defect is not operator-null.

## 5. The history-to-sewing link: an exact finite statement

**P3 — Tile evaluation is a sewing map [proved, finite grammar].**
**ASSUME:** C is unitary fusion with the declared spherical/duality data,
O a site object, and a finite ordered brick grammar. A tile is a specified
morphism, ports are typed, and contractions use the actual categorical
evaluation. Gates have expansions `G_j=Σ_a w_(j,a)D_(j,a)` in a complete
basis of their local Hom spaces. **PROVE:**

    Eval(product of gates)=Σ_histories (product of weights) Ev_C(history),

and this assignment respects finite gluing and categorical recoupling.
<1>1. Expand each gate. Multilinearity of composition/tensor product gives
the displayed finite sum, with exactly the original brick ordering.
<1>2. Expanding two pieces separately and contracting their common ports
gives the same sum: all sums are finite and the intermediate resolutions of
identity are the chosen dual-basis resolutions. BY categorical composition.
<1>3. Associators and duality identities change descriptions of a composite,
not that composite. Transport the coefficient basis together with its dual.
This proves recoupling covariance and gluing. QED BY <1>1–3.

For finite local algebras this can use **exact exponential gate coefficients**,
not only CA-86's first-order tile weights. The equality is at fixed mesh.
Convergence of the time product, growing spatial volume and energy cutoffs
are distinct limits; no uniform Trotter error bound is imported from a
fixed-size O(u²) remainder. Reflection of an ordered product reverses its
order; positivity of individual gates does not make every ordered product
self-adjoint. A symmetric transfer prescription must be justified separately.

The missing comparison is now typed. Supply maps `ι_(n,ports)` into the
positive boundary carriers of LC-1, transported anomaly frames, and bounds
on the difference between embedded tile contractions and `Z_P` at the
**same parametrized geometry**. Require the comparison to intertwine sewing,
pairings and stress insertion, with graph/trace-norm tails as appropriate.
For a product of m bounded cell maps, the Ward identity from LC-1 gives

    ||W_(Z_m…Z_1)|| ≤ Σ_j ||Z_m…Z_(j+1)|| ||W_j|| ||Z_(j−1)…Z_1||.   (3)

If every partial product has norm ≤M, the bound is ≤M²Σ_j||W_j||.
This follows by repeated product rule and cancellation of intermediate
connections. Pairing derivatives must be included if the pairing is not
parallel. Thus local errors must defeat the growing number of cells and the
partial-product bounds. Categorical evaluation alone supplies neither this
decay nor the genuine-modulus Ward insertions. Anisotropic tile weights are
geometric input, not a failure of the categorical associator.

## 6. A single formal complex exists; a single cohomological existence test does not

The observation `δ_n²≠0` in LC-4 is not a proof that no deformation complex
exists. It only forbids using Hamiltonian time evolution as its differential.
Here is an explicit equality complex covering a **specified whole presentation**.
It deliberately leaves inequalities, convergence and discrete choices outside.

**Definition D4 [formal presentation].** Fix all discrete dimensions, supports,
field pole bounds, cell grammar, anomaly-line charts and null ranks. Fix C,E.
Use graded coefficient coordinates for cell maps, Gram forms and inverses,
stress and module actions; finite coordinates for microscopic algebras,
refinements, densities, states, defect junctions and comparison maps.
Include a residual variable for every equality allowed to fail at a cutoff.
Work either with a finite truncation or a coefficientwise formal presentation
in which every equation uses finitely many coordinates. Collared infinite
sums require a specified convergent topology before they can enter instead.

Let X be this real coordinate space and Y the product of equation spaces.
Define `R:X→Y` by the following explicit ordered list of coefficient residuals:

| Block | Residual components; all are included, not independent complexes |
|---|---|
| Algebra | `μ(μ⊗1)−μ(1⊗μ)`, unit equations, dagger compatibility, support-zero entries |
| Refinement | `αμ−μ'(α⊗α)`, `α(1)−1`, adjoint equation, all declared path-composition squares |
| States/GNS | Normalization, `G_ij−ω(a_i* a_j)`, compatible limiting-state equations, `J*[G']J−G` and representation squares |
| Stress/action | Derivation and Lie-action residuals, `δ_v(a)−[A(v),a]`, scalar central-defect equation with fixed target cocycle, `L_−1−D`, `L_0−grade`, field/module locality coefficients |
| Sewing | All typed `Z_(Q∘P)−Contr(Z_Q,Z_P)`, same-geometry comparisons, inverse-Gram, collar, anomaly-line coherence, reflection and null-descent equations |
| Geometry | `∂Z+B_out Z−ZB_in`, specified modulus-insertion equations and stress-identification equations; curvature compatibility |
| Microscopic comparison | Transfer derivative plus h, `T−KS(h)`, defects of dynamics/refinement/mode brackets, each **minus its own residual variable** |
| Defects/fidelity | Junction associativity with fixed F, units/duals, transport squares, prescribed braiding/intertwiner equations; only algebraic components of fidelity |

Finite `σ_n` and limiting `ω_n` are different variables; their limiting
identification belongs to K4, not to a false equality `σ_(n+1)α_n=σ_n`.
Likewise finite KS commutators have residual variables: R=0 never requires
nonzero-central-charge exact Virasoro on finite matrices. Rates forcing these
variables to vanish in the limit live outside this formal complex.
K11's **exhaustion of all sectors** is not a list of finite polynomial equations.

Let G be the group of invertible changes of all chosen bases and line frames,
transporting metrics and every structure map, preserving units and E; or use
the subgroup preserving fixed metrics when that is the chosen problem.
The equation list is gauge covariant: `R(g·x)=M(g,x)R(x)` with invertible
transport M on equation coordinates. This identity is part of the presentation.
Select any verified family of row-finite off-shell identities

    Q_λ(x)R(x)=0 for all x.                                      (4)

One may use **all** such formal identities to define the maximal presentation
version, without claiming an effective enumeration; or a checked finite list.
Zero identities are allowed. At an exact equality solution x₀ set

    C⁰=Lie(G), C¹=T_(x₀)X, C²=Y, C³=product_λ codomain(Q_λ),
    d₀ξ=∂_u|₀(exp(uξ)·x₀), d₁=dR_(x₀), d₂=(Q_λ(x₀))_λ,
    C⁴=0, d₃=0.                                                 (5)

This is a precise presentation complex, not a claim of a minimal resolution
or of invariance under changing a cell presentation. Even Q empty gives an
honest complex with `H²=coker d₁`. Verified identities refine that receptacle.

**P4 — Whole-equality formal obstruction [proved conditional].**
**ASSUME:** D4, `R(x₀)=0`, and a partial lift
`x_<N=x₀+Σ_(1≤j<N)t^j x_j` solving R through degree N−1.
**PROVE:** (5) is a complex; with `b_N=[t^N]R(x_<N)`, extension exists iff
`[b_N]=0` in `H²(C)=ker d₂/im d₁`; infinitesimal gauge classes are H¹.

<1>1. Differentiate gauge covariance at x₀. The derivative of M multiplies
R(x₀)=0, so `d₁d₀=0`. BY the displayed gauge identity.
<1>2. Differentiate (4) at x₀. Again its derivative-of-Q term contains
R(x₀); hence `d₂d₁=0`. Termination at C³ gives the remaining square zero.
<1>3. Take coefficient t^N of (4) at x_<N. Every lower residual coefficient
vanishes, leaving `d₂b_N=0`. This uses an **off-shell** identity, not an
identity asserted merely on solutions.
<1>4. Taylor coefficient comparison gives
`[t^N]R(x_<N+t^N x_N)=b_N+d₁x_N`. Extension is therefore exactly membership
of b_N in the actual range of d₁. BY <1>3 this is vanishing of its H² class.
<1>5. At first order d₁x₁=0; infinitesimal gauges add d₀ξ. Their quotient
is H¹. QED BY <1>1–4. No range is replaced by its closure.

This builds the common receptacle that LC-3 left unspecified, relative to a
declared grammar. It does not compute its cohomology for a general C; the
initial solution x₀ itself need not exist. There is no deformation theory
*around* an unknown solution that proves its existence by naming H².

Some useful nonzero Jacobian blocks make the coupling explicit. With ν=δμ,
a=δα, the refinement row linearizes to

    a μ+α ν−ν'(α⊗α)−μ'(a⊗α+α⊗a).

The compatible-state row linearizes to `δω' α+ω' a−δω`.
The internal-action row is
`δδ_v(b)−[δA_v,b]_μ−ν(A_v,b)+ν(b,A_v)`.
The sewing derivative includes all three product-rule terms, and
`δG^−1=−G^−1(δG)G^−1`. Omitting these cross terms gives the wrong complex.
The off-shell associator identity LC-3:109–126 and Ward product identity
LC-1:166–186 supply actual syzygies; no complete finite list is claimed.

Freezing all but binary multiplication and taking its associator syzygy
recovers the relevant shifted segment of the normalized Hochschild complex,
with obstruction `[O_N]∈HH³(A,A)` and tangent HH².
Freezing to product plus an external Lie derivation gives the corresponding
tangent equations of LC-5's
`D=d_CE+(-1)^p d_HH`, on `Alt^p(g,Hom(B^⊗q,B)), q≥1`.
Internal implementers, metrics and geometric comparisons are additional rows,
not an unexplained direct sum of these groups. With a fixed invariant pairing,
metric-compatible deformation equations may lead to a cyclic subproblem;
the FRS source only points to this direction [S4], and supplies no full
analytic cyclic reconstruction theorem. We import no such theorem.

**Negative N2 — algebraic rigidity is not reconstruction.** If a categorical
algebra admits a separability element e, with `μe=η` and centrality of e,
then `h_nf=μ(1⊗f)(e⊗1^(n−1))` obeys `dh+hd=1` on positive-degree
normalized cochains (including degree zero at the endpoint). Expand dh+hd:
the μe term is f, the two leading terms cancel by centrality, and the
remaining adjacent/end terms cancel with alternating signs. This is LC-7's
general proof, independent of its examples. Consequently the entire binary
HH obstruction may vanish while every K4–K11 task remains. Similarly,
ENO's Yetter rigidity concerns the tensor category itself [S11], not its
analytic conformal carriers. These are three different deformation problems.

**Negative N3 — no cohomology-only criterion from (5).** The equality
`x²=1` has invertible linearization at both real solutions; its local
obstruction cokernel vanishes at each. The inequality x≥0 rejects one of
them. Thus this formal equality complex cannot determine positivity even
in one dimension. Rates and computability are further independent data.
Fixed-rank positive quotient charts also cannot detect rank-changing null
states. This refutes the proposed inference from formal acyclicity alone,
not the possibility of some richer analytic obstruction theory.

## 7. Obstruction classes and analytic failure witnesses

The universal statement is about **classes attached to specified lifting
problems**, not a claim that one fixed group attached to C decides existence.
Only the particular obstruction class must vanish. Requiring the entire group
to vanish is a stronger sufficient condition for that formal extension step.

| Problem | Obstruction / matching condition | Scope |
|---|---|---|
| Internal local generator | `[δ_v]∈HH¹(B,E_impl)` must vanish | E_impl must really be a B-bimodule on a common core; finite-range restrictions often give only a commutator-map cokernel |
| Scalar projective Lie lift | `[κ−κ_c]=0∈H²_CE(g,R)` with the specified local/continuous cochains | Centrality and scalarity precede this statement; nonzero κ_c is required, not removed |
| Binary sewing extension | `[O_N]=0∈HH³_C(A,A)` | Fixed associator/unit; a different degree from category-associator deformation |
| Coupled equality extension | `[b_N]=0∈H²(C_pres)` from (5) | Relative to x₀, grammar, support and rank stratum; not an intrinsic invariant of bare C |
| Sewing line coherence | Multiplicative 2-cocycle equation on composable sewings; match its class/curvature to the declared anomaly | Line trivializations need not exist; a vanishing amplitude cannot cancel a line-coherence equation |
| Corner completion | Nonnegative integer feasibility (1) | Discrete representation obstruction; dressing preserves it |
| Finite-patch flux | `[δ_nJ_n]∈coker(D_patch)` must vanish for an exact chosen flux ansatz | This is a spatial-divergence cokernel, not cohomology of δ_n; approximate flux is a different problem |
| Charge lift | Choose a point in `c_top+8Z`; require actual conformal c there | Arithmetic torsor, not a proven H³ reconstruction class; positivity restricts to a subset |
| Functorial selection | Nonempty solution fibres plus compatible action of source stabilizers | Discrete fixed-point or nonabelian splitting problem; not implied by local H² vanishing |
| Analytic realization | Positive all-grade forms, sewing majorants, summable WT/VR errors, integration and sector completeness | Separate certificates/failure witnesses; no universal cohomology group presently supplied |

For the CE row, `A(f)=iT(f)` and `[f,g]_* = f'g−fg'` as in (ae).
LC-2:119–137 computes

    κ_c(f,g)=−c/(24π)∫_0^(2π)(f'''+f')g dθ,
    [A(f),A(g)]−A([f,g]_*)=iκ_c(f,g)1.

Changing the scalar splitting `A→A+iλ1` adds `dλ`, with
`dλ(f,g)=−λ([f,g]_*)`. Thus the central *class* is fixed while a linear
mode normalization may change. Explicitly, replacing `L_0` by `L_0+a1`
in `(m³c*−mc)/12` changes the displayed linear coefficient to `c+24a`
and leaves the cubic coefficient c* unchanged: substitute
`L_0=L'_0−a1` into `[L_m,L_−m]`. Restoring the target energy origin is
therefore essential. Scalar shifts cannot tune the cubic anomaly to a new c.
The skew cocycle sign and this scalar shift are checked in the local bundle.

The real lifts of a fixed residue form a torsor for 8Z: subtraction of any
two lifts lies in 8Z, and translation is free and transitive. Realizable
nonnegative lifts need not form a torsor; no assertion realizes every point.
Twist lifts have analogous integral ambiguity. Character T additionally has
the phase `exp(−2πic/24)`, so an eight-unit shift generally changes character
T even when the topological residue is unchanged [S1,S3]. Tensoring with a
holomorphic realization gives nonuniqueness [S1], not an invertible action
on all unitary theories; negative tensor powers have not been constructed.

Functoriality has an additional, genuinely global condition. Let a group G
of source automorphisms act on a **discrete** fibre of admissible choices.
An equivariant selection at that object must be a G-fixed choice: apply
equivariance to each automorphism. With isomorphic rather than equal choices,
one instead needs coherent intertwiners. If their ambiguity is a central
abelian group A and chosen lifts satisfy `U_g U_h=a(g,h)U_(gh)`, associativity
gives `a(g,h)a(gh,k)=a(h,k)a(g,hk)`; changing lifts changes a by a coboundary.
Thus an honest action requires its group-H² class to vanish; a specified
projective action requires class matching. Noncentral ambiguities give a
nonabelian extension problem. None is automatically the stress CE class.
Returning the entire solution groupoid avoids making an unjustified selection.

**Negative N4 — placement continuity no-gos are analytic obstructions.**
For a unit vector ξ and rotations r_j→identity define
`Δ_j(ξ)=||U(r_j)ξ−ξ||²=2−2 Re〈ξ,U(r_j)ξ〉`.
Strong continuity demands Δ_j→0. If matrix coefficients instead tend to zero,
Δ_j→2. Phase conventions cannot fix a coefficient whose modulus tends to zero.
This identity follows by expanding the squared norm; it is a decisive K9
failure witness even when every finite refinement square commutes exactly.

Kliesch–Koenig's precise homogeneous binary qudit hypothesis uses
`V:C^d→C^d⊗C^d`, `Vspace=ran V`. If
`(Vspace⊗C^d)∩(C^d⊗Vspace)={0}`, their representation is weakly
discontinuous [S12]. Nonzero intersection is necessary there, not sufficient
for a CFT. Jones' theorem concerns his specified annular/triadic construction
and excludes its rotation-rigid vacuum [S13]. Neither theorem has here been
ported to arbitrary fusion-space, scale-dependent dressed refinements.
The CA-67 checklist records risk mechanisms, not five necessary and sufficient
axioms for all regulators. One must test hypotheses before applying either
no-go. They belong in K9's continuity/positive-vacuum layer, not in an invented
HH³(C) obstruction. Rejecting one tree construction leaves D6-C open.

An earlier exact finite-mode strategy has its own algebraic obstruction:
trace the exact finite-dimensional identity
`[A(v),A(w)]−A([v,w])=iκ(v,w)1`. It yields
`κ=d(tr A/(i dim H))`, a scalar CE coboundary (LC-2:210–219).
K6 evades the hypothesis by controlling nonzero cutoff residuals on graph
domains, then taking limits; it does not evade the proof by ignoring trace.

## 8. Existence strategy and a quantitative reduction

An induction must have two indices: formal order/grade and physical refinement
scale. They cannot be identified. Formal primitives can grow so fast that the
formal series diverges, or have supports increasing with the lattice size.
Choosing `W_n=U_nV_n` preserves isometry, but supplies no estimate by itself.
For general placement diagrams also require every dressing composition square;
along a single chain define composites, without pretending path independence.

**P6 — A bounded correction lemma [proved conditional].**
**ASSUME:** an independent equation chart `R:X→Y` between real Banach spaces,
C² on an open neighbourhood of the closed radius-r ball about x₀. Write
`ε=||R(x₀)||`, `D=dR_(x₀)`. Suppose a bounded linear right inverse Q obeys
`DQ=1`, `||Q||≤M`, the second derivative is ≤L on that ball, and
`r=2Mε`, `MLr≤1/2`. Assume the whole ball is admissible for the fixed
support/unit/rank conditions and any positivity margins one wants to preserve.
**PROVE:** R has a zero in that ball, with a geometric correction modulus.

<1>1. Set `N(v)=R(x₀+v)−R(x₀)−Dv`. Integration of dR along line segments
gives `||N(v)||≤L||v||²/2` and Lipschitz constant ≤Lr on the ball.
<1>2. The closed subspace im Q is closed because QD is a bounded projection.
The map `F(v)=−Q R(x₀)−Q N(v)` maps its radius-r ball to itself:
`||F(v)||≤Mε+MLr²/2≤r/2+r/4`. Its Lipschitz constant is at most 1/2.
<1>3. Starting at zero, successive differences shrink by at least 1/2;
their sum converges in the closed ball. Continuity gives v=F(v).
The remainder after j steps is at most twice the next step norm.
<1>4. Apply D to v=F(v), using DQ=1. Then `Dv=−R(x₀)−N(v)`, so
`R(x₀+v)=0` and `||v||≤2Mε`. QED BY <1>1–3.

The word “independent” matters: the redundant residual space of (5) usually
has syzygies and need not admit this right inverse. One must solve the
compatibility equations, choose an actual equation chart, or prove a suitable
constrained variant. A right inverse only on an algebraic range with no norm
bound is insufficient. To preserve Gram positivity, for example, an initial
lower eigenvalue bound γ and perturbation bound <γ are required in every
retained quotient. No uniform γ across all grades is assumed.

**Conditional programme reduction.** Suppose successive finite extensions
have compatible positive seeds, killed P4 obstruction classes, local right
inverses as in P6, and compatible embeddings into fixed completed spaces X_s.
Require that the n-th correction has X_s norm at most `2M_(n,s)ε_(n,s)`,
summable in n for every fixed s; restriction maps between the X_s must agree.
Assume residual evaluation and positivity constraints are closed in these
topologies and each enumerated equality is eventually solved and preserved.
Suppose separately these corrections preserve K1–K3 and
give summable errors in K4/K6/K7, and K9–K11 reconstruction certificates.
Then the induction converges in each specified Banach/graph norm; WT-1 and
VR-1 construct the common state and mode algebra; K9–K11 identify its
category-faithful conformal net. P5 transports the result through certified
comparisons. This is a conditional assembly theorem, not D6-C: almost all
its substantive hypotheses still have to be synthesized from C and E.

The general construction therefore needs the following lemmas, in this order.

1. **Positive conformal enrichment:** select c, carriers and internal extended
   fields with positive all-grade sewing. LC-1–3/9–10 supply equations, not
   existence; modular residue compatibility alone is insufficient.
2. **Local finite realization:** turn cell truncations into bounded-range
   categorical densities, and construct local strict α. CA-65/71 give the
   algebra and corner maps; P1 prevents a false unital completion step.
3. **Quantitative history comparison:** compare P3 histories to the same cell
   maps, control (3), and differentiate to identify standard KS. This is the
   unproved CA-86→LC-1→LC-4 connection, including regulator scheduling.
4. **State and generator induction:** obtain e_n,p_n for P2 and graph estimates
   for K6 on the resulting horizontal-limit GNS spaces. A dressing chosen only
   to optimize corner weight does not guarantee either the state mismatch or
   stress estimates. Running g_n may be tuned; fixed c may not be relabelled.
5. **Analytic and categorical closure:** prove integrated local covariance,
   completeness of sectors and coherent transport. EQ-1/EQ-2 transport finite
   group invariants only after exact equivariance; no general defect/extension
   operation is proved to preserve all these certificates.

## Results ledger

- D6-C — **Conjectural:** universal effective enrichment and category-faithful local KS/OAR realization, functorial after declared enrichment.
- D1–D3 — **Proposed definitions:** trial source groupoid, certified tower category, localization and OAR equivalence.
- K0–K12 — **Reconciled specification:** all four acceptance contracts, with independent analytic and fidelity obligations retained.
- P1 — **Proved:** finite unital corner extension iff the complementary representation multiplicities exist; no locality assertion.
- P2 — **Proved conditional:** corner mismatch plus corner weight bounds dual state drift and supplies WT-1 when summable.
- P3 — **Proved finite:** exact gate expansion respects typed history gluing; comparison with conformal sewing remains open.
- D4/P4 — **Proved conditional formal:** explicit presentation complex and exact order-by-order obstruction class; no computed general cohomology or intrinsic resolution.
- P5 — **Proved conditional:** certified continuum construction factors through the declared tower localization.
- P6 — **Proved conditional analytic:** bounded right inverse plus quantitative smallness produces an admissible local correction.
- N1 — **Negative, exact:** a GNS corner defect bound is not a norm-soft C*-certificate; CA-72 Corollary 72.8 needs that restriction.
- N2 — **Negative/derived:** separable categorical binary HH vanishing does not solve the added conformal equations.
- N3 — **Negative, exact:** equality cohomology alone does not enforce positivity, convergence or effective rates.
- N4 — **Negative/source-scoped:** Jones/KK obstruct continuity of their specified constructions, not all categorical realizations.
- Verification — **Exact finite checks:** see `checks/README.md` and raw output; these test formulas, not D6-C.

## What this gives the integration

CA-01's forward pipeline and CA-62's algebra-first pipeline become the same
typed process: construct local algebras/dynamics, select microscopic states,
take horizontal state limits, perform GNS, and prove the remaining analytic
and categorical assertions. CA-15 contributes observable covariance;
CA-67 contributes support/refinement and no-go scope; CA-81 contributes WT/VR;
LC-4 fixes standard KS and insists on their common representation.

CA-71–73 supply finite composition/descent/residual ingredients. P1 and P2
identify the additional unital-extension and state-comparison data needed to
feed WT-1. Transport of a polynomial through a corner uses **P as its unit**:
the constant in CA-73:159–166 must be evaluated with `θ(1)=P`, not ambient 1.
A stretched density or its support cannot automatically be identified with
the physical fine density. P3 and (3) specify precisely the missing geometric
comparison between CA-86 histories and LC-1 sewing.

The old seams now have distinct owners: S1 is K2/K5 plus P2 and residual
domain control; S2 is exact chain composition and separate diagram coherence;
S3 is the explicit g_n/KS residual ledger; S4 is K10/K11 completeness of
the **general** declared field/defect algebra. A restricted density subalgebra
does not alone determine the category of sectors. D1 becomes an input type,
D2 a choice requiring P1 and norm certificates, D3 a derived state property,
and D4 an unused source-acquisition thread, not a prerequisite for this note.

This note was kept outside the report and root worklog as requested. No
commit, network acquisition or report build was performed. A GPT-6.1-xhigh
skeptical collaborator checked the formal-complex and corner arguments;
the author checked their source claims against the local files. No cited
general deformation or Morita theorem was used to fill an analytic gap.

## Open problems

1. Construct a positive analytic conformal lift for arbitrary C; necessary
   character, Ward and anomaly equations do not yet imply it.
2. Identify a local unital refinement backend satisfying (1), spatial support
   bounds and the same state/KS estimates; allow growing cutoff dimensions.
3. Construct and compute the geometric presentation complex in a concrete
   general cell grammar, including modulus insertions and all junctions;
   prove presentation independence if an intrinsic obstruction theory is wanted.
4. Establish tame local inverses and sewing/graph majorants through all grades;
   formal HH primitives do not bound intermediate high energies.
5. Prove integrated covariance and complete sector recovery in the same OAR
   net. A chiral selection from a larger microscopic theory needs its own
   local algebra and energy identification; discarded spectator modes cannot
   be hidden by specifying only one stress family.
6. Solve stabilizer/coherence and computability problems for a single-valued
   compiler; determine whether D6-C fails even when objectwise existence holds.

## Examples table

This is the only model-specific calibration; none enters the general proofs.

| Instance | Local evidence | What it calibrates |
|---|---|---|
| Untwisted Vec_Z2 and Fibonacci boundary algebra probes | LC-7:137–186 proves separability contraction and positive-degree categorical HH vanishing | Binary rigidity can coexist with completely missing analytic realization |
| Semion, ansatz A=1+s | LC-6:172–188 excludes that separable algebra ansatz, while A=1 remains available | A failed fibre/ansatz is not a category no-go |
| Fibonacci at the selected c=14/5 lift | LC-12:169–208 gives a conditional character-growth contradiction for finitely many Virasoro families | E.fields must permit extended chiral content; this is not a universal c>1 theorem from that note |
| Source-controlled free fermion benchmark | WT-1 and `cft_machine/benchmarks/fermion/WILSON_PROOF.md`, `PROOF.md`; source [S14] | Quantitative calibrations do not instantiate the general categorical synthesis or every VR-1 hypothesis |

## Sources used

All paths are repository-relative. Named LC/CA/WT/VR/P results are local
derivations, not paraphrases of external papers. Primary anchors actually read:

- **[S1]** `references/cft-machine/realisation/Bischoff2018/source.tex:364–408` — open realization problem, nonuniqueness, fusion versus center; `references/cft-machine/realisation/EvansGannon2018/source.tex:328–345` — complete rationality, charge residue and extensions.
- **[S2]** `references/cft-machine/realisation/MignardSchauenburg2017/source/paper.tex:121–129,175–179` — distinct braided categories with identical modular data.
- **[S3]** `references/category-theory/RowellStongWang2009Classification/source/RSWfinal3.tex:685–703` — modular conventions and topological charge; `references/cft-machine/realisation/EvansGannon2018/source.tex:473–480` — character T phase in the stated family.
- **[S4]** `references/categorical-reconstruction/FuchsRunkelSchweigert2002/source/hep.tex:356–370,560–575,2278–2285,2396–2408,2820–2862,8930–8936` — relative chiral input, algebras, bimodules, Frobenius and limited cyclic-cohomology discussion.
- **[S5]** `references/text/PenneysUnitaryFusionCategories.md:325–348` — tensorators and monoidal natural transformations.
- **[S6]** `literature/md/2010.11121/2010.11121.md:101–180,204–243` — strict OAR, Wilson rows/GNS, support control and independent covariance obligation; source extraction has index typos, so coherent arrows are typed explicitly here.
- **[S7]** `references/cft-machine/coset-symmetry/CarpiWeiner2004/source.tex:356–380,407–445` — local covariance and mode/exponential conventions; `references/cft/Schottenloher2008/Schottenloher2008.md:2200–2267,2925–2947,3044–3056` — central extensions, positive forms and the stated highest-weight integration theorem.
- **[S8]** `references/text/HollandsAnyonicChainsAlphaInduction.txt:15–35,4399–4402` — finite defect correspondence and unproved analytic persistence.
- **[S9]** `literature/md/2003.13812/2003.13812.md:166–189` — explicitly labelled sketch of higher algebra/bimodule types and relative tensor products; no unsourced analytic Morita reconstruction theorem is invoked.
- **[S10]** `literature/md/2306.16063/2306.16063.md:568–589` — operator-norm asymptotic multiplicativity, Definition 33 / equation (29).
- **[S11]** `references/text/EtingofNikshychOstrikFusionCategories.md:908–942` — Yetter complex, degree distinctions and rigidity; not the conformal sewing complex.
- **[S12]** `references/lattice-symmetry/KlieschKoenig2020/source/ms.tex:401–450` — exact qudit hypothesis, intersection condition and discontinuity.
- **[S13]** `references/lattice-symmetry/Jones2017NoGo/source/nogo.tex:938–965` — triadic limit and scoped rotation-rigidity theorem.
- **[S14]** `references/text/CFTFromLatticeFermions.txt:221–253` — source theorem's finite-energy KS convergence and its scope.
- **Sewing sources:** `literature/md/1905.04924/1905.04924.md:542–558,626–643,688–718` — projective sewing, richer chiral input, separability and internal composition.
- **Repository contracts:** `report/sections/01_programme_map.tex:13–76`; `15_lattice_symmetry_acceptance_tests.tex:31–106`; `62_categorical_bu_pipeline_vision.tex:78–222`; `67_refinement_requirements_obstructions.tex:67–141`; `71_refinement_placement_category.tex:53–146`; `72_gns_descent_corner_calculus.tex:54–196`; `73_categorical_residual_set.tex:115–202`; `81_cft_machine_oar_contract.tex:47–114` (all under `report/sections/`).
- **Analytic interfaces:** `cft_machine/research/wilson_triangle.md:16–167`; `virasoro_routes.md:50–192`; `equivariant_oar.md:16–130`; `realisation_and_fidelity.md:23–62,123–203` (last three under `cft_machine/research/`).
- **Formal/analytic separation:** `reconstruction/01_cells.md:15–162,164–228`; `02_obstructions.md:38–115,119–142,194–230`; `03_sewing_deformations.md:57–170`; `04_cutoff_oar.md:16–159`; `05_mixed_complex.md:20–167`; `07_small_category_cohomology.md:137–197`; `10_four_port_linearization.md:114–185` (last six under `reconstruction/`).
- **Branch history source:** local git object `1f402aaf96d2ffb9d8efb0684836d4771bbd5f60:report/sections/86_spacetime_trotter_dictionary.tex:60–110`, read with `git show origin/claude/festive-franklin-rl8kty:report/sections/86_spacetime_trotter_dictionary.tex`; only its general finite expansion is used.
- **Seams and decisions:** `reviews/2026-07-06_pipeline_consistency_scoping/PLAN.md:18–38` and its S1–S4/D1–D4 sections; historical proposals were checked against the current mathematical notes rather than promoted to results.
- **Source registries:** `references/categorical-reconstruction/SOURCES.md`, `references/cft-machine/realisation/SOURCES.md`, `references/refinement/SOURCES.md`; no new literature acquired.
