# H4 — Density, dilution and criticality

2026-10-27. Working proof record; initial skeleton written before minute 10.
Scope: only this directory; local sources only; no commits or Julia suite.
Pillars: **P1** occupation in the indefinite-number carrier and **P4** the
state/refinement interface; **P2** only for the occupation/worldline identity.

## Statement under investigation

For an arbitrary unitary fusion category C and pointed O = 1 ⊕ X, test H4:
(a) bounded ground-state expected occupation forces quadratic few-particle
dispersion; (b) nonzero conformal central charge forces positive microscopic
occupation density; (c) a bare dyadic unital tower necessarily dilutes states;
(d) a dressing must refill the inserted sites to sustain a critical state.
False universal assertions will be replaced by explicitly delimited theorems.

Every result will distinguish the isometry V, its corner map Ad V, the unital
lift α, and the state pushforward σ ↦ [b ↦ σ(V†bV)]. The source convention
CONVENTIONS.md:1571 explicitly distinguishes degree from absolute number.

## Conventions and declarations (before use)

These are note-local declarations: the brief prohibits editing CONVENTIONS.md.
Reuse (am), (an), (ap), (aq), (as), (aw). Write n_j = p1^(j),
N_L = Σ_j n_j, ρ_L(ω) = ω(N_L)/L, Q_(L,m) its spectral projections.
The Hamiltonian sign is H = Σ_j k_j, k_j = k_j†, as in (al)/(an), so a
CA-86 tile h enters as k = −h. Chain length L is not particle number.
For α use CA-90's declared pointed relative half-braiding (L0 + H);
bare fusion data do not supply this datum. V needs only L0.
All finite-dimensional state norms are full dual norms, bounded by 2.
Any periodic translation/seam, finite-band identification, microscopic
coefficient dependence on L, positivity of history weights, or Gibbs-to-ground
comparison is additional declared data, never inferred from C.
Time-integrated occupation means vertical worldline length, not a claim
about Euclidean arclength or fractal dimension.

## A. Spectral claims and the actual few-particle regime

### A0. The universal assertion in H4(a) — negative

**Tags:** any; L0 + arbitrary pointed O with X≠0, fixed local energy and
declared periodic translation; finite spectral obstruction, no R2 reached.

**ASSUME** any such C,O. **PROVE** bounded ground occupation does not imply
gapless quadratic finite-size scaling. Set k=(p1⊗1+1⊗p1)/2.

<1>1. H_L=Σ_j k_j=N_L on a periodic chain. **BY** each site appearing twice.
This diagonal Hamiltonian also needs no braiding for its definition.

<1>2. The all-vacancy vector is the unique ground vector on the all-charge
carrier, and the gap is 1 for every L. **BY** CA-66:65–106: N has eigenvalues
0,…,L, its zero eigenspace is Hom(1,1)=C, and X≠0 gives occupation one.
Thus <N>=0 but the asserted universal L^(-2) gap conclusion fails. QED.

This refutes the **unconditional gapless conclusion**, not the separate
possibility that every *gapless* fixed-density vacuum problem needs further
hypotheses to exclude z=1. If [H,N]≠0, the phrase “spectrum in N≤M sectors”
does not even specify a restriction of H unless that subspace is reducing.
A Galerkin operator QHQ is a different problem; see CA-99:62,97–99.
A bound <N>≤N0 gives only Prob(N>M)≤N0/(M+1), not finite-sector support.

### A1. Fixed-number twist bound with arbitrary fusion fibres — proven

**Tags:** any (declared periodic seam/translation); L0 + pointed O, fixed
nearest-neighbour k=k† with [k,n_1+n_2]=0, fixed-number sector ground state;
finite spectral bound, conditional obstruction to a nonzero L^(-1) sector gap.

**ASSUME** the cyclic translation carries n_j,k_j to n_(j+1),k_(j+1).
Let ψ_L be a normalized translation eigenvector minimizing H in occupation
n, 1≤n≤N0, with energy E_L. Let λ_j^(n) be that sector's ordered eigenvalues,
including multiplicities. Let t be k's Hermitian X0↔0X hopping block and
J=||t||. **PROVE**, for every fixed R with Rn<L,

\[
 0\le\lambda_{R+1}^{(n)}-E_L
 \le 2Jn(2\pi R/L)^2. \tag{A1}
\]

<1>1. Define U_q=exp(iqΣ_(j=1)^L j n_j), q=2πr/L. All n_j commute.
Translation changes U_q by exp(±iqN); the wrapped-site factor is
exp(±iqL n_1)=1. Thus U_qψ has momentum shifted by ±qn.
**BY** the occupation projections' integer eigenvalues. The sign depends
on the chosen shift direction and has no effect on orthogonality.

<1>2. Number conservation splits k into 00, (X0⊕0X), XX blocks.
Conjugation by U_q fixes their diagonal blocks and multiplies the two
hopping blocks by exp(±iq), including the seam since exp(iqL)=1.
For E(q)=<U_qψ,H U_qψ>, therefore

\[
 E(q)+E(-q)-2E_L=2(\cos q-1)\sum_j\langle\psi,t_j\psi\rangle. \tag{A2}
\]

**BY** direct conjugation of each of the four occupation blocks.

<1>3. With s_j=P_(X0)+P_(0X), t_j=s_jt_js_j and
s_j≤n_j+n_(j+1); hence |Σ<t_j>|≤2Jn. Both E(±q)≥E_L because U_q
preserves occupation. A2 gives
0≤E(q)−E_L≤4Jn(1−cos q)≤2Jnq².
**BY** the sector variational principle and 1−cos q≤q²/2.

<1>4. U_(2πr/L)ψ, r=0,…,R have distinct translation eigenvalues because
Rn<L. They are orthogonal, and H has no matrix elements between them
because it commutes with translation. Every vector in their span has
Rayleigh quotient ≤E_L+2Jn(2πR/L)². Diagonalize H in the finite sector:
an (R+1)-dimensional trial space gives A1 by the variational eigenvalue
principle. QED. **BY** <1>1–<1>3.

