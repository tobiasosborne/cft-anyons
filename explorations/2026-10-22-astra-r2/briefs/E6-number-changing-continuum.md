# Astra round 2 brief — E6-number-changing-continuum

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

Rules of engagement: write ONLY inside `explorations/2026-10-22-astra-r2/E6-number-changing-continuum/`
(`NOTE.md` plus optional `checks/` with scripts and raw output). No edits
elsewhere, no commits, no Julia test suite, small SymPy/NumPy checks are fine,
no network. End `NOTE.md` with: "Results ledger" (one line per statement with
status: proven / conditional / conjectural / negative), "Layer tags" (setting,
data layer, rung), "What this gives the integration", "Open problems",
"Examples table", "Sources used" (path:line). A sceptical Opus reviewer will
try to refute every step.

## Your conjecture
### E6. The number-changing continuum limit of a pointed C-chain exists and is classified

Background: CA-77 (report/sections/77_pointed_carrier_invariants.tex) records
D1-T6/N4: with a length-weighted (Haar-type) dressing, the Hilbert inductive
limit of the pointed carrier O = 1 (+) X is the ordered-configuration Fock space
F = (+)_{c,N} L^2(Delta_N; Hom(c, X^{(x)N})) with fusion fibres, while bare
insertion gives an atomic limit. The D1 reviewer refuted the universality of
D1-C: its lattice Hamiltonian hides a contact attraction that engineers
Neumann collision conditions; with standard hard-core hopping the collisions are
Dirichlet and the number sectors decouple (explorations/2026-10-22-astra/D1-carrier-theory/REVIEW.md
and checks/review_contact_check.py). The reviewer's reformulation: the limit is
NON-universal and the right theorem classifies it. Tobias holds that indefinite
anyon number is central to progress; this conjecture is the precise general
form of that belief at the nonrelativistic layer. Sources: D1 NOTE.md sections
4-6; CONVENTIONS (am); standard theory of self-adjoint extensions / point
interactions in one dimension if local (grep references/ and literature/md;
record the gap if absent).

**Conjecture E6 (setting: open chain, nonrelativistic continuum, a
prerequisite layer below R3; data layer L0 fusion; rung R1 for the
number-changing dynamics).** Let C be unitary fusion, O = 1 (+) X pointed,
and let h in End_C(O (x) O) be ANY self-adjoint nearest-neighbour density
with the standard scaling H_eps = eps^{-2} (hopping part) + eps^{-1} (number-
changing part) + (diagonal part), where the parts are the (ak) tile
components of h. Let K_eps be the D1-T6 isometries into F. Then:
 (a) the projected resolvents K_eps (H_eps + lambda)^{-1} K_eps^* converge
     strongly, for every such h, to the resolvent of a self-adjoint operator
     H_h on F (possibly after subtracting a divergent scalar);
 (b) H_h is the Laplacian on each ordered chamber Delta_N with fusion-fibre-
     valued boundary conditions at collisions that are determined by a
     computable finite-dimensional datum of h: a self-adjoint extension of the
     minimal Laplacian on the union of chambers, parametrised by a Lagrangian
     subspace of the collision boundary space (+)_{N} Hom-valued traces, whose
     matrix is an explicit function of the tile coefficients (the hopping
     amplitude fixes Dirichlet/Neumann/Robin, the fusion tiles b: X -> X (x) X
     and v: 1 -> X (x) X fix the number-changing coupling between the N and
     N+1, N+2 chambers);
 (c) the map h -> (boundary datum) is surjective onto the Lagrangian
     Grassmannian of C-equivariant boundary conditions, so EVERY C-equivariant
     number-changing point-interaction dynamics on F arises as such a limit;
     and the limit is natural under unitary tensor equivalences.
Prove (a) and (b) rigorously (Mosco convergence of the quadratic forms is the
expected route; the reviewer's contact computation shows how the hopping tile
sets the collision condition). For (c) prove surjectivity or characterise the
image. Say explicitly at which step the category enters (through the fibres
Hom(c, X^{(x)N}) and the fusion tiles) and at which it is inert, and whether
the result extends to range-r densities.
