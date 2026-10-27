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

## `CA-31-GAUSSIAN-CURRENT-SYMBOL-EQUIVALENCE`

- Source: `report/sections/31_gaussian_current_symbol_equivalence.tex`
- Title: Gaussian Current-Symbol Equivalence in One Dimension
- Summary: Bridges the A4 real-space energy current to the CA-26 boost-time symbol for the nearest-neighbour scalar Gaussian chain.
- Summary: Checks only the translation-invariant integrated-current symbol, with the CA-29/CA-30 current orientation fixed explicitly.
- Summary: Leaves finite open-chain wave packets, dGamma(k), and continuum convergence as pending proof obligations.
- Keywords: Gaussian boson, energy current, boost-time symbol, Klein-Gordon, translation invariant, one dimension

## `CA-32-GAUSSIAN-HIGHER-DIMENSIONAL-CELL-CURRENTS`

- Source: `report/sections/32_gaussian_higher_dimensional_cell_currents.tex`
- Title: Higher-Dimensional Gaussian Cell-Current Proposal
- Summary: Proposes a compiler-input specification for d=2,3 Gaussian cell currents using oriented cells, faces, and incidence signs.
- Summary: Separates energy flux, momentum density, and stress witnesses instead of inferring T_a0 from T_0a or assuming symmetric stress.
- Summary: Records rotation, trace, improvement, and open-versus-periodic boundary diagnostics as future numerical targets, not convergence claims.
- Keywords: Gaussian boson, higher dimensions, cell current, stress tensor, rotation, boundary terms, compiler input

## `CA-33-GAUSSIAN-STRESS-NUMERICAL-SUITE`

- Source: `report/sections/33_gaussian_stress_numerical_suite.tex`
- Title: First Gaussian Stress-Energy Numerical Suite
- Summary: Extends the checked Gaussian current layer with finite open-chain T_01 continuity tests across several chains and endpoint signs.
- Summary: Adds a one-dimensional nearest-neighbour current-symbol slope residual that detects wrong speed, bond magnitude, and orientation.
- Summary: Keeps periodic first moments, finite-chain dGamma(k), higher-dimensional current densities, and T_11 witnesses as open obligations.
- Keywords: Gaussian boson, stress-energy numerical suite, open chain, energy current, slope residual, failure witness

## `CA-34-QUBIT-NEAREST-NEIGHBOUR-SYMMETRY-QUEST`

- Source: `report/sections/34_qubit_nearest_neighbour_symmetry_quest.tex`
- Title: Qubit Nearest-Neighbour Symmetry Quest
- Summary: Opens the qubit nearest-neighbour lattice-symmetry investigation in Pauli-basis coefficients.
- Summary: Separates checked finite algebraic obstruction tests from proposal-level Poincare, Witt, and Virasoro diagnostics.
- Summary: Records the concrete investigation plan for 1+1 and 2+1 dimensions.
- Keywords: qubit, Pauli basis, nearest neighbour, Poincare, Witt, Virasoro, algebraic diagnostic

## `CA-35-QUBIT-1D-BOOST-CURRENT-OBSTRUCTIONS`

- Source: `report/sections/35_qubit_1d_boost_current_obstructions.tex`
- Title: One-Dimensional Qubit Boost-Current Obstructions
- Summary: Derives the adjacent-current polynomial for a qubit two-site Pauli density.
- Summary: Checks that symmetric fully on-site Hamiltonians and commuting classical densities have zero CA-12 bulk momentum candidate.
- Summary: Records why this rules out only the first-moment route to nontrivial Poincare symmetry, not every possible construction.
- Keywords: qubit chain, Pauli basis, boost current, adjacent commutator, onsite obstruction, Poincare diagnostic

## `CA-36-QUBIT-2D-PLAQUETTE-SYMMETRY-DIAGNOSTICS`

- Source: `report/sections/36_qubit_2d_plaquette_symmetry_diagnostics.tex`
- Title: Two-Dimensional Qubit Plaquette Symmetry Diagnostics
- Summary: Proposes finite-patch algebraic diagnostics for 2+1D qubit nearest-neighbour edge densities.
- Summary: Uses ramp currents, translation residuals, isotropy, and rotation closure as rejection filters, not continuum claims.
- Summary: Identifies fully on-site, commuting, decoupled-stack, and anisotropic edge data as early rule-out classes.
- Keywords: qubit lattice, 2+1 dimensions, plaquette, Poincare, ramp current, isotropy, rotation diagnostic

## `CA-37-QUBIT-WITT-VIRASORO-DIAGNOSTICS`

- Source: `report/sections/37_qubit_witt_virasoro_diagnostics.tex`
- Title: Qubit Nearest-Neighbour Witt/Virasoro Diagnostics
- Summary: Proposes finite algebraic rejection tests for 1+1D qubit nearest-neighbour Pauli densities using Fourier density modes and adjacent-current corrections.
- Summary: Identifies current-zero and chiral-rank collapse as simple failure witnesses before any continuum convergence theorem.
- Summary: Separates central-term extraction, finite-size non-closure, and low-energy compression from raw full-Hilbert-space commutators.
- Keywords: qubit chain, Pauli basis, Koo-Saleur, Witt, Virasoro, current mode, failure witness

## `CA-38-QUBIT-LOCAL-ALGEBRA-EQUATION-FRAMEWORK`

- Source: `report/sections/38_qubit_local_algebra_equation_framework.tex`
- Title: Qubit Local-Algebra Equation Framework
- Summary: Fixes the finite Pauli-word calculus used to turn qubit lattice symmetry residuals into explicit coefficient equations.
- Summary: Defines the coboundary quotient for infinite-chain bulk densities, so residuals may vanish modulo telescoping boundary terms.
- Summary: Separates checked finite algebra from continuum Poincare or Virasoro claims.
- Keywords: qubit, Pauli words, local algebra, coboundary, coefficient equations, infinite chain

## `CA-39-QUBIT-1D-POINCARE-NECESSARY-EQUATIONS`

- Source: `report/sections/39_qubit_1d_poincare_necessary_equations.tex`
- Title: One-Dimensional Qubit Poincare Necessary Equations
- Summary: Writes the full first-moment-route Poincare obstruction equations for a nearest-neighbour qubit density in Pauli coefficients.
- Summary: The equations are the current definition, translation conservation modulo a coboundary, and the boost-translation relation modulo a coboundary.
- Summary: Fully on-site and commuting densities fail because their generated momentum current collapses.
- Keywords: qubit chain, Poincare, necessary equations, Pauli coefficients, boost, coboundary

## `CA-40-QUBIT-1D-RESIDUAL-COMPUTER-ALGEBRA`

- Source: `report/sections/40_qubit_1d_residual_computer_algebra.tex`
- Title: Computer Algebra for One-Dimensional Qubit Residuals
- Summary: Records the Julia helpers that reconstruct Pauli operators, currents, coboundaries, and boost residual densities.
- Summary: The tests check nontrivial invariants: current collapse for symmetric onsite terms, nonzero interacting currents, and coboundary operator reconstruction.
- Summary: The code is a finite residual engine, not yet an SDP solver.
- Keywords: Julia, Pauli coefficients, residuals, coboundary, tests, qubit chain

