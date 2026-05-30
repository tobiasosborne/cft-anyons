# Per-bond projectors and Koo-Saleur lattice Virasoro generators.
#
# For the golden chain H = J Σ P_vac^j, the Hamiltonian is a sum of
# nearest-neighbor vacuum projectors. The Koo-Saleur construction extracts
# CFT data (central charge, scaling dimensions) by Fourier-transforming
# the Hamiltonian density.
#
# For OBC, the Fourier modes use the sine transform:
#   H_n = Σ_{j=1}^{L-1} sin(πnj/L) P_j
#
# The lattice Virasoro generators L_n ~ (L/π) H_n approximately satisfy
# [L_m, L_n] ≈ (m-n) L_{m+n} + (c/12) m(m²-1) δ_{m+n,0}

# ============================================================
# GLOSSARY cross-references (added P8.7 — 2026-05-17):
#
# **Partial port.** This file is imported from MMA per
# MIGRATION_PLAN.md P8.7 ("`virasoro.jl`: import everything
# except `virasoro_commutator_check` (returns `c_estimate=NaN`,
# a stub). Add a RESEARCH_NOTES.md task to either complete or
# remove it."). Two of three MMA-exported public functions
# (`bond_projectors_dense`, `hamiltonian_fourier_modes`) are
# ported BYTE-IDENTICAL with the head comment + bodies preserved
# verbatim from MMA. The third public function
# `virasoro_commutator_check` is EXCLUDED — see the exclusion
# notice block below where the excluded code used to live (MMA
# source lines 95-140). No internal-helper chain accompanies the
# exclusion (the function has no sole-caller helpers; exclusivity
# verified pre-port via `grep -rn` across MMA src + test — zero
# call sites outside the function's own definition).
#
#   - [[def:KS-Ln]] — REALISED BY
#       hamiltonian_fourier_modes (function, line 79 of MMA
#         source; preserved at the corresponding destination line
#         after this docstring header) — MMA's **OBC sine-transform
#         variant** $H_n = \sum_{j=1}^{L-1} \sin(\pi n j / L)\, P_j$
#         of the Koo-Saleur lattice Virasoro approximants. Per
#         [[def:KS-Ln]] Translation map: "`src/MobileAnyons/
#         virasoro.jl::hamiltonian_fourier_modes` builds an **OBC
#         sine-transform** variant $H_n = \sum_{j=1}^{L-1} \sin(\pi
#         n j / L)\, P_j$ — a different (weaker) approximant from
#         `summary.tex`'s PBC complex-exponential $L_n^{(N)}$
#         defined here. Per `stocktake/reports/mma-julia.md` §5
#         line 139: 'they differ in boundary conditions (OBC sine
#         vs PBC exponential) and normalisation, so they are not
#         the same operator.'" Returns a `Dict{Int, Matrix{
#         ComplexF64}}` with one Fourier-mode matrix per mode
#         index `n = 1, …, n_modes`. NOT the chiral / anti-chiral
#         pair $L_n^{(N)}, \bar L_n^{(N)}$ of the canonical
#         [[def:KS-Ln]] formula — a single bare OBC sine transform
#         on the per-bond projectors.
#   - [[def:KS-scalars]] — REALISED IMPLICITLY BY
#       hamiltonian_fourier_modes (same site as above) — the
#         Koo-Saleur scalars $\kappa, v$ of [[def:KS-scalars]]
#         appear IMPLICITLY (not explicitly named in the code).
#         Per [[def:KS-scalars]] Translation map: "The Koo-Saleur
#         constants $\kappa, v$ appear implicitly in
#         `src/MobileAnyons/virasoro.jl::hamiltonian_fourier_modes`
#         (which builds $H_n = \sum_{j=1}^{L-1} \sin(\pi n j / L)\,
#         P_j$); MMA's OBC sine-transform variant skips the
#         explicit $\kappa$ normalisation." The function returns
#         the bare sine-transformed sum without the $\kappa$
#         pre-factor; downstream consumers must apply the
#         normalisation themselves (e.g., MMA's `T = L/π × H`
#         rescaling, seen at the entry of the EXCLUDED
#         `virasoro_commutator_check` body).
#   - [[def:TL-cat]] — REALISED BY
#       bond_projectors_dense (function, line 21 of MMA source;
#         preserved at the corresponding destination line after
#         this docstring header) — per-bond vacuum projectors
#         $P_1, \ldots, P_{L-1}$ on the dense ($N = L$, all sites
#         occupied) sector of the anyonic Hilbert space in total-
#         charge sector `c`. Conceptually the per-bond
#         Temperley-Lieb generator $e_j / d_\sigma$ in dense
#         anyon language per [[def:TL-cat]] (the
#         vacuum-projector-realisation route to TL generators on
#         the dense sector). Built via the `_bond_projector_element`
#         helper exported by `interaction.jl` (line 47 callsite);
#         all gauge-handling for the F-symbol contraction is
#         inherited from that helper (which uses the gauge-aware
#         Hermitian-projector pattern from interaction.jl's
#         `_bond_projector_element` — the gold-standard pattern
#         documented at the head of `interaction.jl` per P8.5).
#
# EXCLUDED — would have realised [[def:KS-Ln]] partial:
#   - virasoro_commutator_check (would have been at line 106 of
#     MMA source) — lattice Virasoro algebra commutator check via
#     computing `[T_1, T_2]` vs `-T_3` and returning a
#     `(c_estimate, algebra_errors)` named tuple. **Returns
#     `c_estimate = NaN`** — the central-charge extraction is
#     deliberately not implemented (the function body explicitly
#     notes "extract c from the spectrum directly using the Cardy
#     formula (already in `test_golden_chain_cft.jl`)" rather
#     than algebraically). Per [[def:KS-Ln]] Translation map:
#     "The companion `virasoro_commutator_check` returns
#     `c_estimate = NaN` (stub — `mma-julia.md` §4 line 113).
#     Actual $c = 7/10$ extraction is performed via Cardy
#     finite-size fit in `test/test_golden_chain_cft.jl`, not via
#     algebraic commutator check. `summary.tex`'s `\unchecked`
#     flag on Conjecture `conj:KS` remains undischarged." See the
#     exclusion notice block below for the disposition + the new
#     RESEARCH_NOTES.md entry pointer.
#
# CONVENTIONS applied (P1.6(*)):
#   - (a) vacuum index: ✓ — `(L, c)` sector key 1-based; vacuum
#         entering via the inherited `_bond_projector_element`
#         helper from interaction.jl (no `F[:, 1]` extraction
#         direct in this file).
#   - (b) F-matrix gauge: ✓ — inherits the gauge-aware Hermitian-
#         projector pattern from `interaction.jl::
#         _bond_projector_element` (called at MMA line 47 within
#         `bond_projectors_dense`); no new F-symbol arithmetic in
#         this file.
#   - (c) dagger: ✓ — Hermitian projectors via the inherited
#         interaction.jl pattern (real-valued amplitudes on the
#         vacuum diagonal; off-diagonal Hermiticity enforced
#         upstream).
#   - (d) multiplicity-free: ⚠ N/A directly — inherits LB-1
#         secondary site via `_bond_projector_element` and basis
#         (`bond_projectors_dense` operates on `basis.states[range]`
#         from `hilbert.jl::build_basis` which carries the LB-1
#         multiplicity-free assumption at `hilbert.jl:58` —
#         marked with the LB-1 TODO at P8.4).
#   - (e) complex conjugation: ✓ — `ComplexF64` throughout;
#         `H_n .+= phase .* Matrix(Pj)` (MMA line 87) where
#         `phase = sin(...)` is real, so the complex-arithmetic
#         path is unexercised in the kept scope (vestigial
#         `ComplexF64` typing).
#   - (g) particle-number disambiguation: ✓ — `L` = lattice length
#         (= our `L`); no `N` parameter at function level (instead
#         uses the dense-sector implicit `(L, c)` ket-restriction
#         at MMA line 22 — the dense sector is `N = L`, i.e.,
#         all sites occupied; per [P1.6(g)] MMA-convention).
#   - (h) local cell object Q: ✓ — inherits `Q_full = ⊕_a a` via
#         basis (config.jl carries the choice).
#   - (i) fusion-tree ordering: ✓ — left-associated via inherited
#         `_bond_projector_element`; `ket.intermediates` passed
#         through verbatim.
#   - (j) N=0 boundary: ✓ — `bond_projectors_dense` for `(L, c)`
#         empty sector returns `SparseMatrixCSC{ComplexF64}[]`
#         (MMA line 23); `hamiltonian_fourier_modes` works for
#         any positive-length projector list (its assumption is
#         non-empty projector list, not a particle-count
#         constraint).
#
# Letter (f) is N/A: no TikZ macro source in this code file.
#
# TC.jl symbols used in this file (verbatim names):
#   - none direct. Only `SparseArrays.sparse` (MMA line 64),
#     `SparseArrays.SparseMatrixCSC` (MMA lines 23, 34) and
#     `LinearAlgebra` (implicit via `Matrix(Pj)` at MMA line 87) —
#     all resolved via the module-wide
#     `using LinearAlgebra, Combinatorics, SparseArrays` in
#     MobileAnyons.jl line 59. The EXCLUDED
#     `virasoro_commutator_check` additionally consumed
#     `LinearAlgebra.norm` (MMA line 123) and matrix algebra
#     (`*`, `-` on `Matrix{ComplexF64}`) — both callsites are
#     removed with the exclusion. No TC.jl symbols anywhere
#     in this file (the file operates on basis + projector data
#     passed through from the basis + inherited helpers).
#
# LB-* exposure:
#   - **LB-1 secondary site inherited via basis only.** Per
#     P8.1a §Synthesis line 466 (`hilbert.jl:58` primary;
#     `fsymbols.jl:75` / `braiding.jl:43` / `paircreation.jl:24`
#     / `finegraining.jl:315` secondary [the finegraining.jl
#     callsite removed at P8.6 by exclusion]), this file has NO
#     direct LB-1 callsite — inheritance is via `basis.states`
#     and `_bond_projector_element` only. The EXCLUDED
#     `virasoro_commutator_check` likewise had no direct LB-1
#     callsite.
#
# Drift flags (CLAUDE.md hallucination-risk callouts):
#   - F-matrix gauge: ✓ — correctly inherited via interaction.jl's
#     gold-standard pattern; no new drift in this file.
#   - **`\unchecked` flags**: ⚠ — the head comment line 12 above
#     mentions the Koo-Saleur algebra
#     `[L_m, L_n] ≈ (m-n) L_{m+n} + (c/12) m(m²-1) δ_{m+n,0}` as
#     the target that the EXCLUDED `virasoro_commutator_check`
#     stub purports to test. Per `CITATION_INDEX.md` and
#     [[def:KS-Ln]] Notes, the **Koo-Saleur 1994 original** is one
#     of the `\unchecked` citations *without* a local source.
#     **Not silently treating the flag as discharged** — the file
#     is correctly cautious (the function returns NaN; algebra
#     not actually checked; MIGRATION_PLAN excludes the function
#     at P8.7). No drift introduced. Per P8.1a audit
#     (`stocktake/reports/opus-mma-julia-bridge.md` lines 421,
#     434, 453, 483): "NOT silently treated as discharged".
#   - vacuum-index: ✓ — inherits 1-based via interaction.jl.
#   - multiplicity-free: LB-1 inherited via basis only (see above).
#   - coassoc / dagger-special / Hilbert-framings / chats / Lean:
#     not observed.
#
# Provenance: ported from MMA `src/MobileAnyons/virasoro.jl`
#   at 2026-05-17 SHA256
#   59c9d62a1eb49ea3a69b41a8c22e5e700f768ad55f0cb58ca72f644b5447d8d1.
#   Destination SHA256 differs from source per (a) this docstring
#   header block, (b) the EXCLUSION-notice block below (replaces
#   MMA source lines 95-140 — the entire `virasoro_commutator_check`
#   docstring + function body + trailing newline). The two kept
#   public function bodies (`bond_projectors_dense` lines 14-68
#   of MMA source; `hamiltonian_fourier_modes` lines 70-93 of MMA
#   source) are BYTE-IDENTICAL to MMA source.
# Audit references:
#   - stocktake/reports/opus-mma-julia-bridge.md (P8.1a
#     §virasoro.jl, lines 420-453 — verdict: "OK — two of three
#     exports clean (`bond_projectors_dense`,
#     `hamiltonian_fourier_modes`); `virasoro_commutator_check`
#     is a NaN-returning stub correctly excluded at P8.7 per
#     MIGRATION_PLAN. **bd issue filed** (Synthesis) tracking the
#     'complete or remove' decision.").
#   - stocktake/MIGRATION_PLAN.md line 275 (P8.7 plan-text).
#   - bd cft-anyons-5pc (P8.7 implementer issue — closed by this
#     commit).
#   - bd cft-anyons-qki (P3 follow-up — DISCHARGED inline at this
#     P8.7 commit; closed by this commit; RESEARCH_NOTES.md
#     disposition task added in the same commit).
# ============================================================

