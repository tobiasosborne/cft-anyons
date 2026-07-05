# Worklog chunk 011 - 2026-07-05

## Categorical Borchers-Uhlmann pipeline block (CA-62--CA-68) - 2026-07-05

### Context

Tobias refined the north star: a recipe, as functorial as possible, taking an
MTC to a family of lattice models whose continuum limit realises a chiral/full
CFT with defects/excitations given by the input category.  Key
reinterpretation: the CA-02/CA-03 indefinite-particle Fock construction is an
observable *-algebra (Borchers-Uhlmann style); lattice models emerge only
after a reference state, approximate discrete Virasoro relations, and the GNS
null-ideal quotient.  Second commissioning same day: refinement maps (local,
isometric, Virasoro-compatible) as the key to the continuum limit, exploiting
indefinite anyon number where dense chains obstruct refinement.

### What changed

- Shards CA-62 (pipeline vision), CA-63 (state-existence compactness theorem),
  CA-64 (relaxed symmetry gates), CA-65/CA-66 (anyonic word algebra and
  variable-N Fock as GNS data), CA-67 (refinement requirements/obstructions),
  CA-68 (vacuum-insertion refinement family).  Report now 69 shards, 156 pp.
- CONVENTIONS: (b) F-gauge FIXED to the unitary/Trebst gauge; (a) index level
  FIXED (unit first, 1-based); new (r) anyonic site object / word algebra /
  raw-cup / FS-flag conventions.
- Sources: 15 papers acquired and registered with SHA256s (Jones no-go,
  Zini-Wang, Aasen-Fendley-Mong I+II, Fewster-Rejzner AQFT, three
  Osborne-Stottmeister/Stiegemann OAR papers, Kliesch-Koenig, Koenig-Bilgin,
  Pfeifer et al., Ayeni et al., three dilute-TL papers).  Bubble-algebra
  authorship corrected to Grimm-Martin.
- Julia: src/QubitMomentStateWitnesses.jl (CA-63 witnesses),
  src/QubitRelaxedGates.jl + src/QubitResidualSDP.jl + src/QubitRelaxedScan.jl
  + scripts/julia/qubit_relaxed_scan.jl (CA-64, see the dedicated entry below),
  src/AnyonicWordAlgebra.jl (CA-65--CA-68 Fibonacci checks).  Suite grew to
  818 assertions, green.
- Run bundle runs/2026-07-05-qubit-relaxed-scan/: relaxed verdicts for the
  99-point grid; critical TFIM/XXZ/Heisenberg move from terminal exclusion to
  queued_gns_scaling; onsite/classical-ZZ stay current-collapsed.
- Orchestration record reviews/2026-07-05_bu_pipeline/ORCHESTRATION.md.

### Why these choices

- CA-63 flips the CA-44 hierarchy from exclusion-only to an exact alternative:
  every full-window level feasible iff a translation-invariant reference state
  exists with pi_omega(R)=0 (partial-trace extension + nested weak-* compact
  sets).  This makes "choose a reference state" well-posed.
- CA-64 quantifies "approximate Virasoro": gauge-invariant residual profiles
  in witness support, and the fixed-residual GNS-norm SDP objective; joint
  witness+moment optimization is bilinear (not an SDP), so certified lower
  bounds keep witnesses fixed.
- CA-65/CA-66 came from a two-model design competition (GPT-5.5 via codex +
  Opus) that converged on all load-bearing choices: pair (C,O) with maybe
  object O = 1 (+) X; A(I)=End(O^{tensor L}) AF tower (Bratteli = fusion graph
  of O); free tensor pre-layer with kinematic fusion ideal; fusion is never
  deferred to the state; tube/double-triangle algebra is the defect layer.
- CA-67/CA-68: for c != 0 there is no exact-implementer formulation of
  Virasoro compatibility (sourced), so the target is asymptotic Koo-Saleur
  intertwining of normal-ordered generators in a soft inductive system; the
  vacuum-insertion isometry is the exact baseline (charge-preserving, local,
  corner not unital), with dressing W_L = U_L V_L as the RG proposal.

