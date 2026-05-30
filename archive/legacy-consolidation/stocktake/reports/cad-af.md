# cft-anyons-deprecated/af — Workspace State Stocktake

**Date of stocktake:** 2026-05-16  
**Tool used:** `af` CLI (adversarial proof framework) v1.0  
**Workspace root:** `/home/tobias/Projects/cft-anyons-deprecated/af/master/`

---

## Scope

This report covers the `af` workspace found at `/home/tobias/Projects/cft-anyons-deprecated/af/`. The workspace contains one proof project, named `master`, which tracks a formalisation effort for anyon/CFT mathematics in Lean 4 with Julia and WolframScript checks. All data are read from `af` query commands and sampled ledger entries; no source files were modified.

---

## Workspace Contents Inventory

```
af/
└── master/
    ├── meta.json          (workspace version marker: {"version": "1.0"})
    ├── ledger/            (561 append-only event files: 000001.json–000561.json)
    ├── externals/         (5 JSON files: referenced external facts)
    ├── lemmas/            (empty — no lemmas extracted)
    ├── assumptions/       (empty — no formal assumptions registered)
    ├── defs/              (empty — no pending definitions)
    ├── locks/             (empty — no active file locks at time of inspection)
    └── nodes/             (empty — nodes reconstructed from ledger, not stored as files)
```

The ledger is the authoritative record. 561 events span 2026-05-14T21:37:23Z (proof_initialized) to 2026-05-15T04:31:41Z — approximately 7 hours of automated agent activity. The workspace has no outline set (`af outline` returns "No outline set"), so coverage metrics are unavailable.

---

## Conjecture Being Proven

The root conjecture (node 1, set at initialization) is:

> **Formalise the definitions, theorem targets, and conjectures in `handoff.md` with local-source provenance and Julia, WolframScript, and Lean checks wherever applicable.**

This is not a single mathematical proposition but a formalisation programme spanning 7 work packages (WP1–WP7), decomposed into 67 proof nodes. The underlying mathematics concerns unitary fusion categories, specifically:

- Fibonacci and Ising/Temperley-Lieb fusion data (labels, F-matrices, fusion multiplicities, braiding)
- Hilbert-space coordinate formalism: configuration spaces, direct-sum coordinates, truncated Fock space
- Fine-graining isometry theorems (block tensors, polar decomposition, unitary dressing)
- Ascending channels and their complete-positivity algebra (Kraus sums, PSD congruences)
- Koo–Saleur/CFT operator content: conformal weights, descendant scaling exponents
- Coassociativity candidate for the algebra-object comultiplication Δ

---

## Current Proof Tree

`af status` output (cleaned, reproduced in full above in tool output). Summary topology:

```
1 [pending]  Root conjecture
├── 1.1 [pending]    WP1: Establish MASTER_PROVENANCE.md local-source provenance
├── 1.2 [pending]    WP2: Lean/Julia/WolframScript finite skeletal fusion data foundation
│   ├── 1.2.1–1.2.9  [all validated]  CONFIG-001 through TRUNCATED-FOCK-COORD-001
├── 1.3 [pending]    WP3: Fibonacci exact data (labels, F-matrix, PF map, coassociative candidate)
│   ├── 1.3.1–1.3.9  [validated/archived]   (1.3.5 archived; rest validated)
│   ├── 1.3.10–1.3.17 [validated]
├── 1.4 [pending]    WP4: Fine-graining isometry theorems
│   ├── 1.4.1–1.4.16 [all validated]
├── 1.5 [pending]    WP5: Operator/RG channel statements
│   ├── 1.5.1–1.5.16 [all validated]
├── 1.6 [pending]    WP6: Adversarial verification discipline (process node)
├── 1.7 [pending]    WP7: Self-contained pdflatex output document
└── 1.8 [validated]  ISING-TOY-001: Secondary Ising/TL toy block
```

**Progress (from `af progress`):**
- Total nodes: 67
- Validated: 58 (87%)
- Pending: 8 (nodes 1, 1.1, 1.2, 1.3, 1.4, 1.5, 1.6, 1.7)
- Archived: 1 (node 1.3.5 FIB-RG-NORM-001 — no-mixing RG normalisations, general Lean theorem not proven)
- Admitted: 0, Refuted: 0
- Open challenges: 0 (one challenge, ch-46a2d1ace78, against 1.5.9, was raised and resolved)

**Critical path (from `af critical-path`):** 1 → 1.4 (the WP4 parent node blocks the root). Recommendation from `af health`: run `af jobs --role verifier` for the 3 ready verifier jobs.

**Available jobs:** 0 prover, 3 verifier. The 3 verifier jobs are nodes 1.1, 1.6, and 1.7 — all structural/administrative WPs with no leaf subproof yet attached.

---

## Agent and Owner Activity

**Active claims (5 nodes, all claimed by `codex-prover`):**
- Nodes 1, 1.2, 1.3, 1.4, 1.5 — all parent WP nodes. Claims have expiry timestamps in May 2026 (all in the past); these are stale locks from the session that ran 2026-05-14 to 2026-05-15.

**Recent verifiers (from `af agents`, last 50 events):** All named with per-node identifiers, e.g.:
- `verifier-truncated-fock-coord-001` (node 1.2.9)
- `verifier-dirsum-adjoint-coord-001` (node 1.2.8)
- `verifier-finite-skeletal-fusion-data-001` (node 1.2.7)
- `verifier-rg-tautau-prob-001` (node 1.5.16)
- `verifier-cft-desc-exp-001` (node 1.5.15)
- `codex-prover` (prover for all WP subtrees)

The naming pattern `verifier-<node-label>-001` indicates fresh sub-agents were spun per leaf node, consistent with WP6's adversarial discipline. The prover agent (`codex-prover`) used a single identity throughout.

