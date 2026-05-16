import Mathlib

/-!
Conditional diagonal scaling theorem.

This file formalises the linear-algebra content of the scaling-operator target:
if an operator renormalisation map is diagonal in a chosen scaling basis, then
the basis operators are eigenoperators with the listed diagonal entries.

Cross-references to `GLOSSARY.md`:

- `def:scalop` (GLOSSARY.md:1628) — Scaling operator. This file is the
  GLOSSARY-pre-registered canonical CAD anchor for `def:scalop` — verbatim
  per the Translation map CAD section at GLOSSARY.md:1648:
  "`LinearAlgebra/ChargeOnly.lean` (Phase 4 P4.14) +
  `LinearAlgebra/DiagonalScaling.lean` (P4.13) — eigenvalue structure of
  the charge-only specialisation proved. The 'charge-only fails CFT
  spectrum' Warning §8.5 (`summary.tex warn:charge-only`) is documented
  but NOT a CAD theorem." The summary.tex canonical body asserts that a
  scaling operator `Φ_i` of the ascending channel `Aa` at RG scale
  factor `b` is an eigenoperator with eigenvalue
  `λ_i = b^{-Δ_i}` (nonchiral) or `b^{-h_i}` (chiral). This file
  discharges the matrix-level eigenoperator identity in the
  finite-dimensional diagonal-in-a-fixed-basis specialisation:
  `theorem diagonalScaling_basis_eigen` proves
  `diagonalScaling lambda (scalingBasisVector i) = lambda i • scalingBasisVector i`
  for arbitrary diagonal entries `lambda : ι → ℂ`, and
  `theorem diagonalScaling_conformal_basis_eigen` instantiates this for
  the CFT scaling-eigenvalue formula
  `scalingEigenvalue b weight i := (Real.rpow b (-(weight i)) : ℂ)`,
  i.e. `b^{-w_i}` — the chiral `b^{-h_i}` (or, with `weight := Δ`,
  nonchiral `b^{-Δ_i}`) specialisation of the canonical eigenvalue
  formula. The `def:scalop` Aliases include "eigenoperator", which IS
  the role of `scalingBasisVector i` under `diagonalScaling lambda`.

- `def:ascending` (GLOSSARY.md:814) — Ascending observable channel. The
  Translation map CAD bullet at GLOSSARY.md:840 names this file
  alongside `LinearAlgebra/ChargeOnly.lean` as the "charge-only"
  specialisation locus of the abstract ascending channel
  `Aa(O) = E^† O E`: "the ascending-channel construction `A(O) = E† O E`
  is the channel-property infrastructure in `LinearAlgebra/Trace.lean`
  (Phase 4 P4.7) and `LinearAlgebra/FineGraining.lean` (P4.11) —
  completely positive, unital, *-preserving. The 'charge-only'
  specialisation (`summary.tex warn:charge-only`) is in
  `LinearAlgebra/ChargeOnly.lean` (P4.14) + `DiagonalScaling.lean`
  (P4.13); the categorical 'charge-only fails CFT spectrum' Warning is
  documented but NOT a CAD theorem." In this file the abstract channel
  `Aa : End → End` is specialised to a single diagonal multiplier
  `diagonalScaling lambda : (ι → ℂ) → (ι → ℂ)` acting on functions in
  the fixed basis `{scalingBasisVector i}_{i : ι}`; the eigenoperator
  property of the basis vectors IS the diagonal-eigenoperator content
  of the "charge-only" specialisation when `Aa` is diagonalised in a
  charge basis (where each `scalingBasisVector i` carries a single
  charge `i`).

- `def:primary` (GLOSSARY.md:1474) — Primary, conformal weight, scaling
  dimension. The `weight : ι → ℝ` argument of `scalingEigenvalue` plays
  the role of the family `{Δ_i}_{i : ι}` (nonchiral) or `{h_i}_{i : ι}`
  (chiral) of conformal weights / scaling dimensions per the summary.tex
  canonical at GLOSSARY.md:1483 ("Its `scaling dimension` is
  `Δ := h + h̄`. In a chiral CFT only `h` appears and `Δ := h`."). The
  formula `(Real.rpow b (-(weight i)) : ℂ)` realises `b^{-w_i}` faithfully
  via Mathlib's `Real.rpow` for `b : ℝ` (no positivity hypothesis on
  `b` is imposed at this matrix level; `Real.rpow` is total via
  `Real.rpow_def_of_pos` / `Real.rpow_def_of_neg` / `Real.rpow_zero`,
  matching summary.tex's silent positivity assumption `b > 1` of
  `def:RG-amp` and `def:scalop` at the linear-algebra level — the
  positivity is a downstream physical constraint, not a Lean
  hypothesis).

- `conv:basics` (GLOSSARY.md:130) — Notation and conventions. The
  complex-vector-space default (`Vector spaces are complex unless
  otherwise stated") is realised by carrying the coordinate functions
  in `ι → ℂ` and the eigenvalues in `ℂ` (via the `(... : ℂ)`-coerced
  `Real.rpow`); the dagger / adjoint is not invoked in this file (the
  diagonal-multiplier matrix is its own adjoint when the `lambda i` are
  real, which is the case for `scalingEigenvalue b weight i` whenever
  `b > 0`, but no such real/positive condition is stated at the
  matrix level). The `DecidableEq ι` instance is needed to evaluate
  `scalingBasisVector i j = if j = i then 1 else 0`.
-/

namespace CFTAnyons
namespace LinearAlgebra

noncomputable section

variable {ι : Type*} [DecidableEq ι]

def scalingBasisVector (i : ι) : ι → ℂ :=
  fun j => if j = i then 1 else 0

def diagonalScaling (lambda : ι → ℂ) (x : ι → ℂ) : ι → ℂ :=
  fun j => lambda j * x j

theorem diagonalScaling_basis_eigen
    (lambda : ι → ℂ) (i : ι) :
    diagonalScaling lambda (scalingBasisVector i) =
      lambda i • scalingBasisVector i := by
  funext j
  by_cases h : j = i
  · subst h
    simp [diagonalScaling, scalingBasisVector]
  · simp [diagonalScaling, scalingBasisVector, h]

def scalingEigenvalue (b : ℝ) (weight : ι → ℝ) (i : ι) : ℂ :=
  (Real.rpow b (-(weight i)) : ℂ)

theorem diagonalScaling_conformal_basis_eigen
    (b : ℝ) (weight : ι → ℝ) (i : ι) :
    diagonalScaling (scalingEigenvalue b weight) (scalingBasisVector i) =
      scalingEigenvalue b weight i • scalingBasisVector i :=
  diagonalScaling_basis_eigen (scalingEigenvalue b weight) i

end

end LinearAlgebra
end CFTAnyons
