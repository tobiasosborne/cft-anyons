# Stocktake: microscopic-mobile-anyons — TeX, Literature, and archive/v0

**Slice:** `tex/`, `literature/`, `archive/v0/`
**Date:** 2026-05-16
**Examiner:** Claude Sonnet 4.6 (read-only)

---

## 1. Scope

This report covers three sub-trees of `/home/tobias/Projects/microscopic-mobile-anyons/`:

| Sub-tree | Approx. file count | Focus |
|---|---|---|
| `tex/` | 11 files (1 built PDF excluded) | Working paper draft |
| `literature/` | ~389 files (134 md, 50 PDFs, 4 archive, 2 DB, 2 synthesis) | Curated bibliography |
| `archive/v0/` | ~174 files | Prior-generation full project |

The sibling project `cft-anyons/summary.tex` (2483 lines) is used as a comparison target throughout.

---

## 2. File-by-File Inventory

### 2a. `tex/` — Working Paper

| Path | Lines | Status / Notes |
|---|---|---|
| `tex/main.tex` | 83 | Skeleton: title, abstract (`TODO`), single `\input{sections/finegraining}`, 5-entry bibliography |
| `tex/sections/finegraining.tex` | 291 | **The only substantive section** — see §3 below |
| `tex/tikz_styles.tex` | (small) | TikZ macro library, included by main |
| `tex/tikz_test.tex` | (small) | Test/scratch TikZ file |
| `tex/figures/.gitkeep` | — | Empty placeholder |
| `tex/main.{aux,log,out,toc,pdf}` | — | Build artifacts; PDF excluded from read |

### 2b. `literature/` — Bibliography System

| Path | Notes |
|---|---|
| `literature/SURVEY.md` | ~520-line auto-generated catalog. Source of truth is `db/papers.sqlite`. 5-tier taxonomy (Tier 1 = directly defines var-N anyon Fock; Tier 5 = adjacent/abelian). Contains 630 papers, 702 citation edges (as of SYNTHESIS.md 2026-04-27). |
| `literature/SYNTHESIS.md` | Hand-curated narrative companion (~350+ lines read). Describes two lineages, identifies gaps, plots where each paper fits. |
| `literature/references.bib` | Auto-generated BibTeX; do not edit by hand. |
| `literature/db/schema.sql` | Full SQLite schema (tables: `papers`, `authors`, `paper_authors`, `citations`, `seeds`, `crawl_log`, `file_provenance`). Well-designed; supports tiers, bib keys, arXiv/DOI/S2/OpenAlex/InspireHEP IDs, provenance. |
| `literature/db/seed_existing_pdfs.json` | 465-line JSON seed file mapping original PDF filenames → canonical slugs + metadata. |
| `literature/pdfs/` | 50 PDFs — canonical slugs (arXiv IDs or descriptive names). |
| `literature/md/` | 126 subdirectories (one per paper). Each contains a `.md` (full paper text extracted by OCR/Mathpix, with section headers preserved) and a `_meta.json` (structured layout/TOC from PDF parser). Format is **extracted full-text + layout metadata**, not short annotations. |
| `literature/_archive/` | 4 files: `catalog.md`, `README.md`, `overview.md`, `review.md` — earlier pre-DB annotation system, now superseded. |

**Paper count:** SURVEY.md header states 630 papers in the SQLite DB; 126 have dedicated `md/` subdirs; 50 have local PDFs. The remaining ~500 are metadata-only or stubs.

**Topics covered (from SURVEY tiers):**
- **Tier 1:** Variable-N anyon Fock space, pair creation (Garjani–Ardonne), itinerant Ising/Fibonacci chains (Poilblanc group), 2025 FCI/FQAH superconductivity burst (Shi–Senthil, Divic–Zaletel, Nakajima–Goldman)
- **Tier 2:** Dense anyonic chain ancestry — golden chain (Feiguin 2007), Trebst phase diagrams, DeGottardi, Finch–Frahm–Lewerenz–Milsted–Osborne, Hollands 2022, Stottmeister 2022
- **Tier 3:** Categorical/mathematical foundations — Etingof–Nikshych–Ostrik, EGNO book, Kitaev 2006, Penneys notes, OAR trilogy (Osborne 2019, Stottmeister–Morinelli 2020, Osborne–Stottmeister 2021)
- **Tier 4:** Numerical methods — MPS/anyonic tensor networks (Singh–Pfeifer–Vidal, Ayeni, Kirchner)
- **Tier 5:** Abelian anyons, Majorana/Kitaev, Girardeau, FQH background

### 2c. `archive/v0/` — Prior-Generation Project

