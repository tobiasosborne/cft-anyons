# Canonical Repo Migration Plan

**Goal:** Consolidate all knowledge won across `cft-anyons/`,
`microscopic-mobile-anyons/`, and `cft-anyons-deprecated/` into a single
canonical repo at `cft-anyons/`, accreting one atomic validated step at a
time, with definitional consistency enforced at every step.

**Status:** Plan only — nothing executed yet.

---

## 0. Methodology

### 0.1 Risk model
The dominant risk is **definitional drift**: importing a definition that
subtly disagrees with the canonical one, polluting downstream work with
incompatible assumptions. Examples already known to be live:

- Three Hilbert-space formulations (partition `H_P^W`, mobile-Fock,
  N-tensor `H_N^W`) need an explicit translation map before any one of
  them is locked.
- TensorCategories.jl uses an **involutory** F-matrix gauge (`F² = I`,
  `F† ≠ F⁻¹`); `summary.tex` implicitly assumes a **unitary** gauge.
  Importing Julia code without a documented gauge bridge will create
  silent matrix-element bugs.
- MMA archive/v0 had vacuum index = 0 in some files and 1 in others
  (STL-1 audit). Importing any v0 content without a convention pass is
  unsafe.
- "Coassociativity" in CAD `Coassoc.lean` means scalar coassociativity
  (proven); in `summary.tex` §5 it means the categorical equation
  `(η⊗id)η = (id⊗η)η` (not proven anywhere). The same word covers two
  different claims.
- "Dagger-special" vs "Frobenius-special" was confused in an earlier
  `summary.tex` draft; the warning at §5.2 `warn:not-Frobenius` documents
  the fix. Any new content must respect this distinction.

### 0.2 The GLOSSARY is the lens
Every addition is filtered through `GLOSSARY.md`. If the addition uses a
term, the term must already be in GLOSSARY (or the addition includes a
GLOSSARY entry as part of the same atomic step). If the addition uses a
definition that does **not** match GLOSSARY, the migration either (a)
rewrites the addition to conform, (b) updates GLOSSARY with explicit
reasoning + cross-ref, or (c) is rejected.

### 0.3 Validation levels
Each step declares its validation level. Higher levels are required as
definitional risk increases.

| Code | Channel | When required |
|---|---|---|
| **M** | Mechanical: build/test/parse passes | every step |
| **D** | Definitional: each defn/term matches GLOSSARY (manual review) | any step that adds mathematical content |
| **C** | Cross-reference: claim verified in ≥2 independent sources | any newly-canonicalised mathematical claim |
| **R** | Reviewer: an audit by an independent agent (Opus, AF verifier, or hostile review) signs off | any step touching the core mathematical narrative |
| **I** | Idempotent: re-running the step produces the same state | any file move or hash-tracked import |

- **Low-risk** steps need M + I (e.g., copying a PDF).
- **Medium-risk** need M + D + I (e.g., importing a Lean file with no fusion-category content).
- **High-risk** need M + D + C + R + I (e.g., promoting MMA `finegraining.tex` math to a new `summary.tex` section).

### 0.4 Commit discipline
- `git init` happens in Phase 0; every subsequent step is exactly one
  commit.
- Commit message format:
  ```
  <step-id>: <one-line summary>

  Source: <absolute path or URL>
  Source SHA256 (if file): <hash>
  GLOSSARY changes: <added entries | none>
  Validation passed: M D C R I  (list which)
  Rollback: <git revert <commit> | rm -rf <path>>
  ```
- No bundled commits. If two atomic steps end up in one diff, split them.

### 0.5 Stop conditions (when to pause and ask the user)
- Any GLOSSARY conflict where the right choice is non-obvious.
- Any source where the local PDF disagrees with what `summary.tex`
  claims it says.
- Any Lean migration where `lake build` fails after the import.
- Any Julia migration where the existing test fails in the new location.
- Any step where the validation level requirement (M/D/C/R/I) cannot
  be met within the step.
- Any step where the rollback procedure is unclear.

### 0.6 What is *not* in scope of this plan
- Resuming the old `af/master/` session.
- Fixing all `summary.tex` review issues in one pass (only the unanimous
  errata in Phase 1; the rest are tracked but addressed downstream).
- Acquiring new PDFs for FRS / Pasquier / Huse / Koo–Saleur original /
  (G₂)₁ (these are flagged for later acquisition, not migration).
- Extending Lean beyond what CAD already has (the categorical bridge is
  a follow-on project, not migration).
- Producing new mathematical results (only consolidating existing ones).

---

## Phase 0 — Repo skeleton + git baseline (low risk, all mechanical)

