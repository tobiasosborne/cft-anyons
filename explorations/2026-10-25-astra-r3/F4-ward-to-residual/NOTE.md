# F4 — Probe-word Ward-to-residual: proof ledger

Started 2026-10-25, 05:04 UTC. Initial all-open ledger written at 05:05 UTC,
before the ten-minute deadline; updated after each completed result.
**Outcome: partial forward proof, a proved converse counterexample, and a
reproducible spectral calibration. F4(a) as literally stated is not proved.**
Only this directory is writable for this round;
no network, repository-wide checks, commits, or convention-file edits.
Existing conventions (ap), (aq), (ar) are used; any supplementary analytic
notation is declared here before use, under the brief's scope restriction.

## Statement under investigation

For periodic/full realizations, one chiral family at a time, F4(a) asks
whether D2's probe-word contour identity (19), graph-dense reflected probes,
and vanishing one-sided two-loss collar constants imply
`|[S_m,S_n] - beta_N S_(m+n) - z^(r)_(mn) I|_(s,2) -> 0` (W2).
F4(b) asks for the converse from W2 for standard KS modes, assuming A2.
F4(c) asks for an explicit free-fermion test with `K = 1 + E_N`.

Tags: periodic/full (per family); **category-free**; reached: no new rung;
claimed: an ingredient `->R2`, never R3/R4/R5. Application to arbitrary
unitary fusion/modular C additionally declares its microscopic realization.
No fusion identity enters the analytic implication.

Primary dependency: CA-89, especially 89.5 and 89.L; CA-78 78.11.
Path abbreviations used below: **D2** =
`explorations/2026-10-22-astra/D2-selection-principle/`; **E4** =
`explorations/2026-10-22-astra-r2/E4-ward-to-ks-transfer/`;
**backend/PROOF.md** (also `PROOF.md` in Section 5) =
`cft_machine/benchmarks/fermion/PROOF.md`;
**…Fermions.txt** = `references/text/CFTFromLatticeFermions.txt`.

## Proof plan and audit obligations

1. Specify exactly what a probe residual bounds: a uniform sesquilinear
   form on physical, graph-weighted boundary vectors, or individual words.
2. Identify the sewn contour difference with the equal-time commutator;
   separate this geometric step from completion of a dense-domain bound.
3. Prove the completion and collar-integration estimates with constants.
4. Identify the contact term, retaining chart-change and zero-mode data.
5. Prove the strongest converse and test any stronger equivalence by an
   explicit counterexample.
6. Audit and run the existing fermion benchmark at its documented sizes;
   distinguish its actual observables from unimplemented Ward quantities.

## 1. Uniform probe bounds: the completed analytic step

**F4.1 [proven; any; category-free; ->R2].** The state is used only to
define the positive boundary quotient. No faithfulness of that state on an
ambient algebra is needed for the following finite-scale statement.

**ASSUME** a finite-dimensional positive quotient H_r, K_r >= 1, and the
linear span D_r of reflected probe vectors, dense in H_r (equivalently in
every finite-scale graph norm). All residual forms descend to this quotient.
For each integer s >= 0 fix one alpha_s in [0,1), independent of r. Let R_r be the
operator representing an assembled residual form rho_r, with

    rho_r(u,v) = <u,R_r v>,  inner product linear in the second slot.

Require the **uniform physical probe bound**, including arbitrary linear
combinations of words on both sides,

    |rho_r(K_r^s u, exp(-t K_r)v)|
      <= b_(r,s) t^(-s-1-alpha_s) ||u|| ||v||,     0 < t <= 1,       (F1)

for all u,v in D_r. At finite scale D_r=H_r; thus the weighted arguments
are legitimate without imposing stability of individual probe words.
**PROVE**

    |R_r|_(s,2) <= C_(s,alpha_s) b_(r,s),
    C_(s,alpha) = 1/((s+1)! (1-alpha)) + sum_(j=0)^(s+1) 1/j!.     (F2)

`<1>1.` D_r=H_r. **BY** finite dimensionality: every linear subspace is
closed, so a dense linear subspace is the whole space. This conclusion
concerns the span, not the individual word set.

`<1>2.` (F1) gives `||K_r^s R_r exp(-tK_r)|| <= b_(r,s)t^(-s-1-alpha_s)`.
**BY** <1>1 and the dual norm identity
`||w||=sup_(||u||=1)|<u,w>|`, obtained by Cauchy–Schwarz with equality at
u=w/||w|| when w != 0. Thus no unproved passage from weak convergence
to operator-norm convergence occurs.

`<1>3.` Apply the two-loss version of D2-L10
(`D2/NOTE.md:575–594`) to the bound in <1>2.
For completeness the constant is evaluated, not a new collar theorem:

`<2>1.` Diagonalizing the positive finite matrix K gives
`K^(-s-2)=1/(s+1)! integral_0^infinity t^(s+1) exp(-tK) dt`.
**BY** the scalar gamma integral, obtained by s+1 integrations by parts.

`<2>2.` The integral on (0,1] is bounded by
`b/((s+1)!(1-alpha))`. **BY** <1>2 and integration of t^(-alpha).

`<2>3.` For t >= 1, factor `exp(-tK)=exp(-K)exp(-(t-1)K)`.
The norm is at most `b exp(1-t)` after the K^s R factor, since K>=1.
Successive integration by parts gives
`integral_1^infinity t^(s+1)exp(1-t)dt/(s+1)!
 = sum_(j=0)^(s+1)1/j!`.
**BY** <1>2 at t=1 and the finite spectral inequality.

`<1>4.` QED **BY** <1>3<2>1–<2>3 and the triangle inequality. In particular
b_(r,s)->0 proves the two-loss residual estimate for every fixed s.

