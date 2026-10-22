# D4 — Categorical Koo–Saleur tiles beyond quadratic dynamics

**Status: exploratory; one realization conjecture, proved conditional analytic
reductions, and exact finite algebraic obstructions. No new interacting-chain
instance of VR-1 or category-to-CFT construction is established.**
2026-10-22. All paths below are repository-relative. New conventions are local
proposals, as requested; no canonical convention or report file is changed.

## Headline conjecture

**Conjecture D4-C — effective categorical discretization with internal stress.**
Let C be any unitary modular tensor category with computable structural data.
Supply an **effective positive rational conformal sewing completion S** of C:
graded sector spaces with finite-dimensional grades and computable positive Gram forms,
a unique vacuum, specified nonnegative conformal weights and real central
charge, all sewing/coordinate-change maps with certified convergence moduli,
a finite Hermitian strong generating set for the vacuum chiral algebra,
and an identified unitary local chiral theory whose complete sector category
is ribbon-equivalent to C. Its stress is internal to that same local theory.
“Strong generating” means spanning by normally ordered products of derivatives
of the supplied generators; a finite set of formal OPE guesses is insufficient.
Take as target the diagonal full theory of S and its opposite chirality,
so that the requested one-dimensional regulator has no imposed chiral imbalance.

There is an effective construction, from these data, of finite categorical
chains, nearest-neighbour self-adjoint tile Hamiltonians, local refinement
maps and microscopic states, with the following properties:

1. At each cutoff the site object is a finite object of C containing the unit;
   finite unit-object multiplicities and increasing boundary cutoffs are allowed.
   Local operators are morphisms on consecutive site factors. A periodic
   representation, including its seam and sector policy, is part of the output.
2. The **standard density-and-current KS modes of these Hamiltonians**, with
   declared velocity, energy subtraction and zero-mode shifts, satisfy property
   P below with a compatible auxiliary regularity grading. The extended-field
   modes satisfy its finite-order version. There is no substitution of arbitrary
   spectral compressions for the microscopic Hamiltonian or its KS modes.
3. The same refinement/state system satisfies WT-1 and produces the GNS maps
   used for mode transport. One vacuum-preserving unitary identifies the whole
   limiting net, every interval algebra, generating fields and stress with the
   specified diagonal target. Both chiral symmetry representations integrate
   to the target's full projective-unitary conformal symmetry.
4. Sector and sewing intertwiners identify each chiral representation category
   with C (the opposite chirality with its reversed braiding), including its
   complete sector list, associativity and braiding. In particular the modular
   data and the chosen central-charge lift are faithfully reproduced.

This is a universal **inverse discretization conjecture for every effectively
sewing-realizable C**, not a conjecture that every UMTC already has such a
completion, nor a claim that a bare category determines one uniquely. The extra
data are intentionally substantial: even with a rigorous analytic target in
hand, producing local categorical dynamics with its own convergent KS stress
would close the principal microscopic gap. No hypothesis assumes a lattice,
spectral compression encoding, or KS convergence. Cutoff-dependent site objects
make this broader than a fixed-site-dimension universality conjecture.

The strongest result proved here is **D4-P**: a spectral-shell estimate and
low-energy tile/transport estimates imply A2–A4, using a stronger regularity
weight. **D4-N** proves that trying to obtain A3 by exact covariance on every
finite carrier cannot realize a nonzero cubic central charge. The existence
of P, local OAR refinements, extended fields and complete fidelity in D4-C is
unproved. Even a single genuinely interacting categorical instance remains open.
Allowing unit multiplicities also permits ordinary spin-chain carriers;
categorical content must be recovered by the construction and fidelity maps,
not inferred merely from membership in End_C(O tensor O).
For fusion-only input one must supply a braided chiral target and declare C's
module/defect role before requesting modular fidelity. All finite identities
and analytic reductions below apply to unitary fusion categories without
braiding; the headline's modular-fidelity conclusion uses the enriched target.

## Conventions proposed

These proposals extend, rather than overwrite, CONVENTIONS (r), (s), (t),
(v), (ac)–(af). In particular (r)/(t) do **not** already supply a periodic tower.

- Scale is r=0,1,...; N=N_r>=4 is the number of sites, typically growing at least
  geometrically. A single placement may instead compare N and N+1. Summability
  is always in r, not silently in the number of sites.
- C is unitary; use all multiplicity indices and the unitary dagger convention.
  Fix left-associated fusion trees and orthonormal vertex bases. No R-symbol
  entries, self-duality assumption or multiplicity-free reduction is used.
  A finite dagger-stable tile basis D_alpha spans End_C(O tensor O).
  A dagger mate is written alpha*, so c_(alpha*)=conj(c_alpha).
- Use the brief's H_N^raw=-sum_j h_(N,j), h_N=sum_alpha c_(N,alpha)D_alpha.
  To interface with (af), put k_(N,j)=-h_(N,j)/v_N, with **given** v_N>0.
  Thus H_N^raw/v_N=sum_j k_(N,j). Velocity is measured in sites per unit
  microscopic time; the circle coordinate is x_j=2*pi*j/N, j=0,...,N-1.
- For circular formulas assume a specified unitary translation U_N, U_N^N=1,
  on a declared periodic categorical representation, translating k_j to k_(j+1)
  and giving disjoint-interval commutativity. This is additional data, not a
  construction from open-chain Hom spaces. Bulk placement formulas below also
  work on open windows, with the actual endpoint terms retained.
- Define j_j=i[k_j,k_(j+1)], using the **forward** current of (af).
  Its three-site support is not relabelled as a two-site tile. Current and
  energy are assigned the same index phase, exactly the (af) prescription.
  The backward source current is -j_(j-1); it has a different finite phase.
