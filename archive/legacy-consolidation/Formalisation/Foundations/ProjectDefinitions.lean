import Formalisation.Foundations.ConfigurationSpace

/-!
# Finite coordinate skeleton for the project definitions `Q` and `H_N^W`

The handoff defines the local occupation object
`Q = direct-sum_{a in Irr(C)} a` and the finite-scale sector
`H_N^W = Hom(W, Q^{tensor N})`.  This file formalises only the finite
coordinate skeleton after replacing the simple objects by a finite label type
and choosing finite coordinate bases for the Hom sectors.  It does not
construct categorical direct sums, tensor powers, Hom functors, or a fusion
category.

Port provenance: REFACTORED port from
`cft-anyons-deprecated/Formalisation/Foundations/ProjectDefinitions.lean` at
MIGRATION_PLAN.md:217 (P5.6). The CAD source (121 LOC) contains TWO
namespaces; this file ports only the GENERIC `CFTAnyons.Foundations` content
(CAD source lines 15–91; 11 named declarations:
`LocalOccupationModel` structure, `LocalOccupationSummand` abbrev,
`LocalOccupationTensorSummand` abbrev, `localOccupationTensorSummand_card`
theorem, `localOccupation_vacuum_particleNumber_zero` theorem,
`IndefiniteParticleSectorCoordinates` abbrev,
`IndefiniteParticleComponentCoordinates` abbrev,
`indefiniteParticleSectorExpansion` def,
`indefiniteParticleSectorExpansion_apply` theorem,
`indefiniteParticleSector_card_components` theorem,
`indefiniteParticleSector_pairing_preserved` theorem — 1 structure + 4 abbrev
+ 1 def + 5 theorems = 11 named decls in this body slice). The
Fibonacci-specific `FibonacciProjectDefinitions` namespace (CAD source lines
93–116; 4 declarations: `fibonacciLocalOccupation` def +
`fibonacci_localOccupation_summands_card` theorem +
`fibonacci_localOccupation_tensor_card` theorem +
`fibonacci_vacuum_tensor_particleNumber_zero` theorem) is DROPPED from this
commit because it depends on `Fibonacci.FibLabel`, `Fibonacci.FibLabel.one`,
and the `FibonacciConfigurations` namespace (via `open Fibonacci`,
`open Fibonacci.FibLabel`, `open FibonacciConfigurations` at CAD source
lines 95–97); `FibLabel` was itself dropped at P5.3 (in the
`FibonacciConfigurations` namespace of CAD's `Configurations.lean`), and the
analogous P5.4 + P5.5 decoupling extended the deferral. The bd follow-up
`cft-anyons-5tm.3` (originally filed at P5.3, extended at P5.4 + P5.5)
tracks re-creation; this commit extends it again to cover the 4
P5.6-dropped decls (the BIGGEST single-step deferral so far). A verbatim
port at P5.6 would FAIL at `lake build` with `error: unknown namespace
'Fibonacci'` at the source-line-95 `open Fibonacci` and a downstream
`unknown identifier 'FibLabel'` at source line 99 (in the
`fibonacciLocalOccupation` definition body), plus three more downstream
cascade errors at the three subsequent theorems. The
`FibonacciProjectDefinitions` namespace of `ProjectDefinitions.lean` is
therefore added to the same bd follow-up `cft-anyons-5tm.3` for re-creation
as a new file `Formalisation/Fibonacci/ProjectDefinitions.lean` after P5.7
(`Fibonacci/Basic.lean`) lands; the new file will import only
`Foundations.ProjectDefinitions` + `Fibonacci.Basic` (NOT any other
`Fibonacci.*` module; the CAD source's transitively pulled
`FibonacciConfigurations` reference is only used to disambiguate
qualifier-shadowing on `one` and need not be re-introduced once the new
file qualifies its references). C-gate behaviour-preservation: each of the
11 generic decls is unchanged in statement and proof relative to CAD; the
dropped Fibonacci-specific declarations remain provable verbatim once
`Fibonacci.Basic` + the bd-followup-restored `fibLabel_card` are available
(their CAD proofs: `fibonacciLocalOccupation` is `{ vacuum := one }`,
`fibonacci_localOccupation_summands_card` is `exact fibLabel_card`,
`fibonacci_localOccupation_tensor_card` is one-line `rw
[localOccupationTensorSummand_card, fibLabel_card]`, and
`fibonacci_vacuum_tensor_particleNumber_zero` is the one-line
`localOccupation_vacuum_particleNumber_zero fibonacciLocalOccupation n`).
The CAD source's single `import Formalisation.Foundations.ConfigurationSpace`
line is PRESERVED VERBATIM. The CAD source's module docstring (lines 3–13)
is preserved verbatim except for the implicit fact that the Fibonacci
specialisation is no longer present in this file; the generic body from
`namespace CFTAnyons` to `end CFTAnyons` is byte-identical to CAD source
lines 15–91 + 118–121 modulo the dropped `FibonacciProjectDefinitions`
block (lines 93–116).

## Cross-references to GLOSSARY.md

-- GLOSSARY: def:Hlatt (GLOSSARY.md:447) — N-site Hilbert space, fixed
   lattice. The canonical statement at `summary.tex:285` defines
   `Hh_N^W := Hom_C(W, Q^{⊗N})` and the full N-site space as
   `Hh_N = ⊕_{W ∈ Irr(C)} Hh_N^W`. This file is the
   GLOSSARY-pre-registered canonical CAD anchor for `def:Hlatt` — verbatim
   per the Translation map CAD section at GLOSSARY.md:497:
   "`Foundations/ProjectDefinitions.lean::IndefiniteParticleSectorCoordinates(sectorBasis)`
   (Phase 5 P5.6). **Coordinate-skeleton level**, not categorical Hom-space.
   User must supply `sectorBasis : Config label n → Type`; once supplied,
   the bijection is `IndefiniteParticleSectorCoordinates(sectorBasis) =
   Hom(W, Q^⊗N)` coordinatised by enumerating `(config, basis element of
   Hom-fibre over that config)`. Per `stocktake/reports/cad-lean.md` §5
   line 358 and bridge report §3 'CAD Lean ↔ summary' row
   (`opus-hilbert-bridge.md:249`). Supporting CAD constructions on the
   same `H_N^W` skeleton: `Foundations/DirectSumCoordinates.lean` (Phase 5
   P5.2) for the Σ↔Π sum equivalence; `Foundations/ConfigurationSpace.lean`
   (P5.4) for `summary.tex` §4.2 sector expansion;
   `Foundations/FockSpace.lean` (P5.5) for `summary.tex` §4.3
   truncated-Fock-space view."

   **H_N^W C-gate cross-check (per MIGRATION_PLAN.md:217 P5.6
   requirement).** The Lean abbreviation in this file:
   ```
   abbrev IndefiniteParticleSectorCoordinates
       {label : Type u} {n : ℕ} (sectorBasis : Config label n → Type v) :=
     ConfigSpaceCoordinates sectorBasis
   ```
   unfolds (via P5.4 `Foundations/ConfigurationSpace.lean::ConfigSpaceCoordinates`)
   to `(cfg : Config label n) × sectorBasis cfg → ℂ`, where
   `Config label n = Fin n → label` (from P5.3 `Foundations/Configurations.lean`)
   is the coordinate-skeleton index type for ordered length-`n` words in
   the finite label alphabet (`label ↔ Irr(C)` per the
   `LocalOccupationSummand` abbrev introduced earlier in this file).
   In the canonical `H_N^W = Hom_C(W, Q^{⊗N})` GLOSSARY-canonical
   notation, with `Q = ⊕_{a ∈ Irr(C)} a` (the default
   `Q_{full}` choice from `[[def:Q]]` `summary.tex` Remark
   `rem:Q-choices`), distributivity of Hom over direct sums and tensor
   products gives the canonical decomposition
   `Hom(W, Q^{⊗N}) ≃ ⊕_{(a_1,…,a_N) ∈ Irr(C)^N} Hom(W, a_1 ⊗ ⋯ ⊗ a_N)`,
   i.e. a direct sum over ordered configurations of simples (the
   "sector expansion" of [[def:Hlatt]] / `summary.tex` §4.2 / P5.4's
   `configSpaceLinearEquiv`). The Lean coordinate-skeleton mirror is
   `IndefiniteParticleSectorCoordinates sectorBasis = Σ cfg : Config
   label n, sectorBasis cfg → ℂ` — the flattened coordinate of a function
   `(cfg, b) ↦ ℂ` for each configuration `cfg : Config label n` (the
   coordinate skeleton of an `Irr(C)^N` element) and each `b : sectorBasis
   cfg` (the user-supplied finite coordinate basis of the
   `Hom_C(W, a_1 ⊗ ⋯ ⊗ a_N)` Hom-fibre indexed by that configuration).
   With the user-side translation table `(label ↔ Irr(C),
   sectorBasis cfg ↔ basis of Hom(W, a_{cfg(0)} ⊗ ⋯ ⊗ a_{cfg(n-1)}))`,
   `IndefiniteParticleSectorCoordinates sectorBasis = ⨁_{cfg ∈ Irr(C)^N}
   (basis of Hom(W, a_1 ⊗ ⋯ ⊗ a_N)) → ℂ`, which is exactly the coordinate
   realisation of `H_N^W = Hom_C(W, Q^{⊗N})` via the sector-expansion
   bijection. The C-gate identification matches the GLOSSARY pre-binding
   verbatim: at the coordinate-skeleton level, every basis vector of
   `IndefiniteParticleSectorCoordinates sectorBasis` (i.e. every pair
   `⟨cfg, b⟩` with `cfg : Config label n` and `b : sectorBasis cfg`)
   indexes a basis vector of `H_N^W` once the user supplies the Hom-fibre
   basis (the `sectorBasis cfg`). The `IndefiniteParticleSectorExpansion`
   linear equivalence `IndefiniteParticleSectorCoordinates sectorBasis ≃ₗ[ℂ]
   IndefiniteParticleComponentCoordinates sectorBasis` realises the
   "expansion over configurations" direction (flattened ↔ per-configuration)
   of the same identification; its isometry counterpart
   `indefiniteParticleSector_pairing_preserved` records that this expansion
   preserves the canonical coordinate pairing (the `H_N^W`-side inner
   product induced by the `(W, Q^{⊗N})` Hilbert-space structure). Per
   `stocktake/reports/cad-lean.md` §5 line 358 and bridge report §3
   `opus-hilbert-bridge.md:249`, this identification is the load-bearing
   CAD support construction for `[[def:Hlatt]]`. The C-gate is CLEARED.

-- GLOSSARY: def:Q (GLOSSARY.md:406) — Local cell object. The canonical
   statement at `summary.tex:194` says: "A local cell object is any object
   `Q ∈ C`. The Hilbert spaces of Definitions def:Hlatt–def:HP are built
   from a chosen `Q` via `Q^{⊗N}` and `Hom_C(W, Q^{⊗N})` irrespective of
   how `Q` was constructed." This file is the GLOSSARY-pre-registered
   canonical CAD anchor for `def:Q` — verbatim per the Translation map CAD
   section at GLOSSARY.md:425:
   "`Foundations/ProjectDefinitions.lean::LocalOccupationModel` (Phase 5
   P5.6). `LocalOccupationModel.vacuum : label` is unconstrained — the
   choice of `Q` (and which simple is vacuum) is supplied by the user at
   instantiation. For the canonical `Q_full` default (P1.6(h)), supply the
   full label set. Per `stocktake/reports/cad-lean.md` §5 line 358." The
   Lean structure in this file is
   ```
   structure LocalOccupationModel (label : Type u)
       [Fintype label] [DecidableEq label] where
     vacuum : label
   ```
   — exactly the coordinate-skeleton realisation of `def:Q` described in
   the pre-binding: the `label` parameter is the coordinate skeleton of
   the summands of `Q` (in the canonical `Q_full = ⊕_{a ∈ Irr(C)} a`
   choice, `label ↔ Irr(C)` with each simple `a` mapped to its own label),
   and the `vacuum : label` field supplies the canonical choice of which
   simple is the unit object `\one` (per [P1.6(a)] CONVENTIONS the vacuum
   index is locked but the convention is per-instantiation). The
   companion `LocalOccupationSummand label := label` abbrev makes the
   coordinate-summands identification explicit; the
   `LocalOccupationTensorSummand label n := Config label n` abbrev unfolds
   to `Fin n → label`, the coordinate skeleton of `Irr(C)^N` parametrising
   ordered configurations appearing in `Q^{⊗N}` (per the sector expansion
   of `def:Hlatt`). The dimension formula
   `localOccupationTensorSummand_card : Fintype.card
   (LocalOccupationTensorSummand label n) = Fintype.card label ^ n` is
   the coordinate-skeleton restatement of `|Irr(C)^N| = |Irr(C)|^N`
   (delegating to P5.3's `Config.card_configurations`). The vacuum
   identity `localOccupation_vacuum_particleNumber_zero` confirms that
   the all-vacuum configuration has particle number zero (delegating to
   P5.3's `Config.particleNumber_constant_vacuum`) — the
   coordinate-skeleton encoding that the empty configuration `\vac` lies
   in the zero-particle sector. The vacuum-index hazard called out in
   `CLAUDE.md` and `[[def:Q]]` Notes is naturally side-stepped here: the
   structure is parameterised over an arbitrary `label : Type u` with the
   `vacuum : label` field user-supplied; no convention-specific index is
   baked in.

-- GLOSSARY: def:particle-number (GLOSSARY.md:507) — Particle number.
   The canonical statement at `summary.tex:344` defines, on the basis
   `(a_1,...,a_N)` of `prop:conf-decomp`, the particle number
   `k(a_1,...,a_N) := #{i ∈ {1,...,N} : a_i ≠ \one}`. This file uses the
   particle-number FUNCTION (defined in P5.3
   `Foundations/Configurations.lean::Config.particleNumber` per the
   GLOSSARY pre-binding at GLOSSARY.md:536) to record the canonical
   vacuum-sector identity for the
   `Q`-tensor coordinate skeleton at the `LocalOccupationModel` level:
   `localOccupation_vacuum_particleNumber_zero` says that the constant
   all-vacuum configuration
   `Config.constant Q.vacuum : LocalOccupationTensorSummand label n`
   has particle number zero (delegating to
   `Config.particleNumber_constant_vacuum Q.vacuum` from P5.3). This is
   the project-definitions analogue of the truncated-Fock identity
   `zeroParticleSector_card : Fintype.card (Config localBasis 0) = 1`
   from P5.5 (which captures the cardinality side); together they pin
   the vacuum sector as the unique zero-particle stratum in the
   `def:particle-number` filtration. The particle-number bound
   `particleNumber_le_length` from P5.3 is also implicit (the
   `localOccupationTensorSummand_card` factorisation
   `|label|^n` includes every particle-number bin from 0 to n).

-- GLOSSARY: conv:basics (GLOSSARY.md:130) — Notation and conventions.
   The complex-vector-space default ("Vector spaces are complex unless
   otherwise stated") is invoked throughout this file: every coordinate
   space inherited from P5.4 is `→ ℂ` (`IndefiniteParticleSectorCoordinates
   sectorBasis = ConfigSpaceCoordinates sectorBasis`,
   `IndefiniteParticleComponentCoordinates sectorBasis =
   ConfigComponentCoordinates sectorBasis`); the linear equivalence
   `indefiniteParticleSectorExpansion` is `≃ₗ[ℂ]` — `ℂ`-linear. The
   dagger / categorical adjoint appears via the pairing
   `sigmaCoordinatePairing` and `piCoordinatePairing` of P5.2, whose
   compatibility is recorded by
   `indefiniteParticleSector_pairing_preserved`. The
   `noncomputable section` opening (source line 18) is the standard
   Mathlib idiom for `ℂ`-linear maps depending on classical decidability,
   inherited from P5.4's `configSpaceLinearEquiv`. The vacuum-simple
   `\one` / vacuum-leg substrate from `conv:basics` is realised in this
   file by the `LocalOccupationModel.vacuum : label` field per the
   explicit GLOSSARY pre-binding at GLOSSARY.md:160: "the `\one` notation
   maps to `Foundations/ProjectDefinitions.lean::LocalOccupationModel.vacuum`
   (which is unconstrained — the user supplies the choice)" — the
   structure carries no canonical choice, deferring it to user
   instantiation per [P1.6(a)] vacuum-index convention. The empty
   configuration `\vac` from `conv:basics` is realised by the
   constant vacuum configuration `Config.constant Q.vacuum :
   LocalOccupationTensorSummand label n` (its zero-particle property
   recorded by `localOccupation_vacuum_particleNumber_zero`).
-/

namespace CFTAnyons
namespace Foundations

noncomputable section

universe u v

/-- A finite local occupation model is a finite label type together with a
distinguished vacuum label.  The labels are the coordinate skeleton of the
summands of `Q`. -/
structure LocalOccupationModel (label : Type u) [Fintype label] [DecidableEq label] where
  vacuum : label

/-- The summand labels of the local occupation object `Q`. -/
abbrev LocalOccupationSummand (label : Type u) :=
  label

/-- The summand labels appearing in the formal tensor power `Q^{tensor n}` are
ordered configurations of local occupation labels. -/
abbrev LocalOccupationTensorSummand (label : Type u) (n : ℕ) :=
  Config label n

theorem localOccupationTensorSummand_card
    (label : Type u) [Fintype label] [DecidableEq label] (n : ℕ) :
    Fintype.card (LocalOccupationTensorSummand label n) =
      Fintype.card label ^ n := by
  exact Config.card_configurations label n

theorem localOccupation_vacuum_particleNumber_zero
    {label : Type u} [Fintype label] [DecidableEq label]
    (Q : LocalOccupationModel label) (n : ℕ) :
    Config.particleNumber Q.vacuum
      (Config.constant Q.vacuum : LocalOccupationTensorSummand label n) = 0 := by
  exact Config.particleNumber_constant_vacuum Q.vacuum

/-- Coordinate model for a fixed total-charge sector `H_N^W` after choosing,
for every ordered configuration, a finite basis for the corresponding
`Hom(W, a_1 tensor ... tensor a_N)` sector. -/
abbrev IndefiniteParticleSectorCoordinates
    {label : Type u} {n : ℕ} (sectorBasis : Config label n → Type v) :=
  ConfigSpaceCoordinates sectorBasis

/-- Component coordinates for the configuration-sector expansion of a fixed
`H_N^W`. -/
abbrev IndefiniteParticleComponentCoordinates
    {label : Type u} {n : ℕ} (sectorBasis : Config label n → Type v) :=
  ConfigComponentCoordinates sectorBasis

/-- Coordinate-level expansion of the fixed total-charge sector over ordered
site configurations. -/
def indefiniteParticleSectorExpansion
    {label : Type u} {n : ℕ} {sectorBasis : Config label n → Type v} :
    IndefiniteParticleSectorCoordinates sectorBasis ≃ₗ[ℂ]
      IndefiniteParticleComponentCoordinates sectorBasis :=
  configSpaceLinearEquiv

theorem indefiniteParticleSectorExpansion_apply
    {label : Type u} {n : ℕ} {sectorBasis : Config label n → Type v}
    (x : IndefiniteParticleSectorCoordinates sectorBasis)
    (cfg : Config label n) (b : sectorBasis cfg) :
    indefiniteParticleSectorExpansion x cfg b = x ⟨cfg, b⟩ := by
  rfl

theorem indefiniteParticleSector_card_components
    {label : Type u} {n : ℕ} {sectorBasis : Config label n → Type v}
    [Fintype (Config label n)] [∀ cfg, Fintype (sectorBasis cfg)] :
    Fintype.card (Sigma sectorBasis) =
      ∑ cfg : Config label n, Fintype.card (sectorBasis cfg) := by
  exact configSpace_card_components

theorem indefiniteParticleSector_pairing_preserved
    {label : Type u} {n : ℕ} {sectorBasis : Config label n → Type v}
    [Fintype (Config label n)] [∀ cfg, Fintype (sectorBasis cfg)]
    (x y : IndefiniteParticleSectorCoordinates sectorBasis) :
    piCoordinatePairing (sigmaToPi x) (sigmaToPi y) =
      sigmaCoordinatePairing x y := by
  exact configSpaceLinearEquiv_preserves_coordinatePairing x y

end

end Foundations
end CFTAnyons
