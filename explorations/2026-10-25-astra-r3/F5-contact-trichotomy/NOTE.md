# F5 — Signed contact classification on a pointed categorical carrier

2026-10-25. The statement and entirely open skeleton ledger were saved at
05:05 UTC, within two minutes of starting; proved steps were added in place.
Scope: a general unitary fusion category C, a pointed O=1⊕X, and the carrier
of CA-77. Specific categories appear only as calibration instances.

**Result: F5's trichotomy is false.** For the precisely declared D1
family (F) with scalar contact and X≠0, the N≤2 Galerkin resolvents converge exactly when
α_ε=(c_ε+2t)/ε tends to a finite real value OR |α_ε|→∞ (T4).
Finite values give the coupled Robin generator (B1); both divergent signs,
including arbitrarily oscillating signs, give Dirichlet with retained lower
potentials (T3). The proof uses global trace compactness for finite contacts
and an explicit operator-core correction for divergent contacts.
Full-Fock positive families and one deep attractive family are proved;
the signed reacting full-Fock classification and arbitrary range-r densities
remain outside the proved classification. No conformal rung is reached.

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
Abbreviations in line citations: `94` is
`report/sections/94_number_changing_collision_dynamics.tex`; `Penneys` is
`references/text/PenneysUnitaryFusionCategories.md`. E6 is expanded below.

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

## Initial proof programme (completed or delimited in the final ledger)

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


## T1. Every finite signed contact has the stated Robin limit

**Status: proven.** Tags: any/open; L0 plus (F); R0^c plus an off-ladder
z=2 projected-resolvent limit. This extends the positive moment cone at
fixed occupation cutoff; it is not a theorem for arbitrary fixed densities.

ASSUME the exact family (F), Galerkin compression to N≤2, and α_ε→α∈R.
PROVE that its forms converge to (Q), and
`K_ε(H_ε^{[2]}−i)⁻¹K_ε*→(H_α−i)⁻¹` strongly, where H_α is the
unique self-adjoint operator of (Q) on F_{≤2}.

`<1>1.` There are constants M,C independent of small ε such that
`q_ε(u)≥(t/2)E_ε(u)−C‖u‖²`, where E_ε sums the n=1,2 graph energies.
Indeed α_ε≥−M and `‖S_ε(u)‖≤C_S‖u‖`; apply
`2|〈A,S〉|≤‖A‖²+‖S‖²`, then L1 with
η=t/[2(M+1)] to absorb the negative trace term. All discrete lower
potentials are nonnegative. The same continuous estimate follows from
CA-94.3 (`94:108-111`). Choosing z>C, the norm q_α+z‖·‖² is equivalent
to the complete H¹ norm on V; hence q_α is closed and semibounded.
BY A1, L1, and the continuous infinitesimal trace bound.

`<1>2.` Define R_z variationally by
`q_α(v,R_z f)+z〈v,R_z f〉=〈v,f〉` for every v∈V.
The shifted form is a complete Hilbert norm, so Hilbert projection gives
R_z. Density of V gives injectivity and dense range. Define
H_αR_zf=f−zR_zf; the argument `w=R_z(H_α*w+zw)` identifies its adjoint
domain with its domain. This is precisely CA-94.4's construction after
a scalar shift, not an imported representation theorem.
BY `E6/NOTE.md:271-289` and `<1>1`.

`<1>3.` Suppose K_εu_ε converges weakly and the shifted energies are
bounded. Take a subsequence realizing the liminf. Step `<1>1` bounds
its graph energy and L² norm. L1 and its one-dimensional counterpart
give strong bulk and FULL collision-trace convergence after a further
subsequence. The zero-particle space is finite dimensional. Consequently
both the signed α_ε‖A_ε‖² term and the mixed source term converge.
BY L1; strong trace convergence, not weak lower semicontinuity, is the
reason negative α is allowed here.

`<1>4.` The lower potentials converge too. In n=2 the omitted Q_b
contribution is bounded by
`‖Q_b‖ ε²(Σ_{j<L}‖f₂(j,L)‖²+Σ_{j<L}‖f₂(j,j+1)‖²)`;
the first term tends to zero by L1's outer-row corollary and the second
is ε‖A_ε‖². In n=1 it is at most `‖Q_b‖ε‖f₁(L)‖²→0`.
The γ potential differs from γI by at most `(1+2n)εγ`.
Thus the potential limit is exactly Σ〈u_n,W_nu_n〉.
BY A1 `<1>3`, L1, and strong bulk convergence.

`<1>5.` The kinetic liminf has coefficient t, with no interpolation
constant loss: use the exact interior difference-quotient argument of
CA-94.5, not L1's coarse bound. Together with `<1>3–4` this proves
`q_α(u)≤liminf q_ε(u_ε)`. Smooth recovery is A1 `<1>4`; smooth H¹ density
and a diagonal choice give recovery for all u∈V.
BY `94:124-137`, CA-94.3, and the preceding steps. These are the two
Mosco conditions in the fixed box embeddings, proved explicitly here.

`<1>6.` Apply the variational minimizer argument of CA-94.6 to the
shifted forms. Recovery identifies the unique weak limit of minimizers;
strict convexity gives strong convergence, by
`(z−C)‖u_ε−v_ε‖²≤F_ε(v_ε)−F_ε(u_ε)` for recovery v_ε.
Thus projected resolvents converge at every sufficiently large positive
shift. The bounded rational-resolvent transform in `E6/NOTE.md:123-131`
then gives convergence at i. QED BY `<1>1–5` and `94:141-152`.

## B1. Precise fusion-fibre structure of the limit generator

**Status: proven for (F); global H² regularity is not claimed.**
Tags: any/open; L0 plus the declared moments and α; same off-ladder rung.

ASSUME T1. PROVE the following exact weak-domain statement and its
regular-vector boundary interpretation:

