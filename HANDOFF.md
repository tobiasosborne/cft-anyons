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
**Last session goal:** Execute Phase 1 of MIGRATION_PLAN (definitional bedrock — populate GLOSSARY + CONVENTIONS, lock the Hilbert-space translation map, build out the per-source translation maps).
**Last commit:** `d8c0a40` (P1.7 — CAD-Lean translation maps populated)

---

## TL;DR — what to do next

**Run `bd ready`. The next concrete task is `MIGRATION_PLAN.md` step P1.8 (MMA-Julia translation maps).** Specifically, populate the **MMA bullets** of the relevant GLOSSARY Translation map fields per `stocktake/reports/mma-julia.md` §5 — symmetric to what P1.7 just did for CAD. Plan-named primary targets per `MIGRATION_PLAN.md:132`:

- `def:partition` ← `LabelledConfig`
- `def:refmap` ← `normalized_product_isometry` (= `E_{P→P'}`)
- `def:TL-cat` ← `interaction_hamiltonian` (`Σ P_j` ↔ `e_i / d_σ`)

The Hilbert-space MMA mappings (`def:HP`, `def:Hlatt`, `def:indlim`, `def:mobile-Fock`) are **already done** by P1.5 — those entries' MMA bullets contain the full bidirectional bijection. P1.8 fills in the remaining MMA Julia-struct-level mappings for the entries that don't yet have one.

After P1.8: P1.9 (definitional gate audit — Opus subagent reads GLOSSARY + CONVENTIONS end-to-end), P1.10 (PROVENANCE refresh), P1.11 (PRD v0 → v1 refresh). Then Phase 1 closes.

---

## Quick orientation (10–15 min, in this order)

1. **`PRD.md`** — what this project is, scope in/out, canonical artifacts. 1245 words; ~5 min.
2. **`CLAUDE.md` / `AGENTS.md`** (identical pair) — methodology, Two Laws, 11 Rules, hallucination-risk callouts. ~10 min. *Especially: Rule 4 (reviewer-gating), Rule 5 (red-green / port-and-verify), Rule 8 (docs-in-lockstep), Rule 11 (GLOSSARY conformance overrides everything).*
3. **This file (HANDOFF.md)** — current session-specific state. ~5 min.
4. **`bd ready`** in shell — see what's queued.

Stop here if you're just orienting. Sections below are needed only when you start work.

---

## What landed this session

**8 commits total** (7 substantive P-steps + 1 admin backfill):

