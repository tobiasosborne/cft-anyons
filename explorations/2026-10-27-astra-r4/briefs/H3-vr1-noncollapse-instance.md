# Astra round 4 brief — H3-vr1-noncollapse-instance

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

Write ONLY inside `explorations/2026-10-27-astra-r4/H3-vr1-noncollapse-instance/` (`NOTE.md` plus
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
### H3. Non-collapse for VR-1 and the first genuine graph-norm instance (pillar P4)

Background. CA-81 records WT-1 (Wilson limit state) and VR-1 (A1 compatible
isometric refinements with a positive control K intertwined exactly; A2
uniform graph-norm bounds between successive scales; A3 summable refinement
defects; A4 vanishing weighted closure residuals) as the quantitative OAR
contract; `cft_machine/research/virasoro_routes.md` holds the proof. The
status overview (worklog 023 §1, §4.3) records that VR-1 has **no instance
anywhere**: the free-fermion benchmark (`cft_machine/benchmarks/fermion/
PROOF.md`) proves fixed-momentum-core bounds and reaches R2 only by citing
Osborne-Stottmeister Thm 4.11 (`references/text/CFTFromLatticeFermions.txt`),
and the referee note (`cft_machine/reviews/virasoro_referee.md`) warns that the
fixed-core estimate is not a uniform graph-norm bound. Worse, CA-95 Prop.
95.5 (= CA-89 Neg. 89.3) exhibits local Koo-Saleur chains satisfying A1-A4
whose limiting modes are all zero, and CA-100 Neg. 100.5 another; so VR-1 as
stated certifies nothing about non-triviality. Read CA-81, CA-79 (79.2 shell
certificate P0-P3, 79.8), CA-89 (89.1, 89.3, 89.7), CA-95 (95.1, 95.5, 95.6
fermion diagonal bounds, 95.7 wrong-energy obstruction), CA-100 (100.1, 100.5,
100.10), `cft_machine/research/virasoro_routes.md`, `cft_machine/benchmarks/
fermion/PROOF.md` and `WILSON_PROOF.md`, `cft_machine/reviews/virasoro_referee.md`,
CONVENTIONS (s), (af), (ap), (ar).

**Conjecture H3 (setting periodic/full per family; data category-free (the
contract) with the free fermion ONLY as the check instance; rung R2).**
 (a) *Non-collapse clause.* Formulate a hypothesis A5 for VR-1 of the form
     "a uniform lower bound on one weighted matrix element of one mode", e.g.
     inf_r |<v_r, T_{r,n} K_r^{-s} v_r>| >= kappa > 0 along a transported
     coarse vector v_r = J_{r<-a} v for one n != 0, or a uniform lower bound on
     the energy ledger, and prove: VR-1 (A1-A4) + A5 implies the limiting
     modes are nonzero, the representation of the Virasoro relations on the
     common domain is nontrivial, and (if adjoint pairing and positivity of
     L_0 are added as hypotheses) c > 0. Prove also that A5 is necessary in
     the sense that 95.5's collapsing chains violate it (they must; show
     where). State the result for general C-chains (category-free; the only
     categorical input is the declared realisation of the densities).
 (b) *A uniform graph-norm certificate for the free fermion.* For the
     source-modified Koo-Saleur modes of the complex fermion (PROOF.md,
     CA-95 95.6: K = 1 + Q, even M, AP circle) prove A1-A4 **on the whole
     lattice Hilbert space**, not on fixed momentum cores, with an explicit
     control K = (1 + E)^p, determining the smallest p for which A2 and A3
     hold (audit D's unchecked observation: with p = 1 the defect of order
     eps^2 |r|^3 may violate one-loss A3 near the edge of the momentum window;
     p = 3 may absorb it: settle this). Then verify A5 for this instance with
     an explicit kappa. This would be the first genuine VR-1 instance in the
     repository; it is a *check* of the general contract on an example, not
     the goal.
 (c) *Same-system clause.* Prove that the WS-1 Wilson rows (WILSON_PROOF.md)
     and the VR-1 certificate of (b) live on one state/representation system
     in the sense of CA-81 ("same state and representation system") and
     Remark 88.4, or state exactly which identification is missing.
 (d) *What (a)-(c) do not give.* State, for general C, what remains between
     "VR-1 + A5 on a categorical tower" and R2 on the CA-88 grid: the
     categorical realisation of the densities (CA-95 95.8 compiler input), the
     Ward data (CA-89), the periodic KS tier (LC-4). One paragraph, with tags.
Prove (a) rigorously (it is category-free operator theory); (b) as far as the
time allows, with every proved estimate exact and every unproved one marked
(a numerical check at M = 8, 16, 32 in `checks/` is a calibration, never a
proof); (c) as a precise statement. Say which CA-88 cell moves: if (b) is
complete, the free-fermion row gains "R2 by VR-1" alongside "R2 by OS 4.11";
no categorical cell moves, and say so.