No tensor factorization of Hom(c,X^n), Laplacian approximation, scalar
interaction or F-symbol choice entered. Contact interactions preserving
local occupation are included. The theorem allows degeneracy, flat bands
and faster closing gaps. It does **not** cover the empty n=0 ground state,
number-changing vertices, or unrestricted low-energy sectors.

### A2. Positive finite-band thresholds have no linear cusp — proven

**Tags:** any (periodic Fourier tier); L0 + an invariant one-particle or
declared finite-band subspace, fixed finite range, L-independent matrices;
finite spectral theorem, no full R2 or CFT exclusion.

**ASSUME** A(k)=Σ_(|r|≤R) A_r exp(irk), A_(-r)=A_r†, on a fixed
finite-dimensional fibre E. Suppose A(k)≥E_*I for all real k and
P=ker(A(k0)−E_*I) has dimension d>0. **PROVE** its d bottom eigenvalues
satisfy 0≤λ_j(k0+q)−E_*≤Cq² near q=0, j≤d.

<1>1. For v∈P, the differentiable scalar <v,(A(k)−E_*)v> has a
minimum zero at k0, so <v,A'(k0)v>=0. Polarization gives PA'P=0.
**BY** positivity on both sides of k0 and finite-dimensional calculus.

<1>2. Taylor's integral remainder gives
||P(A(k0+q)−E_*)P||≤(sup_(|s−k0|≤|q|)||A''(s)||/2)q².
Use the d-dimensional trial subspace P and the same variational argument
as A1<1>4; positivity gives the lower bound. QED.

At allowed momenta within O(1/L) of a threshold, these bands have
O(L^(-2)) energies above E_*. A matching quadratic lower bound needs a
nondegenerate effective Hessian; “z=2” is not automatic. For example the
general finite-band class admits

\[
 A(k)=\begin{pmatrix}2(1-\cos k)&\sin k\\ \sin k&1\end{pmatrix},\quad
 \det A=(1-\cos k)^2,\quad \lambda_-(k)=k^4/4+O(k^6). \tag{A3}
\]

**BY** nonnegative diagonal entries and determinant, and
λ_-=det(A)/λ_+ with λ_+(0)=1. This is a fixed nearest-neighbour symbol.
It is realizable in **every** C by choosing X=1⊕1: on the three unit
multiplicity states put b_(j,a)=|0><a|, a=1,2, and
H=Σ_(i,j,a,b)b_(i,a)†(A_L)_(ia,jb)b_(j,b), where A_L is the Fourier
matrix of A. Then H=B†(A_L⊗I)B≥0, has the empty ground vector, and its
one-particle restriction is A_L. The hard-core constraint does not affect
this positivity computation. This illustrates a quartic branch, not a
claim about the entire many-body gap. No specific category is used.

For N≥2, finite Hom fibres do not make relative-position coordinates
finite: a centre-of-mass reduction generally leaves a fibre growing with L.
A2 cannot be applied to that problem without an additional reduction.
CA-94.10 classifies its positive-square coefficient family only
(CA-94:177–195), not all nearest-neighbour Hamiltonians.

### A3. A uniform occupation bound for the tuned positive family — proven

**Tags:** any (open); L0 + exactly CA-94's positive-square data, μ>0 and
ε=1/L, or CA-99 with α_ε≥a; finite bound plus the already proved R0^c,
off-ladder z=2 limit; no R1/R2 upgrade.

**ASSUME** H_ε is that family, Ω_L=η^L, and
γ=Σ_β κ_β v_β†v_β, a nonnegative scalar. **PROVE** every finite-chain
ground state satisfies <N_L>≤γ/μ.

<1>1. H_ε≥μN_L since all displayed squares are positive; CA-99's extra
contact is positive when α_ε≥a. **BY** CA-94:77–89; CA-99:55–60.
<1>2. Only pair-source squares act on Ω_L. Their energy per bond is εγ,
so <Ω_L,H_εΩ_L>=(1−1/L)γ≤γ. **BY** D_vΩ=−εv and direct expansion.
<1>3. Variational minimization gives μ<N_L>≤E_0(H_ε)≤γ. QED.

The quadratic differential kinetic part and tuned resolvent limits are
CA-94.6 and CA-99.1/99.9, cited rather than re-proved. Those families have
L-dependent coefficients; they are not fixed-h consequences of A0's
hypothesis. Signed-contact CA-99 cases may lack this occupation bound,
and CA-99.1 is explicitly a Galerkin N≤2 theorem.

More generally, a normalized vector sequence converging **strongly** under
CA-77's number-preserving box maps to a normalized Fock vector has ρ_L→0,
even if that vector has infinite mean number. **Proof:** for every M,
N_L/L≤M/L+Q_(N>M); strong convergence gives convergence of each bounded
tail projection, and a fixed Fock vector's tail tends to zero as M→∞.
Thus positive microscopic filling cannot be represented by such a strongly
convergent normal Fock-vector family. This concerns the declared carrier,
not an exclusion of a different continuum representation.

## B. Worldline length and a quantitative KS density obstruction

### B1. What the worldline statement actually proves — proven implication

**Tags:** any (finite Gibbs cylinder with declared closure/trace); L0 +
pointed O, H=H†, β>0; a positive history realization is additional data.
Finite identity, →P2/R1; no R2 or conformal invariance claimed.

**ASSUME** H(μ)=H_0+μN_L and a fixed faithful cyclic trace Tr, ordinary
or spherical as declared, Z=Tr exp(−βH), ω_β(a)=Tr(exp(−βH)a)/Z.
**PROVE**, without assuming [H,N]=0,

