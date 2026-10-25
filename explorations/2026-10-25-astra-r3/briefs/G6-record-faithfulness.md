# Astra round 3 brief — G6-record-faithfulness

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

Write ONLY inside `explorations/2026-10-25-astra-r3/G6-record-faithfulness/` (`NOTE.md` plus
optional `checks/` with scripts and raw output). No edits elsewhere, no
commits, no Julia test suite, small SymPy/NumPy checks are fine (laptop
budget: seconds to a few minutes each), no network. End `NOTE.md` with:
"Results ledger" (one line per statement with status: proven / conditional /
conjectural / negative), "Layer tags" (setting, data layer, rung reached,
rung claimed), "What this gives the integration" (which CA-88 cell moves and
which does not), "Open problems", "Examples table" (instances only), "Sources
used" (path:line). A sceptical reviewer will try to refute every step.

## Your conjecture
### G6. The intermediate-record faithfulness lemma: where the R0 information boundary lies

Background (round 3, this morning): F6 (explorations/2026-10-25-astra-r3/
F6-what-the-tower-remembers/, NOTE.md, REVIEW.md grade WEAKER-RESULT-PROVED,
INTEGRATION.md; draft shard report/sections/97_what_the_tower_remembers.tex
if present) proved that the trailing inductive-limit algebra A_infinity(C, O)
of End_C(O^{(x)L}) along a -> a (x) 1_O is a unital AF algebra whose scaled
ordered K_0 is the rooted supported limit along N[y,x] = dim Hom(y, x (x) O)
(F6-A, F6-A', F6-B2, derived), that this invariant can lose even the fusion
ring (F6-N1: an invertible generating site gives Z[1/q], not Z^q) and that
inequivalent associators give identical trailing towers (F6-N2), while the
MARKED record (A_infinity with named interval algebras, the dyadic
refinement delta, the point/corner/concatenation marks) recovers the pointed
half-braiding H exactly (F6-C3, equation (10), derived). The reviewer's single
next lemma (F6 INTEGRATION.md:155-173) is the intermediate case. Read F6's
NOTE.md whole (esp. equations (7)-(10), F6-C1-C3, F6-D), REVIEW.md,
INTEGRATION.md, CA-77 (the reconstruction record), CA-90 Theorem 90.1, CA-93
Lemma 93.2, CA-80 Prop. 80.8, CONVENTIONS (ar). Sources: Bratteli / Elliott
material as located by F6 (NOTE.md "Sources used"); grep references/ and
literature/md for "interval algebra", "quasi-local", "Elliott", "dimension
group"; record gaps.

**Conjecture G6 (setting: any (open); data layer L0 + a fixed pointed
transport H; rung R0, claimed: the exact information content of the
interval-filtered dilation record).** For pointed tensor-generating input
(D, O, eta, H) let the intermediate record be R = (A_infinity, {A_[j,k]}_{1
<= j <= k}, delta): the AF algebra, its named interval subalgebras, and the
dyadic refinement endomorphism delta induced by the H-lift of CA-90/F6-C1,
with NO point, corner, h/i/j or concatenation marks. A record isomorphism
carries each named interval algebra onto its counterpart and intertwines
delta. Then:
 (a) Positive form: a record isomorphism R ~ R' forces a unitary tensor
     equivalence (D, O, eta, H) ~ (D', O', eta', H') of the pointed
     transported inputs; i.e. the interval filtration plus delta already
     determine the marks needed by F6's equation (10), so F and H are
     recovered up to equivalence from locality and refinement alone, and the
     information boundary of R0 lies between the unmarked AF algebra (fusion
     data only, partially) and the interval-filtered dilation record (full
     categorical data).
 (b) Or the negative form: an explicit pair of inequivalent pointed inputs
     with isomorphic intermediate records, with the simultaneous interval
     AND dilation intertwining verified exactly (not only the AF
     isomorphism of F6-N2, not only delta_* = id on K_0), locating the
     boundary strictly above the intermediate record.
 (c) In either case: the precise list of marks (point, corner, concatenation)
     that are recovered from R and the ones that are genuinely extra, and
     the consequence for the fidelity ladder of CA-88: what a state-free R0
     tower can at most certify about C before any R1 state or R4 sector
     data enters.
Prove (a) or (b) rigorously; F6's equations (9) and (10) are the two tools and
neither alone decides it (INTEGRATION.md:169-171). Use the interval algebras'
relative commutants and the way delta moves cut positions to try to
reconstruct the corner marks; if that fails, say exactly which commutant
computation is insufficient and build the counterexample from it. Finite
checks in `checks/` on two same-ring, different-associator pointed instances
(F6's own examples) with the interval and dilation intertwining verified
exactly are expected. Say which CA-88 cell moves: the new R0 row of the
fidelity ladder gets its boundary pinned, or not.
