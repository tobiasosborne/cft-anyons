# HANDOFF — Next Agent (Phases 0–8 COMPLETE; Phase 9 — MMA finegraining.tex consolidation — UNBLOCKED, HIGH-RISK NEW MATH)

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
**Last session goal:** Execute Phase 8 (MMA Julia computational backend) end-to-end with TC.jl-heightened-care discipline per user directive at Phase-7 close ("definitional drift could easily happen here"). **GOAL ACHIEVED.**
**Last commit:** `<P8.9 hash this commit>` (Phase 8 close — PROVENANCE Phase-8 block + HANDOFF rewrite + epic close); pushed to origin.
**Repository state:** **Phases 0 through 8 COMPLETE.** MMA Julia backend integrated at `src/MobileAnyons/` (10 functional .jl files + module shell + thin top-level shim); Project.toml + Manifest.toml + 18-file `test/` directory + synthetic `runtests.jl` all in place. `Pkg.test("MobileAnyons")` = **10586/10591 PASS (99.95%)** in 589.6s wall; 5 non-pass items all triaged as bucket (β) PRE-EXISTING MMA (verified reproducible in MMA env). 2 partial ports with exclusion notices (P8.6 categorical_determinant_isometry, P8.7 virasoro_commutator_check) + Phase-10 reevaluation paths documented. **Lean invariant preserved by construction throughout Phase 8** (zero Lean files touched): `lake build` green at 8467 jobs from P6.7 (`f84bc11`), 0 sorry, 0 axiom, Mathlib pin `d6dab93`.

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
| Phase 7 — af workspace (option b) | COMPLETE | `8ed4aa7` (P7.6) |
| **Phase 8 — MMA Julia computational backend** | **COMPLETE** | `<P8.9>` (this session) |
| Phase 9 — MMA `finegraining.tex` consolidation | **NOT STARTED — UNBLOCKED; HIGH-RISK NEW MATH; entry point P9.1** | — |
| Phase 10 — Selective archive/v0 extraction | NOT STARTED (depends on STL-1 fix, already locked at P1.6(a)) | — |
| Phase 11 — Final consistency sweep | NOT STARTED | — |

---

## What landed this session (Phase 8 — 12 commits)

