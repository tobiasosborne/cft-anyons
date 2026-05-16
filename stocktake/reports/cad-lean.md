# Stocktake: Lean 4 Formalisation in `cft-anyons-deprecated/`

**Date:** 2026-05-16  
**Slice:** `/home/tobias/Projects/cft-anyons-deprecated/` — Lean 4 files only  
**Inspector:** read-only static analysis (no `lake build`)

---

## 1. Scope

The deprecated repository contains a Lean 4 formalisation package built against
Mathlib. The entry point `Formalisation.lean` re-exports 28 `.lean` files
organised into four subdirectories:

| Subdirectory | Files | Total lines | Declarations |
|---|---|---|---|
| `Foundations/` | 6 | 715 | 70 |
| `Fibonacci/` | 8 | 1063 | 123 |
| `Ising/` | 1 | 101 | 15 |
| `LinearAlgebra/` | 13 | 1170 | 82 |
| **Total** | **28** | **3049** | **290** |

**Toolchain:** `leanprover/lean4:v4.30.0-rc2`  
**Key dependency:** Mathlib at commit `d6dab93da86c64219ab1497ffadce1a66aa04701`  
**Build record (from `results/CHECKS.md`):** `lake build` passed successfully
against Lean `v4.30.0-rc2` on 2026-05-14.

---

## 2. File-by-file Inventory

Every file has **0 `sorry`** and **0 `axiom`** declarations. All proofs are
closed. The namespace is uniformly `CFTAnyons.*`.

### 2.1 Foundations/

#### `SkeletalFusion.lean` (71 lines, 9 decls, no imports from project)

The backbone abstraction: `FiniteSkeletalFusionData` is a `structure` with
fields `Label`, `unit`, `fusionMultiplicity`, and axioms `leftUnit`/`rightUnit`.
This is a finite, coordinate-level skeleton — no associators, F-symbols, duals,
or pentagon equation.

Key declarations: `FiniteSkeletalFusionData`, `totalFusionMultiplicity`,
`MultiplicityFree`, `leftUnit_same`, `leftUnit_different`, `rightUnit_same`,
`rightUnit_different`, `total_leftUnit`, `total_rightUnit`.

#### `Configurations.lean` (82 lines, 10 decls; imports `Fibonacci.FusionRules`)

`Config α n := Fin n → α`. Defines `constant`, `particleNumber`, and a suite of
cardinality theorems. Instantiated for `FibLabel`: proves `|FibLabel| = 2`,
`|Config FibLabel n| = 2^n`, and particle-number lemmas for constant
configurations.

#### `DirectSumCoordinates.lean` (249 lines, 27 decls; no project imports)

The most substantial Foundations file. Formalises the sigma/pi coordinate
equivalence for direct-sum spaces: `Sigma κ → ℂ` ↔ `∀ i, κ i → ℂ`. Defines
`sigmaToPi`, `piToSigma`, `sigmaPiLinearEquiv`, coordinate pairings, component
inclusion/projection maps, and adjoint relations. Proves orthogonality and
completeness of component projections.

#### `ConfigurationSpace.lean` (85 lines, 6 decls; imports `Configurations`, `DirectSumCoordinates`)

Packages the linear equivalence `Sigma sectorBasis → ℂ` ↔ component-wise
coordinates as `configSpaceLinearEquiv`. Proves cardinality and
pairing-preservation theorems, including a Fibonacci specialisation.

#### `FockSpace.lean` (105 lines, 7 decls; imports `Configurations`, `DirectSumCoordinates`)

Defines `truncatedFockLengthExpansion` — a linear equivalence across all
particle-number sectors up to `maxN`. Proves basis cardinality (sum over length
sectors), sector cardinalities for 0- and 1-particle sectors, and
pairing-preservation. Fibonacci specialisation: `|truncatedFockBasis FibLabel
maxN|`.

#### `ProjectDefinitions.lean` (121 lines, 11 decls; imports `ConfigurationSpace`)

Defines `LocalOccupationModel` (a label type with distinguished vacuum) and
`IndefiniteParticleSectorCoordinates` as coordinate skeletons for `H_N^W =
Hom(W, Q^⊗N)`. The `indefiniteParticleSectorExpansion` linear equivalence is the
coordinate-level version of the direct-sum decomposition. Contains a
`FibonacciProjectDefinitions` namespace instantiating the model for `FibLabel`.

