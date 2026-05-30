# Package entry point — Julia package-discovery requires a file
# `src/<Name>.jl` whose top-level expression is `module <Name> … end`.
# This file is the minimal stub satisfying that requirement; the real
# source tree lives under `src/MobileAnyons/` (the Phase-8 byte-identical
# port of MMA's subdirectory layout, P8.4–P8.7) and the per-feature
# aggregator `src/MobileAnyons/MobileAnyons.jl` exposes the full
# 36-symbol public interface.
#
# Form chosen (P8.8 v3 — 2026-05-17): NO-OP STUB.
#
#     module MobileAnyons
#     end
#
# Rationale — three forms were considered:
#
#   (i) Bare include — `include("MobileAnyons/MobileAnyons.jl")` with no
#       outer module wrap. Rejected: Julia's package-loader executes
#       `src/<Name>.jl` in `Base.__toplevel__` where `include` is NOT in
#       scope (verified during P8.8 v3 spike — `UndefVarError: include
#       not defined in Base.__toplevel__`). Julia mandates a single
#       top-level module declaration in the package entry-point file.
#
#  (ii) Outer-module-wraps-inner-module — `module MobileAnyons;
#       include("MobileAnyons/MobileAnyons.jl"); end`. Loads cleanly but
#       introduces a nested `MobileAnyons.MobileAnyons` namespace because
#       the included file ALSO opens `module MobileAnyons`. `using
#       MobileAnyons` then exposes nothing directly; callers would need
#       `using MobileAnyons.MobileAnyons`. Would require either renaming
#       the inner module (breaks byte-identicality with MMA — forbidden)
#       or a re-export shim (`for n in names(MobileAnyons.MobileAnyons,
#       all=false); @eval const $n = MobileAnyons.MobileAnyons.$n; end`)
#       which adds non-trivial infrastructure for negligible benefit.
#
# (iii) No-op stub + per-test-file `include + using .MobileAnyons`.
#       CHOSEN. Each of the 18 byte-identical MMA test files already
#       self-bootstraps with
#           include("../src/MobileAnyons/MobileAnyons.jl")
#           using .MobileAnyons
#       (verified by grep across `test/test_*.jl` at P8.8 v3 —
#       2026-05-17). The synthetic `test/runtests.jl` driver just
#       `include`s each test file in turn, so the per-file bootstrap
#       chain handles everything; the top-level stub need only satisfy
#       the package-loader's existence check. Side effect: repeated
#       inclusion across the 18 test files emits benign Julia "module
#       replaces module" warnings (no correctness impact, verified by
#       `Pkg.test("MobileAnyons")` — see results/CHECKS.md §P8.8).
#
# Provenance: P8.8 (cft-anyons-80h), atomic commit 2026-05-17.
# Mathematical content: NONE (purely infrastructural Julia idiom — the
# analogue of a Python `__init__.py` stub). No new GLOSSARY slugs
# realised here; all 36 realised slugs continue to live in the
# per-feature files under `src/MobileAnyons/` and remain governed by
# their P8.4–P8.7 commits.
#
# Diverges from MMA: MMA never needed a top-level shim because MMA's
# testing convention runs each test file directly via
# `julia --project=. test/test_<name>.jl` rather than `Pkg.test`. Our
# P8.8 elects `Pkg.test` as the canonical entry point (user decision
# 2026-05-17), so this top-level stub becomes required Julia
# package-loader plumbing. The inner `src/MobileAnyons/MobileAnyons.jl`
# and every per-feature file remain byte-identical to MMA where
# P8.4–P8.7 committed them.

module MobileAnyons
end
