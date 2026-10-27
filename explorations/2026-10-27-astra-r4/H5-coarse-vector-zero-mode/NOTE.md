# H5 — fixed-coarse-vector KS zero mode

Started 2026-10-27, 13:10 UTC. The initial all-open ledger was written within
the first ten minutes and updated as results were proved.

**Verdict: partial; Target 100.12 is neither proved nor refuted.** Two new
conditional suppliers of ZC are proved: a common annihilation graph core
(H5-CORE), and a finite-rank local differential-symbol map with central
kernel (H5-SYMBOL). Neither additional hypothesis is derived from the
original tower assumptions. The exact local defect and translation-sector
formula isolate the remaining O(N^-3)-to-o(N^-3) gap. Small checks and both
deliberate mutations are recorded in `checks/`; no fit is used as a proof.

All notation additions are local to this note, following the brief's
restriction against editing CONVENTIONS.md. This task wrote only here and
in `checks/`, with no network, Julia suite, report changes or commits.

## Target and scope

**Pillar P4:** determine whether the common microscopic KS/OAR certificates
already force the zero-mode condition needed for two commuting stress families.
The construction is formulated for an arbitrary unitary fusion category C and
pointed site object (O, eta); the analytic question uses no categorical identity.

**ASSUME** precisely Target 100.12: a nonzero common finite Hilbert tower
(H_r, J_r, K_r), K_r >= 1, exact K transport and both standard nearest-neighbour
KS A1–A4 certificates; translated self-adjoint two-site densities k_(r,j),
genuine periodic translation U_r with both Fourier covariance laws and
[U_r,K_r]=0; a complex-linear unitary parity P_r with
P_r k_(r,j) P_r^*=k_(r,-j) and [P_r,K_r]=0. Indices are cyclic,
N_r -> infinity, and the real subtractions and shifts are those of (ap)/(at).

Reuse CA-100's notation
Hcal_r = sum_j k_(r,j), Jcal_(r,j)=i[k_(r,j),k_(r,j+1)],
Qcal_r=sum_j Jcal_(r,j), L_(r,n)=E_(r,n)-B_(r,n),
S_(r,n)=Tbar_(r,-n)=E_(r,n)+B_(r,n).
Write Z_r=[L_(r,0),S_(r,0)]=N_r^2[Hcal_r,Qcal_r]/(8 pi^2).

**PROVE (H5-TARGET)** for every fixed a and v in H_a,
||Z_r J_(r<-a)v|| -> 0. If true, CA-100 Lemma 100.1 and Theorem 100.4
already supply uniform ZC, all mixed brackets and equal ledgers; these are
dependencies, not results to re-prove here.

**Hypothesis distinction:** A1 in
`cft_machine/research/virasoro_routes.md:55-60` states isometric refinement
and exact transport of an auxiliary control; it does not state spatial
locality of J, physical-energy comparison, positive energy, or a spectral gap.
Any use of such additional structure must be explicitly marked.

## H5-AUDIT — what the assumptions supply

**Status: proven audit; periodic/full; category-free, L0 for a categorical
realization; an R2-interface clarification, no new rung.**

**ASSUME** the target's hypotheses. **PROVE** that the suggested locality,
physical-energy and spectral-gap arguments require additional declarations.

**<1>1.** A1 says that J is isometric and K transports exactly; K is explicitly
an auxiliary regularity control, not necessarily the Hamiltonian. Spatial
locality of J and local unital observable maps are not clauses of A1.
**BY** `cft_machine/research/virasoro_routes.md:55-60,157-167` and
`report/sections/81_cft_machine_oar_contract.tex:95-114`.

**<1>2.** A3 is summable matching of prescribed modes. Differentiated
holomorphic gate matching is one *supplier* of A3, with extra assumptions;
it is not part of A3 itself. **BY** VR-1:67-70 and CA-89 Theorem 89.1(ii).

**<1>3.** K >= 1 supplies graph-norm product inequalities, not a positive
rotation spectrum or a physical spectral gap. Those conclusions are expressly
excluded by VR-1:82-85,169-177; CA-91 Negative 91.8 already gives two-sided
zero-mode spectrum with positive Hilbert A1–A4. That example is not standard
KS and does not refute H5. **BY** the cited clauses and example. **QED.**