"""
    bond_projectors_dense(basis::AnyonBasis, cache::FSymbolCache, L::Int, c::Int)
        -> Vector{SparseMatrixCSC{ComplexF64}}

Return per-bond vacuum projector matrices P_1, ..., P_{L-1} for the dense chain
(N=L, all sites occupied) in the total-charge sector c.
"""
function bond_projectors_dense(basis::AnyonBasis, cache::FSymbolCache, L::Int, c::Int)
    range = get(basis.sector_ranges, (L, c), 1:0)
    isempty(range) && return SparseMatrixCSC{ComplexF64}[]

    states = basis.states[range]
    ns = length(states)

    # State index for this sector
    state_index = Dict{Tuple{Vector{Int}, Vector{Int}}, Int}()
    for (idx, st) in enumerate(states)
        state_index[(st.config.positions, st.intermediates)] = idx
    end

    projectors = SparseMatrixCSC{ComplexF64}[]

    for p in 1:(L - 1)
        I_idx = Int[]
        J_idx = Int[]
        V_val = ComplexF64[]

        for (ket_idx, ket) in enumerate(states)
            # Dense chain: all sites occupied, so bond p always between adjacent sites
            labels = ket.config.labels
            inters = ket.intermediates
            tc = ket.total_charge

            element = _bond_projector_element(cache, labels, inters, tc, p, L)

            for (bra_inter_p, val) in element
                change_idx = p == 1 ? 1 : p - 1
                bra_inters = copy(inters)
                bra_inters[change_idx] = bra_inter_p

                bra_key = (ket.config.positions, bra_inters)
                bra_idx = get(state_index, bra_key, 0)
                if bra_idx > 0
                    push!(I_idx, bra_idx)
                    push!(J_idx, ket_idx)
                    push!(V_val, val)
                end
            end
        end

        push!(projectors, sparse(I_idx, J_idx, V_val, ns, ns))
    end

    return projectors
