import Mathlib

/-!
# Finite coordinate model for direct-sum decompositions

This file formalises the finite vector-space skeleton behind a categorical
direct-sum Hom expansion after bases have been chosen in each summand.  It
does not construct categorical biproducts or Hom spaces; it proves that a
family of finite coordinate vectors indexed by summands is linearly equivalent
to one coordinate vector indexed by the sigma type of all summand/basis pairs.

Port provenance: ported verbatim from
`cft-anyons-deprecated/Formalisation/Foundations/DirectSumCoordinates.lean`
at MIGRATION_PLAN.md:213 (P5.2). Body is byte-identical to the canonical
CAD source from `namespace CFTAnyons` to EOF; only addition is this
top-of-file docstring extension with `Cross-references to GLOSSARY.md`
below. The `Formalisation/Foundations/` sub-directory was created at P5.1
(SkeletalFusion.lean) — this is the second file landing in it.

## Cross-references to GLOSSARY.md

-- GLOSSARY: def:Hlatt (GLOSSARY.md:447) — N-site Hilbert space, fixed
   lattice. The canonical statement at `summary.tex:285` defines
   `Hh_N^W := Hom_C(W, Q^{⊗N})` and the full `N`-site space as
   `Hh_N = ⊕_{W ∈ Irr(C)} Hh_N^W`. This file is the
   GLOSSARY-pre-registered canonical CAD support construction for
   `def:Hlatt` — verbatim per the Translation map CAD section at
   GLOSSARY.md:497: "Supporting CAD constructions on the same `H_N^W`
   skeleton: `Foundations/DirectSumCoordinates.lean` (Phase 5 P5.2) for
   the Σ↔Π sum equivalence". The Σ↔Π sum equivalence is realised here
   as `sigmaPiLinearEquiv : (Sigma κ → ℂ) ≃ₗ[ℂ] (∀ i, κ i → ℂ)`: the
   sigma-indexed coordinate vector `Sigma κ → ℂ` is the flattened
   coordinate description of a finite biproduct `⊕_i V_i` (each summand
   `V_i` itself coordinatised by `κ i → ℂ`), and the dependent product
   `∀ i, κ i → ℂ` is the same finite biproduct viewed as a Pi-type of
   per-component coordinate functions; the linear equivalence
   `sigmaPiLinearEquiv` and its symmetric inverse `piToSigma` interchange
   the two presentations. This is the finite-vector-space skeleton behind
   the categorical direct-sum Hom expansion in `def:Hlatt`'s
   `Hh_N = ⊕_W Hh_N^W`: once bases have been chosen in each
   charge-sector summand `Hh_N^W` (with `Hh_N^W ≅ (κ W → ℂ)` for some
   per-sector coordinate index `κ W`), the full `N`-site space's
   coordinates `Hh_N ≅ (Sigma κ → ℂ)` are interchangeable with the
   per-sector coordinate family `∀ W, κ W → ℂ`. Companion declarations:
   `def:Hlatt`'s coordinate biproduct structure is realised by the
   `componentInclusion` / `componentProjection` linear maps and the
   identity `sum_componentInclusion_projection : (∑ i,
   componentInclusion i (componentProjection i x)) = x` which is the
   coordinate-level reconstruction of `x ∈ ⊕_i V_i` from its components.
   The card identity `card_sigma_components : Fintype.card (Sigma κ) =
   ∑ i, Fintype.card (κ i)` is the dimension formula
   `dim (⊕_i V_i) = ∑_i dim V_i` at the coordinate level — the finite
   dimension of `def:Hlatt`'s `Hh_N = ⊕_W Hh_N^W`. The associated
   categorical biproducts, Hom spaces, and tensor structure are OUT OF
   SCOPE per the original module docstring's disclaimer (source lines
   6–10: "It does not construct categorical biproducts or Hom spaces");
   the canonical-anchor line at `GLOSSARY.md:497` similarly delimits
   this file to the coordinate-skeleton level, with the categorical
   `H_N^W` realisation supplied separately at P5.6
   `ProjectDefinitions.lean::IndefiniteParticleSectorCoordinates`.