---

### 2.2 Fibonacci/

#### `Basic.lean` (70 lines, 13 decls; no project imports)

Proves the exact golden-ratio identities: `φ^2 = φ+1`, `φ⁻¹ = φ-1`,
`φ⁻¹² + φ⁻¹ = 1`, `φ⁻¹² = 2-φ`. Defines `Dsq := 1+φ²` and proves
`Dsq = 2+φ > 0`. Proves the PF vacuum and tau quantum-dimension normalisation
identities.

#### `FusionRules.lean` (124 lines, 15 decls; imports `Foundations.SkeletalFusion`, `Fibonacci.Basic`)

Defines `FibLabel := {one, tau}` and `fusionMultiplicity`. Proves all four
non-trivial fusion rules, multiplicity-freeness, and
`tau⊗tau` total multiplicity = 1. Instantiates `fibSkeletalFusionData :
FiniteSkeletalFusionData` — the only concrete fusion-data instance in the
project. Defines `fibDim : FibLabel → ℝ` (quantum dimensions) and proves the
Perron-Frobenius eigenvector equation `tauFusionMatrix · fibDim = φ · fibDim`.

#### `Matrix.lean` (90 lines, 11 decls; imports `Fibonacci.Basic`)

Defines the generic 2×2 `FMatrix a b` (the Fibonacci F-symbol parameterised by
entries). Proves `FMatrix_sq` (involutivity from `a²+b²=1`),
`FMatrix_orthogonal`, and specialises to `FibF` with entries `(φ⁻¹, φ⁻¹²)`.
Proves `FibF_orthogonal` and `FibF_involutive`.

#### `Binary.lean` (169 lines, 16 decls; imports `Fibonacci.Basic`, `Fibonacci.FusionRules`)

The 5×2 Perron-Frobenius (PF) binary `η` matrix. Defines `BinaryChannel` (5
channels) and `FibCharge` (2 charges). `BinaryEta` is parametric;
`PFBinaryEta` uses the quantum-dimension amplitudes `pfAmplitude`. Proves
isometry of `PFBinaryEta` (i.e., `PFBinaryEta† · PFBinaryEta = I`). Also
proves `PFBinaryEtaFromDimensions` (an alternative construction from quantum
dimensions) equals `PFBinaryEta`.

#### `Coassoc.lean` (225 lines, 25 decls; imports `Fibonacci.Binary`, `Fibonacci.Matrix`)

The coassociativity scalar algebra. Defines `coassocX := φ⁻¹`,
`coassocY := √(φ⁻¹)`, `coassocR := coassocX·coassocY`. Proves the two
isometry constraints `coassocX² + coassocY² = 1` and
`2·coassocX² + coassocR² = 1`. Proves positivity, a general
`coassoc_factor_identity`, and the uniqueness theorem
`coassoc_positive_solution_unique` (the positive solution to the quadratic
system is the one given). Defines `CoassocBinaryEta` and proves its isometry.
The file explicitly notes in its module docstring that it does **not** prove the
full categorical coassociativity equation `(η⊗id)η = (id⊗η)η` — only the
scalar algebra for the coefficients.

#### `CFTWeights.lean` (114 lines, 21 decls; no project imports)

Rational arithmetic for su(2) WZW level-3 conformal weights. Defines
`su2WZWSpinWeight`, `tauChiralConformalWeight = 2/5`,
`vacuumChiralConformalWeight = 0`. Proves these equal the expected rational
values. Defines scaling dimensions, RG-norm exponents, and descendant weights
`h_τ + n` for `n : ℕ`. Proves `tau_diagonal_scaling_exponent`.

#### `BraidMatrices.lean` (63 lines, 4 decls; no project imports)

Defines `fibB12` and `fibB23WithScalar` (2×2 complex braid matrices parametric
in `q, s, c`) and proves `fibB12_fibB23WithScalar_braid_relation` — that a
specific linear combination satisfies the braid equation.

#### `RGNoMixing.lean` (208 lines, 18 decls; imports `LinearAlgebra.NoMixing`)

