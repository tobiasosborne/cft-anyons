# Worklog chunk 010 - 2026-05-31

## Qubit candidate Hamiltonian scan - 2026-05-31

### Context

Tobias asked for the qubit nearest-neighbour programme to move from equations
and SDP machinery to a broad scan over candidate Hamiltonians: sourced families
such as transverse Ising, XY, XXZ, and Heisenberg, plus synthetic grids beyond
those names.  The goal was to identify real candidates for lattice symmetry
construction and quickly rule out cases that fail necessary first-moment
Poincare conditions.

### What changed

- Spawned four read-only subagents for local-source provenance, scan API and
  schema design, algebraic pass/fail hypotheses, and report-shard planning.
  Their durable handoff is
  `reviews/2026-05-31_qubit_candidate_scan/ORCHESTRATION.md`, marked completed
  and closed.
- Added `src/QubitHamiltonianFamilies.jl`, with constructors for symmetric
  on-site fields, TFIM, XY, XXZ, Heisenberg, XYZ, Dzyaloshinskii-Moriya,
  compass, and deterministic generic dense qubit two-site densities.
- Added `src/QubitCandidateScan.jl`, with current, conservation-witness,
  boost-witness, optional fixed-h SDP, row-schema, terminal-gate, and summary
  helpers.
- Added `scripts/julia/qubit_candidate_scan.jl` and run bundle
  `runs/2026-05-31-qubit-candidate-scan/`, recording 99 scan inputs and their
  verdicts.
- Added CONVENTIONS.md (q), shards CA-53--CA-61, report includes/maps/catalog
  entries, and INDEX entries for the new code, script, run bundle, and review
  orchestration.
- Extended `test/runtests.jl` with a "qubit Hamiltonian candidate scan" testset
  that fixes the family-count, TFIM coefficient convention, XXZ/Heisenberg
  identity, source-kind labels, identity-shift invariance, and exact summary
  counts.

### Why these choices

- The run separates locally sourced physics families from synthetic scan inputs.
  TFIM/XY and XXZ/Heisenberg are tied to local source anchors; XYZ, DM,
  compass, and generic dense grids are explicitly labelled synthetic unless a
  later source is registered.
- The scan is deliberately sequential.  It first rejects zero-current cases,
  then cases with no conservation witness \(A=D u\), then cases with no
  nonzero-speed exact boost witness.  The fixed SDP is only meaningful after a
  fixed residual relation is chosen, so the broad run does not call Mosek when
  an earlier algebraic gate is terminal.
- The verdict language is route-specific.  `:excluded_no_boost_witness` means
  excluded from the current exact first-moment ansatz, not excluded from being
  a critical spin chain or from a Koo-Saleur/OAR scaling route.

### Frictions / dead ends

- The key stress test went against the naive expectation: the sourced
  self-dual TFIM density is currentful and has a conservation witness, but it
  fails the exact first-moment boost witness.  Since local sources record TFIM
  at criticality as an Ising-CFT scaling target, this is evidence that the
  exact first-moment gate is too strict, not evidence against TFIM.
- XXZ and isotropic Heisenberg also fail the exact boost witness in this scan,
  despite the local XXZ source describing the gapless \(|\Delta|\le 1\) regime.
  These models now belong in a scaling/compressed-generator queue rather than
  in the exact route.
- No candidate reached a nontrivial exact boost residual, so the optional SDP
  layer has no honest broad-scan survivor to test yet.  A joint optimization
  over \(u,w,v^2\) and moments would be a lifted polynomial hierarchy, not the
  fixed-h SDP currently implemented.

### Acceptance

- `julia --project=. scripts/julia/qubit_candidate_scan.jl` generated the run
  bundle and reported 99 samples, with 9 current-collapse exclusions, 27
  conservation-witness exclusions, and 63 boost-witness exclusions.
- The generated `inputs.toml`, `summary.toml`, and `results.toml` parse with
  Julia's TOML parser.
- `julia --project=. -e 'using Pkg; Pkg.test()'` passed; the new candidate
  scan testset reported 22 passes.
- `make check-report-shards` passed with 62 included shards.
- `make report` rebuilt `report.pdf` successfully at 135 pages.
- `make ci-before-push` passed after the worklog and index updates.

### Pointers

- Shards: CA-53, CA-54, CA-55, CA-56, CA-57, CA-58, CA-59, CA-60, CA-61.
- Convention: CONVENTIONS.md (q).
- Code/tests: `src/QubitHamiltonianFamilies.jl`, `src/QubitCandidateScan.jl`,
  `src/CftAnyons.jl`, `test/runtests.jl` testset
  "qubit Hamiltonian candidate scan".
- Script/run: `scripts/julia/qubit_candidate_scan.jl`,
  `runs/2026-05-31-qubit-candidate-scan/`.
- Review orchestration:
  `reviews/2026-05-31_qubit_candidate_scan/ORCHESTRATION.md`.
