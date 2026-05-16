# Opus review — P1.7 GLOSSARY: CAD-Lean translation-map population in all 49 entries

**Reviewer:** Opus 4.7 subagent (hostile-review role per Rule 4)
**Date:** 2026-05-16
**Files reviewed:** `GLOSSARY.md` (working-tree, +49/-63 lines vs HEAD;
49 CAD bullets populated — 48 §A + 1 §B mobile-Fock)
**Companion files (read-only):** `stocktake/reports/cad-lean.md`,
`stocktake/MIGRATION_PLAN.md`, `stocktake/reports/opus-hilbert-bridge.md`,
`stocktake/reports/opus-glossary-p1.5-review.md`
**Decision:** **APPROVE WITH MINOR EDITS**

---

## Per-area findings

### 1. CAD file-attribution accuracy (8 spot-checks)

For each spot-check, I verified: (a) Lean file path, (b) struct/lemma
name, (c) Phase X PX.Y step number against `MIGRATION_PLAN.md` Phases 4
and 5.

#### 1a. `def:fuscat` → `Foundations/SkeletalFusion.lean::FiniteSkeletalFusionData` (Phase 5 P5.1)

- File path: matches `cad-lean.md` §5 line 344. ✓
- Struct name: matches §2.1 line 40 (`FiniteSkeletalFusionData` is the
  named structure). ✓
- Phase step: P5.1 in `MIGRATION_PLAN.md:212` reads "Copy
  `Foundations/SkeletalFusion.lean`. Check: does its
  `FiniteSkeletalFusionData` structure match CONVENTIONS.md's chosen
  vacuum index and the GLOSSARY `fusion category` entry?". Match. ✓
