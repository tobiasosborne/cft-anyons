import Formalisation.LinearAlgebra.Tensor

/-!
# LinearAlgebra.TensorPower — ported from cft-anyons-deprecated

Source: cft-anyons-deprecated/Formalisation/LinearAlgebra/TensorPower.lean
Port: cft-anyons P4.5 (MIGRATION_PLAN.md:188). Body unchanged from source;
this docstring block extended with GLOSSARY cross-references.

Finite matrix tensor-power isometry.

This file proves the fixed-local-map induction case of block tensor
fine-graining: if one finite matrix is an isometry, then every iterated
Kronecker tensor power of that matrix is an isometry.

Cross-references to `GLOSSARY.md`:

-- GLOSSARY: conv:basics
   The dagger `f^\dagger` is the complex-conjugate transpose for matrices;
   realised here as `Matrix.conjTranspose` from Mathlib. The Kronecker
   product `E₁ ⊗ₖ E₂` is Mathlib's `Matrix.kroneckerMap` (notation from
   `open scoped Kronecker`); the iterated Kronecker tensor power
   `E^{⊗ n}` is defined by induction on `n` as
   `matrixTensorPower E 0 := 1` and `matrixTensorPower E (n+1) := E ⊗ₖ
   matrixTensorPower E n`. The carrier index type `TensorIndex α n` is
   the corresponding iterated product type
   (`PUnit` for `n = 0`, `α × TensorIndex α n` for `n + 1`), with
   `Fintype` and `DecidableEq` instances built by recursion on `n`.
   Every theorem in this file states an isometry identity
   `(·)^\dagger * (·) = 1` in terms of `conjTranspose`.

-- GLOSSARY: def:refmap
   A refinement map `E_{P\to P'}` is required to be both an isometry
   (`E^\dagger E = id`) AND cellwise local
   (`E_{P\to P'} = ⊗_{I∈P} E_{I→Ch_{P'}(I)}`) per the canonical
   `def:refmap` statement. The companion file `Tensor.lean` (P4.4)
   proves the Kronecker-product core for two and three explicit
   factors. This file lifts that to an arbitrary number of equal
   factors (the homogeneous tensor power): if a single cellwise
   factor `E` is an isometry, then so is every iterated Kronecker
   power `E^{⊗ n}` (`matrixTensorPower_isometry`). The unitary-dressed
   variant `matrix_unitary_dressed_tensorPower_isometry` combines the
   tensor-power isometry with left-multiplication by a unitary `U`
   (via `matrix_unitary_dressing_isometry` from `Isometry.lean`),
   showing that `U * matrixTensorPower E n` is an isometry. This is
   precisely the homogeneous-factor case of the tensor-product
   structural support that GLOSSARY `def:refmap` Translation map CAD
   section explicitly names — verbatim: "The tensor-product structure
   of the cellwise-local condition is in `LinearAlgebra/Tensor.lean`
   (P4.4), `TensorPower.lean` (P4.5), `HeterogeneousTensor.lean`
   (P4.6)" — supporting infrastructure for
   `LinearAlgebra/FineGraining.lean` at P4.11. The Kronecker product
   `⊗ₖ` is the Mathlib coordinate-level realisation of the categorical
   tensor product `⊗` of `def:fuscat` (after choosing orthonormal
   fusion-tree bases).
-/

namespace CFTAnyons
namespace LinearAlgebra

noncomputable section

open Matrix
open scoped Kronecker

universe u

abbrev TensorIndex (α : Type u) : ℕ → Type u
  | Nat.zero => PUnit.{u + 1}
  | Nat.succ n => α × TensorIndex α n

instance tensorIndexFintype (α : Type u) [Fintype α] :
    (n : ℕ) → Fintype (TensorIndex α n)
  | Nat.zero => by
      dsimp [TensorIndex]
      infer_instance
  | Nat.succ n => by
      dsimp [TensorIndex]
      letI : Fintype (TensorIndex α n) := tensorIndexFintype α n
      infer_instance

instance tensorIndexDecidableEq (α : Type u) [DecidableEq α] :
    (n : ℕ) → DecidableEq (TensorIndex α n)
  | Nat.zero => by
      dsimp [TensorIndex]
      infer_instance
  | Nat.succ n => by
      dsimp [TensorIndex]
      letI : DecidableEq (TensorIndex α n) := tensorIndexDecidableEq α n
      infer_instance

def matrixTensorPower {fine coarse : Type u}
    (E : Matrix fine coarse ℂ) :
    (n : ℕ) → Matrix (TensorIndex fine n) (TensorIndex coarse n) ℂ
  | Nat.zero => 1
  | Nat.succ n => E ⊗ₖ matrixTensorPower E n

variable {fine coarse : Type u}
variable [Fintype fine] [DecidableEq coarse]

theorem matrixTensorPower_isometry
    (E : Matrix fine coarse ℂ)
    (hE : E.conjTranspose * E = 1) :
    ∀ n : ℕ,
      (matrixTensorPower E n).conjTranspose * matrixTensorPower E n = 1
  | Nat.zero => by
      ext i j
      cases i
      cases j
      simp [matrixTensorPower]
  | Nat.succ n => by
      simpa [matrixTensorPower] using
        matrix_kronecker_isometry E (matrixTensorPower E n) hE
          (matrixTensorPower_isometry E hE n)

theorem matrix_unitary_dressed_tensorPower_isometry
    [DecidableEq fine] [Fintype coarse]
    (E : Matrix fine coarse ℂ)
    (hE : E.conjTranspose * E = 1)
    (n : ℕ)
    (U : Matrix (TensorIndex fine n) (TensorIndex fine n) ℂ)
    (hU : U.conjTranspose * U = 1) :
    (U * matrixTensorPower E n).conjTranspose *
      (U * matrixTensorPower E n) = 1 := by
  exact matrix_unitary_dressing_isometry U (matrixTensorPower E n) hU
    (matrixTensorPower_isometry E hE n)

end

end LinearAlgebra
end CFTAnyons
