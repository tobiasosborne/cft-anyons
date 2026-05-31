"""
    one_dimensional_coboundary_coefficients(coefficients)

Return the Pauli coefficient tensor of the one-dimensional coboundary
``D u = u_j - u_{j+1}``.  If ``u`` has ``n`` Pauli-string axes, the output has
``n + 1`` axes and coefficients
``(D u)_{a_0...a_n} = u_{a_0...a_{n-1}} delta_{a_n,0}
 - delta_{a_0,0} u_{a_1...a_n}``.
"""
function one_dimensional_coboundary_coefficients(coefficients)
    ndims(coefficients) >= 1 || error("coboundary coefficient array must have at least one axis")
    all(size(coefficients) .== 4) ||
        error("every coboundary coefficient axis must have length 4, got size $(size(coefficients))")
    all(c -> c isa Real, coefficients) ||
        error("coboundary coefficient array must have real entries")

    out = zeros(Float64, ntuple(_ -> 4, ndims(coefficients) + 1))
    for index in CartesianIndices(coefficients)
        out[Tuple(index)..., 1] += float(coefficients[index])
        out[1, Tuple(index)...] -= float(coefficients[index])
    end
    return out
end

"""
    boost_relation_local_density(operator)

Return the four-site local density
``B_j = i[p_j,h_{j+1}] + 2i[p_j,h_{j+2}]`` for the CA-12 first-moment ansatz,
where ``p_j=i[h_j,h_{j+1}]``.  If the conservation density is witnessed by
``A_j = u_j-u_{j+1}``, the formal boost relation has bulk representative
``B_j-u_j`` before comparison with ``v^2 h_j`` and another coboundary.
"""
function boost_relation_local_density(operator)
    _check_two_site_operator(operator, "operator")
    current = adjacent_bond_boost_current(operator)
    current_left = _embed_operator(current, 1, 4)
    h_next = _embed_operator(operator, 2, 4)
    h_after_next = _embed_operator(operator, 3, 4)
    density = im * (current_left * h_next - h_next * current_left) +
              2im * (current_left * h_after_next - h_after_next * current_left)
    isapprox(density, density'; atol = PAULI_COEFFICIENT_ATOL, rtol = PAULI_COEFFICIENT_RTOL) ||
        error("boost-relation local density is not self-adjoint")
    return density
end
