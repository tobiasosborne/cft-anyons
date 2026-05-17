# Master Provenance Ledger

This ledger is the acceptance gate for all definitions, theorem targets, and
conjectures. A statement is not accepted merely because it appears in
`handoff.md`; it must be either a project definition or must cite a local source
with a string locator.

Status values:

- `pending`: identified but not proved or fully checked.
- `sourced`: local source string locator found.
- `in-progress`: formalisation or computation in progress.
- `challenged`: verifier or tool found a gap.
- `accepted`: source, AF, Julia, WolframScript, and Lean criteria met where
  applicable.
- `conjectural`: explicitly not claimed as proved.
- `ready-for-verifier`: source and the current Lean/Julia/WolframScript checks
  are in place, but the required fresh adversarial verifier subagent has not
  yet accepted the AF node.

Subagent rule: verifier subagents must be fresh and serial. Never run more than
one subagent at a time.

## Source Index

See `references/manifest/SOURCES.md`.

## External Facts And Definitions

### EXT-FC-001: Fusion Category Definition

Kind: external definition.

Statement: A fusion category is a rigid semisimple tensor category with finitely
many isomorphism classes of simple objects and simple tensor unit.

Local source:
`references/text/GaugingDefectsQuantumSpinSystems.txt:400` and
`references/text/GaugingDefectsQuantumSpinSystems.txt:404`.

String locator:
- line 400 begins `Definition 3.1 (Fusion category). A tensor category...`
- line 404 states `A fusion category is a rigid... semisimple tensor category
  with finitely many isomorphism classes...`

Status: sourced.

AF: pending.
Lean: pending.
Julia: not applicable.
WolframScript: not applicable.

### EXT-FC-002: Skeletal Fusion Category Data

Kind: external definition.

Statement: A skeletal fusion category can be described by a finite set of simple
objects with distinguished unit, finite-dimensional fusion/Hom spaces, and
associator data represented by F-symbols after choosing bases.

Local source:
`references/text/GaugingDefectsQuantumSpinSystems.txt:413`,
`references/text/GaugingDefectsQuantumSpinSystems.txt:414`,
`references/text/GaugingDefectsQuantumSpinSystems.txt:416`,
and `references/text/PenneysUnitaryFusionCategories.md:591`.

Status: accepted for the finite label/multiplicity skeleton with left and
right unit laws, plus the Fibonacci table instance. The accepted Lean
structure does not include associators, F-symbols, pentagon equations, duals,
Hilbert Hom spaces, fusion-rule axioms beyond unit laws, or categorical
reconstruction.

AF: node `1.2.7` validated by verifier
`verifier-finite-skeletal-fusion-data-001` on 2026-05-15.
Lean: `Formalisation/Foundations/SkeletalFusion.lean` and
`Formalisation/Fibonacci/FusionRules.lean`.
Julia: `scripts/julia/fusion_rules_checks.jl`.
WolframScript: `scripts/wolfram/fusion_rules_exact.wls`.

### EXT-FC-003: Direct Sums

Kind: external definition.

Statement: A finite direct sum has inclusions and projections satisfying
`pi_i o iota_j = delta_{i,j} id`, and Hom out of the direct sum decomposes as
matrices/vector-space direct sums.

Local source:
`references/text/PenneysUnitaryFusionCategories.md:32`,
`references/text/PenneysUnitaryFusionCategories.md:41`,
and `references/text/PenneysUnitaryFusionCategories.md:47`.

Status: sourced.

AF: pending.
Lean: pending.
Julia: not applicable.
WolframScript: not applicable.

### EXT-FC-004: Orthogonal Direct Sums In A Unitary Category

Kind: external definition.

Statement: In a unitary category, orthogonal direct sums have inclusions whose
adjoints are projections; the inclusions are isometries and the range
projections are mutually orthogonal.

Local source:
`references/text/PenneysUnitaryFusionCategories.md:219`.

Status: sourced.

AF: pending.
Lean: pending.
Julia: not applicable.
WolframScript: not applicable.

### EXT-FC-005: Unitary Monoidal/Fusion Category

Kind: external definition.

Statement: A unitary monoidal category has monoidal product as a linear dagger
functor and unitary associators/unitors; a unitary fusion category is a unitary
monoidal category whose underlying category is fusion.

Local source:
`references/text/PenneysUnitaryFusionCategories.md:319`,
`references/text/PenneysUnitaryFusionCategories.md:456`,
and `references/text/PenneysUnitaryFusionCategories.md:458`.

Status: sourced.

AF: pending.
Lean: pending.
Julia: not applicable.
WolframScript: not applicable.

### EXT-FC-006: Polar Decomposition In A Unitary Category

Kind: external definition/theorem.

Statement: A morphism in a unitary category admits polar-decomposition language
`f = u |f|` with `|f|` the positive square root of `f^\dagger f` and `u` a
partial isometry.

Local source:
`references/text/PenneysUnitaryFusionCategories.md:229`.

Status: accepted for the finite skeletal fusion-multiplicity table only.

AF: node `1.3.8` validated by verifier `verifier-fib-fusion-001` on
2026-05-14. Scope note: `1 tensor 1 = 1` is inferred from the local source's
nearby trivial-particle rule `1 tensor x = x`; multiplicity-free is accepted
only as the Lean natural-number table consequence, not as a broader categorical
property.
Lean: `Formalisation/Fibonacci/FusionRules.lean`.
Julia: `scripts/julia/fusion_rules_checks.jl`.
WolframScript: `scripts/wolfram/fusion_rules_exact.wls`.

### EXT-FIB-001: Fibonacci Fusion Rules

Kind: external fact.

Statement: Fibonacci anyons have particle types `1` and `tau`, with fusion
rules `1 tensor tau = tau`, `tau tensor 1 = tau`, and
`tau tensor tau = 1 direct-sum tau`.

Local source:
`references/text/FibonacciAnyonModels.txt:128`,
`references/text/FibonacciAnyonModels.txt:129`,
and `references/text/FibonacciAnyonModels.txt:133`.

Status: sourced.

AF: pending.
Lean: pending.
Julia: pending.
WolframScript: pending.

### EXT-FIB-002: Fibonacci Quantum Dimension

Kind: external fact.

Statement: The quantum dimension of the Fibonacci object `tau` is the golden
ratio `phi = (1 + sqrt(5))/2`; the trivial object has quantum dimension `1`.

Local source:
`references/text/FibonacciAnyonModels.txt:216`,
`references/text/FibonacciAnyonModels.txt:218`,
`references/text/TrebstShortIntroductionFibonacciAnyons.txt:217`,
`references/text/FibonacciAnyonModels.txt:304`, and
`references/text/TrebstShortIntroductionFibonacciAnyons.txt:325`.

Status: accepted for the algebraic real-number identities in AF node `1.3.1`.

AF: node `1.3.1` validated by verifier `verifier-fib-alg-001` on
2026-05-14. AF external `Fibonacci golden ratio local text` added for future
dependency scope. Scope note: accepted only as the real-number algebra claim
about `phi` and `Dsq`, not as a broader Fibonacci category theorem.
Lean: `Formalisation/Fibonacci/Basic.lean`.
Julia: `scripts/julia/fibonacci_checks.jl`.
WolframScript: `scripts/wolfram/fibonacci_exact.wls`.

### EXT-FIB-003: Fibonacci F Matrix

Kind: external fact.

Statement: The nontrivial Fibonacci F-matrix in the `tau tau tau -> tau`
sector is the real 2 by 2 matrix with entries `phi^{-1}`,
`phi^{-1/2}`, `phi^{-1/2}`, and `-phi^{-1}`.

Local source:
`references/text/FibonacciAnyonModels.txt:272`,
`references/text/FibonacciAnyonModels.txt:297`,
`references/text/FibonacciAnyonModels.txt:301`,
`references/text/FibonacciAnyonModels.txt:304`, and
`references/text/GoldenChainFeiguinEtAl.txt:109`.

Status: sourced.

AF: pending.
Lean: pending.
Julia: pending.
WolframScript: pending.

### EXT-FIB-004: Fibonacci R Matrix And Braid Matrix

Kind: external fact.

Statement: Fibonacci braid data use unitary F-moves, unitary R/braiding
matrices that are diagonal in a suitable basis, and the braid matrix
`B = F R F^-1`. In the displayed five-dimensional adjacent-label basis, the
source gives a block-diagonal `F` with identity entries and the nontrivial
Fibonacci 2 by 2 block, and a diagonal `R` with phases
`exp(4*pi*i/5)` and `exp(-3*pi*i/5)`.

