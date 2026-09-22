# Realisation, modular fidelity, and a constructive orbifold route

Status: sourced continuum constructions, proved conditional algebra lemmas,
and a proposed microscopic synthesis route; no universal lattice theorem.
Conventions: `CONVENTIONS.md` (u), (v); existing site-object convention (r).
Proofs below are structured mathematical proofs, not proof-assistant output.

## Sources and the precise target

Local source abbreviations, used with exact line anchors throughout:

- EG: `references/cft-machine/realisation/EvansGannon2018/source.tex`.
- B: `references/cft-machine/realisation/Bischoff2018/source.tex`.
- MS: `references/cft-machine/realisation/MignardSchauenburg2017/source/paper.tex`.
- H: `references/text/HollandsAnyonicChainsAlphaInduction.txt`.
- SC: `literature/md/1801.05959/1801.05959.md`.
- FF: `references/text/CFTFromLatticeFermions.txt`.

The acquisition record is `references/cft-machine/realisation/SOURCES.md`.
The current lab-book endpoint is CA-74, a finite anyonic algebra result;
it does not supply the continuum or fidelity conclusions required here.

**Proposal: synthesis input.** Supply an explicit unitary fusion category,
a chosen site object if using an anyonic-chain backend, and a fidelity target.
For modular input the minimum target is its normalized modular data with
unit-preserving relabelling. For fusion-only input choose a braided target
or instead explicitly request recovery of a defect/soliton category.
A fusion category and its Drinfeld center play different roles: B:384–408
states the center reconstruction problem and recovery of the fusion category
through solitons, rather than identifying the fusion category with that center.

For a requested conformal theory, specify the real central charge lift,
chiral versus full target, character/energy information and admissible
analytic field data. These additional data must themselves be compatible;
an arbitrary list of proposed OPE coefficients is not an existence theorem.
EG:333–335 states that the MTC determines the central charge only modulo eight.
EG:473–480 displays character T with its vacuum phase; convention (u) fixes
`T = exp(-2*pi*i*c/24) Theta` separately from the twist matrix `Theta`.

**Source-local nonuniqueness.** B:374–381 gives the explicit mechanism:
tensoring a realization with a holomorphic net preserves its category.
Thus category input does not single out a conformal realization.
This obstructs *unique reconstruction from the given data*, not the existence
of a choice-making algorithm that selects one allowed output.

**Minimum versus stronger fidelity.** Matching S and T is exactly the minimum
requested here. It is not a proof of equivalence of the realized categories.
MS:122–124 gives braided-inequivalent centers; MS:175–179 proves that members
share the same modular data. Optional categorical fidelity must exhibit a
braided equivalence, not infer one from S,T. Conversely, a chosen ribbon
unitary equivalence is a sufficient route to modular fidelity after aligning
the unit and central-charge phase. The source EG:865–867 provides realizations
at category level, so its conclusions are stronger than the minimum target.

**Output contract.** A successful microscopic output must contain an actual
local system at every scale, Hamiltonian and microscopic stress generators,
refinement/state data, a rigorous continuum theory with the required full
projective unitary symmetry, and a proof identifying its modular data.
Finite-size fusion sectors, central-charge fits, or the mere presence of a
finite MPO algebra do not constitute that output. H:15–35 proves a finite
MPO/defect-algebra isomorphism but conjectures its scaling interpretation;
H:4399–4402 explicitly leaves analytic scaling-limit persistence open.

## Positive continuum constructions that can guide synthesis

**Source-local theorem: twisted finite-group doubles.** For every finite group
and every circle-valued 3-cocycle, EG Theorem 3 (EG:865–867) gives a completely
rational conformal net realizing the corresponding twisted double category.
This is a continuum realization theorem, not a lattice limit theorem.
Its proof gives concrete construction steps (EG:1482–1496):

1. Choose a finite group extension whose inflation kills the relevant third
   cohomology; Proposition 3 supplies existence.
