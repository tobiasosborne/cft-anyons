# Gaussian Lorentz Action-Plan Orchestration

Purpose: durable coordination record for serial execution of
`ACTION_PLAN.md`.  If conversation context is compacted, resume from this file,
then read the action plan, the current `git status`, and the latest worklog
entry.

Protocol:

- One action-plan step is delegated to one subagent at a time.
- The parent agent reviews every subagent patch before committing.
- A step is not complete until relevant gates pass and a worklog entry records
  the result.
- Commit and push coherent slices; do not leave completed steps only in local
  conversation context.

## Step Status

| Step | Status | Subagent | Result / notes |
| --- | --- | --- | --- |
| C1 | Complete | `019e790c-6ac9-7990-9e43-9be09e34ca34` (`Confucius`) | Added convention (k) and updated CA-11, CA-24, CA-26; parent tightened inverse-flow wording before landing. |
| C2 | Complete | `019e7914-909d-71f0-87d4-711abd3494dd` (`Boyle`) | CA-24--CA-26 now explicitly use flat local-symbol `L^2(dk)` algebra; OAR/mass-shell bridge remains an open proof obligation. |
| C3 | Complete | `019e7919-7dba-7b21-8e02-7454d14a6858` (`Fermat`) | Recorded nonnegative mass label, positive-dispersion generator scope, and massless doubler as coefficient-level rejection only. |
| C4 | Complete | `019e7921-7709-7431-a8e9-50cec9e57ed4` (`Aristotle`) | Split smooth-patch differential algebra from finite periodic symbol/eigenvalue checks. |
| C5 | Complete | `019e7927-20a8-7bb0-bff1-fe2539a686c3` (`Epicurus`) | Added named Gaussian numerical tolerances and threaded them through symbol, eigenvalue, minima, and small-spacing checks. |
| C6 | Complete | `019e7931-4366-7781-90aa-0666928bff72` (`Harvey`) | Added convention (l) and CA-29 for Gaussian real-space energy-density split; no stress-tensor claim. |
| R1 | Complete | `019e7939-5cff-74c1-85be-419101a1a77a` (`Aquinas`) | Demoted CA-26 checked coverage and formalized dGamma language; parent synchronized shard/catalog summary. |
| R2 | Complete | `019e793e-01a5-7280-b32d-57a00392a479` (`Galileo`) | Replaced stale CA-23 roadmap with actual CA-24--CA-29 roles and queued proposal follow-ups. |
| R3 | Complete | `019e7942-eb85-7bc0-b26d-bf536840f3f6` (`Popper`) | Expanded KS and OAR source-anchor ranges in CA-14--CA-17 and CA-23 without new claims. |
| R4 | Complete | `019e7947-8ec3-77b1-88fc-7c98019df9be` (`Volta`) | Qualified CA-13 angular-momentum density as continuum mnemonic and deferred lattice rotation formula until current conventions exist. |
| R5 | Complete | `019e794b-6426-7381-973c-b2852c96284f` (`Nietzsche`) | Narrowed CA-28 finite-periodic coverage to symbols, stiffness spectra, minima counts, and implemented coefficient residuals/Hessians. |
| J1 | Complete | `019e794e-7fb9-70c0-a1f7-1a71d4926fbf` (`Kuhn`) | Added centered periodic momentum labels for branch-aware low-energy windows, with even/odd tests and convention note. |
| J2 | Complete | `019e7956-628b-7152-aba9-e962d2f24b2a` (`Raman`) | Added finite Fourier vector helper and assigned-eigenvalue tests, including direction sentinel. |
| J3 | Complete | `019e795f-7356-7501-b435-a8fc6711feec` (`Schrodinger`) | Added a test-local central finite-difference oracle for the boost-time coefficient helper in d=1,2,3. |
| J4 | Complete | `019e7968-63d3-7010-8a23-e7cca580ed2d` (`Sagan`) | Added strict scalar coefficient validation and loud negative tests. |
| J5 | Complete | `019e7970-b245-7a42-9153-e0ae276cc11c` (`Beauvoir`) | Added finite-grid minimum data, a nonnegative gate, and Hessian-insufficiency witnesses. |
| J6 | Complete | `019e797a-f922-71e1-8e79-27a75c489125` (`Jason`) | Added sampled smooth-symbol rotation and boost-boost residual helpers. |
| A1 | Complete | `019e7984-d92f-7940-9a7e-09ba5930619a` (`Hilbert`) | Registered Weinberg QFT Vol. I with targeted OCR anchors for stress-energy and Poincare generators. |
| A2 | Complete | `019e7990-12ad-7151-a8e4-5604d5e29783` (`Feynman`) | Registered original Koo-Saleur arXiv source and updated KS source-boundary wording. |
| A3 | Complete | `019e799c-3578-70f0-93d9-6b026a436206` (`Hegel`) | Registered discrete GFF Virasoro source with version-pinned arXiv v1 TeX anchors. |
| A4 | Complete | `019e79aa-6791-78b0-8cbc-5d97538e9936` (`Hypatia`) | Added finite open-chain Gaussian energy-current helpers/tests for the local `T_01` candidate; `T_11` remains pending. |
| S1 | Complete | `019e79b4-eb8c-7193-a6a0-3aaf60ed8178` (`Kierkegaard`) | Audited CA-29 against S1 and found the density shard already satisfies the step; no report edits needed. |
| S2 | Complete | `019e79b7-67f8-75f3-bab1-61384f352692` (`Planck`) | Added CA-30 1+1 lattice stress-energy candidate shard with checked `T_01` seed and proposal-level `T_10/T_11`. |
| S3 | Complete | `019e79be-23a4-7641-8544-9e982559ba02` (`Faraday`) | Added CA-31 and tests for the 1D nearest-neighbour integrated-current symbol matching the KG boost-time symbol. |
| S4 | Complete | `019e79c6-cc6d-7d70-b7ff-5d1e1deaf713` (`Wegener`) | Added CA-32 higher-dimensional cell-current proposal shard with oriented support data as compiler input. |
| S5 | Pending | - | Stress-energy numerical suite. |

