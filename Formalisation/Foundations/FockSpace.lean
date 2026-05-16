import Formalisation.Foundations.Configurations
import Formalisation.Foundations.DirectSumCoordinates

/-!
# Finite coordinate skeleton for truncated distinguishable Fock spaces

The local source describes distinguishable Fock space as the direct sum over
particle number, with the zero-particle sector identified with the vacuum
line.  This file proves only the finite coordinate truncation: after choosing
a finite local coordinate basis, the basis words of lengths `0, ..., maxN`
form a sigma type over particle number, and its cardinality is the finite
geometric sum of the fixed-length word cardinalities.

Port provenance: REFACTORED port from
`cft-anyons-deprecated/Formalisation/Foundations/FockSpace.lean` at
MIGRATION_PLAN.md:216 (P5.5). The CAD source (105 LOC) contains TWO
namespaces; this file ports only the GENERIC `CFTAnyons.Foundations` content
(CAD source lines 15–88; 8 named declarations:
`ParticleNumberUpTo`, `TruncatedFockBasis`, `TruncatedFockCoordinates`,
`TruncatedFockComponentCoordinates`, `truncatedFockLengthExpansion`,
`truncatedFockLengthExpansion_apply`, `truncatedFockBasis_card`,
`zeroParticleSector_card`, `oneParticleSector_card`,
`truncatedFockLengthExpansion_preserves_coordinatePairing` — 4 abbrev + 1 def
+ 5 theorems = 10 named decls in this body slice). The Fibonacci-specific
`FibonacciConfigurations` namespace (CAD source lines 90–100; 1 declaration:
`fibonacci_truncatedFockBasis_card`) is DROPPED from this commit because it
depends on `Fibonacci.FibLabel` and `fibLabel_card`, which were themselves
dropped at P5.3 (and the same `FibonacciConfigurations` decoupling applied
to `Foundations/ConfigurationSpace.lean` at P5.4) and tracked under bd
follow-up `cft-anyons-5tm.3`
("Re-create FibonacciConfigurations namespace at
`Formalisation/Fibonacci/Configurations.lean` (P5.3 deferral)" — extended at
P5.4 to also cover `Foundations/ConfigurationSpace.lean`'s 1-decl Fibonacci
block, and extended again at P5.5 to also cover this file's 1-decl Fibonacci
block). A verbatim port at P5.5 would FAIL at `lake build` with `error:
unknown namespace 'Fibonacci'` at the source-line-92 `open Fibonacci` and a
downstream `failed to synthesize Fintype` at the source-line-96
`TruncatedFockBasis FibLabel maxN`; the `FibonacciConfigurations` namespace
of `FockSpace.lean` is therefore added to the same bd follow-up
`cft-anyons-5tm.3` for re-creation as a new file
`Formalisation/Fibonacci/FockSpace.lean` after P5.7 (`Fibonacci/Basic.lean`)
lands; the new file will import only `Foundations.FockSpace` +
`Fibonacci.Basic` + `Foundations.Configurations` +
`Foundations.DirectSumCoordinates` (NOT `Fibonacci.FusionRules` — same
over-import pattern as the `FibonacciConfigurations` blocks of P5.3/P5.4 do
NOT exhibit on this file; the CAD source imports only the two
`Foundations.*` files, with the `open Fibonacci` block transitively pulling
`Fibonacci.FibLabel` and `fibLabel_card` from the dropped namespaces). C-gate
behaviour-preservation: each of the 10 generic decls is unchanged in
statement and proof relative to CAD; the dropped Fibonacci-specific
declaration `fibonacci_truncatedFockBasis_card` remains provable verbatim
once `Fibonacci.Basic` + the bd-followup-restored `fibLabel_card` are
available (its CAD proof is the one-line
`rw [truncatedFockBasis_card, fibLabel_card]`). The CAD source's module
docstring (lines 4–13) is preserved verbatim except for the implicit fact
that the Fibonacci specialisation is no longer present in this file; the
generic body from `namespace CFTAnyons` to `end CFTAnyons` is byte-identical
to CAD source lines 15–88 + 102–105 modulo the dropped `FibonacciConfigurations`
block (lines 90–100).

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
   for `summary.tex` §4.2 sector expansion; `Foundations/FockSpace.lean`
   (P5.5) for `summary.tex` §4.3 truncated-Fock-space view". The
   `summary.tex` §4.3 truncated-Fock-space view is realised here as the
   linear equivalence `truncatedFockLengthExpansion :
   TruncatedFockCoordinates localBasis maxN ≃ₗ[ℂ]
   TruncatedFockComponentCoordinates localBasis maxN`, where
   `TruncatedFockCoordinates localBasis maxN = TruncatedFockBasis
   localBasis maxN → ℂ` is the flattened coordinate vector over all
   `(particle-number, length-n word)` pairs and
   `TruncatedFockComponentCoordinates localBasis maxN = ∀ n :
   ParticleNumberUpTo maxN, Config localBasis n.val → ℂ` is the
   per-particle-number coordinate family. The truncated-Fock basis is the
   sigma type `TruncatedFockBasis localBasis maxN = Σ (n :
   ParticleNumberUpTo maxN), Config localBasis n.val`, packaging the
   layered direct-sum expansion `F_{≤ maxN}(V_local) = ⊕_{n=0}^{maxN}
   V_local^{⊗n}` at coordinate level (with each `V_local^{⊗n}` realised
   via P5.3's `Config localBasis n = Fin n → localBasis` coordinate
   substrate). The dimension formula `truncatedFockBasis_card :
   Fintype.card (TruncatedFockBasis localBasis maxN) = ∑ n :
   ParticleNumberUpTo maxN, Fintype.card localBasis ^ n.val` is the
   coordinate-level realisation of `dim F_{≤ maxN} = ∑_{n=0}^{maxN}
   (dim V_local)^n`, the truncated geometric-sum dimension of the
   distinguishable-particle Fock space. Boundary specialisations
   `zeroParticleSector_card : Fintype.card (Config localBasis 0) = 1`
   (vacuum sector) and `oneParticleSector_card : Fintype.card (Config
   localBasis 1) = Fintype.card localBasis` (single-particle sector) record
   the explicit `n=0` and `n=1` slices. The isometry statement
   `truncatedFockLengthExpansion_preserves_coordinatePairing` says that
   `truncatedFockLengthExpansion` is an isometry of the standard
   coordinate pairings inherited from P5.2 (`sigmaCoordinatePairing` on
   the flattened side, the composite `piCoordinatePairing ∘ sigmaToPi` on
   the per-component side) — the coordinate-level statement that the
   particle-number expansion is an orthogonal direct sum. The categorical
   Hom-space `Hom_C(W, Q^{⊗N})` is OUT OF SCOPE per the original module
   docstring's coordinate-skeleton disclaimer; the categorical `H_N^W`
   realisation with categorical Hom-spaces is supplied separately at P5.6
   `ProjectDefinitions.lean::IndefiniteParticleSectorCoordinates` per the
   canonical-anchor line at GLOSSARY.md:497.

