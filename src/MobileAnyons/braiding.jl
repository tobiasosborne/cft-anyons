# Braiding (R-matrix) Hamiltonian for mobile anyons.
#
# The braiding operator σ_{p,p+1} braids anyons p and p+1.
# R^{a,b}_c is the braiding phase in fusion channel c.
#
# For abelian categories (sVec): R is a scalar per pair, σ is diagonal.
# For non-abelian (Fibonacci, Ising): σ = F × diag(R) × F at bonds p ≥ 2
# (using F² = I in the involutory gauge).
#
# The Hermitian braiding Hamiltonian is H = λ Σ (σ + σ†).
# For real R-phases (sVec): reduces to H = 2λ Σ R nⱼnⱼ₊₁.
# For complex R-phases (Fibonacci): σ + σ† = F × 2Re(diag(R)) × F.

# ============================================================
# GLOSSARY cross-references (added P8.5 — 2026-05-17):
#
#   - [[def:rsymbol]] — REALISED BY
#       RSymbolCache (struct, line 19) — `r_values::Dict{Tuple{Int,Int,Int}, ComplexF64}`
#         keyed `(i, j, k) → R^{a,b}_c`;
#       build_rsymbol_cache (function, line 30) — extracts R-symbols
#         from a braided category C via TC.jl `braiding(S[i], S[j])`
#         (line 35) + `matrix(b)` (line 36);
#       build_rsymbol_cache_manual (function, line 57) — manual
#         constructor for consumer-supplied R-symbols (e.g.,
#         injecting the Fibonacci-specific values from
#         Trebst eq. (2.7) in `test_braiding_nonabelian.jl`).
#     Per [[def:rsymbol]] Translation map (GLOSSARY lines
#     2208-2247): "`RSymbolCache` struct (`braiding.jl:19-22`)
#     storing `r_values::Dict{Tuple{Int,Int,Int}, ComplexF64}`
#     keyed `(i, j, k) → R^{a,b}_c`; built by
#     `build_rsymbol_cache(C)` (`braiding.jl:30-49`) via TC.jl's
#     `braiding(S[i], S[j])` morphism (line 35) and `matrix(b)`
#     extraction (line 36); manual constructor
#     `build_rsymbol_cache_manual(r_dict)` (`braiding.jl:57-59`)
#     for consumer-supplied entries". The slug `def:rsymbol` was
#     added at GLOSSARY §B P8.1.5 (lines 2093-2349; user directive
#     2026-05-17) explicitly to back this file's R-symbol primitive.
#
#   - [[def:braid-H]] — REALISED BY
#       braiding_hamiltonian_sector (4-arg non-abelian, line 72) +
#       braiding_hamiltonian (3-arg non-abelian, line 132) +
#       braiding_hamiltonian_sector (4-arg abelian-shortcut, line 273) +
#       braiding_hamiltonian (2-arg abelian-shortcut, line 302).
#     Internal workers: `_bond_braiding_element` (line 185, the
#     gauge-aware Hermitian-projector spectral-decomposition site)
#     + `_braiding_diagonal_abelian` (line 324, the
#     `λ × 2Re(R^{a,b}_c)` diagonal for sVec). All four exported
#     entry points realise H = λ Σ_p (σ_p + σ_p†) restricted to
#     either the full Hilbert space or a `(N, c)` sector, with σ
#     defined by R-symbols ([[def:rsymbol]]) and F-symbols
#     ([[def:fsymbol]]) per the construction documented in
#     [[def:braid-H]] Canonical block 1 (GLOSSARY lines 2358-2386,
#     verbatim from this file's head comment + lines 61-71 docstring).
#     The slug `def:braid-H` was added at GLOSSARY §B P8.1.5
#     (lines 2356-2593; user directive 2026-05-17) explicitly to
#     back this file's Hamiltonian construction.
#
#   The auxiliary `tv_model_spectrum(L, N; t, V)` (line 354) is a
#   **reference oracle** — exact spectrum of the textbook
#   spinless-fermion t-V model in the occupation basis — used at
#   Phase 8 P8.8 tests (e.g., `test_braiding_svec.jl`) for
#   sVec-cross-validation. Not a categorical primitive; no
#   GLOSSARY slug. Per P8.1a §braiding.jl line 275 "OK —
#   reference oracle".
#
# CONVENTIONS applied (P1.6(*)):
#   - (a) vacuum at index 1: line 236 `v = F[:, 1]` reads the
#         "vacuum channel column" assuming vacuum-at-index-1 in
#         the F-matrix's right-intermediate ordering. Safe in
#         current Fibonacci/Ising scope (`ri[1] == 1` for both
#         relevant F-symbols `F^{σσσ}_σ` / `F^{τττ}_τ`; verified
#         in P8.1a §braiding.jl line 278). Per [[def:braid-H]]
#         Notes #3 (GLOSSARY line 2517) "future categories where
#         `1 ∉ ri` for some `(b, c, d)` need the column-index
#         resolved via `findfirst(==(1), ri)`" — flagged for
#         out-of-scope extension. Matches [P1.6(a)].
#   - (b) F-matrix gauge: **CANONICAL GAUGE-AWARE HANDLING — this
#         file is the second [P1.6(b)] gold-standard reference
#         site alongside interaction.jl.** Head comment lines 7-8
#         documents the involutory-gauge dependency:
#         "σ = F × diag(R) × F at bonds p ≥ 2 (using F² = I in
#         the involutory gauge)". Internal `_bond_braiding_element`
#         docstring lines 167-184 documents the resolution: the
#         spectral decomposition
#         `σ + σ† = Σ_f 2Re(R_f) × P_f^{phys}` with orthogonal
#         complements (P + (I-P) = I) avoiding non-orthogonality
#         issues in the involutory gauge.
#         Two sub-cases implemented (per [[def:braid-H]] Notes #3,
#         GLOSSARY lines 2517-2548):
#           * 2-channel (Fibonacci, Ising σ⊗σ; lines 234-245):
#             P_vac = vv†/|v|² + orthogonal complement; reuses
#             interaction.jl's Hermitian-projector pattern.
#           * 3+-channel (general non-multiplicity-free; lines
#             247-252): **explicit involutory→unitary translation
#             via Gram-matrix orthogonalisation**
#             `G = F' * F; G_inv = inv(G); M = F * G_inv * Diagonal(R_re) * F'`.
#             This IS the [P1.6(b)] Translation rule applied at
#             matrix-element level (per P8.1a §braiding.jl line 279
#             "explicit involutory→unitary translation of [P1.6(b)]").
#         **R-symbol gauge handling per the P8.1.5b deep-D-gate
#         characterisation**: R-symbols themselves are scalars per
#         fusion channel and are NOT independently gauged
#         (gauge-invariant up to overall basis-choice ambiguity
#         in the channel-basis, resolved consistently by
#         left_intermediates/right_intermediates and by TC.jl's
#         r_symbol accessor — per [[def:rsymbol]] Notes #3,
#         GLOSSARY lines 2291-2316). Gauge-invariance of the
#         composite braid-matrix B = F R F is therefore *inherited
#         transitively* from [P1.6(b)]'s F-matrix-gauge convention,
#         not from an independent R-symbol convention. This is why
#         P8.1.5 added NO new CONVENTIONS letter for R-symbols:
#         R-symbol gauge is downstream of F-symbol gauge, handled
#         via the composite B = F R F per [P1.6(b)].
#   - (c) dagger / Hermiticity: `σ + σ†` (Hermitian sum)
#         construction throughout (head comment line 10);
#         `v1 * v1'` (line 239), `F'` (lines 249, 252) — Julia
#         adjoint syntax. Per-bond `(σ + σ†)` is manifestly
#         Hermitian; caller does NOT add σ† (docstring line 183:
#         "amplitude is already for σ+σ† (Hermitian); caller
#         should NOT add σ†").
#   - (d) multiplicity-free: ⚠ **LB-1 secondary site** at the
#         R-symbol extraction (line 43 inline comment:
#         "For multiplicity-free: R^{i,j}_k is the (row+1, row+1)
#         entry"); hybrid pattern (multiplicity-aware iteration
#         `mult > 0` check at line 41, `row += mult` at line 44,
#         but single-scalar extraction at line 43). Latent in
#         current scope; same LB-1 pattern as fsymbols.jl
#         `fusion_channels`. Per [P1.6(d)] and bd cft-anyons-q6h.
#   - (e) complex conjugation: ✓ `'` postfix (Julia adjoint =
#         conjugate-transpose for complex matrices) at lines 239,
#         249, 252; `real(dot(...))` at line 237, `real(...)` at
#         lines 192, 213, 337.
#   - (g) particle-number disambiguation: `N` in
#         `braiding_hamiltonian_sector(basis, fcache, rcache,
#         N::Int, c::Int; λ=1.0)` is MMA's particle-number reading
#         (= our n); `c` is the total-charge sector index.
#         `tv_model_spectrum(L, N)` uses MMA's `(L, N)` convention.
#         Per [P1.6(g)] and [[def:braid-H]] Notes #7 (GLOSSARY
#         lines 2588-2592).
#   - (h) local cell object Q: inherits `Q_full` via basis.
#   - (i) fusion-tree ordering: ✓ left-associated F throughout
#         (lines 196-199 `a = (p == 2) ? labels[1] : inters[p-2];
#         b = labels[p]; c = labels[p+1]; d = inters[p]`).
#         Matches [P1.6(i)] and fsymbols.jl's convention.
#   - (j) N=0 boundary: `np < 2 && continue` at lines 92, 141, 328
#         (no bonds to act on for < 2 particles). Matches [P1.6(j)].
#
# TC.jl symbols used in this file (verbatim names; all EXIST in
# TC.jl 0.5.3 per P8.0a / P8.1a verification):
#   - simples                — line 31 (`S = simples(C)`).
#   - braiding               — line 35 (`b = braiding(S[i], S[j])`).
#     The TC.jl braiding-morphism constructor; returns the morphism
#     `S[i] ⊗ S[j] → S[j] ⊗ S[i]`. Defined at
#     `TensorCategoryFramework/SixJCategory/FusionCategory.jl:239-269`
#     (verified per [[def:rsymbol]] Source / Translation map; SixJCategory
#     overload exists for braided fusion categories — Fibonacci,
#     Ising, sVec all qualify).
#   - matrix                 — line 36 (`M = matrix(b)`). Oscar
#     accessor extracting the numerical MatElem matrix from the
#     braiding-morphism cell.
#   - dim                    — line 40 (`mult = Int(dim(Hom(...)))`).
#   - Hom                    — line 40 (`Hom(S[i] ⊗ S[j], S[k])`).
#   - ⊗                      — lines 40 (monoidal product).
#   - LinearAlgebra.Diagonal — lines 252 (Gram-matrix
#     orthogonalisation `Diagonal(R_re)`).
#   - LinearAlgebra.Symmetric — line 393 (`Symmetric(H)` for
#     `tv_model_spectrum` exact-diagonalisation).
#   - LinearAlgebra.dot, .eigvals, .inv  — lines 237, 250, 393.
#     All resolved via the module-wide
#     `using LinearAlgebra, Combinatorics, SparseArrays` in
#     MobileAnyons.jl line 59.
#   - SparseArrays.sparse    — lines 75, 122, 164, 276, 294, 317.
#   - Combinatorics.combinations — line 355.
#   The TC.jl-specific symbols (`braiding`, `matrix`) are
#   imported via `using TensorCategories, Oscar` in MobileAnyons.jl
#   line 58.
#
# LB-* exposure:
#   - **LB-1 secondary site (R-symbol)** at line 43 — R-symbol
#     extraction collapses to a single scalar `M[row+1, row+1]`
#     when in general (non-multiplicity-free) R-symbols become
#     unitary matrices on the multiplicity space (per Trebst's
#     prose quote in [[def:rsymbol]] Canonical block 1: "in
#     general, R_c^{b,a} is a unitary matrix"; cf. [[def:rsymbol]]
#     Notes #4, GLOSSARY lines 2318-2334). Safe in current
#     Fibonacci/Ising/sVec scope (all multiplicity-free per
#     [P1.6(d)]). See bd cft-anyons-q6h (LB-1 master).
#   - **LB-1 secondary site (F-symbol)** inherited via fcache
#     calls (`f_matrix`, `left_intermediates`, `right_intermediates`).
#
# Drift flags (CLAUDE.md hallucination-risk callouts):
#   - **F-matrix gauge**: ✓ **fires correctly multiple times**;
#     handled exemplarily by the spectral-decomposition workaround
#     (2-channel) + Gram-matrix orthogonalisation (3+-channel).
#     **No drift.** Lines 167-180 docstring of
#     `_bond_braiding_element` is the canonical inline
#     documentation of the [P1.6(b)] application here.
#   - **vacuum-index**: ✓ — `F[:, 1]` (line 236) flagged in P8.1a
#     line 278 as in-scope safe (`1 ∈ ri` holds for the F-symbols
#     this file invokes); future-categories caveat documented at
#     [[def:braid-H]] Notes #3 (GLOSSARY line 2517).
#   - **multiplicity-free**: ✓ fires at line 43 R-symbol extraction
#     (inline comment "For multiplicity-free: …"); latent per
#     LB-1 callout above.
#   - coassoc / dagger-special / Hilbert-framings / `\unchecked` /
#     chats / Lean: not observed.
#
# Provenance: ported from MMA `src/MobileAnyons/braiding.jl`
#   at 2026-05-17 SHA256
#   d92ffdc696672d9ca44a800aacb52b1788bb8c0f0ec1072bc9253469045decd0.
# Audit references:
#   - stocktake/reports/opus-mma-julia-bridge.md (P8.1a §braiding.jl,
#     lines 254-294 — verdict: "OK. **Second gold-standard pattern**
#     alongside `interaction.jl`")
#   - stocktake/reports/opus-tcjl-conventions-bridge.md (P8.1c)
#   - GLOSSARY.md §B `def:rsymbol` (lines 2093-2349) — primary
#     binding for RSymbolCache / build_rsymbol_cache; added at
#     P8.1.5 (user directive 2026-05-17).
#   - GLOSSARY.md §B `def:braid-H` (lines 2356-2593) — primary
#     binding for braiding_hamiltonian / braiding_hamiltonian_sector;
#     added at P8.1.5 (user directive 2026-05-17).
# ============================================================

