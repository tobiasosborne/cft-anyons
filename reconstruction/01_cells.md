# LC-1 — A proposed system of local conformal sewing equations

**Status:** explicit reconstruction problem, with the conditional Ward-sewing
lemma below proved locally. Solvability and CFT reconstruction are not proved.
Conventions: root (ac)–(ae). This system does not assume a target CFT.

**Sources:** `references/categorical-reconstruction/BrehmRunkel2024/source/main.tex:598–692,799–809`
(boundary states, coordinate changes, anomaly and cutting);
`literature/md/1905.04924/1905.04924.md:542–558,688–718`
(geometric sewing and categorical internal homs);
`references/cft/Schottenloher2008/Schottenloher2008.md:5801–5819,5900–5937,6473–6504`
(local field reconstruction and conformal vector). Exact source hypotheses
are not replaced by the proposed equations.

## 1. Input and unknowns

Fix a unitary fusion category C and compatible finite semisimple unitary
left module category M, with explicit coherence maps and chosen bases.
For boundary labels a,b and simple i put

    M_ab^i = Hom_M(i acting on a,b),
    D_ab = direct-sum_i M_ab^i tensor V_i,
    V_i = direct-sum_(r>=0) V_(i,r).

The dimensions, positive forms and actions on the finite-dimensional V_(i,r)
are UNKNOWN. Category multiplicities do not determine them. This is a first
channel ansatz, not a theorem that every BCFT has exactly this presentation.
Here C is intended as a chiral sector category: fusion-only input needs a
compatible braided completion. A defect-only category is a different target.
Identify V_unit=V with the vacuum chiral algebra to be reconstructed.
Every V_i has unknown module-action coefficients for this SAME V, with
`L_0|V_(i,r)=(h_i+r)1`, unknown h_i>=0, and h_unit=0. Its stress is the
action of the same conformal vector. Require vacuum, translation and sewing
compatibility of these actions; charged intertwiners intertwine them.
In particular the two expansions of a vacuum-field product acting on V_i
must agree with its iterated vacuum OPE acting on V_i. These coefficient
equations connect the carrier ansatz to C6; merely assigning graded spaces
to labels would not do so. Twists/recouplings must match the input, and
completeness of the resulting sector category remains a separate obligation.

Choose a grammar of oriented cells P with parametrized input/output ports,
boundary labels, and collar lengths. Include cylinders and elementary sewing
operations. A chart Q_P records the remaining conformal geometry and local
coordinate germs; an arbitrary triangulation change is not declared a
geometric equivalence. Seek

    Z_P(q): D_in -> D_out tensor L_P,

where L_P is a Hermitian anomaly line, with specified line identifications
under sewing. Unknowns also include local stress insertions, coordinate
connections B, collar propagation, and later microscopic refinement maps.
All operator compositions need a declared invariant core or collar-bounded
extension. Removing collars is a separate analytic limit.

## 2. Equations on cells and their smallest overlaps

**C0 — categorical typing.** Every coefficient lies in an allowed channel.
When two decompositions use different channel bases, insert the specified
associator/module-associator, and braiding when part of the input. Do not
identify channel spaces by their dimensions. This preserves supplied
categorical relations but does not prove complete continuum sector fidelity.

**C1 — unit, adjoint and positivity.** Seek positive Gram forms on every
finite grade, normalized vacuum, identity-cylinder and disjoint-union maps.
Require `Z_reflected(P)=Z_P^dagger`, with the dual anomaly line and reversed
ports. Semidefinite forms are allowed only with a common invariant null
space for every retained operation before quotienting. For collars require

    P(0)=1,  P(t+s)=P(t)P(s),  P(t)^dagger=P(t),
    0 <= P(t) <= 1  (t>=0),  P(t)=exp(-tE), E>=0,

after an explicitly chosen energy subtraction, with strong continuity and
the needed sewing-class bounds. One deliberately strong analytic tier asks
`Tr exp(-tE)<infinity` for every t>0 and nuclear collared cell maps with
explicit trace-norm bounds. These are additional hypotheses, not automatic
consequences of formal sewing. Positivity of a collar does not require
every cell coefficient to be an entrywise positive number.