- Scope-clarifier "No associators, no duals, no Hom-spaces": matches
  `cad-lean.md` §2.1 lines 41-42 ("This is a finite, coordinate-level
  skeleton — no associators, F-symbols, duals, or pentagon equation").
  PASS.

#### 1b. `def:Hlatt` → `Foundations/ProjectDefinitions.lean::IndefiniteParticleSectorCoordinates(sectorBasis)` (Phase 5 P5.6)

- File path: matches `cad-lean.md` §5 line 358. ✓
- Struct name + parameterisation `sectorBasis`: matches
  `opus-hilbert-bridge.md:249` verbatim. ✓
- Phase step: P5.6 in `MIGRATION_PLAN.md:217` reads "Copy
  `Foundations/ProjectDefinitions.lean`. Confirm
  `IndefiniteParticleSectorCoordinates` matches GLOSSARY's `H_N^W`
  translation rule (P1.7)." Match. ✓
- Supporting CAD files listed (DirectSumCoordinates P5.2,
  ConfigurationSpace P5.4, FockSpace P5.5): each verified against the
  migration plan. ✓
- Scope-clarifier "**Coordinate-skeleton level**, not categorical
  Hom-space": present and explicit. PASS.
- The `sectorBasis : Config label n → Type` signature matches bridge
  report:249 verbatim. PASS.

#### 1c. `def:refmap` → `LinearAlgebra/FineGraining.lean::FiniteFineGraining` (Phase 4 P4.11)

- File path: matches `cad-lean.md` §5 line 359. ✓
- Struct name: matches §2.4 lines 199-200 ("Defines `FiniteFineGraining`
  as a structure wrapping a matrix..."). ✓
- Phase step: P4.11 in `MIGRATION_PLAN.md:196` reads "Copy
  `LinearAlgebra/FineGraining.lean`. Lake build." Match. ✓
- Supporting infrastructure files (Isometry P4.2, Postcompose P4.8,
  Component P4.9, Tensor P4.4, TensorPower P4.5, HeterogeneousTensor
  P4.6): every Phase 4 step number cross-checked against
  `MIGRATION_PLAN.md:186-201`. All match. ✓
  PASS.

#### 1d. `def:fib-F` → `Fibonacci/Matrix.lean::FibF` (Phase 5 P5.8)

- File path: matches `cad-lean.md` §5 line 348. ✓
- Struct/decl name: matches §2.2 lines 105-110 (`FibF` and the
  `FibF_orthogonal` + `FibF_involutive` lemmas). ✓
- Phase step: P5.8 in `MIGRATION_PLAN.md:219` reads "Copy
  `Fibonacci/Matrix.lean`. Confirm `FibF` matches summary.tex Definition
  7.5 entries." Match. ✓
- Claim "Matches `summary.tex`'s unitary gauge (involutory coincides
  for Fibonacci per [P1.6(b)])": the canonical body of `def:fib-F`
  (lines 893-895) shows a real symmetric matrix that is also
  orthogonal — so unitary and involutory coincide here. Consistent.
  PASS.

#### 1e. `def:ising` → `Ising/Basic.lean` (Phase 5 P5.15)

- File path: matches `cad-lean.md` §5 line 346 ("Fusion table and ∆
  values proved"). ✓
- Phase step: P5.15 in `MIGRATION_PLAN.md:226` reads "Copy
  `Ising/Basic.lean`. Note CAD's Ising file is NOT connected to
  `FiniteSkeletalFusionData` (per `reports/cad-lean.md` §4). Either
  (a) add the connection as part of this step, or (b) record a
  follow-up task in `RESEARCH_NOTES.md`." Match. ✓
- Caveat flag "CAD's Ising file is NOT currently connected to
  `FiniteSkeletalFusionData` (no `isingSkeletalFusionData` instance
  analogous to `fibSkeletalFusionData`)": matches `cad-lean.md` §4
  line 329-330 ("`Ising/Basic.lean` does not connect to
  `FiniteSkeletalFusionData` (unlike `Fibonacci/FusionRules.lean`).").
  ✓
- Forward-pointer "P5.15 must either add the connection or file a
  follow-up task": matches P5.15's (a)-or-(b) verbatim. PASS.

#### 1f. `def:polar-repair` → `LinearAlgebra/Polar.lean` (Phase 4 P4.3)

- File path: matches `cad-lean.md` §5 line 360. ✓
- Phase step: P4.3 in `MIGRATION_PLAN.md:188` reads "Copy
  `LinearAlgebra/Polar.lean`. Lake build." Match. ✓
- **FACTUAL ERROR.** GLOSSARY claim (line 1516): "matrix algebra
  complete; existence of positive square root **taken from Mathlib**."
  `cad-lean.md` says the opposite:
  - §2.4 line 190: "Does **not** prove existence of positive square
    roots — only assumes the inverse-square-root matrix is given."
  - §4 line 327-328: "`Polar.lean` assumes the inverse-square-root
    matrix as input; does not prove existence of positive square roots
    (**a Mathlib gap at time of writing**)."
  - §5 line 360: "existence of positive square root not proved".

  The GLOSSARY's "taken from Mathlib" wording is the opposite of the
  source: the positive square root is NOT provided by Mathlib (it is
  the Mathlib gap), and `Polar.lean` does not import any such
  existence proof — it just *assumes the inverse-square-root matrix
  is given as input* to its theorems. A P4.3 implementer reading this
  GLOSSARY entry will be misled. **MINOR EDIT REQUESTED — see Section
  10**.

#### 1g. `def:fib` → `Fibonacci/FusionRules.lean::fibSkeletalFusionData` (Phase 5 P5.9)

- File path: matches `cad-lean.md` §5 line 345. ✓
- Decl name: matches §2.2 lines 100-101 ("Instantiates
  `fibSkeletalFusionData : FiniteSkeletalFusionData` — the only
  concrete fusion-data instance in the project"). ✓
- Phase step: P5.9 in `MIGRATION_PLAN.md:220` reads "Copy
  `Fibonacci/FusionRules.lean` (post-decoupling per P5.3). Lake
  build." Match. ✓
- Peripheral `Fibonacci/BraidMatrices.lean` cite (Phase 5 P5.13):
  P5.13 in `MIGRATION_PLAN.md:224` reads "Copy
  `Fibonacci/BraidMatrices.lean`. Lake build." Match. ✓
- "Not a named claim in `summary.tex`" matches `cad-lean.md` §5 line
  352. PASS.

#### 1h. `def:ascending` → `LinearAlgebra/Trace.lean` (Phase 4 P4.7) + `FineGraining.lean` (P4.11) + `ChargeOnly.lean` (P4.14) + `DiagonalScaling.lean` (P4.13)

- File paths: all match `cad-lean.md` §5 (lines 359, 362, 366). ✓
- Phase steps: P4.7 = Trace.lean (`MIGRATION_PLAN.md:192`), P4.11 =
  FineGraining.lean (line 196), P4.13 = DiagonalScaling.lean (line
  198), P4.14 = ChargeOnly.lean (line 199). All match. ✓
- Caveat "the categorical 'charge-only fails CFT spectrum' Warning is
  documented but NOT a CAD theorem": matches `cad-lean.md` §5 line
  366 ("`DiagonalScaling.lean`, `ChargeOnly.lean` | §8.5 (charge-only
  channel) | Eigenvalue structure proved; the 'charge-only failure'
  (Warning §8.5) not a theorem here"). PASS.

**Summary of 8 attribution spot-checks**: 7 PASS, 1 FACTUAL ERROR
(`def:polar-repair` reverses Mathlib gap assertion). All other file
paths, struct/lemma names, and Phase X step numbers match the source.

### 2. "Not formalised" justification (5 spot-checks)

For each, I verified the claim against `cad-lean.md` §5 "Notable gaps"
(lines 368-377) and the coverage table (lines 342-366).

#### 2a. `def:fib-mult` — "§7.4 not formalised"

- GLOSSARY (line 1004): "not formalised (per `stocktake/reports/cad-lean.md`
  §5 'Notable gaps: §7.4 Fibonacci as dagger-special algebra; the
  uniqueness theorem: not formalised'). `Fibonacci/Coassoc.lean`
  covers only scalar coassociativity constraints."
- Source `cad-lean.md` lines 372-373: "§7.4 (Fibonacci as
  dagger-special algebra; the uniqueness theorem): not formalised;
  `Coassoc.lean` covers only scalar coassociativity constraints."
- Match: verbatim. PASS.

#### 2b. `def:algobj` — "§5 algebra objects not formalised"

- GLOSSARY (line 758): "not formalised (per `stocktake/reports/cad-lean.md`
  §5 'Notable gaps: §5 algebra objects, comultiplication ∆ = m†/√λ:
  no Lean formalisation')."
- Source `cad-lean.md` line 370: "§5 (algebra objects, comultiplication
  ∆ = m†/√λ): no Lean formalisation."
- Match: verbatim. PASS.

#### 2c. `def:dense` and `def:TL-cat` — "§8.2-8.4 not formalised"

- `def:dense` GLOSSARY (line 1160): "not formalised (per
  `stocktake/reports/cad-lean.md` §5 'Notable gaps: §8.2–8.4 (TL
  generators, dense Ising chain, Koo–Saleur): not formalised')."
- `def:TL-cat` GLOSSARY (line 1188): "not formalised (per
  `stocktake/reports/cad-lean.md` §5 'Notable gaps: §8.2–8.4 ...')."
