# Action Plan After Gaussian Lorentz Reviews

Scope: improve CA-10--CA-17 and CA-23--CA-28 after the four independent
Gaussian Lorentz reviews.  This plan is ordered by risk.  Each implementation
step should be kept near 50--100 changed LOC where possible; new report shards
may be larger, but should still be split into convention, report, and test
commits when practical.

Global rule for every step: preserve Law 1--3 provenance.  Do not promote a
formula from proposal to claim unless it cites a local source, a local
derivation, a test, or a run artifact.  Add a worklog entry when a step lands.

## 1. Convention Repairs

### C1. Fix the vector-field to self-adjoint-generator sign map

- **Goal:** State the exact convention converting CA-11 vector-field brackets
  into the self-adjoint commutator table used by CA-24--CA-26.
- **Why:** Highest-risk mismatch.  CA-11 has `[K_a,P_0]=-P_a` as vector fields,
  while CA-24--CA-26 use `i[H,K_a]=P_a` and `i[P_b,K_a]=delta_ab H`.
- **Exact files likely touched:** `CONVENTIONS.md`,
  `report/sections/11_continuum_bulk_symmetry_target.tex`,
  `report/sections/24_gaussian_boson_symbol_calculus.tex`,
  `report/sections/26_gaussian_boson_generator_algebra.tex`,
  `test/runtests.jl` if a sign-table helper is added.
- **Source/convention prerequisites:** Use the existing Stone and translation
  anchors in `references/cft/Schottenloher2008/Schottenloher2008.md:4040--4050`
  and `:4113--4117`, plus the checked CA-11 vector-field derivation.  No new
  source is required if the convention is explicitly internal.
- **Concrete edits:** Add a convention entry or extend (h)/(j) with `U(t)`,
  active/passive choice, whether the map is a homomorphism or anti-homomorphism,
  and the target table for `i[H,K_a]`, `i[P_b,K_a]`, rotations, and
  `i[K_a,K_b]`.  Update CA-11/24/26 to cite that entry.
- **Acceptance checks:** `make check-report-shards`; `make report`; if tests are
  touched, `julia --project=. -e 'using Pkg; Pkg.test()'`.
- **Estimated change size:** 60--100 LOC.
- **Dependencies:** None.  Do this before further Lorentz residual claims.

### C2. Fix the Gaussian one-particle measure and boost formula status

- **Goal:** State whether the current one-particle algebra is on flat
  `L^2(dk)`, the weighted OAR one-particle space, or a mass-shell realization.
- **Why:** The formula `K_a=1/2(X_a omega + omega X_a)` is measure-sensitive;
  the reviews found it is currently plausible only as a flat-coordinate algebra
  unless a unitary transform is written down.
- **Exact files likely touched:** `CONVENTIONS.md`,
  `report/sections/24_gaussian_boson_symbol_calculus.tex`,
  `report/sections/25_gaussian_boson_diagonalization.tex`,
  `report/sections/26_gaussian_boson_generator_algebra.tex`.
- **Source/convention prerequisites:** Existing OAR scalar-product anchors in
  `literature/md/2010.11121/2010.11121.md:648--681` and free-boson Poincare
  anchor `references/cft/Schottenloher2008/Schottenloher2008.md:4244`.  If the
  plan is to identify the flat formula with the sourced Poincare
  representation, acquire or derive the unitary equivalence first.
- **Concrete edits:** Record the Hilbert-space measure.  If flat `L^2(dk)` is
  chosen, label CA-24--CA-26 as flat local symbol algebra and not yet the sourced
  mass-shell theorem.  Add a short note on what remains to connect to the OAR or
  Schottenloher representation.
- **Acceptance checks:** `make check-report-shards`; `make report`.
- **Estimated change size:** 50--90 LOC.
- **Dependencies:** C1 recommended, because sign and measure should be read
  together.

### C3. Record mass, positivity, and zero-mode policy

- **Goal:** Separate massive positive-dispersion generator statements from
  massless coefficient-only counterexamples.