**C2 — sewing.** For each allowed gluing s require

    Z_(Q sew_s P)(q_Q sew_s q_P) = Contr_s(Z_Q(q_Q),Z_P(q_P)).

The contraction uses dual bases, includes any declared collar propagation,
and uses the anomaly-line identification. In finite cutoff coordinates it
is a finite tensor contraction. In the ideal system it is an infinite sum
whose convergence must be proved. A positive cutoff matrix cannot replace
that convergence theorem.

**C3 — independence of decomposition at fixed geometry.** For any two
decompositions d,d' of the SAME parametrized surface,

    Contr_d(Z_cells) = Contr_d'(Z_cells),

after the prescribed channel and line identifications. If a complete set
of elementary moves is known, impose those relations. Otherwise the honest
definition includes all pairs of finite decompositions; no finite
presentation of the entire conformal sewing category is asserted here.
Forgetting geometry and imposing arbitrary Pachner invariance would be a
different, topological problem.

**C4 — local coordinate Ward equation.** Along coordinate-change orbits,
with `nabla=d+B`, set

    W_P(X) = X(Z_P) + (B_out(X)+B_LP(X)) Z_P - Z_P B_in(X) = 0.

Tensor-boundary connections are sums on their respective factors. This is
an identity for arbitrary boundary states, not just vacuum matrix elements.
Skewness is required only for real unitary reparametrizations. Actual
Euclidean evolution is different: a collar satisfies `partial_t P=-E P`,
so writing it as a horizontal equation uses B=E, which is not skew.
Genuine moduli not represented by boundary coordinate changes require
`partial_s Z_P=I_(P,s)[T]`, where I is a specified insertion of the SAME
stress field, not an independent adjustable map. Then commuting modulus
derivatives requires `partial_s I_t=partial_t I_s`. A concrete choice of
cells must supply this geometry-to-insertion rule; until supplied, that
part is a schema rather than a closed system for arbitrary moduli.
The coordinate generators must be local stress insertions of the SAME
field algebra. In particular its translation mode is that algebra's
translation operator; the collar generator is its actual energy generator.
Treating B as a freely chosen unrelated connection would miss this condition.

**C5 — curvature compatibility.** Direct integrability of C4 requires

    (F_out+F_LP) Z_P - Z_P F_in = 0,
    F_B(X,Y)=X B_Y-Y B_X-B_[X,Y]+[B_X,B_Y].

For a projective coordinate action require scalar curvature in the relevant
state bundle, and its matching across ports and the anomaly line. C5 on
one map alone does NOT imply scalar curvature: it might hold only on that
map's image. Section LC-2 distinguishes this from a full Lie-action lift.
The displayed C5 is for the homogeneous coordinate Ward equation. It is
not silently applied to an inhomogeneous modulus-insertion equation.

**C6 — stress is an internal field.** In the chiral vacuum algebra seek
`V=direct-sum_(r>=0) V_r` with finite grades, vacuum Omega, translation D,
and generating fields `Y_a(z)=sum_n a_(n) z^(-n-1)` satisfying

    degree(a_(n))=degree(a)-n-1, [D,Y_a(z)]=partial_z Y_a(z),
    D Omega=0, Y_Omega(z)=1, Y_a(z)Omega=a+O(z),
    (z-w)^N_ab [Y_a(z),Y_b(w)]=0 for some finite N_ab.

Require the negative modes of the generators applied to Omega to span V,
with consistent relations in every grade. This is the sourced field
reconstruction system; pole bounds and grade dimensions are discrete
choices. Seek omega in that SAME algebra,

    T(z)=Y(omega,z)=sum_n L_n z^(-n-2),  L_-1=D,
    T(z)T(w) ~ (c/2)/(z-w)^4+2T(w)/(z-w)^2+partial T(w)/(z-w).

