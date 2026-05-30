# Opus deep-dive: Hilbert-space bridge for `cft-anyons` consolidation

**Date:** 2026-05-16
**Author:** Claude (Opus 4.7 1M context), read-only research subagent
**Task:** P1.4 of `stocktake/MIGRATION_PLAN.md` — compare the three Hilbert-space formulations from summary.tex, MMA, and CAD; produce a translation map or surface the obstruction.

---

## Verdict

**YELLOW: reconcilable with convention work.**

All three formulations are equivalent on the categorical math: they all build a (finite, charge-graded) Hom-space whose distinctions are *modelling-input* choices (the local cell object `Q`, the geometric framing, whether all particle numbers are summed). They are not three different mathematical objects — they are three views of the same Hom-space construction, related by explicit bijections on basis elements. The MMA and CAD formulations are special cases of a parameterised partition Hilbert space; the partition formulation is strictly more general and is the right canonical anchor.

The conventions that must be locked *before* the GLOSSARY can record the translation map are the four already flagged in `CLAUDE.md` (vacuum index; F-matrix gauge; the meaning of "particle number" in `H_N^W`; the choice of `Q`), plus three more uncovered here (basis convention in `Hom`; ordering / hard-core / multiplicity-free assumptions; total-charge `W` ⊃ `1` for the empty configuration). All of these are within the scope already declared for `CONVENTIONS.md` at P1.6; none requires changing the migration plan.

---

## 1. The three formulations stated precisely

### 1.1 Partition (summary.tex, canonical)

Definitions are in `summary.tex` §3.3.

```
% summary.tex:374-382
\begin{definition}[Ordered partition of a segment]\label{def:partition}
Let X = [0,L] be an oriented closed interval with Lebesgue measure ell.
An ordered partition is a finite chain
    P = { I_1 < I_2 < ... < I_N }, ∪ I_i = X, interiors disjoint.
We write |P| = N and ell(I) for the length of cell I ∈ P.
\end{definition}

% summary.tex:384-391
\begin{definition}[Partition Hilbert space]\label{def:HP}
For each cell I ∈ P choose a local cell object A_I ∈ C
(Definition~\ref{def:Q}); the A_I may differ across cells. Set
    A_P := A_{I_1} ⊗ A_{I_2} ⊗ ... ⊗ A_{I_N},
    H_P^W := Hom_C(W, A_P).
\end{definition}
```

**Domain:** A "partition" is an ordered chain of disjoint cells whose union is a fixed oriented interval `X = [0,L]`. The combinatorial data is `|P| = N` (number of cells) plus the cell-length sequence `(ℓ(I_1), …, ℓ(I_N))`. The categorical data per cell is a chosen object `A_I ∈ C` (allowed to differ per cell — `summary.tex:386-387`). Total charge `W ∈ Irr(C)`.

**Convention dependencies:** (a) each `A_I` is freely chosen (summary.tex:185-280, §3.4 "Local cell object: structural freedom"); (b) F-matrix gauge is unitary in `summary.tex` (`F^abc_d` is a unitary matrix, Def 3.2 = summary.tex:156-168); (c) multiplicity-decorated cells are explicitly allowed (Prop 4.1.1 multiplicity spaces `M_a`, summary.tex:295-317); (d) cell-length geometry is part of the data even though it doesn't enter `H_P^W` directly (it does enter the refinement maps).

**Cardinality:** `dim H_P^W = Σ_{(a_1,…,a_N)} (Π_i dim M_{a_i,I_i}) · N_{a_1,…,a_N}^W` where `N_{a_1,…,a_N}^W` is the iterated fusion multiplicity (summary.tex:295-317; the sum is over the `Σ ∏ |M|`-dimensional space and `Hom(W, a_1⊗…⊗a_N)` factors).

### 1.2 N-tensor (summary.tex §3.1 + CAD handoff §2.1)

Two phrasings of the same definition:

```
% summary.tex:285-293
\begin{definition}[N-site Hilbert space, fixed lattice]\label{def:Hlatt}
Fix a local cell object Q ∈ C (Definition~\ref{def:Q}). For each integer
N ≥ 0 and each simple total charge W ∈ Irr(C), the N-site Hilbert space
in charge sector W is
    H_N^W := Hom_C(W, Q^{⊗N}).
The full N-site space is H_N = ⊕_{W ∈ Irr(C)} H_N^W.
\end{definition}
```

```
% cft-anyons-deprecated/handoff.md:130-142
## 2.1 Definition
For total charge W ∈ Irr(C), define
    H_N^W := Hom_C(W, Q^{⊗N}).
This is the N-site, indefinite-particle-number Hilbert space in
total-charge sector W.
```

The CAD handoff additionally pins the local cell object to one specific choice:

```
% cft-anyons-deprecated/handoff.md:103-115
## 1.2 The local occupation object
Define
    Q := ⊕_{a ∈ Irr(C)} a.
Interpretation:
    Q = "one site may be empty or may contain one simple anyon."
The vacuum 1 ⊂ Q means "empty site."
```

**Domain:** `N ∈ ℕ_0`, `W ∈ Irr(C)`. No spatial geometry — sites are abstractly enumerated `i = 1, …, N`. Single shared `Q` for all sites.

