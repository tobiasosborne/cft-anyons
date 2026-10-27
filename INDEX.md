# INDEX — scripts, runs, and outputs

The manifest connecting producer scripts, run bundles, generated data/figures,
and the report shards that cite them (AGENTS.md Law 3). A numerical claim in the
lab book points here, to the script and run artifact that back it.

## Scripts

| Script | Purpose |
|---|---|
| `scripts/python/run_four_port_consistency.py` | Exact four-port sewing/Gram/crossing/semion-tensor probes; fifteen test groups, five rejected mutations, exact data and source/dependency/producer hashes. |
| `scripts/python/four_port_sewing.py`, `four_port_semion.py`, `test_four_port_consistency.py` | Null-quotient sewing, scalar descendant coefficients, semion BPZ/F/R and reflected kernels, conditional multiplicity selection and Fibonacci midpoint equations. |
| `scripts/python/run_small_category_inputs.py` | Exact VecZ2/semion/Fibonacci input probes, stress Gram and Ward blocks through grade four; ten test groups and four rejected mutations, with source/producer hashes. |
| `scripts/python/small_category_sewing.py`, `small_category_stress.py`, `test_small_category_inputs.py` | Fusion-channel multiplication/Frobenius and categorical cohomology checks; independent Virasoro normal ordering, Gram positivity, null descent and vacuum-block Ward solving. |
| `scripts/python/run_local_conformal_checks.py` | Produces exact universal identity checks and five rejected mutations for `reconstruction/`; records raw outputs, versions and producer hashes. |
| `scripts/python/local_conformal_identities.py`, `test_local_conformal_identities.py` | Free-expression/Taylor/cocycle checks for local sewing, Ward and obstruction formulas; eleven tests, no model-specific computation. |
| `scripts/check_report_shards.sh` | Deterministic structural guard for the sharded lab book. |
| `scripts/ci_before_push.sh` | Local pre-push gate (shard guard + report build + Julia tests). |
| `src/CftAnyons.jl` | Seed Julia backend: golden-ratio invariant helper, finite-group averaging projector helper, Fibonacci fusion-path count helper, Poincare vector-field bracket helper, nearest-neighbour boost-current coefficient helper, and includes for the Galilei, Gaussian-boson, qubit Pauli, and qubit SDP helper files. |
| `src/GalileiAlgebras.jl` | Checked Galilei vector-field bracket helper, mass-central coefficient helper, and first-moment continuity-current coefficient helper used by CA-19--CA-21. |
| `src/GaussianBosons.jl` | Checked Gaussian-boson symbol helpers: nearest-neighbour Klein-Gordon dispersion, scalar coefficient validation, coefficient-symbol evaluation, boost-time residuals, rotation-Hamiltonian residuals, and boost-boost residual coefficient data used by CA-24, CA-26, and CA-28. |
| `src/GaussianBosonCurrents.jl` | Checked Gaussian current helpers: phase-space quadratic commutators, CA-29 equal-endpoint nearest-neighbour density matrices, local bond currents `J_{j+1/2}=i[e_j,e_{j+1}]`, closed-form current matrices, continuity residuals for the T_01 candidate, the 1D translation-invariant integrated-current symbol used by CA-31, and the nearest-neighbour current-symbol speed residual used by CA-33. |
| `src/GaussianBosonNumerics.jl` | Checked Gaussian-boson numerical/example helpers: Lorentz Hessian residuals, anisotropic and doubler coefficient examples, uncentered and centered finite periodic momentum grids, finite periodic Fourier vectors, finite periodic stiffness matrices, Brillouin-grid symbol spectra, and finite-grid minimum-data certificates used by CA-27--CA-28. |
| `src/QubitPauliLattice.jl` | Checked qubit Pauli helpers: one-, two-, three-, and n-site Pauli operator reconstruction, symmetric on-site bond split, adjacent-density current `i[h_12,h_23]`, direct Pauli-coefficient current tensor, conservation residuals, raw five-site overlap sentinels, and first-moment boost density helpers used by CA-34--CA-40. |
| `src/QubitPauliResiduals.jl` | Checked one-dimensional qubit residual helpers: Pauli-coefficient coboundary tensors `D u = u_j-u_{j+1}` and the four-site boost-relation local density `B_j=i[p_j,h_{j+1}]+2i[p_j,h_{j+2}]` used by CA-38--CA-40. |
| `src/QubitPauliWords.jl` | Exact positioned Pauli-word algebra for the SDP hierarchy: sparse word representation, product phases, translation-canonical moment representatives, finite window enumeration, and coefficient-to-term conversion used by CA-47--CA-50. |
| `src/QubitPoincareWitnesses.jl` | Linear least-squares witness solvers for fixed-`h` conservation and boost coboundary equations before SDP construction, used by CA-49--CA-51. |
| `src/QubitMomentSDP.jl` | JuMP/MathOptInterface/MosekTools implementation of the fixed-residual qubit moment SDP: level specification, affine expectation forms, realified PSD cone, residual relation constraints, and solver verdict mapping used by CA-46--CA-50. |
| `src/QubitHamiltonianScreening.jl` | Deterministic sentinel Hamiltonian matrices and current-collapse gate helper used by CA-51--CA-52. |
| `src/QubitHamiltonianFamilies.jl` | Named two-qubit Pauli coefficient constructors for sourced TFIM/XY/XXZ/Heisenberg families and synthetic XYZ/DM/compass/generic scan inputs used by CA-54--CA-56. |
| `src/QubitCandidateScan.jl` | Fixed first-moment-route candidate scan API: evaluates current collapse, conservation witness, boost witness, optional SDP status, scoped verdicts, and TOML-friendly result rows used by CA-53--CA-61. |
| `scripts/julia/qubit_sdp_smoke.jl` | Reproducible Mosek smoke run for the qubit SDP layer; writes `runs/2026-05-31-qubit-sdp-smoke/results.toml`. |
| `scripts/julia/qubit_candidate_scan.jl` | Reproducible broad candidate scan for sourced and synthetic nearest-neighbour qubit Hamiltonian samples; writes `runs/2026-05-31-qubit-candidate-scan/{inputs,summary,results}.toml`. |
| `src/QubitMomentStateWitnesses.jl` | Checked finite witnesses for the CA-63 state-existence theorem: Pauli-word window matrices, density-matrix reconstruction from moments, moment-matrix Gram construction, and partial-trace extension used by the compactness testset. |
| `src/QubitRelaxedGates.jl` | Checked CA-64 relaxed-gate profiles: tracial coefficient norm, trailing-identity embedding, gauge-aware coboundary matrices, and the conservation/boost/joint residual-profile solvers with free, fixed, or bounded speed. |
| `src/QubitResidualSDP.jl` | Fixed-residual GNS-norm SDP objective v_N(R)=min omega(R*R) with tracial normalization used by CA-64; witness optimization inside the SDP is a hard error (bilinear). |
| `src/QubitRelaxedScan.jl` | Relaxed candidate-scan result schema and verdict logic (queued_gns_scaling etc.), kept separate from the exact CA-53 scan schema. |
| `src/AnyonicWordAlgebra.jl` | Checked Fibonacci word-algebra helpers for CA-65--CA-68: charge-sector basis enumeration for O=1+tau, multiplicity recurrences, dense-corner pairs, vacuum-insertion isometry matrices, and occupation-number matrices. |
| `scripts/julia/qubit_relaxed_scan.jl` | Reproducible relaxed re-scan of the 99-point qubit grid with residual profiles and sentinel SDP objectives; writes `runs/2026-07-05-qubit-relaxed-scan/{inputs,summary,results}.toml`. |
| `scripts/python/net_tl_representation_check.py` | CA-87 check: builds the dilute Fibonacci fusion-path basis (site object 1+tau, unitary-gauge F-moves), the flip generator F = phi(|u><u| + |w><w|) and the vacancy generators, verifies all Temperley-Lieb relations for L = 3..6 and both sign gauges, runs a vertex-entry mutation (must be RED), and compares the spectrum of H = -sum e_i with the golden chain on 2L sites. Python + numpy (no Julia in the acquiring container; port pending). |
| `test/runtests.jl` | Julia invariant checks (`make test` / `Pkg.test()`), including the `C2` swap averaging projector sector check used by CA-06, the two-qubit exchange projector check used by CA-08, the Fibonacci path-count check used by CA-09, the lattice-symmetry algebra/coefficient checks used by CA-11--CA-12, the qubit Pauli adjacent-current/coboundary/residual obstruction checks used by CA-34--CA-40, the qubit Pauli-word moment-SDP checks used by CA-46--CA-52, the qubit Hamiltonian candidate-scan checks used by CA-53--CA-61, the Galilean algebra/mass/current checks used by CA-19--CA-21, the Gaussian-boson symbol checks used by CA-24, the strengthened Gaussian open-chain T_01 current continuity checks used by A4 and CA-33, the current-symbol equivalence checks used by CA-31, the current-symbol slope witnesses used by CA-33, and the Gaussian-boson residual/numerical/scalar-coefficient-validation/centered-momentum/Fourier-eigenvector/minimum-data/rotation/boost-boost checks used by CA-26--CA-28, plus the qubit full-window moment compactness witnesses used by CA-63, the relaxed residual-profile/relaxed-scan/fixed-residual-SDP checks used by CA-64, and the Fibonacci anyonic word algebra and vacuum-insertion checks used by CA-65--CA-68. |

