# Anyons/CFT Project Cluster — Stocktake

**Date:** 2026-05-16
**Scope:** `/home/tobias/Projects/{cft-anyons, microscopic-mobile-anyons, cft-anyons-deprecated}`

This document is the top-level synthesis of an exploration run by 7 parallel
Sonnet subagents on 2026-05-16. The detailed reports (one per slice, file-by-file
inventories) live in `reports/`. Read them when you need depth; this file is
the navigable map.

| Detailed report | Slice |
|---|---|
| [`reports/mma-julia.md`](reports/mma-julia.md) | MMA Julia source + tests |
| [`reports/mma-tex-lit.md`](reports/mma-tex-lit.md) | MMA tex, literature, archive/v0 |
| [`reports/mma-meta.md`](reports/mma-meta.md) | MMA HANDOFF/PRD/CLAUDE/beads |
| [`reports/cad-lean.md`](reports/cad-lean.md) | Deprecated Lean formalisation |
| [`reports/cad-af.md`](reports/cad-af.md) | Deprecated `af/` workspace state |
| [`reports/af-cli-reference.md`](reports/af-cli-reference.md) | `af` CLI quickref (reusable) |
| [`reports/cad-meta.md`](reports/cad-meta.md) | Deprecated heavy meta docs |
| [`reports/cad-aux.md`](reports/cad-aux.md) | Deprecated tex/references/results/scripts |

---

## 1. TL;DR — what these three projects actually are

All three projects are **the same mathematics from different angles**: building
indefinite-particle Hilbert spaces for mobile anyons modelled by a unitary
fusion category, with isometric refinement maps to a continuum limit (OAR /
Osborne–Stottmeister framework). They reinvented each other's notation
independently and largely without cross-referencing.

| | What it is | Quality | Unique contribution |
|---|---|---|---|
| **`cft-anyons/`** (current) | A 2483-line `summary.tex` distilling 4 chat transcripts + 4 reviewer audits. Math narrative, no code. | Mathematically advanced (partition Hilbert spaces, algebra-object Δ=m†/√λ, polar decomposition section, Koo–Saleur) but bug-flagged by reviews. | The most up-to-date mathematical formulation; explicit acknowledgement of `\unchecked` external claims. |
| **`microscopic-mobile-anyons/`** (MMA) | Julia computational backend + 630-paper SQLite bibliography + a v0 archive. | Working numerical code; one polished new-math section (`finegraining.tex`); v0 archive has confirmed indexing bugs. | (a) **Number-changing isometry V=V₀+V₂** via Garjani–Ardonne pair creation — genuinely new mathematics with proofs + numerical verification at 10⁻¹⁴. (b) The **literature DB**. (c) A working **Julia/TensorCategories.jl backend**. |
| **`cft-anyons-deprecated/`** (CAD) | Lean 4 formalisation (28 files, 3049 lines, **0 sorry, 0 axiom**, `lake build` passing) + an `af` adversarial-proof workspace (561 ledger events, 88% complete) + 25+25 Julia+WolframScript triple-check corpus + 15 hashed PDFs with line locators. | Best-engineered slice of the cluster. Strict provenance discipline. Lean is finite/coordinate skeleton only — does not reach the categorical layer. | A real machine-verified formalisation of the finite-coordinate scaffolding (Fibonacci F-matrix algebra, PF/coassociative binary etas, polar section algebra, channel properties, Kraus PSD preservation). |

### The misleading directory name
`cft-anyons-deprecated/` is **not actually deprecated** in any meaningful
sense. Its `NEXT_AGENT_HANDOFF.md` (dated 2026-05-15) refers to its workspace
as `/home/tobias/Projects/cft-anyons` — i.e. the same physical path the
current project occupies. The most likely sequence: the formalisation-first
project was renamed when the chat-transcript-driven `summary.tex` work began.
No document in any of the three projects records an explicit pivot decision
or describes one project as obsoleting another.

---

## 2. The three Hilbert-space formulations (notational reinvention)

The three projects each define essentially the same Hilbert space three
different ways:

| | Indexed by | Formula |
|---|---|---|
| **summary.tex** | spatial partition `P` and total charge `W` | `H_P^W = Hom_C(W, A_P)` where `A_P = ⊗_{I∈P} A_I` |
| **MMA** | particle-number `N` and hard-core configurations `(x_1<…<x_N)` | `H = ⊕_N ⊕_configs Hom_C(c, X_{a_1} ⊗ … ⊗ X_{a_N})` |
| **CAD handoff** | particle-number sector `N` and total charge `W` | `H_N^W = Hom_C(W, Q^⊗N)` |

