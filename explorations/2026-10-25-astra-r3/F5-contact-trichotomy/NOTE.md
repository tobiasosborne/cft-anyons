# F5 — Contact classification on a pointed categorical carrier

2026-10-25. Initial statement and open ledger saved at the start of the round.
Scope: a general unitary fusion category C, a pointed O=1⊕X, and the carrier
of CA-77. Specific categories appear only as calibration instances.

## Statement under investigation

F5 asserts a trichotomy for α_ε=(c_ε+2t)/ε on P_{≤2}F: finite α_ε gives
Robin collisions with D1 reaction coupling, α_ε→+∞ gives Dirichlet and
sector decoupling, and α_ε→−∞ gives no projected strong resolvent limit.
It further asserts scalar collision data on fusion fibres and extensions to
all occupations and arbitrary range r under (G_r).

The precise distinction between compressing a Hamiltonian and compressing
its resolvent, the scaling of reactions, and the meaning of a general
"diagonal" density must be resolved before any classification is asserted.

## Conventions and scope declared before use

Use CONVENTIONS (am), (aq), (aw): ordered chambers, no factorial, isometric
box embeddings K_ε, collision measure dy=dS/√2, outward flux D=∂₁−∂₂,
inner products linear in the second slot, physical sign H=Σk_j.
Here t>0 is a declared kinetic coefficient; α_ε denotes the *total* scalar
collision coefficient after the −2t tuning. Any extra contact added to the
D1 squares must be distinguished from that total. Nonreal resolvents use
(H−i)^{-1}; real shifts are used only with a common lower bound.
The user's directory-only instruction supersedes edits to CONVENTIONS,
worklog, root reports, and commits; new choices are recorded here first.

## Exact family and the meaning of truncation

All positive results below concern this explicitly declared microscopic family,
not every density described only as "hop plus diagonal". Let the finite lists
and moments `(a,β,ν,Q_b,γ)` be those of CONVENTIONS (aw), with μ>0. Set

```
H_ε(α_ε) = Σ_j [t ε⁻² D_h,j*D_h,j
                  + Σ_ρ λ_ρ ε⁻¹ D_bρ,j*D_bρ,j
                  + Σ_σ κ_σ ε⁻¹ D_vσ,j*D_vσ,j
                  + (α_ε−a) ε⁻¹ P_XX,j] + μ N̂,
c_ε = −2t + ε α_ε.                                      (F)
```

The final equation defines the TOTAL contact coefficient relative to pure
hard-core hopping with its diagonal/end-point completion. Reaction powers
remain exactly those of CA-94.2, namely ε⁻¹/² for b and ε⁰ for v. Multiplying
a fixed nonzero reaction density by ε⁻² is a different problem.
The outer endpoints are those of D_h*D_h, with no added outer penalty.

On F_{≤2}, use `H_ε^{[2]}=P_{≤2}H_εP_{≤2}|Ran(P_{≤2})`, the Galerkin
compression. It retains lower-source squares of reactions whose output has
N>2. This is also the interpretation of the requested old check script
(`E6/checks/review_tuned_convergence.py:6-8`). We abbreviate the E6 directory
by `E6 = explorations/2026-10-22-astra-r2/E6-number-changing-continuum`.

In general `P(H−z)⁻¹P` is NOT `(PHP−z)⁻¹` and need not be a resolvent on
Ran(P). For `H=[[0,g],[g,0]]`, g≠0, and P onto its first coordinate,
the two are `−z/(z²−g²)` and `−1/z`. BY direct inversion. Theorems on the
compression below do not assert the full interacting resolvent is determined
by sectors 0,1,2. N1 is number conserving, so its negative conclusion applies
to either interpretation.

## A1. Exact coefficient reduction on the first three sectors

**Status: proven.** Tags: any/open; L0 plus the data in (F); finite algebra
feeding the off-ladder z=2 limit. Let `U_n=L²(Δ_n;E_{c,n})`, suppressing c
in formulas and summing it when taking norms. On `V=⊕_{c,n≤2}H¹(Δ_n;E_{c,n})`
(H¹ at n=0 means E_{c,0}) define

