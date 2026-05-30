# AGENTS.md — cft-anyons

Guidance for AI agents (Claude Code, SDK harnesses, downstream tools) working on
this repository. **Read this top to bottom at the start of every session, and
again after any context compression.** The rules drift out of working memory
faster than you think; that is why they are numbered. Many different agents work
here — this file plus the worklog (§ Worklog) are how we stay coherent across
all of them.

`AGENTS.md` and `CLAUDE.md` are a pair: `CLAUDE.md` is a thin pointer here, this
file is authoritative.

> **Status: bootstrapping.** This is a fresh start. The previous project was
> archived (`archive/legacy-consolidation/`); only the papers under
> `references/` and `literature/` carry over as ground truth. The lab-book
> scaffold described below (`report.tex`, `report/sections/`, the shard guard,
> `Project.toml`) does **not exist yet** — building it is the first work item.
> Until it exists, the §Layout entries are a *target*, and an agent may create
> scaffolding (this file, `CONVENTIONS.md`, the report skeleton, the guard
> script) without a pre-existing source. Do not add substantive *mathematical*
> content until the source, convention, and reproducibility paths exist.

---

## What this is — the north star

A reproducible research lab book pursuing one concrete goal:

> **Given** a (unitary) fusion or modular tensor category, together with whatever
> additional data is needed (OPE coefficients / conformal data), **construct a
> family of microscopic (lattice) models and their symmetry generators whose
> continuum limit provably yields a mathematically rigorous QFT/CFT that (i)
> realises the input category data and (ii) carries a full projective unitary
> representation of the symmetries.**

In one line: a constructive, *provable* pipeline from categorical data →
microscopic models (+ lattice symmetry generators) → a rigorous continuum (C)FT
realising that data with full projective-unitary symmetry. The working belief is
that this is achievable at least for **rational CFTs**, and perhaps for all QFTs.

The two non-negotiable success criteria are **provability** of the continuum
limit (rigorous, not heuristic) and **fidelity** — the realised continuum content
must faithfully reproduce the input category data, and the symmetry representation
must be full and projective-unitary.

The pieces this touches: microscopic models from category data (anyon chains,
string-nets), lattice symmetry generators (Koo–Saleur lattice Virasoro and kin),
operator-algebraic renormalisation / wavelet continuum limits (Osborne–
Stottmeister lineage), and rigorous-CFT targets (conformal nets / vertex operator
algebras / Wightman).

This is a **programme, not a settled theory** — a goal we believe reachable, not
a result in hand. Write every step toward it as a question, proposal, or
hypothesis until a local source, a local derivation, or a reproducible run
supports it. The specific sub-question in flight is recorded in the worklog, not
fixed here.

The central failure mode to avoid is a plausible mathematical, physical, or
numerical claim with **no traceable source, derivation, convention, or checked
invariant** in the lab book's evidence chain.

## Entry point — read order

Before adding mathematical content, numerical claims, scripts, or figures, read:

1. `AGENTS.md` (this file)
2. `README.md`
3. `CONVENTIONS.md`
4. `report/README.md` and `report/SHARD_CATALOG.md` (the shard map)
5. `report.tex` and the relevant shard under `report/sections/`
6. The latest chunk under `worklog/` (current state + open threads)
7. The relevant local source manifest under `references/**/SOURCES.md`

---

## The Three Laws

Unconditional. If a fast path conflicts with any law, follow the law.

**Law 1 — Ground truth before claims.** No definition, theorem, physical
dictionary, normalization, F/R-symbol value, spectrum, diagnostic, literature
summary, or report statement is allowed from memory. It must cite a local
source (path + line / equation / theorem), a checked local derivation, a test,
or a reproducible run artifact. If the source is not local yet, acquire and
register it first (§Sources), or record the gap and stop.

**Law 2 — Conventions before derivations.** Every notational, sign, grading,
gauge, indexing, normalization, tolerance, or modelling choice goes in
`CONVENTIONS.md` *before* you rely on it. This subject is convention-dense
(§Convention-sensitivity); silent convention drift is the dominant source of
wrong-but-plausible results.

