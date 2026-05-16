# HANDOFF — Next Agent (Phase 4 mid-flight; 9 of 15 atomic steps done; P4.9 awaits review)

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
**Last session goal:** Orchestrate Phase 4 (Lean infrastructure migration: abstract `LinearAlgebra/`) — implementer + hostile-reviewer subagent pattern, one per P-step. **Stopped mid-phase at user request** after P4.9 implementer landed (P4.9 reviewer deferred to next agent).
**Last commit:** this commit (HANDOFF refresh + bd JSONL); preceded by `5e02be7` (P4.9 implementer).
**Repository state:** Phase 4 in flight — **P4.1 through P4.9 committed (9 of 15 atomic steps); P4.9 not yet reviewed; P4.10–P4.14 + P4.15 remain**.

---

## Phase status

| Phase | Status | Closing commit |
|---|---|---|
| Phase 0 — Skeleton, bd init, meta-stubs | COMPLETE | `5dd5381` (P0.10) |
| Phase 1 — Definitional bedrock | COMPLETE | `76886d2` (P1.11) |
| Phase 2 — Provenance infrastructure | COMPLETE | `1113ddc` (P2.8) |
| Phase 3 — `\unchecked` discharge | COMPLETE | `ac51316` (P3.4) |
| **Phase 4 — Lean `LinearAlgebra/` migration** | **MID-FLIGHT (9/15 done; P4.9 unreviewed)** | epic `cft-anyons-99c` open |
| Phase 5 — Lean fusion-category content | NOT STARTED | — |

---

## What landed this session (Phase 4 commits)

| Commit | Step | File | Decls | Reviewer verdict |
|---|---|---|---|---|
| `bf2b088` | P4.1 | lake skeleton + Mathlib cache | — | APPROVE |
| `8c04ada` | P4.2 | Isometry.lean | 9 | APPROVE (MINOR: title "8 theorems", actual 9) |
| `a413ff1` | P4.3 | Polar.lean | 7 | APPROVE (MINOR: docstring prose imprecision) |
| `626230e` | P4.4 | Tensor.lean | 3 | APPROVE |
| `1c4e41a` | P4.5 | TensorPower.lean | 6 | APPROVE |
| `3f5443d` | P4.6 | HeterogeneousTensor.lean | 8 | APPROVE |
| `832fcf3` | P4.7 | Trace.lean | 14 | APPROVE (MINOR: title "15", actual 14) |
| `9c88cb2` | P4.8 | Postcompose.lean | 2 | APPROVE (MINOR: decl-grep over-counts `noncomputable section`) |
| `5e02be7` | P4.9 | Component.lean | 1 | **NOT YET REVIEWED — first action for next agent** |

Pattern is fully locked: every commit is single-file port + verbatim body + top-of-file `-- GLOSSARY:` docstring + 1-line import append to `Formalisation.lean` + lake build green (3-pass for first; cached after) + mutation-proof. Zero `sorry` / zero `axiom` invariant preserved throughout.

---

## 🚨 IMMEDIATE NEXT ACTION — Review P4.9, then resume

1. **Dispatch P4.9 hostile reviewer** for commit `5e02be7`. Use the reusable reviewer template (below). Component.lean is 1 declaration (`theorem matrix_component_orthogonality_iff`); the implementer-claimed verification has not yet been independently audited.
2. **If P4.9 reviewer APPROVE/MINOR**, proceed to P4.10 (NoMixing.lean, 105 LOC).
3. **If P4.9 reviewer CRITICAL/MAJOR**, revert `5e02be7`, fix, re-commit.

---

## 🆕 Recommended pattern change: reviewer N || implementer N+1 overlap

Analysis surfaced at end of session: the strict serial protocol (reviewer N → implementer N+1) wastes ~1–3 min per pair because reviewers are **read-only** on commit N's state and implementer N+1 writes only new files (the per-port `.lean`, +1 line to `Formalisation.lean`, +1 row to `MIGRATION_LOG.md`, bd JSONL). They do not collide.