## `CA-41-QUBIT-2D-POINCARE-EQUATION-SCHEMA`

- Source: `report/sections/41_qubit_2d_poincare_equation_schema.tex`
- Title: Two-Dimensional Qubit Poincare Equation Schema
- Summary: Gives a proposal-level square-lattice edge-density schema for ramp momenta, conservation, commuting momenta, boosts, and rotations.
- Summary: Every residual is a finite Pauli coefficient equation modulo a named two-dimensional lattice divergence.
- Summary: The shard records the orientation and midpoint choices needed before a two-dimensional checker can be built.
- Keywords: qubit, square lattice, 2+1 dimensions, Poincare, edge density, divergence

## `CA-42-QUBIT-WITT-VIRASORO-NECESSARY-EQUATIONS`

- Source: `report/sections/42_qubit_witt_virasoro_necessary_equations.tex`
- Title: Qubit Witt/Virasoro Necessary Equations
- Summary: Derives exact finite Fourier-mode commutators from the qubit nearest-neighbour density and current.
- Summary: States the chiral residual equations that any Koo-Saleur-style Virasoro ansatz must satisfy before low-energy scaling is considered.
- Summary: Keeps central charge and finite-size closure caveated by the Koo-Saleur and OAR source boundaries.
- Keywords: qubit, Witt, Virasoro, Koo-Saleur, Fourier modes, current algebra

## `CA-43-QUBIT-VACUUM-MOMENT-CONSTRAINTS`

- Source: `report/sections/43_qubit_vacuum_moment_constraints.tex`
- Title: Vacuum Moment Constraints for Qubit Residuals
- Summary: Defines finite restrictions of a translation-invariant global state by Pauli-word moments and positive moment matrices.
- Summary: Converts local Poincare and Virasoro residuals into linear moment equations of the form omega(X^* R Y)=0.
- Summary: Records the zero-expectation and normal-ordering data needed before an SDP can exclude Hamiltonians.
- Keywords: vacuum state, moments, GNS, Pauli words, SDP constraints, qubit chain

## `CA-44-QUBIT-SDP-EXCLUSION-HIERARCHY`

- Source: `report/sections/44_qubit_sdp_exclusion_hierarchy.tex`
- Title: SDP Exclusion Hierarchy for Qubit Hamiltonians
- Summary: Packages finite Pauli moments, positivity, translation invariance, stationarity, and residual relations into a monotone SDP hierarchy.
- Summary: Infeasibility at any level excludes a fixed Hamiltonian density for the named generator route; feasibility proves nothing.
- Summary: Identifies which parameters must be fixed or scanned so the problem remains an SDP.
- Keywords: SDP hierarchy, exclusion, qubit Hamiltonian, moments, Poincare residuals, Virasoro residuals

## `CA-45-QUBIT-SYMMETRY-EXCLUSION-ROADMAP`

- Source: `report/sections/45_qubit_symmetry_exclusion_roadmap.tex`
- Title: Roadmap for Qubit Symmetry Exclusion
- Summary: Summarizes the necessary-equation block and turns it into an implementation plan for algebraic filters and SDP exclusions.
- Summary: Records the delegated subagent work, the checked Julia surface, and the open convention gaps.
- Summary: Gives acceptance tests for future runs before any Hamiltonian is claimed excluded.
- Keywords: roadmap, qubit exclusion, SDP, Poincare, Virasoro, orchestration

## `CA-46-QUBIT-SDP-IMPLEMENTATION-CONTRACT`

- Source: `report/sections/46_qubit_sdp_implementation_contract.tex`
- Title: Qubit SDP Implementation Contract
- Summary: Fixes the Julia API and solver boundary for the fixed-h qubit moment hierarchy.
- Summary: Separates exact Pauli algebra, algebraic Poincare witnesses, JuMP model construction, and Mosek solves.
- Summary: States what an exclusion verdict means and what evidence must accompany it.
- Keywords: qubit, SDP, implementation, JuMP, Mosek, fixed Hamiltonian, exclusion

## `CA-47-QUBIT-PAULI-WORD-MOMENT-BASIS`

- Source: `report/sections/47_qubit_pauli_word_moment_basis.tex`
- Title: Pauli Word Moment Basis for Infinite Qubit Chains
- Summary: Implements finite positioned Pauli words and translation-canonical moment variables.
- Summary: Exact Pauli multiplication gives the phases used in moment matrices and residual constraints.
- Summary: Rows and columns are actual local words; only the moment variables are quotiented by translation.
- Keywords: Pauli words, moment basis, translation invariance, qubit chain, exact algebra

## `CA-48-QUBIT-MOMENT-MATRIX-CONSTRUCTION`

- Source: `report/sections/48_qubit_moment_matrix_construction.tex`
- Title: Moment Matrices and Positivity Constraints
- Summary: Builds the finite moment matrix M_{u,v}=omega(P_u^*P_v) from exact Pauli products.
- Summary: Uses the realification [A -B; B A] to impose complex Hermitian positivity in JuMP.
- Summary: Checks feasible and infeasible tiny Mosek instances as smoke tests.
- Keywords: moment matrix, positivity, realification, JuMP, Mosek, qubit SDP

## `CA-49-QUBIT-RESIDUAL-RELATION-COMPILER`

- Source: `report/sections/49_qubit_residual_relation_compiler.tex`
- Title: Compiling Poincare Residuals into Moment Equations
- Summary: Implements the fixed-h residual terms A-Du and B-u-lambda h+mu I-Dw used by the SDP hierarchy.
- Summary: Adds linear witness solvers for the conservation and boost coboundary equations before SDP construction.
- Summary: Relation constraints are compiled as real and imaginary affine equations omega(X^* R Y)=0.
- Keywords: Poincare residual, coboundary witness, moment constraints, qubit SDP, fixed h

## `CA-50-QUBIT-SDP-LEVELS-AND-MOSEK-BACKEND`

- Source: `report/sections/50_qubit_sdp_levels_and_mosek_backend.tex`
- Title: SDP Levels and the Mosek Backend
- Summary: Defines the implemented level data: PSD probe words, relation probe words, residuals, and moment variables.
- Summary: Documents the JuMP/Mosek status map used for finite-level exclusion.
- Summary: Records the smoke run bundle that checks feasible and infeasible tiny instances.
- Keywords: SDP levels, Mosek, JuMP, solver status, run bundle, exclusion

## `CA-51-QUBIT-SDP-SENTINEL-HAMILTONIANS`

