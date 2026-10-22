# D2 — Sceptical reconciliation review

Reviewer: Opus reconciler, 2026-10-22. Object reviewed:
`explorations/2026-10-22-astra/D2-selection-principle/NOTE.md`
(sha256 `00bf8c36…d0b1`, matching `checks/run.txt:66`), its `checks/`, against
the brief `explorations/2026-10-22-astra/briefs/D2-selection-principle.md`
and CA-75 (`report/sections/75_integration_map.tex`). No Julia run and no
latexmk. One added reviewer check: `review_checks.py` in this directory
(SymPy, 8x8 matrices, with a `--mutate` flag that must fail; run log below).
Nothing outside this directory was edited.

**Bottom line.** The finite algebra is correct and model-independent. The
proofs of D2-L1 to D2-L10 check out step by step, with one overstated label
(the converse half of D2-L5, repaired below). The note finds two real defects
in CA-86 Proposition 86.3, and they also affect CA-75 row (2). The headline
D2-C is honestly labelled conjectural, but it is a *sufficiency* statement
about local chains with analytic certificates. It does not select c, uses
no categorical structure beyond the finite constants, and no instance has been
shown to satisfy its hypotheses C1–C6. Verdict on the headline: **needs reformulation**
(see INTEGRATION.md §d).

---

## 1. Citation audit

Every path:line in the note was opened. Lines read on branch object
`1f402aaf…` (note :92–93, :813–814) were compared with merged `main`. The
CA-86, CA-87 and LW blobs differ from `main` only in convention labels, and the cited line
numbers are unchanged.

| Note cite | Claim in note | Verdict |
|---|---|---|
| [P] `references/text/PenneysUnitaryFusionCategories.md:1010–1019` (NOTE:57,107,816) | positive trace, positive dims, spherical | OK (:1010–1017 Ex. 3.8.4 positivity; :1019 Ex. 3.8.6 unique spherical) |
| [LW] `strnet.tex:545–584` (NOTE:223) | RG/topological fixed-point motivation | OK (:548–563 rule motivations) |
| [LW] `strnet.tex:780–795` (NOTE:224) | commuting projectors, doubled phase | OK (:780–795) |
| [AFM-S] `_Statistical_mechanics…tex:499–552` (NOTE:121,487) | channel-projector basis, multiplicity-free | OK (:499–549 `P^(χ)`, :537 `W_j=ΣA(χ)P^(χ)`) |
| [AFM-S] `:586–621` (NOTE:805) | c for the two sign regimes | OK (:621) |
| [AFM-S] `:623` (NOTE:396,805) | lattice category ≠ primary category | OK verbatim (:623) |
| [AFM-D] `_Topological_defect_lines.tex:53–68,109–163` (NOTE:487) | pull-through, weaker than YBE | OK (:60 "less demanding constraint"; :109–161 proof) |
| [AFM-F] `_fusion_categories….tex:175–184` (NOTE:489) | self-duality, multiplicity-free, FS +1 | OK (:176–184) |
| [KS] `9312156.tex:717–738` (NOTE:365) | distinguishes brick from diagonal transfer | OK. Stronger than cited: :603 defines row-to-row `τ̂=∏X_{2j}∏X_{2j-1}` (the brick sweep), and :717–725 says it does **not** commute on the homogeneous line, while the commuting `τ̂_D=∏_j X_{2j}X_{2j+1}` is the sequential product. |
| [KS] `:1068–1108,1623–1673` (NOTE:821) | limits/products caveat; lattice Virasoro | OK |
| [ZB] `9611156.tex:237–276,430–455,362–367,592–607,785–796,1046–1055` (NOTE:806–807) | dilute A_L weights, branches, c, Δ | OK; formulas match verbatim |
| [CGS] `StressTensor.tex:527–532,589–626,758–782,1123–1127` (NOTE:437,464,808) | partial CR; n=1 proof; geometric stress | OK |
| [YBE] `literature/md/1408.1282/1408.1282.md:149–170` (NOTE:259,366) | additive YBE, auxiliary face transfer | OK (:159 YBE, :163–168 commuting periodic `t(u)`) |
| [TL] `literature/md/1608.04927/1608.04927.md:453–458` (NOTE:318) | TL spectral R from algebraic relations | OK |
| [EG] `EvansGannon2018/source.tex:333–335`; [B] `Bischoff2018/source.tex:374–381` (NOTE:779) | c mod 8; holomorphic-factor nonuniqueness | OK |
| CA-86 `86_…tex:80–93` (NOTE:133) | first-order tiles + remainder | OK |
| CA-86 `:112–126` (NOTE:363) | Prop 86.3 conditional on commutativity | OK; see §3.1 |
| CA-87 `87_…tex:55–69` (NOTE:337) | O≅Y⊗Ȳ gives range-four, pair-aligned | OK |
| CA-70 `70_dilute_koo_saleur_ansatz.tex:11–52` (NOTE:89,828) | "older midpoint/sign ansatz" | **Mismatch (minor):** the midpoint phase `e^{in(j+1/2)2π/N}` is at :84 (modes :79–87), outside the cited range |
| Branch-label caveat (NOTE:94) | "(ac),(ad) differ in meaning" | **Stale:** on `main` CA-86/87 use `(ak)`/`(aj)` (`CONVENTIONS.md:1359,1397`); no conflict remains |
| Root (af),(h),(ad),(r) (NOTE:57–89,456) | KS tier, signs, OPE, cup normalisation | OK (`CONVENTIONS.md:1196–1218,163–185,1099–1126,631–694`) |
| `wilson_triangle.md:16–108`, `virasoro_routes.md:50–177` (NOTE:829) | WT-1 A1–A3; VR-1 A1–A4 | OK; L8 feeds WT-1 A3 (`wilson_triangle.md:28–33`), L10 matches VR-1 A2/A4 weight losses (`virasoro_routes.md:62–77`) |
| Manifests `references/lattice-symmetry/SOURCES.md:1163,1731`; `references/cft/SOURCES.md:74` | registrations | OK |

