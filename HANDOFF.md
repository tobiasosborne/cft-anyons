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
**Last session goal:** Close Phase 1 (definitional bedrock) by completing P1.8 → P1.9 → P1.10 → P1.11.
**Last commit:** `76886d2` (P1.11 — PRD v0 → v1 refresh).

---

## 🚨 STOP — Phase 2 is gated on user read-and-approve

Per `stocktake/MIGRATION_PLAN.md:137-139` and the P1.9 audit:

> Stop and confirm with user before proceeding to Phase 2.

The P1.9 hostile Opus audit verdict is **APPROVE FOR PHASE 2** (zero CRITICAL, zero MAJOR; 8 MINOR/NIT findings; 5 MINOR applied in the P1.9 commit). The audit report is at:

```
stocktake/reports/opus-glossary-audit.md   (183 lines)
```

**The user has not yet read-and-approved the audit.** Until they do, **do NOT begin Phase 2 work** (no `references/` import, no `literature/` import, no `CITATION_INDEX.md` discharge). If the user says "go ahead with Phase 2" — or any explicit approval of the audit — then Phase 2 unblocks.

If the user wants edits to the audit-flagged items first, the 3 NITs deferred this session are:
1. `def:RG-amp`, `def:stress` are orphan entries (not cross-linked from other entries) — backlink polish would help discoverability.
2. Schema template at `GLOSSARY.md:76-77` still references "TBD pending P1.7/P1.8" — by design per HANDOFF gotcha #15 (script keys on real slugs, not the `<placeholder>` template). The auditor flagged this as NIT only because a future reviewer might re-flag it.
3. Asymmetric cross-links — some Notes refs are unidirectional where bidirectional would aid navigation. Polish-only.

---

## TL;DR — what to do next

