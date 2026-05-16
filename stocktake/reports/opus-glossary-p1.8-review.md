# P1.8 review: MMA-Julia translation maps in GLOSSARY

**Date:** 2026-05-16
**Reviewer:** Opus 4.7 hostile-review subagent (general-purpose)
**File under review:** GLOSSARY.md (45 MMA bullets + 1 `conv:basics` Aliases-field update; working-tree diff vs commit `d8c0a40`)
**Authoritative source:** `stocktake/reports/mma-julia.md` §5 (with cross-references to §2 file-by-file inventory and §3 key-concepts list)
**Companion files (read-only):** `stocktake/MIGRATION_PLAN.md` (P1.8 = §132), `stocktake/reports/opus-glossary-p1.7-review.md` (format template), `stocktake/reports/opus-hilbert-bridge.md` (§B P1.5 entries), MMA source `/home/tobias/Projects/microscopic-mobile-anyons/src/MobileAnyons/`

---

## Verdict

**APPROVE WITH MINOR EDITS**

The 45 MMA-bullet populations are substantively correct in their structural claims (file/struct/function names mostly exist; absence claims mostly track `mma-julia.md` §5; LB-1, gauge, and vacuum-index callouts fire where they should). There are, however, **three categories of substantive factual errors** that mislead a future Phase-8 implementer in the same way that the P1.7 review caught the `def:polar-repair` Mathlib-gap reversal: a fabricated source-line citation appearing across multiple entries, a fabricated TensorCategories function-name (`multiplication_table`), and one mis-attribution of a test file to the wrong physics model (Fibonacci tests cited as covering the Ising dense chain). Each is a per-claim "looks right but isn't" defect — exactly the silent-drift hazard Law 1 / Rule 11 are designed to catch. All are mechanically fixable in a follow-up commit.

The `conv:basics` Aliases update is appropriate and well-justified; no edits requested there. The P1.5 entries (`def:Hlatt`, `def:HP`, `def:indlim`, `def:mobile-Fock`) and the schema-doc placeholder at line 76 are correctly preserved. Cross-link integrity (43 referenced slugs, 49 defined, 0 missing) passes.

---

## Per-claim findings (priority 1: file/struct/function existence)

**Plan-named primary targets** (`MIGRATION_PLAN.md:132`):

| Slug | GLOSSARY claim | Verification | Status |
|---|---|---|---|
| `def:partition` (line 531) | `src/MobileAnyons/config.jl::LabelledConfig` struct with `positions::Vector{Int}` and `labels::Vector{Int}`; `enumerate_configs_hc(L, N, C)` enumerator | `config.jl:15-18` confirms `struct LabelledConfig { positions::Vector{Int}, labels::Vector{Int} }`; `config.jl:27` confirms `enumerate_configs_hc(L::Int, N::Int, C)` | PASS |
| `def:refmap` (line 669) | `src/MobileAnyons/finegraining.jl::normalized_product_isometry` + variants (`fine_graining_isometry`, `trivial_embedding`, `categorical_determinant_isometry`, `fine_graining_isometry_svec`) | `finegraining.jl` confirms all five functions present at the correct names; `wavelets.jl:102` confirms `fine_graining_isometry_svec` (NB: defined in `wavelets.jl`, not `finegraining.jl`, but exported from same module — minor lineage detail) | PASS |
| `def:TL-cat` (lines 1337–1351) | `src/MobileAnyons/interaction.jl::interaction_hamiltonian` + `interaction_hamiltonian_sector`; Hermitian vacuum-projector `P_H = vv^\dagger / |v|^2`; tested by `test/test_golden_chain.jl`, `test/test_fibonacci_spectra.jl` | `interaction.jl:24, 43` confirm both functions; `interaction.jl:154-167` confirm Hermitian projector with comment "P_H = v v† / |v|²"; test files exist | PASS |

**General §A spot-checks:**

