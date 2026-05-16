# Stocktake: cft-anyons-deprecated/ — Auxiliary Directories

**Slice:** `tex/`, `references/`, `results/`, `scripts/`
**Date:** 2026-05-16
**Status:** Read-only survey

---

## 1. Scope

This report covers four auxiliary subdirectories of `/home/tobias/Projects/cft-anyons-deprecated/`:

| Directory | Files | Character |
|---|---|---|
| `tex/` | 1 `.tex` + 4 build artifacts | Primary formalisation document |
| `references/` | 15 PDFs + `text/` (17 txt/md) + `manifest/` + `text/deprecated/` (5 txt) | Local reference library with provenance manifest |
| `results/` | `CHECKS.md` + 3 empty subdirs (`julia/`, `lean/`, `wolfram/`) | Command-log-only; no binary output files |
| `scripts/` | `julia/` (25 `.jl`) + `wolfram/` (25 `.wls`) | Numerical/symbolic verification scripts |

---

## 2. File-by-File Inventory

### 2.1 `tex/`

**`cft_anyons_formalisation.tex`** (1544 lines, dated 2026-05-14)

The document is titled *Formal Definitions, Results, and Provenance for Categorical Fine Graining*. It has eight sections:

| Section | Content summary |
|---|---|
| §1 Status and Ground Rules | Six-point acceptance gate (local source + AF node + Lean + Julia + WolframScript + adversarial verifier) |
| §2 Local Source Provenance | Table of 10 `SRC-*` identifiers with local file paths and line locators |
| §3 Categorical Background | Definitions of fusion category, unitary fusion category, skeletal finite model, local occupation object Q, Hilbert space H_N^W |
| §4 General Theorem Targets | Finite versions of all major structural theorems (configs, direct sums, Q skeleton, Fock space, braid matrices, fine-graining isometry, postcomposition, component orthogonality, tensor isometry, tensor powers, dressing) — each labelled "accepted" or "pending" |
| §5 Finite-Dimensional Linear Algebra | Polar section, amplitude formula, ascending channel, diagonal scaling — finite coordinate versions |
| §6 Fibonacci Data | Fusion rules, golden ratio constants, F-matrix, Perron–Frobenius amplitudes, coassociativity, braid unitarity |
| §7 Renormalization Input and Scaling Operators | h_tau = 2/5 sourced from KZ; chiral OPE exponents; RG no-mixing rows; conditional diagonal scaling |
| §8 Temperley–Lieb and Ising Secondary Target | Ising fusion rules, Delta_sigma = 1/8, Delta_epsilon = 1, rational exponent 3/4 |
| §9 Continuum Structure and Conjectures | Direct-limit H_infty^W; coherent family conjectures; six conjectures (topological fixed points, Wilsonian trajectory, universal isometry, braiding) |
| §10 Current Machine-Checked Artefacts | Brief checklist pointing to `results/CHECKS.md` and `MASTER_PROVENANCE.md` |

Build artifacts: `.aux`, `.log`, `.out`, `.toc`, `.pdf` — all present, confirming the document compiled successfully.

### 2.2 `references/`

**15 PDFs** (primary local sources):

| Local ID | Filename | Use in formalisation |
|---|---|---|
| SRC-FIB-TREBST-LOCAL | `FibonacciAnyonModels.pdf` | Fibonacci fusion rules, F-matrix, R-matrix |
| SRC-FIB-TREBST-ARXIV | `TrebstShortIntroductionFibonacciAnyons.pdf` | Golden ratio quantum dimension |
| SRC-GOLDEN-CHAIN | `GoldenChainFeiguinEtAl.pdf` | F-matrix (second source) — **this is Feiguin et al.** |
| SRC-KZ-FIB | `IsingLikeFibonacciAnyonsKZ.pdf` | Conformal weight h_tau = 2/5 |
| SRC-TL-JONES | `TemperleyLiebRootsJonesQuotient.pdf` | TL and Jones quotient background |
| SRC-ISING-CHAIN | `PoilblancOneDimensionalItinerantInteractingAnyons.pdf` | Ising labels, Delta_sigma, Delta_psi |
| SRC-STRING-NET | `StringNetCondMat0510613.pdf` | String-net F-symbols, quantum dimensions |
| SRC-PENNEYS-UFC | `text/PenneysUnitaryFusionCategories.md` | UFC background, direct sums, polar decomposition |
| SRC-DEFECT-FOCK | `GaugingDefectsQuantumSpinSystems.pdf` | Fusion category defs, Fock-space direct sums |
| SRC-OAR-WAVELETS | `OARWavelets.pdf` | Operator-algebraic renormalization, isometric wavelet maps |
| SRC-OAR-FERMIONS | `CFTFromLatticeFermions.pdf` | OAR and Koo–Saleur (Osborne–Stottmeister 2107.13834) |
| SRC-OSBORNE-CONTINUUM | `OsborneContinuumLimitsQuantumLatticeSystems.pdf` | Continuum limits |
| SRC-GARJANI-PAIRING | `GarjaniArdonneAnyonChainsPairing.pdf` | Anyon chains with pairing |
| SRC-HOLLANDS-CHAINS | `HollandsAnyonicChainsAlphaInduction.pdf` | Alpha-induction, FRS references |
| SRC-POILBLANC-PRL | `PoilblancFractionalizationItinerantAnyons.pdf` | Fractionalization of itinerant anyons |

