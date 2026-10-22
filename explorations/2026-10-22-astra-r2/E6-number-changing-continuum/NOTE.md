# E6 — A tuned number-changing continuum theorem, and obstructions to classification

2026-10-22. General unitary fusion category throughout. The universal conjecture
E6 is false. The replacement proved below is a continuum theorem for the explicit
positive-square family of D1-C, together with its exact coefficient image.
Neither an arbitrary-density theorem nor a classification of all self-adjoint
extensions is claimed. This is nonrelativistic analysis, below the conformal ladder.

## Scope, sources, and conventions declared before use

The write restriction in the round-2 brief overrides repository-wide convention,
worklog, build, and commit instructions: this note and `checks/` are the entire
deliverable. No source acquisition, report edit, Julia suite, or commit is used.
Notation follows CONVENTIONS (a), (b), (r), (t), (u), (ak), (al), (am), and
the layer tags (aq), present in the repository by the final source audit.
The following additional choices are local to this note.

1. `C` is unitary fusion; `(O,η)`, `O=1⊕X`, is pointed, not necessarily connected.
   `E_{c,n}=Hom(c,X^⊗n)` has the isometry inner product, linear in its second
   argument. Tensor powers are left associated; omitted associators/unitors
   mean coherent unitary transport. No braiding is used. Source:
   `references/text/PenneysUnitaryFusionCategories.md:195-237,394-398,528-538`.
2. `F=⊕̂_{c,n}L²(Δ_n;E_{c,n})`, `Δ_n={0<x₁<⋯<x_n<1}`; `Δ_0` has mass one.
   There is no factorial in the chamber measure. `P_n` is the occupation-sector
   projection. The box isometries `K_ε`, `ε=1/L`, are exactly CA-77 Theorem 77.8
   (`report/sections/77_pointed_carrier_invariants.tex:207-226`), hence
   `K_εK_ε*→I` strongly along nested refinements. For all uniform meshes,
   the same projection convergence follows from D1-T7's smooth sampling
   approximants and density of finite-sector smooth vectors. This carrier
   result is cited, not reproved.
3. `π_{00},π_{X0},π_{0X},π_{XX}` are the orthogonal summand projections from
   `O²`. Physical energies have sign `H=Σk_j`, so `k=−h^(ak)` as in (al).
   When testing the brief's `h`, it is this physical density `k` that is meant.
   Nearest-neighbour sums use `j=1,…,L−1`, with no outer-boundary penalty.
4. A collision trace `T_{n,i}ψ_n`, `1≤i<n`, duplicates the ith coordinate of
   `Δ_{n−1}`. Its measure is collapsed-coordinate Lebesgue measure `dy=dS/√2`,
   as in D1 `NOTE.md:91-104`. `D_{n,i}=∂_i−∂_{i+1}` is the corresponding
   outward flux, not the unit-normal derivative. All trace formulas first
   mean Sobolev traces; classical normal derivatives are used only when present.
5. For `b:X→X²`, `B_{b,n,i}:E_{c,n}→E_{c,n+1}` inserts b at position i.
   For `v:1→X²`, `V_{v,n,i}:E_{c,n}→E_{c,n+2}` inserts v in gap i, `0≤i≤n`.
   Its function-space lift is independent of the insertion coordinate t on
   `Γ_{n,i}={y₁<⋯<y_i<t<y_{i+1}<⋯<y_n}`. These are D1 `NOTE.md:91-97`.
   Empty Hom spaces simply contribute zero.
6. Finite reaction lists `b_α,v_β`, nonnegative weights `λ_α,κ_β`, and `μ>0`
   are declared microscopic data. Zero weights may be removed. They are not
   synthesized from C. L0 denotes the full unitary fusion data, not just its ring.
7. “C-equivariant” here means an operator on the displayed charge decomposition
   induced by categorical fibre maps, preserving c. The conjecture specifies
   no stronger action of C on F. A stronger notion needs a specified action.
8. For negative results use the always-defined resolvent `(H−i)^{-1}`.
   Positive results use `(H+z)^{-1}`, `z>0`. A common real scalar subtraction
   is allowed in the negative test; a subtraction proportional to `N̂` is not
   a scalar. “Extension of the minimal Laplacian” means an operator containing
   the algebraic direct sum of `C_c^∞(Δ_n;E_{c,n})` with action `−Δ` (and zero
   action on the vacuum). This domain convention matters in §6.

**Local analytic source gap.** Searching `references/` and `literature/md/`
for Mosco, self-adjoint extensions, boundary triples, closed quadratic forms,
and point interactions found no source establishing the needed theorem.
The point-core discussion in
`literature/md/girardeau_jmp_1_516_1960/girardeau_jmp_1_516_1960.md:65,88`
does not supply it. No extension-classification theorem is imported. The
analytic lemmas needed here are proved explicitly below. Elementary integration,
Hilbert completeness/orthogonal projection, and weak derivatives are used as
foundations, rather than an unsourced named Mosco or representation theorem.

Local dependencies read: D1 `NOTE.md:9-112,399-562`, `REVIEW.md:78-98,131-139`,
`INTEGRATION.md:92-141`; CA-77; CA-88's layer definitions. In particular D1-T7
already proves smooth recovery, and CA-77 already records contact nonuniversality.

## 1. E6(a) is false even after every possible scalar renormalisation

**E6-N1 [negative; open/nonrelativistic, L0, obstruction below R1].**
For every C and every nonzero X, the allowed pure-hop density

`k=−π_{X0}*π_{0X}−π_{0X}*π_{X0}`

has no projected strong-resolvent limit on all of F after any real scalar
subtraction `s_ε I`. Thus even the coherent nonreal-resolvent interpretation
of the brief's assertion fails; using a real λ cannot fix it.

ASSUME this density, `H_ε=ε^{-2}Σ_j k_j`, and real `s_ε`.
PROVE there is no self-adjoint H on F with
`K_ε(H_ε−s_ε−i)^{-1}K_ε*→(H−i)^{-1}` strongly.

`<1>1.` The vacuum Ω is an exact eigenvector of energy zero at every scale.
Its projected resolvent is `a_εΩ`, `a_ε=(−s_ε−i)^{-1}`.
BY the density's zero action on `00` and the vacuum-preserving K.

`<1>2.` If a full resolvent R were the limit, `a_ε→a≠0`: a resolvent is
injective, since `(H−i)Rf=f`. Hence `s_ε→−i−a^{-1}`, a finite real number.
BY `<1>1` and scalar inversion. Unbounded or oscillating scalar sequences
therefore cannot evade the next step.

`<1>3.` Choose any simple c and unit `e∈E_{c,1}`, which exist since X≠0.
For nonzero `f∈C_c^∞(0,1)`, put `u_ε(j)=√ε f((j−1/2)ε)e` in sector one.
Then `K_εu_ε→fe`, and

`H_εu_ε=−2ε^{-2}u_ε+w_ε`, with `sup_ε‖w_ε‖<∞`.

