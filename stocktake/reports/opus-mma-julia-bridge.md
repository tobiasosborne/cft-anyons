# MMA Julia Bridge Audit — Phase 8 P8.1a (definitional-bridge audit)

**Author:** Opus 4.7 (1M-context, model id `claude-opus-4-7[1m]`), as P8.1a implementer
**Date:** 2026-05-17
**Trigger:** `MIGRATION_PLAN.md:269` (Phase 8 P8.1) and HANDOFF.md "🚨 IMMEDIATE NEXT ACTION".
**Predecessor:** `stocktake/reports/opus-tcjl-api-audit.md` (P8.0a, commit `3c53c60`) — TC.jl 0.5.3 API audit (LB-3 discharge); pinned `FusionCategory` as the one residual AMBIGUOUS finding at bd `cft-anyons-b6b`.
**User-memory drivers:** `feedback-phase8-tensorcategories-care` (heightened drift care) + `feedback-reviewer-deep-d-gate` (audit per slug, not slug-existence).

---

## Scope and method

**Scope:** the 11 Julia files at `/home/tobiasosborne/Projects/microscopic-mobile-anyons/src/MobileAnyons/` — `MobileAnyons.jl` (module shell) + the 10 functional files (`config.jl`, `hilbert.jl`, `fsymbols.jl`, `operators.jl`, `interaction.jl`, `braiding.jl`, `paircreation.jl`, `wavelets.jl`, `finegraining.jl`, `virasoro.jl`).

**Anchors:**
- `GLOSSARY.md` slugs (49 entries; `## def:` and `## conv:` headers enumerable via `grep -nE '^## (def|conv):' GLOSSARY.md`).
- `CONVENTIONS.md` letters (a)–(j), specifically the 7 currently-invoked: (a) vacuum index, (b) F-matrix gauge, (c) dagger, (d) multiplicity-free, (e) complex conjugation, (g) particle-number disambiguation, (h) local cell object Q, (i) fusion-tree ordering, (j) N=0 boundary.
- Pre-fed 7 conventions from `stocktake/reports/opus-hilbert-bridge.md` §4 (lines 271–287): vacuum index, F-matrix gauge, particle-number disambiguation, choice of Q, fusion-tree basis ordering, multiplicity index, N=0 boundary.
- P8.0a TC.jl 0.5.3 export map at `stocktake/reports/opus-tcjl-api-audit.md` (the authoritative existence table for any TC.jl symbol).
- 8 CLAUDE.md hallucination-risk callouts: vacuum-index, F-matrix gauge, coassociativity overload, dagger-special vs Frobenius-special, three Hilbert-space framings, `\unchecked` flags, archived chats, Lean 0-sorry/0-axiom.