- **Why:** CA-24--CA-26 assume `omega>0` on the patch, but the doubler test uses
  `mass = 0`.  That is valid as a rejection witness, not as Fock-generator
  evidence.
- **Exact files likely touched:** `CONVENTIONS.md`,
  `report/sections/24_gaussian_boson_symbol_calculus.tex`,
  `report/sections/25_gaussian_boson_diagonalization.tex`,
  `report/sections/27_gaussian_boson_residual_conditions.tex`,
  `report/sections/28_gaussian_boson_numerical_suite.tex`,
  `test/runtests.jl`.
- **Source/convention prerequisites:** Existing positive-mass and zero-mode
  anchors: `references/cft/Schottenloher2008/Schottenloher2008.md:4186`,
  `literature/md/2010.11121/2010.11121.md:623`, and
  `literature/md/2010.11121/2010.11121.md:1626--1628`.
- **Concrete edits:** State whether API `mass` is signed, nonnegative, or
  physically positive.  Mark massless doubler examples as coefficient-level
  rejection tests outside the current positive-dispersion generator theorem.
  Make prose and test names agree.
- **Acceptance checks:** `make check-report-shards`; `make report`; `Pkg.test()`
  if tests are renamed or strengthened.
- **Estimated change size:** 50--90 LOC.
- **Dependencies:** C2.

### C4. Split smooth low-energy patches from finite periodic grids

- **Goal:** Remove any reading that a finite periodic grid carries exact
  `[X_a,P_b]=i delta_ab`.
- **Why:** Finite matrices cannot satisfy the canonical differential commutator
  by the trace obstruction.  Periodic tests are safe for symbols/eigenvalues,
  not for exact `X=i partial_k` algebra without a branch/interpolation policy.
- **Exact files likely touched:** `CONVENTIONS.md`,
  `report/sections/17_lattice_symmetry_examples_queue.tex`,
  `report/sections/23_gaussian_boson_lorentz_roadmap.tex`,
  `report/sections/26_gaussian_boson_generator_algebra.tex`,
  `report/sections/28_gaussian_boson_numerical_suite.tex`.
- **Source/convention prerequisites:** Existing centered dual-lattice source
  `literature/md/2010.11121/2010.11121.md:274--293`; existing periodic
  first-moment warnings in CA-12, CA-16, CA-17, and CA-23.
- **Concrete edits:** In CA-26, replace the finite "trigonometric-polynomial
  core" wording with two cases: `C_c^\infty(U)` on a smooth open momentum patch,
  and finite periodic symbol/eigenvalue checks.  State that periodic
  first-moment or momentum-coordinate tests require a branch/sawtooth/Fourier
  convention.
- **Acceptance checks:** `make check-report-shards`; `make report`.
- **Estimated change size:** 50--80 LOC.
- **Dependencies:** C1 for sign wording; independent of source acquisition.

### C5. Add numerical tolerance and validator conventions

- **Goal:** Record tolerance policy before numerical helpers become compiler
  gates.
- **Why:** Current code uses fixed `1e-10`, default `isapprox`, and one `5e-4`
  asymptotic tolerance without a convention entry.
- **Exact files likely touched:** `CONVENTIONS.md`,
  `src/GaussianBosons.jl`, `src/GaussianBosonNumerics.jl`,
  `test/runtests.jl`, `report/sections/28_gaussian_boson_numerical_suite.tex`.
- **Source/convention prerequisites:** Local numerical design only; no external
  source required.  Cite tests and helper lines after implementation.
- **Concrete edits:** Add named defaults for symbol imaginary parts, eigenvalue
  comparisons, minima counts, and small-spacing residuals.  Prefer scale-aware
  `isapprox` after structural coefficient validation.
- **Acceptance checks:** `Pkg.test()`; `make report` if CA-28 is updated.
- **Estimated change size:** 70--100 LOC.
- **Dependencies:** None, but pair with J4 when practical.

### C6. Fix the Gaussian real-space density convention before stress-energy use

