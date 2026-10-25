# G1 — Transport extraction and the freedom of ancillary representations

2026-10-25. Started 05:56:55 UTC; initial statement and all-open ledger
written before 06:01 UTC. Research in progress. Only this directory may be
written; no network, commits, canonical convention edits or Julia suite.
The explicit task scope overrides the repository's ordinary landing workflow.

## Statement under investigation

For unitary fusion C, pointed (O,eta), full D=<O>, W_L=O^tensor L,
A_L=End_C(W_L), and the odd-site vacuum insertion V_L, suppose every L
has a unital injective *-map alpha_L:A_L->A_(2L), alpha_L(a)V_L=V_La,
and alpha_L(A_[j,k]) contained in A_[2j-1-r,2k-1+r] for one finite r.
G1 asks (a) to extract pointed unitary transport on some O^b and recover
the given alpha up to local unitary gauge; (b) to characterize existence
and decide it by finite associator computation; (c) to establish universal
finite-power transport or a counterexample and a corresponding lift no-go.
These are distinct assertions: a failure of the classification in (a)
need not refute the weaker existence converse in F1 INTEGRATION:145–155.

## Conventions fixed before derivation

Tags throughout: any (microscopic open ordered chains), L0 fusion with
every extra datum named, R0^u or finite ingredients ->R0^u; no R2–R5 claim.
Use CONVENTIONS (r),(t),(am),(aq),(as), and F1 SHARD_META proposed (ax)–(az).
The brief's (ar) refers to Ward-to-KS, not transport; (as) is intended.
Support is interval-algebra membership, endpoints clipped to [1,2L].
Associators/unitors are fixed and unitary. New symbols are note-local
because editing CONVENTIONS.md is expressly forbidden.
An inclusion matrix Lambda_(c,d) counts copies of input simple matrix
block c in output charge block d, not the rank of its central projection.
An output unitary gauge means conjugation by a unitary of A_(2L);
any local circuit or unitary cocycle of such operators is a special case.
For an auxiliary object K, kappa:1->K denotes its chosen unit point.
K is not a finite-volume Hamiltonian or a graph-norm control operator.

## G1.1. Alternative ancillary objects [proven; any/open; L0 + supplied K,t,u; R0^u]

**ASSUME** the general pointed fusion setting, a pointed object (K,kappa)
in C, pointed unitary transport `t_Y:Y tensor K -> K tensor Y` on full D,
and a unitary categorical morphism

    u: O tensor K -> O tensor O,
    u(1_O tensor kappa) = 1_O tensor eta.                 (A)

**PROVE** all-L local dyadic lifts on the original A_L with exact V_L
and slack r=1. Their inclusion multiplicities are

    Lambda^K_(c,d)(L) = dim Hom_C(d, c tensor K^L)        (B)

for each input block c occurring in W_L and output block d in W_(2L).
K need not equal O or any tensor power of O.

`<1>1.` Insert K after each successive old O, starting from
`W_L tensor K^L`. The heterogeneous one-gap argument in F1.1b
(`F1 NOTE:105–112`, CA-90 Lemma 90.0) gives a categorical unitary

    B_L: W_L tensor K^L -> (O tensor K)^L,
    gamma_L(a)=B_L(a tensor 1_(K^L))B_L^dagger.

**BY** that argument with ancillary object K. Only the suffix, an object
of full D, is transported; no half-braiding on K with itself is required.
It gives unitality, injectivity, point intertwining, and heterogeneous
interval membership from old position 2j−1 through old position 2k−1.

`<1>2.` Put `T_L=u^tensor L B_L` and
`alpha_L(a)=T_L(a tensor 1_(K^L))T_L^dagger`.
Then `T_L(1_(W_L) tensor kappa^L)=V_L` by (A) cell by cell.
Consequently `alpha_L(a)V_L=V_La`; all algebra-map properties persist.
**BY** `<1>1`, tensor interchange and `kappa^dagger kappa=1`.