These differ in geometric framing (cell-partition vs site-configuration vs
abstract N-tensor) but the underlying Hom-space construction is identical.
The refinement maps `E_{P→P'}` (summary.tex), `V_{L→2L}` (MMA), and `E` (CAD)
appear to be the same mathematical object; this should be checked carefully
before any cross-migration.

---

## 3. What is and isn't formally proven anywhere

| Topic | summary.tex | MMA Julia | MMA finegraining.tex | CAD Lean | CAD af |
|---|---|---|---|---|---|
| Fibonacci F-matrix involution F²=I | analytical | tested numerically | — | **proved** | accepted (1.3.2) |
| Golden-ratio identities (φ²=φ+1, …) | analytical | — | — | **proved** | accepted (1.3.1) |
| PF binary η isometry | analytical | — | — | **proved** | accepted (1.3.3) |
| Coassociative binary η isometry | analytical | — | — | **proved** (scalar level only) | accepted (1.3.12, 1.3.16, 1.3.17) |
| Algebra-object Δ=m†/√λ categorical coassociativity | analytical | — | — | **NOT proven** (explicit scope disclaimer) | not formalised |
| Polar section E = B†(BB†)^{-1/2} isometry | analytical | Löwdin used implicitly in `wavelets.jl` | — | **proved** (with sqrt as input) | accepted (1.4.5, 1.4.9, 1.4.13) |
| No-mixing scalar formula | analytical | — | — | **proved** | accepted (1.5.x) |
| Kraus-sum PSD preservation | implicit | — | — | **proved** | accepted (1.5.x) |
| Coherent refinement system composition | analytical | tested in `test_convergence.jl` | implicit | **proved** | accepted (1.5.6, 1.5.10) |
| Length-weighted `L²(X)` continuum (§6 of summary) | analytical (Thm 6.4) | — | — | not formalised | not formalised |
| Fibonacci dagger-special algebra uniqueness (Thm 5.6) | analytical | — | — | not formalised | not formalised |
| TL chain ↔ TFI (Thm 8.6) | analytical | tested in `test_golden_chain*` | — | not formalised | not formalised |
| Koo–Saleur lattice Virasoro | unproven (\unchecked) | OBC sine variant only; `c` estimator returns NaN | — | not formalised | not formalised |
| Number-changing isometry V₀+V₂ (Garjani–Ardonne) | not in summary.tex | implemented in test (not exported) | **proved + numerically verified to 10⁻¹⁴** | not formalised | not formalised |
| Wavelet (Haar / D4) fine-graining isometry | mentioned abstractly | implemented + tested | **proved + tabulated** | not formalised | not formalised |

**Gap summary:** The Lean side covers the finite-coordinate scaffolding
thoroughly but never reaches the algebra-object / coassociativity / Koo–Saleur
layers. The MMA `finegraining.tex` covers wavelet/number-changing isometries
with proofs that are absent from both summary.tex and CAD Lean. The summary.tex
covers the most mathematically ambitious territory but has the weakest
verification (only the 4 hostile reviews).

---

## 4. Status of `summary.tex`'s `\unchecked` items

`summary.tex` flags every external reference as `\unchecked` (Section 14.3,
line 2300+). Cross-referencing what CAD has locally:

| Reference | Local PDF in CAD? | Formally discharged? |
|---|---|---|
| Feiguin et al. (golden chain F-matrix) | yes (`GoldenChainFeiguinEtAl.pdf`) | **F-matrix algebra discharged** at AF 1.3.2 |
| Osborne–Stottmeister 2107.13834 (CFT from lattice fermions / Koo–Saleur) | yes (`CFTFromLatticeFermions.pdf`) | partial — finite coherent system discharged (AF 1.5.6, 1.5.10) but Virasoro convergence not |
| Osborne–Stottmeister 2002.01442 (OAR wavelets) | yes (`OARWavelets.pdf`) | partial — finite coherence accepted |
| Trebst / Penneys / KZ for Fibonacci | yes | yes |
| Hollands 2022 (alpha-induction) | yes (`HollandsAnyonicChainsAlphaInduction.pdf`) | not formalised but locally sourced |
| **Koo–Saleur** (1994) lattice Virasoro paper directly | **no** | no |
| **FRS** (Fjelstad–Fuchs–Runkel–Schweigert) | **no** (only in Hollands bibliography) | no |
| **Pasquier** ADE lattice models | **no** (only in Garjani–Ardonne bibliography) | no |
| **Huse** ABF ↔ FQS identification | **no** | no |
| **(G₂)₁** (Fibonacci CFT identification) | **no** | no |

