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
    pauli_n_site_operator(coefficients)

Return the Pauli-string operator encoded by an ``n``-dimensional coefficient
array with each axis of length 4.
"""
function pauli_n_site_operator(coefficients)
    ndims(coefficients) >= 1 || error("Pauli coefficient array must have at least one axis")
    all(size(coefficients) .== 4) ||
        error("every Pauli coefficient axis must have length 4, got size $(size(coefficients))")
    all(c -> c isa Real, coefficients) ||
        error("Pauli coefficient array must have real entries")

    num_sites = ndims(coefficients)
    out = zeros(ComplexF64, 2^num_sites, 2^num_sites)
    for index in CartesianIndices(coefficients)
        basis = PAULI_BASIS[index[1]]
        for site in 2:num_sites
            basis = kron(basis, PAULI_BASIS[index[site]])
        end
        out .+= float(coefficients[index]) .* basis
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

function _check_n_site_operator(operator, num_sites::Integer, label)
    num_sites >= 1 || error("num_sites must be positive, got $num_sites")
    expected = 2^num_sites
    size(operator) == (expected, expected) ||
        error("$label must be a $(expected)x$(expected) operator for $num_sites sites, got $(size(operator))")
    isapprox(operator, operator'; atol = PAULI_COEFFICIENT_ATOL, rtol = PAULI_COEFFICIENT_RTOL) ||
        error("$label must be self-adjoint")
end

"""
    pauli_n_site_coefficients(operator, num_sites)

Recover Pauli-string coefficients from a self-adjoint ``num_sites``-qubit
operator.  The normalization is ``2^(-num_sites) Tr(P_w operator)``.
"""
function pauli_n_site_coefficients(operator, num_sites::Integer)
    _check_n_site_operator(operator, num_sites, "operator")
    coefficients = zeros(Float64, ntuple(_ -> 4, num_sites))
    for index in CartesianIndices(coefficients)
        basis = PAULI_BASIS[index[1]]
        for site in 2:num_sites
            basis = kron(basis, PAULI_BASIS[index[site]])
        end
        raw = tr(basis * operator) / 2^num_sites
        isapprox(raw, real(raw); atol = PAULI_COEFFICIENT_ATOL, rtol = PAULI_COEFFICIENT_RTOL) ||
            error("Pauli coefficient $(Tuple(index)) has non-negligible imaginary part $(imag(raw))")
        coefficients[index] = real(raw)
    end
    return coefficients
end

function _embed_operator(operator, start_site::Integer, num_sites::Integer)
    op_sites_float = log2(size(operator, 1))
    op_sites = round(Int, op_sites_float)
    2^op_sites == size(operator, 1) == size(operator, 2) ||
        error("operator size $(size(operator)) is not an n-qubit square matrix")
    1 <= start_site <= num_sites - op_sites + 1 ||
        error("cannot place $op_sites-site operator at start_site $start_site in $num_sites sites")

    factors = Any[]
    site = 1
    while site <= num_sites
        if site == start_site
            push!(factors, operator)
            site += op_sites
        else
            push!(factors, PAULI_BASIS[1])
            site += 1
        end
    end
    out = factors[1]
    for factor in factors[2:end]
        out = kron(out, factor)
    end
    return out
end

"""
    local_operator_embedding(operator, start_site, num_sites)

Embed an ``n``-qubit local operator into a ``num_sites``-qubit window beginning
at one-based `start_site`.
"""
function local_operator_embedding(operator, start_site::Integer, num_sites::Integer)
    return _embed_operator(operator, start_site, num_sites)
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
For the CA-12 momentum candidate ``P=sum_j i[h_j,h_{j+1}]``, the formal sum of
this density is ``i[H,P]`` after the outer-overlap terms cancel by Jacobi.  The
translation-conservation equation therefore asks this density to be a
one-dimensional coboundary, not necessarily coefficientwise zero.
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

"""
    infinite_chain_conservation_density(operator)

Return the five-site raw overlap density for ``i[H,P]`` before the
Jacobi/summation cancellation of outer-overlap terms, where
``P=sum_j i[h_j,h_{j+1}]``.  The current density is placed on sites 2--4 and
all overlapping Hamiltonian densities on sites 1--2, 2--3, 3--4, and 4--5 are
included:
``i sum_{r=-1}^2 [h_{1+r}, p_2]`` in one-based site notation.

This is a useful local sentinel.  The minimal formal conservation equation is
implemented by `adjacent_bond_conservation_residual` together with
`one_dimensional_coboundary_coefficients`.
"""
function infinite_chain_conservation_density(operator)
    _check_two_site_operator(operator, "operator")
    current = adjacent_bond_boost_current(operator)
    current_center = _embed_operator(current, 2, 5)
    residual = zeros(ComplexF64, 32, 32)
    for start_site in 1:4
        h_term = _embed_operator(operator, start_site, 5)
        residual .+= im * (h_term * current_center - current_center * h_term)
    end
    isapprox(residual, residual'; atol = PAULI_COEFFICIENT_ATOL, rtol = PAULI_COEFFICIENT_RTOL) ||
        error("infinite-chain conservation density is not self-adjoint")
    return residual
end

"""
    first_moment_boost_density(operator)

Return the five-site translation-invariant density ``e(h)`` in the decomposition
``i[P,K] = sum_j e_j - sum_j j d_j`` before the conservation-density term
``d_j`` is reduced by a divergence.  The coefficient of
``[p_2,h_start]`` is the relative displacement ``start_site - 2``.
"""
function first_moment_boost_density(operator)
    _check_two_site_operator(operator, "operator")
    current = adjacent_bond_boost_current(operator)
    current_center = _embed_operator(current, 2, 5)
    density = zeros(ComplexF64, 32, 32)
    for start_site in 1:4
        relative = start_site - 2
        h_term = _embed_operator(operator, start_site, 5)
        density .+= im * relative * (current_center * h_term - h_term * current_center)
    end
    isapprox(density, density'; atol = PAULI_COEFFICIENT_ATOL, rtol = PAULI_COEFFICIENT_RTOL) ||
        error("first-moment boost density is not self-adjoint")
    return density
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
