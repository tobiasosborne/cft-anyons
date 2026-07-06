# GnsCornerCalculus.jl
#
# CA-72: GNS descent and corner calculus over the placement category
# (RefinementPlacements.jl) and the block algebra A_k ≅ ⊕_c M_{m_c(k)} of the
# Fibonacci word sectors (AnyonicWordAlgebra.jl). For a placement φ: [k]→[l] with
# per-charge block isometries V_c = placement_refinement_matrix(φ, c) (V_c'V_c = I):
#   θ(T)_c = V_c T_c V_c'   corner *-morphism A_k → A_l (θ(ST)=θ(S)θ(T), θ(S†)=θ(S)†)
#   P_c    = V_c V_c'       corner projection in A_l     (P²=P=P†, θ(1)=P)
#
# A block state ω = (w_c, ρ_c) gives ω(T) = Σ_c w_c tr(ρ_c T_c). The normalized
# pullback ω_k(T) := ω_l(θ(T))/ω_l(P) is again a block state with
#   w'_c = w_c tr(ρ_c P_c)/ω_l(P),   ρ'_c = V_c' ρ_c V_c / tr(ρ_c P_c),
# since ω_l(θ(T)) = Σ_c w_c tr(V_c'ρ_c V_c · T_c) and tr(V_c'ρ_c V_c) = tr(ρ_c P_c)
# (cyclicity + V_c'V_c = I); thus Σ_c w'_c = 1 and tr ρ'_c = 1.
#
# GNS(ω) is built on the algebra itself: basis = matrix units E^c_{ij} (ordered
# charge, then column j, then row i), Gram G[(c,i,j),(c,i,j')] = ω(E^c_{ji}E^c_{ij'})
# = w_c ρ_c[j',j], cyclic vector Ω = coords of 1, left action π(T) E^c_{ij} =
# Σ_p (T_c)_{pi} E^c_{pj}. The descent J[T]_k := ω_l(P)^{-1/2} [θ(T)]_l is a Gram
# isometry J†G_l J = G_k (θ(S†T)=θ(S)†θ(T) + the pullback identity) and intertwines
# J π_k(S) = π_l(θ(S)) J (θ a homomorphism). Its vacuum defect is the shard's heart:
#   ‖JΩ_k − Ω_l‖²_{G_l} = ‖ω_l(P)^{-1/2}[P] − [1]‖² = 2(1 − √ω_l(P)),
# using ⟨[P],[1]⟩ = ⟨[P],[P]⟩ = ω_l(P), ⟨[1],[1]⟩ = 1 (P²=P=P†). The unital
# completion Φ_χ(T) = θ(T) + χ(T)(1 − P) is unital with exact defect
#   Φ_χ(ST) − Φ_χ(S)Φ_χ(T) = (χ(ST) − χ(S)χ(T))(1 − P)
# (cross terms θ(S)(1−P) = (1−P)θ(T) = 0; (1−P)² = 1−P).
# Mutation-proof record (AGENTS.md Rule 6; each applied to THIS file alone, the
# "gns descent and corner calculus (CA-72)" testset re-run, RED confirmed with the
# profile below observed verbatim, then reverted):
#   (a) descent_intertwiner scale 1/√ω(P) → 1.0: J stops being a Gram isometry, so
#       (C) isometry/defect + (D) residual collectors and the 2 pinned (C) checks
#       FAIL (intertwining survives, scale independent). 36 pass, 4 fail.
#   (b) unital_completion (I − P) → P: Φ_χ(I)=2P≠I, every (E) check FAILS (unitality
#       ×4, GNS-norm ×2, defect+mixture collector, pinned defect ×2). 31 pass, 9 fail.
#   (c) _corner_projection V*V' → V'*V (k×k, not the l×l rank-m_c(k) projection): the
#       (A) sweep hits an l-vs-k DimensionMismatch and aborts. 0 pass, 1 error.
#
# Conventions: CONVENTIONS.md (a) unit-first Irr order (charge order (:one,:tau)),
# (b) unitary gauge (V_c integer isometries, so f* = f†). No deps beyond LinearAlgebra.

# Floor below which a corner mass tr(ρ_c P_c) is treated as exactly zero.
const _CORNER_FLOOR = 1e-12

