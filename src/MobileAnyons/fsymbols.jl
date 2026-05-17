# F-symbol extraction from TensorCategories.jl.
#
# F-symbols (6j-symbols) encode the associator of the fusion category:
#   [F^{abc}_d]_{ef} = matrix element of the associator (a⊗b)⊗c → a⊗(b⊗c)
#   restricted to total charge d, with left intermediate e and right intermediate f.
#
# We use TensorCategories.jl's six_j_symbols(C) which returns a 4D array of matrices
# indexed by simple object indices.

# ============================================================
# GLOSSARY cross-references (added P8.4 — 2026-05-17):
#
#   - [[def:fsymbol]] — REALISED BY FSymbolCache{T} (struct,
#       wrapper for TC.jl's six_j_symbols output),
#       build_fsymbol_cache (constructor),
#       f_matrix / f_symbol (numerical accessors),
#       fusion_channels / left_intermediates / right_intermediates
#       (indexing adjuncts; row/column maps of the F-matrix).
#     The struct + constructor are explicitly cited in [[def:fsymbol]]
#     Translation map as `src/MobileAnyons/fsymbols.jl::FSymbolCache`.
#     The Fibonacci specialisation `f_matrix(cache, τ, τ, τ, τ)` is
#     cited in [[def:fib-F]] Translation map.
#
# CONVENTIONS applied (P1.6(*)):
#   - (a) vacuum at index 1: all indices `a,b,c,d in 1:d` enumerate
#         `simples(C)` 1-based; vacuum at index 1 per [P1.6(a)].
#   - (b) F-matrix gauge: **TC.jl involutory gauge stored as-is**.
#         `build_fsymbol_cache` caches `six_j_symbols(C)` verbatim;
#         `f_matrix` / `f_symbol` return raw entries. The canonical
#         summary.tex convention is **unitary**; in current
#         Fibonacci/Ising/sVec scope **gauges coincide** (Fibonacci
#         F is real symmetric involutory + unitary; Ising F is
#         Hadamard-type unitary; sVec is trivial), so **no
#         per-call translation is required**. Per [P1.6(b)]
#         Translation rule: "MMA-imported F-matrix entries (Julia):
#         assumed involutory. In current Fibonacci/Ising scope,
#         no translation needed — matrices coincide." Future scope
#         expansion (3+-channel categories) requires explicit
#         gauge translation by the consumer. Gauge-translation
#         responsibility is correctly **deferred to consumers**
#         (interaction.jl, braiding.jl, paircreation.jl,
#         finegraining.jl) — this file is a pure storage/access
#         layer.
#   - (d) multiplicity-free assumed (LB-1 secondary site at
#         `fusion_channels` — the `!iszero(dim(Hom(...)))` boolean
#         pattern is the same as hilbert.jl primary site).
#         Latent in current scope; per [P1.6(d)] and bd cft-anyons-q6h.
#   - (e) complex conjugation: `_to_complex(...)` overloads use
#         standard Oscar `Float64(real(x))` + `Float64(imag(x))`
#         casts; `_physical_embedding` picks a canonical complex
#         embedding for `AbsSimpleNumFieldElem` (e.g., Fibonacci
#         `K = Q(sqrt(5))` so that the golden ratio phi ~ 1.618 is
#         selected rather than -0.618).
#   - (h) local cell object Q: `C` is the abstract fusion category;
#         F-symbols apply for any `Q` subset of `oplus_a a` (no hard-code).
#   - (i) left-associated fusion-tree convention: F-matrix
#         interpreted as `(a⊗b)⊗c → a⊗(b⊗c)` change-of-basis
#         (head comment lines 3-5); rows = left intermediates
#         (= `left_intermediates`), cols = right intermediates
#         (= `right_intermediates`). Conforms to [P1.6(i)].
#
# TC.jl symbols used in this file (verbatim names):
#   - six_j_symbols          — `build_fsymbol_cache`; returns the
#       4D MatElem array indexed by `(a,b,c,d)`. EXISTS in TC.jl
#       0.5.3 export line 434, source
#       `src/TensorCategoryFramework/6j-Solver.jl:5`.
#   - simples                — read `d = length(simples(C))`.
#   - dim                    — non-vanishing fusion-channel test.
#   - Hom                    — Mor-space access via TC.jl.
#   - ⊗                      — monoidal product.
#   - MatElem                — Oscar/abstract matrix type used in
#       the `exact::Array{<:MatElem,4}` storage field.
#   - base_ring              — `_to_complex(C, x::AbsSimpleNumFieldElem)`.
#   - complex_embeddings     — `_physical_embedding(K)`.
#   - gen                    — `_physical_embedding(K)` for the
#       embedding-selection heuristic.
#   - QQFieldElem, ZZRingElem, AbsSimpleNumFieldElem,
#     QQBarFieldElem         — Oscar number types dispatched on by
#       the `_to_complex` overload set.
#   All EXIST per stocktake/reports/opus-tcjl-api-audit.md (P8.0a)
#   + Oscar 1.6.0 pinned via Project.toml [compat].
#
# LB-* exposure:
#   - **LB-1 secondary site** at `fusion_channels`
#     (`!iszero(dim(Hom(...)))` boolean) — same multiplicity-free
#     pattern as hilbert.jl primary site. Inherited by
#     `left_intermediates` + `right_intermediates`
#     (via `fusion_channels`). Latent in current Fibonacci/Ising/
#     sVec scope. See bd cft-anyons-q6h.
#
# Drift flags (CLAUDE.md hallucination-risk callouts):
#   - **F-matrix gauge**: fires correctly — TC.jl's involutory
#     gauge is stored raw. Per [P1.6(b)] and `CONVENTIONS.md`
#     Sweep status, this is the canonical handling pattern;
#     translation is deferred to consumers (none done in this
#     file). In current scope (Fibonacci/Ising/sVec) the
#     involutory + unitary gauges coincide so no translation is
#     needed at consumer time either — but future scope
#     expansion requires the documented per-consumer translation
#     pattern.
#
# Provenance: ported from MMA `src/MobileAnyons/fsymbols.jl`
#   at 2026-05-17 SHA256
#   a832b5d371b20fb5620467cb757faee043fb6635b25d730f816ed3568c7c6510.
# Audit references:
#   - stocktake/reports/opus-mma-julia-bridge.md (P8.1a §fsymbols.jl)
#   - stocktake/reports/opus-tcjl-conventions-bridge.md (P8.1c)
#   - stocktake/reports/opus-tcjl-api-audit.md (P8.0a)
# ============================================================

