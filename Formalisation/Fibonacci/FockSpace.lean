import Formalisation.Foundations.FockSpace
import Formalisation.Fibonacci.Configurations

/-!
Fibonacci-specific specialisation of the truncated-Fock-space coordinate skeleton.

This file re-introduces the Fibonacci-specific `FibonacciConfigurations`
namespace originally present in CAD's
`Formalisation/Foundations/FockSpace.lean` (CAD source lines 90–100).
That namespace was DROPPED from
`Formalisation/Foundations/FockSpace.lean` at P5.5 (commit `2706c88`)
because it depends on `Fibonacci.FibLabel` and the companion
`fibLabel_card`, both deferred at P5.3. The single deferred declaration
(`fibonacci_truncatedFockBasis_card`) is re-created here under
`Formalisation/Fibonacci/`, where importing `Fibonacci.Configurations`
(which re-introduces `fibLabel_card`) is fine (the reverse-dep concern
does not apply because `Fibonacci/` already imports `Foundations/`).

Port provenance: VERBATIM port of the `FibonacciConfigurations` namespace
body from
`cft-anyons-deprecated/Formalisation/Foundations/FockSpace.lean` (source
SHA256
`6762d9f6c3aa28e9b69916e71f86a7450531fcd62be8a7a7660b30c9deb8ad67`,
CAD source lines 89–100) at MIGRATION_PLAN.md:216 (P5.5) and bd issue
`cft-anyons-5tm.3`. The body of the `namespace FibonacciConfigurations`
block is byte-identical to CAD source lines 89–100. The CAD source's
wrapping `namespace CFTAnyons` / `namespace Foundations` /
`noncomputable section` / closing `end` / `end Foundations` /
`end CFTAnyons` is preserved here so the `FibonacciConfigurations`
sub-namespace lands at exactly the same fully-qualified path
`CFTAnyons.Foundations.FibonacciConfigurations` as CAD. The
`open Fibonacci` is preserved verbatim from CAD; the `fibLabel_card`
reference inside the theorem proof resolves via the import of
`Formalisation.Fibonacci.Configurations` (P5.17 sibling).

Cross-references to GLOSSARY.md
================================

-- GLOSSARY: def:Hlatt (GLOSSARY.md:447) — N-site Hilbert space,
   fixed lattice `H_N^W := Hom_C(W, Q^{⊗N})`. The canonical statement
   at `summary.tex:285` defines the fixed-lattice Hilbert space. The
   generic truncated-Fock-space coordinate skeleton
   (`TruncatedFockBasis`, `TruncatedFockCoordinates`,
   `truncatedFockLengthExpansion`, `truncatedFockBasis_card`,
   `zeroParticleSector_card`, `oneParticleSector_card`) is in
   `Foundations/FockSpace.lean` (P5.5); per the Translation map CAD
   section at `GLOSSARY.md:497`, `Foundations/FockSpace.lean` is one of
   three supporting CAD constructions on the same `H_N^W` skeleton
   (specifically the `summary.tex` §4.3 truncated-Fock-space view).
   This file is the Fibonacci-specific instantiation:
   `fibonacci_truncatedFockBasis_card (maxN : ℕ) :
   Fintype.card (TruncatedFockBasis FibLabel maxN) =
   ∑ n : ParticleNumberUpTo maxN, 2 ^ n.val` is the Fibonacci-label
   (`|FibLabel| = 2`) evaluation of the generic
   `truncatedFockBasis_card : Fintype.card (TruncatedFockBasis localBasis maxN) =
   ∑ n : ParticleNumberUpTo maxN, Fintype.card localBasis ^ n.val`,
   proved by chaining the generic theorem with
   `fibLabel_card : Fintype.card FibLabel = 2` from
   `Fibonacci/Configurations.lean` (P5.17 sibling).
-/

namespace CFTAnyons
namespace Foundations

noncomputable section

namespace FibonacciConfigurations

open Fibonacci

/-- Fibonacci two-label specialisation of the truncated word count. -/
theorem fibonacci_truncatedFockBasis_card (maxN : ℕ) :
    Fintype.card (TruncatedFockBasis FibLabel maxN) =
      ∑ n : ParticleNumberUpTo maxN, 2 ^ n.val := by
  rw [truncatedFockBasis_card, fibLabel_card]

end FibonacciConfigurations

end

end Foundations
end CFTAnyons