`<1>3.` The disjoint u factors outside cells j through k cancel on
conjugation. Thus `alpha_L(A_[j,k])` is contained in
`A_[2j−1,2k]`, itself inside the r=1 interval.
**BY** the membership statement in `<1>1` and tensor interchange.
This treats arbitrary interval endomorphisms, not just single-site ones.
Dyadic composites are coherent by composition, as in CA-90:140–141.

`<1>4.` Decompose `W_L` orthogonally into simple multiplicity spaces.
On `Hom(d,W_L tensor K^L)`, input block c acts on its multiplicity space
with multiplicity `dim Hom(d,c tensor K^L)`. Conjugation by T_L cannot
change these representation multiplicities. **BY** orthogonal
semisimplicity (Penneys:195–237) and the restriction convention
`references/lattice-symmetry/BubbleAlgebra2003/source/twocolour.tex:897–913`.
This proves (B). QED.

This is a sufficient construction for general C. It does not assert that
such K,t,u always exist. The object equation O K = O^2 and the pointed
unitary (A) are essential supplied data.

## G1.2. The requested gauge classification is false [negative; any/open; bare L0 family; R0^u]

**ASSUME** any nontrivial finite group G, N=|G|, the untwisted unitary
category `C=Vec_G`, and `O=direct-sum_(g in G) g`, with orthonormal
homogeneous basis e_g and point eta=e_1. Then D=C.
**PROVE** an explicit all-L lift satisfying G1's hypotheses with r=1,
which no F1.1b construction for any b,t can reproduce up to output
unitary conjugation, even without a locality restriction on that unitary.

`<1>1.` Take `K=N copies of 1`, basis k_h, point kappa=k_1.
Its transport is `t_Y(y tensor k_h)=k_h tensor y`.
All four H axioms hold by the identity action on Y and on the k_h labels;
in particular kappa is fixed. Set

    u(e_g tensor k_h)=e_(g h^(-1)) tensor e_h.             (C)

This is a basis bijection with inverse `(x,y) -> (xy,y)`; it preserves
grade because `(g h^(-1))h=g`, and is therefore a categorical unitary.
At h=1 it satisfies (A). **BY** the explicit displayed computations and
the locally sourced graded tensor rule (ENO:45; Penneys:277–288,319–321).

`<1>2.` The theorem G1.1 applies. More explicitly,

    T_L(e_(g_1,...,g_L) tensor k_(h_1,...,h_L))
      = e_(g_1 h_1^(-1),h_1,...,g_L h_L^(-1),h_L),
    alpha_L(a)=T_L(a tensor 1_(K^L))T_L^dagger.          (D)

Each adjacent output pair has grade g_i, so T_L preserves the total
ordered product. It takes all h_i=1 to V_L exactly. For any interval
matrix a_I its cellwise form gives the stronger exact identity

    alpha_L(1 tensor a_I tensor 1)
      =1_(W_(2j-2)) tensor alpha_|I|(a_I)
                         tensor 1_(W_(2L-2k)).         (E)

**BY** tensoring the explicit basis bijection (C); the trivial-grade K
interleaving introduces no phases. This independently verifies every
interval and every L, including L=1. No occupation hypothesis is used.

`<1>3.` Every F1.1b map, for any b and any blocked H, is of the form

    beta_L(a)=Q_L(a tensor 1_(O^L))Q_L^dagger            (F)

for a categorical unitary Q_L. **BY** F1 NOTE:105–133: every block
insertion is conjugation after tensoring the ancillary identity; their
product inserts `P^m tensor O^q=O^L`, and the final vacancy swaps are
categorical unitaries. This includes L<b, where only the tail is appended.
Hence its inclusion matrix is

    Lambda^tr_(c,d)(L)=dim Hom(d,c tensor O^L).

`<1>4.` A word of length L in the full group alphabet has N^(L−1)
realizations of each total grade: choose the first L−1 letters freely,
then the last is forced. Therefore (B) and (F) give respectively

    Lambda^alt_(c,d)(L)=N^L delta_(c,d),
    Lambda^tr_(c,d)(L)=N^(L−1) for every c,d.            (G)

They differ for every L because N>1. **BY** the grade-zero support of
K^L and the word count just proved.

