# D5 — Lattice sewing, reflected positivity, and annular tests of fidelity

**Status (2026-10-22): exploratory.** One universal existence conjecture;
exact finite-cell lemmas and a conditional sector-completeness theorem below.
No general critical Hamiltonian, chiral OAR limit, or certificate family is constructed.
All new conventions are proposals confined to this note, as requested.

## Headline conjecture

**D5-C — Annularly saturated lattice realization of a unitary modular category.**
Let C be any unitary modular tensor category given by finite computable
fusion, associator, braiding and dagger/duality data, with positive spherical
dimensions. A single procedure on promised-valid presentations of C returns
computable enrichment E1–E7, a computable local C-labelled lattice family,
and certified error moduli with the following properties.

1. The site object O_n contains the unit and tensor-generates C; finite
   multiplicities and a boundary-energy cutoff may grow with n. Interval
   algebras are End_C(O_n^{tensor L}); a fixed finite blocking may be used.
   Hamiltonians have uniformly bounded interaction range in this presentation.
   Exact exponential tiles give reflected-positive cells and exact sewing.
2. Local observable refinements and states satisfy WT-1 on the **same**
   representation system as the prescribed standard KS modes. The modes
   satisfy VR-1, positive-energy/self-adjointness/integration certificates,
   and the collared cell limits satisfy LC-1 C0–C7 with internal stress.
   The periodic limit is a full local unitary CFT with two identified chiral
   nets A_L,A_R, each with full positive-energy projective Diff(S^1) symmetry.
3. Oriented lattice endpoints and junctions yield a dimension-preserving,
   fully faithful braided dagger functor C -> DHR_fin(A_L); the conjugate
   orientation yields the corresponding right-hand identification. The
   endpoint convergence includes all products and local transporters, not
   only closed-loop expectations.
4. For each chiral net, actual represented annular inclusions have the
   monotone exhaustion and Pimsner–Popa bounds of Theorem D5-F, with bounds
   tending to Dim(C). Their complementary-commutant exhaustion has an
   effective certificate, for example the repair estimate in D5-A.
5. Collared amplitudes and thermal traces converge with computable tails.
   In the declared right-dual character convention the full vacuum theory
   has the Cardy diagonal partition function sum_i |chi_i|^2, with the
   chosen c lift and complete characters, and positive all-grade sewing.

**Conclusion claimed:** the construction realizes C as the **complete**
chiral sector category, with its supplied ribbon data, and realizes its
full diagonal theory by microscopic local dynamics and the same KS/OAR
limit. In particular no extra simple sectors are hidden in the limit.
The uniform procedure selects the enrichment as part of its output; it is
not asked to recognize invalid category presentations. This is an existence
conjecture for an algorithm, not an implemented algorithm.

The quantifier is “some compatible enrichment”, not “every proposed c,
character list or OPE”. E1–E7 must be exhibited, including data beyond C.
For fusion-only input, first declare a braided target B and its interface
to the C-defects. Choosing B=Z(C) is a different target; it is not a theorem
that a C-chain has chiral category Z(C). The universal claim above concerns
arbitrary modular C, not a distinguished family of examples.

**Exact gap:** the note proves the finite sewing/positivity statements and
that a fully faithful endpoint identification plus an annular index upper
bound forces complete fidelity. It proves neither the universal existence
of a chiral realization nor synthesis of the common local dynamics,
analytic bounds, endpoint fullness, or annular exhaustion in items 1–5.
The conjecture is stronger than abstract UMTC realizability, itself posed
as a reconstruction problem in [B:364–392]. Its additional content is a
local lattice realization carrying a quantitative certificate of completeness.

## Conventions proposed and declared additional data

Read against CONVENTIONS (a)–(ai), especially (b),(r),(s),(u),(ae),(af),(ai).
These choices do not change the canonical file or resolve D1 repository-wide.

- P1. Use 1 for the unit object and unit-first indices; no numerical R gauge
  is imported. Fusion multiplicities are retained. Fix left-associated
  trees, orthonormal vertex bases, oriented edges, and the unitary spherical
  duality. A reversed non-self-dual edge carries its dual label, not the same
  label by fiat. Raw closed loops have value d_a>0 [P:1012–1019].
- P2. Match CA-86 by H_n=-sum_j h_(n,j), h_j=h_j^dagger. When using LC-4
  set e_j=-h_j, so H=sum_j e_j and j_j=i[e_j,e_(j+1)]. Symbol e_j here is
  an energy density, not LC-4's scalar energy subtraction. Work on open
  patches; specify periodic closure separately, retaining all seam labels.
- P3. A tile G_j(t)=exp(t h_j) has coefficients w_alpha(t), while c_alpha
  denotes coefficients of h_j. These are different variables. Hermitian
  forms are linear in the second slot. Reflections reverse temporal order
  and use the dagger plus specified oriented duality maps.
- P4. At a Hilbert cut use all admissible charge and multiplicity labels.
  A nonorthonormal basis has Gram G and contraction G^{-1}. A categorical
  spherical closure weights a simple block by d_a; an ordinary Hilbert
  thermal trace counts its actual multiplicity. They are not interchangeable.
- P5. Write B for the declared chiral UMTC and D_B=Dim(B)=sum_i d_i^2.
  Its normalized S has S_(1i)=d_i/sqrt(D_B)>0; Theta_ii=theta_i and
  T_ii=exp(-2*pi*i*c/24)theta_i. Conformal weights h_i are lifts with
  exp(2*pi*i*h_i)=theta_i. Opposite chirality reverses braiding.
  “boxtimes” denotes the Deligne product of categories, distinct from object tensor products.
- P6. Torus conventions are chi_i(tau)=Tr_(V_i) q^{L0-c/24},
  q=exp(2*pi*i*tau), and Z=chi^dagger M chi. The conjugate/right label
  has already been relabelled by duality. Thus the Cardy choice is M=1;
  FRS's oriented convention instead writes charge conjugation [FRS:8237–8241].
  A non-diagonal M needs its own full-CFT sewing data.
