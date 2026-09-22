# Second-pass Ising audit: OAR, locality, and the omitted Fermi point

**Verdict:** the supported branch is an actual instance of the specified
sharp-momentum OAR construction, not merely a fit of lattice central terms.
Its local-net identification can be strengthened by the upper-inclusion lemma
below. The branch is **not** an all-low-energy spectral scaling theorem:
the sine Hamiltonian has another low-energy Fermi edge discarded by this RG.
The refinement and the chiral target must remain explicit output data.

Read against current code, `compiler/{PROOF,LOCAL_LIMIT}.md`, CA-82,
and the following exact local sources (not frozen referee summaries):

- OS: `references/text/CFTFromLatticeFermions.txt:1451–1558`,
  equations (86)–(94) and Definition 3.1; `:1700–1752`, Definition 3.5
  and Proposition 3.6; `:1843–1894`, sharp refinement and its nonlocality;
  `:3379–3420`, modified modes; `:3483–3530`, mode/unitary/dynamics limits.
- KL: `references/cft-machine/realisation/KawahigashiLongo2002/source.tex:403–407`,
  Haag duality of the vacuum local net; `:624–635`, vacuum Virasoro net;
  `:1106–1157`, the complete minimal-net sector data.
- LMR: `references/cft-machine/realisation/LongoMartinettiRehren2009/source/LMR.tex:1165–1168`,
  even real-Fermi net equals Vir_{1/2}.
- BO: `references/cft-machine/realisation/Bockenhauer1994/source.tex:324–356,563–588`,
  interval bilinears, universal-circle caution, and NS even vacuum space.

Conventions: (w),(x),(y),(z),(ab). The mathematical lemmas here add no
alternative lattice normalization or change of representation.

## Audit A: matching the source OAR definition

OS (86)–(88) constructs the global CAR limit from coherent isometric
one-particle refinements, with conjugation compatibility in the Majorana
case. The compiler supplies exactly these maps in orthonormal momentum
coordinates. Its map is the CAR homomorphism, not a Hilbert-space corner.
OS (89)–(90) defines Wilson rows by pullback of actual microscopic states.
IC-2 proves the compiler's sea is a ground state of its own chiral sine
Hamiltonian and its pullbacks coincide; constant Wilson rows are legitimate.
These are different microscopic states/Hamiltonians from the auxiliary
Dirac Wilson benchmark, and the documentation keeps them separate.

### Lemma A1: sampled-field limits obey the source alpha criterion

**ASSUME** the compiler's common CAR limit with isometric embeddings i_M,
coherent alpha_Q^M, and a finite-scale observable sequence a_M with
||i_M(a_M)-a||→0 in that limit.
**PROVE** lim_(M→infty) limsup_(Q→infty)
||a_Q-alpha_Q^M(a_M)||=0, exactly OS (91)/Definition 3.1 for the norm.

<1>1. Isometry and coherence give
||a_Q-alpha_Q^M(a_M)||=||i_Q(a_Q)-i_M(a_M)||.
<1>2. This is bounded by ||i_Q(a_Q)-a||+||a-i_M(a_M)||.
<1>3. Take the limsup in Q and then the limit in M. QED BY <1>1–<1>2.

LL-1's one-particle norm limit and CAR norm continuity therefore produce
**alpha-convergent** local observable sequences in the source's precise
sense. They are not added continuum fields without lattice representatives.
The restriction of the limiting state to these observables is the same
compatible sea/GNS state already constructed through Wilson rows.

The source's Proposition 3.6 is an interval-by-interval inductive-limit
statement for **wavelet** refinements. It cannot be imported for sharp maps.
The source itself allows sharp momentum refinement and explicitly warns that
it loses exact finite-scale spatial support. The compiler's extra local
reconstruction argument addresses this distinction rather than claiming
Proposition 3.6 unchanged.

## Audit B: an upper inclusion beyond the selected smooth generators

