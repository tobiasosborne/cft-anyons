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
