# E3 — Sceptical review of NOTE.md (spatial reflection positivity, lattice OS, crossing)

Reviewer: Claude (Opus), 2026-10-22. Lens: AGENTS.md Rules 16 (no model
hyperfixation) and 17 (layer by data), CONVENTIONS (aq). I read the brief
(`briefs/E3-reflection-positivity.md`), the whole NOTE, both check scripts
and their outputs, CA-75/78/80/86/88, CONVENTIONS (b),(r),(ak)-(aq), the D2/D5
round-1 material and every cited source anchor. No Julia, no latexmk, no
edits outside this directory, no commit.

**Headline grade: WEAKER-RESULT-PROVED.** Every finite theorem the note
labels proven or conditional is valid as stated (one step relies on a
hypothesis that is folded into a definition; see E3-S <1>3). The note's
verdict "E3 as stated is false" is only partly right. E3(b)'s literal
crossing clause and E3(c)'s perpendicular commutator are ill-typed, and the
Θ_x of the brief does not exist for every (C,O). The note's main argument
against E3(a) (§2, "contradictory dagger necessity") comes from how it reads
the brief: under the natural reading, the "dagger involution of tiles" is the
spatial involution Θ_x. The note's own witnesses E3-N <1>2-<1>3 then
*confirm* E3(a)'s "not sufficient, not necessary" clause, and E3-S + E3-L are
the precise version of E3(a) for one crossing tile. The general-C,
whole-history iff of E3(a), the two-direction transfer and crossing relation
of E3(b), and the lattice OS axioms are not proved. The first gap is the
coherent reflection datum s (§6 below).

Reproduce (from the repo root):

```bash
PYTHONDONTWRITEBYTECODE=1 python3 explorations/2026-10-22-astra-r2/E3-reflection-positivity/checks/check_seams.py
PYTHONDONTWRITEBYTECODE=1 python3 explorations/2026-10-22-astra-r2/E3-reflection-positivity/checks/check_categories.py
PYTHONDONTWRITEBYTECODE=1 python3 explorations/2026-10-22-astra-r2/E3-reflection-positivity/checks/review_checks.py
```

The first two reproduce `seams_output.txt` and `categories_output.txt`
exactly. The third is the reviewer's independent check: it has its own
bending code with explicit associators, its own permutation arithmetic and
random tests. Its output is `checks/review_output.txt` (19 PASS, exit 0).

## 1. Citation check

Every cited anchor was opened.

| Cited | Claim in NOTE | Verdict |
|---|---|---|
| CA-80:97-104 | dagger-pair condition = h self-adjoint | match (Cor. 80.3) |
| CA-80:70-81, :87-95 | Lemma 80.1 leg-cut sewing / inverse Gram; Lemma 80.2 blockwise RP | match |
| CA-80:137-140 | spatial RP not covered | match. This is the gap E3 actually addresses |
| CA-86:80-93 | first-order tile expansion with remainder | match (Lemma 86.1) |
| CA-78:44-53 | placement `F^dagger(1 tensor D)F` | match (Prop. 78.1) |
| CA-78:56-68 | exact gate ODE | match (Prop. 78.2) |
| CA-78:90-97 / :150-160 / :165-174 | metric response; commuting non-YBE gates; transfer erratum | match |
| CA-75:115-138 | Link (a2) | **partial mismatch:** (a2) asks about spatial *sewing* (seam correction as a bounded insertion, anomaly-line limit), not RP. E3 gives a seam operator but no sewing identity across a plaquette seam. The RP gap is CA-80:137-140 |
| [P] Penneys :277-294, :319-323, :398-430, :530-568, :682-708, :917, :992-1030 | Vec(G)/Rep(G), duality, (3.5.14) normalisation, F unitarity, dual functor, non-automatic self-duality, unitary pivotal/positive traces | match. Several are exercises in lecture notes, the weakest kind of ground truth, but cited honestly |
| [KS] 9312156.tex:603, :716-718, :725, :729-738 | brick row; non-commutation; diagonal τ_D; log expansion | match |
| [Y] 1408.1282.md:149-170 | face YBE and commuting closed t(u) | match |
| [SC] Schottenloher :4113-4117, :4150-4172, :4616-4642 | self-adjoint P_j, spectrum condition, OS S1-S3 | match |
| LC-4 :16-31, :140-160 | RP/semigroup estimates needed; analytic boundary | match (:30-31) |
| D5 NOTE :71-100, :138-285; REVIEW :130-142; INTEGRATION :153-160 | conventions; prior finite results; spatial RP open | match. **Note:** D5 NOTE:231-239 already states the crossing-kernel test "C>=0". E3-S is a typed refinement of it, not a new criterion |
| D2 NOTE :52-89; REVIEW :119-142; INTEGRATION :28-36 | ports, YBE limits, transfer reading | match (spot-checked) |
| CONVENTIONS :62-87, :631-694, :1397-1448, :1483-1500 | (b), (r), (ak)-(al), (ao) | match |
| Registration lines (manifest/SOURCES.md:35,69-71, etc.) | sources registered | match |

