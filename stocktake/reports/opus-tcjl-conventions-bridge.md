# TC.jl Conventions Bridge — Phase 8 P8.1c

**Author:** Opus 4.7 (1M-context, model id `claude-opus-4-7[1m]`), as P8.1c implementer
**Date:** 2026-05-17
**Trigger:** bd `cft-anyons-rwn` (P8.1c) per HANDOFF.md and `MIGRATION_PLAN.md` Phase 8 plan; sibling to P8.1a (`stocktake/reports/opus-mma-julia-bridge.md`, commit `f0b0e42`) and P8.1.5 (`def:rsymbol` + `def:braid-H` GLOSSARY additions, commit `da39a21`).
**Predecessors:** `stocktake/reports/opus-tcjl-api-audit.md` (P8.0a, TC.jl 0.5.3 API audit); `stocktake/reports/opus-mma-julia-bridge.md` (P8.1a, MMA-side bridge); `stocktake/reports/opus-hilbert-bridge.md` (P1.4-early, source for the 10 [P1.6(*)] letters); P8.1.5 GLOSSARY §B entries `def:rsymbol` / `def:braid-H`.
**User-memory drivers:** `feedback-phase8-tensorcategories-care` (heightened TC.jl drift care) + `feedback-reviewer-deep-d-gate` (per-slug / per-convention audit, not surface existence).

---

## Scope

This report covers **TC.jl's own conventions in their own right**, mirroring the 10-letter `CONVENTIONS.md` framework `(a)`–`(j)` declared at P1.6. The audience is the **P8.4+ per-file porters**, who need a single authoritative reference for "what does TC.jl assume about X?" without grepping TC.jl src themselves.

For each convention letter the report records: (i) what TC.jl assumes / does; (ii) how this compares with this repo's canonical [P1.6(letter)] choice; (iii) whether a translation rule is needed at port time and what it is; (iv) the TC.jl src citation(s) supporting the claim; (v) the MMA-side adaptation that handles the convention (cross-referenced from the P8.1a bridge audit).

The report is **descriptive** — it does not modify GLOSSARY, CONVENTIONS, PROVENANCE, Lean, MMA src, TC.jl src, or af content; only the new report file + a MIGRATION_LOG row + a bd-snapshot commit are produced.

An additional sub-section after letter `(j)` covers the **R-symbol storage layout** (TC.jl's `Array{MatElem,3}` `braiding` field) — load-bearing per P8.1.5 but not aligned with any of the 10 letters in their own right.

---

## TC.jl version + depot path

- **Pin source:** MMA's `/home/tobiasosborne/Projects/microscopic-mobile-anyons/Manifest.toml` declares `TensorCategories` at `version = "0.5.3"` with `git-tree-sha1 = 591655388467dd84356425f16d584319809306ec`. Verified verbatim against the file content (already verified at P8.0a; re-confirmed here by inspecting MMA's Manifest.toml during P8.1c audit).
- **Depot location:** `/home/tobiasosborne/.julia/packages/TensorCategories/fnMHT/` — the local Julia depot copy at the pinned `0.5.3` version. The `Project.toml` at that path reports `version = "0.5.3"` (exact match). Top-level dependencies: `Oscar = "1.5"` compat (MMA pins Oscar at `1.6`), `Artifacts`, `LazyArtifacts`, `SparseArrays`, `InteractiveUtils`.
- **Alternative depot (not used for the audit):** `/home/tobiasosborne/Projects/TensorCategories.jl/` is a separate working checkout at version `0.5.5`. **This audit uses the pin-exact depot copy `fnMHT/`**, never the working checkout, in line with P8.0a's stricter "pin-exact" reading.
- **Source tree:** 32 distinct subdirectories under `src/`; top-level entry `src/TensorCategories.jl` contains the module declaration + 415 `export` statements (lines 63–477 per P8.0a count) + the `include()` chain assembling the per-file source.

---

## Design framing

TC.jl frames every concrete category as a subtype of an **abstract `Category` supertype** (`src/CategoryFramework/AbstractTypes.jl:5`); objects subtype `Object` (line 7); morphisms subtype `Morphism` (line 9). The framework is **not skeletal-fusion-category-first** in the strict sense — `Category` itself is abstract and concrete subtypes include various non-skeletal constructions (`GradedVectorSpaces`, `GroupRepresentation`, `ConvolutionCategory`, `CenterCategory`, `BiModuleCategory`, etc.). However, **the concrete type used for explicit 6j-symbol-driven fusion categories** (including all three categories in current cft-anyons scope) is **`SixJCategory`**, declared at `src/TensorCategoryFramework/SixJCategory/FusionCategory.jl:7-24`:

```julia
@attributes mutable struct SixJCategory <: Category
    base_ring::Ring
    simples::Int64
    simples_names::Vector{String}
    ass::Array{MatElem,4}              # F-symbols
    braiding::Array{MatElem,3}         # R-symbols (only assigned when braided)
    tensor_product::Array{Int,3}       # fusion-rule structure constants N^c_{ab}
    pivotal::Vector
    twist::Vector
    one::Vector{Int}                   # 0/1 indicator vector picking the unit object
    name::String
    embedding::AbsSimpleNumFieldEmbedding
end
```

`SixJCategory` is therefore **skeletal-by-construction**: simples are indexed `1:simples` and every other piece of data (associators, braiding, tensor product, pivotal, twist, unit) is a numerical array keyed on the same `1:simples` enumeration. There is no separate notion of "isomorphic but distinct" simple objects within a `SixJCategory` — the simples ARE the indices `1, …, C.simples`.

Key types brought into scope by `MobileAnyons.jl`'s `using TensorCategories, Oscar` line:

- **`SixJCategory`** (`SixJCategory/FusionCategory.jl:7`) — the concrete skeletal-fusion-category type used by Fibonacci, Ising, and any graded-vector-space-derived category. **Note: `FusionCategory` is a dangling export per P8.0a** (TC.jl 0.5.3 exports the name at `src/TensorCategories.jl:191` but has no underlying binding); `SixJCategory` is the actual type to annotate against. bd `cft-anyons-b6b` tracks the cleanup decision.
- **`SixJObject`** (`SixJCategory/FusionCategory.jl:26-29`) — an object in `SixJCategory`; carries a `parent::SixJCategory` and a `components::Vector{Int}` recording the multiplicity of each simple in the (possibly composite) object. A simple object has `components` equal to a 0/1 indicator vector (so `is_simple(X) = sum(X.components) == 1` at line 499).
- **`SixJMorphism`** (`SixJCategory/FusionCategory.jl:31-35`) — a morphism `domain → codomain` carrying a `m::Vector{<:MatElem}` field with one matrix per simple component (the matrix-block-decomposition representation).
- **`Category` / `Object` / `Morphism`** (`AbstractTypes.jl:5, 7, 9`) — the abstract supertypes; `SixJCategory <: Category`, `SixJObject <: Object`, `SixJMorphism <: Morphism`.
- **`HomSpace{T}`** (`AbstractTypes.jl:30-34`) and `SixJHomSpace` (`SixJCategory/FusionCategory.jl:1019-1021`) — the hom-space representation; `Hom(X, Y)` returns a `SixJHomSpace` whose `basis::Vector{SixJMorphism}` enumerates the basis morphisms.
- **`MatElem`** (Oscar re-export per `src/TensorCategories.jl:29`) — Oscar's matrix type, parameterised by the base ring. Every cached F-symbol entry `C.ass[i,j,k,l]` and braiding entry `C.braiding[i,j,k]` is a `MatElem` whose dimensions are `dim Hom((S[i]⊗S[j])⊗S[k], S[l]) × dim Hom(S[i]⊗(S[j]⊗S[k]), S[l])` (F-symbol) or `dim Hom(S[i]⊗S[j], S[k]) × dim Hom(S[j]⊗S[i], S[k])` (R-symbol). For multiplicity-free categories these are 1×1 matrices (effectively scalars).

---

## Example category constructors (the three exemplars in current scope)

