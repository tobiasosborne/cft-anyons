# INDEX — scripts, runs, and outputs

The manifest connecting producer scripts, run bundles, generated data/figures,
and the report shards that cite them (AGENTS.md Law 3). A numerical claim in the
lab book points here, to the script and run artifact that back it.

## Scripts

| Script | Purpose |
|---|---|
| `scripts/check_report_shards.sh` | Deterministic structural guard for the sharded lab book. |
| `scripts/ci_before_push.sh` | Local pre-push gate (shard guard + report build + Julia tests). |
| `src/CftAnyons.jl` | Seed Julia backend: golden-ratio invariant helper, finite-group averaging projector helper, Fibonacci fusion-path count helper, Poincare vector-field bracket helper, nearest-neighbour boost-current coefficient helper, and includes for the Galilei and Gaussian-boson helper files. |
| `src/GalileiAlgebras.jl` | Checked Galilei vector-field bracket helper, mass-central coefficient helper, and first-moment continuity-current coefficient helper used by CA-19--CA-21. |
| `src/GaussianBosons.jl` | Checked Gaussian-boson symbol helpers: nearest-neighbour Klein-Gordon dispersion, scalar coefficient validation, coefficient-symbol evaluation, boost-time residuals, rotation-Hamiltonian residuals, and boost-boost residual coefficient data used by CA-24, CA-26, and CA-28. |
| `src/GaussianBosonCurrents.jl` | Checked finite-open-chain Gaussian current helpers: phase-space quadratic commutators, CA-29 equal-endpoint nearest-neighbour density matrices, local bond currents `J_{j+1/2}=i[e_j,e_{j+1}]`, closed-form current matrices, and continuity residuals for the T_01 candidate only. |
| `src/GaussianBosonNumerics.jl` | Checked Gaussian-boson numerical/example helpers: Lorentz Hessian residuals, anisotropic and doubler coefficient examples, uncentered and centered finite periodic momentum grids, finite periodic Fourier vectors, finite periodic stiffness matrices, Brillouin-grid symbol spectra, and finite-grid minimum-data certificates used by CA-27--CA-28. |
| `test/runtests.jl` | Julia invariant checks (`make test` / `Pkg.test()`), including the `C2` swap averaging projector sector check used by CA-06, the two-qubit exchange projector check used by CA-08, the Fibonacci path-count check used by CA-09, the lattice-symmetry algebra/coefficient checks used by CA-11--CA-12, the Galilean algebra/mass/current checks used by CA-19--CA-21, the Gaussian-boson symbol checks used by CA-24, the Gaussian open-chain T_01 current continuity checks used by A4, and the Gaussian-boson residual/numerical/scalar-coefficient-validation/centered-momentum/Fourier-eigenvector/minimum-data/rotation/boost-boost checks used by CA-26--CA-28. |

## Runs

_None yet._ When a script produces data, create
`runs/<YYYY-MM-DD>-<slug>/{data,figures}/` with a `README.md` (command line +
headline finding) and add a row here.

## Reviews

| Artifact | Purpose |
|---|---|
| `reviews/2026-05-30_gaussian_lorentz/` | Independent rigorous reviews of CA-10--CA-17 and CA-23--CA-28, plus synthesis for stress-energy-density follow-up shards. |

## Report shards

See `report/SHARD_CATALOG.md` for the searchable shard catalogue.