```
W₀=γ,
W₁=μ I + Q_b + γ I,
W₂=2μ I +(Q_b⊗I_X)+(I_X⊗Q_b)+γ I,
S_c(y)=B_{β,1,1}u_{c,1}(y)+V_{ν,0,0}u_{c,0},
q_α(u)=t Σ_{c,n≤2}∫|∇u_{c,n}|² + Σ_{c,n≤2}〈u_{c,n},W_nu_{c,n}〉
          + α Σ_c∫₀¹|Tu_{c,2}(y)|²dy
          −2 Re Σ_c∫₀¹〈Tu_{c,2}(y),S_c(y)〉dy.             (Q)
```

Endomorphisms act on Hom fibres by postcomposition with the indicated
coherent insertion; W₀ acts only when E_{c,0} is nonzero. No tensor-product
factorization of the physical fusion fibre is assumed.

ASSUME (F) and Galerkin compression. PROVE its discrete form has total
contact α_ε and tends to (Q) on smooth sampled vectors when α_ε→α.

`<1>1.` Multiply out the two D-reaction squares. Their upper trace squares
sum to a ε⁻¹P_XX; the last term of (F) changes this to α_ε ε⁻¹P_XX.
Cross maps are β and ν, and lower diagonals are Q_b and εγ.
BY CA-94.2 and 94.10 (`94_number_changing_collision_dynamics.tex:86-97,177-195`).

`<1>2.` Write u_ε(j)=√ε f₁(j), u_ε(j,k)=ε f₂(j,k), and define A_ε(y)
to be f₂(j,j+1) on cell j, j<L, zero on cell L. Then the collision terms
are EXACTLY `α_ε‖A_ε‖²−2 Re〈A_ε,S_ε〉`, with
`S_ε=β(K_εu_{ε,1})+νu_{ε,0}` restricted to the first L−1 cells.
The kinetic part is t times the graph energy of CA-94.5.
BY inserting the displayed box powers into `<1>1`; all face weights are ε.

`<1>3.` At a configuration, Q_b contributes on each occupied site whose
right neighbour exists and is vacant; εγ contributes for each 00 bond.
This includes outputs in deleted sectors: compressing D*D keeps their
lower diagonal. At fixed n≤2, the number of 00 bonds differs from L by
a bounded number. Thus the pair-source diagonal tends uniformly to γ.
The Q_b defects are supported on outer-endpoint or adjacent-pair strips,
and vanish on smooth samples. Its limit is the sum of insertions on every
particle, giving precisely W₁ and W₂ above.
BY the orthogonal-summand expansion of `<1>1` and counting the empty bonds.

`<1>4.` Apply D1-T7 smooth recovery, with t multiplying its kinetic term,
and `<1>1–3`. All cross terms and potentials converge to (Q).
BY `explorations/2026-10-22-astra/D1-carrier-theory/NOTE.md:483-516`.
This is a form computation, not yet a bounded-energy liminf theorem. QED.

## Proof programme

1. Fix an exact microscopic family and the meaning of P_{≤2} truncation.
2. Establish finite-α convergence and the fibre-valued weak generator.
3. Establish the repulsive Dirichlet limit.
4. Test and, if necessary, replace the attractive no-limit assertion.
5. Determine precisely what extends to full Fock space and range r.
6. Run small, category-independent finite-grid checks and mutation checks.

## N1. A diving pair can have a Dirichlet strong resolvent limit

**Status: proven, negative to F5(a).** Tags: any/open; L0 plus t>0 and
the declared scalar contacts below; R0^c plus an off-ladder z=2 limit.
This proof works on the whole Fock carrier, not only its first three sectors.

ASSUME any C, any nonzero X, no reaction maps, ε=1/L, and physical energies

`H_ε=t ε⁻² Σ_j D_h,j*D_h,j + s_L ε⁻⁶ Σ_j n_j n_{j+1}`,    (N1.1)

where each s_L is either +1 or −1. The sign sequence is arbitrary.
PROVE the projected nonreal resolvents converge strongly on F to the
direct sum of chamber Laplacians with Dirichlet collisions and Neumann
outer endpoints. In particular s_L=−1 refutes F5's negative branch:
`c_ε=−2t−ε⁻⁴`, `α_ε=−ε⁻⁵→−∞`, yet a self-adjoint limit exists.

