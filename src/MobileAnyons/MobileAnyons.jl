module MobileAnyons

# ============================================================
# GLOSSARY cross-references (added P8.4 — 2026-05-17):
#
# Module shell. The 28-symbol export surface is realised by the 10
# included functional files; per-file docstring headers carry the
# GLOSSARY-slug realisation tables. This shell adds none directly.
#
#   - [[def:partition]]  — REALISED BY config.jl exports
#       (LabelledConfig, enumerate_configs_hc)
#   - [[def:mobile-Fock]], [[def:splitbasis]] — REALISED BY hilbert.jl exports
#       (FusionTree, AnyonBasis, build_basis, enumerate_fusion_trees)
#   - [[def:fsymbol]]    — REALISED BY fsymbols.jl exports
#       (FSymbolCache, build_fsymbol_cache, f_matrix, f_symbol,
#        fusion_channels, left_intermediates, right_intermediates)
#   - [[def:TL-cat]]     — REALISED BY interaction.jl (P8.5+)
#   - [[def:pair-create]] — REALISED BY paircreation.jl (P8.5+)
#   - [[def:polar-repair]], [[def:refmap]], [[def:persist]], [[def:Jinterp]]
#                        — REALISED BY wavelets.jl + finegraining.jl (P8.5/P8.6)
#   - [[def:KS-Ln]], [[def:KS-scalars]] — REALISED BY virasoro.jl (P8.7)
#
# CONVENTIONS applied (P1.6(*)):
#   - none directly at the shell level; per-file headers carry conformance.
#   - dependency order of include() is preserved verbatim from MMA:
#       config → hilbert → fsymbols → operators → interaction → braiding
#       → paircreation → wavelets → finegraining → virasoro.
#     Maps to MIGRATION_PLAN P8.4 (wave 1) → P8.5 → P8.6 → P8.7.
#
# TC.jl symbols brought in (verbatim names per P8.0a + P8.1a):
#   - using TensorCategories, Oscar   — full export surface; specific
#       symbols actually used across the 10 functional files:
#       simples, dim, Hom, six_j_symbols, braiding, matrix,
#       base_ring, gen, complex_embeddings.
#       All EXIST in TC.jl 0.5.3 per stocktake/reports/opus-tcjl-api-audit.md.
#
# LB-* exposure:
#   - none direct at the shell level. LB-1 surfaces in hilbert.jl
#     (primary site) + fsymbols.jl/paircreation.jl/braiding.jl/
#     finegraining.jl (secondary sites) per P8.1a §"LB-* exposure".
#
# Provenance: ported from MMA `src/MobileAnyons/MobileAnyons.jl`
#   at 2026-05-17 SHA256
#   a79941c5f2ad9cf28a0ccc0407dc4aa73388435df8966871b62f4c241d00d319.
# Audit references:
#   - stocktake/reports/opus-mma-julia-bridge.md (P8.1a)
#   - stocktake/reports/opus-tcjl-conventions-bridge.md (P8.1c)
#   - stocktake/reports/opus-tcjl-api-audit.md (P8.0a)
#
# P8.4 wave-1 scope: only config.jl, hilbert.jl, fsymbols.jl are
# ported; the remaining 7 include()s are commented out and will be
# re-enabled as each subsequent wave lands (P8.5/P8.6/P8.7).
# Likewise the export lines for symbols defined by not-yet-ported
# files are commented out — exports must point at defined symbols
# for `using MobileAnyons` to be clean.
# ============================================================

using TensorCategories, Oscar
using LinearAlgebra, Combinatorics, SparseArrays

include("config.jl")
include("hilbert.jl")
include("fsymbols.jl")
# include("operators.jl")       # P8.4: deferred to P8.5
# include("interaction.jl")     # P8.4: deferred to P8.5
# include("braiding.jl")        # P8.4: deferred to P8.5
# include("paircreation.jl")    # P8.4: deferred to P8.5
# include("wavelets.jl")        # P8.4: deferred to P8.5
# include("finegraining.jl")    # P8.4: deferred to P8.6
# include("virasoro.jl")        # P8.4: deferred to P8.7

export LabelledConfig, enumerate_configs_hc
export FusionTree, AnyonBasis, build_basis, enumerate_fusion_trees
export FSymbolCache, build_fsymbol_cache, f_matrix, f_symbol
export fusion_channels, left_intermediates, right_intermediates
# export hopping_hamiltonian, hopping_hamiltonian_sector, free_fermion_energies         # P8.4: deferred to P8.5
# export interaction_hamiltonian, interaction_hamiltonian_sector                        # P8.4: deferred to P8.5
# export RSymbolCache, build_rsymbol_cache, build_rsymbol_cache_manual                  # P8.4: deferred to P8.5
# export braiding_hamiltonian, braiding_hamiltonian_sector, tv_model_spectrum           # P8.4: deferred to P8.5
# export dual_pairs, pair_creation_operator, pair_hamiltonian                           # P8.4: deferred to P8.5
# export daubechies_filter, one_particle_scaling_map, one_particle_scaling_map_haar     # P8.4: deferred to P8.5
# export fine_graining_isometry_svec                                                    # P8.4: deferred to P8.5
# export fine_graining_isometry, trivial_embedding, normalized_product_isometry         # P8.4: deferred to P8.6
# export categorical_determinant_isometry  # partial correction only (non-abelian)      # P8.4: deferred to P8.6
# export fine_graining_isometry_svec  # Slater lift (single-species only)               # P8.4: deferred to P8.6 (duplicate of line 27)
# export bond_projectors_dense, hamiltonian_fourier_modes, virasoro_commutator_check    # P8.4: deferred to P8.7

end # module
