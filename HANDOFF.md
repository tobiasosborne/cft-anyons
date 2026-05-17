# HANDOFF — Next Agent (Phases 0–7 COMPLETE; Phase 8 — MMA Julia computational backend — UNBLOCKED, entry point P8.1)

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

**Last updated:** 2026-05-17
**Last session goal:** Execute Phase 7 option (b) end-to-end — fresh `af init` here, port all 67 CAD af nodes with statements made natively correct for this repo (GLOSSARY/CONVENTIONS/PROVENANCE conformance), leave every node unvalidated; then archive CAD meta + tex docs + add af-quickref. **GOAL ACHIEVED.**
**Last commit:** `<P7.6 hash this commit>` (PROVENANCE Phase 7 block + HANDOFF rewrite + Phase 7 close); pushed to origin.
**Repository state:** **Phases 0 through 7 COMPLETE.** Phase-7 epic `cft-anyons-n64` CLOSED. `af/master/` populated with 67 nodes (101 ledger events: 1 init + 67 refines + 23 def_added + 5 claim + 5 release), all pending/unvalidated per user directive. CAD meta + tex archived as non-canonical at `archive/cad-meta-snapshot/`. `docs/af-quickref.md` in place. Lean invariant preserved by construction (Phase 7 touched zero Lean files): `lake build` green at 8467 jobs, 0 sorry, 0 axiom, Mathlib pin `d6dab93`.

---

## Phase status

| Phase | Status | Closing commit |
|---|---|---|
| Phase 0 — Skeleton, bd init, meta-stubs | COMPLETE | `5dd5381` (P0.10) |
| Phase 1 — Definitional bedrock | COMPLETE | `76886d2` (P1.11) |
| Phase 2 — Provenance infrastructure | COMPLETE | `1113ddc` (P2.8) |
| Phase 3 — `\unchecked` discharge | COMPLETE | `ac51316` (P3.4) |
| Phase 4 — Lean `LinearAlgebra/` migration | COMPLETE | `f3a5235` (P4.15) |
| Phase 5 — Lean fusion-category content | COMPLETE | `463049b` (P5.18) |
| Phase 6 — Triple-check scripts | COMPLETE | `f84bc11` (P6.7) |
| **Phase 7 — af workspace (option b)** | **COMPLETE** | `<P7.6>` (this session) |
| Phase 8 — MMA Julia computational backend | **NOT STARTED — UNBLOCKED; entry point P8.1** | — |
| Phase 9 — MMA `finegraining.tex` consolidation | NOT STARTED (HIGH-RISK: NEW MATH integration) | — |
| Phase 10 — Selective archive/v0 extraction | NOT STARTED (depends on STL-1 fix, already locked at P1.6(a)) | — |
| Phase 11 — Final consistency sweep | NOT STARTED | — |

---

## What landed this session (4 commits)

