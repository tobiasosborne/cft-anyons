# Worklog chunk 012 - 2026-07-06

## W1.2: GNS descent and corner calculus, CA-72 (2026-07-06)

### Context

Continuation of the consistency-layer plan on Tobias's go-ahead: W1.2 per
reviews/2026-07-06_pipeline_consistency_scoping/PLAN.md.  Goal: settle the
residual-free part of seam S1 (GNS descent of the corner refinement) and
give the corner-vs-unital problem its exact finite calculus.

### What changed

- Shard CA-72-GNS-DESCENT-CORNER-CALCULUS (73 shards, 167 pp).  Main
  results, all finite-L derivations: (72.3) every placement refinement
  descends unconditionally to an isometric GNS intertwiner, vacuum defect
  EXACTLY 2(1-sqrt(omega_l(P_phi))); (72.7) the unital CP completion
  Phi_chi(T) = theta(T) + chi(T)(1-P) has multiplicativity defect
  IDENTICALLY (chi(ST)-chi(S)chi(T))(1-P) — an equality, not the bound the
  scoping designs proposed (cross terms vanish via theta(S)(1-P)=0) — so
  soft-C*-structure (verified anchor: 2306.16063.md:568-575, Def 33 eq 29)
  holds iff omega_l(1-P) -> 0; (72.4) residual-descent criterion + the
  descent-compatibility contract for W1.3; (72.5) Gram-domination variant
  for independent state families; (72.6) pullback through the completion is
  the convex mixture omega(P) omega_k + (1-omega(P)) chi; BU-level square
  recorded as a W1.5-blocked contract.
- src/GnsCornerCalculus.jl (280 lines: block states, corner weights,
  normalized pullbacks, explicit finite GNS data, descent intertwiner,
  unital completion) + testset "gns descent and corner calculus (CA-72)":
  40 assertions, suite 885 -> 925 green.  Exact rational pin: corner weight
  5/34 for the carrier-trace state on A_4 under dyadic placement.

### Why these choices / findings

- The single scalar 1 - omega_l(P_phi) now provably governs BOTH the
  vacuum-pointedness of the GNS descent and the exact softness modulus of
  the unital completion — the corner-vs-unital problem is one number.
- Chi is recorded as a non-canonical choice; no canonical completion is
  proposed.  Translation invariance of pullbacks is explicitly NOT claimed
  beyond the cell-shift subgroup of CONVENTIONS (t).

### Frictions / dead ends

- The orchestrator's Julia spec pinned a WRONG rational (1/122) from a
  botched trace-state normalization (weights m_c^2/610 with an arithmetic
  slip on top; and Tr/dim_A is not even a BlockState).  The implementing
  subagent investigated instead of fudging, derived the correct carrier-
  trace value 5/34, and verified it in code.  The shard text was corrected
  to match before commit.  Lesson: pinned values in specs are hypotheses,
  not oracles — the repo's "if they disagree investigate" instruction did
  its job.