Local source:
`references/text/FibonacciAnyonModels.txt:227`,
`references/text/FibonacciAnyonModels.txt:232`,
`references/text/FibonacciAnyonModels.txt:233`,
`references/text/FibonacciAnyonModels.txt:272`,
`references/text/FibonacciAnyonModels.txt:273`,
`references/text/FibonacciAnyonModels.txt:297`,
`references/text/FibonacciAnyonModels.txt:301`,
`references/text/FibonacciAnyonModels.txt:314`,
`references/text/FibonacciAnyonModels.txt:317`,
`references/text/FibonacciAnyonModels.txt:334`,
`references/text/FibonacciAnyonModels.txt:346`,
`references/text/FibonacciAnyonModels.txt:398`,
`references/text/FibonacciAnyonModels.txt:401`,
`references/text/FibonacciAnyonModels.txt:418`,
`references/text/FibonacciAnyonModels.txt:423`,
`references/text/FibonacciAnyonModels.txt:428`,
`references/text/FibonacciAnyonModels.txt:430`, and
`references/text/FibonacciAnyonModels.txt:437`. The extracted text around
line 401 is OCR-ambiguous about the inverse, so the local PDF page containing
equation (2.8) and the extracted line 437 `B = F RF -1` were checked together.

Status: accepted for the finite-matrix braid-unitarity algebra in AF node
`1.3.11`. This does not assert the full categorical braid representation.

AF: node `1.3.11` validated by verifier
`verifier-fib-braid-unitary-001` on 2026-05-15.
Lean: `Formalisation/LinearAlgebra/Isometry.lean`.
Julia: `scripts/julia/fibonacci_braid_unitarity_checks.jl`.
WolframScript: `scripts/wolfram/fibonacci_braid_unitarity_exact.wls`.

### EXT-CFT-001: Fibonacci CFT Conformal Weight

Kind: external fact.

Statement: In the level 3 `su(2)` WZW realisation, the Fibonacci anyon field
`tau` is identified with the spin 1 field, whose conformal weight is `2/5`.

Local source:
`references/text/IsingLikeFibonacciAnyonsKZ.txt:999`,
`references/text/IsingLikeFibonacciAnyonsKZ.txt:1002`,
`references/text/IsingLikeFibonacciAnyonsKZ.txt:1007`,
`references/text/IsingLikeFibonacciAnyonsKZ.txt:1011`,
`references/text/IsingLikeFibonacciAnyonsKZ.txt:1016`, and
`references/text/IsingLikeFibonacciAnyonsKZ.txt:1020`. The local PDF page was
also visually checked; table (4.1) has the spin-1 row with `h = 2/5`, while
the extracted text compresses this row as `1      2ω1 25`.
For the nonchiral scaling-dimension convention, see
`references/text/PoilblancOneDimensionalItinerantInteractingAnyons.txt:371`,
`references/text/PoilblancOneDimensionalItinerantInteractingAnyons.txt:372`,
`references/text/PoilblancOneDimensionalItinerantInteractingAnyons.txt:375`,
and
`references/text/PoilblancOneDimensionalItinerantInteractingAnyons.txt:379`.

Status: accepted for source-backed exact rational arithmetic. Scope includes
`h_tau = 2/5`, in the diagonal left/right case `Delta_tau = 4/5`, and the
chiral RG exponent arithmetic recorded in node `1.5.7`:
`h_1 - 2 h_tau = -4/5`, `h_tau - 2 h_tau = -2/5`, with doubled denominator
exponents `-8/5` and `-4/5`. This does not formalise the
Wess-Zumino-Witten construction, the source-table extraction, Wilsonian RG
coefficients, physical OPE constants, or any physical RG eigenvalue.

AF: node `1.5.5` validated by verifier `verifier-cft-weight-001` on
2026-05-14; node `1.5.7` validated by verifier `verifier-cft-rg-exp-001` on
2026-05-15.
Lean: `Formalisation/Fibonacci/CFTWeights.lean`.
Julia: `scripts/julia/cft_weight_checks.jl`.
WolframScript: `scripts/wolfram/cft_weight_exact.wls`.

### EXT-TL-001: Temperley-Lieb Root-Of-Unity Jones Quotient

Kind: external fact.

Statement: At roots of unity, the Temperley-Lieb algebra has a canonical
Jones quotient `Q_n(l) = TL_n(q) / R_n(q)` which is semisimple; this is related
to a fusion category with truncated tensor product.

Local source:
`references/text/TemperleyLiebRootsJonesQuotient.txt:10`,
`references/text/TemperleyLiebRootsJonesQuotient.txt:17`,
`references/text/TemperleyLiebRootsJonesQuotient.txt:21`,
`references/text/TemperleyLiebRootsJonesQuotient.txt:68`,
`references/text/TemperleyLiebRootsJonesQuotient.txt:176`, and
`references/text/TemperleyLiebRootsJonesQuotient.txt:183`.

Status: sourced.

AF: pending.
Lean: not planned in phase 1.
Julia: not planned in phase 1.
WolframScript: not planned in phase 1.

### EXT-ISING-001: Ising Fusion Rules And Scaling Dimensions

Kind: external fact.

Statement: The Ising anyon model has simple labels `1`, `sigma`, and `psi`
with fusion rules `sigma tensor sigma = 1 + psi`,
`sigma tensor psi = psi tensor sigma = sigma`, `psi tensor psi = 1`, and unit
fusion. For the secondary handoff notation, `epsilon` denotes this `psi`
label. The nonchiral Ising scaling dimensions used in the toy block are
`Delta_sigma = 1/8` and `Delta_psi = 1`.

Local source:
`references/text/PenneysUnitaryFusionCategories.md:647`,
`references/text/PenneysUnitaryFusionCategories.md:649`,
`references/text/PenneysUnitaryFusionCategories.md:662`,
`references/text/PenneysUnitaryFusionCategories.md:664`,
`references/text/PenneysUnitaryFusionCategories.md:666`,
`references/text/PoilblancOneDimensionalItinerantInteractingAnyons.txt:177`,
`references/text/PoilblancOneDimensionalItinerantInteractingAnyons.txt:178`,
`references/text/PoilblancOneDimensionalItinerantInteractingAnyons.txt:179`,
`references/text/PoilblancOneDimensionalItinerantInteractingAnyons.txt:181`,
`references/text/PoilblancOneDimensionalItinerantInteractingAnyons.txt:185`,
`references/text/PoilblancOneDimensionalItinerantInteractingAnyons.txt:187`,
`references/text/PoilblancOneDimensionalItinerantInteractingAnyons.txt:188`,
`references/text/PoilblancOneDimensionalItinerantInteractingAnyons.txt:371`,
and
`references/text/PoilblancOneDimensionalItinerantInteractingAnyons.txt:372`.

Status: accepted for the finite toy table and rational exponent arithmetic in
AF node `1.8`. This does not assert full Ising category data, F-symbols, OPE
coefficients, a Temperley-Lieb quotient construction, or physical RG dynamics.

AF: node `1.8` validated by verifier `verifier-ising-toy-001` on
2026-05-15.
Lean: `Formalisation/Ising/Basic.lean`.
Julia: `scripts/julia/ising_toy_checks.jl`.
WolframScript: `scripts/wolfram/ising_toy_exact.wls`.

### EXT-SN-001: String-Net Fixed-Point Data

Kind: external fact.

Statement: General string-net models are specified by branching rules, dual
strings, quantum dimensions, and F-symbol data satisfying algebraic relations;
local relations determine the ground-state wavefunction amplitudes.

Local source:
`references/text/StringNetCondMat0510613.txt:130`,
`references/text/StringNetCondMat0510613.txt:139`,
`references/text/StringNetCondMat0510613.txt:170`,
`references/text/StringNetCondMat0510613.txt:173`,
`references/text/StringNetCondMat0510613.txt:207`, and
`references/text/StringNetCondMat0510613.txt:233`.

Status: sourced.

AF: pending.
Lean: not planned in phase 1.
Julia: pending for Fibonacci examples.
WolframScript: pending for Fibonacci examples.

### EXT-FOCK-001: Distinguishable Fock Space As Direct Sum

Kind: external fact/background.

Statement: For an indefinite number of distinguishable particles, one takes
the direct sum over particle number; the zero-particle space is the vacuum
space.

Local source:
`references/text/GaugingDefectsQuantumSpinSystems.txt:133`,
`references/text/GaugingDefectsQuantumSpinSystems.txt:137`,
`references/text/GaugingDefectsQuantumSpinSystems.txt:157`,
`references/text/GaugingDefectsQuantumSpinSystems.txt:167`, and
`references/text/GaugingDefectsQuantumSpinSystems.txt:174`.

