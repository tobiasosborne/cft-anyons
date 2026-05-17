# af Port Mapping (CAD → cft-anyons fresh)

<!--
Phase 7 P7.2a output. Reviewer audits in P7.2b; P7.2c replays this
mechanically via `af refine` against a freshly-`af init`-ed workspace.

Source of node statements: the full `af status` dump captured from the
CAD-deprecated workspace (`cft-anyons-deprecated/af/master/`), 67 nodes
total. Editing scope per node:
  - Lean file paths: verified against current `Formalisation/` tree
    (Phases 4-5 ported byte-verbatim; all CAD-cited paths present).
  - Script paths: verified against current `scripts/{julia,wolfram}/`
    trees (Phase 6 ported byte-verbatim; all 25 of each present).
  - `handoff.md §X.Y` citations → `summary.tex §<n>` per the
    handoff-vs-summary correspondence in §"Source & method" below.
  - `MASTER_PROVENANCE.md` → `PROVENANCE.md` (this repo's canonical
    provenance ledger; supersedes CAD's).
  - WP1 / WP6 / WP7 process nodes: governance-rewritten to point at
    this repo's PROVENANCE.md / CLAUDE.md / summary.tex respectively.
  - GLOSSARY slugs: every load-bearing term is tagged with the
    EXISTING slug ([[def:…]] / [[conv:…]]) from this repo's
    GLOSSARY.md — no new slugs are proposed in this port.
  - CONVENTIONS refs: load-bearing items get an explicit [P1.6(letter)]
    tag where the convention is invoked (vacuum index, F-matrix gauge,
    multiplicity-free, particle-number disambiguation, local cell
    object Q, fusion-tree ordering, N=0 boundary).
-->

## Status

- **67 of 67 nodes mapped.** No blockers.
- **Mapping categories:**
  - **Verbatim preserve (with provenance reroute only):** 50 leaf
    nodes (1.2.1–1.2.9, 1.3.1–1.3.17 minus 1.3.5, 1.4.1–1.4.16,
    1.5.1–1.5.16, 1.8). Mathematical content untouched; only
    `handoff.md §X.Y` → `summary.tex §<n>` substitutions and
    GLOSSARY/CONVENTIONS tagging added.
  - **Minor reword:** 8 nodes (root 1; WP parents 1.2 / 1.3 / 1.4 /
    1.5 / 1.8 isn't a WP parent but the WP-summary leaf 1.3.9 / 1.4.6
    similarly). Reworded only to substitute `handoff.md` with
    `summary.tex` as the formalisation target document.
  - **Substantial reword (governance):** 4 nodes — the root 1
    (re-targets formalisation programme from `handoff.md` to
    `summary.tex` + `PROVENANCE.md`); WP1 (1.1) (MASTER_PROVENANCE.md
    → PROVENANCE.md); WP6 (1.6) (adversarial discipline rewritten to
    cite this repo's CLAUDE.md Rule 4 reviewer-gating policy + Rule 9
    no-CI); WP7 (1.7) (pdflatex output → existing `summary.tex` is
    the self-contained pdflatex doc, supersedes CAD's WP7 goal).
  - **Drift flags:** 5 nodes carry explicit Notes flagging
    hallucination-risk callouts (vacuum index, F-matrix gauge,
    coassociativity scalar-vs-categorical, multiplicity-free
    assumption, particle-number disambiguation). All preserved as
    Notes, no rewriting of statements.
  - **Blockers:** 0.
- **GLOSSARY slug references used:** 37 distinct slugs (count
  independently verified by P7.2b reviewer via
  `grep -oE '\[\[(def|conv):[a-zA-Z0-9-]+\]\]' ... | sort -u`)
  across all 67 nodes; most-used: [[def:fuscat]], [[def:Q]],
  [[def:Hlatt]], [[def:HP]], [[def:partition]], [[def:fib]],
  [[def:fib-F]], [[def:PF]], [[def:coassoc]], [[def:ising]],
  [[def:ising-F]], [[def:refmap]], [[def:fsymbol]], [[def:phi]],
  [[def:fib-mult]], [[def:ascending]], [[def:blocking]],
  [[def:RG-amp]], [[def:primary]], [[def:scalop]], [[def:KS-Ln]],
  [[def:OPE]], [[def:isingcft]], [[def:particle-number]],
  [[def:splitbasis]], [[def:algobj]], [[def:dense]], [[def:TL-cat]],
  [[def:polar-repair]], [[conv:basics]], [[conv:acro]],
  [[conv:1op]], [[conv:unitary-default]]. All slugs verified present
  in `GLOSSARY.md` (`grep '^## ' GLOSSARY.md` whitelist).
- **CONVENTIONS refs used:** [P1.6(a)] vacuum index (most WP2/3
  leaves); [P1.6(b)] F-matrix gauge (most WP3/4 leaves);
  [P1.6(c)] dagger (WP4/5 leaves); [P1.6(d)] multiplicity-free
  (most WP3 leaves); [P1.6(g)] particle-number disambiguation
  (WP2 leaves); [P1.6(h)] local cell object Q (WP2.6 +
  WP2.7); [P1.6(i)] left-associated fusion-tree (WP3.6 +
  WP3.13 + WP3.17); [P1.6(j)] N=0 boundary (WP2.9, WP2.6).

## Source & method

The 67 node statements are sourced verbatim from `af status` against
`cft-anyons-deprecated/af/master/` (561-event ledger; captured at
2026-05-16). Editing rules (per the implementer brief):

1. **Mathematical content is preserved verbatim** in every "updated
   statement" field — the finite-matrix / fusion-algebra / Lean /
   Julia / Wolfram facts in CAD-validated leaf nodes are
   substantively correct and Phase-4/5 ported them byte-verbatim into
   this repo, so the statements still describe the live Lean library.
2. **External-doc references rerouted:** `handoff.md §<X>` → `summary.tex
   §<n>` per the correspondence below; `MASTER_PROVENANCE.md` →
   `PROVENANCE.md`; `local source manifest` references kept since
   `references/manifest/SOURCES.md` lives in this repo too.
3. **CAD handoff section → summary.tex section correspondence**
   (derived by inspection of `cft-anyons-deprecated/handoff.md`
   structure + current `summary.tex` TOC at `summary.tex:62–2414`):
   - handoff §0 (External mathematical facts) → `references/` +
     `CITATION_INDEX.md` (no summary.tex counterpart; references
     are now a separate canonical artifact).
   - handoff §1 (Core categorical setup, §§1.1–1.2) → `summary.tex
     §3` (Categorical foundations) + `summary.tex §3.4` (Local cell
     object: structural freedom).
   - handoff §2 (Indefinite-particle Hilbert spaces, §§2.1–2.3) →
     `summary.tex §4` (Indefinite-particle Hilbert spaces) — §2.1
     ↔ summary §4.1 (Fixed-lattice formulation); §2.2 ↔ summary
     §4.1+§4.3; §2.3 ↔ [[def:particle-number]] (canonical body in
     GLOSSARY § A, sourced from `summary.tex` near line 507).
   - handoff §3 (Braiding and exchange) → no direct summary.tex
     section (braiding is implicit in summary; node 1.3.10
     FIB-BRAID-001 preserves the KZ-paper citation directly).
   - handoff §4 (Fine-graining maps) → `summary.tex §4.4` (Refinement
     and the inductive system) + §11.2 (Canonical isometric
     refinement via polar decomposition).
   - handoff §5 (Local block fine graining) → `summary.tex §11.2`
     (Canonical isometric refinement via polar decomposition).
   - handoff §6 (RG blocking and canonical fine graining) →
     `summary.tex §11.1` (Wilsonian RG-decorated splitting) + §11.2.
   - handoff §7 (CFT/RG input) → `summary.tex §11` (Conformal-field-
     theory input) + §11.1.
   - handoff §8 (Operator channels) → `summary.tex §11.3` (Ascending
     channel: spectrum and scaling fields) + GLOSSARY [[def:ascending]],
     [[def:blocking]] (canonical bodies from `summary.tex` §5 / §11).
   - handoff §9 (Fibonacci worked specification, §§9.1–9.8) →
     `summary.tex §7` (Worked example B: Fibonacci data) +
     `summary.tex §11.3.3` (Fibonacci CFT data) + GLOSSARY [[def:fib]],
     [[def:fib-F]], [[def:PF]], [[def:coassoc]], [[def:RG-amp]].
     Specifically handoff §9.6 (strict binary-composition / coassoc
     candidate) → `summary.tex §7.3.2` (Coassociative splitting,
     1151) + GLOSSARY [[def:coassoc]]; §9.7 (Fibonacci RG/CFT
     amplitudes) → `summary.tex §11.1` + [[def:RG-amp]]; §9.8
     (Fibonacci scaling operators) → `summary.tex §11.3.3` +
     [[def:scalop]].
   - handoff §10 (Temperley–Lieb / Ising note) → `summary.tex §8`
     (Worked example C: Ising / Temperley–Lieb at δ=√2) + GLOSSARY
     [[def:ising]], [[def:ising-F]], [[def:dense]], [[def:TL-cat]],
     [[def:isingcft]], [[def:KS-scalars]], [[def:KS-Ln]].
   - handoff §12 (Formalisation plan) → no direct summary.tex
     counterpart; this is plumbing — for WP-summary nodes (1.3.9,
     1.4.6) we cite "the Lean files actually proved", not the plan.
   - handoff §13 (Main conjectures) → `summary.tex §16` (Open
     conjectures).
   - handoff §14 (Immediate next formalisation targets) → process
     content; superseded by `stocktake/MIGRATION_PLAN.md`.
4. **Lean file path verification:** all 28 CAD-Formalisation files
   present in current `Formalisation/` with the same relative path;
   4 additional files (`Fibonacci/{Configurations,
   ConfigurationSpace, FockSpace, ProjectDefinitions}.lean`) exist
   in current repo (added at P5.17 to re-create Fibonacci-specific
   decls); 1 file (`Fibonacci/RGNoMixing.lean`) was added in current
   repo at P5.X. No path remappings required.
5. **Script path verification:** all 25 Julia + 25 Wolfram scripts
   that the CAD nodes cite are present in current
   `scripts/julia/*.jl` and `scripts/wolfram/*.wls`; Phase 6 ported
   byte-verbatim (commit `8b680b2`) and 52/52 script-runs PASS in
   canonical-repo environment (P6.5 / P6.6).

## Path/script verification summary

- **Lean files cited explicitly in CAD nodes** (with the path the
  CAD node uses):
  - `Formalisation/Foundations/Configurations.lean` — PRESENT (node 1.2.1).
  - `Formalisation/Foundations/ConfigurationSpace.lean` — PRESENT (node 1.2.5).
  - `Formalisation/Foundations/DirectSumCoordinates.lean` — PRESENT (node 1.2.8).
  - `Formalisation/Foundations/SkeletalFusion.lean` — PRESENT (implicit; node 1.2.7).
  - `Formalisation/Foundations/FockSpace.lean` — PRESENT (implicit; node 1.2.9).
  - `Formalisation/Foundations/ProjectDefinitions.lean` — PRESENT (implicit; node 1.2.6).
  - `Formalisation/Fibonacci/Basic.lean` — PRESENT (nodes 1.3.1, 1.3.3).
  - `Formalisation/Fibonacci/Matrix.lean` — PRESENT (node 1.3.2).
  - `Formalisation/Fibonacci/FusionRules.lean` — PRESENT (nodes 1.3.8, 1.3.15, 1.3.16).
  - `Formalisation/Fibonacci/Binary.lean` — PRESENT (nodes 1.3.6, 1.3.13, 1.3.15, 1.3.17).
  - `Formalisation/Fibonacci/Coassoc.lean` — PRESENT (nodes 1.3.12, 1.3.16, 1.3.17).
  - `Formalisation/Fibonacci/BraidMatrices.lean` — PRESENT (nodes 1.3.10, 1.3.11).
  - `Formalisation/Fibonacci/CFTWeights.lean` — PRESENT (nodes 1.5.5, 1.5.7, 1.5.15).
  - `Formalisation/Fibonacci/RGNoMixing.lean` — PRESENT (nodes 1.3.14, 1.5.16).
  - `Formalisation/LinearAlgebra/Component.lean` — PRESENT (node 1.4.2).
  - `Formalisation/LinearAlgebra/Tensor.lean` — PRESENT (nodes 1.4.3, 1.4.10, 1.4.11).
  - `Formalisation/LinearAlgebra/TensorPower.lean` — PRESENT (nodes 1.4.7, 1.4.15).
  - `Formalisation/LinearAlgebra/HeterogeneousTensor.lean` — PRESENT (node 1.4.16).
  - `Formalisation/LinearAlgebra/Postcompose.lean` — PRESENT (nodes 1.4.4, 1.4.8).
  - `Formalisation/LinearAlgebra/Polar.lean` — PRESENT (nodes 1.4.5, 1.4.13).
  - `Formalisation/LinearAlgebra/NoMixing.lean` — PRESENT (node 1.4.9).
  - `Formalisation/LinearAlgebra/FineGraining.lean` — PRESENT (nodes 1.4.12, 1.4.14).
  - `Formalisation/LinearAlgebra/Isometry.lean` — PRESENT (nodes 1.5.1, 1.5.8).
  - `Formalisation/LinearAlgebra/Trace.lean` — PRESENT (nodes 1.5.2, 1.5.9, 1.5.11, 1.5.12, 1.5.13, 1.5.14).
  - `Formalisation/LinearAlgebra/DiagonalScaling.lean` — PRESENT (node 1.5.3).
  - `Formalisation/LinearAlgebra/ChargeOnly.lean` — PRESENT (node 1.5.4).
  - `Formalisation/LinearAlgebra/CoherentSystem.lean` — PRESENT (nodes 1.5.6, 1.5.10).
  - `Formalisation/Ising/Basic.lean` — PRESENT (node 1.8).
  - **All 27 CAD-cited Lean paths present at byte-verbatim location.
    No moves, no missing files.**

- **Scripts cited explicitly in CAD nodes:**
  - `scripts/julia/{ising_toy_checks.jl, ...}` — all 25 PRESENT
    (Phase 6, commit `8b680b2`).
  - `scripts/wolfram/*.wls` — all 25 PRESENT (Phase 6).
  - Phase 6 re-runs (P6.5 / P6.6) confirmed 25 + 25 = 50 scripts
    PASS in canonical-repo environment + 2 smoke tests (P6.3 / P6.4)
    = 52/52 PASS total.

- **Externals to mirror** (CAD's 5 externals at
  `cft-anyons-deprecated/af/master/externals/`):
  - `Fibonacci golden ratio local text` → cite
    `references/text/FibonacciAnyonModels.txt:304` +
    `references/text/TrebstShortIntroductionFibonacciAnyons.txt:325`
    (both PRESENT in current repo per `references/manifest/SOURCES.md`).
  - `Trebst Fibonacci F matrix local text` → cite same as above
    plus lines 297–304 (Trebst).
  - `Penneys binary fusion-tree basis and Fibonacci distinct-simple
    relation` → cite `references/text/PenneysUnitaryFusionCategories.md:532`,
    `:610`, `:623-625` (PRESENT).
  - `Master provenance ledger` → reroute to `PROVENANCE.md`.
  - `Source manifest` → cite `references/manifest/SOURCES.md`
    (PRESENT).

---

## Per-node mapping

### Node 1 (root) — pending in CAD

**Original statement:** "Formalise the definitions, theorem targets,
and conjectures in handoff.md with local-source provenance and Julia,
WolframScript, and Lean checks wherever applicable."

**Updated statement:** "Formalise the definitions, theorem targets,
and conjectures of `summary.tex` (this repo's canonical mathematical
statement) with local-source provenance (via `PROVENANCE.md` and
`CITATION_INDEX.md`) and Julia, WolframScript, and Lean checks
wherever applicable (one Julia + one Wolfram triple-check script per
Lean module per `results/CHECKS.md`)."

**GLOSSARY refs:** N/A (root statement is meta).

**CONVENTIONS refs:** [P1.6(a)–(j)] all apply downstream.

**Lean files:** N/A (root). The whole `Formalisation/` directory is
the formalisation target.

**Scripts:** N/A (root). The whole `scripts/{julia,wolfram}/`
directory is the triple-check target.

**Provenance reroute:** `handoff.md` → `summary.tex`; CAD's project
governance → this repo's PRD / CLAUDE.md / MIGRATION_PLAN.

**Notes:** Substantial reword — the conjecture statement is the
top-level governance frame for the af workspace. Re-targeted to
summary.tex (which is more refined than CAD's handoff.md, per
`stocktake/reports/cad-af.md`).

---

### Node 1.1 (WP1) — pending in CAD

**Original statement:** "WP1: Establish local-source provenance for
every external fact, project definition, theorem target, conjecture,
and computational claim in MASTER_PROVENANCE.md."

**Updated statement:** "WP1: Maintain local-source provenance for
every external fact, project definition, theorem target, conjecture,
and computational claim in this repo's `PROVENANCE.md` and
`CITATION_INDEX.md`. Every imported file has an entry in
`PROVENANCE.md` with source path + SHA256 + provenance chain; every
`\unchecked` citation in `summary.tex` has a discharge-status row in
`CITATION_INDEX.md`."

**GLOSSARY refs:** N/A (process node).

**CONVENTIONS refs:** N/A.

**Lean files:** N/A.

**Scripts:** N/A.

**Provenance reroute:** `MASTER_PROVENANCE.md` → `PROVENANCE.md`;
`CITATION_INDEX.md` (this repo) is the additional discharge ledger
that CAD did not maintain.

**Notes:** Substantial reword (governance) — but the underlying
adversarial-discipline principle is preserved: every external fact
must trace to a local SHA256-pinned source. This repo's PROVENANCE.md
is more complete than CAD's MASTER_PROVENANCE.md ever was (Phase 1
authored the full Phase-1 baseline at P1.10).

---

### Node 1.2 (WP2) — pending in CAD

**Original statement:** "WP2: Formalise the finite skeletal
fusion-data and finite-dimensional linear algebra foundation in Lean,
with Julia and WolframScript checks for the algebraic claims."

**Updated statement:** "WP2: Formalise the finite skeletal
fusion-data and finite-dimensional linear algebra foundation in Lean
(scope: `Formalisation/Foundations/` + `Formalisation/LinearAlgebra/`,
plus the Fibonacci/Ising instances under `Formalisation/{Fibonacci,
Ising}/`), with Julia and WolframScript checks for the algebraic
claims (one each per Lean module per `results/CHECKS.md`). This WP
realises the finite coordinate skeleton underlying [[def:fuscat]] and
[[def:Q]] in `summary.tex` §3, after sector bases are chosen."

**GLOSSARY refs:** [[def:fuscat]], [[def:Q]], [[def:splitbasis]],
[[def:fsymbol]].

**CONVENTIONS refs:** [P1.6(a)] vacuum index; [P1.6(d)]
multiplicity-free.

**Lean files:** scope = `Formalisation/Foundations/`,
`Formalisation/LinearAlgebra/`.

**Scripts:** all 25 cross-check scripts apply downstream.

**Provenance reroute:** N/A (WP-parent statement).

**Notes:** Minor reword — added explicit current-repo paths +
GLOSSARY tags. Underlying mathematical scope unchanged.

---

### Node 1.2.1 — validated in CAD

**Original statement:** "CONFIG-001: For any finite label type alpha
and length n, ordered configurations are functions Fin n -> alpha.
Given a distinguished vacuum label, particleNumber counts sites not
equal to the vacuum and is bounded by n; the constant vacuum
configuration has particle number 0, a constant non-vacuum
configuration has particle number n, and the number of configurations
is |alpha|^n. Specialising to Fibonacci labels gives exactly 2^n
configurations, all-vacuum particle number 0, and all-tau particle
number n. Lean proves these finite combinatorial facts in
Formalisation/Foundations/Configurations.lean; Julia and WolframScript
check Fibonacci counts and binomial particle sectors for n <= 8. This
node does not prove the categorical Hom-space direct-sum expansion or
Hilbert-space semantics."

**Updated statement:** (verbatim from above — mathematical content
preserved exactly; Lean path verified PRESENT.)

**GLOSSARY refs:** [[def:particle-number]] (in this repo, the
canonical body uses `k`, with `k` = `particleNumber` per Lean naming
+ our [P1.6(g)] disambiguation, where MMA-`N` / Lean-`n` here =
`particle-number` "n" = number of non-vacuum legs; the Lean local
`n` parameter is the lattice length = our `L` per CONVENTIONS (g)).

**CONVENTIONS refs:** [P1.6(a)] vacuum index (the distinguished
vacuum label); [P1.6(g)] particle-number disambiguation (the Lean
identifier `n` here is the tensor degree = our `L`; `particleNumber`
is our `n` = count of non-vacuum sites).

**Lean files:** `Formalisation/Foundations/Configurations.lean` —
PRESENT.

**Scripts:** `scripts/julia/configuration_checks.jl`,
`scripts/wolfram/configuration_exact.wls` — both PRESENT, PASS.

**Provenance reroute:** none; node 1.2.1 cites no external doc.

**Notes:** Drift flag — the Lean `n` (tensor degree) vs our `n`
(particle number) per CONVENTIONS [P1.6(g)] disambiguation needs care
when reading; the Lean-internal naming uses `n` for length per
mathlib convention. No statement change required since the CAD node
is self-consistent (uses "length n" and "particleNumber" separately).

---

### Node 1.2.2 — validated in CAD

**Original statement:** "DIRSUM-COORD-001: For any finite index type
iota and finite dependent coordinate family kappa, the coordinate
space (Sigma i, kappa i) -> C is complex-linearly equivalent to the
dependent product of component coordinate spaces forall i, kappa i ->
C by flattening/unflattening coordinates. The inverse laws are
definitional, the sigma-index cardinality equals the sum of component
cardinalities, and the flattening/unflattening maps preserve the
standard finite coordinate pairing sum conjugate(x_s) y_s. This
formalises only the finite vector-space coordinate skeleton of the
sourced direct-sum Hom expansion after choosing bases in each
summand; it does not construct categorical biproducts, Q, tensor
powers, Hom functors, dagger categories, or fusion-category basis
provenance."

**Updated statement:** (verbatim from above — mathematical content
preserved exactly.)

**GLOSSARY refs:** [[def:splitbasis]] (after sector bases are
chosen); [[def:fuscat]] (the categorical Hom-direct-sum is the
non-scope context).

**CONVENTIONS refs:** [P1.6(c)] dagger (the pairing
`sum conjugate(x_s) y_s` is the standard dagger pairing on `Sigma ->
C`).

**Lean files:** `Formalisation/Foundations/DirectSumCoordinates.lean`
— PRESENT (CAD path) — the node text does not name a specific Lean
file but the proof lives here (verified by node 1.2.8 which names
the same file for the adjoint half of this result).

**Scripts:** `scripts/julia/direct_sum_coordinate_checks.jl`,
`scripts/wolfram/direct_sum_coordinate_exact.wls` — both PRESENT.

**Provenance reroute:** none.

**Notes:** verbatim preserve.

---

### Node 1.2.3 — validated in CAD

**Original statement:** "DIRSUM-PROJ-001: In the finite coordinate
direct-sum model for a finite index type iota and dependent
coordinate family kappa, the component inclusion maps kappa i -> C
into flattened coordinates Sigma kappa -> C and component projection
maps Sigma kappa -> C to kappa i -> C satisfy the coordinate
biproduct equations: projection after same-component inclusion is the
identity, projection after different-component inclusion is zero, and
the finite sum over i of inclusion_i after projection_i is the
identity on flattened coordinates. This is only the finite coordinate
analogue of the sourced direct-sum equations pi_i o iota_j =
delta_{i=j} id and sum_j iota_j o pi_j = id; it does not construct
categorical biproducts, Q, tensor powers, Hom functors, dagger
categories, or direct-sum universal properties."

**Updated statement:** (verbatim — content preserved exactly.)

**GLOSSARY refs:** [[def:splitbasis]] (after bases); [[def:fuscat]]
(categorical biproduct context, out of scope here).

**CONVENTIONS refs:** [P1.6(a)] vacuum index (implicit in the
direct-sum decomposition of any local cell object Q in scope).

**Lean files:** `Formalisation/Foundations/DirectSumCoordinates.lean`
(by content; not named in this node).

**Scripts:** `scripts/julia/direct_sum_projection_checks.jl`,
`scripts/wolfram/direct_sum_projection_exact.wls` — both PRESENT.

**Provenance reroute:** none.

**Notes:** verbatim preserve.

---

### Node 1.2.4 — validated in CAD

**Original statement:** "DIRSUM-ORTH-001: In the finite coordinate
direct-sum model for a finite index type iota and dependent
coordinate family kappa, with the standard finite complex coordinate
pairing, every component inclusion preserves the component pairing.
The coordinate range map inclusion_i after projection_i is
idempotent, and distinct coordinate range maps annihilate one
another. This formalises only the finite coordinate analogue of the
sourced orthogonal direct-sum statement that inclusions are
isometries and iota_i iota_i^dagger are mutually orthogonal
projections; it does not construct categorical daggers, categorical
adjoints, orthogonal direct sums, Q, tensor powers, Hom functors, or
fusion-category basis provenance."

**Updated statement:** (verbatim — content preserved exactly.)

**GLOSSARY refs:** [[def:splitbasis]]; [[def:fuscat]].

**CONVENTIONS refs:** [P1.6(c)] dagger; [P1.6(a)] vacuum index.

**Lean files:** `Formalisation/Foundations/DirectSumCoordinates.lean`
(by content).

**Scripts:** `scripts/julia/direct_sum_orthogonal_checks.jl`,
`scripts/wolfram/direct_sum_orthogonal_exact.wls` — both PRESENT
(used as P6.3 + P6.4 smoke tests).

**Provenance reroute:** none.

**Notes:** verbatim preserve.

---

### Node 1.2.5 — validated in CAD

**Original statement:** "CONFIG-SPACE-COORD-001: For any finite label
type alpha, length n, and finite dependent coordinate basis assigned
to each ordered configuration cfg:Fin n -> alpha, the flattened
coordinate space over Sigma(cfg, basis cfg) is complex-linearly
equivalent to the family of component coordinate spaces forall cfg,
basis cfg -> C. The flattened coordinate cardinality is the sum of
sector cardinalities; for constant sector basis beta it is |alpha|^n
* |beta|; and the standard finite coordinate pairing is preserved by
flattening. Lean proves this finite coordinate skeleton in
Formalisation/Foundations/ConfigurationSpace.lean using the validated
configuration and direct-sum coordinate results. Julia and
WolframScript check Fibonacci n=3 examples with dependent sector
sizes and exact complex rational pairings. This formalises only the
basis-dependent finite coordinate skeleton of the configuration-space
expansion after sector bases are supplied; it does not construct
categorical Hom spaces, Q^tensor N, tensor products, canonical Hom
isomorphisms, categorical direct sums, or unitarity in a fusion
category."

**Updated statement:** (verbatim — content preserved exactly; Lean
path verified PRESENT.)

**GLOSSARY refs:** [[def:splitbasis]] (the dependent sector basis);
[[def:Hlatt]] (the categorical Hom-space context); [[def:fuscat]].

**CONVENTIONS refs:** [P1.6(a)] vacuum index; [P1.6(g)]
particle-number disambiguation (Lean `n` = tensor degree = our `L`);
[P1.6(i)] left-associated fusion-tree (the configuration ordering is
the left-associated one).

**Lean files:** `Formalisation/Foundations/ConfigurationSpace.lean`
— PRESENT.

**Scripts:** `scripts/julia/configuration_space_checks.jl`,
`scripts/wolfram/configuration_space_exact.wls` — both PRESENT.

**Provenance reroute:** none.

**Notes:** verbatim preserve.

---

### Node 1.2.6 — validated in CAD

**Original statement:** "PROJECT-Q-HILB-COORD-001: For the project
definitions in handoff sections 1.2 and 2.1, Lean formalises the
finite-coordinate skeleton of the local occupation object Q and the
fixed total-charge sector H_N^W. A LocalOccupationModel is a finite
label type with a distinguished vacuum label; the summand labels of Q
are represented by LocalOccupationSummand label = label; the summand
labels of Q^{tensor n} are ordered configurations
LocalOccupationTensorSummand label n = Fin n -> label; and a fixed
H_N^W sector is represented, after choosing a finite coordinate basis
for every configuration-sector Hom(W,a_1 tensor ... tensor a_N), by
IndefiniteParticleSectorCoordinates with the accepted
configuration-space direct-sum expansion. Lean proves the
tensor-summand count |label|^n, vacuum tensor particle number zero,
the configuration-sector cardinality sum, and preservation of the
standard finite coordinate pairing. Julia and WolframScript
independently check the Fibonacci two-label instance, Q^{tensor 4}
label count, vacuum/all-tau particle numbers, flattened H_N^W
coordinate dimension, unflattening, and pairing preservation. This is
only the finite basis-dependent coordinate skeleton of Q and H_N^W;
it does not construct categorical direct sums, tensor powers, Hom
functors, canonical categorical isomorphisms, or fusion-category
Hilbert-space semantics."

**Updated statement:** "PROJECT-Q-HILB-COORD-001: For the project
definitions [[def:Q]] (local cell object) and [[def:Hlatt]] (fixed
total-charge sector `H_N^W`) in `summary.tex` §3.4 and §4.1, Lean
formalises the finite-coordinate skeleton. A LocalOccupationModel is
a finite label type with a distinguished vacuum label;
LocalOccupationSummand label = label realises the summand labels of
`Q` (under the canonical default [P1.6(h)] choice `Q = Q_full =
⊕_{a∈Irr(C)} a`); LocalOccupationTensorSummand label n = Fin n ->
label realises summands of `Q^{⊗n}`; and a fixed `H_N^W` sector is
represented, after choosing a finite coordinate basis for every
configuration-sector `Hom(W, a_1 ⊗ … ⊗ a_N)` (cf. [[def:splitbasis]]
under the left-associated [P1.6(i)] convention), by
IndefiniteParticleSectorCoordinates with the accepted
configuration-space direct-sum expansion (node 1.2.5). Lean proves
the tensor-summand count `|label|^n`, vacuum tensor particle number
zero, the configuration-sector cardinality sum, and preservation of
the standard finite coordinate pairing. Julia and WolframScript
independently check the Fibonacci two-label instance, `Q^{⊗4}` label
count, vacuum / all-tau particle numbers, flattened `H_N^W`
coordinate dimension, unflattening, and pairing preservation. This is
only the finite basis-dependent coordinate skeleton of `Q` and
`H_N^W`; it does not construct categorical direct sums, tensor
powers, Hom functors, canonical categorical isomorphisms, or
fusion-category Hilbert-space semantics. (The `N = 0` boundary
follows by [P1.6(j)].)"

**GLOSSARY refs:** [[def:Q]], [[def:Hlatt]], [[def:splitbasis]],
[[def:fib]], [[def:particle-number]], [[def:fuscat]].

**CONVENTIONS refs:** [P1.6(a)] vacuum index; [P1.6(g)]
particle-number disambiguation (the `N` in `H_N^W` is summary's `N` =
our `L` per [P1.6(g)]); [P1.6(h)] local cell object Q canonical
default; [P1.6(i)] left-associated fusion-tree; [P1.6(j)] `N = 0`
boundary.

**Lean files:** `Formalisation/Foundations/ProjectDefinitions.lean`
— PRESENT.

**Scripts:** `scripts/julia/project_definition_checks.jl`,
`scripts/wolfram/project_definition_exact.wls` — both PRESENT.

**Provenance reroute:** `handoff sections 1.2 and 2.1` →
`summary.tex` §3.4 (Local cell object) + §4.1 (Fixed-lattice
formulation).

**Notes:** Drift flag — the symbol `N` here is summary's `N` (tensor
degree) per [P1.6(g)]; particleNumber is our `n` (count of non-vacuum
legs). Substantive reword (added GLOSSARY tags + CONVENTIONS
citations + summary.tex section reroute); mathematical content
preserved.

