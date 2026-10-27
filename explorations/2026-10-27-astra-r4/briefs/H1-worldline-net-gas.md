# Astra round 4 brief — H1-worldline-net-gas

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

Write ONLY inside `explorations/2026-10-27-astra-r4/H1-worldline-net-gas/` (`NOTE.md` plus
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
### H1. The worldline net-gas representation of the indefinite-N Gibbs state, for arbitrary C (pillars P2 and P1)

Background. CA-86 Lemma 86.1 shows, to first order per plaquette, that the
brick-wall Trotter expansion of a nearest-neighbour chain on the pointed site
O = 1 (+) X is a sum over spacetime string-net histories with amplitude
Ev_C(Gamma) times a product of tile weights; Corollary 86.2 states that the
Levin-Wen rules (loop = d, bubble = delta, F-move) hold for Ev_C and that only
isotopy is broken. CA-80 (Lemmas 80.1-80.6) works with the *exact* tiles
T_j(t) = exp(t h_j) = sum_alpha w_alpha(t) D_alpha and proves exact sewing along
tile legs (inverse Gram), temporal reflection positivity (Sigma >= 0 blockwise)
and the Ward product rule. CA-77 (Thm 77.8) gives the configuration Fock
carrier. The repository never states the resulting object as what it is: a
statistical-mechanics ensemble of labelled worldline nets in spacetime whose
weights are C-evaluations, i.e. the stat-phys / Levin-Wen picture of pillar
P2, which *requires* indefinite particle number (worldlines are created and
annihilated). SLE/CLE appears once in the repo (worklog 019:98) and no source
on conformal invariance of loop ensembles is registered. Read CA-66, CA-77,
CA-80, CA-86, CA-87, CA-92 (seams), CONVENTIONS (r), (ak), (al), (am);
sources: Levin-Wen (`references/string-net/LevinWen2005/`), Zhou-Batchelor
dilute O(n) weights, Chelkak-Glazman-Smirnov (`references/lattice-symmetry/
ChelkakGlazmanSmirnov2016/`, the only local discrete-holomorphicity source),
Aasen-Fendley-Mong (`references/cft/AasenFendleyMong2020/`); grep for
"Markov", "loop model", "O(n)", "CLE", "Schramm" and record every gap.

**Conjecture H1 (setting any; data L0 + declared pointed O and self-adjoint
nearest-neighbour h in End_C(O (x) O); rung: finite, an exact ingredient for
R1-R3).** Let C be unitary fusion, (O, eta) pointed with O = 1 (+) X, X any
object (unit summands allowed), H = sum_j k_j with k_j = -h_j, and consider the
exact brick-wall row R (CA-80 Lemma 80.4) and the exact patch sums Z_P.
 (a) *Exact net-gas representation.* For every finite brick patch P with
     in/out cuts, Z_P = sum over labelled worldline nets Gamma on P (edges
     labelled by Irr(<X>) or "vacant", trivalent vertices allowed exactly when
     the corresponding Hom spaces of C are nonzero, boundary labels fixed by
     the cut vectors) of  w(Gamma) Ev_C(Gamma), where w(Gamma) is a product of
     local plaquette weights determined by the exact tile coefficients
     w_alpha(t) and Ev_C(Gamma) in Hom(W_in, W_out) is the C-evaluation.
     Prove this exactly (no O(delta tau^2) remainder), for arbitrary C, with
     the explicit map from tiles to net pieces, including the vertex tiles
     (nu, nu^dagger of (ak)) whose normalisation you must fix in the note
     before use (record the choice; it will be proposed for CONVENTIONS).
 (b) *Levin-Wen rules exactly.* Ev_C obeys: closed loop of label a = d_a;
     bubble = delta; F-move; vertex evaluations by the chosen trivalent
     normalisation; state and prove the exact Markov-trace property of the
     ensemble (a closed worldline component contributes its quantum dimension
     and otherwise decouples) for any C. Which of these need pivotal /
     spherical structure, and which need nothing beyond fusion?
 (c) *Domain Markov property.* Prove that the ensemble has the lattice
     domain Markov property for arbitrary C: conditioned on the labelled
     configuration outside a sub-patch Q and on the cut data on dQ, the
     conditional weight of the inside is Z_Q with those cut data (this is
     exactly Lemma 80.1 read as a Markov property; make the statement precise
     with the cut spaces H_gamma = (+)_a Hom(a, W_gamma) and the inverse Gram).
     This is the hypothesis that SLE/CLE theory needs from a lattice model;
     say exactly which parts of the SLE/CLE axioms (domain Markov; conformal
     invariance) are supplied and which are not.
 (d) *Positivity and the sign structure.* The "measure" w(Gamma) Ev_C(Gamma)
     is in general operator-valued and signed. Prove: (i) on the loop sector
     (no vertex tiles) with X simple and self-dual and the (r) cup
     normalisation, the scalar weight of a closed configuration is a positive
     measure iff the exact tile coefficients of the geometric tiles (through,
     hop, cup, cap, cup-cap) are nonnegative, and give the general criterion
     when X is not simple or not self-dual (Frobenius-Schur indicators enter;
     state where); (ii) for every C with N_{XX}^X != 0 the vertex sector
     carries F-symbol signs that no gauge removes in general, and characterise
     (in terms of C, not a model) when the full net gas admits a positive
     representation; (iii) relate this to temporal reflection positivity
     (CA-80 Lemma 80.2): RP of the row does not require a positive measure on
     nets; make the two notions' relation a theorem.
 (e) *Conformal invariance as a conjecture, stated precisely.* Formulate,
     for arbitrary C, the conjecture that at a critical point of the tile
     weights the scaling limit of the labelled worldline ensemble is a
     conformally invariant loop/net ensemble (CLE-type), and prove the
     lattice-level statements that any such argument would consume: domain
     Markov (c), the loop-weight = d_a identification (b), and the exact
     relation between the anisotropy parameter and the tile weights (CA-86
     Prop. 86.3/86.4 for the TL-type instance ONLY as a check). Do not claim
     conformal invariance; state exactly what is missing and which sources
     would be needed (record them as gaps).
Prove (a)-(d) rigorously; (e) as a precise conjecture with the proved
ingredients separated from the unproved. Checks: an exact SymPy/NumPy
verification of (a) for a small patch with a general-C symbolic F (keep the
instance in `checks/`), and of (d)(i) with a mutated sign. Say which CA-88
cell this touches (it is an exact ingredient at every setting; it is the
pillar-P2 object itself) and that it opens CA-75 Link (a).