This is not an independence proof for H5: a more subtle consequence of the
*complete* microscopic assumptions could still prove it. It prevents adding
unlisted hypotheses to a proposed proof.

## H5-LOCAL — the exact three-site obstruction

**Status: proven; periodic/full; category-free, or L0 with pointed O and a
declared periodic local representation; finite ingredient ->R2.**
No refinement, state, parity or Virasoro certificate is needed here.
For N >= 5 write, locally in this note,

    R_j = [k_j+k_(j+1), [k_j,k_(j+1)]].

R_j is self-adjoint. In a categorical instance it is an element of the
three-site endomorphism algebra, placed using the fixed associator conventions.

**ASSUME** self-adjoint two-site densities and commutation of disjoint
supports, as in CA-100:39-44. **PROVE**

    [Hcal,Qcal] = i sum_j R_j,
    Z_r = i N_r^2/(8 pi^2) sum_j R_(r,j).                 (H5.1)

**<1>1.** Expand [Hcal,Qcal]/i as
sum_(l,j) [k_l,[k_j,k_(j+1)]]. Only l=j-1,j,j+1,j+2 contribute.
**BY** disjoint-support commutation and Jacobi.

**<1>2.** The two outer sums cancel. With A=k_(j-1), B=k_j,
C=k_(j+1), one has [A,C]=0 and

    [A,[B,C]] = [[A,B],C] = -[C,[A,B]].

The last expression is minus the l=(j-1)+2 term belonging to the
current at j-1. Summing cyclically pairs every outer term once.
**BY** Jacobi and index translation. This cancels four-site terms; it
does not assert that an individual current-time derivative is three-site.

**<1>3.** The surviving l=j,j+1 terms are exactly R_j.
Since [k_j,k_(j+1)] is skew-adjoint, its commutator with k_j+k_(j+1)
is self-adjoint. The second equation follows from CA-100 Theorem 100.4's
finite zero-mode identity. **BY** <1>1–<1>2 and dagger reversal. **QED.**

## H5-BOUND — local equations and transported-vector estimates

**Status: proven implications, conditional application to H5; periodic/full;
category-free, L0 for categorical tile equations; finite ingredient ->R2.**
This is an explicit sufficient test, not a claim that A1–A4 imply the test.

**Local declarations.** At each scale choose any translated self-adjoint
two-site operator a_(r,j), and define

    delta_(r,j) = R_(r,j) - (a_(r,j+1)-a_(r,j)).          (H5.2)

For general C these choices belong to End_C(O^2); on O^3 the subtracted
term is 1_O tensor a - a tensor 1_O, with recoupling understood as in
CONVENTIONS (ao). No braiding or categorical numerical value is used.
Let |Y|_(s,2)=||K_r^s Y K_r^(-s-2)|| and
psi_r=J_(r<-a)v for fixed a,v. Choices of a_j may depend on r.

**ASSUME** H5-LOCAL and, for the graph estimate, [U_r,K_r]=0.
**PROVE** the following three tests.

**<1>1. Exact finite equation.** If delta_(r,j)=0 for every j, then Z_r=0.
**BY** sum_j(a_(r,j+1)-a_(r,j))=0 and (H5.1).
This is a finite cubic equation in the density and a linear equation in a.
The equation itself is the cubic cokernel condition of CA-78 Theorem 78.5
(`report/sections/78_categorical_selection_equations.tex:110-132`), reused
here as a local supplier of the already known conserved-current case.
Neither that condition nor CA-100 Theorem 100.4 is claimed as a new result.

**<1>2. Uniform approximate equation.** For all s >= 0,

    |Z_r|_(s,2) <= N_r^3/(8 pi^2) |delta_(r,0)|_(s,2).  (H5.3)

Indeed (H5.1)–(H5.2) express Z as i N^2/(8 pi^2) times the sum of
translated delta's. Conjugation by U is isometric in this graph norm
because [U,K]=0. Apply the triangle inequality to the N terms.
Thus o(N^-3) for each displayed local graph norm supplies ZC.
A stronger but purely local operator-norm test is
||delta_(r,0)||=o(N^-3): it supplies ||Z_r|| -> 0 directly, without
assuming that K commutes with the local remainder. **BY** the displayed
computation. An operator-norm estimate alone is not substituted into
(H5.3) at s>0; instead fixed-vector convergence and CA-100 100.1 upgrade it.

