# Worklog chunk 003 — 2026-05-30

## Session log — 2026-05-30 — Gaussian Lorentz action plan

### Context

Tobias asked for a delegated subagent to turn the independent Gaussian Lorentz
reviews into a granular action plan, with future steps scoped to roughly
50--100 changed lines where practical.

### What changed

- Added `reviews/2026-05-30_gaussian_lorentz/ACTION_PLAN.md`.
- Updated the review directory README to list the action plan.

### Why these choices

- The plan keeps the review findings actionable without immediately editing the
  report.  It separates convention repairs, report-only containment fixes,
  Julia/test hardening, source acquisition, and stress-energy proposal shards.

### Frictions / dead ends

- The planner took longer than the first wait cycle, but completed with the
  requested single-file write target.

### Acceptance

- The action plan exists in the review bundle and includes per-step goals,
  files, prerequisites, concrete edits, checks, size estimates, and
  dependencies.

### Pointers

- Action plan:
  `reviews/2026-05-30_gaussian_lorentz/ACTION_PLAN.md`.

## Session log — 2026-05-30 — Independent Gaussian Lorentz reviews

### Context

Tobias asked for multiple independent subagents to review the previous lattice
and Gaussian Lorentz shards.  The review goals were: rigorous criticism of gaps,
counterexamples, and problems; and a secondary collection of material for a
future lattice stress-energy tensor density proposal, especially the 1+1 versus
higher-dimensional distinction.

### What changed

- Created `reviews/2026-05-30_gaussian_lorentz/` as the central review
  location.
- Spawned four reviewers with disjoint write targets:
  - source/provenance/conventions;
  - algebra/signs/domains;
  - numerics/examples;
  - stress-energy proposal map.
- Added `SYNTHESIS.md` summarizing the shared highest-severity findings and the
  recommended next shards.
- Indexed the review artifact in `INDEX.md`.

### Why these choices

- The reviews are kept outside the report because they are critical handoff
  artifacts, not polished lab-book claims.
- Separate files preserve independence and make disagreement visible.
- The synthesis records the cross-review consensus without overwriting the
  reviewers' detailed findings.

### Frictions / dead ends

- The thread limit blocked the fourth reviewer initially; older completed
  subagents were closed and the fourth reviewer was then spawned.
- The algebra review is intentionally long because it records detailed sign and
  domain checks; it is not a report shard and is not subject to the report shard
  line cap.

### Acceptance

- Four independent review files exist in
  `reviews/2026-05-30_gaussian_lorentz/`.
- `SYNTHESIS.md` captures the actionable queue: sign convention, finite-periodic
  branch limits, one-particle measure, real-space density convention,
  zero-mode/tolerance policies, validators, and stress-energy source
  acquisition.

### Pointers

- Review synthesis: `reviews/2026-05-30_gaussian_lorentz/SYNTHESIS.md`.
- Independent reviews:
  `reviewer_01_source_conventions.md`,
  `reviewer_02_algebra_domains.md`,
  `reviewer_03_numerics_examples.md`,
  `reviewer_04_stress_tensor_proposal.md`.

## Session log — 2026-05-30 — CA-25--CA-28 Gaussian boson algebra and examples

### Context

Tobias asked to continue orchestrating the multi-mega-shard Gaussian-boson
Lorentz quest with side quests from the shard roadmap, including Julia
verification and examples, while maintaining the provenance/reproducibility
standard of the AQM lab book.

### What changed

- Added **CA-25**, diagonalizing the scalar translation-invariant Gaussian tier
  to oscillator modes and the one-particle multiplication symbol.
- Added **CA-26**, the one-particle \(H,P,J,K\) generator algebra on a smooth
  momentum core, including exact boost-momentum closure and boost-time /
  boost-boost residuals.
- Added **CA-27**, coefficient-level Lorentz residual conditions:
  gradient residual, low-energy Hessian condition, anisotropic failure, and the
  doubler counterexample.
- Added **CA-28**, the numerical verification suite specification for the
  scalar Gaussian examples.
- Added `src/GaussianBosonNumerics.jl` with checked helpers for anisotropic and
  doubler coefficient systems, low-energy Hessians, Lorentz Hessian residuals,
  periodic stiffness matrices, Brillouin-grid symbol values, and minimum
  counting.
- Extended `test/runtests.jl` with invariant tests for:
  - KG Hessian residuals in \(d=1,2,3\);
  - anisotropic cone rejection;
  - periodic stiffness spectra versus symbol values in \(d=1,2,3\);
  - doubler multi-minimum detection.

### Why these choices

- The source scout found strong local anchors for free scalar lattice
  Hamiltonians, dispersions, Fock representation, and second-quantized
  continuum Hamiltonians.  It also confirmed gaps for Weinberg, general
  stress-energy generator formulae, and bosonic Gaussian Virasoro/Koo-Saleur
  convergence.  The new shards therefore prove algebraic residual identities
  locally and mark continuum generator convergence as open.
- The numerical suite compares independently constructed real-space stiffness
  data and momentum-space symbol values.  This keeps the tests invariant-level,
  not visual or smoke-test based.
- BdG/pairing systems remain explicitly deferred because their symplectic
  positivity and Bogoliubov implementability conventions are not fixed.

