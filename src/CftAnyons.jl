module CftAnyons

# Seed module for the cft-anyons computational backend. Per AGENTS.md Rule 7,
# the accompanying tests assert real mathematical invariants, not "it loaded".
# This file is intentionally tiny; extend it as the pipeline (CA-01) grows.

"""
    golden_ratio() -> Float64

The golden ratio ``φ = (1 + √5)/2``.

It is the quantum dimension ``d_τ`` of the non-trivial simple object ``τ`` in the
Fibonacci fusion category, fixed by the fusion rule ``τ ⊗ τ ≅ 1 ⊕ τ`` — which
forces the quantum-dimension relation ``d_τ² = 1 + d_τ``. The seed test suite
checks exactly this invariant, establishing the project's "tests assert a known
value / identity" convention.
"""
golden_ratio() = (1 + sqrt(5)) / 2

end # module CftAnyons
