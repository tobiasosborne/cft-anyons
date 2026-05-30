import Formalisation.LinearAlgebra.Tensor

/-!
# LinearAlgebra.HeterogeneousTensor — ported from cft-anyons-deprecated

Source: cft-anyons-deprecated/Formalisation/LinearAlgebra/HeterogeneousTensor.lean
Port: cft-anyons P4.6 (MIGRATION_PLAN.md:189). Body unchanged from source;
this docstring block extended with GLOSSARY cross-references.

Finite heterogeneous matrix tensor-product isometry.

This file proves the finite-coordinate arbitrary-N version of the block tensor
isometry theorem.  The factors may have different fine and coarse index types.
The recursive tensor index records an ordered list of finite coordinate bases.

Cross-references to `GLOSSARY.md`:

-- GLOSSARY: conv:basics
   The dagger `f^\dagger` is the complex-conjugate transpose for matrices;
   realised here as `Matrix.conjTranspose` from Mathlib. The Kronecker
   product `E₁ ⊗ₖ E₂` is Mathlib's `Matrix.kroneckerMap` (notation from
   `open scoped Kronecker`); the iterated heterogeneous Kronecker tensor
   product `⊗ᵢ Eᵢ` is defined by induction on `n` as
   `matrixHeterogeneousTensor 0 _ _ _ := 1` and
   `matrixHeterogeneousTensor (n+1) fine coarse E := E 0 ⊗ₖ
   matrixHeterogeneousTensor n (fine ∘ Fin.succ) (coarse ∘ Fin.succ)
   (E ∘ Fin.succ)`. The carrier index type `HeterogeneousTensorIndex n α`
   is the corresponding iterated dependent product type
   (`PUnit` for `n = 0`, `α 0 × HeterogeneousTensorIndex n (α ∘ Fin.succ)`
   for `n + 1`), with `Fintype` and `DecidableEq` instances built by
   recursion on `n` via `letI`. Every theorem in this file states an
   isometry identity `(·)^\dagger * (·) = 1` in terms of `conjTranspose`.

-- GLOSSARY: def:refmap
   A refinement map `E_{P\to P'}` is required to be both an isometry
   (`E^\dagger E = id`) AND cellwise local
   (`E_{P\to P'} = ⊗_{I∈P} E_{I→Ch_{P'}(I)}`) per the canonical
   `def:refmap` statement. The companion file `Tensor.lean` (P4.4)
   proves the Kronecker-product core for two and three explicit
   factors; `TensorPower.lean` (P4.5) lifts that to an arbitrary
   number of EQUAL factors (the homogeneous tensor power). This file
   completes the trio by lifting the Kronecker-product cellwise-local
   isometry to an arbitrary number of POTENTIALLY DIFFERENT factors
   (the heterogeneous tensor product): if each cellwise factor `Eᵢ`
   is an isometry, then so is the heterogeneous Kronecker product
   `⊗ᵢ Eᵢ` (`matrixHeterogeneousTensor_isometry`). The unitary-dressed
   variant `matrix_unitary_dressed_heterogeneousTensor_isometry`
   combines the heterogeneous-tensor isometry with left-multiplication
   by a unitary `U` (via `matrix_unitary_dressing_isometry` from
   `Isometry.lean`, pulled transitively through `Tensor.lean`'s
   import chain), showing that `U * matrixHeterogeneousTensor n fine
   coarse E` is an isometry. This is precisely the heterogeneous-factor
   case of the tensor-product structural support that GLOSSARY
   `def:refmap` Translation map CAD section explicitly names —
   verbatim: "The tensor-product structure of the cellwise-local
   condition is in `LinearAlgebra/Tensor.lean` (P4.4),
   `TensorPower.lean` (P4.5), `HeterogeneousTensor.lean` (P4.6)" —
   supporting infrastructure for `LinearAlgebra/FineGraining.lean` at
   P4.11. The Kronecker product `⊗ₖ` is the Mathlib coordinate-level
   realisation of the categorical tensor product `⊗` of `def:fuscat`
   (after choosing orthonormal fusion-tree bases). The heterogeneity
   here corresponds to the GENERIC partition-refinement step where
   different cells `I ∈ P` are refined to differently-sized child
   collections `Ch_{P'}(I)` with potentially different fine/coarse
   index cardinalities.
-/

namespace CFTAnyons
namespace LinearAlgebra

noncomputable section

open Matrix
open scoped Kronecker

universe u

abbrev HeterogeneousTensorIndex :
    (n : ℕ) → (Fin n → Type u) → Type u
  | Nat.zero, _ => PUnit.{u + 1}
  | Nat.succ n, α => α 0 × HeterogeneousTensorIndex n (fun i => α i.succ)

@[reducible] def heterogeneousTensorIndexFintype :
    (n : ℕ) → (α : Fin n → Type u) → [∀ i, Fintype (α i)] →
      Fintype (HeterogeneousTensorIndex n α)
  | Nat.zero, _, _ => by
      dsimp [HeterogeneousTensorIndex]
      infer_instance
  | Nat.succ n, α, hα => by
      dsimp [HeterogeneousTensorIndex]
      letI : Fintype (α 0) := hα 0
      letI : ∀ i : Fin n, Fintype (α i.succ) := fun i => hα i.succ
      letI : Fintype (HeterogeneousTensorIndex n (fun i => α i.succ)) :=
        heterogeneousTensorIndexFintype n (fun i => α i.succ)
      infer_instance