**Law 3 — Reproducibility is part of the result.** The lab book, scripts,
tests, source manifests, and run bundles are one research record. A numerical
claim must be backed by an invariant, a known value, a source citation, or
independently checkable script output. A script that produces data must have a
command line, a run bundle, and a one-line headline finding recorded.

---

## The Rules

Numbered, non-negotiable. Re-read after compaction.

0. **The Laws apply always.** A correct-looking formula, spectrum, matrix, or
   analogy without provenance is not finished work.

1. **Fail fast, fail loud.** Assertions, not silent returns; a loud `error()`
   with context, not a quiet `nothing`. A claim that does not match its citation
   should crash the check / fail the test, not be silently emitted.

2. **All bugs are deep.** No bandaids, no "temporary fixes." Investigate root
   causes. A fix that passes one check but breaks an invariant elsewhere is not
   a fix. In this subject, suspect a **convention bug first** (§Rule 3 below).

3. **Most scientific bugs are convention bugs until proved otherwise.** For a
   mismatch, first check: F/R-symbol gauge, vacuum/unit-object index, fusion-
   tree bracketing and label order, quantum-dimension normalization, Virasoro /
   OPE / central-charge conventions, Hamiltonian sign, lattice orientation, and
   boundary conditions.

4. **Skepticism.** Verify subagent output, previous-session claims, generated
   data, OCR/extraction, and your own memory against the *current* repo.
   `git log`, `Read`, and a re-run are authoritative; conversation context and
   frozen worklog shards are not.

5. **Cite local, cite precisely.** Format in LaTeX / code:
   ```
   % Source: references/text/Trebst.txt:304
   %   "F^{ttt}_t = [[φ⁻¹, φ^{-1/2}], [φ^{-1/2}, -φ⁻¹]]"
   ```
   Report claims point to the producing script and run artifact. If the citation
   is not in `references/` or `literature/`, **stop and ask** — do not paraphrase
   from memory.

6. **Red-green TDD (default) / port-and-verify (porting).** New claim, function,
   or check: write the failing check first (a Julia `@test`, a Wolfram
   assertion, a symbolic identity), watch it fail, then make it pass. Porting a
   result from a paper: port faithfully, capture the invariant as a test, then
   **mutation-prove** it (perturb the impl → confirm RED → restore), and
   cross-validate against an independent oracle when one exists. The discipline
   is "a test has caught a real regression," not "the test was written first."

7. **"Runs without errors" is never a passing test.** Every test asserts a known
   value or an invariant: Euler-factor / functional-equation identities, fusion-
   rule consistency, F-symbol pentagon / unitarity, quantum-dimension relations,
   commutation relations, projector idempotence, spectrum agreement with a cited
   example. A test that asserts only "didn't throw" is broken.

8. **Get feedback fast.** Run the relevant build/check every ~50 lines, not every
   500. `latexmk` should still build; the touched Julia check should still pass.
   Don't write blind then check once at the end.

9. **Work in shards (§Shards).** One self-contained ~200-line report shard per
   idea, with a header so it is findable by grep. Keep source files (LaTeX and
   Julia) near 200 lines; split when they grow past it.

10. **Maintain the worklog (§Worklog).** It is the project's institutional
    memory and replaces any task tracker. Record what you did, *why*, the
    gotchas, the dead ends, and the open threads — anything a future agent would
    wish it knew that is not derivable from the diff.

11. **Docs move with content.** A new term/convention → `CONVENTIONS.md`. A new
    shard → `report.tex` include + `report/SHARD_CATALOG.md` + `report/README.md`
    (the guard enforces this). A new script/run → its run bundle + `INDEX.md`. A
    new source → its `SOURCES.md`. Stale docs are incomplete work.

12. **Effort scales to change size; review is opt-in, not ceremony.**
    - *Trivial* (≤5 LOC; typo / comment / formatting): direct edit.
    - *Small* (one shard / one function; uses defined conventions): direct edit;
      one research subagent if the surface area is unfamiliar.
    - *Core* (new mathematical claim; new convention; cross-shard restructure):
      for a genuinely **contested** design choice, spawn 2–3 independent research
      subagents before committing, and/or one hostile reviewer (the 3+1 pattern
      from Bennett.jl). This is a tool to reach for when the stakes are real —
      **not** a mandatory gate on every commit. Use judgement; default to
      shipping with a check and a worklog note.