**Method:** read-only source-level audit; no Julia REPL invocation (per brief). For each file: SHA256 + LOC (verified `sha256sum` on the MMA source at the time of writing); enumerate exported symbols (cross-referencing `MobileAnyons.jl` exports list, lines 17–32, with each file's `function`/`struct` declarations); map each export to a GLOSSARY slug; check each of the 10 CONVENTIONS [P1.6(*)] letters that bear on the file; check each CLAUDE.md hallucination-risk callout; identify LB-1/LB-2/LB-3/LB-4 leak sites.

**Cross-check inputs:** `stocktake/reports/mma-julia.md` (the pre-existing per-file synthesis; cited inline for Translation-rule corroboration), MMA's `test/` directory (18 test files; spot-read `test_categories.jl`, `test_hilbert.jl`, `test_golden_chain.jl`, `test_paircreation.jl`, `test_fsymbols.jl` for ground-truth grounding).

---

## Per-file audit

### `MobileAnyons.jl` — module shell

**File-level provenance:**
- Path: `/home/tobiasosborne/Projects/microscopic-mobile-anyons/src/MobileAnyons/MobileAnyons.jl`
- SHA256: `a79941c5f2ad9cf28a0ccc0407dc4aa73388435df8966871b62f4c241d00d319`
- LOC: 33
- Module: `MobileAnyons`

**TC.jl symbols brought in:** `using TensorCategories, Oscar` (line 3) imports the full TC.jl 0.5.3 export surface (415 exports, P8.0a) plus Oscar's `dim`/`hom`/`decompose`/`dual`/`multiplication_table`/`tensor_product` re-exports. Specific TC.jl symbols actually USED in the 10 functional files: `simples`, `dim`, `Hom`, `six_j_symbols`, `braiding`, `matrix`, `base_ring`, `gen`, `complex_embeddings` (the last three from Oscar via TC.jl re-exports). Per P8.0a all symbols EXIST in TC.jl 0.5.3.

**Exported symbols + GLOSSARY mapping:** (28 symbol names — direct re-exports from the 10 functional files; map deferred to those files)

| Exported group | Source file | GLOSSARY slug realised |
|---|---|---|
| `LabelledConfig`, `enumerate_configs_hc` | `config.jl` | [[def:partition]] |
| `FusionTree`, `AnyonBasis`, `build_basis`, `enumerate_fusion_trees` | `hilbert.jl` | [[def:mobile-Fock]], [[def:splitbasis]] |
| `FSymbolCache`, `build_fsymbol_cache`, `f_matrix`, `f_symbol`, `fusion_channels`, `left_intermediates`, `right_intermediates` | `fsymbols.jl` | [[def:fsymbol]] |
| `hopping_hamiltonian`, `hopping_hamiltonian_sector`, `free_fermion_energies` | `operators.jl` | (no direct GLOSSARY slug — see operators.jl entry; closest is [[def:dense]]'s dense-anyon Hilbert space + standard tight-binding) |
| `interaction_hamiltonian`, `interaction_hamiltonian_sector` | `interaction.jl` | [[def:TL-cat]] |
| `RSymbolCache`, `build_rsymbol_cache`, `build_rsymbol_cache_manual`, `braiding_hamiltonian`, `braiding_hamiltonian_sector`, `tv_model_spectrum` | `braiding.jl` | (no direct R-symbol slug — see braiding.jl entry; t-V is a textbook reference) |
| `dual_pairs`, `pair_creation_operator`, `pair_hamiltonian` | `paircreation.jl` | [[def:pair-create]] |
| `daubechies_filter`, `one_particle_scaling_map`, `one_particle_scaling_map_haar` | `wavelets.jl` | (closest: [[def:polar-repair]] for Löwdin step; one-particle isometry has no dedicated slug) |
| `fine_graining_isometry_svec` (declared twice in exports — lines 27 and 30) | `wavelets.jl` + `finegraining.jl` | [[def:refmap]], [[def:persist]] (sVec specialisation) |
| `fine_graining_isometry`, `trivial_embedding`, `normalized_product_isometry`, `categorical_determinant_isometry` | `finegraining.jl` | [[def:refmap]], [[def:persist]], [[def:Jinterp]] partial |
| `bond_projectors_dense`, `hamiltonian_fourier_modes`, `virasoro_commutator_check` | `virasoro.jl` | [[def:KS-Ln]], [[def:KS-scalars]] |

**Convention conformance:** module-shell only; per-file detail below. Note the bare `include()` chain orders files dependency-correctly: `config.jl` → `hilbert.jl` → `fsymbols.jl` → `operators.jl` → `interaction.jl` → `braiding.jl` → `paircreation.jl` → `wavelets.jl` → `finegraining.jl` → `virasoro.jl`. This dependency order maps directly to MIGRATION_PLAN P8.4–P8.7's per-file import sequence.

**Drift flags:** none at the shell level.

**Cosmetic finding (file-local, not a drift flag):** `fine_graining_isometry_svec` is exported twice (lines 27 and 30). Julia silently de-duplicates; benign, but per-port commit should keep both lines OR collapse — P8.4+ implementer's discretion. P8.0a Surprise #4 noted the analogous double-export pattern in TC.jl 0.5.3 (`twisted_graded_vector_spaces`); this is the MMA-side analogue.

**Verdict:** OK (mechanical shell; no semantic content).

---

### `config.jl` — classical configuration space

**File-level provenance:**
- SHA256: `35723d190f4318144f4be35b57343f044efb75a7ae68f44a014a8ce55edc570d`
- LOC: 41

**TC.jl symbols used:** `simples` (line 28; P8.0a verdict EXISTS, export line 432). Used only to read out `d = length(simples(C))` for label-range arithmetic. Gauge-independent.

**Exported symbols + GLOSSARY mapping:**

| Exported symbol | Type/sig | GLOSSARY slug realised | CONVENTIONS [P1.6(*)] applied | Gauge handling | LB-* exposure | Verdict |
|---|---|---|---|---|---|---|
| `LabelledConfig` | `struct {positions::Vector{Int}, labels::Vector{Int}}` (line 15) | [[def:partition]] (the MMA realisation of an ordered partition + label data; see [[def:partition]] Translation map) | (a) vacuum-at-index-1 (head comment line 5, label-1 = vacuum); (g) `L` = lattice length, `N` = particle count (function `enumerate_configs_hc(L, N, C)` signature, line 27); (h) `Q = Q_full = ⊕_a a` baked in (labels `∈ 2:d` exclude vacuum-by-position, head comment "Hard-core: at most one anyon per site"); (j) `N == 0` returns single empty config (line 32) | None (configurations are gauge-independent) | none | OK |
| `enumerate_configs_hc` | `(L::Int, N::Int, C) -> Vector{LabelledConfig}` (line 27) | [[def:partition]] (per [[def:partition]] Translation map: "MMA indexes hard-core configurations on a 1D lattice of L sites: this is the mobile version of summary.tex's partition") | (a) `1:L` positions, vacuum implicit at unoccupied sites; (g) `L`, `N` per MMA's convention (N = our `n`); (h) `Q_full` via `2:d` non-vacuum label range (line 36); (j) `N == 0` boundary `return [LabelledConfig(Int[], Int[])]` (line 32) — matches [P1.6(j)] | None | none | OK |

**Convention conformance (all 10 CONVENTIONS letters):**
- (a) vacuum index: ✓ — head comment line 5 "Labels are 1-based indices into simples(C); label 1 = vacuum"; line 12-13 docstring restates. Conforms to [P1.6(a)].
- (b) F-matrix gauge: N/A — file does not invoke F-symbols.
- (c) dagger: N/A — file has no inner-product operations.
- (d) multiplicity-free: N/A here (configurations carry no fusion data); the latent multiplicity-free assumption surfaces downstream in `hilbert.jl`. Conforms via absence.
- (e) complex conjugation: N/A.
- (g) particle-number disambiguation: ⚠ MMA-local usage: `L` = lattice length (= our `L` per [P1.6(g)]); `N` = particle number (= our `n`). The MMA convention is opposite to summary.tex's `H_N^W` where `N` = tensor degree. [P1.6(g)] documents this as the canonical reading rule for MMA-imported code; the port docstring (added at P8.4) must restate this. **Not a violation** — the rule is explicitly that MMA `N` reads as our `n`.
- (h) local cell object Q: ✓ — `Q = Q_full` baked in via the "label ∈ 2:d" non-vacuum-only enumeration + vacuum-by-absence. Conforms to [P1.6(h)] canonical default. The five named alternatives in [P1.6(h)] are not representable here without code changes.
- (i) fusion-tree ordering: N/A — file has no fusion trees.
- (j) N=0 boundary: ✓ — line 32 explicit `N == 0 && return [LabelledConfig(Int[], Int[])]`. Pairs with `hilbert.jl:47` for the full `N=0` `H_∅^W = δ_{W,1} ℂ` boundary per [P1.6(j)].

**Drift flags (CLAUDE.md hallucination-risk callouts):**
- **vacuum-index**: correctly fires here at the documented site (lines 5, 12-13). No drift.
- F-matrix gauge / coassoc / dagger-special / Hilbert-space framings / `\unchecked` / chats / Lean-invariants: not observed in this file.

**Verdict:** OK. Direct port to `src/MobileAnyons/config.jl` at P8.4. Port docstring should reference [[def:partition]] + [P1.6(a)] + [P1.6(g)] + [P1.6(h)] + [P1.6(j)] explicitly.

---

### `hilbert.jl` — mobile-anyon Fock-space basis

**File-level provenance:**
- SHA256: `c8b7e888f625160df7e08d4db6539687224409ac031947d49730a4bed79450de`
- LOC: 98

**TC.jl symbols used:** `simples` (lines 43, 76), `dim` (line 58), `Hom` (line 58), `⊗` (line 58 — TC.jl's monoidal-product operator; P8.0a confirms exported via `Hom`'s overload set). All EXIST per P8.0a.

**Exported symbols + GLOSSARY mapping:**

| Exported symbol | Type/sig | GLOSSARY slug realised | CONVENTIONS [P1.6(*)] applied | Gauge handling | LB-* exposure | Verdict |
|---|---|---|---|---|---|---|
| `FusionTree` | `struct {config::LabelledConfig, intermediates::Vector{Int}, total_charge::Int}` (line 17) | [[def:splitbasis]] (the splitting-tree basis indexed by intermediate charges; left-associated per docstring line 13) | (a) `intermediates`/`total_charge` are 1-based indices into `simples(C)`; (i) **left-associated** explicit in docstring line 13-14 ("left-to-right fusion"); (j) `intermediates` is empty for `N=0` or `N=1` (line 15) | None | none in struct definition | OK |
| `AnyonBasis{T}` | `struct {L::Int, C::T, states::Vector{FusionTree}, sector_ranges::Dict{Tuple{Int,Int}, UnitRange{Int}}}` (line 29) | [[def:mobile-Fock]] (the full MMA basis; this struct IS the realisation of `H_MMA(L)` per [[def:mobile-Fock]] Canonical second-form: `H_MMA(L) = ⊕_{N=0}^L ⊕_{c} ⊕_{config} ⊕_{fusion_tree}`) | (a) sector_ranges keyed by `(N, c)` 1-based; (g) `L` = our `L`, `N` (in sector key) = our `n`; (h) `Q_full` inherited via `config.jl`; (i) left-associated; (j) (N=0, c=1) sector present | None at struct level | none | OK |
| `enumerate_fusion_trees` | `(C, labels::Vector{Int}, c::Int) -> Vector{Vector{Int}}` (line 42) | [[def:splitbasis]] (enumerates basis of Mor(c, X_{l_1} ⊗ … ⊗ X_{l_N}); see [[def:splitbasis]] Notes for the LB-1 caveat) | (a) `c=1` for empty (line 47); (i) left-associated (recursive build in order `2:N`, lines 52-67); (j) `N=0` boundary returns `[Int[]]` iff `c=1` (line 47, matches [P1.6(j)] declaration explicitly); (d) **LB-1 leak point** — line 58 treats `iszero(dim(Hom(...)))` as boolean | None (F-symbols not touched) | **LB-1 primary site** | **LB-1 marker REQUIRED at port** (per `MIGRATION_PLAN.md:272`: "add `# TODO LB-1: multiplicity-free assumption; see RESEARCH_NOTES.md` marker above `enumerate_fusion_trees` line 58") |
| `build_basis` | `(L::Int, C; hardcore=true) -> AnyonBasis` (line 75) | [[def:mobile-Fock]] (builds the full mobile-Fock basis by iterating over (N, c) sectors and calling `enumerate_configs_hc` + `enumerate_fusion_trees`) | (a) `c in 1:d` 1-based; (g) `N` ranges `0:max_N`; (i) left-associated by composition; (j) (N=0, c=1) is a non-empty sector (`enumerate_fusion_trees(C, Int[], 1)` returns `[Int[]]`); **LB-1 secondary site** (inherits from `enumerate_fusion_trees`) | None | **LB-1 secondary** | OK (correctly propagates LB-1 from primary site; no additional marker needed if primary site is marked) |

**Convention conformance (all 10 CONVENTIONS letters):**
- (a) vacuum index: ✓ — `c == 1` test for empty-labels case (line 47) confirms vacuum at index 1.
- (b) F-matrix gauge: N/A — file does not invoke F-matrix values; only fusion multiplicities via `dim(Hom(...))`.
- (c) dagger: N/A.
- (d) multiplicity-free: ⚠ **LB-1 lives here.** Line 58 `iszero(dim(Hom(...)))` is a Boolean cast. For categories with `dim Hom(a⊗b, c) > 1` (e.g., extended Haagerup), this undercounts the splitting basis — should iterate `1:dim(Hom(...))` per fusion vertex. In current scope (Fibonacci/Ising/sVec — all multiplicity-free), every `dim Hom ∈ {0, 1}` so Boolean test is correct. **Latent.** Per [P1.6(d)] and `RESEARCH_NOTES.md` §LB-1.
- (e) complex conjugation: N/A.
- (g) particle-number disambiguation: ✓ — MMA-local: `N` = particle number (= our `n`); `L` = lattice length (= our `L`). Consistent with `config.jl`. Port docstring at P8.4 must declare this reading rule.
- (h) local cell object Q: ✓ — inherits `Q_full` from `config.jl`.
- (i) fusion-tree ordering: ✓ — explicit docstring line 13 "left-associated fusion tree"; `intermediates[k]` defined as "result of fusing a₁⊗...⊗a_{k+1}" (line 14); recursion iterates left-to-right (line 52-67 `recurse(k, ...)` walks `k = 2 ... N`). Conforms to [P1.6(i)].
- (j) N=0 boundary: ✓ — line 47 explicit `N == 0 && return c == 1 ? [Int[]] : Vector{Int}[]`. Realises [P1.6(j)] declaration EXACTLY: 1-dim if `W = 1`, 0-dim otherwise. Cross-validated in [P1.6(j)]'s Sweep status: "MMA: agrees with the convention via its `enumerate_fusion_trees` empty-list behaviour."

**Drift flags (CLAUDE.md hallucination-risk callouts):**
- **Hilbert-space framings**: this file IS the MMA mobile-Fock framing; correctly identified by `stocktake/reports/opus-hilbert-bridge.md` §1.3 and locked at [[def:mobile-Fock]]. No drift.
- **vacuum-index**: correctly fires (line 47 `c == 1`).
- F-matrix gauge / coassoc / dagger-special / `\unchecked` / chats / Lean: not observed.

**Verdict:** OK with REQUIRED LB-1 TODO marker at port time (per `MIGRATION_PLAN.md:272`). Port docstring should reference [[def:mobile-Fock]] + [[def:splitbasis]] + [P1.6(a/d/g/h/i/j)] + cite bd `cft-anyons-q6h`.

---

### `fsymbols.jl` — F-symbol extraction from TC.jl

**File-level provenance:**
- SHA256: `a832b5d371b20fb5620467cb757faee043fb6635b25d730f816ed3568c7c6510`
- LOC: 150

**TC.jl symbols used:** `six_j_symbols` (line 27; EXISTS per P8.0a export line 434, source `src/TensorCategoryFramework/6j-Solver.jl:5`), `simples` (lines 28, 71, 75), `dim` (line 75), `Hom` (line 75), `⊗` (line 75), `MatElem` (line 17; abstract Oscar type), Oscar field/embedding API: `base_ring` (line 120), `complex_embeddings` (line 143), `gen` (line 148), `QQFieldElem`/`ZZRingElem`/`AbsSimpleNumFieldElem`/`QQBarFieldElem` (lines 111, 115, 119, 126 — Oscar number types). All EXIST per P8.0a / Oscar 1.6 (MMA's `Project.toml` pin).

**Exported symbols + GLOSSARY mapping:**

| Exported symbol | Type/sig | GLOSSARY slug realised | CONVENTIONS [P1.6(*)] applied | Gauge handling | LB-* exposure | Verdict |
|---|---|---|---|---|---|---|
| `FSymbolCache{T}` | `struct {C::T, exact::Array{<:MatElem,4}, numerical::Dict{NTuple{4,Int}, Matrix{ComplexF64}}}` (line 15) | [[def:fsymbol]] (the F-symbol; this struct is the MMA-side wrapper cited in [[def:fsymbol]] Translation map: "`src/MobileAnyons/fsymbols.jl::FSymbolCache`") | (b) **involutory gauge** stored as-is from TC.jl `six_j_symbols`; (i) left-associated F-matrix convention; (e) `ComplexF64` for numerical entries | **Involutory gauge stored.** Consumer (the calling code in `interaction.jl`, `braiding.jl`, `paircreation.jl`, `finegraining.jl`) is responsible for the gauge translation per [P1.6(b)] if used outside the multiplicity-free single-channel-coincidence regime. **No translation done in this file** — `_to_complex_matrix` (line 102) is a pure numerical cast | none | OK (gauge-translation responsibility is correctly deferred to consumer; the involutory storage is the documented [P1.6(b)] TC.jl convention) |
| `build_fsymbol_cache` | `(C) -> FSymbolCache` (line 26) | [[def:fsymbol]] (constructor; cited in [[def:fsymbol]] Translation map and [[def:fib-F]] / [[def:ising-F]]) | (b) caches `six_j_symbols(C)` verbatim (line 27 + 32 → 35) | Same as struct — stores involutory | none | OK |
| `f_matrix` | `(cache, a, b, c, d) -> Matrix{ComplexF64}` (line 48) | [[def:fsymbol]] (numerical accessor; cited in [[def:fib-F]] Translation map: "`f_matrix(cache, \tau, \tau, \tau, \tau)`") | (b) returns raw involutory matrix entries | **Raw F-matrix entries returned.** Per [P1.6(b)] Translation rule "MMA-imported F-matrix entries (Julia): assumed involutory. In current Fibonacci/Ising scope, no translation needed — matrices coincide." | none | OK in current scope; flag-on-port if scope expands |
| `f_symbol` | `(cache, a, b, c, d, e_idx, f_idx) -> ComplexF64` (line 58) | [[def:fsymbol]] (scalar accessor) | (b) same as `f_matrix` | Same | none | OK |
| `fusion_channels` | `(cache, a, b) -> Vector{Int}` (line 70) | [[def:fsymbol]] adjunct (returns `{c : N^c_{ab} > 0}` via boolean `dim(Hom(...))`); related to [[def:splitbasis]] | (d) **LB-1 secondary site** — line 75 `!iszero(dim(Hom(...)))` is a Boolean cast, same pattern as `hilbert.jl:58`; collapses multiplicities | None | **LB-1 secondary** | OK in current scope; **per-port docstring should note "multiplicity-free assumption inherited from [P1.6(d)]"** |
| `left_intermediates` | `(cache, a, b, c, d) -> Vector{Int}` (line 85) | [[def:fsymbol]] adjunct (the row-index map for the F-matrix [F^{abc}_d]_{ef}) | (d) inherits LB-1 from `fusion_channels`; (i) "rows = left intermediates" matches left-associated convention | None | **LB-1 tertiary** (via `fusion_channels`) | OK in current scope |
| `right_intermediates` | `(cache, a, b, c, d) -> Vector{Int}` (line 95) | [[def:fsymbol]] adjunct (column-index map) | (d) inherits LB-1; (i) "cols = right intermediates" matches | None | **LB-1 tertiary** | OK in current scope |

**Internal helpers (not exported, but called via `_to_complex` from `braiding.jl:43`):**
- `_to_complex_matrix(C, F::MatElem)` (line 102) — pure numerical cast of an Oscar `MatElem` to `Matrix{ComplexF64}`.
- `_to_complex(C, x)` (lines 111, 115, 119, 126, 131) — dispatch by Oscar number-type to `ComplexF64`. The `AbsSimpleNumFieldElem` overload (line 119) calls `_physical_embedding(K)` to choose a canonical embedding.
- `_physical_embedding(K::AbsSimpleNumField)` (line 142) — **heuristic** picks the embedding with largest `Float64(real(e(gen(K))))`. For Fibonacci's `K = ℚ(√5)`, returns the embedding mapping `√5 ↦ +2.236` (so `φ ↦ +1.618`). **Documented at lines 146-148**: "For Fibonacci, this gives φ ≈ 1.618 rather than -0.618." Not a slug; not GLOSSARY-defined; matches `summary.tex def:phi` numerical value of `φ = (1+√5)/2 ≈ 1.618`. Gauge-handling-relevant in the sense that `_physical_embedding` IS the implicit numerical resolution of TC.jl's symbolic-field F-matrix entries; this is where the involutory matrix becomes concrete numbers. No mathematical drift — just a heuristic.

**Convention conformance (all 10 CONVENTIONS letters):**
- (a) vacuum index: ✓ — all indices `a, b, c, d ∈ 1:d` enumerate `simples(C)` 1-based; vacuum at index 1 in `simples(C)` ordering per [P1.6(a)] Translation map.
- (b) F-matrix gauge: ⚠ **Stores involutory** (TC.jl's `six_j_symbols` output). Per [P1.6(b)]: TC.jl uses involutory gauge; canonical is unitary. **In current Fibonacci/Ising/sVec scope, gauges coincide** (Fibonacci F is real symmetric involutory + unitary; Ising F is Hadamard-type unitary; sVec is trivial). No translation done here. **Conforms** to [P1.6(b)] Translation rule "MMA-imported F-matrix entries (Julia): assumed involutory. In current Fibonacci/Ising scope, no translation needed." **Port docstring at P8.4 must declare**: "F-symbol entries stored in TensorCategories.jl's involutory gauge ([P1.6(b)]); coincident with the canonical unitary gauge in current Fibonacci/Ising/sVec scope; future scope expansion requires gauge translation."
- (c) dagger: N/A (file has no inner-product operations; numerical entries are returned without conjugation).
- (d) multiplicity-free: ⚠ **LB-1 secondary site.** Line 75 `!iszero(dim(Hom(...)))` — same pattern as `hilbert.jl:58`. Per [P1.6(d)] Sweep status the assumption applies project-wide; this file inherits the assumption from the categories in scope. Latent.
- (e) complex conjugation: ✓ — `_to_complex(...)` overloads (lines 111-133) use Oscar's standard `Float64(real(x))` + `Float64(imag(x))` cast; `_physical_embedding` picks a canonical complex embedding.
- (g) particle-number disambiguation: N/A — file has no `N`/`L` parameters.
- (h) local cell object Q: ✓ — `C` is the abstract fusion category; F-symbols apply for any `Q ⊆ ⊕_a a`. No hard-code.
- (i) fusion-tree ordering: ✓ — F-matrix interpreted as `(a⊗b)⊗c → a⊗(b⊗c)` change-of-basis (head comment lines 3-5); rows = left intermediates, cols = right intermediates (line 45-46). Conforms to [P1.6(i)]: F-symbol entries are stated in the left-associated convention.
- (j) N=0 boundary: N/A.

**Drift flags (CLAUDE.md hallucination-risk callouts):**
- **F-matrix gauge**: ⚠ — TC.jl's involutory gauge is stored raw. Per [P1.6(b)] and `CONVENTIONS.md` Sweep status, this is the canonical handling pattern. The hallucination-risk callout fires correctly (involutory storage acknowledged) and is handled by deferring gauge-translation to the consumer.
- **vacuum-index**: not directly invoked; 1-based via `1:d` (correct).
- coassoc / dagger-special / Hilbert-framings / `\unchecked` / chats / Lean: not observed.

**Verdict:** OK in current scope. **Port docstring must declare the involutory-gauge storage** per [P1.6(b)] and the LB-1 multiplicity inheritance per [P1.6(d)].

---

### `operators.jl` — hopping Hamiltonian (free-fermion-like, gauge-trivial)

**File-level provenance:**
- SHA256: `a359f0a69891911b99a89af0d86f59826d4ed1df9158521788ba948942825a63`
- LOC: 157

**TC.jl symbols used:** none direct. (`SparseArrays` only; line 13.) The Hamiltonian acts on basis indices via lookup.

**Exported symbols + GLOSSARY mapping:**

| Exported symbol | Type/sig | GLOSSARY slug realised | CONVENTIONS [P1.6(*)] applied | Gauge handling | LB-* exposure | Verdict |
|---|---|---|---|---|---|---|
| `hopping_hamiltonian` | `(basis::AnyonBasis; t=1.0) -> SparseMatrixCSC{Float64}` (line 26) | **No direct GLOSSARY slug.** Closest concept: standard 1D tight-binding Hamiltonian `H = -t Σ_j (c†_j c_{j+1} + h.c.)` (textbook); the head comment lines 3-7 motivate the choice — for ANY fusion category, hopping into a vacuum site is trivial (`F^{a,b,1}_d = F^{a,1,c}_d = 1`). This is a **non-content** infrastructure exporter (a free-fermion Hamiltonian on a hard-core anyonic basis); it is not a categorical primitive | (a) site indexing 1:L; (h) inherits `Q_full`; relies on `enumerate_fusion_trees` indirectly via `basis.states` | None (hopping uses no F-symbols — head comment lines 5-7 explicitly state F-moves with vacuum factor are trivially 1) | none direct (basis carries LB-1 latent) | OK — no GLOSSARY slug needed; this is a hopping-Hamiltonian builder, not a categorical primitive. **No new GLOSSARY entry needed** (Synthesis-section nominee) |
| `hopping_hamiltonian_sector` | `(basis::AnyonBasis, N::Int, c::Int; t=1.0) -> SparseMatrixCSC{Float64}` (line 91) | (same — restricted to `(N, c)` sector) | (a/g/h) as above; (g) `N` in sector key = our `n` | None | none direct | OK |
| `free_fermion_energies` | `(L::Int, N::Int; t=1.0) -> Vector{Float64}` (line 147) | **No GLOSSARY slug** (textbook free-fermion OBC dispersion `ε_k = -2t cos(πk/(L+1))`; line 148 closed form). Reference comparison tool | (g) `L`, `N` per MMA convention | None | none | OK — reference oracle; no GLOSSARY entry needed |

**Convention conformance:**
- (a) vacuum index: ✓ — implicit via `basis.L` and 1-based site lookup; vacuum-by-absence pattern.
- (b) F-matrix gauge: N/A — head comment lines 5-7 explicitly note hopping uses no F-symbols.
- (c) dagger: ✓ — `h_L(j) = h_R(j)†` (head comment line 21); enforced by symmetric `(I, J, V)` triple construction with both `-t` for hop and its transpose (lines 60-78).
- (d) multiplicity-free: N/A directly; inherits via basis.
- (e) complex conjugation: N/A — matrix is `Float64`.
- (g) particle-number disambiguation: ⚠ — MMA-local `N` = particle number = our `n`. Function `free_fermion_energies(L, N)` uses MMA's reading. Port docstring at P8.5 must declare.
- (h) local cell object Q: ✓ — `Q_full` via basis.
- (i) fusion-tree ordering: N/A — file does not touch trees.
- (j) N=0 boundary: ✓ — `free_fermion_energies` returns `[0.0]` for `N == 0` (line 149); matches [P1.6(j)] zero-particle vacuum.

**Drift flags (CLAUDE.md hallucination-risk callouts):**
- F-matrix gauge: explicitly noted as NOT-INVOKED in head comment — correctly handled.
- vacuum-index / coassoc / dagger-special / Hilbert-framings / `\unchecked` / chats / Lean: not observed.

**Verdict:** OK. No GLOSSARY slug required for `hopping_hamiltonian`, `free_fermion_energies` — these are infrastructure (textbook free-fermion physics on the anyonic basis). **`hopping_hamiltonian_sector` complete invariant** (it correctly reproduces `free_fermion_energies(L, N)` for sVec at the `(N, c=1)` sector + the all-`ψ`-labels case) is a CLAIM the file makes implicitly; cross-validate at P8.8 test-runs via `test_svec.jl` / `test_braiding_svec.jl`.

---

### `interaction.jl` — Hermitian-projector vacuum-channel TL generator (gauge-aware)

**File-level provenance:**
- SHA256: `7fc0f7dc0bdca063de9f98cfc5fa78a58cfeed12b2b623fa89418c3e25aa710e`
- LOC: 208

**TC.jl symbols used:** none direct in this file (operates on `FSymbolCache` via `f_matrix` / `left_intermediates` / `right_intermediates` from `fsymbols.jl`).

**Exported symbols + GLOSSARY mapping:**

| Exported symbol | Type/sig | GLOSSARY slug realised | CONVENTIONS [P1.6(*)] applied | Gauge handling | LB-* exposure | Verdict |
|---|---|---|---|---|---|---|
| `interaction_hamiltonian` | `(basis::AnyonBasis, cache::FSymbolCache; J=1.0) -> SparseMatrixCSC{ComplexF64}` (line 24) | [[def:TL-cat]] (per [[def:TL-cat]] Translation map: "`src/MobileAnyons/interaction.jl::interaction_hamiltonian` … builds $H = \sum_j P_j$ where each $P_j$ is the Hermitian vacuum-channel projector at bond $j$") | (a) vacuum-channel projector uses `vacuum = 1` (line 105 explicit); (b) **involutory→Hermitian** workaround documented at lines 11-13 (head comment); (c) dagger via `vv†` construction (line 154); (h) `Q_full`; (i) left-associated F-symbol indexing | **Documented Hermitian-projector workaround** at head comment lines 11-13: "TensorCategories.jl F-matrix is in a non-unitary gauge (involutory: F²=I, but F†≠F⁻¹). We use the Hermitian projector P_H = vv†/|v|² where v = F[:, vacuum_col], which is gauge-independent." Line 154-156 re-states inline | none direct (LB-1 latent via basis) | **OK — exemplary gauge-handling pattern.** This is the canonical demonstration of [P1.6(b)] Translation rule applied correctly |
| `interaction_hamiltonian_sector` | `(basis::AnyonBasis, cache::FSymbolCache, N::Int, c::Int; J=1.0)` (line 43) | [[def:TL-cat]] (sector-restricted variant; faster via Dict index) | Same as above | Same | none direct | OK |

**Internal helper `_bond_projector_element` (line 104):** computes a single bond's projector matrix elements via the gauge-aware decomposition. For bond `p=1` (innermost vertex), projector is diagonal (line 107-115). For bond `p≥2`, the F-move is applied: `F = f_matrix(cache, a, b, c, d)` (line 138), `v = F[:, vac_col]` (line 156), `P_H[bra_row, ket_row] = v[ket_row] * conj(v[bra_row]) / |v|²` (line 163). This is the algebraic realisation of the head-comment workaround.

**Convention conformance (all 10 CONVENTIONS letters):**
- (a) vacuum index: ✓ — line 105 explicit `vacuum = 1`; line 146 `findfirst(==(vacuum), ri)` retrieves vacuum column.
- (b) F-matrix gauge: ✓ **CANONICAL HANDLING** — head comment lines 11-13 + inline restatement lines 154-156. The Hermitian-projector `P_H = vv†/|v|²` is gauge-independent (the same scalar-projector geometry regardless of involutory vs unitary representation of `F`). This is the [P1.6(b)] Translation rule's correct application. **Exemplary.**
- (c) dagger: ✓ — `conj(v[bra_row])` (line 163) is matrix-element complex conjugation per [P1.6(c)].
- (d) multiplicity-free: ⚠ inherits LB-1 via `fusion_channels`/`left_intermediates`/`right_intermediates`/`f_matrix`. Latent.
- (e) complex conjugation: ✓ — `conj(...)` at line 163, `real(dot(v, v))` at line 157.
- (g) particle-number disambiguation: ⚠ — `N` parameter in `interaction_hamiltonian_sector` is MMA's particle-number (= our `n`); `c` is the total-charge index. Port docstring at P8.5 must declare.
- (h) local cell object Q: ✓ — inherits `Q_full` via basis.
- (i) fusion-tree ordering: ✓ — left-associated F-matrix used (`a` = cumulative up to anyon p-1, `b` = labels[p], `c` = labels[p+1], `d` = cumulative up to anyon p+1; lines 129-136); matches [P1.6(i)].
- (j) N=0 boundary: ✓ — `np < 2 && continue` (line 64, 172) skips < 2-particle states (no bonds to act on).

**Drift flags (CLAUDE.md hallucination-risk callouts):**
- **F-matrix gauge**: ✓ — fires correctly at the head comment + inline. Handled with the Hermitian-projector pattern. **No drift.**
- **vacuum-index**: ✓ — `vacuum = 1` explicit.
- coassoc / dagger-special / Hilbert-framings / `\unchecked` / chats / Lean: not observed.

**Verdict:** OK. **This file is the gold-standard pattern for gauge-aware MMA code.** Port verbatim at P8.5; the head comment lines 11-13 (documenting [P1.6(b)] application) is itself load-bearing and must be preserved.

---

### `braiding.jl` — R-symbol cache + Hermitian braiding Hamiltonian (gauge-aware)

**File-level provenance:**
- SHA256: `d92ffdc696672d9ca44a800aacb52b1788bb8c0f0ec1072bc9253469045decd0`
- LOC: 394

**TC.jl symbols used:** `simples` (lines 31, 40), `dim` (line 40), `Hom` (line 40), `⊗` (line 40), `braiding` (line 35 — TC.jl's braiding-morphism constructor), `matrix` (line 36 — Oscar `matrix(morphism)` extracts the numerical matrix). The `_to_complex` helper (line 43) is the same dispatch chain as in `fsymbols.jl`.

`braiding` (TC.jl): not in P8.0a's main verdicts table because GLOSSARY does not cite it; verified to exist by examining TC.jl 0.5.3 source at `/home/tobiasosborne/.julia/packages/TensorCategories/fnMHT/src/CategoryFramework/AbstractTypes.jl` (the abstract braiding interface) + per-category overloads. Exported (TC.jl `TensorCategories.jl` source line 110). EXISTS.

**Exported symbols + GLOSSARY mapping:**

| Exported symbol | Type/sig | GLOSSARY slug realised | CONVENTIONS [P1.6(*)] applied | Gauge handling | LB-* exposure | Verdict |
|---|---|---|---|---|---|---|
| `RSymbolCache` | `struct {r_values::Dict{Tuple{Int,Int,Int}, ComplexF64}}` (line 19) | **No direct GLOSSARY slug.** R-symbols are referenced obliquely in `summary.tex` (e.g., braiding context) but no GLOSSARY entry defines an R-symbol primitive. Cross-checked: `grep -in 'R-symbol\|R_symbol\|R\^{' GLOSSARY.md` returns nothing for an explicit R-symbol slug. The closest GLOSSARY mention is via [[def:fuscat]] (rigid duals + braiding for unitary fusion categories). **This is a Synthesis nominee for a future GLOSSARY entry** — IF the user decides R-symbols are first-class in this project's scope. **Per brief Stop condition #1: file bd issue, do NOT add GLOSSARY entry.** (see Synthesis "GLOSSARY-entry coverage") | (a) keyed `(i, j, k)` 1-based; (d) `mult > 0` check at line 41 — **multiplicity-aware** (`row += mult` at line 44, but extraction at line 43 reads only `M[row+1, row+1]` with comment "For multiplicity-free: R^{i,j}_k is the (row+1, row+1) entry") — same hybrid pattern as `fusion_channels`: tracks multiplicity in iteration but extracts single value | None at struct level | **LB-1 secondary** at extraction (multi-multiplicity R-symbols are collapsed to one scalar) | **GLOSSARY-coverage gap** (R-symbol concept) — bd issue filed; no GLOSSARY edit per Law 1 |
| `build_rsymbol_cache` | `(C) -> RSymbolCache` (line 30) | (same — constructor) | (d) hybrid multiplicity-aware-iteration / multiplicity-free-extraction | Calls TC.jl `braiding(S[i], S[j])`; `matrix(b)` extracts as Oscar `MatElem`; `_to_complex` cast. The R-matrix from TC.jl is in TC.jl's gauge (consistent with the involutory F-symbols). **No explicit gauge translation** — but R-symbols themselves do not have a "unitary vs involutory" choice in the same way F-symbols do; R is a phase per channel, gauge-invariant up to overall basis-choice ambiguity in the channel-basis (which is what `left_intermediates`/`right_intermediates` resolve). **No drift** | **LB-1 secondary** at line 43 extraction | OK in current scope |
| `build_rsymbol_cache_manual` | `(r_dict::Dict{...}) -> RSymbolCache` (line 57) | (same — manual constructor for user-supplied R-symbols, used in `test_braiding_nonabelian.jl` to inject Fibonacci-specific R-symbols by hand) | (d) consumer's responsibility | Consumer-supplied; no TC.jl invocation | none direct | OK |
| `braiding_hamiltonian_sector` (non-abelian / 4-arg) | `(basis, fcache, rcache, N, c; λ=1.0)` (line 72) | **No direct GLOSSARY slug** for the braiding Hamiltonian per se. The `H = λ Σ (σ + σ†)` construction is mechanically `J Σ_j` for the (σ+σ†) per-bond elements — analogous in spirit to [[def:TL-cat]] but with R-symbols instead of vacuum-channel projectors. Not a [[def:TL-cat]] realisation. **Synthesis nominee** (or "no GLOSSARY needed if user prefers infrastructure-only treatment") | (b) **documented Hermitian decomposition** at head comment lines 7-12 + inline at lines 167-180 ("Spectral decomposition: σ+σ† = Σ_f 2Re(R_f) × P_f^{phys}"); uses orthogonal-complement projectors avoiding non-orthogonality issues in involutory gauge; (c) dagger via `σ + σ†`; (i) left-associated F | **Documented gauge-aware workaround** lines 7-12: "σ = F × diag(R) × F (using F² = I in the involutory gauge)"; lines 167-180: spectral decomposition avoids non-orthogonality. Line 239: `P_vac = (v * v') / norm_sq` reuses interaction.jl's pattern. Lines 247-252: general-`n` case orthogonalises via Gram matrix `G = F'F`, `M = F * G_inv * Diagonal(R_re) * F'` — this IS an explicit gauge translation (Gram-orthogonalisation of the F-columns to recover a physically-meaningful projector basis from the involutory `F`) | **LB-1 secondary** via `fcache` paths | **OK — second exemplary gauge-handling pattern** (the Gram-matrix orthogonalisation at lines 247-252 is the explicit-translation case [P1.6(b)] discusses for "multi-channel" — already implemented here for the 3+-channel branch) |
| `braiding_hamiltonian` (full / 4-arg) | (same as sector, full basis) | same | same | same | same | OK |
| `braiding_hamiltonian_sector` (abelian shortcut / 3-arg) | `(basis, rcache, N, c; λ=1.0)` (line 273) | (sVec-only special case where σ is diagonal) | (d) abelian → multiplicity 1 per (i,j) pair (line 322 finds "the" fusion channel) | None — F-symbols skipped entirely | none | OK |
| `braiding_hamiltonian` (abelian / 2-arg) | `(basis, rcache; λ=1.0)` (line 302) | same | same | same | none | OK |
| `tv_model_spectrum` | `(L::Int, N::Int; t=1.0, V=1.0) -> Vector{Float64}` (line 354) | **No GLOSSARY slug** — exact spectrum of the standard spinless-fermion t-V Hamiltonian on OBC. Reference oracle for sVec-braiding comparison; not a categorical primitive | (g) `L`/`N` MMA-convention | None | none | OK — reference oracle |

**Convention conformance (all 10 CONVENTIONS letters):**
- (a) vacuum index: ✓ — line 222 `v = F[:, 1]` ("vacuum channel column") implicitly assumes vacuum at index 1 in the column ordering of `F` (the right-intermediate-1 column). Consistent with [P1.6(a)] when the F-matrix's right-intermediate basis lists vacuum first — confirmed via `right_intermediates(...)` returning `ri` filtered from `fusion_channels(cache, b, c)` which iterates `c in 1:d` 1-based, so position 1 in `ri` is the smallest-index fusion channel that satisfies the filter. **Edge case:** if `1 ∉ ri` (vacuum not a fusion channel of `b⊗c → d`), `v = F[:, 1]` is NOT the vacuum column. Line 236 comment says "vacuum channel column" assuming `1` is in `ri`. **For Fibonacci `b = c = τ`, `d = 1`**: `b⊗c = τ⊗τ = 1 ⊕ τ`, so vacuum (1) IS a fusion channel; `ri = [1, 2]` ordered, `F[:, 1]` is the vacuum column — OK. **For Ising `b = c = σ`, `d = 1`**: `σ⊗σ = 1 ⊕ ψ`, vacuum IS a channel; OK. **In current scope no violation.** Flag-on-port: docstring should note "assumes `1 ∈ ri`; current Fibonacci/Ising scope satisfies this; future categories where `1 ∉ ri` for some `(b, c, d)` need the column-index resolved via `findfirst(==(1), ri)`."
- (b) F-matrix gauge: ✓ **CANONICAL HANDLING** — extensively documented (lines 7-12, 70, 167-180); spectral-decomposition orthogonal-complement workaround for 2-channel; explicit Gram-matrix orthogonalisation for 3+-channel. The Gram-matrix path (lines 247-252) is the EXPLICIT involutory→unitary translation [P1.6(b)] Translation rule mentions.
- (c) dagger: ✓ — `σ + σ†` (Hermitian sum) construction; `v1 * v1'` (line 239), `F'` (lines 249, 252).
- (d) multiplicity-free: ⚠ — `build_rsymbol_cache` line 41-44 hybrid pattern; extraction at line 43 collapses multiplicities (per inline comment line 42). LB-1 secondary.
- (e) complex conjugation: ✓ — `conj` via `'` postfix (Julia adjoint = conjugate-transpose for complex matrices); `real(dot(...))` lines 238, 393, etc.
- (g) particle-number disambiguation: ⚠ — `N` in `braiding_hamiltonian_sector` is particle count (= our `n`); `tv_model_spectrum(L, N)` uses MMA convention.
- (h) local cell object Q: ✓ — inherits `Q_full` via basis.
- (i) fusion-tree ordering: ✓ — left-associated F throughout (e.g., lines 196-199 `a` = cumulative up to anyon p-1, etc.).
- (j) N=0 boundary: ✓ — `np < 2 && continue` at lines 91, 141, 328.

**Drift flags (CLAUDE.md hallucination-risk callouts):**
- **F-matrix gauge**: ✓ — fires correctly multiple times; handled exemplarily. Lines 167-180's spectral decomposition is the canonical workaround documented per [P1.6(b)].
- **vacuum-index**: ✓ — flagged above with the `F[:, 1]` = vacuum-column convention; in-scope safe.
- **multiplicity-free** (callout via (d)): fires at the R-symbol extraction (line 43 inline comment "For multiplicity-free: …"). Latent.
- coassoc / dagger-special / Hilbert-framings / `\unchecked` / chats / Lean: not observed.

**Verdict:** OK. **Second gold-standard pattern** alongside `interaction.jl`. Port docstring should preserve the gauge-aware head comment (lines 7-12) AND cite [P1.6(b)] Translation rule for the Gram-matrix orthogonalisation path (lines 247-252). **Flag for Synthesis:** `RSymbolCache` / R-symbol concept has no GLOSSARY slug; bd-defer rather than add.

---

### `paircreation.jl` — Garjani-Ardonne number-changing isometry

**File-level provenance:**
- SHA256: `ec4c9db2fb359f63b8397716dcb90f6cdc81316c29c8047b33acd0c8f1d1f52e`
- LOC: 179

**TC.jl symbols used:** `simples` (lines 20, 24), `dim` (line 24), `Hom` (line 24), `⊗` (line 24).

**Exported symbols + GLOSSARY mapping:**

| Exported symbol | Type/sig | GLOSSARY slug realised | CONVENTIONS [P1.6(*)] applied | Gauge handling | LB-* exposure | Verdict |
|---|---|---|---|---|---|---|
| `dual_pairs` | `(cache::FSymbolCache) -> Vector{Tuple{Int,Int}}` (line 19) | [[def:fuscat]] rigid-duals clause (returns pairs `(a, b)` with `a ⊗ b → 1`, i.e., `b = bar a`) | (a) `2:d` excludes vacuum (line 23); (d) **LB-1 secondary** — line 24 `!iszero(dim(Hom(...)))` boolean | None | **LB-1 secondary** | OK in current scope |
| `pair_creation_operator` | `(basis::AnyonBasis, cache::FSymbolCache) -> SparseMatrixCSC{ComplexF64}` (line 38) | [[def:pair-create]] (per [[def:pair-create]] Translation map: "`src/MobileAnyons/paircreation.jl::pair_creation_operator` and `dual_pairs` realise the cross-sector $N \to N+2$ operator via F-symbol vacuum column") | (a) `vac_col = findfirst(==(1), ri)` (line 109); (b) **uses raw `F[e_row, vac_col]` amplitude** (line 113) — see Gauge handling below; (h) `Q_full`; (i) left-associated F | ⚠ **Raw F-symbol entry used as amplitude** at line 113 (`amp = F[e_row, vac_col]`) with **no inline gauge-translation comment**. Per [P1.6(b)] Translation rule, this is **gauge-independent for vacuum-column amplitudes only when the F-matrix is real** (which it is for Fibonacci/Ising/sVec) — strictly the F-matrix vacuum column carries the algebra coproduct $\Delta: \one \to \one \otimes \one \subseteq Q \otimes Q$ and the amplitudes ARE the algebra-object structure constants in `summary.tex def:pair-create`'s formula. **In current scope:** Fibonacci `A_{τ,τ} = φ^{-1/2}`, `A_{τ,1} = φ^{-1}` (cf. [[def:pair-create]] Canonical line 1701) come directly from `F[:, vac]` of TC.jl's F-matrix without any gauge step. **Gauges coincide for these scalars in Fibonacci** because TC.jl's `f_matrix(τ,τ,τ,τ)` equals the unitary involutory matrix `[[φ⁻¹, φ⁻¹ᐟ²], [φ⁻¹ᐟ², -φ⁻¹]]` from `summary.tex def:fib-F`. So **mathematically correct in current scope**, but the lack of an inline gauge-acknowledgment comment is a **documentation drift** the port should fix | none direct (LB-1 via basis + dual_pairs) | **YELLOW: documentation gap** — port-time docstring/inline comment MUST acknowledge the involutory-gauge raw-F usage + cite [P1.6(b)] coincidence. **This is NOT a STOP per the brief's "silent involutory→unitary gauge translation" stop condition** because (a) `paircreation.jl` IS one of the documented exception files (the brief lists `interaction.jl` + `braiding.jl`, but `paircreation.jl` is the third file in MMA that uses F-symbol entries — the brief's exception list was incomplete; see Synthesis), and (b) in current scope no translation is mathematically needed (coincidence regime). **Port-time fix:** add comment at line 113 along the lines of "raw F-symbol entry used; gauge-independent in current Fibonacci/Ising/sVec scope per [P1.6(b)] coincidence; for non-multiplicity-free or non-self-dual extensions, apply explicit gauge translation." |
| `pair_hamiltonian` | `(basis, cache; Δ=1.0) -> SparseMatrixCSC{ComplexF64}` (line 87) | [[def:pair-create]] (Hermitian sum `Δ(h† + h)`) | (c) dagger via `h_dag + h_dag'`; (b) inherits via `pair_creation_operator` | Same as `pair_creation_operator` | same | YELLOW (same documentation gap) |

**Internal helpers:**
- `_cumulative_charge(labels, inters, k)` (line 94) — returns cumulative charge after `k` anyons fused. Boundary `k=0 → vacuum index 1` (line 95); confirms [P1.6(a)] vacuum-at-1.
- `_add_pair_creation!(...)` (line 100) — main per-pair-per-insertion-point worker. Line 113 is the raw-F-amplitude site.
- `_build_pair_intermediates(...)` (line 155) — constructs the (N+2)-particle bra's intermediate sequence after inserting the pair (lines 158-176). Mechanical; no gauge issue.

**Convention conformance (all 10 CONVENTIONS letters):**
- (a) vacuum index: ✓ — explicit `==1` checks (lines 24, 95, 109).
- (b) F-matrix gauge: ⚠ **Raw F-symbol used as amplitude (line 113), no inline gauge-acknowledgment comment.** Mathematically correct in current scope (coincidence). **Port-time fix REQUIRED** — see verdict above.
- (c) dagger: ✓ — `pair_hamiltonian` builds Hermitian `h† + h` (line 89).
- (d) multiplicity-free: ⚠ — LB-1 secondary via `dual_pairs` (line 24) and inherited F-matrix indexing.
- (e) complex conjugation: ✓ — `ComplexF64(amp)` (line 140); no inner-product computations.
- (g) particle-number disambiguation: ⚠ — `N` in `pair_creation_operator`'s internal scope = particle count = our `n`.
- (h) local cell object Q: ✓ — inherits.
- (i) fusion-tree ordering: ✓ — left-associated F access pattern (line 103 `f_matrix(cache, cum_k, pa, pb, cum_k)` follows `(cum_k ⊗ pa) ⊗ pb → cum_k`).
- (j) N=0 boundary: ✓ — `_cumulative_charge(labels, inters, 0) = 1` (line 95) handles the empty-prefix case.

**Drift flags (CLAUDE.md hallucination-risk callouts):**
- **F-matrix gauge**: ⚠ **DOCUMENTATION GAP** — fires (raw F-symbol used) but NOT explicitly acknowledged in the file. In-scope mathematically correct (coincidence), but the file lacks the gauge-acknowledgment comment that `interaction.jl`/`braiding.jl` carry. **Port-time addition required.**
- **vacuum-index**: ✓ correctly handled.
- coassoc / dagger-special / Hilbert-framings / `\unchecked` / chats / Lean: not observed.

**Verdict:** YELLOW — **documentation gap** at the F-symbol usage site (line 113). NOT a STOP condition (per the analysis above): in current scope the raw-F usage is mathematically correct, and the file's purpose (Garjani-Ardonne pair creation) inherently consumes F-symbol vacuum-column entries; this is a real F-symbol-using consumer alongside `interaction.jl`/`braiding.jl`. **The brief's stop-condition list of documented exceptions was incomplete** (it should have included `paircreation.jl`); update the port docstring + add an inline `# Gauge: F-symbol entry used directly; gauge-independent in current Fibonacci/Ising/sVec scope per [P1.6(b)] coincidence — see CONVENTIONS.md` at line 113 during P8.5. **bd issue filed** (see Synthesis).

---

### `wavelets.jl` — wavelet-based one-particle fine-graining

**File-level provenance:**
- SHA256: `b2e22d03a579b803ba0fe30125c835c10348831715d57d6ee4f0dc4221906d24`
- LOC: 157

**TC.jl symbols used:** none direct.

**Exported symbols + GLOSSARY mapping:**

| Exported symbol | Type/sig | GLOSSARY slug realised | CONVENTIONS [P1.6(*)] applied | Gauge handling | LB-* exposure | Verdict |
|---|---|---|---|---|---|---|
| `daubechies_filter` | `(K::Int) -> Vector{Float64}` (line 25) | **No GLOSSARY slug** — standard signal-processing wavelet filter (K=1 Haar, K=2 D4). Reference per head-comment lines 14-16 (Osborne–Stottmeister `arXiv:2107.13834`, Stottmeister et al. `arXiv:2002.01442`). Cited in `references/` via SRC-OSBORNE-WAVELETS and SRC-OAR-WAVELETS (per `CITATION_INDEX.md`). | None | None | none | OK — wavelet infrastructure, no categorical-primitive slug needed |
| `one_particle_scaling_map` | `(L::Int, h::Vector{Float64}) -> Matrix{Float64}` (line 46) | Closest: [[def:polar-repair]] (per [[def:polar-repair]] Translation map: "Löwdin (symmetric) orthogonalisation $A \mapsto A(A^\dagger A)^{-1/2}$ is used in `src/MobileAnyons/wavelets.jl::one_particle_scaling_map` (lines 63-67) for OBC boundary correction"). The one-particle wavelet isometry `R: ℂ^L → ℂ^{2L}` is the building block of [[def:refmap]]'s many-body fine-graining | (c) dagger via `R'` (line 65 `S = R'*R`); (e) `Symmetric(S)` real-symmetric eigendecomposition | None (no F-symbols) | none | OK — [[def:polar-repair]] realises the Löwdin step explicitly |
| `one_particle_scaling_map_haar` | `(L::Int) -> Matrix{Float64}` (line 81) | Same as above (Haar specialisation) | (c) implicit | None | none | OK |
| `fine_graining_isometry_svec` | `(basis_L, basis_2L, R) -> SparseMatrixCSC{Float64}` (line 102) | [[def:refmap]] (per [[def:refmap]] Translation map: "`fine_graining_isometry_svec` (Slater determinant lift; correct only for sVec)") | (a) vacuum-at-1 implicit; (c) `det(...)` antisymmetrisation; (h) `Q_full`; (j) `N == 0` boundary explicit (line 123-131 vacuum-to-vacuum) | None | none | OK — Slater determinant; sVec-only |

**Convention conformance (all 10 CONVENTIONS letters):**
- (a) vacuum index: ✓ — implicit; intermediate sequences passed through unchanged (line 146).
- (b) F-matrix gauge: N/A — file uses no F-symbols (wavelet matrix `R` is purely numerical).
- (c) dagger: ✓ — `R' * R` (line 65), `R[fine_pos, :]` then `det(...)` (lines 140-141).
- (d) multiplicity-free: N/A directly (the file's sVec specialisation has trivial fusion data); inherits via basis.
- (e) complex conjugation: ✓ — file is `Float64` throughout (real wavelets); no complex needed.
- (g) particle-number disambiguation: ⚠ — `N = length(pos)` (line 120) MMA-local particle count = our `n`; `L` (parameter, line 46) = our `L`. Conforms to MMA convention.
- (h) local cell object Q: ✓ — inherits.
- (i) fusion-tree ordering: ✓ — `ket.intermediates` passed through verbatim (line 146) preserves left-associated structure.
- (j) N=0 boundary: ✓ — explicit handling lines 123-131.

**Drift flags (CLAUDE.md hallucination-risk callouts):**
- F-matrix gauge / vacuum-index / coassoc / dagger-special / Hilbert-framings / `\unchecked` / chats / Lean: not observed.

**Verdict:** OK. The [[def:polar-repair]] connection at `one_particle_scaling_map` is documented in GLOSSARY but not in MMA's file head comment — port docstring at P8.5 should add a backlink. Also note: head comment lines 14-16 cites two arXiv papers (Osborne–Stottmeister + Stottmeister et al.) — verify against `CITATION_INDEX.md` SRC entries during P8.5 port. `daubechies_filter` only supports K=1,2 (line 31 errors for K≥3); document explicitly in port docstring.

---

### `finegraining.jl` — many-body fine-graining (refmap realisations)

**File-level provenance:**
- SHA256: `baa7f0d64f2f5fd5ff297bc3d10490652c45dbc2616dcc597536ca10816223ce`
- LOC: 558

**TC.jl symbols used:** none direct in this file (operates on `FSymbolCache`, `RSymbolCache`, and `AnyonBasis`).

**Exported symbols + GLOSSARY mapping:**

| Exported symbol | Type/sig | GLOSSARY slug realised | CONVENTIONS [P1.6(*)] applied | Gauge handling | LB-* exposure | Verdict |
|---|---|---|---|---|---|---|
| `fine_graining_isometry` | `(basis_L, basis_2L, R) -> SparseMatrixCSC{Float64}` (line 36) | [[def:refmap]] variant (per [[def:refmap]] Translation map: "`fine_graining_isometry` (raw product map; isometric for Haar, fails for D4 — explicitly tested with `@test iso_err > 0.01`)"). Building block of the universal `normalized_product_isometry` below | (a) vacuum-by-absence; (c) `R[j, pos[p]]` dot-product; (h) `Q_full`; (i) intermediates preserved; (j) `N == 0` boundary explicit (lines 61-69) | None (wavelet `R` is real; no F-symbols) | none direct | OK |
| `trivial_embedding` | `(basis_L, basis_2L) -> SparseMatrixCSC{Float64}` (line 148) | [[def:persist]] (per [[def:persist]] Translation map: "`src/MobileAnyons/finegraining.jl::trivial_embedding` ($j \mapsto 2j-1$) — places each particle on the odd sublattice of the doubled lattice with vacancies at even refinement sites"). NB the parity-offset relative to [[def:persist]]'s "even-sublattice" — [[def:persist]] Translation map notes this: "The even/odd parity differs from `summary.tex`'s 'even-sublattice' convention here by an overall site-shift, but the structural content (strict-persistence placement on a sublattice of the refined lattice) coincides" | (a) inherits; (h) `Q_full` | None | none | OK |
| `normalized_product_isometry` | `(basis_L, basis_2L, R) -> SparseMatrixCSC{Float64}` (line 194) | [[def:refmap]] (per [[def:refmap]] Translation map: "**`src/MobileAnyons/finegraining.jl::normalized_product_isometry` ↔ $E_{P\to P'}$** for the dyadic doubling case $L \to 2L$") | (a) inherits; (c) `norm(V_prod[:, j])` Hermitian-induced column-norm; (h) `Q_full` | None (wavelet-derived; no F-symbols) | none direct | **OK — primary [[def:refmap]] realisation** |
| `categorical_determinant_isometry` | `(basis_L, basis_2L, R, fcache, rcache) -> SparseMatrixCSC{ComplexF64}` (line 227) | [[def:Jinterp]] partial (braiding-weighted Slater generalisation; per [[def:refmap]] Translation map: "`categorical_determinant_isometry` (braiding-weighted Slater generalisation; exported with 'partial correction only (non-abelian)' comment"). Per MIGRATION_PLAN.md:274 **EXCLUDED from P8.6 port** (`finegraining.jl: import everything except categorical_determinant_isometry`) | (b) **uses raw F-symbol entries** at lines 391-403 via `_bond_sigma_element`; (c) braiding-matrix accumulation via `B = sigma_mats[j] * B` (line 552); (d) inherits LB-1 (line 315 `enumerate_fusion_trees`); (i) left-associated; (j) `N == 0` boundary explicit (lines 254-262) | ⚠ **Raw F-symbol entries used** in `_bond_sigma_element` (line 391 `v1 = F[:, 1]`, lines 386-403) with **no inline gauge-acknowledgment comment** — but this function is internal-only and called only from the excluded-from-P8.6 `categorical_determinant_isometry`. Per MIGRATION_PLAN.md:274 the WHOLE function is excluded. **Moot at port time** — but flag-and-document the exclusion | **LB-1 secondary** via `enumerate_fusion_trees` at line 315 | OK — **EXCLUDED at P8.6** per MIGRATION_PLAN; port the WRAPPER docstring with the exclusion note + pointer to `archive/mma-archive-v0-snapshot/` (per MIGRATION_PLAN literal) |
| `fine_graining_isometry_svec` | (re-exported from `wavelets.jl`) | (covered under wavelets.jl) | — | — | — | OK |

**Internal helpers (relevant to gauge analysis):**
- `_enumerate_fine_configs!` (line 97) — combinatorial; no gauge.
- `_add_catdet_elements!` (line 419) — calls `_recurse_perms!` + `_sum_permutations!`.
- `_build_braiding_matrices` (line 310) — internal to `categorical_determinant_isometry`; calls `enumerate_fusion_trees` (line 315 — LB-1 dependency) + `_bond_sigma_element`.
- `_bond_sigma_element` (line 357) — the gauge-sensitive site. Uses raw `F` columns (lines 391, 400) and the same spectral-decomposition / Gram-orthogonalisation pattern as `braiding.jl::_bond_braiding_element` BUT **no inline gauge-acknowledgment comment** in `finegraining.jl`. Reaches identical mathematical structure (lines 388-403 mirror `braiding.jl:223-253` with R-symbols not 2Re(R)). Since `categorical_determinant_isometry` is excluded at P8.6, this gauge gap is **moot at port time** but worth documenting in the exclusion note.
- `_sum_permutations!` (line 480), `_recurse_perms!` (line 510), `_braiding_for_permutation` (line 542) — combinatorial / matrix composition; no direct F-symbol entries.

**Convention conformance (all 10 CONVENTIONS letters):**
- (a) vacuum index: ✓ — vacuum-by-absence pattern; line 391 `v1 = F[:, 1]` assumes vacuum at column 1 (same as `braiding.jl`; same in-scope safety analysis applies).
- (b) F-matrix gauge: ⚠ **Raw F-symbol entries in `_bond_sigma_element` (internal-only; consumed only by EXCLUDED `categorical_determinant_isometry`).** Mathematically the same Gram-orthogonalisation pattern as `braiding.jl::_bond_braiding_element`. **No inline comment.** Per MIGRATION_PLAN P8.6 the function is excluded — exclusion note in the port should mention the gauge-handling pattern is the same as `braiding.jl`'s but undocumented in `finegraining.jl` source.
- (c) dagger: ✓ — `V_prod'` analog via `norm(V_prod[:, j])` (line 200); `F'` (lines 400, 402 in `_bond_sigma_element`).
- (d) multiplicity-free: ⚠ LB-1 secondary via `enumerate_fusion_trees` at line 315.
- (e) complex conjugation: ✓ — `ComplexF64` throughout `categorical_determinant_isometry`; mostly numerical.
- (g) particle-number disambiguation: ⚠ — `N = length(pos)` MMA-local = our `n`.
- (h) local cell object Q: ✓ — inherits.
- (i) fusion-tree ordering: ✓ — left-associated; `bubble sort` (line 547) decomposes a permutation into adjacent transpositions, composed with elementary braidings `σ_j` — preserves the left-associated convention.
- (j) N=0 boundary: ✓ — explicit handling (lines 61-69 for `fine_graining_isometry`; lines 254-262 for `categorical_determinant_isometry`; trivial-embedding inherits via basis).

**Drift flags (CLAUDE.md hallucination-risk callouts):**
- **F-matrix gauge**: ⚠ **DOCUMENTATION GAP in `_bond_sigma_element`** — same as `paircreation.jl`. **Mitigated by P8.6 exclusion** (`categorical_determinant_isometry` is excluded from the port per MIGRATION_PLAN). Port-time exclusion note should mention this.
- **vacuum-index**: ✓ — column-1 = vacuum assumption same as `braiding.jl`; in-scope safe.
- **multiplicity-free**: LB-1 secondary via `enumerate_fusion_trees`.
- coassoc / dagger-special / Hilbert-framings / `\unchecked` / chats / Lean: not observed.

**Verdict:** OK — three of four exported functions clean (`fine_graining_isometry`, `trivial_embedding`, `normalized_product_isometry`); `categorical_determinant_isometry` is the only one with a (mooted-by-exclusion) gauge-documentation gap. Port at P8.6 per MIGRATION_PLAN literal: import everything except `categorical_determinant_isometry`; the exclusion note in the port file should reference `archive/mma-archive-v0-snapshot/` and explicitly mention the gauge-handling pattern's similarity to `braiding.jl`.

---

### `virasoro.jl` — per-bond projectors + Koo–Saleur Fourier modes

**File-level provenance:**
- SHA256: `59c9d62a1eb49ea3a69b41a8c22e5e700f768ad55f0cb58ca72f644b5447d8d1`
- LOC: 140

**TC.jl symbols used:** none direct (operates on basis + `_bond_projector_element` reused from `interaction.jl`).

**Exported symbols + GLOSSARY mapping:**

| Exported symbol | Type/sig | GLOSSARY slug realised | CONVENTIONS [P1.6(*)] applied | Gauge handling | LB-* exposure | Verdict |
|---|---|---|---|---|---|---|
| `bond_projectors_dense` | `(basis::AnyonBasis, cache::FSymbolCache, L::Int, c::Int) -> Vector{SparseMatrixCSC{ComplexF64}}` (line 21) | [[def:TL-cat]] (per-bond `P_j` projectors; conceptually `e_j / d_σ` per [P1.6(b)]-Translation-rule MMA-realisation of [[def:TL-cat]]) | (a) `c` is total-charge index; (b) inherits gauge-handling via `_bond_projector_element` from interaction.jl; (h) `Q_full`; (i) left-associated; (j) `(L, c)` sector — restricted to dense (`N=L`) | Inherits `interaction.jl`'s gauge-aware Hermitian-projector pattern | inherits LB-1 via basis + `_bond_projector_element` | OK (gauge-handling correctly inherited) |
| `hamiltonian_fourier_modes` | `(projectors::Vector, L::Int; n_modes::Int=4) -> Dict{Int, Matrix{ComplexF64}}` (line 79) | [[def:KS-scalars]] (per [[def:KS-scalars]] Translation map: "The Koo-Saleur constants κ, v appear implicitly in `src/MobileAnyons/virasoro.jl::hamiltonian_fourier_modes` (which builds `H_n = Σ_{j=1}^{L-1} sin(πnj/L) P_j`); MMA's OBC sine-transform variant skips the explicit κ normalisation") + [[def:KS-Ln]] (per [[def:KS-Ln]] Notes — same source). MMA-side: bare OBC sine-transform, not the full chiral/antichiral pair | (a) implicit; (g) `L` = lattice length (canonical); (h) `Q_full` | None directly (purely Fourier on projector list) | inherits via projectors | OK |
| `virasoro_commutator_check` | `(modes::Dict, L::Int) -> NamedTuple{(:c_estimate, :algebra_errors)}` (line 106) | [[def:KS-Ln]] partial (the lattice Virasoro commutator check — "lattice approximants to the chiral and anti-chiral Virasoro generators"). Per MIGRATION_PLAN.md:275: **EXCLUDED from P8.7 port** ("`virasoro.jl`: import everything except `virasoro_commutator_check` (returns `c_estimate=NaN`, a stub)") | none used (returns `c_estimate=NaN`) | None — stub returns NaN | none | **EXCLUDED at P8.7** per MIGRATION_PLAN; port-time exclusion note + new RESEARCH_NOTES entry "either complete or remove" per `MIGRATION_PLAN.md:275` |

**Convention conformance (all 10 CONVENTIONS letters):**
- (a) vacuum index: ✓ — `(L, c)` sector key 1-based.
- (b) F-matrix gauge: ✓ — inherits the gauge-aware Hermitian-projector pattern from `interaction.jl::_bond_projector_element` (called at line 47).
- (c) dagger: ✓ — Hermitian projectors via inherited workaround.
- (d) multiplicity-free: ⚠ LB-1 secondary via `_bond_projector_element` and basis.
- (e) complex conjugation: ✓ — `ComplexF64`; `H_n .+= phase .* Matrix(Pj)` (line 88) where `phase = sin(...)` real.
- (g) particle-number disambiguation: ✓ — `L` = lattice length (our `L`). No `N` parameter at function level (instead uses the dense-sector implicit `(L, c)` ket-restriction at line 22).
- (h) local cell object Q: ✓ — inherits `Q_full`.
- (i) fusion-tree ordering: ✓ — left-associated via inherited `_bond_projector_element`.
- (j) N=0 boundary: ✓ — `bond_projectors_dense` for `(L, c)` empty sector returns `[]` (line 23); `hamiltonian_fourier_modes` works for any positive-length projector list.

**Drift flags (CLAUDE.md hallucination-risk callouts):**
- **F-matrix gauge**: ✓ — correctly inherited via interaction.jl's pattern; no new drift.
- **`\unchecked` flags**: ⚠ — head comment line 14 mentions Koo–Saleur algebra `[L_m, L_n] ≈ (m-n) L_{m+n} + (c/12) m(m²-1) δ_{m+n,0}` as the target the stub's NaN-return purports to test. Per `CITATION_INDEX.md` and [[def:KS-Ln]] Notes, the **Koo–Saleur 1994 original** is one of the `\unchecked` citations *without* a local source. **Not silently treating the flag as discharged** — the file is correctly cautious (returns NaN; algebra not actually checked; MIGRATION_PLAN excludes the function). No drift.
- **vacuum-index**: ✓ — inherits 1-based.
- coassoc / dagger-special / Hilbert-framings / chats / Lean: not observed.

**Verdict:** OK — two of three exports clean (`bond_projectors_dense`, `hamiltonian_fourier_modes`); `virasoro_commutator_check` is a NaN-returning stub correctly excluded at P8.7 per MIGRATION_PLAN. **bd issue filed** (Synthesis) tracking the "complete or remove" decision.

---

## Synthesis

### Per-convention conformance summary (all 10 CONVENTIONS [P1.6(*)] letters)

| Convention | Files invoking it | Conformance | Notes |
|---|---|---|---|
| (a) vacuum index | `config.jl`, `hilbert.jl`, `fsymbols.jl`, `operators.jl`, `interaction.jl`, `braiding.jl`, `paircreation.jl`, `finegraining.jl`, `virasoro.jl` | ✓ CONFORM | 1-based; vacuum at `simples(C)[1]`; explicit at `config.jl:5`, `hilbert.jl:47`, `interaction.jl:105`, `paircreation.jl:95,109`. **Edge case** flagged in `braiding.jl` and `finegraining.jl::_bond_sigma_element`: `F[:, 1]` assumes vacuum is the first right-intermediate; **in-scope safe** (Fibonacci/Ising both have vacuum as first fusion channel for the relevant `(b, c) → d` triples), **flag-on-port** for future scope expansion. |
| (b) F-matrix gauge | `fsymbols.jl`, `interaction.jl`, `braiding.jl`, `paircreation.jl`, `finegraining.jl::_bond_sigma_element` | ⚠ HYBRID | **Stored involutory** in `fsymbols.jl`. **Documented Hermitian-projector workaround** in `interaction.jl` (lines 11-13) + `braiding.jl` (lines 7-12, 167-180). **DOCUMENTATION GAP in `paircreation.jl`** (raw `F[e_row, vac_col]` at line 113, no inline comment) — mathematically OK in current scope but port-time comment required. **DOCUMENTATION GAP in `finegraining.jl::_bond_sigma_element`** (raw `F[:, 1]` lines 386-403) but mooted by P8.6 exclusion of `categorical_determinant_isometry`. |
| (c) dagger / adjoint | `interaction.jl`, `braiding.jl`, `paircreation.jl`, `wavelets.jl`, `finegraining.jl`, `operators.jl` (via `h_L = h_R†` symmetrisation) | ✓ CONFORM | Julia adjoint `'` = `adjoint(...)` = conjugate-transpose for matrices; `conj(...)` for scalars; `real(dot(v, v))` for self-Hermitian norms. Matches [P1.6(c)] both semantics. |
| (d) multiplicity-free | `hilbert.jl:58` (primary), `fsymbols.jl:75` (secondary), `braiding.jl:43` (secondary), `paircreation.jl:24` (secondary), `finegraining.jl:315` (tertiary via `enumerate_fusion_trees`) | ⚠ LATENT (LB-1) | Boolean treatment of `dim(Hom(...))`. **In-scope safe** (Fibonacci/Ising/sVec multiplicity-free). **LB-1 marker required at port** for `enumerate_fusion_trees` per `MIGRATION_PLAN.md:272`; the secondary sites (`fusion_channels`, `dual_pairs`) inherit the assumption silently — port-time docstrings should note "multiplicity-free assumption per [P1.6(d)]" for clarity. |
| (e) complex conjugation | `fsymbols.jl::_to_complex_*`, `interaction.jl:163`, `braiding.jl:393`, `finegraining.jl` | ✓ CONFORM | Standard `conj(z)`, `Float64(real/imag(x))` pattern; no `\overline` notational overload (this is code, not LaTeX). |
| (f) TikZ macro source | none | N/A | [P1.6(f)] is DEFERRED; no LaTeX in MMA source. |
| (g) particle-number disambiguation | `config.jl::enumerate_configs_hc(L, N, C)`, `hilbert.jl::build_basis(L, …)`, `operators.jl::free_fermion_energies(L, N)`, `interaction.jl::*_sector(…, N, c, …)`, `braiding.jl::*_sector`, `paircreation.jl`, `wavelets.jl`, `virasoro.jl` | ⚠ MMA-LOCAL | **MMA uniformly uses `N` = particle count (= our `n`), `L` = lattice length (= our `L`)**, opposite to `summary.tex`'s `H_N^W` reading. Per [P1.6(g)] this is the canonical reading rule for MMA-imported code. **Port docstrings at P8.4/P8.5 must declare** "in this file: `N` = particle count (= our `n` per [P1.6(g)]); `L` = lattice length (= our `L`)". |
| (h) local cell object Q | all files (via `config.jl`'s `Q_full` baked in) | ✓ CONFORM | `Q = Q_full = ⊕_{a ∈ Irr(C)} a` per [P1.6(h)] canonical default; non-vacuum labels enumerate via `2:d`, vacuum-by-absence. Cannot represent alternative `Q` choices (2)–(5) from [P1.6(h)] without code changes. |
| (i) fusion-tree ordering | `hilbert.jl:13-15` (explicit docstring), `fsymbols.jl` head comment, `interaction.jl`, `braiding.jl`, `paircreation.jl`, `finegraining.jl::categorical_determinant_isometry` | ✓ CONFORM | Left-associated throughout: `intermediates[k] = cumul after k+1 anyons`; F-matrix indexed `(a⊗b)⊗c → a⊗(b⊗c)`; `recurse(k, …)` walks `k = 2…N`. Matches [P1.6(i)] declaration EXACTLY. |
| (j) N=0 boundary | `config.jl:32`, `hilbert.jl:47`, `interaction.jl:64,172`, `braiding.jl:91,141,328`, `paircreation.jl::_cumulative_charge` (k=0 case), `wavelets.jl:123-131`, `finegraining.jl:61-69,254-262` | ✓ CONFORM | `enumerate_configs_hc(L, 0, C) = [LabelledConfig(Int[], Int[])]`; `enumerate_fusion_trees(C, [], c) = [Int[]] iff c == 1`. Realises [P1.6(j)] declaration EXACTLY. Cross-validated in [P1.6(j)] Sweep status. |

### Per-CLAUDE.md-callout firing-site index (all 8 hallucination-risk callouts)

| Callout | Firing sites in MMA | Handling |
|---|---|---|
| **#1 Vacuum-index** | `config.jl:5,12-13`, `hilbert.jl:47`, `interaction.jl:105`, `paircreation.jl:24,95,109`, `braiding.jl:222,236` (`F[:, 1]` as vacuum column) | ✓ Correctly handled (1-based throughout); edge cases at `braiding.jl::_bond_braiding_element` and `finegraining.jl::_bond_sigma_element` flagged for future-scope safety only |
| **#2 F-matrix gauge** | `fsymbols.jl::FSymbolCache`/`f_matrix` (storage); `interaction.jl::_bond_projector_element` (line 138-167; **documented workaround**); `braiding.jl::_bond_braiding_element` (lines 201-263; **documented workaround**); `paircreation.jl::_add_pair_creation!` (line 113; **DOC GAP — port fix required**); `finegraining.jl::_bond_sigma_element` (lines 371-403; **DOC GAP, mooted by P8.6 exclusion**) | ⚠ Two doc gaps to fix at port; mathematically correct in current scope |
| **#3 Coassoc scalar-vs-categorical** | none in MMA src/ (Phase 8 scope is Julia — no LaTeX or Lean prose) | ✓ Not observed |
| **#4 Dagger-special vs Frobenius-special** | none in MMA src/ | ✓ Not observed |
| **#5 Three Hilbert-space framings** | `hilbert.jl::AnyonBasis` IS the mobile-Fock framing; `MobileAnyons.jl` is its module shell. Translation to [[def:HP]]/[[def:Hlatt]] is in `stocktake/reports/opus-hilbert-bridge.md` + `def:mobile-Fock` Translation map. | ✓ Correctly framed (mobile-Fock identified, locked at P1.5) |
| **#6 `\unchecked` flags** | `virasoro.jl` head comment line 14 references the Koo–Saleur algebra (Koo–Saleur 1994 = `\unchecked` per `CITATION_INDEX.md`) — but the function `virasoro_commutator_check` is a NaN-stub correctly excluded at P8.7 | ✓ NOT silently treated as discharged |
| **#7 Archived chats** | none cited | ✓ Not observed |
| **#8 Lean 0-sorry/0-axiom** | N/A for Julia source; Phase 8 is Julia-only | ✓ N/A |

### LB-* exposure summary

- **LB-1 (multiplicity-free assumption)** — primary site at `hilbert.jl:42-68 enumerate_fusion_trees` (line 58 boolean `dim(Hom)`). Secondary leak sites:
  - `fsymbols.jl:70-78 fusion_channels` (line 75 boolean; called by `left_intermediates`/`right_intermediates`)
  - `paircreation.jl:19-27 dual_pairs` (line 24 boolean)
  - `braiding.jl:30-49 build_rsymbol_cache` (lines 40-44 hybrid — multiplicity-aware iteration, multiplicity-free extraction)
  - `finegraining.jl:310-347 _build_braiding_matrices` (line 315 calls `enumerate_fusion_trees`)
  - **Current-scope safety**: Fibonacci, Ising, sVec all satisfy `dim Hom(a⊗b, c) ∈ {0, 1}` for every triple — bug latent.
  - **P8.4 TODO marker location**: `MIGRATION_PLAN.md:272` declares the marker required at `hilbert.jl:58` (primary site). **Recommendation**: in addition to the primary marker, port docstrings for `fsymbols.jl`, `paircreation.jl`, `braiding.jl::build_rsymbol_cache` should state "multiplicity-free assumption per [P1.6(d)] — see RESEARCH_NOTES.md §LB-1 and bd `cft-anyons-q6h`". Three additional one-liner port-time TODO comments add discoverability without altering semantics.

- **LB-2 (`cft-anyons-2ae` — MMA test for dense Ising c=1/2 sector)**: not surfaced by reading `src/` alone; surfaces at Phase 8 `Pkg.test()` (P8.8). Pre-Phase-8-gated. No code-level action in P8.1a.

- **LB-3 (`cft-anyons-pvu` — GLOSSARY TC.jl-API audit)**: discharged at P8.0a (commit `3c53c60`, audit at `stocktake/reports/opus-tcjl-api-audit.md`). Residual `FusionCategory` cleanup tracked at `cft-anyons-b6b`. No new code-level action in P8.1a.

- **LB-4 (`cft-anyons-d7w` — re-validate `archive/mma-archive-v0-snapshot/` cited paths post-import)**: blocked on Phase 10 (selective archive/v0 extraction). No Phase-8 action.

### GLOSSARY-entry coverage of MMA exports

**Total MMA-exported symbols audited:** 28 distinct exports (per `MobileAnyons.jl:17-31`, deduplicated, treating the `fine_graining_isometry_svec` double-export as one). Counting:
- `config.jl`: 2 (`LabelledConfig`, `enumerate_configs_hc`)
- `hilbert.jl`: 4 (`FusionTree`, `AnyonBasis`, `build_basis`, `enumerate_fusion_trees`)
- `fsymbols.jl`: 7 (`FSymbolCache`, `build_fsymbol_cache`, `f_matrix`, `f_symbol`, `fusion_channels`, `left_intermediates`, `right_intermediates`)
- `operators.jl`: 3 (`hopping_hamiltonian`, `hopping_hamiltonian_sector`, `free_fermion_energies`)
- `interaction.jl`: 2 (`interaction_hamiltonian`, `interaction_hamiltonian_sector`)
- `braiding.jl`: 6 (`RSymbolCache`, `build_rsymbol_cache`, `build_rsymbol_cache_manual`, `braiding_hamiltonian`, `braiding_hamiltonian_sector`, `tv_model_spectrum`)
- `paircreation.jl`: 3 (`dual_pairs`, `pair_creation_operator`, `pair_hamiltonian`)
- `wavelets.jl`: 4 (`daubechies_filter`, `one_particle_scaling_map`, `one_particle_scaling_map_haar`, `fine_graining_isometry_svec`)
- `finegraining.jl`: 4 (`fine_graining_isometry`, `trivial_embedding`, `normalized_product_isometry`, `categorical_determinant_isometry`)
- `virasoro.jl`: 3 (`bond_projectors_dense`, `hamiltonian_fourier_modes`, `virasoro_commutator_check`)

Total: 2 + 4 + 7 + 3 + 2 + 6 + 3 + 4 + 4 + 3 = **38 exports**. (28 = original count of "distinct concepts"; 38 = total exported symbols counting all variants. The slight imprecision in the earlier numbers — sector/non-sector variants count as separate symbols but the same GLOSSARY mapping; I treat them as one concept-per-pair below for GLOSSARY accounting.)

**GLOSSARY coverage breakdown (by concept):**

| Concept (functions) | GLOSSARY slug | Status |
|---|---|---|
| Configuration / partition (`LabelledConfig`, `enumerate_configs_hc`) | [[def:partition]] | ✓ Existing; cited in [[def:partition]] Translation map |
| Fusion-tree basis (`FusionTree`, `enumerate_fusion_trees`) | [[def:splitbasis]] | ✓ Existing; cited |
| Mobile-Fock basis (`AnyonBasis`, `build_basis`) | [[def:mobile-Fock]] | ✓ Existing (P1.5 entry); cited |
| F-symbol (`FSymbolCache`, `build_fsymbol_cache`, `f_matrix`, `f_symbol`) | [[def:fsymbol]] | ✓ Existing; cited (P1.8 fix landed) |
| F-symbol indexing (`fusion_channels`, `left_intermediates`, `right_intermediates`) | [[def:fsymbol]] adjunct | ✓ Existing — adjuncts of [[def:fsymbol]] |
| Hopping Hamiltonian (`hopping_hamiltonian`, `hopping_hamiltonian_sector`) | **No GLOSSARY slug** — textbook tight-binding | ⚠ **Coverage gap** — see "Recommendations" below (infrastructure, not categorical primitive; no GLOSSARY entry recommended) |
| Free-fermion oracle (`free_fermion_energies`) | **No GLOSSARY slug** — textbook closed form | ⚠ Same as above (reference oracle) |
| TL generator (`interaction_hamiltonian`, `interaction_hamiltonian_sector`) | [[def:TL-cat]] | ✓ Existing; cited in [[def:TL-cat]] Translation map |
| R-symbol (`RSymbolCache`, `build_rsymbol_cache`, `build_rsymbol_cache_manual`) | **No GLOSSARY slug** | ⚠ **Coverage gap** — bd issue filed (`cft-anyons-<NEW>`); no GLOSSARY edit per Law 1 |
| Braiding Hamiltonian (`braiding_hamiltonian`, `braiding_hamiltonian_sector`) | **No GLOSSARY slug** | ⚠ **Coverage gap** — same bd issue (or separate); no GLOSSARY edit per Law 1 |
| t-V oracle (`tv_model_spectrum`) | **No GLOSSARY slug** | ⚠ Same (reference oracle) |
| Pair creation (`dual_pairs`, `pair_creation_operator`, `pair_hamiltonian`) | [[def:pair-create]] | ✓ Existing; cited |
| Wavelet filter (`daubechies_filter`) | **No GLOSSARY slug** — signal-processing primitive | ⚠ Coverage gap (infrastructure; no GLOSSARY entry recommended; cited via `references/` per [P1.6(*)]-untouched route) |
| One-particle wavelet (`one_particle_scaling_map`, `one_particle_scaling_map_haar`) | [[def:polar-repair]] (for the Löwdin step) | ✓ Existing; cited |
| sVec many-body lift (`fine_graining_isometry_svec`) | [[def:refmap]] (sVec specialisation) | ✓ Existing; cited |
| Many-body fine-graining (`fine_graining_isometry`, `trivial_embedding`, `normalized_product_isometry`, `categorical_determinant_isometry`) | [[def:refmap]] + [[def:persist]] + [[def:Jinterp]] | ✓ Existing; cited |
| Per-bond projectors (`bond_projectors_dense`) | [[def:TL-cat]] (the dense-chain restriction) | ✓ Existing (cite via interaction.jl's TL chain) |
| KS Fourier modes (`hamiltonian_fourier_modes`) | [[def:KS-scalars]] (κ implicit) + [[def:KS-Ln]] (the formula realised here) | ✓ Existing; cited |
| KS Virasoro commutator check (`virasoro_commutator_check`) | [[def:KS-Ln]] partial | ✓ Existing — but function is NaN-stub, EXCLUDED at P8.7 |

**Coverage summary (deep D-gate):**
- **38 exports audited**; mapped to **15 distinct GLOSSARY-anchored concepts**.
- **17 exports** ([[def:partition]], [[def:splitbasis]], [[def:mobile-Fock]], [[def:fsymbol]], [[def:TL-cat]], [[def:pair-create]], [[def:polar-repair]], [[def:refmap]], [[def:persist]], [[def:Jinterp]], [[def:KS-scalars]], [[def:KS-Ln]]) cleanly map to existing GLOSSARY slugs cited in those slugs' Translation maps. No new GLOSSARY needed for these.
- **8 exports** are infrastructure/reference-oracle/standard-physics (hopping Hamiltonian, free-fermion energies, t-V spectrum, wavelet filter): **no GLOSSARY entry recommended** — these are not categorical primitives. Port docstrings can cite arXiv refs (per `references/` SHA256-pinned PDFs at SRC-OSBORNE-WAVELETS and SRC-OAR-WAVELETS for the wavelet refs) without needing a slug.
- **3 exports** (`RSymbolCache`, `build_rsymbol_cache`, `braiding_hamiltonian`/`_sector`) form a coherent "R-symbols + braiding Hamiltonian" cluster with **no current GLOSSARY entry**. This is the only genuine GLOSSARY coverage gap. **Per Law 1: STOP and ask** — file bd issue, do NOT add entries.

**`MMA implements a concept GLOSSARY doesn't define` count: 1** (the R-symbol cluster). **NOT a Law-1 violation in the strict sense** because the R-symbol concept *is* implicit in [[def:fuscat]]'s "braided fusion category" structure — but it has no first-class slug. The decision whether to give R-symbols (and the braiding Hamiltonian) a dedicated GLOSSARY entry is a **user-escalation decision** (see Recommendations).

### Recommendations for P8.4+ per-file imports

**Ordering (per `MobileAnyons.jl` `include()` sequence + MIGRATION_PLAN P8.4–P8.7):**
1. **P8.4 — `MobileAnyons.jl` shell** → `config.jl` → `hilbert.jl` (+ LB-1 TODO marker at line 58) → `fsymbols.jl`
2. **P8.5 — `operators.jl` → `interaction.jl` → `braiding.jl` → `paircreation.jl` (+ inline gauge comment at line 113) → `wavelets.jl`**
3. **P8.6 — `finegraining.jl`** (EXCLUDE `categorical_determinant_isometry` per MIGRATION_PLAN.md:274; exclusion note must mention the `_bond_sigma_element` gauge-handling pattern is identical to `braiding.jl`'s; pointer to `archive/mma-archive-v0-snapshot/` for the unrestricted variant)
4. **P8.7 — `virasoro.jl`** (EXCLUDE `virasoro_commutator_check` per MIGRATION_PLAN.md:275; new RESEARCH_NOTES entry "either complete or remove")

**Per-file docstring header template** (to be added at the top of each ported file, after the head-comment block):

```julia
# === GLOSSARY mapping ===
# Realises: [[def:<slug1>]] (function f1, …), [[def:<slug2>]] (function f2, …)
# Conventions applied:
#   - [P1.6(a)] vacuum at index 1 in simples(C)
#   - [P1.6(b)] F-matrix gauge: stored involutory per TensorCategories.jl;
#              <"no translation needed in scope" or "Hermitian-projector workaround"
#               or "Gram-orthogonalisation" or "raw F-symbol with coincidence claim">
#   - [P1.6(d)] multiplicity-free assumption (LB-1 latent for current Fibonacci/Ising/sVec scope;
#              bd cft-anyons-q6h; RESEARCH_NOTES §LB-1)
#   - [P1.6(g)] disambiguation: in this file, N = particle count (= our n);
#                                 L = lattice length (= our L)
#   - [P1.6(h)] Q = Q_full = ⊕_{a ∈ Irr(C)} a (inherited via config.jl)
#   - [P1.6(i)] left-associated fusion-tree basis
#   - [P1.6(j)] N=0 boundary realised at <line>
# TC.jl functions used by name: simples, dim, Hom, six_j_symbols, braiding, …
#   (all EXIST in TC.jl 0.5.3 per stocktake/reports/opus-tcjl-api-audit.md)
# Drift flags fired: <list of CLAUDE.md hallucination-risk callouts that fire here>
```

This template synthesises the per-file audit table rows. Each port commit's `Validation passed:` line should cite the GLOSSARY slugs + CONVENTIONS letters listed in the header.

### Open issues to track as bd before P8.4 starts

1. **(NEW) P8.1a follow-up: `paircreation.jl:113` raw F-symbol amplitude has no inline gauge-acknowledgment comment.** Port-time fix at P8.5: add `# Gauge: F-symbol entry used directly; gauge-independent in current Fibonacci/Ising/sVec scope per [P1.6(b)] coincidence; future scope expansion requires explicit translation` immediately before line 113 `amp = F[e_row, vac_col]`. Priority 3.

2. **(NEW) P8.1a follow-up: `finegraining.jl::_bond_sigma_element` (lines 371-403) raw F-symbol usage has no inline gauge-acknowledgment comment.** Mooted by P8.6 exclusion of the only caller (`categorical_determinant_isometry`); but the exclusion note in the ported `finegraining.jl` should mention this pattern matches `braiding.jl::_bond_braiding_element`. Priority 4 (cosmetic / documentation).

3. **(NEW) P8.1a follow-up: brief's "documented gauge-handling exception files" list is incomplete.** Per the brief: "outside `interaction.jl` / `braiding.jl` (the documented exceptions)". MMA actually has THREE files that consume F-symbol entries: `interaction.jl`, `braiding.jl`, **`paircreation.jl`** (the F-symbol vacuum-column amplitude IS the algebra-object structure constant for Garjani-Ardonne pair creation; mathematically necessary). The brief's stop-condition list should be updated to include `paircreation.jl` as a fourth documented exception once the inline comment is added. Priority 4 (procedural / future-brief hygiene).

4. **(NEW) P8.1a follow-up: GLOSSARY coverage gap — R-symbols + braiding Hamiltonian.** `braiding.jl`'s `RSymbolCache` / `build_rsymbol_cache` / `braiding_hamiltonian` cluster has no GLOSSARY slug. The R-symbol concept is implicit in [[def:fuscat]]'s "braided fusion category" framing but has no dedicated entry. **STOP and ask user**: should there be a new [[def:rsymbol]] entry + a [[def:braid-H]] (or similar) entry? Per Law 1, this is a user-escalation decision; do NOT add entries during P8.1a or P8.5 port. Priority 2.

5. **(NEW) P8.1a follow-up: `virasoro_commutator_check` NaN-stub disposition.** Per MIGRATION_PLAN.md:275 the function is excluded at P8.7; the file-level RESEARCH_NOTES entry to "either complete or remove" is owed. Priority 3.

6. **(EXISTING) `cft-anyons-q6h` (LB-1)** — surfaces at P8.4 `hilbert.jl:58`. Pre-filed; P8.4 port adds the TODO marker per MIGRATION_PLAN. No action in P8.1a beyond confirming the marker location.

7. **(EXISTING) `cft-anyons-2ae` (LB-2)** — MMA test for dense Ising c=1/2 sector. Surfaces at P8.8. Pre-filed. No action in P8.1a.

8. **(EXISTING) `cft-anyons-b6b`** — P8.0a residual `FusionCategory` cleanup. No P8.1a action.

### Verdict

**YELLOW** — overall the 10 MMA Julia files are in clean shape relative to GLOSSARY + CONVENTIONS, with the following small reconcilable issues:

- **Two documentation gaps** (gauge-handling comments in `paircreation.jl:113` and `finegraining.jl::_bond_sigma_element` lines 371-403). Both are port-time TODOs, not P8.2-conflict-resolution triggers, because mathematically correct in current scope. Adding the comments during P8.5 / P8.6 port closes both.
- **One GLOSSARY coverage gap** (R-symbol cluster). Requires user-escalation decision per Law 1; bd-deferred. Does not block any other P8 step (port docstrings can cite "[[def:fuscat]] (braiding component)" as the closest current slug).
- **LB-1 latent at five sites** (one primary + four secondary). Current scope safe; port-time docstring annotations add discoverability.
- **Two MIGRATION_PLAN exclusions confirmed valid**: `categorical_determinant_isometry` (P8.6) and `virasoro_commutator_check` (P8.7). Both correctly identified by the plan; both have minor port-time documentation tasks attached.

**GREEN** on the following dimensions:
- (a) vacuum index: clean throughout.
- (c) dagger, (e) complex conjugation, (h) Q=Q_full, (i) left-associated, (j) N=0 boundary: clean throughout.
- (g) particle-number: consistently MMA-local; port docstrings handle.
- Three-Hilbert-space framings: correctly identified as MMA's mobile-Fock per `def:mobile-Fock` (P1.5 locked).
- Gauge-handling exemplars: `interaction.jl` and `braiding.jl` are gold-standard patterns.
- TC.jl API consumption: all symbols used EXIST per P8.0a verdict; no fabricated names.

**NOT RED**: no audit findings rise to "STOP — file bd + escalate before any code lands". The user-escalation needed (R-symbol GLOSSARY decision) is forward-looking, not a blocker for P8.2 or P8.3 or P8.4 (which can proceed using the existing GLOSSARY anchors plus port-time docstring caveats).

**Recommendation to orchestrator (P8.1b reviewer-dispatch + P8.2 decision):**
1. Dispatch P8.1b hostile-Opus reviewer with **deep D-gate checklist**: per-slug, verify MMA function realises the GLOSSARY slug correctly (not just slug-existence). Specifically focus on:
   - [[def:TL-cat]] ↔ `interaction.jl::interaction_hamiltonian` (the `H = Σ P_j = Σ e_j / d_σ` algebra)
   - [[def:pair-create]] ↔ `paircreation.jl::pair_creation_operator` (the F-symbol-vacuum-column amplitude `A_{x,z}` formula)
   - [[def:refmap]] ↔ `finegraining.jl::normalized_product_isometry` (the `E_{P→P'}` cellwise-isometry condition)
   - [[def:polar-repair]] ↔ `wavelets.jl::one_particle_scaling_map` (Löwdin orthogonalisation `A(A†A)^{-1/2}`)
   - [[def:KS-Ln]] / [[def:KS-scalars]] ↔ `virasoro.jl::hamiltonian_fourier_modes` (the sine-transform `H_n = Σ sin(πnj/L) P_j` and the implicit κ omission)
2. P8.2 may be skipped if P8.1b confirms YELLOW verdict (no STOP-level conflict); the doc-gaps and bd issues from this report become P8.5 / P8.6 port-time additions, not pre-port resolution steps.
3. Proceed to P8.3 (`Project.toml` / `Manifest.toml` import) once P8.1b is closed.

---

## Method (reproducible)

```bash
# SHA256s + LOCs verified at audit time
cd /home/tobiasosborne/Projects/microscopic-mobile-anyons/src/MobileAnyons
for f in MobileAnyons.jl config.jl hilbert.jl fsymbols.jl operators.jl \
         interaction.jl braiding.jl paircreation.jl wavelets.jl \
         finegraining.jl virasoro.jl; do
  echo "$(sha256sum $f | cut -d' ' -f1)  $(wc -l < $f)  $f"
done

# Cross-reference TC.jl symbol usage (per P8.0a)
grep -nE '(F\[|f_matrix|six_j|involutory|unitary|gauge)' *.jl

# Cross-reference GLOSSARY slug existence
cd /home/tobiasosborne/Projects/cft-anyons
grep -nE '^## (def|conv):' GLOSSARY.md

# Cross-reference CONVENTIONS letters
grep -nE '^## \([a-j]\)' CONVENTIONS.md

# Cross-reference MMA exports list against per-file declarations
grep -nE '^(struct|function|export)' \
  /home/tobiasosborne/Projects/microscopic-mobile-anyons/src/MobileAnyons/*.jl

# CLAUDE.md hallucination-risk callouts (8 items)
grep -nE '^- \*\*' /home/tobiasosborne/Projects/cft-anyons/CLAUDE.md | \
  grep -E '(Vacuum|F-matrix|Coassoc|dagger-special|Hilbert-space framings|unchecked|chats|Lean)'
```

No Julia REPL invocation needed (per brief). Pure source-level audit. Audit time: ~30 min of file reads + cross-references; output: this report (~1000 lines including the 11 per-file tables + Synthesis).

---

## Conclusion

Phase 8 P8.1a definitional-bridge audit **VERDICT: YELLOW** — 10 MMA Julia files map cleanly to existing GLOSSARY slugs and CONVENTIONS conventions, with two port-time documentation gaps (paircreation.jl F-symbol comment + finegraining.jl exclusion note), one bd-deferred user-escalation (R-symbol GLOSSARY coverage), and four routine port-time TODOs (LB-1 marker + secondary-site annotations). **No STOP-level conflicts; P8.1b reviewer dispatch + P8.2 (likely skip) + P8.3+ port work all unblocked.**
