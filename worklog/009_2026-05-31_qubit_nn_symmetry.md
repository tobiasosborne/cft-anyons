# Worklog chunk 009 — 2026-05-31

## Qubit necessary equations and SDP hierarchy — 2026-05-31

### Context

Tobias asked for the qubit nearest-neighbour quest to go beyond first
diagnostics: write the full necessary equations that a Pauli-basis
Hamiltonian density \(h_{\alpha\beta}\) must satisfy for the fixed
first-moment Poincare/Witt/Virasoro route, and then build the outer
vacuum-state SDP hierarchy that can exclude Hamiltonians from finite
restrictions of a candidate global state \(\omega\).

### What changed

- Spawned five read-only subagents for \(1+1\) coefficient equations, \(2+1\)
  square-lattice edge equations, vacuum/SDP hierarchy, Witt/Virasoro mode
  equations, and provenance audit.  The durable orchestration record is
  `reviews/2026-05-31_qubit_nn_sdp_hierarchy/ORCHESTRATION.md`.
- Added CONVENTIONS.md (n)--(o): the one-dimensional coboundary quotient
  \(D u=u_j-u_{j+1}\), the first-moment residual normal form
  \(A=Du\), \(B-u-v^2\bar h=Dw\), the finite moment/SDP semantics, and the
  proposal-level square-lattice edge orientation/divergence policy.
- Added `src/QubitPauliResiduals.jl` and extended `src/QubitPauliLattice.jl`
  with n-site Pauli roundtrips, local embeddings, raw five-site sentinels,
  coboundary coefficients, and the four-site boost-relation density
  \(B_j=i[p_j,h_{j+1}]+2i[p_j,h_{j+2}]\).
- Strengthened the qubit Julia tests to check the coboundary operator identity,
  boost-relation density roundtrips, and the fully-on-site/current-collapse
  obstruction.
- Added shards CA-38--CA-45:
  local Pauli equation framework, explicit 1D Poincare necessary equations,
  checked residual computer algebra, 2D edge equation schema, Witt/Virasoro
  necessary equations, vacuum moment constraints, SDP exclusion hierarchy, and
  implementation roadmap.
- Updated CA-35 so its conservation residual points to the full coboundary
  quotient and CA-39 boost equation.

### Why these choices

- The equations are scoped to the fixed generator route, which keeps
  "necessary" mathematically honest.  They can exclude a Hamiltonian for this
  route, not for every possible continuum construction.
- The divergence quotient is essential: raw coefficientwise zero is too strong
  for infinite bulk sums because \(u_j-u_{j+1}\) telescopes.
- The SDP hierarchy is fixed-\(h\).  If \(h\), \(u\), \(w\), or \(v^2\) are
  simultaneously variables with the moments, the problem becomes polynomial
  rather than a plain SDP; CA-44 records that boundary explicitly.

### Frictions / dead ends

- An earlier five-site conservation density is only a raw overlap sentinel.
  Hubble's derivation showed that the exact formal conservation density after
  Jacobi cancellation is the three-site \(A_j=i[h_j+h_{j+1},p_j]\) modulo
  \(D u\).  The code comments and CA-35 were adjusted accordingly.
- The \(2+1\) equations depend on an edge/cell split and rotation density, so
  CA-41 remains proposal-level until a checker enumerates the finite patch.
- Virasoro central data remain convention-sensitive; CA-42 gives finite
  residuals and moment constraints but not a central-charge extraction theorem.

### Acceptance

- `julia --project=. -e 'using Pkg; Pkg.test()'` passed after adding the new
  residual helpers.
- `make check-report-shards` passed with 46 included shards.
- `make report` rebuilt `report.pdf` successfully.

### Pointers

- Shards: CA-38, CA-39, CA-40, CA-41, CA-42, CA-43, CA-44, CA-45.
- Conventions: CONVENTIONS.md (n), (o).
- Code/tests: `src/QubitPauliLattice.jl`, `src/QubitPauliResiduals.jl`,
  `test/runtests.jl` testset "qubit Pauli nearest-neighbour current
  obstructions".
- Review orchestration:
  `reviews/2026-05-31_qubit_nn_sdp_hierarchy/ORCHESTRATION.md`.

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