**<1>3. Coarse-vector correlation test.** Define the physical Gram matrix

    G^(r,a,v)_(j,l) = <delta_(r,j) psi_r, delta_(r,l) psi_r>,

with the inner product linear in the second argument. Then exactly

    ||Z_r psi_r||^2 = N_r^4/(64 pi^4) sum_(j,l) G_(j,l). (H5.4)

Consequently the bound

    max_j sum_l |G_(j,l)| <= b_(r,a,v),
    N_r^5 b_(r,a,v) -> 0                                (H5.5)

implies the target on this vector. **BY** the norm square of the sum
in <1>2 and N row sums. No translation invariance of psi_r is assumed.
Positivity makes G positive semidefinite but supplies no small value for
b. Thus (H5.5) is a separate, measurable correlation estimate.
If (H5.5) holds for every fixed a,v, CA-100 100.1/100.4 give the full
two-family conclusion with all uniform graph tails. **QED.**

The exact identity (H5.4) is an equivalent rewriting on a vector; the
absolute-row bound (H5.5) is a stronger sufficient condition, potentially
losing cancellations. Neither is advertised as automatic decay.

## H5-PHASE — the precise remaining little-o estimate

**Status: proven reduction and bound; periodic/full; category-free, L0 for
categorical realizations; finite ingredient ->R2.** No logarithm is chosen.
Let Pi_(r,omega) be the orthogonal spectral projections of U_r, and set

    Phi_r(Y)=N_r^-1 sum_(j=0)^(N_r-1) U_r^j Y U_r^(-j).

**ASSUME** H5-LOCAL, translated densities and U_r^N_r=I.
**PROVE**, for psi_r=J_(r<-a)v,

    Z_r = i N_r^3/(8 pi^2) Phi_r(R_(r,0)),
    ||Z_r psi_r||^2
      = N_r^6/(64 pi^4) sum_omega
          ||Pi_omega R_(r,0) Pi_omega psi_r||^2.         (H5.6)

**<1>1.** R_j=U^j R_0 U^-j by its polynomial definition. Apply (H5.1).
For two distinct eigenphases omega,nu, the finite geometric sum
N^-1 sum_j(omega/nu)^j is zero; for equal phases it is one. Hence
Phi(Y)=sum_omega Pi_omega Y Pi_omega. **BY** translation and the geometric sum.

**<1>2.** The output vectors in distinct Pi_omega ranges are orthogonal,
so taking the squared norm proves (H5.6). **BY** the spectral theorem
for the finite unitary U and Pythagoras. **QED.**

**Additional bound under A1–A2.** Let

    M=C^L_(0,0) C^S_(0,1)+C^S_(0,0) C^L_(0,1).

The graph product bound of CA-89 Lemma 89.2 and exact K transport give
||Z_r psi_r|| <= M ||K_a^2 v||. Thus (H5.6) proves

    (sum_omega ||Pi_omega R_(r,0) Pi_omega psi_r||^2)^(1/2)
       <= 8 pi^2 M ||K_a^2 v|| / N_r^3.                (H5.7)

H5 is exactly the upgrade of this O(N^-3) bound to o(N^-3) for every
transported coarse vector. The projection is onto *equal phase blocks*,
including all their degeneracies; parity does not make those blocks scalar.
Replacing R_0 by any remainder delta_0 from (H5.2) leaves Phi unchanged,
since Phi(U a_0 U^*-a_0)=0. These facts identify where a local equation
or additional physical control must improve the existing bound.

## H5-CORE — a common annihilation core supplies ZC

**Status: proven conditional theorem; periodic/full; category-free, L0 for
any categorical realization; R2 implication conditional on both certificates
and (AC) below.** This gives an algebraic alternative to the symbol condition.
It requires neither parity, positive energy, joint zero-mode eigenvectors,
a current conservation law nor a prescribed continuum category.

**Additional hypothesis (AC).** In the common smooth domain D, let

    W = {w in D : L_n w=0 for all n>0,
                  S_n w=0 for all n<0}.

