# Astra round 2 brief — E4-ward-to-ks-transfer

You are a research mathematician working in the repository at the current
directory (`/home/tobias/Projects/cft-anyons`). Read `AGENTS.md` first, whole.
Two rules bind with special force: **Rule 16** (no model hyperfixation: work
for a general unitary fusion / modular category C; a specific category appears
only in a small check or in the examples table at the end) and **Rule 17**
(layer by data: your statement names its chirality setting, its input-data
layer L0 fusion / L1 braided / L2 modular / L3 enriched / L4 declared target,
and the rung it reaches: R0 tower exists / R1 limit state / R2 Virasoro or
extended modes / R3 local conformal theory / R4 faithful to a declared (C,E) /
R5 functorial).

## What this round is

Round 1 (2026-10-22, six explorers, six adversarial Opus reviews, now lifted
into report shards CA-76..CA-80 and the integration map CA-75) produced
headline conjectures that were all too large: each swallowed an open problem
or was category-blind. The reviewers identified, in each case, the **real
target**: a sharper statement that is plausibly true and attackable. This
round gives you ONE such statement, formulated as a conjecture, and asks for a
**rigorous proof**. Tobias's words: "the most ambitious conjecture that is
plausibly true, and a rigorous proof."

Your deliverable is a proof, in Lamport structured form (ASSUME / PROVE,
numbered steps <1>1, <2>1, ..., each step justified BY a cited source, a
previous step, or a displayed computation). If you find the conjecture false,
give the counterexample explicitly, then prove the strongest true version you
can and say exactly what hypothesis separates them. If you can prove only part,
mark precisely which steps are proved and which are conditional, and list the
remaining obstacles as sharp lemmas. Never label a sketch as a proof.

Read before writing: the round-1 note, REVIEW.md and INTEGRATION.md of the
direction named below (under `explorations/2026-10-22-astra/`), the report
shard(s) named below (`report/sections/`), and the local sources they cite
(cite by path:line; never from memory; if a needed source is not local, say so
and record the gap). Do not re-derive what CA-76..CA-80 already establish;
cite it. `CONVENTIONS.md` entries (a)-(ap) fix notation; (ak) is the tile
dictionary, (al)-(ap) are the 2026-10-22 entries; use them.

Rules of engagement: write ONLY inside `explorations/2026-10-22-astra-r2/E4-ward-to-ks-transfer/`
(`NOTE.md` plus optional `checks/` with scripts and raw output). No edits
elsewhere, no commits, no Julia test suite, small SymPy/NumPy checks are fine,
no network. End `NOTE.md` with: "Results ledger" (one line per statement with
status: proven / conditional / conjectural / negative), "Layer tags" (setting,
data layer, rung), "What this gives the integration", "Open problems",
"Examples table", "Sources used" (path:line). A sceptical Opus reviewer will
try to refute every step.

## Your conjecture
### E4. The Ward-to-Koo-Saleur transfer lemma

Background: the D2 reviewer identified, as the attackable core of D2-C, a
"Ward-to-KS transfer lemma": conditions C1 (regular local imaginary-time gates
with metric derivative equal to the density plus a continuity current) and C3
(local Ward equations for the metric derivative including contact terms) plus
the discrete contour identity imply VR-1's A3/A4 for the standard KS modes
(explorations/2026-10-22-astra/D2-selection-principle/REVIEW.md, headline
verdict; NOTE.md section 6 and eq. (13), (19)). CA-78 records C1-C6 and the
interfaces D2-L8 (drift) and D2-L10 (collar-to-graph-norm). CA-79 gives the KS
tile modes and the shell certificate D4-P (P0-P3 => A1-A4), and the exact
refinement defect D4-R/D4-V. VR-1 is in cft_machine/research/virasoro_routes.md.
reconstruction/01_cells.md gives the continuum Ward identities and their
propagation law W_(Z2 Z1) = W2 Z1 + Z2 W1.

**Conjecture E4 (setting: periodic chain, full target; data layer L0; rung
R2).** Let (C, O, h) be a categorical chain with a geometric stress certificate
in the sense of CA-78's C1 and C3 only (no C2, C4-C6 assumed), i.e. the
Trotter gate's metric derivative is the density h minus a continuity current
with residual r_N summable in the graph norm of K_N = 1 + (H_N - E_0)/v, and
the discrete Ward equations hold with contact terms whose coefficients
converge. Then the standard KS modes satisfy VR-1 A4 (the commutator residual
R_{N,m,n} -> 0 in graph norm on the regularity scale) with the central term
z_{mn} determined by the Ward contact coefficients, AND satisfy A3 (summable
transport defects) for any refinement J_N that intertwines the gates up to a
summable error. In particular the central charge of the limit is the Ward
contact coefficient, not an input.
Prove it. The expected route: write [T_{N,m}, T_{N,n}] via the discrete
contour identity (D2 eq. (19)) as a Ward residual plus contact terms, bound
the residual by r_N through the gate derivative identity, and identify the
contact terms with (m-n)T_{m+n} + z_{mn}. Make every bound uniform in N on
the regularity scale and say which step needs A2 (graph-norm bounds), which
is NOT assumed here; if A2 is unavoidable, prove the lemma conditional on A2
and show exactly where. Give the explicit formula for z_{mn} in terms of the
contact coefficients, and prove it has the Virasoro form (m^3 c* - m c)/12.