## Running Notes

- 2026-05-30: Orchestration started.  `make ci-before-push` was green at
  commit `e38a5b9`; working tree clean before beginning C1.
- 2026-05-30: C1 delegated to worker
  `019e790c-6ac9-7990-9e43-9be09e34ca34` (`Confucius`) with write scope
  `CONVENTIONS.md`, CA-11, CA-24, and CA-26.
- 2026-05-30: C1 reviewed by parent.  The worker patch was accepted after
  replacing an ambiguous "anti-homomorphism at the unitary level" phrase with
  the explicit inverse-flow/Stone-generator convention.  Landing checks passed:
  `make check-report-shards`, `make report`, and `git diff --check`.
- 2026-05-30: C1 pushed as `021cd6f`.  C2 delegated to worker
  `019e7914-909d-71f0-87d4-711abd3494dd` (`Boyle`) with write scope
  `CONVENTIONS.md`, CA-24, CA-25, and CA-26.
- 2026-05-30: C2 reviewed by parent and accepted.  Landing checks passed:
  `make check-report-shards`, `make report`, and `git diff --check`.
- 2026-05-30: C2 pushed as `a2fd2b0`.  C3 delegated to worker
  `019e7919-7dba-7b21-8e02-7454d14a6858` (`Fermat`) with write scope
  `CONVENTIONS.md`, CA-24, CA-25, CA-27, CA-28, and `test/runtests.jl`.
- 2026-05-30: C3 reviewed by parent and accepted after tightening CA-25 so
  `m>0` is sufficient only for the nearest-neighbour KG positive-dispersion
  family, while arbitrary coefficient symbols still require `omega>0` on the
  chosen patch.  `make ci-before-push` passed.
- 2026-05-30: C3 pushed as `6956597`.  C4 delegated to worker
  `019e7921-7709-7431-a8e9-50cec9e57ed4` (`Aristotle`) with write scope
  `CONVENTIONS.md`, CA-17, CA-23, CA-26, and CA-28.
- 2026-05-30: C4 reviewed by parent and accepted.  `make ci-before-push` and
  `git diff --check` passed; `report.pdf` did not change in the parent gate.
- 2026-05-30: C4 pushed as `def5c32`.  C5 delegated to worker
  `019e7927-20a8-7bb0-bff1-fe2539a686c3` (`Epicurus`) with write scope
  `CONVENTIONS.md`, Gaussian Julia helpers/tests, and CA-28.
- 2026-05-30: C5 reviewed by parent and accepted.  `make ci-before-push` and
  `git diff --check` passed; structural coefficient validation remains deferred
  to J4.