**Missing citations (precedent available locally but not cited):**
- §3.4 (NOTE:383–385) leaves "higher polynomial Baxterisations" open. A local
  source already shows a Baxterisation outside the linear Hecke ansatz, through the
  BMW algebra, whose braid has three eigenvalues:
  `literature/md/1408.1282/1408.1282.md:195,217–235`. Jones's Baxterisation is
  named at `literature/md/2302.14081/2302.14081.md:302`.
- D2-L3, eq. (8), is the classical *Reshetikhin condition* for nearest-neighbour
  integrability. The repo has no local source for it (grep finds none), so
  this is a Law-1 gap. The note's own derivation is complete, so this concerns
  priority and credit, not correctness.
- AFM also records that for Tambara–Yamagami input the lattice category is
  *not even a subcategory* of the CFT's MTC
  (`_Statistical_mechanics….tex:775`). This strengthens the note's fidelity
  caveat (NOTE:396, :506–508) and belongs in the D5 link.

## 2. Adversarial pass

### 2.1 Attempts to refute D2-C

| Attempt | Outcome |
|---|---|
| C=Vec, O=1 | End(O⊗O)=ℂ, h scalar, stress zero; C6 fails. Not a counterexample. |
| C=Vec, O=ℂⁿ (all qudit chains) | Every local spin chain is in scope. D2-C then becomes a category-free claim about local chains, so "for every C" adds nothing categorical. **No counterexample, but this shows the headline is category-blind** (also NOTE:32–33). |
| Vec_G^ω, pointed with cocycle | ω enters only through F in the placement constants (NOTE:113). No step uses ω=1 or abelian structure. Survives. |
| Multiplicities, non-self-dual O | The compiler (1), L1, L3 and (14) keep multiplicity matrix units and orientations (NOTE:52–57,118–122,488–491). Survives. The TL lemmas need a cup/cap on O⊗O (self-dual summand); see §4. |
| Non-braided C | Only §3.4 uses a braiding, and it says so (NOTE:373,387). Survives. |
| Two decoupled critical chains with different velocities (spectator) | KS modes of the total density are then not Virasoro. Excluded because C1/C4 demand one positive physical velocity and one coordinate Ward identity (NOTE:625,655–676). The exclusion is implicit, so stating it would help. |
| Degenerate vacua / direct sum of CFTs | The conclusion (NOTE:26–29) does not assert vacuum uniqueness, so no contradiction. |
| c_L ≠ c_R | C4 requires "the barred formula" (NOTE:670) without stating c̄=c. The headline says "the central charge" in the singular. Minor gap, not a refutation. |