`<1>5.` Conjugation by any unitary of A_(2L) gives unitarily equivalent
representations inside each output charge block, so it preserves Lambda.
Thus no such conjugation equates alpha_L and beta_L. **BY** the definition
of representation multiplicity, or the matrix-unit argument of CA-76.3.
At L=1 this is visible without counting: alpha_1 sends each minimal
projection of A_1 to the central projection onto the corresponding total
grade of O^2, whereas (F) sends it to a rank-one projection in every
N-dimensional output block. Such a projection is noncentral for N>1.
Even input/output *-automorphism gauges preserve centrality and cannot
remove this distinction. QED.

**Exact scope of the negative result.** This is a lift beyond the
finite-power-transport **normal form**, not an object without transport.
Indeed O itself has pointed transport: conjugation permutes its grades,
`t_Y(y_x tensor e_g)=e_(x g x^(-1)) tensor y_x`; the group action verifies
H exactly as in F1.2.3. Thus G1(a), which includes recovery of the given
alpha, is false, but the weaker implication “some local lift implies
some transportable O^b” is not refuted by this family.

## G1.3. Local lifts with no transportable tensor power [proven counterexample; any/open; bare L0 family; R0^u]

**ASSUME** the untwisted unitary category Vec_G for any finite dihedral
group `G=<a,b | a^2=b^2=1,(ab)^m=1>`, m>=3; put r=ab and

    O = 1 direct-sum a direct-sum b direct-sum r,
    K = 1 direct-sum 1 direct-sum r direct-sum r^(-1),
    eta=e_1,   kappa=E_0.                               (H)

Here E_0,E_1 are the two distinguished unit-grade basis vectors of K;
R_+,R_- have grades r,r^(-1). The letter r in this section is a group
element; the locality slack is written r_slack=1 to avoid a collision.
**PROVE** O satisfies all the local-lift assumptions of G1 with
r_slack=1, but no O^n (n>=1) has even unpointed relative half-braiding
on D=<O>=Vec_G. Thus both G1(a)'s existence extraction and G1(b)'s iff
are false; finite-power transport is not universal, and its absence is
not a no-go for local lifts.

`<1>1.` D=C because a,b occur in O and generate G. Conjugation by a
or b exchanges r and r^(-1); conjugation by a rotation fixes both.
Consequently K has the unitary action rho(x) fixing E_0,E_1 and
permuting R_+,R_- by conjugation of their grades. Define

    t_Y(y_x tensor v_h)=rho(x)v_h tensor y_x.            (I)

The grade equality `(x h x^(-1))x=xh` proves this is a categorical
morphism, and the permutation is unitary. Naturality is identity action
on each multiplicity space of Y. The tensor axiom is
`rho(xy)=rho(x)rho(y)`, the unit axiom is rho(1)=1, and the point axiom
holds because E_0 is fixed. **BY** direct substitution in H of CA-90,
with the untwisted tensor rule ENO:45 and Penneys:319–321.

`<1>2.` Define u on the 16 orthonormal input basis vectors by the
following table. A pair (x,y) in the right column means e_x tensor e_y.

| Input | Output |
|---|---|
| (g,E_0), each g in {1,a,b,r} | (g,1) |
| (1,E_1) | (a,a) |
| (a,E_1) | (1,a) |
| (b,E_1) | (a,r) |
| (r,E_1) | (a,b) |
| (1,R_+) | (1,r) |
| (a,R_+) | (1,b) |
| (b,R_+) | (b,r) |
| (r,R_+) | (r,r) |
| (1,R_-) | (b,a) |
| (a,R_-) | (r,a) |
| (b,R_-) | (r,b) |
| (r,R_-) | (b,b) |

`<2>1.` Every ordered pair from {1,a,b,r} occurs exactly once; u is
unitary. **BY** inspection of the second column, including the four
first-row outputs.

`<2>2.` Every row preserves the product grade. The nontrivial identities
are `ar=b`, `br^(-1)=a=rb`, `ar^(-1)=ra=aba`, and `r^(-1)=ba`;
the others use a^2=b^2=1 or cancel r with its inverse.
These identities hold already in the group generated by two involutions,
before imposing r^m=1. **BY** substitution r=ab. Thus the table works
uniformly for every m>=3, including extra coincidences of total grades.