\[
 -\partial_\mu\log Z=\beta\omega_\beta(N_L). \tag{B1}
\]

<1>1. Termwise differentiation of the finite-dimensional norm-convergent
exponential series gives
∂_μ exp(−βH)=−∫_0^β exp(−(β−s)H)N_L exp(−sH) ds.
**BY** expanding both exponentials: the beta-integral coefficients give
exactly each possible position of N in the derivative of a power of H.
<1>2. Trace cyclicity makes the trace of the integrand independent of s.
Divide by Z>0 to get B1. QED.

**ADDITIONALLY ASSUME** a positive occupation-history realization, compatible
with the chosen trace and categorical diagrams, with
Z(β,μ)=∫ exp(−μℓ_v(Γ)) dν_(L,β)(Γ), ν≥0, and
ℓ_v(Γ)=∫_0^β N(Γ,s) ds ∈[0,βL]. **PROVE**

\[
 \mathbb E\ell_v=\beta\omega_\beta(N_L),\qquad
 \frac{\mathbb E\ell_v}{\beta L}=\rho_L(\omega_\beta). \tag{B2}
\]

<1>1. Differentiate the history integral; the bounded insertion ℓ_v
justifies differentiation at each finite L,β. **BY** the added realization.
<1>2. Compare its logarithmic derivative to B1. QED.

Therefore positive limiting **Gibbs** filling gives mean vertical occupied
length of order βL (order L² when β is proportional to L). This is the
proved direction. It asserts neither concentration of length nor finite
Euclidean arclength of a scaling curve, and it does not prove criticality.
Ground filling transfers to this statement if, additionally,
|ω_(β_L)(N_L/L)−ω_(gs,L)(N_L/L)|→0. That comparison is not proved here;
β_L proportional to L alone is not a ground-state projection estimate.

CA-86:61–110 supplies a morphism-valued **amplitude** sum with possibly
complex coefficients; CA-80:52–66 removes the first-order tile remainder.
Neither supplies a positive probability measure. CA-80:97–115 explicitly
separates positive operators from signs of diagram coefficients; CA-87:
183–186 warns of signed net weights. No universal finite-density theorem
is contained in Proposition 86.4's fugacity computation. There is no local
source here upgrading these identities to SLE/CLE convergence.

### B2. Cubic KS charge forces filling under local vacuum preservation — proven

**Tags:** any (declared periodic standard KS family, either chirality);
L0 + pointed O, normalized local energy/current, states and the hypotheses
below. Finite inequality; conditional exclusion at the R2 interface.
No R1 or R2 construction is asserted. Serves P1/P4 directly.

**ASSUME** L≥6, a_L=L/(4π), z=exp(2πi/L), Hermitian triple-supported
t_j, and real λ_L with

\[
 v_j=t_j-\lambda_L1,\quad \|v_j\|\le M,\quad
 v_jP_{0,S_j}=0,\quad S_j=\{j,j+1,j+2\},\quad
 P_{0,I}=\prod_{i\in I}(1-n_i), \tag{V}
\]

where M is independent of L and disjoint supports commute. Set
T_m=a_LΣ_j z^(mj)(t_j−ε_L1)+b_Lδ_(m,0)1. For standard left KS,
t_j=k_j−i[k_j,k_(j+1)] (CA-79:52–80; (ap)). Let normalized states ω_L
have closure expectations

\[
 r_{L,m}=\omega_L\!\left([T_m,T_{-m}]-2mT_0
              -\frac{m^3c^*-mc}{12}1\right)\longrightarrow0,
 \qquad m=1,2. \tag{R}
\]

**PROVE** the finite bound

\[
 |c^*|\le176\pi M^2\rho_L(\omega_L)
             +2|r_{L,2}|+4|r_{L,1}|. \tag{B3}
\]

In particular |c*|>0 and M>0 require
liminf ρ_L≥|c*|/(176πM²)>0. For M=0 the conclusion is c*=0.

<1>1. Write W_m=ω_L([T_m,T_(-m)]). Equation (R) gives
W_2−2W_1=c*/2+r_(L,2)−2r_(L,1). **BY** subtracting the two
equations: both T_0 and the linear central coefficient cancel exactly.

<1>2. With C_d=Σ_jω_L([v_j,v_(j+d)]), d=1,2, locality and reindexing give

\[
 W_m=-2ia_L^2\sum_{d=1}^2\sin(2\pi md/L)C_d. \tag{B4}
\]

**BY** expanding the two Fourier sums, pairing displacements d and −d;
the zero-displacement term is zero and all others have disjoint support.
For L≥6 no contributing positive displacement equals its negative.

<1>3. |sin(2x)−2sin x|=2|sin x||1−cos x|≤|x|³. Hence
|W_2−2W_1|≤(π/L)Σ_(d=1)^2 d³|C_d|.
**BY** B4 and 2a_L²(2π/L)³=π/L.

<1>4. Let A_(j,d)=[v_j,v_(j+d)] and Q=1−P_(0,S_j∪S_(j+d)).
Then A_(j,d)=QA_(j,d)Q, ||A_(j,d)||≤2M². **BY** (V), self-adjointness
and the norm product inequality. Restricting ω to this corner gives

\[
 |\omega_L(A_{j,d})|\le2M^2\omega_L(Q)
 \le2M^2\sum_{x\in S_j\cup S_{j+d}}\omega_L(n_x). \tag{B5}
\]

**BY** positivity and 1−∏(1−n_x)≤Σn_x for commuting projections.
These are identities of local categorical morphisms; no Hilbert-space
factorization across fusion constraints is used.

<1>5. Each translated union has 3+d sites and each site belongs to 3+d
unions. Thus |C_d|≤2M²(3+d)ω_L(N_L), whether or not ω_L is translation
invariant. **BY** summing B5.

