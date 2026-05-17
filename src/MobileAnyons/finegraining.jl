# Fine-graining isometries for anyonic Fock spaces.
#
# The fine-graining map V: H_L → H_{2L} embeds the L-site anyonic Hilbert space
# into the 2L-site space, doubling lattice resolution while preserving physics.
#
# For Haar wavelets (non-overlapping supports), the product map suffices:
#   V|x,inters⟩ = Σ_y Π_p R[y_p, x_p] |y, inters⟩
# since disjoint supports guarantee V†V = I by factorization.
#
# For wavelets with overlapping supports (D4, etc.), the product map is NOT
# isometric. The universal fix is the **normalized product map**:
#   V_iso = V_prod × diag(1/g(pos))
#
# where g(pos) = ||V_prod column|| is a position-dependent, category-independent
# geometric normalization factor. This works because:
# 1. G = V†V is DIAGONAL (different coarse states → orthogonal fine states)
# 2. Column norm depends ONLY on positions (not labels, intermediates, or category)
# 3. g²(pos) = Σ_{y sorted} Π R[y,x]² = "probability of distinct landings"
#
# Special cases:
# - Haar: g=1 always → V = product map
# - Single species: Slater determinant also works (different isometry, same V†V=I)
# - Multi-species: ONLY normalized product works (Slater permutes labels)

