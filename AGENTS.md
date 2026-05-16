# CLAUDE.md / AGENTS.md — cft-anyons (consolidated)

> This file is **identical to `AGENTS.md`**. Edit both in the same commit;
> never let them drift.

If you are an agent (Claude Code, an SDK harness, a downstream tool)
landing in this repo, read this **top to bottom every session**. After a
context compression, re-read. The rules drift out of working memory
faster than you think; that's why they're numbered.

---

## Entry point

**First, read [`PRD.md`](PRD.md).** PRD tells you *what* this project is
and *what* you can and can't change. This file tells you *how* to work
once you know that.

Read order for any task:
1. `PRD.md`
2. `GLOSSARY.md`
3. `CONVENTIONS.md`
4. The relevant section of `summary.tex` (the canonical mathematical narrative)
5. `MIGRATION_PLAN.md` *only* if you are doing consolidation work
6. `stocktake/README.md` *only* if you need the inheritance picture from
   the three source projects

If you have not read 1–3, you must refuse to add mathematical content.

---

## The Two Laws

Two laws. They are unconditional. If a "fast path" conflicts with either,
choose the law.

**Law 1 — Definitional integrity before content.** Every term you use
must already be in `GLOSSARY.md`. Every convention you follow must
already be in `CONVENTIONS.md`. Adding mathematical content that uses
a term not yet in GLOSSARY is forbidden — either add the GLOSSARY entry
in the same atomic step (with full justification) or refuse the task.

The dominant risk in this consolidation is **silent definitional drift**:
importing a definition that subtly disagrees with the canonical one,
poisoning downstream work. The GLOSSARY is the guard-rail. Updating
it is *more* important than the content that prompted the update.

Concrete examples of drift to watch for: vacuum-index 0 vs 1; F-matrix
unitary vs involutory gauge; "coassociativity" used at scalar vs
categorical level; "dagger-special" confused with "Frobenius-special";
the three Hilbert-space framings (partition `H_P^W`, mobile-Fock,
N-tensor `H_N^W`) — all already documented in CONVENTIONS / GLOSSARY,
all already historically the cause of bugs.

**Law 2 — Atomic, validated, accretive.** Every change is one atomic
commit. Every commit passes its declared validation gates (M / D / C /
R / I — see `MIGRATION_PLAN.md` §0.3 for definitions). No bundled
commits. No "fix the docs in a follow-up." No content shipped without
provenance (source path, source hash, validation passed).

The user's directive: *"I do not want to add anything without
rewriting, harmonising and deduping on the way."* Harmonisation is part
of the atomic step, not a separate "consolidation pass." If you cannot
harmonise inside the step, the step is too big — split it.

---

## The Rules

Numbered, non-negotiable. Re-read after compaction.

0. **Laws 1 and 2 apply.** Always.

1. **Fail fast, fail loud.** Assertions, not silent returns. Loud
   errors with context, not quiet `nothing`. A mathematical claim
   that doesn't match its citation should crash the build / fail
   the test / abort the commit, not be silently emitted.

2. **All bugs are deep.** No bandaids, no "temporary fixes." The
   `lem:binary-Z` squared-amplitudes bug survived through 4 chat
   transcripts and a published-to-PDF document because every reader
   patched their understanding instead of patching the source.
   Investigate root causes. A "fix" that passes one check but breaks
   an invariant elsewhere is not a fix.

3. **Skepticism.** Verify subagent output, previous-session claims,
   reviewer assertions, and your own memory against the current state
   of the repo. `summary.tex` is canonical; chat transcripts are
   archived for a reason; conversation context is not authoritative.

