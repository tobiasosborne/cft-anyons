# REVIEW — D6 functor and obstruction theory (sceptical reconciler)

Reviewer: Opus reconciler, 2026-10-22. Scope: `NOTE.md` (756 lines) and
`checks/` of this directory, against the brief
`explorations/2026-10-22-astra/briefs/D6-functor-and-obstruction-theory.md`
and the integration shard `report/sections/75_integration_map.tex`.
Nothing here is committed or promoted; line numbers are `NOTE.md:N` unless
another path is given. No Julia, no latexmk. Two Python runs only:
the note's producer and one new reviewer check (end of this file).

## 0. Verdict in five lines

1. The note is careful, general (no Rule 16 violation) and most of its
   proved statements are correct. Their mathematical depth is modest:
   P1, P3, P4, P6, N3 and N4 are elementary or standard.
2. The most useful content for CA-75 is P2 + N1 (Link (b)), the corrected
   reading of CA-72 Corollary 72.8, and the typed contract K0–K12, which
   adds dynamics (K8), typed defects (K10) and effectivity/coherence (K12)
   to the CA-75 contract.
3. The headline D6-C should be reformulated. It asks a one-dimensional
   lattice tower to have a *chiral* conformal net as its OAR limit
   (`NOTE.md:18-20, 32-33`). The sibling notes D2, D4 and D5 all target a
   full two-chiral limit. As stated, D6-C also contains the open
   reconstruction problem (`Bischoff2018/source.tex:368-373`) as a special case.
4. P1's arithmetic obstruction never applies in the preferred vacancy
   backend: condition (1) holds automatically for any C (reviewer remark
   R2). For braided C a *local* unital lift of the dyadic vacuum insertion
   exists (R1). So K2's real gap is locality for non-braided C, not (1).
5. Checks reproduce bit-for-bit, with 4 groups passing and 4 mutations
   rejected (`checks/raw_output.txt`, rerun 2026-10-22, `diff` empty).

## 1. Citation audit

I opened every local anchor. Status: **ok** = says what the note claims.