- **Goal:** Choose the local split of the scalar Gaussian Hamiltonian into
  `h_x` and record cell-volume, bond-sharing, boundary, normal-ordering, and
  improvement policies.
- **Why:** Stress-energy proposals need a local `T_00` candidate.  The total
  symbol `omega(k)^2` is not enough, and `h_x -> h_x + div b_x` changes first
  moments.
- **Exact files likely touched:** `CONVENTIONS.md`,
  a new density shard, likely
  `report/sections/29_gaussian_boson_real_space_density.tex`,
  `report.tex`, `report/README.md`, `report/SHARD_CATALOG.md`.
- **Source/convention prerequisites:** Existing scalar lattice Hamiltonian
  anchors in `literature/md/2010.11121/2010.11121.md:598--623`; KS/vacuum
  subtraction anchors in `references/text/CFTFromLatticeFermions.txt:378--389`
  if normal ordering is discussed.  Do not call the density a stress tensor
  until A1 lands.
- **Concrete edits:** Define `h_x` as a convention, not a theorem.  State whether
  `h_x` is energy per site or physical density per cell, how `q_x V_r q_{x+r}`
  is assigned to sites/bonds, and what improvements are allowed.
- **Acceptance checks:** `make check-report-shards`; `make report`.
- **Estimated change size:** 90--140 LOC total; split into convention and shard
  body if it grows.
- **Dependencies:** A1 before stress-tensor language; otherwise independent as
  a density convention.

## 2. Report-Only Containment Fixes

### R1. Demote CA-26 checked-coverage wording

- **Goal:** Make CA-26 say exactly what is checked now and what is only a local
  derivation.
- **Why:** Reviews 01 and 03 found CA-26 overstates test coverage.  Current
  tests check boost-time symbols, Hessians, examples, and spectra, not all
  generator brackets or second-quantized identities.
- **Exact files likely touched:** `report/sections/26_gaussian_boson_generator_algebra.tex`,
  possibly `report/SHARD_CATALOG.md` if the shard summary changes.
- **Source/convention prerequisites:** Current `test/runtests.jl:168--222` and
  review findings.  No new source required.
- **Concrete edits:** Change status to "local differential-operator derivation;
  only boost-time residual currently Julia-checked".  Replace "lift the checked
  residuals to the Gaussian Fock space" with "formal `dGamma` identities on the
  algebraic finite-particle core" until domain/self-adjointness is proved.
- **Acceptance checks:** `make check-report-shards`; `make report`.
- **Estimated change size:** 25--60 LOC.
- **Dependencies:** Can land immediately; refine after C1/C2 if needed.

### R2. Repair CA-23 roadmap drift

- **Goal:** Align the roadmap with actual CA-27 and CA-28, and reserve future
  shard slots for density and stress-energy work.
- **Why:** CA-23 says CA-27 is real-space densities and CA-28 residuals, but the
  actual shards are CA-27 residuals/counterexamples and CA-28 numerical suite.
- **Exact files likely touched:** `report/sections/23_gaussian_boson_lorentz_roadmap.tex`.
- **Source/convention prerequisites:** `report/README.md` shard order and
  `report/SHARD_CATALOG.md`; no new source.
- **Concrete edits:** Replace the stale roadmap table with actual CA-24--CA-28
  roles and future queued roles: density convention, 1+1 stress candidates,
  current-vs-symbol equivalence, higher-dimensional cells, source acquisition.
  Keep the CA-15 proof-obligation warning adjacent to the theorem-shaped goal.
- **Acceptance checks:** `make check-report-shards`; `make report`.
- **Estimated change size:** 40--80 LOC.
- **Dependencies:** None.

### R3. Fix source-anchor ranges in existing lattice-symmetry shards

- **Goal:** Make cited anchors cover the full claims they support.
- **Why:** Several source comments cite only the first line of multi-line claims,
  especially OAR warnings and KS convergence statements.