end

"""
    hamiltonian_fourier_modes(projectors::Vector, L::Int; n_modes::Int=4)
        -> Dict{Int, Matrix{ComplexF64}}

Compute Fourier modes of the Hamiltonian density for OBC:
  H_n = Σ_{j=1}^{L-1} sin(πnj/L) P_j

Returns modes for n = 1, ..., n_modes.
"""
function hamiltonian_fourier_modes(projectors::Vector, L::Int; n_modes::Int=4)
    ns = size(projectors[1], 1)
    modes = Dict{Int, Matrix{ComplexF64}}()

    for n in 1:n_modes
        H_n = zeros(ComplexF64, ns, ns)
        for (j, Pj) in enumerate(projectors)
            phase = sin(π * n * j / L)
            H_n .+= phase .* Matrix(Pj)
        end
        modes[n] = H_n
    end

    return modes
end

# ============================================================
# EXCLUSION (P8.7 — 2026-05-17):
#
# `virasoro_commutator_check` (originally at MMA
# `src/MobileAnyons/virasoro.jl` lines 95-140 — docstring at MMA
# lines 95-105, function header at MMA line 106, trailing `end`
# at MMA line 140) is EXCLUDED from this port per
# MIGRATION_PLAN.md P8.7 (line 275: "`virasoro.jl`: import
# everything **except** `virasoro_commutator_check` (returns
# `c_estimate=NaN`, a stub). Add a `RESEARCH_NOTES.md` task to
# either complete or remove it."). The function returns
# `c_estimate = NaN` (MMA line 139) — the central-charge
# extraction algorithm is deliberately not implemented (the
# function body comment at MMA lines 134-137 explicitly defers
# to "extract c from the spectrum directly using the Cardy
# formula (already in `test_golden_chain_cft.jl`)" rather than
# completing the algebraic commutator-based central-charge fit).
#
# No internal-helper chain accompanies this exclusion: the
# function has NO sole-caller helpers (verified pre-port via
# `grep -rn 'virasoro_commutator_check'` across MMA `src/` +
# `test/` directories — zero call sites outside the function's
# own definition + the `MobileAnyons.jl:31` export line. The
# function only calls top-level operators (matrix `*`, `-`,
# `LinearAlgebra.norm`, `Base.haskey`) and reads its input
# `Dict` directly — no in-file private helpers consumed by it
# alone).
#
# Total excised: MMA source lines 95-140 (46 lines including
# the 11-line docstring at MMA lines 95-105, the 35-line
# function body at MMA lines 106-140 including the trailing
# `end` at MMA line 140; the source file's final newline at
# MMA line 141 closes the file).
#
# **NaN-stub nature (per P8.1a §virasoro.jl line 434 + line 483
# + line 453):** The function body computes the `T = L/π × H`
# rescaling at MMA lines 107-113, sets up an `errors` dict at
# MMA line 115, attempts the `[T_1, T_2] ≈ -T_3` commutator
# check at MMA lines 118-126, notes that `[T_1, T_1]` is
# trivially zero at MMA lines 128-132, and then in the comment
# at MMA lines 134-137 EXPLICITLY DEFERS the central-charge
# estimation to the Cardy finite-size fit performed in
# `test/test_golden_chain_cft.jl`. The returned
# `c_estimate = NaN` at MMA line 139 is therefore not a bug to
# fix in-place — it is a deliberate stub indicating that the
# correct $c$ extraction path is elsewhere. The `algebra_errors`
# dict it does populate carries diagnostic information about
# how close the OBC-sine-transformed `T_n` operators come to
# satisfying the Witt subalgebra relations, but this is not
# packaged into a closed-form central-charge extractor.
#
# **Categorical-content note (per [[def:KS-Ln]] Translation
# map):** The canonical [[def:KS-Ln]] formula is the PBC
# complex-exponential pair $L_n^{(N)}, \bar L_n^{(N)}$ with
# explicit $\kappa$ scalars from [[def:KS-scalars]] and an
# imaginary-part commutator term $i\kappa [e_j, e_{j+1}]$
# separating chiral and antichiral sectors. MMA's OBC sine-
# transform variant in `hamiltonian_fourier_modes` is the
# common $\sin(\pi n j / L)$ real part only — i.e., the chiral
# and antichiral generators are conflated. A complete
# central-charge extraction via algebraic commutator check
# would require either (i) augmenting MMA to compute the
# separate $L_n^{(N)}$ and $\bar L_n^{(N)}$ via PBC complex
# exponentials (NEW MATH — must escalate to user per CLAUDE.md
# Law 1), or (ii) deriving the correct OBC analog of the
# commutator-based $c$-extraction (likely also NEW MATH; the
# OBC commutator structure is "more complex" per the in-file
# comment at MMA line 136). Either path is mathematical-content
# work, not a port-time refinement.
#
# For the original MMA source of this function, see:
#   archive/mma-archive-v0-snapshot/microscopic-mobile-anyons/
#     src/MobileAnyons/virasoro.jl
# (currently empty `.gitkeep` placeholder at
# `archive/mma-archive-v0-snapshot/.gitkeep`; MMA-v0 snapshot
# import scheduled at MIGRATION_PLAN.md Phase 10
# "Selective archive/v0 extraction"; until Phase 10 lands, the
# MMA original at `/home/tobiasosborne/Projects/microscopic-
# mobile-anyons/src/MobileAnyons/virasoro.jl` lines 95-140 is
# the live source; MMA source SHA256 at this P8.7 commit:
# 59c9d62a1eb49ea3a69b41a8c22e5e700f768ad55f0cb58ca72f644b5447d8d1).
#
# **Disposition: tracked in RESEARCH_NOTES.md for future
# completion or formal WONTPORT.** Per MIGRATION_PLAN.md P8.7
# literal, this commit adds a new RESEARCH_NOTES.md task entry
# (in the "Deferred decisions" section, anchor `DD-2`) naming
# the function, the NaN-stub reason for exclusion, and the
# binary decision required:
#   (i) COMPLETE the implementation — would require proper OBC
#       chiral / antichiral separation per the [[def:KS-Ln]]
#       formula at the cost of MAJOR new code (and likely new
#       mathematical work — escalate per Law 1), OR
#   (ii) formally archive as WONTPORT — defer to the Cardy
#        finite-size fit in `test/test_golden_chain_cft.jl` as
#        the canonical $c$-extraction path, with a brief in
#        PROVENANCE.md documenting the architectural reason.
# Decision deferred to Phase-9-or-later; not blocking Phase-8
# close (this is a research-decision item, not a port-time
# blocker).
#
# bd `cft-anyons-qki` (P3 follow-up filed at P8.1a tracking
# this disposition task) is DISCHARGED inline at this P8.7
# commit: the RESEARCH_NOTES.md entry has been added; the
# disposition is "tracked in RESEARCH_NOTES.md for future
# completion or formal WONTPORT."
#
# Audit references (this exclusion is bid-supported):
#   - stocktake/reports/opus-mma-julia-bridge.md (P8.1a)
#     §virasoro.jl lines 420-453 — verdict: "EXCLUDED at P8.7
#     per MIGRATION_PLAN; port-time exclusion note + new
#     RESEARCH_NOTES entry 'either complete or remove' per
#     `MIGRATION_PLAN.md:275`".
#   - stocktake/MIGRATION_PLAN.md line 275 (P8.7 plan-text).
#   - bd cft-anyons-5pc (P8.7 implementer issue — closed by this
#     commit).
#   - bd cft-anyons-qki (P3 follow-up — DISCHARGED + closed by
#     this commit).
#   - RESEARCH_NOTES.md §Deferred decisions DD-2 (added in this
#     commit) — the "complete or remove" disposition task.
# ============================================================
