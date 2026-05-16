import Mathlib

/-!
# Finite ordered site configurations and particle number

This is a project-level formalisation of the ordered-label part of the
configuration-space expansion. It deliberately does not claim a categorical
Hom-space decomposition; it only proves finite combinatorics for site labels.

Port provenance: REFACTORED port from
`cft-anyons-deprecated/Formalisation/Foundations/Configurations.lean`
at MIGRATION_PLAN.md:214 (P5.3). The CAD source (82 LOC) contains TWO
namespaces; this file ports only the GENERIC `Config` namespace
(CAD source lines 15–50; 5 declarations: `Config` abbrev,
`Config.constant`, `Config.particleNumber`, `Config.particleNumber_le_length`,
`Config.particleNumber_constant_vacuum`, `Config.particleNumber_constant_nonvacuum`,
`Config.card_configurations`). The Fibonacci-specific `FibonacciConfigurations`
namespace (CAD source lines 52–79; 5 declarations: `FibConfig` abbrev,
`fibLabel_card`, `fibonacci_configurations_card`,
`fibonacci_particleNumber_tau_constant`, `fibonacci_particleNumber_vacuum_constant`)
is DROPPED from this commit to break the reverse dependency on
`Formalisation.Fibonacci.FusionRules` that the CAD source imports at line 2
(reverse dependency flagged in `stocktake/reports/cad-lean.md` §6 and
`GLOSSARY.md:536`). Per MIGRATION_PLAN.md:214's D-gate, post-decoupling this
file imports nothing from `Formalisation/Fibonacci/`. The 5 deferred
Fibonacci-specific declarations are tracked in a bd follow-up issue
(filed in the same commit) for re-creation as a new file
`Formalisation/Fibonacci/Configurations.lean` after P5.7
(`Fibonacci/Basic.lean`) lands; the new file will import only
`Foundations.Configurations` + `Fibonacci.Basic` (NOT `Fibonacci.FusionRules`
— the CAD source over-imports). C-gate behaviour-preservation: each of the
5 generic `Config` lemmas is unchanged in statement and proof relative to
CAD; each of the 5 Fibonacci-specific lemmas remains provable verbatim once
`Fibonacci.Basic` is available (its `FibLabel`, `tau`, `one` are the only
upstream dependencies). The CAD source's docstring (lines 4–10) is lightly
modified here to remove the `FibonacciConfigurations` mention; otherwise the
body from `namespace CFTAnyons` to EOF is byte-identical to CAD source
lines 12–50 modulo the closing-`end Foundations / end CFTAnyons` pair
(which is preserved verbatim from CAD source lines 81–82).

## Cross-references to GLOSSARY.md