Status: accepted for the finite truncated coordinate skeleton only. Lean
models the truncation to particle numbers `0` through `maxN` as the sigma
type over lengths of words in a finite local coordinate basis, proves the
finite cardinality sum, the zero- and one-particle sector counts, pairing
preservation under particle-number flattening, and the Fibonacci two-label
specialisation. This does not construct the source's infinite direct sum,
Hilbert completion, tensor-product Hilbert spaces, exchange-symmetry
quotients, categorical Hom spaces, or physical Fock-space semantics.

AF: node `1.2.9` validated by verifier
`verifier-truncated-fock-coord-001` on 2026-05-15.
Lean: `Formalisation/Foundations/FockSpace.lean`.
Julia: `scripts/julia/truncated_fock_checks.jl`.
WolframScript: `scripts/wolfram/truncated_fock_exact.wls`.

### EXT-FOCK-002: Fusion-Tree Hilbert Spaces

Kind: external fact/background.

Statement: A chain of objects in a fusion category has a Hilbert space whose
basis corresponds to admissible fusion-tree labelings; examples use spaces of
the form `C(X, X^{tensor N+1})`.

Local source:
`references/text/GaugingDefectsQuantumSpinSystems.txt:657`,
`references/text/GaugingDefectsQuantumSpinSystems.txt:658`,
`references/text/GaugingDefectsQuantumSpinSystems.txt:667`, and
`references/text/GaugingDefectsQuantumSpinSystems.txt:696`.

Status: sourced.

AF: pending.
Lean: pending.
Julia: pending.
WolframScript: not applicable.

### EXT-RG-001: OAR Refining Channels

Kind: external fact/background.

Statement: Operator-algebraic renormalization uses refining quantum channels,
scaling maps or renormalization groups, stability under coarse graining, and
scaling limits from inductive systems.

Local source:
`references/text/CFTFromLatticeFermions.txt:115`,
`references/text/CFTFromLatticeFermions.txt:119`,
`references/text/CFTFromLatticeFermions.txt:1460`,
`references/text/CFTFromLatticeFermions.txt:1461`,
`references/text/CFTFromLatticeFermions.txt:463`,
`references/text/OARWavelets.txt:147`,
`references/text/OARWavelets.txt:149`,
`references/text/OARWavelets.txt:151`,
`references/text/OARWavelets.txt:152`,
`references/text/OARWavelets.txt:160`, and
`references/text/OARWavelets.txt:161`.

Status: sourced.

AF: pending.
Lean: pending for finite-dimensional channel theorem only.
Julia: pending.
WolframScript: pending.

### EXT-RG-002: Wavelet Renormalization Maps Are Isometric

Kind: external fact/background.

Statement: In OAR wavelet renormalization, the one-particle map of the
wavelet renormalization group is isometric, and the semi-continuum framework
has Hilbert-space isometries from finite scales into the continuum or between
successive Fock spaces.

Local source:
`references/text/CFTFromLatticeFermions.txt:1592`,
`references/text/CFTFromLatticeFermions.txt:1623`,
`references/text/CFTFromLatticeFermions.txt:1631`,
`references/text/OARWavelets.txt:164`,
`references/text/OARWavelets.txt:167`,
`references/text/OARWavelets.txt:168`,
`references/text/OARWavelets.txt:202`,
`references/text/OARWavelets.txt:203`, and
`references/text/OARWavelets.txt:259`.

Status: sourced.

AF: pending.
Lean: not needed for current theorem unless wavelets are formalised.
Julia: pending if wavelet examples are used.
WolframScript: not planned.

### EXT-PAIR-001: Pair Creation In Anyon Chains

Kind: external fact/background.

Statement: Garjani-Ardonne introduce an anyonic chain model in which the
number of anyons is not fixed and pairing terms create or annihilate pairs of
anyons.

Local source:
`references/text/GarjaniArdonneAnyonChainsPairing.txt:50`,
`references/text/GarjaniArdonneAnyonChainsPairing.txt:55`,
`references/text/GarjaniArdonneAnyonChainsPairing.txt:56`,
`references/text/GarjaniArdonneAnyonChainsPairing.txt:396`, and
`references/text/GarjaniArdonneAnyonChainsPairing.txt:398`.

Status: sourced.

AF: pending.
Lean: not phase 1.
Julia: pending if number-changing examples are reused.
WolframScript: not planned.

### EXT-BRAID-001: Braid Group Representation

Kind: external fact/background.

Statement: Braiding matrices in anyon models/conformal blocks form
representations of braid groups and satisfy braid relations.

Local source:
`references/text/FibonacciAnyonModels.txt:316`,
`references/text/FibonacciAnyonModels.txt:317`,
`references/text/IsingLikeFibonacciAnyonsKZ.txt:852`,
`references/text/IsingLikeFibonacciAnyonsKZ.txt:856`, and
`references/text/HollandsAnyonicChainsAlphaInduction.txt:3091`.

Status: sourced for examples. General categorical theorem still requires a
project axiomatisation of braided monoidal categories.

AF: pending.
Lean: accepted for the finite two-dimensional Fibonacci braid matrix relation
only.
Julia: `scripts/julia/fibonacci_braid_checks.jl`.
WolframScript: `scripts/wolfram/fibonacci_braid_exact.wls`.

## Project Definitions

### DEF-PROJ-001: Local Occupation Object

Kind: project definition.

Statement: For a finite set of simple labels of a fusion category, define
`Q := direct-sum_{a in Irr(C)} a`. The vacuum summand is interpreted as an
empty site.

External support: uses EXT-FC-003 and EXT-FC-004 for direct sums; the physical
interpretation is project-specific.

Status: accepted for the finite coordinate skeleton only. A
`LocalOccupationModel` is a finite label type with a distinguished vacuum
label; the summand labels of `Q` are represented by the label type itself; and
the summand labels of `Q^{tensor N}` are ordered configurations
`Fin N -> label`. This does not construct categorical direct sums,
categorical tensor powers, or fusion-category object semantics.

AF: node `1.2.6` validated by verifier
`verifier-project-q-hilb-coord-001` on 2026-05-15.
Lean: `Formalisation/Foundations/ProjectDefinitions.lean`.
Julia: `scripts/julia/project_definition_checks.jl`.
WolframScript: not applicable.

### DEF-PROJ-002: Indefinite-Particle Hilbert Space

Kind: project definition.

Statement: For `N` ordered sites and total charge `W`, define
`H_N^W := Hom_C(W, Q^{tensor N})`.

External support: motivated by EXT-FOCK-001 and EXT-FOCK-002; formal
definition is project-specific.

Status: accepted for the finite, basis-dependent coordinate skeleton only.
After choosing a finite coordinate basis for every configuration-sector
`Hom(W, a_1 tensor ... tensor a_N)`, the fixed sector `H_N^W` is represented by
flattened configuration coordinates with the accepted configuration-space
direct-sum expansion. This does not construct categorical Hom functors,
categorical tensor powers, canonical categorical isomorphisms, or
fusion-category Hilbert-space semantics.

AF: node `1.2.6` validated by verifier
`verifier-project-q-hilb-coord-001` on 2026-05-15.
Lean: `Formalisation/Foundations/ProjectDefinitions.lean` and
`Formalisation/Foundations/ConfigurationSpace.lean`.
Julia: `scripts/julia/project_definition_checks.jl`.
WolframScript: `scripts/wolfram/project_definition_exact.wls`.

### DEF-PROJ-004: Ordered Site Configurations And Particle Number

Kind: project definition.

Statement: For a finite label type `alpha` and length `n`, define an ordered
site configuration as a function `Fin n -> alpha`. Given a distinguished
vacuum label, define particle number as the number of sites whose label is not
the vacuum.

Project source:
`handoff.md:117`, `handoff.md:124`, `handoff.md:151`,
`handoff.md:195`, `handoff.md:203`, and `handoff.md:206`.

Status: accepted for the finite combinatorial formalisation only. This does
not construct `Q`, tensor products, Hom spaces, or the categorical direct-sum
expansion.

AF: node `1.2.1` validated by verifier `verifier-config-001` on 2026-05-14.
Lean: `Formalisation/Foundations/Configurations.lean`.
Julia: `scripts/julia/configuration_checks.jl`.
WolframScript: `scripts/wolfram/configuration_exact.wls`.

### DEF-PROJ-005: Finite Direct-Sum Coordinate Model

Kind: project definition.

Statement: After choosing a finite coordinate basis `kappa i` in every summand
indexed by a finite type `iota`, the direct sum of the component coordinate
spaces is represented by dependent component coordinates
`forall i, kappa i -> C`, equivalently by one flattened coordinate vector
`(Sigma i, kappa i) -> C`.

