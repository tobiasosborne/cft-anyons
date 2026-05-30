# Report Shard Catalog

Stable labels, summaries, and search keywords for the lab book rooted at
`report.tex`. Grep this file by keyword to find the shard you need, then read the
single ~200-line source file it points to.

## `CA-00-FRONTMATTER`

- Source: `report/sections/00_frontmatter.tex`
- Title: Frontmatter, North Star, and Claim Status
- Summary: Declares the project north star, the two success criteria, and the evidence rules.
- Summary: Fixes the claim-status labels that separate programme-level conjecture from checked results.
- Keywords: status, scope, north star, claim status, lab book, evidence chain

## `CA-01-PROGRAMME-MAP`

- Source: `report/sections/01_programme_map.tex`
- Title: Programme Map
- Summary: Lays out the construction pipeline as questions: category data, microscopic models, lattice symmetry generators, provable continuum limit, rigorous CFT.
- Summary: Records the first convention and source decisions needed before technical derivations begin.
- Keywords: programme, fusion category, modular tensor category, anyon chain, string-net, Koo-Saleur, continuum limit, conformal net

## `CA-02-AND-OR-VACUUM-GRAMMAR`

- Source: `report/sections/02_and_or_vacuum_grammar.tex`
- Title: Many-Particle Hilbert Spaces: the AND/OR/Vacuum Grammar
- Summary: Builds many-particle Hilbert spaces from three primitives: OR = direct sum, AND = tensor product, vacuum = the complex line.
- Summary: Fixes the two monoidal units (zero space for OR, the vacuum C for AND) and the distributivity linking them, with a carrier functor and particle-number grading.
- Summary: Separates indefinite particle number from exchange symmetry and defers statistics to a later quotient; the finite grammar here is completed to indefinite particle number in CA-03.
- Keywords: many-particle Hilbert space, direct sum, tensor product, vacuum, rig category, particle number, distinguishable Fock

## `CA-03-INDEFINITE-PARTICLE-FOCK`

- Source: `report/sections/03_indefinite_particle_fock.tex`
- Title: Indefinite Particle Number: the Full Fock Completion
- Summary: Makes the indefinite-particle Hilbert space rigorous as the l2 (Hilbert) direct sum of completed tensor powers, with the vacuum at degree zero.
- Summary: Distinguishes the algebraic direct sum (finite particle number, dense) from its Hilbert completion (indefinite particle number) and shows the Fock space is a Hilbert space with mutually orthogonal sectors.
- Summary: Identifies this as the full / distinguishable Fock space and locates Bose/Fermi statistics as the deferred per-sector permutation quotient.
- Keywords: Fock space, indefinite particle number, Hilbert direct sum, completed tensor product, vacuum, distinguishable Fock, second quantization

## `CA-04-HILBERT-SPACE-COMPILER-CONTRACT`

- Source: `report/sections/04_hilbert_space_compiler_contract.tex`
- Title: A Hilbert-Space Compiler Contract
- Summary: States the mini north star for the pre-work sequence: expressions in the many-particle grammar should compile to Hilbert carriers, observable-algebra policies, symmetries, and evidence metadata.
- Summary: Separates syntax from semantics and records the typed output slots needed before the grammar can support sectors, quotients, and later category-valued data.
- Summary: Treats the regular-expression analogy as a proposal while keeping every constructor responsible for explicit Hilbert-space and observable-algebra data.
- Keywords: Hilbert-space compiler, grammar, observable algebra, regular expressions, syntax, semantics, evidence metadata

## `CA-05-SYMMETRY-DECORATED-GRAMMAR`

- Source: `report/sections/05_symmetry_decorated_grammar.tex`
- Title: Symmetry-Decorated Many-Particle Grammar
- Summary: Adds ordinary and projective-unitary symmetry data to atoms and propagates it through OR, AND, and the derived full-Fock representation.
- Summary: Uses central extensions as the pre-work representation of projective symmetries, avoiding unsourced cocycle arithmetic in the grammar.
- Summary: Records the compatibility requirements needed before multiple atomic Hilbert spaces can share a single compiled symmetry action.
- Keywords: symmetry, unitary representation, projective representation, central extension, tensor product, direct sum, Fock

## `CA-06-SECTORS-PROJECTIONS-QUOTIENTS`

