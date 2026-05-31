struct QubitCandidateScanOptions
    run_sdp::Bool
    psd_window_length::Int
    relation_window_length::Int
    atol::Float64
end

QubitCandidateScanOptions(; run_sdp::Bool = false, psd_window_length::Integer = 2,
    relation_window_length::Integer = 0, atol::Real = 1e-9) =
    QubitCandidateScanOptions(run_sdp, Int(psd_window_length), Int(relation_window_length), Float64(atol))

struct QubitCandidateScanResult
    sample::QubitHamiltonianSample
    current_status::Symbol
    current_norm::Float64
    conservation_feasible::Bool
    conservation_residual_norm::Float64
    boost_feasible::Bool
    boost_nontrivial_speed::Bool
    boost_residual_norm::Float64
    speed2::Float64
    scalar_shift::Float64
    sdp_status::Union{Nothing, Symbol}
    verdict::Symbol
end

function scan_qubit_candidate(sample::QubitHamiltonianSample;
        options::QubitCandidateScanOptions = QubitCandidateScanOptions())
    h = sample.coefficients
    current_norm = norm(adjacent_bond_current_pauli_coefficients(h))
    current_status = current_norm <= options.atol ? :current_collapsed : :currentful
    if current_status == :current_collapsed
        return QubitCandidateScanResult(
            sample, current_status, current_norm, false, NaN, false, false, NaN, NaN, NaN, nothing,
            :excluded_current_collapsed,
        )
    end

    conservation = solve_conservation_witness(h; atol = options.atol)
    if !conservation.feasible
        return QubitCandidateScanResult(
            sample, current_status, current_norm, false, conservation.residual_norm, false, false,
            NaN, NaN, NaN, nothing, :excluded_no_conservation_witness,
        )
    end

    boost = solve_boost_witness(h, conservation.u; atol = options.atol)
    scalar_shift = boost.feasible && abs(boost.speed2) > options.atol ?
        boost.scalar_speed_shift / boost.speed2 : NaN
    if !boost.feasible
        return QubitCandidateScanResult(
            sample, current_status, current_norm, true, conservation.residual_norm, false, false,
            boost.residual_norm, boost.speed2, scalar_shift, nothing, :excluded_no_boost_witness,
        )
    end
    if !boost.nontrivial_speed
        return QubitCandidateScanResult(
            sample, current_status, current_norm, true, conservation.residual_norm, true, false,
            boost.residual_norm, boost.speed2, scalar_shift, nothing, :excluded_zero_speed,
        )
    end

    sdp_status = nothing
    verdict = :not_excluded_algebraic
    if options.run_sdp
        residuals = [
            conservation_residual_terms(h; u = conservation.u),
            boost_residual_terms(h; u = conservation.u, w = boost.w,
                speed2 = boost.speed2, scalar_shift),
        ]
        spec = QubitSDPSpec(
            psd_window_length = options.psd_window_length,
            relation_window_length = options.relation_window_length,
            residuals = residuals,
        )
        sdp_status = solve_qubit_sdp(spec).status
        verdict =
            sdp_status == :excluded ? :excluded_by_sdp :
            sdp_status == :not_excluded_at_level ? :not_excluded_at_level :
            :solver_unknown
    end

    return QubitCandidateScanResult(
        sample, current_status, current_norm, true, conservation.residual_norm, true, true,
        boost.residual_norm, boost.speed2, scalar_shift, sdp_status, verdict,
    )
end

scan_qubit_candidates(samples; options::QubitCandidateScanOptions = QubitCandidateScanOptions()) =
    [scan_qubit_candidate(sample; options) for sample in samples]

function qubit_scan_terminal_gate(result::QubitCandidateScanResult)
    result.verdict == :excluded_current_collapsed && return :current
    result.verdict == :excluded_no_conservation_witness && return :conservation
    result.verdict in (:excluded_no_boost_witness, :excluded_zero_speed) && return :boost
    result.verdict in (:excluded_by_sdp, :not_excluded_at_level, :solver_unknown) && return :sdp
    return :algebraic
end

function summarize_qubit_scan(results)
    by_verdict = Dict{Symbol, Int}()
    by_family = Dict{Symbol, Dict{Symbol, Int}}()
    for result in results
        by_verdict[result.verdict] = get(by_verdict, result.verdict, 0) + 1
        family_counts = get!(by_family, result.sample.family, Dict{Symbol, Int}())
        family_counts[result.verdict] = get(family_counts, result.verdict, 0) + 1
    end
    return (total = length(results), by_verdict = by_verdict, by_family = by_family)
end

function _finite_or_string(value)
    value isa Real || return value
    return isfinite(value) ? value : string(value)
end

function qubit_scan_result_row(result::QubitCandidateScanResult)
    return Dict(
        "name" => result.sample.name,
        "family" => string(result.sample.family),
        "source_kind" => string(qubit_sample_source_kind(result.sample)),
        "verdict" => string(result.verdict),
        "terminal_gate" => string(qubit_scan_terminal_gate(result)),
        "scope" => "fixed_first_moment_route",
        "coefficients" => [collect(result.sample.coefficients[row, :]) for row in 1:4],
        "current_status" => string(result.current_status),
        "current_norm" => _finite_or_string(result.current_norm),
        "conservation_feasible" => result.conservation_feasible,
        "conservation_residual_norm" => _finite_or_string(result.conservation_residual_norm),
        "boost_feasible" => result.boost_feasible,
        "boost_nontrivial_speed" => result.boost_nontrivial_speed,
        "boost_residual_norm" => _finite_or_string(result.boost_residual_norm),
        "speed2" => _finite_or_string(result.speed2),
        "scalar_shift" => _finite_or_string(result.scalar_shift),
        "sdp_status" => result.sdp_status === nothing ? "not_run" : string(result.sdp_status),
        "parameters" => Dict(string(k) => v for (k, v) in result.sample.parameters),
    )
end

function qubit_scan_summary_table(results)
    summary = summarize_qubit_scan(results)
    return Dict(
        "total" => summary.total,
        "by_verdict" => Dict(string(k) => v for (k, v) in summary.by_verdict),
        "by_family" => Dict(
            string(family) => Dict(string(verdict) => count for (verdict, count) in counts)
            for (family, counts) in summary.by_family
        ),
    )
end
