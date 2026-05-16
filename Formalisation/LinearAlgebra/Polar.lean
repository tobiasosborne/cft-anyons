import Mathlib

/-!
# LinearAlgebra.Polar — ported from cft-anyons-deprecated

Source: cft-anyons-deprecated/Formalisation/LinearAlgebra/Polar.lean
Port: cft-anyons P4.3 (MIGRATION_PLAN.md:188). Body unchanged from source;
this docstring block extended with GLOSSARY cross-references.

Finite matrix polar-section algebra.

This file formalises the algebraic core of the finite-dimensional polar
fine-graining formula. It assumes the inverse-square-root condition as an input
matrix equation; it does not prove existence of positive square roots.

Cross-references to `GLOSSARY.md`:

-- GLOSSARY: def:polar-repair
   The polar-repair construction `I_N := J_N G_N^{-1/2}` (with
   `G_N := J_N^\dagger J_N`) satisfies `I_N^\dagger I_N = id` by the polar-
   decomposition argument of `thm:polar`. This file is the canonical CAD
   anchor for `def:polar-repair` (per `GLOSSARY.md:1786`): the matrix
   algebra is complete here, but **existence of the positive square root
   is NOT proved (this is a Mathlib gap at time of writing); the inverse-
   square-root matrix `B^{-1/2}` is assumed given as input** to the polar-
   section theorems (`R` in `matrix_polar_section_isometry`; supplied
   concretely by `diagonalInvSqrt g` in `matrix_polar_diagonal_section_isometry`
   under the diagonal-Gram hypothesis `hG`, with the inverse-square-root
   identity `diagonalInvSqrt_inverse_condition` discharged by the real-
   scalar lemma `real_inv_sqrt_mul_self_mul_inv_sqrt`). The general
   inverse-square-root existence (taking a positive Hermitian `B B^\dagger`
   to its inverse positive square root) is the unproved step. Cross-
   reference: `stocktake/reports/cad-lean.md` §2.4 line 190 and §4 lines
   327–328. The specific `def:Jinterp` polar repair is NOT in CAD scope
   (def:Jinterp itself isn't formalised; see `GLOSSARY.md:1786`).

-- GLOSSARY: conv:basics
   The dagger `f^\dagger` is the complex-conjugate transpose for matrices;
   realised here as `Matrix.conjTranspose` from Mathlib. Every theorem
   in this file states an identity in terms of `conjTranspose`. In
   particular, the polar-section isometry hypothesis
   `(B B^\dagger) R = R^{-\dagger}` is written as
   `R.conjTranspose * ((B * B.conjTranspose) * R) = 1`, and the conclusion
   `(B^\dagger R)^\dagger (B^\dagger R) = id` is
   `(B.conjTranspose * R).conjTranspose * (B.conjTranspose * R) = 1`.
   The self-adjointness of the diagonal inverse-square-root,
   `diagonalInvSqrt_conjTranspose`, is the matrix-level statement that
   the inverse-square-root of a positive-real-diagonal matrix is itself
   real-diagonal (hence `conjTranspose`-fixed).
-/

namespace CFTAnyons
namespace LinearAlgebra

noncomputable section

open Matrix BigOperators

variable {coarse fine : Type*}
variable [Fintype coarse] [DecidableEq coarse]
variable [Fintype fine] [DecidableEq fine]

def diagonalInvSqrt (g : coarse → ℝ) : Matrix coarse coarse ℂ :=
  Matrix.diagonal fun μ => (((Real.sqrt (g μ))⁻¹ : ℝ) : ℂ)

omit [Fintype coarse] in
theorem diagonalInvSqrt_conjTranspose (g : coarse → ℝ) :
    (diagonalInvSqrt g).conjTranspose = diagonalInvSqrt g := by
  ext μ μ'
  by_cases h : μ = μ'
  · subst μ'
    simp [diagonalInvSqrt]
  · have h' : μ' ≠ μ := by
      intro hμ'
      exact h hμ'.symm
    simp [diagonalInvSqrt, h, h']

theorem real_inv_sqrt_mul_self_mul_inv_sqrt {x : ℝ} (hx : 0 < x) :
    (Real.sqrt x)⁻¹ * (x * (Real.sqrt x)⁻¹) = 1 := by
  have hsqrt_ne : Real.sqrt x ≠ 0 := Real.sqrt_ne_zero'.mpr hx
  have hsqrt_sq : Real.sqrt x * Real.sqrt x = x := by
    simpa [pow_two] using (Real.sq_sqrt (le_of_lt hx) : (Real.sqrt x) ^ 2 = x)
  calc
    (Real.sqrt x)⁻¹ * (x * (Real.sqrt x)⁻¹) =
        (Real.sqrt x)⁻¹ * ((Real.sqrt x * Real.sqrt x) * (Real.sqrt x)⁻¹) := by
          rw [hsqrt_sq]
    _ = 1 := by
          field_simp [hsqrt_ne]

omit [DecidableEq fine] in
theorem diagonalInvSqrt_inverse_condition
    (B : Matrix coarse fine ℂ) (g : coarse → ℝ)
    (hg : ∀ μ, 0 < g μ)
    (hG : B * B.conjTranspose = Matrix.diagonal fun μ => ((g μ : ℝ) : ℂ)) :
    (diagonalInvSqrt g).conjTranspose *
        ((B * B.conjTranspose) * diagonalInvSqrt g) = 1 := by
  rw [hG, diagonalInvSqrt_conjTranspose]
  ext μ μ'
  by_cases h : μ = μ'
  · subst μ'
    simp [diagonalInvSqrt, Matrix.diagonal_mul_diagonal]
    exact_mod_cast real_inv_sqrt_mul_self_mul_inv_sqrt (hg μ)
  · simp [diagonalInvSqrt, Matrix.diagonal_mul_diagonal, h]

omit [DecidableEq fine] in
theorem matrix_polar_section_isometry
    (B : Matrix coarse fine ℂ) (R : Matrix coarse coarse ℂ)
    (hR : R.conjTranspose * ((B * B.conjTranspose) * R) = 1) :
    (B.conjTranspose * R).conjTranspose * (B.conjTranspose * R) = 1 := by
  rw [Matrix.conjTranspose_mul, Matrix.conjTranspose_conjTranspose]
  calc
    R.conjTranspose * B * (B.conjTranspose * R)
        = R.conjTranspose * ((B * B.conjTranspose) * R) := by
          simp only [Matrix.mul_assoc]
    _ = 1 := hR

omit [DecidableEq fine] in
theorem matrix_polar_diagonal_section_isometry
    (B : Matrix coarse fine ℂ) (g : coarse → ℝ)
    (hg : ∀ μ, 0 < g μ)
    (hG : B * B.conjTranspose = Matrix.diagonal fun μ => ((g μ : ℝ) : ℂ)) :
    (B.conjTranspose * diagonalInvSqrt g).conjTranspose *
        (B.conjTranspose * diagonalInvSqrt g) = 1 :=
  matrix_polar_section_isometry B (diagonalInvSqrt g)
    (diagonalInvSqrt_inverse_condition B g hg hG)

omit [DecidableEq coarse] [Fintype fine] [DecidableEq fine] in
theorem matrix_polar_entry_formula
    (B : Matrix coarse fine ℂ) (R : Matrix coarse coarse ℂ)
    (ν : fine) (μ : coarse) :
    (B.conjTranspose * R) ν μ =
      ∑ μ' : coarse, star (B μ' ν) * R μ' μ := by
  simp [Matrix.mul_apply, Matrix.conjTranspose_apply]

end

end LinearAlgebra
end CFTAnyons