External support:
`references/text/PenneysUnitaryFusionCategories.md:32` gives finite direct
sums with inclusions and projections;
`references/text/PenneysUnitaryFusionCategories.md:41` gives the canonical
direct-sum matrix-coordinate isomorphism with the right hand side a direct sum
of complex vector spaces; and
`references/text/PenneysUnitaryFusionCategories.md:219` states that the
orthogonal direct-sum version is a dagger-isomorphism.

Project source:
`handoff.md:172`, `handoff.md:175`, `handoff.md:187`, and `handoff.md:191`.

Status: accepted for the finite coordinate model only. This does not
construct categorical biproducts, `Q`, tensor powers, Hom functors, dagger
categories, or fusion-category basis provenance.

AF: node `1.2.2` validated by verifier `verifier-dirsum-coord-001` on
2026-05-15.
Lean: `Formalisation/Foundations/DirectSumCoordinates.lean`.
Julia: `scripts/julia/direct_sum_coordinate_checks.jl`.
WolframScript: `scripts/wolfram/direct_sum_coordinate_exact.wls`.

### DEF-PROJ-006: Finite Direct-Sum Coordinate Projections

Kind: project definition.

Statement: In the finite coordinate model for a direct sum, each component has
an inclusion into flattened coordinates and a projection from flattened
coordinates. The coordinate maps satisfy the finite biproduct equations:
projection after same-component inclusion is the identity, projection after a
different-component inclusion is zero, and the sum over all components of
inclusion after projection is the identity on flattened coordinates.

External support:
`references/text/PenneysUnitaryFusionCategories.md:32` states
`pi_i o iota_j = delta_{i=j} id`, and
`references/text/PenneysUnitaryFusionCategories.md:34` states
`sum_j iota_j o pi_j = id`.

Status: accepted for the finite coordinate model only. This does not
construct categorical biproducts or prove the full categorical direct-sum
universal property.

AF: node `1.2.3` validated by verifier `verifier-dirsum-proj-001` on
2026-05-15.
Lean: `Formalisation/Foundations/DirectSumCoordinates.lean`.
Julia: `scripts/julia/direct_sum_projection_checks.jl`.
WolframScript: `scripts/wolfram/direct_sum_projection_exact.wls`.

### DEF-PROJ-007: Finite Orthogonal Direct-Sum Coordinate Model

Kind: project definition.

Statement: In the finite coordinate model with the standard complex coordinate
pairing, each component inclusion preserves the component pairing. The
component projection is adjoint to component inclusion for the coordinate
pairings. The coordinate range map `inclusion_i projection_i` is idempotent,
self-adjoint for the coordinate pairing, and distinct coordinate range maps
annihilate one another.

External support:
`references/text/PenneysUnitaryFusionCategories.md:219` states that in an
orthogonal direct sum the inclusions are isometries and the maps
`iota_j iota_j^dagger` are mutually orthogonal projections.

Status: accepted for the finite coordinate model only. This proves the
isometry, coordinate adjoint, and algebraic range-projection equations in
coordinates, but it does not construct the categorical dagger, the categorical
orthogonal direct sum, or the full orthogonal direct-sum theorem.

AF: node `1.2.4` validated by verifier `verifier-dirsum-orth-001` on
2026-05-15; node `1.2.8` validated by verifier
`verifier-dirsum-adjoint-coord-001` on 2026-05-15.
Lean: `Formalisation/Foundations/DirectSumCoordinates.lean`.
Julia: `scripts/julia/direct_sum_orthogonal_checks.jl`.
WolframScript: `scripts/wolfram/direct_sum_orthogonal_exact.wls`.

### DEF-PROJ-008: Finite Configuration-Space Coordinate Model

Kind: project definition.

Statement: After choosing a finite coordinate basis `basis cfg` for every
ordered configuration `cfg : Fin n -> alpha`, the flattened configuration
coordinates `(Sigma cfg, basis cfg) -> C` are equivalent to component
coordinates `forall cfg, basis cfg -> C`.

External support:
`handoff.md:150`--`handoff.md:176` describes label tuples and the direct sum
over configurations;
`handoff.md:178`--`handoff.md:191` states the configuration-space expansion
target; and `handoff.md:1641`--`handoff.md:1648` identifies configurations as
functions and writes the Fock-space direct sum over configurations.
`references/text/PenneysUnitaryFusionCategories.md:32`,
`references/text/PenneysUnitaryFusionCategories.md:41`, and
`references/text/PenneysUnitaryFusionCategories.md:47` support the finite
direct-sum coordinate background.

Status: accepted for the finite, basis-dependent coordinate skeleton only.
This does not construct categorical Hom spaces, `Q`, tensor powers,
canonical Hom isomorphisms, categorical direct sums, or unitarity in a fusion
category.

AF: node `1.2.5` validated by verifier `verifier-config-space-coord-001` on
2026-05-15.
Lean: `Formalisation/Foundations/ConfigurationSpace.lean`.
Julia: `scripts/julia/configuration_space_checks.jl`.
WolframScript: `scripts/wolfram/configuration_space_exact.wls`.

### DEF-PROJ-003: Fine-Graining Isometry

Kind: project definition.

Statement: A finite-lattice fine-graining map is a morphism or matrix
`E : Q^{tensor N} -> Q^{tensor M}` satisfying `E^\dagger E = id`.

External support: uses isometry and orthogonal direct-sum background from
EXT-FC-004 and finite-dimensional linear algebra. The definition is
project-specific.

Status: accepted for the finite coordinate matrix definition and its packaged
finite consequences only. This packages a matrix `E : fine -> coarse` with the
equation `E^\dagger E = I` after finite bases have been chosen. Lean also
packages the accepted finite consequences that the ascending map preserves
adjoints and the logical lift sends the coarse identity to the code projection
`E E^\dagger`. It does not construct `Q^{tensor N}`, categorical morphisms,
Hom-sector semantics, categorical channel semantics, or physical fine-graining
maps in a fusion category.

AF: node `1.4.12` validated by verifier
`verifier-finite-fine-graining-def-001` on 2026-05-15; node `1.4.14`
validated by verifier `verifier-finite-fg-star-lift-001` on 2026-05-15.
Lean: `Formalisation/LinearAlgebra/FineGraining.lean`.
Julia: `scripts/julia/fine_graining_definition_checks.jl`.
WolframScript: `scripts/wolfram/fine_graining_definition_exact.wls`.

## Theorem Target Register

### THM-2.2.1: Configuration-Space Expansion

Statement: `Hom(W, Q^{tensor N})` is canonically isomorphic to the direct sum
over label tuples `(a_1,...,a_N)` of `Hom(W, a_1 tensor ... tensor a_N)`, and
unitary when orthogonal inclusions are isometries.

Dependencies: EXT-FC-003, EXT-FC-004, DEF-PROJ-001, DEF-PROJ-002.

Status: pending.
AF: pending.
Lean: pending.
Julia: pending.
WolframScript: not applicable.

Partial formalisation: node `1.2.2` proves the generic finite coordinate
skeleton used after bases have been chosen in each summand: flattening
`(Sigma i, kappa i) -> C` to component coordinates `forall i, kappa i -> C`
is a complex-linear equivalence, the finite cardinality is additive over
components, and the standard finite coordinate pairing is preserved. AF node
`1.2.2` was validated by verifier `verifier-dirsum-coord-001` on 2026-05-15.
Node `1.2.5` specialises this skeleton to ordered configuration spaces
`Config alpha n = Fin n -> alpha`: after assigning a finite coordinate basis
to every configuration sector, the flattened configuration coordinates are
complex-linearly equivalent to component coordinates, the flattened
cardinality is the sum of sector cardinalities, the constant-sector case has
cardinality `|alpha|^n * |beta|`, and the coordinate pairing is preserved.
AF node `1.2.5` was validated by verifier
`verifier-config-space-coord-001` on 2026-05-15. The full categorical Hom
expansion, `Q^{tensor N}`, tensor products, and unitarity statement remain
pending.
Node `1.2.6` packages this as the finite coordinate skeleton of the project
definitions `Q` and `H_N^W`: `Q` contributes the finite label type and vacuum
label, `Q^{tensor N}` contributes ordered label configurations, and after
sector bases are supplied `H_N^W` has the same flattened/component coordinate
expansion and pairing preservation. AF node `1.2.6` was validated by verifier
`verifier-project-q-hilb-coord-001` on 2026-05-15. This still does not
construct categorical `Q`, tensor powers, Hom functors, or Hilbert-space
semantics.

