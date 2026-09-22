# Exact sparse-CAR coset stress witnesses

This backend evaluates the explicit current-Sugawara-difference recipe of
`cft_machine/research/coset_route.md` for k=1,2 (minimal-series m=3,4).
It uses exact complex rational amplitudes on sparse occupation bitstrings.
There are no dense matrices and no diagonalization. These are stress-generator
witnesses inside a larger fermion theory, not a local coset lattice CFT.

Sources: root CONVENTIONS (z); CAR and canonical wedge signs in
`references/text/CFTFromLatticeFermions.txt:694–714`, Eqs. (2)–(3);
current/Schwinger source anchors in CR-1 of the research note; GKO
`references/cft-machine/virasoro/GoddardKentOlive1986/source.txt:123–217`.
The research note's CR-2 and CR-3 give the distinct cutoff certificates.

Run from the repository root, each with a 60-second cap:

```bash
OPENBLAS_NUM_THREADS=1 JULIA_NUM_THREADS=1 timeout 60 julia --project=. cft_machine/benchmarks/coset/test.jl
OPENBLAS_NUM_THREADS=1 JULIA_NUM_THREADS=1 timeout 60 julia --project=. cft_machine/benchmarks/coset/run.jl
```

The budget is k=1,2, M=8,16, |n|<=3, R=3,4 and at most 5000 intermediate
sparse states (hard assertion). The largest basis label has 96 occupation bits;
this is not a 2^96 allocation. The checked test run reached 96 sparse terms
at most. `runs/2026-09-22/` contains the producer output and test/mutation logs.

## Exact headline findings

| k | GKO c | Squared norm, mode -2 | Squared norm, mode -3 |
|---|---|---|---|
| 1 | 1/2 | 1/4 | 1 |
| 2 | 7/10 | 7/20 | 7/5 |

Both M=8 and 16 and both current cutoffs give these exact values. The source
oracle is the GKO Virasoro relation plus C_n Omega=0 for n>=-1 and C_0 Omega=0:
`||C_-n Omega||^2=c(n^3-n)/12`. No fitted c enters the implementation.
The k=1 central invariant agrees with the separate Ising/Majorana benchmark;
this compares the sourced invariant, not equality of the two lattice systems.

The tests additionally check canonical CAR signs, an imaginary noncentral
SU(2) current bracket, level addition, vacuum annihilation, adjoint pairings,
raising a descendant back to its central vacuum component, and sea-normalized
refinement of descendant states. They compare R=3 and4 rather than silently
identifying the current cutoff with the lattice cutoff.

The producer reports two certification flags. `general_CR2_threshold` uses
R>|n| and M/2-1/2>2R on the vacuum core; only the applicable rows assert it.
`vacuum_CR3_threshold` uses the sharper proved vacuum-descendant condition
R>=|n| and M/2-1/2>|n| and holds for every output row. Raised-state identities
are exact finite regression witnesses; they are not advertised as covered by
the general CR-2 sufficient window. This benchmark does not test a full
finite-matrix Virasoro algebra, group integration, or a coset observable net.

## Sea-preserving embedding sign

ASSUME a sorted injection of coarse orbitals into fine orbitals, a set B of
added occupied orbitals disjoint from its image, and reference coarse sea S.
The canonical occupied ket has creation operators in increasing index order.
PROVE that the CAR-intertwining embedding sending the coarse sea to the fine
sea multiplies occupation state A by
`(-1)^(sum_(i in A)d_i-sum_(i in S)d_i)`,
where d_i counts added occupied orbitals below the image of i.

<1>1. Start with the fine ket occupying precisely B. Apply mapped coarse
creators in increasing canonical order (the rightmost acts first).
Each creator crosses exactly d_i added occupied orbitals; creators already
applied have larger coarse indices and cause no additional crossings.
<1>2. The resulting sign on A is (-1)^(sum_(i in A)d_i). Dividing by its
value on S normalizes the sea image with coefficient +1.
<1>3. Creation at a coarse orbital acquires the ratio (-1)^d_i between its
two occupation sectors, exactly compensating the d_i added lower occupied
fine orbitals in the CAR sign. Annihilation follows by reversing the action.
<1>4. QED BY <1>1–<1>3. Composition follows by adding the counts for the
successively added occupied orbitals, with the same sea normalization.

With this physical ordering the paired-flavor M=8→16 sea insertion happens
to have even d_i. To test the general sign implementation meaningfully, the
suite also uses an auxiliary two-orbital→three-orbital injection with one
added occupied orbital before the image. It checks odd as well as even
states and composition. This tiny algebraic witness is not a new physical
lattice model or a change to the registered orbital order.

## Mutation evidence and remaining boundary

Port-and-verify mutations changed `1/(level+2)` to `1/(level+3)` (16 failed
stress assertions) and omitted the occupation-dependent embedding phase
(13 failed CAR/intertwining assertions). Both implementations were restored;
the final test log is green. The embedding guards also reject occupation bits
outside the declared map rather than silently dropping them.

A local microscopic Hamiltonian with these stress modes, global finite-scale
positivity, removal of ambient spectator degrees of freedom, and coherent
coset OAR algebras remain open. The exact witnesses and CR-2/CR-3 address the
operator construction and its cutoff control, not those missing interfaces.