**What the hypothesis means.** A constant for each word separately is not
(F1). Coordinates must use the physical positive quotient and its Gram.
If G is the Gram matrix of an independent probe basis and B is the matrix
of a sesquilinear residual form, its norm is
`||G^(-1/2) B G^(-1/2)||`; this differs from D2-L9's formula for an
*operator-coordinate* matrix Delta. **BY** writing physical unit vectors
as `G^(-1/2)x` on both sides. Null coordinates must first be quotiented.

## 2. What is needed to apply F4.1 to a contour

**F4.2 [proven implication; periodic/full per family; category-free; ->R2].**
This is a precise sufficient version of 89.L. It separates the geometric
identification from the analytic completion, rather than naming W2 as a
hypothesis.

**ASSUME** the positive quotient and uniform probe convention of F4.1;
the geometric S and cylinder Fourier conventions of (ar); and a finite
sequence of sewn, probe-dependent diagrams F_0,...,F_L for each fixed
(r,m,n). The following are the added, testable geometric assumptions:

- **G1 (endpoints):** after the declared Fourier sums, the difference
  `F_L(u,v)-F_0(u,v)` is `<u,[S_m,S_n]v>` plus an endpoint/collar error.
  This includes both orderings, not just an enclosing contour on the vacuum.
- **G2 (contacts):** each step is its D2 Ward contact plus its residual.
  After transport to the declared cylinder chart, the sum of contacts is
  `<u,(beta_N S_(m+n)+z^(r)_(mn)I)v>` plus a chart/quadrature error, with

      z^(r)_(mn)=delta_(m+n,0)
        [kappa_(3,r)d_N(m)^3+(kappa_(1,r)-2b_r)d_N(m)].             (F3)

  The first- and third-derivative contact and the zero-mode shift are
  specifically those of CA-89 89.5; N>|m+n| avoids aliasing. G2 cannot
  be silently inferred from D2's plane-coordinate identity.
- **G3 (uniform accumulated estimate):** every error form, including
  endpoints and chart errors, satisfies (F1), after quotient, transport,
  Fourier normalization, and all insertion counts. If the errors are
  rho_i with coefficients a_i, require

      B_(r,m,n,s)=b_end+b_chart+sum_i |a_i| b_i -> 0.               (F4)

  A sharper directly proved bound on the assembled form may replace this
  absolute sum. No claim that local scalar contacts exist separately is made.

**PROVE** W2 with `w_(r,m,n,s)<=C_(s,alpha_s) B_(r,m,n,s)`.

`<1>1.` Sum `F_(i+1)-F_i=contact_i+error_i`. All intermediate diagrams
cancel, leaving the two endpoint diagrams. **BY** finite telescoping.

`<1>2.` Substitute G1 and G2. On every probe pair the resulting identity is

    <u,([S_m,S_n]-beta_N S_(m+n)-z^(r)_(mn)I)v>
       = sum_i a_i rho_i(u,v) + rho_chart(u,v) - rho_end(u,v).    (F5)

**BY** <1>1; endpoint signs affect neither the following norm nor (F4).

`<1>3.` The right side satisfies (F1) with constant B_(r,m,n,s).
**BY** G3 and the triangle inequality, uniformly over both normalized
probe linear combinations. Equation (F5) identifies its representing
operator with the actual commutator residual by F4.1<1>1–<1>2.

`<1>4.` QED **BY** F4.1 and <1>3. This proves an operator estimate for
the assembled contour error without assuming operator W2 in advance.

**Corollary F4.2a [conditional application; same tags].** If S has A2,
the contact coefficients and b converge, and the prescribed KS discrepancy
`|T_n-S_n|_(s,1)->0`, then T has A4 with
`c*=12 kappa_3`, `c=24b-12 kappa_1`. **BY** F4.2 and CA-89 89.5, then
89.1(i),(iii); these existing results are not re-proved here. Full two-family
closure still needs mixed brackets (CA-89:113–115). A3 is separate.

**Verdict on F4(a): partial, conditional, not a proof as literally stated.**
If “collar insertions” includes G1–G3 and the cylinder contact comparison,
F4.2 proves the intended reading, and density suffices with no additional
state assumption. The literal citation D2 (19) supplies a plane contour
in correlators; it does not supply G1 or the chart part of G2. This is an
explicit gap in D2 `NOTE.md:695–701` and E4 `NOTE.md:196–204,526–532`, not
a missing faithfulness assumption. No counterexample to a fully realized
D2 C1–C6 geometric system is claimed. An unproved identification is not
promoted to a theorem by adding the word “dense.”

**F4.3 [negative; any; category-free; ->R2].** Wordwise convergence is
strictly weaker than the uniform hypothesis in F4.1.
**ASSUME** `H_r=span(e_0,...,e_r)`, `K_r=I`, `Omega=e_0`, `R_r=|e_r><e_r|`,
with inclusion refinements and probe words spanning finite-support vectors.
**PROVE** every fixed probe pair has eventually zero residual, while
`|R_r|_(s,2)=1`.

`<1>1.` Every fixed finite-support vector is orthogonal to e_r for all
large r. Thus all its residual matrix elements, including heat-collared
ones, eventually vanish. **BY** the displayed rank-one formula.
`<1>2.` The probe vectors arise as A Omega for finite matrix units and
their linear combinations; their union is dense in every graph space,
since K=I. **BY** expansion in the orthonormal e_j basis.
`<1>3.` `R_r e_r=e_r`, so the operator norm is 1 at every r. **BY** the
orthogonal-projection formula. QED **BY** <1>1–<1>3.
This rejects a word-dependent interpretation of the vanishing constants;
it does not contradict D2-L10's already-uniform operator bound.

## 3. The converse is false, even for the prescribed local KS formula

**F4.4 [negative, proven; periodic/full; category-free; ->R2].**
A1, A2 and W2 do not imply vanishing D2-L10 two-loss collar constants.
The following counterexample also satisfies A3 and both unmixed A4 families.
It uses a fixed three-dimensional site space, rather than arbitrary fitted
mode matrices. Its purpose is to falsify a general implication, not to
study a particular category. The categorical instance is listed at the end.