- Source: `report/sections/51_qubit_sdp_sentinel_hamiltonians.tex`
- Title: Sentinel Hamiltonians for the SDP Hierarchy
- Summary: Records deterministic qubit coefficient matrices used to test current collapse, conservation witnesses, boost witnesses, and SDP contradictions.
- Summary: Fully onsite and ZZ densities fail by current collapse; fake and generic densities fail conservation; the transverse-Ising-style density reaches the boost gate.
- Summary: These are implementation sentinels, not claims of criticality or continuum symmetry.
- Keywords: sentinel Hamiltonians, qubit, current collapse, transverse Ising, ZZ, screening

## `CA-52-QUBIT-CANDIDATE-SELECTION-ROADMAP`

- Source: `report/sections/52_qubit_candidate_selection_roadmap.tex`
- Title: Candidate Hamiltonian Selection Roadmap
- Summary: Explains how algebraic gates and SDP levels prioritize real qubit Hamiltonian candidates for later scaling-limit work.
- Summary: Feasibility is treated as survival of a finite exclusion test, never as evidence of symmetry.
- Summary: Lists the next implementation steps: witness scans, run-bundle format, and physical source registration for named model families.
- Keywords: candidate selection, qubit Hamiltonian, screening, SDP hierarchy, Poincare, Virasoro

## `CA-53-QUBIT-CANDIDATE-SCAN-CONTRACT`

- Source: `report/sections/53_qubit_candidate_scan_contract.tex`
- Title: Qubit Candidate Scan Contract
- Summary: Fixes the candidate-scan API, result schema, and scoped verdict vocabulary.
- Summary: Separates exact algebraic gates, optional SDP levels, and physical interpretation.
- Summary: Survival is not symmetry evidence, and exclusion is always route-scoped.
- Keywords: qubit, candidate scan, result schema, fixed first-moment route, exclusion

## `CA-54-QUBIT-HAMILTONIAN-FAMILY-CONVENTIONS`

- Source: `report/sections/54_qubit_hamiltonian_family_conventions.tex`
- Title: Pauli Coefficients for Scan Families
- Summary: Fixes signs and coefficient maps for TFIM, XY, XXZ, Heisenberg, and synthetic grids.
- Summary: Distinguishes locally sourced physical labels from synthetic stress-test labels.
- Summary: Records the symmetric field split used by every candidate matrix.
- Keywords: qubit, Pauli coefficients, TFIM, XY, XXZ, synthetic grid, convention

## `CA-55-QUBIT-SOURCED-SPIN-CHAIN-FAMILIES`

- Source: `report/sections/55_qubit_sourced_spin_chain_families.tex`
- Title: Locally Sourced Spin-Chain Inputs
- Summary: Records the physical qubit families that have local source anchors.
- Summary: TFIM, transverse XY, and XXZ/Heisenberg are sourced; XYZ, DM, compass, clock, and Potts are not plain sourced qubit NN inputs here.
- Summary: Criticality claims are separated from scan verdicts.
- Keywords: TFIM, XY, XXZ, Heisenberg, source anchors, qubit scan

## `CA-56-QUBIT-SYNTHETIC-GRID-FAMILIES`

- Source: `report/sections/56_qubit_synthetic_grid_families.tex`
- Title: Synthetic and Stress-Test Hamiltonian Grids
- Summary: Defines the unsourced grids used to stress the algebraic gates.
- Summary: Synthetic names are implementation inputs, not physical criticality claims.
- Summary: Deterministic generic samples make the run reproducible without random state.
- Keywords: synthetic grid, XYZ, DM, compass, generic bilinear, stress test

## `CA-57-QUBIT-ALGEBRAIC-SCAN-GATES`

- Source: `report/sections/57_qubit_algebraic_scan_gates.tex`
- Title: Current, Conservation, and Boost Witness Gates
- Summary: Documents the three algebraic gates used before any SDP solve.
- Summary: The scan records residual norms and terminal gates for every point.
- Summary: The self-dual TFIM result exposes the strictness of the exact boost-witness route.
- Keywords: current gate, conservation witness, boost witness, TFIM, algebraic scan

## `CA-58-QUBIT-SDP-SCAN-LEVELS`

- Source: `report/sections/58_qubit_sdp_scan_levels.tex`
- Title: Optional SDP Levels for Scan Survivors
- Summary: Specifies when a candidate scan invokes the fixed-residual Mosek SDP layer.
- Summary: Solver statuses inherit the CA-50 finite-level semantics.
- Summary: The first broad scan stops before SDP because no point survives the exact boost gate.
- Keywords: SDP scan, Mosek, fixed residual, survivor, finite level

## `CA-59-QUBIT-CANDIDATE-SCAN-RUN-BUNDLE`

- Source: `report/sections/59_qubit_candidate_scan_run_bundle.tex`
- Title: Reproducible Scan Bundle Format
- Summary: Defines the files written by the first qubit candidate scan.
- Summary: The bundle stores inputs, summary counts, notable points, and one result row per Hamiltonian.
- Summary: INDEX.md and the worklog point to the producer script and run directory.
- Keywords: run bundle, TOML, candidate scan, reproducibility, INDEX

## `CA-60-QUBIT-CANDIDATE-SCAN-RESULTS`

- Source: `report/sections/60_qubit_candidate_scan_results.tex`
- Title: First Candidate Scan Results
- Summary: Reports the checked 99-point qubit Hamiltonian scan.
- Summary: All points fail before a nontrivial exact boost witness; TFIM and XXZ fail at that boost gate.
- Summary: The result rejects the exact first-moment route, not the sourced CFT status of known critical models.
- Keywords: scan results, TFIM, XXZ, Heisenberg, boost witness, route failure

## `CA-61-QUBIT-SCAN-TO-SCALING-QUEUE`

- Source: `report/sections/61_qubit_scan_to_scaling_queue.tex`
- Title: From Scan Failures to Scaling Work
- Summary: Converts the first scan into next proof obligations rather than a dead end.
- Summary: Known critical TFIM and gapless XXZ should move to Koo-Saleur/OAR-style diagnostics.
- Summary: Future SDP work must relax or quotient the boost relation instead of requiring an exact local witness.
- Keywords: scaling queue, TFIM, XXZ, Koo-Saleur, OAR, future SDP

## `CA-62-CATEGORICAL-BU-PIPELINE-VISION`

- Source: `report/sections/62_categorical_bu_pipeline_vision.tex`
- Title: The Categorical Borchers-Uhlmann Pipeline: a Programme Refinement
- Summary: Recasts the indefinite-particle construction as a proposed observable *-algebra-first pipeline rather than a Hilbert-space-first construction.
- Summary: Orders category data, free local-word algebra, categorical relations, state selection, GNS quotient, and OAR/Koo-Saleur continuum limits.
- Summary: Records the Jones no-go and exact-relation scan failure as load-bearing constraints on the programme.
- Keywords: Borchers-Uhlmann, GNS, tensor algebra, anyon chains, Koo-Saleur, OAR, defects, functoriality

## `CA-63-QUBIT-MOMENT-STATE-EXISTENCE`

