# Independent skeptical referee: finite-section coset stress construction

Review date: 2026-09-22. Scope: another worker's `research/coset_route.md`
and its sparse coset witnesses. This does not review the reviewer's own
fermion benchmark.

**Final verdict: CR-1, CR-2 and CR-3 accepted for the stated finite-section
stress construction.** Both finite-cutoff proof details returned during
review were repaired and independently checked.

## Mathematical audit

1. The current normalization is consistent: t^a=sigma_a/2 gives
   Tr(t^a t^b)=delta_ab/2, hence integer level l has central term
   (l/2)p. GKO's affine central coefficient is l/2 and adjoint Casimir 2,
   so its 1/(2 beta) is 1/(l+2). This agrees with the declared source
   normalization and gives c=3l/(l+2).
2. Positive current modes lower the **auxiliary free excitation energy**
   by exactly their index at every finite no-wrap cutoff. Positivity of
   that energy proves annihilation for p>e. This is an exact spectral
   grading argument; it does not assume approximate lattice Virasoro.
3. The omitted current-sum terms have one positive index above e when
   R>e+|n|. Current-mode normal ordering puts that factor on the right,
   so the entire tail vanishes on P_e. Retaining contraction terms through
   ordinary CAR multiplication is essential; a fully fermion-Wick-ordered
   quartic substitution would not be the same construction.
4. On a finite-energy vector, non-sea occupations occur only at |r|<=e.
   Pauli exclusion kills transitions between fully occupied or fully empty
   distant modes, while Fermi crossings lie within the stated shifted
   window. This proves finite-section agreement for each retained current
   product. The extension to fixed words tracks intermediate energy and is
   valid. No uniform statement on the full finite Hilbert space follows.
5. The diagonal schedule R_M=floor(M/8) satisfies the asymptotic conditions
   for each fixed e,n. This is an explicit controlled diagonal limit, not
   an unjustified interchange of infinite sums.

## Repairs requested

- Zero current indices need their own adjointness case. With the normal
  ordering convention treating zero as nonnegative, pairing p and n-p
  does not literally produce both orders after adjoint at the zero boundary.
  The conclusion is repaired by the exact identity [J_0^a,J_p^a]=0 for
  each fixed component, including the finite cutoff: the zero-mode matrix
  has identity momentum part and the same t^a, with no zero-mode cocycle.
- The proof already supplies the sharper safe-window condition
  M/2-1/2>e+2R. Using the more conservative e+2(R+|n|) excluded all
  nonzero-mode theorem-certified samples within M<=16,R>=3. The sharper
  condition admits M=16,R=3,e=0,|n|=2 without expanding compute budgets.

## Scope boundary accepted

The continuum GKO theorem gives the stated minimal-series stress family
inside the ambient current theory. It does not identify the whole ambient
fermion observable theory with a minimal model. The note explicitly retains
charge and other spectator degrees of freedom, requires numerator vacuum
subnet and diagonal-current coset extraction, and does not assert that finite
commutants commute with refinement. Positivity or locality of the finite
quartic coset Hamiltonian and its ground states also remain open. These
boundaries are necessary and correctly limit the claimed advance.


## Repair verification and CR-3

The final CR-2 now states M/2-1/2>e+2R and explicitly handles zero-mode
pairs through [J_0^a,J_p^a]=0. Its asymptotic schedule remains valid.
CR-3's vacuum-specific condition R>=n, M/2-1/2>n is also correct:
any nonzero normally ordered term on the vacuum has two strictly negative
indices, whose magnitudes sum to n. Zero modes annihilate the filled
color-singlet sea; positive modes annihilate by energy. Each intermediate
excitation is supported inside |r|<=n, proving the claimed exact vacuum
identity. The producer distinguishes this certificate from the more
conservative general energy-core one.

## Independent sparse implementation verification

Read the stable exact implementation, tests, and embedding derivation.
The canonical wedge sign and sea-normalized insertion phase agree: each
inserted occupied lower orbital contributes one sign, and division by the
reference-sea sign fixes the vacuum image. The auxiliary odd insertion is
necessary because paired-flavor physical windows have even added-left
counts. This is a meaningful test of the general phase helper, not evidence
of a new physical model.

Executed the restored sparse suite with one thread and a 60-second cap:

- CAR and embedding: **54/54**, 0.5 seconds.
- Affine current signs/level: **4/4**, below 0.1 seconds.
- GKO vacuum central invariants: **69/69**, 2.3 seconds.
- Largest observed intermediate vector: **96 sparse states**.

Additional independent boundary checks: **18/18**, 2.0 seconds, largest
vector 80 states. These checked [J_0^a,J_±2^a]=0 for all components on
both a low-energy one-particle excitation and an excitation at the UV edge,
and checked finite stress adjoint pairings for n=1,2,3 on those states.
They specifically exercise the zero-mode and finite-boundary subtlety
identified during review, beyond the vacuum-only tests.

The author's restored mutation record detects the incorrect Sugawara
denominator (16 failures) and missing occupation-dependent insertion phase
(13 failures). No dense many-body matrix or diagonalization was used.

The exact squared norms 1/4,1 for k=1 and 7/20,7/5 for k=2 match the
c=1/2 and c=7/10 vacuum central invariants. These finite witnesses support
the specified stress-family construction. The accepted result still does
not construct a local minimal-model Hamiltonian, a coset observable OAR
system, or a category-faithful limit of the whole ambient fermion model.

### Reproduce the additional reviewer checks

The original 18 extra assertions are preserved in
`cft_machine/reviews/check_coset.jl`. Run from the root:

```bash
OPENBLAS_NUM_THREADS=1 JULIA_NUM_THREADS=1 timeout 60 julia --project=. cft_machine/reviews/check_coset.jl
```

`cft_machine/reviews/check_coset.txt` records the standalone extraction
verification, including the maximum sparse-state count. The assertions are
identical to the original inline review run; only loading and formatting changed.