| Slug | GLOSSARY claim | Verification | Status |
|---|---|---|---|
| `def:fuscat` (line 217) | TensorCategories.jl `FusionCategory` instantiated as `fibonacci_category()`, `ising_category()`, `graded_vector_spaces(Z/2)` **in `src/MobileAnyons/fsymbols.jl:35`** | `grep` of all of `src/MobileAnyons/` returns ZERO hits for any of these names; line 35 of `fsymbols.jl` is the body of `build_fsymbol_cache` (`numerical[(a,b,c,dd)] = _to_complex_matrix(...)`); these category instantiations only appear in `test/*.jl` files (e.g., `test_categories.jl:7,26,44`) — see minor edit #1 | **FACTUAL ERROR (recurring)** |
| `def:fuscat` (line 222) | "multiplicities via `multiplication_table`, F-symbols via `six_j_symbols`" | `multiplication_table` is NOT referenced anywhere in MMA src (verified via `grep -rn`); MMA uses `dim(Hom(S[a] ⊗ S[b], S[c]))` (e.g. `hilbert.jl:58`, `fsymbols.jl:75`). `six_j_symbols` IS used (`fsymbols.jl:27`); mma-julia.md does NOT mention `multiplication_table` at all — see minor edit #2 | **FACTUAL ERROR (fabricated function name)** |
| `def:splitbasis` (line 278) | `src/MobileAnyons/hilbert.jl::FusionTree` struct + `enumerate_fusion_trees` enumerator | `hilbert.jl:17` confirms `struct FusionTree`; `hilbert.jl:42` confirms `enumerate_fusion_trees(C, labels::Vector{Int}, c::Int)`; LB-1 caveat correctly references `cft-anyons-q6h` | PASS |
| `def:fsymbol` (line 322) | `src/MobileAnyons/fsymbols.jl::FSymbolCache` (built via `build_fsymbol_cache`, queried via `f_matrix`, `f_symbol`) | `fsymbols.jl:15, 26, 48, 58` all confirm structs/functions at correct names | PASS |
| `def:fib-F` (lines 1012-1015) | `f_matrix(cache, \tau, \tau, \tau, \tau)` for `cache = build_fsymbol_cache(fibonacci_category())`; tested by `test_fsymbols.jl` | Function present; test exists with correct `Fib = fibonacci_category()` and F-matrix tests | PASS |
| `def:ising-F` (lines 1271-1275) | `f_matrix(cache, \sigma, \sigma, \sigma, \sigma)` for `cache = build_fsymbol_cache(ising_category())` | Function/binding logic correct; the entry says it returns the Hadamard-type F-matrix "from TensorCategories" — verified | PASS |
| `def:pair-create` (lines 1675-1683) | `paircreation.jl::pair_creation_operator`, `dual_pairs`, `_build_pair_intermediates` (internal); `pair_hamiltonian` Hermitian variant; `test_paircreation.jl` coverage | `paircreation.jl:19, 38, 87, 155` confirm all four; test file exists | PASS |
| `def:persist` (line 1635) | `src/MobileAnyons/finegraining.jl::trivial_embedding` ($j \mapsto 2j-1$) | `finegraining.jl:148, 162` confirm function and the formula `2x - 1`; the GLOSSARY's "**odd** sublattice" claim is correct (since `2(coarse)-1` is odd-numbered) | PASS |
| `def:polar-repair` (lines 1741-1748) | `src/MobileAnyons/wavelets.jl::one_particle_scaling_map` (lines 63-67) for Löwdin orthogonalisation | `wavelets.jl:62` says "Symmetric (Löwdin) orthogonalization"; lines 62-68 contain the actual SVD-based inverse-square-root computation; the cited line range mirrors `mma-julia.md` §5 line 143 verbatim — PASS for line range. **But** the additional citation `§3 line 84` is wrong; line 84 is about `normalized_product_isometry`, not `one_particle_scaling_map` — see minor edit #3 | PASS (struct), MINOR (citation) |
| `def:KS-Ln` (lines 1414-1418) | `src/MobileAnyons/virasoro.jl::hamiltonian_fourier_modes` builds OBC sine-transform `H_n = sum sin(πnj/L) P_j`; `virasoro_commutator_check` returns NaN | `virasoro.jl:79-93` confirm `hamiltonian_fourier_modes` with `phase = sin(π * n * j / L)`; `virasoro.jl:139` confirms `c_estimate=NaN` | PASS |
| `def:Hlatt`, `def:HP`, `def:indlim`, `def:mobile-Fock` | NOT MODIFIED by P1.8 (already populated by P1.5) | Diff inspection confirms no hunks touch these entries (verified via line numbers 374, 494, 618, 1654 in pre-P1.8 file vs hunk ranges 121-1631+) | PASS |

