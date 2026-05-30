# Worklog chunk 006 — 2026-05-30

## J5 finite-grid minimum and positivity witnesses — 2026-05-30

### Context

J4 made scalar coefficient structure explicit, but the Lorentz Hessian residual
was still only local Taylor data.  The action plan required finite-grid
positivity and patch/minimum witnesses before these residuals can become
compiler gates.

### What changed

- Delegated J5 to worker `019e7970-b245-7a42-9153-e0ae276cc11c`
  (`Beauvoir`) and reviewed the patch.
- Added `symbol_minimum_data`, returning finite-grid minimum value, count,
  one-based locations, uncentered labels/momenta, centered labels/momenta, and
  tolerance metadata.
- Added a `require_nonnegative=true` finite-grid gate that raises on negative
  minima outside the named minima tolerance.
- Added the unstable one-dimensional witness
  \(V_0=0,V_{\pm1}=1,V_{\pm2}=-1/2\): its speed-one Hessian residual vanishes,
  but the \(L=4\) symbol has minimum \(-3\) at the Brillouin edge.
- Strengthened doubler checks in \(d=1,2,3\), recording \(2^d\) zero minima
  with centered labels in \(\{0,-2\}^d\).
- Updated CA-27, CA-28, and INDEX.md to describe finite-grid witnesses rather
  than continuum species or positivity theorems.

### Why these choices

- Hessian data alone can certify only one Taylor coefficient at a chosen patch;
  it cannot prove stability or single-species behavior.
- Returning both centered and uncentered labels keeps the helper compatible with
  the finite spectrum convention and the branch-aware low-energy convention.

### Frictions / dead ends

- The nonnegative gate is deliberately finite-grid only.  It is useful as a
  compiler witness, but it is not a continuum positivity proof.

### Acceptance

- `make ci-before-push` passed after parent review, including
  `make check-report-shards`, `make report`, and `Pkg.test()`.
- `git diff --check` passed.

### Pointers

- Helper: `src/GaussianBosonNumerics.jl`.
- Tests: `test/runtests.jl`, testsets
  "Gaussian boson finite-grid minimum data" and
  "Gaussian boson massless doubler coefficient rejection".
- Report: CA-27 and CA-28.

## J4 structural coefficient validation — 2026-05-30

### Context

After J3, the Gaussian numerical helpers still trusted coefficient lists more
than CONVENTIONS.md (j) allows.  The action plan required a strict scalar
coefficient validator before positivity and patch/minimum gates.

### What changed

- Delegated J4 to worker `019e7968-63d3-7010-8a23-e7cca580ed2d` (`Sagan`) and
  reviewed the patch.
- Added `validate_scalar_coefficients`, checking nonempty data, integer
  offsets, common dimension \(d\in\{1,2,3\}\), real coefficients, and aggregate
  paired equality \(V_r=V_{-r}\).
- Wired strict validation by default into scalar symbol, boost-time symbol,
  Hessian/residual, periodic symbol, minima, and stiffness helpers.
- Preserved the one-sided Fourier direction sentinel only through an explicit
  `validate_coefficients=false` path, after asserting strict rejection.
- Updated CA-28 and INDEX.md to include the validator in the checked numerical
  surface.

### Why these choices

- The compiler-facing path should fail closed on non-scalar-Gaussian data rather
  than silently using a convenience kernel.
- Aggregate pairing permits repeated offsets while still checking the actual
  structural condition \(V_r=V_{-r}\).

### Frictions / dead ends

- The existing one-sided sentinel is intentionally nonphysical.  Keeping it
  required an explicit opt-out keyword and a report note so it cannot be
  mistaken for scalar Gaussian evidence.

### Acceptance

- Parent added wiring tests proving the default scalar and boost-time helpers
  reject an unpaired coefficient list.
- `make ci-before-push` passed after parent review, including
  `make check-report-shards`, `make report`, and `Pkg.test()`.
- `git diff --check` passed.

### Pointers

- Validator: `src/GaussianBosons.jl`.
- Strict numerical paths: `src/GaussianBosonNumerics.jl`.
- Tests: `test/runtests.jl`, testset
  "Gaussian boson scalar coefficient validation".
- Report: CA-28
  `report/sections/28_gaussian_boson_numerical_suite.tex`.

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

- First content entry recorded above: J3 finite-difference derivative oracle.

### Pointers

- Orchestration ledger:
  `reviews/2026-05-30_gaussian_lorentz/ORCHESTRATION.md`.
- Action plan:
  `reviews/2026-05-30_gaussian_lorentz/ACTION_PLAN.md`.