| Sub-tree | Files | Notes |
|---|---|---|
| `tex/main.tex` + 24 sections | ~3700 lines of LaTeX total | Full draft with 4 Parts; sections listed below |
| `tex/appendices/` | `.gitkeep` only | Empty |
| `tex/figures/` | 7 SVG files | Spacetime diagrams, Fibonacci, dilute/busy diagrams |
| `src/julia/` | ~30 files across 5 modules | `FusionCategories`, `Lattice`, `MobileAnyons`, `QMLattice`, `Examples` |
| `src/clojure/` | `.gitkeep` | Empty — planned but never implemented |
| `src/lean/` | `.gitkeep` | Empty — planned but never implemented |
| `tests/` | 9 test files | `test_fusion_categories.jl`, `test_tc_fibonacci.jl`, `test_tc_ising.jl`, `test_svec_verification.jl`, `test_qmlattice.jl`, etc. |
| `docs/` | 19 markdown files | Modular concept docs (hilbert_space, operators, hamiltonian, diagrammatic_calculus, etc.) |
| `reviews/` | 5 files | Critical reviews from 2025-12 to 2026-01 |
| `plans/` | 1 file | `tensorcategories_refactoring_guide.md` |
| `history/` | 1 file | `2025-12-10_initial_setup.md` |
| `proofs/` | `_overview.md` only | Lamport-protocol stub, no actual proofs written |
| `notes/` | `spacetime.PNG` + `.gitkeep` | One image, otherwise empty |
| `literature/` | 3 subdirs (`md/`, `julia/`, `overview.md`) | Older literature notes; a subset of the main `literature/` |
| `.beads/` | SQLite + JSONL | Issue tracker state |
| Root config files | `AGENTS.md`, `symbols.yaml`, `citations.yaml`, `research_plan.md`, `tech_specs.md`, `DEPRECATED.md`, `Project.toml`, `Manifest.toml` | Project governance |

**Archive v0 tex sections (all present):** introduction, fusion_ring, fusion_category, morphism_spaces, diagrammatic_calculus, fusion_tree_basis, fusion_category_examples, temperley_lieb, fock_space, qm_lattice, lattice, config_space, hilbert_space, operators, hardcore_softcore, matrix_elements_2local, hamiltonian_v0, hamiltonian_v1, hamiltonian_free, module_categories, boundary_conditions, braiding_particle_ordering, svec_verification.

---

## 3. Key Concepts / Artifacts

### `tex/sections/finegraining.tex` — the current working result

This is the substantive content of the live project. It develops **fine-graining isometries** V: H_N(L) → H_N(2L) (and number-changing variants) for mobile anyons. Key results:

- **Product map** (Haar): exact isometry for any C, any particle number N, proved via disjoint fine-site supports (Proposition at line 36).
- **Failure of D4 product map**: deficit |V†V - I| ≈ 0.11 for adjacent particles; D4 supports overlap.
- **Slater determinant lift** `Λ^N(R) ⊗ I`: isometry for single-species categories (Fibonacci τ, sVec ψ) via Cauchy–Binet; fails for multi-species (Ising σ+ψ).
- **Normalized product map** (Theorem, lines 109–116): universal — divides each column by its norm g(x); g depends on positions only, not on categorical data (F/R-symbols). Verified numerically for sVec, Fibonacci, Ising with Haar and D4, L=3,4,5.
- **Number-changing isometry** (Proposition, lines 209–220): V = V₀ + V₂ where V₂ is built from Garjani–Ardonne pair creation h† via 3-step orthogonalization (projection → Löwdin → scaling). Verified to ‖V†V - I‖ < 10⁻¹⁴ for Fibonacci and Ising, L=3,4, D4 wavelet.
- **Hamiltonian intertwining residuals** tabulated (lines 239–244): number-changing slightly outperforms normalized product.
- **Inductive limit** connection to OAR C*-algebra `A_∞ = varinjlim A_N` established in §2.8.
- **Physical interpretation**: pair creation fills the hard-core deficit left by overlapping wavelet supports; first evidence Garjani–Ardonne pairs enter the OAR continuum limit.

### `literature/` — the DB-backed bibliography

The SQLite schema (`db/schema.sql`) is properly designed with foreign keys, status enum, tier field, S2/OpenAlex/InspireHEP IDs, and crawl_log. SURVEY.md and references.bib are auto-generated views. SYNTHESIS.md (hand-curated) is the most analytically valuable text in the literature subtree.

Per-paper `md/` entries are **full extracted text** (OCR/Mathpix output), not short annotations. The `_meta.json` files are layout metadata from the PDF parser. The SURVEY.md notes fields contain the substantive human annotations.

### `archive/v0/` — the prior generation

