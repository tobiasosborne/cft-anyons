# E2 — parity, mixed KS brackets, and the limits of chiral selection

2026-10-22. Status: proved implications, two explicit negative controls, and
identified open implications; **not a proof of E2 as originally worded**.
All categories below are general unitary fusion categories. No model enters
the arguments. The finite checks and the final examples table are calibrations.

The strongest new implication is: **nearest-neighbour KS locality + the two
separate VR-1 certificates + conservation of the normalized total energy
current imply vanishing of every mixed bracket on the common domain**.
A stronger, all-mode momentum Ward certificate gives an explicit decay bound
with four regularity powers lost.
Parity forces equality of both central coefficients even without convergence
of the parity maps. Transporting parity itself needs another certificate.
A local parity-breaking perturbation can be constructed when a nonzero odd
local direction exists; neither its criticality nor chirality follows.

## 1. Scope, notation, and dependencies

These declarations precede their use. The brief prohibits changes to the root
`CONVENTIONS.md`; this is a note-local hypothesis/notation ledger, using its
(s), (v), (af), (al), (ap), not a change to those conventions.

**Categorical layer L0.** Fix C, a site object O, a *declared* periodic Hilbert
representation of the local C-morphisms, a translation U with U^N=1, and
self-adjoint translated densities k_j. All charges/multiplicities are retained
unless a specified invariant carrier says otherwise. Periodic representation,
density, velocity, refinements and state are construction data, not outputs of
bare fusion rules. No braiding or modular data are used. Here k is the
velocity-normalized positive-sign density of (ap): the brief's H=sum h becomes
sum k after division by its declared positive velocity; it is not (ak)'s h.

**Range qualification.** Sections 2–5 assume
`[k_j,k_l]=0` if j,l are not adjacent or equal (cyclically), as in CA-79.
This is the actual scope of (ap)'s current `Jcal_j=i[k_j,k_(j+1)]`.
For a general range-R density, `i[sum k,k_j]` has further terms. Applying the
adjacent-current formula to such a density is not the standard conserved
energy-current prescription. One must first supply a blocking/density split
with the stated commutativity, or prove the corresponding longer-range
current and Fourier identity. We do not silently use the range-two identity
for all finite-range chains. This is an explicit restriction of E2's scope.

Use refinement index r, site count N=N_r tending to infinity, isometries J_r,
and the exactly transported regularity control K_r of VR-1. Write
`||A||_(r;s,d)=||K_r^s A K_r^(-s-d)||`, for integers s,d>=0.
For maps between stages use the output-stage K on the left.
Product estimates use
`||AB||_(s,d+e)<=||A||_(s,d)||B||_(s+d,e)`.
Increasing d weakens this norm since K>=1. This is a displayed operator
factorization, not an assumption that K is the physical Hamiltonian.

Suppress r in finite-stage formulas and put z=exp(2*pi*i/N), a=N/(4*pi),

    E_n = a sum_j z^(nj)(k_j-epsilon_N) + b_N delta_(n,0),
    B_n = a sum_j z^(nj) Jcal_j,
    L_n = T_(r,n) = E_n-B_n,
    S_n = Tbar_(r,-n) = E_n+B_n,
    D_r = L_0-S_0 = -2 B_0.                              (1)

S reverses the barred *index*, not the sign of the barred operator. Letters
without r denote finite matrices until an explicit passage to the limit.
Use separate central ledgers
`z^L_mn=delta_(m+n,0)(m^3 c_L^*-m c_L)/12` and `z^R_mn` analogously.
Thus the residuals are

    F^L_mn = [L_m,L_n]-(m-n)L_(m+n)-z^L_mn I,
    F^R_mn = [Tbar_m,Tbar_n]-(m-n)Tbar_(m+n)-z^R_mn I.     (2)

In particular `[S_m,S_n]=-(m-n)S_(m+n)-z^R_mn I+F^R_(-m,-n)`.
The physical Virasoro normalization requires c_L^*=c_L and c_R^*=c_R;
VR-1 alone does not assert this. We retain the ledger throughout.

Dependencies already proved locally, **cited rather than re-derived**:

- VR-1, `cft_machine/research/virasoro_routes.md:50-150`: A1–A4, limiting
  graph spaces, invariant D, finite-word convergence and adjoint pairing.
- CA-79 Lemma 79.1, `report/sections/79_ks_shell_and_refinement_defect.tex:53-81`:
  the KS formulas and exact neighbouring-density Fourier commutator.
- CA-79 Theorem 79.2, same file `:85-145`: shell certificates, with mixed
  residuals explicitly included in its hypotheses, not derived there.
- CA-79 Theorem 79.8, same file `:188-201`: exact full-stage mode covariance
  is not a viable nonzero-central-charge substitute for VR-1's summable defects.
- Round-1 D6 `NOTE.md:158-177,709-716`, `REVIEW.md:71-93`,
  `INTEGRATION.md:109-139`: mixed estimates and discarded spectators are
  obligations; the general lattice-chirality no-go has no local source.

Primary KS and duality sources actually used are listed at the end. No
external lattice-anomaly theorem is imported. No network access was used.

## 2. What parity really proves

### Theorem E2-P: equal anomalies; parity transport with its extra hypothesis

**Setting:** both chiralities; L0 plus declared analytic tower; R2 only.
**ASSUME:** nonzero inductive Hilbert space; (1); both families satisfy
VR-1 A1–A4 on the same J_r,K_r; complex-linear unitaries P_r obey
`P_r k_j P_r^*=k_-j` and `[P_r,K_r]=0`.
**PROVE:** both families and all their mixed words converge on the same D;
`c_L=c_R` and `c_L^*=c_R^*`.
If additionally

    P_r^2=I,       P_(r+1)J_r=J_r P_r,                    (PC)

then a unitary involution P preserves D and intertwines T_n with Tbar_n.
Only the last conclusion uses PC.

<1>1. The common domain and all mixed words exist.
  <2>1. Apply VR-1 separately for the two families on the same A1 system.
  BY VR-1 <1>1–<1>2, the spaces H_s and D are the same.
  <2>2. In VR-1 <1>3 label a letter by (chirality,n). Its product/telescoping
  proof uses A2,A3 for each letter, not a same-chirality commutator.
  It therefore applies verbatim to this enlarged alphabet. BY that proof.
  <2>3. QED BY <2>1–<2>2. We never infer convergence of products from
  unweighted strong convergence alone.

