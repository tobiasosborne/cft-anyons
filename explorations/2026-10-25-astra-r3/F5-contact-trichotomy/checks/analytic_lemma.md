# F5 analytic supplement: global triangular-grid traces

Research collaborator draft, 2026-10-25. All conventions here are local to F5,
as authorised by its write restriction. No claim about a conformal limit is
made. The setting is the open interval, general unitary fusion input plus the
declared reactions, and an off-ladder nonrelativistic resolvent limit.

Dependencies: CA-94 Lemma 94.3 (`report/sections/94_number_changing_collision_dynamics.tex:108-111`)
supplies the proved continuous simplex trace inequality and smooth H1 density;
94.5 steps 1-2 (`:127-128`) supply the kinetic liminf with coefficient one;
94.6 (`:145-151`) supplies smooth sampling and the variational Mosco-to-resolvent
argument; 94.8 (`:162-168`) fixes collapsed measure and flux; 94.10 (`:178-198`)
fixes the reaction expansion. Their longer proofs are E6 NOTE §§3-7. No named
compact-embedding, extension, or form-representation theorem is imported.

## A. Discrete conventions

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

**Lemma A (global trace and compactness).** There is C0 independent of L,E,f
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

## B. Consequences for the compressed reactions and finite alpha

Compress the **whole** CA-94 square Hamiltonian by P_{<=2}; do not first
delete squares with outputs above two. With moments from CA-94.10, its
limiting zero-order terms are

```
Q0=gamma,
Q1=mu I+Q_b+gamma I,
Q2=2mu I+(Q_b)_1+(Q_b)_2+gamma I.
```

`<1>1.` A lower b square acts at each particle followed by a vacancy. Its
difference from inserting Q_b at every particle is supported on a right-end
particle and on an adjacent occupied pair. In sector two its form error is
bounded by `||Q_b|| eps^2(sum_{i<L}||f_{i,L}||^2+sum_{i<L}||f_{i,i+1}||^2)`;
both terms vanish by Lemma A and its outer-row corollary. In sector one
the only error is bounded by `||Q_b|| eps||f_L||^2`, which also vanishes.
`<1>2.` The lower pair square is gamma times eps times the number of
empty-empty bonds. This count differs from L by at most 1+2n in sector n.
Its potential therefore converges uniformly on n<=2 to gamma I.
These are exactly the diagonal remnants of transitions to sectors 3 and 4.

Let `S(u)(s)=B_beta u1(s)+V_nu u0`, with the coherent fibre maps of CA-94,
and put `V=E0 direct_sum H1(Delta1;E1) direct_sum H1(Delta2;E2)`, summed
over the finitely many charges. For real alpha the limiting form is

```
q_alpha(u)=t(||u1'||^2+||grad u2||^2)
          +sum_{n=0}^2 <u_n,Qn u_n>
          +alpha||Tu2||^2-2Re<Tu2,S(u)>.
```

`<1>3.` Lemma A and `||S(u)||<=C||u||` imply, for alpha_eps in a bounded
real set, the uniform lower bound
`q_eps(u)>= (t/2) E_eps(u)-C||u||^2`.
The continuous analogue shows that q_alpha+C'||u||^2 has norm equivalent
to the H1 norm on V, for sufficiently large C'. Hence the form is closed,
densely defined, and semibounded; CA-94.4's shifted variational construction
gives its self-adjoint operator.
`<1>4.` For a weakly embedded sequence with bounded shifted form, `<1>3`
bounds graph energy. Lemma A and its one-dimensional analogue give strong
bulk and trace convergence after passage to a liminf subsequence. The signed
contact term therefore converges even when alpha<0, as do its cross term
and the potentials by `<1>1-2`. CA-94.5's kinetic liminf supplies precisely
the remaining inequality. Smooth recovery follows from CA-94.6's sampling
and CA-94.3's H1 density. Thus alpha_eps->alpha in R gives Mosco convergence
and the projected strong-resolvent limit for every shift above the common
lower bound. The entire sequence converges by the same unique-minimizer
argument as CA-94.6.

The exact operator domain is variational. On vectors regular enough for
Green's identity, the interior action is

```
(Hu)2=-t Delta u2+Q2 u2,
(Hu)1=-t u1''+Q1 u1-B_beta^* Tu2,
(Hu)0=gamma u0-int_0^1 V_nu^* Tu2(s) ds,
t D u2+alpha Tu2-B_beta u1-V_nu u0=0 on the collision face.
```

All outer faces are Neumann. No global H2 assertion at corners is used.
The scalar coefficient alpha and the absence of a residual sqrt(2) follow
from CA-94.8's collapsed-face flux convention.

## C. Repulsion at arbitrary rate

If alpha_eps->+infinity, completing the cross term gives, eventually,

`q_eps >= t E_eps+(alpha_eps/2)C_eps-C alpha_eps^{-1}||u||^2`

