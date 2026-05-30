# Worklog chunk 005 — 2026-05-30

## Session log — 2026-05-30 — Action-plan J1 centered momentum labels

### Context

J1 starts the Julia/test-hardening block by adding branch-aware finite momentum
labels for low-energy windows.  The existing periodic grid is uncentered and is
still useful for branch-insensitive spectra, but it represents the last grid
point of \(L=4\) as \(3\pi/2\) rather than the small negative representative.

### What changed

- Delegated J1 to worker `019e794e-7fb9-70c0-a1f7-1a71d4926fbf` (`Kuhn`).
- Added `centered_periodic_momentum_grid(sizes; spacing=1)` in
  `src/GaussianBosonNumerics.jl`.
- Added even and odd tests, including \(L=4\) where the uncentered \(3\pi/2\)
  point is represented as label \(-1\), momentum \(-\pi/2\).
- Updated CA-28 and `INDEX.md`.
- Parent added the centered branch convention to CONVENTIONS.md (j).

### Why these choices

- This gives future low-energy window and residual tests a branch-aware
  momentum label while preserving the old uncentered grid for
  branch-insensitive symbol spectra.
- The centered helper is explicitly not a periodic position-coordinate or
  finite generator construction.

### Frictions / dead ends

- The worker intentionally did not touch CONVENTIONS.md; the parent added the
  convention note to satisfy the convention-before-use rule.

### Acceptance

- `make ci-before-push` passed.
- `git diff --check` passed.

### Pointers

- Action plan: `reviews/2026-05-30_gaussian_lorentz/ACTION_PLAN.md` (J1).
- Files: `src/GaussianBosonNumerics.jl`, `test/runtests.jl`, CA-28,
  CONVENTIONS.md (j), `INDEX.md`.

## Session log — 2026-05-30 — Action-plan R5 finite-periodic numerical boundary

### Context

R5 narrows CA-28 so the finite-periodic numerical suite cannot be read as a
test of finite boosts, rotations, branch choices, coordinate-generator
commutators, or full generator closure.

### What changed

- Delegated R5 to worker `019e794b-6426-7381-973c-b2852c96284f` (`Nietzsche`).
- Updated CA-28 status/current-surface prose to state the checked coverage
  exactly: symbol values, stiffness spectra, minima counts, and implemented
  coefficient residuals/Hessians.
- Marked next numerical milestones as proposed additions, not achieved
  coverage.

### Why these choices

- The finite periodic suite is valuable but narrow.  It checks coefficient and
  Fourier invariants, not finite coordinate-generator algebra.

### Frictions / dead ends

- None.  This completes the report-only containment block R1--R5.

### Acceptance

- `make ci-before-push` passed.
- `git diff --check` passed.

### Pointers

- Action plan: `reviews/2026-05-30_gaussian_lorentz/ACTION_PLAN.md` (R5).
- Shard: CA-28.

## Session log — 2026-05-30 — Action-plan R4 angular-momentum mnemonic

### Context

R4 qualifies CA-13's angular-momentum-density formula so it cannot be read as a
sourced lattice stress-energy dictionary.

### What changed

- Delegated R4 to worker `019e7947-8ec3-77b1-88fc-7c98019df9be` (`Volta`).
- Updated CA-13 to state that \(J_{ab}=\int(x_ap_b-x_bp_a)\,dx\) is a
  continuum mnemonic only.
- Updated CA-16 to mark lattice rotation output as deferred until a
  momentum-density/current convention has its own evidence.

### Why these choices

- Schottenloher currently sources geometric vector fields and rotations, not a
  lattice momentum density or stress-energy tensor.  A1 remains the source gate
  before promoting any stress-energy formula.

### Frictions / dead ends

- None.  This was a small report containment fix.

### Acceptance

- `make ci-before-push` passed.
- `git diff --check` passed.

### Pointers

- Action plan: `reviews/2026-05-30_gaussian_lorentz/ACTION_PLAN.md` (R4).
- Shards: CA-13 and CA-16.

## Session log — 2026-05-30 — Action-plan R3 source-anchor ranges

