# Astra round 3 brief — G1-transport-extraction

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

You have about 45 minutes of wall clock. Within the first 10 minutes write
`NOTE.md` with the statement, the layer tags, and a skeleton ledger with every
status "open"; then update `NOTE.md` after each proved step. An honest partial
`NOTE.md` is worth far more than a complete one that never gets written. Stop
exploring and finish the ledger when about 40 minutes have passed.

## Rules of engagement

Write ONLY inside `explorations/2026-10-25-astra-r3/G1-transport-extraction/` (`NOTE.md` plus
optional `checks/` with scripts and raw output). No edits elsewhere, no
commits, no Julia test suite, small SymPy/NumPy checks are fine (laptop
budget: seconds to a few minutes each), no network. End `NOTE.md` with:
"Results ledger" (one line per statement with status: proven / conditional /
conjectural / negative), "Layer tags" (setting, data layer, rung reached,
rung claimed), "What this gives the integration" (which CA-88 cell moves and
which does not), "Open problems", "Examples table" (instances only), "Sources
used" (path:line). A sceptical reviewer will try to refute every step.

## Your conjecture
### G1. Finite-power transport extraction: every local dyadic lift comes from a blocked half-braiding

Background (round 3, this morning): F1 (explorations/2026-10-25-astra-r3/
F1-dyadic-lift-characterisation/, NOTE.md, REVIEW.md grade COUNTEREXAMPLE,
INTEGRATION.md, and the draft shard report/sections/96_blocked_dyadic_lifts.tex)
refuted the conjecture that local dyadic unital lifts need [O] central in
K(<O>): a pointed unitary relative half-braiding of a TENSOR POWER (O^b,
eta^b) on D = <O> gives unital injective *-lifts alpha_L: A_L -> A_{2L} on
the unchanged algebras with alpha_L(a) V_L = V_L a and interval slack
r = 2b - 1 (F1.1b, derived), and for every finite nonabelian G and noncentral
g of order b the site O = R (+) g (R the regular object) is noncentral yet
O^b = 1 (+) K R carries explicit pointed transport (F1.2, derived). CA-90
(report/sections/90_local_unital_lift.tex) is the b = 1 case. The reviewer's
single next lemma (F1 INTEGRATION.md:145-155) is the converse. Read F1's
NOTE.md F1.1a-F1.6, REVIEW.md, INTEGRATION.md (a) and (e), the draft CA-96
shard, CA-90 whole (esp. 90.2's Bratteli argument and 90.5), CA-76 Prop.
76.1-76.4, CONVENTIONS (ar) and the proposed (ax)-(az) in
F1-dyadic-lift-characterisation/SHARD_META.md. Sources: Penneys' notes as
cited in CA-90; grep references/ and literature/md for "half-braiding",
"relative centre", "Bratteli"; record gaps.

**Conjecture G1 (setting: any (open chain); data layer L0 fusion; rung R0^u,
claimed: the characterisation of local dyadic unital lifts).** Let C be
unitary fusion, (O, eta) pointed, D = <O> full, A_L = End_C(O^{(x)L}), V_L
the dyadic vacuum insertion. Suppose for every L there is a unital injective
*-homomorphism alpha_L: A_L -> A_{2L} with alpha_L(a) V_L = V_L a and
alpha_L(A_[j,k]) subset A_[2j-1-r, 2k-1+r] for ONE finite r and all L, with
no unchanged-side, occupation-grading or translation hypothesis. Then:
 (a) there is b >= 1 (b <= r + 1 expected) and a pointed unitary relative
     half-braiding t of (O^b, eta^b) on D such that the F1.1b construction
     from t reproduces alpha_L up to conjugation by a locally supported
     unitary cocycle (so every local dyadic lift is a blocked transport lift
     up to local gauge);
 (b) consequently R0^u at bare L0 holds iff some tensor power of O carries
     pointed transport on <O>, a condition decidable from (D, O) by a finite
     associator computation (the H1-H2 equations of F1.4 generalised beyond
     the pointed abelian case), and the minimal such b is an invariant of
     (D, O);
 (c) an explicit (D, O) with NO tensor power carrying pointed transport, so
     that no local dyadic unital lift exists at all (the first genuine
     bare-L0 R0^u no-go), or a proof that pointed transport always exists on
     some power (then R0^u is universal at L0).
Prove (a) by extracting the transport from the lift: restrict alpha_L to the
cut, use the intertwining with V_L and the slack bound to build a unitary
Y (x) O^b -> O^b (x) Y for every Y in D and verify the unit, naturality,
tensor and point axioms (H) of F1; mark precisely the step where the
Bratteli / inclusion-matrix data of 90.2(b) enters and where it does not. If
(a) fails, give the counterexample lift explicitly (an algebra lift beyond
finite-power transport) and the strongest true extraction statement.
Decide (c) with a finite search in `checks/` over small Vec_G^omega and
Tambara-Yamagami / Haagerup-type fusion data if available locally
(instances only). Say which CA-88 cell moves: R0^u at bare L0 from "open
(Target 90.T, superseded by CA-96)" to "characterised" or to "universal" or
to "obstructed for an explicit (D, O)".
