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
- Summary: Adds ordinary and projective-unitary symmetry data to atoms and propagates it through OR, AND, and full Fock constructions.
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
- Summary: Applies the sector machinery to the permutation action on tensor slots, recovering symmetric and antisymmetric Fock sectors from the full distinguishable carrier.
- Summary: Keeps internal symmetries separate from exchange symmetry and records how the two actions coexist on n-particle sectors.
- Summary: Defers para-statistics and genuinely anyonic braid statistics until their source, convention, and projector data are fixed.
- Keywords: exchange symmetry, statistics, symmetric Fock, antisymmetric Fock, permutation group, sector projector, anyonic deferral

## `CA-08-HILBERT-SPACE-COMPILER-SPEC`

- Source: `report/sections/08_hilbert_space_compiler_spec.tex`
- Title: Scoping the Hilbert-Space Compiler
- Summary: Specifies the first partial compiler from typed grammar expressions to Hilbert carriers, gradings, observable-algebra policies, symmetry data, and sector witnesses.
- Summary: Gives deterministic constructor rules and finite-dimensional invariants that can be checked before any categorical anyon data enters.
- Summary: Works through small examples: maybe qubits, distinguishable pairs, truncated Fock space, exchange sectors, invariant quotients, and a required compile error.
- Keywords: Hilbert-space compiler, compiler specification, examples, dimensions, observable policy, compile error, symmetric sector, invariant quotient
