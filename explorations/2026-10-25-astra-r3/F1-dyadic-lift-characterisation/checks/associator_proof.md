# Associator audit: fusion-ring centrality versus a half-braiding

Research collaborator derivation, 2026-10-25. Scope: **any** chirality; input
**L0**, including its associator and dagger; finite transport feasibility
**→R0^u**. No analytic or conformal limit is asserted. All groups, matrices and
spaces below are finite. This file gives algebraic ingredients for the main
NOTE's finite-block lift, rather than asserting that lack of transport on one
site obstructs an arbitrary algebra lift.

## Conventions and local ground truth

Use additive finite abelian groups. Write `g` for the one-dimensional simple
object at grade g, `O = ⊕_g M_g ⊗ g`, and `m_g = dim M_g`. The normalized
associator `a_(g,x,y):(g⊗x)⊗y → g⊗(x⊗y)` is multiplication by
`ω(g,x,y) ∈ U(1)`. Unit and zero grade coincide. These are the explicit
conventions of Penneys `references/text/PenneysUnitaryFusionCategories.md:284–288,319–321`,
specialized to normalized cocycles (so both unitors are identity).
Half-braidings have direction `z_x:O⊗x → x⊗O`, the inverse of CA-90's t.
Tensor powers retain CONVENTIONS (r)'s left-associated brackets. Matrix
products compose right to left. The grade-0 point is a specified unit vector
`η ∈ M_0`, as in CA-90. Sources are kept local; no network was used.

ENO `references/text/EtingofNikshychOstrikFusionCategories.md:39–51`
supplies the fusion-category construction and cocycle pentagon. Penneys
`:319–321` supplies the unitary graded version. The half-braiding equations
are CA-90 (90.5), whose extension from simples to arbitrary objects was proved
in E1 NOTE E1.6. The scalar factors below are re-derived, not imported from a
potentially different crossing convention. An independent source for the
projective-centralizer structure and slant cocycle is
`literature/md/1511.08090/1511.08090.md:743–761`, especially equation (102),
`:750`. Its displayed multiplier is the inverse of the β below, with its own
orientation and coboundary convention (`:741–752`).

## H. General finite-abelian multiplicity criterion [proven]

**ASSUME** A finite abelian, ω a normalized unitary 3-cocycle, and O as above.
**PROVE** pointed unitary half-braidings on O relative to all of `Vec_A^ω`
are precisely unitary matrices `ρ_g(x) ∈ U(M_g)` satisfying

```
ρ_g(0) = 1,
ρ_g(y)ρ_g(x) = β_g(x,y)ρ_g(x+y),
β_g(x,y) = ω(g,x,y)ω(x,y,g) / ω(x,g,y),                 (H1)
ρ_0(x)η = η.                                           (H2)
```

`<1>1.` A grade-preserving map `O⊗x → x⊗O` preserves each M_g, because
`g+x = h+x` implies g=h. Thus its blocks are exactly matrices ρ_g(x).
BY the graded morphism definition, Penneys `:20,321`.

`<1>2.` Compare the following paths from `(g⊗x)⊗y` to `x⊗(y⊗g)`:

```
 a_(g,x,y), z_(x+y), a_(x,y,g)
 z_x⊗1_y, a_(x,g,y), 1_x⊗z_y.
```

The first acts on M_g by
`ω(g,x,y)ω(x,y,g)ρ_g(x+y)`; the second by
`ω(x,g,y)ρ_g(y)ρ_g(x)`. Equality is exactly (H1). BY the
half-braiding tensor identity with associators displayed, equivalently
CA-90 (90.5) in this multiplicity-one simple tensor product.

`<1>3.` Naturality on arbitrary A-graded Hilbert spaces follows by tensoring
these matrices with the identity on each homogeneous multiplicity space and
taking orthogonal direct sums. Every graded morphism is a matrix within those
spaces. The tensor identity reduces blockwise to `<1>2`. Unitarity reduces to
unitarity of the matrices, and the point identity reduces to (H2). BY direct
matrix multiplication and orthogonal decompositions (Penneys `:219–237`).
This also proves sufficiency; no braid structure on the category is used. QED.