## Runs

| Run bundle | Producer | Headline |
|---|---|---|
| `runs/2026-10-21-four-port-consistency/` | `scripts/python/run_four_port_consistency.py` | Exact semion four-port tensor ansatz and conditional doublet selection; explicit Fibonacci equations/coefficients without crossing exclusion. Not a complete CFT or KS/OAR construction. |
| `runs/2026-10-21-small-category-inputs/` | `scripts/python/run_small_category_inputs.py` | VecZ2/Fibonacci binary solutions, semion A=1+s obstruction, categorical cohomology contraction, selected-lift stress blocks and null equation. Partial reconstruction tests, not a CFT/KS/OAR solution. |
| `runs/2026-10-21-local-conformal-consistency/` | `scripts/python/run_local_conformal_checks.py` | Eleven symbolic identities pass; five mathematical mutations rejected; restored pass. Formal identities only, not a CFT or continuum construction. |
| `runs/2026-09-23-net-tl-representation/` | `scripts/python/net_tl_representation_check.py` | All TL relations hold to 1e-16 for cup sign + (fail at 0.76 for cup sign -), vertex sign free; H = -sum e_i on L dilute sites is exactly isospectral to the golden chain on 2L sites for N = 5..15 (E0 and gaps agree to 10 digits); mutation RED at 3e-3. |
| `runs/2026-05-31-qubit-sdp-smoke/` | `scripts/julia/qubit_sdp_smoke.jl` | Mosek returns `:not_excluded_at_level` for the zero-residual moment problem and `:excluded` for the artificial identity and forced-`ZZ` contradiction instances. |
| `runs/2026-05-31-qubit-candidate-scan/` | `scripts/julia/qubit_candidate_scan.jl` | The fixed first-moment-route scan checks 99 qubit Hamiltonian samples: 9 current-collapsed, 27 conservation-witness failures, and 63 exact boost-witness failures; self-dual TFIM reaches and fails the boost gate. |
| `runs/2026-07-05-qubit-relaxed-scan/` | `scripts/julia/qubit_relaxed_scan.jl` | The CA-64 relaxed gates re-scan the same 99 points: 9 stay current-collapsed, 27 queued on conservation profiles, 63 (incl. critical TFIM, XXZ, Heisenberg) move to queued_gns_scaling; TFIM boost profile decreases sqrt(6) -> 1.3416 over supports 2..5 with optimizing speed v^2 = -2; sentinel SDP objectives give no exclusion certificate at level 2. |