`<2>1.` Away from the endpoints the difference is
`w_ε(j)=−√ε [f(x_j+ε)−2f(x_j)+f(x_j−ε)]/ε²`.
`<2>2.` Taylor's integral remainder bounds each bracket/ε² by `sup|f''|`.
There are L entries. Near the endpoints all entries vanish for small ε.
BY compact support. Squaring and summing proves the bound.

`<1>4.` Write `R_ε=(H_ε−s_ε−i)^{-1}`, so `‖R_ε‖≤1`, and set
`d_ε=−2ε^{-2}−s_ε−i`. Applying R_ε to `<1>3` gives
`R_εu_ε=d_ε^{-1}(u_ε−R_εw_ε)→0`.
BY `<1>2–3`, `|d_ε|→∞`, and the finite-dimensional self-adjoint resolvent
bound (diagonalise the Hermitian matrix).

`<1>5.` Uniform boundedness and `K_εu_ε→fe` imply `R(fe)=0`, contradicting
injectivity and `fe≠0`. QED BY `<1>1–4` and the assumed strong convergence.

This counterexample has no reaction tiles, no gauge issue, and no model-specific
identity. The missing hypothesis is a common low-density energy reference:
the kinetic operator needs its diagonal completion, with contact terms specified.
A common scalar cannot provide the missing number-dependent completion.
Even `k=0` separately refutes a mandatory nonzero Laplacian in E6(b).

The real-resolvent wording of E6(a) cannot evade N1. If its projected real
resolvents A_ε at +λ converged strongly to A=`(H+λ)^{-1}`, put
`B_ε=I−(λ+i)A_ε`. Finite Hermitian diagonalisation and
`|1−(λ+i)t|≥1/√(1+λ²)` for real t give uniformly bounded B_ε inverses.
The limit B has inverse `I+(λ+i)(H−i)^{-1}`. The identity
`B_ε^{-1}−B^{-1}=B_ε^{-1}(B−B_ε)B^{-1}` proves strong inverse convergence.
But `(B_ε^{-1}−I)/(λ+i)` is exactly the projected nonreal resolvent,
including its zero action off Ran(K_ε). This contradicts N1. If a real
inverse does not exist at a required scale, the original assertion already fails.

## 2. The replacement family and the corrected scaling

Define, exactly as D1-C (`NOTE.md:35-41`),

```
D_h = π_X0 − π_0X,
D_b(ε) = π_XX − √ε b π_X0,
D_v(ε) = π_XX − ε v π_00,
H_ε = Σ_j [ε⁻² D_h,j*D_h,j
            + Σ_α λ_α ε⁻¹ D_bα,j(ε)*D_bα,j(ε)
            + Σ_β κ_β ε⁻¹ D_vβ,j(ε)*D_vβ,j(ε)] + μ N̂.
```

This is an ε-dependent density family, not the brief's arbitrary fixed h with
three uniform scaling buckets. It retains the tuned contact term of
CA-77:241-246. The same hop coefficient alone cannot select the collision law.

**E6-P1 [proven; same setting, L0, scale identification].** Expanding the squares:

```
ε⁻¹ D_b*D_b = ε⁻¹ P_XX
 − ε⁻¹/² (π_XX* b π_X0 + π_X0* b* π_XX) + π_X0* b*b π_X0,
ε⁻¹ D_v*D_v = ε⁻¹ P_XX
 − (π_XX* v π_00 + π_00* v* π_XX) + ε π_00* v*v π_00.
```

ASSUME the box normalization of convention 2. PROVE these are the finite
collision-form scalings.
`<1>1.` With n spectators, a birth from one to two has amplitudes of orders
`ε^{(n+1)/2}` and `ε^{(n+2)/2}`. The collision grid has order `ε^{−(n+1)}`
points. A cross coefficient g therefore contributes order `g√ε`.
`<1>2.` Birth from zero to two instead contributes order g on the same grid.
`<1>3.` The displayed expansions, obtained by multiplying each square, give
`g_b=ε^{-1/2}`, `g_v=1`, and the upper trace-square coefficient `ε^{-1}`.
BY `<1>1–2` and the exact D1-T7 Riemann sums (`NOTE.md:498-508`). QED.

Consequently applying `ε^{-1}` indiscriminately to fixed b and v tiles does
not reproduce this family: the smooth cross-form sizes would be `ε^{-1/2}`
and `ε^{-1}` respectively. This scaling observation alone is not a theorem
that all such differently scaled families diverge; N1 already supplies that
theorem's counterexample.

Define the continuum form on its maximal finite-energy domain by

```
q₀(ψ)=Σ_c,n [ ∫Δ_n Σ_i ‖∂_iψ_n,c‖² + μ n ‖ψ_n,c‖² ],
R_b,n,i(ψ)=T_{n+1,i}ψ_{n+1}−B_b,n,i ψ_n,
R_v,n,i(ψ)=T_{n+2,i+1}ψ_{n+2}−V_v,n,i ψ_n,
q(ψ)=q₀(ψ)+Σ_α,n≥1,c,i λ_α‖R_bα,n,i(ψ)‖²_L²(Δ_n)
             +Σ_β,n≥0,c,i κ_β‖R_vβ,n,i(ψ)‖²_L²(Γ_n,i).
```

The lower input in a pair term is pulled back along `(y,t)↦y`.
All sums are nonnegative. The theorem below includes the existence and
uniqueness of the associated nonnegative self-adjoint H, with its exact weak
domain; no H is assumed as extra input.

## 3. Closedness, a core, and construction of the operator

**E6-L1 [proven analytic lemma; finite-dimensional fibres].** On each fixed
simplex Δ_n, smooth functions on a neighbourhood of its closure are dense in
the weak-derivative H¹ norm. Every face trace is continuous `H¹→L²(face)`.
Constants may depend on n; no uniform-in-n assertion is needed.

ASSUME a finite-dimensional Hilbert fibre E. PROVE these two assertions.

`<1>1.` Fix an interior point a. The pullback
`f_δ(x)=f(a+(1−δ)(x−a))` is defined on a strictly larger simplex containing
`closure(Δ_n)` in its interior. Its weak derivatives are
`(1−δ)(∂_if)(a+(1−δ)(x−a))`, by an affine change in the distributional test
integral. As δ↓0 these functions converge in L² to f and its derivatives.
BY continuity of affine pullback in L²: extend each L² function by zero to
R^n, verify it first for continuous compactly supported functions by dominated
convergence, then use their L² density and the bounded Jacobians.

`<1>2.` Convolve f_δ on this enlarged simplex with a smooth approximate
identity of radius less than its distance from `closure(Δ_n)`. Translation
continuity in L², proved by the same continuous-function approximation,
gives convergence in H¹ as the radius tends to zero. Then let δ↓0.
BY `<1>1`. This proves the density statement without assuming a trace theorem.

`<1>3.` On a face F, parameterise its inward pyramid by
`x=(1−t)y+ta`, `y∈F`, `0<t<1/2`. Its volume Jacobian is a fixed positive
height times `(1−t)^{n−1}`. For smooth f, the fundamental theorem of calculus
and Cauchy–Schwarz give

