# Hostile audit of finite blocking and the associator separation

**GRADE: PROOF-COMPLETE for the finite-block sufficient theorem and the
noncentral-site counterexample; COUNTEREXAMPLE to F1's proposed equivalence.**
Research referee `/root/hostile_review`, 2026-10-25. This is a structured
mathematical audit, not a proof-assistant certificate. No network, commits or
Julia were used. Only files under this `checks/` directory were written.

## Scope and exact hypotheses

Setting **any**, microscopic open chain; input **L0 plus a specified pointed
unitary inverse half-braiding of P=O^b on the full D=<O>**, with fixed b>=1;
output **R0^u**. The point is the exact tensor power xi=eta^b. Support is
membership in the tensor interval algebra, not membership in a commutant.
These hypotheses are essential to the proof. Centrality of [P] alone is not
used as a replacement for transport. No occupation-degree, translation,
reflection or periodic-seam covariance is asserted.

The word "natural" in the vacancy-swap statement must mean covariance under
pointed **unitary** identifications and unitary tensor functors. Naturality
under every merely point-preserving linear morphism is stronger and false:
in Hilb take orthonormal eta,x,y and f(eta)=f(x)=eta, f(y)=y.
Then (f tensor f)S(x tensor y)=eta tensor y, whereas
S(f tensor f)(x tensor y)=y tensor eta. The lift theorem uses only the
valid unitary sense. A unitary tensor functor is linear, dagger preserving,
with unitary tensorators; an ordinary strong monoidal equivalence without
these properties does not preserve the stated star structure.

## Per-step verdicts and attempted refutations

**F1.1a.1: VALID.** Put Q_ab=p_a tensor p_b. The proposed T has initial
projection Q_10 and final projection Q_01, annihilates the other two
orthogonal corners, and has T^2=0. Tensor interchange and eta†eta=1 prove
T†T=Q_10 and TT†=Q_01. This is a categorical morphism even without braiding.

**F1.1a.2: VALID.** The surviving square terms are Q_00, Q_11, TT†, T†T.
The eta-insertion identities follow separately on p0 and p1. No flip of the
p1 tensor p1 sector is needed, supplied or inferred.

**F1.1a.3: VALID.** Fix one adjacent-swap schedule, rather than treating S
as a permutation-group representation. Every crossing used on the inserted
subobject has eta on one leg. Therefore the two-leg identity is sufficient
to prove the exact U_s insertion identity. S need not obey Yang--Baxter away
from that subobject. This is why the apparent "all objects become central"
objection to the vacancy swap does not apply.

**F1.1b.1: VALID; the full-D hypothesis does real work.** The following
expansion supplies the interval-membership details compressed in the note.
Work in the coherence-suppressed notation of Penneys:395--398. Insert P
after site s in W_M and write b=1_(W_s) tensor t_(W_(M-s)). Then
beta(a)=b(a tensor 1_P)b† and b(1 tensor xi)=v. Thus beta is unital and
star preserving, and (1 tensor xi†)b† beta(a)b(1 tensor xi)=a proves
injectivity. It also proves beta(a)v=va.

`<1>1.` For k<=s, a supported on [j,k] is disjoint from b; it remains
in the same tensor interval algebra.

`<1>2.` For s<j, write a=1_(W_s) tensor a_tail, where a_tail is the
identity before and after the original interval in the whole suffix.
Full-D naturality gives

```
t_suffix (a_tail tensor 1_P)t_suffix† = 1_P tensor a_tail.
```

This is an equality of morphisms, so the output belongs to [j+b,k+b].
It is not a commutant argument, and no single-site generation is assumed.

`<1>3.` For j<=s<k, write the old word as A J R C with lengths
j-1, s-j+1, k-s, M-k and a=1_A tensor a_JR tensor 1_C.
The half-braiding tensor identity gives

```
b=(1_AJ tensor t_R tensor 1_C)(1_AJR tensor t_C).
beta(a)=1_A tensor [(1_J tensor t_R)(a_JR tensor 1_P)
                    (1_J tensor t_R†)] tensor 1_C.
```

The factor involving C cancels by tensor interchange. The displayed result
belongs to [j,k+b], including when j or k lies strictly inside an old P.
Neither J nor R is required to be an integral number of P blocks.

**F1.1b.2: VALID, including q>0 and L<b.** At insertion i the prefix
length is (2i-1)b and the suffix comprises all remaining old O sites. It is
an object of full D even if it ends in Q=O^q. Previous inserted blocks are
in the prefix, so no unwanted additional transport across them occurs.
Appending Q is a unital star embedding; its point is exactly eta^q. For
m=0 this is the entire first map. The composed isometry is v_block.

**F1.1b.3: VALID.** The disjoint cell unitaries turn each local map
1_(O^s) tensor eta^s into V_s, where s=b or q. Tensor interchange and the
chosen associators identify their product with the prescribed V_L. Hence
Ad(U_L)gamma_L(a)V_L=V_La, exactly, rather than up to a scalar or phase.