**Cost of strictly serial**: 6 remaining ports × (1–3 min reviewer wait) = 6–18 min wasted.

**Concurrent pattern**:

```
[ commit N lands ]
    ↓
    ├─→ dispatch reviewer N (read-only, ~1–3 min)
    └─→ dispatch implementer N+1 (writes new files, ~5–10 min)
    ↓
[ both return ]
    ↓
if reviewer N == PASS/MINOR → implementer N+1's commit is fine, proceed to reviewer N+1 || implementer N+2
if reviewer N == CRITICAL/MAJOR → revert N (which also reverts N+1 since N+1 was built on N), fix, re-do
```

**Risk**: a CRITICAL/MAJOR reviewer verdict forces both N and N+1 to be reverted. After 8 consecutive PASS/MINOR verdicts (P4.1–P4.8) on the established template, the risk of CRITICAL is low; all MINORs seen so far are cosmetic (decl-count idioms, prose nits) — none would force a revert.

**Why NOT parallelize implementer N || implementer N+1**: they all write to the same three shared files (`Formalisation.lean`, `MIGRATION_LOG.md`, `.beads/issues.jsonl`). True write races. Worktree isolation would solve this but each worktree needs its own ~7 GB `.lake/` Mathlib cache (infeasible).

**Recommended**: switch to reviewer || next-implementer overlap for the remaining 5 ports (P4.10–P4.14) + P4.15. Stay strictly serial for any commit immediately preceded by a CRITICAL reviewer finding (none expected).

---

## What remains in Phase 4 (6 atomic steps + session close)

| Step | File / Action | LOC | bd | Likely GLOSSARY refs |
|---|---|---|---|---|
| **P4.10** | NoMixing.lean | 105 | new `cft-anyons-99c.10` | conv:basics + def:RG-amp + def:NoMixing (if present) |
| **P4.11** | FineGraining.lean | 96 | new `cft-anyons-99c.11` | conv:basics + def:refmap (line 717 may pre-bind) + def:blocking + def:ascending |
| **P4.12** | CoherentSystem.lean | 71 | new `cft-anyons-99c.12` | conv:basics + def:refmap (coherent-system structure) |
| **P4.13** | DiagonalScaling.lean | 46 | new `cft-anyons-99c.13` | conv:basics + diagonal/scaling related |
| **P4.14** | ChargeOnly.lean | 53 | new `cft-anyons-99c.14` | conv:basics + def:charge / def:fusion related |
| **P4.15** | PROVENANCE refresh: add hashes for 13 ported files (use `scripts/check-literature-tree.py`-style roll-up or per-file table) | doc-only | new `cft-anyons-99c.15` | none (mechanical-exempt) |
| Session close | HANDOFF.md rewrite + bd export + git push | — | — | — |

**Estimated runtime**: ~5–10 min per implementer, ~1–3 min per reviewer. With reviewer || next-implementer overlap: ~30–60 min total for remaining Phase 4 work + ~10 min HANDOFF + push.

---

## Reusable implementer briefing template (paste into Agent prompt)

