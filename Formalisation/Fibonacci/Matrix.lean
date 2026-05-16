import Mathlib
import Formalisation.Fibonacci.Basic

/-!
Fibonacci `F`-matrix algebra.

The matrix in the sources has entries `φ⁻¹` and `φ⁻¹/²`.
Rather than bake a square-root expression into the matrix theorem, this file
proves the exact algebraic core used by the matrix: if `a² + b² = 1`, then
`[[a,b],[b,-a]]` is symmetric, unitary over the reals, and involutive. The
Fibonacci specialisation is provided by `a = φ⁻¹` and `b² = φ⁻¹`.

Source provenance:
* CAD source: `cft-anyons-deprecated/Formalisation/Fibonacci/Matrix.lean`.
* CAD source SHA256: `824e8563832b86747b58c2300c8b8c0ec8bdc5b2d6a2308f243e8933048e499d`.
* CAD-internal provenance preserved: `handoff.md` sections 0 and 9.3;
  `references/text/FibonacciAnyonModels.txt` lines 272, 297, 301, 304;
  `references/text/GoldenChainFeiguinEtAl.txt` line 109.
* Canonical mathematical statements: `summary.tex:1060` (Definition 7.5
  `def:fib-F`) and `summary.tex:1072` (Lemma `lem:F-invol`).

Cross-references to GLOSSARY.md:
============================================================================

* `def:fib-F` — Fibonacci F-matrix (`GLOSSARY.md:1024`; canonical
  `summary.tex:1060`). The GLOSSARY entry's CAD translation map at
  `GLOSSARY.md:1054` names this exact file VERBATIM (full quote, the
  GOLD-STANDARD pre-binding for this commit):

  > "`Fibonacci/Matrix.lean::FibF` (Phase 5 P5.8). The 2×2 matrix entries
  > match `summary.tex Def 7.5` verbatim; `FibF_involutive` proves
  > `F² = I`; `FibF_orthogonal` proves `F^T F = I`. Matches `summary.tex`'s
  > unitary gauge (involutory coincides for Fibonacci per [P1.6(b)])."

  This pre-binding is FULLY discharged by this commit. Per-promise
  correspondence (every promise here is a named decl in this file, by
  reviewer-mandate from P5.7):

  - "`FibF` (Phase 5 P5.8)" → `def FibF` (body line 226) realises the
    matrix `F^{τττ}_τ` as a `Matrix (Fin 2) (Fin 2) ℝ`.
  - "The 2×2 matrix entries match `summary.tex Def 7.5` verbatim" →
    four named theorems lock the entries against Def 7.5 verbatim:
    `FibF_entry_00 : FibF 0 0 = φ⁻¹`,
    `FibF_entry_01 : FibF 0 1 = Real.sqrt φ⁻¹`,
    `FibF_entry_10 : FibF 1 0 = Real.sqrt φ⁻¹`,
    `FibF_entry_11 : FibF 1 1 = -φ⁻¹`.
    The off-diagonal entries are `Real.sqrt φ⁻¹` which is the literal
    `φ^{-1/2}` of Def 7.5 (since `Real.sqrt φ⁻¹ ≥ 0` and
    `(Real.sqrt φ⁻¹)^2 = φ⁻¹` per `Real.sq_sqrt phi_inv_nonneg`).
  - "`FibF_involutive` proves `F² = I`" → `theorem FibF_involutive`
    (body line 255) proves `FibF * FibF = 1`. Realises `lem:F-invol`'s
    `(F^{τττ}_τ)² = I`.
  - "`FibF_orthogonal` proves `F^T F = I`" → `theorem FibF_orthogonal`
    (body line 249) proves `FibFᵀ * FibF = 1`. Realises `lem:F-invol`'s
    `F^T F = I` (which, combined with symmetry `FibF_transpose` at body
    line 245, is equivalent to `F² = I` — `summary.tex:1090` notes this
    implication explicitly).
  - "Matches `summary.tex`'s unitary gauge (involutory coincides for
    Fibonacci per [P1.6(b)])" → documentation observation; see
    `CONVENTIONS.md:129` § (b) F-matrix gauge convention, specifically
    the Translation rule at `CONVENTIONS.md:174` which names this very
    file: "CAD's Lean F-matrices: `Fibonacci/Matrix.lean`'s `FibF` is
    the unitary form per `stocktake/reports/cad-lean.md` (verified by
    `FibF_orthogonal`)." For Fibonacci the unitary and involutory
    gauges coincide because the F-matrix is real-symmetric with
    `F² = I`, hence `F† = Fᵀ = F = F⁻¹`.

Dependency cross-references (NOT pre-bindings discharged by this commit):