- Source: `report/sections/06_sectors_projections_quotients.tex`
- Title: Sectors, Projections, Subspaces, and Quotients
- Summary: Makes precise the slogan that symmetry sectors can be represented by orthogonal projections, closed subspaces, or suitable Hilbert quotients.
- Summary: Proves the finite-group averaging projection for invariant sectors and records the checked C2 swap example in the Julia test suite.
- Summary: Separates invariant vectors, invariant observable algebras, and compressed sector observable algebras so the compiler cannot conflate them.
- Keywords: sector, projection, quotient, invariant subspace, averaging projector, observable algebra, compression

## `CA-07-EXCHANGE-STATISTICS-LAYER`

- Source: `report/sections/07_exchange_statistics_layer.tex`
- Title: Exchange Symmetry and Statistics as Sector Selection
- Summary: Applies the sector machinery to the permutation action on tensor slots, with symmetric and antisymmetric sectors arising from chosen irreps of S_n.
- Summary: Keeps internal symmetries separate from exchange symmetry and records how the two actions coexist on n-particle sectors.
- Summary: Defers para-statistics and genuinely anyonic braid statistics until their source, convention, and projector data are fixed.
- Keywords: exchange symmetry, statistics, symmetric Fock, antisymmetric Fock, permutation group, sector projector, anyonic deferral

## `CA-08-HILBERT-SPACE-COMPILER-SPEC`

- Source: `report/sections/08_hilbert_space_compiler_spec.tex`
- Title: Scoping the Hilbert-Space Compiler
- Summary: Specifies the first partial compiler from typed grammar expressions to Hilbert carriers, gradings, observable-algebra policies, symmetry data, and sector witnesses.
- Summary: Gives deterministic constructor rules and finite-dimensional invariants that can be checked before any categorical anyon data enters.
- Summary: Works through small examples: maybe qubits, distinguishable pairs, derived tensor-power closure, exchange-irrep sectors, invariant quotients, and a required compile error.
- Keywords: Hilbert-space compiler, compiler specification, examples, dimensions, observable policy, compile error, symmetric sector, invariant quotient

## `CA-09-FIBONACCI-KINEMATIC-SECTOR`

- Source: `report/sections/09_fibonacci_kinematic_sector.tex`
- Title: Fibonacci Kinematics as a Fusion-Rule Sector
- Summary: Shows that the Fibonacci fusion-path Hilbert spaces are obtained kinematically from one physical tau atom plus a fusion-rule admissibility projector.
- Summary: Derives the Fibonacci dimension recurrence from the left-associated path-basis sector and checks the path-count invariant in Julia.
- Summary: Records why full Fibonacci anyons require a tensor-category compiler with F/R-symbol coherence, not only a Hilbert-space compiler.
- Keywords: Fibonacci, fusion path, sector projector, tau atom, admissibility, tensor category compiler, F-move, coherence

## `CA-10-LATTICE-SYMMETRY-MOTIVATION`

- Source: `report/sections/10_lattice_symmetry_motivation.tex`
- Title: Why Lattice Symmetry Generators Are a Problem
- Summary: Opens the lattice-symmetry programme: an abstract QM system supplies time evolution, while a lattice also supplies geometry.
- Summary: Separates sourced continuum symmetry targets from intuition-driven lattice generator guesses built from local Hamiltonian densities.
- Summary: Records the source boundary after registering Weinberg and Koo-Saleur alongside Schottenloher, OAR, and lattice-fermion sources.
- Keywords: lattice symmetry, time translation, Hamiltonian density, Poincare, Lorentz, boost, source gap

## `CA-11-CONTINUUM-BULK-SYMMETRY-TARGET`

- Source: `report/sections/11_continuum_bulk_symmetry_target.tex`
- Title: The Continuum Bulk Symmetry Target
- Summary: Fixes the continuum symmetry target as Poincare or Euclidean motion symmetry with projective-unitary implementation.
- Summary: Derives the Poincare vector-field brackets from the metric-preserving vector fields rather than importing an unsourced table.
- Summary: Pins the boost-time-translation-to-momentum relation up to the sign convention used by the lattice candidate layer.
- Keywords: Poincare algebra, Lorentz algebra, Euclidean group, boost, momentum, vector fields, Lie bracket

## `CA-12-LATTICE-BOOST-CURRENT-1D`

