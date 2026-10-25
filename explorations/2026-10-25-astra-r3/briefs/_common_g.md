# Astra round 3 brief — KEY

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

Write ONLY inside `explorations/2026-10-25-astra-r3/KEY/` (`NOTE.md` plus
optional `checks/` with scripts and raw output). No edits elsewhere, no
commits, no Julia test suite, small SymPy/NumPy checks are fine (laptop
budget: seconds to a few minutes each), no network. End `NOTE.md` with:
"Results ledger" (one line per statement with status: proven / conditional /
conjectural / negative), "Layer tags" (setting, data layer, rung reached,
rung claimed), "What this gives the integration" (which CA-88 cell moves and
which does not), "Open problems", "Examples table" (instances only), "Sources
used" (path:line). A sceptical reviewer will try to refute every step.

## Your conjecture
