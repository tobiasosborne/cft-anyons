# Stocktake: cft-anyons-deprecated — Four Meta-Documents

**Date:** 2026-05-16  
**Scope:** `/home/tobias/Projects/cft-anyons-deprecated/`  
**Analyst:** Claude Code (read-only)

---

## 1. Scope and Sampling Method

Four documents examined:

| File | Size | How sampled |
|---|---|---|
| `handoff.md` | ~29 KB / 1896 lines | Read in full |
| `MASTER_PROVENANCE.md` | ~61 KB / 1422 lines | TOC via `grep "^#\+"`, then deep-read sections 1–30, 760–900, 1020–1100, 1278–1422 (covering EXT/DEF definitions, representative theorem entries, the two WP-summary nodes, and the conjecture register) |
| `NEXT_AGENT_HANDOFF.md` | ~14 KB / 393 lines | Read in full |
| `FORMALISATION_PLAN.md` | ~11 KB / 298 lines | Read in full |

Supplementary checks: `af/master/ledger/` (561 entries parsed for type counts), `Formalisation/` directory tree (26 Lean files, 3049 total lines), `sorry`/`admit` scan (zero occurrences).

---

## 2. File-by-File Synopsis

### `handoff.md`
The originating mathematical specification document, written to be handed to a formalisation agent. It defines the full project mathematically: the unitary fusion category setup, the indefinite-particle Hilbert spaces `H_N^W = Hom(W, Q^{⊗N})`, fine-graining isometries `E_{N→M}`, local block fine-graining, the polar-decomposition canonical section `E = B†(BB†)^{-1/2}`, OPE/CFT blocking coefficients, ascending observable channels, and the Fibonacci and Ising/TL worked examples. It closes with 14 "immediate next formalisation targets," five conjectures (A–E), and a three-phase Lean + Julia + Wolfram roadmap. This is not a status document; it is the source-of-truth math spec from which all subsequent formalisation work was derived.

### `MASTER_PROVENANCE.md`
A 1422-line structured ledger serving as the acceptance gate for all definitions, theorem targets, and conjectures. Its structure is: (1) a source index pointing to `references/manifest/SOURCES.md`; (2) ~22 external-fact entries (EXT-FC-001 through EXT-BRAID-001) covering fusion category axioms, Fibonacci F/R matrices, CFT weights, string-net data, Fock-space structure, and OAR/wavelet maps; (3) ~10 project definition entries (DEF-PROJ-001 through DEF-PROJ-008); (4) a theorem target register with 20+ named targets (THM-2.2.1 through THM-9.8.1) plus two work-package summary nodes; (5) secondary targets (EXP, NEG, ISO); (6) a conjecture register (CONJ-11.1–E). Each entry records statement, dependencies, source locator, AF node ID, Lean file, Julia/Wolfram scripts, and acceptance status. It is large because every accepted leaf gets full evidence metadata including verifier names and dates — the document doubles as a human-readable proof audit trail for 58 validated AF nodes.

### `FORMALISATION_PLAN.md`
An 8-rule methodology manifesto plus execution plan. The non-negotiable rules establish: (1) ground truth must be locally downloaded and string-matched; (2) `af` proof trees are the authoritative workflow record; (3) verifiers must be fresh serial subagents; (4) three independent checks required (Julia + Wolfram + Lean); (5) prefer finite/skeletal formulations. The execution plan then lays out a four-phase Lean strategy (finite model → general theorems → Fibonacci exact proofs → operator/RG structure), Julia and Wolfram roles, LaTeX deliverable requirements, priority ordering, and the acceptance completion criterion. This document encodes the process discipline that was actually followed.

### `NEXT_AGENT_HANDOFF.md`
The last state-of-project document, dated 2026-05-15. Its workspace reference points to `/home/tobias/Projects/cft-anyons` — the same physical path as the current active project — making clear that this deprecated directory is the git repository that was subsequently renamed or archived. It records: 67 AF nodes total, 58 validated, 8 pending broad/root nodes, 1 archived, 0 refuted; the last commit was `d08dbed` ("Formalise truncated Fock coordinates"). It lists all accepted work in three groups (Foundations, Fibonacci/Ising, LinearAlgebra/Fine-graining/Channels), gives the most promising next slice (general matrix polar inverse-square-root via Mathlib CFC), and explicitly enumerates remaining pending areas including full categorical Hom expansion, braid-group representation on `Hom(W, Q^⊗N)`, categorical fine-graining semantics, CFT operator RG construction, and infinite Fock-space completion. It also lists pitfalls: scope overclaiming, parallel `af attach` calls, marking broad nodes accepted from leaf acceptance.

---

## 3. Key Concepts / Artifacts

### Formalisation Plan Summary