# ============================================================
# GLOSSARY cross-references (added P8.6 — 2026-05-17):
#
# **Partial port.** This file is imported from MMA per
# MIGRATION_PLAN.md P8.6 ("`finegraining.jl`: import everything
# except `categorical_determinant_isometry` (flagged 'partial
# correction only')"). Three of four MMA-exported public functions
# (the universal `normalized_product_isometry` realisation of
# [[def:refmap]], the supporting `fine_graining_isometry` product
# map, and the `trivial_embedding` realisation of [[def:persist]])
# are ported BYTE-IDENTICAL with the head comment + body preserved
# verbatim from MMA. The fourth public function
# `categorical_determinant_isometry` and its sole internal-helper
# chain (`_build_braiding_matrices`, `_bond_sigma_element`,
# `_add_catdet_elements!`, `_sum_permutations!`, `_recurse_perms!`,
# `_braiding_for_permutation`) are EXCLUDED — see the exclusion
# notice block below where the excluded code used to live (MMA
# source lines 209-559).
#
#   - [[def:refmap]] — REALISED BY
#       normalized_product_isometry (function, line 194 of MMA
#         source; preserved at the corresponding destination line
#         after this docstring header) — the universal
#         category-independent + wavelet-independent realisation of
#         the cellwise fine-graining isometry $E_{P \to P'}$ for
#         the dyadic doubling case $L \to 2L$. Per [[def:refmap]]
#         Translation map: "**`src/MobileAnyons/finegraining.jl::
#         normalized_product_isometry` ↔ $E_{P\to P'}$** for the
#         dyadic doubling case $L \to 2L$". The construction is
#         `V_iso = V_prod × diag(1/||V_prod[:, j]||)`: column-
#         normalisation of the product map produces an isometry
#         (proven: `G = V_prod† V_prod` is diagonal, with column
#         norms depending only on positions). Reduces to product
#         map for Haar; matches Slater for single-species sVec.
#       fine_graining_isometry (function, line 36 of MMA source) —
#         the bare product-map building block. Per [[def:refmap]]
#         Translation map: "`fine_graining_isometry` (raw product
#         map; isometric for Haar, fails for D4 — explicitly tested
#         with `@test iso_err > 0.01`)". Isometric for Haar
#         wavelets (non-overlapping supports); NOT isometric for
#         D4 and other wavelets with overlapping supports (used as
#         input to the column-normalised universal construction).
#   - [[def:persist]] — REALISED BY
#       trivial_embedding (function, line 148 of MMA source) — the
#         strict-persistence embedding $V_0$ that maps coarse site
#         $j$ to fine site $2j-1$, leaving even fine sites vacant.
#         Per [[def:persist]] Translation map:
#         "`src/MobileAnyons/finegraining.jl::trivial_embedding`
#         ($j \mapsto 2j-1$) — places each particle on the odd
#         sublattice of the doubled lattice with vacancies at even
#         refinement sites". Parity-offset note (per [[def:persist]]
#         Translation map): "The even/odd parity differs from
#         `summary.tex`'s 'even-sublattice' convention here by an
#         overall site-shift, but the structural content (strict-
#         persistence placement on a sublattice of the refined
#         lattice) coincides". Permutation-only construction is
#         always isometric.
#
# EXCLUDED — would have realised [[def:Jinterp]] partial:
#   - categorical_determinant_isometry (would have been at line
#     227 of MMA source) — braiding-weighted Slater generalisation
#     for arbitrary braided fusion categories. Per [[def:refmap]]
#     Translation map: "`categorical_determinant_isometry`
#     (braiding-weighted Slater generalisation; exported with
#     'partial correction only (non-abelian)' comment". Flagged
#     "partial correction only" in MMA source (MobileAnyons.jl
#     line 29) — see exclusion notice block below for details +
#     archive pointer.
#
# CONVENTIONS applied (P1.6(*)):
#   - (a) vacuum index: ✓ — vacuum-by-absence pattern throughout
#         (`fine_graining_isometry` uses `length(pos)` for `N`;
#         `trivial_embedding` is label-trivial; `normalized_
#         product_isometry` inherits via `V_prod`). No `F[:, 1]`
#         vacuum-column extraction in any KEPT function — only the
#         EXCLUDED `_bond_sigma_element` exercised that pattern.
#   - (c) dagger: ✓ — `norm(V_prod[:, j])` (line 200 of MMA source)
#         computes the Hermitian-induced column norm via the
#         standard `LinearAlgebra` two-norm; consistent with
#         [P1.6(c)].
#   - (d) multiplicity-free: ⚠ N/A in KEPT scope — the kept
#         functions operate on `basis_L.states` / `basis_2L.states`
#         which themselves carry the LB-1 multiplicity-free
#         assumption via the upstream `enumerate_fusion_trees` at
#         `hilbert.jl:118` (already marked with the LB-1 TODO at
#         P8.4). The EXCLUDED `_build_braiding_matrices` was the
#         only direct in-file LB-1 callsite (MMA source line 315);
#         removing it removes the only secondary LB-1 site in
#         this file.
#   - (e) complex conjugation: ✓ in KEPT scope — kept functions
#         return `SparseMatrixCSC{Float64}` (real-valued
#         arithmetic only); no `ComplexF64` machinery in scope
#         after exclusion (the `ComplexF64`-returning
#         `categorical_determinant_isometry` is excluded).
#   - (g) particle-number disambiguation: `N = length(pos)`
#         throughout kept functions = particle count (= our n
#         per [P1.6(g)] MMA-convention); `L_fine = 2 * basis_L.L`
#         is the doubled lattice length (= our L on the refined
#         partition).
#   - (h) local cell object Q: ✓ inherits via basis (config.jl
#         carries the `Q_full = ⊕_a a` choice).
#   - (i) fusion-tree ordering: ✓ — `ket.intermediates` passed
#         through verbatim in kept functions; left-associated
#         convention inherited from hilbert.jl / fsymbols.jl
#         (the EXCLUDED `_bond_sigma_element` was the only direct
#         in-file consumer of the left-associated `F[:, 1]`
#         pattern via the right-intermediates list).
#   - (j) N=0 boundary: ✓ — `fine_graining_isometry` lines 61-69
#         of MMA source handle N=0 explicitly (vacuum-to-vacuum
#         amplitude-1 map); `trivial_embedding` inherits via
#         empty-position passthrough; `normalized_product_isometry`
#         inherits via `V_prod`. The EXCLUDED `categorical_
#         determinant_isometry` had its own explicit N=0 boundary
#         at MMA source lines 254-262 (and N=1 fastpath at lines
#         264-278); both removed with the function.
#
# Letters (b), (f) are N/A in KEPT scope: (b) F-matrix gauge — the
# three kept functions use NO F-symbols (they operate on label +
# position + intermediate-sequence data passed through from the
# basis; the gauge-sensitive `_bond_sigma_element` is excluded);
# (f) TikZ macro source — no LaTeX in this code file.
#
# TC.jl symbols used in this file (verbatim names):
#   - none direct in kept scope. Only `LinearAlgebra.norm`
#     (line 200 of MMA source), `LinearAlgebra.Diagonal`
#     (line 206), `SparseArrays.sparse` (lines 89, 171, 207) —
#     all resolved via the module-wide
#     `using LinearAlgebra, Combinatorics, SparseArrays` in
#     MobileAnyons.jl line 59. The EXCLUDED
#     `categorical_determinant_isometry` chain additionally
#     consumed `FSymbolCache` (via `f_matrix`,
#     `left_intermediates`, `right_intermediates` from
#     fsymbols.jl), `RSymbolCache.r_values` (from braiding.jl),
#     `enumerate_fusion_trees` (from hilbert.jl), and
#     `Combinatorics.combinations` (line 445 of MMA source);
#     all of those callsites are removed with the exclusion.
#
# LB-* exposure:
#   - **LB-1 secondary site removed by P8.6 exclusion.** Per
#     P8.1a §Synthesis line 466 (`hilbert.jl:58` primary;
#     `fsymbols.jl:75` secondary; `braiding.jl:43` secondary;
#     `paircreation.jl:24` secondary; `finegraining.jl:315`
#     tertiary via `enumerate_fusion_trees` inside
#     `_build_braiding_matrices`), this file's only LB-1
#     callsite was in the EXCLUDED chain. After P8.6 the kept
#     scope has NO direct LB-1 callsites — inheritance is via
#     basis only.
#
# Drift flags (CLAUDE.md hallucination-risk callouts):
#   - F-matrix gauge: ⚠ **was** a documentation gap in EXCLUDED
#     `_bond_sigma_element` (MMA source lines 386-403; raw
#     `F[:, 1]` extraction; same Gram-orthogonalisation pattern
#     as `braiding.jl::_bond_braiding_element` lines 234-252 but
#     **no inline gauge-acknowledgment comment**); discharged
#     by P8.6 exclusion (mooted — the function ships nowhere).
#     bd cft-anyons-874 (P4 follow-up tracking this gap) is
#     discharged inline at this P8.6 commit.
#   - vacuum-index: ✓ — column-1 = vacuum assumption was the
#     `F[:, 1]` pattern in EXCLUDED `_bond_sigma_element`;
#     mooted.
#   - multiplicity-free: LB-1 secondary site removed (see above).
#   - coassoc / dagger-special / Hilbert-framings / `\unchecked`
#     / chats / Lean: not observed.
#
# Provenance: ported from MMA `src/MobileAnyons/finegraining.jl`
#   at 2026-05-17 SHA256
#   baa7f0d64f2f5fd5ff297bc3d10490652c45dbc2616dcc597536ca10816223ce.
#   Destination SHA256 differs from source per (a) this docstring
#   header block, (b) the EXCLUSION-notice block below (replaces
#   MMA source lines 209-559 — the entire `categorical_determinant_
#   isometry` chain banner + function + 6 internal helpers).
# Audit references:
#   - stocktake/reports/opus-mma-julia-bridge.md (P8.1a
#     §finegraining.jl, lines 374-416 — verdict: "EXCLUDED at P8.6
#     per MIGRATION_PLAN; port the WRAPPER docstring with the
#     exclusion note + pointer to `archive/mma-archive-v0-snapshot/`
#     (per MIGRATION_PLAN literal)"). Discharged inline by this
#     P8.6 header above + exclusion-notice block below.
#   - stocktake/MIGRATION_PLAN.md line 274 (P8.6 plan-text).
#   - bd cft-anyons-1bs (P8.6 implementer issue).
#   - bd cft-anyons-874 (P4 _bond_sigma_element gauge comment;
#     MOOTED + DISCHARGED by this P8.6 exclusion).
# ============================================================

