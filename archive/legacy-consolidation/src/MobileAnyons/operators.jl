# Operators for mobile anyons on a 1D lattice.
#
# Key insight: hopping to an adjacent vacant site has matrix element +1
# for ANY fusion category, because the F-moves only involve vacuum factors
# (F^{a,b,1}_d = F^{a,1,c}_d = 1). The hopping Hamiltonian is simply
# the adjacency matrix of the hard-core configuration graph.
#
# F-symbols become nontrivial for:
# - Exchange/interaction (two non-vacuum objects at adjacent sites)
# - Pair creation/annihilation
# These are implemented separately using FSymbolCache.

# ============================================================
# GLOSSARY cross-references (added P8.5 — 2026-05-17):
#
# No GLOSSARY slug is realised by this file. All three exported
# functions are textbook free-fermion / tight-binding infrastructure
# operating on the hard-core anyonic basis:
#
#   - `hopping_hamiltonian(basis; t)` (line 26): standard 1D
#       OBC tight-binding Hamiltonian
#       H = -t Σⱼ (cⱼ† cⱼ₊₁ + h.c.) acting on AnyonBasis indices.
#   - `hopping_hamiltonian_sector(basis, N, c; t)` (line 91):
#       restriction to the (N, c) sector via basis.sector_ranges.
#   - `free_fermion_energies(L, N; t)` (line 147): closed-form
#       OBC dispersion εₖ = -2t cos(πk/(L+1)); reference oracle
#       for sVec-hopping cross-validation at Phase 8 P8.8 tests.
#
# These are NOT categorical primitives; per P8.1a §operators.jl
# "No direct GLOSSARY slug. Closest concept: standard 1D
# tight-binding Hamiltonian … this is a non-content
# infrastructure exporter". They CONSUME [[def:mobile-Fock]]'s
# AnyonBasis (via hilbert.jl) but realise no `summary.tex`-side
# definitional content. **No new GLOSSARY entry needed** (per
# P8.1a §"GLOSSARY-entry coverage" + §Verdict line 213).
#
# CONVENTIONS applied (P1.6(*)):
#   - (a) vacuum at index 1: implicit via basis.L 1-based site
#         lookup and vacuum-by-absence (pos ∈ 1:L; vacuum sites
#         carry no anyon, hence no label-1 entry in basis.config.labels).
#   - (c) dagger / Hermiticity: h_L(j) = h_R(j)† (docstring line 21
#         + head comment line 21 of MMA source). Construction
#         builds both directions explicitly with -t coefficients
#         (lines 60-78), yielding a real-symmetric sparse matrix
#         (line 24 docstring: "The Hamiltonian is real symmetric").
#   - (g) particle-number disambiguation: in this file, `N`
#         = particle count (= our n); `L` = lattice length (= our L).
#         Matches MMA-wide convention; per [P1.6(g)] this is the
#         canonical reading of MMA-imported function signatures.
#         The `(N, c)`-sector function and `free_fermion_energies(L, N)`
#         both follow this reading.
#   - (h) local cell object Q = Q_full = ⊕_{a ∈ Irr(C)} a: inherits
#         via basis (config.jl carries the implicit choice).
#   - (j) N=0 boundary: `free_fermion_energies(L, 0)` returns `[0.0]`
#         (line 149), matching [P1.6(j)] zero-particle vacuum
#         convention. `hopping_hamiltonian_sector` short-circuits
#         empty sectors via `isempty(range)` (line 93).
#
# Letters (b), (d), (e), (i) are N/A here: (b) F-matrix gauge —
# file uses NO F-symbols (head comment lines 5-7 explicit;
# hopping is gauge-trivial); (d) multiplicity — file does not
# touch fusion-tree multiplicity; (e) complex conjugation —
# matrix is Float64 throughout; (i) fusion-tree ordering — file
# does not touch trees, only basis indices and a preserved
# `(positions, labels, intermediates, charge)` lookup key.
#
# TC.jl symbols used in this file (verbatim names):
#   - none direct. Only `SparseArrays.sparse` (line 13 imports
#     SparseArrays — redundant since MobileAnyons.jl line 59
#     already brings it in module-wide, but byte-preserved per
#     port-discipline) and `Combinatorics.combinations` (used at
#     line 153; resolved via the module-wide `using Combinatorics`
#     in MobileAnyons.jl line 59).
#
# LB-* exposure:
#   - none direct. AnyonBasis carries LB-1 latent (via
#     enumerate_fusion_trees in hilbert.jl), but this file does
#     not touch fusion-tree multiplicity or F/R-symbols. Per
#     P8.1a §operators.jl "none direct (basis carries LB-1 latent)".
#
# Drift flags (CLAUDE.md hallucination-risk callouts):
#   - F-matrix gauge: explicitly NOT-INVOKED per head comment
#     lines 5-7. Correctly handled by absence.
#   - vacuum-index / coassoc / dagger-special / Hilbert-framings /
#     `\unchecked` / chats / Lean: not observed.
#
# Provenance: ported from MMA `src/MobileAnyons/operators.jl`
#   at 2026-05-17 SHA256
#   a359f0a69891911b99a89af0d86f59826d4ed1df9158521788ba948942825a63.
# Audit references:
#   - stocktake/reports/opus-mma-julia-bridge.md (P8.1a §operators.jl,
#     lines 182-213)
#   - stocktake/reports/opus-tcjl-conventions-bridge.md (P8.1c)
# ============================================================