"""
    BlockState(weights, densities; atol = 1e-10)

Block state ω = (w_c, ρ_c) on A ≅ ⊕_c M_{m_c}: `weights` with w_c ≥ 0 and Σ_c w_c = 1,
`densities` with each ρ_c Hermitian, PSD and tr ρ_c = 1 (all within `atol`; both
charges `:one`, `:tau` required). Fail-loud on any violation.
"""
struct BlockState
    weights::Dict{Symbol,Float64}
    densities::Dict{Symbol,Matrix{ComplexF64}}
    function BlockState(weights::AbstractDict, densities::AbstractDict; atol::Real = 1e-10)
        w = Dict{Symbol,Float64}()
        ρ = Dict{Symbol,Matrix{ComplexF64}}()
        for c in _FIB_CHARGES
            haskey(weights, c) || error("BlockState missing weight for charge $c")
            haskey(densities, c) || error("BlockState missing density for charge $c")
            wc = Float64(real(weights[c]))
            wc >= -atol || error("BlockState weight for $c is negative: $wc")
            w[c] = wc
            M = Matrix{ComplexF64}(densities[c])
            size(M, 1) == size(M, 2) || error("BlockState density $c not square: $(size(M))")
            isapprox(M, M'; atol = atol) || error("BlockState density $c not Hermitian")
            emin = isempty(M) ? 0.0 : minimum(eigvals(Hermitian(M)))
            emin >= -atol || error("BlockState density $c not PSD (min eig $emin)")
            abs(tr(M) - 1) <= atol || error("BlockState density $c has trace $(tr(M)) != 1")
            ρ[c] = M
        end
        s = sum(values(w))
        abs(s - 1) <= atol || error("BlockState weights sum to $s != 1")
        return new(w, ρ)
    end
end

"""
    state_expectation(ω::BlockState, T) -> ComplexF64

ω(T) = Σ_c w_c tr(ρ_c T_c) for a block operator `T` (an `AbstractDict{Symbol}`).
"""
function state_expectation(omega::BlockState, T)
    s = zero(ComplexF64)
    for c in _FIB_CHARGES
        s += omega.weights[c] * tr(omega.densities[c] * T[c])
    end
    return s
end

# Corner projection P_c = V_c V_c' ∈ A_l. Mutation-proof target (c): V_c V_c' (an
# m_c(l)×m_c(l) rank-m_c(k) projection), NOT V_c' V_c (= I_{m_c(k)}).
_corner_projection(phi::Placement, c::Symbol) =
    (V = placement_refinement_matrix(phi, c); V * V')

"""
    corner_projection(phi) -> Dict(charge => P_c)

Block corner projections P_c = V_c V_c' of the placement `phi` (P² = P = P†).
"""
corner_projection(phi::Placement) = Dict(c => _corner_projection(phi, c) for c in _FIB_CHARGES)

"""
    corner_morphism(T, phi) -> Dict(charge => θ(T)_c)

Corner *-morphism θ(T)_c = V_c T_c V_c' : A_k → A_l (exact on integer input;
θ(ST)=θ(S)θ(T), θ(S†)=θ(S)†, θ(1)=P).
"""
corner_morphism(T, phi::Placement) =
    Dict(c => (V = placement_refinement_matrix(phi, c); V * T[c] * V') for c in _FIB_CHARGES)

"""
    corner_weight(omega_l::BlockState, phi) -> Float64

ω_l(P_φ) = Σ_c w_c tr(ρ_c P_c) ∈ [0,1], the mass ω_l places on the corner.
"""
function corner_weight(omega_l::BlockState, phi::Placement)
    w = zero(ComplexF64)
    for c in _FIB_CHARGES
        w += omega_l.weights[c] * tr(omega_l.densities[c] * _corner_projection(phi, c))
    end
    return real(w)
end

"""
    pullback_state(omega_l::BlockState, phi) -> BlockState

Normalized pullback ω_k(T) = ω_l(θ(T))/ω_l(P) on A_k: w'_c = w_c tr(ρ_c P_c)/ω_l(P),
ρ'_c = V_c' ρ_c V_c / tr(ρ_c P_c). A block with tr(ρ_c P_c) = 0 gets weight 0 and the
maximally mixed placeholder I/m_c(k). Fail-loud unless ω_l(P) > 0.
"""
function pullback_state(omega_l::BlockState, phi::Placement)
    wP = corner_weight(omega_l, phi)
    wP > 0 || error("pullback_state needs ω_l(P) > 0, got $wP")
    w = Dict{Symbol,Float64}()
    ρ = Dict{Symbol,Matrix{ComplexF64}}()
    for c in _FIB_CHARGES
        V = placement_refinement_matrix(phi, c)
        tc = real(tr(omega_l.densities[c] * _corner_projection(phi, c)))
        mk = size(V, 2)
        if tc > _CORNER_FLOOR
            w[c] = omega_l.weights[c] * tc / wP
            R = (V' * omega_l.densities[c] * V) / tc
            ρ[c] = (R + R') / 2
        else
            w[c] = 0.0
            ρ[c] = Matrix{ComplexF64}(I, mk, mk) / mk
        end
    end
    return BlockState(w, ρ)
end

# Block dimensions (m_one(k), m_tau(k)) of A_k as a charge-keyed Dict.
_block_dims(k::Integer) =
    (m = fibonacci_word_multiplicity_recurrence(k); Dict(:one => m[1], :tau => m[2]))

# Matrix-unit basis of A_k as (charge, row i, col j), ordered charge → col → row.
function _matrix_unit_basis(k::Integer)
    dims = _block_dims(k)
    basis = Tuple{Symbol,Int,Int}[]
    for c in _FIB_CHARGES, j in 1:dims[c], i in 1:dims[c]
        push!(basis, (c, i, j))
    end
    return basis
end

"""
    gns_gram(omega::BlockState, k) -> Matrix{ComplexF64}

Gram matrix G[u,v] = ω(B_u† B_v) of the matrix-unit basis of A_k
(`_matrix_unit_basis` order): G[(c,i,j),(c,i,j')] = w_c ρ_c[j',j]. Positive definite
iff ω is faithful.
"""
function gns_gram(omega::BlockState, k::Integer)
    dims = _block_dims(k)
    basis = _matrix_unit_basis(k)
    idx = Dict(b => u for (u, b) in enumerate(basis))
    G = zeros(ComplexF64, length(basis), length(basis))
    for c in _FIB_CHARGES
        d = dims[c]
        size(omega.densities[c], 1) == d ||
            error("gns_gram: density $c size $(size(omega.densities[c])) != m_$c($k)=$d")
        for i in 1:d, j in 1:d, jp in 1:d
            G[idx[(c, i, j)], idx[(c, i, jp)]] = omega.weights[c] * omega.densities[c][jp, j]
        end
    end
    return G
end

"""
    gns_cyclic_vector(k) -> Vector{ComplexF64}

GNS cyclic vector Ω = coords of 1 ∈ A_k: 1 on each diagonal unit E^c_{ii}, else 0.
"""
function gns_cyclic_vector(k::Integer)
    basis = _matrix_unit_basis(k)
    Ω = zeros(ComplexF64, length(basis))
    for (u, (c, i, j)) in enumerate(basis)
        i == j && (Ω[u] = one(ComplexF64))
    end
    return Ω
end

"""
    gns_coordinates(T, k) -> Vector{ComplexF64}

Coordinate vector [T] of `T ∈ A_k`: [T]_{(c,i,j)} = (T_c)_{ij}.
"""
function gns_coordinates(T, k::Integer)
    basis = _matrix_unit_basis(k)
    v = zeros(ComplexF64, length(basis))
    for (u, (c, i, j)) in enumerate(basis)
        v[u] = T[c][i, j]
    end
    return v
end

"""
    gns_left_action(T, k) -> Matrix{ComplexF64}

Left action π(T) on GNS(A_k): π(T) E^c_{ij} = Σ_p (T_c)_{pi} E^c_{pj}; π(T)Ω = [T].
"""
function gns_left_action(T, k::Integer)
    dims = _block_dims(k)
    basis = _matrix_unit_basis(k)
    idx = Dict(b => u for (u, b) in enumerate(basis))
    Π = zeros(ComplexF64, length(basis), length(basis))
    for c in _FIB_CHARGES
        d = dims[c]
        for j in 1:d, i in 1:d, p in 1:d
            Π[idx[(c, p, j)], idx[(c, i, j)]] += T[c][p, i]
        end
    end
    return Π
end

"""
    descent_intertwiner(omega_l::BlockState, phi) -> Matrix{ComplexF64}

Matrix of J : coords of T ↦ ω_l(P)^{-1/2} · coords of θ(T), from the coarse GNS space
of `pullback_state(omega_l, phi)` to the fine GNS space of `omega_l`. As
[θ(T)]_{(c,a,b)} = Σ_{ij}(V_c)_{ai}(V_c)_{bj}[T]_{(c,i,j)}, J has one entry
ω_l(P)^{-1/2} per coarse column. Fail-loud unless ω_l(P) > 0.
"""
function descent_intertwiner(omega_l::BlockState, phi::Placement)
    wP = corner_weight(omega_l, phi)
    wP > 0 || error("descent_intertwiner needs ω_l(P) > 0, got $wP")
    scale = 1 / sqrt(wP)
    cbasis = _matrix_unit_basis(phi.k)
    fbasis = _matrix_unit_basis(phi.l)
    cidx = Dict(b => u for (u, b) in enumerate(cbasis))
    fidx = Dict(b => u for (u, b) in enumerate(fbasis))
    J = zeros(ComplexF64, length(fbasis), length(cbasis))
    for c in _FIB_CHARGES
        V = placement_refinement_matrix(phi, c)
        d = size(V, 2)
        rowof = [findfirst(==(1), view(V, :, col)) for col in 1:d]
        for i in 1:d, j in 1:d
            J[fidx[(c, rowof[i], rowof[j])], cidx[(c, i, j)]] = scale
        end
    end
    return J
end

"""
    unital_completion(T, chi::BlockState, phi) -> Dict(charge => Φ_χ(T)_c)

Unital completion Φ_χ(T)_c = V_c T_c V_c' + χ(T)(I − P_c), the SCALAR
χ(T) = state_expectation(χ, T) times the operator (1 − P_φ) ∈ A_l. Unital
(Φ_χ(I_k) = I_l), defect Φ_χ(ST) − Φ_χ(S)Φ_χ(T) = (χ(ST) − χ(S)χ(T))(I − P).
"""
function unital_completion(T, chi::BlockState, phi::Placement)
    chiT = state_expectation(chi, T)
    out = Dict{Symbol,Matrix{ComplexF64}}()
    for c in _FIB_CHARGES
        V = placement_refinement_matrix(phi, c)
        P = _corner_projection(phi, c)
        out[c] = V * T[c] * V' + chiT * (I - P)
    end
    return out
end
