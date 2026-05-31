#!/usr/bin/env julia

using CftAnyons
using TOML

run_dir = joinpath(@__DIR__, "..", "..", "runs", "2026-05-31-qubit-candidate-scan")
mkpath(run_dir)

samples = CftAnyons.qubit_candidate_scan_samples()
results = CftAnyons.scan_qubit_candidates(samples)
summary = CftAnyons.qubit_scan_summary_table(results)

rows = [CftAnyons.qubit_scan_result_row(result) for result in results]
tfim = only(row for row in rows if row["name"] == "tfim_self_dual")
heisenberg = only(row for row in rows if row["name"] == "heisenberg_iso")
xx = only(row for row in rows if row["name"] == "xxz_delta_0.0")

inputs = Dict(
    "schema_version" => "qubit-candidate-scan-input/v1",
    "scope" => "fixed_first_moment_route",
    "pauli_basis" => ["I", "X", "Y", "Z"],
    "coefficient_indexing" => "coefficients[a+1][b+1] = sigma_a tensor sigma_b",
    "sample_count" => length(samples),
    "families" => sort(unique(string(sample.family) for sample in samples)),
    "source_kinds" => sort(unique(string(CftAnyons.qubit_sample_source_kind(sample)) for sample in samples)),
)

summary_bundle = Dict(
    "schema_version" => "qubit-fixed-h-scan/v1",
    "scope" => "fixed_first_moment_route",
    "command" => "julia --project=. scripts/julia/qubit_candidate_scan.jl",
    "sample_count" => length(samples),
    "summary" => summary,
    "notable_points" => Dict(
        "tfim_self_dual" => tfim,
        "heisenberg_iso" => heisenberg,
        "xxz_delta_0" => xx,
    ),
)

results_bundle = Dict(
    "schema_version" => "qubit-fixed-h-scan-results/v1",
    "scope" => "fixed_first_moment_route",
    "rows" => rows,
)

open(joinpath(run_dir, "inputs.toml"), "w") do io
    TOML.print(io, inputs)
end

open(joinpath(run_dir, "summary.toml"), "w") do io
    TOML.print(io, summary_bundle)
end

open(joinpath(run_dir, "results.toml"), "w") do io
    TOML.print(io, results_bundle)
end

println("sample_count => ", length(samples))
for (verdict, count) in sort(collect(summary["by_verdict"]); by = first)
    println(verdict, " => ", count)
end
println("tfim_self_dual => ", tfim["verdict"], " at ", tfim["terminal_gate"])
