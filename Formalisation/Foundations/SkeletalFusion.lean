import Mathlib

/-!
# Finite skeletal fusion data — coordinate skeleton of a fusion category

This is a finite coordinate-level skeleton of the sourced skeletal fusion
category definition: a finite set of simple labels, a distinguished unit
label, and natural-number fusion multiplicities with left and right unit laws.
It does not include associators, F-symbols, pentagon equations, duals, or
categorical reconstruction.

Port provenance: ported verbatim from
`cft-anyons-deprecated/Formalisation/Foundations/SkeletalFusion.lean` at
MIGRATION_PLAN.md:212 (P5.1). Body is byte-identical to the canonical CAD
source from `namespace CFTAnyons` to EOF; only addition is this
top-of-file docstring extension with `Cross-references to GLOSSARY.md`
below. This is the **first Phase-5 port** — the new `Foundations/`
sub-directory is created here.

R-gate verdict (pre-commit): SAFE TO IMPORT (separate Opus subagent
audit). Q1 (CONVENTIONS (a) vacuum-index): PASS — `unit : Label` is an
abstract field of the structure with no hardcoded numeric index; the
1-indexed convention CONVENTIONS (a) is freely adoptable at concrete
instantiation time. Q2 (CONVENTIONS (b) F-matrix gauge): N/A — no
F-symbols, no 6j-symbols, no tensor / monoidal structure at this
skeletal coordinate level. Q3 (GLOSSARY `def:fuscat` correspondence):
the structure realises exactly clauses (i), (ii), (vi) of
`def:fuscat`; the disclaimer in the original docstring lines 5–10
("does not include associators, F-symbols, pentagon equations, duals,
or categorical reconstruction") explicitly delimits scope away from
clauses (iii) (Hom-spaces), (iv) (tensor / monoidal), (v) (biproducts),
and (vii) (rigid duals + snake identities).

## Cross-references to GLOSSARY.md

-- GLOSSARY: def:fuscat (GLOSSARY.md:207) — Fusion category. The
   canonical statement at `summary.tex:113` defines a fusion category
   `C` over `ℂ` via seven clauses: (i) a finite set `Irr(C)` of simple
   objects; (ii) a distinguished simple unit `1 ∈ Irr(C)`; (iii)
   finite-dimensional complex Hom-spaces; (iv) a bilinear tensor
   product with associator and unitors; (v) biproducts (finite direct
   sums); (vi) nonnegative integer fusion multiplicities
   `N_{ab}^{c} := dim Hom_C(c, a ⊗ b)` so that
   `a ⊗ b ≅ ⊕_{c ∈ Irr(C)} c^{N_{ab}^c}`; (vii) rigid duals satisfying
   the snake identities. This file is the GLOSSARY-pre-registered
   canonical CAD anchor for `def:fuscat` — verbatim per the Translation
   map CAD section at GLOSSARY.md:253: "`Foundations/SkeletalFusion.lean::FiniteSkeletalFusionData`
   (Phase 5 migration step P5.1). Coordinate-skeleton level: a finite
   label set, distinguished vacuum, integer multiplicity table. No
   associators, no duals, no Hom-spaces — the categorical content is
   supplied separately at instantiation." The `structure
   FiniteSkeletalFusionData` realises exactly clauses (i), (ii), (vi):
   field `Label : Type u` together with the `[labelFintype : Fintype
   Label]` and `[labelDecidableEq : DecidableEq Label]` typeclass
   instances realises clause (i) (`Irr(C)` finite); field `unit :
   Label` realises clause (ii) (distinguished unit `1 ∈ Irr(C)`); field
   `fusionMultiplicity : Label → Label → Label → Nat` together with
   the field `leftUnit : ∀ a c, fusionMultiplicity unit a c = if c = a
   then 1 else 0` and `rightUnit : ∀ a c, fusionMultiplicity a unit c
   = if c = a then 1 else 0` realises clause (vi) at the integer
   multiplicity-table level (the unit-law equations are the
   skeletal-coordinate shadows of `a ⊗ 1 ≅ a ≅ 1 ⊗ a`). Clauses (iii)
   Hom-spaces, (iv) associator / unitors / monoidal structure, (v)
   biproducts, and (vii) rigid duals are explicitly OUT OF SCOPE per
   the original module docstring's disclaimer at source lines 5–10 ("It
   does not include associators, F-symbols, pentagon equations, duals,
   or categorical reconstruction") — these belong to the categorical
   content supplied separately at instantiation. The two
   `attribute [instance]` declarations promote the `labelFintype` and
   `labelDecidableEq` typeclass fields to global instances available
   for downstream Phase-5 files. Derivations: `totalFusionMultiplicity
   a b := ∑ c, fusionMultiplicity a b c` is a derived sum over the
   third index of the multiplicity table (a quantum-dimension-shaped
   total channel count); `MultiplicityFree : Prop` is the intrinsic
   condition `∀ a b c, fusionMultiplicity a b c ≤ 1` (foreshadows
   [[def:fib]] and [[def:ising]] which both satisfy it, but is itself
   a property of the data, not a new defined term — no new GLOSSARY
   entry needed); six derived unit-law theorems (`leftUnit_same`,
   `leftUnit_different`, `rightUnit_same`, `rightUnit_different`,
   `total_leftUnit`, `total_rightUnit`) unfold the `leftUnit` /
   `rightUnit` definitional equations onto the diagonal (`c = a`,
   value `1`) and off-diagonal (`c ≠ a`, value `0`) cases, then sum
   them to recover the unital identities `∑_c N_{1a}^{c} = 1 = ∑_c
   N_{a1}^{c}`. All of these are derivations from clauses (i) + (ii)
   + (vi); no new categorical content is introduced.

-- GLOSSARY: conv:basics (GLOSSARY.md:130) — Notation and conventions.
   The complex-vector-space default ("Vector spaces are complex unless
   otherwise stated") is not invoked here at the integer-multiplicity
   skeletal level (the multiplicity table takes values in `Nat`, the
   total-multiplicity sum in `Nat`); the load-bearing role of
   `conv:basics` for this file is the typeclass-side notation: the
   `[Fintype Label]` and `[DecidableEq Label]` instances (declared as
   bracket arguments inside the structure, then promoted by
   `attribute [instance]` at the namespace level) are the canonical
   Mathlib realisations of the "finite, equality-decidable label set"
   substrate every Phase-4 LinearAlgebra port and every downstream
   Phase-5 file relies on. The `∑ c : C.Label, ...` notation in
   `totalFusionMultiplicity` and the `classical` tactic in
   `total_leftUnit` / `total_rightUnit` are the Mathlib renderings of
   the categorical "sum over `Irr(C)`" used implicitly throughout
   `summary.tex` §3-§4. The dagger / categorical adjoint is not
   invoked in this file. CONVENTIONS (a) vacuum-index: the abstract
   field `unit : Label` does NOT hardcode any numeric index — concrete
   instantiations (in Phase-5 `Fibonacci/` and `Ising/` files) supply
   the canonical 1-indexed choice per CONVENTIONS.md:69-127 freely at
   that point.
-/

namespace CFTAnyons
namespace Foundations

universe u

structure FiniteSkeletalFusionData where
  Label : Type u
  [labelFintype : Fintype Label]
  [labelDecidableEq : DecidableEq Label]
  unit : Label
  fusionMultiplicity : Label → Label → Label → Nat
  leftUnit :
    ∀ a c, fusionMultiplicity unit a c = if c = a then 1 else 0
  rightUnit :
    ∀ a c, fusionMultiplicity a unit c = if c = a then 1 else 0

attribute [instance] FiniteSkeletalFusionData.labelFintype
attribute [instance] FiniteSkeletalFusionData.labelDecidableEq

namespace FiniteSkeletalFusionData

variable (C : FiniteSkeletalFusionData.{u})

def totalFusionMultiplicity (a b : C.Label) : Nat :=
  ∑ c : C.Label, C.fusionMultiplicity a b c

def MultiplicityFree : Prop :=
  ∀ a b c : C.Label, C.fusionMultiplicity a b c ≤ 1

theorem leftUnit_same (a : C.Label) :
    C.fusionMultiplicity C.unit a a = 1 := by
  simp [C.leftUnit]

theorem leftUnit_different {a c : C.Label} (h : c ≠ a) :
    C.fusionMultiplicity C.unit a c = 0 := by
  simp [C.leftUnit, h]

theorem rightUnit_same (a : C.Label) :
    C.fusionMultiplicity a C.unit a = 1 := by
  simp [C.rightUnit]

theorem rightUnit_different {a c : C.Label} (h : c ≠ a) :
    C.fusionMultiplicity a C.unit c = 0 := by
  simp [C.rightUnit, h]

theorem total_leftUnit (a : C.Label) :
    C.totalFusionMultiplicity C.unit a = 1 := by
  classical
  simp [totalFusionMultiplicity, C.leftUnit]

theorem total_rightUnit (a : C.Label) :
    C.totalFusionMultiplicity a C.unit = 1 := by
  classical
  simp [totalFusionMultiplicity, C.rightUnit]

end FiniteSkeletalFusionData

end Foundations
end CFTAnyons