- 2026-05-30: C5 pushed as `241bdd1`.  C6 delegated to worker
  `019e7931-4366-7781-90aa-0666928bff72` (`Harvey`) with write scope
  `CONVENTIONS.md`, new CA-29 density shard, and report shard maps.
- 2026-05-30: C6 reviewed by parent and accepted.  `make ci-before-push` passed;
  parent then forced `latexmk -pdf -g report.tex` so `report.pdf` includes the
  new CA-29 shard.
- 2026-05-30: C6 pushed as `3acf9a1`.  R1 delegated to worker
  `019e7939-5cff-74c1-85be-419101a1a77a` (`Aquinas`) with write scope CA-26.
- 2026-05-30: R1 reviewed by parent and accepted after synchronizing the CA-26
  shard summary with `report/SHARD_CATALOG.md`.  `make ci-before-push` passed.
- 2026-05-30: R1 pushed as `9db065d`.  R2 delegated to worker
  `019e793e-01a5-7280-b32d-57a00392a479` (`Galileo`) with write scope CA-23.
- 2026-05-30: R2 reviewed by parent and accepted.  `make ci-before-push` and
  `git diff --check` passed; `report.pdf` did not change in the parent gate.
- 2026-05-30: R2 pushed as `c7fe6cd`.  R3 delegated to worker
  `019e7942-eb85-7bc0-b26d-bf536840f3f6` (`Popper`) with write scope CA-14,
  CA-15, CA-16, CA-17, and CA-23.
- 2026-05-30: R3 reviewed by parent and accepted.  `make ci-before-push` and
  `git diff --check` passed; `report.pdf` did not change in the parent gate.
- 2026-05-30: R3 pushed as `4be9c56`.  R4 delegated to worker
  `019e7947-8ec3-77b1-88fc-7c98019df9be` (`Volta`) with write scope CA-13 and
  optional CA-16.
- 2026-05-30: R4 reviewed by parent and accepted.  `make ci-before-push` and
  `git diff --check` passed; `report.pdf` did not change in the parent gate.
- 2026-05-30: R4 pushed as `ddf1bad`.  R5 delegated to worker
  `019e794b-6426-7381-973c-b2852c96284f` (`Nietzsche`) with write scope CA-28.
- 2026-05-30: R5 reviewed by parent and accepted.  `make ci-before-push` and
  `git diff --check` passed; `report.pdf` did not change in the parent gate.
- 2026-05-30: R5 pushed as `803fde0`.  J1 delegated to worker
  `019e794e-7fb9-70c0-a1f7-1a71d4926fbf` (`Kuhn`) with write scope
  `src/GaussianBosonNumerics.jl`, tests, CA-28, and `INDEX.md`.
- 2026-05-30: J1 reviewed by parent and accepted after adding the centered
  momentum-label branch to CONVENTIONS.md (j).  `make ci-before-push` and
  `git diff --check` passed.
- 2026-05-30: J1 pushed as `0784384`.  J2 delegated to worker
  `019e7956-628b-7152-aba9-e962d2f24b2a` (`Raman`) with write scope
  Gaussian numerics helper/tests, CA-28, and `INDEX.md`.
- 2026-05-30: J2 reviewed by parent and accepted after adding the finite Fourier
  phase convention to CONVENTIONS.md (j).  Worker mutation check flipped `x+r`
  to `x-r` and the new direction sentinel failed as intended.  `make
  ci-before-push` and `git diff --check` passed.
- 2026-05-30: J2 pushed as `987c04c`.  Worklog chunk 006 started.  J3 delegated
  to worker `019e795f-7356-7501-b435-a8fc6711feec` (`Schrodinger`) with write
  scope tests, optional Gaussian numerics helper, and optional CA-28.
- 2026-05-30: J3 reviewed by parent and accepted.  The worker patch compares
  `boost_time_symbol_from_coefficients` against a test-local central difference
  of the separate scalar-symbol evaluator, including the `1/2` factor.  Worker
  mutation probes for a sign flip and missing `1/2` failed as intended.  `make
  ci-before-push` passed.
- 2026-05-30: J3 landed in the finite-difference oracle slice.  Next step is
  J4 structural coefficient validation.
- 2026-05-30: J4 delegated to worker
  `019e7968-63d3-7010-8a23-e7cca580ed2d` (`Sagan`).  Target is a strict
  scalar-coefficient validator for common dimension, integer offsets, real
  coefficients, and paired \(V_r=V_{-r}\) data, with loud failure tests.