-- GLOSSARY: def:particle-number (GLOSSARY.md:507) — particle number
   `k(a_1,\dots,a_N) := \#\{i \in\{1,\dots,N\} : a_i \neq \one\}`. The
   canonical statement at `summary.tex:344` defines the particle number
   on the basis `(a_1,\dots,a_N)` from Proposition `prop:conf-decomp`.
   This file is the GLOSSARY-pre-registered canonical CAD support for
   `def:particle-number` — verbatim per the Translation map CAD section
   at GLOSSARY.md:536: "`Foundations/Configurations.lean` (Phase 5 P5.3)
   — particle number defined in the coordinate skeleton". The
   particle-number count is realised here as
   `Config.particleNumber [DecidableEq α] (vacuum : α) (cfg : Config α n) : ℕ
     := (Finset.univ.filter fun i => cfg i ≠ vacuum).card`: the cardinality
   of the index set of non-vacuum sites in a length-`n` site configuration
   `cfg : Fin n → α`. The vacuum role is played by the abstract `vacuum : α`
   parameter (unconstrained at this generic level; the canonical Fibonacci
   instantiation `vacuum := one` is deferred to the bd-tracked
   `Fibonacci/Configurations.lean` follow-up; the canonical Ising
   instantiation `vacuum := psi_zero` is similarly deferred). The
   GLOSSARY-pre-registered caveat at GLOSSARY.md:536 that "Configurations.lean
   currently imports `Fibonacci.FusionRules`; must be reverse-decoupled before
   migration (P5.3 covers this)" is DISCHARGED by this commit: the import line
   `import Formalisation.Fibonacci.FusionRules` at CAD source line 2 is
   REMOVED here, and the `import Mathlib` at CAD source line 1 is the only
   import in this file (verified by the D-gate
   `grep -E "^import.*Fibonacci"` returning empty). Companion structural
   declarations: `Config α n := Fin n → α` (the configuration type as an
   `α`-valued function on the length-`n` site index `Fin n` — the abstract
   ordered-label site-configuration model); `Config.constant a` (the constant
   configuration with all sites in state `a : α`); the bound
   `particleNumber_le_length : particleNumber vacuum cfg ≤ n` (the count of
   non-vacuum sites cannot exceed `n`, proved via
   `Finset.card_filter_le`); the two boundary identities
   `particleNumber_constant_vacuum : particleNumber vacuum (constant vacuum) = 0`
   and `particleNumber_constant_nonvacuum : a ≠ vacuum →
   particleNumber vacuum (constant a) = n` (the all-vacuum and all-`a`
   configurations have particle-number 0 and `n` respectively); and the
   dimension-formula companion `card_configurations :
   Fintype.card (Config α n) = Fintype.card α ^ n` (the count of length-`n`
   site configurations over a finite label type `α`, proved via
   `Fintype.card_fun` + `Fintype.card_fin`). The fusion-fibre + multiplicity-
   factor enrichment from the second sentence of the canonical definition
   (`\Hom_\Cc(W, a_1\otimes\cdots\otimes a_N)` + `\bigotimes_i M_{a_i}`) is
   OUT OF SCOPE of this file (it lies on the categorical-Hom side, not the
   ordered-label-combinatorics side — consistent with the original module
   docstring's disclaimer "deliberately does not claim a categorical
   Hom-space decomposition; it only proves finite combinatorics for site
   labels").

-- GLOSSARY: conv:basics (GLOSSARY.md:130) — basic notation and
   conventions. The canonical statement at `summary.tex:76` fixes,
   inter alia, that "`\one` denotes the categorical unit object (also
   called the \emph{vacuum} simple)". This file's abstract `vacuum : α`
   parameter throughout `Config.particleNumber`, `Config.constant`, and the
   four particle-number lemmas is the GLOSSARY `conv:basics` `\one` /
   "vacuum simple" — the distinguished label whose count is excluded from
   the particle number. The fact that the parameter is left abstract here
   (rather than fixed to a specific label like the Fibonacci `one` or the
   Ising `psi_zero`) is the generic-over-fusion-data design choice that
   enables this file to serve as the shared substrate for both the
   Fibonacci and Ising fusion-category instantiations downstream; the
   instance-specific specialisations (e.g., `vacuum := one : FibLabel`)
   are deferred to the per-instance files (`Fibonacci/Configurations.lean`
   for Fibonacci; presumably analogous for Ising in P5.15+). The
   `DecidableEq α` typeclass requirement in `Config.particleNumber` and
   each of the four particle-number lemmas is the standard Mathlib
   discharge of the `cfg i ≠ vacuum` predicate's decidability — a
   non-substantive infrastructure constraint at the
   `\one`-comparison-equality boundary of `conv:basics`.
-/

namespace CFTAnyons
namespace Foundations

abbrev Config (α : Type*) (n : ℕ) :=
  Fin n → α

namespace Config

variable {α : Type*} {n : ℕ}

def constant (a : α) : Config α n :=
  fun _ => a

def particleNumber [DecidableEq α] (vacuum : α) (cfg : Config α n) : ℕ :=
  (Finset.univ.filter fun i => cfg i ≠ vacuum).card

theorem particleNumber_le_length [DecidableEq α]
    (vacuum : α) (cfg : Config α n) :
    particleNumber vacuum cfg ≤ n := by
  calc
    particleNumber vacuum cfg ≤ (Finset.univ : Finset (Fin n)).card := by
      exact Finset.card_filter_le _ _
    _ = n := by simp

theorem particleNumber_constant_vacuum [DecidableEq α] (vacuum : α) :
    particleNumber vacuum (constant vacuum : Config α n) = 0 := by
  simp [particleNumber, constant]

theorem particleNumber_constant_nonvacuum [DecidableEq α]
    (vacuum a : α) (ha : a ≠ vacuum) :
    particleNumber vacuum (constant a : Config α n) = n := by
  simp [particleNumber, constant, ha]

theorem card_configurations (α : Type*) [Fintype α] [DecidableEq α] (n : ℕ) :
    Fintype.card (Config α n) = Fintype.card α ^ n := by
  dsimp [Config]
  rw [Fintype.card_fun (α := Fin n) (β := α), Fintype.card_fin]

end Config

end Foundations
end CFTAnyons