```
Implementer for **MIGRATION_PLAN P4.X** — port `Formalisation/LinearAlgebra/<file>.lean` (<LOC> LOC).
Template: P4.9 commit `5e02be7` (after review approves) or P4.8 `9c88cb2`.

## Brief pre-reads
1. `CLAUDE.md` Rules 4, 5, 8.
2. `stocktake/MIGRATION_PLAN.md` line <186+X-1> (P4.X).
3. `MIGRATION_LOG.md` recent rows (**DO NOT run `lake update`** — it drifts manifest per P4.1 lesson).
4. `git show <prev commit>` (template).
5. `GLOSSARY.md` — check line 717 for pre-bindings of this file's slug.
6. `cft-anyons-deprecated/Formalisation/LinearAlgebra/<file>.lean` (source).

## Hard rules
- No `lake update`. Only `lake build` (+ `lake exe cache get` if cache miss).
- Port body VERBATIM. Only addition: top-of-file GLOSSARY-ref docstring block.
- 0 sorry / 0 axiom (load-bearing).
- Touch only: `Formalisation/LinearAlgebra/<file>.lean` (new), `Formalisation.lean` (+1 import line),
  `MIGRATION_LOG.md` (+1 chronological row), `.beads/issues.jsonl`.
- No push / amend / rebase / --no-verify.
- **Pre-count decls TIGHT** — `grep -cE "^(theorem|lemma|abbrev|instance|noncomputable def|def|example)" file`
  (P4.7/P4.8 had off-by-one MINORs from loose grep that matches `noncomputable section`).

## Execute
1. Read source.
2. Pick GLOSSARY refs (existing slugs only; check GLOSSARY:717 pre-bindings).
3. Copy + GLOSSARY docstring header (mirror prior P4.x).
4. Append `import Formalisation.LinearAlgebra.<file>` to `Formalisation.lean`.
5. `lake build` green (3-pass steady state).
6. Mutation-prove (perturb a load-bearing recursive call or rewrite target; FAIL → restore → PASS).
7. `grep -n "sorry\|axiom" <file>` must be empty.
8. `bd create --type=task -p 1 --parent cft-anyons-99c` → `cft-anyons-99c.X`; close with `--reason "..."`.
9. `bd export -o .beads/issues.jsonl`.
10. MIGRATION_LOG row chronological after P4.<X-1> (gates M D I).
11. Commit per CLAUDE.md template:
    title `P4.X: Port Formalisation/LinearAlgebra/<file>.lean (lake green, GLOSSARY refs added)`;
    body with Source/Source SHA256/Destination SHA256/GLOSSARY changes/Validation passed/Rollback/Review;
    Co-author footer. NO PUSH.

## Return (≤ 200 words)
Commit hash, SHA256s, GLOSSARY refs (slug + 1-line justification each), decl count
(precise via tight grep), lake outcome + time, mutation FAIL + restored PASS, sorry/axiom
(0/0 expected), bd state, surprises.

Stop conditions: lake fails on verbatim port; source has sorry/axiom; mathlib pin drifts
from d6dab93; no suitable GLOSSARY entry exists (would need NEW entry — escalate).
```

---

## Reusable reviewer briefing template (paste into Agent prompt)

```
Hostile Core-tier reviewer for commit `<hash>` (P4.X: Port <file>.lean) in `/home/tobiasosborne/Projects/cft-anyons`.
Precedent: P4.<X-1> reviewer of `<prev hash>`. Pattern locked.

Implementer claims: <quote SHA256s, decl count, GLOSSARY refs, lake jobs, mutation detail, 0/0 sorry/axiom>.

## Audit
- `git show <hash> | head -60`
- `diff cft-anyons-deprecated/Formalisation/LinearAlgebra/<file>.lean Formalisation/LinearAlgebra/<file>.lean`
  — should differ ONLY by top-of-file docstring extension
- `sha256sum Formalisation/LinearAlgebra/<file>.lean` matches?
- `grep -cE "^(theorem|lemma|abbrev|instance|noncomputable def|def|example)" file` — verify ACTUAL count
  (exclude `^noncomputable section` lines from grep output — common over-count)
- `grep -c "sorry\|axiom"` = 0
- `grep "^-- GLOSSARY:"` — every slug exists in GLOSSARY.md
- `lake build` exit 0; mathlib pin `d6dab93da86c64219ab1497ffadce1a66aa04701`
- 14 forbidden files: empty diffs (summary.tex, GLOSSARY.md, CONVENTIONS.md, ERRATA.md, PROVENANCE.md,
  PRD.md, CLAUDE.md, AGENTS.md, HANDOFF.md, README.md, CITATION_INDEX.md, RESEARCH_NOTES.md,
  lakefile.lean, lean-toolchain, lake-manifest.json)
- `git diff HEAD~1 HEAD -- Formalisation.lean` = +1 line (`import Formalisation.LinearAlgebra.<file>`)
- `bd show cft-anyons-99c.X` CLOSED

## Checklist (PASS / MINOR / MAJOR / CRITICAL each)
Body identity, GLOSSARY refs valid+pre-bound, decl count actual, sorry/axiom=0, lake green+pin preserved,
forbidden untouched, Formalisation.lean +1, mutation credible, MIGRATION_LOG chronological, bd hygiene,
commit template, atomicity (4 files).

Verdict + 2-sentence justification. ≤ 300 words.
```

