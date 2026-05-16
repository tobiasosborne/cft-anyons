import Mathlib

/-!
# LinearAlgebra.CoherentSystem — ported from cft-anyons-deprecated

Source: cft-anyons-deprecated/Formalisation/LinearAlgebra/CoherentSystem.lean
Port: cft-anyons P4.12 (MIGRATION_PLAN.md:197). Body unchanged from source;
this docstring block extended with GLOSSARY cross-references.

Finite coherent refinement systems and ascending observables.

This is a constant-coordinate finite matrix model of a coherent family of
refinement maps.  It formalises only the algebraic consequences of the
coherence equations after finite bases have been chosen.

Cross-references to `GLOSSARY.md`:

-- GLOSSARY: conv:basics
   Vector spaces are complex (`ℂ`); the dagger `f^\dagger` is the
   complex-conjugate transpose for matrices. Realised throughout this file
   as `Matrix.conjTranspose` (the `(·)^†` of `Matrix.mul_apply` /
   `Matrix.conjTranspose_apply`). All declarations work over `ℂ` indexed by a
   single finite (`Fintype`) type `ι` of basis labels with decidable
   equality — the constant-coordinate simplification (every level of the
   coherent tower uses the same fixed coordinate type `ι`; the partition
   index is reduced to `ℕ`). The defining isometry equation
   `(S.map n m).conjTranspose * S.map n m = 1` of `CoherentMatrixSystem.isometry`
   is the matrix realisation in `conv:basics`'s dagger of the abstract
   isometry condition `E_{P\to P'}^{\dagger} E_{P\to P'} = \id_{A_P}` of
   `def:refmap`.

-- GLOSSARY: def:refine
   The partition refinement order `P \preceq P'` of `summary.tex:403` of the
   directed set `(P, \preceq)`. Per the Translation map CAD section at
   `GLOSSARY.md:668`, this file is the canonical CAD anchor: "CAD's
   coherent-refinement structure (`LinearAlgebra/CoherentSystem.lean`,
   Phase 4 P4.12) implements the categorical compatible-family axioms
   abstractly but does not implement the partition combinatorics." The
   abstract directed-set structure is reduced to a totally-ordered chain
   `(ℕ, ≤)`: the structure's two indices `n m : ℕ` with the hypothesis
   `n ≤ m` stand in for `P \preceq P'` and the cellwise-local partition
   combinatorics is suppressed (the `\bigotimes_{I \in P}` cellwise
   decomposition of `def:refmap` lives in `LinearAlgebra/Tensor.lean` (P4.4),
   `TensorPower.lean` (P4.5), `HeterogeneousTensor.lean` (P4.6); the
   coherent-family abstraction here is a `n ≤ m`-indexed compatible tower
   sitting above those tensor-product cellwise-local building blocks).

-- GLOSSARY: def:refmap
   The refinement map `E_{P\to P'}: A_P \to A_{P'}` of `summary.tex:411`,
   required to be an isometry (`E_{P\to P'}^{\dagger} E_{P\to P'} =
   \id_{A_P}`) and cellwise local. The `CoherentMatrixSystem.map` field
   `map : ℕ → ℕ → Matrix ι ι ℂ` IS the matrix realisation of
   `E_{P\to P'}` for the `(ℕ, ≤)`-indexed totally-ordered chain
   simplification of the partition directed-set; the `isometry` field
   `(S.map n m).conjTranspose * S.map n m = 1` IS the isometry condition
   `E_{P\to P'}^{\dagger} E_{P\to P'} = \id_{A_P}` of `def:refmap`. The
   matrix-algebra-level packaging `FiniteFineGraining` (per the
   `def:refmap` canonical CAD anchor at `GLOSSARY.md:717`,
   `LinearAlgebra/FineGraining.lean`, P4.11) packages a SINGLE refinement
   map; `CoherentMatrixSystem` here packages a coherent FAMILY of
   refinement maps `{map n m : n ≤ m}` along the `(ℕ, ≤)` chain. The
   cellwise-local tensor-product structure of `def:refmap` is handled
   separately in `Tensor.lean` (P4.4), `TensorPower.lean` (P4.5),
   `HeterogeneousTensor.lean` (P4.6).