- Source: `report/sections/63_qubit_moment_state_existence.tex`
- Title: All-Level Moment Feasibility Gives a Qubit Reference State
- Summary: Proves that exact feasibility of the monotone full-window qubit moment hierarchy yields a genuine state on the quasi-local spin algebra.
- Summary: Shows that the all-level relation constraints vanish as bounded operators in the GNS representation.
- Summary: Separates this compactness result from uniqueness, ground-state, clustering, continuum-limit, and Virasoro claims.
- Keywords: moment hierarchy, compactness, state space, GNS, qubit chain, residual quotient

## `CA-64-QUBIT-RELAXED-SYMMETRY-GATES`

- Source: `report/sections/64_qubit_relaxed_symmetry_gates.tex`
- Title: Quantified Relaxations of the Qubit Symmetry Gates
- Summary: Replaces exact first-moment gates by coefficient residual profiles and fixed-residual GNS-norm SDP objectives.
- Summary: Keeps current collapse as a hard obstruction for the nonzero-speed first-moment route.
- Summary: Records that witness optimization inside the moment SDP is not a plain SDP without an additional polynomial lift.
- Keywords: relaxed gates, residual profile, GNS norm, SDP objective, TFIM, boost

## `CA-65-ANYONIC-WORD-ALGEBRA`

- Source: `report/sections/65_anyonic_word_algebra.tex`
- Title: Anyonic Word Algebra from a Site Object
- Summary: Defines the local anyonic observable tower as End_C(O^{tensor L}) for a chosen site object O, not for a bare category alone.
- Summary: Separates the BU-style free word layer from the kinematic fusion quotient and the later dynamical GNS quotient.
- Summary: Records the tube/double-triangle algebra as a deferred defect and symmetry layer, not as the observable algebra.
- Keywords: anyonic word algebra, site object, AF algebra, fusion quotient, BU algebra, double triangle, tube algebra

## `CA-66-ANYONIC-STATES-VARIABLE-N-FOCK`

- Source: `report/sections/66_anyonic_states_variable_n_fock.tex`
- Title: Anyonic States and Variable-N Fock Space
- Summary: Builds the finite hard-core anyonic Fock space H_L as a direct sum of charge Hom spaces for the site object O=1 plus X.
- Summary: Identifies a charge-diagonal finite-state/GNS target and records the residual minimal-projection freedom.
- Summary: Shows how birth/death maps, Hollands' dense-chain corner, and Fibonacci dimension targets fit the adopted word-algebra tower.
- Keywords: anyonic Fock space, variable particle number, hard-core anyons, charge sectors, GNS, Fibonacci, pair creation

## `CA-67-REFINEMENT-REQUIREMENTS-OBSTRUCTIONS`

- Source: `report/sections/67_refinement_requirements_obstructions.tex`
- Title: Refinement-Map Requirements and Obstructions
- Summary: Collects the sourced OAR conditions a refinement family must satisfy, and the soft relaxations available when exact intertwining fails.
- Summary: Extracts the mechanism of the Jones and Kliesch-Koenig no-go results as a checklist of failure modes to avoid.
- Summary: Locates precisely where fixed anyon number is baked into the braiding-RG refinement, motivating the variable-N family of CA-68.
- Keywords: refinement maps, scaling maps, OAR, soft inductive limit, Jones no-go, Kliesch-Koenig, braiding RG, Koo-Saleur

## `CA-68-VARIABLE-N-REFINEMENT-MAPS`

- Source: `report/sections/68_variable_n_refinement_maps.tex`
- Title: Refinement Maps for the Variable-N Anyonic Word Algebra
- Summary: Defines vacuum-insertion refinement for the site object O=1 plus X and proves its exact locality, isometry, and charge preservation.
- Summary: Separates the nonunital corner algebra map from strict OAR unital scaling maps, and proposes dressed refinements for Virasoro compatibility.
- Summary: Records the Fibonacci H_2 to H_4 test target and the archived-project deficit/pair-creation precedent as re-derivation targets.
- Keywords: refinement maps, variable-N anyons, vacuum insertion, OAR, Koo-Saleur, Virasoro, Fibonacci, dilute Temperley-Lieb

## `CA-69-DILUTE-TL-WORD-ALGEBRA`

- Source: `report/sections/69_dilute_tl_word_algebra.tex`
- Title: The Dilute Temperley-Lieb Algebra and the Anyonic Word Algebra
- Summary: Registers the dilute Temperley-Lieb algebra dTL_n(beta) with its Motzkin dimension, generators, parity ideals, and dense corners.
- Summary: Defines the diagram evaluation map into the maybe-object word algebra and proves it cannot be surjective for Fibonacci.
- Summary: Identifies the parity-even subalgebra as the conjectured image, with exact dimension matches at L=2,3 and an open Jones-Wenzl kernel question at L>=4.
- Keywords: dilute Temperley-Lieb, Motzkin, word algebra, parity, evaluation map, Fibonacci, Jones-Wenzl

## `CA-70-DILUTE-KOO-SALEUR-ANSATZ`

- Source: `report/sections/70_dilute_koo_saleur_ansatz.tex`
- Title: The Dilute Koo-Saleur Ansatz
- Summary: Adapts the sourced dense-TL Koo-Saleur generator recipe to Hamiltonian densities built from dilute Temperley-Lieb generators.
- Summary: Registers the two sourced critical anchors: the dilute O(n)/Izergin-Korepin chains with exact branch central charges, and the local anyonic t-J models.
- Summary: States the proof obligations, including the central-term/limit gap inherited from the dense case and the periodic dilute algebra setting.
- Keywords: Koo-Saleur, dilute Temperley-Lieb, Izergin-Korepin, dilute O(n), anyonic t-J, lattice Virasoro, periodic dilute algebra

## `CA-71-REFINEMENT-PLACEMENT-CATEGORY`

- Source: `report/sections/71_refinement_placement_category.tex`
- Title: The Refinement Placement Category and Exact Composition
- Summary: Defines general k-to-l vacuum-placement refinements as order-preserving injections and proves isometry, charge preservation, and exact composition.
- Summary: Identifies the dyadic vacuum insertion as the seed of a Jones forest tensor functor, with Thompson-group symmetry and Hilbert/C*-algebra targets sourced from Brothier-Stottmeister.
- Summary: Records the Ore dichotomy for coloured forest-skein categories and the divisibility/soft-system fallbacks that house mixed-radix and dressed refinements.
- Keywords: refinement, placement, forest category, Thompson group, Jones functor, Ore property, vacuum insertion, k to l, composability

## `CA-72-GNS-DESCENT-CORNER-CALCULUS`

- Source: `report/sections/72_gns_descent_corner_calculus.tex`
- Title: GNS Descent and the Corner Calculus of Placement Refinements
- Summary: Proves that every placement refinement descends to an isometric intertwiner of GNS representations, with vacuum defect 2(1-sqrt(omega(P))).
- Summary: Computes the unital CP completion's multiplicativity defect exactly as (chi(ST)-chi(S)chi(T))(1-P), tying soft C*-structure to omega(1-P) -> 0.
- Summary: States the residual-descent criterion and the BU-level refinement square as the interface contracts consumed by the categorical residual set.
- Keywords: GNS, corner, refinement, descent, unital completion, multiplicativity defect, soft C*-system, residual descent, vacuum defect