The project aimed to formalise the math of `handoff.md` in three tools (Lean 4 via Mathlib, Julia, WolframScript) under adversarial proof-tree governance (`af`). The approach was deliberately conservative: start with finite skeletal coordinate models, prove finite-matrix theorems, instantiate Fibonacci exactly, only then approach operator/RG structure. No claim was accepted without local source provenance (string-match in a downloaded PDF), Julia numerical check, Wolfram symbolic check, and Lean formal proof. Every accepted slice required an adversarial verifier subagent to validate the AF node.

### Achievements (Accepted/Validated)

The following were accepted with full three-tool + AF evidence:

- **Foundations:** Ordered configurations and particle combinatorics; finite direct-sum coordinate flattening/pairing; configuration-space coordinate expansion; finite coordinate skeleton of `Q` and `H_N^W`; skeletal fusion data structure with Fibonacci instance; truncated distinguishable-Fock coordinate model. (AF nodes 1.2.1–1.2.9)
- **Fibonacci:** Fusion rules and multiplicity table; golden-ratio arithmetic (`φ² = φ+1`, etc.); F-matrix orthogonality and involutivity; braid-matrix relation and braid-unitarity; Perron-Frobenius scalar normalisation; binary coordinate isometry criterion; PF binary isometry; coassociative scalar equations and uniqueness; CFT conformal-weight arithmetic; RG no-mixing row algebra; tau-tau RG probability formula. (AF nodes 1.3.x)
- **Linear Algebra / Fine-graining / Channels:** Postcomposition Gram preservation; component orthogonality equivalence; tensor-product isometry (2-factor, N-factor, heterogeneous); unitary dressing; conditional polar section algebra; diagonal-Gram inverse-square-root special case; one-row no-mixing polar formula; finite fine-graining structure; ascending channel unitality, star-preservation, logical-lift retraction; trace/expectation preservation; Kraus-sum PSD preservation; finite Kraus-sum channel algebra; coherent ascending and logical-lift systems; charge-only negative example. (AF nodes 1.4.x, 1.5.x)
- **Ising/TL:** Secondary toy refinement block. (AF node 1.8)

Total: 58 validated AF nodes, 26 Lean files with 3049 lines, zero `sorry`.

### Failures / Persistent Gaps

The following explicitly remained pending at deprecation:

- Full categorical Hom expansion: `Hom(W, Q^⊗N) ≅ ⊕ Hom(W, a₁⊗…⊗aₙ)` as a categorical theorem (not just finite coordinate skeleton).
- Braided-category exchange maps and braid-group representation on `Hom(W, Q^⊗N)`.
- Full-rank iff invertible-Gram equivalence; general polar-decomposition existence via CFC sqrt (the next slice was identified but not implemented).
- Physical/categorical derivation of RG coefficients from CFT OPE.
- Actual CFT operator RG construction and diagonalisation (beyond finite diagonal matrix algebra).
- Infinite Fock direct sum and Hilbert completion.
- Operadic/A∞ continuum limit conjecture.

### Pivots

No explicit deprecation reason or pivot decision appears in any of the four documents. The `NEXT_AGENT_HANDOFF.md` workspace line (`/home/tobias/Projects/cft-anyons`) reveals that what is now called `cft-anyons-deprecated` was, at the time of its last handoff (2026-05-15), still called `cft-anyons` — it appears the directory was simply renamed (or a sibling directory was created) when work shifted to the current `cft-anyons/` project, which contains `summary.tex` and the four chat transcripts. The most likely cause of the transition: the current `cft-anyons/` project represents a reset to math-first mode (summary.tex distilling four chat transcripts of higher-level math) rather than formalisation-first mode, possibly after the LLM sessions producing `chat1–4.md` showed that the categorical math had evolved beyond what the deprecated formalisation had formalized.

### Diagnostic Lessons

Several lessons are explicit or inferable:

1. **AF workflow discipline:** The project achieved real, zero-sorry Lean proofs under strict adversarial review. The workflow (serial verifiers, source string-matching, three-tool checks) is genuinely valuable and distinguishes this from hallucinated-proof projects.
2. **Scope discipline:** The repeated scope warnings in MASTER_PROVENANCE ("this does not construct categorical Hom functors / categorical direct sums / CFT") show that a prior LLM session tendency to overclaim scope was successfully checked by the AF verifiers. The warnings themselves are the signal.
3. **Finite skeleton gap:** The project got very good at proving finite-matrix/finite-coordinate analogs of the main theorems, but the categorical bridge — from finite coordinate skeletons to actual categorical Hom-space statements — was never crossed. This is the central remaining gap.
4. **`af` concurrency bug:** Serial-only `af attach` is a hard requirement. Parallel attach calls corrupt the ledger. This is an operational lesson for any future use of `af`.
5. **Subagent overhead:** The requirement for fresh serial verifier subagents is expensive in practice. The handoff notes 67 nodes processed one verifier at a time.
6. **RG amplitude theory is not derivable from fusion category alone:** The charge-only negative example (NEG-9.8.A) was explicitly formalised: the topological/fusion-category structure determines which fine-graining channels are allowed, but the amplitude weights require full Wilsonian RG input.

