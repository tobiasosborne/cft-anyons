# Worklog chunk 009 — 2026-05-31

## Qubit nearest-neighbour symmetry diagnostics — 2026-05-31

### Context

Tobias asked for the next lattice-symmetry quest to restrict to qubits with
nearest-neighbour Hamiltonian densities written as \(4\times4\) Pauli-basis
coefficients, in both \(1+1\) and \(2+1\) dimensions.  The concrete question was
whether algebraic finite-generator diagnostics already rule out classes of
Hamiltonians as possible Poincare/Witt/Virasoro realisations, with fully local
single-site Hamiltonians as the expected first casualty.

### What changed

- Spawned four read-only research subagents for \(1+1\) Poincare algebra,
  \(2+1\) patch diagnostics, Koo--Saleur/Witt/Virasoro diagnostics, and source
  provenance.  The orchestration record is in
  `reviews/2026-05-31_qubit_nn_symmetry/ORCHESTRATION.md`.
- Added CONVENTIONS.md (m), fixing the qubit Pauli coefficient convention,
  symmetric on-site bond split, adjacent-current coefficient formula, and the
  two-dimensional proposal boundary.
- Added `src/QubitPauliLattice.jl` with Pauli reconstruction helpers, the
  adjacent current \(i[h_{12},h_{23}]\), its Pauli-coefficient formula, and the
  local conservation residual \(i[h_{12}+h_{23}, i[h_{12},h_{23}]]\).
- Added Julia tests for the checked obstruction: symmetric on-site terms and
  classical \(ZZ\) densities have zero adjacent current; a transverse-Ising
  style density has nonzero current; an asymmetric fake on-site split is caught
  by the conservation residual.
- Added report shards CA-34--CA-37 and updated `report.tex`, report maps,
  `INDEX.md`, and `report.pdf`.

### Why these choices

- The first safe rule-out is narrow but real: under the fixed symmetric on-site
  split, fully local one-site Hamiltonians have
  \(i[h_{12},h_{23}]=0\), so the CA-12 first-moment boost route gives zero bulk
  momentum.  This supports the intuition without overclaiming all possible
  constructions.
- The \(2+1\) and Witt/Virasoro material is intentionally proposal-level.  It
  names finite residuals and patch checks, but does not claim continuum
  Poincare or Virasoro symmetry.
- The asymmetric-split sentinel was added because subagent review flagged the
  density-gauge failure mode: a bad split can fake a current, but then fails
  the next translation-conservation diagnostic.

### Frictions / dead ends

- A first test iteration incorrectly expected the identity coefficient in the
  symmetric on-site split to halve; the \(I\otimes I\) term receives both
  endpoint contributions.  The test now records the correct roundtrip.
- The adjacent current is numerically zero at \(10^{-17}\)-scale for generic
  real on-site data, so the tests use the named Pauli tolerance rather than a
  default zero comparison.
- Periodic first moments, \(2+1\) rotation density, central charge extraction,
  and low-energy compressed Witt residuals remain open because the necessary
  conventions and scaling data are not fixed.

### Acceptance

- `make check-report-shards` passed.
- `julia --project=. -e 'using Pkg; Pkg.test()'` passed.
- `make report` passed after fixing one overfull displayed formula.

### Pointers

- Shards: CA-34, CA-35, CA-36, CA-37.
- Convention: CONVENTIONS.md (m).
- Code/tests: `src/QubitPauliLattice.jl`, `test/runtests.jl` testset
  "qubit Pauli nearest-neighbour current obstructions".
- Review orchestration:
  `reviews/2026-05-31_qubit_nn_symmetry/ORCHESTRATION.md`.