```
D(H_α)={u∈V: ∃f∈F_{≤2}, q_α(v,u)=〈v,f〉 for every v∈V},
(H_αu)₂=−t Δu₂+W₂u₂,
(H_αu)₁=−t u₁''+W₁u₁−B_β*Tu₂,
(H_αu)₀=γu₀−∫₀¹ V_ν*Tu₂(y)dy,
t D u₂+α Tu₂−B_βu₁−V_νu₀=0  on x₁=x₂,              (B)
outer normal derivatives = 0.
```

`<1>1.` The first equation is the domain constructed in T1. Test with
vectors compactly supported in one sector's interior. Integration of
the kinetic term by parts yields the three distributional interior
equations displayed; the source pairing against u₁ is pointwise, while
its pairing against u₀ integrates over the insertion coordinate.
BY polarization of (Q) and the inner product linear in the second slot.

`<1>2.` For smooth-enough vectors, Green's identity leaves the collision
term `〈Tv₂,t D u₂+α Tu₂−S(u)〉` integrated against dy. On outer faces
there is only the kinetic flux. Their vanishing is exactly (B) and the
Neumann outer condition. With less regular u₂ these equations mean the
same boundary functional in the variational identity, not a pointwise
normal derivative. BY `∂_ν=D/√2`, `dS=√2dy` as in CA-94.8
(`94:162-167`). No unexplained √2 survives.

`<1>3.` The homogeneous coefficient of Tu₂ is α times the IDENTITY on
each full E_{c,2}; β and ν act by the categorical postcomposition maps,
and Q_b acts through its two coherent insertions in W₂. The fibres,
allowed Hom spaces, and all multiplicities therefore remain present.
BY (Q), `references/text/PenneysUnitaryFusionCategories.md:219,319,394-398,528-530`,
and CA-94.15. Scalar upper collision data do not imply scalar reaction
maps or scalar bulk potentials. QED.

In (aw)'s outward-flux convention, dividing (B) by t gives homogeneous
Robin coefficient α/t; in unit-normal convention it is α/(√2t).
If κ denotes the subleading coefficient in the TOTAL c_ε, then α=κ.
If instead a contact `c_ε^{ext}=−2t+δε+o(ε)` is specified BEFORE adding
the D1 reaction squares, then α=δ+a, with
`a=Σ_ρλ_ρ+Σ_σκ_σ`. These are the explicit affine formulas. The values of
b and v themselves enter S and W, not an additional hidden scalar shift.
The homogeneous scalar datum alone never specifies the coupled generator.
By CA-94.7's mixed-form argument, at finite α occupation is conserved
exactly when β=ν=0; individual nonzero reaction maps may cancel in these
first moments (`94:155-160`).

## T2. Arbitrarily strong repulsion gives Dirichlet with retained potentials

**Status: proven.** Tags: any/open; L0 plus (F); same off-ladder rung.

ASSUME α_ε→+∞. PROVE the N≤2 projected-resolvent limit has form
`q_D=tΣ∫|∇u_n|²+Σ〈u_n,W_nu_n〉` on
`V_D={u∈V:Tu₂=0}`, with sectors decoupled.

`<1>1.` Completing the mixed term gives
`q_ε≥tE_ε+(α_ε/2)‖A_ε‖²−2C_S²α_ε⁻¹‖u‖²`.
Thus bounded shifted energy bounds E_ε and forces A_ε→0 in L².
L1 identifies the limit trace as zero. The remaining kinetic liminf and
potential convergence are T1 `<1>4–5`; the mixed term tends to zero.
BY A1 and Cauchy–Schwarz.

`<1>2.` Smooth diagonal-zero functions are dense in the H¹ trace-zero
space. Indeed extend oddly across x₁=x₂; zero trace removes the
distributional jump term, as checked by testing on the two triangles.
Reflect evenly at the square's outer edges and mollify with a kernel
invariant under exchanging coordinates. This preserves antisymmetry
and hence exact diagonal zero, and converges in H¹ by translation
continuity. BY CA-94.3 and its density proof `E6/NOTE.md:199-229`.
This is an auxiliary spatial extension, not a categorical statistics choice.

`<1>3.` For a smooth such function, sample normally except set every
adjacent f₂(j,j+1) EXACTLY to zero. The replaced samples are O(ε);
there are O(ε⁻¹) of them and bounded graph degree, so the correction's
graph energy is O(ε). Its norm vanishes. Cauchy–Schwarz controls the
change in total kinetic energy. Contact and mixed terms now vanish
identically for every ε, at ANY rate of α_ε divergence.
BY the graph-energy identity and the zero trace. Ordinary sampling
without this correction would not justify arbitrary growth rates.

`<1>4.` Use `<1>2` and a diagonal recovery, followed by the same
variational argument as T1. This proves the claimed strong limit and
its self-adjointness. The form splits by n but W₀,W₁,W₂ survive.
QED. In particular a Dirichlet collision limit is not generally a free
limit: deleting Q_b or γ changes its resolvent.

## T3. Divergent contact of either sign has the Dirichlet limit on N≤2

**Status: proven.** Tags: any/open; L0 plus the exact family (F); R0^c
plus off-ladder z=2 convergence. This is stronger than the counterexample
N1 and does not assume semiboundedness uniformly in ε.

ASSUME `|α_ε|→∞`, with arbitrary signs and rate, fixed reaction data, and
the Galerkin compression in (F). PROVE convergence to the SAME H_D^W
as T2, including its diagonal potentials W_n.

`<1>1.` There is an operator core for H_D^W consisting of vectors with:
u₀ arbitrary; u₁ a finite sum of smooth Neumann cosine modes with fibre
coefficients; and u₂ smooth, odd under swapping its two spatial coordinates,
Neumann on the outer faces, and zero near (0,0) and (1,1).