<1>2. Reflection exchanges the finite KS families up to a controlled offset.
  <2>1. `P Jcal_j P^*=i[k_-j,k_(-j-1)]=-Jcal_(-j-1)`.
  BY complex linearity, conjugation preserving products, and (1).
  <2>2. Substitute l=-j-1 into the current Fourier sum. Exactly,

      P L_n P^* - Tbar_n = (z^(-n)-1) B_-n
                         = (z^(-n)-1)(Tbar_n-L_-n)/2.     (3)

  BY <2>1 and l=-j for the energy sum. The exponent is **-n**.
  The zero-mode shift and density subtraction agree automatically.
  <2>3. For each fixed n,s the norm (s,1) of (3) is at most
  `pi |n| (C^R_(n,s)+C^L_(-n,s))/N`, since |exp(it)-1|<=|t|.
  BY A2. All P-conjugates have the same graph norms since [P,K]=0.
  <2>4. QED BY <2>1–<2>3. No exact finite-stage equality is asserted.

<1>3. The two anomaly ledgers agree, without PC.
  <2>1. Conjugate F^L_mn by P and subtract F^R_mn. Replacing every
  `P L_j P^*` by `Tbar_j` using (3), the product bound in §1 gives

      || (z^R_mn-z^L_mn) I ||_(r;s,2)
          <= q^L_(r,m,n,s)+q^R_(r,m,n,s)+O_(m,n,s)(N^-1). (4)

  The constant is uniform in r: the replacement terms are
  `[delta_m,Tbar_n]+[Tbar_m,delta_n]+[delta_m,delta_n]
   -(m-n)delta_(m+n)`, with delta given by (3).
  BY (2), A2,A4 and <1>2. The O(N^-2) term can be absorbed in O(N^-1).
  <2>2. Do not assume ||K_r^-2|| has a positive uniform lower bound.
  Choose a nonzero v in one fixed coarse space and transport it isometrically.
  Its norm and its K^2 norm are constant by A1. Applying (4) at s=0 to
  that vector gives `|z^R_mn-z^L_mn| ||v|| <= o(1)||K^2 v||`.
  Hence z^L_mn=z^R_mn. BY A1 and A4.
  <2>3. At (m,n)=(1,-1),(2,-2), this reads
  `Delta c^*-Delta c=0` and `8 Delta c^*-2 Delta c=0`.
  Subtraction gives Delta c^*=Delta c=0. BY displayed linear algebra.
  <2>4. QED BY <2>1–<2>3.

<1>4. Under PC, P is an actual limiting parity.
  <2>1. Set `P i_r v=i_r P_r v` on the algebraic union. PC makes this
  well-defined; isometry and P_r^2=I make its completion a unitary involution.
  Its action is isometric in every H_s because [P_r,K_r]=0. BY A1 and PC.
  <2>2. Thus P preserves D. Pass (3) to the limit using <1>1 and the
  estimate in <1>2 at every s to obtain `P T_n P^*=Tbar_n` on D.
  <2>3. QED BY <2>1–<2>2.

<1>5. QED BY <1>1–<1>4. No R1 state theorem, energy positivity,
essential self-adjointness, group integration, R3 net or R4 fidelity follows.

**Negative control E2-P0 (missing transport).** In any C use unit multiplicity
O=1 direct-sum 1, H_N=(C^2)^tensorN, embeddings appending |0>, K_N=I,
all densities/modes zero, and P_N the actual reversal of the N sites.
Every finite conjugation/regularity hypothesis and A1–A4 holds with zero
anomalies. But P_N sends the embedded first-site excitation to site N.
These images are mutually orthogonal in the inductive limit, so P_N has
no strong limit, even after passing to a subsequence.
This refutes automatic convergence of the *specified* parity maps, not the
existence of some other intertwiner (here the identity works). Exact PC is a
sufficient repair. Its necessity for existence of *any* limiting intertwiner
under the full KS hypotheses is not proved here. In a genuine OAR application,
equivariance of algebra refinements plus invariance of the limiting state
supplies PC for the canonical GNS parity; Hamiltonian invariance alone does
not supply either state invariance or refinement equivariance.

## 3. Mixed commutation from a momentum Ward certificate

### Theorem E2-M: an all-mode consequence of a zero-mode estimate

**Setting:** both chiralities; L0 plus the stated analytic certificates; R2.
**ASSUME:** (1), both VR-1 certificates, equal left/right anomaly ledgers
(for instance by E2-P), and, for every n,s,

    || [D_r,Tbar_(r,n)]-n Tbar_(r,n) ||_(r;s,2)
                       <= mu_(r,n,s) -> 0.                (MW)

**PROVE:** for every m,n,s a computable finite expression b_(r,m,n,s)->0
satisfies

    || [T_(r,m),Tbar_(r,n)] ||_(r;s,4) <= b_(r,m,n,s).     (5)

Consequently `[T_m,Tbar_n]=0` on D. With the additional normalization
c_L=c_L^* and c_R=c_R^*, the limiting algebra is two commuting Virasoro
actions with equal central charge. This is an algebra action on D, not yet
an integrated tensor-product symmetry or a local full CFT.

<1>1. Locality controls the antisymmetric part of the mixed brackets.
  <2>1. Write C_mn=[L_m,S_n] and A_mn=C_mn-C_nm. CA-79 Lemma 79.1 gives
  `[E_m,E_n]=kappa_mn B_(m+n)`, with
  `kappa_mn=-i a(z^n-z^m)`. Scalars commute, including aliased Fourier
  subtractions. Expanding `[2E_m,2E_n]` with (2) gives exactly

      A_mn = (4 kappa_mn-2(n-m))B_(m+n)
                         -F^L_mn-F^R_(-m,-n).            (6)

  BY (1),(2) and equality of the ledgers. We use the already-proved
  Fourier commutator; (6) is the new rearrangement.
  <2>2. The scalar Taylor remainder |exp(it)-1-it|<=t^2/2 gives
  `|4 kappa_mn-2(n-m)|<=2*pi*(m^2+n^2)/N`.
  Since B_j=(S_j-L_j)/2, A2 and A4 bound

      ||A_mn||_(s,2) <= eta_(r,m,n,s)
        := pi*(m^2+n^2)(C^L_(m+n,s)+C^R_(-m-n,s))/N
           +q^L_(r,m,n,s)+q^R_(r,-m,-n,s) ->0.            (7)

  BY <2>1 and the graph product/inclusion convention of §1.
  <2>3. QED BY <2>1–<2>2. This is what nearest-neighbour locality supplies;
  it does not by itself assert C_mn tends to zero.