* `def:phi` — Golden ratio (`GLOSSARY.md:997`; canonical `summary.tex:1013`).
  Already FULLY discharged at P5.7 in `Formalisation/Fibonacci/Basic.lean`.
  Used here as `φ` (the Lean name imported from `Fibonacci.Basic`) and as
  `φ⁻¹`, `Real.sqrt φ⁻¹` (the literal `varphi^{-1}` and `varphi^{-1/2}` of
  Def 7.5's matrix entries). The defining identity `φ⁻¹^2 + φ⁻¹ = 1` is
  the named theorem `phi_inv_sq_plus_inv` from `Fibonacci.Basic`
  (= `lem:fib-arith` sub-claim C, `summary.tex:1024`), which is the
  algebraic core of `lem:F-invol`'s `F² = I` (see `summary.tex:1089`
  for the chain of identities).

Documentation cross-references (NOT D-gate pre-bindings):

* CONVENTIONS.md (b) — F-matrix gauge convention (`CONVENTIONS.md:129`).
  Per the entry's own statement at `CONVENTIONS.md:170-176`, this is a
  representational choice on F-matrix entries; it is not itself a
  definition. The Translation rule at `CONVENTIONS.md:174` names
  `Fibonacci/Matrix.lean`'s `FibF` as the unitary form, and observes
  that for Fibonacci specifically the unitary and involutory gauges
  coincide (the same `F` satisfies both `F^† F = I` and `F^2 = I`).
  This file's `FibF_involutive` + `FibF_orthogonal` are precisely the
  two equational forms that prove this coincidence over the reals.

* `Two := Fin 2` (body line 180) is a notation alias, not a GLOSSARY-slug
  realisation. Used only as the index-type for the `2 × 2` matrix.

* `FMatrix` (body line 182) is the generic real `2 × 2` matrix
  `!![a, b; b, -a]`; it realises only the algebraic infrastructure
  underlying the Fibonacci-specific specialisation. The Fibonacci
  F-matrix proper is `FibF` (the `a = φ⁻¹`, `b = Real.sqrt φ⁻¹`
  specialisation).

2-way C-gate (Lean ↔ `summary.tex` Definition 7.5 `def:fib-F` + Lemma
`lem:F-invol`)
============================================================================

`MIGRATION_PLAN.md:219` prescribes a `M, D, C` validation set for P5.8;
the C-gate here is 2-way (Lean ↔ `summary.tex`) with the 3-way Wolfram
leg deferred to Phase 6 (bd follow-up filed in this commit, mirroring
the P5.7 → `cft-anyons-5tm.9` pattern). The 2-way C-gate is hereby
executed in full:

`def:fib-F` at `summary.tex:1060-1070` (the 2×2 matrix in the standard
basis where the intermediate channel is either `1` or `τ`):

  F^{τττ}_τ = [[ φ⁻¹     , φ^{-1/2} ],
               [ φ^{-1/2} , -φ⁻¹    ]]

Per-entry Lean correspondence:

* Entry (1,1) = `φ⁻¹`: `theorem FibF_entry_00 : FibF 0 0 = φ⁻¹`
  (body line 233). MATCH: literal identity, proved by `simp [FibF, FMatrix]`.
  No drift.
* Entry (1,2) = `φ^{-1/2}`: `theorem FibF_entry_01 : FibF 0 1 = Real.sqrt φ⁻¹`
  (body line 236). MATCH: `Real.sqrt φ⁻¹ = φ^{-1/2}` because
  `Real.sqrt φ⁻¹ ≥ 0` (since `φ⁻¹ ≥ 0` per `phi_inv_nonneg`) and
  `(Real.sqrt φ⁻¹)^2 = φ⁻¹` (per `Real.sq_sqrt phi_inv_nonneg`); these two
  facts uniquely determine the non-negative real-`1/2`-power
  representative. Proved by `simp [FibF, FMatrix]`. No drift.
* Entry (2,1) = `φ^{-1/2}`: `theorem FibF_entry_10 : FibF 1 0 = Real.sqrt φ⁻¹`
  (body line 239). MATCH: same as Entry (1,2), the matrix is
  symmetric by construction (`FMatrix_transpose`). No drift.
* Entry (2,2) = `-φ⁻¹`: `theorem FibF_entry_11 : FibF 1 1 = -φ⁻¹`
  (body line 242). MATCH: literal identity, proved by
  `simp [FibF, FMatrix]`. No drift.

`lem:F-invol` at `summary.tex:1072-1090` (`F` is real, symmetric, unitary,
involution):

* Real: the matrix `FibF` has type `Matrix (Fin 2) (Fin 2) ℝ`; reality
  is captured by the type. No drift.
* Symmetric: `theorem FibF_transpose : FibFᵀ = FibF` (body line 245).
  Direct consequence of `FMatrix_transpose` (body line 185). MATCH.
* Involution: `theorem FibF_involutive : FibF * FibF = 1` (body line 255).
  Realises `(F^{τττ}_τ)^2 = I` literally. The proof unfolds `FibF`
  then invokes `fibonacci_F_involutive_from_sqrt_parameter` which
  composes the abstract `FMatrix_sq` (`a² + b² = 1 ⇒ FMatrix a b * FMatrix
  a b = 1`) with the Fibonacci specialisation `(Real.sqrt φ⁻¹)^2 = φ⁻¹`
  (`Real.sq_sqrt phi_inv_nonneg`) and `φ⁻¹^2 + φ⁻¹ = 1`
  (`phi_inv_sq_plus_inv` from `Fibonacci.Basic`, = `lem:fib-arith`
  sub-claim C). This mirrors `summary.tex:1080-1090`'s entrywise
  derivation exactly. MATCH.