"""
    fine_graining_isometry(basis_L::AnyonBasis, basis_2L::AnyonBasis,
                            R::Matrix{Float64}) -> SparseMatrixCSC{Float64}

Build the many-body fine-graining isometry V: H_L → H_{2L} for any fusion category.

Uses the product map: each particle spreads independently via the one-particle
isometry R. Labels and fusion-tree intermediates are preserved.

For Haar wavelets (non-overlapping supports), V†V = I is guaranteed by factorization.
"""
function fine_graining_isometry(basis_L::AnyonBasis, basis_2L::AnyonBasis,
                                 R::Matrix{Float64})
    n_coarse = length(basis_L.states)
    n_fine = length(basis_2L.states)

    I_idx = Int[]
    J_idx = Int[]
    V_val = Float64[]

    # Build fine-basis index: (positions, labels, intermediates, charge) → index
    fine_index = Dict{Tuple{Vector{Int}, Vector{Int}, Vector{Int}, Int}, Int}()
    for (idx, st) in enumerate(basis_2L.states)
        key = (st.config.positions, st.config.labels, st.intermediates, st.total_charge)
        fine_index[key] = idx
    end

    L_fine = 2 * basis_L.L

    for (ket_idx, ket) in enumerate(basis_L.states)
        pos = ket.config.positions
        labs = ket.config.labels
        inters = ket.intermediates
        tc = ket.total_charge
        N = length(pos)

        if N == 0
            # Vacuum maps to vacuum
            bra_idx = get(fine_index, (Int[], Int[], Int[], tc), 0)
            if bra_idx > 0
                push!(I_idx, bra_idx)
                push!(J_idx, ket_idx)
                push!(V_val, 1.0)
            end
            continue
        end

        # For each particle p at coarse site pos[p], find fine sites with nonzero R
        # Build list of (fine_site, amplitude) for each particle
        particle_options = Vector{Vector{Tuple{Int,Float64}}}(undef, N)
        for p in 1:N
            opts = Tuple{Int,Float64}[]
            for j in 1:L_fine
                r = R[j, pos[p]]
                abs(r) > 1e-14 && push!(opts, (j, r))
            end
            particle_options[p] = opts
        end

        # Enumerate all combinations (one fine site per particle)
        _enumerate_fine_configs!(I_idx, J_idx, V_val, fine_index,
                                 particle_options, labs, inters, tc, ket_idx, N)
    end

    return sparse(I_idx, J_idx, V_val, n_fine, n_coarse)
