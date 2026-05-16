# Stocktake: microscopic-mobile-anyons — Meta-Documents and Issue Tracker

**Date of stocktake:** 2026-05-16
**Examiner slice:** Meta-documents (HANDOFF.md, prd.md, CLAUDE.md, AGENTS.md, README.md) + `.beads/` issue tracker
**Project directory:** `/home/tobias/Projects/microscopic-mobile-anyons/`

---

## 1. Scope

This report covers only the project management layer of `microscopic-mobile-anyons/`: five meta-documents and the beads issue database. It does not examine source code, tests, or literature outputs (those belong to separate stocktake slices). Cross-references to `cft-anyons/summary.tex` are drawn from that document's known content rather than re-reading it here.

---

## 2. File-by-File Inventory

| File | Size claim | What it asserts |
|---|---|---|
| `HANDOFF.md` | ~12 KB | Two-session handoff record (2026-03-10 and 2026-04-27). Mar-10 entry describes the number-changing fine-graining isometry experiment; Apr-27 entry records a wholesale pivot to a deep literature review, closing all 23 Lit-* beads issues in a single session. Literature DB reached 630 papers / 702 citation edges / 347 local PDFs / 122 marker outputs. Provides a 5-priority worklog for the next agent. |
| `prd.md` | ~9 KB | v2 PRD (March 2026, supersedes v0 archived in `archive/v0/`). States the core goal, 7 requirements (R1–R7), 6 constraints (C1–C6), 7 success criteria (SC1–SC7), and the full OAR (Operator Algebraic Renormalization) pipeline as the continuum-limit strategy. Lists prior art. |
| `CLAUDE.md` | ~3 KB | Agent workflow conventions: plan-mode default, subagent strategy, verification before marking done, autonomous bug-fixing, physics constraints (first-quantisation only; 1-based indexing; TensorCategories.jl directly; no second quantisation), notation rules, and beads quick-reference commands. |
| `AGENTS.md` | ~1 KB | Minimal agent onboarding: `bd` quick-reference and a mandatory "landing the plane" protocol — must create follow-up issues, run quality gates, update issue statuses, push to remote, verify, and write a handoff. NEVER stop before `git push` succeeds. |
| `README.md` | ~1 KB | One-paragraph description + directory structure + setup snippet + key idea (the morphism-space Hilbert space definition) + a status checklist still showing most items unchecked (only "project structure and TensorCategories.jl setup" ticked). |

**Critical observation on README.md:** The checklist is a snapshot from early in the project and has not been updated to reflect the substantial work done by March 2026 (M1–M6 complete, OAR Phases 1–4 complete, number-changing isometry proven, full literature DB built). It is effectively stale.

---

## 3. Key Concepts and Artifacts

### Project Goal (PRD)

Construct microscopic 1D lattice models for **mobile anyons from arbitrary unitary fusion categories** where both the number and positions of anyons fluctuate. The central insight: variable anyon number decouples lattice spacing from inter-particle spacing, enabling a genuine continuum limit. The path:

> categorical data → Hilbert space (morphism-space Fock sum) → lattice Hamiltonians (hopping, interaction, braiding, pair creation/annihilation) → fine-graining isometries → inductive limit (OAR) → continuum QFT

The Hilbert space is `H = ⊕_{N=0}^{L} ⊕_c ⊕_{configs} Mor(X_c, X_{a₁} ⊗ ... ⊗ X_{aₙ})`, summing over hard-core placements. Target categories: sVec (recovers free fermions), Fibonacci (c=7/10 golden chain limit), Ising.

### Agent Conventions (CLAUDE.md / AGENTS.md)

- **Plan-mode mandatory** for any 3+-step or architectural task.
- **Physics red lines:** first quantisation only; 1-based indexing throughout; TensorCategories.jl API directly (no wrapper structs); multiplicity-aware definitions.
- **Notation:** `Mor(A,B)` in prose, `Hom(A,B)` in Julia; TikZ macros from `tex/tikz_styles.tex` only.
- **Session discipline:** must push to remote before declaring session complete; mandatory handoff write-up.
- **Beads as primary task memory:** respect the dependency DAG; close issues only after proving work.

### Beads Workload Summary

The `.beads/` directory contains two JSONL stores. The live `issues.jsonl` has **23 issues, all closed**, generated and closed in a single session on 2026-04-27. The `sync_base.jsonl` preserves the prior state of **20 issues, all closed**, from the March 2026 session. No open, in-progress, or blocked issues exist in either store. The SQLite `beads.db` appears depopulated (the `bd` CLI reports 0 issues when pointed at it directly; all live data is in the JSONL).

**April 2026 session — 23 Lit-* issues (all closed 2026-04-27, within ~1 hour):**