`<2>3.` The first row gives `u(1_O tensor kappa)=1_O tensor eta`.
This is exactly (A), with the chosen point and no phase. **BY** its
displayed four values.

`<1>3.` G1.1 now constructs the desired alpha_L for every L with
support `[2j−1,2k]` and literal V_L. For a fully explicit formula for
its implementing permutation, let g_i run over {1,a,b,r}, h_i over
{E_0,E_1,R_+,R_-}, and put x_i=g_(i+1)...g_L (x_L=1). Then

    T_L(g_1,...,g_L; h_1,...,h_L)
       = u(g_1,rho(x_1)h_1) tensor ...
                                      tensor u(g_L,h_L),
    alpha_L(a)=T_L(a tensor 1_(K^L))T_L^dagger.          (J)

**BY** the one-gap insertion order: new ancillary label i passes the
entire old suffix x_i. Earlier inserted labels are in the prefix and
are not crossed again. The inverse reads each u-table backwards to
recover g_i and h'_i, then sets h_i=rho(x_i)^(-1)h'_i. Hence (J) is
an explicit basis permutation, not an existence-only choice.

`<1>4.` No power of s=[O] is central in the group ring. To prove this
without an unproved spectral assertion, set theta=2 pi/m and matrices

    A=diag(1,-1),
    R=[[cos(theta),-sin(theta)],[sin(theta),cos(theta)]],
    B=A R.

They obey A^2=B^2=I, AB=R, R^m=I, so define a representation of G
and its complex group algebra. **BY** multiplication and the elementary
rotation addition formulas. Put lambda=2(1+cos(theta))>0. Since
s=(1+a)(1+b),

    M=rho(s)=(I+A)(I+B)
      =[[lambda,-2 sin(theta)],[0,0]],
    M^n=lambda^(n-1) M,
    [M^n,A]_(1,2)=4 lambda^(n-1) sin(theta) != 0.        (K)

**BY** matrix multiplication and induction; m>=3 implies
0<theta<pi, so sin(theta)>0 and lambda>0. If s^n were central it
would commute with a, contradicting (K).

`<1>5.` Any half-braiding on O^n supplies isomorphisms between
`O^n tensor x` and `x tensor O^n` for every simple x in D. Their
classes would make s^n central, as in CA-90 (90.6).
**BY** CA-90:183–189, with O^n in place of O; no converse is used.
This contradicts `<1>4`. QED.

**Structural identity.** The table also verifies `[O][K]=[O]^2`.
Writing k=2+r+r^(-1), the identity is
`(1+a)(1+b)(1+a)(1+b)=(1+a)(1+b)(2+ab+ba)`;
expand or use `(1+b)(1+a)(1+b)=(1+b)(2+ab+ba)`.
Here k is central but s is not. Cancellation of s would be invalid:
the displayed representation M is singular. This explains how a
transportable ancillary object can replace the nontransportable O
without changing the output object O^2.

**Separation of hypotheses.** A lift of algebras plus its distinguished
vacuum subrepresentation does not specify that its ancillary charge
content is O. Requiring the fusion multiplicities of ancillary O^L is
an additional hypothesis absent from G1. Even imposing it would still
leave the uniform-local-gauge and half-braiding coherence problems.

## G1.4. What an arbitrary lift does extract [proven; any/open; L0; finite ->R0^u]

**ASSUME** an arbitrary fixed L, pointed O, and unital *-lifts alpha,beta
of the same V_L. Write `m_c(L)=dim Hom(c,W_L)` and use only nonzero
input/output blocks. **PROVE**:

1. alpha determines nonnegative integer multiplicities Lambda_(c,d), with
   `m_d(2L)=sum_c m_c(L)Lambda_(c,d)` and Lambda_(c,c)>=1.
2. alpha and beta have the same Lambda if and only if there is a unitary
   U in A_(2L) such that `alpha=Ad_U beta` and `U V_L=V_L`.
