# Exact four-port consistency probes

Reproduce from the repository root:

```bash
python3 scripts/python/run_four_port_consistency.py
```

Headline: fifteen exact test groups pass; five deliberate errors are rejected;
the restored run passes. This verifies local algebraic/analytic functions and
tensor identities. It is not a complete CFT, local Hamiltonian or KS/OAR result.

The tests cover null-state rejection before inverse-Gram sewing, nonorthogonal
Gram resolution, complex categorical/dual crossing conversion, inverse-metric
linearization, semion and Fibonacci scalar descendant coefficients through
grade four, the exact semion null ODE and connection, external tensor F=-1,
positive reflected pair coefficients, all four null ports, global Möbius Ward
identities, adjacent braid signs on the declared branch, Fibonacci midpoint
eigenspaces, and conditional semion multiplicity selection by graded positivity.

The last check includes a sharp distinction: at external dimension four the
energy-one kernel has expectation -1/4 on the normalized epsilon direction,
although the whole reflected kernel at z=1/2 is I/4+P_epsilon and positive.
Pointwise positivity cannot replace positive intermediate-energy sewing.
The dimension-two selection is conditional on the ansatz of LC-13.

`results.json` records exact functions, channel and reflection matrices,
coefficient arrays, versions, and SHA256 hashes of producers, dependencies
and local source files. Text files retain raw unittest outputs. Mutations:
wrong dual crossing conversion, silently dropped null-state descent,
wrong inverse-Gram variation sign, wrong reflected-pair sign, and wrong
primary weight in the descendant Ward pairing. Failures must be the expected
assertions, not import/runtime errors. Mutation selectors never edit source.

Full conventions and proofs are in reconstruction notes LC-9--LC-13 and
root CONVENTIONS (ai). Primary multiplicities are not categorical quantum
dimensions; Virasoro channel count is not categorical fusion multiplicity.
Fibonacci coefficient truncations supply no crossing exclusion without
certified tails. The optional character argument in LC-12 is conditional
genus-one information, not a four-port result.
