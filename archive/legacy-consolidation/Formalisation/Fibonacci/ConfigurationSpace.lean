import Formalisation.Foundations.ConfigurationSpace
import Formalisation.Fibonacci.Configurations

/-!
Fibonacci-specific specialisation of the configuration-space coordinate skeleton.

This file re-introduces the Fibonacci-specific `FibonacciConfigurations`
namespace originally present in CAD's
`Formalisation/Foundations/ConfigurationSpace.lean` (CAD source lines
69–80). That namespace was DROPPED from
`Formalisation/Foundations/ConfigurationSpace.lean` at P5.4 (commit
`a896156`) because it depends on `Fibonacci.FibLabel` and the
companion `fibLabel_card`, both deferred at P5.3. The single deferred
declaration (`fibonacci_configSpace_card_constant_basis`) is re-created
here under `Formalisation/Fibonacci/`, where importing
`Fibonacci.Configurations` (which re-introduces `fibLabel_card`) is fine
(the reverse-dep concern does not apply because `Fibonacci/` already
imports `Foundations/`).

Port provenance: VERBATIM port of the `FibonacciConfigurations` namespace
body from
`cft-anyons-deprecated/Formalisation/Foundations/ConfigurationSpace.lean`
(source SHA256
`9d979b292817da08b743ded868c88787c8cbb4a8719d52804364173d7ebcfd23`,
CAD source lines 68–80) at MIGRATION_PLAN.md:215 (P5.4) and bd issue
`cft-anyons-5tm.3`. The body of the `namespace FibonacciConfigurations`
block is byte-identical to CAD source lines 68–80. The CAD source's
wrapping `namespace CFTAnyons` / `namespace Foundations` /
`noncomputable section` / closing `end` / `end Foundations` /
`end CFTAnyons` is preserved here so the `FibonacciConfigurations`
sub-namespace lands at exactly the same fully-qualified path
`CFTAnyons.Foundations.FibonacciConfigurations` as CAD. The
`open Fibonacci` is preserved verbatim from CAD; the
`fibLabel_card` reference inside the theorem proof resolves via the
import of `Formalisation.Fibonacci.Configurations` (P5.17 sibling file
introducing `fibLabel_card` in the same `FibonacciConfigurations`
namespace).

Cross-references to GLOSSARY.md
================================

-- GLOSSARY: def:Hlatt (GLOSSARY.md:447) — N-site Hilbert space,
   fixed lattice `H_N^W := Hom_C(W, Q^{⊗N})`. The canonical statement
   at `summary.tex:285` defines the fixed-lattice Hilbert space. The
   generic `ConfigSpaceCoordinates` / `configSpaceLinearEquiv` /
   `configSpace_card_constant_basis` coordinate skeleton is in
   `Foundations/ConfigurationSpace.lean` (P5.4); per the Translation
   map CAD section at `GLOSSARY.md:497`, this file's
   `Foundations/ConfigurationSpace.lean` is one of three supporting
   CAD constructions on the same `H_N^W` skeleton (alongside
   `Foundations/DirectSumCoordinates.lean` (P5.2) for the Σ↔Π sum
   equivalence and `Foundations/FockSpace.lean` (P5.5) for the
   truncated-Fock-space view). This file is the Fibonacci-specific
   instantiation: `fibonacci_configSpace_card_constant_basis
   (β : Type*) [Fintype β] (n : ℕ) :
   Fintype.card (Sigma (fun _ : Config FibLabel n => β)) =
   2 ^ n * Fintype.card β` is the Fibonacci-label `(|FibLabel| = 2)`
   evaluation of the generic
   `configSpace_card_constant_basis : Fintype.card (Sigma (fun _ : Config α n => β)) =
   Fintype.card α ^ n * Fintype.card β`, proved by chaining the generic
   theorem with `fibLabel_card : Fintype.card FibLabel = 2` from
   `Fibonacci/Configurations.lean` (P5.17 sibling).
-/

namespace CFTAnyons
namespace Foundations

noncomputable section

namespace FibonacciConfigurations

open Fibonacci

/-- Fibonacci specialisation with a constant finite sector basis. -/
theorem fibonacci_configSpace_card_constant_basis
    (β : Type*) [Fintype β] (n : ℕ) :
    Fintype.card (Sigma (fun _ : Config FibLabel n => β)) =
      2 ^ n * Fintype.card β := by
  rw [configSpace_card_constant_basis, fibLabel_card]

end FibonacciConfigurations

end

end Foundations
end CFTAnyons