No fabricated or mis-paraphrased anchors. The one mismatch is the
CA-75 (a2) framing.

## 2. Step-by-step verdicts

### §1 conventions, §2 "cannot be true"
- §1 (lines 14-65): valid and careful. It keeps the linear history `1+th`
  separate from the exact gate, and its definition of RP as all-insertion
  positivity is the right one. **Layer convention (59-65) is wrong; see §4.**
- §2 (67-73): **invalid as a refutation; it is a reading.** The brief writes
  "c_alpha-bar = conj(c_alpha) under the dagger involution of tiles" inside a
  statement about *spatial* reflection Θ_x (= site reflection ∘ dagger).
  Read with ᾱ := Θ_x(α), the condition is spatial Hermiticity, not h = h†.
  Then nothing is contradictory, and E3-L <1>2 proves that this condition
  (A = K_s(h) Hermitian) is *necessary*. The review check confirms the
  equivalence in Vec: `K_flip(h)` Hermitian ⇔ `P h† P = h`. The point that
  survives is that the PSD matrix must contain the identity tile (E3-N <1>4).
  The brief is also inconsistent: it assumes h self-adjoint in the setup and
  then says self-adjointness is "not necessary". That is sloppy wording, not
  a false theorem.

### Proposition E3-N (79-117)
- <1>1 (N1): **valid.** I derived `K(T)_{(ik),(jl)} = T_{(il),(kj)}` by hand
  from (1) with `ev(e*_a⊗e_b)=δ_ab` and the flip s. The script compares all 16
  matrix units.
- <1>2: **valid, with the hypothesis "for the flip pairing" made essential.**
  Spectrum {2, −2t, 0, 0} (review check). The exact-gate formula is correct.
  *Refutation of the witness's scope:* with s' = flip∘(X⊗X̄), i.e. Θ_x
  composed with the global on-site symmetry X (which fixes `vec 1`, flips
  `vec Z`, and commutes with h), `K_{s'}(1−tZ⊗Z) ≥ 0` (review check). This is
  the classical "antiferromagnet is RP after a sublattice flip". The witness
  refutes the claim for the brief's literal Θ_x only. That is what the
  brief asserted (self-adjointness insufficient), so the witness supports E3(a).
- <1>3: **valid.** Spatial RP without self-adjointness. Again it supports
  the brief's "not necessary".
- <1>4: **valid.** It refutes any criterion stated as PSD of the generator
  coefficients alone.
- <1>5 "works inside every C": **valid**, because `1⊕1` sits in the
  unit-summand corner of any C. Caveat: `O=1⊕1` is excluded by the
  *connected* convention (r) (`Hom(1,X)=0`) and allowed only by (am). The
  review check transfers the witness to the connected site O=1⊕g in
  `Vec_{Z2}^ω` (semion cocycle) and `Vec_{Z3}^ω`, with `Z=P_1−P_g`: the
  vacuum block is `[[1−t,1+t],[1+t,1−t]]`, eigenvalue −2t, independent of
  ω. For general C and O=1⊕X the same follows from E3-L if
  `K_s(Z⊗Z)=|z><z|` with `z=(Z⊗1)u`, `Qz≠0`. That requires s to be natural
  for the End(O)-action, so this part is a reviewer remark, not proved.

### Theorem E3-S (122-199) and multi-tile (201-214)
- Definition (1), <1>1 typing: **valid.** rot: (right-in O ⊗ right-out Ō)
  → (left-in Ō ⊗ left-out O), i.e. right boundary data to left boundary
  data.
- (2)/(3), <1>2: **valid.** `v†Xv ∈ End(a)=ℂ`, `tr_C = d_a·scalar`. Formula
  (3) is ordinary matrix multiplication once all trees are resolved. The
  (3.5.14) renormalisation `(d_i d_j/d_k)^{1/4}` is correct.
