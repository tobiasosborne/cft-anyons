# Worklog chunk 006 — 2026-05-30

## J3 finite-difference boost-time oracle — 2026-05-30

### Context

The action-plan Julia hardening phase needed an oracle independent of the
closed-form boost-time coefficient helper.  J1--J2 had already fixed centered
momentum labels and finite Fourier eigenvectors.

### What changed

- Delegated J3 to worker `019e795f-7356-7501-b435-a8fc6711feec`
  (`Schrodinger`) and reviewed the patch.
- Added a test-local central finite-difference oracle comparing
  `boost_time_symbol_from_coefficients` with one half of the gradient of the
  scalar quadratic symbol.
- Covered generic symmetric finite-range coefficient sets in dimensions 1, 2,
  and 3, including off-axis higher-dimensional terms.
- Updated CA-28 so the numerical surface names these derivative oracles while
  keeping finite boost/rotation generators out of scope.

### Why these choices

- Keeping the finite-difference helper test-local avoids widening the production
  API before J4 structural validation.
- Sampling away from high-symmetry momenta ensures the oracle can catch sign and
  normalization errors rather than passing by accidental zeros.

### Frictions / dead ends

- The derivative tolerance is intentionally separate from the production
  Gaussian tolerance surface; CA-28 records it as a test-local pair.

### Acceptance

- Worker mutation probes confirmed that a sign-flipped derivative and a
  missing-`1/2` mutant fail.
- `make ci-before-push` passed after parent review, including
  `make check-report-shards`, `make report`, and `Pkg.test()`.

### Pointers

- Tests: `test/runtests.jl`, testset
  "Gaussian boson finite-difference boost-time oracle".
- Report: CA-28
  `report/sections/28_gaussian_boson_numerical_suite.tex`.
- Ledger: `reviews/2026-05-30_gaussian_lorentz/ORCHESTRATION.md`.

## Session log — 2026-05-30 — Julia hardening continuation

### Context

The Gaussian Lorentz action-plan orchestration has completed C1--C6, R1--R5,
and J1--J2.  Worklog chunk 005 is near its line cap, so J3 and later steps
continue here.

### What changed

- Started worklog chunk 006.

### Why these choices

- Keeping the worklog sharded preserves the AGENTS.md line-cap discipline and
  leaves a durable context-compaction handoff.

### Frictions / dead ends

- None.

### Acceptance

- Pending first content entry in this chunk: J3 finite-difference derivative
  oracle.

### Pointers

- Orchestration ledger:
  `reviews/2026-05-30_gaussian_lorentz/ORCHESTRATION.md`.
- Action plan:
  `reviews/2026-05-30_gaussian_lorentz/ACTION_PLAN.md`.
