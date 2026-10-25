# Astra round 3 brief — F4-ward-to-residual

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

Write ONLY inside `explorations/2026-10-25-astra-r3/F4-ward-to-residual/` (`NOTE.md` plus
optional `checks/` with scripts and raw output). No edits elsewhere, no
commits, no Julia test suite, small SymPy/NumPy checks are fine (laptop
budget: seconds to a few minutes each), no network. End `NOTE.md` with:
"Results ledger" (one line per statement with status: proven / conditional /
conjectural / negative), "Layer tags" (setting, data layer, rung reached,
rung claimed), "What this gives the integration" (which CA-88 cell moves and
which does not), "Open problems", "Examples table" (instances only), "Sources
used" (path:line). A sceptical reviewer will try to refute every step.

## Your conjecture
### F4. The probe-word Ward-to-residual lemma (Lemma 89.L) and its free-fermion test

Background: CA-89 (report/sections/89_ward_ks_transfer.tex) proves, category-
free, in the periodic (full) setting: transfer from geometric modes (A2/A4),
A3 from differentiated coordinate-resolved matching, and the contact cocycle
c* = 12 kappa_3, c = 24 b - 12 kappa_1 (Theorem 89.1), conditional on an
operator lift W2 of D2's discrete contour identity; the "A3 for any gate-
intertwining refinement" clause is false when c* != 0 (Proposition 89.7) and
the control K = 1 + (H - E_0)/v violates A2 (89.3). The named next target is
Lemma 89.L (89:225-231): ASSUME D2's contour identity (19) holds with
residuals R_n(f, y, A) for every probe word A in a family whose reflected
boundary vectors are dense in each graph space, and the residuals and collar
insertions obey the one-sided two-loss bound of D2-L10 (Lemma 78.11) with
constants tending to zero; PROVE W2: |[S_m, S_n] - beta_N S_{m+n} -
z^{(r)}_{mn}|_{s,2} -> 0. All probe words are needed: vacuum-null is not
operator-null (VR-2). First test: the in-repo free-fermion benchmark
(cft_machine/benchmarks/fermion/) with the conformal control K = 1 + E_N at
the laptop budget. Read CA-89 whole, CA-78 (Lemmas 78.9-78.11, the contour
identity), CA-79 (Theorem 79.2, P0-P3), CA-81 (VR-1, VR-2), the E4 directory
(NOTE.md, REVIEW.md:8 and :226-228, INTEGRATION.md:79-136), the D2 round-1
directory (explorations/2026-10-22-astra/D2-*/, NOTE.md identity (19), L9-L10
at :549-594), CONVENTIONS (ap), (ar), and cft_machine/research/virasoro_routes
(:179-192 for VR-2).

**Conjecture F4 (setting: periodic / full; category-free; rung -> R2, claimed
W2 and hence VR-1 A4 for the standard KS modes).**
 (a) Lemma 89.L holds as stated: the probe-word contour identity with
     vanishing two-loss constants implies W2 in every (s,2) norm, with the
     central term z^{(r)}_{mn} identified as the contact cocycle of 89.1(iii)
     and no additional hypothesis on the state beyond the graph-space density
     of reflected boundary vectors.
 (b) Converse direction: W2 for the standard KS modes implies the contour
     identity for the probe-word family with two-loss constants tending to
     zero, so the discrete Ward identity and VR-1 A4 are EQUIVALENT given A2
     for an admissible control (sharpening 89.1 from a transfer to an
     equivalence).
 (c) Free-fermion instance: on cft_machine/benchmarks/fermion/ with K = 1 +
     E_N, the hypotheses of (a) hold with explicit constants, and the
     resulting c* and c agree with the sourced values; run the check in
     `checks/` at the laptop budget (N at most the sizes already used in that
     benchmark) and report the measured decay of the two-loss constants.
Prove (a) rigorously; prove or refute (b) (if false, give the obstruction
and the strongest one-sided statement); do (c) as a reproducible check with
raw output. Note that nothing in (a)-(b) is about C: say so, and say what
the first categorical input to a Ward identity would be (which tile
components of h in CONVENTIONS (ak) enter the contour identity). Which CA-88
cell moves: the R2 certificate column for CA-89 from "transfer [cond.]" to
"W2 proved [cond. on contour identity]" or not.
