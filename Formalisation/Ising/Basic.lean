import Mathlib

/-!
Finite skeletal Ising fusion rules and the scalar toy exponent.

The local physics source writes the third Ising label as `ψ`; the handoff uses
`epsilon`.  This file uses `epsilon` and records only the finite fusion table
and rational arithmetic used by the secondary toy check.

Source provenance:
* CAD: `cft-anyons-deprecated/Formalisation/Ising/Basic.lean`
  (SHA256: `a8c43300f9da46f548981ae042ebcff8e360b9dfcee05ae3372ea11e9c0486cb`).
* Migration step: Phase 5 P5.15 (per `MIGRATION_PLAN.md:226`).
* Predecessor: P5.14 (`Fibonacci/RGNoMixing.lean`, the last per-file
  Fibonacci-block port). This is the FIRST and (at the present scope) ONLY
  per-file Ising-block port — see `stocktake/reports/cad-lean.md` §4 line 346
  for confirmation that CAD's only Ising-block file is this one (the F-symbol
  `def:ising-F` and the Kitaev-Wang isomorphism are NOT formalised in CAD).
* Source acquisition for the conformal weights `Δ_σ = 1/8`, `Δ_ε = 1`:
  Belavin–Polyakov–Zamolodchikov 1984 (the original Ising-CFT conformal-weight
  computation) and `references/text/FibonacciAnyonModels.txt` (Trebst review,
  Section 2.1 introduces the analogous Fibonacci anyon conformal-weight scheme
  that the present file's Ising-rational `DeltaSigma`, `DeltaEpsilon` parallel).
  The Ising-specific weights `Δ_σ = 1/8`, `Δ_ε = 1` are textbook Ising-CFT
  (any standard CFT text — di Francesco–Mathieu–Sénéchal, Ginsparg lectures,
  etc.); the present file does not cite a specific local reference because the
  scalar rational identity `Δ_ε - 2 Δ_σ = 3/4` is a numerical fact that
  `norm_num` discharges directly from the definitions.

Cross-references to GLOSSARY.md:
* `def:ising` — Ising fusion category (`GLOSSARY.md:1247`; canonical
  `summary.tex:1598`). The GLOSSARY pre-binding at `GLOSSARY.md:1279` is
  reproduced verbatim (INCLUDING the Caveat) for context:

    > CAD: `Ising/Basic.lean` (Phase 5 P5.15) — fusion table proved;
    > conformal weights `Δ_σ = 1/8`, `Δ_ε = 1` proved. **Caveat per
    > `stocktake/reports/cad-lean.md` §5 line 346 + §4 'State Assessment'**:
    > CAD's Ising file is NOT currently connected to `FiniteSkeletalFusionData`
    > (no `isingSkeletalFusionData` instance analogous to `fibSkeletalFusionData`).
    > P5.15 must either add the connection or file a follow-up task.

  The orchestrator has chosen **option (b)**: this commit ports the CAD file
  verbatim and DEFERS the `isingSkeletalFusionData` instance construction.
  Tracking: bd issue `cft-anyons-5tm.25` ("Add isingSkeletalFusionData instance
  to Ising/Basic.lean (P5.15 deferral)") and `RESEARCH_NOTES.md` §"Deferred
  decisions" entry `DD-1`. The deferred follow-up will add (analogous to
  `Fibonacci/FusionRules.lean::fibSkeletalFusionData` at
  `Formalisation/Fibonacci/FusionRules.lean:325`):
  - `def isingSkeletalFusionData : Foundations.FiniteSkeletalFusionData`
    with `Label := IsingLabel`, `unit := one`,
    `fusionMultiplicity := fusionMultiplicity`, plus `leftUnit`/`rightUnit`
    fields discharged by `fin_cases a <;> fin_cases c <;> simp`.
  - `theorem isingSkeletalFusionData_multiplicityFree`,
    `_left_total`, `_right_total`.

  At the present scope (P5.15), the GLOSSARY pre-binding's two CONCRETE
  promised content claims — "fusion table proved" and "conformal weights
  `Δ_σ = 1/8`, `Δ_ε = 1` proved" — are FULLY satisfied:
  - **"Fusion table proved"** is realised by the per-channel theorems
    `fusion_sigma_sigma` (body line 34), `fusion_sigma_epsilon` (body line 40),
    `fusion_epsilon_sigma` (body line 46), `fusion_epsilon_epsilon` (body
    line 52), and the unit-action theorems `fusion_unit_left` (body line 58),
    `fusion_unit_right` (body line 62), together with the multiplicity-free
    theorem `fusion_multiplicity_le_one` (body line 66) and the sigma-channel
    total `fusion_sigma_sigma_total_multiplicity` (body line 70). Reading
    these against the GLOSSARY canonical (`GLOSSARY.md:1252-1257`, verbatim
    transcribed below) shows literal match:
    * `σ ⊗ σ = 1 ⊕ ψ` ↔ `fusion_sigma_sigma`'s
      `fusionMultiplicity sigma sigma one = 1 ∧ ... epsilon = 1 ∧ ... sigma = 0`.
    * `σ ⊗ ψ = ψ ⊗ σ = σ` ↔ `fusion_sigma_epsilon` + `fusion_epsilon_sigma`
      (both yielding `... sigma = 1` and the other two channels zero).
    * `ψ ⊗ ψ = 1` ↔ `fusion_epsilon_epsilon`'s `... one = 1` (plus the other
      two channels zero).
    * Unit object satisfies `1 ⊗ a = a ⊗ 1 = a` (the canonical's implicit
      unit clause) ↔ `fusion_unit_left a` and `fusion_unit_right a`.
    The `ψ ↔ ε` (`psi ↔ epsilon`) notation mapping is the third-label
    relabelling explicitly documented in the file's top docstring (see the
    "ε vs ψ notation" paragraph below). This is a presentation choice, not
    a mathematical disagreement.
  - **"Conformal weights `Δ_σ = 1/8`, `Δ_ε = 1` proved"** is realised by the
    rational definitions `DeltaSigma : ℚ := 1/8` (body line 74) and
    `DeltaEpsilon : ℚ := 1` (body line 76), and by the derived scalar
    identity `sigma_sigma_to_epsilon_exponent` (body line 78) which asserts
    `DeltaEpsilon - 2 * DeltaSigma = 3/4` (the conformal-weight content of
    the σ × σ → ε OPE exponent). The bare `Δ_σ = 1/8` and `Δ_ε = 1` numerical
    facts are then `rfl` from the definitions, and `sigma_sigma_to_epsilon_exponent`
    is the only nontrivial named identity that combines them.

  The deferred `isingSkeletalFusionData` connection (per option (b) above)
  pertains to the GLOSSARY pre-binding's CAVEAT clause — not to its two
  CONCRETE content claims. Those two CONCRETE content claims are satisfied
  by THIS commit.