"""
    RSymbolCache

Cached R-symbol data. Stores R^{a,b}_c for each fusion channel c.
"""
struct RSymbolCache
    # R^{a,b}_c → complex phase (one per allowed fusion channel)
    r_values::Dict{Tuple{Int,Int,Int}, ComplexF64}
end

"""
    build_rsymbol_cache(C) -> RSymbolCache

Extract R-symbols from a braided category C using `braiding(S[i], S[j])`.
Works for both abelian and non-abelian categories.
"""
function build_rsymbol_cache(C)
    S = simples(C)
    d = length(S)
    r_values = Dict{Tuple{Int,Int,Int}, ComplexF64}()
    for i in 1:d, j in 1:d
        b = braiding(S[i], S[j])
        M = matrix(b)
        # M is block-diagonal: one entry per fusion channel k of i⊗j
        row = 0
        for k in 1:d
            mult = Int(dim(Hom(S[i] ⊗ S[j], S[k])))
            if mult > 0
                # For multiplicity-free: R^{i,j}_k is the (row+1, row+1) entry
                r_values[(i, j, k)] = _to_complex(C, M[row + 1, row + 1])
                row += mult
            end
        end
    end
    return RSymbolCache(r_values)
end

"""
    build_rsymbol_cache_manual(r_dict) -> RSymbolCache

Build cache from manually specified R-symbols.
`r_dict`: Dict mapping (a, b, c) → ComplexF64 value of R^{a,b}_c.
"""
function build_rsymbol_cache_manual(r_dict::Dict{Tuple{Int,Int,Int}, <:Number})
    return RSymbolCache(r_dict)
