# Four-port sewing on full categorical carriers

**Status:** proposed local equations, with conditional linear-algebra
identities proved below. Conventions: CONVENTIONS (ae), (ah), (ai).
These refine LC-1/LC-6/LC-8; no analytic chiral realization or
category-to-lattice-to-CFT existence theorem is asserted.

**Sources and dependencies.**

- `literature/md/1905.04924/1905.04924.md:688–718`: internal homs,
  especially `[b,c] tensor [a,b] -> [a,c]`, fixing left-module order.
- `references/categorical-reconstruction/FuchsRunkelSchweigert2002/source/hep.tex:2461–2493`:
  multiplicities, full-state chiral vertex operators and descendants;
  an individual coupling need not have a primary-leading coefficient.
- Same FRS file `:2495–2515`: changing physical boundary labels and
  four-boundary sewing; `:5786–5815`: the MTC lacks functional dependence
  and evaluation on external chiral states.
- `references/categorical-reconstruction/BrehmRunkel2024/source/main.tex:728–776,799–807`:
  oriented disc pairing, dual bases, anomaly and cutting sums;
  `:1005–1019`: normalization dependence of the OPE/F identification.
- `references/cft/Schottenloher2008/Schottenloher2008.md:5151–5195,5199–5249`:
  conformal families and schematic channel expansions/crossing.

## 1. Physical boundary labels and two decompositions

Keep LC-1's LEFT module convention
`M_ab^i=Hom_M(i acting on a,b)` and
`D_ab=direct-sum_i M_ab^i tensor V_i`, initially on finite-energy cores.
An elementary composition cell therefore has type

    B_abc(q): D_bc tensor D_ab -> D_ac tensor L_abc(q).           (1)

This order agrees with the cited internal-hom composition. Switching to
`D_ab tensor D_bc` requires an explicit changed action/order convention.
For boundary labels a0,a1,a2,a3 take u in D_a2a3, v in D_a1a2,
w in D_a0a1 and output d in D_a0a3. The four ports are three inputs
and the dual output; physical boundary labels are not summed implicitly.

Two bracketings of the SAME parametrized four-port cell Sigma give

    S_L=B_a0a1a3[(P_a1a3(t_L) B_a1a2a3) tensor 1],
    S_R=B_a0a2a3[1 tensor (P_a0a2(t_R) B_a0a1a2)].               (2)

Every B has its own geometry q. Include the prescribed external-coordinate
transports and the anomaly-line sewing identifications, writing

    R_Sigma=Transport_L(S_L)-Transport_R(S_R)=0.                 (3)

The sewing charts must describe the same Sigma; independent choices of
collar lengths do not give an equality. Equation (3) acts on all external
states. Its matrix element against d is only one scalar test. Compare
infinity,1,z,0 initially on 0<z<1 as in (ai), then use specified continuation
paths and parallel transport of coordinates and anomaly lines. L/R names
here refer to bracketing, not to a suppressed permutation of the legs.

## 2. Full carriers, null descent and inverse Gram matrices

V_i, its grade dimensions, inner products, primary multiplicities and full
chiral-algebra action are unknowns. A categorical simple is not one
Virasoro module. Every cell operation must descend through the radicals
of the preliminary positive-semidefinite forms on every port. Thus an
input radical maps into the output radical, and all retained output
covectors annihilate that radical. This invariant-null-space condition
precedes quotienting and must hold for stress, intertwiners and sewing.

After the quotient, choose a basis e_A of a finite energy eigenspace
H_lambda with positive-definite Gram G_AB=<e_A,e_B>, linear second.
Then the internal-state sewing kernel is

    1_Hlambda=sum_AB |e_A>(G^-1)_AB<e_B|,
    ell(P(t)y)=sum_lambda exp(-t lambda)
                    sum_AB ell(e_A)(G_lambda^-1)_AB<e_B,y>.    (4)

Here P(t)=exp(-tE) and H_lambda is an E-eigenspace. A different relation
between cylinder energy and L0 requires its declared normalization.
The sums include categorical and physical multiplicities and all grades.
A pseudoinverse on unquotiented null vectors cannot replace null descent.

**Lemma FP-G [derived].** **ASSUME:** a finite positive quotient, basis
synthesis isomorphism E:C^n->H and G=E^*E. **PROVE:** (4).

- ⟨1⟩1. `E(E^*E)^-1E^* E=E`. BY the inverse Gram identity.
- ⟨1⟩2. Since E is onto H, `E G^-1 E^*=1_H`.
  BY ⟨1⟩1 and the basis hypothesis.
- ⟨1⟩3. On H_lambda multiply this identity by exp(-t lambda), apply
  it to y and then apply ell. Sum the spectral pieces. BY ⟨1⟩2.
- ⟨1⟩4. QED. Infinite sums need the convergence assumptions in section 6.

Hermitian sewing in (4) includes the reflection/dual-coordinate
identification of opposite ports. The cited Brehm–Runkel disc pairing is
bilinear and has coordinate-dependent Virasoro signs. It is not silently
the positive Hermitian Gram form. An oriented bilinear description must
use its own dual pairing and agree with (4) only after these identifications.

## 3. Categorical tree bases and dual analytic block bases

For external sectors i,j,k and output l, a left channel is
`a=(e,alpha:i*j->e,beta:e*k->l)`; a right channel is
`b=(f,gamma:j*k->f,delta:i*f->l)`, including fusion multiplicities.
Here * denotes the ordered categorical tensor product. Fix tree KETS by

    t_L,a=sum_b F_cat[a,b] t_R,b.                               (5)

