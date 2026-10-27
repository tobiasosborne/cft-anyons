# Astra round 4 brief — H5-coarse-vector-zero-mode

You are a research mathematician working in the repository at the current
directory (`/home/tobias/Projects/cft-anyons`). Read `AGENTS.md` first, whole.
Four rules bind with special force. **Rule 16** (no model hyperfixation) and
**Tobias's generality rule (2026-10-27): results are formulated in
generality, for an arbitrary unitary fusion (or, where declared, braided /
modular) category C with a pointed site object, and are only *checked* in
examples; the examples must never, under any circumstances, become the goal.**
A specific category (Fibonacci, Ising, semion, Vec_G, Temperley-Lieb type)
appears only in a small check in `checks/` or in the examples table at the
end of your note; a statement that is true only for one model, or exploits an
accident of one model, is a calibration datum, not a result. **Rule 17**
(layer by data): every statement names its setting (open/chiral, periodic/full,
any), its input-data layer (L0 fusion / L1 braided / L2 modular / L3 enriched /
L4 declared target) plus every microscopic declaration it uses, and the rung it
reaches (R0 tower exists, R0^u unital / R1 limit state / R2 Virasoro modes /
R3 local conformal theory / R4 faithful / R5 functorial). **Rule 18** (pillars
first): the brief below names the pillar(s) of the programme it serves; keep
the work on that pillar.

## What this round is

Round 4 follows the status overview of 2026-10-27 (`worklog/023_*.md`, read
its sections 0, 1 and 4) and Tobias's four-pillars ruling (AGENTS.md,
north-star paragraph "The four pillars", Rule 18): (P1) the indefinite-
particle-number anyonic Hilbert space is the only possible approach to a CFT
from lattice + MTC; (P2) the Gibbs state of the lattice model is a sum over
C-evaluated spacetime worldline diagrams (Levin-Wen analogy), and conformal
invariance of the continuum is conformal invariance of that random-curve
ensemble (SLE/CLE-type argumentation); (P3) a local system of equations for
discrete conformal invariance, up to cohomology; (P4) the continuum limit via
operator-algebraic renormalisation (OAR). Boundary conditions are module
categories over C; PBC versus OBC is a boundary-data choice, never a research
question: do not spend time on it. Each brief poses the most ambitious
statement that is plausibly true on one pillar gap and asks for a **rigorous
proof** (Tobias: "the most ambitious conjecture that is plausibly true, and a
rigorous proof").

Your deliverable is a proof in Lamport structured form (ASSUME / PROVE,
numbered steps <1>1, <2>1, ..., each step justified BY a cited source, a
previous step, or a displayed computation). If the conjecture is false, give
the counterexample explicitly **for the general class** (a model instance is a
witness, the statement of what fails must be general), then prove the
strongest true version you can and say exactly which hypothesis separates
them. If you can prove only part, mark precisely which steps are proved and
which are conditional, and list the remaining obstacles as sharp lemmas.
Never label a sketch as a proof.

Read before writing: the shards named below (`report/sections/`), CA-88
(`report/sections/88_layered_targets.tex`, the grid and tag vocabulary),
`CONVENTIONS.md` entries (r), (ak)-(aw) (tiles, bond energy, cut spaces,
pointed site, KS modes, layer tags, lifts, seams, collision forms) and the
local sources they cite (cite by path:line; never from memory; if a needed
source is not local, say so explicitly and record the gap; `references/` and
`literature/md/` are the ground truth; grep them). Do not re-derive what
CA-62..CA-100 already establish; cite them by number.

## Time budget (binding)

You have about 70 minutes of wall clock. Within the first 10 minutes write
`NOTE.md` with the statement, the layer tags, the pillar served, and a
skeleton ledger with every status "open"; then update `NOTE.md` after each
proved step. An honest partial `NOTE.md` is worth far more than a complete
one that never gets written. Stop exploring and finish the ledger when about
60 minutes have passed.

## Rules of engagement

Write ONLY inside `explorations/2026-10-27-astra-r4/H5-coarse-vector-zero-mode/` (`NOTE.md` plus
optional `checks/` with scripts and raw output). No edits elsewhere, no
commits, no Julia test suite, small SymPy/NumPy checks are fine (laptop
budget: seconds to a few minutes each; nothing above ~1000x1000 dense), no
network. End `NOTE.md` with: "Results ledger" (one line per statement with
status: proven / conditional / conjectural / negative), "Layer tags" (setting,
data layer plus declarations, rung reached, rung claimed), "Pillar served"
(which of P1-P4 and how), "What this gives the integration" (which CA-88 cell
moves and which does not; which CA-75 link it touches), "Open problems",
"Examples table" (instances only, as checks), "Sources used" (path:line). A
sceptical Opus reviewer will try to refute every step.

## Your conjecture
### H5. (Pillar P4.) Target 100.12, the coarse-vector zero mode. This brief is the round-3 G2 brief, never launched; its target is now CA-100 Target 100.12 (`report/sections/100_zero_mode_lattice_chirality.tex`, read it whole and CA-91, CA-89, CA-95 first; the note's `checks/` go under the H5 directory). Original text follows.

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
