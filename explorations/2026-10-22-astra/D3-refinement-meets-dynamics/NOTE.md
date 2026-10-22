# D3 — Refinement meets dynamics: local polar dressing and quantitative vacuum repair

**Status (2026-10-22):** one conjecture; proved finite-dimensional reductions and
conditional all-scale drift theorems; no general categorical critical vacuum,
local OAR compiler, or CFT constructed. New proofs are structured mathematical
proofs, not proof-assistant proofs. All results concern general categorical input.

## Headline conjecture

**D3-C — Uniform local polar refinement, without a spectral-gap hypothesis.**
The proposed mechanism is to extract a local isometric refinement from a short
Euclidean history strip by taking its polar part. The substantial claim is
uniform locality of that polar part on the *entire coarse carrier*, including
critical low energies, rather than existence of a finite-dimensional polar map.

For this statement declare the following conventions: open ordered chains;
`H=sum_Z h_Z` with Hermitian densities; positive imaginary time `exp(-tH)`;
operator norms on the faithful direct sum of categorical charge carriers.
These extend root conventions (h),(r),(t); further conventions appear below.

**ASSUME** a computably presented unitary fusion category C, a finite object
`O=1⊕X` with a chosen isometric unit inclusion, and the CA-71 dyadic placement
`V_L:O^⊗L -> O^⊗2L`. The associators and dagger follow root (b),(r).
For each L give a Hermitian categorical interaction on the open fine chain,

    H_L = sum_Z h_(L,Z),    diam(Z)<=R,
    sup_x sum_(Z containing x) ||h_(L,Z)|| <= J,    J>0.

Here supports are intervals, R and J are independent of L, and all coefficients
are computable. No translation invariance, ground-state uniqueness, or gap is
assumed. Define, at finite L,

    T_L(t)=exp(-t H_L)V_L,
    G_L(t)=V_L* exp(-2t H_L)V_L,
    W_L(t)=T_L(t)G_L(t)^(-1/2).                         (C.1)

**CONJECTURE:** there are computable `t_0>0, μ>0, C_0,D_0<infinity`, depending
only on `(C,O,R,J)`, with the following properties, uniformly in L and
`0<=t<=t_0`:

1. `W_L(t)=U_L(t)V_L`, where `U_L(0)=1`, `dot U_L=A_L(t)U_L`, and
   `A_L(t)=sum_I a_(L,I)(t)` is anti-Hermitian, charge preserving, and satisfies

       sup_x sum_(I containing x) |I| exp(μ diam I)||a_(L,I)(t)|| <= C_0 J.

2. The compressed interaction `W_L(t)*H_L W_L(t)` has an interval decomposition
   on the coarse chain with the same kind of exponential bound, with possibly
   different computable constants independent of L. Scalar terms are retained
   in a declared local decomposition; no global energy subtraction is hidden.
3. The decompositions are effectively approximable with certified tails. For
   `0<epsilon<1/2`, U_L(t) has a charge-preserving circuit approximant of depth
   at most D_0, with gates on intervals of length at most
   `min(2L,ceil(C_0 log((2L+1)/epsilon)))`, and operator-norm error at most epsilon.
   Constants may be enlarged uniformly to cover the small-volume cases.

This is a theorem-grade **gap-independent local synthesis conjecture**, not an
assumption of Wilson drift in different notation. Its inputs are finite tiles
and the categorical vacuum inclusion; its outputs are a canonical isometry,
local unitary implementation, effective interactions, and quantitative circuits.
It deliberately permits growing gate range for increasing accuracy. It does
not assert an exact circuit of uniformly bounded depth *and* gate range.

**What is proved toward it:** (C.1) is isometric at every finite volume; its
first derivative admits an exactly local, charge-preserving generator; its
compressed energy has an explicit negative-semidefinite first derivative
(D3-5). These statements hold without a gap. Uniform all-orders locality,
effective tails, and the circuit assertion remain conjectural. Finite-volume
analyticity alone proves none of these uniform assertions.

**Exact gap to the programme:** even D3-C would not select the couplings or
make `W_n Omega_n` a fine vacuum. D3-3/D3-4 below identify the additional
energy/residual and indistinguishability certificates that would turn its
dressings into WT-1 inputs. A local unital observable lift is a further,
independent categorical requirement. No existence of these data for every C
is smuggled into D3-C. This narrower synthesis problem is the headline.

## Conventions proposed

All new conventions are confined to this note, as requested. Root conventions
(u),(x),(ac)–(af) remain in force; no root file is modified.

- `n>=0` is scale, `N_n=2^n N_0`, and `a_n=2^-n` is dimensionless relative
  spacing. Physical length and the reference spacing must be supplied in an
  application. Endpoints are specified; translation-invariant *bulk* densities
  are imposed only when declared. No periodic fusion identification is inferred.
- `A_n=End_C(O^⊗N_n)`, faithfully represented on
  `H_n=⊕_c Hom_C(c,O^⊗N_n)`. Densities are ordinary block density matrices,
  normalized by ordinary carrier trace, not categorical quantum trace.
  Local algebras use tensor identities outside an interval, with the fixed
  associators. Fusion constraints are built into these carriers.
- `H_n^raw=sum_j h_(n,j)`, `K_n=H_n^raw-E_n 1>=0`, where E_n is the actual
  selected ground energy. CA-86 instead writes `H=-sum_j h_j`: its tile h
  equals minus our energy density. Positive rescalings `lambda_n K_n` are
  declared explicitly and affect gaps and residuals together.
- `W_n=U_n V_n` acts on carriers; `P_n=W_n W_n*`; `theta_n(a)=W_n a W_n*`.
  The microscopic vector Omega_n and the GNS cyclic vector of a state are
  different objects unless an identification is proved. Mixed states are
  allowed except where uniqueness/purity is explicitly required.