The v0 project is a full draft with 23 TeX sections, ~30 Julia files, 9 tests, and 19 concept docs. It has **no actual Lean code** (src/lean/ is a .gitkeep). Clojure is similarly empty. The Julia code wraps TensorCategories.jl (Oscar.jl backend) for the category layer. The Hilbert-space construction (MobileAnyons/hilbert.jl) implements the same Fock-space definition as the current project but at an earlier stage.

---

## 4. State Assessment

### `tex/` — current draft

- `main.tex` (line 44): abstract is `TODO: Write after results are in.` — the paper is structurally incomplete; only one section exists.
- `finegraining.tex` contains completed mathematical content with proofs and numerical tables. Claims 1 and 2 (diagonal Gram matrix; position-only normalization) are labeled as **claims** verified numerically but not proved — potential weak points.
- The 5-entry bibliography in main.tex is minimal and inconsistent with the 630-entry SQLite DB.

### `literature/` — strong

- SYNTHESIS.md (line 20–21): "630 papers, 702 citation edges, 350+ local PDFs, 16 anchor seeds." This is a mature, well-organized bibliography system.
- The DB schema supports citation graph traversal, tier filtering, and provenance tracking — all functional infrastructure.
- `_archive/` entries reference PDF filenames (e.g., `feiguin_golden_chain_2006.pdf`) that do not match the canonical slugs in `pdfs/` (arXiv IDs). These are stale references from before the renaming/canonicalization.
- Spot-checked entries (1608.04927, 2201.11562, 1704.04221, 1910.10619): format varies. Some md/ entries are raw OCR of full papers with publisher formatting noise; others are cleaner. The _meta.json files are large layout blobs (structure from Mathpix-style parsing), not human-readable.

### `archive/v0/` — substantively useful but flagged as buggy

The ultracritical audit (`reviews/ultracritical_audit_2026-01-03.md`, lines 17–20) identifies three stop-the-line issues:

1. **STL-1**: Vacuum/indexing convention is simultaneously three-way inconsistent: `docs/config_space.md` uses both `0 = vacuum` and `1 = vacuum`; Julia code uses `1 = vacuum` (config.jl:12,15); Hilbert docs use `0 = vacuum` (hilbert_space.md:39). Every matrix element calculation that touches vacuum is potentially wrong.
2. **STL-2**: Duplicate "Definition 4.2.5" in `docs/hilbert_space.md` (lines 71 and 90).
3. **STL-3**: Second-quantized operators (c†_j, b†_j) appear in formal Theorem statements in `tex/sections/hamiltonian_v0.tex:207,215` and `docs/svec_verification.md:126,152`, violating the project's own governance.

Additionally, `project_review_2025-12-11.md` flags: rigidity check too weak (equality not checked), Grothendieck ring API promised but unimplemented, Fock truncation ambiguity, corrupted notation in `fock_space.md`.

The `tensorcategories_refactoring_guide.md` shows the Julia code was mid-refactor from custom structs to TensorCategories.jl/Oscar — the refactor is incomplete (the wrapper in `FusionCategories/fusion_ring.jl` still has the svec_category returning Vec(Z/2) rather than true sVec, per the comment on lines 51–54).

**Lean status:** src/lean/ is empty (.gitkeep only). No Lean code was ever written in this generation.

---

## 5. Overlap with `cft-anyons/summary.tex`

The two projects are **complementary but diverge in emphasis**:

| Theme | `microscopic-mobile-anyons` (`tex/sections/finegraining.tex`) | `cft-anyons/summary.tex` |
|---|---|---|
| Core object | Fine-graining isometries V: H_N(L) → H_N(2L) for mobile anyons | Partition Hilbert spaces H^W_P = Hom_C(W, A_P); cellwise isometric refinement maps E_{P→P'} |
| Continuum limit | OAR inductive limit A_∞ = varinjlim A_N via wavelet scaling | Same OAR programme; more developed — Koo–Saleur lattice Virasoro, polar decomposition canonical sections |
| Fusion category role | C provides the Hilbert space structure; F/R-symbols enter only via the Hamiltonian | C provides both the Hilbert space (Hom-spaces) and the algebra-object comultiplication Δ = m†/√λ |
| Key examples | Fibonacci, Ising (multi-species σ+ψ), sVec | Fibonacci, Ising/Temperley-Lieb — worked in full detail |
| Pair creation | Central: Garjani–Ardonne h† used to fill wavelet deficit | Mentioned in passing (variable-N sectors); not the central construction |
| Number variation | Explicit N-changing isometry V = V₀ + V₂ | Present via Fock-space structure but not the primary focus |
| Wavelets | Daubechies D4, Haar — explicit filter coefficients | Same wavelet scaling functions for OAR but handled abstractly |
| Status | Single section with proved propositions + numerical verification | 2483-line distillation of 4 transcripts; more developed, more categories covered |

The fine-graining isometry in `finegraining.tex` is a **missing technical piece** in `cft-anyons`: how to go from H_N(L) to H_N(2L) when anyons are mobile and number-changing. The `cft-anyons/summary.tex` handles the partition Hilbert space and refinement maps E_{P→P'} for *fixed* anyonic content per partition cell, but does not address the hard-core collision deficit that arises from wavelet supports overlapping. The Garjani–Ardonne pair-creation resolution in `finegraining.tex` directly plugs this gap.

The literature DB in `microscopic-mobile-anyons/literature/` is far more comprehensive than anything in `cft-anyons/` and should be treated as the canonical bibliography for both projects.

---

## 6. Recommended Disposition

### `tex/sections/finegraining.tex` — **MIGRATE**
Migrate this section into the `cft-anyons` project (or a joint paper). The content is the most polished new mathematics in the MMA repo — proved propositions, numerical tables, physical interpretation. It directly extends the OAR framework that `cft-anyons/summary.tex` is built on. The abstract and introduction (`tex/main.tex`) need to be written before this becomes standalone.

### `tex/main.tex` (skeleton) — **KEEP AS SHELL / LOW PRIORITY**
Retain as a skeleton for eventual paper assembly, but do not invest effort in it until `finegraining.tex` is complete with more sections. The bibliography needs to be replaced with `\bibliography{../literature/references}`.

### `literature/` (entire subtree, especially `SURVEY.md`, `SYNTHESIS.md`, `db/`) — **KEEP / PROMOTE TO CANONICAL**
This is the most complete bibliography infrastructure in the three-project cluster. The SQLite schema, SURVEY.md, and SYNTHESIS.md are high-value assets. Designate `microscopic-mobile-anyons/literature/` as the canonical bibliography for all three projects. The `_archive/` sub-tree (4 files with stale filenames) can be ignored or deleted.

### `archive/v0/tex/sections/` (23 sections, ~3700 lines) — **ARCHIVE / SELECTIVE MIGRATE**
The v0 TeX contains developed content on fusion category preliminaries, Hilbert space, operators, hard-core/soft-core, matrix elements, Hamiltonians v0/v1/free, module categories, boundary conditions, diagrammatic calculus, and braiding. Much of this is **direct prerequisite material** for `finegraining.tex`. Recommend a selective migration pass: extract the sections covering fusion categories (fusion_ring, fusion_category, morphism_spaces, diagrammatic_calculus, fusion_tree_basis, fusion_category_examples) and the Hilbert space definition (hilbert_space, config_space, fock_space), after fixing the STL-1 indexing convention. Do not migrate the Hamiltonian sections until the vacuuum-indexing inconsistency is resolved.

### `archive/v0/src/julia/` (~30 files) — **ARCHIVE / KEEP FOR REFERENCE**
The Julia code is a useful implementation reference for the MobileAnyons Hilbert space and Hamiltonians. However, it has confirmed bugs (vacuum indexing, incomplete TensorCategories.jl refactor, unresolved rigidity check). Do not treat it as correct. It is not worth fixing the v0 code; instead, use it as a specification reference when reimplementing in the current project. The test files (`tests/`) encode the intended behavior and should be kept as specification documents.

### `archive/v0/src/lean/` — **DROP**
Empty (.gitkeep only). No Lean code exists in this generation; nothing to preserve.

### `archive/v0/src/clojure/` — **DROP**
Empty (.gitkeep only).

### `archive/v0/docs/` (19 concept docs) — **ARCHIVE / SELECTIVE MIGRATE**
The docs are well-structured modular concept writeups that complement the TeX sections. They contain the same STL-1 indexing bugs flagged in the reviews. Useful as a conceptual map of what the v0 project covered; worth reading when reconstructing the Hilbert space section, but not directly usable as-is. Do not migrate without a convention-fixing pass.

### `archive/v0/reviews/` (5 review files) — **KEEP / READ CAREFULLY**
The ultracritical audit (`ultracritical_audit_2026-01-03.md`) and the other reviews are high-signal — they correctly identify real bugs that would propagate into any migration. These should be the first files read before migrating any v0 content.

### `archive/v0/plans/tensorcategories_refactoring_guide.md` — **KEEP**
Documents the intended architecture (TensorCategories.jl backend via Oscar.jl). Useful if the current project needs to build similar Julia infrastructure.

### `archive/v0/literature/` (overlap with main literature/) — **DROP / MERGE**
The v0 literature subtree is a subset of the main `literature/` with older annotations. The main `literature/` is authoritative; the v0 copy can be ignored.

### `archive/v0/proofs/` — **DROP**
Only `_overview.md` (a stub with governance text). No actual proofs written.

### `archive/v0/.beads/` — **DROP**
Issue tracker state for a completed/abandoned generation.