- e_N is an energy-density subtraction in k units; b_N is a separate real
  zero-mode shift. For comparisons to a vacuum assume its total current
  expectation is zero; otherwise separate chiral zero-mode origins are needed.
  Plane-mode normalization is [L_m,L_n]=(m-n)L_(m+n)+
  c(m^3-m)delta_(m+n,0)/12. Before matching it retain c and c_star separately.
- Q_r>=1 is an auxiliary self-adjoint grading with Q_(r+1)J_r=J_r Q_r.
  For D4-P choose any fixed integer p>1 and K_r=Q_r^p. Real graph powers of Q
  are used in intermediate estimates. Norms are full operator norms on the
  indicated Hilbert spaces, not individual matrix elements or vacuum norms.
- Additional bosonic chiral fields have integer weight d_a and expansion
  W^a(z)=sum_n W^a_n z^(-n-d_a). Hermitian generators are chosen with
  (W^a_n)^*=W^a_(-n). Charged intertwiners, twisted modes and superalgebras
  require additional sector/adjoint conventions and are not silently included.

## 1. The KS prescription really is a tile prescription

Write z_(N,n)=exp(2*pi*i*n/N), a_N=N/(4*pi), and define

    T_(N,n)    = a_N sum_j z_(N,n)^j (k_j-e_N*1-j_j)
                   + b_N delta_(n,0)*1,                         (1)
    Tbar_(N,n) = a_N sum_j z_(N,-n)^j (k_j-e_N*1+j_j)
                   + b_N delta_(n,0)*1.

This is (af)/LC-4 with the physical velocity restored **before** forming the
current. In the original h variables the forward chiral tile is

    -sum_alpha (c_alpha/v_N) D_alpha^j - e_N*1
    - (i/v_N^2) sum_(alpha,beta) c_alpha c_beta
          (D_alpha^j D_beta^(j+1)-D_beta^(j+1) D_alpha^j).        (2)

Both coefficients 1/v_N and 1/v_N^2 matter. CA-70 is an earlier proposed
midpoint/current convention, not an identical formula with the same physical
velocity symbols. Equations (1)–(2) fix this note's choice explicitly.
Sources: GS:791–820; KS:606–648,704–712; CONVENTIONS:1196–1217.

**D4-T [proved: finite tile/continuity identities].**
ASSUME the declared local representation and Hermitian density.
PROVE i[sum k,k_j]=j_(j-1)-j_j, T_n^*=T_-n, and

    [sum_j z_m^j k_j, sum_j z_n^j k_j]
       = -i(z_n-z_m) sum_j z_(m+n)^j j_j.                      (3)

<1>1. Only k_(j-1) and k_(j+1) contribute to the first commutator.
  <2>1. i[k_(j-1),k_j]=j_(j-1) and i[k_(j+1),k_j]=-j_j.
  <2>2. Their sum is the asserted continuity identity BY locality.
<1>2. In the double Fourier sum retain neighbouring pairs and pair their
two orders. Their coefficient is z_m^j z_n^(j+1)-z_m^(j+1)z_n^j.
Using [k_j,k_(j+1)]=-i j_j gives (3).
<1>3. Every k_j and j_j is self-adjoint. Conjugating the scalar phases and
real shifts proves the adjoint identity.
<1>4. QED BY <1>1–<1>3. This proof uses no TL relation or integrability.

The Fourier expression may be used for all integers, but high aliases do not
represent distinct continuum modes. One optional finite definition sets modes
outside a symmetric |n|<N/2 window to zero; every fixed finite word eventually
lies inside it. No statement identifies lattice aliases with continuum modes.

If e_N=E_0(N)/(N v_N), then

    T_(N,0)+Tbar_(N,0)
       = N/(2*pi*v_N)(H_N^raw-E_0(N)) + 2 b_N.                 (4)

With zero vacuum current, choosing b_N=0 gives zero vacuum mode expectations.
If instead e_N is the bulk energy density in velocity-one units, b_N must
compensate the finite-size vacuum energy; b_N->c/24 is a **matching target**,
not an extra subtraction to add after already subtracting the exact vacuum.
The two choices differ only in the zero mode for fixed nonzero |n|<N.
Replacing T_n by T_n+d delta_(n,0) changes c to c+24d and leaves c_star fixed.
Consequently an incorrect cubic anomaly cannot be repaired by shifting energy.

CA-86's first-order history expansion makes (2) a sum of one-density insertions
and ordered differences of two neighbouring density insertions. The categorical
evaluation fixes recoupling; the coefficients and geometry fix dynamics.
This identifies the microscopic object to estimate. It establishes no isotropy,
critical velocity, state bound, or stress Ward identity. CA-87's general blocking
lemma transports this finite algebra after blocking, without supplying P.

## 2. What TL and the quadratic benchmark actually provide

**Source-local boundary.** The finite relations
e_j^2=delta e_j, e_j e_(j+-1)e_j=e_j, and distant commutativity reduce local
products in every representation (KS:596–601). In the appropriate integrable
family the transfer-matrix logarithm supplies energy, the adjacent commutator
current, and higher local charge polynomials (KS:727–744). These are the useful
mechanisms: a small local relation algebra, a controllable spectral family,
and a representation-specific way to follow low-energy states.

“All representations” does **not** mean that TL proves A2 or A4. KS:816–830
says the expressions can be defined in other representations and conjectures
their stress interpretation. GS:672 qualifies the irreducible-module reduction
by genericity and immediately emphasizes representation-dependent gluing.
GS:2504–2526 and :3258 explicitly leave precise convergence unproved and
restrict intermediate states before taking the second limit. GS:3191–3198's
modified cubic coefficient is a conjecture about commutators, not a theorem
about all products. Its phase modification does not remove that anomaly
(GS:3201–3213). The scalar product is also substantive data.