**Hidden assumptions in D2-C.** (i) The hypotheses C1–C6 have no verified
instance in the note. In particular the note does not check that the sourced CGS
n=1 calibration (NOTE:808) or the repo's free-fermion benchmark satisfies
C3's one-sided collar bounds or C4's contact equations. Without one instance the conjecture
could be vacuous. (ii) "Selection" in the headline means only "c admits a
certificate". This is not decidable (the note says so at NOTE:609–610), so the computable
selectors are (5), (8), (12)–(13), not D2-C. (iii) The conclusion
bundles CA-75 contract items 4–12 (`75_integration_map.tex:179–204`).
The note admits that the step from Ward identities to KS modes, energy domains,
locality and integration is open (NOTE:37–38,695–701). That gap is most of
the content.

### 2.2 Step-by-step check of proved/conditional statements

- **Eq. (2)** (NOTE:124–129): `G'=hG` expands to
  `Σ_{αβ} c_α w_β M^γ_{αβ}`. Correct. It is an exact improvement on CA-86
  Lemma 86.1's first-order expansion (`86_…tex:80–93`).
- **D2-L1** (NOTE:168–183): <1>3 gives `VV†=V(V†1V)V†=1`. <1>4 then gives
  `O⊗O≅O ⇒ d_O=1`. Correct and general.
- **D2-L2** (NOTE:227–237): elementary; correct.
- **D2-L3** (NOTE:269–290). The uv and u²v jets are confirmed by the free-word
  check (`checks/exact_checks.py:69–81`). The "overlap ⇒ scalar" step uses left and right categorical partial
  traces: `tr_1(1⊗q)=d_O q`, `tr_1(q⊗1)=tr_1(q)⊗1`, then trace once more.
  It needs only a pivotal/spherical structure and d_O≠0. It does not use self-duality,
  multiplicity-freeness or braiding. The rescaling by a scalar function in <1>3 preserves YBE
  because both sides scale equally. **Correct for general C.**
- **D2-L4** (NOTE:300–318): the expansion was checked by hand and by
  `exact_checks.py:33–36`. Correct *as an algebra lemma*. It applies to
  `End_C(O⊗O)` only when a TL pair exists there, which requires a cup/cap on O⊗O
  (an O≅Ō summand) and fixes e²=±d e through the FS sign (root (r)). NOTE:317–318
  says this only implicitly.
- **Non-TL membership** (NOTE:327–333): the eigenvalue argument is correct. It needs a
  nontrivial projection in End(O), i.e. End(O)≠ℂ. The note states this
  ("whenever one-site operators exist").
- **D2-L5 forward** (NOTE:343–354): `[e+f,ef]=f−e` was checked by hand and the
  mutation test fails as expected (`checks/run.txt:20–29`). Correct. The source independently confirms that
  the homogeneous brick sweep does not commute (KS :603, :717).
- **D2-L5 converse** (NOTE:356–361). The witness `exp((u+u²)h)` with
  `h=p⊗p` fails additive YBE only because of its parameterisation:
  `s=u+u²` is a local diffeomorphism, and `exp(s h)` satisfies additive YBE
  exactly. As written, the result refutes "commuting transfers ⇒ YBE *in the
  given parameter*", not "commuting transfers ⇒ YBE-integrable". **Repair
  (reviewer check):** take `X(u)=exp(u h+u² g)` with `h=p⊗1+1⊗p`,
  `g=p⊗p`. All translates commute, and h₁₂−h₂₃, g₁₂−g₂₃ are independent.
  Additive YBE for any reparameterisation φ needs both `φ(u)+φ(v)=φ(u+v)` and
  `φ(u)²+φ(v)²=φ(u+v)²`, which together force `φ(u)φ(v)=0`
  (`review_checks.py`; the `--mutate` run with scalar g fails, as required). The repair still needs
  End(O)≠ℂ. So for simple O the converse is not established.
