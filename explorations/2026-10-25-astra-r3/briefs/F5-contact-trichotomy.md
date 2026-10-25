# Astra round 3 brief — F5-contact-trichotomy

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

Write ONLY inside `explorations/2026-10-25-astra-r3/F5-contact-trichotomy/` (`NOTE.md` plus
optional `checks/` with scripts and raw output). No edits elsewhere, no
commits, no Julia test suite, small SymPy/NumPy checks are fine (laptop
budget: seconds to a few minutes each), no network. End `NOTE.md` with:
"Results ledger" (one line per statement with status: proven / conditional /
conjectural / negative), "Layer tags" (setting, data layer, rung reached,
rung claimed), "What this gives the integration" (which CA-88 cell moves and
which does not), "Open problems", "Examples table" (instances only), "Sources
used" (path:line). A sceptical reviewer will try to refute every step.

## Your conjecture
### F5. The contact trichotomy for pointed C-chains (Target 94.16)

Background: CA-94 (report/sections/94_number_changing_collision_dynamics.tex)
proves that the tuned D1-C family (hop t = 1, contact c_eps = -2 + a eps)
converges in projected-resolvent sense on the whole Fock carrier of CA-77
(Theorem 94.6), that a fixed pure-hop density has no limit after any scalar
subtraction (94.1), that the limit is not a chamber-Laplacian extension
(94.9), and that (G_r) forces occupation conservation at range r (94.11);
94.12 is L0 naturality. The named next target is 94.16 (94:240-248): for
fixed self-adjoint h with number-conserving block t.hop plus diagonal, scaled
by eps^-2, counterterm eps^-2 epsilon_bot N-hat, D1's outer-endpoint terms
and two-particle contact coefficient c_eps eps^-2 n_j n_{j+1}, the projected
resolvents on P_{<=2} F converge iff c_eps = -2t + kappa eps + o(eps), giving
Robin collisions with parameter kappa plus D1-type reaction coupling; if
(c_eps + 2t)/eps -> +infinity the collisions are Dirichlet and sectors
decouple; if -> -infinity a bound pair dives and there is no limit. Read
CA-94 whole, CA-77, the E6 directory (NOTE.md:150-173 scale identification,
:602-687 grading obstruction, :830 open problem 1; REVIEW.md:85-88, :158-168;
INTEGRATION.md:104-117; checks/review_tuned_convergence.py), CONVENTIONS
(am), (aw). Sources for one-dimensional point interactions and Mosco / strong
resolvent convergence: grep references/ and literature/md ("point
interaction", "delta interaction", "Mosco", "strong resolvent"); record the
gap if absent and prove from first principles on the two-particle sector.

**Conjecture F5 (setting: any, open interval; data layer L0 + declared t,
c_eps; rung R0^c + off-ladder z = 2, claimed classification).**
 (a) Trichotomy on P_{<=2} F: exactly as in Target 94.16, with the three
     regimes Robin (kappa finite), Dirichlet (+infinity), no limit
     (-infinity), and the Robin parameter kappa an explicit affine function of
     the subleading contact coefficient and the D1 reaction tiles b: X -> X
     (x) X, v: 1 -> X (x) X of CONVENTIONS (ak).
 (b) Fusion fibres are inert in the two-particle collision condition but NOT
     in the reaction coupling: the Robin datum is scalar on each fibre
     Hom(c, X (x) X), while the N -> N+1, N+2 couplings carry the fibre maps
     induced by b and v; state this as a precise structure theorem for the
     limit generator on P_{<=2} F.
 (c) All N: the trichotomy extends to the full Fock carrier under the N-
     uniform estimates of Lemma 94.5, OR you identify the first N at which a
     three-body contact term is needed and what tunes it.
 (d) Range r: with the (G_r) hypothesis of 94.11, the same trichotomy holds
     for range-r densities with the contact replaced by the range-r
     occupation form; without (G_r), state what fusion data enters.
Prove (a) and (b) rigorously (Mosco convergence of the quadratic forms or a
direct resolvent computation on the two-particle chambers); do (c) and (d)
as far as possible. Build a modified `checks/review_tuned_convergence.py`
that scans c_eps across the three regimes for a general pointed chain with
Fibonacci and Ising ONLY as instance rows, at laptop scale (seconds to a
couple of minutes), and report raw output. Say which CA-88 cell moves: the
D1-C row goes from "derived for the tuned family" to "classified" or not.
