# REVIEW: H1, the worldline net-gas representation (Opus, 2026-10-27)

**GRADE (H1 as posed): COUNTEREXAMPLE.** Parts (b) (unqualified loop
decoupling), (c) (stated for arbitrary C, with no positivity) and (d)(i)–(ii)
are false as worded. The witnesses are general: they hold for every C in the
indicated class.
**GRADE (corrected statements H1′, the note's ledger): WEAKER-RESULT-PROVED.**
Every ledger item marked "proven" survives. Four of them carry minor gaps or
hidden hypotheses (G1–G4 below), and two are weaker than they read (D3, D-F
relevance). Nothing in the note is graded up here.

Reviewer: Opus (sceptical referee; not the prover). Read in full: AGENTS.md,
the brief `briefs/H1-worldline-net-gas.md`, `NOTE.md` (937 lines),
`final-message.md`, `checks/README.txt`, all five scripts and outputs, and
every cited source and shard at the cited lines (list at the end).

## 0. Re-run of the note's checks (Law 3)

From the repo root I ran all five scripts with python3 (SymPy 1.12, no
network). All exited 0. Against the stored outputs, the diffs are empty once
UTC and elapsed-time lines are removed. **Eight mutations, all rejected:**
`check_patch` 5, `check_signs` 1, `check_fs_instance` 1, `check_anisotropy` 1.
Quality notes (Rule 7):
- `check_patch.py`: the "16 decorated tiles = indexed contraction = patch"
  invariant holds by construction. The rescalings g cancel identically, and
  the contraction is a matrix product. It tests bookkeeping (dagger vs
  transpose, F^{-T} = conj F, G^{-1}), which does guard against convention
  drift, but it does not test categorical exactness. The F block is
  synthetic (no pentagon), and the note says so.
- `check_fs_instance.py`: the "mutation" is a restated assertion
  (`phase == 1`), not a perturbed implementation. Its event phase rule
  ω(P,in)ω(P,out) is correct only because ω = ±1 (in general it is
  ω(P,in)/ω(P,out)).
- `check_signs.py`: the one-cup mutation breaks self-adjointness, which the
  note acknowledges. The 1,098-path enumeration is the abstract 2-state
  block, not the spatial geometry.
- `check_anisotropy.py`: source arithmetic on the Zhou–Batchelor weights. Its
  "tangent" oracle is hand-derived from the same formula. It is a
  calibration only, as stated.

**Independent review checks (new, raw output saved):**
- `checks/review_holonomy.py` → `review_holonomy_output.txt`. It builds the
  *full* path-basis space ⊕_c Hom(c,O^L), L = 4, 5, for Vec_{Z_n}^{ω_p}
  (cocycle condition asserted), embeds every h_j by α^{-1}Tα, and computes
  the U(1) holonomy of the path multigraph (the note's D2 criterion).
  Results:
  (P1) Z_2, X = g: frustrated iff ω is nontrivial (holonomy −1). This
  confirms D-FS independently of `check_fs_instance`.
  (P2) Z_4, X = g ⊕ g^{-1}, a non-self-dual case the note never checked.
  With *proper* oriented cups (both snakes = 1, θ_-/θ_+ = ω(g,g^{-1},g)) the
  gas is unfrustrated for every p. With naive raw cups θ_- = θ_+ it is
  frustrated, with holonomy ω(g,g^{-1},g) ∈ {i, −1, −i}, for p = 1, 2, 3.
  (P3) The D4 history weight −729/4096 is rebuilt from the full matrices
  exp(t h_j).
  Two mutations flip the verdicts: dropping the associators erases the FS
  frustration, and naive cups frustrate P2.
- `checks/review_d3_rotation.py` → `review_d3_rotation_output.txt`. An
  orthogonal change of the three multiplicity copies diagonalises
  exp(log 2·S) to (1/4, 2, 2). The negative D6 triangle (−343/1728) belongs
  to the fixed presentation (see D3 below).

## 1. Per-step verdicts

### H1-A (exact dictionary and patch expansion)
- (A1), <1>1–<1>2 (orthonormal s_p^c, matrix units E, D = g_q g_p E):
  **VALID**. Orthogonal sums: Penneys:219–237. Bases and F: Penneys:528–568,
  whose norm (3.5.14) is exactly V = (d_a d_b/d_c)^{1/4}u. This specialises
  (aj), whose √φ check I verified. *Independent consistency:* in the
  completely packed case g_q g_p = d_υ/√d_χ, so w = [e^{th}]/(g_q g_p)
  reproduces AFM-S:84's amplitude factor √d_χ/d_υ.
- <1>3–<1>4 (A2) exactness: **VALID**, but it is not new. It is Schur
  decomposition plus CA-78 Prop. 78.2 (`78_…:56–68`, which already states the
  exact ordered-product expansion) and CA-80:61–63. The new content is the
  pointed dictionary with vacancy and copy flags and the fixed vertex
  normalisation. The note says this.
- ν norms, θ = √(d_a d_b d_c), "nine geometric tiles + ν do not span": **VALID**
  (CA-77:102–105 counts 2s + 4t + 4z).
- "R(t)^M ≠ e^{-βH} at finite M": **VALID**. No witness is displayed. One is
  implicit in `check_patch` order 2 (2(I + B̃A) ≠ (A + B̃)² because
  [A, B̃] ≠ 0). Trivial gap.
- Bare (undecorated) nets carry sums of products: **VALID**. This corrects
  the brief.

### H1-B (local rules, traces, Gibbs closure)
- <1>1 circle = d_a > 0: **VALID** (Penneys:1010–1019, the standard
  solutions of 3.8.6).
- <1>2 bubble = δ only in the isometric normalisation: **VALID**. This is a
  statement about conventions. LW strnet:497–524 lists the rules
  diagrammatically, with normalisations at strnet:588–611 (via (aj)).
- <1>3 F, <1>4 (B1): **VALID**. Cyclicity of tr_C for f: a→b, g: b→a is
  Penneys 3.7.16.
- <1>5 E_W is a CP conditional expectation: **VALID with gap G1**.
  coev_O†coev_O = d_O and trace preservation both need coev_O to be the
  *standard* solution for the reducible O (Penneys 3.8.6(2)–(3)). The tag
  "positive spherical duality" implies this, but it should be written into
  the step.
- Negative qualification (coupons, branching, noncontractible loops, no
  statistical independence): **VALID**.
- (B2) Tr_H = tr_C(J_L ·), J_L = Σ_c d_c^{-1}P_c: **VALID** (blockwise). The
  negative, "the ordinary Gibbs closure gives every closed component d_a", is
  **VALID**. Witness: a time-wrapping static a-line has weight 1 under Tr_H
  and d_a under tr_C. This is the single most useful correction for P2: the
  *physical* Gibbs ensemble carries d_a only on contractible components.

### H1-C (sewing; conditional domain Markov)
- <1>1 (C1): **VALID** (CA-80 Lemma 80.1, :70–83).
- <1>2 exterior functional L_ξ: **VALID with gap G2 (hidden hypothesis)**.
  "Bend its legs" presumes that Q is a disk: one closed boundary cut along
  tile legs. For annular or multiply connected Q, L_ξ lives on a tensor
  product of several boundary-cut spaces with fusion data between them. That
  case must be declared or excluded.
- <1>3 (C2): **VALID** as finite conditioning under its stated hypotheses
  (a ≥ 0, Z_P > 0, positive marginal). The tag "conditional" is honest. The
  real content is that the exterior acts only through the ray [L_ξ].
- C-labels counterexample, (C3): **VALID** for every C with a simple
  symmetrically self-dual a, d_a > 1. The realisation e = vv†,
  t = log(1+d)/d is correct. *But* the brief never claimed that endpoint
  labels suffice or that G^{-1} is stochastic. These ledger "negatives" are
  clarifications, not refutations of H1(c). H1(c) fails for a different
  reason: "for arbitrary C" without positivity is not a probability
  statement.

### H1-D1 (loop signs)
- <1>1 (D1), positivity under oriented-proper or κ = +1 tiles: **VALID with
  gap G3**. "Closed history" means *planar or categorical* closure (the tag
  says "planar scalar closure"). The physical closure is Tr_H = tr_C(J_L ·).
  Its time-wrapping components are not circles, and their weights are traces
  over multiplicity spaces. The note proves nothing about them. My P2 check
  shows ordinary-trace positivity for proper cups in a pointed instance only.
- <1>2 (D2): **VALID** (re-derived: h_±² = d(P_vv + P_pair), exp verified
  symbolically).
- <1>3, failure of necessity: **VALID** for the whole class. Note that it is
  a gauge artefact (U = P_0 + iP_1), so it refutes the literal "iff" but not
  the "iff up to gauge" reading. The note's (D3) covers that reading.
- (D3) phase criterion: **VALID**. It is a tautological restatement of (D1)
  given d_a > 0, and it does not reduce to a local test (the note says so).
- D-FS, failure of sufficiency: **VALID**, and stronger than stated. In
  Vec_{Z_2}^ω every fusion space is one-dimensional. Every C-covariant change
  of the path basis is therefore diagonal, and the holonomy −1 (review P1) is
  an invariant of (C, O, h) over *all* C-covariant presentations, not only
  over the note's phase gauges. The separating hypothesis (κ = +1, or proper
  oriented duality) is right. CONVENTIONS (r) already demands that κ be
  recorded; the brief dropped it.
- General X reduction: **VALID**. Review P2 confirms the dichotomy for a
  non-self-dual object. Raw-cup phases ω(g,g^{-1},g) appear there too, but a
  proper oriented choice removes them. For pseudoreal X no such choice
  exists.

### H1-D2 (categorical signs)
- Theorem D-F: **VALID, and genuinely general-C**. Steps <1>1–<1>4 (unitary
  plus nonnegative ⇒ permutation; |[F^{aāa}_a]_{11}| = 1/d_a ∈ (0,1) for
  noninvertible a, by the zigzag L†V = d_a^{-1}) use nothing group-graded.
  Only <1>5, the forced pointed case, uses group cohomology. The coboundary
  computation and "nonnegative unit modulus ⇒ 1" are right (ENO:139–144,
  :1970–1971; Penneys:284–288, :595–608). "Trivial associator class" is the
  correct condition: D ≅ Hilb_G with [ω] = 0 in H³(G,U(1)).
  *Relevance caveat (not a defect):* the obstruction is the *modulus* of a
  vacuum-channel entry, which unitarity forces. It says nothing about the
  signs of the entries that a given h uses. Complete F-positivity is never
  needed for a positive gas.
- Refutation of "N_XX^X ≠ 0 forces signs": **VALID but pedantic** (X = 1, or a
  unit summand). The substantive correction is better. Phases are forced by
  *any* noninvertible simple, through F^{aāa}_a, which is a loop-sector
  entry. They are neither triggered by nor located in the vertex sector.
- (D5) fixed-gas criterion: **VALID**, but definitional.
- Path-gauge criterion: **VALID**. Flatness of a U(1) connection on a graph is
  equivalent to its being gauge-trivial. The <1>1 derivative argument is
  right, and parallel edges are included. This is the standard stoquasticity
  test, written in categorical terms.

### H1-D3 (temporal RP vs termwise signs)
- <1>1–<1>2: **VALID** (CA-80 Lemma 80.2, :87–95; Lemma 80.4, :106–115).
- <1>3 (D6): **VALID as stated, weaker than it reads** (gap G4). S² = 2I − S,
  the spectrum {1, 1, −2} and b(t) > 0 all check. But the witness uses only
  unit-copy multiplicities, so it is Vec inside any C. On one bond an
  orthogonal rotation of the three copies makes every history positive
  (`review_d3_rotation`). D3 therefore separates RP from positivity of a
  *fixed* presentation. It does not separate RP from the existence of *some*
  positive presentation; that is the note's open problem 1. CA-80 Cor. 80.3
  (:97–104) already shows that coefficient signs are unrelated to RP.
- Converse [[1,2],[2,1]], and reflected factorisation ⇒ RP: **VALID**.

### H1-E
- (E1): **VALID**. It is CA-78 (78.1) solved, plus a definition of η and the
  chain rule. The η-identity has no content, and the note says so. The
  negative, "categorical data cannot fix the anisotropy" (h ↦ qh), is
  **VALID** and answers the brief honestly.
- <1>3 Duhamel: **VALID** (CA-80:127–135).
- E-scaling and E-Markov: correctly labelled **conjectures**. They are not
  sketches posing as proofs. The hypotheses are carefully quantified.

### Source audit
**VALID with one defect.** The audit output contains a match in
`references/lattice-symmetry/VernierJacobsenSaleur2014/source/RegimeIII-v3.tex:2525–2527`:
Sheffield–Werner, "Conformal loop ensembles: the Markovian characterization
and the loop-soup construction", Ann. Math. 176 (2012) 1827, arXiv:1006.2374.
That is precisely the primary acquisition lead for SG1, yet the note says a
primary CLE source "still needs identification". Every citation I checked
supports its step: Penneys, ENO, AFM-F/S, LW, ZB, CGS, Schottenloher, HKV13,
HKV22, BR24, CA-66/75/77/78/80/86/87/88/92. No Law-1 import from memory was
found. The one soft anchor is Penneys:595–608 and :931, which are
*exercises* asserting the Z/2 FS sign; the script verifies that sign
directly.

## 2. Generality audit (Rule 16; generality rule)
All "general C" statements are proved generally: A, B, C, D1, D-F <1>1–<1>4,
the path criterion, D3, and E1. Instances appear only in `checks/` and the
examples table: the synthetic F block, the abstract pair block,
Vec_{Z_2}^ω, the unit-copy block, ZB face weights and CGS. Each instance is a
witness for a general class: D-FS (all pseudoreal X), C-labels (all
symmetric self-dual a with d > 1), D6 (any charge block of dimension ≥ 3).
There is no model hyperfixation. The pointed case in D-F <1>5 is forced by
the theorem, not chosen.

## 3. Layer and tag audit (Rule 17)
The tags are honest: "any; L0 + declarations; finite; →R1/→R3 ingredient; no
rung reached". FS indicators, pivotal and spherical structure are L0 data
(CA-88 Def. 88.2), and no L1+ structure is used. There is no rung inflation.
One correction: "→R1" for H1-A should read "→R3 (finite ingredient)". No
statement here feeds a Wilson-triangle limit state.

## 4. Corrected statement (H1′) with honest tags
*Setting any; L0 + pointed (O, η), h = h†, decorated tile basis
(proposed (ay)), declared closure and charge weights; finite; →R3
ingredient; no rung.*
(i) [derived] Exact decorated net expansion (A2). The weight is a product
only over copy- and multiplicity-decorated nets.
(ii) [derived] Ev_C obeys the bubble, F and contractible-circle = d_a rules
and the (B1) trace identities. The physical Gibbs state is
tr_C(J_L e^{-βH}·)/tr_C(J_L e^{-βH}). With J_L, only contractible components
carry d_a.
(iii) [derived; conditional] Exact inverse-Gram sewing. If the weights are
nonnegative scalars and Z > 0, the law has the domain Markov property for
disk-like Q, with boundary state [L_ξ]. Endpoint labels are not enough.
(iv) [derived] For oriented-proper (snake = 1) or κ = +1 loop tiles, a closed
history has weight ∏w ∏_loops d_a under *planar* closure. Positivity is then
equivalent to the phase criterion (D3). For pseudoreal X a nonnegative h can
have negative closed histories: this is forced, an invariant over
C-covariant presentations.
(v) [derived] D-F: a nonnegative complete unitary F calculus exists iff
⟨X⟩ ≅ Hilb_G with [ω] = 0. Separately, the path-gauge (holonomy) criterion.
(vi) [derived; negative] Temporal RP does not imply termwise positivity of a
fixed presentation. Termwise positivity does not imply RP.
(vii) [conjectural] E2 and E-Markov as stated in the note.
**Pillar:** P2 primary (this is the P2 object, and it fixes exactly when it
is a probability measure), with P1 inseparable (birth/death/ν reactions,
vacancy flags). P3 gets only the E1 interface; P4 is untouched.

## 5. What the brief got wrong
1. (a) Labels from Irr(⟨X⟩) are not enough: with multiplicities, a bare-net
   coefficient is a sum of products.
2. (b) "A closed worldline contributes d_a and otherwise decouples" holds only
   for contractible components of Ev_C. The physical Tr_H needs J_L. There
   is no statistical decoupling.
3. (c) "For arbitrary C" a probabilistic Markov law needs positivity, and the
   cut data is the full boundary functional, not labels.
4. (d)(i) The iff fails both ways, and κ_X was omitted although CONVENTIONS
   (r) mandates it. The same omission sits in CA-86 Cor. 86.2 ("closed
   X-loop = d_X", "isotopy holds for Ev_C"), which is false for pseudoreal X
   with raw unoriented cups.
5. (d)(ii) N_XX^X ≠ 0 is the wrong trigger. F phases are forced by any
   noninvertible simple, in the loop-sector entry F^{aāa}_a. F-signs do not
   imply gas negativity either.
6. (e) There is no L0 "exact relation" between anisotropy and tile weights
   (h ↦ qh). The background claims are also off. AFM-S:71–89 (local) already
   states the W = A·eval_C geometric ensemble, dilute and with arrows
   (:128–139). CA-78 Prop. 78.2 already removed the O(δτ²) remainder. SLE/CLE
   is discussed in local sources (CGS:527–532, :784–796; MDP2019; VJS2014
   bibliography), so the brief and worklog 023:40 ("SLE/CLE appears once")
   understate it.

## 6. Gaps to close before lifting (none invalidates a result)
G1: name the standard solution coev_O in B <1>5. G2: restrict H1-C to
disk-like Q, or state the multi-boundary functional. G3: D1 positivity is
for planar or categorical closure only; the J_L or ordinary-trace closure is
open (see §7). G4: D3 is presentation-relative; state this in the theorem.
Trivial: add the explicit Trotter witness; fix the ω(P,in)/ω(P,out) formula
in `check_fs_instance` comments for general ω.

## 7. Sharpest next lemma
**Lemma (ordinary-trace positivity of the loop sector, arbitrary C).**
Assume: C unitary fusion; O = 1 ⊕ X with X closed under duality; every
self-dual simple summand has κ = +1; and h is in the span of the
nonbranching geometric tiles (vacancy, through, hop, birth/death with
*proper* oriented cups, cup-cap) with nonnegative coefficients. Prove that
for every L there is a diagonal phase gauge of the fusion-path basis of
H_L = ⊕_c Hom(c, O^L) in which every exp(t h_j), t ≥ 0, is entrywise
nonnegative. Equivalently, every path-multigraph cycle has holonomy 1.
Identify the resulting weight of time-wrapping components under J_L.
*Why this lemma:* it is exactly what turns the *physical* Gibbs state into a
probability measure on worldline histories (P2) for every C in the loop
sector. That is the input any SLE/CLE argument needs. The hypothesis is
sharp: D-FS shows that κ = −1 is a forced obstruction. *Evidence:* it holds
in the pointed instances (review P2). Heuristically, the cup-cap block at
fixed outer charge is rank one, e = |y⟩⟨y|, so its local phases are gauge;
the content is the cross-bond consistency of those gauges (a cocycle
condition). Follow-up: the same question with ν-vertex tiles, where F phases
enter through the vertex sector.

## Sources checked (path:line)
- `references/text/PenneysUnitaryFusionCategories.md:219–237, 284–288,
  394–430, 528–568, 589–608, 905–961, 1008–1050`
- `references/text/EtingofNikshychOstrikFusionCategories.txt:134–144, 1966–1973`
- `references/cft/AasenFendleyMong2020/source/_fusion_categories_and_diagrammatics.tex:30–88`;
  `…/_Statistical_mechanics_from_fusion_categories.tex:17–21, 39–89, 128–139, 536–553, 785–788`
- `references/string-net/LevinWen2005/source/strnet.tex:497–524`
- `references/lattice-symmetry/ZhouBatchelor1997/source/9611156.tex:104–145`
- `references/lattice-symmetry/ChelkakGlazmanSmirnov2016/source/StressTensor.tex:527–532, 572–580, 784–796, 876, 909, 927`
- `references/cft/Schottenloher2008/Schottenloher2008.md:7335–7349, 7373–7374`
- `references/lattice-symmetry/HonglerJohanssonKytola2013/source/vir_20130715.tex:1234–1239`;
  `…/HonglerKytolaViklund2022/source/lattice-virasoro-updates-final.tex:202–216`;
  `references/categorical-reconstruction/BrehmRunkel2024/source/main.tex:2214`
- `references/lattice-symmetry/VernierJacobsenSaleur2014/source/RegimeIII-v3.tex:2525–2527` (new lead)
- `report/sections/66_…:54–106, 128–152`; `75_…:115–138`; `77_…:47–60, 90–158, 207–226`;
  `78_…:40–68, 88–98`; `80_…:50–140`; `86_…:61–110, 268–282`; `87_…:54–69`;
  `88_…:54–56, 82–151`; `92_…:53–121`
- `CONVENTIONS.md:631–694 (r), 1359–1470 (aj)–(am)`; `worklog/023_…:28–62`; `worklog/019_…:95–100`
- Re-run: all five `checks/*.py`. New: `checks/review_holonomy.py`, `checks/review_d3_rotation.py`, plus outputs.
