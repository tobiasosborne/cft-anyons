# Exact coset Hamiltonian witnesses and vacuum-space helper

This bounded backend proves by exact finite witnesses that the raw quartic
coset zero mode is not positive, and evaluates the distinct positive
vacuum-module penalty construction of CH-2/CH-3 in
`cft_machine/research/coset_hamiltonian.md`. Root conventions (z),(aa) apply.
It reuses the checked sparse CAR implementation in `../coset/`.

Source registry: `references/cft-machine/coset-hamiltonian/SOURCES.md`.
The negative-energy formula is the independent CAR calculation CH-1;
vacuum metrics use the GKO relation as an independent oracle. Sparse vectors
are computed by actual current/Sugawara polynomials, not assigned those norms.

Run each command from the repository root with the stated budget:

```bash
OPENBLAS_NUM_THREADS=1 JULIA_NUM_THREADS=1 timeout 60 julia --project=. cft_machine/benchmarks/coset_hamiltonian/test.jl
OPENBLAS_NUM_THREADS=1 JULIA_NUM_THREADS=1 timeout 60 julia --project=. cft_machine/benchmarks/coset_hamiltonian/run.jl
```

Only M=8,16 and k=1,2 are allowed; b<=3. The largest occupation key has
96 bits; there is no allocation of the ambient Fock matrix. At most 5000
sparse intermediate terms are allowed, and the checked run reached 2744.
The only dense matrices are the exact Gram matrices of dimension at most 3.
No diagonalization, floating-point tolerance or full package suite is used.

## Headline: the raw sea is not a ground state

For k=1 fill flavor 1 at all momenta in both copies, leaving flavor 2 empty.
This normalized one-ket input gives

| M | R | Exact raw C_0 expectation |
|---|---|---|
| 8 | 3 | -5/3 |
| 8 | 4 | -1 |
| 16 | 3 | -13 |
| 16 | 4 | -11 |

CH-1 derives `-(M-R)(M-R-1)/12` independently. Since C_0 Omega=0, these
negative values also disprove the claim that the sea is a raw ground state.
They are ultraviolet states outside the stabilized low-energy core.

## Actual computed vacuum-space API

Include `CosetHamiltonian.jl`; its module is `CosetHamiltonian`.
`basis_data(M,k,b;R=3)` returns a named tuple with
`vectors, gram, grades, M, k, b, R`.
The underlying sparse algebra is `CosetHamiltonian.SparseCoset`.

The complete ordered basis through b=3 is:

- b=0,1: Omega;
- b=2: Omega, C_-2 Omega;
- b=3: Omega, C_-2 Omega, C_-3 Omega.

The metric is retained explicitly: its diagonal is `[1]`, `[1,c/2]`, or
`[1,c/2,2c]` for the sourced c, but the helper obtains these entries by
sparse inner products. Grades are `[0]`, `[0,2]`, or `[0,2,3]` and are tested
against the independent bit-occupation energy operator. No vector is divided
by an irrational square root. The CR-3 safe window certifies these vacuum
vectors; completeness through grade 3 uses C_-1 Omega=0 and the sourced
Virasoro relation C_-1 C_-2 Omega=C_-3 Omega, also checked directly.

`project(v,data)` applies the exact Gram projector. `regularized(v,data)`
applies `P E P+(b+1)(1-P)`; `energy(v,M,k)` independently sums occupied
particle and unoccupied-hole energies. `polarized(M)` supplies the raw
negative witness. Projection/refinement, grade eigenvectors and orthogonal
charged-state penalty tests use these actual computed vectors.

CH-3 proves positivity and the unique vacuum of the regularized operator by
its block decomposition. The finite assertions are regression checks of that
formula, not a many-body eigenvalue search. The extracted Hamiltonian is not
the original raw quartic C_0. It is spatially nonlocal because P is global.

## Acceptance and mutation

The targeted suite has 261 assertions: 16 raw negative/energy checks and 245
computed-space/projector/positive-repair/refinement checks. Replacing the
positive complement penalty by its negative produces 32 failed assertions;
the implementation was restored and the final output is recorded in
`runs/2026-09-22/test.txt`. Mutation output is retained as a `.txt` artifact.
The producer records every exact Gram diagonal, grade, negative expectation,
source/helper code hash and maximum sparse-state count.

The scalar-augmented strict OAR algebra is a separate construction. Its maps
are not the restriction of the original CAR refinement on every ambient
sector. A local interval-net identification or finite-range lattice density
must not be inferred from this positive penalty or its vacuum metric.
