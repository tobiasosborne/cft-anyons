# Same-system calibration: the actual Wilson rows and the mode carrier

**Pillar P4. Status: proved, within the sharp-momentum system.** Setting:
AP circle, one family or the explicitly paired two-component extension.
Data: category-free CAR, actual microscopic Dirac states, source-modified
projected modes, the declared sea normal ordering, sharp momentum refinements.
Rung: R1 and nontrivial R2 on one representation system; no locality/R3 claim.

This is an instance of NOTE Theorem C. All inner products are linear in the
second slot. The spinor order is the existing interleaved order of root (w).
The quadratic is complex CAR, without the Majorana factor one-half.

## Statement

ASSUME the actual finite Dirac covariances P_Q and algebra refinements of
`cft_machine/benchmarks/fermion/WILSON_PROOF.md:9–24`; its proved WS-1
conclusion `:28–93`; and the source-modified matrices A_n^M and whole-carrier
certificate in `graph_certificate.md`. Write

`e_+=(1,i)/sqrt(2)`, `e_-=(1,−i)/sqrt(2)`, `U=(e_+,e_-)`,
`p_±=e_±e_±*`, `S_-(r)=1_(r<0)`, `S_+(r)=1_(r>0)`.

PROVE the mode tower, after the explicit spectator extension below, is
unitarily the GNS tower of WS-1's limiting row states on the same CAR
algebra refinements. This assertion does not replace WS-1's microscopic
states by the limiting sea at finite scale.

<1>1. Diagonalization identifies the two limiting chiral seas exactly.

  <2>1. Direct multiplication gives `U*U=I` and
  `U* sigma_y U=diag(1,−1)`. These eigenvectors/projectors agree with
  `references/text/CFTFromLatticeFermions.txt:1176–1186`, equations (61)–(62).

  <2>2. WS-1's row limit is `P_(M,infty)(r)=(I−sign(r)sigma_y)/2`.
  Therefore `U*P_(M,infty)(r)U=diag(S_-(r),S_+(r))`. BY <2>1 and
  `WILSON_PROOF.md:28–41`. The AP grid has no zero label.

  <2>3. The unitary U is independent of r,M. Hence it commutes with every
  one-particle inclusion `j_(M,Q) tensor I_2`, and the induced CAR algebra
  basis changes commute with the unital refinement maps on every generator.
  BY direct evaluation on the generators; their products span the finite
  CAR algebra. The source maps are `CFTFromLatticeFermions.txt:1845–1878`.

<1>2. The GNS Hilbert spaces and refinements are the ones used in the graph
certificate, with a second independent excitation factor included.

  <2>1. A block diagonal covariance `S_- direct-sum S_+` defines the even
  product of the two sea states: both have the same two-point functions,
  and the determinant formula determines every CAR correlation.
  BY `CFTFromLatticeFermions.txt:734–755`, equations (7) and (9).

  <2>2. Represent this state on
  `H_M^tot=F_exc(Gamma_M,S_-) tensor F_exc(Gamma_M,S_+)`, with cyclic
  excitation vacuum `Omega_M^tot=Omega_- tensor Omega_+`. Order the first
  chiral factor before the second; odd generators in the second factor
  carry the parity operator of the first. Even quadratic modes act as
  ordinary tensor factors. This is a choice of presentation of the CAR
  relations, not an identification of odd generators in commuting algebras.

  <2>3. The compatible limiting covariances restrict exactly through
  j_(M,Q). In either factor the refinement preserves all old particle/hole
  labels and inserts excitation vacuum on new labels. It intertwines every
  old CAR generator (including creation for filled physical labels) and
  sends Omega_M^tot to Omega_Q^tot. Thus on the cyclic algebra orbit it is
  exactly the GNS map `[a]_M -> [alpha_Q^M(a)]_Q`. BY <2>1–<2>2,
  source equation (9), and the uniqueness-on-cyclic-vectors proof in
  NOTE Theorem C. This also fixes possible phase choices coherently.

  <2>4. The inductive GNS completion is consequently the excitation Fock
  space for the two infinite half-integer seas. Finite particle/hole
  configurations exhaust its algebraic Fock core. BY <2>3 and completion;
  compare the general OAR/GNS construction at
  `literature/md/2010.11121/2010.11121.md:148–180`.

