# Verification Check Log

This file records reproducible command-level evidence. AF remains the source of
truth for acceptance; a three-way pass here only means that the node is ready
for adversarial verifier review.

## 2026-05-14: Fibonacci Algebra Block

AF nodes:
- `1.2.7`: finite skeletal fusion-data structure with finite labels,
  distinguished unit, natural-number multiplicities, and left/right unit laws;
  instantiated by the Fibonacci table.
- `1.3.8`: finite skeletal Fibonacci fusion table.
- `1.3.1`: Fibonacci constants and `D^2` identities.
- `1.3.2`: Fibonacci `F`-matrix orthogonality/involutivity.
- `1.3.3`: Perron-Frobenius amplitude normalisations.
- `1.3.4`: scalar checks for the proposed coassociative coefficients.
- `1.3.5`: scalar checks for no-mixing RG normalisation.
- `1.3.6`: binary Fibonacci coordinate isometry condition.
- `1.3.7`: general scalar no-mixing amplitude normalisation.
- `1.3.12`: positive scalar uniqueness for the coassociative equations.
- `1.3.16`: scalar fractional-power identities for the coassociative
  coefficients.
- `1.3.17`: coordinate-level isometry of the coassociative binary eta matrix
  in the fixed five-channel basis.
- `1.3.13`: coordinate-level Perron-Frobenius binary eta isometry.
- `1.3.15`: finite Fibonacci Perron-Frobenius quantum-dimension coefficient
  calculation and resulting binary eta isometry.
- `1.3.14`: finite Fibonacci RG no-mixing vacuum and tau rows with supplied
  scale factors.
- `1.5.16`: finite tau-row probability formula for the tau-to-tau-tau channel
  and `[0,1]` bounds when the denominator is positive.

Commands run from repository root:

```text
lake build
julia scripts/julia/fusion_rules_checks.jl
wolframscript -file scripts/wolfram/fusion_rules_exact.wls
julia scripts/julia/fibonacci_checks.jl
wolframscript -file scripts/wolfram/fibonacci_exact.wls
```

Outcome:
- Lean: passed. The build completed successfully against Mathlib with Lean
  `v4.30.0-rc2`.
- Julia fusion rules: passed. The finite table checks all reported `PASS`.
- WolframScript fusion rules: passed. The exact table checks all reported
  `PASS`.
- Julia: passed. High-precision checks at 256-bit precision all reported
  `PASS`.
- WolframScript: passed. Exact symbolic checks all reported `PASS`.
- AF verifier: node `1.3.1` accepted by `verifier-fib-alg-001` on
  2026-05-14. The acceptance scope is only the real-number algebra claim about
  `phi` and `Dsq`, not any broader category-theoretic Fibonacci theorem.
- AF verifier: node `1.3.2` accepted by `verifier-fib-mat-001` on
  2026-05-14. The acceptance scope is only the real `2 x 2` matrix algebra
  claim for `FibF`, not the categorical F-move semantics.
- AF verifier: node `1.3.6` accepted by `verifier-fib-binary-001` on
  2026-05-14. The acceptance scope is only the coordinate `5 x 2` matrix claim
  after choosing an externally sourced orthogonal binary fusion-tree basis.
  The verifier noted that the AF node did not carry formal scoped dependencies;
  AF externals were added afterward for future dependency tracking.
- AF verifier: node `1.3.7` accepted by `verifier-nomix-001` on 2026-05-14.
  The acceptance scope is only the scalar finite-vector normalisation theorem.
  It excludes the full polar decomposition theorem, RG coefficient derivation,
  CFT exponent provenance, and categorical basis semantics.
- AF verifier: node `1.3.3` accepted by `verifier-pf-001` on 2026-05-14.
  The acceptance scope is only the two scalar real-number PF normalisation
  identities. It excludes the full categorical PF map isometry and general PF
  amplitude formula.
- AF verifier: node `1.3.4` accepted by `verifier-coassoc-scalar-001` on
  2026-05-14. The acceptance scope is only scalar real algebra and the
  displayed two-component `F`-comparison vector. It excludes full categorical
  coassociativity, uniqueness, associator/fusion-tree semantics, and the
  hand-derived derivation.
- AF verifier: node `1.3.8` accepted by `verifier-fib-fusion-001` on
  2026-05-14. The acceptance scope is only the finite skeletal
  fusion-multiplicity table. The `1 tensor 1 = 1` case is inferred from the
  source's nearby trivial-particle rule.
- AF verifier: node `1.2.7` accepted by
  `verifier-finite-skeletal-fusion-data-001` on 2026-05-15. The acceptance
  scope is only finite label/multiplicity skeleton data with unit laws and
  the Fibonacci table instance.
- AF verifier: node `1.3.9` accepted by `verifier-wp3-summary-001` on
  2026-05-14. The acceptance scope is only a proof-tree summary of the
  validated WP3 leaves; it adds no new mathematical content.
- AF verifier: node `1.3.12` accepted by `verifier-coassoc-unique-001` on
  2026-05-15. The acceptance scope is only the positive real scalar
  uniqueness theorem for the handoff coassociative equations. It excludes
  categorical coassociativity, associator semantics, fusion-tree basis
  semantics, and existence of the categorical map.
- AF verifier: node `1.3.16` accepted by
  `verifier-coassoc-frac-pow-001` on 2026-05-15. The acceptance scope is only
  the scalar real-number interpretation of the handoff fractional-power
  notation `phi^(-1/2)` and `phi^(-3/2)`.
- AF verifier: node `1.3.17` accepted by
  `verifier-coassoc-binary-iso-001` on 2026-05-15. The acceptance scope is
  only the fixed-basis finite coordinate isometry
  `CoassocBinaryEta^* CoassocBinaryEta=I` for the displayed coassociative
  coefficients. It excludes categorical coassociativity, associator
  semantics, F-move basis comparison, and categorical existence.
- AF verifier: node `1.3.13` accepted by `verifier-fib-pf-binary-001` on
  2026-05-15. The acceptance scope is only the finite coordinate-level PF
  binary matrix isometry after basis and coefficient conventions are fixed.
  It excludes the general PF amplitude formula, categorical naturality,
  string-net semantics, and categorical construction of the basis.
- AF verifier: node `1.3.15` accepted by
  `verifier-fib-pf-dim-amp-001` on 2026-05-15. The acceptance scope is only
  the finite Fibonacci quantum-dimension coefficient calculation on the five
  allowed binary channels, plus equality of the resulting coordinate matrix
  with the accepted PF binary eta matrix. It excludes categorical
  Perron-Frobenius naturality, string-net fixed-point semantics, and
  construction of fusion-tree bases.
- AF verifier: node `1.3.14` accepted by
  `verifier-fib-rg-nomix-rows-001` on 2026-05-15. The acceptance scope is
  finite row algebra for the sourced Fibonacci RG no-mixing rows after the RG
  coefficients and scale powers are supplied.