- `p_n=omega_(n+1)(P_n)`, `q_n=1-p_n`, and
  `delta_n^2=2(1-sqrt(p_n))` is CA-72's **squared vector** defect.
  State distance means the full dual operator norm, without a factor 1/2;
  on block matrices it is the trace norm and is at most 2.
- `alpha_n` always denotes an actual unital injective *-map, if supplied;
  `Phi_chi` denotes a UCP completion. They are never interchangeable.
  `alpha_n^k=alpha_(n-1)...alpha_k`; exact composition along this chosen
  dyadic chain does not assert path independence for all placement forests.
- Spectral windows are `1_[0,b](K)`. A positive spectral threshold lambda
  means the explicitly checked inequality `K>=lambda(1-Q)`.
  Local indistinguishability below is an operator-norm compression estimate,
  uniform over a whole observable unit ball, not decay of two-point functions.
- Circuit depth, gate range, fine-site support cardinality, physical support,
  and Hamiltonian time are separate parameters. All rate constants below may
  depend on fixed coarse row k, but never on the running fine index n.

## 1. Set up the comparison before estimating it

The microscopic states omega_n are chosen independently from the Hamiltonians.
For a coarse density rho_n define the refined trial state

    sigma_n(B)=Tr(W_n rho_n W_n* B).

If a unital lift satisfies `alpha_n(a)W_n=W_n a`, then
`sigma_n alpha_n=omega_n`. Therefore, for the *entire* unit ball of A_k,

    d_(k,n)=||(omega_(n+1)-sigma_n) alpha_(n+1)^k||.     (1.1)

The same identity holds for a chosen local subalgebra of A_k. Such a local
version is not the full WT-1 row unless those subalgebras exhaust that row
with a uniform norm estimate. In a finite-dimensional A_k a proved bound on
a fixed basis can be converted to a unit-ball bound with an explicit basis
constant; that constant need not be uniform in k.

Three interface corrections are necessary; they affect the proposed integration.

**Global corner support.** V_n is cellwise local as a carrier map. Nevertheless
`theta_n(1)=P_n` pins *every* inserted site. Consequently `theta_n(a_I)` also
contains pins outside I. A local stretched representative supported near I
can agree with it on the range of W_n, but is a different observable in A_(n+1).
The three-site support reading in CA-73:159–172 needs this qualification.
This does not infer nonlocality from fusion constraints; it identifies explicit
distant projectors. The 16-dimensional check exhibits a nonzero commutator
with a distant inserted-site flip.

**Corner unit.** Multiplicative transport of a polynomial with constants uses
P_n as the target unit. Thus `theta(F(h;1))=F(theta(h);P_n)`, not generally
`F(theta(h);1)`. This matters for vacuum shifts and central residuals.

**Softness topology.** CA-72:166–182 proves its exact completion-defect identity
and GNS seminorm. Its following interpretation as the sourced soft C*-condition
needs an additional argument: the source's condition is in operator norm
[S3:568–576]. For proper P the norm of that defect is
`|chi(ab)-chi(a)chi(b)|`, independent of omega(1-P). No soft C*-limit theorem
is invoked here on the strength of a single state seminorm.

## 2. Corner defect versus independent vacuum mismatch

**D3-1 — Proven exact comparison and a strict algebraic fallback.**
**ASSUME** one isometry W, two independent states rho,omega, `p=omega(P)>0`,
and `tau=omega theta/p`. Put `r_D=||tau-rho||_D` on a unital coarse test algebra D.
**PROVE**

    ||omega theta-rho||_D <= p r_D+q,
    ||omega Phi_chi-rho||_D <= p r_D+2q,
    q=delta^2-delta^4/4,    delta^2=2(1-sqrt(p)).        (2.1)

`<1>1.` Write `omega theta=p tau` and subtract rho.
`<2>1.` `p tau-rho=p(tau-rho)-q rho`; states have norm one.
`<2>2.` The first bound follows by the triangle inequality.
`<1>2.` Since `Phi_chi(a)=theta(a)+chi(a)(1-P)`, its pullback is
`p tau+q chi`. Subtract rho and use `||chi-rho||<=2`.
`<1>3.` `sqrt(p)=1-delta^2/2`; squaring proves the last equality.
`<1>4.` QED BY `<1>1`–`<1>3`. Small q says nothing about r_D.
At p=0 normalized tau is undefined; use the original functionals and bound 2.

An actual unital *-lift alpha with `alpha(a)W=Wa` satisfies the second bound
too: P reduces alpha(A), and its complementary pullback is a positive
functional of mass q. Its normalized state replaces chi when q>0.

For arbitrary W a strict, generally nonlocal fallback always exists:

    Ahat_n=A_n⊕C,
    alphahat_n(a,z)=(theta_n(a)+z(1-P_n),z),
    omegahat_n(a,z)=omega_n(a).                         (2.2)

`<1>5.` Cross terms vanish and `theta(ab)=theta(a)theta(b)`, so (2.2)
preserves products, adjoints and the unit (1,1); injectivity follows from
the scalar coordinate and injectivity of theta.
`<1>6.` For composite isometries `W_m^k=W_(m-1)...W_k`, composition follows
from `theta_m^n(1-P_n^k)+(1-P_m^n)=1-P_m^k`.
`<1>7.` The dual norm on a direct sum is the sum of component dual norms.
Thus the full adjacent augmented drift is exactly

    Dhat_n=||p tau-rho||+q,
    2q <= Dhat_n <= p||tau-rho||+2q.                   (2.3)

The lower bound evaluates the first component at its unit. QED.
This generalizes the existing scalar augmentation [S11], without attributing
microscopic locality to it. WT-1 applies to (2.2) if the derived drifts sum.
If `omega_n(P_n^k)->0` for every fixed k, its limit is merely the scalar
character `(a,z)->z`: a useful noncollapse obstruction, obtained directly
from `|omega_n(theta_n^k(a))|<=||a||omega_n(P_n^k)`.