- **Eq. (11)** (NOTE:373–387): the free-word check is at `exact_checks.py:85–88`. The step from
  `b²−αb=c²−αc` to `B²−αB=β1` uses L3's overlap lemma. Correct. Limitation
  correctly confined to the linear ansatz (see the missing BMW citation in §1).
- **D2-L6** (NOTE:423–431): faithfulness of the trace. Correct and trivial.
- **D2-L7** (NOTE:493–508): the strong-convergence product argument is correct.
  The adjoint convergence it needs is stated as an assumption. The proof claims a faithful
  action and explicitly not a full one. Correct.
- **D2-L8** (NOTE:521–547): verified (15). `‖G(1/z−1/w)‖=|z−w|/z ≤ ‖F−G‖/z`,
  and the geometric-series bound (16) holds. The interface with WT-1 A1 (unital
  injective *-maps) is stated. Correct.
- **D2-L9** (NOTE:549–573): submultiplicativity holds. The exponent
  bookkeeping `4ⁿ·2^{κn/2}·2^{−(2+κ/2+η)n}=2^{−ηn}` checks out. Correct. The "checked" part is
  only a 2x2 diagonal Gram example (`exact_checks.py:115–123`).
- **D2-L10** (NOTE:575–604): the Laplace representation, the split at t=1, and K≥1
  together give a dimension-free constant. Correct. In the counterexample,
  `‖e^{-tE}Xe^{-tE}‖₁ = 2e^{√n−tn} ≤ 2e^{1/(4t)}` and
  `‖X(1+E)^{-p}|0⟩‖=e^{√n}`. Correct. A side note: a polynomial *two-sided* bound
  on rank-one witnesses also fails to give n-uniform one-sided bounds, so the
  lesson is broader than "nuclearity".

### 2.3 Consistency with the repo

1. **CA-86 Proposition 86.3** (`86_…tex:112–126`) has two defects, and the
   note identifies both correctly. (a) It attributes commutativity of the
   *brick* sweep `∏_odd X_j ∏_even X_j` to "the sourced τ̂_D". KS :603 and
   :717–725 show that the brick (row-to-row) sweep does not commute and that τ̂_D is
   the sequential diagonal product. (b) "The ground state is a common
   eigenvector" (`:120–122`) needs a nondegenerate ground state.
   Consequence: CA-75 row (2) lists "commuting-family exactness on integrable
   lines (Prop. 86.3)" as *already general* (`75_integration_map.tex:73`).
   That entry needs the qualifier.