- AF verifier: node `1.5.16` accepted by
  `verifier-rg-tautau-prob-001` on 2026-05-15. The acceptance scope is finite
  tau-row probability algebra after coefficients and the scale factor are
  supplied.

Scope:
- Lean proves the finite skeletal fusion table in
  `Formalisation/Fibonacci/FusionRules.lean`. It defines the finite
  skeletal fusion-data structure in
  `Formalisation/Foundations/SkeletalFusion.lean` and instantiates it with
  the Fibonacci table.
- Lean proves `φ^2 = φ + 1`, `φ⁻¹ = φ - 1`, `φ⁻² + φ⁻¹ = 1`,
  `D^2 = 2 + φ`, PF scalar normalisations, and the parameterised `F`-matrix
  identities. It also proves the binary eta coordinate Gram/isometry
  equivalence, the coordinate-level PF binary eta isometry, and the finite
  Fibonacci PF dimension-formula coefficient calculation in
  `Formalisation/Fibonacci/Binary.lean`. It proves the finite Fibonacci
  fusion table, finite skeletal data instance, unit multiplicity laws, and
  dimension-vector eigenvalue statement in
  `Formalisation/Fibonacci/FusionRules.lean`, and the finite-vector scalar
  no-mixing normalisation theorem in
  `Formalisation/LinearAlgebra/NoMixing.lean`. It proves the finite
  Fibonacci RG no-mixing row denominator formulas, displayed
  normalized-conjugate entries, row normalisation, tau-to-tau-tau probability
  formula, and probability bounds in
  `Formalisation/Fibonacci/RGNoMixing.lean`. It proves the coassociative
  candidate scalar equations, displayed `F`-comparison vector, positive
  scalar uniqueness theorem, scalar fractional-power identities, and
  fixed-basis coordinate binary matrix isometry in
  `Formalisation/Fibonacci/Coassoc.lean`.
- Julia and WolframScript also check the scalar coassociative candidate,
  coassociative fractional-power identities, the coassociative binary eta
  Gram identity, RG normalisations, and tau-to-tau-tau probability formula.
  Julia checks a high-precision binary eta instance and the
  PF binary eta Gram product and dimension-formula coefficients;
  WolframScript verifies the symbolic binary eta Gram matrix, exact PF binary
  eta isometry, and dimension-formula coefficients. The claims beyond `1.3.1`,
  `1.3.2`, `1.3.3`, `1.3.4`, `1.3.6`, `1.3.7`, `1.3.8`, `1.3.12`,
  `1.2.7`, `1.3.13`, `1.3.14`, `1.3.15`, `1.3.16`, `1.3.17`, and `1.5.16`
  are accepted only within their verifier-scoped meanings.

Additional commands for node `1.3.15`:

```text
lake build Formalisation
julia scripts/julia/fibonacci_checks.jl
wolframscript -file scripts/wolfram/fibonacci_exact.wls
```

Outcome:
- Lean: passed. `Formalisation/Fibonacci/FusionRules.lean` proves the finite
  Fibonacci dimension vector `(1, phi)` is a Perron-Frobenius eigenvector for
  the `tau` fusion matrix. `Formalisation/Fibonacci/Binary.lean` proves that
  `sqrt(d_b d_c/(d_a D^2))` gives the five displayed coefficients and that
  the dimension-formula matrix is the accepted PF binary eta matrix.
- Julia: passed. High-precision checks verified the five coefficient
  formulae, matrix equality, and Gram isometry.
- WolframScript: passed. Exact symbolic checks verified the same coefficient
  formulae, matrix equality, and Gram isometry.
- AF verifier: accepted by `verifier-fib-pf-dim-amp-001` on 2026-05-15.

Additional commands for node `1.3.12`:

```text
lake build Formalisation
julia scripts/julia/coassoc_unique_checks.jl
wolframscript -file scripts/wolfram/coassoc_unique_exact.wls
```

Outcome:
- Lean: passed. `Formalisation/Fibonacci/Coassoc.lean` proves that positive
  real `x,y,r` satisfying `x^2+y^2=1`, `2x^2+r^2=1`, and
  `r^2=coassocR*x*y` must equal the proposed scalar candidate.
- Julia: passed. High-precision checks verify the eliminated polynomial roots
  and recovery of the positive `x,y,r`.
- WolframScript: passed. Exact quantified implications verify the same
  uniqueness statement.

Additional commands for node `1.3.16`:

```text
lake build Formalisation
julia scripts/julia/coassoc_unique_checks.jl
wolframscript -file scripts/wolfram/coassoc_unique_exact.wls
```

Outcome:
- Lean: passed. `Formalisation/Fibonacci/Coassoc.lean` proves
  `coassocY = (sqrt phi)^(-1)`,
  `coassocR = phi^(-1) (sqrt phi)^(-1)`,
  `coassocR^2 = (phi^(-1))^3`, and
  `coassocR = sqrt((phi^(-1))^3)`.
- Julia: passed. High-precision checks verify the corresponding
  fractional-power identities.
- WolframScript: passed. Exact checks verify the same scalar identities.

Additional commands for node `1.3.17`:

```text
lake build Formalisation
julia scripts/julia/coassoc_unique_checks.jl
wolframscript -file scripts/wolfram/coassoc_unique_exact.wls
```

Outcome:
- Lean: passed. `Formalisation/Fibonacci/Coassoc.lean` defines
  `CoassocBinaryEta = BinaryEta coassocX coassocY coassocX coassocX coassocR`
  and proves `CoassocBinaryEta.conjTranspose * CoassocBinaryEta = 1`.
- Julia: passed. High-precision checks verify the four entries of the
  resulting `5 x 2` Gram matrix.
- WolframScript: passed. Exact symbolic checks verify the same Gram identity.
- AF verifier: accepted by `verifier-coassoc-binary-iso-001` on 2026-05-15.

## 2026-05-15: Secondary Ising Toy Block

AF node:
- `1.8`: finite Ising toy fusion table, `epsilon = psi` notation bridge,
  rational exponent `Delta_epsilon - 2 Delta_sigma = 3/4`, and scalar
  normalisation numerator `1 + t^2/4`.

Commands run from repository root:

```text
lake build Formalisation
julia scripts/julia/ising_toy_checks.jl
wolframscript -file scripts/wolfram/ising_toy_exact.wls
```

Outcome:
- Lean: passed. `Formalisation/Ising/Basic.lean` defines the finite labels
  `1`, `sigma`, and `epsilon`, proves the sourced fusion table and
  multiplicity-free bounds, proves the rational exponent identity, and proves
  the real scalar normalisation numerator identity.
- Julia: passed. The finite table, total multiplicities, rational exponent,
  and representative scalar normalisation examples all reported `PASS`.
- WolframScript: passed. Exact finite-table and rational-algebra checks
  reported `PASS`.
- AF verifier: node `1.8` accepted by `verifier-ising-toy-001` on
  2026-05-15. The verifier checked `handoff.md`, the local Penneys Ising
  source, and the local Poilblanc anyon-chain source before accepting.

