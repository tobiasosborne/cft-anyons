# H3 skeptical audit: noncollapse, domains, and the two central ledgers

**Pillar:** P4, detecting whether the transported stress survives the OAR mode
contract. **Setting:** any, separately for each chiral family. **Data:**
category-free operator theory; an arbitrary fusion category enters only through
a separately declared microscopic realization. **Rung:** conditional nontrivial
algebraic R2, with no local net, integration, or categorical fidelity conclusion.
Read-only audit apart from this checks directory; no network or Git operations.

## Conventions and precise dependencies

Inner products are linear in the second argument. Retain CONVENTIONS (s),
(v), (af), (ap), (ar), especially the independent real coefficients c,c*.
Use VR-1 A1--A4 exactly as stated in
`cft_machine/research/virasoro_routes.md:55-76`. Its common domain is
D=intersection_s H_s, and its tail is d_(r,n,t)=sum_(j>=r)e_(j,n,t).
The compatible positive self-adjoint K on the limit is the orthogonal block
operator constructed there at :84-96; H_s=Dom K^s with norm ||K^s v||.
Write P_r=i_r i_r*, J_(r<-a) for ordered refinement, and, for t>=0,

    B_(r,n,t)=K_r^t T_(r,n) K_r^(-t-1),
    B_(n,t)=K^t T_n K^(-t-1).

The second expression means the bounded map obtained from
T_n:H_(t+1)->H_t; its norm is at most C_(n,t). The factors are therefore
well-defined on all H. Both weights are essential to this notation.
Normalize the zero mode only when expressly declared:

    L_n=T_n+delta_(n,0)(c*-c)I/24,
    [L_m,L_n]=(m-n)L_(m+n)+(c*/12)(m^3-m)delta_(m+n,0)I.       (N)

This sign agrees with the independently stated shift law in
`report/sections/79_ks_shell_and_refinement_defect.tex:78-81`.

## VR-1 audit

**Verdict:** the existing A1--A4 proof is valid on its stated common domain.
Exact K transport makes earlier finite spaces reducing, gives graph-contracting
P_r, and makes P_r strongly exhausting in every H_s (:84-96). A2 and A3
construct consistent maps H_(s+1)->H_s (:99-116). Products lose one graph
order per letter; the constants at s+j-1 in :119-136 have the correct order.
The direct product-defect identity needs no cancellation of J J*. Embedded
finite identities are P_r, whose strong limit is I (:139-142).

The adjoint statement at :143-146 is a pairing on D. It is not an assertion
that closed adjoints are equal, that L0 is essentially self-adjoint, or that
its spectral projections preserve D. Neither positive energy nor spectral
covariance follows from A1--A4. This boundary is explicit at :78-82,173-177
and `report/sections/81_cft_machine_oar_contract.tex:105-114`.

## NC: exact noncollapse criterion, including an eventual converse

**Assume:** VR-1 A1--A4 and H nonzero. Fix any t>=0. The following are
equivalent, where stages, vectors, modes and positive margins may vary:

1. Some limiting T_n, n!=0, is nonzero on D.
2. There are n!=0, a unit v in H_a, r0>=a and kappa>0 with
   |q_r|>=kappa for every r>=r0, where
   v_r=J_(r<-a)v and q_r=<v_r,B_(r,n,t)v_r>.
3. There are n!=0 and a unit transported coarse vector at some stage r with
   |q_r|>d_(r,n,t).
4. The normalized representation (N) is nontrivial.

**Quantitative conclusion:** condition 3 gives a common lower bound
|q_M|>=|q_r|-d_(r,n,t)>0 at every M>=r and at the limit. In particular
||B_(n,t)||>=|q_r|-d_(r,n,t). This is a finite certificate only when its
A3 tail has been certified; sampled decay is not a tail certificate.