| Commit | Step | What | Reviewer |
|---|---|---|---|
| `c48e5e9` | **P7.2a + P7.2b** | Port-mapping report at `stocktake/reports/af-port-mapping.md` (2803 lines; SHA256 `3e363fd8…`) covering 67/67 CAD af nodes. Reviewer verdict folded inline. | **Opus 4.7 APPROVE 12/12 PASS** (deep D-gate clean for 4 governance nodes; 1 cosmetic slug-count minor applied inline) |
| `946b646` | **P7.2c** | `af init` + 66 `af refine` per Option-B resolution of the mapping (21 full + 25 verbatim + 21 reroute). 5 CAD externals mirrored; 23 GLOSSARY-slug stubs registered via `af def-added` (ledger-only, no GLOSSARY.md edit). 67/67 nodes pending; 0 validated/admitted/refuted/archived. | mechanical (Rule 4 exempt) |
| `947e7a0` | **P7.3 + P7.4 + P7.5** | Archive CAD meta (4 files) + CAD tex (2 files) to `archive/cad-meta-snapshot/`; add `archive/cad-meta-snapshot/README.md` (86 lines) declaring non-canonical status; copy `stocktake/reports/af-cli-reference.md` → `docs/af-quickref.md`. 7 source→dest SHA256s all match. | mechanical (Rule 4 exempt) |
| `<P7.6>` | **P7.6** | PROVENANCE.md Phase-7 block + HANDOFF rewrite + Phase-7 epic close (manual, per HANDOFF Lesson 11 — children independently named, no `n64.<N>` suffix). Remove `archive/cad-meta-snapshot/.gitkeep` (gotcha #50). | mechanical (Rule 4 exempt) |

**Push status:** all 4 commits pushed to `origin/main`. Working tree clean.

**Lean invariant preserved by construction throughout Phase 7:** zero Lean files touched. `lake build` not re-run this session (no need to — no Lean delta).

---

## 🚨 IMMEDIATE NEXT ACTION — Phase 8 P8.1 (definitional-bridge audit, Opus)

Per `MIGRATION_PLAN.md:265–280` Phase 8:

> **P8.1 — Definitional bridge audit (Opus)**. Spawn an Opus agent to read MMA's `src/MobileAnyons/{config,hilbert,fsymbols,operators,interaction,braiding,paircreation,finegraining,wavelets,virasoro}.jl` and confirm: (a) every fundamental concept maps to a GLOSSARY entry, (b) the involutory F-matrix gauge convention is correctly handled, (c) any divergence from CONVENTIONS.md (vacuum index, etc.) is documented. Pre-fed inputs: the seven conventions in `stocktake/reports/opus-hilbert-bridge.md` §4 are pre-flagged; the auditor's job is to confirm each is correctly applied throughout MMA, not to rediscover them. Output to `stocktake/reports/opus-mma-julia-bridge.md`.

This is the entry-point. P8.2 onward depends on P8.1 verdict; P8.3 imports `Project.toml`/`Manifest.toml`; P8.4–P8.7 do the per-file Julia ports; P8.8 runs full `Pkg.test()`; P8.9 PROVENANCE refresh.

LB-1 / LB-2 / LB-3 carryover bd issues (`cft-anyons-q6h`, `cft-anyons-2ae`, `cft-anyons-pvu`) will surface during Phase 8 and have pre-filed tracking.

---

## 🆕 Lessons learned this session — propagate forward

**Lesson 16: Subagent worktree mode can be triggered automatically.** A Phase-7 P7.2c executor (no `isolation: "worktree"` set by orchestrator) ended up committing on a worktree branch (`worktree-agent-a41f8d1edd8ca8222`) which the orchestrator then had to fast-forward-merge into main. The pattern still works (FF merge is clean) but the orchestrator pays a CWD-management tax (need `cd /home/tobiasosborne/Projects/cft-anyons` explicitly after the merge to escape the deleted worktree path). **Rule of thumb for next session**: tell housekeeping subagents explicitly "no worktree; work directly in the main repo" if you want to avoid the FF-merge dance.

**Lesson 17: af v0.1.3 enforces a citation-parser gate that requires registered `def`s for `[[def:slug]]` references.** The P7.2c implementer correctly resolved this by issuing 23 `af def-add` calls per distinct GLOSSARY slug cited across the 67 statements, registering ledger-only stubs (no GLOSSARY.md edit). Pattern is reusable for future af content. The stubs are literal "see GLOSSARY.md ## slug" pointers — they do NOT add mathematical content; they satisfy af's parser.

**Lesson 18: Mapping reports can use shorthand `**Updated statement:** (verbatim — ...)` or `**Updated statement:** (verbatim with X→Y reroute)` patterns to keep the report compact.** The P7.2c executor correctly STOPPED rather than passing the parenthetical meta-text literally to `af refine`. The right resolver: pull from Original + apply the parenthetical-specified substitutions. Future mapping-style implementers should be told this resolver pattern explicitly in the brief (one P7.2c re-dispatch was needed because the original brief didn't anticipate the shorthand format).

**Lesson 19: For meta-doc work (PROVENANCE refresh, HANDOFF rewrite, Phase-close commits), orchestrator-direct (no subagent) is the right call.** The Phase-7 close P7.6 was authored in-context by the orchestrator who had all the per-step SHA256s + reviewer verdicts + bd state already loaded. Dispatching a subagent for this would have required re-feeding the entire session's context. **Rule of thumb**: subagent for substantive implementer work; orchestrator-direct for synthesis / phase-close / docs-aggregation.

**Lesson 20: When file-only-cd is required after a worktree removal, the bash CWD persistence can leave you inside a now-nonexistent path; commands then fail with "No such file or directory" until you explicitly `cd` back.** Encountered twice this session. **Rule of thumb**: after `git worktree remove`, the next bash call should start with `cd /home/tobiasosborne/Projects/cft-anyons && …` to reset CWD.

**Lesson 21: af workspace lives at `/home/tobiasosborne/Projects/cft-anyons/af/master/` and is queried via `cd af/master && af status` (or `af progress` for numerics). af is workspace-cwd-sensitive** (looks for `ledger/` in `$PWD`).

---

## REVISED reusable implementer briefing template (paste into Agent prompt)

(Unchanged from prior HANDOFF — still valid for Phase 8 / 9 / etc. Lean ports if/when those happen.)

```
Implementer for **MIGRATION_PLAN PX.Y** — port <source-path> → <dest-path> (~<LOC> LOC).
Template: most recent commit <hash>.

## Brief pre-reads
1. CLAUDE.md Rules 4, 5, 8.
2. stocktake/MIGRATION_PLAN.md line ~<N> (PX.Y row).
3. MIGRATION_LOG.md recent rows (DO NOT run `lake update`).
4. git show <prev hash> (template).
5. GLOSSARY.md — search for pre-bindings of this file. Cite verbatim if found.
6. <source-path>.

## Hard rules
- No `lake update`. Only `lake build` (+ `lake exe cache get` if cache miss).
- Port body VERBATIM. Only addition: top-of-file GLOSSARY-ref docstring block.
- 0 sorry / 0 axiom (load-bearing). Avoid `\baxiom\b` in docstring prose
  (prefer plural "axioms" or "condition" / "equation").
- Touch ONLY: <dest-path> (new), Formalisation.lean (+1 import line),
  MIGRATION_LOG.md (+1 chronological row), .beads/issues.jsonl.
- No push / amend / rebase / --no-verify.
- Tight decl-grep INCLUDES `structure`:
  grep -cE "^(theorem|lemma|abbrev|instance|noncomputable def|def|example|structure) " file
- bd close --reason (NOT --notes). bd create --type (NOT --issue-type).
- No NEW GLOSSARY entries — STOP and escalate if needed.
- NO worktree — work directly in /home/tobiasosborne/Projects/cft-anyons (Lesson 16).
```

(Reviewer template unchanged; see prior HANDOFF in git history at `3ca81bf`.)

---

## Accumulated gotchas (cumulative across all phases)

(Continuing from prior HANDOFF; new entries this session are #54+.)

32. **`lake update` is destructive.** Use only `lake build` + `lake exe cache get`.
33. **`CFTAnyons` namespace + `lean_lib Formalisation` requires a root file** — `Formalisation.lean` placeholder.
34. **Source CAD `Formalisation.lean` is post-Phase-5** — don't copy verbatim.
35. **Decl-count grep over-counts `noncomputable section`** — use tight grep.
36. **MIGRATION_LOG row order** — implementers insert wrong, awk-swap to correct.
37. **bd auto-closes the epic when its last open child closes** — IF children share the `<epic>.<N>` suffix naming convention. **NOT if children are independently named** (Lesson 11) — manual epic close required at end. Applied at P7.6 (Phase-7 epic `cft-anyons-n64` manually closed).
38. **`bd close --notes` is invalid; use `--reason`**.
39. **`pdflatex` steady state is 3-pass.**
40. **2 CITATION_INDEX SRC-* mapping bugs persist** (`cft-anyons-eit`, `cft-anyons-es5`).
41. **`.lake/` is 7.1 GB** — gitignored.
42. **Tight decl-grep was missing `structure`** (P4.11 lesson) — upgraded pattern now standard.
43. **Write tool can leak XML/tool markup** — implementers post-grep + Edit-fix.
44. **`bd create --issue-type` is wrong; use `--type`**.
45. **A pre-existing untracked port file** may show up — diff vs source; adopt if body byte-identical; REPLACE if body differs.
46. **Two reviewer subagents in parallel is safe** (read-only).
47. **Docstring narrative attribution** can be sub-MINOR over-broad without being mathematically wrong.
48. **Pre-existing `unit-axiom` hyphenated docstring prose** matches `\baxiom\b` regex (P5.18 finding).
49. **bd description suggestions can be wrong** — verify empirically.
50. **`scripts/{julia,wolfram}/`, `results/`, `archive/cad-meta-snapshot/`, `af/` had `.gitkeep` placeholders** — delete when populating with real content (applied at P6.1/P6.2, P7.2c, P7.6).
51. **No `Project.toml` at repo root** — the 25 Julia cross-check scripts are stdlib-only.
52. **`bd dep add` rejects epic→task edges** — use suffix naming for auto-close, or accept manual epic close.
53. **Wolfram via TIB VPN is reliable in steady state.**
54. **Subagent worktree mode can be triggered automatically** (Lesson 16) — FF-merge from main; CWD-management tax.
55. **af v0.1.3 has a citation-parser gate** (Lesson 17) — register `def`s with `af def-add` for each `[[def:slug]]` in node statements (ledger-only, no GLOSSARY.md edit).
56. **Mapping reports may use shorthand `**Updated statement:** (verbatim — …)` / `(verbatim with X→Y reroute)`** (Lesson 18) — resolver must pull from Original + apply parenthetical substitution.
57. **CWD persists across bash calls** (Lesson 20) — after `git worktree remove`, explicit `cd /home/tobiasosborne/Projects/cft-anyons` required next call.
58. **af is workspace-cwd-sensitive** (Lesson 21) — `cd af/master && af status`; `af` looks for `ledger/` in `$PWD`.

---

## What NOT to do (next session)

- **DO NOT run `lake update`.** Period.
- **DO NOT modify `lake-manifest.json`, `lakefile.lean`, or `lean-toolchain`** — set in P4.1 and must stay byte-identical through Phase 11.
- **DO NOT introduce `sorry` or `axiom`** in any Lean file — load-bearing invariant.
- **DO NOT touch the 14 forbidden files** during ports (`summary.tex`, `GLOSSARY.md`, `CONVENTIONS.md`, `ERRATA.md`, `PROVENANCE.md`, `PRD.md`, `CLAUDE.md`, `AGENTS.md`, `HANDOFF.md`, `README.md`, `CITATION_INDEX.md`, `RESEARCH_NOTES.md`, `lakefile.lean`, `lean-toolchain`, `lake-manifest.json`) — EXCEPT for Phase-close PROVENANCE refreshes (P4.15 / P5.16 / P6.7 / P7.6 precedent) and Rule-8-lockstep updates.
- **DO NOT add new GLOSSARY entries** to satisfy port D-gates without escalating first. Phase 8 (MMA Julia import) and Phase 9 (`finegraining.tex` new math) will likely surface needs — STOP and ask.
- **DO NOT push CAD as public**; CAD is the local source repo.
- **DO NOT run `bd init --force`** (destroys issue history).
- **DO NOT skip the deep D-gate** in reviewer briefs for substantive content.
- **DO NOT parallelize two implementers** — they race on shared meta files (`Formalisation.lean`, `MIGRATION_LOG.md`, `.beads/issues.jsonl`).
- **DO NOT validate / accept / admit / archive af nodes** without explicit user direction. Phase 7 left every node unvalidated per user directive; any change to that state is a P7.2d or later step that requires the user's call.

---

## bd state at session end

- **Total**: 103 issues / 12 open / 0 in_progress / 0 blocked / 91 closed / 12 ready-to-work.
- **Phase-7 epic** `cft-anyons-n64`: **CLOSED** (manually closed at P7.6 — children independently named, not `n64.<N>` suffixed, per gotcha #37).
- **Phase-7-residual open issue**: `cft-anyons-crg` (P7.2d, cosmetic — node 1.5.5 WZW substitution-key mismatch; mathematics unaffected; not a blocker).
- **No issues block any Phase-8 work.** The other 11 open issues are P2/P3 carryover follow-ups (same as at Phase-6 close):
  - `cft-anyons-eit` (P2) — SRC-OSBORNE-CONTINUUM mis-mapped in build-citation-index.py
  - `cft-anyons-es5` (P2) — SRC-STRING-NET mis-mapped
  - `cft-anyons-umx` (P2) — CITATION_INDEX line lists are author-name occurrences
  - `cft-anyons-q6h` (P2, Phase-8-gated) — **LB-1**: MMA `enumerate_fusion_trees` multiplicity bug; surfaces in P8.4
  - `cft-anyons-6ku` (P3) — YAML-promote build-citation-index.py editorial decisions
  - `cft-anyons-d2v` (P3) — MIGRATION_PLAN.md:157 doc-sync
  - `cft-anyons-qi0` (P3) — P2.5 `>=` vs `==` Deviations entry
  - `cft-anyons-wfr` (P3) — hard-coded path in scripts/check-references-sha256.py
  - `cft-anyons-2ae` (P3, Phase-8-gated) — **LB-2**: MMA test for dense Ising c=1/2 sector
  - `cft-anyons-pvu` (P3, Phase-8-gated) — **LB-3**: GLOSSARY audit for fabricated TensorCategories function names
  - `cft-anyons-d7w` (P3, Phase-2-followup) — **LB-4**: archive-path re-validate

---

## Quick orientation (5–10 min)

1. **`PRD.md`** — entry point.
2. **`CLAUDE.md`** (= `AGENTS.md`) — methodology + 11 Rules.
3. **This file (`HANDOFF.md`)** — current state.
4. **`stocktake/MIGRATION_PLAN.md` lines 265–280** — Phase 8 plan (9 atomic steps; P8.1 is the Opus definitional-bridge-audit entry point).
5. **`git log --oneline f84bc11..HEAD`** — see the 4 Phase-7 commits from this session (P7.2a → P7.6).
6. **`MIGRATION_LOG.md`** — most recent rows (P7.6 / P7.3+P7.4+P7.5 / P7.2c / P7.2a / P6.7 / … older rows below).
7. **`PROVENANCE.md`** — newly populated Phase 7 block (af workspace SHA256s, archive-snapshot SHA256s, af-quickref SHA256, decision-record, epistemic-state record `af progress` verbatim, Phase-7 close note).
8. **`af/master/`** — populated workspace. `cd af/master && af status` shows 67 nodes pending. `af progress` confirms 0 validated.
9. **`stocktake/reports/af-port-mapping.md`** — the 2803-line per-node mapping that drove P7.2c (kept for posterity and any future P7.2d refinements).
10. **`bd ready`** — Phase 7 epic CLOSED; the 12 open issues are P2/P3 carryover (none block Phase 8) + the new `cft-anyons-crg` cosmetic followup.

**First concrete action**: dispatch the **P8.1 definitional-bridge-audit Opus subagent**. Brief: read MMA's 10 Julia files at `/home/tobiasosborne/Projects/microscopic-mobile-anyons/src/MobileAnyons/`, confirm GLOSSARY-entry coverage + involutory-gauge convention handling + CONVENTIONS-letter conformance per `stocktake/reports/opus-hilbert-bridge.md` §4. Output to `stocktake/reports/opus-mma-julia-bridge.md`. Pre-feed: `PRD.md`, `CLAUDE.md`, `GLOSSARY.md`, `CONVENTIONS.md`, `stocktake/reports/opus-hilbert-bridge.md`, `RESEARCH_NOTES.md` (for LB-1 context). Stop conditions: any divergence from CONVENTIONS that can't be reconciled via translation rules — escalate.

---

## Session close protocol checklist (this session)

- ✓ Phase 7 executed end-to-end (P7.2a → P7.6, 4 atomic commits).
- ✓ Per-commit M / R / I gates verified at each step (deep D-gate exercised at P7.2b; mechanical-exempt elsewhere per Rule 4).
- ✓ Lean invariant preserved by construction throughout (zero Lean files touched in Phase 7).
- ✓ af workspace populated and verified: 67 nodes pending, 0 validated/admitted/refuted/archived, exactly per user directive "leave every node unvalidated".
- ✓ Phase-7 bd epic `cft-anyons-n64` CLOSED (manually, per gotcha #37 since children are independently named).
- ✓ MIGRATION_LOG updated with P7.2a / P7.2c / P7.3+P7.4+P7.5 / P7.6 rows.
- ✓ PROVENANCE.md updated with Phase 7 block.
- ✓ `.beads/issues.jsonl` snapshot exported in every bd-touching commit.
- ✓ HANDOFF rewritten (this file).
- ✓ Push: all 4 commits pushed to `origin/main` at session close.

**Hand-off note**: this session ran 4 subagent dispatches (1 mapper + 1 reviewer + 1 executor + 1 housekeeping) + orchestrator-direct synthesis for P7.6. Total session wall time: ~25 min for 4 commits including the P7.2c re-dispatch (shorthand-resolution clarification). The pattern "subagent for substantive implementer work + orchestrator-direct for phase-close/synthesis" worked cleanly; will reuse for Phase 8 (per-file Julia imports — definitely Opus implementer + reviewer per file, following the Phase-4/5 pattern + the P8.1 bridge-audit subagent first).
