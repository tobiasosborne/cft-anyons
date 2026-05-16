import Mathlib

/-!
# LinearAlgebra.Component — ported from cft-anyons-deprecated

Source: cft-anyons-deprecated/Formalisation/LinearAlgebra/Component.lean
Port: cft-anyons P4.9 (MIGRATION_PLAN.md:194). Body unchanged from source;
this docstring block extended with GLOSSARY cross-references.

Finite component orthogonality for isometric matrices.

This is the scalar matrix core of the direct-sum component theorem: after
choosing orthonormal component bases, `E†E = I` is equivalent to the column
Gram sums being Kronecker deltas.

Cross-references to `GLOSSARY.md`:

-- GLOSSARY: conv:basics
   The dagger `f^\dagger` is the complex-conjugate transpose for matrices;
   realised throughout this file as `Matrix.conjTranspose` from Mathlib.
   Vector spaces are complex (`ℂ`); the lone theorem is stated as a
   bidirectional matrix-coordinate identity
   `E.conjTranspose * E = 1 ↔ ∀ a a' : coarse, ∑ b : fine,
    star (E b a) * E b a' = if a = a' then 1 else 0`
   over `ℂ`. The right-hand side `∑ b, star (E b a) * E b a'` is the
   entry-by-entry Hermitian inner product of the `a`-th and `a'`-th
   columns of `E`; the Kronecker-delta RHS `if a = a' then 1 else 0`
   asserts that those columns form an orthonormal family. The standard
   Mathlib lemmas `Matrix.mul_apply`, `Matrix.conjTranspose_apply`, and
   `congr_fun` are used in both directions via `simpa`; `Matrix.ext`
   (invoked through `ext`) closes the converse by reducing matrix
   equality to entrywise equality.

-- GLOSSARY: def:refmap
   A refinement map `E_{P\to P'}` is required to be an isometry
   (`E^\dagger E = id`) per the canonical `def:refmap` statement
   (`summary.tex:411`; `GLOSSARY.md:674-693`). This file proves the
   matrix-coordinate companion of the *componentwise* characterisation
   of that isometry condition: in any chosen orthonormal basis of the
   coarse and fine Hilbert spaces, the global identity
   `E_{P\to P'}^{\dagger} E_{P\to P'} = id_{A_P}` is equivalent to the
   columnwise orthonormality of the basis matrix of `E_{P\to P'}` —
   i.e. each column has unit norm and distinct columns are orthogonal,
   `\sum_b \overline{E_{ba}} E_{ba'} = \delta_{aa'}`. The bidirectional
   statement is `matrix_component_orthogonality_iff` and decomposes the
   single global Hom-sector isometry equation into one scalar equation
   per coarse-index pair, giving the per-component breakdown of
   `def:refmap`'s isometry constraint. This is precisely the
   "compositional structure" piece of the supporting infrastructure
   that GLOSSARY `def:refmap` Translation map CAD section explicitly
   names — verbatim:
   "`LinearAlgebra/Postcompose.lean` (P4.8) and
   `LinearAlgebra/Component.lean` (P4.9) for compositional structure"
   (`GLOSSARY.md:717`) — supporting infrastructure for
   `LinearAlgebra/FineGraining.lean` at P4.11, where this componentwise
   characterisation underwrites entrywise verification of the
   `FiniteFineGraining` instance's `E†E = id` condition. Companion to
   `Postcompose.lean` (P4.8): Postcompose proves the *postcomposition*
   characterisation of refinement-map isometry (Gram-form preservation
   on Hom sectors); Component proves the *componentwise* characterisation
   (Kronecker-delta column orthonormality) — together they form the
   GLOSSARY-pre-registered compositional-structure pair for `def:refmap`.
-/

namespace CFTAnyons
namespace LinearAlgebra

noncomputable section

open Matrix BigOperators

variable {coarse fine : Type*}
variable [Fintype coarse] [DecidableEq coarse]
variable [Fintype fine] [DecidableEq fine]

omit [Fintype coarse] [DecidableEq fine] in
theorem matrix_component_orthogonality_iff
    (E : Matrix fine coarse ℂ) :
    E.conjTranspose * E = 1 ↔
      ∀ a a' : coarse, ∑ b : fine, star (E b a) * E b a' =
        if a = a' then 1 else 0 := by
  constructor
  · intro h a a'
    have h_entry := congr_fun (congr_fun h a) a'
    simpa [Matrix.mul_apply, Matrix.conjTranspose_apply] using h_entry
  · intro h
    ext a a'
    simpa [Matrix.mul_apply, Matrix.conjTranspose_apply] using h a a'

end

end LinearAlgebra
end CFTAnyons
