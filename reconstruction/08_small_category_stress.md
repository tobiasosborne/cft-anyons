# LC-8 — Local stress and null-state equations for the small inputs

**Status:** sourced modular constraints plus locally derived and exactly
checked low-grade Ward solutions. These are individual formal block data,
not complete categorical CFTs, lattice Hamiltonians or OAR limits.
Conventions: (ad),(ah). The user explicitly authorized these small-input tests.

**Sources:** RSW
`references/category-theory/RowellStongWang2009Classification/source/RSWfinal3.tex:2353–2409`
(positive semion/Fibonacci data), `:700–703` (central charge modulo eight),
`:2342–2346` (spin/conformal weight modulo integers).
Schottenloher `references/cft/Schottenloher2008/Schottenloher2008.md:2925–2947`
(norms and grade-two Gram), `:2992–3009` (positivity theorem),
`:5092–5105` (primary Ward relation).
The descendant-recursion framework is also visible in
`references/categorical-reconstruction/BrehmRunkel2024/source/main.tex:1230–1292`;
its model-specific structure constants are not imported.

## 1. Category constraints on the lift, not a unique conformal theory

With theta_x=exp(2*pi*i*h_x), the sourced modular data constrain

| Modular category | h_x modulo 1 | c modulo 8 | Selected smallest lift |
|---|---:|---:|---|
| Positive semion | 1/4 | 1 | (1,1/4) |
| Positive Fibonacci | 2/5 | 14/5 | (14/5,2/5) |

These exact c,h are selected for a probe. Integral shifts of h and
eightfold shifts of c are not ruled out by these phases; they still face
the other realization constraints. Untwisted VecZ2 is a different fusion
category from semion and does not inherit this semion conformal lift.
Opposite chirality changes the residues and is not mixed into these runs.

The category's simple object is not assumed to be one Virasoro highest-weight
module. Its carrier may contain several primary multiplets and descendants.
Such graded multiplicities and additional local fields remain unknown.

## 2. A concrete positive-quotient condition

For a normalized highest vector v of weight h, use the ordered grade-two
basis (L_-2 v,L_-1^2 v). The source Gram matrix is

    G2(c,h) = [[4h+c/2, 6h], [6h, 8h^2+4h]].

The implementation derives this matrix from the Virasoro commutator rather
than copying it. It also checks G1=2h. The source text prints G1=h in one
line and a strict determinant test for semidefiniteness in another; those
are inconsistent with its own commutator formula. We use exact nonnegative
principal minors, including null directions.

At the selected semion lift,

    G2(1,1/4)=(3/2)*[[1,1],[1,1]],
    (L_-2-L_-1^2)v=0 in the positive quotient.

Every cell or intertwiner map must therefore kill that input vector, on
every port to which this module is assigned. This is an actual additional
linear equation on descendant amplitudes, not only a positivity check.

For Fibonacci's selected lift c>1,h>0, the sourced highest-weight theorem
gives positive-definite Verma forms at every grade. Thus no Virasoro null
equation of this kind arises in that Verma module. It does not follow that
four-port sewing, category fidelity or the complete carrier is solved.

Exact checks through grade four give ranks (grades 1,2,3,4):

    Semion: (1,1,2,3),    Fibonacci: (1,2,3,5).

All principal minors are nonnegative. These finite checks verify the
implementation; all-grade positivity is sourced separately, not extrapolated.

## 3. Solve one vacuum-exchange Ward block through grade four

**ASSUME:** a primary intertwiner component of weight h acting on a
highest-weight ket of weight h, with an invariant vacuum-output channel.
Normalize its leading vacuum coefficient to one and write

    F(z)=z^(-2h) sum_(k>=0) z^k v_k,  v_0=Omega.

Use the vacuum quotient L_-1 Omega=0. These hypotheses describe one block;
they do not assert existence of all compatible charged intertwiners.

**PROVE LC-V:** for n>0,

    L_n v_k=(k-n+(n-1)h) v_(k-n),

with v_l=0 for l<0.

<1>1. The primary Ward equation is
`[L_n,X(z)]=z^(n+1) partial X(z)+(n+1)h z^n X(z)`.
BY the sourced equation (9.6).

