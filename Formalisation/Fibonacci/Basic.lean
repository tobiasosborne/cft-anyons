import Mathlib

/-!
Exact algebraic checks for the Fibonacci constants used in the handoff.

Source provenance:
* `handoff.md`, section 9.1.
* `references/text/FibonacciAnyonModels.txt`, lines 216-218.
* `references/text/TrebstShortIntroductionFibonacciAnyons.txt`, line 217.

Cross-references to GLOSSARY.md:
* `def:phi` — golden ratio `varphi := (1 + sqrt 5) / 2` with `varphi^2 = varphi + 1`
  (`GLOSSARY.md:997`; canonical `summary.tex:1013`). The Lean `def φ` at
  body line 17 of this file (`(1 + Real.sqrt 5) / 2`) is the literal
  realisation of `varphi`; `theorem phi_sq` (body line 22) is the literal
  realisation of `varphi^2 = varphi + 1`. The GLOSSARY entry's CAD
  translation map at `GLOSSARY.md:1017` names this exact file verbatim
  ("`Fibonacci/Basic.lean` (Phase 5 P5.7) — all golden-ratio identities
  from `summary.tex lem:fib-arith` proved (`phi^{-1} = phi - 1`,
  `phi^{-2} = 2 - phi`, `phi^{-2} + phi^{-1} = 1`, `2 phi^{-2} + phi^{-3} = 1`)")
  — this commit lands all four identities as named theorems:
  `theorem phi_inv`, `theorem phi_inv_sq`, `theorem phi_inv_sq_plus_inv`,
  and `theorem two_phi_inv_sq_plus_phi_inv_cubed`. The GLOSSARY
  pre-binding for `def:phi` is FULLY satisfied — verbatim and
  load-bearing.

* `def:qdim` — Quantum dimension `d_a` and total quantum dimension `D`
  (`GLOSSARY.md:391`; canonical `summary.tex` quantum-dimension
  definition). The Lean `def Dsq := 1 + φ^2` and `theorem
  Dsq_eq_two_plus_phi : Dsq = 2 + φ` realise the Fibonacci-instance
  half of the GLOSSARY pre-binding at `GLOSSARY.md:398` (verbatim:
  "Fibonacci-specific case in `Fibonacci/Basic.lean` (Phase 5 P5.7) —
  `d_tau = phi`, `D^2 = 2 + phi` proved"). Coverage is PARTIAL: this
  commit lands the `D^2 = 2 + phi` half; `d_tau = phi` is NOT stated as
  a named theorem here because there is no abstract quantum-dimension
  type in CAD (per `GLOSSARY.md:398`: the "abstract `d_a d_b =
  Σ_c N^c_{ab} d_c` is not formalised"). The pre-binding's `D^2 = 2 + phi`
  half is verbatim and load-bearing; the `d_tau = phi` half is satisfied
  by reading off the `Dsq := 1 + φ^2` definition (i.e. `d_tau^2 = φ^2`
  yields `d_tau = φ` since `d_tau > 0`).

  Cross-reference: the Fibonacci fusion category `def:fib` itself is NOT
  defined in this file — that pre-binding (`GLOSSARY.md:989`) names
  `Fibonacci/FusionRules.lean::fibSkeletalFusionData` (P5.9). However,
  `def:fib`'s Notes (`GLOSSARY.md:992`) state "The quantum dimension
  `d_tau = varphi` uses [[def:phi]]" — this file supplies both the
  [[def:phi]] infrastructure (`def φ` + `theorem phi_sq`) and the
  `D^2 = 2 + φ` algebra that the P5.9 `def:fib` realisation will
  consume.

Documentation cross-reference (NOT a D-gate pre-binding):

* `conv:basics` (`GLOSSARY.md:130`; canonical `summary.tex:76`) is a
  notation block, not a definition (per `GLOSSARY.md:160` verbatim:
  "`conv:basics` is a notation block, not a definition") and has no
  Lean realisation. The theorem names `pf_vacuum_normalisation` and
  `pf_tau_normalisation` borrow the "vacuum simple / tau simple"
  naming convention from `conv:basics` (and from the Fibonacci fusion
  data `def:fib`), but their proofs are pure algebra over the real
  `Dsq = 1 + φ^2`: `pf_vacuum_normalisation` proves the row sum
  `(d_1^2, d_tau^2) / D^2 = (1, phi^2) / Dsq = 1`,
  `pf_tau_normalisation` the row sum `(d_1, d_1, d_tau) / D^2 =
  (1, 1, phi) / Dsq = 1`. Together they encode the Perron–Frobenius
  eigenvector property of the fusion matrix `N_tau`, but this is a
  documentation observation about how the named theorems will be
  consumed in P5.9+; it is not a definitional dependency of this file
  on `conv:basics`.

2-way C-gate (Lean ↔ summary.tex Lemma `lem:fib-arith` at `summary.tex:1020`)
============================================================================

MIGRATION_PLAN.md:218 prescribes a 3-way C-gate for P5.7 (Lean / summary.tex
Lem 7.3 / Wolfram `fibonacci_checks.wls`). The Wolfram leg is not yet
available in cft-anyons (Phase 6 work; tracked in a Phase-6 bd follow-up
filed in this commit). The 2-way C-gate (Lean ↔ summary.tex Lemma
`lem:fib-arith`) is hereby executed in full:

`lem:fib-arith` at `summary.tex:1020-1027` (verbatim transcription):

  varphi^{-1} = varphi - 1,        (sub-claim A)
  varphi^{-2} = 2 - varphi,        (sub-claim B)
  varphi^{-2} + varphi^{-1} = 1,   (sub-claim C)
  2 varphi^{-2} + varphi^{-3} = 1. (sub-claim D)

Per-sub-claim Lean correspondence:

* Sub-claim A: `theorem phi_inv : φ⁻¹ = φ - 1` (this file body line 32).
  MATCH: literal symbolic identity (`varphi^{-1} = varphi - 1`); proved via
  `phi * (phi - 1) = 1` (by `nlinarith [phi_sq]`) then
  `inv_eq_of_mul_eq_one_right`. CAD-supplied proof; no drift.

* Sub-claim B: `theorem phi_inv_sq : φ⁻¹ ^ 2 = 2 - φ` (body line 41).
  MATCH: literal symbolic identity (`varphi^{-2} = 2 - varphi`); proved
  by `rw [phi_inv]; nlinarith [phi_sq]` — i.e., reduced to sub-claim A
  then closed by `nlinarith` using `phi_sq` as hypothesis. No drift.

* Sub-claim C: `theorem phi_inv_sq_plus_inv : φ⁻¹ ^ 2 + φ⁻¹ = 1`
  (body line 37). MATCH: literal symbolic identity
  (`varphi^{-2} + varphi^{-1} = 1`); proved by `rw [phi_inv]; nlinarith
  [phi_sq]`. No drift.

* Sub-claim D: `theorem two_phi_inv_sq_plus_phi_inv_cubed :
  2 * φ⁻¹ ^ 2 + φ⁻¹ ^ 3 = 1`. MATCH: literal symbolic identity
  (`2 varphi^{-2} + varphi^{-3} = 1`); proved by `rw [phi_inv];
  nlinarith [phi_sq]` (identical tactic to sub-claims B + C). The
  underlying mathematical derivation (per `summary.tex:1037-1043`) is
  the B + C chain: multiply sub-claim C by `varphi^{-1}` to get
  `varphi^{-3} + varphi^{-2} = varphi^{-1}`, then add sub-claim C to
  obtain `2 varphi^{-2} + varphi^{-3} = varphi^{-2} + varphi^{-1} = 1`.
  `nlinarith` discovers this chain automatically from `phi_sq` after the
  `rw [phi_inv]` reduction. No drift.

C-gate result: CLEARED. No discrepancy between any Lean decl and the
corresponding `summary.tex lem:fib-arith` sub-claim. The Wolfram leg is
deferred to Phase 6 (`scripts/wolfram/fibonacci_checks.wls`), tracked in a
bd follow-up filed in this commit.
-/

namespace CFTAnyons
namespace Fibonacci

noncomputable section

def φ : ℝ := (1 + Real.sqrt 5) / 2

theorem sqrt5_sq : (Real.sqrt 5) ^ 2 = (5 : ℝ) := by
  exact Real.sq_sqrt (show (0 : ℝ) ≤ 5 by norm_num)

theorem phi_sq : φ ^ 2 = φ + 1 := by
  unfold φ
  nlinarith [sqrt5_sq]

theorem phi_pos : 0 < φ := by
  unfold φ
  positivity

theorem phi_ne_zero : φ ≠ 0 := ne_of_gt phi_pos

theorem phi_inv : φ⁻¹ = φ - 1 := by
  have hmul : φ * (φ - 1) = 1 := by
    nlinarith [phi_sq]
  exact inv_eq_of_mul_eq_one_right hmul

theorem phi_inv_sq_plus_inv : φ⁻¹ ^ 2 + φ⁻¹ = 1 := by
  rw [phi_inv]
  nlinarith [phi_sq]

theorem phi_inv_sq : φ⁻¹ ^ 2 = 2 - φ := by
  rw [phi_inv]
  nlinarith [phi_sq]

theorem two_phi_inv_sq_plus_phi_inv_cubed :
    2 * φ⁻¹ ^ 2 + φ⁻¹ ^ 3 = 1 := by
  rw [phi_inv]
  nlinarith [phi_sq]

def Dsq : ℝ := 1 + φ ^ 2

theorem Dsq_eq_two_plus_phi : Dsq = 2 + φ := by
  unfold Dsq
  nlinarith [phi_sq]

theorem Dsq_pos : 0 < Dsq := by
  unfold Dsq
  positivity

theorem pf_vacuum_normalisation :
    (1 : ℝ) / Dsq + φ ^ 2 / Dsq = 1 := by
  unfold Dsq
  field_simp [show 1 + φ ^ 2 ≠ 0 by positivity]

theorem pf_tau_normalisation :
    (1 : ℝ) / Dsq + 1 / Dsq + φ / Dsq = 1 := by
  rw [Dsq_eq_two_plus_phi]
  have hden : (2 : ℝ) + φ ≠ 0 := by nlinarith [phi_pos]
  field_simp [hden]
  ring

end

end Fibonacci
end CFTAnyons