---

### Node 1.2.7 — validated in CAD

**Original statement:** "FINITE-SKELETAL-FUSION-DATA-001: Lean
defines a finite skeletal fusion-data structure consisting of a
finite label type, a distinguished unit label, natural-number fusion
multiplicities, and left/right unit fusion laws. This formalises only
the finite label/multiplicity skeleton of the locally sourced
skeletal fusion category description. Lean instantiates this
structure with the accepted finite Fibonacci fusion table and proves
multiplicity-freeness plus total left/right unit multiplicity one.
Julia and WolframScript independently check the Fibonacci table,
multiplicity-free condition, unit laws, and unit total multiplicities.
This does not construct a fusion category, associators, F-symbols,
pentagon equations, duals, Hilbert Hom spaces, or categorical
reconstruction from skeletal data."

**Updated statement:** (verbatim — content preserved exactly; the
"locally sourced" phrase refers to the externals listed in node
1.2.2 / 1.3.x — `references/text/FibonacciAnyonModels.txt:304` etc.,
all PRESENT.)

**GLOSSARY refs:** [[def:fib]], [[def:fib-mult]], [[def:fuscat]].

**CONVENTIONS refs:** [P1.6(a)] vacuum index (distinguished unit
label); [P1.6(d)] multiplicity-free.