The linear span E of all finite mixed mode words applied to W is dense
in D for the H_2 graph norm ||K^2 . || of VR-1. This explicitly includes
the mode-number orientation S_n=Tbar_-n. Hilbert-norm cyclicity alone is
not substituted for the graph-density requirement.

**ASSUME** a nonzero common standard-KS A1–A4 tower and (AC).
**PROVE** [L_m,S_n]=0 on D for every m,n, equal ledgers and finite ZC.

**<1>1. Use the already proved mixed algebra before assuming ZC.**
CA-100 Lemma 100.2 and Theorem 100.3 <1>1 give on D

    C_mn=[L_m,S_n]=X_(m+n)+delta_(m+n,0) gamma_m I/2,
    gamma_m=(m^3(c_R*-c_L*)-m(c_R-c_L))/12,
    [L_p,X_q]=p X_(p+q)+[L_0,X_(p+q)]
                +(p/2)delta_(p+q,0)gamma_p I,
    [S_p,X_q]=-p X_(p+q)+[S_0,X_(p+q)]
                +(p/2)delta_(p+q,0)gamma_p I.           (H5.8)

These are inherited identities, not new derivations. The last two are the
*unreduced* actions, valid when X_0 has not yet been set to zero.

**<1>2. Every X_q annihilates W, and the ledgers agree.**

**<2>1.** There exists nonzero w in W: otherwise E=0 contradicts (AC)
and the nonzero tower. For every m>0 both L_m and S_-m annihilate w,
so C_(m,-m)w=0 and X_0 w=-gamma_m w/2. Therefore gamma_m is constant
for positive m. Write gamma_m=u m^3+v m. Equality at m=1,2,3 gives
7u+v=0 and 26u+2v=0, hence u=v=0. Thus both ledgers agree and gamma=0.
**BY** (H5.8), w!=0 and the displayed scalar computation.

**<2>2.** For any integer q choose m>max(q,0) and n=q-m<0.
For every w in W, both operators in C_mn annihilate w. With gamma=0,
C_mn w=X_q w=0. **BY** the definition of W and <2>1.

**<1>3. W is invariant under both zero modes.** For n>0,
L_n L_0 w=L_0 L_n w+nL_n w=0. For n<0,
S_n L_0 w=L_0 S_n w-X_n w=0. Similarly
L_n S_0 w=S_0 L_n w+X_n w=0 for n>0, and
S_n S_0 w=S_0 S_n w-nS_n w=0 for n<0.
**BY** the internal zero-mode brackets and <1>2. There is no
simultaneous diagonalization or eigenvector assumption.

**<1>4. Propagate along all mixed words.** Define E_0=W and

    E_(k+1)=E_k+span{L_p v, S_p v : p!=0, v in E_k}.

Induct simultaneously that E_k is zero-mode invariant and X_q E_k=0
for every q. The base is <1>2–<1>3. If true at k, then
[L_0,X_t]v=[S_0,X_t]v=0 for v in E_k, because X_t kills E_k and the
zero modes preserve E_k. Equation (H5.8) gives [L_p,X_q]v=[S_p,X_q]v=0,
so X_q kills E_(k+1). Commuting either zero mode past L_p or S_p gives
its internal multiple of that mode, or a term X_p v=0; hence E_(k+1)
is zero-mode invariant as well. Thus E=union_k E_k and all X_q vanish
on E. **BY** this simultaneous induction and <1>3.

**<1>5. Extend to the actual graph domain.** For each m,n, A2 and the
graph product bound give

    ||C_mn v|| <= (C^L_(m,0)C^S_(n,1)
                  +C^S_(n,0)C^L_(m,1)) ||K^2 v||.

Since C_mn=X_(m+n) vanishes on E and E is H_2-dense in D, it vanishes
on D. CA-100 Lemma 100.1 supplies all finite loss-two tails, including
ZC; mixed-word convergence gives H5-TARGET. **BY** (AC), A2, <1>4 and
the cited transport theorem. **QED.**

**Missing microscopic lemma.** A1–A4 do not currently provide (AC).
Even an assumed lower bound on total E=L_0+S_0 cannot be used in the
usual independent-ladder argument without further work:

    [E,L_n]=-nL_n-X_n,     [E,S_n]=nS_n+X_n.