- 2026-05-30: J4 reviewed by parent and accepted after adding default-wiring
  rejection tests for `scalar_quadratic_symbol` and
  `boost_time_symbol_from_coefficients`.  `make ci-before-push` and
  `git diff --check` passed.
- 2026-05-30: J4 pushed as `e636d34`.  J5 delegated to worker
  `019e7970-b245-7a42-9153-e0ae276cc11c` (`Beauvoir`).  Target is finite-grid
  minimum data, positivity witnesses, and explicit examples showing Hessian
  success is not enough.
- 2026-05-30: J5 reviewed by parent and accepted.  The new helper reports
  finite-grid minimum value/count/location, the unstable \(V_0=0,V_{\pm1}=1,
  V_{\pm2}=-1/2\) witness passes the Hessian residual but fails finite-grid
  nonnegativity, and the doubler minima are recorded in d=1,2,3.  `make
  ci-before-push` and `git diff --check` passed.
- 2026-05-30: J5 pushed as `db297a8`.  J6 delegated to worker
  `019e797a-f922-71e1-8e79-27a75c489125` (`Jason`).  Target is symbolic
  rotation and boost-boost residual helpers without asserting finite-grid
  coordinate commutators.
- 2026-05-30: J6 reviewed by parent and accepted after adding antisymmetry
  checks for the sampled rotation matrix and boost-boost coefficient tensor.
  The helper surface remains smooth-symbol data only; no finite-grid coordinate
  generator or second-quantized closure claim was added.  `make ci-before-push`
  and `git diff --check` passed.
- 2026-05-30: J6 pushed as `af3e331`.  A1 started.  Parent found a local
  Weinberg QFT Vol. 1 DJVU in
  `/home/tobiasosborne/Projects/Lyr.jl/docs/references/`; A1 must register only
  legally local/source-manifested material and verify line anchors before any
  report claim uses it.
- 2026-05-30: A1 reviewed by parent and accepted as source registration only.
  Weinberg QFT Vol. I is now registered under `references/qft/` with SHA256
  `39fdcaeb42d073b60442866f793589555ad4a4c772b56a17915add9d6c5829df`.
  Targeted OCR anchors cover Noether currents, energy-momentum tensor,
  Belinfante tensor, rotation/boost generators, and Lorentz commutator caveats.
  General improvement ambiguity remains unsourced; exact formula promotion
  still requires page-image checking because OCR is noisy.  `make
  check-report-shards` and `git diff --check` passed.
- 2026-05-30: A1 pushed as `d234015`.  A2 delegated to worker
  `019e7990-12ad-7151-a8e4-5604d5e29783` (`Feynman`).  Target is legal
  registration of the original Koo--Saleur source `hep-th/9312156` and only
  report updates supported by verified local anchors.
- 2026-05-30: A2 reviewed by parent and accepted.  The original Koo--Saleur
  arXiv source is registered under `references/lattice-symmetry/`, with source
  TeX anchors for Hamiltonian-density Fourier modes, commutator corrections,
  vacuum subtraction, finite-\(L\) non-closure, and scaling-limit caveats.
  CA-14 now treats the original paper as source-local prototype while keeping
  the rigorous convergence theorem attached to the later free-fermion/OAR
  source.  `make check-report-shards`, `make report`, and `git diff --check`
  passed.
- 2026-05-30: A2 pushed as `d7d0483`.  A3 delegated to worker
  `019e799c-3578-70f0-93d9-6b026a436206` (`Hegel`).  Parent found legal source
  leads for Hongler--Johansson Viklund--Kytola's discrete Gaussian free-field
  Virasoro preprint via the University of Helsinki and EPFL Infoscience records.
- 2026-05-30: A3 reviewed by parent and accepted.  The source registration
  uses the EPFL open-access PDF plus arXiv `1307.4104v1` source TeX, with
  anchors for square-grid dGFF change-of-measure operators, current modes,
  Sugawara construction, and two commuting `c=1` Virasoro representations.
  The report update keeps the boundary explicit: this source does not supply
  continuum stress-energy/Poincare formulas or harmonic-chain energy-current
  identities.  `make check-report-shards`, `make report`, and `git diff
  --check` passed before landing.
- 2026-05-30: A3 pushed as `056c959`.  A4 delegated to worker
  `019e79aa-6791-78b0-8cbc-5d97538e9936` (`Hypatia`).  Target is a checked
  local derivation for the finite open 1D nearest-neighbour scalar Gaussian
  energy-current orientation under CA-29/CONVENTIONS.md (l), explicitly only
  backing the future `T_01` candidate and not solving `T_11`.