So: roughly half the `\unchecked` flags could be cleared with the material
already on disk; the other half (FRS / Pasquier / Huse / Koo–Saleur original /
(G₂)₁) genuinely lack local sources.

---

## 5. Bug inventory across the cluster

| Project | Bug | Severity | Status |
|---|---|---|---|
| summary.tex | Lemma 7.7 `lem:binary-Z` displays squared amplitudes, missing square roots | Critical | Flagged by all 4 reviews; in-doc warning exists but the lemma body itself still wrong |
| summary.tex | ~22 other reviewer-flagged issues (see `review_*.md`) | Mixed | Mostly unaddressed; the "Frobenius vs dagger-special" overclaim has been corrected in-doc |
| MMA Julia | `categorical_determinant_isometry` exported with "partial correction only (non-abelian)" — never validated `V†V=I` for non-abelian | Major | known; comment in code |
| MMA Julia | `virasoro_commutator_check` returns `c_estimate=NaN` — stub | Minor | known |
| MMA Julia | Soft-core occupancy unimplemented (`hilbert.jl:81` raises error) | Limitation | by design |
| MMA Julia | Only K=1,2 Daubechies wavelets supported | Limitation | by design |
| MMA Julia | `_find_state_index` linear scan in interaction.jl is O(n²) | Performance | sector-variant fixes it |
| MMA archive/v0 | STL-1: vacuum index simultaneously 0 and 1 in different files | Critical | in archive only; documented in `reviews/ultracritical_audit_2026-01-03.md`; do not migrate without fixing |
| MMA archive/v0 | STL-2, STL-3, STL-4 (duplicate definitions, second-quantised operators in formal theorems) | Major | in archive only |
| MMA meta | README.md status checklist is ~15 months stale | Minor | docs only |
| MMA meta | HANDOFF.md Priority 1–5 backlog never filed as beads issues | Process | violates project's own AGENTS.md protocol |
| CAD Lean | none (0 sorry, 0 axiom, lake-passing) | — | clean |
| CAD af | 5 stale claims by `codex-prover` from 2026-05-14/15 session | Cosmetic | expired; harmless |
| CAD af | 8 pending parent nodes despite all children validated (WP1, WP6, WP7 also pending — these are admin nodes) | Process | needs manual `af accept` of parents |

---

## 6. Asset map — what to keep, archive, migrate, drop

