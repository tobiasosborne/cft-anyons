# H5 check bundle — P4, finite calibration only

All commands run from the repository root. No full Julia suite, network,
report build or commit was performed by this task. The largest numerical
carrier actually built is 512-dimensional; the full symbolic matrices are
2-by-2. The scripts use no bytecode output.

```bash
OPENBLAS_NUM_THREADS=1 python3 -B explorations/2026-10-27-astra-r4/H5-coarse-vector-zero-mode/checks/check_local_chain.py
python3 -B explorations/2026-10-27-astra-r4/H5-coarse-vector-zero-mode/checks/check_symbols.py
```

Raw outputs are `local_output.txt` and `symbols_output.txt`. Mutation
commands append `--mutate omit-second-term` and
`--mutate omit-matrix-commutator` respectively; their raw outputs are
`local_mutation.txt` and `symbols_mutation.txt`. Both mutations were run
before the corresponding successful baseline and exited 1 at the intended
invariant. Baselines exit 0. Package versions are in `environment.txt`.

**Headline:** exact local-current, translation-sector and differential-symbol
identities pass. A finite positive three-state chain has a rescaled defect
growing as N^2 on an explicitly transported vector; it fails A2/A3. A diluted
version has all four certificates proved below, with zero limiting modes.
Neither is a counterexample to Target 100.12.

## Three-state instance and conventions

This is an instance available for *every* unitary fusion category, using
O=1 direct-sum 1 direct-sum 1, with the first summand the pointed vacancy.
Orthogonal unit multiplicities are justified by
`references/text/PenneysUnitaryFusionCategories.md:219-237,442` and
CONVENTIONS (am). No model-specific fusion identity enters.

On the two-dimensional active space use the displayed Pauli matrices of
CONVENTIONS (m); the script also asserts XY=iZ. Let P_act project onto the
active space and extend X,Z by zero on the vacancy. The full two-site density is

    k = X tensor X + (1/2) Z tensor Z
        + (1/4)(Z tensor P_act + P_act tensor Z)
        + 2 P_act tensor P_act.

On two active sites its eigenvalues are
1/2, 5/2, (5-sqrt(5))/2, (5+sqrt(5))/2; it is zero on all other occupation
blocks. These follow by diagonalizing the even and odd 2-by-2 blocks of the
explicit 4-by-4 matrix. Hence k>=0 and ||k||<4. It is invariant under swapping
the two sites. Translation shifts sites by +1; linear parity maps x to 1-x.
Thus P k_j P*=k_-j. The period N is always at least 6.

Use the full finite Hilbert spaces H_N=(C^3)^{tensor N}, N=6,7,8,...,
append-vacuum refinement J_N v=v tensor |vac>, K_N=I, real subtractions
epsilon_N=b_N=0 and velocity 1. This is a declaration for the example,
not the general microscopic refinement scheme. The distinguished vector
v in H_6 has the first five sites active, with active bits |10000>, and
the last site vacant. Refinement appends vacancies.

Every density preserves each occupation pattern. Computation restricts to
the reducing subspace consisting of all N cyclic placements of this active
five-site block and all 2^5 internal spin states. Its dimension is 32N.
Translation and parity preserve this subspace, and the chosen transported
vector lies in it. These *restricted spaces are not the refinement tower*:
append-vacuum refinement of an arbitrary wrapped block need not stay in the
restricted space. The declared full H_N, not this computational restriction,
is the carrier used in the all-scale argument below.

On the distinguished occupation block, H is the sum of four open-chain
active bond matrices and Q=i sum_(j=0)^2 [k_j,k_(j+1)]. Direct multiplication
on |10000> gives only four nonzero entries of [H,Q]v:

    bit index 8: -9i/4; 16: 4i; 19: 15i/4; 28: -4i.

The binary indices are big-endian and zero-based. Thus
||[H,Q]v||^2=409/8 exactly, independently of N>=6. The script asserts these
entries, independently assembles the translated ring matrices, and verifies
the three-site identity, both Fourier covariance laws, adjoints, parity,
the Gram formula (H5.4), and spectral-projection formula (H5.6).