<1>6. Σ_(d=1)^2 d³(3+d)=44, so
|W_2−2W_1|≤88πM²ρ_L. Combine with <1>1 to obtain B3. QED.

**Sufficient microscopic condition for (V).** If the chosen velocity-normalized
bond energy obeys k_jP_(0,{j,j+1})=λ_LP_(0,{j,j+1}) and
||k_j−λ_L1||≤h uniformly, the current annihilates the empty triple and
has norm ≤2h². Thus M=h+2h² works. Number-changing vertices between
nonempty configurations are allowed; creation from a completely empty
bond is excluded by this hypothesis. The other KS chirality obeys the
same absolute bound with the opposite current sign.

**Relation to VR-1.** For vector states of ψ_L, A4 gives
|r_(L,m)|≤q_(L,m,−m,0)||K_L²ψ_L||; a uniformly bounded right factor
suffices. This estimate is assumed for the selected state family: VR-1's
K is auxiliary, not automatically the physical energy (VR-1:55–82).
For a general state it is enough to verify (R) directly. A4 without any
control of these state expectations is insufficient. CA-91/100's balance
identities contain no replacement for (V) or this state hypothesis.

The coefficient detected is **cubic c***. A genuine Virasoro central
charge additionally uses c=c*. Scalar modes T_m=bδ_(m,0) satisfy the
ledger with c*=0,c=24b, even in the empty state (CA-100:135–138).
A density improvement k_j↦k_j+A_j−A_(j+1) can leave H fixed and alter
KS modes, so (V) cannot silently be imposed by a change of density.

### B3. Connected sites remove (V) in a zero-density stationary family — proven

**Tags:** any (declared periodic local chain); L0 + connected pointed O
(Hom(1,X)=0), fixed bounded bond energy k, stationary translation-invariant
states, and B2's KS normalization/closure hypothesis; conditional R2 exclusion.

**ASSUME** ω_L([H_L,a])=0 for all a, H_L=Σk_j with the same k at every
L, and ρ_L→0. **PROVE** kη²=eη² for a real scalar e. Consequently, if
B2's residual expectations vanish and its velocity-normalized densities
remain uniformly bounded, c*=0. In particular this applies to bounded-
occupation ground states satisfying the stated KS state bounds.

<1>1. For a fixed interval I, 1−P_(0,I)≤Σ_(j∈I)n_j, so
ω_L(P_(0,I))≥1−|I|ρ_L. On its range every local a compresses to the
scalar η^(|I|)†aη^(|I|), since End_C(1)=C. Normalize the projection of a
purifying vector onto this range. Its overlap with the original vector
is √ω_L(P_(0,I)), and the distance between their vector states is
2√(1−ω_L(P_(0,I)))≤2√(|I|ρ_L). Restricting to the local algebra can only
decrease that distance. Thus local states converge in norm to the empty
state. **BY** the two-vector trace-norm computation and orthogonal
splittings (Penneys:219–237); this does not factor the fusion Hilbert space.

<1>2. For fixed local a away from the seam, [H_L,a] has fixed finite support
and bounded norm, being a sum over only overlapping bonds. Therefore
ω_vac([H,a])=0. **BY** <1>1 and stationarity.

<1>3. Connectedness gives the orthogonal decomposition
kη²=eη²+ι²w, with w:1→X². Test <1>2 with the local pair creation
b=(ι²w)η^(2)†. The vacuum bra kills b. In <Ω,HbΩ>, only the matching
bond contributes, with value w†w; on each adjacent bond one occupied site
is untouched and orthogonal to its vacuum. Hence 0=w†w and w=0.
**BY** orthogonal occupation patterns and positivity. QED.

<1>4. Now (V) holds with M=h+2h², h=||k−e1|| in velocity-one units.
Apply B2 along the zero-density sequence to get c*=0. If instead liminf
ρ_L=0, pass to that subsequence to get the same contradiction to c*≠0.
Thus a fixed connected-site system with the declared KS certificate and
controlled ground states requires liminf ρ_L>0. **BY** <1>3 and B3.
If needed, translation-average ground states first: H, N, T_0 and the
two commutators in (R) are translation invariant, so all their
expectations, including the closure errors, are preserved.

For a nonconnected pointed O, the same stationarity tests give only
kη²=eη²+u⊗η−η⊗u: pair creation vanishes, and single-site tests force
the two single-creation amplitudes to sum to zero. The remaining term is
a telescopic density improvement. Subtracting it preserves H but changes
the standard KS density. B4 below removes this remainder using stronger
ground-state and mode-moment assumptions, without changing the chosen density.

### B4. Fixed-density ground states: arbitrary pointed-site exclusion — proven

**Tags:** any (declared periodic standard KS system); L0 + arbitrary pointed
O, one fixed velocity-normalized k=k†, translated uniformly bounded local
representations, ground states and the following mode bounds. Conditional
R2 obstruction, with no R2 construction. Both P1 and P4.

**ASSUME** ω_L are ground states of H_L=Σk_j (translation-averaging is
allowed), and for m=±1,±2,
sup_L ω_L(T_m†T_m)<∞. Also assume (R) of B2 for m=1,2.
**PROVE** c*≠0 implies liminf_L ρ_L>0. In particular bounded expected
occupation is impossible. One-family VR-1 with uniform ||K_L²ψ_L||
for the chosen ground vectors supplies both extra assumptions by A2/A4.

<1>1. Suppose a subsequence has ρ_L→0. B3<1>1–<1>3, without connectedness,
give kη²=eη²+u⊗η−η⊗u. Here u:1→X is understood as its occupied-site
inclusion. Put A=uη†+ηu† and
k'_j=k_j−A_j+A_(j+1). Then k'η²=eη² and H'=Σ(k'_j−e)=H_L−Le.
**BY** the pair test in B3 and the single-site test
b_z=zη†, which gives <u+v,z>=0 for every z:1→X.