(the displayed lower potentials are nonnegative). Bounded shifted energy
therefore forces C_eps->0. Lemma A gives Tu2=0; the limiting form is the
diagonal kinetic-plus-Qn form on `{u in V:Tu2=0}`. Thus sectors decouple,
while Q_b and gamma remnants remain.

For recovery **at arbitrary growth rate**, ordinary trace-zero sampling
does not suffice: alpha_eps may exceed eps^{-2}. Instead sample a smooth
u2 vanishing on the diagonal and set all adjacent f_{i,i+1} exactly to zero.
Those unmodified samples are O(eps); there are O(eps^{-1}) such nodes, each
of bounded graph degree. The alteration has graph energy O(eps), norm
o(1), and hence changes the original bounded kinetic energy by o(1).
Its contact and cross terms are exactly zero at every mesh.

Such smooth diagonal-zero functions are H1 dense in the trace-zero domain:
extend u antisymmetrically across x=y to the square. The zero trace removes
the jump term in the distributional derivative (verify by testing on each
triangle and using CA-94.3's trace approximation). Reflect evenly across
the outer edges to a larger square, and mollify with a kernel invariant
under coordinate exchange. The extension commutes with coordinate exchange,
so mollification remains antisymmetric and vanishes exactly on the diagonal.
Translation continuity, as in E6-L1, gives H1 convergence. A diagonal choice
of these approximants and mesh thresholds completes recovery. No corner
Dirichlet condition beyond the Sobolev collision trace is imposed.

## D. Bounded-below classification and the full-Fock boundary

For X nonzero and alpha_eps bounded below, the two results above give an
if-and-only-if classification: a projected-resolvent limit on the displayed
N<=2 carrier exists exactly when alpha_eps converges in R union {+infinity}.
The common lower bound needed for a single positive resolvent shift depends
only on a lower bound for alpha_eps: discard its positive excess before
applying the trace estimate. It does not require alpha_eps to be bounded above.
Every subsequence has an extended-real clusterpoint. Its limit is the form
just described. Distinct finite coefficients give distinct forms on a smooth
pure-two-particle vector with nonzero trace; a finite form and the Dirichlet
form have different form domains. For X=0 contact vanishes and necessity
fails; that degenerate case must be excluded.

To see that distinct forms cannot yield one positive resolvent, write
R=(H+z)^{-1} with a common sufficiently large z. Then

`q(u)+z||u||^2 = sup_f [2Re<u,f>-<f,Rf>]`.

For u in the form domain this is completion of the square with v=Rf;
the operator domain is form dense by CA-94.11's proof. If the supremum is
finite, f-><u,f> is bounded for the norm `<f,Rf>^{1/2}`. Riesz on its
completion identifies u with a form-domain vector, proving the same identity
and infinity outside the form domain. Thus R determines the entire form.

On the **whole** Fock sum, alpha>=a is covered by the nonnegative-excess
extension of CA-94: add `(alpha-a)sum||T u_n||^2` to its positive form;
use positive finite exhaustion, its finite-sector smooth core, and its
sectorwise liminf. For a varying microscopic family this argument requires
alpha_eps>=a eventually, including when its finite limit equals a. The
+infinity case likewise uses positive exhaustion and
finite-sector exact-zero recovery. None of this asserts an N-uniform trace
constant. Signed reacting extensions below this sufficient cone require a
separate semibound/closed-core argument and are not supplied by CA-94.5.

There is a concrete obstruction for negative **total** alpha, even with
all remnants retained. Choose any unit vector e_n in a nonzero fibre, real
normalised h in C_c^infty((-1/2,1/2)), and
`h_l(x)=sqrt(l)h(l(x-1/2))` for l large. The unit pure-n vector
`u_n=sqrt(n!) product_i h_l(x_i)e_n` has

```
kinetic = t n l^2 A,               A=int |h'|^2,
sum_i ||T_{n,i}u_n||^2 = n(n-1) l B, B=int |h|^4.
```

For the second identity, combine all possible positions of the duplicate
coordinate and integrate the remaining ordered n-2 coordinates; the union
of insertion gaps is the full interval, and its permutation factor is
n!/(n-2)!. Pure-n cross terms vanish. Q_b, mu and gamma add at most O(n).
For alpha<0 choose `l=|alpha|(n-1)B/(2tA)` to obtain
`q_alpha(u_n)<=-[alpha^2 B^2/(4tA)] n(n-1)^2+O(n)`.
Whenever nonzero fibres occur at unbounded n, there is no full-Fock uniform
lower bound for this unmodified form. This is a semiboundedness obstruction,
not proof that every unbounded-below self-adjoint construction is impossible.
Negative excess alpha-a alone does not imply this cubic instability.
Nothing in this argument requires or generates a triple-contact term.
