# Report Source Map

Read this file first when navigating the lab-book source. The compiled report is
rooted at `report.tex`, but that file holds **only** the preamble and the
`\include` order. Body prose lives in `report/sections/*.tex`.

For rapid lookup, use `report/SHARD_CATALOG.md`: it assigns each shard a stable
label, gives 2–3 summary lines, and lists search keywords. The same metadata
appears in a `% SHARD-*` comment header at the top of every shard.

The target shard size is about **200 lines**; the local guard allows larger
topic-preserving shards up to `REPORT_SHARD_MAX_LINES` (default **280**). Run
`make check-report-shards` after editing report structure and `make report`
before treating report edits as complete.

## Shard Order

| Order | Label | Source | Title |
|---:|---|---|---|
| 0 | `CA-00-FRONTMATTER` | `report/sections/00_frontmatter.tex` | Frontmatter, North Star, and Claim Status |
| 1 | `CA-01-PROGRAMME-MAP` | `report/sections/01_programme_map.tex` | Programme Map |
| 2 | `CA-02-AND-OR-VACUUM-GRAMMAR` | `report/sections/02_and_or_vacuum_grammar.tex` | Many-Particle Hilbert Spaces: the AND/OR/Vacuum Grammar |
| 3 | `CA-03-INDEFINITE-PARTICLE-FOCK` | `report/sections/03_indefinite_particle_fock.tex` | Indefinite Particle Number: the Full Fock Completion |
| 4 | `CA-04-HILBERT-SPACE-COMPILER-CONTRACT` | `report/sections/04_hilbert_space_compiler_contract.tex` | A Hilbert-Space Compiler Contract |
| 5 | `CA-05-SYMMETRY-DECORATED-GRAMMAR` | `report/sections/05_symmetry_decorated_grammar.tex` | Symmetry-Decorated Many-Particle Grammar |
| 6 | `CA-06-SECTORS-PROJECTIONS-QUOTIENTS` | `report/sections/06_sectors_projections_quotients.tex` | Sectors, Projections, Subspaces, and Quotients |
| 7 | `CA-07-EXCHANGE-STATISTICS-LAYER` | `report/sections/07_exchange_statistics_layer.tex` | Exchange Symmetry and Statistics as Sector Selection |
| 8 | `CA-08-HILBERT-SPACE-COMPILER-SPEC` | `report/sections/08_hilbert_space_compiler_spec.tex` | Scoping the Hilbert-Space Compiler |
| 9 | `CA-09-FIBONACCI-KINEMATIC-SECTOR` | `report/sections/09_fibonacci_kinematic_sector.tex` | Fibonacci Kinematics as a Fusion-Rule Sector |
| 10 | `CA-10-LATTICE-SYMMETRY-MOTIVATION` | `report/sections/10_lattice_symmetry_motivation.tex` | Why Lattice Symmetry Generators Are a Problem |
| 11 | `CA-11-CONTINUUM-BULK-SYMMETRY-TARGET` | `report/sections/11_continuum_bulk_symmetry_target.tex` | The Continuum Bulk Symmetry Target |
| 12 | `CA-12-LATTICE-BOOST-CURRENT-1D` | `report/sections/12_lattice_boost_current_1d.tex` | A One-Dimensional Boost Produces a Momentum Current |
| 13 | `CA-13-POSITION-DEPENDENT-BULK-GENERATORS` | `report/sections/13_position_dependent_bulk_generators.tex` | Position-Dependent Bulk Generators |
| 14 | `CA-14-KOO-SALEUR-PROTOTYPE` | `report/sections/14_koo_saleur_prototype.tex` | Koo-Saleur as the Prototype |
| 15 | `CA-15-LATTICE-SYMMETRY-ACCEPTANCE-TESTS` | `report/sections/15_lattice_symmetry_acceptance_tests.tex` | Acceptance Tests for Lattice Symmetry Candidates |
| 16 | `CA-16-LATTICE-SYMMETRY-COMPILER-INTERFACE` | `report/sections/16_lattice_symmetry_compiler_interface.tex` | A Compiler Interface for Lattice Symmetry Candidates |
| 17 | `CA-17-LATTICE-SYMMETRY-EXAMPLES-QUEUE` | `report/sections/17_lattice_symmetry_examples_queue.tex` | Small Examples and the Lattice-Symmetry Research Queue |
| 18 | `CA-18-GALILEAN-SYMMETRY-MOTIVATION` | `report/sections/18_galilean_symmetry_motivation.tex` | Why Galilean Symmetry Is a Different Lattice Target |
| 19 | `CA-19-GALILEAN-VECTOR-FIELD-ALGEBRA` | `report/sections/19_galilean_vector_field_algebra.tex` | The Galilei Algebra as Newtonian Vector Fields |
| 20 | `CA-20-GALILEAN-PROJECTIVE-MASS` | `report/sections/20_galilean_projective_mass.tex` | Projective Galilean Symmetry and the Mass Central Term |
| 21 | `CA-21-LATTICE-GALILEAN-BOOSTS` | `report/sections/21_lattice_galilean_boosts.tex` | Lattice Galilean Boosts from Mass-Density First Moments |
| 22 | `CA-22-GALILEAN-COMPILER-INTERFACE` | `report/sections/22_galilean_compiler_interface.tex` | Compiler Rules and Examples for Galilean Targets |
| 23 | `CA-23-GAUSSIAN-BOSON-LORENTZ-ROADMAP` | `report/sections/23_gaussian_boson_lorentz_roadmap.tex` | Gaussian Boson Lorentz Generator Roadmap |
| 24 | `CA-24-GAUSSIAN-BOSON-SYMBOL-CALCULUS` | `report/sections/24_gaussian_boson_symbol_calculus.tex` | Gaussian Boson Symbol Calculus and the Boost-Time Residual |
| 25 | `CA-25-GAUSSIAN-BOSON-DIAGONALIZATION` | `report/sections/25_gaussian_boson_diagonalization.tex` | Gaussian Boson Diagonalization and the One-Particle Symbol |
| 26 | `CA-26-GAUSSIAN-BOSON-GENERATOR-ALGEBRA` | `report/sections/26_gaussian_boson_generator_algebra.tex` | One-Particle Generator Algebra for Gaussian Bosons |
| 27 | `CA-27-GAUSSIAN-BOSON-RESIDUAL-CONDITIONS` | `report/sections/27_gaussian_boson_residual_conditions.tex` | Lorentz Residual Conditions on Gaussian Coefficients |
| 28 | `CA-28-GAUSSIAN-BOSON-NUMERICAL-SUITE` | `report/sections/28_gaussian_boson_numerical_suite.tex` | Numerical Verification Suite for Gaussian Boson Examples |
| 29 | `CA-29-GAUSSIAN-BOSON-REAL-SPACE-DENSITY` | `report/sections/29_gaussian_boson_real_space_density.tex` | Gaussian Boson Real-Space Energy Density |
| 30 | `CA-30-GAUSSIAN-BOSON-1D-STRESS-CANDIDATES` | `report/sections/30_gaussian_boson_1d_stress_candidates.tex` | One-Dimensional Gaussian Boson Stress-Energy Candidates |
| 31 | `CA-31-GAUSSIAN-CURRENT-SYMBOL-EQUIVALENCE` | `report/sections/31_gaussian_current_symbol_equivalence.tex` | Gaussian Current-Symbol Equivalence in One Dimension |
| 32 | `CA-32-GAUSSIAN-HIGHER-DIMENSIONAL-CELL-CURRENTS` | `report/sections/32_gaussian_higher_dimensional_cell_currents.tex` | Higher-Dimensional Gaussian Cell-Current Proposal |
| 33 | `CA-33-GAUSSIAN-STRESS-NUMERICAL-SUITE` | `report/sections/33_gaussian_stress_numerical_suite.tex` | First Gaussian Stress-Energy Numerical Suite |
| 34 | `CA-34-QUBIT-NEAREST-NEIGHBOUR-SYMMETRY-QUEST` | `report/sections/34_qubit_nearest_neighbour_symmetry_quest.tex` | Qubit Nearest-Neighbour Symmetry Quest |
| 35 | `CA-35-QUBIT-1D-BOOST-CURRENT-OBSTRUCTIONS` | `report/sections/35_qubit_1d_boost_current_obstructions.tex` | One-Dimensional Qubit Boost-Current Obstructions |
| 36 | `CA-36-QUBIT-2D-PLAQUETTE-SYMMETRY-DIAGNOSTICS` | `report/sections/36_qubit_2d_plaquette_symmetry_diagnostics.tex` | Two-Dimensional Qubit Plaquette Symmetry Diagnostics |
| 37 | `CA-37-QUBIT-WITT-VIRASORO-DIAGNOSTICS` | `report/sections/37_qubit_witt_virasoro_diagnostics.tex` | Qubit Nearest-Neighbour Witt/Virasoro Diagnostics |
| 38 | `CA-38-QUBIT-LOCAL-ALGEBRA-EQUATION-FRAMEWORK` | `report/sections/38_qubit_local_algebra_equation_framework.tex` | Qubit Local-Algebra Equation Framework |
| 39 | `CA-39-QUBIT-1D-POINCARE-NECESSARY-EQUATIONS` | `report/sections/39_qubit_1d_poincare_necessary_equations.tex` | One-Dimensional Qubit Poincare Necessary Equations |
| 40 | `CA-40-QUBIT-1D-RESIDUAL-COMPUTER-ALGEBRA` | `report/sections/40_qubit_1d_residual_computer_algebra.tex` | Computer Algebra for One-Dimensional Qubit Residuals |
| 41 | `CA-41-QUBIT-2D-POINCARE-EQUATION-SCHEMA` | `report/sections/41_qubit_2d_poincare_equation_schema.tex` | Two-Dimensional Qubit Poincare Equation Schema |
| 42 | `CA-42-QUBIT-WITT-VIRASORO-NECESSARY-EQUATIONS` | `report/sections/42_qubit_witt_virasoro_necessary_equations.tex` | Qubit Witt/Virasoro Necessary Equations |
| 43 | `CA-43-QUBIT-VACUUM-MOMENT-CONSTRAINTS` | `report/sections/43_qubit_vacuum_moment_constraints.tex` | Vacuum Moment Constraints for Qubit Residuals |
| 44 | `CA-44-QUBIT-SDP-EXCLUSION-HIERARCHY` | `report/sections/44_qubit_sdp_exclusion_hierarchy.tex` | SDP Exclusion Hierarchy for Qubit Hamiltonians |
| 45 | `CA-45-QUBIT-SYMMETRY-EXCLUSION-ROADMAP` | `report/sections/45_qubit_symmetry_exclusion_roadmap.tex` | Roadmap for Qubit Symmetry Exclusion |
| 46 | `CA-46-QUBIT-SDP-IMPLEMENTATION-CONTRACT` | `report/sections/46_qubit_sdp_implementation_contract.tex` | Qubit SDP Implementation Contract |
| 47 | `CA-47-QUBIT-PAULI-WORD-MOMENT-BASIS` | `report/sections/47_qubit_pauli_word_moment_basis.tex` | Pauli Word Moment Basis for Infinite Qubit Chains |
| 48 | `CA-48-QUBIT-MOMENT-MATRIX-CONSTRUCTION` | `report/sections/48_qubit_moment_matrix_construction.tex` | Moment Matrices and Positivity Constraints |
| 49 | `CA-49-QUBIT-RESIDUAL-RELATION-COMPILER` | `report/sections/49_qubit_residual_relation_compiler.tex` | Compiling Poincare Residuals into Moment Equations |
| 50 | `CA-50-QUBIT-SDP-LEVELS-AND-MOSEK-BACKEND` | `report/sections/50_qubit_sdp_levels_and_mosek_backend.tex` | SDP Levels and the Mosek Backend |
| 51 | `CA-51-QUBIT-SDP-SENTINEL-HAMILTONIANS` | `report/sections/51_qubit_sdp_sentinel_hamiltonians.tex` | Sentinel Hamiltonians for the SDP Hierarchy |
| 52 | `CA-52-QUBIT-CANDIDATE-SELECTION-ROADMAP` | `report/sections/52_qubit_candidate_selection_roadmap.tex` | Candidate Hamiltonian Selection Roadmap |
| 53 | `CA-53-QUBIT-CANDIDATE-SCAN-CONTRACT` | `report/sections/53_qubit_candidate_scan_contract.tex` | Qubit Candidate Scan Contract |
| 54 | `CA-54-QUBIT-HAMILTONIAN-FAMILY-CONVENTIONS` | `report/sections/54_qubit_hamiltonian_family_conventions.tex` | Pauli Coefficients for Scan Families |
| 55 | `CA-55-QUBIT-SOURCED-SPIN-CHAIN-FAMILIES` | `report/sections/55_qubit_sourced_spin_chain_families.tex` | Locally Sourced Spin-Chain Inputs |
| 56 | `CA-56-QUBIT-SYNTHETIC-GRID-FAMILIES` | `report/sections/56_qubit_synthetic_grid_families.tex` | Synthetic and Stress-Test Hamiltonian Grids |
| 57 | `CA-57-QUBIT-ALGEBRAIC-SCAN-GATES` | `report/sections/57_qubit_algebraic_scan_gates.tex` | Current, Conservation, and Boost Witness Gates |
| 58 | `CA-58-QUBIT-SDP-SCAN-LEVELS` | `report/sections/58_qubit_sdp_scan_levels.tex` | Optional SDP Levels for Scan Survivors |
| 59 | `CA-59-QUBIT-CANDIDATE-SCAN-RUN-BUNDLE` | `report/sections/59_qubit_candidate_scan_run_bundle.tex` | Reproducible Scan Bundle Format |
| 60 | `CA-60-QUBIT-CANDIDATE-SCAN-RESULTS` | `report/sections/60_qubit_candidate_scan_results.tex` | First Candidate Scan Results |
| 61 | `CA-61-QUBIT-SCAN-TO-SCALING-QUEUE` | `report/sections/61_qubit_scan_to_scaling_queue.tex` | From Scan Failures to Scaling Work |
| 62 | `CA-62-CATEGORICAL-BU-PIPELINE-VISION` | `report/sections/62_categorical_bu_pipeline_vision.tex` | The Categorical Borchers-Uhlmann Pipeline: a Programme Refinement |
| 63 | `CA-63-QUBIT-MOMENT-STATE-EXISTENCE` | `report/sections/63_qubit_moment_state_existence.tex` | All-Level Moment Feasibility Gives a Qubit Reference State |
| 64 | `CA-64-QUBIT-RELAXED-SYMMETRY-GATES` | `report/sections/64_qubit_relaxed_symmetry_gates.tex` | Quantified Relaxations of the Qubit Symmetry Gates |
| 65 | `CA-65-ANYONIC-WORD-ALGEBRA` | `report/sections/65_anyonic_word_algebra.tex` | Anyonic Word Algebra from a Site Object |
| 66 | `CA-66-ANYONIC-STATES-VARIABLE-N-FOCK` | `report/sections/66_anyonic_states_variable_n_fock.tex` | Anyonic States and Variable-N Fock Space |
| 67 | `CA-67-REFINEMENT-REQUIREMENTS-OBSTRUCTIONS` | `report/sections/67_refinement_requirements_obstructions.tex` | Refinement-Map Requirements and Obstructions |
| 68 | `CA-68-VARIABLE-N-REFINEMENT-MAPS` | `report/sections/68_variable_n_refinement_maps.tex` | Refinement Maps for the Variable-N Anyonic Word Algebra |
| 69 | `CA-69-DILUTE-TL-WORD-ALGEBRA` | `report/sections/69_dilute_tl_word_algebra.tex` | The Dilute Temperley-Lieb Algebra and the Anyonic Word Algebra |
| 70 | `CA-70-DILUTE-KOO-SALEUR-ANSATZ` | `report/sections/70_dilute_koo_saleur_ansatz.tex` | The Dilute Koo-Saleur Ansatz |

## Adding a shard

1. Create `report/sections/NN_slug.tex` with a `% SHARD-ID: CA-NN-SLUG` header
   plus `SHARD-TITLE`, 2–3 `SHARD-SUMMARY` lines, and `SHARD-KEYWORDS`.
2. Open it with a short **"Sources and dependencies"** block citing the exact
   `references/...:line` anchors and the prior shard IDs it builds on.
3. Add an `\include{report/sections/NN_slug}` line to `report.tex`.
4. Add a row to the table above **and** an entry to `report/SHARD_CATALOG.md`
   (id, file, title, the summary lines verbatim, keywords).
5. Run `make check-report-shards` (must pass) and `make report`.
