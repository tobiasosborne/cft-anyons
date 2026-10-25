# General abelian p-group transport after finite blocking

Collaborator addendum, 2026-10-25. **Tags:** any setting; bare **L0**
(associator and dagger included); finite transport datum **→R0^u**. With
the main NOTE's finite-block construction this reaches R0^u for this whole
class. No conformal or analytic assertion. The conventions and local sources
are those stated before the derivation in `associator_proof.md`: additive
groups, normalized U(1)-valued ω, associator multiplication by ω, and
`z_x:P⊗x→x⊗P`.

## G. Every pointed object over an elementary-abelian group [proven]

**ASSUME** p prime, d≥1, `A=(F_p)^d`, arbitrary normalized unitary
3-cocycle ω, and arbitrary pointed object `O=⊕_g M_g⊗g` with chosen
unit vector η in M_0. Put `m_g=dim M_g`, `n=Σ_g m_g`, and `b=p^d`.
**PROVE** `P=O^(⊗b)` has a pointed unitary half-braiding relative to
all of `Vec_A^ω`. In particular it has one relative to `<O>`.

The category is the unitary graded construction in
`references/text/PenneysUnitaryFusionCategories.md:284–288,319–321`;
the fusion-category and pentagon construction are also
`references/text/EtingofNikshychOstrikFusionCategories.md:39–51`.
There is no restriction that ω be trilinear or a bicharacter-derived cocycle.

`<1>1.` Define the normalized pentagon defect

```
Q(a,b,c,d) = ω(b,c,d) ω(a+b,c,d)^−1 ω(a,b+c,d)
                         × ω(a,b,c+d)^−1 ω(a,b,c).
```

Every Q equals 1, by the sourced 3-cocycle equation.
Define the half-braiding multiplier as derived in `associator_proof.md` H:

```
β_g(x,y) = ω(g,x,y) ω(x,y,g) / ω(x,g,y).
```

`<1>2.` Direct expansion, cancellation, and abelianness give the identity

```
β_g(y,z) β_g(x+y,z)^−1 β_g(x,y+z) β_g(x,y)^−1
 = Q(g,x,y,z)^−1 Q(x,g,y,z) Q(x,y,g,z)^−1 Q(x,y,z,g).
                                                               (G1)
```

For explicit cancellation, let q denote the formal additive expansion of Q
in symbols w(a,b,c) for its ω terms. Start with `−q(g,x,y,z)`; adding
`q(x,g,y,z)` cancels the terms at `(g+x,y,z)`. Adding `−q(x,y,g,z)`
cancels the terms at `(x,g+y,z)`. Adding `q(x,y,z,g)` cancels the terms at `(x,y,g+z)` and
the residual terms at `(x,y,z)`. The twelve remaining terms are exactly
the expansion on the left. This is formal multiplication of monomials;
no logarithm on U(1) is chosen. Thus G1 equals 1 and β_g is a normalized
2-cocycle. Normalization follows by substituting zero in either slot.

`<1>3.` Set `c_g(x,y)=β_g(y,x)`. The β cocycle identity at `(z,y,x)`
reads

```
β_g(y,x)β_g(z,y+x) = β_g(z,y)β_g(z+y,x),
```

which, using abelianness, is the 2-cocycle equation for c_g. On the
`|A|`-dimensional Hilbert space with orthonormal basis `(v_t)_(t∈A)`, put

```
R_g(x)v_t = c_g(x,t) v_(x+t).
```

Each R_g(x) is unitary. Moreover

```
R_g(x)R_g(y)v_t
 = c_g(y,t)c_g(x,y+t) v_(x+y+t)
 = c_g(x,y)c_g(x+y,t) v_(x+y+t)
 = c_g(x,y)R_g(x+y)v_t.
```

Thus `R_g(y)R_g(x)=β_g(x,y)R_g(x+y)`, precisely the required
half-braiding equation H1. This proves regular-projective-representation
existence directly; no classification theorem is invoked.

`<1>4.` In the commutative group ring Z[A], set `S=Σ_g m_g[g]`.
Because every g has order dividing p, Frobenius modulo p gives

```
S^p ≡ Σ_g m_g^p [pg] ≡ n[0] modulo p.
```

Inductively, for k≥1,

```
S^(p^k) ≡ n^(p^(k−1))[0] modulo p^k.                  (G2)
```

To pass from k−1 to k≥2, raise `C[0]+p^(k−1)T` to p. For 1≤j<p
the j-th nonconstant binomial term is divisible by
`p^(1+j(k−1))`, hence by p^k. The last term is divisible by
`p^(p(k−1))`, hence by p^k because `p(k−1)≥k`. The constant becomes
`n^(p^(k−1))[0]`. Thus at k=d each nonzero-grade multiplicity in P
is divisible by `p^d=|A|`. BY coefficient comparison in the free Z-basis [g].

