# H4 finite checks

Pillars P1/P4; KS identities also constrain the P1/P2 interpretation.
These are finite algebraic/spectral checks of NOTE.md, not conformal-limit
certificates or category-specific research results.

From the repository root:

```bash
OPENBLAS_NUM_THREADS=1 python3 explorations/2026-10-27-astra-r4/H4-density-dilution-criticality/checks/run_checks.py
```

Headline: **3 GREEN programs; 8 intentional RED mutations caught; largest
dense matrix 256×256.** The runner writes all stdout/stderr to named text
files and records commands, expected/actual exit codes, elapsed seconds,
source/output SHA256 hashes, Python and package versions in `manifest.json`.
Each subprocess has a 90-second timeout. BLAS and OpenMP use one thread.
No Julia, network, large matrices, or files outside this directory are used.

| Script | Assertions and independent oracle | Size / tolerance |
|---|---|---|
| `algebra_checks.py` | Exact V isometry; total-number and every sector identity; density halving; unital counterexample; trace compatibility; neutral-pair refill and grading | SymPy rational matrices, max 16×16, exact equality |
| `spectral_checks.py` | Path-Laplacian eigenvalues versus closed formula; symbolic basis cancellation; positive quartic symbol determinant and Taylor series; interacting twist identity/min-max | NumPy max 128×128; absolute tolerance 2e−10; asymptotic ratio error <3e−4 at L=64 |
| `ks_checks.py` | Exact 3-site current-improvement identity; Fourier sine sum versus direct matrix commutator; density bound; empty-mode action and both B4 probe formulas | SymPy 8×8 exact; NumPy max 256×256; absolute tolerance 2e−8 |

`spectral_checks.py` uses an open path Laplacian with endpoint diagonal 1
and interior diagonal 2. Its internal matrix is
T=[[2,1/3],[1/3,1]], positive on Hom(y,y⊕y) for arbitrary simple y.
The displayed symbolic F is an orthogonal basis change, not claimed
categorical associator data. The interacting ring uses L=8, N=2, hopping
phase 0.31 and contact 0.7. These are declared calibration parameters.

`algebra_checks.py` orders words lexicographically and uses ordinary matrix
trace in the two-grade instance. Its neutral ancilla rotation has
sinθ=4/5, cosθ=3/5. Grade addition is sourced at
`references/text/PenneysUnitaryFusionCategories.md:321`; all-charge matrices
include both total grades. The last check proves commutation on the larger
full matrix algebra, hence on its grade-preserving categorical subalgebra.

`ks_checks.py` uses site j as bit j, with local matrix factors in the
explicit `sites` order, and Fourier phase exp(+2πimj/L). Its random vector
seed is 27042026. The positive local density is M†M on the three occupied
two-site states, zero on the empty state; the script records M explicitly.
Adding A_j−A_(j+1) changes the chosen density while preserving the periodic
Hamiltonian. No VR-1 certificate is asserted for this calibration.

Mutations are isolated command-line branches; the ordinary implementation
stays unchanged. Every RED log contains the intended AssertionError:

| Mutation | Deliberate error caught |
|---|---|
| `number` | Replace N_f V=V N_c by N_f V=2V N_c |
| `pullback` | Impose the brief's false arbitrary-state density identity |
| `refill` | Halve the exact pair-refill coefficient |
| `laplacian` | Change the path endpoint completion |
| `quartic` | Change off-diagonal sin(k) coefficient to 9/10 |
| `twist` | Delete the factor two in the twist second difference |
| `sine` | Reverse the Fourier commutator sign |
| `current` | Reverse the density-improvement/current sign |

The first exploratory `pullback` run was RED before the bundle was built.
The saved runner repeats it reproducibly. Every mathematical claim beyond
these finite identities relies on the structured proofs in NOTE.md.
