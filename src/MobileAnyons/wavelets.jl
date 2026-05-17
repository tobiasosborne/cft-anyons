# Wavelet-based fine-graining isometries for OAR continuum limits.
#
# The fine-graining map R: ℂ^L → ℂ^{2L} embeds the one-particle Hilbert space
# of an L-site lattice into the 2L-site lattice using the wavelet scaling equation:
#
#   φ(x) = Σ_n h_n √2 φ(2x - n)
#
# where h_n are the low-pass filter coefficients of a compactly supported wavelet
# (Daubechies family). The matrix R satisfies R†R = I (isometry).
#
# For free fermions (sVec), the many-body isometry V lifts R to N-body via
# Slater determinants: V|x₁,...,xₙ⟩ = det(R_{xᵢ,yⱼ}) over fine-site configs.
#
# References:
#   Osborne-Stottmeister, arXiv:2107.13834, Sections 3-4
#   Stottmeister et al., arXiv:2002.01442 (PRL 127, 230601)

# ============================================================
# GLOSSARY cross-references (added P8.5 — 2026-05-17):
#
#   - [[def:polar-repair]] — REALISED BY
#       one_particle_scaling_map (function, line 46) — specifically
#         the Löwdin (symmetric) orthogonalisation
#         `R ↦ R (R†R)^{-1/2}` at lines 63-67. Per
#         [[def:polar-repair]] Translation map: "Löwdin (symmetric)
#         orthogonalisation A ↦ A (A†A)^{-1/2} is used in
#         `src/MobileAnyons/wavelets.jl::one_particle_scaling_map`
#         (lines 63-67) for OBC boundary correction". The
#         implementation computes `S = R' * R`, eigendecomposes
#         `Symmetric(S)`, builds `S^{-1/2}` via
#         `eig.vectors * Diagonal(1.0 ./ sqrt.(max.(eig.values, 1e-14))) * eig.vectors'`,
#         then `R_iso = R * S_inv_sqrt`. This IS the
#         `I_N := J_N G_N^{-1/2}` polar-decomposition formula of
#         [[def:polar-repair]] applied to the one-particle wavelet
#         matrix (with `J_N → R`, `G_N → R†R`).
#       one_particle_scaling_map_haar (function, line 81) — Haar
#         (K=1) specialisation that bypasses orthogonalisation
#         (always exactly isometric per docstring lines 78-80;
#         no boundary correction needed).
#   - [[def:refmap]] — REALISED BY
#       fine_graining_isometry_svec (function, line 102) — Slater
#         determinant lift of the one-particle R matrix to the
#         N-particle sVec basis. Per [[def:refmap]] Translation map
#         (via `mma-julia.md` §5 line 151): "`fine_graining_isometry_svec`
#         (Slater determinant lift; correct only for sVec)". This
#         is the wavelet-derived realisation of `E_{P→P'}` for the
#         specific case of free fermions / sVec (single-species,
#         antisymmetric); finegraining.jl (Phase 8 P8.6) will
#         carry the universal `normalized_product_isometry`
#         realisation for arbitrary fusion categories.
#   - `daubechies_filter(K)` (line 25) is reference wavelet
#     infrastructure (Haar K=1 + Daubechies-D4 K=2; line 31 errors
#     for K ≥ 3 — explicit `error(...)` boundary). No GLOSSARY
#     slug; per P8.1a §wavelets.jl line 351 "wavelet infrastructure,
#     no categorical-primitive slug needed". Cited literature:
#     Osborne–Stottmeister `arXiv:2107.13834` + Stottmeister et al.
#     `arXiv:2002.01442` — both discharged via CITATION_INDEX.md
#     `osborne-stottmeister` flag (SRC-OAR-WAVELETS family).
#
# CONVENTIONS applied (P1.6(*)):
#   - (a) vacuum at index 1: implicit — wavelet matrix `R` is
#         labelled by lattice sites (coarse `1:L` ↔ fine `1:2L`),
#         not by anyon labels. The N-body Slater lift at
#         `fine_graining_isometry_svec` passes
#         `ket.intermediates` through unchanged (line 146);
#         intermediate-sequence indices follow the same
#         vacuum-at-1 convention as upstream config.jl / hilbert.jl.
#   - (c) dagger / isometry: ✓ `R' * R` (line 65) constructs the
#         Gram matrix `S = R†R`; `R_iso = R * S^{-1/2}` (line 68)
#         enforces `R_iso† R_iso = I` (Löwdin output is
#         isometric by polar-decomposition argument). For the
#         N-body lift, `det(R_sub[fine_pos, :])` (lines 140-141)
#         is the determinantal-Slater antisymmetrisation.
#   - (e) complex conjugation: ✓ file is `Float64` throughout
#         (real Daubechies coefficients; no complex needed).
#         `Symmetric(S)` (line 66) uses Mathlib-style symmetric
#         eigendecomposition appropriate for real-symmetric Gram
#         matrices.
#   - (g) particle-number disambiguation: `N = length(pos)`
#         (line 120) is MMA's particle-count reading (= our n);
#         `L` (parameter at line 46 and `basis_L.L` at line 138)
#         is lattice length (= our L). Per [P1.6(g)] MMA
#         convention.
#   - (h) local cell object Q: inherits via basis (config.jl
#         carries the choice).
#   - (i) fusion-tree ordering: `ket.intermediates` passed through
#         verbatim (line 146) preserves the left-associated
#         intermediate sequence per fsymbols.jl / hilbert.jl
#         convention.
#   - (j) N=0 boundary: ✓ **explicitly handled** at lines 123-131
#         — N=0 (vacuum) maps to N=0 (vacuum) with amplitude 1
#         when the fine-basis vacuum carries matching `total_charge`.
#         Matches [P1.6(j)] zero-particle vacuum convention.
#
# Letters (b), (d) are N/A: (b) F-matrix gauge — file uses NO
# F-symbols (head comment lines 1-10 explicit; wavelet R is purely
# numerical real-symmetric); (d) multiplicity-free — file's sVec
# specialisation has trivial fusion data (single species ψ).
#
# TC.jl symbols used in this file (verbatim names):
#   - none direct. Only `LinearAlgebra.det` (lines 141, implicit
#     via `det(minor)`), `LinearAlgebra.eigen` (line 66),
#     `LinearAlgebra.Symmetric` (line 66),
#     `LinearAlgebra.Diagonal` (line 67),
#     `Combinatorics.combinations` (line 138),
#     `SparseArrays.sparse` (line 156) — all resolved via the
#     module-wide `using LinearAlgebra, Combinatorics, SparseArrays`
#     in MobileAnyons.jl line 59.
#
# LB-* exposure:
#   - none direct. The Slater-determinant lift at
#     `fine_graining_isometry_svec` is sVec-only (single species,
#     antisymmetric); no fusion-multiplicity bookkeeping. Per
#     P8.1a §wavelets.jl line 365.
#
# Drift flags (CLAUDE.md hallucination-risk callouts):
#   - F-matrix gauge / vacuum-index / coassoc / dagger-special /
#     Hilbert-framings / `\unchecked` / chats / Lean: not observed.
#     (Wavelet infrastructure is gauge-free by construction.)
#
# Provenance: ported from MMA `src/MobileAnyons/wavelets.jl`
#   at 2026-05-17 SHA256
#   b2e22d03a579b803ba0fe30125c835c10348831715d57d6ee4f0dc4221906d24.
# Audit references:
#   - stocktake/reports/opus-mma-julia-bridge.md (P8.1a §wavelets.jl,
#     lines 339-370 — verdict: "OK. The [[def:polar-repair]]
#     connection at `one_particle_scaling_map` is documented in
#     GLOSSARY but not in MMA's file head comment — port docstring
#     at P8.5 should add a backlink." Discharged inline by this
#     P8.5 header above.)
#   - stocktake/reports/opus-tcjl-conventions-bridge.md (P8.1c)
#   - CITATION_INDEX.md `osborne-stottmeister` discharge flag
#     (SRC-OAR-WAVELETS family; arXiv:2107.13834 + arXiv:2002.01442
#     both verified discharged).
# ============================================================