end

"""
    braiding_hamiltonian_sector(basis::AnyonBasis, fcache::FSymbolCache,
                                rcache::RSymbolCache, N::Int, c::Int; λ=1.0)
        -> SparseMatrixCSC{ComplexF64}

Build Hermitian braiding Hamiltonian H = λ Σ (σ + σ†) restricted to (N, c) sector.

For non-abelian categories, σ at bond p involves F-moves:
- Bond 1: σ diagonal with entries R^{a₁,a₂}_e
- Bond p ≥ 2: σ = F × diag(R) × F (involutory gauge, F² = I)
"""
function braiding_hamiltonian_sector(basis::AnyonBasis, fcache::FSymbolCache,
                                     rcache::RSymbolCache, N::Int, c_sector::Int; λ=1.0)
    range = get(basis.sector_ranges, (N, c_sector), 1:0)
    isempty(range) && return sparse(ComplexF64[], ComplexF64[], ComplexF64[], 0, 0)

    states = basis.states[range]
    ns = length(states)

    # Build index: (positions, labels, intermediates) → local index
    state_index = Dict{Tuple{Vector{Int}, Vector{Int}, Vector{Int}}, Int}()
    for (idx, st) in enumerate(states)
        state_index[(st.config.positions, st.config.labels, st.intermediates)] = idx
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

        for p in 1:(np - 1)
            # Only act on adjacent occupied sites
            ket.config.positions[p] + 1 == ket.config.positions[p + 1] || continue

            # _bond_braiding_element returns σ+σ† elements directly (already Hermitian)
            elements = _bond_braiding_element(fcache, rcache, labels, inters, tc, p, np)

            for (bra_inter_val, val) in elements
                change_idx = p == 1 ? 1 : p - 1
                bra_inters = copy(inters)
                bra_inters[change_idx] = bra_inter_val

                # Labels preserved by braiding (no swap)
                bra_key = (ket.config.positions, labels, bra_inters)
                bra_idx = get(state_index, bra_key, 0)
                if bra_idx > 0
                    push!(I_idx, bra_idx)
                    push!(J_idx, ket_idx)
                    push!(V_val, λ * val)
                end
            end
        end
    end

    return sparse(I_idx, J_idx, V_val, ns, ns)