| Group | Count | Covers |
|---|---|---|
| Lit-H (infrastructure) | 5 | SQLite schema, CLI skeleton, dedup/rename PDFs, PDF ingest, SURVEY.md generation |
| Lit-T (tooling) | 6 | `lit add`, `lit fetch-cites`, `lit pdf`, `lit md`, `lit gscholar` (Playwright), `lit export` |
| Lit-C (cite chases) | 9 | Garjani-Ardonne 2016, Poilblanc 2011/12, Hollands 2022, Stottmeister 2022, Shi-Senthil 2025 + FCI burst, Nakajima 2025, Pre-2013 lineage, Adjacent-tradition sweep, Triage/tier classification |
| Lit-S (synthesis) | 3 | Per-tier write-up in SURVEY.md, gap diagram, biblatex integration into tex/main.tex |

**March 2026 session — 20 issues (all closed, from sync_base.jsonl):**

Covered M1–M6 (F-symbol engine, sVec validation, general matrix element engine, Fibonacci exact diag, golden chain CFT verification, pair creation/annihilation), OAR Phases 1–4 (one-particle wavelet map, sVec many-body fine-graining, Fibonacci fine-graining, convergence tests), and categorical determinant isometry. Also one literature review scoping issue (`zbn`).

**No epics, no labels, no dependencies recorded** (all dependency fields were null in both stores). The issue taxonomy was purely by naming convention (Lit-H/T/C/S prefix groups; M1-M6 milestones; Phase 1-4 OAR phases).

**Ready work:** zero (no open issues remain). **Blocked:** zero.

---

## 4. State Assessment

### Done (per HANDOFF.md, March 2026 session)

- M1–M6 lattice operators: F-symbol engine, sVec free-fermion validation, general matrix element engine, Fibonacci exact diag, golden chain CFT limit, pair creation/annihilation (622 tests)
- OAR Phase 1: sVec fine-graining, Haar + D4 wavelets
- OAR Phases 2–3: Universal normalized product map for any category/wavelet
- OAR Phase 4: Convergence tests, multi-step composition, spectral convergence
- Number-changing isometry `V = V₀ + (I-Π_{V₀})h†V₀ · G₂^{-1/2}D^{1/2}`, proven to give V†V = I to machine precision for Fibonacci and Ising (L=3,4)

### Done (per HANDOFF.md, April 2026 session)

- Full literature DB: 630 papers, 702 citation edges, 347 local PDFs, 122 marker-converted MD files
- `scripts/lit.py` CLI (init, status, seed, add, fetch-cites, pdf, md, export, gaps)
- Headed-Playwright fallback script `scripts/lit_fetch_pdf.mjs` (wired but not end-to-end tested)
- `literature/SYNTHESIS.md`: narrative two-lineages map, strategic positioning, gap diagram
- `literature/SURVEY.md` and `literature/references.bib` (630 BibTeX entries)

### In Progress / Incomplete (per HANDOFF.md Priority list)

1. **Priority 1:** 23 PDFs timed out during marker conversion (5 min limit). Need retry with `--timeout 1800`. Most strategically important include Hollands 2022 (2205.15243), Osborne-Stottmeister 2021, Stottmeister 2020, and three non-arXiv items (Eck thesis, Etingof book, Etingof lecture notes).
2. **Priority 2:** Three manual PDF acquisitions needed — Bonderson PhD thesis (Caltech 2007), Pachos textbook, Wen textbook.
3. **Priority 3:** `lit citations-from-md` subcommand not implemented (would parse marker outputs for arXiv IDs and backfill citation edges; particularly valuable for Stottmeister 2201.11562 which has 11 arXiv refs in its bib).
4. **Priority 4:** biblatex integration — `tex/main.tex` still uses inline `\bibitem`; should be replaced with biblatex against `literature/references.bib`.
5. **Priority 5:** S2 API key (rate-limited without auth); author normalisation backfill.

Additionally, from the March 2026 "What's next" section:
- Decision pending on whether to promote `build_number_changing_isometry()` from test file to `src/MobileAnyons/finegraining.jl`
- Scaling study of the 3% intertwining improvement vs system size L
- Multi-step composition using number-changing isometry

### Stale

- **README.md status checklist**: Shows only "project structure" ticked; all remaining items appear unchecked. This is at least 15 months of work behind the actual state.
- **No open beads issues**: The issue tracker is fully quiescent. No work has been tracked since April 27, 2026. The backlog described in HANDOFF.md (Priorities 1–5) has not been filed as issues.

---

## 5. Overlap with cft-anyons/summary.tex

### Same project? Same definitions?

The projects share a mathematical parent but are **complementary and distinct**, not duplicates.

**Shared foundations:**
- Both use the morphism-space construction for Hilbert spaces: sectors are Hom-spaces in a unitary fusion category C.
- Both target Fibonacci and Ising categories as worked examples.
- Both cite the Osborne-Stiegemann OAR framework (1901.06124, 2002.01442, 2107.13834) as the continuum-limit strategy.
- Both use isometric fine-graining maps as the key technical object.
- Stottmeister 2022 appears as a key reference in both.