end

"""
Recursively enumerate all valid fine-site configurations from particle options.
Enforces hard-core constraint (no two particles at the same fine site)
and sorted position order.
"""
function _enumerate_fine_configs!(I_idx, J_idx, V_val, fine_index,
                                  particle_options, labs, inters, tc, ket_idx, N)
    # Use iterative enumeration over the Cartesian product
    n_opts = [length(particle_options[p]) for p in 1:N]
    indices = ones(Int, N)

    while true
        # Build fine positions and amplitude
        fine_pos = Vector{Int}(undef, N)
        amp = 1.0
        valid = true
        for p in 1:N
            site, r = particle_options[p][indices[p]]
            fine_pos[p] = site
            amp *= r
        end

        # Check sorted and distinct (hard-core)
        if issorted(fine_pos) && allunique(fine_pos)
            key = (fine_pos, labs, inters, tc)
            bra_idx = get(fine_index, key, 0)
            if bra_idx > 0
                push!(I_idx, bra_idx)
                push!(J_idx, ket_idx)
                push!(V_val, amp)
            end
        end

        # Increment indices (odometer)
        carry = true
        for p in N:-1:1
            if carry
                indices[p] += 1
                if indices[p] > n_opts[p]
                    indices[p] = 1
                else
                    carry = false
                end
            end
        end
        carry && break
    end
end

"""
    trivial_embedding(basis_L::AnyonBasis, basis_2L::AnyonBasis)
        -> SparseMatrixCSC{Float64}

Build the trivial embedding V₀: each coarse site j maps to fine site 2j-1.
Even-numbered fine sites are left vacant. This is always isometric (permutation).
"""
function trivial_embedding(basis_L::AnyonBasis, basis_2L::AnyonBasis)
    n_coarse = length(basis_L.states)
    n_fine = length(basis_2L.states)

    fine_index = Dict{Tuple{Vector{Int}, Vector{Int}, Vector{Int}, Int}, Int}()
    for (idx, st) in enumerate(basis_2L.states)
        key = (st.config.positions, st.config.labels, st.intermediates, st.total_charge)
        fine_index[key] = idx
    end

    I_idx = Int[]
    J_idx = Int[]

    for (ket_idx, ket) in enumerate(basis_L.states)
        fine_pos = [2x - 1 for x in ket.config.positions]
        key = (fine_pos, ket.config.labels, ket.intermediates, ket.total_charge)
        bra_idx = get(fine_index, key, 0)
        if bra_idx > 0
            push!(I_idx, bra_idx)
            push!(J_idx, ket_idx)
        end
    end

    return sparse(I_idx, J_idx, ones(Float64, length(I_idx)), n_fine, n_coarse)
