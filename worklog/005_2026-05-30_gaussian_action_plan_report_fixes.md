# Worklog chunk 005 — 2026-05-30

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
