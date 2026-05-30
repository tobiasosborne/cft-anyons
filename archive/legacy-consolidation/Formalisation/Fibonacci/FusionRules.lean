import Mathlib
import Formalisation.Foundations.SkeletalFusion
import Formalisation.Fibonacci.Basic

/-!
Finite skeletal Fibonacci fusion rules.

This file formalises the multiplicity-free fusion table

* `1 ⊗ 1 = 1`,
* `1 ⊗ τ = τ`,
* `τ ⊗ 1 = τ`,
* `τ ⊗ τ = 1 ⊕ τ`.

Source provenance:
* `references/text/FibonacciAnyonModels.txt:127-135` (Rowell, "A Short
  Introduction to Fibonacci Anyon Models") — verbatim source of the
  Fibonacci particle types `{1, τ}` and the three non-trivial fusion
  rules `1 ⊗ τ = τ`, `τ ⊗ 1 = τ`, `τ ⊗ τ = 1 ⊕ τ`. The trivial
  `1 ⊗ 1 = 1` is the unital case of `1 ⊗ x = x` at line 127.
* `summary.tex:1003-1009` (`def:fib`) — the canonical fusion-category
  statement; verbatim listed below as the C-gate target.

Port provenance: ported from
`cft-anyons-deprecated/Formalisation/Fibonacci/FusionRules.lean` (source
SHA256 `667e41f1fb7b64246237198b927eee0b77a19764abb13dc5c142d19b169fbfc9`,
124 LOC) at MIGRATION_PLAN.md:220 (P5.9). The body (the `inductive
FibLabel`, `fusionMultiplicity`, the 4 fusion-rule theorems
`fusion_one_one`/`fusion_one_tau`/`fusion_tau_one`/`fusion_tau_tau`, the
multiplicity-free theorem `fusion_multiplicity_le_one`, the total-row
sum theorem `fusion_tau_tau_total_multiplicity`, the
`fibSkeletalFusionData` instance, the three skeletal-instance derived
lemmas `fibSkeletalFusionData_multiplicityFree`/_`left_total`/_`right_total`,
and the Perron–Frobenius infrastructure `fibDim`/`tauFusionMatrix`/`sum_fibLabel`/
`tauFusionMatrix_mulVec_fibDim`) is byte-identical to CAD's source body
from `namespace CFTAnyons` (source line 18) to EOF; the only diff is
this top-of-file docstring extension. The CAD source's reference to
"`MASTER_PROVENANCE.md under EXT-FIB-001`" (source line 15) is a
CAD-internal artifact that does NOT exist in cft-anyons; replaced here
with the cft-anyons-canonical `references/text/FibonacciAnyonModels.txt`
+ `summary.tex:1003` citations.

Cross-references to GLOSSARY.md
================================

-- GLOSSARY: def:fib (GLOSSARY.md:961) — Fibonacci fusion category.
   The canonical statement at `summary.tex:1003-1009` defines `Fib` with
   `Irr(Fib) = {1, τ}` and the four fusion rules listed above, plus the
   multiplicity-free property `∀ a b c, N_{ab}^{c} ∈ {0, 1}`. This file
   is the GLOSSARY-pre-registered canonical CAD anchor for `def:fib` —
   verbatim per the Translation map CAD section at GLOSSARY.md:989:

     "CAD: `Fibonacci/FusionRules.lean::fibSkeletalFusionData` (Phase 5
     P5.9) — the unique instance of [[def:fuscat]]'s CAD equivalent for
     Fibonacci. Per `stocktake/reports/cad-lean.md` §5 line 345: fusion
     rules complete; post-decoupling required for
     `Foundations/Configurations.lean` circular import (handled by P5.3
     before P5.9)."

   Per-promise correspondence (every load-bearing claim of `def:fib`
   mapped to a specific named decl realising it):

   * "`Irr(Fib) = {1, τ}`" → `inductive FibLabel where | one | tau`
     (body line 282); the `deriving DecidableEq, Fintype, Repr` gives
     `Fintype FibLabel` (and the cardinality `Fintype.card FibLabel = 2`
     follows by `decide`), realising the two-simple finite irreducibles
     set.

   * "`1 ⊗ 1 = 1`" → `theorem fusion_one_one` (body line 297):
     `fusionMultiplicity one one one = 1 ∧ fusionMultiplicity one one
     tau = 0` — the two equalities jointly fix the `τ`-channel and the
     `1`-channel of `1 ⊗ 1`, i.e. `N^{1}_{1,1} = 1` and
     `N^{τ}_{1,1} = 0` (so `1 ⊗ 1 = 1`).

   * "`1 ⊗ τ = τ`" → `theorem fusion_one_tau` (body line 302):
     `fusionMultiplicity one tau tau = 1 ∧ fusionMultiplicity one tau
     one = 0` — fixes `N^{τ}_{1,τ} = 1` and `N^{1}_{1,τ} = 0` (so
     `1 ⊗ τ = τ`).

   * "`τ ⊗ 1 = τ`" → `theorem fusion_tau_one` (body line 307):
     `fusionMultiplicity tau one tau = 1 ∧ fusionMultiplicity tau one
     one = 0` — fixes `N^{τ}_{τ,1} = 1` and `N^{1}_{τ,1} = 0` (so
     `τ ⊗ 1 = τ`).

   * "`τ ⊗ τ = 1 ⊕ τ`" → `theorem fusion_tau_tau` (body line 312):
     `fusionMultiplicity tau tau one = 1 ∧ fusionMultiplicity tau tau
     tau = 1` — fixes `N^{1}_{τ,τ} = 1` and `N^{τ}_{τ,τ} = 1` (so
     `τ ⊗ τ = 1 ⊕ τ`, two distinct fusion channels each with
     multiplicity one). Cross-checked by `theorem
     fusion_tau_tau_total_multiplicity` (body line 321):
     `(∑ c, fusionMultiplicity tau tau c) = 2`, the integer
     total-channel count for `τ ⊗ τ`.

   * "Fibonacci is multiplicity-free: every `N_{ab}^{c} ∈ {0, 1}`" →
     `theorem fusion_multiplicity_le_one (a b c : FibLabel) :
     fusionMultiplicity a b c ≤ 1` (body line 317), realising the
     intrinsic `MultiplicityFree` property of [[def:fuscat]] +
     CONVENTIONS (d) in the Fibonacci instance. The instance-side
     restatement `fibSkeletalFusionData_multiplicityFree :
     fibSkeletalFusionData.MultiplicityFree` (body line 336) lifts
     `fusion_multiplicity_le_one` onto the `fibSkeletalFusionData`
     structure via `FiniteSkeletalFusionData.MultiplicityFree`.

   * "the unique instance of [[def:fuscat]]'s CAD equivalent for
     Fibonacci" → `def fibSkeletalFusionData : Foundations.FiniteSkeletalFusionData`
     (body line 325) bundles `FibLabel` (Label, with `Fintype` +
     `DecidableEq` via `deriving`), `unit := one` (the categorical
     vacuum at the 1-indexed first position per CONVENTIONS (a)), and
     `fusionMultiplicity := fusionMultiplicity` (the integer fusion
     table), proving the `leftUnit` and `rightUnit` field equations
     `∀ a c, fusionMultiplicity unit a c = if c = a then 1 else 0` /
     `∀ a c, fusionMultiplicity a unit c = if c = a then 1 else 0` by
     `fin_cases a <;> fin_cases c <;> simp [fusionMultiplicity]`. The
     two ancillary skeletal-instance lemmas
     `fibSkeletalFusionData_left_total` and
     `fibSkeletalFusionData_right_total` (body lines 341 + 346) restate
     the structure's `total_leftUnit` + `total_rightUnit` (the unital
     row sums `∑_c N_{1,a}^{c} = 1 = ∑_c N_{a,1}^{c}` from
     `Foundations/SkeletalFusion.lean`) on the Fibonacci instance.

   Disavowals (per the orchestrator-flagged P5.7-reviewer lesson against
   over-claiming GLOSSARY slugs as `def:fib` realisations):

   * `inductive FibLabel` is the underlying TWO-ELEMENT label TYPE, the
     carrier of the simples set; it is named-but-bundled-INTO the
     `fibSkeletalFusionData.Label` field that load-bears `def:fib`. By
     itself `FibLabel` is the data-only carrier — the categorical
     content "this is the simples set of the Fibonacci fusion category"
     is supplied by `fibSkeletalFusionData`. (We do still cite
     `FibLabel` above as realising `Irr(Fib) = {1, τ}` because the
     `FibLabel.one`/`FibLabel.tau` constructor names ARE the named
     simples; the carrier role is the literal realisation. But
     `FibLabel` is not by itself a categorical-content realisation —
     that role is `fibSkeletalFusionData`'s.)

   * `def fusionMultiplicity : FibLabel → FibLabel → FibLabel → Nat`
     (body line 289) is the raw integer fusion-multiplicity TABLE; it is
     CONSUMED-INTO `fibSkeletalFusionData.fusionMultiplicity` to realise
     `def:fib` and CONSUMED-INTO the 4 fusion-rule theorems
     `fusion_one_one`/`fusion_one_tau`/`fusion_tau_one`/`fusion_tau_tau`
     which realise the four fusion rules of `def:fib`. By itself
     `fusionMultiplicity` is supporting infrastructure (a function
     definition before any theorems are stated about it).

   * `theorem fusion_tau_tau_total_multiplicity` (body line 321) is a
     cross-check by an independent route (`decide` over the finite
     sum), NOT a direct realisation of a `def:fib` claim — it confirms
     the *total* `(∑_c N^c_{τ,τ}) = 2` rather than the *per-channel*
     `N^{1}_{τ,τ} = 1 ∧ N^{τ}_{τ,τ} = 1` (which is `fusion_tau_tau`'s
     job). Supporting / corroborating, not load-bearing.

   * `def fibDim : FibLabel → ℝ` (body line 354), `def tauFusionMatrix
     : Matrix FibLabel FibLabel ℝ` (body line 360), `lemma
     sum_fibLabel` (body line 363), and `theorem
     tauFusionMatrix_mulVec_fibDim` (body line 370) are the
     Perron–Frobenius dimension infrastructure for the Fibonacci `τ`
     fusion matrix — Fibonacci-instance content of [[def:qdim]] /
     [[def:PF]], NOT of `def:fib`. They live in this file (as in
     CAD's source) because they consume the fusion table from
     `fusionMultiplicity` directly. See the `def:qdim` dependency
     cross-reference below.

-- GLOSSARY: def:fuscat (GLOSSARY.md:207) — Fusion category.
   This is a DEPENDENCY cross-reference, NOT a pre-binding: the
   `def:fuscat` pre-bound CAD anchor at GLOSSARY.md:253 is
   `Foundations/SkeletalFusion.lean::FiniteSkeletalFusionData` (the
   abstract skeletal-coordinate structure, ported at P5.1).
   `fibSkeletalFusionData` in this file is the unique Fibonacci
   INSTANCE of that structure — realising clauses (i) finite simples,
   (ii) distinguished unit `1 ∈ Irr(C)`, and (vi) integer fusion
   multiplicities of `def:fuscat` for the Fibonacci data. Clauses
   (iii) Hom-spaces, (iv) tensor / monoidal, (v) biproducts, and (vii)
   rigid duals remain OUT OF SCOPE at this skeletal-coordinate level
   (per the same disclaimer at `Foundations/SkeletalFusion.lean`
   docstring lines 5–10 / `GLOSSARY.md:253`).

-- GLOSSARY: def:phi (GLOSSARY.md:997) — Golden ratio.
   DEPENDENCY cross-reference: `def fibDim : FibLabel → ℝ` returns
   `φ` (the Fibonacci anyon quantum dimension `d_τ = φ`) for the `tau`
   label; the named theorem `tauFusionMatrix_mulVec_fibDim` uses
   `phi_sq : φ^2 = φ + 1` (P5.7) as the algebraic core of the
   Perron–Frobenius eigenvector identity for the `τ` fusion matrix
   `N_τ`. The `def:phi` slug is already FULLY discharged at P5.7
   (`Fibonacci/Basic.lean`).

-- GLOSSARY: def:qdim (GLOSSARY.md:391) — Quantum dimension.
   DEPENDENCY cross-reference: `fibDim` is the Fibonacci-instance
   quantum dimension function `d_a` on `Irr(Fib)`, returning `1` for
   the vacuum and `φ` for `τ`. `tauFusionMatrix` is the categorical
   fusion matrix `N_τ` (rows = output label, columns = input label);
   `theorem tauFusionMatrix_mulVec_fibDim : tauFusionMatrix.mulVec
   fibDim = fun c => φ * fibDim c` is the Perron–Frobenius eigenvector
   identity `N_τ · d = φ · d` for the dimension vector `d = (1, φ)`,
   the Fibonacci-instance witness of [[def:qdim]]'s
   `d_a d_b = ∑_c N^c_{ab} d_c` at `b = τ` (the row equations being
   `1 · φ = N^{1}_{1,τ} · 1 + N^{τ}_{1,τ} · φ = 0 + φ = φ` and
   `φ · φ = N^{1}_{τ,τ} · 1 + N^{τ}_{τ,τ} · φ = 1 + φ = φ^2`). The
   `D^2 = 1 + φ^2 = 2 + φ` half of [[def:qdim]]'s Fibonacci-instance
   pre-binding (per GLOSSARY.md:398) was discharged at P5.7
   (`Dsq_eq_two_plus_phi`).

Documentation cross-references (NOT D-gate pre-bindings):

* CONVENTIONS.md (a) vacuum-index at CONVENTIONS.md:69 — the canonical
  1-indexed vacuum-at-first-position choice. The `fibSkeletalFusionData`
  field `unit := one` selects `FibLabel.one` as the categorical vacuum,
  which is the first constructor of the `inductive FibLabel` (lexical
  order matches the listed order `1 < τ`). This is a representational
  choice, not a definitional claim about the Fibonacci anyon model
  (the model is symmetric in the labels modulo the choice of which
  label is the unit; the convention pins down the choice).

* CONVENTIONS.md (d) multiplicity-free at CONVENTIONS.md (around the
  `multiplicity-free` (d) entry) — Fibonacci is multiplicity-free per
  `def:fib`'s closing sentence; realised here by
  `fusion_multiplicity_le_one` (and by
  `fibSkeletalFusionData_multiplicityFree`). The multiplicity-free
  assumption underlies `def:splitbasis` and the LB-1 / MMA
  `enumerate_fusion_trees` validity scope (per [[def:fib]] Notes at
  GLOSSARY.md:990).

2-way C-gate (Lean ↔ summary.tex def:fib at summary.tex:1003)
==============================================================

MIGRATION_PLAN.md:220 prescribes `M, D, C` for P5.9 without naming a
specific Wolfram script. Per the P5.7 + P5.8 canonical pattern (3-way
for Fibonacci-fusion-category content with the Wolfram leg deferred to
Phase 6), the 2-way C-gate (Lean ↔ summary.tex `def:fib`) is executed
here in full; the 3-way Wolfram leg is filed as a bd follow-up.

`def:fib` at `summary.tex:1003-1009` (verbatim transcription):

  Fib has Irr(Fib) = {1, τ} with fusion rules
    1 ⊗ 1 = 1,    (sub-claim A; trivial unital case of "1 ⊗ x = x")
    1 ⊗ τ = τ,    (sub-claim B; unital left)
    τ ⊗ 1 = τ,    (sub-claim C; unital right)
    τ ⊗ τ = 1 ⊕ τ. (sub-claim D; the unique non-trivial fusion rule)
  Fibonacci is multiplicity-free: every N_{ab}^{c} ∈ {0, 1}.
                                                  (sub-claim E)

Per-sub-claim Lean correspondence:

* Sub-claim A (`1 ⊗ 1 = 1`): `theorem fusion_one_one` (body line 297).
  MATCH: the conjunction `N^{1}_{1,1} = 1 ∧ N^{τ}_{1,1} = 0` jointly
  fixes the unique fusion channel `1 ⊗ 1 = 1` with multiplicity one
  and rules out any `τ`-channel.

* Sub-claim B (`1 ⊗ τ = τ`): `theorem fusion_one_tau` (body line 302).
  MATCH: the conjunction `N^{τ}_{1,τ} = 1 ∧ N^{1}_{1,τ} = 0` fixes the
  unital-left rule.

* Sub-claim C (`τ ⊗ 1 = τ`): `theorem fusion_tau_one` (body line 307).
  MATCH: the conjunction `N^{τ}_{τ,1} = 1 ∧ N^{1}_{τ,1} = 0` fixes the
  unital-right rule.

* Sub-claim D (`τ ⊗ τ = 1 ⊕ τ`): `theorem fusion_tau_tau` (body line
  312). MATCH: the conjunction `N^{1}_{τ,τ} = 1 ∧ N^{τ}_{τ,τ} = 1`
  encodes the direct-sum decomposition `τ ⊗ τ = 1 ⊕ τ` (two distinct
  channels each with multiplicity one). Corroborated by the
  independent-route `theorem fusion_tau_tau_total_multiplicity` (body
  line 321) which computes `(∑_c N^c_{τ,τ}) = 2` by `decide`,
  matching the dimension `dim(1 ⊕ τ) = 2` channels for `τ ⊗ τ`.

* Sub-claim E (multiplicity-free): `theorem fusion_multiplicity_le_one`
  (body line 317). MATCH: `∀ a b c, N_{ab}^{c} ≤ 1` is the literal
  `N_{ab}^{c} ∈ {0, 1}` formulation since `N_{ab}^{c} : Nat` (so
  `N ≤ 1 ↔ N = 0 ∨ N = 1`). Lifted onto `fibSkeletalFusionData` by
  `fibSkeletalFusionData_multiplicityFree` (body line 336).

C-gate result: CLEARED. All 5 sub-claims of `def:fib` realised by named
theorems with literal matches; the `fibSkeletalFusionData` instance
bundles them onto `Foundations.FiniteSkeletalFusionData`. The Wolfram
leg is deferred to Phase 6 (`scripts/wolfram/fibonacci_fusion_rules.wls`),
tracked in a bd follow-up filed in this commit.
-/

namespace CFTAnyons
namespace Fibonacci

noncomputable section

inductive FibLabel where
  | one
  | tau
deriving DecidableEq, Fintype, Repr

open FibLabel

def fusionMultiplicity : FibLabel → FibLabel → FibLabel → Nat
  | one, one, one => 1
  | one, tau, tau => 1
  | tau, one, tau => 1
  | tau, tau, one => 1
  | tau, tau, tau => 1
  | _, _, _ => 0

theorem fusion_one_one :
    fusionMultiplicity one one one = 1 ∧
      fusionMultiplicity one one tau = 0 := by
  simp [fusionMultiplicity]

theorem fusion_one_tau :
    fusionMultiplicity one tau tau = 1 ∧
      fusionMultiplicity one tau one = 0 := by
  simp [fusionMultiplicity]

theorem fusion_tau_one :
    fusionMultiplicity tau one tau = 1 ∧
      fusionMultiplicity tau one one = 0 := by
  simp [fusionMultiplicity]

theorem fusion_tau_tau :
    fusionMultiplicity tau tau one = 1 ∧
      fusionMultiplicity tau tau tau = 1 := by
  simp [fusionMultiplicity]

theorem fusion_multiplicity_le_one (a b c : FibLabel) :
    fusionMultiplicity a b c ≤ 1 := by
  fin_cases a <;> fin_cases b <;> fin_cases c <;> simp [fusionMultiplicity]

theorem fusion_tau_tau_total_multiplicity :
    (∑ c : FibLabel, fusionMultiplicity tau tau c) = 2 := by
  decide

def fibSkeletalFusionData : Foundations.FiniteSkeletalFusionData where
  Label := FibLabel
  unit := one
  fusionMultiplicity := fusionMultiplicity
  leftUnit := by
    intro a c
    fin_cases a <;> fin_cases c <;> simp [fusionMultiplicity]
  rightUnit := by
    intro a c
    fin_cases a <;> fin_cases c <;> simp [fusionMultiplicity]

theorem fibSkeletalFusionData_multiplicityFree :
    fibSkeletalFusionData.MultiplicityFree := by
  intro a b c
  exact fusion_multiplicity_le_one a b c

theorem fibSkeletalFusionData_left_total (a : FibLabel) :
    fibSkeletalFusionData.totalFusionMultiplicity
      fibSkeletalFusionData.unit a = 1 :=
  fibSkeletalFusionData.total_leftUnit a

theorem fibSkeletalFusionData_right_total (a : FibLabel) :
    fibSkeletalFusionData.totalFusionMultiplicity
      a fibSkeletalFusionData.unit = 1 :=
  fibSkeletalFusionData.total_rightUnit a

/-! Frobenius-Perron dimension checks for the Fibonacci fusion matrix. -/

/-- Fibonacci Frobenius-Perron dimensions in the skeletal two-label model. -/
def fibDim : FibLabel → ℝ
  | one => 1
  | tau => φ

/-- The fusion matrix for tensoring by `τ`, with rows indexed by output labels
and columns indexed by input labels. -/
def tauFusionMatrix : Matrix FibLabel FibLabel ℝ :=
  fun c b => (fusionMultiplicity tau b c : ℝ)

lemma sum_fibLabel (f : FibLabel → ℝ) :
    (∑ x : FibLabel, f x) = f one + f tau := by
  rw [show (Finset.univ : Finset FibLabel) = {one, tau} by decide]
  simp

/-- The dimension vector `(1, φ)` is a Perron-Frobenius eigenvector for the
Fibonacci `τ` fusion matrix, with eigenvalue `φ`. -/
theorem tauFusionMatrix_mulVec_fibDim :
    tauFusionMatrix.mulVec fibDim = fun c => φ * fibDim c := by
  ext c
  fin_cases c
  · simp [tauFusionMatrix, fibDim, Matrix.mulVec, dotProduct, sum_fibLabel,
      fusionMultiplicity]
  · simp [tauFusionMatrix, fibDim, Matrix.mulVec, dotProduct, sum_fibLabel,
      fusionMultiplicity]
    nlinarith [phi_sq]

end

end Fibonacci
end CFTAnyons
