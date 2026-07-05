# CA-64 relaxed re-scan: residual-profile verdicts layered on the exact CA-57
# scan, kept as a separate result type/schema so the exact-scan bundle is not
# mutated. Verdicts:
#   :excluded_current_collapsed     -- ||p||_tau = 0 (hard first-moment gate)
#   :excluded_conservation_profile  -- conservation not exact, no profile decay
#   :queued_conservation_profile    -- conservation not exact but profile decays
#   :excluded_boost_profile         -- conservation exact, boost tail flat
#   :queued_gns_scaling             -- conservation exact, boost profile decays
#   :not_excluded_algebraic         -- exact boost witness found at some support

struct QubitRelaxedGateOptions
    max_support::Int
    current_atol::Float64
    conservation_rtol::Float64
    boost_rtol::Float64
    decay_rtol::Float64
    speed2_bounds::Union{Nothing, Tuple{Float64, Float64}}
end

QubitRelaxedGateOptions(; max_support::Integer = 5, current_atol::Real = 1e-9,
    conservation_rtol::Real = 1e-6, boost_rtol::Real = 1e-6, decay_rtol::Real = 1e-3,
    speed2_bounds = nothing) = QubitRelaxedGateOptions(Int(max_support), Float64(current_atol),
    Float64(conservation_rtol), Float64(boost_rtol), Float64(decay_rtol),
    speed2_bounds === nothing ? nothing : (Float64(speed2_bounds[1]), Float64(speed2_bounds[2])))

struct QubitRelaxedScanResult
    sample::QubitHamiltonianSample
    current_status::Symbol
    current_norm::Float64
    conservation_profile::Vector{ResidualProfilePoint}
    boost_profile::Vector{ResidualProfilePoint}
    conservation_exact_support::Union{Nothing, Int}
    relaxed_verdict::Symbol
end

_profile_decays(points; rtol) =
    length(points) >= 2 && last(points).raw_norm < first(points).raw_norm * (1 - rtol)

function _first_exact_support(points; rtol)
    for p in points
        p.relative_norm <= rtol && return p.support
    end
    return nothing
end

function scan_qubit_candidate_relaxed(sample::QubitHamiltonianSample;
        options::QubitRelaxedGateOptions = QubitRelaxedGateOptions())
    h = sample.coefficients
    current_norm = norm(adjacent_bond_current_pauli_coefficients(h))
    empty = ResidualProfilePoint[]
    if current_norm <= options.current_atol
        return QubitRelaxedScanResult(sample, :current_collapsed, current_norm, empty, empty,
            nothing, :excluded_current_collapsed)
    end

    conservation = solve_conservation_profile(h; max_support = options.max_support)
    exact_support = _first_exact_support(conservation; rtol = options.conservation_rtol)
    if exact_support === nothing
        verdict = _profile_decays(conservation; rtol = options.decay_rtol) ?
            :queued_conservation_profile : :excluded_conservation_profile
        return QubitRelaxedScanResult(sample, :currentful, current_norm, conservation, empty,
            nothing, verdict)
    end

    boost = solve_boost_profile(h; max_support = options.max_support,
        min_support = exact_support, speed2_bounds = options.speed2_bounds)
    verdict =
        any(p -> p.relative_norm <= options.boost_rtol, boost) ? :not_excluded_algebraic :
        _profile_decays(boost; rtol = options.decay_rtol) ? :queued_gns_scaling :
        :excluded_boost_profile
    return QubitRelaxedScanResult(sample, :currentful, current_norm, conservation, boost,
        exact_support, verdict)
end

scan_qubit_candidates_relaxed(samples;
    options::QubitRelaxedGateOptions = QubitRelaxedGateOptions()) =
    [scan_qubit_candidate_relaxed(sample; options) for sample in samples]

function summarize_qubit_relaxed_scan(results)
    by_verdict = Dict{Symbol, Int}()
    for r in results
        by_verdict[r.relaxed_verdict] = get(by_verdict, r.relaxed_verdict, 0) + 1
    end
    return (total = length(results), by_verdict = by_verdict)
end

function _profile_table(points)
    return [Dict(
        "support" => p.support,
        "raw_norm" => p.raw_norm,
        "relative_norm" => p.relative_norm,
        "scale_norm" => p.scale_norm,
        "speed2" => _finite_or_string(get(p.metadata, :speed2, NaN)),
        "scalar_shift" => _finite_or_string(get(p.metadata, :scalar_shift, NaN)),
    ) for p in points]
end

function qubit_relaxed_result_row(result::QubitRelaxedScanResult)
    return Dict(
        "name" => result.sample.name,
        "family" => string(result.sample.family),
        "source_kind" => string(qubit_sample_source_kind(result.sample)),
        "relaxed_verdict" => string(result.relaxed_verdict),
        "scope" => "relaxed_first_moment_route",
        "current_status" => string(result.current_status),
        "current_norm" => _finite_or_string(result.current_norm),
        "conservation_exact_support" =>
            result.conservation_exact_support === nothing ? "none" :
            result.conservation_exact_support,
        "conservation_profile" => _profile_table(result.conservation_profile),
        "boost_profile" => _profile_table(result.boost_profile),
    )
end

function qubit_relaxed_summary_table(results)
    summary = summarize_qubit_relaxed_scan(results)
    return Dict(
        "total" => summary.total,
        "by_verdict" => Dict(string(k) => v for (k, v) in summary.by_verdict),
    )
end
