# D2 — Selecting categorical Hamiltonians by geometric stress and renormalisation

**Status: exploratory conjecture; proved finite algebraic reductions and conditional analytic bridges.**
2026-10-22. General unitary fusion category throughout; no category-to-CFT existence theorem claimed.

## Headline conjecture

**D2-C — Geometric Ward–renormalisation selection conjecture.**
Let C be a unitary fusion category, O a nonzero tensor-generating site object,
and choose the boundary/module system, periodic closure, metric coordinates,
and positive real velocity specified below. Consider a Hermitian local density
`h(c) in End_C(O tensor O)` and `H(c)=-sum_j h_j(c)`.
Suppose it admits a **geometric stress certificate**, in the precise sense of
conditions C1–C6 below: regular local imaginary-time gates; a positive,
quantitatively convergent categorical blocking hierarchy; local Ward equations
for its metric derivative, including contact terms; separating positive boundary
probes and one-sided differentiated-collar bounds; and compatible local unital
observable refinements. Require a nonzero separated stress two-point limit.

Then the corresponding critical scaling limit exists as a local unitary
two-dimensional conformal theory with positive conformal energy. Its stress
tensor is the limit of the **standard Hamiltonian-density Koo–Saleur modes**,
on a common invariant core with convergence of finite products, and real smooth
stress smearings generate the full projective unitary circle-diffeomorphism
actions. The limiting state is the Wilson-triangle state of the same refinements.
Here “local conformal theory” means a vacuum Hilbert-space net on double cones,
with isotony, spacelike locality, positive translation energy and covariant
projective actions of the two circle-diffeomorphism groups; stress generates them.
The central charge is the coefficient selected by the Ward contact equations,
not a number read from fusion dimensions.

This is a sufficiency conjecture for **every C**, not an assertion that every
`(C,O)` admits such a certificate. All six conditions are defined on microscopic
cells, boundary forms, and their scale-dependent contractions. No continuum
CFT or limiting Virasoro representation is assumed; C3 supplies sufficient
microscopic estimates for parts of VR-1 through the proved collar lemma below.
The main unproved implication is from geometric Ward transport to the required
operator domains, energy positivity and local unitary implementation.
The explicit estimates in §6 prove portions of this implication.

For modular C, equality of the continuum *chiral sector* category with C is
**not** part of this conjecture. The defect survival criterion in §5 supplies
the bridge to D5; chiral completeness and modular fidelity are additional work.
A theorem producing a faithful defect action is already stronger than merely
finding a gapless categorical chain, and still weaker than the north star.

## 1. Conventions proposed and evidence boundary

The root conventions (a)–(ai) were read. This note proposes the following local
additions only; it does not amend the canonical ledger.

1. Simples are unit-first, with all multiplicity indices retained. Fusion-tree
   kets are left-associated and orthonormal; dagger is conjugate transpose.
   F maps left-tree coordinates to right-tree coordinates, so a right-pair
   operator on a left triple is `F†(1 tensor D)F`. Use the positive spherical
   trace, with raw duality cups of squared norm `d_a`; do not erase orientations
   or Frobenius–Schur signs. Root (a),(b),(r); [P]:1010–1019.
2. Here `h` is the *negative* of physical bond energy: `k=-h`, `H=sum k_j`.
   Thus `G(t)=exp(t h)=exp(-t k)` and `G'(0)=h`. This is CA-86's sign,
   explicitly bridged to root (h),(af). Scalars in h change normalization;
   positive overall scale changes velocity. Neither is a criticality condition.
3. Write `c` for the vector of real coordinates in a Hermitian tile basis;
   use `c_conf` for a proposed conformal central charge. In diagram/matrix-unit
   bases coefficients can be complex, constrained by `h†=h`.
   No entrywise positivity of diagram coefficients is assumed.
4. Spectral `R(u)` below is the **checked**, regular operator on `O tensor O`,
   with `R(0)=1` and additive, dimensionless spectral parameter. It is distinct
   from a categorical braiding `b=c_(O,O)`. Braiding is used only when supplied;
   the positive crossing is chosen to be `c_(O,O)`, without choosing numerical
   R-symbol phases. Reparameterizing u nonlinearly changes additive YBE.
5. A geometric tile has four cyclically ordered, oriented boundary ports.
   Incoming legs are dualized, never identified with outgoing legs by fiat.
   Blocking pairs adjacent ports using the associator. Rotation transports
   port types and coordinates; it is not a silent self-duality identification.
   A two-by-two patch P has four cells and eight exposed fine ports, paired
   into four coarse ports. For a staggered brick lattice retain its finitely
   many cell types and orientations; equations below apply to that fixed P.
6. Scale `n>=0` has spatial spacing `a_n=2^-n` and `N_n=N_0 2^n` sites
   on a fixed circle. Boundary cutoffs are independent and may grow.
   Blocking runs toward larger spatial cells; refinement runs oppositely.
   All comparisons must name their common boundary identification.
7. Positive Gram forms are quotiented by their invariant radicals *before*
   inversion. Inner products are linear in the second argument. All coefficient
   error norms below are spectral matrix norms, not entrywise maxima.
   Exact checks use rational/symbolic arithmetic, with no rank tolerance.
8. Periodic KS uses exactly root (af), with physical density k in velocity-one
   units, forward current `J_j=i[k_j,k_(j+1)]`, positive phase for the unbarred
   modes, and separate `e_n,b_n,c_n,c_n^star`. CA-70 has an older midpoint/sign
   ansatz; we do not identify it with (af) without a density/offset comparison.

Source aliases are expanded with path and line anchors in **Sources used**.
CA-86/87 and [LW] were read from the existing local remote-tracking object
`1f402aaf96d2ffb9d8efb0684836d4771bbd5f60`, not fetched.
Its convention labels (ac),(ad) differ in meaning from this working tree's:
only formulas checked here are imported. The branch's broad criticality and
commuting-transfer language is not adopted as a theorem.

### 1.1 The finite coefficient compiler

Choose bases `D_alpha` of `B_2=End_C(O^2)` and `E_mu` of `B_3=End_C(O^3)`.
Let `G_(alpha beta)=tr_C(D_alpha† D_beta)` and
`tau^alpha(X)=sum_beta (G^-1)_(alpha beta) tr_C(D_beta† X)`.
These are coordinate functionals: `X=sum_alpha tau^alpha(X)D_alpha`.
The trace is faithful since `B_2=direct-sum_a M_(m_a)` and its restriction
is the ordinary matrix trace times the strictly positive number `d_a`.
This also proves `G>0`. The block decomposition is finite semisimple linear
algebra; positivity uses [P]:1010–1019, with no chosen model.