Thus a general categorical analogue of the useful TL structure is the following
**proposal**, weaker algebraically and stronger analytically: supply a finite
local tile-relation presentation stable under dagger/translation, a compatible
positive grading of scaling states, and estimates for the matrix blocks of the
*evaluated Fourier tile sums* between grading shells. Integrability is one
possible method for obtaining these estimates, not an assumption in D4-P.
The bound ||T_N||=O(N^2), obtainable by summing bounded local densities,
does not imply any uniform relative-energy bound.

There are two different free-field steps to replace:

1. `fermion/PROOF.md:50–65` treats a single weighted shift: different input
   momenta have different output momenta, so its norm is the maximum scalar
   coefficient. Its normal-ordering argument at :82–117 reduces the central
   trace to finitely many crossings. An interacting density can connect many
   states in each momentum sector; neither reduction survives from locality.
2. The **independent two-mode block** argument is actually in
   `fermion/WILSON_PROOF.md:52–79`, not the KS proposition. Quasi-free
   factorization turns covariance drift into a dual state-norm bound by
   telescoping tensor products. Interacting states have no such factorization;
   covariance convergence does not determine their higher correlations.

CR-2/CR-3 in CA-83 are an instructive intermediate resource: products of
auxiliary currents stabilize on fixed excitation cores because positive modes
annihilate above the available energy. The construction still uses ambient
CAR currents; it is neither a local interacting categorical encoding nor a
global A2 estimate. CA-85 explicitly preserves that locality gap.

**No-wrap is an operator modification, not a boundary slogan.** The benchmark
removes cyclic one-particle transitions at the ultraviolet edge; it does not
remove physical spatial periodicity. For a general ring choose translation
eigenvalues exp(2*pi*i*q/N) and branch I_N of integer q representatives. Since
U T_n U^* = exp(-2*pi*i*n/N)T_n, a possible branch-filtered operator is

    T_n^nw = sum_(q in I_N, q-n in I_N) Pi_(q-n) T_n Pi_q.     (5)

It preserves adjoint pairing; barred modes instead require q+n in I_N.
However Pi_q is a global many-body momentum
projector; (5) is generally not a local tile Fourier sum. Low energy need not
avoid the branch edge. A comparison bound for T_n-T_n^nw, including products
and transport, is mandatory before (5) can establish the original KS limit.
The main theorem below applies to the raw prescribed modes when P holds; it
does not install (5) as a universal repair.

## 3. A regularity choice and a sufficient interacting-chain property

The natural physical candidate is the rescaled excitation energy

    E_N = N/(2*pi*v_N)(H_N^raw-E_0(N)) >= 0.                   (6)

Using unrescaled H_N would miss the shrinking microscopic gaps. But even
1+E_N almost never intertwines exactly with a proposed refinement: A1 would
preserve all old eigenvalues exactly, much more than spectral convergence.
The useful division is **physical energy E_N for interpretation**, versus
an exactly transported **auxiliary Q_N for regularity**. Proving a uniform
comparison of their graph scales is a further microscopic obligation.

One can always construct a formal Q from weighted successive orthogonal
complements of an isometric tower. This only gives A1; suitable weights might
destroy P or its relation to physical energy. It is not an analytic solution.
On an integrable line, positive functions of commuting self-adjoint conserved
charges can be candidates if their spectral labels transport compatibly and
their graph norms control stress. A transfer matrix need not itself be positive
or self-adjoint. Defect-sector projectors alone do not resolve excitations
within a sector. Any finite collection of uniformly bounded defect charges
gives a uniformly bounded polynomial control, not an unbounded energy scale.

**Property P [explicit sufficient hypothesis; not synthesized from C].**
Use the same finite Hilbert spaces and isometries as the proposed GNS system.
For every mode pair and each chirality require the following, including mixed
residuals R^(+-)_(r,m,n)=[T_(r,m),Tbar_(r,n)] with no linear or central term.
Constants are independent of r.

P0. Q_r>=1, Q_(r+1)J_r=J_r Q_r, and T_(r,n)^*=T_(r,-n).
Let E_(r,a)=1_[2^a,2^(a+1))(Q_r), a>=0, and P_r(Lambda)=1_[1,Lambda](Q_r).

P1. For every d>0 there is C_(n,d)<infinity such that

    ||E_(r,a) T_(r,n) E_(r,b)||
       <= C_(n,d) 2^b 2^(-d |a-b|).                          (7)

This is a bound on **spectral blocks of a Fourier tile sum**, not a bound on
the sum of absolute values of microscopic coefficients. It includes all shell
multiplicities and both low-to-high and high-to-low transitions.

P2. Define z_mn=delta_(m+n,0)(m^3 c_star-m c)/12 and
R_(r,m,n)=[T_(r,m),T_(r,n)]-(m-n)T_(r,m+n)-z_mn*1.
For every fixed Lambda and every real t>=0,

    ||Q_r^t R_(r,m,n) P_r(Lambda)|| -> 0.                     (8)

Equivalently **under P1**, it suffices that each fixed residual block
||E_(r,a)R_(r,m,n)E_(r,b)|| tends to zero; the proof below supplies output
tightness. An arbitrary finite list of vacuum matrix elements cannot replace it.

P3. With Delta_(r,n)=T_(r+1,n)J_r-J_r T_(r,n), for each real t>=0 there
are A_(n,t), gamma_(n,t)>=0, and alpha_(n,t)>0 such that, for all Lambda>=1,

    ||Q_(r+1)^t Delta_(r,n) P_r(Lambda)||
       <= A_(n,t) 2^(-alpha_(n,t) r) Lambda^gamma_(n,t).       (9)

P3 is a **full-output, low-input** estimate. It must hold on the entire low
spectral subspace. The total state-space dimension may grow. With polynomial
physical-size errors, geometric N_r can yield the geometric r dependence;
this must be proved for the chosen schedule. Mere summability of an unoptimized
low-core error sequence is not enough after trading errors against cutoffs.

**Theorem D4-P [proved conditional reduction].**
ASSUME P0–P3. PROVE that K_r=Q_r^p, any fixed integer p>1, satisfies VR-1
A1–A4; hence the mode algebra and every finite word converge on its smooth
domain. Genuine Virasoro requires additionally c_star=c in the chosen origin.