| Commit | Step | Summary |
|---|---|---|
| `8640f1e` | **P1.1** | Extract 48 def/conv from `summary.tex` into GLOSSARY (4 conv + 44 def, verbatim in ```latex blocks) |
| `2edb424` | (admin) | Backfill MIGRATION_LOG rows for P1.4-early-{A,B,C} (prior session) + P1.1 |
| `0e4592a` | **P1.2** | ERRATA entry for `lem:binary-Z` squared-amplitudes bug (audit-trail for pre-baseline fix; no `summary.tex` edit) |
| `99749cf` | **P1.3** | GLOSSARY §A/§B split; new `def:mobile-Fock` entry in §B; cross-links between the four Hilbert-space framings |
| `40c0a22` | **P1.5** | Write explicit Hilbert-space translation maps (4 entries: `def:HP`, `def:Hlatt`, `def:indlim`, `def:mobile-Fock`) from bridge report §2 |
| `8226003` | **P1.6** | Populate `CONVENTIONS.md` with 10 lettered entries (a)–(j) |
| `d8c0a40` | **P1.7** | Populate all 49 CAD bullets in GLOSSARY (23/23 CAD `.lean` files covered) |

Each substantive commit went through a hostile Opus subagent review (verdicts all **APPROVE WITH MINOR EDITS**, minor edits all applied). Review reports landed alongside each step in `stocktake/reports/opus-*-review.md`.

**Phase 1 progress: 7 of 11 steps done. P1.4 was done early by the prior session (commits `770d730`/`1008cd8`/`93a2bea`).**

---

## Open work

`bd ready` shows the actionable items. Current state:

| ID | Title | Type | Priority | Status |
|---|---|---|---|---|
| `cft-anyons-k3s` | P1: Phase 1 — Definitional bedrock (GLOSSARY) | epic | P1 | open ← **start here** |
| `cft-anyons-q6h` | LB-1: MMA enumerate_fusion_trees | bug | P2 | open (blocked by Phase 8; do not fix yet) |
| `cft-anyons-fnm` | P0 epic | epic | P1 | **closed** ✓ |
| `cft-anyons-9cr` | P1.4-early task | task | P1 | **closed** ✓ |
| `cft-anyons-k3s.1`–`.6` | Sub-tasks for P1.1, P1.2, P1.3, P1.5, P1.6, P1.7 | task | P1 | **closed** ✓ |

Remaining Phase 1 steps per `stocktake/MIGRATION_PLAN.md` (lines 131–135):

- **P1.8** ← *next*. MMA-Julia struct translation maps. Source: `stocktake/reports/mma-julia.md` §5. Entries to touch: `def:partition`, `def:refmap`, `def:TL-cat` (plan-named); plus any other entries with MMA bullets still reading "TBD pending P1.8".
- **P1.9.** Definitional gate audit: spawn Opus subagent to read `GLOSSARY.md` + `CONVENTIONS.md` end-to-end and flag undefined terms, internal inconsistencies, conflicts with `summary.tex`. Output to `stocktake/reports/opus-glossary-audit.md`. **Mandatory user-read-and-approve before Phase 2.**
- **P1.10.** Update `PROVENANCE.md` with Phase 1 summary (currently `PROVENANCE.md` is a stub).
- **P1.11.** Refresh `PRD.md` v0 → v1 with GLOSSARY/CONVENTIONS pointers internalised. Brief Opus review of the diff only.

```bash
cd /home/tobias/Projects/cft-anyons
bd ready                    # confirm cft-anyons-k3s open epic + queue
bd show cft-anyons-k3s      # read epic description
# … then file cft-anyons-k3s.7 for P1.8 and start
```

---

## Gotchas surfaced this session (not yet in CLAUDE.md)

The session-1 HANDOFF had 10 gotchas. Adding 6 more from this session:

11. **`bd close <sub-task>` auto-closes the parent epic** when the sub-task is the only open child. Saw this 6 times this session. After each P-step's `bd close cft-anyons-k3s.N`, run `bd update cft-anyons-k3s --status open` to reopen the epic, *unless* the last Phase 1 sub-task (P1.11) is genuinely closing the phase.

12. **`MIGRATION_LOG.md` row belongs in the *same atomic commit* as the P-step's content change** (per CLAUDE.md Rule 8 "docs in lockstep"). The first P-step this session (P1.1) shipped without the log row; the row was added in a follow-on admin commit `2edb424` (which also backfilled three prior-session gaps). Every subsequent P-step this session correctly bundled the log row in the same commit. **Keep doing this.** The pattern: write the row with `(this)` as the commit hash in the row, then the *next* commit backfills the prior `(this)` with the actual hash. See P1.5/P1.7's MIGRATION_LOG diffs for the pattern.

13. **`MIGRATION_PLAN.md` text drifts from execution.** Spotted twice:
    - **P1.2 said "all 4 reviewers flagged it"** — actually 3 of 4 (review_4 had different CRITICAL findings, silent on `lem:binary-Z`). ERRATA records honestly.
    - **P1.3 said "TBD pending P1.4"** for stubs — but P1.4 was done early in the prior session. P1.3 was reframed as "TBD pending P1.5" instead.
    - **P1.7's M-gate** ("each CAD Lean file in cad-lean.md has a GLOSSARY translation entry") was undercounting — 4 supporting files (BraidMatrices.lean, ConfigurationSpace.lean, FockSpace.lean, Isometry.lean) needed late mentions added.
    
    **General lesson:** treat the plan's per-step text as a guideline, not as a verbatim contract. Cross-check against current reality before each step.

14. **For bulk same-shaped edits to GLOSSARY** (like P1.7's 49 CAD bullets), the **Python-script-then-Write approach** worked cleanly: read GLOSSARY.md, run regex find-and-replace per slug, write back, then verify §A canonical bodies are still byte-verbatim via the D-gate script. Saves many Edit calls. **Caveat:** verify cross-links + D-gate after, because Write means the entire file's content has to be correct. See `/tmp/p1_7_apply.py` in your session if needed (gets cleaned across sessions; reconstruct from the P1.7 commit's diff if reuseing).

15. **The schema doc's `<placeholder>` examples shouldn't get touched by bulk edits.** When I scripted P1.7, the regex was keyed on actual slugs (e.g., `def:fuscat`) — not the literal `<label>` template — so the schema doc's "CAD: ... TBD pending P1.7" example was preserved. Anyone scripting future bulk edits to GLOSSARY/CONVENTIONS should match on real slugs only, never on `<placeholder>` text.

16. **§B (entries from outside `summary.tex`) is now structurally established** by P1.3's split. The schema doc authorises multiple `**Canonical (description):**` blocks for §B entries (per the P1.3 reviewer's edit). If you add new §B entries (e.g., for MMA Julia structs in P1.8 that have no `summary.tex` equivalent), follow the `def:mobile-Fock` pattern: include a slug-of-convenience disclosure in the Source field saying the slug is GLOSSARY-internal, not a citable label in the external source.

---

## How to verify repo state on entry

```bash
cd /home/tobias/Projects/cft-anyons
git log --oneline | head -10           # P1.7 d8c0a40 at top; 8 commits this session
git status                              # clean
wc -l GLOSSARY.md CONVENTIONS.md ERRATA.md MIGRATION_LOG.md
# Expected: ~1790 ~552 ~143 ~51

bd stats                                # 10 issues, 2 open, 8 closed
bd ready                                # 2 ready (P1 epic + LB-1 bug)
ls stocktake/reports/opus-*review.md    # 6 review reports: prd-v0, prd-v0.1, glossary-p1.1, errata-p1.2, glossary-p1.3, glossary-p1.5, conventions-p1.6, glossary-p1.7
```

To verify P1.7's M-gate (every CAD Lean file in `cad-lean.md` §5 is referenced somewhere in GLOSSARY):

```bash
python3 -c "
import re
with open('GLOSSARY.md') as f: g = f.read()
with open('stocktake/reports/cad-lean.md') as f: c = f.read()
b = re.search(r'## 5\..*?(?=## 6\.)', c, re.S).group(0)
files = set(re.findall(r'\`([A-Z][a-zA-Z]*/[A-Z][a-zA-Z]*\.lean)\`', b))
print('Covered:', len({f for f in files if f in g}), '/', len(files))
"
# Expected: 23 / 23
```

If any of these don't match, stop and check the recent commits.

---

## What NOT to do this session

- **Do not import content from `microscopic-mobile-anyons/` or `cft-anyons-deprecated/`.** All imports remain scheduled for Phase 2+ in the migration plan; importing now bypasses the GLOSSARY/CONVENTIONS gates this session locked.
- **Do not read `archive/chats/chat*.md`** unless explicitly asked. (Deep storage; superseded.)
- **Do not edit `summary.tex` outside of an ERRATA-tracked atomic commit.** ERRATA now has one real entry (P1.2's `lem:binary-Z` audit-trail); follow that template for any future entry.
- **Do not fix LB-1** (`cft-anyons-q6h`). Blocked on Phase 8.
- **Do not add `.github/workflows/`** — no GitHub CI is project policy.
- **Do not push.** No git remote configured. Mention to the user at session end (manual push only when a remote is wired up).

---

## Key files / artifacts to know about

| Path | What it is |
|---|---|
| `PRD.md` | Entry point — read first |
| `CLAUDE.md` = `AGENTS.md` | Methodology + 11 Rules + hallucination-risk callouts |
| `GLOSSARY.md` | **49 entries now populated.** §A: 48 verbatim from `summary.tex`; §B: 1 (`def:mobile-Fock`) from outside. All CAD bullets populated; many MMA bullets still "TBD pending P1.8". Schema documented in lines 47–98. |
| `CONVENTIONS.md` | **10 entries (a)–(j) populated.** (f) TikZ is deferred (no TikZ in `summary.tex` yet). All forward-pointers from GLOSSARY's `[P1.6(letter)]` tags resolve. |
| `ERRATA.md` | 1 entry: `lem:binary-Z` audit-trail (no `summary.tex` edit in P1.2 — the fix was pre-baseline). |
| `MIGRATION_LOG.md` | Per-step commit log. Phase 0 + P1.1–P1.7 + early P1.4 rows present. Row for "this commit" placeholder gets backfilled by the next commit. |
| `summary.tex` | Canonical mathematical statement — **unchanged this session**. Build artifacts (`summary.aux`, `summary.log`, `summary.pdf`, `summary.toc`, `summary.out`) are gitignored. |
| `stocktake/MIGRATION_PLAN.md` | The phased plan. Phase 1 lines 117–139. **You are at the start of P1.8.** |
| `stocktake/reports/opus-hilbert-bridge.md` | **Authoritative source** for the three Hilbert-space framings + translation maps + 7 conventions. Sourced by P1.3, P1.5, parts of P1.6, P1.7. |
| `stocktake/reports/cad-lean.md` | **Authoritative source** for P1.7. §5 has the per-file mapping. |
| `stocktake/reports/mma-julia.md` | **Authoritative source for P1.8.** §5 has the MMA-Julia ↔ summary.tex per-struct mapping. Start there. |
| `stocktake/reports/opus-glossary-p1.1-review.md` etc. | 6 review reports (P1.1, P1.2, P1.3, P1.5, P1.6, P1.7). Each Phase-1 step's hostile-review verdict + minor-edit recipe. |
| `reviews/review_{1-4}.md` | 4 hostile audits of `summary.tex` from the prior session. P1.2 discharged the unanimous `lem:binary-Z` finding; other findings remain for later phases. |
| `.beads/issues.jsonl` | bd JSONL snapshot. Updated before every session-ending commit per CLAUDE.md cross-device sync rule. |

---

## If you only have 5 minutes

Read PRD.md sections "Mission" and "Read order". Then `bd show cft-anyons-k3s`. Then **read `stocktake/reports/mma-julia.md` §5** (per-file Julia struct ↔ summary.tex mapping). Then file `bd create --title="P1.8: MMA-Julia translation maps in GLOSSARY" --type=task --priority=1 --parent=cft-anyons-k3s` and `bd update <id> --claim`. The work is symmetric to the P1.7 commit `d8c0a40` (just MMA instead of CAD); look at that commit's diff for the pattern.

---

## Pattern for the next P-step (templated from this session)

For any P1.X (and later):

1. **Read MIGRATION_PLAN's P1.X row** for the exact scope + validation gates.
2. **Read the authoritative source** named in the plan (e.g., `stocktake/reports/mma-julia.md` §5 for P1.8).
3. **`bd create --title="P1.X: ..." --type=task --priority=1 --parent=cft-anyons-k3s`** then `bd update <id> --claim`.
4. **Do the work.** Edit GLOSSARY/CONVENTIONS/ERRATA/PROVENANCE etc. as needed. Bulk edits → Python-script-then-Write (see P1.7); individual edits → Edit.
5. **Run mechanical/D-gates.** A typical D-gate replay script is in any of the recent review reports. The §A canonical-bodies-byte-verbatim check is the load-bearing invariant.
6. **Spawn an Opus 4.7 reviewer subagent** (`general-purpose`, model `opus`). Give it the focus-areas list scoped to your step's deliverables. Reviewer reports go to `stocktake/reports/opus-<topic>-p1.X-review.md`.
7. **Apply the reviewer's minor edits.** Re-run gates.
8. **`bd close cft-anyons-k3s.<N> --reason="..."`** with the verdict summary. **`bd update cft-anyons-k3s --status open`** to reopen the auto-closed epic. **`bd export -o .beads/issues.jsonl`**.
9. **Add MIGRATION_LOG row in the same atomic commit** (with the `(this)` placeholder for the not-yet-computed commit hash). Update the *previous* row's `(this)` to its actual commit hash.
10. **Atomic commit** with the full provenance footer from CLAUDE.md `§ Commit discipline`. `Review:` line per Rule 4. `Co-Authored-By: Claude Opus 4.7 (1M context) <noreply@anthropic.com>`.
11. **Verify clean tree + green gates.** Push is manual (no remote); mention to user at session end.

---

## Session close protocol (re-stated from CLAUDE.md)

When you end your session:

1. Run the gates that apply to what you touched (`pdflatex` if you touched `summary.tex`; `lake build` if you touched `Formalisation/`; etc.).
2. Close finished `bd` issues; reopen the epic if auto-closed.
3. `bd export -o .beads/issues.jsonl`.
4. **Rewrite this file (HANDOFF.md)** with the new session-end state. Old content goes into git history; don't preserve it in-file.
5. Commit. (Push manual — no remote.)

The push step is currently manual (no remote). Mention this to the user when you finish.
