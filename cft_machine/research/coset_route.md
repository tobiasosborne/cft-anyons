# Coset stress generators from finitely many lattice fermion flavors

Status: source-grounded current/coset construction plus a local finite-core
stabilization proof. The proposed microscopic stress operators are explicit
finite CAR polynomials. A local minimal-model lattice Hamiltonian and a
coherent coset OAR observable system are not supplied by this construction.
No expensive computation or full package test is used in this research note.
Conventions: root (z); source registry `references/cft-machine/virasoro/SOURCES.md`.

Sources (exact repository-relative anchors):

- **OS** = `references/text/CFTFromLatticeFermions.txt`: `:738–745` gives
  quasi-free states and projection/purity; `:879–892`, normal ordering and
  the CAR Schwinger cocycle; `:1843–1889`, sharp momentum OAR and its spatial
  nonlocality; `:4160–4191`, current Fourier shifts; `:4248–4318`, flavored
  level-one currents and their convergence. Source Eq. (232) is reindexed
  as recorded in (z). Our no-wrap finite sections are an explicit modification
  of the current shifts, motivated by the analogous source Eq. (197),
  `:3379–3397`; we do not label unmodified periodic shifts as no-wrap.
- **GKO** = `references/cft-machine/virasoro/GoddardKentOlive1986/source.txt`:
  `:123–153`, affine algebra, Sugawara and normal ordering; `:165–186`,
  coset stress difference; `:195–217`, diagonal SU(2) and minimal-series c.
  Original PDF printed pp.107–108 were visually checked: Eq. (2.5) is
  **1/(2 beta)**, beta=k_aff+c_adj/2. In (z), k_aff=k/2 and c_adj=2,
  hence the coefficient is exactly 1/(k+2).
- **KL** = `references/cft-machine/realisation/KawahigashiLongo2002/source.tex:1008–1024`:
  the continuum diagonal coset is the Virasoro net at c=1-6/[m(m+1)].
  This is a continuum identification, not a microscopic coset-limit theorem.

## Explicit finite recipe

Fix k=m-2>=1 and take k+1 independent copies of a two-flavor complex CAR
system. In each copy use half-integer momenta in the M-site window and the
negative-momentum filled sea. With t^a=sigma_a/2, set

`j_(M,p)^a(e_r tensor v) = e_(r-p) tensor t^a v`

when both momenta lie in the window, and zero otherwise. Let J_(M,p)^(u),a
be its normal-ordered complex second quantization in copy u. This is a
finite, explicitly given quadratic CAR polynomial. Different copies commute
because each current is even. Set I=sum_(u=1)^k J^(u), J=J^(k+1), D=I+J.

For a current family X of continuum level l define the finite polynomial

`S_(M,n,R)^[l](X) = (1/(l+2)) sum_(a=1)^3 sum_(p in W_(n,R))
                                      :X_(M,n-p)^a X_(M,p)^a:`,
`W_(n,R) = {p in Z: |p|<=R and |n-p|<=R}`,
`C_(M,n,R)=S^[k](I)+S^[1](J)-S^[k+1](D)`.

Normal ordering here orders **current modes**, per (z). It is not permission
to replace the product by a fermion-Wick-ordered quartic without its contraction
terms. The formula is already an explicit polynomial of degree at most four
in CAR generators, including every contraction through ordinary multiplication.
The two independent cutoffs are M (microscopic window) and R (current sum).

## Proposition CR-1: level and coefficient normalization

ASSUME the above filled-sea CAR representation and the infinite no-wrap shifts.
PROVE each two-flavor current copy has level one; I and D have levels k and
k+1, and the continuum stress difference is the GKO Virasoro family with
`c=3k/(k+2)+1-3(k+1)/(k+3)=1-6/[(k+2)(k+3)]`.

<1>1. Matrix commutators give the noncentral current bracket.
  <2>1. Infinite momentum shifts compose additively. Therefore
  `[t^a shift_p,t^b shift_q]=i epsilon_abc t^c shift_(p+q)` BY the
  Pauli multiplication identity and (z).
  <2>2. Normal-ordered second quantization transports this identity with
  the Schwinger term BY OS Eqs. (26)–(28), `:879–892`.
<1>2. The Schwinger term is `(p/2)delta_ab delta_(p+q,0)`.
  <2>1. A trace can be diagonal in momentum only if p+q=0. For p>0 the
  lowering shift crosses exactly p half-integer filled/unfilled pairs.
  The other cross-block product vanishes. Each pair contributes
  `Tr(t^a t^b)=delta_ab/2`; negative p follows by antisymmetry.
  <2>2. QED BY <2>1 and the OS cocycle formula.
