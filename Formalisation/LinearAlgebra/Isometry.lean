import Mathlib

/-!
# LinearAlgebra.Isometry — ported from cft-anyons-deprecated

Source: cft-anyons-deprecated/Formalisation/LinearAlgebra/Isometry.lean
Port: cft-anyons P4.2 (MIGRATION_PLAN.md:187). Body unchanged from source;
this docstring block extended with GLOSSARY cross-references.

Finite-dimensional matrix identities used by the fine-graining targets.

The first layer states the claims as matrix equations. More category-specific
results will reduce to these equations after choosing
orthonormal fusion-tree bases.

Cross-references to `GLOSSARY.md`:

-- GLOSSARY: conv:basics
   The dagger `f^\dagger` is the complex-conjugate transpose for matrices;
   realised here as `Matrix.conjTranspose` from Mathlib. Every theorem in
   this file states an identity in terms of `conjTranspose`.

-- GLOSSARY: def:refmap
   A refinement map `E_{P\to P'}` is required to be an isometry:
   `E^\dagger E = id`. The hypothesis `hE : E.conjTranspose * E = 1`
   recurs across `matrix_ascending_unital`,
   `matrix_unitary_dressing_isometry`, `matrix_logical_lift_retract`,
   and `matrix_range_projection_idempotent`. The lemmas
   `matrix_unitary_dressing_isometry` and
   `matrix_unitary_conjugation_isometry` show that isometry is preserved
   under left-multiplication by a unitary and under unitary conjugation,
   respectively — supporting infrastructure for the refinement-map
   construction. (GLOSSARY `def:refmap` explicitly names this file as
   "general isometry lemmas" supporting infrastructure for
   `LinearAlgebra/FineGraining.lean` at P4.11.)

-- GLOSSARY: def:blocking
   The blocking map is `B_{P\leftarrow P'} := E_{P\to P'}^\dagger`.
   Isometry of `E` is equivalent to `B E = id` (here:
   `E.conjTranspose * E = 1`). The other composition `E B = E E^\dagger`
   is "in general only an orthogonal projection onto the embedded coarse
   subspace (a strict projection, not the identity)" — precisely the
   content of `matrix_range_projection_idempotent`
   (`(E E^\dagger)^2 = E E^\dagger`) and
   `matrix_range_projection_self_adjoint` (`(E E^\dagger)^\dagger = E E^\dagger`).
   `matrix_unitary_conjugation_coisometry` is the dual statement for `B`
   under unitary conjugation.

-- GLOSSARY: def:ascending
   The ascending channel is `A_{P'\to P}(O) := E^\dagger O E`. It is
   "unital (`A(id) = id` because `E^\dagger E = id`), `*`-preserving,
   and completely positive" — `matrix_ascending_unital` is the unital
   property (`E^\dagger (1 * E) = 1` under `hE`);
   `matrix_ascending_star_preserving` is the `*`-preservation identity
   `E^\dagger (O^\dagger E) = (E^\dagger (O E))^\dagger`;
   `matrix_logical_lift_retract` records that ascending a lifted
   observable recovers the original (`E^\dagger ((E O) E^\dagger E) = O`).
-/

namespace CFTAnyons
namespace LinearAlgebra

noncomputable section

open Matrix

variable {coarse fine : Type*}
variable [Fintype coarse] [DecidableEq coarse]
variable [Fintype fine] [DecidableEq fine]

omit [Fintype coarse] in
theorem matrix_ascending_unital
    (E : Matrix fine coarse ℂ)
    (hE : E.conjTranspose * E = 1) :
    E.conjTranspose * ((1 : Matrix fine fine ℂ) * E) = 1 := by
  simpa [Matrix.one_mul] using hE

omit [Fintype coarse] in
theorem matrix_unitary_dressing_isometry
    (U : Matrix fine fine ℂ) (E : Matrix fine coarse ℂ)
    (hU : U.conjTranspose * U = 1)
    (hE : E.conjTranspose * E = 1) :
    (U * E).conjTranspose * (U * E) = 1 := by
  rw [Matrix.conjTranspose_mul]
  calc
    E.conjTranspose * U.conjTranspose * (U * E)
        = E.conjTranspose * (U.conjTranspose * U * E) := by
          rw [Matrix.mul_assoc, Matrix.mul_assoc]
    _ = E.conjTranspose * ((U.conjTranspose * U) * E) := by
          rw [Matrix.mul_assoc]
    _ = E.conjTranspose * ((1 : Matrix fine fine ℂ) * E) := by
          rw [hU]
    _ = E.conjTranspose * E := by rw [Matrix.one_mul]
    _ = 1 := hE

