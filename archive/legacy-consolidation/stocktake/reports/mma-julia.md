# Stocktake: microscopic-mobile-anyons — Julia source

**Date:** 2026-05-16
**Examiner:** Claude (read-only static analysis)

---

## 1. Scope

**Examined (static read only):**
- `/home/tobias/Projects/microscopic-mobile-anyons/src/MobileAnyons/` — 11 `.jl` source files
- `/home/tobias/Projects/microscopic-mobile-anyons/test/` — 18 `.jl` test files
- `/home/tobias/Projects/microscopic-mobile-anyons/Project.toml` (full)
- `/home/tobias/Projects/microscopic-mobile-anyons/Manifest.toml` — deps section only (version pins for Oscar, TensorCategories, etc.)

**Intentionally skipped:**
- `archive/v0/` subtree (deprecated v0 codebase, separate module structure)
- `scripts/` — contains only literature-fetching Python/JS utilities, no physics code
- `src/scripts/` — same
- `literature/` and `archive/v0/docs/` — markdown/PDF literature review material
- Julia runtime execution (no `julia` calls, no test runs)
- `HANDOFF.md`, `prd.md`, `CLAUDE.md`, `README.md` — project management docs

---

## 2. File-by-file inventory

### `src/MobileAnyons/`

| File | Purpose |
|---|---|
| `MobileAnyons.jl` | Top-level module; `include`s all 10 subfiles; exports ~25 symbols |
| `config.jl` | `LabelledConfig` struct (positions + labels) and `enumerate_configs_hc` for hard-core N-anyon configurations on L sites |
| `hilbert.jl` | `FusionTree` and `AnyonBasis` structs; `enumerate_fusion_trees` (recursive left-associated); `build_basis` over all (N, c) sectors |
| `fsymbols.jl` | `FSymbolCache` wrapping `TensorCategories.six_j_symbols`; `build_fsymbol_cache`, `f_matrix`, `f_symbol`, `fusion_channels`, `left_intermediates`, `right_intermediates`; numerical conversion via `_physical_embedding` for number-field elements |
| `operators.jl` | `hopping_hamiltonian` and `hopping_hamiltonian_sector` (adjacency matrix of hard-core config graph, F-symbols not needed); `free_fermion_energies` (OBC single-particle levels) |
| `interaction.jl` | `interaction_hamiltonian` and `interaction_hamiltonian_sector`; nearest-neighbor vacuum-channel projector using Hermitian projector `P_H = vv†/|v|²` in TensorCategories' involutory gauge |
| `braiding.jl` | `RSymbolCache`, `build_rsymbol_cache`/`_manual`; `braiding_hamiltonian` and `braiding_hamiltonian_sector` (Hermitian, H = λ Σ(σ+σ†)); abelian shortcut for sVec; `tv_model_spectrum` reference solver; spectral decomposition of σ+σ† via orthogonal complement projectors |
| `paircreation.jl` | `dual_pairs`, `pair_creation_operator` (cross-sector N → N+2 via F-symbol vacuum column), `pair_hamiltonian` (Hermitian Δ(h†+h)); `_build_pair_intermediates` helper |
| `wavelets.jl` | `daubechies_filter` (Haar K=1, D4 K=2 only); `one_particle_scaling_map` (Löwdin orthogonalization for OBC boundaries); `one_particle_scaling_map_haar` (exact); `fine_graining_isometry_svec` (Slater determinant lift for free fermions) |
| `finegraining.jl` | `fine_graining_isometry` (product map V: H_L → H_{2L}); `trivial_embedding` (j → 2j-1); `normalized_product_isometry` (universal, column-normalize product map); `categorical_determinant_isometry` (braiding-weighted Slater generalization, marked "partial correction only (non-abelian)"); internal helpers for permutation sums and bubble-sort braiding composition |
| `virasoro.jl` | `bond_projectors_dense` (per-bond P_j matrices for dense chain); `hamiltonian_fourier_modes` (sine-transform modes H_n = Σ sin(πnj/L) P_j for OBC); `virasoro_commutator_check` (returns `c_estimate=NaN`, algebra error dict) |

