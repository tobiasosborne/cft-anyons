# TC.jl API Audit — Phase 8 P8.0a (LB-3 discharge)

**Author:** Opus 4.7 (1M-context, model id `claude-opus-4-7[1m]`), as P8.0a implementer
**Date:** 2026-05-17
**Trigger:** bd `cft-anyons-u6q` (P8.0a) discharging `cft-anyons-pvu` (LB-3); user memory `feedback-phase8-tensorcategories-care` § Precondition 1.
**Predecessor:** `stocktake/reports/opus-glossary-p1.8-review.md` (P1.8 reviewer caught fabricated `multiplication_table` — fixed in P1.8; this audit verifies no class-cousins survived).

## Scope

- **TC.jl pin (per MMA `Manifest.toml`):** version `0.5.3`; `git-tree-sha1 = 591655388467dd84356425f16d584319809306ec` (verbatim from MMA `/home/tobiasosborne/Projects/microscopic-mobile-anyons/Manifest.toml`).
- **TC.jl source located at:** `/home/tobiasosborne/.julia/packages/TensorCategories/fnMHT/` (locally-installed Julia depot; `Project.toml` reads `version = "0.5.3"` — exact match). Cross-reference: `/home/tobiasosborne/Projects/TensorCategories.jl/` is a separate working checkout at HEAD `88226da` / tree `a6d43ed`, version `0.5.5`. **The audit uses the depot copy `fnMHT/` (pin-exact).**
- **References audited:**
  - `GLOSSARY.md`: 16 distinct TC.jl-related citation sites across 7 GLOSSARY entries (`def:fuscat`, `conv:unitary-default` mention, `def:fsymbol`, `def:fib`, `def:fib-F`, `def:ising`, `def:ising-F`, plus 2 cross-cutting Translation-rule bullets in `def:dense` / `def:TL-cat`).
  - `CONVENTIONS.md` (§ (b) gauge): 4 generic "TensorCategories.jl" mentions; **no specific function names cited** — gauge-translation rule is referenced abstractly.
  - `summary.tex`: 0 TC.jl references (verified by `grep -i tensorcategories summary.tex`).

## TC.jl 0.5.3 export enumeration (authoritative)

Source: `/home/tobiasosborne/.julia/packages/TensorCategories/fnMHT/src/TensorCategories.jl` lines 63–477 (415 `export` statements).

Symbols cited in GLOSSARY are all present in this export list:

| Symbol | Export line | Definition site (in TC.jl 0.5.3) |
|---|---|---|
| `fibonacci_category` | line 186 | `src/Examples/Fibonacci/FibonacciCategory.jl:1, 23` (two methods: `(K::Ring, a::Int)` and `(a::Int)`) |
| `ising_category` | line 291 | `src/Examples/TambaraYamagami/TambaraYamagami.jl:197, 209, 219, 229, 239` (five methods) |
| `graded_vector_spaces` | line 198 | `src/Examples/GradedVectorSpaces/GradedVectorSpaces.jl:27, 33, 42, 51` (four methods) |
| `simples` | line 432 | Many overloads, including `Examples/GradedVectorSpaces/GradedVectorSpaces.jl:228, 232`; `Examples/GroupRepresentations/GroupRepresentations.jl:469`; etc. |
| `six_j_symbols` | line 434 | `src/TensorCategoryFramework/6j-Solver.jl:5`, `src/TensorCategoryFramework/Skeletonization.jl:66, 150` |
| `dim` | line 149 | Re-exported from Oscar (TC.jl `import Oscar: …, dim, …` at line 19) |
| `Hom` | line 223 | `src/CategoryFramework/AbstractTypes.jl:156, 164`, plus per-category overloads in `Semisimplification.jl:119`, `OppositeCategory.jl:130`, etc. |
| `associator` | line 94 | per-category overloads (referenced via `set_associator!` in `FusionCategory.jl:117ff`; called in test `test_categories.jl:21`) |
| `decompose` | line 144 | per-category (called in test `test_categories.jl:13, 34, 38, 49`) |
| `twisted_graded_vector_spaces` | lines 458, 459 (duplicate export) | `Examples/GradedVectorSpaces/` (not GLOSSARY-cited but MMA-test-used per `test_fsymbols.jl:51`) |
| `multiplication_table` | line 328 | `src/DecategorifiedFramework/multiplication_table.jl` (NB: file path and export both exist — see Surprise #1 below) |
| `FusionCategory` | line 191 | **DANGLING EXPORT — symbol is exported but no binding exists in TC.jl 0.5.3 src** — see AMBIGUOUS finding below |

## Audit verdicts table

| GLOSSARY line(s) | Cited symbol (form) | MMA `src/` usage? | TC.jl 0.5.3 existence | Verdict | Action |
|---|---|---|---|---|---|
| `GLOSSARY.md:240` (`def:fuscat`) | `TensorCategories.jl FusionCategory type` (the three exemplars `fibonacci_category()`, `ising_category()`, `TensorCategories.graded_vector_spaces(Z/2)` "are TensorCategories.jl exports") | type name not used; instances flow generically as `C` | exported (line 191) but **dangling** (no underlying type/constant — actual type is `SixJCategory`) | **AMBIGUOUS** | bd issue filed; GLOSSARY untouched (see "Discharge of AMBIGUOUS via bd issue" below) |
| `GLOSSARY.md:241–242` (`def:fuscat`) | `fibonacci_category()`, `ising_category()`, `TensorCategories.graded_vector_spaces(Z/2)` | not in `src/` (test-only — verified) | EXISTS (export lines 186, 291, 198) | **EXISTS** | none |
| `GLOSSARY.md:247–248` (`def:fuscat`) | `simples(C)` | extensive (`config.jl:5, 12, 13, 28`; `hilbert.jl:43, 58, 76`; `fsymbols.jl:28, 71, 75`; `braiding.jl:31, 40`; `paircreation.jl:20, 24`) | EXISTS (export line 432) | **EXISTS** | none |
| `GLOSSARY.md:249` (`def:fuscat`) | `dim(Hom(S[a] ⊗ S[b], S[c]))` | `hilbert.jl:58`, `fsymbols.jl:75`, `paircreation.jl:24`, `braiding.jl:40` | EXISTS (`dim` line 149 re-exported from Oscar; `Hom` line 223) | **EXISTS** | none |
| `GLOSSARY.md:250` (`def:fuscat`) | `six_j_symbols` | `fsymbols.jl:7, 17, 27` | EXISTS (export line 434) | **EXISTS** | none |
| `GLOSSARY.md:251` (`def:fuscat`) | `FSymbolCache per fsymbols.jl` | MMA-defined wrapper struct (`fsymbols.jl:11–18`) | n/a (MMA-side, not TC.jl) | **EXISTS** (MMA-side) | none |
| `GLOSSARY.md:276–278` (`def:fuscat-mma-not-formalised` bullet) | repeats `fibonacci_category()`, `ising_category()`, `graded_vector_spaces(Z/2)` | same as above | EXISTS | **EXISTS** | none |
| `GLOSSARY.md:352–354` (`def:fsymbol`) | `FSymbolCache`, `build_fsymbol_cache`, `f_matrix(cache, a, b, c, d)`, `f_symbol(cache, a, b, c, d, e, f)` (MMA wrappers); `TensorCategories.six_j_symbols` (wrapped) | MMA-defined (`fsymbols.jl:11, 26, 48, 58`); `six_j_symbols` consumed at `fsymbols.jl:27` | `six_j_symbols` EXISTS (line 434); MMA wrappers n/a | **EXISTS** | none |
| `GLOSSARY.md:393` (`def:qdim`) | `dim(a)` for each simple `a` "via TensorCategories.jl" | indirect via `dim(Hom(...))` pattern (numeric quantum dimension not directly computed in MMA `src/` — used implicitly) | EXISTS (`dim` line 149) | **EXISTS** | none |
| `GLOSSARY.md:425` (`def:dense`) | "every site may carry any label in `simples(C)`" | `config.jl:5, 12, 13`, `hilbert.jl:43, 76` | EXISTS (export line 432) | **EXISTS** | none |
| `GLOSSARY.md:981–984` (`def:fib`) | "`fibonacci_category()` (a TensorCategories.jl export, called in `test/test_categories.jl:7`, `test/test_golden_chain.jl:11`) returns the `FusionCategory` instance" | not in `src/` (test-only); `test/test_categories.jl:7`, `test/test_golden_chain.jl:11` confirmed | `fibonacci_category` EXISTS (line 186); **`FusionCategory` is the dangling export** (actual return type is `SixJCategory`) | **AMBIGUOUS** (same as line 240 — type-name claim) | covered by single bd issue |
| `GLOSSARY.md:1014–1016` (`def:fib-F`) | `f_matrix(cache, \tau, \tau, \tau, \tau)`; `dim(\tau) = \varphi` "via TensorCategories.jl" | MMA-wrapper at `fsymbols.jl:48`; numeric `dim` via Oscar re-export | EXISTS | **EXISTS** | none |
| `GLOSSARY.md:1044–1051` (`def:fib-F`) | `f_matrix(cache, \tau, \tau, \tau, \tau)` for `cache = build_fsymbol_cache(fibonacci_category())`; TC.jl uses involutory gauge | MMA + TC.jl chain verified | EXISTS | **EXISTS** | none |
| `GLOSSARY.md:1083–1084` (`def:fib-mult` or surrounding) | "$A^a_{bc} = \sqrt{...}$ derivable from TensorCategories' [dim]" | not a function call, descriptive | n/a (descriptive) | **EXISTS** | none |
| `GLOSSARY.md:1267–1271` (`def:ising`) | "`ising_category()` (a TensorCategories.jl export, called in `test/test_categories.jl:26`) returns the `FusionCategory` instance for Ising" | `test/test_categories.jl:26` confirmed | `ising_category` EXISTS (line 291); `FusionCategory` dangling | **AMBIGUOUS** (same type-name claim) | covered by single bd issue |
| `GLOSSARY.md:1275` (`def:ising`) | `enumerate_configs_hc(L, L, ising_category())` | MMA-defined (`config.jl`); `ising_category` from TC.jl | EXISTS | **EXISTS** | none |
| `GLOSSARY.md:1278` (`def:ising`) | `dim(\sigma)` "via TensorCategories'" | implicit (descriptive) | EXISTS | **EXISTS** | none |
| `GLOSSARY.md:1306–1308` (`def:ising-F`) | `f_matrix(cache, \sigma, \sigma, \sigma, \sigma)` for `cache = build_fsymbol_cache(ising_category())` returning "Hadamard-type F-matrix from TensorCategories per `src/MobileAnyons/fsymbols.jl`" | MMA chain verified | EXISTS | **EXISTS** | none |
| `GLOSSARY.md:1338` (`def:ising-F`) | `enumerate_configs_hc(L, L, ising_category())` | MMA-defined | EXISTS | **EXISTS** | none |
| `GLOSSARY.md:1383` (`def:TL-cat`) | "TensorCategories.jl uses an involutory F-matrix gauge" | (gauge statement, no function name) | true (cf. TC.jl `set_associator!` patterns and the involutory `F²=I` Fibonacci F-matrix in `Examples/Fibonacci/FibonacciCategory.jl:18`) | **EXISTS** | none |
| `GLOSSARY.md:1959` (`H_MMA(L) = ...` formula) | `simples(C)` | as above | EXISTS | **EXISTS** | none |
| `GLOSSARY.md:2013` (Translation-map bullet) | "MMA's TensorCategories.jl" (the involutory gauge) | descriptive | n/a (descriptive) | **EXISTS** | none |
| `GLOSSARY.md:2036` | "Vacuum at index 1 in `simples(C)`" | confirmed in `config.jl:5, 13` | EXISTS | **EXISTS** | none |
| `GLOSSARY.md:2047–2049` | "Involutory F-matrix gauge (TensorCategories.jl convention)" | gauge statement | true | **EXISTS** | none |
| `GLOSSARY.md:2054` | "Total charge `c` summed over all simples" | descriptive | EXISTS | **EXISTS** | none |
| `CONVENTIONS.md:132` (§ (b) gauge) | "(TensorCategories.jl convention, used by MMA)" | gauge statement, no fn name | true | **EXISTS** | none |
| `CONVENTIONS.md:149` | "formal correspondence documented in TensorCategories.jl" | abstract reference | n/a (descriptive) | **EXISTS** | none |
| `CONVENTIONS.md:161` | "TensorCategories.jl-derived F-matrix entries" | descriptive | n/a (descriptive) | **EXISTS** | none |
| `CONVENTIONS.md:173` | "via the TensorCategories.jl rule before use" | abstract reference | n/a (descriptive) | **EXISTS** | none |

## P1.8 fix verification

- `multiplication_table` MUST NOT appear in current GLOSSARY (P1.8 already replaced it with `dim(Hom(...))` per `opus-glossary-p1.8-review.md` Edit 2). Verified:
  - `grep -n 'multiplication_table' GLOSSARY.md` returns empty. **PASS** — P1.8 fix landed.
  - Also `grep -n 'multiplication_table' CONVENTIONS.md` returns empty. **PASS**.

**Side-note (not a finding):** `multiplication_table` IS in fact a real TC.jl export (line 328 of `TensorCategories.jl`, with its own source file `src/DecategorifiedFramework/multiplication_table.jl`). The P1.8 reviewer's "fabricated function name" verdict was framed against MMA's usage (MMA does not call `multiplication_table`); strictly speaking, the function exists in TC.jl, but MMA uses `dim(Hom(...))` instead. The P1.8 replacement is still correct because GLOSSARY's claim is about how MMA queries multiplicities, and MMA uses `dim(Hom(...))`, not `multiplication_table`. This audit confirms the substitute is empirically right and the original would have been factually misleading about MMA's mechanism. **No GLOSSARY change required.**

## Findings summary

- **Total distinct TC.jl symbol references in GLOSSARY:** 11 unique symbols (`fibonacci_category`, `ising_category`, `graded_vector_spaces`, `simples`, `dim`, `Hom`, `six_j_symbols`, `FusionCategory`, plus MMA wrappers `FSymbolCache`/`build_fsymbol_cache`/`f_matrix`/`f_symbol` and the MMA-side `enumerate_configs_hc`).
- **Total citation sites in GLOSSARY:** ~30 (each function name cited multiple times across the 7 GLOSSARY entries).
- **Verdicts:** all citations either EXIST or are descriptive — except **`FusionCategory` (cited at 3 sites: 240, 983, 1268), which is AMBIGUOUS:** the name is in TC.jl 0.5.3's `export` list (line 191 of `src/TensorCategories.jl`) but **no actual `FusionCategory` type, constant, or function is defined anywhere in TC.jl 0.5.3 src** — the file `src/TensorCategoryFramework/SixJCategory/FusionCategory.jl` (included at line 517) defines only `SixJCategory`. `using TensorCategories; FusionCategory` would produce `UndefVarError`. MMA `src/` never references the name `FusionCategory`; tests likewise do not. So GLOSSARY's claim "TensorCategories.jl `FusionCategory` type" is a *plausible paraphrase* of "TC.jl's underlying `SixJCategory` type, exported under the name `FusionCategory` even though that export is unbound in 0.5.3" — but it would mislead a future Phase-8 implementer trying to write `function foo(C::FusionCategory) = ...` (which would fail to compile).
- **Verdict distribution:** ~27 EXISTS / 0 FABRICATED / 0 PARAPHRASED-and-fixable / **3 AMBIGUOUS (single class — `FusionCategory` type-name)**.
- **GLOSSARY edits applied:** 0 (per brief: AMBIGUOUS cases are filed as bd issues, not silently fixed).
- **New bd issues filed:** 1 (see Discharge below).

## Discharge of AMBIGUOUS via bd issue

Per the brief's hard rule:

> If you find an AMBIGUOUS case (e.g., the cited name is plausible but you can't confirm it in TC.jl), file a bd issue ("P8.0a follow-up: verify GLOSSARY.md:<line> cites a real TC.jl symbol") and leave the GLOSSARY entry untouched.

The `FusionCategory` case is AMBIGUOUS because (a) the symbol IS in TC.jl 0.5.3's export list (so technically `using TensorCategories; FusionCategory` should be a binding — but the binding is dead/dangling, undefined in the source); (b) MMA never uses the *name* `FusionCategory` so the in-MMA-code claim is moot; (c) the conceptual word "fusion category" is the universally-understood mathematical name and arguably the right pedagogical word in a GLOSSARY entry, even if the corresponding Julia type happens to be `SixJCategory`; (d) the right fix is non-obvious — it could be "TensorCategories.jl `FusionCategory` (exported) / `SixJCategory` (underlying type)" or "TensorCategories.jl `SixJCategory` type (exported as `FusionCategory`, dangling in 0.5.3)" or simply unchanged.

bd issue filed: `<P8.0a-followup>` (id assigned by `bd create`): "P8.0a follow-up: `FusionCategory` is a dangling export in TC.jl 0.5.3 (no underlying definition); GLOSSARY def:fuscat (line 240), def:fib (line 983), def:ising (line 1268) cite it as a type. P8.1 implementer to decide whether to clarify."

## Surprises (for P8.1 / P8.4 implementers)

1. **`multiplication_table` IS a real TC.jl export** (line 328) with its own source file `src/DecategorifiedFramework/multiplication_table.jl` (~190 LOC). MMA's tests don't use it; MMA's `src/` doesn't use it. But it exists. The P1.8 reviewer's "fabricated function name" was technically misleading in framing (it's not fabricated in TC.jl; it's just not used by MMA). The P1.8 fix is still correct since GLOSSARY now describes MMA's actual mechanism.
2. **`FusionCategory` is a dangling TC.jl export.** TC.jl 0.5.3 lists `export FusionCategory` (line 191) but the symbol has no underlying binding. This is likely an inherited-from-future-refactor-intent. Future Phase-8 code that type-annotates with `FusionCategory` will fail; use `SixJCategory` or the abstract `Category` supertype instead.
3. **TC.jl tests use `TensorCategories.graded_vector_spaces` (qualified) and unqualified `graded_vector_spaces`** interchangeably (compare `test_categories.jl:44` qualified vs `test_paircreation.jl:25` unqualified). Both work; the export is unconditional.
4. **`twisted_graded_vector_spaces` is double-exported** (TC.jl lines 458 and 459 — same `export` keyword twice). MMA `test_fsymbols.jl:51` uses it. This is benign Julia behaviour (duplicate exports are silently de-duped) but is a TC.jl typo. GLOSSARY does not cite this symbol.
5. **TC.jl `import Oscar: …` block (lines 9–42) brings in `dim`, `Hom`-like names (actually `hom`), `decompose`, `dual`, `multiplication_table`, `tensor_product`** from Oscar — so many of the "TC.jl" symbols GLOSSARY cites are actually Oscar re-exports. This doesn't change verdicts (the names ARE accessible via `using TensorCategories`), but Phase-8 implementer should be aware that Oscar is a hard transitive dep (already in MMA's `Project.toml` at `Oscar = "1.6"`).
6. **TC.jl `Hom` (line 223 export, capital-H) vs Oscar `hom` (lowercase, imported line 23)** — different functions. MMA uses uppercase `Hom(...)` to get the hom-space *object* whose `dim(...)` gives the fusion multiplicity. Don't confuse with lowercase `hom(...)` which constructs a morphism.

## Method (reproducible)

```bash
# Located TC.jl source at MMA's pinned version
find /home -maxdepth 4 -type d -iname '*ensorCateg*' 2>/dev/null
# → /home/tobiasosborne/.julia/packages/TensorCategories/fnMHT (TC.jl 0.5.3, depot copy)
# → /home/tobiasosborne/Projects/TensorCategories.jl (working checkout, 0.5.5)

# Verified depot version matches MMA Project.toml pin "0.5"
cat /home/tobiasosborne/.julia/packages/TensorCategories/fnMHT/Project.toml | head -5
# → version = "0.5.3"  ✓ matches MMA Manifest tree-sha 591655388467dd84356425f16d584319809306ec

# Enumerated all TC.jl exports
grep -nE '^export ' /home/tobiasosborne/.julia/packages/TensorCategories/fnMHT/src/TensorCategories.jl | wc -l
# → 415 export statements

# Extracted GLOSSARY citations of TC.jl
grep -nE 'TensorCategories|fibonacci_category|ising_category|graded_vector_spaces|FusionCategory|simples|six_j_symbols|build_fsymbol_cache|f_matrix|f_symbol|FSymbolCache' /home/tobiasosborne/Projects/cft-anyons/GLOSSARY.md

# Cross-checked MMA empirical usage
grep -rnE 'TensorCategories\.|FusionCategory|six_j_symbols|fibonacci_category|ising_category|graded_vector_spaces|fusion_rules|associators|braiding\(|simples\(|dim\(|dual\(|f_symbol|f_matrix|Hom\(|build_fsymbol' /home/tobiasosborne/Projects/microscopic-mobile-anyons/src/

# Verified P1.8 fix landed
grep -n 'multiplication_table' /home/tobiasosborne/Projects/cft-anyons/GLOSSARY.md
# → empty (P1.8 fix verified)

# Confirmed FusionCategory dangling export
grep -rn 'FusionCategory' /home/tobiasosborne/.julia/packages/TensorCategories/fnMHT/src/
# → only the export at line 191 and the include at line 517; the included file
#   defines SixJCategory exclusively (no FusionCategory anywhere in its body)
grep -rn 'FusionCategory' /home/tobiasosborne/.julia/packages/TensorCategories/fnMHT/test/
# → empty (TC.jl's own tests never use the name)
grep -rn 'FusionCategory' /home/tobiasosborne/Projects/microscopic-mobile-anyons/src/ /home/tobiasosborne/Projects/microscopic-mobile-anyons/test/
# → empty (MMA never uses the name)
```

**No Julia REPL invocation needed** (no `julia --project=. -e 'using TensorCategories; …'` — pure source-level audit; Oscar compilation would add multi-minute overhead with no audit benefit).

## Conclusion

LB-3 (`cft-anyons-pvu`) **discharged with one substantive finding** (the `FusionCategory` AMBIGUOUS case, deferred to a P8.0a-followup bd issue rather than silently corrected). All other TC.jl citations in GLOSSARY and CONVENTIONS verify against the actual TC.jl 0.5.3 source at the MMA-pinned tree-sha. The P1.8 `multiplication_table` fix landed correctly. **Phase 8 P8.1 is unblocked** subject to the P8.1 implementer / reviewer making a call on the AMBIGUOUS `FusionCategory` case (which they can do without semantic risk because no current code path depends on the name).
