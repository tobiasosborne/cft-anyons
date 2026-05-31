# Qubit SDP Smoke Run

Date: 2026-05-31.

Command:

```bash
julia --project=. scripts/julia/qubit_sdp_smoke.jl
```

Headline finding: the fixed-\(h\) SDP layer builds and solves tiny Mosek
feasibility instances.  The zero-residual moment problem is feasible, while
the artificial identity relation \(\omega(I)=0\) and the forced relation
\(\omega(X^*ZZY)=0\) with \(Y=ZZ\) are infeasible.

Output:

- `results.toml` records the command, solver wrapper, and solver verdicts.
