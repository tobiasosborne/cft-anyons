# Round 4 REVIEW brief (Opus) — KEY

You are a sceptical referee working in the repository at
`/home/tobias/Projects/cft-anyons`. Read `AGENTS.md` first, whole; Rules 4
(skepticism), 16 (no model hyperfixation), 17 (layer by data) and 18 (pillars
first) bind with special force, as does Tobias's generality rule (2026-10-27):
results are formulated in generality and only *checked* in examples; an
example that has become the subject is a defect. Your job is to try to refute,
step by step, the proof note `explorations/2026-10-27-astra-r4/KEY/NOTE.md`,
written by another model (Codex gpt-6-astra) against the brief
`explorations/2026-10-27-astra-r4/briefs/KEY.md`.

## What to do

1. Read the brief, then the NOTE.md whole, then every shard and local source
   the note cites (by path:line). Check each citation actually says what the
   note uses it for. A citation that does not support the step is a defect.
   A claim imported from memory without a local source is a Law-1 defect.
2. For every Lamport step, decide: VALID / GAP (true but unjustified; say
   what is missing) / FALSE (give the counterexample or the wrong equation) /
   NOT A PROOF (a sketch labelled as a proof). Hunt especially for:
   convention drift (CONVENTIONS (a)-(aw); F/R gauge, vacuum index,
   bracketing, dagger vs dual, cup normalisation, tile sign H = -sum h vs
   k = -h, KS mode conventions), hidden hypotheses, model-specific accidents
   passed off as general, layer-tag inflation (claimed rung or data layer
   stronger than what the proof uses), "nothing crashed" checks that assert
   no invariant, and pillar drift (work that serves none of P1-P4).
3. Re-run the note's `checks/` scripts (python3; they must not need network);
   write your own independent check in
   `explorations/2026-10-27-astra-r4/KEY/checks/review_*.py` for at least one
   load-bearing step (a mutation test that makes the claim fail is ideal) and
   save raw output next to it.
4. Write `explorations/2026-10-27-astra-r4/KEY/REVIEW.md` with: a one-line
   GRADE (PROOF-COMPLETE / WEAKER-RESULT-PROVED / COUNTEREXAMPLE / NOT A PROOF
   / INCOMPLETE), per-step verdicts, the corrected statement with its honest
   tags (S; L + declarations; R reached), the pillar it serves, what the brief
   itself got wrong, the single sharpest next lemma, and "Sources checked"
   (path:line).
5. Then write `explorations/2026-10-27-astra-r4/KEY/INTEGRATION.md`: (a)
   statements safe to lift into a report shard with grade per statement
   (derived / conditional / conjectural / negative), (b) exact CA-88 grid
   cells that move and that do not, (c) amendments other shards need (dated
   pointer form), (d) CONVENTIONS entries needed (letter them from (ay);
   (ax) is taken), (e) the next lemma.

## Rules of engagement

Write ONLY inside `explorations/2026-10-27-astra-r4/KEY/` (REVIEW.md,
INTEGRATION.md, `checks/review_*`). Do not edit NOTE.md. No edits elsewhere,
no commits, no Julia test suite, no network. Never grade up: a gap is a gap.
Keep each file under ~350 lines. Compute budget: laptop; nothing above a few
minutes or ~1000x1000 dense.
