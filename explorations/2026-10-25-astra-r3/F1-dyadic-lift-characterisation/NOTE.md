# F1 — Finite-block dyadic lifts refute single-site centrality

2026-10-25. **The proposed equivalence is false.** A half-braiding on a
fixed tensor power of the site object suffices for a local dyadic lift on
**the original** algebras and with **the exact** prescribed vacuum insertion.
This yields general counterexample families to `(a) => (b)` and
`(a) => (c)`. Associator equations also refute `(b) => (c)`.

The positive replacement is F1.1b: pointed transport on `O^b` gives fixed
slack `r=2b−1`. F1.5 constructs that transport from bare L0 data for every
pointed object in every unitary cocycle-twisted category graded by a finite
abelian p-group. A characterization for arbitrary fusion categories, and
`(b) => (a)` in that generality, remain open.

The initial statement and all-open ledger were written at 05:07 UTC, within
three minutes of the 05:04 UTC start. F1.1–F1.2 were inserted and their
ledger updated first; the associator, general existence and naturality
proofs were added after independent checking. This is a structured proof,
not proof-assistant certification. All writes are inside this directory;
no network, commits, report build or Julia suite. The task's explicit scope
overrides the usual worklog, canonical-convention and landing workflow.

## Data and conventions, fixed before the derivations

**Global tags:** `any` (no chiral/full target selected), microscopic **open**
ordered chain; `L0` fusion, including associator and dagger, with the
pointed site and any extra transport datum named in each theorem.
The rung is `R0^u` for the lift theorems, and `->R0^u` for feasibility
obstructions; no R1–R5 certificate is claimed.

Two typing corrections to the brief matter. Vacuum insertion requires a
chosen isometry `eta:1->O`; “any object” without a unit summand is undefined
here. Condition (c) must require **pointed** transport, as in Definition
90.H, if the CA-90 construction is to intertwine this eta. The current
lift convention is CONVENTIONS **(as):1564–1576**; (ar) concerns Ward-to-KS.
We retain (r),(t),(am),(aq),(as), including the fixed left bracketing.

Put `W_L=O^tensor L`, `W_0=1`, `A_L=End_C(W_L)`, `D=<O>` full,
`p0=eta eta†`, `p1=1−p0`; `V_L` inserts eta at all even fine sites.
Support means interval-algebra membership, with endpoints clipped to
`[1,2L]`, not merely commutation with distant single-site operators.
All omitted associators and unitors are the fixed unitary ones (Penneys
`:319,395–398`; FRS `:806–819`). No Hilbert-space tensor factorization of
charge sectors is assumed.

In the block construction `b>=1` is fixed, `P=W_b`, `xi=eta^tensor b`,
`L=mb+q`, `0<=q<b`. “Blocked H” means CA-90's (H) with ancillary
object P and point xi, on **all of D**, not just an unspecified subcategory.
For additive finite abelian groups, use normalized `omega:A^3->U(1)`,
associator `(a tensor b) tensor c -> a tensor (b tensor c)` equal to
`omega(a,b,c)`, and `z_x:O tensor x -> x tensor O`, inverse to t.
Matrix products compose right to left. These note-local conventions were
recorded before calculation because editing CONVENTIONS.md is forbidden.

CA-76 Propositions 76.1–76.4 and CA-90 Theorem 90.1 are used as established
results, not reproved. In particular global unital extension is already
available for every C; the new work concerns **uniform locality**.

## F1.1a. Universal pointed vacancy swap [proven; any, L0, finite]

**ASSUME** a pointed object `(O,eta)` in a unitary monoidal category.
**PROVE** a self-adjoint unitary, natural under pointed unitary equivalences, `S:O⊗O -> O⊗O` with
`S(1_O⊗eta)=eta⊗1_O` and `S(eta⊗1_O)=1_O⊗eta`.

`<1>1.` Put

    T = (eta⊗1_O) p1 (1_O⊗eta†),
    S = p0⊗p0 + p1⊗p1 + T + T†.

These are well-typed categorical morphisms, with the unitors understood.
Write `Q_ab=p_a⊗p_b`. Then `T†T=Q_10`, `TT†=Q_01`, and
`T=Q_01 T Q_10`. BY `eta†eta=1`, `p1 eta=0` and tensor interchange.

`<1>2.` Hence `S†=S` and `S²=Q_00+Q_11+Q_10+Q_01=1`.
All cross terms vanish except `TT†` and `T†T`. BY the orthogonality of
the four Q projections. The two required insertion identities follow by
applying the displayed S to `1⊗eta` and `eta⊗1`, separating `1=p0+p1`.

