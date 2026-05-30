# Pair creation/annihilation for mobile anyons.
#
# Creates/annihilates pairs of anyons that fuse to vacuum at adjacent sites.
# This is a cross-sector operator: maps N-particle states to (N±2)-particle states.
#
# The amplitude for creating a pair (a,b) at bond (j,j+1) involves an F-symbol:
#   F^{cum_k, a, b}_{cum_k}[e_row, vac_col]
# where cum_k is the cumulative charge at insertion point k, and the vacuum
# column selects the channel where the pair fuses to vacuum (b⊗c → 1).
#
# This generalizes Garjani-Ardonne pair creation to arbitrary fusion categories.

# ============================================================
# GLOSSARY cross-references (added P8.5 — 2026-05-17):
#
#   - [[def:pair-create]] — REALISED BY
#       pair_creation_operator (function, line 38) — the cross-sector
#         N → N+2 isometry, h†;
#       pair_hamiltonian (function, line 87) — the Hermitian variant
#         `Δ(h† + h)` (lines 88-90).
#     Per [[def:pair-create]] Translation map: "`src/MobileAnyons/
#     paircreation.jl::pair_creation_operator` and `dual_pairs`
#     realise the cross-sector N → N+2 operator via F-symbol vacuum
#     column". The supporting `dual_pairs(cache)` (line 19) realises
#     the rigid-duals clause of [[def:fuscat]] — enumerates all
#     non-vacuum simple pairs (a, b) with `a ⊗ b → 1` (self-dual
#     for Fibonacci `(τ, τ)`, Ising `(ψ, ψ)`, sVec `(ψ, ψ)`).
#     The Fibonacci-specific coefficients `A_{τ,τ} = φ^{-1/2}`,
#     `A_{τ,1} = φ^{-1}` (per [[def:pair-create]] Canonical line
#     1706 + [[def:fib-F]]) come directly from `F[:, vac_col]` of
#     TC.jl's F-matrix at the line-113 extraction site.
#   - **Internal helpers** (line 94 `_cumulative_charge`,
#     line 100 `_add_pair_creation!`, line 155
#     `_build_pair_intermediates`) are plumbing — no GLOSSARY slug
#     each; per P8.1a §paircreation.jl line 314-317.
#
# CONVENTIONS applied (P1.6(*)):
#   - (a) vacuum at index 1: explicit `==1` checks at lines 24
#         (`Hom(S[a] ⊗ S[b], S[1])` — fusion-to-vacuum predicate),
#         95 (`k == 0 && return 1` — empty-prefix cumulative charge
#         IS the vacuum), 109 (`findfirst(==(1), ri)` — vacuum
#         column lookup in the right-intermediate list). Matches
#         [P1.6(a)] + matches the STL-1 fix's vacuum-at-1 anchor.
#   - (b) F-matrix gauge: ⚠ **Raw F-symbol entry used as amplitude
#         at line 113** (`amp = F[e_row, vac_col]`). This is the
#         third F-symbol consumer in MMA (alongside interaction.jl
#         + braiding.jl) and the only one whose MMA-side head
#         comment does NOT carry an inline gauge-acknowledgment.
#         **Port-time fix:** inline gauge comment added at line
#         117 (right before line 118 raw-amplitude extraction;
#         see comment block in the body) per the
#         `cft-anyons-xvq` P3 follow-up filed at P8.1a.
#         **Mathematical correctness in current scope**: For
#         Fibonacci/Ising/sVec — all three currently-used
#         categories — the F-matrix is gauge-coincident
#         (involutory ↔ unitary gauges agree) by the
#         multiplicity-free single-channel argument of [P1.6(b)]:
#         (i) Fibonacci's F^{τττ}_τ is real symmetric involutory
#         AND unitary (per [[def:fib-F]]); (ii) Ising's F^{σσσ}_σ
#         is Hadamard-type unitary; (iii) sVec is trivial.
#         So raw `F[e_row, vac_col]` extraction gives the
#         physically-correct amplitude with NO per-call gauge
#         translation needed. **Out-of-scope warning**: for
#         categories with non-multiplicity-free fusion or
#         multi-channel vacuum decomposition (extended Haagerup
#         etc.), the same Hermitian-projector or Gram-matrix
#         orthogonalisation pattern used in interaction.jl
#         (lines 154-156) / braiding.jl (lines 234-252) would
#         have to be applied. Per [P1.6(b)] Translation rule.
#   - (c) dagger / Hermiticity: `pair_hamiltonian` builds
#         `Δ(h_dag + h_dag')` (line 89) — manifestly Hermitian
#         by construction; `pair_creation_operator` alone is
#         h† (the creation half).
#   - (d) multiplicity-free: ⚠ **LB-1 secondary** via
#         `!iszero(dim(Hom(S[a] ⊗ S[b], S[1])))` (line 24) +
#         inherited F-matrix indexing via `f_matrix` /
#         `left_intermediates` / `right_intermediates`. Latent
#         in current scope. Per [P1.6(d)] and bd cft-anyons-q6h.
#   - (e) complex conjugation: `ComplexF64(amp)` (line 140) wraps
#         the raw F-entry for sparse-matrix accumulation; no
#         explicit `conj` since `pair_creation_operator` is
#         h† (not Hermitian on its own), and the Hermitian sum
#         `h† + h` at line 89 is built via Julia's `'` adjoint
#         operator on the sparse matrix.
#   - (g) particle-number disambiguation: `N` in
#         `pair_creation_operator`'s internal scope (lines 58,
#         100-101, 117, 127) is the particle count = our n;
#         the operator maps N-particle ↔ (N+2)-particle states
#         (head comment line 4). Per [P1.6(g)] MMA reading.
#   - (h) local cell object Q = Q_full: inherits via basis.
#   - (i) fusion-tree ordering: ✓ left-associated F access
#         pattern — `f_matrix(cache, cum_k, pa, pb, cum_k)`
#         (line 103) reads the F-symbol
#         `F^{cum_k, pa, pb}_{cum_k}` of the change-of-basis
#         `(cum_k ⊗ pa) ⊗ pb → cum_k ⊗ (pa ⊗ pb)` for the
#         vacuum-restricted sub-channel where `pa ⊗ pb → 1`.
#         Matches [P1.6(i)] and matches fsymbols.jl's convention.
#   - (j) N=0 boundary: `_cumulative_charge(labels, inters, 0) = 1`
#         (line 95) handles the empty-prefix case as the vacuum
#         charge per [P1.6(j)]. The N=0 ↔ N=2 pair-creation case
#         (insert a pair at the empty lattice) is the base case
#         covered by `k = 0`.
#
# TC.jl symbols used in this file (verbatim names):
#   - simples                — line 20 (`S = simples(cache.C)`).
#   - dim                    — line 24 (`!iszero(dim(Hom(...)))`).
#   - Hom                    — line 24 (`Hom(S[a] ⊗ S[b], S[1])`).
#   - ⊗                      — line 24 (monoidal product).
#   - SparseArrays.sparse    — line 78 (`sparse(I_idx, J_idx, V_val, n, n)`).
#   All TC.jl-specific symbols are resolved via the module-wide
#   `using TensorCategories, Oscar` in MobileAnyons.jl line 58.
#
# LB-* exposure:
#   - **LB-1 secondary site** at line 24 — `dual_pairs` uses
#     `!iszero(dim(Hom(...)))` boolean (same pattern as fsymbols.jl
#     `fusion_channels` and hilbert.jl `enumerate_fusion_trees`).
#     Collapses multiplicity to boolean; safe in current scope
#     (Fibonacci, Ising, sVec all have at most 1 fusion channel
#     `a ⊗ b → 1` per (a, b) pair). Inherited LB-1 via F-matrix
#     access. See bd cft-anyons-q6h (LB-1 master).
#
# Drift flags (CLAUDE.md hallucination-risk callouts):
#   - **F-matrix gauge**: ⚠ **fires** at line 113 (raw F-symbol
#     entry used as amplitude). **Inline gauge comment added at
#     line 117** (before the extraction) discharging the
#     `cft-anyons-xvq` P3 follow-up filed at P8.1a. Documentation
#     gap closed; mathematical content unchanged (gauges coincide
#     in current scope).
#   - **vacuum-index**: ✓ correctly handled — `findfirst(==(1), ri)`
#     (line 109) explicitly resolves the vacuum-column index in
#     the right-intermediate list rather than assuming "column 1
#     == vacuum".
#   - coassoc / dagger-special / Hilbert-framings / `\unchecked` /
#     chats / Lean: not observed.
#
# Provenance: ported from MMA `src/MobileAnyons/paircreation.jl`
#   at 2026-05-17 SHA256
#   ec4c9db2fb359f63b8397716dcb90f6cdc81316c29c8047b33acd0c8f1d1f52e.
# Audit references:
#   - stocktake/reports/opus-mma-julia-bridge.md (P8.1a
#     §paircreation.jl, lines 298-335 — verdict: "YELLOW —
#     **documentation gap** at the F-symbol usage site (line
#     113) … Port-time fix: add comment at line 113 along the
#     lines of 'raw F-symbol entry used; gauge-independent in
#     current Fibonacci/Ising/sVec scope per [P1.6(b)]
#     coincidence; for non-multiplicity-free or non-self-dual
#     extensions, apply explicit gauge translation.'" —
#     **discharged inline at line 117 per below**)
#   - stocktake/reports/opus-tcjl-conventions-bridge.md (P8.1c)
#   - bd cft-anyons-xvq (P3 paircreation.jl gauge-comment
#     follow-up) — **discharged inline at line 117 by this
#     P8.5 port-time addition**.
# ============================================================

