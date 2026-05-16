import Mathlib

/-!
# Charge-only ascending channel — finite contrast counterexample

A finite charge-only contrast counterexample.

This is the matrix-level core of the warning that a one-site charge-projector
contrast has an eigenvalue fixed by the chosen charge-only amplitude, rather
than by conformal-field-theory scaling data.

Port provenance: ported verbatim from
`cft-anyons-deprecated/Formalisation/LinearAlgebra/ChargeOnly.lean` at
MIGRATION_PLAN.md:199 (P4.14). Body is byte-identical to the canonical CAD
source from `namespace CFTAnyons` to EOF; only addition is this
top-of-file docstring extension with `Cross-references to GLOSSARY.md`
below.

## Cross-references to GLOSSARY.md

-- GLOSSARY: def:scalop (GLOSSARY.md:1628) — Scaling operator. The canonical
   statement at `summary.tex:1958` defines a scaling operator `Φ_i` of the
   ascending channel `Aa` at RG scale factor `b` as an eigenoperator with
   eigenvalue `λ_i = b^{-Δ_i}` (nonchiral) or `b^{-h_i}` (chiral). This
   file is the GLOSSARY-pre-registered canonical CAD anchor for
   `def:scalop` paired with `LinearAlgebra/DiagonalScaling.lean` (P4.13)
   — verbatim per the Translation map CAD section at GLOSSARY.md:1648:
   "`LinearAlgebra/ChargeOnly.lean` (Phase 4 P4.14) +
   `LinearAlgebra/DiagonalScaling.lean` (P4.13) — eigenvalue structure
   of the charge-only specialisation proved. The 'charge-only fails
   CFT spectrum' Warning §8.5 (`summary.tex warn:charge-only`) is
   documented but NOT a CAD theorem." This file discharges the
   matrix-level eigenoperator identity in the charge-only specialisation:
   `theorem chargeOnly_identity_eigen` proves that `chargeIdentity` is a
   `(+1)`-eigenoperator of every `chargeOnlyChannel a`;
   `theorem chargeOnly_contrast_eigen` proves that `chargeContrast` is
   an `a`-eigenoperator of `chargeOnlyChannel a` for arbitrary parameter
   `a : ℂ`; the closing `theorem chargeOnly_contrast_eigenvalue_not_quarter`
   exhibits a concrete parameter `a = 1/2` for which the charge-contrast
   eigenvalue (`1/2`) explicitly differs from the chosen target value
   (`1/4`), realising the matrix-level core of the categorical "charge-only
   fails CFT spectrum" warning at scalar amplitude. The categorical
   "charge-only fails CFT spectrum" content of `warn:charge-only`
   (`summary.tex:1964`, §8.5) is OUT OF CAD SCOPE per the GLOSSARY
   canonical-anchor line.

-- GLOSSARY: def:ascending (GLOSSARY.md:814) — Ascending observable channel.
   The canonical statement at `summary.tex:449` defines the ascending
   channel `Aa_{P'→P}(O) := E_{P→P'}^† O E_{P→P'}`. The Translation map
   CAD bullet at GLOSSARY.md:840 names this file alongside
   `LinearAlgebra/DiagonalScaling.lean` as the "charge-only" specialisation
   locus: "the 'charge-only' specialisation (`summary.tex warn:charge-only`)
   is in `LinearAlgebra/ChargeOnly.lean` (P4.14) +
   `DiagonalScaling.lean` (P4.13); the categorical 'charge-only fails
   CFT spectrum' Warning is documented but NOT a CAD theorem." In this
   file the abstract channel `Aa : End → End` is specialised to a single
   one-parameter family `chargeOnlyChannel a : (ChargeTwo → ℂ) → (ChargeTwo → ℂ)`
   acting on functions in the two-element charge basis `{chargeIdentity,
   chargeContrast}` — the simplest non-trivial charge-projector basis for
   a two-state charge sector. The `chargeIdentity` and `chargeContrast`
   eigen-theorems realise the unital + bi-eigenstructure of the abstract
   ascending channel in this finite charge-only specialisation; the
   `chargeOnly_contrast_eigenvalue_not_quarter` corollary realises the
   matrix-level core of the "charge-only fails CFT spectrum" warning.

-- GLOSSARY: def:primary (GLOSSARY.md:1474) — Primary, conformal weight,
   scaling dimension. The chosen contrast target value `1/4 : ℂ` plays the
   role of an exemplar conformal scaling eigenvalue `b^{-Δ}` (with `b = 2`
   and `Δ = 2` as an illustrative pair); the non-equality
   `(1/2 : ℂ) ≠ (1/4 : ℂ)` that `theorem half_ne_quarter` establishes by
   `norm_num` quantifies a concrete instance of the categorical statement
   that charge-only operator bases generically miss CFT primary scaling
   eigenvalues (`warn:charge-only`, `summary.tex:1964`). The eigenvalue
   of `chargeOnlyChannel a` on `chargeContrast` is the unconstrained
   parameter `a` itself, not any CFT-derived `b^{-Δ}` quantity.

-- GLOSSARY: conv:basics (GLOSSARY.md:130) — Notation and conventions.
   The complex-vector-space default ("Vector spaces are complex unless
   otherwise stated") is realised by carrying the coordinate functions in
   `ChargeTwo → ℂ` and the eigenvalues in `ℂ`; `ChargeTwo := Fin 2` is the
   two-element index type with the `DecidableEq` instance needed to
   evaluate the `if i = 0 then ... else ...` branches of `chargeContrast`
   and `chargeOnlyChannel a`. The dagger is not invoked in this file.
-/

namespace CFTAnyons
namespace LinearAlgebra

noncomputable section

abbrev ChargeTwo := Fin 2

def chargeIdentity : ChargeTwo → ℂ :=
  fun _ => 1

def chargeContrast : ChargeTwo → ℂ :=
  fun i => if i = 0 then 1 else -1

def chargeOnlyChannel (a : ℂ) (x : ChargeTwo → ℂ) : ChargeTwo → ℂ :=
  fun i =>
    if i = 0 then
      ((1 + a) / 2) * x 0 + ((1 - a) / 2) * x 1
    else
      ((1 - a) / 2) * x 0 + ((1 + a) / 2) * x 1

theorem chargeOnly_identity_eigen (a : ℂ) :
    chargeOnlyChannel a chargeIdentity = chargeIdentity := by
  funext i
  fin_cases i <;> simp [chargeOnlyChannel, chargeIdentity] <;> ring

theorem chargeOnly_contrast_eigen (a : ℂ) :
    chargeOnlyChannel a chargeContrast = a • chargeContrast := by
  funext i
  fin_cases i <;> simp [chargeOnlyChannel, chargeContrast] <;> ring

theorem half_ne_quarter : ((1 / 2 : ℂ) ≠ (1 / 4 : ℂ)) := by
  norm_num

theorem chargeOnly_contrast_eigenvalue_not_quarter :
    (1 / 2 : ℂ) ≠ (1 / 4 : ℂ) ∧
    chargeOnlyChannel (1 / 2 : ℂ) chargeContrast =
      (1 / 2 : ℂ) • chargeContrast := by
  exact ⟨half_ne_quarter, chargeOnly_contrast_eigen (1 / 2 : ℂ)⟩

end

end LinearAlgebra
end CFTAnyons