Documentation cross-references (NOT D-gate pre-bindings):

* `def:ising-F` (`GLOSSARY.md:1287`; canonical `summary.tex` Definition
  immediately following `def:ising`) is the Ising F-symbol
  `F^{σσσ}_σ = (1/√2) * [[1,1],[1,-1]]`. The present file does NOT define or
  prove anything about the Ising F-symbol; CAD does not formalise it (per
  `stocktake/reports/cad-lean.md` §4 'State Assessment'). Listed here purely
  as a documentation reminder of the natural next-step file that a future
  `Ising/FSymbol.lean` would house. No claim of D-gate coverage.

* `def:fib-mult` and `def:fuscat` are the abstract fusion-category /
  multiplication slugs that THIS file's structure is a concrete instance of.
  Listed here as conceptual ancestry; the abstract structure `Foundations.
  FiniteSkeletalFusionData` (P5.1) is the Lean realisation. THIS file does
  not import that structure (per the deferral noted above); the abstract-to-
  concrete connection is the deferred work.

* `conv:basics` (`GLOSSARY.md:130`) — the notation block, not a definition
  (per `GLOSSARY.md:160` verbatim: "`conv:basics` is a notation block, not a
  definition"). The constructor names `one` / `sigma` / `epsilon` borrow
  standard Ising fusion-category labelling conventions but THIS file does
  not depend on `conv:basics` in any load-bearing way.

ε vs ψ notation (the file's own top docstring already states this)
==================================================================

CAD's local file docstring (preserved verbatim above as the file's `/-! ... -/`
header) explicitly flags:

  > The local physics source writes the third Ising label as `ψ`; the handoff
  > uses `epsilon`. This file uses `epsilon` ...

The GLOSSARY canonical (`summary.tex:1598` reproduced at `GLOSSARY.md:1252-1257`)
also writes `ψ`. CAD's choice of `epsilon` (matching the handoff doc) is the
CFT physics-literature convention where the energy-density primary is `ε` (or
sometimes `σ²` or `ψ`). The `ε`/`ψ` identification is well-known to Ising-CFT
practitioners; the present file's `IsingLabel.epsilon` is the same simple
object that the GLOSSARY canonical writes as `ψ`.

This naming choice is a documentation note (per CAD's docstring); it is NOT a
mathematical disagreement, NOT a CONVENTIONS-pre-bound clause, and NOT
gated through `CONVENTIONS.md` (no `conv:*` slug binds to this naming).
If a future commit lifts this into a CONVENTIONS-tracked notation rule, that
commit can also rename the constructor to `psi` if desired; the present file
preserves the CAD constructor name `epsilon` byte-for-byte.

2-way C-gate (Lean ↔ summary.tex `def:ising` at `summary.tex:1598`)
====================================================================

MIGRATION_PLAN.md:226 prescribes validation gates `M, D` for P5.15. The
present C-gate is therefore EXTRA-GATE coverage beyond what MIGRATION_PLAN
requires — included for parallel structure with P5.7-P5.14, and to
discharge the GLOSSARY pre-binding rigorously.

The 3-way Wolfram leg (a Wolfram-MMA cross-check of the fusion table
σ × σ = 1 ⊕ ε and the conformal weights Δ_σ = 1/8, Δ_ε = 1) is deferred
to Phase 6 — tracked in a Phase-6 bd follow-up filed in this commit.

2-way C-gate (Lean ↔ `summary.tex:1598` / `GLOSSARY.md:1247-1260`):

`def:ising` canonical (`GLOSSARY.md:1252-1257`, verbatim transcription):

    Ising has $\Irr(\Ising) = \{\one, \sigma, \psi\}$ with fusion
    σ ⊗ σ = 1 ⊕ ψ,
    σ ⊗ ψ = ψ ⊗ σ = σ,
    ψ ⊗ ψ = 1.
    Quantum dimensions: d_1 = d_ψ = 1, d_σ = √2 (from d_σ² = 1 + 1),
    total quantum dimension D = √(1 + 2 + 1) = 2.

Per-clause Lean correspondence (with the `ε ↔ ψ` relabelling above
applied throughout):

* "Irr(Ising) = {1, σ, ψ}" ↔ `inductive IsingLabel where | one | sigma
  | epsilon` (body line 16); the `Fintype` instance certifies the
  three-element character of the label set. MATCH: literal three-element
  type. Standard `inductive ... deriving Fintype`. No drift.

* "σ ⊗ σ = 1 ⊕ ψ" ↔ `theorem fusion_sigma_sigma` (body line 34): asserts
  the conjunction `fusionMultiplicity sigma sigma one = 1 ∧
  fusionMultiplicity sigma sigma epsilon = 1 ∧
  fusionMultiplicity sigma sigma sigma = 0`. The first two conjuncts encode
  the two summands of `1 ⊕ ψ`; the third encodes the absence of a `σ`
  channel. MATCH: literal symbolic identity. Proved by `simp
  [fusionMultiplicity]` against the `inductive`-pattern body of
  `fusionMultiplicity` (body line 24). The companion total
  `fusion_sigma_sigma_total_multiplicity` (body line 70) verifies that
  the sum of channel multiplicities equals 2 (matching `dim(1 ⊕ ψ) = 2`
  in fusion-category language). No drift.

* "σ ⊗ ψ = σ" ↔ `theorem fusion_sigma_epsilon` (body line 40): asserts
  `fusionMultiplicity sigma epsilon sigma = 1 ∧ ... one = 0 ∧ ... epsilon = 0`.
  MATCH: literal symbolic identity. Proved by `simp [fusionMultiplicity]`.
  No drift.

* "ψ ⊗ σ = σ" ↔ `theorem fusion_epsilon_sigma` (body line 46): asserts
  `fusionMultiplicity epsilon sigma sigma = 1 ∧ ... one = 0 ∧ ... epsilon = 0`.
  MATCH: literal symbolic identity (the right-counterpart of the σ × ψ
  identity, redundant in any symmetric fusion category but proven
  independently as a body sanity check). No drift.

* "ψ ⊗ ψ = 1" ↔ `theorem fusion_epsilon_epsilon` (body line 52): asserts
  `fusionMultiplicity epsilon epsilon one = 1 ∧ ... sigma = 0 ∧ ... epsilon = 0`.
  MATCH: literal symbolic identity. Proved by `simp [fusionMultiplicity]`.
  No drift.

* Unit object satisfies `1 ⊗ a = a ⊗ 1 = a` (the implicit unit-axiom
  clause of the canonical) ↔ `theorem fusion_unit_left (a : IsingLabel) :
  fusionMultiplicity one a a = 1` (body line 58) and `theorem
  fusion_unit_right (a : IsingLabel) : fusionMultiplicity a one a = 1`
  (body line 62). MATCH: per-`a` unit clause for both sides. Proved by
  `cases a <;> simp [fusionMultiplicity]`. No drift.

* Multiplicity-free (implicit in "Ising is multiplicity-free per P1.6(d)"
  noted at `GLOSSARY.md:1280`) ↔ `theorem fusion_multiplicity_le_one
  (a b c : IsingLabel) : fusionMultiplicity a b c ≤ 1` (body line 66).
  MATCH: literal multiplicity-free statement. Proved by `fin_cases a <;>
  fin_cases b <;> fin_cases c <;> simp [fusionMultiplicity]`. No drift.

* "d_σ = √2" — NOT proved as a named theorem here (no `dsigma` def in
  this file; per `GLOSSARY.md:398` analogue for Fibonacci, the abstract
  quantum-dimension theory is not formalised in CAD). The scalar
  `2 * DeltaSigma` (body line 79's appearance inside
  `sigma_sigma_to_epsilon_exponent`) is the related conformal-weight
  number `2 * (1/8) = 1/4`, NOT the quantum dimension. No drift; this is
  a documented gap per the GLOSSARY's Ising-side counterpart of `def:fib`
  Notes.

* Conformal weights `Δ_σ = 1/8`, `Δ_ε = 1` — these are NOT in the
  `def:ising` GLOSSARY canonical body (`summary.tex:1598`'s definition
  is purely the fusion/quantum-dim data), but ARE in the GLOSSARY
  translation-map line at `GLOSSARY.md:1279` ("conformal weights
  `Δ_σ = 1/8`, `Δ_ε = 1` proved"). Realised by `def DeltaSigma : ℚ := 1/8`
  (body line 74) and `def DeltaEpsilon : ℚ := 1` (body line 76); the
  exponent identity `DeltaEpsilon - 2 * DeltaSigma = 3/4` is named
  `sigma_sigma_to_epsilon_exponent` (body line 78), proved by
  `norm_num [DeltaEpsilon, DeltaSigma]`. MATCH: literal rational
  identity. No drift.

* The auxiliary scalar definitions and theorems
  `def toyNormNumerator (t : ℝ)` (body line 82),
  `theorem toyNormNumerator_eq (t : ℝ)` (body line 85),
  `theorem toyNormalisation (t : ℝ)` (body line 93) are NOT mentioned
  in `def:ising` or its GLOSSARY translation-map line. Per CAD's own
  file docstring (lines 4-9 above), they encode "rational arithmetic
  used by the secondary toy check" — a scalar normalisation identity
  `(1/√2)² + (1/√2)² + (t/2)²` divided by `(1 + t²/4)` equals 1, used
  by a downstream toy-Hamiltonian/Wolfram check (Phase 6 territory).
  They have no GLOSSARY pre-binding and are documentation-only-tracked
  here as part of the verbatim CAD body; their content (a `Real.sqrt 2`
  arithmetic identity) is non-controversial and proved by `field_simp +
  nlinarith` against `Real.sq_sqrt` for `√2² = 2`.

2-way C-gate verdict: 8/8 named clauses of the `def:ising` canonical and
its GLOSSARY translation-map's CONCRETE promises MATCH per-clause to the
named theorems in this file. The CAVEAT clause of the translation-map
line is deferred to a follow-up per orchestrator option (b). The
toyNormalisation pair (3 declarations) carries no GLOSSARY pre-binding.

FiniteSkeletalFusionData connection deferred per orchestrator option (b)
=========================================================================

The GLOSSARY pre-binding at `GLOSSARY.md:1279` (reproduced verbatim above)
flags a CAVEAT: CAD's Ising file is not currently connected to
`Foundations.FiniteSkeletalFusionData` (no `isingSkeletalFusionData`
instance analogous to `Fibonacci/FusionRules.lean::fibSkeletalFusionData`
at body line 325 of that file). MIGRATION_PLAN.md:226 explicitly offers
two paths:

  > Either (a) add the connection as part of this step, or (b) record a
  > follow-up task in `RESEARCH_NOTES.md`.

The orchestrator has CHOSEN OPTION (b) for this commit. Rationale
(per orchestrator brief): consistent with the established Phase-5
defer-non-essential pattern (`cft-anyons-5tm.3` deferred decls from
P5.5 + P5.6); option (a) would require adding new mathematical content
beyond the verbatim CAD port that this step is scoped to.

Follow-up tracking:
* bd issue `cft-anyons-5tm.25` ("Add isingSkeletalFusionData instance
  to Ising/Basic.lean (P5.15 deferral)"), filed in this same commit.
* `RESEARCH_NOTES.md` §"Deferred decisions" entry `DD-1`, added in this
  same commit.

The deferred work will be a small additive port (estimated ~25 LOC in this
file, with no changes to the existing decls): the structure-valued
`def isingSkeletalFusionData : Foundations.FiniteSkeletalFusionData where
Label := IsingLabel; unit := one; fusionMultiplicity := fusionMultiplicity;
leftUnit := ...; rightUnit := ...` plus the three derived theorems
`_multiplicityFree`, `_left_total`, `_right_total`. Both `leftUnit` and
`rightUnit` fields are dischargeable by `fin_cases a <;> fin_cases c <;>
simp [fusionMultiplicity]` per the `fibSkeletalFusionData` precedent. The
derived totals follow from `FiniteSkeletalFusionData.total_leftUnit /
total_rightUnit` (P5.1 SkeletalFusion.lean).

Provenance
==========

Body byte-identical to CAD source from `namespace CFTAnyons` (CAD source
line 11) to EOF (CAD source line 101). This file's body is verifiable by
post-port `diff <(awk '/^namespace CFTAnyons$/{f=1} f' cft-anyons-deprecated/
Formalisation/Ising/Basic.lean) <(awk '/^namespace CFTAnyons$/{f=1} f'
cft-anyons/Formalisation/Ising/Basic.lean)` → BODY MATCHES.

The only structural change is the extended docstring (this `/-! ... -/`
block), inserted between CAD's original `import Mathlib` (line 1) and
CAD's original short `/-! ... -/` docstring (lines 3-9). CAD's original
short docstring is preserved verbatim as the file's local-context header
at the top of this extended docstring.
-/

namespace CFTAnyons
namespace Ising

noncomputable section

inductive IsingLabel where
  | one
  | sigma
  | epsilon
deriving DecidableEq, Fintype, Repr

open IsingLabel

def fusionMultiplicity : IsingLabel → IsingLabel → IsingLabel → Nat
  | one, a, c => if c = a then 1 else 0
  | a, one, c => if c = a then 1 else 0
  | sigma, sigma, one => 1
  | sigma, sigma, epsilon => 1
  | sigma, epsilon, sigma => 1
  | epsilon, sigma, sigma => 1
  | epsilon, epsilon, one => 1
  | _, _, _ => 0

theorem fusion_sigma_sigma :
    fusionMultiplicity sigma sigma one = 1 ∧
      fusionMultiplicity sigma sigma epsilon = 1 ∧
      fusionMultiplicity sigma sigma sigma = 0 := by
  simp [fusionMultiplicity]

theorem fusion_sigma_epsilon :
    fusionMultiplicity sigma epsilon sigma = 1 ∧
      fusionMultiplicity sigma epsilon one = 0 ∧
      fusionMultiplicity sigma epsilon epsilon = 0 := by
  simp [fusionMultiplicity]

theorem fusion_epsilon_sigma :
    fusionMultiplicity epsilon sigma sigma = 1 ∧
      fusionMultiplicity epsilon sigma one = 0 ∧
      fusionMultiplicity epsilon sigma epsilon = 0 := by
  simp [fusionMultiplicity]

theorem fusion_epsilon_epsilon :
    fusionMultiplicity epsilon epsilon one = 1 ∧
      fusionMultiplicity epsilon epsilon sigma = 0 ∧
      fusionMultiplicity epsilon epsilon epsilon = 0 := by
  simp [fusionMultiplicity]

theorem fusion_unit_left (a : IsingLabel) :
    fusionMultiplicity one a a = 1 := by
  cases a <;> simp [fusionMultiplicity]

theorem fusion_unit_right (a : IsingLabel) :
    fusionMultiplicity a one a = 1 := by
  cases a <;> simp [fusionMultiplicity]

theorem fusion_multiplicity_le_one (a b c : IsingLabel) :
    fusionMultiplicity a b c ≤ 1 := by
  fin_cases a <;> fin_cases b <;> fin_cases c <;> simp [fusionMultiplicity]

theorem fusion_sigma_sigma_total_multiplicity :
    (∑ c : IsingLabel, fusionMultiplicity sigma sigma c) = 2 := by
  decide

def DeltaSigma : ℚ := 1 / 8

def DeltaEpsilon : ℚ := 1

theorem sigma_sigma_to_epsilon_exponent :
    DeltaEpsilon - 2 * DeltaSigma = 3 / 4 := by
  norm_num [DeltaEpsilon, DeltaSigma]

def toyNormNumerator (t : ℝ) : ℝ :=
  (1 / Real.sqrt 2) ^ 2 + (1 / Real.sqrt 2) ^ 2 + (t / 2) ^ 2

theorem toyNormNumerator_eq (t : ℝ) :
    toyNormNumerator t = 1 + t ^ 2 / 4 := by
  unfold toyNormNumerator
  have hs : (Real.sqrt (2 : ℝ)) ^ 2 = 2 :=
    Real.sq_sqrt (by norm_num)
  field_simp [show Real.sqrt (2 : ℝ) ≠ 0 by positivity]
  nlinarith [hs]

theorem toyNormalisation (t : ℝ) :
    toyNormNumerator t / (1 + t ^ 2 / 4) = 1 := by
  rw [toyNormNumerator_eq]
  field_simp [show (1 : ℝ) + t ^ 2 / 4 ≠ 0 by nlinarith [sq_nonneg t]]

end

end Ising
end CFTAnyons
