# Whole-carrier quadratic certificate (calibration and reusable lemma)

**Pillar P4.** General analytic input first; complex CAR below is an instance,
not a category-to-CFT construction. Setting: any for Lemma Q; one chiral
family on the AP circle for the calibration. Data: category-free quadratic
carrier/energy data. Conclusion: VR-1 A1--A4, with nonzero stress; no locality,
net, sector, or categorical fidelity theorem. This directory's local
conventions are authorized by `../NOTE.md`, “Local conventions”.

## Local declarations and evidence

Write `Q=1+E`, `K=Q^p`, real `p>=1`, and graph order `s>=0` integer.
`E=sum_exc |r|` is the **linear excitation energy**, not the finite sine
zero mode and not the Dirac Hamiltonian. Half-integer labels and no-wrap
coefficients retain root conventions (w). Physical CAR operators are `c_r`;
normal ordering is relative to `S=1_(r<0)`. The finite state carrier is the
full particle/hole excitation Fock space, with all occupation sectors.
Mode index n is an ordinary integer, never reduced modulo M; at the finitely
many scales where no edge exists, its no-wrap matrix is zero.
Refinement inserts excitation vacuum on the additional labels. All norms
below are operator norms on that full carrier, never fixed-core norms.

Precise local ground truth (`references/text/CFTFromLatticeFermions.txt`):
`:739--755` (quasi-free state and sea GNS), `:798--810` (quadratic action),
`:848--855` (particle/hole normal ordering), `:881--892` (subtraction,
cocycle and commutator), `:1845--1878` (cutoff CAR refinement),
`:2794--2823` (NS chiral factor and c=1), `:3379--3418` (modified no-wrap
mode). The estimates below are local derivations from these formulas.
VR-1 itself: `cft_machine/research/virasoro_routes.md:55--194`.
The previous fixed-core limitation is explicitly recorded at
`cft_machine/reviews/virasoro_referee.md:155--161` and CA-95:222--226.

## Lemma Q: full-carrier quadratic bound

**ASSUME** a finite symmetric half-integer window, its sea representation,
and a quadratic `D=Q_S(C)` whose one-particle matrix is the no-wrap shift
`C e_r=d(r)e_(r-k)`, with `|d(r)|<=H(1+|r|)^q`, `q>=1`, fixed integer k.
Here `Q_S(C)=sum d(r):c*_(r-k)c_r:`. Missing edges have coefficient zero.
The same statement holds on finite-excitation vectors in the infinite
window when the displayed coefficient bound holds there.

**PROVE** for `t>=0`

`||Q^t D Q^(-t-q)|| <= H B(q,k,t)`,

where `F(q,k)=(1+|k|)^q(3^q+|k|)` and
`B(q,k,t)=F(q,k)(1+|k|)^(t+q)`.

<1>1. Every nonzero matrix element changes E by exactly `-k`.
  <2>1. In physical occupation coordinates,
  `E=sum_r r c*_r c_r - sum_(r<0) r`.
  <2>2. A move `r -> r-k` therefore changes E by `-k`.
  The subtraction in normal ordering is scalar and only occurs for k=0.
  <2>3. Thus `[E,D]=-kD`, including particle/hole pair terms.

<1>2. The absolute sum of any occupation-basis column with energy e is
at most `H F(q,k)(1+e)^q`.
  <2>1. For a positive-to-positive move the input must be a particle.
  For a negative-to-negative move the output must be a hole.
  Each charged label is used at most once in each of these disjoint lists.
  <2>2. For any nonzero half-integer r, `1+|r|<=3|r|`.
  For a hole at output r-k also use
  `1+|r|<=(1+|k|)(1+|r-k|)`.
  Since q>=1, `sum_exc |r|^q <= (sum_exc |r|)^q=e^q`.
  <2>3. The at most |k| sign-crossing moves have `|r|<=|k|`.
  Their absolute sum is at most `H |k|(1+|k|)^q`.
  For k=0 the one diagonal matrix element is bounded by the same-sign
  particle/hole sum after subtraction of the filled sea.
  <2>4. Triangle inequality proves the claim; Pauli blocking only deletes
  terms, and CAR signs cannot increase the bound.

<1>3. The adjoint shift has coefficient `conj(d(r+k))`, hence bound
`H(1+|k|)^q(1+|r|)^q`. Thus <1>2 also controls every absolute row sum.