- **Exact files likely touched:** `report/sections/14_koo_saleur_prototype.tex`,
  `report/sections/15_lattice_symmetry_acceptance_tests.tex`,
  `report/sections/16_lattice_symmetry_compiler_interface.tex`,
  `report/sections/17_lattice_symmetry_examples_queue.tex`,
  `report/sections/23_gaussian_boson_lorentz_roadmap.tex`.
- **Source/convention prerequisites:** Use the already local anchors noted in
  reviewer 01: `references/text/CFTFromLatticeFermions.txt:2233--2235`,
  `:2256--2257`, and `references/text/OARWavelets.txt:405--406`.
- **Concrete edits:** Update source comments and nearby prose only.  Do not add
  new claims.
- **Acceptance checks:** `make check-report-shards`; `make report`.
- **Estimated change size:** 30--70 LOC.
- **Dependencies:** None.

### R4. Qualify stress-energy and angular-momentum density intuition in CA-13

- **Goal:** Keep `J_ab = int (x_a p_b - x_b p_a)` as a continuum mnemonic, not a
  sourced lattice stress-energy dictionary.
- **Why:** CA-13 uses momentum-density intuition before a QFT stress-energy
  source, tensor convention, or improvement policy is fixed.
- **Exact files likely touched:** `report/sections/13_position_dependent_bulk_generators.tex`,
  possibly `report/sections/16_lattice_symmetry_compiler_interface.tex`.
- **Source/convention prerequisites:** Existing Schottenloher geometry anchors
  are enough for vector fields, not stress-energy.  A1 is required before
  promoting the formula.
- **Concrete edits:** Add an explicit "proposal/continuum mnemonic" sentence at
  the rotation formula and route actual lattice rotations through future
  momentum-density/current conventions.
- **Acceptance checks:** `make check-report-shards`; `make report`.
- **Estimated change size:** 20--50 LOC.
- **Dependencies:** None; should land before new stress-energy shards.

### R5. Narrow finite-periodic numerical claims in CA-28

- **Goal:** State that the current finite periodic suite checks symbols and
  stiffness spectra only.
- **Why:** The suite does not yet test finite boosts, finite rotations, branch
  choices, or generator commutator closure.
- **Exact files likely touched:** `report/sections/28_gaussian_boson_numerical_suite.tex`.
- **Source/convention prerequisites:** Current `src/GaussianBosons.jl`,
  `src/GaussianBosonNumerics.jl`, and `test/runtests.jl`.
- **Concrete edits:** Add a boundary sentence near the status/current surface
  section.  Keep next milestones as proposed checks, not achieved coverage.
- **Acceptance checks:** `make check-report-shards`; `make report`.
- **Estimated change size:** 15--40 LOC.
- **Dependencies:** None.

## 3. Julia and Test Hardening

### J1. Add centered periodic momentum labels

- **Goal:** Provide a branch-aware finite momentum grid for low-energy windows
  and future generator residual tests.
- **Why:** Current `periodic_momentum_grid` reports `L-1` as a large positive
  momentum rather than the small negative representative.
- **Exact files likely touched:** `src/GaussianBosonNumerics.jl`,
  `test/runtests.jl`, `report/sections/28_gaussian_boson_numerical_suite.tex`,
  `INDEX.md`.
- **Source/convention prerequisites:** C4.  Cite
  `literature/md/2010.11121/2010.11121.md:274--293` for centered dual lattice
  if matching that source.
- **Concrete edits:** Add `centered_periodic_momentum_grid` returning integer
  dual labels plus physical representatives.  Keep the uncentered grid only for
  branch-insensitive symbol spectra.
- **Acceptance checks:** `Pkg.test()`; add explicit tests for even and odd sizes,
  including `L=4` where `3pi/2` should be represented as `-pi/2`.
- **Estimated change size:** 60--100 LOC.
- **Dependencies:** C4.

### J2. Add Fourier eigenvector tests, not only sorted eigenvalues

- **Goal:** Pin the finite Fourier convention by testing eigenvectors with their
  assigned symbol values.