Define multiplication and triple-placement constants by

    M^gamma_(alpha beta) = tau^gamma(D_alpha D_beta),
    A_alpha = D_alpha tensor 1,
    B_alpha = F†(1 tensor D_alpha)F,
    Y^mu_(alpha beta gamma)=sigma^mu(A_alpha B_beta A_gamma),
    Z^mu_(alpha beta gamma)=sigma^mu(B_alpha A_beta B_gamma).        (1)

Here sigma is the same dual-basis construction on B_3. Closing each diagram
against a dual basis element computes these constants by `Ev_C`, using F,
duality, dimensions, multiplicity maps and inverse Gram matrices. Saying
“F supplies the constants” abbreviates this entire normalization ledger.
AFM's channel-projector formula [AFM-S]:499–552 is the multiplicity-free
diagonal special case; general inputs need matrix units between multiplicities.

The exact gate coefficients satisfy a finite ODE, rather than a first-order
approximation masquerading as an exact history sum:

    w_alpha(0)=tau^alpha(1),
    d w_gamma/dt = sum_(alpha beta) c_alpha w_beta M^gamma_(alpha beta),
    G(t)=sum_alpha w_alpha(t)D_alpha=exp(t h(c)).                   (2)

Expanding the gates in any finite brick circuit now gives an **exact** weighted
sum of evaluated histories. Only the circuit-to-`exp(-beta H)` comparison
needs a Trotter limit. CA-86:80–93 instead uses first-order tiles and a remainder.
The same distinction matters when feeding c into all the equations below.

## 2. Coarse-graining equations: evaluation is coherent, weights flow

### 2.1 Exact blocking, retained coefficients, and leakage

Let `T(B)` denote the four-port morphism space with boundary object B and
the orientations of §1. For basis tiles `D_alpha` on B, contracting P gives
`mathcal B_P(W) in T(B tensor B)`, with coefficients

    b_beta(w)=sum_(alpha1,...,alpha4)
       C^beta_(alpha1...alpha4) w_alpha1 ... w_alpha4,
    C^beta_(alpha1...alpha4)
       =tau_new^beta(Ev_C(P[D_alpha1,...,D_alpha4])).              (3)

For different cell types use the appropriate four coefficient lists.
This is a finite degree-four polynomial map for each finite boundary cutoff.
It does **not** in general map `End_C(O^2)` back to itself.
The first blocking already enlarges each exposed edge to `O tensor O`.

Supply an isometric retained-boundary map `V:B' -> B tensor B`, or a more
general explicitly typed retained-tile isometry `I:T_ret -> T(B tensor B)`.
The latter isometry uses the categorical Hilbert forms and includes its
normalization. Set `pi=I†`, `b=pi mathcal B_P`, and

    leakage L(w)=(1-I pi)mathcal B_P(w),
    F(w)=b(w)/ell(b(w)),                   ell(w)=1.              (4)

The linear normalization ell is fixed; work in a chart where its denominator
is nonzero. Reflection positivity must be checked on glued reflected patches,
not inferred from `ell(b)>0` or from positivity of a single matrix.
If no truncation is used, take the full new boundary object; there is then no
leakage but no fixed finite-dimensional coupling space either.

**D2-L1 [proved: exact re-expansion and the compression obstruction].**
**ASSUME** finite categorical spaces, P fixed, and the isometries above.
**PROVE** (3), `mathcal B_P=I b+L`, and exact lossless compression of *all*
boundary endomorphisms by V requires V unitary.

`<1>1.` Expand each of the four slots multilinearly and apply the dual basis.
This gives (3). Associativity/coherence makes a changed contraction order give
the same morphism with the prescribed F transports. BY composition in C.
`<1>2.` `I pi` is the orthogonal projection onto retained tiles. Subtract it
to obtain the stated decomposition. BY `I†I=1`.
`<1>3.` If `X=V(V†XV)V†` for every boundary endomorphism X, set `X=1`.
Then `VV†=1`. Together with `V†V=1`, V is unitary.
`<1>4.` In particular, retaining the same nonzero O losslessly on every boundary
would require `O tensor O ≅ O`, hence `d_O^2=d_O` and `d_O=1`.
This does not prohibit exact closure of a special tensor or a restricted probe
space. It prohibits a universal fixed-carrier compression. QED BY `<1>1`–`<1>4`.

`Ev_C` is therefore **compatible with** blocking; it does not make the
Boltzmann ensemble invariant. Internal tile sums, normalization, discarded
boundary channels, and geometric rescaling are the entire dynamical problem.

### 2.2 Fixed points and the tangent equations

For a genuinely closed, identified retained space, the exact equations are

    b(w*)=lambda w*,  ell(w*)=1,  L(w*)=0,
    lambda=ell(b(w*)) != 0.                                     (5)

For a hierarchy replace equality by `b_n(w_n)=lambda_n w_(n+1)` with the
declared boundary maps, and keep an explicit norm bound on every `L_n`.
Taking roots of the retained equations while dropping L is a different,
uncontrolled approximation. The equations on c are (2),(3),(5) composed,
or stable-orbit versions thereof; the exponential makes them analytic in c.

On the slice `ell(delta w)=0`, direct differentiation gives

    DF_(w*) delta w
      =lambda^-1 (1-w* ell) Db_(w*) delta w,                     (6)
    Db_(w*) delta w = pi sum_(q=1)^4
      Ev_C(P[w*,...,delta w in slot q,...,w*]).

The leakage tangent must also vanish for an exactly closed perturbation.
An eigenvalue mu is contracting when `|mu|<1` under the chosen blocking;
one may *define* its scaling exponent as `y=log_2|mu|`. Identifying
`y=2-Delta` needs a local perturbation and a continuum scaling identification.
Gauge changes, scalar normalization and coordinate/velocity changes are
redundant directions; marginal directions and nonnormal amplification require
separate analysis. Eigenvalues alone give no nonlinear or all-scale estimate.

There is no category-independent list of c solving (5): P, retained spaces,
geometry and positivity are additional input, and some choices have no root.
This is a specified search problem, not an unspecified “flow g_L”.

### 2.3 Restore Euclidean covariance, not full topological invariance

[LW]:545–584 motivates a **topological-phase ground-state** fixed point;
[LW]:780–795 identifies commuting projectors and a doubled topological phase.
It is not a selection theorem for a nontrivial one-dimensional critical chain.