Scope:
- This is only the secondary finite toy block. It does not construct the full
  Ising category, a Temperley-Lieb quotient, Ising F-symbols, operator product
  expansions, a CFT spectrum, or a physical renormalization map.

## 2026-05-14: Finite-Matrix Fine-Graining Block

AF nodes:
- `1.4.12`: finite coordinate definition of a fine-graining map as a matrix
  with `E^*E=I`, with packaged finite consequences.
- `1.4.14`: packaged finite fine-graining consequences that ascending
  preserves adjoints and logical lift sends identity to the code projection.
- `1.4.1`: finite-matrix unitary dressing preserves isometry.
- `1.5.1`: finite-matrix ascending unitality, star preservation, and logical
  lift retraction.
- `1.5.2`: finite-matrix trace preservation, expectation preservation, and
  square-form positivity witness.
- `1.5.8`: finite-matrix logical lift of the coarse identity is the
  self-adjoint idempotent code projection `E E^*`.
- `1.5.9`: finite-matrix Gram-form positivity with arbitrary rectangular
  witness is preserved by ascending congruence.
- `1.5.11`: finite-matrix positive semidefiniteness in Mathlib's
  quadratic-form sense is preserved by one ascending congruence `E^* O E`.
- `1.5.12`: for any finite auxiliary coordinate type, positive
  semidefiniteness is preserved by the amplified congruence
  `(I_aux tensor E)^* O (I_aux tensor E)`.
- `1.5.13`: finite sums of PSD congruences preserve positive
  semidefiniteness, both without and with a finite auxiliary amplification.
- `1.5.14`: finite Kraus-sum channel algebra: unitality and state trace
  preservation under `sum_i K_i^* K_i=I`, plus star preservation and
  trace-pairing expectation preservation.

Commands run from repository root:

```text
lake build
julia scripts/julia/fine_graining_definition_checks.jl
wolframscript -file scripts/wolfram/fine_graining_definition_exact.wls
julia scripts/julia/linear_algebra_checks.jl
wolframscript -file scripts/wolfram/linear_algebra_exact.wls
julia scripts/julia/linear_algebra_trace_checks.jl
wolframscript -file scripts/wolfram/linear_algebra_trace_exact.wls
```

Outcome:
- Lean: passed. `Formalisation/LinearAlgebra/FineGraining.lean` defines the
  finite coordinate structure `FiniteFineGraining` as a matrix with
  `E^*E=I` and packages validated consequences through this structure,
  including ascending adjoint preservation and logical lift of the identity to
  `E E^*`.
  `Formalisation/LinearAlgebra/Isometry.lean` proves the matrix
  identities. `Formalisation/LinearAlgebra/Trace.lean` proves the trace
  identities, Gram-form witness preservation, and `Matrix.PosSemidef`
  preservation under `E^* O E` and under the finite auxiliary amplified
  congruence by `I_aux tensor E`. It also proves the finite sum versions
  `sum_i K_i^* O K_i` and `sum_i (I_aux tensor K_i)^* O
  (I_aux tensor K_i)`. For finite Kraus sums it proves unitality and state
  trace preservation under `sum_i K_i^* K_i=I`, and proves star preservation
  and trace-pairing expectation preservation for any finite family.
- Julia: passed. Numeric finite-matrix checks all reported `PASS`, including
  the finite fine-graining definition checks, ascending star preservation, and
  logical lift identity.
- WolframScript: passed. Exact finite-matrix checks all reported `PASS`,
  including the finite fine-graining definition checks, ascending star
  preservation, and logical lift identity.
- AF verifier: node `1.4.12` accepted by
  `verifier-finite-fine-graining-def-001` on 2026-05-15. The acceptance
  scope is only the finite coordinate matrix structure and packaged finite
  consequences after bases have been chosen.
- AF verifier: node `1.4.14` accepted by
  `verifier-finite-fg-star-lift-001` on 2026-05-15. The acceptance scope is
  only finite coordinate packaging of ascending adjoint preservation and
  logical lift identity.
- AF verifier: node `1.4.1` accepted by `verifier-mat-dress-001` on
  2026-05-14. The acceptance scope is only the finite complex matrix dressing
  calculation.
- AF verifier: node `1.5.1` accepted by `verifier-mat-chan-001` on
  2026-05-14. The acceptance scope is only finite-matrix unitality, star
  preservation, and logical lift retraction.
- AF verifier: node `1.5.2` accepted by `verifier-mat-trace-001` on
  2026-05-14. The acceptance scope is finite complex matrix trace
  preservation, trace-pairing expectation preservation, and the square-form
  identity `K^*(X^*X)K=(XK)^*(XK)`.
- AF verifier: node `1.5.8` accepted by
  `verifier-logical-lift-proj-001` on 2026-05-15. The acceptance scope is
  only the finite matrix identities `L(I)=E E^*`, idempotence, and
  self-adjointness.
- AF verifier: node `1.5.9` was first challenged by
  `verifier-gram-pos-001` because the initial evidence used only square
  witnesses. After the Lean theorem was strengthened to arbitrary finite
  witness index and the Julia/WolframScript examples were changed to a
  rectangular `4x3` witness, `verifier-gram-pos-002` accepted it on
  2026-05-15.
- AF verifier: node `1.5.11` accepted by
  `verifier-psd-congruence-001` on 2026-05-15. The acceptance scope is only
  finite complex matrix PSD preservation under one congruence.
- AF verifier: node `1.5.12` accepted by
  `verifier-amplified-psd-001` on 2026-05-15. The acceptance scope is finite
  complex matrix amplified PSD preservation under one one-Kraus congruence
  for arbitrary finite auxiliary coordinate type.
- AF verifier: node `1.5.13` accepted by
  `verifier-congruence-sum-psd-001` on 2026-05-15. The acceptance scope is
  finite complex matrix PSD preservation for finite congruence sums and their
  finite auxiliary amplified versions.
- AF verifier: node `1.5.14` accepted by
  `verifier-finite-kraus-channel-001` on 2026-05-15. The acceptance scope is
  finite-dimensional matrix algebra for finite Kraus sums. It does not assert
  that the categorical or physical fine-graining channel has a sourced Kraus
  representation, and it does not prove infinite-dimensional channel theory.

Scope:
- `1.4.12` and `1.4.14` are only finite coordinate packaging of project
  fine-graining as a matrix satisfying `E^*E=I` and selected finite matrix
  consequences; they do not construct `Q^tensor N`, categorical morphisms,
  Hom-sector semantics, categorical channel semantics, or physical
  fine-graining maps in a fusion category.
- `1.4.1` is only the finite-matrix calculation for unitary dressing; it does
  not prove tensor-product block isometry.
- `1.5.1`, `1.5.2`, `1.5.8`, `1.5.9`, `1.5.11`, `1.5.12`, `1.5.13`, and
  `1.5.14`
  cover the finite-matrix channel, trace, expectation, rectangular Gram-form
  positivity witness, order-theoretic PSD preservation for one congruence,
  finite auxiliary amplified PSD preservation, finite congruence-sum PSD
  preservation, finite Kraus-sum channel algebra, and logical-lift projection
  identities. They do not yet prove a sourced physical Kraus representation,
  categorical/channel semantics,
  categorical subobject semantics, or full spectral projection theory.

