# Interaction Hamiltonian: nearest-neighbor vacuum-channel projector.
#
# For two anyons at adjacent sites j, j+1 with labels a, b:
# P_j projects onto the fusion channel a ⊗ b → 1 (vacuum).
#
# Matrix elements require F-symbols when the bond is not at the
# innermost vertex of the left-associated fusion tree.
#
# The golden chain Hamiltonian is H = J Σ_j P_j (sum over all bonds).
#
# IMPORTANT: The TensorCategories.jl F-matrix is in a non-unitary gauge
# (involutory: F²=I, but F†≠F⁻¹). We use the Hermitian projector
# P_H = vv†/|v|² where v = F[:, vacuum_col], which is gauge-independent.

# ============================================================
# GLOSSARY cross-references (added P8.5 — 2026-05-17):
#
#   - [[def:TL-cat]] — REALISED BY
#       interaction_hamiltonian (function, line 24) AND
#       interaction_hamiltonian_sector (function, line 43).
#     Both build H = J Σⱼ Pⱼ where each Pⱼ is the **Hermitian**
#     vacuum-channel projector at bond j (projecting σⱼ ⊗ σⱼ₊₁
#     onto the trivial-channel 1). Per [[def:TL-cat]] Translation
#     map: "`src/MobileAnyons/interaction.jl::interaction_hamiltonian`
#     (and the sector variant) builds H = ∑ⱼ Pⱼ where each Pⱼ is the
#     Hermitian vacuum-channel projector at bond j … Translation:
#     Pⱼ = eⱼ / d_σ where eⱼ is the categorical TL generator here."
#     The internal helper `_bond_projector_element` (line 104) is
#     the algebraic realisation of the per-bond Pⱼ via F-symbol
#     vacuum-column extraction; `_add_interaction_elements!`
#     (line 170) + `_find_state_index` (line 192) are accumulation
#     plumbing (no GLOSSARY-realising content).
#
# CONVENTIONS applied (P1.6(*)):
#   - (a) vacuum at index 1: line 105 explicit `vacuum = 1`;
#         line 146 `findfirst(==(vacuum), ri)` retrieves the
#         vacuum-channel column from the right-intermediate list.
#         Matches [P1.6(a)].
#   - (b) F-matrix gauge: **CANONICAL GAUGE-AWARE HANDLING — this
#         file is the [P1.6(b)] gold-standard reference site.**
#         Head comment lines 11-13 document the issue
#         ("TensorCategories.jl F-matrix is in a non-unitary
#         gauge (involutory: F²=I, but F†≠F⁻¹). We use the
#         Hermitian projector P_H = vv†/|v|² where
#         v = F[:, vacuum_col], which is gauge-independent.").
#         Inline restatement at lines 154-156: "Hermitian
#         projector: P_H = v v† / |v|² where v = F[:, vac_col].
#         This is gauge-independent and correctly Hermitian."
#         Implementation at line 163:
#         `P_H[bra_row, ket_row] = v[ket_row] * conj(v[bra_row]) / norm_sq`.
#         The Hermitian projector geometry P_H = vv†/|v|² is
#         invariant under the involutory↔unitary gauge change of
#         the F-column v (a scalar rescaling cancels in
#         numerator/denominator), so the resulting bond projector
#         agrees with `summary.tex`'s unitary-gauge `Pⱼ⁽¹⁾`
#         construction without any per-call translation step.
#         **This is [P1.6(b)] Translation rule applied
#         exemplarily; per P8.1a §interaction.jl line 250
#         "this file is the gold-standard pattern for gauge-aware
#         MMA code". Port-discipline: preserve head comment lines
#         11-13 verbatim (which the byte-identical body already
#         does).**
#   - (c) dagger / Hermiticity: `conj(v[bra_row])` (line 163) is
#         matrix-element complex conjugation per [P1.6(c)]; the
#         vv†/|v|² construction is manifestly Hermitian by
#         construction.
#   - (d) multiplicity-free: ⚠ **LB-1 secondary** inherited via
#         `fusion_channels` / `left_intermediates` /
#         `right_intermediates` / `f_matrix` (all from
#         fsymbols.jl). Latent in current Fibonacci/Ising/sVec
#         scope. Per [P1.6(d)] and bd cft-anyons-q6h.
#   - (e) complex conjugation: ✓ `conj(...)` at line 163,
#         `real(dot(v, v))` at line 157.
#   - (g) particle-number disambiguation: `N` in
#         `interaction_hamiltonian_sector(basis, cache, N, c; J)`
#         (line 43) is MMA's particle-number reading (= our n);
#         `c` is the total-charge sector index. Per [P1.6(g)]
#         this is the canonical MMA reading.
#   - (h) local cell object Q: inherits `Q_full` via basis
#         (config.jl carries the choice).
#   - (i) fusion-tree ordering: ✓ left-associated F-matrix used —
#         `a` = cumulative up to anyon p-1, `b` = labels[p],
#         `c` = labels[p+1], `d` = cumulative up to anyon p+1
#         (lines 129-136). Matches [P1.6(i)] and matches
#         fsymbols.jl's left-associated convention.
#   - (j) N=0 boundary: `np < 2 && continue` (lines 64, 172)
#         skips < 2-particle states (no bonds to act on). Matches
#         [P1.6(j)] zero-particle vacuum convention.
#
# TC.jl symbols used in this file (verbatim names):
#   - none direct. The file operates entirely on FSymbolCache (from
#     fsymbols.jl) via `f_matrix`, `left_intermediates`,
#     `right_intermediates` — all of which dispatch into TC.jl via
#     the fsymbols.jl wrapper. `LinearAlgebra.dot` (line 157) and
#     `SparseArrays.sparse` (lines 34, 95) come via the module-wide
#     `using LinearAlgebra, Combinatorics, SparseArrays` in
#     MobileAnyons.jl line 59.
#
# LB-* exposure:
#   - **LB-1 secondary site** via the F-symbol multiplicity-free
#     assumption inherited from `f_matrix` / `left_intermediates` /
#     `right_intermediates` (fsymbols.jl primary site at
#     `fusion_channels`). The Hermitian-projector workaround at
#     lines 154-156 is correct for multiplicity-free single-channel
#     vacuum geometry; non-multiplicity-free extension would
#     require multiplicity-aware projector summation. Latent in
#     current scope. See bd cft-anyons-q6h.
#
# Drift flags (CLAUDE.md hallucination-risk callouts):
#   - **F-matrix gauge**: ✓ **fires correctly** at head comment
#     lines 11-13 + inline lines 154-156; handled by the
#     Hermitian-projector pattern. **No drift.** This file is the
#     `summary.tex`-side [P1.6(b)] gold standard.
#   - **vacuum-index**: ✓ `vacuum = 1` explicit (line 105);
#     `findfirst(==(vacuum), ri)` resolves column index (line 146)
#     — no implicit assumption that "column 1 == vacuum".
#   - coassoc / dagger-special / Hilbert-framings / `\unchecked` /
#     chats / Lean: not observed.
#
# Provenance: ported from MMA `src/MobileAnyons/interaction.jl`
#   at 2026-05-17 SHA256
#   7fc0f7dc0bdca063de9f98cfc5fa78a58cfeed12b2b623fa89418c3e25aa710e.
# Audit references:
#   - stocktake/reports/opus-mma-julia-bridge.md (P8.1a
#     §interaction.jl, lines 217-251 — verdict: "OK —
#     **exemplary gauge-handling pattern.** This is the canonical
#     demonstration of [P1.6(b)] Translation rule applied correctly")
#   - stocktake/reports/opus-tcjl-conventions-bridge.md (P8.1c)
# ============================================================