"""
    dual_pairs(cache::FSymbolCache) -> Vector{Tuple{Int,Int}}

Return all pairs (a, b) of non-vacuum simples with a ⊗ b → 1 (vacuum).
For self-dual objects (e.g. τ in Fibonacci, ψ in sVec), this gives (a, a).
"""
function dual_pairs(cache::FSymbolCache)
    S = simples(cache.C)
    d = length(S)
    pairs = Tuple{Int,Int}[]
    for a in 2:d, b in 2:d
        !iszero(dim(Hom(S[a] ⊗ S[b], S[1]))) && push!(pairs, (a, b))
    end
    return pairs
end

"""
    pair_creation_operator(basis::AnyonBasis, cache::FSymbolCache)
        -> SparseMatrixCSC{ComplexF64}

Build the pair creation operator h† on the full basis.
Maps N-particle states to (N+2)-particle states by creating vacuum pairs
at adjacent vacant sites. Matrix element (bra, ket) is nonzero when bra
is obtained from ket by inserting a dual pair at adjacent vacant sites.
"""
function pair_creation_operator(basis::AnyonBasis, cache::FSymbolCache)
    n = length(basis.states)
    I_idx = Int[]
    J_idx = Int[]
    V_val = ComplexF64[]

    # Global state index for cross-sector lookup
    state_index = Dict{Tuple{Vector{Int}, Vector{Int}, Vector{Int}, Int}, Int}()
    for (idx, st) in enumerate(basis.states)
        key = (st.config.positions, st.config.labels, st.intermediates, st.total_charge)
        state_index[key] = idx
    end

    dpairs = dual_pairs(cache)

    for (ket_idx, ket) in enumerate(basis.states)
        pos = ket.config.positions
        labs = ket.config.labels
        inters = ket.intermediates
        tc = ket.total_charge
        N = length(pos)
        occ = Set(pos)

        for j in 1:(basis.L - 1)
            (j ∈ occ || (j + 1) ∈ occ) && continue

            # Insertion index: number of anyons at positions < j
            k = count(x -> x < j, pos)

            # Cumulative charge at insertion point
            cum_k = _cumulative_charge(labs, inters, k)

            for (pa, pb) in dpairs
                _add_pair_creation!(I_idx, J_idx, V_val, state_index,
                                    cache, ket_idx, pos, labs, inters, tc,
                                    N, j, k, cum_k, pa, pb)
            end
        end
    end

    return sparse(I_idx, J_idx, V_val, n, n)