Additional commands for node `1.5.14`:

```text
lake build Formalisation
julia scripts/julia/linear_algebra_trace_checks.jl
wolframscript -file scripts/wolfram/linear_algebra_trace_exact.wls
```

Outcome:
- Lean: passed. `Formalisation/LinearAlgebra/Trace.lean` proves finite
  Kraus-sum unitality and state trace preservation under
  `sum_i K_i^* K_i=I`, and finite Kraus-sum star preservation and
  trace-pairing expectation preservation for arbitrary finite Kraus families.
- Julia: passed. A normalized finite Kraus-sum example checked unitality,
  star preservation, state trace preservation, and expectation preservation.
- WolframScript: passed. Exact checks verified the same finite Kraus-sum
  identities.

## 2026-05-14: Conditional Diagonal Scaling Block

AF node:
- `1.5.3`: finite diagonal scaling basis vectors are eigenvectors, with
  `b^(-weight)` as a definitional specialisation.

Commands run from repository root:

```text
lake build
julia scripts/julia/diagonal_scaling_checks.jl
wolframscript -file scripts/wolfram/diagonal_scaling_exact.wls
```

Outcome:
- Lean: passed. `Formalisation/LinearAlgebra/DiagonalScaling.lean` proves the
  generic diagonal scaling theorem and the `b^(-weight)` specialisation.
- Julia: passed. Numeric chiral and nonchiral diagonal examples reported
  `PASS`.
- WolframScript: passed. Exact chiral and nonchiral diagonal examples reported
  `PASS`.
- AF verifier: node `1.5.3` accepted by `verifier-scaling-diag-001` on
  2026-05-14.

Scope:
- This is only diagonal finite-dimensional linear algebra. It does not prove
  CFT weight provenance, actual RG diagonalisation, categorical operator
  semantics, or the charge-only negative example.

## 2026-05-14: Fibonacci CFT Weight Arithmetic

AF node:
- `1.5.5`: exact rational arithmetic for the sourced Fibonacci chiral
  conformal weight and its diagonal left-plus-right scaling dimension.
- `1.5.7`: exact rational arithmetic for the Fibonacci RG chiral exponents
  `h_1 - 2 h_tau = -4/5`, `h_tau - 2 h_tau = -2/5`, and doubled denominator
  exponents `-8/5`, `-4/5`.
- `1.5.15`: exact rational arithmetic for the scaling exponents in handoff
  section 9.8: tau primary `-2/5`, tau descendants `-(2/5+n)`, vacuum
  descendants `-n`, and diagonal nonchiral tau `-4/5`.

Commands run from repository root:

```text
lake build
julia scripts/julia/cft_weight_checks.jl
wolframscript -file scripts/wolfram/cft_weight_exact.wls
```

Outcome:
- Lean: passed. `Formalisation/Fibonacci/CFTWeights.lean` proves
  `su2WZWSpinWeight 3 1 = 2/5`, `tauChiralConformalWeight = 2/5`, and
  `tauChiralConformalWeight + tauChiralConformalWeight = 4/5`. It also
  proves the exact chiral OPE exponent equalities and their doubled
  denominator exponents for the no-mixing RG formulas, plus the primary,
  descendant, and diagonal nonchiral rational scaling exponents.
- Julia: passed. Exact rational checks reported `PASS`.
- WolframScript: passed. Exact rational checks reported `PASS`.
- AF verifier: node `1.5.5` accepted by `verifier-cft-weight-001` on
  2026-05-14. Acceptance is limited to the sourced rational arithmetic claim.
- AF verifier: node `1.5.7` accepted by `verifier-cft-rg-exp-001` on
  2026-05-15. Acceptance is limited to exact rational chiral exponent
  arithmetic and denominator exponent doubling.
- AF verifier: node `1.5.15` accepted by `verifier-cft-desc-exp-001` on
  2026-05-15. Acceptance is limited to exact rational arithmetic over supplied
  weights and descendant indexing conventions.

Scope:
- This node uses the local source for the level-3 `SU(2)` spin-1 Fibonacci
  identification, the conformal-weight table, and the handoff's RG exponent
  equations. It does not formalise the Wess-Zumino-Witten construction, PDF
  extraction, Wilsonian RG coefficients, physical OPE constants, physical RG
  diagonalisation, real-power analysis for `b^(-weight)`, construction of CFT
  descendants, scaling eigenoperator construction, or categorical operator
  semantics.

## 2026-05-14: Finite Ordered Configuration Combinatorics

AF node:
- `1.2.1`: ordered configurations, particle-number count, and Fibonacci
  configuration cardinalities.

Commands run from repository root:

```text
lake build
julia scripts/julia/configuration_checks.jl
wolframscript -file scripts/wolfram/configuration_exact.wls
```

Outcome:
- Lean: passed. `Formalisation/Foundations/Configurations.lean` proves
  configurations are functions `Fin n -> alpha`, particle number is bounded by
  `n`, constant vacuum has particle number `0`, constant non-vacuum has
  particle number `n`, and the number of configurations is `|alpha|^n`;
  Fibonacci labels specialise to `2^n`.
- Julia: passed. Fibonacci configuration counts and binomial particle sectors
  for `n <= 8` reported `PASS`.
- WolframScript: passed. Exact finite checks through `n <= 8` reported `PASS`.
- AF verifier: node `1.2.1` accepted by `verifier-config-001` on
  2026-05-14. Acceptance is limited to finite ordered-label combinatorics.

Scope:
- This is only finite ordered-label combinatorics. It does not construct
  categorical tensor products, `Q`, Hom spaces, direct-sum decompositions, or
  Hilbert-space semantics.
  The Julia and WolframScript binomial particle-sector checks are finite
  examples through `n <= 8`, not universal proofs.

## 2026-05-15: Finite Direct-Sum Coordinate Skeleton

AF node:
- `1.2.2`: finite coordinate flattening for direct-sum components.

Commands run from repository root:

```text
lake build Formalisation
julia scripts/julia/direct_sum_coordinate_checks.jl
wolframscript -file scripts/wolfram/direct_sum_coordinate_exact.wls
```

Outcome:
- Lean: passed. `Formalisation/Foundations/DirectSumCoordinates.lean` proves
  the complex-linear equivalence between flattened sigma-indexed coordinates
  and dependent component coordinates, the sigma-cardinality sum formula, and
  preservation of the standard finite coordinate pairing.
- Julia: passed. Exact rational complex examples checked dimension additivity,
  flatten/unflatten inverse behaviour, complex linearity, and coordinate
  pairing preservation.
- WolframScript: passed. Exact symbolic examples checked the same finite
  coordinate claims.
- AF verifier: node `1.2.2` accepted by `verifier-dirsum-coord-001` on
  2026-05-15. Acceptance is limited to the finite coordinate skeleton after
  choosing bases.

