# Orchestration -- qubit candidate scan

Date: 2026-05-31.

Purpose: build a reproducible Julia scan layer for sourced and synthetic nearest-neighbour qubit Hamiltonian families, feeding the fixed-h algebraic gates and moment-SDP exclusions from CA-46--CA-52.

## Parent scope

The parent owns all repository edits, final checks, and push. Subagents are read-only unless this file is updated otherwise. Subagent findings must be checked against current files, local sources, tests, or run artifacts before landing.

## Subagents

| ID | Nickname | Scope | Status |
|---|---|---|---|
| `019e7df6-287d-79f2-9566-fc6c7987ae74` | Galileo | Local provenance anchors for spin-chain families and criticality claims. | completed and closed |
| `019e7df6-3b26-70e1-b72e-99629e366e8e` | Russell | Julia scan API/result schema and invariant tests. | completed and closed |
| `019e7df6-4e99-7972-8de4-6119dcd19ea5` | Nash | Algebraic pass/fail hypotheses for parameter families. | completed and closed |
| `019e7df6-5ce0-7260-ac28-020fccfa1129` | Poincare | 5--10 shard documentation plan and compaction handoff. | completed and closed |

## Integrated implementation

1. Added `src/QubitHamiltonianFamilies.jl` with TFIM, XY, XXZ,
   Heisenberg, compass, DM-style, field, and deterministic generic coefficient
   constructors.
2. Added `src/QubitCandidateScan.jl` with point and batch scan APIs, scoped
   verdicts, terminal gates, summary tables, and TOML-friendly rows.
3. Added `scripts/julia/qubit_candidate_scan.jl` and run bundle
   `runs/2026-05-31-qubit-candidate-scan/`.
4. Added CONVENTIONS.md (q), shards CA-53--CA-61, and report-map entries.
5. Extended `test/runtests.jl` with "qubit Hamiltonian candidate scan"
   invariants.

## Integrated findings

- Local provenance supports TFIM, transverse XY, and XXZ/Heisenberg as physical
  qubit-family labels.  XYZ, DM, compass, and generic dense matrices remain
  synthetic scan inputs.
- The checked scan has 99 points: 9 current-collapsed, 27 conservation
  failures, and 63 exact boost-witness failures.
- The sourced self-dual TFIM point reaches the boost gate and fails the exact
  local boost witness.  This is recorded as a failure of the exact first-moment
  route, not as evidence against the Ising CFT scaling limit.
- No broad-scan point reaches the optional fixed-residual SDP layer because no
  point has a nontrivial exact boost witness.

## Robustness boundaries

- The scan is a necessary-condition sieve for the fixed first-moment route; feasibility or passing early gates is not a symmetry proof.
- Criticality claims need local source anchors. Synthetic grid labels are implementation inputs, not physics claims.
- If context compacts, resume from this file plus CONVENTIONS.md (q),
  CA-53--CA-61, `src/QubitHamiltonianFamilies.jl`,
  `src/QubitCandidateScan.jl`, and
  `runs/2026-05-31-qubit-candidate-scan/`.
- The next research step is to build a state-level or quotient-aware relaxation
  of the boost relation, or move known critical TFIM/XXZ candidates to
  Koo--Saleur/OAR diagnostics instead of rerunning the exact CA-39 boost gate.