<1>4. Set `Y=Q^t D Q^(-t-q)`.
  <2>1. For a column, Qout/Qin <=1+|k| BY <1>1. Its absolute sum
  is at most `H F(q,k)(1+|k|)^t` BY <1>2.
  <2>2. For a row, apply <1>3 and the same ratio bound. Its absolute
  sum is at most `H F(q,k)(1+|k|)^(t+2q)`.
  <2>3. For a matrix with absolute column sums <=u and row sums <=v,
  Cauchy--Schwarz gives `||Yx||^2<=uv||x||^2`: apply weighted
  Cauchy--Schwarz in each row, then sum columns. This also proves the
  infinite version on finite support, followed by completion.
  <2>4. The square root of these bounds is the asserted constant.
<1>5. QED BY <1>1--<1>4. No multiplicity or dimension bound was used.
Unchanged spectator Fock factors are allowed with the total excitation
energy: the active-energy sum in <1>2 is bounded by total E, and <1>1
retains the same energy shift. The constants do not change.

## Calibration: global coefficients, including omitted edges

Let `M_N=2^N M_0`, even `M_0>=4`, `epsilon=2pi/M`,
`Gamma_M={-M/2+1/2,...,M/2-1/2}`. On all half-integers define

`f_n^M(r)=1_Gamma(r)1_Gamma(r-n) cos²(epsilon n/4)
           sin(epsilon(r-n/2))/epsilon`, `b_n(r)=r-n/2`.

Put `w(r)=1+|r|`, `g_n=1+|n|/2` and
`d_n=g_n^3/6+n²g_n/16+g_n`.

**PROVE** if `M>=4(|n|+1)` then

`|f_n^M|,|b_n|<=g_n w`,
`|f_n^M-b_n|<=d_n epsilon² w³`, and for `0<=alpha<=2`,
`|f_n^M-b_n|<=h_(n,alpha) epsilon^alpha w^(1+alpha)`,
`h_(n,alpha)=(2g_n)^(1-alpha/2)d_n^(alpha/2)`.

<1>1. On an allowed edge the integral Taylor inequalities
`|sin x-x|<=|x|³/6`, `sin²u<=u²`, give
`|f-b|<=epsilon²(|r-n/2|³/6+n²|r-n/2|/16)`.
Also `|f|<=|r-n/2|<=g_n w`.
<1>2. If either window indicator vanishes, then `|r|>=M/4` at the
stated M threshold. Consequently `epsilon² w²>=pi²/4>1`.
Thus `|f-b|=|b|<=g_n w<=g_n epsilon²w³`.
This is the missing-edge estimate; a safe fixed core is not substituted.
<1>3. Interpolate `|f-b|<=min(2g_n w,d_n epsilon²w³)` using
`min(x,y)<=x^(1-alpha/2)y^(alpha/2)`.
<1>4. QED BY <1>1--<1>3.

## A1--A3 and the sharp exponent threshold

**ASSUME** `H_M=F_a(ell²(Gamma_M))` in the sea excitation realization,
`T_(M,n)=Q_S(A_n^M)`, `J_M=F_a(j_M)` for zero-padding excitation
isometry j_M, `E_M=sum_exc|r|`, `K_M=(1+E_M)^p`.

**PROVE** A1 and A2 hold for p>=1. A3 holds for every p>1, with
`e_(N,n,s)<=C_(n,p,s)epsilon_(M_N)^alpha`,
`alpha=min(p-1,2)>0`, after finitely many initial scales.
The smallest admissible integer p is 2; p=3 gives a faster certificate.

<1>1. Refinement is isometric, composes, and preserves every excitation
label and its energy. Hence `E_(2M)J=JE_M`, giving A1 for every p.
The CAR algebra map is unital on generators (source :1855--1857);
it is not the many-body corner map `a -> JaJ*`.
<1>2. Source coefficients obey `f_n(r)=f_-n(r-n)` on reversed edges.
Hence `T_n*=T_-n`. Lemma Q with q=1, H=g_n, t=ps gives A2 since
`Q^(-ps-p)=Q^(-ps-1)Q^(1-p)` and the final factor is contractive.
<1>3. On embedded coarse vectors the refinement defect is precisely
`Q_S(A_n^(2M)-A_n^M)J`, using zero-extended matrices on the fine window.
  <2>1. Outside coarse labels, the coarse quadratic vanishes on the
  excitation vacuum. New negative physical modes remain filled, as
  required by the sea representation; this is not empty-sea padding.
  <2>2. Apply the global coefficient estimate at M and 2M. The difference
  has coefficient <=`h_(n,alpha)(1+2^-alpha)epsilon_M^alpha w^(1+alpha)`.
  <2>3. Lemma Q with q=1+alpha<=p and t=ps gives the claimed e bound
  on every coarse vector. Dyadic spacings make its sum finite.
  <2>4. For each fixed n there are only finitely many smaller scales.
  At those scales use the crude global difference bound `2g_n w` and
  Lemma Q with q=1: `e_N=2g_n B(1,n,ps)` suffices. Thus all-scale
  errors are explicit; no uniformity over n is claimed by VR-1.
