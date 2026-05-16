import Formalisation.Foundations.Configurations
import Formalisation.Foundations.DirectSumCoordinates

/-!
# Finite coordinate skeleton for configuration-space direct sums

The handoff target identifies a finite-scale space as a direct sum over site
configurations.  This file proves only the basis-dependent coordinate
skeleton: after each configuration sector has a finite coordinate basis, the
flattened coordinate vector over all `(configuration, basis-vector)` pairs is
linearly equivalent to a family of coordinate vectors indexed by
configurations.

Port provenance: REFACTORED port from
`cft-anyons-deprecated/Formalisation/Foundations/ConfigurationSpace.lean`
at MIGRATION_PLAN.md:215 (P5.4). The CAD source (85 LOC) contains TWO
namespaces; this file ports only the GENERIC `CFTAnyons.Foundations`
content (CAD source lines 14–67; 5 declarations:
`ConfigSpaceCoordinates`, `ConfigComponentCoordinates`,
`configSpaceLinearEquiv`, `configSpaceLinearEquiv_apply`,
`configSpace_card_components`, `configSpace_card_constant_basis`,
`configSpaceLinearEquiv_preserves_coordinatePairing` — 2 abbrev + 1 def +
4 theorems). The Fibonacci-specific `FibonacciConfigurations` namespace
(CAD source lines 69–80; 1 declaration:
`fibonacci_configSpace_card_constant_basis`) is DROPPED from this commit
because it depends on `Fibonacci.FibLabel` and `fibLabel_card`, which were
themselves dropped at P5.3 (the same `FibonacciConfigurations` decoupling
applied to `Foundations/Configurations.lean`'s CAD `FibonacciConfigurations`
namespace) and tracked under bd follow-up `cft-anyons-5tm.3`
("Re-create FibonacciConfigurations namespace at
`Formalisation/Fibonacci/Configurations.lean` (P5.3 deferral)"). A
verbatim port at P5.4 was attempted as a diagnostic and FAILED at
`lake build` with `error: unknown namespace 'Fibonacci'` at the source-line-71
`open Fibonacci` and a downstream `failed to synthesize Fintype` at the
source-line-76 `Config FibLabel n`; the `FibonacciConfigurations` namespace
of `ConfigurationSpace.lean` is therefore added to the same bd follow-up
`cft-anyons-5tm.3` for re-creation as a new file
`Formalisation/Fibonacci/ConfigurationSpace.lean` after P5.7
(`Fibonacci/Basic.lean`) lands; the new file will import only
`Foundations.ConfigurationSpace` + `Fibonacci.Basic` (NOT
`Fibonacci.FusionRules` — same over-import pattern as
`Configurations.lean::FibonacciConfigurations` flagged at P5.3). C-gate
behaviour-preservation: each of the 5 generic decls is unchanged in
statement and proof relative to CAD; the dropped Fibonacci-specific
declaration `fibonacci_configSpace_card_constant_basis` remains
provable verbatim once `Fibonacci.Basic` + the bd-followup-restored
`fibLabel_card` are available (its CAD proof is the one-line
`rw [configSpace_card_constant_basis, fibLabel_card]`). The CAD source's
docstring (lines 4–13) is lightly modified here to drop the
`FibonacciConfigurations` aside; otherwise the body from
`namespace CFTAnyons` to `end CFTAnyons` is byte-identical to CAD source
lines 15–67 + 82–85 modulo the dropped `FibonacciConfigurations` block
(lines 69–80) and the corresponding deletion of the `noncomputable section`
closer's redundancy (which CAD reopens at line 69 only for `open Fibonacci`).

## Cross-references to GLOSSARY.md

-- GLOSSARY: def:Hlatt (GLOSSARY.md:447) — N-site Hilbert space, fixed
   lattice. The canonical statement at `summary.tex:285` defines
   `Hh_N^W := Hom_C(W, Q^{⊗N})` and the full `N`-site space as
   `Hh_N = ⊕_{W ∈ Irr(C)} Hh_N^W`. This file is the
   GLOSSARY-pre-registered canonical CAD support construction for
   `def:Hlatt` — verbatim per the Translation map CAD section at
   GLOSSARY.md:497: "Supporting CAD constructions on the same `H_N^W`
   skeleton: `Foundations/DirectSumCoordinates.lean` (Phase 5 P5.2) for
   the Σ↔Π sum equivalence; `Foundations/ConfigurationSpace.lean` (P5.4)
   for `summary.tex` §4.2 sector expansion". The `summary.tex` §4.2
   sector expansion is realised here as the linear equivalence
   `configSpaceLinearEquiv : ConfigSpaceCoordinates basis ≃ₗ[ℂ]
   ConfigComponentCoordinates basis`, where
   `ConfigSpaceCoordinates basis = Sigma basis → ℂ` is the flattened
   coordinate vector over all `(configuration, basis-vector-of-that-sector)`
   pairs and `ConfigComponentCoordinates basis = ∀ cfg : Config α n,
   basis cfg → ℂ` is the per-configuration coordinate family. This packages
   the second-layer biproduct of the configuration-space decomposition:
   `Hh_N^W = ⊕_{cfg} Hom_C(W, A_cfg)` (per-sector splitting over
   configurations), with each per-cfg summand `Hom_C(W, A_cfg)`
   coordinatised by a user-supplied per-sector basis `basis cfg`. The
   underlying mechanism is `sigmaPiLinearEquiv` from P5.2
   `DirectSumCoordinates.lean` (cited explicitly in `configSpaceLinearEquiv`'s
   `:= sigmaPiLinearEquiv` body), specialised here to the configuration
   index type `Config α n = Fin n → α` from P5.3 `Configurations.lean`.
   The dimension formula `configSpace_card_components : Fintype.card
   (Sigma basis) = ∑ cfg : Config α n, Fintype.card (basis cfg)` is the
   coordinate-level realisation of `dim Hh_N^W = ∑_cfg dim Hom_C(W, A_cfg)`,
   and its uniform-basis specialisation `configSpace_card_constant_basis :
   Fintype.card (Sigma (fun _ : Config α n => β)) = Fintype.card α ^ n
   * Fintype.card β` recovers the `|α|^n` site-count factor from P5.3's
   `card_configurations : Fintype.card (Config α n) = Fintype.card α ^ n`.
   The isometry statement `configSpaceLinearEquiv_preserves_coordinatePairing`
   states that `configSpaceLinearEquiv` is an isometry of the standard
   coordinate pairings inherited from P5.2 (`sigmaCoordinatePairing` on
   the flattened side, the composite `piCoordinatePairing ∘ sigmaToPi` on
   the per-component side) — the coordinate-level statement that the
   configuration-sector expansion of `Hh_N^W` is an orthogonal direct sum.
   The categorical Hom-space `Hom_C(W, A_cfg)` is OUT OF SCOPE per the
   original module docstring's coordinate-skeleton disclaimer (source lines
   6–10: "This file proves only the basis-dependent coordinate skeleton");
   the categorical `H_N^W` realisation with categorical Hom-spaces is
   supplied separately at P5.6 `ProjectDefinitions.lean::IndefiniteParticleSectorCoordinates`
   per the canonical-anchor line at GLOSSARY.md:497.