-- GLOSSARY: def:particle-number (GLOSSARY.md:507) — Particle number. The
   canonical statement at `summary.tex:344` defines, on the basis
   `(a_1,\dots,a_N)` of `prop:conf-decomp`, the particle number
   `k(a_1,\dots,a_N) := \#\{i \in\{1,\dots,N\} : a_i \neq \one\}`. This
   file's `ParticleNumberUpTo maxN := Fin (maxN + 1)` is the canonical
   coordinate-skeleton index type for the truncated particle-number
   stratification of the distinguishable Fock space: it indexes the
   particle-number slices `n ∈ {0, 1, …, maxN}` over which
   `TruncatedFockBasis` is the sigma type
   `Σ n : ParticleNumberUpTo maxN, Config localBasis n.val`. This file does
   NOT itself define a particle-number FUNCTION (that is P5.3's
   `Foundations/Configurations.lean::Config.particleNumber`); rather, it
   uses the index type as the outer label of the truncated direct sum.
   The CAD-side GLOSSARY pre-binding at GLOSSARY.md:536 names
   `Foundations/Configurations.lean` (P5.3) as the canonical coordinate
   skeleton; this file is the truncated-Fock specialisation of that
   skeleton over a per-particle-number sum. In the Fibonacci instantiation
   (deferred to bd `cft-anyons-5tm.3`), `localBasis := FibLabel` gives the
   two-label-alphabet Fock space with `vacuum := one : FibLabel`; the
   resulting truncated dimension `∑ n, 2 ^ n.val` is the geometric-sum
   formula proved in the dropped `fibonacci_truncatedFockBasis_card`.