`<2>1.` N1 `<1>5–7` gives the complete cosine-determinant eigenbasis for
the collision-Dirichlet, outer-Neumann kinetic operator. W₂ is a bounded
constant fibre operator and therefore preserves its graph core. The same
one-dimensional cosine argument applies to u₁ and W₁.
`<2>2.` A finite cosine determinant is O(ρ²), with gradient O(ρ), at either
diagonal corner, where ρ is the distance to that corner. This follows
by Taylor expansion: all cosine first derivatives vanish at 0 and 1,
and the determinant vanishes when x=y. Multiply by smooth radial cutoffs
which are zero at ρ<d and one at ρ>2d. They preserve oddness and outer
Neumann conditions. On their annuli, derivatives of the cutoff have sizes
O(d⁻¹), O(d⁻²). Thus the Laplacian error is O(1) on area O(d²), hence
O(d) in L²; the function and first-derivative errors vanish too.
Let d↓0 AFTER the core approximation. BY the product rule and these
Taylor estimates. This proves graph-core density, with no uniformity in d.

`<1>2.` Fix one vector u in that core. In a diagonal collar use coordinates
`s=(x+y)/2`, `r=y−x`, and let
`g(s)=∂_r u₂(s,0)`. It is smooth and supported away from s=0,1.
Choose a smooth even cutoff χ(r), equal to one near zero and narrow enough
that `G(x,y)=g(s)χ(r)` is supported away from the outer faces. Define

```
S(s)=B_β u₁(s)+V_ν u₀,
Sbar(x,y)=B_β[u₁(x)+u₁(y)]/2+V_νu₀,
F_ε(x,y)=u₂(x,y)+(2t/α_ε−ε)G(x,y)+Sbar(x,y)/α_ε.        (C1)
```

Sbar is symmetric, smooth, and has outer Neumann derivatives because u₁
does. For all charges the formula has the same type E_{c,2}. Sample u₀,u₁
with their usual box powers. In sector two sample εF_ε at cell centres,
EXCEPT that on each adjacent pair j,j+1 replace its rescaled sample by

`a_j=[2t g(jε)+S(jε)]/α_ε`.                              (C2)

Call the full sampled vector v_ε. Since α_ε⁻¹→0, K_εv_ε→u.
BY smooth sampling, (C1), and the next explicit overwrite estimate.

`<1>3.` The overwrite differs from the smooth sample by
`O(ε³+ε²/|α_ε|)`, uniformly on the diagonal strip.
Indeed oddness gives `u₂(s,ε)=εg(s)+O(ε³)`; G(s,ε)=g(s) for small ε;
and symmetry gives `Sbar(s,ε)=S(s)+O(ε²)`. Substitution in (C1) leaves
exactly (C2) at leading order. These estimates also hold near the
endpoints, where u₂ and g are identically zero. BY Taylor's formula.
Only adjacent rows and their one-step neighbours see this overwrite;
the kinetic contribution of its difference is O(ε+|α_ε|⁻¹) pointwise.

`<1>4.` On an interior adjacent row, the only kinetic neighbours are
(j−1,j+1) and (j,j+2). With s=jε their gap is 2ε and their midpoints
are s−ε/2 and s+ε/2. Taylor expansion using (C1) gives

```
2a_j−F_ε(s−ε/2,2ε)−F_ε(s+ε/2,2ε)
        =−2εg(s)+O(ε³+ε²/|α_ε|).
```

Here F_ε(s,r) denotes (C1) in the collar coordinates. The rescaled upper
reaction source on this row is
`S_ε(s)=B_βu₁(s−ε/2)+V_νu₀`.
Consequently its kinetic/contact/source action is

```
t ε⁻²[2a_j−F_left−F_right] +(α_ε/ε)a_j−S_ε(s)/ε
       =[S(s)−S_ε(s)]/ε +O(ε+|α_ε|⁻¹)=O(1).
```

The cancellation is EXACT in its α-dependent terms because (C2) is exact.
There is no remainder proportional to |α_ε|ε or |α_ε|ε², and no restriction
on how fast |α_ε| grows. BY (C2), Taylor's formula, and `D=−2∂_r`.
The O(ε⁻¹) adjacent cells have total box area O(ε), so this bounded
pointwise error contributes O(√ε) to the Hilbert-space residual.

`<1>5.` On the two endpoint-adjacent rows the graph degree is one rather
than two. There u₂=G=0. Since u₁'(0)=u₁'(1)=0, the difference between
the surviving neighbour's Sbar and S(s) is O(ε²); the graph term is
O(|α_ε|⁻¹), and `[S(s)−S_ε(s)]/ε=O(ε)`.
Thus these rows introduce no singular residual. On every other row,
the usual finite-difference Taylor expansion, including centre-node
Neumann endpoint rows, gives −tΔu₂ plus error O(ε+|α_ε|⁻¹), with the
overwrite contribution already bounded in `<1>3`. The pointwise W₂
potential converges except on adjacent/end strips; it is uniformly
bounded there, and the strips' box volume vanishes.
BY direct row substitution and A1 `<1>3`.

`<1>6.` The remaining inter-sector terms also vanish. In the rescaled
one-particle action, the b back-reaction is exactly `−B_β*a_j` at j<L;
in the vacuum action the pair back-reaction is
`−εΣ_{j<L}V_ν*a_j`. Both are O(|α_ε|⁻¹). The one-particle kinetic
and W₁ terms converge by the same smooth difference calculation; the
missing endpoint Q_b and the γ empty-bond errors have vanishing L²
contribution. The vacuum diagonal tends to γ.
BY A1's exact coefficient expansion and (C2).

`<1>7.` Combining `<1>2–6`, for this fixed core vector there is C_u<∞
such that, eventually,

`‖K_εv_ε−u‖+‖K_εH_ε^{[2]}v_ε−H_D^W u‖
                    ≤C_u(√ε+|α_ε|⁻¹)→0`.              (C3)

Box sampling of the smooth target has vanishing error; on its omitted
same-cell strip the target is bounded. Constants depend on the fixed
core vector and its corner cutoff, not on α_ε. BY the row estimates
and counting box volumes, with each categorical map bounded on its
finite-dimensional fibre.