- <1>3: **valid with an unstated reliance.** "The prescribed reflected
  half-patch evaluates to the adjoint half-amplitude" is not derived. It is
  the defining property of the "reflection pairing" in §1 (lines 37-47).
  E3-S is therefore close to a definition plus CA-80 Lemma 80.2. The real
  content is the explicit oriented formula (1)-(3).
- <1>4-<1>5: **valid** (Lemma 80.2 with spanning; d_a weights harmless).
- **Gauge freedom the note does not state.** s is pinned only on the single
  vector u (`s coev = ev†`). Any `s' = s∘W` with W unitary in End_C(W_+) and
  `Wu=u` is admissible, and `K_{s'} = W† K_s`. On every non-vacuum charge
  block (and on `u^⊥` in the vacuum block), W is free. Polar decomposition
  then makes those blocks PSD for *some* s. So single-tile spatial RP is a
  property of (C,O,h,**s**), and it has content only once s is fixed
  independently of h, as the note requires at lines 40-41. That fixing is
  exactly Open Problem 1. The review check also shows the cocycle ω changes
  `K_s(T)` beyond this left gauge (singular values move), while the vacuum
  block of a pointed multiplicity-free O is ω-independent (`=[T_{(ab),(ab)}]`).
  The F/pivotal data do enter (2) as claimed.
- Multi-tile <1>1-<1>3: **valid conditional on its hypotheses**:
  tensor-compatible s, disjoint seams, reflected bulk pairs. The planar
  ordering of the left half's seam word relative to the right half's is not
  automatic for a non-braided C. It is absorbed into "ports and s pairings
  tensor compatibly", which may be unsatisfiable (see the S3 witness below).
  For a translation-invariant brick lattice, "bulk tiles in reflected pairs"
  is the condition Θ_x(h)=h. In Vec this is equivalent to `K_s(h)`
  Hermitian (review check), but the note does not state this. Necessity on a
  whole patch is correctly *not* claimed.
- s-obstruction paragraph (216-229): **valid.** Independent recomputation
  with sympy permutations gives `W_+ ≇ W_-` for O=1+(12)+(123) in Vec_S3
  under *both* composition conventions, and `W_+ ≅ W_-` for the self-dual
  O=1+(12)+(13)+(23). So the obstruction needs a non-self-dual O in a
  non-braided C. The note's scoping, "not a no-go for doubled
  constructions", is correct.

### Theorem E3-L (233-282)
- <1>1: **valid.** `rot(1)=ev†coev†` follows from the interchange law; the
  associators cancel for T=1. The review check confirms `K_s(1)=uu†` with
  explicit nontrivial 3-cocycles (Z2 semion, Z3 with p=1,2, including
  non-self-dual O).
- <1>2: **valid.** Hermiticity, compression and the kernel argument
  (`b ⊥ ker C` ⇒ `b ∈ Ran C` for Hermitian C).
- <1>3: **valid.** Standard Schur complement with generalized inverse. The
  review check compares (5) with direct eigenvalues on 300 random pencils
  (no mismatch) and checks the range-failure example for t down to 1e-6.
- <1>4: **valid.** `d_O>0`. ε depends only on single-tile data
  `(d_O, a, b, C)`, so for identical crossing tiles the criterion is uniform
  in chain length N and row number M. Unstated hypothesis: a single crossing
  tile with full-span insertions, for necessity.
- Exact-gate remark (274-282): **valid.** Derivative argument and the
  `[[1,t],[t,t²]]` example.

### Theorem E3-OS (286-317) and the following paragraphs
- <1>1-<1>5: **valid.** This is textbook finite OS: radical = null space,
  null descent from `0≤q1≤q0`, `0≤T≤1`, logarithm under injectivity,
  multi-time kernel positivity. It is category-free.
- "How this connects" (319-331): **valid but mostly a restatement.** The
  three hypotheses that matter (upper bound in (7), shift closure, form
  compatibility) are named as unproved. Correct.