**ASSUME/CONSTRUCT** `N_r=8*2^r`, `a_r=exp(N_r^2)`, and
`lambda_r=a_r^2 N_r^3`. A site has an orthonormal vacancy |0> and an active
two-dimensional space. Write P for the active projection and X,Y,Z for
Pauli matrices extended by zero on the vacancy. Their normalization is
the explicit matrices X=[[0,1],[1,0]], Y=[[0,-i],[i,0]], Z=diag(1,-1)
on the active subspace; multiplication can be checked directly.
On the periodic tensor product H_r set

    k_j=a_r(P_j P_(j+1)+X_j Z_(j+1)),
    h_j=-k_j,  v_r=1,  epsilon_r=b_r=0.                         (F6)

Use exactly (ap)'s KS prescription, both families, and z=exp(2*pi*i/N).
Let U shift one site. Refinement J puts old sites at even fine sites and
vacancies at odd fine sites. The nonphysical regularity control is declared
below; it is not identified with the physical Hamiltonian or its rescaling.

**PROVE** the listed VR-1 hypotheses, but failure of every two-loss collar
bound with a fixed `0<=alpha<1` and constants tending to zero.

`<1>1.` The density is positive, supported on two sites, and the vacancy
vacuum has ground energy zero. **BY** on the active-active block the
density is a_r(I+X tensor Z), with eigenvalues 0 and 2a_r; on the other
occupation blocks it is zero. Each summand is positive, so their sum is
positive and kills the vacuum. Ordinary tensor locality gives disjoint
commutativity. U translates k_j, and U^N=I.

`<1>2.` Construct an exactly transported, translation-invariant K.

`<2>1.` Set K_0=1 on the vacuum and lambda_0 on its orthogonal complement.
At the next scale put `F+=ran J`, `F-=U ran J`. Their intersection is
exactly the vacuum line, and their orthogonal complements to that line
are mutually orthogonal. **BY** their product-basis occupation supports:
only even, respectively only odd, sites can be occupied.

`<2>2.` On F+ transport K_r by J; on F- transport it by UJ; on
`F_perp=(F++F-)^perp` set K_(r+1)=lambda_(r+1) I. The two prescriptions
agree on the common vacuum line. **BY** K_r Omega=Omega and <2>1.

`<2>3.` Then K>=1, min spec K=1 and `K_(r+1)J=JK_r`. Also `[K,U]=0`.
**BY** U exchanges F+ and F-, while `U_f^2 J=J U_r`; the latter and
inductive `[K_r,U_r]=0` give agreement after two shifts. F_perp is invariant.

`<1>3.` Every k_j annihilates F+ and F-, since a nearest-neighbour bond
there always has a vacancy. Its adjoint is itself, so F_perp is invariant.
Currents and modes therefore vanish on F++F- and are supported on the
lambda_r eigenspace of K_r. The same statement holds initially with the
vacuum in place of F++F-. In particular `[K_r,T_(r,n)]=0` for every n.
**BY** <1>1–<1>2 and the polynomial KS formula.

`<1>4.` Derive bounds independent of the enormous coupling a_r.

`<2>1.` Direct multiplication gives
`J_j=i[k_j,k_(j+1)]=-2a_r^2 X_j Y_(j+1) Z_(j+2)`;
P commutes with every extended Pauli matrix. Hence

    ||k_j||<=2a,  ||J_j||<=2a^2,
    sup_n ||T_n|| <= N^2(2a+2a^2)/(4*pi)
                   <= N^2 a^2/pi =: L_N.                        (F7)

**BY** XY=iZ and cyclic permutations, verified by the displayed matrices,
and the triangle inequality. The barred family has the same bound.

`<2>2.` A2 holds for every s with `|T_n|_(s,1)<=L_N/lambda_N<=1/(pi N)`.
For `E_(mn)=[T_m,T_n]-beta_N T_(m+n)` and
`B_(mn)=2|m|+|m+n|`,

    |E_(mn)|_(s,2)
      <= (2L_N^2+B_(mn)L_N)/lambda_N^2
      <= 2/(pi^2 N^2)+B_(mn)/(pi a_N^2 N^4) -> 0.               (F8)

**BY** <1>3, submultiplicativity, and `|d_N(j)|<=|j|`.
This is W2 with z^(r)=0. Replacing beta_N by m-n proves A4 with
`c*=c=0`; the mixed commutator also obeys `2L_N^2/lambda_N^2`.
Every graph order cancels because K is scalar on the supported block.

`<2>3.` `T_(r+1,n)J_r=0`, so the refinement defect is `-J_r T_(r,n)`.
Its `(s,1)` norm is at most `1/(pi N_r)` and is summable over dyadic r.
**BY** <1>2–<1>3 and <2>2. Thus A3 holds as well. All limiting modes are
zero: every fixed coarse vector is killed after one more insertion.

`<1>5.` Nevertheless the subcritical collar estimate fails.

`<2>1.` Restrict to the all-active qubit block, contained in F_perp, so
K=lambda_N I there. For `E=E_(1,-1)`, the coefficient of the Pauli word

    Pword_j=X_j Y_(j+1) Y_(j+2) Y_(j+3) Z_(j+4)

is exactly

    c_N=N^2 a_N^4 sin(4*pi/N)/pi^2.                              (F9)

**BY** only the distance-two current pair produces that five-site word:
`[2a^2 XYZ_j,2a^2 XYZ_(j+2)]=8i a^4 Pword_j`; its Fourier coefficient
is `(N/(4*pi))^2(z^(-2)-z^2)`. All density-current terms have at most
four consecutive sites; the linear subtraction has at most three.
For N>=8 distinct translations of this word do not coincide.