<1>1. P1 gives first-order bounds at every Q graph order t.
  <2>1. The (a,b) block of Q^t T_n Q^(-t-1) has norm at most
  2^t C_(n,d) 2^(-(d-t)|a-b|), for d>t, BY spectral bounds on each shell.
  <2>2. Row and column sums of this scalar majorant are at most
  M_(n,t)=2^t C_(n,d)(1+2^(-(d-t)))/(1-2^(-(d-t))).
  <2>3. For block vectors x_b, use
  (sum_b a_ab ||x_b||)^2 <= (sum_b a_ab)sum_b a_ab ||x_b||^2,
  then sum over a. Thus the operator norm is at most M_(n,t), with no
  shell-dimension factor. QED for the first-order bound.
<1>2. A2 follows at t=ps because
K^s T_n K^(-s-1)=(Q^(ps)T_n Q^(-ps-1))Q^(-(p-1)).
A1 follows by functional calculus from P0; adjoints are already P0.
<1>3. Products have uniform second-order bounds. In particular

    ||Q^t R_mn Q^(-t-2)|| <= B_(mn,t),                       (10)
    B_(mn,t)=M_(m,t)M_(n,t+1)+M_(n,t)M_(m,t+1)
                +|m-n|M_(m+n,t)+|z_mn|.

  <2>1. Insert Q^(-t-1)Q^(t+1) between the two factors and use <1>1.
  <2>2. The linear and scalar terms lose at most two powers since Q>=1.
<1>4. Split the input at Lambda. At t=ps the K-weighted residual norm is
bounded by

    ||Q^t R P(Lambda)|| + B_(mn,t) Lambda^(-2(p-1)).          (11)

  <2>1. The low part uses contractivity of the remaining inverse Q power.
  <2>2. The high part factors (10) followed by
  (1-P(Lambda))Q^(-2(p-1)); these last two factors commute.
  <2>3. First choose Lambda large, then r large using P2. This proves A4.
<1>5. Exact Q transport and <1>1 give
||Q_(r+1)^t Delta_(r,n)Q_r^(-t-1)||<=2M_(n,t).
The same input split gives the A3 bound

    e_(r,n,s) <= A_(n,ps)2^(-alpha_(n,ps)r)Lambda^gamma_(n,ps)
                   +2M_(n,ps)Lambda^(-(p-1)).                (12)

  <2>1. Choose Lambda=2^(theta r), theta>0 with theta*gamma<alpha.
  Both exponents are strictly negative; their geometric series converge.
  <2>2. A different theta for each n,s is permitted: these are estimates
  of the same operators, not different definitions or refinement schedules.
<1>6. QED BY <1>1–<1>5 and the already proved VR-1 product argument.
No positive-energy theorem, essential self-adjointness or fidelity is added.
The smooth domain is unchanged by this choice: the powers ps are cofinal, so
intersection_s Dom(Q^(ps)) equals intersection_t Dom(Q^t).

**D4-B [proved: the fixed-block version of P2].**
ASSUME P1 and norm convergence to zero of every fixed residual block.
PROVE (8). For clarity denote shell indices by a,b and the intermediate one u.

<1>1. For a product, multiply the two estimates (7) and sum over u.
Its scalar envelope is 2^(2b) times
sum_u 2^(u-b)2^(-D(|a-u|+|u-b|)). For any desired d, choose D>d+2.
By the triangle inequality this sum is bounded by C_d 2^(-d|a-b|).
The linear and scalar residual terms satisfy the same order-two envelope.
<1>2. For a fixed input cutoff only finitely many b occur. Multiplying the
envelope by 2^(t(a+1)), summing its geometric tail for large a, and applying
the block argument in D4-P makes the omitted output norm uniformly small.
<1>3. The remaining finite rectangle tends to zero in norm by hypothesis.
QED BY <1>1–<1>3. “Fixed block” still includes its entire changing multiplicity.

The spare power p>1 is essential to this particular upgrade. On a nested
Hilbert space with orthogonal pairs a_j,b_j and Q=2^j on the j-th pair, let
T_(r,1)=2^r|a_r><b_r|, T_(r,-1)=T_(r,1)^*, other modes zero, c=c_star=0.
Then all fixed blocks eventually vanish and P1 holds, but
R_(r,1,-1)=2^(2r)(|a_r><a_r|-|b_r><b_r|) has
||Q^t R Q^(-t-2)||=1, whereas ||K^s R K^(-s-2)||=2^(-2(p-1)r).
This counterexample isolates the A4 upgrade; it does not satisfy A3.
It also explains why stronger weights are useful without claiming that they
can erase an anomaly already visible on the compatible GNS vacuum: exact Q
transport keeps that vacuum in a fixed Q cutoff, so such an anomaly fails P2.

**D4-I [proved sufficient way to obtain P1].**
ASSUME, uniformly in r, for every integer k>=0,
||ad_(Q_r)^k(T_(r,n)) E_(r,b)||<=A_(n,k)2^((k+1)b), for both n and -n.
PROVE (7). Here ad_Q(X)=[Q,X]; this is a new analytic hypothesis.

<1>1. For a>=b+2, spectra of Q on the two shells are separated by
g>=2^(a-1). The inverse of X->Q_a X-X Q_b has norm <=1/g:
write its inverse as integral_0^infinity exp(-t Q_a)Y exp(t Q_b) dt.
<1>2. Apply that inverse k times to the corresponding block of ad_Q^k(T).
The result is <=2^k A_(n,k)2^b 2^(-k(a-b)).
<1>3. Reverse the shells using T_n^*=T_-n; the bound has 2^a<=2^b.
For |a-b|<=1 use k=0. Choose k>d and enlarge a constant.
QED BY <1>1–<1>3. No integrable spectrum is assumed.