**D2-L2 [negative, proved].** If the unnormalized generating functional, in a
fixed metric-independent normalization, is unchanged under every compactly
supported metric variation for all fixed external probes, its metric
derivative vanishes. If stress is *defined* by that derivative, all its
separated insertions vanish (differentiate with respect to two disjoint
variations). Normalizing the empty amplitude as Z/Z=1 does not meet this
hypothesis and says nothing about stress. Such a system cannot have the kernel required
by D2-C. **ASSUME** smooth local metric dependence and metric independence.
**PROVE** the assertion. `<1>1.` Differentiate the constant amplitude once.
`<1>2.` Differentiate again at disjoint supports; repeat for any finite set.
`<1>3.` QED. Local dependence excludes cross-variation contact terms there.

The useful condition is instead covariance of `W(g)` under coordinate
rotations and rescalings, with nontrivial metric response. On the RG orbit
require the transported anisotropy residual to tend to zero summably.
A quarter-turn equation is only a finite rotation constraint; it does not
give arbitrary angles, scale invariance, a positive speed, or conformality.
Ordinary CFT correlators retain distances and cross-ratios. Isotopy applies
to *topological defects* and to the categorical part of the history.

## 3. Integrability: finite equations, useful obstructions, no universal selector

### 3.1 The coefficient equations and what “finite polynomial system” means

With `R(u)=sum_alpha r_alpha(u)D_alpha`, checked additive YBE is

    R12(u) R23(u+v) R12(v) = R23(v) R12(u+v) R23(u),             (7)
    sum_(alpha beta gamma) [
      Y^mu_(alpha beta gamma) r_alpha(u)r_beta(u+v)r_gamma(v)
     -Z^mu_(alpha beta gamma) r_alpha(v)r_beta(u+v)r_gamma(u)] = 0
                                                              for every mu.

The placement and constants are (1); [YBE]:156–170 is a source precedent.
This is finitely many cubic **functional** equations, not automatically a
finite algebraic problem in finitely many numbers. A polynomial/rational ansatz
of fixed degree gives a finite coefficient system after clearing denominators;
its denominators must be nonzero on the physical parameter interval.
An unrestricted analytic R instead gives infinitely many jet equations.
The density is `h=R'(0)` up to scalar normalization and velocity rescaling.
Regularity, Hermiticity of h, reflection positivity, physical branch and the
transfer closure/boundaries are independent constraints.

**D2-L3 [proved: a cubic necessary equation directly on c].**
For nonzero O, an analytic regular solution of (7) implies

    [h12+h23,[h12,h23]]=K23-K12,  some K in End_C(O^2).           (8)

**ASSUME** the conventions above. **PROVE** (8).
`<1>1.` Write `R=1+u h+u^2 a+u^3 b+...` and `A=h12,B=h23`.
The coefficient of uv in the residual is `2(a23-a12)+A^2-B^2`.
Consequently `q12=q23`, where `q=2a-h^2`.
`<1>2.` Any q with that overlapping equality is scalar.
`<2>1.` Partial trace over the first and third factors gives
`d_O q=tr_1(q) tensor 1=1 tensor tr_2(q)`.
`<2>2.` Trace again to see that each one-site factor is scalar; `d_O>0`.
`<2>3.` QED BY `<2>1`–`<2>2`.
`<1>3.` Multiply R by `1-kappa u^2/2` when `q=kappa 1`.
Scalar multiplication preserves (7) and h, and makes `a=h^2/2`.
Write its normalized third derivative as `r3`.
`<1>4.` With `P=a12,Q=a23,U=b12,V=b23`, the u²v coefficient before
substitution is `3(V-U)+PA-PB+QA+AQ-BP-BQ+ABA-BAB`.
Substitution gives `(K23-K12-[A+B,[A,B]])/2`, for `K=r3-h^3`.
The free-word expansion is independently checked in `checks/exact_checks.py`.
`<1>5.` Vanishing gives (8). QED BY `<1>1`–`<1>4`.

Let `D:K -> K23-K12` be its fixed coefficient matrix. Projecting the cubic
left side onto `coker D` produces finitely many explicit cubic equations on c.
All constants come from (1). This is a strong cheap **rejection test** for
analytic additive YBE, not a criticality test or a sufficient integrability test.
It works equally for multiplicities and vertex tiles. Higher jets remain.

### 3.2 What a loop quotient actually supplies

**D2-L4 [proved: TL reduction].** Suppose adjacent generators e,f satisfy
`e^2=d e`, `f^2=d f`, `efe=e`, `fef=f`. For `X_e(u)=1+x(u)e`, YBE has residual

    [x+y+dxy+xyz-z](e-f),  x=x(u), y=x(v), z=x(u+v).             (9)

**ASSUME** these relations. **PROVE** (9).
`<1>1.` Expand the left side to
`1+(x+y+dxy+xyz)e+z f+xz ef+zy fe`.
`<1>2.` The right side exchanges the e,f coefficients and leaves ef,fe
unchanged. Subtract. `<1>3.` QED BY `<1>1`–`<1>2`.
Thus, for `e!=f`, the scalar condition is
`x(u+v)=(x(u)+x(v)+d x(u)x(v))/(1-x(u)x(v))`.
Division requires `1-x(u)x(v)!=0`; the primary equation (9) does not.
When `d=2 cos(lambda)`, `sin(lambda)!=0`, a solution is
`R(u)=[sin(lambda-u)1+sin(u)e]/sin(lambda)`.
The scalar addition identity and a small noncommuting TL witness are checked.
For real lambda it requires `|d|<=2`; analytic continuation is not a
criticality theorem. The TL relations themselves require a representation
on the chosen O, not just a number named its loop weight. [TL]:453–458.

If the full two-site algebra is `span{1,e}`, all local R lie in this ansatz
near the identity after scalar normalization; (9) then classifies their
scalar functional constraint. If a selected diagram subalgebra is smaller
than `End_C(O^2)`, no exhaustion result follows. In the dilute case the
corresponding multi-tile algebra gives a different, larger coefficient system.
Off-diagonal multiplicity/vertex coefficients must be retained in (7),(8).

There are *decoupled* solutions in the full algebra whenever one-site operators
exist: `R(u)=exp(u(A tensor 1+1 tensor A))` satisfies (7), since all one-site
terms commute. Its Hamiltonian is on-site. This proves that enlarging the
solution set need not improve continuum dynamics. To prove non-TL membership,
take a nontrivial projection A: `A tensor 1+1 tensor A` has eigenvalues 0,1,2,
whereas an element of `span{1,e}`, `e²=d e`, d!=0, has at most two.
All three eigensubobjects are nonzero because tensor products of nonzero
objects have positive dimension. A genuinely interacting
vertex solution outside a declared loop quotient requires solving (7) and
proving non-membership, including after allowed blocking; none is constructed
here. CA-87:55–69 gives the general warning: `O≅Y tensor Ybar` turns an O
nearest-neighbour term into a pair-aligned range-four term, not necessarily
a nearest-neighbour integrable density on the unblocked chain.