theorem matrix_unitary_conjugation_isometry
    (F R : Matrix fine fine ℂ)
    (hF_left : F.conjTranspose * F = 1)
    (hF_right : F * F.conjTranspose = 1)
    (hR_left : R.conjTranspose * R = 1) :
    (F * R * F.conjTranspose).conjTranspose * (F * R * F.conjTranspose) = 1 := by
  calc
    (F * R * F.conjTranspose).conjTranspose * (F * R * F.conjTranspose)
        = F * R.conjTranspose * (F.conjTranspose * F) * R * F.conjTranspose := by
          rw [Matrix.conjTranspose_mul, Matrix.conjTranspose_mul,
            Matrix.conjTranspose_conjTranspose]
          simp only [Matrix.mul_assoc]
    _ = F * R.conjTranspose * 1 * R * F.conjTranspose := by rw [hF_left]
    _ = F * (R.conjTranspose * R) * F.conjTranspose := by
          simp only [Matrix.mul_assoc, Matrix.mul_one]
    _ = F * 1 * F.conjTranspose := by rw [hR_left]
    _ = 1 := by simpa [Matrix.mul_one] using hF_right

theorem matrix_unitary_conjugation_coisometry
    (F R : Matrix fine fine ℂ)
    (hF_left : F.conjTranspose * F = 1)
    (hF_right : F * F.conjTranspose = 1)
    (hR_right : R * R.conjTranspose = 1) :
    (F * R * F.conjTranspose) * (F * R * F.conjTranspose).conjTranspose = 1 := by
  calc
    (F * R * F.conjTranspose) * (F * R * F.conjTranspose).conjTranspose
        = F * R * (F.conjTranspose * F) * R.conjTranspose * F.conjTranspose := by
          rw [Matrix.conjTranspose_mul, Matrix.conjTranspose_mul,
            Matrix.conjTranspose_conjTranspose]
          simp only [Matrix.mul_assoc]
    _ = F * R * 1 * R.conjTranspose * F.conjTranspose := by rw [hF_left]
    _ = F * (R * R.conjTranspose) * F.conjTranspose := by
          simp only [Matrix.mul_assoc, Matrix.mul_one]
    _ = F * 1 * F.conjTranspose := by rw [hR_right]
    _ = 1 := by simpa [Matrix.mul_one] using hF_right

omit [Fintype coarse] [DecidableEq coarse] [DecidableEq fine] in
theorem matrix_ascending_star_preserving
    (E : Matrix fine coarse ℂ) (O : Matrix fine fine ℂ) :
    E.conjTranspose * (O.conjTranspose * E) =
      (E.conjTranspose * (O * E)).conjTranspose := by
  rw [Matrix.conjTranspose_mul, Matrix.conjTranspose_mul,
    Matrix.conjTranspose_conjTranspose]
  rw [Matrix.mul_assoc]

omit [DecidableEq fine] in
theorem matrix_logical_lift_retract
    (E : Matrix fine coarse ℂ)
    (hE : E.conjTranspose * E = 1)
    (O : Matrix coarse coarse ℂ) :
    E.conjTranspose * (((E * O) * E.conjTranspose) * E) = O := by
  calc
    E.conjTranspose * (((E * O) * E.conjTranspose) * E)
        = E.conjTranspose * ((E * O) * (E.conjTranspose * E)) := by
          rw [Matrix.mul_assoc]
    _ = E.conjTranspose * ((E * O) * (1 : Matrix coarse coarse ℂ)) := by rw [hE]
    _ = E.conjTranspose * (E * O) := by rw [Matrix.mul_one]
    _ = (E.conjTranspose * E) * O := by rw [← Matrix.mul_assoc]
    _ = O := by rw [hE, Matrix.one_mul]

omit [Fintype fine] [DecidableEq fine] in
theorem matrix_logical_lift_identity
    (E : Matrix fine coarse ℂ) :
    (E * (1 : Matrix coarse coarse ℂ)) * E.conjTranspose =
      E * E.conjTranspose := by
  rw [Matrix.mul_one]

omit [DecidableEq fine] in
theorem matrix_range_projection_idempotent
    (E : Matrix fine coarse ℂ)
    (hE : E.conjTranspose * E = 1) :
    (E * E.conjTranspose) * (E * E.conjTranspose) = E * E.conjTranspose := by
  calc
    (E * E.conjTranspose) * (E * E.conjTranspose)
        = E * (E.conjTranspose * E) * E.conjTranspose := by
          simp only [Matrix.mul_assoc]
    _ = E * (1 : Matrix coarse coarse ℂ) * E.conjTranspose := by rw [hE]
    _ = E * E.conjTranspose := by rw [Matrix.mul_one]

omit [DecidableEq coarse] [Fintype fine] [DecidableEq fine] in
theorem matrix_range_projection_self_adjoint
    (E : Matrix fine coarse ℂ) :
    (E * E.conjTranspose).conjTranspose = E * E.conjTranspose := by
  rw [Matrix.conjTranspose_mul, Matrix.conjTranspose_conjTranspose]

end

end LinearAlgebra
end CFTAnyons