<1>2. MW controls a mixed zero mode.
  <2>1. Define W_n=[L_0,S_n]. From (2),
  `[S_0,S_n]=n S_n+F^R_(0,-n)` and therefore

      W_n = ([D_r,S_n]+n S_n)+F^R_(0,-n).                (8)

  BY D_r=L_0-S_0. Thus
  `||W_n||_(s,2)<=w_(r,n,s):=mu_(r,-n,s)+q^R_(r,0,-n,s)->0`.
  <2>2. QED BY <2>1. Only the barred half of the momentum Ward condition
  is assumed; the other half is not silently added.

<1>3. Every off-diagonal C_mn tends to zero with loss three.
  <2>1. Set
  `V_mn=[F^L_(0,m),S_n]+[L_m,W_n]`.
  Jacobi and (2) give `[L_0,C_mn]=-m C_mn+V_mn`. Subtract the same
  equation with m,n swapped, using A_mn=C_mn-C_nm, to obtain exactly

      (n-m)C_mn=[L_0,A_mn]+n A_mn-V_mn+V_nm.            (9)

  BY expansion of the two commutators; all products are finite matrices.
  <2>2. The product bound makes V small with loss three. Explicitly put

      v_(mn,s) = q^L_(0,m,s) C^R_(-n,s+2)
                +C^R_(-n,s) q^L_(0,m,s+1)
                +C^L_(m,s) w_(n,s+1)+w_(n,s) C^L_(m,s+2).

  Then ||V_mn||_(s,3)<=v_(mn,s)->0 (r suppressed on q,w,v).
  For m!=n, (9) gives the explicit bound

      h_(mn,s) := (C^L_(0,s) eta_(mn,s+1)
          +eta_(mn,s) C^L_(0,s+2)+|n|eta_(mn,s)
          +v_(mn,s)+v_(nm,s))/|n-m|,
      ||C_mn||_(s,3)<=h_(mn,s)->0.                       (10)

  BY (7)–(9); loss-two terms embed contractively in loss three.
  <2>3. QED BY <2>1–<2>2.

<1>4. Jacobi controls the remaining diagonal with loss four.
  <2>1. Given n choose a=|n|+1 and b=n-a. Then a+b=n,
  a!=b, a!=n and b!=n. Jacobi and (2) give exactly

      (a-b)C_nn=[L_a,C_bn]-[L_b,C_an]-[F^L_ab,S_n].      (11)

  The central term in [L_a,L_b] commutes with S_n, including n=0.
  BY `[[L_a,L_b],S_n]=[L_a,[L_b,S_n]]-[L_b,[L_a,S_n]]`.
  <2>2. The right side has the loss-four upper bound

      d_(n,s) := (C^L_(a,s)h_(bn,s+1)+h_(bn,s)C^L_(a,s+3)
        +C^L_(b,s)h_(an,s+1)+h_(an,s)C^L_(b,s+3)
        +q^L_(a,b,s)C^R_(-n,s+2)
        +C^R_(-n,s)q^L_(a,b,s+1))/|a-b| ->0.

  BY (10),(11) and embedding the last loss-three term in loss four.
  <2>3. Define b_(r,m,n,s)=h_(m,-n,s) when m!=-n, and
  b_(r,m,n,s)=d_(m,s) otherwise. This proves (5). BY S_-n=Tbar_n.
  Each bound uses finitely many specified A2,A4,MW constants at fixed modes.

<1>5. Pass to the limit on D.
  <2>1. For v in D, i_r^*v has K_r^(s+4) norm <=||v||_(s+4),
  by the contractive stage projections in VR-1 <1>1.
  Hence the embedded mixed commutator tends to zero in H_s by (5).
  <2>2. By E2-P <1>1's mixed-word convergence, its limit is the actual
  `[T_m,Tbar_n]v`, not an independent bilinear operation. Thus it vanishes.
  <2>3. QED BY <2>1–<2>2, VR-1 for each internal bracket, and E2-P for
  equality of the ledgers when its hypotheses are used.

<1>6. QED BY <1>1–<1>5. If all relevant q,mu=O(N^-gamma), (7)–(11)
give b=O(N^-min(1,gamma)); the rate is conditional on those input rates.
No summability of mixed residuals is needed after A3 has constructed products.

### Theorem E2-Z: a single zero-mode commutator suffices

**Setting:** both; L0 plus the stated analytic certificate; R2.
**ASSUME:** (1), both VR-1 certificates and equal anomaly ledgers. Replace
MW by the smaller *list of estimates*

    ||[L_0,S_0]||_(r;s,2) -> 0   for every s>=0.           (ZC)

**PROVE:** all limiting mixed brackets vanish on D. No loss-four uniform
rate is asserted here; E2-M supplies that stronger conclusion under MW.
'Smaller list' does not assert logical independence of these conditions
under the other hypotheses.

<1>1. Pass to the limit on D using VR-1 mixed-word convergence. Write L,S
now for the limiting operators, and C_mn=[L_m,S_n]. Equation (6), A2,A4
and N->infinity give C_mn=C_nm, while ZC gives C_00=0.
BY E2-M <1>1 and the convergence argument of E2-P <1>1.

<1>2. There are operators X_q=C_q0 with C_mn=X_(m+n) for every m,n.
  <2>1. Jacobi and the L internal bracket give
  `[L_m,C_nk]-[L_n,C_mk]=(m-n)C_(m+n),k`.
  Cyclically sum over (m,n,k). The left side cancels by symmetry of C,
  leaving `sum_cyclic (m-n)C_(m+n),k=0`. Scalar central terms commute.
  <2>2. Put k=0. The identity is
  `(m-n)(X_(m+n)-C_mn)=0`, proving the claim when m!=n.
  <2>3. For a diagonal C_nn use the triple (p,n-p,n), where
  p is any integer outside {0,n,n/2}. The other two entries are
  off-diagonal, and the identity is
  `(2p-n)(C_nn-X_(2n))=0`. Such p exists for every integer n.
  <2>4. QED BY <2>1–<2>3. In particular X_0=C_00=0 by <1>1.

<1>3. Determine both zero-mode actions without assuming their values.
  <2>1. Write A_q=[L_0,X_q]. Using X_q=[L_0,S_q], Jacobi gives
  `[L_p,X_q]=p X_(p+q)+A_(p+q)`.
  Put q=0 and use X_0=0: A_p=-p X_p. Substitution yields
  `[L_p,X_q]=-q X_(p+q)`.
  <2>2. Similarly use X_q=[L_q,S_0], write B_q=[S_0,X_q], and use
  `[S_p,S_0]=-p S_p`. Then `[S_p,X_q]=-p X_(p+q)+B_(p+q)`.
  Putting q=0 gives B_p=p X_p, hence `[S_p,X_q]=q X_(p+q)`.
  <2>3. QED BY Jacobi, the internal brackets and <1>2. The use of
  X_0=0 is explicit; omitting it invalidates this step.