`<1>1.` The vacuum has energy zero. Fix a charge c and occupation n≥1.
Let G be the exclusion graph on
`1≤j₁<⋯<j_n≤L`, with one edge for each allowed single-site hop. Its degree
is at most 2n. Put `T=t ε⁻² L_G`,
`A(j)=#{i:j_{i+1}=j_i+1}`, `B=1_{A≥1}`, and Q=1−B.
Then `‖T‖≤4nt ε⁻²` and H=T+s_L ε⁻⁶ A, tensor the identity on E_{c,n}.
BY the exact graph identity in CA-94 Lemma 94.5
(`report/sections/94_number_changing_collision_dynamics.tex:124-137`),
and `Σ_edges|u_j−u_k|²≤2Σ_j deg(j)|u_j|²`.
The density-to-c relation is CA-94:80-99 (expand D_h*D_h).

`<1>2.` In Q⊕B blocks write H=[[C,V],[V*,D]]. Since A≥1 on B,
the spectrum of D lies either above ε⁻⁶ or below
`−ε⁻⁶+4nt ε⁻²`. Thus, for fixed n and small ε,

`‖(D−i)⁻¹‖≤2ε⁶`, `‖V‖≤4nt ε⁻²`.

BY positivity of T, the estimate in `<1>1`, and finite-dimensional
Hermitian diagonalization. No lower bound uniform in ε is asserted.

`<1>3.` Gaussian block elimination gives
`Q(H−i)⁻¹Q=[C−i−V(D−i)⁻¹V*]⁻¹`.
This block has norm ≤1 because it compresses a self-adjoint resolvent.
The resolvent identity, `‖(C−i)⁻¹‖≤1`, and `<1>2` give

```
‖Q(H−i)⁻¹Q − (C−i)⁻¹‖ ≤ 32 n²t² ε²,
‖Q(H−i)⁻¹B‖, ‖B(H−i)⁻¹Q‖ ≤ 8nt ε⁴,
‖B(H−i)⁻¹B‖ ≤ 2ε⁶ + 128 n²t² ε⁸.
```

Consequently `(H−i)⁻¹−[(C−i)⁻¹⊕0_B]→0` in operator norm at fixed n.
BY block multiplication; the last constant is a harmless upper bound.

`<1>4.` The killed graph C has an exact spectrum. On Q put
`l_i=j_i−(i−1)` and `m=L−n+1`; eventually L≥2n−1. This is a bijection onto
`1≤l₁<⋯<l_n≤m`. All original particles are isolated, so the diagonal is
`t ε⁻²(2n−1_{j₁=1}−1_{j_n=L})`. It equals the sum of the n Neumann
path-graph degrees at the l_i. Retained moves coincide with strict-order
l-hops; a move into coincidence is killed but its diagonal remains.
Thus C is the exterior n-th power kinetic sum of the Neumann path matrix
on m sites. This exterior-power calculation acts on spatial coordinates
only; it imposes no statistics or braiding on the categorical fibre.
BY the displayed bijection and direct edge/diagonal comparison.

`<1>5.` Define normalized path vectors
`v₀(l)=m⁻¹/²`, `v_p(l)=(2/m)¹/² cos(πp(l−1/2)/m)` for 1≤p<m.
Direct substitution in the interior and endpoint rows gives eigenvalues
`λ_p=4t ε⁻² sin²(πp/(2m))`. Finite geometric sums show orthonormality.
The ordered determinants `det[v_{p_a}(l_b)]`, p₁<⋯<p_n, are therefore a
complete orthonormal basis on Q, with eigenvalues Σ_a λ_{p_a}.
BY `<1>4` and the determinant expansion; restricting the squared
determinant from all n-tuples to ordered distinct tuples divides its
sum by n!, cancelling the determinant's n! norm on all tuples.

