import Mathlib

/-!
# LinearAlgebra.NoMixing — ported from cft-anyons-deprecated

Source: cft-anyons-deprecated/Formalisation/LinearAlgebra/NoMixing.lean
Port: cft-anyons P4.10 (MIGRATION_PLAN.md:195). Body unchanged from source;
this docstring block extended with GLOSSARY cross-references.

Scalar no-mixing polar normalisation.

This is the finite-dimensional algebra behind the handoff no-mixing corollary:
for a single retained coarse label, the canonical section has amplitudes
`conj(beta_nu) / sqrt(sum_nu |beta_nu|^2)`.

Cross-references to `GLOSSARY.md`:

-- GLOSSARY: conv:basics
   Vector spaces are complex (`ℂ`); the dagger `f^\dagger` is the
   complex-conjugate transpose for matrices. Realised throughout this file
   as `Matrix.conjTranspose` (the `(·)^†` of `Matrix.mul_apply` /
   `Matrix.conjTranspose_apply`) together with `star` and
   `Complex.normSq` on scalars. All declarations work over `ℂ` indexed
   by a finite (`Fintype`) type `ι` of "fine" labels and the singleton
   `PUnit` for the single retained "coarse" label. The Hermitian inner
   product `∑ i, star (NoMixingAmplitude β i) * NoMixingAmplitude β i = 1`
   in `noMixingAmplitude_normalised` is the entry-wise statement that the
   coarse-to-fine isometry column is normalised in the `ℂ`-valued
   Hermitian form realising `conv:basics`'s dagger.

-- GLOSSARY: def:RG-amp
   The OPE/RG amplitude ansatz `β^a_{b₁⋯b_r}(ρ) ∼ Γ^a_{b₁⋯b_r}
   ρ^{h_a - ∑ h_{b_i}}` per `summary.tex:1875`. This file provides the
   abstract finite-dimensional "no-mixing scalar formula" companion to the
   polar-decomposition canonical-section framework of
   `LinearAlgebra/Polar.lean` (P4.3): for a single retained coarse label
   (the `PUnit` codomain) and a fine vector of OPE amplitudes
   `β : ι → ℂ`, the canonical section of the polar decomposition reduces
   to the closed-form scalar amplitudes
   `NoMixingAmplitude β i = star (β i) / √(∑ ν, |β_ν|²)`
   (`NoMixingAmplitude`, with denominator `NoMixingDenominator β =
   ∑ i, Complex.normSq (β i)` and its non-negativity
   `NoMixingDenominator_nonneg`). The unit-norm condition for this
   amplitude family, `∑ i, star (NoMixingAmplitude β i) *
   NoMixingAmplitude β i = 1` (`noMixingAmplitude_normalised`), is
   precisely the scalar no-mixing normalisation underlying the handoff
   no-mixing corollary. The matrix-level reconstruction is provided by
   `NoMixingBlockingMatrix β : Matrix PUnit ι ℂ` (the row vector `β`,
   playing the role of the blocking map) and `NoMixingPolarR β :
   Matrix PUnit PUnit ℂ` (the `1×1` `(R)`-block equal to
   `1 / √(∑ ν, |β_ν|²)` from the polar decomposition); together they
   yield the matrix entry identity
   `((NoMixingBlockingMatrix β).conjTranspose * NoMixingPolarR β) i unit
    = NoMixingAmplitude β i` (`noMixingPolarSection_entry`) and the
   isometry equation
   `((NoMixingBlockingMatrix β)^† * NoMixingPolarR β)^† *
    ((NoMixingBlockingMatrix β)^† * NoMixingPolarR β) = 1`
   (`noMixingPolarSection_isometry`, conditional on
   `NoMixingDenominator β ≠ 0`). This is precisely the GLOSSARY
   pre-registered binding "general no-mixing scalar formula in
   `LinearAlgebra/NoMixing.lean` (P4.10)" — verbatim — for
   `def:RG-amp` (`GLOSSARY.md:1619`), paired with the abstract
   polar-decomposition canonical-section framework in
   `LinearAlgebra/Polar.lean` (P4.3) and the Fibonacci-specific
   RG-decorated amplitude formulas slated for `Fibonacci/RGNoMixing.lean`
   at Phase 5 P5.14.
-/

namespace CFTAnyons
namespace LinearAlgebra

noncomputable section

open BigOperators
open Matrix
open scoped ComplexConjugate

def NoMixingDenominator {ι : Type*} [Fintype ι] (β : ι → ℂ) : ℝ :=
  ∑ i, Complex.normSq (β i)