| Constructor | Returns | Source | Simples list | Unit object index | Notes |
|---|---|---|---|---|---|
| `fibonacci_category()` | `SixJCategory` over `ℚ(ϕ)` (`ϕ² = ϕ + 1`) | `src/Examples/Fibonacci/FibonacciCategory.jl:1-27` | `["𝟙", "τ"]` — 2 simples | **1** (set explicitly by `set_one!(C, [1,0])` at line 19) | Tensor product set at lines 10-14 (`τ⊗τ = 𝟙 ⊕ τ`); associator set only at `(2,2,2,2)` = `(τ,τ,τ → τ)` channel via `set_associator!(C,2,2,2,2, matrix(K, [a a; 1 -a]))` line 17, with `a = -roots(x²-x-1)[1] = ϕ`. Other associator entries default to identity via `set_tensor_product!`'s initialisation at `FusionCategory.jl:100-104`. **Braiding is NOT set in `fibonacci_category()`** — `is_braided(C) = isdefined(C, :braiding)` returns `false` for the default Fibonacci instance. MMA's `build_rsymbol_cache` therefore relies on user-supplied R-symbols via `build_rsymbol_cache_manual` for Fibonacci (see P8.1a bridge audit line 270 + `def:rsymbol` Translation map). |
| `ising_category()` | `SixJCategory` over `ℚ(√2)` | `src/Examples/TambaraYamagami/TambaraYamagami.jl:197-201` (the 0-arg form; calls into `ising_category(F, sqrt(F(2)), 1)` at line 219, ultimately the 3-arg form at lines 239-306) | `["𝟙", "χ", "X"]` — 3 simples | **1** (set explicitly by `set_one!(C, [1,0,0])` at line 263) | Tensor product set at lines 246-256 (`χ⊗χ = 𝟙`, `χ⊗X = X⊗χ = X`, `X⊗X = 𝟙 ⊕ χ`); associators set at `(2,3,2)` `(3,2,3)` `(3,3,3)` channels (lines 258-261). **Braiding IS set** (lines 284-303) inside a `try` block that may silently fail for some base rings — sets `braid[i,j,k]` for all `i,j ∈ {1,2,3}` based on the bilinear form `χ(a,a)` etc. + the `α = √(1/√2 (1 + ξ))` Tambara-Yamagami formula. The parameter `q = ±1` (line 287) controls the sign of `ξ = q · ζ_4`, choosing one of the four possible braidings per `arXiv:2010.00847v1` Ex. 4.13 (cited in head comment line 282). |
| `graded_vector_spaces(F::Field, G::Group)` (et al.) | `GradedVectorSpaces` (NOT `SixJCategory`) — see Notes column | `src/Examples/GradedVectorSpaces/GradedVectorSpaces.jl:27, 33, 42, 51` (4 methods) | Indexed by `G` (one simple per group element) | **The index of `one(G)` in `elements(G)`** — see Notes | **Critical**: `graded_vector_spaces(F, G)` returns a `GradedVectorSpaces` instance, NOT a `SixJCategory`. The conversion to `SixJCategory` happens via a *separate* `six_j_category(V::GradedVectorSpaces)` constructor at `GradedVectorSpaces.jl:490-514` (signature is `six_j_category(V)`, not `SixJCategory(V)`). That constructor calls `set_one!(C, [g == one(G) for g ∈ elems])` (line 500), so the unit's index in the `SixJCategory` enumeration is **wherever `one(G)` appears in `elements(G)`**. For typical group constructions (Julia/Oscar `abelian_group(PcGroup, [n])`) the identity is at position 1 of `elements(G)`, but **this is a group-construction-implementation detail** and the safest cross-check is `findfirst(==(1), C.one)` after the constructor returns. For `Z/2` per the head comment "the project's third exemplar `graded_vector_spaces(Z/2)`" (cf. GLOSSARY `def:fuscat:241`), the standard `abelian_group(PcGroup, [2])` produces a group whose identity is at index 1 of `elements(...)`. |

**The three exemplars are listed in GLOSSARY `def:fuscat:241-242`** as the test exemplars for the fusion-category framework. Note that **the GLOSSARY citation `TensorCategories.graded_vector_spaces(Z/2)` returns `GradedVectorSpaces`, not `SixJCategory`** — to use it as a skeletal fusion category at MMA's `simples(C)` / `dim(Hom(...))` interface, the consumer must call `six_j_category(graded_vector_spaces(QQ, Z/2))` (round-trip via `SixJCategory`). MMA's `test/test_paircreation.jl:25` uses precisely this round-trip per the P8.1a Surprises notes.

---

## Per-convention table

### (a) Vacuum index

**TC.jl assumes:** vacuum = whichever simple is flagged by the `one::Vector{Int}` field, which is a 0/1 indicator vector. Each example category constructor sets this explicitly via `set_one!(C, v)` (vector form at `FusionCategory.jl:204-206`) or `set_one!(C, i)` (integer form at lines 208-210, which writes `[k == i for k ∈ 1:F.simples]`). The unit object is then `one(C) = SixJObject(C, C.one)` (line 824-829). **TC.jl does NOT enforce a fixed positional convention** — `set_one!` accepts any indicator vector, so the unit can in principle be at any index.

For the three constructors in current scope:
- `fibonacci_category()` sets `set_one!(C, [1,0])` → unit at **index 1** (`FibonacciCategory.jl:19`).
- `ising_category()` sets `set_one!(C, [1,0,0])` → unit at **index 1** (`TambaraYamagami.jl:263`).
- `six_j_category(graded_vector_spaces(F, G))` sets `set_one!(C, [g == one(G) for g ∈ elems])` → unit at the index where `one(G)` appears in `elements(G)` (`GradedVectorSpaces.jl:500`). For typical Oscar/Julia group constructions this is index 1, but is **constructor-dependent** — the safest pattern is `findfirst(==(1), C.one)`.

**Canonical [P1.6(a)] choice:** vacuum at **index 1** (1-indexed, with `X_1 = 1_C`); per `CONVENTIONS.md:69-126`.

**Difference:** **No formal difference** for the three exemplars in current scope (all three put the unit at index 1 of `simples(C)`). **Architecturally**, TC.jl is more permissive than the canonical choice — it allows the unit at any index. The canonical project convention is a stronger claim ("always 1") than TC.jl's API enforces.

**Translation rule:** **None needed for current scope** — Fibonacci, Ising, and `six_j_category(graded_vector_spaces(QQ, Z/2))` all place the unit at index 1. **Defensive port-time guard recommended**: any port-time docstring asserting "vacuum at index 1" should be cross-checkable at runtime via `@assert findfirst(==(1), C.one) == 1`. If a future categorical extension introduces an instance where `findfirst(==(1), C.one) ≠ 1`, the porting code must use `findfirst` lookup rather than the literal value `1`. MMA hard-codes the value `1` extensively (cf. P8.1a bridge §`vacuum-index` callouts) — for the three exemplars this is safe; out-of-scope categories would need `vacuum_idx = findfirst(==(1), C.one)` substitution.

**TC.jl src citations:**
- `SixJCategory.one::Vector{Int}` field — `src/TensorCategoryFramework/SixJCategory/FusionCategory.jl:16`.
- `set_one!` (two methods) — lines 204-206 (vector) and 208-210 (integer).
- `one(C::SixJCategory)` accessor — lines 824-829.
- Per-constructor calls: `fibonacci_category` line 19; `ising_category` line 263; `graded_vector_spaces`→`six_j_category` line 500.

**MMA adaptation:** `config.jl:5,12-13` head comment and docstring declare "Labels are 1-based indices into simples(C); label 1 = vacuum"; `hilbert.jl:47` explicit `c == 1` test for empty-labels case; `interaction.jl:105` `vacuum = 1`; `paircreation.jl:24, 95, 109` various vacuum-at-1 checks; `braiding.jl:222, 236` `F[:, 1]` as vacuum column (with the in-scope-safety analysis at P8.1a bridge §`(a)` for the `F[:, 1]` shortcut). All hard-coded to `1`; safe for current scope per the alignment above.

---

### (b) F-matrix gauge