`<1>8.` Let f=(H_D^W−i)u for a core vector and let
`R_ε=K_ε(H_ε^{[2]}−i)⁻¹K_ε*`. Since ‖R_ε‖≤1,

`‖R_εf−K_εv_ε‖≤‖f−K_ε(H_ε^{[2]}−i)v_ε‖→0`.

This follows by applying the finite resolvent to
`K_ε*f−(H_ε^{[2]}−i)v_ε` and using K_ε's isometry. Step `<1>1` makes
these f dense in F_{≤2}; the uniform resolvent bound extends convergence
to every f. QED. Unlike T1/T2, this proof requires no common lower
bound and no real spectral shift.

In particular the fixed, bounded coefficient c_ε=−6t has
α_ε=−4t/ε→−∞ and converges to H_D^W with reactions present or absent.
With reactions absent, an endpoint adjacent-pair basis vector has energy
`−3t ε⁻²+2μ→−∞`. Thus the proposed negative branch fails even for
a bounded constant contact, not only for N1's deeply scaled example.

## T4. The corrected complete scalar-contact classification on N≤2

**Status: proven for the exact family (F), with X≠0.**
Tags: any/open; L0 plus all declared data of (F); R0^c plus off-ladder
z=2 classification. No arbitrary-density or full-Fock classification.

ASSUME (F), X≠0, t>0, and an arbitrary real sequence α_ε.
PROVE that a self-adjoint projected strong-resolvent limit on F_{≤2}
exists IF AND ONLY IF exactly one of the following alternatives holds:

1. `α_ε→α∈R`: the Robin/source operator H_α of T1/B1;
2. `|α_ε|→∞`: the Dirichlet operator H_D^W of T2/T3.

The second alternative allows either sign and unlimited sign oscillation.
The original claimed trichotomy is therefore false, but this precisely
specified scalar-contact family does admit a classification.

`<1>1.` Sufficiency is T1 and T3.

`<1>2.` Different finite α give different closed forms: their difference
on a smooth pure-two-particle vector is `(α−α')‖Tu₂‖²`. There is a
nonzero such trace because X²≠0. To justify this last fact, rigidity gives
a unit summand of X*⊗X (via the nonzero identity of X); if X⊗X=0,
then (X*⊗X)⊗X=0, contradicting that summand X≠0. Its simple summands
give some nonzero E_{c,2}. Finite-α forms have domain V, whereas q_D
has the proper subdomain V_D. BY orthogonal splittings and rigidity
(`references/text/PenneysUnitaryFusionCategories.md:219-237,427-430,484-487`).

`<1>3.` Distinct forms above cannot define the same operator. For any
two of these semibounded forms choose a common sufficiently large z and
write R=(H+z)⁻¹. The exact identity is

`q(u)+z‖u‖² = sup_f [2 Re〈u,f〉−〈f,Rf〉]`,              (U)

with value +∞ off the form domain. For u in that domain, complete the
square with v=Rf; these v are form-dense by CA-94.11's argument
(`E6/NOTE.md:670-677`). Conversely, finiteness makes
`Rf↦〈u,f〉` a bounded functional in the form norm. Riesz on the
form completion gives v with `q_z(v,Rf)=〈u,f〉` for every f. The
variational identity identifies the embedded v with u, proving that
u is in the form domain and establishing (U). Thus the resolvent
determines both the form and its domain. BY Hilbert projection/Riesz
and the displayed square identity.

`<1>4.` Suppose the sequence has a self-adjoint resolvent limit. If it
has no finite clusterpoint, then |α_ε|→∞. If it has a finite
clusterpoint α, every subsequence converging to α has limit H_α by
T1. Any other finite clusterpoint α' would give H_α', and an unbounded
subsequence has a further subsequence with |α_ε|→∞ and limit H_D^W.
Both contradict `<1>2–3` and uniqueness of a strong limit. Therefore
the sequence is bounded and has the unique clusterpoint α, so α_ε→α.
BY elementary real-sequence compactness. This proves necessity. QED.

If X=0, the carrier is just the vacuum line and contacts are invisible;
the necessity direction is deliberately excluded in this degenerate case.
If only α_ε bounded below is admitted, T4 reduces to finite α versus
α_ε→+∞. Spectral diving and resolvent convergence are different questions.

## C1. What extends to the whole Fock carrier

**Status: proven sufficient extension; no full-Fock classification.**
Tags: any/open; L0 plus (F); R0^c plus off-ladder z=2 convergence.

ASSUME the uncompressed family (F), μ>0, and α_ε≥a eventually.
PROVE convergence on the whole Fock carrier whenever
α_ε→α∈[a,∞) or α_ε→+∞.

`<1>1.` For finite α, the proposed form is the CA-94 collision form
with kinetic coefficient t plus
`(α−a)Σ_{c,n,i}‖T_{n,i}u_{c,n}‖²`. It is a sum of nonnegative terms.
The closed-graph proof of CA-94.4 applies with the additional trace
components; its lower-source bound is unchanged. If α=a, simply omit
the extra components, recovering the base form. Finite-particle smooth
vectors are a core by truncation and CA-94.3.
BY `94:113-122` and `E6/NOTE.md:238-269`. No uniform trace constant is used.

`<1>2.` On every fixed finite collection of collision patches/sectors,
CA-94.5 proves the lower bound for the base squares and the extra
nonnegative trace squares. If α=a the latter are discarded; if α>a
their coefficients converge and are bounded away from zero eventually.
Take the supremum after the liminf, exactly as in CA-94.5. D1-T7 and
the core give recovery. The variational proof of CA-94.6 applies on F.
BY positivity and `94:124-152`. This includes approach to a from above;
approach from below is outside this argument.

`<1>3.` For α_ε→+∞, bounded energy forces every fixed collision trace
to vanish. The limit form is

