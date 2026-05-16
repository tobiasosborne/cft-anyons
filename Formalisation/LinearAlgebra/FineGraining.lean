import Formalisation.LinearAlgebra.Isometry
import Formalisation.LinearAlgebra.Postcompose
import Formalisation.LinearAlgebra.Trace

/-!
# LinearAlgebra.FineGraining — ported from cft-anyons-deprecated

Source: cft-anyons-deprecated/Formalisation/LinearAlgebra/FineGraining.lean
Port: cft-anyons P4.11 (MIGRATION_PLAN.md:196). Body unchanged from source;
this docstring block extended with GLOSSARY cross-references.

Finite matrix fine-graining maps.

This file packages the project definition of a finite fine-graining map after
choosing finite coordinate bases: a matrix `E : fine -> coarse` satisfying
`E† E = I`. The theorems below expose previously validated finite matrix
consequences through this structure.

Cross-references to `GLOSSARY.md`:

-- GLOSSARY: conv:basics
   Vector spaces are complex (`ℂ`); the dagger `f^\dagger` is the
   complex-conjugate transpose for matrices. Realised throughout this file
   as `Matrix.conjTranspose` (the `(·)^†` of `Matrix.mul_apply` /
   `Matrix.conjTranspose_apply`). All declarations work over `ℂ` indexed by
   finite (`Fintype`) types `coarse`, `fine`, `source` of basis labels with
   decidable equality. The defining isometry equation
   `E.toMatrix.conjTranspose * E.toMatrix = 1` in the `FiniteFineGraining`
   structure is the matrix realisation in `conv:basics`'s dagger of the
   abstract isometry condition `E^\dagger E = \id_{A_P}` of `def:refmap`.

