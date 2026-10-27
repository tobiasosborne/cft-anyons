# H6(c): exact scalar loop calibration and its categorical boundary

Pillars P2/P3: a finite connectivity observable on the loop specialization
of the indefinite-number spacetime ensemble. No conformal-limit rung is
reached. Everything below is confined to an example calibration; it is not
the construction for arbitrary fusion-category data required by H6.

Run from the repository root:

```bash
python3 explorations/2026-10-27-astra-r4/H6-discrete-holomorphicity-selection/checks/tl_calibration_runner.py
```

The runner records complete stdout/stderr in `tl_calibration.txt`, requires
the baseline to pass, three independent mutations to fail, then requires
the unmodified baseline to pass again. No numerical tolerance is used.
`tl_calibration.py` checks identities as rational functions of
`z=exp(i lambda)`; it does not claim every nonzero complex z corresponds to
the positive real branch interpretation below.

## Local sources and existing conventions

* `CONVENTIONS.md:1397–1428` (ak): tile numbering, cups, loop dimension,
  geometric orientation; `:1431–1440` (al): exact tile coefficients.
* `references/lattice-symmetry/ZhouBatchelor1997/source/9611156.tex:120–145`:
  the nine weights, `n=-2 cos(4 lambda)` and honeycomb specializations.
  `:270–276` gives the two positive-u branch parameters.
* `references/lattice-symmetry/ChelkakGlazmanSmirnov2016/source/StressTensor.tex:589–603`:
  the scalar observable with one open path and its winding exponent on
  both branches; `:643–654` defines the loop configurations and weights.
  `:1510` records the full turn ±2π of a closed-loop configuration.
  `:681–696` even records rhombic integrable weights and attributes partial
  Cauchy–Riemann relations to Ikhlef–Cardy. Thus the original papers are not
  local, but a useful statement of the mechanism is local in CGS.
* `report/sections/86_spacetime_trotter_dictionary.tex:154–217`:
  the lab-book tile assignment and honeycomb calculation. Its final
  commuting-transfer qualification `:273–280` is not used here.
* `references/text/PenneysUnitaryFusionCategories.md:120–135,438–446`:
  finite semisimplicity and duality, used in the dimension calculation.
* `references/category-theory/RowellStongWang2009Classification/source/RSWfinal3.tex:2447–2452`:
  the fusion, dimension and twist in the final example.

## Declared observable and geometry (scoped to this check)

Use a finite simply connected domain of the regular honeycomb lattice,
with a marked boundary half-edge b. A configuration has one simple open
path from b to a marked midedge z and finitely many disjoint simple loops;
all components are mutually disjoint. Define

`F(z)=sum_Gamma n^(number of loops) x^(occupied half-edges/2)
 exp(-i sigma W(path from b to z))`.

W is the real total signed tangent rotation, with counterclockwise turns
positive. Every occupied half-edge has weight sqrt(x), including the two
endpoint half-edges; a complete edge has weight x. This refines the
midedge/endpoint convention left implicit in CGS's introductory formula.
No braiding factor and no extra strand crossing a fixed loop configuration
is included: the open path is a component of the configuration itself.

At an interior vertex v, identify its three adjacent midedges as p,q,r,
with outgoing directions `(p-v,q-v,r-v)=a(1,j,jbar)`, `a>0` and
`j=exp(2 pi i/3)`. Define the local contour condition to be

`C_v=F(p)+j F(q)+jbar F(r)=0`.

Up to a common nonzero geometric factor, this is the contour integral on
the triangular dual face around v: its sides cross the three primal edges
at p,q,r and have directions obtained by rotating the corresponding
outgoing edge directions by pi/2. This is a three-port honeycomb relation,
not an undeclared four-port equation on the original square tile.

## Structured finite proof

ASSUME the observable and geometry just declared; real lambda with
`cos(lambda)>0`, `sin(2lambda)sin(3lambda)rho_1(lambda) != 0`; set
`x=1/(2cos(lambda))`, `n=-2cos(4lambda)`, `sigma=1-3lambda/pi`.
PROVE the nine normalized weights have the honeycomb values and `C_v=0`
for every interior vertex distinct from the source.

This is the exponent stated by CGS on each branch: for
`0<lambda<pi/4`, the principal `arccos(-n/2)=4lambda`; for
`pi/4<lambda<pi/2` it is `2pi-4lambda`. Substitution in CGS's respective
branch formulas gives `sigma=1-3lambda/pi` in both cases. Their positive
`n in [0,2]` discussion restricts these intervals further. Singular original
face weights, including `sin(3lambda)=0`, are excluded from this check.

<1>1. Specialize the source weights to u=lambda. They give
`rho_9=0`, `rho_4=...=rho_8=sin(lambda)/sin(3lambda)`,
`rho_2=rho_3=sin(2lambda)/sin(3lambda)` and
`rho_1=2sin(2lambda)cos(lambda)/sin(3lambda)`.
BY direct substitution in the Zhou–Batchelor weights.

<1>2. Hence `rho/rho_1=(1,x,x,x²,x²,x²,x²,x²,0)`.
BY <1>1 and `sin(2lambda)=2sin(lambda)cos(lambda)`.
The script checks all nine identities independently of the denominator
division, as exact cross-multiplied Laurent identities.

