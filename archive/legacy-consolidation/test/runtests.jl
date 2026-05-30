# test/runtests.jl
#
# ============================================================
# P8.8 — Pkg.test entry point (synthetic; NOT present in MMA source)
# ============================================================
# MMA's `test/` directory (copied byte-identical at P8.8) contains
# 18 standalone test files but NO `runtests.jl`. MMA's testing
# convention runs each test file individually via
# `julia --project=. test/test_<name>.jl` — see MMA `README.md`
# + `HANDOFF.md` (P8.8 brief inspection 2026-05-17).
#
# Pkg.test() requires `test/runtests.jl` as its mandatory entry
# point (see Pkg.Types `pkgerror` at `Pkg/src/Types.jl:68` and
# `Pkg.Operations.test` at `Pkg/src/Operations.jl:2401` —
# raises "Package … did not provide a `test/runtests.jl` file"
# when absent).
#
# This `runtests.jl` is therefore SYNTHETIC infrastructural glue
# added by P8.8 — analogous to the `MobileAnyons.jl` module shell
# (P8.4) or `Project.toml` import (P8.3). It contains NO
# mathematical content; it is a thin driver that evaluates each
# of the 18 byte-identical MMA test files in an isolated fresh
# anonymous module so their includes/usings don't cross-pollute.
# ============================================================
# Isolation rationale (P8.8 v3 — 2026-05-17)
# ============================================================
# Each of the 18 MMA test files self-bootstraps with
#   include("../src/MobileAnyons/MobileAnyons.jl")
#   using .MobileAnyons
# When two test files run sequentially under the SAME Julia scope
# (which is what naive `include(f)` from a driver loop produces),
# the second `include` redefines `Main.MobileAnyons` and Julia
# emits "WARNING: replacing module MobileAnyons" — but more
# damagingly, names bound by the first `using .MobileAnyons` go
# stale (they still point at the now-replaced module) and the
# second `using .MobileAnyons` ambiguates with the stale binding,
# producing `UndefVarError: <name> not defined in Main` with a hint
# "two or more modules export different bindings with this name".
# Verified by spike at P8.8 v3 — `MobileAnyons.build_rsymbol_cache`
# resolves after the first include, then becomes UndefVarError
# after the second.
#
# Fix: evaluate each test file inside a FRESHLY-CREATED anonymous
# module so its `include` and `using .MobileAnyons` happen in an
# isolated namespace that is discarded after the testset completes.
# This is exactly what `SafeTestsets.jl`'s `@safetestset` macro
# does; we inline the same pattern to avoid the dependency. Each
# test file's internal @testset structure is preserved verbatim.
#
# Implementation note: `Module(:Anon_<i>_<name>)` creates a bare
# anonymous module; `Base.eval(m, :(include(...)))` runs the file
# inside it. `@testset` from the outer scope captures the pass/fail
# tally across modules (Test.jl's testset state is dynamic-scoped,
# not lexical, so it crosses the module boundary correctly).
# ============================================================

using Test

# 18 test files, copied byte-identical from MMA `test/` at P8.8
# (SHA256-verified in `results/CHECKS.md` P8.8 entry).
#
# Ordering: alphabetical by filename, matching `ls test/test_*.jl`.

const TEST_FILES = [
    "test_braiding_nonabelian.jl",
    "test_braiding_svec.jl",
    "test_categorical_lift.jl",
    "test_categories.jl",
    "test_convergence.jl",
    "test_fibonacci_spectra.jl",
    "test_finegraining_fibonacci.jl",
    "test_finegraining_svec.jl",
    "test_fsymbols.jl",
    "test_golden_chain.jl",
    "test_golden_chain_cft.jl",
    "test_hilbert.jl",
    "test_lift_audition.jl",
    "test_lift_investigations.jl",
    "test_number_changing_finegraining.jl",
    "test_paircreation.jl",
    "test_svec.jl",
    "test_virasoro.jl",
]

# Resolve absolute paths once (each anonymous module's `include`
# resolves relative to the module's source, which for an anonymous
# `Module(...)` is unset; passing absolute paths sidesteps that.)
const TEST_DIR = @__DIR__

@testset "MobileAnyons (P8.8 — full MMA test suite)" begin
    for (i, f) in enumerate(TEST_FILES)
        @testset "$f" begin
            # Fresh anonymous module per file → isolated namespace.
            # The test files' `include("../src/MobileAnyons/...")` is
            # path-relative to the test file's directory, NOT to the
            # anonymous module's source location. Anonymous modules
            # default include-base to `pwd()` which Pkg.test sets to
            # the test/ tmp checkout — that matches `test_*.jl`'s
            # parent — so the test files' relative `../src/...` paths
            # resolve correctly.
            modname = Symbol("Anon_", i, "_", replace(f, ".jl" => ""))
            m = Module(modname)
            # Bootstrap the fresh anonymous module. `Module(name)`
            # produces a bare module whose namespace contains only the
            # one bound name (the module itself); `using` brings names
            # from `Base`/`Core` into the namespace but does NOT make
            # `include` visible (because `include` is bound PER-MODULE
            # by `Base.include_string` machinery — `using Base` finds
            # `Base.include` but its `include(path)` calls land in
            # `Base`, not `m`). The cleanest fix is to give `m` its own
            # `include` closure that targets `m`, so when the test file
            # later calls `include("../src/...")` the included code's
            # top-level bindings live in `m`:
            Base.eval(m, :(using Base, Core, Test))
            Base.eval(m, :(const include = (path) -> Base.include($m, path)))
            # Drive the initial include from inside the module so its
            # top-level bindings (including the `using .MobileAnyons`
            # brought in by the file itself) live in `m`, not in `Main`.
            # We use Base.include(m, abspath) directly because the file
            # is in test/ already and uses `../src/...` relatively from
            # its own location.
            Base.include(m, joinpath(TEST_DIR, f))
        end
    end
end