end

"""
    braiding_hamiltonian(basis::AnyonBasis, fcache::FSymbolCache,
                         rcache::RSymbolCache; λ=1.0)
        -> SparseMatrixCSC{ComplexF64}

Build full Hermitian braiding Hamiltonian H = λ Σ (σ + σ†).
"""
function braiding_hamiltonian(basis::AnyonBasis, fcache::FSymbolCache,
                              rcache::RSymbolCache; λ=1.0)
    n = length(basis.states)
    I_idx = Int[]
    J_idx = Int[]
    V_val = ComplexF64[]

    for (ket_idx, ket) in enumerate(basis.states)
        np = length(ket.config.positions)
        np < 2 && continue

        labels = ket.config.labels
        inters = ket.intermediates
        tc = ket.total_charge

        for p in 1:(np - 1)
            ket.config.positions[p] + 1 == ket.config.positions[p + 1] || continue

            elements = _bond_braiding_element(fcache, rcache, labels, inters, tc, p, np)

            for (bra_inter_val, val) in elements
                change_idx = p == 1 ? 1 : p - 1
                bra_idx = _find_state_index(basis, ket, change_idx, bra_inter_val)
                if bra_idx > 0
                    push!(I_idx, bra_idx)
                    push!(J_idx, ket_idx)
                    push!(V_val, λ * val)
                end
            end
        end
    end

    return sparse(I_idx, J_idx, V_val, n, n)