### `test/`

| File | Coverage |
|---|---|
| `test_categories.jl` | Smoke test: TensorCategories Fibonacci (2 simples, τ⊗τ=1⊕τ), Ising (3 simples), sVec (Z/2) |
| `test_hilbert.jl` | sVec 2^L dimension, Fibonacci small basis counts (L=1,2,3) |
| `test_svec.jl` | sVec hopping Hamiltonian: Hermitian, spectrum matches free-fermion (SC1/SC2) |
| `test_fsymbols.jl` | Fibonacci F-symbols: size, involutory F²=I, trivial vacuum factors = 1 |
| `test_golden_chain.jl` | Dense Fibonacci interaction Hamiltonian: Hermitian, nonzero off-diagonal (SC5 entry) |
| `test_golden_chain_cft.jl` | Cardy finite-size scaling for c=7/10 extraction; gap-ratio tricritical Ising check; L=4..12 |
| `test_fibonacci_spectra.jl` | Fibonacci t-J model: Hilbert space dims, Hermiticity, dense limit → golden chain |
| `test_braiding_svec.jl` | sVec braiding: R^{ψψ}_1=-1 gives t-V model with V=-2λ |
| `test_braiding_nonabelian.jl` | Fibonacci/Ising braiding: σ+σ† = 2Re(R_τ)I + 2(Re(R_1)-Re(R_τ))P_vac spectral identity |
| `test_finegraining_svec.jl` | One-particle R†R=I (Haar/D4); many-body V†V=I per sector; Hamiltonian intertwining; Hamiltonian convergence; ground-state energy density → -2/π |
| `test_finegraining_fibonacci.jl` | Trivial embedding isometric; Haar product map V†V=I; label/charge preservation; intertwining for hopping and hopping+interaction |
| `test_categorical_lift.jl` | Auditions product/Slater/catdet/permanent maps; proves product map fails V†V≠I for D4; Slater=product spectra for Haar; D4 fidelity improvement |
| `test_paircreation.jl` | sVec pair creation amplitudes=+1; Hermiticity; N→N+2; total charge preserved; Fibonacci nontrivial amplitudes |
| `test_virasoro.jl` | Bond projectors sum to H; P²=P idempotency; non-adjacent projectors commute; Fourier modes Hermitian; [H_1,H_2]≠0 |
| `test_lift_audition.jl` | Ising mixed-label audition: product map isometric for Haar, fails D4; investigates label-grouped Slater and Löwdin approaches |
| `test_lift_investigations.jl` | Six parallel paths for multi-species fine-graining with overlapping supports (exploratory, not conclusive) |
| `test_number_changing_finegraining.jl` | Deficit analysis (G=V†V diagonal, deficit position-dependent); number-changing V=V₀+V₂ construction via Löwdin orthogonalization; isometry verification; Hamiltonian intertwining comparison |
| `test_convergence.jl` | Multi-step composition V_{L→4L}=V_{2L→4L}∘V_{L→2L} isometric; spectral convergence V†H_{2L}V ≈ aH_L+bI; D4 vs Haar quality; works for sVec, Fibonacci, Ising |

---

## 3. Key concepts and artifacts

**Fusion category machinery:**
- Left-associated fusion trees over hard-core configurations, organized by (N, c) sectors
- F-symbols extracted from `TensorCategories.six_j_symbols`; numerical conversion handles `QQFieldElem`, `AbsSimpleNumFieldElem`, `QQBarFieldElem` with physical embedding heuristic (largest real part of generator)
- R-symbols extracted from `braiding(S[i], S[j])`, block-diagonal parsing
- Three named categories: `fibonacci_category()`, `ising_category()`, `graded_vector_spaces(G)` for Z/2 (sVec)

