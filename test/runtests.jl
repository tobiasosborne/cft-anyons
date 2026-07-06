using Test
using CftAnyons
using LinearAlgebra
using JuMP

@testset "CftAnyons seed invariants" begin
    φ = CftAnyons.golden_ratio()

    # Fibonacci fusion rule τ ⊗ τ ≅ 1 ⊕ τ ⇒ quantum dimension obeys d² = 1 + d.
    @test φ^2 ≈ 1 + φ

    # φ is the largest root of x² - x - 1; the conjugate root 1 - φ < 0 obeys the
    # same relation, but only φ is a valid (positive) quantum dimension.
    @test φ > 1
    @test (1 - φ)^2 ≈ 1 + (1 - φ)

    # Pin the numerical value (a known-correct answer, not a tolerance-free check).
    @test isapprox(φ, 1.618033988749895; atol = 1e-15)
end

@testset "finite symmetry sector projectors" begin
    I2 = Matrix{ComplexF64}(I, 2, 2)
    swap = ComplexF64[0 1; 1 0]

    P = CftAnyons.finite_group_average_projector([I2, swap])
    Q = I2 - P

    @test CftAnyons.is_orthogonal_projection(P)
    @test CftAnyons.is_orthogonal_projection(Q)
    @test P * Q ≈ zeros(ComplexF64, 2, 2)
    @test P ≈ ComplexF64[1//2 1//2; 1//2 1//2]

    invariant_vector = ComplexF64[1, 1]
    anti_invariant_vector = ComplexF64[1, -1]
    @test P * invariant_vector ≈ invariant_vector
    @test P * anti_invariant_vector ≈ zeros(ComplexF64, 2)

    @test_throws ErrorException CftAnyons.finite_group_average_projector([])
    @test_throws ErrorException CftAnyons.finite_group_average_projector([ComplexF64[1 1; 0 1]])
end

@testset "two-qubit exchange projectors" begin
    I4 = Matrix{ComplexF64}(I, 4, 4)
    swap_slots = ComplexF64[
        1 0 0 0
        0 0 1 0
        0 1 0 0
        0 0 0 1
    ]

    P_symmetric = (I4 + swap_slots) / 2
    P_antisymmetric = (I4 - swap_slots) / 2

    @test CftAnyons.is_orthogonal_projection(P_symmetric)
    @test CftAnyons.is_orthogonal_projection(P_antisymmetric)
    @test P_symmetric * P_antisymmetric ≈ zeros(ComplexF64, 4, 4)
    @test tr(P_symmetric) ≈ 3
    @test tr(P_antisymmetric) ≈ 1

    e0 = ComplexF64[1, 0]
    e1 = ComplexF64[0, 1]
    e00 = kron(e0, e0)
    e11 = kron(e1, e1)
    symmetric_cross = (kron(e0, e1) + kron(e1, e0)) / sqrt(2)
    antisymmetric_cross = (kron(e0, e1) - kron(e1, e0)) / sqrt(2)

    @test P_symmetric * e00 ≈ e00
    @test P_symmetric * symmetric_cross ≈ symmetric_cross
    @test P_symmetric * e11 ≈ e11
    @test P_symmetric * antisymmetric_cross ≈ zeros(ComplexF64, 4)
    @test P_antisymmetric * antisymmetric_cross ≈ antisymmetric_cross
    @test P_antisymmetric * e00 ≈ zeros(ComplexF64, 4)
end

@testset "Fibonacci fusion path counts" begin
    counts = CftAnyons.fibonacci_fusion_path_counts(7)

    @test counts == [
        (1, 0),
        (0, 1),
        (1, 1),
        (1, 2),
        (2, 3),
        (3, 5),
        (5, 8),
        (8, 13),
    ]

    one_counts = first.(counts)
    tau_counts = last.(counts)
    @test tau_counts[1:7] == [0, 1, 1, 2, 3, 5, 8]
    @test one_counts[2:end] == tau_counts[1:end-1]
    @test tau_counts[3:end] == tau_counts[2:end-1] .+ tau_counts[1:end-2]
    @test_throws ErrorException CftAnyons.fibonacci_fusion_path_counts(-1)
end

@testset "Poincare vector-field brackets" begin
    P(μ) = (:P, μ, 0)
    M(μ, ν) = μ < ν ? (:M, μ, ν) : (:M, ν, μ)
    bracket(a, b) = CftAnyons.poincare_vector_field_bracket(a, b, 3)

    @test bracket(P(0), P(1)) == Dict{Tuple{Symbol, Int, Int}, Int}()
    @test bracket(M(0, 1), P(0)) == Dict(P(1) => -1)
    @test bracket(M(0, 1), P(1)) == Dict(P(0) => -1)
    @test bracket(M(1, 2), P(1)) == Dict(P(2) => 1)
    @test bracket(M(1, 2), M(2, 3)) == Dict(M(1, 3) => -1)
    @test bracket(M(0, 1), M(0, 2)) == Dict(M(1, 2) => -1)
    @test_throws ErrorException CftAnyons.poincare_vector_field_bracket(P(4), P(0), 3)
    @test_throws ErrorException CftAnyons.poincare_vector_field_bracket((:M, 2, 1), P(0), 3)
end

@testset "nearest-neighbour boost current coefficients" begin
    @test CftAnyons.nearest_neighbor_boost_current_coefficients(0:5) == ones(Int, 5)
    @test CftAnyons.nearest_neighbor_boost_current_coefficients([0, 1, 3, 6]) == [1, 2, 3]
    @test_throws ErrorException CftAnyons.nearest_neighbor_boost_current_coefficients([0])
end

@testset "qubit Pauli nearest-neighbour current obstructions" begin
    onsite_coefficients = [0.25, 0.7, -0.3, 0.5]
    onsite_density = CftAnyons.symmetric_onsite_bond_density(onsite_coefficients)
    onsite_current = CftAnyons.adjacent_bond_boost_current(onsite_density)
    onsite_conservation = CftAnyons.adjacent_bond_conservation_residual(onsite_density)
    onsite_full_conservation = CftAnyons.infinite_chain_conservation_density(onsite_density)
    onsite_boost_density = CftAnyons.first_moment_boost_density(onsite_density)

    @test onsite_density ≈ onsite_density'
    @test isapprox(onsite_current, zeros(ComplexF64, 8, 8);
        atol = CftAnyons.PAULI_COEFFICIENT_ATOL, rtol = CftAnyons.PAULI_COEFFICIENT_RTOL)
    @test isapprox(onsite_conservation, zeros(ComplexF64, 8, 8);
        atol = CftAnyons.PAULI_COEFFICIENT_ATOL, rtol = CftAnyons.PAULI_COEFFICIENT_RTOL)
    @test isapprox(onsite_full_conservation, zeros(ComplexF64, 32, 32);
        atol = CftAnyons.PAULI_COEFFICIENT_ATOL, rtol = CftAnyons.PAULI_COEFFICIENT_RTOL)
    @test isapprox(onsite_boost_density, zeros(ComplexF64, 32, 32);
        atol = CftAnyons.PAULI_COEFFICIENT_ATOL, rtol = CftAnyons.PAULI_COEFFICIENT_RTOL)
    @test isapprox(CftAnyons.adjacent_bond_current_norm(onsite_density), 0;
        atol = CftAnyons.PAULI_COEFFICIENT_ATOL, rtol = CftAnyons.PAULI_COEFFICIENT_RTOL)
    @test norm(CftAnyons.local_operator_embedding(onsite_density, 1, 5)) > 0.1

    onsite_roundtrip = CftAnyons.pauli_two_site_coefficients(onsite_density)
    expected_left = onsite_coefficients / 2
    expected_right = onsite_coefficients / 2
    expected_left[1] = onsite_coefficients[1]
    expected_right[1] = onsite_coefficients[1]
    @test onsite_roundtrip[:, 1] ≈ expected_left
    @test onsite_roundtrip[1, :] ≈ expected_right
    @test onsite_roundtrip[2:4, 2:4] ≈ zeros(3, 3)

    classical_zz = zeros(4, 4)
    classical_zz[4, 4] = 1.25
    @test CftAnyons.adjacent_bond_current_norm(
        CftAnyons.pauli_two_site_operator(classical_zz)) ≈ 0

    transverse_ising = zeros(4, 4)
    transverse_ising[4, 4] = -1.0
    transverse_ising[2, 1] = -0.35
    transverse_ising[1, 2] = -0.35
    interacting_density = CftAnyons.pauli_two_site_operator(transverse_ising)
    interacting_current = CftAnyons.adjacent_bond_boost_current(interacting_density)
    interacting_current_coefficients =
        CftAnyons.adjacent_bond_current_pauli_coefficients(transverse_ising)
    interacting_conservation = CftAnyons.infinite_chain_conservation_density(interacting_density)
    interacting_boost_density = CftAnyons.first_moment_boost_density(interacting_density)
    interacting_boost_relation_density = CftAnyons.boost_relation_local_density(interacting_density)

    @test interacting_current ≈ interacting_current'
    @test CftAnyons.adjacent_bond_current_norm(interacting_density) > 0.1
    @test CftAnyons.pauli_two_site_coefficients(interacting_density) ≈ transverse_ising
    @test CftAnyons.pauli_three_site_operator(interacting_current_coefficients) ≈
          interacting_current
    @test interacting_current_coefficients[4, 3, 1] ≈ -0.7
    @test interacting_current_coefficients[1, 3, 4] ≈ 0.7
    @test CftAnyons.pauli_n_site_operator(
        CftAnyons.pauli_n_site_coefficients(interacting_conservation, 5)) ≈
          interacting_conservation
    @test interacting_boost_density ≈ interacting_boost_density'
    @test norm(interacting_boost_density) > 0.1
    @test interacting_boost_relation_density ≈ interacting_boost_relation_density'
    @test norm(interacting_boost_relation_density) > 0.1
    @test CftAnyons.pauli_n_site_operator(
        CftAnyons.pauli_n_site_coefficients(interacting_boost_relation_density, 4)) ≈
          interacting_boost_relation_density

    coboundary_witness = zeros(4, 4)
    coboundary_witness[2, 4] = 0.25
    coboundary_witness[1, 1] = 7.0
    coboundary = CftAnyons.one_dimensional_coboundary_coefficients(coboundary_witness)
    witness_operator = CftAnyons.pauli_two_site_operator(coboundary_witness)
    @test coboundary[2, 4, 1] ≈ 0.25
    @test coboundary[1, 2, 4] ≈ -0.25
    @test coboundary[1, 1, 1] ≈ 0.0
    @test CftAnyons.pauli_n_site_operator(coboundary) ≈
          CftAnyons.local_operator_embedding(witness_operator, 1, 3) -
          CftAnyons.local_operator_embedding(witness_operator, 2, 3)

    asymmetric_fake = kron(CftAnyons.PAULI_BASIS[2], CftAnyons.PAULI_BASIS[1]) +
                      kron(CftAnyons.PAULI_BASIS[1], CftAnyons.PAULI_BASIS[4])
    fake_current = CftAnyons.adjacent_bond_boost_current(asymmetric_fake)
    fake_conservation = CftAnyons.adjacent_bond_conservation_residual(asymmetric_fake)
    fake_full_conservation = CftAnyons.infinite_chain_conservation_density(asymmetric_fake)
    @test CftAnyons.adjacent_bond_current_norm(asymmetric_fake) > 1
    @test norm(fake_conservation) > norm(fake_current)
    @test norm(fake_full_conservation) > norm(fake_current)

    @test_throws ErrorException CftAnyons.pauli_two_site_operator(zeros(3, 3))
    @test_throws ErrorException CftAnyons.pauli_site_operator([1.0, 0.0, 0.0])
    @test_throws ErrorException CftAnyons.adjacent_bond_boost_current(zeros(3, 3))
    @test_throws ErrorException CftAnyons.adjacent_bond_current_pauli_coefficients(zeros(3, 3))
    @test_throws ErrorException CftAnyons.pauli_n_site_operator(zeros(4, 3))
    @test_throws ErrorException CftAnyons.local_operator_embedding(zeros(3, 3), 1, 3)
    @test_throws ErrorException CftAnyons.one_dimensional_coboundary_coefficients(zeros(4, 3))
end

@testset "qubit Pauli moment SDP hierarchy" begin
    identity_word = CftAnyons.PauliWord()
    x0 = CftAnyons.pauli_word([1])
    y0 = CftAnyons.pauli_word([2])
    z0 = CftAnyons.pauli_word([3])
    x2 = CftAnyons.pauli_word([1]; start = 2)
    z4 = CftAnyons.pauli_word([3]; start = 4)

    phase, word = CftAnyons.multiply_pauli_words(x0, y0)
    @test phase == 1.0im
    @test word == z0

    phase, word = CftAnyons.multiply_pauli_words(y0, x0)
    @test phase == -1.0im
    @test word == z0

    phase, word = CftAnyons.multiply_pauli_words(x0, x0)
    @test phase == 1.0 + 0.0im
    @test word == identity_word

    phase, word = CftAnyons.multiply_pauli_words(x2, z4)
    @test phase == 1.0 + 0.0im
    @test word == CftAnyons.PauliWord((2, 4), (1, 3))
    @test CftAnyons.canonical_moment_word(word) == CftAnyons.PauliWord((0, 2), (1, 3))
    @test CftAnyons.canonical_moment_word(CftAnyons.PauliWord((-3, -1), (1, 3))) ==
          CftAnyons.PauliWord((0, 2), (1, 3))

    one_site_spec = CftAnyons.QubitSDPSpec(psd_window_length = 1)
    one_site_data = CftAnyons.build_qubit_sdp_model(one_site_spec)
    @test one_site_data.psd_dimension == 8
    @test length(one_site_data.moment_variables) == 3
    @test JuMP.num_variables(one_site_data.model) == 3
    @test one_site_data.relation_constraint_count == 0

    zero_relation_spec = CftAnyons.QubitSDPSpec(
        psd_window_length = 1,
        relation_window_length = 1,
        residuals = [CftAnyons.PauliTerm[]],
    )
    zero_relation_data = CftAnyons.build_qubit_sdp_model(zero_relation_spec)
    @test zero_relation_data.relation_constraint_count == 0

    identity_relation_spec = CftAnyons.QubitSDPSpec(
        psd_window_length = 1,
        relation_window_length = 0,
        residuals = [CftAnyons.identity_residual_terms()],
    )
    identity_relation_data = CftAnyons.build_qubit_sdp_model(identity_relation_spec)
    @test identity_relation_data.relation_constraint_count == 1
    @test CftAnyons.solve_qubit_sdp(one_site_spec).status == :not_excluded_at_level
    @test CftAnyons.solve_qubit_sdp(identity_relation_spec).status == :excluded

    zz = zeros(4, 4)
    zz[4, 4] = 1.0
    zz_relation_spec = CftAnyons.QubitSDPSpec(
        psd_window_length = 2,
        relation_window_length = 2,
        residuals = [CftAnyons.coefficient_residual_terms(zz)],
    )
    @test CftAnyons.solve_qubit_sdp(zz_relation_spec).status == :excluded

    transverse_ising = zeros(4, 4)
    transverse_ising[4, 4] = -1.0
    transverse_ising[2, 1] = -0.35
    transverse_ising[1, 2] = -0.35
    @test !isempty(CftAnyons.conservation_residual_terms(transverse_ising))
    @test !isempty(CftAnyons.boost_residual_terms(transverse_ising; speed2 = 1.0))

    sentinels = CftAnyons.qubit_sentinel_hamiltonians()
    @test CftAnyons.qubit_current_filter_status(sentinels[:onsite]) == :current_collapsed
    @test CftAnyons.qubit_current_filter_status(sentinels[:zz]) == :current_collapsed
    @test CftAnyons.qubit_current_filter_status(sentinels[:transverse_ising]) == :currentful
    @test CftAnyons.qubit_current_filter_status(sentinels[:generic_currentful]) == :currentful
    @test CftAnyons.qubit_current_filter_status(sentinels[:fake_split]) == :currentful

    onsite_conservation_witness = CftAnyons.solve_conservation_witness(sentinels[:onsite])
    onsite_boost_witness =
        CftAnyons.solve_boost_witness(sentinels[:onsite], onsite_conservation_witness.u)
    @test onsite_conservation_witness.feasible
    @test onsite_boost_witness.feasible
    @test !onsite_boost_witness.nontrivial_speed

    ti_conservation_witness = CftAnyons.solve_conservation_witness(sentinels[:transverse_ising])
    ti_boost_witness =
        CftAnyons.solve_boost_witness(sentinels[:transverse_ising], ti_conservation_witness.u)
    @test ti_conservation_witness.feasible
    @test !ti_boost_witness.feasible

    @test !CftAnyons.solve_conservation_witness(sentinels[:generic_currentful]).feasible
    @test !CftAnyons.solve_conservation_witness(sentinels[:fake_split]).feasible
end

@testset "qubit full-window moment compactness witnesses" begin
    # Finite witnesses for shard CA-63: exact feasibility of the full-window
    # qubit moment hierarchy at every level implies a translation-invariant
    # state on the quasi-local spin algebra. Each check pins one proof step.
    I2 = Matrix{ComplexF64}(I, 2, 2)

    # --- (1) density matrix PSD  <=>  moment matrix PSD (eq. 63.4/63.5). ---
    # Translation-invariant product state, Bloch vector of norm < 1 (an
    # interior, strictly positive state), on windows N = 0 and N = 1.
    bloch = [0.3, -0.2, 0.4]
    @test norm(bloch) < 1
    for N in (0, 1)
        start = -N
        len = 2N + 1
        y = CftAnyons.product_state_moment_vector(bloch, start, len)
        rho = CftAnyons.density_matrix_from_moments(y, start, len)
        words = CftAnyons.window_pauli_words(start, len)
        M = CftAnyons.moment_matrix_from_moments(words, y)

        # rho is a genuine density matrix: unit trace, Hermitian, and for N = 0
        # exactly (I + b·σ)/2 (a known closed form, not just "no error").
        @test tr(rho) ≈ 1
        @test ishermitian(rho)
        @test ishermitian(M)
        # The Pauli product phases are load-bearing: e.g. <X_0 Y_0> = i<Z_0>,
        # so M carries genuinely imaginary off-diagonal entries (dropping the
        # phase would silently collapse M to a real matrix).
        @test !isreal(M)
        if N == 0
            expected = (CftAnyons.PAULI_BASIS[1] + bloch[1] * CftAnyons.PAULI_BASIS[2] +
                        bloch[2] * CftAnyons.PAULI_BASIS[3] + bloch[3] * CftAnyons.PAULI_BASIS[4]) / 2
            @test rho ≈ expected
            @test eigvals(Hermitian(rho)) ≈ sort([(1 + norm(bloch)) / 2, (1 - norm(bloch)) / 2])
            # M[X_0, Y_0] = i * <Z_0> = i * b_z pins the phase exactly.
            w1 = CftAnyons.window_pauli_words(0, 1)
            ix = findfirst(==(CftAnyons.pauli_word([1])), w1)
            iy = findfirst(==(CftAnyons.pauli_word([2])), w1)
            @test M[ix, iy] ≈ im * bloch[3]
        end

        @test CftAnyons.is_moment_psd(rho)
        @test CftAnyons.is_moment_psd(M)
        @test CftAnyons.is_moment_psd(rho) == CftAnyons.is_moment_psd(M)
    end

    # --- (2) product-trace extension preserves every window moment (Lemma 4). ---
    # Positive density matrix on [-1, 1], extended to [-2, 2] by E_N (tensoring
    # normalized identities). Every Pauli word supported in [-1, 1] keeps its
    # expectation exactly, so the extension lands in the same level set K_1.
    y_win = CftAnyons.product_state_moment_vector(bloch, -1, 3)
    rho_window = CftAnyons.density_matrix_from_moments(y_win, -1, 3)
    @test CftAnyons.is_moment_psd(rho_window)
    rho_ext = CftAnyons.extend_density_matrix(rho_window, 1, 1)
    @test rho_ext ≈ kron(I2 / 2, rho_window, I2 / 2)
    @test tr(rho_ext) ≈ 1
    for word in CftAnyons.window_pauli_words(-1, 3)
        lhs = tr(rho_ext * CftAnyons.pauli_word_matrix(word, -2, 5))
        rhs = tr(rho_window * CftAnyons.pauli_word_matrix(word, -1, 3))
        @test lhs ≈ rhs atol = 1e-12
    end

    # --- (3) empirical nesting  K_2 ⊆ K_1  (Lemma 6). ---
    # A level-2-feasible (full-window, zero-residual) moment vector restricts to
    # a level-1-feasible one: same dict of canonical moments, so normalization,
    # translation equalities, and PSD all descend to the smaller window.
    y2 = CftAnyons.product_state_moment_vector(bloch, -2, 5)
    @test CftAnyons.moment_value(y2, CftAnyons.PauliWord()) == 1.0   # normalization
    level1_words = CftAnyons.window_pauli_words(-1, 3)
    for word in level1_words
        # translation equality y_s = y_{τ^k s} for shifts keeping s in [-2, 2].
        for k in (-1, 1)
            shifted = CftAnyons.translate_pauli_word(word, k)
            all(-2 .<= collect(shifted.sites) .<= 2) || continue
            @test CftAnyons.moment_value(y2, word) ≈ CftAnyons.moment_value(y2, shifted)
        end
    end
    M1_restricted = CftAnyons.moment_matrix_from_moments(level1_words, y2)
    @test CftAnyons.is_moment_psd(M1_restricted)               # PSD survives restriction

    # --- (4) mutation: a nonpositive moment assignment is rejected. ---
    # Start from the one-site trace (maximally mixed) moments, force y[X_0] = 1.1
    # > 1. Then rho = (I + 1.1 X)/2 has a negative eigenvalue and both rho and
    # the moment matrix fail PSD — the check rejects, it does not merely run.
    y_bad = CftAnyons.product_state_moment_vector([0.0, 0.0, 0.0], 0, 1)
    x0 = CftAnyons.pauli_word([1])
    y_bad[x0] = 1.1
    rho_bad = CftAnyons.density_matrix_from_moments(y_bad, 0, 1)
    @test rho_bad ≈ (CftAnyons.PAULI_BASIS[1] + 1.1 * CftAnyons.PAULI_BASIS[2]) / 2
    M_bad = CftAnyons.moment_matrix_from_moments(CftAnyons.window_pauli_words(0, 1), y_bad)
    @test !CftAnyons.is_moment_psd(rho_bad)
    @test !CftAnyons.is_moment_psd(M_bad)
    @test eigmin(Hermitian(rho_bad)) < -1e-8
    @test eigmin(Hermitian(M_bad)) < -1e-8
end

@testset "qubit Hamiltonian candidate scan" begin
    onsite = CftAnyons.qubit_onsite_field_density(; hx = 0.7, hy = -0.3, hz = 0.5, scalar = 0.25)
    @test onsite ≈ CftAnyons.pauli_two_site_coefficients(
        CftAnyons.symmetric_onsite_bond_density([0.25, 0.7, -0.3, 0.5]))

    tfim = CftAnyons.qubit_tfim_density(; coupling = 1.0, field = 1.0)
    @test tfim[4, 4] == -1.0
    @test tfim[2, 1] == -0.5
    @test tfim[1, 2] == -0.5
    @test CftAnyons.pauli_two_site_coefficients(CftAnyons.pauli_two_site_operator(tfim)) ≈ tfim

    identity_shift = copy(tfim)
    identity_shift[1, 1] += 7.0
    tfim_result = CftAnyons.scan_qubit_candidate(
        CftAnyons.QubitHamiltonianSample("tfim_self_dual", :tfim, Dict(:field => 1.0), tfim))
    shifted_result = CftAnyons.scan_qubit_candidate(
        CftAnyons.QubitHamiltonianSample("tfim_shifted", :tfim, Dict(:field => 1.0), identity_shift))
    @test tfim_result.verdict == :excluded_no_boost_witness
    @test tfim_result.conservation_feasible
    @test !tfim_result.boost_feasible
    @test shifted_result.verdict == tfim_result.verdict
    @test shifted_result.current_norm ≈ tfim_result.current_norm

    xxz = CftAnyons.qubit_xxz_density(; exchange = 1.0, delta = 1.0)
    heisenberg = CftAnyons.qubit_heisenberg_density(; exchange = 1.0)
    @test xxz ≈ heisenberg

    samples = CftAnyons.qubit_candidate_scan_samples()
    results = CftAnyons.scan_qubit_candidates(samples)
    summary = CftAnyons.qubit_scan_summary_table(results)
    @test length(samples) == 99
    @test summary["total"] == 99
    @test summary["by_verdict"]["excluded_current_collapsed"] == 9
    @test summary["by_verdict"]["excluded_no_conservation_witness"] == 27
    @test summary["by_verdict"]["excluded_no_boost_witness"] == 63
    @test only(r for r in results if r.sample.name == "tfim_self_dual").verdict ==
          :excluded_no_boost_witness
    @test all(r -> r.verdict != :not_excluded_algebraic, results)

    row = CftAnyons.qubit_scan_result_row(tfim_result)
    @test row["scope"] == "fixed_first_moment_route"
    @test row["terminal_gate"] == "boost"
    @test row["source_kind"] == "locally_sourced_family"
    @test row["coefficients"][4][4] == -1.0
end

@testset "Galilei vector-field brackets" begin
    H = (:H, 0, 0)
    P(a) = (:P, a, 0)
    G(a) = (:G, a, 0)
    J(a, b) = a < b ? (:J, a, b) : (:J, b, a)
    bracket(a, b) = CftAnyons.galilei_vector_field_bracket(a, b, 3)

    @test bracket(P(1), P(2)) == Dict{Tuple{Symbol, Int, Int}, Int}()
    @test bracket(G(1), G(2)) == Dict{Tuple{Symbol, Int, Int}, Int}()
    @test bracket(P(1), G(2)) == Dict{Tuple{Symbol, Int, Int}, Int}()
    @test bracket(H, G(1)) == Dict(P(1) => 1)
    @test bracket(G(1), H) == Dict(P(1) => -1)
    @test bracket(J(1, 2), P(1)) == Dict(P(2) => -1)
    @test bracket(J(1, 2), P(2)) == Dict(P(1) => 1)
    @test bracket(J(1, 2), G(1)) == Dict(G(2) => -1)
    @test bracket(J(1, 2), J(2, 3)) == Dict(J(1, 3) => 1)
    @test_throws ErrorException CftAnyons.galilei_vector_field_bracket((:J, 2, 1), H, 3)
    @test_throws ErrorException CftAnyons.galilei_vector_field_bracket(P(4), H, 3)
end

@testset "Galilei mass central coefficient" begin
    @test CftAnyons.galilei_mass_central_coefficient(7, 1, 1) == 7
    @test CftAnyons.galilei_mass_central_coefficient(7, 1, 2) == 0
    @test CftAnyons.galilei_mass_central_coefficient(2.5, 3, 3) == 2.5
    @test_throws ErrorException CftAnyons.galilei_mass_central_coefficient(1, 0, 1)
    @test_throws ErrorException CftAnyons.galilei_mass_central_coefficient(1, 1, 0)
end

@testset "first-moment continuity current coefficients" begin
    @test CftAnyons.first_moment_continuity_current_coefficients(0:4) == ones(Int, 4)
    @test CftAnyons.first_moment_continuity_current_coefficients([-1, 0, 2, 5]) == [1, 2, 3]
    @test_throws ErrorException CftAnyons.first_moment_continuity_current_coefficients([0])
end

gaussian_symbol_isapprox(actual, expected) = isapprox(actual, expected; atol = CftAnyons.GAUSSIAN_SYMBOL_VALUE_ATOL, rtol = CftAnyons.GAUSSIAN_SYMBOL_VALUE_RTOL)
gaussian_eigenvalue_isapprox(actual, expected) = isapprox(actual, expected; atol = CftAnyons.GAUSSIAN_EIGENVALUE_ATOL, rtol = CftAnyons.GAUSSIAN_EIGENVALUE_RTOL)
gaussian_small_spacing_isapprox(actual, expected) = isapprox(actual, expected; atol = CftAnyons.GAUSSIAN_SMALL_SPACING_RESIDUAL_ATOL, rtol = CftAnyons.GAUSSIAN_SMALL_SPACING_RESIDUAL_RTOL)
const GAUSSIAN_FINITE_DIFFERENCE_ATOL = 2e-8
const GAUSSIAN_FINITE_DIFFERENCE_RTOL = 2e-8
gaussian_finite_difference_isapprox(actual, expected) =
    isapprox(actual, expected; atol = GAUSSIAN_FINITE_DIFFERENCE_ATOL, rtol = GAUSSIAN_FINITE_DIFFERENCE_RTOL)

function central_difference_half_gradient(coefficients, k; spacing = 1, step = 1e-5)
    out = zeros(Float64, length(k))
    for axis in eachindex(k)
        plus = copy(k)
        minus = copy(k)
        plus[axis] += step
        minus[axis] -= step
        forward = CftAnyons.scalar_quadratic_symbol(coefficients, plus; spacing)
        backward = CftAnyons.scalar_quadratic_symbol(coefficients, minus; spacing)
        out[axis] = (forward - backward) / (4 * step)
    end
    return out
end

periodic_label_momentum(label, sizes; spacing = 1) =
    [2 * pi * label[axis] / (spacing * sizes[axis]) for axis in eachindex(sizes)]

function assert_periodic_fourier_eigenvectors(coefficients, sizes, labels; spacing = 1, radius = 1)
    @test all(L -> L > 2radius, sizes)
    stiffness = CftAnyons.periodic_stiffness_matrix(coefficients, sizes)
    for label in labels
        fourier_vector = CftAnyons.periodic_fourier_vector(sizes, label)
        momentum = periodic_label_momentum(label, sizes; spacing)
        symbol = CftAnyons.scalar_quadratic_symbol(coefficients, momentum; spacing)

        @test gaussian_eigenvalue_isapprox(norm(fourier_vector), 1)
        @test gaussian_eigenvalue_isapprox(stiffness * fourier_vector, symbol * fourier_vector)
    end
end

raw_periodic_symbol(coefficients, label, sizes) =
    sum(coeff * cis(2 * pi * sum(offset[axis] * label[axis] / sizes[axis]
                                 for axis in eachindex(sizes)))
        for (offset, coeff) in coefficients)

@testset "Gaussian boson numerical tolerance policy" begin
    @test CftAnyons.GAUSSIAN_SYMBOL_IMAG_ATOL == 1e-10
    @test CftAnyons.GAUSSIAN_SYMBOL_IMAG_RTOL == 1e-10
    @test CftAnyons.GAUSSIAN_EIGENVALUE_ATOL == 1e-10
    @test CftAnyons.GAUSSIAN_EIGENVALUE_RTOL == 1e-10
    @test CftAnyons.GAUSSIAN_MINIMUM_COUNT_ATOL == 1e-10
    @test CftAnyons.GAUSSIAN_MINIMUM_COUNT_RTOL == 1e-10
    @test CftAnyons.GAUSSIAN_SMALL_SPACING_RESIDUAL_ATOL == 5e-4
    @test CftAnyons.GAUSSIAN_SMALL_SPACING_RESIDUAL_RTOL == 1e-10

    near_flat = [([0], 1.0), ([1], -2e-11), ([-1], -2e-11)]
    @test CftAnyons.count_periodic_symbol_minima(near_flat, [2]; spacing = 1) == 2
    @test CftAnyons.count_periodic_symbol_minima(near_flat, [2]; spacing = 1, atol = 1e-13, rtol = 0.0) == 1
end

@testset "Gaussian boson scalar coefficient validation" begin
    valid = [([0], 2.0), ([1], -0.5), ([-1], -0.5)]
    duplicated = [([0], 2.0), ([1], -0.2), ([1], -0.3), ([-1], -0.5)]

    @test CftAnyons.validate_scalar_coefficients(valid) == 1
    @test CftAnyons.validate_scalar_coefficients(duplicated; spatial_dim = 1) == 1

    @test_throws ErrorException CftAnyons.validate_scalar_coefficients([([0], 2.0), ([1], -0.5)])
    @test_throws ErrorException CftAnyons.validate_scalar_coefficients([([0], 2.0), ([1], -0.5), ([-1], -0.4)])
    @test_throws ErrorException CftAnyons.validate_scalar_coefficients([([0], 1.0 + 0.1im)])
    @test_throws ErrorException CftAnyons.validate_scalar_coefficients([([0, 0], 1.0), ([1], -0.5), ([-1], -0.5)])
    @test_throws ErrorException CftAnyons.validate_scalar_coefficients([([0.5], 1.0)])
    @test_throws ErrorException CftAnyons.scalar_quadratic_symbol([([0], 2.0), ([1], -0.5)], [0.2])
    @test_throws ErrorException CftAnyons.boost_time_symbol_from_coefficients([([0], 2.0), ([1], -0.5)], [0.2])
end

@testset "Gaussian quadratic commutator sign convention" begin
    q_energy = [1 0; 0 0]
    p_energy = [0 0; 0 1]

    # i[q^2 / 2, p^2 / 2] = -(q p + p q) / 2.
    @test CftAnyons.quadratic_commutator_matrix(q_energy, p_energy) == [0 -1; -1 0]
    @test CftAnyons.quadratic_commutator_matrix(p_energy, q_energy) == [0 1; 1 0]
    @test CftAnyons.canonical_phase_space_symplectic(1) == [0 1; -1 0]
    @test_throws ErrorException CftAnyons.quadratic_commutator_matrix(zeros(3, 3), zeros(3, 3))
end

@testset "Gaussian open-chain energy current continuity" begin
    cases = [
        (2, 0.75, -0.5),
        (3, 2.0, 1.25),
        (5, 7.25, -1.5),
        (7, 0.1, -0.875),
    ]

    for (N, onsite, bond) in cases
        densities = CftAnyons.open_chain_gaussian_energy_density_matrices(N; onsite, bond)
        hamiltonian = CftAnyons.open_chain_gaussian_hamiltonian_matrix(N; onsite, bond)
        currents = CftAnyons.open_chain_gaussian_energy_current_matrices(densities)
        shifted_currents = CftAnyons.open_chain_gaussian_energy_current_matrices(N;
            onsite = onsite + 3.0, bond)

        @test length(densities) == N
        @test length(currents) == N - 1
        @test gaussian_symbol_isapprox(sum(densities), hamiltonian)
        @test gaussian_symbol_isapprox(hamiltonian[1:N, 1:N],
            SymTridiagonal(fill(onsite, N), fill(bond, N - 1)))
        @test gaussian_symbol_isapprox(hamiltonian[N + 1:2N, N + 1:2N],
            Matrix{Float64}(I, N, N))

        for j in 1:(N - 1)
            closed_form = CftAnyons.open_chain_gaussian_energy_current_closed_form_matrix(N, j;
                bond)
            @test gaussian_symbol_isapprox(currents[j], closed_form)
            @test gaussian_symbol_isapprox(currents[j], shifted_currents[j])
            @test gaussian_symbol_isapprox(closed_form[j + 1, N + j], bond / 2)
            @test gaussian_symbol_isapprox(closed_form[j, N + j + 1], -bond / 2)
        end

        continuity_residuals = CftAnyons.open_chain_gaussian_energy_continuity_residuals(N;
            onsite, bond)
        @test length(continuity_residuals) == N
        @test all(residual -> gaussian_symbol_isapprox(residual, zeros(2N, 2N)),
            continuity_residuals)

        lhs = [CftAnyons.quadratic_commutator_matrix(hamiltonian, densities[j]) for j in 1:N]
        @test gaussian_symbol_isapprox(lhs[1], -currents[1])
        for j in 2:(N - 1)
            @test gaussian_symbol_isapprox(lhs[j], currents[j - 1] - currents[j])
        end
        @test gaussian_symbol_isapprox(lhs[N], currents[N - 1])
    end

    @test_throws ErrorException CftAnyons.open_chain_gaussian_energy_current_matrices(1;
        onsite = 1, bond = -1)
    @test_throws ErrorException CftAnyons.open_chain_gaussian_energy_current_closed_form_matrix(3, 3;
        bond = -1)
end

@testset "Gaussian boson Klein-Gordon symbols" begin
    for d in 1:3
        k = collect(0.1:0.1:(0.1d))
        mass = 0.7
        spacing = 0.25
        coeffs = CftAnyons.kg_nearest_neighbor_coefficients(d; mass, spacing)

        @test length(coeffs) == 1 + 2d
        @test gaussian_symbol_isapprox(CftAnyons.scalar_quadratic_symbol(coeffs, k; spacing),
            CftAnyons.kg_lattice_omega_squared(k; mass, spacing))
        @test gaussian_symbol_isapprox(CftAnyons.continuum_kg_omega_squared(k; mass), mass^2 + sum(abs2, k))
    end

    @test_throws ErrorException CftAnyons.kg_lattice_omega_squared([0.0, 0.1, 0.2, 0.3]; mass = 1)
    @test_throws ErrorException CftAnyons.kg_nearest_neighbor_coefficients(4; mass = 1)
end

@testset "Gaussian boson boost-time symbols" begin
    for d in 1:3
        k = [0.1 * (-1)^a * a for a in 1:d]
        mass = 0.4
        spacing = 0.2
        coeffs = CftAnyons.kg_nearest_neighbor_coefficients(d; mass, spacing)

        @test gaussian_symbol_isapprox(CftAnyons.boost_time_symbol_from_coefficients(coeffs, k; spacing),
            CftAnyons.kg_lattice_boost_time_symbol(k; spacing))
        @test gaussian_symbol_isapprox(CftAnyons.continuum_kg_boost_time_symbol(k), k)
    end

    k = [0.3, -0.2, 0.1]
    ε = 0.05
    lattice_symbol = CftAnyons.kg_lattice_boost_time_symbol(k; spacing = ε)
    @test gaussian_small_spacing_isapprox(lattice_symbol, k)
    @test_throws ErrorException CftAnyons.kg_lattice_boost_time_symbol([0.0]; spacing = 0)
end

@testset "Gaussian boson current-symbol equivalence" begin
    for spacing in (1.0, 0.4, 0.125)
        bond = -1 / spacing^2
        for k in ([-0.7], [-0.2], [0.0], [0.35], [1.1])
            current_symbol = CftAnyons.nearest_neighbor_integrated_energy_current_symbol(k;
                bond, spacing)
            kg_current_symbol = CftAnyons.kg_nearest_neighbor_integrated_energy_current_symbol(k;
                spacing)
            boost_time_symbol = CftAnyons.kg_lattice_boost_time_symbol(k; spacing)

            @test gaussian_symbol_isapprox(current_symbol, kg_current_symbol)
            @test gaussian_symbol_isapprox(current_symbol, boost_time_symbol)
        end
    end

    spacing = 0.3
    k = [0.8]
    positive_orientation = CftAnyons.kg_nearest_neighbor_integrated_energy_current_symbol(k;
        spacing)
    reversed_bond_symbol = CftAnyons.nearest_neighbor_integrated_energy_current_symbol(k;
        bond = 1 / spacing^2, spacing)

    @test positive_orientation[1] > 0
    @test reversed_bond_symbol[1] < 0
    @test gaussian_symbol_isapprox(positive_orientation, CftAnyons.kg_lattice_boost_time_symbol(k; spacing))
    @test !gaussian_symbol_isapprox(reversed_bond_symbol, CftAnyons.kg_lattice_boost_time_symbol(k; spacing))

    for spacing in (0.05, 0.025), k in ([-0.9], [-0.25], [0.4], [0.85])
        @test gaussian_small_spacing_isapprox(
            CftAnyons.kg_nearest_neighbor_integrated_energy_current_symbol(k; spacing),
            k)
    end

    @test_throws ErrorException CftAnyons.nearest_neighbor_integrated_energy_current_symbol([0.1, 0.2];
        bond = -1, spacing = 1)
    @test_throws ErrorException CftAnyons.nearest_neighbor_integrated_energy_current_symbol([0.1];
        bond = -1, spacing = 0)
end

@testset "Gaussian stress-energy current slope witnesses" begin
    for (spacing, speed) in ((1.0, 1.0), (0.5, 1.25), (0.125, 0.75))
        kg_bond = -speed^2 / spacing^2
        @test gaussian_symbol_isapprox(
            CftAnyons.nearest_neighbor_current_symbol_speed_residual(; bond = kg_bond,
                spacing, speed),
            0)
        unit_speed_residual = CftAnyons.nearest_neighbor_current_symbol_speed_residual(;
            bond = -1 / spacing^2, spacing, speed)
        @test gaussian_symbol_isapprox(unit_speed_residual, 1 - speed^2)
        speed == 1.0 || @test abs(unit_speed_residual) > 0.1
        @test CftAnyons.nearest_neighbor_current_symbol_speed_residual(;
            bond = abs(kg_bond), spacing, speed) < -speed^2
    end

    spacing = 0.2
    speed = 1.3
    wrong_magnitude = CftAnyons.nearest_neighbor_current_symbol_speed_residual(;
        bond = -0.5 * speed^2 / spacing^2, spacing, speed)
    wrong_sign = CftAnyons.nearest_neighbor_current_symbol_speed_residual(;
        bond = speed^2 / spacing^2, spacing, speed)

    @test gaussian_symbol_isapprox(wrong_magnitude, -0.5 * speed^2)
    @test gaussian_symbol_isapprox(wrong_sign, -2 * speed^2)
    @test_throws ErrorException CftAnyons.nearest_neighbor_current_symbol_speed_residual(;
        bond = -1, spacing = 0, speed = 1)
    @test_throws ErrorException CftAnyons.nearest_neighbor_current_symbol_speed_residual(;
        bond = -1, spacing = 1, speed = 0)
    @test_throws ErrorException CftAnyons.nearest_neighbor_current_symbol_speed_residual(;
        bond = -1, spacing = 1 + im, speed = 1)
    @test_throws ErrorException CftAnyons.nearest_neighbor_current_symbol_speed_residual(;
        bond = -1, spacing = 1, speed = 1 + im)
    @test_throws ErrorException CftAnyons.nearest_neighbor_current_symbol_speed_residual(;
        bond = 1 + im, spacing = 1, speed = 1)
end

@testset "Gaussian boson finite-difference boost-time oracle" begin
    cases = [
        (
            [([0], 2.1), ([1], -0.37), ([-1], -0.37), ([2], 0.08), ([-2], 0.08)],
            [0.37],
            0.7,
        ),
        (
            [
                ([0, 0], 2.6),
                ([1, 0], -0.22), ([-1, 0], -0.22),
                ([0, 1], -0.31), ([0, -1], -0.31),
                ([1, 1], 0.13), ([-1, -1], 0.13),
                ([2, -1], -0.04), ([-2, 1], -0.04),
            ],
            [0.31, -0.24],
            0.8,
        ),
        (
            [
                ([0, 0, 0], 3.4),
                ([1, 0, 0], -0.18), ([-1, 0, 0], -0.18),
                ([0, 1, 0], -0.21), ([0, -1, 0], -0.21),
                ([0, 0, 1], -0.16), ([0, 0, -1], -0.16),
                ([1, 1, 0], 0.09), ([-1, -1, 0], 0.09),
                ([1, -2, 1], -0.035), ([-1, 2, -1], -0.035),
            ],
            [0.17, -0.29, 0.23],
            0.6,
        ),
    ]

    for (coefficients, k, spacing) in cases
        closed_form = CftAnyons.boost_time_symbol_from_coefficients(coefficients, k; spacing)
        finite_difference = central_difference_half_gradient(coefficients, k; spacing)

        @test norm(finite_difference) > 0.01
        @test gaussian_finite_difference_isapprox(closed_form, finite_difference)
    end
end

@testset "Gaussian boson rotation and boost-boost symbol residuals" begin
    for d in 1:3
        k = [0.13 * (-1)^axis * axis for axis in 1:d]
        spacing = 0.03
        coeffs = CftAnyons.kg_nearest_neighbor_coefficients(d; mass = 0.5, spacing)
        rotation = CftAnyons.rotation_hamiltonian_residual_from_coefficients(coeffs, k; spacing)
        boost_boost = CftAnyons.boost_boost_residual_coefficients_from_coefficients(coeffs, k; spacing)

        @test gaussian_small_spacing_isapprox(rotation, zeros(d, d))
        @test gaussian_small_spacing_isapprox(boost_boost, zeros(d, d, d))
    end

    speeds = [1.0, 1.4, 0.7]
    anisotropic = CftAnyons.anisotropic_kg_nearest_neighbor_coefficients(speeds; mass = 0.4, spacing = 0.05)
    anisotropic_k = [0.4, -0.3, 0.2]
    anisotropic_rotation = CftAnyons.rotation_hamiltonian_residual_from_coefficients(anisotropic, anisotropic_k; spacing = 0.05)
    anisotropic_boost_boost = CftAnyons.boost_boost_residual_coefficients_from_coefficients(anisotropic, anisotropic_k; spacing = 0.05)
    anisotropic_boost_time = CftAnyons.boost_time_residual_from_coefficients(anisotropic, anisotropic_k; spacing = 0.05)

    @test abs(anisotropic_rotation[1, 2]) > 0.15
    @test gaussian_symbol_isapprox(anisotropic_rotation + anisotropic_rotation', zeros(3, 3))
    @test norm(anisotropic_boost_boost) > 0.25
    @test gaussian_symbol_isapprox(anisotropic_boost_boost + permutedims(anisotropic_boost_boost, (2, 1, 3)), zeros(3, 3, 3))
    @test gaussian_symbol_isapprox(anisotropic_boost_boost[1, 2, 1], anisotropic_boost_time[2])
    @test gaussian_symbol_isapprox(anisotropic_boost_boost[1, 2, 2], -anisotropic_boost_time[1])

    doubler = CftAnyons.doubler_quadratic_coefficients(2; mass = 0, spacing = 1)
    doubler_rotation = CftAnyons.rotation_hamiltonian_residual_from_coefficients(doubler, [pi / 2, pi / 4]; spacing = 1)
    doubler_boost_boost = CftAnyons.boost_boost_residual_coefficients_from_coefficients(doubler, [pi, 0.0]; spacing = 1)

    @test abs(doubler_rotation[1, 2]) > 1
    @test gaussian_symbol_isapprox(CftAnyons.scalar_quadratic_symbol(doubler, [pi, 0.0]; spacing = 1), 0)
    @test abs(doubler_boost_boost[1, 2, 2]) > 3
    @test_throws ErrorException CftAnyons.rotation_hamiltonian_residual_from_coefficients([([0], 2.0), ([1], -0.5)], [0.2])
    @test_throws ErrorException CftAnyons.boost_boost_residual_coefficients_from_coefficients(doubler, [0.1, 0.2]; speed = 0)
end

@testset "Gaussian boson Lorentz Hessian examples" begin
    for d in 1:3
        spacing = 0.35
        coeffs = CftAnyons.kg_nearest_neighbor_coefficients(d; mass = 0.6, spacing)
        hessian = CftAnyons.low_energy_hessian_from_coefficients(coeffs, d; spacing)
        residual = CftAnyons.lorentz_hessian_residual(coeffs, d; spacing)

        @test gaussian_symbol_isapprox(hessian, 2 * Matrix{Float64}(I, d, d))
        @test gaussian_symbol_isapprox(residual, zeros(d, d))
    end

    speeds = [1.0, 1.5, 0.5]
    anisotropic = CftAnyons.anisotropic_kg_nearest_neighbor_coefficients(speeds; mass = 0.4, spacing = 0.25)
    hessian = CftAnyons.low_energy_hessian_from_coefficients(anisotropic, 3; spacing = 0.25)
    residual = CftAnyons.lorentz_hessian_residual(anisotropic, 3; spacing = 0.25)

    @test gaussian_symbol_isapprox(diag(hessian), 2 .* speeds .^ 2)
    @test norm(residual) > 1
end

@testset "Gaussian boson centered periodic momentum labels" begin
    even_grid = CftAnyons.centered_periodic_momentum_grid([4]; spacing = 1)
    @test [entry.label[1] for entry in even_grid] == [0, 1, -2, -1]
    @test gaussian_symbol_isapprox([entry.momentum[1] for entry in even_grid], [0, pi / 2, -pi, -pi / 2])
    @test gaussian_symbol_isapprox(CftAnyons.periodic_momentum_grid([4]; spacing = 1)[4], [3pi / 2])
    @test even_grid[4].label == [-1]
    @test gaussian_symbol_isapprox(even_grid[4].momentum, [-pi / 2])

    odd_grid = CftAnyons.centered_periodic_momentum_grid([5]; spacing = 2)
    @test [entry.label[1] for entry in odd_grid] == [0, 1, 2, -2, -1]
    @test gaussian_symbol_isapprox([entry.momentum[1] for entry in odd_grid],
        [0, pi / 5, 2pi / 5, -2pi / 5, -pi / 5])
    @test_throws ErrorException CftAnyons.centered_periodic_momentum_grid([4]; spacing = 0)
end

@testset "Gaussian boson finite periodic massive coefficient spectra" begin
    for sizes in ([5], [4, 3], [3, 2, 2])
        d = length(sizes)
        spacing = 0.4
        coeffs = CftAnyons.kg_nearest_neighbor_coefficients(d; mass = 0.8, spacing)
        stiffness = CftAnyons.periodic_stiffness_matrix(coeffs, sizes)
        spectrum = sort(eigvals(Symmetric(stiffness)))
        symbols = sort(CftAnyons.periodic_symbol_values(coeffs, sizes; spacing))

        @test gaussian_eigenvalue_isapprox(stiffness, stiffness')
        @test gaussian_eigenvalue_isapprox(spectrum, symbols)
    end

    spacing = 0.4
    off_axis = [
        ([0, 0], 2.0),
        ([1, 0], -0.3), ([-1, 0], -0.3),
        ([0, 1], -0.2), ([0, -1], -0.2),
        ([1, 1], 0.17), ([-1, -1], 0.17),
    ]
    fourier_cases = [
        (CftAnyons.kg_nearest_neighbor_coefficients(1; mass = 0.8, spacing), [5], [[0], [1], [4]]),
        (off_axis, [4, 5], [[0, 0], [1, 2], [3, 4]]),
        (CftAnyons.kg_nearest_neighbor_coefficients(3; mass = 0.8, spacing), [3, 4, 5],
            [[1, 0, 2], [2, 3, 4]]),
    ]

    for (coeffs, sizes, labels) in fourier_cases
        assert_periodic_fourier_eigenvectors(coeffs, sizes, labels; spacing, radius = 1)
    end

    # One-sided shift sentinel: not a scalar Gaussian Hamiltonian, but it pins
    # the finite Fourier offset direction that symmetric kernels cannot detect.
    one_sided = [([0], 0.0), ([1], 1.0)]
    label = [1]
    shift_vector = CftAnyons.periodic_fourier_vector([5], label)
    shift_symbol = raw_periodic_symbol(one_sided, label, [5])
    @test_throws ErrorException CftAnyons.periodic_stiffness_matrix(one_sided, [5])
    shift_matrix = CftAnyons.periodic_stiffness_matrix(one_sided, [5]; validate_coefficients = false)
    @test gaussian_eigenvalue_isapprox(shift_matrix * shift_vector, shift_symbol * shift_vector)
    @test !gaussian_eigenvalue_isapprox(shift_matrix * shift_vector, conj(shift_symbol) * shift_vector)
    @test_throws ErrorException CftAnyons.periodic_fourier_vector([3], [0, 1])
    @test_throws ErrorException CftAnyons.periodic_fourier_vector([3], [0.5])
end

@testset "Gaussian boson finite-grid minimum data" begin
    unstable = [([0], 0.0), ([1], 1.0), ([-1], 1.0), ([2], -0.5), ([-2], -0.5)]
    residual = CftAnyons.lorentz_hessian_residual(unstable, 1; spacing = 1, speed = 1)
    data = CftAnyons.symbol_minimum_data(unstable, [4]; spacing = 1)

    @test gaussian_symbol_isapprox(residual, zeros(1, 1))
    @test gaussian_symbol_isapprox(data.minimum_value, -3)
    @test data.minimum_count == 1
    @test data.minima[1].value == data.minimum_value
    @test data.minima[1].location == [3]
    @test data.minima[1].label == [2]
    @test gaussian_symbol_isapprox(data.minima[1].momentum, [pi])
    @test data.minima[1].centered_label == [-2]
    @test gaussian_symbol_isapprox(data.minima[1].centered_momentum, [-pi])
    @test_throws ErrorException CftAnyons.symbol_minimum_data(unstable, [4]; spacing = 1, require_nonnegative = true)
end

@testset "Gaussian boson massless doubler coefficient rejection" begin
    # This is a coefficient-level zero-mode witness, not positive-dispersion
    # Fock-generator evidence; see CONVENTIONS.md (j).
    for d in 1:3
        sizes = fill(4, d)
        doubler = CftAnyons.doubler_quadratic_coefficients(d; mass = 0, spacing = 1)
        residual = CftAnyons.lorentz_hessian_residual(doubler, d; spacing = 1, speed = 1)
        data = CftAnyons.symbol_minimum_data(doubler, sizes; spacing = 1, require_nonnegative = true)
        expected_labels = Set(Tuple(label) for label in Iterators.product(ntuple(_ -> (0, 2), d)...))
        expected_centered_labels = Set(Tuple(label) for label in Iterators.product(ntuple(_ -> (0, -2), d)...))
        expected_locations = Set(Tuple(label) for label in Iterators.product(ntuple(_ -> (1, 3), d)...))

        @test gaussian_symbol_isapprox(CftAnyons.scalar_quadratic_symbol(doubler, zeros(d); spacing = 1), 0)
        @test gaussian_symbol_isapprox(residual, zeros(d, d))
        @test gaussian_symbol_isapprox(data.minimum_value, 0)
        @test data.minimum_count == 2^d
        @test CftAnyons.count_periodic_symbol_minima(doubler, sizes; spacing = 1) == 2^d
        @test Set(Tuple(minimum.label) for minimum in data.minima) == expected_labels
        @test Set(Tuple(minimum.centered_label) for minimum in data.minima) == expected_centered_labels
        @test Set(Tuple(minimum.location) for minimum in data.minima) == expected_locations
        @test all(minimum -> gaussian_symbol_isapprox(minimum.value, 0), data.minima)
    end
    @test_throws ErrorException CftAnyons.periodic_stiffness_matrix([([0, 0], 1.0)], [3])
end

const RELAXED_MOSEK_OK = try
    m = JuMP.Model(CftAnyons.MosekTools.Optimizer)
    JuMP.set_silent(m)
    JuMP.@variable(m, t >= 0)
    JuMP.@objective(m, Min, t)
    JuMP.optimize!(m)
    JuMP.termination_status(m) == CftAnyons.MOI.OPTIMAL
catch
    false
end

@testset "qubit relaxed residual profiles (CA-64)" begin
    C = CftAnyons

    # --- tracial coefficient norm and trailing-identity embedding. ---
    r = reshape(collect(1.0:16.0), 4, 4)
    @test C.coefficient_l2_norm(r) ≈ norm(vec(r))
    emb = C.embed_pauli_coefficients(r, 4)
    @test ndims(emb) == 4
    @test C.coefficient_l2_norm(emb) ≈ C.coefficient_l2_norm(r)   # padding preserves norm
    @test emb[2, 3, 1, 1] == r[2, 3]
    @test_throws ErrorException C.embed_pauli_coefficients(r, 1)

    # --- the all-identity coboundary column is exactly zero (gauge direction). ---
    scalar_u = zeros(4, 4); scalar_u[1, 1] = 1.0
    @test C.one_dimensional_coboundary_coefficients(scalar_u) == zeros(4, 4, 4)
    Mkeep = C.coboundary_matrix(2; target_support = 3, gauge = :keep_scalar)
    Mzero = C.coboundary_matrix(2; target_support = 3, gauge = :zero_scalar)
    @test size(Mkeep, 2) == size(Mzero, 2) + 1
    @test any(all(iszero, col) for col in eachcol(Mkeep))   # a genuinely zero column

    # --- conservation profile: TFIM self-dual (h = -ZZ - (XI+IX)/2). ---
    tfim = C.qubit_tfim_density(coupling = 1.0, field = 1.0)
    cons = C.solve_conservation_profile(tfim; max_support = 5)
    @test cons[1].support == 1
    @test cons[1].raw_norm ≈ sqrt(10)                         # design prediction eps_c(1)=√10
    @test all(cons[L].raw_norm < 1e-8 for L in 2:5)           # exact conservation at L≥2
    # nonincreasing in L (support-L witness embeds into support-(L+1)).
    @test all(cons[i + 1].raw_norm <= cons[i].raw_norm + 1e-12 for i in 1:4)

    # gauge-invariance: the distance is identical with/without the scalar column.
    cons_keep = C.solve_conservation_profile(tfim; max_support = 3, gauge = :keep_scalar)
    @test all(isapprox(cons[i].raw_norm, cons_keep[i].raw_norm; atol = 1e-9) for i in 1:3)

    # current-gate collapse: onsite and classical ZZ carry no current.
    onsite = C.qubit_onsite_field_density(hx = 1.0)
    zz = C.qubit_xyz_density(jz = -1.0)
    @test norm(C.adjacent_bond_current_pauli_coefficients(onsite)) < 1e-12
    @test norm(C.adjacent_bond_current_pauli_coefficients(zz)) < 1e-12

    # --- exact-conservation boost profile: recorded value + design sequence. ---
    boost = C.solve_boost_profile(tfim; max_support = 5, min_support = 2)
    @test boost[1].support == 2
    @test boost[1].raw_norm ≈ sqrt(6)
    # L=3 reproduces runs/2026-05-31-qubit-candidate-scan/summary.toml:76 exactly.
    @test boost[2].raw_norm ≈ 1.8257418583505538 atol = 1e-12
    @test boost[3].raw_norm ≈ 1.5275252316519468 atol = 1e-12
    @test boost[4].raw_norm ≈ 1.3416407864998736 atol = 1e-12
    @test all(boost[i + 1].raw_norm <= boost[i].raw_norm + 1e-12 for i in 1:3)
    @test all(isapprox(p.metadata[:speed2], -2.0; atol = 1e-9) for p in boost)  # λ=v²=-2

    # bounded speed scan brackets the same optimum.
    boost_scan = C.solve_boost_profile(tfim; max_support = 3, min_support = 2,
        speed2_bounds = (-4.0, 0.0))
    @test boost_scan[2].raw_norm ≈ 1.8257418583505538 atol = 1e-3

    # eps_b^0 is defined only where conservation is exact: requesting the
    # exact-conservation boost profile at an infeasible support fails loud.
    @test_throws ErrorException C.solve_boost_profile(tfim; max_support = 1, min_support = 1)

    # joint profile is defined and nonincreasing for a conservation-failing point.
    generic = C._deterministic_generic_density(1)
    joint = C.solve_joint_poincare_profile(generic; max_support = 4)
    @test all(joint[i + 1].raw_norm <= joint[i].raw_norm + 1e-9 for i in 1:3)
end

@testset "qubit relaxed scan verdicts (CA-64)" begin
    C = CftAnyons
    opts = C.QubitRelaxedGateOptions(max_support = 5)
    mk(nm, h) = C.QubitHamiltonianSample(nm, :probe, Dict{Symbol, Float64}(), h)

    tfim = C.scan_qubit_candidate_relaxed(
        mk("tfim", C.qubit_tfim_density(coupling = 1.0, field = 1.0)); options = opts)
    @test tfim.relaxed_verdict == :queued_gns_scaling
    @test tfim.conservation_exact_support == 2
    @test tfim.current_status == :currentful

    xxz = C.scan_qubit_candidate_relaxed(
        mk("xxz", C.qubit_xxz_density(exchange = 1.0, delta = 0.5)); options = opts)
    heis = C.scan_qubit_candidate_relaxed(
        mk("heis", C.qubit_heisenberg_density(exchange = 1.0)); options = opts)
    @test xxz.relaxed_verdict == :queued_gns_scaling
    @test heis.relaxed_verdict == :queued_gns_scaling

    onsite = C.scan_qubit_candidate_relaxed(
        mk("onsite", C.qubit_onsite_field_density(hx = 1.0)); options = opts)
    zz = C.scan_qubit_candidate_relaxed(
        mk("zz", C.qubit_xyz_density(jz = -1.0)); options = opts)
    @test onsite.relaxed_verdict == :excluded_current_collapsed
    @test zz.relaxed_verdict == :excluded_current_collapsed

    # generic dense bilinear: conservation not exact -> profile verdict, not queued GNS.
    generic = C.scan_qubit_candidate_relaxed(
        mk("generic", C._deterministic_generic_density(1)); options = opts)
    @test generic.conservation_exact_support === nothing
    @test generic.relaxed_verdict in
          (:excluded_conservation_profile, :queued_conservation_profile)

    # serialization row carries the profile tables and the relaxed scope tag.
    row = C.qubit_relaxed_result_row(tfim)
    @test row["scope"] == "relaxed_first_moment_route"
    @test row["relaxed_verdict"] == "queued_gns_scaling"
    @test length(row["boost_profile"]) == 4
    @test row["boost_profile"][2]["raw_norm"] ≈ 1.8257418583505538 atol = 1e-12
end

@testset "qubit fixed-residual GNS-norm SDP (CA-64)" begin
    C = CftAnyons

    # tracial norm and R*R algebra from Pauli coefficients.
    ident = C.identity_residual_terms()
    @test C.tracial_residual_norm_squared(ident) ≈ 1.0
    sq = C.residual_square_terms(ident)
    @test length(sq) == 1 && isempty(only(sq).word.sites)
    @test only(sq).coeff ≈ 1.0 + 0.0im

    zz = zeros(4, 4); zz[4, 4] = 1.0
    zz_res = C.coefficient_residual_terms(zz)
    @test C.tracial_residual_norm_squared(zz_res) ≈ 1.0     # single unit Pauli coefficient

    if RELAXED_MOSEK_OK
        spec1 = C.QubitSDPSpec(psd_window_length = 1)
        # zero residual -> objective 0, normalized 0 (τ = 0 guarded).
        zero_result = C.solve_qubit_residual_norm_sdp(spec1, C.PauliTerm[])
        @test zero_result.status == :solved
        @test zero_result.objective_value ≈ 0.0 atol = 1e-7
        @test zero_result.normalized_value == 0.0
        # identity residual -> ω(I)=1, τ(I*I)=1, normalized objective 1.
        id_result = C.solve_qubit_residual_norm_sdp(spec1, ident)
        @test id_result.status == :solved
        @test id_result.objective_value ≈ 1.0 atol = 1e-7
        @test id_result.normalized_value ≈ 1.0 atol = 1e-7
        # a small nontrivial Mosek instance solves and yields a finite objective.
        spec2 = C.QubitSDPSpec(psd_window_length = 2)
        zz_result = C.solve_qubit_residual_norm_sdp(spec2, zz_res)
        @test zz_result.status == :solved
        @test isfinite(zz_result.objective_value)
        @test 0.0 - 1e-7 <= zz_result.normalized_value
        # a residual whose square spans more sites than the PSD window is still
        # bounded (|omega(P_s)| <= 1 box bounds); without them Mosek reports
        # dual infeasibility (observed as solver_unknown in the first scan run).
        tfim_h = C.qubit_tfim_density(coupling = 1.0, field = 1.0)
        B4 = C.pauli_n_site_coefficients(
            C.boost_relation_local_density(C.pauli_two_site_operator(tfim_h)), 4)
        boost_result = C.solve_qubit_residual_norm_sdp(spec2, C.coefficient_residual_terms(B4))
        @test boost_result.status == :solved
        @test isfinite(boost_result.objective_value)
        @test isfinite(boost_result.normalized_value)
    else
        @test_skip "Mosek unavailable: skipping fixed-residual GNS-norm SDP solves"
    end

    # witness optimization inside the SDP tier is not an SDP: hard error.
    @test_throws ErrorException C.solve_qubit_residual_norm_sdp(
        C.QubitSDPSpec(psd_window_length = 1), ident; method = :alternating)
end

@testset "fibonacci anyonic word algebra and vacuum insertion" begin
    C = CftAnyons
    # Signed Fibonacci with F_0 = 0, F_1 = 1 (F_{2L-1} needs the index 2L-1 >= 1).
    fib(n) = n <= 0 ? 0 : (n == 1 ? 1 : (let a = 0, b = 1
        for _ in 2:n
            a, b = b, a + b
        end
        b
    end))

    # --- (a) enumeration == recurrence, and the closed forms (CA-66 T66.2/T66.3). ---
    for L in 0:6, charge in (:one, :tau)
        enum = C.fibonacci_word_sector_dimension(L, charge)
        m1, mτ = C.fibonacci_word_multiplicity_recurrence(L)
        expected = charge === :one ? m1 : mτ
        @test enum == expected                       # direct enumeration is the oracle
        @test enum == length(C.fibonacci_word_sector_basis(L, charge))
    end

    # multiplicities (m_1, m_τ) = (F_{2L-1}, F_{2L}) for L >= 1; (1, 0) at L = 0.
    @test C.fibonacci_word_multiplicity_recurrence(0) == (1, 0)
    for L in 1:6
        @test C.fibonacci_word_multiplicity_recurrence(L) == (fib(2L - 1), fib(2L))
    end

    # dim H_L = m_1 + m_τ = F_{2L+1} (2L+1 >= 1 for all L >= 0).
    for L in 0:6
        m1, mτ = C.fibonacci_word_multiplicity_recurrence(L)
        @test m1 + mτ == fib(2L + 1)
    end
    # dim A_L = m_1^2 + m_τ^2 = F_{4L-1}; L=0 is the boundary A_0 = 1 (F_{-1}=1,
    # outside the F_0=0, F_1=1 branch of `fib`), so anchor it directly.
    @test (m -> m[1]^2 + m[2]^2)(C.fibonacci_word_multiplicity_recurrence(0)) == 1
    for L in 1:6
        m1, mτ = C.fibonacci_word_multiplicity_recurrence(L)
        @test m1^2 + mτ^2 == fib(4L - 1)
    end
    @test [sum(C.fibonacci_word_multiplicity_recurrence(L)) for L in 2:4] == [5, 13, 34]
    @test [(m -> m[1]^2 + m[2]^2)(C.fibonacci_word_multiplicity_recurrence(L))
           for L in 2:4] == [13, 89, 610]

    # --- (b) O = τ dense-corner recurrence via [[0,1],[1,1]] == CA-09 sequence. ---
    @test C.fibonacci_dense_corner_pairs(7) == [
        (1, 0), (0, 1), (1, 1), (1, 2), (2, 3), (3, 5), (5, 8), (8, 13)]
    @test C.fibonacci_dense_corner_pairs(7) == C.fibonacci_fusion_path_counts(7)

    # --- (c) V isometry per charge block at L = 2. ---
    V1 = C.vacuum_insertion_matrix(2, :one)
    Vτ = C.vacuum_insertion_matrix(2, :tau)
    @test size(V1) == (13, 2)
    @test size(Vτ) == (21, 3)
    for (V, m) in ((V1, 2), (Vτ, 3))
        @test V' * V == Matrix{Int}(I, m, m)         # exact integer isometry
        @test all(==(1), sum(V; dims = 1))           # one 1 per column
        P = V * V'
        @test P == P'                                # self-adjoint
        @test P * P == P                             # idempotent
    end

    # --- (d) occupation covariance: V n_j = n_{2j-1} V and n_{2j} V = 0. ---
    for charge in (:one, :tau)
        V = C.vacuum_insertion_matrix(2, charge)
        for j in 1:2
            nj = C.occupation_number_matrix(2, j, charge)
            n_odd = C.occupation_number_matrix(4, 2j - 1, charge)
            n_even = C.occupation_number_matrix(4, 2j, charge)
            @test V * nj == n_odd * V
            @test all(iszero, n_even * V)
        end
    end

    # --- (e)(i) corrupt {2}->{4} instead of {2}->{3}: covariance must break. ---
    coarse = C.fibonacci_word_sector_basis(2, :tau)
    fine = C.fibonacci_word_sector_basis(4, :tau)
    col = findfirst(b -> b[1] == [2], coarse)
    row = findfirst(b -> b[1] == [4], fine)
    @test col !== nothing && row !== nothing
    Vgood = C.vacuum_insertion_matrix(2, :tau)
    n4 = C.occupation_number_matrix(4, 4, :tau)
    @test all(iszero, n4 * Vgood)                    # correct map: no fine-site-4 weight
    Vc = copy(Vgood)
    Vc[:, col] .= 0
    Vc[row, col] = 1
    @test !(Vc' * Vc == Matrix{Int}(I, 3, 3)) || !all(iszero, n4 * Vc)
    @test !all(iszero, n4 * Vc)                      # the covariance failure, explicitly

    # --- (e)(ii) inadmissible fine path caught by the fail-loud constructor. ---
    good = [:one, :tau]
    @test C._path_admissible([:one, :tau], good)     # empty site keeps charge 1 -> tau
    bad = copy(good)
    bad[1] = :tau                                    # empty site 1 cannot raise 1 -> tau
    @test !C._path_admissible([:one, :tau], bad)
    @test_throws ErrorException C._require_admissible_path([:one, :tau], bad)
    bad[1] = :one                                    # restore -> admissible again
    @test C._path_admissible([:one, :tau], bad)

    # --- fail-loud argument guards. ---
    @test_throws ErrorException C.fibonacci_word_sector_dimension(-1, :one)
    @test_throws ErrorException C.fibonacci_word_sector_dimension(2, :sigma)
    @test_throws ErrorException C.occupation_number_matrix(2, 3, :one)
    @test_throws ErrorException C.vacuum_insertion_matrix(2, :sigma)
end

@testset "refinement placement category (CA-71)" begin
    # Mutation-proof record (AGENTS.md Rule 6; imitates the "(e)(i)/(e)(ii)"
    # mutation notes in the vacuum-insertion testset above). Each mutation was
    # applied to src/RefinementPlacements.jl alone, this testset re-run, RED
    # confirmed (profile below observed verbatim), then reverted:
    #   (a) compose off-by-one (composite slots `psi.slots[phi.slots] .- 1`):
    #       (B) compose value assertion FAILS (slots [2] != [3]); the remaining
    #       (B) composites ERROR in the Placement validator (slot 0); the (E)
    #       functoriality sweep aborts at that validator. 27 pass, 1 fail, 5 error.
    #   (b) `_placement_fine_path` advances the running charge at a vacuum slot
    #       (τ decays to 1 on an idle step): (B') pinned fine-path values FAIL;
    #       (C) CA-68 bridge and (D) isometry sweep ERROR at the module's
    #       fail-loud `_require_admissible_path` guard.
    #   (c) occupied-set map uses `S` instead of `phi.slots[S]`: (C) bridge
    #       ERRORS at the admissibility guard for L = 2, 3 (letters no longer
    #       match the duplicated path; L = 1 survives since slot 2·1-1 = 1 is
    #       fixed) and the (D) sweep aborts at the same guard. 21 pass, 5 error.
    C = CftAnyons
    # Signed Fibonacci F_0 = 0, F_1 = 1 (matches the vacuum-insertion testset).
    fib(n) = n <= 0 ? 0 : (n == 1 ? 1 : (let a = 0, b = 1
        for _ in 2:n
            a, b = b, a + b
        end
        b
    end))
    P(k, l, s) = C.Placement(k, l, s)
    # Cache refinement matrices so the exhaustive sweeps stay fast.
    _cache = Dict{Tuple{Vector{Int},Int,Symbol},Matrix{Int}}()
    mat(phi, ch) = get!(() -> C.placement_refinement_matrix(phi, ch),
                        _cache, (phi.slots, phi.l, ch))
    # All placements with codomain `l` and domain size ≤ kmax, via bitmasks.
    placements(l, kmax) = [P(count_ones(m), l, [s for s in 1:l if (m >> (s - 1)) & 1 == 1])
                           for m in 0:(2^l - 1) if count_ones(m) <= kmax]
    # Violation collector for the exhaustive sweeps: each sweep pushes a short
    # message per counterexample (capped at 8) and asserts the list empty, so a
    # failure prints the offending placements instead of hundreds of red @tests.
    push_violation!(list, msg) = (length(list) < 8 && push!(list, msg); list)

    # --- (A) Placement validator: fail loud on every malformation mode. ---
    @test P(2, 4, [1, 3]).k == 2 && P(2, 4, [1, 3]).l == 4         # well-formed
    @test P(2, 4, [1, 3]).slots == [1, 3]
    @test P(0, 4, Int[]).slots == Int[]                            # empty placement is legal
    @test_throws ErrorException P(3, 5, [1, 2])                    # slot count != k
    @test_throws ErrorException P(2, 5, [3, 1])                    # non-increasing
    @test_throws ErrorException P(2, 5, [2, 2])                    # not strictly increasing
    @test_throws ErrorException P(2, 3, [1, 4])                    # slot above l
    @test_throws ErrorException P(2, 3, [0, 2])                    # slot below 1
    @test_throws ErrorException P(-1, 3, Int[])                    # negative domain

    # --- (B) Composition = relabelling, with a fail-loud arity guard. ---
    @test C.compose(P(2, 4, [1, 3]), P(1, 2, [1])).slots == [1]    # ψ.slots[φ.slots]
    @test C.compose(P(2, 4, [1, 3]), P(1, 2, [2])).slots == [3]
    @test C.compose(P(2, 4, [1, 3]), P(2, 2, [1, 2])) == P(2, 4, [1, 3])  # φ = id
    @test C.compose(P(4, 8, [1, 3, 5, 7]), P(2, 4, [1, 3])) == P(2, 8, [1, 5])
    # associativity: (χ∘ψ)∘φ = χ∘(ψ∘φ).
    let φ = P(1, 2, [2]), ψ = P(2, 4, [1, 3]), χ = P(4, 6, [1, 2, 4, 6])
        @test C.compose(C.compose(χ, ψ), φ) == C.compose(χ, C.compose(ψ, φ))
    end
    @test_throws ErrorException C.compose(P(2, 4, [1, 3]), P(1, 3, [2]))  # ψ.k != φ.l

    # --- (B') fine-path duplication constructor pinned + fail-loud. ---
    @test C._placement_fine_path(P(2, 4, [1, 3]), [:tau, :one]) == [:tau, :tau, :one, :one]
    @test C._placement_fine_path(P(2, 5, [2, 5]), [:tau, :one]) == [:one, :tau, :tau, :tau, :one]
    @test C._placement_fine_path(P(0, 3, Int[]), Symbol[]) == [:one, :one, :one]
    @test_throws ErrorException C._placement_fine_path(P(2, 4, [1, 3]), [:tau])  # wrong length

    # --- (C) Bridge to CA-68: sitewise doubling == vacuum_insertion_matrix. ---
    for L in 1:3, charge in (:one, :tau)
        phi = P(L, 2L, [2j - 1 for j in 1:L])
        @test mat(phi, charge) == C.vacuum_insertion_matrix(L, charge)
    end

    # --- (D) Isometry V'V = I: exhaustive sweep over ALL placements with
    #         k ≤ 3, l ≤ 5, both charges (56 placements; count pinned). ---
    for charge in (:one, :tau)
        swept = 0
        violations = String[]
        for l in 0:5, phi in placements(l, 3)
            swept += 1
            V = mat(phi, charge)
            m = size(V, 2)
            V' * V == Matrix{Int}(I, m, m) ||                      # exact integer isometry
                push_violation!(violations, "V'V != I at slots=$(phi.slots) l=$l")
            all(==(1), sum(V; dims = 1)) ||                        # one 1 per column
                push_violation!(violations, "non-0/1 column at slots=$(phi.slots) l=$l")
        end
        @test swept == 56                    # 1+2+4+8+15+26 placements: sweep is exhaustive
        @test violations == String[]
    end
    # Pinned images at φ = (1 ↦ 2) into l = 2 (bases enumerated by hand):
    # charge one: ([], [:one]) ↦ ([], [:one, :one]), the first fine basis vector;
    # charge tau: ([1], [:tau]) ↦ ([2], [:one, :tau]), the second of three.
    @test mat(P(1, 2, [2]), :one) == reshape([1, 0], 2, 1)
    @test mat(P(1, 2, [2]), :tau) == reshape([0, 1, 0], 3, 1)

    # --- (E) EXACT functoriality V_ψ V_φ == V_{ψ∘φ}: exhaustive composable
    #         sweep k ≤ 2, l ≤ 4, m ≤ 6, both charges (665 pairs; count pinned). ---
    composable = Tuple{C.Placement,C.Placement}[]
    for lval in 0:4, phi in placements(lval, 2), mval in lval:6
        for psi in placements(mval, lval)
            psi.k == lval || continue          # ψ must have domain exactly [lval]
            push!(composable, (psi, phi))
        end
    end
    @test length(composable) == 665            # Σ over k ≤ 2, l ≤ 4, l ≤ m ≤ 6: exhaustive
    for charge in (:one, :tau)
        violations = String[]
        for (psi, phi) in composable
            mat(psi, charge) * mat(phi, charge) == mat(C.compose(psi, phi), charge) ||
                push_violation!(violations,
                    "V_ψV_φ != V_{ψ∘φ} at ψ=$(psi.slots)⊂1:$(psi.l), φ=$(phi.slots)⊂1:$(phi.l)")
        end
        @test violations == String[]
    end
    # Named dyadic chain: two per-cell doublings [2]→[4]→[8] compose to j ↦ 4j-3.
    phi_2_4 = C.uniform_cell_placement(P(1, 2, [1]), 2)            # [2]->[4], slots (1,3)
    psi_4_8 = C.uniform_cell_placement(P(1, 2, [1]), 4)            # [4]->[8], slots (1,3,5,7)
    @test phi_2_4 == P(2, 4, [1, 3])
    @test psi_4_8 == P(4, 8, [1, 3, 5, 7])
    @test C.compose(psi_4_8, phi_2_4) == P(2, 8, [1, 5])           # direct j ↦ 4j-3
    for charge in (:one, :tau)
        @test mat(psi_4_8, charge) * mat(phi_2_4, charge) == mat(P(2, 8, [1, 5]), charge)
    end

    # --- (F) Occupation covariance V n_i^{(k)} == n_{φ(i)}^{(l)} V for all i,
    #         and n_s^{(l)} V == 0 for s off the image: exhaustive sweep over
    #         the same 56 placements (k ≤ 3, l ≤ 5), both charges. ---
    for charge in (:one, :tau)
        covariance_checks = 0
        vanishing_checks = 0
        violations = String[]
        for l in 0:5, phi in placements(l, 3)
            V = mat(phi, charge)
            for i in 1:phi.k
                covariance_checks += 1
                ni = C.occupation_number_matrix(phi.k, i, charge)
                nphi = C.occupation_number_matrix(l, phi.slots[i], charge)
                V * ni == nphi * V ||
                    push_violation!(violations,
                        "covariance fails at slots=$(phi.slots) l=$l i=$i")
            end
            image = Set(phi.slots)
            for s in 1:l
                s in image && continue
                vanishing_checks += 1
                all(iszero, C.occupation_number_matrix(l, s, charge) * V) ||
                    push_violation!(violations, "n_$s V != 0 at slots=$(phi.slots) l=$l")
            end
        end
        @test covariance_checks == 100         # Σ_φ k over the 56 placements
        @test vanishing_checks == 124          # Σ_φ (l - k) over the 56 placements
        @test violations == String[]
    end
    # Direct spot check at φ = (1,2) ↦ (2,4) into l = 4, charge τ.
    let V = mat(P(2, 4, [2, 4]), :tau)
        @test V * C.occupation_number_matrix(2, 1, :tau) ==
              C.occupation_number_matrix(4, 2, :tau) * V
        @test V * C.occupation_number_matrix(2, 2, :tau) ==
              C.occupation_number_matrix(4, 4, :tau) * V
        @test all(iszero, C.occupation_number_matrix(4, 1, :tau) * V)
        @test all(iszero, C.occupation_number_matrix(4, 3, :tau) * V)
    end

    # --- (G) Known dimension values pinned: sizes are (m_c(l), m_c(k)) with
    #         (m_1, m_τ)(L) = (F_{2L-1}, F_{2L}). ---
    @test size(mat(P(2, 4, [1, 3]), :one)) == (13, 2)             # (F_7, F_3)
    @test size(mat(P(2, 4, [1, 3]), :tau)) == (21, 3)             # (F_8, F_4)
    @test size(mat(P(3, 5, [1, 3, 5]), :one)) == (34, 5)          # (F_9, F_5)
    @test size(mat(P(3, 5, [1, 3, 5]), :tau)) == (55, 8)          # (F_10, F_6)
    for (k, l) in ((1, 3), (2, 5), (3, 4)), charge in (:one, :tau)
        idx = charge === :one ? 1 : 2
        phi = P(k, l, collect(1:k))
        @test size(mat(phi, charge)) ==
              (C.fibonacci_word_multiplicity_recurrence(l)[idx],
               C.fibonacci_word_multiplicity_recurrence(k)[idx])
    end
    @test (fib(9), fib(5)) == (34, 5) && (fib(10), fib(6)) == (55, 8)  # anchor `fib`

    # --- (H) Uniform-cell consistency. ---
    @test C.uniform_cell_placement(P(1, 2, [1]), 1) == P(1, 2, [1])   # M = 1 is identity
    @test C.uniform_cell_placement(P(2, 4, [1, 3]), 1) == P(2, 4, [1, 3])
    @test C.uniform_cell_placement(P(1, 2, [1]), 2) == P(2, 4, [1, 3])
    # CA-68 doubling at L=2 tiled twice == sitewise doubling at L=4.
    @test C.uniform_cell_placement(P(2, 4, [1, 3]), 2) == P(4, 8, [1, 3, 5, 7])
    @test C.uniform_cell_placement(P(2, 4, [1, 3]), 2) == P(4, 8, [2j - 1 for j in 1:4])
    @test_throws ErrorException C.uniform_cell_placement(P(1, 2, [1]), 0)  # M ≥ 1

    # --- (I) placement fail-loud argument guards. ---
    @test_throws ErrorException C.placement_refinement_matrix(P(1, 2, [1]), :sigma)
end

@testset "gns descent and corner calculus (CA-72)" begin
    # Mutation-proof record (AGENTS.md Rule 6; each mutation applied to
    # src/GnsCornerCalculus.jl ALONE, this testset re-run, RED confirmed with the
    # profile below observed verbatim, then reverted):
    #   (a) descent_intertwiner scale `1 / sqrt(wP)` -> `1.0` (drop the
    #       ω(P)^{-1/2} normalization): J is no longer a Gram isometry, so the (C)
    #       "gns descent" and (D) "residual descent" collectors go nonempty and the
    #       pinned (C) isometry/defect FAIL (intertwining survives — it is scale
    #       independent). Observed: 36 pass, 4 fail, 0 error.
    #   (b) unital_completion `(I - P)` -> `P`: Φ_χ(I)=2P≠I and the defect carries
    #       the wrong idempotent, so every (E) check FAILS (unitality ×4, GNS-norm
    #       ×2, defect+mixture collector, pinned scalar-defect ×2). 31 pass, 9 fail.
    #   (c) _corner_projection `V * V'` -> `V' * V` (k×k I_{m_c(k)}, not the l×l
    #       rank-m_c(k) projection): the (A) corner sweep hits an l-vs-k
    #       DimensionMismatch outside a @test and aborts the testset. 0 pass, 1 error.
    C = CftAnyons
    P(k, l, s) = C.Placement(k, l, s)
    charges = (:one, :tau)
    mult(k) = C.fibonacci_word_multiplicity_recurrence(k)
    # Deterministic non-symmetric integer block operator on A_k (fixed LCG-free
    # trig hash, as in _deterministic_generic_density): reproducible, seed-indexed.
    dint(seed, n) = [Int(round(6 * sin(seed * (2a + 3b + 1)) + 4 * cos(seed + 2a + 5b)))
                     for a in 1:n, b in 1:n]
    opint(seed, k) = (m = mult(k);
        Dict(:one => dint(seed, m[1]), :tau => dint(seed + 100, m[2])))
    # Deterministic faithful (positive-definite) Hermitian density: M M† + I, normalized.
    function ddens(seed, n)
        M = [complex(0.4 * sin(seed * (3a + 5b + 1)), 0.3 * cos(seed * (2a + 7b + 2)))
             for a in 1:n, b in 1:n]
        H = M * M' + I
        return Matrix{ComplexF64}(H / tr(H))
    end
    # Normalized-trace state ω = Tr/dim_H on A_l: weights ∝ m_c(l), ρ_c = I/m_c(l).
    function tracestate(l)
        m = mult(l); dH = m[1] + m[2]
        return C.BlockState(Dict(:one => m[1] / dH, :tau => m[2] / dH),
            Dict(:one => Matrix{ComplexF64}(I, m[1], m[1]) / m[1],
                 :tau => Matrix{ComplexF64}(I, m[2], m[2]) / m[2]))
    end
    # Deterministic faithful randomized state on A_l.
    function randstate(seed, l)
        m = mult(l)
        a1 = abs(sin(seed * 1.7)) + 0.3; a2 = abs(cos(seed * 2.3)) + 0.2; s = a1 + a2
        return C.BlockState(Dict(:one => a1 / s, :tau => a2 / s),
            Dict(:one => ddens(seed + 1, m[1]), :tau => ddens(seed + 2, m[2])))
    end
    gnorm2(G, v) = real(v' * G * v)                     # squared Gram norm ‖v‖²_G
    eye(n) = Matrix{ComplexF64}(I, n, n)
    ident(k) = (m = mult(k); Dict(:one => eye(m[1]), :tau => eye(m[2])))
    sweep = (P(1, 2, [1]), P(2, 4, [1, 3]), P(2, 5, [2, 4]), P(3, 5, [1, 3, 5]))

    # --- (A) Corner algebra identities (EXACT integer matrices): θ(S†T)=θ(S)†θ(T),
    #         θ(S)(I−P)=0=(I−P)θ(S), P²=P=P†. Full sweep via a violation collector. ---
    violA = String[]
    for phi in sweep, c in charges
        S = opint(10, phi.k); T = opint(15, phi.k)
        StT = Dict(cc => S[cc]' * T[cc] for cc in charges)          # (S†T)_c, integer
        θS = C.corner_morphism(S, phi); θT = C.corner_morphism(T, phi)
        θStT = C.corner_morphism(StT, phi); Pc = C.corner_projection(phi)[c]
        Ic = Matrix{Int}(I, size(Pc, 1), size(Pc, 1))
        θStT[c] == θS[c]' * θT[c] || push!(violA, "θ morphism $(phi.slots) $c")
        all(iszero, θS[c] * (Ic - Pc)) || push!(violA, "θ(S)(I−P) $(phi.slots) $c")
        all(iszero, (Ic - Pc) * θS[c]) || push!(violA, "(I−P)θ(S) $(phi.slots) $c")
        (Pc * Pc == Pc && Pc == Pc') || push!(violA, "P projection $(phi.slots) $c")
    end
    @test violA == String[]                                          # whole EXACT sweep clean
    # Explicit pinned spot at φ = (2,4,[1,3]), both charges.
    let phi = P(2, 4, [1, 3]), S = opint(3, 2), T = opint(8, 2)
        θS = C.corner_morphism(S, phi); θT = C.corner_morphism(T, phi)
        StT = Dict(c => S[c]' * T[c] for c in charges)
        θStT = C.corner_morphism(StT, phi); Pd = C.corner_projection(phi)
        for c in charges
            Ic = Matrix{Int}(I, size(Pd[c], 1), size(Pd[c], 1))
            @test θStT[c] == θS[c]' * θT[c]                          # *-morphism
            @test θS[c] * (Ic - Pd[c]) == zeros(Int, size(Pd[c]))    # kills the complement
            @test Pd[c] * Pd[c] == Pd[c] && Pd[c] == Pd[c]'          # projection
        end
    end

    # --- (B) Regression BY CONSTRUCTION (not a probe): the fine state concentrated
    #         on the corner (ρ_c = V_c e_c V_c', e_c = diag(1,0,…) a rank-1 coarse
    #         projection) has corner_weight = 1 exactly, and its pullback recovers
    #         the coarse state (w_c, e_c) exactly (CA-68 corner-state style). ---
    let phi = P(2, 4, [1, 3]), mk = mult(2)
        ec = Dict(:one => Matrix{ComplexF64}([i == 1 && j == 1 ? 1.0 : 0.0
                                              for i in 1:mk[1], j in 1:mk[1]]),
                  :tau => Matrix{ComplexF64}([i == 1 && j == 1 ? 1.0 : 0.0
                                              for i in 1:mk[2], j in 1:mk[2]]))
        V = Dict(c => C.placement_refinement_matrix(phi, c) for c in charges)
        fine = C.BlockState(Dict(:one => 0.5, :tau => 0.5),
            Dict(c => Matrix{ComplexF64}(V[c] * ec[c] * V[c]') for c in charges))
        @test C.corner_weight(fine, phi) == 1.0                     # corner carries all mass
        pb = C.pullback_state(fine, phi)
        @test pb.weights[:one] == 0.5 && pb.weights[:tau] == 0.5    # coarse weights recovered
        @test pb.densities[:one] == ec[:one]                        # ρ'_c = V'_c ρ_c V_c = e_c
        @test pb.densities[:tau] == ec[:tau]
        @test 2 * (1 - sqrt(C.corner_weight(fine, phi))) == 0.0     # defect formula at cw=1
        @test 1 - C.corner_weight(fine, phi) == 0.0                 # ω((1−P)²)=ω(1−P)=0
    end

    # --- (C) GNS descent for faithful fine states: J†G_l J = G_k (Gram isometry),
    #         J π_k(S) = π_l(θ(S)) J (intertwining), and the vacuum-defect identity
    #         ‖JΩ_k − Ω_l‖²_{G_l} = 2(1 − √corner_weight). Sweep 4 placements × 3
    #         faithful states (trace + two randomized) via a collector. ---
    violC = String[]
    for phi in sweep, ω in (tracestate(phi.l), randstate(3, phi.l), randstate(7, phi.l))
        Gl = C.gns_gram(ω, phi.l)
        ωk = C.pullback_state(ω, phi); Gk = C.gns_gram(ωk, phi.k)
        J = C.descent_intertwiner(ω, phi)
        isapprox(J' * Gl * J, Gk; atol = 1e-10) ||
            push!(violC, "isometry $(phi.slots)")
        for sd in (1, 4)
            S = opint(sd, phi.k)
            isapprox(J * C.gns_left_action(S, phi.k),
                     C.gns_left_action(C.corner_morphism(S, phi), phi.l) * J; atol = 1e-10) ||
                push!(violC, "intertwine $(phi.slots) $sd")
        end
        Ωk = C.gns_cyclic_vector(phi.k); Ωl = C.gns_cyclic_vector(phi.l)
        isapprox(gnorm2(Gl, J * Ωk - Ωl), 2 * (1 - sqrt(C.corner_weight(ω, phi))); atol = 1e-10) ||
            push!(violC, "defect $(phi.slots)")
    end
    @test violC == String[]
    # Pinned high-precision defect: the shard's heart at the dyadic φ = (2,4,[1,3])
    # on the A_4 trace state, where corner_weight = 5/34 (see (F)).
    let phi = P(2, 4, [1, 3]), ω = tracestate(4)
        Gl = C.gns_gram(ω, phi.l); J = C.descent_intertwiner(ω, phi)
        Ωk = C.gns_cyclic_vector(phi.k); Ωl = C.gns_cyclic_vector(phi.l)
        @test isapprox(gnorm2(Gl, J * Ωk - Ωl), 2 * (1 - sqrt(5 / 34)); atol = 1e-12)
        Gk = C.gns_gram(C.pullback_state(ω, phi), phi.k)
        @test isapprox(J' * Gl * J, Gk; atol = 1e-12)               # exact Gram isometry
        S = opint(2, phi.k)
        @test isapprox(J * C.gns_left_action(S, phi.k),
                       C.gns_left_action(C.corner_morphism(S, phi), phi.l) * J; atol = 1e-12)
    end

    # --- (D) Residual descent norm identity: ‖π_k(R')[T]_k‖ = ‖π_l(θ(R')) J [T]_k‖
    #         (intertwining + isometry) for random R' ∈ A_k, faithful ω, several T. ---
    violD = String[]
    for phi in (P(2, 4, [1, 3]), P(2, 5, [2, 4]), P(3, 5, [1, 3, 5]))
        ω = randstate(11, phi.l)
        Gl = C.gns_gram(ω, phi.l); Gk = C.gns_gram(C.pullback_state(ω, phi), phi.k)
        J = C.descent_intertwiner(ω, phi)
        Rp = opint(22, phi.k)
        πkR = C.gns_left_action(Rp, phi.k)
        πlθR = C.gns_left_action(C.corner_morphism(Rp, phi), phi.l)
        for td in (1, 2, 3)
            vk = C.gns_coordinates(opint(td, phi.k), phi.k)
            isapprox(gnorm2(Gk, πkR * vk), gnorm2(Gl, πlθR * J * vk); atol = 1e-8) ||
                push!(violD, "residual $(phi.slots) $td")
        end
    end
    @test violD == String[]
    # Trivial pinned instance: θ(0) = 0 ⇒ π_k(0) = 0 (both sides of (D) vanish).
    let phi = P(2, 4, [1, 3]), mk = mult(2),
        Z = Dict(:one => zeros(ComplexF64, mk[1], mk[1]),
                 :tau => zeros(ComplexF64, mk[2], mk[2]))
        @test all(iszero, C.corner_morphism(Z, phi)[:tau])
        @test all(iszero, C.gns_left_action(Z, phi.k))
    end

    # --- (E) Unital completion Φ_χ(T) = θ(T) + χ(T)(1−P): Φ_χ(I_k)=I_l; exact
    #         defect Φ_χ(ST)−Φ_χ(S)Φ_χ(T) = (χ(ST)−χ(S)χ(T))(I−P); GNS-norm
    #         ω_l(M†M)=|χ(ST)−χ(S)χ(T)|²ω_l(I−P); mixture ω_l∘Φ_χ = cw·ω_k+(1−cw)·χ. ---
    let phi = P(2, 4, [1, 3])
        Ik = ident(phi.k); Il = ident(phi.l); Pd = C.corner_projection(phi)
        ml = mult(phi.l)
        ImP = Dict(c => eye(ml[i]) - Pd[c] for (i, c) in enumerate(charges))
        ω = randstate(9, phi.l); cw = C.corner_weight(ω, phi); ωk = C.pullback_state(ω, phi)
        S = opint(2, phi.k); T = opint(7, phi.k); ST = Dict(c => S[c] * T[c] for c in charges)
        violE = String[]
        for χ in (tracestate(2), randstate(5, 2))
            ΦI = C.unital_completion(Ik, χ, phi)
            for c in charges
                @test isapprox(ΦI[c], Il[c]; atol = 1e-10)          # unital: Φ_χ(I_k)=I_l
            end
            λ = C.state_expectation(χ, ST) -
                C.state_expectation(χ, S) * C.state_expectation(χ, T)
            ΦST = C.unital_completion(ST, χ, phi)
            ΦS = C.unital_completion(S, χ, phi); ΦT = C.unital_completion(T, χ, phi)
            M = Dict(c => ΦST[c] - ΦS[c] * ΦT[c] for c in charges)
            for c in charges                                        # EXACT defect identity
                isapprox(M[c], λ * ImP[c]; atol = 1e-10) ||
                    push!(violE, "defect $c")
            end
            MdM = Dict(c => M[c]' * M[c] for c in charges)          # GNS-norm equality
            @test isapprox(real(C.state_expectation(ω, MdM)),
                           abs2(λ) * real(C.state_expectation(ω, ImP)); atol = 1e-9)
            for td in (1, 3, 5)                                     # pullback mixture
                Tt = opint(td, phi.k)
                isapprox(C.state_expectation(ω, C.unital_completion(Tt, χ, phi)),
                         cw * C.state_expectation(ωk, Tt) +
                         (1 - cw) * C.state_expectation(χ, Tt); atol = 1e-9) ||
                    push!(violE, "mixture $td")
            end
        end
        @test violE == String[]
        # Pinned scalar-defect identity at χ = coarse trace state, both charges.
        let χ = tracestate(2)
            λ = C.state_expectation(χ, ST) -
                C.state_expectation(χ, S) * C.state_expectation(χ, T)
            ΦST = C.unital_completion(ST, χ, phi)
            ΦS = C.unital_completion(S, χ, phi); ΦT = C.unital_completion(T, χ, phi)
            for c in charges
                @test isapprox(ΦST[c] - ΦS[c] * ΦT[c], λ * ImP[c]; atol = 1e-10)
            end
        end
    end

    # --- (F) Pinned concrete corner weight. DERIVATION: for a proper state (weights
    #         sum to 1, trace-1 densities — enforced by the BlockState validator) the
    #         "trace state ω = Tr/dim_H" over A_4 = M_13 ⊕ M_21 is w_c = m_c(4)/dim_H,
    #         ρ_c = I/m_c(4) with dim_H = m_1(4)+m_τ(4) = 13+21 = 34. For φ = (2,4,[1,3])
    #         rank(P_c) = m_c(2) = (F_3, F_4) = (2, 3), so
    #           corner_weight = Σ_c w_c tr(ρ_c P_c) = Σ_c (m_c(4)/34)(m_c(2)/m_c(4))
    #                         = Σ_c m_c(2)/34 = (2+3)/34 = 5//34 = Tr_{H_4}(P)/dim H_4.
    #         (The spec sketch 1/122 = 5/610 divides by dim A_4 = Σ m_c(4)² = 610, i.e.
    #         Tr(P)/dim A — that ω has ω(I)=34/610≠1, is NOT a state, and is rejected
    #         by the BlockState validator; the state-normalized value is 5//34.)
    let phi = P(2, 4, [1, 3]), cw = C.corner_weight(tracestate(4), phi)
        @test isapprox(cw, 5 // 34; atol = 1e-12)                   # exact rational, verified
        @test isapprox(cw, (2 + 3) / (13 + 21); atol = 1e-12)      # Tr(P)/dim H_4
        @test isapprox(cw * 34, 5.0; atol = 1e-10)
    end

    # --- (H) GNS correctness invariants (independent of the corner data): the GNS
    #         space has dim A_k = Σ_c m_c(k)² = F_{4k-1}; Ω is normalized and cyclic;
    #         π is a *-representation with ⟨Ω, π(T)Ω⟩_G = ω(T) = state_expectation. ---
    @test [length(C.gns_cyclic_vector(k)) for k in 1:3] == [2, 13, 89]  # Σ m_c(k)² = F_{4k-1}
    let ω = randstate(4, 3), T = opint(6, 3), S = opint(9, 3)
        G = C.gns_gram(ω, 3); Ω = C.gns_cyclic_vector(3)
        πT = C.gns_left_action(T, 3); πS = C.gns_left_action(S, 3)
        ST = Dict(c => S[c] * T[c] for c in charges)
        @test isapprox(πS * πT, C.gns_left_action(ST, 3); atol = 1e-12)  # π(ST)=π(S)π(T)
        @test isapprox(πT * Ω, C.gns_coordinates(T, 3); atol = 1e-12)    # π(T)Ω = [T]
        @test isapprox(Ω' * G * (πT * Ω), C.state_expectation(ω, T); atol = 1e-12)  # ⟨Ω,π(T)Ω⟩=ω(T)
        @test isapprox(real(Ω' * G * Ω), 1.0; atol = 1e-12)             # ⟨Ω,Ω⟩=ω(I)=1
    end

    # --- (G) Fail-loud guards on the state / descent constructors. ---
    @test_throws ErrorException C.BlockState(Dict(:one => 0.5, :tau => 0.4),
        Dict(:one => eye(1), :tau => eye(1)))                       # weights ≠ 1
    @test_throws ErrorException C.BlockState(Dict(:one => 0.5, :tau => 0.5),
        Dict(:one => ComplexF64[2.0;;], :tau => eye(1)))           # trace ≠ 1
    @test_throws ErrorException C.BlockState(Dict(:one => 0.5, :tau => 0.5),
        Dict(:one => ComplexF64[0.5 2.0; 0.0 0.5], :tau => eye(1)))  # non-Hermitian
end

@testset "categorical residual set (CA-73)" begin
    # Mutation-proof record (AGENTS.md Rule 6; each mutation applied to the named
    # src file ALONE, this testset re-run STANDALONE, RED confirmed with the
    # profile below observed verbatim, then reverted):
    #   (a) fibonacci_f_matrix [2,2] sign −φ⁻¹ → +φ⁻¹ (FibonacciLocalOperators.jl):
    #       the F involution/det pins, the (C) dense-corner braid, and the (H) L=4
    #       dilute-dimension pin FAIL. 238 pass, 24 fail.
    #   (b) hop_blocks amplitude 1 → 2 (FibonacciLocalOperators.jl): the (C) hop²
    #       idempotent pin and the (H) dilute dimension FAIL. 242 pass, 20 fail.
    #   (c) pair_creation_blocks raw-cup weight √φ → 1 (FibonacciLocalOperators.jl):
    #       the (C) dilute relation u_i = b_i^t b_i FAILS. 243 pass, 19 fail.
    #   (d) coboundary_bond sign − → + (CategoricalResiduals.jl): the (F)
    #       coboundary-distance pins (pinv + independent QR, pure hopping) FAIL.
    #       260 pass, 2 fail.
    C = CftAnyons
    charges = (:one, :tau)
    φ = C.golden_ratio()
    emb(op, j, L, c) = C.local_two_site_matrix(op, j, L, c)
    hop = C.hop_blocks(); pair = C.pair_blocks(); ee = C.dense_e_blocks()
    nl = C.occupancy_blocks(:left); nr = C.occupancy_blocks(:right)
    bcre = C.pair_creation_blocks(); bann = C.pair_annihilation_blocks()

    # --- F-matrix anchor: Trebst eq. 2.4, unitary gauge (CONVENTIONS (b)). ---
    F = C.fibonacci_f_matrix()
    @test isapprox(F, [1/φ 1/sqrt(φ); 1/sqrt(φ) -1/φ]; atol = 1e-14)  # exact entries
    @test isapprox(F, F'; atol = 1e-14)                    # Hermitian (unitary gauge)
    @test isapprox(F * F, Matrix{Float64}(I, 2, 2); atol = 1e-14)  # involution F=F⁻¹
    @test isapprox(det(F), -1.0; atol = 1e-12)             # eigenvalues ±1

    # --- (B) occupancy cross-check vs independent occupation_number_matrix. ---
    for L in 2:5, c in charges
        for j in 1:(L - 1)
            @test isapprox(emb(nl, j, L, c),
                Matrix(C.occupation_number_matrix(L, j, c)); atol = 1e-12)
        end
        @test isapprox(emb(nr, L - 1, L, c),
            Matrix(C.occupation_number_matrix(L, L, c)); atol = 1e-12)
    end

    # --- (A) Disjoint commutation [op_j, op'_k] = 0 for |j-k| >= 2. ---
    violA = String[]
    for L in (4, 5), c in charges
        ops = ("hop" => hop, "pair" => pair, "e" => ee, "nl" => nl)
        for (na, oa) in ops, (nb, ob) in ops, j in 1:(L - 1), k in 1:(L - 1)
            abs(j - k) >= 2 || continue
            A = emb(oa, j, L, c); B = emb(ob, k, L, c)
            isapprox(A * B, B * A; atol = 1e-10) ||
                push!(violA, "[$na$j,$nb$k] L=$L $c")
        end
    end
    @test violA == String[]

    # --- (C) Algebra relations with anchors. ---
    for L in 2:5, c in charges
        for j in 1:(L - 1)
            E = emb(ee, j, L, c)
            @test isapprox(E * E, φ * E; atol = 1e-10)         # e² = φe (raw cup, CONV (r))
            @test isapprox(E, E'; atol = 1e-12)                # e_j hermitian
            H = emb(hop, j, L, c)
            @test isapprox(H, H'; atol = 1e-12)                # hop_j hermitian
            @test isapprox(emb(pair, j, L, c), emb(pair, j, L, c)'; atol = 1e-12)
            # dilute u_i = b_i^t b_i  (source Dtl_pgl_ell.06.tex:773)
            @test isapprox(E, emb(bcre, j, L, c) * emb(bann, j, L, c); atol = 1e-10)
            H2 = H * H                                          # hop² idempotent ⇒ amplitude 1
            @test isapprox(H2 * H2, H2; atol = 1e-10)
        end
    end
    # Dense TL braid e_j e_{j±1} e_j = e_j on the fully-occupied corner
    # (CA-69 dense corner π_A dTL π_A ≅ TL_{|A|}, Dtl_pgl_ell.06.tex:891-895;
    #  u_1 u_2 u_1 = u_1 stated at :2014).
    for L in 3:5, c in charges
        Pd = C.dense_corner_projector(L, c)
        keep = [i for i in 1:size(Pd, 1) if Pd[i, i] == 1]
        es = [emb(ee, j, L, c)[keep, keep] for j in 1:(L - 1)]
        for j in 1:(L - 2)
            @test isapprox(es[j] * es[j + 1] * es[j], es[j]; atol = 1e-8)
            @test isapprox(es[j + 1] * es[j] * es[j + 1], es[j + 1]; atol = 1e-8)
        end
    end
    # Dilute e_i + x_i = id: occupied/vacancy projectors complementary and
    # orthogonal (source Dtl_pgl_ell.06.tex:773).
    for L in 2:4, c in charges, j in 1:(L - 1)
        ei = emb(nl, j, L, c); Ic = Matrix{Float64}(I, size(ei)...); xi = Ic - ei
        @test isapprox(ei + xi, Ic; atol = 1e-12)          # e_i + x_i = id
        @test isapprox(ei * ei, ei; atol = 1e-12)          # occupied projector
        @test isapprox(ei * xi, zero(ei); atol = 1e-12)    # orthogonal e_i x_i = 0
    end

    # --- (D) Parity: every Tier-1 generator commutes with (-1)^N (CA-69 parity
    #         ideal, source Dtl_pgl_ell.06.tex:775-776). ---
    violD = String[]
    for L in 2:5, c in charges
        Par = Matrix(C.occupation_parity_matrix(L, c))
        for (na, op) in ("hop" => hop, "pair" => pair, "e" => ee, "nl" => nl, "bcre" => bcre)
            for j in 1:(L - 1)
                M = emb(op, j, L, c)
                isapprox(M * Par, Par * M; atol = 1e-10) || push!(violD, "$na$j L=$L $c")
            end
        end
    end
    @test violD == String[]
    for L in 2:4, c in charges                              # (-1)^N == ∏_j (I - 2 n_j)
        Par = Matrix(C.occupation_parity_matrix(L, c))
        P2 = Matrix{Float64}(I, size(Par)...)
        for j in 1:L
            P2 = P2 * (Matrix{Float64}(I, size(Par)...) - 2 * Matrix(C.occupation_number_matrix(L, j, c)))
        end
        @test isapprox(Par, P2; atol = 1e-12)
    end

    # --- (E) Residual densities: self-adjoint, chain Hamiltonian = Σ bonds. ---
    hmix = Dict(:one => ee[:one] + 0.3 * pair[:one] + 0.2 * nl[:one],
                :tau => 0.5 * hop[:tau] + 0.2 * nl[:tau])
    for c in charges
        H = C.chain_hamiltonian(hmix, 6, c)
        @test isapprox(H, H'; atol = 1e-12)
        @test isapprox(H, sum(emb(hmix, j, 6, c) for j in 1:5); atol = 1e-12)
        p = C.momentum_density(hmix, 2, 6, c); @test isapprox(p, p'; atol = 1e-12)
        A = C.conservation_density(hmix, 2, 6, c); @test isapprox(A, A'; atol = 1e-12)
        B = C.boost_density(hmix, 2, 6, c); @test isapprox(B, B'; atol = 1e-12)
    end
    @test_throws ErrorException C.momentum_density(hmix, 5, 6, :tau)   # bond j+1 missing
    @test_throws ErrorException C.boost_density(hmix, 4, 6, :tau)      # bond j+2 missing

    # --- (F) Coboundary distance. Pure hopping conserves momentum: its
    #         conservation residual A_j is a coboundary (distance ≈ 0), verified
    #         by TWO independent paths (pinv in the function; QR here). ---
    A2hop = C.conservation_density(hop, 2, 6, :tau)
    d_pinv = C.coboundary_distance(A2hop, 2, 6, :tau)
    function _cob_qr(R, L, c; window = 2:(L - 3))
        cols = Vector{ComplexF64}[]
        for u in C._two_site_operator_basis(), j in window
            push!(cols, ComplexF64.(vec(C.coboundary_bond(u, j, L, c))))
        end
        W = reduce(hcat, cols); Q = Matrix(qr(W).Q)[:, 1:rank(W; atol = 1e-9)]
        r = ComplexF64.(vec(R)); return norm(r - Q * (Q' * r))
    end
    @test d_pinv < 1e-9                                     # pinv path: A_j is a coboundary
    @test _cob_qr(A2hop, 6, :tau) < 1e-9                    # independent QR path agrees
    # A generic density does NOT conserve momentum: its conservation residual is
    # far from a coboundary (qualitative; the exact value is ill-conditioned —
    # the CA-64 singular-KKT phenomenon — so it is not pinned to 12 digits here).
    Amix = C.conservation_density(hmix, 2, 6, :tau)
    @test C.coboundary_distance(Amix, 2, 6, :tau) > 1.0
    @test_throws ErrorException C.coboundary_distance(Amix, 3, 6, :tau)  # only support-2

    # --- (G) Open-window mode identity (report Lemma :100-110): the bulk
    #         telescopes and only the top-edge current p_b survives. Pinned
    #         nontrivial number: the edge-current Frobenius norm. ---
    defect, edge = C.mode_identity_edge_defect(hmix, 1, 2, 6, :tau, 2:4)
    @test isapprox(defect, edge; atol = 1e-10)             # STRONG locality: Δ == edge term
    @test norm(edge) > 1.0                                 # edge term is nontrivial
    @test isapprox(norm(edge), 8.844380606115058; atol = 1e-9)  # pinned (well-conditioned)
    d2, e2 = C.mode_identity_edge_defect(hmix, 2, 3, 6, :one, 1:3)
    @test isapprox(d2, e2; atol = 1e-10)                   # off-window m,n telescope too

    # --- Transport through the CA-72 corner morphism (Lemma 73.1). ---
    phi = C.dyadic_placement(3)                            # dyadic φ(j)=2j-1, [3]->[6]
    θp, built = C.transported_momentum(hmix, 1, 3, phi)
    for c in charges
        @test isapprox(θp[c], built[c]; atol = 1e-10)      # θ(p_j) = i[θh_j, θh_{j+1}]
    end
    # θ(i[H_k, T]) == i[θ(H_k), θ(T)] (θ a *-morphism transports the calculus).
    Hk = Dict(c => ComplexF64.(C.chain_hamiltonian(hmix, 3, c)) for c in charges)
    T = Dict(c => ComplexF64.(emb(nl, 1, 3, c)) for c in charges)
    comm = Dict(c => im * (Hk[c] * T[c] - T[c] * Hk[c]) for c in charges)
    θcomm = C.corner_morphism(comm, phi)
    θH = C.corner_morphism(Hk, phi); θT = C.corner_morphism(T, phi)
    for c in charges
        @test isapprox(θcomm[c], im * (θH[c] * θT[c] - θT[c] * θH[c]); atol = 1e-10)
    end
    # Stretched support: θ(h_1) lives on fine sites {1,2,3}; the inserted site 2
    # is vacuum (n_2 θ(h_1) = 0, CA-71 n_even V = 0) and it commutes with far n_k.
    θh1 = C.corner_morphism(C._hbond_block(hmix, 1, 3), phi)
    for c in charges
        n2 = Matrix(C.occupation_number_matrix(6, 2, c))
        @test isapprox(n2 * θh1[c], zero(θh1[c]); atol = 1e-12)   # middle-site vacuum pin
        @test isapprox(θh1[c] * n2, zero(θh1[c]); atol = 1e-12)
        for k in (4, 5, 6)
            nk = Matrix(C.occupation_number_matrix(6, k, c))
            @test isapprox(nk * θh1[c], θh1[c] * nk; atol = 1e-10)  # supported off site k
        end
    end

    # --- (H) THE DECISIVE BLOCK: dilute image vs parity-even vs M_{2L}. ---
    @test C.dilute_image_dimension(2) == 9                  # CA-69, report 69:96
    @test C.dilute_image_dimension(3) == 51
    @test C.parity_even_dimension(2) == 9
    @test C.parity_even_dimension(3) == 51
    d4 = C.dilute_image_dimension(4)
    pe4 = C.parity_even_dimension(4)
    @test d4 == 322                                        # computed W1.4 datum
    @test pe4 == 322                                       # image == parity-even subalgebra
    @test d4 < 323                                         # dim dTL_4 = M_8 = 323 ⇒ 1-dim kernel
    @test 323 - d4 == 1                                    # first Jones-Wenzl kernel at L=4
end

@testset "jones-wenzl kernel decision (CA-74)" begin
    # Mutation-proof record (AGENTS.md Rule 6; each mutation applied to
    # src/JonesWenzlKernel.jl ALONE, this testset re-run STANDALONE, RED
    # confirmed, then reverted):
    #   (i) Wenzl coefficient [3] -> [3] + 0.01: idempotence,
    #       annihilation, and p4-zero checks FAIL. 99 pass, 14 fail.
    #   (ii) beta = phi -> phi + 1e-3 inside recursion quantum integers only:
    #        idempotence, annihilation, and p4-zero checks FAIL.
    #        88 pass, 25 fail.
    #   (iii) corner unit drops one occupancy factor: Pi_A, dense-corner braid,
    #        and p4-zero checks FAIL. 105 pass, 8 fail.
    C = CftAnyons
    charges = (:one, :tau)
    phi = C.golden_ratio()

    # Corner unit Pi_A: product of all occupancy projectors.  The trace pins the
    # dense Fibonacci path counts for four occupied tau sites: (2,3).
    Pi4 = C.corner_unit(4)
    for c in charges
        @test isapprox(Pi4[c], Matrix(C.dense_corner_projector(4, c)); atol = 1e-12)
        @test isapprox(Pi4[c] * Pi4[c], Pi4[c]; atol = 1e-12)
        @test isapprox(Pi4[c], Pi4[c]'; atol = 1e-12)
    end
    @test isapprox(tr(Pi4[:one]), 2.0; atol = 1e-12)
    @test isapprox(tr(Pi4[:tau]), 3.0; atol = 1e-12)

    # Dense-corner TL generators E_j = Pi_A e_j Pi_A.  The braid relation is
    # asserted only in this corner (CA-73 friction note).
    Es4 = C.dense_corner_tl_generators(4)
    for c in charges, j in 1:3
        @test isapprox(Es4[j][c], Pi4[c] * Es4[j][c] * Pi4[c]; atol = 1e-12)
        @test isapprox(Es4[j][c] * Es4[j][c], phi * Es4[j][c]; atol = 1e-10)
        @test isapprox(Es4[j][c], Es4[j][c]'; atol = 1e-12)
    end
    for c in charges, j in 1:2
        @test isapprox(Es4[j][c] * Es4[j + 1][c] * Es4[j][c], Es4[j][c]; atol = 1e-8)
        @test isapprox(Es4[j + 1][c] * Es4[j][c] * Es4[j + 1][c], Es4[j + 1][c]; atol = 1e-8)
    end
    for c in charges
        @test isapprox(Es4[1][c] * Es4[3][c], Es4[3][c] * Es4[1][c]; atol = 1e-12)
    end

    # Quantum integers at beta = phi.  [5] = 0 is the negligibility scalar.
    qints = C.jw_quantum_integers(5)
    @test isapprox(qints[1:5], [1.0, phi, phi^2 - 1, phi^3 - 2phi, 0.0]; atol = 1e-14)
    @test abs(phi * qints[4] - qints[3]) <= 1e-14

    # Defining JW properties: idempotent, self-adjoint, killed on both sides by
    # E_j for j < k, and formal coefficient 1 on the corner-unit word.
    for k in 2:4
        p = C.jones_wenzl_projector(k, k)
        Es = C.dense_corner_tl_generators(k)
        Pi = C.corner_unit(k)
        @test C.unit_word_coefficient(p) == 1.0
        @test C.nonunit_words_contain_generator(p)
        @test length(p.expansion) > 1
        for c in charges
            @test isapprox(Pi[c] * p.blocks[c], p.blocks[c]; atol = 1e-12)
            @test isapprox(p.blocks[c] * Pi[c], p.blocks[c]; atol = 1e-12)
            @test isapprox(p.blocks[c] * p.blocks[c], p.blocks[c]; atol = 1e-10)
            @test isapprox(p.blocks[c], p.blocks[c]'; atol = 1e-12)
        end
        for j in 1:(k - 1), c in charges
            @test norm(Es[j][c] * p.blocks[c]) <= 1e-10
            @test norm(p.blocks[c] * Es[j][c]) <= 1e-10
        end
    end

    # Decision computations: p2 and p3 survive, while p4 is zero under rho_4.
    p2 = C.jones_wenzl_projector(2, 2)
    p3 = C.jones_wenzl_projector(3, 3)
    p4 = C.jones_wenzl_projector(4, 4)
    @test C.block_opnorm(p2.blocks) > 0.1
    @test C.block_opnorm(p3.blocks) > 0.1
    @test isapprox(C.block_opnorm(p2.blocks), 1.0; atol = 1e-12)
    @test isapprox(C.block_opnorm(p3.blocks), 1.0; atol = 1e-12)
    @test C.block_opnorm(p4.blocks) <= 1e-12
    @test C.block_frobenius_norm(p4.blocks) <= 1e-12

    # CA-73 cross-checks reused, not forked.
    @test C.dilute_image_dimension(4) == 322
    @test C.parity_even_dimension(4) == 322

    # Parity-refined multiplicities by pure path counting.  L=4 assignment:
    # charge 1 is even/odd 9/4; charge tau is even/odd 9/12.
    expected_counts = Dict(
        2 => Dict(:one => (even = 2, odd = 0), :tau => (even = 1, odd = 2)),
        3 => Dict(:one => (even = 4, odd = 1), :tau => (even = 3, odd = 5)),
        4 => Dict(:one => (even = 9, odd = 4), :tau => (even = 9, odd = 12)),
        5 => Dict(:one => (even = 21, odd = 13), :tau => (even = 25, odd = 30)),
    )
    for L in 2:5
        @test C.parity_refined_multiplicities(L) == expected_counts[L]
    end
    @test [C.parity_even_dimension_from_counts(L) for L in 2:4] == [9, 51, 322]
    @test [C.parity_even_dimension(L) for L in 2:4] == [9, 51, 322]
    @test C.parity_even_dimension_from_counts(5) == 2135

    # Rank-nullity conclusion: rank rho_4 = 322, dim dTL_4 = M_8 = 323
    # (CA-69), rho(iota(p4)) = 0, and iota(p4) is nonzero before quotienting
    # because the formal corner-unit diagram coefficient is 1.
    @test 322 + 1 == 323
    @test C.block_opnorm(p4.blocks) <= 1e-12
    @test C.unit_word_coefficient(p4) == 1.0
end