<1>2. For any fixed one-site B=B† with η†Bη=0, write
B_m=Σ_j exp(2πimj/L)B_j. Its state second moment is o(L²).

<2>1. For j≠l, P=P_(0,{j,l}) has ω_L(1−P)≤2ρ_L and
P B_jB_l P=0. Splitting into P and 1−P gives
|ω_L(B_jB_l)|≤||B||²(2ρ_L+2√(2ρ_L)). **BY** Cauchy–Schwarz
for the mixed corners and the bound on the (1−P) corner.
<2>2. Sum diagonal and off-diagonal terms:
ω_L(B_m†B_m)≤||B||²[L+L(L−1)(2ρ_L+2√(2ρ_L))]=o(L²).
**BY** <2>1; phases have modulus one. This uses only the two-site empty
projection, including for distant sites, not a clustering assumption.
<2>3. Cauchy–Schwarz and the assumed T_(±m) second moments give
ω_L([T_m,B_(-m)])=o(L), m=1,2. **BY** <2>2.

<1>3. Locality and translation invariance express this exactly as
a_L L F_(L,B)(2πm/L), where
F_(L,B)(p)=Σ_d exp(−ipd)ω_L([t_0,B_d]); only the three sites of t_0
contribute. The coefficients are uniformly bounded and converge to the
empty-state coefficients, by B3<1>1. Thus
L F_(L,B)(2π/L)→0 and L F_(L,B)(4π/L)→0. Taylor expansion with uniformly
bounded second derivative, subtracting these two values, proves

\[
 F_{0,B}(0)=0,\qquad F'_{0,B}(0)=0. \tag{B6}
\]

**BY** <1>2: the difference multiplied by L equals
2πF'_(L,B)(0)+O(1/L). No rate of local-state convergence is assumed.

<1>4. Set J_j=i[k_j,k_(j+1)] and J'_j=i[k'_j,k'_(j+1)]. Directly,
J_j−J'_j=i[H',A_(j+1)]. **BY** expansion: the A–A commutator is zero,
and the remaining two overlapping terms are
i[k'_j+k'_(j+1),A_(j+1)]. Let U_p=Σ_j exp(ipj)u_j denote a one-particle
vector above Ω_0=η^L. Since T'_mΩ_0=0 for m≠0,