Packages the no-mixing RG rows for Fibonacci. Defines `FibRGVacuumChannel` (2
channels: `oneOne`, `tauTau`) and `FibRGTauChannel` (3 channels: `tauOne`,
`oneTau`, `tauTau`). Defines `fibRGVacuumBeta` and `fibRGTauBeta` as explicit
parametric amplitude vectors. Proves denominator expressions, denominator
non-negativity, tau-to-tau-tau probability in `[0,1]`, explicit amplitude
entries, and normalisation of the two rows.

---

### 2.3 Ising/

#### `Basic.lean` (101 lines, 15 decls; no project imports)

Defines `IsingLabel := {one, sigma, epsilon}` and the full Ising fusion table.
Proves all individual fusion rules (sigma×sigma = 1+epsilon, etc.), unit axioms,
multiplicity-freeness, and sigma×sigma total multiplicity = 2. Defines
`DeltaSigma = 1/8`, `DeltaEpsilon = 1` as rationals and proves the exponent
`DeltaEpsilon - 2·DeltaSigma = 3/4`. Defines `toyNormNumerator` and proves
`toyNormalisation`. No connection to `FiniteSkeletalFusionData` (unlike
Fibonacci's `FusionRules.lean`).

---

### 2.4 LinearAlgebra/

#### `Isometry.lean` (135 lines, 9 decls; no project imports)

Core matrix isometry lemmas. Proves: `matrix_ascending_unital` (`E† E = I →
E† (I · E) = I`), `matrix_unitary_dressing_isometry` (conjugation by unitary
preserves isometry), `matrix_unitary_conjugation_isometry/coisometry`,
`matrix_ascending_star_preserving`, `matrix_logical_lift_retract`,
`matrix_logical_lift_identity`, `matrix_range_projection_idempotent`,
`matrix_range_projection_self_adjoint`. All proved from `E† E = I` alone.

#### `Polar.lean` (97 lines, 7 decls; imports Mathlib only)

The polar-section algebra: defines `diagonalInvSqrt g = diag(1/√g_μ)` and
proves `matrix_polar_section_isometry`: given `R†(BB†)R = I`, then
`(B†R)†(B†R) = I`. Also proves `matrix_polar_diagonal_section_isometry` (using
`R = diagonalInvSqrt g` when `BB† = diag(g)`). Does **not** prove existence of
positive square roots — only assumes the inverse-square-root matrix is given.

#### `NoMixing.lean` (105 lines, 8 decls; imports Mathlib only)

Proves the scalar no-mixing normalisation theorem. `NoMixingAmplitude β i =
conj(β_i) / √(∑|β_j|²)`. Proves `noMixingAmplitude_normalised` (the amplitude
vector is unit-norm when denominator ≠ 0). Packages this as
`noMixingPolarSection_isometry` for a `PUnit`-indexed blocking matrix.

#### `FineGraining.lean` (96 lines, 12 decls; imports `Isometry`, `Postcompose`, `Trace`)

The principal abstraction layer. Defines `FiniteFineGraining` as a structure
wrapping a matrix `E : Matrix fine coarse ℂ` with field `isometry : E† E = I`.
Re-exposes all isometry consequences through this bundled type: gram condition,
ascending unitality, postcompose gram-preservation, trace-preservation,
expectation-preservation, star-preservation, logical-lift retract/identity,
range-projection idempotency/self-adjointness.

#### `Trace.lean` (204 lines, 14 decls; imports Mathlib only)

Proves `matrix_state_embedding_trace_preserving` and
`matrix_expectation_preserving`. Introduces `IsGramFormPositive` and proves
preservation of positive semidefiniteness through isometric channels (including
amplified variants and finite Kraus sums). Key theorem:
`matrix_finite_kraus_sum_preserves_posSemidef` — a finite sum of Kraus
operators preserves positive semidefiniteness. Also proves unitality and
star-preservation for finite Kraus sums, and trace-preservation for finite Kraus
state channels.

#### `Postcompose.lean` (48 lines, 2 decls; no project imports)

Proves `matrix_postcompose_preserves_gram`: if `E†E = I` then
`(EF)†(EG) = F†G`. Also proves that if `(EF)†(EF) = F†F` implies `E` is an
isometry (from Gram preservation implying isometry).

#### `CoherentSystem.lean` (71 lines, 7 decls; imports Mathlib only)

Defines `CoherentMatrixSystem`: a compatible family of matrices `map n m` with
`map n n = I`, composition law `map m l · map n m = map n l`, and isometry at
each step. Proves `coherentAscending_comp` (ascending observables compose) and
`coherentLogicalLift_comp` (lifts compose) — the refinement-system coherence
equations.

#### `Tensor.lean` (67 lines, 3 decls; imports `Isometry`)

Proves Kronecker-product isometry: `matrix_kronecker_isometry` (tensor product
of isometries is an isometry), `matrix_kronecker_three_isometry` (triple tensor),
`matrix_unitary_dressed_three_kronecker_isometry`.

#### `TensorPower.lean` (84 lines, 5 decls; imports `Tensor`)

Defines `matrixTensorPower E n` as the n-fold Kronecker power of a matrix over
`(α → β)^n` index types. Proves `matrixTensorPower_isometry` and
`matrix_unitary_dressed_tensorPower_isometry`.

#### `HeterogeneousTensor.lean` (127 lines, 3 decls; imports `Tensor`)

Proves isometry of a "heterogeneous" tensor product (a family of possibly
distinct matrices tensored over a finite index set). Key theorem:
`matrixHeterogeneousTensor_isometry` and a unitary-dressed variant.

#### `Component.lean` (39 lines, 1 decl; no project imports)

Single theorem: `matrix_component_orthogonality_iff` — characterises when a
matrix has orthogonal columns via coordinate pairings.

#### `DiagonalScaling.lean` (46 lines, 5 decls; no project imports)

Defines `scalingBasisVector`, `diagonalScaling`, and `scalingEigenvalue`. Proves
the diagonal scaling operator acts as multiplication on basis vectors.

#### `ChargeOnly.lean` (53 lines, 7 decls; no project imports)

Defines `chargeIdentity` and `chargeContrast` on `ChargeTwo`, and the
`chargeOnlyChannel` operator. Proves eigenvector equations and that the charge
contrast eigenvalue is not 1/4.

---

## 3. Key Concepts and Artifacts

**Dependency graph summary** (→ means "imports"):

```
Foundations.SkeletalFusion  ←  Fibonacci.FusionRules  ←  Foundations.Configurations
                                                                     ↓
                              Fibonacci.Basic  ←  Fibonacci.Matrix  ↓
                                      ↓                Fibonacci.Binary  ←  Fibonacci.Coassoc
                              Fibonacci.FusionRules

LinearAlgebra.Isometry  ←  LinearAlgebra.Tensor  ←  LinearAlgebra.TensorPower
                        ←  LinearAlgebra.FineGraining  (also ← Postcompose, ← Trace)
LinearAlgebra.NoMixing  ←  Fibonacci.RGNoMixing

Foundations.DirectSumCoordinates  ←  Foundations.ConfigurationSpace
                                  ←  Foundations.FockSpace
Foundations.ConfigurationSpace   ←  Foundations.ProjectDefinitions
```

**Main artifacts:**

- `FiniteSkeletalFusionData`: fusion-category skeleton (unit laws only, no
  pentagon or associator).
- `FiniteFineGraining`: bundled isometric matrix E† E = I, re-exporting all
  channel properties.
- `CoherentMatrixSystem`: compatible family of refinement maps.
- `PFBinaryEta`, `CoassocBinaryEta`: the two Fibonacci binary refinement
  candidates as explicit 5×2 matrices; both proved isometric.
- `FibF`: the Fibonacci F-matrix; proved orthogonal and involutive.
- `noMixingAmplitude_normalised`: the no-mixing polar section formula in full
  generality.
- `matrix_finite_kraus_sum_preserves_posSemidef`: general positivity
  preservation for Kraus channels.

---

## 4. State Assessment

**Sorry/axiom hygiene: excellent.** Zero `sorry` and zero `axiom` across all
28 files. Every proof is closed.

**Build health (from manifest and CHECKS.md):** `lake build` passed on
2026-05-14 against Lean `v4.30.0-rc2` and Mathlib commit `d6dab93`. The
`.lake/packages/` directory is present, confirming the build cache exists.

**AF verification status (from NEXT_AGENT_HANDOFF.md):** 67 nodes total, 58
validated, 8 pending broad work-package nodes, 0 admitted, 0 refuted. Key AF
nodes for the Lean slice (1.2.7, 1.3.1–1.3.8, 1.3.12–1.3.17, 1.5.16) were
accepted by dedicated verifier subagents.

**Scope boundary (explicitly documented):** The formalisation is deliberately
a "finite coordinate skeleton." What is explicitly **not** done:
- No categorical direct sums or Hom functors.
- No F-symbol pentagon equation or full associator data (only the scalar
  output of the Fibonacci F-matrix as a numeric matrix).
- `Coassoc.lean` explicitly states it does **not** prove categorical
  coassociativity `(η⊗id)η = (id⊗η)η` — only the scalar algebra.
- `Polar.lean` assumes the inverse-square-root matrix as input; does not prove
  existence of positive square roots (a Mathlib gap at time of writing).
- `Ising/Basic.lean` does not connect to `FiniteSkeletalFusionData` (unlike
  `Fibonacci/FusionRules.lean`).
- No Koo–Saleur lattice Virasoro generators are formalised.
- No monoidal structure, braidings, or ribbon structure beyond the braid
  relation in `BraidMatrices.lean`.

---

## 5. Overlap with `cft-anyons/summary.tex`

The formalisation implements Lean phases 1–3 of the roadmap in summary.tex §18
("Formalisation roadmap"). Mapping:

| Lean file(s) | summary.tex target | Coverage |
|---|---|---|
| `Foundations/SkeletalFusion.lean` | §3.1 (fusion category: labels, unit, multiplicities) | Phase 1 complete; no associators/duals |
| `Fibonacci/FusionRules.lean` | §7.1 (Fibonacci fusion table); §3.1 instantiation | Complete for fusion rules; `fibSkeletalFusionData` is the one instance |
| `Ising/Basic.lean` | §8.1 (Ising fusion table, conformal weights ∆_σ=1/8, ∆_ε=1) | Fusion table and ∆ values proved; §8.2–8.5 (TL chain, Koo–Saleur) absent |
| `Fibonacci/Basic.lean` | §7.1 (φ², D², quantum dimensions) | Phase 3 complete: all golden-ratio identities |
| `Fibonacci/Matrix.lean` | §7.2 (Fibonacci F-symbol; Lemma: F^T F=I, F²=I) | Complete for the 2×2 F-matrix; no categorical F-move interpretation |
| `Fibonacci/Binary.lean` | §7.3 (PF binary refinement; Lemma: PF isometry) | Proved |
| `Fibonacci/Coassoc.lean` | §7.3.2 (coassociative splitting; Thm: positive coassoc solution unique) | Scalar algebra and matrix isometry proved; categorical proof gap explicitly noted |
| `Fibonacci/CFTWeights.lean` | §9.2 (su(2)₃ WZW weights; §10.1 scaling exponents) | τ chiral weight 2/5, descendant weights proved; §9.3 (Koo–Saleur) absent |
| `Fibonacci/BraidMatrices.lean` | Not a named claim in summary.tex | Peripheral: braid relation check only |
| `Fibonacci/RGNoMixing.lean` | §10.2 (No-mixing corollary; RG-decorated Fibonacci rows) | No-mixing normalisation proved; §10.2 amplitude formulas proved for both rows |
| `Foundations/Configurations.lean` | §4.1 (configuration space Q^⊗N, particle number) | Finite coordinate skeleton complete |
| `Foundations/DirectSumCoordinates.lean` | §4.1–4.2 (direct-sum decomposition; Σ↔Π isomorphism) | Full coordinate equivalence proved |
| `Foundations/ConfigurationSpace.lean` | §4.2 (sector expansion) | Proved |
| `Foundations/FockSpace.lean` | §4.3 (truncated Fock space) | Coordinate-level complete |
| `Foundations/ProjectDefinitions.lean` | §4.4 (H_N^W coordinate skeleton; Q definition) | Coordinate-level definition and pairing proved |
| `LinearAlgebra/FineGraining.lean` | §4.4 (fine-graining map E_{P→P'}) | `FiniteFineGraining` structure captures the E†E=I isometry; all channel properties proved |
| `LinearAlgebra/Polar.lean` | §10.2 Thm (polar-decomposition canonical section) | Matrix algebra complete; existence of positive square root not proved |
| `LinearAlgebra/NoMixing.lean` | Cor 10.4 (no-mixing scalar formula) | Proved in full generality |
| `LinearAlgebra/Trace.lean` | Channel properties throughout §4–5 | State-embedding trace preservation, expectation preservation, Kraus positivity all proved |
| `LinearAlgebra/CoherentSystem.lean` | §4.4 (coherent refinement system; E_{P'→P''} ∘ E_{P→P'}) | Composition and unitality of coherent family proved |
| `LinearAlgebra/Tensor.lean`, `TensorPower.lean`, `HeterogeneousTensor.lean` | §4.2 (tensor-product refinements) | Kronecker isometry, n-fold power, heterogeneous family — all proved |
| `LinearAlgebra/Isometry.lean`, `Postcompose.lean`, `Component.lean` | General isometry lemmas used throughout | Supporting infrastructure |
| `LinearAlgebra/DiagonalScaling.lean`, `ChargeOnly.lean` | §8.5 (charge-only channel) | Eigenvalue structure proved; the "charge-only failure" (Warning §8.5) not a theorem here |

**Notable gaps vs. summary.tex:**

- §5 (algebra objects, comultiplication ∆ = m†/√λ): no Lean formalisation.
- §6 (square-zero worked example): not formalised.
- §7.4 (Fibonacci as dagger-special algebra; the uniqueness theorem): not
  formalised; `Coassoc.lean` covers only scalar coassociativity constraints.
- §8.2–8.4 (TL generators, dense Ising chain, Koo–Saleur): not formalised.
- §9 (Koo–Saleur lattice Virasoro approximants): not formalised.
- §11 (non-tree / pair-creation interpolation): not formalised.
- §12 (three-tensors from OPE): not formalised.

---

## 6. Recommended Disposition

**Salvageable and directly reusable (migrate or vendor as-is):**

- `LinearAlgebra/` (all 13 files) — clean, abstract, no sorry, well-structured.
  `FineGraining.lean`, `NoMixing.lean`, `Polar.lean`, `Trace.lean`, and
  `CoherentSystem.lean` are the most valuable; they formalise the core channel
  properties needed for any follow-on formalisation of the refinement framework.
  These have no Fibonacci-specific content and would transplant directly.

- `Foundations/DirectSumCoordinates.lean` and `Foundations/SkeletalFusion.lean`
  — generic, abstract, immediately reusable in a fresh formalisation.

- `Fibonacci/Basic.lean` and `Fibonacci/Matrix.lean` — the golden-ratio algebra
  and F-matrix theorems are solid, complete, and widely needed.

**Salvageable with caveats:**

- `Fibonacci/FusionRules.lean`, `Binary.lean`, `Coassoc.lean`, `RGNoMixing.lean`
  — complete and correct for the finite/scalar level they target. The key
  limitation is that `Coassoc.lean` does not prove categorical coassociativity;
  any migration should preserve the explicit scope disclaimer from the module
  docstring.

- `Fibonacci/CFTWeights.lean` — correct rational arithmetic. Useful as a
  reference table; no mathematical risk.

- `Fibonacci/BraidMatrices.lean` — minimal braid-relation check; low priority
  but harmless to keep.

- `Foundations/Configurations.lean`, `ConfigurationSpace.lean`,
  `FockSpace.lean`, `ProjectDefinitions.lean` — correct coordinate skeletons.
  Note that `Configurations.lean` imports `Fibonacci.FusionRules`, creating a
  surprising reverse dependency (Foundations → Fibonacci); any reuse should
  decouple this.

**Low priority / narrow scope:**

- `Ising/Basic.lean` — complete for the fusion table and two rational weights,
  but not connected to `FiniteSkeletalFusionData` and covers only a small slice
  of §8. Worth keeping as a reference but not a formalisation priority.

- `LinearAlgebra/ChargeOnly.lean`, `DiagonalScaling.lean`, `Component.lean`
  — supporting lemmas. Fine to carry over.

**Do not drop any file:** there are no sorry-ridden or axiom-heavy files to
discard. All 28 files are proof-complete. The deprecated status of the
repository reflects strategic reorientation, not mathematical failure.

**For a fresh formalisation in `cft-anyons/`:** the recommended migration order
is: (1) `LinearAlgebra/` as self-contained infrastructure; (2) `Foundations/`
with the decoupling fix; (3) `Fibonacci/` in dependency order
(Basic → Matrix → FusionRules → Binary → Coassoc → CFTWeights → RGNoMixing);
(4) `Ising/` last and with a `FiniteSkeletalFusionData` hook added.