using SparseArrays

"""
    hopping_hamiltonian(basis::AnyonBasis; t=1.0) -> SparseMatrixCSC{Float64}

Build the hopping Hamiltonian H = -t Σ_j (h_R(j) + h_L(j)).

h_R(j) moves an anyon from site j to vacant site j+1.
h_L(j) = h_R(j)† moves an anyon from site j+1 to vacant site j.

Matrix elements are ±t (always +t for right/left hop, since F-symbols with
a vacuum factor are trivial). The Hamiltonian is real symmetric.
"""
function hopping_hamiltonian(basis::AnyonBasis; t=1.0)
    n = length(basis.states)
    I = Int[]
    J = Int[]
    V = Float64[]

    # Index states for fast lookup: (positions, labels, intermediates, charge) → index
    state_index = Dict{Tuple{Vector{Int}, Vector{Int}, Vector{Int}, Int}, Int}()
    for (idx, st) in enumerate(basis.states)
        key = (st.config.positions, st.config.labels, st.intermediates, st.total_charge)
        state_index[key] = idx
    end

    for (ket_idx, ket) in enumerate(basis.states)
        pos = ket.config.positions
        labs = ket.config.labels
        N = length(pos)
        N == 0 && continue

        occ = Set(pos)

        for p in 1:N
            site = pos[p]

            # Right hop: site → site+1 (if site+1 ≤ L and vacant)
            if site + 1 <= basis.L && (site + 1) ∉ occ
                new_pos = copy(pos)
                new_pos[p] = site + 1
                # Maintain sorted order
                sort!(new_pos)
                # Labels and intermediates unchanged (hopping preserves fusion tree)
                key = (new_pos, labs, ket.intermediates, ket.total_charge)
                bra_idx = get(state_index, key, 0)
                if bra_idx > 0
                    push!(I, bra_idx)
                    push!(J, ket_idx)
                    push!(V, -t)
                end
            end

            # Left hop: site → site-1 (if site-1 ≥ 1 and vacant)
            if site - 1 >= 1 && (site - 1) ∉ occ
                new_pos = copy(pos)
                new_pos[p] = site - 1
                sort!(new_pos)
                key = (new_pos, labs, ket.intermediates, ket.total_charge)
                bra_idx = get(state_index, key, 0)
                if bra_idx > 0
                    push!(I, bra_idx)
                    push!(J, ket_idx)
                    push!(V, -t)
                end
            end
        end
    end

    return sparse(I, J, V, n, n)
end

"""
    hopping_hamiltonian_sector(basis::AnyonBasis, N::Int, c::Int; t=1.0)
        -> SparseMatrixCSC{Float64}

Build hopping Hamiltonian restricted to the (N, c) sector.
"""
function hopping_hamiltonian_sector(basis::AnyonBasis, N::Int, c::Int; t=1.0)
    range = get(basis.sector_ranges, (N, c), 1:0)
    isempty(range) && return sparse(Float64[], Float64[], Float64[], 0, 0)

    states = basis.states[range]
    n = length(states)

    # Index by (positions, intermediates) to handle multiple fusion trees per config
    state_index = Dict{Tuple{Vector{Int}, Vector{Int}}, Int}()
    for (idx, st) in enumerate(states)
        state_index[(st.config.positions, st.intermediates)] = idx
    end

    I_idx = Int[]
    J_idx = Int[]
    V_val = Float64[]

    for (ket_idx, ket) in enumerate(states)
        pos = ket.config.positions
        N_p = length(pos)
        N_p == 0 && continue

        occ = Set(pos)

        for p in 1:N_p
            site = pos[p]

            for delta in [-1, 1]
                new_site = site + delta
                (1 <= new_site <= basis.L && new_site ∉ occ) || continue

                new_pos = copy(pos)
                new_pos[p] = new_site
                sort!(new_pos)

                # Hopping preserves fusion tree (labels + intermediates)
                bra_idx = get(state_index, (new_pos, ket.intermediates), 0)
                if bra_idx > 0
                    push!(I_idx, bra_idx)
                    push!(J_idx, ket_idx)
                    push!(V_val, -t)
                end
            end
        end
    end

    return sparse(I_idx, J_idx, V_val, n, n)
end

"""
    free_fermion_energies(L, N; t=1.0) -> Vector{Float64}

Return all N-particle free fermion energies on L sites with OBC.
Single-particle energies: ε_k = -2t cos(πk/(L+1)), k=1,...,L.
N-particle energies: sums of N distinct single-particle energies.
"""
function free_fermion_energies(L::Int, N::Int; t=1.0)
    sp = [-2t * cos(π * k / (L + 1)) for k in 1:L]
    N == 0 && return [0.0]
    N > L && return Float64[]

    energies = Float64[]
    for combo in Combinatorics.combinations(1:L, N)
        push!(energies, sum(sp[k] for k in combo))
    end
    return sort(energies)
end