- **Why:** Sorted spectra can hide offset-direction, sign, and label mistakes.
- **Exact files likely touched:** `src/GaussianBosonNumerics.jl`,
  `test/runtests.jl`, `report/sections/28_gaussian_boson_numerical_suite.tex`,
  `INDEX.md`.
- **Source/convention prerequisites:** C4 and J1.  Use the identity already
  stated in CA-28.
- **Concrete edits:** Add a small Fourier-vector helper or local test helper.
  Test sizes with every `L_a > 2R`, mixed odd/even sizes, and one off-axis
  symmetric coefficient pair such as `(1,1)` and `(-1,-1)`.
- **Acceptance checks:** `Pkg.test()`; mutation-check by flipping periodic
  offset direction and confirming the eigenvector test fails.
- **Estimated change size:** 70--100 LOC.
- **Dependencies:** J1.

### J3. Add an independent finite-difference derivative oracle

- **Goal:** Check `boost_time_symbol_from_coefficients` against central
  differences of `scalar_quadratic_symbol`.
- **Why:** Current boost-time checks compare closed-form KG helpers with the
  coefficient helper; a generic derivative oracle catches sign and `1/2`
  mistakes.
- **Exact files likely touched:** `test/runtests.jl`; optionally
  `src/GaussianBosonNumerics.jl` if a reusable finite-difference helper is added.
- **Source/convention prerequisites:** C5 for tolerances.
- **Concrete edits:** Add generic symmetric finite-range coefficient sets in
  `d=1,2,3`, including off-axis terms.  Compare coefficient derivative to
  central differences away from branch cuts.
- **Acceptance checks:** `Pkg.test()`; mutation-check derivative sign and the
  `1/2` factor.
- **Estimated change size:** 50--90 LOC.
- **Dependencies:** C5.

### J4. Add structural coefficient validation

- **Goal:** Fail closed on coefficient data that violates the scalar Gaussian
  convention.
- **Why:** Current helpers assume real paired offsets, positivity, and common
  dimension more strongly than they validate them.
- **Exact files likely touched:** `src/GaussianBosons.jl`,
  `src/GaussianBosonNumerics.jl`, `test/runtests.jl`,
  `report/sections/28_gaussian_boson_numerical_suite.tex`, `INDEX.md`.
- **Source/convention prerequisites:** C5 and the existing scalar coefficient
  convention (j).
- **Concrete edits:** Add `validate_scalar_coefficients` for integer offsets,
  common dimension, real coefficients, and `V_r=V_-r`.  Use it in compiler-facing
  helpers or add strict variants if preserving low-level helper flexibility.
- **Acceptance checks:** `Pkg.test()` with unpaired offset, complex coefficient,
  dimension mismatch, and missing `-r` failure cases.
- **Estimated change size:** 80--110 LOC; split structural validation from
  positivity/minima if it grows.
- **Dependencies:** C5.

### J5. Add positivity and patch/minimum witnesses

- **Goal:** Add finite-grid stability and single-patch data before Hessian checks
  can be used as compiler gates.
- **Why:** A model can pass the Hessian residual and still be unstable or have
  unwanted low-energy species.
- **Exact files likely touched:** `src/GaussianBosonNumerics.jl`,
  `test/runtests.jl`, `report/sections/27_gaussian_boson_residual_conditions.tex`,
  `report/sections/28_gaussian_boson_numerical_suite.tex`.
- **Source/convention prerequisites:** C3 and C5.
- **Concrete edits:** Add `symbol_minimum_data` or a similar helper returning
  minima values/locations.  Add the Hessian-passing unstable witness
  `V_0=0`, `V_{+/-1}=1`, `V_{+/-2}=-0.5`, and strengthen doubler tests to check
  Hessian success plus minima counts/locations in `d=1,2,3`.
- **Acceptance checks:** `Pkg.test()`; verify the unstable symbol is rejected
  loudly when positivity is requested.
- **Estimated change size:** 80--110 LOC.
- **Dependencies:** J4 preferred.

### J6. Add rotation and boost-boost residual helpers

- **Goal:** Cover the non-boost-time residuals that CA-26 currently derives only
  in prose.