`‖f(y)‖² ≤ 2‖f((1−t)y+ta)‖²
             +2t∫₀ᵗ |a−y|²‖∇f((1−s)y+sa)‖²ds`.

Integrating y and t gives `‖f|_F‖²≤C_n(‖f‖²+‖∇f‖²)`.
BY bounded diameter and the Jacobian lower bound for `t≤1/2`.
The same calculation on `0<t<d≤1/2` gives
`‖f|_F‖²≤C_n(d^{-1}‖f‖²+d‖∇f‖²)`.

`<1>4.` The trace extends continuously using `<1>2–3`, independently of the
approximating smooth sequence. The collapsed-face measure differs by the
fixed factor √2. This also covers endpoints for n=1. QED.

**E6-L2 [proven; open/nonrelativistic, L0, continuum operator exists].**
The displayed maximal q is densely defined, nonnegative, and closed. Finite
particle vectors smooth on closed chambers form a form core. There is a unique
nonnegative self-adjoint H associated with q.

ASSUME the reaction data and μ>0 of §2. PROVE the assertions.

`<1>1.` Let `V₀=D(q₀)` with norm `‖ψ‖₀²=q₀(ψ)+‖ψ‖²`. This is complete:
a Cauchy sequence converges in each H¹ sector; distributional testing identifies
the derivative limits; summing the squared limits proves convergence in V₀.
BY completeness of L² and the weak-derivative definition.

`<1>2.` Let G be the Hilbert sum of all active reaction face spaces, with
weights absorbed as square roots. Write `Tψ` for the upper traces and `Sψ`
for the lower sources, so `q=q₀+‖Tψ−Sψ‖_G²`. Then

`‖Sψ‖_G² ≤ B Σ_n,c n‖ψ_n,c‖² + V‖ψ‖²`,
`B=Σ_α λ_α‖b_α‖²`, `V=Σ_β κ_β(v_β*v_β)`.

BY the source bounds already proved in D1 `NOTE.md:534-543`: b has n
insertion positions; for v the permitted gap lengths sum to one.
Thus S is bounded from V₀ into G, since μ>0.

`<1>3.` T is closed as an operator from V₀ to G. Indeed V₀ convergence gives
H¹ convergence in every fixed sector, hence convergence of every individual
trace by L1. A G-limit therefore has precisely those traces as components.
BY uniqueness of L² limits, with no n-uniform trace bound.

`<1>4.` `D(q)=V₀∩D(T)` and the q form norm is equivalent to
`‖ψ‖₀²+‖Tψ‖_G²`, by `<1>2` and the two triangle inequalities for `T−S`.
Completeness follows from `<1>1–3`; density in F follows from finite-sector
smooth vectors, all of which have finite q. BY L1 and finite reaction lists.

`<1>5.` Cut ψ off at particle number M. This converges in V₀, and its T image
is exactly the truncation of Tψ by *upper-sector* number. Hence convergence
holds in the graph norm of `<1>4`, and therefore in the q norm. Within finitely
many sectors, L1's H¹ approximation controls all finitely many traces and S.
This proves the asserted smooth form core. Notice that upper-zero reaction
terms are retained when truncating: the source is not deleted.

`<1>6.` For z>0 the complete space D(q), with inner product
`q(φ,ψ)+z〈φ,ψ〉`, has a unique vector `R_z f` satisfying

`q(φ,R_z f)+z〈φ,R_z f〉=〈φ,f〉` for every `φ∈D(q)`.

BY Hilbert projection/Riesz, or equivalently by completing the square in the
strictly convex functional `q(u)+z‖u‖²−2Re〈f,u〉`. It gives
`‖R_z‖≤1/z`, `R_z*=R_z`, and positivity. If `R_z f=0`, the displayed identity
and density give f=0. Therefore `Ran(R_z)` is dense, since its orthogonal
complement is `ker(R_z*)={0}`.

`<1>7.` Define `D(H)=Ran(R_z)`, `H R_z f=f−zR_z f`. The variational identity
shows that this is independent of z, symmetric, and nonnegative, with exact domain

`D(H)={ψ∈D(q): there exists f∈F with q(φ,ψ)=〈φ,f〉 for all φ∈D(q)}`.

For completeness, if `w∈D(H*)` with `H*w=g`, testing against `R_z f` gives
`(I−zR_z)w=R_z g`, whence `w=R_z(g+zw)∈D(H)`. Thus `H*=H`.
The same variational identity forces uniqueness. QED BY `<1>1–7`.

## 4. The collision-trace lower bound

**E6-L3 [proven; arbitrary finite-dimensional fibres].** If
`K_εu_ε⇀ψ` in F and `sup_ε〈u_ε,H_εu_ε〉<∞`, then

`q(ψ)≤liminf_ε〈u_ε,H_εu_ε〉`.

ASSUME this bounded sequence. PROVE the lower bound, with coefficient one
in the kinetic energy. Take a subsequence realising the liminf; all arguments
below apply to it and hence establish the assertion for the original sequence.

`<1>1.` Fix c,n and put `f_ε(j₁,…,j_n)=ε^{-n/2}u_ε(j₁,…,j_n)` on strictly
increasing cell indices. The embedded function is constant on their boxes and
zero on same-cell configurations. The hopping energy is exactly

`E_ε,n=ε^{n−2}Σ_{unordered allowed one-step edges j~j'}‖f_ε(j')−f_ε(j)‖²`.

BY expanding `D_h*D_h`: every occupied-empty bond contributes one difference
square, and a hop past a vacancy transports the fibre by its unitor only.

`<1>2.` Let `Ω_d={x∈Δ_n: x₁>d, 1−x_n>d, x_{i+1}−x_i>d}`.
For ε sufficiently small, all forward coordinate differences on Ω_d are
allowed. Their squared L² norms, summed over i, are at most E_ε,n: a box
portion has volume at most ε^n and each forward edge is counted once.

`<2>1.` Discrete summation by parts against `φ∈C_c^∞(Ω_d)` yields
`∫(D_ε,i f_ε)φ=−∫f_ε(D_{−ε,i}φ)`, with the conjugations dictated by the
Hermitian inner product. No boundary term meets the support.
`<2>2.` The right side tends to `−∫ψ∂_iφ`, since the smooth backward
quotient converges strongly in L². Weak L² compactness identifies every
gradient cluster point with the weak derivative of ψ.
`<2>3.` Weak lower semicontinuity and d↓0 give
`ψ_n∈H¹(Δ_n)` and `∫Δ_n Σ_i‖∂_iψ_n‖²≤liminf E_ε,n`.
Here H¹ membership follows because the resulting weak derivatives are globally
L²; distributional tests have compact support in some Ω_d.

`<1>3.` Fix one collision face, and a relatively compact patch U of its
collapsed-coordinate interior, separated from other collisions and endpoints.
For its double cell j,j+1, let A_ε(y) be the upper-sector f_ε value on that
adjacent pair and the spectator cells. This is a piecewise constant function
of y, with face box volume ε^{n−1}. For a small fixed h>0, set
`m=floor(h/ε)≥1`, and form the normal collar mean