<1>3. Cross-copy currents commute because their CAR bilinears are even.
Their central terms add, so I and D have the asserted levels BY <1>1–<1>2.
<1>4. Apply GKO Eqs. (2.5)–(2.19) on the unitary positive-energy current
representation. The numerator stress is the sum of its two commuting
Sugawara families, and the denominator uses the diagonal family D.
Their difference is Virasoro with the displayed central charge, and commutes
with diagonal currents. This is a sourced theorem application, not a
finite-lattice commutator identity.
<1>5. QED BY <1>1–<1>4 and substitution of m=k+2.

## Theorem CR-2: exact tail control and eventual finite-core equality

ASSUME finitely many flavors, the sea-compatible CAR embeddings and finite
currents above. Let E_M and P_e be the nonnegative free excitation energy
and its energy-at-most-e projection fixed in (z). In the common sea GNS
space let P_e also denote its limit projection. These are auxiliary energy
cores, not spectral projectors of the proposed coset Hamiltonian.
PROVE the truncated coset modes converge on every such core, with the
explicit stronger identity

`(embedded C_(M,n,R)-C_n)P_e = 0`

whenever `R>e+|n|` and `M/2-1/2>e+2R`.
In particular `R_M=floor(M/8)` gives eventual exact equality for each fixed
e,n as M tends to infinity. The same holds for every fixed finite word of
coset modes after enlarging e by the intermediate energy shifts.

<1>1. Positive high current modes annihilate the core at every finite scale.
  <2>1. For all momenta, E_M equals `sum_r r (n_r-S_r)` summed over flavors.
  Its excitation spectrum is nonnegative; the sea-compatible embeddings
  intertwine E_M exactly BY the added modes' sea occupations.
  <2>2. Every nonzero bilinear in J_p moves an occupied orbital r to r-p.
  Thus `[E_M,J_p]=-p J_p`; scalar normal ordering contributes only for p=0.
  Finite no-wrap endpoints do not change this calculation.
  <2>3. A vector of energy at most e is mapped to energy at most e-p.
  If p>e that subspace is zero, so `J_p P_e=0` BY positivity and <2>2.
  The same argument works for sums of copies I,D and in the infinite sea.
  <2>4. QED BY <2>1–<2>3.

<1>2. Every omitted normally ordered summand annihilates P_e if R>e+|n|.
  <2>1. Write a=n-p,b=p. If either |a| or |b| exceeds R, then because
  a+b=n, one index is positive and exceeds e, and the other is negative.
  Indeed a negative index of magnitude >R forces the other index to
  exceed R-|n|>e; a positive index >R is already >e.
  <2>2. The normal-order rule places that positive mode on the right.
  The summand is therefore zero on P_e BY <1>1.
  <2>3. Consequently the current-sum tail is **exactly zero**, uniformly
  in M, on P_e. It is not merely bounded by an unproved summability constant.
  QED BY <2>1–<2>2.

<1>3. The retained products agree with continuum products for a safe window.
  <2>1. In any vector of energy <=e, all deviations from the sea occur at
  |r|<=e. Acting with J_p only involves those deviations and the Fermi
  crossings, so every potentially nonzero input/output orbital lies within
  |r|<=e+|p|. Farther orbitals are simultaneously filled or simultaneously
  empty, and the normal-ordered bilinear annihilates the sea there.
  This argument includes p=0: the subtracted sea term removes its scalar.
  <2>2. Thus J_(M,p) agrees with J_p on P_e once the finite window contains
  |r|<=e+|p|. For two factors with |a|,|b|<=R, the first action raises
  the energy by at most R, so the whole product is contained in
  |r|<=e+2R. Thus the strict safe-window bound in the theorem is sufficient.
  <2>3. There are finitely many retained terms. Each matches the continuum
  by <2>2, and each omitted term vanishes by <1>2. The asserted equality
  follows, simultaneously for I, J and D and hence their stress difference.
  <2>4. QED BY <2>1–<2>3.

<1>4. The diagonal cutoff and finite products are controlled.
  <2>1. R_M eventually exceeds e+|n|; also
  `e+2R_M<=e+M/4<M/2-1/2` for sufficiently large M.
  Thus <1>3 gives the diagonal limit with no exchange of uncontrolled limits.
  <2>2. Every mode product in the stress formula lowers E by exactly n,
  so the finite and continuum stress modes map P_e into P_(e+|n|).
  For a word n_1,...,n_t use the enlarged cutoff
  `e'=e+sum_j |n_j|` in the preceding thresholds. Every factor then agrees
  on its intermediate vector. This proves equality of the finite word and
  continuum word on P_e, eventually in M.
  <2>3. QED BY <2>1–<2>2.