**F1.1b.4: VALID.** Apply the three exact interval formulas above at each
step, to the whole current interval morphism. A cut after original ib
adds b to an endpoint iff ib lies strictly before that endpoint. This
gives f(s)=s+b floor((s-1)/b), without decomposing a into site operators.
The strict inequality correctly excludes the insertion after k itself.

**F1.1b.5: VALID; actual membership is proved.** Enlarge [f(j),f(k)] to
its hull of disjoint output cells. This hull has endpoints
2b floor((j-1)/b)+1 and min(2b(floor((k-1)/b)+1),2L). U_L factors as
an endomorphism on this hull tensor endomorphisms on disjoint cells; the
latter cancel on the identity complement. Conjugating the hull factor
keeps an endomorphism in that hull. This proves interval membership. The
two endpoint inequalities displayed in the note then give r=2b-1, also
when the last cell has length 2q and when L<b. The r bound is sufficient;
optimality is not proved or needed.

**F1.1b.6: VALID with the declared-data qualification.** See the explicit
tensorator argument below. The choice of b and t is transported data; no
canonical algorithm selecting t from a fusion category has been produced.

**F1.2.1--3: VALID.** For O=R+g and g a noncentral involution, R central
implies [O] noncentral. All simples occur, so D is the whole graded category.
R^2=|G|R and Rg=gR=R give O^2=1+(|G|+2)R. The block multiplicities are
constant on conjugacy classes. The displayed rho is a genuine permutation
representation, has the correct degree, and fixes all of P_1. In particular
it fixes the specified xi, irrespective of the other unit multiplicities.
Its action identity proves the t tensor identity. The sufficient theorem
therefore applies and disproves both (a)=>(b) and (a)=>(c).

The same proof is valid for a noncentral element g of any finite order b:

```
(R+g)^b = 1 + K R,   K=((|G|+1)^b-1)/|G|.
```

Indeed each nonempty R term in the binomial expansion is
binomial(b,k)|G|^(k-1)R and the remaining term is g^b=1. K is an integer
by that sum. Thus the order-b extension needs no new representation theory.

## Tensorators, associators, and composition

Let J^F_(X,Y):F(X) tensor F(Y)->F(X tensor Y), with F^1:1'->F(1),
and u:F(O)->O' unitary, eta'=u F(eta)F^1. Define K_1=u and recursively

```
K_(n+1)=(K_n tensor u)(J^F_(W_n,O))† : F(W_(n+1))->W'_(n+1).
```

Use K_0=(F^1)† for empty words. The unit and associativity tensorator
axioms, Penneys:325--338, give the identical comparison for every allowed
rebracketing. They also give K_(2L)F(V_L)=V'_L K_L. By applying the same
axioms to each term of T, S, each t, the chosen adjacent circuit, and each
one-gap map, their transported composites are the primed composites. Hence

```
K_(2L) F(alpha_L(a)) K_(2L)†
       = alpha'_L(K_L F(a) K_L†).
```

For G after F, the composite tensorator is
J^(GF)_(X,Y)=G(J^F_(X,Y))J^G_(F(X),F(Y)). Induction in n gives
K_n^(GF)=K_n^G G(K_n^F), for composite pointed unitary u^G G(u^F).
Consequently the algebra comparison and the alpha covariance compose
exactly. This is finite construction covariance, not a claim of rung R5.

## Associator audit

The current `associator_proof.md` H, H-D, T, P and P2 are **VALID**.
The two displayed associator paths give precisely the reversed-order
matrix law rho_g(y)rho_g(x)=beta_g(x,y)rho_g(x+y). Swapping x,y and
taking determinants proves H-D. The trilinear pentagon cancels term by
term; the e1,e2,e3 substitution has commutator phase of exact order p.
This proves (b) does not imply (c). It does not prove failure of (a).
The all-prime congruence and the projective regular representation in P
are sufficient to produce pointed transport on the stated tensor power.
The p=2 Pauli table satisfies each of its three stated anticommutations,
so its smaller square construction also applies. No obstruction to local
dyadic lifts should be inferred from the one-site obstruction.

For arbitrary normalized omega on any finite abelian A, put Q(a,b,c,d)
equal to the cocycle-equation quotient in ENO:49. Direct expansion gives

```
beta_g(x,y)beta_g(x+y,z)/[beta_g(x,y+z)beta_g(y,z)]
 = Q(g,x,y,z)Q(x,y,g,z)/[Q(x,g,y,z)Q(x,y,z,g)] = 1.
```

This supplies a direct slant 2-cocycle proof if the generalization is used.
For A=(F_p)^d and arbitrary O, Frobenius gives [O]^p congruent to
dim(O)[0] modulo p, and iteration gives nonzero-grade multiplicities of
O^(p^d) divisible by p^d. The ordinary projective regular representation
for the opposite-order law has that dimension; the grade-zero action may
be chosen trivial, fixing eta^(p^d). These observations validate the
elementary-abelian extension once its formulas and hypotheses are written.

## Checks and sources checked