| Step | Action | Validation |
|---|---|---|
| **P0.1** | `git init` in `/home/tobias/Projects/cft-anyons/`. `git add -A && git commit -m "P0.1: baseline snapshot of current state"`. | M: `git log` shows one commit; `git status` clean. I. |
| **P0.2** | Create directory skeleton: `archive/chats/`, `archive/cad-meta-snapshot/`, `archive/mma-archive-v0-snapshot/`, `reviews/`, `references/`, `literature/`, `Formalisation/`, `scripts/julia/`, `scripts/wolfram/`, `results/`, `src/`, `tests/`, `af/`. All empty (`.gitkeep` in each). | M: `find . -type d`. I. |
| **P0.3** | Create stub meta files (empty bodies, intent docstrings only): `PRD.md`, `GLOSSARY.md`, `PROVENANCE.md`, `MIGRATION_LOG.md`, `ERRATA.md`, `CONVENTIONS.md`, `RESEARCH_NOTES.md`. Each begins with a 3-line docstring describing its role and update policy. | M: files exist; D for the docstrings only. |
| **P0.4** | Move `chat1.md` through `chat4.md` to `archive/chats/`. Add `archive/README.md` warning: "These are deep-archive source materials. Do not read unless explicitly asked." | M: `ls archive/chats/` shows 4 files; `ls *.md` no longer shows chats. I. |
| **P0.5** | Move `review_1_algebra.md` through `review_4_consistency.md` to `reviews/`. | M: `ls reviews/` shows 4 files. I. |
| **P0.6** | Move `summary.{aux,log,out,toc,pdf}` to `.gitignore` patterns; remove tracked artifacts from git (`git rm --cached`). Keep `summary.tex`. Add `.gitignore` for `*.aux *.log *.out *.toc *.synctex* .lake/ _build/ *.jl.cov`. | M: `git status` clean after first PDF rebuild; PDF still rebuilds with `pdflatex summary.tex`. |
| **P0.7** | Initialize `MIGRATION_LOG.md` with header section + table for tracking each P-step's commit hash. Append P0.1–P0.6 entries retroactively. | M: log has P0.1–P0.6 entries. I. |
| **P0.8** | **Draft `PRD.md` v0** — the entry-point doc. **First thing any new agent reads.** Content (outline in §16 below): mission, scope (in/out), state-of-consolidation, canonical artifacts (with pointers), required read order for agents, validation methodology summary (pointer to MIGRATION_PLAN), acceptance gates, commit discipline summary (pointer to MIGRATION_PLAN §0.4), known limitations, escalation. Because GLOSSARY does not yet exist, v0 cannot reference canonical definitions — it commits to *the existence* of GLOSSARY/CONVENTIONS as the definitional bedrock and tells agents to refuse to add mathematical content until those files have entries. | M, D: PRD outline complete and structurally sound; uses no GLOSSARY terms (since none defined yet). |
| **P0.9** | **Hostile review of PRD v0** — spawn an Opus agent with prompt: "this PRD will be the first document every future agent reads. Find ambiguity, missing guard-rails, ways an agent could misinterpret the scope, missing escalation paths. Output `stocktake/reports/opus-prd-v0-review.md`." Iterate until the review finds nothing material. | R, M. |
| **P0.10** | Add a top-level `README.md` whose entire body is: short directory map + the single sentence "**Read [PRD.md](PRD.md) first**." All other documentation reads from PRD outward. | M, D. |

**Output of Phase 0:** A git-initialized canonical repo skeleton. `summary.tex` is the only mathematical content. Chats are archived. Reviews are accessible. Meta files exist; **PRD.md is the entry point and has been hostile-reviewed**. README.md just points to PRD.

---

## Phase 1 — Definitional bedrock: build the GLOSSARY (medium risk, high stakes)

This phase locks down canonical definitions **before** any external
mathematical content is imported. Every later phase will be filtered
through what is established here.

| Step | Action | Validation |
|---|---|---|
| **P1.1** | Read `summary.tex` end-to-end. For each `\begin{definition}` and each `\begin{convention}`, extract the term and canonical statement into `GLOSSARY.md`. Use a fixed schema: `## <term>` → "Canonical: <statement>" → "Source: summary.tex:<line>" → "Aliases: <synonyms in literature>" → "Translation map: (filled later for each external project's variant)". | M: every `\begin{definition}` in summary.tex has a GLOSSARY entry. D: definitions copied verbatim, not paraphrased. |
| **P1.2** | Add ERRATA entries for the 4 reviews' unanimous bugs. Currently this is **only** the `lem:binary-Z` squared-amplitudes bug (all 4 reviewers flagged it). Apply the fix in `summary.tex` (insert `\sqrt{...}` around the fraction; the in-doc warning at line 1583 already acknowledges this). Add ERRATA entry pointing to `reviews/review_1_algebra.md:Issue1`, `reviews/review_2_categorical.md:Issue11`, `reviews/review_3_cft.md:Issue17`, `reviews/review_4_consistency.md:<line>`. | M: `pdflatex summary.tex` still produces a PDF with same TOC. D: the fix changes ONLY the displayed coefficients (sums of squared amplitudes → amplitudes); no surrounding text touched. C: 4 reviewers agree. R: the in-doc `\begin{warning}` already authored. |
| **P1.3** | Document GLOSSARY entries for: `Hilbert space variants` — explicitly list the three formulations (`H_P^W`, mobile-Fock, `H_N^W`), declare `H_P^W = Hom_C(W, A_P)` from `summary.tex` Definition 2.4 as **canonical**, and stub the translation map fields for the other two with "TBD pending P1.4". | M, D. |
| **P1.4** | **Opus deep-dive.** Spawn an Opus agent with prompts to: (a) compare summary.tex `H_P^W = Hom_C(W, A_P)` Def 2.4, MMA's mobile-Fock `H = ⊕_N ⊕_configs Hom(c, X_{a₁}⊗…⊗X_{aₙ})`, and CAD handoff's `H_N^W = Hom(W, Q^⊗N)`; (b) produce a precise translation map between the three (or confirm one is a special case of another); (c) flag any claim in any of the three that fails to translate. Output to `stocktake/reports/opus-hilbert-bridge.md`. | M: opus produces report. R: report can be reviewed by user. C: report should cross-reference at least 2 sources per translation rule. |
| **P1.5** | If P1.4 produces a clean translation map, write it into GLOSSARY entries for each Hilbert-space variant. If P1.4 flags an irreconcilable conflict, **STOP** and ask user how to proceed. | D, R. |
| **P1.6** | Add `CONVENTIONS.md` entries for: (a) **vacuum index convention** (decide: 0-indexed vs 1-indexed; canonical choice + reasoning); (b) **F-matrix gauge** (declare unitary as canonical, document involutory translation rule for TensorCategories.jl-derived content); (c) **dagger/adjoint convention** (matches `summary.tex` Convention 2.1); (d) **multiplicity index notation** (matches Def 2.5); (e) **complex conjugation symbol**; (f) **TikZ macro source** (which file is canonical). | D: each convention declared with reasoning. |
| **P1.7** | Add GLOSSARY translation map entries for **CAD Lean** finite-coordinate skeleton vs `summary.tex` categorical statements. For each `summary.tex` definition that CAD Lean has a finite skeleton for (e.g., `H_N^W` Def 2.4 ↔ CAD `IndefiniteParticleSectorCoordinates`), record the translation. Use `reports/cad-lean.md` §5 (which already has a file-by-file mapping) as the source. | M: each CAD Lean file mentioned in `reports/cad-lean.md` has a GLOSSARY translation entry. D. |
| **P1.8** | Add GLOSSARY translation map entries for **MMA**: (a) `LabelledConfig` ↔ summary.tex partition; (b) `normalized_product_isometry` ↔ `E_{P→P'}`; (c) `interaction_hamiltonian` (Σ P_j) ↔ `e_i / d_σ` (TL generator). Source: `reports/mma-julia.md` §5. | D. |
| **P1.9** | **Definitional gate review.** Spawn an Opus agent to read GLOSSARY + CONVENTIONS in full and produce a report flagging: any term used in GLOSSARY without its own entry; any internal inconsistency; any conflict with `summary.tex`. Output to `stocktake/reports/opus-glossary-audit.md`. | M, R: user must read this and either approve or request edits before Phase 2 begins. |
| **P1.10** | Update `PROVENANCE.md` with Phase 1 summary: which content is now canonical, source paths, hashes of `summary.tex` post-errata and `GLOSSARY.md`/`CONVENTIONS.md`. | M, I. |
| **P1.11** | **Refresh `PRD.md` v0 → v1.** Now that GLOSSARY and CONVENTIONS exist, PRD's "canonical artifacts" section is fleshed out with pointers to specific GLOSSARY entries an agent must internalise before each task class (math content / Lean / Julia / scripts / literature). PRD's "validation methodology" section can now reference concrete examples from the GLOSSARY audit. | M, D, R: brief Opus review of the diff only. |