"""
    interaction_hamiltonian(basis::AnyonBasis, cache::FSymbolCache; J=1.0)
        -> SparseMatrixCSC{ComplexF64}

Build the nearest-neighbor interaction H = J Σ_j P_j where P_j projects
onto the vacuum fusion channel at bond j.

For the dense chain (N=L), this reduces to the golden chain Hamiltonian.
"""
function interaction_hamiltonian(basis::AnyonBasis, cache::FSymbolCache; J=1.0)
    n = length(basis.states)
    I_idx = Int[]
    J_idx = Int[]
    V_val = ComplexF64[]

    for (ket_idx, ket) in enumerate(basis.states)
        _add_interaction_elements!(I_idx, J_idx, V_val, basis, cache, ket_idx, ket, J)
    end

    return sparse(I_idx, J_idx, V_val, n, n)
end

"""
    interaction_hamiltonian_sector(basis::AnyonBasis, cache::FSymbolCache,
                                   N::Int, c::Int; J=1.0)

Build interaction Hamiltonian restricted to (N, c) sector.
"""
function interaction_hamiltonian_sector(basis::AnyonBasis, cache::FSymbolCache,
                                        N::Int, c::Int; J=1.0)
    range = get(basis.sector_ranges, (N, c), 1:0)
    isempty(range) && return sparse(ComplexF64[], ComplexF64[], ComplexF64[], 0, 0)

    states = basis.states[range]
    ns = length(states)

    # Build index for this sector: (positions, intermediates) → local index
    state_index = Dict{Tuple{Vector{Int}, Vector{Int}}, Int}()
    for (idx, st) in enumerate(states)
        state_index[(st.config.positions, st.intermediates)] = idx
    end

    I_idx = Int[]
    J_idx = Int[]
    V_val = ComplexF64[]

    for (ket_idx, ket) in enumerate(states)
        np = length(ket.config.positions)
        np < 2 && continue

        labels = ket.config.labels
        inters = ket.intermediates
        tc = ket.total_charge

        # For each bond between consecutive anyons p and p+1
        # (in the anyon ordering, not lattice sites)
        for p in 1:(np - 1)
            # Only act on adjacent occupied sites
            ket.config.positions[p] + 1 == ket.config.positions[p + 1] || continue

            # Bond p between anyons p and p+1
            element = _bond_projector_element(cache, labels, inters, tc, p, np)

            for (bra_inter_p, val) in element
                # Construct bra intermediates: bond p changes inters[p-1] for p≥2, inters[1] for p=1
                change_idx = p == 1 ? 1 : p - 1
                bra_inters = copy(inters)
                bra_inters[change_idx] = bra_inter_p

                bra_key = (ket.config.positions, bra_inters)
                bra_idx = get(state_index, bra_key, 0)
                if bra_idx > 0
                    push!(I_idx, bra_idx)
                    push!(J_idx, ket_idx)
                    push!(V_val, J * val)
                end
            end
        end
    end

    return sparse(I_idx, J_idx, V_val, ns, ns)