* Unitary: `theorem FibF_orthogonal : FibFᵀ * FibF = 1` (body line 249).
  Over the reals, `F† = Fᵀ`, so `FibFᵀ * FibF = 1` IS the unitarity
  equation `F† F = I`. MATCH.

C-gate result: CLEARED. No discrepancy between any Lean decl and the
corresponding `summary.tex def:fib-F` matrix entry or `lem:F-invol`
sub-claim.

3-way C-gate downgrade
============================================================================

`MIGRATION_PLAN.md:219` prescribes `M, D, C` for P5.8 without naming a
specific Wolfram script (unlike P5.7's `M, D, C: 3-way (Lean / summary.tex
/ Wolfram script fibonacci_checks.wls)`). However, the canonical pattern
established in P5.7 (3-way for Fibonacci-algebra content; Wolfram leg
deferred to Phase 6) is applied here for consistency: a Wolfram script
`scripts/wolfram/fibonacci_F_matrix.wls` would symbolically check the
FibF entries + `FibF_involutive` + `FibF_orthogonal`. That script does
not yet exist in cft-anyons (it would be ported in Phase 6); a bd
follow-up is filed in this commit to track the work.
-/

namespace CFTAnyons
namespace Fibonacci

noncomputable section

open Matrix

abbrev Two := Fin 2

def FMatrix (a b : ℝ) : Matrix Two Two ℝ :=
  !![a, b; b, -a]

theorem FMatrix_transpose (a b : ℝ) :
    (FMatrix a b)ᵀ = FMatrix a b := by
  ext i j
  fin_cases i <;> fin_cases j <;> simp [FMatrix]

theorem FMatrix_sq (a b : ℝ) (h : a ^ 2 + b ^ 2 = 1) :
    FMatrix a b * FMatrix a b = 1 := by
  ext i j
  fin_cases i <;> fin_cases j <;> simp [FMatrix, Matrix.mul_apply]
  · ring_nf at h ⊢
    exact h
  · ring
  · ring
  · ring_nf at h ⊢
    exact h

theorem FMatrix_orthogonal (a b : ℝ) (h : a ^ 2 + b ^ 2 = 1) :
    (FMatrix a b)ᵀ * FMatrix a b = 1 := by
  rw [FMatrix_transpose]
  exact FMatrix_sq a b h

theorem fibonacci_F_parameter_condition :
    φ⁻¹ ^ 2 + φ⁻¹ = 1 := phi_inv_sq_plus_inv

theorem phi_inv_nonneg : 0 ≤ φ⁻¹ := by
  exact inv_nonneg.mpr (le_of_lt phi_pos)

theorem fibonacci_F_orthogonal_from_sqrt_parameter
    {b : ℝ} (hb : b ^ 2 = φ⁻¹) :
    (FMatrix φ⁻¹ b)ᵀ * FMatrix φ⁻¹ b = 1 := by
  apply FMatrix_orthogonal
  rw [hb]
  exact phi_inv_sq_plus_inv

theorem fibonacci_F_involutive_from_sqrt_parameter
    {b : ℝ} (hb : b ^ 2 = φ⁻¹) :
    FMatrix φ⁻¹ b * FMatrix φ⁻¹ b = 1 := by
  apply FMatrix_sq
  rw [hb]
  exact phi_inv_sq_plus_inv

def FibF : Matrix Two Two ℝ :=
  FMatrix φ⁻¹ (Real.sqrt φ⁻¹)

-- Verbatim per-entry correspondence with `summary.tex def:fib-F`
-- (Definition 7.5, `summary.tex:1060`). Each entry is a named theorem
-- per the reviewer-mandated GLOSSARY pre-binding discharge pattern.

theorem FibF_entry_00 : FibF 0 0 = φ⁻¹ := by
  simp [FibF, FMatrix]

theorem FibF_entry_01 : FibF 0 1 = Real.sqrt φ⁻¹ := by
  simp [FibF, FMatrix]

theorem FibF_entry_10 : FibF 1 0 = Real.sqrt φ⁻¹ := by
  simp [FibF, FMatrix]

theorem FibF_entry_11 : FibF 1 1 = -φ⁻¹ := by
  simp [FibF, FMatrix]

theorem FibF_transpose : FibFᵀ = FibF := by
  unfold FibF
  exact FMatrix_transpose _ _

theorem FibF_orthogonal :
    FibFᵀ * FibF = 1 := by
  unfold FibF
  exact fibonacci_F_orthogonal_from_sqrt_parameter
    (Real.sq_sqrt phi_inv_nonneg)

theorem FibF_involutive :
    FibF * FibF = 1 := by
  unfold FibF
  exact fibonacci_F_involutive_from_sqrt_parameter
    (Real.sq_sqrt phi_inv_nonneg)

end

end Fibonacci
end CFTAnyons