For independently chosen states CA-72's J need not exist: its Gram domination
condition is separate [S6:140–147]. Arbitrarily small weight added to a null
direction of a pure coarse state violates it. The legitimate WT order is to
construct horizontal limit states first and their compatible GNS maps second.

## 3. Local energy, spectral windows and Lieb–Robinson constants

**D3-2 — Proven projection estimate.** **ASSUME** a finite positive K, a
projection Q with `K>=lambda(1-Q)`, `lambda>0`, and a state eta.
If `x=eta(K)/lambda<1`, let `eta_Q(B)=eta(QBQ)/eta(Q)`.
**PROVE** `||eta-eta_Q||<=2 sqrt(x)`.

`<1>1.` Positivity gives `1-eta(Q)<=x`, hence eta(Q)>0.
`<1>2.` Purify eta on a larger finite Hilbert space. Project the purification
with `Q⊗1` and normalize; its overlap with the original unit vector is
`sqrt(eta(Q))`, and its restricted state is eta_Q.
`<2>1.` For two unit vectors of overlap u, the difference of their rank-one
densities has its two nonzero eigenvalues `±sqrt(1-|u|^2)`.
`<2>2.` Diagonalization in their two-dimensional span proves the assertion;
restriction to an observable algebra cannot increase a functional norm.
`<1>3.` The state distance is at most `2sqrt(1-eta(Q))<=2sqrt(x)`.
`<1>4.` QED BY `<1>1`–`<1>3`. For x>=1 simply use distance at most 2.

**D3-3 — Conditional local drift theorem.** In (1.1), write D for its fine
image algebra. **ASSUME**, for every self-adjoint `b in D`, `||b||<=1`, a
self-adjoint local approximant `b_B in A(B)`, `||b_B||<=1`, satisfying
`||b-b_B||<=tau_(k,n)`. Let B include the refined support and a buffer.
Supply a positive local witness K_B, a nonzero local projection Q_B, and

    K_B >= lambda_B(1-Q_B),
    E_sigma=sigma_n(K_B),    E_omega=omega_(n+1)(K_B).

Assume `E_sigma,E_omega<lambda_B` and, uniformly for these approximants,

    inf_(c real) ||Q_B b_B Q_B-c Q_B|| <= ell_B/2.      (3.1)

**PROVE**

    d_(k,n) <= min{2, 2 tau_(k,n)
             +2sqrt(E_sigma/lambda_B)
             +2sqrt(E_omega/lambda_B)+ell_B}.           (3.2)

`<1>1.` Apply D3-2 to each state, with Q_B represented in the full carrier.
`<1>2.` Their two normalized Q_B-supported states differ on b_B by at most
ell_B: subtract the same scalar c and use (3.1) twice.
`<1>3.` Replacing b by b_B costs at most `2tau_(k,n)` for the original two
states. Triangle inequality with `<1>1` and `<1>2` proves (3.2).
`<1>4.` A Hermitian functional attains its norm on self-adjoint contractions:
for arbitrary b rotate its expectation to real and take its Hermitian part.
Take that supremum. QED BY `<1>1`–`<1>4`.

This theorem uses no tensor-product factorization of the state or Hilbert
space. All support, positivity and compression hypotheses must hold in the
specified fusion-space presentation. The term E_omega cannot be silently
dropped. If a state's local density is strictly positive, a positive local
K_B with zero expectation must be zero: diagonalize that density, or use
`Tr(rho_B K_B)>=lambda_min(rho_B)Tr K_B`. Thus an exact local vacuum kernel
is a substantive special assumption, not a generic critical-chain property.

The bridge to CA-72 is exact: use (2.1) with a *separate* bound on r_D, or
use (3.2) directly. There is no universal formula replacing r_D by q alone.
For a unique fine vacuum the global specialization below bounds q as well.
Local energy alone cannot generally bound the global product projection P_n.

For p_n>0, set `omega^P(B)=omega_(n+1)(P_n B P_n)/p_n` for a combined bound.
If the localization and compression hypotheses hold on the corner image of
the chosen coarse row, apply D3-3's proof to sigma_n and omega^P in (2.1):

    d_(k,n)<=min{2, 2q_n+p_n[2tau_(k,n)+ell_B
             +2sqrt(sigma_n(K_B)/lambda_B)
             +2sqrt(omega^P(K_B)/lambda_B)]}.          (3.2a)

Here `q_n=delta_n^2-delta_n^4/4`; insert (3.3) for the support/LR dependence.
The projected energy and corner localization are additional certificates;
conditioning a ground state does not preserve its ground energy in general.

**Conditional LR instantiation, with constants visible.** Suppose a localized
b_0 on S is dressed by `U(t)=exp(-itG)`, `G=sum_Z g_Z`, and compare it with
`U_B(t)=exp(-itG_B)`, where G_B keeps terms entirely inside B. Assume the
following LR estimate for the truncated evolution, with distance in fine sites:

    ||[exp(itG_B)b_0 exp(-itG_B),g_Z]||
       <= C_LR |S| ||b_0|| ||g_Z|| exp[-μ(dist(S,Z)-v|t|)].

Assume the crossing terms satisfy
`sum_(Z crosses B) ||g_Z||exp[-μdist(S,Z)]<=J_boundary exp(-μr)`.
Differentiating the comparison of full and truncated evolutions and integrating
gives, for the two conjugation signs alike,

    tau_(k,n) <= C_LR |S| J_boundary |t| exp[-μ(r-v|t|)]. (3.3)

Terms wholly outside B commute with its evolution; only crossing terms occur.
This is a Duhamel derivation from the displayed LR hypothesis, **not** a
general categorical LR theorem quoted from memory. The local source [S1]
contains a specialized LR estimate; it does not establish this hypothesis
for our fusion algebras. For an exact depth-D range-R circuit the enlarged
lightcone is deterministic and tau=0 once B contains it.

## 4. Dynamical-vacuum repair from a Hamiltonian residual