**Spot-check summary**: 12/15 PASS, 1 FACTUAL ERROR (`def:fuscat` "fsymbols.jl:35" location for `fibonacci_category()` etc. — **recurs** in `conv:unitary-default`, `def:fib`, `def:ising`), 1 FACTUAL ERROR (`def:fuscat` `multiplication_table` fabrication), 1 MINOR (`def:polar-repair` §3-line-84 mis-cite). The recurring "fsymbols.jl:35" error inflates the impact: it appears in **4 distinct entries** (`def:fuscat` 217, `conv:unitary-default` 248, `def:fib` 952, `def:ising` 1236).

---

## Per-entry "not in MMA" justification check (priority 2)

| Slug | Justification | mma-julia.md §5 anchor | Status |
|---|---|---|---|
| `def:algobj` (line 844) | "MMA never constructs an algebra object ... per `mma-julia.md` §5 line 135" | Line 135 verbatim: "Entirely absent from MMA. MMA never constructs an algebra object in the fusion category or derives refinement maps from it." | PASS |
| `conv:1op` (line 875) | "not applicable — the `A = 1 ⊕ p` algebra-object ansatz ... and MMA never constructs an algebra object" | Derivative of §5 line 135; correct | PASS |
| `def:fib-mult` (line 1127-1129) | "MMA: not implemented. Algebra-object multiplications $m: A \otimes A \to A$ are absent (per [[def:algobj]])" | Derivative of §5 line 135; correct | PASS |
| `def:coassoc` (line 1079-1083) | "MMA never constructs an algebra object or comultiplication, so the categorical coassociativity equation for η does not arise" | Derivative of §5 line 135; correct. Explicitly disambiguates from CLAUDE.md callout #3 (scalar-vs-categorical coassoc overloading) | PASS |
| `def:Zfunc` (line 1170-1173) | "cells are all unit-length lattice sites (per [[def:partition]] MMA bullet), so the convolutional content collapses to the trivial L=1 case" | Derivative inference from §5 line 131 ("mobile version ... 1D lattices"); correct | PASS |
| `def:rchild` (line 1206-1207) | "Built on [[def:fib-mult]] (absent ...) and [[def:Zfunc]] (absent ...)" | Both upstream absences anchored to §5; correct | PASS |
| `def:stress` (line 1484-1486) | "stress tensor T(z) is a continuum-CFT object; MMA realises only the lattice approximant via `hamiltonian_fourier_modes`" | Derivative; no direct §5 citation needed (the absence of any general CFT infrastructure in MMA is the overall §5 picture) | PASS |
| `def:OPE` (line 1510-1513) | "OPE coefficients $C_{abc}$ are continuum-CFT data; MMA has no extraction infrastructure beyond the central-charge Cardy fit ... per §3 line 93" | §3 line 93 is `c=7/10` Cardy bullet — correctly cited | PASS |
| `def:RG-amp` (line 1577-1581) | "RG amplitude ansatz ... requires symbolic CFT weights and Wilsonian RG infrastructure absent in MMA" | Derivative; consistent with §5 silence on Wilsonian RG | PASS |
| `def:isingcft` (line 1538-1545) | "extracts $c = 7/10$ via Cardy ... at the **tricritical** Ising point — this corresponds to ... chiral $(G_2)_1$ / Fibonacci, not the diagonal c=1/2 Ising of this entry. ... The diagonal Ising data $c = 1/2$, $h_\sigma = 1/16$, $h_\psi = 1/2$ is not separately verified in MMA." | Correctly disambiguates Fibonacci-c=7/10 from Ising-c=1/2 (good!); §2 lines 53-54 cited correctly | PASS |
| `def:scalop` (line 1605-1610) | "Eigenvalues of the lattice ascending channel ... appear implicitly in `test_convergence.jl` ... per `mma-julia.md` §2 line 65" | Line 65 is `test_convergence.jl` row, correctly cited | PASS |
| `def:smear` (line 1847-1849) | "Smeared cell fields ... are continuum-CFT objects; MMA has no continuum primary fields" | Derivative; correct | PASS |
| `def:Ageom` (line 1879-1883) | "geometry-enriched site object requires jet/smearing-space decoration ... MMA has no jet infrastructure" | Derivative; correct | PASS |

**Summary of "not implemented in MMA" spot-checks**: 13/13 PASS. Every absence claim is either directly anchored to a verbatim §5 entry or follows by derivative reasoning from one that is. No fabrications detected in this area.

---

## Convention / gauge / hallucination-risk callout coverage (priority 3)