- 2026-05-30: A4 reviewed by parent and accepted after worker push `f3f1705`.
  The patch adds phase-space quadratic commutator matrices, CA-29 open-chain
  Gaussian density matrices, bond currents `J_{j+1/2}=i[e_j,e_{j+1}]`, a
  closed-form current matrix independent of the onsite coefficient, and finite
  endpoint/interior continuity tests.  Parent reran `Pkg.test()`,
  `make check-report-shards`, and `git diff --check`; all passed.  Scope is
  explicitly local finite-open-chain `T_01` evidence only; no continuum
  stress-tensor or `T_11` claim landed.
- 2026-05-30: A4 completion recorded and pushed as `04100e7`.  S1 delegated to
  worker `019e79b4-eb8c-7193-a6a0-3aaf60ed8178` (`Kierkegaard`) as a
  reconciliation step, because C6 already created CA-29 and convention (l).
  Worker should patch only if CA-29 misses an S1 acceptance item.
- 2026-05-30: S1 reviewed by parent and accepted as already complete.  Worker
  found CA-29 has the required source/dependency block, cell-volume and
  density split, equal-endpoint support accounting, boundary policy,
  vacuum-subtraction deferral, and explicit non-stress-tensor status; shard
  maps already include CA-29.  Worker changed no files and ran
  `make check-report-shards` plus `git diff --check`.
- 2026-05-30: S1 audit recorded and pushed as `d24da2c`.  S2 delegated to
  worker `019e79b7-67f8-75f3-bab1-61384f352692` (`Planck`).  Target is a new
  CA-30 report shard for 1+1 lattice stress-energy candidates: checked
  finite-open-chain `T_01` seed, `T_10` as a pending current-vs-symbol
  comparison target, and `T_11` only as a future momentum-current witness.
- 2026-05-30: S2 reviewed by parent and accepted after adding a small CA-23
  roadmap synchronization.  CA-30 defines \(T_{00}\) from CA-29, records the
  checked finite-open-chain \(T_{01}\) continuity seed from A4, keeps \(T_{10}\)
  as the pending S3 current-vs-symbol comparison target, and defines \(T_{11}\)
  only operationally as a future momentum-current witness.  `make
  check-report-shards`, `make report`, and `git diff --check` passed.
- 2026-05-30: S2 pushed as `d7430e3`.  S3 delegated to worker
  `019e79be-23a4-7641-8544-9e982559ba02` (`Faraday`).  Target is the first
  checked bridge between the A4 real-space energy current and the CA-26
  boost-time/momentum-symbol layer, preferably a nearest-neighbour current
  symbol identity plus low-energy agreement, with periodic first moments and
  open-chain `dGamma(k)` equivalence left unclaimed unless actually proved.
- 2026-05-30: S3 reviewed by parent and accepted after adding a CA-23 roadmap
  synchronization.  The landed invariant is
  `nearest_neighbor_integrated_energy_current_symbol(k; bond=-epsilon^-2) =
  kg_lattice_boost_time_symbol(k)` in 1D, plus a small-spacing check against
  centered continuum momentum and a sign sentinel.  The result is explicitly a
  translation-invariant symbol bridge only: no periodic coordinate, finite
  open-chain momentum generator, `dGamma(k)` equivalence, or continuum
  convergence claim.  `Pkg.test()`, `make check-report-shards`, `make report`,
  and `git diff --check` passed.
- 2026-05-30: S3 committed and pushed as `005d52c`.  S4 delegated to worker
  `019e79c6-cc6d-7d70-b7ff-5d1e1deaf713` (`Wegener`).  Target is a CA-32
  proposal shard for `d=2,3` cell/face current data: energy continuity,
  momentum-density and stress-current witnesses, rotation/antisymmetry
  diagnostics, trace/improvement diagnostics, and boundary alternatives, with
  orientation treated as compiler input rather than an unproved convention.
- 2026-05-30: S4 reviewed by parent and accepted.  CA-32 is report-only and
  keeps oriented cells/faces, incidence signs, boundary faces, energy fluxes,
  momentum densities, and stress currents as compiler payload data.  It does
  not edit CONVENTIONS.md, claim convergence, infer `T_a0` from `T_0a`, or
  assume symmetric stress.  `make check-report-shards`, `make report`, and
  `git diff --check` passed.