`<2>2.` `||E||` on this block is at least |c_N|. **BY** Pauli
orthogonality: `c_N=2^(-N)Tr(Pword_j E)` and
`|Tr(Pword_j E)|<=2^N||E||`, since Pword_j is unitary. For N>=8,
`sin(4*pi/N)>=8/N`, so `|c_N|>=8Na_N^4/pi^2`.
The sine inequality follows from concavity on [0,pi/2] and its chord.

`<2>3.` Fix s and alpha<1, put p=s+1+alpha, and evaluate any proposed
bound `||K^s E exp(-tK)||<=b_N t^(-p)` at `t=p/lambda_N<=1`.
It forces

    b_N >= p^p exp(-p) |c_N| lambda_N^(-1-alpha)
        >= [8p^p exp(-p)/pi^2]
             exp(2(1-alpha)N^2) N^(-2-3alpha) -> infinity.       (F10)

**BY** <2>1–<2>2 and the scalar value of K on this invariant block.

`<1>6.` QED **BY** <1>1–<1>5. Thus even A1–A4 do not imply the
two-loss collar bound for the assembled residual. Any contour certificate
identifying that same residual by F4.2 and having vanishing *accumulated*
collar constants would contradict (F10). Choosing a different, unrelated
geometric field does not establish an equivalence for the prescribed modes.

The separating hypothesis is **subcritical heat regularity**, not density.
This example does not satisfy a nonzero stress-limit requirement (D2 C6),
uniform collar nuclearity, or a uniform comparison of K with physical
conformal energy. None is an A2 hypothesis. If “admissible” is intended to
include these additional assumptions, that stronger converse remains open;
the stated converse under the VR-1 control convention is false.

## 4. What W2 does imply, and exactly how to repair the converse

**F4.5 [proven; any; category-free; ->R2]. ASSUME** a finite residual R_r
with `q_(r,s)=|R_r|_(s,2)->0`. **PROVE** the following consequences.

`<1>1.` For all vectors u,v,

    |<u,R_r v>| <= q_(r,s) ||K_r^(-s)u|| ||K_r^(s+2)v||.         (F11)

Conversely, (F11) on graph-dense probe spans with one uniform q gives the
operator norm bound. **BY** writing the pairing as
`<K^(-s)u, (K^s R K^(-s-2))K^(s+2)v>` and using the dual norm identity
in F4.1. This is an equivalence with *assembled algebraic matrix elements*,
not with D2's spatially resolved geometric contour identities.

`<1>2.` With p=s+2 and `A_p=(p/e)^p`,

    ||K_r^s R_r exp(-tK_r)|| <= A_p q_(r,s) t^(-s-2), t>0.        (F12)

**BY** factoring the graph-weighted residual and bounding
`||K^p exp(-tK)||<=t^(-p) sup_(x>=0)x^p exp(-x)`; differentiation
puts the maximum at x=p. This is the critical exponent alpha=1, outside
D2-L10's alpha<1 hypothesis. Its uniform integral majorant has a logarithmic
divergence at zero, so it cannot be fed back into that lemma.

`<1>3.` Suppose, additionally, a uniform subcritical estimate is known:

    ||K_r^s R_r exp(-tK_r)|| <= B_s t^(-s-1-alpha0), 0<t<=1,
    0<=alpha0<1,  B_s independent of r.                          (F13)

For every alpha0<alpha<1 put theta=(alpha-alpha0)/(1-alpha0). Then

    ||K_r^s R_r exp(-tK_r)||
      <= (A_p q_(r,s))^theta B_s^(1-theta) t^(-s-1-alpha).        (F14)

The new constants tend to zero. **BY** taking the minimum of (F12),(F13)
and using `min(x,y)<=x^theta y^(1-theta)`. Thus a *uniform* subcritical
heat-regularity hypothesis, followed by a small loss in its exponent,
repairs the analytic converse. F4.4 shows such a hypothesis is substantive.
It still supplies neither G1 nor G2 nor Ward identities for other fields.

`<1>4.` For fixed finite Fourier polynomials f,g, the assembled residual
`sum_(m,n) f_m g_n R_(r,m,n)` has graph norm at most
`sum_(m,n)|f_m g_n|q_(r,m,n,s)->0`.
**BY** the triangle inequality over finitely many fixed labels. This gives
no estimate uniform over growing Fourier support, arbitrary local probes,
or shrinking contours. QED **BY** <1>1–<1>4.

## 5. Fermion calibration: the control and the actual observable matter

This section is the requested instance check, not the proof of the general
construction. **Tags:** chiral family on an antiperiodic circle;
category-free CAR data; finite/analytic `->R2` fragment, not the standard
local periodic/full KS certificate. It uses convention (w), which explicitly
specifies a **source-modified no-wrap** momentum prescription.

The existing backend implements

    A_n e_r = cos^2(eps*n/4) sin(eps*(r-n/2))/eps e_(r-n),
    eps=2*pi/M,  r=-M/2+1/2,...,M/2-1/2,                         (F15)

with transitions outside the window deleted. This is sourced at
`references/text/CFTFromLatticeFermions.txt:3383–3414` and declared in
`CONVENTIONS.md:833–866`; it is not interchangeable with the standard
two-family local density prescription (ap). Write `L_n=:dGamma(A_n):`
in the sea `S=1_(r<0)`. The complex CAR commutator and its Schwinger term
are sourced at the same text `:881–892`. Its central values and finite-core
convergence are already established in the benchmark; they are not new
theorems inferred from these runs (`PROOF.md:78–123,135–139`).

Three controls are kept distinct:

- `Q=sum |r|` over particle/hole excitations: the **conformal excitation
  grading**, exactly transported by sea padding. In the positive check
  below `E_N` means this Q and `K=1+Q`.
- `E_D=sum 2|sin(eps*r/2)|/eps` over excitations: a Dirac-dispersion
  comparator on the **same chiral sea**. The actual two-component finite
  Dirac covariance is different (`PROOF.md:67–74,127–133`). Results using
  this comparator are explicitly labeled a proxy.
