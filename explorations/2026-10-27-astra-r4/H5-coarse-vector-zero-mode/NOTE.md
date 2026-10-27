# H5 — fixed-coarse-vector KS zero mode

Started 2026-10-27, 13:10 UTC. Initial ledger written within the first ten
minutes. This is a working research note; statuses below are not conclusions
until the corresponding proof is supplied. All notation additions are local
to this note, following the brief's restriction against editing CONVENTIONS.md.

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

**Hypothesis audit to be completed:** A1 in
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
It is a local sufficient supplier of the already known conserved-current
case, not a new proof of CA-100 Theorem 100.4.

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
    T_f = -i f A(x) partial_x + f B(x) + f' F(x),         (H5.6)

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

    [T^L_f+T^S_f,T^L_g+T^S_g]=T^L_h-T^S_h.             (H5.7)

**BY** the Lie-homomorphism property, pi(I)=0, the internal brackets and
CA-79 Lemma 79.1 / CA-100 100.2 <1>1: in the limit
[L_m+S_m,L_n+S_n]=(m-n)(L_(m+n)-S_(m+n)). No mixed commutation was used.

**<1>2. Classify the principal part of either internal family.**

**<2>1.** Integration by parts on periodic smooth sections gives
A=A^dagger, B-B^dagger=-iA', F-F^dagger=-iA.
Put H=(F+F^dagger)/2, so F=H-iA/2 with H Hermitian.
Direct application of the product rule in (H5.6) gives the coefficient
of partial_x in [T_f,T_g] as -W(A^2+i[A,H]), and its constant coefficient as

    W(-iAB-iAF'+[B,F]) - i W' A F.

Consequently the internal identity is equivalent to

    A^2+i[A,H]=epsilon A,
    AF=epsilon F,
    -iAB-iAF'+[B,F]=-i epsilon B.                        (H5.8)

To separate W and W', choose Fourier pairs with m+n=1 and m+n=2,
m!=n. Then W'/W=-i(m+n) has two distinct values. This is a coefficient
comparison of differential operators, not an assumption about smeared
physical stress fields. **BY** the displayed expansion and <1>1.

**<2>2.** At each x diagonalize Hermitian A. In an eigenbasis the diagonal
of [A,H] is zero, so every eigenvalue lambda obeys lambda^2=epsilon lambda.
Thus A=epsilon P for a smooth orthogonal projection P, and [P,H]=0.
The second equation of (H5.8) then gives H=PHP and
F=PFP=H-i epsilon P/2. On ran(P), F and F+i epsilon P are invertible:
their eigenvalues have imaginary parts -epsilon/2 and epsilon/2.
**BY** finite-dimensional spectral diagonalization and (H5.8).

**<2>3.** Let R=I_d-P. Block the last equation of (H5.8).
The RR block gives RBR=0. The RP block gives
RBP(F+i epsilon P)=0, hence RBP=0.
Differentiating F=PFP gives PF'R=F P'R. The PR block therefore gives

    F(PBR+i epsilon PP'R)=0,
    PBR=-i epsilon PP'R.

Since PP'P=0, B=PBP-i epsilon PP'. Substituting in (H5.6), and
differentiating P psi when composing operators, proves exactly

    T_f = P T_f P.                                     (H5.9)

For example P T_f P has derivative term -i epsilon f P partial_x
and the additional constant term -i epsilon f PP', precisely the term
in B above. **BY** (H5.8), the invertibilities in <2>2, and the product
rule. There is no choice of a global diagonalizing frame.

**<1>3. The two symbol supports are orthogonal.** Denote the projections
from <1>2 for L,S by P,Q. Their principal matrices are P,-Q.
Apply the derivative-coefficient computation in <2>1 to the sum in
(H5.7), with principal matrix M=P-Q and Hermitian smearing coefficient
H_sum=H_L+H_S. It yields pointwise

    (P-Q)^2+i[P-Q,H_sum]=P+Q.

Taking the finite matrix trace eliminates the commutator, so tr(PQ)=0.
But tr(PQ)=tr(PQP)=||QP||_HS^2 >= 0. Hence QP=PQ=0.
**BY** (H5.7), (H5.8)'s coefficient calculation, and positivity of the
fiber inner product. This is the essential positive-Hilbert step.

**<1>4. All symbol mixed products vanish.** Equation (H5.9) says
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
An honest finite-component differential representation without a central
extension has zero cubic charge; the central-kernel formulation deliberately
allows actual central extensions. No normal-ordering construction, state,
or local categorical tower satisfying (DS) is asserted here.

## Proof programme (initially open)

1. H5-AUDIT: isolate the exact logical strength of the stated hypotheses.
2. H5-LOCAL: derive the total-current continuity defect as a local sum.
3. H5-BOUND: identify a quantitative coarse-vector criterion and whether A1–A4 imply it.
4. H5-TARGET: prove automatic ZC, or construct and verify a genuine counterexample tower.
5. H5-CHECK: small finite-size transported-vector check, with invariants and raw output.

## Results ledger

- H5-AUDIT — proven: no implicit locality, physical-energy or gap hypothesis.
- H5-LOCAL — proven: exact three-site total-current defect (H5.1).
- H5-BOUND — proven implications: local equation, remainder and correlation tests; applicability is conditional.
- H5-SYMBOL — conditional: (DS) plus both standard-KS certificates implies all mixed commutation; (DS) remains extra data.
- H5-TARGET — open.
- H5-CHECK — open.

## Layer tags

Setting: periodic/full. Data: category-free analytic question, L0 for a
categorical realization with arbitrary pointed O, plus all microscopic
declarations in ASSUME. Rung reached: none newly established. Rung claimed:
the conditional R2 interface would require both certificates only, without
an independent ZC hypothesis. R3–R5 are not claimed.

## Pillar served

P4: control of mixed mode products on the common OAR refinement system.

## What this gives the integration

Pending. Target: CA-88's CA-91 periodic/full conditional-R2 entry, via
CA-100 Target 100.12. The exact CA-75 link will be recorded after source audit.

## Open problems

Automatic vanishing of Z_r on every transported coarse vector; alternatively,
a finite-site, finite-range tower with both verified certificates and a
nonzero limiting Z_r. Formal Lie algebras and finite-size nonzero defects alone
do not refute the target.

## Examples table

| Instance (checks only) | Status |
| --- | --- |
| Small translated chain with declared refinement | Pending |

## Sources used

- `report/sections/100_zero_mode_lattice_chirality.tex:39-74,126-147,270-280`:
  notation, inherited transport and mixed-bracket reductions, target (line anchors to verify).
- `cft_machine/research/virasoro_routes.md:55-80,115-177`: A1–A4, word
  convergence, auxiliary-control and locality exclusions.
- `CONVENTIONS.md:1450-1470,1505-1593`: pointed site, prescribed KS modes,
  layer tags, parity and graph norms.
- `worklog/023_2026-10-27_status_overview.md`: sections 0, 1, 4, P4 gap.