-- GLOSSARY: conv:basics (GLOSSARY.md:130) — Notation and conventions.
   The complex-vector-space default ("Vector spaces are complex unless
   otherwise stated") is invoked throughout this file: every coordinate
   space is `→ ℂ` (e.g. `Sigma κ → ℂ`, `∀ i, κ i → ℂ`, `κ i → ℂ`); the
   linear equivalence `sigmaPiLinearEquiv` and the linear maps
   `componentInclusion` / `componentProjection` are explicitly
   `≃ₗ[ℂ]` / `→ₗ[ℂ]` — `ℂ`-linear. The dagger / categorical adjoint
   appears in coordinate form as the complex-conjugate convention via
   Mathlib's `star` typeclass: the standard finite coordinate pairings
   `sigmaCoordinatePairing`, `piCoordinatePairing`, and
   `componentCoordinatePairing` are all `∑_{indices} star (x _) * y _`,
   i.e. `<x | y> := ∑ (x*) y` (the second-argument-linear physics
   convention). The "categorical adjoint = complex conjugate transpose
   for matrices" clause of `conv:basics` is realised explicitly in
   `componentProjection_adjoint_inclusion` and
   `componentProjection_adjoint_inclusion_right`: the projection
   `componentProjection i` is the (Mathlib `star`-pairing) adjoint of
   the inclusion `componentInclusion i` with respect to the standard
   coordinate pairings — the coordinate-level statement that "the
   component projection of an orthogonal finite direct sum is the
   adjoint of the corresponding inclusion". The
   `noncomputable section` opening (source line 16) is the standard
   Mathlib idiom when working with `ℂ`-linear maps that depend on
   non-constructive choices (here, classical decidability via
   `DecidableEq` instance arguments). The `∑ i : ι, ...`,
   `∑ k : κ i, ...`, `∑ s : Sigma κ, ...` notations are Mathlib's
   `Finset.sum`/`Fintype.sum` renderings of the categorical "sum over
   indexing set" used implicitly throughout `summary.tex` §4 in
   `def:Hlatt`'s biproduct expansion. The `classical` tactic in the
   isometry / pairing lemmas (`sigmaToPi_preserves_coordinatePairing`,
   `piToSigma_preserves_coordinatePairing`,
   `componentInclusion_preserves_coordinatePairing`,
   `componentProjection_adjoint_inclusion`,
   `componentProjection_adjoint_inclusion_right`,
   `componentRangeProjection_self_adjoint_pairing`,
   `sum_componentInclusion_projection`, `card_sigma_components`) is the
   Mathlib rendering of "all our finite-dim coordinate manipulations
   are classical".
-/

namespace CFTAnyons
namespace Foundations

noncomputable section

universe u v

variable {ι : Type u} {κ : ι → Type v}

/-- Flatten a sigma-indexed coordinate vector into dependent summand
coordinates. -/
def sigmaToPi (x : Sigma κ → ℂ) : (∀ i, κ i → ℂ) :=
  fun i k => x ⟨i, k⟩

/-- Unflatten dependent summand coordinates into one sigma-indexed vector. -/
def piToSigma (x : ∀ i, κ i → ℂ) : Sigma κ → ℂ :=
  fun s => x s.1 s.2

@[simp]
theorem piToSigma_sigmaToPi (x : Sigma κ → ℂ) :
    piToSigma (sigmaToPi x) = x := by
  funext s
  rfl

@[simp]
theorem sigmaToPi_piToSigma (x : ∀ i, κ i → ℂ) :
    sigmaToPi (piToSigma x) = x := by
  funext i k
  rfl

/-- The finite coordinate direct-sum expansion as a complex-linear equivalence. -/
def sigmaPiLinearEquiv :
    (Sigma κ → ℂ) ≃ₗ[ℂ] (∀ i, κ i → ℂ) where
  toFun := sigmaToPi
  invFun := piToSigma
  left_inv := piToSigma_sigmaToPi
  right_inv := sigmaToPi_piToSigma
  map_add' := by
    intro x y
    rfl
  map_smul' := by
    intro c x
    rfl

theorem sigmaPiLinearEquiv_apply (x : Sigma κ → ℂ) (i : ι) (k : κ i) :
    sigmaPiLinearEquiv x i k = x ⟨i, k⟩ := by
  rfl

/-- The dimension/cardinality of finite direct-sum coordinates is the sum of
the dimensions/cardinalities of the components. -/
theorem card_sigma_components [Fintype ι] [∀ i, Fintype (κ i)] :
    Fintype.card (Sigma κ) = ∑ i : ι, Fintype.card (κ i) := by
  classical
  simp

/-- Standard finite coordinate pairing on one sigma-indexed coordinate space. -/
def sigmaCoordinatePairing [Fintype (Sigma κ)]
    (x y : Sigma κ → ℂ) : ℂ :=
  ∑ s : Sigma κ, star (x s) * y s

/-- Standard finite coordinate pairing on dependent summand coordinates. -/
def piCoordinatePairing [Fintype ι] [∀ i, Fintype (κ i)]
    (x y : ∀ i, κ i → ℂ) : ℂ :=
  ∑ i : ι, ∑ k : κ i, star (x i k) * y i k

/-- Standard finite coordinate pairing on one component. -/
def componentCoordinatePairing {i : ι} [Fintype (κ i)]
    (x y : κ i → ℂ) : ℂ :=
  ∑ k : κ i, star (x k) * y k

/-- Flattening preserves the standard finite coordinate pairing.  This is the
coordinate-level unitary statement for orthogonal finite direct sums. -/
theorem sigmaToPi_preserves_coordinatePairing
    [Fintype ι] [∀ i, Fintype (κ i)]
    (x y : Sigma κ → ℂ) :
    piCoordinatePairing (sigmaToPi x) (sigmaToPi y) =
      sigmaCoordinatePairing x y := by
  classical
  unfold piCoordinatePairing sigmaCoordinatePairing sigmaToPi
  exact (Fintype.sum_sigma (fun s : Sigma κ => star (x s) * y s)).symm

/-- Unflattening preserves the standard finite coordinate pairing. -/
theorem piToSigma_preserves_coordinatePairing
    [Fintype ι] [∀ i, Fintype (κ i)]
    (x y : ∀ i, κ i → ℂ) :
    sigmaCoordinatePairing (piToSigma x) (piToSigma y) =
      piCoordinatePairing x y := by
  classical
  unfold piCoordinatePairing sigmaCoordinatePairing piToSigma
  exact Fintype.sum_sigma' (fun i k => star (x i k) * y i k)

/-- Coordinate inclusion of one component into the flattened direct sum. -/
def componentInclusion [DecidableEq ι] (i : ι) :
    (κ i → ℂ) →ₗ[ℂ] (Sigma κ → ℂ) where
  toFun x := fun s =>
    if h : s.1 = i then x (h ▸ s.2) else 0
  map_add' := by
    intro x y
    funext s
    by_cases h : s.1 = i <;> simp [h]
  map_smul' := by
    intro c x
    funext s
    by_cases h : s.1 = i <;> simp [h]

/-- Coordinate projection from the flattened direct sum onto one component. -/
def componentProjection (i : ι) :
    (Sigma κ → ℂ) →ₗ[ℂ] (κ i → ℂ) where
  toFun x := fun k => x ⟨i, k⟩
  map_add' := by
    intro x y
    rfl
  map_smul' := by
    intro c x
    rfl

@[simp]
theorem componentProjection_apply (i : ι) (x : Sigma κ → ℂ) (k : κ i) :
    componentProjection i x k = x ⟨i, k⟩ := by
  rfl

@[simp]
theorem componentInclusion_apply_same [DecidableEq ι]
    (i : ι) (x : κ i → ℂ) (k : κ i) :
    componentInclusion i x ⟨i, k⟩ = x k := by
  simp [componentInclusion]

theorem componentInclusion_apply_ne [DecidableEq ι]
    {i j : ι} (hij : j ≠ i) (x : κ i → ℂ) (k : κ j) :
    componentInclusion i x ⟨j, k⟩ = 0 := by
  simp [componentInclusion, hij]

/-- Projection after inclusion is the identity on the same component. -/
theorem componentProjection_inclusion_same [DecidableEq ι]
    (i : ι) (x : κ i → ℂ) :
    componentProjection i (componentInclusion i x) = x := by
  funext k
  simp [componentProjection, componentInclusion]

/-- Projection after inclusion is zero on different components. -/
theorem componentProjection_inclusion_ne [DecidableEq ι]
    {i j : ι} (hij : i ≠ j) (x : κ j → ℂ) :
    componentProjection i (componentInclusion j x) = 0 := by
  funext k
  simp [componentProjection, componentInclusion, hij]

/-- The sum of inclusion followed by projection over all finite components is
the identity on the flattened coordinate space. -/
theorem sum_componentInclusion_projection [Fintype ι] [DecidableEq ι]
    (x : Sigma κ → ℂ) :
    (∑ i : ι, componentInclusion i (componentProjection i x)) = x := by
  classical
  funext s
  cases s with
  | mk j k =>
      simp [componentInclusion, componentProjection]

/-- The range projection onto one flattened component. -/
def componentRangeProjection [DecidableEq ι] (i : ι) :
    (Sigma κ → ℂ) →ₗ[ℂ] (Sigma κ → ℂ) :=
  (componentInclusion i).comp (componentProjection i)

/-- Coordinate inclusions of orthogonal direct sums are isometries. -/
theorem componentInclusion_preserves_coordinatePairing
    [Fintype ι] [∀ i, Fintype (κ i)] [DecidableEq ι]
    (i : ι) (x y : κ i → ℂ) :
    sigmaCoordinatePairing (componentInclusion i x)
      (componentInclusion i y) =
      componentCoordinatePairing x y := by
  classical
  unfold sigmaCoordinatePairing componentCoordinatePairing componentInclusion
  rw [Fintype.sum_sigma]
  simp

/-- In finite coordinates, projection onto a component is the adjoint of
component inclusion with respect to the standard coordinate pairings. -/
theorem componentProjection_adjoint_inclusion
    [Fintype ι] [∀ i, Fintype (κ i)] [DecidableEq ι]
    (i : ι) (x : κ i → ℂ) (y : Sigma κ → ℂ) :
    sigmaCoordinatePairing (componentInclusion i x) y =
      componentCoordinatePairing x (componentProjection i y) := by
  classical
  unfold sigmaCoordinatePairing componentCoordinatePairing componentProjection
  rw [Fintype.sum_sigma]
  refine (Fintype.sum_eq_single (M := ℂ) i ?different).trans ?same
  · intro j hji
    simp [componentInclusion, hji]
  · simp [componentInclusion]

/-- Equivalent right-adjoint form for component inclusion and projection. -/
theorem componentProjection_adjoint_inclusion_right
    [Fintype ι] [∀ i, Fintype (κ i)] [DecidableEq ι]
    (i : ι) (x : κ i → ℂ) (y : Sigma κ → ℂ) :
    sigmaCoordinatePairing y (componentInclusion i x) =
      componentCoordinatePairing (componentProjection i y) x := by
  classical
  unfold sigmaCoordinatePairing componentCoordinatePairing componentProjection
  rw [Fintype.sum_sigma]
  refine (Fintype.sum_eq_single (M := ℂ) i ?different).trans ?same
  · intro j hji
    simp [componentInclusion, hji]
  · simp [componentInclusion]

/-- The range map onto one component is idempotent. -/
theorem componentRangeProjection_idempotent [DecidableEq ι]
    (i : ι) (x : Sigma κ → ℂ) :
    componentRangeProjection i (componentRangeProjection i x) =
      componentRangeProjection i x := by
  simp [componentRangeProjection, LinearMap.comp_apply,
    componentProjection_inclusion_same]

/-- Different component range maps are mutually orthogonal in the algebraic
projection sense. -/
theorem componentRangeProjection_orthogonal [DecidableEq ι]
    {i j : ι} (hij : i ≠ j) (x : Sigma κ → ℂ) :
    componentRangeProjection i (componentRangeProjection j x) = 0 := by
  simp [componentRangeProjection, LinearMap.comp_apply,
    componentProjection_inclusion_ne hij]

/-- The coordinate range projection is self-adjoint for the standard finite
coordinate pairing. -/
theorem componentRangeProjection_self_adjoint_pairing
    [Fintype ι] [∀ i, Fintype (κ i)] [DecidableEq ι]
    (i : ι) (x y : Sigma κ → ℂ) :
    sigmaCoordinatePairing (componentRangeProjection i x) y =
      sigmaCoordinatePairing x (componentRangeProjection i y) := by
  classical
  change
    sigmaCoordinatePairing (componentInclusion i (componentProjection i x)) y =
      sigmaCoordinatePairing x (componentInclusion i (componentProjection i y))
  rw [componentProjection_adjoint_inclusion]
  rw [componentProjection_adjoint_inclusion_right]

end

end Foundations
end CFTAnyons