3. For a cut L=s+t, the exact restriction identity is
   `sum_c N_ij^c Lambda_(c,d)=T^alpha_(ij,d)`, where the right side
   is the multiplicity of block (i,j) under the actual restricted alpha.
   G1's locality does not turn it into the unchanged-side formula 90.2(b).

`<1>1.` Finite-dimensional representations split into copies of simple
matrix representations; the dimension equation is their dimension sum.
The corner P=V_L V_L^dagger reduces alpha and its representation is the
given identity-charge copy of A_L. **BY** CA-76.1 step 3 and CA-76.3;
no new proof of those established propositions is needed. This supplies
one copy of input c in output c and proves the stated inequalities.

`<1>2.` If U conjugates beta to alpha, multiplicities agree. Conversely
let the multiplicities agree. Both representations coincide on P, and
on its orthogonal complement their multiplicities are
`Lambda_(c,d)-delta_(c,d)` (delta only on the occurring input blocks).
For each d, choose a unitary intertwiner of these equal finite
representations on the complement. Its direct sum W lies in
`(1-P)A_(2L)(1-P)`. Set U=P+W. Then U is unitary,
UV_L=V_L, and `Ad_U beta=alpha` on both reducing corners.
**BY** orthogonal direct sums of equal matrix representations and `<1>1`.
This is a complete **global**, finite-volume equivalence criterion;
it supplies no bound on the support or circuit depth of U.

`<1>3.` Restrict to
`S=End(W_s) tensor End(W_t)` inside A_L. Input charge c restricted to
S contains block (i,j) with multiplicity N_ij^c. Restricting alpha first
to A_L and then to S multiplies the inclusion matrices. Hence

    sum_c N_ij^c Lambda_(c,d)=T^alpha_(ij,d).            (L)

**BY** the same finite restriction calculation used in CA-90:199–202,
now retaining the actual right-hand side. This is exactly where Bratteli
data enters. No locality or associator/hexagon identity is used in (L).

`<1>4.` In CA-90:197–204 the unchanged-side one-gap hypotheses identify
T with `dim Hom(d,i tensor P_gap tensor j)`. The unit rows then identify
one Lambda row twice and force centrality of P_gap. For G1, the side
maps are themselves refined and that identification is absent. In
G1.1 the computed Lambda is fusion by K^L, not by O^L; in G1.3 no O^b
can even commute in the fusion ring. **BY** (B), (K) and the exact
hypotheses of CA-90.2(b). Thus using the latter formula for T here is
a false inference, witnessed by an actual local lift. QED.

**Strongest extraction delivered here.** An arbitrary lift determines
the finite multiplicity spaces and a distinguished vacuum copy, up to
unitary equivalence; it does not determine an ancillary categorical
object of the prescribed tensor-power form. If a particular F1 lift
beta is already supplied, equality of its inclusion matrices with those
of alpha is exactly the extra hypothesis for a global point-fixing
conjugacy at each L. To obtain a *local* conjugacy requires a further
uniform bound; to obtain a half-braiding from cut unitaries requires
naturality on fusion embeddings and the tensor equation. Neither is
part of (L). In G1.3 transport extraction fails before these latter
axioms: unitaries `Y tensor O^b -> O^b tensor Y` cannot exist for all Y.

## G1.5. Fixed-power feasibility and the remaining decision boundary [proven; any; L0; finite ->R0^u]

**ASSUME** general fusion input with specified finite associator/dagger
matrices and point; fix b>=1 and P=O^b, xi=eta^b.
**PROVE** pointed transport on P is characterized by a finite system,
and its least b (or infinity if none exists) is invariant under pointed
unitary tensor equivalence. This invariant does **not** characterize
local dyadic-lift existence.

`<1>1.` For simple s_i and complete orthonormal embeddings
`f_(ij;k,mu):s_k -> s_i tensor s_j`, introduce unitary unknown matrices
`z_i:P tensor s_i -> s_i tensor P`. Require

    z_1=1_P,  z_i(xi tensor 1_i)=1_i tensor xi,
    (f_(ij;k,mu) tensor 1_P)z_k
      =(1_i tensor z_j)(z_i tensor 1_j)(1_P tensor f_(ij;k,mu)).   (M)

