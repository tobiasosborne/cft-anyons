# Astra round 3 brief — F6-what-the-tower-remembers

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

Write ONLY inside `explorations/2026-10-25-astra-r3/F6-what-the-tower-remembers/` (`NOTE.md` plus
optional `checks/` with scripts and raw output). No edits elsewhere, no
commits, no Julia test suite, small SymPy/NumPy checks are fine (laptop
budget: seconds to a few minutes each), no network. End `NOTE.md` with:
"Results ledger" (one line per statement with status: proven / conditional /
conjectural / negative), "Layer tags" (setting, data layer, rung reached,
rung claimed), "What this gives the integration" (which CA-88 cell moves and
which does not), "Open problems", "Examples table" (instances only), "Sources
used" (path:line). A sceptical reviewer will try to refute every step.

## Your conjecture
### F6. What the R0 tower remembers: the inductive-limit algebra of a C-chain is classified by the fusion ring of <O>

Background: the north star asks for a functor from category data to lattice
towers whose limit is faithful to the input. CA-71-CA-74, CA-77, CA-90 and
CA-94 build, for a unitary fusion C and site object O, the tower of finite-
dimensional C*-algebras A_L = End_C(O^{(x)L}) with isometric or unital local
refinements (R0^c, R0^u), and prove naturality of the construction under
unitary (braided) equivalences (90.1(iv), 94.12), explicitly NOT R5. CA-80
Proposition 80.8 shows fusion operators alone never certify fidelity. Nobody
has stated what the bare R0 limit object actually determines about C. Read
CA-71-CA-74 (the tower and its inclusion matrices), CA-77 (pointed carrier,
grading), CA-90 (Theorem 90.1, Proposition 90.2's Bratteli argument, 90.5),
CA-93 (Lemma 93.2, the normal-state limit), CA-88 (R0, R4, R5 rows), CA-80
Prop. 80.8, CONVENTIONS (ar). Sources: Bratteli diagrams, dimension groups
and Elliott's classification of AF algebras; Perron-Frobenius for the fusion
matrix N_O (quantum dimensions); grep references/ and literature/md for
"Bratteli", "AF algebra", "dimension group", "Elliott", "Perron"; record the
gap if absent and prove what you can from the definitions (an AF algebra's
K_0 as the inductive limit of the K_0 groups along the inclusion matrices is
elementary and may be derived in place).

**Conjecture F6 (setting: any; data layer L0 fusion; rung R0 reached,
claimed: a complete description of what R0 sees, i.e. the R0 layer of the
fidelity ladder).** Let C be unitary fusion, O an object, D = <O>, and let
A_infinity(C, O) be the inductive-limit C*-algebra of the tower A_L =
End_C(O^{(x)L}) along the right-insertion inclusions a -> a (x) id_O (the
CA-71/CA-90 tower with trivial dressing).
 (a) A_infinity(C, O) is an AF algebra whose Bratteli diagram is the fusion
     graph of multiplication by [O] on Irr(D); its dimension group K_0 with
     order unit is the inductive limit of (Z^{Irr D}, N_O), and the unique
     tracial state (when N_O is primitive) is given by the quantum dimensions
     d_x / d_O^L.
 (b) Rigidity at R0: for two pairs (C, O), (C', O'), the limit algebras are
     *-isomorphic iff the dimension groups are order-isomorphic as groups
     with order unit (Elliott), which is a condition on the fusion RINGS of
     D, D' and the classes [O], [O'] only. In particular A_infinity forgets
     the associator F, any braiding, and any pivotal data: two Morita-
     inequivalent or non-equivalent fusion categories with the same fusion
     ring and the same [O] give isomorphic R0 limits (give an explicit pair,
     e.g. Vec_G^omega across cocycles, or a Tambara-Yamagami pair).
 (c) What the refinement maps add: the local unital refinements alpha_L of
     CA-90 are an extra structure on A_infinity (a locality filtration plus a
     one-parameter family of endomorphisms); state and prove what the pair
     (A_infinity, {alpha_L}) determines beyond the fusion ring: at least the
     half-braiding class up to the obvious gauge, or show it also forgets F.
 (d) Consequence for the ladder: R0 reaches exactly "fusion ring of <O> and
     [O]" and no more; F and R first enter at R1 through the state (CA-93's
     normal limit expectation on the local filtration) and at R4 through the
     sector/defect data (CA-80, CA-93). State this as the R0 row of a
     "fidelity ladder" theorem with tags.
Prove (a) and (b) rigorously (the AF and K_0 parts are elementary; cite
Elliott only through a local source or mark the step as conditional on it),
(c) as far as possible, and (d) as a precise conditional statement. A finite
check in `checks/` computing the dimension groups for two same-ring,
different-F instances is welcome. Say which CA-88 cell moves: this creates
the R0 row of the fidelity (R4) ladder and sharpens Proposition 80.8.