## Reviews

| Artifact | Purpose |
|---|---|
| `reviews/2026-05-30_gaussian_lorentz/` | Independent rigorous reviews of CA-10--CA-17 and CA-23--CA-28, plus synthesis for stress-energy-density follow-up shards. |
| `reviews/2026-05-31_qubit_nn_symmetry/` | Orchestration record for the qubit nearest-neighbour symmetry diagnostic subagents feeding CA-34--CA-37. |
| `reviews/2026-05-31_qubit_nn_sdp_hierarchy/` | Orchestration record for the expanded qubit necessary-equation and SDP-hierarchy subagents feeding CA-38--CA-45. |
| `reviews/2026-05-31_qubit_sdp_implementation/` | Orchestration record for the Julia qubit moment-SDP implementation subagents feeding CA-46--CA-52. |
| `reviews/2026-05-31_qubit_candidate_scan/` | Orchestration record for the sourced/synthetic candidate scan subagents feeding CA-53--CA-61. |
| `reviews/2026-07-05_bu_pipeline/` | Orchestration record for the categorical Borchers-Uhlmann pipeline block (CA-62--CA-70): two-model design competition, state-existence audit, relaxed-gate design, refinement-map investigation, dilute-TL Koo-Saleur chase, and source acquisitions. |

## CFT-machine workspace (2026-09-22)