- "Strictness" (333-341): **valid.**
- "Two directions and rotation" (343-362): the momentum argument (J P J† =
  −P with P ≥ 0 forces P = 0) is **valid**. "F composed with dagger is
  conjugate-linear, so it cannot equal rot" is **valid under the literal
  antilinear reading**, but the brief may have meant the complex-linear rot
  followed by reindexing. The rank argument (identity tile: rank n² vs rank 1)
  is **valid** and is the robust refutation of a single-tile similarity. It
  does *not* refute a relation between the *whole-lattice* row and column
  transfers (e.g. `Tr T_t^M = Tr T_x^L` on a torus, which holds trivially for
  any tensor network on a torus and needs no F-move). The ledger's
  "E3(b) — negative" is therefore overstated: E3(b) is vague and partly
  unproved, and false only in its literal "F∘dagger" clause.

### §6: E3-Y, E3-D, E3-T (366-482)
- Typing objection (366-376): **valid.** The two directional transfers act
  on cut spaces of different objects and dimensions.
- E3-Y <1>1-<1>3: **valid.** Regrouping uses only `[L_aj,L_bk]=0` for
  `j≠k`; the train argument and closure invariance follow.
- E3-Y <1>4: **valid.** I re-derived the product property of the twisted
  partial trace in matrix units; the cyclicity is only over auxiliary R.
- Consequences (420-429): **valid.** The identification of perpendicular
  transfers with t(u), t(v) is correctly marked unproved.
- E3-D <1>1-<1>2: **valid** (telescoping, then linearity of Cl). N terms;
  no uniform-in-N bound is claimed or available.
- CA-78 78.7(ii) as a "counterexample to the off-line assertion": **valid
  as an analogy.** It concerns one parameter family on one cut, not the
  temporal/spatial pair.
- E3-T <1>1-<1>3 and (12): **valid** (by hand: quadratic coefficients
  `S²/2 ± [A,B]/2`, cubic `−[S,[A,B]]`; checked numerically with random 4×4
  matrices). The brief asked for a first-order off-line formula; the honest
  answer is that it vanishes at first order. That answers a mis-typed
  question rather than proving or refuting (c).

### §7 checks
- **Valid and reproducible.** Outputs match on re-run; the mutations fail as
  recorded. Two qualifications:
  1. In both *positive* category calibrations, s is the **symmetric
     braiding**: the flip in Vec_Z3 with trivial associator, and `Swap` in
     Rep(A4), where V is real and hence self-dual. The non-self-dual instance
     works only because Vec_Z3 is abelian (W_+ ≅ W_- by commutativity). There
     is no positive instance of E3-S in a genuinely non-braided C with a
     non-self-dual site, and the only such instance (Vec_S3) is the
     obstruction. This is a hidden L1 ingredient in the examples (Rule 17),
     not in the theorems.
  2. In Rep(A4), K is computed through the fibre functor. The F-path checks
     test tree placement, but they are not the route by which K is computed,
     so formula (3) itself is not exercised entry by entry. The 2×2
     multiplicity block of the reported tile `1+Swap/2` is scalar (½·I₂). The
     loop over multiplicity matrix units asserts block structure but prints
     no non-scalar block.

## 3. Rule 16 audit (model independence)

All theorems (E3-S, E3-L, E3-OS, E3-Y/D/T) are stated and proved for general
data. None silently uses self-duality, multiplicity-freeness, braiding, a TL
quotient or a model fact. Categories appear only in checks and the examples
table. E3-N uses a unit-multiplicity corner, which is category-blind by
design. This is legitimate for falsifying a universal claim, but such a
witness says nothing C-specific. The silent ingredient is in the examples:
symmetric braidings as s (§2 above).

## 4. Rule 17 audit (layer tags, CONVENTIONS (aq))

- **Wrong data-layer tag.** The note tags the reflection pairing s,
  translation/normalisation and transfer closures as "L3 over L0". In (aq),
  L3 is CFT enrichment (c lift, weights, characters, chiral-algebra
  presentation). CA-88:49-51 says microscopic choices (site, tiles, boundary
  and **seam**) are "declarations at every layer, not a data layer". So s is
  an **L0 declaration**. Its *existence* is automatic when O is self-dual
  (L0 plus a declared unitary self-duality), and, by the standard ribbon
  identity `ev† = c_{O,Ō}(θ_O⊗1)coev`, at L1. That last identity is a
  reviewer remark with **no local source** (Law 1 gap). It fails for
  non-self-dual O in a non-braided C (Vec_S3).
- **Rung.** "R0" is not an (aq) rung (R0^c/R0^u are towers). These are
  single-cutoff finite lemmas: tag them "finite, →R3", as CA-88 tags CA-86/87.