<1>5. Each finite stress sum satisfies C_(M,n,R)^*=C_(M,-n,R).
  <2>1. Current adjoints reverse mode sign. For opposite-sign index pairs,
  current normal ordering is compatible with taking the adjoint.
  <2>2. For same-sign pairs, individual finite current commutators may have
  boundary defects: do not interchange them. Instead pair the summands
  p and n-p, both retained by the symmetric W_(n,R). Their sum contains
  both orders and its adjoint is the corresponding paired sum at -n.
  <2>3. Zero-index pairs are separate: for a fixed Lie component, J_0^a
  commutes exactly with J_p^a even at finite cutoff. Their one-particle
  matrices are t^a tensor identity and t^a tensor shift; their commutator
  is zero and the finite normal-ordering scalar contributes no cocycle.
  Coincident indices cause no ambiguity. Real Sugawara coefficients finish
  the claim BY <2>1–<2>3.
<1>6. QED BY <1>1–<1>5. This proves a dense-core generator/product limit,
not exact Virasoro on the entire finite Hilbert space.

## What remains before this is a microscopic minimal-model compiler

This construction removes the **current-sum tail gap on finite free-energy
cores** for this special sharp finite-section backend. It improves on a generic
conditional product criterion: the explicit annihilation and support arguments
replace abstract error estimates. It does not automatically verify the global
graph-norm hypotheses of VR-1, and no such implication is claimed.

The remaining gap is physical and operator-algebraic. Sharp current cutoffs
produce explicit finite polynomials, but their Fourier kernels need not be
finite-range spatial densities. The quartic C_(M,0,R_M) is Hermitian; global
finite-scale positivity, a local Hamiltonian realization, and selection of
its microscopic ground states have not been proved here. The compatible
reference sea is the ambient free vacuum, not a demonstrated unique ground
state of that quartic model.

The ambient lattice contains k+1 two-flavor fermion copies. Its full continuum
theory retains the charge and other current degrees of freedom: subtracting
stress tensors does not remove those observable sectors. To obtain precisely
the target, one must isolate the numerator SU(2)_k x SU(2)_1 vacuum subnet,
then its diagonal-current coset and its vacuum cyclic representation. KL
identifies that **continuum** coset as Vir_c. This is not a proof that finite
commutants or finite vacuum-cyclic compressions commute with OAR refinement.

An actual coset backend must supply coherent finite observable subalgebras,
state/refinement restrictions and local-net convergence, or another proved
microscopic encoding of that subnet. Its sector identification can then use
the sourced minimal-net results. Without this step the construction supplies
minimal-series stress generators inside a larger lattice theory, not a full
category-faithful minimal-model lattice limit. No general input MTC is solved.

**Negative control (local calculation).** Replacing the no-wrap shift by
periodic momentum wrap destroys <1>1 of CR-2. For p=1 the occupied orbital
r_min=-M/2+1/2 maps to the empty orbital r_max=M/2-1/2. With t^3=sigma_3/2,
the two flavor transitions give orthogonal particle-hole states of amplitudes
1/2 and -1/2, so the squared norm of this contribution on the sea is 1/2.
Thus the positive current mode does not annihilate the vacuum; its spurious
excitation has energy M-1. Normal ordering removes a scalar only and cannot
remove this off-diagonal particle-hole term. The tail proof specifically
requires the stated finite-section modification.

## Corollary CR-3: smaller safe windows for vacuum descendants

ASSUME the CR-2 finite section, n>=1, R>=n and M/2-1/2>n.
PROVE the embedded C_(M,-n,R) Omega equals C_-n Omega exactly.

<1>1. Any normally ordered current pair with a positive index annihilates
the sea. A zero mode also annihilates it: both flavors at a negative
momentum are filled and Tr(t^a)=0.
<1>2. Thus a nonzero term on Omega has both indices negative, summing
to -n. Both magnitudes are <=n and are retained when R>=n.
<1>3. Its first and second actions have energies <=n; the support argument
of CR-2 confines each nonzero orbital to |r|<=n. The stated M bound
therefore gives exact agreement with the continuum term.
<1>4. QED BY <1>1–<1>3. This certifies the M=8,16 vacuum-vector comparisons
for n=2,3 and R=3,4; it is not the general P_e estimate.