<1>4. For q!=0, Jacobi and <1>3 give

    [[L_1,S_-1],X_q]
      =[L_1,q X_(q-1)]-[S_-1,-q X_(q+1)]
      =-q(q-1)X_q+q(q+1)X_q=2q X_q.

But [L_1,S_-1]=X_0=0 by <1>2, so X_q=0. X_0 was already zero.
All C_mn vanish by <1>2. BY the displayed computation.

<1>5. QED BY <1>1–<1>4. All operations are on the invariant smooth
domain D. The graph estimates ensure that the finite mixed commutators
converge to these brackets on D, even though no uniform rate is claimed here.
Under the base assumptions, the *limiting* condition `[T_0,Tbar_0]=0` is
therefore equivalent to all mixed commutation; the reverse implication is
immediate. ZC is a sufficient finite-stage certificate for this condition,
not a claimed necessary graph-norm bound.

ZC has a direct microscopic meaning. In the notation (16) below,

    [L_0,S_0]=2[E_0,B_0]=2a_N^2[sum_j k_j,Q_N].           (Z0)

Thus **exact conservation of the total energy current** at every stage
implies ZC, as does the corresponding scaled graph-norm decay. BY (1).
Locality alone does not assert this conservation. If p_r is a genuine
spectral function of U_r (one lift per eigenphase) and (12) below holds,
then [p_r,S_0]=0 by zero-mode translation invariance, and
`[L_0,S_0]=[D_r-p_r,S_0]` obeys the loss-two bound in (14) with n=0
and nu=0. This gives another sufficient condition for E2-Z, with no
nonzero-mode momentum-wrap estimate. It still requires current–momentum
identification (12); 'linear dispersion' is not a substitute.

## 4. A checkable momentum-sector condition, and the remaining gap

### Proposition E2-S: lifted lattice momentum implies MW

**Setting:** both; L0 plus translation/regularity and current identification;
R2 conditional. Here 'momentum sector' means actual operator blocks, including
multiplicities and their full output, not a list of dispersion eigenvalues.
**ASSUME:** the hypotheses of E2-M except MW, and self-adjoint p_r with

    U_r=exp(2*pi*i*p_r/N_r),
    ||D_r-p_r||_(r;s,1) <= delta_(r,s) -> 0,              (12)
    ||Wwrap_(r,n)||_(r;s,2) <= nu_(r,n,s) -> 0,           (13)
    Wwrap_(r,n) := [p_r,Tbar_(r,n)]-n Tbar_(r,n).

The eigenvalues of p_r are specified lifts of the U_r phases. These choices
and (12) are additional data. One may use a centered branch; it is not
implicitly the physical current D_r.
**PROVE:** MW holds with

    mu_(r,n,s) <= nu_(r,n,s)
          +delta_(r,s) C^R_(n,s+1)+C^R_(n,s)delta_(r,s+1). (14)

<1>1. Translation gives `U Tbar_n U^*=z^n Tbar_n`.
BY translating the two Fourier sums in (ap). Thus a matrix block from
p-eigenvalue q to p-eigenvalue q' can be nonzero only if
`q'-q-n` is an integer multiple of N. This uses U covariance, not linear
dispersion. On that block Wwrap is `(q'-q-n)` times the mode block.
<1>2. Expand `[D,Tbar_n]-nTbar_n=Wwrap_n+[D-p,Tbar_n]`.
Apply (12),(13),A2 and the product bound in §1. This proves (14).
<1>3. QED BY <1>1–<1>2 and E2-M.

An explicit sufficient form of (13) is: p commutes with K; in the centered
branch let F_(r,n) project onto the p-eigenspaces within |n| of either
branch endpoint; suppose, for some eps>0 and fixed n,s,

    ||Tbar_(r,n) F_(r,n)||_(r;s,2) = O(N_r^(-1-eps)).    (15)

For N>2|n| a wrapped block must have input in F_(r,n). Separate its positive
and negative wrap directions using the commuting spectral projections of p.
Each has norm at most the norm in (15) because those projections commute
with K; its wrap coefficient is +N or -N. Hence
`nu<=2N ||Tbar_n F_(r,n)||_(s,2)=O(N^-eps)`.
This proves a sufficient full-output momentum-sector condition, rather than
assuming that an energy cutoff automatically removes the Brillouin edge.
For a fixed n, no wrap on all retained blocks is a stronger special case.

The **substantive unsolved part of this certificate is (12)**, identifying
the normalized energy current with the lifted generator of spatial
translations. Neither an arbitrary choice of velocity nor a spectral fit
`energy approximately |momentum|` proves this matrix statement. A generic
interacting fusion chain has no assumed one-particle dispersion at all.
Finite-range locality alone gives no vanishing estimate for a mixed sum:
if its two local densities have bounded norm and fixed range, only O(N)
pairs overlap, but the two KS prefactors are O(N^2), leaving an O(N^3)
triangle-inequality bound. Equation (6) is the stronger cancellation we
actually proved; it controls only the antisymmetric mixed combination.

### Negative control E2-V: separate VR-1 does not imply mixed commutation

**Setting:** abstract common regularity tower (no categorical/local-KS
realization claimed); no chirality interpretation; R2 algebra counterexample.
**ASSUME:** orthonormal e_k, k in Z, and on finite-support vectors define

    A_n e_k=(k-n/2)e_(k-n),       K e_k=(1+|k|)^p e_k,
    p>1 an integer,  M_r=2^r,   H_r=span{e_k:|k|<=M_r}.

J_r is the natural inclusion, pi_r the orthogonal projection, and both
families are `T_(r,n)=Tbar_(r,n)=pi_r A_n pi_r`. Let P_r=I.
**PROVE:** both satisfy A1–A4 with c=c*=0, coherent parity exchange and
linear zero-mode spectrum, but their mixed commutator does not vanish.

<1>1. A1 and adjoint pairing hold. BY diagonal K, inclusions and
`k-n/2=(k-n)+n/2`, the coefficient of the reverse shift.
<1>2. The exact infinite bracket is `[A_m,A_n]=(m-n)A_(m+n)`.
BY subtracting the two coefficients
`(k-n/2)(k-n-m/2)-(k-m/2)(k-m-n/2)
 =(m-n)(k-(m+n)/2)`; this polynomial identity is checked exactly.