**Output of Phase 1:** A locked GLOSSARY + CONVENTIONS defining every term used in the canonical narrative. `summary.tex` has its one unanimous bug fixed (and ERRATA entry). Hilbert-space translation map established (or, in the case of unresolvable conflict, surfaced as a stop condition). PRD v1 pins these as the canonical references future agents must read first. Every later step refers back to GLOSSARY.

**Stop and confirm with user** before proceeding to Phase 2.

---

## Phase 2 — Provenance infrastructure: migrate the validators (low–medium risk)

External validators (PDFs, bibliography, the 4 hostile reviews) are
imported before any mathematical content. They are the apparatus we will
**use** to validate later migrations.

| Step | Action | Validation |
|---|---|---|
| **P2.1** | Copy `cft-anyons-deprecated/references/` → `cft-anyons/references/`. Preserve all subdirs (`text/`, `text/deprecated/`, `manifest/`). | M: `diff -r` against source. I. |
| **P2.2** | Recompute SHA256 for every file under `references/`. Compare to the hashes in `references/manifest/SOURCES.md`. Any mismatch is a stop condition. | M: shasum -a 256 on every file; compare to manifest. C: 2-source match (file hash + manifest record). I. |
| **P2.3** | For each `SRC-*` line locator in `references/manifest/SOURCES.md`, verify the cited line in the cited file contains the cited text. Script this. Any mismatch is a stop condition. | M: script passes. C. I. |
| **P2.4** | Copy `microscopic-mobile-anyons/literature/` → `cft-anyons/literature/`. Preserve full structure (`db/`, `pdfs/`, `md/`, `_archive/`, all `.md` files). | M: `diff -r`. I. |
| **P2.5** | Verify `literature/db/papers.sqlite` integrity: open with `sqlite3`, run `PRAGMA integrity_check`, count rows in `papers`, `authors`, `citations`. Confirm count = 630 papers, 702 citation edges (per `SYNTHESIS.md`). | M: sqlite checks. C: counts match SYNTHESIS.md. |
| **P2.6** | Copy the literature CLI from `microscopic-mobile-anyons/scripts/lit.py` (and any helpers it depends on) to `cft-anyons/scripts/lit/`. Run `lit status` to confirm operational. | M: `python scripts/lit/lit.py status` produces expected output. |
| **P2.7** | Append "literature DB lives at `literature/`; CLI at `scripts/lit/`" to `CONVENTIONS.md`. Update `PROVENANCE.md` with hashes of imported `references/` and `literature/` contents. | M, I. |
| **P2.8** | Build a one-shot `scripts/build-citation-index.py` that walks `summary.tex` for every `\cite{}`, `\unchecked`, and bibliographic mention, and emits `CITATION_INDEX.md` mapping each to (a) local PDF in `references/` if one exists, (b) `literature/` DB record if one exists, (c) AF node from CAD if one exists, (d) "no local source" otherwise. | M: script runs; emits a markdown table. C. |

**Output of Phase 2:** All external validators are present locally with verified provenance. `CITATION_INDEX.md` gives an exhaustive map of every `summary.tex` reference to its discharge status.

---

## Phase 3 — Discharge `\unchecked` flags using imported validators (medium risk)

