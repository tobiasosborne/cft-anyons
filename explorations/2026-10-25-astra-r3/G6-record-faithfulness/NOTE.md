# G6 — The information boundary of the interval/dilation record

2026-10-25. Initial checkpoint: 06:00 UTC; session began 05:56 UTC.
**Initial status: open.** This file is saved before exploration is complete;
the ledger will be updated after each proved block.

The task permits writes only in this directory, no commits and no network.
It overrides the usual convention/worklog/report landing workflow. Scoped
notations introduced here will not silently alter CONVENTIONS.md. Existing
(am), (aq), (as) govern pointed sites, layers, and crossings; (ar) is the
Ward-to-KS convention and is not a tower convention.

## Statement and proof obligations

**ASSUME** a unitary fusion category D, a tensor-generating pointed object
eta:1 -> O with eta^dagger eta=1, and one fixed pointed unitary relative
half-braiding H on D, as in CA-90 Definition 90.H. Write W_L=O^tensor L,
A_L=End_D(W_L), with trailing inclusion a -> a tensor 1_O, and let
A_infinity be its norm inductive limit. The named interval algebras are
A_[j,k]=1^(j-1) tensor End_D(W_(k-j+1)) inside that limit, with the fixed
associators. Delta is the endomorphism from F6-C1's fixed-H shuffle.
The record R=(A_infinity,{A_[j,k]},delta) retains no named point,
corner embeddings, rectangular maps h/i/j, or identifications of translated
intervals. An isomorphism preserves every interval label and intertwines delta.

**PROVE or refute:** isomorphism of R forces unitary tensor equivalence of
(D,O,eta,H). A negative answer must give a simultaneous interval/dilation
intertwiner, not just equality of dimension groups or separate diagram
isomorphisms. Determine which missing marks are intrinsic, which require
choices, and the precise effect on the CA-88 fidelity ladder.

The common tags are **any, with ordered open geometry; L0 + fixed pointed
H; R0^u information only**. No continuum or periodic-seam claim is included.

## Proof record

Awaiting the finite relative-commutant calculation and simultaneous
intertwining analysis. F6 (7)--(10) and CA-77 Proposition 77.2 are prior
results, not to be re-proved here.

## Results ledger

- G6-A: relative commutants and recoverable intrinsic data — **open**.
- G6-B: categorical faithfulness or exact counterexample — **open**.
- G6-C: point/corner/concatenation mark inventory — **open**.
- G6-D: exact same-ring/different-associator finite checks — **open**.
- G6-E: consequences for the R0/R4 information boundary — **open**.

## Layer tags

Setting: any, ordered open geometry. Data: L0 + fixed pointed H.
Rung reached: inherited R0^u existence only. Rung claimed: R0 information
boundary; no R1--R5 attainment.

## What this gives the integration

Pending. The intermediate-record question remains open at this checkpoint.

## Open problems

Recover the missing marks up to equivalence, or produce a simultaneous
interval/dilation counterexample. Distinguish literal mark recovery from
equivalence-class reconstruction.

## Examples table

| Instance | Intended use | Status |
|---|---|---|
| F6 E-F, two normalized order-two associators with their supplied H | Exact simultaneous interval/dilation discrimination or intertwining | open |
| F6 E-H, two transports on the same fusion category | Test whether H survives the record | open |

## Sources used

- F6 `explorations/2026-10-25-astra-r3/F6-what-the-tower-remembers/NOTE.md:520-644`: simultaneous square, diagram gauge, marked extraction, and open boundary.
- Same directory `REVIEW.md:195-212`, `INTEGRATION.md:155-173`: precise next lemma and caution against separate conjugacies.
- `report/sections/77_pointed_carrier_invariants.tex:47-86`: richer reconstruction record.
- `report/sections/90_local_unital_lift.tex:60-141`: supplied H and local shuffle.
- `CONVENTIONS.md:1450-1468,1524-1576`: pointed sites, layers, crossings.
- `references/text/PenneysUnitaryFusionCategories.md:219-237,277-288,319-348,394-419`: splitting, graded categories, tensor/dagger coherence, duality.
- `references/manifest/SOURCES.md:34-35,55-57`: local source registration.