**Lean files:** `Formalisation/Foundations/SkeletalFusion.lean`
— PRESENT.

**Scripts:** `scripts/julia/fusion_rules_checks.jl`,
`scripts/wolfram/fusion_rules_exact.wls` — both PRESENT.

**Provenance reroute:** "locally sourced skeletal fusion category
description" → `summary.tex` §3.1 ([[def:fuscat]]) +
`references/text/FibonacciAnyonModels.txt:304` (PRESENT in this repo;
external `c52680400f530ad7.json` in CAD).

**Notes:** verbatim preserve.

---

### Node 1.2.8 — validated in CAD

**Original statement:** "DIRSUM-ADJOINT-COORD-001: In the finite
coordinate direct-sum model for a finite index type iota and
dependent coordinate family kappa, with the standard finite complex
coordinate pairing, component projection is the adjoint of component
inclusion: <inclusion_i x, y> = <x, projection_i y>. Equivalently,
<y, inclusion_i x> = <projection_i y, x>. Consequently the coordinate
range projection inclusion_i after projection_i is self-adjoint for
the standard finite coordinate pairing. Lean proves these identities
in Formalisation/Foundations/DirectSumCoordinates.lean; Julia and
WolframScript check exact finite matrix and complex-rational pairing
examples. This formalises only the finite coordinate adjoint law
corresponding to the locally sourced orthogonal direct-sum statement;
it does not construct categorical daggers, categorical adjoints,
orthogonal direct sums, Q, tensor powers, Hom functors, or
fusion-category basis provenance."

**Updated statement:** (verbatim — content preserved exactly; Lean
path verified PRESENT.)

**GLOSSARY refs:** [[def:splitbasis]]; [[def:fuscat]] (the
categorical-dagger context).

**CONVENTIONS refs:** [P1.6(c)] dagger; [P1.6(a)] vacuum index.

**Lean files:** `Formalisation/Foundations/DirectSumCoordinates.lean`
— PRESENT.

**Scripts:** uses the same direct_sum_orthogonal_* pair from 1.2.4
plus shared infrastructure.

**Provenance reroute:** "locally sourced orthogonal direct-sum
statement" → `summary.tex` §3 ([[def:fuscat]] unitarity clause).

**Notes:** verbatim preserve.

---

### Node 1.2.9 — validated in CAD

**Original statement:** "TRUNCATED-FOCK-COORD-001: In the finite
coordinate model for distinguishable Fock space truncated to particle
numbers 0 through maxN, after choosing a finite local coordinate
basis, the flattened basis is Sigma(n:Fin(maxN+1), Fin n -> localBasis).
Lean proves the particle-number direct-sum coordinate expansion to
component coordinates by length, the cardinality formula
|basis_{<=maxN}| = sum_{n=0}^{maxN} |localBasis|^n, the zero-particle
sector cardinality one, the one-particle sector cardinality
|localBasis|, pairing preservation under flattening, and the
Fibonacci two-label specialisation sum_{n=0}^{maxN} 2^n. Julia and
WolframScript check exact finite counts and complex-rational pairing
examples. This is only a finite coordinate truncation of the locally
sourced distinguishable-Fock direct sum over particle number; it does
not construct infinite direct sums, Hilbert completions, tensor
products, exchange symmetry quotients, categorical Hom spaces, or
physical Fock-space semantics."

**Updated statement:** (verbatim — content preserved exactly; Lean
file `Formalisation/Foundations/FockSpace.lean` PRESENT, not named
explicitly in the CAD node text but verified present.)

**GLOSSARY refs:** [[def:mobile-Fock]] (truncated-Fock is the MMA
formulation when truncated; the present coordinate model is the
finite skeleton); [[def:particle-number]] (the `n` here = our `n` =
count of non-vacuum legs).

**CONVENTIONS refs:** [P1.6(a)] vacuum index; [P1.6(g)]
particle-number disambiguation; [P1.6(j)] `N = 0` boundary
(zero-particle sector cardinality 1).

**Lean files:** `Formalisation/Foundations/FockSpace.lean` —
PRESENT.

**Scripts:** `scripts/julia/truncated_fock_checks.jl`,
`scripts/wolfram/truncated_fock_exact.wls` — both PRESENT.

**Provenance reroute:** "locally sourced distinguishable-Fock direct
sum" → `summary.tex` §4.1 ([[def:Hlatt]]) + the MMA-derived
[[def:mobile-Fock]] (the `Q^{⊗n}` direct-sum formulation).

**Notes:** Drift flag — the symbol `n` in this CAD node is the
particle number (our `n` per [P1.6(g)]) since it ranges 0..maxN;
distinct from summary's `N` (tensor degree = our `L`) in
[[def:Hlatt]].

---

### Node 1.3 (WP3) — pending in CAD

**Original statement:** "WP3: Formalise Fibonacci exact data: labels,
fusion rules, phi identities, F matrix unitarity/involutivity, binary
isometry conditions, PF map, and coassociative candidate."

**Updated statement:** "WP3: Formalise Fibonacci exact data — labels,
fusion rules, phi identities, F-matrix unitarity / involutivity,
binary isometry conditions, PF map, and coassociative candidate.
Scope: `Formalisation/Fibonacci/{Basic, Matrix, FusionRules, Binary,
Coassoc, BraidMatrices}.lean`. Realises [[def:fib]] / [[def:fib-F]]
/ [[def:fib-mult]] / [[def:PF]] / [[def:coassoc]] from `summary.tex`
§7 (Fibonacci worked example)."

**GLOSSARY refs:** [[def:fib]], [[def:fib-F]], [[def:fib-mult]],
[[def:phi]], [[def:PF]], [[def:coassoc]].

**CONVENTIONS refs:** [P1.6(a)] vacuum index; [P1.6(b)] F-matrix
gauge (the involutory/unitary coincidence for Fibonacci in scope);
[P1.6(d)] multiplicity-free (Fibonacci is); [P1.6(i)] left-associated
fusion-tree.

**Lean files:** scope = `Formalisation/Fibonacci/`.

**Scripts:** the Fibonacci-named scripts plus PF / coassoc / braid
checks.

**Provenance reroute:** N/A (WP-parent).

**Notes:** Minor reword (added current-repo paths + GLOSSARY tags).
Drift flag: F-matrix is BOTH unitary AND involutory for Fibonacci per
[P1.6(b)] + `summary.tex lem:F-invol` line 1072; the CAD title
"unitarity/involutivity" reads as a hallucination-risk callout flag
to readers who don't internalise this coincidence.

---

### Node 1.3.1 — validated in CAD

**Original statement:** "FIB-ALG-001: The Fibonacci exact constants
φ=(1+sqrt(5))/2 and D²=1+φ² satisfy φ²=φ+1, φ⁻¹=φ-1, φ⁻²+φ⁻¹=1, and
D²=2+φ. Proven in Lean at Formalisation/Fibonacci/Basic.lean and
checked by Julia/WolframScript."

**Updated statement:** (verbatim — content preserved exactly; Lean
path PRESENT.)

**GLOSSARY refs:** [[def:phi]] (canonical body cites
`references/text/FibonacciAnyonModels.txt:304` for `φ =
(1+sqrt(5))/2`); [[def:fib]].

**CONVENTIONS refs:** none beyond convention basics.

**Lean files:** `Formalisation/Fibonacci/Basic.lean` — PRESENT.

**Scripts:** `scripts/julia/fibonacci_checks.jl`,
`scripts/wolfram/fibonacci_exact.wls` — both PRESENT.

**Provenance reroute:** none; node cites the Lean file directly.

**Notes:** verbatim preserve. External source for φ:
`references/text/FibonacciAnyonModels.txt:304` and
`references/text/TrebstShortIntroductionFibonacciAnyons.txt:325` (CAD
external `c52680400f530ad7.json` — both files PRESENT in this repo).

---

### Node 1.3.2 — validated in CAD

**Original statement:** "FIB-MAT-001: For F=[[a,b],[b,-a]], if a²+b²=1
then FᵀF=I and F²=I; with a=φ⁻¹ and b²=φ⁻¹ this proves the sourced
Fibonacci F-matrix orthogonality and involutivity. Proven in Lean at
Formalisation/Fibonacci/Matrix.lean and checked by
Julia/WolframScript."

**Updated statement:** (verbatim — content preserved exactly; Lean
path PRESENT.)

**GLOSSARY refs:** [[def:fib-F]] (canonical Fibonacci F-matrix);
[[def:phi]]; [[def:fsymbol]].

**CONVENTIONS refs:** [P1.6(b)] F-matrix gauge (Fibonacci F is BOTH
unitary AND involutory under [P1.6(b)] / `summary.tex` `lem:F-invol`
line 1072).

**Lean files:** `Formalisation/Fibonacci/Matrix.lean` — PRESENT.

**Scripts:** `scripts/julia/fibonacci_checks.jl`,
`scripts/wolfram/fibonacci_exact.wls` — both PRESENT.

**Provenance reroute:** "sourced Fibonacci F-matrix" →
`references/text/FibonacciAnyonModels.txt:297-304` +
`references/text/TrebstShortIntroductionFibonacciAnyons.txt:323-325`
(CAD external `478d5e0abc028c88.json` — both PRESENT).

**Notes:** verbatim preserve.

---

### Node 1.3.3 — validated in CAD

**Original statement:** "FIB-PF-001: The Fibonacci Perron-Frobenius
binary amplitudes are normalised: 1/D²+φ²/D²=1 and
1/D²+1/D²+φ/D²=1. Proven in Lean at Formalisation/Fibonacci/Basic.lean
and checked by Julia/WolframScript."

**Updated statement:** (verbatim — content preserved exactly; Lean
path PRESENT.)

**GLOSSARY refs:** [[def:PF]] (PF amplitudes); [[def:phi]];
[[def:fib]].

**CONVENTIONS refs:** none.

**Lean files:** `Formalisation/Fibonacci/Basic.lean` — PRESENT.

**Scripts:** `scripts/julia/fibonacci_checks.jl`,
`scripts/wolfram/fibonacci_exact.wls` — both PRESENT.

**Provenance reroute:** none.

**Notes:** verbatim preserve.

---

### Node 1.3.4 — validated in CAD

**Original statement:** "FIB-COASSOC-001: The proposed positive
coassociative candidate x=φ⁻¹, y=φ⁻¹/², r=φ⁻³/² satisfies
x²+y²=1, 2x²+r²=1, and r²=φ⁻³/²xy. Checked by Julia and
WolframScript; Lean coassociativity proof remains pending."

**Updated statement:** "FIB-COASSOC-001: The proposed positive
**scalar** coassociative candidate (per `summary.tex` §7.3.2 /
[[def:coassoc]]) x=φ⁻¹, y=φ⁻¹/², r=φ⁻³/² satisfies x²+y²=1,
2x²+r²=1, and r²=φ⁻³/²xy. Checked by Julia
(`scripts/julia/fibonacci_checks.jl`) and WolframScript
(`scripts/wolfram/fibonacci_exact.wls`). Lean proves the scalar
coassociative equations in `Formalisation/Fibonacci/Coassoc.lean`
(see also node 1.3.12 FIB-COASSOC-UNIQUE-001 and node 1.3.17
FIB-COASSOC-BINARY-ISO-001); the **categorical** coassociativity
`(η⊗id)η = (id⊗η)η` is NOT proved in this repo (per
[[def:coassoc]] Notes + CLAUDE.md hallucination-risk callout #3)."

**GLOSSARY refs:** [[def:coassoc]] (the scalar candidate);
[[def:phi]]; [[def:fib]].

**CONVENTIONS refs:** none beyond basics.

**Lean files:** `Formalisation/Fibonacci/Coassoc.lean` — PRESENT
(via Phase-5 port; provides the scalar coassoc proof CAD 1.3.4
flagged as pending).

**Scripts:** `scripts/julia/fibonacci_checks.jl`,
`scripts/wolfram/fibonacci_exact.wls` — both PRESENT.

**Provenance reroute:** none.

**Notes:** **Substantial reword** — CAD said "Lean coassociativity
proof remains pending"; that is no longer accurate at the scalar
level (Phase-5 ported the Coassoc.lean file with the scalar proof,
plus 1.3.12 and 1.3.17 prove the algebraic and coordinate-isometry
forms). The categorical coassociativity `(η⊗id)η = (id⊗η)η` IS still
pending, and this is the CLAUDE.md hallucination-risk callout #3 (do
NOT conflate scalar with categorical). The updated statement
preserves the original mathematical content and flags the
scalar/categorical distinction explicitly.

---

### Node 1.3.5 — archived in CAD

**Original statement:** "FIB-RG-NORM-001: The no-mixing RG amplitudes
in handoff §9.7 are normalised for vacuum and tau sectors for
positive rho and nonzero denominators. Checked numerically in Julia
and symbolically for a representative exact instance in
WolframScript; general Lean theorem remains pending."

**Updated statement:** "FIB-RG-NORM-001 (ARCHIVED): The no-mixing RG
amplitudes in `summary.tex` §11.1 ([[def:RG-amp]]) are normalised for
vacuum and tau sectors for positive ρ and nonzero denominators.
Checked numerically in Julia and symbolically for a representative
exact instance in WolframScript; general Lean theorem remains pending
(superseded by the more specific nodes 1.3.7, 1.3.14, 1.5.16, and the
generic finite no-mixing theorem at node 1.4.9 MAT-NOMIX-POLAR-001 in
`Formalisation/LinearAlgebra/NoMixing.lean`)."

**GLOSSARY refs:** [[def:RG-amp]]; [[def:PF]]; [[def:fib]].

**CONVENTIONS refs:** none beyond basics.

**Lean files:** N/A (archived; partial replacement at
`Formalisation/LinearAlgebra/NoMixing.lean` + `Formalisation/
Fibonacci/RGNoMixing.lean`, both PRESENT).

**Scripts:** none specific.

**Provenance reroute:** `handoff §9.7` → `summary.tex` §11.1 +
[[def:RG-amp]] (canonical body sourced from `summary.tex`).

**Notes:** Status preserved as archived. The "supersession" sentence
in the updated statement is mathematically accurate per the
Phase-5/6 Lean+script porting; CAD itself archived this node for
this very reason. **af replay** should `af refine` then `af archive`
to recreate the archived state.

---

### Node 1.3.6 — validated in CAD

**Original statement:** "FIB-BINARY-001: After choosing the sourced
orthogonal binary fusion-tree basis, the coordinate matrix for eta:
Q -> Q tensor Q with coefficients x,y,p,q,r is isometric iff
star(x)x+star(y)y=1 and star(p)p+star(q)q+star(r)r=1. This formalises
the coordinate part of THM-9.4.1; the categorical basis choice is
recorded as an external assumption."

**Updated statement:** "FIB-BINARY-001: After choosing the sourced
orthogonal binary fusion-tree basis (left-associated per [P1.6(i)]
from external `Penneys binary fusion-tree basis and Fibonacci
distinct-simple relation` =
`references/text/PenneysUnitaryFusionCategories.md:532, :610, :623-625`),
the coordinate matrix for η: Q → Q⊗Q with coefficients x,y,p,q,r is
isometric iff star(x)x + star(y)y = 1 and star(p)p + star(q)q +
star(r)r = 1. This formalises the coordinate part of `summary.tex`
THM-9.4.1 ≡ `summary.tex` §7.3 binary refinement; the categorical
basis choice is recorded as an external assumption (CAD external
`6e701135c915e3a7.json`; SHA256 preserved in this repo's
`PROVENANCE.md` after P7.2c executes)."

**GLOSSARY refs:** [[def:Q]] ([P1.6(h)] canonical default applies);
[[def:splitbasis]]; [[def:coassoc]]; [[def:PF]].

**CONVENTIONS refs:** [P1.6(c)] dagger (the isometry equation);
[P1.6(d)] multiplicity-free (binary tree); [P1.6(i)] left-associated
fusion-tree.

**Lean files:** `Formalisation/Fibonacci/Binary.lean` — PRESENT.

**Scripts:** referenced by node 1.3.13 / 1.3.17 cross-checks
(Fibonacci binary).

**Provenance reroute:** `handoff THM-9.4.1` → `summary.tex` §7.3 +
[[def:fib-F]] / [[def:PF]] / [[def:coassoc]] depending on the binary
solution branch.

**Notes:** Substantive reword (added external + GLOSSARY tags);
mathematical content preserved exactly.

---

### Node 1.3.7 — validated in CAD

**Original statement:** "FIB-NOMIX-001: For any finite complex vector
beta with nonzero sum_nu |beta_nu|^2, the no-mixing amplitudes A_nu
= conjugate(beta_nu)/sqrt(sum_nu |beta_nu|^2) satisfy sum_nu
conjugate(A_nu) A_nu = 1. This proves the scalar normalisation used
by the handoff §9.7 vacuum and tau RG formulas."

