# Astra round 3 brief — F1-dyadic-lift-characterisation

You are a research mathematician working in the repository at the current
directory (`/home/tobias/Projects/cft-anyons`). Read `AGENTS.md` first, whole.
Two rules bind with special force: **Rule 16** (no model hyperfixation: work
for a general unitary fusion / modular category C; a specific category appears
only in a small check or in the examples table at the end) and **Rule 17**
(layer by data: your statement names its chirality setting (open/chiral,
periodic/full, any), its input-data layer L0 fusion / L1 braided / L2 modular /
L3 enriched / L4 declared target, and the rung it reaches: R0 tower exists /
R1 limit state / R2 Virasoro or extended modes / R3 local conformal theory /
R4 faithful to a declared (C,E) / R5 functorial). The grid is CA-88
(`report/sections/88_layered_targets.tex`); CONVENTIONS (aq) defines the tags.

## What this round is

Round 2 (2026-10-22) proved, refuted or weakened six conjectures; the results
are shards CA-89..CA-94 and each shard ends with ONE named next target. This
round gives you one such target, sharpened into the most ambitious statement
that is plausibly true, and asks for a **rigorous proof**. Tobias's words:
"the most ambitious conjecture that is plausibly true, and a rigorous proof."

Your deliverable is a proof in Lamport structured form (ASSUME / PROVE,
numbered steps <1>1, <2>1, ..., each step justified BY a cited source, a
previous step, or a displayed computation). If the conjecture is false, give
the counterexample explicitly, then prove the strongest true version you can
and say exactly which hypothesis separates them. If you can prove only part,
mark precisely which steps are proved and which are conditional, and list the
remaining obstacles as sharp lemmas. Never label a sketch as a proof.

Read before writing: the round-2 shard named below (`report/sections/`), its
NOTE.md / REVIEW.md / INTEGRATION.md under `explorations/2026-10-22-astra-r2/`,
and the local sources they cite (cite by path:line; never from memory; if a
needed source is not local, say so and record the gap; `references/` and
`literature/md/` are the ground truth; grep them). Do not re-derive what
CA-76..CA-94 already establish; cite them by number. `CONVENTIONS.md`
entries (a)-(aw) fix notation; (ak) is the tile dictionary, (aq) the layer
tags, (ar)-(aw) the round-2 notation; use them.

## Time budget (binding)

You have about 70 minutes of wall clock. Within the first 10 minutes write
`NOTE.md` with the statement, the layer tags, and a skeleton ledger with every
status "open"; then update `NOTE.md` after each proved step. An honest partial
`NOTE.md` is worth far more than a complete one that never gets written. Stop
exploring and finish the ledger when about 60 minutes have passed.

## Rules of engagement

Write ONLY inside `explorations/2026-10-25-astra-r3/F1-dyadic-lift-characterisation/` (`NOTE.md` plus
optional `checks/` with scripts and raw output). No edits elsewhere, no
commits, no Julia test suite, small SymPy/NumPy checks are fine (laptop
budget: seconds to a few minutes each), no network. End `NOTE.md` with:
"Results ledger" (one line per statement with status: proven / conditional /
conjectural / negative), "Layer tags" (setting, data layer, rung reached,
rung claimed), "What this gives the integration" (which CA-88 cell moves and
which does not), "Open problems", "Examples table" (instances only), "Sources
used" (path:line). A sceptical reviewer will try to refute every step.

## Your conjecture
### F1. Local unital dyadic lifts at bare L0 are characterised by K-theoretic centrality (Target 90.T)

Background: CA-90 (report/sections/90_local_unital_lift.tex) proves that for
a unitary fusion C with a relative half-braiding t on <O> the map alpha_L(a) =
B_L(a (x) 1) B_L^dagger is a local unital injective *-lift of dyadic vacuum
insertion with slack r = 0 (Theorem 90.1), and that a ONE-GAP lift with that
support pattern cannot exist when [O] is not central in the fusion ring
K(<O>) (Proposition 90.2(b), Bratteli argument). Target 90.T (90:245-250) asks
whether the obstruction survives slack r for ALL local dyadic lifts, or whether
Vec_S3 with O = 1 (+) g (+) h admits a local dyadic lift after all. Read CA-90
whole, the E1 directory (NOTE.md, REVIEW.md:12-19 and the R-1 sharpening,
INTEGRATION.md:85-91), CA-76 Propositions 76.1-76.4, CA-77 (carrier), and
CONVENTIONS (ar). Sources: Penneys' unitary dual functors notes as cited in
CA-90/92; Bratteli diagrams / AF inclusion matrices (grep references/ and
literature/md; record the gap if absent).

**Conjecture F1 (setting: any; data layer L0 fusion; rung R0^u, claimed
characterisation).** Let C be unitary fusion, O any object, D = <O> the fusion
subcategory it generates, A_L = End_C(O^{(x)L}), V_L the dyadic vacuum
insertion isometry (CONVENTIONS (ar)). Then the following are equivalent:
 (a) there exist unital injective *-homomorphisms alpha_L: A_L -> A_{2L} with
     alpha_L(a) V_L = V_L a and alpha_L(A_[j,k]) subset A_[2j-1-r, 2k-1+r]
     for one fixed slack r and all L (a local dyadic lift);
 (b) [O] is central in the fusion ring K(D), i.e. [O][x] = [x][O] for every
     simple x of D;
 (c) O carries a relative half-braiding with respect to D compatible with the
     unitary structure (so O lifts to the relative centre Z_D(C) restricted
     to D), and then alpha_L may be taken with r = 0 (CA-90).
Prove (a) => (b) rigorously: block r sites at every cut, track the inclusion
matrices of the left and right partial lifts, and show the Bratteli argument
of 90.2(b) forces centrality for any finite slack. Then decide (b) => (c) or
(b) => (a): either construct a local lift from K-theoretic centrality alone,
or exhibit a unitary fusion category and O with [O] central in K(<O>) but
with no half-braiding and no local dyadic lift (then (b) is necessary but not
sufficient and you must state the correct sufficient condition). Vec_S3 with
O = 1 (+) g (+) h (gh != hg) and pointed Vec_G^omega with a nontrivial
3-cocycle are the decisive instances; a small finite search in `checks/` is
welcome. State where the associator equations (90.5) enter, and prove
naturality of whichever construction you give under unitary tensor
equivalences. Say explicitly which cell of CA-88 moves: R0^u at bare L0 is
either settled by a characterisation or shown to need L1 data.