**D3-4 — Conditional circuit-conjugacy theorem implying WT-1.**
**ASSUME** positive K_n with normalized pure ground vectors Omega_n. The fine
ground is unique in the *declared comparison carrier*, with

    K_(n+1) >= Delta_(n+1)(1-|Omega_(n+1)><Omega_(n+1)|),
    ||(K_(n+1)W_n-W_n lambda_n K_n)Omega_n|| <= epsilon_n,
    lambda_n>0,    sum_n epsilon_n/Delta_(n+1)<infinity. (4.1)

Use either genuine coherent unital lifts alpha_n intertwining W_n, or the
strict augmented system (2.2). **PROVE**, on every WT row,

    d_(k,n) <= min(2,2 epsilon_n/Delta_(n+1)),
    q_n <= min(1,(epsilon_n/Delta_(n+1))^2).            (4.2)

Alternatively `Etrial_n=<W_n Omega_n,K_(n+1)W_n Omega_n>` gives
`d_(k,n)<=2sqrt(Etrial_n/Delta_(n+1))`, capped at 2, and
`q_n<=Etrial_n/Delta_(n+1)`. Summability of the square roots suffices.

`<1>1.` Let `psi=W_n Omega_n`, `Q=1-|Omega_(n+1)><Omega_(n+1)|`.
By the spectral inequality, `||Q psi||<=||K_(n+1)psi||/Delta_(n+1)`.
The residual in (4.1) equals `K_(n+1)psi` because K_n Omega_n=0.
`<1>2.` The two pure state densities have trace distance `2||Q psi||`
BY the rank-two calculation in D3-2.
`<1>3.` Pullback along a *-map is contractive; the trial state's pullback
is omega_n. This proves (4.2) for every row, including the augmentation.
`<1>4.` Since psi lies in Ran P_n,
`|<Omega_(n+1),psi>|^2<=<Omega_(n+1),P_n Omega_(n+1)>`.
Rearrange and use `<1>1` to bound q_n.
`<1>5.` Applying `K_(n+1)>=Delta_(n+1) Q` in psi proves the energy version.
`<1>6.` Summing the stated bounds verifies WT-1 A3; WT-1 supplies the
horizontal state, tail bound, and compatible limiting GNS system. QED.

This controls CA-72's defect through `delta_n^2<=2q_n`; it does not claim
that independent finite GNS spaces acquire the CA-72 J automatically.
Degenerate ground spaces require a selected sector or (3.1) on the image
algebra; zero energy by itself never selects a vector in a degenerate band.
Variance alone also fails: an excited eigenvector has zero variance and
can have state distance 2 from the ground state. The energy origin in (4.1)
is an independently certified ground energy, not a fitted Rayleigh quotient.

**Operational circuit-conjugacy sufficient condition.** Supply a local unital
bare lift beta_n intertwining V_n and commuting positive auxiliary terms q_j
whose common kernel is Ran(V_n). If

    Href_n=U_n [beta_n(lambda_n K_n)+Lambda_n sum_j q_j] U_n*,
    ||(K_(n+1)-Href_n)W_n Omega_n||<=epsilon_n,         (4.3)

then (4.1) follows since Href_n W_n Omega_n=0. This is a statement about
actual Hamiltonians and a spectral gap, not assumed state drift. With at most
`c N_(n+1)` mismatch terms of norm eta_n, one may take
`epsilon_n<=c N_(n+1) eta_n`. If the comparison is between *unshifted*
Hamiltonians of norm difference zeta_n, their ground energies differ by at
most zeta_n (minimize their Rayleigh quotients), giving a centered difference
at most `2zeta_n`. Neither the volume factor nor that energy-origin error
may be omitted. The reference dynamics is stretched/block-periodic; matching
it to the fine translation-invariant Hamiltonian is precisely the unknown.

**A spectral-flow version, proved conditionally.** Suppose a differentiable
rank-one selected spectral projection S_n(s), `0<=s<=1`, joins the bare
coarse vacuum projector to the fine vacuum projector. Supply anti-Hermitian
charge-preserving generators A_n(s) with local tails and

    ||dot S_n-[A_n,S_n]|| <= e_n(s),
    dot U_n=A_n U_n,   U_n(0)=1.

Differentiation gives
`d/ds(U_n* S_n U_n)=U_n*(dot S_n-[A_n,S_n])U_n`.
Integrating proves projector distance at most `integral_0^1 e_n(s)ds`.
If a circuit approximates U_n(1) within eta_n in operator norm, the pure
state drift is at most `2 integral e_n+2eta_n`. Summability of these errors
again proves WT-1. This makes the quasi-adiabatic/circuit condition precise
without asserting that a suitably local spectral-flow generator exists.
No general such theorem for these categorical carriers was found in the
consulted local sources; the needed generator/tail estimate remains input.

**Low-energy extension, proved.** Let `R=K_f W-W K_c`,
`P_E=1_[0,E](K_c)`, and `||R P_E||<=epsilon_E`.
For g>0,

    ||1_(E+g,infinity)(K_f) W P_E|| <= epsilon_E/g.      (4.4)

`<1>1.` Set `X=Q W P_E`, `A=K_f|Q-E>=g`, `B=K_c|P_E-E<=0`.
Then `AX-XB=Q R P_E=:Y`.
`<1>2.` Integration of `exp(-tA)Y exp(tB)` gives its solution X; the boundary
at infinity vanishes, and the norm is at most `integral exp(-tg)epsilon_E dt`.
`<1>3.` QED. The high-window probability is at most `(epsilon_E/g)^2`.
Combine with D3-2 and a window-indistinguishability bound to cover low-energy
mixed states. Duhamel also gives
`||(exp(-itK_f)W-W exp(-itK_c))P_E||<=|t|epsilon_E`.
Observable dynamics needs estimates on the energy windows reached by those
observables; a vacuum residual alone does not supply them.

## 5. Critical scales: what dyadic summation repairs

