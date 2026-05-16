# HANDOFF — Next Agent

<!--
ROLE: Session-end artifact pointing the next agent at the current state +
      the immediate next concrete action. Complements PRD.md (timeless) by
      capturing session-specific status that isn't naturally in
      MIGRATION_LOG.md or bd issues.
UPDATE POLICY: Rewritten (not appended) at the end of every substantive
      session. Previous handoff content is captured implicitly in git
      history; do not preserve old text in-file. Keep ≤500 lines.
TRIGGER: End of session; or any time MIGRATION_LOG.md is updated with a
      multi-step block.
-->

**Last updated:** 2026-05-16
**Last session goal:** Consolidate three prior projects (`microscopic-mobile-anyons/`, `cft-anyons-deprecated/`, this repo's chat transcripts) into a single canonical ground-truth repo. Execute MIGRATION_PLAN Phase 0 + de-risk Phase 1 via Hilbert-space deep-dive.
**Last commit:** `93a2bea` (P1.4-early-C, plan revision after de-risking)

---

## TL;DR — what to do next

**Run `bd ready`. The next concrete task is Phase 1 of `stocktake/MIGRATION_PLAN.md` (epic `cft-anyons-k3s`). Specifically, start with step P1.1: read `summary.tex` end-to-end and extract every `\begin{definition}` / `\begin{convention}` into `GLOSSARY.md`.**

The hardest open question (whether the three Hilbert-space formulations reconcile) **has already been answered: YES, with convention work** — see `stocktake/reports/opus-hilbert-bridge.md`. You can trust the partition formulation `H_P^W = Hom_C(W, A_P)` as canonical and proceed.

---

## Quick orientation (10–15 min, in this order)

1. **`PRD.md`** — what this project is, scope in/out, canonical artifacts. 1245 words; ~5 min.
2. **`CLAUDE.md` / `AGENTS.md`** (identical pair) — the methodology, the Two Laws, the 11 Rules, hallucination-risk callouts. ~10 min. *Especially: Rule 4 (reviewer-gating) and Rule 5 (red-green TDD) and Rule 10 (GLOSSARY conformance overrides everything else).*
3. **This file (HANDOFF.md)** — current session-specific state. ~5 min.
4. **`bd ready`** in shell — see what's queued.

Stop here if you're just orienting. Below sections are only needed when you start work.

---

## What just landed (this session)

15 atomic commits total. Two phases:

### Phase 0: Repo skeleton + meta files + PRD (commits 7e62d9a → 5dd5381, ~11 commits)
- Git initialised; baseline commit.
- `bd init` (dolt backend embedded; vanilla JSONL backend no longer exists in bd).
- Directory skeleton: `archive/{chats,cad-meta-snapshot,mma-archive-v0-snapshot}/`, `reviews/`, `references/`, `literature/`, `Formalisation/`, `scripts/{julia,wolfram}/`, `results/`, `src/`, `tests/`, `af/`, `docs/`.
- 9 stub meta files at top level: `PRD.md`, `GLOSSARY.md`, `CONVENTIONS.md`, `ERRATA.md`, `RESEARCH_NOTES.md`, `PROVENANCE.md`, `CITATION_INDEX.md`, `MIGRATION_LOG.md`, plus the docstrings.
- `chat1-4.md` moved to `archive/chats/` (deep storage; don't read).
- `review_1-4.md` moved to `reviews/`.
- `PRD.md` drafted (P0.8) and survived 2 rounds of hostile Opus review (`stocktake/reports/opus-prd-v0-review.md`, `opus-prd-v0.1-review.md`). Final verdict: APPROVE WITH MINOR EDITS, conditional fix applied. PRD is 1245 words against a 1500-word cap (bumped from 800 mid-session per reviewer recommendation).
- `README.md` is a one-pager pointing at PRD.

### P1.4-early: Hilbert-space deep-dive pulled forward (commits 770d730, 1008cd8, 93a2bea)
- User requested de-risking the most-load-bearing step (P1.4 Opus dive) BEFORE Phase 1 GLOSSARY work begins.
- Opus 4.7 deep-dive verdict: **YELLOW (reconcilable with convention work)**. Full report at `stocktake/reports/opus-hilbert-bridge.md` (461 lines).
- All three Hilbert-space formulations equivalent; **partition `H_P^W` is canonical**.
- 7 conventions need locking at P1.6 (4 already in CLAUDE.md callouts, 3 new: fusion-tree left-associated, multiplicity-free assumption, N=0 boundary).
- **Bonus**: Critical latent bug found in MMA Julia (LB-1 — `enumerate_fusion_trees` treats `dim Hom > 0` as Boolean rather than counting multiplicity). Latent for current categories, blocking for any extension. Filed as bd ticket + RESEARCH_NOTES entry + P8.4 TODO marker scheduled.
- MIGRATION_PLAN updated: P1.6 expanded from 6 → 10 convention items; P1.7, P8.1, P8.4 got scope clarifications.

---

## Open work

`bd ready` shows the actionable items. Current state:

| ID | Title | Type | Priority | Status |
|---|---|---|---|---|
| `cft-anyons-k3s` | P1: Phase 1 — Definitional bedrock (GLOSSARY) | epic | P1 | open ← **start here** |
| `cft-anyons-q6h` | LB-1: MMA enumerate_fusion_trees incomplete for non-multiplicity-free categories | bug | P2 | open (blocked by Phase 8; do not fix yet) |
| `cft-anyons-fnm` | P0: Phase 0 — repo skeleton, bd init, meta-files, PRD | epic | P1 | **closed** ✓ |
| `cft-anyons-9cr` | P1.4-early: Hilbert-space deep-dive | task | P1 | **closed** ✓ |

To resume:

```bash
cd /home/tobias/Projects/cft-anyons
bd ready                                # confirm cft-anyons-k3s is the open epic
bd show cft-anyons-k3s                  # read the description
# … then start P1.1 per stocktake/MIGRATION_PLAN.md
```

The P1.1–P1.11 steps are atomic per the plan; file sub-task bd issues as you go (or use TaskCreate for in-session sub-step tracking per CLAUDE.md's TaskCreate-exception clause).

---

## Gotchas surfaced this session (not yet in CLAUDE.md)

1. **`bd init` defaults to embedded Dolt** (sqlite backend has been removed from bd). Our "JSONL via git" plan therefore means: Dolt is the local store (per-machine; gitignored); JSONL is the cross-device sync vehicle (committed in git). Workflow: `bd export -o .beads/issues.jsonl` before any session-ending commit that touched issues. This is already documented in CLAUDE.md's Beads section.

2. **`bd init` auto-modifies `CLAUDE.md` / `AGENTS.md`** by appending a duplicate "Beads Issue Tracker" block and a duplicate "Session Completion" section (visible in commit `36a730d`'s diff). Both auto-additions were removed in `cd6e108` (P0.1c reconciliation) because they contradict our custom sections (the auto block says "do NOT use TaskCreate" which conflicts with the scientist-workbench-inherited TaskCreate-exception clause). **If you run any `bd setup …` command, expect these blocks to come back — remove them again and bundle the removal in the commit.**

3. **The "refuse to add mathematical content" gate is stated by named files, not ordinals.** PRD and CLAUDE.md both name the four files (PRD, GLOSSARY, CONVENTIONS, CLAUDE) directly. Do NOT change to "1–4" or any ordinal — the v0.1 reviewer (Opus, P0.9) flagged ordinal-drift as the critical risk. See `stocktake/reports/opus-prd-v0.1-review.md` finding N-C1.

4. **`summary.tex` build artifacts are at top level** (`summary.aux`, `summary.log`, `summary.out`, `summary.pdf`, `summary.toc`). These are gitignored from the baseline; do NOT `git add` them. Run `pdflatex summary.tex` to regenerate. The PDF is regenerable; don't track it.

5. **The hostile-review reports are themselves canonical artifacts.** When Opus reviews land in `stocktake/reports/`, they get committed alongside the change they reviewed. Treat them as audit-trail; do not delete or rewrite.

6. **The 3 source projects are still in place** at `/home/tobias/Projects/microscopic-mobile-anyons/` and `/home/tobias/Projects/cft-anyons-deprecated/`. They are not yet imported into the canonical repo. Migration is phased per `stocktake/MIGRATION_PLAN.md`. Do not edit them (read-only inputs to the consolidation).

7. **`cft-anyons-deprecated` is misleadingly named** — it's not actually deprecated; it's the formalisation-first version of this project that was renamed when the chat-transcript-driven work began. Its Lean code (28 files, 3049 lines, **zero sorry, zero axiom**) is a load-bearing asset to migrate in Phase 5. See `stocktake/README.md` §1.

8. **MIGRATION_PLAN.md updates** happen via Edit not Write — the plan is long and Write would risk losing structure. Append rows to MIGRATION_LOG.md as you go.

9. **Each atomic commit's message MUST include the provenance footer** (`Source:`, `Validation passed:`, `Review:`, `Rollback:`) per the template in CLAUDE.md §Commit discipline. Reviewer-gating exemption phrasing: `Review: mechanical, exempt` (with brief reason).

10. **Co-Authored-By line** for AI-assisted commits: use `Co-Authored-By: Claude Opus 4.7 (1M context) <noreply@anthropic.com>`. Match exactly.

---

## How to verify the repo state on entry

Run these commands; you should see what's claimed:

```bash
cd /home/tobias/Projects/cft-anyons
git log --oneline | head -20            # 15 atomic commits, oldest first should be P0.1
git status                              # should be clean
ls -la                                  # 10 top-level .md (incl. HANDOFF, README, PRD, GLOSSARY, etc.); summary.tex; .gitignore; subdirs
wc -l summary.tex CLAUDE.md PRD.md      # ~2483, ~470, ~155 (lines, not words)
bd stats                                # 4 issues total, 2 open, 2 closed
bd ready                                # 2 ready (P1 epic + LB-1 bug)
ls stocktake/reports/                   # 10 reports incl. opus-prd-v0-review.md, opus-prd-v0.1-review.md, opus-hilbert-bridge.md
```

If any of these don't match, **stop and ask the user** — the repo is in an unexpected state.

To verify GLOSSARY work hasn't already started:

```bash
grep -c "^##" GLOSSARY.md               # should be 1 (just the "Schema" section)
wc -l GLOSSARY.md                       # ~28 lines (stub size)
```

If GLOSSARY has substantive content already, read it before adding more (you'd be building on prior work).

---

## What NOT to do this session

- **Do not import any content from `microscopic-mobile-anyons/` or `cft-anyons-deprecated/` yet.** All imports are scheduled for Phase 2 onward in the migration plan; importing now would bypass GLOSSARY/CONVENTIONS locking and is the dominant risk-of-drift the project is designed to prevent.
- **Do not read `archive/chats/chat*.md`** unless explicitly asked. They are superseded source transcripts and contain definitions `summary.tex` has already reconciled. Reading them risks re-importing dropped notation.
- **Do not edit `summary.tex` outside of an `ERRATA.md`-tracked atomic commit.** The 4 hostile review files at `reviews/` flagged ~25 issues; only the unanimous `lem:binary-Z` bug is scheduled for Phase 1.2 fixing. Others come later.
- **Do not fix LB-1 (MMA enumerate_fusion_trees bug) yet.** It is blocked by Phase 8 (MMA migration). Fixing it before MMA Julia is imported into the canonical repo would create cross-repo edits.
- **Do not add `.github/workflows/`** — no GitHub CI is project policy (CLAUDE.md Rule 9; PRD Scope: out).

---

## Key files / artifacts to know about

| Path | What it is |
|---|---|
| `PRD.md` | Entry point — read first |
| `CLAUDE.md` = `AGENTS.md` | Methodology + 11 Rules + hallucination-risk callouts |
| `GLOSSARY.md` | Canonical definitions — currently a stub; you populate it in Phase 1 |
| `CONVENTIONS.md` | Notational/gauge/indexing choices — currently a stub; populated at P1.6 |
| `summary.tex` | Guiding conceptual mathematical statement (2483 lines, canonical, edit-via-ERRATA only) |
| `ERRATA.md` | Append-only log of `summary.tex` corrections |
| `RESEARCH_NOTES.md` | Open questions, acquisition queue, **latent bugs (LB-N)** |
| `PROVENANCE.md` | What came from where, with hashes |
| `MIGRATION_LOG.md` | Per-step commit log |
| `CITATION_INDEX.md` | `summary.tex` citations → discharge status |
| `README.md` | Directory map + "Read PRD.md first" |
| `stocktake/README.md` | Inheritance picture from 3 source projects |
| `stocktake/MIGRATION_PLAN.md` | The phased plan (12 phases; you are at start of Phase 1) |
| `stocktake/reports/opus-hilbert-bridge.md` | **THE critical de-risking artifact** — Hilbert-space three-framings reconciliation. Read before any Phase 1 GLOSSARY work touching the Hilbert space definition. |
| `stocktake/reports/opus-prd-v0-review.md`, `opus-prd-v0.1-review.md` | PRD's hostile review trail |
| `stocktake/reports/{mma-*,cad-*}.md` | Per-slice inventory reports from the original 7-agent stocktake |

---

## If you only have 5 minutes

Read PRD.md sections "Mission" and "Read order". Then `bd ready`. Then `bd show cft-anyons-k3s`. Then read CLAUDE.md Rules 4, 5, and 10. That's enough to know what kind of project this is and what's allowed.

If you have an hour, also read `stocktake/reports/opus-hilbert-bridge.md` — it'll save you (or the user) from re-deriving the Hilbert-space bridge in any GLOSSARY entry.

---

## Session close protocol (re-stated from CLAUDE.md)

When you end your session, this file should be **rewritten** (not appended) with your session's state. Old content goes into git history. Then:

```bash
bd export -o .beads/issues.jsonl
git add -A
git commit -m "<your final session commit>"
git push  # if a remote is configured
```

The push step is currently **manual** (no remote configured yet). Mention this to the user when you finish.