<1>3. For each fixed n,s the weighted coefficient of A_n is bounded by
a constant times `(1+|k|)^(1-p)`, because
`(1+|k-n|)/(1+|k|)` and its reciprocal are bounded for fixed n.
Projection does not increase weighted norms. Thus A2 holds.
<1>4. The refinement defect is supported on inputs
`|k|>=M_r-|n|`, and is a weighted shift. Its (s,1) norm is
`O_(n,s)(M_r^(1-p))`; finitely many small r are harmless. The geometric
series is summable. This proves A3.
<1>5. By <1>2, the compressed bracket residual has only paths exiting
and re-entering pi_r between its two factors. Its input is within
|m|+|n| of a boundary; coefficients are O(M_r^2), and output differs
from input by the fixed shift m+n. Hence its (s,2) norm is
`O_(m,n,s)(M_r^(2-2p))->0`. This proves A4, including all s.
<1>6. Nevertheless `[T_1,Tbar_-1]e_1=2A_0e_1=2e_1`.
BY <1>2 and eventual inclusion of its finite paths. QED BY <1>1–<1>6.

This counterexample refutes inference from **A1–A4 alone**, even with a
coherent exchanging P and a linear zero-mode spectrum. It is not a
counterexample to E2 with the actual KS Fourier construction: the two copies
here do not have the required opposite spatial momenta, and (6) fails.
It must not be advertised as a local chiral-chain example.

**Unresolved implication, explicitly retained.** We have not proved that MW
is logically independent of the *combined* nearest-neighbour KS, Hilbert
adjoint, parity and A1–A4 assumptions. We have also not proved it follows.
Thus E2-M is a sufficient additional certificate, not a necessary condition
theorem and not a claim that the original part (b) has been refuted. The
sharp remaining lemma is: do those combined hypotheses force
`[T_0,Tbar_0]=0` on D? If yes, E2-Z proves (b) without an extra hypothesis.
We have not shown ZC is genuinely independent of the full KS assumptions.
For quantitative (5), the corresponding weighted momentum estimate is
still needed. The tempting proof 'mixed symmetry plus Jacobi gives zero'
implicitly sets `[T_0,Tbar_0]=0`; that step was rejected during review.

## 5. The exact non-chirality statement

### Corollary E2-C: no nonzero chiral anomaly in the full parity-paired KS limit

**Setting:** comparison of chiral and two-chiral targets; L0 analytic tower;
R2. **ASSUME:** E2-P's assumptions, with both *standard* KS families on the
same limit Hilbert space. Say the right stress is absent when
`Tbar_n=0` for n!=0 and `Tbar_0=t I` on D (a scalar energy-origin remnant).
**PROVE:** T_n=t delta_(n,0)I as well; c_L^*=c_R^*=0 and c_L=c_R=24t.
In the standard normalization c=c^*, all these quantities and t are zero.

<1>1. The barred (1,-1) and (2,-2) identities become
`0=2t+(c_R^*-c_R)/12` and `0=4t+(8c_R^*-2c_R)/12`.
BY VR-1 and the definition of absent stress.
<1>2. Subtract twice the first equation from the second. Then c_R^*=0,
and the first gives c_R=24t. BY scalar algebra.
<1>3. E2-P gives c_L^*=c_R^* and c_L=c_R. In standard normalization
c_R=c_R^*, t=0. BY E2-P and <1>2.
<1>4. VR-1 <1>2.4 gives, uniformly for every vector of H_r,
`||Tbar_(r,n)-t delta_(n,0)I_r||_(r;s,1)<=d^R_(r,n,s)->0`.
Indeed its limiting operator is exactly that scalar and i_r is a graph
isometry. Conjugate this bound by P_r and use (3) and [P_r,K_r]=0.
It follows that `||T_(r,n)-t delta_(n,0)I_r||_(r;s,1)->0` too.
Taking the mode limit proves the asserted scalar left family.
<1>5. QED BY <1>1–<1>4. This stronger conclusion still does not require PC.

This exclusion does **not** require E2-M, PC or a conformal-net theorem.
Under PC scalarity also follows immediately by parity conjugation.
A chiral subnet of a larger limit is not 'absent right stress' on the
whole representation; its omitted operators may still be nonzero.

The logically valid contrapositive is a disjunction: a nonzero purely
chiral stress target cannot retain **all** these hypotheses. It may break
microscopic parity, or change the refinement/state/retained-carrier
prescription so that this common two-family certificate fails, or change
the modes or the prescribed limit. Thus 'chiral targets REQUIRE explicitly
parity-breaking densities' is stronger than the proved theorem. Even PC's
failure alone does not evade the anomaly argument if all E2-P's other
hypotheses still hold. Modifying Tbar is one option, not a proved universal
necessity for every parity-breaking chain; if the *unmodified* Tbar tends
to zero with its own valid certificate, no modification is required.

No statement here excludes a chiral theory as a separately selected local
subnet, or proves a lattice no-go without parity. The D6 source gap remains.
An R3 conclusion needs the local algebra, positive energy, self-adjoint
closures and integrated covariance; R4 additionally needs sector fidelity.

## 6. General parity-breaking constructions and what they do not select

### Proposition E2-D: a local odd perturbation, with a nonvanishing test

**Setting:** either target, chirality undecided; L0 plus a declared linear
microscopic reflection; R0 finite local data only (the base tower is retained).
**ASSUME:** the periodic parity-symmetric nearest-neighbour chain of §1.
**PROVE:** the family

    Q_N=sum_j Jcal_j,       H_N(lambda)=sum_j k_j-lambda Q_N,
    lambda real,                                           (16)

is a self-adjoint finite-range C-morphism Hamiltonian, and
`P_N H_N(lambda) P_N^*=H_N(-lambda)`.
It breaks this specified P_N iff lambda Q_N!=0.

<1>1. Each Jcal_j is a C-morphism on three adjacent sites: compose the
two placed morphisms, subtract, and multiply by i. It is self-adjoint
because k_j and k_(j+1) are. BY the dagger and interchange laws.
<1>2. E2-P <1>2 gives `P Q_N P^*=-sum_j Jcal_(-j-1)=-Q_N`.
Thus (16) has the stated transformation and bounded support. BY reindexing.
<1>3. Equality with its reflection is equivalent to 2lambda Q_N=0.
BY subtracting H_N(lambda)-H_N(-lambda). QED BY <1>1–<1>3.

More generally, for a specified local self-adjoint a, take its odd part
`a-rho(a)`, where rho is the actual complex-linear reflected local action,
and sum its translates. Test that the **sum** is nonzero: a local odd part
may be a telescoping divergence. This construction needs no self-dual simple
object, braiding or model-specific fusion relation.