`Σ_{c,n}[t‖∇u_{c,n}‖²+〈u_{c,n},(μnI+Σ_{i=1}^n(Q_b)_i+γI)u_{c,n}〉]`

on its maximal finite-energy domain, with all collision traces zero.
All cross terms vanish, but the lower-source squares survive. This
follows by applying the local liminf to the base reaction squares with
vanishing upper traces, leaving exactly their lower-source-square terms.
The variational argument is again that of CA-94.6. This
domain is closed by sectorwise trace continuity and the nonnegative
energy sum. A finite-sector smooth all-collision-zero core follows
by antisymmetric spatial extension to the cube, even outer reflection,
and permutation-invariant mollification, as in T2 in each fixed n.
At that n set every adjacent-occupation sample to zero. There are
O_n(ε^{−(n−1)}) altered nodes, rescaled amplitudes O_n(ε), and graph
weight ε^{n−2}; the correction energy is O_n(ε). Hence recovery works
at arbitrary contact growth rate, with finite-sector thresholds chosen
before the diagonal limit. BY T2's calculation and positive exhaustion.
QED. The resulting full-Fock limit conserves occupation.

**Correction to the brief's premise.** Lemma 94.5 explicitly says its
constants are NOT N-uniform (`94:135-137`; `E6/REVIEW.md:126-127`).
Its success on full Fock space comes from positivity, finite exhaustion,
and a core. N1 separately supplies a full-Fock attractive counterfamily
without N-uniform estimates because it is number conserving. Adding
μN to N1 changes each fixed-sector resolvent comparison by the fixed
scalar μn and gives the corresponding limit H_D+μN; the proof is unchanged.
Neither argument proves the full-Fock signed reacting classification.

## C2. Negative total contact destroys a uniform Fock lower bound

**Status: proven obstruction, not a no-resolvent theorem.**
Tags: any/open; L0 plus finite α<0 and fixed reactions; off-ladder
semiboundedness obstruction. In particular it does not contradict T3.

ASSUME X≠0 and the formal full-Fock form (Q) generalized to all n by
CA-94.10, with TOTAL α<0. PROVE its values on normalized smooth finite-
sector vectors have no common lower bound, even with all lower remnants.

`<1>1.` Choose real h∈C_c^∞((-1/2,1/2)), ‖h‖₂=1, and put
`A=∫|h'|²>0`, `B=∫|h|⁴>0`,
`h_l(x)=√l h(l(x−1/2))`. For each n choose a unit e_n in a nonzero
E_{c_n,n}; such a fibre exists by the nonzero tensor-product argument
of T4 `<1>2`. The pure-n vector
`u_n(x)=√(n!)∏_{i=1}^n h_l(x_i)e_n` has norm one.
BY integrating a symmetric function over the ordered chamber.

`<1>2.` Its kinetic energy is tn l²A, and
`Σ_{i=1}^{n−1}‖T_{n,i}u_n‖²=n(n−1)lB`.
For the trace identity, combine the possible ranks of the duplicated
coordinate and integrate the other n−2 ordered coordinates. Their
permutation factor is n!/(n−2)!, and the duplicated factor contributes
∫|h_l|⁴=lB. BY direct integration with the collapsed measure, not dS.

`<1>3.` Pure-n mixed source terms vanish, because the other sectors
are zero. Lower potentials contribute at most
`n(μ+‖Q_b‖)+γ`. Choose
`l=|α|(n−1)B/(2tA)`, which fits inside the interval for all large n.
Then

`q_α(u_n)≤−[α²B²/(4tA)] n(n−1)²+n(μ+‖Q_b‖)+γ→−∞`.

QED BY `<1>1–2`. A number-proportional chemical potential does not
restore a common lower bound. A negative EXCESS α−a is not itself
this obstruction: the argument requires negative TOTAL α.

There is no proved particle number at which a three-body contact is
required by the nearest-neighbour family. C1 and CA-94.6 work for all n
with only pair faces. What first occurs at three particles is the
codimension-two trace obstruction for a *separately added* triple-cluster
tile, proved in CA-94.14 (`94:224-227`). Its logarithmic cutoff gives
vanishing H¹ energy with a fixed triple value. It does not select a
triple-contact counterterm or its tuning. A renormalized triple-contact
construction remains an additional problem, not a consequence of F5.

## D1. Scalar collision data and range-r hypotheses have real limits

**Status: proven negative statements and a conditional range interface.**
Tags: any/open; L0 plus the declared density/range; finite algebra and
constraints on off-ladder limits. No stronger target rung is reached.

ASSUME a general categorical density is allowed to have arbitrary internal
diagonal blocks, or assume only (G_r) at range r. PROVE that neither
assumption yields the universal scalar-contact theorem stated in F5.

`<1>1.` Let X=Y⊕Y for any nonzero Y. Then X² is an orthogonal sum of
four copies of Y². Let p project onto one copy and add the fixed
diagonal tile `w π_XX* p π_XX`, w>0, at scale ε⁻² to a nonreacting
scalar-tuned density. Hopping is the identity on the fibre, so p and
1−p reduce the two-particle operator. If the scalar part has α_ε→α,
the p channel has total α_ε+w/ε→+∞, while the complementary channels
have finite α. T1/T2 therefore give Dirichlet on p and Robin on 1−p,
INSIDE each fibre E_{c,2} with Hom(c,Y²)≠0.
BY orthogonal sums (`Penneys:219-237`) and T1/T2 applied componentwise.
Thus F5(b)'s scalar datum is true for (F), not for arbitrary XX diagonals.

`<1>2.` Under (G_r), number-changing blocks vanish by CA-94.11, which
we cite rather than re-prove. This says nothing about the internal
conserving blocks. More explicitly, if Y satisfies (G_r), so does Y⊕Y:
`Hom((Y⊕Y)^p,(Y⊕Y)^q)` is a matrix amplification of
`Hom(Y^p,Y^q)` and hence is zero for p≠q≤r. The nonscalar diagonals
in `<1>1` and N2 are still allowed. N2 supplies absence of a full
self-adjoint resolvent limit despite scalar contact tuning. Every
nearest-neighbour density is also a range-r density for r≥2.
BY distributivity, N2, and `94:199-212`.

