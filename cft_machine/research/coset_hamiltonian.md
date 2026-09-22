# Coset Hamiltonians: a negative raw witness and positive extracted dynamics

Status: local derivations from the finite CAR/coset recipe, with an explicit
nonlocal Hamiltonian construction. The original quartic zero mode is not
positive at finite cutoff. Vacuum-descendant extraction repairs positivity
for a different, globally constrained family; it is not a finite-range repair.
Conventions: (z), (aa). Source map:
`references/cft-machine/coset-hamiltonian/SOURCES.md`.

Sources and dependencies:

- `references/text/CFTFromLatticeFermions.txt:694–714`: CAR/Fock signs;
  `:738–745`: filled-sea quasi-free states; `:879–892`: normal ordering.
- `references/cft-machine/virasoro/GoddardKentOlive1986/source.txt:123–217`:
  affine, Sugawara and coset normalization and the Virasoro relations.
- `references/cft-machine/realisation/KawahigashiLongo2002/source.tex:1008–1024`:
  continuum coset net identification, not a microscopic projection theorem.
- Local CR-1–CR-3, `cft_machine/research/coset_route.md`: exact finite-core
  identities, grade transport, finite adjoints and vacuum descendants.

## Proposition CH-1: an explicit negative expectation of the raw zero mode

ASSUME k=1, M even, 0<=R<M, with C_(M,0,R) the unmodified finite coset
stress polynomial. Let v be the normalized occupation ket with flavor 1
filled at every momentum in both copies and flavor 2 empty, per (aa).
PROVE

`<v,C_(M,0,R)v> = -(M-R)(M-R-1)/12`.

Consequently the raw Hermitian C_(M,0,R) is not positive if R<M-1.
Since the sea has zero raw energy, it is then not a ground state.

<1>1. Compute the zero-current contribution using the CAR directly.
  <2>1. In either copy, J_0^3 v=(M/2)v. Each of J_0^1 and J_0^2 flips
  one occupied flavor-1 orbital into flavor 2, with M mutually orthogonal
  terms of squared amplitude 1/4. Thus
  `sum_a ||J_0^a v||^2=M^2/4+M/2`.
  <2>2. The two-copy cross inner product is nonzero only for a=3, where
  it is M^2/4. Hence the diagonal sum D has zero-mode squared norm M^2+M.
  <2>3. The two numerator coefficients are 1/3 and the diagonal coefficient
  is 1/4. Their zero-mode contribution is
  `2(M^2/4+M/2)/3-(M^2+M)/4=-M(M-1)/12`.

<1>2. Compute each positive-current contribution for 1<=p<=R.
  <2>1. There are M-p retained no-wrap transitions. J_p^1 and J_p^2
  each create M-p mutually orthogonal flavor flips of squared amplitude
  1/4. J_p^3 v=0, since both its possible source/destination flavors are
  simultaneously occupied or empty. Thus each copy contributes (M-p)/2.
  <2>2. Different-copy flipped states are orthogonal; D contributes M-p.
  Normal ordering at n=0 counts the p and -p terms twice, giving
  `2[(M-p)/3-(M-p)/4]=(M-p)/6` to the coset expectation.
<1>3. Add <1>1 and sum <1>2 over p=1,...,R. Elementary finite summation
reduces the result to `-(M-R)(M-R-1)/12`.
<1>4. QED BY <1>1–<1>3. A negative expectation already disproves positivity;
no eigenvalue computation or many-body diagonalization is required.

This vector is ultraviolet: its auxiliary energy is M^2/2 for two copies.
Thus CH-1 does not contradict CR-2 on fixed low free-energy cores. It exposes
precisely why the missing high-current tail matters for the full finite
Hamiltonian even though that tail eventually vanishes on each fixed core.

## Theorem CH-2: finite vacuum modules are computably nested

ASSUME integer b>=0. Use R_b=2b+1 and M_b=16(b+1) only as the analytic
safe-window schedule of (aa). Let W_b be all finite words
`C_-n1 ... C_-nt Omega` with positive integer n_i and total grade <=b,
including the empty word Omega. Construct them with the finite polynomials
at (M_b,R_b). Let V_b be their span and P_b its orthogonal projection.
PROVE these vectors, their Gram matrices and V_b are finite and exactly
computable; sea embeddings give V_b subset V_B for B>=b; E and C_0 agree
on V_b and have only nonnegative integer eigenvalues there, with unique
zero-grade vector Omega.

<1>1. The construction terminates and is exact.
  <2>1. There are finitely many positive-integer compositions of grades
  <=b, and each finite CAR polynomial acts on a finite occupation space.
  All coefficients are complex rationals in convention (z).
  <2>2. Every intermediate word vector has auxiliary energy its partial
  total grade <=b. Each mode has magnitude <=b. We have R_b>2b and
  `M_b/2-1/2=8b+15/2 > b+2R_b=5b+2`.
  Hence CR-2 identifies each finite word with its continuum word exactly,
  without using a numerical extrapolation.
  <2>3. Exact Gaussian elimination on the Gram matrix selects independent
  nonzero columns; zero Gram directions are actual zero vectors in the
  positive ambient Hilbert space. If U collects the selected vectors and
  G=U*U, the projector is `P_b=U G^(-1)U*`. No choice of a numerical rank
  tolerance or irrational orthonormalization is needed.
  <2>4. QED BY <2>1–<2>3. This is an effective finite algorithm with no
  efficiency claim; large-b instances have not been run on the laptop.