The unknown mixed terms are exactly what that argument would need to
control. A spectral lower bound also does not itself assert an attained
vacuum or graph-dense generation. These observations diagnose the gap;
they are not counterexamples to a more subtle positive-energy theorem.

## H5-SYMBOL — a positive-Hilbert rigidity theorem with an extra symbol hypothesis

**Status: proven conditional theorem; periodic/full; category-free, L0 for
any categorical microscopic realization; R2 implication conditional on both
certificates and the symbol hypothesis below.** No parity or positive-energy
assumption is used in this theorem. It does not prove that H5's hypotheses
supply the symbol hypothesis.

**Additional structural hypothesis (DS).** Let g be the *actual* complex Lie
algebra of operators on the common invariant VR-1 domain D generated by
the limiting L_n,S_n and I. There is a complex-linear Lie homomorphism
pi from g into differential operators on C-infinity(S^1,C^d), 0<d<infinity,
such that pi(I)=0 and ker(pi) is central in g. This map must factor through
actual operator relations, not merely through a free algebra of symbols.
For f_n(x)=exp(-inx), x in R/(2 pi Z), its mode images have the form

    pi(L_n)=T^L_(f_n),     pi(S_n)=T^S_(f_n),
    T_f = -i f A(x) partial_x + f B(x) + f' F(x),         (H5.9)

where each family's A,B,F are smooth d-by-d complex matrix functions,
independent of n. The formal adjoint in L^2(S^1,dx;C^d) satisfies
(T_f)^dagger=T_(conj f). Primes denote x derivatives. These declarations
allow variable principal matrices and first derivatives of the smearing;
they do not assume a scalar principal velocity or constant projectors.
The symbol space is an auxiliary positive-metric space, not an identification
of the physical many-body Hilbert space with a one-particle space.

**ASSUME** a nonzero common standard nearest-neighbour KS A1–A4 tower and
(DS). **PROVE** every limiting mixed bracket vanishes, hence H5-TARGET and
finite uniform ZC hold. The actual internal central charges need not be zero.

**<1>1. The symbol identities have no central terms.** Write T^+ for the
L symbol and T^- for the S symbol. Their internal signs are epsilon=+1
and epsilon=-1 respectively. For f=f_m,g=f_n put W=fg'-gf', h=-iW;
h=(m-n)f_(m+n). The internal relations imply

    [T^epsilon_f,T^epsilon_g]=epsilon T^epsilon_h.

Moreover the inherited standard-KS energy identity gives

    [T^L_f+T^S_f,T^L_g+T^S_g]=T^L_h-T^S_h.             (H5.10)

**BY** the Lie-homomorphism property, pi(I)=0, the internal brackets and
CA-79 Lemma 79.1 / CA-100 100.2 <1>1: in the limit
[L_m+S_m,L_n+S_n]=(m-n)(L_(m+n)-S_(m+n)). No mixed commutation was used.

**<1>2. Classify the principal part of either internal family.**

