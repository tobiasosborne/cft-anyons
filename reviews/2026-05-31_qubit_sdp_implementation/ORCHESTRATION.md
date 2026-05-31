# Orchestration -- qubit SDP implementation

Date: 2026-05-31.

Purpose: implement the fixed-\(h\) Pauli-word moment hierarchy from CA-43--CA-45
as a functional Julia layer, backed by Mosek when available, and document it in
new report shards.

## Parent scope

The parent owns all repository edits and the final integration.  Subagents are
read-only design/provenance workers unless explicitly recorded otherwise.  Any
formula or API design from a subagent must be checked against the current repo,
tests, local derivation, or local sources before landing.

## Subagents

| ID | Nickname | Scope | Status |
|---|---|---|---|
| `019e7dcb-e18a-7d23-aae9-bf7d33335d9d` | Carver | Finite Pauli-word moment algebra, translation canonicalization, moment matrix, and relation constraints. | completed and closed |
| `019e7dcb-f40c-7f73-a5ce-095241c13616` | Parfit | Julia/JuMP/Mosek package/API strategy and robust tests. | completed and closed |
| `019e7dcc-05c3-7791-8540-baeed477a595` | Ohm | Report shard split, source anchors, and documentation plan. | completed and closed |
| `019e7dcc-152f-7c20-8072-c111144a21be` | Pascal | Candidate Hamiltonian coefficient matrices and safe acceptance assertions. | completed and closed |

## Integrated implementation landing

1. Added `JuMP`, `MathOptInterface`, and `MosekTools` as package
   dependencies.
2. Added `src/QubitPauliWords.jl` for positioned Pauli words, exact
   multiplication phases, translation-canonical moment representatives, and
   finite window enumeration.
3. Added `src/QubitMomentSDP.jl` for fixed-residual level specifications,
   affine moment forms, realified PSD matrices, relation constraints, and
   Mosek-backed solve verdicts.
4. Added `src/QubitPoincareWitnesses.jl` and
   `src/QubitHamiltonianScreening.jl` for deterministic algebraic gates and
   sentinel Hamiltonian matrices.
5. Extended `test/runtests.jl` with exact Pauli-word identities, model
   dimension checks, artificial infeasibility witnesses, solver smoke checks,
   and sentinel-gate assertions.
6. Added `scripts/julia/qubit_sdp_smoke.jl` and
   `runs/2026-05-31-qubit-sdp-smoke/results.toml` as the first reproducible
   Mosek run bundle.
7. Added CA-46--CA-52 and CONVENTIONS.md (p) for the implementation contract,
   moment basis, positivity construction, residual compiler, backend, sentinel
   Hamiltonians, and candidate-screening roadmap.

## Integrated findings

- Actual Pauli words are retained as rows and columns of the finite GNS probe
  space; only moment variables are translation-canonicalized.
- Complex Hermitian moment positivity is imposed through the real cone
  `[A -B; B A] >= 0`.
- The current implementation is fixed-`h`: witnesses and residual terms are
  fixed before constructing the JuMP model.
- Fully onsite and classical `ZZ` sentinels are current-collapse exclusions for
  the first-moment route.  Generic currentful and fake split sentinels fail the
  conservation witness.  The transverse-Ising-style sentinel is the first
  nontrivial currentful case that reaches the boost gate.
- Artificial residuals `I=0` and forced `ZZ=0` give tiny infeasible SDP smoke
  instances, while the zero-residual level remains feasible.

## Robustness boundaries

- The first solver target is fixed \(h_{\alpha\beta}\).  Unknown \(h\) and
  unknown residual witnesses remain a later polynomial/lifted relaxation.
- The hierarchy must expose explicit finite constraints; it must not hide
  failures inside a "ran without errors" test.
- Solver-dependent tests should use tiny infeasible/feasible instances and
  tolerate the absence of a license only if model-construction tests still run.
- Infeasible means "excluded for the named first-moment/vacuum constraints",
  not excluded from all possible continuum symmetry constructions.

## Compaction handoff

If context is compacted, resume from this file, CA-38--CA-45,
CONVENTIONS.md (n), and the new Julia files.  The next durable state should
record every subagent as completed or closed and list which findings were
integrated.

After this landing, resume from CA-46--CA-52, CONVENTIONS.md (p), `INDEX.md`,
and the run bundle `runs/2026-05-31-qubit-sdp-smoke/`.  The next substantive
quest is not to reinterpret feasibility as symmetry evidence, but to add a
candidate scan format and run algebraic gates plus fixed-level SDP exclusions
against sourced Hamiltonian families.