### Keep as primary, do not touch destructively
- `cft-anyons/summary.tex` + `chat1–4.md` + `review_1–4.md` (current math narrative + sources + audits)
- `cft-anyons-deprecated/Formalisation/` (28 Lean files, 0 sorry — the only verified formal asset in the cluster)
- `cft-anyons-deprecated/af/master/` (proof governance ledger — 561 events; do not resume that session, but keep as record)
- `cft-anyons-deprecated/references/` (15 PDFs + SHA256-hashed text extractions + manifest + line locators — the most disciplined provenance system in the cluster)
- `cft-anyons-deprecated/scripts/julia/` + `scripts/wolfram/` (25+25 triple-check scripts, one per Lean module)
- `cft-anyons-deprecated/tex/cft_anyons_formalisation.tex` (1544-line provenance doc)
- `cft-anyons-deprecated/MASTER_PROVENANCE.md` (1422-line audit trail — definitive record of what's proved)
- `cft-anyons-deprecated/NEXT_AGENT_HANDOFF.md` (entry point for any formalisation continuation)
- `cft-anyons-deprecated/handoff.md` (best plain-language spec of the finite-dimensional layer)
- `microscopic-mobile-anyons/src/MobileAnyons/` (Julia computational backend — clean, well-tested, gauge-aware)
- `microscopic-mobile-anyons/literature/` (630-paper SQLite bibliography — canonical for all 3 projects)

### Migrate / promote to `cft-anyons/`
- `microscopic-mobile-anyons/tex/sections/finegraining.tex` — the **only piece of polished new mathematics in MMA**. Contains: normalized product map theorem, number-changing isometry V₀+V₂ via Garjani–Ardonne, Hamiltonian intertwining residual table, OAR inductive limit connection. Should be folded into `summary.tex` (probably as a new section after §6, or as a separate worked example).
- `cft-anyons-deprecated/Formalisation/LinearAlgebra/` — the abstract infrastructure (Polar, NoMixing, Tensor, TensorPower, HeterogeneousTensor, Trace, FineGraining, CoherentSystem, Isometry, Postcompose, Component, DiagonalScaling, ChargeOnly). 13 files, no Fibonacci-specific content, directly reusable in a fresh formalisation in the active project.
- `cft-anyons-deprecated/Formalisation/Fibonacci/Basic.lean` + `Matrix.lean` — golden ratio algebra + F-matrix; widely useful.
- `cft-anyons-deprecated/results/CHECKS.md` (1035 lines) — relocate to `tex/` or top level since the binary `results/{julia,lean,wolfram}/` subdirs are empty.

### Archive (keep, but mark superseded; do not modify)
- `microscopic-mobile-anyons/archive/v0/tex/sections/` (~3700 lines, 23 sections — useful reference material with STL-1 vacuum-indexing bugs; selectively migrate only after fixing convention)
- `microscopic-mobile-anyons/archive/v0/reviews/` — 5 audit files including `ultracritical_audit_2026-01-03.md`; read first before any v0 migration
- `microscopic-mobile-anyons/archive/v0/src/julia/` — older Julia implementation; superseded by current `src/MobileAnyons/`
- `microscopic-mobile-anyons/archive/v0/docs/` — 19 modular concept docs; useful as conceptual map
- `microscopic-mobile-anyons/archive/v0/plans/tensorcategories_refactoring_guide.md` — useful architectural reference
- `cft-anyons-deprecated/references/text/deprecated/` — 5 text extractions retained as import-provenance audit trail (correct disposition already)
- `cft-anyons-deprecated/FORMALISATION_PLAN.md` — the 8-rule methodology is worth preserving; the execution plan is superseded

### Drop (genuinely empty or duplicate)
- `microscopic-mobile-anyons/archive/v0/src/lean/` — only `.gitkeep`; no Lean code was ever written in v0
- `microscopic-mobile-anyons/archive/v0/src/clojure/` — only `.gitkeep`
- `microscopic-mobile-anyons/archive/v0/proofs/` — only `_overview.md` stub
- `microscopic-mobile-anyons/archive/v0/.beads/` — superseded tracker state
- `microscopic-mobile-anyons/archive/v0/literature/` — strict subset of main `literature/`
- `cft-anyons-deprecated/results/{julia,lean,wolfram}/` (empty subdirs)
- `microscopic-mobile-anyons/literature/_archive/` — 4 stale annotation files with mismatched filenames

### Status uncertain — needs user decision
- `microscopic-mobile-anyons/scripts/` and `src/scripts/` — literature-fetching utilities (Python + Playwright JS); functional but not physics; could move to `microscopic-mobile-anyons/literature/scripts/` for clarity
- `microscopic-mobile-anyons` as a whole project — see §7 below

---

## 7. Cross-cutting concerns

### A. Notational reinvention
The three Hilbert-space formulations (§2 above) need explicit reconciliation
before any of the three is taken as canonical. Specifically, MMA's
`V_{L→2L}` isometries and CAD's `E` and summary.tex's `E_{P→P'}` should be
compared on a worked example.

### B. CAD Lean's "finite skeleton" boundary
CAD Lean proves matrix-level versions of every claim it touches but
explicitly **does not** construct categorical Hom functors, categorical direct
sums, or categorical tensor products. `Fibonacci/Coassoc.lean` proves only
the scalar coassociativity equations, not the categorical statement
`(η⊗id)η = (id⊗η)η`. Extending the Lean work upward to the categorical layer
is the single most well-defined remaining formalisation gap (per
NEXT_AGENT_HANDOFF.md's "general matrix polar inverse-square-root via Mathlib CFC"
recommendation — the next slice was identified but never started).

### C. The Garjani–Ardonne / number-changing gap
MMA's `finegraining.tex` introduces a **number-changing isometry V = V₀ + V₂**
(via 3-step Löwdin orthogonalisation of pair-created configurations) that
plugs the hard-core collision deficit when wavelet supports overlap. This is
not in summary.tex. Either the math is new (in which case migrate and credit
MMA's work) or it's subsumed by summary.tex's framework but in different
notation (in which case reconcile and consolidate).

### D. The af workflow is reusable
The `af` CLI and its discipline (serial verifier sub-agents, source
string-matching, three-tool checks, append-only ledger) is genuinely good
infrastructure. Even if the deprecated workspace stays dormant, the workflow
is worth keeping for future formalisation runs. `reports/af-cli-reference.md`
is a self-contained quickref intended exactly for that reuse.

### E. Beads tracker hygiene
MMA's `.beads/` is fully closed (all 43 issues closed). HANDOFF.md's Priority
1–5 backlog was never filed as issues — violating the project's own
AGENTS.md protocol. Any resumption of MMA work should refile that backlog.

---

## 8. Recommended next steps (presented as options, not a decided plan)

### Option A — minimal: fix bugs in `summary.tex`, leave everything else
1. Apply the 4 reviews to `summary.tex`. Start with the unanimous
   `lem:binary-Z` square-root bug, then walk down severity.
2. Discharge `\unchecked` flags using the CAD reference library where
   possible (Feiguin already done in CAD; Osborne–Stottmeister both papers
   are locally available).
3. Rename `cft-anyons-deprecated/` → something less misleading (e.g.,
   `cft-anyons-formalisation/` or absorb as `cft-anyons/Formalisation-v1/`).
   Leave MMA alone.

### Option B — consolidate: merge into a single repo
1. Do option A.
2. Migrate MMA's `tex/sections/finegraining.tex` into `cft-anyons/`.
3. Migrate the CAD Lean `LinearAlgebra/` infrastructure into
   `cft-anyons/Formalisation/`.
4. Migrate the CAD `references/` library into `cft-anyons/references/`.
5. Either move MMA's literature DB into `cft-anyons/literature/` or
   formally declare MMA's `literature/` the canonical location for the
   cluster.
6. Archive `microscopic-mobile-anyons/` (keep `src/` if Julia work continues)
   and `cft-anyons-deprecated/` (keep `Formalisation/` and `af/` accessible).

### Option C — extend: continue the formalisation
1. Do option B.
2. Resume Lean work using `NEXT_AGENT_HANDOFF.md` as the entry point.
3. Implement the suggested "general matrix polar inverse-square-root via
   Mathlib CFC" next slice — gets one step closer to the categorical layer.
4. Extend `af` ledger with new conjectures targeting algebra-object Δ=m†/√λ
   coassociativity and Koo–Saleur lattice Virasoro convergence (the two
   biggest unfilled gaps).

### Option D — extract value, discard structure
1. Mine the cluster for: `finegraining.tex` (new math), `Formalisation/`
   (formal proofs), CAD `references/` (provenance), MMA `literature/`
   (bibliography), `af-cli-reference.md` (reusable workflow).
2. Build a fresh `cft-anyons-v2/` from scratch starting only from these
   extracted assets + `chat1–4.md` + `summary.tex`. Discard the rest.

---

## 9. Candidates for Opus follow-up

Sonnet handled the inventory well. The genuinely tricky synthesis questions
that would benefit from an Opus deep-dive:

1. **Categorical bridge audit.** Compare CAD `Fibonacci/Coassoc.lean`'s
   scalar coassociativity with summary.tex's algebra-object `Δ = m†/√λ`
   coassociativity (§5.2). Identify the precise statement the next Lean
   slice would need to prove to bridge the finite-skeleton/categorical gap.
2. **Notational reconciliation.** Carefully compare MMA's `finegraining.tex`
   number-changing isometry construction with summary.tex §6 (length-weighted
   square-zero model) and §11 (non-tree interpolation). Determine whether MMA
   introduces genuinely new math or a relabelling.
3. **Bug triage on summary.tex.** Read all 4 reviews carefully and propose an
   ordered fix plan with edit targets (line numbers, replacement text)
   for each.
4. **af ledger postmortem.** Read the 561 ledger entries chronologically and
   reconstruct: (a) which proofs went smoothly vs which needed multiple
   repair cycles; (b) the lessons about LLM-driven formalisation that aren't
   already captured in `MASTER_PROVENANCE.md`.

None of these is required for the stocktake itself.

---

## 10. Provenance

Stocktake performed by 7 parallel `general-purpose` Sonnet sub-agents (each
read-only, each writing one report under `reports/`). Total tool budget
consumed by the swarm: ~422k tokens across ~274 tool uses, ~33 minutes
wall-clock. Reports were not edited by the orchestrator after creation.
This synthesis README is the orchestrator's work, drawing only from the 8
reports (not the underlying files).