All fixed associators are inserted. **BY** CA-90.2(a) applied to P,
still with simples of full D=<O>, not just an undeclared smaller
subcategory. The proof of that proposition is not repeated. Thus (M)
is both necessary and sufficient, including the unit, all-morphism
naturality, tensor and point axioms after extension by simple summands.
In real and imaginary coordinates it is a finite polynomial equality
system, including both unitary equations z_i^dagger z_i=1 and
z_i z_i^dagger=1. No floating-point tolerance decides it here.

`<1>2.` A pointed unitary tensor equivalence transports any solution
at b to a solution at the same b; its quasi-inverse gives the reverse
implication. **BY** F1.6:452–517 (transported H). Hence the set of
admissible b and its minimum in `{1,2,...,infinity}` are invariant.
Changing eta to another unit point on the same O does not alter the
set: extend the unit-vector change to a unitary of the unit multiplicity
space of O, act identically on the other simple summands, and transport
H by its bth tensor power. **BY** orthogonal simple decomposition and
the direct conjugation of the equations (M).

`<1>3.` The value is infinity in G1.3 although local lifts exist with
slack one. Thus this invariant is neither an obstruction to general
local lifts nor a bound computable from their slack. In particular the
expected b<=r_slack+1 fails in the strongest possible way. **BY** G1.3.

`<1>4.` Finiteness of (M) for *each fixed b* is not a proof of a finite
decision procedure for existence of *some b*. Neither a terminating
bound on b for all inputs nor an exact representation of arbitrary
supplied complex numbers is part of G1. We make no general
decidability/undecidability claim about that separate problem.
The proposed use of such a test to decide local lifts is already
refuted by `<1>3`. QED.

## Results ledger

- G1.1 alternative-ancilla local lift theorem — proven.
- G1.2 classification up to output unitary gauge — negative, by (C)–(G).
- G1.3 local lifts with no transportable tensor power — proven; negative to G1(a),(b).
- G1.4 exact algebraic extraction and finite-volume unitary equivalence — proven.
- G1.5 fixed-b equations and minimum-b invariance — proven; global decision procedure remains conjectural.
- G1 original existence converse, without gauge classification — negative by G1.3.
- G1(c) universal finite-power transport — negative by G1.3; arbitrary local-lift universality remains open.

## Layer tags

Setting any; microscopic open chains. Data L0, plus explicitly supplied
K,t,u in G1.1; bare L0 within the family in G1.2. Reached: R0^u for those
constructions. Claimed target: R0^u characterization, refuted in its
gauge-classification clause; no higher rung claimed.

## What this gives the integration

G1.1 broadens the sufficient R0^u construction beyond original-ancilla
transport. G1.3 refutes even the existence-extraction target CA-96.10:
the dihedral family reaches R0^u at bare L0 while no power has transport.
CA-88 bare-L0 R0^u existence remains open in general; its cell cannot
honestly be called characterized, universal, or obstructed for these
inputs. The requested three-way choice omits this proved outcome.

## Open problems

All five proof-plan items are initially open. The existence converse and
classification of individual maps must not be conflated.

## Examples table

Instances and exact finite checks to be added after the general statements.

## Sources used

- `report/sections/90_local_unital_lift.tex:57–141,175–211`: transport,
  finite equations and the unchanged-side Bratteli argument.
- `report/sections/76_corner_to_wilson_bridge.tex:90–149`: complement
  representations and unrestricted global extension; not rederived here.
- `explorations/2026-10-25-astra-r3/F1-dyadic-lift-characterisation/NOTE.md:59–517`:
  the blocked theorem, family constructions and covariance.
- `explorations/2026-10-25-astra-r3/F1-dyadic-lift-characterisation/INTEGRATION.md:145–155`:
  the weaker existence-extraction target.
- `references/text/PenneysUnitaryFusionCategories.md:195–237,277–288,319–348,395–398`:
  orthogonal splittings, graded tensor categories, dagger and coherence.
- `references/text/EtingofNikshychOstrikFusionCategories.md:39–51,1221–1225`:
  group grading, associators and necessary centrality.