### 3.3 Two failures of the supposed equivalence with commuting transfers

**D2-L5 [negative, proved and checked].** In the same TL algebra put
`B(x)=(1+xe)(1+xf)`. Then

    [B(x),B(y)]=xy(y-x)(f-e).                                  (10)

**ASSUME** the TL relations. **PROVE** (10).
`<1>1.` `B(x)=1+x(e+f)+x²ef`.
`<1>2.` `[e+f,ef]=f-e`, by cancellation of `d ef` and the two triple relations.
`<1>3.` Expand the commutator using `<1>1`; apply `<1>2`. QED.
For `e!=f` it is generically nonzero even when the gates satisfy (9).
This two-bond open sweep refutes an inference from local YBE to *arbitrary*
brick commutativity. It does not refute a properly closed transfer construction.

Conversely take any nontrivial one-site projection p and `h=p tensor p`.
All translated h commute. `X(u)=exp((u+u²)h)` gives commuting brick transfers
for every u, but its additive YBE sides differ by
`exp(-2uv(h12-h23))`, which is nontrivial generically.
The overlap trace argument proves `h12!=h23` unless h is scalar.
This also shows why the spectral-parameter convention matters.

CA-86:112–126 is correct **conditional on its explicitly assumed commutativity**;
its displayed odd/even sweep cannot simply be identified with a sourced
diagonal transfer matrix. [KS]:717–738 distinguishes these constructions.
Use a specified face monodromy with auxiliary closure [YBE]:163–170, or
appropriate boundary equations, then prove its sliding/trace argument.
Also `[H,T]=0` preserves a degenerate ground space; it does not make every
chosen ground vector a common eigenvector. Nondegeneracy is sufficient.

### 3.4 A braiding is not a spectral-parameter algorithm

For a **braided** C let `b=B12,c=B23` be its braid operators, so `bcb=cbc`.
For `R(u)=1+x(u)B`, direct expansion gives the residual

    (x+y-z)(b-c)+xy(b²-c²).                                    (11)

The cubic braid words cancel; the displayed quadratic obstruction remains.
If `xy!=0`, (11) forces `b²-alpha b=c²-alpha c` for a scalar alpha.
The overlap trace argument in L3 implies `B²-alpha B=beta 1`.
Conversely that quadratic relation reduces YBE to
`x(u+v)=x(u)+x(v)+alpha x(u)x(v)`; exponential, or linear when alpha=0,
solutions exist. This proves the limitation of **this linear ansatz**, not
nonexistence of higher polynomial Baxterisations. A unitary braid with more
than two eigenvalues cannot satisfy that quadratic relation.
Even a successful spectralisation still needs a Hermitian derivative and
the positive, critical physical regime. Unbraided C has no such B as input.

### 3.5 Continuum information is branch and representation data

The identity `R(u)=1` already solves (7) and gives zero dynamics and zero stress.
Hence YBE cannot imply criticality, a nonzero central charge, or fidelity.
The sourced TL/RSOS central-charge and weight formulas are recorded only in
the Examples table: they use a particular representation, boundary/twist
sector, parameter regime and spectral analysis [ZB]:785–796,1046–1055.
Loop weight plus YBE alone does not fix these choices. [AFM-S]:623 explicitly
warns against identifying the lattice category with the full primary category.

## 4. A categorical local holomorphicity problem

### 4.1 Endpoint transport and a finite rank condition

A candidate endpoint needs more data than an arbitrary tile observable.
Choose a defect object d with specified crossing/transport maps (for fusion-only
C these can be half-braiding data, or a declared module-defect construction),
endpoint spaces, dualities, a lifted spin s, and an oriented embedded cell.
The integer lift of s is not determined by a twist alone.
Let `q=sum_A q_A Q_A` be an endpoint tensor, with ports identified by those
transports. For fixed exterior boundary component beta define

    K_beta(w,q)=sum_(edges e,alpha,A)
        delta z_e w_alpha q_A H^(beta)_(e alpha A)=0,            (12)
    H^(beta)_(e alpha A)
        =tau^beta(Ev_C(cell[D_alpha,Q_A at e; defect transport])).

Edges are counterclockwise, `delta z_e=z_(e+1)-z_e`; any winding phase is
part of the declared endpoint transport, not absorbed into an unexplained F.
For fixed geometry and transports (12) is bilinear in w,q and linear in q.
Normalize q by a positive reflected norm, require it nonzero modulo
correlation-null fields, and solve a rank-drop problem `ker K(w)!=0`.
Substitution of (2) makes a specified analytic condition on c.

**D2-L6 [proved: local relation versus all environments].**
**ASSUME** a typed residual morphism K and exterior contexts spanning its
full dual under the positive trace pairing. **PROVE** K=0 iff every exterior
contraction vanishes.
`<1>1.` K=0 gives all contractions zero by linearity.
`<1>2.` Conversely use the exterior dual K†; its contraction is
`tr_C(K†K)=0`, hence K=0 by faithfulness. `<1>3.` QED.
If physical contexts do not span that dual, only correlation-nullness follows.
This is the exact tomography obligation behind “holds under the history sum”.

Summing exact local contour equations cancels interior oriented edges, giving
a boundary equation. With residuals the boundary error is their sum, with
transport/operator norms included. This finite telescoping statement does not
give compactness, boundary-value uniqueness, or a continuum analytic function.
[CGS]:529–532,603–624 distinguishes partial local CR from its convergence proof.

### 4.2 The stress restriction makes holomorphicity useful

The equation with q=0 holds everywhere. Constant/null observables and a decoupled
spectator can produce other vacuous rank drops. Therefore no universal
“some discrete-holomorphic observable exists iff c is critical” is justified.
Nor is exact microscopic holomorphicity necessary for an emergent CFT.

The stronger selection unknown is a *geometric family* `W(g;c)`, not a freely
fitted observable. For a local shear parameter eta set

    Q_eta = partial_eta W(g;c)|_(eta=0),
    partial_eta Z = sum_cells Z[Q_eta inserted].                (13)

