# HANDOFF — Next Agent (Phase 2 complete; Phase 3 next)

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
**Last session goal:** Orchestrate Phase 2 completion — P2.5–P2.8 with a subagent implementer + reviewer pattern (one per P-step).
**Last commit:** this commit (HANDOFF.md + bd JSONL refresh).
**Repository state:** Phases 0, 1, **2 complete**. Phase 3 (`\unchecked` discharge) is the next major work block.

---

## Phase status (post-session)

| Phase | Status | Closing commit |
|---|---|---|
| Phase 0 — Skeleton, bd init, meta-stubs | COMPLETE | `5dd5381` (P0.10) |
| Phase 1 — Definitional bedrock (GLOSSARY/CONVENTIONS/ERRATA/PROVENANCE/PRD v1) | COMPLETE | `76886d2` (P1.11) |
| **Phase 2 — Provenance infrastructure (validator imports)** | **COMPLETE this session** | `1113ddc` (P2.8) |
| Phase 3 — Discharge `\unchecked` flags using imported validators | **NEXT** | — |
| Phases 4–11 | not started | — |

`cft-anyons-d71` (Phase 2 epic) auto-closed when its 8 children all closed.

---

## What landed this session

Four substantive Phase-2 commits, each implementer-subagent → hostile-reviewer-subagent:

| Commit | Step | Implementer verdict | Reviewer verdict |
|---|---|---|---|
| `36189d5` | **P2.5** — DB integrity + row counts (papers=630, citations=702) | Path (a) clean PASS; counts match `SYNTHESIS.md:20-21` verbatim | APPROVE WITH MINOR (`>=` vs `==` thresholding choice; doc-only follow-up filed) |
| `2ecf220` | **P2.6** — Port `lit.py` to `scripts/lit/` (port-and-verify; one-line REPO_ROOT adjust at L37) | Mutation-proved: reverting L37 makes `lit status` FAIL with `DB not initialised`; restoring returns to `papers: 630 … citations: 702` PASS | APPROVE (zero edits) |
| `2dbc617` | **P2.7** — PROVENANCE Phase-2-imports section + README updates (routing deviation: PROVENANCE+README, not CONVENTIONS) | Routing deviation user-adjudicated; recorded in MIGRATION_LOG Deviations | APPROVE (zero edits) |
| `1113ddc` | **P2.8** — `scripts/build-citation-index.py` + populated `CITATION_INDEX.md` (9 atoms; 5 undischarged) | Atom-unit choice = `summary.tex:2458-2481` authorial enumeration + 1 inline-only `(G_2)_1`; determinism verified (byte-identical across 2 runs) | APPROVE WITH MINOR (PRD/CITATION_INDEX `koo-saleur` grouping asymmetry; YAML externalisation deferral; both followups filed) |

Side artefacts that also landed:

- **bd cross-device transfer completed.** Fresh device (`tobiasosborne` user) now active; `bd import .beads/issues.jsonl` populated the local Dolt cache from the JSONL committed in `f82a4d8`.
- **`literature/db/papers.sqlite` populated locally** (524288 bytes, SHA256 `8b6db8ff…`; gitignored per `.gitignore:61`). Copied from sibling `microscopic-mobile-anyons/literature/db/papers.sqlite` during P2.5.
- **New scripts:** `scripts/check-literature-db.py`, `scripts/check-literature-tree.py`, `scripts/lit/lit.py`, `scripts/build-citation-index.py`.
- **PROVENANCE.md** gained a "Phase 2 imports" section (literature/ roll-up SHA256 `0861d623…` over 387 versioned files / 107541244 bytes; references/manifest pointer; lit.py port hashes).
- **README.md** updated in three minimal scope-bounded places (directory map adds `scripts/lit/`; Status line v0→v1; License line "TBD" → "AGPLv3").
- **CITATION_INDEX.md** populated from P0.1 stub → 217 lines, 9 logical citation atoms (`koo-saleur`, `osborne-stottmeister`, `pasquier`, `huse`, `frs`, `feiguin-golden-chain`, `anyonic-mera`, `string-net`, `g2-1-chiral-cft`).
- **MIGRATION_LOG.md** got 4 new rows (P2.5–P2.8) and a P2.7 Deviations entry.

---

## bd state (post-session)

`bd stats` after this commit: **31 issues, 9 open, 0 in-progress, 22 closed.**

`bd list --status=open` (all 9, sorted as bd displays):