"""
    daubechies_filter(K::Int) -> Vector{Float64}

Return the low-pass filter coefficients h₀,...,h_{2K-1} for the Daubechies-K wavelet.
K=1 is the Haar wavelet (2 coefficients). K=2 is D4 (4 coefficients).
Coefficients satisfy: Σ hₙ² = 1, Σ hₙ h_{n+2m} = δ_{m,0} (orthogonality).
"""
function daubechies_filter(K::Int)
    K == 1 && return [1/√2, 1/√2]  # Haar
    if K == 2
        # D4 coefficients
        return [(1+√3)/(4√2), (3+√3)/(4√2), (3-√3)/(4√2), (1-√3)/(4√2)]
    end
    error("Daubechies-$K not implemented (only K=1,2)")
end

"""
    one_particle_scaling_map(L::Int, h::Vector{Float64}) -> Matrix{Float64}

Build the one-particle fine-graining isometry R: ℂ^L → ℂ^{2L}.

R maps basis vector eᵢ (particle at coarse site i) to a superposition of
fine-site basis vectors using the wavelet scaling equation:

  R[j, i] = h[j - 2(i-1)]  (1-indexed, for valid filter indices)

For OBC: columns near boundaries are truncated and renormalized so that R†R = I.
"""
function one_particle_scaling_map(L::Int, h::Vector{Float64})
    K2 = length(h)  # filter length = 2K
    L_fine = 2L
    R = zeros(Float64, L_fine, L)

    for i in 1:L
        # Coarse site i maps to fine sites centered around 2i-1, 2i
        # Filter index: j - 2(i-1), valid when 1 ≤ j - 2(i-1) ≤ K2
        for n in 1:K2
            j = 2(i - 1) + n  # fine site index (1-based)
            if 1 <= j <= L_fine
                R[j, i] = h[n]
            end
        end
    end

    # Symmetric (Löwdin) orthogonalization: R → R (R†R)^{-1/2}
    # This projects onto the nearest isometry while preserving the wavelet structure
    # (columns stay close to their original directions, unlike QR which rotates them)
    S = R' * R
    eig = eigen(Symmetric(S))
    S_inv_sqrt = eig.vectors * Diagonal(1.0 ./ sqrt.(max.(eig.values, 1e-14))) * eig.vectors'
    R_iso = R * S_inv_sqrt

    return R_iso