---

## 4. State Assessment

**Why deprecated:** No explicit deprecation statement exists. The circumstantial evidence is:
- The workspace in `NEXT_AGENT_HANDOFF.md` is `/home/tobias/Projects/cft-anyons`, the same path as the active project, suggesting this repository was renamed to `cft-anyons-deprecated` when a new project iteration began.
- The current `cft-anyons/` contains `summary.tex` (2483 lines, synthesizing four chat transcripts) and higher-level math (partition Hilbert spaces `H_P^W`, cellwise isometric refinement maps `E_{P→P'}`, algebra-object comultiplication, Koo–Saleur lattice Virasoro) that goes beyond the scope formalized in the deprecated project. The deprecated project's finite-skeleton Lean proofs cover only the early chapters of this more advanced treatment.
- The deprecated project's Lean Focalisation is a real asset, not abandoned junk: 26 files, 3049 lines, zero sorry, 58 validated AF nodes.

**What is still load-bearing:**
- The Lean code (`Formalisation/`) is the only machine-verified formal content in the entire cft-anyons constellation of projects. It should be preserved.
- `handoff.md` is the clearest mathematical specification of the finite-dimensional layer (Fock space, fine-graining, Fibonacci, polar decomposition) and remains a valid reference even if the math has evolved.
- `MASTER_PROVENANCE.md` is a complete audit trail of what was proved and how. It is the most reliable record of what is actually theorem vs. conjecture vs. finite-skeleton-only.
- The `af/master/` ledger (561 entries) documents the proof-governance history.

---

## 5. Overlap with `cft-anyons/summary.tex`

**Math overlap:** The deprecated project's math (`handoff.md`) covers:
- `H_N^W = Hom(W, Q^⊗N)` — same construction as `summary.tex`
- Fine-graining isometries `E_{N→M}` — same as `summary.tex`'s `E_{P→P'}`
- Polar-decomposition canonical section — present in both
- Fibonacci and Ising worked examples — present in both
- OPE/CFT blocking coefficients — present in both, more detailed in `summary.tex`

**Math not in deprecated project:**
- Partition Hilbert spaces `H_P^W` (where `P` is a partition, not just a particle number) — `summary.tex` concept, absent from `handoff.md`
- Algebra-object comultiplication `Δ = m†/√λ` — `summary.tex` concept, absent
- Koo–Saleur lattice Virasoro construction — `summary.tex` concept, absent
- The four chat transcripts (`chat1–4.md`) are the source for `summary.tex` but are not referenced anywhere in the deprecated project's documents.

**Direct references:** None of the four meta-documents mention `summary.tex`, `chat1`, `chat2`, `chat3`, or `chat4`. The deprecated project is mathematically upstream of (or parallel to, but not aware of) the current `cft-anyons/` project.

---

## 6. Recommended Disposition

| Document | Disposition | Rationale |
|---|---|---|
| `handoff.md` | **Keep / extract-lessons** | Best available plain-language specification of the finite-dimensional mathematical layer. Useful as a precise mathematical reference for the formalisation scope. Should be read alongside `summary.tex` to understand what is already formalized vs. what is new. |
| `MASTER_PROVENANCE.md` | **Keep** | The definitive record of what was proved, what is pending, and what was explicitly not claimed. Its scope warnings and conjecture register are the most honest assessment of the current state of formalisation. Essential if the Lean code is ever to be extended. |
| `FORMALISATION_PLAN.md` | **Archive / extract-lessons** | The methodology is sound and the 8 non-negotiable rules are worth preserving as a workflow reference. The specific execution plan is superseded by `NEXT_AGENT_HANDOFF.md`. Can be summarized rather than kept in full. |
| `NEXT_AGENT_HANDOFF.md` | **Keep** | The single most useful document for any agent resuming formalisation work. It gives exact git commit, AF node counts, accepted-work inventory, promising next slice (CFC polar sqrt), and known pitfalls. Should be treated as the entry point for any formalisation continuation. |

The Lean codebase (`Formalisation/`, 26 files, zero sorry) and the `af/master/` ledger should be preserved as formal assets. The deprecated directory should not be deleted; it is the only verified mathematical content in the project and provides the formal foundation that `summary.tex` discusses informally.