- `E_chiral=:dGamma(A_0):=sum |sin(eps*r)|/eps` over excitations:
  the actual modified chiral zero-mode energy. It has low-energy modes
  at the ultraviolet edge; it is not uniformly comparable to Q.

No file in this backend constructs D2 metric derivatives Q_j, geometric
probe contours, their quotient Grams, or the endpoint/chart identifications
G1–G2. Thus F4(c)'s claim that **all hypotheses of (a) hold** remains
unproved. A spectral residual check cannot certify absent geometric data.

**F4.6 [proven diagonal residual bound; same tags]. ASSUME** (F15), even M>=8,
n=1,2,3, complex CAR normal ordering above, and K=1+Q.
Set

    R_(n,-n)=[L_n,L_-n]-2nL_0-(n^3-n)I/12,
    C_n=[A_n,A_-n]-2n A_0,
    delta_n=c_S(A_n,A_-n)-(n^3-n)/12.                            (F16)

**PROVE**, for every integer s>=0,

    |R_(n,-n)|_(s,2) <= U_n(eps):=Cconst_n eps+Bconst_n eps^2,
    Cconst_n=pi*(n+7n^3/24)+(n-1)^2/[pi*(4.5-n)^2],
    Bconst_n=sum_(r=1/2,3/2,...,n-1/2)
                  [(r-n/2)^4/3+n^2(r-n/2)^2/8].               (F17)

Here Bconst_(1,2,3)=(0,7/24,35/12); Cconst is a bound, not a central charge.

`<1>1.` `R=:dGamma(C_n):+delta_n I`, and C_n is diagonal. **BY** the
sourced complex CAR identity (`…Fermions.txt:887–891`) and the opposite
momentum shifts in A_n and A_-n. Consequently R commutes with Q and the
graph order s cancels in its two-loss norm.

`<1>2.` When both intermediate labels lie in the window, direct substitution
of (F15) gives

    C_n(r)=2n sin(eps*r)/eps *
      [cos(eps*r)cos^4(eps*n/4)sinc(eps*n)-1],                  (F18)

where sinc(x)=sin(x)/x, with its continuous value 1 at zero.
**BY** `sin^2(x+y)-sin^2(x-y)=sin(2x)sin(2y)`.
Using `|1-cos x|<=x^2/2`, `1-cos^4 u<=2u^2`, and
`|1-sinc y|<=y^2/6` gives
`|C_n(r)|<=n eps^2 |r|^3+(7n^3/12)eps^2 |r|`.
These inequalities follow by integration of bounded sine/cosine as in
the existing benchmark `PROOF.md:54–58`.

`<1>3.` At a deleted edge transition, its omitted squared coefficient
has magnitude at most `(n-1)^2/4`. **BY** writing the edge midpoint as
`pi/eps+q` with `|q|<=(n-1)/2`, and using `|sin(eps*q)|/eps<=|q|`.
At most one transition is deleted since M>2n. Such an r obeys
`|r|>=pi/eps-n+1/2` and, for eps<=pi/4,
`eps*r^2>=pi*(4.5-n)^2/4` (the expression decreases up to eps=pi/4).
Together with `eps|r|<=pi` and `eps/|r|<=pi/2`, <1>2 gives
`|C_n(r)|<=Cconst_n eps r^2` at every label.

`<1>4.` The finite Schwinger sum involves only the n Fermi-crossing
transitions. The scalar coefficient bound already proved in the backend,
`|a_n(r)-(r-n/2)|<=eps^2(|r-n/2|^3/6+n^2|r-n/2|/16)`, gives
`|delta_n|<=Bconst_n eps^2`. **BY** `|a_n(r)|<=|r-n/2|`, factoring
the difference of squares, and summing the n terms. The continuum finite
sum is `(n^3-n)/12`, as proved in `PROOF.md:96–115`.

`<1>5.` On an occupation vector, `:dGamma(C_n):` is the sum of signed
C_n(r) over its particle/hole excitations. Hence its absolute value is
at most `Cconst_n eps sum_exc r^2 <= Cconst_n eps Q^2`.
**BY** <1>3 and nonnegativity of the excitation energies |r|.
Divide by `(1+Q)^2` and add <1>4. QED **BY** <1>1–<1>5.

**F4.6a [proven one-sided collar bound, diagonal pairs only; same tags].**
Define `H_n=4n+(n-1)^2/2+Bconst_n*pi^2/16` and
`A_p=(p/e)^p`. Then for every integer s>=0 and 0<t<=1,

    ||K^s R_(n,-n) exp(-tK)|| <= b_(M,n,s) t^(-s-3/2),
    b_(M,n,s)=sqrt(A_(s+2) U_n(eps) H_n A_(s+1)) -> 0.           (F19)

`<1>1.` The bracket in (F18) has absolute value at most 2, giving the
interior bound `|C_n(r)|<=4n|r|`. The missing edge term is at most
`(n-1)^2/4<=((n-1)^2/2)|r|`. **BY** |r|>=1/2 and <1>3 above.
`<1>2.` Excitation additivity and <1>4 give `|R|<=H_n(1+Q)` as diagonal
operators. Therefore the uniform heat bound (F13) holds with alpha0=0 and
`B_s=H_n A_(s+1)`. **BY** the same scalar maximum used in F4.5<1>2.
`<1>3.` Apply F4.5<1>3 with alpha=1/2 and the graph bound (F17).
QED **BY** <1>1–<1>3. This supplies an explicit full-Fock
`O(M^(-1/2))` majorant for these spectral collar constants, not a
measurement or proof of geometric contour errors.

**F4.7 [negative, proven; same setting/data; ->R2].** Replacing Q by
E_chiral makes two-loss A4 false even on neutral even probe vectors.
**ASSUME** the same family, n=1. **PROVE**
`liminf_M |R_(1,-1)|_(s,2;K=1+E_chiral)>=1`.

