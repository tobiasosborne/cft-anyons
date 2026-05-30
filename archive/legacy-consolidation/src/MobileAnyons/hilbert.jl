# Hilbert space for mobile anyons from a fusion category C.
#
# For N anyons with labels (a₁,...,aₙ) at positions (x₁,...,xₙ),
# the internal space is Mor(1, X_{a₁} ⊗ ... ⊗ X_{aₙ}) with total
# charge c, i.e. Mor(X_c, X_{a₁} ⊗ ... ⊗ X_{aₙ}).
#
# A basis state = (config, fusion_tree, total_charge).
# Fusion trees are sequences of intermediate charges from left-to-right fusion.

# ============================================================
# GLOSSARY cross-references (added P8.4 — 2026-05-17):
#
#   - [[def:splitbasis]] — REALISED BY FusionTree (struct),
#       enumerate_fusion_trees (function)
#     The splitting-tree basis of Mor(c, X_{a₁} ⊗ ... ⊗ X_{aₙ})
#     indexed by intermediate charges; left-associated per the
#     struct docstring "left-to-right fusion".
#   - [[def:mobile-Fock]] — REALISED BY AnyonBasis{T} (struct),
#       build_basis (function)
#     The full MMA mobile-Fock basis; this struct IS the realisation
#     of `H_MMA(L)` per [[def:mobile-Fock]] canonical second form
#     `H_MMA(L) = ⊕_{N=0}^L ⊕_{c} ⊕_{config} ⊕_{fusion_tree}` —
#     `states` enumerates the full direct-sum basis;
#     `sector_ranges` carries the `(N,c)` block decomposition.
#
# CONVENTIONS applied (P1.6(*)):
#   - (a) vacuum at index 1; `c == 1` test for empty-labels case
#         (in `enumerate_fusion_trees`) confirms vacuum at index 1.
#   - (d) multiplicity-free assumed (LB-1 latent — primary site;
#         see LB-1 TODO marker immediately above
#         `enumerate_fusion_trees` below).
#   - (g) particle-number disambiguation: in this file, `N` =
#         particle count (= our n); `L` = lattice length (= our L).
#         Consistent with config.jl; matches [P1.6(g)] MMA-reading rule.
#   - (h) local cell object Q = Q_full = ⊕_{a ∈ Irr(C)} a inherited
#         via config.jl's enumerate_configs_hc.
#   - (i) left-associated fusion-tree basis — explicit in struct
#         docstring "left-associated fusion tree" + the recursion in
#         `enumerate_fusion_trees` walks indices `2:N` left-to-right.
#         Conforms to [P1.6(i)].
#   - (j) N=0 boundary realised at `enumerate_fusion_trees`
#         `N == 0 && return c == 1 ? [Int[]] : Vector{Int}[]` —
#         matches [P1.6(j)] H_∅^W = δ_{W,1} ℂ (1-dim iff W=1, else 0).
#
# TC.jl symbols used in this file (verbatim names):
#   - simples       — line ~43, ~76; reads d = length(simples(C)).
#   - dim           — line ~58 inside iszero(dim(Hom(...))).
#   - Hom           — line ~58; tests fusion-channel non-vanishing.
#   - ⊗             — line ~58; TC.jl's monoidal-product operator.
#   All EXIST per stocktake/reports/opus-tcjl-api-audit.md (P8.0a).
#
# LB-* exposure:
#   - **LB-1 primary site** at `enumerate_fusion_trees` (line 58
#     boolean `iszero(dim(Hom(...)))`). In current scope
#     (Fibonacci, Ising, sVec — all multiplicity-free with
#     `dim Hom ∈ {0,1}`) the boolean test is correct. For
#     categories with `dim Hom > 1` (e.g., extended Haagerup) the
#     basis is UNDERCOUNTED. See RESEARCH_NOTES.md §LB-1 and bd
#     `cft-anyons-q6h`. TODO marker placed directly above the
#     function definition below.
#   - **LB-1 secondary site** at `build_basis` — propagates LB-1
#     from `enumerate_fusion_trees`; no extra marker (covered by
#     the primary marker).
#
# Drift flags (CLAUDE.md hallucination-risk callouts):
#   - Hilbert-space framings: this file IS the MMA mobile-Fock
#     framing; correctly identified by
#     stocktake/reports/opus-hilbert-bridge.md §1.3 and locked at
#     [[def:mobile-Fock]]. No drift.
#   - vacuum-index: correctly fires (the `c == 1` empty-case test).
#
# Provenance: ported from MMA `src/MobileAnyons/hilbert.jl`
#   at 2026-05-17 SHA256
#   c8b7e888f625160df7e08d4db6539687224409ac031947d49730a4bed79450de.
# Audit references:
#   - stocktake/reports/opus-mma-julia-bridge.md (P8.1a §hilbert.jl)
#   - stocktake/reports/opus-tcjl-conventions-bridge.md (P8.1c)
#   - stocktake/reports/opus-hilbert-bridge.md §3.5 + §7 (LB-1 origin)
# ============================================================

