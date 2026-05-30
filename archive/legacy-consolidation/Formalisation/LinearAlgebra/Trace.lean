import Mathlib

/-!
# LinearAlgebra.Trace — ported from cft-anyons-deprecated

Source: cft-anyons-deprecated/Formalisation/LinearAlgebra/Trace.lean
Port: cft-anyons P4.7 (MIGRATION_PLAN.md:192). Body unchanged from source;
this docstring block extended with GLOSSARY cross-references.

Trace and square-form identities for finite-dimensional ascending channels.

These are purely matrix-level results. They formalise the finite-dimensional
part of expectation preservation for the embedding `rho ↦ E rho E†` and the
observable map `O ↦ E† O E`, after choosing orthonormal bases.

Cross-references to `GLOSSARY.md`:

-- GLOSSARY: conv:basics
   The dagger `f^\dagger` is the complex-conjugate transpose for matrices;
   realised throughout this file as `Matrix.conjTranspose` from Mathlib.
   The Kronecker product `E₁ ⊗ₖ E₂` is Mathlib's `Matrix.kroneckerMap`
   (notation from `open scoped Kronecker`), used in the auxiliary-amplified
   theorems `matrix_amplified_ascending_preserves_posSemidef` and
   `matrix_amplified_finite_kraus_sum_preserves_posSemidef`. Vector spaces
   are complex (`ℂ`); all trace identities use Mathlib's `Matrix.trace`
   and rely on the standard cyclic/multiplicative-commutativity lemmas
   `Matrix.trace_mul_cycle`, `Matrix.trace_mul_comm`, and `Matrix.trace_sum`.
   The `IsGramFormPositive` predicate captures `O = X^\dagger * X` as the
   matrix-level Gram-form realisation of positivity used downstream.

-- GLOSSARY: def:ascending
   The ascending observable channel is `\mathcal{A}_{P'\to P}(O) :=
   E_{P\to P'}^{\dagger} O E_{P\to P'}` (`summary.tex:449`). This file
   formalises the channel-property infrastructure that GLOSSARY
   `def:ascending` Translation map CAD section at `GLOSSARY.md:840`
   explicitly names as the canonical CAD anchor for the P4.7 step —
   verbatim: "the ascending-channel construction `A(O) = E† O E` is
   the channel-property infrastructure in `LinearAlgebra/Trace.lean`
   (Phase 4 P4.7) and `LinearAlgebra/FineGraining.lean` (P4.11) —
   completely positive, unital, *-preserving". Concretely:
   `matrix_state_embedding_trace_preserving` proves that the dual
   state embedding `rho ↦ E rho E^\dagger` is trace-preserving when
   `E^\dagger E = 1` (the `def:refmap` isometry condition);
   `matrix_expectation_preserving` proves the corresponding duality
   `tr((E rho E^\dagger) O) = tr(rho (E^\dagger O E))` between the
   dual state map and the ascending channel itself;
   `matrix_ascending_preserves_gram_form_positive` and
   `matrix_ascending_preserves_posSemidef` prove that the ascending
   channel preserves Gram-form positivity and positive-semidefiniteness
   respectively (i.e. it is positivity-preserving, hence *-preserving;
   combined with the `aux`-amplified variant
   `matrix_amplified_ascending_preserves_posSemidef` this is the
   complete-positivity statement at the matrix-coordinate level).
   The finite-Kraus generalisations
   (`matrix_kraus_square`, `matrix_kraus_gram`,
   `matrix_finite_kraus_sum_preserves_posSemidef`,
   `matrix_amplified_finite_kraus_sum_preserves_posSemidef`,
   `matrix_finite_kraus_sum_unital`,
   `matrix_finite_kraus_sum_star_preserving`,
   `matrix_finite_kraus_state_trace_preserving`,
   `matrix_finite_kraus_expectation_preserving`) lift the same
   channel-property package to a finite-sum Kraus representation
   `\sum_i K_i^\dagger O K_i` (the second of the two GLOSSARY-listed
   ascending-channel aliases: "Kraus ascending channel" at
   `GLOSSARY.md:830-831`). Unitality, *-preservation, trace-preservation,
   and the expectation duality are all proved at the Kraus-sum level,
   subject to `\sum_i K_i^\dagger K_i = 1`. This file does NOT formalise
   the categorical "charge-only" specialisation
   (`summary.tex warn:charge-only`), which is the separate
   `LinearAlgebra/ChargeOnly.lean` (P4.14) + `DiagonalScaling.lean`
   (P4.13) infrastructure per `def:ascending` Translation map.
-/

namespace CFTAnyons
namespace LinearAlgebra

noncomputable section

open Matrix
open scoped ComplexOrder
open scoped Kronecker

variable {coarse fine : Type*}
variable [Fintype coarse] [DecidableEq coarse]
variable [Fintype fine] [DecidableEq fine]
variable {aux : Type*} [Fintype aux] [DecidableEq aux]

