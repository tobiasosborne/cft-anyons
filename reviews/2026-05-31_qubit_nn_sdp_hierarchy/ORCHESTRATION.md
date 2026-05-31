# Orchestration -- qubit necessary equations and SDP hierarchy

Date: 2026-05-31.

Purpose: expand CA-34--CA-37 into a rigorous block of necessary local algebra
equations for nearest-neighbour qubit Hamiltonian densities and an outer SDP
hierarchy for excluding densities by finite restrictions of candidate vacuum
states.

## Parent scope

The parent owns all edits.  Subagents are read-only.  Any subagent formula must
be checked against local derivation, existing source anchors, or Julia tests
before becoming a `Checked` report claim.  Proposal-level equations may be
recorded as such if their assumptions are explicit.

## Subagents

| ID | Nickname | Scope | Status |
|---|---|---|---|
| `019e7db2-7a6d-7e12-9a7f-4095d1c14a33` | Hubble | Full \(1+1\)D local algebra equations: current, conservation, divergence quotient, boost relation, explicit Pauli coefficient schemas. | completed |
| `019e7db2-7ae4-7780-9647-8e2eca680eb9` | Sagan | \(2+1\)D square-lattice edge-density equations: ramp momenta, conservation, commutativity, boost relations, rotation after momentum-density split. | completed |
| `019e7db2-7b6e-7310-92eb-de114b88c169` | Locke | Vacuum-state and SDP exclusion hierarchy: finite moments, positivity, translation invariance, stationarity, relation constraints. | completed |
| `019e7db2-7c31-7a03-8a38-3b70af45ea06` | Meitner | Witt/Virasoro finite necessary equations and their moment/SDP constraints, with Koo-Saleur caveats. | completed |
| `019e7db2-7ced-75f2-a978-b1f0b1bcd6d0` | Feynman | Provenance/rigor audit and exact local source anchors. | completed |

## Intended shard landing

Target split, subject to integration:

1. `CA-38-QUBIT-LOCAL-ALGEBRA-EQUATION-FRAMEWORK`: infinite spin-chain local
   algebra, formal sums, divergence/coboundary equivalence, Pauli tensor
   coefficient calculus.
2. `CA-39-QUBIT-1D-POINCARE-NECESSARY-EQUATIONS`: full \(1+1\)D necessary
   equations for \(H,P,K\), including explicit coefficient schemas.
3. `CA-40-QUBIT-1D-RESIDUAL-COMPUTER-ALGEBRA`: Julia-backed residual tensors
   and sentinels for current/conservation/boost filters.
4. `CA-41-QUBIT-2D-POINCARE-EQUATION-SCHEMA`: formal \(2+1\)D edge-density
   equations and unresolved orientation/momentum-density choices.
5. `CA-42-QUBIT-WITT-VIRASORO-NECESSARY-EQUATIONS`: density/current Fourier
   mode equations and finite-closure caveats.
6. `CA-43-VACUUM-MOMENT-CONSTRAINTS`: finite restrictions of an infinite
   vacuum state and relation constraints.
7. `CA-44-SDP-EXCLUSION-HIERARCHY`: semidefinite feasibility hierarchy for
   excluding fixed \(h_{\alpha\beta}\).
8. `CA-45-QUBIT-SYMMETRY-EXCLUSION-ROADMAP`: implementation and acceptance
   plan for turning the equations into reproducible SDP runs.

## Integrated findings

- Hubble supplied the normal form now used in CA-39: current coefficients
  \(p\), conservation \(A=Du\), and boost relation
  \(B-u-v^2\bar h=Dw\), with scalar energy-origin subtraction.
- Sagan supplied the square-lattice edge schema now recorded in CA-41:
  incident-edge pair currents, ramp momentum weights, conservation,
  translation-commutativity, boost, and rotation residuals modulo a
  two-dimensional divergence.
- Locke supplied the moment/SDP layer now recorded in CA-43--CA-44:
  finite Pauli-word moments, positivity, translation invariance, stationarity,
  and GNS relation constraints \(\omega(X^*RY)=0\).
- Meitner supplied the exact finite \(H_n,J_n,D,F\) mode algebra and chiral
  residuals now recorded in CA-42.
- Feynman supplied the provenance boundary: the full equations are local
  derivations for a fixed ansatz, while the SDP hierarchy is a proposal-level
  outer exclusion layer until implemented and run.

## Compaction handoff

This file is the durable orchestration record.  If context is compacted, resume
from the report shards CA-38--CA-45, CONVENTIONS.md (n)--(o), and the checked
Julia files `src/QubitPauliLattice.jl`, `src/QubitPauliResiduals.jl`, plus the
qubit testset in `test/runtests.jl`.

## Non-negotiable boundaries

- Exact finite local algebra equations are necessary filters only.
- Divergence/coboundary variables are part of the equation system; raw density
  equality is a stronger optional filter.
- SDP infeasibility excludes a Hamiltonian for the named necessary constraints;
  SDP feasibility proves nothing about continuum Poincare or Virasoro symmetry.
- Periodic first moments and \(2+1\) rotations remain convention-sensitive.
- Central charge extraction is deferred until CFT normalisations are fixed.