`<1>6.` Put `φ₀(x)=1`, `φ_p(x)=√2 cos(πpx)` (p≥1).
Under the ORIGINAL box map K_ε, each fixed determinant above converges
in L²(Δ_n) to `Φ_p(x)=det[φ_{p_a}(x_b)]`, with eigenvalue tending to
`tπ²Σ_a p_a²`. Indeed mε→1, the coordinate shifts are O(nε), and the
excluded collision strips have volume tending to zero; the finitely
many smooth factors converge uniformly elsewhere.
The Φ_p are a complete orthonormal basis of L²(Δ_n): extend a chamber
function antisymmetrically to the cube, expand in product cosine bases,
and antisymmetrize. Cosine completeness can be seen without an analytic
classification theorem: evenly reflect to the period-2 torus; the Fejér
kernels `M⁻¹|Σ_{k=0}^{M−1}exp(iπkx)|²` have average one and concentrate
at zero, so convolution converges in L² by translation continuity
(E6 NOTE:199-211); these convolutions are trigonometric polynomials.

`<1>7.` Define H_D on each sector by this complete eigenbasis with
eigenvalues `tπ²Σ_a p_a²` and the square-summability operator domain.
This is self-adjoint by coordinatewise inversion at ±i. The smooth
eigenvectors vanish on collisions and have zero outer normal derivative;
equivalently its form is t∫|∇u|² with zero collision trace. To verify
the latter identification, zero collision trace permits H¹ odd-reflection
gluing with no distributional jump across each collision plane;
even reflection at outer faces identifies its form with the cube
cosine form; mollification/finite Fourier truncation is a form core.
It is the Dirichlet-collision, Neumann-outer chamber Laplacian.
Convergence on the finite span of Φ_p follows from `<1>5–6` and
`‖(C−i)⁻¹‖≤1`; density proves strong projected resolvent convergence
for all fixed-sector inputs. BY approximation by that orthonormal basis.

`<1>8.` Combine `<1>3` and `<1>7`. Sum over the finitely many charges at
fixed n, then approximate any Fock vector by finitely many sectors.
All nonreal resolvents have norm ≤1, so the tail error is at most twice
the norm of the omitted tail. The direct sum H_D is self-adjoint with
its natural square-summability domain. No n-uniform estimate is needed.
BY the resolvent bound and density. QED.

`<1>9.` For s_L=−1 the basis vector at the adjacent pair (1,2) has
Rayleigh quotient `t ε⁻²−ε⁻⁶` for L≥3. Thus the bottom eigenvalue
diverges to −∞ while `<1>8` still gives a genuine resolvent limit.
BY direct degree counting and the variational bound in finite dimension.
Taking, for example, s_L=(−1)^L instead makes α_ε fail to have ANY
extended-real limit, with the same strong resolvent limit. A classification
by the three proposed α-regimes cannot be an unrestricted iff statement.

**N1 extension [proven; same tags].** The same conclusion holds with
`H_ε=t ε⁻²L_G+(α_ε/ε)A` whenever `|α_ε|ε³→∞`, with arbitrary signs.
ASSUME this growth. PROVE the extension. `<1>1.` At fixed n, the diagonal
block D is separated from zero by at least
`|α_ε|/ε−4nt ε⁻²≥|α_ε|/(2ε)` eventually. `<1>2.` Replace 2ε⁶ in N1
by `2ε/|α_ε|`. The QQ Schur error is at most
`32n²t²/(|α_ε|ε³)→0`, and the other blocks vanish by the same multiplication.
`<1>3.` N1's exact Q spectrum and finite-sector density are unchanged.
QED BY N1 `<1>3–8`. This is a sufficient condition, not a sharp necessity.

## N2. A scalar band-bottom counterterm does not fix internal band gaps

**Status: proven, negative to the literal arbitrary-diagonal claim.**
Tags: any/open; L0 plus the declared density; obstruction to an off-ladder
limit even on N≤2. The result is for an arbitrary category admitting the
declared nonzero object Y; no special fusion rule is used.

ASSUME X=Y⊕Y with Y≠0. Let p be the orthogonal categorical projection
onto the second copy and let a act by zero on the vacancy and by p on X.
Take scalar hopping t>0, no reactions, the critical scalar contact, and add
the fixed self-adjoint diagonal density `(a⊗I_O+I_O⊗a)/2` at scale ε⁻².
PROVE that one scalar band-bottom counterterm cannot give a self-adjoint
projected resolvent limit on the complete carrier.