Differentiating a simple eigenvalue equation along a Hamiltonian path gives,
in a gauge with `<Omega,dot Omega>=0`,

    <m,dot Omega>=-<m,dot H Omega>/(E_m-E_0),  m!=0.

Thus a gap closing with cutoff amplifies a perturbation; LR bounds on
commutators do not remove this spectral denominator or select the vacuum.
This calculation explains the obstruction without importing a gapped-chain
spectral-flow theorem outside its hypotheses.

If `Delta_n>=c a_n^z` in lattice units and the vacuum residual is
`epsilon_n<=C a_n^(z+y)`, y>0, (4.2) yields

    d_(k,n)<=C' 2^(-yn),
    sum_(n>=m)d_(k,n)<=C' 2^(-ym)/(1-2^-y).            (5.1)

For energy-density error `eta_n<=C a_n^u` and O(a_n^-1) contributing bonds,
`Etrial_n<=C' a_n^(u-1)` requires `u>1+z` in the energy bound. A norm bound
on residual density with the same counting requires `u>1+z` in (4.2), with
rate `u-1-z` instead of its square root. Better cancellation is possible
only if independently proved. Multiplying K by a physical-unit factor
changes numerator and gap equally, so does not improve these ratios.

For the local theorem a general rate ledger is more useful. Suppose

    E_sigma+E_omega<=C_k a_n^e,  lambda_B>=c a_n^zeta,
    ell_B<=C_k a_n^-b r_n^-p,  r_n=ceil(a_n^-gamma),
    tau_(k,n)<=C_k a_n^t,      e>zeta, gamma p>b, t>0. (5.2)

Then (3.2) is summable with exponent
`min((e-zeta)/2,gamma p-b,t)>0`. These inequalities are a **conditional
critical rescue**, not a proof of polynomial indistinguishability. Any volume
factor belongs in e and b. A fixed coarse *physical* interval usually occupies
O(2^(n-k)) fine sites; it cannot be counted as a fixed number of fine sites.
For shrinking physical buffers require `gamma<1`; a finite-volume geometry
must also actually accommodate B. Strong growth in b can make (5.2) infeasible.

Dyadic spacing turns a positive power of spacing into a geometric tail.
It does not make constant per-step error summable, nor does it sum
`1/|log a_n|` (which is proportional to 1/n). Passing to a selected subsequence
without bounding the omitted scale steps changes the theorem. The existing
quantitative instance [S13] is explicitly fixed-row and not uniform in row
size; its specialization is recorded only in the examples table below.

## 6. What the tiles force at the first dressing step

**D3-5 — Proven local tangent of polar heat refinement.**
**ASSUME** the finite-volume data of D3-C. Define `P=VV*`, `H_eff(t)=W(t)*HW(t)`.
Let P_Z be the product of the chosen empty-site projectors on inserted fine
sites in Z, with identities on the other sites; the empty product is 1.
**PROVE**

    W(0)=V,  W(t)*W(t)=1,
    dot W(0)=-(1-P)HV=A_loc V,
    A_loc=sum_Z [P_Z,h_Z],
    dot H_eff(0)=-2 V*H(1-P)HV <=0.                   (6.1)

`<1>1.` `exp(-tH)` is invertible, so G(t)>0 on the coarse object. Functional
calculus gives `W*W=G^-1/2 G G^-1/2=1`, in every charge block.
`<1>2.` `G(0)=1`, `dot G(0)=-2V*HV`, and the derivative of `G^-1/2` at the
identity is `V*HV` (expand the scalar power series, which is valid there).
Differentiating (C.1) gives `-HV+VV*HV=-(1-P)HV`.
`<1>3.` h_Z cannot change inserted vacuum projectors outside Z. Hence
`P h_Z V=P_Z h_Z V` and `P_Z V=V`, proving
`[P_Z,h_Z]V=-(1-P)h_Z V`. Sum over Z.
`<2>1.` Each commutator is anti-Hermitian, belongs to the categorical local
algebra on Z, and has norm at most `2||h_Z||`.
`<2>2.` Thus A_loc is an exactly local extension of the frame tangent. No
Hilbert tensor factorization or braiding is used in this support argument.
`<1>4.` Differentiate `W*HW` and insert `<1>2`; both terms equal
`-V*H(1-P)HV`. This is negative semidefinite since H is Hermitian.
`<1>5.` QED BY `<1>1`–`<1>4`.

This negative derivative itself has a local decomposition. Expand H twice;
`V*h_Z(1-P)h_Y V` vanishes unless Z and Y share an inserted site: otherwise
the vacancy defect created in Y cannot be removed in Z. Surviving terms
are supported on connected overlapping pairs of intervals, of range at most
2R in fine-site diameter. This supplies the first connected-cluster step.

For two disconnected groups of cells, tensor functoriality gives
`T=T_A⊗T_B`, `G=G_A⊗G_B` and `W=W_A⊗W_B`; the positive square root respects
this tensor product. Even on constrained charge carriers this is an identity
of categorical morphisms. Thus the canonical frame factorizes for disconnected
interactions. This is structural evidence for a connected expansion, not a
bound on its convergence radius or on a local unitary extension at all orders.

**Local tangent-extension lemma, proved.** Suppose a frame tangent at bare V
has a finite decomposition `D=sum_I x_I V`, with categorical x_I supported
in I, and satisfies `V*D+D*V=0`. With the local vacancy projections P_I set

    a_I=x_I P_I-P_I x_I*-(1/2)P_I(x_I-x_I*)P_I.         (6.3)