`M_ε,h(y)=m^{-1}Σ_{r=0}^{m−1} f_ε(...,j,j+1+r,...)`.

Choose h smaller than one third of the patch's separation margin, so every
listed move is legal. One may first enclose U in a slightly larger interior
patch; cells crossing its edge cause no missing moves.

`<2>1.` Jensen and telescoping along these paths give

`‖A_ε−M_ε,h‖²_L²(U) ≤ mε E_ε,n ≤ h E_ε,n`,
`‖M_ε,h‖²_L²(U) ≤ (mε)^{-1}‖K_εu_ε,n‖²`.

For the first bound use `‖f_r−f_0‖²≤rΣ_{s<r}‖f_{s+1}−f_s‖²`, average r,
and multiply by ε^{n−1}. Each edge in this fixed-face collar is used by just
one face cell/path, and `r≤m`; compare with ε^{n−2} in `<1>1`.
For the second, Jensen converts the mean square into the sum of bulk box
squares; each such box is used once. Restricting partial boxes only decreases
these bounds. Thus A_ε is bounded in L²(U).

`<2>2.` For a smooth test φ supported in U, pairing M with φ is a bulk pairing
with the kernel

`G_ε(y,z)=(mε)^{-1}φ(y) 1_{jε<z<(j+m)ε}`, where the collapsed t lies in cell j.

Spectator and t cell variables are unchanged. This kernel converges strongly
in L² to `G(y,z)=h^{-1}φ(y)1_{0<z−t<h}`: boundaries have measure zero,
`mε→h`, and the uniformly bounded kernels have fixed bounded support.
Hence `M_ε,h⇀A_hψ:=h^{-1}∫₀ʰψ(...,t,t+s,...)ds` in these pairings.
BY bulk weak convergence. This step uses cell integrals, not values of an
arbitrary L² function at points.

`<2>3.` On this collar the one-dimensional fundamental theorem for weak
derivatives, obtained by mollification as in L1, gives

`Tψ=A_hψ−h^{-1}∫₀ʰ(h−s)∂_{i+1}ψ(...,t,t+s,...)ds`,
`‖Tψ−A_hψ‖²_L²(U)≤(h/3)‖∂_{i+1}ψ‖²_L²(collar)`.

This trace agrees with L1 by smooth approximation. Combining `<2>1–3`
and then sending h↓0 identifies every weak limit of A_ε with Tψ. Thus
`A_ε⇀Tψ` on U along the original bounded subsequence.

`<1>4.` The discrete lower sources also converge weakly on U.

`<2>1.` For b, the lower configuration has its particle in cell j and the
right cell empty. On U all other particles are uniformly separated; for small
ε this source is exactly `B(K_εu_ε,n−1)(y)` on the same collapsed cells.
It therefore converges weakly to `Bψ_{n−1}`.
`<2>2.` For v it is exactly the pullback `V(K_εu_ε,n−2)(spectators)`.
The pullback to U is bounded in L²: each permitted insertion interval has
length at most one. Its adjoint integrates over the insertion variable, so
weak convergence follows. This includes the zero-particle input.
`<2>3.` The discrete reaction square has precisely face weight ε^{n−1}
after inserting the box powers and ε^{-1}. BY P1, or direct expansion of D.
Thus its contribution bounds the L²(U) norm square of the corresponding
`A_ε−source_ε`, which converges weakly to `Tψ−source`.

`<1>5.` Apply weak lower semicontinuity to a *finite* collection of the bulk,
mass, and reaction terms jointly, with interior domains Ω_d and one nested
interior patch U_d per face (never overlapping patches counted twice).
Their discrete contributions are bounded by the total energy, each counted
only once. Increase Ω_d to Δ_n and U to the relative interior of each face;
then increase the finite collection of sectors and reactions. All terms are
nonnegative, so monotone convergence yields exactly q(ψ) and its claimed
bound. Multiple collisions and endpoints are excluded only during the local
argument; their intersections have zero face measure. No energy supported
near them is discarded from the discrete *upper bound*. QED.

## 5. The full tuned continuum theorem

**E6-T1 [proven; open/nonrelativistic, L0 plus declared microscopic data;
nonrelativistic resolvent rung, no Wilson-state claim].** For every C,X and
the finite reaction data of §2, q has the nonnegative self-adjoint operator H
of L2, and for every z>0 and f∈F,

`K_ε(H_ε+z)^{-1}K_ε*f → (H+z)^{-1}f` strongly as `ε=1/L→0`.

In particular this holds on the nested dyadic sequence of CA-77. No subsequence,
scalar subtraction, trace/core assumption, or N-uniform estimate is required.
The limit is genuinely number-changing iff at least one of
`β=Σ_α λ_α b_α` or `ν=Σ_β κ_β v_β` is nonzero.

ASSUME §2. PROVE the projected-resolvent assertion.

`<1>1.` Smooth finite-particle vectors have strongly convergent sampling
sequences whose discrete energies converge to q. BY D1-T7,
`explorations/2026-10-22-astra/D1-carrier-theory/NOTE.md:483-516`.
That proof applies exactly to the displayed matrices, including reactions
with zero output sectors; it is not repeated here.

`<1>2.` For every ψ∈D(q), L2 supplies core vectors ψ^(k)→ψ in form norm.
For each k choose the `<1>1` sampling sequences and a mesh threshold below
which both norm and energy errors are less than 1/k. Choose decreasing
thresholds and let k increase only when its threshold is met. This diagonal
sequence is a strong recovery sequence with energies tending to q(ψ).
BY `<1>1` and form-norm continuity of q.

`<1>3.` Set `F_ε(u)=〈u,H_εu〉+z‖u‖²−2Re〈K_ε*f,u〉`, and let u_ε be its
unique minimizer. Testing the Euler equation on u_ε gives
`‖u_ε‖≤‖f‖/z` and `〈u_ε,H_εu_ε〉≤‖f‖²/z`.
Thus embedded minimizers are weakly precompact and L3 applies.

`<1>4.` Each weak cluster point minimizes
`F(u)=q(u)+z‖u‖²−2Re〈f,u〉`: L3 bounds the minima from below, and `<1>2`
bounds them from above by F evaluated at any proposed continuum competitor.
The unique minimizer is `(H+z)^{-1}f` by L2. Hence the minima converge and
all cluster points agree. These inequalities also prove full weak convergence.

`<1>5.` Let v_ε be a recovery sequence for that minimizer. Completing the
discrete quadratic square at u_ε gives

`z‖u_ε−v_ε‖² ≤ F_ε(v_ε)−F_ε(u_ε) →0`.

Therefore the embedded minimizers converge strongly. Since
`u_ε=(H_ε+z)^{-1}K_ε*f`, this is the stated conclusion. QED BY `<1>1–5`.