4. **Tiered workflow + reviewer-gating.**

   **Reviewer-gating policy (load-bearing).** Every **substantive
   addition** is gated by a review subagent. "Substantive" means: any
   commit that adds mathematical content, code, new conventions, new
   GLOSSARY entries, new ERRATA entries, new sections, or substantive
   prose. The reviewer MUST be a different agent than the author
   (Opus by default; Sonnet acceptable for narrow checks). The
   reviewer's verdict goes into the commit message under a `Review:`
   line. **Pure mechanical operations** (file moves, directory
   creation, `.gitkeep` stubs, applying user-verbatim-specified
   changes, build-artifact cleanup) are exempt — note the exemption
   explicitly in the commit message (`Review: mechanical, exempt`).

   **Effort tiers:**
   - **Trivial** (≤5 LOC; typo / comment / formatting; non-content):
     direct edit, no research subagent; reviewer-gating exempt if the
     change carries no semantic content. Validation: M + I.
   - **Small** (≤30 LOC; one file; uses only GLOSSARY-defined terms):
     direct edit; one research subagent if the surface area is
     unfamiliar; **one review subagent before commit**. Validation:
     M + D + R.
   - **Core** (cross-file; new GLOSSARY entry; new mathematical claim;
     new convention; migration step from `MIGRATION_PLAN.md`): bd
     issue first; for contested design choices spawn 2–3 research
     subagents independently before implementing (the 3+1 pattern
     from Bennett.jl / scientist-workbench); **hostile review
     subagent always**. Validation: M + D + C + R.

5. **Red-green TDD (default) and port-and-verify (migration mode).**

   **Default — Red-green TDD.** For any new mathematical claim, new
   lemma, new function, or new test: classic RED → GREEN → refactor.
   Write the test first. Watch it fail (red). Write the minimum
   content to make it pass (green). Then refactor with the test as
   the guard. Across modalities:
   - **LaTeX / mathematical claims:** write the script or check
     that would fail if the claim is wrong (a `wolframscript`
     symbolic check, a Julia numeric assertion, a Lean `example` /
     `#check`), commit it red, then write the claim, then verify the
     check now passes.
   - **Lean lemmas:** write a test (`example`, `#check`, or a calling
     theorem) before the proof body.
   - **Julia code:** write the failing `@test` before the
     implementation.
   - **Wolfram scripts:** write the assertion that should fail, run
     it red, then implement.

   **Migration mode — port-and-verify.** For porting proven content
   (CAD Lean files, MMA Julia modules, MMA tex sections,
   `references/` PDFs and their extractions): port the algorithm /
   proof / text faithfully, capture invariants in tests,
   **mutation-prove** the tests catch regressions (perturb the impl,
   confirm RED, restore), and cross-validate against an independent
   oracle when one exists (e.g., the matching Wolfram script for a
   Julia check).

   **Hard rule.** "Runs without errors" is never a passing test.
   Every test asserts an invariant against a known-correct expected
   value (or, for proofs, asserts that the proof closes the goal).
   A test that only asserts "didn't throw" is broken.

6. **Get feedback fast.** Run the relevant build/test after every
   non-trivial change. Per modality:
   - LaTeX: `pdflatex summary.tex` should still build.
   - Lean: `lake build` should still pass (zero `sorry`, zero `axiom`).
   - Julia: `julia --project=. -e 'using Pkg; Pkg.test()'` for the
     touched module; full `Pkg.test()` before any commit that touches `src/`.
   - Wolfram: `wolframscript -file scripts/wolfram/<name>.wls`.
   Don't code blind for 500 lines then check. Check every ~50 LOC.

7. **Ground truth before code (and before content).** Every
   mathematical claim cites a local source — file path **and** line
   number (or AF node ID, or Lean lemma name). Format:
   ```latex
   % Source: references/text/FibonacciAnyonModels.txt:304
   %   "The F-matrix entries are ..."
   ```
   If the citation isn't in `references/` or `literature/`, **stop and
   ask** — do not paraphrase from memory. The acquisition queue lives
   in `RESEARCH_NOTES.md`.

8. **Docs in lockstep with content.** A migration step that adds a
   Lean file must update `PROVENANCE.md`, add `-- GLOSSARY: <term>`
   pointers in the file's docstring, and (if new public surface)
   touch the README. A `\unchecked` discharge updates `ERRATA.md`
   in the same commit. Stale docs are incomplete work.