<1>4. p=1 fails A3 already for n=0 on one positive particle.
  <2>1. Choose `r_M=M/4-1/2` (M divisible by 4). The adjacent scalar
  difference, divided by `1+r_M`, tends to
  `2(sqrt(2)-1)/pi >0`.
  <2>2. This follows by substituting `epsilon_M r_M -> pi/2` into
  `(2 sin(epsilon_M r_M/2)-sin(epsilon_M r_M)) /
  (epsilon_M(1+r_M))`. Since n=0, all graph-order factors cancel.
  <2>3. Thus every valid A3 error has positive liminf. p<1 also fails
  uniform A2, since `|f_0^M(r_M)|/(1+r_M)^p` diverges.
<1>5. QED BY <1>1--<1>4. This moving UV vector is an all-carrier test.

The distinction between summability and the second-order Taylor rate is
sharp. The same n=0 vector has one-loss defect asymptotic to a positive
constant `4^p(sqrt(2)-1)/(2pi)` times `M^(1-p)`. Thus p<3 cannot provide an O(epsilon²) A3
certificate, although every p>1 gives summability. A fixed low positive
label r has `(f_0^(2M)(r)-f_0^M(r))/epsilon_M² -> r³/8`:
use `sin x-x=-integral_0^x(x-t)sin(t)dt`, divide by x³ and rescale
t=xu to obtain limit -1/6. Hence increasing p beyond 3 does not improve
the all-vector rate beyond second order for this scheme.

## A4: all brackets, including the cocycle

**PROVE** for p>=2 and every fixed m,n,s,
`||K_M^s R_(M,m,n)K_M^(-s-2)||<=C_(m,n,p,s)epsilon_M²`
eventually, with both central ledger coefficients equal to 1.

<1>1. Set `delta_n=A_n^M-B_n` on the infinite one-particle space.
The polynomial coefficient identity gives
`[B_m,B_n]=(m-n)B_(m+n)` on finite support (benchmark PROOF.md:40--45).
Therefore `C_M=[A_m,A_n]-(m-n)A_(m+n)` equals

`delta_m A_n+B_m delta_n-delta_n A_m-B_n delta_m
 -(m-n)delta_(m+n)`.

<1>2. Each term is a shift by k=m+n. The global cubic delta estimate
and linear coefficient bound imply `|C_M(r)|<=H_mn epsilon² w(r)^4`,
where an explicit choice is

`H_mn=d_m(1+|n|)^3 g_n +g_m(1+|n|)d_n
      +d_n(1+|m|)^3 g_m +g_n(1+|m|)d_m +|m-n|d_(m+n)`.

Every intermediate cutoff/window edge is covered because the deltas were
estimated globally. Apply Lemma Q with q=4, t=ps, and `2p>=4`:
the normal-ordered part has norm <=`H_mn B(4,m+n,ps)epsilon²`.

<1>3. Source Eq. (28), :891, identifies the remaining scalar as
`c_S(A_m,A_n)-delta_(m+n,0)(m³-m)/12`.
  <2>1. If m+n!=0 both traces vanish, because the product shifts momentum.
  <2>2. If n=-m and m>0, for large M the cocycle is the finite sum
  `sum_(j=0)^(m-1) f_-m^M(j+1/2-m)^2`.
  The continuum sum is `sum_(j=0)^(m-1)(j+(1-m)/2)^2=(m³-m)/12`;
  expand the square and use the integer sum/square-sum identities.
  <2>3. The same coefficient bound and `|x²-y²|<=|x-y|(|x|+|y|)`
  bound its error by epsilon² times
  `Z_m=2|m|d_m g_m(1+|m|)^4`. Negative m follows by antisymmetry;
  m=0 is zero. A scalar has graph two-loss norm at most its absolute value.
