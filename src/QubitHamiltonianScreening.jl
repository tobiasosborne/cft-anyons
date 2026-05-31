"""
    qubit_sentinel_hamiltonians()

Return small Pauli-coefficient matrices used as deterministic sentinels for the
qubit symmetry-filter and SDP hierarchy.
"""
function qubit_sentinel_hamiltonians()
    onsite = [
        0.25 0.35 -0.15 0.25
        0.35 0.0 0.0 0.0
        -0.15 0.0 0.0 0.0
        0.25 0.0 0.0 0.0
    ]

    zz = zeros(4, 4)
    zz[4, 4] = 1.25

    transverse_ising = zeros(4, 4)
    transverse_ising[4, 4] = -1.0
    transverse_ising[2, 1] = -0.35
    transverse_ising[1, 2] = -0.35

    generic_currentful = [
        0.0 0.0 0.0 -0.29
        0.13 0.0 0.37 0.0
        0.0 0.17 0.0 -0.22
        0.0 0.41 0.0 0.0
    ]

    fake_split = zeros(4, 4)
    fake_split[2, 1] = 1.0
    fake_split[1, 4] = 1.0

    return Dict(
        :onsite => onsite,
        :zz => zz,
        :transverse_ising => transverse_ising,
        :generic_currentful => generic_currentful,
        :fake_split => fake_split,
    )
end

function qubit_current_collapses(coefficients; atol::Real = PAULI_COEFFICIENT_ATOL)
    _check_pauli_coefficients(coefficients, (4, 4), "two-site Pauli coefficient matrix")
    return norm(adjacent_bond_current_pauli_coefficients(coefficients)) <= atol
end

function qubit_current_filter_status(coefficients; atol::Real = PAULI_COEFFICIENT_ATOL)
    return qubit_current_collapses(coefficients; atol) ? :current_collapsed : :currentful
end
