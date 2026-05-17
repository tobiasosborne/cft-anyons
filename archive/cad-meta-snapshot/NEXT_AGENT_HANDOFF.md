# Next Agent Handoff

Date: 2026-05-15  
Workspace: `/home/tobias/Projects/cft-anyons`  
Branch state before writing this handoff: clean worktree. Latest mathematical
work commit: `d08dbed` (`Formalise truncated Fock coordinates`).

This repository is formalising the definitions, theorem targets, and
conjectures from `handoff.md`. Treat `handoff.md` as source material, not as a
status file. The live status files are:

- `MASTER_PROVENANCE.md`: acceptance gate and source/provenance ledger.
- `results/CHECKS.md`: commands and verification outcomes.
- `tex/cft_anyons_formalisation.tex`: self-contained mathematical document.
- `tex/cft_anyons_formalisation.pdf`: current built PDF.
- `af/master`: AF proof-tree workspace.

## Non-Negotiable Workflow Rules

- Never run more than one subagent at a time.
- Every verifier must be a fresh new subagent, one verifier subagent per AF
  verification job.
- Tell every verifier that counterexamples, gaps, overclaims, provenance
  failures, and errors are high-value successes.
- Do not use subagents for ordinary exploration unless explicitly needed; if
  used, keep it serial.
- Every accepted mathematical slice needs three independent checks wherever
  applicable: Lean, Julia, WolframScript, plus AF verification.
- Definitions and external references must string-match a claim or equation in
  a local PDF/text paper. Do not rely on memory or unsourced background.
- Keep categorical/infinite-dimensional claims scoped as pending unless they
  are actually formalised. Most accepted results are finite-coordinate or
  finite-matrix skeletons.
- `af` should be run in `af/master`, or from repo root with `-d af/master`.
  Running `af status` from repo root without `-d` fails because the ledger is
  under `af/master`.
- Attach AF evidence serially. Parallel `af attach` calls can trigger ledger
  concurrency failures.

## Current AF State

At handoff:

- `67` total nodes.
- `58` validated.
- `8` pending broad/root work-package nodes.
- `1` archived superseded node.
- `0` admitted.
- `0` refuted.
- No active verifier subagents.

AF still prints `unresolved` taint status on many validated nodes. This appears
to be global bookkeeping, not active verifier objections on the accepted leaf
nodes.

Useful commands:

```bash
git status --short
git log --oneline -15
af status
af jobs
af evidence <node-id>
lake build Formalisation
```

## Recent Commits

Latest commits, newest first:

```text
d08dbed Formalise truncated Fock coordinates
2c1f6a1 Formalise direct-sum adjoint coordinates
f5eb42b Formalise skeletal fusion data
4eef758 Formalise RG tau probability
b20bd18 Formalise CFT descendant exponents
25d6800 Formalise heterogeneous tensor blocks
d8f1a33 Formalise dressed tensor powers
e8e0a9f Package fine-graining star and lift identities
76cb7a0 Formalise project coordinate definitions
f96292d Formalise diagonal polar inverse sqrt
9672f79 Formalise coassociative binary isometry
574071e Formalise coassociative fractional powers
38f74cf Formalise finite fine-graining structure
961318b Formalise finite Kraus channel algebra
6ee9f79 Formalise Fibonacci PF dimension amplitudes
```

## Repository Structure

Lean entry point:

- `Formalisation.lean`

Lean modules:

- `Formalisation/Foundations/*.lean`
- `Formalisation/Fibonacci/*.lean`
- `Formalisation/Ising/Basic.lean`
- `Formalisation/LinearAlgebra/*.lean`

Check scripts:

- Julia: `scripts/julia/*.jl`
- WolframScript: `scripts/wolfram/*.wls`

Local sources:

- PDFs in `references/`
- extracted text/markdown in `references/text/`
- source manifest in `references/manifest/SOURCES.md`

## Accepted Work Summary

### Foundations

Accepted finite-coordinate/foundation nodes include:

