# Astra round 4 brief — H4-density-dilution-criticality

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

Write ONLY inside `explorations/2026-10-27-astra-r4/H4-density-dilution-criticality/` (`NOTE.md` plus
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
### H4. Density, dilution and criticality: a conformal limit of the indefinite-N chain requires finite worldline density, and vacancy-insertion refinement dilutes (pillars P1 and P4)

Background. On the pointed carrier O = 1 (+) X (CA-77), the occupation
number N_L = sum_j p_1^(j) grades A_L; CA-90 Thm 90.1(iii) proves that the
dyadic lift alpha_L preserves occupation degree exactly and its intertwined
isometry V_L inserts a vacancy eta at every other site (CA-68, (t)); CA-96's
blocked lift does the same with slack. CA-94 (Thm 94.6) and CA-99 (99.1) prove
that the number-changing dynamics has a continuum limit on the Fock carrier
F_{C,X} = (+)_N L^2(Delta_N; Hom(c, X^N)) in the tuned regime, with dynamical
exponent z = 2 (nonrelativistic, off the conformal ladder); CA-88 tags them
"R0^c + z = 2". CA-86/87 show that at the TL-type integrable points the
critical worldline gas (dense or dilute O(n) at the Nienhuis point) has
*finite loop density*: worldlines fill spacetime. In the quantum picture a
critical (c != 0) ground state of the indefinite-N chain is therefore a state
of finite anyon density per site, not a few-particle state above the empty
Fock vacuum; the CFT vacuum is a "Fermi sea" of worldlines. Nobody has
written this down, and it has a sharp consequence for P4: a refinement that
inserts vacancies halves the density, so the bare dyadic-lift tower cannot
carry a critical Wilson state unless the dressing U (CA-68 W = UV, CA-76
Question 76.12, Link (b3)) refills. Read CA-66, CA-68, CA-76 (76.1, 76.6,
76.12), CA-77 (77.7, 77.8), CA-81 (WT-1), CA-86 (dense/dilute calibration
and Prop. 86.4), CA-87, CA-90 (90.1(iii), 90.V, 90.W), CA-94 (94.1, 94.6,
94.11), CA-99, CONVENTIONS (am), (an), (as), (aw).

**Conjecture H4 (setting any (open chain for the tower, periodic for the
gas); data L0 + declared pointed O and translation-invariant self-adjoint
nearest-neighbour h; rungs: R0^u -> R1 obstruction, finite -> R2).**
 (a) *Zero density forces z = 2.* For any unitary fusion C, any pointed O, and
     any translation-invariant self-adjoint nearest-neighbour h on the chain
     of L sites commuting with N_L or not, prove: if the ground states of a
     sequence of chains L -> infinity have bounded expected occupation
     <N_L> <= N_0 (zero density), then the low-energy spectrum above the
     ground state in the N <= N_0 + k sectors (any fixed k) has gaps scaling
     as L^{-2} at best (quadratic dispersion of the few-particle problem),
     so no z = 1 scaling limit with linear dispersion exists; in particular
     the CA-94/99 limits are the zero-density sector and cannot be conformal.
     State the exact hypotheses (translation invariance; finite range; the
     few-body spectrum of a lattice Laplacian with contact interactions in a
     finite fusion fibre, CA-94 Thm 94.10's coefficient image) and prove it
     for general C: the fusion fibres Hom(c, X^N) are finite-dimensional and
     enter only as internal degrees of freedom.
 (b) *A c != 0 conformal limit needs finite worldline density.* Formulate and
     prove the contrapositive as a theorem on the worldline ensemble of CA-86:
     if the ground state has asymptotically finite density rho > 0 of X-sites
     then the spacetime worldline configurations of the Gibbs state at
     beta ~ L have extensive total worldline length per unit area; and if a
     VR-1 certificate with c != 0 holds for the standard KS modes of h on one
     system, then the ground states of that system cannot have bounded
     occupation (combine (a) with the energy-ledger/central-term identities
     of CA-91/CA-100: a nonzero c* forces a nonzero energy-current structure
     that few-particle states cannot carry, OR find the correct argument and
     state exactly what it uses). Mark precisely which direction is proved.
 (c) *Vacancy insertion dilutes exactly.* Prove, from 90.1(iii) and the
     definition of V_L, that for every state omega on A_{2L} pulled back
     along alpha_L the density per site is halved:
     (omega o alpha_L)(N_L)/L = omega(N_{2L})/(2L) exactly, and the same for
     every occupation-sector weight; conclude that a WT-1-compatible state
     family (omega_n) on the bare dyadic-lift tower with summable drift has
     omega(N)/L -> 0 along the tower, hence by (a) is never critical: the bare
     lift tower (CA-90/96 as they stand) cannot carry a c != 0 Wilson state.
     This is a general-C negative theorem; state it with tags.
 (d) *What a dressing must do.* Characterise, as necessary conditions for
     general C, the dressing U_L in W_L = U_L V_L (CA-68, CA-76 Prop. 76.1,
     76.12) that a critical Wilson state family requires: U_L must change
     occupation degree by an amount that restores density (it cannot commute
     with N_{2L}), so it must be built from the number-changing tiles (hops
     create no particles; cups/caps and vertices do); give the exact
     commutation relation [N_{2L}, U_L] it must satisfy on average, and
     reformulate CA-76 Question 76.12 and CA-75 Link (b3) with this
     constraint. If possible, exhibit the general form of such a U_L as a
     finite-depth circuit of exact tiles (CA-80) and prove its locality.
Prove (a) and (c) rigorously, (b) as far as possible with the proved direction
marked, (d) as sharp necessary conditions. Checks: a small exact-diagonalisation
check of the L^{-2} gap scaling on a generic 2-simple fusion fibre (keep it
symbolic in F where possible; sizes well under the laptop cap) and an exact
check of the density halving. Say which CA-88 cells this affects: it adds a
negative to the R1 column for the bare tower and redirects Link (b3).