- **Why:** CA-26 lists rotation-Hamiltonian and boost-boost residuals, but no
  tests check them.
- **Exact files likely touched:** `src/GaussianBosons.jl` or
  `src/GaussianBosonNumerics.jl`, `test/runtests.jl`,
  `report/sections/26_gaussian_boson_generator_algebra.tex`,
  `report/sections/28_gaussian_boson_numerical_suite.tex`, `INDEX.md`.
- **Source/convention prerequisites:** C1, C2, C4, C5.
- **Concrete edits:** Add helper(s) for
  `k_b partial_a omega^2 - k_a partial_b omega^2` and the residual data
  `R_b X_a - R_a X_b` at the symbol/coefficient level.  Test KG low-energy
  scaling, anisotropic failure, and doubler failure.  Do not model finite-grid
  CCRs as exact.
- **Acceptance checks:** `Pkg.test()`; report wording remains "symbol residual"
  until domain/self-adjointness is proved.
- **Estimated change size:** 90--140 LOC; split rotation residual and
  boost-boost residual into two commits if needed.
- **Dependencies:** C1, C2, C4.

## 4. Source Acquisition Queue

### A1. Register a continuum stress-energy / Poincare-generator source

- **Goal:** Acquire a line-citable source for free scalar or general QFT
  stress-energy components, Poincare generators as spatial integrals,
  improvement ambiguity, metric signs, and normalization.
- **Why:** CA-13 and future stress-energy shards cannot promote local density
  formulas without this.
- **Exact files likely touched:** `references/<topic>/...`,
  `references/<topic>/SOURCES.md`, possibly `references/text/...`,
  `CONVENTIONS.md`, CA-13 or future stress-energy shards.
- **Source/convention prerequisites:** Prefer Weinberg QFT Vol. 1 if Tobias
  supplies/registers the local file, or another legal local source.  For
  paywalled sources, ask Tobias to use TIB VPN; do not use pirate sources.
- **Concrete edits:** Store source, record bibliographic data, retrieval date,
  DOI/arXiv/URL, SHA256, and text/OCR anchors.  Only then add conventions or
  report citations.
- **Acceptance checks:** Source manifest complete; cited line anchors verified
  by `rg`/manual read; `make report` if report citations are added.
- **Estimated change size:** Source-size dependent; keep manifest/report edits
  under 50--100 LOC.
- **Dependencies:** Required before stress tensor formulas are promoted beyond
  proposal.

### A2. Register the original Koo-Saleur source

- **Goal:** Promote the original Koo--Saleur paper from acquisition target to
  local source, if legally available.
- **Why:** CA-10, CA-14, and CA-17 currently cite a secondary local treatment and
  mark the original as not canonical.
- **Exact files likely touched:** `references/<topic>/...`,
  `references/<topic>/SOURCES.md`, `report/sections/14_koo_saleur_prototype.tex`,
  possibly CA-10/CA-17.
- **Source/convention prerequisites:** Bibliography metadata indicates
  `hep-th/9312156`; fetch/register from a legal source.
- **Concrete edits:** Add PDF/text/manifest.  Update CA-14 only for claims the
  original actually supports; keep the OAR/free-fermion convergence source
  separate.
- **Acceptance checks:** Source manifest complete; `make report`.
- **Estimated change size:** 30--80 report/manifest LOC plus source files.
- **Dependencies:** None; useful before KS-style stress shards.

### A3. Acquire the discrete Gaussian/free-field Virasoro source

- **Goal:** Register the bibliography-only discrete Gaussian Virasoro paper.
- **Why:** CA-23 names this as a needed source for Gaussian stress/Virasoro
  proposals.
- **Exact files likely touched:** `references/<topic>/...`,
  `references/<topic>/SOURCES.md`, CA-23 or future stress-energy shards.
- **Source/convention prerequisites:** Use bibliography metadata already present
  in `literature/references.bib`; verify legal availability.
- **Concrete edits:** Register source and extract line anchors for the specific
  lattice free-boson Virasoro claims.