`<1>1.` Orthogonal copies and p exist by
`references/text/PenneysUnitaryFusionCategories.md:195-237`. Away from
outer endpoints the sum of the added bond densities is a on a single
occupied site. Thus the two internal one-particle bands have energy
offsets differing by exactly ε⁻². Their common scalar band-bottom
subtraction leaves a gap Δ=1 above the lowest branch.
BY two half contributions from the neighbouring bonds.

`<1>2.` Choose c, a unit e∈Hom(c,X) in the higher branch, and nonzero
f∈C_c^∞(0,1). For u_ε(j)=√ε f((j−1/2)ε)e,
`H_εu_ε=ε⁻²u_ε+w_ε`, with `sup‖w_ε‖<∞`.
Contact has no action in sector one, and endpoint changes do not meet
the compact support for sufficiently small ε. BY the finite-difference
remainder calculation of CA-94.1 (`94:69-71`), now with internal gap +1.

`<1>3.` With R_ε=(H_ε−i)⁻¹, multiplication by R_ε gives
`R_εu_ε=(ε⁻²−i)⁻¹(u_ε−R_εw_ε)→0`, while K_εu_ε→fe≠0.
Uniform norm ≤1 then forces any projected strong limit to kill fe.
A self-adjoint resolvent is injective. QED BY `<1>2`.

The separating hypothesis in (F) is the scalar, fibre-independent kinetic
completion. If "diagonal" was intended to forbid internal endomorphisms,
N2 addresses only the broader literal reading; N1 still refutes the
trichotomy under the entirely scalar reading.

## L1. Global signed-contact control, including collision corners

Tags: any/open; category-free finite fibres, hence L0 for the carrier;
an analytic ingredient of the off-ladder z=2 limit. This is the added
control needed for signed contacts; CA-94.5 alone gives weak local traces.


Let E be any finite-dimensional Hilbert space, eps=1/L, L>=2,
I_i=((i-1)eps,i eps), x_i=(i-1/2)eps, and f=(f_ij)_{1<=i<j<=L} in E.
Each unordered legal one-step edge changes exactly one index by one and
retains strict ordering. Put

```
N_eps = eps^2 sum_{i<j} ||f_ij||^2,
E_eps = sum_{legal unordered edges p~q} ||f_p-f_q||^2,
C_eps = eps sum_{i=1}^{L-1} ||f_{i,i+1}||^2.
```

Kf is f_ij on I_i x I_j and zero on same-cell parts of Delta_2.
Thus ||Kf||^2=N_eps. Define the adjacent-face step A_eps on (0,1) by
f_{i,i+1} on I_i for i<L and zero on I_L; ||A_eps||^2=C_eps.
These are the n=2 rescaled amplitudes f=eps^{-1}u of CA-94.5, not the
normalised lattice amplitudes themselves.

**Lemma L1 (global trace and compactness) [proven].** There is C0 independent of L,E,f
such that, for every eta>0,

`C_eps <= eta E_eps + C0(1+eta^{-1}) N_eps.`

If N_eps+E_eps is bounded as eps->0, a subsequence has Kf converging strongly
in L2(Delta_2;E) to u in H1, and A_eps converging strongly in L2(0,1;E)
to the full collapsed collision trace Tu. Both collision endpoints are included.

ASSUME the above array. PROVE the assertions.

`<1>1.` Extend to a square array g by reflection off the diagonal and fill
its diagonal as follows:

```
g_ij=f_ij (i<j),  g_ji=f_ij (i<j),
h_i=g_ii=f_{i,i+1} (i<L),  h_L=g_LL=f_{L-1,L}.
```

Let G_eps be its step interpolation on the full square, and let E_sq be
the sum of squared nearest-neighbour square-grid differences. Then

`eps^2 sum_ij ||g_ij||^2 <= 4 N_eps`,  `E_sq <= 6 E_eps`.