- P7. New inequalities below are exact, not numerical-tolerance claims.
  A cutoff test checks only its specified subspace. Summability or uniform
  bounds mean proved all-scale majorants with tails, not fitted decay.

**E1 — target and orientation.** Specify fusion-defect C versus chiral B,
left/right chiral nets and full observable extension, boundary conditions,
module category, tensorators and (for B=Z(C)) half-braidings. A periodic
Hilbert space is not the vacuum carrier of one chirality.

**E2 — conformal lift.** Specify real c_L,c_R, weights, vacuum/Casimir
subtractions, physical velocity and the anomaly line. Equal lifts are the
nonanomalous diagonal tier. C fixes c only modulo eight [EG:333–335]; its
twists do not fix the character-T vacuum phase. KS still retains c_n,c*_n.

**E3 — analytic carriers and extension.** Specify graded dimensions,
positive quotients V_i, complete characters and their transformation law,
the common vacuum chiral algebra and its actions/intertwiners. A categorical
simple is not one Virasoro highest-weight family. An extension of a smaller
chiral algebra needs branching and local-algebra/Q-system data; its category
is generally the category of local modules, not the old category [EG:338–347].

**E4 — full/boundary sewing.** Specify reflected/dual port maps, local
coordinates, anomaly-line identifications, boundary multiplication and all
higher sewings. M>=0 entrywise with MS=SM, MT=TM is only a necessary
genus-one condition; some such matrices do not define a CFT [FRS:487–502].

**E5 — microscopic choices.** Supply O_n, actual local Hilbert realization,
tile coefficients, boundary/seam trace, reflection axis, cutoff schedule,
local refinements, states and the energy/current normalization.

**E6 — analytic certificates.** Supply WT-1 drift tails; graph-norm bounds
for modes, endpoints and products; trace/collar tails; continuum locality,
positive energy, self-adjointness and projective integration. WT-1 alone
constructs a state, and VR-1 alone constructs a common-domain mode algebra.

**E7 — fidelity certificates.** Supply endpoint localization/transport,
noncollapse and fullness tests, oriented braiding/duality identification,
and annular index/exhaustion bounds. Every E item is additional input or
a synthesis obligation. None is inferred solely from a finite F table.

## Exact lattice cells and the LC equations

Decompose W=O tensor O as a sum of simples with multiplicity spaces H_a.
Then End_C(W)=direct-sum_a End(H_a). Resolve diagrams in matrix units
D_(a,mu,nu); a general diagram basis is an invertible linear recombination.
For a time cut gamma with ordered object W_gamma, take
H_gamma=direct-sum_a Hom_C(a,W_gamma), retaining external charge labels.
More general ports use the corresponding Hom/module-Hom spaces. This is
not a tensor-product factorization across a fusion constraint. Cups and
other port bends carry P1's explicit duality and its metric factors.

A finite spacetime patch P is a fixed oriented brick graph with specified
input/output cuts. Expand each exact G_p in the finite tile basis and set

    Z_P = sum_(histories Gamma on P) (product_p w_(p,alpha_p)) Ev_C(Gamma).

Internal cut labels are summed; external labels remain free. Exactness
means exact exponential coefficients, not one insertion per plaquette.
Replacing w by the coefficients of 1+t h is CA-86's first-order version.
The graph has finitely many tiles even though an exponential's coefficient
functions were defined by convergent series. Categorical evaluation obeys
loop, bubble and recoupling identities; geometric weights retain anisotropy.

**Lemma D5-S [proven, finite sewing and dual bases].**
ASSUME fixed finite patches P,Q with compatible oriented Hilbert cuts.
PROVE Z_(Q sew P)=Z_Q Z_P, with inverse-Gram contraction in general bases;
regroupings of the same tensor graph agree, and dual block bases use F^{-T}.

<1>1. A history on the sewn graph is a pair of histories with a common
interface label. Its scalar weight is the product of their weights, and
its evaluation is their categorical composite. BY the definition of Z.
<1>2. Insert 1=sum_AB |u_A>(G^{-1})_AB<u_B| on the interface.
If U is the basis-synthesis map, UG^{-1}U^dagger=1 follows from G=U^dagger U.
Thus summing the common labels proves the composition formula. BY <1>1.
<1>3. Finite sums and associative composition can be regrouped. F-moves
are changes of a complete categorical basis; they preserve this composite.
They need not identify two different weighted brick graphs. BY <1>1–2.
<1>4. In LC-9's convention t_L=F t_R, a dual basis b_L=U b_R satisfies
U F^T=1 by evaluation on t_L. Hence U=F^{-T}=conjugate(F) in unitary gauge.
Value columns K_L=F K_R instead. Consequently K_L^T b_L=K_R^T b_R.
<1>5. QED BY <1>1–4. This duality occurs already at a lattice cut; there
is no reason to wait for analytic conformal blocks to encounter it.

An oblique cut need not define positive time evolution. Reinterpreting it
as a Hilbert port requires its oriented pairing; geometric rotation of a
positive transfer matrix does not automatically preserve positivity.

| LC condition | Exact finite counterpart | Additional limiting requirement |
|---|---|---|
| C0 typing | All allowed Hom channels, multiplicities, F/module-F identities | Endpoint functor and complete sector identification |
| C1 unit/dagger/positivity | Empty cylinder, reflected adjoint, D5-P below | Strong continuity, all-grade/null descent, nuclear collar bounds |
| C2 sewing | D5-S on the same finite graph | Convergence of growing/infinite contractions |
| C3 fixed-geometry decompositions | Reordering contractions and categorical recoupling | Different discretizations approximate the same marked surface |
| C4 Ward | Exact tile derivative and energy continuity below | Coordinate Ward residual tends to zero with accumulated-error control |
| C5 curvature | Algebraic curvature identity and residual Bianchi relations | Scalar anomaly and matching across ports |
| C6 internal stress | Energy/current are observables of this very lattice | Local stress field, state-field action and conformal OPE |
| C7 microscopic identification | -G'_j(0)=e_j; standard KS from e_j,j_j | KS modes converge to the stress implementing C4 |

## Reflection positivity constrains matrices, not signs of diagrams