2. Choose characteristic/cochain data producing the desired twist via the
   exact sequence and the source's type-1 extension recipe.
3. Start from a holomorphic conformal net of central charge 24, embed the
   extension group into a permutation group, and take a tensor-power orbifold.
4. Form the specified local extension. EG Theorem 1 identifies the output
   representation category as the desired twisted double.

The source's Theorem 2 (EG:840) controls the permutation anomaly: a seed with
central charge divisible by 24 gives the untwisted double at the orbifold
stage. Ignoring that hypothesis can change the output twist (EG:268).
The group/cochain presentation and extension choices are useful finite input
for a future compiler. A guaranteed effective implementation still needs an
exact encoding and an algorithm producing the finite extension/cochains;
the theorem's existence statement is not a supplied complexity bound.

**Other source-local positive families.** EG:256–260 records pointed UMTC
realizations by even positive-definite lattice VOAs and conformal nets.
B:452–455 realizes even-rank Tambara–Yamagami categories through twisted
representations; B:470–473 realizes odd generalized metaplectic categories
as order-two orbifolds of conformal nets associated with even lattices.
Here “lattice” means the Euclidean lattice defining a conformal net. It does
not assert a microscopic spin chain or its scaling limit.

**Source-local microscopic precedent.** FF:221–253 proves strong convergence
of free-fermion KS approximants on a common finite-energy core to continuum
Virasoro generators; FF:262–312 gives correlation-function results.
These are substantive positive lattice-to-continuum results for the stated
free-fermion construction. They do not, without more work, provide the
holomorphic central-charge-24 seed or the orbifold/extension transport above.

## Two algebraic transport results

**Lemma 1 (equivariant identification preserves fixed points).**
ASSUME unital C*-algebras B,A, finite G, actions beta,alpha, and an
equivariant *-isomorphism Phi:B→A as in convention (v).
PROVE Phi restricts to a *-isomorphism B^G→A^G.

<1>1. Phi(B^G) is contained in A^G.
  <2>1. For b fixed and g in G, alpha_g(Phi(b))=Phi(beta_g(b))=Phi(b).
  <2>2. QED BY <2>1 and the definition of the fixed-point algebra.
<1>2. Every a in A^G has a fixed preimage.
  <2>1. Put b=Phi^{-1}(a), which exists by surjectivity.
  <2>2. Phi(beta_g(b))=alpha_g(a)=a=Phi(b).
  <2>3. beta_g(b)=b BY injectivity, for every g.
  <2>4. QED BY <2>1–<2>3.
<1>3. The restriction preserves multiplication, adjoints and the unit and
is injective BY the corresponding properties of Phi.
<1>4. QED BY <1>1–<1>3.

**Lemma 2 (finite fixed points commute with a strict inductive limit).**
ASSUME a sequence A_N of unital C*-algebras, injective unital *-homomorphisms
between successive scales, and actions of a fixed finite G commuting with
those maps. Let A_infty be the C*-inductive limit with canonical maps i_N.
PROVE the canonical map `lim_N A_N^G → A_infty^G` is a *-isomorphism.

<1>1. The actions induce an isometric action on A_infty.
  <2>1. On the dense union set alpha_g(i_N(a))=i_N(alpha_g(a)).
  <2>2. This is well-defined BY equivariance, isometric BY injectivity,
  and extends by continuity; the group laws hold on the dense union.
  <2>3. QED BY <2>1–<2>2.
<1>2. Finite averaging E=sum_g alpha_g/|G| is a contraction onto A_infty^G.
  <2>1. Its norm is at most one BY the triangle inequality and isometry.
  <2>2. Its image is fixed BY permutation of the group summation index;
  it is the identity on fixed elements.
  <2>3. QED BY <2>1–<2>2.
