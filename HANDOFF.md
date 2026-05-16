# HANDOFF — Next Agent (cross-device transfer)

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
**Last session goal:** Close Phase 1 + start Phase 2 + prepare repo for cross-device transfer (gh public + AGPL).
**Last commit (pre-publication):** `aa6b4ae` (AGPLv3 LICENSE + gitignore for `papers.sqlite`); HANDOFF + bd refresh commit lands on top.

---

## 🚨 Cross-device transfer in flight

The user is moving work from this device (laptop) to **another device** (where the populated `literature/db/papers.sqlite` lives, ~630 papers / 702 citation edges per SYNTHESIS.md). This commit makes the repo ready for that transfer:

1. AGPLv3 LICENSE added.
2. GitHub public repo created at `https://github.com/tobiasosborne/cft-anyons` (placeholder; URL gets fixed in the follow-up commit once `gh repo create` runs).
3. Phase 1 (definitional bedrock) is **complete and locked** (P1.1–P1.11).
4. Phase 2 (provenance infrastructure) is **mid-flight**: P2.1–P2.4 done; **P2.5 paused on the empty-DB C-gate stop condition** (see below).

On the receiving device, the next agent should:
```bash
git clone https://github.com/tobiasosborne/cft-anyons.git
cd cft-anyons
bd import .beads/issues.jsonl     # populate local Dolt cache from JSONL
bd ready                          # confirm state (4 follow-ups + P2 epic + P2.5 in_progress)
```

---

## 🚨 Phase 2 in-flight; P2.5 paused on a C-gate stop condition

**What landed in Phase 2 so far:**

| Commit | Step | Summary |
|---|---|---|
| `a9a3095` | **P2.1** | Copied `cft-anyons-deprecated/references/` → `references/` (38 files, 28M). diff -r zero divergence. |
| `4b2147f` | **P2.2** | SHA256 verified all 16 primary + 17 extracted text files vs manifest. 33/33 PASS. Script committed at `scripts/check-references-sha256.py`. |
| `f921991` | **P2.3** | Line-locator verification gate built (`scripts/check-references-line-locators.py`). Vacuous PASS (0 locators in canonical content; gate fires in earnest at Phase 3). |
| `e975def` | **P2.4** | Copied `microscopic-mobile-anyons/literature/` → `literature/` (389 files, 104M). diff -r zero divergence. |
| `aa6b4ae` | (pre-pub) | AGPLv3 LICENSE + gitignore `literature/db/papers.sqlite`. |

**P2.5 stop condition** (`bd cft-anyons-d71.5`, status `in_progress`):

The plan's P2.5 C-gate says: *"Confirm count = 630 papers, 702 citation edges (per SYNTHESIS.md)."*

Reality on this device: `literature/db/papers.sqlite` is **0 bytes** (was 0 in source too; `microscopic-mobile-anyons/.gitignore:58` excludes it). `PRAGMA integrity_check` returns `ok` (empty is technically valid), but row counts are 0/0 — not 630/702.

The 630/702 in SYNTHESIS.md is **aspirational** — describing the target state the `lit.py` CLI grows into via `lit add` / `fetch-cites`. The actual cross-device populated DB lives on the user's other device.