| ID | Title | Type | P | Disposition for Phase 3 |
|---|---|---|---|---|
| `cft-anyons-q6h` | LB-1: MMA `enumerate_fusion_trees` multiplicity bug | bug | P2 | Phase 8 (Julia) — not P3-actionable |
| `cft-anyons-2ae` | LB-2: dense Ising c=1/2 test | task | P3 | Phase 8 — not P3-actionable |
| `cft-anyons-6ku` | Promote per-atom decisions in build-citation-index.py to YAML | task | P3 | **P3 follow-up** — bundle when discharge work substantially rewrites mappings |
| `cft-anyons-d2v` | Doc-sync: `MIGRATION_PLAN.md:157` P2.7 routing line stale | task | P3 | Trivial doc-only; bundle with next MIGRATION_PLAN refresh |
| `cft-anyons-d7w` | LB-4: re-validate archive-path citations post-import | task | P3 | Phase 2/Phase 5 follow-up |
| `cft-anyons-pvu` | LB-3: TensorCategories-API fabrication audit | task | P3 | Phase 8 (Julia) — not P3-actionable |
| `cft-anyons-qdd` | CITATION_INDEX vs PRD undischarged-set asymmetry (`koo-saleur` grouping) | task | P3 | **P3 follow-up** — bundle with next PRD refresh |
| `cft-anyons-qi0` | P2.5 follow-up: add MIGRATION_LOG Deviations entry for `>=` vs `==` | task | P3 | Trivial doc-only; bundle with next MIGRATION_LOG touch |
| `cft-anyons-wfr` | Fix hard-coded path `/home/tobias/...` in `scripts/check-references-sha256.py:17` | bug | P3 | Trivial; can fix at any time |

**Grouping for next agent:**
- **P3-adjacent follow-ups** (queue alongside P3.x work): `6ku`, `qdd`. Both surfaced as P2.8 reviewer MINOR findings; both are bundleable with substantive P3 work that touches CITATION_INDEX or PRD.
- **Trivial doc-only fixes** (handle opportunistically): `d2v`, `qi0`. Bundle with the next touch of `MIGRATION_PLAN.md` / `MIGRATION_LOG.md` respectively.
- **Trivial script fix** (handle opportunistically): `wfr`.
- **Long-tail Phase-5/8 follow-ups** (LB series): `q6h`, `2ae`, `pvu`, `d7w` — defer until the relevant phase. These are the same 4 LB items carried from the prior HANDOFF.

---

## Phase 3 entry point — for the next-session agent

The P2.8 reviewer noted explicitly: **`CITATION_INDEX.md` is the authoritative starting place for Phase 3 work.** Read it first.

**Phase 3 mission** (per `stocktake/MIGRATION_PLAN.md:164-176`): for every `\unchecked` flag in `summary.tex`, either (P3.2) discharge with `\cite{SRC-XYZ}` or `\textsuperscript{[Lean]}` + ERRATA entry, or (P3.3) keep the flag but add a footnote pointing to a `RESEARCH_NOTES.md` acquisition task.

**Read order to start Phase 3:**

1. `PRD.md` (v1 baseline).
2. `GLOSSARY.md`, `CONVENTIONS.md` (definitional bedrock).
3. `CLAUDE.md` / `AGENTS.md` (methodology + 11 Rules + hallucination-risk callouts; identical pair).
4. `CITATION_INDEX.md` (the discharge map; **central to P3**).
5. `stocktake/MIGRATION_PLAN.md` §`Phase 3` (lines 164–176).
6. `MIGRATION_LOG.md` Deviations + last rows (P2.5–P2.8).
7. This file.

**Phase 3 dispatch — concrete:**

- **P3.1** (mechanical, list-only): from `CITATION_INDEX.md` Summary table, list every `\unchecked` flag that is `discharged` (local PDF + verified extraction). These are the dischargeable ones for P3.2. From the current map:
  - `osborne-stottmeister` → SRC-OAR-FERMIONS, SRC-OAR-WAVELETS, SRC-OSBORNE-CONTINUUM (4 `summary.tex` lines)
  - `feiguin-golden-chain` → SRC-GOLDEN-CHAIN (4 `summary.tex` lines)
  - `string-net` → SRC-STRING-NET (2 `summary.tex` lines)
  - `koo-saleur` is `partial` (lit DB only; original 1994 paper missing) — P3.3 candidate, not P3.2.
- **P3.2** (one atomic commit per flag): replace inline `\unchecked` with `\cite{SRC-XYZ}` (or footnote pointer). ERRATA entry per atomic commit.
- **P3.3** (one commit covering the undischarged set): footnotes + `RESEARCH_NOTES.md` acquisition tasks for the **5 undischarged atoms**: `pasquier`, `huse`, `frs`, `anyonic-mera`, `g2-1-chiral-cft`.
- **P3.4** (final, mechanical): re-run `scripts/build-citation-index.py`; verify `\unchecked` count decreased by exactly the count of P3.2 atomic commits.