<1>3. The union of i_N(A_N^G) is dense in A_infty^G.
  <2>1. Given fixed x and epsilon>0 choose i_N(a) within epsilon of x,
  BY density in the C*-inductive limit.
  <2>2. E(i_N(a))=i_N(E_N(a)) lies in i_N(A_N^G), BY equivariance.
  <2>3. Its distance from x is at most ||i_N(a)-x||<epsilon BY <1>2.
  <2>4. QED BY <2>1–<2>3.
<1>4. The canonical map is isometric on the dense union and hence on its
completion, and its range is A_infty^G BY <1>3.
<1>5. QED BY <1>4.

These lemmas are proved locally from the displayed assumptions. They concern
bounded observable algebras. They do not establish convergence of changing
states, weak closures in changing GNS representations, or unbounded stress
operators. Lemma 2 requires exact equivariance and a fixed finite group;
a soft/nonmultiplicative refinement needs a separate theorem.

## A concrete conditional microscopic construction

**Proposal: compile constructions instead of hunting Hamiltonians blindly.**
Maintain a library of genuinely proved microscopic seed realizations and
operations on them. Apply tensor power, finite-group orbifold, and local
extension operations following a selected continuum construction such as EG.
The algebraic orbifold operation at scale N is explicit: retain the invariant
subalgebra of A_N, restrict an invariant state and invariant dynamics, and use
the restricted refinement. A finite matrix implementation computes invariants
by averaging. Lemma 2 proves its strict observable limit is the fixed-point
algebra; Lemma 1 identifies this algebra with a target orbifold whenever the
seed continuum identification is equivariant.
Here the identified object is the target fixed-point C*-algebra. Identifying
the interval algebras, limiting state, and their von Neumann closures is an
additional local-net theorem, not a consequence of the abstract isomorphism.

The branch also propagates conformal data, rather than accepting arbitrary
central-charge input. EG:1492–1496 starts with a holomorphic seed of `c=24`;
its tensor power has `c_out=24k` (EG:849–855), and local extensions preserve
that charge (EG:338–340). A request for a different specified charge is not
satisfied by this recipe even when its category matches. The output charge,
characters, and any supplied OPE constraints require their own compatibility
checks. These are explicit algorithmic inputs/outputs beyond modular data.

The resulting invariant algebra need not be a tensor product of independent
site matrix algebras. A backend demanding ordinary spin sites must implement
that algebra with a proved locality-preserving encoding. No such encoding is
silently supplied by the averaging formula.

Three genuine remaining bridges determine whether this becomes a full machine:

- A microscopic seed converging to the required holomorphic net, with its
  stress operators and permutation actions under control.
- Compatibility of state limits, local von Neumann nets and stress generators
  with orbifolding; Lemma 2 settles only the strict C*-algebra step.
- A local microscopic implementation of the prescribed extension, together
  with convergence identifying the complete orbifold/extension sector theory.

A vacuum-only calculation cannot replace the last item. The conclusion sought
is the modular data of the complete rational net, including its sectors;
EG:263 and :330 identifies orbifold sectors as a twisted double. Projecting a
single untwisted finite-volume Hilbert space is not a proof of that conclusion.

**Functoriality proposal.** First use equivalences preserving all decorations
(convention (u)). They relabel categorical data and transport choices rather
than demand a canonical choice of Hamiltonian. Output objects retain the
construction recipe; composition must preserve refinement, state and symmetry
intertwiners. General tensor functors need their own physical interpretation
and are not automatically maps preserving criticality or modular data.

**Alternative worth developing.** Strange correlators construct partition
functions from string-net tensors; SC:13–27 states the center and MPO content
and explicitly allows criticality or symmetry breaking. SC:81 calls universal
RCFT coverage an expectation. It offers candidates complementary to orbifold
synthesis, but it cannot supply positivity, criticality, OAR convergence or
modular fidelity just by invoking the input fusion category.

The actionable advance is the orbifold compiler branch and its proved strict
fixed-point step. The universal machine remains a research target: neither
these lemmas nor the cited continuum realization theorems prove its existence.
