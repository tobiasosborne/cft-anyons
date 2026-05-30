const GAUSSIAN_QUADRATIC_SYMMETRY_ATOL = 1e-12
const GAUSSIAN_QUADRATIC_SYMMETRY_RTOL = 1e-12

function _check_open_chain_site_count(num_sites::Integer; minimum = 1)
    num_sites >= minimum || error("num_sites must be at least $minimum, got $num_sites")
    return Int(num_sites)
end

function _check_real_parameter(name, value)
    value isa Real || error("$name must be real, got $value")
    return float(value)
end

function _add_symmetric_entry!(A, row::Integer, col::Integer, value)
    A[row, col] += value
    row == col || (A[col, row] += value)
    return A
end

function _check_phase_space_quadratic_matrix(A, label)
    size(A, 1) == size(A, 2) || error("$label must be square, got size $(size(A))")
    iseven(size(A, 1)) || error("$label dimension must be even, got $(size(A, 1))")
    size(A, 1) > 0 || error("$label dimension must be positive")
    isapprox(A, A'; atol = GAUSSIAN_QUADRATIC_SYMMETRY_ATOL,
        rtol = GAUSSIAN_QUADRATIC_SYMMETRY_RTOL) ||
        error("$label must be self-adjoint within Gaussian quadratic symmetry tolerance")
    return size(A, 1) ÷ 2
end

"""
    canonical_phase_space_symplectic(num_sites)

Return the canonical matrix ``Omega`` for
``R = (q_1, ..., q_N, p_1, ..., p_N)`` with ``[R_i,R_j]=i Omega_ij``.
"""
function canonical_phase_space_symplectic(num_sites::Integer)
    n = _check_open_chain_site_count(num_sites)
    omega = zeros(Int, 2 * n, 2 * n)
    omega[1:n, (n + 1):(2 * n)] .= Matrix{Int}(I, n, n)
    omega[(n + 1):(2 * n), 1:n] .= -Matrix{Int}(I, n, n)
    return omega
end

"""
    quadratic_commutator_matrix(A, B)

For ``Q(A)=1/2 R' A R`` and ``[R_i,R_j]=i Omega_ij``, return the matrix of
``i[Q(A),Q(B)]``.  With the phase-space ordering above this is
``B * Omega * A - A * Omega * B``.
"""
function quadratic_commutator_matrix(A::AbstractMatrix, B::AbstractMatrix)
    n = _check_phase_space_quadratic_matrix(A, "A")
    size(B) == size(A) || error("B has size $(size(B)); expected $(size(A))")
    _check_phase_space_quadratic_matrix(B, "B")
    omega = canonical_phase_space_symplectic(n)
    return B * omega * A - A * omega * B
end

"""
    open_chain_gaussian_energy_density_matrices(num_sites; onsite, bond)

Return the quadratic matrices for the finite open 1D scalar Gaussian site
energies ``e_j`` using CONVENTIONS.md (l): kinetic term ``p_j^2/2``, onsite
term ``onsite*q_j^2/2``, and each present nearest-neighbour bond
``bond*q_j*q_{j+1}`` split equally between its endpoints.
"""
function open_chain_gaussian_energy_density_matrices(num_sites::Integer; onsite, bond)
    n = _check_open_chain_site_count(num_sites)
    onsite_coeff = _check_real_parameter("onsite", onsite)
    bond_coeff = _check_real_parameter("bond", bond)
    T = promote_type(typeof(onsite_coeff), typeof(bond_coeff), Float64)
    densities = [zeros(T, 2 * n, 2 * n) for _ in 1:n]

    for j in 1:n
        density = densities[j]
        density[j, j] += onsite_coeff
        density[n + j, n + j] += one(T)
        j > 1 && _add_symmetric_entry!(density, j - 1, j, bond_coeff / 2)
        j < n && _add_symmetric_entry!(density, j, j + 1, bond_coeff / 2)
    end

    return densities
end

function _sum_quadratic_matrices(matrices)
    isempty(matrices) && error("cannot sum an empty quadratic-matrix list")
    total = zeros(eltype(first(matrices)), size(first(matrices)))
    for (idx, matrix) in pairs(matrices)
        size(matrix) == size(total) ||
            error("matrix $idx has size $(size(matrix)); expected $(size(total))")
        total .+= matrix
    end
    return total
end

"""
    open_chain_gaussian_hamiltonian_matrix(num_sites; onsite, bond)

Return the total quadratic Hamiltonian matrix obtained by summing the open-chain
site energies from `open_chain_gaussian_energy_density_matrices`.
"""
function open_chain_gaussian_hamiltonian_matrix(num_sites::Integer; onsite, bond)
    return _sum_quadratic_matrices(
        open_chain_gaussian_energy_density_matrices(num_sites; onsite, bond))
end