end

"""
    normalized_product_isometry(basis_L::AnyonBasis, basis_2L::AnyonBasis,
                                 R::Matrix{Float64}) -> SparseMatrixCSC{Float64}

Build the universal fine-graining isometry V: H_L → H_{2L} for ANY fusion category
and ANY wavelet.

This is the **normalized product map**: each particle spreads independently via R,
preserving labels and intermediates, then each column is normalized to unit length.

  V_iso = V_prod × diag(1/||col||)

The normalization g(pos) = ||col|| is position-dependent and category-independent.
For Haar wavelets, g = 1 (no correction). For D4 and others, g < 1 at adjacent sites.

This is the correct universal construction because:
- G = V†_prod V_prod is diagonal (proven: orthogonal fine states)
- Column norm depends only on positions (not labels/intermediates/category)
- Reduces to product map for Haar, matches Slater for single-species
"""
function normalized_product_isometry(basis_L::AnyonBasis, basis_2L::AnyonBasis,
                                      R::Matrix{Float64})
    V_prod = fine_graining_isometry(basis_L, basis_2L, R)

    # Normalize each column
    n = size(V_prod, 2)
    col_norms = Float64[norm(V_prod[:, j]) for j in 1:n]
    # Protect against zero columns (empty sectors)
    for j in 1:n
        col_norms[j] = max(col_norms[j], 1e-14)
    end

    return V_prod * Diagonal(1.0 ./ col_norms)
end

