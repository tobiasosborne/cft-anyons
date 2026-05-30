# PRD — cft-anyons (consolidated)

<!--
ROLE: Entry-point document. First thing any new agent reads. Defines mission,
      scope, canonical artifacts, read order, validation methodology, stop
      conditions, known limitations, pre-read warnings.
UPDATE POLICY: Three planned refreshes — v0 (P0.8), v1 (P1.11 after
      GLOSSARY + CONVENTIONS exist, this), final (P11.4). Out-of-schedule
      substantive edits require hostile-review-gated commits per CLAUDE.md
      Rule 4.
TRIGGER: Any change to mission, scope, canonical-artifacts list, read order,
      methodology, pre-read warnings, or known limitations.
-->

**Version: v1 (P1.11 refresh, 2026-05-16). Status: Phase 1 (definitional
bedrock) complete; Phase 2 (provenance infrastructure / validator imports)
unblocked pending user read-and-approve of the P1.9 audit at
`stocktake/reports/opus-glossary-audit.md` (verdict: APPROVE FOR PHASE 2).**

If your question is about *scope* / *what*, this PRD is canonical.
For *how to work* / *process*, see `CLAUDE.md`.
For *what's next* / *the plan*, see `stocktake/MIGRATION_PLAN.md`.

---

## Mission

Single canonical ground-truth repo for the **mathematics, formalisation,
computational backend, and literature** of indefinite-particle Hilbert
spaces of mobile anyons modelled by unitary fusion categories, with
isometric refinement maps to OAR (operator-algebraic-renormalisation)
continuum limits. The Hilbert spaces are realised through **three
equivalent framings** (partition `H_P^W`, mobile-Fock, N-tensor
`H_N^W`) — translation map locked at MIGRATION_PLAN P1.5; see
GLOSSARY entries [[def:HP]], [[def:Hlatt]], [[def:indlim]],
[[def:mobile-Fock]] and the bridge synthesis at
`stocktake/reports/opus-hilbert-bridge.md`. The repo consolidates
three prior projects whose combined value was significant but whose
definitions had drifted silently. The dominant work-mode here is
**accretive consolidation**: add knowledge in small, validated, atomic
steps; harmonise on the way.

## Read order for any agent

1. **`PRD.md`** (this file)
2. **`GLOSSARY.md`** — definitional bedrock
3. **`CONVENTIONS.md`** — notational/gauge/indexing choices
4. **`CLAUDE.md` / `AGENTS.md`** — methodology and rules (identical pair; edits go to both in the same commit)
5. The artifact relevant to your task (typically `summary.tex` § for math; a Lean module for formalisation; a Julia/Wolfram script for verification; a `references/` PDF for citation)
6. **`stocktake/README.md`** — only if you need the inheritance picture from the three source projects
7. **`stocktake/MIGRATION_PLAN.md`** — only if doing consolidation work

**If you have not read all of `PRD.md` (this file), `GLOSSARY.md`,
`CONVENTIONS.md`, and `CLAUDE.md` (= `AGENTS.md`), you must refuse to
add mathematical content.** (The gate is stated by named files, not
ordinals, to prevent count-drift across documents.)

"Mathematical content" means: any new claim, definition, lemma, proof,
equation, F-matrix entry, F-symbol value, gauge choice, indexing
convention, citation footnote, or prose that asserts or implies one of
these. "Refuse" means: file a bd issue describing the proposed work,
mark it blocked on "Pre-read PRD/GLOSSARY/CONVENTIONS/CLAUDE.md
required," and stop.

**Phase-0 exception (lifted at P1.10 — historical note):** the v0 PRD
allowed adding GLOSSARY entries as the permitted form of
mathematical-content addition while GLOSSARY was empty (P1.1 era).
GLOSSARY is now populated (49 entries, P1.9 audit: APPROVE FOR
PHASE 2); the exception no longer applies. New GLOSSARY/CONVENTIONS
entries from external imports (Phase 5 / Phase 8) follow Law 1 + Rule
11 normally.

## Scope: in

Anyons in unitary fusion categories; partition Hilbert spaces; cellwise
isometric refinement maps; algebra-object comultiplications; Fibonacci,
Ising, and Temperley–Lieb worked examples; Koo–Saleur lattice Virasoro;
OAR continuum-limit framework; wavelet-based fine-graining; number-changing
isometries via Garjani–Ardonne pair creation (=local creation of an
anyon/antianyon pair from the vacuum); matching numerical and
formal-proof checks (Lean + Julia + Wolfram, scripts mirroring Lean
modules 1:1 per the CHECKS.md convention).

