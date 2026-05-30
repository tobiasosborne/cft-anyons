# Worklog chunk 005 — 2026-05-30

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