### Context

R3 fixes source comments whose anchors only pointed to the first line of
multi-line claims, especially the Koo-Saleur convergence statements and the OAR
warning that Lorentz/conformal convergence remains further work.

### What changed

- Delegated R3 to worker `019e7942-eb85-7bc0-b26d-bf536840f3f6` (`Popper`).
- Expanded KS source ranges in CA-14, CA-16, and CA-17.
- Expanded OAR translation and Lorentz/conformal warning ranges in CA-15,
  CA-16, and CA-23.

### Why these choices

- No mathematical claims changed.  The evidence chain is now less brittle
  because each source comment covers the sentence or claim it is meant to
  support.

### Frictions / dead ends

- None.  This was deliberately anchor-only.

### Acceptance

- `make ci-before-push` passed.
- `git diff --check` passed.

### Pointers

- Action plan: `reviews/2026-05-30_gaussian_lorentz/ACTION_PLAN.md` (R3).
- Shards: CA-14, CA-15, CA-16, CA-17, CA-23.
- Sources: `references/text/CFTFromLatticeFermions.txt:2233--2235`,
  `:2256--2257`, and `references/text/OARWavelets.txt:405--406`.

## Session log — 2026-05-30 — Action-plan R2 CA-23 roadmap repair

### Context

R2 repairs CA-23 after the original roadmap drifted away from the shards that
actually landed: CA-27 is residuals/counterexamples, CA-28 is the numerical
suite, and CA-29 is now the real-space density convention.

### What changed

- Delegated R2 to worker `019e793e-01a5-7280-b32d-57a00392a479` (`Galileo`).
- Moved the CA-15 proof-obligation warning next to the theorem-shaped goal.
- Replaced the stale roadmap table with actual CA-24--CA-29 roles.
- Added queued, explicitly proposal-scoped follow-ups for stress candidates,
  current-vs-symbol checks, higher-dimensional cells, stress-energy numerics,
  and source acquisition.

### Why these choices

- The roadmap should be a navigation aid, not a false history.  Keeping the
  CA-15 proof boundary adjacent to the desired theorem prevents finite symbol
  checks from reading as continuum Lorentz invariance.

### Frictions / dead ends

- None.  No report catalog change was needed because CA-23 metadata did not
  change.

### Acceptance

- `make ci-before-push` passed.
- `git diff --check` passed.

### Pointers

- Action plan: `reviews/2026-05-30_gaussian_lorentz/ACTION_PLAN.md` (R2).
- Shard: CA-23.
- Orchestration ledger:
  `reviews/2026-05-30_gaussian_lorentz/ORCHESTRATION.md`.

## Session log — 2026-05-30 — Action-plan R1 CA-26 coverage demotion

### Context

R1 tightens CA-26 after the reviews found that the shard overstated what is
Julia-checked.  The current tests check coefficient/symbol consequences, not
the full generator bracket table and not second-quantized identities.

### What changed

- Delegated R1 to worker `019e7939-5cff-74c1-85be-419101a1a77a` (`Aquinas`).
- Updated CA-26 status prose to list the exact checked coverage.
- Demoted the boost-boost and second-quantization sections to smooth-core or
  formal \(d\Gamma\) bookkeeping statements.
- Synchronized the CA-26 shard header and catalog summary so they no longer
  claim checked many-body transport.

### Why these choices

- This keeps the valuable one-particle derivations while preventing the report
  from reading as a Fock-space representation theorem.  Domain,
  self-adjointness, and the OAR/mass-shell bridge remain proof obligations.

### Frictions / dead ends

- The worker correctly left catalog edits to the parent because its write scope
  was CA-26 only.

### Acceptance

- `make ci-before-push` passed, including shard guard, report rebuild, and
  Julia tests.

### Pointers

- Action plan: `reviews/2026-05-30_gaussian_lorentz/ACTION_PLAN.md` (R1).
- Shard: CA-26.
- Orchestration ledger:
  `reviews/2026-05-30_gaussian_lorentz/ORCHESTRATION.md`.
