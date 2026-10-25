# Astra round 3 brief — F2-zero-mode-and-lattice-chirality

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

Write ONLY inside `explorations/2026-10-25-astra-r3/F2-zero-mode-and-lattice-chirality/` (`NOTE.md` plus
optional `checks/` with scripts and raw output). No edits elsewhere, no
commits, no Julia test suite, small SymPy/NumPy checks are fine (laptop
budget: seconds to a few minutes each), no network. End `NOTE.md` with:
"Results ledger" (one line per statement with status: proven / conditional /
conjectural / negative), "Layer tags" (setting, data layer, rung reached,
rung claimed), "What this gives the integration" (which CA-88 cell moves and
which does not), "Open problems", "Examples table" (instances only), "Sources
used" (path:line). A sceptical reviewer will try to refute every step.

## Your conjecture
### F2. The zero-mode lemma, and lattice chirality without a parity hypothesis

Background: CA-91 (report/sections/91_parity_and_chiral_delineation.tex)
proves, category-free, in the periodic (full) setting with both standard KS
families VR-1-certified on one system: a complex-linear unitary parity
commuting with the control forces c_L = c_R and c*_L = c*_R (Theorem 91.1);
with equal ledgers all mixed brackets vanish iff [T_0, Tbar_0] = 0 (91.5),
which is certified by N^2 [H, Q_tot] -> 0 for the total energy current Q_tot
(the zero-mode condition ZC). The named next target (91:233-237) is the
zero-mode (current-momentum) lemma: under 91.1's hypotheses with U_r
covariant for both families and [U_r, K_r] = 0, prove
||(N_r^2 / 8 pi^2) [sum_j k_j, Q_r]||_(s,2) -> 0 for every s via a spectral
logarithm p_r of U_r; OR exhibit a nearest-neighbour chain (any C, even Vec)
with both VR-1 certificates and [T_0, Tbar_0] != 0 in the limit. Read CA-91
whole, CA-89, CA-81 (VR-1), the E2 directory (NOTE.md:305-349, :794-817;
REVIEW.md:89-101, :179-187, :214-252; INTEGRATION.md:125-131), CONVENTIONS
(ap), (as). KS sources: references/lattice-symmetry/GransSamuelssonEtAl2020/
source/Linnea11.5.tex:791-822 and the Koo-Saleur / Zini-Wang files under
references/lattice-symmetry/.

**Conjecture F2 (setting: periodic / full; category-free, then L0 for the
finite ingredients; rung R2 conditional, claimed delineation of chirality).**
 (a) Zero-mode lemma: under the hypotheses of Theorem 91.1 with a translation
     U_r covariant for both KS families and [U_r, K_r] = 0, the rescaled
     commutator of the total momentum with the total energy current vanishes
     in the (s,2) norms, so ZC holds and all mixed brackets vanish (91.5).
 (b) Parity-free ledger balance: the parity hypothesis of Theorem 91.1 is
     removable. For any translation-covariant local periodic tower with both
     standard KS families VR-1-certified on one GNS system and conserved
     total energy current, c_L = c_R and c*_L = c*_R follow from locality,
     translation covariance and the two certificates alone; equivalently, a
     1+1-dimensional local lattice tower (finite-dimensional site space,
     finite-range density) cannot have a chiral limit with c_L != c_R.
 (c) The obstruction in (b) is sharp: dropping finite range (a quasi-local,
     non-summable density) or finite site dimension admits c_L != c_R, and
     you give the mechanism.
Prove (a) rigorously. For (b), either prove it or exhibit the counterexample
chain demanded by 91:235-237, stating exactly which hypothesis (parity,
finite range, finite site dimension, current conservation) separates the
cases. The literature folklore that a lattice system cannot carry a net
chiral central charge is NOT a local source unless you find it under
references/ or literature/md (grep for "chiral central charge", "gravitational
anomaly", "thermal Hall", "Kitaev", "Kapustin"); if absent, record the gap and
prove what you can from the KS/VR-1 definitions alone. For (c), be explicit
about what breaks. Tag every statement with (S; L; R); say which CA-88 cell
moves and whether the S_ch source gap of Definition 88.1 is closed, narrowed,
or untouched.