### THM-2.3.1: Finite Ordered Configuration Combinatorics

Statement: For a finite label type `alpha`, the number of ordered length-`n`
configurations is `|alpha|^n`. For any chosen vacuum label, particle number is
bounded by `n`; the constant vacuum configuration has particle number `0`; and
a constant non-vacuum configuration has particle number `n`. For Fibonacci
labels this gives `2^n` configurations.

Dependencies: DEF-PROJ-004 and EXT-FIB-001/AF node `1.3.8` for the Fibonacci
two-label set.

Status: accepted for finite combinatorics only; this does not prove the
categorical Hom-space expansion. The finite label/multiplicity skeleton with
unit laws is separately accepted in node `1.2.7`.
AF: node `1.2.1` validated by verifier `verifier-config-001` on 2026-05-14;
node `1.2.7` validated by verifier
`verifier-finite-skeletal-fusion-data-001` on 2026-05-15.
Lean: `Formalisation/Foundations/Configurations.lean`,
`Formalisation/Foundations/SkeletalFusion.lean`, and
`Formalisation/Fibonacci/FusionRules.lean`.
Julia: `scripts/julia/configuration_checks.jl` and
`scripts/julia/fusion_rules_checks.jl`.
WolframScript: `scripts/wolfram/configuration_exact.wls` and
`scripts/wolfram/fusion_rules_exact.wls`.

### THM-3.2.1: Braid Relations For Neighboring Exchanges

Statement: In a braided category, neighboring maps built from `c_{Q,Q}`
satisfy braid relations and induce a braid group representation on
`Hom(W, Q^{tensor N})`.

Dependencies: EXT-BRAID-001 plus project braided-category axioms.

Status: pending.
AF: pending.
Lean: pending.
Julia: pending.
WolframScript: pending.

Partial formalisation: the two-dimensional Fibonacci braid-matrix relation
from `references/text/IsingLikeFibonacciAnyonsKZ.txt:1150`,
`references/text/IsingLikeFibonacciAnyonsKZ.txt:1153`,
`references/text/IsingLikeFibonacciAnyonsKZ.txt:1270`,
`references/text/IsingLikeFibonacciAnyonsKZ.txt:1276`, and
`references/text/IsingLikeFibonacciAnyonsKZ.txt:1278` is accepted in AF node
`1.3.10`, validated by verifier `verifier-fib-braid-001` on 2026-05-15. Lean
proves the algebraic parameterised matrix identity for `B12 = diag(q^2,-q)` and
`B23 = c [[-1, q s], [q s, q^2]]` under
`c(q+1)=q` and `q s^2 = q^2+q+1`. Julia checks the sourced numerical
specialisation `q=exp(-2*pi*i/5)`, `phi=(1+sqrt(5))/2`, `s=sqrt(phi)`, and
`c=q/(q+1)` at high precision. WolframScript checks the same specialisation
exactly. This does not construct categorical braidings, neighboring exchange
maps on `Q^{tensor N}`, or a full braid group representation.

Additional finite-matrix formalisation: AF node `1.3.11`, validated by
verifier `verifier-fib-braid-unitary-001` on 2026-05-15, proves that if finite
square matrices `F` and `R` are two-sided unitary, then `F R F^dagger` is
two-sided unitary. This is tied to local source locators
`references/text/FibonacciAnyonModels.txt:232`,
`references/text/FibonacciAnyonModels.txt:233`,
`references/text/FibonacciAnyonModels.txt:314`,
`references/text/FibonacciAnyonModels.txt:317`,
`references/text/FibonacciAnyonModels.txt:398`,
`references/text/FibonacciAnyonModels.txt:401`, and
`references/text/FibonacciAnyonModels.txt:437`, plus the displayed 5 by 5
`F` and `R` data at lines `418`-`430`. Lean proves the generic finite-matrix
theorem in `Formalisation/LinearAlgebra/Isometry.lean`; Julia and
WolframScript check the sourced 5 by 5 Fibonacci matrices. This still does not
construct categorical braidings, mapping-class-group representations,
conformal blocks, or analytic monodromy.

### THM-4.1.1: Fine-Graining Induces Isometries On Charge Sectors

Statement: If `E^\dagger E = id`, then postcomposition `f |-> E o f` is an
isometry on every `Hom(W, -)` sector; conversely, all simple-sector
isometries imply `E^\dagger E = id` under a separating-Hom assumption.

Dependencies: DEF-PROJ-003 and finite-dimensional inner-product definition.

Status: accepted for two finite-matrix statements. First, postcomposition by
an isometric matrix preserves the Gram product `(E F)^* (E G)=F^*G`. Second,
the finite square-test converse holds: if this Gram preservation identity
holds for every pair of square coarse-coordinate test matrices `F,G`, then
`E^*E=I`, by instantiating `F=I` and `G=I`. The full categorical
semisimplicity/separating-Hom converse and categorical Hom-sector semantics
remain pending.
AF: node `1.4.4` validated by verifier `verifier-mat-post-001` on
2026-05-14; node `1.4.8` validated by verifier
`verifier-postcompose-converse-001` on 2026-05-15.
Lean: `Formalisation/LinearAlgebra/Postcompose.lean`.
Julia: `scripts/julia/postcompose_isometry_checks.jl`.
WolframScript: `scripts/wolfram/postcompose_isometry_exact.wls`.

### THM-4.2.1: Component Orthogonality

Statement: For `E` between finite direct sums with components
`E_{b,a} = pi_b E iota_a`, `E^\dagger E = id` is equivalent to
`sum_b E_{b,a}^\dagger E_{b,a'} = delta_{a,a'} id`.

Dependencies: EXT-FC-003, EXT-FC-004, DEF-PROJ-003.

Status: accepted for the scalar finite-matrix component orthogonality
equivalence only. Block Hom spaces, categorical direct-sum construction, and
proof that the component bases come from the fusion category remain pending.
AF: node `1.4.2` validated by verifier `verifier-mat-comp-001` on
2026-05-14.
Lean: `Formalisation/LinearAlgebra/Component.lean`.
Julia: `scripts/julia/component_orthogonality_checks.jl`.
WolframScript: `scripts/wolfram/component_orthogonality_exact.wls`.

### THM-5.1.1: Block Tensor Isometry

Statement: Tensor products of local isometries `eta_i : Q -> Q^{tensor r_i}`
give an isometry `eta_1 tensor ... tensor eta_N`.

Dependencies: unitary monoidal/dagger axioms.

Status: accepted for the two-factor finite-matrix Kronecker isometry theorem,
for the fixed-local-map N-fold tensor-power induction, for the three-factor
heterogeneous finite-matrix Kronecker isometry theorem, and for the arbitrary
N-factor heterogeneous finite-coordinate induction over an ordered recursive
tensor index. Categorical tensor products, canonical associators, ordered
partition semantics, and proof that local `eta_i` maps arise from
fusion-category maps remain pending.
AF: node `1.4.3` validated by verifier `verifier-mat-tensor-001` on
2026-05-14; node `1.4.7` validated by verifier
`verifier-tensor-power-001` on 2026-05-14; node `1.4.10` validated by
verifier `verifier-tensor-three-het-001` on 2026-05-15; node `1.4.16`
validated by verifier `verifier-het-tensor-n-001` on 2026-05-15.
Lean: `Formalisation/LinearAlgebra/Tensor.lean` and
`Formalisation/LinearAlgebra/TensorPower.lean` and
`Formalisation/LinearAlgebra/HeterogeneousTensor.lean`.
Julia: `scripts/julia/tensor_isometry_checks.jl` and
`scripts/julia/tensor_power_checks.jl`.
WolframScript: `scripts/wolfram/tensor_isometry_exact.wls` and
`scripts/wolfram/tensor_power_exact.wls`.

### THM-5.2.1: Dressing Unitary Preserves Isometry

Statement: If each `eta_i` is isometric and `U_M` is unitary, then
`U_M (eta_1 tensor ... tensor eta_N)` is isometric.

Dependencies: THM-5.1.1 and finite-dimensional unitary algebra.