1. Read `stocktake/reports/opus-glossary-audit.md` (the user's call, but you should also re-read it if you're a fresh agent that didn't run P1.9).
2. Ask the user: "Approve Phase 2 unblock? Or apply any of the 3 deferred NITs first?"
3. **If user approves Phase 2:** start Phase 2 work per `stocktake/MIGRATION_PLAN.md` Phase 2 spec (lines 143-160). Phase 2 step P2.1 is "Copy `cft-anyons-deprecated/references/` → `cft-anyons/references/`". File a new bd epic for Phase 2 (`cft-anyons-?`), then file P2.1-P2.8 as sub-tasks.
4. **If user wants NIT cleanup first:** file a small bd task for the polish and apply it before opening Phase 2.

---

## Quick orientation (10 min, in this order)

1. **`PRD.md`** — refreshed to v1 in P1.11. Status line confirms Phase 1 complete. New "GLOSSARY entries to internalise, by task class" section is the cheat-sheet for any new content. ~5 min.
2. **`CLAUDE.md` / `AGENTS.md`** (identical pair) — methodology, Two Laws, 11 Rules. Especially Rule 4 (reviewer-gating), Rule 11 (GLOSSARY conformance), and Hallucination-risk callouts (all 8 audit-verified to fire). ~5 min.
3. **This file (HANDOFF.md)** — current session-specific state. ~3 min.
4. **`stocktake/reports/opus-glossary-audit.md`** — the P1.9 audit's verdict + 8 findings + per-priority summary. Critical read if proceeding to Phase 2. ~5 min.
5. **`bd ready`** in shell — see what's queued (currently 4 ready bug/follow-up issues; no in-progress sub-task since Phase 1 epic auto-closed).

Stop here if you're just orienting.

---

## What landed this session (4 commits)

| Commit | Step | Summary |
|---|---|---|
| `fe96ec7` | **P1.8** | MMA-Julia translation maps in GLOSSARY (45 MMA bullets populated; `conv:basics` Aliases updated). Hostile Opus review APPROVE WITH MINOR EDITS, 5 applied. |
| `b986495` | **P1.9** | Definitional gate audit + 5 MINOR cleanups (APPROVE FOR PHASE 2). |
| `edb547a` | **P1.10** | PROVENANCE.md refresh from stub (Phase 1 canonical baseline; 288 lines). |
| `76886d2` | **P1.11** | PRD.md v0 → v1 refresh (GLOSSARY/CONVENTIONS internalised, brief Opus review of diff APPROVE WITH MINOR EDITS, 1 nit applied). |

**Phase 1 progress:** all 11 of 11 steps done. Phase 1 epic (`cft-anyons-k3s`) auto-closed at P1.11 close.

**Phase 1 outputs:**
- `GLOSSARY.md`: 49 entries (48 §A from `summary.tex` + 1 §B for `def:mobile-Fock`), 2053 lines. All Translation map bullets populated (MMA + CAD).
- `CONVENTIONS.md`: 10 lettered entries (a)–(j), 565 lines. 7/10 letters currently invoked from GLOSSARY; (c)/(e)/(f) are pre-registered hooks.
- `ERRATA.md`: 1 entry (`lem:binary-Z` audit trail; pre-baseline fix).
- `PROVENANCE.md`: full Phase-1 canonical baseline + per-artifact entries, 288 lines.
- `PRD.md`: v1; per-task-class GLOSSARY entry lists; concrete Phase-1 examples of M/D/C/R gates.

**Filed during the session as P3 Phase-gated follow-ups:**

| ID | Title |
|---|---|
| `cft-anyons-2ae` | LB-2: Add MMA test for dense Ising c=1/2 sector (Phase 8) |
| `cft-anyons-pvu` | LB-3: Audit GLOSSARY for fabricated TensorCategories function names (Phase 8) |
| `cft-anyons-d7w` | LB-4: Re-validate `archive/mma-archive-v0-snapshot/` cited paths post-import (Phase 2) |

LB-1 (`cft-anyons-q6h`) remains open from prior session (MMA `enumerate_fusion_trees` multiplicity bug, Phase 8).

---

## Open work

`bd ready` after Phase 1 close:

| ID | Title | Type | Priority | Status |
|---|---|---|---|---|
| `cft-anyons-q6h` | LB-1: MMA `enumerate_fusion_trees` incomplete for non-multiplicity-free | bug | P2 | open (Phase-8-gated; do not fix yet) |
| `cft-anyons-d7w` | LB-4: Re-validate archive paths post-snapshot-import | task | P3 | open (Phase-2-gated) |
| `cft-anyons-pvu` | LB-3: Audit GLOSSARY for fabricated TensorCategories function names | task | P3 | open (Phase-8-gated) |
| `cft-anyons-2ae` | LB-2: Add MMA test for dense Ising c=1/2 sector | task | P3 | open (Phase-8-gated) |
| `cft-anyons-k3s` | Phase 1 epic | epic | P1 | **CLOSED** ✓ (all 11 sub-tasks done) |

**No active in-progress sub-task.** The natural next bd work is filing a Phase-2 epic — but only **after user read-and-approve of the P1.9 audit**.

---

## Gotchas surfaced this session (additions to CLAUDE.md hallucination-risk list)

The session-2 HANDOFF had 16 gotchas. Adding 4 more from this session:

17. **Slug regex must accept uppercase letters.** When writing bulk-edit scripts that walk GLOSSARY `## <slug> —` headers, use `[a-zA-Z][a-zA-Z0-9\-:]*` not `[a-z][a-z0-9\-:]*`. Slugs like `def:Q`, `def:HP`, `def:KS-Ln`, `def:OPE`, `def:RG-amp`, `def:TL-cat`, `def:PF`, `def:Zfunc`, `def:Ageom`, `def:Jinterp`, `def:ising-F`, `def:fib-F` all have uppercase. P1.8's first script run missed 12 of 45 entries because of this — caught immediately by the script's own "expected 45, actually 33" report. Fix took one regex character.

18. **Don't fabricate plausible-sounding TensorCategories.jl API names.** P1.8 reviewer caught `multiplication_table` (which I made up). The actual MMA pattern is `dim(Hom(S[a] ⊗ S[b], S[c]))`. **Lesson:** when writing about an API, grep the source code to confirm the function exists before naming it. LB-3 (`cft-anyons-pvu`) is the bulk-audit follow-up.

19. **"`fsymbols.jl:35`" was wrong for category instantiations.** The TensorCategories.jl constructors `fibonacci_category()`, `ising_category()`, `graded_vector_spaces(Z/2)` are **NOT** called anywhere in MMA's `src/`. They're called in `test/test_categories.jl:7,26,44`. P1.8's first draft cited `src/MobileAnyons/fsymbols.jl:35` for all three (and the line 35 there is the body of `build_fsymbol_cache`, an irrelevant loop assignment). Reviewer caught this in 4 entries (`def:fuscat`, `conv:unitary-default`, `def:fib`, `def:ising`). **Lesson:** for any "X is in file Y at line Z" claim, `head` the file at line Z to confirm. Same hazard class as the P1.7 `def:polar-repair` Mathlib-gap reversal.

20. **HANDOFF gotcha #12 reaffirmed for P1.X where X ≥ 8:** MIGRATION_LOG row belongs in the same atomic commit as the P-step's content change, with `(this)` as the commit-hash placeholder. The next commit backfills the prior row's `(this)` with the actual hash. Pattern: P1.8 commit added a P1.8 row with `(this)`; P1.9 commit backfilled it to `fe96ec7` (and added its own P1.9 row with `(this)`); ... P1.11 commit backfilled P1.10 to `edb547a` (and added P1.11 row with `(this)`). Need a future commit to backfill `(this)` → `76886d2`. **For the next agent: if the very first thing you do is a new commit, please backfill the P1.11 row's `(this)` → `76886d2` in the same commit.**

---

## How to verify repo state on entry

```bash
cd /home/tobias/Projects/cft-anyons
git log --oneline | head -6
# Expected: 76886d2 P1.11; edb547a P1.10; b986495 P1.9; fe96ec7 P1.8; cf80117 prior HANDOFF; d8c0a40 P1.7

git status
# Expected: working tree clean

wc -l GLOSSARY.md CONVENTIONS.md ERRATA.md MIGRATION_LOG.md PROVENANCE.md PRD.md
# Expected: ~2053 ~565 ~143 ~53 ~288 ~279

bd stats
# Expected: 17 issues total, 4 open, 13 closed

bd ready
# Expected: 4 open issues (cft-anyons-q6h LB-1; cft-anyons-d7w LB-4;
#           cft-anyons-pvu LB-3; cft-anyons-2ae LB-2)
# NO in-progress sub-task; Phase 1 epic CLOSED

ls stocktake/reports/opus-*.md
# Expected: prd-v0, prd-v0.1, glossary-p1.1, errata-p1.2, glossary-p1.3,
#           glossary-p1.5, conventions-p1.6, glossary-p1.7,
#           glossary-p1.8, glossary-audit (10 reports)
```

To re-run the D-gate verification (canonical bodies byte-verbatim from `summary.tex`):

```bash
python3 <<'EOF'
import re
g = open('GLOSSARY.md').read()
s = open('summary.tex').readlines()
lines = g.splitlines(keepends=True)
sa_start = next(i for i,l in enumerate(lines) if l.startswith('## §A.'))
sa_end = next(i for i,l in enumerate(lines) if l.startswith('## §B.'))
passes, fails = 0, []
for i in range(sa_start, sa_end):
    m = re.match(r'^## ([a-zA-Z][a-zA-Z0-9\-:]*) —', lines[i])
    if not m: continue
    slug = m.group(1)
    cs = ce = None
    for j in range(i+1, min(i+200, sa_end)):
        if lines[j].rstrip('\n') == '```latex': cs = j+1; continue
        if cs and lines[j].rstrip('\n') == '```': ce = j; break
    if not (cs and ce): continue
    sl = None
    for j in range(ce, min(ce+40, sa_end)):
        sm = re.match(r'^\*\*Source:\*\*\s+`summary\.tex:(\d+)`', lines[j])
        if sm: sl = int(sm.group(1)); break
    if not sl: continue
    block = lines[cs:ce]
    if block == s[sl-1:sl-1+len(block)]:
        passes += 1
    else:
        fails.append(slug)
print(f'D-gate: {passes} PASS / {len(fails)} FAIL')
EOF
# Expected: D-gate: 48 PASS / 0 FAIL
```

---

## What NOT to do this session

- **Do not start Phase 2 work** without user read-and-approve of the P1.9 audit. The most concrete forbidden actions: copying `cft-anyons-deprecated/references/` into `cft-anyons/references/`; importing `microscopic-mobile-anyons/literature/`; touching `CITATION_INDEX.md`; building `scripts/build-citation-index.py`. Per `MIGRATION_PLAN.md:137-139`, these are all "stop and confirm" gated.
- **Do not start Phase 5 work** (Lean migration) or Phase 8 work (Julia migration). LB-1/2/3 are all Phase-8-gated. LB-4 is Phase-2-gated.
- **Do not read `archive/chats/chat*.md`** unless explicitly asked.
- **Do not edit `summary.tex` outside of an ERRATA-tracked atomic commit.**
- **Do not push.** No git remote configured. Mention to user at session-end.
- **Do not assume that "MINOR fixes applied" closes the audit's read-and-approve gate.** The user still needs to read and approve. The audit's APPROVE FOR PHASE 2 is the *recommendation*; the user's read is the *gate*.

---

## Key files / artifacts to know about

| Path | What it is |
|---|---|
| `PRD.md` | **v1** (P1.11 refresh). Entry point — read first. New per-task-class GLOSSARY-entry lists at lines 122-154. |
| `CLAUDE.md` = `AGENTS.md` | Methodology + 11 Rules + hallucination-risk callouts. Unchanged this session. |
| `GLOSSARY.md` | 49 entries, fully populated. All §A canonical bodies byte-verbatim from summary.tex (D-gate 48/48). All MMA + CAD Translation maps populated. |
| `CONVENTIONS.md` | 10 lettered entries (a)–(j). Status block refreshed at P1.9. (a) archive-path citation clarified at P1.9. |
| `ERRATA.md` | 1 entry: `lem:binary-Z` (pre-baseline fix, audit-trail). |
| `PROVENANCE.md` | **Populated at P1.10**. Phase 1 canonical baseline summary table + per-artifact entries + R-gate review-report table + future-schema. |
| `MIGRATION_LOG.md` | All Phase 0 + Phase 1 P-step rows present. P1.11 row has `(this)` placeholder needing backfill to `76886d2` in next commit. |
| `summary.tex` | **Unchanged this session.** `fa4d2059…`. |
| `stocktake/MIGRATION_PLAN.md` | Phase 1 lines 117-139. **All 11 P1.X steps now executed.** Phase 2 spec at lines 143-160. |
| `stocktake/reports/opus-glossary-audit.md` | **Critical: the P1.9 audit** — Phase 2 unblock awaits user read-and-approve. |
| `stocktake/reports/opus-hilbert-bridge.md` | Authoritative source for Hilbert-space framings + CONVENTIONS (g)–(j). |
| `stocktake/reports/cad-lean.md` | Authoritative source for P1.7 CAD bullets. |
| `stocktake/reports/mma-julia.md` | Authoritative source for P1.8 MMA bullets. |
| `stocktake/reports/opus-glossary-p1.{1,3,5,7,8}-review.md` etc. | 10 review/audit reports total. |
| `.beads/issues.jsonl` | 17 issues (was 10 at start of session). Updated before this commit. |

---

## If you only have 5 minutes

Read PRD.md "Mission" + "Status line at the top" + the new "GLOSSARY entries to internalise, by task class" section (lines 122-154). Then `bd ready` to see open follow-ups. Then **stop and wait for user direction on the Phase 2 gate** — don't open the audit report or write code unless asked.

---

## Pattern for the next phase (Phase 2; user-gated)

When the user approves Phase 2 unblock:

1. File a Phase 2 epic: `bd create --title="P2: Phase 2 — Provenance infrastructure (validator imports)" --type=epic --priority=1`.
2. Per `MIGRATION_PLAN.md:143-160`, Phase 2 has 8 steps (P2.1–P2.8) — file as sub-tasks under the epic.
3. **P2.1 = first concrete work**: copy `/home/tobias/Projects/cft-anyons-deprecated/references/` → `/home/tobias/Projects/cft-anyons/references/`. Preserve all subdirs. Validation: M (`diff -r` against source), I.
4. **P2.2 = SHA256 verification**: recompute hashes for every file under `references/`, compare to `references/manifest/SOURCES.md`. Any mismatch is a stop condition.
5. **P2.5 = SQLite integrity**: `sqlite3 literature/db/papers.sqlite "PRAGMA integrity_check;"` + verify row counts match `SYNTHESIS.md` (630 papers, 702 citations).
6. **Pattern continues from P2.6–P2.8**: literature CLI import, CONVENTIONS append, `scripts/build-citation-index.py`.
7. Each P-step gets its own atomic commit + MIGRATION_LOG row + bd close + R-gate review where appropriate per CLAUDE.md Rule 4 tiers.
8. **LB-4 (`cft-anyons-d7w`) reminder**: once snapshot import happens (likely P2.X), re-validate CONVENTIONS (a)'s archive-path citation.

---

## Session close protocol (already executed this session)

- ✓ Filed remaining-work bd issues (LB-2/3/4).
- ✓ Ran D-gate / cross-link / schema-doc / P1.5-intact checks after each commit; all PASS.
- ✓ Closed all 11 Phase-1 sub-tasks; parent epic auto-closed.
- ✓ `bd export -o .beads/issues.jsonl` before each commit (cross-device sync).
- ✓ MIGRATION_LOG.md updated with P1.8/P1.9/P1.10/P1.11 rows; P1.7/P1.8/P1.9/P1.10 `(this)` placeholders backfilled.
- ✓ This HANDOFF rewritten (not appended) per policy.
- ✗ Push to remote — **no git remote configured**. Mention to user.
