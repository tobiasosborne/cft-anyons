# Astra round 3 brief — G2-coarse-vector-zero-mode

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

Write ONLY inside `explorations/2026-10-25-astra-r3/G2-coarse-vector-zero-mode/` (`NOTE.md` plus
optional `checks/` with scripts and raw output). No edits elsewhere, no
commits, no Julia test suite, small SymPy/NumPy checks are fine (laptop
budget: seconds to a few minutes each), no network. End `NOTE.md` with:
"Results ledger" (one line per statement with status: proven / conditional /
conjectural / negative), "Layer tags" (setting, data layer, rung reached,
rung claimed), "What this gives the integration" (which CA-88 cell moves and
which does not), "Open problems", "Examples table" (instances only), "Sources
used" (path:line). A sceptical reviewer will try to refute every step.

## Your conjecture
### G2. The fixed-coarse-vector KS zero-mode lemma: automatic zero-mode commutation, or a genuine tower refuting it

Background (round 3, this morning): F2 (explorations/2026-10-25-astra-r3/
F2-zero-mode-and-lattice-chirality/, NOTE.md, REVIEW.md grade
WEAKER-RESULT-PROVED, INTEGRATION.md) proved, category-free in the periodic
(full) setting on a nonzero common tower with standard nearest-neighbour KS
modes and both VR-1 certificates: c*_L = c*_R without parity or current
conservation (F2-Cubic); finite (s,2) zero-mode certificate ZC, the limiting
equation X_0 = [L_0, S_0] = 0 and vanishing of all limiting mixed brackets
are equivalent, and then c_L = c_R (F2-G, F2-B); exact total-current
conservation supplies X_0 = 0 (F2-B0); automatic identification of the
current with a spectral logarithm of the translation fails for every branch
(F2-N, negative). The original zero-mode lemma F2(a), that ZC holds
AUTOMATICALLY under 91.1's hypotheses with a translation U_r covariant for
both families and [U_r, K_r] = 0, is neither proved nor refuted. The
reviewer's single next lemma (F2 INTEGRATION.md, section (e)) is its
fixed-coarse-vector form. Read F2's NOTE.md (esp. :63-100 F2-G, :149-277
F2-B/B0, :279-354 F2-Cubic, the F2-N construction and F2-Aalg), REVIEW.md,
INTEGRATION.md (a) and (e), CA-91 whole (91:233-237 is the target), CA-89,
CA-81 (VR-1 A1-A4), CONVENTIONS (ap), (as). KS source:
references/lattice-symmetry/GransSamuelssonEtAl2020/source/Linnea11.5.tex:791-822.

**Conjecture G2 (setting: periodic / full; category-free, L0 for the finite
categorical data; rung R2 conditional, claimed: ZC is automatic).** Assume
the original F2(a) system: standard nearest-neighbour KS modes on one
nonzero common A1-A4 tower, a complex-linear parity, translated densities,
both Fourier covariance laws, and [U_r, K_r] = 0. Put Hcal_r = sum_j k_{r,j},
Qcal_r the total current, and J_{r<-a} the ordered refinement from a fixed
coarse scale a. Then for every v in the finite coarse carrier H_a
    || (N_r^2 / 8 pi^2) [Hcal_r, Qcal_r] J_{r<-a} v || -> 0.
Consequences (already proved in F2, cite, do not re-derive): mixed-word
convergence identifies the limit with [L_0, S_0] i_a v; coarse-vector graph
density and A2 extend zero to the core; F2-G gives uniform finite (s,2) ZC
for every s and F2-B gives all mixed brackets and c_L = c_R. So this lemma
alone closes F2(a) and CA-91's part (b).
Prove it using positive-Hilbert / microscopic structure: the commutator of
the total energy with the total current is a sum of LOCAL three-site terms
(the discrete continuity defect), so the claim is that the transported
coarse vectors see this defect at order o(N^-2); exploit A1 (locality of the
refinement), A3 (the differentiated matching), translation covariance and
positivity (K_r >= 1, the spectral gap structure of the covariant tower) to
bound it. Do not assume current conservation or current-momentum
identification (either replaces the open problem by the proved sufficient
condition F2-B0), and do not use a branch-selection argument (ruled out by
F2-N). If the lemma is false, construct a GENUINE tower (any C, Vec is fine
as an instance; finite site dimension, finite range, both VR-1 certificates
satisfied, verified not merely asserted) with a nonzero limiting commutator
on some transported coarse vector; that refutes automatic ZC and the
original F2(a), and you must then state the sharpest additional hypothesis
(a conserved current, a specific control, a gap) that restores it. A finite
check in `checks/` on a small translation-covariant chain (free fermion or
a 3-state chain) measuring the rescaled commutator on transported coarse
vectors against N is expected. Say which CA-88 cell moves: CA-91's
"R2 [cond.]" to "R2 [cond. on both certificates only]" or to a counterexample
row.