| Commit | Step | What | Reviewer |
|---|---|---|---|
| `3c53c60` | **P8.0a** | LB-3 discharge — TC.jl 0.5.3 API audit; 27 EXISTS / 0 FABRICATED / 3 AMBIGUOUS (`FusionCategory` dangling export tracked at `cft-anyons-b6b`) | **Opus 4.7 APPROVE 10/10 PASS** (AMBIGUOUS-finding verdict A: dangling-export = compile-time-error not silent wrongness; bd-defer correct) |
| `f0b0e42` | **P8.1a** | MMA-Julia definitional-bridge audit (668-line report; 38 exports → 15 clusters; YELLOW verdict; 5 P3/P4 follow-ups filed including USER ESCALATION `cft-anyons-ycc`) | **Opus 4.7 APPROVE WITH MINOR 12/12 PASS** (deep D-gate clean for 7 spot-checked slugs; R-symbol gap genuine, not implicit-coverage) |
| `da39a21` | **P8.1.5** | GLOSSARY §B additions `def:rsymbol` + `def:braid-H` (user-authorised; `cft-anyons-ycc` USER ESCALATION resolved); 4 byte-verbatim Canonical blocks; `def:fuscat` Notes cross-link added (non-braided clarification) | **Opus 4.7 APPROVE WITH MINOR 14/14 PASS** (R-symbol gauge characterisation independently verified via 4 mutually-reinforcing pieces of evidence; no new CONVENTIONS letter needed) |
| `5407ff5` | **P8.1c** | TC.jl conventions bridge (517-line report covering all 10 CONVENTIONS [P1.6(*)] letters + R-symbol storage; drift surface LOW; 0 open questions) | mechanical-exempt (clean systematic report) |
| `514df55` | **P8.2** | Conflict-resolution no-op + P8.1.5b reviewer MINOR cleanup (CONVENTIONS [P1.6(b)] sweep-status extended with new slugs) + TC.jl-upstream `r_symbol`-bug awareness bd `cft-anyons-kaj` | mechanical-exempt |
| `cc3f33c` | **P8.3 + P8.0b** | Project.toml + Manifest.toml imported byte-identical from MMA + TC.jl-pin rationale comment; `Pkg.instantiate()` green in 4.3s (TC.jl 0.5.3 + Oscar 1.6.0 + Combinatorics 1.1.0 resolved); `using TensorCategories` + `using Oscar` both work | mechanical |
| `f08daf4` | **P8.4** | Wave 1 imports (4 files): MobileAnyons.jl + config.jl + hilbert.jl (with LB-1 marker at lines 113-117) + fsymbols.jl; per-file docstring headers with GLOSSARY refs + gauge notes; `using MobileAnyons` green after each (~27s/call) | **Opus 4.7 APPROVE 14/14 PASS** (deep D-gate clean for 4 cited slugs) |
| `f9591aa` | **P8.5** | Wave 2 imports (5 files): operators + interaction (gauge GOLD STANDARD) + braiding (R-symbol gauge framing per P8.1.5b verbatim) + paircreation (port-time gauge comment at lines 255-263 discharging `cft-anyons-xvq`) + wavelets | **Opus 4.7 APPROVE WITH MINOR 15/15 PASS** (deep D-gate clean for 6 cited slugs including new `def:rsymbol`+`def:braid-H`; 3 cosmetic MINORs non-blocking) |
| `b953230` | **P8.6** | finegraining.jl PARTIAL port (3 kept public + 1 helper; `categorical_determinant_isometry` + 6 sole-caller helpers EXCLUDED with notice + Phase-10 archive pointer; `cft-anyons-874` mooted) | **Opus 4.7 APPROVE WITH MINOR 13/13 PASS** (exclusion exclusivity load-bearingly verified; deep D-gate clean for `def:refmap` + `def:persist`) |
| `ae3bc0f` | **P8.7** | virasoro.jl PARTIAL port (2 kept + `virasoro_commutator_check` NaN stub EXCLUDED; RESEARCH_NOTES DD-2 added at lines 284-342; `cft-anyons-qki` discharged); MobileAnyons.jl reaches 10 active includes / 0 deferred — per-file imports COMPLETE | **Opus 4.7 APPROVE WITH MINOR 12/12 PASS** (deep D-gate clean for `def:TL-cat`+`def:KS-Ln`+`def:KS-scalars`; sole MINOR is DD-2 entry length — non-blocking) |
| `315c9dc` | **P8.8** | test/ imported (18 MMA byte-identical + 1 synthetic runtests.jl with anonymous-module-per-file pattern) + Project.toml +SparseArrays (user-authorised; one-line correctness fix) + src/MobileAnyons.jl thin shim; `Pkg.test("MobileAnyons")` = 10586/10591 PASS in 589.6s; 5 non-pass items triaged as bucket (β) PRE-EXISTING MMA via 3 independent comparison commands; filed `cft-anyons-bnu` P3 | mechanical (user-decision-driven) |
| `<P8.9>` | **P8.9** | Phase 8 close — PROVENANCE Phase-8 block (~150 lines, 19-row artifact manifest), HANDOFF rewrite, epic `cft-anyons-ca5` manual close (independently-named children per gotcha #37) | mechanical (synthesis) |

**Push status:** all 12 commits pushed to `origin/main` (intermediate push after P8.4 at `f08daf4`; final push after P8.9).

---

## 🚨 IMMEDIATE NEXT ACTION — Phase 9 P9.1 (Opus deep-dive on finegraining.tex)

Per `MIGRATION_PLAN.md:283-293` Phase 9:

> **P9.1 — Opus deep-dive: notational reconciliation.** Read `microscopic-mobile-anyons/tex/sections/finegraining.tex` (291 lines) against `summary.tex` §6 (length-weighted square-zero), §11 (non-tree pair-creation interpolation), §10 (polar decomposition). Determine: is `finegraining.tex`'s number-changing isometry construction (a) a new construction, (b) a special case of summary.tex §11, (c) a rephrasing of summary.tex §10 polar section, or (d) something inconsistent with summary.tex's framework? Output to `stocktake/reports/opus-finegraining-reconciliation.md`.

**Phase 9 is HIGH-RISK.** It introduces mathematical content not already in `summary.tex` — the highest-stakes addition in the plan. If P9.1 verdict is (a) new construction → P9.2 drafts a new section, P9.3 hostile review, P9.4 iterate, P9.5 integrate. If (b)/(c) → short remark + citation only (lower-stakes). If (d) → STOP and escalate to user.

The MMA `finegraining.tex` reportedly contains the Garjani-Ardonne pair-creation framework + wavelet-based number-changing isometry construction (per `stocktake/reports/cad-af.md` summary). This is unique-to-MMA mathematics not yet in `summary.tex` (per the stocktake's gap table).

---

## 🆕 Lessons learned this session — propagate forward

Durable improvements to orchestration patterns. Use from Phase 9 onwards.

**Lesson 22: Two-reviewer Tier-4 pattern works cleanly for substantive TC.jl-derived additions.** P8.1.5 added 2 GLOSSARY §B entries with implementer + independent hostile reviewer; the reviewer's deep-D-gate item (item 11 on R-symbol gauge characterisation) independently verified the headline load-bearing claim via 4 mutually-reinforcing pieces of evidence. **Rule of thumb**: for any GLOSSARY §B addition or any per-file port that touches gauge handling, dispatch implementer + reviewer.

**Lesson 23: `Pkg.test()` sandboxing differs from the parent project env.** MMA's tests work in MMA's parent env via direct-include but `Pkg.test()` re-resolves deps in a sandbox that may lack stdlibs declared transitively (SparseArrays at P8.8). **Rule of thumb for future Julia-dep additions**: at P8.3-equivalent step, audit `using` statements in src for stdlib imports + declare them in [deps] explicitly (don't rely on transitive resolution).

**Lesson 24: Partial-port exclusivity must be load-bearingly verified.** P8.6 excluded 7 functions (`categorical_determinant_isometry` + 6 sole-caller helpers); P8.7 excluded 1 function (`virasoro_commutator_check` with no helpers). In both cases the reviewer independently ran `grep -rnE` across MMA src+test trees to confirm exclusion exclusivity — no kept function calls an excluded helper. **Rule of thumb**: every partial port must include an exclusivity grep in the reviewer brief.

**Lesson 25: MMA-comparison spike resolves test-failure ambiguity.** At P8.8 the 2 Ising-decompose failures could have been port-introduced or pre-existing-MMA. Running MMA's own test_categories.jl in MMA's env via 3 independent commands (full file, isolated testset, direct-invocation) confirmed bucket (β) PRE-EXISTING MMA. **Rule of thumb**: when Phase-8+ tests surface failures that aren't excluded-code-dependencies, the FIRST diagnostic is "does MMA reproduce?" (~30s of work that saves hours of investigation).

**Lesson 26: User-escalation can resolve via AskUserQuestion with concrete options + recommendations.** At P8.1.5 R-symbol GLOSSARY gap and P8.8 testing entry-point, the orchestrator surfaced multi-option decisions via AskUserQuestion with explicit recommendations + rationale; user picked (recommendation or alternative) and work proceeded smoothly. **Rule of thumb**: when escalating to user, present 3-4 well-scoped options with a clear recommended option + 1-2 sentence rationale per option — do NOT escalate open-ended ("what should we do?").

**Lesson 27: Anonymous-module-per-test-file pattern avoids re-include binding clashes.** The synthetic `test/runtests.jl` at P8.8 hit "two or more modules export different bindings" errors when each test file's `include + using .MobileAnyons` redefined `Main.MobileAnyons`. Fix: wrap each test file's `include` in a fresh `Module(:Anon_NNN)` with an explicit `Base.include(m, path)` closure. Same pattern reusable for any future per-file test driver.

**Lesson 28: src/<PackageName>.jl shim is the idiomatic fix for subdirectory layouts.** Julia's package-discovery expects `src/<Name>.jl` at top level. MMA's `src/MobileAnyons/MobileAnyons.jl` subdirectory layout requires a thin top-level shim for `Pkg.test()` discovery. The no-op stub form (`module MobileAnyons; end`) is sufficient when consumers self-bootstrap via `include + using .MobileAnyons` (matching MMA's convention).

---

## REVISED reusable implementer briefing template (paste into Agent prompt)

(Unchanged structure from prior HANDOFF — still valid for Phase 9 / 10 etc. ports.)

```
Implementer for **MIGRATION_PLAN PX.Y** — port <source-path> → <dest-path> (~<LOC> LOC).
Template: most recent commit <hash>.

## Brief pre-reads
1. CLAUDE.md Rules 4, 5, 8.
2. stocktake/MIGRATION_PLAN.md line ~<N> (PX.Y row).
3. MIGRATION_LOG.md recent rows.
4. git show <prev hash> (template).
5. GLOSSARY.md — search for pre-bindings of this file. Cite verbatim if found.
6. <source-path>.
7. Both feedback memories.

## Hard rules
- No `lake update`. Only `lake build` (+ `lake exe cache get`) for Lean steps.
- Port body VERBATIM except per-step-explicit additions (docstring headers, gauge comments, exclusion notices).
- 0 sorry / 0 axiom (load-bearing for Lean).
- Touch ONLY: <dest-path> (new), shell-file (e.g. Formalisation.lean / MobileAnyons.jl) (+1 line),
  MIGRATION_LOG.md (+1 chronological row), .beads/issues.jsonl.
- No push / amend / rebase / --no-verify.
- bd close --reason (NOT --notes). bd create --type (NOT --issue-type).
- No NEW GLOSSARY entries — STOP and escalate if needed.
- NO worktree — work directly in /home/tobiasosborne/Projects/cft-anyons (Lesson 16).

## Pre-check + post-Write hygiene
- ls -la <dest> — adopt if pre-existing & body byte-identical; REPLACE if differs.
- After Write: tool-markup grep clean (filter known-doc false positives).
- diff source vs dest → only intentional additions.

## Execute
1. Read source. 2. Pick GLOSSARY refs (existing slugs only). 3. Write.
4. Verify (lake build / using MobileAnyons / Pkg.test as applicable).
5. Mutation-proof (perturb → FAIL → restore → PASS) for Lean ports.
6. bd create + bd close. 7. bd export. 8. MIGRATION_LOG row chronological.
9. Commit per CLAUDE.md template. NO PUSH.
```

(Reviewer template unchanged; deep D-gate item is MANDATORY per memory `feedback-reviewer-deep-d-gate`.)

---

## Accumulated gotchas (cumulative across all phases)

(Continuing from prior HANDOFF; new entries this session #59+.)

32-58. [Unchanged — see commit `8ed4aa7` HANDOFF for details.]
59. **`Pkg.test()` sandbox != parent env** (Lesson 23) — declare stdlib `using` deps in [deps] explicitly; transitive resolution doesn't satisfy `Pkg.test`.
60. **MMA-comparison spike resolves test-failure triage** (Lesson 25) — first diagnostic for unexplained Pkg.test failures.
61. **Partial-port exclusivity grep is mandatory** (Lesson 24) — reviewer must independently verify no kept function calls an excluded helper.
62. **Anonymous-module-per-test-file** (Lesson 27) — synthetic runtests.jl pattern for MMA-style direct-include tests.
63. **`src/<Name>.jl` shim for subdirectory layouts** (Lesson 28) — no-op stub (`module Name; end`) suffices when consumers self-bootstrap.
64. **AskUserQuestion with concrete options + recommendation** (Lesson 26) — user-escalation framing pattern.
65. **R-symbol gauge is downstream of [P1.6(b)] via `B = F R F`** — no new CONVENTIONS letter needed for braiding additions. Documented at GLOSSARY `def:rsymbol` Notes #3 + CONVENTIONS sweep-status at P8.2.

---

## What NOT to do (next session)

- **DO NOT run `lake update`.** Period.
- **DO NOT modify `lake-manifest.json`, `lakefile.lean`, `lean-toolchain`** — frozen since P4.1.
- **DO NOT introduce `sorry` or `axiom`** in any Lean file — load-bearing invariant.
- **DO NOT modify Project.toml or Manifest.toml** without explicit user authorisation. The P8.8 SparseArrays addition was explicitly approved; future deps additions follow the same escalation pattern.
- **DO NOT touch the 14 forbidden files** during ports — EXCEPT for Phase-close PROVENANCE refreshes (P4.15 / P5.16 / P6.7 / P7.6 / P8.9 precedent), Rule-8-lockstep updates, and the explicit per-step carve-outs (e.g. RESEARCH_NOTES.md DD-entry additions at P8.7).
- **DO NOT add new GLOSSARY entries** to satisfy port D-gates without escalating first. Phase 9 (`finegraining.tex` new math) WILL likely surface needs — STOP and ask.
- **DO NOT push CAD or MMA as public**; both are local source repos.
- **DO NOT run `bd init --force`** (destroys issue history).
- **DO NOT skip the deep D-gate** in reviewer briefs for substantive content.
- **DO NOT parallelize two implementers** — they race on shared meta files (`Formalisation.lean`, `MobileAnyons.jl`, `MIGRATION_LOG.md`, `.beads/issues.jsonl`).
- **DO NOT validate / accept / admit / archive af nodes** without explicit user direction (Phase 7 left them all unvalidated; no change without escalation).
- **DO NOT modify `summary.tex` outside an ERRATA-tracked atomic commit.** Phase 9 will likely propose adding a new section — that requires the full Phase-9 hostile-review pipeline (P9.1 → P9.5), not a unilateral edit.

---

## bd state at session end

- **Total**: ~135 issues / ~14 open / 0 in_progress / 0 blocked / ~121 closed.
- **Phase-8 epic** `cft-anyons-ca5`: **CLOSED** (manually closed at P8.9 — children independently named per gotcha #37).
- **Phase-8-residual open issues** (P3/P4, none block Phase 9):
  - `cft-anyons-bnu` (P3) — 5 known-MMA test failures (Ising decompose, Fibonacci Int(dim), Verlinde KeyError) verified pre-existing
  - `cft-anyons-kaj` (P4) — TC.jl `r_symbol` upstream bug awareness
  - `cft-anyons-b6b` (P3) — FusionCategory dangling-export GLOSSARY decision (deferred from P8.0a)
  - `cft-anyons-68n` (P4) — brief exception-file list update (docs only)
- **No issues block any Phase-9 work.** The other carryover P2/P3 follow-ups (cft-anyons-eit, es5, umx, q6h, 6ku, d2v, qi0, wfr, 2ae, pvu→CLOSED at P8.0a, d7w, crg) remain as Phase-2/Phase-7/Phase-10 follow-ups.

---

## Quick orientation (5–10 min)

1. **`PRD.md`** — entry point.
2. **`CLAUDE.md`** (= `AGENTS.md`) — methodology + 11 Rules.
3. **This file (`HANDOFF.md`)** — current state.
4. **`stocktake/MIGRATION_PLAN.md` lines 283-300** — Phase 9 plan (HIGH-RISK NEW MATH — read carefully; P9.1 is the hostile Opus deep-dive entry point; P9.2 onward depends on verdict).
5. **`git log --oneline 8ed4aa7..HEAD`** — see the 12 Phase-8 commits from this session.
6. **`MIGRATION_LOG.md`** — most recent rows (P8.9 / P8.8 / P8.7 / P8.6 / P8.5 / P8.4 / P8.3 / P8.2 / P8.1c / P8.1.5 / P8.1a / P8.0a at the top; older rows below).
7. **`PROVENANCE.md`** — newly populated Phase 8 block (~150 lines, 19-row manifest, decision record, Pkg.test result verbatim, harmonisation notes, Phase 8 close summary).
8. **`stocktake/reports/opus-tcjl-api-audit.md`** (P8.0a) + **`opus-mma-julia-bridge.md`** (P8.1a) + **`opus-tcjl-conventions-bridge.md`** (P8.1c) — the three Phase-8 audit reports (148+668+517 = 1333 lines total).
9. **`src/MobileAnyons/`** — 10 functional .jl files + module shell; **`src/MobileAnyons.jl`** — thin top-level shim; **`test/`** — 18 MMA byte-identical + 1 synthetic runtests.jl; **`Project.toml`** (+SparseArrays) + **`Manifest.toml`** (MMA byte-identical).
10. **`Pkg.test` re-run** (if needed): `cd /home/tobiasosborne/Projects/cft-anyons && julia --project=. -e 'using Pkg; Pkg.test("MobileAnyons")'` — expected ~10 min wall, 10586/10591 PASS.
11. **`bd ready`** — Phase 8 epic CLOSED; 14 open issues all non-blocking carryover.

**First concrete action**: dispatch the **P9.1 Opus deep-dive** on `microscopic-mobile-anyons/tex/sections/finegraining.tex` against `summary.tex` §6 / §10 / §11. Brief: read all four sources; produce `stocktake/reports/opus-finegraining-reconciliation.md` with verdict (a) new construction / (b) special case of §11 / (c) rephrasing of §10 polar section / (d) inconsistent. **Treat this as Tier-4 substantive analysis** — needs deep mathematical care (this is HIGH-RISK NEW MATH integration). Stop conditions: any inconsistency with summary.tex framework → escalate to user.

---

## Session close protocol checklist (this session)

- ✓ Phase 8 executed end-to-end (P8.0a → P8.9, 12 atomic commits).
- ✓ Per-commit M / D / C / R / I gates verified at each step (deep D-gate exercised at P8.0a, P8.1a, P8.1.5, P8.4, P8.5, P8.6, P8.7 via independent hostile reviewers; mechanical-exempt for P8.1c synthesis + P8.2 sweep-status + P8.3 imports + P8.8 user-decision-driven + P8.9 phase-close).
- ✓ Lean invariant preserved by construction throughout (zero Lean / lakefile / lean-toolchain / lake-manifest touches — verified by `git log --oneline 8ed4aa7..HEAD -- 'Formalisation/' lakefile.lean lean-toolchain lake-manifest.json` returns empty).
- ✓ MMA Julia backend fully integrated: 10 functional .jl files imported (8 byte-identical + 2 partial), test suite 10586/10591 PASS, 5 known-pre-existing-MMA failures triaged with bd follow-up.
- ✓ Phase-8 bd epic `cft-anyons-ca5` CLOSED (manually per gotcha #37).
- ✓ MIGRATION_LOG updated with 12 Phase-8 rows.
- ✓ PROVENANCE.md updated with Phase 8 block (~150 lines, 19-row manifest).
- ✓ GLOSSARY.md extended (2 new §B entries + def:fuscat cross-link); CONVENTIONS.md extended ([P1.6(b)] sweep-status); RESEARCH_NOTES.md extended (DD-2 entry).
- ✓ `.beads/issues.jsonl` snapshot exported in every bd-touching commit.
- ✓ HANDOFF rewritten (this file).
- ✓ Push: all 12 Phase-8 commits pushed to `origin/main` (intermediate push after P8.4 at f08daf4 for safety; final push after P8.9).

**Hand-off note**: this session ran ~15 substantive Opus subagent dispatches (5 implementers + 6 reviewers + 1 mechanical-exempt + 3 orchestrator-direct steps) across 12 commits. The implementer+reviewer Tier-4 pattern was load-bearing: every substantive port had an independent hostile reviewer; deep-D-gate per slug per memory `feedback-reviewer-deep-d-gate`. The TC.jl-heightened-care discipline (per memory `feedback-phase8-tensorcategories-care`) shaped Phase 8 from end to end: P8.0a precondition + P8.1 two-report + P8.1.5 explicit gauge-handling characterisation + per-file gauge-comment discipline + P8.8 user-decision for SparseArrays. Two user-escalations cleanly resolved via AskUserQuestion (R-symbol GLOSSARY at P8.1.5; testing entry-point + Ising failures at P8.8). Total session wall time ~3-4 hours across the 12 commits including ~10min Pkg.test() execution at P8.8 v3.