<1>3. The microscopic modes belong to that same algebra and representation.

  <2>1. In the original spinor coordinates choose the microscopic quadratic
  `mathcal T_(M,n)=Q_(P_(M,infty))(A_n^M tensor p_+)`, using the source
  normal-ordering formula (26), `CFTFromLatticeFermions.txt:879–892`.
  The projected chiral KS coefficient is source equation (145),
  `:2372–2384`, followed by the no-wrap modification (197)–(199),
  `:3379–3418`, with the circle/Fourier normalization fixed by root (w).

  <2>2. The basis change U, followed by regrouping interleaved spinor coordinates
  by chirality, takes the one-particle matrix to `A_n^M direct-sum 0`
  and the covariance to `S_- direct-sum S_+`. The normal-ordering trace is
  invariant under the same conjugation. Thus the operator becomes exactly
  `T_(M,n) tensor I`, not a newly chosen unrelated representation.
  BY <1>1–<1>2 and the displayed quadratic formula.

  <2>3. Set `E_M^tot=E_M^- tensor I + I tensor E_M^+`, where each energy
  is the sum of absolute momenta of particle/hole excitations, and
  `K_M^tot=(1+E_M^tot)^p`. Refinement preserves E^tot exactly. Active
  quadratic moves change E^tot by −n; spectator configurations are unchanged.
  Every row/column sum in Lemma Q is bounded using `E_active≤E_total`.
  Therefore **all** A1–A4 estimates in graph_certificate.md hold on the
  full two-component lattice Hilbert space, including arbitrary spectator
  occupations. BY Lemma Q and its spectator extension, not just a vacuum
  compression of the second factor.

  <2>4. The fixed A5 vector is `v tensor Omega_+`; the same value and
  lower bound `κ=1/(2 sqrt(2) pi)` apply because the spectator has energy
  zero. BY the explicit A5 computation in graph_certificate.md.

<1>4. Optionally both source chiralities live on this same system.

  <2>1. Let `F e_r=e_(-r)`. It sends S_+ to S_- and preserves |r| and
  the windows. The second source coefficient is exactly
  `A_(n)^right=F A_n^M F`: it sends e_r to
  `−cos²(epsilon*n/4)sin(epsilon*(r+n/2))/epsilon * e_(r+n)`.
  BY substitution; this matches equation (145)'s other component.

  <2>2. Transporting its S_+ sea representation by F gives the already
  certified S_- representation. Thus it has the same bounds, ledger
  `c=c*=1`, positive linear limiting zero mode and non-collapse witness.
  Indeed, on every finite excitation configuration the zero-mode coefficients
  tend to the corresponding absolute momenta, so the limiting zero mode is
  precisely that factor's nonnegative E. The graph-domain extension agrees
  by density in every graph norm.
  Its modes act on the second tensor factor; even quadratics on the two
  factors commute at every scale. All mixed residuals are therefore zero.
  BY <2>1, source (26)–(28), and <1>2<2>2.

<1>5. QED BY <1>1–<1>3 (one family), and <1>4 (paired extension).

## Exactly what is identified

WS-1 uses the actual P_Q at every microscopic fine scale. Its horizontal
limit produces P_(M,infty), whose compatible GNS maps are the VR-1 maps.
Those are precisely the GNS maps WT-1 constructs (CA-81:80–83), so R1 and
R2 are now certificates on one state/refinement/representation system.
No intertwining of the **finite Dirac ground-state vectors** is claimed:
P_Q varies with Q and does not factorize in the fixed chiral basis
(`CFTFromLatticeFermions.txt:1198–1205`). Normal ordering here uses the
declared limiting row sea, not a silently substituted finite Dirac vacuum.

The identified system uses sharp momentum algebra refinements, spatially
nonlocal by source `:1892–1894`. The no-wrap stress is the source-modified
prescription. This is neither a proof of standard fixed-support KS on a
categorical local tower nor an R3 local-net theorem. The missing general-C
identification is a state-preserving, refinement-compatible microscopic
realization of the category-derived densities on such an analytic system.

## Check and sources

`same_system_check.py` verifies the fixed spinor covariance/refinement squares,
the source coefficient identification, the reflected second sea/cocycle and
the distinction from actual finite Dirac covariances at M=8,16,32.
These finite assertions calibrate the displayed all-size computations.
The exact command and raw output are recorded in `README.md`.
