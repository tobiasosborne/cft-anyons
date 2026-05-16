# PRD — cft-anyons (consolidated)

<!--
ROLE: Entry-point document. First thing any new agent reads. Defines mission,
      scope, canonical artifacts, read order, validation methodology, stop
      conditions, known limitations, pre-read warnings.
UPDATE POLICY: Three planned refreshes — v0 (P0.8, this), v1 (P1.11 after
      GLOSSARY + CONVENTIONS exist), final (P11.4). Out-of-schedule
      substantive edits require hostile-review-gated commits per CLAUDE.md
      Rule 4.
TRIGGER: Any change to mission, scope, canonical-artifacts list, read order,
      methodology, pre-read warnings, or known limitations.
-->

**Version: v0 (drafted P0.8, hostile-reviewed P0.9, 2026-05-16). Status:
scaffold; Phase 0 of MIGRATION_PLAN.md in progress.**

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
`H_N^W`) — see the translation map (to be built at MIGRATION_PLAN P1.4)
in GLOSSARY. The repo consolidates three prior projects whose combined
value was significant but whose definitions had drifted silently. The
dominant work-mode here is **accretive consolidation**: add knowledge
in small, validated, atomic steps; harmonise on the way.

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

**Phase-0 exception (lifts at P1.10):** while GLOSSARY is empty,
adding GLOSSARY entries IS the permitted form of mathematical-content
addition, subject to per-entry validation per MIGRATION_PLAN P1.1.

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

**Status (Phase 0):** most artifacts below are scaffolded stubs (see
`MIGRATION_LOG.md` for population status). **"GLOSSARY entry absent"
means STOP and ask, not "free to invent."**

- **`summary.tex`** — guiding conceptual mathematical statement. Edits ONLY via `ERRATA.md`-tracked atomic commits.
- **`GLOSSARY.md`** — every term used in canonical material is defined here.
- **`CONVENTIONS.md`** — vacuum index, F-matrix gauge, dagger, indexing.
- **`ERRATA.md`** — append-only log of corrections to `summary.tex`.
- **`RESEARCH_NOTES.md`** — open questions, deferred decisions, acquisition queue.
- **`MIGRATION_LOG.md`** — per-step commit log of the consolidation.
- **`PROVENANCE.md`** — every imported file with source path + SHA256 at import.
- **`CITATION_INDEX.md`** — every `summary.tex` citation → discharge status.
- **`Formalisation/`** — Lean 4. Invariants (post-Phase 5): `lake build` passes; zero `sorry`; zero `axiom`.
- **`src/MobileAnyons/`** — Julia computational backend. Invariant (post-Phase 8): `Pkg.test()` passes.
- **`scripts/{julia,wolfram}/`** — independent triple-check scripts, one per Lean module.
- **`references/`** — local PDFs with SHA256-verified extractions; `references/manifest/SOURCES.md` is the index.
- **`literature/`** — bibliography DB (630 papers, SQLite-backed).
- **`reviews/`** — hostile audits of canonical content.

## Validation gates for new content

Five gates (M / D / C / R / I) defined in `stocktake/MIGRATION_PLAN.md` §0.3.

- **M** mechanical (build/test/parse passes) — every step
- **D** definitional (matches GLOSSARY) — any mathematical addition
- **C** cross-reference (≥2 independent sources agree) — any newly canonical claim
- **R** reviewer subagent (independent of the author; required for substantive additions = any commit adding mathematical content, code, conventions, GLOSSARY entries, ERRATA entries, new sections, or substantive prose; see CLAUDE.md Rule 4 for tier-based effort budgets and the mechanical-exemption list)
- **I** idempotent — any file move or hash-tracked import

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
STL-1 bug across MMA archive/v0; the **F-matrix gauge** is involutory
in `TensorCategories.jl` and unitary in `summary.tex` (translation
required); **"coassociativity"** is overloaded (scalar version proved in
CAD Lean vs categorical `(η⊗id)η = (id⊗η)η` unproven anywhere);
**"dagger-special" ≠ "Frobenius-special"** (an earlier `summary.tex`
draft confused them; do not regress); the **three Hilbert-space framings**
require an explicit translation map (P1.4); `archive/chats/` is deep
storage — do not read; the **Lean 0-sorry / 0-axiom invariant** is
load-bearing.

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
  proved in CAD Lean and to be migrated in Phase 5.
- Koo–Saleur lattice-Virasoro convergence stated as conjecture; not formalised.
- No local PDF for FRS, Pasquier, Huse, Koo–Saleur 1994 original,
  (G₂)₁ — see `RESEARCH_NOTES.md` acquisition queue.
- Three Hilbert-space framings: translation map to be built at P1.4
  (currently absent).
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