**Repair fatigue:** None detected. No node has gone through more than 2 repair cycles.

**Taint:** 1 node clean (node 1 itself, as it is the root), 66 unresolved. No tainted or self-admitted nodes. The "unresolved" taint state is normal for all non-root nodes when taint propagation has not been run.

---

## Externals / Lemmas

**External references (5, stored in `externals/`):**

| Name | Source |
|------|--------|
| Fibonacci golden ratio local text | `references/text/FibonacciAnyonModels.txt:304` and `TrebstShortIntroductionFibonacciAnyons.txt:325` |
| Trebst Fibonacci F matrix local text | local text (Trebst short introduction) |
| Penneys binary fusion-tree basis and Fibonacci distinct-simple relation | local source (Penneys) |
| Master provenance ledger | `MASTER_PROVENANCE.md` |
| Source manifest | project source manifest |

**Lemmas:** None extracted. (`af lemmas` returns empty.)

**Pending definitions:** None. (`af pending-defs` returns empty.)

**Assumptions:** None registered formally.

**Computational evidence:** Multiple nodes have attached evidence (script paths and SHA256 hashes recorded in the ledger), e.g., `scripts/julia/ising_toy_checks.jl` attached to node 1.8.

---

## Integration with the Lean Formalisation

The af workspace integrates directly with `/home/tobias/Projects/cft-anyons-deprecated/Formalisation/`. Each validated leaf node statement explicitly references a Lean file, e.g.:

- `Formalisation/Foundations/Configurations.lean` (CONFIG-001)
- `Formalisation/LinearAlgebra/Component.lean` (MAT-COMP-001)
- `Formalisation/LinearAlgebra/Polar.lean` (MAT-POLAR-001)
- `Formalisation/Fibonacci/Basic.lean` (FIB-ALG-001, FIB-PF-001)
- `Formalisation/Fibonacci/CFTWeights.lean` (CFT-WEIGHT-001)

The Formalisation directory contains four subdirectories: `Fibonacci/`, `Foundations/`, `LinearAlgebra/`, and `Ising/`, collectively holding ~26 `.lean` files. The af proof nodes serve as a structured record of what has been proven in Lean and what has been checked computationally — the ledger is the index over the Lean library.

---

## State Assessment

**Is it stuck?** No active session. The 5 claimed nodes held by `codex-prover` are stale (claim expiry timestamps from 2026-05-14/15). The session appears to have ended cleanly after a long automated run.

**Is it abandoned?** Likely: this is in `cft-anyons-deprecated/`, not the active `cft-anyons/` directory. The session ran for roughly 7 hours, producing 561 ledger events, then stopped.

**Is it near-complete?** 88% of nodes validated; however, the 8 pending nodes include structurally important ones. The blocking pattern is instructive:
- WP1 (provenance): still pending — a verifier job exists but no subproof submitted
- WP6 (process discipline): pending — a meta/administrative node
- WP7 (pdflatex document): pending — output production not started
- WP2/3/4/5 parent nodes: pending because their children are all validated but the parents themselves haven't been accepted (the af model requires explicit accept of parent nodes after children validate)

The mathematical core (all leaf nodes in WP2–WP5 and WP8) is essentially complete. The remaining pendingness is structural: parent-node acceptance and the three administrative WPs.

---

## Overlap with cft-anyons/summary.tex

The conjecture being "proven" in the af workspace is the formalisation programme described in `handoff.md` from the deprecated project. This maps directly onto topics in `cft-anyons/summary.tex`:

| af node cluster | summary.tex topic |
|---|---|
| WP2/CONFIG/DIRSUM nodes | Hilbert spaces for variable-number anyons; partition Hilbert spaces |
| WP3/FIB-* nodes | Fibonacci worked example (F-matrix, fusion rules, quantum dimensions) |
| WP3/1.3.4 FIB-COASSOC | Algebra-object comultiplication Δ = m†/√λ; coassociativity |
| WP4/MAT-POLAR | Polar-decomposition canonical sections |
| WP4/MAT-TENSOR-POWER | Cellwise isometric refinement maps |
| WP5/CFT-WEIGHT | Koo–Saleur lattice Virasoro / conformal weights |
| 1.8 ISING-TOY | Ising/Temperley-Lieb worked example |

The overlap is substantial: the deprecated project was an earlier attempt at precisely the formalisation that `cft-anyons/summary.tex` now documents mathematically. The `af` proof tree tracks a coordinate-level (finite-matrix) formalisation, while `summary.tex` works at the categorical level. The deprecated project's `handoff.md` is a predecessor to the mathematics crystallised in `summary.tex`.

---

## Recommended Disposition

1. **Archive the af workspace as is.** The 88%-complete proof tree and 26 Lean files represent substantial completed work. No destructive action is warranted.

2. **Do not resume the deprecated session.** The active `cft-anyons/` project has superseded this. The mathematics in `summary.tex` is more refined than `handoff.md`.

3. **Mine the Lean files.** The `Formalisation/` directory contains ~26 working Lean 4 files with proven finite-matrix and Fibonacci lemmas. Before writing new Lean code in `cft-anyons/`, check whether these files can be reused or adapted.

4. **Extract the coassociativity result.** Node 1.3.4 (FIB-COASSOC-001) verifies the scalar Δ = m†/√λ candidate numerically but notes that "Lean coassociativity proof remains pending." This is a live gap that should be tracked in the active project.

5. **Use the external references.** The 5 externals recorded with content hashes point to local copies of Trebst, Penneys, and BIMSA references. These are the source texts for Fibonacci F-matrix data and fusion-tree bases in the active project.