**Negative E2-D0.** A universal nonzero perturbation on every *fixed* carrier
is false. In any fusion C choose O=1. Then O^tensorN=1 and
End_C(1)=C; every density is scalar and every odd part is zero. BY the
simple-unit definition, `references/text/PenneysUnitaryFusionCategories.md:442`.
The missing hypothesis in (16) is exactly Q_N!=0; for arbitrary local
perturbations it is the existence of a nonzero reflection-odd local sum.

There is an unconditional **enlarged-carrier** version if such enlargement
is allowed. It is deliberately marked as an auxiliary construction, with
no claim of producing the input category's chiral content.

### Proposition E2-A: parity breaking after unit-multiplicity enlargement

**Setting:** chirality undecided; L0 and the original reflection; R0 only.
**ASSUME:** the original parity chain, N>=4, with the carrier allowed to change
to O'=O tensor (1 direct-sum 1). On each multiplicity space use the matrices
X,Y,Z of CONVENTIONS (m), explicitly
`X=[[0,1],[1,0]], Y=[[0,-i],[i,0]], Z=diag(1,-1)`.
**PROVE:** a nonzero parity-odd finite-range categorical perturbation exists.

<1>1. Distributivity and unitors identify the new endomorphism algebra with
`End_C(O^tensorN) tensor M_(2^N)`. Choose its amplified representation on
`H_N tensor (C^2)^tensorN`; for the full Hom fusion carrier this is its
usual decomposition in each charge sector. Every flag matrix is a
C-morphism on the unit multiplicity. BY the orthogonal direct-sum
decomposition (Penneys:219-237).
<1>2. Set g_j=X_j X_(j+1)+Z_j Z_(j+1). The extended even Hamiltonian
is H tensor I + I tensor sum g_j; its parity is the original parity tensor
spatial reflection of the flags. BY invariance of g under endpoint exchange.
<1>3. Direct matrix multiplication yields

    i[g_j,g_(j+1)]
      =2(X_j Y_(j+1) Z_(j+2)-Z_j Y_(j+1) X_(j+2)).       (17)

For N>=4, the 2N displayed tensor words are distinct and orthogonal in the
Hilbert–Schmidt inner product: trace(XY)=trace(XZ)=trace(YZ)=0,
and each nonidentity matrix is traceless. Thus their signed sum is nonzero.
BY the explicit matrices and trace factorization.
<1>4. Apply E2-D to this flag current, leaving the old Hamiltonian as a
spectator. It is categorical, self-adjoint, range three and odd under the
specified parity. QED BY <1>1–<1>3.

This changes the site object and adds independent microscopic degrees of
freedom. It proves the existence of parity-breaking densities for general C,
not an edge-discarding functor, not criticality, and not R1–R5. Other parity
symmetries may remain: the conclusion concerns the specified reflection.
For (16) or (17), the deformed density has longer range, so its **new** KS
current must be derived anew; inserting it into (ap)'s adjacent formula is
not justified. New states, velocities and VR-1 certificates are also owed.

### Proposition E2-T: current tilt is not deletion of a chiral sector

**Setting:** two-chiral certified limit; L0 plus E2-P/E2-M certificates;
R2 for the already-constructed algebra. **ASSUME:** that algebra and the
original refinements; form (16) but do not replace the states or modes.
**PROVE:** the normalized energies converge on D to

    2a_N(H_N(lambda)-N epsilon_N)+2b_N
          -> (1+lambda)T_0+(1-lambda)Tbar_0.              (18)

<1>1. The left side equals `(L_0+S_0)+lambda D_r` exactly, by (1),(16).
<1>2. Both zero modes converge by VR-1, proving (18).
<1>3. The operators Tbar_n and their central ledger have not
changed. At lambda=1 their coefficient in (18) is zero, but their Hilbert
carrier and stress operators remain. BY the fixed representation premise.
<1>4. QED BY <1>1–<1>3. This does not assert that the original state remains
a ground state, or that new KS modes constructed from H(lambda) converge.

There is consequently no general categorical 'discard one Fermi edge'
construction established here. Even where momentum modes exist, a sharp
selector is generally not finite-range: for the finite Fourier projection
onto k=0,...,M-1 on N sites,

    Pi_(xy)=N^-1 sum_(k=0)^(M-1) exp(2*pi*i*k*(x-y)/N)
      = (1-exp(2*pi*i*M*(x-y)/N))
        /[N(1-exp(2*pi*i*(x-y)/N))]                       (19)

for x!=y. For N even and M=N/2, (19) is nonzero at every odd separation,
including macroscopic separations. BY the finite geometric series. This is
an exact obstruction to treating that *particular sharp filter* as uniformly
finite-range; it is not a no-go for other mechanisms. General C supplies no
one-particle Fermi edge or canonical momentum projector in the first place.

## 7. Non-self-dual objects and the type of reflection

All preceding proofs take **linear unitary P_N as data**. They never construct
it from a pivotal symbol. This distinction matters even for self-dual sites.

For the fusion carrier `V_N=direct-sum_c Hom_C(c,O^tensorN)`, a unitary
duality functor and dagger give

    f -> C_N f := (f^vee)^dagger
       in Hom_C(c^vee,(O^tensorN)^vee).                  (20)

Dagger is conjugate-linear (Penneys:145); duality is linear,
contravariant and order-reversing (Penneys:682-698). Hence (20) is
**conjugate-linear**, and it changes the site to O^vee and the sector to
c^vee. For non-self-dual X, O=1+X need not be isomorphic to 1+X^vee.
Self-duality and its real/pseudoreal choices are not automatic
(Penneys:917-935). An antiunitary cannot replace P in (3): it conjugates i
and the Fourier phases, changing the calculation.

Two precise repairs are available, with different scope:

1. Supply and verify a complex-linear unitary reflection on the original
   represented chain, including its action on charge sectors, local supports,
   densities, K and refinements. Then E2-P–E2-T apply unchanged, regardless
   of whether X is self-dual. A carrier restricted to a non-invariant charge
   sector must be enlarged or the theorem applied between reflected sectors.
2. Use a declared mirror carrier. The following construction always repairs
   the linearity/type issue, but changes the microscopic backend.

### Lemma E2-R: a linear mirror pair without self-duality

**Setting:** paired/mirrored microscopic theory; L0 with unitary spherical
duality; R0 only. **ASSUME:** V_N as above with orthonormal simple-sector Hom
metrics; put `W_N=overline{direct-sum_c Hom(c^vee,(O^tensorN)^vee)}`.
The overline denotes the conjugate complex Hilbert space, not identification
with the original carrier. **PROVE:**

    R_N f=overline{C_N f},
    mu_N(a)=overline{(a^vee)^dagger}                     (21)