**Reference format:** PDFs are the canonical sources; each has a plain-text extraction in `references/text/` (`.txt` or `.md`). The manifest at `references/manifest/SOURCES.md` records SHA256 hashes for both PDFs and extracted texts. No BibTeX files are present; provenance is by line-locator strings (e.g., `references/text/FibonacciAnyonModels.txt:272`).

**`references/text/deprecated/`** — 5 files retained as "import provenance only":

| Filename | Paper |
|---|---|
| `1608_04927.txt` | Garjani & Ardonne, *Anyon Chains with Pairing Terms* (arXiv:1608.04927) — **contains Feiguin et al. [15] and Pasquier [30,48] in references** |
| `1901_06124.txt` | Osborne, *Continuum Limits of Quantum Lattice Systems* (arXiv:1901.06124) |
| `2002_01442.txt` | Stottmeister et al., *Operator-algebraic renormalization and wavelets* (arXiv:2002.01442) — **contains Koo-Saleur formula citations [18]** |
| `2107_13834.txt` | Osborne & Stottmeister, *Conformal field theory from lattice fermions* (arXiv:2107.13834) — **contains extensive Koo–Saleur discussion** |
| `2205_15243.txt` | Hollands, *Anyonic chains–alpha-induction–CFT–defects–subfactors* (arXiv:2205.15243) — **contains FRS [4] and Huse [22,23] references** |

These were superseded by normalised text extractions for the primary PDFs now in `references/`. They are not used in any active source locators.

### 2.3 `results/`

The subdirs `julia/`, `lean/`, and `wolfram/` are all **empty**. No binary output files were ever saved. All recorded verification evidence lives in `results/CHECKS.md` (1035 lines), which is a structured command log recording:
- Commands run
- Pass/fail outcomes (all passes)
- AF verifier IDs and acceptance dates (2026-05-14 and 2026-05-15)
- Scope caveats for each accepted node

### 2.4 `scripts/`

**25 Julia scripts** in `scripts/julia/` and **25 matching WolframScript files** in `scripts/wolfram/`. Every Julia script has an exact `.wls` counterpart. The naming pattern maps directly to Lean modules:

| Script stem | Lean module(s) | AF node(s) |
|---|---|---|
| `fusion_rules_checks` | `Formalisation/Fibonacci/FusionRules.lean` | 1.3.8 |
| `fibonacci_checks` | `Formalisation/Fibonacci/Basic.lean`, `Binary.lean`, `Coassoc.lean`, `RGNoMixing.lean` | 1.3.1–1.3.7, 1.3.12–1.3.17, 1.5.16 |
| `configuration_checks` | `Formalisation/Foundations/Configurations.lean` | 1.2.1 |
| `direct_sum_coordinate_checks` | `Formalisation/Foundations/DirectSumCoordinates.lean` | 1.2.2 |
| `direct_sum_projection_checks` | same | 1.2.3 |
| `direct_sum_orthogonal_checks` | same | 1.2.4, 1.2.8 |
| `configuration_space_checks` | `Formalisation/Foundations/ConfigurationSpace.lean` | 1.2.5 |
| `project_definition_checks` | `Formalisation/Foundations/ProjectDefinitions.lean` | 1.2.6 |
| `truncated_fock_checks` | `Formalisation/Foundations/FockSpace.lean` | 1.2.9 |
| `linear_algebra_checks` | `Formalisation/LinearAlgebra/Isometry.lean` | 1.4.1, 1.4.3, 1.4.10, 1.4.11 |
| `linear_algebra_trace_checks` | `Formalisation/LinearAlgebra/Trace.lean` | 1.5.2, 1.5.8–1.5.14 |
| `fine_graining_definition_checks` | `Formalisation/LinearAlgebra/FineGraining.lean` | 1.4.12, 1.4.14 |
| `postcompose_isometry_checks` | `Formalisation/LinearAlgebra/Postcompose.lean` | 1.4.4, 1.4.8 |
| `component_orthogonality_checks` | `Formalisation/LinearAlgebra/Component.lean` | 1.4.2 |
| `tensor_isometry_checks` | `Formalisation/LinearAlgebra/Tensor.lean`, `HeterogeneousTensor.lean` | 1.4.3, 1.4.10, 1.4.11, 1.4.16 |
| `tensor_power_checks` | `Formalisation/LinearAlgebra/TensorPower.lean` | 1.4.7, 1.4.15 |
| `polar_section_checks` | `Formalisation/LinearAlgebra/Polar.lean` | 1.4.5, 1.4.9, 1.4.13 |
| `diagonal_scaling_checks` | `Formalisation/LinearAlgebra/DiagonalScaling.lean` | 1.5.3 |
| `cft_weight_checks` | `Formalisation/Fibonacci/CFTWeights.lean` | 1.5.5, 1.5.7, 1.5.15 |
| `coherent_system_checks` | `Formalisation/LinearAlgebra/CoherentSystem.lean` | 1.5.6, 1.5.10 |
| `fibonacci_braid_checks` | `Formalisation/Fibonacci/BraidMatrices.lean` | 1.3.10 |
| `fibonacci_braid_unitarity_checks` | `Formalisation/LinearAlgebra/Isometry.lean` | 1.3.11 |
| `ising_toy_checks` | `Formalisation/Ising/Basic.lean` | 1.8 |
| `coassoc_unique_checks` | `Formalisation/Fibonacci/Coassoc.lean` | 1.3.12, 1.3.16, 1.3.17 |
| `charge_only_negative_checks` | `Formalisation/LinearAlgebra/ChargeOnly.lean` | 1.5.4 |

The four additional `configuration_checks`, `coassoc_unique_checks`, `charge_only_negative_checks`, and `ising_toy_checks` scripts have no exact name match in the prompt's listed set but correspond to additional Lean modules found in the full Formalisation tree.

---

## 3. Key Concepts and Artifacts

### 3.1 The tex document's epistemic stance

Every claim is triple-checked (Lean + Julia + WolframScript) and adversarially verified before being marked "accepted". The acceptance scope notes attached to each AF node are unusually narrow — e.g., the Fibonacci F-matrix result is accepted only "as a real 2×2 matrix algebra claim," explicitly not as a categorical F-move theorem. This pattern is consistent throughout.

### 3.2 What is formally accepted (all AF-verified as of 2026-05-15)

**Fibonacci block:** constants (φ² = φ+1, D²=2+φ), F-matrix orthogonality/involutivity, PF normalizations, binary eta isometry (5×2 matrix), coassociative scalar uniqueness and fractional-power identities, coassociative binary eta Gram identity, PF binary eta dimension-formula coefficients, finite fusion table, finite skeletal data structure, RG no-mixing row normalizations, tau-to-tau-tau probability bounds.

**Configurations and direct sums:** ordered configuration combinatorics, finite direct-sum coordinate equivalence, projection/inclusion equations, orthogonal direct-sum coordinate isometry, configuration-space flattening, Q and H_N^W coordinate skeleton, truncated Fock coordinate skeleton.

**Linear algebra:** isometry under unitary dressing, channel unitality/star/trace preservation, Gram-form positivity, PSD preservation under congruence and amplified congruence, finite Kraus-sum channel algebra, logical-lift code projection, postcomposition Gram preservation and square-test converse, component orthogonality equivalence, two-factor and three-factor Kronecker isometry, N-factor heterogeneous Kronecker isometry and dressing, fixed-map tensor-power isometry, conditional polar-section algebra, diagonal-Gram inverse square-root, one-row no-mixing polar-section formula.

**CFT weights:** h_tau = 2/5 (sourced from KZ as SU(2)_3 level-3 WZW spin-1), chiral OPE exponents −4/5 and −2/5, doubled exponents −8/5 and −4/5, descendant exponents, diagonal Δ_tau = 4/5.

**Secondary (Ising):** finite Ising fusion table, Δ_epsilon − 2Δ_sigma = 3/4, normalisation numerator 1 + t²/4.

**Coherent systems:** ascending observable composition A_nm ∘ A_ml = A_nl, logical-lift composition L_ml ∘ L_nm = L_nl.