**PROVE** `a_I*=-a_I`, `||a_I||<=3||x_I||`, support remains I, and
`(sum_I a_I)V=D`.
`<1>1.` Adjoint and triangle inequality give the first two assertions.
Products of local morphisms stay in the same interval algebra.
`<1>2.` Since `P_I V=V`,
`a_I V=x_I V-(1/2)P_I(x_I+x_I*)V`.
`<1>3.` Locality of insertion gives `P_I y_I V=V(V*y_I V)` for every
operator y_I supported in I, by the outside-vacancy argument in (6.1).
Sum `<1>2`; the unwanted term is
`-(1/2)V(V*D+D*V)=0`. QED BY `<1>1`–`<1>3`.
Thus any local tangent decomposition can be extended without global pins,
even when its Hermitian pieces cancel between patches. This gives a precise
subproblem for recursive polar expansions: produce local tangent coefficients
with summable interaction norms. The lemma does not prove that those norms
stay controlled at higher orders; disconnected factorization alone is not
an all-orders convergence argument.

There is a specific all-orders difficulty. With `P_t=W W*` and
`K_frame=W*dot W` anti-Hermitian, exact differentiation gives

    dot W=-(1-P_t)HW+W K_frame,
    dot H_eff=-2W*H(1-P_t)HW+[H_eff,K_frame].          (6.2)

The first identity follows by projecting dot T onto the complement of T's
range; the second follows by the product rule. Generally K_frame is nonzero
away from t=0: the polar frame need not be horizontal. A proof of D3-C must
control that coarse rotation too. The global condition number of G can grow
exponentially with volume, so a direct estimate of `||G^-1/2||` is inadequate.
The global projection-transport generator also retains distant projector
factors; A_loc demonstrates why one must construct a *local extension*.

The polar isometry is canonical after H,V,t are chosen. Its unitary extension
is not unique: multiplication on the right by any unitary fixing Ran V
pointwise leaves UV unchanged. Nor does drift force a unique U. For a
variational circuit `U(theta)=exp(theta A)U`, A anti-Hermitian and local,

    d/dtheta <UV Omega,H UV Omega>|_0 = <UV Omega,[H,A]UV Omega>.

Vanishing of these derivatives gives necessary stationary equations; it does
not certify the minimum, a gap estimate, or small Wilson drift. The useful
acceptance equations are (3.2), (4.1), and the residual comparison below.

## 7. A short strip, an infinite strip, and the UV/IR separation

**Proven negative statements about automatic dressing.** The map
`exp(-tK_f)V` is not generally isometric: its Gram matrix is G(t), not 1.
Dividing each output vector by its norm is nonlinear in the input; dividing
individual columns is insufficient when the Gram matrix is not diagonal.
The matrix inverse square root in (C.1) repairs isometry, with locality still
the headline conjecture. Even its energy decrease (6.1) does not identify
the fine ground state.

Indeed if `[H,P]=0`, then `exp(-tH)V=V exp(-t V*HV)` and (C.1) gives
`W(t)=V` for every finite t. Heat filtering *inside* the retained carrier
cancels exactly in polar normalization. A coarse excited state is therefore
not repaired by this prescription merely because H is the desired fine H.

For a normalized vector psi with fine vacuum overlap b>0 and fine gap Delta,
ordinary normalized imaginary-time filtering gives the elementary bound

    excited weight after t
       <= exp(-2tDelta)(1-b^2)/b^2.                    (7.1)

Decompose psi into ground and excited spectral components to prove it.
Fixed short time does not suppress a closing gap. Achieving small error
requires control of b and time of order `Delta^-1 log(1/error)` in this bound.
At infinite time `exp(-tK_f)V` tends to `P_ground V`, whose rank is at most
the ground degeneracy; it cannot be an isometry of a larger coarse carrier.
The singular limiting Gram normalization cannot be interchanged with t→∞.

CA-86's half-strip expansion therefore proposes a *state-preparation kernel*,
not automatically an OAR refinement. Its Trotter remainder is controlled at
fixed volume, time, and couplings; all three dependences must be tracked before
using an infinite strip. The physical strip also retains anisotropic tile
weights [S9:61–110]. The isotropic topological evaluation alone does not
select H, its spectral gap, the ground-state boundary condition, or a real
central-charge lift. The last freedom is explicit in [S12:333–335].
The Levin–Wen rules [S10:487–552] constrain a topological fixed-point wave
function. No identification of that wave function with an arbitrary critical
chain's refined vacuum follows. Such an identification needs its own dynamics
and boundary comparison; it is not the canonical choice for this problem.

**D3-6 — Proven shell elimination and its obstruction.**
Decompose the fine carrier as `Ran V ⊕ (Ran V)^perp` and write

    H-E = [ A-E      B*   ],    D-E >= g>0,
          [ B        D-E  ]
    F(E)=A-E-B*(D-E)^(-1)B.                           (7.2)

**ASSUME** these finite blocks; **PROVE** an E-eigenvector has the form
`(phi,-(D-E)^(-1)B phi)` with `F(E)phi=0`, and conversely.

`<1>1.` The second block eigenvalue equation solves uniquely for the lower
component, since D-E is invertible.
`<1>2.` Substitute into the first block equation to obtain F(E)phi=0.
Conversely substitution in both equations gives an eigenvector. QED.
Its relative shell amplitude is bounded by `||B phi||/(g||phi||)`.

But matching F(E) to a coarse Hamiltonian is not yet matching normalized
carriers. Put `T_E=(1,-(D-E)^(-1)B)^T`, `G_E=T_E*T_E`. Then directly

    (T_E G_E^-1/2)*(H-E)(T_E G_E^-1/2)
       =G_E^-1/2 F(E)G_E^-1/2.                        (7.3)

Thus the low Hamiltonian has an induced metric and energy-dependent
self-energy. Locality of these objects and agreement with the declared
coarse couplings are separate obligations. The finite inverse in (7.2)
does not, by itself, prove a uniform local interaction expansion.

A fixed shell gap alone does not settle the vacuum. For 0<t<1 consider
the abstract block family with retained dimension two,

    H(t) = [0  0     0],   A(t)=diag(0,t^2/2), D=1.
           [0  t^2/2 t]
           [0  t     1]