| Note cites | Target | Status |
|---|---|---|
| CA-86:62 sign (`NOTE.md:61-62`) | `report/sections/86_spacetime_trotter_dictionary.tex:62` `H=-sum h_j` | ok. Mismatch: the shard is merged now (not "branch"), and the root convention **(ak)** (`CONVENTIONS.md:1397-1400`) fixes `H=-Σh`. The note says only (a)–(ai) were read. Its `H=+Σh` matches (af) (`CONVENTIONS.md:1196-1212`) and opposes (ak). This is a declared, real convention tension in the repo, and integration must cite (ak)/(af) explicitly. |
| LC-4:63–82 KS tier (`:64-65,158-163`) | `reconstruction/04_cutoff_oar.md:63-82` | ok (formula identical) |
| (ae) `A(f)=iT(f)`, `[f,g]_*` (`:519`) | `CONVENTIONS.md:1127-1150` | ok |
| WT-1:20–38 (`:148,303`) | `cft_machine/research/wilson_triangle.md:20-38` | ok (index convention α_n^k:A_k→A_n matches P2 <1>4) |
| CA-72:82–109 (`:305`) | Theorem 72.3, defect `2(1-sqrt ω(P))` | ok |
| CA-72:158–182 (`:314`) | Lemma 72.6, Theorem 72.7 | ok |
| CA-72 Cor 72.8:184–193 (`:321-322`) | `72_gns_descent_corner_calculus.tex:184-193` | ok. The note's critique (N1) is **correct**; see §3 |
| [S10] 2306.16063:568–589 (`:317`) | Def. 33, eq. (29), operator norm `‖·‖` on C*-algebras | ok |
| CA-73:159–166 constant (`:683-684`) | Lemma 73.1, `θ(F(h))=F(θ(h))` | ok. The critique is **correct**: constant terms map to `cP`, not `c1`. KS modes and residuals carry constants (e_n, b_n, central term) |
| LC-3:109–126 syzygy (`:464`) | `03_sewing_deformations.md:109-126` | ok |
| LC-1:166–186 Ward (`:465`) | LC-W at `01_cells.md:164-186` (statement :173) | ok |
| LC-5 `D=d_CE+(-1)^p d_HH` (`:472`) | `05_mixed_complex.md:78` `D=d+(-1)^p b` | ok |
| LC-7:137–186 (`:484-485`, table) | Prop. 3, `07_small_category_cohomology.md:139-166` | ok, but `:482` "including degree zero at the endpoint" is loose. LC-7:163-164 notes h_1 lands in C⁰, and d₀=0 only in its examples. The general identity d₀h₁+h₂d₁=id still holds by Prop. 3 (n=1), so this is harmless |
| LC-2:119–137 κ_c (`:520-523`) | Prop. 3, `02_obstructions.md:119-136` | ok |
| LC-2:210–219 trace (`:578`) | Prop. 5 | ok |
| LC-6:172–188 (table) | semion ansatz non-separable, A=1 available | ok |
| LC-12:169–208 (table) | conditional genus-one obstruction at the selected lift | ok. The table correctly declines to universalise it |
| [S1] Bischoff 364–408 | realization question, nonuniqueness via holomorphic nets, Z(F) | ok |
| [S1] EvansGannon 328–345 | completely rational; c determined only mod 8 | ok |
| [S3] EG 473–480; RSW 685–703 | T phase `e^{-2πic/24}` in that family; topological c mod 8 | ok |
| [S2] MS 121–129, 175–179 | inequivalent centres, shared modular data | ok |
| [S5] Penneys 325–348 | monoidal functor (:325) and monoidal natural transformation (:340) | partial. The range covers neither *braided* nor *unitary* equivalences, yet source 1-morphisms (`:112-115`) are unitary braided. Minor gap |
| [S6] 2010.11121:101–180, 204–243 | unital injective scaling maps; support bound `r_max ε_N`; covariance separate | ok as cited. Caveat: the source's support argument uses commuting **single-site** algebras that generate A_N (`2010.11121.md` ≈ :204-210). K1/`:187-192` transplant it to an interval-support assignment on End_C(O^⊗L), which is not generated by site algebras. The adaptation is plausible but unproved |
| [S7] CarpiWeiner 356–380; Schottenloher 2925–2947 | Diff covariance definition; positivity ⇒ c≥0 | ok |
| [S8] Hollands 4399–4402 | analytic persistence left open | ok |
| [S9] 2003.13812:166–189 | Def. 2.9/2.10 explicitly "(Sketch)"; relative tensor product | ok (the note itself labels it a sketch) |
| [S11] ENO 908–942 | Yetter complex; H³ deforms the associator; rigidity | ok |
| [S12] KK ms.tex 401–450 | intersection condition ⇒ weak discontinuity | ok |
| [S13] Jones nogo.tex 938–965 | triadic limit; TL rotation-rigidity theorem | ok |
| [S14] CFTFromLatticeFermions 221–253 | KS convergence on finite-energy core | ok |
| PLAN.md:18–38, D1–D4 (`:688-694`) | seams S1–S4, decisions D1–D4 (`PLAN.md:242-253`) | ok. S4 in the source is specific to the dilute parity issue; the note lifts it to general K10/K11, which is a fair generalisation |
| `checks/README.md` provenance | LC-3:109–137, LC-1:166–186, LC-2:119–137 | ok |

No citation was fabricated. The mismatches are the (ak) omission, the
[S5] braided gap and the [S6] site-algebra transplant.

## 2. Adversarial pass on the headline D6-C (`NOTE.md:9-50`)