**Key divergences:**

| Axis | microscopic-mobile-anyons (MMA) | cft-anyons (summary.tex) |
|---|---|---|
| Hilbert space model | Variable-N Fock sum over hard-core placements; full first-quantised Fock space `H = ⊕_N ⊕_{configs} Mor(X_c, X_{a₁}⊗...⊗X_{aₙ})` | Partition Hilbert spaces `H_P^W = Hom_C(W, A_P)`; fixed geometry, algebra-object approach |
| Fine-graining maps | Isometries between L-site and 2L-site algebras; focus on number-changing vs number-preserving | Cellwise isometric refinement maps `E_{P→P'}` on partition structures |
| Algebra objects | Not the central object; individual anyons are the primitives | Central: `A_P = ⊗_{I∈P} A_{I}`, comultiplication `Δ = m†/√λ` |
| Variable N | Core feature: pair creation/annihilation makes N dynamical | Not the focus; N is fixed within a sector |
| Lattice operators | Explicit Hamiltonians (hopping, interaction, braiding, pair creation) | No Hamiltonians; kinematic structure only |
| Koo-Saleur | Mentioned as Phase 2 (closed issue), not detailed | Core worked example with explicit Fourier-mode construction |
| Polar decomposition | Not mentioned | Key technique for canonical sections |
| Literature | 630-paper DB; explicit strategic positioning vs Hollands, Shi-Senthil | Brief prior-art section in prd.md; summary.tex is the analytic document |

**Definitional alignment:** Both use `Hom_C` notation for morphism spaces, but the spaces themselves are indexed differently. MMA indexes by particle placement (hard-core configs on sites); cft-anyons indexes by partitions `P` and total charge `W`. These are not contradictory — they appear to be two different slices of the same underlying categorical construction (the Fock space vs the partition/sector Hilbert space), both leading to the OAR continuum limit, but via different intermediate structures.

**Risk:** There is potential for the two projects to have independently developed overlapping notation without cross-checking. Specifically, the fine-graining maps `E_{P→P'}` in cft-anyons and the isometries `V_{L→2L}` in MMA should be compared carefully when writing up, as they may be the same mathematical object described differently.

---

## 6. Recommended Disposition

### Per meta-document

| Document | Disposition | Action needed |
|---|---|---|
| `HANDOFF.md` | **Retain as authoritative session record.** | The Priority 1–5 worklog is the de-facto open backlog. Should be converted into beads issues immediately at next session start. |
| `prd.md` | **Retain; mark v2 as current.** | Requirements R1–R7 and success criteria SC1–SC6 appear satisfied by March 2026 work (SC7 — continuum limit convergence to identifiable QFT — is the one remaining open science question). Consider a v3 update reflecting the literature pivot and strategic repositioning. |
| `CLAUDE.md` | **Retain without change.** | Conventions are sound and actively used. Physics red lines (first quantisation, 1-based indexing) remain appropriate. |
| `AGENTS.md` | **Retain without change.** | The mandatory push protocol and issue-filing discipline are important for session continuity. The fact that HANDOFF.md Priority 1–5 were not filed as issues is a gap that violates this protocol. |
| `README.md` | **Update urgently.** | The status checklist is severely stale — all items marked unchecked were completed by March 2026. Should reflect: M1–M6 done, Phases 1–4 done, number-changing isometry done, 630-paper literature DB done. |

### Issue tracker as a whole

The beads database is **quiescent and correct** as far as it goes — all 23 April-session issues and all 20 March-session issues are legitimately closed. However:

1. **The backlog is stranded in HANDOFF.md prose.** Priorities 1–5 (23 marker retries, 3 manual PDFs, `citations-from-md` subcommand, biblatex integration, S2/author-normalisation) should be filed as beads issues before any new agent begins work. Without this, session continuity is broken.

2. **The SQLite db appears to need re-hydration.** The `bd` CLI (when pointed at `.beads/beads.db`) returns 0 issues. The live data is in `issues.jsonl`. The daemon was running during the April session (daemon.pid, bd.sock present) but is now stopped. A new agent should run `bd --db .beads/beads.db list` and if empty, trigger a re-import from JSONL, or simply use the Skill tool (`beads:import`) to restore from `issues.jsonl`.

3. **No dependency graph was used** (all dependency fields null). For the next phase — which involves interleaved tasks (marker retries depend on nothing; biblatex integration depends on references.bib being finalized; citations-from-md depends on marker completion) — filing issues with explicit `bd dep add` edges would improve agent planning.

4. **Overall project health is good.** The science is substantially advanced (all core lattice machinery built, OAR isometries working, literature comprehensively surveyed). The remaining work is infrastructure cleanup and the hard open question of identifying the continuum QFT.
