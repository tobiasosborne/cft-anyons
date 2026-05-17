import Formalisation.Foundations.ProjectDefinitions
import Formalisation.Fibonacci.Configurations

/-!
Fibonacci-specific specialisation of the project definitions `Q` and `H_N^W`.

This file re-introduces the Fibonacci-specific `FibonacciProjectDefinitions`
namespace originally present in CAD's
`Formalisation/Foundations/ProjectDefinitions.lean` (CAD source lines
93–116). That namespace was DROPPED from
`Formalisation/Foundations/ProjectDefinitions.lean` at P5.6 (commit
`05516c1`) because it depends on `Fibonacci.FibLabel`, `FibLabel.one`,
and the `FibonacciConfigurations` namespace from P5.3 — all deferred.
The 4 deferred declarations (`fibonacciLocalOccupation`,
`fibonacci_localOccupation_summands_card`,
`fibonacci_localOccupation_tensor_card`,
`fibonacci_vacuum_tensor_particleNumber_zero`) are re-created here
under `Formalisation/Fibonacci/`, where importing
`Fibonacci.Configurations` (which re-introduces `fibLabel_card` and
opens the `Foundations.FibonacciConfigurations` namespace) is fine
(the reverse-dep concern does not apply because `Fibonacci/` already
imports `Foundations/`).

Port provenance: VERBATIM port of the `FibonacciProjectDefinitions`
namespace body from
`cft-anyons-deprecated/Formalisation/Foundations/ProjectDefinitions.lean`
(source SHA256
`bd8bcae29dc81371eb89c8a2f5901ce1d722aa4c12a9d77b684c47360de2dbaf`,
CAD source lines 93–117) at MIGRATION_PLAN.md:217 (P5.6) and bd issue
`cft-anyons-5tm.3`. The body of the `namespace FibonacciProjectDefinitions`
block is byte-identical to CAD source lines 93–117. The CAD source's
wrapping `namespace CFTAnyons` / `namespace Foundations` /
`noncomputable section` / closing `end` / `end Foundations` /
`end CFTAnyons` is preserved here so the `FibonacciProjectDefinitions`
sub-namespace lands at exactly the same fully-qualified path
`CFTAnyons.Foundations.FibonacciProjectDefinitions` as CAD. The opens
`open Fibonacci`, `open Fibonacci.FibLabel`, `open FibonacciConfigurations`
are preserved verbatim from CAD; the `fibLabel_card` reference resolves
via the import of `Formalisation.Fibonacci.Configurations` (P5.17
sibling re-introducing `fibLabel_card` in the
`Foundations.FibonacciConfigurations` namespace).

Cross-references to GLOSSARY.md
================================

-- GLOSSARY: def:Q (GLOSSARY.md:406) — local cell object. The
   canonical statement at `summary.tex:194` defines `Q ∈ C` as any
   object whose `Q^{⊗N}` and `Hom_C(W, Q^{⊗N})` build the Hilbert
   spaces of `def:Hlatt` / `def:HP`. The generic
   `LocalOccupationModel (label : Type u) [Fintype label] [DecidableEq label]`
   structure (one field: `vacuum : label`) is in
   `Foundations/ProjectDefinitions.lean` (P5.6) and is named in the
   Translation map CAD section at `GLOSSARY.md:430`: "`LocalOccupationModel.vacuum : label`
   is unconstrained — the choice of `Q` (and which simple is vacuum)
   is supplied by the user at instantiation". This file is the
   canonical Fibonacci instantiation: `fibonacciLocalOccupation :
   LocalOccupationModel FibLabel where vacuum := one` fixes the
   Fibonacci vacuum-simple as `FibLabel.one`. The companion claims
   `fibonacci_localOccupation_summands_card :
   Fintype.card (LocalOccupationSummand FibLabel) = 2` (the Fibonacci
   summand-count is 2, proved by `exact fibLabel_card`) and
   `fibonacci_localOccupation_tensor_card (n : ℕ) :
   Fintype.card (LocalOccupationTensorSummand FibLabel n) = 2 ^ n`
   (the Fibonacci-label tensor-power count, proved by chaining the
   generic `localOccupationTensorSummand_card` with `fibLabel_card`)
   are the Fibonacci specialisations of the generic dimension lemmas.
   The vacuum-boundary identity
   `fibonacci_vacuum_tensor_particleNumber_zero (n : ℕ) :
   Config.particleNumber fibonacciLocalOccupation.vacuum
   (Config.constant fibonacciLocalOccupation.vacuum :
   LocalOccupationTensorSummand FibLabel n) = 0` is the Fibonacci
   instance of the generic
   `localOccupation_vacuum_particleNumber_zero` (P5.6).

-- GLOSSARY: def:Hlatt (GLOSSARY.md:447) — N-site Hilbert space,
   fixed lattice. Per the Translation map CAD section at
   `GLOSSARY.md:497`, the generic
   `IndefiniteParticleSectorCoordinates(sectorBasis)` of
   `Foundations/ProjectDefinitions.lean` (P5.6) is the CAD-side
   coordinate-skeleton anchor. The Fibonacci-specific
   `fibonacciLocalOccupation` instance of `LocalOccupationModel`
   defined here is the concrete Fibonacci choice of `Q`-data that
   downstream instantiations of `IndefiniteParticleSectorCoordinates`
   would specialise to.

-- GLOSSARY: def:particle-number (GLOSSARY.md:507) — particle number.
   The vacuum-boundary instance
   `fibonacci_vacuum_tensor_particleNumber_zero` is the
   `fibonacciLocalOccupation.vacuum = one` evaluation of the generic
   `Config.particleNumber_constant_vacuum` (via the generic
   `localOccupation_vacuum_particleNumber_zero` wrapper in P5.6),
   matching the all-vacuum boundary identity `k(\one,\dots,\one) = 0`
   at `summary.tex:344` (`def:particle-number`).

-- GLOSSARY: conv:basics (GLOSSARY.md:130) — basic notation and
   conventions. The Fibonacci vacuum-simple is `FibLabel.one`; this is
   the GLOSSARY `conv:basics` `\one` / "vacuum simple" of the
   Fibonacci fusion category, fixed by the
   `fibonacciLocalOccupation.vacuum := one` choice here.
-/

namespace CFTAnyons
namespace Foundations

noncomputable section

namespace FibonacciProjectDefinitions

open Fibonacci
open Fibonacci.FibLabel
open FibonacciConfigurations

def fibonacciLocalOccupation : LocalOccupationModel FibLabel where
  vacuum := one

theorem fibonacci_localOccupation_summands_card :
    Fintype.card (LocalOccupationSummand FibLabel) = 2 := by
  exact fibLabel_card

theorem fibonacci_localOccupation_tensor_card (n : ℕ) :
    Fintype.card (LocalOccupationTensorSummand FibLabel n) = 2 ^ n := by
  rw [localOccupationTensorSummand_card, fibLabel_card]

theorem fibonacci_vacuum_tensor_particleNumber_zero (n : ℕ) :
    Config.particleNumber fibonacciLocalOccupation.vacuum
      (Config.constant fibonacciLocalOccupation.vacuum :
        LocalOccupationTensorSummand FibLabel n) = 0 :=
  localOccupation_vacuum_particleNumber_zero fibonacciLocalOccupation n

end FibonacciProjectDefinitions

end

end Foundations
end CFTAnyons