**Lemma D5-P [proven, temporal reflection criterion].**
ASSUME a reflection cut with positive quotient H_gamma and seam operator
G=sum_alpha w_alpha D_alpha. Arbitrary half-patch insertions span H_gamma.
PROVE reflection positivity for all these tests iff G>=0. In matrix units
this is exactly W^a=[w_(a,mu,nu)]>=0 for each accessible simple block a.

<1>1. A reflected gluing of half amplitudes x_r,x_s has value
Q_rs=<x_r,G x_s>, BY D5-S and the dagger/reflection convention.
<1>2. Its quadratic form is <sum_r z_r x_r,G sum_s z_s x_s>.
It is nonnegative for all choices iff G is positive on their span.
BY the definition of a positive Hermitian operator. The spanning assumption
makes this the whole H_gamma; without it positivity is tested only there.
<1>3. The faithful charge decomposition diagonalizes the algebra into its
simple matrix blocks, so G>=0 iff every W^a>=0. BY the direct-sum order.
Positive categorical trace weights d_a do not change these inequalities.
<1>4. QED BY <1>1–3.

For a general diagram basis write D_alpha^dagger=sum_beta J_(beta,alpha)D_beta.
The Hamiltonian constraints and sufficient exponential prescription are

    c_beta = sum_alpha J_(beta,alpha) conjugate(c_alpha),
    H^a(c)=sum_alpha c_alpha D_alpha^a = H^a(c)^dagger,
    W^a(t)=exp(t H^a(c)) > 0  (t real).

Thus **no condition c_alpha>=0 is necessary** for temporal reflection with
exact exponential tiles. In a dagger-paired basis, cup/cap and directed
hop coefficients are conjugate pairs; in multiplicity matrix units
c_(a,mu,nu)=conjugate(c_(a,nu,mu)). Scalar self-adjoint channels are real.
For an independently chosen transfer tile, positivity instead requires
all principal minors of W^a to be nonnegative. A linearized tile has the
additional restriction 1+t H^a>=0, i.e. lambda_min(H^a)>=-1/t.
These are finite algebraic/spectral conditions, not entrywise sign rules.

There is a second, orientation-dependent constraint if the reflection
plane cuts *through* a different set of tile legs. Expand the crossing
kernel in independent half-diagrams as
K=sum_uv C_uv |v_u><v_v|, including the cut Gram factors. The same proof
gives C>=0 in an orthonormal independent presentation; otherwise it is
positivity of the induced kernel on the quotient. Reshuffling legs changes
this test. Temporal G>=0 does not assert spatial reflection positivity.
Neither complex F entries nor a negative diagram coefficient invalidate
Hilbert positivity. Conversely positive coefficients do not ensure it.

**Lemma D5-R [proven, a reflected brick row].**
ASSUME self-adjoint h_j and disjoint-support commutativity within odd/even
layers. Put A=product_odd exp(t h_j), B=product_even exp(t h_j).
PROVE R=A^{1/2} B A^{1/2} is strictly positive and has derivative
R'(0)=sum_j h_j; chains of reflected half rows have positive Gram matrices.

<1>1. Each layer is positive because its factors commute and are positive.
<1>2. R=(B^{1/2}A^{1/2})^dagger(B^{1/2}A^{1/2})>0, BY <1>1.
<1>3. Differentiate the three factors at zero. The two half odd layers
give one full odd sum; the middle layer gives the even sum. BY product rule.
<1>4. A reflected composite equals V^dagger V; its matrix of mixed
half amplitudes is their Gram matrix. BY D5-S. QED BY <1>1–4.

CA-86's unsymmetrized AB generally is not Hermitian. The replacement above
is an explicit reflection-compatible schedule, not a claim that AB is
positive. At fixed finite volume the product formula approaches exp(-tH)
as the step tends to zero. No uniform-in-volume error rate is inferred.
For t>0 one may normalize R by a positive scalar so 0<R<=1 and define
E_t=-log(R)/t>=0. This finite E_t need not have finite interaction range;
the local Hamiltonian is the derivative at zero, not an arbitrary row log.

**Lemma D5-G [proven, energy-resolved positivity].**
ASSUME E>=0 is a finite self-adjoint collar generator, with projectors P_lambda,
and X maps external states to the cut Hilbert space. PROVE

    Q(t)=X^dagger exp(-tE)X=sum_lambda exp(-t lambda) X^dagger P_lambda X,
    (-1)^k Q^(k)(t)>=0;  [X_r^dagger exp(-(t_r+t_s)E) X_s]_(r,s)>=0.

<1>1. Resolve E spectrally. Each coefficient is (P_lambda X)^dagger(P_lambda X).
<1>2. Differentiate the finite sum; lambda^k exp(-t lambda)>=0.
<1>3. The multi-time quadratic form is
||sum_s exp(-t_s E)X_s u_s||^2. QED BY <1>1–3.

In an infinite limit use a positive operator-valued spectral measure;
to identify individual LC grades additionally prove discrete energy lifts,
finite multiplicities and convergence of the appropriate spectral slices.
RP at one time does not supply this. For example Q(t)=1-(1/2)exp(-t)>0
for t>=0, but its energy-one coefficient is negative. Its two-time kernel
has determinant -(1/2)(exp(-t_1)-exp(-t_2))^2<0 for distinct times.
This elementary witness is the general mechanism behind LC-13's warning.
Finite-lattice all-insertion reflection positivity is the relevant OS input;
it survives convergent finite Gram matrices. Continuity, Euclidean
covariance, spectral/locality conditions and infinite sewing estimates
remain reconstruction hypotheses. No all-n OS theorem is inferred from
one positive four-port function or one positive row.

## Discrete stress, Ward residuals, and curvature

**Lemma D5-W [proven finite identities; conformality conditional].**
ASSUME P2 and differentiable exact tiles, with [e_j,e_k]=0 for |j-k|>1
on the open chain. For a varying local parameter s, PROVE

    partial_s exp(t h(s))
      = integral_0^t exp((t-u)h) (partial_s h) exp(u h) du,
    i[H,e_j]=j_(j-1)-j_j,  j_j=i[e_j,e_(j+1)].