### 3.3 What is NOT accepted / remains pending

- Categorical construction of Q, Q^⊗N, Hom functors, categorical tensor products
- Pentagon equations, associators, F-symbol categorical semantics
- Full polar decomposition (positive square-root existence for general positive matrices)
- Wilsonian derivation of RG coefficients; physical Kraus representation
- Braid group action on Q^⊗N; categorical braiding
- Completed direct limit H_∞^W; continuum Hilbert space
- Temperley–Lieb quotient, full Ising category, full CFT spectrum
- Koo–Saleur lattice Virasoro generators (referenced in sources but not formalised here)

### 3.4 Reference notes that bear on `cft-anyons/summary.tex` flagged items

See Section 5 for the full analysis.

---

## 4. State Assessment

| Dimension | Status |
|---|---|
| Tex document | Coherent, internally consistent, recently dated (2026-05-14). No stale or contradictory entries found. |
| Reference library | Well-curated: 15 PDFs with SHA256-hashed extractions and line locators. No BibTeX. |
| Deprecated refs | Retained correctly as import provenance; clearly labelled; not used in active claims. |
| Results dirs | Empty — no binary artifacts. Evidence is text-only in `CHECKS.md`. |
| Scripts | Complete Julia + WolframScript mirror set for every Lean module. Scripts are functional and recently authored. |
| Lean build | Reported passing against Mathlib with Lean v4.30.0-rc2 as of 2026-05-15. |
| Three-way checks | All 25 module-groups have Lean + Julia + WolframScript coverage, all reporting PASS. |
| Scope discipline | Very strict. Each accepted node explicitly lists what is NOT proved. No overclaiming detected. |
| Gap to summary.tex goals | Substantial. The formalisation is a finite-coordinate skeleton; the categorical, analytic, and physical layers are all pending. |

Why are some references "deprecated"? The five files in `text/deprecated/` were earlier extracted text files for papers that were subsequently either (a) superseded by dedicated PDFs now in the primary reference set (1901_06124 → `OsborneContinuumLimitsQuantumLatticeSystems.pdf`; 2002_01442 → `OARWavelets.pdf`; 2107_13834 → `CFTFromLatticeFermions.pdf`) or (b) not used as direct sources for any active claim (1608_04927, 2205_15243). They are retained as import-provenance audit trail, consistent with the manifest note.

---

## 5. Overlap with `cft-anyons/summary.tex` — Unchecked Items Analysis

The following items are flagged `\unchecked` in `summary.tex`. Here is what this repo contains for each:

### Feiguin et al. (Golden Chain)
**Status in this repo: DISCHARGED for the specific claim used.**
`GoldenChainFeiguinEtAl.pdf` is SRC-GOLDEN-CHAIN. It is used as a second local source for the Fibonacci F-matrix (line 109 of extracted text). The F-matrix orthogonality and involutivity are formally proved (AF node 1.3.2, accepted). The full paper's physical content (energy spectrum of the golden chain, numerical diagonalization) is not formalised, but the F-matrix data specifically cited in summary.tex is discharged.

### Koo–Saleur (lattice Virasoro generators)
**Status in this repo: NOT DISCHARGED as a formal result.**
The Koo–Saleur formula is *cited* heavily inside the extracted text of `CFTFromLatticeFermions.pdf` (SRC-OAR-FERMIONS = arXiv:2107.13834, Osborne–Stottmeister). It is also mentioned in deprecated files 2002_01442 and 2107_13834. However, no AF node in this repo formalises the Koo–Saleur approximants or their convergence. The formalisation explicitly marks this as out of scope. The paper itself (Osborne–Stottmeister) is locally available and proves the convergence theorem, so the mathematical claim has a local source — but the Lean/Julia/WolframScript triple-check gate has not been passed.

### Osborne–Stottmeister (CFT from lattice fermions, arXiv:2107.13834)
**Status: locally available as both primary text and deprecated text.**
`CFTFromLatticeFermions.pdf` = SRC-OAR-FERMIONS is a primary reference. It is used for "operator-algebraic renormalization and isometric wavelet refinement maps." The coherent system checks (AF nodes 1.5.6 and 1.5.10) and the direct-limit definition both cite this source. The coherent ascending/logical-lift finite matrix results are formally accepted. The deeper analytic content (Theorem A on Koo–Saleur convergence, Virasoro nets) is not formalised.