- **Acceptance checks:** Source manifest complete; no report claim added without
  exact anchors.
- **Estimated change size:** Source-size dependent; 20--60 manifest/report LOC.
- **Dependencies:** A1/A2 not strictly required.

### A4. Acquire or locally derive harmonic-chain energy-current formulas

- **Goal:** Back the Gaussian `T_01` and `T_11` candidates with either a source
  or a checked local derivation.
- **Why:** The current report has a generic first-moment identity, not a
  Gaussian-specific local energy-current/stress-current layer.
- **Exact files likely touched:** `references/<topic>/...` and
  `SOURCES.md` if sourced; otherwise `src/`, `test/runtests.jl`, a future
  stress-energy shard, `INDEX.md`.
- **Source/convention prerequisites:** C6 density convention.  If deriving
  locally, add tests before report claims.
- **Concrete edits:** Either register a harmonic-chain/free-boson current source
  or derive the continuity equation for the chosen `h_j` split with explicit
  endpoint terms.
- **Acceptance checks:** Source anchors verified, or `Pkg.test()` catches the
  local continuity identity.
- **Estimated change size:** 50--100 LOC if local derivation/test; source
  acquisition separate.
- **Dependencies:** C6.

## 5. Stress-Energy Proposal Shards

### S1. Add the Gaussian real-space density shard

- **Goal:** Create the missing bridge from total symbol data to local density
  data.
- **Why:** All reviewers identified the absent `h_x` layer as the blocker for
  stress-energy work.
- **Exact files likely touched:** `report/sections/29_gaussian_boson_real_space_density.tex`,
  `report.tex`, `report/README.md`, `report/SHARD_CATALOG.md`,
  `CONVENTIONS.md`.
- **Source/convention prerequisites:** C6; existing scalar lattice source
  `literature/md/2010.11121/2010.11121.md:598--623`.  A1 only needed if this
  shard calls `h_x` a stress-energy component rather than a density convention.
- **Concrete edits:** New shard with source/dependency block, density split,
  support accounting, boundary policy, normal-ordering/vacuum-subtraction
  deferral, and explicit statement that convergence/stress tensor status is
  proposal-level.
- **Acceptance checks:** `make check-report-shards`; `make report`.
- **Estimated change size:** 120--220 LOC total; split metadata/scaffold and
  body if needed.
- **Dependencies:** C6; R2 should reserve the slot first.

### S2. Add a 1+1 lattice stress-energy candidate shard

- **Goal:** Define candidate `T_{00}^{lat}`, `T_{01}^{lat}`, `T_{10}^{lat}`,
  and `T_{11}^{lat}` in 1+1 dimensions with continuity equations and endpoint
  terms.
- **Why:** The viable near-term stress-energy proposal is one-dimensional and
  open-boundary first, using CA-12 as the checked current identity.
- **Exact files likely touched:** likely
  `report/sections/30_gaussian_boson_1d_stress_candidates.tex`,
  `report.tex`, `report/README.md`, `report/SHARD_CATALOG.md`,
  maybe `CONVENTIONS.md`.
- **Source/convention prerequisites:** S1, A1 for continuum stress-tensor
  notation/signs, A4 or a local derivation for harmonic-chain current formulas.
  Use Schottenloher 1+1 CFT stress-tensor anchors only in their CFT scope.
- **Concrete edits:** State `T_00=h_j`; define energy-current candidate from the
  discrete continuity equation; keep `T_10` as comparison to the Gaussian
  `dGamma(k)` target until equality is tested; define `T_11` operationally as
  momentum current, not as a trace-free assumption.
- **Acceptance checks:** `make check-report-shards`; `make report`; no
  convergence language beyond Proposal unless tests/source support it.
- **Estimated change size:** 150--220 LOC; split into `T_00/T_01` and
  `T_10/T_11` if it grows.
- **Dependencies:** S1, A1, A4.

### S3. Add current-vs-symbol equivalence checks