**Convention dependencies:** (a) `Q` is fixed at one of the choices in summary.tex Remark 3.2.4 (most commonly `Q_full = ⊕_a a`, which is the CAD handoff's choice); (b) "particle number" is the *count of non-vacuum legs* (Def 3.1.4, `summary.tex:344-356`), distinct from `N` which is the *tensor-degree*; (c) F-matrix gauge unitary (same as 1.1); (d) handoff fixes vacuum as `1` (no index choice yet).

**Cardinality:** `dim H_N^W = Σ_{(a_1,…,a_N) ∈ Irr(C)^N} N_{a_1,…,a_N}^W`. Identical to 1.1 with `A_I = Q` for all cells.

**CAD Lean coordinate skeleton.** The CAD Lean implementation does *not* construct `Hom(W, Q^⊗N)` categorically. Instead it provides a *coordinate model* that is `IndefiniteParticleSectorCoordinates(sectorBasis) = ConfigSpaceCoordinates(sectorBasis) = Sigma sectorBasis → ℂ`, where `sectorBasis : Config label n → Type` is an *arbitrary* family of finite types (`ProjectDefinitions.lean:53-55`, `Configurations.lean:15-16`, `ConfigurationSpace.lean:26-31`). The Lean side proves: (i) cardinality of this coordinate space equals the sum of sector cardinalities (`ConfigurationSpace.lean:44-48`); (ii) `Sigma → ℂ` is linearly equivalent to the dependent Π form `(∀ cfg, basis cfg → ℂ)` (`DirectSumCoordinates.lean:44-49`); (iii) the natural finite-coordinate pairing on either side is preserved (`DirectSumCoordinates.lean:85-92`). The pairing being preserved is the Lean-side stand-in for "the direct-sum decomposition is *unitary* when the inclusions are chosen as isometries" (`summary.tex:340-342`).

**Critical scope statement in CAD Lean:**

```
-- ProjectDefinitions.lean:3-13
/-!
Finite coordinate skeleton for the project definitions `Q` and `H_N^W`.
[…] This file formalises only the finite coordinate skeleton after
replacing the simple objects by a finite label type and choosing finite
coordinate bases for the Hom sectors. It does not construct categorical
direct sums, tensor powers, Hom functors, or a fusion category.
-/
```

This is exactly the "no categorical bridge crossed" warning at `cad-lean.md:320-334`.

### 1.3 Mobile-Fock (MMA)

Stated in both `finegraining.tex` and the Julia code.

```
% microscopic-mobile-anyons/tex/sections/finegraining.tex:8-13
Let C be a fusion category with simple objects X_1 = 1, X_2, ..., X_d.
We consider N hard-core anyons on an L-site lattice with open boundary
conditions. The Hilbert space decomposes as
    H_N(L) = ⊕_{positions x_1 < ... < x_N, labels a_1,...,a_N}
             Mor(X_c, X_{a_1} ⊗ ... ⊗ X_{a_N})
where the direct sum runs over all hard-core configurations and all
label assignments from the non-vacuum simples.
```

Note: `c` here is the same as `W` elsewhere; `Mor(X_c, …) = Hom_C(X_c, …)`. Total-charge `c` is summed implicitly when MMA builds its full basis (`hilbert.jl:83-95`, the `for c in 1:d` loop).

The full MMA basis (`hilbert.jl:75-98`) sums *both* `N` and `c`:

```
H_MMA(L) = ⊕_{N=0}^{L} ⊕_{c ∈ simples(C)} ⊕_{config ∈ enumerate_configs_hc(L,N,C)}
           ⊕_{fusion_tree of (config.labels) → c} ℂ.
```

Each `(config, fusion_tree, c)` is one basis vector (`hilbert.jl:11-21`).

**Domain:** `L ∈ ℕ` (lattice length, fixed); `N ∈ {0, 1, …, L}` (particle number with hard-core constraint `N ≤ L`); `config = (positions, labels)` with `positions ∈ Combinations(1:L, N)` and `labels ∈ {2,…,d}^N` (every label *strictly nonvacuum*, `config.jl:36`); `fusion_tree` a left-associated sequence of intermediate charges (`hilbert.jl:42-68`); `c ∈ simples(C)` (total charge).

**Convention dependencies:** (a) **vacuum at index 1** in `simples(C)` (`config.jl:5,13`); (b) **labels enumerate non-vacuum simples only** (`config.jl:36` uses `2:d`); (c) hard-core occupancy enforced (`config.jl:35` uses `Combinations` not multisets); (d) **F-matrix gauge involutory** (TensorCategories.jl convention; `interaction.jl` and `braiding.jl` compensate with Hermitian projectors `vv†/|v|²`; documented in `stocktake/reports/mma-julia.md:142-149`); (e) left-associated fusion-tree basis specifically (`hilbert.jl:13-15`); (f) `c` is summed over all simples (not fixed as a superselection label like in summary.tex's `H_N^W`).

**Cardinality:** `dim H_MMA(L) = Σ_{N=0}^{L} Σ_{c ∈ Irr(C)} C(L,N) · Σ_{labels ∈ (Irr\{1})^N} dim Hom_C(c, a_1 ⊗ … ⊗ a_N)` where `C(L,N)` is the binomial coefficient.

### 1.4 Side-by-side cardinality check (Fibonacci, L = 2)

To make sure these are the same space, count Fibonacci `H_2` in each formulation. `Irr(Fib) = {1, τ}`. Fusion: `1⊗a = a`, `τ⊗τ = 1 ⊕ τ`.

- **Partition formulation with `|P|=2`, `A_I = 1⊕τ` (this is the same as N-tensor here):**
  - Configurations `(a_1, a_2) ∈ {1,τ}²`: `(1,1), (1,τ), (τ,1), (τ,τ)`.
  - For each `W ∈ {1, τ}`, sum `dim Hom(W, a_1⊗a_2)`. Tabulating:
    - `dim Hom(1, 1⊗1) = 1`, `dim Hom(1, 1⊗τ) = dim Hom(1, τ) = 0`, `dim Hom(1, τ⊗1) = 0`, `dim Hom(1, τ⊗τ) = 1`. Total `H_P^1 = 1+0+0+1 = 2`.
    - `dim Hom(τ, 1⊗1) = 0`, `dim Hom(τ, 1⊗τ) = 1`, `dim Hom(τ, τ⊗1) = 1`, `dim Hom(τ, τ⊗τ) = 1`. Total `H_P^τ = 0+1+1+1 = 3`.
  - `dim H_P = H_P^1 + H_P^τ = 2 + 3 = 5`.

- **N-tensor formulation `H_2^W`:** identical to the partition formulation with `A_I = Q = 1⊕τ` (= `Q_full` for Fibonacci). Same dimensions: `H_2^1 = 2`, `H_2^τ = 3`, total `5`.

- **Mobile-Fock formulation on `L = 2`:** Sum over `N ∈ {0, 1, 2}` and `c ∈ {1, τ}`.
  - `N = 0`: only one config (empty); fusion tree forces `c = 1` (the empty product is `1`, see `hilbert.jl:47`). Contribution `1`.
  - `N = 1`, label ∈ `{τ}` (no other non-vacuum simples). Positions: `{1}, {2}`. Fusion tree is trivial (one leg). Forces `c = τ`. Contribution: 2 (configs) × 1 (fusion-tree) = 2.
  - `N = 2`, labels ∈ `{(τ,τ)}`. Positions: only `{1,2}` (sole hard-core configuration). Fusion tree of two τ's: intermediate is either `1` or `τ`. Total charge `c ∈ {1, τ}`. From `hilbert.jl:42-68` the basis is two fusion-trees: `c = 1, intermediates = []`(trivially terminating at 1) and `c = τ, intermediates = []` (trivially at τ). Wait — `intermediates` is empty for `N = 2` because there are only N−1 = 1 intermediates and `recurse` is called with `k = 2`, and on the first iteration `k = 2 > N = 2` is false, so it iterates over `s ∈ 1:d`, pushes `s`, then recurses to `k = 3 > N = 2`, which checks `current_charge == c` and pushes `[s]`. So `intermediates = [s]` for each s consistent with the fusion. Two fusion trees: `[1]` (for c=1) and `[τ]` (for c=τ). Contribution: 1 config × 2 trees = 2.
  - Total: `1 + 2 + 2 = 5`. ✓

All three formulations have `dim H_total(L=2) = 5` for Fibonacci, with the same per-`(N, c)` breakdown. Match.

---

## 2. Translation maps (constructive, in both directions)

### 2.1 Partition ↔ N-tensor

**Direction P → N (partition to N-tensor).** Specialise to:
- `|P| = N` (number of cells = abstract site count);
- `A_I = Q` (one cell object, the same on every cell).

Then `A_P = Q^⊗N` by definition. Equality `H_P^W = Hom(W, A_P) = Hom(W, Q^⊗N) = H_N^W`. Identity map on basis elements.

**Direction N → P (N-tensor to partition).** Pick any partition `P` of `X = [0, L]` into `N` cells; assign `A_I = Q` on every cell. Then `A_P = Q^⊗N` and the spaces coincide. The cell-length data is *forgotten* in the N → P direction: any partition of the right cardinality works, and the spaces collapse to the same vector space. (Cell-lengths matter for refinement maps, not for `H_P^W` itself; see `summary.tex:393-399`.)

**Composition.** P → N → P sends `(P, A_I = Q)` to `(|P|, Q)` to `(P', Q)` where `P'` is any partition with `|P'| = |P|`. The composite is the identity *on `H_P^W`* (same underlying Hom-space) but does not preserve cell-length geometry. N → P → N is the identity.

**Special case structure:** The partition formulation is **strictly more general** because it (i) allows per-cell `A_I` (Remark 3.2.4(4), `summary.tex:233-236`; required for blocked / coarse-grained refinements where coarse cells carry larger objects than fine cells); (ii) attaches geometry (cell lengths) needed for fine-graining maps. The N-tensor formulation is the special case `A_I ≡ Q`. Geometry is irrelevant *for the Hilbert space alone*; it becomes relevant for refinement.

**Convention requirements:** unitary F-matrix gauge for both; the choice of `Q` must be made identically.

### 2.2 N-tensor ↔ Mobile-Fock

This pair is the most subtle because of the four bookkeeping differences (labels nonvacuum-only; particle number `≠` tensor degree; total-charge summation; hard-core on positions).

**Direction N → MF (N-tensor to mobile-Fock).** Fix `L ∈ ℕ`. Consider the disjoint union over `N` of `H_N^W` (this is the full N-tensor "particle-number Fock space" with charge sector `W`; see e.g. `cad-meta.md:108-113`). Then:

```
⊕_{N=0}^L H_N^W
  ≅ (definition, Q = Q_full = ⊕_a a)
  ⊕_{N=0}^L Hom(W, Q^⊗N)
  ≅ (Prop 3.1.2, summary.tex:295-317, multiplicity-free decomposition)
  ⊕_{N=0}^L ⊕_{(a_1,…,a_N) ∈ Irr(C)^N} Hom(W, a_1⊗…⊗a_N).
```

Now reindex: a label sequence `(a_1, …, a_N) ∈ Irr(C)^N` decomposes uniquely as (i) the set of positions `{x_p : a_{x_p} ≠ 1}`, (ii) the *non-vacuum* labels `(a_{x_1}, …, a_{x_n})` at those positions (in order), with `n` = particle-number = `#{x : a_x ≠ 1}` (Def 3.1.4, `summary.tex:344-349`). This is a bijection:

```
{label sequences (a_1,…,a_N) ∈ Irr(C)^N}
  ↔ {(N, n, positions x_1<…<x_n ∈ {1,…,N}^n, labels b_1,…,b_n ∈ (Irr\{1})^n) :
       n ≤ N, positions hard-core}.
```

Under this bijection, `Hom(W, a_1⊗…⊗a_N)` ≅ `Hom(W, b_1⊗…⊗b_n)` because tensoring with `1 = unit` is the identity functor (the vacuum legs absorb). The summation collapses:

```
⊕_{N=0}^L ⊕_{(a_1,…,a_N) ∈ Irr(C)^N} Hom(W, a_1⊗…⊗a_N)
  ≅ ⊕_{n=0}^L ⊕_{positions x_1<…<x_n ⊂ {1,…,L}} ⊕_{labels b_1,…,b_n ∈ (Irr\{1})^n}
                  Hom(W, b_1⊗…⊗b_n)
  = MMA's H_n(L) summed over n, fixed charge W.
```

Now: MMA's H_MMA(L) (`hilbert.jl:75-98`) sums *both* `n` and `c`. To recover this from N-tensor land you additionally sum over `W ∈ Irr(C)`:

```
H_MMA(L) ≅ ⊕_{W ∈ Irr(C)} ⊕_{N=0}^L H_N^W,
```

with the index match `c (MMA) ↔ W (summary)`.

**Direction MF → N.** Given an MMA basis state `(config, fusion_tree, c)`, send it to the basis vector in `H_N^c` (with `N = L` and `c = W`) obtained by:
1. Build the length-`L` label sequence `(a_1, …, a_L)` where `a_x = b_p` if `x = x_p ∈ positions`, else `a_x = 1`. *(inverse of the "collapse vacua" reindexing)*
2. Use `fusion_tree` (sequence of intermediate charges in left-associated basis) as the coordinate in `Hom(c, a_1⊗…⊗a_L)` via the standard Frobenius-reciprocity / fusion-tree-basis identification — but with the subtle proviso (next paragraph) that the intermediate charges must skip the vacuum legs *or* equivalently absorb them (using `Hom(c, 1⊗X) = Hom(c, X)`).

**The hidden assumption in MMA's `enumerate_fusion_trees`.** The function builds intermediates only over the non-vacuum labels (`hilbert.jl:42-68`: it iterates `labels` which are the non-vacuum labels by `config.jl:36`). The intermediates are therefore the *physical* fusion intermediates of the `n` non-vacuum anyons, not of all `L` legs. This is exactly the "absorb vacuum legs" identification: `Hom(c, 1^{⊗k_1} ⊗ b_1 ⊗ 1^{⊗k_2} ⊗ … ⊗ b_n) ≅ Hom(c, b_1 ⊗ … ⊗ b_n)` canonically (just delete the unit factors). So MMA's basis is literally a basis of the N-tensor object `H_L^c` after this absorption.

**Composition.** N → MF → N sends a basis element `(a_1,…,a_L) × tree` to itself after the bijection round-trip. MF → N → MF is the identity by the same reasoning. Both directions are bijective on basis elements once the conventions are aligned (vacuum-index, hard-core, label-nonvacuum, left-associated fusion-tree basis).

**Special case structure:** Neither is "more general" — they're identifications of the same space under different geometric framings. MMA chooses `L = N` (lattice length = abstract site count) and absorbs vacua into a sparse position list. N-tensor explicitly carries every site (potentially-vacuum) as a tensor factor.

**Convention requirements:** vacuum-index (MMA uses 1, CAD's `LocalOccupationModel` accepts any distinguished label, summary.tex unconstrained); F-matrix gauge (MMA involutory, summary unitary — conversion is well-defined; the bijection on basis elements is gauge-independent because we're not yet computing anything that depends on F-symbol entries); hard-core (MMA enforces, summary/CAD do not — but "hard-core in non-vacuum positions" is automatic if you only count non-vacuum labels: a site is either vacuum or carries one simple, no double occupancy possible because there's no second tensor slot per site).

### 2.3 Partition ↔ Mobile-Fock

Compose 2.1 and 2.2. Given a partition `P` of size `N` with `A_I = Q_full`, identify it with N-tensor `H_N^W`, then with the `(W = c, particle-number-sector ≤ N)` part of `H_MMA(L = N)`. The map sends a partition basis element (chosen splitting tree on `A_P = Q^⊗N`) to a unique MMA `(config, fusion_tree, c)` after vacuum-leg absorption.

**Special case structure:** Partition is strictly more general than MMA because it allows per-cell `A_I`, while MMA bakes in `A_I = Q_full` (one fixed object, with vacuum at index 1, non-vacuum labels enumerated from index 2). Partition is also more general because it summands over `W` separately (charge sectors are superselection), whereas MMA's `H_MMA(L)` includes the direct sum over all `c`. To recover partition from MMA: select cells `P` of equal size, fix `A_I = Q_full`, decompose by `c`. To recover MMA from partition: take `|P| = L`, `A_I = Q_full`, sum over `W ∈ Irr(C)`, absorb vacuum legs into a sparse hard-core position list.

**Convention requirements:** vacuum-index alignment; multiplicity-free assumption (summary.tex's Prop 3.1.2 allows multiplicity decoration, but MMA does not — its `Q_full = ⊕_a a` is the multiplicity-one case); fusion-tree basis ordering (left-associated, common to all three).

---

## 3. Equivalence vs special-case vs genuine-difference: verdicts

| Pair | Verdict | Notes |
|---|---|---|
| Partition ↔ N-tensor | N-tensor is a **special case** of partition (set `A_I = Q` for all cells). Bijective on basis elements; the inverse forgets cell-length geometry but recovers the same Hom-space. | Convention required: same `Q`; same gauge. No obstruction. |
| N-tensor ↔ Mobile-Fock | **Equivalent** (bijective on basis elements after vacuum-absorption reindexing). Mobile-Fock is N-tensor with `L=N`, vacuum legs absorbed into a sparse position list, summed over `c`. | Convention required: vacuum at index 1; hard-core means "one simple per site"; left-associated fusion-tree basis; multiplicity-free (i.e. each simple appears with multiplicity ≤ 1 in `Q`). |
| Partition ↔ Mobile-Fock | Mobile-Fock is a **special case** of partition (`A_I = Q_full`, then sum over `W`). | Convention required: same as above plus the multiplicity-free assumption (no `M_a > 1`). |
| CAD Lean ↔ summary partition / N-tensor / handoff | The Lean side is the **coordinate skeleton** of any of the categorical formulations (the Sigma-vs-Pi sum equivalence + cardinality + pairing-preservation). It is *not itself* a categorical Hom space — it requires you to *supply* a `sectorBasis : Config label n → Type`. Once supplied, the bijection is exactly: `IndefiniteParticleSectorCoordinates(sectorBasis) = Hom(W, Q^⊗N)` coordinatised by enumerating `(config, basis element of the Hom-fibre over that config)`. | Convention required: choice of `Q`, choice of vacuum label (Lean's `LocalOccupationModel.vacuum : label` is unconstrained); F-matrix gauge becomes relevant only when one *supplies* `sectorBasis` (e.g. fusion-tree basis). The CAD Lean *intentionally* leaves both choices to the supplier (`ProjectDefinitions.lean:3-13`). |

**Edge cases checked:**

- **Empty configuration / N = 0.** Partition: `|P| = 0` is technically not allowed by `summary.tex:374-382` (an ordered partition is a finite chain that covers `X`; `N ≥ 1` implicit). N-tensor: `N = 0` gives `H_0^W = Hom(W, Q^⊗0) = Hom(W, 1) = δ_{W,1} · ℂ` (vacuum sector only; one-dimensional iff W = 1, zero otherwise). MMA: `N = 0` (`config.jl:32`) returns one empty `LabelledConfig`; `enumerate_fusion_trees(C, [], c)` returns `[Int[]]` iff `c = 1` (`hilbert.jl:47`), else empty. Match. (Caveat: the empty-config basis vector lives in `c = W = 1` only; the bijection at `N = 0` is between the one-dim `Hom(1, 1)` and the unique MMA tuple `(empty config, empty tree, c=1)`.)

- **Hard-core / multi-occupancy.** Summary's `H_N^W` allows tensor degree `N` regardless of how many non-vacuum legs there are, including `N` repetitions of the same non-vacuum label. MMA's hard-core constraint says: each *site* of the L-lattice has at most one anyon. When `L = N` (the natural N-tensor identification), this is automatic: each tensor slot is "one site", and each slot can carry vacuum or one simple. There's no double-occupancy issue. *(If MMA's `enumerate_configs_hc` were called with `N > L`, it would return empty — `config.jl:31` — which corresponds to "no way to fit `N` distinct non-vacuum positions into `L` slots". This is the well-defined boundary case.)*

- **Multiplicity-not-one.** Partition allows `A_I = M_a ⊗ a ⊕ …` with `dim M_a > 1`. MMA does not — it assumes `Q = Q_full = ⊕_a a` with multiplicity 1. CAD Lean handles this via `sectorBasis` being an arbitrary finite type (so multiplicities can be encoded in the basis type), but `ProjectDefinitions.lean` itself fixes `Q = ⊕_a a` (the singleton sum). Translating a partition-Hilbert-space with non-trivial `M_a` into MMA notation requires choosing a basis of `M_a` and mapping each basis vector to a separate "species" — equivalent to working in a larger fusion category. This is a *convention*, not an obstruction.

- **Multi-multiplicity fusion.** Fibonacci is multiplicity-free, but for general C, `N_{ab}^c > 1` is possible. The fusion-tree basis carries a multiplicity index `μ` (`summary.tex:146-153`); CAD Lean handles this trivially because `sectorBasis cfg` is an opaque finite type; MMA handles this via `dim Hom(...)` in `hilbert.jl:58` and would (in principle) need to enumerate the multiplicity index in its `intermediates` list. **Hostile check:** MMA's `enumerate_fusion_trees` (`hilbert.jl:42-68`) iterates `for s in 1:d` over *simples* and checks `iszero(dim Hom(S[current_charge] ⊗ S[labels[k]], S[s]))`. If `dim Hom > 1` (multiplicity > 1), this still pushes only *one* intermediate index `s` to the partial tree — it does *not* multiply by the dimension. This means MMA's basis enumeration is **incomplete for non-multiplicity-free categories**. This is a real bug for general C, but Fibonacci, Ising, and sVec (the three categories MMA actually uses) are all multiplicity-free, so it doesn't currently bite. **Report this as a separate Critical issue (§3.5 below).**

- **Total charge summation.** Summary's `H_N^W` is the *per-sector* Hilbert space; the full N-site space `H_N = ⊕_W H_N^W` (summary.tex:292) sums over `W`. MMA's `H_MMA(L)` also sums over `c` (`hilbert.jl:85`). CAD Lean's `IndefiniteParticleSectorCoordinates` is per-sector (the `sectorBasis` is parameterised by a fixed `W` implicitly via the choice of basis family). All three are consistent: sectors are superselection in the categorical math, and the difference between summing/not-summing over `W` is a notational choice.

### 3.5 Genuine issue uncovered: MMA fusion-tree enumeration incomplete for non-multiplicity-free C

The function `enumerate_fusion_trees` in `microscopic-mobile-anyons/src/MobileAnyons/hilbert.jl:42-68` enumerates intermediate charges `s` but treats `dim Hom(X_{current_charge} ⊗ X_{labels[k]}, X_s)` as a 0/1 indicator (line 58: `iszero(dim Hom(...)) && continue`). For categories with `dim Hom(a⊗b, c) > 1` (e.g. extended Haagerup, certain quantum groups at non-prime levels), this **undercounts the basis** by a factor of the product of multiplicities along the tree. For the categories MMA currently uses (Fibonacci, Ising, sVec — all multiplicity-free), this is invisible; for the rest of physics, it's a silent bug. This is *not* a Hilbert-space-bridging obstruction (the partition and N-tensor formulations are mathematically correct; only MMA's implementation is incomplete), but it's worth recording.

**Reportable as:** separate Critical issue in `RESEARCH_NOTES.md` or a `bd` ticket. Not blocking for Phase 1 or for the GLOSSARY work, but blocking for any extension of MMA to non-multiplicity-free categories.

---

## 4. Conventional alignment requirements

Every convention listed here must be fixed *before* the GLOSSARY records the translation map.

1. **Vacuum index.** Three observed choices: `1` (MMA `config.jl:13`); unconstrained `vacuum : label` (CAD `ProjectDefinitions.lean:26`, with `vacuum := one` chosen for Fibonacci at line 100); unconstrained simple `1 ∈ Irr(C)` (summary.tex Convention 2.1 = `summary.tex:79-80`). Canonical choice should be **vacuum at index 1** for MMA-side numerical code (matches the existing implementation and `simples(C)` ordering in `TensorCategories.jl`), and **`vacuum = 1 ∈ Irr(C)` as the categorical statement** for summary.tex / CAD. The translation rule is "vacuum-index 1 in MMA `↔` the simple `1` in C". Already flagged in `CLAUDE.md:218-222`; needs locking in `CONVENTIONS.md` at P1.6.

2. **F-matrix gauge.** MMA uses involutory (TensorCategories.jl convention, `F² = I`, `F^† ≠ F^{-1}`); summary.tex implicitly assumes unitary (`F^abc_d` is unitary, Def 3.2 = `summary.tex:167-168`); CAD Lean's `Fibonacci/Matrix.lean` works in a specific 2×2 real symmetric gauge (the famous `[[1/φ, 1/√φ], [1/√φ, -1/φ]]` form). For Fibonacci specifically, the canonical gauge happens to be both unitary *and* involutory (the unique real symmetric involutory unitary 2×2 matrix). For general C they differ. The translation rule for numerical MMA content into the canonical (unitary) summary.tex frame is: column-normalise rows / Hermitise as MMA already does for projectors (`interaction.jl` uses `vv†/|v|²` not raw F-columns). Already flagged in `CLAUDE.md:224-227`; needs locking in `CONVENTIONS.md` at P1.6.

3. **"Particle number" disambiguation.** In summary.tex and CAD handoff, `H_N^W` has `N = `tensor degree (= number of cells / sites), and "particle number" is the count of non-vacuum legs (`summary.tex:344-356`). In MMA, `N` *is* the particle number (`config.jl:8` "N anyons"). Translation requires explicit aliasing: summary's `N = L` (lattice length / tensor degree); MMA's `N = n` (non-vacuum count). The mobile-Fock total space sums over both. **Recommendation:** in GLOSSARY, use `L` for tensor degree / lattice length and `n` for particle (= non-vacuum) count, and explicitly note that summary.tex's `H_N^W` uses `N` for the former, MMA uses `N` for the latter.

4. **Choice of local cell object `Q`.** Summary leaves it as a modelling input with five named options (`Q_full = ⊕_a a`, `Q_restr = ⊕_{a∈S} a`, multiplicity-decorated `⊕_a M_a ⊗ a`, site-dependent `A_I`, coarse-grained `Q^⊗k`); CAD handoff fixes `Q = ⊕_a a` (`handoff.md:106`); MMA fixes `Q = ⊕_{a≠1} a` *implicitly* by labelling positions only with non-vacuum simples (`config.jl:36`) and tracking vacuum via *absence* of a particle at a site. The translation requires noting that MMA's `Q` is actually `Q_full` after the "absorb vacuum legs" reindexing — a site with no anyon corresponds to a vacuum leg in the equivalent N-tensor.

5. **Fusion-tree basis convention (left-associated vs right-associated).** All three use left-associated (`hilbert.jl:13` "left-associated fusion tree"; summary.tex Def 3.2 = `summary.tex:156-168` chooses `(a⊗b)⊗c` as the natural parenthesisation; CAD doesn't yet need to specify because it works at coordinate level). Lock as "**left-associated**" in CONVENTIONS at P1.6.

6. **Multiplicity index ordering for fusion `Hom(a, b⊗c)`.** Summary Def 3.1 (`summary.tex:145-154`) introduces splitting vertices `v^a_{b,c;μ}` with `μ = 1,…,N_{bc}^a`. MMA implicitly does not (its enumeration in `hilbert.jl:58` treats `dim Hom > 0` as boolean — see §3.5). CAD Lean handles via `sectorBasis cfg` being arbitrary finite type. If MMA is to be extended to non-multiplicity-free categories, a multiplicity index convention must be added; for now, document "multiplicity-free assumption" as a CONVENTIONS entry, with note that it holds for Fibonacci/Ising/sVec.

7. **`H_N^W` at `N = 0`.** Implicit boundary: `H_0^W = Hom(W, Q^⊗0) = Hom(W, 1) = δ_{W,1} · ℂ`. MMA agrees (`config.jl:32` returns empty config, `hilbert.jl:47` returns `[Int[]]` only when `c = 1`). Summary.tex allows `N ≥ 0` (`def:Hlatt`, `summary.tex:286`). Partition formulation does not technically permit `|P| = 0` (a partition covers `X`, requiring at least one cell); but the partition framework's `H_P^W` at the smallest partition (`|P| = 1`, `A_{I_1} = Q`) is `Hom(W, Q)`, which is 1-dim for `W ∈ Irr(C)` appearing in `Q` and 0 otherwise. **Recommendation:** document "the empty partition is conventionally identified with the trivial Hilbert space `H_∅^W = δ_{W,1} ℂ`" as a CONVENTIONS entry; this lets the three formulations agree at the absolute boundary.

---

## 5. Worked example: Fibonacci `H_2^τ` in all three formulations

Per §1.4: `dim H_2^τ = 3` in each formulation.

### 5.1 Listing a basis (Fibonacci, `W = τ`, `N = L = 2`)

**Partition formulation** `H_P^τ = Hom(τ, A_{I_1} ⊗ A_{I_2})` with `A_{I_1} = A_{I_2} = Q_full = 1⊕τ`. Expand:

```
A_P = (1⊕τ) ⊗ (1⊕τ) = (1⊗1) ⊕ (1⊗τ) ⊕ (τ⊗1) ⊕ (τ⊗τ) = 1 ⊕ τ ⊕ τ ⊕ (1 ⊕ τ).
```

`Hom(τ, A_P)` has nonzero contributions from each τ summand. The three basis vectors:
- `v_1 = ι_{1⊗τ}` ∘ identity on τ (the projection of `A_P` onto the `(1⊗τ)` component followed by identification with τ).
- `v_2 = ι_{τ⊗1}` ∘ identity on τ.
- `v_3 = ι_{τ⊗τ}` ∘ (the unique splitting `v^τ_{τ,τ}: τ → τ⊗τ`).

**N-tensor formulation** `H_2^τ = Hom(τ, Q^⊗2)`. Same expansion as above, same basis. Identical vectors.

**Mobile-Fock formulation** `H_MMA(L=2)` restricted to `c = τ`. From the §1.4 count:
- `N = 1`, label `τ`, position `{1}`, intermediates `[]`, total charge `τ`. → "one τ-anyon at site 1, rest vacuum". This corresponds to `v_2` above (the `(τ, 1)` configuration → label sequence `(τ, 1)`).
- `N = 1`, label `τ`, position `{2}`, intermediates `[]`, total charge `τ`. → "one τ-anyon at site 2, rest vacuum". This corresponds to `v_1` above (`(1, τ)`).
- `N = 2`, labels `(τ, τ)`, positions `{1, 2}`, intermediates `[τ]`, total charge `τ`. → "two τ-anyons fused to τ". This corresponds to `v_3` above.

(Note that the `N = 2, intermediates = [1]` tree is in the `c = 1` sector, contributing to `H_2^1`, not `H_2^τ`.)

### 5.2 The bijection on basis vectors

| Partition / N-tensor | MMA |
|---|---|
| `v_1` = ι(`1⊗τ`) | `(N=1, label=τ, pos={2}, tree=[], c=τ)` |
| `v_2` = ι(`τ⊗1`) | `(N=1, label=τ, pos={1}, tree=[], c=τ)` |
| `v_3` = ι(`τ⊗τ`) ∘ `v^τ_{τ,τ}` | `(N=2, labels=(τ,τ), pos={1,2}, tree=[τ], c=τ)` |

The map is constructed via the algorithm of §2.2 (vacuum-leg absorption). It is bijective, preserves inner products (under the unitary biproduct inclusion convention in both directions), and commutes with the F-symbol change-of-basis up to the gauge change between summary.tex's unitary `F^{τττ}_τ` (Def 7.2 = `summary.tex:1060-1070`, the involutory matrix `[[φ⁻¹, φ⁻¹ᐟ²], [φ⁻¹ᐟ², -φ⁻¹]]`) and MMA's TensorCategories.jl involutory `F`. **For Fibonacci specifically these gauges coincide** (the matrix is real symmetric and equal to its inverse), so the F-symbol change-of-basis between left-associated `(τ⊗τ)⊗τ` and right-associated `τ⊗(τ⊗τ)` bases acts identically across all three formulations.

### 5.3 F-symbol check (cross-formulation consistency)

`H_3^τ = Hom(τ, Q^⊗3)` has dimension 5 by the same fusion calculation. Restrict to the all-τ configuration `(τ, τ, τ)`: `Hom(τ, τ⊗τ⊗τ)` is 2-dimensional, with basis vectors labelled by the intermediate channel of the left-associated tree (`(τ⊗τ)⊗τ`, intermediates `1` or `τ`). The F-symbol relates this to the right-associated tree (`τ⊗(τ⊗τ)`, intermediates `1` or `τ`) via:

```
F^{τττ}_τ = [[φ⁻¹, φ⁻¹ᐟ²], [φ⁻¹ᐟ², -φ⁻¹]]
```

(summary.tex Def 7.2 = `summary.tex:1066-1069`; CAD Lean `Fibonacci/Matrix.lean:90`, with `FibF` defined and proved `FibF_involutive` & `FibF_orthogonal`).

In MMA, this matrix comes out of `TensorCategories.six_j_symbols` and is converted to a 2×2 numeric matrix in `fsymbols.jl` (the `_physical_embedding` heuristic). For Fibonacci, the entries match: `φ⁻¹ ≈ 0.618`, `φ⁻¹ᐟ² ≈ 0.786`. The F-symbol acts on the 2D space `Hom(τ, τ⊗τ⊗τ)` consistently across all three formulations — verified by `test_fsymbols.jl` (numerical: F² = I, involutory) and `Fibonacci/Matrix.lean` (formal: `FibF_involutive`).

**Result:** the F-symbol change-of-basis acts consistently on the 2-dim subspace of `H_3^τ` corresponding to two τ-anyons fused with a third τ-anyon to total charge τ, regardless of which formulation you start in.

---

## 6. Recommendation for canonical GLOSSARY formulation

**Canonical:** the partition formulation (summary.tex Def 3.3.2 = `def:HP`, lines 384-391). This is strictly the most general of the three: it explicitly allows per-cell `A_I`, attaches spatial geometry (cell lengths) for refinement maps, and the others are special cases.

**Canonical GLOSSARY entry (proposed):**

```
## Partition Hilbert space (canonical formulation)

**Canonical:** For an ordered partition P = {I_1 < ... < I_N} of X = [0, L],
a choice of local cell object A_I ∈ C per cell I ∈ P (Def 3.2.3 of summary.tex),
and a total charge W ∈ Irr(C), the partition Hilbert space in charge sector W
is
    H_P^W := Hom_C(W, A_P),    where    A_P := A_{I_1} ⊗ ... ⊗ A_{I_N}.
**Source:** summary.tex:384-391 (Definition 3.3.2 of \def:HP).
**Aliases:**
  - N-tensor / fixed-lattice Hilbert space (special case: A_I = Q for all I).
  - Indefinite-particle Hilbert space (summed over W and N).
**Translation map:**
  - **N-tensor (summary.tex §3.1 Def 3.1.1, CAD handoff §2.1):** set A_I = Q,
    forget cell-length data. Then H_P^W = H_{|P|}^W = Hom(W, Q^{⊗|P|}).
    Source: summary.tex:285-293; cft-anyons-deprecated/handoff.md:130-142.
  - **Mobile-Fock (MMA):** set A_I = Q_full = ⊕_{a ∈ Irr(C)} a; sum over all W
    and all partition sizes ≤ L; identify each basis vector (a_1, ..., a_L) ∈
    Irr(C)^L with the MMA tuple (config = nonvacuum subsequence, fusion_tree =
    intermediates of the n non-vacuum labels, c = W) via the "vacuum-leg
    absorption" bijection (Hom(W, 1 ⊗ X) ≅ Hom(W, X), iterated). Source:
    microscopic-mobile-anyons/tex/sections/finegraining.tex:8-13;
    microscopic-mobile-anyons/src/MobileAnyons/{config.jl,hilbert.jl}.
  - **CAD Lean coordinate skeleton:** supply a finite type sectorBasis : Config
    label n → Type encoding a basis for each Hom(W, a_1 ⊗ ... ⊗ a_n) fibre;
    then IndefiniteParticleSectorCoordinates sectorBasis = (Sigma sectorBasis
    → ℂ) is the coordinate model of H_N^W. CAD Lean does NOT itself construct
    the categorical Hom; it provides the linear-algebra scaffolding only.
    Source: cft-anyons-deprecated/Formalisation/Foundations/ProjectDefinitions.lean:53-91;
    cad-lean.md:320-334 (explicit scope statement).
**Notes:**
  - Vacuum-index, F-matrix gauge, hard-core, and multiplicity-free
    conventions must be aligned across formulations — see CONVENTIONS.md.
  - For empty partition / N = 0: H = Hom(W, 1) = δ_{W,1} · ℂ.
  - For non-multiplicity-free C (N_{bc}^a > 1), MMA's `enumerate_fusion_trees`
    is incomplete (see Critical Issue in stocktake/reports/opus-hilbert-bridge.md §3.5).
```

**Sub-entries for non-canonical variants** should each have:
- A "Canonical equivalent" field pointing back to the partition entry.
- The explicit translation rule (algorithm or formula).
- The conventions assumed.
- The source-file:line for the definition in the variant project.

---

## 7. Implications for the migration plan

**Phase 1 proceeds as planned, with one tweak.** The plan as drafted in `MIGRATION_PLAN.md` (P1.3–P1.5) is correct: declare partition Hilbert space canonical (P1.3), produce this report (P1.4), and write the translation map into GLOSSARY (P1.5). My findings confirm P1.4 yields a "clean translation map" and not a "STOP and ask user" condition. P1.5 proceeds.

**P1.6 (CONVENTIONS) absorbs the seven items in §4.** P1.6 currently lists six items (vacuum index, F-matrix gauge, dagger, multiplicity index, conjugation, TikZ). Add to the P1.6 spec:
- "Particle number disambiguation" (item 3 above): distinguish tensor-degree `L` from non-vacuum count `n`; aliasing rules for `H_N^W` notation in each source.
- "Local cell object `Q` choice" (item 4): document the five named options from summary.tex Remark 3.2.4, name `Q_full = ⊕_a a` as the canonical default, document MMA's "absorbed vacuum" convention as equivalent.
- "Fusion-tree basis ordering" (item 5): lock as left-associated.
- "Empty configuration / `N = 0`" (item 7): document `H_∅^W = δ_{W,1} ℂ`.

This is *additions* to P1.6's content, not a structural change to the plan.

**P1.7 (CAD Lean translation map) needs minor expansion but not restructure.** The plan already says "Use `reports/cad-lean.md` §5 (which already has a file-by-file mapping) as the source." That mapping is correct for the *coordinate skeleton* level. P1.7 should additionally record, per CAD Lean file:
- That the Lean side is at the *coordinate skeleton* level (not the categorical level).
- What the user must supply (e.g., `sectorBasis : Config label n → Type`) to instantiate it as a model of `H_N^W`.
- The convention assumed by the Lean file (vacuum-index unconstrained, multiplicity handled via opaque type, F-matrix gauge irrelevant at this level).

This is **scope clarification, not expansion**. P1.7 still uses `cad-lean.md` §5 as its primary source.

**P8.1 (MMA Julia bridge audit) becomes easier given these findings.** The audit is meant to "confirm every fundamental concept maps to a GLOSSARY entry" and "confirm the involutory F-matrix gauge convention is correctly handled". With this report, the auditor has:
- A precise specification of how MMA's basis vectors map to GLOSSARY's canonical partition basis (§2.2 above).
- The seven conventions that need to be confirmed handled correctly (§4 above).
- A pre-flagged Critical Issue (§3.5) that the audit should *also* check for downstream impact: any place in MMA code that assumes multiplicity-free will be silently wrong for non-multiplicity-free categories. (For Fibonacci/Ising/sVec — the only categories MMA actually uses — this is a latent bug, not an active one.)

**Optional new step recommended:** after P1.6 + P1.7 + P8.1 land, run a brief reviewer check that confirms all seven conventions in §4 above are documented in CONVENTIONS.md and that the GLOSSARY's partition Hilbert space entry references the correct CONVENTIONS entries. This is one bd ticket; estimated 30 min; can be folded into the existing P1.9 ("definitional gate review" Opus pass).

**Phase 5 (Lean migration) is not affected directly** by this report — the CAD Lean files are the coordinate-skeleton model, and their import is unchanged. P5.6 ("confirm `IndefiniteParticleSectorCoordinates` matches GLOSSARY's `H_N^W` translation rule") is already in the plan and is correct as stated; it just needs the GLOSSARY entry from P1.5 to be present.

**Phase 8 (MMA Julia migration) is not affected directly,** with one note: when porting `hilbert.jl`, a `# TODO multiplicity-free assumption` comment should be added to `enumerate_fusion_trees` line 58, with a pointer to RESEARCH_NOTES tracking the latent issue. This can fold into P8.4.

---

## 8. Verdict

**YELLOW: reconcilable with convention work.**

All three formulations are equivalent in principle. The translation maps in §2 are constructive in both directions, bijective on basis elements, and preserve inner products (modulo the conventional gauge change). One formulation (partition) is strictly more general; the other two are explicit special cases.

Reconciliation requires fixing seven conventions before the GLOSSARY locks (§4 above): four are already flagged in `CLAUDE.md` (vacuum index, F-matrix gauge, particle-number disambiguation implicitly, choice of `Q` implicitly), three are new (fusion-tree basis ordering, multiplicity-free assumption, empty-configuration boundary). All fall within the existing scope of `CONVENTIONS.md` at P1.6 — Phase 1 picks up the expansion of the P1.6 spec to seven items but no plan revision is needed.

The Phase 0/1 stop condition referenced in `MIGRATION_PLAN.md:379` ("If the three formulations don't reconcile cleanly, the whole plan needs revision") **does not trigger**. Phase 1 proceeds.

One **separate Critical Issue** is uncovered (§3.5): MMA's `enumerate_fusion_trees` in `microscopic-mobile-anyons/src/MobileAnyons/hilbert.jl:42-68` undercounts fusion-tree basis for non-multiplicity-free fusion categories (treats `dim Hom > 0` as Boolean rather than counting multiplicity). This does *not* affect the Hilbert-space bridge question (the bridge is correct for multiplicity-free categories, which is everything MMA currently uses), but is a latent bug that should be tracked in `RESEARCH_NOTES.md` / `bd`. Recommended: file as a new `bd` ticket under MMA's `src/MobileAnyons/` scope, blocked by Phase 8 (cannot be fixed during migration; only after the canonical MMA module exists), with severity "Latent: triggered only for non-multiplicity-free categories".

---

## Appendix: Sources cited

- `/home/tobias/Projects/cft-anyons/summary.tex` — §3 "Indefinite-particle Hilbert spaces" (lines 281–457), §7 "Fibonacci data" (lines 999–1593), §14 "Critical evaluation" (lines 2208–2316).
- `/home/tobias/Projects/cft-anyons/CLAUDE.md` — Hallucination-risk callouts (lines 212–266), Two Laws (lines 44–77).
- `/home/tobias/Projects/cft-anyons/PRD.md` — Pre-read warnings (lines 126–138), Known limitations (lines 160–171).
- `/home/tobias/Projects/cft-anyons/stocktake/README.md` — §2 "The three Hilbert-space formulations" (lines 49–66).
- `/home/tobias/Projects/cft-anyons/stocktake/reports/mma-julia.md` — §5 "Overlap with cft-anyons/summary.tex" (lines 128–152).
- `/home/tobias/Projects/cft-anyons/stocktake/reports/cad-lean.md` — §3 "Key concepts" (lines 269–303), §5 "Overlap" (lines 337–377).
- `/home/tobias/Projects/cft-anyons/stocktake/reports/cad-meta.md` — §3 "Concepts and artifacts" (lines 40–84), §5 "Overlap" (lines 101–117).
- `/home/tobias/Projects/cft-anyons/stocktake/MIGRATION_PLAN.md` — Phase 1 (P1.1–P1.11, lines 117–138), P5.6 (line 217), P8.1–P8.9 (lines 269–278), stop-condition list (line 379).
- `/home/tobias/Projects/microscopic-mobile-anyons/tex/sections/finegraining.tex` — full 291 lines (Hilbert space definition lines 8–13; product map line 26 onward; pair-creation lines 141–253).
- `/home/tobias/Projects/microscopic-mobile-anyons/src/MobileAnyons/hilbert.jl` — full 98 lines.
- `/home/tobias/Projects/microscopic-mobile-anyons/src/MobileAnyons/config.jl` — full 41 lines.
- `/home/tobias/Projects/microscopic-mobile-anyons/src/MobileAnyons/finegraining.jl` — lines 26–125.
- `/home/tobias/Projects/cft-anyons-deprecated/handoff.md` — §1.2 "Local occupation object" (lines 101–124), §2 "Indefinite-particle Hilbert spaces" (lines 128–221), §4 "Fine-graining maps" (lines 284–407).
- `/home/tobias/Projects/cft-anyons-deprecated/Formalisation/Foundations/ProjectDefinitions.lean` — full 122 lines.
- `/home/tobias/Projects/cft-anyons-deprecated/Formalisation/Foundations/Configurations.lean` — full 83 lines.
- `/home/tobias/Projects/cft-anyons-deprecated/Formalisation/Foundations/ConfigurationSpace.lean` — full 86 lines.
- `/home/tobias/Projects/cft-anyons-deprecated/Formalisation/Foundations/FockSpace.lean` — full 106 lines.
- `/home/tobias/Projects/cft-anyons-deprecated/Formalisation/Foundations/DirectSumCoordinates.lean` — lines 1–250 (full).