For each `\unchecked` in `summary.tex`, replace with a verified citation
using what was imported in Phase 2.

| Step | Action | Validation |
|---|---|---|
| **P3.1** | From `CITATION_INDEX.md`, list every `\unchecked` flag that has either (a) a local PDF + verified line locator, or (b) a CAD AF node. These are dischargeable. | M: list emitted. |
| **P3.2** | Per-flag, atomic step. For each dischargeable `\unchecked`: locate the `\unchecked` in `summary.tex`, replace with a proper citation `\cite{SRC-XYZ}` or with a Lean-proof reference `\textsuperscript{[Lean]}` and a footnote. Add ERRATA entry. Each one is a separate commit. | M: `pdflatex summary.tex` builds; D: the replacement does not alter the surrounding claim; C: at least 2 sources cross-check (e.g., summary.tex statement + local PDF excerpt; or summary.tex + Lean AF node). |
| **P3.3** | For `\unchecked` items that lack local source (FRS, Pasquier, Huse, Koo–Saleur original, (G₂)₁): keep the `\unchecked` flag but add a footnote pointing to `RESEARCH_NOTES.md` entry explaining what acquisition is needed. Update `RESEARCH_NOTES.md` accordingly. | M: PDF builds; D: no claim change. |
| **P3.4** | Run a final pass: rebuild `CITATION_INDEX.md`; verify the count of `\unchecked` flags decreased by exactly the count of P3.2 atomic steps. | M, I. |

**Output of Phase 3:** `summary.tex` has roughly half of its `\unchecked` flags discharged with proper local citations; the rest are explicitly tracked as acquisition tasks.

---

## Phase 4 — Lean infrastructure migration: abstract `LinearAlgebra/` (medium risk)

The CAD Lean `LinearAlgebra/` subdirectory contains 13 files about matrices, isometries, polar decomposition, no-mixing, tensor products, Kraus channels — **no fusion-category content**. These import only Mathlib. They are the safest Lean content to migrate.

| Step | Action | Validation |
|---|---|---|
| **P4.1** | Copy `cft-anyons-deprecated/lakefile.lean`, `lean-toolchain`, `lake-manifest.json` to `cft-anyons/`. Adjust `lakefile.lean` to use `Formalisation/` as the lib root (already so in CAD). Run `lake update` and `lake build` (empty). | M: `lake build` returns successfully on empty package. |
| **P4.2** | Copy `Formalisation/LinearAlgebra/Isometry.lean` only. Run `lake build`. | M: green. D: each declaration's statement matches a GLOSSARY entry or is a supporting lemma — append GLOSSARY references in the Lean file's docstring as `-- GLOSSARY: <term>` lines on the same step. |
| **P4.3** | Copy `LinearAlgebra/Polar.lean`. Lake build. | M, D. |
| **P4.4** | Copy `LinearAlgebra/Tensor.lean`. Lake build. | M, D. |
| **P4.5** | Copy `LinearAlgebra/TensorPower.lean`. Lake build. | M, D. |
| **P4.6** | Copy `LinearAlgebra/HeterogeneousTensor.lean`. Lake build. | M, D. |
| **P4.7** | Copy `LinearAlgebra/Trace.lean`. Lake build. | M, D. |
| **P4.8** | Copy `LinearAlgebra/Postcompose.lean`. Lake build. | M, D. |
| **P4.9** | Copy `LinearAlgebra/Component.lean`. Lake build. | M, D. |
| **P4.10** | Copy `LinearAlgebra/NoMixing.lean`. Lake build. | M, D. |
| **P4.11** | Copy `LinearAlgebra/FineGraining.lean`. Lake build. | M, D. |
| **P4.12** | Copy `LinearAlgebra/CoherentSystem.lean`. Lake build. | M, D. |
| **P4.13** | Copy `LinearAlgebra/DiagonalScaling.lean`. Lake build. | M, D. |
| **P4.14** | Copy `LinearAlgebra/ChargeOnly.lean`. Lake build. | M, D. |
| **P4.15** | Update `PROVENANCE.md` with source hashes + commit hash for each imported file. Note: this is the entire `LinearAlgebra/` set. | M, I. |

**Output of Phase 4:** All 13 `LinearAlgebra/` Lean files compile in the canonical repo. Each declaration is cross-referenced to GLOSSARY. `lake build` is green.

---

## Phase 5 — Lean fusion-category content migration (medium–high risk)

Fibonacci, Ising, and Foundations Lean content depends on convention choices (skeletal vs categorical, vacuum index, etc.). Each import requires explicit GLOSSARY conformance check.