"""
    FusionTree

A left-associated fusion tree for labels [a₁, a₂, ..., aₙ] → total charge c.
intermediates[k] = result of fusing a₁⊗...⊗a_{k+1} (length N-1 for N particles).
For N=0 or N=1, intermediates is empty.
"""
struct FusionTree
    config::LabelledConfig
    intermediates::Vector{Int}   # indices into simples(C)
    total_charge::Int            # index into simples(C)
end

"""
    AnyonBasis

Full basis for mobile anyons on L sites using category C.
Organized by (N, c) sectors.
"""
struct AnyonBasis{T}
    L::Int
    C::T
    states::Vector{FusionTree}
    sector_ranges::Dict{Tuple{Int,Int}, UnitRange{Int}}  # (N,c) → index range
end

"""
    enumerate_fusion_trees(C, labels, c) -> Vector{Vector{Int}}

All sequences of intermediate charges for left-to-right fusion of `labels` → `c`.
Returns vectors of intermediate charge indices (into simples(C)).
"""
# TODO LB-1: multiplicity-free assumption. enumerate_fusion_trees
# treats `dim Hom > 0` as a Boolean rather than counting multiplicity.
# Safe in current scope (Fibonacci, Ising, sVec all multiplicity-free)
# but breaks for non-multiplicity-free categories. See RESEARCH_NOTES.md
# §LB-1 and bd cft-anyons-q6h.
function enumerate_fusion_trees(C, labels::Vector{Int}, c::Int)
    S = simples(C)
    d = length(S)

    N = length(labels)
    N == 0 && return c == 1 ? [Int[]] : Vector{Int}[]
    N == 1 && return labels[1] == c ? [Int[]] : Vector{Int}[]

    trees = Vector{Int}[]

    function recurse(k::Int, partial::Vector{Int}, current_charge::Int)
        if k > N
            current_charge == c && push!(trees, copy(partial))
            return
        end
        for s in 1:d
            iszero(dim(Hom(S[current_charge] ⊗ S[labels[k]], S[s]))) && continue
            push!(partial, s)
            recurse(k + 1, partial, s)
            pop!(partial)
        end
    end

    # Start: first label fuses trivially to itself
    recurse(2, Int[], labels[1])
    return trees
end

"""
    build_basis(L, C; hardcore=true) -> AnyonBasis

Build complete basis for mobile anyons on L sites.
"""
function build_basis(L::Int, C; hardcore=true)
    S = simples(C)
    d = length(S)
    states = FusionTree[]
    sector_ranges = Dict{Tuple{Int,Int}, UnitRange{Int}}()

    max_N = hardcore ? L : error("Soft-core not yet implemented")

    for N in 0:max_N
        configs = enumerate_configs_hc(L, N, C)
        for c in 1:d
            start = length(states) + 1
            for cfg in configs
                for tree in enumerate_fusion_trees(C, cfg.labels, c)
                    push!(states, FusionTree(cfg, tree, c))
                end
            end
            stop = length(states)
            stop >= start && (sector_ranges[(N, c)] = start:stop)
        end
    end

    return AnyonBasis(L, C, states, sector_ranges)
end