@[reducible] instance (n : ℕ) (α : Fin n → Type u) [∀ i, Fintype (α i)] :
    Fintype (HeterogeneousTensorIndex n α) :=
  heterogeneousTensorIndexFintype n α

@[reducible] def heterogeneousTensorIndexDecidableEq :
    (n : ℕ) → (α : Fin n → Type u) → [∀ i, DecidableEq (α i)] →
      DecidableEq (HeterogeneousTensorIndex n α)
  | Nat.zero, _, _ => by
      dsimp [HeterogeneousTensorIndex]
      infer_instance
  | Nat.succ n, α, hα => by
      dsimp [HeterogeneousTensorIndex]
      letI : DecidableEq (α 0) := hα 0
      letI : ∀ i : Fin n, DecidableEq (α i.succ) := fun i => hα i.succ
      letI : DecidableEq (HeterogeneousTensorIndex n (fun i => α i.succ)) :=
        heterogeneousTensorIndexDecidableEq n (fun i => α i.succ)
      infer_instance

@[reducible] instance (n : ℕ) (α : Fin n → Type u) [∀ i, DecidableEq (α i)] :
    DecidableEq (HeterogeneousTensorIndex n α) :=
  heterogeneousTensorIndexDecidableEq n α

def matrixHeterogeneousTensor :
    (n : ℕ) →
      (fine coarse : Fin n → Type u) →
      (∀ i, Matrix (fine i) (coarse i) ℂ) →
      Matrix (HeterogeneousTensorIndex n fine)
        (HeterogeneousTensorIndex n coarse) ℂ
  | Nat.zero, _, _, _ => 1
  | Nat.succ n, fine, coarse, E =>
      E 0 ⊗ₖ matrixHeterogeneousTensor n
        (fun i => fine i.succ) (fun i => coarse i.succ) (fun i => E i.succ)

theorem matrixHeterogeneousTensor_isometry
    (n : ℕ)
    {fine coarse : Fin n → Type u}
    [∀ i, Fintype (fine i)] [∀ i, DecidableEq (coarse i)]
    (E : ∀ i, Matrix (fine i) (coarse i) ℂ)
    (hE : ∀ i, (E i).conjTranspose * E i = 1) :
    (matrixHeterogeneousTensor n fine coarse E).conjTranspose *
        matrixHeterogeneousTensor n fine coarse E = 1 := by
  induction n with
  | zero =>
      ext i j
      cases i
      cases j
      simp [matrixHeterogeneousTensor]
  | succ n ih =>
      let tailFine : Fin n → Type u := fun i => fine i.succ
      let tailCoarse : Fin n → Type u := fun i => coarse i.succ
      let tailE : ∀ i, Matrix (tailFine i) (tailCoarse i) ℂ := fun i => E i.succ
      letI : ∀ i : Fin n, Fintype (tailFine i) :=
        fun i => inferInstanceAs (Fintype (fine i.succ))
      letI : ∀ i : Fin n, DecidableEq (tailCoarse i) :=
        fun i => inferInstanceAs (DecidableEq (coarse i.succ))
      have hTail : ∀ i, (tailE i).conjTranspose * tailE i = 1 := fun i => by
        change (E i.succ).conjTranspose * E i.succ = 1
        exact hE i.succ
      have hTailIso :
          (matrixHeterogeneousTensor n tailFine tailCoarse tailE).conjTranspose *
              matrixHeterogeneousTensor n tailFine tailCoarse tailE = 1 :=
        ih (fine := tailFine) (coarse := tailCoarse) tailE hTail
      change
        (E 0 ⊗ₖ matrixHeterogeneousTensor n tailFine tailCoarse tailE).conjTranspose *
          (E 0 ⊗ₖ matrixHeterogeneousTensor n tailFine tailCoarse tailE) = 1
      exact matrix_kronecker_isometry (E 0)
        (matrixHeterogeneousTensor n tailFine tailCoarse tailE) (hE 0) hTailIso

theorem matrix_unitary_dressed_heterogeneousTensor_isometry
    (n : ℕ)
    {fine coarse : Fin n → Type u}
    [∀ i, Fintype (fine i)] [∀ i, DecidableEq (fine i)]
    [∀ i, DecidableEq (coarse i)]
    (E : ∀ i, Matrix (fine i) (coarse i) ℂ)
    (hE : ∀ i, (E i).conjTranspose * E i = 1)
    (U : Matrix (HeterogeneousTensorIndex n fine)
        (HeterogeneousTensorIndex n fine) ℂ)
    (hU : U.conjTranspose * U = 1) :
    (U * matrixHeterogeneousTensor n fine coarse E).conjTranspose *
        (U * matrixHeterogeneousTensor n fine coarse E) = 1 := by
  exact matrix_unitary_dressing_isometry U
    (matrixHeterogeneousTensor n fine coarse E) hU
    (matrixHeterogeneousTensor_isometry n E hE)

end

end LinearAlgebra
end CFTAnyons