| Step | Action | Validation |
|---|---|---|
| **P5.1** | Copy `Foundations/SkeletalFusion.lean`. Check: does its `FiniteSkeletalFusionData` structure match CONVENTIONS.md's chosen vacuum index and the GLOSSARY `fusion category` entry? If not, decide before import. | M, D, R: spawn a quick Opus check on this single file's definitions vs GLOSSARY. |
| **P5.2** | Copy `Foundations/DirectSumCoordinates.lean`. Lake build. | M, D. |
| **P5.3** | Copy `Foundations/Configurations.lean`. **CAUTION**: the CAD version of this file imports `Fibonacci.FusionRules` (reverse dependency flagged in `reports/cad-lean.md` §6). Decouple: refactor the file to be generic over a fusion-data instance, with the Fibonacci specialisation lemmas moved to `Fibonacci/Configurations.lean`. Lake build. | M, D: post-decoupling, the file no longer imports anything from Fibonacci/. C: behaviour-preserving refactor (each old lemma still provable). |
| **P5.4** | Copy `Foundations/ConfigurationSpace.lean`. Lake build. | M, D. |
| **P5.5** | Copy `Foundations/FockSpace.lean`. Lake build. | M, D. |
| **P5.6** | Copy `Foundations/ProjectDefinitions.lean`. Confirm `IndefiniteParticleSectorCoordinates` matches GLOSSARY's `H_N^W` translation rule (P1.7). Lake build. | M, D, C. |
| **P5.7** | Copy `Fibonacci/Basic.lean`. Confirm each golden-ratio identity matches a `summary.tex` Lemma 7.3 sub-claim. Lake build. | M, D, C: 3-way (Lean / summary.tex / Wolfram script `fibonacci_checks.wls`). |
| **P5.8** | Copy `Fibonacci/Matrix.lean`. Confirm `FibF` matches summary.tex Definition 7.5 entries. Lake build. | M, D, C. |
| **P5.9** | Copy `Fibonacci/FusionRules.lean` (post-decoupling per P5.3). Lake build. | M, D, C. |
| **P5.10** | Copy `Fibonacci/Binary.lean`. Confirm `PFBinaryEta` matches summary.tex Definition 7.8 (PF amplitudes). Lake build. | M, D, C. |
| **P5.11** | Copy `Fibonacci/Coassoc.lean`. **EXPLICITLY** preserve the module docstring's scope disclaimer ("does NOT prove the categorical equation `(η⊗id)η = (id⊗η)η`"). Add a GLOSSARY note distinguishing **scalar coassociativity** (proven) from **categorical coassociativity** (open). Lake build. | M, D, C, R: this is a high-stakes definitional disambiguation. |
| **P5.12** | Copy `Fibonacci/CFTWeights.lean`. Confirm `tauChiralConformalWeight = 2/5` matches summary.tex §9.3 chiral `(G₂)₁` choice — **noting** that `summary.tex` flags `(G₂)₁` as `\unchecked` (P3.3). Lake build. | M, D. |
| **P5.13** | Copy `Fibonacci/BraidMatrices.lean`. Lake build. | M, D. |
| **P5.14** | Copy `Fibonacci/RGNoMixing.lean`. Lake build. | M, D. |
| **P5.15** | Copy `Ising/Basic.lean`. Note CAD's Ising file is NOT connected to `FiniteSkeletalFusionData` (per `reports/cad-lean.md` §4). Either (a) add the connection as part of this step, or (b) record a follow-up task in `RESEARCH_NOTES.md`. Lake build. | M, D. |
| **P5.16** | `lake build` everything together. Update `PROVENANCE.md` with the full Lean migration record. | M, I. |

**Output of Phase 5:** All 28 CAD Lean files migrated, each cross-referenced to GLOSSARY, with the Foundations↔Fibonacci circular dependency fixed. Zero `sorry`, zero `axiom`, `lake build` green.

---

## Phase 6 — Triple-check scripts (low–medium risk)

The CAD 25 Julia + 25 Wolfram scripts mirror Lean modules. They are independent verification channels and **defining infrastructure** for any future formalisation work.

| Step | Action | Validation |
|---|---|---|
| **P6.1** | Copy `cft-anyons-deprecated/scripts/julia/` → `cft-anyons/scripts/julia/`. Copy `cft-anyons-deprecated/scripts/wolfram/` → `cft-anyons/scripts/wolfram/`. | M: `diff -r`. I. |
| **P6.2** | Copy `cft-anyons-deprecated/results/CHECKS.md` → `cft-anyons/results/CHECKS.md`. | M, I. |
| **P6.3** | Re-run **one** Julia script (smallest, say `direct_sum_orthogonal_checks.jl`). Confirm it passes. | M. |
| **P6.4** | Re-run **one** Wolfram script (matched to P6.3). Confirm it passes. | M. |
| **P6.5** | Re-run all 25 Julia scripts. Record passes in CHECKS.md (append new dated section, do not overwrite the 2026-05-14/15 record). | M. |
| **P6.6** | Re-run all 25 Wolfram scripts. Append to CHECKS.md. | M. |
| **P6.7** | Update `PROVENANCE.md` with the rerun timestamp + pass status. | M, I. |

**Output of Phase 6:** Triple-check infrastructure (Lean + Julia + Wolfram) operational in the canonical repo.

---

## Phase 7 — af workspace consolidation (decision step)

| Step | Action | Validation |
|---|---|---|
| **P7.1** | **DECISION STEP** — ask user: (a) resume the old `cft-anyons-deprecated/af/master/` ledger as-is (preserving the 561-event history), (b) initialize a fresh `cft-anyons/af/master/` with the same conjecture and replay just the validated nodes as accepted, or (c) skip af for now. Default recommendation: (a) for full provenance preservation. | R: user decides. |
| **P7.2** | (If chosen) Execute decision. If (a): `cp -r cft-anyons-deprecated/af/ cft-anyons/af/`; run `af status` to confirm tree intact. If (b): `af init --conjecture "<root from MASTER_PROVENANCE.md>"`, then per-node `af accept` of the 58 validated nodes. | M: `af status` / `af progress` shows expected state. I. |
| **P7.3** | Migrate the CAD heavy meta docs (`handoff.md`, `MASTER_PROVENANCE.md`, `NEXT_AGENT_HANDOFF.md`, `FORMALISATION_PLAN.md`) to `archive/cad-meta-snapshot/`. **Do not** treat their content as canonical — they are snapshots of an earlier state of the math. The canonical view is now `summary.tex` + `GLOSSARY.md`. Add `archive/cad-meta-snapshot/README.md` explaining this. | M, D: a final read confirms no contradiction with current GLOSSARY introduced into canonical material. |
| **P7.4** | Migrate `cft-anyons-deprecated/tex/cft_anyons_formalisation.tex` to `archive/cad-meta-snapshot/`. Keep accessible but not canonical (`summary.tex` is the conceptual statement; this provenance doc was for the finite-coordinate slice only). | M, I. |
| **P7.5** | Copy `stocktake/reports/af-cli-reference.md` to a top-level `docs/af-quickref.md`. This is the reusable af workflow knowledge. | M, I. |

