# Local conformal consistency: exact algebraic evidence

Command from the repository root:

```bash
python3 scripts/python/run_local_conformal_checks.py
```

Headline: eleven universal symbolic identities pass; five deliberately incorrect
conventions/factors are rejected; the restored run passes. This is not a
numerical CFT example, a solution to the consistency equations, or a
continuum-limit result.

`results.json` records Python/SymPy versions, producer hashes, run statuses
and the exact expected failing tests. Each `.txt` file contains raw unittest
output. Mutation runs use an explicit environment selector and do not modify
source files. Their failures must be assertion failures, not import/runtime
errors. The producer verifies the complete expected set of failures.

The tests check: Hochschild d² in degrees one and two; deformation signs at
orders one and two; the nonassociative five-term associator identity;
propagation of Ward identities under composition; the operator-Jacobi
identity behind lift Bianchi; the Virasoro cocycle polynomial; the circle
exponential/bracket convention; invariance of the sewing cocycle under
rephasing; the Taylor Ward recurrence's derivative factor; and equivariance
of the Hochschild differential under a derivation action.

Sources, conditional proofs and limitations are in `reconstruction/` and
root CONVENTIONS (ae). Initial test-first runs failed because the new helper
module/function did not yet exist; the retained mutation runs additionally
demonstrate detection of actual mathematical regressions.