<1>1. Differentiating the finite-dimensional evolution equation for G
gives partial_t(partial_s G)=h partial_s G+(partial_s h)G, initially zero.
Variation of constants gives the displayed integral; differentiating it
back verifies both equation and initial condition.
<1>2. In [sum_k e_k,e_j] only k=j-1,j+1 survive. Their commutators have
the stated signs by the definition of j. QED BY <1>1–2.

Differentiating a patch inserts these local Duhamel derivatives and sums
over tile locations. This is an exact response to its specified couplings
or durations, not yet a Ward identity for arbitrary coordinate changes.
The other stress components require the bounded-support flux and improvement
equations of LC-4: delta(j)=-Dq+r, q-e=Du+s. Generic h need not solve them.

For proposed coordinate connections define W_X=∇_X Z. Product rule gives

    W_X(Z_m ... Z_1)=sum_k Z_m ... Z_(k+1) W_X(Z_k) Z_(k-1) ... Z_1,
    F_out(X,Y)Z-Z F_in(X,Y)
      =∇_X W_Y-∇_Y W_X-W_[X,Y].

The first equation follows by cancelling the interface connections; the
second by expanding the commutator of the induced Hom connection. Include
the anomaly line in “out”. Both are exact algebraic identities. If the
factors are contractions, the first residual norm is at most sum_k ||W_k||;
otherwise include the preceding/following norm products. A growing patch
needs this **total** bound to vanish. Small per-tile error is insufficient.
The second identity explains precisely which curvature equation follows
from vanishing Ward residual; scalarity of curvature is an extra condition.

Use LC-4's prescribed Fourier energy/current modes, with e_j=-h_j and
the (af) velocity/subtraction ledger, on the periodic closure. Demand
their graph-norm limits equal the SAME stress insertions just differentiated.
Finite commutators retain (m^3 c*_n-m c_n)/12 and a residual. Exact finite
Virasoro central charge is not required: taking traces of an exact scalar
Lie defect shows it is a coboundary (LC-2:210–224). A trivial finite
anomaly line therefore does not force zero continuum central charge.
LC-2/LC-3's innerness and formal obstruction complexes remain applicable
fragments; none supplies the missing analytic bounds by itself.

## What survives from topological lines, and what does not

AFM's local pulling-through identities imply closed defect/transfer
commutation and fusion [AFM-D:186–212]. They do not prove a chiral scaling
identification: the authors call that expected and warn that the two fusion
categories generally differ [AFM-J:108,123–128]. Their displayed formulas
also use simplifying self-duality, multiplicity and FS conventions
[AFM-F:175–183]. Here all multiplicities/arrows are retained; application
to a chosen O and arbitrary tile must verify the **oriented local**
pulling-through equation, not just cite its simplified 6j formula.

**Lemma D5-D [proven, bounded defect transport].**
ASSUME the WT-compatible Hilbert embeddings i_n,J_n, uniformly bounded
defects D_(a,n) and their adjoints, and summable operator-norm defects
||D_(a,n+1)J_n-J_nD_(a,n)||<=epsilon_(a,n), with the same for adjoints.
At each scale assume D_1=1, D_a D_b=sum_c N_ab^c D_c and
D_a^dagger=D_(dual a).
PROVE strong limits D_a exist, obey these relations, and commute with
limiting dynamics if the bounded microscopic evolution operators and their
commutation relations converge strongly as well.

<1>1. On an embedded coarse vector telescope adjacent transport errors.
The tail is at most ||v|| sum_(k>=n) epsilon_(a,k). Uniform bounds extend
the resulting limit from the dense union to all of H.
<1>2. Embedded products contain i_n^dagger i_n=1. Products of uniformly
bounded strongly convergent operators converge strongly, by
AB-ab=A(B-b)+(A-a)b. Apply this to each fusion identity and dynamics.
<1>3. Pass inner-product adjoint identities using convergence of both
adjoints; the embedded unit tends strongly to 1. QED BY <1>1–3.

For unbounded endpoints replace these bounds by graph-norm bounds for
every product, as in VR-1; do not claim that they prove normality or DHR
localization. The lemma gives a representation of the fusion *-algebra.
It does not give junction Hom spaces, associators, half-braidings or sectors.
Indeed D_a=d_a 1 satisfies the fusion identities because d_a d_b=sum_c
N_ab^c d_c; it commutes with every H and contains no separating charge data.
This is an algebraic falsification of the fusion-operator-only criterion.
For more than one simple object this scalar fusion-algebra representation is nonfaithful.