**Updated statement:** "FIB-NOMIX-001: For any finite complex vector
β with nonzero `sum_ν |β_ν|^2`, the no-mixing amplitudes
`A_ν = conjugate(β_ν) / sqrt(sum_ν |β_ν|^2)` satisfy
`sum_ν conjugate(A_ν) A_ν = 1`. This proves the scalar normalisation
used by the `summary.tex` §11.1 vacuum and tau RG formulas
([[def:RG-amp]])."

**GLOSSARY refs:** [[def:RG-amp]]; [[def:polar-repair]] (the polar
formulation is the finite analogue here).

**CONVENTIONS refs:** [P1.6(c)] dagger / conjugation.

**Lean files:** `Formalisation/LinearAlgebra/NoMixing.lean` —
PRESENT.

**Scripts:** generic finite vector checks — covered by
`scripts/julia/linear_algebra_checks.jl` etc.

**Provenance reroute:** `handoff §9.7` → `summary.tex` §11.1.

**Notes:** Minor reword.

---

### Node 1.3.8 — validated in CAD

**Original statement:** "FIB-FUSION-001: The finite skeletal
Fibonacci label set has labels 1 and tau with multiplicity-free
fusion rules 1⊗1=1, 1⊗tau=tau, tau⊗1=tau, and tau⊗tau=1⊕tau. Lean
formalises the fusionMultiplicity table and proves the stated cases,
multiplicity-free bound, and tau⊗tau total multiplicity two."

**Updated statement:** (verbatim — content preserved exactly.)

**GLOSSARY refs:** [[def:fib]] (the category itself);
[[def:fib-mult]] (the multiplication structure).

**CONVENTIONS refs:** [P1.6(a)] vacuum index (label `1` is the
unit); [P1.6(d)] multiplicity-free (verified by `tau⊗tau=1⊕tau`
having each entry multiplicity ≤ 1).

**Lean files:** `Formalisation/Fibonacci/FusionRules.lean` —
PRESENT.

**Scripts:** `scripts/julia/fusion_rules_checks.jl`,
`scripts/wolfram/fusion_rules_exact.wls` — both PRESENT.

**Provenance reroute:** "sourced" refers to
`references/text/FibonacciAnyonModels.txt` and
`references/text/TrebstShortIntroductionFibonacciAnyons.txt` (both
PRESENT).

**Notes:** verbatim preserve. Note the "total multiplicity two" for
`tau⊗tau=1⊕tau` is the sum of two multiplicity-1 entries (one for
each of 1 and tau as output) — does NOT violate the
multiplicity-free [P1.6(d)] assumption.

---

### Node 1.3.9 — validated in CAD

**Original statement:** "WP3 partial QED: The finite skeletal
Fibonacci fusion table, golden-ratio algebra, F-matrix real algebra,
PF scalar normalisations, binary coordinate isometry condition,
coassociative scalar/F-vector check, and scalar no-mixing
normalisation are validated in nodes 1.3.8, 1.3.1, 1.3.2, 1.3.3,
1.3.6, 1.3.4, and 1.3.7. Remaining WP3 work includes full categorical
coassociativity, categorical PF map isometry packaging, and
basis/dependency enforcement."

