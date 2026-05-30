# INDEX — scripts, runs, and outputs

The manifest connecting producer scripts, run bundles, generated data/figures,
and the report shards that cite them (AGENTS.md Law 3). A numerical claim in the
lab book points here, to the script and run artifact that back it.

## Scripts

| Script | Purpose |
|---|---|
| `scripts/check_report_shards.sh` | Deterministic structural guard for the sharded lab book. |
| `scripts/ci_before_push.sh` | Local pre-push gate (shard guard + report build + Julia tests). |
| `src/CftAnyons.jl` | Seed Julia backend: golden-ratio invariant helper, finite-group averaging projector helper, Fibonacci fusion-path count helper, Poincare vector-field bracket helper, nearest-neighbour boost-current coefficient helper, and Galilei helper include. |
| `src/GalileiAlgebras.jl` | Checked Galilei vector-field bracket helper, mass-central coefficient helper, and first-moment continuity-current coefficient helper used by CA-19--CA-21. |
| `src/GaussianBosons.jl` | Checked Gaussian-boson symbol helpers: nearest-neighbour Klein-Gordon dispersion, coefficient-symbol evaluation, and boost-time residual symbols used by CA-24. |
| `test/runtests.jl` | Julia invariant checks (`make test` / `Pkg.test()`), including the `C2` swap averaging projector sector check used by CA-06, the two-qubit exchange projector check used by CA-08, the Fibonacci path-count check used by CA-09, the lattice-symmetry algebra/coefficient checks used by CA-11--CA-12, the Galilean algebra/mass/current checks used by CA-19--CA-21, and the Gaussian-boson symbol checks used by CA-24. |

## Runs

_None yet._ When a script produces data, create
`runs/<YYYY-MM-DD>-<slug>/{data,figures}/` with a `README.md` (command line +
headline finding) and add a row here.

## Report shards

See `report/SHARD_CATALOG.md` for the searchable shard catalogue.