end

"""
    pair_hamiltonian(basis::AnyonBasis, cache::FSymbolCache; Δ=1.0)
        -> SparseMatrixCSC{ComplexF64}

Build the Hermitian pair creation/annihilation Hamiltonian: Δ(h† + h).
"""
function pair_hamiltonian(basis::AnyonBasis, cache::FSymbolCache; Δ=1.0)
    h_dag = pair_creation_operator(basis, cache)
    return Δ * (h_dag + h_dag')
end

# --- Internal helpers ---

function _cumulative_charge(labels, inters, k)
    k == 0 && return 1
    k == 1 && return labels[1]
    return inters[k - 1]
end

function _add_pair_creation!(I_idx, J_idx, V_val, state_index,
                              cache, ket_idx, pos, labs, inters, tc,
                              N, j, k, cum_k, pa, pb)
    F = f_matrix(cache, cum_k, pa, pb, cum_k)
    size(F, 1) == 0 && return

    li = left_intermediates(cache, cum_k, pa, pb, cum_k)
    ri = right_intermediates(cache, cum_k, pa, pb, cum_k)

    vac_col = findfirst(==(1), ri)
    isnothing(vac_col) && return

    for (e_row, e) in enumerate(li)
        # Gauge (P8.5 port-time addition, discharging bd cft-anyons-xvq):
        # raw F-symbol entry used directly as creation amplitude.
        # Gauge-independent in current Fibonacci/Ising/sVec scope per
        # [P1.6(b)] coincidence regime (involutory ↔ unitary gauges
        # agree for multiplicity-free single-channel F^{cum_k, pa, pb}_{cum_k}
        # at the vacuum column). For non-multiplicity-free or
        # non-self-dual scope expansion, apply explicit gauge translation
        # via the same Hermitian-projector / Gram-matrix pattern used in
        # interaction.jl (lines 154-156) / braiding.jl (lines 234-252).
        amp = F[e_row, vac_col]
        abs(amp) < 1e-14 && continue

        # Construct bra positions and labels
        new_pos = Vector{Int}(undef, N + 2)
        new_labs = Vector{Int}(undef, N + 2)
        for i in 1:k
            new_pos[i] = pos[i]
            new_labs[i] = labs[i]
        end
        new_pos[k + 1] = j
        new_labs[k + 1] = pa
        new_pos[k + 2] = j + 1
        new_labs[k + 2] = pb
        for i in (k + 1):N
            new_pos[i + 2] = pos[i]
            new_labs[i + 2] = labs[i]
        end

        # Construct new intermediates
        new_inters = _build_pair_intermediates(inters, labs, k, e, cum_k, N)

        key = (new_pos, new_labs, new_inters, tc)
        bra_idx = get(state_index, key, 0)
        if bra_idx > 0
            push!(I_idx, bra_idx)
            push!(J_idx, ket_idx)
            push!(V_val, ComplexF64(amp))
        end
    end
end

"""
Build intermediates for the (N+2)-particle bra state after inserting a pair
at position k (between anyon k and k+1 in the original ordering).

The new intermediates vector has length N+1:
- Indices 1..k-1: unchanged from original
- Index k (if k≥1): e (the F-symbol left intermediate, cum_k ⊗ pa → e)
- Index k+1: cum_k (cumulative charge restored after pair fuses to vacuum)
- Indices k+2..N+1: shifted from original cumulatives
"""
function _build_pair_intermediates(inters, labels, k, e, cum_k, N)
    new_inters = Vector{Int}(undef, N + 1)

    # Region 1: unchanged (i = 1..k-1)
    for i in 1:(k - 1)
        new_inters[i] = inters[i]
    end

    # Region 2: F-symbol intermediate (i = k, only if k ≥ 1)
    if k >= 1
        new_inters[k] = e
    end

    # Region 3: restored cumulative (i = k+1)
    new_inters[k + 1] = cum_k

    # Region 4: shifted old cumulatives (i = k+2..N+1)
    # new_inters[i] = cum(i-1) of the original tree
    for i in (k + 2):(N + 1)
        j = i - 1  # original cumulative index
        new_inters[i] = j == 1 ? labels[1] : inters[j - 1]
    end

    return new_inters
end