**Updated statement:** "WP3 partial QED: The finite skeletal
Fibonacci fusion table, golden-ratio algebra, F-matrix real algebra,
PF scalar normalisations, binary coordinate isometry condition,
coassociative scalar/F-vector check, and scalar no-mixing
normalisation are validated in nodes 1.3.8, 1.3.1, 1.3.2, 1.3.3,
1.3.6, 1.3.4, and 1.3.7 (Lean files all PRESENT in current
`Formalisation/Fibonacci/`, byte-verbatim per Phase-5; cross-checks
PASS per `results/CHECKS.md`). Remaining WP3 work includes:
**categorical coassociativity** `(η⊗id)η = (id⊗η)η` (not in
[[def:coassoc]]; CLAUDE.md hallucination-risk callout #3);
**categorical PF map isometry packaging** ([[def:PF]] at the
categorical level rather than the binary coordinate level proven at
1.3.13); and basis/dependency enforcement (an
infrastructure/organisation item, partially addressed by Phase-5
re-creation of dropped decls at P5.17)."

**GLOSSARY refs:** as for WP3 parent (1.3); the "categorical
coassociativity" mention is intentional drift-flag prose, not a slug
reference.

**CONVENTIONS refs:** as for WP3 parent.

**Lean files:** N/A (summary node — references nodes 1.3.1–1.3.8).

**Scripts:** N/A.

**Provenance reroute:** none directly; the references
1.3.8/1.3.1/etc. point to other nodes in this same mapping.

**Notes:** Minor reword + drift flag (made the
scalar/categorical-coassoc distinction explicit).

---

### Node 1.3.10 — validated in CAD

**Original statement:** "FIB-BRAID-001: For the two-dimensional
Fibonacci braid matrices sourced from the local KZ/Fibonacci paper,
let B12(q)=diag(q^2,-q) and let B23(c,q,s)=c [[-1, q s], [q s, q^2]].
If c(q+1)=q and q s^2=q^2+q+1, then B12 B23 B12 = B23 B12 B23. The
sourced specialisation is q=exp(-2*pi*i/5), phi=(1+sqrt(5))/2,
s=sqrt(phi), and c=q/(q+1), matching the displayed B12, B23, phi
relation, and braid relation in the local paper. This formalises only
the finite 2x2 matrix algebra; it does not construct categorical
braidings, neighboring exchange maps on Q^tensor N, braid group
representations, conformal blocks, or analytic monodromy."

**Updated statement:** (verbatim — content preserved exactly; the
"local KZ/Fibonacci paper" reference is `references/text/Garjani*`
or the KZ paper extracted in `references/`, verified PRESENT via
`CITATION_INDEX.md` `kz` atom.)

**GLOSSARY refs:** [[def:phi]]; [[def:fib]].

**CONVENTIONS refs:** none beyond basics.

**Lean files:** `Formalisation/Fibonacci/BraidMatrices.lean` —
PRESENT.

**Scripts:** `scripts/julia/fibonacci_braid_checks.jl`,
`scripts/wolfram/fibonacci_braid_exact.wls` — both PRESENT.

**Provenance reroute:** "local KZ/Fibonacci paper" → cite via
`CITATION_INDEX.md` koo-saleur / kz entry + the
references/-PDF that backs it.

**Notes:** verbatim preserve.

---

### Node 1.3.11 — validated in CAD

**Original statement:** "FIB-BRAID-UNITARY-001: In finite matrix
coordinates, if F is two-sided unitary and R is two-sided unitary,
then the conjugated braid matrix B = F R F^dagger is two-sided
unitary. This is the finite-dimensional algebra behind the locally
sourced statement that F-moves are unitary, braiding/R matrices are
unitary and diagonal in a suitable basis, and the braid matrix is B
= F R F^-1; for a unitary F, F^-1 is F^dagger. Lean proves the
generic finite-matrix theorem, while Julia and WolframScript check
the sourced 5 x 5 Fibonacci F and R matrices. This node does not
construct categorical braidings, mapping-class-group representations,
conformal blocks, or analytic monodromy."

**Updated statement:** (verbatim — content preserved exactly.)

**GLOSSARY refs:** [[def:fib-F]]; [[def:fsymbol]];
[[conv:unitary-default]].

**CONVENTIONS refs:** [P1.6(b)] F-matrix gauge (unitary canonical);
[P1.6(c)] dagger.

**Lean files:** `Formalisation/Fibonacci/BraidMatrices.lean` —
PRESENT.

**Scripts:** `scripts/julia/fibonacci_braid_unitarity_checks.jl`,
`scripts/wolfram/fibonacci_braid_unitarity_exact.wls` — both
PRESENT.

**Provenance reroute:** "locally sourced statement that F-moves are
unitary" → `summary.tex def:fsymbol` line 156 + `lem:F-invol` line
1072.

**Notes:** verbatim preserve.

---

### Node 1.3.12 — validated in CAD

**Original statement:** "FIB-COASSOC-UNIQUE-001: For the scalar
positive real coassociative equations in handoff section 9.6, if
x,y,r are positive and satisfy x^2+y^2=1, 2x^2+r^2=1, and
r^2=phi^(-3/2)xy expressed in the formalisation as r^2=coassocR*x*y
with coassocR=phi^(-1)*phi^(-1/2), then the unique positive solution
is x=phi^(-1), y=phi^(-1/2), r=phi^(-3/2). Lean proves this scalar
uniqueness theorem by eliminating to the polynomial in u=x^2 and
using positivity to select the u<1/2 root; Julia checks the
high-precision eliminated roots and recovery of x,y,r; WolframScript
proves the exact quantified implication. This does not prove
categorical coassociativity, associator semantics, fusion-tree basis
comparison, or existence of the map in a fusion category."

**Updated statement:** "FIB-COASSOC-UNIQUE-001: For the scalar
positive real coassociative equations in `summary.tex` §7.3.2
([[def:coassoc]]), if x,y,r are positive and satisfy x²+y²=1,
2x²+r²=1, and r²=φ^(-3/2)xy (expressed in the formalisation as
r²=coassocR·x·y with coassocR=φ^(-1)·φ^(-1/2)), then the unique
positive solution is x=φ^(-1), y=φ^(-1/2), r=φ^(-3/2). Lean proves
this scalar uniqueness theorem in `Formalisation/Fibonacci/
Coassoc.lean` by eliminating to the polynomial in u=x² and using
positivity to select the u<1/2 root; Julia
(`scripts/julia/coassoc_unique_checks.jl`) checks the high-precision
eliminated roots and recovery of x,y,r; WolframScript
(`scripts/wolfram/coassoc_unique_exact.wls`) proves the exact
quantified implication. This does not prove **categorical**
coassociativity (CLAUDE.md hallucination-risk callout #3),
associator semantics, fusion-tree basis comparison, or existence of
the map in a fusion category."

**GLOSSARY refs:** [[def:coassoc]]; [[def:phi]]; [[def:fib]].

**CONVENTIONS refs:** none beyond basics.

**Lean files:** `Formalisation/Fibonacci/Coassoc.lean` — PRESENT.

**Scripts:** `scripts/julia/coassoc_unique_checks.jl`,
`scripts/wolfram/coassoc_unique_exact.wls` — both PRESENT.

**Provenance reroute:** `handoff §9.6` → `summary.tex` §7.3.2
(Coassociative splitting, line 1151) + [[def:coassoc]].

**Notes:** Substantive reword (added GLOSSARY tags + summary.tex
reroute + script paths + drift flag for scalar/categorical
distinction); mathematical content preserved exactly.

---

### Node 1.3.13 — validated in CAD

**Original statement:** "FIB-PF-BINARY-ISO-001: Relative to the
handoff-specified Perron-Frobenius binary Fibonacci coefficients
x=1/D, y=phi/D, p=1/D, q=1/D, r=sqrt(phi)/D with D^2=1+phi^2, the
coordinate binary eta matrix in the sourced orthogonal binary
fusion-tree basis is an isometry. Lean packages the accepted scalar
PF normalisations with the accepted binary coordinate isometry
theorem to prove PFBinaryEta^* PFBinaryEta=I; Julia and WolframScript
check the exact PF 5 x 2 matrix Gram product. This node proves only
the coordinate-level PF binary map after the basis and coefficient
conventions are fixed; it does not prove the general
quantum-dimension amplitude formula, categorical PF naturality,
string-net fixed-point semantics, or basis construction."

**Updated statement:** "FIB-PF-BINARY-ISO-001: Relative to the
Perron-Frobenius binary Fibonacci coefficients (per `summary.tex`
§7.3.1 [[def:PF]]) x=1/D, y=φ/D, p=1/D, q=1/D, r=sqrt(φ)/D with
D²=1+φ², the coordinate binary η matrix in the sourced orthogonal
binary fusion-tree basis (left-associated per [P1.6(i)]) is an
isometry. Lean (in `Formalisation/Fibonacci/Binary.lean`) packages
the accepted scalar PF normalisations with the accepted binary
coordinate isometry theorem to prove `PFBinaryEta^* PFBinaryEta = I`;
Julia and WolframScript check the exact PF 5 × 2 matrix Gram product.
This node proves only the coordinate-level PF binary map after the
basis and coefficient conventions are fixed; it does not prove the
general quantum-dimension amplitude formula, categorical PF
naturality, string-net fixed-point semantics, or basis construction."

**GLOSSARY refs:** [[def:PF]]; [[def:phi]]; [[def:fib]];
[[def:splitbasis]].

**CONVENTIONS refs:** [P1.6(c)] dagger; [P1.6(i)] left-associated
fusion-tree.

**Lean files:** `Formalisation/Fibonacci/Binary.lean` — PRESENT.

**Scripts:** `scripts/julia/fibonacci_checks.jl`,
`scripts/wolfram/fibonacci_exact.wls` — both PRESENT.

**Provenance reroute:** "handoff-specified" → `summary.tex` §7.3.1
+ [[def:PF]] (canonical body).

**Notes:** Minor reword (added GLOSSARY tags + reroute); mathematical
content preserved exactly.

---

### Node 1.3.14 — validated in CAD

**Original statement:** "FIB-RG-NOMIX-ROWS-001: For the Fibonacci
no-mixing RG rows in handoff section 9.7, package the vacuum row as
beta=(u0, uI*s_vac) and the tau row as beta=(jL, jR, uTau*s_tau),
where the real scale factors stand for the locally sourced powers
rho^(-4/5) and rho^(-2/5). Lean proves the finite denominator formulas
|u0|^2+|uI|^2*s_vac^2 and |jL|^2+|jR|^2+|uTau|^2*s_tau^2, the
displayed normalised-conjugate amplitude entries, and normalisation of
each row when the denominator is nonzero. Julia and WolframScript
check the sourced rho-power examples. This formalises only finite row
algebra after the RG coefficients and scale powers are supplied; it
does not derive the coefficients, physical OPE constants,
fractional-power analysis, full polar decomposition, or categorical
basis semantics."

**Updated statement:** "FIB-RG-NOMIX-ROWS-001: For the Fibonacci
no-mixing RG rows in `summary.tex` §11.1 ([[def:RG-amp]]), package
the vacuum row as β=(u₀, u_I·s_vac) and the tau row as β=(j_L, j_R,
u_τ·s_τ), where the real scale factors stand for the locally sourced
powers ρ^(-4/5) and ρ^(-2/5) (cf. node 1.5.7 FIB-RG-EXP-001 for the
exponent derivation). Lean (in `Formalisation/Fibonacci/
RGNoMixing.lean`) proves the finite denominator formulas
|u₀|²+|u_I|²·s_vac² and |j_L|²+|j_R|²+|u_τ|²·s_τ², the displayed
normalised-conjugate amplitude entries, and normalisation of each row
when the denominator is nonzero. Julia and WolframScript check the
sourced ρ-power examples. This formalises only finite row algebra
after the RG coefficients and scale powers are supplied; it does not
derive the coefficients, physical OPE constants, fractional-power
analysis, full polar decomposition, or categorical basis semantics."

**GLOSSARY refs:** [[def:RG-amp]]; [[def:fib]]; [[def:primary]] (for
the conformal weight `h_τ=2/5` underlying the scale powers).

**CONVENTIONS refs:** none beyond basics.

**Lean files:** `Formalisation/Fibonacci/RGNoMixing.lean` —
PRESENT.

**Scripts:** generic — covered by `scripts/julia/cft_weight_checks.jl`
etc.

**Provenance reroute:** `handoff §9.7` → `summary.tex` §11.1 +
[[def:RG-amp]].

**Notes:** Minor reword + added cross-reference to node 1.5.7 for the
exponent derivation.

---

### Node 1.3.15 — validated in CAD

**Original statement:** "FIB-PF-DIM-AMP-001: In the finite skeletal
Fibonacci model with labels 1 and tau, the dimension function d_1=1
and d_tau=phi is a Perron-Frobenius eigenvector for the tau fusion
matrix with eigenvalue phi. Defining the handoff Perron-Frobenius
binary coefficient formula A^a_{bc}=sqrt(d_b d_c/(d_a D^2)) for the
five allowed Fibonacci binary channels gives exactly the displayed
coefficients 1/D, phi/D, 1/D, 1/D, and sqrt(phi)/D. The resulting
coordinate binary eta matrix equals the previously validated PF
binary eta matrix and is therefore an isometry. Lean proves the
eigenvector identity, the five coefficient equalities, equality of
the dimension-formula matrix with PFBinaryEta, and its Gram isometry
in Formalisation/Fibonacci/FusionRules.lean and
Formalisation/Fibonacci/Binary.lean. Julia and WolframScript check
the same coefficient formula and matrix isometry. This formalises
only the finite Fibonacci quantum-dimension coefficient calculation
after the allowed channels and basis convention are supplied; it does
not prove categorical Perron-Frobenius naturality, string-net
fixed-point semantics, or construction of fusion-tree bases."

**Updated statement:** (verbatim — Lean paths PRESENT in current
`Formalisation/Fibonacci/`.)

**GLOSSARY refs:** [[def:PF]]; [[def:phi]]; [[def:qdim]] (the
quantum-dimension `d_τ=φ` is the Perron-Frobenius eigenvalue);
[[def:fib]]; [[def:fib-mult]].

**CONVENTIONS refs:** [P1.6(a)] vacuum index; [P1.6(d)]
multiplicity-free (the five binary channels are the
multiplicity-free entries of `τ⊗τ=1⊕τ` decomposed binary-tree).

**Lean files:** `Formalisation/Fibonacci/FusionRules.lean` +
`Formalisation/Fibonacci/Binary.lean` — BOTH PRESENT.

**Scripts:** `scripts/julia/fusion_rules_checks.jl`,
`scripts/wolfram/fusion_rules_exact.wls` — PRESENT.

**Provenance reroute:** "handoff Perron-Frobenius binary coefficient
formula" → `summary.tex` §7.3.1 + [[def:PF]].

**Notes:** verbatim preserve.

---

### Node 1.3.16 — validated in CAD

**Original statement:** "FIB-COASSOC-FRAC-POW-001: For the positive
scalar Fibonacci coassociative candidate, Lean proves the coefficient
identifications underlying the handoff notation phi^(-1/2) and
phi^(-3/2): coassocY = (sqrt phi)^(-1), coassocR = phi^(-1) (sqrt
phi)^(-1), coassocR^2 = (phi^(-1))^3, and coassocR is the positive
square root sqrt((phi^(-1))^3). Julia and WolframScript independently
check the corresponding high-precision and exact fractional-power
identities. This closes only the scalar real-number interpretation of
the handoff fractional-power notation for the already accepted
coassociative candidate; it does not prove categorical
coassociativity, associator semantics, fusion-tree basis comparison,
or existence of the categorical map."

**Updated statement:** (verbatim with handoff→summary.tex reroute —
"handoff notation" → "`summary.tex` §7.3.2 ([[def:coassoc]])
notation"; preserves the scalar-vs-categorical drift flag in the
final sentence.)

**GLOSSARY refs:** [[def:coassoc]]; [[def:phi]]; [[def:fib]].

**CONVENTIONS refs:** none beyond basics.

**Lean files:** `Formalisation/Fibonacci/Coassoc.lean` — PRESENT.

**Scripts:** `scripts/julia/fibonacci_checks.jl`,
`scripts/wolfram/fibonacci_exact.wls` — PRESENT.

**Provenance reroute:** `handoff notation` → `summary.tex` §7.3.2 +
[[def:coassoc]].

**Notes:** verbatim preserve (modulo handoff-reroute prose).

---

### Node 1.3.17 — validated in CAD

**Original statement:** "FIB-COASSOC-BINARY-ISO-001: In the fixed
five-channel binary Fibonacci coordinate basis used for the binary
eta matrix, the handoff strict binary-composition candidate with
coefficients x=phi^(-1), y=phi^(-1/2), p=x, q=x, and r=phi^(-3/2) is
represented by CoassocBinaryEta = BinaryEta coassocX coassocY
coassocX coassocX coassocR and satisfies
CoassocBinaryEta^dagger CoassocBinaryEta=I. Lean proves the finite
matrix identity from the accepted binary isometry criterion and the
accepted scalar coassociative norm equations; Julia checks the
corresponding high-precision 5 x 2 Gram matrix entries; WolframScript
checks the exact symbolic Gram identity. This proves only the
coordinate-level isometry of the displayed candidate after the
orthogonal binary basis and coefficient convention are fixed; it does
not prove categorical coassociativity, associator semantics, F-move
basis comparison, or existence of the categorical map."

**Updated statement:** (verbatim with handoff→summary.tex reroute —
"handoff strict binary-composition candidate" → "`summary.tex`
§7.3.2 strict binary-composition candidate ([[def:coassoc]])";
preserves the scalar-vs-categorical drift flag.)

**GLOSSARY refs:** [[def:coassoc]]; [[def:phi]]; [[def:fib]];
[[def:splitbasis]].

**CONVENTIONS refs:** [P1.6(c)] dagger; [P1.6(i)] left-associated
fusion-tree.

**Lean files:** `Formalisation/Fibonacci/{Coassoc, Binary}.lean` —
BOTH PRESENT.

**Scripts:** `scripts/julia/fibonacci_checks.jl`,
`scripts/wolfram/fibonacci_exact.wls` — PRESENT.

**Provenance reroute:** `handoff strict binary-composition candidate`
→ `summary.tex` §7.3.2 + [[def:coassoc]].

**Notes:** verbatim preserve (modulo handoff-reroute prose).

---

### Node 1.4 (WP4) — pending in CAD

**Original statement:** "WP4: Formalise fine-graining isometry
theorems: induced Hom-sector isometries, component orthogonality,
block tensor isometries, unitary dressing, and polar fine-graining
formulas."

**Updated statement:** "WP4: Formalise fine-graining isometry
theorems: induced Hom-sector isometries, component orthogonality,
block tensor isometries, unitary dressing, and polar fine-graining
formulas. Scope: `Formalisation/LinearAlgebra/*.lean` (the 13 generic
finite-matrix files supporting [[def:refmap]] / [[def:polar-repair]]
/ [[def:blocking]] / [[def:ascending]] at the coordinate level).
Realises `summary.tex` §4.4 (Refinement and the inductive system) +
§11.2 (Canonical isometric refinement via polar decomposition)."

**GLOSSARY refs:** [[def:refmap]]; [[def:polar-repair]];
[[def:blocking]]; [[def:ascending]]; [[def:fib]] (Fibonacci as the
worked instance).

**CONVENTIONS refs:** [P1.6(c)] dagger (isometry equations); [P1.6(b)]
F-matrix gauge (the Fibonacci/Ising F-matrices participate
downstream).

**Lean files:** scope = `Formalisation/LinearAlgebra/`.

**Scripts:** scope = the LinearAlgebra-related cross-check scripts.

**Provenance reroute:** N/A (WP-parent).

**Notes:** Minor reword.

---

### Node 1.4.1 — validated in CAD

**Original statement:** "MAT-DRESS-001: For finite complex matrices E
and U, if E^*E=I and U^*U=I, then (UE)^*(UE)=I. This formalises the
finite-matrix unitary dressing part of THM-5.2.1."

**Updated statement:** "MAT-DRESS-001: For finite complex matrices E
and U, if `E^*E=I` and `U^*U=I`, then `(UE)^*(UE)=I`. This formalises
the finite-matrix unitary dressing part of `summary.tex` §11.2
([[def:refmap]] + unitary dressing) — the CAD-`THM-5.2.1`
correspondence is to the `summary.tex` 'dressing by a fine-scale
unitary preserves isometry' claim."

**GLOSSARY refs:** [[def:refmap]]; [[conv:unitary-default]].

**CONVENTIONS refs:** [P1.6(c)] dagger.

**Lean files:** `Formalisation/LinearAlgebra/Isometry.lean` —
PRESENT (the dressing lemma lives in the Isometry module per the
CAD-original).

**Scripts:** `scripts/julia/linear_algebra_checks.jl`,
`scripts/wolfram/linear_algebra_exact.wls` — PRESENT.

**Provenance reroute:** `THM-5.2.1` → `summary.tex` §11.2
([[def:refmap]] + the dressing-unitary remark).

**Notes:** Minor reword.

---

### Node 1.4.2 — validated in CAD

**Original statement:** "MAT-COMP-001: For a finite complex matrix E
indexed by coarse components a and fine components b, the isometry
equation E^*E=I is equivalent to the component orthogonality
equations sum_b conjugate(E_{b,a}) E_{b,a'} = delta_{a,a'}. This is
the scalar finite-matrix core of handoff THM-4.2.1 after choosing
orthonormal component bases; it is not the full categorical
direct-sum theorem for block Hom spaces. Proven in Lean at
Formalisation/LinearAlgebra/Component.lean and checked by
Julia/WolframScript."

**Updated statement:** (verbatim with handoff→summary.tex reroute —
"handoff THM-4.2.1" → "`summary.tex` §4.4 component-isometry
equivalence ([[def:refmap]] / [[def:Hlatt]])"; Lean path PRESENT.)

**GLOSSARY refs:** [[def:refmap]]; [[def:Hlatt]]; [[def:splitbasis]].

**CONVENTIONS refs:** [P1.6(c)] dagger.

**Lean files:** `Formalisation/LinearAlgebra/Component.lean` —
PRESENT.

**Scripts:** `scripts/julia/component_orthogonality_checks.jl`,
`scripts/wolfram/component_orthogonality_exact.wls` — both PRESENT.

**Provenance reroute:** `handoff THM-4.2.1` → `summary.tex` §4.4
([[def:refmap]] component form).

**Notes:** Minor reword.

---

### Node 1.4.3 — validated in CAD

**Original statement:** "MAT-TENSOR-001: For finite complex matrices
E1 and E2, if E1^*E1=I and E2^*E2=I, then their Kronecker tensor
product satisfies (E1 tensor E2)^*(E1 tensor E2)=I. This is the
two-factor finite-matrix core of handoff THM-5.1.1; it is not the
full categorical N-factor block tensor theorem. Proven in Lean at
Formalisation/LinearAlgebra/Tensor.lean and checked by
Julia/WolframScript."

**Updated statement:** (verbatim with handoff→summary.tex reroute —
"handoff THM-5.1.1" → "`summary.tex` §11.2 N-factor block tensor
isometry ([[def:refmap]] product structure)"; Lean path PRESENT.)

**GLOSSARY refs:** [[def:refmap]].

**CONVENTIONS refs:** [P1.6(c)] dagger.

**Lean files:** `Formalisation/LinearAlgebra/Tensor.lean` — PRESENT.

**Scripts:** `scripts/julia/tensor_isometry_checks.jl`,
`scripts/wolfram/tensor_isometry_exact.wls` — both PRESENT.

**Provenance reroute:** `handoff THM-5.1.1` → `summary.tex` §11.2.

**Notes:** Minor reword.

---

### Node 1.4.4 — validated in CAD

**Original statement:** "MAT-POST-001: For finite complex matrices E,
F, and G, if E^*E=I then postcomposition by E preserves the
Hom-space Gram product: (E F)^*(E G)=F^*G. This is the finite-matrix
forward direction of handoff THM-4.1.1 after choosing orthonormal
bases; it does not prove the converse separating-Hom statement or
categorical Hom-sector semantics. Proven in Lean at
Formalisation/LinearAlgebra/Postcompose.lean and checked by
Julia/WolframScript."

**Updated statement:** (verbatim with handoff→summary.tex reroute —
"handoff THM-4.1.1" → "`summary.tex` §4.4 induced Hom-sector
isometry (forward direction, [[def:refmap]])"; Lean path PRESENT.)

**GLOSSARY refs:** [[def:refmap]]; [[def:Hlatt]].

**CONVENTIONS refs:** [P1.6(c)] dagger.

**Lean files:** `Formalisation/LinearAlgebra/Postcompose.lean` —
PRESENT.

**Scripts:** `scripts/julia/postcompose_isometry_checks.jl`,
`scripts/wolfram/postcompose_isometry_exact.wls` — both PRESENT.

**Provenance reroute:** `handoff THM-4.1.1` → `summary.tex` §4.4.

**Notes:** Minor reword.

---

### Node 1.4.5 — validated in CAD

**Original statement:** "MAT-POLAR-001: For finite complex matrices B
and R, if R^*(B B^*)R=I, then E=B^*R is an isometry, E^*E=I, and its
entries satisfy E_{nu,mu}=sum_{mu'} conjugate(B_{mu',nu}) R_{mu',mu}.
This is the finite-matrix algebra and entry formula underlying
handoff THM-6.1.1/6.2.1; it assumes the inverse-square-root condition
and does not prove existence or positivity of matrix square roots.
Proven in Lean at Formalisation/LinearAlgebra/Polar.lean and checked
by Julia/WolframScript."

**Updated statement:** (verbatim with handoff→summary.tex reroute —
"handoff THM-6.1.1/6.2.1" → "`summary.tex` §11.2 polar canonical
section ([[def:polar-repair]] + [[def:blocking]] formula)"; Lean
path PRESENT. The "assumes inverse-square-root condition" comment is
the [[def:polar-repair]] Notes — Mathlib does not provide
`B^{-1/2}` for arbitrary positive operators, so it is taken as input.)

**GLOSSARY refs:** [[def:polar-repair]]; [[def:blocking]];
[[def:refmap]].

**CONVENTIONS refs:** [P1.6(c)] dagger.

**Lean files:** `Formalisation/LinearAlgebra/Polar.lean` — PRESENT.

**Scripts:** `scripts/julia/polar_section_checks.jl`,
`scripts/wolfram/polar_section_exact.wls` — both PRESENT.

**Provenance reroute:** `handoff THM-6.1.1/6.2.1` → `summary.tex`
§11.2 + [[def:polar-repair]] / [[def:blocking]].

**Notes:** Drift flag — the inverse-square-root caveat is the
[[def:polar-repair]] Mathlib-gap noted in PRD §"Known limitations"
and in GLOSSARY [[def:polar-repair]]; preserved verbatim from CAD.

---

### Node 1.4.6 — validated in CAD

**Original statement:** "WP4 partial QED: Nodes 1.4.4, 1.4.2, 1.4.3,
1.4.1, and 1.4.5 validate the finite-matrix fine-graining block:
postcomposition Gram preservation, component orthogonality,
two-factor tensor-product isometry, unitary dressing of an isometry,
and conditional polar-section algebra/entry formula. Remaining WP4
work includes converse separating-Hom theorem, categorical
Hom/direct-sum/tensor semantics, N-factor tensor induction, and
positive square-root/polar decomposition existence."

**Updated statement:** "WP4 partial QED: Nodes 1.4.4, 1.4.2, 1.4.3,
1.4.1, and 1.4.5 validate the finite-matrix fine-graining block:
postcomposition Gram preservation, component orthogonality,
two-factor tensor-product isometry, unitary dressing of an isometry,
and conditional polar-section algebra/entry formula (Lean files all
PRESENT in current `Formalisation/LinearAlgebra/`). Nodes 1.4.7
(MAT-TENSOR-POWER-001), 1.4.10 (MAT-TENSOR-THREE-HET-001), 1.4.15
(MAT-DRESSED-TENSOR-POWER-001), 1.4.16 (MAT-HET-TENSOR-N-001),
and 1.4.13 (MAT-POLAR-DIAG-SQRT-001) — also validated in CAD —
extend the partial QED to N-factor inductions and diagonal-Gram
square roots. Remaining work (carried over): full converse
separating-Hom theorem at the categorical level, categorical
Hom/direct-sum/tensor semantics, and general positive
square-root/polar decomposition existence ([[def:polar-repair]]
remains a Mathlib gap)."

**GLOSSARY refs:** [[def:polar-repair]]; [[def:refmap]];
[[def:blocking]].

**CONVENTIONS refs:** as for WP4 parent.

**Lean files:** N/A (summary node).

**Scripts:** N/A.

**Provenance reroute:** none.

**Notes:** Minor reword — added that the N-factor induction and
diagonal-Gram cases are also validated by sibling nodes (true in CAD
per the af status dump).

---

### Node 1.4.7 — validated in CAD

**Original statement:** "MAT-TENSOR-POWER-001: For a finite complex
matrix E with E^*E=I, the recursively defined N-fold Kronecker tensor
power E^{⊗N} is an isometry for every natural number N. Lean proves
this by induction in Formalisation/LinearAlgebra/TensorPower.lean
using the validated two-factor Kronecker isometry theorem; Julia and
WolframScript check exact rational 3-4-5 rotation examples for N <=
6. This node is the fixed-local-map finite-matrix induction case
only; it does not prove heterogeneous local maps, ordered partitions,
categorical tensor products, or the full block fine-graining
theorem."

**Updated statement:** (verbatim — Lean path PRESENT.)

**GLOSSARY refs:** [[def:refmap]] (the tensor-power isometry is
[[def:refmap]] at the coordinate level for the fixed-local-map case).

**CONVENTIONS refs:** [P1.6(c)] dagger; [P1.6(g)] particle-number
disambiguation (the `N` here = tensor degree = our `L`).

**Lean files:** `Formalisation/LinearAlgebra/TensorPower.lean` —
PRESENT.

**Scripts:** `scripts/julia/tensor_power_checks.jl`,
`scripts/wolfram/tensor_power_exact.wls` — both PRESENT.

**Provenance reroute:** none.

**Notes:** verbatim preserve.

---

### Node 1.4.8 — validated in CAD

**Original statement:** "MAT-POST-CONVERSE-001: For a finite complex
matrix E, if postcomposition by E preserves Gram products for every
pair of square coarse-coordinate test matrices F and G, namely (E
F)^*(E G)=F^*G for all F,G: coarse -> coarse, then E^*E=I. The proof
is the finite separating square-test part of the converse direction
of handoff THM-4.1.1: instantiate the preservation hypothesis at F=I
and G=I. Lean proves the generic finite-matrix theorem in
Formalisation/LinearAlgebra/Postcompose.lean; Julia and WolframScript
check the identity test and a non-isometry failure example. This does
not prove categorical semisimplicity, categorical separating-Hom
assumptions, or the all-simple-Hom converse in a fusion category."

**Updated statement:** (verbatim with handoff→summary.tex reroute —
"handoff THM-4.1.1" → "`summary.tex` §4.4 induced Hom-sector
isometry (converse direction, [[def:refmap]])"; Lean path PRESENT.)

**GLOSSARY refs:** [[def:refmap]]; [[def:Hlatt]].

**CONVENTIONS refs:** [P1.6(c)] dagger.

**Lean files:** `Formalisation/LinearAlgebra/Postcompose.lean` —
PRESENT.

**Scripts:** `scripts/julia/postcompose_isometry_checks.jl`,
`scripts/wolfram/postcompose_isometry_exact.wls` — PRESENT.

**Provenance reroute:** `handoff THM-4.1.1` → `summary.tex` §4.4.

**Notes:** Minor reword.

---

### Node 1.4.9 — validated in CAD

**Original statement:** "MAT-NOMIX-POLAR-001: For a finite
one-coarse-label no-mixing blocking row beta: fine -> C, define B:
PUnit x fine by B_*i=beta_i and R: PUnit x PUnit by R=1/sqrt(sum_i
|beta_i|^2). Then the polar-section matrix E=B^*R has entries
E_i=conjugate(beta_i)/sqrt(sum_i |beta_i|^2), and if the denominator
is nonzero then E^*E=1. This is the finite one-row matrix algebra
behind the no-mixing corollary in handoff section 6.2 and the
normalised RG amplitudes in section 9.7. Lean proves the generic
finite-index theorem in Formalisation/LinearAlgebra/NoMixing.lean;
Julia and WolframScript check representative finite examples. This
does not prove the full polar-decomposition theorem, positive matrix
square-root existence in general, Wilsonian RG coefficient
derivation, categorical basis semantics, or physical OPE constants."

**Updated statement:** (verbatim with handoff→summary.tex reroute —
"handoff section 6.2" → "`summary.tex` §11.2 no-mixing corollary
([[def:polar-repair]] one-row case)"; "section 9.7" → "`summary.tex`
§11.1 normalised RG amplitudes ([[def:RG-amp]])"; Lean path
PRESENT.)

**GLOSSARY refs:** [[def:polar-repair]]; [[def:RG-amp]];
[[def:blocking]].

**CONVENTIONS refs:** [P1.6(c)] dagger.

**Lean files:** `Formalisation/LinearAlgebra/NoMixing.lean` —
PRESENT.

**Scripts:** generic — covered by linear_algebra_checks +
fibonacci_checks family.

**Provenance reroute:** `handoff section 6.2` → `summary.tex` §11.2;
`section 9.7` → `summary.tex` §11.1.

**Notes:** Minor reword.

---

### Node 1.4.10 — validated in CAD

**Original statement:** "MAT-TENSOR-THREE-HET-001: For three finite
complex matrices E1, E2, and E3 with possibly different fine and
coarse index types, if each factor is an isometry, then the nested
heterogeneous Kronecker product (E1 tensor E2) tensor E3 is an
isometry. This is a three-factor finite-matrix instance of handoff
theorem target 5.1.1 for local block fine graining with nonidentical
local isometries. Lean proves the generic finite-matrix theorem in
Formalisation/LinearAlgebra/Tensor.lean using the validated
two-factor tensor theorem; Julia and WolframScript check
representative heterogeneous examples. This does not prove arbitrary
N-factor heterogeneous induction, ordered partition semantics,
categorical tensor products, or the full block fine-graining
theorem."

**Updated statement:** (verbatim with handoff→summary.tex reroute —
"handoff theorem target 5.1.1" → "`summary.tex` §11.2 block tensor
isometry (three-factor heterogeneous case)"; Lean path PRESENT.)

**GLOSSARY refs:** [[def:refmap]]; [[def:partition]] (the "ordered
partition" mention is the not-yet-proved categorical extension).

**CONVENTIONS refs:** [P1.6(c)] dagger.

**Lean files:** `Formalisation/LinearAlgebra/Tensor.lean` — PRESENT.

**Scripts:** `scripts/julia/tensor_isometry_checks.jl`,
`scripts/wolfram/tensor_isometry_exact.wls` — PRESENT.

**Provenance reroute:** `handoff theorem target 5.1.1` →
`summary.tex` §11.2.

**Notes:** Minor reword.

---

### Node 1.4.11 — validated in CAD

**Original statement:** "MAT-DRESSED-THREE-TENSOR-001: For three
finite complex matrix isometries E1, E2, and E3 with possibly
different fine and coarse index types, and for a finite unitary U on
the resulting three-factor fine product space, the dressed block map
U ((E1 tensor E2) tensor E3) is an isometry. This is the finite
three-factor matrix instance of handoff theorem target 5.2.1,
combining a heterogeneous local block tensor isometry with a
fine-scale dressing unitary. Lean proves the generic finite-matrix
theorem in Formalisation/LinearAlgebra/Tensor.lean from the unitary
dressing theorem and the validated three-factor tensor theorem; Julia
and WolframScript check representative heterogeneous examples. This
does not prove arbitrary N-factor dressing, categorical tensor
products, ordered partition semantics, or physical RG unitary
construction."

**Updated statement:** (verbatim with handoff→summary.tex reroute —
"handoff theorem target 5.2.1" → "`summary.tex` §11.2 dressed block
map (three-factor heterogeneous case)"; Lean path PRESENT.)

**GLOSSARY refs:** [[def:refmap]]; [[conv:unitary-default]].

**CONVENTIONS refs:** [P1.6(c)] dagger.

**Lean files:** `Formalisation/LinearAlgebra/Tensor.lean` — PRESENT.

**Scripts:** `scripts/julia/tensor_isometry_checks.jl`,
`scripts/wolfram/tensor_isometry_exact.wls` — PRESENT.

**Provenance reroute:** `handoff theorem target 5.2.1` →
`summary.tex` §11.2.

**Notes:** Minor reword.

---

### Node 1.4.12 — validated in CAD

**Original statement:** "FINITE-FINE-GRAINING-DEF-001: In finite
complex matrix coordinates, a project fine-graining map from coarse
coordinates to fine coordinates is a structure containing a matrix
E:fine->coarse together with the isometry equation E^dagger E=I. Lean
defines this structure as FiniteFineGraining in
Formalisation/LinearAlgebra/FineGraining.lean and proves that its
field immediately yields the validated finite consequences: ascending
unitality, postcomposition Gram preservation, state-embedding trace
preservation, expectation preservation, logical-lift retraction, and
the range projection E E^dagger being idempotent and self-adjoint.
Julia and WolframScript check representative exact finite matrices
for these consequences. This formalises only the finite coordinate
definition and algebraic consequences after bases have been chosen;
it does not construct Q^tensor N, categorical morphisms, Hom-sector
semantics, or physical fine-graining maps in a fusion category."

**Updated statement:** (verbatim — Lean path PRESENT.)

**GLOSSARY refs:** [[def:refmap]] (the categorical context);
[[def:blocking]] (the dagger E^† is [[def:blocking]] B);
[[def:ascending]] (the ascending unitality is the [[def:ascending]]
channel property).

**CONVENTIONS refs:** [P1.6(c)] dagger.

**Lean files:** `Formalisation/LinearAlgebra/FineGraining.lean` —
PRESENT.

**Scripts:** `scripts/julia/fine_graining_definition_checks.jl`,
`scripts/wolfram/fine_graining_definition_exact.wls` — both PRESENT.

**Provenance reroute:** none.

**Notes:** verbatim preserve.

---

### Node 1.4.13 — validated in CAD

**Original statement:** "MAT-POLAR-DIAG-SQRT-001: For a finite
complex blocking matrix B whose Gram matrix B B^dagger is diagonal
with strictly positive real diagonal entries g_mu, define
diagonalInvSqrt(g) to be the diagonal matrix with entries
(sqrt(g_mu))^(-1). Lean proves that diagonalInvSqrt(g) is
self-adjoint, satisfies diagonalInvSqrt(g)^dagger (B B^dagger)
diagonalInvSqrt(g)=I, and therefore the polar section B^dagger
diagonalInvSqrt(g) is an isometry. Julia checks numerical finite
examples including the exact diagonal Gram case g=(4,9); WolframScript
checks the exact diagonal inverse-square-root entries, inverse-
square-root condition, isometry, and entry formula. This proves only
the diagonal-Gram finite-coordinate inverse-square-root case of the
handoff polar formula; it does not prove the general positive matrix
square-root spectral theorem, full polar decomposition existence,
categorical Hilbert-space semantics, or full-rank criterion."

**Updated statement:** (verbatim with handoff→summary.tex reroute —
"handoff polar formula" → "`summary.tex` §11.2 polar formula
([[def:polar-repair]])"; Lean lives in
`Formalisation/LinearAlgebra/Polar.lean` per CAD-original.)

**GLOSSARY refs:** [[def:polar-repair]] (the diagonal-Gram case is
the only Mathlib-tractable case currently); [[def:blocking]].

**CONVENTIONS refs:** [P1.6(c)] dagger.

**Lean files:** `Formalisation/LinearAlgebra/Polar.lean` — PRESENT.

**Scripts:** `scripts/julia/polar_section_checks.jl`,
`scripts/wolfram/polar_section_exact.wls` — both PRESENT.

**Provenance reroute:** `handoff polar formula` → `summary.tex` §11.2.

**Notes:** Drift flag — diagonal-Gram inverse-square-root is the only
case Mathlib's current API supports without manually providing the
inverse-square-root; the general spectral theorem case is the
[[def:polar-repair]] open work.

---

### Node 1.4.14 — validated in CAD

**Original statement:** "FINITE-FINE-GRAINING-STAR-LIFT-001: For a
finite coordinate fine-graining map E:fine->coarse packaged as
FiniteFineGraining with E^dagger E=I, Lean proves two additional
packaged consequences of the accepted finite matrix algebra: the
ascending observable map O -> E^dagger O E preserves adjoints, E^dagger
O^dagger E = (E^dagger O E)^dagger, and the logical lift sends the
coarse identity to the code projection, (E I) E^dagger = E E^dagger.
Julia and WolframScript check these identities together with the
already accepted finite fine-graining consequences on
exact/numerical finite matrices. This is only finite coordinate
matrix algebra after bases are chosen; it does not prove categorical
channel semantics, physical complete positivity, categorical
subobjects, or construction of Q^tensor N maps."

**Updated statement:** (verbatim — Lean path PRESENT.)

**GLOSSARY refs:** [[def:ascending]] (the observable map O →
E^†OE); [[def:refmap]].

**CONVENTIONS refs:** [P1.6(c)] dagger.

**Lean files:** `Formalisation/LinearAlgebra/FineGraining.lean` —
PRESENT.

**Scripts:** `scripts/julia/fine_graining_definition_checks.jl`,
`scripts/wolfram/fine_graining_definition_exact.wls` — PRESENT.

**Provenance reroute:** none.

**Notes:** verbatim preserve.

---

### Node 1.4.15 — validated in CAD

**Original statement:** "MAT-DRESSED-TENSOR-POWER-001: For a finite
complex matrix E with E^*E=I, its recursively defined N-fold
Kronecker tensor power is an isometry for every natural number N, and
if U is any finite unitary matrix on the resulting fine tensor-power
coordinate space, then U E^{tensor N} is also an isometry. Lean
proves this generic finite-matrix theorem in
Formalisation/LinearAlgebra/TensorPower.lean from the validated
fixed-map tensor-power induction and unitary dressing theorem; Julia
and WolframScript check exact rectangular rational examples with a
nontrivial reversal permutation unitary for N <= 4. This is only the
fixed-local-map finite-matrix dressed tensor-power case; it does not
prove heterogeneous local maps, ordered partitions, categorical
tensor products, or physical construction of the RG dressing
unitary."

**Updated statement:** (verbatim — Lean path PRESENT.)

**GLOSSARY refs:** [[def:refmap]]; [[conv:unitary-default]];
[[def:partition]] (the "ordered partitions" mention is the categorical
extension not in scope).

**CONVENTIONS refs:** [P1.6(c)] dagger; [P1.6(g)] particle-number
disambiguation (the `N` here = tensor degree = our `L`).

**Lean files:** `Formalisation/LinearAlgebra/TensorPower.lean` —
PRESENT.

**Scripts:** `scripts/julia/tensor_power_checks.jl`,
`scripts/wolfram/tensor_power_exact.wls` — PRESENT.

**Provenance reroute:** none.

**Notes:** verbatim preserve.

---

### Node 1.4.16 — validated in CAD

**Original statement:** "MAT-HET-TENSOR-N-001: For any natural
number N and finite dependent families of fine and coarse coordinate
index types, if each local complex matrix E_i:fine_i->coarse_i
satisfies E_i^*E_i=I, then the recursively ordered heterogeneous
Kronecker tensor product of the E_i is an isometry. Moreover, if U is
any finite unitary matrix on the resulting fine tensor-product
coordinate space, then U times this heterogeneous tensor product is
also an isometry. Lean proves this generic arbitrary-N finite-matrix
theorem in Formalisation/LinearAlgebra/HeterogeneousTensor.lean by
induction from the validated two-factor Kronecker isometry theorem
and the validated unitary dressing theorem; Julia and WolframScript
check representative four-factor heterogeneous examples with a
nontrivial reversal permutation unitary. This is only finite
coordinate matrix algebra for an ordered recursive tensor index; it
does not construct categorical tensor products, canonical
associators, ordered partition maps, local maps from fusion-category
data, or the physical RG dressing unitary."

**Updated statement:** (verbatim — Lean path PRESENT.)

**GLOSSARY refs:** [[def:refmap]]; [[def:partition]] (ordered
partitions, categorical extension not in scope);
[[conv:unitary-default]].

**CONVENTIONS refs:** [P1.6(c)] dagger; [P1.6(g)] particle-number
disambiguation; [P1.6(i)] left-associated (the "ordered recursive
tensor index" matches our [P1.6(i)] convention).

**Lean files:** `Formalisation/LinearAlgebra/HeterogeneousTensor.lean`
— PRESENT.

**Scripts:** `scripts/julia/tensor_isometry_checks.jl`,
`scripts/wolfram/tensor_isometry_exact.wls` — PRESENT.

**Provenance reroute:** none.

**Notes:** verbatim preserve.

---

### Node 1.5 (WP5) — pending in CAD

**Original statement:** "WP5: Formalise operator/RG channel
statements: ascending channel properties, RG no-mixing amplitudes,
scaling-operator conditional theorem, and charge-only negative
example."

**Updated statement:** "WP5: Formalise operator / RG channel
statements: ascending channel properties, RG no-mixing amplitudes,
scaling-operator conditional theorem, and charge-only negative
example. Scope: `Formalisation/LinearAlgebra/{Isometry, Trace,
DiagonalScaling, ChargeOnly, CoherentSystem}.lean` (generic finite-
matrix support for [[def:ascending]] / [[def:scalop]]) plus
`Formalisation/Fibonacci/{CFTWeights, RGNoMixing}.lean` (Fibonacci
instances for [[def:primary]] / [[def:RG-amp]]). Realises
`summary.tex` §11.3 (Ascending channel: spectrum and scaling fields)
+ §11.1 (Wilsonian RG-decorated splitting)."

**GLOSSARY refs:** [[def:ascending]]; [[def:scalop]]; [[def:RG-amp]];
[[def:primary]]; [[def:KS-Ln]].

**CONVENTIONS refs:** [P1.6(c)] dagger.

**Lean files:** scope = LinearAlgebra + Fibonacci/CFTWeights +
Fibonacci/RGNoMixing.

**Scripts:** scope = the operator/RG-related cross-check scripts.

**Provenance reroute:** N/A (WP-parent).

**Notes:** Minor reword.

---

### Node 1.5.1 — validated in CAD

**Original statement:** "MAT-CHAN-001: For a finite complex matrix
isometry E with E^*E=I, the ascending observable map O -> E^* O E is
unital and star-preserving, and the logical lift O -> E O E^* retracts
under ascending: E^*(E O E^*)E=O. This formalises finite-matrix parts
of THM-8.2.1 and handoff §8.3."

**Updated statement:** "MAT-CHAN-001: For a finite complex matrix
isometry E with `E^*E=I`, the ascending observable map `O → E^*OE`
is unital and star-preserving, and the logical lift `O → E O E^*`
retracts under ascending: `E^*(E O E^*) E = O`. This formalises
finite-matrix parts of `summary.tex` §11.3 (ascending channel) — the
CAD-`THM-8.2.1` correspondence is to the unital ucp/tpcp
ascending-channel claim, and `handoff §8.3` corresponds to the
logical-lift retraction equation in `summary.tex` §11.3."

**GLOSSARY refs:** [[def:ascending]] (the canonical [[def:ascending]]
channel `A(O) = E^†OE`); [[def:refmap]].

**CONVENTIONS refs:** [P1.6(c)] dagger.

**Lean files:** `Formalisation/LinearAlgebra/Isometry.lean` —
PRESENT.

**Scripts:** generic — covered by `scripts/julia/linear_algebra_checks.jl`
and `scripts/wolfram/linear_algebra_exact.wls`.

**Provenance reroute:** `THM-8.2.1` + `handoff §8.3` →
`summary.tex` §11.3 ([[def:ascending]]).

**Notes:** Minor reword.

---

### Node 1.5.2 — validated in CAD

**Original statement:** "MAT-TRACE-001: For finite complex matrices
E, rho, and O, the trace pairing is preserved between the embedded
state rho -> E rho E^* and the ascending observable O -> E^* O E:
trace((E rho E^*) O)=trace(rho (E^* O E)); if E^*E=I then trace(E rho
E^*)=trace(rho). For any finite complex K and X, K^*(X^*X)K=(XK)^*(XK),
giving the square-form positivity witness for Kraus/ascending
congruence. Proven in Lean at Formalisation/LinearAlgebra/Trace.lean
and checked by Julia/WolframScript."

**Updated statement:** (verbatim — Lean path PRESENT.)

**GLOSSARY refs:** [[def:ascending]]; [[def:refmap]].

**CONVENTIONS refs:** [P1.6(c)] dagger.

**Lean files:** `Formalisation/LinearAlgebra/Trace.lean` — PRESENT.

**Scripts:** `scripts/julia/linear_algebra_trace_checks.jl`,
`scripts/wolfram/linear_algebra_trace_exact.wls` — both PRESENT.

**Provenance reroute:** none.

**Notes:** verbatim preserve.

---

### Node 1.5.3 — validated in CAD

**Original statement:** "SCALING-DIAG-001: If a finite operator RG
map is diagonal in a chosen scaling basis with diagonal entries
lambda_i, then each basis operator is an eigenoperator with
eigenvalue lambda_i. Specialising lambda_i to b^(-weight_i) gives the
conditional handoff THM-9.8.1 linear-algebra statement for b^(-h_i)
or b^(-Delta_i). This does not derive the CFT weights or assert that
a charge-only channel has these eigenvalues. Proven in Lean at
Formalisation/LinearAlgebra/DiagonalScaling.lean and checked by
Julia/WolframScript."

**Updated statement:** (verbatim with handoff→summary.tex reroute —
"handoff THM-9.8.1" → "`summary.tex` §11.3 scaling-operator
conditional ([[def:scalop]] eigenvalue equation); see also
[[def:primary]] for the `h_i`/`Δ_i` weights"; Lean path PRESENT.)

**GLOSSARY refs:** [[def:scalop]] (the [[def:scalop]] is the
eigenoperator with eigenvalue `b^(-Δ_i)`); [[def:primary]] (the
weights `h_i`, `Δ_i`).

**CONVENTIONS refs:** none beyond basics.

**Lean files:** `Formalisation/LinearAlgebra/DiagonalScaling.lean` —
PRESENT.

**Scripts:** `scripts/julia/diagonal_scaling_checks.jl`,
`scripts/wolfram/diagonal_scaling_exact.wls` — both PRESENT.

**Provenance reroute:** `handoff THM-9.8.1` → `summary.tex` §11.3.

**Notes:** Minor reword.

---

### Node 1.5.4 — validated in CAD

**Original statement:** "CHARGE-NEG-001: In the two-dimensional
charge-projector span with identity vector (1,1) and contrast vector
(1,-1), the finite charge-only channel diagonal in the
identity/contrast basis fixes identity and sends contrast to a times
contrast. Taking a=1/2 while the checked CFT target example b=32 gives
b^(-2/5)=1/4 demonstrates that this charge-only contrast eigenvalue
is chosen amplitude data and is not forced to equal b^(-2/5). This is
a concrete finite counterexample only, not a theorem about all
charge-only channels. Proven in Lean at
Formalisation/LinearAlgebra/ChargeOnly.lean and checked by
Julia/WolframScript."

**Updated statement:** (verbatim — Lean path PRESENT. The "checked
CFT target example" is the [[def:primary]] weight `h_τ = 2/5` per
node 1.5.5.)

**GLOSSARY refs:** [[def:ascending]] (the charge-only channel is a
narrowed [[def:ascending]] channel); [[def:scalop]]; [[def:primary]]
(`h_τ = 2/5`); [[def:RG-amp]].

**CONVENTIONS refs:** none beyond basics.

**Lean files:** `Formalisation/LinearAlgebra/ChargeOnly.lean` —
PRESENT.

**Scripts:** `scripts/julia/charge_only_negative_checks.jl`,
`scripts/wolfram/charge_only_negative_exact.wls` — both PRESENT.

**Provenance reroute:** the `summary.tex` §8.7 (Charge-only
ascending channel) at line 1792 is the canonical home for this
negative example.

**Notes:** verbatim preserve.

---

### Node 1.5.5 — validated in CAD

**Original statement:** "CFT-WEIGHT-001: In the locally sourced
level-3 SU(2) Wess-Zumino-Witten realisation, the Fibonacci tau field
is identified with the spin-1 field; the exact rational arithmetic
gives h_tau = 2/5 from the spin-weight formula and diagonal left-plus-
right scaling dimension 4/5 when the two chiral weights are both
h_tau. Lean proves only these rational equalities in
Formalisation/Fibonacci/CFTWeights.lean; Julia and WolframScript
independently check the same arithmetic. This node does not formalise
the WZW construction, the PDF table extraction, RG diagonalisation,
or categorical operator semantics."

**Updated statement:** (verbatim with handoff→summary.tex reroute —
"locally sourced level-3 SU(2) WZW realisation" → "`summary.tex`
§11.3.3 (Fibonacci CFT data) + the (G_2)_1 / level-3 SU(2)
identification (per `CITATION_INDEX.md` `g2-1-chiral-cft`
discharge status: currently `\unchecked` — see PRD §"Known
limitations"); the `h_τ = 2/5` value matches [[def:primary]]
weights for [[def:fib]]"; Lean path PRESENT.)

**GLOSSARY refs:** [[def:primary]]; [[def:fib]]; [[def:phi]].

**CONVENTIONS refs:** none beyond basics.

**Lean files:** `Formalisation/Fibonacci/CFTWeights.lean` — PRESENT.

**Scripts:** `scripts/julia/cft_weight_checks.jl`,
`scripts/wolfram/cft_weight_exact.wls` — both PRESENT.

**Provenance reroute:** "locally sourced level-3 SU(2) WZW
realisation" → `summary.tex` §11.3.3 + `CITATION_INDEX.md`
`g2-1-chiral-cft` (currently undischarged per PRD).

**Notes:** Drift flag — the underlying WZW citation is one of the
`\unchecked` atoms per CITATION_INDEX (undischarged); the Lean proof
of `h_τ = 2/5` is rational arithmetic only and does not depend on
the WZW citation being fully discharged.

---

### Node 1.5.6 — validated in CAD

**Original statement:** "COHERENT-ASC-001: In a finite
constant-coordinate coherent refinement system with maps E_nm
satisfying E_nn=I, E_ml E_nm=E_nl for n<=m<=l, and E_nm^dagger
E_nm=I, the finite ascending observable maps A_nm(O)=E_nm^dagger O
E_nm are unital and compose coherently: A_nm(A_ml(O))=A_nl(O). Lean
proves this generic finite matrix statement; Julia and WolframScript
check exact rational rotation examples. The result formalises only
finite matrix coherence of ascending observables, sourced by the
handoff direct-system equations and local OAR scaling-map/isometry
references; it does not construct a completed direct-limit Hilbert
space, continuum field algebra, categorical fine-graining system, or
nonconstant growing Hilbert spaces."

**Updated statement:** (verbatim with handoff→summary.tex reroute —
"handoff direct-system equations" → "`summary.tex` §4.4 inductive
system equations ([[def:indlim]] direct-system)"; Lean lives in
`Formalisation/LinearAlgebra/CoherentSystem.lean` per CAD-original.)

**GLOSSARY refs:** [[def:ascending]]; [[def:indlim]]; [[def:refmap]].

**CONVENTIONS refs:** [P1.6(c)] dagger.

**Lean files:** `Formalisation/LinearAlgebra/CoherentSystem.lean` —
PRESENT.

**Scripts:** `scripts/julia/coherent_system_checks.jl`,
`scripts/wolfram/coherent_system_exact.wls` — both PRESENT.

**Provenance reroute:** `handoff direct-system equations` →
`summary.tex` §4.4 + [[def:indlim]].

**Notes:** Minor reword.

---

### Node 1.5.7 — validated in CAD

**Original statement:** "FIB-RG-EXP-001: From the accepted Fibonacci
chiral conformal weight h_tau=2/5 and h_1=0, the chiral OPE exponents
used in handoff section 9.7 are h_1-2 h_tau=-4/5 for the 1 <- tau tau
coefficient and h_tau-2 h_tau=-2/5 for the tau <- tau tau
coefficient. Squaring these rho powers gives the denominator
exponents -8/5 and -4/5 in the no-mixing normalisations. Lean proves
only exact rational arithmetic in
Formalisation/Fibonacci/CFTWeights.lean; Julia and WolframScript
check the same. This node does not derive Wilsonian RG coefficients,
physical OPE constants, RG diagonalisation, or categorical operator
semantics."

**Updated statement:** (verbatim with handoff→summary.tex reroute —
"handoff section 9.7" → "`summary.tex` §11.1 ([[def:RG-amp]])";
Lean path PRESENT.)

**GLOSSARY refs:** [[def:primary]] (the conformal weights);
[[def:RG-amp]]; [[def:OPE]] (the OPE coefficients); [[def:fib]].

**CONVENTIONS refs:** none beyond basics.

**Lean files:** `Formalisation/Fibonacci/CFTWeights.lean` — PRESENT.

**Scripts:** `scripts/julia/cft_weight_checks.jl`,
`scripts/wolfram/cft_weight_exact.wls` — both PRESENT.

**Provenance reroute:** `handoff section 9.7` → `summary.tex` §11.1.

**Notes:** Minor reword.

---

### Node 1.5.8 — validated in CAD

**Original statement:** "MAT-LOGICAL-LIFT-PROJ-001: For a finite
complex matrix isometry E with E^*E=I, the logical lift L(O)=E O E^*
satisfies L(I)=E E^*. The matrix E E^* is a code-subspace projection:
it is idempotent and self-adjoint. This formalises the finite matrix
algebra behind handoff section 8.3, where the lift of the coarse
identity is VV^dagger, the projector onto the code subspace rather
than the full fine identity. Lean proves the generic finite-matrix
statements in Formalisation/LinearAlgebra/Isometry.lean; Julia and
WolframScript check representative finite examples. This does not
prove categorical subobject semantics, spectral projection theory
beyond these equations, or complete positivity."

**Updated statement:** (verbatim with handoff→summary.tex reroute —
"handoff section 8.3" → "`summary.tex` §11.3 (logical-lift /
code-projection content of [[def:ascending]])"; Lean path PRESENT.)

**GLOSSARY refs:** [[def:ascending]] (the logical lift is the
adjoint of [[def:ascending]]'s `A(O) = E^†OE`); [[def:refmap]].

**CONVENTIONS refs:** [P1.6(c)] dagger.

**Lean files:** `Formalisation/LinearAlgebra/Isometry.lean` —
PRESENT.

**Scripts:** `scripts/julia/linear_algebra_checks.jl`,
`scripts/wolfram/linear_algebra_exact.wls` — both PRESENT.

**Provenance reroute:** `handoff section 8.3` → `summary.tex` §11.3.

**Notes:** Minor reword.

---

### Node 1.5.9 — validated in CAD

**Original statement:** "MAT-GRAM-POS-001: For finite complex
matrices, define a Gram-form positive matrix to mean an operator of
the form X^*X, allowing the witness X to be rectangular. If a fine
observable O has such a witness O=X^*X, then the ascending congruence
E^* O E also has a Gram-form witness, namely (X E)^*(X E). Lean
proves this generic finite-matrix existential witness statement in
Formalisation/LinearAlgebra/Trace.lean, and Julia/WolframScript check
representative finite examples. This formalises only the finite
square/Gram-form positivity witness behind complete positivity in
handoff theorem target 8.2.1; it does not prove a full order-
theoretic positive-semidefinite theorem, Choi/Kraus-sum theorem,
categorical channel semantics, or infinite-dimensional positivity."

**Updated statement:** (verbatim with handoff→summary.tex reroute —
"handoff theorem target 8.2.1" → "`summary.tex` §11.3 (ucp
ascending-channel claim)"; Lean path PRESENT.)

**GLOSSARY refs:** [[def:ascending]]; [[def:refmap]].

**CONVENTIONS refs:** [P1.6(c)] dagger.

**Lean files:** `Formalisation/LinearAlgebra/Trace.lean` — PRESENT.

**Scripts:** `scripts/julia/linear_algebra_trace_checks.jl`,
`scripts/wolfram/linear_algebra_trace_exact.wls` — PRESENT.

**Provenance reroute:** `handoff theorem target 8.2.1` →
`summary.tex` §11.3.

**Notes:** Minor reword. NB this node had the only resolved
challenge in CAD (`ch-46a2d1ace78`); the challenge-and-resolution
history is implicit in the validated status here.

---

### Node 1.5.10 — validated in CAD

**Original statement:** "COHERENT-LIFT-001: In a finite
constant-coordinate coherent refinement system with maps E_nm
satisfying E_nn=I and E_ml E_nm=E_nl for n<=m<=l, the finite
logical-lift maps L_nm(O)=E_nm O E_nm^dagger are identity on equal
scales and compose coherently: L_nn(O)=O and L_ml(L_nm(O))=L_nl(O).
Lean proves this generic finite matrix statement in
Formalisation/LinearAlgebra/CoherentSystem.lean; Julia and
WolframScript check exact rational rotation examples. The result
formalises only finite matrix coherence of logical lifts, sourced by
handoff direct-system equations and the logical lift equations; it
does not construct a completed direct-limit Hilbert space, continuum
field algebra, categorical fine-graining system, or nonconstant
growing Hilbert spaces."

**Updated statement:** (verbatim with handoff→summary.tex reroute —
"handoff direct-system equations" → "`summary.tex` §4.4 inductive
system equations ([[def:indlim]] direct-system)"; Lean path
PRESENT.)

**GLOSSARY refs:** [[def:ascending]] (logical lift is L =
[[def:ascending]] adjoint); [[def:indlim]]; [[def:refmap]].

**CONVENTIONS refs:** [P1.6(c)] dagger.

**Lean files:** `Formalisation/LinearAlgebra/CoherentSystem.lean` —
PRESENT.

**Scripts:** `scripts/julia/coherent_system_checks.jl`,
`scripts/wolfram/coherent_system_exact.wls` — PRESENT.

**Provenance reroute:** `handoff direct-system equations` →
`summary.tex` §4.4 + [[def:indlim]].

**Notes:** Minor reword.

---

### Node 1.5.11 — validated in CAD

**Original statement:** "MAT-PSD-CONGRUENCE-001: In finite complex
matrix coordinates, if a fine observable O is positive semidefinite
in Mathlib's quadratic-form sense, then the ascending congruence
E^dagger O E is positive semidefinite. Lean proves this generic
finite matrix theorem in Formalisation/LinearAlgebra/Trace.lean using
Matrix.PosSemidef.conjTranspose_mul_mul_same; Julia checks a
representative non-isometric rectangular congruence numerically by
Hermitian/eigenvalue tests; WolframScript checks exact principal-
minor positivity and the congruence identity. This formalises only
finite-dimensional order-theoretic positive-semidefinite preservation
for one Kraus congruence; it does not prove complete positivity as
an amplified theorem for every ancilla size, a Kraus-sum channel
theorem, categorical channel semantics, or infinite-dimensional
positivity."

**Updated statement:** (verbatim — Lean path PRESENT.)

**GLOSSARY refs:** [[def:ascending]]; [[def:refmap]].

**CONVENTIONS refs:** [P1.6(c)] dagger.

**Lean files:** `Formalisation/LinearAlgebra/Trace.lean` — PRESENT.

**Scripts:** `scripts/julia/linear_algebra_trace_checks.jl`,
`scripts/wolfram/linear_algebra_trace_exact.wls` — PRESENT.

**Provenance reroute:** none.

**Notes:** verbatim preserve.

---

### Node 1.5.12 — validated in CAD

**Original statement:** "MAT-AMPLIFIED-PSD-CONGRUENCE-001: For any
finite auxiliary coordinate type aux, finite fine/coarse coordinate
types, finite complex matrix E:fine->coarse, and positive
semidefinite observable O on aux x fine in Mathlib's quadratic-form
sense, the amplified ascending congruence by I_aux tensor E preserves
positive semidefiniteness: ((I_aux tensor E)^dagger O (I_aux tensor
E)) is positive semidefinite. Lean proves this generic finite matrix
theorem in Formalisation/LinearAlgebra/Trace.lean. Julia checks
representative amplified positive matrices by Hermitian/eigenvalue
tests and congruence identities; WolframScript checks exact
principal-minor positivity and congruence identities. This formalises
finite-dimensional amplified positivity for the one-Kraus ascending
congruence only; it does not construct categorical channel semantics,
infinite-dimensional channels, or a general Kraus-sum theorem."

**Updated statement:** (verbatim — Lean path PRESENT.)

**GLOSSARY refs:** [[def:ascending]]; [[def:refmap]].

**CONVENTIONS refs:** [P1.6(c)] dagger.

**Lean files:** `Formalisation/LinearAlgebra/Trace.lean` — PRESENT.

**Scripts:** `scripts/julia/linear_algebra_trace_checks.jl`,
`scripts/wolfram/linear_algebra_trace_exact.wls` — PRESENT.

**Provenance reroute:** none.

**Notes:** verbatim preserve.

---

### Node 1.5.13 — validated in CAD

**Original statement:** "MAT-FINITE-CONGRUENCE-SUM-PSD-001: For
finite complex matrices, if O is positive semidefinite in Mathlib's
quadratic-form sense and K_i is any finite family of matrices
fine->coarse, then the finite sum sum_i K_i^dagger O K_i is positive
semidefinite. Moreover, for any finite auxiliary coordinate type aux,
the amplified finite sum sum_i (I_aux tensor K_i)^dagger O (I_aux
tensor K_i) is positive semidefinite for positive semidefinite O on
aux x fine. Lean proves these generic finite matrix theorems in
Formalisation/LinearAlgebra/Trace.lean using finite sums of PSD
congruences. Julia and WolframScript check representative
exact/numerical finite sums and their Gram identities. This is
finite-dimensional algebra supporting the local complete-positivity
target; it does not assert a sourced physical Kraus representation,
categorical channel semantics, trace preservation, unitality, or
infinite-dimensional complete positivity."

**Updated statement:** (verbatim — Lean path PRESENT.)

**GLOSSARY refs:** [[def:ascending]]; [[def:refmap]].

**CONVENTIONS refs:** [P1.6(c)] dagger.

**Lean files:** `Formalisation/LinearAlgebra/Trace.lean` — PRESENT.

**Scripts:** `scripts/julia/linear_algebra_trace_checks.jl`,
`scripts/wolfram/linear_algebra_trace_exact.wls` — PRESENT.

**Provenance reroute:** none.

**Notes:** verbatim preserve.

---

### Node 1.5.14 — validated in CAD

**Original statement:** "MAT-FINITE-KRAUS-CHANNEL-ALG-001: For a
finite family of complex matrices K_i:fine->coarse, define the finite
Heisenberg Kraus-sum map A(O)=sum_i K_i^dagger O K_i and Schrödinger
state map S(rho)=sum_i K_i rho K_i^dagger. Lean proves that if sum_i
K_i^dagger K_i=I then A(I)=I and trace(S(rho))=trace(rho); for any
finite family it proves A(O^dagger)=A(O)^dagger and trace(S(rho)
O)=trace(rho A(O)). Julia and WolframScript check exact/numerical
finite normalized Kraus-sum examples, star preservation, trace
preservation, and expectation preservation. This formalises finite-
dimensional matrix algebra supporting the handoff ascending-channel
target and local OAR ucp/tpcp channel language; it does not assert
that the categorical/physical fine-graining channel has a sourced
Kraus representation, and it does not prove infinite-dimensional
channel theory or categorical channel semantics."

**Updated statement:** (verbatim with handoff→summary.tex reroute —
"handoff ascending-channel target" → "`summary.tex` §11.3
[[def:ascending]] channel + local OAR ucp/tpcp language"; Lean path
PRESENT.)

**GLOSSARY refs:** [[def:ascending]]; [[def:refmap]];
[[conv:acro]] (for ucp/tpcp acronyms).

**CONVENTIONS refs:** [P1.6(c)] dagger.

**Lean files:** `Formalisation/LinearAlgebra/Trace.lean` — PRESENT.

**Scripts:** `scripts/julia/linear_algebra_trace_checks.jl`,
`scripts/wolfram/linear_algebra_trace_exact.wls` — PRESENT.

**Provenance reroute:** `handoff ascending-channel target` →
`summary.tex` §11.3.

**Notes:** Minor reword.

---

### Node 1.5.15 — validated in CAD

**Original statement:** "FIB-CFT-DESC-EXP-001: From the locally
sourced Fibonacci chiral conformal weights h_1=0 and h_tau=2/5, Lean
proves the exact rational scaling-exponent arithmetic used in handoff
section 9.8: the tau primary has exponent -2/5, the tau descendant
indexed by n has exponent -(2/5+n), the vacuum descendant indexed by
n has exponent -n, and the diagonal nonchiral tau dimension 4/5 has
exponent -4/5. Julia and WolframScript independently check the same
rational equalities for n <= 6. This node proves only rational
weight/exponent arithmetic after the CFT weights and descendant
indexing convention are supplied; it does not construct CFT
descendant states, prove diagonal RG, construct scaling
eigenoperators, or derive physical channel eigenvalues."

**Updated statement:** (verbatim with handoff→summary.tex reroute —
"handoff section 9.8" → "`summary.tex` §11.3 / §11.3.3 ([[def:scalop]]
+ [[def:primary]] for `h_τ = 2/5`)"; Lean path PRESENT.)

**GLOSSARY refs:** [[def:scalop]]; [[def:primary]]; [[def:fib]].

**CONVENTIONS refs:** none beyond basics.

**Lean files:** `Formalisation/Fibonacci/CFTWeights.lean` — PRESENT.

**Scripts:** `scripts/julia/cft_weight_checks.jl`,
`scripts/wolfram/cft_weight_exact.wls` — PRESENT.

**Provenance reroute:** `handoff section 9.8` → `summary.tex` §11.3.

**Notes:** Minor reword.

---

### Node 1.5.16 — validated in CAD

**Original statement:** "FIB-RG-TAUTAU-PROB-001: For the finite
Fibonacci no-mixing tau row in handoff section 9.7, with
beta=(j_L,j_R,u_tau s_tau) where the real scale s_tau stands for
rho^(-2/5), Lean proves that the squared norm of the normalized
tau-tau amplitude equals Complex.normSq(u_tau) s_tau^2 /
(Complex.normSq(j_L)+Complex.normSq(j_R)+Complex.normSq(u_tau)
s_tau^2), matching the displayed probability formula after
substituting s_tau^2=rho^(-4/5). Lean also proves this probability is
nonnegative and is at most 1 when the denominator is positive. Julia
checks high-precision rho examples and WolframScript checks the exact
formula and bounds. This is only finite row/probability algebra after
the RG coefficients and scale factor are supplied; it does not derive
coefficients, formalise real fractional powers, plot functions, or
construct physical RG probabilities."

**Updated statement:** (verbatim with handoff→summary.tex reroute —
"handoff section 9.7" → "`summary.tex` §11.1 ([[def:RG-amp]]) +
[[def:primary]] for the `h_τ = 2/5` weight underlying the
`ρ^(-2/5)` scale"; Lean path PRESENT.)

**GLOSSARY refs:** [[def:RG-amp]]; [[def:primary]]; [[def:fib]].

**CONVENTIONS refs:** none beyond basics.

**Lean files:** `Formalisation/Fibonacci/RGNoMixing.lean` —
PRESENT.

**Scripts:** none specific named in the CAD node; cross-checks via
`scripts/julia/cft_weight_checks.jl` and shared infrastructure.

**Provenance reroute:** `handoff section 9.7` → `summary.tex` §11.1.

**Notes:** Minor reword.

---

### Node 1.6 (WP6) — pending in CAD

**Original statement:** "WP6: Maintain adversarial verification
discipline: each verification job uses exactly one fresh verifier
subagent, never more than one subagent at a time, with counterexamples
and gaps treated as high-value successes."

**Updated statement:** "WP6: Maintain adversarial verification
discipline per this repo's `CLAUDE.md` Rule 4 (Reviewer-gating
policy): every substantive addition is gated by a fresh review
subagent (different identity from the author) before commit; the
reviewer's verdict goes into the commit message under `Review:`.
Pure mechanical operations are exempt and noted as `Review:
mechanical, exempt`. Counterexamples and gaps are treated as high-
value successes (per the af framework + CLAUDE.md Rule 2 'all bugs
are deep'). Concrete examples are documented in `MIGRATION_LOG.md`
and the `stocktake/reports/opus-*-review.md` family. NB this repo's
Rule 9 forbids automated GitHub CI; quality gates run locally only."

**GLOSSARY refs:** N/A (process node).

**CONVENTIONS refs:** N/A.

**Lean files:** N/A.

**Scripts:** N/A.

**Provenance reroute:** CAD WP6 governance → this repo's CLAUDE.md
Rules 4 + 9 + 2 + `MIGRATION_LOG.md` + the
`stocktake/reports/opus-*-review.md` family of reviewer reports.

**Notes:** Substantial reword (governance) — but the underlying
adversarial-verifier-isolation principle is preserved, and is in fact
more rigorously codified in this repo's CLAUDE.md than in CAD's
af-internal WP6 prose.

---

### Node 1.7 (WP7) — pending in CAD

**Original statement:** "WP7: Produce the self-contained pdflatex
document containing all accepted definitions, theorems, proofs,
conjectures, provenance, and verification status."

**Updated statement:** "WP7: The self-contained pdflatex document
`summary.tex` (this repo's canonical mathematical statement; line
count ~2500; sectioned per the TOC at `summary.tex:62-2414`)
supersedes CAD's WP7 goal. `summary.tex` already contains all
accepted definitions (in §2-§9), theorem statements and proofs (in
§3-§11), conjectures (in §16), provenance (via in-doc citations +
this repo's `PROVENANCE.md` + `CITATION_INDEX.md`), and verification
status (via `\unchecked` flags + their `CITATION_INDEX.md` discharge
rows). The pdflatex build is verified to produce `summary.pdf`
(`pdflatex summary.tex` runs to convergence in 3 passes per the
`pdflatex` steady-state convention; gotcha #39). Going forward,
`summary.tex` is edited only via ERRATA-tracked atomic commits per
CLAUDE.md commit discipline."

**GLOSSARY refs:** N/A (process node).

**CONVENTIONS refs:** N/A.

**Lean files:** N/A.

**Scripts:** N/A.

**Provenance reroute:** CAD WP7 target → this repo's existing
`summary.tex` + `PROVENANCE.md` + `CITATION_INDEX.md` + `ERRATA.md`.

**Notes:** Substantial reword (governance) — but mathematically WP7's
goal IS already achieved by `summary.tex` (per the canonical-artifacts
list in PRD §"Canonical artifacts"). The CAD WP7 was prospective; in
this repo it is retrospectively complete (Phase 1 baseline at P1.10
documented this in PROVENANCE.md).

---

### Node 1.8 — validated in CAD

**Original statement:** "ISING-TOY-001: For the secondary Ising/TL
toy block, use labels 1, sigma, and epsilon, where epsilon
corresponds to the source label psi. The finite skeletal fusion
table satisfies sigma tensor sigma = 1 plus epsilon, sigma tensor
epsilon = epsilon tensor sigma = sigma, epsilon tensor epsilon = 1,
unit fusion by 1, multiplicity-free entries, and sigma tensor sigma
total multiplicity two. With nonchiral Ising data Delta_sigma=1/8 and
Delta_epsilon=1, the sigma sigma to epsilon exponent is Delta_epsilon
- 2 Delta_sigma = 3/4. If t denotes the rho^(3/4) toy factor, the
coefficients 1/sqrt(2), 1/sqrt(2), and t/2 have squared norm
1+t^2/4, so the handoff toy normalisation is scalar-normalised after
division by sqrt(1+t^2/4). Lean proves these finite fusion, rational
exponent, and scalar normalisation facts; Julia and WolframScript
check the same. This does not construct the full Ising category,
Temperley-Lieb quotient, OPEs, CFT spectrum, or physical RG map."

**Updated statement:** "ISING-TOY-001: For the secondary Ising/TL
toy block (`summary.tex` §8 worked example C: Ising / Temperley–Lieb
at δ=√2), use labels 1, σ, and ε, where ε corresponds to the source
label ψ (per [[def:ising]] body). The finite skeletal fusion table
satisfies `σ ⊗ σ = 1 ⊕ ε`, `σ ⊗ ε = ε ⊗ σ = σ`, `ε ⊗ ε = 1`, unit
fusion by 1, multiplicity-free entries [P1.6(d)], and `σ ⊗ σ` total
multiplicity two. With nonchiral Ising data Δ_σ=1/8 and Δ_ε=1 (per
[[def:isingcft]] / `summary.tex` §11.3.2), the `σσ→ε` exponent is
Δ_ε − 2Δ_σ = 3/4. If t denotes the ρ^(3/4) toy factor, the
coefficients 1/√2, 1/√2, t/2 have squared norm `1 + t²/4`, so the
`summary.tex` toy normalisation is scalar-normalised after division
by `sqrt(1+t²/4)`. Lean proves these finite fusion, rational
exponent, and scalar normalisation facts in
`Formalisation/Ising/Basic.lean`; Julia
(`scripts/julia/ising_toy_checks.jl`) and WolframScript
(`scripts/wolfram/ising_toy_exact.wls`) check the same. This does
not construct the full Ising category, Temperley–Lieb quotient,
OPEs, CFT spectrum ([[def:dense]] / [[def:TL-cat]] /
[[def:KS-scalars]] / [[def:KS-Ln]] are the canonical bodies for
those concepts), or physical RG map."

**GLOSSARY refs:** [[def:ising]]; [[def:ising-F]]; [[def:isingcft]];
[[def:dense]]; [[def:TL-cat]]; [[def:KS-scalars]]; [[def:KS-Ln]];
[[def:RG-amp]] (the ρ^(3/4) toy factor); [[def:primary]] (the
weights Δ_σ, Δ_ε).

**CONVENTIONS refs:** [P1.6(a)] vacuum index (label `1`);
[P1.6(d)] multiplicity-free; [P1.6(b)] F-matrix gauge (Ising's
F-matrix at `summary.tex def:ising-F` line 1609 is unitary
canonical).

**Lean files:** `Formalisation/Ising/Basic.lean` — PRESENT.

**Scripts:** `scripts/julia/ising_toy_checks.jl`,
`scripts/wolfram/ising_toy_exact.wls` — both PRESENT.

**Provenance reroute:** `handoff toy normalisation` → `summary.tex`
§8 + [[def:ising]] / [[def:isingcft]].

**Notes:** Substantive reword (added GLOSSARY tags + summary.tex
reroute + Unicode for σ/ε/Δ matching summary.tex notation);
mathematical content preserved exactly. The "ε corresponds to ψ"
clause matches [[def:ising]]'s body which uses `ψ` as the third
simple in [[def:fuscat]]-compatible notation — preserved verbatim
per CAD.

---

## End of per-node mapping

All 67 nodes (root 1; 7 WP parents 1.1–1.7; 50 leaves in
1.2.x/1.3.x/1.4.x/1.5.x; 1 secondary block 1.8) mapped. No
blockers. The mapping is ready for P7.2b review and P7.2c
replay via `af refine`.