## Scope: out

2D bulk CFT path integrals; non-unitary categories; gravity / holography;
specific physical applications beyond benchmarking against known
critical models. **Also out: GitHub CI, automated remote test runs,
`.github/workflows/`** — quality gates run locally only (CLAUDE.md
Rule 9). Adding mathematical / domain content outside the subject-matter
scope is a **stop condition** — escalate to the user. Consolidation-procedural
additions (CONVENTIONS, ERRATA, translation maps) are governed by
`MIGRATION_PLAN.md` and are in scope by definition.

## Canonical artifacts

**Status (Phase 1 complete):** `GLOSSARY.md`, `CONVENTIONS.md`,
`ERRATA.md`, `PROVENANCE.md` are now populated baselines (P1.1–P1.10);
the P1.9 audit verified definitional integrity end-to-end. `summary.tex`
is the inherited baseline (unchanged in Phase 1; pre-baseline
`lem:binary-Z` fix recorded in ERRATA). `CITATION_INDEX.md` remains
pre-Phase-3 (discharge of `\unchecked` flags scheduled there).
`references/`, `literature/`, `Formalisation/`, `src/MobileAnyons/`,
`scripts/` remain pre-Phase-2/5/8 (skeleton only). **"GLOSSARY entry
absent" means STOP and ask, not "free to invent."**