The existing LL-2 supplies the lower local generating family and identifies
its vacuum net A(I)=Vir_{1/2}(I), or the factorwise tensor product.
Let H0 be its one fixed global vacuum Hilbert space, and represent the
embedded even finite CAR observables on H0.

### Lemma A2: every bounded local weak limit belongs to the same interval net

**ASSUME** I is a proper circle interval; a_M belongs to the finite even
observable algebra supported at sites of I; the embedded represented
operators A_M are uniformly bounded and converge in the weak operator
topology to X on H0. For products impose parity independently in each factor.
Use LL-1/LL-2 and Haag duality of the identified vacuum product net.
**PROVE** X belongs to A(I).

<1>1. Let b be a fixed even polynomial in real smooth fields compactly
supported in the complementary interval I'. LL-1 supplies lattice
polynomials b_M supported in I', whose embedded representatives B_M
converge in norm to b.
<1>2. At each sufficiently fine scale [a_M,b_M]=0 by disjoint lattice
supports and even CAR parity. Homomorphisms and representations preserve
this equality, so [A_M,B_M]=0.
<1>3. If sup_M||A_M||<=K, then
||[A_M,b]||<=2K||B_M-b||→0. Taking matrix elements and the weak limit
of A_M gives [X,b]=0.
<1>4. Such polynomials generate A(I') by LL-2. Their commutant is weakly
closed, hence X belongs to A(I')'.
<1>5. Haag duality gives A(I')'=A(I). QED BY <1>1–<1>4 and
KL:403–407 (factorwise for a finite tensor product).

The weakly closed algebra generated by **all** such bounded local weak
limits is therefore exactly A(I): A2 gives its upper inclusion, and the
sampled polynomials from LL-2 give the lower one. This strengthens the
former purely definitional choice of sampled generators without changing
any finite model, state, or refinement.

A seam causes no missing interval in this argument: compactly supported
real sections avoiding that one point are L2-dense in the sections supported
in I or I'. If their support has two chart components, split the test into
two sections and use additivity and products of the existing samplers.
No finite sampler is asked to certify global smoothness from sampled values.

**Precise boundary:** A2 is a represented local-net equality. Weak limits
do not preserve products of two independently varying sequences, so this
proof does not manufacture a weak-limit sequence C*-algebra or identify
such an algebra with the OAR inductive limit. Nor does it identify the
universal global circle observable algebra with even CAR. The latter source
warning remains essential. The global OAR construction used in A1 is unchanged.

## Audit C: the extra low-energy Fermi edge is real

For the compiler's positive momentum r, the normal-ordered one-mode
excitation energy is a_M(r)=sin(2pi r/M)/(2pi/M), by IC-2.
For a fixed positive half-integer s, let r_M=M/2-s (for large even M).
Then a_M(r_M)=sin(2pi s/M)/(2pi/M)→s. These are additional bounded-energy
UV-edge excitations, while fixed r has energy tending to r.

Under the sharp embedding the vectors e_(r_M) have distinct unbounded
momentum labels along a dyadic sequence. They are eventually orthogonal,
so their pairwise distance is sqrt(2) and they have no norm-convergent
one-particle OAR representative. On refinement r_M is preserved as a
label, not moved to the next edge r_(2M); its later energy grows toward
r_M. The selected RG therefore retains the near-zero branch and discards
the moving UV branch. The no-wrap KS correction removes the spurious
boundary crossing consistently with that choice, as its source requires.

Independent even parity does not erase this distinction: for distinct fixed
positive half-integers s,t, the two-edge-excitation state at momenta
M/2-s and M/2-t is even and has energy tending to s+t. These even states
also move to orthogonal Fock supports under the sharp embeddings. Thus the
qualification matters to the observable vacuum theory as well as odd fields.

This does not invalidate OAR: a renormalization map is part of the input
construction, and OS Definition 3.9 chooses precisely this sharp map.
It does invalidate an unqualified statement that *all* finite low-energy
lattice states converge to the one chiral Ising vacuum theory, or that a
bare Hamiltonian determines this continuum target independently of RG.
No such stronger spectral theorem should be inferred from CA-82.

## Dynamics and final assessment

The output zero mode is the same modified chiral family at n=0, so the
source's strong-core and unitary theorem applies to its time evolution
in the same limiting sea representation. CAR Bogoliubov convergence is
also part of OS Corollary 4.13. Finite numerical spectra alone were never
needed to assert continuum dynamics. Nonzero smeared modes still use the
source regularity hypotheses; finite Fourier arrays are not an implemented
wavelet-smearing engine.

The supported branch consequently meets the stated OAR/local-net/modular
criterion with explicit refinement and parity choices. It does not solve
arbitrary decorated category realization, F/R equivalence, other real
central-charge lifts, a full two-Fermi-point spectral limit, or a universal
notion of continuum limit independent of the supplied RG.

## Separate cross-referee: CO-1–CO-3 descendant observable system

Read `research/coset_observable_system.md` independently of its author.
**Accepted as a strict finite-algebra OAR construction and represented local
reconstruction.** A finite-range spatial realization of its descendant
operations has not been established; it does not solve the general category
problem. Global fusion admissibility constraints do not themselves obstruct
locality, which concerns the support/range of the actual operations.

- The independent scalar flag is essential. The orthogonal shell supports
  prove multiplicativity, unitality, injectivity and coherence of the maps.
  Substituting a state expectation for the scalar would invalidate this.
  The faithful limit is K(H)+C1 because H is infinite-dimensional, as the
  nonzero vacuum descendants at distinct grades prove.
- Finite vacuum states restrict consistently. Their finite GNS spaces are
  V_b; the limit GNS is H. A scalar-flag element can kill the coarse vacuum
  space yet act on later shells; the proof only requires the correct GNS
  intertwining, not faithful finite vacuum representations.
- The word schedule R_b=2b+1, M_b=16(b+1) meets CR-2 for the retained
  matrix elements. Exact Gram elimination constructs the subspaces and their
  metrics from the microscopic words. It uses no continuum characters or
  target matrix entries as algorithmic input. The source theorem identifies
  the resulting vacuum module after this construction.
- Scalar penalties changing with b do not spoil dynamic covariance: the
  shell part of every embedded observable is scalar and commutes with its
  energy. This must not be confused with equality of Hamiltonian elements
  themselves under the maps; only the stated automorphism equality holds.
- CO-2's finite compression formula follows from grade selection. Its
  common-core argument proves strong resolvent and strong* unitary limits.
  The complementary scalar in the algebraic exponential/resolvent is
  correct; a corner extension of the unitary would not have that form.
- CO-3's uniformly bounded strong*-convergent sequence space is a C*-algebra,
  and its limit map is a contractive homomorphism. Its image is norm closed
  by the C*-quotient theorem. The stated null ideal differs from norm-null
  soft-OAR sequences; the note correctly rejects identifying those ideals.
- The local field unitaries are outside the norm compact-plus-scalar algebra
  in general. This is consistent with OS Definition 3.1: represented strong
  limits satisfy its induced-seminorm alpha-Cauchy criterion by the same
  coherent-embedding triangle argument as A1. It is not a new substitute
  definition for the underlying strict OAR tower.

The main limitation is an unproved locality realization, not a failed algebra
identity or the mere presence of a global constraint. The displayed descendant
projectors act globally in the ambient fermion presentation; no bounded-range
realization on a fusion space has been supplied. A constrained fusion space
need not factor into on-site tensor factors to support local operations.
The finite compressed stress labels also cannot preserve interval support
under exact refinement. CO-3 recovers
geometry from the prescribed limiting stress families and the sourced
Virasoro representation. The proof states this choice and does not claim
that the compact algebra alone determines geometry or modular data.