**<2>1.** Integration by parts on periodic smooth sections gives
A=A^dagger, B-B^dagger=-iA', F-F^dagger=-iA.
Put H=(F+F^dagger)/2, so F=H-iA/2 with H Hermitian.
Direct application of the product rule in (H5.9) gives the coefficient
of partial_x in [T_f,T_g] as -W(A^2+i[A,H]), and its constant coefficient as

    W(-iAB-iAF'+[B,F]) - i W' A F.

Consequently the internal identity is equivalent to

    A^2+i[A,H]=epsilon A,
    AF=epsilon F,
    -iAB-iAF'+[B,F]=-i epsilon B.                        (H5.11)

To separate W and W', choose Fourier pairs with m+n=1 and m+n=2,
m!=n. Then W'/W=-i(m+n) has two distinct values. This is a coefficient
comparison of differential operators, not an assumption about smeared
physical stress fields. **BY** the displayed expansion and <1>1.

**<2>2.** At each x diagonalize Hermitian A. In an eigenbasis the diagonal
of [A,H] is zero, so every eigenvalue lambda obeys lambda^2=epsilon lambda.
Thus A=epsilon P for a smooth orthogonal projection P, and [P,H]=0.
The second equation of (H5.11) then gives H=PHP and
F=PFP=H-i epsilon P/2. On ran(P), F and F+i epsilon P are invertible:
their eigenvalues have imaginary parts -epsilon/2 and epsilon/2.
**BY** finite-dimensional spectral diagonalization and (H5.11).

**<2>3.** Let R=I_d-P. Block the last equation of (H5.11).
The RR block gives RBR=0. The RP block gives
RBP(F+i epsilon P)=0, hence RBP=0.
Differentiating F=PFP gives PF'R=F P'R. The PR block therefore gives

    F(PBR+i epsilon PP'R)=0,
    PBR=-i epsilon PP'R.

Since PP'P=0, B=PBP-i epsilon PP'. Substituting in (H5.9), and
differentiating P psi when composing operators, proves exactly

    T_f = P T_f P.                                     (H5.12)

For example P T_f P has derivative term -i epsilon f P partial_x
and the additional constant term -i epsilon f PP', precisely the term
in B above. **BY** (H5.11), the invertibilities in <2>2, and the product
rule. There is no choice of a global diagonalizing frame.

**<1>3. The two symbol supports are orthogonal.** Denote the projections
from <1>2 for L,S by P,Q. Their principal matrices are P,-Q.
Apply the derivative-coefficient computation in <2>1 to the sum in
(H5.10), with principal matrix M=P-Q and Hermitian smearing coefficient
H_sum=H_L+H_S. It yields pointwise

    (P-Q)^2+i[P-Q,H_sum]=P+Q.

Taking the finite matrix trace eliminates the commutator, so tr(PQ)=0.
But tr(PQ)=tr(PQP)=||QP||_HS^2 >= 0. Hence QP=PQ=0.
**BY** (H5.10), (H5.11)'s coefficient calculation, and positivity of the
fiber inner product. This is the essential positive-Hilbert step.

**<1>4. All symbol mixed products vanish.** Equation (H5.12) says
T^L_f=P T^L_f P and T^S_g=Q T^S_g Q. Their compositions contain the
adjacent multiplication PQ=0. Derivatives act on the identically zero
function when compositions are evaluated, so both products vanish on
smooth sections. **BY** <1>3 and associativity of differential composition.

**<1>5. Lift commutation through the central kernel.** Every [L_m,S_n]
lies in ker(pi) by <1>4, hence commutes with g. Jacobi on D gives

    0=[L_a,[L_b,S_n]]-[L_b,[L_a,S_n]]
      =[[L_a,L_b],S_n]=(a-b)[L_(a+b),S_n].

For each m choose a+b=m with a!=b. Thus [L_m,S_n]=0 for every m,n.
Mixed-word convergence and CA-100 Lemma 100.1 give H5-TARGET and all
uniform finite graph estimates; CA-100 Theorem 100.4 gives equal ledgers.
**BY** centrality, the internal Virasoro bracket and the cited transport
theorem. **QED.**

**Boundary of this theorem.** (DS) is neither obtained from A1–A4 nor from
finite site dimension. It excludes higher differential order, nonlinear
many-body symbols, noncentral symbol kernels and singular coefficients.
The symbol identities have no central terms because pi(I)=0; this does
not force the actual central charges to vanish. No normal-ordering
construction, state, or local categorical tower satisfying (DS) is asserted.

## Verification and limits of the investigation

The full command lines, all-scale proof for the diluted calibration, exact
vector oracle, environment and raw outputs are in `checks/README.md`.
`check_local_chain.py` passes the three-site, Gram and translation-sector
identities, both Fourier covariances, adjoints and parity. Its largest
checked carrier is 512-dimensional. `check_symbols.py` independently
composes differential operators and checks variable orthogonal supports
with nonzero first-derivative improvements. Omitting one local term or the
matrix commutator correction produces the intended assertion failures;
both mutations were run before the successful baselines.

Two independent read-only collaborators checked H5-CORE. A skeptical
collaborator checked H5-LOCAL/BOUND and H5-SYMBOL; the latter's symbol map
must be defined on the actual operator algebra, as now stated. These are
internal checks, not the anticipated later Opus review. The proofs above,
not collaborator assertions, are the evidence for the new implications.

The attempted direct route stops at (H5.7). Translation only removes
off-phase blocks; positivity of their norm square does not improve big-O
to little-o. K is not physical energy, and the two zero modes' energy
ladders contain the unknown X terms displayed after H5-CORE. The
finite nonconservation example fails A2/A3, while enforcing the easy
certificates by dilution kills all stress. Thus neither is the requested
genuine counterexample. CA-100's formal obstruction and logarithm negative
are retained with their existing scopes, not recycled as refutations.

## Results ledger

- H5-AUDIT — proven: audit of the stated A1–A4 clauses; no implicit locality, physical-energy or gap hypothesis.
- H5-LOCAL — proven: exact three-site total-current defect (H5.1).
- H5-BOUND — proven implications: local equation, remainder and correlation tests; applicability is conditional.
- H5-PHASE — proven: exact zero-transfer block formula and O(N^-3) bound; the required little-o improvement remains open.
- H5-CORE — conditional: the common annihilation graph-core hypothesis (AC) supplies all mixed commutation; (AC) remains extra data.
- H5-SYMBOL — conditional: (DS) plus both standard-KS certificates implies all mixed commutation; (DS) remains extra data.
- H5-TARGET — conjectural: original automatic ZC is neither proved nor refuted; no genuine counterexample tower is supplied.
- H5-CHECK — proven finite identities and measured values, with a proved trivial diluted tower; no extrapolated continuum claim.

## Layer tags

Setting: periodic/full throughout; this names the supplied boundary setting,
not a boundary-choice research problem. Data: category-free analytic results;
L0 suffices for a categorical realization with arbitrary pointed O and
declared local periodic representation. The target also declares both KS
certificates, K, refinements, translation and complex-linear parity.
H5-CORE adds (AC); H5-SYMBOL adds (DS); H5-BOUND names its extra decay
condition. Neither (AC) nor (DS) is categorical enrichment or a supplied
target theory. Rung reached: finite ->R2 ingredients and conditional R2
implications; no new nontrivial tower satisfying their hypotheses.
Rung claimed by the unresolved target: mixed R2 on both certificates only,
with no independent ZC condition. No R0^u, R1 or R3–R5 advance is claimed.

## Pillar served

P4: control of mixed mode products on the *same* OAR refinement system.
The local obstruction and its translation average identify the microscopic
estimate to supply; (AC) and (DS) give two rigorous alternatives to estimating
it directly. The indefinite-number carrier remains the programme's input;
the fixed-occupation numerical subspace is only a reducing test sector.

## What this gives the integration

CA-88's CA-91 periodic/full/category-free row stays **R2 [conditional]**.
It may gain the annotations "ZC follows from (AC)" and "ZC follows from
(DS)", with both certificates required. It does **not** become "conditional
on both certificates only", and there is no counterexample row to add for
Target 100.12. CA-100 gains the explicit local and equal-phase block targets;
its cubic-balance and finite/core equivalence theorems are unchanged.

This touches CA-75 **Link (a3)**, the KS insertion/residual comparison feeding
the mode layer (`report/sections/75_integration_map.tex:131-135`): after
both certificates, the remaining mixed obstruction has a concrete local
form and two conditional ways to remove it. It does not prove the geometric
Ward-to-KS identification. Link (b)'s Wilson-state drift, local unital
refinements, R1, R3, fidelity R4 and functorial R5 are unchanged. CA-89/95's
operator Ward bounds also remain separate obligations. No new general-C
noncollapse example is supplied.

## Open problems

1. **Original sharp lemma.** Under exactly Target 100.12, improve (H5.7)
   to o(N^-3) for every a,v, or produce a genuine tower where the left side
   times N^3 has a nonzero limiting norm. All A1–A4 clauses must be verified.
2. **Microscopic supplier of (AC).** Construct common annihilating vectors
   and prove H_2 graph-density of their mixed-word span on the same system.
   One sufficient finite formulation uses fixed coarse seeds v_alpha: prove
   L_(r,n)Jv_alpha->0 for n>0, S_(r,n)Jv_alpha->0 for n<0, and graph-dense
   mode-word generation by i_(a_alpha)v_alpha. Mixed-word convergence then
   places those seeds in W. Neither this formulation nor (AC) is established
   by a spectrum fit or Hilbert-norm cyclicity.
3. **Microscopic supplier of (DS).** Derive a symbol map with the stated
   finite rank, first-order/first-derivative form and central kernel from
   an actual common KS tower. A formal assignment to generators does not
   suffice. No general-C existence or necessity of (DS) is conjectured here.
4. **Local quantitative alternative.** Prove an assembled correlation
   estimate such as (H5.5), or sufficient decay of the cubic remainder
   modulo translated differences. Locality alone gives neither rate.

These are alternative sufficient routes. Failure of (AC), (DS), or the
absolute correlation bound would not by itself refute H5.

## Examples table

| Instance (checks only) | Result and exact scope |
| --- | --- |
| Any C, O=1 direct-sum 1 direct-sum 1; the three-state density in `checks/README.md` | Positive two-site density, translated/reflection symmetric. On the append-vacuum coarse vector, ||Z_N v_N|| is 3.26009, 5.79571, 13.04036, 23.18285 at N=6,8,12,16. A2 and A3 fail; not an H5 counterexample. |
| Same instance, density multiplied by N^-4 | Both A1–A4 verified analytically on the full carriers; ||Z_N v_N|| is proportional to N^-10. All limiting modes are zero, so no noncollapse or rung upgrade. |
| Smooth variable rank-one orthogonal projections in C^2 | Exact internal differential brackets and vanishing mixed products with first-derivative improvements. Symbol calibration only, no microscopic (DS) certificate. |

## Sources used

- `references/lattice-symmetry/GransSamuelssonEtAl2020/source/Linnea11.5.tex:791-822`:
  source energy/current KS prescription; provenance in
  `references/lattice-symmetry/SOURCES.md:966-999`.
- `references/text/PenneysUnitaryFusionCategories.md:219-237,442`:
  orthogonal unit multiplicities and simple unit, used only in the example;
  registered in `references/manifest/SOURCES.md:35,57`.
- `report/sections/79_ks_shell_and_refinement_defect.tex:52-83`:
  prescribed signs, velocity, Fourier identity and control distinction.
- `report/sections/100_zero_mode_lattice_chirality.tex:40-73,77-105,123-138,268-277`:
  notation, transport equivalence, inherited mixed algebra and unreduced
  actions, ZC consequences, original target. These are used, not re-proved.
- `cft_machine/research/virasoro_routes.md:55-80,115-177`: A1–A4, word
  convergence, auxiliary-control and locality exclusions.
- `report/sections/81_cft_machine_oar_contract.tex:95-114`:
  same-system and analytic scope of the mode contract.
- `report/sections/89_ward_ks_transfer.tex:88-99,150-177`:
  graph product calculus, inadmissible physical control and differentiated matching.
- `report/sections/91_parity_and_chiral_delineation.tex:64-103,165-174,233-237`:
  target hypotheses, parity ledger equality, prior two-sided-spectrum diagnostic.
- `report/sections/95_probe_word_ward_lifting.tex:42-100,106-143,219-225`:
  uniform probe requirements, trivial auxiliary-control example and scope.
- `report/sections/78_categorical_selection_equations.tex:110-132`:
  the already established cubic cokernel equation, reused in H5-BOUND.
- `explorations/2026-10-25-astra-r3/F2-zero-mode-and-lattice-chirality/NOTE.md:63-100,149-363,365-453`:
  inherited results and formal-only obstruction; `REVIEW.md:1-81,89-161,318-336`
  and `INTEGRATION.md:9-54,197-222` fix their scope and the next target.
- `report/sections/88_layered_targets.tex:58-80,96-125,137-155` and
  `report/sections/75_integration_map.tex:115-165`: grid, same-system rule,
  and integration links.
- `CONVENTIONS.md:444-492,631-694,1397-1639`: reused matrix, pointed-site,
  tile, KS, layer, parity and graph conventions; additions are note-local.
- `worklog/023_2026-10-27_status_overview.md:20-84,155-190`:
  pillars, actual certificate status and structural gaps.
- New derivations are the displayed Lamport steps in this note; exact and
  numerical checks, commands and raw output are under `checks/README.md`.