## `CA-73-CATEGORICAL-RESIDUAL-SET`

- Source: `report/sections/73_categorical_residual_set.tex`
- Title: The Categorical Residual Set on the Anyonic Word Tower
- Summary: Ports the qubit coboundary and Witt/Virasoro residual calculus to A_L = End_C(O^{tensor L}), with Tier-1 dilute densities and open-window mode identities.
- Summary: Proves exact transport of the residual calculus through corner refinements and defines the stretched-augmented coherent residual family satisfying the CA-72 descent contract.
- Summary: Writes every lattice Virasoro closure with the two-constant (c, c*) central term of CONVENTIONS (s); periodic modes stay gated behind decision D1.
- Keywords: residual set, coboundary, Ward identity, Koo-Saleur, dilute Temperley-Lieb, transport, stretched density, two central constants, open chain

## `CA-74-JW-KERNEL-DECISION`

- Source: `report/sections/74_jw_kernel_decision.tex`
- Title: The Jones-Wenzl Kernel Decision for the Dilute Evaluation Map
- Summary: Settles the CA-69 conjecture at L=4: the dilute evaluation map rho_4 surjects onto the parity-preserving subalgebra and its one-dimensional kernel is the corner-embedded Jones-Wenzl projector iota(p_4).
- Summary: Derives the parity-refined charge multiplicities in closed form, (F_{2L-1} +- F_{L+1})/2 and (F_{2L} -+ F_L)/2, giving parity-preserving dimensions 9, 51, 322, 2135, 14445 for L = 2..6.
- Summary: Upgrades CA-69 to the conjecture ker rho_L = the ideal generated by corner Jones-Wenzl embeddings, with rigorous lower bounds 53 and 1066 on the kernel dimension at L = 5, 6.
- Keywords: Jones-Wenzl, kernel, dilute Temperley-Lieb, parity, evaluation map, negligible ideal, radical, Fibonacci, rank

## `CA-75-INTEGRATION-MAP`

- Source: `report/sections/75_integration_map.tex`
- Title: Integration Map: One Model-Independent Pipeline
- Summary: Maps the variable-N tower, the spacetime Trotter dictionary, the cft_machine OAR contracts and the reconstruction sewing equations onto six typed layers for a general unitary fusion or modular category with declared extra data.
- Summary: Names the two unwritten joins as open questions and merges CA-15, CA-67, CA-81 and LC-4 into one acceptance contract on a lattice tower; makes no new mathematical claim.
- Keywords: integration map, pipeline, acceptance contract, lattice tower, refinement, Wilson triangle, Koo-Saleur, sewing, fidelity, model independence

## `CA-76-CORNER-TO-WILSON-BRIDGE`

- Source: `report/sections/76_corner_to_wilson_bridge.tex`
- Title: Corner-to-Wilson Bridge: Refinement Meets Dynamics
- Summary: For general unitary fusion C with pointed site object O, converts the CA-72 corner weight into WT-1 drift: a strict unital lift gives d_{k,n} <= p_n e_n + 2(1-p_n); a unique gapped fine vacuum with residual eps_n gives d_{k,n} <= 2 eps_n/Delta_{n+1} and non-collapse.
- Summary: Proves isometry and the exactly local first tangent of the polar heat refinement, states Conjecture D3-C with its UV-only verdict, the unital-extension criterion (local braided lift only proposed), negative results, and the global-fidelity versus local-lift dichotomy that is CA-75 Link (b3).
- Summary: Records confirmed corrections to CA-72 Cor. 72.8 (operator-norm softness) and CA-73 Lemma 73.1 (global corner pins, corner unit P).
- Keywords: corner weight, Wilson triangle, WT-1, drift, unital lift, scalar augmentation, vacuum residual, spectral gap, polar refinement, imaginary time, local tangent, D3-C, non-collapse, Link (b3), corner unit, soft C*-system

## `CA-77-POINTED-CARRIER-INVARIANTS`

- Source: `report/sections/77_pointed_carrier_invariants.tex`
- Title: Pointed Carriers: Occupation Grading, Dual-Pair Blocking, and Corner Qualifications
- Summary: For a pointed site object O = 1 + X in any unitary fusion category, separates the unital and corner towers, proves the occupation Z-grading with its two-site dimension count and all-scale parity criterion, and makes dual-pair blocking O = Y x Ybar (Y not necessarily simple) a decidable integer test generalising Lemma 87.1.
- Summary: Records that the Morita class of O x Obar is constant, the GNS, trace and operator-norm facts that qualify CA-71--CA-73, and the ordered-configuration Fock carrier of length-weighted dressing; the collision-sewing conjecture is kept conjectural with its contact-tuning caveat.
- Keywords: pointed object, site object, variable-N carrier, occupation grading, parity, blocking, dual pair, Morita class, corner map, vacuum insertion, configuration space, Fock space, Thompson group, refinement

## `CA-78-CATEGORICAL-SELECTION-EQUATIONS`

- Source: `report/sections/78_categorical_selection_equations.tex`
- Title: Finite Selection Equations for a Categorical Nearest-Neighbour Hamiltonian
- Summary: For general unitary fusion C and site object O, compiles h in End_C(O x O) into finite coefficient equations: an exact gate ODE upgrading Lemma 86.1, blocking with leakage (lossless fixed-carrier blocking forces d_O = 1), and the cubic cokernel test [h12+h23,[h12,h23]] = K23-K12 for analytic additive YBE.
- Summary: Proves YBE and brick-sweep commutativity imply neither the other (repaired converse), issues an erratum to CA-86 Prop. 86.3, bounds what braiding, defect symmetry and metric independence can select, and states the conditional WT-1 / VR-1 interface lemmas.
- Summary: Records the sufficiency conjecture D2-C with its reviewer verdict (category-blind, no verified instance) and the attackable Ward-to-KS transfer lemma; no coupling is selected.
- Keywords: selection principle, coefficient compiler, gate ODE, blocking, leakage, Yang-Baxter, cokernel test, Reshetikhin condition, Temperley-Lieb, brick transfer, erratum, Baxterisation, defect symmetry, collar bound, Ward identity, Koo-Saleur

## `CA-79-KS-SHELL-AND-REFINEMENT-DEFECT`

