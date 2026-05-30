# Worklog chunk 003 — 2026-05-30

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