end

"""
Compute projector matrix elements for bond p (between anyons p and p+1)
in a left-associated fusion tree.

Returns: vector of (bra_intermediate_value, amplitude) pairs.
"""
function _bond_projector_element(cache::FSymbolCache, labels, inters, tc, p, np)
    vacuum = 1  # index of vacuum simple object

    if p == 1
        # Bond 1: pair (l₁, l₂) is at the innermost vertex.
        # intermediates[1] = l₁ ⊗ l₂. Projector is diagonal.
        ket_e = inters[1]
        if ket_e == vacuum
            return [(vacuum, ComplexF64(1.0))]
        else
            return Tuple{Int, ComplexF64}[]
        end
    end

    # Bond p ≥ 2: need F-move to expose pair (l_p, l_{p+1}).
    # F^{a, b, c}_d where:
    #   a = cumulative up to anyon p-1
    #   b = labels[p]  (anyon p)
    #   c = labels[p+1] (anyon p+1)
    #   d = cumulative up to anyon p+1 (= intermediates[p])
    #     ... but wait: intermediates[p] = cumul after p+1 anyons.
    #     intermediates[k] = cumul after k+1 anyons (k=1,...,N-1).
    #     So after p+1 anyons: intermediates[p].
    #     But p goes up to np-1, and intermediates has length np-1.

    a = (p == 2) ? labels[1] : inters[p - 2]
    b = labels[p]
    c = labels[p + 1]
    d = (p < np - 1) ? inters[p] : tc  # intermediates[p] if it exists, else total charge
    # Actually intermediates has length np-1 and p ranges 1..np-1.
    # inters[p] exists for p ≤ np-1. So d = inters[p] always works? Let me check:
    # p ranges 2..np-1 in this branch. inters has length np-1. So p ≤ np-1. ✓
    d = inters[p]

    F = f_matrix(cache, a, b, c, d)
    size(F, 1) == 0 && return Tuple{Int, ComplexF64}[]

    # Row/col index mapping
    li = left_intermediates(cache, a, b, c, d)
    ri = right_intermediates(cache, a, b, c, d)

    # Find vacuum column index
    vac_col = findfirst(==(vacuum), ri)
    isnothing(vac_col) && return Tuple{Int, ComplexF64}[]

    # Find ket row index
    ket_e = inters[p - 1]  # the intermediate being changed
    ket_row = findfirst(==(ket_e), li)
    isnothing(ket_row) && return Tuple{Int, ComplexF64}[]

    # Hermitian projector: P_H = v v† / |v|² where v = F[:, vac_col].
    # This is gauge-independent and correctly Hermitian.
    v = F[:, vac_col]
    norm_sq = real(dot(v, v))
    norm_sq < 1e-14 && return Tuple{Int, ComplexF64}[]

    # P_H[bra_row, ket_row] = v[ket_row] × conj(v[bra_row]) / |v|²
    result = Tuple{Int, ComplexF64}[]
    for (bra_row, bra_e) in enumerate(li)
        val = v[ket_row] * conj(v[bra_row]) / norm_sq
        abs(val) > 1e-14 && push!(result, (bra_e, val))
    end

    return result
end

function _add_interaction_elements!(I_idx, J_idx, V_val, basis, cache, ket_idx, ket, J)
    np = length(ket.config.positions)
    np < 2 && return

    for p in 1:(np - 1)
        ket.config.positions[p] + 1 == ket.config.positions[p + 1] || continue

        element = _bond_projector_element(
            cache, ket.config.labels, ket.intermediates, ket.total_charge, p, np)

        for (bra_inter_p, val) in element
            change_idx = p == 1 ? 1 : p - 1
            bra_idx = _find_state_index(basis, ket, change_idx, bra_inter_p)
            if bra_idx > 0
                push!(I_idx, bra_idx)
                push!(J_idx, ket_idx)
                push!(V_val, J * val)
            end
        end
    end
end

function _find_state_index(basis, ket, p, new_inter_p)
    for (idx, st) in enumerate(basis.states)
        st.config.positions == ket.config.positions || continue
        st.config.labels == ket.config.labels || continue
        st.total_charge == ket.total_charge || continue
        match = true
        for k in eachindex(st.intermediates)
            expected = (k == p) ? new_inter_p : ket.intermediates[k]
            if st.intermediates[k] != expected
                match = false
                break
            end
        end
        match && return idx
    end
    return 0
end