<1>1. Weighted transport has exactly the same A3 error.
  <2>1. Functional calculus on the reducing range of J gives
         B_(r+1)J-JB_r=K_(r+1)^t(T_(r+1)J-JT_r)K_r^(-t-1).
  <2>2. Its norm is <=e_(r,n,t), and ||B_r||<=C_(n,t), by A2--A3.
  <2>3. Telescope on the fixed unit v_r. Consequently q_r converges and
         |q_r-q_infinity|<=d_(r,n,t), with
         q_infinity=<i_a v,B_(n,t)i_a v>.
         Identification of the limit follows from VR-1 :108-115.

<1>2. Conditions 2 and 3 are equivalent and imply 1.
  <2>1. Condition 2 and d_r->0 give condition 3 at a sufficiently late r.
  <2>2. The inequality in <1>1 gives the claimed margin from condition 3,
         hence condition 2 and B_(n,t)!=0, hence T_n!=0.

<1>3. Condition 1 implies condition 2 for every fixed t.
  <2>1. If B_(n,t)=0, then T_n vanishes on the coarse union, since
         K^(-t-1) bijects each finite coarse space onto itself.
         The coarse union is dense in H_1; continuity T_n:H_1->H gives
         T_n=0 on D. Thus condition 1 implies B_(n,t)!=0.
  <2>2. If <x,B_(n,t)x>=0 for all x in the coarse union, complex
         polarization gives <x,B_(n,t)y>=0 for all coarse x,y.
         Density and boundedness would give B_(n,t)=0. Therefore some
         unit coarse v has q_infinity!=0. Coherent superpositions are
         allowed: diagonal entries in a preferred basis need not detect B.
  <2>3. Eventually |q_r|>=|q_infinity|/2. Rebase the coarse vector at r0
         if the A5 statement requires a bound starting at its own stage.

<1>4. Conditions 1 and 4 are equivalent.
  <2>1. If every off-zero T_n vanishes, the (1,-1) and (2,-2)
         brackets give c*=0 and T0=cI/24. Hence every normalized L_n=0.
  <2>2. Conversely a trivial normalized representation has every T_n=0
         for n!=0. QED by <1>1--<1>4.

The brief's exact example <v_r,T_(r,n)K_r^(-s)v_r> also works. For s>=1,
its bounded weighted mode has defect <=e_(r,n,0), so the same theorem
applies with tail d_(r,n,0). For s=0 a fixed coarse v still has
|q_r-q_infinity|<=d_(r,n,0)||v||||K_a v||; polarization and the eventual
converse remain valid. Taking s=1 is the cleanest version of that example.

## Collapse families and a correction to the brief

`report/sections/95_probe_word_ward_lifting.tex:93-133` is Negative 95.5.
At :121-122 it has T_(r+1,n)J_r=0 and zero limiting modes, for both families.
Thus every fixed coarse vector is killed after its first refinement.
K transport implies the same after either of the weights defining B; q_r=0
for all r>a. Moreover :114 bounds ||B_(r,n,t)||<=1/(pi N_r), uniformly in
t, so no moving unit vector can rescue this graph-weighted A5 either.
Any coarse-stage finite certificate must fail: its exact tail bounds |q_r|.

`report/sections/100_zero_mode_lattice_chirality.tex:142-150`, Negative
100.5, has all finite modes zero, so every proposed A5 pairing is zero.
Neither family refutes the strengthened contract.

The equation ``95.5 (= CA-89 Neg.89.3)'' in the H3 brief is incorrect.
`report/sections/89_ward_ks_transfer.tex:92-99`, Proposition 89.3, proves
A2 fails for the proposed physical-energy control. It is not an A1--A4
collapse family and is rejected before A5. The brief also uses old fermion
numbers: the diagonal bound is 95.8, the wrong-energy obstruction 95.9,
and the general categorical insertion formula 95.11.

## CP: an elementary c*=0 triviality theorem with exact domain assumptions

**Assume:** normalized Virasoro relations (N) with real c* and adjoint
pairing on one common invariant dense D in a nonzero Hilbert space. Assume D contains
a Hilbert-total subspace E such that each v in E has a threshold N(v) with

    L_n v=0 for every positive integer n>=N(v).                (R)

