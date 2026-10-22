# Astra round 2 brief — E1-local-unital-lift

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

Rules of engagement: write ONLY inside `explorations/2026-10-22-astra-r2/E1-local-unital-lift/`
(`NOTE.md` plus optional `checks/` with scripts and raw output). No edits
elsewhere, no commits, no Julia test suite, small SymPy/NumPy checks are fine,
no network. End `NOTE.md` with: "Results ledger" (one line per statement with
status: proven / conditional / conjectural / negative), "Layer tags" (setting,
data layer, rung), "What this gives the integration", "Open problems",
"Examples table", "Sources used" (path:line). A sceptical Opus reviewer will
try to refute every step.

## Your conjecture
### E1. Local unital lift for braided C, and WT-1 drift from corner weights

Background: CA-76 (report/sections/76_corner_to_wilson_bridge.tex) records
that the unital reducing extension of the vacuum-insertion corner map always
exists (D6 P1 plus the reviewer's corollary), so the only gap between the
CA-72 corner calculus and WT-1's hypothesis A1 is LOCALITY of a unital lift.
The D6 reviewer sketched a candidate (R1) for braided C via the interleaving
braid: see explorations/2026-10-22-astra/D6-functor-and-obstruction-theory/REVIEW.md
(section R1) and checks/review_braided_lift.py there, and D3's open problem 1
(explorations/2026-10-22-astra/D3-refinement-meets-dynamics/NOTE.md).

**Conjecture E1 (setting: open chain, either target; data layer L1 braided;
rung R0 -> R1).** Let C be a unitary braided fusion category, O = 1 (+) X a
pointed site object (CONVENTIONS (am)), A_L = End_C(O^{(x)L}), and V_L the
dyadic vacuum insertion of CA-68/CA-71. There exists a unital injective
*-homomorphism alpha_L : A_L -> A_{2L} such that
 (i) alpha_L(a) V_L = V_L a for all a in A_L (it extends the corner map);
 (ii) alpha_L is local: an operator supported on sites [j,k] of the coarse
     chain is mapped to one supported on a fine interval of length at most
     2(k-j+1) + r for a constant r depending only on (C,O);
 (iii) alpha_L preserves the occupation grading up to a bounded shift and is
     natural under unitary braided equivalences;
 (iv) consequently (CA-76, Theorem 76.1) the WT-1 drift satisfies
     d_{k,n} <= p_n e_n + 2(1-p_n) with the CA-76 quantities, so WT-1 A1 and
     the strict-lift bound hold for every braided C with no further input.
Prove it. Then settle the converse direction: for NON-braided C, prove either
that a local unital lift still exists (what replaces the braid: a half-braiding,
i.e. an object of the Drinfeld centre Z(C)?) or that its obstruction is a
computable invariant; state the strongest true statement. Finally, bound r
explicitly and say whether alpha_L can be made a bounded-depth quantum circuit
of C-morphisms (relevant to D3's dressing U_L).