9. **No GitHub CI, no automated remote runs.** Quality gates run
   locally: `lake build`, `Pkg.test()`, `pdflatex`, `wolframscript`,
   `bd`. The user has explicitly rejected automated CI across all
   their projects (Bennett.jl, Feynfeld.jl, scientist-workbench);
   failure-email noise is worse than zero signal. Do NOT create
   `.github/workflows/`, do NOT propose "add CI" beads.

10. **Repeat rules.** Re-read this file at session start, after
    `/clear`, after any context compression. The agent that re-reads
    catches drift; the agent that doesn't ships it.

11. **GLOSSARY conformance overrides everything else.** If a step
    would compile / pass tests / build cleanly **but** introduces a
    term that GLOSSARY does not define, the step is not done. Either
    the term enters GLOSSARY with full justification (and a
    cross-reference to every source that uses a non-canonical
    variant), or the term is replaced with a GLOSSARY-defined
    equivalent. This rule is the load-bearing one for this project
    specifically.

---

## Hallucination-risk callouts

Pre-emptive warnings about specific mistakes that look right but
aren't. When you catch yourself about to do one, stop and re-check
the relevant `CONVENTIONS.md` / `GLOSSARY.md` entry.

- **Vacuum-index convention.** MMA archive/v0 had vacuum at *both*
  index 0 (`hilbert_space.md:39`) and index 1 (`config.jl:12`).
  Three-way conflict was the STL-1 bug. Look up the canonical choice
  in `CONVENTIONS.md` — never assume.

- **F-matrix gauge.** TensorCategories.jl uses an **involutory** gauge
  (`F² = I`, `F† ≠ F⁻¹`). `summary.tex` implicitly assumes **unitary**.
  Importing Julia matrix elements without the documented translation
  rule (`CONVENTIONS.md`) produces silently-wrong inner products.

- **"Coassociativity" is overloaded.** CAD Lean `Fibonacci/Coassoc.lean`
  proves *scalar* coassociativity (the F-symbol fixed-point equation
  for the algebra parameters). `summary.tex` §5 sometimes uses the
  same word for the *categorical* equation `(η⊗id)η = (id⊗η)η`, which
  is **not** proved anywhere in this repo. GLOSSARY distinguishes the
  two. Never conflate.

- **"Dagger-special" ≠ "Frobenius-special".** An earlier `summary.tex`
  draft asserted these were equivalent. They are not — Frobenius-special
  additionally requires the Frobenius identity. The in-doc warning at
  `summary.tex` `warn:not-Frobenius` documents the fix. Don't backslide.

- **Hilbert-space framings.** Three formulations of the "same" Hilbert
  space exist across the source projects (`H_P^W`, mobile-Fock,
  `H_N^W`). GLOSSARY has the translation map. Refusing to use the map
  and importing one framing's lemmas into another framing's notation
  is the fastest way to introduce contradictions.

- **`\unchecked` flags.** Roughly half of `summary.tex`'s external
  citations are discharged in `references/` (Feiguin, Trebst, Penneys,
  KZ, Osborne–Stottmeister × 2, Hollands, Garjani–Ardonne, Poilblanc,
  string-net papers). The other half (FRS, Pasquier, Huse, Koo–Saleur
  1994 original, `(G_2)_1`) genuinely lack local sources. See
  `CITATION_INDEX.md` for the per-flag status. Never silently treat
  an undischarged flag as discharged.

- **The chats are archived for a reason.** `chat1–4.md` live in
  `archive/chats/`. They contain superseded definitions, false starts,
  and notational inconsistencies that `summary.tex` has already
  reconciled. **Do not read them** unless explicitly asked. Treat
  them as deep storage.

- **Lean `0 sorry, 0 axiom` is a load-bearing invariant.** The
  Formalisation as inherited from CAD is fully proved (verified by
  `lake build` against Mathlib `d6dab93`, Lean `v4.30.0-rc2`). Any
  PR that introduces a `sorry` or `axiom` is rejected by default.
  If you genuinely need one, escalate to the user with explicit
  justification.

