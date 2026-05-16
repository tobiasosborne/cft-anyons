import Formalisation.LinearAlgebra.Isometry

/-!
# LinearAlgebra.Tensor — ported from cft-anyons-deprecated

Source: cft-anyons-deprecated/Formalisation/LinearAlgebra/Tensor.lean
Port: cft-anyons P4.4 (MIGRATION_PLAN.md:187). Body unchanged from source;
this docstring block extended with GLOSSARY cross-references.

Finite matrix tensor-product isometry.

This is the two-factor Kronecker product core of the block fine-graining
isometry theorem.

Cross-references to `GLOSSARY.md`:

-- GLOSSARY: conv:basics
   The dagger `f^\dagger` is the complex-conjugate transpose for matrices;
   realised here as `Matrix.conjTranspose` from Mathlib. The Kronecker
   product `E₁ ⊗ₖ E₂` is Mathlib's `Matrix.kroneckerMap` (notation from
   `open scoped Kronecker`); the dagger interacts with the Kronecker
   product via `Matrix.conjTranspose_kronecker` (i.e.
   `(E₁ ⊗ₖ E₂)^\dagger = E₁^\dagger ⊗ₖ E₂^\dagger`) and the mixed-product
   identity `Matrix.mul_kronecker_mul`
   (`(A₁ ⊗ₖ A₂) * (B₁ ⊗ₖ B₂) = (A₁ * B₁) ⊗ₖ (A₂ * B₂)`). Every theorem
   in this file states an isometry identity `(·)^\dagger * (·) = 1` in
   terms of `conjTranspose`, with the dagger / Kronecker compatibility
   doing the work.

-- GLOSSARY: def:refmap
   A refinement map `E_{P\to P'}` is required to be both an isometry
   (`E^\dagger E = id`) AND cellwise local
   (`E_{P\to P'} = ⊗_{I∈P} E_{I→Ch_{P'}(I)}`) per the canonical
   `def:refmap` statement. This file proves the Kronecker-product core
   of the cellwise-local-isometry compatibility: if each cellwise
   factor `Eᵢ` is an isometry, then the Kronecker product of the
   factors is also an isometry. Specifically,
   `matrix_kronecker_isometry` is the two-factor base case
   (`E₁^\dagger E₁ = 1 ∧ E₂^\dagger E₂ = 1 ⇒ (E₁ ⊗ₖ E₂)^\dagger (E₁ ⊗ₖ E₂) = 1`);
   `matrix_kronecker_three_isometry` is the three-factor instance
   (proved by applying the two-factor case to `(E₁ ⊗ₖ E₂)` and `E₃`);
   `matrix_unitary_dressed_three_kronecker_isometry` combines the
   three-factor Kronecker isometry with left-multiplication by a unitary
   `U` (via `matrix_unitary_dressing_isometry` from `Isometry.lean`),
   showing that `U * ((E₁ ⊗ₖ E₂) ⊗ₖ E₃)` is an isometry. This is
   precisely the tensor-product structural support GLOSSARY `def:refmap`
   names as "the tensor-product structure of the cellwise-local
   condition is in `LinearAlgebra/Tensor.lean` (P4.4),
   `TensorPower.lean` (P4.5), `HeterogeneousTensor.lean` (P4.6)" —
   supporting infrastructure for `LinearAlgebra/FineGraining.lean` at
   P4.11. The Kronecker product `⊗ₖ` is the Mathlib coordinate-level
   realisation of the categorical tensor product `⊗` of `def:fuscat`
   (after choosing orthonormal fusion-tree bases).
-/

namespace CFTAnyons
namespace LinearAlgebra

noncomputable section

open Matrix
open scoped Kronecker

variable {coarse₁ fine₁ coarse₂ fine₂ coarse₃ fine₃ : Type*}
variable [Fintype coarse₁] [DecidableEq coarse₁]
variable [Fintype fine₁] [DecidableEq fine₁]
variable [Fintype coarse₂] [DecidableEq coarse₂]
variable [Fintype fine₂] [DecidableEq fine₂]
variable [Fintype coarse₃] [DecidableEq coarse₃]
variable [Fintype fine₃] [DecidableEq fine₃]

omit [Fintype coarse₁] [DecidableEq fine₁] [Fintype coarse₂] [DecidableEq fine₂] in
theorem matrix_kronecker_isometry
    (E₁ : Matrix fine₁ coarse₁ ℂ) (E₂ : Matrix fine₂ coarse₂ ℂ)
    (h₁ : E₁.conjTranspose * E₁ = 1)
    (h₂ : E₂.conjTranspose * E₂ = 1) :
    (E₁ ⊗ₖ E₂).conjTranspose * (E₁ ⊗ₖ E₂) = 1 := by
  rw [Matrix.conjTranspose_kronecker]
  rw [← Matrix.mul_kronecker_mul]
  rw [h₁, h₂, Matrix.one_kronecker_one]

omit [Fintype coarse₁] [DecidableEq fine₁] [Fintype coarse₂] [DecidableEq fine₂]
  [Fintype coarse₃] [DecidableEq fine₃] in
theorem matrix_kronecker_three_isometry
    (E₁ : Matrix fine₁ coarse₁ ℂ)
    (E₂ : Matrix fine₂ coarse₂ ℂ)
    (E₃ : Matrix fine₃ coarse₃ ℂ)
    (h₁ : E₁.conjTranspose * E₁ = 1)
    (h₂ : E₂.conjTranspose * E₂ = 1)
    (h₃ : E₃.conjTranspose * E₃ = 1) :
    ((E₁ ⊗ₖ E₂) ⊗ₖ E₃).conjTranspose * ((E₁ ⊗ₖ E₂) ⊗ₖ E₃) = 1 := by
  exact matrix_kronecker_isometry (E₁ ⊗ₖ E₂) E₃
    (matrix_kronecker_isometry E₁ E₂ h₁ h₂) h₃

omit [Fintype coarse₁] [Fintype coarse₂] [Fintype coarse₃] in
theorem matrix_unitary_dressed_three_kronecker_isometry
    (U : Matrix ((fine₁ × fine₂) × fine₃) ((fine₁ × fine₂) × fine₃) ℂ)
    (E₁ : Matrix fine₁ coarse₁ ℂ)
    (E₂ : Matrix fine₂ coarse₂ ℂ)
    (E₃ : Matrix fine₃ coarse₃ ℂ)
    (hU : U.conjTranspose * U = 1)
    (h₁ : E₁.conjTranspose * E₁ = 1)
    (h₂ : E₂.conjTranspose * E₂ = 1)
    (h₃ : E₃.conjTranspose * E₃ = 1) :
    (U * ((E₁ ⊗ₖ E₂) ⊗ₖ E₃)).conjTranspose *
        (U * ((E₁ ⊗ₖ E₂) ⊗ₖ E₃)) = 1 := by
  exact matrix_unitary_dressing_isometry U (((E₁ ⊗ₖ E₂) ⊗ₖ E₃)) hU
    (matrix_kronecker_three_isometry E₁ E₂ E₃ h₁ h₂ h₃)

end

end LinearAlgebra
end CFTAnyons