`<1>1.` Take the sea with one particle added at `r+=M/2-1/2` and one
hole at `r-=-r+`. This is a unit vector created by an even, charge-neutral
bilinear. Its excitation energy is `2e_M`, `e_M=sin(eps/2)/eps`.
**BY** the diagonal A_0 formula and the occupation definition.
`<1>2.` On it the residual eigenvalue is
`-2u_M^2-4e_M`, `u_M=cos^2(eps/4)sin(eps)/eps`.
**BY** direct multiplication of the two no-wrap shifts: one outward
transition is absent at each edge. The n=1 Schwinger scalar is exactly zero,
since its single crossing has midpoint zero.
`<1>3.` Both R and K are diagonal, so every graph order gives the lower
bound `(2u_M^2+4e_M)/(1+2e_M)^2 -> (2+2)/4=1`.
QED **BY** <1>1–<1>3 and sin(x)/x->1. This does not contradict the
source's strong convergence on fixed finite-excitation vectors; this
witness moves to the ultraviolet with M (`…Fermions.txt:3482–3498`).

### Measured constants and central coefficients

Raw output: `checks/fermion_results.json` and `checks/fermion_green.txt`.
The full finite-Fock diagonal norm is evaluated by an exact reduction to
additive occupation energies: at each Q, dynamic programming retains the
minimum and maximum residual eigenvalue. This exhausts all occupations
without building the `2^M` matrix. The reduction is exact; the numerical
evaluation is Float64 with tolerance `1e-10`, not interval arithmetic.
It is cross-checked against all 256 occupations at M=8 and an independent
16-by-16 CAR matrix oracle at M=4 (the latter is only an algebra check).

Here q_n denotes `||R_(n,-n)(1+Q)^(-2)||`, independent of s.

| M | q_1 | q_2 | q_3 |
|---:|---:|---:|---:|
| 8 | 0.256415551 | 0.643870968 | 1.671663489 |
| 16 | 0.200672427 | 0.415297147 | 0.691414171 |
| 32 | 0.126704520 | 0.254469349 | 0.385539472 |

The exact finite spectral reduction also evaluates
`b_n=sup_(0<t<=1) t^(3/2)||R_(n,-n)exp(-t(1+Q))||` (s=0, alpha=1/2):

| M | b_1 | b_2 | b_3 |
|---:|---:|---:|---:|
| 8 | 0.194236325 | 0.417315017 | 0.912652729 |
| 16 | 0.188345521 | 0.370461197 | 0.578424211 |
| 32 | 0.155664142 | 0.310567588 | 0.464946694 |

For example, the observed n=1 successive effective exponents
`log_2(value_M/value_(2M))` are (0.354,0.663) for q and (0.044,0.275)
for b. These three sizes do not establish an asymptotic exponent. The
all-M majorants are instead proved in (F17),(F19). Constants for s=1,2,
including their analytic envelopes, are retained in the JSON.

Non-diagonal checks retain **all generated output vectors** but restrict
input to all Q<=4 occupations. For (-2,-1), M=32, there are 34 input and
118 output vectors, 84 above the input cutoff. At s=0 the measured graph
norm is 0.090016762, its explicit Schur/Frobenius upper bound 0.090551737,
and its collar upper constant 0.277207086 (alpha=1/2). These are restricted
input statements, not full-Fock estimates. The code retains seven tested
pairs and both Q and the explicitly labeled E_D proxy.

The central check uses vacuum Schwinger scalars `a_n=c_S(A_n,A_-n)`,
not the vanishing graph residual or a fitted geometric Ward contact.
Since a_1=0 exactly, the two-mode ledger estimator is
`c*_M=2(a_2-2a_1)=2a_2`, `c_M=2a_2-16a_1=2a_2` (CA-89 89.1(iii)).
At finite M this estimator need not fit a_3; the last column exposes that.

| M | c*_M=c_M from n=1,2 | a_3/2, independent cubic check |
|---:|---:|---:|
| 8 | 0.691864319 | 0.387414408 |
| 16 | 0.913497637 | 0.796340847 |
| 32 | 0.977730303 | 0.945163299 |

Their limit is **c*=c=1**, by the finite Fermi-crossing sum already proved
in `backend/PROOF.md:96–115`, matching the sourced complex chiral value
(`…Fermions.txt:2813–2823`). With the *self-dual* prescription the Schwinger
term is half as large (`:892`), giving the sourced c*=c=1/2 (`:2887–2891`);
no Majorana full-Fock graph norm is inferred from the complex calculation.
These are spectral cocycle checks. They do **not** measure kappa_1 or
kappa_3 of a constructed lattice Ward contour.

For comparison the neutral even E_chiral lower witness of F4.7 is
0.884688840, 0.968737003, 0.992022778 at M=8,16,32, tending to 1.
Thus “K=1+E_N” must name which energy; Q is the conformal control used
for the positive bounds here.

## 6. First categorical input and reproducibility

**F4.8 [existing compiler applied; any locally, periodic/full after declared
closure; L0; ->R2].** For arbitrary unitary fusion C and pointed site O,
choose a complete dagger-stable basis `{D_alpha}` of `End_C(O tensor O)`
and `h=sum c_alpha D_alpha=h^dagger`. The geometric stress matching would
have to produce the (ap) density

    k_j-epsilon_N-J_j
      = -sum_alpha (c_alpha/v_N) D_alpha^(j)-epsilon_N I
        -(i/v_N^2)sum_(alpha,beta)c_alpha c_beta
                         [D_alpha^(j),D_beta^(j+1)].             (F20)

**BY** CA-79:65–70, with its fixed physical sign; not a new KS recipe.
The categorical input first enters the tile matrices, their positive
Grams, associator recoupling on overlapping sites, and categorical
evaluation of sewn diagrams (CA-78 78.1–78.2).

