# CA-64 quantified relaxations of the qubit symmetry gates.
#
# Replaces the exact first-moment witness gates (CA-57) by coefficient residual
# *profiles*: the tracial Pauli-coefficient distance from the conservation /
# boost densities to the image of the one-dimensional coboundary map, as a
# function of witness support L. The tracial coefficient inner product is
#   <r,s>_tau = sum_a conj(r_a) s_a = normalized tr(R* S),
# so the coefficient l2 norm equals ||R||_tau. Distances to coboundary images
# are gauge-invariant; the all-identity witness column of D is exactly zero
# (D applied to a scalar vanishes), so it is dropped for reported witnesses.
#
# Definitions follow report/sections/64_qubit_relaxed_symmetry_gates.tex.
# Per AGENTS.md Rule 1 every helper fails loud on malformed input.

struct ResidualProfilePoint
    support::Int
    raw_norm::Float64
    relative_norm::Float64
    scale_norm::Float64
    metadata::Dict{Symbol, Any}
end

"""
    coefficient_l2_norm(coefficients) -> Float64

Tracial Pauli-coefficient norm ``||R||_tau = sqrt(sum_a |r_a|^2)``, equal to the
normalized Hilbert--Schmidt norm ``sqrt(tr(R* R))`` in this convention.
"""
coefficient_l2_norm(coefficients) = norm(vec(collect(Float64, coefficients)))

"""
    embed_pauli_coefficients(coefficients, target_support) -> Array

Pad an ``L``-site Pauli coefficient tensor by trailing identity axes to
``target_support`` sites (the map ``iota_{L,N}``). Preserves the coefficient
l2 norm, since trailing identities only relocate coefficients.
"""
function embed_pauli_coefficients(coefficients, target_support::Integer)
    L = ndims(coefficients)
    target_support >= L ||
        error("target_support $target_support is smaller than source support $L")
    all(size(coefficients) .== 4) ||
        error("every Pauli coefficient axis must have length 4, got $(size(coefficients))")
    out = zeros(Float64, ntuple(_ -> 4, target_support))
    pad = ntuple(_ -> 1, target_support - L)
    for idx in CartesianIndices(coefficients)
        out[Tuple(idx)..., pad...] = float(coefficients[idx])
    end
    return out
end

function _support_basis_indices(support::Integer, gauge::Symbol)
    gauge in (:zero_scalar, :keep_scalar) ||
        error("unknown gauge $gauge; expected :zero_scalar or :keep_scalar")
    indices = CartesianIndex[]
    for idx in CartesianIndices(ntuple(_ -> 4, support))
        gauge == :zero_scalar && all(Tuple(idx) .== 1) && continue
        push!(indices, idx)
    end
    return indices
end

"""
    coboundary_matrix(support; target_support = support + 1, gauge = :zero_scalar)

Matrix whose columns are ``iota_{L+1,N} D_L(e_k)`` for each ``L``-site Pauli
basis word ``e_k`` (``L`` = `support`, ``N`` = `target_support`). With
`gauge = :zero_scalar` the all-identity column is dropped; it is exactly the
zero vector because ``D`` annihilates scalars, so both gauges span the same
image and give the same distance.
"""
function coboundary_matrix(support::Integer; target_support::Integer = support + 1,
        gauge::Symbol = :zero_scalar)
    target_support >= support + 1 ||
        error("target_support $target_support cannot hold a support-$(support) coboundary")
    columns = Vector{Vector{Float64}}()
    for idx in _support_basis_indices(support, gauge)
        e = zeros(Float64, ntuple(_ -> 4, support))
        e[idx] = 1.0
        du = one_dimensional_coboundary_coefficients(e)
        push!(columns, vec(embed_pauli_coefficients(du, target_support)))
    end
    return reduce(hcat, columns)
end

function _identity_columns(support::Integer, target_support::Integer, gauge::Symbol)
    columns = Vector{Vector{Float64}}()
    for idx in _support_basis_indices(support, gauge)
        e = zeros(Float64, ntuple(_ -> 4, support))
        e[idx] = 1.0
        push!(columns, vec(embed_pauli_coefficients(e, target_support)))
    end
    return reduce(hcat, columns)
end