- Concurrency lesson from the CA-71 incident applied: no git operation
  until the subagent confirmed completion ("tree final, no mutations
  applied"), mutation sites re-grepped, and the full suite re-run by the
  orchestrator before add/commit.

### Acceptance

- make check-report-shards: 73 shards green.  make report: 167 pp, no
  errors.  Pkg.test(): 925 assertions green (orchestrator re-run after
  agent completion).  Mutations: dropped J-normalization (36/4/0 — defect
  and isometry RED, intertwining survives as predicted, scale-independent),
  P for 1-P in the completion (31/9/0 — unitality and defect RED),
  V'V for VV' (loud DimensionMismatch abort) — each reverted; record at
  the head of the testset.

### Pointers

- Shard CA-72; src/GnsCornerCalculus.jl; test/runtests.jl testset CA-72;
  PLAN item W1.2 done.  Interfaces exported: residual descent-compatibility
  contract (to W1.3), BU-level square (to W1.5), dressed-exact-corner
  question (to W2.1).
- Next per plan: W1.3 (CA-73 categorical residual set, open chain).

## Wave 0 + W1.1: conventions, kappa_tau closure, CA-71 (2026-07-06)

### Context

Tobias green-lit the scoping plan (entry below).  This block executes Wave 0
(A1 source acquisition, C1 conventions batch) and W1.1 (shard CA-71, the
refinement placement category), per
reviews/2026-07-06_pipeline_consistency_scoping/PLAN.md.

### What changed

- CONVENTIONS (s): KS scale ledger — g_L registered as symbol-only (flow is
  OPEN), two-constant closure (c_L, c*_L) with the verified GSJS anchor
  (Linnea11.5.tex:3193-3196), and the lambda-vs-v_L disambiguation resolving
  tension T5 at the convention level.
- CONVENTIONS (t): refinement placements; cross-scale positions go through
  whole-cell shifts only; the CA-68 dyadic offset recorded as a choice.
- CONVENTIONS (r): BOTH source gaps closed (A1).  kappa_tau = +1 sourced via
  the newly registered Rowell-Stong-Wang 0712.1377
  (references/category-theory/, new topic dir): direct statement at
  RSWfinal3.tex:2349-2350 plus the ribbon computation nu_tau =
  R^{tautau}_1 theta_tau = +1; ribbon-vs-zigzag caveat recorded in the new
  SOURCES.md.  Canonical spherical + positive dims were already local
  (Penneys :1015-1019, ENO :1701-1706).  Cup/birth items are now
  unconditional; the raw cup-cap = d_a bookkeeping carries no sign.
- Shard CA-71-REFINEMENT-PLACEMENT-CATEGORY (72 shards, 163 pp): placements
  as order-preserving injections, V_phi isometry + charge preservation,
  EXACT composition theorem V_psi V_phi = V_{psi.phi} (unit-label F-moves
  trivial per (b)), corner maps closed under composition (seam S2 closed at
  finite level; dyadic 1->2->4 = j->4j-3), cellwise refinement + cell-shift
  lemma, the forest-functor reading (vacuum caret = Jones seed R, verified
  Brothier-Stottmeister anchors), Ore dichotomy + fallback homes.
- src/RefinementPlacements.jl (+ CftAnyons.jl include) and testset
  "refinement placement category (CA-71)": validator, compose, fine-path
  duplication, CA-68 bridge (== vacuum_insertion_matrix at L=1..3),
  exhaustive isometry sweep (all 56 placements k<=3, l<=5), exhaustive
  functoriality sweep (665 composable pairs) + named dyadic chain,
  occupation covariance, pinned Fibonacci dimensions.  Sweeps are
  aggregated into violation-collector assertions with pinned sweep
  cardinalities (a per-iteration variant first ran green at 2050
  assertions); 67 new assertions, suite 818 -> 885.

### Why these choices

- Wave-1 open-chain commitment and the (s)/(t) entries implement the hostile
  review's B1/B2 fixes; the placement category instantiates the
  scoping's forest-functor finding at the smallest honest scope (bare maps
  only, no dressing, no state, no continuum claim).

### Frictions / dead ends

- CONCURRENT-WRITE INCIDENT (root-caused, fixed in the follow-up commit):
  the orchestrator verified the suite green and committed e2ea75b while the
  Julia subagent was still mid-mutation-testing in the same tree.  The
  commit snapshotted src/RefinementPlacements.jl WITH mutation (c) applied
  (occupied set not relocated, line 106) — HEAD was RED for one commit even
  though the pre-commit verification run had passed (it loaded the
  pre-mutation source).  The subagent's completion report flagged it; the
  next commit reverts the mutation and carries the finalized mutation-record
  comments.  Lesson recorded: never commit while a subagent that edits
  src/ is live; re-diff the tree at git-add time, not at test time.
- CONVENTIONS.md edit collision between the orchestrator's own shell append
  and a later Edit call (re-read required; no content lost).

### Acceptance

- make check-report-shards: 72 shards green.  make report: 163 pp, no
  errors, CA-71 in TOC.  Pkg.test() on the corrected tree: 885 assertions
  green (67 new); three mutations (compose off-by-one, vacuum slot
  advancing the running charge, unmapped occupied set) each confirmed RED
  with recorded failure profiles and reverted (record at the head of the
  testset).

### Pointers

- Shard CA-71; CONVENTIONS (r)(s)(t); src/RefinementPlacements.jl;
  references/category-theory/ (new); PLAN.md items A1, C1, W1.1 done.
- Next per plan: W1.2 (CA-72 GNS descent + corner calculus), then W1.3
  (categorical residual set).

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