**Prove:** c*>=0. If c*=0 then every L_m vanishes on D. Therefore NC/A5
and (R) imply c*>0. Neither L0 positivity nor integration is needed for
this implication. A Hilbert-total family suffices; take its linear span,
which still has property (R). No uniform threshold is required.

<1>1. For nonzero v in E and k sufficiently large, adjoint pairing gives
         ||L_-k v||^2=2k mu+(c*/12)(k^3-k)||v||^2,
         mu=<v,L0v> real. Negative c* makes this negative for large k.
         Hence c*>=0.

<1>2. Suppose c*=0. Put nu=||L0v||^2. For every sufficiently large k,
         L_k v=L_2k v=0. Consider u=L_-2k v/k, w=L_-k^2 v/k^2.
  <2>1. Their Gram matrix is

             [ 4mu/k       6mu/k               ]
         G = [ 6mu/k       8nu/k^2+4mu/k       ].             (G)

         Indeed [L_k,L_-k]=2kL0 and [L_2k,L_-k]=3kL_k give
         ||L_-2k v||^2=4k mu,
         <L_-2k v,L_-k^2 v>=6k^2 mu,
         ||L_-k^2 v||^2=8k^2 nu+4k^3 mu.
         All products are legitimate because D is invariant.
  <2>2. G>=0 implies mu>=0. If mu>0, then
         det G=4mu(8nu-5k mu)/k^3<0 for large k, a contradiction.
         Thus mu=0 for every v in E.
  <2>3. For all sufficiently large k, ||L_-k v||^2=2k mu=0.
         Hence both L_k and L_-k kill v at large |k|.
  <2>4. For any integer m choose k so large that k and k-m exceed N(v)
         and 2k-m!=0. Then both terms in [L_k,L_(m-k)]v vanish.
         At c*=0 this bracket equals (2k-m)L_m v; hence L_m v=0.

<1>3. For u in E and v in D,
         <u,L_m v>=<L_-m u,v>=0.
         Totality of E implies L_m v=0 for every v in D.
         This contradicts NC/A5. QED by <1>1--<1>3.

The primary-vector specialization of (G), with mu=h and nu=h^2,
is the familiar level-two matrix at weight h/k and c*=0. Its three entries
agree with `references/cft/Schottenloher2008/Schottenloher2008.md:2937-2947`.
The proof above derives them rather than relying on the extraction's nearby
incorrect strict-positivity sign or its inconsistent level-one normalization.

## What extra positive-energy assumption supplies (R)?

**Sufficient, entirely algebraic:** L0 is bounded below as a quadratic form
on D, and its eigenvectors lying in D have Hilbert-total span. If L0v=hv
and the lower bound is b, [L0,L_n]=-nL_n makes L_n v either zero or an
eigenvector of eigenvalue h-n. For n>h-b the latter contradicts the bound.
Thus (R) holds. No finite-dimensional eigenspaces, global ground eigenvalue,
cyclic vacuum, closed-adjoint equality or Diff integration is needed.
The eigenvalue-shift argument is source-local at Schottenloher :2762-2766.

**Alternative with continuous spectrum:** supply a self-adjoint extension H
of L0, stable bounded-energy spectral cutoffs on D, and the explicit spectral
support covariance L_n(1_Delta(H)D) subset Ran 1_(Delta-n)(H). If H is
bounded below, cutoff vectors form a total subspace satisfying (R).

**Unproved boundary:** positivity/semiboundedness of the form L0 on D alone
has not been shown here to supply either condition. A1--A4 provide neither.
Do not report that implication as proved or false. Carpi--Weiner begins with
an integrated positive-energy Diff representation at
`references/cft-machine/coset-symmetry/CarpiWeiner2004/source.tex:701-720`;
the dense eigenvectors there use scalar full rotation, not formal brackets.
Its energy bound at :727-747 therefore cannot silently close this gap.

## Literal linear-ledger c>0 is false without genuine normalization

