# Astra round 3 REVIEW brief — F4-ward-to-residual

You are a sceptical referee working in the repository at the current directory
(`/home/tobias/Projects/cft-anyons`). Read `AGENTS.md` first, whole; Rules 4
(skepticism), 16 (no model hyperfixation) and 17 (layer by data) bind with
special force. Your job is to try to refute, step by step, the proof note
`explorations/2026-10-25-astra-r3/F4-ward-to-residual/NOTE.md`, written by another model
against the brief `explorations/2026-10-25-astra-r3/briefs/F4-ward-to-residual.md`.

## What to do

1. Read the brief, then the NOTE.md whole, then every shard and local source
   the note cites (by path:line). Check each citation actually says what the
   note uses it for. A citation that does not support the step is a defect.
2. For every Lamport step, decide: VALID / GAP (true but unjustified; say what
   is missing) / FALSE (give the counterexample or the wrong equation) / NOT A
   PROOF (a sketch labelled as a proof). Hunt especially for: convention
   drift (CONVENTIONS (a)-(aw); F/R gauge, vacuum index, bracketing, dagger vs
   dual, normalisation), hidden hypotheses, Fibonacci-only or model-specific
   accidents passed off as general, layer-tag inflation (claimed rung or
   claimed data layer stronger than what the proof uses), and "nothing
   crashed" checks that assert no invariant.
3. Re-run the note's `checks/` scripts; write your own independent check in
   `explorations/2026-10-25-astra-r3/F4-ward-to-residual/checks/review_*.py` for at least one
   load-bearing step (a mutation test that makes the claim fail is ideal) and
   save raw output next to it.
4. Write `explorations/2026-10-25-astra-r3/F4-ward-to-residual/REVIEW.md` with: a one-line
   GRADE (PROOF-COMPLETE / WEAKER-RESULT-PROVED / COUNTEREXAMPLE / NOT A PROOF
   / INCOMPLETE), per-step verdicts, the corrected statement with its honest
   layer tags (S; L; R reached), what the brief itself got wrong, the single
   sharpest next lemma, and a "Sources checked" list (path:line).
5. Then write `explorations/2026-10-25-astra-r3/F4-ward-to-residual/INTEGRATION.md`: (a) the
   statements safe to lift into a report shard with grade per statement
   (derived / conditional / conjectural / negative), (b) exact CA-88 grid
   cells that move and that do not, (c) amendments other shards need (dated
   pointer form), (d) CONVENTIONS entries needed, (e) the next lemma.

## Time budget (binding)

About 40 minutes of wall clock. Write REVIEW.md with the GRADE line and a
skeleton within 10 minutes and refine it; stop and finish INTEGRATION.md at
about 35 minutes.

## Rules of engagement

Write ONLY inside `explorations/2026-10-25-astra-r3/F4-ward-to-residual/` (REVIEW.md,
INTEGRATION.md, `checks/review_*`). Do not edit NOTE.md. No edits elsewhere,
no commits, no Julia test suite, no network. Never grade up: a gap is a gap.