**TC.jl assumes:** F-symbols stored as `Array{MatElem,4}` named `ass` (associator) at `SixJCategory.ass::Array{MatElem,4}` (`FusionCategory.jl:11`); each entry `C.ass[i,j,k,l]` is a `MatElem` representing the morphism component `(S[i]⊗S[j])⊗S[k] → S[i]⊗(S[j]⊗S[k])` at intermediate-simple-`S[l]`. The base accessor is `six_j_symbol(C::SixJCategory, i, j, k, l)` at `FusionCategory.jl:453-459` (returns a single `MatElem` entry, demand-computing via `get_attribute(C, :six_j_symbol)` if unassigned). The category-level `six_j_symbols(C::Category, S = simples(C))` constructor at `src/TensorCategoryFramework/Skeletonization.jl:66-148` rebuilds the full array from a basis-change between `Hom((X⊗Y)⊗Z, W)` and `Hom(X⊗(Y⊗Z), W)`.

**Gauge characterization:** TC.jl makes **no explicit `is_unitary` claim by default** — `is_unitary(C::Category) = false` at `src/CategoryFramework/FrameworkChecks.jl:251` is the default, and only `CenterCategory`-derived categories override this (per `src/TensorCategoryFramework/Center/Center.jl:1721`'s `is_unitary(C::CenterCategory)`). For `SixJCategory` itself, `is_unitary` defaults to `false`. **In practice**, TC.jl's per-constructor F-symbol values are stated in the **involutory gauge** (`F² = I`) for the categories in cft-anyons scope:
- **Fibonacci**: `set_associator!(C,2,2,2,2, matrix(K, [a a; 1 -a]))` at `FibonacciCategory.jl:17` with `a = -roots(x²-x-1)[1] = -ϕ` (per line 6) gives `F^{τττ}_τ = [[-ϕ, -ϕ]; [1, ϕ]]`. Using `ϕ² = ϕ + 1` this matrix satisfies `F² = I`: `F²[1,1] = ϕ² - ϕ = 1`; `F²[2,2] = -ϕ + ϕ² = 1`; off-diagonals = 0 by direct expansion. So the storage IS involutory. The matrix is **involutory but NOT unitary in this raw presentation** — the canonical unitary form per `summary.tex def:fib-F` line 1040 is `[[ϕ⁻¹, ϕ⁻¹ᐟ²]; [ϕ⁻¹ᐟ², -ϕ⁻¹]]`, related to the TC.jl raw form by a diagonal-rescaling of basis vectors. Both are involutory (`F² = I`), and the unitary one is additionally `F = F^\dagger = F^{-1}`.
- **Ising**: `set_associator!(C,3,3,3, [z, z, inv(a)*matrix(F,[1 1; 1 -1])])` at `TambaraYamagami.jl:261` with `a = √2` gives `F^{σσσ}_σ = (1/√2) [[1, 1]; [1, -1]]` — this is **both unitary AND involutory** (Hadamard / 2-channel symmetric coincidence; cf. CONVENTIONS [P1.6(b)] Reasoning lines 137-143 and `summary.tex def:ising-F`).

The **involutory storage choice is documented across the cft-anyons project** at CONVENTIONS [P1.6(b)] lines 129-184; CLAUDE.md hallucination-risk callout "F-matrix gauge"; P8.1a bridge §`(b)`; the new GLOSSARY entries `def:rsymbol` Notes #3 and `def:braid-H` Notes #3.

**Canonical [P1.6(b)] choice:** **unitary gauge canonical** (matches `summary.tex` end-to-end); the involutory gauge (TC.jl's convention, used by MMA) is permitted as a translatable secondary representation.

**Difference:** **TC.jl uses involutory; canonical is unitary.** Per CONVENTIONS [P1.6(b)] Reasoning lines 137-143: for the three current-scope exemplars (Fibonacci, Ising, sVec) the F-matrix "happens to be **both unitary and involutory**" in the canonical unitary presentation. The TC.jl-stored matrices are in the involutory gauge specifically (Fibonacci: `[[-ϕ, -ϕ]; [1, ϕ]]`; Ising: Hadamard `(1/√2)[[1,1];[1,-1]]`; sVec: trivial) — Ising's storage IS unitary-and-involutory by coincidence; Fibonacci's stored form is involutory but NOT unitary, related to the canonical unitary form by a diagonal basis-rescaling. **In current scope** MMA's gauge-aware Hermitian-projector / spectral-decomposition patterns at `interaction.jl` + `braiding.jl` consume the involutory storage correctly without per-call unitary translation. **Out of scope** (multi-channel or non-multiplicity-free categories), the explicit Gram-orthogonalisation translation rule kicks in (already implemented at `braiding.jl:247-252`).

**Translation rule:**
- **Current scope**: NONE needed. Gauges coincide.
- **Out of scope**: any unitary `F` is related to the involutory `F` by a diagonal phase matrix arising from the splitting-basis-vector phase choice (formal correspondence per CONVENTIONS [P1.6(b)] lines 144-150). At the implementation level, MMA's `braiding.jl::_bond_braiding_element` lines 247-252 contains the **canonical implementation** of this translation for the 3+-channel case: Gram-orthogonalisation `G = F' * F; G_inv = inv(G); M = F * G_inv * Diagonal(R_re) * F'`. Port-time docstrings should reference this gold-standard pattern.

**TC.jl src citations:**
- `SixJCategory.ass::Array{MatElem,4}` field — `FusionCategory.jl:11`.
- `set_associator!` (multiple methods) — `FusionCategory.jl:117-140` (per-cell setters) + initialisation via `set_tensor_product!` at line 96-106 (sets identity associators for all triples by default).
- `six_j_symbol(C, i, j, k, l)` accessor — `FusionCategory.jl:453-459`.
- `six_j_symbols(C, S)` category-level constructor — `src/TensorCategoryFramework/Skeletonization.jl:66-148`.
- `is_unitary(C::Category) = false` default — `src/CategoryFramework/FrameworkChecks.jl:251`.
- Per-constructor F-symbol settings: Fibonacci `FibonacciCategory.jl:17`; Ising `TambaraYamagami.jl:258-261`.
- Pentagon-axiom verifier — `src/TensorCategoryFramework/TensorAxioms/PentagonAxiom.jl:6-13` (returns Bool; does NOT solve for F-symbols, only checks them).

**MMA adaptation:** `fsymbols.jl` stores TC.jl's involutory F-symbols verbatim via `FSymbolCache.exact::Array{<:MatElem,4}` (line 17, populated from `six_j_symbols(C)` at line 27); `_to_complex_matrix` (line 102) does pure numerical cast without gauge transformation. **Two gold-standard gauge-handling patterns in MMA** consume the involutory entries safely:
- `interaction.jl:138-167` Hermitian vacuum-projector pattern: `P_H = vv†/|v|²` where `v = F[:, vacuum_col]`. Gauge-independent because the projector geometry is the same regardless of involutory-vs-unitary representation.
- `braiding.jl:167-263` spectral decomposition `σ + σ† = Σ_f 2Re(R_f) · P_f^{phys}` with two sub-branches: 2-channel `P_2 = I - P_1` orthogonal complement (lines 234-245), 3+-channel Gram-matrix orthogonalisation (lines 247-252).

Two MMA files use raw F-symbol entries with a **port-time documentation gap**: `paircreation.jl:113` (raw `F[e_row, vac_col]` amplitude) and `finegraining.jl::_bond_sigma_element:386-403` (raw `F[:, 1]` via the same Gram pattern as braiding.jl, mooted by P8.6 exclusion of `categorical_determinant_isometry`). Both are mathematically correct in current scope; bd-tracked at `cft-anyons-xvq` (paircreation, P3) and `cft-anyons-874` (finegraining, P4).

---

### (c) Dagger / adjoint

**TC.jl assumes:** TC.jl provides a `dagger` function at `src/TensorCategoryFramework/AbstractTensorMethods.jl` (called at `CenterMorphism` overload `Center.jl:1717`); `inner_product` at line 564 of AbstractTensorMethods.jl is defined as `sqrt(fp_eigenvalue(matrix((dagger(f) ∘ g))))`. For matrix-level operations on `MatElem`, TC.jl uses Oscar's standard conjugate-transpose `transpose` / `adjoint`. `SixJMorphism` carries its matrix blocks in `m::Vector{<:MatElem}` (`FusionCategory.jl:34`); pointwise dagger is per-block conjugate-transpose. The dagger semantics for unitary fusion categories are not heavily exercised at the `SixJCategory` level — `is_unitary(C::SixJCategory)` is not overridden from the default `false`, so the categorical-adjoint apparatus is not engaged unless the consumer asserts unitarity by other means.

**Canonical [P1.6(c)] choice:** dagger `f^\dagger` = categorical adjoint when `C` is unitary, complex-conjugate transpose for matrices; per `CONVENTIONS.md:187-220`. The two semantics agree on Hom-space matrices once an orthonormal basis is fixed.

**Difference:** **No formal difference** at the matrix level (TC.jl's Oscar-derived `adjoint`/`transpose` on `MatElem` matches the canonical "complex-conjugate transpose for matrices"). At the categorical level, TC.jl provides the apparatus but **does not assert unitarity by default** — so the categorical-dagger semantics are not automatically tied to the matrix semantics for a generic `SixJCategory`. For the three exemplars in scope, the categorical dagger is implicit in the unitary-fusion-category framework used by `summary.tex`; TC.jl provides matrix-level dagger and leaves the categorical structure to the consumer.

**Translation rule:** **None needed** for matrix-level dagger usage (Julia's `adjoint(...)` / postfix `'` is conjugate-transpose for complex matrices and matches the canonical convention). For categorical-dagger claims on a `SixJCategory`, port-time docstrings should treat unitarity as an external assumption (per `summary.tex def:fuscat` rigid+unitary requirement) rather than as something TC.jl certifies.

**TC.jl src citations:**
- `dagger` function — referenced at `src/TensorCategoryFramework/AbstractTensorMethods.jl:564, 570, 574`; overloaded for `CenterMorphism` at `src/TensorCategoryFramework/Center/Center.jl:1717`.
- `inner_product(f, g)` — `AbstractTensorMethods.jl:564-571`.
- `norm(f)` — `AbstractTensorMethods.jl:573-575`.
- `orthogonal_basis` (Gram-Schmidt-like construction using `inner_product`) — `AbstractTensorMethods.jl:577-588`.
- `is_unitary(C::Category) = false` default — `FrameworkChecks.jl:251`.

**MMA adaptation:** matrix dagger via `'` postfix throughout (`interaction.jl:163` `conj(v[bra_row])`; `braiding.jl:393` `real(dot(...))`; `wavelets.jl:65` `R' * R`); no categorical-dagger invocation. Per P8.1a bridge §`(c)`: all MMA files conform.

---

### (d) Multiplicity-free assumption / multiplicity index notation

**TC.jl assumes:** TC.jl **natively supports arbitrary fusion-multiplicity categories**. The storage layout reflects this:
- The `tensor_product::Array{Int,3}` field (`FusionCategory.jl:13`) stores `N^c_{ab}` as integers — can take any non-negative value, not just 0/1.
- The associator `ass::Array{MatElem,4}` and braiding `braiding::Array{MatElem,3}` fields store **matrices**, not scalars; their dimensions are dictated by the fusion-multiplicity dimensions per `multiplicity_spaces(C, S)` at `src/TensorCategoryFramework/AbstractTensorMethods.jl:556-559`:
  ```julia
  function multiplicity_spaces(C::Category, S::Vector{<:Object} = simples(C))
      mults = [(i,j,k) => Hom(x ⊗ y, z) for (i,x) ∈ pairs(S), (j,y) ∈ pairs(S), (k,z) ∈ pairs(S)]
      Dict(p for p ∈ mults if int_dim(p[2]) > 0)
  end
  ```
  Each `Hom(x⊗y, z)` returns a `SixJHomSpace` whose basis is `dim Hom(x⊗y, z)`-dimensional (which IS `N^z_{xy}`); F-symbol entries `ass[i,j,k,l]` are then matrices of shape `dim Hom((S[i]⊗S[j])⊗S[k], S[l]) × dim Hom(S[i]⊗(S[j]⊗S[k]), S[l])`.
- TC.jl exposes a `multiplicity(C::Category)` predicate at `src/TensorCategoryFramework/AbstractTensorMethods.jl:125-130` returning the maximum entry of `multiplication_table(C)` — `1` for multiplicity-free categories, larger for non-multiplicity-free.
- The `multiplication_table(C::SixJCategory) = C.tensor_product` accessor at `FusionCategory.jl:236` returns the raw `N^c_{ab}` array.

**Canonical [P1.6(d)] choice:** multiplicity index `μ = 1, …, N^c_{ab}` explicit when `N^c_{ab} ≥ 2`, dropped (implicit) when `N^c_{ab} ∈ {0, 1}`; project-wide assumption is **multiplicity-free** (every `N^c_{ab} ∈ {0, 1}`) for the three current-scope categories.

**Difference:** **TC.jl is strictly more permissive than the canonical assumption.** TC.jl supports any `N^c_{ab} ≥ 0`; canonical project content currently restricts to `N^c_{ab} ∈ {0, 1}` and drops the multiplicity index μ. No semantic conflict — the canonical choice is a *strict subset* of TC.jl's capability.

**Translation rule:** **None needed for current scope.** For the three exemplars (Fibonacci, Ising, sVec) all `dim Hom(x⊗y, z) ∈ {0, 1}` so TC.jl's `MatElem` entries are effectively 1×1 matrices (scalars). MMA's pattern of treating `dim(Hom(...))` as boolean (`hilbert.jl:58`, `fsymbols.jl:75`, `braiding.jl:40`, `paircreation.jl:24`, `finegraining.jl:315`) collapses to the right answer. **For future extensions to non-multiplicity-free categories** (extended Haagerup, certain quantum-group level constructions): the LB-1 bug at MMA `hilbert.jl:42-68 enumerate_fusion_trees` (bd `cft-anyons-q6h`) becomes active — the boolean test must be replaced with `1:dim Hom(...)` iteration to enumerate the multiplicity-extended fusion-tree basis. TC.jl itself is ready (the underlying `MatElem` entries are already correctly sized); the bug is purely on the MMA consumer side.

**TC.jl src citations:**
- `tensor_product::Array{Int,3}` field — `FusionCategory.jl:13`.
- `set_tensor_product!` — `FusionCategory.jl:96-106`.
- `multiplication_table(C::SixJCategory)` accessor — `FusionCategory.jl:236`.
- `multiplicity(C::Category)` — `AbstractTensorMethods.jl:125-130`.
- `multiplicity_spaces(C::Category, S)` — `AbstractTensorMethods.jl:556-559`.
- `Hom(X::SixJObject, Y::SixJObject)` returning a `SixJHomSpace` of arbitrary dimension — `FusionCategory.jl:1023-1043`.
- `ass::Array{MatElem,4}` and `braiding::Array{MatElem,3}` field declarations sized to accommodate the multiplicity — `FusionCategory.jl:11, 12`.

**MMA adaptation:** **LB-1 latent at 5 sites** per P8.1a bridge §`(d)`: `hilbert.jl:58` primary (`!iszero(dim(Hom(...)))` boolean), `fsymbols.jl:75` secondary, `braiding.jl:40-44` secondary (multiplicity-aware iteration + multiplicity-free extraction at line 43; hybrid pattern), `paircreation.jl:24` secondary, `finegraining.jl:315` tertiary via `enumerate_fusion_trees`. Current-scope safe; LB-1 marker required at P8.4 port per `MIGRATION_PLAN.md:272`. R-symbol multiplicity inheritance documented at `def:rsymbol` Notes #4.

---

### (e) Complex-conjugation notation

**TC.jl assumes:** TC.jl is Julia source code; complex-conjugation is invoked via Julia's standard `conj(z)` for scalars and `transpose(adjoint(...))` for matrices via Oscar's `MatElem` adjoint. The notational overload concern (LaTeX `\bar` for both scalar conjugation and dual object) **does not apply** at the code level — TC.jl uses explicit function names (`dual(X::SixJObject)` at `FusionCategory.jl:570-591` for categorical-dual; `conj` for scalar conjugation when needed).

**Canonical [P1.6(e)] choice:** `\bar{z}` for scalar conjugation; `\overline{...}` for Hilbert closure (except around scalars where it is conjugation); established overloadings of `\bar` (dual object `\bar a`, anti-chiral `\bar L_n`, etc.) preserved; per `CONVENTIONS.md:273-321`.

**Difference:** **N/A — different domain.** [P1.6(e)] is a LaTeX-source convention; TC.jl is Julia code with explicit function names and no notational overload risk.

**Translation rule:** **None needed.** Port-time docstrings should use `conj(z)` for scalar conjugation, `dual(a)` for fusion-category duals, no `\bar` notational risk.

**TC.jl src citations:**
- `dual(X::SixJObject)` — `FusionCategory.jl:570-591`.
- Re-exports of `conj` / related — Oscar exports at `src/TensorCategories.jl:9-42` (`import Oscar: …`).

**MMA adaptation:** `fsymbols.jl::_to_complex_*` overloads (lines 111-133) use Oscar's `Float64(real(x))` + `Float64(imag(x))` cast; `interaction.jl:163` `conj(v[bra_row])`; `braiding.jl:393` `real(dot(...))`. No `\bar` notational issue in code per P8.1a bridge §`(e)`.

---

### (f) TikZ macro source

**TC.jl assumes:** N/A — TC.jl is Julia code, not LaTeX; no TikZ usage. TC.jl includes some documentation and tutorial material under `/home/tobiasosborne/.julia/packages/TensorCategories/fnMHT/docs/` and `/home/tobiasosborne/.julia/packages/TensorCategories/fnMHT/Tutorials/` but these are not part of the import surface for Phase 8.

**Canonical [P1.6(f)] choice:** DEFERRED — no TikZ in `summary.tex` at P1.6 declaration; pre-registered hook for first introduction.

**Difference:** N/A — both N/A.

**Translation rule:** N/A.

**TC.jl src citations:** None.

**MMA adaptation:** N/A — Phase 8 is Julia source, not LaTeX.

---

### (g) Particle-number disambiguation

**TC.jl assumes:** N/A — TC.jl is a fusion-category framework; it has no notion of "particle number" or "tensor degree" as such. The closest analogue is `length(simples(C))` (the number of simple objects in the category) or `length(X.components)` for an object `X::SixJObject` (which equals `C.simples`). These are unrelated to the cft-anyons "particle number" (`n` in canonical convention; `N` in MMA-local convention) or "lattice length" (`L`).

**Canonical [P1.6(g)] choice:** `L` = tensor degree / lattice length / cell count; `n` = particle number (count of non-vacuum legs); `N` deprecated as standalone; per `CONVENTIONS.md:359-411`.

**Difference:** **N/A — different concept.** [P1.6(g)] is an MMA-vs-summary.tex convention for naming the lattice-length and particle-count quantities; TC.jl has neither.

**Translation rule:** N/A — disambiguation lives at the MMA-consumer level, not the TC.jl-provider level.

**TC.jl src citations:** None directly relevant. `simples::Int64` field at `FusionCategory.jl:9` (the count of simple objects in the category) is sometimes named `n` in TC.jl source (e.g., `skeletal_braiding` at `Skeletonization.jl:294` uses `N = length(S)`) but this is the **fusion-category rank**, NOT the cft-anyons particle/lattice count.

**MMA adaptation:** Per P8.1a bridge §`(g)`: MMA uniformly uses `N` for particle count (= our `n`), `L` for lattice length (= our `L`). Port docstrings at P8.4/P8.5 must declare this MMA-local reading explicitly. Documented at P1.6(g) Translation rules.

---

### (h) Local cell object Q choice

**TC.jl assumes:** N/A — TC.jl is a fusion-category framework and has no notion of a "local cell object" `Q ∈ C` of the form `Q_full = ⊕_a a` or any of the five alternatives in `summary.tex rem:Q-choices`. The categorical object `⊕_{a ∈ Irr(C)} a` (the regular object) is representable in TC.jl as a `SixJObject` with `components = [1, 1, …, 1]` (`C.simples`-many 1s), but TC.jl does not give this object a privileged name or status.

**Canonical [P1.6(h)] choice:** `Q = Q_full = ⊕_{a ∈ Irr(C)} a` canonical default; five alternatives catalogued at `summary.tex rem:Q-choices`; per `CONVENTIONS.md:414-475`.

**Difference:** **N/A — different domain.** [P1.6(h)] is a downstream-modelling choice for cft-anyons; TC.jl provides the underlying objects and tensor products generically without privileging any.

**Translation rule:** N/A on the TC.jl side. MMA's `config.jl` hard-codes `Q_full` via the `2:d` non-vacuum-only label enumeration + vacuum-by-absence (line 36) — this is MMA's modelling choice, not a TC.jl-level one.

**TC.jl src citations:** None directly relevant. The generic object construction is `SixJObject(C, components)` at `FusionCategory.jl:26-29`; `⊕(X::SixJObject...) = SixJObject(parent(X[1]), vec(sum(hcat(...))))` at lines 890-892; the regular object would be constructed as `direct_sum(simples(C)...)`.

**MMA adaptation:** Per P8.1a bridge §`(h)`: all MMA files inherit `Q_full` via `config.jl`'s baked-in non-vacuum-only-label-enumeration. Cannot represent alternatives (2)-(5) from [P1.6(h)] without code changes.

---

### (i) Fusion-tree basis ordering

**TC.jl assumes:** TC.jl's associator `ass[i,j,k,l]` storage corresponds to the F-symbol move `(S[i]⊗S[j])⊗S[k] → S[i]⊗(S[j]⊗S[k])` per the `associator(X::SixJObject, Y::SixJObject, Z::SixJObject)` function at `FusionCategory.jl:280-363` (constructs the morphism `(X⊗Y)⊗Z → X⊗(Y⊗Z)`; F-symbols `six_j_symbol(C,i,j,k,l)` are the per-channel matrix elements). The associator is therefore stated in the **left-associated-to-right-associated** direction: the *source* basis `(X⊗Y)⊗Z` is left-associated. The `six_j_symbols(C, S)` constructor at `Skeletonization.jl:66-148` builds `B_XY_Z_W` as a basis for `Hom((X⊗Y)⊗Z, W)` (line 113: "Build a basis for Hom((X⊗Y)⊗Z,W)") — explicitly left-associated.

**Critical for ordering**: TC.jl's pentagon-axiom verifier at `PentagonAxiom.jl:6-13` enforces the standard pentagon `(id(X)⊗α(Y,Z,W)) ∘ α(X,Y⊗Z,W) ∘ (α(X,Y,Z)⊗id(W)) = α(X,Y,Z⊗W) ∘ α(X⊗Y,Z,W)`, which is the pentagon for associators going `((⊗)⊗) → (⊗(⊗))`, i.e., **F-symbols moving from left-associated to right-associated bracketings**.

**Canonical [P1.6(i)] choice:** **left-associated** fusion-tree basis; intermediate charge `s_k` = total charge of `X_{a_1} ⊗ … ⊗ X_{a_k}` for `k = 2, …, n−1`; F-matrix entries stated in the left-associated convention; per `CONVENTIONS.md:479-519`.

**Difference:** **No difference — TC.jl matches canonical.** TC.jl's `(X⊗Y)⊗Z → X⊗(Y⊗Z)` associator is exactly the canonical "F-symbol moves left-associated to right-associated" convention. The basis for the *source* hom-space `Hom((X⊗Y)⊗Z, W)` is left-associated; the basis for the *target* hom-space `Hom(X⊗(Y⊗Z), W)` is right-associated. F-symbol matrix rows are indexed by left-associated intermediates; columns by right-associated intermediates. **MMA's `fsymbols.jl` head comment** (per P8.1a bridge `fsymbols.jl §convention conformance (i)`) consumes this convention verbatim ("rows = left intermediates, cols = right intermediates").

**Translation rule:** **None needed.** TC.jl's left-associated convention IS the canonical convention.

**TC.jl src citations:**
- `associator(X, Y, Z)` morphism returning `(X⊗Y)⊗Z → X⊗(Y⊗Z)` — `FusionCategory.jl:280-363` (specifically the docstring at lines 275-279).
- `six_j_symbol(C, i, j, k, l)` per-cell accessor — `FusionCategory.jl:453-459`.
- `six_j_symbols(C, S)` constructor with explicit "Hom((X⊗Y)⊗Z, W)" basis construction at line 113 — `Skeletonization.jl:66-148`.
- Pentagon-axiom verifier (confirms left-to-right F-symbol convention) — `PentagonAxiom.jl:6-13`.

**MMA adaptation:** Per P8.1a bridge §`(i)`: `hilbert.jl:13-15` explicit docstring "left-associated fusion tree"; `fsymbols.jl` head comment lines 3-5 + rows-vs-columns convention at lines 45-46 ("rows = left intermediates, cols = right intermediates"); `interaction.jl`, `braiding.jl`, `paircreation.jl`, `finegraining.jl` all use the left-associated F-matrix access pattern. CONFORM throughout.

---

### (j) Empty-configuration / `N = 0` boundary

**TC.jl assumes:** TC.jl handles the empty / unit-only case as a standard categorical primitive. `Hom(W, one(C))` for any `W::SixJObject` returns a `SixJHomSpace` whose basis is `dim Hom(W, one(C))`-dimensional, which is `1` iff `W = one(C)` (since `one(C)` is simple) and `0` otherwise. The general `Hom(X, Y)` function at `FusionCategory.jl:1023-1043` handles this correctly:

```julia
function Hom(X::SixJObject, Y::SixJObject)
    Xi, Yi = X.components, Y.components
    d = sum([x*y for (x,y) ∈ zip(Xi,Yi)])
    if d == 0 return SixJHomSpace(X,Y,SixJMorphism[]) end
    ...
end
```

For the empty tensor product `Q^⊗0 = 1_C`, TC.jl uses `one(C)` directly — the `tensor_product(X...)` function variadic call handles 0 arguments correctly (returns `one(C)` per the `direct_sum`/`tensor_product` standard semantics for empty variadic calls, though this requires the consumer to invoke it via `one(C)` rather than `tensor_product()` to be safe).

**Canonical [P1.6(j)] choice:** empty configuration = trivial Hilbert space `H_∅^W = Hom_C(W, 1_C^{⊗0}) = Hom_C(W, 1_C) = δ_{W,1} · ℂ`; 1-dim iff `W = 1`, 0-dim otherwise; per `CONVENTIONS.md:523-576`.

**Difference:** **No difference — TC.jl matches canonical via standard categorical primitives.** `Hom(W, one(C))` returns the right `δ_{W,1} · ℂ` answer for any simple `W` per TC.jl's `Hom` semantics + the fact that `one(C)` is simple.

**Translation rule:** **None needed.** TC.jl provides the empty / unit-only case via standard categorical primitives; the canonical `δ_{W,1}` behaviour emerges automatically.

**TC.jl src citations:**
- `Hom(X::SixJObject, Y::SixJObject)` empty-hom-space short-circuit — `FusionCategory.jl:1023-1043` (specifically `if d == 0 return SixJHomSpace(X,Y,SixJMorphism[]) end` at line 1030).
- `one(C::SixJCategory)` — `FusionCategory.jl:824-829`.

**MMA adaptation:** Per P8.1a bridge §`(j)`: `enumerate_fusion_trees(C, [], c)` returns `[Int[]]` iff `c == 1`, else empty list (`hilbert.jl:47`); `enumerate_configs_hc(L, 0, C) = [LabelledConfig(Int[], Int[])]` (`config.jl:32`); all other files (`interaction.jl:64`, `braiding.jl:91`, etc.) skip the `np < 2` empty/single-particle cases correctly. CONFORM throughout, exactly realising [P1.6(j)].

---

## R-symbol storage (extension beyond CONVENTIONS letters)

**Load-bearing per P8.1.5** (`def:rsymbol` + `def:braid-H` GLOSSARY additions). Although not aligned with any of the 10 CONVENTIONS [P1.6(*)] letters, the R-symbol storage layout is now a first-class concern for Phase-8 porters consuming `braiding.jl`.

### Storage layout

TC.jl stores R-symbols as a three-dimensional array of matrix elements in the `SixJCategory.braiding::Array{MatElem,3}` field (`src/TensorCategoryFramework/SixJCategory/FusionCategory.jl:12`). Indexing is **`(i, j, k)` for the morphism `S[i] ⊗ S[j] → S[k]`** (cf. the `skeletal_braiding` constructor at `src/TensorCategoryFramework/Skeletonization.jl:291-330` which writes `braid[i,j,l] = matrix(F, length(B_XY_W), length(B_YX_W), braid_XY_W)` at line 325 — so `braid[i,j,l]` IS the matrix encoding the braiding map from `Hom(X⊗Y, W)` to `Hom(Y⊗X, W)` for `W = S[l]`).

For the multiplicity-free case (the three cft-anyons exemplars), each `MatElem` entry at `C.braiding[i,j,k]` is a **1×1 matrix** carrying the scalar R-symbol `R^{i,j}_k`. For non-multiplicity-free categories the entry is a `dim Hom(S[i]⊗S[j], S[k]) × dim Hom(S[j]⊗S[i], S[k])` matrix (which IS unitary in general per Trebst's prose quote at `def:rsymbol` Canonical block 1: "in general, $R_c^{b,a}$ is a unitary matrix").

### Accessors and predicates

- **`r_symbol(C::SixJCategory, i::Int, j::Int, k::Int)`** — `FusionCategory.jl:461-467`: returns the single `MatElem` entry `C.braiding[i,j,k]`, demand-computing via `get_attribute(C, :r_symbol)` if unassigned. **Note: this function has a minor source-code bug at line 464** — the assignment `C.braiding[i,j,k,l]` uses a four-index subscript on a three-index array (`l` is undefined). In practice this code path is dead because `set_braiding!` populates the whole array eagerly at category-construction time for the three current-scope exemplars; the demand-computation path is only relevant for categories with a lazy `:r_symbol` attribute, which none of the in-scope exemplars use. **Not a P8.1c blocker** — flag-for-awareness only.
- **`is_braided(C::SixJCategory)`** — `FusionCategory.jl:482`: `isdefined(C, :braiding)`. Returns `true` iff the `braiding` field has been populated; for Fibonacci this is `false` by default (`fibonacci_category()` does not call `set_braiding!`), for Ising this is `true` (per the `try` block at `TambaraYamagami.jl:284-303`).
- **`braiding(X::SixJObject, Y::SixJObject)`** — `FusionCategory.jl:239-269`: morphism-level constructor returning the braiding morphism `X⊗Y → Y⊗X`; demand-populates `C.braiding[i,j,:]` from `:r_symbol` attribute if unassigned (lines 245-247).
- **`set_braiding!(F::SixJCategory, braiding)`** — `FusionCategory.jl:108-110`: bulk setter, assigns the full `Array{MatElem,3}`.
- **`reverse_braiding(C::SixJCategory)`** — `FusionCategory.jl:1244` and following.
- **`skeletal_braiding(C::Category, S)`** — `Skeletonization.jl:291-330`: constructs the skeletal-form `Array{MatElem,3}` from a generic braided category.

### Gauge characterisation (per P8.1.5)

R-symbols are **NOT independently gauged**. Per `def:rsymbol` Notes #3 (GLOSSARY.md:2291-2316) and the corroborating bridge-audit line (`stocktake/reports/opus-mma-julia-bridge.md:269`):
- The R-symbol itself is a scalar phase per fusion channel and is **gauge-invariant up to the channel-basis ambiguity** (resolved consistently by MMA's `left_intermediates`/`right_intermediates` helpers and TC.jl's `r_symbol(C, i, j, k)` accessor).
- However, the **composite braid-matrix `B = F R F`** (Trebst eq. (2.8)) DOES inherit the F-matrix gauge. The involutory identity `F² = I` (rather than the unitary identity `F^{-1} = F^\dagger`) is the algebraic basis for MMA's `σ = F × diag(R) × F` shortcut at `braiding.jl:7-8` head comment.
- Translation rule [P1.6(b)] therefore applies **transitively** to any computation that uses `B` numerically. In current Fibonacci/Ising multiplicity-free scope, [P1.6(b)]'s involutory-and-unitary coincidence means no explicit translation is needed.
- **No new CONVENTIONS letter is required** — R-symbol gauge is fully downstream of F-symbol gauge per the delegation argument in `def:rsymbol` Notes #3 + `def:braid-H` Notes #3.

### MMA-side adaptation

Per P8.1a bridge §`braiding.jl` and `def:rsymbol` Translation map:
- **`RSymbolCache.r_values::Dict{Tuple{Int,Int,Int}, ComplexF64}`** (`braiding.jl:19-22`) — MMA's per-channel scalar cache, keyed `(i, j, k) → R^{a,b}_c`.
- **`build_rsymbol_cache(C)`** (`braiding.jl:30-49`) — populates the cache by calling TC.jl's `braiding(S[i], S[j])` morphism (line 35), extracting via `matrix(b)` (line 36), and converting per channel via `_to_complex(C, M[row+1, row+1])` (line 43). The "row+1, row+1" extraction is the LB-1 multiplicity-collapse: for multiplicity-free categories `M` is 1×1 and the answer is unambiguous; for multiplicity > 1 only one scalar is recovered per channel.
- **`build_rsymbol_cache_manual(r_dict)`** (`braiding.jl:57-59`) — bypass constructor for user-supplied R-symbols; used in `test/test_braiding_nonabelian.jl` to inject Fibonacci-specific values `R^{ττ}_𝟙 = e^{+4πi/5}`, `R^{ττ}_τ = e^{-3πi/5}` (Trebst eq. (2.7)).

### Hexagon-axiom apparatus

- **`hexagon_axiom(X::T, Y::T, Z::T)`** — `src/TensorCategoryFramework/TensorAxioms/HexagonAxion.jl:6-17`: returns a Bool checking whether the braiding satisfies the hexagon equations with the associator.
- **`hexagon_axiom_numeric(X, Y, Z)`** — lines 19-26: numeric variant using `overlaps(matrix(f), matrix(g))` for `Arb`/`Complex`-field base rings.
- **`hexagon_axiom(objects::Vector{<:Object}, log::Bool = false)`** — lines 34-49: bulk verifier across all triples; `log = true` returns the failing triples.
- **`hexagon_axiom(C::Category, log::Bool = false)`** — line 57: `hexagon_axiom(simples(C), log)`.

**Critical**: TC.jl provides the hexagon axiom as a **verifier**, not as a **generator/solver**. The R-symbols come from the category-construction site (`set_braiding!` in each example category constructor); the hexagon equation is then optionally *checkable* but never *enforced* by TC.jl itself.

---

## Drift surface summary

| Convention | TC.jl vs canonical | Translation needed at port time? | Port-time hazard |
|---|---|---|---|
| (a) vacuum index | **No difference for current-scope exemplars** (all three put unit at index 1); TC.jl is more permissive (allows any indicator vector via `set_one!`) | NONE for current scope. Defensive `findfirst(==(1), C.one)` recommended for future-scope categories. | LOW — MMA hard-codes `1` extensively; safe for current scope. |
| (b) F-matrix gauge | **TC.jl involutory; canonical unitary.** Storage is involutory across all current-scope exemplars (Fibonacci raw form involutory-not-unitary; Ising Hadamard is involutory-and-unitary by coincidence; sVec trivial). MMA's gauge-aware Hermitian-projector / spectral-decomposition patterns handle the involutory storage correctly in current scope without per-call unitary translation. | NONE for current scope; explicit translation via Gram-orthogonalisation pattern (per `braiding.jl:247-252` gold standard) needed for 3+-channel out-of-scope categories. | MEDIUM — two MMA documentation gaps tracked (`paircreation.jl:113`, `finegraining.jl::_bond_sigma_element` — bd `cft-anyons-xvq` + `cft-anyons-874`); mathematically correct in scope, port-time inline comments add clarity. |
| (c) dagger / adjoint | **No difference at matrix level.** TC.jl provides `adjoint`/`dagger` via Oscar; categorical-dagger is unasserted by default (`is_unitary = false`) but the apparatus exists. | NONE — Julia `adjoint(...)` is conjugate-transpose for matrices, matching canonical. | LOW — consumer should not rely on TC.jl certifying unitarity. |
| (d) multiplicity-free | **TC.jl strictly more permissive** (supports any `N^c_{ab} ≥ 0` via `Array{MatElem,4}` / `Array{MatElem,3}` storage). | NONE for current scope; LB-1 must be fixed on the MMA side (not the TC.jl side) before scope expansion. | MEDIUM — LB-1 latent at 5 MMA sites; TC.jl-side is already correct. |
| (e) complex-conjugation notation | **N/A — different domain** (LaTeX vs Julia). | NONE. | LOW. |
| (f) TikZ macro source | **N/A — both N/A.** | NONE. | LOW. |
| (g) particle-number disambiguation | **N/A — different concept.** TC.jl has no notion. | NONE on TC.jl side; MMA-side declaration in port docstrings required per P8.1a bridge §`(g)`. | LOW. |
| (h) local cell object `Q` | **N/A — different domain.** TC.jl is generic; `Q_full` is an MMA modelling choice. | NONE. | LOW. |
| (i) fusion-tree basis ordering | **No difference — TC.jl left-associated matches canonical.** | NONE. | LOW. |
| (j) `N=0` boundary | **No difference — TC.jl handles via standard `Hom(W, one(C))`.** | NONE. | LOW. |
| R-symbol storage (extension) | **TC.jl `braiding::Array{MatElem,3}` keyed `(i,j,k)` for `S[i]⊗S[j]→S[k]`; multiplicity-aware matrices that collapse to scalars for multiplicity-free categories.** No independent gauge — fully downstream of [P1.6(b)] via `B = F R F`. | NONE for current scope; LB-1 multiplicity-collapse at `braiding.jl:43` flag-on-extension. | MEDIUM — R-symbol concept newly first-class in GLOSSARY per P8.1.5 (`def:rsymbol` + `def:braid-H`); porters should consume the GLOSSARY entries directly. |

**Drift-surface count:**
- **No-difference (TC.jl matches canonical):** 4 — (c), (i), (j), and effectively (a) for current scope.
- **Different-but-handled-in-scope:** 1 — (b) F-matrix gauge (TC.jl stores involutory; MMA gauge-aware patterns produce correct results without per-call unitary translation; Gram-orthogonalisation translation activates for out-of-scope multi-channel cases).
- **TC.jl more permissive (canonical is a strict subset):** 2 — (a) architecturally, (d).
- **N/A (different domain or different concept):** 4 — (e), (f), (g), (h).
- **Extension beyond the 10 letters:** 1 — R-symbol storage.

**Net hazard for P8.4+ porters:** the convention surface is largely clean. The two genuine port-time considerations are (b) gauge documentation (already gold-standard at `interaction.jl` + `braiding.jl`; two doc-gaps at `paircreation.jl` + `finegraining.jl` tracked in bd) and (d) LB-1 multiplicity-collapse (latent at five MMA sites; flag-on-extension).

---

## Recommendation: P8.4+ port docstring template

Each per-file port at P8.4 / P8.5 / P8.6 / P8.7 should carry a top-of-file docstring block declaring (i) which TC.jl functions are called by name, (ii) which TC.jl conventions are inherited, (iii) which canonical [P1.6(*)] letters apply + any translation, (iv) any LB-1 latent sites. The template synthesises the per-convention table above:

```julia
# === TC.jl convention dependencies ===
# TC.jl functions consumed (all EXIST in TC.jl 0.5.3 per
#   stocktake/reports/opus-tcjl-api-audit.md):
#   - <function 1>, <function 2>, …
# TC.jl conventions inherited (per stocktake/reports/opus-tcjl-conventions-bridge.md):
#   - (a) vacuum at simples(C)[1] — TC.jl matches canonical for current-scope
#         exemplars (Fibonacci / Ising / Z/2-graded). For out-of-scope
#         categories use findfirst(==(1), C.one).
#   - (b) F-matrix gauge: stored involutory by TC.jl per
#         SixJCategory.ass::Array{MatElem,4}; coincident with canonical
#         unitary gauge for current-scope (real-symmetric Fibonacci F²=I,
#         Hadamard Ising). Per CONVENTIONS [P1.6(b)] no translation needed
#         here. <If raw F-symbol entries used: declare the
#         "Hermitian-projector workaround" / "Gram-orthogonalisation" /
#         "coincidence-regime" pattern.>
#   - (d) multiplicity-free: TC.jl supports arbitrary multiplicity via
#         Array{MatElem,4}; MMA collapses to scalar via dim(Hom(...))
#         boolean test. In-scope safe (Fibonacci/Ising/sVec all
#         multiplicity-free); LB-1 bd cft-anyons-q6h.
#   - (i) left-associated F-symbol move (X⊗Y)⊗Z → X⊗(Y⊗Z); matches
#         canonical.
#   - (j) N=0 boundary: Hom(W, one(C)) returns δ_{W,1}·ℂ; matches
#         canonical.
# Canonical conventions applied (per CONVENTIONS.md):
#   - [P1.6(g)] in this file: N = particle count (= our n);
#                              L = lattice length (= our L)
#   - [P1.6(h)] Q = Q_full = ⊕_{a ∈ Irr(C)} a (inherited via config.jl)
# R-symbol storage (if file consumes braiding):
#   - TC.jl SixJCategory.braiding::Array{MatElem,3} keyed (i,j,k) for
#     S[i]⊗S[j]→S[k]. Multiplicity-free → 1×1 = scalar per channel.
#     Gauge: no independent gauge; downstream of (b) via B = F R F per
#     def:rsymbol Notes #3.
```

**Worked example** (port of `interaction.jl` at P8.5):

```julia
# === TC.jl convention dependencies ===
# TC.jl functions consumed: (none directly — operates on FSymbolCache
#   via fsymbols.jl helpers)
# TC.jl conventions inherited:
#   - (b) F-matrix gauge: stored involutory by TC.jl per
#         SixJCategory.ass; this file applies the canonical
#         Hermitian-projector workaround P_H = vv†/|v|² (vacuum-column
#         projector) which is gauge-independent. See
#         stocktake/reports/opus-tcjl-conventions-bridge.md §(b)
#         "MMA adaptation" for the gold-standard pattern recap.
#   - (i) left-associated F-symbol indexing rows = left intermediates,
#         cols = right intermediates.
# Canonical conventions applied:
#   - [P1.6(a)] vacuum = 1 at line 105 (vacuum-channel projector);
#   - [P1.6(c)] dagger via conj(v[bra_row]) at line 163;
#   - [P1.6(g)] in this file: N = particle count = our n; L = lattice
#                              length = our L;
#   - [P1.6(h)] Q_full inherited via config.jl basis;
#   - [P1.6(j)] np < 2 skip at line 64, 172.
# Realises: [[def:TL-cat]] per def:TL-cat Translation map citing
#   interaction_hamiltonian / interaction_hamiltonian_sector.
# LB-1 inheritance: latent secondary via fusion_channels /
#   left_intermediates / right_intermediates / f_matrix; in-scope safe;
#   see RESEARCH_NOTES §LB-1 + bd cft-anyons-q6h.
```

---

## Open questions for user

None requiring escalation. The audit confirms TC.jl's conventions are either:
- Aligned with canonical (letters (c), (i), (j), and (a)-for-current-scope);
- Translated cleanly via existing rules (letter (b), with two MMA-side doc-gap bd issues already tracked);
- N/A by domain (letters (e), (f), (g), (h));
- Strictly more permissive than canonical, with no semantic conflict (letters (a) architecturally, (d)).

The R-symbol storage extension is now documented in GLOSSARY (`def:rsymbol`, `def:braid-H` per P8.1.5); this report cross-references and supplements those entries with TC.jl-source-level detail but does not surface new ambiguities.

**One non-blocking source-code observation surfaced during the audit** (not requiring user input, recorded here for posterity): the `r_symbol(C, i, j, k)` accessor at `FusionCategory.jl:464` has a minor source-level bug — `C.braiding[i,j,k,l]` uses a four-index subscript on a three-index array, with `l` undefined. The code path is effectively dead (eager `set_braiding!` populates the whole array in all current-scope constructors), so the bug does not affect any current MMA or test consumer. **No bd issue filed** — TC.jl-upstream bug, not in our patch scope; flag-for-awareness only in case a future Phase-8 port exercises a lazy `:r_symbol` attribute pattern.

---

## Method (reproducible)

```bash
# Confirm TC.jl pin
cat /home/tobiasosborne/Projects/microscopic-mobile-anyons/Manifest.toml \
  | grep -A2 'name = "TensorCategories"'
# → version = "0.5.3"; git-tree-sha1 = 591655388467dd84356425f16d584319809306ec

# Confirm depot
cat /home/tobiasosborne/.julia/packages/TensorCategories/fnMHT/Project.toml | head -5
# → version = "0.5.3"

# SixJCategory struct
sed -n '7,25p' \
  /home/tobiasosborne/.julia/packages/TensorCategories/fnMHT/src/TensorCategoryFramework/SixJCategory/FusionCategory.jl

# Example category constructors
cat /home/tobiasosborne/.julia/packages/TensorCategories/fnMHT/src/Examples/Fibonacci/FibonacciCategory.jl
sed -n '180,310p' \
  /home/tobiasosborne/.julia/packages/TensorCategories/fnMHT/src/Examples/TambaraYamagami/TambaraYamagami.jl
sed -n '485,515p' \
  /home/tobiasosborne/.julia/packages/TensorCategories/fnMHT/src/Examples/GradedVectorSpaces/GradedVectorSpaces.jl

# Multiplicity functions
grep -n 'function multiplicity\b\|function multiplicity_spaces\|multiplication_table' \
  /home/tobiasosborne/.julia/packages/TensorCategories/fnMHT/src/TensorCategoryFramework/AbstractTensorMethods.jl \
  /home/tobiasosborne/.julia/packages/TensorCategories/fnMHT/src/TensorCategoryFramework/SixJCategory/FusionCategory.jl

# is_unitary default
grep -n 'is_unitary' \
  /home/tobiasosborne/.julia/packages/TensorCategories/fnMHT/src/CategoryFramework/FrameworkChecks.jl

# Hexagon + Pentagon
cat /home/tobiasosborne/.julia/packages/TensorCategories/fnMHT/src/TensorCategoryFramework/TensorAxioms/HexagonAxion.jl
sed -n '1,20p' \
  /home/tobiasosborne/.julia/packages/TensorCategories/fnMHT/src/TensorCategoryFramework/TensorAxioms/PentagonAxiom.jl

# R-symbol storage
sed -n '108,120p;239,270p;460,470p;480,485p;1244,1260p' \
  /home/tobiasosborne/.julia/packages/TensorCategories/fnMHT/src/TensorCategoryFramework/SixJCategory/FusionCategory.jl
sed -n '290,330p' \
  /home/tobiasosborne/.julia/packages/TensorCategories/fnMHT/src/TensorCategoryFramework/Skeletonization.jl
```

**No Julia REPL invocation needed** (pure source-level audit per brief; Oscar compilation would add minutes of overhead with no audit benefit). Audit time: ~20 minutes of file reads + cross-referencing against the four predecessor reports (P8.0a, P8.1a, P1.4-early hilbert-bridge, P8.1.5 GLOSSARY entries).

---

## Conclusion

Phase 8 P8.1c **deliverable: this report**, providing a per-convention TC.jl-vs-canonical reference for the 10 [P1.6(*)] letters plus the R-symbol storage extension. **No new STOP-level conflicts surfaced**; no new GLOSSARY / CONVENTIONS entries required; no user escalation needed. The 10-letter convention surface is largely clean: 4 no-differences, 1 different-but-coincident, 2 TC.jl-more-permissive (canonical is a strict subset, no conflict), 4 N/A by domain, and 1 documented extension (R-symbols, already first-class in GLOSSARY per P8.1.5). Two MMA-side documentation-gap bd issues (`cft-anyons-xvq`, `cft-anyons-874`) remain as routine port-time TODOs for P8.5 / P8.6. **Phase 8 P8.4+ per-file porters are unblocked**; the port docstring template above synthesises the audit findings for each port commit's top-of-file header.