### Frictions / dead ends

- The first periodic-grid helper returned an array shaped like the lattice,
  which made sorted spectrum comparison ill-typed; it was flattened so the
  spectrum oracle is a list of symbol values.
- The algebra side quest supplied a useful boost-boost residual formula; this
  was folded into CA-26 after checking that the gradient nature of \(R_a\) kills
  the extra divergence term.
- The current finite periodic momentum grid is adequate for symmetric scalar
  symbols.  Later non-even or BdG symbols will need a stricter branch/sign
  convention before DFT eigenvector tests are promoted.

### Acceptance

- `make check-report-shards`: PASS with 29 shards.
- `make report`: PASS, rebuilt `report.pdf`.
- `julia --project=. -e 'using Pkg; Pkg.test()'`: PASS, including the new
  Gaussian-boson residual and finite-periodic example checks.

### Pointers

- Shards: CA-25--CA-28.
- Code/tests: `src/GaussianBosonNumerics.jl`, `src/GaussianBosons.jl`,
  `test/runtests.jl`.
- Sources: `literature/md/2010.11121/2010.11121.md:251`--`:301`,
  `:598`--`:623`, `:648`--`:716`, `:1037`--`:1046`, `:1540`--`:1556`;
  `references/cft/Schottenloher2008/Schottenloher2008.md:4092`--`:4117`,
  `:4186`--`:4244`; OAR wavelet boundary at
  `references/text/OARWavelets.txt:390`--`:406`.
- Open source/proof gaps: Weinberg QFT Vol. 1 registration, general
  stress-energy generator formulae, bosonic Gaussian Virasoro/Koo-Saleur
  convergence, massless zero-mode policy, and BdG/pairing convention.

## Session log — 2026-05-30 — CA-23--CA-24 Gaussian boson Lorentz roadmap

### Context

Tobias pivoted back from Galilean symmetry to Lorentz symmetry and asked for a
multi-mega-shard programme for translation-invariant quasi-local Gaussian
bosonic lattice systems in spatial dimensions \(d=1,2,3\).  The target is to
derive lattice generators algebraically as functions of Hamiltonian
coefficients, use their residuals as Lorentz-invariance conditions, and recover
standard Klein-Gordon/free scalar behavior.

### What changed

- Added **CA-23**, a roadmap for the Gaussian-boson Lorentz block:
  symbol calculus, diagonalisation, one-particle and many-body generators,
  Lorentz residuals, examples/counterexamples, numerical verification, and OAR
  proof obligations.
- Added **CA-24**, the first checked symbol-calculus shard:
  - scalar canonical Gaussian tier with \(H=\frac12p^2+\frac12qVq\);
  - Fourier symbol \(\omega_\epsilon(k)^2=\sum_rV_re^{i\epsilon k\cdot r}\);
  - nearest-neighbour lattice Klein-Gordon coefficients;
  - one-particle boost-time residual
    \(i[\omega,K_a]=\frac12\partial_a\omega(k)^2\);
  - Klein-Gordon condition \(\frac12\partial_a\omega^2=k_a\).
- Added CONVENTIONS.md (j) for translation-invariant Gaussian boson symbols in
  \(d=1,2,3\).
- Added `src/GaussianBosons.jl` and tests for:
  - coefficient-symbol evaluation;
  - nearest-neighbour Klein-Gordon dispersion in \(d=1,2,3\);
  - boost-time residual symbols and the small-\(\epsilon\) limit
    \(\sin(\epsilon k_a)/\epsilon\to k_a\).

### Why these choices

- Local OAR/free-scalar sources strongly support the nearest-neighbour harmonic
  lattice scaling to the massive continuum free field, but explicitly mark
  Lorentz/conformal generator convergence as further work.  Therefore the new
  shards state generator-symbol algebra and residual conditions, not a completed
  lattice-boost convergence theorem.
- The first tier is scalar \(q,p\), not full bosonic BdG.  Pairing/BdG systems
  need a separate symplectic positivity and Bogoliubov convention before their
  generator formulas are promoted.

### Frictions / dead ends

- Subagent spawning hit the thread limit, so two existing agents were reused for
  derivation/numerics scouting and one new source scout was spawned.  Their
  outputs confirmed the source gaps: no registered discrete Gaussian free-field
  Virasoro full text, no local proof of Lorentz boost recovery from lattices, and
  massless zero-mode issues flagged in the OAR source.
- A first Julia test used `range(...; length=1)` with differing endpoints; the
  sample momentum vectors were made explicit.
- The first report build had old TeX `\over` warnings in the new shards; all were
  replaced by `\frac`.

### Acceptance

- `make ci-before-push`: PASS after CA-23--CA-24 (shard guard + report build +
  Julia tests).

### Pointers

- Shards: CA-23--CA-24.
- Code/tests: `src/GaussianBosons.jl`, `test/runtests.jl`.
- Sources: `literature/md/2010.11121/2010.11121.md` for harmonic lattice scalar
  fields and the free scalar scaling limit; Schottenloher for free bosonic
  Klein-Gordon/Poincare-covariant QFT; OAR wavelets for translation recovery and
  the explicit Lorentz/conformal source gap.