<1>3. Fix all occupied exterior half-edges outside a small star at v.
The exterior source path ends at one of its three ports; call that p.
The other two ports are either both absent, or are joined to each other
by an exterior path. These exhaust the possibilities.
BY degree parity and the disjoint-path/loop condition: there is exactly
one source path, and the remaining exposed endpoints must be paired.

<1>4. In the first exterior class, the three completions have endpoint
p,q,r, relative local weights `1,x,x`, and relative winding increments
`0,-pi/3,+pi/3`. Their contribution to `C_v`, after removing the common
exterior weight and phase, is
`A=1+x*j*exp(i sigma pi/3)+x*jbar*exp(-i sigma pi/3)`
` =1+2x cos((2+sigma)pi/3)=1-2x cos(lambda)=0`.
BY the three possible local completions and the displayed angles. The
incoming tangent at p is -1; turning toward q is clockwise pi/3 and
toward r is counterclockwise pi/3.

<1>5. In the second exterior class the completions have endpoint p,q,r
and relative weights `xn,x,x`. The p completion closes one loop. The
q/r completions instead continue the source path along the exterior arc.
Their relative winding increments are `0,-4pi/3,+4pi/3`.
BY joining the exterior q–r arc to the two radial half-edges. This is a
simple closed honeycomb curve. The boundary source is outside it and its
disjoint path to p cannot cross it, so that path stays outside. Orient the
loop v→r→(exterior arc)→q→v: its interior is on the right near v. Its full
turn is −2pi, the closed-loop turning fact also used locally in CGS:1510.
The closing turn at v is −pi/3, so the exterior r-to-q arc turns −5pi/3.
For the q completion, the local p-to-r turn is +pi/3, giving −4pi/3;
the r completion reverses these signs. This fixes the winding for every
exterior arc in this class, not just the shortest drawn representative.

<1>6. After removing the common exterior weight, phase and local x, the
second class contributes
`B=n+j*exp(4i sigma pi/3)+jbar*exp(-4i sigma pi/3)`
` =n+2cos((2+4sigma)pi/3)=n+2cos(4lambda)=0`.
BY <1>5 and the declared parameters. Cyclic relabeling deals with the
other possible port reached by the exterior source path. QED.

Both identities are checked exactly. A factor-two mutation of rho_6,
a spin shift `sigma->sigma+1`, and a loop-factor sign reversal each cause
an assertion failure. In particular a spin shift preserving
`exp(2 pi i sigma)` need not preserve this winding-weighted observable.

The branch identities are `x^-2=2+2cos(2lambda)` and
`2-n=4cos²(2lambda)`. Therefore `cos(2lambda)>=0` yields the plus-radical
fugacity, while `cos(2lambda)<0` yields the minus-radical fugacity. These
are exact identifications of weight values, with no proof of scaling
criticality. CGS `:561–564,613–619` carefully distinguishes established
convergence results from the conjectural general picture.

## What the categorical calibration still needs

For a simple nonunit self-dual X, set `N=N_XX^X`. Rigidity and Schur give
`N_XX^1=1`. Write `X²=1+N X+sum_(a!=1,X) N_XX^a a`. Semisimplicity gives

`dim End((1+X)^2)=4+(2+N)^2+sum_(a!=1,X)(N_XX^a)^2`.

Consequently equality to the nine-dimensional two-site dilute diagram
algebra forces `N=0` and exactly one other channel of multiplicity one,
namely `X²=1+Z`, with Z distinct from 1 and X. This is a necessary
dimension condition. It does not itself prove the chosen diagram
evaluation is an algebra isomorphism. For a general self-dual object,
the cup/FS flag remains an obligation: CA-69 `:72–85`; Penneys `:597–603`.

The local loop observable above is not H6(a)'s sum with an *extra* centre
strand crossing pre-existing worldlines. Neither the source weight vector
nor its nine-dimensional algebra specifies endpoint coupons, a central
half-braiding, a framing, a winding lift or a scalar boundary pairing.
Even a known categorical twist supplies a spin only modulo integers;
the local contour depends on the actual real exponent. An identification
of the two observables, with all these data, is an additional theorem.
Thus this check proves the sourced scalar loop mechanism, rather than
verifying a presently unspecified categorical contour matrix M.

## Examples table (checks only)

| Input / branch | Exact check | Consequence / limit |
|---|---|---|
| `X²=1+X` | dimension 13 | Literal full two-site dTL equality fails; its loop subalgebra may still be used. CA-87 `:83–86`; Penneys `:610–625`. |
| Standard braided Ising, X=sigma | `X²=1+psi`, dimension 9, `d_X=sqrt(2)`, twist-spin `1/16 mod Z` | Genuine candidate for the dimension assumption; no endpoint identification follows. RSW `:2447–2452`. |
| Same loop fugacity, branch 1 | `lambda=3pi/16`, scalar winding exponent `7/16` | It differs from the standard categorical twist-spin. Imposing `1/16` in this *scalar* observable leaves class A residual `1-tan(3pi/16)>0`. |
| Same loop fugacity, branch 2 | `lambda=5pi/16`, scalar winding exponent `1/16` | Twist exponents match; that scalar equality is insufficient to identify the full observables. |

Results ledger: weight specialization **proven**; declared scalar loop
contour identity **proven**; two-site dimension restriction **proven**;
H6 centre-line calibration **conditional/open**; continuum convergence
and category fidelity **not claimed**. The finite ingredient reaches no
CA-88 continuum rung and does not resolve VR-1 or select a general h.