<1>2. The finite vacuum modules embed exactly.
  <2>1. Every word in W_b also appears in W_B. Both finite realizations
  equal the same continuum vector by <1>1. Their sea-preserving embeddings
  therefore identify these words and preserve every Gram inner product.
  <2>2. Restriction of the ambient sea isometry gives J_Bb:V_b->V_B.
  Composition holds on the spanning words, hence on all of V_b.
  <2>3. QED BY <2>1–<2>2. This does not assert P_B J=J P_b on the whole
  coarse Fock space when B>b: additional descendants may have components
  in the image of its previously discarded subspace.

<1>3. The grade is the Hamiltonian on the extracted module.
  <2>1. The sourced Virasoro relation gives `[C_0,C_-n]=n C_-n` and
  C_0 Omega=0. Thus C_0 acts on each word by its total grade.
  The free-energy commutator in CR-2 gives the identical action of E.
  <2>2. E is self-adjoint and distinct grades are orthogonal. V_b is
  therefore reducing for E, and E|V_b=C_0|V_b is nonnegative.
  <2>3. The only grade-zero word is Omega. Hence its zero eigenspace
  is exactly C Omega. QED BY <2>1–<2>2.
<1>4. QED BY <1>1–<1>3.

At b<=3 a complete independent basis is Omega, with C_-2 Omega added
when b>=2 and C_-3 Omega when b>=3. C_-1 Omega=0; the only additional
nonzero grade-three ordering reduces to C_-1 C_-2 Omega=C_-3 Omega by
the Virasoro bracket. The sourced norms c/2 and 2c are positive for k=1,2.
The smaller CR-3 windows certify these vectors at M=8,16; they do not claim
the general safe schedule M_b=16(b+1) was numerically executed.

## Theorem CH-3: positive finite Hamiltonian and compatible ground states

ASSUME CH-2. On the full finite Fock space set
`H_b^ambient=P_b E P_b+(b+1)(1-P_b)`.
On the independent-scalar observable algebra use
`H_b^obs=(E|V_b,b+1)` in `B(V_b) direct-sum C`.
PROVE both are positive and have unique vacuum ground state, and their
vacuum-sector dynamics agrees exactly with C_0 on every extracted grade.

<1>1. Decompose the ambient Hilbert space into V_b and its orthogonal
complement. The operator is E|V_b on the first block and the positive
number b+1 on the second BY the displayed formula and CH-2.
<1>2. CH-2 identifies the kernel in the first block as C Omega, and the
second block has no kernel. The scalar direct-sum realization has the same
block argument. Its ground functional is omega_b(a,lambda)=<Omega,aOmega>.
<1>3. On V_b, exponentiation gives the exact phase exp(it q) at grade q.
Embeddings J_Bb preserve grades and Omega BY CH-2; ground states and
vacuum-sector dynamics therefore intertwine.
<1>4. QED BY <1>1–<1>3. These are positive **different** Hamiltonians,
not a proof that the raw quartic C_(M,0,R) is positive.

The scalar-augmented strict OAR algebra and its full dynamics are analyzed
independently in `coset_observable_system.md`. Its refinement is unital
because its independent scalar fills the new shell. In particular, the
finite Hamiltonians themselves need not intertwine: their differences on
new shells commute with the embedded coarse observable algebra.

## Obstructions that the positive repair does not erase

**Spatial locality.** P_b is a global vacuum-descendant projector, computed
from full-chain vectors. The finite Hamiltonian is explicit in a microscopic
Fock representation, but this proof supplies no finite-range density or
scale-independent spatial support estimate. A positive energy penalty does
not repair locality by itself.

**This is a new observable prescription.** The original unital CAR refinement
acts as a tensor-identity inclusion on added modes. In an ambient Fock
representation it increases the rank of an old rank-one projector by the
new-mode multiplicity. The scalar-augmented map sends (a,0) to J a J*,
which preserves that rank and selects the added sea. Thus it is generally
not the restriction of the original CAR refinement to these projected
algebras. Its coherence must be proved for the new prescription explicitly.

**Ambient Hamiltonian limit.** In the common sea Hilbert space H let P be
the projection onto the closure of the union V_b. Embedded finite resolvents
satisfy
`i_b(H_b^ambient+i)^(-1)i_b*=P_b(E+i)^(-1)P_b
                              +(b+1+i)^(-1)(i_b i_b*-P_b)`.
The second term tends to zero in norm and the first tends strongly to
`P(E+i)^(-1)P`. This is the desired resolvent on P H, but has kernel
(1-P)H on the ambient space and is not a densely defined self-adjoint
operator's resolvent there. The kernel is nontrivial: a charged one-fermion
excitation is orthogonal to every vacuum-descendant word, since the currents
and stress polynomials preserve the separate copy charges. Restricting to
the vacuum module is consequently essential, not a cosmetic identification.

The independent scalar OAR construction incorporates this restriction through
its vacuum GNS representation. Whether its interval-supported bounded stress
reconstruction yields the desired local minimal net is a further theorem,
not supplied by positivity or CH-2 alone. No arbitrary MTC is addressed here.

**Next direction requested by the user.** Pursue a local model on a categorical
fusion-space basis that incorporates the admissibility constraints directly.
The global nature of P_b is not a no-go theorem against that approach. At
present V_b is a computed vacuum-descendant subspace of fermion Fock space;
its identification with a categorical fusion-path space and a local action
of Hamiltonian/stress operators on that space have not been proved.
