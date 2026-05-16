# HANDOFF — Next Agent (Phase 3 complete; Phase 4 next)

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
**Last session goal:** Orchestrate Phase 3 completion — P3.0 through P3.4 with an implementer + hostile-reviewer subagent pattern (one per P-step).
**Last commit:** this commit (HANDOFF.md + bd JSONL refresh).
**Repository state:** Phases 0, 1, 2, **3 complete**. Phase 4 (Lean infrastructure migration: abstract `LinearAlgebra/`) is the next major work block.

---

## Phase status (post-session)

| Phase | Status | Closing commit |
|---|---|---|
| Phase 0 — Skeleton, bd init, meta-stubs | COMPLETE | `5dd5381` (P0.10) |
| Phase 1 — Definitional bedrock (GLOSSARY/CONVENTIONS/ERRATA/PROVENANCE/PRD v1) | COMPLETE | `76886d2` (P1.11) |
| Phase 2 — Provenance infrastructure (validator imports) | COMPLETE | `1113ddc` (P2.8) |
| **Phase 3 — Discharge `\unchecked` flags using imported validators** | **COMPLETE this session** | `ac51316` (P3.4) |
| Phase 4 — Lean infrastructure migration: abstract `LinearAlgebra/` | **NEXT** | — |
| Phases 5–11 | not started | — |

`cft-anyons-9yu` (Phase 3 epic) closed manually at P3.4 with an audit-trail note (the dep-tree never registered the P3.* atomic sub-tasks as children — pre-registration descriptive epic).

PRD.md is currently at **v1** with `Status: Phase 1 (definitional bedrock) complete; Phase 2 ... unblocked` — stale relative to the post-session state. A v1→v1.1 refresh is on the next-session opportunistic queue (touches the Status line + Canonical-artifacts CITATION_INDEX bullet + Known-limitations cross-ref); not blocking Phase 4.

---

## What landed this session

Seven substantive Phase-3 commits, each implementer-subagent → hostile-reviewer-subagent (Opus 4.7):

| Commit | Step | Implementer summary | Reviewer verdict |
|---|---|---|---|
| `6d9ca8c` | **P3.0 + P3.1** — `\begin{thebibliography}{99}` skeleton + 5 `\bibitem{SRC-*}` entries + dischargeable-flag list (folded) | +36 lines purely additive before `\end{document}`; bibitem bodies sourced from PDF first-page metadata at `references/text/<file>:1-12` | APPROVE |
| `3403ca5` | **P3.2.a** — `osborne-stottmeister` discharge at 3 sites (`summary.tex:2304/2380/2468`) → `\cite{SRC-OAR-FERMIONS,SRC-OAR-WAVELETS,SRC-OSBORNE-CONTINUUM}` (triple-cite, uniform) | Multi-cite editorial choice: SRC-OAR-FERMIONS primary; SRC-OAR-WAVELETS supporting; SRC-OSBORNE-CONTINUUM foundational | APPROVE WITH 1 MINOR (triple-cite uniformity defensible; reviewer accepted in commit body) |
| `c8d055b` | **P3.2.b** — `feiguin-golden-chain` discharge at 1 site (`summary.tex:2477`) → `\cite{SRC-GOLDEN-CHAIN}` | Single-cite (only locally-available PDF for this atom) | APPROVE |
| `c607efa` | **P3.2.c** — `string-net` discharge at 1 site (`summary.tex:2480`) → `\cite{SRC-STRING-NET}` | Single-cite (only locally-available PDF; lit DB cross-ref is related Levin-Wen 2005, deferred to `cft-anyons-es5`) | APPROVE |
| `a5364f8` | **P3.3** — 6 footnotes at the 6 undischarged-citation `\unchecked` sites linking to new `RESEARCH_NOTES.md` acquisition-queue entries (`aq:<slug>`); `\unchecked` macros preserved | Atoms: `koo-saleur`, `pasquier`, `huse`, `frs`, `anyonic-mera`, `g2-1-chiral-cft`. `aq:koo-saleur` resolves the PRD↔CITATION_INDEX asymmetry (`cft-anyons-qdd`) | APPROVE |
| `ac51316` | **P3.4** — rebuild `CITATION_INDEX.md` via script; verify `\unchecked`-count delta 26 → 21 (5 instances across 3 P3.2 commits); PROVENANCE row hash refresh | Determinism re-verified (byte-identical on 2 runs); per-atom `Discharge status` fields all unchanged (script depends on hard-coded SRC-*/lit IDs, not `\unchecked` presence — see Gotcha 33 below) | APPROVE |