This exposes possible research inputs. Repeated commutators of a local H with
a density remain on expanding finite patches, but their elementary operator
norm bounds contain the extensive rescaling of (6); they do not prove D4-I's
uniform **relative-energy** bounds. Lieb–Robinson control plus momentum-sector
information would need exactly such an added low-energy estimate and uniform
control of sector multiplicities. On an integrable line, charge eigenvalues
and form-factor estimates could instead bound (7) directly. Conformal
perturbation around an independently constructed fixed point could supply
(8)–(9) only with remainder bounds uniform in the growing energy cutoff and
with all marginal/relevant directions controlled. These are proposals; none
is a theorem supplied by the local sources for general C.

## 4. Refinement exposes leakage, compression and geometry separately

Fix a placement from N to M sites and its isometry V, as in CA-68/CA-71.
The following identities hold in the open tower; a ring application also
requires the declared seam-compatible extension. Set P=VV^*, Pperp=1-P.
For every fine density define the **coarse compression** and **leakage**

    B_a=V^* k'_a V,       F_a=Pperp k'_a V.

**D4-R [proved: exact refinement defect in evaluated tiles].**
ASSUME these definitions and the KS prescription. PROVE

    C_a:=V^* j'_a V
       = i([B_a,B_(a+1)]+F_a^*F_(a+1)-F_(a+1)^*F_a),        (13)
    Delta_n=T'_(M,n)V-VT_(N,n)
       = Pperp T'_(M,n)V + V(V^*T'_(M,n)V-T_(N,n)),          (14)
    V^*T'_(M,n)V
       = a_M sum_a z_(M,n)^a(B_a-e_M*1-C_a)
                     +b_M delta_(n,0)*1.                    (15)

<1>1. Insert 1=P+Pperp between k'_a and k'_(a+1).
The P term compresses to B_a B_(a+1); the other to F_a^*F_(a+1),
using Hermiticity. Subtract the reversed product and multiply by i.
<1>2. Decompose T'V into its P and Pperp components and use V^*V=1.
<1>3. Substitute (1) into the compression. QED BY <1>1–<1>3.

Everything in (13)–(15) is a finite tile contraction, evaluable with the given
F-symbols, multiplicity indices, placement and coefficients. Even if density
compressions match, compressing a current is not generally the current of
compressed densities: the F_a^*F_b terms are the exact missing contribution.
The two components of (14) have orthogonal ranges in the Hilbert norm.
For graph norms that orthogonality additionally needs a compatible Q;
otherwise use the triangle inequality with the actual weighted maps.

To exhibit the geometric error, choose a local stretched representative S_j
of k_j, obtained by inserting the unit inside its fine support and leaving
identity on spectator sites. Then S_j V=V k_j and
i[S_j,S_(j+1)]V=V j_j. Direct subtraction gives

    Delta_n = {a_M sum_a z_(M,n)^a(k'_a-e_M-j'_a)
              -a_N sum_j z_(N,n)^j(S_j-e_N-i[S_j,S_(j+1)])}V
                 +(b_M-b_N)delta_(n,0)V.                    (16)

Equation (16) computes the requested N+1 comparison by taking M=N+1; it also
applies to blocked placements. Its three errors are fine-vs-stretched tiles,
Fourier phase/scale/velocity changes, and scalar origins. A single inserted
vacancy changes the index phases on every subsequent site: even a density
error confined near the vacancy does not make the KS error confined there.
For N_r growing geometrically, a proved O(N_r^-epsilon) bound is summable;
an O(1/N) bound on all successive site counts is not.
The stretched support spans phi(j) through phi(j+1); uniformly bounded range
requires uniformly bounded placement gaps. Arbitrary placements need not have it.

**Support correction to a tempting use of CA-73.** The global corner image
theta(k_j)=V k_j V^*=S_j P pins *all* inserted spectator slots to vacuum.
It is not generally the same operator on the full fine Hilbert space as the
local S_j. CA-73's polynomial transport is valid in the corner, whose identity
is P; constants must also map to multiples of P. Its asserted local support
must be read via a local representative, not by dropping the spectator P
from a global corner operator. This is a direct consequence of V's tensor
definition; (13) shows why extending away from that corner matters dynamically.

