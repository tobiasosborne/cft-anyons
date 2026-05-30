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
