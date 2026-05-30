# Worklog chunk 004 — 2026-05-30

## Session log — 2026-05-30 — Action-plan C4 smooth patches versus finite grids

### Context

C4 repairs a finite-dimensional ambiguity: smooth momentum patches support the
differential operator \(X_a=i\partial_{k_a}\), but finite periodic Brillouin
grids cannot carry exact canonical commutators because of the trace obstruction.

### What changed

- Delegated C4 to worker `019e7921-7709-7431-a8e9-50cec9e57ed4`
  (`Aristotle`).
- Updated CONVENTIONS.md (h), (j) to state that finite Gaussian periodic grids
  are currently symbol/eigenvalue checks only.
- Updated CA-26 to split the smooth \(C_c^\infty(\mathcal U)\) differential
  core from finite periodic Fourier-symbol checks.
- Updated CA-17, CA-23, and CA-28 so periodic first-moment or coordinate
  generator tests require a branch, sawtooth, or Fourier-interpolation
  convention before becoming claims.

### Why these choices

- This preserves the useful finite periodic numerical suite without pretending
  that a finite matrix pair satisfies \([X_a,P_b]=i\delta_{ab}\).  The finite
  side remains an invariant check of coefficient symbols and Fourier spectra.

### Frictions / dead ends

- None.  This step was report/convention-only; no Julia surface changed.

### Acceptance

- `make ci-before-push` passed.
- `git diff --check` passed.

### Pointers

- Action plan: `reviews/2026-05-30_gaussian_lorentz/ACTION_PLAN.md` (C4).
- Orchestration ledger:
  `reviews/2026-05-30_gaussian_lorentz/ORCHESTRATION.md`.
- Convention: `CONVENTIONS.md` (h), (j).
- Report shards: CA-17, CA-23, CA-26, CA-28.

## Session log — 2026-05-30 — Action-plan C3 mass and zero-mode policy

### Context

C3 separates massive positive-dispersion generator statements from massless
coefficient-level examples.  The local sources assume \(m>0\) for the free
bosonic Wightman example and explicitly flag the massless zero mode as requiring
a policy before using \(\gamma_m^{-1}\).

### What changed

- Delegated C3 to worker `019e7919-7dba-7b21-8e02-7454d14a6858` (`Fermat`).
- Updated CONVENTIONS.md (j) to record `mass` as a nonnegative physical label
  and to mark negative numeric masses as outside the documented API.
- Updated CA-24, CA-25, CA-27, and CA-28 to restrict current Fock/generator
  statements to positive-dispersion patches.
- Split the Julia testset so the massless doubler is explicitly a
  coefficient-level rejection witness, not Fock-generator evidence.

### Why these choices

- The coefficient formulas only see \(m^2\), but the Hilbert-space and
  generator layer needs \(\omega>0\) or a zero-mode convention.  Keeping the
  massless doubler as a rejection witness preserves the useful counterexample
  without upgrading it to an unsupported theorem.
- The parent tightened CA-25 so \(m>0\) is identified as sufficient only for the
  nearest-neighbour Klein-Gordon family; arbitrary coefficient symbols still
  require an explicit positive patch condition.

### Frictions / dead ends

- Source-level validation for negative `mass` is deferred to the planned
  coefficient-validator step because C3 did not own `src/`.

### Acceptance

- `make ci-before-push` passed, including shard guard, report rebuild, and
  Julia tests.

### Pointers

- Action plan: `reviews/2026-05-30_gaussian_lorentz/ACTION_PLAN.md` (C3).
- Orchestration ledger:
  `reviews/2026-05-30_gaussian_lorentz/ORCHESTRATION.md`.
- Convention: `CONVENTIONS.md` (j).
- Report shards: CA-24, CA-25, CA-27, CA-28.
- Testsets: `Gaussian boson finite periodic massive coefficient spectra` and
  `Gaussian boson massless doubler coefficient rejection`.

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