**Gauge awareness:**
- The code explicitly notes that TensorCategories uses an involutory gauge (F²=I but F†≠F⁻¹) and compensates throughout with Hermitian projectors P_H = vv†/|v|² rather than raw F-column projectors. This is documented in comments in `interaction.jl` and `braiding.jl`.

**Fine-graining hierarchy (the central research object):**
- `trivial_embedding`: j → 2j-1 (always isometric)
- `fine_graining_isometry` (product map): isometric for Haar, fails for D4 — explicitly tested with `@test iso_err > 0.01`
- `normalized_product_isometry`: universal fix via column normalization; tested isometric for Haar/D4, Fibonacci, Ising
- `categorical_determinant_isometry`: braiding-weighted Slater generalization; exported with comment "partial correction only (non-abelian)"
- `fine_graining_isometry_svec`: Slater determinant lift (only correct for sVec)
- Number-changing V=V₀+V₂ construction in test file (not exported to module)

**Koo–Saleur Virasoro:**
- OBC sine-transform modes H_n = Σ_{j=1}^{L-1} sin(πnj/L) P_j implemented in `virasoro.jl`
- `virasoro_commutator_check` exists but returns `c_estimate=NaN` — the actual c extraction is done in `test_golden_chain_cft.jl` via Cardy fit with 3-parameter least squares

**Golden chain / CFT:**
- c=7/10 tricritical Ising extraction from L=4..12 spectra, with loose tolerance `@test abs(c_extracted - 0.7) < 0.15`

**Dependencies (Project.toml):**
- `TensorCategories = "0.5"`, `Oscar = "1.6"`, Julia ≥ 1.10
- Manifest pins Julia 1.11.7; Oscar is a heavy dep (GAP, Singular, Polymake, etc.)

---

## 4. State assessment

**Works (by static inspection):**
- Core data structures (`LabelledConfig`, `FusionTree`, `AnyonBasis`) are clean and self-consistent
- sVec/free-fermion path is fully worked out with multiple cross-validation tests
- Fibonacci golden chain interaction Hamiltonian and golden chain CFT test are comprehensive
- Non-abelian braiding Hamiltonian has a correct spectral decomposition approach for 2-channel case; general n-channel uses Gram matrix inversion
- `normalized_product_isometry` is the established universal isometry for number-preserving fine-graining
- Wavelet filter implementation covers the physically relevant cases (Haar, D4)

**Incomplete or partially broken:**
- `categorical_determinant_isometry`: exported with explicit comment "partial correction only (non-abelian)". The bubble-sort braiding composition in `_braiding_for_permutation` is mathematically coherent, but the export comment signals it has not been validated isometric for non-abelian categories. The test file `test_categorical_lift.jl` compares it against product/Slater but does not assert V†V=I for the catdet variant with non-abelian categories.
- `virasoro_commutator_check` returns `c_estimate=NaN` — it is a stub. The Koo–Saleur algebra check only verifies [H_1,H_2]≠0 qualitatively (line 119 of `test_virasoro.jl`), not the actual Virasoro commutator proportionality [L_m,L_n] ∼ (m-n)L_{m+n} + central extension. The comment at line 125 explicitly notes OBC prevents the full algebra.
- Soft-core occupancy: `build_basis` raises `error("Soft-core not yet implemented")` (hilbert.jl:81)
- Wavelets: only K=1,2 Daubechies; K≥3 raises `error(...)` (wavelets.jl:31)
- Number-changing isometry V=V₀+V₂ (`build_number_changing_isometry`) lives only in a test file (`test_number_changing_finegraining.jl`), not exported from the module. It can return `nothing` if the Gram matrix is near-singular.
- `_find_state_index` in `interaction.jl` (line 192–208) does a linear scan over all basis states, making interaction/braiding Hamiltonian construction O(n²) in basis size. This is noted implicitly by having a separate `sector` variant with a Dict index, but the global variants use the slow scan.

**No @test_broken or @test_skip markers found anywhere** — all tests are unconditional `@test` or `@testset` blocks. The loose tolerance `< 0.15` on the central charge is notable.