- Source `cad-lean.md` line 374: "§8.2–8.4 (TL generators, dense Ising
  chain, Koo–Saleur): not formalised."
- Match: verbatim. PASS.

#### 2d. `def:Jinterp` — "§11 not formalised"

- GLOSSARY (line 1492): "not formalised (per
  `stocktake/reports/cad-lean.md` §5 'Notable gaps: §11 ...')."
- Source `cad-lean.md` line 376: "§11 (non-tree / pair-creation
  interpolation): not formalised."
- Match: verbatim. PASS.

#### 2e. `def:ope3` — "§12 not formalised"

- GLOSSARY (line 1575): "not formalised (per
  `stocktake/reports/cad-lean.md` §5 'Notable gaps: §12 three-tensors
  from OPE: not formalised')."
- Source `cad-lean.md` line 377: "§12 (three-tensors from OPE): not
  formalised."
- Match: verbatim. PASS.

**Summary of 5 "not formalised" spot-checks**: all 5 PASS — each
claim is anchored to the verbatim gap-list entry in `cad-lean.md` §5.

### 3. Scope-clarifier consistency (per P1.4-early findings)

The P1.4-early Hilbert-space deep-dive established that "the Lean side
is at the *coordinate skeleton* level (not categorical) and document
what the user must supply (e.g., `sectorBasis : Config label n →
Type`) to instantiate it as a model of H_N^W."

