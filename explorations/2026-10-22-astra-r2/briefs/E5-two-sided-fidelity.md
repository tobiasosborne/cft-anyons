# Astra round 2 brief — E5-two-sided-fidelity

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

Rules of engagement: write ONLY inside `explorations/2026-10-22-astra-r2/E5-two-sided-fidelity/`
(`NOTE.md` plus optional `checks/` with scripts and raw output). No edits
elsewhere, no commits, no Julia test suite, small SymPy/NumPy checks are fine,
no network. End `NOTE.md` with: "Results ledger" (one line per statement with
status: proven / conditional / conjectural / negative), "Layer tags" (setting,
data layer, rung), "What this gives the integration", "Open problems",
"Examples table", "Sources used" (path:line). A sceptical Opus reviewer will
try to refute every step.

## Your conjecture
### E5. The two-sided fidelity certificate, with the Pimsner-Popa step repaired

Background: CA-80 states D5-F: a fully faithful dimension-preserving braided
dagger functor C -> DHR_fin(A) (lower bound) plus an annular index bound
mu <= Dim(C) (upper bound) forces braided equivalence onto the complete
sector category. The reviewer found the gap: the KLM monotonicity step
(references: Kawahigashi-Longo-Mueger, cited in the D5 note as KLM
source.tex:530-531) is proved via commutants and fails for Pimsner-Popa
constants of finite-dimensional inclusions (C in M_n has constant n, its
commutant n^2; explorations/2026-10-22-astra/D5-fidelity-lattice-sewing/checks/review_pp_constant.py).
See D5 REVIEW.md (D5-F entry and problems), INTEGRATION.md section (d), and the
note's sections "A conditional fidelity theorem" and "Modular bootstrap".
Also D5-D (fusion operators alone never certify fidelity) and D5-V
(vacuum-preserving annular expectation forces M = N).

**Conjecture E5 (setting: chiral net target, with the full-theory corollary
stated separately; data layer L2 modular plus a declared net A at L4; rung
R4).** Let A be a completely rational conformal net with mu-index mu_A, and
let C be a unitary modular tensor category. Suppose
 (i) there is a fully faithful, dimension-preserving braided dagger functor
     Phi : C -> DHR_fin(A) (endpoint functor), and
 (ii) there are finite-dimensional (or more generally finite-index) approximants
     N_k subset M_k of the four-interval inclusion A(E) subset A(E')' such
     that the Pimsner-Popa constants satisfy liminf_k PP(N_k subset M_k)
     <= Dim(C), where the approximants converge to the actual inclusion in a
     sense you must make precise (strong convergence of the Jones projections
     and of compatible conditional expectations).
Then Phi is an equivalence: DHR_fin(A) is braided-equivalent to C, mu_A = Dim(C),
and no hidden sectors exist.
Prove it. The crux is the monotonicity/limit step: show that under the stated
convergence the Pimsner-Popa constants of the approximants bound the index of
the limit inclusion from above (the KLM commutant argument is unavailable for
type I approximants; find the replacement: compatible normal conditional
expectations and the Kosaki index, or factor approximants, or a complete-
Pimsner-Popa plus Watatani argument). State the weakest convergence hypothesis
under which the step is true, prove it, and give a counterexample showing a
weaker hypothesis fails. Then derive the full-theory corollary (the diagonal
theory has symmetry category Z(C) = C boxtimes Cbar). Finally, state what a
LATTICE construction must deliver to satisfy (i) and (ii): list the finite-N
quantities (endpoint operators, four-interval inclusions on the chain, their
Pimsner-Popa constants) and the convergence certificates needed, as lemmas.