| Entry | Purpose / evidence |
|---|---|
| `cft_machine/README.md` | Algorithm/functor workspace and reproducibility entry point. |
| `cft_machine/compiler/` | Exact Ising modular-input recognition and declared tensor-product lattice recipes; own README, tests and run producer. |
| `cft_machine/compiler/run.jl` | Emits four exact-matching Ising/product previews and explicit CAR recipes into `cft_machine/compiler/runs/2026-09-22/`, with eight source-code hashes; 215 standalone assertions and two rejected mutations. |
| `cft_machine/benchmarks/fermion/FermionBenchmark.jl` | Source-modified complex/Majorana KS modes, explicit quadratic CAR terms, Dirac Hamiltonian, and sharp refinements. |
| `cft_machine/benchmarks/fermion/WilsonStates.jl` | Actual finite Dirac ground-state covariance pullbacks and proved dual-state-norm tail modulus. |
| `cft_machine/benchmarks/fermion/run.jl` | Producer for `cft_machine/benchmarks/fermion/runs/2026-09-22/`: complex and Majorana Schwinger terms, mode refinement defects, nontrivial Wilson-state rows, source hashes. |
| `cft_machine/benchmarks/fermion/test.jl`, `test_wilson.jl` | 760 standalone finite assertions; independent matrix/sum/Fourier oracles and three mutation regressions. |
| `cft_machine/research/wilson_triangle.md` | WT-1 horizontal state construction, WT-2 effective expectation algorithm, WT-3 Gram error bound. |
| `cft_machine/research/virasoro_routes.md` | VR-1 graph-norm/product convergence criterion and VR-2 vacuum-null counterexample. |
| `cft_machine/research/realisation_and_fidelity.md` | Source-based realization branches and strict finite-group fixed-point transport lemmas. |
| `cft_machine/research/equivariant_oar.md` | EQ-1 invariant Wilson states and GNS fixed vectors; EQ-2 represented weak fixed-point closures. |
| `cft_machine/research/coset_route.md` | CR-1 current/coset normalization, CR-2 exact finite-core stabilization, CR-3 vacuum safe window; full coset observable construction remains open. |
| `cft_machine/benchmarks/coset/run.jl` | Exact sparse-CAR producer: `cft_machine/benchmarks/coset/runs/2026-09-22/`, central charges 1/2 and 7/10 with exact descendant norms, cutoff flags and code hash; 127 assertions, two rejected mutations, at most 96 sparse states. |
| `cft_machine/reviews/` | Skeptical Astra cross-referee reports and resolved issues. |
| `cft_machine/reviews/check_compiler.jl`, `check_coset.jl` | Retained independent referee regression scripts: 13 exact modular-phase/relabel checks and 18 finite-boundary/zero-mode checks, with standalone `.txt` outputs and commands in the reports. |
| `cft_machine/reviews/second_pass_ising.md`, `oar_second_pass_referee.md` | Precise OAR audit, maximal bounded-local-WOT Ising inclusion, ultraviolet-edge qualification, and cross-review of smooth coset symmetry limits. |
| `cft_machine/research/smeared_coset_limits.md` | SC-1/SC-2: common-core decomposition and microscopic quartic smooth-stress resolvent/unitary convergence. |
| `cft_machine/research/coset_hamiltonian.md` | CH-1 raw finite zero-mode negativity; CH-2 computable nested vacuum descendants; CH-3 positive extracted Hamiltonians. |
| `cft_machine/research/coset_observable_system.md` | CO-1 genuine strict scalar-augmented OAR; CO-2 smooth compressed field limits; CO-3 represented local reconstruction, distinct from a norm-soft quotient. |
| `cft_machine/benchmarks/coset_hamiltonian/run.jl` | Producer for its `runs/2026-09-22/`: exact negative expectations and positive extracted-space witnesses; 261 assertions, penalty mutation rejected, peak 2744 sparse states. |
| `cft_machine/benchmarks/unitized_oar/run.jl` | Producer for its `runs/2026-09-22/`: eight exact computed descendant stages, Gram matrices, unital maps, states and dynamics; 19 generic and 212 integrated assertions, scalar-character mutation rejected. |
| `cft_machine/report.tex` and `cft_machine/report.pdf` | Standalone 26-page pdflatex synthesis requested at wind-up; source sections under `cft_machine/report/sections/`, compiled twice and all page renders inspected. |
| `cft_machine/compiler_minimal/README.md` | Explicitly unimplemented tricritical modular-frontend proposal; no compiler code or acceptance claim. |
| `references/cft-machine/` | Append-only source packages and per-topic manifests for the new workspace. |