### Frictions / dead ends

- Critical TFIM failing the exact boost gate (CA-60) is what forced the
  relaxation language; the relaxed re-scan restores it to the queue, with the
  recorded oddity that the optimizing speed is v^2 = -2 (sign open).
- The archived project's number-changing isometry V0+V2 (deficit filled by
  pair creation) is exactly the variable-N refinement hint, but it is dead
  code: unexported, fragile near Gram singularities, never reconciled, never
  connected to Virasoro.  Recorded in CA-68 as a re-derivation target only.
- Naive adjacent-fine-site birth covariance under vacuum insertion is FALSE;
  the correct statement is the stretched covariance with the middle fine site
  pinned to vacuum (mutation-tested).
- A phase-dropping mutation initially survived the CA-63 witness tests (PSD
  booleans were blind to it); the testset was strengthened with complex-entry
  assertions until the mutation went RED.
- Standard-fact source gaps deliberately left open: Banach-Alaoglu state-space
  compactness and product-trace conditional expectations (CA-63); "unitary UFC
  implies canonical spherical" and kappa_tau = +1 (CA-65/CA-66).

### Acceptance

- make check-report-shards: 69 shards included, labeled, cataloged, <= 280.
- make report: report.pdf builds, 156 pages, no LaTeX errors.
- Pkg.test(): 818 assertions green (new: compactness witnesses; relaxed
  profiles/scan/SDP; Fibonacci word algebra + vacuum insertion, incl. the
  L=0..6 dimension tables and exact 13x2 / 21x3 insertion isometries).
- Relaxed re-scan reproduces exact counts 9/27/63 and the recorded TFIM boost
  residual 1.8257418583505538 at support 3 (<= 1e-12), matching independent
  GPT-5.5 design computations at all four supports.

### Pointers

- Shards CA-62--CA-68; CONVENTIONS (a), (b), (r); INDEX (new script/run/review
  rows); reviews/2026-07-05_bu_pipeline/ORCHESTRATION.md;
  runs/2026-07-05-qubit-relaxed-scan/.
- Open queue: dilute-TL Koo-Saleur construction (no literature exists — prime
  target); Kliesch-Koenig necessary-condition check for the vacuum-insertion
  family; closed-form existence for the pair-creation deficit repair; unital
  or soft-CP completion of the corner map; kappa_tau and spherical-structure
  source acquisitions; variable-h SDP lift convention.

## Qubit relaxed symmetry gates (CA-64) - 2026-07-05

### Context

CA-64 (report/sections/64_qubit_relaxed_symmetry_gates.tex) called for replacing
the exact first-moment witness gates of CA-57 by quantified residual *profiles*:
tracial Pauli-coefficient distances from the conservation density
`A = i[h_j+h_{j+1}, p_j]` and the boost density
`B = i[p_j,h_{j+1}] + 2i[p_j,h_{j+2}]` to the image of the one-dimensional
coboundary map, as a function of witness support L, plus a fixed-residual
GNS-norm SDP objective tier. This session implemented and reproduced the design
numbers.

### What changed

- `src/QubitRelaxedGates.jl`: tracial norm, trailing-identity embedding
  `iota`, `coboundary_matrix`, and the three profile solvers
  (`solve_conservation_profile`, `solve_boost_profile` with free/fixed/bounded
  speed, `solve_joint_poincare_profile`). Equality-constrained least squares via
  a robust nullspace method (KKT is singular from gauge nullspaces).
- `src/QubitResidualSDP.jl`: fixed-residual GNS-norm SDP objective
  `v_N(R) = min_y omega_y(R*R)`, normalized `nu_N = v_N/tau(R*R)`. Reuses the
  CA-43 moment machinery; augments the moment-word set with the R*R words and
  adds box bounds `|y_s| <= 1` (valid: Pauli words have unit operator norm).
  Witness optimization (`method = :alternating/:sos`) is a hard error (bilinear,
  not an SDP).