- **Setting.** "Both" is too generous for *untwisted* Θ_x. Spatial RP needs
  Θ_x-invariant h (= Hermitian K_s(h)), i.e. a parity-symmetric chain. E2's
  claimed implication ("parity forces equality of both central coefficients",
  E2 NOTE:13-14; E2 not yet reviewed) then makes untwisted spatial RP a full-setting
  (c = c̄) tool. A chiral target would need Θ_x twisted by an internal
  (anti)unitary, as in the X-flip example above. The tag should be "full;
  chiral only with a declared twisted reflection".
- E3-OS and E3-Y/D/T use no categorical data: tag **category-free**.

## 5. Refutation attempts

| Attempt | Result |
|---|---|
| Vec: recompute (N1) and E3-N by hand | Confirmed |
| Vec_G with cocycle (Z2 semion, Z3 p=1,2; self-dual and non-self-dual O) | `K_s(1)=uu†` holds. E3-L survives. ω enters K non-trivially but leaves the pointed vacuum block unchanged. Failed to break |
| Non-self-dual X, non-braided C (Vec_S3, two composition conventions) | Obstruction confirmed. Self-dual O in the same C has matching ports |
| Multiplicity (Rep(A4)) | Re-ran note's check: passes. Multiplicity block for the reported tile is scalar (weak test) |
| Is E3-N robust to the choice of reflection? | **No.** Composing Θ_x with the X-flip makes the same h spatially RP. Witness is pairing-specific |
| Connected site (r) instead of 1⊕1 | Witness transfers (O=1⊕g, cocycles on) |
| Uniformity in N, M | E3-L's ε is single-tile, so uniform. E3-D's residual is a sum of N terms (no bound claimed). E3-OS is finite. No hidden N-dependent constant found |
| E3-L Schur exactness | 300 random pencils plus the range counterexample: no mismatch |
| (12) sign/order | Random-matrix check: confirmed |
| FS indicator −1 (Z2 semion) as an obstruction to `s coev = ev†` | Not an obstruction: the FS phase is absorbed into the vacuum entry of s. An involutive antiunitary Θ might square to −1 on pseudo-real sites. That is harmless at the observable level (Ad J² = id) but unexamined in the note. Open, not a refutation |

## 6. Conjecture vs what is proved; first gap

*Brief:* for general C, (a) an iff criterion for spatial RP of Z with an
explicit F/pivotal matrix; (b) positive transfers in both directions, a
crossing relation "F∘dagger", lattice OS axioms; (c) commuting transfers on
integrable lines and a first-order off-line commutator.

*Proved:* (a) for **one crossing tile**, given a declared pairing s with
`s coev = ev†`: explicit kernel (1)-(3), iff (E3-S), and the sharp small-δτ
criterion (4)-(5) for the brief's linear history (E3-L), uniform in N.
Multi-tile sufficiency holds under declared coherence. Self-adjointness is
neither necessary nor sufficient (E3-N, which confirms the brief).
(b) Only the abstract finite OS contraction lemma; no crossing relation. The
"F∘dagger" clause is ill-typed, and positive momentum is impossible under
reflection. (c) The abstract train lemma and residual formula; the
perpendicular commutator is ill-typed.

**First gap:** E3-S <1>3 for a multi-tile brick seam. That the reflected
half-history evaluates to the adjoint amplitude needs an involutive,
dagger-compatible, sewing-compatible reflection of the whole brick grammar,
with s fixed independently of h. The note assumes this and flags it as Open
Problem 1. The right lemma can be closed: build Θ_x from the antilinear,
anti-monoidal functor `X ↦ (X^∨)^†` (Penneys:682-708, :992-1003; this is
E2's map (20)). Compose it with a declared unitary self-duality ψ: O → Ō,
or use E2-R's mirror carrier. Then prove (i) Θ_x is an antiunitary on every
cut space and is compatible with Lemma 80.1 sewing; (ii) the induced s
satisfies `s coev = ev†` up to FS phases; (iii) `K_s(h)` is Hermitian iff
Θ_x(h)=h.

## 7. Minor

- The ledger line "E3-N — proven ... in every C" should add "for the flip
  pairing on the unit-multiplicity corner".
- "E3(a) — negative: contradictory dagger necessity" should read
  "refined: precise single-tile version proved (E3-S/E3-L); s is extra data;
  whole-patch iff false without spanning".
- `check_categories.py` docstring cites Penneys :321-323; NOTE cites
  :319-323. Both cover the same exercises.