"""
    FSymbolCache{T}

Cached F-symbol data for a fusion category. Stores both exact and numerical F-matrices.
"""
struct FSymbolCache{T}
    C::T
    exact::Array{<:MatElem, 4}    # six_j_symbols(C)[a,b,c,d]
    numerical::Dict{NTuple{4,Int}, Matrix{ComplexF64}}
end

"""
    build_fsymbol_cache(C) -> FSymbolCache

Compute and cache all F-symbols for category C.
"""
function build_fsymbol_cache(C)
    sj = six_j_symbols(C)
    d = length(simples(C))
    numerical = Dict{NTuple{4,Int}, Matrix{ComplexF64}}()

    for a in 1:d, b in 1:d, c in 1:d, dd in 1:d
        F = sj[a, b, c, dd]
        r, s = size(F)
        r > 0 && s > 0 || continue
        numerical[(a, b, c, dd)] = _to_complex_matrix(C, F)
    end

    return FSymbolCache(C, sj, numerical)
end

"""
    f_matrix(cache, a, b, c, d) -> Matrix{ComplexF64}

Return the numerical F-matrix [F^{abc}_d]_{ef} as a ComplexF64 matrix.
Rows indexed by left-association intermediates e, columns by right-association intermediates f.
Returns empty 0×0 matrix if the F-symbol vanishes.
"""
function f_matrix(cache::FSymbolCache, a::Int, b::Int, c::Int, d::Int)
    return get(cache.numerical, (a, b, c, d), Matrix{ComplexF64}(undef, 0, 0))