ASSUME the same data. PROVE the number-changing criterion.
`<1>1.` Expand q as in T2 below. Only β and ν occur off-diagonally in
occupation number. If they vanish, q splits by n, and its variational
resolvent splits too. BY the displayed expansion and L2's uniqueness.
`<1>2.` If β≠0, choose a one-particle fibre vector e with βe≠0, a smooth
lower-sector test, and a smooth two-particle test with that prescribed trace
on a collision patch. Their mixed form is nonzero. BY semisimplicity and
smooth normal extension of a face function. If ν≠0 use the vacuum and a
two-particle test instead; their mixed form is nonzero by the same computation.
`<1>3.` A number-reducing resolvent would force these mixed forms to vanish:
its operator domain is form dense, and reduction extends to the form by N3
`<2>1–2` below. This contradicts `<1>2`. QED BY `<1>1–3`.
In particular nonzero individual maps can cancel, for example equal weights
on b and −b; the criterion is about their weighted sum.

## 6. Exact weak domain and why this is not the proposed extension problem

**E6-P2 [proven; same setting and layer, operator identification].** The exact
domain is L2's variational domain. When a domain vector has sufficient
sectorwise regularity and summability to integrate by parts, its equations are

```
(Hψ)_n = −Δψ_n + μnψ_n
 − Σ_α λ_α Σ_i B_bα,n,i* R_bα,n,i(ψ)
 − Σ_β κ_β Σ_i ∫gap_i V_vβ,n,i* R_vβ,n,i(ψ)(y,t) dt,

on collision face i of Δ_n:
D_n,i ψ_n + Σ_α λ_α [T_n,i ψ_n − B_bα,n−1,i ψ_n−1]
            + Σ_β κ_β [T_n,i ψ_n − V_vβ,n−2,i−1 ψ_n−2] = 0.
```

Outer endpoint faces have Neumann flux zero; absent sectors/terms are omitted.
The pair source on a face removes the colliding pair and retains its insertion
coordinate in the gap. The interior pair term integrates over that coordinate.

ASSUME a regular vector in the exact weak domain. PROVE the equations.
`<1>1.` Polarise each reaction norm. Vary its upper input: the result is
`〈Tφ_upper,R〉` times its weight. Vary its lower input: it is
`−〈Bφ_lower,R〉` or `−〈Vφ_lower,R〉`.
`<1>2.` Integrate the gradient term by parts. On a collision,
`∂_normal=(∂_i−∂_{i+1})/√2` and `dS=√2dy`, so the flux coefficient is
exactly D, with no residual √2. On an outer face there is no reaction term.
`<1>3.` Taking adjoints of the lower-source maps produces B* pointwise and
V* followed by gap integration. Compactly supported interior tests give the
first equation; arbitrary smooth face traces give the second. BY `<1>1–2`
and L2's variational identity. QED. No global H² regularity theorem is asserted.

**E6-N2 [negative; same setting and layer].** If any active reaction map is
nonzero, H is not an extension even of the mass-shifted free minimal operator
`A_min=⊕(−Δ+μn)` on finite-sector compactly supported smooth vectors (including
the vacuum). Thus even the repaired family needs a different operator
description from the one proposed in E6(b). This is a correction to the
replacement theorem, not a fixed-h counterexample: §2 changed that family.

ASSUME such a nonzero map. PROVE `H⊉A_min`.
`<1>1.` For nonzero b, semisimplicity supplies a simple c and e∈Hom(c,X)
with be≠0: otherwise b vanishes on every summand of X. Choose a nonzero
one-particle compactly supported smooth ψ with this fibre. For nonzero v,
choose ψ=Ω. Source: Penneys:195-219 for the categorical splitting.
`<1>2.` All upper sectors of ψ vanish and all its own collision traces vanish.
Consequently `q(ψ)=〈ψ,A_minψ〉+‖Sψ‖²>〈ψ,A_minψ〉`.
`<1>3.` If H extended A_min, ψ would belong to D(H), and the variational
identity would give equality instead. Contradiction. QED.

This obstruction survives cancellation of β or ν: positive source-square
potentials remain. For a genuinely coupled case the equations also constrain
upper traces by lower *interior* values. The natural boundary data are therefore
on a stratified collection of configuration spaces, not just trace pairs of
independent chamber Laplacians. Even for n=2 the collision trace is a function
of a continuous coordinate; the total boundary space is infinite-dimensional.
A finite local coefficient list must not be confused with that boundary space.

## 7. A finite coefficient image for the repaired positive-square family

**E6-T2 [proven; same setting, L0; classification within §2 only].** Allow
arbitrary finite reaction lists in §2. Its continuum form depends only on
`(a,β,ν,Q_b,γ)` below. Its exact coefficient image consists of the tuples
admitting a split `a=a_b+a_v`, with `a_b,a_v≥0`, satisfying the conditions
below. The split itself need not be uniquely determined by the form.

```
a_b=Σ_α λ_α,       β=Σ_α λ_α b_α,       Q_b=Σ_α λ_α b_α*b_α ∈End(X),
a_v=Σ_β κ_β,       ν=Σ_β κ_β v_β,       γ=Σ_β κ_β v_β*v_β ∈R_≥0,
a=a_b+a_v.
```

Let `M=Hom(X,X²)`, `W=Hom(1,X²)`, and
`G_M={Σ_{j=1}^k d_j*d_j : d_j∈M, k finite}` (including zero).
The exact finite-coefficient image is characterised by

```
a_b=0: β=Q_b=0;
a_b>0: β∈M and Q_b−β*β/a_b ∈G_M;
a_v=0: ν=γ=0;
a_v>0: ν∈W and γ−ν*ν/a_v ∈G_W,
G_W={Σ_j w_j*w_j:w_j∈W} = R_≥0 if W≠0, and {0} if W=0.
```

These are finite categorical matrix conditions. With an effective exact
encoding, for example algebraic coefficients with decidable real order, they
give an algorithmic test (including the existential scalar split). Arbitrary
unencoded real coefficients do not automatically give an exact algorithm.
Explicitly, write `X=⊕_c c^{m_c}`, `X²=⊕_c c^{n_c}` in orthonormal splitting
bases. Then M is the sum of rectangular matrices `M_{n_c×m_c}` and G_M is
the cone of positive blocks in End(X) supported on charges with `n_c>0`.
Thus the condition is a finite set of positive-semidefinite matrix inequalities
and zero-block conditions, not an infinite-dimensional Grassmannian.

ASSUME §2 and the isometry inner product. PROVE the image statement.

`<1>1.` Expanding the face squares yields

```
q(ψ)=q₀(ψ) + a Σ_{c,n≥2,i} ‖T_n,i ψ_n‖²
 −2Re Σ_{c,n≥1,i} 〈T_n+1,i ψ_n+1, B_β,n,i ψ_n〉
 −2Re Σ_{c,n≥0,i} 〈T_n+2,i+1 ψ_n+2, V_ν,n,i ψ_n〉
 +Σ_{c,n≥1,i} 〈ψ_n,(Q_b)_i ψ_n〉 + γ‖ψ‖².
```