---

## Accumulated gotchas (cumulative across all phases)

(Continuing from prior HANDOFF; new entries this session are #32+.)

32. **`lake update` is destructive.** Modifies `lake-manifest.json` (schema 1.1.0 → 1.2.0; drifts mathlib `d6dab93` → `e12bcd0` along `inputRev: null`; drifts batteries along `inputRev: "v4.30.0-rc2"` tag). Recovery: `cp` canonical manifest from CAD + `git checkout` drifted packages back. **Never run `lake update` in P4.* commits** — use only `lake build` and `lake exe cache get`.
33. **`CFTAnyons` namespace + `lean_lib Formalisation` requires a root file.** Lake errors "no such file or directory: Formalisation.lean" if `Formalisation/` is empty but the lakefile declares `lean_lib Formalisation`. Solution (P4.1): minimal placeholder `Formalisation.lean` at repo root; each P4.* port appends one `import` line.
34. **Source CAD `Formalisation.lean` is post-Phase-5.** It re-exports 29 modules including `Foundations/`, `Fibonacci/`, `Ising/` — none of which exist in this repo yet. **Do not copy verbatim**; use the minimal placeholder pattern (P4.1's 11-line comment-only file).
35. **Decl-count grep over-counts `noncomputable section`.** The loose pattern `^(...|noncomputable|...)` matches `noncomputable section` (a section header, not a declaration). P4.7/P4.8 had off-by-one MINOR reviewer findings. Use tight grep: `grep -cE "^(theorem|lemma|abbrev|instance|noncomputable def|def|example)" file`, or visually verify.
36. **MIGRATION_LOG row order**: implementers consistently inserted P4.X rows in wrong chronological position (before P4.<X-1>); had to self-correct with awk/sed. Less an issue post-P4.6 (template stabilised) but worth flagging in implementer briefings.
37. **bd auto-closes the epic** each time the last open child closes; the implementer must immediately `bd update cft-anyons-99c --status open` with a notes-append. This is now a known idiom; the next P4.* implementer should expect it.
38. **`bd close --notes` is invalid; use `--reason`** (P4.7 implementer first found this).
39. **`pdflatex` steady state is 3-pass** (not 2; transient "Label(s) may have changed" warning at pass 2). Not relevant to P4.* directly but flagged for any LaTeX-touching work.
40. **2 CITATION_INDEX SRC-* mapping bugs persist** (`cft-anyons-eit`, `cft-anyons-es5`) from Phase 3 P3.0 findings; not Phase-4 blockers but stay open.
41. **`.lake/` is 7.1 GB after Mathlib cache populates**; gitignored at `.gitignore:34`. Never `git add .lake/`.

---

## What NOT to do (next session)

- **DO NOT run `lake update`.** Period. Use `lake build` and `lake exe cache get` only.
- **DO NOT modify `lake-manifest.json`, `lakefile.lean`, or `lean-toolchain`** in any P4.* port commit — they were set in P4.1 and must stay byte-identical to CAD source.
- **DO NOT introduce `sorry` or `axiom`** in any ported Lean file — load-bearing invariant.
- **DO NOT modify source body** when porting; only add top-of-file GLOSSARY docstring.
- **DO NOT touch the 14 forbidden files** during ports (summary.tex, GLOSSARY/CONVENTIONS/ERRATA/PROVENANCE/PRD/CLAUDE.md/AGENTS.md/HANDOFF.md/README.md/CITATION_INDEX.md/RESEARCH_NOTES.md/lakefile.lean/lean-toolchain/lake-manifest.json).
- **DO NOT add new GLOSSARY entries** to satisfy port D-gates — only reference existing slugs.
- **DO NOT push CAD as public**; if Phase 5+ requires CAD on a new device, follow HANDOFF-of-prior-session CAD transfer plan.
- **DO NOT run `bd init --force`** (would destroy issue history).

---

## bd state at session end

- **Total**: 52 issues / 12 open / 40 closed / 0 in_progress.
- **Phase 4 epic** `cft-anyons-99c`: OPEN. Children: `cft-anyons-99c.1` through `cft-anyons-99c.9` all CLOSED; P4.10–P4.15 children NOT YET FILED (file at start of each port).
- **Carryover (Phase 3 findings)**:
  - `cft-anyons-eit` (P2) — SRC-OSBORNE-CONTINUUM mis-mapped
  - `cft-anyons-es5` (P2) — SRC-STRING-NET mis-mapped
  - `cft-anyons-umx` (P2) — CITATION_INDEX line lists are author-name occurrences
  - `cft-anyons-6ku` (P3) — YAML promote editorial decisions
  - `cft-anyons-d2v` (P3) — MIGRATION_PLAN.md:157 doc-sync
  - `cft-anyons-qi0` (P3) — P2.5 `>=` vs `==` Deviations entry
  - `cft-anyons-wfr` (P3) — hard-coded path in scripts/check-references-sha256.py
- **Long-tail LB carryover**:
  - `cft-anyons-q6h` (P2, Phase-8-gated) — MMA enumerate_fusion_trees multiplicity bug
  - `cft-anyons-2ae` (P3, Phase-8-gated) — MMA test for dense Ising c=1/2
  - `cft-anyons-pvu` (P3, Phase-8-gated) — TensorCategories-API audit
  - `cft-anyons-d7w` (P3, Phase-2-followup) — archive-path re-validate

---

## Quick orientation (5–10 min)

1. **`PRD.md`** — entry point.
2. **`CLAUDE.md`** (= `AGENTS.md`) — methodology + 11 Rules. **Especially**: Rule 4 (reviewer-gating; Phase 4 ports are Core-tier per established pattern); Rule 5 (port-and-verify mode applies to all P4.* ports); Rule 9 (no GitHub CI).
3. **This file (`HANDOFF.md`)** — current state (mid-Phase-4; P4.9 awaits review).
4. **`stocktake/MIGRATION_PLAN.md` lines 180–202** — Phase 4 plan (15 atomic steps).
5. **`git log --oneline 90f5609..HEAD`** — see the 9 Phase-4 commits.
6. **`MIGRATION_LOG.md`** — most recent rows + Deviations section (P4.1 manifest-drift warning, P3.0/P3.4 deviations).
7. **`bd ready`** — `cft-anyons-99c` epic (Phase 4) is OPEN; the 12 open follow-ups are all P2/P3-priority (none block Phase 4 progress).

**First concrete action**: dispatch P4.9 hostile reviewer (template above; commit `5e02be7`). Then proceed to P4.10 (NoMixing.lean) using the recommended **reviewer N || implementer N+1 overlap** pattern.

---

## Session close protocol checklist (this session)

- ✓ Filed Phase-4 epic + 9 child bd issues; all P4.1–P4.9 children closed in their respective commits.
- ✓ Per-commit M/D/I gates verified (lake build green, body byte-identity vs source, GLOSSARY refs added).
- ✓ Each landed commit had implementer + reviewer pair **EXCEPT** P4.9, where reviewer was deferred to next agent per the orchestrator's `stop` directive.
- ✓ MIGRATION_LOG updated with P4.1–P4.9 rows + Deviations entry (P4.1 lake-update drift).
- ✓ `.beads/issues.jsonl` snapshot exported in P4.9 commit (will re-export in HANDOFF commit).
- ✓ HANDOFF rewritten (this file).
- → `git push` happens immediately after this HANDOFF commit lands.

**Hand-off note**: the session ran 9 implementer + 8 reviewer Opus subagents for Phase 4. Average per-port time was ~7 min (implementer) + ~2 min (reviewer). Total Phase 4 session time: ~90 min for 9 commits. Remaining 6 commits + close, with the recommended overlap pattern, should be ~30–45 min.
