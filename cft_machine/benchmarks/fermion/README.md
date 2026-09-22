# Source-modified lattice fermion benchmark

This executable backend constructs the massless staggered Dirac Hamiltonian,
projected chiral Koo–Saleur modes, sharp momentum refinement, and a compatible
limiting chiral sea. Its continuum target is the sourced complex-fermion
Virasoro representation with c=1. It does **not** consume an arbitrary category
or certify categorical fidelity. Read `PROOF.md` for the structured proofs,
source theorem application, and graded/local-net boundary.

Run from the repository root:

```bash
OPENBLAS_NUM_THREADS=1 JULIA_NUM_THREADS=1 timeout 60 julia --project=. cft_machine/benchmarks/fermion/test.jl
OPENBLAS_NUM_THREADS=1 JULIA_NUM_THREADS=1 timeout 60 julia --project=. cft_machine/benchmarks/fermion/run.jl
```

Julia stdlibs only. Dense one-particle matrices have dimension at most 64;
no many-body diagonalization or full package suite. The producer writes
`runs/2026-09-22/results.toml`; the checked run uses Julia 1.12.5 and one BLAS
thread. `test.txt` records the green test; `mutation-wrap.txt` records the
rejected implementation with the no-wrap condition replaced by `true`.
The original implementation was restored before the final green run.

The tests assert source-independent finite invariants where available:
exact rational continuum Witt relations on a named core, exact Fermi-surface
sum versus the Schwinger matrix trace, analytic coefficient and Wilson-triangle
bounds, refinement composition/isometry and sea compatibility, adjointness,
Dirac squared dispersion, and an independent position-space nearest-neighbor
AP hopping oracle.

| Sites M | n=2 Schwinger term | n=3 Schwinger term |
|---|---:|---:|
| 8 | 0.3459321593 | 0.7748288164 |
| 16 | 0.4567488187 | 1.5926816948 |
| 32 | 0.4888651513 | 1.8903265978 |
| Exact continuum | 1/2 | 2 |

The continuum entries come from the proved finite sum (n³-n)/12, not an
extrapolation. The source's no-wrap modification is essential: the wrapped
negative control gives zero to rounding in these rows. This cancellation at
the ultraviolet edge is precisely why a bare finite-matrix commutator can
miss the continuum central term.

The producer also reports the fixed-core error for |r|<=3/2, n=1,2,3.
At M=8,n=3 a shifted core label exits the coarse window: `core_inside=false`
explicitly marks that the displayed Taylor bound is **not applicable** there.
All other displayed core windows meet the hypothesis; the triangle rows use
n=1,2 and satisfy their analytic bounds. Finite data are regression evidence;
PROOF.md provides the summable bound and cites the source convergence theorem.

The self-dual specialization exports `majorana_recipe(M,n)`: an explicit
**even quadratic CAR polynomial**, its normal-ordering scalar, conjugation,
and covariance, without a many-body matrix. Tests check the antiunitary
admissibility and exact c=1/2 Schwinger term. This is a Majorana Virasoro
backend; the Ising net/category bridge is a separate theorem interface.

`WilsonStates.jl` supplies actual finite Dirac negative-energy covariances
and their coarse pullbacks. Run its independent check with:

```bash
OPENBLAS_NUM_THREADS=1 JULIA_NUM_THREADS=1 timeout 60 julia --project=. cft_machine/benchmarks/fermion/test_wilson.jl
```

`WILSON_PROOF.md` derives the nonzero horizontal covariance error and converts
it to a summable **dual state-norm** bound via independent two-mode blocks.
The producer includes the resulting Wilson rows and computable state tails.
The tails may be loose at small scales; they are not claimed uniform in the
coarse row. Mutation logs also document rejection of the opposite spectral
sea and of a missing Majorana half factor.