- **`summary.tex`** — guiding conceptual mathematical statement. Edits ONLY via `ERRATA.md`-tracked atomic commits.
- **`GLOSSARY.md`** — 49 entries (48 §A from `summary.tex` + 1 §B for MMA's mobile-Fock formulation). Every term used in canonical material is defined here.
- **`CONVENTIONS.md`** — 10 lettered entries (a)–(j): vacuum index, F-matrix gauge, dagger, multiplicity-free, complex conjugation, TikZ (deferred), particle-number disambiguation, local cell object Q, fusion-tree ordering, N=0 boundary.
- **`ERRATA.md`** — append-only log of corrections to `summary.tex` (1 entry at Phase 1 close: `lem:binary-Z`).
- **`PROVENANCE.md`** — every canonical / imported file with source path + SHA256 + provenance chain. Phase 1 baseline populated at P1.10.
- **`RESEARCH_NOTES.md`** — open questions, deferred decisions, acquisition queue.
- **`MIGRATION_LOG.md`** — per-step commit log of the consolidation.
- **`CITATION_INDEX.md`** — every `summary.tex` citation → discharge status. Pre-Phase-3.
- **`Formalisation/`** — Lean 4. Invariants (post-Phase 5): `lake build` passes; zero `sorry`; zero `axiom`.
- **`src/MobileAnyons/`** — Julia computational backend. Invariant (post-Phase 8): `Pkg.test()` passes.
- **`scripts/{julia,wolfram}/`** — independent triple-check scripts, one per Lean module.
- **`references/`** — local PDFs with SHA256-verified extractions; `references/manifest/SOURCES.md` is the index.
- **`literature/`** — bibliography DB (630 papers, SQLite-backed).
- **`reviews/`** — hostile audits of canonical content.

### GLOSSARY entries to internalise, by task class

When starting a task, an agent must internalise the GLOSSARY entries
load-bearing for that task class (these are recommendations; the
Law 1 / Rule 11 obligation is on every term you use, not just these):

- **Mathematical content additions (any phase):** [[def:fuscat]],
  [[def:HP]], [[def:Hlatt]], [[def:indlim]], [[def:mobile-Fock]],
  [[def:partition]], [[def:refmap]], [[def:Q]], [[def:fsymbol]],
  [[def:algobj]], [[conv:basics]] plus the CONVENTIONS items the
  content depends on (vacuum index [P1.6(a)], F-matrix gauge
  [P1.6(b)], multiplicity-free assumption [P1.6(d)]).
- **Lean migration (Phase 5):** [[def:fuscat]], [[def:Q]], [[def:fib]],
  [[def:phi]], [[def:fib-F]], [[def:fib-mult]], [[def:coassoc]],
  [[def:PF]], [[def:ising]], [[def:ising-F]], [[def:isingcft]],
  [[def:primary]] (Fibonacci weights), [[def:RG-amp]] (NoMixing
  framework), [[def:polar-repair]] (Mathlib gap — `B^{-1/2}` is
  assumed given as input).
- **Julia migration (Phase 8):** [[def:partition]] (←`LabelledConfig`),
  [[def:refmap]] (←`normalized_product_isometry`), [[def:TL-cat]]
  (←`interaction_hamiltonian` Σ P_j), [[def:fsymbol]] (←`FSymbolCache`,
  involutory gauge), [[def:fib-F]] / [[def:ising-F]],
  [[def:splitbasis]] (LB-1 caveat in `enumerate_fusion_trees`).
- **Triple-check scripts (Phase 7 / Phase 9):** task-specific; choose
  per Lean module mirrored.
- **Literature work (Phase 2 / Phase 3):** [[conv:acro]] for the
  `\unchecked` FRS flag context; consult `CITATION_INDEX.md` for the
  per-`\unchecked` discharge status; literature DB schema in
  `literature/db/papers.sqlite`.

Per Law 1 (CLAUDE.md): every term you actually use in new content
must already be in GLOSSARY — the above lists are starting-points, not
exhaustive permissions.

## Validation gates for new content

Five gates (M / D / C / R / I) defined in `stocktake/MIGRATION_PLAN.md` §0.3.

- **M** mechanical (build/test/parse passes) — every step
- **D** definitional (matches GLOSSARY) — any mathematical addition
- **C** cross-reference (≥2 independent sources agree) — any newly canonical claim
- **R** reviewer subagent (independent of the author; required for substantive additions = any commit adding mathematical content, code, conventions, GLOSSARY entries, ERRATA entries, new sections, or substantive prose; see CLAUDE.md Rule 4 for tier-based effort budgets and the mechanical-exemption list)
- **I** idempotent — any file move or hash-tracked import

**Concrete examples from Phase 1** (see `MIGRATION_LOG.md` for the full
per-step record):

- **R-gate audit** (definitional bedrock): the P1.9 audit at
  `stocktake/reports/opus-glossary-audit.md` is the canonical example.
  A hostile Opus 4.7 subagent read GLOSSARY + CONVENTIONS end-to-end
  and produced a verdict (APPROVE FOR PHASE 2 with 8 MINOR/NIT findings,
  5 MINOR applied in the same commit per the review→fix→atomic-commit
  pattern of CLAUDE.md Rule 4).
- **D-gate** (byte-verbatim canonical bodies): every §A GLOSSARY entry
  has its `**Canonical:**` LaTeX block matched against the cited
  `summary.tex:<line>`. P1.7/P1.8/P1.9 reviewers each independently
  verified 48/48 PASS. The replay logic is reproducible: walk each
  `## def:` / `## conv:` header in §A, parse its `**Canonical:**` LaTeX
  block, compare against `summary.tex:<source-line>` from the entry's
  `**Source:**` field.
- **C-gate** (≥2 source agreement): the `lem:binary-Z` ERRATA entry
  (P1.2) cites three independent reviewers concurring (R1 Issue 1,
  R2 Issue 11, R3 Issue 17); the bridge report `opus-hilbert-bridge.md`
  (P1.4-early) cross-references `summary.tex` § 2, MMA's `finegraining.tex`
  + `hilbert.jl`, and CAD's `ProjectDefinitions.lean` per Translation
  rule.
- **R-gate per content step**: every substantive P-step (P1.1 / P1.2 /
  P1.3 / P1.5 / P1.6 / P1.7 / P1.8) carried an Opus 4.7 reviewer
  subagent verdict; reports at `stocktake/reports/opus-*-review.md`.

## Commit discipline

One atomic step per commit; provenance footer in every commit message
per the template in `CLAUDE.md` (`Source:`, `Validation passed:`,
`Review:`, `Rollback:`). Never bundle. Never edit history of canonical
files outside an ERRATA entry. **Red-green TDD by default; port-and-verify
for migration of proven content** (port = copy faithfully; verify =
mutation-prove the tests catch regressions). See CLAUDE.md Rule 5.

## Pre-read warnings (hallucination-risk callouts)

Before touching imported content, internalise CLAUDE.md's Hallucination-risk
callouts. Specifically: **vacuum-index convention** is the historical
STL-1 bug across MMA archive/v0 (locked at [P1.6(a)]); the **F-matrix
gauge** is involutory in `TensorCategories.jl` and unitary in
`summary.tex` (translation rule at [P1.6(b)]); **"coassociativity"** is
overloaded (scalar version proved in CAD Lean vs categorical
`(η⊗id)η = (id⊗η)η` unproven anywhere — see [[def:coassoc]] Notes);
**"dagger-special" ≠ "Frobenius-special"** (an earlier `summary.tex`
draft confused them; do not regress — see [[def:algobj]] Notes); the
**three Hilbert-space framings** are reconciled per `opus-hilbert-bridge.md`
and the four entries [[def:HP]] / [[def:Hlatt]] / [[def:indlim]] /
[[def:mobile-Fock]] (P1.5); `archive/chats/` is deep storage — do not
read; the **Lean 0-sorry / 0-axiom invariant** is load-bearing.

The P1.9 audit verified that **all 8 CLAUDE.md hallucination-risk
callouts** fire where expected in GLOSSARY / CONVENTIONS — see
`stocktake/reports/opus-glossary-audit.md` Priority 5 for the
callout-by-callout firing-site index.

## Stop conditions

Stop and ask when any condition in `CLAUDE.md` §Stop-conditions applies.
The most common: a GLOSSARY conflict has no obvious right answer; a
local source disagrees with a `summary.tex` claim; a build fails after
an import; you would need `sorry` or `axiom`; `MIGRATION_PLAN.md` says
"STOP and ask user"; an `\unchecked` discharge has no local source.
See CLAUDE.md for the full list (including: Mathlib version pin must
drift, two reviewers disagree, bd sync conflict, review subagent gives
non-actionable verdict).

## Project history

Built mid-2026 by consolidating three prior projects:
`microscopic-mobile-anyons/` (Julia + literature),
`cft-anyons-deprecated/` (Lean + af adversarial-proof workspace), and
the chat-transcript-driven `summary.tex` work. See `stocktake/README.md`
for the full inheritance picture and `stocktake/MIGRATION_PLAN.md` for
the consolidation plan.

## Known limitations

- Categorical coassociativity not formalised anywhere; scalar version
  proved in CAD Lean and to be migrated in Phase 5. See [[def:coassoc]]
  Notes for the scalar-vs-categorical disambiguation (CLAUDE.md
  hallucination-risk callout #3).
- Koo–Saleur lattice-Virasoro convergence stated as conjecture; not
  formalised. The body of [[def:KS-Ln]] preserves the verbatim
  `\unchecked` token from `summary.tex` per `CITATION_INDEX.md`.
- No local PDF for FRS, Pasquier, Huse, Koo–Saleur 1994 original,
  (G₂)₁ — see `RESEARCH_NOTES.md` acquisition queue.
- Three Hilbert-space framings: translation map locked at P1.5
  (`40c0a22`); see [[def:HP]], [[def:Hlatt]], [[def:indlim]],
  [[def:mobile-Fock]] and `stocktake/reports/opus-hilbert-bridge.md`.
- LB-1 (latent): MMA `enumerate_fusion_trees` undercounts the basis
  for fusion categories with `dim Hom(a⊗b, c) > 1` — bd issue
  `cft-anyons-q6h`. Latent for present scope (all three currently-used
  categories are multiplicity-free); blocks any future extension to
  e.g. extended Haagerup. See [[def:splitbasis]] Notes.
- LB-2/LB-3/LB-4 (Phase-2/8-gated): follow-ups filed during Phase 1
  review — `cft-anyons-2ae` (add MMA test for dense Ising c=1/2),
  `cft-anyons-pvu` (audit GLOSSARY for fabricated TensorCategories
  API names), `cft-anyons-d7w` (re-validate
  `archive/mma-archive-v0-snapshot/` cited paths post-import).
- Continuum CFT spectrum / full identification of continuum QFT: open
  science question.
- See `CITATION_INDEX.md` for `\unchecked` flag status.

## Escalation

When stuck: open a bd issue (see CLAUDE.md §Beads); attach the step you
were on, what failed, the specific reproducible command, and the
relevant `GLOSSARY`/`CONVENTIONS`/`PROVENANCE` entries. Two-reviewer
disagreement → user adjudicates. For deferred research questions,
append to `RESEARCH_NOTES.md`.

## Milestones

- `v1.0-consolidated` after the canonical repo passes MIGRATION_PLAN
  Phase 11 (final consistency sweep).
- Subsequent versions track extension work beyond inherited content.