-- GLOSSARY: def:refmap
   The refinement map `E_{P\to P'}: A_P \to A_{P'}` of `summary.tex:411`,
   required to be an isometry (`E_{P\to P'}^{\dagger} E_{P\to P'} =
   \id_{A_P}`) and cellwise local. This file is the GLOSSARY-pre-registered
   canonical CAD anchor for `def:refmap` — verbatim per the Translation map
   CAD section at `GLOSSARY.md:717`: "`LinearAlgebra/FineGraining.lean
   ::FiniteFineGraining` (Phase 4 P4.11) — captures the `E†E = id` isometry
   condition + all channel properties (unital, *-preserving, completely
   positive). Works at the matrix-algebra level; instantiation requires
   choosing bases for source and target." The structure `FiniteFineGraining
   coarse fine` packages a matrix `toMatrix : Matrix fine coarse ℂ` together
   with the isometry proof `isometry : toMatrix.conjTranspose * toMatrix =
   1`; the `CoeFun` instance lets `E : FiniteFineGraining coarse fine` be
   applied as the underlying matrix. The `gram` theorem re-exports the
   defining isometry equation. `ascending_unital` packages the unital
   identity `E^\dagger * (1 * E) = 1` (delegating to
   `matrix_ascending_unital` from `LinearAlgebra/Isometry.lean`,
   P4.2); `postcompose_preserves_gram` packages the gram-preservation
   property `(EF)^\dagger (EG) = F^\dagger G` (delegating to
   `matrix_postcompose_preserves_gram` from `LinearAlgebra/Postcompose.lean`,
   P4.8). The cellwise-local tensor-product structure of `def:refmap` is
   handled separately in `LinearAlgebra/Tensor.lean` (P4.4),
   `TensorPower.lean` (P4.5), `HeterogeneousTensor.lean` (P4.6); the
   compositional infrastructure (`Postcompose`/`Component`) lands at P4.8 /
   P4.9.

-- GLOSSARY: def:blocking
   The blocking map `B_{P\leftarrow P'} := E_{P\to P'}^{\dagger}: A_{P'}
   \to A_P` of `summary.tex:438`. Per the Translation map CAD section at
   `GLOSSARY.md:807`, this file is the canonical CAD anchor: "the `B = E†`
   adjoint relationship is implicit in `LinearAlgebra/FineGraining.lean`
   (Phase 4 P4.11) via the isometry condition. Not separately formalised as
   a distinct `def:blocking` structure." Every appearance of
   `E.toMatrix.conjTranspose` in this file realises `B` on the matrix side;
   the isometry equation `E.toMatrix.conjTranspose * E.toMatrix = 1` of the
   structure IS the `def:blocking` identity `B E = \id_{A_P}` (per
   `def:blocking` canonical statement). The "other composition" `E B =
   E E^\dagger` is the projection onto the embedded coarse subspace —
   captured here by `range_projection_idempotent` (`(E E^\dagger)^2 =
   E E^\dagger`, delegating to `matrix_range_projection_idempotent` from
   `LinearAlgebra/Isometry.lean`) and `range_projection_self_adjoint`
   (`(E E^\dagger)^\dagger = E E^\dagger`, delegating to
   `matrix_range_projection_self_adjoint`); together these encode that
   `E B` is an orthogonal projection (not the identity), the load-bearing
   strict-projection observation of `def:blocking`. `logical_lift_identity`
   and `logical_lift_retract` package the "lift then retract" pair
   (`E^\dagger (E O E^\dagger) E = O` and `E (1) E^\dagger = E E^\dagger`,
   delegating to `matrix_logical_lift_identity` and
   `matrix_logical_lift_retract`).

-- GLOSSARY: def:ascending
   The ascending observable channel `\Aa_{P'\to P}(O) := E_{P\to P'}^{\dagger}
   O E_{P\to P'}` of `summary.tex:449`, unital + `*`-preserving + completely
   positive. Per the Translation map CAD section at `GLOSSARY.md:840`, this
   file (paired with `LinearAlgebra/Trace.lean`, P4.7) is a canonical CAD
   anchor for the channel-property infrastructure: "the ascending-channel
   construction `A(O) = E† O E` is the channel-property infrastructure in
   `LinearAlgebra/Trace.lean` (Phase 4 P4.7) and `LinearAlgebra/FineGraining.lean`
   (P4.11) — completely positive, unital, *-preserving." The unital identity
   `\Aa(\id_{A_{P'}}) = \id_{A_P}` is `ascending_unital`; the
   `*`-preservation identity is `ascending_star_preserving`
   (`E^\dagger (O^\dagger E) = (E^\dagger (O E))^\dagger`); the
   trace-preservation companion (the Heisenberg / Schrödinger duality
   underlying complete positivity) is `state_embedding_trace_preserving`
   (`trace((E ρ) E^\dagger) = trace(ρ)`) and its dual
   `expectation_preserving` (`trace(((E ρ) E^\dagger) O) =
   trace(ρ (E^\dagger (O E)))`); each delegates to the matching matrix
   lemma in `LinearAlgebra/Trace.lean` (P4.7). The "charge-only"
   specialisation of `def:ascending` (`summary.tex warn:charge-only`) lives
   downstream in `LinearAlgebra/ChargeOnly.lean` (P4.14) +
   `DiagonalScaling.lean` (P4.13).
-/

namespace CFTAnyons
namespace LinearAlgebra

noncomputable section

open Matrix

variable {coarse fine source : Type*}
variable [Fintype coarse] [DecidableEq coarse]
variable [Fintype fine] [DecidableEq fine]
variable [Fintype source] [DecidableEq source]

/-- A finite coordinate fine-graining map is a matrix from coarse coordinates
to fine coordinates whose columns are isometric. -/
structure FiniteFineGraining (coarse fine : Type*) [Fintype coarse] [DecidableEq coarse]
    [Fintype fine] [DecidableEq fine] where
  toMatrix : Matrix fine coarse ℂ
  isometry : toMatrix.conjTranspose * toMatrix = 1

namespace FiniteFineGraining

instance : CoeFun (FiniteFineGraining coarse fine) (fun _ => Matrix fine coarse ℂ) where
  coe E := E.toMatrix

theorem gram (E : FiniteFineGraining coarse fine) :
    E.toMatrix.conjTranspose * E.toMatrix = 1 :=
  E.isometry

theorem ascending_unital (E : FiniteFineGraining coarse fine) :
    E.toMatrix.conjTranspose * ((1 : Matrix fine fine ℂ) * E.toMatrix) = 1 :=
  matrix_ascending_unital E.toMatrix E.isometry

omit [Fintype source] [DecidableEq source] in
theorem postcompose_preserves_gram (E : FiniteFineGraining coarse fine)
    (F G : Matrix coarse source ℂ) :
    (E.toMatrix * F).conjTranspose * (E.toMatrix * G) = F.conjTranspose * G :=
  matrix_postcompose_preserves_gram E.toMatrix E.isometry F G

theorem state_embedding_trace_preserving (E : FiniteFineGraining coarse fine)
    (rho : Matrix coarse coarse ℂ) :
    Matrix.trace ((E.toMatrix * rho) * E.toMatrix.conjTranspose) = Matrix.trace rho :=
  matrix_state_embedding_trace_preserving E.toMatrix E.isometry rho

theorem expectation_preserving (E : FiniteFineGraining coarse fine)
    (rho : Matrix coarse coarse ℂ) (O : Matrix fine fine ℂ) :
    Matrix.trace ((((E.toMatrix * rho) * E.toMatrix.conjTranspose) * O)) =
      Matrix.trace (rho * (E.toMatrix.conjTranspose * (O * E.toMatrix))) :=
  matrix_expectation_preserving E.toMatrix rho O

theorem ascending_star_preserving (E : FiniteFineGraining coarse fine)
    (O : Matrix fine fine ℂ) :
    E.toMatrix.conjTranspose * (O.conjTranspose * E.toMatrix) =
      (E.toMatrix.conjTranspose * (O * E.toMatrix)).conjTranspose :=
  matrix_ascending_star_preserving E.toMatrix O

theorem logical_lift_identity (E : FiniteFineGraining coarse fine) :
    (E.toMatrix * (1 : Matrix coarse coarse ℂ)) * E.toMatrix.conjTranspose =
      E.toMatrix * E.toMatrix.conjTranspose :=
  matrix_logical_lift_identity E.toMatrix

theorem logical_lift_retract (E : FiniteFineGraining coarse fine)
    (O : Matrix coarse coarse ℂ) :
    E.toMatrix.conjTranspose * (((E.toMatrix * O) * E.toMatrix.conjTranspose) *
      E.toMatrix) = O :=
  matrix_logical_lift_retract E.toMatrix E.isometry O

theorem range_projection_idempotent (E : FiniteFineGraining coarse fine) :
    (E.toMatrix * E.toMatrix.conjTranspose) *
      (E.toMatrix * E.toMatrix.conjTranspose) =
        E.toMatrix * E.toMatrix.conjTranspose :=
  matrix_range_projection_idempotent E.toMatrix E.isometry

theorem range_projection_self_adjoint (E : FiniteFineGraining coarse fine) :
    (E.toMatrix * E.toMatrix.conjTranspose).conjTranspose =
      E.toMatrix * E.toMatrix.conjTranspose :=
  matrix_range_projection_self_adjoint E.toMatrix

end FiniteFineGraining

end

end LinearAlgebra
end CFTAnyons