In (ak)'s dictionary, (F20) uses every nonzero coefficient of the vacancy
projectors, hops, cups/caps, cup-cap tile, and available split/merge vertex
tiles. In general one must also retain all charge/multiplicity matrix
units: a nine- or thirteen-tile special case is not a complete basis for
arbitrary C. There is no distinguished subset that alone implies a Ward
identity. The energy insertion is linear in c; its adjacent-current
response is quadratic in c. Exact finite gates use CA-78's gate ODE,
not merely first-order tile weights.

To reach the Ward statement one must additionally supply metric-dependent
gate families with these energy/current derivatives, a positive boundary
state and quotient, coordinate/port transports, and G1–G3. Fusion supplies
neither these choices nor their estimates. No braiding is used in the
local compiler; periodic closure/translation is additional data and may
require the relative half-braiding indicated in CA-89:19–21. Enriched
central-charge or target data enter only if a specific conformal theory
is requested. None of F4.1–F4.5 depends on C.

Reproduce from the repository root (each run took seconds, with sizes at
most the existing benchmark's M=32; no many-body diagonalization):

```bash
PYTHONDONTWRITEBYTECODE=1 OPENBLAS_NUM_THREADS=1 python3 explorations/2026-10-25-astra-r3/F4-ward-to-residual/checks/fermion_check.py
PYTHONDONTWRITEBYTECODE=1 OPENBLAS_NUM_THREADS=1 python3 explorations/2026-10-25-astra-r3/F4-ward-to-residual/checks/ks_converse_check.py
PYTHONDONTWRITEBYTECODE=1 OPENBLAS_NUM_THREADS=1 python3 explorations/2026-10-25-astra-r3/F4-ward-to-residual/checks/reviewer_qutrit.py
```

Acceptance: all three commands were independently rerun by the primary
agent and exited 0. `fermion_check.py --mutate-wrap` rejects an ultraviolet
wrap through the independent Fermi-surface invariant;
`--mutate-collar` rejects a collar constant divided by 1000;
`ks_converse_check.py --mutate-current` rejects the wrong current factor
at the five-site coefficient. Raw failure/restored outputs and source
SHA256 records are in `checks/`. The wrong-current mutation is a real
regression in the quantity detecting F4(b)'s failure. One early check run
hit a NumPy-integer JSON serialization error after its mathematical checks;
the explicit integer conversion fixed it, and the initial output is kept.

A GPT-6.1 xhigh collaborator supplied an independent analytic audit and
the converse checks; a second such collaborator supplied the CAR checks.
A separate skeptical GPT-6.1 xhigh reviewer found no substantive blocker
and independently checked the qutrit coefficient, control transport, and
fermion bounds (`checks/reviewer_qutrit_green.txt`). The primary agent
checked the cited local sources and reran the checks. No theorem here is
claimed machine-formalized. Repository-wide report/Julia gates, worklog,
convention-file edits, and commits were omitted as explicitly requested.

## Results ledger

- F4(a), literal implication from the stated hypotheses — **conditional**;
  geometric assumptions G1–G2 remain unverified.
- Uniform probe-form completion and two-loss estimate — **proven**, F4.1.
- Sewn-contour/equal-time-product identification — **conditional** (G1);
  the finite-sweep implication F4.2 is **proven**.
- Contact identification and transfer to standard KS — **conditional**,
  F4.2a; requires G2, A2, and the prescribed KS discrepancy.
- Wordwise probe convergence does not imply W2 — **negative**, F4.3.
- F4(b), proposed equivalence under A2 — **negative**, F4.4; even A1–A4
  do not imply the stated subcritical collar estimate.
- Strongest one-sided converse — **proven**, F4.5: uniform weak assembled
  bounds, critical heat exponent, and subcritical interpolation given (F13).
- F4(c), geometric hypotheses for the full standard-KS system — **conditional**;
  backend supplies no G1–G2 or all-probe Ward identity.
- Conformal-Q diagonal full-Fock residual and collar bounds — **proven**,
  F4.6–F4.6a (n=1,2,3 only); finite numbers checked in `checks/`.
- Chiral-energy substitution — **negative**, F4.7: even neutral UV witness
  prevents two-loss A4, with limiting lower bound 1.
- First categorical input to a Ward identity — **proven compiler
  identification**, F4.8, by CA-78/79; existence of the Ward certificate
  remains **conjectural** for a general declared categorical density.

## Layer tags

| Statement | Setting | Data layer | Rung reached | Rung claimed |
|---|---|---|---|---|
| F4.1, F4.3, F4.5 | Any | Category-free | Finite analytic implication/obstruction, ->R2 | No higher rung |
| F4.2, F4.2a | Periodic/full, per family | Category-free plus G1–G3; A2 and matching for KS | Conditional W2/A4, ->R2 | R2 only with remaining VR-1 and mixed hypotheses |
| F4.4 | Periodic/full | Category-free analytic counterexample | Explicit A1–A4 with zero-mode representation (trivial R2); negative converse | No nontrivial conformal theory |
| F4.6–F4.7 | Source-modified chiral CAR on AP circle | Category-free declared representation/control | Diagonal analytic bounds, finite checks, ->R2 | No full Ward or standard-KS certificate |
| F4.8 | Any locally; full after closure | L0 plus declared h, metric/state data; periodic transport additional | Existing tile compiler feeding ->R2 | No selected h, R3, R4, or R5 |

No assertion obtains L1/L2 information from fusion data, or identifies an
R4 target from a Virasoro cocycle. A limiting theory's existence, conformity,
and fidelity remain distinct rungs on the same state/refinement system.

## What this gives the integration

The CA-88 R2 certificate column **cannot yet be changed** to “W2 proved
[conditional only on the contour identity].” It can record the precise
addition: **“uniform probe-form lifting proved (F4.1–F4.2), conditional on
contour/product realization and cylinder contact comparison; converse to
subcritical collars false (F4.4).”** CA-89's original transfer theorem stays
conditional. The geometric gap G1–G2 is not discharged by density.

The conformal-Q fermion diagonal calibration now has explicit full-Fock
residual and collar bounds; this strengthens a diagnostic ingredient,
not the arbitrary-category R2 cell. The counterexample reaches only a
trivial mode representation. No R1 state-construction, nontrivial R2
certificate, R3 local theory, R4 fidelity, or R5 functorial cell moves.

## Open problems

1. **Endpoint realization lemma:** for the *same* positive quotient and
   actual tile gates, show that a specified contour sweep has endpoint
   diagrams representing both ordered equal-time products, with its
   accumulated collar error satisfying (F4). This is G1, not mere density.
2. **Chart/contact lemma:** transfer D2's plane identity (19) to (ar)'s
   cylinder discretization with the correct zero-mode origin, port
   transports and all Fourier/quadrature errors uniformly bounded as in
   G2–G3. Formal CA-89 89.8 does not provide this estimate.
3. **Standard-KS fermion comparison:** construct geometric metric
   insertions for the actual local two-family lattice model and prove
   their discrepancy from prescribed KS modes; the no-wrap projected
   chiral family is an informative calibration, not this construction.
4. **All-bracket calibration:** extend the proved full-Fock diagonal
   residual/collar estimates to arbitrary fixed (m,n), both chiralities
   and mixed brackets, with declared compatible control. The finite
   cutoff checks are not that lemma.
5. **Strengthened converse:** determine whether fixed physical-energy
   comparison, a nonzero stress limit, and uniform subcritical heat
   regularity plus geometric reconstruction give a useful converse.
   F4.5 settles only the analytic interpolation step once supplied.
6. **Categorical synthesis:** for a general unitary fusion/modular C,
   select h and geometric/state data satisfying these lemmas; neither
   bare fusion nor modular data alone has been shown to provide them.

## Examples table

| Instance | General statement tested | Outcome |
|---|---|---|
| Any unitary fusion/modular C with a declared periodic realization | F4.1–F4.2, F4.8 | Analytic implication category-free; geometric hypotheses unsynthesized |
| Vec, pointed site O=1 direct-sum C^2, density (F6) | Converse under the standard local KS prescription | F4.4: A1–A4 hold, subcritical collar constants diverge |
| Complex chiral no-wrap fermion backend, K=1+Q | Diagonal spectral residual/collar implication | F4.6–F4.6a; c*=c=1; geometric Ward hypotheses unverified |
| Same backend, K=1+E_chiral | Sensitivity to a control change | F4.7: neutral even UV witness prevents A4 |
| Self-dual specialization of that source | Central normalization only | Half Schwinger cocycle, sourced c*=c=1/2; no new full-Fock norm claim |

## Sources used

- `report/sections/89_ward_ks_transfer.tex:51–61,122–142,187–231`.
- `report/sections/78_categorical_selection_equations.tex:218–253`.
- `explorations/2026-10-22-astra/D2-selection-principle/NOTE.md:549–594,639–701`.
- `explorations/2026-10-22-astra-r2/E4-ward-to-ks-transfer/INTEGRATION.md:79–136`.
- `explorations/2026-10-22-astra-r2/E4-ward-to-ks-transfer/REVIEW.md:8–36,226–240`.
- `explorations/2026-10-22-astra-r2/E4-ward-to-ks-transfer/NOTE.md:90–131,196–204,369–410,526–547`.
- `report/sections/79_ks_shell_and_refinement_defect.tex:51–107,116–138` — prescribed modes, control/energy distinction, alternative shell theorem.
- `report/sections/81_cft_machine_oar_contract.tex:95–120`; `cft_machine/research/virasoro_routes.md:55–80,151–192` — VR-1 scope and VR-2.
- `report/sections/88_layered_targets.tex:98–125,148,179–188` — integration cell and layer ladder.
- `CONVENTIONS.md:801–810,830–866,1397–1429,1483–1550` — graph norms, benchmark, tiles, KS/layer/Ward conventions.
- `references/lattice-symmetry/GransSamuelssonEtAl2020/source/Linnea11.5.tex:791–820,3191–3198,3220–3229` — source KS normalization and two central constants (source's limit claim is conjectural).
- `references/lattice-symmetry/KooSaleur1993/source/9312156.tex:1095–1108` — intermediate-state caveat.
- `references/cft/Schottenloher2008/Schottenloher2008.md:2507–2517,2552–2589,2610–2634,5069–5087` — continuum cocycle and formal OPE, not a lattice chart theorem.
- `references/lattice-symmetry/ChelkakGlazmanSmirnov2016/source/StressTensor.tex:527–532` — scope check only; no imported all-model stress-convergence claim.
- `references/text/CFTFromLatticeFermions.txt:881–892,2813–2823,2887–2897,3383–3414,3482–3498` — CAR cocycle, central values, modified approximants, fixed-core theorem.
- `references/cft-machine/fermion/SOURCES.md:1–40`, `references/cft/SOURCES.md:9–31`, `references/lattice-symmetry/SOURCES.md:9–38,966–997,1732–1757` — local provenance checked; no acquisition.
- `cft_machine/benchmarks/fermion/PROOF.md:12–17,50–74,78–142`; `cft_machine/benchmarks/fermion/runs/2026-09-22/results.toml` — existing derivations and oracle run.
- `checks/fermion_core.py:18–37,44–86,110–157`; `checks/fermion_check.py:23–86`; `checks/fermion_collar.py:1–58`; `checks/fermion_results.json` — local derivations, invariant checks and raw values (relative to this note).
- `checks/ks_converse_check.py`, `checks/ks_converse_results.json`, `checks/ks_converse_manifest.json`, `checks/reviewer_qutrit.py` — independent finite checks of F4.4; exact raw filenames inventoried in `checks/`.