Covector-value columns satisfy K_L=F_cat K_R. Dual block BASIS columns
instead satisfy the desired analytic recoupling equation

    b_L=U_cat b_R,  U_cat=F_cat^(-T).                           (6)

For unitary F_cat this is conjugate(F_cat). The real symmetric
involutory examples of LC-6 conceal this distinction.

**Lemma FP-D [derived].** **ASSUME:** (5), independent tree bases and their
dual bases. **PROVE:** (6)'s matrix conversion.

- ⟨1⟩1. If `b_L=U b_R`, duality gives `U F_cat^T=1`.
  BY evaluating b_L,a on t_L,c.
- ⟨1⟩2. Therefore `U=F_cat^(-T)`. If F_cat is unitary this equals
  conjugate(F_cat). BY ⟨1⟩1 and the inverse/adjoint identity.
- ⟨1⟩3. QED. Realizing these abstract dual bases as state-dependent
  analytic blocks is an additional equation, not a consequence of duality.

If chosen analytic bases are monic, with
`b_L^cat=D_L b_L^mon`, `b_R^cat=D_R b_R^mon`, then

    U_mon=D_L^-1 U_cat D_R.                                    (7)

This follows by substitution into (6). D_L,D_R may be diagonal nonzero
leading coefficients only for independent primary-leading blocks; otherwise
use appropriate invertible basis maps. Such maps are not forced unitary.
A vanishing primary coefficient does not license division. LC-6's binary
alpha,beta therefore are not automatically scalar primary OPE constants
for an arbitrarily chosen monic Virasoro block normalization.

## 4. Boundary coefficients with every intermediate multiplicity

Choose unknown full-carrier charged intertwiners I_ij^(k,alpha) with the
categorical number of channels and the same internal stress as V_unit.
In orthonormal physical multiplicity bases write

    B_abc|_(i mu,j nu -> k rho)
      =sum_alpha C_abc[i mu,j nu;k rho;alpha] I_ij^(k,alpha).    (8)

The first input belongs to D_bc and the second to D_ab. For fixed
external multiplicities mu,nu,rho,sigma set

    K_L[e,alpha,beta]
      =sum_tau C_a1a2a3[i mu,j nu;e tau;alpha]
                C_a0a1a3[e tau,k rho;l sigma;beta],
    K_R[f,gamma,delta]
      =sum_eta C_a0a1a2[j nu,k rho;f eta;gamma]
                C_a0a2a3[i mu,f eta;l sigma;delta].             (9)

Tau belongs to M_a1a3^e; eta belongs to M_a0a2^f. Nonorthonormal physical
multiplicity bases require their dual/inverse-metric contractions as well.
The categorical coefficient equation and analytic amplitude equation are

    K_L=F_cat K_R,   K_L^T b_L=K_R^T b_R.                     (10)

**Lemma FP-C [conditional].** **ASSUME:** independent full-state analytic
blocks satisfying (6). **PROVE:** equivalence of the two equations (10).

- ⟨1⟩1. `K_L^T b_L=K_L^T U_cat b_R`. BY (6).
- ⟨1⟩2. Equality with `K_R^T b_R` is equivalent to
  `K_R=U_cat^T K_L=F_cat^-1 K_L`. BY block independence.
- ⟨1⟩3. QED by ⟨1⟩2. A chosen scalar evaluation may be dependent or zero;
  it cannot establish that independence or reconstruct F_cat.

## 5. Virasoro-primary channels inside one categorical sector

An additional unknown presentation, when available, is
`V_e=Hilbert-direct-sum_p Q_ep tensor L(c,H_ep)`, where Q_ep records
Virasoro-primary multiplicity and L is the positive highest-weight
quotient. LC-1's grading requires H_ep in h_e+nonnegative integers.
These p's are not additional categorical sectors.
For external primaries at infinity,1,z,0 an internal primary contributes

    z^(H_ep-h_j-h_k) sum_n z^n
       sum_AB rho_out(e_A)(G_ep,n^-1)_AB rho_in(e_B).           (11)

The rho's are normalized three-point descendant functionals; independent
highest-state coefficients are separated from the monic series. Equation
(11) inserts (4) grade by grade with L0 covariance. Null vectors have
already been removed. A category block contains the appropriate sum over
p and intertwiner data; it need not begin at the lowest sector weight.
Virasoro Ward identities alone do not make these maps intertwiners of
the entire unknown chiral algebra.

## 6. Analytic compatibility and the forward construction

Require absolute locally uniform convergence of collared state sums and
all derivatives used, on declared cores or in a specified operator
topology. Continue along specified paths, including anomaly-line and
coordinate transport, to compare the same multilinear amplitude.
Collar damping by itself proves no such bound. Cutoff tails require
estimates; finite coefficients do not certify continuation. FRS
:5786–5815 explicitly identifies this missing functional/state-dependent
block embedding beyond the categorical local system and its monodromy.

These equations feed the proposed machine. One must still obtain bounded
range Hamiltonian densities from regular local transfer families, identify
the same energy/current insertions with standard KS, and prove a shared
state/OAR limit with full projective-unitary symmetry and complete input
modular data. A global transfer logarithm is not automatically local.
LC-10 gives positivity and local obstruction conditions for this system.