def IsGramFormPositive {witness idx : Type*} [Fintype witness]
    [DecidableEq witness] [Fintype idx] [DecidableEq idx]
    (O : Matrix idx idx ℂ) : Prop :=
  ∃ X : Matrix witness idx ℂ, O = X.conjTranspose * X

omit [DecidableEq fine] in
theorem matrix_state_embedding_trace_preserving
    (E : Matrix fine coarse ℂ)
    (hE : E.conjTranspose * E = 1)
    (rho : Matrix coarse coarse ℂ) :
    Matrix.trace ((E * rho) * E.conjTranspose) = Matrix.trace rho := by
  calc
    Matrix.trace ((E * rho) * E.conjTranspose)
        = Matrix.trace (E.conjTranspose * E * rho) := by
          rw [Matrix.trace_mul_cycle]
    _ = Matrix.trace ((1 : Matrix coarse coarse ℂ) * rho) := by rw [hE]
    _ = Matrix.trace rho := by rw [Matrix.one_mul]

omit [DecidableEq coarse] [DecidableEq fine] in
theorem matrix_expectation_preserving
    (E : Matrix fine coarse ℂ)
    (rho : Matrix coarse coarse ℂ)
    (O : Matrix fine fine ℂ) :
    Matrix.trace ((((E * rho) * E.conjTranspose) * O)) =
      Matrix.trace (rho * (E.conjTranspose * (O * E))) := by
  calc
    Matrix.trace ((((E * rho) * E.conjTranspose) * O))
        = Matrix.trace (E * rho * (E.conjTranspose * O)) := by
          rw [Matrix.mul_assoc, Matrix.mul_assoc]
    _ = Matrix.trace ((E.conjTranspose * O) * E * rho) := by
          rw [Matrix.trace_mul_cycle]
    _ = Matrix.trace (rho * ((E.conjTranspose * O) * E)) := by
          rw [Matrix.trace_mul_comm]
    _ = Matrix.trace (rho * (E.conjTranspose * (O * E))) := by
          rw [Matrix.mul_assoc]

omit [Fintype coarse] [DecidableEq coarse] [DecidableEq fine] in
theorem matrix_kraus_square
    (K : Matrix fine coarse ℂ)
    (X : Matrix fine fine ℂ) :
    K.conjTranspose * ((X.conjTranspose * X) * K) =
      (X * K).conjTranspose * (X * K) := by
  rw [Matrix.conjTranspose_mul]
  rw [Matrix.mul_assoc, Matrix.mul_assoc]

omit [Fintype coarse] [DecidableEq coarse] [DecidableEq fine] in
theorem matrix_kraus_gram
    {witness : Type*} [Fintype witness] [DecidableEq witness]
    (K : Matrix fine coarse ℂ)
    (X : Matrix witness fine ℂ) :
    K.conjTranspose * ((X.conjTranspose * X) * K) =
      (X * K).conjTranspose * (X * K) := by
  rw [Matrix.conjTranspose_mul]
  rw [Matrix.mul_assoc, Matrix.mul_assoc]

theorem matrix_ascending_preserves_gram_form_positive
    {witness : Type*} [Fintype witness] [DecidableEq witness]
    (E : Matrix fine coarse ℂ)
    (O : Matrix fine fine ℂ)
    (hO : IsGramFormPositive (witness := witness) O) :
    IsGramFormPositive (witness := witness) (E.conjTranspose * (O * E)) := by
  rcases hO with ⟨X, rfl⟩
  refine ⟨X * E, ?_⟩
  rw [Matrix.conjTranspose_mul]
  rw [Matrix.mul_assoc, Matrix.mul_assoc]

omit [DecidableEq coarse] [DecidableEq fine] in
theorem matrix_ascending_preserves_posSemidef
    (E : Matrix fine coarse ℂ)
    (O : Matrix fine fine ℂ)
    (hO : O.PosSemidef) :
    (E.conjTranspose * (O * E)).PosSemidef := by
  simpa [Matrix.mul_assoc] using hO.conjTranspose_mul_mul_same E

omit [DecidableEq coarse] [DecidableEq fine] in
theorem matrix_amplified_ascending_preserves_posSemidef
    (E : Matrix fine coarse ℂ)
    (O : Matrix (aux × fine) (aux × fine) ℂ)
    (hO : O.PosSemidef) :
    (((1 : Matrix aux aux ℂ) ⊗ₖ E).conjTranspose *
      (O * ((1 : Matrix aux aux ℂ) ⊗ₖ E))).PosSemidef := by
  exact matrix_ascending_preserves_posSemidef ((1 : Matrix aux aux ℂ) ⊗ₖ E) O hO

omit [DecidableEq coarse] [DecidableEq fine] in
theorem matrix_finite_kraus_sum_preserves_posSemidef
    {kraus : Type*} [Fintype kraus]
    (K : kraus → Matrix fine coarse ℂ)
    (O : Matrix fine fine ℂ)
    (hO : O.PosSemidef) :
    (∑ i, (K i).conjTranspose * (O * K i)).PosSemidef := by
  classical
  simpa using posSemidef_sum (Finset.univ : Finset kraus) (x := fun i =>
    (K i).conjTranspose * (O * K i)) (fun i _ =>
      matrix_ascending_preserves_posSemidef (K i) O hO)