`<1>3.` A fixed adjacent-swap schedule using S gives, for every `s>=1`,
a unitary `U_s` supported on `2s` consecutive O sites such that

    U_s (1_(O^s)⊗eta^s) = V_s.

Choose the stable permutation taking `old_1 ... old_s new_1 ... new_s`
to `old_1 new_1 ... old_s new_s`, moving each new strand left past later
old strands. On the insertion morphism every new strand is eta at every
crossing, so `<1>2` gives the identity inductively. This only specifies a
fixed circuit; S is not asserted to satisfy a braid relation off this
vacancy subobject. In particular this is not an inferred half-braiding.

## F1.1b. Transport on a fixed tensor block suffices [proven; any, L0 + blocked H, R0^u]

**ASSUME** C unitary fusion, `(O,eta)` pointed, `D=<O>`, an integer `b>=1`,
and a pointed unitary inverse half-braiding
`t_Y:Y⊗P -> P⊗Y` for `P=O^b`, point `xi=eta^b`, on the **full D**.
Thus H of CA-90 holds with ancillary object P and point xi.
**PROVE** for every L a unital injective *-map `alpha_L:A_L -> A_(2L)`
intertwining the exact O-site dyadic insertion and satisfying

    alpha_L(A_[j,k]) subset A_[2j-1-r,2k-1+r],  r=2b-1,

with out-of-chain endpoints clipped. The family is natural under pointed
unitary tensor equivalences transporting b and t.

`<1>1.` The one-gap proof CA-90:89-105 works for inserting P after any
prefix J in a heterogeneous word `J R`: conjugate `a⊗1_P` by
`1_J⊗t_R`. All old objects and all old endomorphisms lie in full D.
It is unital and *-preserving; compressing with `1⊗xi` proves injectivity
and the point identity proves insertion intertwining. Locality follows
by the same three computations, now shifting endpoints by b. In the
straddling case use `t_(R C)=(t_R⊗1_C)(1_R⊗t_C)` exactly as at :103-105.
No assertion that O itself half-braids is used.

`<1>2.` Write `L=mb+q`, `0<=q<b`, `Q=O^q`. Start from `P^m Q`.
For i=1,...,m, insert a P block immediately after the i-th old P block;
the prefix has O-site length `(2i-1)b`. The suffix consists of the
remaining old P blocks and Q, so `<1>1` applies, including the final
crossing with Q when q>0. Append Q at the very end by `a -> a⊗1_Q`.
The resulting map `gamma_L` is unital, injective and *-preserving, with
the insertion isometry `v_block` whose output order is

    old_P new_P ... old_P new_P old_Q new_Q.

The appended point is `eta^q`. For m=0 only the appended-Q map is used.

`<1>3.` Let `U_L` be the tensor product of `U_b` on the m disjoint
`2b`-site cells and `U_q` on the final `2q`-site cell (omit when q=0).
F1.1a gives `U_L v_block=V_L`. Consequently

    alpha_L = Ad(U_L) gamma_L,
    alpha_L(a)V_L = U_L gamma_L(a) v_block = V_L a.

Unitality, injectivity and * preservation persist under unitary conjugation.

`<1>4.` Track interval endpoints before conjugating by U_L. An insertion
after original site ib shifts the left endpoint by b exactly when ib<j,
and shifts the right endpoint by b exactly when ib<k. (If ib=k the
insertion is outside the interval.) Hence `gamma_L(a)` for `a in A_[j,k]`
is supported inside

    [ f(j), f(k) ],  f(s)=s+b floor((s-1)/b).

Appending Q changes neither endpoint. This follows successively from
the three cases in `<1>1`; no single-site generation is assumed.

`<1>5.` Conjugation by the disjoint cell unitaries enlarges this interval
at most to the union of its intersecting full output cells. Put
`i(s)=floor((s-1)/b)` and `a(s)=s-bi(s)`, so `1<=a(s)<=b`. Its left
endpoint is `2b i(j)+1`; its right endpoint is at most
`2b(i(k)+1)`, or the smaller endpoint `2L` in the q-tail. Compare:

    (2j-1) - (2b i(j)+1) = 2a(j)-2 <= 2b-2,
    2b(i(k)+1) - (2k-1) = 2b-2a(k)+1 <= 2b-1.

Thus r=2b-1 works, including all odd L and the case L<b. This is a
membership statement in the interval algebra because tensor conjugations
outside those cells cancel by tensor interchange.

`<1>6.` The construction uses only eta, dagger, tensor operations, t,
unitary associators/unitors, and fixed finite compositions. A pointed
unitary tensor equivalence transporting t therefore carries gamma,
S, U_s and U_L to their primed versions under the iterated tensorators
(Penneys:325-348), and hence carries alpha to alpha'. No canonical choice
of t from C is asserted. The full covariance and composition proof is F1.6 below.