Its Ward action must implement the coordinate variations in C4 on all
generators, and L_0 must agree with the declared grading. Charged sector
intertwiners obey the supplied fusion/braiding
relations; they are not all assumed mutually local vacuum fields.
This is a countable formal field system. Positivity, analytic locality and
unitary integration are additional constraints, not formal consequences.

**C7 — microscopic identification.** At each cutoff, differentiate a regular
local time-transfer family at zero time to obtain its local Hamiltonian
density. Require the energy/current insertions from C4 to match the
standard KS prescription built from that density, with declared velocity,
position offset and subtraction. Equality may have cutoff residuals.
The operators are not independently adjustable Virasoro matrices.

## 3. Ward identities propagate through sewing: a conditional lemma

**ASSUME:** two composable differentiable maps Z1,Z2 between bundles E0,E1,E2;
compatible connections and anomaly-line identifications; a common core or
bounded operators permitting the product rule. Suppress the already included
line factors. Write

    W1=dZ1+B1 Z1-Z1 B0,  W2=dZ2+B2 Z2-Z2 B1.

**PROVE LC-W:** `W_(Z2 Z1)=W2 Z1+Z2 W1`.

<1>1. The product rule gives
`d(Z2 Z1)=(dZ2)Z1+Z2(dZ1)`.

<1>2. Expand `W2 Z1+Z2 W1`. The terms `-Z2 B1 Z1` and
`+Z2 B1 Z1` cancel. BY the displayed definitions.

<1>3. The remaining terms are
`d(Z2 Z1)+B2 Z2 Z1-Z2 Z1 B0`. BY <1>1–<1>2.

<1>4. QED BY <1>3. The analogous tensor contraction identity needs the
pairing to be covariantly constant; otherwise its derivative is an extra
interface term. This compatibility is part of C1–C4.

Consequences: exact cell Ward identities imply Ward identities for finite
sewings; residuals propagate by an explicit sum over insertion positions.
This does not bound the sum. For two maps, in an applicable operator norm,

    ||W_(Z2 Z1)|| <= ||W2|| ||Z1|| + ||Z2|| ||W1||.

For growing lattices one must control both accumulated cell errors and
amplitude norms, not merely make each individual residual small.

## 4. Countability and the remaining existence problem

There is an explicit coefficient recurrence on any chosen finite-dimensional
chart where the homogeneous Ward equation applies. Use ordinary Taylor
coefficients `Z(q)=sum_alpha Z_alpha q^alpha`,
`B_i^+(q)=sum_beta B^+_(i,beta) q^beta` for outgoing-plus-line connection,
and B_i^- for incoming. For every multi-index alpha and direction i,

    (alpha_i+1) Z_(alpha+e_i)
       = -sum_(beta<=alpha) [B^+_(i,beta) Z_(alpha-beta)
                            -Z_(alpha-beta) B^-_(i,beta)].

This is coefficient comparison, with no binomial factors for this Taylor
convention. Different orders of incrementing i,j give C5 and its subsequent
coefficient conditions. Checking curvature only on the initial vector is
not a proof of the full hierarchy. An insertion right-hand side contributes
its corresponding Taylor coefficient. These recurrences are explicit local
equations, but not a convergence theorem for their formal solutions.

Fix graded dimension sequences, countable bases and a countable cell grammar.
Mode integers, Taylor multi-indices and finite sewing words are countable.
Coefficient comparison in C0–C6 then gives countably many equations in
countably many coefficients. Discrete dimension choices form a separate
search problem; there is no claim of a universal finite-dimensional ansatz.

Taylor identities give formal local germs. Convergent radii, continuation
between charts, smooth test-function limits and sewing-sum estimates are
essential. The statement about countability presupposes a specified
countable analytic presentation; it does not prove that arbitrary geometric
sewing data admit one. Equality on sampled rational parameters needs proved
continuity. Gram positivity is a hierarchy of inequalities in addition to
the equations. An existential solution need not be computable.

Even after these conditions hold, complete sector realization and the
cutoff/OAR/KS comparison remain to be established. The purpose here is to
separate the equations from their solvability, not to hide those conclusions
inside the word "consistent".