**A1. Chirality — the strongest objection (not refuted; likely needs reformulation).**
D6-C demands that the OAR limit of a 1D local tower *be* a chiral completely
rational net A, with Hamiltonian-derived KS modes converging to A's stress.
The note's own machinery is two-chiral: K3's barred tier (`:160-161`),
K6's "mixed residuals when both chiralities occur" (`:172`), and open
problem 5 (`:714-716`: "discarded spectator modes cannot be hidden by
specifying only one stress family"). The siblings make the opposite choice
on purpose:
- D4-C: "Take as target the diagonal full theory ... so that the requested
  one-dimensional regulator has no imposed chiral imbalance"
  (`../D4-koo-saleur-beyond-free/NOTE.md`, headline).
- D5-C: "The periodic limit is a full local unitary CFT with two identified
  chiral nets A_L,A_R" (`../D5-fidelity-lattice-sewing/NOTE.md`, headline).
- D2-C: "a local unitary two-dimensional conformal theory ... two
  circle-diffeomorphism groups" (`../D2-selection-principle/NOTE.md`).

I found no local source stating a lattice chirality no-go. The nearest is
`literature/md/1903.12334/1903.12334.md:76`, where an anomaly-free 2d
topological order is a pair (C, c) with chiral c. That is a **source gap**
(Law 1): the claim "a 1D local tower cannot have a chiral limit with c≠0"
is not recorded as true here. Even so, D6-C as written is in tension with
three sibling notes and with its own K3/K6. Fix: the target should be a
full local 2D net whose left chiral subnet is A with `C ≃ Rep(A)`, and
both KS families must converge. Then K11 must say which chiral DHR category
is identified with C (the full net's sector category is not C).

**A2. Subsumes an open problem.** Restricted to existence and ignoring the lattice,
D6-C implies "every UMTC is Rep of a completely rational net", which is
`Bischoff2018/source.tex:368-373`, open. The note says so (`:42-44`).
This does not refute D6-C, but it means the headline is not attackable as a unit.

**A3. Degenerate inputs.**
- *C = Vec (trivial UMTC).* D6-C lets c=0 ("nonnegative", `:14`). The trivial
  net has A(I)=ℂ. Whether it counts as a completely rational conformal net
  depends on definitional conventions not fixed in the note. The algorithm
  can pick c ∈ 8Z_{>0} instead (holomorphic nets, `Bischoff2018:378-381`),
  so this is not a counterexample. Suggest "c>0 unless C=Vec" or fixing the convention.
- *Pointed UMTC.* Nothing in D6-C uses self-duality, multiplicity-freeness
  or non-pointedness. No refutation.
- *Non-self-dual objects, fusion multiplicities.* D1/D2/K-axioms and P1–P6 are stated
  for general finite-dimensional C*-algebras and Hom-space bases. No hidden use found.
- *Non-braided fusion C, Vec_G^ω.* Excluded from D6-C by hypothesis and routed through a
  declared modular target such as Z(C) (`:108-110`). This is consistent with
  `Bischoff2018:386-393`. No refutation, but D6-C says nothing about these inputs.

**A4. Functoriality clause (not refuted; genuine unproved condition).** On automorphisms,
D6-C needs a group homomorphism `Aut(C,E) → Aut(T)` in `Tow[W^-1]`. Via P5,
that lands in net automorphisms of A that lift the braided autoequivalence
through the chosen `C ≃ Rep(A)`. Two separate conditions arise:
(i) every braided autoequivalence must be induced by a net automorphism, and
(ii) the lift must split as a homomorphism. The note isolates (ii) (§7,
`:543-553`) but not (i). I know of no local source deciding (i) for
general realizations, so this is recorded as a hypothesis gap.

**A5. Quantifier structure.** "Enrichment is selected objectwise" (`:29`), and the
algorithm acts on *presentations* (`:11`). So two presentations of the same
C may receive different c. Functoriality then constrains only arrows between
inputs that happened to receive the same enrichment, which is weak across
presentations. The substantive content is the stabiliser action (A4).
This is honest but should be said in the statement.

## 3. Step-by-step check of proved / conditional statements

- **P1** (`:262-286`), correct for arbitrary finite multi-matrix algebras. The proof uses
  only matrix-unit ranks. The dressing-invariance remark is correct for inner
  automorphisms; block-permuting automorphisms only relabel (1).
  *Reviewer remark R2 (derived):* for the CA-68/71 vacuum insertion
  `θ(T)=VTV†` with `1 ⊂ O`, block c maps to block c with r_cc=1. Since
  `O^{⊗2L} ≅ O^{⊗L}⊗O^{⊗L}`, the complement dimension
  `m_c(2L)-m_c(L) = Σ_a (N^c_{a,O^{⊗L}} - δ_ac) m_a(L)` has nonnegative
  coefficients because `1 ⊂ O^{⊗L}`. So (1) **always holds** in the
  vacancy backend, for every C, with no braiding or commutativity needed.
  P1 is therefore not the binding obstruction there. The text at `:146`
  ("P1 isolates the missing extension") and `:641` ("P1 prevents a false
  unital completion step") overstates its role. The binding issue is
  locality and coherence, as `:284-285` itself concedes.
- **P2** (`:288-311`), correct. The intertwining gives `Pα(a)=θ(a)=α(a)P`, so the
  state splits as a convex mixture, and the triangle inequality gives (2).
  <1>4 is correct with WT-1's index convention. The algebra
  `2(1-p)=(1+√p)v²≤2v²` is correct. The note omits one caution: P_n pins
  *every* inserted site. For a fine state of an extensive chain,
  Σ(1-p_n)<∞ forces the fine state to be, up to a summable *global*
  fidelity error, a dressed image of the coarse state. That is an
  exact-RG requirement and much stronger than local convergence (compare
  `../D3-refinement-meets-dynamics/NOTE.md` §1 "Global corner support",
  and `../D1-carrier-theory/NOTE.md` on trace weights `d_O^{k-l}`).
  P2 is the same bound as D3-1 (`../D3-refinement-meets-dynamics/NOTE.md` §2,
  second inequality); the two were found independently.
- **N1** (`:313-323`), correct and checked (`check_d6.py:73-97`). The CA-72 Corollary 72.8
  sentence "satisfies ... eq. (29) ... precisely when ω_l(1-P)→0 in the
  relevant GNS seminorms" is wrong as an operator-norm statement. For P≠1
  the norm of the one-step defect is |χ(ab)-χ(a)χ(b)|, independent of the state.
  D3 independently finds the same (`../D3.../NOTE.md` §1 "Softness topology").
  **This contradicts a shard**: CA-72 Cor. 72.8, and CA-75 Link (b), which
  repeats "modulus of softness" (`75_integration_map.tex:145-147`).
- **P3** (`:327-352`), correct. It is multilinearity of composition with exact gate
  coefficients, a direct strengthening of CA-86 Lemma 86.1 (first order).
  It adds little mathematically; its value is that it removes the O(δτ²)
  remainder from Link (a) at fixed mesh. Bound (3) (`:361-363`) follows by
  induction from LC-W and is checked (`check_d6.py:113-120`).
- **D4/P4** (`:378-452`), correct. d₁d₀=0 holds because the gauge orbit of a solution
  consists of solutions; d₂d₁=0 by differentiating the off-shell syzygy at
  R(x₀)=0; and `[t^N]Q(x_<N)R(x_<N)=Q(x₀)b_N`. Note that "extension of
  *this* partial lift iff [b_N]=0" is exact. Changing lower orders is a
  separate question, as usual. The Hochschild specialisation
  (H¹↔HH², H²↔HH³) is correct. One small point: H⁰=ker d₀ = all derivations,
  not HH¹. The note does not claim otherwise. The content is standard
  (an obstruction class for a presented equation system). It is correct and
  useful as bookkeeping, but it is close to a tautology when Q is empty.
- **P5** (`:233-258`), conditional-ok, with one gap. "Factors through the localization"
  needs a target *category* of continuum data. The note types only
  isomorphisms (OAR equivalence, unitary V, `:217-222`). A general D3 arrow
  induces a vacuum-preserving *isometry* S, so the continuum category must
  have isometric intertwiners as morphisms, and that is never defined.
  Step <1>3 delegates the K9/K10 intertwining to "chosen closures", which
  is a sketch. Composition of mode defects (`:209-211`) is correct, given
  that graph-isometry follows from `S_nK_n=K'_nS_n`.
- **P6** (`:591-617`), correct (a Graves/Newton–Kantorovich-type contraction). Constants check:
  `‖F‖≤Mε+MLr²/2≤r/2+r/4`, Lip(F)≤MLr≤1/2. The remark on "im Q closed" is
  unnecessary but harmless. No external theorem is cited, and the proof is
  self-contained.
- **N2** (`:479-488`), correct; it is LC-7 Prop. 3, which is general. **N3** (`:490-497`), correct but trivial.
  **N4** (`:555-573`), the identity is trivial, and the source scoping of KK and Jones is accurate.
- **§7 side claims**: the scalar shift `c→c+24a` with c* fixed, and the CE coboundary
  `dλ(f,g)=-λ([f,g]_*)`, are correct (checked, `check_d6.py:100-110`). The 8Z
  torsor is correct but trivial. An 8-shift multiplies character-T by
  e^{-2πi/3}, so it is correct that T fixes c only mod 24. The group-H²
  coherence argument (`:547-551`) is standard and correct.

**Reviewer remark R1 (derived here, sketch plus weak instance check).** If C is
*braided* (in particular modular, the case D6-C targets), let B be the
interleaving braid `O^{⊗L}⊗O^{⊗L} → O^{⊗2L}` (new strands crossing old ones
with one fixed crossing type). Then `α(T)=B(T⊗id)B†` is a unital injective
*-map End_C(O^{⊗L})→End_C(O^{⊗2L}) with `α(T)V_L=V_L T`, because the braiding
with 1 is trivial. By naturality of the braiding, a two-site density on
coarse sites j,j+1 maps to an operator supported on fine sites 2j-1,2j,2j+1:
the same physical interval, with no support growth. With a local dressing U,
`Ad_U∘α` intertwines `W=UV`. So the strict-OAR hypothesis of P2 and WT-1 A1
is met *locally* for braided C. This would answer CA-75 Link (b1) without a
soft variant, and it closes CA-68's "Boundary [open]"
(`68_variable_n_refinement_maps.tex:87-92`) for braided C. For non-braided
C the same construction needs a half-braiding on O, that is, a lift of O to
Z(C). This is open. Status: derived sketch. Instance check:
`checks/review_braided_lift.py` (pointed braided instance, L=2,3, one
mutation rejected). The instance does **not** discriminate braiding phases
(the plain interleave also works there), so a non-pointed check is owed.
The construction also seems to go against CA-67's diagnosis (i)
(`67_refinement_requirements_obstructions.tex:149-150`), which says that
diagnosis is about inserting X-strands. Braiding O-strands is defined on
empty sites. Any continuity question then moves to K9 (Jones/KK scope, N4).

## 4. Rule 16 audit

| Place | Model leaned on | Survives without it? |
|---|---|---|
| `:136`, `:59-79` | site object `O=1⊕X` named as the "preferred vacancy backend" | Yes. Explicitly an option, not an axiom. D2/K-axioms use general A_n. |
| `:158-163` (K3) | nearest-neighbour, periodic KS tier from (af) | Yes, but this is a *lattice* specialisation, not a model one. Range-R densities need a different current formula. K1 allows range R and K3 does not, so K3 should be generalised. |
| `check_d6.py` | algebra ℂ⊕ℂ; M₂→M₄ corner | Generic finite algebras, not categories. Fine. |
| `:726-729` examples table | trivial Z2 grading, a non-abelian two-object category, a pointed rank-2 category, free fermion | Only place with model names. Each entry calibrates or warns. Fine. |
| Proofs P1–P6, N1–N4 | none | No use of self-duality, multiplicity-freeness, TL quotients or braiding. P3 needs only spherical/duality data. Braiding enters only as abstract supplied data (`:78-79`). |

**Rule 16 violations: 0.** The note is exemplary here.

## 5. Results ledger grades (`NOTE.md:656-669`)

| Ledger line | Grade | Reason |
|---|---|---|
| D6-C conjectural | **unverifiable (open); statement needs reformulation** | Label honest. Chiral-limit clause in tension with 1D regulator and D2/D4/D5 (A1). Contains open reconstruction problem (A2). Functorial clause needs automorphism lifting (A4). |
| D1–D3 proposed definitions | **conditional-ok** | Precise. [S5] does not cover braided/unitary equivalences. The continuum-side category for P5 is untyped. |
| K0–K12 reconciled specification | **conditional-ok (proposal)** | Faithful merge with useful additions (K8, K10 typing, K12). Lacks the per-approach [C]/[P] labelling the brief asked for. Overlaps the CA-75 contract (mapping in INTEGRATION.md). K3 is nearest-neighbour only. K11 is chiral-only. |
| P1 proved | **confirmed**; role **overstated** | Proof correct. Condition (1) holds automatically for vacancy insertion in every C (R2), so it is not the obstruction in the preferred backend. |
| P2 proved conditional | **confirmed** | Correct. Hypotheses are explicit but very strong (global corner weight). Independently duplicated by D3-1. |
| P3 proved finite | **confirmed** | Correct; elementary strengthening of CA-86 Lemma 86.1. |
| D4/P4 proved conditional formal | **confirmed** | Correct. Standard and close to a tautology. Honest that it is not intrinsic. |
| P5 proved conditional | **conditional-ok** (borderline overstated) | Needs a typed continuum target category with isometric arrows. <1>3 is a sketch. |
| P6 proved conditional analytic | **confirmed** | Constants verified. |
| N1 negative exact | **confirmed** | Contradicts CA-72 Cor. 72.8 and the CA-75 Link (b) wording. |
| N2 negative/derived | **confirmed** | LC-7 Prop. 3 is general. |
| N3 negative exact | **confirmed** | Trivial but correct. |
| N4 negative/source-scoped | **confirmed** | Source scoping accurate. |
| Verification | **confirmed** | Reran `checks/check_d6.py`, output byte-identical to `raw_output.txt`; 4 mutations rejected. |

## 6. Contradictions with and duplications of the repo

- **Contradicts** CA-72 Cor. 72.8 (operator norm vs GNS seminorm). The note is right.
- **Corrects** CA-73 Lemma 73.1 for polynomials with constants (unit P). The note is right.
  D1 and D3 reach the same correction independently.
- **Convention tension**: the note's `H=+Σh` follows (af) and opposes (ak). Both
  are root conventions, so the repo itself carries the sign split.
- **Duplicates, with citation**: P3 vs CA-86 Lemma 86.1; P4's binary segment vs LC-3; the
  N2 contraction vs LC-7. Duplicates without citation (concurrent sibling work, not repo):
  P2 = D3-1; N1 = D3 §1.
- **Does not cite CA-75**, which was written concurrently. The two merged contracts must be
  reconciled; see INTEGRATION.md.

## 7. Reviewer files written

- `REVIEW.md`, `INTEGRATION.md` (this directory).
- `checks/review_braided_lift.py` and `checks/review_braided_lift_output.txt`
  (numpy, 64×64 max; run from repo root with `python3 -I <path>`).
  Headline: on a pointed braided instance at L=2,3, the braided lift is a
  unital *-map that extends θ, lands in End_C and has range 3. A range-2
  claim is rejected. Condition (1) holds. This calibrates R1 weakly (see limitation above).
