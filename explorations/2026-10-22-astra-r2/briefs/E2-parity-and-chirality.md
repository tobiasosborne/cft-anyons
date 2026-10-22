# Astra round 2 brief — E2-parity-and-chirality

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

Rules of engagement: write ONLY inside `explorations/2026-10-22-astra-r2/E2-parity-and-chirality/`
(`NOTE.md` plus optional `checks/` with scripts and raw output). No edits
elsewhere, no commits, no Julia test suite, small SymPy/NumPy checks are fine,
no network. End `NOTE.md` with: "Results ledger" (one line per statement with
status: proven / conditional / conjectural / negative), "Layer tags" (setting,
data layer, rung), "What this gives the integration", "Open problems",
"Examples table", "Sources used" (path:line). A sceptical Opus reviewer will
try to refute every step.

## Your conjecture
### E2. Parity forces non-chirality: delineating the chiral and full targets

Background: Tobias ruled (AGENTS.md Rule 17) that chiral and full targets are
both in scope and each statement must say which it targets. The D6 reviewer
found no local source settling whether a one-dimensional local tower can have a
chiral OAR limit with c != 0 (explorations/2026-10-22-astra/D6-functor-and-obstruction-theory/REVIEW.md
section A1). The Ising calibration (CA-82, cft_machine/compiler/PROOF.md,
LOCAL_LIMIT.md) obtains a chiral limit only by a chiral sine chain that
discards one Fermi edge (worklog/015 lines on UV-edge doubling). VR-1 is in
cft_machine/research/virasoro_routes.md; CA-79 gives the KS modes in tile form
and the exact-covariance no-go D4-N.

**Conjecture E2 (setting: both, this is the delineation; data layer L0;
rung R2).** Let H_N = sum_j h_j be a finite-range Hamiltonian on a periodic
C-chain with site object O, built from C-morphisms, and let T_{N,n}, Tbar_{N,n}
be the standard Koo-Saleur modes (CONVENTIONS (ap)) with declared velocity.
Suppose there is a parity unitary P_N on the chain (site reflection composed
with the pivotal/dagger structure of C) with P_N h_j P_N^* = h_{-j}, and that
both families satisfy VR-1's hypotheses A1-A4 on a common regularity system,
with P_N intertwining the regularity operators. Then:
 (a) the limiting modes T_n, Tbar_n exist, P intertwines them, and the central
     charges agree: c = cbar;
 (b) [T_m, Tbar_n] -> 0 on the common domain (the two families commute in the
     limit), so the limit carries Vir (x) Virbar with equal central charge;
 (c) hence no parity-symmetric local chain has a purely chiral limit with
     c != 0: a chiral target REQUIRES explicitly parity-breaking densities, and
     for those the standard KS prescription for Tbar must be modified or Tbar
     must vanish in the limit.
Prove (a) and (b) rigorously from VR-1 (the hard part is (b): find the
decay hypothesis on [T_{N,m}, Tbar_{N,n}] that follows from locality and
linear dispersion, and prove it is implied by A1-A4 plus a stated momentum-
sector condition, or show an extra hypothesis is genuinely needed and name it).
For (c), state the precise theorem. Then give the general construction of a
parity-breaking C-chain from a parity-symmetric one (the categorical analogue
of discarding a Fermi edge) and say which layer tags its limit carries. If any
step fails for non-self-dual X (parity may map X to Xbar), say so and fix it.
