# Independent blocking audit: finite slack does not force centrality of O

2026-10-25. Research collaborator `/root/slack_audit`. Structured derivations,
not proof-assistant verification. No numerical assertion or code execution is
used. The construction below was independently found by the primary explorer.

## Scope, conventions and source anchors

Setting **any**, microscopic open chain; input **L0 plus a declared pointed
unitary half-braiding on one tensor power**; output **R0^u**. This is a
sufficient condition, not a characterization. The group-graded family below
is an explicit instance of bare L0 data for which the condition is supplied
and checked directly. No conformal, dynamical or nontrivial R1 claim follows.

Use the pointed pair `(O,eta)`, `p0=eta eta†`, `p1=1-p0`, fixed bracketing,
dyadic placement and interval-algebra support of CONVENTIONS (am), (t), (as).
All new notation is local to this file because the task forbids changes to
CONVENTIONS. Suppress unitary associators and unitors as in CA-90.

Sources: CA-90 `report/sections/90_local_unital_lift.tex:59-77` (data and H),
`:89-105` (one-gap proof), `:193-208` (exact scope of the one-gap converse);
`references/text/PenneysUnitaryFusionCategories.md:219,235` (orthogonal
splittings), `:319-325` (unitary monoidal structure and graded example),
`:325-348` (tensorators); `references/text/EtingofNikshychOstrikFusionCategories.md:45`
(untwisted Vec_G); `literature/md/1704.04221/1704.04221.md:298-307` (center).
Every additional identity below is derived explicitly.

## B1. Universal pointed vacancy swap [proven]

**ASSUME** a pointed object `(O,eta)` in a unitary monoidal category.
**PROVE** a natural self-adjoint unitary `S:O⊗O -> O⊗O` with
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

## B2. A half-braiding on a fixed tensor block suffices [proven]

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
B1 gives `U_L v_block=V_L`. Consequently

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
of t from C is asserted. QED.

## B3. Broad noncentral family with a central square [proven counterexample]

**ASSUME** a finite group G with a noncentral involution g, untwisted
unitary Vec_G, `R=sum_(h in G) h`, and `O=R ⊕ g`, pointed by the unique
unit summand in R. **PROVE** `[O]` is noncentral, but B2 applies with b=2.

`<1>1.` All simples occur in O, so D=C. R is central, and g is
noncentral. Therefore O is noncentral. Moreover

    R²=|G|R,  Rg=gR=R,  g²=1,
    O²=(|G|+2)R+1.

BY direct multiplication of the finite group-ring sums. Consequently P=O²
has multiplicities `n_1=|G|+3`, `n_h=|G|+2` for h != 1, invariant under
conjugation. These identities use untwisted Vec_G from ENO:45; the unitary
graded category is Penneys:321 with omega=1.

`<1>2.` Choose orthonormal bases `e_(h,a)` of each P_h, with the first
vector in P_1 equal to xi=eta². Define

    rho(k)e_(h,a)=e_(k h k^-1,a),
    t_Y(y_k⊗p_h)=rho(k)p_h⊗y_k  for y_k in Y_k.

The second formula preserves total degree, because
`(k h k^-1)k=kh`. Each rho(k) is unitary, rho is a group action, and
rho(k)xi=xi (indeed rho acts as identity on all of P_1). Hence t is
unitary, unital, pointed and natural for every grading-preserving morphism.
On homogeneous y_k,z_l, the tensor identity amounts to
`rho(kl)=rho(k)rho(l)`. Thus every H identity is checked, and B2 yields
the required local dyadic lift for every L with r=3.

`<1>3.` This proves `(a) does not imply (b)` and `(a) does not imply (c)`
in F1. O has no half-braiding, since such an isomorphism with each simple
would force `[O][x]=[x][O]` by CA-90:183-189. It also shows that blocking
a cut cannot extract centrality of the unblocked site under the stated
hypotheses. QED.

## Examples table (instances only)

| Instance | Checked symbolic datum |
|---|---|
| Any finite G with noncentral involution g | B3: O=R+g, O²=(|G|+2)R+1; r=3 |
| Smaller S3 instance | Let c=(123), g=(12), A=1+c+c², T=sum all transpositions. O=A+g has O²=1+3A+2T (multiplicities 4 at 1, 3 at c,c², 2 on T). A and T are central; O is not, because conjugation sends g to another transposition. The same explicit t and B2 give r=3. |

The S3 row is calibration of B2/B3's mechanism, not a model-specific
construction principle. The specific O=1+g+h in Target 90.T is not decided
by this example; its choice cannot be substituted into the central-square
calculation without checking the new tensor power.

## Audit conclusion and remaining limits

The proof survived the critical audits: full interval-algebra membership,
arbitrary endomorphisms, heterogeneous tail, exact pointed V_L and all L.
No grading covariance is asserted; a half-braiding of P need not respect
the sum of the original O-site occupation projections. The implication
`(b)=>(c)` and whether some local lift exists for every central [O] remain
separate questions. The new sufficient condition is a pointed central
tensor power on **full D**, stronger than centrality of [O^b] alone.

## Addendum: any noncentral finite-order group element [proven]

The involution assumption in B3 is unnecessary. For any finite nonabelian
G choose any noncentral g of order b, set n=|G| and O=R+g. Since R and g
commute and `R^j=n^(j-1)R` for j>=1, the binomial expansion gives

    O^b = 1 + K R,
    K = sum_(k=0)^(b-1) binomial(b,k) n^(b-k-1)
      = ((n+1)^b - 1)/n.

The sum proves integrality and positivity without division assumptions.
Thus P has conjugation-invariant multiplicities K+1 at the unit and K
elsewhere. The explicit action in B3 applies unchanged and fixes eta^b.
B2 yields finite slack `r=2b-1`. Every finite nonabelian group therefore
supplies such a counterexample; S3 only calibrates the general mechanism.

## Exact finite calibration (collaborator addition)

`check_blocked_lift.py` independently constructs the actual block transport
as a permutation on the concatenated old/ancilla word basis: P basis words
are sorted inside each total-grade block, rho transports their index to the
conjugated grade, and every inserted block crosses the actual suffix's
total grade. It then applies S to the middle two sites of each four-site
cell. This is an implementation of B2, not a symbolic copy of its support
formula. Standard-library exact tuples, sets and integer coefficients only.

The mutation `--omit-vacancy-shuffle` was run first and failed exact V at
L=2, old word (0,1). Restoring U gives GREEN at L=1,2,3: 16,256,4096-point
grade-preserving permutations, exact V, unitality, dagger and representative
matrix-unit products. All 4,54,798 local categorical matrix units,
respectively, satisfy actual full-cell-union support and the r=3 bound.
Membership checks require unchanged exterior row/column words, matching
interior total grades, and coefficient 1 for **every** exterior context.
The cutoff calibrates the construction and does not prove the theorem.
Raw output: `blocked_lift_red.txt`, `blocked_lift_output.txt`. Commands from
the repository root (expected mutation exit code 1, baseline exit code 0):

    python3 explorations/2026-10-25-astra-r3/F1-dyadic-lift-characterisation/checks/check_blocked_lift.py --omit-vacancy-shuffle
    python3 explorations/2026-10-25-astra-r3/F1-dyadic-lift-characterisation/checks/check_blocked_lift.py
