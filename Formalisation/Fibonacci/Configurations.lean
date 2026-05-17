import Formalisation.Foundations.Configurations
import Formalisation.Fibonacci.FusionRules

/-!
Fibonacci-specific specialisation of the finite ordered site configurations.

This file re-introduces the Fibonacci-specific `FibonacciConfigurations`
namespace originally present in CAD's `Formalisation/Foundations/Configurations.lean`
(CAD source lines 52–79). That namespace was DROPPED from
`Formalisation/Foundations/Configurations.lean` at P5.3 (commit `7601c78`)
to break the CAD reverse-dependency `Foundations → Fibonacci.FusionRules`
flagged in `stocktake/reports/cad-lean.md` §6 and `GLOSSARY.md:536`. The
5 deferred declarations (`FibConfig`, `fibLabel_card`,
`fibonacci_configurations_card`, `fibonacci_particleNumber_tau_constant`,
`fibonacci_particleNumber_vacuum_constant`) are re-created here under
`Formalisation/Fibonacci/`, where importing `Fibonacci.FusionRules` is
fine (the reverse-dep concern does not apply because `Fibonacci/`
already imports `Foundations/`).

Port provenance: VERBATIM port of the `FibonacciConfigurations` namespace
body from
`cft-anyons-deprecated/Formalisation/Foundations/Configurations.lean`
(source SHA256
`915878be0f0f5891b06e0820cfba93e38620c557604acef08f4383d7280a0d1b`,
CAD source lines 52–79) at MIGRATION_PLAN.md:214 (P5.3) and bd issue
`cft-anyons-5tm.3`. The body of the `namespace FibonacciConfigurations`
block (from `namespace FibonacciConfigurations` to `end FibonacciConfigurations`)
is byte-identical to CAD source lines 52–79; the only additions are this
top-of-file docstring and the wrapping `namespace CFTAnyons` /
`namespace Foundations` / closing `end Foundations` / `end CFTAnyons`
pair, which place the `FibonacciConfigurations` sub-namespace at exactly
the same fully-qualified path
`CFTAnyons.Foundations.FibonacciConfigurations` as CAD (so downstream
references resolve identically). The opens `open Fibonacci`,
`open Fibonacci.FibLabel`, `open Config` are preserved verbatim from CAD.

Cross-references to GLOSSARY.md
================================

-- GLOSSARY: def:particle-number (GLOSSARY.md:507) — particle number
   `k(a_1,\dots,a_N) := \#\{i \in\{1,\dots,N\} : a_i \neq \one\}`. The
   canonical statement at `summary.tex:344` defines the particle number
   on the basis `(a_1,\dots,a_N)` from Proposition `prop:conf-decomp`.
   The generic `Config.particleNumber` realisation is in
   `Foundations/Configurations.lean` (P5.3); this file is the
   Fibonacci-specific instantiation per the Translation map CAD section
   at `GLOSSARY.md:536`. The Fibonacci specialisation fixes
   `vacuum := FibLabel.one`: the two boundary theorems
   `fibonacci_particleNumber_tau_constant (n : ℕ) :
   Config.particleNumber one (Config.constant tau : Config FibLabel n) = n`
   and `fibonacci_particleNumber_vacuum_constant (n : ℕ) :
   Config.particleNumber one (Config.constant one : Config FibLabel n) = 0`
   are the Fibonacci-instance evaluations of the generic boundary
   theorems `particleNumber_constant_nonvacuum` and
   `particleNumber_constant_vacuum` respectively, with `vacuum := one`
   and `a := tau` (resp. `vacuum := one`). The dimension-formula
   companion `fibonacci_configurations_card (n : ℕ) :
   Fintype.card (FibConfig n) = 2 ^ n` is the Fibonacci instance
   (`|FibLabel| = 2`) of the generic
   `Config.card_configurations : Fintype.card (Config α n) = Fintype.card α ^ n`.
   The supporting cardinality lemma `fibLabel_card :
   Fintype.card FibLabel = 2` is the load-bearing 2-element count of
   the Fibonacci label set `{1, τ}` (proved by `decide`), used both
   here and downstream by P5.17's sibling files
   `Fibonacci/ConfigurationSpace.lean`, `Fibonacci/FockSpace.lean`,
   `Fibonacci/ProjectDefinitions.lean`. The
   `FibConfig n := Config FibLabel n` abbreviation is the
   Fibonacci-specific configuration type at length `n`.

-- GLOSSARY: conv:basics (GLOSSARY.md:130) — basic notation and
   conventions. The Fibonacci vacuum-simple is `FibLabel.one`; this is
   the GLOSSARY `conv:basics` `\one` / "vacuum simple" of the
   Fibonacci fusion category instantiation, fixed throughout this file.
-/

namespace CFTAnyons
namespace Foundations

namespace FibonacciConfigurations

open Fibonacci
open Fibonacci.FibLabel
open Config

abbrev FibConfig (n : ℕ) :=
  Config FibLabel n

theorem fibLabel_card :
    Fintype.card FibLabel = 2 := by
  decide

theorem fibonacci_configurations_card (n : ℕ) :
    Fintype.card (FibConfig n) = 2 ^ n := by
  rw [Config.card_configurations, fibLabel_card]

theorem fibonacci_particleNumber_tau_constant (n : ℕ) :
    Config.particleNumber one
      (Config.constant tau : Config FibLabel n) = n := by
  exact Config.particleNumber_constant_nonvacuum one tau (by decide)

theorem fibonacci_particleNumber_vacuum_constant (n : ℕ) :
    Config.particleNumber one
      (Config.constant one : Config FibLabel n) = 0 := by
  exact Config.particleNumber_constant_vacuum one

end FibonacciConfigurations

end Foundations
end CFTAnyons
