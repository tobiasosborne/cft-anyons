# Orchestration record — pipeline consistency-layer scoping (2026-07-06)

Orchestrator: Claude (Fable 5) main session.  Commission (Tobias): analytical
phase — set up the consistency equations between all pipeline definitions
(UFC/MTC -> lattice models -> continuum limit -> CFT); stages 1-2 clear,
frontier (3) = discrete symmetries (action -> generators/kernels, discrete
Ward <=> Virasoro), frontier (4) = continuum limit / refinement maps (general
k->l, composability).  Instruction: delegate liberally to codex and
sonnet/opus subagents.  Status: scoping COMPLETE; execution plan in PLAN.md
(this directory), awaiting go-ahead.

## Fan-out (5 parallel workers + 1 hostile reviewer)

1. **Internal consistency mapper (Opus, read-only).**  Mapped every
   definition/equation across CA-62..CA-70 + the qubit necessary-equation
   shards.  Verdict: pipeline well-defined up to the corner refinement at
   finite L; ill-posed at four seams — (S1) GNS descent of theta_L, (S2) no
   V-semigroup / general k->l, (S3) g_L and the categorical residual set R
   both undefined, (S4) parity-even dilute KS vs parity-odd fusion vertex
   (fidelity).  Six internal tensions (T1-T6) and a notation-collision
   ledger (V/J/P/tau/e/v).  Also caught: CA-63 is proved for the qubit UHF
   algebra, not the categorical AF tower; brief's birth-map parity claim
   wrong (b^a is parity-preserving, Delta N = +-2; the parity-violator is
   the tau -> tau tau vertex).

2. **Discrete-symmetry literature (Opus, TIB/web).**  5 sources registered
   in references/lattice-symmetry/ (HKV 1307.4104 merged lattice-Virasoro;
   CGS 1604.06339 discrete stress tensor; Milsted-Vidal 1706.01436;
   Read-Saleur cond-mat/0701259; Li-Lin-McGreevy-Shi-Kim 2403.18410).
   Headlines: only free-fermion KS convergence is proved (OS); HKV give
   EXACT lattice Virasoro in Gaussian/free settings; GSJS central-term
   anomaly (c* != c) forces a two-constant closure; open TL -> U(Vir) but
   periodic JTL -> interchiral algebra (bigger than Vir x Vir); no explicit
   JW <-> null-vector operator theorem exists.  Confirmed absent: dilute
   KS, variable-N symmetry generators, categorical-symmetry -> generator
   recipe, general Ward <=> Virasoro equivalence.

3. **Refinement-map literature (Opus, TIB/web).**  New topic dir
   references/refinement/ with 6 sources (Brothier-Stottmeister 1901.04940;
   Brothier forest-skein 2207.03100; Jones 1706.00515; Haegeman et al
   1707.06243; Witteveen-Walter 2004.11952; Evenbly-White 1602.01166).
   Headline: CA-68's V_L is exactly the seed R = Phi(Y) of a Jones forest
   functor — composability is functoriality; general k->l lives in coloured
   forest-skein categories, where >= 3 colours breaks Ore (group ->
   groupoid); soft inductive systems / divisibility-directed limits are the
   fallbacks; all proved wavelet/OAR continuum results are ratio-2 and
   free/Gaussian; the Kliesch-Koenig necessary condition has never been run
   for an anyonic seed.

4. **Framework design A (Opus)** and **5. Framework design B (GPT-5.5 via
   codex exec, xhigh)** — independent designs of the full consistency layer
   (Rule-12 two-model competition).  CONVERGED on: placement/forest
   indexing with exact bare functoriality + asymptotic dressed cocycle;
   corner-vs-unital menu (corner-state route vs unital CP completion with
   multiplicativity defect ~ omega(1-P)); cell-shift-only translation
   compatibility; filling collapse nu -> nu/2 and the golden target
   nu_* = 1/phi; Ward recipe (coboundary calculus -> KS modes -> Virasoro
   residuals -> nu_N SDP shadows + central estimator); kernel dictionary
   via GNS/Gram-rank data (parity = superselection, not a null vector);
   cofinal independence via common refinements; KK as a finite gate.
   Unique: Opus derived the GNS-descent lemma (isometric intertwiner;
   vacuum defect = 1 - omega(P)); codex stated the BU-level refinement
   square and the tube-algebra covariance + fusion-fidelity shadow.
   Orchestrator correction to both: charge-preserving != N-preserving —
   pair creation lives inside the dressing, so content creation is a
   dressing property (filling-flow equation), not a new map class.

6. **Hostile review (Opus)** of the draft plan.  Verified the load-bearing
   mathematics independently (descent lemma, functoriality, filling
   arithmetic, nu_* = 1/phi, two-constant closure — all correct).
   Blockers: (B1) draft denied a Wave-1 dependency on the open-vs-periodic
   decision while W1.3 needed it — fixed by committing Wave 1 to the
   CONVENTIONS (r) open-chain default and deferring periodic/interchiral
   behind D1; (B2) draft CA-73 bundled 2-3 shards + a Core-tier notation
   sweep — unbundled (C1 conventions batch; sweep moved to Wave 3 opt-in).
   Majors incorporated: descent lemma is residual-free only (S1 not
   resolved); JW rank decision split from the T1-blocked Gram-rank work
   (T1 pulled into Wave 1); KK check re-scoped port-then-check (theorem is
   for homogeneous binary trees over a qudit, transfer not automatic);
   kappa_tau/spherical gap flagged on every cup/birth item (A1 acquisition
   scheduled); W2.1 filling target parameterized, not hard-coded to 1/phi.

## Deliverables

- reviews/2026-07-06_pipeline_consistency_scoping/PLAN.md — the corrected
  synthesis + action plan (Waves 0-3, decision points D1-D4).
- 11 registered sources: references/lattice-symmetry/SOURCES.md (2026-07-06
  addendum, 5 dirs) and references/refinement/ (new topic, 6 dirs).
- worklog/012_2026-07-06_pipeline_consistency_scoping.md.
- No report shards, no src/ changes, no conventions changes in this block —
  scoping only; execution starts on go-ahead.

## Boundaries recorded

- No continuum theorem claimed anywhere; all convergence statements remain
  conjecture targets in the CA-67/CA-68 sense.
- nu_* = 1/phi is a flat-trace/dimension heuristic, not a sourced critical
  filling.
- The exact Kliesch-Koenig condition is to be transcribed from ms.tex at
  shard-writing time (never from memory), and its applicability to the
  fusion carrier established before the check is run.
- kappa_tau = +1 and the canonical spherical structure remain unsourced
  (CONVENTIONS (r) flag); every cup/birth-based result is conditional until
  A1 lands.