For normalized expectations subtract the derivative of log Z. Require the
complex spin-two combination Q to satisfy (12), exactly or with controlled
scale errors, and its contour around every probe to give the probe's
coordinate variation. Contact contours around Q must give
`T T ~ (c_conf/2)z^-4+2T z^-2+(partial T)z^-1`, with the root (ad) signs.
This is an equation to solve, not a categorical identity.
The homogeneous contour equation away from insertions cannot determine these
contact coefficients or the central charge.

The time-deformation derivative must be the physical density k, and the mixed
space-time response must match its continuity current, with controlled density
improvements. Otherwise one has an unrelated conformal observable, not KS.
[CGS]:625–626,758–769,1123–1127 motivates geometric stress; it does not prove
these general-category equations have solutions. The relevant search is the
intersection of (12),(13), reflected positivity and the critical RG basin.

## 5. Defect symmetry constrains the search space, not the critical point

Fix a coherent regular boundary/module realization with annular defect lines.
Sliding a defect past a local tile gives a linear residual

    Q_(a,alpha)=Ev_C(defect a before D_alpha)
                -Ev_C(D_alpha after defect a),
    sum_alpha c_alpha Q_(a,alpha)=0.                            (14)

In the categorical naturality construction the first line vanishes for every
tile: reassociating the external action commutes with the morphism D_alpha.
Here the crossing/module tensorators are specified and natural for **every**
endomorphism of the chosen local object, with coherent boundary closure.
Fusion labels or arbitrary crossings alone do not imply this hypothesis.
Thus (14) imposes **no additional equations on c** inside that construction.
If one starts with a larger, noncategorical local operator ansatz, (14) cuts
out its symmetry-preserving subspace. A fixed open charge sector alone need
not carry every defect as an endomorphism; boundary sectors and closure matter.

[AFM-S]:536–552 and [AFM-D]:53–68,109–163 establish the diagrammatic mechanism
and its weaker-than-YBE nature. Their stated simplifications include self-duality,
multiplicity-free fusion and FS signs [AFM-F]:175–184. For arbitrary C one must
restore arrows and multiplicity morphisms; the extension here uses naturality,
not their scalar formulas unchanged. A defect realization is declared data.

**D2-L7 [conditional, proved: survival, not completeness].**
**ASSUME** a common limiting Hilbert system; defect and junction operators
converge strongly there, with uniform bounds, adjoints, and compatible local
placements. Their finite products obey the categorical relations. Assume
the matrix of reflected norms of each chosen junction basis has lower bound
`eta 1`, eta>0, in the limit after prescribed normalization.
**PROVE** these relations and independent junction morphisms survive.
`<1>1.` If `A_n->A`, `B_n->B` strongly and uniformly bounded, then
`A_n B_n v-ABv=A_n(B_n-B)v+(A_n-A)Bv ->0` for every v.
`<1>2.` Induct over finite products and pass every finite categorical relation
to the limit. Use strong adjoint convergence for dagger relations.
`<1>3.` The Gram lower bound keeps each junction linear combination nonzero.
`<1>4.` QED BY `<1>1`–`<1>3`.
This gives a faithful transported action on these morphism spaces. **Fullness**,
distinct simple images and absence of additional intertwiners are separate;
without them even “contains C as a full subcategory” is too strong.

Unbounded stress commutation needs a common-domain argument or commuting
bounded dynamics, not just `<1>1`. Symmetry can survive in a gapped theory;
it neither selects velocity nor fixes relevant couplings. A neutral spectator
also preserves the categorical action while changing continuum content.
For modular fidelity D5 must identify chiral sectors, twists, all junctions,
and completeness; fusion-defect relations alone are insufficient.

## 6. Quantitative content of the conjecture

### 6.1 Two finite-to-analytic bridges and a collar lemma

**D2-L8 [conditional, proved: normalization and contraction give WT-1].**
**ASSUME** positive nonzero functionals F,G on the same unital C*-algebra.
**PROVE** with `z=F(1),w=G(1)`,

    ||F/z-G/w|| <= 2||F-G||/min(z,w).                            (15)

`<1>1.` Subtract as `(F-G)/z+G(1/z-1/w)`.
`<1>2.` Positivity gives `||G||=w` and `|z-w|<=||F-G||`.
`<1>3.` Triangle inequality gives `2||F-G||/z`, hence (15). QED.

Now **ASSUME** nonnegative scale errors `d_(n+1)<=rho d_n+ell_n`,
`0<=rho<1`, `sum ell_n<infinity`. For fixed row k, suppose its *unnormalized*
environment functionals at n,n+1, after common transport, obey
`||F-G||/min(F(1),G(1))<=C_k d_n`.
**PROVE** Wilson row drift is summable, with

    sum_n d_n <= (d_0+sum_n ell_n)/(1-rho).                      (16)

`<1>1.` Iterate the recurrence to obtain
`d_n<=rho^n d_0+sum_(j<n) rho^(n-1-j)ell_j`.
`<1>2.` Sum the nonnegative geometric series to get (16).
`<1>3.` Apply (15) to each row: its drift is at most `2C_k d_n`.
`<1>4.` WT-1 applies when the supplied observable maps are local unital
injective *-maps. QED. A computable tail modulus additionally requires an
explicit computable summability majorant for ell_n, not just computable terms.
The normalizer bound and dual norm on **all norm-one observables** are essential;
cell normalization or agreement on a few vacuum probes does not supply them.

**D2-L9 [conditional, proved: Gram amplification].**
**ASSUME** positive quotient boundary Grams G_in,G_out and a residual
matrix Delta between their coordinate spaces. **PROVE**

    ||Delta||_physical=||G_out^(1/2) Delta G_in^(-1/2)||_2
      <= sqrt(lambda_max(G_out)/lambda_min(G_in)) ||Delta||_2.   (17)

`<1>1.` Write a physical unit input as `G_in^(-1/2)x`, `||x||_2=1`.
`<1>2.` Its output squared norm is
`x†G_in^(-1/2)Delta†G_out Delta G_in^(-1/2)x`.
`<1>3.` Take the supremum and use submultiplicativity. QED.
For rectangular residuals the formula is unchanged. Entrywise error epsilon
would need an additional square-root dimension factor; it is not our norm.

With `N_n` density terms, unit-modulus Fourier phases and KS prefactor
`N_n/(4 pi)`, a per-term physical discrepancy delta_n gives mode discrepancy
at most `N_n² delta_n/(4 pi)`. Thus, in this deliberately crude tier,
`sum_n N_n² sqrt(Lambda_n/gamma_n) epsilon_n<infinity` suffices for summable
mode transport. Here `gamma_n,Lambda_n` bound the appropriate input/output
Grams. If `Lambda_n` is bounded, `gamma_n>=g 2^-kappa n`, and
`epsilon_n<=C 2^-(2+kappa/2+eta)n`, eta>0, the series converges.
This is a conditional bookkeeping threshold, not a measured anyonic exponent.
Products/contact residuals have their own insertion counts and Gram factors.
Fourier cancellations can improve the crude bound; do not discard them when
single-site estimates fail. Ordinary (17) alone does not give graph norms.