define a linear unitary to the mirror carrier and a linear *-representation
there, intertwining a with mu_N(a), reversing local supports.

<1>1. For f,g in the same simple-charge Hom block, f^dagger g is a scalar
identity. Unitary duality preserves dagger, so
`(C_N f)^dagger C_N g = f^vee (g^dagger)^vee=(g^dagger f)^vee`.
Thus C_N conjugates inner products; duality is bijective on these Hom spaces.
BY Penneys:992-999 and the displayed computation. Distinct blocks are orthogonal.
<1>2. Passage to the conjugate Hilbert space makes R_N linear and unitary.
Duality reverses composition and dagger reverses it back; the two conjugate
linearities in (21) cancel. Therefore mu_N(ab)=mu_N(a)mu_N(b),
mu_N(a^dagger)=mu_N(a)^dagger, and `R_N a=mu_N(a)R_N`.
BY (20),(21) and the same composition identities.
<1>3. The anti-monoidal dual tensorator reverses the order of tensor factors,
so the image of a local morphism has the reflected interval support in the
mirror presentation. BY Penneys:682-698; use its unitary tensorator.
<1>4. On V_N tensor W_N set
`P(v tensor R_N w)=w tensor R_N v` and
`d_j=k_j tensor I+I tensor R_N k_-j R_N^*`.
Then P is a linear involutive unitary and P d_j P^*=d_-j.
BY direct substitution on simple tensors, which span the space.
<1>5. QED BY <1>1–<1>4. Refinements can be mirrored by R_(r+1)J_r R_r^*;
their tensor products obey PC. This supplies no state or mode estimates.

The resulting backend includes a conjugate reflected copy; we do not assert
it is End_C(O^tensorN) on the original O. At L1/L2 the reflected braiding
and its role in the target must also be declared. Merely replacing X by
X+X^vee resolves object closure but does not by itself prove the required
linear action on every morphism or its compatibility with the tower.

## Verification and research record

The brief's scope overrides the repository-wide convention/worklog/commit
workflow: only this directory was written; no root conventions, report,
worklog, source manifest or index was changed. No network, Julia suite,
report build or commit was performed. Existing unrelated dirty files were
left alone. This note carries the local proof, assumption, run and gap ledger.

Two GPT-6.1 xhigh collaborators independently audited the algebra/graph bounds
and the parity/categorical constructions. Their read-only review identified
the lost current phase, the missing X_0=0 in a tempting Jacobi proof, the
need to amplify arbitrary carrier representations in E2-A, and the stronger
PC-free scalar-collapse argument in E2-C. Those corrections are incorporated.
This is not an Opus review or formal proof-assistant verification.

Run, from the repository root:

```sh
python3 -B explorations/2026-10-22-astra-r2/E2-parity-and-chirality/checks/check_e2.py
```

**Headline:** exact finite reflection, KS-residual, Jacobi, ancillary-current
and Witt identities pass; six deliberately wrong mutations are rejected.
Raw output: `checks/raw_output.txt`; commands, dependency and scope:
`checks/README.md`. Largest matrix is 16 by 16 on unit-multiplicity flags.
No nontrivial category was simulated and no convergence rate was fitted.
The all-scale bounds are the proofs above, not consequences of this run.

Frictions retained: the first `python3 -I` run could not import the existing
user-site SymPy; `python3 -B` uses that installed dependency and prevents
bytecode writes. More substantively, an attempted symmetry-plus-Jacobi proof
without the zero-mode hypothesis was abandoned: it assumed precisely the
conservation statement it needed to prove. The revised E2-Z makes that
hypothesis visible and reduces the remaining problem to one commutator.

## Results ledger

- E2-P existence — **proven**: two VR-1 certificates on one system give both mode families and all mixed words on D.
- E2-P anomaly equality — **proven**: finite linear parity commuting with K forces c_L=c_R and c_L^*=c_R^*, without PC.
- E2-P parity operator — **conditional**: PC constructs the limiting involution and intertwines the modes; PC is not derived from the brief's finite symmetries.
- E2-P0 — **negative**: the specified P_r need not converge, even for zero standard KS modes; no counterexample to existence of any alternative KS-limit intertwiner is claimed.
- E2-M — **conditional**: MW plus separate VR-1 and KS locality gives explicit mixed-bracket decay with graph loss four, equations (7)–(11).
- E2-Z — **proven**: in the limiting KS algebra with equal ledgers, all mixed commutation is equivalent to the single equation [T_0,Tbar_0]=0; ZC supplies it.
- E2-S — **conditional**: current–momentum identification and the stated wrap bounds imply MW; a genuine momentum branch and (12) alone imply ZC.
- E2-V — **negative**: separate A1–A4, coherent exchange and linear zero-mode spectrum alone do not imply mixed commutation; the counterexample is not a standard KS chain.
- E2-C — **proven**: in the full parity-paired standard-KS limit, absent right stress forces absent left stress and zero cubic anomaly, even without PC.
- E2-D — **proven**: a nonzero total categorical current yields a local perturbation breaking the specified parity.
- E2-D0 — **negative**: a nonzero parity-breaking deformation is impossible on every fixed carrier; O=1 is an explicit obstruction.
- E2-A — **proven**: unit-multiplicity enlargement supplies a nonzero local parity-odd perturbation for every C; it supplies no chiral limit.
- E2-T — **proven**: the current tilt changes the limiting energy coefficients but does not delete a stress family in the fixed representation.
- E2-R — **proven**: conjugate-dual mirror enlargement repairs reflection type/linearity without assuming self-duality; its continuum certificates remain unproved.
- Original E2(b) without ZC/MW — **conjectural**: redundancy of the remaining zero-mode condition under all original KS assumptions is unresolved here.
- Universal categorical chiral extraction and E2(c)'s densities-only necessity — **conjectural**: neither a construction nor that stronger necessity claim is proved.

## Layer tags

| Statements | Setting | Data layer and extra data | Rung actually reached |
|---|---|---|---|
| E2-P, M, Z, S, C | Both stress families; chiral versus full delineation | L0 suffices categorically; actual periodic representation, density/velocity, regularity/refinement and specified analytic certificates are essential | R2 algebraic modes and implications only; no R1 state synthesized |
| E2-P0, V | Abstract counterexamples | Category-independent; V is not a categorical KS model | Tests what an R2 interface does not imply |
| E2-D, D0, A | Chirality undecided | L0 plus supplied linear parity; A explicitly changes O | R0 microscopic/tower ingredients, inherited from the input tower; no R1–R5 conclusion |
| E2-T | Two-chiral input algebra | L0 analytic tower already certified at R2 | R2 energy comparison in the fixed representation; no new tower certificate |
| E2-R | Reflected pair | L0, unitary spherical duality, conjugate-dual enlarged carrier | R0 representation and refinement construction only |
| A declared faithful chiral/full CFT | Must be specified separately | L3 conformal enrichment or L4 declared target, with L1/L2 data needed for braided/modular fidelity | R3–R5 remain additional obligations |