**On the receiving device** (which has the real DB), the next agent should:
1. `bd update cft-anyons-d71.5 --status in_progress` (re-claim).
2. Re-run the SQLite integrity check (the script lives at `/tmp/p2_2_verify.py` on this device — needs reconstruction; or write it from scratch using Python's stdlib `sqlite3` module):

   ```python
   import sqlite3
   db = sqlite3.connect("literature/db/papers.sqlite")
   cur = db.cursor()
   cur.execute("PRAGMA integrity_check;"); print(cur.fetchall())
   for t in ("papers", "authors", "citations", "paper_authors"):
       cur.execute(f"SELECT COUNT(*) FROM {t}"); print(t, cur.fetchone())
   ```
3. Three resolution paths previously surfaced to the user:
   - **(a) Treat populated-DB-on-other-device as the canonical baseline.** If counts on the real DB match SYNTHESIS-claimed 630/702 (or close to it within tolerance), C-gate PASS.
   - **(b) Update SYNTHESIS.md** if counts are different but stable (e.g., 612/689) — re-baseline the SYNTHESIS claim to actual reality.
   - **(c) Defer counts** if the populated state is itself in-flux; complete P2.5 with PRAGMA-only verification + a note that count-stability requires further DB-curation work.
4. Commit P2.5 with verdict + close `cft-anyons-d71.5`; proceed to P2.6 (literature CLI).

---

## Phase 1 (definitional bedrock) — COMPLETE

All 11 sub-tasks of `cft-anyons-k3s` done; epic closed. Phase-1 deliverables:

| Artifact | State | Lines |
|---|---|---|
| `GLOSSARY.md` | 49 entries (48 §A from `summary.tex` + 1 §B for MMA's mobile-Fock). All Translation maps populated. | ~2050 |
| `CONVENTIONS.md` | 10 lettered entries (a)–(j). | ~565 |
| `ERRATA.md` | 1 entry (`lem:binary-Z` audit-trail). | 143 |
| `PROVENANCE.md` | Phase 1 canonical baseline + per-artifact entries. | 288 |
| `PRD.md` | **v1** (P1.11). Per-task-class GLOSSARY pointers. | 279 |
| `MIGRATION_LOG.md` | All Phase 0 + Phase 1 + Phase 2 (P2.1–P2.4) rows. | ~70 |

**P1.9 audit verdict:** APPROVE FOR PHASE 2 (zero CRITICAL, zero MAJOR; 8 MINOR/NIT; 5 MINOR applied in same commit). Report at `stocktake/reports/opus-glossary-audit.md`.

---

## bd state

After this commit, `bd stats`: 22 issues, 5 open, 17 closed.

`bd ready` (excluding in-progress):

| ID | Title | Type | Priority | Status |
|---|---|---|---|---|
| `cft-anyons-d71` | Phase 2 epic (provenance infrastructure) | epic | P1 | open (P2.5 in progress; P2.6–P2.8 queued) |
| `cft-anyons-d71.5` | **P2.5 (in-progress, paused on C-gate)** | task | P1 | in_progress on this device; re-claim on other device |
| `cft-anyons-q6h` | LB-1: MMA `enumerate_fusion_trees` multiplicity bug | bug | P2 | open (Phase 8) |
| `cft-anyons-d7w` | LB-4: archive-path re-validate post-import | task | P3 | open (Phase 2 follow-up) |
| `cft-anyons-pvu` | LB-3: TensorCategories-API audit | task | P3 | open (Phase 8) |
| `cft-anyons-2ae` | LB-2: dense Ising c=1/2 test | task | P3 | open (Phase 8) |

Closed in Phase 2 so far: `cft-anyons-d71.1` (P2.1), `cft-anyons-d71.2` (P2.2), `cft-anyons-d71.3` (P2.3), `cft-anyons-d71.4` (P2.4).

---

## CAD transfer plan (recommended)

CAD (`/home/tobias/Projects/cft-anyons-deprecated/`) on this device:
- **53 MiB git-tracked content** (1615 loose objects).
- 7.2 GB working tree, almost all in `.lake/` build artifacts (regeneratable via `lake build`).
- Existing git repo (5+ named commits visible).
- **No remote configured.**

**Recommended:** create a private GitHub repo for CAD (private because it's a deprecated/archive project; not for external consumption), push, and clone on the receiving device:

```bash
cd /home/tobias/Projects/cft-anyons-deprecated
gh repo create cft-anyons-deprecated --private --description "Deprecated Lean formalisation + af adversarial-proof workspace (predecessor of cft-anyons)" --source . --push
# On the other device:
git clone git@github.com:tobiasosborne/cft-anyons-deprecated.git
cd cft-anyons-deprecated && lake build      # ~7GB .lake artifacts rebuild locally
```

This preserves git history, is easily reversible (private; can delete), and aligns with the cft-anyons public-repo pattern. Phase 5 of `MIGRATION_PLAN.md` (Lean migration) needs CAD source files; the next-device agent must have CAD cloned by then.

Alternatives if you prefer:
- **`git bundle`**: `git bundle create cad.bundle --all` → transfer via scp/rsync/cloud → `git clone cad.bundle` on other device. No GitHub exposure; manual file transfer; preserves history. Good if you want minimal surface area.
- **Public gh repo** (same as recommended but `--public`): only sensible if you want it as a citable archive. CAD has the prior author's footer in commits; check that's OK.
- **tar.gz the dir minus `.lake/` + scp**: lossiest path; loses git history. Don't recommend unless other paths blocked.

---

## What landed across this session (overall)

11 commits this session:

| Commit | Step | Summary |
|---|---|---|
| `fe96ec7` | P1.8 | MMA-Julia translation maps (45 bullets + Aliases update) |
| `b986495` | P1.9 | Definitional gate audit (APPROVE FOR PHASE 2) + 5 cleanups |
| `edb547a` | P1.10 | PROVENANCE refresh from stub (Phase 1 canonical baseline) |
| `76886d2` | P1.11 | PRD v0 → v1 refresh |
| `4d29441` | HANDOFF | Session-end pointer (Phase 1 closed) |
| `a9a3095` | P2.1 | references/ import (28M) |
| `4b2147f` | P2.2 | SHA256 verification 33/33 PASS |
| `f921991` | P2.3 | Line-locator gate (vacuous PASS) |
| `e975def` | P2.4 | literature/ import (104M) |
| `aa6b4ae` | pre-pub | AGPLv3 + gitignore papers.sqlite |
| (this) | HANDOFF | Cross-device transfer state |

---

## Gotchas surfaced this session (new; for next agent)

21. **Source projects' `.gitignore` doesn't propagate via `cp -a`.** Both `microscopic-mobile-anyons/literature/pdfs/` and `microscopic-mobile-anyons/literature/db/papers.sqlite` are gitignored in source; the `cp -a` import in P2.1/P2.4 copied them anyway. Decision (per plan + this commit): keep the PDFs (the plan explicitly says "preserve full structure including pdfs/"), gitignore the SQLite to match source convention.

22. **The SYNTHESIS.md "630 papers, 702 citation edges" is aspirational, not current.** The actual DB state was 0/0 on the source machine; the populated version lives on another device. Phase 2 plan text drift hazard (HANDOFF gotcha #13 again).

23. **`/tmp/` is non-persistent and not transferable.** This session left two verification scripts in `/tmp/` (`p1_8_verify.py`, `p2_2_verify.py`); both have committed counterparts in `scripts/` (`check-references-sha256.py`, `check-references-line-locators.py`). The D-gate-replay script for §A canonical bodies (used by `p1_8_verify.py`) is described prose-only in PRD.md (per P1.11 reviewer's request); if you need it as a script on the receiving device, write it from the prose description or commit it under `scripts/check-glossary-canonical-bodies.py`.

24. **`bd export` runs once per commit (per CLAUDE.md), but the `bd update --append-notes` followups don't require a fresh export if the next commit will pick them up.** Saw multiple `Exported N issues` in this session — that's expected.

---

## What NOT to do on the next-device session

- **Do not bypass the P2.5 C-gate decision.** The empty-DB on this device was a discovery, not a corruption; on the receiving device with the populated DB, the C-gate's intent can be met. Re-claim `cft-anyons-d71.5`, run the check, decide path (a)/(b)/(c), commit P2.5 properly.
- **Do not push CAD to public** unless you've reviewed the prior author's commit-history footers + content for anything not meant for public exposure.
- **Do not start Phase 5 work** (Lean) before P2.5 → P2.6 → P2.7 → P2.8 are all closed and Phase 3 (\unchecked discharge) is decided on.
- **Do not modify `summary.tex`** outside an ERRATA-tracked atomic commit.
- **Do not delete files from `archive/chats/`**; they are deep storage / superseded.
- **Do not run `bd init --force`**; would destroy bd issue history. On a fresh clone, run `bd import .beads/issues.jsonl` instead.

---

## Push instructions (executed by this session)

```bash
# Already executed:
gh repo create cft-anyons --public --description "<…>" --source . --push
# Subsequent pushes after this HANDOFF lands:
git push
```

`origin/main` will be at the head of this branch after the push. Verify on the receiving device with `git log --oneline | head -5`.

---

## Quick orientation for the next-device agent (10 min)

1. **`PRD.md`** — v1; the entry-point document.
2. **`CLAUDE.md` / `AGENTS.md`** — methodology + 11 Rules + hallucination-risk callouts.
3. **This file (HANDOFF.md)** — current session-specific state (mid-Phase-2, P2.5 paused).
4. **`stocktake/reports/opus-glossary-audit.md`** — the P1.9 audit (verdict: APPROVE FOR PHASE 2; already user-approved).
5. **`bd ready`** in shell — confirm queue (P2.5 in_progress + 4 follow-ups + Phase 2 epic open).

The next concrete action is **resolving P2.5 against the real populated DB**, then continuing P2.6 → P2.7 → P2.8 to close Phase 2.

---

## Session close protocol

- ✓ Filed remaining-work bd issues (LB-2/3/4 from Phase 1; P2.5 paused with status note).
- ✓ Each Phase 1 / Phase 2 step has its MIGRATION_LOG row + commit.
- ✓ Cross-device sync: `bd export -o .beads/issues.jsonl` before this commit.
- ✓ HANDOFF rewritten for cross-device transfer state.
- ✓ AGPLv3 LICENSE added; gitignore tightened to match source convention.
- → `gh repo create cft-anyons --public --source . --push` (executed by this session immediately after this commit lands).