#### 3a. `def:Hlatt` (line 424)

- "**Coordinate-skeleton level**, not categorical Hom-space.": present
  and bold-flagged. ✓
- "User must supply `sectorBasis : Config label n → Type`": present
  verbatim. ✓
PASS.

#### 3b. `def:Q` (line 357) — `LocalOccupationModel`

- "`LocalOccupationModel.vacuum : label` is **unconstrained** — the
  choice of `Q` (and which simple is vacuum) is supplied by the user
  at instantiation.": present. ✓
- "For the canonical `Q_full` default (P1.6(h)), supply the full label
  set.": present. ✓
PASS.

#### 3c. `def:fuscat` (line 207) — `FiniteSkeletalFusionData`

- "Coordinate-skeleton level": present. ✓
- "No associators, no duals, no Hom-spaces — the categorical content
  is supplied separately at instantiation.": present and explicit. ✓
PASS.

**Summary of 3 scope-clarifier spot-checks**: all PASS. The P1.4-early
finding (Lean is at coordinate-skeleton level + user must supply
sectorBasis) is consistently reflected across the three canonical
entries (`def:Hlatt`, `def:Q`, `def:fuscat`).

### 4. `def:coassoc` hallucination-risk callout

CLAUDE.md "Hallucination-risk callouts" flags "Coassociativity is
overloaded" — `Fibonacci/Coassoc.lean` proves scalar coassoc, not
categorical.

GLOSSARY `def:coassoc` CAD bullet (line 961):