Scope:
- This is only the finite vector-space coordinate skeleton of the sourced
  direct-sum Hom expansion after choosing bases in every component. It does
  not construct categorical biproducts, `Q`, tensor powers, Hom functors,
  dagger categories, orthogonal direct sums, or fusion-category basis
  provenance.

## 2026-05-15: Finite Direct-Sum Projection Equations

AF node:
- `1.2.3`: finite coordinate projection/inclusion equations.

Commands run from repository root:

```text
lake build Formalisation
julia scripts/julia/direct_sum_projection_checks.jl
wolframscript -file scripts/wolfram/direct_sum_projection_exact.wls
```

Outcome:
- Lean: passed. `Formalisation/Foundations/DirectSumCoordinates.lean` proves
  the coordinate inclusion and projection equations: same-component
  projection-after-inclusion is identity, different-component
  projection-after-inclusion is zero, and the finite sum of
  inclusion-after-projection maps is identity on flattened coordinates.
- Julia: passed. Exact integer projection/inclusion matrices and rational
  complex coordinate reconstruction checks reported `PASS`.
- WolframScript: passed. Exact symbolic matrix and reconstruction checks
  reported `PASS`.
- AF verifier: node `1.2.3` accepted by `verifier-dirsum-proj-001` on
  2026-05-15. Acceptance is limited to finite coordinate projection/inclusion
  equations after choosing flattened coordinates.

Scope:
- This is only the finite coordinate model of the sourced direct-sum
  equations. It does not construct categorical biproducts, the categorical
  universal property, `Q`, tensor powers, or Hom functor semantics.

## 2026-05-15: Finite Orthogonal Direct-Sum Coordinate Model

AF node:
- `1.2.4`: finite coordinate isometry and range-projection equations for
  orthogonal direct sums.
- `1.2.8`: finite coordinate adjoint identity between component inclusion and
  component projection, plus self-adjointness of the coordinate range
  projection for the standard pairing.

Commands run from repository root:

```text
lake build Formalisation
julia scripts/julia/direct_sum_orthogonal_checks.jl
wolframscript -file scripts/wolfram/direct_sum_orthogonal_exact.wls
```

Outcome:
- Lean: passed. `Formalisation/Foundations/DirectSumCoordinates.lean` proves
  that a component inclusion preserves the standard finite coordinate pairing,
  that component projection is adjoint to component inclusion for the standard
  finite coordinate pairing, and that coordinate range projections are
  idempotent, self-adjoint for the pairing, and mutually annihilate on
  distinct components.
- Julia: passed. Exact finite matrix checks verified inclusion isometry,
  projection-as-adjoint, explicit complex-rational adjoint pairings, range
  idempotence, range self-adjointness, and orthogonality of distinct ranges.
- WolframScript: passed. Exact symbolic matrix checks verified the same finite
  examples.
- AF verifier: node `1.2.4` accepted by `verifier-dirsum-orth-001` on
  2026-05-15; node `1.2.8` accepted by
  `verifier-dirsum-adjoint-coord-001` on 2026-05-15. Acceptance is limited to
  the finite coordinate model, coordinate adjoint identity, and algebraic
  range-projection equations.

Scope:
- This is only the finite coordinate model after choosing bases. Lean does not
  construct a categorical dagger, categorical adjoints, orthogonal direct sums,
  `Q`, tensor powers, or Hom functor semantics.

## 2026-05-15: Finite Configuration-Space Coordinate Skeleton

AF node:
- `1.2.5`: finite coordinate flattening over ordered configuration sectors.
- `1.2.6`: finite-coordinate skeleton of the project definitions `Q` and
  `H_N^W`.

Commands run from repository root:

```text
lake build Formalisation
julia scripts/julia/configuration_space_checks.jl
wolframscript -file scripts/wolfram/configuration_space_exact.wls
julia scripts/julia/project_definition_checks.jl
wolframscript -file scripts/wolfram/project_definition_exact.wls
```

Outcome:
- Lean: passed. `Formalisation/Foundations/ConfigurationSpace.lean` proves
  that, after assigning a coordinate basis to every ordered configuration
  `Config alpha n = Fin n -> alpha`, flattened coordinates over
  `Sigma cfg, basis cfg` are complex-linearly equivalent to dependent
  component coordinates `forall cfg, basis cfg -> C`. It also proves the
  finite cardinality sum, the constant-sector cardinality
  `|alpha|^n * |beta|`, Fibonacci constant-sector cardinality `2^n * |beta|`,
  and preservation of the standard finite coordinate pairing.
  `Formalisation/Foundations/ProjectDefinitions.lean` packages this as the
  finite-coordinate skeleton of `Q` and `H_N^W`: a local occupation model is a
  finite label type with a vacuum label, `Q^{tensor N}` label summands are
  ordered configurations, and a fixed `H_N^W` coordinate sector expands over
  configuration-sector bases with pairing preservation.
- Julia: passed. Exact rational complex Fibonacci examples at `n = 3`
  checked dependent sector dimensions, flatten/unflatten behaviour, constant
  sector dimensions, and coordinate pairing preservation. The project
  definition script also checks the Fibonacci two-label `Q` skeleton,
  `Q^{tensor 4}` label count, vacuum/all-tau particle numbers, flattened
  `H_N^W` coordinate dimension, unflattening, and pairing preservation.
- WolframScript: passed. Exact symbolic Fibonacci examples checked the same
  finite coordinate claims and the same finite project-definition skeleton.
- AF verifier: node `1.2.5` accepted by
  `verifier-config-space-coord-001` on 2026-05-15. Acceptance is limited to
  the finite, basis-dependent configuration-space coordinate skeleton.
- AF verifier: node `1.2.6` accepted by
  `verifier-project-q-hilb-coord-001` on 2026-05-15. Acceptance is limited to
  the finite, basis-dependent coordinate skeleton of `Q` and `H_N^W`.

Scope:
- This does not construct categorical direct sums, categorical tensor powers,
  Hom functors, canonical categorical isomorphisms, unitarity, or
  fusion-category Hilbert-space semantics.

## 2026-05-15: Finite Truncated Fock Coordinate Skeleton

AF node:
- `1.2.9`: finite coordinate truncation of distinguishable Fock space by
  particle number.

Commands run from repository root:

```text
lake build Formalisation
julia scripts/julia/truncated_fock_checks.jl
wolframscript -file scripts/wolfram/truncated_fock_exact.wls
```

Outcome:
- Lean: passed. `Formalisation/Foundations/FockSpace.lean` defines the
  truncated basis as `Sigma(n : Fin (maxN+1)), Config localBasis n.val`,
  proves the particle-number coordinate expansion, the cardinality formula
  `sum_{n=0}^{maxN} |localBasis|^n`, zero- and one-particle sector counts,
  standard-pairing preservation, and the Fibonacci two-label specialisation.
- Julia: passed. Exact integer counts and exact complex-rational pairings were
  checked for finite truncations and local dimensions, including the
  Fibonacci two-label case.
- WolframScript: passed. Exact symbolic counts and pairings checked the same
  finite examples.
