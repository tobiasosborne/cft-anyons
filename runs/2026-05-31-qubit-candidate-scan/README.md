# Qubit Candidate Scan

Date: 2026-05-31.

Command:

```bash
julia --project=. scripts/julia/qubit_candidate_scan.jl
```

Headline finding: the fixed first-moment-route scan checked 99 nearest-neighbour
qubit Hamiltonian samples.  Nine fail by current collapse, twenty-seven fail
the conservation witness, and sixty-three pass those two gates but fail the
exact boost witness.  The locally sourced self-dual transverse-Ising sample is
in the last class; this is evidence that the exact local boost-witness route is
too strict for that known critical model, not a claim that the Ising continuum
limit is absent.

Outputs:

- `inputs.toml` records the scan convention and family inventory.
- `summary.toml` records status counts and notable sourced points.
- `results.toml` records one row per scanned Hamiltonian.
