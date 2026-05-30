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

## Adding a shard

1. Create `report/sections/NN_slug.tex` with a `% SHARD-ID: CA-NN-SLUG` header
   plus `SHARD-TITLE`, 2–3 `SHARD-SUMMARY` lines, and `SHARD-KEYWORDS`.
2. Open it with a short **"Sources and dependencies"** block citing the exact
   `references/...:line` anchors and the prior shard IDs it builds on.
3. Add an `\include{report/sections/NN_slug}` line to `report.tex`.
4. Add a row to the table above **and** an entry to `report/SHARD_CATALOG.md`
   (id, file, title, the summary lines verbatim, keywords).
5. Run `make check-report-shards` (must pass) and `make report`.