Both kinds of upper trace range once over every collision face; the pair
gap domains reparameterise the same face with Jacobian one. The final pair
source term is γ‖ψ‖² because gap lengths sum to one. BY §2 and D1 source
bounds (`NOTE.md:534-543`). Each `(Q_b)_i` inserts Q_b coherently at position i.

`<1>2.` For `a_b>0`, subtraction of the mean gives the exact identity

`Q_b−β*β/a_b=Σ_α λ_α(b_α−β/a_b)*(b_α−β/a_b)∈G_M`.

Likewise for v. At a_b=0 all weights vanish; similarly a_v=0. These prove
necessity. BY multiplication of finite matrices in the categorical blocks.

`<1>3.` Conversely, write `Q_b−β*β/a_b=Σ_{j=1}^k d_j*d_j`. If k>0, choose
the 2k maps `β/a_b ± √(k/a_b)d_j`, each of weight `a_b/(2k)`. Their
zeroth, first, and second moments are exactly `a_b,β,Q_b`. If k=0 use the
single map `β/a_b` with weight a_b. The identical construction works for v.
It also permits zero maps to supply pure positive contact weight. This proves
sufficiency, including the case where a Hom space is zero.

`<1>4.` A Gram square d*d has positive blocks and vanishes when n_c=0.
Conversely, a positive m_c×m_c block is a sum of row Gram squares, by finite
Hermitian diagonalisation. If n_c>0 each row can be placed in one row of a
categorical map d; summing these maps' Gram squares gives the block. BY the
semisimple orthogonal decomposition (Penneys:195-237,470-478,528-530).
Thus the stated finite test is exact. QED BY `<1>1–4`.

For boundary equations this image has scalar upper-trace coefficient
`a≥0`, coherent insertions of the *same* β and ν in all sectors, and the
specified positive moment potentials. It does not contain arbitrary
position-dependent, charge-by-charge, or nonlocal boundary operators. T2
classifies this repaired family; it is not presented as the unknown image of
every cutoff-dependent density or of E6's fixed-h scaling.

## 8. Surjectivity onto all equivariant extensions fails

**E6-N3 [negative; open/nonrelativistic, L0, any fixed finite range r].**
Assume

`Hom(X^⊗p,X^⊗q)=0 for 0≤p≠q≤r`,                         (G_r)

and that some c occurs in both `X^⊗m` and `X^⊗n`, for distinct m,n≥2.
Every range-r categorical density preserves particle number, whereas a
charge-preserving non-number-preserving self-adjoint collision extension
exists on F. Therefore no limit of those densities can realise every
C-equivariant extension. This disproves (c)'s unqualified surjectivity.

ASSUME these hypotheses. PROVE the obstruction and the countertarget.

`<1>1.` Distributing `O^⊗r=(1⊕X)^⊗r` gives the occupation blocks
`Z_p=⊕_{|S|=p}X^⊗p`. A degree q−p local tile lies in Hom(Z_p,Z_q), which
vanishes for p≠q by G_r. Tensoring with spectator identities leaves this
number conservation unchanged. BY CA-77's occupation grading, specifically
`report/sections/77_pointed_carrier_invariants.tex:96-126`, or direct insertion
of the orthogonal summand projections (Penneys:219). This uses no spectrum.

`<1>2.` Every finite-stage Hamiltonian and resolvent commute with each P_k;
so do scalar subtractions. The K maps preserve P_k. Taking a strong limit
therefore preserves commutation with P_k, since P_k is bounded.
BY `<1>1`. The argument is independent of the cutoff scaling or positivity.

`<1>3.` On a compact interior patch of one collision face in each of sectors
(c,m) and (c,n), choose a nonzero smooth compactly supported scalar weight
ρ_s and a unit fibre vector e_s, and define the bounded trace functional

`ℓ_s(ψ_s)=∫face ρ_s(y)〈e_s,Tψ_s(y)〉dy`, `s=m,n`.

It is bounded in that fixed sector's H¹ norm by L1 and Cauchy–Schwarz.
The fibre rank-one maps `e_m e_n*` are categorical maps between the relevant
summands of `X^⊗n` and `X^⊗m`, so the construction preserves charge c.

`<1>4.` Set
`q_*(ψ)=Σ_c,k‖∇ψ_k,c‖²+|ℓ_m(ψ_m,c)−ℓ_n(ψ_n,c)|²`
on the direct sum of the H¹ sectors with finite bulk energy. The added
functional is bounded in the bulk form norm, depends on only two sectors,
and is nonnegative. Thus this is a dense closed form: its form norm is
equivalent to the complete bulk form norm. L2 `<1>6–7` constructs a
nonnegative self-adjoint H_*.

This also has an explicit boundary relation: let G_∂ be the **finite** direct
sum of all boundary-face L² spaces of the two affected sectors (c,m),(c,n).
Each face space remains infinite-dimensional. Let
`L(t)=ℓ_m(t_m)−ℓ_n(t_n)` (now acting on traces directly) and
`K=L*L`. Set flux `p=−Kt`, with zero flux on unused/outer faces. The graph
`{(t,−Kt)}` is Lagrangian for
`ω((t,p),(s,q))=〈t,q〉−〈p,s〉`: K*=K gives isotropy; orthogonality against
every `(s,−Ks)` forces `p=−Kt`, giving maximality. Thus the countertarget
also supplies an explicit, infinite-dimensional boundary Lagrangian, without
invoking a general extension-classification theorem. Append the other sectors'
Neumann conditions sectorwise. No square-summability of unweighted boundary
traces over all particle numbers is assumed or needed.

`<1>5.` H_* extends the free direct-sum minimal Laplacian of convention 8.
For a finite-sector compactly supported smooth ψ all traces vanish, and
`q_*(φ,ψ)=〈φ,−Δψ〉` for every form-domain φ by distributional integration
by parts. The vacuum also has zero action. BY the exact weak-domain formula.

`<1>6.` Choose smooth u_m and u_n, supported near their selected faces, with
`ℓ_m(u_m)=ℓ_n(u_n)=1`. Such functions exist: take a nonzero face function and
extend it constantly in a short normal collar with a smooth cutoff, then
normalise its nonzero functional value. Their bulk energies are the same
in u_m+u_n and u_m−u_n, but the added energies are respectively 0 and 4.
Thus q_* does not split by particle number.

`<2>1.` To justify the operator conclusion without a representation theorem,
`Ran((H_*+1)^{-1})` is form dense: a form vector q_*+1-orthogonal to every
resolvent vector w satisfies `〈u,f〉=0` for every f by the variational
identity, so u=0.
`<2>2.` If every P_k reduced H_*, its operator domain would split and
`q_*(w)=q_*(P_kw)+q_*((1−P_k)w)` there. Hence P_k would be a contraction
in the form norm and the same splitting would extend to the entire form
domain by `<2>1`. This contradicts `<1>6`.

`<1>7.` The countertarget therefore violates the necessary invariant `<1>2`
and is not attainable. QED BY `<1>1–6`.