- AF verifier: node `1.2.9` accepted by
  `verifier-truncated-fock-coord-001` on 2026-05-15.

Scope:
- This is only a finite coordinate truncation of the sourced distinguishable
  Fock direct sum over particle number. It does not construct infinite direct
  sums, Hilbert completions, tensor products, exchange-symmetry quotients,
  categorical Hom spaces, or physical Fock-space semantics.

## 2026-05-15: Finite Fibonacci Braid Matrix Relation

AF node:
- `1.3.10`: finite two-dimensional Fibonacci braid matrix relation.

Commands run from repository root:

```text
lake build Formalisation
julia scripts/julia/fibonacci_braid_checks.jl
wolframscript -file scripts/wolfram/fibonacci_braid_exact.wls
```

Outcome:
- Lean: passed. `Formalisation/Fibonacci/BraidMatrices.lean` proves the
  parameterised algebraic identity
  `B12 * B23 * B12 = B23 * B12 * B23` for
  `B12 = diag(q^2,-q)` and `B23 = c [[-1, q s], [q s, q^2]]` under
  `c(q+1)=q` and `q s^2=q^2+q+1`.
- Julia: passed. High-precision numerical checks use the sourced
  specialisation `q=exp(-2*pi*i/5)`, `phi=(1+sqrt(5))/2`, `s=sqrt(phi)`, and
  `c=q/(q+1)`.
- WolframScript: passed. Exact symbolic checks verify the same sourced
  specialisation.
- AF verifier: node `1.3.10` accepted by `verifier-fib-braid-001` on
  2026-05-15. Acceptance is limited to finite `2 x 2` matrix algebra and the
  sourced numerical/symbolic specialisation.

Scope:
- This is only the finite `2 x 2` Fibonacci braid-matrix algebra from the
  local KZ/Fibonacci source. It does not construct categorical braidings,
  neighboring exchange maps on `Q^{tensor N}`, or a full braid group
  representation.

## 2026-05-15: Finite Fibonacci Braid Unitarity By Conjugation

AF node:
- `1.3.11`: finite square-matrix theorem that `B = F R F^dagger` is two-sided
  unitary when `F` and `R` are two-sided unitary, with source-specific checks
  for the displayed 5 by 5 Fibonacci `F` and `R` matrices.

Commands run from repository root:

```text
lake build Formalisation
julia scripts/julia/fibonacci_braid_unitarity_checks.jl
wolframscript -file scripts/wolfram/fibonacci_braid_unitarity_exact.wls
```

Outcome:
- Lean: passed. `Formalisation/LinearAlgebra/Isometry.lean` proves both
  `(F R F^dagger)^dagger (F R F^dagger)=I` and
  `(F R F^dagger)(F R F^dagger)^dagger=I` under explicit finite square-matrix
  unitary hypotheses.
- Julia: passed. High-precision checks verify the sourced 5 by 5 Fibonacci
  `F` matrix, diagonal `R` matrix, equality with `F R F^{-1}`, and two-sided
  unitarity of `B`.
- WolframScript: passed. Exact symbolic checks verify the same 5 by 5
  construction.
- AF verifier: node `1.3.11` accepted by
  `verifier-fib-braid-unitary-001` on 2026-05-15. The verifier also checked
  the local PDF because OCR around equation (2.8) is ambiguous; the PDF and
  extracted line 437 support `B = F R F^{-1}`.

Scope:
- This is only finite matrix algebra plus sourced finite examples. It does not
  construct categorical braidings, conformal blocks, mapping-class-group
  representations, or analytic monodromy.

## 2026-05-14: Charge-Only Negative Example

AF node:
- `1.5.4`: concrete two-dimensional charge-projector counterexample.

Commands run from repository root:

```text
lake build
julia scripts/julia/charge_only_negative_checks.jl
wolframscript -file scripts/wolfram/charge_only_negative_exact.wls
```

Outcome:
- Lean: passed. `Formalisation/LinearAlgebra/ChargeOnly.lean` proves that the
  identity/contrast channel fixes identity and sends contrast to `a` times
  contrast, and proves `1/2 != 1/4`.
- Julia: passed. Numeric check confirms `b=32` gives `b^(-2/5)=1/4`, while the
  chosen charge-only contrast eigenvalue is `1/2`.
- WolframScript: passed. Exact check confirms the same finite example.
- AF verifier: node `1.5.4` accepted by `verifier-charge-neg-001` on
  2026-05-14.

Scope:
- This is a concrete finite counterexample only. It does not prove a theorem
  about all charge-only channels, does not prove final CFT weight provenance,
  and does not construct the channel categorically from Fibonacci
  fine-graining.

## 2026-05-15: Coherent Finite Ascending And Logical-Lift Channels

AF node:
- `1.5.6`: finite constant-coordinate coherent refinement systems have
  unital and coherently composing ascending observable maps.
- `1.5.10`: finite constant-coordinate coherent refinement systems have
  identity and coherently composing logical-lift maps
  `L_nm(O)=E_nm O E_nm^*`.

Commands run from repository root:

```text
lake build Formalisation
julia scripts/julia/coherent_system_checks.jl
wolframscript -file scripts/wolfram/coherent_system_exact.wls
```

Outcome:
- Lean: passed. `Formalisation/LinearAlgebra/CoherentSystem.lean` defines a
  finite matrix system with `E_nn=I`, `E_ml E_nm=E_nl`, and
  `E_nm^*E_nm=I`, then proves `A_nm(I)=I` and
  `A_nm(A_ml(O))=A_nl(O)` for `A_nm(O)=E_nm^* O E_nm`. It also proves
  `L_nn(O)=O` and `L_ml(L_nm(O))=L_nl(O)` for
  `L_nm(O)=E_nm O E_nm^*`.
- Julia: passed. Exact rational rotation examples check identity maps,
  coherence, isometry, unitality, ascending-channel composition, and
  logical-lift composition.
- WolframScript: passed. Exact symbolic checks verify the same examples.
- AF verifier: node `1.5.6` accepted by `verifier-coherent-asc-001` on
  2026-05-15. The verifier checked the local handoff equations and the local
  OAR wavelet source, using the PDF because the text extraction is
  column-interleaved.
- AF verifier: node `1.5.10` accepted by `verifier-coherent-lift-001` on
  2026-05-15. The verifier checked the local handoff direct-system equations
  and logical-lift equations, then reran Lean, Julia, and WolframScript.

Scope:
- This is finite matrix algebra only. It does not construct a completed
  direct limit, continuum Hilbert space, continuum algebra, categorical
  fine-graining system, or nonconstant growing Hilbert spaces.

## 2026-05-14: Finite-Matrix Component And Tensor Blocks

AF nodes:
- `1.4.2`: finite complex matrix component orthogonality iff isometry.
- `1.4.3`: Kronecker product of two finite matrix isometries is an isometry.
- `1.4.10`: nested Kronecker product of three heterogeneous finite matrix
  isometries is an isometry.