- Source: `report/sections/79_ks_shell_and_refinement_defect.tex`
- Title: Koo--Saleur Tiles: Spectral-Shell Certificate and Refinement Defect
- Summary: For any unitary fusion category C, writes the standard Koo-Saleur modes as Fourier sums of evaluated two- and three-site tiles and reduces VR-1 A1-A4 to a spectral-shell certificate P0-P3 for an exactly transported grading Q, with K = Q^p, p > 1 (conditional; the p = 1 counterexample shows the spare power is needed).
- Summary: Splits the KS refinement defect under any isometry into leakage, compression and phase/geometry parts, proves bare dyadic insertion cannot carry two-site energy and that exact full-stage covariance leaves only the zero representation, and lifts the character-growth obstruction to the sharp threshold c > 1.
- Keywords: Koo-Saleur, tile, spectral shell, graph norm, VR-1, Carpi-Weiner energy bound, refinement defect, leakage, vacuum insertion, exact covariance no-go, character growth, extended fields, inverse discretisation

## `CA-80-LATTICE-SEWING-AND-FIDELITY-CERTIFICATE`

- Source: `report/sections/80_lattice_sewing_and_fidelity_certificate.tex`
- Title: Exact Lattice Cells, Temporal Reflection Positivity, and a Two-Sided Fidelity Certificate
- Summary: For any unitary fusion category C, finite history-sum patches sew exactly along tile legs (inverse Gram, F^{-T} dual bases); temporal reflection positivity is blockwise positivity of the seam operator, forcing h self-adjoint but no sign rule on tile coefficients; Ward residuals obey an exact product rule.
- Summary: Fusion operators alone never certify fidelity (D_a = d_a 1); a fully faithful endpoint functor plus an annular index bound mu <= Dim B forces braided equivalence onto the complete sector category, conditional on an index limit step, supplied from finite data under a common normal state by CA-93.
- Keywords: lattice sewing, history sum, reflection positivity, Gram contraction, dual basis, Ward residual, Duhamel, defect operators, fidelity, Pimsner-Popa index, four-interval inclusion, KLM, Verlinde, character growth, chiral versus full

## `CA-81-CFT-MACHINE-OAR-CONTRACT`

- Source: `report/sections/81_cft_machine_oar_contract.tex`
- Title: The CFT Machine and Its Quantitative OAR Contract
- Summary: Restates the algorithmic north star with Wilson-triangle state construction and microscopic Virasoro convergence as separate compatible requirements.
- Summary: Gives a Lamport proof of quantitative horizontal state convergence and records the independently reviewed graph-norm generator theorem.
- Keywords: algorithm, functor, OAR, Wilson triangle, Lamport proof, state convergence, microscopic Virasoro

## `CA-82-ISING-MODULAR-COMPILER`

- Source: `report/sections/82_ising_modular_compiler.tex`
- Title: A Supported Ising Modular-Data Compiler
- Summary: Constructs microscopic Majorana Hamiltonians, corrected KS modes, and factorwise even observable towers from exact Ising modular input and declared tensor products.
- Summary: Identifies the NS sampled-generator local limit using the even real-fermion net and the sourced complete Ising sector data, with all factor stress families retained.
- Keywords: Ising, modular data, compiler, Majorana, even CAR, OAR, local net, tensor product, Koo-Saleur

## `CA-83-COSET-LATTICE-STRESS`

- Source: `report/sections/83_coset_lattice_stress.tex`
- Title: Coset Lattice Stress Generators with Exact Core Stabilization
- Summary: Builds finite quartic lattice stress polynomials from flavored CAR currents and the sourced diagonal SU(2) coset recipe.
- Summary: Proves exact current-tail truncation and eventual finite-energy-core equality, with sparse rational witnesses at central charges one half and seven tenths.
- Summary: Keeps the coherent local coset observable tower and removal of ambient spectator sectors as the remaining construction problem.
- Keywords: GKO, coset, Sugawara, lattice Virasoro, sparse CAR, exact stabilization, minimal models, OAR

## `CA-84-COSET-HAMILTONIAN-AND-OAR`

- Source: `report/sections/84_coset_hamiltonian_and_oar.tex`
- Title: Coset Positivity and a Scalar-Augmented OAR Tower
- Summary: Proves an explicit negative expectation of the raw finite coset zero mode and constructs positive finite vacuum-descendant Hamiltonians.
- Summary: Gives coherent unital finite algebra maps through an independent scalar summand, compatible vacuum states and exact dynamics covariance.
- Summary: Separates this constrained observable prescription from the original CAR refinement and leaves its local fusion-space realization open.
- Keywords: coset, positivity, scalar augmentation, OAR, vacuum module, Gram matrix, fusion-space locality

## `CA-85-SMEARED-COSET-AND-LOCALITY`

- Source: `report/sections/85_smeared_coset_and_locality.tex`
- Title: Smooth Coset Symmetry Limits and Local Reconstruction
- Summary: Coordinates microscopic, current and Fourier cutoffs to prove core, strong-resolvent and unitary convergence of quartic coset smearings.
- Summary: Reconstructs the minimal-model local net from finite descendant compressions in the scalar-augmented OAR representation, without asserting a local fusion-space encoding.
- Keywords: coset, smooth stress, strong resolvent, projective symmetry, Fourier cutoff, OAR, local reconstruction

## `CA-86-SPACETIME-TROTTER-DICTIONARY`

- Source: `report/sections/86_spacetime_trotter_dictionary.tex`
- Title: String-Net Histories as Trotter Expansions: the Spacetime Dictionary
- Summary: Proves that the brick-wall Trotter expansion of an anyonic chain Hamiltonian built from morphisms of C is a sum over string-net histories whose amplitude factorises into a C-evaluation obeying the Levin-Wen rules times a product of tile weights that breaks isotopy.
- Summary: Calibrates the dictionary on the dense and dilute Temperley-Lieb integrable lines, where the tile weights are the sourced face weights and the Hamiltonian limit, the isotropic point and Nienhuis's honeycomb critical point lie in one commuting family.
- Summary: Derives x = 1/(2 cos lambda) at u = lambda, reproducing the Nienhuis critical fugacity on branch 1 and the second-branch value on branch 2, and states the Fibonacci net-gas frontier beyond loops.
- Keywords: Levin-Wen, string-net, Trotter, transfer matrix, spacetime history, dilute O(n), Nienhuis, honeycomb, integrable line, Fibonacci, net gas

## `CA-87-DILUTE-FIBONACCI-IS-BLOCKED-GOLDEN`

- Source: `report/sections/87_dilute_fibonacci_is_blocked_golden.tex`
- Title: The Net Case: the Dilute Fibonacci Chain Is the Golden Chain Blocked
- Summary: Proves that whenever the site object 1+X is Y x Ybar, the dilute chain is the dense Y-chain with sites paired; for Fibonacci 1+tau = tau x tau, so the vertex tile is a Temperley-Lieb generator across a pair boundary and there is no net gas beyond loops.
- Summary: Solves the Temperley-Lieb relations in End(O x O) uniquely, verifies all relations to machine precision for L <= 6, and finds H = -sum e_i exactly isospectral to the golden chain on 2L sites (N = 5..15).
- Summary: Identifies the isotropic Fibonacci net gas with the Q = phi+1 Potts low-temperature expansion at vertex fugacity phi^{-3/4}, critical in the c = 7/10 class, and moves the genuine net question to categories such as Haagerup where 1+X is not Y x Ybar.
- Keywords: dilute chain, golden chain, blocking, Temperley-Lieb, vertex tile, net gas, chromatic polynomial, Potts, Tutte, Fibonacci, Haagerup