Choose a supplied unitary highest-weight target with charge a>1 and
weight h>a/24; this general target class is sourced by Schottenloher
:2985-3004, with integration at :3044-3054. Set T_n=L_n for n!=0 and
T0=L0-hI>=0. The ledger becomes c*=a, c=a-24h<0. Adjoint pairing survives.
Thus even a genuine positive-energy unitary target with positive raw T0
does not imply positivity of the linear ledger c.

This also has an A5 witness: for a unit primary Omega put
w=L_-1 Omega/sqrt(2h), v=(Omega+w)/sqrt(2), K=(1+L0)^p. Then

    <v,L1 K^-1 v>=sqrt(2h)/(2(h+2)^p)>0.

The finite spectral-cutoff construction of
`report/sections/100_zero_mode_lattice_chirality.tex:212-226` realizes
A1--A4 for this declared target (p>1, geometric cutoffs). Once the cutoff
contains Omega,w, it preserves the displayed A5 value exactly. The scalar
shift changes neither A3 nor A5, and its change in A4 is exactly absorbed
by c->c-24h. This is an abstract supplied-target counterexample, with no
local categorical tower asserted. If one additionally declares c=c*, CP
and A5 do give the correctly normalized conclusion c>0.

## Exact checks and residual obligations

`noncollapse_symbolic.py` independently normal-orders Virasoro words, checks
the primary and moment Gram determinants, the zero-mode shift sign and exact
graph-weight transport. It also checks that a coherent superposition detects
a mode whose preferred-basis diagonal vanishes. Run with `python3` from the
repository root using this file's checks-directory path.
The --mutate run alters the cross entry 6h to 5h and fails the source-oracle
assertion; the unmutated run passes all checks. These are exact SymPy checks,
not numerical evidence for a microscopic construction.

Still separate: constructing A1--A4/A5 from arbitrary categorical data,
identifying its state system with WT-1, and proving local fields, group
integration, positive physical energy, and modular fidelity. None follows
from the noncollapse criterion or the algebraic charge argument.

## Follow-up: audit of the positivity-only implication

**Verdict, 2026-10-27:** no proof or counterexample of the bare implication
``semibounded L0 form + common-domain adjoint pairing + nontrivial Virasoro
action implies c*>0'' was found locally. It remains unproved here. The
accepted CP theorem above is unchanged.

The following tempting source imports do not cover this precise hypothesis:

- `references/cft-machine/virasoro/GoddardKentOlive1986/source.txt:38-57`
  specializes from general unitary representations to highest-weight ones
  at :44-51 before giving the c,h restrictions at :53-57.
- `references/cft-machine/realisation/KawahigashiLongo2002/source.tex:612-626`
  expressly works with representations associated with projective Diff
  representations before using charge restrictions and a lowest eigenvalue.
- Carpi--Weiner :328-339 defines positive energy through an integrated group
  representation; :701-720 obtains a total eigenspace span from its scalar
  full rotation. These are added hypotheses, not consequences of VR-1.
- `references/cft-machine/realisation/CarpiKawahigashiLongo2007/source.tex:1449-1466`
  has a sum-of-squares argument for automatic energy positivity of the
  super-Virasoro extension, then separately assumes lowest weight. Neither
  argument supplies the ordinary-Virasoro spectral bridge needed here.

**Precise sufficient missing lemma (unproved):** extend the given domain to
a common invariant domain for the same operators and adjoint pairing, stable
under bounded-energy spectral cutoffs of a self-adjoint extension H of L0,
and prove the shift of those cutoffs under each L_n. Then cutoff vectors
satisfy (R), so CP proves the desired strict positivity from A5.
The formal identity L_n(H-z)=(H+n-z)L_n on D alone does not establish
L_n(H-z)^(-1)=(H+n-z)^(-1)L_n: the resolvent need not preserve D, and the
operator products have not been extended to its range. Choosing a
self-adjoint extension from the semibounded form does not by itself settle
that domain question. A1 transports the auxiliary K exactly; it supplies
no such spectral cutoff or resolvent control for L0.