Side artefacts that also landed:

- **`summary.tex`** gained, in order: a 36-line `thebibliography` block (P3.0); five `\cite{SRC-*}` discharges replacing five `\unchecked` macros (P3.2.a/b/c, 3+1+1 sites); six `\footnote{...}` insertions next to the six remaining undischarged `\unchecked` macros (P3.3). All within ERRATA-tracked atomic commits.
- **`ERRATA.md`** gained 7 new entries (one per P-step, including P3.1 folded).
- **`RESEARCH_NOTES.md`** gained an "Acquisition queue (Phase 3 undischarged citations)" section with 6 `aq:<slug>` entries (each with cited-claim summary, acquisition target with full bibliographic data + arXiv ID, expected discharge path).
- **`CITATION_INDEX.md`** rebuilt at P3.4 (SHA256 `a20aec3c…` → `99e65fab…`); generation-metadata header `\unchecked` count 26 → 21; per-atom `Discharge status` fields unchanged by design (see Gotcha 33).
- **`PROVENANCE.md`** got a single-row update at P3.4 (CITATION_INDEX.md row: SHA256, last-touch, P-step, provenance-chain note).
- **`MIGRATION_LOG.md`** got 7 new rows (P3.0–P3.4) and 2 new Deviations entries (P3.0 prerequisite addition; P3.4 count-metric ambiguity).
- **Net `\unchecked`-macro count in `summary.tex`:** 26 → 21 (5 instances discharged across 3 atoms).
- **Two-pass / three-pass `pdflatex` M-gate PASS** at every commit; pages stayed 33; warning/underfull/overfull counts stable (39/10/8 post-P3.0). Steady state is **3 passes** for this document (see Gotcha 32).

---

## bd state (post-session)

`bd stats` after this commit: **42 issues, 11 open, 0 in-progress, 31 closed.**

`bd list --status=open` (11 open, grouped by disposition for next session):

**P3 cleanup carry-forward (new this session; deferred to a future `build-citation-index.py` cleanup pass):**

| ID | Title | Type | P | Origin |
|---|---|---|---|---|
| `cft-anyons-eit` | SRC-OSBORNE-CONTINUUM maps to wrong lit DB paper ID (script `lit_paper_ids` mis-mapping; PDF is arXiv:1901.06124 / id=519, script says id=521) | bug | P2 | P3.0 ground-truth check |
| `cft-anyons-es5` | SRC-STRING-NET maps to wrong Levin-Wen paper (PDF is cond-mat/0510613; script cross-refs id=324 = cond-mat/0404617, same authors) | bug | P2 | P3.0 ground-truth check |
| `cft-anyons-umx` | `build-citation-index.py` "summary.tex lines" field lists author-name occurrences, NOT `\unchecked` positions (per `harvest_atom_backrefs` PATTERNS list) | bug | P2 | P3.2.a discharge mismatch |
| `cft-anyons-6ku` | Promote per-atom editorial decisions (`lit_paper_ids` / `src_ids` / `lit_bibkeys`) from Python source to `scripts/citation_atoms.yaml` | task | P3 | P2.8 reviewer MINOR; bundleable with `eit`/`es5`/`umx` |

**Carryover from prior session (unchanged status):**

| ID | Title | Type | P | Disposition |
|---|---|---|---|---|
| `cft-anyons-q6h` | LB-1: MMA `enumerate_fusion_trees` multiplicity bug | bug | P2 | Phase 8 — Julia |
| `cft-anyons-2ae` | LB-2: dense Ising c=1/2 sector test | task | P3 | Phase 8 — Julia |
| `cft-anyons-pvu` | LB-3: TensorCategories-API fabrication audit | task | P3 | Phase 8 — Julia |
| `cft-anyons-d7w` | LB-4: re-validate archive-path citations post-import | task | P3 | Phase 2/5 follow-up |
| `cft-anyons-wfr` | Hard-coded `/home/tobias/...` path in `scripts/check-references-sha256.py:17` | bug | P3 | Trivial; handle opportunistically |
| `cft-anyons-qi0` | P2.5 follow-up: MIGRATION_LOG Deviations entry for `>=` vs `==` thresholding | task | P3 | Bundle with next MIGRATION_LOG touch |
| `cft-anyons-d2v` | Doc-sync: `MIGRATION_PLAN.md:157` P2.7 routing line stale | task | P3 | Bundle with next MIGRATION_PLAN refresh (also picks up P3.0 + P3.4 sync) |