**P3 gotcha already known:** per `cft-anyons-qdd`, the `koo-saleur` atom is `partial` (lit DB paper#590, a 2017 follow-up) but PRD §Known limitations lists "Koo-Saleur 1994 original" as undischarged. Both are coherent; align them by construction in the next PRD refresh.

---

## New gotchas surfaced this session (numbering continued from prior HANDOFF #24)

25. **Hard-coded `/home/tobias/Projects/cft-anyons` path in `scripts/check-references-sha256.py:17`.** Surfaced during P2.5 review (the receiving device is `/home/tobiasosborne/`). Filed as `cft-anyons-wfr` (P3, bug, trivial). Pattern to use instead: `Path(__file__).resolve().parent.parent`, as in `scripts/check-literature-db.py`.

26. **Phase 2 epic `cft-anyons-d71` auto-closed before P2.6/P2.7/P2.8 sub-issues were filed.** The original epic was created with only `d71.1`–`d71.5` as children. The orchestrator filed `d71.6`–`d71.8` mid-session (after P2.5 closed). Lesson for future epics: **create the epic with all children pre-filed**, so the epic-completion percentage tracks correctly and the auto-close fires only when actually done.

27. **`MIGRATION_PLAN.md:157` plan text is stale.** Says "Append to CONVENTIONS.md"; P2.7 actually routed the infrastructure pointer to PROVENANCE.md + README.md per user adjudication. The deviation IS recorded in `MIGRATION_LOG.md` Deviations section, but the plan text was deliberately not edited this session (would have required a second commit). Filed as `cft-anyons-d2v` (P3, doc-only, trivial). **If you read the plan literally, you will be wrong about P2.7's routing.**

28. **`lit.py` REPO_ROOT depth is sensitive to subdir placement.** `scripts/lit/lit.py:37` uses `Path(__file__).resolve().parents[2]` (NOT `.parent.parent`). The two extra levels come from `scripts/lit/lit.py` having one more directory than the source's `scripts/lit.py`. **Do not "simplify" this back to `parent.parent`** — `lit status` will silently start looking for the DB at `scripts/lit/literature/db/papers.sqlite` and fail. Mutation-proof committed in P2.6 commit body.

29. **CITATION_INDEX `koo-saleur` grouping is asymmetric with PRD §Known limitations.** PRD lists "Koo-Saleur 1994 original" as undischarged; CITATION_INDEX folds Koo-Saleur into a `partial` atom because paper#590 (a 2017 follow-up) is in `literature/`. Both classifications are individually coherent — they just don't trivially reconcile. Filed as `cft-anyons-qdd` (P3, doc-only). **Add explicit cross-reference in next PRD refresh.**

30. **`build-citation-index.py` encodes editorial decisions in Python source.** Per-atom `lit_paper_ids` / `src_ids` / `lit_bibkeys` mappings are hard-coded. The script does emit `resolve_discharges()` warnings, but the initial choice is buried. Filed as `cft-anyons-6ku` (P3) to promote to `scripts/citation_atoms.yaml`. Defer until Phase 3 work substantially changes the mappings.

31. **The cross-device transfer mid-session was uneventful.** `bd import .beads/issues.jsonl` populated the local Dolt cache from the JSONL committed in `f82a4d8` cleanly; no merge conflicts. The `.beads/` directory permissions warning (`0755`, recommended `0700`) is cosmetic and persisted across the transfer — fix opportunistically with `chmod 700 /home/tobiasosborne/Projects/cft-anyons/.beads`.

---

## What NOT to do in the next session

- **Do NOT push edits to `CITATION_INDEX.md` without re-running `scripts/build-citation-index.py`.** The file's docstring update-policy says "regenerated by script; hand-edits between regenerations are discouraged." Edits should flow: change `summary.tex` (or the atom map in the script) → re-run → commit both.
- **Do NOT bypass the P2.8 reviewer's MINOR-1 finding (PRD/CITATION_INDEX asymmetry) silently.** If you touch PRD, address `cft-anyons-qdd` in the same commit.
- **Do NOT modify `summary.tex` outside an ERRATA-tracked atomic commit.** Phase 3 specifically *does* modify `summary.tex` (P3.2/P3.3), but each modification is one atomic commit with one ERRATA entry. No bundling.
- **Do NOT run `bd init --force`.** Destroys bd issue history. On a fresh clone use `bd import .beads/issues.jsonl`.
- **Do NOT start Phase 4 (Lean migration) before Phase 3 closes.** Phase 3 is the natural next block, and Phase 4 doesn't unblock until P3.4 verifies the discharge count.
- **Do NOT push CAD to a public repo without re-reviewing prior author's commit footers** (held over from prior HANDOFF — CAD transfer is a separate user decision).
- **Do NOT delete files from `archive/chats/`** — they are deep storage / superseded.
- **Do NOT trust the literal text at `MIGRATION_PLAN.md:157`** (see Gotcha 27); cross-check against `MIGRATION_LOG.md` Deviations.
- **Do NOT "simplify" `scripts/lit/lit.py:37` to `.parent.parent`** (see Gotcha 28).
- **Do NOT push or close this HANDOFF commit's review tier as substantive.** It is a doc-only rewrite distilling per-commit content that was already reviewed; mechanical-exempt per Rule 4.

---

## Quick orientation for the next agent (5–10 min)

1. **`PRD.md`** — v1; entry-point document. Read top to bottom; the named-file gate in `CLAUDE.md`/§Read-order requires it before adding mathematical content.
2. **`CLAUDE.md` / `AGENTS.md`** — methodology + 11 Rules + hallucination-risk callouts. Re-read at session start, after `/clear`, after any context compression.
3. **This file (HANDOFF.md)** — session-specific state. Phase 2 just closed; Phase 3 is next.
4. **`CITATION_INDEX.md`** — start here for Phase 3 work. The 9-atom map is the input.
5. **`stocktake/MIGRATION_PLAN.md` §Phase 3** (lines 164–176) — the 4-step plan.
6. **`bd ready`** in shell — confirm queue (9 open; 2 P3-adjacent: `cft-anyons-6ku`, `cft-anyons-qdd`).

Cross-device note: this repo is now active on the `/home/tobiasosborne/` device. If you switch back to a `/home/tobias/` device, `git pull --rebase` then `bd import .beads/issues.jsonl` to sync.

---

## Session-close protocol (CLAUDE.md §Session completion)

- [x] **Filed remaining-work bd issues**: 5 new follow-ups this session (`wfr`, `qi0`, `d2v`, `qdd`, `6ku`); 3 new P-step issues (`d71.6`/`.7`/`.8`, all now closed). 9 open total at session end.
- [x] **Run quality gates** (applicable to what this session touched):
  - `python3 scripts/check-references-sha256.py` — PASS (already verified P2.2, no regression).
  - `python3 scripts/check-references-line-locators.py` — vacuous PASS (P2.3 baseline; fires in earnest at P3.2).
  - `python3 scripts/check-literature-db.py` — PASS (papers=630, citations=702; P2.5 baseline).
  - `python3 scripts/check-literature-tree.py` — PASS (roll-up digest `0861d623…` matches PROVENANCE; P2.7 baseline).
  - `python3 scripts/lit/lit.py status` — PASS (`papers: 630 … citations: 702`; P2.6 baseline).
  - `python3 scripts/build-citation-index.py` — deterministic (CITATION_INDEX SHA256 `a20aec3c…`; P2.8 baseline).
- [x] **Issue status updated**: epic + all 8 children closed; 5 new followups opened.
- [x] **`bd export -o .beads/issues.jsonl` before commit** — done in this commit.
- [x] **HANDOFF rewritten** for end-of-session state (this commit).
- [ ] **Push to remote** — orchestrator performs the push as the final session action immediately after this commit lands.

---

## Recent commit log (10)

```
1113ddc P2.8: Build scripts/build-citation-index.py and populate CITATION_INDEX.md
2dbc617 P2.7: PROVENANCE Phase-2 imports + README updates (routing deviation per user)
2ecf220 P2.6: Copy literature CLI to scripts/lit/ (port-and-verify, one-line REPO_ROOT adjust)
36189d5 P2.5: Verify literature/db/papers.sqlite integrity + row counts (clean PASS)
f82a4d8 HANDOFF.md: cross-device transfer state (mid-Phase-2, P2.5 paused)
aa6b4ae Pre-publication: AGPLv3 LICENSE + gitignore literature/db/papers.sqlite
e975def P2.4: Copy microscopic-mobile-anyons/literature/ → cft-anyons/literature/
f921991 P2.3: Line-locator verification gate built (0 locators; vacuous PASS)
4b2147f P2.2: SHA256 verification of references/ vs manifest (33/33 PASS)
a9a3095 P2.1: Copy cft-anyons-deprecated/references/ → cft-anyons/references/
```

(`git log --oneline -11` will show this commit on top after it lands.)