> CAD proves **scalar coassociativity** (the F-symbol fixed-point
> equation on algebra parameters `(a, b)` per [[conv:1op]]) — NOT
> the categorical equation `(η⊗id)η = (id⊗η)η`. This is the
> CLAUDE.md hallucination-risk callout #3 (scalar-vs-categorical
> coassoc overloading). P5.11's docstring must preserve this
> disambiguation. Per `stocktake/reports/cad-lean.md` §5 line 350
> and §3 (which explicitly notes 'categorical proof gap explicitly
> noted').

- Disambiguation: explicit and bold-flagged.
- Reference to CLAUDE.md callout #3: yes.
- Forward-pointer to P5.11 docstring: yes (matches P5.11 in
  `MIGRATION_PLAN.md:222` which itself requires "EXPLICITLY preserve
  the module docstring's scope disclaimer").
- Source: cad-lean.md §5 line 350 ("Scalar algebra and matrix
  isometry proved; categorical proof gap explicitly noted"). Match.

The Notes field (line 962-973) repeats the disambiguation, references
the scalar-coassoc theorem in `summary.tex`, and adds the unique
positive solution. Reads as a "load-bearing" callout, not boilerplate.
PASS.

### 5. `def:ising` follow-up caveat

`cad-lean.md` §5 line 346 and §4 explicitly note CAD's `Ising/Basic.lean`
is NOT connected to `FiniteSkeletalFusionData`. P5.15 of MIGRATION_PLAN
requires either adding the connection or filing a follow-up.

GLOSSARY `def:ising` CAD bullet (line 1105):

> **Caveat per `stocktake/reports/cad-lean.md` §5 line 346 + §4 'State
> Assessment'**: CAD's Ising file is NOT currently connected to
> `FiniteSkeletalFusionData` (no `isingSkeletalFusionData` instance
> analogous to `fibSkeletalFusionData`). P5.15 must either add the
> connection or file a follow-up task.

- Bold caveat: present.
- Citation: `cad-lean.md` §5 line 346 + §4. Verified — line 346 is the
  Ising coverage row; §4 (line 329-330) is the State Assessment that
  says "`Ising/Basic.lean` does not connect to
  `FiniteSkeletalFusionData` (unlike `Fibonacci/FusionRules.lean`)."
- Forward-pointer to P5.15's (a)-or-(b): matches MIGRATION_PLAN
  verbatim.

PASS.

### 6. No CAD bullet overwritten in error (3 spot-checks)

I spot-checked three entries' full Translation-map blocks to confirm
(a) MMA bullet preserved, (b) only the CAD bullet changed, (c) Notes
field intact.

#### 6a. `def:Hlatt` (lines 391-424)

- MMA bullet (lines 392-423): N-tensor ↔ MF translation, 4 sub-bullets
  + worked example. Unchanged from P1.5. ✓
- CAD bullet (line 424): newly populated. ✓
- Notes field (lines 425-430): "Equivalent to [[def:HP]] when all
  $A_I = Q$..." — unchanged from P1.5. ✓
PASS.

#### 6b. `def:HP` (lines 510-542)

- MMA bullet (lines 511-541): partition ↔ MF chain via §2.3, four
  sub-bullets including worked example. Unchanged from P1.5. ✓
- CAD bullet (line 542): newly populated. ✓
- Notes field (lines 543-556): "This is the canonical Hilbert-space
  formulation..." with the particle-number disambiguation
  parenthetical. Unchanged from P1.5. ✓
PASS.

#### 6c. `def:mobile-Fock` (lines 1691-1736)

- MMA-side bullets (lines 1692-1735): all five sub-bullets covering
  partition map, N-tensor map, indlim, worked example, conventions.
  Unchanged from P1.5. ✓
- CAD bullet (line 1736): newly populated. ✓
- Notes field (lines 1737-1790): "The third of the three discrete
  Hilbert-space framings..." + the Convention dependencies block + the
  LB-1 caveat. Unchanged from P1.5. ✓
PASS.

**Summary of 3 overwrite-check spot-checks**: all PASS. The Python
script approach was constrained correctly to the CAD bullet only; no
collateral damage to MMA bullets or Notes fields.

### 7. Cross-link integrity

Confirmed by grep:
- Defined slugs (`^## (def|conv):...`): 49 (48 §A + 1 §B
  `def:mobile-Fock`).
- Distinct `[[slug]]` references in body: 41 (40 valid + 1 schema-doc
  placeholder `[[label]]` at line 79, which is the schema example
  and not a real cross-link).
- Missing: 0. Every body reference resolves to an existing slug.
- New CAD bullets reference: `[[def:Hlatt]]`, `[[def:fib-F]]`,
  `[[def:Jinterp]]`, `[[conv:1op]]`. All four resolve.

PASS.

### 8. Phase-4/5 use-case assessment

I imagined two specific scenarios for a future agent.

#### 8a. Phase-4 agent importing `LinearAlgebra/Polar.lean` (P4.3)

The agent opens GLOSSARY for `def:polar-repair` (the most relevant
canonical entry for polar decomposition). What they find:

> CAD: the polar-decomposition framework is in
> `LinearAlgebra/Polar.lean` (Phase 4 P4.3) — matrix algebra
> complete; **existence of positive square root taken from Mathlib**.

**This is wrong.** Per `cad-lean.md` §2.4 line 190 and §4 line 328,
existence of positive square root is a *Mathlib gap*, and `Polar.lean`
deliberately works around it by *assuming the inverse-square-root
matrix is given as input* (NOT by importing a Mathlib existence
proof). A P4.3 agent who trusts the GLOSSARY entry will:
- Believe that they can simply invoke a Mathlib lemma to prove
  existence of `B^{-1/2}` in their step.
- Be surprised when that lemma doesn't exist.
- Have to re-read `cad-lean.md` to discover the actual workaround
  (input-as-assumed-given).

This is a **MINOR but substantive** misrepresentation — exactly the
kind of "subtle definitional drift" that Law 1 is meant to prevent.
**Edit requested in Section 10.**

#### 8b. Phase-5 agent importing `Fibonacci/Matrix.lean` (P5.8) — `def:fib-F`

> CAD: `Fibonacci/Matrix.lean::FibF` (Phase 5 P5.8). The 2×2 matrix
> entries match `summary.tex Def 7.5` verbatim; `FibF_involutive`
> proves `F² = I`; `FibF_orthogonal` proves `F^T F = I`. Matches
> `summary.tex`'s unitary gauge (involutory coincides for Fibonacci
> per [P1.6(b)]).

A P5.8 agent receives:
- Exact decl name to look for. ✓
- Exact theorem names (`FibF_involutive`, `FibF_orthogonal`) to expect. ✓
- The two key properties they need to verify. ✓
- The convention-correspondence claim (unitary ↔ involutory for
  Fibonacci specifically) with forward-pointer to P1.6(b). ✓

This is a high-quality migration prompt. A P5.8 agent should be able
to do the migration with this entry alone. PASS.

### 9. Global completeness assessment

- **23/23 CAD Lean files covered**: confirmed by grep — every Lean
  file mentioned in `cad-lean.md` §5 appears somewhere in GLOSSARY.
  The author's M-gate validation is sound.
- **Phase-step accuracy**: 28 distinct Phase X PX.Y attributions
  cross-checked against `MIGRATION_PLAN.md:186-227`. All match.
- **"Not formalised" justification**: 5 sampled; all anchored to
  verbatim gap-list entries.
- **Scope clarifiers**: 3 high-stakes entries (`def:Hlatt`, `def:Q`,
  `def:fuscat`) all carry the P1.4-early required disambiguation.
- **Critical callouts preserved**: `def:coassoc` and `def:ising`
  both flag the right risks at the right place.

The one minor wart noted in area 8a (`def:polar-repair` Mathlib-gap
reversal) is the only substantive flag.

### 10. Carry-forward and residual minor items

- **Schema-doc preservation**: Line 77's `"TBD pending P1.7"` template
  example correctly preserved (the schema is illustrative, not a real
  entry). ✓
- **Stale Aliases field on `conv:basics`** (line 124): "TBD pending
  P1.7/P1.8." — P1.7 has now completed, so a fully precise wording
  would be "TBD pending P1.8" (Aliases were not in P1.7 scope, but
  the reference to P1.7 in the alias-stub is now dangling). **Not
  edit-requested** — this is cosmetic; P1.8 will sweep through alias
  fields. Folding into P1.8 is more efficient than a separate edit.
- **From P1.5 review** (carry-forward observations):
  - `def:KS-Ln` line-number nit: still outstanding. Not a P1.7 blocker.
  - `def:Q` vacuum-index callout: still outstanding. Not a P1.7
    blocker; P1.6 has now landed and `def:Q` Notes reference P1.6(a)
    correctly.

---

## Verdict

**APPROVE WITH MINOR EDITS.** The 49 CAD-bullet populations pass the
substantive checks:

| Check | Verdict |
|---|---|
| 1. CAD file-attribution accuracy (8 spot-checks) | PASS for 7; FACTUAL ERROR in `def:polar-repair` Mathlib-gap |
| 2. "Not formalised" justification (5 spot-checks) | PASS — all anchored to verbatim §5 gap entries |
| 3. Scope-clarifier consistency (3 spot-checks) | PASS — all three entries carry the P1.4-early disambiguation |
| 4. `def:coassoc` hallucination-risk callout | PASS — explicit + flagged + P5.11 forward-pointer |
| 5. `def:ising` follow-up caveat | PASS — caveat present + P5.15 forward-pointer |
| 6. No-overwrite spot-check (3 entries) | PASS — MMA bullets and Notes intact |
| 7. Cross-link integrity (41 refs, 49 slugs) | PASS — 0 missing |
| 8. Phase-4/5 use-case assessment | PASS for `def:fib-F`; MINOR for `def:polar-repair` (see #1f) |
| 9. Global completeness | PASS — 23/23 CAD files covered, 28/28 Phase steps match |

The mathematical content of all 49 CAD bullets is substantively
correct, internally consistent, and faithful to `cad-lean.md` §5. The
single MINOR edit request is a factual correction (the Mathlib gap
wording in `def:polar-repair`).

## Minor edit requested

1. **`GLOSSARY.md:1516` (`def:polar-repair` CAD bullet):** the current
   wording "existence of positive square root **taken from Mathlib**"
   reverses the source. `cad-lean.md` §2.4 line 190 + §4 line 327-328
   are explicit: Polar.lean does **not** import a positive-square-root
   existence proof from Mathlib (this is the documented "Mathlib gap
   at time of writing"); rather, it assumes the inverse-square-root
   matrix is given as input. Requested replacement:

   > CAD: the polar-decomposition framework is in
   > `LinearAlgebra/Polar.lean` (Phase 4 P4.3) — matrix algebra
   > complete; **existence of positive square root NOT proved (this
   > is a Mathlib gap at time of writing); the inverse-square-root
   > matrix `B^{-1/2}` is assumed given as input to the polar-section
   > theorems.** The specific [[def:Jinterp]] polar repair is NOT in
   > CAD scope (def:Jinterp itself isn't formalised per
   > `stocktake/reports/cad-lean.md` §5 '§11 not formalised').

   This is a P4.3-implementer-misleading misstatement — the kind of
   subtle drift that Law 1 explicitly warns against. Fix in P1.7
   commit before merging, or file as immediate follow-up bd issue
   gated on P4.3 (the P4.3 agent will be the one who hits this).

## Recommended commit-message `Review:` line

```
Review: Opus 4.7 subagent, APPROVE WITH MINOR EDITS — CAD bullets
in all 49 entries (48 §A + 1 §B) verified against cad-lean.md §5
file-by-file coverage table (lines 342-366), Notable gaps list
(368-377), and MIGRATION_PLAN.md Phase 4 (P4.1-P4.15) + Phase 5
(P5.1-P5.16) step numbers. 8 attribution spot-checks: 7 PASS, 1
factual error (def:polar-repair Mathlib-gap reversed). 5 "not
formalised" spot-checks: all PASS (verbatim §5 gap-list anchored).
3 scope-clarifier spot-checks (def:Hlatt sectorBasis,
def:Q LocalOccupationModel, def:fuscat coordinate-skeleton): all
PASS. def:coassoc and def:ising hallucination/follow-up callouts
preserved with explicit forward-pointers to P5.11 and P5.15.
3 no-overwrite spot-checks: MMA bullets + Notes intact. Cross-link
integrity: 41 referenced slugs, 49 defined, 0 missing. M-gate
(23/23 CAD files in GLOSSARY) passes. Minor edit: def:polar-repair
"taken from Mathlib" reverses cad-lean.md §4 — request correction
before merge or file P4.3-gated follow-up bd issue. Full report:
stocktake/reports/opus-glossary-p1.7-review.md.
```
