# Exact scalar-augmented OAR witnesses

This checks the actual finite algebra `B(V_b) direct-sum C` of CO-1 using
the computed sparse-CAR descendants of CH-2. It retains each positive Gram
matrix instead of introducing floating orthonormalization. Root conventions
(aa) fix metric adjoints, independent scalar augmentation and grade dynamics.

`UnitizedOAR.jl` implements the direct-sum algebra, exact Gram adjoints,
states and unital refinement. Its Gram check constructs and verifies an
exact `G=L D L*` factorization with unit triangular L and positive real D;
this directly certifies positivity, since `x*Gx=(L*x)*D(L*x)>0` for nonzero x.
`CosetTower.jl` obtains bases and Grams from actual finite coset polynomials,
verifies the refined sparse vectors lie in the target span, and computes
compressed modes by inner products and exact Gram solves.

Run from the repository root with one thread:

```bash
OPENBLAS_NUM_THREADS=1 JULIA_NUM_THREADS=1 timeout 60 julia --project=. cft_machine/benchmarks/unitized_oar/test.jl
OPENBLAS_NUM_THREADS=1 JULIA_NUM_THREADS=1 timeout 60 julia --project=. cft_machine/benchmarks/unitized_oar/test_descendants.jl
OPENBLAS_NUM_THREADS=1 JULIA_NUM_THREADS=1 timeout 60 julia --project=. cft_machine/benchmarks/unitized_oar/run.jl
```

The tests assert exact unitality, multiplication, metric adjoints, composition,
state pullbacks, positive vacuum energy, and covariance of energy derivations.
Hamiltonians themselves need not intertwine; their shell differences commute
with the image algebra. Same-smearing compressions are deliberately shown not
to refine exactly. A mutation replacing the independent scalar by the vacuum
expectation is rejected: that map is only a CP completion.

The producer records eight actual low-grade stages (k=1,2 and b=0..3), their
Gram matrices and positive flag energies, and all source hashes. These are
small witnesses of the general CO-1 proof. No claim identifies the descendant
basis with a categorical fusion space or proves local interactions on it.

A first integration run timed out because it repeatedly recomputed entire
sparse stress actions inside a matrix-entry loop. The corrected code computes
each necessary action once and uses the proved exact grade selection rule
`[E,C_n]=-n C_n` to skip vanishing compressed columns. The verified operator
is unchanged. The 60-second compute cap remains in force.