- Source: `report/sections/12_lattice_boost_current_1d.tex`
- Title: A One-Dimensional Boost Produces a Momentum Current
- Summary: Derives the nearest-neighbour identity that the first energy moment K=sum_j x_j h_j gives i[H,K] as a weighted sum of i[h_j,h_{j+1}].
- Summary: Interprets the uniform-spacing expression as the first lattice candidate for bulk momentum.
- Summary: Marks the derivation as local and conditional on the Hamiltonian-density decomposition and commutation range.
- Keywords: lattice boost, momentum current, Hamiltonian density, commutator, nearest neighbour, energy moment

## `CA-13-POSITION-DEPENDENT-BULK-GENERATORS`

- Source: `report/sections/13_position_dependent_bulk_generators.tex`
- Title: Position-Dependent Bulk Generators
- Summary: Generalizes the one-dimensional first-moment idea to scalar ramps, vector fields, translations, rotations, and boosts on lattices with positions.
- Summary: Distinguishes sourced continuum geometry from proposal-level lattice formulas for higher-dimensional bulk generators.
- Summary: Explains why rotations need momentum-density candidates, while boosts can start directly from the energy density.
- Keywords: position-dependent translation, lattice rotation, lattice boost, vector field, momentum density, higher dimensions

## `CA-14-KOO-SALEUR-PROTOTYPE`

- Source: `report/sections/14_koo_saleur_prototype.tex`
- Title: Koo-Saleur as the Prototype
- Summary: Uses the original Koo-Saleur source to record the lattice Virasoro prototype from Hamiltonian-density modes.
- Summary: Records the Koo-Saleur pattern: Fourier modes of h_j plus commutator corrections approximate Virasoro generators.
- Summary: Separates the original conjectural/numerical support from the later rigorous free-fermion/OAR convergence theorem.
- Keywords: Koo-Saleur, Virasoro, Hamiltonian density, Fourier modes, commutator correction, OAR

## `CA-15-LATTICE-SYMMETRY-ACCEPTANCE-TESTS`

- Source: `report/sections/15_lattice_symmetry_acceptance_tests.tex`
- Title: Acceptance Tests for Lattice Symmetry Candidates
- Summary: Turns lattice symmetry guesses into proof obligations: locality, self-adjointness, commutator closure, scaling convergence, and observable covariance.
- Summary: Uses OAR and continuum-limit sources to stress that translations can be recovered while Lorentz/conformal covariance is extra work.
- Summary: Defines the evidence payload a compiler must carry before calling a lattice candidate a continuum symmetry.
- Keywords: acceptance tests, scaling limit, Lieb-Robinson, covariance, Poincare, Lorentz, compiler evidence

## `CA-16-LATTICE-SYMMETRY-COMPILER-INTERFACE`

- Source: `report/sections/16_lattice_symmetry_compiler_interface.tex`
- Title: A Compiler Interface for Lattice Symmetry Candidates
- Summary: Extends the Hilbert-space compiler contract with lattice geometry, Hamiltonian densities, candidate generators, and symmetry evidence.
- Summary: Specifies successful and failed outputs for boosts, translations, rotations, and Koo-Saleur-style modes.
- Summary: Keeps candidate generation separate from proof of continuum covariance.
- Keywords: lattice compiler, symmetry compiler, Hamiltonian density, generator candidates, evidence payload, compile error

## `CA-17-LATTICE-SYMMETRY-EXAMPLES-QUEUE`

- Source: `report/sections/17_lattice_symmetry_examples_queue.tex`
- Title: Small Examples and the Lattice-Symmetry Research Queue
- Summary: Works through a sequence of small examples showing what the lattice-symmetry compiler can and cannot infer.
- Summary: Records boundary cases: black-box Hamiltonians, open chains, nonuniform spacing, periodic chains, square lattices, and Koo-Saleur modes.
- Summary: Lists the next source acquisitions and derivations needed before promoting the programme beyond proposal status.
- Keywords: examples, research queue, open chain, periodic chain, square lattice, Koo-Saleur, Weinberg, source acquisition

## `CA-18-GALILEAN-SYMMETRY-MOTIVATION`