\[
 T_m\Omega_0=a_L[(1-e^{-ip})-ie^{-ip}H']U_p,
 \qquad p=2\pi m/L. \tag{B7}
\]

**BY** summing the divergence and the current identity, with H'Ω_0=0.

<1>5. Define E(p) as the finite-range one-particle Toeplitz symbol obtained
by contracting H' between translates of u. It is a fixed real Laurent
polynomial. For allowed periodic momenta p=2πm/L and sufficiently large L,
E(p)=L^(-1)<U_p,H'U_p>. **PROVE** E(p)≥0 for every real p.

<2>1. Ground states satisfy ω_L(C†[H_L,C])≥0 for every fixed local C.
The operator tested has fixed support; B3<1>1 passes this inequality to
the empty state. **BY** H_L−E_0≥0 on C applied to a ground vector,
extended by convexity to ground-state mixtures.
<2>2. Test with compact sums C=Σ_j f_j u_jη_j†. Since H'Ω_0=0, the
result is the one-particle quadratic form of H'. Its matrix has finite
range: k' cannot create from a distant empty bond. Translation makes its
coefficients constant. On a long compact plane wave exp(ipj), divide by
the number of sites; only O(1) boundary terms differ from E(p). Positivity
from <2>1 gives E(p)≥0. **BY** this displayed plane-wave limit.
<2>3. In particular E(0)=0 implies E'(0)=0. **BY** differentiability at
a minimum. No eigenvalue or many-particle dispersion theorem is used.

<1>6. Taking the two probes A and B=i(uη†−ηu†), B7 gives the exact
empty-state polynomials

\[
 F_{0,A}(p)=ie^{-ip}[E(p)+E(-p)],
 \qquad F_{0,B}(p)=2i(1-e^{-ip})\|u\|^2+e^{-ip}[E(p)-E(-p)]. \tag{B8}
\]

**BY** A_(±m)Ω_0=U_(±p), B_(±m)Ω_0=iU_(±p), adjoint pairing
T_m†=T_(-m), and <U_p,U_p>=L||u||². Both sides are fixed Laurent
polynomials, so the identities checked on all allowed Fourier grids hold
for every p. B6 with A gives E(0)=0; <1>5 gives E'(0)=0. B6 with B then
gives 0=−2||u||²+2E'(0), hence u=0.

<1>7. Thus the **original** k preserves the empty bond. B2 applies with
uniform M and yields c*=0 along the zero-density subsequence, contradicting
c*≠0. This proves the stated liminf conclusion. QED.

This resolves the arbitrary-pointed fixed-k case **with the declared KS
state bounds**. It does not cover arbitrary running k_L or velocities
without uniform normalization, or ground states uncontrolled by the VR-1
regularity norms. B4 proves no conformal existence or category fidelity.

## C. Which map dilutes?

### C1. Exact isometric dilution — proven

**Tags:** any (open); L0 + pointed O, dyadic V and arbitrary coarse state σ;
finite R0^c identity, ingredient for R1; no conformal rung claimed.

**ASSUME** the CA-68 insertion V_L. Define the fine state
V_*σ(b) := σ(V_L† b V_L). **PROVE**

\[
 N_{2L}V_L=V_LN_L,\qquad
 (V_*\sigma)(Q_{2L,m})=\sigma(Q_{L,m}),\qquad
 \rho_{2L}(V_*\sigma)=\tfrac12\rho_L(\sigma). \tag{C1}
\]

<1>1. For each coarse site j, n_(2j−1)V_L=V_L n_j and
n_(2j)V_L=0. **BY** the tensor definition of V and p1η=0;
CA-68:51–66,175–181; CA-77:101.

<1>2. Summing proves the first identity. If V_Lψ has coarse occupation m,
it has fine occupation m; decomposing into the finite spectral subspaces
gives Q_(2L,m)V_L=V_LQ_(L,m), with Q_(L,m)=0 for m>L.
**BY** <1>1 and the occupation decomposition CA-77:90–101.

<1>3. Compression is unital and positive since V†V=1, so V_*σ is a state.
Apply σ to the compressed identities and divide the first by 2L. QED.
**BY** <1>2. The **sector probabilities are unchanged**; only filling halves.
Exactly corner-supported consistent states obey the same identities.

### C2. H4(c)'s unital assertion — negative

**Tags:** any (open); L0 + pointed O + CA-90 H, arbitrary fine state ω;
finite/R0^u and an R1 counterexample; no assertion of criticality.

**ASSUME** X≠0 and the CA-90 lift. **PROVE** H4(c)'s displayed formula and
its consequence from WT-1 are false, throughout this general input class.

<1>1. Put N_o=Σ_j n_(2j−1), N_e=Σ_j n_(2j). Then

\[
 \alpha_L(N_L)=N_o,\quad N_{2L}=N_o+N_e,\quad
 \rho_{2L}(\omega)=\tfrac12\rho_L(\omega\alpha_L)
                  +\frac{\omega(N_e)}{2L}. \tag{C2}
\]

**BY** CA-90 Theorem 90.1(ii), Negative 90.N:149–151. This is an
absolute-number identity; degree equivariance alone would not imply it.
The formula in the brief is equivalent to ω(N_o)=ω(N_e), and even when
true it says *equal densities*, not halving.

<1>2. At L=1 take a simple x⊂X with isometry u:x→X and the vector-state
morphism f=(ιu)⊗η:x→O². Then f†f=1_x, ω_f(N_o)=1, ω_f(N_e)=0.
The proposed left side is 1 and right side 1/2. **BY** orthogonal
splittings, Penneys:219–237, and direct compression. No model is selected.

<1>3. The actual unital sector identity is
α_L(Q_(L,m))=1_{\{m\}}(N_o), not Q_(2L,m). For m=1 the state supported
on any nonzero charge summand of X⊗X has old occupation 1 and total
occupation 2. **BY** polynomial functional calculus and d_(X²)=d_X²>0.

<1>4. Let τ_L=Tr_C/d_O^L. CA-97 Proposition 97.5:114–117 gives
τ_(2L)α_L=τ_L, hence every WT-1 drift is exactly zero. On the range of
n_j the categorical dimension is d_X d_O^(L−1), so

\[
 \tau_L(N_L)/L=d_X/d_O>0,\qquad
 \tau_{2L}(V_LV_L^\dagger)=d_O^{-L}. \tag{C3}
\]

**BY** the spherical dimension character (ENO:1700–1706), the trace
normalization CA-77:55–56 and range trace CA-77:183–190. This proves that
even exact compatible states need not dilute. They are also ground states
of the fixed Hamiltonian H=0, if ground-state status without uniqueness is
required. This supplies no nonzero central charge. QED.

CA-96's blocked maps still intertwine the **same V**, so C1 applies.
The single-site identity in C2 is used only for CA-90; blocked H does not
by itself assert preservation of individual original-site occupations.
The tracial counterexample extends to CA-96: its construction is repeated
tensoring with identities and unitary conjugation (CA-96:89–105).

### C3. The extra state hypothesis which really forces dilution — proven

**Tags:** any (open); L0 + pointed O, declared states and bare V; finite
estimate and conditional exclusion of positive-density state transport,
→R1. No negative claim about all R1 states or about R2.

**ASSUME** L_n=2^n L_0 and ρ_n=ω_n(N_(L_n))/L_n. Either assume
δ_n=||ω_(n+1)−V_*ω_n||→0, or use the bare-corner p_n,e_n,q_n of (an)
and assume p_ne_n+2q_n→0. **PROVE** ρ_n→0. In the first case

\[
 |\rho_{n+1}-\rho_n/2|\le\delta_n/2; \tag{C4}
\]

in the second case

\[
 \rho_{n+1}\le\rho_n/2+p_ne_n/4+q_n. \tag{C5}
\]

<1>1. If σ,ω are states and 0≤A≤1, then
|(σ−ω)(A)|=|(σ−ω)(A−1/2)|≤||σ−ω||/2.
**BY** normalization and ||A−1/2||≤1/2. Apply to N_(2L)/(2L)
and C1 to obtain C4.

<1>2. For bare P=VV†, [P,N_(2L)]=0. The P block contributes
p_n τ_n(N_L)/(2L), the complement contributes a number in [0,q_n],
and mixed blocks vanish. **BY** C1 and the spectral occupation basis.
Using <1>1 on N_L/L gives C5. If p_n=0, take p_ne_n=0; ρ_(n+1)≤q_n=1.

<1>3. For b_n→0, a nonnegative sequence satisfying
ρ_(n+1)≤ρ_n/2+b_n obeys
ρ_n≤2^(-n)ρ_0+Σ_(j<n)2^(-(n−1−j))b_j→0.
Split the sum at a fixed J; the finite prefix vanishes and the remaining
sum is at most 2 sup_(j≥J)b_j. **BY** iteration. This proves both claims.
If Σb_n<∞, summing also gives Σρ_n≤2ρ_0+2Σb_n. QED.

WT-1 in CA-81:49–58 assumes summability on each **fixed coarse row**;
it assumes neither C4 nor C5's hypotheses. CA-90.W's bound
d_(k,n)≤p_ne_n+2q_n is one sufficient route, not an equivalence.
For a translation-invariant fine state of density ρ, additionally q_n≥ρ:
N_e≤L_n(1−P) and ω(N_e)=L_nρ. Thus positive-density states cannot satisfy
bare-corner q_n→0. This last inequality uses CA-90's site placement, not
a conformal hypothesis.

**Zero density is weaker than bounded number, even here.** In every C with
X≠0 choose a state χ_(2L) supported on X^(2L), and recursively put
ω_(n+1)=(1−ε_n)V_*ω_n+ε_nχ_(2L_n), ε_n=(n+2)^(-2).
The two summands have orthogonal supports, because the second has all
inserted sites occupied. Thus q_n=ε_n, e_n=0, and the drift bound is
summable; C5 gives ρ_n→0. Nevertheless
ω_(n+1)(N_(2L_n))≥2L_nε_n→∞. **BY** the explicit convex mixture and
geometric growth of L_n. Consequently even a corrected C3 cannot be
combined with a theorem about *bounded* occupation alone. B2/B4 instead
use the actual density, so this logical gap does not affect their use.

## D. Necessary refill and an exact local construction

### D1. The state-dependent occupation balance — proven

**Tags:** any (open refinement); L0 + pointed O, categorical unitary U_L,
W_L=U_LV_L and declared states; finite identity/→R1 constraint. Applying
it to a nonzero-c* system additionally needs B2 or B4 on that same system.

**ASSUME** δ_L=||ω_(2L)−W_*ω_L||→0, where W_*ω(b)=ω(W†bW).
**PROVE**, with g_L=ω_L(V†U†[N_(2L),U]V),

\[
 \rho_{2L}=\tfrac12\rho_L+\frac{g_L}{2L}+\eta_L,
 \qquad |\eta_L|\le\delta_L/2. \tag{D1}
\]

<1>1. W†N_(2L)W=N_L+V†U†[N_(2L),U]V. **BY** C1 and
U†[N,U]=U†NU−N. The latter operator is self-adjoint; g_L is real.
<1>2. Take ω_L, divide by 2L, and apply C3<1>1 to the two fine states.
This gives D1. QED.

Thus if ρ_L,ρ_(2L)→ρ>0, the necessary **mean**, not operator, relation is

\[
 \omega_L\!\left(V_L^\dagger U_L^\dagger[N_{2L},U_L]V_L\right)
       =\rho L+o(L). \tag{D2}
\]

In particular [N_(2L),U_L]=0 is impossible on this state-tracking route.
Noncommutation alone is insufficient: the signed expectation must be
positive and extensive. If U(s) is generated by a Hermitian local G(s)
with ∂_sU=iG(s)U, then
|g_L|≤∫Σ_Z||[N_Z,G_Z(s)]|| ds, by differentiating U†NU. Hence O(1)
total number-changing strength cannot supply D2.

For dressed corner weights q_L→0 and normalized mismatch e_L→0,
δ_L≤2√q_L+e_L: first project/normalize the fine state onto WW†, at
distance ≤2√q_L, then compare its pullback to ω_L. **BY** the same
purification argument as B3<1>1 and contractivity of W-pushforward.
Therefore CA-76's successful global-fidelity route must meet D2.
WT-1 compatibility alone does not imply δ_L→0 (C2's trace witness).

The allowed number-changing channels are exactly the nonzero occupation
blocks of the local categorical algebra (CA-77:93–116). Hops and diagonal
tiles commute with N. Cups/caps and vertices supply changes when their
Hom spaces exist; for nonconnected O, single-vacancy creation channels
also exist (CA-94:235–236). No two-site channel is guaranteed for every X.

**Degree is still a separate question.** For a degree-equivariant bare α,
α^U=Ad_U α obeys

\[
 [N_{2L},\alpha^U(a)]-\alpha^U([N_L,a])
   =U[U^\dagger N_{2L}U-N_{2L},\alpha(a)]U^\dagger. \tag{D3}
\]

**BY** multiplying the commutator out. Thus preserving observable degree
requires the difference U†NU−N to commute with α(A_L), not necessarily
to vanish. Refilling and degree-equivariant observable refinement can
coexist; [U,N]=0 is sufficient, not necessary, for that grading property.

### D2. Every nonzero X permits finite-range neutral refill — proven

**Tags:** any (open); L0 + pointed O with X≠0, a chosen neutral word and
angle θ, arbitrary fixed-range categorical unitary gates. R0^c; with a
supplied local unital lift, R0^u plus an elementary R1 state instance.
No Hamiltonian selection, R2, criticality or fidelity is supplied.

**ASSUME** these data. **PROVE** there is a finite r and a depth-one
range-2r circuit U_L such that, with L=mr+q, 0≤q<r, s=sin²θ,

\[
 (U_LV_L)^\dagger N_{2L}(U_LV_L)=N_L+mr s\,1. \tag{D4}
\]

<1>1. Choose a simple x⊂X. Positive tensor powers of x contain x*,
by CA-97:86–89's dual-closure argument. Hence 1⊂x^r⊂X^r for some finite
r≥1. Choose an isometry v:1→X^r. **BY** rigidity and orthogonal splitting
(Penneys:235–237,485–487). No self-duality of X is assumed.

<1>2. Put e=η^r, f=ι^r v and
u_θ=exp[θ(fe†−ef†)] in End_C(O^r). Then u_θ is unitary,
u_θe=cosθ e+sinθ f, and (u_θe)†N_r(u_θe)=r s.
**BY** e†e=f†f=1, e†f=0 and exponentiation of the resulting 2×2
rotation; N_re=0, N_rf=rf. This is an exact categorical tile exponential,
with anti-Hermitian generator, not a positive imaginary-time transfer tile.

<1>3. Let S_r be CA-96:63–73's finite vacancy shuffle:
S_r(1_(O^r)⊗e)=V_r. Its elementary swap exchanges X0 with 0X and fixes
00,XX, so [S_r,N_(2r)]=0. Set
G_r=S_r(1_(O^r)⊗u_θ)S_r†. Then
(G_rV_r)†N_(2r)(G_rV_r)=N_r+r s 1.
**BY** number preservation of the shuffle and the tensor identity
N_(2r)=N_r⊗1+1⊗N_r before shuffling.

<1>4. Tensor G_r over the m disjoint 2r-site fine blocks and leave the
last 2q sites bare. This gives U_L and D4 by addition. Every gate is a
categorical endomorphism, hence preserves total charge, although it
changes occupation. **BY** tensor interchange and C1 on the tail. QED.

The depth is one when the permitted primitive gate range is 2r. No
decomposition into nearest-neighbour two-site tiles is asserted. If
(G_2) of CA-94.11 holds, every such two-site gate preserves N and every
circuit of them does too; the neutral word must then be used as an
additional range-r tile. CA-80's exact-tile expansion gives a finite
morphism-basis description, not an automatic two-site synthesis theorem.

**Locality and state consequence.** Supply a local unital α_L intertwining
V_L (CA-90 H or CA-96 blocked H), and set α_L^U=Ad_(U_L)α_L.
It intertwines W_L=U_LV_L. Conjugation can add only the intersecting
2r-site blocks to an observable's support, hence enlarges each endpoint
by at most 2r−1; disjoint exterior gates cancel. Thus the dyadic composites
remain a local unital directed system.

Starting with any state and defining ω_(n+1)=W_*ω_n gives p_n=1,e_n=0
and ω_(n+1)α_n^U=ω_n exactly. WT-1 gives its R1 limit state. D4 yields
ρ_(n+1)=(ρ_n+s)/2−s q_n^(tail)/(2L_n), with q_n^(tail)<r. Multiplying
by L_(n+1) and iterating gives

\[
 |\rho_n-s|\le
 \frac{|L_0(\rho_0-s)|+srn}{L_n}\longrightarrow0. \tag{D5}
\]

These elementary positive-density compatible states show refill is
algebraically attainable for general C with declared gates. They are not
claimed to be ground states of a fixed local Hamiltonian or to be conformal.

## Results ledger

- A0 — universal bounded-occupation quadratic-gap assertion: **negative**;
  fixed general-C Hamiltonian H=N has gap 1.
- A1 — bounded nonzero fixed-number twist estimate: **proven**, under local
  number conservation and the declared translation.
- A2 — positive finite-band threshold O(k²) theorem: **proven**; exact z=2
  is not universal (quartic nearest-neighbour branch).
- A3 — bounded occupation for the CA-94/positive CA-99 ground states, and
  zero filling for strongly convergent normal Fock vectors: **proven**.
- B1 — occupation/vertical-worldline-length identity: **proven**; a positive
  history interpretation and ground-to-Gibbs comparison are conditional.
- B2 — quantitative cubic-KS density bound: **proven** under (V),(R) and
  uniform stress bounds; H4's unrestricted version remains unproved.
- B3 — connected-site stationary zero-density families force local vacuum
  preservation: **proven**; with controlled KS closure, c*=0 follows.
- B4 — arbitrary pointed, fixed-k ground states with uniform KS second
  moments and vanishing closure expectations require liminf density>0
  when c*≠0: **proven** (conditional on those explicit certificate inputs).
- C1 — exact vacancy-pushforward density and sector laws: **proven**.
- C2 — unital pullback and WT-1 dilution assertion: **negative**; exact
  general-C counterexample, including positive-density zero-drift trace.
- C3 — quantitative dilution with additional state-fidelity assumptions:
  **proven**; its application to selected physical states is conditional.
- D1 — necessary extensive mean refill under state tracking, and exact
  grading criterion after dressing: **proven**.
- D2 — finite-range neutral refill for any nonzero X: **proven**; supplied
  local unital lifts give elementary positive-density R1 states, no R2.

## Layer tags

Setting any, with open ordered chains for V/α and a declared periodic tier
only where Fourier modes or a Gibbs cylinder are used. Input L0 + pointed O;
α adds CA-90 H (L1 suffices), dynamics adds declared k and states. Reached:
no new rung at initialization. Claimed: finite ingredients/obstructions for
R1 and R2; no R3–R5 assertion.

## Pillar served

P1: distinguish bounded number, zero filling fraction and positive filling.
P4: determine exactly which refinement/state conditions dilute and which
require replenishment. P2: identify the precise spacetime observable.

## What this gives the integration

Pending. CA-88 cells and CA-75 Link (b3) will be updated only to the extent
supported by the proved statements; no blanket negative R1 claim is assumed.

## Open problems

All statements in the initial ledger remain open in this working version.

## Examples table

Pending; examples are checks of the general statements only.

## Sources used

- AGENTS.md (read in full); README.md; report/README.md;
  report/SHARD_CATALOG.md; report.tex.
- CONVENTIONS.md:1450–1483,1524–1543,1564–1575.
- worklog/023_2026-10-27_status_overview.md:18–84,161–215.
- report/sections/66_anyonic_states_variable_n_fock.tex:54–106.
- report/sections/68_variable_n_refinement_maps.tex:51–119,140–150.
- report/sections/76_corner_to_wilson_bridge.tex:90–112,153–180,236–249.
- report/sections/77_pointed_carrier_invariants.tex:47–60,90–116,175–231.
- report/sections/81_cft_machine_oar_contract.tex:49–85,97–114.
- report/sections/86_spacetime_trotter_dictionary.tex:61–110,196–217.
- report/sections/87_dilute_fibonacci_is_blocked_golden.tex:178–187.
- report/sections/88_layered_targets.tex:82–125.
- report/sections/90_local_unital_lift.tex:110–168.
- references/text/PenneysUnitaryFusionCategories.md:219–237,1010–1019.
- references/text/EtingofNikshychOstrikFusionCategories.txt:1700–1706.
- references/cft-machine/proofs/lamport1993.tex:152–175.