Status: accepted for the finite-matrix unitary dressing calculation
`(U E)^* (U E) = I` from `U^*U = I` and `E^*E = I`, and for the finite
three-factor heterogeneous dressed block matrix
`U ((E1 tensor E2) tensor E3)`. The fixed-local-map finite-matrix dressed
tensor-power theorem is also accepted: for every `N`, if `E^*E=I` and `U` is
unitary on the fine tensor-power coordinate space, then
`(U E^{tensor N})^* (U E^{tensor N})=I`. The arbitrary N-factor heterogeneous
finite-coordinate dressed theorem is accepted over the same ordered recursive
tensor index as node `1.4.16`. The two-factor finite-matrix tensor-product
isometry is accepted separately in node `1.4.3`; full categorical unitary
dressing remains pending.
AF: node `1.4.1` validated by verifier `verifier-mat-dress-001` on
2026-05-14; node `1.4.11` validated by verifier
`verifier-dressed-three-tensor-001` on 2026-05-15; node `1.4.15` validated by
verifier `verifier-dressed-tensor-power-001` on 2026-05-15; node `1.4.16`
validated by verifier `verifier-het-tensor-n-001` on 2026-05-15.
Lean: `Formalisation/LinearAlgebra/Isometry.lean` and
`Formalisation/LinearAlgebra/Tensor.lean` and
`Formalisation/LinearAlgebra/TensorPower.lean` and
`Formalisation/LinearAlgebra/HeterogeneousTensor.lean`.
Julia: `scripts/julia/linear_algebra_checks.jl` and
`scripts/julia/tensor_isometry_checks.jl` and
`scripts/julia/tensor_power_checks.jl`.
WolframScript: `scripts/wolfram/linear_algebra_exact.wls` and
`scripts/wolfram/tensor_isometry_exact.wls` and
`scripts/wolfram/tensor_power_exact.wls`.

### THM-6.1.1: Polar Fine-Graining Isometry

Statement: For finite-dimensional Hilbert spaces, if
`B : H_fine -> H_coarse` has full rank onto `H_coarse`, then
`E := B^\dagger (B B^\dagger)^{-1/2}` satisfies `E^\dagger E = id`.

Dependencies: EXT-FC-006 and finite-dimensional positive matrix square roots.

Status: accepted for the conditional finite-matrix algebra: if a matrix `R`
satisfies `R^*(B B^*)R=I`, then `E=B^*R` is an isometry. A diagonal-Gram
special case is also accepted: if `B B^*` is diagonal with strictly positive
real diagonal entries `g_mu`, then the explicit diagonal matrix with entries
`(sqrt(g_mu))^{-1}` satisfies the inverse-square-root condition and yields an
isometry. General existence, positivity, and identification of
`(B B^*)^{-1/2}` for arbitrary positive matrices remain pending.
AF: node `1.4.5` validated by verifier `verifier-mat-polar-001` on
2026-05-14; node `1.4.13` validated by verifier
`verifier-polar-diag-sqrt-001` on 2026-05-15.
Lean: `Formalisation/LinearAlgebra/Polar.lean`.
Julia: `scripts/julia/polar_section_checks.jl`.
WolframScript: `scripts/wolfram/polar_section_exact.wls`.

### THM-6.2.1: Polar Amplitude Formula

Statement: In orthonormal bases, the entries of
`E = B^\dagger (B B^\dagger)^{-1/2}` are
`A_{nu,mu} = sum_{mu'} conjugate(beta_{mu',nu}) G^{-1/2}_{mu',mu}`.
The no-mixing corollary is the normalized conjugate coefficient formula.

Dependencies: THM-6.1.1.

Status: accepted for the conditional finite-matrix entry formula with `R`
standing for the inverse-square-root factor, for the diagonal-Gram explicit
inverse-square-root special case, and for the finite one-row no-mixing
corollary where `R = 1/sqrt(sum_i |beta_i|^2)`. The no-mixing corollary proves
both the normalized conjugate entry formula and the resulting one-column
isometry when the denominator is nonzero. Full positive square-root and
polar-decomposition semantics remain pending.
AF: node `1.4.5` validated by verifier `verifier-mat-polar-001` on
2026-05-14; node `1.4.13` validated by verifier
`verifier-polar-diag-sqrt-001` on 2026-05-15; node `1.4.9` validated by verifier
`verifier-nomix-polar-001` on 2026-05-15.
Lean: `Formalisation/LinearAlgebra/Polar.lean` and
`Formalisation/LinearAlgebra/NoMixing.lean`.
Julia: `scripts/julia/polar_section_checks.jl` and
`scripts/julia/fibonacci_checks.jl`.
WolframScript: `scripts/wolfram/polar_section_exact.wls` and
`scripts/wolfram/fibonacci_exact.wls`.

### WP4-PARTIAL-SUMMARY: Validated Finite-Matrix Fine-Graining Block

Statement: Nodes `1.4.4`, `1.4.2`, `1.4.3`, `1.4.1`, and `1.4.5`
validate the finite-matrix fine-graining block: postcomposition Gram
preservation, component orthogonality, two-factor tensor-product isometry,
unitary dressing of an isometry, and conditional polar-section algebra/entry
formula.

Status: accepted as a proof-tree summary only; no new mathematical content.
Later node `1.4.8` separately validates the finite square-test converse for
postcomposition Gram preservation. Remaining WP4 work includes the full
categorical separating-Hom theorem, categorical Hom/direct-sum/tensor
semantics and basis/local-map provenance, heterogeneous N-factor tensor
induction beyond the fixed-map node `1.4.7`, full-rank formalisation, and
positive square-root/polar-decomposition existence.

AF: node `1.4.6` validated by verifier `verifier-wp4-summary-001` on
2026-05-14.

### THM-8.2.1: Ascending Observable Channel

Statement: For an isometry `V`, the map `A(O) = V^\dagger O V` is unital,
completely positive, star-preserving, and expectation-value preserving against
embedded states.

Dependencies: finite-dimensional matrix algebra; EXT-RG-001.

Status: accepted for finite-matrix unitality, star preservation, logical lift
retraction, trace preservation of embedded states, trace-pairing expectation
preservation, the square-form identity `K^*(X^*X)K=(XK)^*(XK)`, the
rectangular Gram-form witness implication `O=X^*X => E^* O E=(X E)^*(X E)`,
the finite quadratic-form positive-semidefinite implication
`O >= 0 => E^* O E >= 0` in Mathlib's `Matrix.PosSemidef` sense, and the
finite auxiliary amplified implication
`O >= 0 => (I_aux tensor E)^* O (I_aux tensor E) >= 0`,
the finite congruence-sum implications
`O >= 0 => sum_i K_i^* O K_i >= 0` and
`O >= 0 => sum_i (I_aux tensor K_i)^* O (I_aux tensor K_i) >= 0`,
the finite Kraus-sum channel algebra
`A(O)=sum_i K_i^* O K_i` and `S(rho)=sum_i K_i rho K_i^*`, including
`A(I)=I` and `trace(S(rho))=trace(rho)` under
`sum_i K_i^* K_i=I`, plus `A(O^*)=A(O)^*` and
`trace(S(rho) O)=trace(rho A(O))`,
and the logical-lift code projection identities `L(I)=E E^*`,
`(E E^*)^2=E E^*`, and `(E E^*)^*=E E^*`. Full complete positivity as an
assertion about a sourced physical Kraus representation, categorical channel
semantics, categorical subobject semantics, and full THM-8.2.1 remain pending.
AF: node `1.5.1` validated by verifier `verifier-mat-chan-001` on
2026-05-14; node `1.5.2` validated by verifier `verifier-mat-trace-001` on
2026-05-14; node `1.5.8` validated by verifier
`verifier-logical-lift-proj-001` on 2026-05-15; node `1.5.9` validated by
verifier `verifier-gram-pos-002` on 2026-05-15 after an earlier verifier
challenge forced the witness quantification and examples to become genuinely
rectangular; node `1.5.11` validated by verifier
`verifier-psd-congruence-001` on 2026-05-15; node `1.5.12` validated by
verifier `verifier-amplified-psd-001` on 2026-05-15; node `1.5.13` validated
by verifier `verifier-congruence-sum-psd-001` on 2026-05-15; node `1.5.14`
validated by verifier `verifier-finite-kraus-channel-001` on 2026-05-15.
Lean: `Formalisation/LinearAlgebra/Isometry.lean` and
`Formalisation/LinearAlgebra/Trace.lean`.
Julia: `scripts/julia/linear_algebra_checks.jl` and
`scripts/julia/linear_algebra_trace_checks.jl`.
WolframScript: `scripts/wolfram/linear_algebra_exact.wls` and
`scripts/wolfram/linear_algebra_trace_exact.wls`.

### THM-8.3.1: Coherent Finite Ascending Channels

Statement: Given finite square matrices `E_nm` satisfying
`E_nn = I`, `E_ml E_nm = E_nl` for `n <= m <= l`, and
`E_nm^dagger E_nm = I`, define
`A_nm(O) = E_nm^dagger O E_nm` and
`L_nm(O) = E_nm O E_nm^dagger`. Then `A_nm(I)=I`,
`A_nm(A_ml(O)) = A_nl(O)`, `L_nn(O)=O`, and
`L_ml(L_nm(O)) = L_nl(O)`.

