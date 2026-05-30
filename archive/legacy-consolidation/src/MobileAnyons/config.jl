# Classical configuration space for mobile anyons on a 1D lattice.
#
# A configuration is an ordered list of (position, anyon_type) pairs.
# Hard-core: at most one anyon per site.
# Labels are 1-based indices into simples(C); label 1 = vacuum.

# ============================================================
# GLOSSARY cross-references (added P8.4 — 2026-05-17):
#
#   - [[def:partition]] — REALISED BY LabelledConfig (struct, line 64)
#       + enumerate_configs_hc (function, line 76)
#     Hard-core configurations on a 1D lattice of L sites are the
#     MMA realisation of summary.tex's ordered-partition + label data;
#     `enumerate_configs_hc(L, N, C)` enumerates the configuration
#     piece of [[def:mobile-Fock]]'s sector decomposition (per
#     [[def:partition]] Translation map).
#
# CONVENTIONS applied (P1.6(*)):
#   - (a) vacuum at index 1 (1-indexed); cf. head comment line 5,
#         struct docstring ("Labels are indices into simples(C),
#         where 1 = vacuum").
#   - (g) particle-number disambiguation: in this file, `N` = particle
#         count (= our n); `L` = lattice length (= our L).
#         The MMA convention is opposite to summary.tex `H_N^W` where
#         N = tensor degree. [P1.6(g)] documents this as the canonical
#         reading rule for MMA-imported code.
#   - (h) local cell object Q = Q_full = ⊕_{a ∈ Irr(C)} a baked in:
#         labels range `2:d` enumerates only non-vacuum simples
#         (vacuum-by-absence), so Q = ⊕_a a is the implicit choice.
#   - (j) N=0 boundary realised at the `N == 0 && return ...` line
#         (`return [LabelledConfig(Int[], Int[])]`) — pairs with
#         hilbert.jl to realise [P1.6(j)] H_∅^W = δ_{W,1} ℂ.
#
# TC.jl symbols used in this file (verbatim names):
#   - simples — reads out d = length(simples(C)) for the label range.
#     Gauge-independent; per P8.0a EXISTS in TC.jl 0.5.3 at export line 432.
#
# LB-* exposure:
#   - none (configurations carry no fusion-multiplicity data; LB-1
#     surfaces downstream at hilbert.jl `enumerate_fusion_trees`).
#
# Drift flags (CLAUDE.md hallucination-risk callouts):
#   - vacuum-index: correctly fires here (head comment line 5; struct
#     docstring) — vacuum unambiguously at index 1, matches [P1.6(a)]
#     and STL-1 fix.
#
# Provenance: ported from MMA `src/MobileAnyons/config.jl`
#   at 2026-05-17 SHA256
#   35723d190f4318144f4be35b57343f044efb75a7ae68f44a014a8ce55edc570d.
# Audit references:
#   - stocktake/reports/opus-mma-julia-bridge.md (P8.1a §config.jl)
#   - stocktake/reports/opus-tcjl-conventions-bridge.md (P8.1c)
# ============================================================


"""
    LabelledConfig(positions, labels)

N anyons at ordered positions with anyon type labels.
Positions are 1-based site indices. Labels are indices into simples(C),
where 1 = vacuum (trivial object).
"""
struct LabelledConfig
    positions::Vector{Int}   # 1-based site indices, sorted
    labels::Vector{Int}      # indices into simples(C), ≥ 2 for nontrivial
end

n_anyons(c::LabelledConfig) = length(c.positions)

"""
    enumerate_configs_hc(L, N, C) -> Vector{LabelledConfig}

All hard-core configs of N anyons on L sites, using nontrivial simples from C.
"""
function enumerate_configs_hc(L::Int, N::Int, C)
    S = simples(C)
    d = length(S)  # total simples including vacuum
    d < 2 && return LabelledConfig[]
    N > L && return LabelledConfig[]
    N == 0 && return [LabelledConfig(Int[], Int[])]

    configs = LabelledConfig[]
    for pos in Combinatorics.combinations(1:L, N)
        for labels in Iterators.product(fill(2:d, N)...)
            push!(configs, LabelledConfig(collect(pos), collect(labels)))
        end
    end
    return configs
end