The lower 2×2 determinant is `-t^2/2<0`; its negative eigenvector is the
unique ground state and is orthogonal to the retained ground vector (1,0,0).
Yet the shell coupling has norm t→0 and shell gap 1. Ground-energy subtraction
makes H positive without changing this conclusion. This is a general spectral
counterexample, not a claimed categorical critical model; its exact finite
instance is in the check. The missing condition is control of the induced
low-energy self-energy relative to the infrared scale. D3-C would provide
local dressings; it would not erase this independent infrared problem.

## 8. CA-73: replace stretched dynamics, not just stretched names

Exact corner transport preserves algebraic residuals with corner unit P.
It does not compare the transported coarse h with the actual fine h. A local
unital lift, when available, removes the unit mismatch but leaves the dynamical
one. The basic equations to synthesize are therefore simultaneously

    K_f W-W lambda K_c = small on declared energy windows,
    R_f W-W R_c = small on the probe/graph domains.     (8.1)

The first is the input to D3-4. The second is not a consequence of the first
on a single vacuum. For a word of bounded operators B_i,C_i and isometry W,

    B_1...B_m W-W C_1...C_m
      =sum_i B_1...B_(i-1)(B_i W-W C_i)C_(i+1)...C_m. (8.2)

Expansion cancels consecutive terms, proving the identity and the norm bound
`sum_i product_(j<i)||B_j|| ||B_i W-W C_i|| product_(j>i)||C_j||`.
On energy domains the intermediate vectors and their norm weights must be
included, exactly the obligation in VR-1. Growing Fourier sums and physical
normalizations can defeat unweighted density-error bounds.

Even vacuum centering must be transported explicitly. If `m=tau(h)` in
D3-1, coarse centering transports to `theta(h)-mP`, while centering theta(h)
in the independent fine state gives `theta(h)-pm1`. Their difference is
`m(p1-P)` and its fine GNS seminorm is exactly `|m|sqrt(pq)`.
This is a checked finite identity. Central constants likewise multiply P
in a corner calculation. Small leakage in a cyclic vector does not imply
small residual on all vectors `a Omega`; the latter requires probe-weighted
estimates. CA-73's stretched-augmented constraints ensure descent only when
the stronger state-feasibility problem has actually been solved.

## 9. Reproducibility and handoff

This folder is the complete change. No network, Julia suite, large chain
computation, report rebuild, root convention edit, commit, or push is performed.
The task's explicit scope supersedes the ordinary repository landing workflow.
The relevant local documents and branch sources were read rather than merged.
The branch revision used below is `1f402aaf96d2ffb9d8efb0684836d4771bbd5f60`.

The check script and raw output live in `checks/`; its README records the
command, versions, input hashes and rejected mutations. The largest matrix
is 16×16. These are algebraic checks of local derivations and counterexamples,
not numerical evidence for the conjecture or for critical scaling exponents.
The missing factor-two mutation was first run and failed; the restored checks
passed. A research collaborator independently checked the estimates and
identified the polar-frame rotation, local-witness caveat, and support issues.
Those corrections are included here; no existing shard was silently repaired.
Final independent review found no blocking issue and reran all eleven checks.

## Results ledger

- **D3-C — conjectural:** uniform small-time locality, effective interactions,
  and constructive circuit approximation for polar heat refinement, general C.
- **D3-1 — proven:** independent-state corner/CP bounds, exact strict scalar
  augmentation, full augmented drift, and scalar-collapse diagnostic.
- **D3-2 — proven:** energy-to-projected-state trace-norm bound with constant 2.
- **D3-3 — conditional theorem:** local witness energy plus uniform compressed
  indistinguishability and localization bounds imply (3.2).
- **(3.3) — conditional derivation:** specified LR constants imply the stated
  localization error; no general categorical LR theorem is asserted.
- **D3-4 — conditional theorem:** circuit-conjugacy/vacuum-residual and gap
  estimates imply WT-1 A3; (4.4) extends the estimate to spectral windows.
- **(5.1)–(5.2) — proven arithmetic implication:** positive net cutoff powers
  yield explicit dyadic tails; the power bounds themselves remain inputs.
- **D3-5 — proven:** polar isometry, local first tangent, connected quadratic
  energy descent, disconnected factorization, local tangent extension (6.3),
  and the frame-rotation identity.
- **D3-6 — proven reduction/negative:** shell elimination includes a metric;
  a fixed UV gap and small shell coupling do not determine the IR vacuum.
- **(7.1) and commuting-corner test — proven negative:** short or infinite
  heat strips do not automatically furnish a vacuum-preserving isometry.
- **(8.2) and centering correction — proven:** residual transport needs
  actual fine-density comparisons, corner units, and domains for products.

## What this gives the integration

CA-68/71 supplies V and exact categorical composition. D3-C proposes a single
tile-dependent way to synthesize its dressing; D3-5 proves the first local
step. CA-86 supplies the Euclidean strip interpretation without discarding
its geometric weights. CA-87's general blocking criterion transports these
questions to paired carriers when `O≅Y⊗Ybar`; it supplies no drift estimate.

CA-72's leakage scalar is now coupled to independent-state mismatch and to
ground-energy/residual estimates. The augmentation supplies a strict algebraic
WT fallback with an explicit locality limitation. D3-3/D3-4 give actual
inequalities feeding WT-1, WT-2's computable tails, and WT-3's Gram bounds.

LC-4's state certificate can consume those inequalities **only after** a
local unital lift is constructed. CA-73 and VR-1 then require estimates on
the same limiting state's probe and energy domains. LC-1–LC-3 and LC-9–LC-10
could determine the tile couplings and counterterms through sewing/Ward data;
their formal identities do not presently prove the bounds above. Neither
state convergence nor this conjecture supplies standard KS convergence,
full projective-unitary symmetry, or sector fidelity.

## Open problems

1. **Categorical algebra input:** construct a local unital lift on the full
   fusion algebra, with compatible complement representations and support
   bounds. Global scalar augmentation alone does not solve this. Specify
   site object, unit inclusion, charge selection and any extra boundary data.