Dependencies: finite-dimensional matrix algebra, EXT-RG-001, EXT-RG-002, and
the direct-system equations in `handoff.md:1549`-`1559`; the logical-lift
equation `L_{N->M}(O_N)=V O_N V^dagger` in `handoff.md:832`-`835`.

Status: accepted for finite constant-coordinate matrix systems only. The
logical-lift part uses the same constant coordinate set at all scales and
therefore formalises only the finite algebraic coherence law. The completed
direct-limit Hilbert space, continuum field algebra, categorical fine-graining
system, and nonconstant growing Hilbert spaces remain pending.
AF: node `1.5.6` validated by verifier `verifier-coherent-asc-001` on
2026-05-15; node `1.5.10` validated by verifier
`verifier-coherent-lift-001` on 2026-05-15.
Lean: `Formalisation/LinearAlgebra/CoherentSystem.lean`.
Julia: `scripts/julia/coherent_system_checks.jl`.
WolframScript: `scripts/wolfram/coherent_system_exact.wls`.

### THM-9.3.1: Fibonacci F Matrix Exact Identities

Statement: The Fibonacci `F` matrix satisfies `F^\dagger F = I` and `F^2 = I`.

Dependencies: EXT-FIB-002, EXT-FIB-003.

Status: accepted for the real `2 x 2` matrix algebra claim. Scope excludes
categorical F-move semantics.
AF: node `1.3.2` validated by verifier `verifier-fib-mat-001` on
2026-05-14. AF external `Trebst Fibonacci F matrix local text` added for
future dependency scope.
Lean: `Formalisation/Fibonacci/Matrix.lean`.
Julia: `scripts/julia/fibonacci_checks.jl`.
WolframScript: `scripts/wolfram/fibonacci_exact.wls`.

### THM-9.3.2: Finite Braid-Matrix Unitarity By Conjugation

Statement: For finite square complex matrices `F` and `R`, if `F` is
two-sided unitary and `R` is two-sided unitary, then
`B = F R F^\dagger` is two-sided unitary. For the sourced Fibonacci data,
the 5 by 5 matrix `F` is unitary and self-adjoint, the displayed diagonal
`R` is unitary, and therefore the braid matrix `B = F R F^-1` is unitary.

Dependencies: EXT-FIB-003, EXT-FIB-004, and finite-dimensional matrix algebra.

Status: accepted for finite square matrices only. This does not prove
categorical braiding, braid group representations, conformal-block monodromy,
or analytic continuation.
AF: node `1.3.11` validated by verifier
`verifier-fib-braid-unitary-001` on 2026-05-15.
Lean: `Formalisation/LinearAlgebra/Isometry.lean`.
Julia: `scripts/julia/fibonacci_braid_unitarity_checks.jl`.
WolframScript: `scripts/wolfram/fibonacci_braid_unitarity_exact.wls`.

### THM-9.4.1: General Binary Fibonacci Isometry Conditions

Statement: A binary map `eta : Q -> Q tensor Q` with coefficients
`x,y,p,q,r` is an isometry iff `|x|^2 + |y|^2 = 1` and
`|p|^2 + |q|^2 + |r|^2 = 1`, with no cross-condition between simple sectors.

Dependencies: EXT-FIB-001 and orthogonality of distinct simples.

Local basis support:
`references/text/PenneysUnitaryFusionCategories.md:532` fixes orthogonal
fusion-tree bases for Hom spaces, `:610` identifies the Fibonacci category and
fusion rule, and `:623`-`:625` state the distinct-simple zero relation in Fib.

Status: accepted for the coordinate matrix theorem after choosing the sourced
orthogonal binary fusion-tree basis. Full categorical packaging remains a
dependency of later claims.
AF: node `1.3.6` validated by verifier `verifier-fib-binary-001` on
2026-05-14. AF external `Penneys binary fusion-tree basis and Fibonacci
distinct-simple relation` added after the verifier noted that the categorical
basis assumption was documented but not visible in `af scope`.
Lean: `Formalisation/Fibonacci/Binary.lean`.
Julia: `scripts/julia/fibonacci_checks.jl`.
WolframScript: `scripts/wolfram/fibonacci_exact.wls`.

### THM-9.5.1: Perron-Frobenius Fibonacci Map Is Isometric

Statement: The specified PF amplitudes using `d_1 = 1`, `d_tau = phi`, and
`D^2 = 1 + phi^2` define an isometric binary map.

Dependencies: EXT-FIB-002, THM-9.4.1.

Status: accepted for the scalar real-number normalisation identities, for the
coordinate-level binary map isometry after choosing the sourced orthogonal
binary fusion-tree basis and the handoff coefficients, and for the finite
Fibonacci instance of the quantum-dimension coefficient formula
`A^a_{bc} = sqrt(d_b d_c/(d_a D^2))` on the five allowed binary channels. The
fully general quantum-dimension amplitude theorem for arbitrary fusion
categories, categorical PF naturality, string-net fixed-point semantics, and
categorical basis construction remain pending.
AF: node `1.3.3` validated by verifier `verifier-pf-001` on 2026-05-14;
node `1.3.13` validated by verifier `verifier-fib-pf-binary-001` on
2026-05-15; node `1.3.15` validated by verifier
`verifier-fib-pf-dim-amp-001` on 2026-05-15.
Scope note: node `1.3.15` proves that `(1, phi)` is the Perron-Frobenius
dimension vector for the finite Fibonacci `tau` fusion matrix, that the
handoff formula `sqrt(d_b d_c/(d_a D^2))` yields the displayed coefficients
`1/D`, `phi/D`, `1/D`, `1/D`, and `sqrt(phi)/D`, and that the resulting
coordinate matrix equals the accepted PF binary matrix. Acceptance still
excludes categorical PF naturality, string-net fixed-point semantics, and
construction of the fusion-tree basis inside Lean.
Lean: `Formalisation/Fibonacci/Basic.lean`,
`Formalisation/Fibonacci/FusionRules.lean`, and
`Formalisation/Fibonacci/Binary.lean`.
Julia: `scripts/julia/fibonacci_checks.jl`.
WolframScript: `scripts/wolfram/fibonacci_exact.wls`.

### THM-9.6.1: Coassociative Fibonacci Candidate

Statement: Under positive real coefficients and the stated binary
coassociativity comparison through the Fibonacci F-move, the solution is
`x = phi^{-1}`, `y = phi^{-1/2}`, `p = q = phi^{-1}`,
`r = phi^{-3/2}`.

Dependencies: EXT-FIB-003, THM-9.3.1, THM-9.4.1.

Status: accepted for scalar real algebra, the displayed two-component
`F`-comparison vector, uniqueness of the positive real scalar solution, the
scalar interpretation of the fractional-power coefficients `phi^{-1/2}` and
`phi^{-3/2}`, and the finite coordinate-level isometry of the displayed
five-coefficient binary candidate in the fixed five-channel basis. The full
categorical coassociativity theorem, associator comparison in a formal
fusion-tree basis, and fusion-tree semantics remain incomplete. This remains a
high-risk target.

AF: node `1.3.4` validated by verifier `verifier-coassoc-scalar-001` on
2026-05-14.
Node `1.3.12` was validated by verifier `verifier-coassoc-unique-001` on
2026-05-15 for the positive scalar uniqueness theorem only.
Node `1.3.16` was validated by verifier `verifier-coassoc-frac-pow-001` on
2026-05-15 for the scalar fractional-power identities
`coassocY = (sqrt phi)^(-1)`, `coassocR = phi^(-1) (sqrt phi)^(-1)`,
`coassocR^2 = (phi^(-1))^3`, and
`coassocR = sqrt((phi^(-1))^3)`.
Node `1.3.17` was validated by verifier `verifier-coassoc-binary-iso-001` on
2026-05-15 for the fixed-basis coordinate matrix
`CoassocBinaryEta = BinaryEta coassocX coassocY coassocX coassocX coassocR`
and the finite Gram identity `CoassocBinaryEta^* CoassocBinaryEta = I`.
Lean: `Formalisation/Fibonacci/Coassoc.lean` for scalar algebra, positive
scalar uniqueness, fractional-power identities, and the coordinate-level
binary matrix isometry only; pending full categorical theorem.
Julia: `scripts/julia/fibonacci_checks.jl` and
`scripts/julia/coassoc_unique_checks.jl`.
WolframScript: `scripts/wolfram/fibonacci_exact.wls` and
`scripts/wolfram/coassoc_unique_exact.wls`.