def NoMixingAmplitude {ι : Type*} [Fintype ι] (β : ι → ℂ) : ι → ℂ :=
  let S := NoMixingDenominator β
  fun i => star (β i) / (Real.sqrt S : ℂ)

theorem NoMixingDenominator_nonneg {ι : Type*} [Fintype ι] (β : ι → ℂ) :
    0 ≤ NoMixingDenominator β := by
  unfold NoMixingDenominator
  exact Finset.sum_nonneg fun i _ => Complex.normSq_nonneg (β i)

theorem noMixingAmplitude_normalised {ι : Type*} [Fintype ι]
    (β : ι → ℂ) (hβ : NoMixingDenominator β ≠ 0) :
    ∑ i, star (NoMixingAmplitude β i) * NoMixingAmplitude β i = 1 := by
  unfold NoMixingAmplitude
  let S : ℝ := NoMixingDenominator β
  have hS' : S ≠ 0 := hβ
  have hSpos : 0 < S := by
    have hnonneg : 0 ≤ S := by
      dsimp [S]
      exact NoMixingDenominator_nonneg β
    exact lt_of_le_of_ne hnonneg (Ne.symm hS')
  have hsqrt_sq_real : Real.sqrt S * Real.sqrt S = S := by
    simpa [pow_two] using Real.sq_sqrt (le_of_lt hSpos)
  have hsqrt_sq_complex :
      (Real.sqrt S : ℂ) * (Real.sqrt S : ℂ) = (S : ℂ) := by
    exact_mod_cast hsqrt_sq_real
  have hsum_complex : (∑ i, star (β i) * β i) = (S : ℂ) := by
    dsimp [S, NoMixingDenominator]
    rw [Complex.ofReal_sum]
    apply Finset.sum_congr rfl
    intro i hi
    exact (Complex.normSq_eq_conj_mul_self (z := β i)).symm
  calc
    ∑ i, star (star (β i) / (Real.sqrt S : ℂ)) *
        (star (β i) / (Real.sqrt S : ℂ))
        = ∑ i, (star (β i) * β i) /
            ((Real.sqrt S : ℂ) * (Real.sqrt S : ℂ)) := by
          apply Finset.sum_congr rfl
          intro i hi
          simp [div_eq_mul_inv, mul_comm, mul_left_comm, mul_assoc]
    _ = (∑ i, star (β i) * β i) /
        ((Real.sqrt S : ℂ) * (Real.sqrt S : ℂ)) := by
          rw [Finset.sum_div]
    _ = (S : ℂ) / (S : ℂ) := by
          rw [hsum_complex, hsqrt_sq_complex]
    _ = 1 := by
          exact div_self (by exact_mod_cast hS')

def NoMixingBlockingMatrix {ι : Type*} [Fintype ι] (β : ι → ℂ) :
    Matrix PUnit ι ℂ :=
  fun _ i => β i

def NoMixingPolarR {ι : Type*} [Fintype ι] (β : ι → ℂ) :
    Matrix PUnit PUnit ℂ :=
  fun _ _ => ((1 : ℝ) / Real.sqrt (NoMixingDenominator β) : ℂ)

theorem noMixingPolarSection_entry {ι : Type*} [Fintype ι]
    (β : ι → ℂ) (i : ι) :
    ((NoMixingBlockingMatrix β).conjTranspose * NoMixingPolarR β) i PUnit.unit =
      NoMixingAmplitude β i := by
  simp [Matrix.mul_apply, NoMixingBlockingMatrix, NoMixingPolarR,
    NoMixingAmplitude, div_eq_mul_inv]

theorem noMixingPolarSection_isometry {ι : Type*} [Fintype ι]
    (β : ι → ℂ) (hβ : NoMixingDenominator β ≠ 0) :
    ((NoMixingBlockingMatrix β).conjTranspose * NoMixingPolarR β).conjTranspose *
      ((NoMixingBlockingMatrix β).conjTranspose * NoMixingPolarR β) = 1 := by
  let E : Matrix ι PUnit ℂ :=
    (NoMixingBlockingMatrix β).conjTranspose * NoMixingPolarR β
  have hE : E = fun i _ => NoMixingAmplitude β i := by
    ext i u
    fin_cases u
    exact noMixingPolarSection_entry β i
  change E.conjTranspose * E = 1
  rw [hE]
  ext a b
  fin_cases a
  fin_cases b
  simpa [Matrix.mul_apply] using noMixingAmplitude_normalised β hβ

end

end LinearAlgebra
end CFTAnyons