omit [DecidableEq coarse] [DecidableEq fine] in
theorem matrix_amplified_finite_kraus_sum_preserves_posSemidef
    {kraus : Type*} [Fintype kraus]
    (K : kraus → Matrix fine coarse ℂ)
    (O : Matrix (aux × fine) (aux × fine) ℂ)
    (hO : O.PosSemidef) :
    (∑ i, (((1 : Matrix aux aux ℂ) ⊗ₖ K i).conjTranspose *
      (O * ((1 : Matrix aux aux ℂ) ⊗ₖ K i)))).PosSemidef := by
  classical
  simpa using posSemidef_sum (Finset.univ : Finset kraus) (x := fun i =>
    (((1 : Matrix aux aux ℂ) ⊗ₖ K i).conjTranspose *
      (O * ((1 : Matrix aux aux ℂ) ⊗ₖ K i)))) (fun i _ =>
        matrix_amplified_ascending_preserves_posSemidef (K i) O hO)

omit [Fintype coarse] in
theorem matrix_finite_kraus_sum_unital
    {kraus : Type*} [Fintype kraus]
    (K : kraus → Matrix fine coarse ℂ)
    (hK : ∑ i, (K i).conjTranspose * K i = 1) :
    ∑ i, (K i).conjTranspose * ((1 : Matrix fine fine ℂ) * K i) = 1 := by
  simpa [Matrix.one_mul] using hK

omit [Fintype coarse] [DecidableEq coarse] [DecidableEq fine] in
theorem matrix_finite_kraus_sum_star_preserving
    {kraus : Type*} [Fintype kraus]
    (K : kraus → Matrix fine coarse ℂ)
    (O : Matrix fine fine ℂ) :
    ∑ i, (K i).conjTranspose * (O.conjTranspose * K i) =
      (∑ i, (K i).conjTranspose * (O * K i)).conjTranspose := by
  rw [Matrix.conjTranspose_sum]
  apply Finset.sum_congr rfl
  intro i _
  rw [Matrix.conjTranspose_mul, Matrix.conjTranspose_mul,
    Matrix.conjTranspose_conjTranspose]
  rw [Matrix.mul_assoc]

omit [DecidableEq fine] in
theorem matrix_finite_kraus_state_trace_preserving
    {kraus : Type*} [Fintype kraus]
    (K : kraus → Matrix fine coarse ℂ)
    (hK : ∑ i, (K i).conjTranspose * K i = 1)
    (rho : Matrix coarse coarse ℂ) :
    Matrix.trace (∑ i, (K i * rho) * (K i).conjTranspose) =
      Matrix.trace rho := by
  calc
    Matrix.trace (∑ i, (K i * rho) * (K i).conjTranspose)
        = ∑ i, Matrix.trace ((K i * rho) * (K i).conjTranspose) := by
          rw [Matrix.trace_sum]
    _ = ∑ i, Matrix.trace (((K i).conjTranspose * K i) * rho) := by
          apply Finset.sum_congr rfl
          intro i _
          rw [Matrix.trace_mul_cycle]
    _ = Matrix.trace ((∑ i, (K i).conjTranspose * K i) * rho) := by
          rw [Finset.sum_mul]
          rw [Matrix.trace_sum]
    _ = Matrix.trace ((1 : Matrix coarse coarse ℂ) * rho) := by rw [hK]
    _ = Matrix.trace rho := by rw [Matrix.one_mul]

omit [DecidableEq coarse] [DecidableEq fine] in
theorem matrix_finite_kraus_expectation_preserving
    {kraus : Type*} [Fintype kraus]
    (K : kraus → Matrix fine coarse ℂ)
    (rho : Matrix coarse coarse ℂ)
    (O : Matrix fine fine ℂ) :
    Matrix.trace ((∑ i, (K i * rho) * (K i).conjTranspose) * O) =
      Matrix.trace (rho * (∑ i, (K i).conjTranspose * (O * K i))) := by
  calc
    Matrix.trace ((∑ i, (K i * rho) * (K i).conjTranspose) * O)
        = Matrix.trace (∑ i, ((K i * rho) * (K i).conjTranspose) * O) := by
          rw [Finset.sum_mul]
    _ = ∑ i, Matrix.trace (((K i * rho) * (K i).conjTranspose) * O) := by
          rw [Matrix.trace_sum]
    _ = ∑ i, Matrix.trace (rho * ((K i).conjTranspose * (O * K i))) := by
          apply Finset.sum_congr rfl
          intro i _
          rw [matrix_expectation_preserving]
    _ = Matrix.trace (∑ i, rho * ((K i).conjTranspose * (O * K i))) := by
          rw [Matrix.trace_sum]
    _ = Matrix.trace (rho * (∑ i, (K i).conjTranspose * (O * K i))) := by
          rw [Finset.mul_sum]

end

end LinearAlgebra
end CFTAnyons