- `src/QubitRelaxedScan.jl`: separate relaxed result type + verdicts
  (`:queued_gns_scaling`, `:excluded_current_collapsed`,
  `:excluded/queued_conservation_profile`, `:excluded_boost_profile`,
  `:not_excluded_algebraic`) and TOML row serialization. Kept distinct from the
  exact-scan schema.
- `scripts/julia/qubit_relaxed_scan.jl` + `runs/2026-07-05-qubit-relaxed-scan/`:
  reproduces the exact 9/27/63 counts, relaxed profiles for all 99 points to
  L=4 (support-5 SVDs across the grid are too slow), sentinel subset to L=5,
  and the SDP tier for the five sentinels. Headline: 9 current-collapsed,
  27 queued_conservation_profile, 63 queued_gns_scaling.
- `test/runtests.jl`: three new testsets (51 checks) pinning the design numbers,
  gauge-invariance, nonincreasing profiles, and the SDP objective invariants.

### Why these choices

- Both the conservation witness u and boost coboundary witness w carry support L;
  the ambient window is `max(4, L+1)` for boost. This indexing makes the recorded
  CA-57 residual 1.8257418583505538 fall exactly at boost support L=3.
- Speed `lambda = v^2` is a free linear variable by default (recovers the design
  optimizer `lambda = -2` exactly and the recorded residual); a bounded scan is
  available. `mu = lambda e` is the linear scalar variable.
- Profile code lives in new files near 200 lines rather than mutating the exact
  scan; the relaxed scan is a separate schema.

### Frictions / dead ends

- The KKT normal-equation form of the equality-constrained LS is singular
  (gauge/coboundary nullspaces), so switched to `pinv` + `nullspace`.
- Gauge-invariance test initially compared two ~1e-16 residuals with `≈`, which
  fails near zero; fixed with an explicit `atol`.
- First full-grid run at max_support=5 exceeded a 15-minute budget (support-5
  pinv/nullspace SVDs are 4096x2048); split into broad grid at L<=4 plus
  sentinels at L=5.
- First SDP-tier run returned `solver_unknown`: R*R spans up to 7 sites, so its
  moments lie outside the level-2 PSD window and the objective was unbounded
  below (dual infeasible). Fixed by the box bounds `|y_s| <= 1`; the level-2
  lower bounds for the currentful sentinels are negative (no exclusion), the
  current-collapsed sentinels give 0.
- `solve_boost_profile` initially returned a meaningless number when the
  conservation constraint was infeasible at the requested support; now a loud
  error (eps_b^0 is defined only where eps_c(L)=0).

### Acceptance (checks passed)

- Design numbers reproduced to ~1e-15: `eps_c(1)=sqrt(10)`, `eps_c(L>=2)~0`;
  boost profile L=2..5 = `sqrt(6), 1.8257418583505538, 1.5275252316519468,
  1.3416407864998736`, all with `speed2 = -2`.
- Mutation-proof: flipping the coboundary sign in
  `one_dimensional_coboundary_coefficients` drives `eps_c(2)` from ~0 to 3.16 and
  boost(L=2) from `sqrt(6)` to 3.14 (RED); restored.
- SDP tier: zero residual -> objective 0; identity residual -> normalized 1;
  Mosek instance solves.
- Full `Pkg.test()` green.

### Pointers

- Shards: CA-64. Files: `src/QubitRelaxedGates.jl`, `src/QubitResidualSDP.jl`,
  `src/QubitRelaxedScan.jl`, `scripts/julia/qubit_relaxed_scan.jl`,
  `runs/2026-07-05-qubit-relaxed-scan/`.
- Source of record for the recorded boost residual:
  `runs/2026-05-31-qubit-candidate-scan/summary.toml:76`.