<1>2. Positive L_n annihilate the initial ket and commute with the channel
projection. Therefore `L_n F=(z^(n+1)partial+(n+1)h z^n)F`.
BY <1>1 and the stated module/channel hypotheses.

<1>3. Compare coefficients of z^(k-2h). Differentiation contributes
k-n-2h and the weight term contributes (n+1)h. Their sum is the displayed
coefficient. QED BY <1>2 and coefficient comparison.

Solving these linear equations gives

    v_1=0,
    v_2=(2h/c)L_-2 Omega,
    v_3=(h/c)L_-3 Omega,
    v_4=[3h(c+4-2h)/(c(5c+22))]L_-4 Omega
         +[2h(5h+1)/(c(5c+22))]L_-2^2 Omega.

For c>0 these denominators are nonzero. The code independently constructs
the vacuum Gram matrices and solves for coefficients from their Ward
pairings, then checks every positive-mode equation through grade four.

| Lift | v2 coefficient | v3 coefficient | v4: L_-4 | v4: L_-2^2 |
|---|---:|---:|---:|---:|
| Semion | 1/2 | 1/4 | 1/8 | 1/24 |
| Fibonacci | 2/7 | 1/7 | 1/14 | 1/42 |

These are concrete nontrivial solutions of the local stress equations for
one normalized exchange component. They do not set the independent primary
three-point coefficients, prove all external null relations, or check a
four-point change of channel against the categorical F-matrix.

## 4. Semion null descent yields a primary-channel equation

**ASSUME:** normalized primary three-point component
`<v_out|X_insert(z)|v_in>=C z^s`, with
`s=h_out-h_in-h_insert`. Let the input carry the semion grade-two null.
**PROVE LC-N:** a nonzero C requires

    h_in+2h_insert-h_out-s(s-1)=0.

<1>1. The bra is annihilated by negative modes. Moving L_-1 from the ket
past X therefore gives `-partial_z(C z^s)`; twice gives
`partial_z^2(C z^s)`. BY the adjoint highest-weight property and (9.6).

<1>2. Moving L_-2 instead gives
`(-z^-1 partial_z+h_insert z^-2)(C z^s)`.
Its coefficient is h_insert-s=h_in+2h_insert-h_out. BY (9.6) at n=-2.

<1>3. The null input has zero amplitude, so subtract the expressions in
<1>1 and <1>2. QED BY C nonzero and null-space descent.

For two semion-weight primaries, h_in=h_insert=1/4, this is

    h_out*(1-h_out)=0.

The allowed vacuum primary h_out=0 passes, as does the unit-insertion
channel h_insert=0,h_out=h_in. The equation also permits a Virasoro primary
of weight one. It does not force that primary to occur, nor declare it a
new categorical sector: extra Virasoro primaries may lie inside the
categorical vacuum carrier. Four-port sewing and carrier construction must
decide that issue. This illustrates why sector labels cannot simply be
identified with individual Virasoro modules.

## 5. What this says about the reconstruction machine

The categorical binary equations have explicit solutions (LC-6), and their
formal categorical deformation obstruction vanishes (LC-7). The stress
equations also admit the displayed low-grade blocks after a conformal lift
is selected. They have not supplied that lift or the complete graded theory.
Even the shifted lifts (9,1/4) and (54/5,2/5) pass the exact grade-two
positivity test; that test cannot select a unique c from its modular residue.

The next informative test is positive four-port sewing with the prescribed
associator, including the allowed internal descendants and null quotients.
For Fibonacci, generic Virasoro positivity supplies no null-vector shortcut.
The unknown analytic blocks and carrier multiplicities must be solved,
rather than substituting a known lattice model and declaring the machine done.

Run `python3 scripts/python/run_small_category_inputs.py` from the root.
Raw tests, mutation failures, exact matrices, coefficients, producer/source
hashes and software versions are in `runs/2026-10-21-small-category-inputs/`.
No finite-dimensional exact Virasoro representation is asserted: the code
evaluates finitely many words in the formal highest-weight module.