`<2>1.` Off-diagonal entries contribute exactly 2N_eps. The diagonal
sum repeats a subset of the strict-triangle entries at most twice.
`<2>2.` Edges not meeting the diagonal give 2E_eps. Each nonzero additional
diagonal-edge difference is h_i-h_{i-1}, i=2,...,L-1, occurring twice.
Route it along f_{i-1,i} -> f_{i-1,i+1} -> f_{i,i+1}. These two-edge paths
are disjoint as sets of legal edges. Their squared differences sum to at
most 2E_eps. Hence the additional contribution is at most 4E_eps.
Also `sum_{i<L}||h_{i+1}-h_i||^2 <= 2E_eps`. BY the same paths and h_L=h_{L-1}.

`<1>2.` On [x_1,x_L]^2 triangulate every grid square by its southwest-to-
northeast diagonal and interpolate g affinely on each triangle. Extend to
[0,1]^2 by clamping each coordinate to [x_1,x_L]; call this P_eps.
It is continuous and belongs to H1. Direct triangle integration gives

```
||P_eps||_L2(square)^2 <= 2 eps^2 sum_ij ||g_ij||^2 <= 8N_eps,
||grad P_eps||_L2(square)^2 = E_sq <= 6E_eps,
||P_eps-G_eps||_L2(square)^2 <= 12 eps^2 E_sq <= 72eps^2 E_eps.
```

`<2>1.` For a square with vertices a,b,c,d in their geometric order
(a southwest, d northeast), its two triangle gradient integrals sum to
`(||b-a||^2+||d-b||^2+||d-c||^2+||c-a||^2)/2`.
Interior edges therefore have total weight one. Boundary strips contribute
the missing half-weight on boundary edges; corner rectangles are constant.
`<2>2.` Jensen's inequality bounds each triangle value squared by the
barycentric average of its vertex norms squared. A node's integrated weight,
including strips and corner rectangles, is at most 2eps^2.
`<2>3.` In I_i x I_j, every interpolation vertex is in the 3x3 node
neighbourhood of (i,j). Route to it in at most two square edges. Jensen and
Cauchy-Schwarz bound the squared error by twice the sum of squared edges
in that neighbourhood. Every square edge occurs in at most six such
neighbourhoods. Integration proves the last bound. Clamping removes vertices
and does not increase these multiplicities. BY `<1>1`.

`<1>3.` Let F_eps(s)=P_eps(s,s). It linearly interpolates h_i at x_i,
with constant endpoint half-cells. Let B_eps=h_i on I_i. Then

```
||F_eps-B_eps||^2 = (eps/12) sum_{i<L} ||h_{i+1}-h_i||^2
                 <= (eps/6) E_eps,
||B_eps||^2 <= 2C_eps,       ||A_eps||^2 <= ||B_eps||^2.
```

The exact factor 1/12 is the integral of the two half-cell linear errors.
Apply CA-94.3 on Delta_2 to P_eps, with collapsed collision measure ds.
For its trace constant C and 0<d<=1/2 this gives

`C_eps <= 16C d^{-1} N_eps + (12C d+eps/3)E_eps.`

Choose d=min(1/2,eta/(24C)). If eps<=3eta/2, the E coefficient is at
most eta and the N coefficient at most 32C+384C^2/eta. If eps>3eta/2,
the direct subset bound C_eps<=eps^{-1}N_eps<=2N_eps/(3eta) applies.
Thus one safe constant is C0=32C+384C^2+1. This proves the global
infinitesimal trace bound without deleting corner neighbourhoods.

`<1>4.` Bounded N_eps+E_eps makes P_eps bounded in H1 of the square.
Its L2 precompactness follows by a finite-dimensional approximation:
partition the square into m^2 equal squares Q and replace P by its averages.
On a square of side ell,

`int_Q ||P-P_Q||^2 <= 2ell^2 int_Q ||grad P||^2.`

To verify this, subtract first the average in one coordinate and then the
other. The one-dimensional bound follows by writing v(s)-v(t) as the
integral of v' and integrating the Cauchy-Schwarz bound in s,t. Jensen
controls the derivative of the first average. Smooth approximation extends
the calculation to H1. For fixed m the averages lie in a bounded subset
of a finite-dimensional space and have a convergent subsequence. A diagonal
choice as m->infinity gives an L2-Cauchy subsequence of P_eps. Weakly
convergent gradients identify its limit P as H1 by distributional testing.

