# Worklog chunk 012 - 2026-07-06

## Pipeline consistency-layer scoping (no new shards) - 2026-07-06

### Context

Tobias commissioned the analytical phase: set up the consistency equations
between all pipeline definitions (UFC/MTC -> lattice models -> continuum
limit -> CFT).  Stages 1 (UFC -> BU algebra) and 2 (BU -> GNS) are pretty
clear; frontier 3 is discrete symmetries (action -> generators/kernels;
discrete Ward <=> Virasoro); frontier 4 — the real one — is the continuum
limit via refinement maps (general k->l, not just 1->2; everything rock
solid in isolation and composable).  Delegation to codex + Claude subagents
per standing instruction; TIB VPN available for acquisitions.

### What changed

- Scoping record: reviews/2026-07-06_pipeline_consistency_scoping/
  (ORCHESTRATION.md + PLAN.md).  PLAN.md is the deliverable: the synthesis
  (Part I) and a hostile-review-corrected action plan (Part II, Waves 0-3,
  decision points D1-D4).  No report shards, src/, or CONVENTIONS changes —
  execution starts on go-ahead.
- 11 sources acquired and registered (SHA256, e-print sources):
  references/lattice-symmetry/ 2026-07-06 addendum (HKV 1307.4104, CGS
  1604.06339, Milsted-Vidal 1706.01436, Read-Saleur cond-mat/0701259,
  Li-Lin-McGreevy-Shi-Kim 2403.18410) and the NEW topic
  references/refinement/ (Brothier-Stottmeister 1901.04940, Brothier
  forest-skein 2207.03100, Jones 1706.00515, Haegeman et al 1707.06243,
  Witteveen-Walter 2004.11952, Evenbly-White 1602.01166).

### Why these choices / key findings

- Four ill-posed seams found in the current pipeline: (S1) GNS descent of
  theta_L; (S2) no composition structure beyond 1->2; (S3) g_L and the
  categorical residual set R both undefined in the only written symmetry
  square; (S4) parity-even dilute KS cannot carry the parity-odd fusion
  vertex (fidelity tension).  Plus T1-T6 tensions incl. the fusion-tree vs
  occupied-subset basis ambiguity (missing endpoint-closing rule) and the
  CA-63-exact vs CA-64-relaxed regime gap.
- KEY LITERATURE FINDING: CA-68's V_L is exactly the seed R = Phi(Y) of a
  Jones forest functor (Brothier-Stottmeister); composability = exact
  functoriality for bare placements; general k->l lives in coloured
  forest-skein categories where >= 3 colours breaks Ore (group -> groupoid
  dichotomy).  Soft inductive systems are the fallback home for dressed maps.
- KEY DESIGN RESULT (two-model convergence, review-verified): the
  residual-free corner problem reduces to the scalar 1 - omega(P_L) — the
  GNS-descent lemma gives an isometric intertwiner unconditionally, with
  vacuum defect 1 - omega(P).  Residual part of S1 stays open.
- Filling arithmetic (review-verified): bare V_L halves filling;
  N-preserving dressings cap at 1/2; charge-preserving != N-preserving, so
  content creation (pair birth) belongs INSIDE the dressing — filling-flow
  equation with the target filling a free parameter (nu_* = 1/phi is a
  flat-trace heuristic only; t-J criticality sits at model-specific
  fillings).
- Symmetry stage: only free-fermion KS convergence is proved; GSJS
  central-term anomaly (c* != c) forces a two-constant closure everywhere;
  open TL -> U(Vir) but periodic JTL -> interchiral algebra (bigger than
  Vir x Vir) — so chiral/full + open/periodic is a substantive decision
  (D1), and Wave 1 is committed to the open-chain CONVENTIONS (r) default.
  No JW <-> null-vector operator theorem exists; our Gram-rank dictionary
  would be new.  Confirmed absent from the literature: dilute KS,
  variable-N symmetry generators, categorical-symmetry -> generator recipe.

### Frictions / dead ends

- Both independent designs made the same error: "charge-preserving dressing
  cannot fix the filling collapse" conflates fusion charge with occupation
  N.  Caught by the orchestrator, confirmed by the hostile reviewer.
- Hostile review blockers on the draft plan: a denied Wave-1 dependency on
  the open-vs-periodic decision, and one "shard" that was really 2-3 shards
  plus a Core-tier notation sweep.  Both fixed by unbundling (see PLAN.md).
- Kliesch-Koenig is stated for homogeneous binary trees over a single qudit
  tensor power — applicability to the charge-graded fusion carrier is NOT
  automatic; re-scoped as port-then-check (W2.4).
- kappa_tau = +1 / spherical structure still unsourced: every cup/birth
  result stays conditional until the A1 acquisition lands.
- The brief circulated to designers had two errors vs the files (birth-map
  parity; KS mode arguments) — the mapper caught both; files win.

### Acceptance

- make check-report-shards: 71 shards green (nothing touched).
- Hostile review (Opus) passed on the corrected plan's mathematics: descent
  lemma, bare functoriality, filling arithmetic, nu_* = 1/phi, two-constant
  closure all independently re-derived.
- All 11 SOURCES.md registrations spot-checked by the reviewer.

### Pointers

- reviews/2026-07-06_pipeline_consistency_scoping/{PLAN.md,ORCHESTRATION.md};
  references/refinement/SOURCES.md (new); references/lattice-symmetry/
  SOURCES.md (addendum).
- NOTE: the "CA-71 numerics" queued in worklog 011 are re-homed by the plan
  (JW rank decision -> W1.4/CA-74 proposal; t-J ED -> W2.2) — the label in
  chunk 011 no longer names a shard.
- Open: decision points D1-D4 (chiral/full + open/periodic; corner-route
  default; target filling; TIB 1992 dilute O(n)/IK acquisitions) and the
  Wave-0/Wave-1 go-ahead.