**Corollary H-D [proven].** If the scalar
`κ = β_g(x,y)/β_g(y,x)` has finite order d, then `d | m_g` is necessary
for a half-braiding whenever `m_g>0`.

`<1>1.` Swapping x,y in (H1) gives
`ρ_g(y)ρ_g(x) = κ ρ_g(x)ρ_g(y)`. All matrices are invertible.
Taking determinants gives `κ^(m_g)=1`; order d gives the divisibility. QED.
This is a multiplicity obstruction, beyond the equality of fusion-ring
classes, and it excludes even a nonunitary invertible half-braiding when it
fails. It is not claimed to obstruct all finite-slack algebra maps.

## T. A general trilinear family [proven]

**ASSUME** p prime, `A=(F_p)^3`, `ζ=exp(2πi/p)`, and

```
ω(a,b,c)=ζ^(a_1 b_2 c_3),
O = 0 ⊕ e_1 ⊕ e_2 ⊕ e_3,
η = the canonical grade-0 vector.                       (T1)
```

**PROVE** `[O]` is central in `K(<O>)`, but O has no half-braiding.

`<1>1.` Set `F(a,b,c)=a_1 b_2 c_3 ∈ F_p`. The exponent of the
cocycle equation is

```
F(b,c,d) − F(a+b,c,d) + F(a,b+c,d)
             − F(a,b,c+d) + F(a,b,c) = 0,
```

by expansion and cancellation. F vanishes when any input is zero. Thus ω is
a normalized unitary 3-cocycle and defines a unitary fusion category by the
local constructions above. This is an all-p proof; the exact p=2,3 check is
only a calibration.

`<1>2.` The three basis grades generate A, so `<O>=Vec_A^ω`. Tensor
products of simple grades add in A. As A is abelian, its fusion ring is
commutative, and `[O]` is central. BY the sourced tensor-product rule.

`<1>3.` Substitution in (H1) gives

```
β_g(x,y)=ζ^B_g(x,y),
B_g(x,y)=g_1 x_2 y_3 + g_3 x_1 y_2 − g_2 x_1 y_3.     (T2)
```

For `g=e_1,x=e_2,y=e_3`, β_g(x,y)=ζ and β_g(y,x)=1. Since
`m_(e_1)=1`, H-D would require p|1, impossible. Therefore O has no
half-braiding, regardless of the point. This disproves F1 `(b)⇒(c)`. QED.

## P. The same family has transport after a finite tensor power [proven]

**ASSUME** (T1). **PROVE** `P=O^(⊗p^3)` has a pointed unitary
half-braiding relative to `<O>`.

`<1>1.` In the commutative group ring `Z[A]`, put
`S=[0]+[e_1]+[e_2]+[e_3]`. Frobenius modulo p gives `S^p≡4[0] mod p`.
Inductively

```
S^(p^k) ≡ 4^(p^(k−1)) [0] modulo p^k, k≥1.             (P1)
```

Indeed raising `C+p^(k−1)T` to p makes every nonconstant binomial term
divisible by p^k for k≥2. For j=p this uses `p(k−1)≥k`; for 1≤j<p
it uses divisibility of binomial(p,j) by p. Thus every nonzero-grade
multiplicity of P is divisible by `|A|=p^3`. BY this coefficient identity.

`<1>2.` For any g set `C_g(x,y)=B_g(y,x)`, bilinear by (T2). On the
`p^3`-dimensional Hilbert space with orthonormal basis `(v_t)_(t∈A)` define

```
R_g(x)v_t = ζ^C_g(x,t) v_(x+t).
```

It is unitary (a permutation with phases), and

```
R_g(x)R_g(y)v_t
 = ζ^[C_g(y,t)+C_g(x,y+t)] v_(x+y+t)
 = ζ^C_g(x,y) R_g(x+y)v_t.
```

Hence `R_g(y)R_g(x)=β_g(x,y)R_g(x+y)`, exactly H1.

