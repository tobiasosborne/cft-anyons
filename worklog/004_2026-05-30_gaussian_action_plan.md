# Worklog chunk 004 — 2026-05-30

## Session log — 2026-05-30 — Action-plan C2 one-particle measure status

### Context

C2 repairs the status of the Gaussian one-particle boost formula.  The review
finding was that \(K_a=\frac12(X_a\omega+\omega X_a)\) is measure-sensitive and
must not be identified silently with the sourced OAR one-particle space or the
Schottenloher mass-shell/free-boson Poincare theorem.

### What changed

- Delegated C2 to worker `019e7914-909d-71f0-87d4-711abd3494dd` (`Boyle`).
- Updated CONVENTIONS.md (j) to state that CA-24--CA-26 use flat local-symbol
  \(L^2(\mathcal U,dk)\) or flat finite momentum-grid bookkeeping.
- Updated CA-24, CA-25, and CA-26 to label their derivations as flat local
  symbol algebra and to keep the OAR/mass-shell bridge as an open proof
  obligation.

### Why these choices

- The OAR source uses a weighted scalar product on real Cauchy data and then a
  flat Fock realization.  The current report has not derived the unitary
  intertwiner that would transport the flat boost formula into that
  representation, so the safe claim is a local flat-symbol derivation only.

### Frictions / dead ends

- No content disagreement with the worker patch.  The finite-grid wording is
  intentionally limited to symbol/eigenvalue bookkeeping; exact finite
  differential commutators remain a later C4 issue.

### Acceptance

- `make check-report-shards` passed.
- `make report` passed.
- `git diff --check` passed.

### Pointers

- Action plan: `reviews/2026-05-30_gaussian_lorentz/ACTION_PLAN.md` (C2).
- Orchestration ledger:
  `reviews/2026-05-30_gaussian_lorentz/ORCHESTRATION.md`.
- Convention: `CONVENTIONS.md` (j).
- Report shards: CA-24, CA-25, CA-26.

## Session log — 2026-05-30 — Action-plan C1 sign convention

### Context

Tobias asked to serially execute the Gaussian Lorentz action plan, delegating
each step to a subagent while the parent monitors, corrects, and keeps durable
state.  C1 repairs the map from CA-11 continuum vector-field brackets to the
self-adjoint commutator signs used by the Gaussian shards.

### What changed

- Delegated C1 to worker `019e790c-6ac9-7990-9e43-9be09e34ca34`
  (`Confucius`).
- Added CONVENTIONS.md entry (k): Poincare vector fields to self-adjoint
  commutators.
- Updated CA-11, CA-24, and CA-26 to cite convention (k) when using
  \(i[H,K_a]=P_a\), \(i[P_b,K_a]=\delta_{ab}H\), and
  \(i[K_a,K_b]=J_{ab}\).
- Updated the orchestration ledger with the C1 subagent and review status.

### Why these choices

- CA-11's active vector-field table has \([K_a,P_0]=-P_a\), while CA-24--CA-26
  work in self-adjoint Stone-generator notation.  The new convention records
  the inverse-flow pullback implementation and the self-adjoint target table
  explicitly before later Lorentz residual claims depend on it.
- The parent edited the worker wording to avoid an ambiguous claim about an
  "anti-homomorphism at the unitary level"; the landed convention states the
  concrete inverse-flow and Stone-generator rule instead.

### Frictions / dead ends

- The worker ran `make report`, which temporarily rebuilt `report.pdf`; it
  restored that file because the C1 write scope was LaTeX/conventions only.
- No Julia code changed in C1, so Julia tests are not required for this slice.

### Acceptance

- `make check-report-shards` passed.
- `make report` passed.
- `git diff --check` passed.

### Pointers

- Action plan: `reviews/2026-05-30_gaussian_lorentz/ACTION_PLAN.md` (C1).
- Orchestration ledger:
  `reviews/2026-05-30_gaussian_lorentz/ORCHESTRATION.md`.
- Convention: `CONVENTIONS.md` (k).
- Report shards: CA-11, CA-24, CA-26.