<1>4. QED BY <1>1--<1>3, taking
`C=H_mn B(4,m+n,ps)+delta_(m+n,0)Z_m`.

At the finitely many smaller scales use the all-scale A2 constants
`C_(n,s)=g_n B(1,n,ps)` to set
`q_N=C_(m,s)C_(n,s+1)+C_(n,s)C_(m,s+1)
      +|m-n|C_(m+n,s)+|z_mn|`.
This bounds the two products, the linear term, and the scalar with two
graph losses; it completes an explicit all-scale A4 certificate.

**Real p extension. ASSUME** p>1, alpha=min(2,2p-2), q=2+alpha<=2p.
**PROVE** the same argument gives an explicit rate epsilon^alpha.

<1>1. Use the interpolated delta bound with `h_(n,alpha)` in the identity
above. The coefficient of the shift by m+n has bound
`H_(mn,alpha)epsilon^alpha w^q`, where

`H_(mn,alpha)=h_(m,alpha)(1+|n|)^(1+alpha)g_n
 +g_m(1+|n|)h_(n,alpha)
 +h_(n,alpha)(1+|m|)^(1+alpha)g_m
 +g_n(1+|m|)h_(m,alpha)+|m-n|h_(m+n,alpha)`.

<1>2. Lemma Q bounds the normal-ordered residual by
`H_(mn,alpha) B(q,m+n,ps)epsilon^alpha` after two graph losses.
The finite crossing square argument bounds the scalar by epsilon^alpha
times `Z_(m,alpha)=2|m|h_(m,alpha)g_m(1+|m|)^q`.
<1>3. QED with
`q_N=[H_(mn,alpha)B(q,m+n,ps)+delta_(m+n,0)Z_(m,alpha)]epsilon^alpha`
eventually, and the preceding finite-scale bound otherwise.
Thus A1--A4 hold for every real p>1.
For integer p=2, A3 is O(epsilon), A4 O(epsilon²); for p=3 both
are O(epsilon²). These constants are deliberately loose.

## Nonzero calibration and the representation boundary

`T_-2 Omega` is a superposition of two one-particle/one-hole configurations, with coefficients
`+/- cos²(epsilon/2)sin(epsilon/2)/epsilon`. Their common normalized
direction w is independent of M>=4 and has E=2. Therefore
`<w,T_-2 Omega>=sqrt(2)cos²(epsilon/2)sin(epsilon/2)/epsilon ->1/sqrt(2)`.
This supplies a fixed coarse-vector non-collapse witness, with phases of w
chosen by the displayed normal-ordered quadratic. No UV-moving witness is
used for this conclusion.

**Diagonal witness. ASSUME** `v=(Omega+w)/sqrt(2)` and `W_M=T_(M,-2)K_M^-1`.
**PROVE** `<v,W_M v> >= 1/(2sqrt(2)pi)` at every M>=4.

<1>1. `E Omega=0`, `Ew=2`, and `T_-2 w` has energy 4 by exact energy shift.
Consequently `<v,T_-2 Q^-p v>=b_M/2`, where
`b_M=sqrt(2)cos²(epsilon/2)sin(epsilon/2)/epsilon`.
<1>2. For M>=4, `0<epsilon/2<=pi/4`, so `cos²(epsilon/2)>=1/2`.
Concavity of sine on [0,pi/2] (its second derivative is nonpositive)
puts it above its endpoint chord: `sin x>=2x/pi`.
Hence `b_M>=1/(sqrt(2)pi)`.
<1>3. QED BY <1>1--<1>2. Both w and v lie at the fixed coarse scale M=4.

This one-chiral Hilbert tower is the GNS tower of the *limiting* compatible
sea restrictions. It is not the tower of finite Dirac vacuum vectors.
WS-1 uses the same sharp-momentum CAR maps on two spinor components;
its limiting covariance is `(I-sign(r)sigma_y)/2`. A fixed spinor unitary
diagonalizing sigma_y identifies that limit with two complementary sea
representations, and the displayed chiral system is one factor. The full
same-system statement needs the corresponding explicit two-component
carrier and diagonalized mode embedding; the parent NOTE supplies that
identification. Sharp momentum refinement is spatially nonlocal
(source :1892--1894). This certificate does not certify standard local KS,
a categorical local tower, or R3 by replacing these maps.