---

## Commit discipline

Every commit is atomic and carries provenance.

**Commit message template:**

```
<step-id>: <one-line summary>

Source: <absolute path or URL>
Source SHA256 (if file): <hash>
GLOSSARY changes: <added entries | none>
Validation passed: M D C R I       (list which gates were exercised)
Rollback: <git revert <commit> | rm -rf <path>>
```

- One atomic step per commit. If two atomic steps end up in one diff,
  split before committing.
- Never `git commit --amend` on a pushed commit.
- Never edit `summary.tex` outside of an `ERRATA.md`-tracked entry.
  Bug fixes are atomic commits with an ERRATA reference; new content
  is governed by `MIGRATION_PLAN.md` Phase 9-style review.

---

## Beads

`bd` (beads) is the only **persistent** task tracker for this repo.

**Backend: vanilla JSONL via git.** `bd init` creates
`.beads/issues.jsonl` as the authoritative store. We rely on
**git for cross-device sync**: the JSONL file is tracked in git; the
SQLite cache (`.beads/beads.db`) is `.gitignore`d and regenerable
from JSONL via `bd import`. No dolt, no automated remote — consistent
with Rule 9.

```bash
bd init                          # one-time fresh repo (initial setup)
bd ready                         # find available work
bd show <id>                     # view issue
bd create --title="..." --description="..." --type=task --priority=2
bd update <id> --status in_progress    # claim
bd close <id>                    # done
bd dep add <issue> <depends-on>  # dependency edge
bd blocked                       # show blocked issues
bd stats                         # project state

# Cross-device sync (manual; integrated with git):
bd export -o .beads/issues.jsonl     # snapshot SQLite → JSONL
git add .beads/issues.jsonl && git commit -m "bd: snapshot"
git pull --rebase                     # pull other devices' changes
bd import .beads/issues.jsonl         # fold incoming JSONL into local SQLite
```

**Rules:**

- File issues for anything that should outlive the conversation:
  features, bugs, migration steps, decisions, deferred questions.
- Respect the dependency DAG.
- **Never run `bd init --force`** on an existing populated repo
  (destroys data; this is why scientist-workbench switched to
  `bd bootstrap` for re-init). For *this* repo's first init, plain
  `bd init` is correct. For a fresh clone on a new device: do **not**
  run `bd init` — instead, `bd import .beads/issues.jsonl` to
  populate the local SQLite cache from the JSONL committed in git.
- Close issues with the same commit that completes them, where
  possible.
- **`bd export -o .beads/issues.jsonl` before every session-ending
  commit** if you closed or modified issues; otherwise the JSONL
  drifts from the SQLite cache and cross-device sync breaks. A
  pre-commit git hook automating this is a desirable follow-up
  (`scripts/install-bd-hooks.sh` — see scientist-workbench's
  `.githooks/pre-commit` for a reference implementation).

**TaskCreate exception** (inherited convention, scientist-workbench
granted this 2026-05-12): the harness `TaskCreate` / `TaskUpdate`
tools are permitted for **in-session** sub-step tracking — the live
checklist of "what I'm doing right now in this conversation." Rule of
thumb: if the work would be filed as a `bd` issue, it belongs in
beads; if it's a step *inside* claiming/closing such an issue, it can
live in `TaskCreate`. Never use markdown TODO lists.

---

## Stop conditions (when to escalate to the user)

Don't push through any of these. Stop and ask.

- A GLOSSARY conflict where the right choice is non-obvious.
- A local source disagrees with a `summary.tex` claim.
- A `lake build` / `Pkg.test()` / `pdflatex` failure after an import that
  you cannot resolve within the step's intended scope.
- A validation gate (M/D/C/R/I) cannot be met.
- A rollback procedure is unclear.
- Two independent reviewers (Opus / AF verifier / hostile review)
  disagree.