13. **No GitHub CI, no remote automation.** Quality gates run locally
    (`latexmk`, the shard guard, `Pkg.test()`, `wolframscript`). Do not create
    `.github/workflows/`, do not propose "add CI." Failure-email noise is worse
    than zero signal — a user-level decision across all these projects.

14. **No resurrecting the archived ceremony.** No beads, no `bd`, no five-gate
    (M/D/C/R/I) validation, no mandatory per-commit reviewer-gating, no GLOSSARY
    hard-gate, no 8000-line migration log. That apparatus was deliberately
    removed. If you find yourself building process instead of content, stop.

15. **Repeat rules.** Re-read this file at session start, after `/clear`, after
    any compaction. The agent that re-reads catches drift; the one that doesn't
    ships it.

---

## Shards — the lab book

The compiled lab book is rooted at `report.tex`, which holds **only** the
preamble and the `\include` order. All body prose lives in
`report/sections/NN_slug.tex`. Each shard is a self-contained unit, **target
~200 lines, hard cap 280**, opening with a comment header:

```latex
% SHARD-ID: CA-07-FIBONACCI-F-SYMBOL
% SHARD-TITLE: The Fibonacci F-symbol and its unitary gauge
% SHARD-SUMMARY: <1–3 lines, mirrored verbatim in SHARD_CATALOG.md>
% SHARD-KEYWORDS: Fibonacci, F-symbol, pentagon, unitary gauge
```

The same metadata is mirrored in `report/SHARD_CATALOG.md` (the searchable map)
and `report/README.md` (the include-order table). **This is the mechanism that
makes work smooth:** an agent greps the catalog by keyword, gets a stable ID,
reads one ~200-line file, and writes a new shard that cites prior shards by ID.

A content shard should open with a short **"Sources and dependencies"** block
naming the exact `references/...:line` anchors and the prior shard IDs it builds
on, so its evidence chain is visible at the top.

`make check-report-shards` (the guard, to be built at bootstrap) deterministically
enforces structure — every shard included once, ≤280 lines, valid ID matching
its filename, header present, mirrored in catalog + README. **The guard is the
gate, not a human reviewer.** Run it and `make report` before treating report
edits as done.

## Worklog — institutional memory

`worklog/` is a sharded, chronological log: `NNN_YYYY-MM-DD_slug.md`, ~200–280
lines each, highest `NNN` is most recent; prepend new entries to the top chunk
and start a new chunk when it passes ~280 lines. `worklog/README.md` is a thin
index. This is the project's memory across sessions and across agents — with no
beads, it is also the de-facto handoff (the latest entry = current state).

Add an entry when you complete a discrete piece of work. Structure each:
**Context → What changed → Why these choices → Frictions / dead ends →
Acceptance (what check passed) → Pointers (shard IDs, files, sources).** Be
honest about frictions and dead ends — those are the load-bearing parts a future
agent cannot reconstruct from the diff.

Cross-session insight that is *not* repo-specific (a user preference, a recurring
gotcha) goes to agent memory under
`~/.claude/projects/-home-tobiasosborne-Projects-cft-anyons/memory/` and its
`MEMORY.md` index — not into the worklog.

## Sources and provenance

The papers are the kept ground truth (see `README.md`):
- `references/` — curated, hand-named source PDFs + text extractions +
  `references/manifest/` provenance.
- `literature/` — `references.bib`, ~330 markdown extractions under
  `literature/md/`, the `papers.sqlite` seed/schema under `literature/db/`, and
  `SURVEY.md` / `SYNTHESIS.md`.
- `literature/_imported/` — a **local-only, git-ignored** raw-PDF hedge from
  sibling projects. Reacquirable from arXiv; never committed.

