# Astra round 4 brief — H6-discrete-holomorphicity-selection

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

Write ONLY inside `explorations/2026-10-27-astra-r4/H6-discrete-holomorphicity-selection/` (`NOTE.md` plus
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
### H6. Discrete holomorphicity of defect-endpoint observables selects the tile weights, for arbitrary C (pillar P3 on P2; the selection principle)

Background. CA-86 ends: "the first analytical tool to point at [the critical
locus] is a lattice holomorphicity condition on a Z(C)-spin defect endpoint,
which is the next shard" (CA-86, last paragraph). That shard was never
written. CA-78 proves that at L0 the selection problem for h is category-blind
with rejection tests only; the status overview (worklog 023 §4.2) records
that no shard selects h from categorical data and that this is the central
missing piece of the programme as an *algorithm*. The only local discrete-
holomorphicity source is Chelkak-Glazman-Smirnov (`references/lattice-symmetry/
ChelkakGlazmanSmirnov2016/source/StressTensor.tex`: discrete stress tensor and
holomorphic observables for Ising); Smirnov's and Ikhlef-Cardy's parafermionic
observables are NOT local: do not import their theorems from memory; derive
the discrete contour condition you impose as a definition in the note and
record the source gap. CA-86 Prop. 86.4 gives the Nienhuis critical weights on
the TL-type integrable line as the calibration datum; CA-92/CA-98 give the
seam and reflection structures; CA-80 the exact cells. Read CA-78 (78.2, 78.3,
78.9-78.11), CA-80 (80.1, 80.6), CA-86 (whole), CA-87, CA-92 (92.2, 92.3),
CA-98 (98.1, 98.2 conjugate-dual mirror), CONVENTIONS (ak), (al), (au); Levin-
Wen (`references/string-net/LevinWen2005/`), Aasen-Fendley-Mong defects
(`references/cft/AasenFendleyMong2020/`, topological defect lines commute with
the transfer matrix), ENO / Penneys for the Drinfeld centre and half-braidings
(`references/text/EtingofNikshychOstrikFusionCategories.md`, `PenneysUnitary
FusionCategories.md`, `literature/md/1704.04221/` half-braiding); grep for
"holomorph", "parafermion", "Cauchy", "contour", "spin" and record gaps.

**Conjecture H6 (setting periodic/full (bulk observable), open with module-
category boundary also allowed; data L0 for the ensemble, the defect endpoint
needs an object of Z(C) (a half-braiding), so L0 + Z(C)-datum, in particular
L1; rung: finite -> R2/R3 (selection equations), no rung reached).**
Let the worldline net gas of a C-chain be as in CA-86/CA-80 (exact tiles,
weights w_alpha). Let (Y, gamma_Y) be an object of the Drinfeld centre Z(C)
with half-braiding gamma_Y and twist theta_Y (when C is braided, a simple a
with its braiding and theta_a; the "spin" s_Y with theta_Y = e^{2 pi i s_Y}).
 (a) *The defect-endpoint observable.* Define, for a marked plaquette edge z
     of the spacetime brick lattice and a boundary point z_0, the observable
     F(z) := Z_P[Y-worldline from z_0 to z] := sum over nets Gamma with one
     extra Y-labelled strand from z_0 to z, weighted by w(Gamma) Ev_C(Gamma
     with the Y strand resolved through the half-braiding gamma_Y wherever it
     crosses a net strand) times a phase e^{-i s_Y theta(Gamma)} where
     theta(Gamma) is the total winding of the Y strand (the "spin" factor).
     Prove that this is well defined for arbitrary C (independent of how the
     Y strand is isotoped across the net, by the half-braiding axioms) and
     that for Y = the unit it reduces to Z_P. Make the winding/spin
     convention explicit (it will be proposed for CONVENTIONS).
 (b) *Discrete holomorphicity as a local linear condition.* Impose, as a
     definition, the discrete contour (Cauchy-Riemann) condition on F: for
     every elementary plaquette (or elementary rhombus/face of the brick
     lattice, state which) the oriented sum over its edges of F weighted by
     the edge directions vanishes. Prove that this condition is a finite
     system of linear equations on the tile weights w_alpha whose
     coefficients are determined by (i) the structure constants of
     End_C(O (x) O) in the tile basis, (ii) the half-braiding gamma_Y
     evaluated on the net strand labels, and (iii) the spin s_Y; write the
     system explicitly for arbitrary C (as matrices over the tile basis).
     Decide as a theorem whether the system depends on the associator F and
     on the half-braiding (it should: this is how the category enters the
     selection of h, in contrast to CA-78's category-blind L0 equations),
     and determine the dependence on the choice of Y.
 (c) *Calibration (instance only).* Show that for TL-type input (X self-dual,
     End_C(O (x) O) = dTL_2(d_X), Y = X with its braiding, s_Y the standard
     spin) the system of (b) is solved by the Zhou-Batchelor weights at the
     Nienhuis point u = lambda of CA-86 Prop. 86.4 (this is the known
     mechanism in the literature; here it is a check of (b), not the goal),
     and identify the branch each solution selects. Keep this in `checks/`
     and in the examples table.
 (d) *What holomorphicity gives and does not give.* Prove the exact lattice
     consequence of (b): the discrete contour integral of F around any
     region vanishes, so F defines a "discrete harmonic conjugate pair";
     state precisely (as a conditional statement with sources marked as
     gaps) what further hypotheses turn this into convergence to a
     holomorphic (or holomorphic-covariant) observable in the scaling limit
     and hence into conformal invariance of the ensemble (pillar P2), and
     what it does NOT give (positivity, the full stress tensor, VR-1).
     Relate to CGS's discrete stress tensor (StressTensor.tex, cite lines):
     their Ising construction is the instance Y = psi (spin 1/2) of (a)-(b)
     if your definitions are right; verify or state the discrepancy.
Prove (a), (b) and (d)'s lattice identity rigorously for arbitrary C; (c) as
an exact symbolic check; (d)'s scaling statement as a precise conditional. Say
which CA-88 cells gain: this is the first categorical selection equation for
h (CA-75 row (2) "missing: a selection principle"); it feeds -> R2 and -> R3
at L0 + Z(C)-datum and reaches no rung.