**F-matrix gauge (CLAUDE.md callout #2)** — entries that should fire it:

| Slug | Should fire? | Does fire? |
|---|---|---|
| `def:fsymbol` (line 327-333) | YES (general F-symbol) | YES — explicit "**Caution (CLAUDE.md hallucination-risk):** TensorCategories.jl uses an **involutory** gauge" + forward-pointer to P1.6(b) |
| `def:fib-F` (line 1017-1021) | YES (Fibonacci specific) | YES — "**Caution (CLAUDE.md hallucination-risk):** TensorCategories.jl uses an **involutory** gauge; for Fibonacci specifically the entries coincide with summary.tex's unitary gauge by Lemma `lem:F-invol`" + forward-pointer [P1.6(b)] |
| `def:ising-F` (line 1274-1275) | YES (Ising specific) | YES — "**Caution** as for [[def:fib-F]] regarding involutory-vs-unitary gauge [P1.6(b)]." |
| `def:TL-cat` (line 1346-1349) | YES (uses F-column projector) | YES — explicit "**Gauge fix**: because TensorCategories.jl uses an involutory F-matrix gauge, MMA uses the Hermitian projector $P_H = vv^\dagger / |v|^2$" |

All four entries fire the F-matrix gauge callout correctly. PASS.

**Vacuum-index convention (CLAUDE.md callout #1, STL-1 bug)** — entries that should fire it:

| Slug | Should fire? | Does fire? |
|---|---|---|
| `def:Q` (line 397-399) | YES (vacuum choice = STL-1) | The MMA bullet does NOT separately call out vacuum-index, but it cites `config.jl:5,13` (which is where the vacuum=1 convention lives) and references `[[def:mobile-Fock]] convention dependency #2`. The Notes field (line 408-413, unchanged from earlier) does fire the callout explicitly. | PASS (Notes carries it) |
| `def:fib` (line 953-956) | YES (vacuum at index 1, τ at 2) | YES — "Two simples (vacuum at index 1, $\tau$ at index 2); ... Vacuum-index convention per [[def:mobile-Fock]] convention dependency #1." | PASS |
| `def:ising` (line 1238-1242) | YES (vacuum, σ, ψ at indices 1, 2, 3) | The bullet identifies the three simples but does NOT explicitly say "vacuum at index 1, σ at index 2, ψ at index 3" in the MMA conventional ordering. **Minor:** would be more parallel to `def:fib` if it did. | MINOR (see edit #4) |
| `def:mobile-Fock` (P1.5 entry, untouched by P1.8) | YES | Already fires (P1.5 work) — convention dependency #1 explicit | PASS |

**Coassociativity overloading (CLAUDE.md callout #3)** — `def:coassoc`:

- MMA bullet (line 1079-1084) explicitly notes "This MMA-absent entry is the **categorical** coassoc — independent of the CLAUDE.md hallucination-risk callout #3 scalar-vs-categorical-coassoc overloading; see Notes." This is the **right** disambiguation. P5.11 forward-pointer is in the CAD bullet (unchanged from P1.7). PASS.

**Dagger-special vs Frobenius-special (CLAUDE.md callout #4)** — `def:algobj`:

- MMA bullet (line 844-847) says "not implemented in MMA" — no place to silently mis-apply the equivalence claim. PASS (the callout doesn't have a positive MMA hook to attach to).

**LB-1 multiplicity caveat** — `def:splitbasis` (line 286-288):

- The LB-1 caveat is present with explicit `cft-anyons-q6h` reference; matches the P1.4-early-B work. PASS.

**Summary of callout coverage**: All four CLAUDE.md hallucination-risk callouts fire where they should; the only minor omission is making the vacuum-index ordering explicit in `def:ising` (where it's listed for `def:fib`).

---

## Cross-link spot-checks (priority 4)

Randomly selected 6 `[[slug]]` references in P1.8-modified bullets:

| Reference | Source entry | Target exists? |
|---|---|---|
| `[[def:TL-cat]]` in `def:qdim` MMA bullet (line 366) | `def:qdim` | YES — defined at line 1320 |
| `[[def:mobile-Fock]]` in `def:Q` MMA bullet (line 397) | `def:Q` | YES — defined at line 1903 (§B) |
| `[[def:fib]]`, `[[def:ising]]` in `def:splitbasis` MMA bullet (line 285) | `def:splitbasis` | YES — both defined |
| `[[def:algobj]]` in `def:fib-mult` MMA bullet (line 1128) | `def:fib-mult` | YES — defined at line 818 |
| `[[def:refmap]]` in `def:PF` MMA bullet (line 1055) | `def:PF` | YES — defined at line 644 |
| `[[conv:acro]]` in `def:PF` Notes (line 1058) | `def:PF` | YES — defined at line 148 |

All 6 spot-checks PASS. Full counted check: 43 distinct referenced slugs vs 49 defined slugs, 0 missing (verified via `grep -oE` + `awk` extract-and-sort). PASS.

---

## Structural / format compliance (priority 5)

**P1.5 entries preservation:**

| Entry | Pre-P1.8 line | Post-P1.8 status |
|---|---|---|
| `def:Hlatt` | 374 (pre) / 417 (post) | Unchanged (no diff hunk in this range) |
| `def:HP` | 494 / 548 | Unchanged |
| `def:indlim` | 618 / 695 | Unchanged |
| `def:mobile-Fock` | 1654 / 1903 (§B) | Unchanged (last diff hunk at -1631, all P1.5 entries are at or beyond this line in the pre-file) |

PASS — diff hunk inspection confirms no inadvertent overwrites.

**Schema-doc placeholder preservation** (line 76 of working tree):

```
  - MMA: <equivalent or "TBD pending P1.8">
```

This is preserved verbatim in the schema example (it's illustrative template text, NOT a real entry). PASS.

**Indentation compliance:** all 45 new MMA bullets start with `  - MMA: ` (2-space indent, dash, space, "MMA: ") per `grep -nE "^  - MMA:"`. No incorrectly-indented variants (`^- `, `^   - `, `^     - `) found. PASS.

**D-gate spot-checks (canonical bodies byte-verbatim from summary.tex):**

| Slug | summary.tex line | Match? |
|---|---|---|
| `def:fib` | summary.tex:1003-1011 | Match (verified by side-by-side `sed`) |
| `def:partition` | summary.tex:374-378+ | Match (top of definition body verified) |
| `def:TL-cat` | summary.tex:1648-1655 | Match |

PASS — 3/3 spot-checks confirm canonical bodies are unchanged from the P1.1 verbatim extraction.

**Count compliance:** 45 new MMA bullets (matches plan-stated count of 45 — 49 total − 4 P1.5 = 45). PASS.

---

## conv:basics Aliases update review (priority 6)

The Aliases field was updated from "TBD pending P1.8." to:

> N/A — this entry defines its own notations. The component notations have external counterparts catalogued in the per-concept entries: the categorical adjoint $f^\dagger$ in [[def:fuscat]] (unitary qualifier) and [[def:fsymbol]] (gauge interplay); the unit $\one$ / vacuum simple in [[def:Q]] (cell-object choice) and [[conv:1op]] ($A = \one\oplus p$ algebra ansatz); the tensor product $\otimes$ in [[def:fuscat]]. MMA-side realisations are in this entry's Translation map.

**Cross-reference appropriateness:** all 4 slugs (`def:fuscat`, `def:fsymbol`, `def:Q`, `conv:1op`) resolve to defined entries. The "categorical adjoint → def:fuscat (unitary qualifier)" pointer is correct (def:fuscat's last paragraph defines unitary fusion category via dagger). The "$\one$ / vacuum → def:Q" pointer is consistent with def:Q being the local cell object that interacts with the vacuum simple. The `def:fsymbol` cross-ref for gauge interplay is correct (gauge convention is discussed in that entry's MMA bullet). PASS.

**Consistency with `conv:acro` Aliases field:** `conv:acro`'s Aliases is just "N/A (the entry itself is an aliases table)." The P1.8 update for `conv:basics` is structurally similar ("N/A — this entry defines its own notations") but more elaborate. This is **acceptable** because conv:basics's notations have external (per-concept) counterparts that benefit from a forward-pointer index, whereas conv:acro's acronyms are self-contained. The asymmetry is justified by the asymmetry of the underlying content.

**Verdict on `conv:basics` Aliases:** APPROVED as written. No edit requested.

---

## Recommended minor edits (apply before merge, or file as immediate follow-up)

### Edit 1 (RECURRING — affects 4 entries): "src/MobileAnyons/fsymbols.jl:35" location for `fibonacci_category()` / `ising_category()` / `graded_vector_spaces(...)`

**The error.** The GLOSSARY repeatedly claims these TensorCategories.jl instantiations are at `src/MobileAnyons/fsymbols.jl:35`. They are NOT. `grep -rn "fibonacci_category\|ising_category\|graded_vector_spaces" /home/tobias/Projects/microscopic-mobile-anyons/src/` returns ZERO matches. Line 35 of `fsymbols.jl` is the body of `build_fsymbol_cache` (a loop assignment `numerical[(a, b, c, dd)] = _to_complex_matrix(C, F)`). The category constructors are TensorCategories.jl exports that are called only in the `test/` directory (e.g., `test_categories.jl:7, 26, 44`). The source `mma-julia.md` itself does NOT make this false claim — line 75 of mma-julia.md just says "Three named categories: `fibonacci_category()`, `ising_category()`, `graded_vector_spaces(G)` for Z/2 (sVec)" with no file/line attribution.

**Affected entries:**

1. **`def:fuscat`** GLOSSARY line 217-218: "instantiated as `fibonacci_category()`, `ising_category()`, and `graded_vector_spaces(Z/2)` (= sVec) in `src/MobileAnyons/fsymbols.jl:35` and used throughout MMA's `hilbert.jl`, ..."

   Replace with: "available via TensorCategories.jl as `fibonacci_category()`, `ising_category()`, and `graded_vector_spaces(Z/2)` (= sVec) (each is a TensorCategories.jl export, not an MMA constructor); MMA's `src/` accepts any such category via its generic `C` parameter and uses it throughout `hilbert.jl`, `fsymbols.jl`, `interaction.jl`, `braiding.jl`. The three named categories are exercised in `test/test_categories.jl:7, 26, 44`."

2. **`conv:unitary-default`** GLOSSARY line 247-250: "the three exemplars in `src/MobileAnyons/fsymbols.jl:35` (`fibonacci_category()`, `ising_category()`, `graded_vector_spaces(Z/2)`) are all unitary fusion categories"

   Replace with: "the three TensorCategories.jl exemplars (`fibonacci_category()`, `ising_category()`, `graded_vector_spaces(Z/2)`) exercised by MMA in `test/test_categories.jl:7, 26, 44` are all unitary fusion categories"

3. **`def:fib`** GLOSSARY line 951-952: "`fibonacci_category()` returns the TensorCategories.jl `FusionCategory` instance for Fibonacci per `src/MobileAnyons/fsymbols.jl:35`."

   Replace with: "`fibonacci_category()` (a TensorCategories.jl export, called e.g. in `test/test_categories.jl:7`, `test/test_golden_chain.jl:11`) returns the `FusionCategory` instance for Fibonacci consumed by MMA's `src/` modules via a generic category parameter."

4. **`def:ising`** GLOSSARY line 1235-1236: "`ising_category()` returns the TensorCategories.jl `FusionCategory` instance for Ising per `src/MobileAnyons/fsymbols.jl:35`."

   Replace with: "`ising_category()` (a TensorCategories.jl export, called in `test/test_categories.jl:26`) returns the `FusionCategory` instance for Ising consumed by MMA's `src/` modules via a generic category parameter."

**Why this is "minor but substantive":** an MMA-importer (Phase 8) following the citation will open `fsymbols.jl:35`, find an irrelevant cache-loop, and either (a) waste time hunting for the missing constructor or (b) silently believe the claim and propagate the false location into downstream documentation. Same hazard class as the P1.7 `def:polar-repair` Mathlib-gap reversal.

### Edit 2: `def:fuscat` cites fabricated TensorCategories function `multiplication_table`

**The error.** GLOSSARY line 221-222: "Provides finite simples, multiplicities via `multiplication_table`, F-symbols via `six_j_symbols`." `grep -rn "multiplication_table" /home/tobias/Projects/microscopic-mobile-anyons/src/` returns ZERO matches. MMA computes multiplicities via `dim(Hom(S[a] ⊗ S[b], S[c]))` (e.g., `hilbert.jl:58`, `fsymbols.jl:75`, `paircreation.jl:24`). The mma-julia.md source does NOT mention `multiplication_table` either.

**Recommended replacement** for line 221-223:

> Provides finite simples (via `simples(C)`), multiplicities (queried indirectly via `dim(Hom(S[a] ⊗ S[b], S[c]))` — see e.g. `hilbert.jl:58`, `fsymbols.jl:75`), F-symbols (via `six_j_symbols`, wrapped by `FSymbolCache` per `fsymbols.jl:27`). No MMA-specific wrapper struct.

### Edit 3: `def:polar-repair` `§3 line 84` citation is wrong

**The error.** GLOSSARY line 1745: "per `stocktake/reports/mma-julia.md` §3 line 84 and §5 line 143". Line 84 of mma-julia.md is about `normalized_product_isometry` ("universal fix via column normalization; tested isometric for Haar/D4, Fibonacci, Ising") — completely unrelated to `one_particle_scaling_map` or Löwdin orthogonalization.

The correct reference for `one_particle_scaling_map` + Löwdin is `§2 line 40` (the `wavelets.jl` file row, which explicitly says "`one_particle_scaling_map` (Löwdin orthogonalization for OBC boundaries)").

**Recommended replacement** for line 1745: change "`§3 line 84`" to "`§2 line 40`".

### Edit 4: `def:ising` — make vacuum-index ordering parallel to `def:fib`

**Not a substantive error**, just an asymmetry. `def:fib` MMA bullet says "Two simples (vacuum at index 1, $\tau$ at index 2)"; `def:ising` MMA bullet says "Three simples ($\one, \sigma, \psi$)" but doesn't make the index ordering explicit. Recommended parallel wording: "Three simples (vacuum $\one$ at index 1, $\sigma$ at index 2, $\psi$ at index 3; per the standard `simples(ising_category())` ordering)."

This is **optional**; not blocking. Just consistency-with-def:fib.

### Edit 5 (consideration, not strict requirement): `def:dense` test-coverage attribution

**The issue.** `def:dense` defines the **Ising** dense $\sigma$-chain (TLJ at $\delta = \sqrt 2$). The MMA bullet describes how this would be realised via `enumerate_configs_hc(L, L, ising_category())` (correct), and then attributes test coverage to `test/test_golden_chain.jl` (Hermitian, nonzero off-diagonal) and `test/test_golden_chain_cft.jl` (Cardy fit extracts $c = 7/10$). However, both of those tests use **Fibonacci**, not Ising. Verified by `head -25 test_golden_chain.jl` → `Fib = fibonacci_category()`, and `head -25 test_golden_chain_cft.jl` → `Fib = fibonacci_category()` with `c = 7/10` extraction. Neither file exercises the all-$\sigma$ Ising sector at the c=1/2 critical point.

The mma-julia.md source does NOT make this mis-attribution; §2 line 52 explicitly says "Dense Fibonacci interaction Hamiltonian"; line 53 says "Cardy finite-size scaling for c=7/10 extraction; gap-ratio tricritical Ising check" (tricritical Ising = Fibonacci/c=7/10, not categorical Ising/c=1/2).

**Why this matters.** A Phase-8 implementer reading `def:dense` MMA bullet would expect those tests to cover the dense Ising chain. They don't. The MMA codebase has no test for the dense all-$\sigma$ Ising sector at the c=1/2 critical point. The right thing for the bullet to say is "MMA can in principle realise this via `enumerate_configs_hc(L, L, ising_category())`, but **no MMA test exercises the dense Ising sector** — the existing tests `test_golden_chain.jl`, `test_golden_chain_cft.jl` cover the analogous **Fibonacci** golden chain (c=7/10 tricritical Ising fixed point), not the **Ising** dense chain (c=1/2 critical Ising). To verify the dense Ising chain numerically would require a new test."

**Recommended replacement** for line 1302-1310 (the test-coverage clause):

> ... `enumerate_fusion_trees` then enumerates the fusion-path basis $(x_0 = \one, x_1, \ldots, x_L = c)$ with $x_i \subset x_{i-1} \otimes \sigma$. **No existing MMA test exercises this dense Ising sector** — the related test files `test/test_golden_chain.jl` and `test/test_golden_chain_cft.jl` cover the analogous **Fibonacci** golden chain (c = 7/10 tricritical Ising fixed point, per `mma-julia.md` §2 lines 52-53), not the categorical Ising dense $\sigma$-chain defined here (which would flow to c = 1/2 critical Ising per [[def:isingcft]]).

This makes the entry's relationship to its `def:isingcft` partner explicit (parallels the `def:isingcft` MMA bullet, which already has the correct disambiguation).

---

## Recommended follow-ups (do NOT apply in P1.8; for future steps)

1. **bd issue**: "Add MMA test for dense Ising c=1/2 sector." Per Edit 5 — would close the test-coverage gap for `def:dense` (the categorical Ising side). Out of P1.8 scope but worth tracking. (Cf. Phase 8 / MMA migration.)

2. **bd issue**: "Audit other GLOSSARY entries for `multiplication_table`-class fabrications." The `multiplication_table` invention in `def:fuscat` raises a class concern: are there other plausible-sounding but fabricated TensorCategories.jl function names elsewhere? A bulk grep against the actual TensorCategories.jl API (or the MMA src) would close this risk. Out of P1.8 scope. Could be a Phase-8 pre-migration audit.

3. **GLOSSARY entry suggestion (do NOT add in P1.8)**: Consider adding a `def:fusion-tree` §B entry sourced from `hilbert.jl::FusionTree`. Currently multiple MMA bullets reference `FusionTree` (e.g., `def:splitbasis`, `def:ope3`) but there's no GLOSSARY entry for the MMA-specific data structure itself. Defer to Phase 8 / a future GLOSSARY expansion step.

4. **CONVENTIONS.md cross-check**: P1.6 should have established the F-matrix gauge convention as item (b). The P1.8 entries cite "[P1.6(b)]" repeatedly — confirm this still resolves correctly post-P1.6. (Not a P1.8 defect; just a check that the forward-pointers haven't drifted.)

---

## Per-area summary table

| Check | Verdict | Count |
|---|---|---|
| 1. File/struct/function existence (priority 1) | MOSTLY PASS, 2 factual errors (fsymbols.jl:35 location ×4 entries; `multiplication_table` fabrication) | 12/15 spot-checks PASS, 3 with issues |
| 2. "Not in MMA" justifications (priority 2) | PASS | 13/13 PASS |
| 3. Convention/gauge/hallucination callouts (priority 3) | PASS (1 minor parallelism nit) | 4/4 F-gauge fire; 3/4 vacuum-index fire (def:ising minor); coassoc disambiguated; LB-1 fired |
| 4. Cross-link integrity (priority 4) | PASS | 43 refs / 49 slugs / 0 missing |
| 5. Structural / format compliance (priority 5) | PASS | P1.5 intact; schema preserved; D-gate 3/3 spot-checks; 45/45 indentation |
| 6. conv:basics Aliases update (priority 6) | APPROVED | No edits |

---

## Recommended commit-message `Review:` line

```
Review: Opus 4.7 subagent, APPROVE WITH MINOR EDITS — 45 MMA
bullets in 45 entries verified against mma-julia.md §5 (lines
129-152) cross-referenced against §2 file-by-file inventory and §3
key concepts. 15 priority-1 spot-checks: 12 PASS, 3 with substantive
issues: (a) "src/MobileAnyons/fsymbols.jl:35" location for
fibonacci_category()/ising_category()/graded_vector_spaces() is
fabricated (those calls are in test/ only) and recurs in 4 entries
(def:fuscat 217, conv:unitary-default 248, def:fib 952, def:ising
1236); (b) def:fuscat fabricates TensorCategories function name
"multiplication_table" (MMA uses dim(Hom(...)) instead); (c)
def:polar-repair §3-line-84 citation is wrong (should be §2 line 40
for Löwdin/one_particle_scaling_map). 13 priority-2 "not in MMA"
spot-checks: all PASS (all anchored to §5 line 135 algebra-object
absence or to §5 line 131 mobile-version gloss). Priority-3 callout
coverage: F-matrix gauge fires in 4/4 expected entries; vacuum-index
fires in 3/4 (def:ising minor parallelism nit); coassoc explicitly
disambiguated; LB-1 cited. Priority-4: 43 [[slug]] refs across new
bullets, all resolve. Priority-5: P1.5 entries
(def:Hlatt/HP/indlim/mobile-Fock) and schema-doc placeholder
preserved; 3/3 D-gate spot-checks; 45/45 indentation. Priority-6:
conv:basics Aliases update is appropriate and consistent with
conv:acro. Also flagged: def:dense MMA bullet mis-attributes
Fibonacci-c=7/10 test coverage to the Ising dense chain
(test_golden_chain*.jl use Fib, not Ising). Minor edits 1-3 are
direct mechanical fixes (request before merge or file as P8-gated
bd issue); edit 4 is optional consistency nit; edit 5 (def:dense
attribution) is recommended substantive clarification. Full report:
stocktake/reports/opus-glossary-p1.8-review.md.
```