## `CA-88-LAYERED-TARGETS`

- Source: `report/sections/88_layered_targets.tex`
- Title: The Layered Target Grid: Setting, Input Data, and Target Rungs
- Summary: Defines, for a general unitary fusion category C, three layer ladders: the chirality setting (open chain to chiral net, periodic chain to full two-chiral theory), input data L0-L4 (fusion, braided, modular, enriched, declared target theory) and target rungs R0-R5 (tower, Wilson state, mode representation, local conformal limit, fidelity, coherence).
- Summary: Places CA-71--CA-94 (incl. the round-2 results CA-89--CA-94 and their verdicts), WT-1/VR-1 and LC-1--LC-13 on the grid, restates the six Astra headline conjectures D1-C--D6-C at the most general layer where each is plausibly true with its first attackable lemma, and fixes the three tags every future statement carries.
- Keywords: layering principle, chiral versus full, input data layer, target ladder, fidelity, enrichment, Drinfeld centre, Wilson triangle, WT-1, VR-1, headline conjectures, D1-C, D2-C, D3-C, D4-C, D5-C, D6-C, Zini-Wang

## `CA-89-WARD-KS-TRANSFER`

- Source: `report/sections/89_ward_ks_transfer.tex`
- Title: Ward-to-Koo--Saleur Transfer: Graph-Norm Interfaces, Derivative Matching and the Contact Cocycle
- Summary: Category-free conditional interfaces into VR-1 for the standard KS modes: A2/A4 transfer from geometric modes with vanishing discrepancy (explicit bound), A3 from holomorphic derivative-level refinement matching, and the contact cocycle (A2 + translation + low-energy anchor force z_mn = (m^3 c* - m c)/12; Ward contacts give c* = 12 kappa_3, c = 24b - 12 kappa_1).
- Summary: Negatives: insertion and real gate errors control neither commutators nor derivatives; A2 fails for K = 1+(H-E_0)/v; A3 for every gate-intertwining refinement forces c* = 0, refuting that clause of conjecture E4. Open core: the operator lift W2 of the discrete contour identity.
- Keywords: Ward identity, Koo-Saleur, VR-1, graph norm, transfer lemma, refinement defect, metric derivative, Cauchy estimate, contact term, Virasoro cocycle, central charge, c star, zero-mode shift, translation covariance, D2-C, Target 78.13, E4

## `CA-90-LOCAL-UNITAL-LIFT`

- Source: `report/sections/90_local_unital_lift.tex`
- Title: Local Unital Lifts from Relative Half-Braidings
- Summary: For unitary fusion C and pointed O = 1 + X, a pointed unitary relative half-braiding of O on <O> (a braiding suffices) gives the dyadic lift alpha_L(a) = B_L(a (x) 1)B_L^dagger: a unital injective *-map extending vacuum insertion, support [2j-1,2k-1] (r = 0), exact occupation degree, natural, WT-1 A1; CA-76's strict drift bound applies, A3 does not follow.
- Summary: Finite half-braiding equations with the integer condition [O][x] = [x][O] in K(<O>), which (review Prop. R-1) obstructs every one-gap lift of the same support pattern; the contiguous shuffle needs depth L-1 (optimal). Closes CA-75 Link (b1) and supersedes Proposal 76.5 at this layer.
- Keywords: local unital lift, relative half-braiding, Drinfeld centre, pointed site object, vacuum insertion, dyadic refinement, WT-1, A1, Wilson drift, occupation grading, Grothendieck ring, one-gap lift, Bratteli inclusion matrix, circuit depth, Link (b1), Proposal 76.5, R0^u

## `CA-91-PARITY-AND-CHIRAL-DELINEATION`

- Source: `report/sections/91_parity_and_chiral_delineation.tex`
- Title: Parity, Mixed Koo--Saleur Brackets, and the Chiral/Full Delineation
- Summary: Category-free, periodic (full) setting, both standard KS families VR-1-certified on one system: a complex-linear unitary reflection commuting with K forces c_L = c_R and c*_L = c*_R without convergence of the parity maps; with equal ledgers all mixed brackets vanish iff [T_0, Tbar_0] = 0, certified by N^2[H, Q_tot] -> 0 for the total current Q_tot (conditional R2).
- Summary: Delineation: absent right stress forces scalar left stress and zero anomaly; an antiunitary (dagger) reflection preserves chirality and constrains nothing; parity-odd perturbations exist iff the total current is nonzero (never on O = 1, always after unit-multiplicity enlargement); a conjugate-dual mirror types the non-self-dual case.
- Keywords: parity, reflection, chirality, chiral versus full, Koo-Saleur, mixed brackets, anomaly ledger, c = cbar, VR-1, zero-mode commutator, energy current, current-momentum lemma, antiunitary reflection, parity-odd perturbation, conjugate dual, mirror carrier, non-self-dual, layering

## `CA-92-SPATIAL-SEAMS-AND-REFLECTION-POSITIVITY`

- Source: `report/sections/92_spatial_seams_and_reflection_positivity.tex`
- Title: Spatial Seams, Reflection Pairings and a Finite Osterwalder-Schrader Lemma
- Summary: For any unitary fusion C and a declared unitary seam pairing s (s coev = ev^dagger; it exists iff O(x)Obar and Obar(x)O have equal multiplicities), the bent kernel K_s(T) = s^dagger rot(T) decides spatial reflection positivity of one crossing tile blockwise, and the linear history 1+th has an exact Schur criterion uniform in N and M.
- Summary: Self-adjointness of h is neither necessary nor sufficient and the witnesses depend on s; a category-free finite OS contraction lemma holds; the F-composed-with-dagger crossing and the perpendicular commutator are ill-typed as posed; multi-tile reflection coherence is the open gap.
- Keywords: spatial reflection positivity, seam pairing, bent kernel, plaquette seam, Schur complement, Osterwalder-Schrader, finite reconstruction, crossing, transfer matrix, Yang-Baxter, train argument, reflection coherence, self-duality, E3

## `CA-93-NORMAL-LIMIT-EXPECTATIONS-AND-FIDELITY`

- Source: `report/sections/93_normal_limit_expectations_and_fidelity.tex`
- Title: Normal Limit Expectations and the Repaired Two-Sided Fidelity Certificate
- Summary: Finite expectations E_k on boundedly exhausting N_k in M_k that preserve one normal state faithful on N, with liminf of Pimsner-Popa costs b finite, have a unique state-preserving normal limit expectation E >= b^{-1} id; no commutants, no complete positivity. Counterexamples X1, X2 and a sharp R(x)1 calibration bound the hypotheses.
- Summary: With b <= Dim C and a fully faithful unitary tensor functor C -> DHR_fin(A) of a completely rational net, mu_A = Dim C and the functor is an equivalence (L0+L4; braided at L1+L4, modularity concluded). This closes route (ii) of CA-80; the doubled chiral net carries Z(C), its diagonal LR extension has trivial DHR category; no instance is known.
- Keywords: conditional expectation, Pimsner-Popa index, normal limit, bounded exhaustion, Jones projection, four-interval inclusion, mu-index, two-sided fidelity, DHR, Longo-Rehren, Drinfeld centre, doubled net, KLM, lattice certificate, E5