**Grouping for next agent:**
- **`build-citation-index.py` cleanup batch** (single Phase-3-cleanup commit chain when Phase 4 has breathing room): `eit`, `es5`, `umx`, `6ku` — all four are best fixed together (same script; YAML promotion is the natural enabler).
- **`MIGRATION_PLAN.md` doc-sync batch** (bundleable): `d2v` (P2.7 routing line) + the new P3.0 / P3.4 deviation pointers; also touches CITATION_INDEX cross-refs.
- **Trivial bug fix** (handle opportunistically): `wfr`.
- **Trivial MIGRATION_LOG fix** (bundle with next touch): `qi0`.
- **Long-tail Phase-5/8 follow-ups** (LB series, unchanged): `q6h`, `2ae`, `pvu`, `d7w` — defer until the relevant phase.

CLOSED this session: `cft-anyons-9yu` (Phase 3 epic), `cft-anyons-55g` (P3.0), `cft-anyons-3rw` (P3.1), `cft-anyons-r25` (P3.2.a), `cft-anyons-rpf` (P3.2.b), `cft-anyons-h81` (P3.2.c), `cft-anyons-qfg` (P3.3), `cft-anyons-3wf` (P3.4), `cft-anyons-qdd` (PRD↔INDEX asymmetry resolved via `aq:koo-saleur`).

---

## Phase 4 entry point — for the next-session agent

**Phase 4 mission** (per `stocktake/MIGRATION_PLAN.md:180-202`): migrate the CAD `Formalisation/LinearAlgebra/` subdirectory — 13 files about matrices, isometries, polar decomposition, no-mixing, tensor products, Kraus channels. **No fusion-category content**; these import only Mathlib. They are the safest Lean content to migrate.

**Read order to start Phase 4:**