- Source: `report/sections/18_galilean_symmetry_motivation.tex`
- Title: Why Galilean Symmetry Is a Different Lattice Target
- Summary: Opens the Galilean follow-up block by separating nonrelativistic spacetime symmetry from the Lorentzian energy-moment boost ansatz.
- Summary: Records the local source boundary: Galilei symmetry and projective-unitary lifting are sourced, while the named Bargmann mass extension remains a source gap.
- Summary: Identifies conserved mass or particle-number density as extra compiler input required for Galilean boost candidates.
- Keywords: Galilei group, Galilean symmetry, nonrelativistic symmetry, mass density, particle number, Bargmann source gap

## `CA-19-GALILEAN-VECTOR-FIELD-ALGEBRA`

- Source: `report/sections/19_galilean_vector_field_algebra.tex`
- Title: The Galilei Algebra as Newtonian Vector Fields
- Summary: Derives the unextended Galilei Lie algebra from vector fields on Newtonian spacetime with absolute time.
- Summary: Fixes the sign convention for time translations, spatial translations, boosts, and rotations, with representative brackets checked in Julia.
- Summary: Separates the unextended vector-field algebra from the projective mass-central extension treated in CA-20.
- Keywords: Galilei algebra, Newtonian spacetime, vector fields, boosts, rotations, Lie bracket, checked derivation

## `CA-20-GALILEAN-PROJECTIVE-MASS`

- Source: `report/sections/20_galilean_projective_mass.tex`
- Title: Projective Galilean Symmetry and the Mass Central Term
- Summary: Explains why the projective-representation layer is unavoidable for Galilean quantum symmetry.
- Summary: Derives the mass central coefficient from the canonical commutator [mX_a,P_b]=i m delta_ab on a common core.
- Summary: Records the source gap for a registered Bargmann mass-extension reference while keeping the local coefficient checked.
- Keywords: Galilean projective representation, mass central extension, Bargmann source gap, canonical commutator, Stone theorem

## `CA-21-LATTICE-GALILEAN-BOOSTS`

- Source: `report/sections/21_lattice_galilean_boosts.tex`
- Title: Lattice Galilean Boosts from Mass-Density First Moments
- Summary: Derives the Galilean lattice boost candidate as a first moment of conserved mass or particle-number density, not energy density.
- Summary: Uses a discrete continuity equation to derive the current-sum candidate for momentum, with coefficients checked in Julia.
- Summary: Separates exact finite-lattice conservation from the stronger continuum claim of Galilean covariance.
- Keywords: Galilean lattice boost, mass density, particle number, continuity equation, current, momentum candidate

## `CA-22-GALILEAN-COMPILER-INTERFACE`

- Source: `report/sections/22_galilean_compiler_interface.tex`
- Title: Compiler Rules and Examples for Galilean Targets
- Summary: Extends the lattice-symmetry compiler with Galilean-specific inputs: mass density, conserved charge, current witness, and central-extension data.
- Summary: Gives small successful and failed examples showing why a Hamiltonian density alone cannot compile Galilean boosts.
- Summary: Records the next source and proof obligations before Galilean lattice candidates can be promoted to continuum symmetry claims.
- Keywords: Galilean compiler, mass density, current witness, central extension, examples, compile error

## `CA-23-GAUSSIAN-BOSON-LORENTZ-ROADMAP`

- Source: `report/sections/23_gaussian_boson_lorentz_roadmap.tex`
- Title: Gaussian Boson Lorentz Generator Roadmap
- Summary: Opens the Gaussian-boson Lorentz block for spatial dimensions d=1,2,3 and fixes the first solvable target class.
- Summary: Decomposes the multi-shard quest into symbol calculus, diagonalisation, generator algebra, Lorentz conditions, numerical checks, and continuum proof obligations.
- Summary: States the end goal: identify when translation-invariant Gaussian lattice coefficients scale to the Klein-Gordon/free scalar Poincare representation.
- Keywords: Gaussian boson, Lorentz symmetry, Klein-Gordon, lattice generators, roadmap, quadratic Hamiltonian

## `CA-24-GAUSSIAN-BOSON-SYMBOL-CALCULUS`

- Source: `report/sections/24_gaussian_boson_symbol_calculus.tex`
- Title: Gaussian Boson Symbol Calculus and the Boost-Time Residual
- Summary: Defines the first scalar Gaussian-boson coefficient tier and its Fourier dispersion symbol in d=1,2,3.
- Summary: Derives the one-particle boost-time commutator symbol as one half of the gradient of omega squared.
- Summary: Checks the nearest-neighbour lattice Klein-Gordon example and its small-momentum Lorentz limit in Julia.
- Keywords: Gaussian boson, Fourier symbol, dispersion, boost, Klein-Gordon, Julia check