For actual chiral sectors require localized locally normal endomorphisms
rho_a with rho_a|A(I')=id, transportable to every interval, together with
convergent charged junctions and tensorators. Global D_a are usually
nonunitary; conjugation by D_a is not the required endomorphism.
Preserve the oriented DHR braiding, and show each map
Hom_B(a,b)->Hom_A(rho_a,rho_b) is bijective. Uniform positive junction
Gram bounds can prove injectivity; they cannot exclude NEW limit intertwiners.
Fullness needs its own approximation/exhaustion argument.

For tube-labelled endpoints the objects are (a,gamma_(a,-)) with a natural
half-braiding satisfying its unit and tensor compatibility, not a alone.
Rep(Tube(C)) corresponds to Z(C) [Tube:507–518]; a representation may omit
blocks, and its energy grading is additional data. If C is modular,
Z(C) is C boxtimes C^rev [B:660–664]. This doubled bookkeeping is not a
proof that the chiral category is doubled or that every full-CFT observable
sector is a pair. A full extension can change the sector category.

**D1 proposal for this note:** the brick lattice targets a full 1+1 theory;
the **chosen chiral subnet** is where modular fidelity is tested. To ask
for B=C requires chiral endpoint/locality data for C. To ask for B=Z(C)
requires centre endpoints and a different chiral realization. A purely
fusion input without either choice has a defect-fidelity target only.
Neither periodic boundary conditions nor commutation with H chooses D1.

## A conditional fidelity theorem with a microscopic upper-bound target

For four cyclically ordered disjoint intervals whose closures cover the
circle, put N=A(I_1) join A(I_3) and M=(A(I_2) join A(I_4))'. Endpoint
points are omitted. This is an inclusion of represented von Neumann
algebras, not the algebraic tube algebra. Define mu_A=[M:N].

**Theorem D5-F [conditional, proved using the local KLM theorem].**
ASSUME:

F1. The same OAR construction has yielded an irreducible, strongly additive,
split conformal net A on a separable Hilbert space, with the stated vacuum
and covariance. These properties are not conclusions of WT-1/VR-1 alone.
F2. Endpoint and junction limits give a fully faithful unitary braided
tensor functor Phi:B->DHR_fin(A), with d(Phi(i))=d_i, preserving the supplied
positive ribbon/duality structure, including twists and orientation.
Localization, local normality and transportability are verified.
F3. On one Hilbert space there are increasing common-unit von Neumann
inclusions N_k subset M_k
with N=join_k N_k, M=join_k M_k, and conditional expectations
E_k:M_k->N_k satisfying, for every positive x in M_k,

    E_k(x) >= (D_B+epsilon_k)^(-1) x,  epsilon_k>=0, epsilon_k -> 0.

The finite-dimensional version makes each inequality a finite-algebra
positive-map problem. The two exhaustions are still required. A normal
expectation on the actual M with bound 1/D_B is an alternative to F3.

PROVE Phi is a braided equivalence onto the complete finite-sector category,
mu_A=D_B, and the categorical modular data match after the declared relabelling.

<1>1. [M_k:N_k]<=D_B+epsilon_k, BY the Pimsner–Popa definition
[KLM:430–443]. The monotone exhaustion theorem [KLM:507–556] gives
mu_A<=liminf_k [M_k:N_k]<=D_B. Both exhaustions, not just N's, are used.
<1>2. A is completely rational BY F1 and finite mu, with modular PCT
in the conformal setting. KLM therefore gives
mu_A=sum_(all simple rho) d(rho)^2 [KLM:688–702,782–792,1719–1729].
Every sector decomposes into finite-dimensional sectors [KLM:1899–1900];
there is no additional infinite-dimensional irreducible sector to omit.

<1>3. The image contributes precisely D_B to this sum.

<2>1. A simple i remains simple because End(Phi(i))=End_B(i)=C.

<2>2. Distinct simples remain inequivalent because their Hom spaces stay zero.

<2>3. Sum d(Phi(i))^2=d_i^2 over these distinct simples. BY F2 and <2>1–2.

<1>4. An additional simple would contribute a strictly positive d(rho)^2,
contradicting <1>1–3. Thus every simple is in the image. Semisimplicity
and additivity give essential surjectivity; F2 gives braided equivalence.
<1>5. Ribbon traces compute the same normalized S and twists under this
unitary ribbon identification. Character T additionally uses E2's c lift;
it is not fixed by <1>4 alone. QED BY <1>1–4 and P5.

This is a **lower plus upper bound** method: endpoints give the lower bound,
annular conditional expectations the upper bound. It replaces a bare
“no extra sectors” assertion by a precise index target. It does not replace
F2's fullness by matching S, fusion dimensions, or a closed-loop spectrum.

**Lemma D5-A [conditional, proved annular exhaustion criterion].**
This gives one explicit way to make F3's most dangerous assumption testable.
Let K_n be increasing finite-dimensional unital represented algebras whose
union is strongly dense in B(H). Choose a dense sequence of unit vectors
xi_l from the common finite-stage core and complementary-local contractions
b_r from finite stages, strongly dense in the unit ball of A(I_2) join A(I_4).
Pass to a cofinal schedule so the first n probes are available at stage n.
On uniformly bounded operators define

    d_n(x,y)=sum_(l<=n) 2^(-l)(||(x-y)xi_l||+||(x*-y*)xi_l||),
    r_n(x)=sum_(r<=n) 2^(-r) d_n([x,b_r],0).

ASSUME M_k subset M are increasing, finite-dimensional, computably represented
annular algebras contained in specified finite stages K_(ell(k)). For all x in
the unit ball of K_n one can find y in the unit ball of M_(m(n)), with
m(n)>=n, such that

    d_n(x,y) <= f(r_n(x))+eta_n,
    eta_n>=0, eta_n -> 0, f nonnegative continuous at 0, f(0)=0. (A)

All quantities in (A) are finite-stage matrix/vector tests, with WT tails
if their norms are evaluated using approximating rather than horizontal
states. The universal quantifier over x and uniform modulus are essential.
PROVE M=join_k M_k. The N exhaustion is supplied separately by locality.

<1>1. Let x be any contraction in M. Strong-* density and the unit-ball
density theorem give contractions x_n in K_n converging strong-* to x,
after a cofinal choice (bounded density as used at [ZW:1133–1135]). This is
bounded-operator approximation, not energy
compression of the positive-cone inequality in F3.
<1>2. For each fixed r, [x_n,b_r]->[x,b_r]=0 strong-*. Uniform bounds
on x_n,b_r and summable probe weights imply r_n(x_n)->0: retain finitely
many r,l, pass to the limit there, and then bound the weighted tails.
<1>3. Choose y_n by (A). The full strong-* metric d=sum_(l>=1) of the
same terms satisfies d(x_n,y_n)<=d_n(x_n,y_n)+4*2^(-n)->0.
Thus y_n->x strong-* BY <1>1–2 and continuity of f at zero.
<1>4. x belongs to join_k M_k. The reverse inclusion follows from
M_k subset M. QED BY <1>1–3.

This is a sufficient **repair estimate**, not an assertion that it holds.
It quantifies the absent step: approximately commuting microscopic
operators must be close to the declared annular algebra uniformly as the
cutoff changes. Mere bounded support or a finite commutant dimension is
insufficient. Proving (A), exact represented inclusions, local normality
and endpoint fullness is part of D5-C, not supplied by finite tube labels.
F3's expectation inequality must hold on the entire positive cone. Passing
only low-energy tests cannot establish an index upper bound.

**Lemma D5-V [negative, proved vacuum-preserving expectation obstruction].**
ASSUME N subset M, Omega cyclic for N and separating for M, and an
N-bimodular conditional expectation E:M->N preserving its vector state.
PROVE M=N.
<1>1. For n in N, <n Omega,E(x)Omega>=omega(n*E(x))
=omega(E(n*x))=omega(n*x)=<n Omega,x Omega>.
<1>2. Cyclicity implies E(x)Omega=x Omega; separatingness implies E(x)=x.
<1>3. Hence M=N. QED BY <1>1–2.
Accordingly F3 does **not** demand a vacuum-preserving annular expectation.
This is distinct from compatible vacuum states in the refinement system.

## Modular bootstrap and character content

The finite torus quantity is an ordinary trace on a declared periodic
Hilbert carrier: Z_(n,a)=Tr(D_(a,n) R_n^m), with a specified seam and shear
for nonrectangular tori. A categorical trace of End_C(O^{tensor L}) is a
different closure until a comparison proves equality. Finite anisotropic
brick weights do not give invariance under modular changes of geometry.

**Lemma D5-M [conditional, modular and Verlinde constraints].**
ASSUME the following in addition to any claimed cell limit:

M1. A rational chiral carrier system with convergent characters transforming
by the declared unitary S,T; finite nonnegative integer full multiplicities
M_ij and unique vacuum M_11=1. Modular invariance is imposed on the resolved
sesquilinear block space, not just a scalar function with dependent characters.
M2. Renormalized lattice traces converge to chi^dagger M chi, including
defect insertions. A sufficient trace-passage bound is trace-norm convergence
of the embedded heat kernels, plus uniformly bounded strongly convergent
defects. Shear and vacuum-energy normalizations are included.
M3. Defects form a unital *-representation of B's fusion algebra, and its
S obeys the Verlinde identity

    N_ab^c = sum_i S_ai S_bi conjugate(S_ci)/S_(1i).

PROVE MS=SM, MT=TM, and every defect joint eigencharacter is one of
lambda_i(a)=S_ai/S_(1i). Every character occurs iff this fusion-algebra
representation is faithful. The multiplicity of occurrence is not fixed.

<1>1. Modular transformations send the resolved coefficient matrix to
S^dagger M S and T^dagger M T. Equality and unitarity give the commutators.
Scalar equality alone gives this conclusion only if all relevant products
of characters are independent; M1 avoids that unjustified inference.
<1>2. Multiply the Verlinde formula by S_ci/S_(1i) and sum over c.
Unitarity gives lambda_i(a)lambda_i(b)=sum_c N_ab^c lambda_i(c).
The square matrix of these characters is invertible since S is invertible.
Thus the complex fusion algebra is a sum of scalar algebras with these characters.
<1>3. Its primitive idempotents act as
p_i=S_(1i) sum_a conjugate(S_ai)D_a. They are mutually orthogonal
self-adjoint projections, sum_i p_i=1, and D_a=sum_i lambda_i(a)p_i.
This follows by applying <1>2 to each scalar summand and the *-structure.
Some p_i can vanish; faithfulness is exactly the absence of that kernel.
<1>4. Trace convergence in M2 permits passage of these insertions:
trace-norm errors times the uniform defect bound vanish; the remaining
strongly convergent bounded difference paired with a trace-class operator
vanishes by finite-rank approximation. QED BY <1>1–4.

To call these operators the **Verlinde lines of the target CFT**, further
identify p_i with its chiral sectors (or, for a full extension, specify the
defect action on each multiplicity space). The spectrum alone supplies
neither this identification nor a braided equivalence. Matching modular
data is weaker than categorical equivalence [MS:121–129,175–179].

In the diagonal tier an additional verified identification gives
Z_a=sum_i lambda_i(a)|chi_i|^2. For a general full extension this formula
need not hold. For a complete set of elementary chiral-algebra-preserving
boundaries, boundary cylinders instead have nonnegative integer
matrices n_a forming a fusion-ring representation; open/closed annulus
sewing imposes the Cardy multiplicity constraint. In our right-dual
convention, the multiplicity of eigencharacter i is M_ii; FRS writes
Z_(i,dual i) [FRS:8033–8046,8237–8253]. These are useful necessary tests.
They are not sufficient all-surface sewing conditions. In particular the
identity modular invariant is always an algebraic option when left/right
data agree; its existence alone does not synthesize the chiral theory.

**Lemma D5-H [conditional, general character-growth obstruction].**
ASSUME c>1, nonnegative weights, a vacuum of weight zero, ordinary positive
characters obeying S covariance with S_(1i)>0, and a vacuum carrier that is
a finite sum of unitary Virasoro highest-weight families. PROVE contradiction.

<1>1. PBW spanning [SC:6664–6666] bounds its character at tau=i beta/(2*pi) by
M exp(beta*c/24) product_(n>=1)(1-exp(-beta*n))^{-1}, with M finite.
Quotienting null states only decreases this upper bound.
<1>2. Let f(x)=-log(1-exp(-x)), positive decreasing. Rectangle comparison
gives beta sum_n f(beta n)<=integral_0^infinity f(x)dx=sum_(k>=1)1/k^2
<=pi^2/6. The integral identity follows by expanding the positive logarithm
series and integrating each term. For the final inequality, integrating x
against sin(kx) on (-pi,pi) gives coefficient b_k=2(-1)^(k+1)/k.
Nonnegativity of integral |x-sum_(k<=K) b_k sin(kx)|^2 and sine
orthogonality give 4*pi sum_(k<=K)1/k^2<=2*pi^3/3. Let K increase.
<1>3. Set beta=2*pi/t. Then log chi_1(i/t)<=pi*t/12+O(1).
But S covariance and positive coefficients give
chi_1(i/t)>=S_11 chi_1(it)>=S_11 exp(pi*c*t/12).
<1>4. Let t tend to infinity. c>1 contradicts <1>3. QED BY <1>1–3.

This generalizes LC-12's conditional genus-one argument. It excludes a
finite-Virasoro-family ansatz, not C and not all candidate c>1 CFTs.
A rational target at c>1 satisfying these hypotheses needs richer vacuum
content: infinitely many Virasoro-primary families within its chiral
algebra. Their multiplicities and sewing are E3 data; they are not supplied
by adding extra category labels. No convergence of characters is proved here.

## Local verification and research record

Command from the repository root:

```bash
PYTHONDONTWRITEBYTECODE=1 python3 explorations/2026-10-22-astra/D5-fidelity-lattice-sewing/checks/check_cells.py
```

The retained `checks/raw_output.txt` records six exact invariant groups:
complex dual-basis conversion, inverse-Gram sewing, reflected row positivity,
energy-resolved positivity, energy continuity and fusion-algebra idempotents.
Five deliberate mutations fail first: use F instead of F^{-T}, use G
instead of G^{-1}, replace the symmetric row by AB, infer reflection
positivity from scalar pointwise positivity, and reverse the current sign.
The restored checks pass. Python/SymPy versions and the producer hash are
in the raw output; `checks/provenance.json` inventories the files and sources.
Largest matrix: 16 by 16. These are finite algebra tests, not evidence of
criticality, a solved CFT, or an instance of D5-C/F/A's all-scale hypotheses.

Context: D5 asks for a fidelity bridge between categorical histories and
continuum sewing. The principal choices were exact exponential tiles,
explicit reflected row scheduling, and a two-sided index argument.
Dead ends rejected: identifying C-loops with DHR charges; equating tube
labels with the full chiral spectrum; using positive diagram weights as RP;
assuming the annular expectation preserves the physical vacuum. The local
AFM source supports the finite symmetry algebra but expressly leaves the
continuum identification open. A skeptical GPT-6.1-xhigh collaborator
checked D5-F/A/H and the reflection arguments; its finite-stage, time-sign
and ribbon-preservation corrections are incorporated. Mathematical review
and exact finite checks are distinct evidence, neither a proof assistant.
All writes remain in this directory. No network, large numerical run,
report-source change, root worklog edit, commit or push was performed.

## Results ledger

- D5-C — **conjectural:** uniform enriched-input synthesis and faithful local KS/OAR realization for every computably presented UMTC.
- P1–P7 / E1–E7 — **proposed:** explicit conventions and additional-data contract; not universal solvability conditions.
- D5-S — **proven finite:** exact patch sewing, inverse Gram and F^{-T} dual-basis transport.
- D5-P — **proven finite:** all-insertion temporal RP iff the accessible seam matrix is PSD; coefficient constraints derived.
- D5-R — **proven finite:** symmetric brick row is positive and differentiates to the local Hamiltonian.
- D5-G — **proven finite:** energy-resolved Gram positivity and a counterexample to pointwise-only tests.
- D5-W — **proven finite/conditional:** Duhamel response and energy continuity; Ward/curvature propagation with explicit residuals.
- D5-D — **conditional proven:** summable bounded transport preserves fusion operators; closed-loop-only fidelity is rejected.
- D5-F — **conditional proven:** full endpoint embedding plus annular index upper bound forces complete braided/ribbon fidelity.
- D5-A — **conditional proven:** a uniform finite-probe repair estimate supplies the complementary-commutant exhaustion.
- D5-V — **negative proven:** vacuum-preserving annular expectation forces equality under cyclic/separating assumptions.
- D5-M — **conditional proven:** resolved modular invariance and fusion algebra determine constraints/eigencharacters, not sector multiplicities.
- D5-H — **conditional proven:** c>1 modular-positive vacuum characters cannot have finitely many Virasoro-primary families.
- Check bundle — **checked:** six exact groups pass and five specified regressions are detected; no continuum certificate is instantiated.

## What this gives the integration

CA-65–CA-74 supply local categorical algebras, placements and state descent.
D5-S makes their morphisms into exact finite cells of CA-86's history sum.
D5-P/R give a reflection-compatible time schedule and expose which
coefficient inequalities matter. Vacuum insertion alone supplies neither
the Hamiltonian nor the unital OAR maps: CA-68/CA-72's corner and vacuum
defect must still be resolved before invoking WT-1. CA-67's regularity and
rotation no-go checklist remains active.

LC-1/LC-9 gain a concrete finite patch object and a location for the
F^{-T} dual-basis issue. LC-10/LC-13 gain a spectral version of positivity
that can be checked before taking a limit. LC-2/LC-3's obstructions and
LC-4's standard KS prescription connect through D5-W, while WT-1 and VR-1
retain their separate state, operator-product and analytic boundaries.

The new fidelity interface is D5-F: endpoint/junction data prove the lower
dimension bound; annular conditional expectations and D5-A prove an upper
bound for the **actual complementary commutant**. This is the part absent
from a central-charge fit, a finite MPO algebra, or formal crossing.
D5-M/H keep the character and extension enrichment visible. Together they
give a model-independent target for an integration shard, without claiming
that any general category presently supplies the required certificates.

## Open problems

1. Synthesize local h_n, refinements and states jointly, with the same
   energy/current stress and certified WT/VR tails; no generic instance is supplied.
2. Prove all-insertion reflected cell convergence, collar trace bounds and
   the geometry-to-stress rule, including null descent and all higher sewing.
3. Extend and verify oriented pulling-through on the actual variable-O
   tower, with multiplicities and FS signs, and construct localized endpoints.
4. Obtain local normality, transportability, braiding/twist fidelity and
   **fullness**; a junction Gram lower bound settles only noncollapse.
5. Construct represented annular inclusions and prove the repair estimate
   with computable uniform moduli. Establish PP inequalities on their full
   positive cones, not just a chosen collection of low-energy states.
6. Identify the chiral subnets of the full periodic limit and prove
   strong additivity, split/locality and projective-unitary integration.
7. Determine compatible conformal lifts, full characters and extension
   data; prove thermal trace convergence and resolved modular covariance.
8. Decide the universal existence conjecture or exhibit a general
   obstruction. Failure of one site object, coefficient ansatz or finite
   cutoff does not refute the conjecture with its declared freedoms.

## Examples table

| Instance or probe | What it calibrates | What it does not prove |
|---|---|---|
| Arbitrary C, scalar D_a=d_a 1 | Fusion multiplication and commutation can survive while all charge separation is lost | No categorical faithfulness follows from loop algebra alone |
| Arbitrary c>1 target satisfying D5-H | A finite number of Virasoro families in the vacuum is impossible | No existence theorem for the necessary extended chiral algebra |
| Complex 2-dimensional unitary basis in `checks/` | F^{-T}=conjugate(F), while F itself fails the dual contraction | No categorical F/pentagon data are being synthesized |
| Semion LC-13 finite skew-dual ansatz | Graded positivity selects primary multiplicity d=2; d=4 has a negative energy-one coefficient despite a pointwise-positive kernel [LC-13:65–115,140–153] | Not all-grade OS positivity or a local lattice construction |
| Fibonacci LC-12 selected c=14/5 lift | Its modular-character assumption excludes finite Virasoro-family vacuum content [LC-12:169–203]; D5-H generalizes the mechanism | Not a solution of its four-port functions, and not the general construction |

## Sources used

All anchors below are local; ranges are inclusive. Bracket abbreviations in
the body expand to these paths. New elementary arguments are proved above;
their matrix invariants are linked to the retained check bundle, not attributed
to a paper. Existing notes are dependencies, not replacement primary sources.

- **P:** `references/text/PenneysUnitaryFusionCategories.md:1012–1019`:
  positive pivotal traces and unitary spherical duality.
- **AFM-F:** `references/cft/AasenFendleyMong2020/source/_fusion_categories_and_diagrammatics.tex:85–88,175–183`:
  dimension character identity and the source's simplifying conventions.
- **AFM-D:** `references/cft/AasenFendleyMong2020/source/_Topological_defect_lines.tex:163–212`:
  local defect transport, transfer commutation, possible nonunitarity and fusion.
- **AFM-J:** `references/cft/AasenFendleyMong2020/source/_applications_of_trivalent_junctions.tex:108–128,708–711`:
  expected continuum interpretation, distinct lattice/CFT categories, tube labels.
- `references/cft/AasenFendleyMong2020/source/_Statistical_mechanics_from_fusion_categories.tex:536–553,785–788`:
  categorical projector weights, Hamiltonian limit and multiplicities.
- **Tube:** `literature/md/2305.14068/2305.14068.md:507–518`:
  tube representations, centre objects and half-braiding/dagger conventions.
- **KLM:** `references/cft-machine/realisation/KawahigashiLongoMuger1999/source.tex:430–453,507–556,688–719,782–792,1719–1729,1861–1900`:
  PP index, genuine monotone exhaustions, net hypotheses, global dimension and modularity.
- **B:** `references/cft-machine/realisation/Bischoff2018/source.tex:364–408,660–664,1108–1167`:
  realization problem/nonuniqueness, centre versus solitons, modular doubling and DHR data.
- **EG:** `references/cft-machine/realisation/EvansGannon2018/source.tex:318–350,473–480`:
  modular data, c modulo eight, chiral extensions/local modules and character-T phase.
- **MS:** `references/cft-machine/realisation/MignardSchauenburg2017/source/paper.tex:121–130,175–179`:
  braided inequivalence despite matching modular data.
- **FRS:** `references/categorical-reconstruction/FuchsRunkelSchweigert2002/source/hep.tex:487–502,5786–5815,6443–6455,8033–8046,8237–8253`:
  full versus chiral data, missing analytic block embedding, modular and Cardy constraints.
- `references/categorical-reconstruction/BrehmRunkel2024/source/main.tex:728–744,799–809`:
  oriented boundary pairing and cutting sums; bilinear pairing is not silently Hermitian.
- **ZW:** `references/lattice-symmetry/ZiniWang2018/source/main.tex:1129–1135`:
  bounded density/diagonal approximation precedent; no general interacting limit imported.
- **SC:** `references/cft/Schottenloher2008/Schottenloher2008.md:6664–6666`:
  PBW spanning used in D5-H; its numerical growth bound is derived here.
- `references/lattice-symmetry/GransSamuelssonEtAl2020/source/Linnea11.5.tex:791–820`:
  energy/current Fourier prescription, with the repository's declared normalization bridge.
- `references/text/HollandsAnyonicChainsAlphaInduction.txt:4399–4402`:
  explicit open scaling-persistence question for the finite defect algebra.

Repository dependencies read and used:

- CA-86, `report/sections/86_spacetime_trotter_dictionary.tex:61–110`, read by
  `git show 1f402aaf96d2ffb9d8efb0684836d4771bbd5f60:report/sections/86_spacetime_trotter_dictionary.tex`;
  this fixes the branch snapshot, not the working-tree include order.
- `report/sections/67_refinement_requirements_obstructions.tex:21–148`:
  OAR/no-go requirements and their source anchors.
- `reconstruction/01_cells.md:15–195`, `02_obstructions.md:38–115,144–224`,
  `03_sewing_deformations.md:18–55,94–170`, `04_cutoff_oar.md:16–159`:
  cell equations, obstructions, residual propagation and analytic boundaries.
- `reconstruction/09_four_port_equations.md:57–132,168–203`,
  `10_four_port_linearization.md:25–67,114–180`: positive sewing, dual bases and variations.
- **LC-12:** `reconstruction/12_fibonacci_four_port.md:169–210`;
  **LC-13:** `reconstruction/13_semion_multiplicity.md:8–41,65–115,140–153`:
  only the general growth/graded-positivity mechanisms enter the body.
- `cft_machine/research/realisation_and_fidelity.md:23–62`,
  `wilson_triangle.md:16–107,131–167`, `virasoro_routes.md:50–177`
  (the latter two paths share the same directory): enriched fidelity, state and mode limits.
- `reviews/2026-07-06_pipeline_consistency_scoping/PLAN.md:244–247`:
  unresolved D1; the present note declares its own target rather than silently deciding it.
- `CONVENTIONS.md:631–738,773–828,1072–1370`:
  site/duality, KS ledger, fidelity and LC/four-port conventions.
- Registration records: `references/cft/SOURCES.md:74–120`,
  `references/cft-machine/realisation/SOURCES.md:1–132`,
  `references/categorical-reconstruction/SOURCES.md:1–128`.