## Fresh local reconstruction investigation (2026-10-21)

`reconstruction/README.md` maps thirteen short research notes: concrete cell
equations, local implementation/curvature obstructions, formal sewing
deformations, cutoff-dependent microscopic KS/OAR conditions, and a mixed
product/action deformation complex, followed by small-category binary,
cohomology and local stress probes, and the four-port sewing/crossing
system with semion/Fibonacci illustrations. CONVENTIONS (ac)–(ai) and
worklogs 016–018 record scope and the offline/local-commit direction.
These notes have not been promoted to report shards or a general theorem.

## Astra explorations and verification notes (2026-10-22)

| Item | Record |
|---|---|
| `explorations/2026-10-22-astra/` | Six Codex explorations (model gpt-6-astra, reasoning xhigh), D1--D6, each with `NOTE.md` and a `checks/` bundle (Python producers, raw outputs, hashes, rejected mutations), plus six Opus sceptical reviews (`REVIEW.md`, with reviewer checks) and integration packages (`INTEGRATION.md`). Briefs in `briefs/`. All six headlines graded "needs reformulation"; surviving content promoted to CA-76--CA-80 with review grades carried. Checks are not yet ported to `scripts/` with run bundles. |
| `explorations/2026-10-22-astra-r2/` | Round 2 (2026-10-22): six Codex proof notes (model gpt-6-astra, reasoning xhigh), E1--E6, each attacking one conjecture the round-1 reviews identified (briefs in `briefs/`), each with `NOTE.md` (Lamport-style proofs) and a `checks/` bundle (Python/SymPy/NumPy producers, raw outputs, rejected mutations; E3/E5 `provenance.json`, E4/E6 `manifest.json`); plus six Opus step-by-step reviews (`REVIEW.md`) with their own check scripts (`review_*.py` and outputs in each `checks/`; E4 under `checks/review/`) and integration packages (`INTEGRATION.md`). Grades: E1, E5 PROOF-COMPLETE; E6 COUNTEREXAMPLE with a proof-complete positive theorem; E2, E3, E4 WEAKER-RESULT-PROVED. Lifted into CA-89--CA-94 with grades carried (CA-88 \S Round-2 Verdicts; worklog 021). Checks are Float64/exact calibrations, not proofs, and are not yet ported to `scripts/` with run bundles. |
| `explorations/2026-10-25-astra-r3/` | Round 3 (2026-10-25): six Codex proof notes (gpt-6-astra, xhigh), F1--F6, one per round-2 next target (briefs in `briefs/`, rules `_common.md`), each with `NOTE.md` and `checks/`; six **Astra** sceptical reviews (`REVIEW.md`, rules `_review_common.md`, reviewer checks `checks/review_*`); integration packages (`INTEGRATION.md`); and registration packages (`SHARD_META.md`, for F1, F3, F4, F6) written by Astra shard writers (`briefs/SHARD-*.md`, rules `_shard_common.md`). Grades: F1, F5 COUNTEREXAMPLE to the brief with proof-complete replacements; F2, F3, F4, F6 WEAKER-RESULT-PROVED. Lifted into CA-95 (F4), CA-96 (F1), CA-97 (F6), CA-98 (F3), CA-99 (F5), CA-100 (F2) with grades carried (worklog 022). Two 45-minute follow-ups G1 (transport extraction) and G6 (record faithfulness) have complete notes but **no review** and are not lifted; brief G2 was written but never launched. The sprint stopped at 07:08 when the laptop failed; CA-97--CA-100 were recovered from the laptop backup on 2026-10-27. Checks are exact/Float64 calibrations, not proofs, and are not yet ported to `scripts/` with run bundles. |
| July testsets, standalone (verification note, no run bundle) | 2026-10-22: the five July testsets of `test/runtests.jl:1095-1937` (fibonacci anyonic word algebra 83, CA-71 67, CA-72 40, CA-73 262, CA-74 113) were extracted to a session-scratchpad script and run with `using CftAnyons` on Julia 1.12.5: 565/565 assertions pass in 26 s wall time. The script and log were not committed; re-run by extracting the same line range. Full `Pkg.test()` remains suspended (AGENTS.md platform note). |

## Report shards

See `report/SHARD_CATALOG.md` for the searchable shard catalogue.
