#!/usr/bin/env julia
#
# CA-64 relaxed re-scan. Reproduces the exact 99-point CA-57 counts, then layers
# the relaxed residual-profile verdicts over the same family grid (profiles to
# witness support 4 for the broad grid; support 5 for the sentinel subset, whose
# support-5 SVDs are the expensive step), and runs the fixed-residual GNS-norm
# SDP objective tier for the sentinels. Writes a run bundle in the style of
# runs/2026-05-31-qubit-candidate-scan/.

using CftAnyons
using LinearAlgebra
using TOML
import JuMP

const C = CftAnyons

run_dir = joinpath(@__DIR__, "..", "..", "runs", "2026-07-05-qubit-relaxed-scan")
mkpath(run_dir)

const BROAD_MAX_SUPPORT = 4
const SENTINEL_MAX_SUPPORT = 5
sentinel_names = ["tfim_self_dual", "xxz_delta_0.5", "heisenberg_iso", "onsite_x", "classical_zz"]

samples = C.qubit_candidate_scan_samples()

# --- inputs.toml written up front so a partial run is visible. ---
inputs = Dict(
    "schema_version" => "qubit-relaxed-scan-input/v1",
    "scope" => "relaxed_first_moment_route",
    "pauli_basis" => ["I", "X", "Y", "Z"],
    "sample_count" => length(samples),
    "broad_max_support" => BROAD_MAX_SUPPORT,
    "sentinel_max_support" => SENTINEL_MAX_SUPPORT,
    "sentinels" => sentinel_names,
    "sdp_psd_window_length" => 2,
)
open(joinpath(run_dir, "inputs.toml"), "w") do io
    TOML.print(io, inputs; sorted = true)
end

# --- 1. reproduce the exact CA-57 counts (hard invariant). ---
println("exact scan of ", length(samples), " points ..."); flush(stdout)
exact = C.scan_qubit_candidates(samples)
exact_counts = C.qubit_scan_summary_table(exact)["by_verdict"]
@assert exact_counts["excluded_current_collapsed"] == 9 exact_counts
@assert exact_counts["excluded_no_conservation_witness"] == 27 exact_counts
@assert exact_counts["excluded_no_boost_witness"] == 63 exact_counts
println("exact counts reproduced: 9 / 27 / 63"); flush(stdout)

# --- 2. relaxed profiles for all 99 points (support <= 4), per-family progress. ---
broad_options = C.QubitRelaxedGateOptions(max_support = BROAD_MAX_SUPPORT)
relaxed = C.QubitRelaxedScanResult[]
for family in unique(s.family for s in samples)
    members = [s for s in samples if s.family == family]
    for s in members
        push!(relaxed, C.scan_qubit_candidate_relaxed(s; options = broad_options))
    end
    println("relaxed family ", family, " done (", length(members), " points)"); flush(stdout)
end
relaxed_summary = C.qubit_relaxed_summary_table(relaxed)
rows = [C.qubit_relaxed_result_row(r) for r in relaxed]

# --- 3. sentinel subset at support 5 (the deep-profile record). ---
sentinel_options = C.QubitRelaxedGateOptions(max_support = SENTINEL_MAX_SUPPORT)
sentinel_results = Dict{String, C.QubitRelaxedScanResult}()
for nm in sentinel_names
    s = only(x for x in samples if x.name == nm)
    sentinel_results[nm] = C.scan_qubit_candidate_relaxed(s; options = sentinel_options)
    println("sentinel ", nm, " => ", sentinel_results[nm].relaxed_verdict); flush(stdout)
end
sentinel_block = Dict{String, Any}(
    nm => C.qubit_relaxed_result_row(r) for (nm, r) in sentinel_results)

tfim = sentinel_results["tfim_self_dual"]
tfim_boost = [p.raw_norm for p in tfim.boost_profile]
tfim_speed = [get(p.metadata, :speed2, NaN) for p in tfim.boost_profile]
design_boost = [sqrt(6), 1.8257418583505538, 1.5275252316519468, 1.3416407864998736]
boost_agreement = [isapprox(tfim_boost[i], design_boost[i]; atol = 1e-9) for i in 1:4]

# --- 4. fixed-residual GNS-norm SDP tier for the sentinels only. ---
mosek_ok = try
    m = JuMP.Model(C.MosekTools.Optimizer)
    JuMP.set_silent(m)
    JuMP.@variable(m, t >= 0)
    JuMP.@objective(m, Min, t)
    JuMP.optimize!(m)
    JuMP.termination_status(m) == C.MOI.OPTIMAL
catch
    false
end

sdp_tier = Dict{String, Any}()
if mosek_ok
    spec = C.QubitSDPSpec(psd_window_length = 2)
    for nm in sentinel_names
        h = sentinel_results[nm].sample.coefficients
        B4 = C.pauli_n_site_coefficients(
            C.boost_relation_local_density(C.pauli_two_site_operator(h)), 4)
        residual = C.coefficient_residual_terms(B4)
        res = C.solve_qubit_residual_norm_sdp(spec, residual)
        sdp_tier[nm] = Dict(
            "residual" => "boost_density_B",
            "status" => string(res.status),
            "objective_value" => (isfinite(res.objective_value) ?
                res.objective_value : string(res.objective_value)),
            "normalized_value" => (isfinite(res.normalized_value) ?
                res.normalized_value : string(res.normalized_value)),
            "tracial_norm_squared" => C.tracial_residual_norm_squared(residual),
        )
        println("sdp tier ", nm, " => ", res.status, " nu_N=", res.normalized_value)
        flush(stdout)
    end
else
    @warn "MOSEK UNAVAILABLE: fixed-residual GNS-norm SDP tier skipped (not a silent skip)."
end

summary_bundle = Dict(
    "schema_version" => "qubit-relaxed-scan/v1",
    "scope" => "relaxed_first_moment_route",
    "command" => "julia --project=. scripts/julia/qubit_relaxed_scan.jl",
    "sample_count" => length(samples),
    "exact_counts" => exact_counts,
    "relaxed_summary" => relaxed_summary,
    "sdp_tier_skipped" => !mosek_ok,
    "sdp_tier" => sdp_tier,
    "sentinels" => sentinel_block,
    "tfim_boost_profile" => Dict(
        "supports" => [2, 3, 4, 5],
        "values" => tfim_boost,
        "design_predictions" => design_boost,
        "agreement" => boost_agreement,
        "speed2" => tfim_speed,
        "speed2_sign" => all(<(0), tfim_speed) ?
            "negative (v^2 = -2, as at design stage)" : "mixed",
    ),
)

results_bundle = Dict(
    "schema_version" => "qubit-relaxed-scan-results/v1",
    "scope" => "relaxed_first_moment_route",
    "rows" => rows,
)

open(joinpath(run_dir, "summary.toml"), "w") do io
    TOML.print(io, summary_bundle; sorted = true)
end
open(joinpath(run_dir, "results.toml"), "w") do io
    TOML.print(io, results_bundle; sorted = true)
end

println("sample_count => ", length(samples))
println("exact: current=", exact_counts["excluded_current_collapsed"],
    " no_conservation=", exact_counts["excluded_no_conservation_witness"],
    " no_boost=", exact_counts["excluded_no_boost_witness"])
for (verdict, count) in sort(collect(relaxed_summary["by_verdict"]); by = first)
    println("relaxed ", verdict, " => ", count)
end
println("tfim boost profile 2..5 => ", tfim_boost)
println("design predictions      => ", design_boost)
println("agreement               => ", boost_agreement)
mosek_ok || println("!! SDP TIER SKIPPED: Mosek unavailable !!")