`<1>7.` Along any dyadic sequence, compose these maps. Associativity of
composition gives WT-1 A1 exactly as in CA-90:140–141. This proves a local
unital tower on the original algebras, not just isolated maps. QED.

The bound is sufficient, not optimal; at b=1 use CA-90 directly for r=0.
No preservation of the original occupation grading, one-site translation
covariance, arbitrary-placement coherence or periodic seam is asserted.
These are not hypotheses of F1(a).

## F1.2. Noncentral sites with local lifts [negative to (a) => (b),(c); any, L0, R0^u]

**ASSUME** G is any finite nonabelian group, `g` a noncentral element of
finite order b, `R=direct-sum_(h in G) h`, and `O=R direct-sum g` in
untwisted unitary `Vec_G`, pointed by the unit summand of R.
**PROVE** O has no relative half-braiding on D, while F1(a) holds with
`r=2b−1`. Thus even the proposed **necessary** condition (b) is false.

`<1>1.` Every simple occurs in O, so `D=C`. For an element x with
`gx != xg`,

    [O][x]−[x][O] = [gx]−[xg] != 0.

BY the graded tensor rule (ENO:45; Penneys:277–288,321) and the linear
independence of the simple basis of the group ring. In particular O cannot
have a half-braiding, by CA-90:183–189.

`<1>2.` Write `N=|G|`. Direct multiplication gives `R²=NR` and
`Rh=hR=R` for every h. Therefore the binomial expansion gives

    [O]^b = [1] + K R,
    K = sum_(k=1)^b binomial(b,k) N^(k−1)
      = ((N+1)^b−1)/N.                                  (F1.2a)

BY `g^b=1` and `R^k g^(b−k)=N^(k−1)R`. K is a positive integer.
Thus P has multiplicities `K+1` at 1 and K at every other grade.

`<1>3.` Choose orthonormal bases `e_(h,a)` in these grade spaces, with
`e_(1,1)=xi`. Define, for k in G and homogeneous y_k in Y,

    rho(k)e_(h,a)=e_(khk^−1,a),
    t_Y(y_k tensor p_h)=rho(k)p_h tensor y_k.            (F1.2b)

The grade is preserved since `(khk^−1)k=kh`. Each rho(k) is a unitary
permutation, `rho(k l)=rho(k)rho(l)`, and rho fixes P_1 pointwise.
Naturality holds for every graded morphism, by acting as the identity on
Y's multiplicity spaces. The tensor identity is exactly the displayed
group-action identity, and `t_Y(1_Y tensor xi)=xi tensor 1_Y`.
BY direct substitution; the associator is trivial in this family.
Thus all of blocked H, including unitarity and the point, are proved.

`<1>4.` Apply F1.1b. This proves F1(a) for every L with fixed slack,
while `<1>1` negates (b) and (c). QED. If g is an involution, b=2 and
`P=(N+2)R direct-sum 1`, so already r=3 suffices.

The category itself has no braiding: noncommuting simple grades would
require an isomorphism between two distinct simples. Thus this result
cannot be attributed to hidden L1 input.

## F1.3. Why the proposed Bratteli extraction fails [proven scope diagnosis; any, L0, ->R0^u]

**ASSUME** the conventions and hypotheses of CA-90 Proposition 90.2(b).
**PROVE** its unchanged-side hypothesis is absent in F1(a), and the
counterexample satisfies the corresponding block-insertion arithmetic.

`<1>1.` The decisive prior step is **equality** on both sides of one gap:
`beta(a tensor 1)=a tensor 1_O tensor 1` and its right-side analogue.
This yields the two determinations of the same inclusion-matrix row in
CA-90:197–204. Cite that result; it is not a consequence of an interval
bound alone when the side algebras themselves undergo refinement.