1. `PRD.md` (v1; note Phase status line is post-Phase-1 — see metadata above).
2. `GLOSSARY.md`, `CONVENTIONS.md` (definitional bedrock; Phase-5 GLOSSARY task-class lists relevant entries — see PRD §"GLOSSARY entries to internalise, by task class").
3. `CLAUDE.md` / `AGENTS.md` (methodology + 11 Rules + hallucination-risk callouts; identical pair). **Critical:** the Lean `0 sorry / 0 axiom` invariant (callout in CLAUDE.md "Hallucination-risk callouts") is load-bearing.
4. `stocktake/MIGRATION_PLAN.md` §`Phase 4` (lines 180–202).
5. `stocktake/reports/cad-lean.md` — the inheritance picture for CAD Lean (referenced from MIGRATION_PLAN); particularly §6 for the reverse-dependency flag (`Foundations/Configurations.lean` imports `Fibonacci/FusionRules.lean` in CAD — that's a Phase-5 issue, not Phase-4).
6. `MIGRATION_LOG.md` Deviations + last rows (P3.0–P3.4 plus the Deviations bullets from this session).
7. This file.

**Phase 4 dispatch — concrete:**

- **P4.1** (foundational; M only): copy CAD's `lakefile.lean`, `lean-toolchain`, `lake-manifest.json` to `cft-anyons/`; ensure `Formalisation/` is the lib root; run `lake update` + `lake build` (empty package returns successfully). Pin Mathlib to `d6dab93` per CAD (do NOT drift the pin without escalation — see CLAUDE.md Stop conditions).
- **P4.2 through P4.14** (one atomic commit per Lean file; 13 total): copy each `LinearAlgebra/<file>.lean` from CAD's `Formalisation/LinearAlgebra/`; run `lake build`; per file, append `-- GLOSSARY: <term>` lines in the module docstring referencing the load-bearing entries. Per CAD migration plan order: `Isometry`, `Polar`, `Tensor`, `TensorPower`, `HeterogeneousTensor`, `Trace`, `Postcompose`, `Component`, `NoMixing`, `FineGraining`, `CoherentSystem`, `DiagonalScaling`, `ChargeOnly`.
- **P4.15** (mechanical, M + I): update PROVENANCE.md with source hashes + commit hash for each imported file.

**Source repo location for Phase 4:** sibling `/home/tobiasosborne/Projects/cft-anyons-deprecated/Formalisation/LinearAlgebra/` (verified at last access; same sibling used as the AF-externals source pre-Phase-7, see Gotcha 36).

**Phase 4 gotchas already known:** the `Polar.lean` file inputs `B^{-1/2}` from outside (Mathlib gap; documented in `GLOSSARY.md` `def:polar-repair` Notes — see PRD §"GLOSSARY entries to internalise, by task class" — Lean migration row). Don't try to provide it; the file is a refinement not a polar-decomposition implementation.

---

## New gotchas surfaced this session (numbering continued from prior HANDOFF #31)

32. **`pdflatex` steady state for `summary.tex` is 3 passes, not 2.** Adding `\cite{...}` after a `thebibliography` block introduces a transient "Label(s) may have changed" warning at pass 2 that clears at pass 3. The first commit to discharge a `\cite` (P3.2.a) is the only one where this matters operationally; subsequent commits' M-gates need to run a third pass before declaring "clean log diff." Documented in P3.2.b/c commit bodies.

33. **`scripts/build-citation-index.py` `Discharge status` is SRC-*/lit-DB-presence-based, NOT `\unchecked`-presence-based.** Discharging a `\unchecked` macro at the `summary.tex` level (P3.2) does NOT auto-flip the atom's `Discharge status` in CITATION_INDEX from `undischarged`/`partial` to `discharged`. The status depends on hard-coded `src_ids` / `lit_paper_ids` / `lit_bibkeys` / `af_node_ids` in each `_atom(...)` call at `scripts/build-citation-index.py:155-305`, consumed by `discharge_status()` at `:565-592`. Conversely, removing all `\unchecked` macros for an atom would not flip its status if the references/lit mappings stayed. This is the script's design choice (citation-provenance vs claim-discharge); a CITATION_INDEX schema-clarity follow-up is filed in `cft-anyons-umx` for the future cleanup pass. **For next session: do not interpret an atom's "discharged" status as evidence that all its `\unchecked` flags are gone.**

34. **CITATION_INDEX `summary.tex location(s)` field lists author-name occurrence lines, not `\unchecked` positions.** Per `cft-anyons-umx`: the `harvest_atom_backrefs` PATTERNS list at `scripts/build-citation-index.py:336-368` greps for author surnames/keywords. For `osborne-stottmeister` the field listed 4 lines (`2303/2381/2446/2466`) but the actual `\unchecked` macros for that atom were at 3 sites (`2304/2380/2468`); line `2446` had no `\unchecked` at all (inside a `\section*{Reference status}` enumerate covered by the blanket declaration at line 2437). **When picking discharge sites in a future Phase, cross-check with `grep -n '\\unchecked' summary.tex` against the CITATION_INDEX list rather than trusting the field as-is.**

35. **`\cite{}` requires a `\begin{thebibliography}` block.** `summary.tex` had no `thebibliography` environment before P3.0; the plan jumped from P3.1 (list emission) to P3.2 (per-flag discharge) without specifying that infrastructure. The required `\bibitem` entries for Phase-3 discharges are now present (5 entries: SRC-GOLDEN-CHAIN, SRC-OAR-FERMIONS, SRC-OAR-WAVELETS, SRC-OSBORNE-CONTINUUM, SRC-STRING-NET). **If a future phase needs to discharge an atom with no corresponding `\bibitem`**, an additive P3.0-style block extension is required first (atomic commit; substantive; ERRATA-tracked).

36. **`/home/tobiasosborne/Projects/cft-anyons-deprecated/` (sibling repo) is the canonical pre-Phase-7 AF-externals source AND the Phase-4 Lean-file source.** CITATION_INDEX.md's "AF externals" section references the sibling explicitly: 5 externals at `cft-anyons-deprecated/af/master/externals/` at the P2.8/P3.4 snapshot. Phase 4 reads CAD Lean files from `cft-anyons-deprecated/Formalisation/LinearAlgebra/`. Don't move/delete the sibling repo until Phase 7 imports.

37. **`MIGRATION_PLAN.md:170-176` plan text is stale post-P3.0 / post-P3.4.** Plan literal still says "P3.1 ... P3.2 ... P3.3 ... P3.4" with no mention of the P3.0 bibliography prerequisite, and the P3.4 count-metric ambiguity ("decreased by exactly the count of P3.2 atomic steps") was not resolved by editing the plan this session (both interpretations are coherent; deviation is documented in `MIGRATION_LOG.md`). Filed in `cft-anyons-d2v` carryover (originally a P2.7-line-157 fix; expand to cover P3.0+P3.4 in the same MIGRATION_PLAN doc-sync pass).

38. **PRD.md v1 Status line is stale by 2 phases.** PRD reads `Status: Phase 1 ... complete; Phase 2 ... unblocked` (line 15-18). Phase 2 completed in the prior session; Phase 3 completed this session. A PRD v1→v1.1 refresh is opportunistic for the next session (touches Status line + Canonical-artifacts CITATION_INDEX bullet "Pre-Phase-3" → "Phase 3 complete; rebuild at P3.4" + Known-limitations cross-ref to `RESEARCH_NOTES.md` `aq:<slug>` entries). Not blocking Phase 4.

---

## What NOT to do in the next session

- **Do NOT rebuild `CITATION_INDEX.md` without re-running `scripts/build-citation-index.py`.** It is an auto-generated artifact; the file's docstring update-policy enforces "regenerated by script; hand-edits between regenerations are discouraged." Edits flow: change `summary.tex` (or the atom map in the script) → re-run → commit both.
- **Do NOT hand-edit `CITATION_INDEX.md` between regenerations.** Same reason. If a fix to the script is needed (e.g., `cft-anyons-eit`/`es5`/`umx`/`6ku`), edit the script + re-run + commit both files in one atomic commit.
- **Do NOT touch the `\unchecked` discharge protocol without an ERRATA entry + Core-tier hostile review.** Every `summary.tex` discharge or footnote insertion this session was its own atomic commit with its own ERRATA entry and its own Opus 4.7 hostile-review subagent. Do not bundle; do not bypass.
- **Do NOT modify `summary.tex` outside an ERRATA-tracked atomic commit.** This is the canonical artifact (PRD line 107: "edits ONLY via ERRATA-tracked atomic commits"); Phase 4 should not touch `summary.tex` at all.
- **Do NOT run `bd init --force`.** Destroys bd issue history. On a fresh clone use `bd import .beads/issues.jsonl`.
- **Do NOT drift the Mathlib pin from `d6dab93`** without escalating to the user (CLAUDE.md Stop condition).
- **Do NOT start Phase 5 (Lean fusion-category content) before Phase 4 closes.** Phase 5 depends on the `LinearAlgebra/` layer landing first.
- **Do NOT proceed with Phase 4 without first reading `stocktake/reports/cad-lean.md`** (the CAD-Lean inheritance picture) — particularly the §6 reverse-dependency flag for `Foundations/Configurations.lean` (a Phase-5 issue, but you need to know it exists when planning the Phase-4→Phase-5 transition).
- **Do NOT delete files from `archive/chats/`** — they are deep storage / superseded.
- **Do NOT trust the literal text of `MIGRATION_PLAN.md:170-176`** without cross-checking against `MIGRATION_LOG.md` Deviations (P3.0 prerequisite + P3.4 count-metric ambiguity not yet reflected in plan).
- **Do NOT delete or move `cft-anyons-deprecated/`** — Phase 4 reads Lean files from it, and the AF-externals section of CITATION_INDEX still references it (see Gotcha 36).
- **Do NOT treat an atom's CITATION_INDEX "Discharge status" as proof that all its `\unchecked` flags are gone** (see Gotcha 33). Use `grep -n '\\unchecked' summary.tex` for ground truth on flag presence.

---

## Quick orientation for the next agent (5–10 min)

1. **`PRD.md`** — v1; entry-point document. Note the Status line is stale by 2 phases (Gotcha 38); the rest of v1 is current.
2. **`CLAUDE.md` / `AGENTS.md`** — methodology + 11 Rules + hallucination-risk callouts. Re-read at session start, after `/clear`, after any context compression. **For Phase 4: pay particular attention to the Lean `0 sorry / 0 axiom` invariant callout and the GLOSSARY entries listed under PRD §"GLOSSARY entries to internalise, by task class" → Lean migration row.**
3. **This file (HANDOFF.md)** — session-specific state. Phase 3 just closed; Phase 4 is next.
4. **`stocktake/MIGRATION_PLAN.md` §Phase 4** (lines 180–202) — the 15-step plan (P4.1 lake skeleton + P4.2–P4.14 one-file-per-commit + P4.15 PROVENANCE).
5. **`stocktake/reports/cad-lean.md`** — particularly §5 (notable gaps) and §6 (reverse-dependency flag for Configurations.lean — relevant to Phase 5 planning but worth knowing).
6. **`bd ready`** in shell — confirm queue (11 open; 4 new P3-cleanup `eit`/`es5`/`umx`/`6ku` are the largest cluster; none are P4-blocking).

Cross-device note: this repo is active on the `/home/tobiasosborne/` device. The `.beads/` directory permissions warning (`0755`, recommended `0700`) persists; fix with `chmod 700 /home/tobiasosborne/Projects/cft-anyons/.beads` opportunistically.

---

## Session-close protocol (CLAUDE.md §Session completion)

- [x] **Filed remaining-work bd issues**: 4 new P3-cleanup follow-ups (`eit`, `es5`, `umx`); P3.0/P3.1/P3.2.a/b/c/P3.3/P3.4 sub-tasks (all 7 closed in their respective commits); Phase 3 epic `cft-anyons-9yu` CLOSED at P3.4. PRD↔CITATION_INDEX asymmetry `qdd` CLOSED via P3.3 `aq:koo-saleur`. 11 open total at session end (vs 9 at prior session close).
- [x] **Run quality gates** (applicable to what this session touched):
  - `pdflatex summary.tex` — PASS (3-pass steady state; 33 pages; 39 warnings; 0 `Undefined`-class; 0 `Citation undefined`; 0 `No \bibitem`).
  - `python3 scripts/check-references-sha256.py` — no regression (file unchanged this session).
  - `python3 scripts/check-references-line-locators.py` — runs over post-P3 `summary.tex`; gate fires in earnest now that `\cite{SRC-*}` markers exist; current scan PASS.
  - `python3 scripts/check-literature-db.py` — no regression (DB unchanged this session).
  - `python3 scripts/check-literature-tree.py` — no regression (literature/ unchanged this session).
  - `python3 scripts/build-citation-index.py` — deterministic (CITATION_INDEX SHA256 `99e65fab…`; byte-identical on 2 runs).
- [x] **Issue status updated**: 7 P3 sub-tasks + Phase 3 epic + PRD↔INDEX asymmetry closed; 4 new P3-cleanup followups opened.
- [x] **`bd export -o .beads/issues.jsonl` before commit** — done in this commit (42 issues exported).
- [x] **HANDOFF rewritten** for end-of-session state (this commit).
- [ ] **Push to remote** — orchestrator performs the push as the final session action immediately after this commit lands.

---

## Recent commit log (10)

```
ac51316 P3.4: Rebuild CITATION_INDEX + verify \unchecked delta (5 of 26 → 21)
a5364f8 P3.3: Footnotes linking 6 undischarged \unchecked items to RESEARCH_NOTES acquisition queue
c607efa P3.2.c: Discharge string-net \unchecked → \cite{SRC-STRING-NET} (1 site)
c8d055b P3.2.b: Discharge feiguin-golden-chain \unchecked → \cite{SRC-GOLDEN-CHAIN} (1 site)
3403ca5 P3.2.a: Discharge osborne-stottmeister \unchecked → \cite{SRC-OAR-*} (3 sites)
6d9ca8c P3.0/P3.1: Add \begin{thebibliography} skeleton + emit dischargeable list
157f679 HANDOFF.md: end-of-session refresh (Phase 2 complete)
1113ddc P2.8: Build scripts/build-citation-index.py and populate CITATION_INDEX.md
2dbc617 P2.7: PROVENANCE Phase-2 imports + README updates (routing deviation per user)
2ecf220 P2.6: Copy literature CLI to scripts/lit/ (port-and-verify, one-line REPO_ROOT adjust)
```

(`git log --oneline -11` will show this commit on top after it lands.)