- `1.4.11`: unitary dressing of the three-factor heterogeneous Kronecker
  isometry is an isometry.
- `1.4.16`: arbitrary N-factor heterogeneous finite-coordinate Kronecker
  tensor isometry, plus unitary dressing, over an ordered recursive tensor
  index.

Commands run from repository root:

```text
lake build
julia scripts/julia/component_orthogonality_checks.jl
julia scripts/julia/tensor_isometry_checks.jl
wolframscript -file scripts/wolfram/component_orthogonality_exact.wls
wolframscript -file scripts/wolfram/tensor_isometry_exact.wls
```

Outcome:
- Lean: passed. `Formalisation/LinearAlgebra/Component.lean` proves the column
  Gram/Kronecker-delta equivalence; `Formalisation/LinearAlgebra/Tensor.lean`
  proves the two-factor Kronecker isometry theorem; and
  `Formalisation/LinearAlgebra/HeterogeneousTensor.lean` proves the arbitrary
  N-factor heterogeneous finite-coordinate theorem with unitary dressing.
- Julia: passed. Numeric component and tensor examples reported `PASS`.
- WolframScript: passed. Exact component and tensor examples reported `PASS`.
- AF verifier: node `1.4.2` accepted by `verifier-mat-comp-001` and node
  `1.4.3` accepted by `verifier-mat-tensor-001` on 2026-05-14.
- AF verifier: node `1.4.10` accepted by
  `verifier-tensor-three-het-001` on 2026-05-15. The verifier checked that
  the Lean theorem uses independent fine/coarse index types and that the
  Julia/WolframScript examples use factor shapes `3x2`, `3x1`, and `2x2`.
- AF verifier: node `1.4.11` accepted by
  `verifier-dressed-three-tensor-001` on 2026-05-15. The verifier checked
  that the theorem combines a unitary on the three-factor fine product with
  heterogeneous factor isometries and that the examples use a nontrivial
  reversal permutation unitary.
- AF verifier: node `1.4.16` accepted by `verifier-het-tensor-n-001` on
  2026-05-15. The verifier checked the dependent finite-family theorem, the
  ordered recursive tensor index, and the four-factor Julia/WolframScript
  examples with a reversal permutation unitary.

Scope:
- `1.4.2` is only scalar finite-matrix component orthogonality; it does not
  prove block Hom spaces, categorical direct sums, or basis provenance.
- `1.4.3` and `1.4.10` are finite-matrix Kronecker-product theorems for two
  and three factors; `1.4.16` generalizes the finite-coordinate matrix algebra
  to arbitrary N over one ordered recursive tensor index.
- `1.4.11` is the finite three-factor dressed matrix case; `1.4.16`
  generalizes the dressed finite-coordinate matrix algebra to arbitrary N over
  the same recursive tensor index.
- `1.4.16` does not prove categorical tensor-product semantics, canonical
  associators, ordered partitions, that the local maps arise from
  fusion-category data, or a physical construction of the RG dressing unitary.

## 2026-05-14: Fixed-Map Tensor-Power Block

AF node:
- `1.4.7`: fixed finite matrix N-fold Kronecker tensor-power isometry.
- `1.4.15`: unitary dressing of a fixed finite matrix N-fold Kronecker
  tensor-power isometry.

Commands run from repository root:

```text
lake build
julia scripts/julia/tensor_power_checks.jl
wolframscript -file scripts/wolfram/tensor_power_exact.wls
```

Outcome:
- Lean: passed. `Formalisation/LinearAlgebra/TensorPower.lean` proves by
  induction that if `E^*E=I`, then every recursively defined Kronecker tensor
  power of `E` is an isometry. It also proves that any unitary dressing on the
  fine tensor-power coordinate space preserves that isometry.
- Julia: passed. Exact rational `3-4-5` rotation checks through `N <= 6` and
  dressed rectangular tensor-power checks with a reversal permutation unitary
  through `N <= 4` reported `PASS`.
- WolframScript: passed. The same exact rational checks reported `PASS`.
- AF verifier: node `1.4.7` accepted by `verifier-tensor-power-001` on
  2026-05-14. Acceptance is limited to fixed-map finite-matrix tensor powers.
- AF verifier: node `1.4.15` accepted by
  `verifier-dressed-tensor-power-001` on 2026-05-15. Acceptance is limited to
  fixed-local-map finite-matrix dressed tensor powers.

Scope:
- This is only the fixed-local-map finite-matrix induction case. It does not
  prove heterogeneous local maps, categorical tensor products, ordered
  partitions, physical construction of a dressing unitary, or the full
  categorical block fine-graining theorem. The Julia and WolframScript checks
  are exact finite examples, not universal proofs.

## 2026-05-14: Finite-Matrix Postcomposition Block

AF node:
- `1.4.4`: finite complex matrix postcomposition preserves Hom-space Gram
  products.
- `1.4.8`: finite square-test converse: if postcomposition preserves Gram
  products for all square coarse-coordinate test matrices, then `E^*E=I`.

Commands run from repository root:

```text
lake build
julia scripts/julia/postcompose_isometry_checks.jl
wolframscript -file scripts/wolfram/postcompose_isometry_exact.wls
```

Outcome:
- Lean: passed. `Formalisation/LinearAlgebra/Postcompose.lean` proves
  `(E F)^*(E G)=F^*G` from `E^*E=I`, and proves the finite square-test
  converse by applying the Gram-preservation hypothesis to identity matrices.
- Julia: passed. Numeric Gram and norm preservation examples reported `PASS`;
  the identity converse and non-isometry failure tests also reported `PASS`.
- WolframScript: passed. Exact Gram and norm preservation examples reported
  `PASS`; the exact identity converse and non-isometry failure tests also
  reported `PASS`.
- AF verifier: node `1.4.4` accepted by `verifier-mat-post-001` on
  2026-05-14.
- AF verifier: node `1.4.8` accepted by
  `verifier-postcompose-converse-001` on 2026-05-15. The verifier confirmed
  that the claim is only the finite square-test converse, not the full
  categorical semisimplicity/separating-Hom theorem.

Scope:
- These are only finite-matrix statements: the forward Gram-preservation
  direction and the square-test converse obtained by choosing `F=I`, `G=I`.
  They do not prove the full categorical separating-Hom result, categorical
  Hom-sector construction, or basis provenance.

## 2026-05-14: Conditional Polar Section Block

AF node:
- `1.4.5`: conditional finite-matrix polar-section algebra and entry formula.
- `1.4.13`: diagonal-Gram finite inverse-square-root construction and polar
  isometry.
- `1.4.9`: finite one-row no-mixing polar-section entry formula and isometry.

Commands run from repository root:

```text
lake build
julia scripts/julia/polar_section_checks.jl
wolframscript -file scripts/wolfram/polar_section_exact.wls
julia scripts/julia/fibonacci_checks.jl
wolframscript -file scripts/wolfram/fibonacci_exact.wls
```