**Stale artifacts:**
- `archive/v0/` is explicitly deprecated (DEPRECATED.md present) and uses a different module structure; not analyzed.
- The `scripts/` and `src/scripts/` literature utilities are unrelated to the physics.

---

## 5. Overlap with cft-anyons/summary.tex

**Complements (implements concepts that summary.tex defines abstractly):**

- **Partition Hilbert spaces** (`summary.tex` §2, Eq. H_P^W = Hom_C(W, A_P)): MMA implements the *mobile* version of this — Hilbert spaces indexed by hard-core configurations on 1D lattices rather than by partitions of an interval. The fusion tree basis in `hilbert.jl` corresponds to choosing the decomposition of A_P via a left-associated basis for Hom(c, a_1⊗...⊗a_N). These are complementary realizations of the same abstract structure.

- **Cellwise isometric refinement maps E_{P→P'}** (`summary.tex` §2.3, Definition of refinement): `normalized_product_isometry` and `fine_graining_isometry` are the MMA realization. The MMA maps double the lattice (L → 2L) via wavelet scaling rather than refining a partition interval. `summary.tex`'s algebraic derivation via algebra-object comultiplication Δ=m†/√λ is absent from MMA; MMA uses geometric (wavelet) normalization instead.

- **Algebra object / comultiplication Δ** (`summary.tex` §3): Entirely absent from MMA. MMA never constructs an algebra object in the fusion category or derives refinement maps from it. The `normalized_product_isometry` is a purely geometric construction.

- **TL generators e_i = √2 P_i^(1)** (`summary.tex` §6, Definition 6.1): MMA's `interaction_hamiltonian` builds Σ P_j (vacuum projectors at each bond), which is exactly Σ e_i/√2 in the TL convention with d_σ=√2 (Ising) or d_τ=φ (Fibonacci). MMA does not use the TL normalization e_i = √2 P_i^(1) explicitly; it works directly with P_j. The golden chain H = Σ P_j in MMA is H = (1/d_σ) Σ e_i in summary.tex notation.

- **Koo–Saleur lattice Virasoro L_n** (`summary.tex` §7, Definition 7.5): MMA implements a real-OBC variant: H_n = Σ sin(πnj/L) P_j, whereas summary.tex defines the standard PBC complex exponential form L_n^(N) = (N/4π)[-κ Σ e^{2πinj/N}(e_j - e_∞)]. These differ in boundary conditions (OBC sine vs PBC exponential) and normalization, so they are not the same operator — MMA's OBC version is a different (weaker) approximation. `virasoro_commutator_check` also fails to extract c numerically; summary.tex flags Koo–Saleur as "unchecked" (line 2302 of summary.tex).

- **Fibonacci and Ising worked examples** (`summary.tex` §§4–5): MMA provides numerical F-symbols (from TensorCategories), Hilbert space construction, and golden chain spectra for both. Summary.tex works out Fibonacci algebra-object data analytically (a=√φ, b=φ^{-1/2}). These are complementary: MMA is numerical/computational, summary.tex is analytical/deductive.

- **Polar-decomposition canonical sections** (`summary.tex` §8.1): Absent from MMA. MMA uses Löwdin (symmetric) orthogonalization for the one-particle R matrix (`one_particle_scaling_map`, line 63–67 of wavelets.jl) which is the same operation, but does not connect this to the polar-decomposition framework developed in summary.tex.

**Convention differences:**
- MMA uses `vacuum = 1` as index into `simples(C)` and labels non-vacuum particles starting at 2. Summary.tex uses abstract simple objects and does not fix an indexing convention.
- MMA's F-symbol convention is TensorCategories' involutory gauge (F²=I, F†≠F⁻¹). Summary.tex implicitly assumes a unitary gauge. The Hermitian projector workaround in MMA is a *patch* for this mismatch.
- MMA's braiding Hamiltonian is H = λ Σ(σ+σ†). Summary.tex does not define a braiding Hamiltonian in this form.

**Contradicts or supersedes:**
- Nothing directly contradicted. MMA's fine-graining via normalized product map is a *different* construction from summary.tex's algebra-comultiplication refinement. They are competing approaches to the same problem; summary.tex §8 (length-weighted square-zero model) is the closer analog to MMA's geometric normalization, and the text explicitly notes (lines 992–996) that length-weighted refinement "abandons the algebra-derived refinement in favour of a kinematic Fock construction" — exactly what MMA does.

---

## 6. Recommended disposition

| Artifact | Disposition | Rationale |
|---|---|---|
| `config.jl`, `hilbert.jl`, `fsymbols.jl` | **Keep / migrate to cft-anyons** | Clean, well-documented implementations of fusion tree basis construction with TensorCategories. The `_physical_embedding` heuristic is a useful solved problem. Directly reusable if cft-anyons ever needs a computational backend. |
| `operators.jl` (hopping + free fermion) | **Keep** | Correct, simple, well-tested against free-fermion spectrum. Useful reference. |
| `interaction.jl` | **Keep** | Hermitian-projector gauge fix for involutory F-matrix is a solved problem worth preserving. The linear-scan `_find_state_index` should be replaced with a Dict before any serious use. |
| `braiding.jl` | **Keep** | Spectral decomposition of σ+σ† is physically correct and handles the 2-channel (Fibonacci/Ising) and general-n cases. The abelian shortcut is a useful sanity check. |
| `paircreation.jl` | **Keep** | Correct cross-sector operator; the `_build_pair_intermediates` helper is non-trivial. The number-changing isometry experiment in `test_number_changing_finegraining.jl` should be promoted to a module function if the construction proves sound. |
| `wavelets.jl` (Haar + D4 filters, Löwdin) | **Keep / migrate to cft-anyons** | The Löwdin orthogonalization for OBC boundary correction is the right approach and matches summary.tex §8's geometric spirit. Worth migrating as a reference implementation. Only K=1,2 supported — document that explicitly. |
| `finegraining.jl` (`normalized_product_isometry`) | **Keep as primary** | The established universal isometry for number-preserving fine-graining; tested across Fibonacci, Ising, sVec, Haar/D4. The `fine_graining_isometry` (raw product) should arguably be unexported or deprecated since it is not isometric for D4. |
| `finegraining.jl` (`categorical_determinant_isometry`) | **Archive or drop** | Exported with "partial correction only" warning; not validated isometric for non-abelian categories in any test. The mathematical idea (braiding-weighted Slater) is documented in `test_categorical_lift.jl` comments. Promote only if a test of V†V=I for Fibonacci+D4 passes. |
| `virasoro.jl` (`bond_projectors_dense`, `hamiltonian_fourier_modes`) | **Keep** | Bond projectors are correct and sum-to-H tested. Fourier modes are a valid OBC Koo–Saleur approximant. `virasoro_commutator_check` should either be completed or removed — returning `c_estimate=NaN` is misleading. |
| `test_golden_chain_cft.jl` | **Keep / migrate** | The Cardy fit for c=7/10 with L=4..12 is the most physically substantive result in the whole project. The loose tolerance (0.15) is appropriate for finite-size; this test documents the extraction methodology. Worth migrating the methodology to cft-anyons. |
| `test_lift_investigations.jl`, `test_lift_audition.jl` | **Archive** | Exploratory investigations that did not reach a definitive conclusion. Valuable as a record of what was tried (six parallel paths for multi-species fine-graining). Keep in archive, do not promote to module. |
| `test_number_changing_finegraining.jl` | **Archive pending review** | Interesting hypothesis (fill deficit via pair creation) but construction can return `nothing` and is not in the module. Needs a successful isometry test for non-trivial sectors before promotion. |
| `archive/v0/` | **Drop / leave archived** | Has DEPRECATED.md; different module structure; superseded by current src/. |
| Literature review (`archive/v0/literature/`) | **Keep in place** | The user noted this is considered valuable; it is already in a separate archive location and requires no action. |