### FRS (Fröhlich–Fuchs–Runkel–Schweigert)
**Status: present only as a bibliography entry in deprecated files.**
FRS [4] appears in the reference list of the deprecated `2205_15243.txt` (Hollands). It does not appear as a `SRC-*` identifier, is not cited in the tex doc, and has no local PDF. **Not discharged; no local source.**

### Pasquier
**Status: present only as bibliography entries in deprecated files.**
Pasquier [30] and [48] appear in the reference list of deprecated `1608_04927.txt` (Garjani–Ardonne). No local Pasquier PDF exists; no `SRC-*` entry. **Not discharged; no local source.**

### Huse
**Status: present only as bibliography entries in deprecated files.**
Huse appears as co-author in references [22] and [23] of deprecated `2205_15243.txt` (Hollands). No local PDF or SRC entry. **Not discharged; no local source.**

### Osborne–Stottmeister (OAR wavelets, arXiv:2002.01442)
**Status: locally available as SRC-OAR-WAVELETS.**
`OARWavelets.pdf` is in the primary library. The coherent-system verifier (1.5.6) explicitly checked this source (noting that the PDF was needed because the text extraction is column-interleaved). The isometric wavelet refinement map concept is locally sourced and the finite coherence algebra is formally accepted.

### (G₂)₁ model
**Status: not present.**
No reference to G₂ or (G₂)₁ appears anywhere in the tex, references, or scripts.

### Summary table

| `\unchecked` item in summary.tex | Local PDF? | Formally proved here? |
|---|---|---|
| Feiguin et al. (F-matrix data) | Yes (SRC-GOLDEN-CHAIN) | Yes — F-matrix algebra, AF 1.3.2 |
| Koo–Saleur (lattice Virasoro) | Indirect (in SRC-OAR-FERMIONS text) | No — only finite coherence algebra proved |
| Osborne–Stottmeister (2107.13834) | Yes (SRC-OAR-FERMIONS) | Partial — finite coherence matrix results accepted |
| Osborne–Stottmeister (OAR wavelets) | Yes (SRC-OAR-WAVELETS) | Partial — finite coherence matrix results accepted |
| FRS | No | No |
| Pasquier | No | No |
| Huse | No | No |
| (G₂)₁ | No | No |

---

## 6. Recommended Disposition

1. **Tex document (`cft_anyons_formalisation.tex`):** Keep as the definitive machine-readable provenance record for this formalisation phase. It is more structured and rigorous than `cft-anyons/summary.tex` for the finite-coordinate claims it covers, and should be referenced (not replaced) when upgrading claims in the active project.

2. **Reference library (PDFs + extracted texts + manifest):** Adopt into `cft-anyons/` as-is. The SHA256-hashed provenance chain is the most valuable asset here. The 15 local PDFs cover Feiguin et al., both Osborne–Stottmeister papers, the Hollands alpha-induction paper (which contains FRS in its bibliography), and all Fibonacci/Ising sources. Priority for new procurement: a dedicated local PDF for the original Koo–Saleur paper (1994), and PDFs for Pasquier and FRS.

3. **Deprecated reference texts:** Retain exactly as-is. They contain useful reference lists (Pasquier, FRS, Huse citations with enough bibliographic detail to identify the papers for procurement).

4. **Results directories:** The empty `julia/`, `lean/`, `wolfram/` subdirs are vestigial; `results/CHECKS.md` is the actual record. Consider moving `CHECKS.md` to `tex/` or top-level since the binary dirs are unused.

5. **Scripts:** Adopt the full Julia + WolframScript corpus into `cft-anyons/` if Lean formalisation continues. The script-per-Lean-module pattern is systematic and should be preserved. The `cft_weight_checks.jl` script in particular provides the exact rational arithmetic for h_tau = 2/5 and all descendant exponents — directly relevant to `cft-anyons/summary.tex` §§ on Fibonacci CFT weights.

6. **Koo–Saleur gap:** This is the most significant gap between this repo and `cft-anyons/summary.tex` goals. The local `CFTFromLatticeFermions.pdf` (Osborne–Stottmeister) proves convergence of Koo–Saleur approximants, but the result is not formalised in Lean/Julia/WolframScript. This should be flagged as a Priority 1 target for the next formalisation session, building on the existing `CoherentSystem.lean` infrastructure.

7. **FRS, Pasquier, Huse:** These are genuinely absent. The deprecated file `2205_15243.txt` (Hollands) contains enough bibliographic information to identify all three for PDF procurement. Until local PDFs exist, any claims in `summary.tex` citing these authors cannot be sourced under the acceptance gate used in this repo.