`<1>3.` Even after restricting to fibre-scalar hopping/contact, a general
range-r density needs a specified kinetic form, coercivity, endpoint
completion, and contact stencil. CA-94.13 proves only the estimate
`‖A_ε−A'_ε‖²≤C_{n,r}εE_{ε,n}` for bounded-length paths with bounded
edge multiplicity. This transfers collision traces when nearest-neighbour
energy is controlled; it does not provide that control or a boundary
consistency theorem for every density. The positive-form argument extends
conditionally with precisely CA-94.13's stated core/recovery/source
hypotheses. An either-sign classification at range r additionally needs
an analogue of T3's explicit boundary-row correction. QED concerning
the insufficiency of (G_r); that general extension is not proved here.

Without (G_r), the local occupation blocks are
`⊕_{|S|=p,|T|=q}Hom(X^⊗p,X^⊗q)`. Their actual morphisms and coherent
insertions determine the source maps; conserving blocks include
End(X^⊗p) and can supply matrix collision data. At larger range their
fusion-tree presentations use associators/F-matrices. The moment/support
cones of CA-94.10 and CA-94.15 remain relevant. If Hom(1,X)≠0, bulk
single-particle source tiles also exist and lie outside (F)
(`94:235-236`). These are L0 data plus declared coefficients; no braiding
or modular input is implicitly supplied. Bare fusion multiplicities alone
do not fix the maps or their scalings.

## Checks and research record

Commands from the repository root (single BLAS thread; no Julia):

```bash
OPENBLAS_NUM_THREADS=1 OMP_NUM_THREADS=1 python3 explorations/2026-10-25-astra-r3/F5-contact-trichotomy/checks/review_tuned_convergence.py
OPENBLAS_NUM_THREADS=1 OMP_NUM_THREADS=1 python3 explorations/2026-10-25-astra-r3/F5-contact-trichotomy/checks/graph_core_vectors.py
```

The first command modifies the requested E6 check into a finite-fibre
builder plus independent invariants and scans. `contact_fibres.py` accepts
charge-sector dimensions, fibre maps B,V, and the two Q_b insertions.
Its N≤2 matrix agrees at L=4 with an independently built 81-dimensional
full tensor-chain oracle compressed to 33 dimensions. This calibrates the
fibre API and retained outgoing diagonals; it is not a general category
compiler. The generic coordinate scans use L=12,24,48,96; named categories
appear only as the small fusion-dimension instance rows below.

`review_tuned_convergence_output.txt` records ALL GREEN, Python/NumPy/SciPy
versions, source-script SHA256 hashes, and the 16.228-second final rerun.
Six deliberate regressions are caught: deleting the critical attraction,
rebuilding reflecting rather than principal kinetic diagonals, confusing
Dirichlet with reflecting spectra, wrong v power, wrong b power, and
missing outgoing reaction diagonals. The squeezed spectra are checked at
n=2 and n=3; a dense resolvent check verifies N1's Schur estimate.

Headline finite observations (not proofs of an infinite-dimensional limit):

| Scan / invariant | Coarse → fine | Meaning |
|---|---|---|
| α=+L, Dirichlet-probe relative resolvent error | 0.17817 → 0.02343 | Repulsive branch approaches the predicted operator. |
| α=−L⁵, same error | 0.18922 → 0.02369 | Deep attraction approaches the same operator. |
| α=−L⁵, adjacent-pair Rayleigh witness | −2.986e6 → −7.828e11 | Spectral diving coexists with that approach. |
| α=−4L (fixed c=−6 at t=1), same error | 0.28281 → 0.03411 | Bounded constant attractive contact calibration. |
| α=(−1)^L L⁵, L=12,25,48,97, same error | 0.18919 → 0.02345 | The signs really alternate; signed α need not converge. |
| Reacting finite α=2, N=2 norm of vacuum resolvent response | 0.13792 → 0.12208 | Reaction coupling persists. |
| Reacting α=L, same N=2 response | 0.03132 → 0.00383 | Repulsive decoupling. |
| Reacting α=L, vacuum target error at L=96 | 0.00915 with γ; 0.85591 if γ omitted | Lower diagonal remnants matter. |

`graph_core_vectors.py` independently checks the manufactured Laplacian
by differentiation stencils, the exact affine-collar cancellation, and
residuals for slow ±√L, deeply negative, and alternating contacts.
`graph_core_output.txt` records ALL GREEN in 16.203 seconds, hashes and
versions. Two further mutations are caught: reversing the normal sign and
omitting the mesh correction −εG. For the resolved deep-negative probe,
operator residuals at L=24,48,96 are 1.14583, 0.59932, 0.30472; the wrong-sign
residual grows 7.0063, 9.0398, 12.4562. Slow-contact residuals decrease but
are still large on these grids; no small-error or numerical rate theorem is
claimed. These residual checks support T3's finite algebra, not its core
or density proof.

**Frictions and decisions.** Weak traces from CA-94.5 do not justify
subtracting a signed trace norm; L1 supplies strong trace compactness.
An initial narrow manufactured probe was underresolved at L=24 and its
first-to-last decrease assertion failed. The raw graph-core output preserves
that failed calibration and its source-norm mismatch. Widening the smooth
probe, then checking its norm by exact polynomial Gauss quadrature, resolved
it; no Hamiltonian or convergence assertion was changed. The first attractive
counterexample was N1's Schur limit; the later graph-core correction proved
T3 for all divergent absolute values. N1 remains useful for the independent
full-Fock result. Galerkin compression and the total/contact-excess convention
were fixed before derivation to prevent different operators sharing a label.