### THM-9.7.1: Fibonacci RG No-Mixing Amplitudes

Statement: Assuming the listed RG blocking coefficients, the canonical
polar/no-mixing fine-graining amplitudes are the normalized conjugates shown
in `handoff.md`.

Dependencies: EXT-CFT-001 for exponent motivation, THM-6.2.1 for the actual
derivation. Coefficients are RG input data, not derived from CFT weights alone.

Status: accepted for the scalar finite-vector normalisation theorem, the
finite one-row no-mixing polar entry formula, and the exact rational chiral
exponent arithmetic used in the displayed Fibonacci RG powers. The two
displayed Fibonacci RG rows are also formalised as finite no-mixing rows with
real scale placeholders for `rho^(-4/5)` and `rho^(-2/5)`: Lean proves their
denominator formulas, normalized-conjugate entries, and row normalisation
when the denominator is nonzero. For the displayed probability experiment,
Lean also proves that the squared norm of the normalized tau-to-tau-tau
amplitude is
`|u_tau|^2 s_tau^2/(|j_L|^2+|j_R|^2+|u_tau|^2 s_tau^2)`, nonnegative, and at
most `1` when the denominator is positive. Substituting
`s_tau^2 = rho^(-4/5)` gives the handoff probability formula. The original
draft node `1.3.5` was archived after being superseded by stronger
Lean-backed nodes.
AF: node `1.3.7` validated by verifier `verifier-nomix-001` on 2026-05-14;
node `1.4.9` validated by verifier `verifier-nomix-polar-001` on
2026-05-15; node `1.5.7` validated by verifier
`verifier-cft-rg-exp-001` on 2026-05-15; node `1.3.14` validated by verifier
`verifier-fib-rg-nomix-rows-001` on 2026-05-15; node `1.5.16` validated by
verifier `verifier-rg-tautau-prob-001` on 2026-05-15.
Scope note: this does not prove the full polar-decomposition theorem, derive RG
coefficients, prove CFT exponent provenance, analyse fractional powers, plot
probability functions, derive physical probabilities, or supply categorical
basis semantics.
Lean: `Formalisation/LinearAlgebra/NoMixing.lean` and
`Formalisation/Fibonacci/RGNoMixing.lean`.
Julia: `scripts/julia/fibonacci_checks.jl`.
WolframScript: `scripts/wolfram/fibonacci_exact.wls`.

### WP3-PARTIAL-SUMMARY: Validated Fibonacci Finite Blocks

Statement: Nodes `1.3.8`, `1.3.1`, `1.3.2`, `1.3.3`, `1.3.6`,
`1.3.4`, `1.3.7`, and later nodes including `1.3.13` give validated
Fibonacci finite blocks: fusion-multiplicity table, golden-ratio algebra, real
F-matrix algebra, PF scalar normalisations, binary coordinate isometry,
coordinate-level PF binary map isometry, finite Fibonacci PF
dimension-formula coefficient calculation, coassociative scalar/F-vector
check, and scalar no-mixing normalisation.

Status: accepted as a proof-tree summary only; no new mathematical content.
The summary node `1.3.9` predates node `1.3.13`, so its acceptance scope is
only the smaller listed subset. Remaining WP3 work includes full categorical
coassociativity, arbitrary-category PF amplitude formula and categorical PF
naturality, and basis/dependency enforcement.

AF: node `1.3.9` validated by verifier `verifier-wp3-summary-001` on
2026-05-14.

### THM-9.8.1: Scaling Eigenoperators Conditional Theorem

Statement: If the full operator RG matrix is diagonal in a scaling basis with
entries `b^{-h_i}` or `b^{-Delta_i}`, then the basis operators are eigenoperators
with those eigenvalues.

Dependencies: finite-dimensional diagonal matrix algebra. External CFT
interpretation remains sourced separately.

Status: accepted for the finite-dimensional diagonal linear-algebra statement
only. The CFT weight arithmetic is separated into node `1.5.5`; the exact
rational primary, descendant, and diagonal nonchiral scaling-exponent
arithmetic from handoff section 9.8 is accepted in node `1.5.15`. Actual
diagonalisation of an operator RG matrix, semantics of real powers
`b^{-weight}`, construction of CFT descendants, and categorical operator
semantics remain pending.
AF: node `1.5.3` validated by verifier `verifier-scaling-diag-001` on
2026-05-14; node `1.5.15` validated by verifier
`verifier-cft-desc-exp-001` on 2026-05-15.
Lean: `Formalisation/LinearAlgebra/DiagonalScaling.lean` and
`Formalisation/Fibonacci/CFTWeights.lean`.
Julia: `scripts/julia/diagonal_scaling_checks.jl` and
`scripts/julia/cft_weight_checks.jl`.
WolframScript: `scripts/wolfram/diagonal_scaling_exact.wls` and
`scripts/wolfram/cft_weight_exact.wls`.

## Secondary Targets

### EXP-9.7.A: Julia RG Probability Experiment

Statement: Numerically verify RG amplitude normalisation and plot/example
probabilities as functions of `rho` or `b`.

Status: accepted for the finite tau-to-tau-tau probability formula and
`[0,1]` bounds in node `1.5.16`; plotting and physical probability
interpretation remain pending.

### NEG-9.8.A: Charge-Only Negative Example

Statement: The one-site charge-only operator space generally has eigenvalues
determined by chosen categorical fine-graining amplitudes, not by `b^{-2/5}`.

Status: accepted for a concrete finite two-dimensional counterexample only:
the identity/contrast channel has contrast eigenvalue `a`, and the verified
choice `a=1/2`, `b=32` gives `b^{-2/5}=1/4`.
AF: node `1.5.4` validated by verifier `verifier-charge-neg-001` on
2026-05-14.
Lean: `Formalisation/LinearAlgebra/ChargeOnly.lean`.
Julia: `scripts/julia/charge_only_negative_checks.jl`.
WolframScript: `scripts/wolfram/charge_only_negative_exact.wls`.
Scope note: this does not prove a theorem about all charge-only channels, does
not supply final CFT weight provenance, and does not construct the channel
categorically from Fibonacci fine-graining.

### ISO-ISING-001: Ising/TL Toy Refinement

Statement: The secondary Ising/TL toy refinement uses labels
`1, sigma, epsilon`, where `epsilon` is the source label `psi`. It records the
finite Ising fusion table, the nonchiral dimensions
`Delta_sigma = 1/8` and `Delta_epsilon = 1`, the exponent
`Delta_epsilon - 2 Delta_sigma = 3/4`, and the scalar toy-normalisation
identity
`(1/sqrt(2))^2 + (1/sqrt(2))^2 + (t/2)^2 = 1 + t^2/4`.

Ground truth:
`handoff.md:1466` through `handoff.md:1545`,
EXT-ISING-001, and local source lines listed there.

Status: accepted for the finite toy block only.

AF: node `1.8` validated by verifier `verifier-ising-toy-001` on
2026-05-15.
Lean: `Formalisation/Ising/Basic.lean`.
Julia: `scripts/julia/ising_toy_checks.jl`.
WolframScript: `scripts/wolfram/ising_toy_exact.wls`.
Scope note: this does not construct the full Ising category, a
Temperley-Lieb quotient, Ising F-symbols, operator product expansions, a CFT
spectrum, or a physical renormalization map.

## Conjecture Register

### CONJ-11.1: Coherent Ordered-Subdivision Family

Statement: Physically correct continuum fine-graining should be a coherent
family `eta^(r) : Q -> Q^{tensor r}` compatible with arbitrary ordered
subdivisions.

Status: conjectural.

### CONJ-11.2: Topological Fixed-Point Coherence

Statement: At topological fixed points, the coherent family can be expressed
purely using F-symbols, quantum dimensions, and local string-net/Pachner
identities.

Dependencies: EXT-SN-001.

Status: conjectural.

### CONJ-11.3: Away From Fixed Points, RG Trajectory Determines Coherence

Statement: Away from topological fixed points, the coherent family is
determined by the full Wilsonian RG trajectory, not the fusion category alone.

Status: conjectural.

### CONJ-A: Categorical Fine-Graining As Universal Isometry

Status: conjectural.

### CONJ-B: RG Determines Amplitudes By Polar Decomposition

Status: conjectural; finite-dimensional polar part will be theorem
THM-6.1.1/THM-6.2.1.

### CONJ-C: Topology Gives Allowed Channels, RG Gives Weights

Status: conjectural/modelling principle.

### CONJ-D: Coherent Continuum Limit Is Operadic

Status: conjectural.

### CONJ-E: Braiding Required For Order-Changing Interpolation

Status: conjectural pending precise formal statement.