## `CA-25-GAUSSIAN-BOSON-DIAGONALIZATION`

- Source: `report/sections/25_gaussian_boson_diagonalization.tex`
- Title: Gaussian Boson Diagonalization and the One-Particle Symbol
- Summary: Diagonalizes the scalar translation-invariant Gaussian boson tier into oscillator modes in spatial dimensions d=1,2,3.
- Summary: Separates the sourced free-scalar Fock construction from the local coefficient-symbol derivation used by the compiler.
- Summary: Records the exact boundary where general bosonic BdG and pairing systems remain deferred.
- Keywords: Gaussian boson, diagonalization, one-particle Hilbert space, Fock, dispersion, BdG deferral

## `CA-26-GAUSSIAN-BOSON-GENERATOR-ALGEBRA`

- Source: `report/sections/26_gaussian_boson_generator_algebra.tex`
- Title: One-Particle Generator Algebra for Gaussian Bosons
- Summary: Defines the one-particle H, P, J, and K candidates on a smooth momentum-space core.
- Summary: Derives the commutators that are exact for any scalar dispersion and isolates the residuals that depend on omega.
- Summary: Records only formal dGamma bookkeeping on an algebraic finite-particle core, leaving many-body representation theorems open.
- Keywords: Gaussian boson, Poincare generators, boost, rotation, commutator, second quantization

## `CA-27-GAUSSIAN-BOSON-RESIDUAL-CONDITIONS`

- Source: `report/sections/27_gaussian_boson_residual_conditions.tex`
- Title: Lorentz Residual Conditions on Gaussian Coefficients
- Summary: Converts the boost-time and rotation residuals into explicit Taylor conditions on the scalar coefficient symbol.
- Summary: Shows why isotropic Klein-Gordon quadratic data are necessary but not sufficient for a one-particle relativistic scaling limit.
- Summary: Adds checked anisotropic and doubler counterexamples as compiler rejection witnesses.
- Keywords: Gaussian boson, Lorentz residual, Hessian, anisotropy, doubler, coefficient conditions

## `CA-28-GAUSSIAN-BOSON-NUMERICAL-SUITE`

- Source: `report/sections/28_gaussian_boson_numerical_suite.tex`
- Title: Numerical Verification Suite for Gaussian Boson Examples
- Summary: Specifies the Julia invariant suite for scalar Gaussian boson symbols in dimensions d=1,2,3.
- Summary: Checks finite periodic stiffness matrices against Brillouin-zone symbol values instead of relying on visual spectra.
- Summary: Records the current example systems: Klein-Gordon, anisotropic cones, and doubler symbols.
- Keywords: Gaussian boson, Julia, numerical verification, finite periodic lattice, stiffness matrix, examples

## `CA-29-GAUSSIAN-BOSON-REAL-SPACE-DENSITY`

- Source: `report/sections/29_gaussian_boson_real_space_density.tex`
- Title: Gaussian Boson Real-Space Energy Density
- Summary: Fixes the scalar Gaussian real-space energy-density convention as a local split of the sourced lattice Hamiltonian.
- Summary: Records cell-volume, equal bond-sharing, boundary, vacuum-subtraction, and improvement policies before position-weighted use.
- Keywords: Gaussian boson, real-space density, Hamiltonian density, cell volume, bond sharing, normal ordering, improvement

## `CA-30-GAUSSIAN-BOSON-1D-STRESS-CANDIDATES`

- Source: `report/sections/30_gaussian_boson_1d_stress_candidates.tex`
- Title: One-Dimensional Gaussian Boson Stress-Energy Candidates
- Summary: Proposes a 1+1-dimensional lattice stress-energy dictionary for the scalar Gaussian chain using the CA-29 density split.
- Summary: Promotes only the finite open-chain energy-current component T_01 to a checked seed via the A4 continuity witness.
- Summary: Keeps T_10 and T_11 as future momentum-density and momentum-current targets, not as consequences of symmetry or tracelessness.
- Keywords: Gaussian boson, stress-energy candidate, energy current, momentum density, open chain, continuity equation
