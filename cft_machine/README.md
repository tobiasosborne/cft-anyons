# From categorical data to an OAR CFT

This workspace pursues Tobias's 2026-09-22 formulation: discover an algorithm,
or functor, that turns fusion/modular tensor category data into concrete
lattice systems and microscopic Virasoro generators, whose OAR limit through
Wilson's triangle is a rigorous CFT with matching modular data.

The detailed pdflatex synthesis is [report.pdf](report.pdf), with source
[report.tex](report.tex). It records the completed work and remaining gaps
at the requested wind-up boundary.

The existing anyon construction is a source of ideas. This workspace also
investigates source-controlled free-fermion constructions, energy estimates
for generator convergence, and equivariant/orbifold constructions.

**Status: active research; no universal construction established.** A finite
benchmark is not a continuum theorem. A conditional theorem must list every
input not yet synthesized from category data. Matching modular data and a
braided equivalence of full representation categories are distinct targets.

## Working map

- `compiler/`: an exact modular-input compiler for the standard chiral
  Ising datum and explicitly declared tensor products; it emits factorwise
  microscopic Majorana recipes and preserves the complete stress families.
- `research/realisation_and_fidelity.md`: target realization, modular
  fidelity, and constructive closure operations.
- `research/virasoro_routes.md`: alternate microscopic-generator mechanisms
  and the selected analytic convergence criterion.
- `research/wilson_triangle.md`: quantitative construction of compatible
  states from finite-scale ground-state data.
- `research/equivariant_oar.md`: finite-group reduction through the
  Wilson-state/GNS construction and represented weak closures.
- `research/coset_route.md`: explicit current-product stress generators
  beyond the Ising branch, with finite-core stabilization and remaining
  local-observable obligations.
- `research/smeared_coset_limits.md`: microscopic smooth-stress core,
  strong-resolvent and unitary limits with coordinated cutoffs.
- `research/coset_hamiltonian.md` and `coset_observable_system.md`: raw
  negativity, positive descendant models, strict scalar-augmented OAR and
  its represented local reconstruction.
- `benchmarks/fermion/`: source-modified microscopic KS modes, lattice
  Hamiltonians, scaling maps, and reproducible tests.
- `benchmarks/fermion/WILSON_PROOF.md`: nontrivial horizontal limits of
  microscopic Dirac states with an explicit dual-state-norm tail estimate.
- `benchmarks/coset/`: exact sparse-CAR witnesses of coset stress generators
  at central charges 1/2 and 7/10, with explicit cutoff certificates.
- `benchmarks/coset_hamiltonian/` and `benchmarks/unitized_oar/`: exact
  extracted spaces, Gram matrices, positivity and unital refinement checks.
- `reviews/`: independent cross-refereeing by the Astra collaborators.

The supported compiler domain is deliberately explicit. It does not accept
general categories by matching a fusion table, and it does not assert that
every category has a realization. The analytical contracts and alternative
routes are the machinery for expanding that domain.

Root `CONVENTIONS.md` (u) onward fixes the workspace's choices. Proofs use
Lamport ASSUME/PROVE and numbered dependency steps. Source manifests are
under `references/cft-machine/`; existing local sources remain canonical.
Substantial results are sent to skeptical Astra referees before being
presented as accepted. Refereeing does not substitute for proof or tests.

## Proof obligations for a completed construction

The output must include a constructive lattice tower, refinement maps,
renormalized states, microscopic modes with domains and normal ordering,
convergence bounds, the resulting local CFT, and a comparison of its modular
data with the input. The machine must expose additional input and unresolved
obligations instead of silently filling them from a proposed target CFT.

The OAR source defines the observable inductive limit, horizontal state
limits, projective compatibility, and GNS construction in
`literature/md/2010.11121/2010.11121.md:126–180`. This is the limit notion
used here; a spectral extrapolation is not its replacement.

## Reproduce the finite checks

From the repository root, with one BLAS thread:

```bash
OPENBLAS_NUM_THREADS=1 JULIA_NUM_THREADS=1 julia --project=. cft_machine/benchmarks/fermion/test.jl
OPENBLAS_NUM_THREADS=1 JULIA_NUM_THREADS=1 julia --project=. cft_machine/benchmarks/fermion/test_wilson.jl
OPENBLAS_NUM_THREADS=1 JULIA_NUM_THREADS=1 julia --project=. cft_machine/compiler/test.jl
OPENBLAS_NUM_THREADS=1 JULIA_NUM_THREADS=1 julia --project=. cft_machine/benchmarks/coset/test.jl
```

The compiler's README gives its input and producer commands. Each producer
has a local run bundle containing results and source hashes. Existing source
theorems supply the continuum conclusions within their stated hypotheses;
finite checks verify the implemented formulas and detect regressions.

## Current frontier

The Ising branch is supported by the explicit construction and cited source
theorems, with an additional upper inclusion for all uniformly bounded local
lattice sequences having weak limits. The coset branch now controls smooth
stress unitaries and has a strict constrained finite-algebra OAR construction
on computed vacuum descendants. Its identification with a categorical fusion
space supporting local interactions remains open. As Tobias clarified, global
fusion constraints themselves are compatible with locality; what needs proof
is the local operator realization, not an unconstrained tensor-product form.
The orbifold route still needs microscopic seeds and local extensions.
A general category-to-CFT algorithm or functor remains open.

The compiled record is CA-81–CA-85 in the root `report.pdf`; the latest
worklog records what was verified and which problems remain.