`review_block_exact.py` independently constructs the untwisted S3
permutation realization and checks all interval matrix units at L<=3.
Its test demands identical local matrix entries in every outside basis
context, which tests interval membership rather than outside commutation.
`--mutate-shuffle` removes the vacancy correction and fails at the exact
V identity for L=2, old basis word (0,1). Commands and outputs are the
adjacent `review_block_red.txt` and `review_block_output.txt`. The finite
check calibrates the general proof and does not replace it.
The restored run passed all 20,866 interval matrix units and 9,131,164
nonzero fine matrix entries; it includes L=1<b and the L=3 odd tail.
The associator author's exact script was independently rerun: green passed,
and erasing omega again failed the expected nontrivial-multiplier assertion.
Raw outputs are `review_associator_output.txt` and
`review_associator_red.txt`. From this `checks/` directory the commands are:

```
python3 -I review_block_exact.py --mutate-shuffle > review_block_red.txt 2>&1
python3 -I review_block_exact.py > review_block_output.txt 2>&1
python3 -I associator_exact.py > review_associator_output.txt 2>&1
python3 -I associator_exact.py --mutate-associator > review_associator_red.txt 2>&1
```

Both mutation commands must exit 1; both unmutated commands must exit 0.

Sources checked: `report/sections/90_local_unital_lift.tex:59--77,89--105,
175--211,245--250`; `CONVENTIONS.md` (am), (as); `references/text/
PenneysUnitaryFusionCategories.md:219,235,319--348,395--398`;
`references/text/EtingofNikshychOstrikFusionCategories.md:39--51`;
`literature/md/1704.04221/1704.04221.md:298--307`. These support exactly
the structural facts used. The additional computations above are local
derivations. The sharp remaining question is whether every local dyadic
lift forces pointed transport on some finite tensor power; no converse
of that kind is proved here.

## Addendum: final F1.3, F1.5 and F1.6 audit

The rewritten NOTE's F1.5 is **VALID for all nontrivial finite abelian
p-groups**, with order p^d, exponent p^e, and b=p^(e+d-1). Frobenius
modulo p first kills every grade at power p^e. Each additional p-th
power improves the coefficient congruence by one p-adic digit, including
p=2: p(k-1)>=k for k>=2. After d-1 further powers every nonzero-grade
coefficient is divisible by |A|. The constant coefficient is
n^(p^(d-1)) modulo p^d; no divisibility condition on it is needed because
beta_0=1 and its action can be trivial. The opposite-cocycle regular
matrices have exactly dimension |A| and obey the required reversed
matrix law. This proves pointed transport on the entire ambient category
for arbitrary normalized omega, not only on <O>. No root or logarithm of
omega is chosen. Thus the larger p-group theorem needs no classification
theorem for projective representations or finite abelian groups.

The new F1.6 formulas are **well typed and valid**. Its inverse transport
has domain F(Y) tensor P' and codomain P' tensor F(Y); the J_b on the
first output factor has the required domain F(P). The J recursion is
consistent with every contiguous split by tensorator associativity, and
J_b F(xi)T_0=eta'^b follows from the unit equation. The composite formula
J_L^(GF)=J_L^G G(J_L^F) has matching middle object G(W'_L). For a unitary
monoidal natural isomorphism lambda, tensorator naturality and
u_G lambda_O=u_F give J_L^G lambda_(W_L)=J_L^F; naturality on a then
proves equality of the transported algebra maps. The same calculation
with t, including naturality in Y, proves equality of the transported
families and hence of alpha. No new coherence obstruction was found.

Two precise readings should be stated in the final NOTE. In F1.6.2 choose
unitary presentation isomorphisms; these exist by Penneys:233. In F1.6.4,
identity means the identity **pointed** equivalence, including u=1. The
identity functor equipped with a nontrivial pointed unitary u generally
induces Ad(u^tensor L), rather than the identity algebra map.

F1.3's row comparison is valid for x present in both old objects J,R',
with the unit present in both; these are the prior proposition's exact
quantifiers and should remain explicit. The noncentral family has every
simple already in O, so the qualification leaves its counterexample intact.
More explicitly, put n_h=K+delta_(h,1). The complete block-insertion
matrix can be Lambda_(c,c')=K+delta_(c,c'). Then for group simples i,j,

```
sum_c N_ij^c Lambda_(c,c') = K+delta_(ij,c')
 = n_(i^-1 c' j^-1) = dim Hom(c', i tensor P tensor j).
```

Both side rows agree without implying any equality for O. The restriction convention is supported by
`references/lattice-symmetry/BubbleAlgebra2003/source/twocolour.tex:897-920`,
checked against its registered `references/lattice-symmetry/SOURCES.md`
entry. No AF classification result is being invoked.

Independently reran `python3 -I associator_general_exact.py --mutate-sign` and then the restored command.
`review_general_red.txt` records exit 1; `review_general_output.txt` records green exit 0,
including the nonbilinear cocycle and Z4, Z4 x Z2 coefficient calibrations.
These calibrate the displayed general proof. No new blocking defect was found.
