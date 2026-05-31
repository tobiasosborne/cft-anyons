#!/usr/bin/env julia

using CftAnyons
using TOML

run_dir = joinpath(@__DIR__, "..", "..", "runs", "2026-05-31-qubit-sdp-smoke")
mkpath(run_dir)

zero_spec = CftAnyons.QubitSDPSpec(psd_window_length = 1)
identity_spec = CftAnyons.QubitSDPSpec(
    psd_window_length = 1,
    relation_window_length = 0,
    residuals = [CftAnyons.identity_residual_terms()],
)

zz = zeros(4, 4)
zz[4, 4] = 1.0
zz_spec = CftAnyons.QubitSDPSpec(
    psd_window_length = 2,
    relation_window_length = 2,
    residuals = [CftAnyons.coefficient_residual_terms(zz)],
)

cases = Dict(
    "zero_residual" => CftAnyons.solve_qubit_sdp(zero_spec).status,
    "identity_zero_relation" => CftAnyons.solve_qubit_sdp(identity_spec).status,
    "forced_zz_zero_relation" => CftAnyons.solve_qubit_sdp(zz_spec).status,
)

results = Dict(
    "command" => "julia --project=. scripts/julia/qubit_sdp_smoke.jl",
    "solver" => "MosekTools.Optimizer",
    "cases" => Dict(name => string(status) for (name, status) in cases),
)

open(joinpath(run_dir, "results.toml"), "w") do io
    TOML.print(io, results)
end

for name in sort(collect(keys(cases)))
    println(name, " => ", cases[name])
end