**Output of Phase 7:** af workspace (per user choice) present; CAD meta docs archived (not canonical); af CLI reference accessible as project docs.

---

## Phase 8 — MMA Julia computational backend (medium risk, depends on Phase 1 translation map)

| Step | Action | Validation |
|---|---|---|
| **P8.1** | **Definitional bridge audit (Opus)**. Spawn an Opus agent to read MMA's `src/MobileAnyons/{config,hilbert,fsymbols,operators,interaction,braiding,paircreation,finegraining,wavelets,virasoro}.jl` and confirm: (a) every fundamental concept maps to a GLOSSARY entry, (b) the involutory F-matrix gauge convention is correctly handled (this is what MMA's `interaction.jl` and `braiding.jl` Hermitian-projector workaround does), (c) any divergence from CONVENTIONS.md (vacuum index, etc.) is documented. Output to `stocktake/reports/opus-mma-julia-bridge.md`. | M, R. |
| **P8.2** | If P8.1 surfaces conflicts, **STOP** and resolve before any code import. Likely resolution: add a `CONVENTIONS.md` exception for "TensorCategories.jl-derived code uses involutory gauge; conversion to unitary is done via `_physical_embedding`". | D, R. |
| **P8.3** | Copy `Project.toml` and `Manifest.toml` from MMA. `julia --project=. -e 'using Pkg; Pkg.instantiate()'`. Confirm environment resolves. | M. |
| **P8.4** | Per-file import. `src/MobileAnyons/MobileAnyons.jl` (the module shell), then `config.jl`, then `hilbert.jl`, then `fsymbols.jl`. After each: `julia --project=. -e 'using MobileAnyons'`. | M: import succeeds. D: file's exported symbols all have GLOSSARY entries. |
| **P8.5** | Continue per-file: `operators.jl`, `interaction.jl`, `braiding.jl`, `paircreation.jl`, `wavelets.jl`. Same validation. | M, D. |
| **P8.6** | `finegraining.jl`: import everything **except** `categorical_determinant_isometry` (flagged "partial correction only"). Add a comment in the canonical file noting the exclusion + pointer to `archive/mma-archive-v0-snapshot/` for the original. | M, D. The exclusion is itself a step. |
| **P8.7** | `virasoro.jl`: import everything **except** `virasoro_commutator_check` (returns `c_estimate=NaN`, a stub). Add a `RESEARCH_NOTES.md` task to either complete or remove it. | M, D. |
| **P8.8** | Copy `test/` directory (18 test files). Run `julia --project=. -e 'using Pkg; Pkg.test()'`. Record pass/fail in `results/CHECKS.md`. | M: full test suite passes (or, if any test depends on excluded code, document the test-level exclusion). |
| **P8.9** | Update `PROVENANCE.md` with the full Julia migration record + source hashes. | M, I. |

**Output of Phase 8:** MMA's working Julia computational backend integrated into the canonical repo. Known-broken pieces explicitly excluded with tracked follow-ups.

---

## Phase 9 — MMA `finegraining.tex` consolidation (high risk: NEW MATH integration)

This phase introduces mathematical content not already in `summary.tex`. It is the highest-stakes addition in the plan.

| Step | Action | Validation |
|---|---|---|
| **P9.1** | **Opus deep-dive: notational reconciliation.** Read `microscopic-mobile-anyons/tex/sections/finegraining.tex` (291 lines) against `summary.tex` §6 (length-weighted square-zero), §11 (non-tree pair-creation interpolation), §10 (polar decomposition). Determine: is `finegraining.tex`'s number-changing isometry construction (a) a new construction, (b) a special case of summary.tex §11, (c) a rephrasing of summary.tex §10 polar section, or (d) something inconsistent with summary.tex's framework? Output to `stocktake/reports/opus-finegraining-reconciliation.md`. | R, C. |
| **P9.2** | If P9.1 says **new construction**: draft a new section for `summary.tex` (likely as §6.5 "Wavelet-based number-changing refinement, after Garjani–Ardonne"). Draft is in a separate `draft-section-finegraining.tex` file first; do not edit `summary.tex` yet. | D: draft uses GLOSSARY terms only. C: each proof step has a citation to either `finegraining.tex` or a Julia test or a Lean lemma. |
| **P9.3** | **Hostile review on the draft.** Spawn an Opus agent in the style of `reviews/review_2_categorical.md` (which was very thorough) to audit the draft section. Output to `reviews/review_5_finegraining.md`. | R. |
| **P9.4** | Iterate the draft until the review accepts it (or surfaces irreconcilable conflicts that need user input). | R, D. |
| **P9.5** | Once accepted, integrate the draft into `summary.tex` as a new section. Update GLOSSARY with any new terms. Update ERRATA with the integration entry. | M: `pdflatex summary.tex` builds. D, C, R. |
| **P9.6** | If P9.1 instead says **special case** or **rephrasing**: do NOT add a new section. Instead, add a short remark in the relevant existing section + a citation to `finegraining.tex`. Lower stakes path. | D, C. |
| **P9.7** | Update `PROVENANCE.md`. | I. |

**Output of Phase 9:** `summary.tex` either has a new section accommodating MMA's number-changing math (with full review), or has minor cross-reference additions, depending on P9.1's conclusion.