end

"""
    one_particle_scaling_map_haar(L::Int) -> Matrix{Float64}

Specialized Haar (K=1) scaling map. Each coarse site i maps to an equal
superposition of fine sites 2i-1 and 2i: R eᵢ = (e_{2i-1} + e_{2i})/√2.

This is exact (no boundary corrections needed) and always satisfies R†R = I.
"""
function one_particle_scaling_map_haar(L::Int)
    R = zeros(Float64, 2L, L)
    for i in 1:L
        R[2i - 1, i] = 1/√2
        R[2i, i] = 1/√2
    end
    return R
end

"""
    fine_graining_isometry_svec(basis_L::AnyonBasis, basis_2L::AnyonBasis,
                                 R::Matrix{Float64}) -> SparseMatrixCSC{Float64}

Build the many-body fine-graining isometry V: H_L → H_{2L} for sVec (free fermions).

The N-particle map is the antisymmetrized tensor product of R:
  V|x₁,...,xₙ⟩ = Σ_{y₁<...<yₙ} det(R[yₚ, xᵧ]) |y₁,...,yₙ⟩

where the sum runs over all N-element subsets {y₁,...,yₙ} of {1,...,2L}.
For the 0-particle (vacuum) sector: V|∅⟩ = |∅⟩.
"""
function fine_graining_isometry_svec(basis_L::AnyonBasis, basis_2L::AnyonBasis,
                                      R::Matrix{Float64})
    n_coarse = length(basis_L.states)
    n_fine = length(basis_2L.states)

    I_idx = Int[]
    J_idx = Int[]
    V_val = Float64[]

    # Build state index for fine basis: (positions, intermediates, charge) → index
    fine_index = Dict{Tuple{Vector{Int}, Vector{Int}, Int}, Int}()
    for (idx, st) in enumerate(basis_2L.states)
        key = (st.config.positions, st.intermediates, st.total_charge)
        fine_index[key] = idx
    end

    for (ket_idx, ket) in enumerate(basis_L.states)
        pos = ket.config.positions
        N = length(pos)
        tc = ket.total_charge

        if N == 0
            # Vacuum maps to vacuum
            bra_idx = get(fine_index, (Int[], Int[], tc), 0)
            if bra_idx > 0
                push!(I_idx, bra_idx)
                push!(J_idx, ket_idx)
                push!(V_val, 1.0)
            end
            continue
        end

        # Extract the N×2L submatrix of R for the occupied coarse sites
        R_sub = R[:, pos]  # 2L × N matrix

        # Sum over all N-element subsets of fine sites
        for fine_pos in Combinatorics.combinations(1:(2 * basis_L.L), N)
            # Compute the N×N minor: det of R_sub[fine_pos, :]
            minor = R_sub[fine_pos, :]  # N × N matrix
            d = det(minor)
            abs(d) < 1e-14 && continue

            # sVec: all labels = 2 (ψ), intermediates alternate 1,2,...
            # The fine state must have the same labels and compatible intermediates
            bra_key = (fine_pos, ket.intermediates, tc)
            bra_idx = get(fine_index, bra_key, 0)
            if bra_idx > 0
                push!(I_idx, bra_idx)
                push!(J_idx, ket_idx)
                push!(V_val, d)
            end
        end
    end

    return sparse(I_idx, J_idx, V_val, n_fine, n_coarse)
end