`<1>5.` The traces F_eps on that subsequence are strongly Cauchy: apply
CA-94.3 to P_eps-P_delta restricted to Delta_2. First take eps,delta->0
in the bulk L2 term, and then take the collar parameter d->0 in the bounded
gradient term. Trace continuity identifies the limit as T(P|Delta_2).
Thus B_eps converges strongly to this trace by `<1>3`. Since A_eps equals
B_eps off I_L and is zero on I_L, it has the same limit: strong convergence
of B_eps and absolute continuity of the limit's L2 integral give
`int_{I_L}||B_eps||^2 -> 0`. This is the corner step that a separated-patch
weak-trace proof alone does not supply.

`<1>6.` On Delta_2, G_eps and Kf differ only in the diagonal half-boxes:

`||G_eps-Kf||^2_L2(Delta_2)=(eps/2)||B_eps||^2 <= eps C_eps.`

Consequently
`||P_eps|Delta_2-Kf||^2 <= 144eps^2 E_eps+2eps C_eps ->0`.
This identifies u=P|Delta_2, gives strong bulk convergence, and completes
the lemma. All constants are independent of the fibre dimension. QED.

**Outer-row corollary.** The same construction and the continuous outer-face
trace inequality give

`eps sum_{i<L}||f_{i,L}||^2 <= C(N_eps+E_eps)`

with a mesh-independent C. Indeed the row step differs from the outer trace
P_eps(s,1) by squared norm `(eps/12)sum_{i<L}||g_{i+1,L}-g_{i,L}||^2`;
apply CA-94.3 to the outer face and `<1>2`. In particular
`eps^2 sum_{i<L}||f_{i,L}||^2 ->0` for bounded N_eps+E_eps.
The one-dimensional analogue uses the centre-node linear interpolation
with constant endpoint half-cells; it has derivative norm exactly the
one-dimensional graph energy and gives `eps||f_L||^2->0`.


## Results ledger

- F5(a), finite Robin regime: open.
- F5(a), positive divergent regime: open.
- F5(a), negative divergent no-limit regime: **negative**, by N1; the explicit counterfamily converges even on full Fock space.
- F5(b), scalar fibre boundary datum with categorical reaction maps: open.
- F5(c), full Fock extension / first required higher contact: open.
- F5(d), range r and (G_r): open.
- Literal fixed-density and projection ambiguities: **negative** for arbitrary internal diagonals (N2); Galerkin/resolvent distinction explicitly resolved above.
- A1, total contact and retained Galerkin source potentials: **proven**.
- Reproducible finite-grid and mutation checks: open.

## Layer tags

Setting: any, open interval; no chiral or full conformal target selected.
Data: L0 plus declared t, contact family, reaction maps and their scaling.
Rung reached: inherited R0^c carrier only at this initial stage.
Rung claimed by F5: R0^c plus off-ladder z=2 contact classification.
No R0^u, R1, R2, R3, R4 or R5 is claimed.

## What this gives the integration

Pending. The CA-88 D1-C row remains derived only for the CA-94 tuned family
until the proof ledger is completed. No conformal-ladder cell moves yet.

## Open problems

All six proof-programme items are initially open; in particular spectral
diving must be separated from failure of strong resolvent convergence.

## Examples table

| Instance | Role | Status |
|---|---|---|
| Any C, any pointed O=1⊕X | Theorem scope | Under investigation |
| Fibonacci and Ising | Small instance rows only | Checks pending |

## Sources used

- `AGENTS.md:1-340`: repository rules, overridden only by the brief's scope.
- `CONVENTIONS.md:1450-1467,1524-1543,1621-1642`: carrier, tags, collision conventions.
- `report/sections/77_pointed_carrier_invariants.tex:207-248`: carrier and tuning caveat.
- `report/sections/94_number_changing_collision_dynamics.tex:50-248`: prior results and target.
- `explorations/2026-10-22-astra-r2/E6-number-changing-continuum/NOTE.md:18-66,135-188`: conventions, analytic source gap, scales.

Local source search has found point-core discussion but no applicable point
interaction / Mosco classification theorem. No network source is used;
new analytic claims require a proof here or a precise prior local derivation.