- You would otherwise need to add a `sorry` or `axiom` to Lean.
- A step in `MIGRATION_PLAN.md` says "STOP and ask user" — those are
  hard pauses, not advisory.
- The `\unchecked` flag you're trying to discharge has no local
  source.

When escalating, attach: the step you were on, what failed, the
specific reproducible command, and the relevant
`PROVENANCE.md` / `GLOSSARY.md` entries that bear on the question.

---

## Session completion ("landing the plane")

Adapted from the standard convention across all the user's projects.
Work is NOT complete until `git push` succeeds.

**Mandatory workflow:**

1. **File issues** for any remaining work surfaced during the session.
2. **Run quality gates** (whichever apply to what you touched):
   - `pdflatex summary.tex` (if `summary.tex` or `\cite`d files changed)
   - `lake build` (if `Formalisation/` changed)
   - `julia --project=. -e 'using Pkg; Pkg.test()'` (if `src/` or `test/` changed)
   - `bash scripts/check-canonical-consistency.sh` (if any meta file changed)
3. **Update issue status** — close finished, update in-progress.
4. **Push to remote** — mandatory:
   ```bash
   git pull --rebase
   bd sync          # if using dolt backend
   git push
   git status       # MUST show "up to date with origin"
   ```
5. **Verify** all changes committed AND pushed.
6. **Hand off** — short note for the next agent: what landed, what
   was left, why.

**Hard rules:**

- Work is not complete until `git push` succeeds.
- Never stop before pushing — leaves work stranded locally.
- Never say "ready to push when you are" — *you* push.
- If push fails, resolve and retry until it succeeds.

---

## File map (canonical layout)

```
PRD.md                    # entry point — read first
CLAUDE.md / AGENTS.md     # this file (identical pair)
GLOSSARY.md               # canonical definitions — the bedrock
CONVENTIONS.md            # notational, gauge, indexing conventions
ERRATA.md                 # corrections applied to summary.tex post-archival
RESEARCH_NOTES.md         # open questions, acquisition queue, deferred decisions
MIGRATION_LOG.md          # per-step commit log of the consolidation
PROVENANCE.md             # what came from where, with hashes
CITATION_INDEX.md         # \unchecked → discharge-status map

summary.tex               # the guiding conceptual mathematical statement
                          # edits ONLY via ERRATA-tracked atomic commits

Formalisation/            # Lean 4 — must compile, 0 sorry, 0 axiom
Formalisation.lean
lakefile.lean
lean-toolchain
lake-manifest.json

src/MobileAnyons/         # Julia computational backend — Pkg.test() must pass
test/
Project.toml
Manifest.toml

scripts/julia/            # Julia triple-check scripts (one per Lean module)
scripts/wolfram/          # Wolfram triple-check scripts
results/CHECKS.md         # command log of triple-check runs

references/               # local PDFs + SHA256-verified extractions
references/manifest/SOURCES.md
literature/               # bibliography DB (630 papers, SQLite)
literature/SURVEY.md
literature/SYNTHESIS.md

reviews/                  # hostile audits of canonical content
stocktake/                # the consolidation's own provenance:
  README.md               #   synthesis of where everything came from
  MIGRATION_PLAN.md       #   the phased plan
  reports/                #   sub-agent reports (per source slice)

archive/chats/            # chat1-4.md — DEEP STORAGE, do not read
archive/cad-meta-snapshot/        # CAD project's heavy meta docs
archive/mma-archive-v0-snapshot/  # MMA's v0 with known bugs (reference only)

af/                       # adversarial-proof workspace (if used)
docs/af-quickref.md       # af CLI reference
```

---

## Tool of last resort

If the Laws conflict with a fast path: choose the Laws. "Just ship and
fix later" is not a working mode here. The cost of a definitional
contradiction discovered three migration phases later is hours of
unwinding plus loss of confidence in the canonical artifacts; the cost
of stopping to update GLOSSARY first is minutes.

When in doubt: re-read this file, re-read PRD, re-read GLOSSARY, then
ask the user.