**Acquiring a new source (Law 1):** store it under `references/<topic>/`, record
it in that topic's `SOURCES.md` (bibliographic data, DOI/arXiv/URL, retrieval
date, SHA256). Prefer arXiv e-print source over PDF extraction; prefer arXiv /
publisher / institutional access. Tobias has TIB VPN access at LUH for paywalled
papers — ask him to connect rather than using pirate sources. Keep fetched
source files append-only.

## Convention-sensitivity — hallucination-risk callouts

This subject is dense with conventions that look interchangeable and are not.
When you catch yourself about to assume one, stop and record the choice in
`CONVENTIONS.md`. Known traps:

- **F/R-symbol gauge.** Unitary vs involutory gauge differ; importing matrix
  entries across gauges produces silently-wrong inner products. (TensorCategories.jl
  uses an involutory gauge.)
- **Vacuum / unit-object index.** 0-indexed vs 1-indexed enumerations of `Irr(C)`
  — fix it once and cite it.
- **Fusion-tree bracketing and label order.** Left- vs right-associated trees
  relate by an F-move; entries are stated in one convention.
- **CFT normalizations.** Central charge, Virasoro mode conventions, OPE
  coefficient normalization, chiral vs full — record before use.
- **Lattice conventions.** Hamiltonian sign, orientation, boundary type,
  star/plaquette naming.

The archived `archive/legacy-consolidation/CONVENTIONS.md` worked many of these
out in detail — useful as **reference prior art**, but it is dead and not
canonical here; re-derive and re-cite anything you adopt.

## Build & test

These are the intended local gates once the bootstrap scaffold exists:

```bash
make report                # latexmk -pdf report.tex
make check-report-shards   # the deterministic shard-structure guard
julia --project=. -e 'using Pkg; Pkg.test()'   # Julia invariant checks
# wolframscript -file scripts/wolfram/<name>.wls   # optional symbolic cross-checks
```

The root `report.pdf` is the main distributable artifact: rebuild it after
report-source changes and commit it alongside the sources. Keep LaTeX temp files
git-ignored.

## Session close — landing the plane

Work is not complete until `git push` succeeds.

1. Run the relevant gates (`make report` / `make check-report-shards` /
   `Pkg.test()`) for what you touched.
2. Add or extend a `worklog/` entry: what landed, what's open, why.
3. Update `CONVENTIONS.md` / `SHARD_CATALOG.md` / `INDEX.md` / `SOURCES.md` as
   the change requires (Rule 11).
4. `git pull --rebase` → commit (clear message + provenance in the body) →
   `git push` → `git status` shows up to date.

Never stop before pushing; never say "ready to push when you are" — you push.

## Layout (target)

```
README.md                 # public-facing intro (papers are the kept asset)
AGENTS.md / CLAUDE.md      # this file + a thin pointer
CONVENTIONS.md             # notation, gauge, indexing, normalization choices
INDEX.md                   # script / run / output manifest

report.tex                 # sharded lab-book master (preamble + \include order only)
report/sections/*.tex      # ~200-line body shards
report/README.md           # include-order map
report/SHARD_CATALOG.md    # searchable shard catalogue (stable IDs + keywords)

worklog/                   # sharded institutional memory (NNN_YYYY-MM-DD_slug.md)

references/                # curated source PDFs + extractions + manifest  [GROUND TRUTH]
literature/                # bib + md extractions + sqlite seed + survey   [GROUND TRUTH]
literature/_imported/      # local-only raw-PDF hedge (git-ignored)

src/ , test/               # Julia package: reproducible checks (Pkg.test)
scripts/{julia,wolfram}/   # check + producer scripts
runs/<YYYY-MM-DD-slug>/    # generated data/figures, grouped per run
Makefile                   # local gates: report, check-report-shards, test

archive/legacy-consolidation/   # the dead previous project — reference only, never canonical
```

## Tool of last resort

If the Laws conflict with a fast path, choose the Laws. "Just ship and fix the
provenance later" is not a working mode here. But the *opposite* failure —
piling on process until nothing ships — is exactly what was archived. The target
is the AQM balance: light, provenanced, accretive, fast. When in doubt, re-read
this file and `README.md`, then ask Tobias.
