# Independent finite-code referee: scalar-augmented coset OAR

Scope: `benchmarks/unitized_oar/UnitizedOAR.jl`, `CosetTower.jl`,
`test.jl`, `test_descendants.jl`, and their README. This is a final code
verification against CO-1/CH, not a new research result or a review of the
reviewer's own CH proof. No implementation was modified.

**Verdict:** no material mathematical implementation bug found in the
reviewed finite code. One run-artifact discrepancy must be resolved before
claiming successful mutation evidence.

## Accepted finite implementation

- `UnitizedOAR.jl:19–38` checks the Hermitian Gram matrix by an exact
  positive LDL* factorization and verifies its reconstruction. It also
  verifies vacuum normalization and grade orthogonality. There is no
  floating rank tolerance or hidden change to an orthonormal basis.
- `:54–62` correctly implements the Gram adjoint `G^(-1) A* G` and
  expectation `v* G A v`. The nonorthogonal two-dimensional test genuinely
  exercises the metric factor.
- `:64–73` verifies the connecting isometry, vacuum and grade relations,
  forms its correct metric adjoint, and uses the **independent scalar** on
  the complement. This matches CO-1's unital injective *-homomorphism;
  substituting a vacuum expectation would not be the same map.
- `:75–81` gives the positive flag Hamiltonian and grade derivation.
  Generic Stage allows more than one grade-zero vector, so uniqueness of
  the ground state is a property of the actual CH stages, not of every
  possible Stage argument. `test_descendants.jl` checks that property
  explicitly; this is an accepted scope distinction.
- `CosetTower.jl:11–29` imports actual computed sparse vectors and Grams
  through `CH.basis_data`. Connecting matrices are computed from overlaps
  and a Gram solve, then their action is reconstructed as an exact sparse
  vector and compared with the actual CAR refinement. No hardcoded c or
  character multiplicity substitutes for the computed space.
- `:33–45` computes each necessary sparse action once. The grade-based
  pruning is exact: `[E,C_n]=-n C_n` and orthogonality of different grades
  force every skipped compressed column to vanish. The retained columns
  use actual sparse actions and exact overlap/Gram solves. This addresses
  the timeout without changing the represented compressed operator.
- The descendant tests explicitly reject exact refinement of the same
  smearing across grade cutoffs. README preserves the distinction between
  these spaces and a categorical fusion-space/local interaction model.

## Verification performed and artifact issue

Independent command:
`OPENBLAS_NUM_THREADS=1 JULIA_NUM_THREADS=1 timeout 60 julia --project=. cft_machine/benchmarks/unitized_oar/test.jl`.
Result: **19/19 passed**, 24.6 seconds reported runtime. The 212-assertion
descendant suite was inspected but not rerun, per the wind-up instruction;
its green status is author-reported and should cite its own run artifact.

At review time `runs/2026-09-22/mutation-scalar-character.txt` contained a
**19/19 green** summary, with no failed assertions. That file does not
currently substantiate the claimed rejected scalar-to-character mutation.
The parent was notified immediately. Supply the actual RED output (and
restored final GREEN output), or remove the mutation claim from the report.
This provenance discrepancy does not invalidate the accepted finite algebra
calculation or the independent green verification above.

## Resolution of the mutation-artifact discrepancy

The corrected mutation artifact was inspected without another test run. It
now records **18 passed, 1 failed**, specifically the multiplicativity check.
The original test pair accidentally made the vacuum functional multiplicative
on that pair; changing the second matrix from `[0 1;0 2]` to `[0 1;1 2]`
provides the missing regression witness. The implementation on disk is restored
to the independent scalar `a.scalar*(I-P)`. The earlier provenance issue is
resolved; the parent is recording the strengthened final green run separately.