2. **D3-C itself:** prove uniform convergence of a connected interaction
   expansion for the polar frame, including K_frame and a local unitary
   extension. Bound circuit tails without using the exponentially poor global
   conditioning of G. Determine whether additional hypotheses are necessary.
3. **Dynamics from C-data:** derive the actual Hermitian tile coefficients,
   their scale dependence, energy shifts, and relevant/marginal counterterms.
   The category gives the allowed morphisms, not their dynamical coefficients.
   A real conformal lift and full versus chiral target must remain declared.
4. **Critical state certificate:** prove unique selected vacua and a gap/rate
   ledger for D3-4, or supply both local witness energies and the full-ball
   compression estimate (3.1) for D3-3. Include endpoints, support growth,
   physical units, and computable all-scale majorants. Correlation decay alone
   is not this estimate; local faithful vacua obstruct exact local kernels.
5. **Couple refinement to dynamics:** bound the normalized effective
   self-energy after shell elimination and match the coarse coupling flow.
   Determine whether polar short-strip iteration can achieve the residual
   rate above the infrared denominator while retaining physical locality.
6. **LC-4 operator certificate:** derive the standard KS modes from those same
   densities; control their weighted refinements, products and residuals with
   a common regularity operator and normalization ledger. Prove equality of
   the two central coefficients, domain control and group integration.
7. **Continuum and fidelity:** establish local-net reconstruction, complete
   sectors and their modular data, and noncollapse of the chosen OAR state.
   These are independent of the finite carrier charge labels and WT-3 kernels.

## Examples table

| Calibration only | What it tests for the general construction | Boundary |
|---|---|---|
| Source Dirac/free-fermion Wilson example, [S13:18–98] | Actual adjacent dual state-norm drift has a computable dyadic tail for fixed coarse momentum window M. | Sharp refinement is spatially nonlocal and the bound is not uniform in M. |
| Wavelet free-fermion MERA, [S2:434–491] | Explicit filter error and support parameters control correlation functions; a finite-volume energy/gap bound motivates D3-4. | The source does not prove infinite-volume fidelity; the stated finite-ring extension and exponential filter trend are not a universal theorem. |
| Ordinary two-level tensor carriers in `checks/check_drift.py` | Detect global corner pins, the state-distance factor 2, and local polar tangent assembly. | Linear-algebra calibration, not a categorical critical limit. |
| Any category admitting `O≅Y⊗Ybar`, [S9b:55–69] | Pair blocking transports the local algebra question with an explicit range change. | Blocking does not choose the dressed vacuum or the continuum category. |

## Sources used

All paths are repository-relative. Bracketed labels above point to these
precise local anchors. Repository notes are cited as prior local derivations,
not as published theorems; new statements are proved or labelled here.

- **S1:** `literature/md/2010.11121/2010.11121.md:101–124,126–180,198–220`:
  OAR maps, Wilson/GNS construction and support bookkeeping;
  `:1078–1101` specialized LR bounds and `:1632` the interaction outlook.
- **S2:** `references/refinement/HaegemanEtAl2018Wavelet/source/latticefermions.tex:434–491`:
  error theorem, its scope, and finite-volume energy/gap inequality;
  acquisition in `references/refinement/SOURCES.md:234–293`.
- **S3:** `literature/md/2306.16063/2306.16063.md:568–583`:
  operator-norm asymptotic multiplicativity for soft C*-systems.
- **S4:** `cft_machine/research/wilson_triangle.md:18–105,109–153,155–167`:
  WT-1 hypotheses/conclusion, WT-2 computability, WT-3 and its boundaries.
- **S5:** `report/sections/68_variable_n_refinement_maps.tex:49–105,139–149`;
  `report/sections/71_refinement_placement_category.tex:53–146`:
  insertion, dressing proposal, placements, composition and cell shifts.
- **S6:** `report/sections/72_gns_descent_corner_calculus.tex:56–109,140–196`:
  corner calculus, normalized GNS defect, independent Gram domination, CP defect.
- **S7:** `report/sections/73_categorical_residual_set.tex:150–200`:
  stretched transport and coherent residual family, qualified in Sections 1,8.
- **S8:** `reconstruction/04_cutoff_oar.md:16–31,84–155`:
  microscopic locality, state and operator certificates, further obligations;
  `reconstruction/01_cells.md:63–99` distinguishes geometric sewing from
  topological identities and specifies analytic collar assumptions.
- **S9:** at local Git revision `1f402aaf96d2ffb9d8efb0684836d4771bbd5f60`,
  `report/sections/86_spacetime_trotter_dictionary.tex:61–110`.
  **S9b:** same revision,
  `report/sections/87_dilute_fibonacci_is_blocked_golden.tex:55–69`.
- **S10:** same revision,
  `references/string-net/LevinWen2005/source/strnet.tex:487–552`;
  provenance `references/string-net/SOURCES.md:19–90`. These files exist in
  the local Git object database, not the current working tree. Reproduce with
  `git show REV:path`; no network acquisition or checkout was used.
- **S11:** `report/sections/84_coset_hamiltonian_and_oar.tex:94–125`:
  pre-existing scalar-augmentation construction and its stated scope.
- **S12:** `references/cft-machine/realisation/EvansGannon2018/source.tex:333–335`;
  `cft_machine/research/realisation_and_fidelity.md:23–61`:
  central lift, enriched input and fidelity distinctions.
- **S13:** `cft_machine/benchmarks/fermion/WILSON_PROOF.md:18–98`:
  the quantitative fixed-row calibration and its locality limitation.
- **S14:** `cft_machine/research/virasoro_routes.md:55–82,118–177`:
  graph-domain products, state compatibility and remaining symmetry obligations;
  `CONVENTIONS.md:631–827,871–884,1072–1217`: adopted conventions.
- **New checks:** `checks/check_drift.py`, `checks/output.txt`, and the
  deliberately failing `checks/red_*.txt`; see `checks/README.md` for the run.
