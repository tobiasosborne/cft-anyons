# Astra round 3 brief — F3-reflection-coherence

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

Write ONLY inside `explorations/2026-10-25-astra-r3/F3-reflection-coherence/` (`NOTE.md` plus
optional `checks/` with scripts and raw output). No edits elsewhere, no
commits, no Julia test suite, small SymPy/NumPy checks are fine (laptop
budget: seconds to a few minutes each), no network. End `NOTE.md` with:
"Results ledger" (one line per statement with status: proven / conditional /
conjectural / negative), "Layer tags" (setting, data layer, rung reached,
rung claimed), "What this gives the integration" (which CA-88 cell moves and
which does not), "Open problems", "Examples table" (instances only), "Sources
used" (path:line). A sceptical reviewer will try to refute every step.

## Your conjecture
### F3. Reflection coherence: spatial reflection positivity of the whole categorical history at L1

Background: CA-92 (report/sections/92_spatial_seams_and_reflection_positivity.tex)
proves, conditional on a DECLARED unitary seam pairing s with s coev_O =
ev_O^dagger, that the bent kernel K_s = s^dagger rot decides one-tile spatial
reflection positivity of the CA-86 history sum blockwise, with an exact Schur
criterion (Theorems 92.3, 92.5); s exists iff O (x) Obar and Obar (x) O have
equal multiplicities (Lemma 92.2), so for self-dual O at L0 and expected at
L1; a category-free finite OS contraction lemma holds (92.8). The named next
target is the reflection-coherence lemma (E3 INTEGRATION.md:124-136): with a
declared unitary self-duality psi: O -> Obar (L0) or C braided (L1), the
antilinear anti-monoidal functor X -> (X^vee)^dagger composed with psi defines
an antiunitary Theta_x on every brick-patch cut space; prove (i) Theta_x is
compatible with CA-80 Lemma 80.1 sewing and Theta_x^2 acts trivially on
observables, (ii) the induced seam pairing satisfies s coev_O = ev_O^dagger
with Frobenius-Schur phases tracked, (iii) K_s(h) is Hermitian iff Theta_x(h)
= h; and conclude spatial RP of the whole multi-tile CA-86 history for every
self-dual site. Read CA-92 whole, CA-86, CA-80 Lemmas 80.1-80.5, the E3
directory (NOTE.md, REVIEW.md:67-132, INTEGRATION.md:47-136), CONVENTIONS
(ak), (at). Sources: Penneys' unitary dual functor notes as cited at
CA-92:46 (:682-708 anti-monoidal dual functor, :917, :992-1030); the
Aasen-Fendley-Mong files under references/cft/AasenFendleyMong2020/source/.

**Conjecture F3 (setting: periodic / full, with the twisted-reflection chiral
variant noted; data layer L1 braided for the canonical statement, L0 +
declared psi for the general one; rung: finite ingredient -> R3, claimed
spatial reflection positivity of the whole history).**
 (a) Canonical seam at L1: for unitary braided C and ANY site object O, the
     braiding and the unitary pivotal structure determine a canonical unitary
     s_can with s_can coev_O = ev_O^dagger, natural under unitary braided
     equivalences, so Lemma 92.2's hypothesis is automatic at L1 and the
     declared datum of CA-92 is removed.
 (b) Reflection coherence: the reflection-coherence lemma (i)-(iii) holds for
     s = s_can at L1 and for any declared psi at L0, with the Frobenius-Schur
     indicator entering exactly as a sign in Theta_x^2 on the cut space and
     trivially on observables.
 (c) Multi-tile RP: for every tile density h in End_C(O (x) O) with
     Theta(h) = h and satisfying the one-tile Schur criterion of Theorem 92.5
     uniformly, the whole CA-86 linear history on N x M bricks is spatially
     reflection positive for every N, M, and the finite OS reconstruction
     (92.8) yields a positive spatial transfer matrix; the two transfer
     matrices (temporal and spatial) are related by a unitary crossing built
     from s_can and the braiding (the correctly typed replacement for the
     ill-typed F-composed-with-dagger crossing of CA-92's negative result).
Prove (a) and (b) rigorously, (c) as far as possible, marking each step.
Check the F-S sign and the hermiticity criterion on a non-self-dual pointed
instance (Vec_Z3^omega with a nontrivial 3-cocycle, braided where possible)
and on a self-dual non-pointed one in `checks/`. Say which CA-88 cell moves:
CA-92's "L0 + declared s" either becomes "L1, no declaration", or you state
the exact extra datum needed and why the braiding does not supply it.