# ============================================================
# EXCLUSION (P8.6 — 2026-05-17):
#
# `categorical_determinant_isometry` (originally at MMA
# `src/MobileAnyons/finegraining.jl` lines 213-302 — function
# header at MMA line 227, docstring at MMA line 213; banner block
# at MMA lines 209-211; trailing `end` at MMA line 302) is
# EXCLUDED from this port per MIGRATION_PLAN.md P8.6 (line 274:
# "`finegraining.jl`: import everything **except**
# `categorical_determinant_isometry` (flagged 'partial correction
# only')"). MMA's `src/MobileAnyons/MobileAnyons.jl:29` flags it
# explicitly: `export categorical_determinant_isometry  # partial
# correction only (non-abelian)`.
#
# Also EXCLUDED — internal-helper chain consumed ONLY by
# `categorical_determinant_isometry` (verified pre-port via
# `grep -rn` across both MMA src + MMA test directories: zero
# call sites outside the excluded chain):
#   - `_build_braiding_matrices` (MMA lines 304-347)
#   - `_bond_sigma_element`      (MMA lines 349-411)
#   - `_add_catdet_elements!`    (MMA lines 413-472)
#   - `_sum_permutations!`       (MMA lines 474-504)
#   - `_recurse_perms!`          (MMA lines 506-533)
#   - `_braiding_for_permutation` (MMA lines 535-558)
#
# Total excised: MMA source lines 209-559 (351 lines including the
# `# Categorical determinant fine-graining` banner block at MMA
# lines 209-211 and the trailing newline at MMA line 559).
#
# **Gauge-handling note (per P8.1a §finegraining.jl + bd cft-anyons-874
# discharge):** The excluded `_bond_sigma_element` (MMA lines
# 349-411) uses raw F-symbol entries at MMA lines 386-403 (in
# particular `v1 = F[:, 1]` at MMA line 391 as the vacuum-column
# extraction; then `P1 = (v1 * v1') / norm1_sq`, `P2 = I - P1` for
# the 2-channel case at MMA lines 392-397; and the general
# Gram-orthogonalisation `G = F' * F; G_inv = inv(G); M = F * G_inv
# * Diagonal(R_vals) * F'` for the 3+-channel case at MMA lines
# 400-403). This is the **same spectral-decomposition /
# Gram-orthogonalisation pattern** as `braiding.jl::
# _bond_braiding_element` (cf. destination `braiding.jl` lines
# 234-252; P8.1c gauge-gold-standard). MMA's `braiding.jl` has an
# inline `IMPORTANT:` gauge-acknowledgment comment at MMA
# `braiding.jl` lines 167-184 documenting why this pattern is
# gauge-independent ([P1.6(b)] resolution via Hermitian
# projectors); MMA's `finegraining.jl::_bond_sigma_element` has
# NO such inline comment — a documentation gap flagged by P8.1a
# audit (`stocktake/reports/opus-mma-julia-bridge.md` lines 396,
# 401, 411, 464). bd `cft-anyons-874` (P4 follow-up) tracked the
# port-time addition of the missing gauge comment. **MOOTED** by
# this P8.6 exclusion: the function ships nowhere, so the comment
# is not needed at the destination; bd `cft-anyons-874` is
# discharged inline at this P8.6 commit.
#
# **Categorical-content note (per `_bond_sigma_element` docstring
# at MMA lines 384-389 + P8.1a §finegraining.jl line 389):**
# The excluded chain would have realised [[def:Jinterp]]
# partially (braiding-weighted Slater generalisation; see
# [[def:refmap]] Translation map literal: "`categorical_
# determinant_isometry` (braiding-weighted Slater generalisation;
# exported with 'partial correction only (non-abelian)' comment").
# The "partial correction only" caveat in MMA reflects that the
# construction is known to produce non-isometric output in some
# non-abelian channels (the categorical determinant does NOT
# universally satisfy $V^\dagger V = I$ for arbitrary braided
# fusion categories — only for sVec single-species, where it
# reduces to the standard Slater determinant). The universal
# correct construction for arbitrary categories is
# `normalized_product_isometry` above (per the head-comment
# preamble at the top of this file: "For wavelets with overlapping
# supports (D4, etc.), the product map is NOT isometric. The
# universal fix is the **normalized product map**: V_iso = V_prod
# × diag(1/g(pos))…"). Hence `categorical_determinant_isometry`
# is superseded in scope by `normalized_product_isometry` at the
# universal-correctness level; its braiding-weighted refinement
# remains mathematical-content-incomplete and is preserved only
# in the MMA archive snapshot below.
#
# For the original MMA source of these functions, see:
#   archive/mma-archive-v0-snapshot/microscopic-mobile-anyons/
#     src/MobileAnyons/finegraining.jl
# (currently empty `.gitkeep` placeholder at
# `archive/mma-archive-v0-snapshot/.gitkeep`; MMA-v0 snapshot
# import scheduled at MIGRATION_PLAN.md Phase 10
# "Selective archive/v0 extraction"; until Phase 10 lands, the
# MMA original at `/home/tobiasosborne/Projects/microscopic-
# mobile-anyons/src/MobileAnyons/finegraining.jl` lines 209-559
# is the live source; MMA source SHA256 at this P8.6 commit:
# baa7f0d64f2f5fd5ff297bc3d10490652c45dbc2616dcc597536ca10816223ce).
#
# When the snapshot lands at Phase 10, this exclusion can be
# re-evaluated. Two paths:
#   (i) complete the `categorical_determinant_isometry`
#       correction so it is provably isometric for the in-scope
#       categories (would require new mathematical work — define
#       the correct braiding-weighted antisymmetrisation, prove
#       $V^\dagger V = I$ on the appropriate categorical sector,
#       and add a Lean lemma + Wolfram cross-check — escalate to
#       user per CLAUDE.md Law 1 before any such addition); or
#   (ii) formally archive the function as WONTPORT, with a brief
#        in PROVENANCE.md documenting the architectural reason
#        (`normalized_product_isometry` is the universal correct
#        construction; `categorical_determinant_isometry` is a
#        partial alternative kept only for historical reference).
#
# Audit references (this exclusion is bid-supported):
#   - stocktake/reports/opus-mma-julia-bridge.md (P8.1a)
#     §finegraining.jl lines 374-416 — verdict: "EXCLUDED at P8.6
#     per MIGRATION_PLAN; port the WRAPPER docstring with the
#     exclusion note + pointer to `archive/mma-archive-v0-snapshot/`
#     (per MIGRATION_PLAN literal)".
#   - stocktake/MIGRATION_PLAN.md line 274 (P8.6 plan-text).
#   - bd cft-anyons-1bs (P8.6 implementer issue — closed by this
#     commit).
#   - bd cft-anyons-874 (P4 _bond_sigma_element gauge comment —
#     MOOTED + DISCHARGED by this exclusion; closed by this
#     commit).
# ============================================================
