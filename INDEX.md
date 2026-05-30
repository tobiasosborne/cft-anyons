# INDEX — scripts, runs, and outputs

The manifest connecting producer scripts, run bundles, generated data/figures,
and the report shards that cite them (AGENTS.md Law 3). A numerical claim in the
lab book points here, to the script and run artifact that back it.

## Scripts

| Script | Purpose |
|---|---|
| `scripts/check_report_shards.sh` | Deterministic structural guard for the sharded lab book. |
| `scripts/ci_before_push.sh` | Local pre-push gate (shard guard + report build + Julia tests). |
| `src/CftAnyons.jl` | Seed Julia backend: golden-ratio invariant helper, finite-group averaging projector helper, and Fibonacci fusion-path count helper. |
| `test/runtests.jl` | Julia invariant checks (`make test` / `Pkg.test()`), including the `C2` swap averaging projector sector check used by CA-06, the two-qubit exchange projector check used by CA-08, and the Fibonacci path-count check used by CA-09. |

## Runs

_None yet._ When a script produces data, create
`runs/<YYYY-MM-DD>-<slug>/{data,figures}/` with a `README.md` (command line +
headline finding) and add a row here.

## Report shards

See `report/SHARD_CATALOG.md` for the searchable shard catalogue.