Two GPT-6.1 xhigh mathematical collaborators, including a sceptical reviewer,
and a separate check implementer assisted. The finite sums, operator domains,
corner estimates, and graph residuals were rechecked against the local record;
the final scripts were rerun by the primary agent. Their derivations are retained
in `checks/analytic_lemma.md` and `checks/divergent_contact_graphcore.md`, with
this NOTE's complete structured proofs authoritative. Agreement is not used as
a proof step. All files are confined to this F5 directory; no network,
report/convention edits, Julia suite, commits, or pushes were used.

## Results ledger

- Original F5(a) negative-divergence/no-limit branch — **negative**: T3, even for fixed bounded c=−6t; N1 also gives a full-Fock counterfamily.
- A1, total contact and retained Galerkin source-square potentials — **proven** by exact tile expansion.
- L1, global infinitesimal trace bound and strong compact traces — **proven**, including both collision endpoints.
- T1, every finite real contact parameter for (F) on N≤2 — **proven** by signed-form Mosco convergence.
- B1, scalar homogeneous collision coefficient and categorical reaction maps for (F) — **proven** with an exact variational domain.
- B1, global H² regularity / pointwise boundary equations on every domain vector — **conditional** on a separate regularity theorem; not used.
- T2, arbitrary-rate positive divergence on N≤2 — **proven**; the Dirichlet limit retains W₀,W₁,W₂.
- T3, arbitrary-sign/rate divergent absolute contact on N≤2 — **proven** by explicit graph-core approximants without a common lower bound.
- T4, complete scalar-contact classification for exact family (F) on N≤2, X≠0 — **proven**: finite parameter convergence or divergent absolute value.
- N1, deep attractive and sign-oscillating Dirichlet limits on full Fock space — **proven**, with the stated stronger sufficient growth condition.
- C1, full-Fock finite or positive-infinite contact with eventual α_ε≥a — **proven** by nonnegative exhaustion and recovery.
- C2, cubic instability for fixed negative total α on full Fock space — **proven** as a semiboundedness obstruction, not a no-resolvent theorem.
- F5(c), unrestricted signed reacting full-Fock classification — **conditional** on new global domain and approximation control; no such theorem is claimed.
- Automatic necessity of a three-body counterterm just because N=3 is reached — **negative** as a universal assertion: C1/CA-94 already handle all N with pair faces.
- Renormalized independent triple-cluster interactions and their tuning — **conjectural**; CA-94.14's trace obstruction remains.
- N2 / D1, arbitrary internal diagonals imply a scalar Robin classification — **negative**: unaligned bands or mixed Robin/Dirichlet channels.
- F5(d), (G_r) alone implies the same range-r classification — **negative**; it forces occupation conservation only.
- D1, larger-range positive convergence with the stated control/trace/core/source hypotheses — **conditional** as in CA-94.13; signed classification also needs boundary consistency.
- Finite-fibre scans, independent matrix/spectral oracles, and eight caught mutations — **proven** finite checks; raw outputs and commands are recorded above.

## Layer tags

- **Setting:** any with respect to chirality; an open interval and ordered configurations. No chiral or full conformal target is selected.
- **Data layer:** L0 unitary fusion data, pointed O=1⊕X, and explicitly declared t>0, contact sequence, reaction morphisms, weights, μ, endpoints and truncation. L1–L4 are unused. Scalar internal kinetic/contact action is an additional microscopic hypothesis, not a consequence of L0.
- **Rung reached:** inherited R0^c carrier plus the off-ladder z=2 resolvent theorems and restricted classification stated above.
- **Rung claimed by F5:** R0^c plus universal contact classification. Its unrestricted claim is refuted; the exact-family N≤2 classification is proved.
- **Not reached:** R0^u, R1 Wilson-triangle state, R2 modes, R3 conformal theory, R4 fidelity or R5 CFT functoriality.

## What this gives the integration

The CA-88 D1-C row (`report/sections/88_layered_targets.tex:153,167-177`)
can be sharpened to: **the N≤2 Galerkin restriction of the explicit scalar
D1 moment-deformation family is classified in projected nonreal resolvent
sense.** Finite total α gives the coupled Robin operator; both divergent
signs give Dirichlet with retained lower potentials. Target 94.16's negative
branch and its unrestricted iff wording must not be promoted.

The whole D1-C row cannot simply be relabelled “classified”: the interacting
full-Fock signed problem and arbitrary fixed h are not settled by T4, and
N2/D1 show that their extra hypotheses matter. C1 enlarges the established
whole-Fock positive family, and C2 identifies exactly why a common lower-bound
proof is unavailable for negative total α. The scalar contact hypothesis,
aggregate source maps, Galerkin remnants, and chirality/data/rung tags give
precise interfaces for later integration. No conformal-ladder cell moves.

## Open problems

1. **Signed reacting full-Fock domain lemma.** For the exact microscopic family with finite negative total α, construct a self-adjoint full-Fock limit and a dense operator core, or exhibit a genuine failure of its projected nonreal resolvents. C2 rules out a common semibounded-form argument, not self-adjointness. Any proposed proof must control reactions across arbitrarily high sectors.
2. **Full-Fock negative-divergence approximation lemma.** Extend T3's graph approximants to all reaction-linked occupations, with a uniform resolvent or core-density argument. Corrections placed in sectors 1 and 2 can feed sectors 3 and 4 in the uncompressed operator, so Galerkin convergence alone cannot establish this.
3. **General density reduction lemma.** Specify and characterize the leading internal diagonal/kinetic blocks admitting a common low-density reference. Scalar ε_bot N does not align distinct internal bands (N2). Matrix contact blocks require matrix boundary data; non-connected pointings may add bulk birth tiles.
4. **Range-r signed boundary-consistency lemma.** Given a coercive range-r kinetic stencil and declared conserving/reaction matrices, solve its discrete boundary equations and obtain graph approximants analogous to (C1)–(C3). (G_r) alone gives neither this nor scalar contacts. Positive stencil trace robustness is only CA-94.13's conditional interface.
5. **Higher-codimension renormalization lemma.** For an independently declared triple-cluster tile, supply a well-defined target domain and a reproducible cutoff tuning overcoming CA-94.14's logarithmic H¹ trace obstruction. No universally required three-body term or coefficient has been derived here.
6. **Regularity and same-state integration.** Establish domain regularity at intersecting collision faces if needed, and join these dynamics to local unital refinements and a WT-1 state before claiming R1; KS/Ward modes, conformality and fidelity are further steps.