The hypotheses have explicit instances in the examples table. The constructed
target is nonlocal along the collision faces, and couples faces of different
dimension. This is deliberate: the conjecture says *every* C-equivariant
Lagrangian boundary condition, without spatial locality. N3 refutes that
statement; it does not claim to refute a precisely restricted, local target
class. Such a class must first specify its allowed kernels and stratum maps.

## 9. Naturality, the category's role, and the range-r boundary

**E6-P3 [proven; L0, naturality of the nonrelativistic construction only].**
Let a unitary tensor equivalence carry `(O,η,X)`, all reaction maps, and all
couplings to the primed data. The equivalence induces unitaries W on F and
W_ε on finite carriers such that

`K'_εW_ε=WK_ε`, `H'_εW_ε=W_εH_ε`, and `H'=WHW*`.

ASSUME this transported data, with coherent tensorator/unit identifications.
PROVE the three identities.
`<1>1.` The equivalence preserves the dagger and identity of each simple,
so `s*t=〈s,t〉id_c` proves that its fibre maps are unitary, after relabelling
simple representatives. It preserves the orthogonal pointing and summand maps.
BY Penneys:219-237,528-530 and the definition of unitary tensor equivalence.
`<1>2.` Coherent tensor transport intertwines every insertion B,V and each
vacancy hop. Scalar box functions are unchanged. Hence both finite identities
hold exactly. BY `<1>1`, the displayed D maps, and CA-77's K formula.
`<1>3.` Spatial derivatives and traces commute with the constant fibre
unitaries. Therefore `q'(Wφ,Wψ)=q(φ,ψ)` with equality of form domains.
The variational domain in L2 gives the continuum identity. QED.
Composition uses the tensorators' given coherence, not an independent choice
of fusion bases. This is not R5 functoriality for a CFT-producing algorithm.

The category enters in the fibres, allowed reaction Hom spaces, all coherent
insertions, the support cones in T2, and obstruction G_r. In fixed fusion-tree
bases those inserted maps can contain F-matrices. The analytic estimates are
inert to that presentation: they use only finite-dimensional norms, bounded
maps, and the spatial exclusion grid. Neither braiding, twist, modular data,
nor a conformal central-charge lift enters. L0 does not select b,v,μ, or the
contact tuning, and this construction does not recover a sector category.

**E6-P4 [proven finite-stencil robustness; conditional extension boundary].**
For a fixed sector and a collision patch separated from all other collisions,
replace an adjacent-pair sample by one reachable through at most r allowed
nearest-neighbour moves, with each edge used a bounded number C_{n,r} of times
over the face grid. Then

`‖A_ε−A'_ε‖²_L²(U) ≤ C_{n,r} ε E_ε,n →0`

for bounded-energy sequences. ASSUME the stated paths and multiplicity bound.
PROVE the estimate. `<1>1.` Telescope along each path and apply
`‖Σ_{j=1}^r d_j‖²≤rΣ_j‖d_j‖²`. `<1>2.` Multiply by face volume
`ε^{n−1}` and sum. Compare with edge-energy weight `ε^{n−2}` in L3,
absorbing r and edge multiplicity into C_{n,r}. QED.

Thus the trace argument extends to finite stencils of this specified type.
If a positive range-r family controls the nearest-neighbour graph energy,
has only such codimension-one reaction traces and bounded lower-source maps,
and has the corresponding smooth recovery/closed-core property, L3 and T1's
variational argument apply term by term. This is a precise sufficient
conditional extension, not a claim about every range-r density. The already
proved nearest-neighbour family is itself within every larger range class.
N1 and N3 continue to obstruct arbitrary-density and surjectivity claims.

There is a real new issue at higher range: a tile creating three coincident
particles addresses a codimension-two stratum, whose trace is not controlled
by the H¹ energy used here. This can be checked directly, without citing an
extension theorem. In the two positive normal gap coordinates near a triple
collision, put `R=√(u²+v²)` and, for fixed small h, use a radial cutoff equal
to 1 for R≤δ, to `log(h/R)/log(h/δ)` for δ<R<h, and to 0 outside. Multiply
by a smooth compactly supported function of the tangential coordinate and a
unit fibre vector. Its L² norm tends to zero by dominated convergence, while
its normal gradient energy is bounded by a fixed multiple of

`∫_δ^h [1/(R log(h/δ))]² R dR = 1/log(h/δ) →0`.

Tangential derivative energy tends to zero too, yet its triple-stratum value
is the fixed nonzero tangential function. Piecewise radial cutoffs can be
smoothed at δ,h with the same vanishing bounds. The affine normal coordinate
metric changes only fixed constants. Hence no continuous H¹-to-triple-trace
map can exist. This proves failure of this proof's trace hypothesis for such
tiles; it does not exclude other renormalised higher-range constructions.

## Check bundle and research audit

Command from the repository root:

```
python3 explorations/2026-10-22-astra-r2/E6-number-changing-continuum/checks/check_e6.py
```

`checks/raw_output.txt` records five passing invariant groups and three
deliberately wrong mutations caught: wrong reaction powers, omitted contact
attraction, and wrong Gram moment. The tests check exact scaling exponents,
the contact identity, the finite coefficient image, vector-valued collar-edge
counting/inequality, and the N1 one-particle resolvent bound. Maximum numerical
matrix size is 128; the exact collar grid has three particles and ten sites,
without a category-specific Hamiltonian. These checks support finite algebra
and counting steps, not the infinite-dimensional convergence theorem.

Two GPT-6.1 xhigh collaborators were used: one derived and checked the local
collar argument, and one independently audited N1, the core/closedness proof,
the collar counting and kernels, the operator-action correction, and the
surjectivity obstruction. Corrections incorporated include aggregate-map
cancellation, the all-uniform-mesh density qualification, one nested patch
per face, and the distinction between fixed h and the tuned density family.
This note's numbered arguments carry the evidence; reviewer agreement is not
substituted for a proof or advertised as external validation. Selected raw
collaborator output and the applied corrections are in `checks/review_output.txt`.

## Results ledger