`<1>2.` For an actual insertion of the block P in F1.1b, the same
restriction calculation gives, with J,R' the two old objects (both containing the unit),

    sum_c N_ij^c Lambda_(c,c')
      = dim Hom(c', i tensor P tensor j),
    Lambda_(x,c') = dim Hom(c', x tensor P)
                  = dim Hom(c', P tensor x).           (F1.3a)

The second line is asserted for x occurring in **both** J and R'.
BY decomposition of `Hom(c,J tensor R')` into simple multiplicity
spaces and matrix-unit restriction; equivalently CA-90:199–204 with P
in place of O. The underlying finite Bratteli convention is locally
sourced at Grimm–Martin `twocolour.tex:897–920`; it is not an AF
classification or limiting theorem.

`<1>3.` For (F1.2a), let n_h be the grade multiplicities of P. In the
group case the two rows in (F1.3a) are `n_(x^−1 c')` and `n_(c' x^−1)`.
They agree because these grades are conjugate and n is a class function.
The analogous two rows for O need not agree, by F1.2 `<1>1`.
Thus the integer system for **block** transport is consistent; no
cancellation recovers single-site centrality. QED.

No assertion about an arbitrary lift's unknown side-inclusion matrices is
made. A proof that *all* such matrices force single-site centrality would
contradict the explicit family F1.2. The hypothesis separating CA-90's
valid obstruction from the false extension is one-gap insertion with
unchanged left/right algebras, versus bounded-slack dyadic insertion with
nontrivial side refinements. Vanishing ring commutators do not extract
solutions of the associator equations either, as follows.

## F1.4. Exact associator obstruction [proven; any, L0, ->R0^u]

**ASSUME** A finite abelian, ω a normalized unitary 3-cocycle, and `O=direct-sum_g M_g tensor g`, `m_g=dim M_g`, with point eta in M_0.
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

**Corollary F1.4D [proven].** If the scalar
`κ = β_g(x,y)/β_g(y,x)` has finite order d, then `d | m_g` is necessary
for a half-braiding whenever `m_g>0`.

`<1>1.` Swapping x,y in (H1) gives
`ρ_g(y)ρ_g(x) = κ ρ_g(x)ρ_g(y)`. All matrices are invertible.
Taking determinants gives `κ^(m_g)=1`; order d gives the divisibility. QED.
This is a multiplicity obstruction, beyond the equality of fusion-ring
classes, and it excludes even a nonunitary invertible half-braiding when it
fails. It is not claimed to obstruct all finite-slack algebra maps.

### F1.4T. General counterexample family to (b) => (c) [negative; same tags]

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
constructions of Penneys:284–288,319–321 and ENO:39–51. This is an all-p proof; the exact p=2,3 check is
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
`m_(e_1)=1`, F1.4D would require p|1, impossible. Therefore O has no
half-braiding, regardless of the point. This disproves F1 `(b)⇒(c)`. QED.

## F1.5. Bare-L0 existence for all finite abelian p-group gradings [proven; any, L0, R0^u]

**ASSUME** A is a nontrivial finite abelian p-group of order `p^d` and
exponent `p^e`, omega any normalized unitary 3-cocycle, and O any pointed
object in `Vec_A^omega`. Put `n=sum_g m_g` and `b=p^(e+d−1)`.
**PROVE** `P=O^tensor b` has pointed unitary transport on the full ambient
category; consequently F1(a) holds with `r=2b−1` on the original O chain.
For `A=(F_p)^d`, this gives the explicit bound `b=p^d`.

`<1>1.` Define the pentagon defect

    Q(a,b,c,d) = omega(b,c,d) omega(a+b,c,d)^−1
      omega(a,b+c,d) omega(a,b,c+d)^−1 omega(a,b,c) = 1.

For beta of (H1), direct expansion yields

    beta_g(y,z) beta_g(x+y,z)^−1 beta_g(x,y+z) beta_g(x,y)^−1
      = Q(g,x,y,z)^−1 Q(x,g,y,z)
        Q(x,y,g,z)^−1 Q(x,y,z,g) = 1.                  (F1.5a)

BY the sourced pentagon and cancellation of equal factors, using
commutativity of A. More explicitly, in the four Q factors the terms
with arguments `(g+x,y,z)`, `(x,g+y,z)`, `(x,y,g+z)` and `(x,y,z)`
cancel, leaving exactly the twelve factors on the left. This is an
identity of multiplicative monomials, with no choice of logarithm.
Thus beta_g is a normalized 2-cocycle. The symbolic identity is also
checked independently in `checks/associator_general_exact.py`.

`<1>2.` The opposite `c_g(x,y)=beta_g(y,x)` is a normalized 2-cocycle:
its identity is that for beta at `(z,y,x)`, using abelianness. On the
`|A|`-dimensional Hilbert space with basis v_t, t in A, define

    R_g(x)v_t = c_g(x,t) v_(x+t).

These are unitary, and

    R_g(x)R_g(y)v_t
      = c_g(y,t)c_g(x,y+t)v_(x+y+t)
      = c_g(x,y)c_g(x+y,t)v_(x+y+t)
      = c_g(x,y)R_g(x+y)v_t.

BY the 2-cocycle identity. Therefore
`R_g(y)R_g(x)=beta_g(x,y)R_g(x+y)`, exactly (H1), with the required
orientation. No classification of projective representations is used.

`<1>3.` In the commutative group ring Z[A], put `S=sum_g m_g[g]`.
Since `p^e g=0`, Frobenius in the ring modulo p gives

    S^(p^e) = sum_g m_g^(p^e)[p^e g] = n[0]  modulo p.

The identity `m^(p^e)=m mod p` follows by iterating the binomial
identity `(m+1)^p=m^p+1 mod p`, starting at m=0. Thus no field-extension
or diagonalization assumption is hidden in this step.

`<2>1.` Inductively, for k>=1,

    S^(p^(e+k−1)) = n^(p^(k−1))[0]  modulo p^k.         (F1.5b)

To pass from k−1 to k>=2, raise `C[0]+p^(k−1)T` to p. For
`1<=j<p` the j-th nonconstant term has p-adic divisibility at least
`1+j(k−1)>=k`; the last has `p(k−1)>=k`. The constant becomes the
one displayed. BY the binomial expansion in a commutative ring.

`<2>2.` Take k=d. In P, each **nonzero-grade** multiplicity is divisible
by `p^d=|A|`. BY coefficient comparison in the free basis [g].
The grade-zero multiplicity is not required to be divisible by |A|.

`<1>4.` At nonzero grade g choose `m_g(P)/|A|` copies of the matrices
R_g. At grade zero `beta_0=1`, by normalization, so use the identity
representation on the whole space; in particular it fixes `xi=eta^b`.
F1.4 supplies a pointed unitary half-braiding z on P; take t=z^−1.
Apply F1.1b, restricted to D if necessary. QED.

If A is trivial, normalized omega=1 and the Hilbert-space flip gives
b=1 and r=0 by CA-90. These are existence constructions: orthogonal
identifications of multiplicity spaces are choices, not a canonical
selection from an unmarked presentation. Naturality with transported
choices is F1.6. No one-site carrier enlargement was made: blocking only
provides a construction on the unchanged `A_L`, for **every** L.

**Consequence for F1.4T.** Take `A=(F_p)^3`. Then O satisfies (a) and
(b), but not (c), with b=p^3 sufficient. This is an explicit associator
counterexample whose missing single-site transport is demonstrably not
an obstruction to local dyadic lifts.

## F1.6. Equivalence naturality, including composition [proven; any, L0 + transported blocked H, R0^u]

**ASSUME** F:C->C' is a linear dagger-preserving strong monoidal
equivalence with unitary tensorators `T_(Y,Z):F(Y) tensor F(Z)->F(Y tensor Z)`
and `T_0:1'->F(1)`. Let `u:F(O)->O'` be unitary with
`eta'=u F(eta)T_0`. This explicitly defines “unitary tensor equivalence”;
the underlying tensorator axioms are Penneys:325–348. Fix the same b and
transported blocked H. **PROVE** the lift construction commutes with F,
with composition of such equivalences, and with pointed unitary monoidal
natural isomorphisms. This is finite-tower covariance, not rung R5.

`<1>1.` Recursively let `J_0=T_0^dagger`, `J_1=u`, and, for L>=1,

    J_(L+1)=(J_L tensor u) T_(W_L,O)^dagger : F(W_(L+1))->W'_(L+1).

Define `F_L(a)=J_L F(a)J_L^dagger`. The associativity and unit
tensorator equations imply the analogous tensor compatibility for every
contiguous splitting `W_(k+l)`, after the prescribed associators.
BY induction on l, substituting the displayed recursion and the
associativity equation once at each induction step. In particular F_L
maps each interval algebra onto the corresponding primed interval algebra.

`<1>2.` On image objects, transport t by the well-typed formula

    t'_(F(Y)) = (J_b tensor 1) T_(P,Y)^dagger F(t_Y)
                 T_(Y,P) (1 tensor J_b^dagger).         (F1.6a)

Applying F to the unit, point, naturality and tensor diagrams for t,
and conjugating by the indicated tensorators, gives exactly those
diagrams for t'. BY the two tensorator axioms and dagger preservation.
Every target object is unitarily isomorphic to an image (Penneys:233);
two such unitary presentations
differ by an image morphism, by full faithfulness, so naturality makes
the extension independent of that presentation. Also
`J_b F(xi)T_0=eta'^b`. Thus the transported datum is pointed and unitary.

`<1>3.` The formula for S in F1.1a is a sum of composites of eta,
eta†, p0,p1, tensor products and unitors. By `<1>1`, its image is S'.
The **fixed** swap schedule, not an assumed braid relation, therefore
transports U_s to U'_s. Applying the same computation to each one-gap
factor and the trailing identity tensor gives gamma'_L and U'_L. Hence

    F_(2L) alpha_L = alpha'_L F_L,
    J_(2L) F(V_L) J_L^dagger = V'_L.                    (F1.6b)

BY substitution in `alpha_L=Ad(U_L) gamma_L` and F1.1b's exact finite
factorization. Both equations hold before passing to the faithful carriers.

`<1>4.` For G:C'->C'' with point identification v, the composite point
identification is `v G(u)`. Its iterated tensorators satisfy

    J_L^(GF)=J_L^G G(J_L^F).

BY the recursion in `<1>1` and the composite tensorator
`(GF)^2_(Y,Z)=G(F^2_(Y,Z)) G^2_(F(Y),F(Z))` (direct substitution).
Consequently `(GF)_L=G_L F_L`, and the two covariance squares compose.
The identity pointed equivalence, with u=1, gives identity maps by the
same formulas; a nontrivial pointed u gives its stated conjugation.

`<1>5.` If `lambda:F=>G` is unitary monoidal and the point maps obey
`u_G lambda_O=u_F`, induction using the monoidal naturality equation
(Penneys:341–348) gives `J_L^G lambda_(W_L)=J_L^F`.
Together with `G(a)lambda_(W_L)=lambda_(W_L)F(a)`, this gives identical
algebra transport maps, and likewise identical transported t and alpha.
QED BY `<1>1`–`<1>5`. This proves invariance of existence/nonexistence as
well, using a quasi-inverse. It does not choose a blocked half-braiding
canonically from bare L0 data.

## Verification and research record

**Context and change.** The requested cut argument presupposed that a
bounded thickening would preserve a single-site obstruction. Independently,
two collaborators and the primary derivation found that a tensor power can
admit transport when its root does not. The exact vacancy swap is what
returns from block insertion to the prescribed fine-site V_L.

**Why these choices.** The theorem keeps arbitrary interval morphisms,
full D and the remainder q; omitting any of these would hide the hardest
locality or all-L condition. We chose an explicit vacancy unitary instead
of an unspecified extension of an isometry so that its transport under
unitary tensor equivalences is proved. The phase convention in F1.4 is
derived by two typed associator paths, not recalled from a projective-
representation formula with a potentially opposite convention.

**Frictions and dead ends.** The Bratteli proof attempt was abandoned
because F1.2 refutes its conclusion. Centrality of O alone misses both
finite-block flexibility and associator constraints. A naive swap on all
occupied tensor factors is unavailable; S fixes that corner and is used
only in one fixed schedule. The target's “characterization or needs L1”
dichotomy is therefore false. The specific three-summand nonabelian test
is not settled by changing its carrier. No canonical selection of H,
occupation covariance or conformal conclusion was smuggled in.

**Acceptance.** `checks/README.md` gives commands, cutoffs, expected red
failures, output locations and the manifest. Standard-library exact
integer calculations test the finite algebraic claims; no floating-point
tolerance is used. The small four-letter nonabelian calibration checks all
4/54/798 interval matrix units for L=1/2/3, including actual tensor-interval
membership, the odd tail and L<b. The independent seven-letter referee
calibration checks 20,866 interval units and 9,131,164 nonzero entries.
Both reject omission of the vacancy shuffle at the exact V identity.
The associator checks reject phase erasure and a sign change in (F1.5a).
They test the pentagon, all stated matrix hexagons, the symbolic slant
identity, nonbilinear cocycles, regular representations and coefficient
divisibility. These checks calibrate the displayed all-input proofs;
finite cutoffs are not proofs of their quantifiers.

Two GPT-6.1 xhigh collaborators independently investigated blocking and
associators; a third supplied the hostile review `checks/REVIEW.md`.
Its proof-complete grade concerns the positive sufficient theorem and
counterexamples, not a classification of all lifts. All artifacts remain
inside the task directory, which serves as the task-local run bundle.

## Results ledger

- F1.0 — **proven:** vacuum insertion requires the pointed site; (c) must be pointed for the cited intertwining construction; lift convention is (as).
- F1.1a — **proven:** the explicit vacancy swap is a self-adjoint unitary, with exact insertion identities and pointed-unitary covariance.
- F1.1b — **proven:** pointed half-braiding on any fixed `O^b` over full D gives all-L local dyadic lifts, `r=2b−1`, on the unchanged carrier and exact V.
- F1.2 — **negative:** `(a) => (b)` and `(a) => (c)` are false; the finite-group family has a noncentral site and a local lift.
- F1.3 — **proven:** the block-insertion inclusion matrices are consistent in that family; the CA-90 one-gap obstruction does not imply the proposed finite-slack obstruction.
- F1.4 / F1.4D — **proven:** exact abelian associator equations characterize pointed half-braidings, and their commutator phases give a multiplicity divisibility obstruction.
- F1.4T — **negative:** `(b) => (c)` is false in the trilinear family for every prime p.
- F1.5 — **proven:** every pointed object in every normalized unitary cocycle-twisted finite abelian p-group category has a local dyadic lift; the explicit sufficient block length is `p^(e+d−1)`.
- F1.4T + F1.5 — **proven:** the same associator family satisfies (a) and (b), but fails (c); lack of one-site transport is not a finite-slack no-go.
- F1.6 — **proven:** naturality, composition and pointed unitary monoidal natural-isomorphism compatibility hold for transported blocked data.
- Prior CA-90 — **proven (cited):** pointed (c) implies (a) with r=0 and implies (b); the one-gap obstruction remains valid in its stated class.
- Exact finite checks — **proven finite identities:** baseline runs pass; specified mutations fail at meaningful invariants; they are calibrations of the general proofs.
- General `(b) => (a)` and a characterization of arbitrary local lifts — **conjectural / unresolved:** no necessary-and-sufficient replacement is proved.
- Symmetry-preserving, periodic or canonically selected versions — **conditional:** the present existence results supply none of those additional compatibilities.

## Layer tags

| Statements | Setting / microscopic geometry | Data layer | Rung reached | Rung claimed |
|---|---|---|---|---|
| F1.1a | any / open ordered sites | L0, pointed O | finite ingredient | ->R0^u |
| F1.1b, F1.6 | any / open, fixed block origin | L0 + specified pointed H on O^b, transported by equivalences | R0^u | R0^u |
| F1.2 | any / open | bare L0 within the general untwisted finite-group family | R0^u; obstruction refuted | R0^u, not characterization |
| F1.3–F1.4 | any | L0 including F/omega | finite obstruction/scope statements | ->R0^u |
| F1.4T | any / open | bare L0, explicit trilinear associator family | (b) not (c); R0^u by F1.5 | R0^u |
| F1.5 | any / open | bare L0 in all twisted finite abelian p-group categories, pointed O | R0^u | R0^u |
| Original F1 equivalence | any / open | L0 | refuted | R0^u characterization, false |

No L1 braiding, L2 modular datum, L3 enrichment or L4 target is used in
the new existence families. No analytic R1, mode R2, conformal R3,
fidelity R4 or synthesis R5 claim follows. A finite-tower naturality square
is not the programme's functorial CFT realization.

## What this gives the integration

The **CA-88 `L0 / R0^u` cell advances for explicitly stated classes**, and
the general sufficient certificate broadens from transport on O to
transport on a finite tensor power O^b. This construction uses the existing
algebras `End(O^L)` and literal insertion, so it fits the CA-76 strict-lift
hypothesis without changing that carrier. CA-76's drift bound can be
invoked when states are supplied; its analytic hypotheses are unchanged.

Target 90.T's proposed universal centrality deduction is **refuted**.
CA-90 Proposition 90.2(b) is not refuted: its one-gap unchanged-side
hypotheses are stronger. Equation (90.5), applied to O, still exactly
characterizes the one-site transport construction. Applied to O^b it
provides the broader sufficient condition of F1.1b; equations (H1) are its
explicit associator content in abelian graded categories.

The entire L0/R0^u cell is **not** characterized, and it is **not** shown
to require L1. In fact the new lifts include categories that cannot be
braided. R1–R5, periodic/full seam coherence and preservation of the
occupation grading do not move. These distinctions are essential to the
integration; no report files have been edited in this round.

## Open problems

1. **Central-class sufficiency.** For arbitrary unitary fusion C and
   pointed O with `[O]` central in `K(<O>)`, does F1(a) hold? A positive
   finite-power transport lemma would suffice, but neither it nor the
   weaker algebra-map claim is proved in that generality.
2. **Necessity of finite-power transport.** Does F1(a) force a pointed
   relative half-braiding on some O^b? This would give a different proposed
   characterization; no extraction theorem is established here.
3. **Restricted-lift extraction.** Identify precise extra hypotheses
   (one-gap factorization, stronger placement coherence, occupation-degree
   covariance, or translation covariance) under which a one-site
   obstruction can be recovered. They cannot be inserted into F1(a)
   retrospectively.
4. **Original three-summand test.** The particular `Vec_(S3)` object
   `O=1 direct-sum g direct-sum h`, `gh!=hg`, remains open for arbitrary
   finite-slack lifts. The four- and seven-letter checks below do not
   decide it. This is a residual test of a general criterion, not the
   subject of the construction.
5. **Additional rungs.** Supply a compatible nontrivial state/dynamics,
   periodic seam and symmetry data before invoking R1–R5. Equivalence
   covariance of a chosen block datum does not solve canonical selection.

## Examples table

All entries instantiate the general results; none is used as evidence for
an unrestricted theorem.

| Instance | Exact datum / result | Boundary |
|---|---|---|
| Any finite nonabelian G, `O=R direct-sum g`, g noncentral of order b | `(R+g)^b=1+KR`, `K=((|G|+1)^b−1)/|G|`; F1.2 gives (a), not (b) or (c) | No grading or translation covariance asserted |
| Small `S3` check: `c=(123)`, `g=(12)`, `A=1+c+c^2`, `O=A+g` | `A^2=3A`, `Ag=gA=T` (sum of transpositions), so `O^2=1+3A+2T`; conjugation-invariant multiplicities 4/3/2 give blocked H by (F1.2b), b=2, r=3 | O noncentral; all interval units checked for L<=3 |
| `S3`, `O=R+g`, g a transposition | `O^2=1+8R`, b=2, r=3 | Independent referee check; original three-summand O is different |
| `A=(F_p)^3`, `omega(a,b,c)=zeta^(a1 b2 c3)`, `O=0+e1+e2+e3` | (b) holds, (c) fails by the order-p commutator; (a) holds by F1.5 with b=p^3 | Category has no braiding: a braiding would half-braid e1, contradicting F1.4D |
| Same trilinear instance, p=2 | A smaller b=2, r=3 uses the explicit six-block Pauli construction in `checks/associator_proof.md`, P2; all 384 matrix hexagons checked | Smaller block is a calibration, not the bound needed by F1.5 |
| Arbitrary omega and pointed O over `Z/4` or `Z/4 x Z/2` | F1.5 gives b=8 or 16 respectively; exact integer coefficient checks | All-omega assertion follows from the proof, not the sampled coefficients |
| Any C, O=1 | Scalar algebras, identity lift, b=1, r=0 | Degenerate check |

## Sources used

Published local ground truth (not memory or remote sources):

- `references/text/PenneysUnitaryFusionCategories.md:117–135,195–237`:
  semisimplicity, multimatrix endomorphisms, orthogonal direct sums and
  splittings; `:277–288,319–321`: graded tensor product, cocycle and unitary
  construction; `:325–348`: tensorators and monoidal natural transformations;
  `:395–398`: coherence; `:1015–1019`: positive/spherical unitary setting.
  Manifest: `references/manifest/SOURCES.md:34–35,57`.
- `references/text/EtingofNikshychOstrikFusionCategories.md:39–51`:
  fusion and twisted graded categories, pentagon; `:1221–1225`: centre
  forgetful map (its rational surjectivity is not an object-lifting theorem).
- `references/categorical-reconstruction/FuchsRunkelSchweigert2002/source/hep.tex:806–819`:
  associators, unitors and coherence. Manifest:
  `references/categorical-reconstruction/SOURCES.md:87–106`.
- `references/lattice-symmetry/BubbleAlgebra2003/source/twocolour.tex:897–920`:
  finite restriction multiplicities and Bratteli diagrams; manifest
  `references/lattice-symmetry/SOURCES.md:877–910`. This local source was
  found by grep; no missing AF classification theorem is invoked.
- `literature/md/1704.04221/1704.04221.md:298–307`: centre/half-braiding
  definition; the full axioms used are explicitly (H) and (90.5).
- `literature/md/1511.08090/1511.08090.md:743–761`: independent primary
  source for projective centralizer multipliers. Its orientation differs;
  our multiplier is derived by the two displayed paths, not copied.

Prior repository derivations explicitly permitted by the brief:

- `CONVENTIONS.md:631–688,740–761,1450–1470,1524–1543,1564–1576`:
  site, placement, point, layer and lift/support conventions.
- `report/sections/76_corner_to_wilson_bridge.tex:90–147`: established
  drift and global-extension results, cited rather than rederived.
- `report/sections/77_pointed_carrier_invariants.tex:44–82`: pointed
  carrier and distinction between unital and corner towers.
- `report/sections/88_layered_targets.tex:81–125`: layered grid.
- `report/sections/90_local_unital_lift.tex:57–141,170–211,245–250`:
  H, prior one-gap/dyadic construction, equations and exact converse scope.
- `explorations/2026-10-22-astra-r2/E1-local-unital-lift/NOTE.md:11–26,30–117,151–191`;
  `REVIEW.md:12–21,148–168`; `INTEGRATION.md:85–91` in that same directory.

New local derivations, reviews and finite artifacts are indexed with exact
paths, commands and hashes in `checks/README.md` and `checks/manifest.json`.
They are the run bundle for this note, not new external sources. No source
was acquired and no source gap is filled by assertion.
