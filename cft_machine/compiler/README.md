# Exact Ising data → microscopic lattice compiler

This is a supported positive construction for the standard **chiral Ising
modular datum and explicitly declared tensor products**. It matches S, twists,
fusion and the selected real central-charge lift exactly, then constructs
actual finite Majorana Hamiltonian/mode coefficients, ground-state covariances,
CAR refinements and factorwise-even observable generators.

The local OAR reconstruction is specified and proved in [LOCAL_LIMIT.md](LOCAL_LIMIT.md).
Its output is the NS vacuum even-Fermi interval net, identified by a registered
source with Vir_1/2, or the tensor product of these nets. [PROOF.md](PROOF.md)
connects the microscopic construction, source convergence theorems, and the
complete modular data. These are structured mathematical proofs and theorem
applications, not proof-assistant certificates or inferences from finite fits.

```julia
include("cft_machine/compiler/IsingCompiler.jl")
using .IsingCompiler
input = ising_datum()                     # chooses the c=1/2 conformal lift
recipe = compile_ising(input)             # exact S,Theta,fusion,c recognition
finite = realize(recipe, 8, [-2,-1,0,1,2])
finite.factors[1].hamiltonian              # actual self-dual CAR polynomial
finite.factors[1].factor_modes[2]          # actual modified lattice KS mode
finite.refinement.finite_preview          # actual 8→16 CAR embedding
finite.observable_algebra                 # full factorwise-even CAR policy

renamed = relabel(input,[1,3,2]; labels=["vacuum","fermion","spin"])
product = compile_product([input,renamed]) # input declares a tensor product
modular = product_modular_data(product)
finite2 = realize(product, 16, [0,1,2])
```

`ModularDatum(labels,S,theta,fusion,c)` accepts exact `Cyclo16` or rational
entries, with the unit first. `Cyclo16` uses BigInt rational polynomials
modulo z^8+1, z=exp(pi*i/8). It never accepts floating closeness as fidelity.
The selected lift is c=1/2 per factor; another prescribed lift is unsupported.
Character T is represented by the exact pair `(phase_exponent=-c/24,twists)`,
since its vacuum phase generally lies outside this cyclotomic field.

**Output sectors use canonical lexicographic order**, even for relabelled
input. `input_labels_for_canonical` and `input_product_to_canonical` give the
complete translation. The recipe retains every factor stress family and
also emits placed sums for total H and total stress. The total stress alone
would generate only the diagonal Virasoro subnet, with different sector data.

The lattice observable algebra imposes parity independently in each factor.
In particular, an odd field from each of two factors is excluded; total
parity alone would admit it and enlarge the target. `observable_word` checks
this exact grading, and `sample_local_field` implements compactly supported
real-section sampling in a seam-avoiding antiperiodic chart. Its finite sample
check does not certify that an arbitrary supplied function is smooth or has
compact support. Those are explicit hypotheses of the local-limit proof.

The compiler reads the modular/fusion shadow of categorical input. It does
not verify arbitrary F/R coherence, infer factorization, or claim that matching
modular data proves braided equivalence. Opposite twists, another lift or an
unsupported datum fail loudly. There is no generic interacting-category
backend. Sharp refinements are unital CAR maps with sinc spatial tails;
locality of the reconstructed net follows from the separate sampling proof.
The output is a represented interval net, not the universal global net algebra.

Run locally from the repository root:

```bash
OPENBLAS_NUM_THREADS=1 JULIA_NUM_THREADS=1 timeout 60 julia --project=. cft_machine/compiler/test.jl
OPENBLAS_NUM_THREADS=1 JULIA_NUM_THREADS=1 timeout 60 julia --project=. cft_machine/compiler/run.jl
```

The run bundle is [runs/2026-09-22/](runs/2026-09-22/): exact-matching verdicts,
finite Schwinger witnesses, explicit polynomial/spatial Hamiltonian/mode
recipes, covariance and refinement data, code SHA256 values, passing tests
and two rejected mutations. The mutations corrupt cyclotomic reduction and
remove the twist-matching guard. Both are restored before the final run.
The independent Majorana backend additionally mutation-tests its half-cocycle.

Finite previews use k<=2 and M<=16 per factor. At M=16 the exact next-refinement
rule is returned without materializing a 32-site preview. Product matrix
expansion has a default rank-nine budget; declared factor recipes stay
factorized. No many-body matrices or full package test suite are used.