---

## Phase 10 — Selective archive/v0 extraction (medium risk, after STL-1 fix)

MMA's `archive/v0/` has substantive content (23 tex sections, 19 concept docs, 30 Julia files) but confirmed indexing bugs (STL-1 through STL-4 per `ultracritical_audit_2026-01-03.md`).

| Step | Action | Validation |
|---|---|---|
| **P10.1** | Copy `microscopic-mobile-anyons/archive/v0/` → `cft-anyons/archive/mma-archive-v0-snapshot/` **for reference only**; mark with explicit README warning about the STL-1 bug. | M, I. |
| **P10.2** | Read `archive/mma-archive-v0-snapshot/reviews/ultracritical_audit_2026-01-03.md` end-to-end. List every file flagged with a bug + line number. | M. |
| **P10.3** | For each v0 tex section that fills a GLOSSARY gap (the candidates are likely `fusion_ring.tex`, `fusion_category.tex`, `morphism_spaces.tex`, `diagrammatic_calculus.tex`, `fusion_tree_basis.tex`, `fusion_category_examples.tex`): per-file extraction. For each candidate: (a) read it; (b) apply STL-1 fix (vacuum index convention); (c) check definitional conformance to GLOSSARY; (d) if it adds value beyond `summary.tex` AND is now correct, merge into `summary.tex` or `docs/`; (e) otherwise leave in archive. Each candidate is a separate atomic step. | M, D, C, R per candidate. |
| **P10.4** | For v0 Julia code: do NOT migrate. Leave in archive. The current MMA `src/MobileAnyons/` (already in canonical via Phase 8) supersedes it. | M, I. |
| **P10.5** | Update PROVENANCE.md with the v0 extraction summary. | M, I. |

**Output of Phase 10:** Useful v0 content selectively integrated after bug-fix conformance check; rest preserved as accessible archive.

---

## Phase 11 — Final consistency sweep (low risk, validates the whole)

| Step | Action | Validation |
|---|---|---|
| **P11.1** | Build a `scripts/check-canonical-consistency.py` that: (a) greps `summary.tex` for every definition and confirms each appears in GLOSSARY; (b) greps `Formalisation/` for every public declaration and confirms each has a `-- GLOSSARY:` reference; (c) for each GLOSSARY term, confirms it appears in exactly one canonical source (no silent duplicates); (d) for each CONVENTION, confirms it is followed in all relevant files. | M. |
| **P11.2** | Run the check script. Resolve any flagged duplicates by demoting one to a `\see{GLOSSARY}` pointer. | M, D. |
| **P11.3** | Rebuild `summary.tex`; `lake build` Formalisation; `julia --project=. -e 'using Pkg; Pkg.test()'`. All green. | M. |
| **P11.4** | **Refresh `PRD.md` v1 → final.** Promote known-limitations entries from `RESEARCH_NOTES.md` into PRD's "what's not covered" section. Update read-order recommendation now that all canonical artifacts are in place. Update README.md to reflect final structure. | M, D, R: full Opus hostile review of final PRD. |
| **P11.5** | Commit a snapshot tag: `git tag v1.0-consolidated`. | M, I. |

**Output of Phase 11:** Canonical repo is consistent, validated end-to-end, and tagged. PRD.md is in its final form as the agent entry point.

---

## 12. Risk register

| Risk | Likelihood | Impact | Mitigation phase |
|---|---|---|---|
| Hilbert-space formulations don't reconcile cleanly | Medium | High (would block Phase 5, 8, 9) | P1.4 Opus dive, P1.5 stop condition |
| TensorCategories.jl gauge mismatch produces silent bugs in migrated Julia | High | High | P1.6 convention document, P8.1 audit |
| CAD Lean's reverse dependency (Foundations imports Fibonacci) propagates breakage | Certain (already known) | Medium | P5.3 explicit decoupling step |
| MMA finegraining.tex math conflicts with summary.tex framework | Unknown | High | P9.1 Opus dive, P9.3 hostile review |
| v0 archive contains additional undocumented bugs beyond STL-1–4 | Possible | Medium (only affects P10) | P10.2 audit re-read, per-file conformance |
| Some `\unchecked` claim turns out wrong upon discharge attempt | Possible | Medium | P3.2 atomic-per-flag, stop on conflict |
| `lake build` breaks at some Lean import due to Mathlib version drift | Low | Medium | P4.1 fixes lake/toolchain first; if breakage, pin to CAD's `d6dab93` |
| Reference manifest hashes don't recompute | Low | High | P2.2 stop condition |
| Two independent agents (Opus checks) disagree | Possible | Medium | Surface to user; the user adjudicates |

---

## 13. Summary table of atomic steps

| Phase | Steps | Risk | Validation level |
|---|---|---|---|
| 0 — Skeleton | P0.1–P0.7 | Low | M, I |
| 1 — GLOSSARY | P1.1–P1.10 | Medium-high stakes | D, R, sometimes C |
| 2 — Provenance | P2.1–P2.8 | Low–med | M, C, I |
| 3 — Discharge \unchecked | P3.1–P3.4 (one commit per discharge) | Medium | M, D, C |
| 4 — Lean infra | P4.1–P4.15 | Medium | M, D |
| 5 — Lean fusion-cat | P5.1–P5.16 | Medium–high | M, D, C, sometimes R |
| 6 — Scripts | P6.1–P6.7 | Low | M |
| 7 — af + meta archive | P7.1–P7.5 | Low–med | M, D, R for P7.1 |
| 8 — MMA Julia | P8.1–P8.9 | Medium | M, D, R |
| 9 — MMA finegraining math | P9.1–P9.7 | High | M, D, C, R (full) |
| 10 — v0 extraction | P10.1–P10.5 (multi-commit P10.3) | Medium | M, D, C, R per file |
| 11 — Consistency sweep | P11.1–P11.5 | Low | M, D |