**D4-V [proved: bare dyadic insertion erases two-site energy coupling].**
ASSUME the fine Hamiltonian is a sum of nearest-neighbour k'_a, and V inserts
one vacuum after each coarse site, without dressing. PROVE V^*(sum_a k'_a)V
is a sum of one-site coarse morphisms.

<1>1. Every fine bond meets one occupied-capable coarse factor and one fixed
unit summand. Its compression is either
(id tensor iota^*)k'(id tensor iota) or
(iota^* tensor id)k'(iota tensor id), an element of End_C(O).
<1>2. Summing all fine bonds sums these one-site terms. QED BY <1>1–<1>2.

Thus if the coarse energy is outside the linear space of one-site sums plus
scalars in this representation, simultaneous exact covariance of T_0 and
Tbar_0 is impossible for this bare refinement. This criterion is stated in
fusion-space algebras, so it does not confuse fusion constraints with nonlocality.
It does not say compressed currents are one-site: virtual leakage in (13)
can mediate two-site terms. Dressed V or bounded-range fine interactions
change the premise; they are precisely the missing dynamical choices.

**D4-N [proved: exact full-stage covariance cannot trivialize A3].**
ASSUME nonzero finite Hilbert spaces, A1, A4, adjoint pairing, and
T_(r+1,n)J_r=J_r T_(r,n) for **all modes on the entire finite space**.
PROVE c_star=0; moreover T_n=0 for n!=0 and T_0=c*1/24 at every stage.

<1>1. Exact covariance gives R_(s,m,n)J_(s<-r)=J_(s<-r)R_(r,m,n).
By A1 and A4 its norm on each fixed vector tends to zero as s increases.
The left and right transported norms agree, so R_(r,m,n)=0 already at r.
<1>2. Let D=dim H_r. Tracing the (1,-1) and (2,-2) brackets gives
0=2 Tr T_0+(c_star-c)D/12 and
0=4 Tr T_0+(8c_star-2c)D/12. Subtract twice the first: c_star D/2=0.
<1>3. [T_0,T_n]=-nT_n and T_0=T_0^* imply T_n=0 when |n| exceeds
the finite spectral diameter of T_0. For any k!=0 choose a so large that
T_a=T_(k-a)=0 and 2a-k!=0. Their bracket forces T_k=0.
<1>4. The (1,-1) bracket now gives T_0=c*1/24. QED BY <1>1–<1>3.

For genuine Virasoro c_star=c, this is only the zero representation.
One can manufacture exact covariance using T'=VTV^*+Pperp BPperp or
transported stretched densities; D4-N shows why this does not solve the
nonzero-charge scaling problem. Exact Q covariance, exact categorical
relations, and **eventual equality on each fixed low core** are not excluded.
CA-73 transports residuals; it does not make them vanish. The useful target
for modes is summable approximate transport, with leakage controlled by (9).

## 5. Extended fields are necessary data, not renamed defect operators

**D4-G [proved conditional character-growth obstruction, general C].**
ASSUME a finite set of convergent ordinary unitary sector characters transforming by
the supplied modular S, with S_(0,a)>0, a weight-zero vacuum, and c>1.
PROVE the vacuum sector cannot be a finite sum of Virasoro highest-weight
modules counted with multiplicity. These hypotheses are stronger than an MTC.

<1>1. If there were M such modules, PBW spanning and nonnegative weights give
chi_0(i beta/(2*pi)) <= M exp(beta*c/24) product_(n>=1)(1-exp(-beta*n))^-1.
Null quotients only reduce dimensions.
<1>2. Expanding the positive logarithmic series and using exp(x)-1>=x gives
log product <= sum_(k>=1)1/[k(exp(beta*k)-1)] <= pi^2/(6 beta).
For completeness, the last constant follows from Parseval for x on [-pi,pi]:
its sine coefficients are 2(-1)^(k+1)/k and its squared mean is pi^2/3,
so sum_k 1/k^2=pi^2/6. The scalar identity is also symbolically checked.
<1>3. Modular covariance and the positive vacuum row give
chi_0(i beta/(2*pi)) >= S_00 exp(pi^2*c/(6 beta)).
<1>4. For beta->0 the lower exponential exceeds <1>2 when c>1.
QED BY <1>1–<1>3. This lifts LC-12 section 5 without category-specific data.

It follows that finite Virasoro-primary content cannot certify such a rational
target. This does not force weight-one currents or a particular extension;
it does not say infinitely many *strong generators* are required. Stress plus
a finite nontrivial generating set can contain infinitely many Virasoro families.

Three candidate microscopic sources must be kept distinct:

- **Closed topological defects.** In AFM's projector family, D_a commutes
  with every local projector, hence with H, and D_a D_b=sum_c N_ab^c D_c
  (AFM-T:186–212). These are exact categorical symmetry constraints, even
  away from integrability. If [E,D_a]=0, every polynomial in the D_a also
  commutes with E. It cannot equal a nonzero W_n with [E,W_n]=-nW_n, n!=0.
  Defect endpoints and junction fields may supply local candidates, but their
  scaling weights, stress OPEs and positivity are extra equations.
- **Higher conserved densities.** A commuting charge is a zero mode.
  Taking nonzero Fourier modes of its local density is a concrete proposal;
  conservation alone does not prove that these are chiral fields or independent
  strong generators. They may instead be composites of the existing stress.
- **Affine/current candidates.** If a chosen categorical realization comes
  with local microscopic currents, one may seek current brackets and a
  stress reconstruction. A quantum-group label by itself supplies neither
  continuous affine currents nor their level, energy bounds and local limit.

AFM's displayed formulas assume self-duality, multiplicity-free fusion and
specified pivotal/FS simplifications (AFM-F:175–184). The arbitrary-C statement
here retains orientations and multiplicities; a full defect compiler must do
the same. No simplified six-j formula is silently promoted to general C.
HKV:568–601 supplies exact algebras on fields modulo correlation-null fields;
that carrier is not a finite Hilbert matrix algebra and not automatically the
positive GNS quotient used by VR-1. ZW:894–895 explicitly asks for approximants
to every Hermitian generating field beyond the stress-only case.

The required extended algebra is fixed by the **same sewing data S**. Write
A_ab^(j) for the field of state a_(j)b in its singular OPE. In the proposed
conformal-mode indexing its bracket is

    [W^a_m,W^b_n] = sum_(j>=0) binom(m+d_a-1,j)
                            (A_ab^(j))_(m+n).                (17)

Here wt(A_ab^(j))=d_a+d_b-j-1, and its subscript is its conformal mode index.
For fixed a,b the singular sum is finite; the coefficient fields can be
derivatives and normally ordered composites, not just generators. This formula
follows by taking the two Laurent coefficients of SCH:6424, with
W^a_m=a_(m+d_a-1); it avoids the missing b in the extraction at SCH:6420.
For stress, A^(0)=partial T, A^(1)=2T, A^(3)=c*1/2 gives m-n and
c(m^3-m)/12. This is independently checked, including the mode-weight shift.

**D4-X [proved conditional extended-mode transport].**
ASSUME A1, a compatible GNS vacuum Omega_(r+1)=J_r Omega_r, and a finite
Hermitian generating list, with integers ell_a>=1 and

    ||K_r^s W^a_(r,n)K_r^(-s-ell_a)|| <= C_(a,n,s),
    ||K_(r+1)^s(W^a_(r+1,n)J_r-J_r W^a_(r,n))
                              K_r^(-s-ell_a)|| <= e_(r,a,n,s),
    sum_r e_(r,a,n,s) < infinity.                            (18)

For each fixed operator relation (17), translation/null relation or specified
defining OPE relation, and each output order s, assume a fixed finite loss L
such that ||K_r^s R_r K_r^(-s-L)||->0. L is independent of r and internal
truncation. Vacuum-vector residuals converge in each stated graph norm;
the compatible vacuum is smooth by A1 and finite dimensionality at stage zero.
A product loses the sum of the ell_a of its factors. Whenever
a coefficient field uses an infinite normal-ordered mode sum, additionally
assume its truncated sums have uniformly vanishing graph-norm tails at a
specified larger input order, with loss independent of r and truncation;
merely computing a finite truncation is not enough.
PROVE the limiting fields satisfy those same mode relations on the smooth domain.

<1>1. Telescope individual modes using (18), then extend between complete graph
spaces exactly as VR-1 does. Use all s to preserve the smooth domain.
<1>2. Telescope a finite word one factor at a time, assigning each bound the
graph order consumed by its suffix. Uniform word bounds identify the limit
with the product of limiting modes, rather than a separate limiting operation.
<1>3. For composite fields first fix the internal summation cutoff. Apply
<1>2; then remove the cutoff using the uniform graph-tail assumption.
<1>4. Residual convergence passes each relation to the limit, and adjoints
pass as pairings. QED BY <1>1–<1>3. This proves a mode-algebra statement only.

Energy positivity, essential self-adjointness, strong locality of smearings,
integration, vacuum cyclicity and complete charged sectors must still be
proved or identified with the supplied target. Bounds polynomial in |n|
are additionally needed for general smooth smearings. A defect fusion ring,
even an exact one, neither excludes extra sectors nor identifies their braiding.
D4-C requires the stronger local/sewing equivalence, not just (17).

## 6. Verification and research boundary

The small exact check bundle is `checks/check.py`, orchestrated by
`python3 explorations/2026-10-22-astra/D4-koo-saleur-beyond-free/checks/run_checks.py`.
It checks finite continuity/Fourier signs, compressed-current leakage,
the transport split, stretched-vs-global-corner support, the dyadic compression,
central-origin and trace identities, the regularity counterexample, and the
stress specialization of (17). Deliberate mutations must fail before the
restored run passes; raw outputs and producer hashes are retained in `checks/`.
The completed run has **20 passing exact equality checks and five rejected mutations**;
two additional calibration nondegeneracy assertions also pass. The largest
matrix is 16 by 16; `checks/restored.txt` records software versions and results.
These checks validate algebra, not P for an interacting chain or D4-C.

Read-only collaborators independently checked source scope and the analytic
reduction. Source review rejected an “all representations” convergence reading
and distinguished the two quadratic arguments. Analytic review verified the
graph exponents and required control of complete shell multiplicities, not
individual vectors. A failed patch application during writing changed no file;
it was reapplied with the correct context. No network, Julia suite, report
build, source acquisition, repository-wide edit or commit was performed.

## Results ledger

- D4-C — **conjectural:** universal local categorical discretization of effective positive rational sewing completions, with standard KS and full fidelity.
- D4-T — **proved:** tile current, exact continuity, Fourier density bracket and adjoint pairing in the declared periodic representation.
- Energy-origin identity (4) — **proved:** exact finite vacuum subtraction and b_N are distinct; scalar shifts change only the linear central term.
- TL scope — **source-local/negative:** polynomial portability and integrability machinery do not establish uniform KS convergence in every representation.
- No-wrap (5) — **scaffold:** a defined, adjoint-compatible global filter; raw KS equivalence and locality are unproved.
- D4-P — **proved conditional:** P0–P3 imply VR-1 A1–A4 with K=Q^p, p>1, and the same smooth domain.
- D4-B — **proved conditional:** rapid shell tails upgrade all fixed-block residual convergence to full-output low-input convergence.
- D4-I — **proved conditional:** relative iterated-Q-commutator estimates imply the spectral-shell hypothesis.
- Spare-regularity counterexample — **proved negative:** first-order shell control plus low-block closure alone does not imply A4 at p=1.
- D4-R — **proved:** exact tile compression/leakage formula and the three-part KS refinement defect.
- D4-V — **proved negative:** bare dyadic insertion compresses nearest-neighbour energy to one-site sums.
- D4-N — **proved negative:** exact full-stage mode covariance plus A4 forces zero cubic anomaly and only a scalar zero mode.
- D4-G — **proved conditional:** positive modular-character covariance at c>1 excludes finite Virasoro-primary content in the vacuum sector.
- D4-X — **proved conditional:** extended generating modes and controlled composite tails obey their limiting mode algebra.
- Interacting P instance, local OAR implementation, symmetry integration, categorical completeness — **open**, not inferred from any entry above.

## What this gives the integration

CA-65–74 supply the finite morphisms and placements; (13)–(16) expose their
dynamical defect before any state estimate is attempted. CA-73's exact residual
transport remains useful inside its corner, while D4-N rules out using it to
freeze a nontrivial finite Virasoro representation. CA-86 supplies the local
history/tile dictionary consumed by (2); CA-87's general blocking criterion
preserves local algebra but supplies none of the spectral estimates.

CA-14/70 give the prescription and its cautions; D4-P supplies a more concrete
route into CA-81/VR-1 than fixed-core convergence alone. It does not replace
WT-1 or the CA-72 state/GNS descent problem. D4-I names an estimate for local
commutator or integrable methods to attack. CA-83/85 calibrate fixed-core and
smearing techniques while explicitly leaving local categorical encoding open.

LC-1–5's Ward/stress/flux equations can propose low-energy residual identities;
D4-B explains the additional output-tail estimate needed to promote them.
LC-9/10's full-carrier positive sewings supply candidate extended-field
coefficients, while D4-G explains why one Virasoro tower per categorical label
can fail. D4-X transports those fields only when their own estimates hold.
Fidelity remains the complete local/sewing comparison in D4-C, consistent with
`realisation_and_fidelity.md`; a central charge or defect fusion ring is insufficient.

## Open problems

1. Construct a nontrivial general-category family with P1 and P2 for its **raw**
   KS modes. A fixed-energy ultraviolet anomaly is a failure witness, not a
   choice of zero-mode origin. Prove c_star=c and the mixed-chirality limit.
2. Produce local dressings and tile coefficients making (16) satisfy P3 in the
   same GNS system as WT-1. Compare the auxiliary grading with physical energy;
   do not require the physical spectrum to intertwine exactly.
3. Extend open placements to a specified periodic categorical representation
   and unital local OAR maps, or prove an appropriate soft-system variant.
   Vacuum insertion as a corner alone does not solve either task.
4. Derive P1 by relative commutator estimates, complete form-factor bounds,
   or controlled fixed-point perturbations. None follows from finite tile
   identities, ordinary finite-volume norm bounds or a criticality label.
5. Construct endpoint/current/higher-density avatars of every necessary strong
   generator, with null descent, common domains and composite-tail estimates.
6. Prove one coherent local equivalence and complete sector correspondence to S.
   The bare-category existence of S and effective construction of S remain
   separate, potentially harder problems than the inverse discretization conjecture.

## Examples table

| Calibration only | What is supported; what is not |
|---|---|
| Source-modified free fermion | `fermion/PROOF.md:50–65,82–117` supplies fixed-core KS errors and finite crossing cocycles; `WILSON_PROOF.md:52–91` supplies independent-block state drift. These are not a verified P instance here. |
| Current-built coset stress | CA-83 CR-2/CR-3 proves eventual core equality for quartic CAR polynomials; CA-85 transports smearings. Neither identifies a local fusion-space realization. |
| Fibonacci four-port character diagnostic | LC-12:169–203 proves a finite-primary obstruction at its selected c=14/5 under modular-character covariance. D4-G generalizes the argument to every positive-row modular character system with c>1. |
| Zini–Wang Ising chains and HKV discrete Gaussian/Ising fields | ZW:125–129 distinguishes its proved instance from conjectural extensions; HKV:568–601 acts on correlation-quotient field spaces. Neither supplies arbitrary-C raw KS/OAR convergence. |

## Sources used

Abbreviations below always designate local ground truth. New proofs above are
local derivations, not results attributed to these papers. Manifests were read
at their relevant entries; no source was fetched or changed.

- **KS:** `references/lattice-symmetry/KooSaleur1993/source/9312156.tex:596–601,606–648,704–744,816–830,1068–1108,1623–1673`. Registry: `references/lattice-symmetry/SOURCES.md:9–102`.
- **GS:** `references/lattice-symmetry/GransSamuelssonEtAl2020/source/Linnea11.5.tex:672,791–820,2487–2526,3191–3229,3249–3260`. Registry: `references/lattice-symmetry/SOURCES.md:966–1048`.
- **ZW:** `references/lattice-symmetry/ZiniWang2018/source/main.tex:125–129,437–442,871–895`. Registry: `references/lattice-symmetry/SOURCES.md:277–350`.
- **HKV:** `references/lattice-symmetry/HonglerKytolaViklund2022/source/lattice-virasoro-updates-final.tex:565–605`. Registry: `references/lattice-symmetry/SOURCES.md:1666–1736`.
- **AFM-T:** `references/cft/AasenFendleyMong2020/source/_Topological_defect_lines.tex:53–68,168–214`; **AFM-F:** `references/cft/AasenFendleyMong2020/source/_fusion_categories_and_diagrammatics.tex:175–184`; local Hamiltonians: `references/cft/AasenFendleyMong2020/source/_Statistical_mechanics_from_fusion_categories.tex:525–555`. Registry: `references/cft/SOURCES.md:79–139`.
- **SCH:** `references/cft/Schottenloher2008/Schottenloher2008.md:5533–5555,6418–6426`; the intact field commutator at :6424 fixes (17). Registry: `references/cft/SOURCES.md:9–34`.
- Source-modified no-wrap modes: `references/text/CFTFromLatticeFermions.txt:3379–3420`; source/operator-scope distinction also recorded in `cft_machine/benchmarks/fermion/PROOF.md:9–17,50–65,82–143`.
- **Local analytic dependencies:** `cft_machine/research/virasoro_routes.md:57–146,167–192`; `cft_machine/reviews/virasoro_referee.md:153–161`; `cft_machine/benchmarks/fermion/WILSON_PROOF.md:52–98`; `cft_machine/research/realisation_and_fidelity.md:25–62`.
- **Local categorical dependencies:** `report/sections/68_variable_n_refinement_maps.tex:51–103,126–155`; `report/sections/71_refinement_placement_category.tex:56–158`; `report/sections/73_categorical_residual_set.tex:154–202`. The global/local support qualification in section 4 is derived here and is not an endorsement of every sentence in CA-73.
- **Integration dependencies read:** CA-14, CA-70, CA-81, CA-83 CR-2/CR-3, CA-85; `reconstruction/README.md`; `reconstruction/04_cutoff_oar.md:17–175`; `reconstruction/12_fibonacci_four_port.md:169–209`; latest worklog chunk 018; `CONVENTIONS.md:631–885,929–1357` and preceding entries (a)–(q).
- **Other-branch context:** `report/sections/86_spacetime_trotter_dictionary.tex:66–121` and `report/sections/87_dilute_fibonacci_is_blocked_golden.tex:54–70`, read with `git show` at commit `1f402aaf96d2ffb9d8efb0684836d4771bbd5f60` of `origin/claude/festive-franklin-rl8kty`. Only the general tile expansion and blocking identity are used, not the model-specific criticality claims. Working-tree base HEAD was `399dae3ff7dac03a8c82d425e4826f4cc34cce28`.
