# Exact small-category input probes

Reproduce from the repository root:

```bash
python3 scripts/python/run_small_category_inputs.py
```

Headline: explicit unit-normalized dagger Frobenius products solve the
binary equations for untwisted VecZ2 and Fibonacci. Semion's associator
obstructs that same A=1+x positive/separable ansatz. A contracting homotopy
proves all positive-degree categorical Hochschild groups vanish at the two
positive solutions. Selected semion/Fibonacci conformal lifts admit the
recorded vacuum exchange Ward coefficients through grade four; the semion
grade-two null yields h_out*(1-h_out)=0 for a two-primary channel.

This is not a full solution of the conformal sewing, local-Hamiltonian,
KS/OAR or complete-category realization problem. The semion obstruction
does not exclude the unit boundary algebra or the semion CFT.

`results.json` stores exact field conventions, multiplication/Frobenius
matrices, low-degree differentials/contraction scalars, Gram matrices,
Ward coefficients, software versions and source/producer hashes. Each text
file records raw unittest output. Ten test groups pass. Four mutations
are rejected as assertion failures: wrong Fibonacci product coefficient,
missing semion associator sign, half the Virasoro central coefficient,
and wrong external weight in the Ward recurrence. The final restored run
passes. No source file is mutated; a declared environment selector chooses
each deliberately incorrect expression in the child test process.

Categorical arithmetic uses Q(r), r>0 and r^4-r^2-1=0. Stress arithmetic is
rational. All displayed rank/positivity checks are exact. The all-degree
cohomology claim is a local proof in LC-7, not extrapolation from small
matrices. The all-grade Virasoro positivity statements use the cited source
theorem, not finite testing. See `reconstruction/06_small_category_sewing.md`
through `08_small_category_stress.md` and CONVENTIONS (ah).