function _check_density_matrices(density_matrices)
    isempty(density_matrices) && error("density_matrices must be nonempty")
    n = _check_phase_space_quadratic_matrix(first(density_matrices), "density matrix 1")
    length(density_matrices) == n ||
        error("expected one density matrix per site; got $(length(density_matrices)) for phase-space site count $n")
    for (idx, density) in pairs(density_matrices)
        size(density) == size(first(density_matrices)) ||
            error("density matrix $idx has size $(size(density)); expected $(size(first(density_matrices)))")
        _check_phase_space_quadratic_matrix(density, "density matrix $idx")
    end
    return n
end

function _check_open_bond_index(num_sites::Integer, bond_index::Integer)
    1 <= bond_index < num_sites ||
        error("bond_index must name an open-chain bond between 1 and $(num_sites - 1), got $bond_index")
    return Int(bond_index)
end

"""
    open_chain_gaussian_energy_current_matrices(density_matrices)
    open_chain_gaussian_energy_current_matrices(num_sites; onsite, bond)

Return ``J_{j+1/2}=i[e_j,e_{j+1}]`` for each open-chain bond.
"""
function open_chain_gaussian_energy_current_matrices(density_matrices)
    n = _check_density_matrices(density_matrices)
    n >= 2 || error("at least two sites are needed for a bond current")
    return [quadratic_commutator_matrix(density_matrices[j], density_matrices[j + 1])
            for j in 1:(n - 1)]
end

function open_chain_gaussian_energy_current_matrices(num_sites::Integer; onsite, bond)
    densities = open_chain_gaussian_energy_density_matrices(num_sites; onsite, bond)
    return open_chain_gaussian_energy_current_matrices(densities)
end

"""
    open_chain_gaussian_energy_current_closed_form_matrix(num_sites, bond_index; bond)

Return the closed-form matrix for ``J_{j+1/2}=i[e_j,e_{j+1}]``:
``(bond/2) * (q_{j+1} p_j - q_j p_{j+1})``.  The onsite coefficient is absent.
"""
function open_chain_gaussian_energy_current_closed_form_matrix(
        num_sites::Integer, bond_index::Integer; bond)
    n = _check_open_chain_site_count(num_sites; minimum = 2)
    j = _check_open_bond_index(n, bond_index)
    bond_coeff = _check_real_parameter("bond", bond)
    T = promote_type(typeof(bond_coeff), Float64)
    current = zeros(T, 2 * n, 2 * n)
    _add_symmetric_entry!(current, j + 1, n + j, bond_coeff / 2)
    _add_symmetric_entry!(current, j, n + j + 1, -bond_coeff / 2)
    return current
end

"""
    nearest_neighbor_integrated_energy_current_symbol(k; bond, spacing = 1)

Return the one-component translation-invariant symbol of the integrated A4
nearest-neighbour current in the CONVENTIONS.md (l) orientation.

For ``J_{j+1/2} = (bond / 2) * (q_{j+1}p_j - q_j p_{j+1})``, the first-moment
spacing factor gives ``-spacing * bond * sin(spacing * k)``.  This is a symbol
identity only; it does not define a finite periodic coordinate or an open-chain
momentum generator.
"""
function nearest_neighbor_integrated_energy_current_symbol(k; bond, spacing = 1)
    _check_k_vector(k)
    length(k) == 1 ||
        error("nearest-neighbour integrated current symbol is currently 1D only, got dimension $(length(k))")
    spacing > 0 || error("spacing must be positive, got $spacing")
    bond_coeff = _check_real_parameter("bond", bond)
    return [-float(spacing) * bond_coeff * sin(float(spacing) * float(k[1]))]
end

"""
    kg_nearest_neighbor_integrated_energy_current_symbol(k; spacing = 1)

Return the integrated-current symbol for the 1D nearest-neighbour lattice
Klein-Gordon bond ``-spacing^-2``.
"""
function kg_nearest_neighbor_integrated_energy_current_symbol(k; spacing = 1)
    spacing > 0 || error("spacing must be positive, got $spacing")
    return nearest_neighbor_integrated_energy_current_symbol(k;
        bond = -1 / float(spacing)^2, spacing)
end

"""
    open_chain_gaussian_energy_continuity_residuals(num_sites; onsite, bond)

Return matrices for
``i[H,e_j] - (J_{j-1/2} - J_{j+1/2})`` with the endpoint convention
``J_{1/2}=J_{N+1/2}=0``.
"""
function open_chain_gaussian_energy_continuity_residuals(num_sites::Integer; onsite, bond)
    densities = open_chain_gaussian_energy_density_matrices(num_sites; onsite, bond)
    currents = open_chain_gaussian_energy_current_matrices(densities)
    hamiltonian = _sum_quadratic_matrices(densities)
    n = length(densities)
    residuals = Matrix{eltype(hamiltonian)}[]

    for j in 1:n
        rhs = zeros(eltype(hamiltonian), size(hamiltonian))
        j > 1 && (rhs .+= currents[j - 1])
        j < n && (rhs .-= currents[j])
        push!(residuals, quadratic_commutator_matrix(hamiltonian, densities[j]) - rhs)
    end

    return residuals
end