-- GLOSSARY: def:indlim
   The inductive limit `\Hh_\infty^{W} := \overline{\varinjlim_{P}
   \Hh_P^{W}}` of `summary.tex:427`, built from a `def:indlim`
   compatible family of refinement maps satisfying `E_{P\to P} = \id`
   and `E_{P'\to P''} E_{P\to P'} = E_{P\to P''}`. This file is the
   GLOSSARY-pre-registered canonical CAD anchor for `def:indlim` —
   verbatim per the Translation map CAD section at `GLOSSARY.md:771`:
   "`LinearAlgebra/CoherentSystem.lean` (Phase 4 P4.12) —
   compatible-family axioms (`E_{P→P}=id`, `E_{P'→P''} ∘ E_{P→P'} =
   E_{P→P''}`) proved. Hilbert completion of the algebraic direct limit
   not in CAD scope (CAD is finite-dim coordinate-only)." The structure
   `CoherentMatrixSystem ι` packages the compatible family as: `map n n
   = 1` (`id_map` field; the `E_{P\to P} = \id` condition),
   `map m l * map n m = map n l` for `n ≤ m ≤ l` (`comp_map` field; the
   compatibility / associativity-of-refinement equation `E_{P'\to P''}
   E_{P\to P'} = E_{P\to P''}`), and the per-map isometry field. The
   `coherentAscending` and `coherentLogicalLift` ascending / lifting
   channels are functorial along the `(ℕ, ≤)` chain — the
   `coherentAscending_comp` theorem
   (`coherentAscending S n m (coherentAscending S m l O) =
   coherentAscending S n l O`) and `coherentLogicalLift_comp` theorem
   (the dual `coherentLogicalLift S m l (coherentLogicalLift S n m O)
   = coherentLogicalLift S n l O`) discharge the compatibility-along-
   composition of the channel structure built on top of the family; the
   `coherentAscending_unital` theorem `coherentAscending S n m 1 = 1`
   discharges the unital identity of the `def:ascending` ascending
   channel `\Aa(\id_{A_{P'}}) = \id_{A_P}` at every level of the chain;
   the `coherentLogicalLift_id` theorem `coherentLogicalLift S n n O = O`
   discharges the `n = m` base case via the `id_map` field. The Hilbert
   completion `\overline{\varinjlim_P \Hh_P^W}` of the algebraic direct
   limit is explicitly OUT OF CAD SCOPE per the canonical-anchor
   line — CAD works at the matrix-algebra level (finite-dimensional
   coordinate-only). The downstream analytic infrastructure (Hilbert
   completion as a topological closure) is not formalised in this repo.
-/

namespace CFTAnyons
namespace LinearAlgebra

noncomputable section

open Matrix

structure CoherentMatrixSystem (ι : Type*) [Fintype ι] [DecidableEq ι] where
  map : ℕ → ℕ → Matrix ι ι ℂ
  id_map : ∀ n, map n n = 1
  comp_map : ∀ {n m l : ℕ}, n ≤ m → m ≤ l → map m l * map n m = map n l
  isometry : ∀ {n m : ℕ}, n ≤ m → (map n m).conjTranspose * map n m = 1

variable {ι : Type*} [Fintype ι] [DecidableEq ι]

/-- Ascend a fine-scale observable along a finite refinement map. -/
def coherentAscending (S : CoherentMatrixSystem ι) (n m : ℕ)
    (O : Matrix ι ι ℂ) : Matrix ι ι ℂ :=
  (S.map n m).conjTranspose * (O * S.map n m)

/-- Lift a coarse-scale observable into the fine-scale code subspace. -/
def coherentLogicalLift (S : CoherentMatrixSystem ι) (n m : ℕ)
    (O : Matrix ι ι ℂ) : Matrix ι ι ℂ :=
  S.map n m * (O * (S.map n m).conjTranspose)

theorem coherentAscending_unital (S : CoherentMatrixSystem ι)
    {n m : ℕ} (hnm : n ≤ m) :
    coherentAscending S n m 1 = 1 := by
  unfold coherentAscending
  simpa [Matrix.one_mul] using S.isometry hnm

theorem coherentAscending_comp (S : CoherentMatrixSystem ι)
    {n m l : ℕ} (hnm : n ≤ m) (hml : m ≤ l)
    (O : Matrix ι ι ℂ) :
    coherentAscending S n m (coherentAscending S m l O) =
      coherentAscending S n l O := by
  unfold coherentAscending
  rw [← S.comp_map hnm hml]
  rw [Matrix.conjTranspose_mul]
  simp only [Matrix.mul_assoc]

theorem coherentLogicalLift_id (S : CoherentMatrixSystem ι)
    (n : ℕ) (O : Matrix ι ι ℂ) :
    coherentLogicalLift S n n O = O := by
  unfold coherentLogicalLift
  simp [S.id_map n]

theorem coherentLogicalLift_comp (S : CoherentMatrixSystem ι)
    {n m l : ℕ} (hnm : n ≤ m) (hml : m ≤ l)
    (O : Matrix ι ι ℂ) :
    coherentLogicalLift S m l (coherentLogicalLift S n m O) =
      coherentLogicalLift S n l O := by
  unfold coherentLogicalLift
  rw [← S.comp_map hnm hml]
  rw [Matrix.conjTranspose_mul]
  simp only [Matrix.mul_assoc]

end

end LinearAlgebra
end CFTAnyons