- E6(a), universal fixed-density full-Fock resolvent limit — **negative**: N1 supplies a counterexample for every nonzero X, immune to scalar renormalisation.
- E6(b), universal chamber-Laplacian classification — **negative** with (a); zero hopping also refutes a mandatory nonzero Laplacian. Separately, N2 proves that the repaired tuned limit requires lower-sector interior sources and a different extension problem.
- E6(c), surjectivity onto all C-equivariant collision extensions — **negative**: N3 gives a conserved-occupation obstruction and an explicit inaccessible self-adjoint extension.
- E6-P1, corrected fusion/pair/contact powers — **proven** by the displayed square expansion and box scaling.
- E6-L1, fixed-sector smooth density and trace bounds — **proven** by dilation, convolution, and pyramid integration.
- E6-L2, maximal form closedness, finite-particle smooth core, and associated self-adjoint operator — **proven** without analytic hypotheses imported from D1-C.
- E6-L3, collision-trace Mosco lower bound — **proven** by local collars and positive exhaustion; no uniform particle-number bound is assumed.
- E6-T1, full tuned D1-C projected-resolvent convergence and aggregate criterion for number change — **proven** using D1-T7 recovery and L1–L3.
- E6-P2, weak operator domain and regular-vector collision/interior equations — **proven**; any claim of global H² regularity remains **conditional** on a separate regularity theorem.
- E6-T2, finite moment-cone image of the repaired family — **proven**, with explicit reconstruction of finite reaction lists.
- E6-P3, unitary tensor-equivalence naturality — **proven** for transported microscopic data at the nonrelativistic layer.
- E6-P4, bounded-offset face-sample robustness — **proven**; general range-r convergence is **conditional** on the listed control, trace, and recovery hypotheses.
- Higher-codimension H¹ trace obstruction — **proven** by the logarithmic cutoff computation.
- Full image of arbitrary cutoff-dependent local densities and a local stratified-boundary classification — **conjectural/open**, not settled by T2.

## Layer tags

- **Setting:** `any` with respect to chirality; open interval, ordered configurations, nonrelativistic spatial kinetic energy. Neither a chiral nor a full conformal target is selected.
- **Data layer:** L0 unitary fusion data, plus declared pointed carrier and microscopic reaction/kinetic coefficients. L1–L4 are unused. There is no undeclared conformal enrichment.
- **Rung:** CA-77 supplies R0's Hilbert/corner carrier. T1 proves a nonrelativistic dynamics limit (the brief's “R1 for dynamics”). In CA-88's stricter terminology R1 means a Wilson-triangle limit state, which is **not** proved here; the result is below R3 and outside that state/mode ladder. No R2, R3, R4, or CFT-level R5 claim is made.

## What this gives the integration

D1-C's analytic assumptions and liminf gap are removed for its actual tuned
positive-square Hamiltonians. CA-77's configuration carrier now has an explicit
general family of rigorously convergent number-changing dynamics and a finite
coefficient-image calculation. The repaired scaling and the weak operator
domain are concrete interfaces for the (ak) tiles.

The distinction from E6 is substantive: a contact-tuned cutoff-dependent
family is necessary to this theorem, and number change is encoded by coupled
collision traces and lower-sector interior sources. Local unital observable
refinements, a common Wilson state, mode estimates, and conformal fidelity
remain separate joins. The result neither selects dynamics from C alone nor
reduces their selection to a universal Lagrangian Grassmannian.

## Open problems

1. **Fixed-density classification lemma:** characterise which leading tile blocks admit a common low-density energy reference on all sectors, allowing only explicitly stated counterterms. N1 shows that a scalar alone is insufficient.
2. **Local stratum-domain classification lemma:** define an admissible spatially local, charge-preserving boundary/source class, including its Hilbert trace topology, and determine which coefficients are attainable beyond the positive moment cone T2. N3 applies to the larger unrestricted target class.
3. **Regularity lemma:** characterise D(H) beyond its exact variational description, especially at intersecting collision faces; establish or disprove sectorwise H² estimates with reaction sources. T1 does not require this lemma.
4. **Higher-range trace lemma:** give a renormalised treatment of codimension-two and higher cluster reactions, or identify a subfamily for which finite-range dynamics closes on codimension-one traces. P4's path estimate does not supply higher traces.
5. **Same-state integration lemma:** construct local unital observable refinements and states compatible with these H_ε and establish WT-1; then identify a conformal critical regime and prove the KS/VR-1 and fidelity conditions. A nonrelativistic resolvent limit is not this lemma.

## Examples table

Specific categories enter only here; none is used to prove the analytic theorem.

| Instance | Calibration / obstruction | Evidence |
|---|---|---|
| Any C, X=0 | F is the vacuum line. b=v=0; active zero reaction maps have zero upper projection. T1 gives H=0. | Orthogonal sum decomposition and §2. |
| Any C, X≠0, pure-hop density | No scalar subtraction yields the asserted full-Fock limit. | N1, general proof; scalar coordinate check in `checks/raw_output.txt`. |
| Finite-dimensional graded Hilbert spaces for a cyclic group of order d>r, X the generating one-dimensional grade | X⁰,…,Xʳ are different simples, so G_r holds. Sectors m=2 and n=d+2 have the same charge and nonzero fibres. N3 applies; for nearest-neighbour range take d=3. | Penneys:20,277-282; multiplication of grades and degree-preserving Hom spaces. |
| Any C with M≠0, equal weights on b and −b | Individual reaction tiles are nonzero, but β=0; with ν=0 the continuum conserves N. | T2's displayed expansion; no category-specific fusion rule. |
| Any C with W≠0, one v≠0 of positive weight | ν≠0 gives a genuine vacuum/two-particle coupling; T1 applies with all fusion fibres retained. | T1, P2, and T2. |

## Sources used

Line anchors below refer to local files read for this work. New analysis is
proved in this note, not attributed to an absent analytic reference.

- `CONVENTIONS.md:631-694,740-800,1397-1519,1521-1537`: word algebra, placement, proof, tile, energy-sign, pointed-carrier and layer conventions.
- `references/text/PenneysUnitaryFusionCategories.md:20,195-237,277-288,394-398,470-478,528-538`: graded maps; unitary semisimple categories; orthogonal sums/splittings; graded tensor categories; coherence; finite multiplicities; isometry inner product (not its optional graphical basis rescaling).
- `references/manifest/SOURCES.md:35,57` and `references/category-theory/SOURCES.md:1-25`: local categorical-source provenance.
- `report/sections/77_pointed_carrier_invariants.tex:96-126,207-261`: occupation grading, ordered-configuration carrier, contact caveat, and the prior unproved dynamics boundary.
- `explorations/2026-10-22-astra/D1-carrier-theory/NOTE.md:9-112,399-455,483-557`: exact positive-square family and conventions, carrier theorem, smooth recovery, source bounds, and the prior conditional variational argument.
- `explorations/2026-10-22-astra/D1-carrier-theory/REVIEW.md:78-98,131-139`: contact tuning, analytic role of the category, and the prior liminf gap.
- `explorations/2026-10-22-astra/D1-carrier-theory/INTEGRATION.md:92-141`: reformulated target, proposed first trace lemma, and declared missing hypotheses.
- `explorations/2026-10-22-astra/D1-carrier-theory/checks/review_contact_check.py:1-44`: the two finite contact Hamiltonians; used to audit the density identity, not as a continuum proof.
- `report/sections/88_layered_targets.tex:41-108`: setting/input/rung definitions, particularly R1 as a Wilson-state claim.
- `literature/md/girardeau_jmp_1_516_1960/girardeau_jmp_1_516_1960.md:65,88`: inspected point-core discussion; does not fill the extension/Mosco source gap and is not used as a convergence theorem.
- Local derived evidence: `checks/check_e6.py`, `checks/raw_output.txt`; command, dependency versions, exact assertions, rejected mutations, and producer SHA256 are included in the bundle.
