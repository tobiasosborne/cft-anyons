# Supported Ising compiler: exact fidelity and microscopic realization

Status: a supported construction using source theorems and explicit local
proofs, not a general category-realization theorem. Conventions (u),(w),(y),(z).
`LOCAL_LIMIT.md` proves the local observable reconstruction; it is essential.
Structured proofs here have not been checked in a proof assistant.

Source abbreviations, with repository-relative paths:

- RSW: `references/category-theory/RowellStongWang2009Classification/source/RSWfinal3.tex`.
- KL: `references/cft-machine/realisation/KawahigashiLongo2002/source.tex`.
- KLM: `references/cft-machine/realisation/KawahigashiLongoMuger1999/source.tex`.
- OS: `references/text/CFTFromLatticeFermions.txt`.
- BO: `references/cft-machine/realisation/Bockenhauer1994/source.tex`.
- LMR: `references/cft-machine/realisation/LongoMartinettiRehren2009/source/LMR.tex`.

## The supported input and result

ASSUME the input is one exact modular/fusion datum matching standard chiral
Ising, with real central charge 1/2, up to a unit-preserving permutation;
or an explicitly declared finite tensor product of such inputs.
PROVE the compiler supplies local finite Majorana Hamiltonians, factorwise
microscopic Virasoro approximants, unital observable refinements and ground
states, whose specified local OAR reconstruction has the input modular data.

The input interface reads the modular/fusion shadow of a category. It does
not solve F/R coherence or infer tensor factorization from fusion rules.
It proves the minimum S,Theta,c fidelity; equivalence of an arbitrary input
category is a separate stronger claim. The target is the NS vacuum local net,
not a universal global observable algebra (BO:350–356 warns of the difference).

### IC-1. Exact recognition and the Ising local-net modular data

<1>1. The reference data are S and Theta in RSW:2441–2474, with c=1/2.
  <2>1. `Cyclo16.jl` reduces rational polynomials by z^8=-1, using BigInt
  rationals. Evaluation at z=exp(pi*i/8) respects every arithmetic operation,
  so exact polynomial equality implies equality of the complex scalars.
  <2>2. `match_ising` compares every S,Theta,fusion entry and c after one
  of the two unit-preserving permutations. No floating tolerance is used.
  <2>3. QED BY <2>1–<2>2. Unsupported inputs raise UnsupportedCategory.

<1>2. The vacuum Virasoro net at c=1/2 has exactly the matched data.
  <2>1. KL:1026–1037 proves complete rationality of Vir_c for c<1.
  KL:1106–1139 gives all DHR sectors and their fusion; at m=3 choose
  representatives (1,1),(1,2),(1,3), in the order (1,sigma,psi).
  <2>2. The source weight formula KL:665–669 gives
  h=[((4p-3q)^2-1)/48]=[0,1/16,1/2]. KL:1140–1157 identifies twists
  with exp(2*pi*i*h) and identifies categorical with minimal-model modular data.
  <2>3. Substituting these representatives into KL:653–663 gives
  sigma*sigma=1+psi, sigma*psi=psi*sigma=sigma, psi*psi=1,
  and the unit rules. These nine products are checked against that formula.
  Positive dimensions satisfy d_psi=1, d_sigma=sqrt(2), total D=2.
  <2>4. RSW:689–690 gives the balancing identity
  theta_a theta_b S_ab = sum_t N_ab^t S_t1 theta_t here (all sectors self-dual).
  With S_t1=d_t/2, it gives the reference S, including S_sigma,sigma=0
  and S_sigma,psi=-sqrt(2)/2. Exact tests assert this identity entrywise.
  <2>5. QED BY <2>1–<2>4 and <1>1.

<1>3. Tensor-product output has the declared product modular data.
  <2>1. KLM:969–977 supplies the type-I representation hypothesis for
  completely rational separable nets. KLM:1518–1551 then proves that all
  irreducible localized endomorphisms of a two-net product factor.
  Apply this successively, using a single Ising factor as the first net.
  <2>2. For factorized localized endomorphisms, choose tensor products of
  charge transporters. Composition, transport and adjoints act factorwise,
  so fusion and braiding factor. The corresponding dimension and trace
  evaluations are products, giving S tensor products and twist products.
  This is the explicit tensor-factor derivation accompanying <2>1.
  <2>3. The code retains canonical lexicographic product sectors, and
  returns both their input-label names and the full input-product→canonical
  permutation. It checks each declared factor before forming a recipe.
  <2>4. The chosen real c is k/2; the character matrix is the exact pair
  (-c/24,Theta), representing exp(-2*pi*i*c/24)Theta. Its phase need not
  lie in Q(zeta_16), so it is not incorrectly coerced into that field.
  <2>5. QED BY <2>1–<2>4. The input factorization is an assumption, not
  something the compiler has discovered from S or from the fusion table.