## Examples table

Instances only; the proofs above are for general C.

| Instance | Calibration / conclusion | Evidence |
|---|---|---|
| Any C, X≠0, exact (F) | T4 on N≤2; scalar trace coefficient with genuine fibre maps | T1–T4 |
| Any C, X=0 | Vacuum-only carrier; α is invisible, so T4's necessity excludes it | Orthogonal decomposition, CA-94:268 |
| Any C, no reactions, c=−6t | Dirichlet limit on N≤2 despite a diving pair | T3; generic coordinate scan α=−4L at t=1 |
| Any C, no reactions, c=−2t+(−1)^L ε⁻⁴ | Whole-Fock Dirichlet; α has no signed limit | N1 |
| Any nonzero Y, X=Y⊕Y | Internal band gaps and matrix contact channels survive L0 | N2, D1 |
| Hilb_fd, X=C² | Exact 33×33 fibre compression equals independent 81×81 full-chain oracle at L=4 | `checks/contact_invariants.py:24-49,129-141`; Penneys:195-237,319 |
| Fibonacci, X=τ | E_{c,2} has one unit and one τ channel; dim Hom(X,X²)=dim Hom(1,X²)=1; powers checked only through N=4 | Penneys:610-631; `checks/review_tuned_convergence_output.txt` instance row |
| Ising, X=σ | X²=1⊕ψ; Hom(X,X²)=0 while dim Hom(1,X²)=1; powers checked only through N=4 | `references/category-theory/RowellStongWang2009Classification/source/RSWfinal3.tex:2441-2448`; same output instance row |
| Graded finite Hilbert spaces over a cyclic group, generator Y of order d>r | Y and Y⊕Y satisfy (G_r); conserving multiplicity matrices remain allowed | Penneys:321 and D1 `<1>2` |

The instance rows use orthonormal isometry-fibre coordinates. No numerical
raw cup or vertex normalization is silently imported from the graphical
normalization in Penneys:621; only fusion multiplicities are used there.

## Sources used

These are local anchors actually inspected. New analytic claims are the
structured computations in this NOTE, not attributed to an absent theorem.

- `AGENTS.md:1-425`, `README.md:1-72`, `worklog/021_2026-10-22_round2_proofs.md`: session rules, programme and current round-2 state. The brief's directory-only/no-commit instructions override repository-wide landing steps.
- `CONVENTIONS.md:1397-1467,1524-1543,1621-1642`: tiles and physical sign, pointed carrier, layer tags, collision measures, trace flux, reactions and moments.
- `references/manifest/SOURCES.md:35,57,69` and `references/category-theory/SOURCES.md:1-25`: local source provenance.
- `references/text/PenneysUnitaryFusionCategories.md:195-237,319-321,394-398,427-430,470-478,484-487,528-538`: semisimplicity, orthogonal sums, dagger tensor functor, unitary graded example, coherence, duality/fusion, isometry inner product.
- `references/text/PenneysUnitaryFusionCategories.md:610-631`: Fibonacci example only, with normalization distinction noted above.
- `references/category-theory/RowellStongWang2009Classification/source/RSWfinal3.tex:2441-2448`: Ising fusion rules, instance row only.
- `report/sections/77_pointed_carrier_invariants.tex:93-126,207-248`: occupation grading, exact box carrier, contact caveat.
- `report/sections/88_layered_targets.tex:54-108,153,167-177`: data/rung definitions and the D1-C integration cell.
- `report/sections/94_number_changing_collision_dynamics.tex:50-60,77-97,108-167,177-248`: conventions, square scaling, fixed-sector analytic lemmas, tuned full-Fock theorem, weak generator, moment cone, grading/range obstructions and target.
- `explorations/2026-10-22-astra-r2/E6-number-changing-continuum/NOTE.md:18-66,123-188,192-398,465-598,602-761,828-834`: exact prior conventions and source gap, real/nonreal resolvent bridge, trace/core/liminf proofs, coefficients and grading/range boundaries. This is the `E6/NOTE.md` abbreviation used above.
- `explorations/2026-10-22-astra-r2/E6-number-changing-continuum/REVIEW.md:58-65,85-88,90-176,178-242`: scale and proof audits, lack of N-uniform constants, non-connected-carrier omission, layer qualifications.
- `explorations/2026-10-22-astra-r2/E6-number-changing-continuum/INTEGRATION.md:61-117`: prior integration status and the proposed trichotomy.
- `explorations/2026-10-22-astra-r2/E6-number-changing-continuum/checks/review_tuned_convergence.py:1-69`: original Galerkin check, faithfully expanded and independently verified here.
- `explorations/2026-10-22-astra/D1-carrier-theory/NOTE.md:483-543`: already-proved smooth recovery and source bounds; reused, not re-derived.
- `literature/md/girardeau_jmp_1_516_1960/girardeau_jmp_1_516_1960.md:65,88`: point-core discussion inspected during search, not used as a Mosco/extension theorem.
- `checks/source_search.txt`: exact local search command and 13 matches for point/delta interaction, Mosco, and strong resolvent. No applicable contact-classification proof was identified. No source was fetched and no network was used.
- `checks/review_tuned_convergence_output.txt` and `checks/graph_core_output.txt`: complete raw numerical evidence, commands, dependency versions, source hashes and rejected mutations.
