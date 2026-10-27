# Astra round 4 brief — H2-lattice-cell-equations

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

Write ONLY inside `explorations/2026-10-27-astra-r4/H2-lattice-cell-equations/` (`NOTE.md` plus
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
### H2. Lattice cell equations at finite cutoff: the finite-cutoff sewing/Ward system of a C-chain is a cochain complex (pillar P3 on P2; CA-75 Link (a))

Background. `reconstruction/01_cells.md`-`05_mixed_complex.md` (LC-1..LC-5)
formulate, on *continuum* carriers, the cell equations C0-C7: typing,
positivity/collars, sewing (C2, C3), the coordinate Ward equation
d_i Z + B_i^+ Z - Z B_i^- = 0 (C4), curvature compatibility (C5), stress as
internal generator (C6) and standard Koo-Saleur identification at every cutoff
(C7), with the propagation law W_(Z2 Z1) = W2 Z1 + Z2 W1 (LC-W, proved) and the
obstruction fragments HH^1, CE H^2, binary H^3, mixed complex (each for a
frozen fragment; the full system has only a linearisation cokernel, LC-3 §4,
LC-10 FP-J, and the identities D_2 D_1 = 0 were never derived). CA-75 Link (a)
asks whether the CA-86 history sum is the lattice avatar of these cells
((a1) typing, (a2) sewing, (a3) Ward, (a4) limit). CA-80 supplies exact
lattice cells Z_P, exact sewing by inverse Gram along tile legs (Lemma 80.1),
cut spaces H_gamma = (+)_a Hom(a, W_gamma), temporal RP and an exact Ward
product rule (Lemma 80.6, Duhamel). CA-92/CA-98 supply seam operators for
spatial gluing. CA-89/CA-95 define the Ward-to-KS transfer and the two-loss
residual norms; CA-14 and CONVENTIONS (af), (ap) fix the standard KS densities
built from k_j. Nobody has posed C2-C7 *on the lattice cells*. Read LC-1,
LC-3, LC-5, LC-10, CA-75 (Link (a)), CA-80, CA-86, CA-89 (89.1 and the
residual definitions), CA-92 (Thm 92.3, the bent kernel), CA-98 (98.1
canonical seam), CONVENTIONS (ak), (al), (ap), (ar), (au).

**Conjecture H2 (setting full/periodic or open with declared module-category
boundary, both allowed, state which; data L0 + declared pointed O, tiles h,
seam s (L1 gives the canonical seam of 98.1); rung: finite, -> R2 and -> R3).**
Let Z_P be the exact brick-wall cell of CA-80 for a rectangle P of l sites and
M rows, with cut spaces H_gamma on its four sides (temporal cuts along tile
legs; spatial cuts through the seam operator of CA-92/98).
 (a) *Typing and sewing (C0-C3 on the lattice).* Define the lattice cell
     grammar: rectangles, their four typed cuts, temporal composition (Lemma
     80.1) and spatial composition (through K_s / the canonical seam). Prove
     that C0 (categorical typing) holds at every cutoff because Ev_C obeys
     the F-moves, that C2/C3 (sewing and decomposition independence) hold
     exactly for temporal sewing, and determine exactly what spatial sewing
     requires of the seam (is it C3-independent of the decomposition for
     arbitrary C? for which s?). Use the module-category boundary data of
     LC-1 §1 for open ends; do not treat PBC vs OBC as a question.
 (b) *The discrete Ward equation (C4, C7 on the lattice).* Define the two
     discrete coordinate changes available at finite cutoff: the temporal
     anisotropy derivative d/d(delta tau) of the exact tile, and the spatial
     dilation given by the CA-90 dyadic lift alpha_L (or CA-96's blocked
     version). Define the lattice Ward residual
       R_P := (coordinate variation of Z_P) - (B^+ Z_P - Z_P B^-),
     with B^+/- the standard KS densities of CONVENTIONS (ap) built from k_j
     on the out/in cuts, and prove the exact lattice propagation law
     R_(Q o P) = R_Q Z_P + Z_Q R_P (lattice LC-W; Lemma 80.6 has the Duhamel
     identity you need) for arbitrary C. Then compute R_P for the single-
     plaquette cell to first order in delta tau as an explicit element of
     End_C(O (x) O) in terms of the tile coefficients c_alpha, and prove that
     "R_P = 0 to first order" is a finite system of linear equations on the
     c_alpha whose coefficient matrix is determined by the structure constants
     of End_C(O (x) O) as an algebra with the tile basis. Decide, as a
     theorem, whether this system depends on F (the associator) or only on
     the algebra structure of End_C(O (x) O): this is the category-blindness
     question of CA-78 / D2 REVIEW:79 posed exactly.
 (c) *The complex.* Linearise the full finite-cutoff system (temporal sewing,
     spatial sewing with seam, discrete Ward in both directions, RP as a
     closed condition) around a solution (h, w, s) and write the linear
     operators D_1 (equations) and D_2 (identities between equations). Prove
     D_2 D_1 = 0, i.e. that the finite-cutoff system IS a cochain complex
     (this is what LC-3 §4 and LC-10 could not do on continuum carriers; at
     finite cutoff every space is finite-dimensional, so it is decidable),
     identify its H^1 (first-order deformations of the tiles preserving the
     equations modulo gauge) and H^2 (obstructions), and relate H^2 to the
     CE class of LC-2 P2 (the central charge as a cocycle). If D_2 D_1 != 0,
     exhibit the failing identity for general C and the strongest complex
     that does exist.
 (d) *Convergence statement (C-limit, a4).* State precisely, as a conditional
     theorem, what decay of the lattice Ward residuals R_P (in the (s,2)
     norms of CA-89/CA-95) under refinement gives: the W2 hypothesis of
     CA-89 Thm 89.1 and hence VR-1 A3/A4 for the standard KS modes. Do not
     prove convergence; prove the implication and name the missing estimate.
Prove (a), (b) and as much of (c) as possible rigorously; (d) as an exact
implication. Checks: compute the first-order single-plaquette Ward system of
(b) symbolically for a generic 2-simple-object fusion ring with symbolic F in
`checks/` and test the F-dependence by mutation. This creates the lattice
avatar CA-75 Link (a) asks for; say which CA-88 cells gain an ingredient.
