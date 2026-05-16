import Mathlib

/-!
# LinearAlgebra.Postcompose — ported from cft-anyons-deprecated

Source: cft-anyons-deprecated/Formalisation/LinearAlgebra/Postcompose.lean
Port: cft-anyons P4.8 (MIGRATION_PLAN.md:193). Body unchanged from source;
this docstring block extended with GLOSSARY cross-references.

Finite matrix postcomposition isometry.

This is the forward finite-dimensional core of the statement that a
fine-graining isometry induces isometries on Hom sectors: after choosing bases,
postcomposition is matrix multiplication on the left by an isometry.

Cross-references to `GLOSSARY.md`:

-- GLOSSARY: conv:basics
   The dagger `f^\dagger` is the complex-conjugate transpose for matrices;
   realised throughout this file as `Matrix.conjTranspose` from Mathlib.
   Vector spaces are complex (`ℂ`); both theorems are stated as matrix
   identities `(E * F).conjTranspose * (E * G) = F.conjTranspose * G`
   over `ℂ`. The right-hand side `F.conjTranspose * G` is the
   matrix-coordinate realisation of the Hilbert-space inner product
   `⟨F, G⟩` on the coarse-Hom sector; the theorem asserts that
   postcomposing both arguments with `E` (where `E^\dagger E = 1`)
   leaves this inner product invariant. The standard Mathlib lemmas
   `Matrix.conjTranspose_mul`, `Matrix.mul_assoc`, and `Matrix.one_mul`
   are used in the forward proof; `simpa` discharges the converse
   instance at `F = G = 1`.

-- GLOSSARY: def:refmap
   A refinement map `E_{P\to P'}` is required to be an isometry
   (`E^\dagger E = id`) per the canonical `def:refmap` statement
   (`summary.tex:411`; `GLOSSARY.md:674-693`). This file proves the
   matrix-coordinate companion of the (forward direction of the)
   refinement-induced isometry on Hom sectors: the induced refinement
   `V_{P\to P'}(f) := E_{P\to P'} \circ f` (`GLOSSARY.md:691`)
   postcomposes the fine-graining isometry `E` with `f \in \Hom`,
   and `matrix_postcompose_preserves_gram` proves that this
   postcomposition preserves the Gram-form inner product
   `F^\dagger G` on the source-indexed coarse-Hom matrix space — i.e.
   `V_{P\to P'}` is an isometry on each Hom sector. The companion
   `matrix_postcompose_preserves_square_gram_implies_isometry` proves
   the converse (preservation of all square Gram-forms forces the
   underlying `E` to be an isometry), establishing the bidirectional
   characterisation of `def:refmap`-style isometry in terms of
   postcomposition. This is precisely the "compositional structure"
   piece of the supporting infrastructure that GLOSSARY `def:refmap`
   Translation map CAD section explicitly names — verbatim:
   "`LinearAlgebra/Postcompose.lean` (P4.8) and
   `LinearAlgebra/Component.lean` (P4.9) for compositional structure"
   (`GLOSSARY.md:717`) — supporting infrastructure for
   `LinearAlgebra/FineGraining.lean` at P4.11, where these postcomposition
   isometry lemmas underwrite the Hom-sector isometry induced by a
   `FiniteFineGraining` instance. The categorical statement (that
   `V_{P\to P'}(f) := E_{P\to P'} \circ f` is an isometry on each
   Hom sector) is the per-Hom-space realisation; this file makes the
   matrix-coordinate side of that statement available as a stand-alone
   lemma reusable in downstream constructions.
-/

namespace CFTAnyons
namespace LinearAlgebra

noncomputable section

open Matrix

variable {source coarse fine : Type*}
variable [Fintype source] [DecidableEq source]
variable [Fintype coarse] [DecidableEq coarse]
variable [Fintype fine] [DecidableEq fine]

omit [Fintype source] [DecidableEq source] [DecidableEq fine] in
theorem matrix_postcompose_preserves_gram
    (E : Matrix fine coarse ℂ)
    (hE : E.conjTranspose * E = 1)
    (F G : Matrix coarse source ℂ) :
    (E * F).conjTranspose * (E * G) = F.conjTranspose * G := by
  rw [Matrix.conjTranspose_mul]
  calc
    F.conjTranspose * E.conjTranspose * (E * G)
        = F.conjTranspose * ((E.conjTranspose * E) * G) := by
          simp only [Matrix.mul_assoc]
    _ = F.conjTranspose * ((1 : Matrix coarse coarse ℂ) * G) := by rw [hE]
    _ = F.conjTranspose * G := by rw [Matrix.one_mul]

omit [Fintype source] [DecidableEq source] [DecidableEq fine] in
theorem matrix_postcompose_preserves_square_gram_implies_isometry
    (E : Matrix fine coarse ℂ)
    (h : ∀ F G : Matrix coarse coarse ℂ,
      (E * F).conjTranspose * (E * G) = F.conjTranspose * G) :
    E.conjTranspose * E = 1 := by
  simpa using h 1 1

end

end LinearAlgebra
end CFTAnyons