## `CA-94-NUMBER-CHANGING-COLLISION-DYNAMICS`

- Source: `report/sections/94_number_changing_collision_dynamics.tex`
- Title: Number-Changing Collision Dynamics on the Pointed Carrier: a Tuned Continuum Theorem and Three Obstructions
- Summary: For any unitary fusion C and pointed O = 1 + X, a fixed pure-hop density has no full-Fock projected-resolvent limit after any scalar subtraction (N1), the repaired limit is not a chamber-Laplacian extension (N2), and the grading condition G_r forces every range-r limit to conserve occupation (N3).
- Summary: The tuned positive-square D1-C family (hop eps^-2, contact eps^-1, fusion cross eps^-1/2, pair cross eps^0) converges in projected-resolvent sense on the whole Fock carrier, with no subsequence or N-uniform estimate, to a closed collision form with lower-sector sources; its coefficient image is a finite PSD block cone. z = 2, below R1.
- Keywords: number-changing dynamics, pointed carrier, configuration Fock space, collision trace, Mosco lower bound, projected resolvent, closed quadratic form, interior-boundary condition, moment cone, grading obstruction, contact tuning, Robin collision, D1-C, E6

## `CA-95-PROBE-WORD-WARD-LIFTING`

- Source: `report/sections/95_probe_word_ward_lifting.tex`
- Title: Probe-Word Ward Lifting: Uniform Bounds, the Geometric Gap, and a False Converse
- Summary: Uniform physical probe bounds give an explicit two-loss estimate; contour-to-W2 and KS transfer remain conditional on endpoint, cylinder-contact and accumulated-error data.
- Summary: A local KS counterexample refutes the subcritical-collar converse; modified-fermion diagonal bounds are calibrations only. No general target rung advances.
- Keywords: Ward identity, probe words, positive quotient, Gram correction, two-loss norm, subcritical collar, endpoint realization, Koo-Saleur, VR-1, fermion calibration, F4

## `CA-96-BLOCKED-DYADIC-LIFTS`

- Source: `report/sections/96_blocked_dyadic_lifts.tex`
- Title: Blocked Dyadic Lifts: Finite-Power Transport and the Failure of Single-Site Centrality
- Summary: Pointed transport on a fixed tensor power O^b over full <O> gives local unital dyadic lifts on the original algebras and exact vacancy insertion, with slack 2b-1.
- Summary: Noncentral group-graded sites and twisted abelian p-group families reach R0^u at bare L0; single-site centrality is neither necessary for lifts nor sufficient for transport. General characterization and higher rungs remain open.
- Keywords: blocked transport, dyadic lift, relative half-braiding, pointed object, vacancy swap, interval locality, Bratteli inclusion matrix, associator obstruction, finite abelian p-group, naturality, R0^u, Target 90.T, F1

## `CA-97-WHAT-THE-TOWER-REMEMBERS`

- Source: `report/sections/97_what_the_tower_remembers.tex`
- Title: What the Tower Remembers: Rooted AF Invariants and Marked Refinements
- Summary: The trailing unital AF limit is classified by its rooted scaled ordered K_0, which can forget the fusion ring, site class and associator even with its canonical trace and stages.
- Summary: Fixed-H dyadic shuffles descend with identity K_0 action; abstract diagrams forget H, named finite compressions recover it, and interval/dilation reconstruction remains open.
- Keywords: AF algebra, rooted Bratteli diagram, scaled ordered K0, fusion ring, trace, half-braiding, dyadic refinement, marked reconstruction, fidelity, F6

## `CA-98-CANONICAL-SEAMS-REFLECTION-COHERENCE`

- Source: `report/sections/98_canonical_seams_reflection_coherence.tex`
- Title: Canonical Seams, Reflection Defects, and Conditional Spatial Positivity
- Summary: A canonical natural algebraic seam is derived at L1, with exact dual-oriented sewing, self-duality defects and a separate L0 self-duality seam.
- Summary: Reflection coherence remains conditional, finite positive translated forms admit scalar normalization, and identity histories refute unitary conjugacy of directional transfers, including explicitly defined even-torus OS quotients.
- Keywords: canonical seam, reflection coherence, conjugate duality, Frobenius-Schur sign, pivotal twist, bent kernel, spatial reflection positivity, Osterwalder-Schrader quotient, directional transfer, F3

## `CA-99-CONTACT-CLASSIFICATION`

- Source: `report/sections/99_contact_classification.tex`
- Title: Signed Contact Classification on the Pointed Carrier: Robin Limits, Dirichlet Limits and Full-Fock Boundaries
- Summary: For any unitary fusion category with nonzero pointed complement X, the exact scalar-contact D1 moment deformation on the N<=2 Galerkin carrier has a self-adjoint projected strong-resolvent limit iff the total contact parameter converges finitely or diverges in absolute value. Finite contacts give coupled Robin dynamics; either infinite sign, including sign oscillation, gives Dirichlet collisions with retained lower potentials.
- Summary: The proposed no-limit attractive branch is refuted, even for fixed bounded contact; positive full-Fock extensions and nonreacting deep-contact limits are derived. Negative total contact has no common Fock lower bound, arbitrary internal diagonals defeat scalar classification, and signed reacting full-Fock realization remains conditional; no conformal rung advances.
- Keywords: contact classification, signed contact, Galerkin compression, Robin collision, Dirichlet collision, strong resolvent, global trace compactness, graph core, spectral diving, retained potentials, full Fock space, internal bands, grading obstruction, D1-C, F5, Target 94.16

## `CA-100-ZERO-MODE-LATTICE-CHIRALITY`

- Source: `report/sections/100_zero_mode_lattice_chirality.tex`
- Title: Zero Modes and Lattice Chirality: Parity-Free KS Ledger Balance
- Summary: On a nonzero common standard-KS VR-1 system the cubic ledgers agree without parity or current conservation; finite loss-two ZC, limiting zero-mode commutation and all mixed commutation are equivalent, and imply equal linear ledgers with explicit A3-tail bounds.
- Summary: Automatic ZC remains open; exact logarithm, formal-algebra and spatial-support counterexamples delimit the inference, while corrected cut currents and inverse target cutoffs give conditional extensions without a general lattice-chirality theorem or a new local categorical realization.
- Keywords: zero mode, lattice chirality, Koo-Saleur, VR-1, parity-free ledger balance, cubic anomaly, mixed commutator, graph norm, transport tail, spectral logarithm, cut current, spatial support, inverse spectral cutoff, F2