**D2-L10 [conditional, proved: one-sided collar estimates give graph bounds].**
**ASSUME** finite Hilbert spaces, `K_n>=1`, an insertion or transported residual
M_n, integer s>=0, `0<=alpha<1`, and for `0<t<=1` the bound

    ||K_n^s M_n exp(-t K_n)|| <= b_(n,s) t^(-s-alpha).           (18)

For rectangular maps, the left K is the output control and the right K the
input control. **PROVE**
`||K_out^s M_n K_in^(-(s+1))|| <= C_(s,alpha)b_(n,s)`, uniformly in n.
`<1>1.` Scalar integration gives
`K^(-(s+1))=(1/s!) integral_0^infinity t^s exp(-tK)dt` by diagonalization.
`<1>2.` On (0,1], the integral norm is at most
`b_(n,s)/(s!(1-alpha))`, by (18).
`<1>3.` For t>=1 use (18) at t=1 and `K>=1` to bound the integrand
by `b_(n,s)t^s exp(-(t-1))/s!`, which is integrable.
`<1>4.` Add the two explicit constants. QED.
Uniform b gives mode bounds; summable b gives graph transport; vanishing b
gives residual bounds. For two losses use the explicit estimate
`||K_out^s R exp(-t K_in)||<=b t^(-(s+1)-alpha)`;
the same integral with power `t^(s+1)` gives right weight `K_in^(-(s+2))`.
This is a finite spectral-integral proof, not an appeal to a continuum theorem.

Two-sided collar bounds cannot replace (18). For example, on basis 0,...,n,
take `E_n=diag(0,...,n)` and
`X_n=exp(sqrt(n))(|n><0|+|0><n|)`. Then
`Tr exp(-t E_n)<=1/(1-exp(-t))` and
`||exp(-t E_n)X_n exp(-t E_n)||_1<=2 exp(1/(4t))`, by completing the square.
But `||X_n(1+E_n)^(-p)||>=exp(sqrt(n))` for every p.
**Proof:** apply it to the vacuum basis vector. This rules out inferring
polynomial stress bounds merely from unspecified collar nuclearity.

### 6.2 The microscopic certificate C1–C6, precisely

These conditions define the domain of D2-C; they are **extra data to synthesize**,
not properties asserted for arbitrary category input. They form a countable
system with certified inequalities, not a finite universal decision algorithm.

**C1 — actual local dynamics and geometry.** Supply analytic finite-support
gate families `G_n(t,g;c)`, `G_n(0,g0)=1`, with first time derivative giving
`h_n`, hence `H_n=-sum h_(n,j)`. Their finite-volume states and reflected
networks are positive. Shifted collar energies E_n are nonnegative; specify
normalized vacuum preparations with `E_n Omega_n=0`, converging through C5
to its cyclic vector and obeying the vacuum coordinate Ward equations.
On disjoint supports the local observable algebras commute. Shape derivatives
are the insertions in (13); their energy and forward-current responses are
`k=-h` and `J=i[k_j,k_(j+1)]`. Any geometric-minus-KS discrepancy, including
improvements, must have summable graph bounds after the full KS rescaling
by L9–L10. A merely bounded local coboundary is insufficient.
This last identification is an equation on derivatives of the gates, not
permission to fit arbitrary stress matrices. No finite-time logarithm is
assumed local. Physical velocity is positive and bounded away from zero.

**C2 — a genuine stationary scaling description.** Supply the maps (3),(4),
their null quotients, and identifications with a fixed Banach space X of
normalized boundary/cell hierarchies, with explicit norm and computable
description. After fixing scalar, basis and coordinate gauges, choose d_n
majorizing distance to W* and the specified transported residuals, with
`d_(n+1)<=rho d_n+ell_n`, rho<1, and a computable summability tail for ell_n.
The orbit converges to W*; L8 gives its summable control.
The norm controls the relative environment errors in L8 and the coefficient
errors of differentiated insertions below, with all leakage retained.
Simply retaining all boundaries and renaming `B^n(W)` as W_n fails this
condition. A finite Jacobian eigenvalue computation also fails it.

**C3 — reflection probes and tame differentiated collars.** Supply positive
boundary forms for every finite insertion/probe word, invariant null spaces,
and separating probe exhaustions. All geometric sewings converge with
computable collar-tail bounds, and `sup_n Tr exp(-t E_n)<infinity` for t>0
on each fixed physical circle. Supply positive controls `K_n>=1`, compatible
with refinement on their cores, and polynomial comparison of E_n with K_n.
For the finite Fourier sums of first metric insertions, and the differences
obtained by transporting them across one block, require (18), with mode
constants polynomial in the Fourier label, for every s. The b constants
are respectively uniformly bounded and summable after the counts in L9.
For two-insertion/contact diagrams require the corresponding two-loss bound
with constants tending to zero for the Ward residuals; every fixed longer
word has the analogous finite-loss, uniform bound. These bounds are on finite
contracted cells with specified collars; their synthesis is the hardest
analytic input. Trace bounds alone do not imply them.