function _scalar_column(target_support::Integer)
    scal = zeros(Float64, ntuple(_ -> 4, target_support))
    scal[ntuple(_ -> 1, target_support)...] = 1.0
    return vec(scal)
end

# min ||M x - b|| ; robust to rank deficiency.
_least_squares(M, b) = pinv(M) * b

# min ||M x - b|| s.t. C x = d ; nullspace method, robust to rank deficiency.
function _constrained_least_squares(M, b, C, d)
    xp = pinv(C) * d
    Z = nullspace(C)
    size(Z, 2) == 0 && return xp
    return xp + Z * (pinv(M * Z) * (b - M * xp))
end

"""
    solve_conservation_profile(coefficients; max_support, min_support = 1,
        gauge = :zero_scalar, atol = 1e-9) -> Vector{ResidualProfilePoint}

Conservation profile ``eps_c(L) = dist(iota A, iota im D_L)`` for
``A = i[h_j+h_{j+1}, p_j]`` and ``L`` from `min_support` to `max_support`. The
relative value is ``eps_c(L)/max(||A||_tau, atol)``. Nonincreasing in ``L``.
"""
function solve_conservation_profile(coefficients; max_support::Integer,
        min_support::Integer = 1, gauge::Symbol = :zero_scalar, atol::Real = 1e-9)
    h = pauli_two_site_operator(coefficients)
    A = pauli_n_site_coefficients(adjacent_bond_conservation_residual(h), 3)
    scale = coefficient_l2_norm(A)
    points = ResidualProfilePoint[]
    for L in min_support:max_support
        N = max(3, L + 1)
        M = coboundary_matrix(L; target_support = N, gauge)
        b = vec(embed_pauli_coefficients(A, N))
        raw = norm(M * _least_squares(M, b) - b)
        push!(points, ResidualProfilePoint(L, raw, raw / max(scale, atol), scale,
            Dict{Symbol, Any}(:gate => :conservation, :gauge => gauge)))
    end
    return points
end

function _boost_point(coefficients, A, B, scale, L, N, speed2, gauge)
    Ucob = coboundary_matrix(L; target_support = N, gauge)
    Uid = _identity_columns(L, N, gauge)
    Wcob = coboundary_matrix(L; target_support = N, gauge)
    Bemb = vec(embed_pauli_coefficients(B, N))
    hcol = vec(embed_pauli_coefficients(coefficients, N))
    scal = _scalar_column(N)
    A_emb = vec(embed_pauli_coefficients(A, N))
    nu = size(Uid, 2)
    nw = size(Wcob, 2)
    if speed2 === nothing
        # residual = Bemb - Uid u - Wcob w - lambda hcol + mu scal
        M = hcat(Uid, Wcob, hcol, -scal)
        C = hcat(Ucob, zeros(size(Ucob, 1), nw + 2))
        x = _constrained_least_squares(M, Bemb, C, A_emb)
        raw = norm(M * x - Bemb)
        lambda = x[nu + nw + 1]
        mu = x[nu + nw + 2]
    else
        b = Bemb .- float(speed2) .* hcol
        M = hcat(Uid, Wcob, -scal)
        C = hcat(Ucob, zeros(size(Ucob, 1), nw + 1))
        x = _constrained_least_squares(M, b, C, A_emb)
        raw = norm(M * x - b)
        lambda = float(speed2)
        mu = x[nu + nw + 1]
    end
    # Fail loud (Rule 1) if the exact-conservation constraint D_L u = A is not
    # actually satisfiable at this support: eps_b^0 is defined only when
    # eps_c(L) = 0 (CA-64); otherwise use solve_joint_poincare_profile.
    constraint_gap = norm(Ucob * x[1:nu] - A_emb)
    constraint_gap <= 1e-5 * max(1.0, norm(A_emb)) ||
        error("exact-conservation constraint D_L u = A infeasible at support $L " *
              "(gap $constraint_gap); eps_b^0 undefined — use the joint profile")
    e = abs(lambda) > 1e-12 ? mu / lambda : NaN
    return raw, lambda, e
end

