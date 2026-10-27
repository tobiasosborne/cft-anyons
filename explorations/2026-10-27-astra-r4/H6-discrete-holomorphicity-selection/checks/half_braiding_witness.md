# B5 half-braiding sensitivity: one finite exact witness

Pillars P2/P3; finite bulk-face compiler check, no continuum rung and no LG
claim. This is an example in `checks/`; the general construction remains
H6-B1. It proves that its kernel can depend on the half-braiding while all
the other listed data, including the real spin, are held fixed.

Command from the repository root:

```bash
python3 explorations/2026-10-27-astra-r4/H6-discrete-holomorphicity-selection/checks/half_braiding_witness.py > explorations/2026-10-27-astra-r4/H6-discrete-holomorphicity-selection/checks/half_braiding_witness.txt
```

## Explicit category and common data

This example is defined directly, rather than quoted as a named category.
Let G be the group of pairs of bits with componentwise addition modulo 2.
Objects are finite G-graded Hilbert spaces; morphisms preserve grade;
tensor product adds grades; tensor associativity is the canonical
identification with scalar associator 1. The unit is grade 0, dagger is
the Hilbert-space adjoint, and the dual of a simple grade g is g itself,
with evaluation and coevaluation coefficient 1. Simple grades have
dimension 1. Group associativity, all identity associator scalars, and
ordinary matrix composition directly verify the monoidal/dagger axioms;
the triangle/pentagon identities have scalar value 1 on each graded word.

Set `a=(1,0)`, `b=(0,1)`, `O=⊕_(g∈G) g`, pointed at its grade-zero
summand, and `Y=a`. Choose the same endpoint
`q:Y⊗g→g+a` with coefficient 1 on each of the four summands of Y⊗O.

Two centre choices on this same Y have half-braiding
`gamma_g:Y⊗g→g⊗Y` with coefficient

`chi_0(g)=1` or `chi_1(g)=(-1)^(g_second)`.

These maps are unitary, natural (on every simple block they are scalar),
equal 1 at the unit, and obey the half-braiding tensor equation because
`chi(g+h)=chi(g)chi(h)`. These are direct axiom checks, not an appeal to a
classification theorem. Both `chi_j(a)=1`; fix the same real exponent
`s=0` for both. A categorical twist formula is not needed: the fixed data
are the declared real exponent s=0 and the checked self-half-braiding
`chi_j(a)=1`; no additional twist identification is claimed.

Use the square geometry `a_geom=1`, `b_geom=i`; since s=0 the winding
increments do not enter B1. Then

`R_chi(T)=-i T Q_L+T Q_R-Q_L T+i Q_R T`.

In the common sixteen-dimensional basis `|g,h>`, the maps are
`Q_L|g,h>=|g+a,h>`, `Q_R|g,h>=chi(g)|g,h+a>`.
Input U has grade `a+g+h`, so both outputs have exactly that grade.
There are four total-grade blocks of multiplicity four in V, hence
`End_C(V)` has `4*4²=64` matrix units. All are ordinary grade-preserving
matrix units; the script checks the witnesses lie in their span.

## Structured witness proof

ASSUME these data and H6-B1's residual. PROVE its two kernels differ,
even after restricting to Hermitian tiles.

<1>1. Define the fixed swap `S|g,h>=|h,g>`. It preserves grade because G
is abelian; `S†=S` and `S²=I` by direct evaluation.

<1>2. When chi=chi_0, `S Q_L=Q_R S` and `S Q_R=Q_L S`.
Therefore `R_chi0(S)=0`. BY substituting these two identities.

<1>3. For either character, direct evaluation on each input gives

`R_chi(S)|g,h>=(chi(g)-1)|h+a,g> + i(chi(h)-1)|h,g+a>`.

BY expanding the four terms in the residual. In particular,
`R_chi1(S)|b,0>=-2|a,b> != 0`. Thus the two kernels differ. QED.

There is also a positive semidefinite witness: let
`P=(I+Q_L Q_R^chi0)/2`, using the same fixed matrix for both tests.
The two translation permutations commute and square to I, so P is a
Hermitian projection of rank eight. It preserves total grade since the
two shifts add a+a=0. On its range `Q_R^chi0 P=Q_L P`; hence
`R_chi0(P)=0`. Direct expansion gives

`R_chi1(P)|b,0>=-(1+i)(|a+b,0>+|b,a>) != 0`.

The script verifies all equations exactly over Q(i), including the swap
residual formula on all sixteen input vectors and the projection
identities. Positivity here follows from `P=P†=P²`; invertible positive
tiles and an exact exponential family are not asserted.

Suggested examples-table row:

| Data | Exact check | Boundary |
|---|---|---|
| Explicit bit-pair graded category; O contains all four grades; same Y=a, endpoint q, square and s=0 | chi_0 and chi_1 agree on Y but give different B5 kernels; swap S and a rank-eight positive projection pass only chi_0 | Establishes possible half-braiding sensitivity; no universal sensitivity, physical LG, criticality or scaling claim. |

Sources: the chosen compiler is `../NOTE.md`, H6-B1 (B1)–(B5). The category,
characters, endpoint maps and witnesses above are explicit local
definitions and checked derivations, requiring no external source.