**C4 — geometric Ward equations, including collisions.** On arbitrary
boundary probes, the same metric insertion obeys (12),(13) for coordinate
changes and generates the coordinate variation of every generating insertion.
More precisely, use density-valued Q_n obtained from (13) by the cell-area
and shear normalization fixed by C1; all z coordinates are physical. For each
lattice contour enclosing y but no other probe A, and polynomial f, impose

    (1/(2 pi i)) sum_(e on contour) delta z_e f(z_e) Z_n[Q_e Q_y A]
      =Z_n[(f(y) partial_n Q_y+2 f'(y)Q_y
              +(c_conf/12)f'''(y)1) A] + R_n(f,y,A).            (19)

Here partial_n is the symmetric horizontal difference divided by `2a_n`,
with the declared port transports. Contours/probes at fixed positive physical
separation exhaust all compact coordinate charts; collision limits use the
stated collar-tail estimates. Require analogous single-probe coordinate
identities, the barred formula and zero mixed residues. The TT OPE in §4.2
is shorthand for this finite identity and its controlled limits, not an input
continuum OPE. Anomaly/line transports are fixed under sewing. Allow residuals
only with the vanishing/summable constants of C2–C3. This includes enough
shape parameters to test continuous coordinate changes, not just C4 rotations.
No equality of finite-matrix central constants is imposed; both must converge
to the same `c_conf>0` selected by these contact equations.

**C5 — one observable/GNS system.** Supply coherent, support-controlled,
unital injective *-maps alpha between microscopic algebras. Their pulled-back
states satisfy the relative functional comparison in C2/L8. Boundary probes,
collar kernels and geometric insertions are realized in the resulting
compatible GNS system; `J K=K' J` holds on the stated control cores.
Raw vacuum insertion `a -> VaV†` is only a corner map, so it needs CA-72's
descent/completion work before it can serve here. This is not supplied by RG
tensor compression. The positive collars represent the physical time evolution
of C1 on this system, with their specified scalar energy subtractions.

**C6 — no collapse and full spatial locality tests.** For some fixed, separated
reflected stress smearings, the connected TT kernel has a finite nonzero limit.
Local insertion/probe words are cyclic in the reconstructed boundary Hilbert
space; their separated sewings and all coordinate transports satisfy C3–C4
uniformly on compact subsets away from collisions. Defect probes, if retained,
obey L7's survival bounds. Chiral sector completeness is not assumed here.

Under C1–C6, L8 constructs the state; L9–L10 convert specified geometric
estimates into the kinds of graph estimates consumed by VR-1. **Still open:**
prove that the discrete contour/metric transport really yields its algebraic
commutator residuals for the *prescribed* KS modes on all required probe words;
prove compatible positive-energy closures, strong locality and projective
integration. Formal contour identities alone do not establish these. Thus
D2-C is not advertised as proved by invoking WT-1 or VR-1.

### 6.3 Ranking and a concrete solver strategy

1. **Geometric stress plus controlled critical RG**, C1–C6: strongest candidate
   for sufficiency. It targets the missing state/operator estimates and connects
   microscopic dynamics to local geometry. Existence remains very difficult.
2. **Non-null holomorphic endpoint/stress equations with contact normalization**:
   the best local selector. A rank-drop search in (12), followed by (13), can
   sharply constrain c, but needs positivity and analytic estimates to succeed.
3. **Regular spectral YBE with a specified transfer construction and branch**:
   strongest algebraic candidate generator. Start with the cubic test (8),
   extend jets, then solve an explicit functional ansatz. It is neither
   generally necessary nor sufficient for the desired conformal limit.
4. **Isotropy or normalized blocking alone**: useful filters, insufficient.
5. **Topological symmetry alone**: indispensable for tracking sectors, usually
   automatic throughout the allowed coupling space, hence no critical selector.

For arbitrary C, compute (1), the local cokernel test (8), the blocking/leakage
tensors (3), and the endpoint matrices (12). Solve their joint constraints
inside Hermitian/reflection-positive families, with trivial/null solutions
explicitly rejected. Report the selected subset of coefficient space together
with all auxiliary choices; do not claim a canonical unique Hamiltonian.
The geometric equations can also be searched without imposing YBE.

### 6.4 Checks, review and scope of this session

Run `python3 explorations/2026-10-22-astra/D2-selection-principle/checks/run_checks.py`
to regenerate the bundle; `checks/exact_checks.py` also runs independently.
Eight exact groups check TL/YBE, the brick counterexample, the trigonometric
addition law, free-word YBE jets, the braid obstruction, the converse
counterexample, the normalized RG Jacobian and Gram transport. Largest matrix:
8 by 8. `checks/run.txt` retains baseline, deliberately broken brick ordering
and Gram inversion, and restored output; both mutations must fail assertions.
The check's rational TL parameter is an algebra witness, not an assertion
of a unitary fusion category with that dimension. No continuum computation ran.

Two GPT-6.1-xhigh collaborators audited the source/integrability claims and
the analytic selection proposal. Their objections led to the transfer correction,
the separation qualification in L6, and the one-sided collar requirement.
Only this directory is written; no root convention, worklog, report, commit or
network operation is part of this exploration. No new source was acquired.

## Results ledger

- D2-C — **conjectural:** C1–C6 imply a local positive-energy CFT with standard KS/OAR and full projective symmetry; synthesis and fidelity are separate.
- Equations (1)–(7),(12)–(14) — **scaffold with derived coefficients:** general categorical tile, blocking, YBE, holomorphicity and defect systems.
- D2-L1 — **proved:** exact polynomial re-expansion; discarded channels matter; universal lossless fixed-carrier compression has the stated obstruction.
- D2-L2 — **negative, proved:** full metric independence annihilates geometric stress.
- D2-L3 — **proved/checked:** analytic regular YBE implies a cubic cokernel equation on h; no converse.
- D2-L4 — **proved/checked:** TL YBE reduces to the scalar addition equation; exhaustion only in the stated local span.
- D2-L5 — **negative, proved/checked:** arbitrary brick commutativity and local additive YBE imply neither one another.
- Equation (11) — **proved/checked:** constant braiding needs extra quadratic structure for the linear spectral ansatz.
- D2-L6 — **conditional, proved:** separating exterior contexts identify local CR with a finite morphism equation.
- D2-L7 — **conditional, proved:** bounded strong transport and noncollapsed junction Grams preserve categorical relations, not fullness or sectors.
- D2-L8 — **conditional, proved:** normalized functional control and nonlinear contraction imply summable Wilson drift.
- D2-L9 — **conditional, proved/checked:** Gram conditioning and KS counting amplify coefficient errors explicitly.
- D2-L10 — **conditional, proved:** one-sided polynomial collar control implies graph bounds; arbitrary two-sided nuclear bounds do not.

## What this gives the integration

CA-62–CA-74 supply the categorical algebra, placements and corner/GNS questions;
equations (1)–(4) add exact dynamical coefficients and explicit blocking leakage.
CA-86 supplies the history interpretation; §3 corrects the unverified transfer
identification without discarding its exact finite composition mechanism.
CA-87's general blocking lemma prevents confusing new tile coordinates with
new dynamics; it gives no general integrable-Hamiltonian classification.

CA-14/CA-70 motivate density/current modes. Here the actual sign and offset
follow LC-4 and root (af), and L9 makes their amplification cost explicit.
WT-1 receives relative environment bounds through L8; VR-1 can receive
graph estimates through L10 after the remaining Ward/operator comparison.
LC-1–LC-5 receive metric-derived cells and their obstructions; LC-9/LC-10
receive reflected boundary probes, null descent and properly conditioned sewing.
The finite categorical constants do not replace their analytic carriers.

For D5, §5 separates preserved defect relations from full chiral-sector
identification. A modular input fixes central charge only modulo eight, and
holomorphic tensor factors preserve its category [EG]:333–335; [B]:374–381.
Thus a lift, target type and additional field/sector data remain explicit.
For D3/D4, the key next task is to derive C2–C5 jointly for the same local
Hamiltonians and refinement system, with controlled stress insertions.

## Open problems

1. Construct one general categorical blocking prescription with a useful
   stationary Banach description, positivity and computable leakage bounds.
2. Solve the joint geometric stress/rank equations beyond the loop subalgebra;
   classify when the cubic YBE obstruction extends to an analytic family.
3. Obtain separating physical probe spaces and one-sided collar bounds from
   category-derived dynamics, rather than supplying them as analytic inputs.
4. Prove D2-C's Ward-to-KS, energy-domain, strong-locality and integration steps;
   supply a falsifying certificate if C1–C6 still omit a necessary hypothesis.
5. Identify which enriched inputs have a nonempty solution set. Neither a
   universal existence theorem nor an algorithm deciding nonexistence is proved.
6. Recover complete chiral sectors and their modular data through D5; a stable
   defect action and a Virasoro stress tensor need not generate the full theory.

## Examples table

These are sourced calibrations, not constructions used in the general proofs.

| Input/instance | What is actually supplied | Limitation for selection |
|---|---|---|
| Dense TL/ABF with category A_(k+1) and distinguished spin-1/2 object | Loop parameter `d=2 cos(pi/(k+2))`; the two sign regimes have sourced `c=1-6/((k+1)(k+2))` and `c=2(k-1)/(k+2)`, respectively. [AFM-S]:586–621. | Same categorical input supports different conformal data; the lattice category is not the complete primary category, explicitly :623. |
| Dilute A_L, branches 1 and 2 | `d=2 cos(pi/(L+1))`; `lambda=pi L/(4(L+1))` or `pi(L+2)/(4(L+1))`; `c=1-6/(h(h-1))` with `h=L+2` or `L+1`. [ZB]:237–276,430–455. | A branch, representation and seam are extra data. This is sourced spectral analysis, not a general KS/OAR proof. |
| Same dilute A_L spectra | For branches 1/2, `Delta=((omega-phi)^2-(pi-4lambda)^2)/(8pi(pi-2lambda))`, with `phi=pi s/(L+1)` and `omega=pi(r-s)`; admissible integers follow the source's sector restrictions. [ZB]:362–367,592–607,785–796. Branches 3/4 use a different denominator and an extra sector contribution, :1046–1055. | Neither arbitrary integers nor arbitrary TL representations inherit this spectrum; a category-level universal formula is not established. |
| CGS honeycomb loop O(n) stress; n=1 Ising calibration | Partial CR equations for `n in [0,2]`; stress/OPE convergence proved at the stated n=1 critical point. [CGS]:527–532,603–624. | The general-n convergence assertion remains conjectural in that source; categorical CR is still an extension to construct. |

## Sources used

Paths are repository-relative. A range applies to the named source only.
`@branch` below means local Git object `1f402aaf96d2ffb9d8efb0684836d4771bbd5f60`;
read it by `git show <object>:<path>`, preserving the stated source line numbers.

- [P] `references/text/PenneysUnitaryFusionCategories.md:1010–1019`: positive trace, positive dimensions and unitary spherical structure.
- [LW] `references/string-net/LevinWen2005/source/strnet.tex@branch:482–584,780–813`: local rules, topological fixed-point interpretation and projectors. Manifest: `references/string-net/SOURCES.md@branch:19–94`.
- [AFM-S] `references/cft/AasenFendleyMong2020/source/_Statistical_mechanics_from_fusion_categories.tex:17–35,476–552,586–631`: free weights, projector Hamiltonians, TL relations, branches and category caveat.
- [AFM-D] `references/cft/AasenFendleyMong2020/source/_Topological_defect_lines.tex:53–68,109–174`: pull-through, naturality proof and boundary/transfer realization.
- [AFM-F] `references/cft/AasenFendleyMong2020/source/_fusion_categories_and_diagrammatics.tex:175–188`: assumptions that must not be silently generalized. Manifest: `references/cft/SOURCES.md:74–123`.
- [KS] `references/lattice-symmetry/KooSaleur1993/source/9312156.tex:717–744,1068–1108,1623–1673`: transfer ordering and limits/products caveat; general lattice Virasoro conjecture.
- [ZB] `references/lattice-symmetry/ZhouBatchelor1997/source/9611156.tex:105–145,237–276,340–367,388–455,592–607,785–796,1046–1055`: weights, seams, branches and spectral results.
- [CGS] `references/lattice-symmetry/ChelkakGlazmanSmirnov2016/source/StressTensor.tex:527–532,589–626,758–782,1123–1127`: proof boundary, CR and metric stress. The local extraction is v4, despite the directory's 2016 label.
- Lattice source manifests: `references/lattice-symmetry/SOURCES.md:9–101,1163–1235,1731–1783`.
- [YBE] `literature/md/1408.1282/1408.1282.md:149–170`: spectral YBE and the explicit auxiliary face transfer; used as a formula precedent, not a theorem for all C.
- [TL] `literature/md/1608.04927/1608.04927.md:453–458`: TL spectral operator and reliance on its algebraic relations.
- [EG] `references/cft-machine/realisation/EvansGannon2018/source.tex:333–335`; [B] `references/cft-machine/realisation/Bischoff2018/source.tex:374–381`: conformal-lift and nonuniqueness boundaries.
- Integration dependencies: `report/sections/14_koo_saleur_prototype.tex:11–42`; `report/sections/70_dilute_koo_saleur_ansatz.tex:11–52`; CA-86 `report/sections/86_spacetime_trotter_dictionary.tex@branch:59–126`; CA-87 `report/sections/87_dilute_fibonacci_is_blocked_golden.tex@branch:55–69`.
- Analytic interfaces: `cft_machine/research/wilson_triangle.md:16–108`; `cft_machine/research/virasoro_routes.md:50–177`; `reconstruction/04_cutoff_oar.md:17–155`.
- Sewing interfaces: `reconstruction/01_cells.md:17–153`; `reconstruction/09_four_port_equations.md:22–80`; `reconstruction/10_four_port_linearization.md:27–100`.
- Original derivations and finite verification: D2-L1–D2-L10 above; `checks/exact_checks.py` and `checks/run.txt`. They are mathematical arguments/exact algebra checks, not proof-assistant certification or a scaling-limit run.