- **Goal:** Compare the chosen real-space integrated current with the one-
  particle momentum or boost-time symbol target for the nearest-neighbour
  Gaussian chain.
- **Why:** CA-12 real-space current and CA-26 `P=k` currently live in separate
  layers.
- **Exact files likely touched:** `src/GaussianBosons.jl` or a new small helper,
  `src/GaussianBosonNumerics.jl`, `test/runtests.jl`,
  likely `report/sections/31_gaussian_current_symbol_equivalence.tex`,
  `report.tex`, `report/README.md`, `report/SHARD_CATALOG.md`, `INDEX.md`.
- **Source/convention prerequisites:** C1, C2, C4, C6, S1, A4.
- **Concrete edits:** For an open nearest-neighbour Gaussian chain, express
  quadratic observables as finite phase-space matrices.  Test energy continuity,
  endpoint terms, and low-energy agreement of the current candidate with the
  centered momentum target.  Keep periodic first moments out until branch policy
  exists.
- **Acceptance checks:** `Pkg.test()` plus `make report`; tests must assert
  identities or quantified residuals, not just no errors.
- **Estimated change size:** 80--140 LOC for the first helper/test, plus a
  separate 100--180 LOC report shard.
- **Dependencies:** S1, A4, J1.

### S4. Add a higher-dimensional cell-current proposal shard

- **Goal:** State the `d=2,3` problem with oriented cells/faces, local energy
  currents, momentum densities, stress components, rotations, and boundary
  policies.
- **Why:** Higher-dimensional stress tensors require local tensor components,
  not just total momentum from scalar ramps.
- **Exact files likely touched:** likely
  `report/sections/32_gaussian_higher_dimensional_cell_currents.tex`,
  `report.tex`, `report/README.md`, `report/SHARD_CATALOG.md`,
  `CONVENTIONS.md` if orientation is fixed.
- **Source/convention prerequisites:** A1 for continuum tensor conventions; C6
  for density split; no claim of convergence without tests.
- **Concrete edits:** Define oriented support data as compiler input.  Formulate
  energy continuity, momentum continuity, antisymmetric-stress rotation residual,
  trace/improvement diagnostics, and open-vs-periodic boundary alternatives.
- **Acceptance checks:** `make check-report-shards`; `make report`; all claims
  labelled Proposal unless sourced/checked.
- **Estimated change size:** 140--220 LOC; split orientation convention from
  proposal body if needed.
- **Dependencies:** S1, A1.

### S5. Add a stress-energy numerical suite only after density/current choices

- **Goal:** Extend the Julia layer from symbol examples to local continuity and
  current-density failure witnesses.
- **Why:** Stress-energy should not jump from one-particle symbols to "tensor
  realized" without local conservation tests.
- **Exact files likely touched:** `src/GaussianBosons.jl`,
  `src/GaussianBosonNumerics.jl`, `test/runtests.jl`, `INDEX.md`,
  likely `report/sections/33_gaussian_stress_numerical_suite.tex`,
  `report.tex`, `report/README.md`, `report/SHARD_CATALOG.md`.
- **Source/convention prerequisites:** S1--S3, A4, C5.  For periodic tests, J1
  and a branch/Fourier convention are required.
- **Concrete edits:** Add open-boundary tests for local energy continuity,
  integrated current versus centered low-energy momentum, explicit endpoint
  terms, and anisotropic/doubler failures at the current-density level.
- **Acceptance checks:** `Pkg.test()`; `make check-report-shards`; `make report`.
- **Estimated change size:** 80--120 LOC for first tests; report shard separate.
- **Dependencies:** S1, S2, S3.

## Execution Order Summary

1. Land C1--C4 and R1--R5 to remove current overclaims and convention gaps.
2. Land C5 plus J1--J5 to make the numerical layer branch-aware and fail-closed.
3. Acquire A1--A4 as sources become available; do not block report-only
   containment on them.
4. Land C6 and S1 before any stress-energy component proposal.
5. Land S2--S5 only after the required sources/conventions/tests for each shard
   are present.