end

"""
    f_symbol(cache, a, b, c, d, e_idx, f_idx) -> ComplexF64

Return a single F-symbol entry [F^{abc}_d]_{e_idx, f_idx}.
Indices e_idx, f_idx are 1-based into the rows/columns of the F-matrix.
"""
function f_symbol(cache::FSymbolCache, a::Int, b::Int, c::Int, d::Int,
                  e_idx::Int, f_idx::Int)
    F = f_matrix(cache, a, b, c, d)
    size(F, 1) == 0 && return zero(ComplexF64)
    return F[e_idx, f_idx]
end

"""
    fusion_channels(cache, a, b) -> Vector{Int}

Return indices of simple objects c such that N_{ab}^c > 0.
"""
function fusion_channels(cache::FSymbolCache, a::Int, b::Int)
    S = simples(cache.C)
    d = length(S)
    channels = Int[]
    for c in 1:d
        !iszero(dim(Hom(S[a] ⊗ S[b], S[c]))) && push!(channels, c)
    end
    return channels
end

"""
    left_intermediates(cache, a, b, c, d) -> Vector{Int}

Return indices e such that N_{ab}^e > 0 and N_{ec}^d > 0 (rows of F-matrix).
"""
function left_intermediates(cache::FSymbolCache, a::Int, b::Int, c::Int, d::Int)
    ab_channels = fusion_channels(cache, a, b)
    return filter(e -> d in fusion_channels(cache, e, c), ab_channels)
end

"""
    right_intermediates(cache, a, b, c, d) -> Vector{Int}

Return indices f such that N_{bc}^f > 0 and N_{af}^d > 0 (cols of F-matrix).
"""
function right_intermediates(cache::FSymbolCache, a::Int, b::Int, c::Int, d::Int)
    bc_channels = fusion_channels(cache, b, c)
    return filter(f -> d in fusion_channels(cache, a, f), bc_channels)
end

# --- Numerical conversion internals ---

function _to_complex_matrix(C, F::MatElem)
    r, c = size(F)
    M = Matrix{ComplexF64}(undef, r, c)
    for i in 1:r, j in 1:c
        M[i, j] = _to_complex(C, F[i, j])
    end
    return M
end

function _to_complex(C, x::QQFieldElem)
    return ComplexF64(Float64(x))
end

function _to_complex(C, x::ZZRingElem)
    return ComplexF64(Float64(x))
end

function _to_complex(C, x::AbsSimpleNumFieldElem)
    K = base_ring(C)
    emb = _physical_embedding(K)
    val = emb(x)
    return ComplexF64(real(val), imag(val))
end

function _to_complex(C, x::QQBarFieldElem)
    return ComplexF64(Float64(real(x)), Float64(imag(x)))
end

# Fallback for other number types
function _to_complex(C, x)
    return ComplexF64(Float64(x))
end

"""
    _physical_embedding(K::AbsSimpleNumField) -> embedding

Choose the "physical" embedding of a number field into the complexes.
For Fibonacci (degree 2): picks the embedding where the golden ratio φ > 1.
For general fields: picks the embedding with largest real part of the generator.
"""
function _physical_embedding(K::AbsSimpleNumField)
    embs = complex_embeddings(K)
    length(embs) == 1 && return embs[1]

    # Heuristic: pick the embedding where gen(K) has the largest real part.
    # For Fibonacci, this gives φ ≈ 1.618 rather than -0.618.
    best_idx = argmax(Float64(real(e(gen(K)))) for e in embs)
    return embs[best_idx]
end