The L0 tags mean no categorical braiding/modular enrichment is used; they do
**not** mean that bare fusion rules synthesize the dynamics or analytic
certificates. A unitary Virasoro *algebra* action on D is not the full
projective-unitary symmetry required by the north star.

## What this gives the integration

CA-79's mixed-residual requirement can be discharged in two precise ways:
normalized current conservation plus E2-Z proves commutation on the common
domain; the stronger momentum Ward certificate plus E2-M gives explicit
weighted errors. This separates the energy-current identification problem
from a direct search over every mixed mode pair. It does not repeat or
weaken CA-79's shell-to-VR-1 theorem.

The compiler must distinguish four pieces of data: microscopic parity,
transport of parity through the chosen representation/refinement, conserved
normalized current, and the meaning of 'chiral output'. Parity already fixes
the anomaly balance before PC; PC implements an actual continuum symmetry.
Chiral extraction must specify what happens to the other family and its
carrier. A parity-odd categorical Hamiltonian is only a finite construction
ingredient. The general mirror construction types the non-self-dual case
without selecting either a chiral or full faithful target prematurely.

## Open problems

1. **Zero-mode conservation lemma.** Under the complete nearest-neighbour
   standard-KS, common A1–A4, parity and adjoint hypotheses, prove
   [T_0,Tbar_0]=0 on D, or construct an actual categorical KS counterexample.
   E2-V only separates the abstract VR-1 interface; it does not settle this.
2. **Current–momentum lemma.** For a general categorical critical chain,
   construct a spectral branch p_r and prove (12), or prove ZC directly.
   Spectral linearity alone is insufficient evidence for the operator bound.
3. **Parity implementation lemma.** Derive compatible P_r from a concrete
   local OAR/state construction, or settle whether some limit intertwiner
   exists without PC under all of E2-P's original hypotheses. Do not confuse
   failure of convergence of a chosen sequence with nonexistence of any P.
4. **Range-R lemma.** Derive the correct finite-range current and Fourier
   residual, with a parity-compatible blocking/velocity comparison if using
   a range-two reduction. The present proof uses the precise (ap) tier.
5. **Chiral extraction lemma.** Construct a category-uniform retained local
   algebra, state and refinement with one faithful chiral stress, controlling
   the omitted sector. Neither an odd perturbation nor the sharp filter (19)
   supplies this. No local source for a general lattice chirality no-go was
   acquired; the no-network instruction leaves that source gap unchanged.
6. **Analytic completion.** Prove positivity, closures, strong commutation
   of integrated symmetries, local conformal covariance and sector fidelity
   in the same representation. These are R3/R4, not automatic R2 corollaries.

## Examples table

No example is used to infer the general construction or its fidelity.

| Instance/check | Established or checked fact | Limitation it illustrates |
|---|---|---|
| Any C, site O=1 | All local endomorphisms are scalar (E2-D0) | Fixed-carrier parity breaking need not exist |
| Any C, doubled unit-multiplicity flags, N=4 | Exact (3), (6), (17); current squared Hilbert–Schmidt norm 512 | General identities calibrated on flags, not a category-faithful chiral model |
| Truncated half-density Witt shifts (E2-V) | Separate VR-1 certificates, but mixed (1,-1)e_1=2e_1 | Abstract regularity/linearity does not encode opposite spatial momentum |
| Supported chiral Majorana/Ising compiler (CA-82) | Local sine H, modified nonzero KS modes, sharp CAR refinement and separately specified local reconstruction (`compiler/PROOF.md:78-120`, `LOCAL_LIMIT.md:1-8,64-98`) | Not an instance of both unmodified parity-paired (ap) families on a common certificate |
| Same compiler's moving UV edge | Worklog 015 `:113-117` records bounded-energy edge pairs with no limit under that sharp RG | The recorded chiral limit is not convergence of the entire low-energy spectrum; 'discard edge' describes a limit prescription, not a universal local categorical operation |

## Sources used

All paths are repository-relative; theorem labels and displayed computations
in this note are new local derivations. Precise source/contract anchors:

- `CONVENTIONS.md:695-728,801-829,1196-1215,1397-1522` — separate anomaly ledger, graph norms, density/current orientation, tile and KS normalization. The local symbol declarations in §1 do not alter them.
- `cft_machine/research/virasoro_routes.md:50-150,154-177` — VR-1 assumptions, coarse-vector tail and finite-word bounds, and explicit non-conclusions concerning positivity/integration/fidelity.
- `report/sections/79_ks_shell_and_refinement_defect.tex:52-81,85-145,188-201` — actual KS tier, Fourier identity, shell certificate and exact-covariance obstruction.
- `references/lattice-symmetry/GransSamuelssonEtAl2020/source/Linnea11.5.tex:791-822` — primary energy/current KS formulas; registry `references/lattice-symmetry/SOURCES.md:966-1044`. No general convergence theorem is attributed to these formulas.
- `references/text/PenneysUnitaryFusionCategories.md:145-154,219-237,442,682-698,917-935,992-1019` — dagger, orthogonal sums, simple unit, dual functors, self-duality and unitary spherical duality. Mirror formulas are derived explicitly in E2-R.
- `explorations/2026-10-22-astra/D6-functor-and-obstruction-theory/NOTE.md:158-177,713-716`, `REVIEW.md:71-93`, `INTEGRATION.md:109-139` — round-1 contract and source-gap context; no review suggestion is treated as a theorem.
- `report/sections/82_ising_modular_compiler.tex:48-103,107-127` — calibration scope; `cft_machine/compiler/PROOF.md:78-142`, `cft_machine/compiler/LOCAL_LIMIT.md:1-8,12-45,64-124` — modified modes, sharp refinements and specified local reconstruction.
- `references/text/CFTFromLatticeFermions.txt:221-253,1843-1895,3379-3420` — source KS theorem scope, sharp momentum refinement and its spatial nonlocality, no-wrap modification; registry `references/cft-machine/fermion/SOURCES.md:1-37`.
- `worklog/015_2026-09-22_fusion_space_windup.md:106-117` — existing UV-edge warning, used only to delimit the calibration; not a new proof of it.
- `checks/check_e2.py:1-164`, `checks/raw_output.txt:1-13` — exact local reproducibility bundle for the finite identities and rejected mutations.
