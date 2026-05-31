struct ConservationWitnessResult
    feasible::Bool
    residual_norm::Float64
    u::Array{Float64, 2}
end

struct BoostWitnessResult
    feasible::Bool
    nontrivial_speed::Bool
    residual_norm::Float64
    w::Array{Float64, 3}
    speed2::Float64
    scalar_speed_shift::Float64
end

function _flatten_coefficients(coefficients)
    return vec(collect(Float64, coefficients))
end

function _least_squares_feasible(matrix, target; atol::Real)
    solution = matrix \ target
    residual = matrix * solution - target
    residual_norm = norm(residual)
    scale = max(1.0, norm(target))
    return residual_norm <= atol * scale, solution, residual_norm
end

function solve_conservation_witness(coefficients; atol::Real = 1e-9)
    h = pauli_two_site_operator(coefficients)
    target = pauli_n_site_coefficients(adjacent_bond_conservation_residual(h), 3)
    columns = Vector{Vector{Float64}}()
    indices = Tuple{Int, Int}[]
    for r in 1:4, s in 1:4
        (r, s) == (1, 1) && continue
        basis = zeros(4, 4)
        basis[r, s] = 1.0
        push!(columns, _flatten_coefficients(one_dimensional_coboundary_coefficients(basis)))
        push!(indices, (r, s))
    end
    matrix = hcat(columns...)
    feasible, solution, residual_norm =
        _least_squares_feasible(matrix, _flatten_coefficients(target); atol)
    u = zeros(4, 4)
    for (idx, (r, s)) in enumerate(indices)
        u[r, s] = solution[idx]
    end
    return ConservationWitnessResult(feasible, residual_norm, u)
end

function solve_boost_witness(coefficients, u; atol::Real = 1e-9, speed_atol::Real = 1e-9)
    h = pauli_two_site_operator(coefficients)
    target = pauli_n_site_coefficients(boost_relation_local_density(h), 4)
    for r in 1:4, s in 1:4
        target[r, s, 1, 1] -= u[r, s]
    end

    columns = Vector{Vector{Float64}}()
    w_indices = Tuple{Int, Int, Int}[]
    for r in 1:4, s in 1:4, t in 1:4
        (r, s, t) == (1, 1, 1) && continue
        basis = zeros(4, 4, 4)
        basis[r, s, t] = 1.0
        push!(columns, _flatten_coefficients(one_dimensional_coboundary_coefficients(basis)))
        push!(w_indices, (r, s, t))
    end

    h_embedded = zeros(4, 4, 4, 4)
    for r in 1:4, s in 1:4
        h_embedded[r, s, 1, 1] = coefficients[r, s]
    end
    identity_embedded = zeros(4, 4, 4, 4)
    identity_embedded[1, 1, 1, 1] = -1.0
    push!(columns, _flatten_coefficients(h_embedded))
    push!(columns, _flatten_coefficients(identity_embedded))

    matrix = hcat(columns...)
    feasible, solution, residual_norm =
        _least_squares_feasible(matrix, _flatten_coefficients(target); atol)
    w = zeros(4, 4, 4)
    for (idx, (r, s, t)) in enumerate(w_indices)
        w[r, s, t] = solution[idx]
    end
    speed2 = solution[length(w_indices) + 1]
    scalar_speed_shift = solution[length(w_indices) + 2]
    return BoostWitnessResult(
        feasible,
        speed2 > speed_atol,
        residual_norm,
        w,
        speed2,
        scalar_speed_shift,
    )
end