**Atomic-commit count estimate:** ~80–120 commits, depending on how many `\unchecked` flags get discharged (P3.2) and how many v0 files get extracted (P10.3).

---

## 14. What this plan deliberately does NOT do

- It does not pre-decide which of options A–D in `stocktake/README.md` §8 to take; this plan is closer to option B (consolidate) with hooks for option C (extend formalisation later).
- It does not extend formalisation beyond what CAD already proved.
- It does not refactor `summary.tex` structure (only errata-driven fixes and the optional P9.5 new section).
- It does not delete the source projects (`microscopic-mobile-anyons/`, `cft-anyons-deprecated/`); they remain as-is until the user explicitly says they can be removed.
- It does not introduce new mathematical claims of its own.

## 15. Recommended pause points (places to stop and reassess)

- **After P0.10** (PRD v0 + README hostile-reviewed): user reviews the entry-point doc before any mathematical work begins.
- **After P1.5** (Hilbert-space translation map): the most important stop. If the three formulations don't reconcile cleanly, the whole plan needs revision.
- **After P1.11** (GLOSSARY audit + PRD v1): the user reviews the canonical definitions and updated PRD before any imports begin.
- **After P3.4** (\unchecked discharge): the user reviews which flags were cleared and which remain.
- **After P5.16** (Lean full migration): the user confirms the Lean side now mirrors what CAD had.
- **After P9.4** (finegraining review): the user decides whether to integrate the new section or just cross-reference.
- **After P11.4** (final PRD + README): the user confirms the canonical repo is ready to declare v1.0.

Any of these pauses may surface a need to revise downstream phases.

---

## 16. PRD outline (for P0.8)

This is the structure of `PRD.md` v0; content for each section is drafted in P0.8 itself and refined in P1.11 and P11.4.

1. **Mission** — one paragraph. "Single canonical ground-truth repo for the mathematics, formalisation, computational backend, and literature for indefinite-particle Hilbert spaces of mobile anyons modelled by unitary fusion categories, with refinement maps to OAR continuum limits."
2. **Read order for any agent** — explicit ordered list: (1) this PRD, (2) `GLOSSARY.md`, (3) `CONVENTIONS.md`, (4) the relevant section of `summary.tex`, (5) `MIGRATION_PLAN.md` only if doing consolidation work, (6) `PROVENANCE.md` only if asked about source provenance. **Agents must refuse to add new mathematical content until they have read (1)–(3).**
3. **Scope: in** — anyons in unitary fusion categories; partition Hilbert spaces; isometric refinement maps; algebra-object comultiplications; Fibonacci, Ising, Temperley–Lieb worked examples; Koo–Saleur lattice Virasoro; OAR continuum limit framework; matching numerical and formal-proof checks.
4. **Scope: out** — 2D bulk CFT path integrals; non-unitary categories; gravity / holography; specific physical applications beyond benchmarking. Adding content outside this scope is a stop condition.
5. **Canonical artifacts** (with file paths):
   - `summary.tex` — guiding conceptual mathematical statement.
   - `GLOSSARY.md` — definitional bedrock; *every* term used in canonical material is defined here.
   - `CONVENTIONS.md` — notational, gauge, and indexing choices.
   - `ERRATA.md` — corrections applied to `summary.tex` post-archival.
   - `Formalisation/` — Lean 4 formal proofs (`lake build` must pass; zero `sorry`, zero `axiom`).
   - `src/MobileAnyons/` — Julia computational backend (`Pkg.test()` must pass).
   - `scripts/{julia,wolfram}/` — independent triple-check scripts.
   - `references/` — local PDFs with SHA256-verified provenance; `references/manifest/SOURCES.md` is the master index.
   - `literature/` — bibliography DB (630 papers, SQLite-backed).
   - `reviews/` — hostile audits of canonical content.
6. **Validation gates for new content** — summary of MIGRATION_PLAN §0.3 (M/D/C/R/I). Specific rule: any new mathematical claim requires triple validation (typically: source citation + Lean or Julia check + hostile review).
7. **Commit discipline** — summary of MIGRATION_PLAN §0.4 (atomic, with provenance footer in commit message). Plus: never bundle two atomic steps; never edit history of canonical files outside an ERRATA entry.
8. **Stop conditions** — agent must stop and ask the user when: a GLOSSARY conflict arises; a local source disagrees with a canonical claim; a build/test fails after import; validation requirements cannot be met; rollback is unclear; two independent reviewers disagree.
9. **Project history** — three sentences pointing to `stocktake/README.md` for the inheritance picture from the three source projects.
10. **Known limitations / open frontier** — list (initially populated from `summary.tex` §15 conjectures, `cad-meta.md` "Failures / Persistent Gaps", and the undischarged `\unchecked` items): categorical coassociativity not yet formalised; Koo–Saleur convergence stated as conjecture; FRS / Pasquier / Huse / (G₂)₁ / Koo–Saleur 1994 — no local PDF; etc.
11. **Escalation** — when to ask the user; what to attach when asking; where to put open questions (`RESEARCH_NOTES.md`).
12. **Versioning** — current canonical version (e.g., "v0.3, mid-consolidation"); how the consolidation milestones map to version tags.

**Style:** PRD body should be ≤ 800 words. Anything longer goes into a referenced doc. The PRD's job is orientation, not exposition.
