# Independent skeptical referee: supported Ising compiler

Review date: 2026-09-22. Reviewed another worker's `cft_machine/compiler/`;
this is not a self-review of the fermion benchmark.

**Final verdict: accepted for the explicitly specified supported modular-data
compiler and sampled-generator local reconstruction.** This is not a general
F/R-category compiler or a claim about a maximal all-sequences scaling net.

## Initial source and implementation findings

- `Cyclo16` implements rational polynomial arithmetic modulo z^8+1.
  The product reduction and conjugation formula correctly represent
  z=exp(pi*i/8); sqrt(2)=z^2-z^6 is consistent. Negative powers and general
  inverses are intentionally absent and not used by the matching algorithm.
- Seed fusion agrees with the local minimal-model formula at m=3;
  canonical spins 0,1/16,1/2 give the implemented twists. KL local source
  lines 1106–1157 supplies the exhaustive sector list and braided modular
  data, not just an analogy to the Ising fusion ring.
- Matching checks exact S, twists, fusion and the real c=1/2, including a
  unit-preserving nontrivial permutation. This correctly rejects Ising fusion
  alone, reverse chirality and a c-shift by eight. Input is modular data
  plus declared Ising factorization, not arbitrary F/R-defined categories.
- Character T includes a separately represented vacuum phase, which avoids
  pretending that exp(-2pi*i*c/24) belongs to Q(zeta_16).
- All factor stress families are retained. Their sum alone would not
  generate the product local net or certify its complete sector list.

## Required scope and interface resolutions

1. Public recipe construction must preserve the exact-match invariant;
   an unchecked `IsingRecipe` constructor would bypass the input validator.
2. Product labels must explicitly distinguish canonical sector tuples from
   relabeled input tuples, with their permutation exposed to callers.
3. OS Theorem 6.3 is correlation convergence. The local-net conclusion needs
   OS positive-energy smeared stress/unitary convergence (Theorem 4.16,
   Corollary 4.17) plus the KL vacuum representation/net construction
   (source lines 624–631). Finite output contains no wavelet-smearing engine.
4. If only the vacuum-cyclic stress subnet is constructed, identify the
   output as a **selected subnet**, not the whole graded or even field limit.
   Whole even-field equality with Vir_{1/2} needs its own local source.
5. For multiple factors, fixed points must use **factorwise parity Z2^k**.
   Total parity alone retains odd-times-odd fields and can enlarge the
   observable algebra beyond the product of individual Ising nets.
6. A fixed-point/inductive-limit argument for parity-equivariant sharp maps
   establishes an algebraic observable limit. Since sharp momentum maps
   are spatially nonlocal, this does not automatically prove equality of
   the interval-local continuum nets.

Resolution: the author added a validated inner recipe constructor and explicit
canonical/input product label maps; PROOF.md states the modular-data interface.
LOCAL_LIMIT.md defines the local reconstruction through sampled even fields,
proves both generator inclusions using L2 density and CAR continuity, and uses
the global NS even vacuum space H0 for all interval algebras. Factorwise parity
is encoded and tested. The direct even-net equality below closes the whole
specified observable-net identification; this is no longer merely a selected
stress-subnet assertion. The scope still excludes a maximal arbitrary-sequence
scaling net and the universal global observable algebra.

## Source-bridge audit while proof is completed

The new direct source
`references/cft-machine/realisation/LongoMartinettiRehren2009/source/LMR.tex:1165–1168`
explicitly identifies the even real free-Fermi net with Vir_{1/2}.
This resolves the strongest previously missing source identity.
`Bockenhauer1994/source.tex:324–350` defines represented interval algebras
through supported bilinears, and `:563–588` identifies the NS even vacuum
space. Its `:350–356` warns that the **universal** circle observable algebra
is not just the even global CAR algebra: the construction must remain
explicit about using the vacuum-represented interval net.

Smooth lattice sampling can prove convergence of each supported CAR
polynomial and reconstruct the intended local net by a dense set of
continuum generators. This is stronger than naming an abstract stress
subnet, but does not identify a maximal scaling net built from arbitrary
bounded sequences without a separate upper-inclusion theorem. The output
must say which local reconstruction it defines. Antiperiodic sections and
continuum measure normalization must be fixed before sampling is used.

## Independent audit of parent EQ-1 and EQ-2

Read `cft_machine/research/equivariant_oar.md` and its strict fixed-point
Lemma 2 dependency. **Accepted under their stated hypotheses.**
Equivariance and invariant microscopic states correctly preserve row limits;
restriction contracts dual norms. The GNS invariant-vector identification
uses the averaged dense cyclic vectors and is valid. The represented
weak-closure identity uses a finite weak-operator-continuous average and
is valid on the full representation space. The text correctly separates
that statement from the vacuum GNS space H^G, interval localization, and
sector-category claims. No unjustified passage from a global fixed algebra
to a local conformal net was found in these two conditional theorems.


## Final independent verification

Executed the stable restored implementation with one Julia/BLAS thread,
60-second command bound, and no many-body matrices:

- Exact Cyclo16/Ising compiler: **115/115**, 6.6 seconds.
- Concrete Majorana towers: **85/85**, 6.1 seconds.
- Factorwise-even observables/local sampling: **15/15**, 1.3 seconds.
- Additional independent anomaly and relabel transport: **13/13**, 1.2 seconds.

The extra invariants check (S Theta)^3=z I for the seed and z² I for the
two-factor product, and all four combinations of unit-preserving factor
permutations against the supplied input S/twists through the emitted product
permutation. These checks specifically catch character-versus-twist phase
confusion and incorrect label transport. The author separately mutation-proved
the cyclotomic reduction sign and twist acceptance guard; this review's green
run used the restored implementation.

Read both final proof files independently. LL-1's Riemann coefficient limits,
norm limit and weak-plus-norm argument establish strong one-particle sampling
convergence. The CAR norm estimate then establishes polynomial norm convergence.
LL-2 proves equality of the **defined** reconstructed interval algebra with the
even local CAR algebra, and the sourced NS/LMR statements identify its vacuum
net. The global H0 clarification and anti-linearity wording correction were
applied after review; they change no implementation. IC-2's paired ±r
calculation establishes that the compiler's sea is an actual ground state of
its chiral sine Hamiltonian, and does not conflate it with the two-component
Dirac Hamiltonian. The complete sector and product-net statements use the
correct KL and KLM hypotheses.

The finite sampler handles a seam-avoiding chart and assumes smooth compact
support; finite samples cannot certify these hypotheses for arbitrary Functions.
Other charts use the stated antiperiodic continuation of the known limit net.
No broadening beyond this declared reconstruction was accepted.

### Reproduce the additional reviewer checks

The original 13 extra assertions are preserved, without the main-suite
rerun, in `cft_machine/reviews/check_compiler.jl`. Run from the root:

```bash
OPENBLAS_NUM_THREADS=1 JULIA_NUM_THREADS=1 timeout 60 julia --project=. cft_machine/reviews/check_compiler.jl
```

`cft_machine/reviews/check_compiler.txt` records the standalone extraction
verification. The assertions are the same as the original inline review run;
only module loading and formatting changed.