"""
    solve_boost_profile(coefficients; max_support, min_support = 2, speed2 = nothing,
        speed2_bounds = nothing, gauge = :zero_scalar, atol = 1e-9)

Exact-conservation boost profile
``eps_b^0(L) = min_{u,w: D_L u = A} ||iota B - iota u - lambda iota(h-eI) - D_L w||_tau``
with ``B = i[p_j,h_{j+1}] + 2i[p_j,h_{j+2}]``, ``lambda = v^2``, and
``mu = lambda e`` the linear scalar variable. `speed2 = nothing` optimizes
``lambda`` as a free linear variable; a number fixes it; `speed2_bounds =
(lo, hi)` scans it on a bounded grid. Requires conservation exact at each ``L``.
"""
function solve_boost_profile(coefficients; max_support::Integer, min_support::Integer = 2,
        speed2 = nothing, speed2_bounds = nothing, gauge::Symbol = :zero_scalar,
        atol::Real = 1e-9)
    h = pauli_two_site_operator(coefficients)
    A = pauli_n_site_coefficients(adjacent_bond_conservation_residual(h), 3)
    B = pauli_n_site_coefficients(boost_relation_local_density(h), 4)
    scale = coefficient_l2_norm(B)
    points = ResidualProfilePoint[]
    for L in min_support:max_support
        N = max(4, L + 1)
        if speed2_bounds === nothing
            raw, lambda, e = _boost_point(coefficients, A, B, scale, L, N, speed2, gauge)
        else
            lo, hi = float.(speed2_bounds)
            raw = Inf; lambda = NaN; e = NaN
            for s in range(lo, hi; length = 201)
                r, l, ee = _boost_point(coefficients, A, B, scale, L, N, s, gauge)
                r < raw && ((raw, lambda, e) = (r, l, ee))
            end
        end
        push!(points, ResidualProfilePoint(L, raw, raw / max(scale, atol), scale,
            Dict{Symbol, Any}(:gate => :boost, :speed2 => lambda, :scalar_shift => e,
                :conservation_mode => :exact, :gauge => gauge)))
    end
    return points
end

"""
    solve_joint_poincare_profile(coefficients; max_support, min_support = 1,
        gauge = :zero_scalar, atol = 1e-9) -> Vector{ResidualProfilePoint}

Joint conservation+boost profile for inexact conservation:
``eps_cb^2 = min_{u,w} ||A-Du||_hat^2 + ||B-u-lambda(h-eI)-Dw||_hat^2`` with the
two blocks normalized by ``||A||_tau`` and ``||B||_tau``. ``u`` is shared and
unconstrained; ``lambda, mu`` are free linear variables.
"""
function solve_joint_poincare_profile(coefficients; max_support::Integer,
        min_support::Integer = 1, gauge::Symbol = :zero_scalar, atol::Real = 1e-9)
    h = pauli_two_site_operator(coefficients)
    A = pauli_n_site_coefficients(adjacent_bond_conservation_residual(h), 3)
    B = pauli_n_site_coefficients(boost_relation_local_density(h), 4)
    sC = max(coefficient_l2_norm(A), atol)
    sB = max(coefficient_l2_norm(B), atol)
    points = ResidualProfilePoint[]
    for L in min_support:max_support
        N = max(4, L + 1)
        Ucob = coboundary_matrix(L; target_support = N, gauge)
        Uid = _identity_columns(L, N, gauge)
        Wcob = coboundary_matrix(L; target_support = N, gauge)
        hcol = vec(embed_pauli_coefficients(coefficients, N))
        scal = _scalar_column(N)
        A_emb = vec(embed_pauli_coefficients(A, N))
        B_emb = vec(embed_pauli_coefficients(B, N))
        nu = size(Uid, 2); nw = size(Wcob, 2); rows = length(A_emb)
        top = hcat(Ucob ./ sC, zeros(rows, nw + 2))
        bot = hcat(Uid ./ sB, Wcob ./ sB, hcol ./ sB, -scal ./ sB)
        M = vcat(top, bot)
        b = vcat(A_emb ./ sC, B_emb ./ sB)
        raw = norm(M * _least_squares(M, b) - b)
        push!(points, ResidualProfilePoint(L, raw, raw, min(sC, sB),
            Dict{Symbol, Any}(:gate => :joint, :gauge => gauge)))
    end
    return points
end