-- GLOSSARY: def:particle-number (GLOSSARY.md:507) — particle number.
   While this file does NOT itself define a particle-number function (that
   is P5.3's `Foundations/Configurations.lean::Config.particleNumber`), it
   IS one of the consumers of `def:particle-number`'s underlying
   `Config α n` substrate: the basis-of-each-sector family
   `basis : Config α n → Type v` is indexed by exactly the same
   `Config α n = Fin n → α` ordered-label site-configuration type
   established at P5.3 and GLOSSARY-pre-registered at GLOSSARY.md:536.
   The configuration-space sum is therefore implicitly a sum over the
   `def:particle-number`-stratified space `Config α n` (with `vacuum :=
   one : FibLabel` in the canonical Fibonacci instantiation deferred to bd
   `cft-anyons-5tm.3`). The `Config α n` substrate is the GLOSSARY-pre-registered
   coordinate-level realisation of the configuration set
   `\{(a_1,\dots,a_N) \in \Irr(\Cc)^N\}` of `summary.tex` §4.2 over which
   `def:particle-number` `k(a_1,\dots,a_N) = \#\{i : a_i \neq \one\}` is
   defined.

-- GLOSSARY: conv:basics (GLOSSARY.md:130) — Notation and conventions.
   The complex-vector-space default ("Vector spaces are complex unless
   otherwise stated") is invoked throughout this file: every coordinate
   space is `→ ℂ` (`ConfigSpaceCoordinates basis = Sigma basis → ℂ`;
   `ConfigComponentCoordinates basis = ∀ cfg, basis cfg → ℂ`); the linear
   equivalence `configSpaceLinearEquiv` is explicitly `≃ₗ[ℂ]` —
   `ℂ`-linear. The dagger / categorical adjoint appears in coordinate
   form via Mathlib's `star` typeclass, inherited transparently through
   `configSpaceLinearEquiv_preserves_coordinatePairing`'s use of the
   `sigmaCoordinatePairing` and `piCoordinatePairing` from P5.2
   `DirectSumCoordinates.lean` (both defined as `∑ star (x _) * y _`,
   the second-argument-linear physics convention). The
   `noncomputable section` opening (source line 18) is the standard
   Mathlib idiom for `ℂ`-linear maps depending on classical decidability,
   inherited from the underlying `sigmaPiLinearEquiv` of P5.2. The
   `classical` tactic in `configSpace_card_constant_basis` is the
   Mathlib rendering of "all our finite-dim coordinate manipulations
   are classical". The unit-object substrate `\one` / "vacuum simple"
   from `conv:basics` is implicit in the abstract `α` site-label type
   (whose canonical Fibonacci instantiation `α := FibLabel` with
   `\one := FibLabel.one` is deferred to bd `cft-anyons-5tm.3`).
-/

namespace CFTAnyons
namespace Foundations

noncomputable section

universe u v

variable {α : Type u} {n : ℕ}
variable {basis : Config α n → Type v}

/-- Flattened coordinates over all configuration sectors. -/
abbrev ConfigSpaceCoordinates (basis : Config α n → Type v) :=
  Sigma basis → ℂ

/-- Component coordinates, one coordinate vector for each configuration. -/
abbrev ConfigComponentCoordinates (basis : Config α n → Type v) :=
  ∀ cfg : Config α n, basis cfg → ℂ

/-- Coordinate-level direct-sum expansion over configurations. -/
def configSpaceLinearEquiv :
    ConfigSpaceCoordinates basis ≃ₗ[ℂ] ConfigComponentCoordinates basis :=
  sigmaPiLinearEquiv

theorem configSpaceLinearEquiv_apply
    (x : ConfigSpaceCoordinates basis) (cfg : Config α n) (b : basis cfg) :
    configSpaceLinearEquiv x cfg b = x ⟨cfg, b⟩ := by
  rfl

/-- The flattened coordinate dimension is the sum of sector dimensions. -/
theorem configSpace_card_components
    [Fintype (Config α n)] [∀ cfg, Fintype (basis cfg)] :
    Fintype.card (Sigma basis) =
      ∑ cfg : Config α n, Fintype.card (basis cfg) := by
  exact card_sigma_components

/-- If every configuration sector has the same finite coordinate basis, the
flattened coordinate dimension is `|α|^n` times the sector dimension. -/
theorem configSpace_card_constant_basis
    (α β : Type*) [Fintype α] [Fintype β] (n : ℕ) :
    Fintype.card (Sigma (fun _ : Config α n => β)) =
      Fintype.card α ^ n * Fintype.card β := by
  classical
  rw [configSpace_card_components]
  simp [Config, Fintype.card_fin]

/-- The configuration-space coordinate expansion preserves the standard finite
coordinate pairing. -/
theorem configSpaceLinearEquiv_preserves_coordinatePairing
    [Fintype (Config α n)] [∀ cfg, Fintype (basis cfg)]
    (x y : ConfigSpaceCoordinates basis) :
    piCoordinatePairing (sigmaToPi x) (sigmaToPi y) =
      sigmaCoordinatePairing x y := by
  exact sigmaToPi_preserves_coordinatePairing x y

end

end Foundations
end CFTAnyons