`<1>5.` On each nonzero-grade multiplicity space of P, take the required
number of copies of R_g from `<1>3`. At grade zero, β_0(x,y)=1 by
normalization of ω, so take the identity representation on the whole
multiplicity space. It fixes the specified vector `η^(⊗b)`. The exact
finite-abelian criterion H from `associator_proof.md` supplies a unitary
half-braiding with central point. This proves the theorem. QED.

**Degenerate case d=0.** The category has only its unit simple and ω=1 by
normalization. The ordinary Hilbert-space flip gives a pointed half-braiding
on O itself, so b=1 suffices.

## G3. Finite abelian p-groups [proven]

**ASSUME** A a nontrivial finite abelian p-group, `|A|=p^d`, exponent
`p^e` (so d,e≥1), arbitrary normalized unitary ω, and arbitrary pointed O
as above. **PROVE** `P=O^(⊗b)` has a pointed unitary half-braiding relative
to all of `Vec_A^ω`, with `b=p^(e+d−1)`.

`<1>1.` In Z[A]/pZ[A], Frobenius iterated e times gives

```
S^(p^e) ≡ Σ_g m_g^(p^e)[p^e g] ≡ n[0] modulo p.
```

The first equality uses the commutative group ring, the second the exponent
condition and `m^(p^e)≡m modp`. BY the same coefficient calculation as G.

`<1>2.` The binomial argument of G `<1>4` applies to every congruence
`T≡C[0] modp^k`: it gives `T^p≡C^p[0] modp^(k+1)` for k≥1.
Applying it d−1 times to `<1>1` yields

```
S^(p^(e+d−1)) ≡ n^(p^(d−1))[0] modulo p^d.             (G3)
```

Thus every nonzero-grade multiplicity of P is divisible by `|A|=p^d`.

`<1>3.` G `<1>1`–`<1>3` use only abelianness and normalized ω, so they
apply to this A unchanged. Their regular projective matrices have dimension
|A|. Take the required number of copies in every nonzero-grade block of P,
and the identity representation at grade zero, fixing `η^(⊗b)`.
The criterion H then gives the asserted pointed unitary half-braiding. QED.

For exponent p (`e=1`), this recovers b=p^d. The trivial group uses b=1
as above. No assertion about minimal block length is made.

**Layer boundary.** This theorem concerns the given pointed O, not an
enlargement of its one-site carrier: P is just a block of finitely many
original sites. Using the main NOTE's blocked construction leaves the
original family `End(O^L)` and literal insertion V_L unchanged. The slack
depends on the finite b and is uniform in L. This does not characterize all
fusion categories, finite abelian groups outside the proved p-group class,
or all minimal block sizes.

## Naturality and choices

The existence statement is invariant under point-preserving unitary tensor
equivalences by the explicit tensorator transport in `associator_proof.md` N.
Regular-representation formulas use a graded presentation and orthogonal
identifications of multiplicity spaces; they do not select a presentation-free
half-braiding canonically. Once that blocked datum is supplied and transported,
the main NOTE's construction is equivariant under the same equivalences.

## Results ledger

- G1, G2, G and G3: **proven**, arbitrary finite abelian p-group, normalized
  unitary ω, pointed O, with the displayed finite block length.
- Bare L0 local dyadic lifts for this entire class: **proven by G plus the
  main NOTE's finite-block lemma**; existence is stronger than testing H on O.
- Global canonical selection from bare fusion data or R5: **not claimed**.

## Exact calibration

Python 3.12.3, standard library, exact integers. In this checks directory:

```
python3 -I associator_general_exact.py --mutate-sign > associator_general_red.txt 2>&1
python3 -I associator_general_exact.py > associator_general_output.txt 2>&1
```

The sign mutation was run first and exited 1 at the formal monomial identity;
restoring the sign passed in about two seconds. This verifies G1 symbolically
in free commuting ω symbols, and checks 4096 pentagons, slant cocycles and
regular-representation products for a nonbilinear normalized cocycle obtained
by multiplying the p=2 trilinear cocycle by a fourth-root-valued coboundary.
Three declared coefficient families calibrate G2, and Z/4 and Z/4×Z/2
calibrate G3; the all-object claim rests
on the displayed proof. SHA256 script:
`df09d15d417c197bb365a0492090f7779b93bacfc6a60bbf4b63541ee9c35180`;
green output: `64fc93487118c786903648fe9e42ae07773748ddade274eb34deb6f5e50fa62a`;
red output: `8c1c52bb22986c7c2020c4d7b9095079532000627da3e53282c48a465ac560af`.