### IC-2. The output really is a lattice Hamiltonian and ground-state tower

<1>1. At even M, the backend emits explicit quadratic coefficients
Q_n=(1/2)sum_ij A_n[i,j]Psi(e_i)^*Psi(e_j)-(1/2)Tr(S A_n)1,
where A_n is the source-modified chiral KS matrix, S=1_(r<0),
and Gamma e_r=e_-r. BY OS:827–840,879–892,3379–3420.
  <2>1. Admissibility Gamma A_n* Gamma=-A_n and adjoint pairing are
  proved in the benchmark proof and checked again through the emitted data.
  The terms, scalar, covariance and conjugation are actual finite arrays.
  <2>2. For n=0, A_0 is diagonal with a_r=sin(epsilon*r)/epsilon.
  In the spatial Fourier basis it equals (F-F*)/(2*i*epsilon), with F
  the forward nearest-neighbor shift and its negative antiperiodic seam.
  This follows by expanding sine into its two exponential terms.
  The compiler independently builds this sparse nearest-neighbor matrix
  and compares it to the Fourier transform of its emitted H matrix.
  <2>3. Thus H=Q_0 is a local quadratic Hamiltonian. The 1/2 in its
  self-dual prescription is retained; it is not the complex-CAR convention.
  Nonzero KS modes use the source's no-wrap modification. This locality
  statement concerns H, and does not claim those modified modes are local.
  <2>4. QED BY <2>1–<2>3.

<1>2. The compatible sea is an actual ground state for this H.
  <2>1. Pair r>0 and -r. Put b_r=Psi(e_r); self-duality gives
  Psi(e_-r)=b_r*. The CAR imply b_r b_r*=1-b_r*b_r.
  <2>2. Since a_-r=-a_r, their combined normal-ordered contribution is
  (a_r/2)(b_r*b_r-b_r b_r*)+a_r/2=a_r b_r*b_r.
  <2>3. For all finite labels r>0, 0<epsilon*r<pi, hence a_r>0.
  The sea has b_r Omega=0, so H>=0 and H Omega=0.
  <2>4. QED BY <2>1–<2>3. This is the chiral sine Hamiltonian's state,
  not a substitute for the different two-component Dirac ground state.

<1>3. Refinements and the Wilson triangle are exact for these states.
  <2>1. Preserve every half-integer momentum label under M→2M. The
  resulting isometry J preserves Gamma and satisfies J*S_(2M)J=S_M.
  These identities follow entrywise and are checked through M=16.
  <2>2. The induced map Psi(v)→Psi(Jv) is a unital CAR *-monomorphism
  (OS:1843–1879). It commutes with each factor parity and restricts to
  the factorwise-even observable algebra. It is not the corner map a→JaJ*.
  <2>3. Quasi-free states are fixed by their covariance; hence all row
  pullbacks coincide exactly. The Wilson horizontal drift is zero for
  this chosen family. Higher moments agree by the same quasi-free rule.
  <2>4. QED BY <2>1–<2>3. Sharp maps need not preserve spatial support;
  `LOCAL_LIMIT.md` supplies the separate local reconstruction argument.

### IC-3. Symmetry and conclusion

<1>1. OS:2887–2911 identifies the self-dual continuum stress representation
as c=1/2,h=0. Theorem 4.11 (OS:3483–3502) and its stated self-dual extension
supply strong mode convergence on the finite-excitation core.
<1>2. OS:3706–3725 supplies smeared convergence and essential self-adjointness
for real smearings under its regularity hypotheses; Corollary 4.17,
OS:3726–3742, supplies strong unitary convergence. Theorem 6.3 supplies
correlation limits. These are sourced analytic theorems, not finite fits.
<1>3. `LOCAL_LIMIT.md` identifies the reconstructed observable interval net
with the even real free-Fermi net, which LMR:1165–1168 identifies as Vir_1/2.
KL:624–635 defines this net using the vacuum projective Diff representation;
KL:1161–1178 supplies positive-energy covariance of its sectors.
<1>4. For k factors retain every factor stress family. Their placed sums
supply total H and total stress; the individual families generate the full
product net. The total diagonal stress alone would not do this.
Tensoring the strongly continuous projective unitaries gives the product
symmetry representation; restricting to the diagonal adds central charges.
<1>5. QED BY IC-1, IC-2, <1>1–<1>4 and `LOCAL_LIMIT.md`.
This is a proved supported domain, with no claim about an arbitrary fusion/MTC
input or a different prescribed real central-charge lift.