-- GLOSSARY: def:mobile-Fock (GLOSSARY.md:1940) — Mobile-Fock Hilbert space
   (MMA formulation). The canonical statement (synthesised by the bridge
   report from MMA `hilbert.jl:75-98`) is
   `H_MMA(L) = ⊕_{N=0}^{L} ⊕_{c ∈ simples(C)} ⊕_{config ∈
   enumerate_configs_hc(L,N,C)} ⊕_{fusion_tree of (config.labels) → c} ℂ`.
   The OUTER ⊕_{N=0}^{L} layer of mobile-Fock (the particle-number /
   non-vacuum-leg-count direct sum, truncated at the lattice length `L`)
   is the SAME direct-sum-structure-over-particle-number that this file
   formalises as `TruncatedFockBasis localBasis maxN = Σ n :
   ParticleNumberUpTo maxN, Config localBasis n.val`, with the MMA-side
   `L ↔ maxN` correspondence (per the [[def:mobile-Fock]] vs [[def:Hlatt]]
   translation map at GLOSSARY.md:1993-2001 the two are equivalent under
   vacuum-leg absorption; this file's truncated-Fock view is the
   distinguishable-particle view, NOT the hard-core view — the MMA
   `enumerate_configs_hc` hard-core constraint corresponds to an
   additional filter not enforced here). This file's coordinate-skeleton
   realisation is on the `def:Hlatt` side of the [[def:Hlatt]] /
   [[def:mobile-Fock]] equivalence (per the GLOSSARY.md:497 explicit
   pre-binding of this file to the `def:Hlatt` Translation map's CAD
   "Supporting CAD constructions on the same `H_N^W` skeleton" line as
   the P5.5 anchor for "`summary.tex` §4.3 truncated-Fock-space view");
   `def:mobile-Fock` is the MMA-framing companion whose outer
   particle-number direct sum agrees with this file's outer sigma layer.
   No direct CAD formalisation of mobile-Fock itself is present
   (per GLOSSARY.md:2022: "CAD: not directly formalised — CAD has the
   `H_N^W` coordinate skeleton (via [[def:Hlatt]]'s CAD entry), which
   translates to mobile-Fock via the §2.2 bijection (vacuum-leg
   absorption)"); this file is the truncated-Fock view of that
   coordinate skeleton.

-- GLOSSARY: conv:basics (GLOSSARY.md:130) — Notation and conventions.
   The complex-vector-space default ("Vector spaces are complex unless
   otherwise stated") is invoked throughout this file: every coordinate
   space is `→ ℂ` (`TruncatedFockCoordinates localBasis maxN =
   TruncatedFockBasis localBasis maxN → ℂ`;
   `TruncatedFockComponentCoordinates localBasis maxN = ∀ n, Config
   localBasis n.val → ℂ`); the linear equivalence
   `truncatedFockLengthExpansion` is explicitly `≃ₗ[ℂ]` — `ℂ`-linear. The
   dagger / categorical adjoint appears in coordinate form via Mathlib's
   `star` typeclass, inherited transparently through
   `truncatedFockLengthExpansion_preserves_coordinatePairing`'s use of
   the `sigmaCoordinatePairing` and `piCoordinatePairing` from P5.2
   `DirectSumCoordinates.lean` (both defined as `∑ star (x _) * y _`,
   the second-argument-linear physics convention). The
   `noncomputable section` opening (source line 18) is the standard
   Mathlib idiom for `ℂ`-linear maps depending on classical decidability,
   inherited from the underlying `sigmaPiLinearEquiv` of P5.2. The
   `classical` tactic in `truncatedFockBasis_card` is the Mathlib
   rendering of "all our finite-dim coordinate manipulations are
   classical". The unit-object substrate `\one` / "vacuum simple" from
   `conv:basics` is implicit in the abstract `localBasis : Type u`
   alphabet (whose canonical Fibonacci instantiation `localBasis :=
   FibLabel` with `\one := FibLabel.one` is deferred to bd
   `cft-anyons-5tm.3`); the vacuum sector boundary condition
   `zeroParticleSector_card : Fintype.card (Config localBasis 0) = 1`
   records the canonical empty-configuration vector `\vac`.
-/

namespace CFTAnyons
namespace Foundations

noncomputable section

universe u

/-- Particle-number labels in a finite truncation up to `maxN`. -/
abbrev ParticleNumberUpTo (maxN : ℕ) :=
  Fin (maxN + 1)

/-- Coordinate basis words for a truncated distinguishable Fock space with
particle numbers `0, ..., maxN`.  A point consists of a particle number and a
word of that length in the chosen local basis. -/
abbrev TruncatedFockBasis (localBasis : Type u) (maxN : ℕ) :=
  Sigma fun n : ParticleNumberUpTo maxN => Config localBasis n.val

/-- Flattened coordinates on the finite truncated Fock basis. -/
abbrev TruncatedFockCoordinates (localBasis : Type u) (maxN : ℕ) :=
  TruncatedFockBasis localBasis maxN → ℂ

/-- Component coordinates, one fixed-particle-number coordinate vector for
each length in the truncation. -/
abbrev TruncatedFockComponentCoordinates (localBasis : Type u) (maxN : ℕ) :=
  ∀ n : ParticleNumberUpTo maxN, Config localBasis n.val → ℂ

/-- Coordinate-level direct-sum expansion by particle number. -/
def truncatedFockLengthExpansion {localBasis : Type u} {maxN : ℕ} :
    TruncatedFockCoordinates localBasis maxN ≃ₗ[ℂ]
      TruncatedFockComponentCoordinates localBasis maxN :=
  sigmaPiLinearEquiv

theorem truncatedFockLengthExpansion_apply
    {localBasis : Type u} {maxN : ℕ}
    (x : TruncatedFockCoordinates localBasis maxN)
    (n : ParticleNumberUpTo maxN) (word : Config localBasis n.val) :
    truncatedFockLengthExpansion x n word = x ⟨n, word⟩ := by
  rfl

/-- The truncated distinguishable-Fock coordinate count is the finite sum of
fixed-length word counts. -/
theorem truncatedFockBasis_card
    (localBasis : Type u) [Fintype localBasis] [DecidableEq localBasis]
    (maxN : ℕ) :
    Fintype.card (TruncatedFockBasis localBasis maxN) =
      ∑ n : ParticleNumberUpTo maxN, Fintype.card localBasis ^ n.val := by
  classical
  unfold TruncatedFockBasis ParticleNumberUpTo
  rw [Fintype.card_sigma]
  refine Finset.sum_congr rfl ?_
  intro n _
  exact Config.card_configurations localBasis n.val

/-- The zero-particle word sector has one basis vector. -/
theorem zeroParticleSector_card (localBasis : Type u) [Fintype localBasis] :
    Fintype.card (Config localBasis 0) = 1 := by
  simp [Config]

/-- The one-particle word sector has the same cardinality as the local basis. -/
theorem oneParticleSector_card
    (localBasis : Type u) [Fintype localBasis] [DecidableEq localBasis] :
    Fintype.card (Config localBasis 1) = Fintype.card localBasis := by
  rw [Config.card_configurations]
  simp

/-- The particle-number expansion preserves the standard finite coordinate
pairing. -/
theorem truncatedFockLengthExpansion_preserves_coordinatePairing
    {localBasis : Type u} {maxN : ℕ}
    [Fintype localBasis] [DecidableEq localBasis]
    (x y : TruncatedFockCoordinates localBasis maxN) :
    piCoordinatePairing (sigmaToPi x) (sigmaToPi y) =
      sigmaCoordinatePairing x y := by
  exact sigmaToPi_preserves_coordinatePairing x y

end

end Foundations
end CFTAnyons
