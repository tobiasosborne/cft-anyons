const PAULI_BASIS = (
    ComplexF64[1 0; 0 1],
    ComplexF64[0 1; 1 0],
    ComplexF64[0 -im; im 0],
    ComplexF64[1 0; 0 -1],
)

const PAULI_COEFFICIENT_ATOL = 1e-12
const PAULI_COEFFICIENT_RTOL = 1e-12

function _check_pauli_coefficients(coefficients, dims, label)
    size(coefficients) == dims ||
        error("$label must have size $dims, got $(size(coefficients))")
    all(c -> c isa Real, coefficients) ||
        error("$label must have real entries for a self-adjoint Pauli density")
end

function _check_two_site_operator(operator, label)
    size(operator) == (4, 4) || error("$label must be a 4x4 two-qubit operator, got $(size(operator))")
    isapprox(operator, operator'; atol = PAULI_COEFFICIENT_ATOL, rtol = PAULI_COEFFICIENT_RTOL) ||
        error("$label must be self-adjoint")
end

"""
    pauli_site_operator(coefficients)

Return ``sum_{a=0}^3 coefficients[a+1] sigma_a`` using
``sigma_0=I, sigma_1=X, sigma_2=Y, sigma_3=Z``.
"""
function pauli_site_operator(coefficients)
    _check_pauli_coefficients(coefficients, (4,), "site Pauli coefficient vector")
    out = zeros(ComplexF64, 2, 2)
    for a in 1:4
        out .+= float(coefficients[a]) .* PAULI_BASIS[a]
    end
    return out
end

"""
    pauli_two_site_operator(coefficients)

Return ``sum_{a,b=0}^3 coefficients[a+1,b+1] sigma_a otimes sigma_b``.
The coefficient normalization is therefore
``coefficients[a+1,b+1] = tr((sigma_a otimes sigma_b) h) / 4``.
"""
function pauli_two_site_operator(coefficients)
    _check_pauli_coefficients(coefficients, (4, 4), "two-site Pauli coefficient matrix")
    out = zeros(ComplexF64, 4, 4)
    for a in 1:4, b in 1:4
        out .+= float(coefficients[a, b]) .* kron(PAULI_BASIS[a], PAULI_BASIS[b])
    end
    return out
end

"""
    pauli_three_site_operator(coefficients)

Return ``sum_{a,b,c=0}^3 coefficients[a+1,b+1,c+1]
sigma_a otimes sigma_b otimes sigma_c``.
"""
function pauli_three_site_operator(coefficients)
    _check_pauli_coefficients(coefficients, (4, 4, 4), "three-site Pauli coefficient tensor")
    out = zeros(ComplexF64, 8, 8)
    for a in 1:4, b in 1:4, c in 1:4
        out .+= float(coefficients[a, b, c]) .*
                kron(PAULI_BASIS[a], PAULI_BASIS[b], PAULI_BASIS[c])
    end
    return out
end

"""
    pauli_two_site_coefficients(operator)

Recover the real two-site Pauli coefficient matrix from a self-adjoint two-qubit
operator in the convention used by `pauli_two_site_operator`.
"""
function pauli_two_site_coefficients(operator)
    _check_two_site_operator(operator, "operator")
    coefficients = zeros(Float64, 4, 4)
    for a in 1:4, b in 1:4
        raw = tr(kron(PAULI_BASIS[a], PAULI_BASIS[b]) * operator) / 4
        isapprox(raw, real(raw); atol = PAULI_COEFFICIENT_ATOL, rtol = PAULI_COEFFICIENT_RTOL) ||
            error("Pauli coefficient ($a, $b) has non-negligible imaginary part $(imag(raw))")
        coefficients[a, b] = real(raw)
    end
    return coefficients
end

"""
    symmetric_onsite_bond_density(site_coefficients)

Represent a translation-invariant one-site qubit Hamiltonian density
``A = sum_a site_coefficients[a+1] sigma_a`` as the symmetric two-site bond
density ``(A otimes I + I otimes A) / 2``.
"""
function symmetric_onsite_bond_density(site_coefficients)
    onsite = pauli_site_operator(site_coefficients)
    identity = PAULI_BASIS[1]
    return (kron(onsite, identity) + kron(identity, onsite)) / 2
end

"""
    adjacent_bond_boost_current(operator)

For a translation-invariant two-site density ``h``, return the three-site matrix
``i[h_{12}, h_{23}]``.  This is the local adjacent-density current appearing in
CA-12's nearest-neighbour boost-current derivation.
"""
function adjacent_bond_boost_current(operator)
    _check_two_site_operator(operator, "operator")
    identity = PAULI_BASIS[1]
    h12 = kron(operator, identity)
    h23 = kron(identity, operator)
    current = im * (h12 * h23 - h23 * h12)
    isapprox(current, current'; atol = PAULI_COEFFICIENT_ATOL, rtol = PAULI_COEFFICIENT_RTOL) ||
        error("adjacent current is not self-adjoint; check the density input")
    return current
end

"""
    adjacent_bond_conservation_residual(operator)

Return the three-site local residual ``i[h_{12}+h_{23}, i[h_{12},h_{23}]]``.
For the CA-12 momentum candidate ``P=sum_j i[h_j,h_{j+1}]``, this is the first
bulk density to inspect for the target translation conservation relation
``i[H,P]=0``.
"""
function adjacent_bond_conservation_residual(operator)
    _check_two_site_operator(operator, "operator")
    identity = PAULI_BASIS[1]
    h12 = kron(operator, identity)
    h23 = kron(identity, operator)
    current = adjacent_bond_boost_current(operator)
    residual = im * ((h12 + h23) * current - current * (h12 + h23))
    isapprox(residual, residual'; atol = PAULI_COEFFICIENT_ATOL, rtol = PAULI_COEFFICIENT_RTOL) ||
        error("conservation residual is not self-adjoint; check the density input")
    return residual
end

function _levi_civita3(a::Integer, b::Integer, c::Integer)
    ((a, b, c) == (1, 2, 3) || (a, b, c) == (2, 3, 1) || (a, b, c) == (3, 1, 2)) && return 1
    ((a, b, c) == (3, 2, 1) || (a, b, c) == (2, 1, 3) || (a, b, c) == (1, 3, 2)) && return -1
    return 0
end

"""
    adjacent_bond_current_pauli_coefficients(coefficients)

Return the three-site Pauli coefficients of ``i[h_{12},h_{23}]`` directly from
the two-site Pauli coefficients of ``h``.  With the Pauli convention above,
the coefficient of ``sigma_a otimes sigma_e otimes sigma_d`` is
``-2 sum_{b,c=1}^3 h_{a b} h_{c d} epsilon_{b c e}``, using zero-based Pauli
labels in the mathematical display and one-based Julia indices in the array.
"""
function adjacent_bond_current_pauli_coefficients(coefficients)
    _check_pauli_coefficients(coefficients, (4, 4), "two-site Pauli coefficient matrix")
    current = zeros(Float64, 4, 4, 4)
    for a in 1:4, d in 1:4, e in 2:4
        total = 0.0
        for b in 2:4, c in 2:4
            total += coefficients[a, b] * coefficients[c, d] *
                     _levi_civita3(b - 1, c - 1, e - 1)
        end
        current[a, e, d] = -2 * total
    end
    return current
end

"""
    adjacent_bond_current_norm(operator)

Return the Frobenius norm of ``i[h_{12},h_{23}]``.  Vanishing is a finite
algebraic obstruction witness for the first-moment boost ansatz: the candidate
bulk momentum from CA-12 is zero in the translation-invariant bulk.
"""
function adjacent_bond_current_norm(operator)
    return norm(adjacent_bond_boost_current(operator))
end
