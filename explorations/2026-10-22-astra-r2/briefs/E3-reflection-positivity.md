# Astra round 2 brief — E3-reflection-positivity

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

Rules of engagement: write ONLY inside `explorations/2026-10-22-astra-r2/E3-reflection-positivity/`
(`NOTE.md` plus optional `checks/` with scripts and raw output). No edits
elsewhere, no commits, no Julia test suite, small SymPy/NumPy checks are fine,
no network. End `NOTE.md` with: "Results ledger" (one line per statement with
status: proven / conditional / conjectural / negative), "Layer tags" (setting,
data layer, rung), "What this gives the integration", "Open problems",
"Examples table", "Sources used" (path:line). A sceptical Opus reviewer will
try to refute every step.

## Your conjecture
### E3. Spatial reflection positivity of the categorical history sum and lattice OS reconstruction

Background: CA-80 (report/sections/80_lattice_sewing_and_fidelity_certificate.tex)
proves temporal reflection positivity of the CA-86 brick-lattice history sum
iff the seam operator is blockwise positive, for cuts along tile legs, with h
self-adjoint and NO sign conditions on tile coefficients. Spatial reflection
positivity (cuts through plaquettes, perpendicular to time) is explicitly NOT
covered (CA-75 Link (a2); D5 REVIEW.md "spatial reflection positivity ... is
not derived"). The LC-4 note (reconstruction/04_cutoff_oar.md) says reflection
positivity and semigroup-limit estimates are needed for OS reconstruction.
Relevant: CONVENTIONS (ak), (al); CA-78 D2-L2 (metric independence kills the
stress; target is Euclidean covariance); dagger structure of C (CONVENTIONS (b),
(r)).

**Conjecture E3 (setting: both; data layer L0 fusion with dagger; rung R0 with
the Euclidean prerequisite for R3).** Let C be unitary fusion, O any site
object, h = sum_alpha c_alpha D_alpha in End_C(O (x) O) self-adjoint, and let
Z be the brick-lattice history sum of CA-86 with tile weights
w(alpha) = delta_tau c_alpha. Define spatial reflection Theta_x as site
reflection composed with the dagger (CONVENTIONS (b)) on the C-labels.
 (a) Z is spatially reflection positive iff the tile-coefficient vector
     satisfies an explicit condition: c_alpha-bar = conj(c_alpha) under the
     dagger involution of tiles AND the matrix of coefficients on the
     Theta_x-paired tiles is positive semidefinite (state the precise matrix);
     in particular self-adjointness of h is not sufficient and not necessary.
 (b) When both temporal and spatial reflection positivity hold, the history
     sum defines a positive transfer matrix in BOTH lattice directions on
     Hilbert spaces carried by End_C-labelled boundary data, the two transfer
     matrices are related by the categorical analogue of the crossing
     (90-degree rotation = an F-move composed with the dagger), and the
     Euclidean lattice theory satisfies a lattice Osterwalder-Schrader
     reconstruction: a Hilbert space, a positive Hamiltonian and a positive
     momentum-like generator exist with the OS axioms discretised.
 (c) On an integrable line (CA-78 YBE solutions) the two transfer matrices
     commute; off it they do not, and their commutator is the lattice avatar
     of the failure of Euclidean rotation covariance (D2-L2).
Prove (a) and (b) rigorously for general C. For (a), produce the explicit
positivity matrix in terms of F-symbols and the pivotal structure, and check
it by a small SymPy computation on at least one non-self-dual and one
multiplicity-bearing category (examples table only). For (c), prove the
integrable-line statement from CA-78's corrected transfer statement
(sequential diagonal product, Koo-Saleur 9312156.tex:603, :717-725) and state
the off-line commutator formula at first order in delta_tau.