- `1.2.1`: ordered configurations and particle-number combinatorics.
- `1.2.2`: finite direct-sum coordinate flattening and pairing preservation.
- `1.2.3`: direct-sum coordinate projection equations.
- `1.2.4`: orthogonal direct-sum coordinate isometry and range orthogonality.
- `1.2.5`: configuration-space coordinate expansion.
- `1.2.6`: finite-coordinate skeleton of `Q` and `H_N^W`.
- `1.2.7`: finite skeletal fusion-data structure and Fibonacci instance.
- `1.2.8`: component projection is coordinate-adjoint to component inclusion;
  range projection is self-adjoint for the coordinate pairing.
- `1.2.9`: finite truncated distinguishable-Fock coordinate model.

Important Lean files:

- `Formalisation/Foundations/Configurations.lean`
- `Formalisation/Foundations/DirectSumCoordinates.lean`
- `Formalisation/Foundations/ConfigurationSpace.lean`
- `Formalisation/Foundations/ProjectDefinitions.lean`
- `Formalisation/Foundations/SkeletalFusion.lean`
- `Formalisation/Foundations/FockSpace.lean`

Scope warning: these are finite coordinate skeletons after bases are chosen.
They do not construct categorical direct sums, tensor powers, Hom functors, or
Hilbert-space completions.

### Fibonacci And Ising

Accepted blocks include:

- Fibonacci fusion rules and multiplicity table.
- Golden-ratio and quantum-dimension arithmetic.
- Fibonacci `F`-matrix orthogonality/involutivity.
- Fibonacci braid matrix relation and braid-unitarity-by-conjugation.
- Perron-Frobenius scalar normalisations.
- Binary coordinate isometry criterion.
- PF binary isometry and PF dimension-amplitude formula.
- Coassociative scalar equations, uniqueness, fractional-power identities,
  and coordinate binary isometry.
- Fibonacci CFT conformal-weight arithmetic, RG exponents, descendant
  exponents.
- RG no-mixing row algebra and tau-tau probability formula.
- Secondary finite Ising/TL toy block.

Important Lean files:

- `Formalisation/Fibonacci/Basic.lean`
- `Formalisation/Fibonacci/FusionRules.lean`
- `Formalisation/Fibonacci/Matrix.lean`
- `Formalisation/Fibonacci/BraidMatrices.lean`
- `Formalisation/Fibonacci/Binary.lean`
- `Formalisation/Fibonacci/Coassoc.lean`
- `Formalisation/Fibonacci/CFTWeights.lean`
- `Formalisation/Fibonacci/RGNoMixing.lean`
- `Formalisation/Ising/Basic.lean`

Scope warning: these prove exact arithmetic and finite matrix/basis-dependent
claims. They do not construct the full Fibonacci category, CFT, OPE theory, or
physical RG channel.

### Linear Algebra, Fine-Graining, And Channels

Accepted finite-matrix blocks include:

- Postcomposition Gram preservation and finite square-test converse.
- Component orthogonality equivalence.
- Kronecker tensor isometry: two-factor, tensor powers, three-factor
  heterogeneous, arbitrary-N heterogeneous.
- Unitary dressing of isometries.
- Conditional polar section algebra and entry formula.
- Diagonal Gram inverse-square-root polar special case.
- One-row no-mixing polar formula.
- Finite fine-graining structure and packaged consequences.
- Ascending channel unitality/star preservation/logical lift retraction.
- Trace and expectation preservation.
- Gram-form positivity witness preservation.
- Mathlib `Matrix.PosSemidef` congruence, amplified congruence, and finite
  Kraus-sum PSD preservation.
- Finite Kraus-sum channel algebra.
- Coherent ascending and logical-lift systems.
- Charge-only negative example.

Important Lean files:

- `Formalisation/LinearAlgebra/Isometry.lean`
- `Formalisation/LinearAlgebra/Postcompose.lean`
- `Formalisation/LinearAlgebra/Component.lean`
- `Formalisation/LinearAlgebra/Tensor.lean`
- `Formalisation/LinearAlgebra/TensorPower.lean`
- `Formalisation/LinearAlgebra/HeterogeneousTensor.lean`
- `Formalisation/LinearAlgebra/Polar.lean`
- `Formalisation/LinearAlgebra/NoMixing.lean`
- `Formalisation/LinearAlgebra/FineGraining.lean`
- `Formalisation/LinearAlgebra/Trace.lean`
- `Formalisation/LinearAlgebra/CoherentSystem.lean`
- `Formalisation/LinearAlgebra/DiagonalScaling.lean`
- `Formalisation/LinearAlgebra/ChargeOnly.lean`

Scope warning: these are finite matrix theorems. They do not prove categorical
semantics, infinite-dimensional channel theory, or physical derivations unless
explicitly stated.

## How To Add A New Accepted Slice

Use this pattern:

1. Pick a small source-backed target from `MASTER_PROVENANCE.md` or a
   carefully scoped finite subtarget of `handoff.md`.
2. Locate exact source lines in `references/text/...` and cite them in the
   Lean/doc/provenance text.
3. Implement Lean in the appropriate module, importing it from
   `Formalisation.lean` if it is a new file.
4. Add or extend Julia and WolframScript checks.
5. Run:

   ```bash
   lake build Formalisation
   julia scripts/julia/<check>.jl
   wolframscript -file scripts/wolfram/<check>.wls
   ```

6. Create an AF child under the right work package. Usually:

   ```bash
   cd af/master
   af claim <parent> --owner codex-prover --role prover --refresh --timeout 2h
   af refine <parent> "<precise scoped statement>" --owner codex-prover \
     --type claim --justification by_definition --requires-validated <deps>
   ```

7. Attach evidence serially:

   ```bash
   af attach <node> <file> --type verification --agent codex-prover \
     --description "..."
   af attach <node> <julia-script> --type test --agent codex-prover \
     --description "..."
   af attach <node> <wolfram-script> --type test --agent codex-prover \
     --description "..."
   af attach <node> <source-file> --type other --agent codex-prover \
     --description "Local source lines ..."
   ```

8. Spawn exactly one fresh verifier subagent. The verifier should claim the
   AF node, run Lean/Julia/Wolfram, check for `sorry`, `admit`, `axiom`,
   `unsafe`, verify source scope, accept or challenge, and release.
9. Update `MASTER_PROVENANCE.md`, `results/CHECKS.md`, and
   `tex/cft_anyons_formalisation.tex`.
10. Rebuild the PDF:

    ```bash
    cd tex
    pdflatex -interaction=nonstopmode -halt-on-error cft_anyons_formalisation.tex
    ```

11. Run `git diff --check`, then commit the slice including AF ledger files.

## Promising Next Slice

The most promising next Lean-worthy slice is the general finite-matrix polar
inverse-square-root theorem using Mathlib continuous functional calculus.

Current accepted polar status:

- `Formalisation/LinearAlgebra/Polar.lean` proves the conditional theorem:
  if `Rᴴ * ((B * Bᴴ) * R) = 1`, then `Bᴴ * R` is an isometry.
- It also proves the explicit diagonal-Gram inverse-square-root special case.
- General positive/invertible square-root semantics are still pending in
  `MASTER_PROVENANCE.md` under THM-6.1.1 / THM-6.2.1.

Exploration after commit `d08dbed` found a workable Lean route, but no repo
files were edited. Useful Mathlib API:

```lean
open Matrix BigOperators
open scoped ComplexOrder
open scoped MatrixOrder

CFC.sqrt_mul_sqrt_self
CFC.sqrt_nonneg
Matrix.nonsing_inv_mul
Matrix.mul_nonsing_inv
Matrix.conjTranspose_nonsing_inv
Matrix.isUnit_iff_isUnit_det
isUnit_of_mul_isUnit_left
```

Candidate theorem shape for `Formalisation/LinearAlgebra/Polar.lean`:

```lean
theorem cfcInvSqrt_inverse_condition
    (B : Matrix coarse fine Complex)
    (hG : (B * B.conjTranspose).PosSemidef)
    (hunit : IsUnit (B * B.conjTranspose)) :
    let G : Matrix coarse coarse Complex := B * B.conjTranspose
    let R : Matrix coarse coarse Complex := Inv.inv (CFC.sqrt G)
    R.conjTranspose * (G * R) = 1 := by
  -- use hG.nonneg, CFC.sqrt_mul_sqrt_self, CFC.sqrt_nonneg,
  -- self-adjointness of sqrt G, nonsingular inverse lemmas, and hunit.
```

The scratch proof succeeded in `/tmp` with `C = Complex`, modulo project
style. A cleaned proof should then feed directly into
`matrix_polar_section_isometry` to prove:

```lean
(B.conjTranspose * Inv.inv (CFC.sqrt (B * B.conjTranspose))).conjTranspose *
  (B.conjTranspose * Inv.inv (CFC.sqrt (B * B.conjTranspose))) = 1
```

Careful scope wording:

- This proves finite matrix algebra for an invertible positive-semidefinite
  Gram matrix using Mathlib CFC square root.
- It still does not prove the full-rank iff invertible-Gram equivalence unless
  separately formalised.
- It does not prove categorical polar decomposition.

Julia/Wolfram checks can extend `scripts/julia/polar_section_checks.jl` and
`scripts/wolfram/polar_section_exact.wls`; the current Julia already computes
a numerical spectral inverse square root for a non-diagonal `G`, while
Wolfram currently checks exact diagonal only. Add exact non-diagonal
positive-definite examples if possible.

Potential AF node under `1.4`:

```text
MAT-POLAR-CFC-SQRT-001: For a finite complex matrix B whose Gram matrix
G = B B^dagger is positive semidefinite and invertible, the CFC inverse square
root R=(sqrt G)^-1 satisfies R^dagger G R = I, hence B^dagger R is an
isometry. Lean proves this finite-matrix theorem using Mathlib CFC square
roots; Julia and WolframScript check representative examples. This does not
prove full-rank equivalence or categorical polar decomposition.
```

## Other Remaining Pending Areas

These are larger or more categorical:

- Full categorical configuration-space/Hom expansion:
  `Hom(W,Q^tensor N) ~= direct sum over label tuples`.
- Braided-category neighboring exchange maps and full braid-group
  representation on `Hom(W,Q^tensor N)`.
- Full categorical fine-graining and Hom-sector semantics.
- Physical/categorical derivation of RG coefficients and channels.
- Actual CFT operator RG construction/diagonalisation, beyond finite diagonal
  matrix algebra and rational exponent checks.
- Infinite distinguishable Fock direct sum/Hilbert completion, beyond finite
  truncation.
- Broad AF verification of `1.1`, `1.6`, and `1.7`; these are verifier jobs
  for provenance, verifier discipline, and the pdflatex document. They are
  broad and should only be attempted when the documents are coherent enough
  for adversarial review.

## Document Status

`tex/cft_anyons_formalisation.tex` is self-contained in the sense currently
used by this project: all accepted finite definitions/results are written out
with scope notes and AF statuses. It builds successfully with `pdflatex`; the
log contains overfull/underfull box warnings from long paths and verifier
names, but no fatal errors.

When adding a new accepted theorem, update the TeX file in the relevant
section, not just the provenance ledger.

## Known Pitfalls

- Do not overstate source support. Many source lines motivate a mathematical
  construction, while Lean proves only a finite coordinate model.
- Do not call the finite coordinate skeleton a categorical construction.
- Do not mark broad top-level nodes accepted just because many leaves are
  accepted.
- Do not attach evidence in parallel with `af`.
- Do not run more than one verifier subagent at once.
- Do not forget to commit AF ledger JSON files together with code/docs.
- Do not use `af status` from repo root unless passing `-d af/master`.