2. **CA-86 :55–57** ("a principle (scale invariance of the fixed point)
   fixes the model") reads LW as a selection precedent. D2 §2.3 (NOTE:223–225)
   and D2-L2 show that this precedent concerns a *topological* fixed point and
   cannot select a critical chain. The two disagree in emphasis, not in a formula.
   CA-86's own Cor. 86.2 already says isotropy "can only emerge in the continuum".
3. **CA-72** normalised pullbacks (`72_…tex:67–78`) are the main source of
   functionals with mass `1−ε_n`. D2-L8 bounds the normalised drift by
   `2‖F−G‖/(1−ε_n)`. This partly answers CA-75 Link (b2)
   (`75_integration_map.tex:153–155`) *given* (b1). The note does not make
   this connection.
4. Overlap with sibling notes. D5's "exact exponential tiles give reflected-positive cells"
   (D5 NOTE:21) is D2 eq. (2). D5 lists "nuclear collar bounds" as a limiting requirement for C1
   (D5 NOTE:188). That is consistent provided D5 does not use them to obtain graph norms. D2-L10 shows they
   cannot do so.
5. No contradiction was found with CONVENTIONS (a),(b),(r),(h),(ad),(af). The note's
   `k=−h` bridge (NOTE:58–61) is consistent with CA-86's `H=−Σh_j` and (af).

## 3. Rule 16 audit

| Place | Model leaned on | Does the general statement survive without it? |
|---|---|---|
| §3.2 D2-L4 (NOTE:298–325) | TL algebra (loop quotient) | Yes. It is an algebra lemma conditional on TL relations, and exhaustion is limited to `span{1,e}`. Its *applicability* needs a self-dual summand of O, which should be said. |
| §3.3 D2-L5 forward (NOTE:343–354) | TL witness; rational d=5/3 matrix pair (`exact_checks.py:23–31`) | Yes. A negative result needs one witness. The matrix pair is an algebra witness, not a category (NOTE:735), and KS :717 gives a sourced categorical instance. |
| §3.3 converse (NOTE:356–361) | one-site projection (O non-simple, e.g. O=1⊕X) | Partly. It holds for End(O)≠ℂ and fails to cover simple O. The repaired version is the same. |
| §3.5, examples (NOTE:391–397, 799–808) | TL/RSOS, dilute A_L, CGS O(n) | Model data confined to the examples table. General claim (YBE ⇏ criticality, since R=1 solves it) is model-free. |
| §4.2 (NOTE:464) | CGS geometric stress | Used only as motivation. Equations (12)–(13) are general. |
| §5 (NOTE:487–491) | AFM scalar formulas | The note explicitly replaces them by naturality and does not use them. |

There is no Fibonacci, Ising, semion or golden-chain detail outside the examples table.
The note is **Rule-16 compliant**. The overcorrection risk is the opposite: the
headline is so model-free that it carries no categorical content.

## 4. Results-ledger grades

| Ledger line (NOTE) | Grade | Comment |
|---|---|---|
| D2-C (:746) | **conjectural label correct; headline needs reformulation** | Sufficiency, not selection. Category-blind. No instance of C1–C6 checked. The main gap is admitted at :37–38. |
| Eqs (1)–(7),(12)–(14) scaffold (:747) | **confirmed** | Derivations are correct. (2) is an exact upgrade of Lemma 86.1. (6) is checked (`exact_checks.py:102–112`). |
| D2-L1 (:748) | **confirmed** | General and elementary. |
| D2-L2 (:749) | **confirmed** | Elementary negative result. |
| D2-L3 (:750) | **confirmed** | General C, with partial traces. This is the Reshetikhin condition; no local source for it (Law-1 gap for attribution). |
| D2-L4 (:751) | **confirmed** (as algebra) | Applicability needs a self-dual summand / FS sign. |
| D2-L5 (:752) | **overstated (mild)** | Forward direction confirmed. The converse witness is a reparameterisation artifact. It is repaired by `review_checks.py` for End(O)≠ℂ. |
| Eq. (11) (:753) | **confirmed** | Should cite the local BMW Baxterisation (1408.1282:217–235). |
| D2-L6 (:754) | **confirmed** | Trivial. |
| D2-L7 (:755) | **conditional-ok** | Hypotheses explicit; faithful, not full. |
| D2-L8 (:756) | **conditional-ok** | Feeds WT-1 A3 and CA-75 Link (b2). |
| D2-L9 (:757) | **conditional-ok** | Crude counting tier, honestly labelled. |
| D2-L10 (:758) | **conditional-ok** | Proof and counterexample verified. It is the cleanest new analytic interface to VR-1. |

Summary: 0 wrong, 1 overstated (D2-L5 converse, mild and repaired), and
0 unverifiable among the proved items. The citation mismatches are minor:
the CA-70 range and the stale branch-label caveat.

## 5. Reviewer run log

```
$ python3 explorations/2026-10-22-astra/D2-selection-principle/review_checks.py
PASS commuting brick family: additive YBE under any reparametrisation forces phi(u)phi(v)=0; needs only End_C(O) != C
$ python3 explorations/2026-10-22-astra/D2-selection-principle/review_checks.py --mutate
AssertionError: g must be non-scalar        (exit=1, as required)
```
The note's own bundle was not re-run (`checks/run.txt` was inspected; its
NOTE hash matches the reviewed file).