Outcome:
- Lean: passed. `Formalisation/LinearAlgebra/Polar.lean` proves that
  `R^*(B B^*)R=I` implies `(B^*R)^*(B^*R)=I`, and proves the coordinate entry
  formula for `B^*R`. It also defines `diagonalInvSqrt` and proves that when
  `B B^*` is diagonal with strictly positive real diagonal entries, this
  explicit diagonal inverse-square-root satisfies the inverse-square-root
  condition and gives an isometry. `Formalisation/LinearAlgebra/NoMixing.lean`
  proves the finite one-row no-mixing polar-section entries
  `conjugate(beta_i)/sqrt(sum_i |beta_i|^2)` and the resulting isometry when
  the denominator is nonzero.
- Julia: passed. A numerical full-row-rank example reports inverse-square-root
  condition, isometry, and entry formula checks as `PASS`; the no-mixing
  polar entry formula and section isometry checks also report `PASS`. The
  diagonal case `g=(4,9)` reports diagonal entries, inverse-square-root
  condition, and isometry as `PASS`.
- WolframScript: passed. An exact diagonal example reports the same checks as
  `PASS`, including the diagonal inverse-square-root entries; the exact
  no-mixing polar entry formula and section isometry checks also report
  `PASS`.
- AF verifier: node `1.4.5` accepted by `verifier-mat-polar-001` on
  2026-05-14.
- AF verifier: node `1.4.13` accepted by
  `verifier-polar-diag-sqrt-001` on 2026-05-15. Acceptance is limited to the
  finite diagonal-Gram coordinate case.
- AF verifier: node `1.4.9` accepted by `verifier-nomix-polar-001` on
  2026-05-15. Acceptance is limited to finite one-row matrix algebra.

Scope:
- This is conditional finite-matrix algebra, the diagonal-Gram explicit
  inverse-square-root special case, and the one-row no-mixing corollary only.
  It does not prove positive square-root existence for arbitrary positive
  matrices, full-rank condition formalisation, the general polar decomposition
  theorem, Wilsonian RG derivation, physical OPE constants, or categorical
  fine-graining semantics.
- AF verifier: node `1.4.6` accepted by `verifier-wp4-summary-001` on
  2026-05-14. The acceptance scope is only a proof-tree summary of the
  validated WP4 finite-matrix leaves; it adds no new mathematical content.

## 2026-05-17: Phase 6 P6.3 — Julia infrastructure smoke test (canonical repo)

Phase 6 infrastructure-only smoke test (NOT an AF-node-acceptance
entry). Validates that the Julia cross-check scripts ported in P6.1
(commit `8b680b2`) execute cleanly in the canonical repo
(`cft-anyons/`) under Julia 1.12.3. Smallest script chosen per
`MIGRATION_PLAN.md:241` and named explicitly there:
`direct_sum_orthogonal_checks.jl` (LinearAlgebra stdlib only; no
project environment required).

Commands run from repository root:

```text
julia scripts/julia/direct_sum_orthogonal_checks.jl
```

Outcome:
- Julia: passed. Script printed `all orthogonal direct-sum coordinate
  checks passed` and exited 0. The assertions inside (inclusion–projection
  orthogonality `Π_i ∘ ι_j = δ_{ij} · I`, identity reconstruction
  `∑_j ι_j Π_j = I`, off-diagonal zeroing) all succeeded on the test
  data (`sizes = [1, 2, 3]`, `total_dim = 6`).
- No `Pkg.instantiate` required: script imports only the LinearAlgebra
  standard library. No `Project.toml` exists at repo root and none is
  needed for this script.

Scope:
- Phase 6 infrastructure validation only. The script's mathematical
  content was previously validated at CAD on 2026-05-14 (see the
  `## 2026-05-14: Foundations Direct-Sum Block` section above); this
  rerun confirms the byte-identical ported file (per P6.1 SHA256
  manifest at commit `8b680b2`) executes successfully in the
  canonical-repo environment.
- Does NOT close any of the 9 Wolfram cross-check follow-up bd issues
  (`cft-anyons-5tm.{9,11,13,15,17,19,21,23,26}`); those are blocked-by
  `cft-anyons-bh3` (P6.6: re-run all 25 Wolfram scripts), which
  requires TIB VPN.

## 2026-05-17: Phase 6 P6.4 — Wolfram infrastructure smoke test (canonical repo)

Phase 6 infrastructure-only smoke test (NOT an AF-node-acceptance
entry); the Wolfram companion to P6.3. Validates that the Wolfram
cross-check scripts ported in P6.1 (commit `8b680b2`) execute cleanly
in the canonical repo (`cft-anyons/`) via the TIB-VPN-routed Wolfram
license server under WolframScript 1.13.0 (`/usr/bin/wolframscript`).

Script chosen per `MIGRATION_PLAN.md:242` matched to P6.3's Julia leg:
`scripts/wolfram/direct_sum_orthogonal_exact.wls` (SHA256
`84a6daed9e1379a5828b7b7690a42ddaf5d88a13fd2a09a12c41bd59c57e0398` per
the P6.1 manifest, unchanged in this commit).

Commands run from repository root:

```text
wolframscript -file scripts/wolfram/direct_sum_orthogonal_exact.wls
```

Outcome:
- WolframScript: passed. Script printed `all exact orthogonal
  direct-sum coordinate checks passed` and exited 0; wall time 9.013s
  (license server reachable via TIB VPN).
- Exact symbolic checks (richer than the P6.3 Julia leg): inclusion
  isometry `ι_i^* ι_i = I_{sizes[i]}`, projection-is-adjoint
  `ι_i^* = Π_i`, range idempotence `(ι_i Π_i)² = ι_i Π_i`, range
  self-adjointness `(ι_i Π_i)^* = ι_i Π_i`, adjoint pairing
  `⟨ι_i v, w⟩ = ⟨v, Π_i w⟩` on the symbolic ambient vector
  `{1 + 2 I, -3 + I, 5/2 - 4 I, 7, -2 - 3 I, 11/3 + I/2}`, range
  self-adjoint pairing, and pairwise range orthogonality
  `(ι_i Π_i)(ι_j Π_j) = 0` for `i ≠ j`. All assertions passed exactly
  (no floating-point tolerance).

Scope:
- Phase 6 infrastructure validation only. The script's mathematical
  content was previously validated at CAD on 2026-05-14 (see the
  `## 2026-05-14: Foundations Direct-Sum Block` section above); this
  rerun confirms the byte-identical ported file (per P6.1 SHA256
  manifest at commit `8b680b2`) executes successfully in the
  canonical-repo environment with live license-server access.
- Does NOT close any of the 9 Wolfram cross-check follow-up bd issues
  (`cft-anyons-5tm.{9,11,13,15,17,19,21,23,26}`); those are still
  blocked-by `cft-anyons-bh3` (P6.6: re-run all 25 Wolfram scripts).
  This single-script smoke test only validates that the Wolfram
  infrastructure works; the per-Lean-file 3-way C-gates require the
  matching `.wls` scripts (e.g. `fibonacci_exact.wls`,
  `fibonacci_matrix_exact.wls`) which run as part of P6.6.