`<1>3.` At each nonzero g, use `m_g(P)/p^3` copies of R_g. At g=0 use
the identity representation on the whole multiplicity space. Its canonical
point `η^(⊗p^3)` is fixed. Apply H to obtain the claimed pointed
half-braiding. QED. With the main NOTE's finite-block lemma, this proves
F1(a) for the same family despite failure of F1(c). No such conclusion would
follow from T alone.

## P2. A smaller exact blocked calibration [proven]

For p=2, already `P=O⊗O` works: `m_0(P)=4`, each of
`100,010,001,110,101,011` has multiplicity 2, and `111` has multiplicity 0.
Let I be the identity and X,Z the real Pauli involutions, `ZX=−XZ`.
On each two-dimensional grade block define `ρ_g(x)=U_1^(x_1)U_2^(x_2)U_3^(x_3)`
with the following choices:

| g | U1 | U2 | U3 |
|---|---|---|---|
| 100 | I | X | Z |
| 010 | X | I | Z |
| 001 | X | Z | I |
| 110 | X | X | Z |
| 101 | X | Z | X |
| 011 | X | Z | Z |

The three commutation rules are `U2 U1=(-1)^g3 U1 U2`,
`U3 U1=(-1)^g2 U1 U3`, `U3 U2=(-1)^g1 U2 U3`. Reordering
`ρ_g(x)ρ_g(y)` gives the phase
`(-1)^[g3 x2 y1+g2 x3 y1+g1 x3 y2]=β_g(y,x)`, so H1 holds.
Use the trivial representation on all four unit copies; the point is fixed.
This is exact integer-matrix algebra, verified by `associator_exact.py`.

## N. Equivalence covariance [proven]

Given a unitary strong tensor equivalence F with tensorators
`J_(a,b):F(a)⊗F(b)→F(a⊗b)` and a unitary `u:F(O)→O'`, transport z by

```
z'_(F(x)) = (1⊗u) J_(x,O)^−1 F(z_x) J_(O,x) (u†⊗1).
```

Naturality follows by applying F to its square. The two tensor paths in H
are conjugated to their target-category paths by the J's, by the tensorator
associativity equation (Penneys `:325–348`); they remain equal. Dagger and
unitarity are preserved. If `η'=u F(η)F^1`, the point equation is also
preserved by the unit tensorator equation. Full faithfulness makes extension
to all target objects independent of the chosen isomorphism `Y'≅F(x)`:
two such choices differ by a source morphism, and naturality applies.
A quasi-inverse gives the converse. Thus existence and nonexistence of a
pointed half-braiding, on O or any fixed tensor power, are invariant under
point-preserving unitary tensor equivalences. This is finite categorical
covariance, not a conformal-realization R5 claim.

## Results ledger and scope

- H, H-D: **proven**, exact finite-abelian transport equations and divisibility.
- T: **negative**, fusion-ring centrality does not imply transport on O.
- P, P2: **proven**, the same O obtains transport after finite blocking.
- N: **proven**, covariance of the feasibility statements under equivalences.
- Arbitrary finite-slack no-go from absence of H on O: **negative once the
  main NOTE's blocked lift lemma is applied**, and never inferred from T alone.
- No limit state, stress modes, local conformal target or fidelity statement.

## Reproducibility

Python 3.12.3, standard library only, exact integers; green run about 5 seconds.
From this `checks/` directory:

```
python3 -I associator_exact.py --mutate-associator > associator_red.txt 2>&1
python3 -I associator_exact.py > associator_output.txt 2>&1
```

The first command was run first and exited 1 at the nontrivial-multiplier
assertion; the restored command exited 0. Headline: central O has no
half-braiding, while O² does in the smallest calibration, and the all-prime
power congruence passes at p=2,3. The all-prime proof is T/P, not finite tests.
SHA256 script: `481af7d53850be9ce118e70ef76a7de7d2d21d90447eb2511e79a0dc8cbfb60e`;
green output: `fb4229d50bd9f5d8af6da6f32ca5bd81880a6e080ddee0fb59fa36864e7f0196`;
red output: `5e9847b88c789ab4f5edae6bfeafd82cc3a970d81792c1e43e209a4e035f62db`.