## Why the unscaled instance is not a counterexample

Its zero-mode action on the refined vector is

    L_(N,0) J_(N<-6)v = N/(4 pi) (H_block-Q_block)v.

The fixed vector on the right is nonzero. With K=I this already violates
A2. Adjacent N->N+1 refinements have the same strictly positive norm defect
||(H_block-Q_block)v||/(4 pi), so A3 is not summable either. This is an
analytic failure at all sizes, not merely an inconclusive numerical fit.
The measured rescaled commutator is exactly
N^2 sqrt(409/8)/(8 pi^2), as reported in `local_output.txt`.

## All-scale certificate for the diluted check (zero representation)

Replace every k_(N,j) by lambda_N k_j, lambda_N=N^-4, preserving the entire
full carrier, refinements, K, parity and translation. The new current is
lambda_N^2 Jcal_j. This is a calibration of H5's hypotheses, not a proposed
nontrivial continuum theory. Tags: periodic/full; L0 unit multiplicities;
trivial algebraic R2, no new local physical R1/R3/R4 statement.

**ASSUME** the preceding full finite system. **PROVE** both A1–A4, with
c=c*=0 and all limiting modes zero.

**<1>1 (A1).** J_N appends a unit vector, so is an isometry, and K=I
transports exactly. U^N=I and parity is a complex-linear unitary; both
commute with K. **BY** their tensor-basis permutations.

**<1>2 (A2).** Since ||k_j||<=4 and
||i[k_j,k_(j+1)]||<=2*4^2=32, each prescribed mode, in either family,
at every integer n satisfies

    ||T_(N,n)||, ||Tbar_(N,n)||
       <= M_N = N^2(4 lambda_N+32 lambda_N^2)/(4 pi)
       = N^-2/pi + 8 N^-6/pi.

With K=I every graph norm is the ordinary norm. The maximum M_6 bounds
A2 uniformly in N,n,s. Adjoint pairing follows from self-adjoint densities
and currents and conjugation of Fourier phases. **BY** triangle inequality.

**<1>3 (A3).** The full operator refinement defect is at most
e_N=M_(N+1)+M_N. Its sum over N>=6 converges by the displayed inverse-square
bound. No assumption about preservation of the small computational sector
is used. **BY** isometry of J and <1>2.

**<1>4 (A4).** For every fixed m,n and both families the zero-ledger
residual norm is at most

    2 M_N^2 + |m-n| M_N -> 0.

This verifies all finite carriers and all graph orders. **BY** the product
bound and <1>2. The same bound works for the reversed S indexing.

**<1>5.** M_N->0, so every limiting mode is zero. The actual rescaled
current defect on the fixed transported vector is lambda_N^3 times the
unscaled value, hence proportional to N^-10. **BY** the linear density and
quadratic current scaling. **QED.**

## Differential symbols

`check_symbols.py` verifies the general coefficient calculation against
generic Leibniz composition, using noncommuting variable Hermitian polynomial
matrices. It rejects removal of i[A,H]. Its separate periodic check uses
rotated orthogonal rank-one projections, nonzero first-derivative improvements
and constant connection terms. Both internal brackets and the two mixed
products are checked exactly for three mode pairs. These checks calibrate
H5-SYMBOL's displayed proof; no physical symbol homomorphism is inferred.

## Review and provenance

The common-annihilation-core proof was checked by two independent read-only
research collaborators. A separate skeptical collaborator checked the local
defect, graph powers and full differential-symbol theorem, including the
actual-operator-algebra and central-kernel qualifications. The primary agent
recomputed the matrix expansion and support equations before recording them.
This is an internal mathematical check, not the anticipated later Opus review.

Source dependencies are those in NOTE.md. The cubic local equation also
appears in CA-78 Theorem 78.5; the current-decay application does not prove
Yang--Baxter sufficiency or criticality. All numerical outputs here have a
displayed invariant or exact vector oracle; none establishes a continuum
limit by extrapolation.