end

"""
Compute Hermitian braiding (σ+σ†) matrix elements at bond p.

Uses the spectral decomposition:
    σ + σ† = Σ_f 2Re(R_f) × P_f^{phys}
where P_f^{phys} are orthogonal projectors (Σ_f P_f = I).

For bond 1 (innermost): diagonal with entries 2Re(R^{a,b}_e).
For bond p ≥ 2: decompose as
    σ+σ† = 2Re(R_last)·I + Σ_{f≠last} [2Re(R_f) - 2Re(R_last)] · P_H(f)
where P_H(f) = v_f v_f†/|v_f|² is the Hermitian projector from the F-matrix
column. This uses orthogonal complements (P + (I-P) = I) rather than
independent column projectors, avoiding non-orthogonality issues in the
involutory gauge.

Returns: vector of (bra_intermediate_value, amplitude) pairs.
The amplitude is already for σ+σ† (Hermitian); caller should NOT add σ†.
"""
function _bond_braiding_element(fcache::FSymbolCache, rcache::RSymbolCache,
                                 labels, inters, tc, p, np)
    if p == 1
        # Bond 1: innermost vertex. σ+σ† is diagonal.
        ket_e = inters[1]
        R = get(rcache.r_values, (labels[1], labels[2], ket_e), nothing)
        isnothing(R) && return Tuple{Int, ComplexF64}[]
        return [(ket_e, 2 * real(R))]
    end

    # Bond p ≥ 2: F-move needed.
    a = (p == 2) ? labels[1] : inters[p - 2]
    b = labels[p]
    c = labels[p + 1]
    d = inters[p]

    F = f_matrix(fcache, a, b, c, d)
    n_ch = size(F, 1)
    n_ch == 0 && return Tuple{Int, ComplexF64}[]

    li = left_intermediates(fcache, a, b, c, d)
    ri = right_intermediates(fcache, a, b, c, d)

    ket_e = inters[p - 1]
    ket_row = findfirst(==(ket_e), li)
    isnothing(ket_row) && return Tuple{Int, ComplexF64}[]

    # Get 2Re(R_f) for each right intermediate
    R_re = [2 * real(get(rcache.r_values, (b, c, f), zero(ComplexF64))) for f in ri]

    # Spectral decomposition of σ+σ†:
    #   σ+σ† = Σ_f 2Re(R_f) P_f^{phys}  where Σ_f P_f^{phys} = I
    #
    # For 2 channels: P_1 + P_2^{phys} = I, so P_2^{phys} = I - P_1.
    # Use P_1 = v₁v₁†/|v₁|² (same as interaction.jl vacuum projector).
    # σ+σ† = R_re[2]·I + (R_re[1] - R_re[2])·P_1
    #
    # For n>2 channels: build full matrix via Gram matrix orthogonalization.
    if n_ch == 1
        # Single channel: σ+σ† is a scalar
        result = Tuple{Int, ComplexF64}[]
        val = R_re[1]
        abs(val) > 1e-14 && push!(result, (li[1], val * (ket_row == 1 ? 1.0 : 0.0)))
        return result
    end

    # Build the full matrix M = σ+σ†
    M = zeros(ComplexF64, n_ch, n_ch)

    if n_ch == 2
        # Fast path for 2 channels (Fibonacci, Ising σ⊗σ)
        v = F[:, 1]  # vacuum channel column
        norm_sq = real(dot(v, v))
        if norm_sq > 1e-14
            P_vac = (v * v') / norm_sq
            # M = R_re[2] I + (R_re[1] - R_re[2]) P_vac
            for i in 1:n_ch
                M[i, i] = R_re[2]
            end
            M .+= (R_re[1] - R_re[2]) .* P_vac
        end
    else
        # General case: orthogonalize columns of F via Gram matrix
        # G = F'F, then F_orth = F G^{-1/2} gives orthonormal columns
        G = F' * F
        G_inv = inv(G)
        # σ+σ† = F × G^{-1} × diag(2Re(R)) × F' (in physical inner product)
        M = F * G_inv * Diagonal(R_re) * F'
    end

    # Extract column for ket_row
    result = Tuple{Int, ComplexF64}[]
    for (bra_row, bra_e) in enumerate(li)
        val = M[bra_row, ket_row]
        abs(val) > 1e-14 && push!(result, (bra_e, val))
    end

    return result
end

# --- Backward-compatible abelian interface ---

"""
    braiding_hamiltonian_sector(basis::AnyonBasis, rcache::RSymbolCache,
                                N::Int, c::Int; λ=1.0)

Abelian shortcut (no F-symbols needed). For sVec and other abelian categories.
"""
function braiding_hamiltonian_sector(basis::AnyonBasis, rcache::RSymbolCache,
                                     N::Int, c::Int; λ=1.0)
    range = get(basis.sector_ranges, (N, c), 1:0)
    isempty(range) && return sparse(ComplexF64[], ComplexF64[], ComplexF64[], 0, 0)

    states = basis.states[range]
    ns = length(states)

    I_idx = Int[]
    J_idx = Int[]
    V_val = ComplexF64[]

    for (idx, st) in enumerate(states)
        val = _braiding_diagonal_abelian(st, rcache, λ)
        if abs(val) > 1e-14
            push!(I_idx, idx)
            push!(J_idx, idx)
            push!(V_val, val)
        end
    end

    return sparse(I_idx, J_idx, V_val, ns, ns)
end

"""
    braiding_hamiltonian(basis::AnyonBasis, rcache::RSymbolCache; λ=1.0)

Abelian shortcut (no F-symbols needed).
"""
function braiding_hamiltonian(basis::AnyonBasis, rcache::RSymbolCache; λ=1.0)
    n = length(basis.states)
    I_idx = Int[]
    J_idx = Int[]
    V_val = ComplexF64[]

    for (idx, st) in enumerate(basis.states)
        val = _braiding_diagonal_abelian(st, rcache, λ)
        if abs(val) > 1e-14
            push!(I_idx, idx)
            push!(J_idx, idx)
            push!(V_val, val)
        end
    end

    return sparse(I_idx, J_idx, V_val, n, n)
end

"""
Diagonal braiding for abelian categories. Sum λ × R^{a,b}_c over adjacent pairs.
For abelian categories, each pair (a,b) has exactly one fusion channel c.
"""
function _braiding_diagonal_abelian(st::FusionTree, rcache::RSymbolCache, λ)
    pos = st.config.positions
    labs = st.config.labels
    np = length(pos)
    np < 2 && return zero(ComplexF64)

    val = zero(ComplexF64)
    for p in 1:(np - 1)
        if pos[p] + 1 == pos[p + 1]
            # Find the fusion channel for this pair
            for ((a, b, c), r) in rcache.r_values
                if a == labs[p] && b == labs[p + 1]
                    # For abelian: σ + σ† = 2Re(R) for diagonal
                    val += λ * 2 * real(r)
                    break
                end
            end
        end
    end
    return val
end

"""
    tv_model_spectrum(L, N; t, V) -> Vector{Float64}

Exact spectrum of the t-V model (spinless fermions with NN interaction, OBC):
    H = -t Σⱼ (c†ⱼcⱼ₊₁ + h.c.) + V Σⱼ nⱼnⱼ₊₁

Built directly in the occupation basis {positions of N particles on L sites}.
"""
function tv_model_spectrum(L::Int, N::Int; t=1.0, V=1.0)
    configs = collect(Combinatorics.combinations(1:L, N))
    n = length(configs)
    n == 0 && return Float64[]

    config_index = Dict{Vector{Int}, Int}()
    for (i, cfg) in enumerate(configs)
        config_index[cfg] = i
    end

    H = zeros(Float64, n, n)

    for (idx, cfg) in enumerate(configs)
        occ = Set(cfg)

        # Diagonal: V × count of adjacent occupied pairs
        for p in 1:(N - 1)
            if cfg[p] + 1 == cfg[p + 1]
                H[idx, idx] += V
            end
        end

        # Off-diagonal: hopping
        for p in 1:N
            site = cfg[p]
            for delta in [-1, 1]
                new_site = site + delta
                (1 <= new_site <= L && new_site ∉ occ) || continue
                new_cfg = copy(cfg)
                new_cfg[p] = new_site
                sort!(new_cfg)
                bra_idx = get(config_index, new_cfg, 0)
                if bra_idx > 0
                    H[bra_idx, idx] += -t
                end
            end
        end
    end

    return sort(eigvals(Symmetric(H)))
end
