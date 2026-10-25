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

## Proof plan

1. Determine which representation data every F1 transport construction fixes.
2. Test alternate ancillary objects and local pointed identifications
   O tensor K -> O tensor O against those data.
3. Extract the exact finite algebra statement that actually follows from
   alpha and V, keeping locality and half-braiding coherence separate.
4. Search for all-power obstructions, then distinguish them from no-go
   statements for arbitrary local lifts.
5. State finite-b equations and the precise missing termination bound.

## Results ledger

- G1.1 alternative-ancilla local lift theorem — open.
- G1.2 classification up to output unitary gauge — open.
- G1.3 exact algebraic extraction / missing coherence — open.
- G1.4 all-power transport obstruction — open.
- G1.5 fixed-b equations and existence-decision boundary — open.
- G1 original existence converse, without gauge classification — open.
- G1(c) universal local-lift existence versus explicit local-lift no-go — open.

## Layer tags

Setting any; microscopic open chains. Data L0, plus any explicitly supplied
point/transport/local identification. Reached: none yet in this note.
Claimed target: R0^u characterization; no higher rung claimed.

## What this gives the integration

Pending proof. CA-88 bare-L0 R0^u remains open in the initial ledger.

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
