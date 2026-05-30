# Hostile re-review — `PRD.md` v0.1 (P0.9, 2026-05-16)

**Reviewer:** Opus 4.7 (hostile-reviewer brief, second pass)
**Target:** `/home/tobias/Projects/cft-anyons/PRD.md` (1221 words, working tree)
**Baseline:** `stocktake/MIGRATION_PLAN.md` §16 (cap bumped to 1500 at `bb1b3fb`); `CLAUDE.md` / `AGENTS.md` (read-gate edited at `64549da`); `stocktake/README.md`; this reviewer's prior pass at `stocktake/reports/opus-prd-v0-review.md`.
**Prior verdict:** REVISE AND RESUBMIT (3 Critical, 6 Major, 11 Minor).
**This verdict (see end):** APPROVE WITH MINOR EDITS — *but only after the single new Critical (N-C1) is fixed in the same commit*.

The author has done substantive work. The PRD has grown from an 80-word stub on HEAD into a coherent 1221-word entry-point document covering all 12 §16 outline sections plus a 13th (Pre-read warnings) that was promoted directly out of the prior review's M4. The mission paragraph now correctly surfaces the three Hilbert-space framings; the R-gate sentence carries its own definition of "substantive"; the "no CI" rule is in Scope: out; the version block is internally consistent; the scaffold/stub status of GLOSSARY etc. is now flagged at the top of Canonical artifacts. Of the 20 prior findings on the explicit checklist, 17 are Addressed and 3 are Partial (with reasoning given).

What the second pass has uncovered is **one new Critical**: the C1 fix shifted the read-gate inconsistency rather than resolving it. The numbers (1–3 → 1–4) now match between PRD and CLAUDE.md, but the *referents* of "1–4" diverge across PRD, CLAUDE.md, and the §16 outline — which is the same load-bearing-rule mismatch the prior review flagged, just relocated.

Everything else is editorial.

---

## Checklist results

### Critical (prior pass)

- **C1 read-order PRD-vs-CLAUDE conflict — Partial.** Numeric count synchronised (both files say "1–4"). But what items 1–4 *are* still disagrees. See N-C1 below; this is now a new Critical, not a resolved one.
- **C2 version string self-contradiction — Addressed.** L15–16: single self-consistent block "Version: v0 (drafted P0.8, hostile-reviewed P0.9, 2026-05-16). Status: scaffold; Phase 0 of MIGRATION_PLAN.md in progress." The "v0.3, mid-consolidation" wording is gone; the Versioning section was renamed Milestones and stripped of the contradictory tag. Clean.
- **C3 canonical artifacts listed as if they exist — Addressed.** L84–86: "Status (Phase 0): most artifacts below are scaffolded stubs (see `MIGRATION_LOG.md` for population status). 'GLOSSARY entry absent' means STOP and ask, not 'free to invent.'" Exactly the wording recommended. The per-artifact invariants are now qualified ("post-Phase 5", "post-Phase 8") where appropriate.

### Major (prior pass)

- **M1 "substantive addition" definition — Addressed.** L110 R-gate line now carries an in-place definition ("any commit adding mathematical content, code, conventions, GLOSSARY entries, ERRATA entries, new sections, or substantive prose") plus a pointer to CLAUDE.md Rule 4 for the exemption list. A first-time reader of PRD can determine whether their change is substantive without context-switching.
- **M2 read-order priorities (step 5, swap 6/7) — Addressed.** L44 step 5 is now "the artifact relevant to your task (typically summary.tex § for math; a Lean module for formalisation; a Julia/Wolfram script for verification; a references/ PDF for citation)" — the over-specific "summary.tex" anchoring is gone. L45–46 swap is applied: stocktake/README.md is now step 6, MIGRATION_PLAN.md is step 7.
- **M3 stop-conditions completeness — Partial.** PRD now uses the "see CLAUDE.md for the full list" deferral pattern the prior review recommended (option B). Good — but the parenthetical at L143–145 advertises four extras "including: Mathlib version pin must drift, two reviewers disagree, bd sync conflict, review subagent gives non-actionable verdict" and **three of those four are not actually in CLAUDE.md §Stop conditions** (only "two independent reviewers disagree" is). PRD is forwarding to a list that doesn't have what it claims. Either add the three missing items to `CLAUDE.md` §Stop conditions (the right fix) or trim the parenthetical to what's actually there.
- **M4 hallucination-risk callouts surfaced in PRD — Addressed.** A dedicated "Pre-read warnings (hallucination-risk callouts)" section (L122–134) cites all six of CLAUDE.md's risk callouts (vacuum-index, F-matrix gauge, coassociativity overload, dagger-special vs Frobenius-special, three Hilbert-space framings, archived chats, 0-sorry invariant) — covers M4 in full and bleeds into M6.
- **M5 "no CI" rule mentioned — Addressed.** L75–77 Scope: out includes "Also out: GitHub CI, automated remote test runs, `.github/workflows/` — quality gates run locally only (CLAUDE.md Rule 9)." Exactly as recommended.
- **M6 Hilbert-space three framings mentioned in mission/limitations — Addressed.** L31–33 in Mission ("realised through three equivalent framings — partition `H_P^W`, mobile-Fock, N-tensor `H_N^W` — see the translation map (to be built at MIGRATION_PLAN P1.4) in GLOSSARY"). Reiterated in Pre-read warnings (L131–132) and Known limitations (L163–164). Triply redundant by design, appropriate for the dominant definitional risk.

### Minor (prior pass — sampled per checklist)

- **Mi1 version notation consistency — Addressed.** Single notation throughout.
- **Mi2 CLAUDE/AGENTS pair relationship explained — Addressed.** L43 parenthetical "(identical pair; edits go to both in the same commit)".
- **Mi3 RESEARCH_NOTES / MIGRATION_LOG in canonical artifacts — Addressed.** L92 (RESEARCH_NOTES), L93 (MIGRATION_LOG) added.
- **Mi4 R-gate expanded in PRD — Addressed.** See M1.
- **Mi5 coassoc-status qualified for phase — Addressed.** L158–159 reads "Categorical coassociativity not formalised anywhere; scalar version proved in CAD Lean and to be migrated in Phase 5."
- **Mi6 scope-out clarified (subject-matter level) — Addressed.** L77–80 distinguishes "mathematical / domain content outside the subject-matter scope" (stop) from "Consolidation-procedural additions (CONVENTIONS, ERRATA, translation maps) governed by MIGRATION_PLAN.md and in scope by definition." Clean.
- **Mi8 Formalisation invariants qualified post-Phase — Addressed (better than recommended).** L96 reads "Invariants (post-Phase 5)" — the prior review suggested post-Phase 4, but post-Phase 5 is *more* accurate: Phase 4 only migrates LinearAlgebra/ (no fusion-category content); Phase 5 is the step at which the 0-sorry / 0-axiom invariant first applies non-vacuously. Author's reading of MIGRATION_PLAN is correct.
- **Mi10 summary.tex description harmonised — Partial.** PRD L88 still calls it "guiding conceptual mathematical statement"; PRD L44 (the new step 5) is generic ("the artifact relevant to your task (typically summary.tex §)") so no longer carries the conflicting "canonical mathematical narrative" tag. The conflict-within-PRD is resolved. **But the same phrase now lives in CLAUDE.md L23** ("The relevant section of `summary.tex` (the canonical mathematical narrative)") and in `stocktake/MIGRATION_PLAN.md` L419 ("the guiding conceptual mathematical statement"). The conflict has migrated cross-document. Low priority — fix the next time CLAUDE.md is touched.
- **N6 port-and-verify glossed inline — Addressed.** L118–120: "port-and-verify for migration of proven content (port = copy faithfully; verify = mutation-prove the tests catch regressions)."

(Other Minor findings — Mi7, Mi9, Mi11, N1–N5, N7 — were not on the explicit re-review checklist. Spot-checking: N7 word-cap is handled at the MIGRATION_PLAN level rather than in PRD; N1 redundancy is gone with the new version block; N5 milestone-name pedantry is fixed at L180; N3 Garjani–Ardonne now has a parenthetical gloss at L66; Mi9 meta-paragraph is the L18–20 routing block at the top. All Addressed.)

---

## New findings introduced by the revision

### Critical (new)

**N-C1. The C1 fix synchronised the *count* "1–4" between PRD and CLAUDE.md but not the *referents*. There are now three documents stating mutually inconsistent versions of the same load-bearing rule.**

Evidence:

| Doc | "1–4" or "1–3" | What items 1–4 actually are |
|---|---|---|
| `PRD.md` L48 | "1–4" | PRD, GLOSSARY, CONVENTIONS, **CLAUDE.md/AGENTS.md** |
| `CLAUDE.md` L28 | "1–4" | PRD, GLOSSARY, CONVENTIONS, **the relevant section of summary.tex** |
| `stocktake/MIGRATION_PLAN.md` §16 L395 | "(1)–(3)" | PRD, GLOSSARY, CONVENTIONS |

An agent reading CLAUDE.md will believe the gate requires PRD/GLOSSARY/CONVENTIONS/summary.tex. An agent reading PRD will believe it requires PRD/GLOSSARY/CONVENTIONS/CLAUDE.md. The PRD's own bd-block message ("Pre-read PRD/GLOSSARY/CONVENTIONS/CLAUDE.md required", L52–54) confirms PRD's interpretation but **directly contradicts CLAUDE.md's own definition of "1–4"** — i.e., an agent who follows the PRD literally will fail CLAUDE.md's gate (no summary.tex read) and an agent who follows CLAUDE.md literally will fail PRD's gate (no methodology read).

The same single mistake the prior C1 flagged (load-bearing rule disagrees across two docs) is back, just with the count synchronised.

**Why this matters more than the original C1.** The numeric agreement creates a false sense of synchronisation. A first-time reader will glance at the matching "1–4" and conclude the docs agree — but they don't, and the disagreement is now hidden one level deeper in the prose. The prior C1 was obvious on inspection; this is obvious only on a side-by-side. Worse, the commit message for `64549da` claims the resolution is "methodology IS a precondition for content, so the canonical formulation is '1–4'" — but the canonical formulation should then include CLAUDE.md as item 4 in CLAUDE.md's *own* read order, which it does not (CLAUDE.md item 4 is summary.tex).

**Fix (recommended):** Pick ONE canonical read-order list and place it in PRD only. CLAUDE.md should defer ("Read order: see PRD §Read order. The gate is: if you have not read PRD + GLOSSARY + CONVENTIONS + CLAUDE.md, refuse to add mathematical content.") This:
1. Eliminates the read-order duplication entirely.
2. States the four required pre-reads by name, not by ordinal, so there is no ambiguity about what "1–4" means.
3. Survives renumbering of either list.

`stocktake/MIGRATION_PLAN.md` §16 L395 should also be updated in the same commit — the outline currently says "(1)–(3)" and lists summary.tex as item (4) optional, which is now historical. Drop the explicit numbering in §16 too and refer to the PRD's version (since the PRD is now drafted and stable).

Atomic, mechanical edit; exempt from review per CLAUDE.md Rule 4 because it resolves a documented cross-document conflict.

### Major (new)

**N-M1. PRD's "Stop conditions" forwards to a CLAUDE.md list that doesn't include three of the four items the forward parenthetical advertises.**

Evidence: PRD L143–145 says "See CLAUDE.md for the full list (including: Mathlib version pin must drift, two reviewers disagree, bd sync conflict, review subagent gives non-actionable verdict)." Searching `CLAUDE.md` §Stop conditions:

- "two reviewers disagree" — present (L365–366: "Two independent reviewers ... disagree").
- "Mathlib version pin must drift" — **not present**.
- "bd sync conflict" — **not present**.
- "review subagent gives non-actionable verdict" — **not present**.

So PRD is advertising a more complete list than CLAUDE.md actually has. This is the same class of failure as the original M3 (mixed half-lists are worse than either extreme), now relocated to the forward reference.

**Fix:** Either (a) add the three missing items to `CLAUDE.md` §Stop conditions in the same commit, or (b) trim the PRD parenthetical to mention only items that exist in CLAUDE.md. (a) is preferred because these are genuine foreseeable stuck-states.

### Minor (new)

**N-Mi1. `stocktake/MIGRATION_PLAN.md` §16 outline has gone slightly stale with respect to the PRD it now describes.** Specifically:
- Item 12 ("Versioning — current canonical version (e.g., 'v0.3, mid-consolidation')") still names a version scheme that PRD v0.1 has explicitly retired (per C2 fix).
- The outline has 12 items; the PRD has 13 sections (the new "Pre-read warnings" promoted out of M4 is not in the outline).
- The read-order item (5) says PROVENANCE.md as the only conditional read; PRD now lists stocktake/README.md and MIGRATION_PLAN.md as the conditional reads.

The outline note at line 417 (cap bump) acknowledges "pre-read warnings and read-order routing were folded in", so the divergence is intentional — but the outline itself still reads as authoritative. Either:
- Add a one-line "Outline superseded by PRD.md as of P0.8; this section is now historical (the outline that produced v0)."; or
- Update items 5 and 12 and add a 13th to match the actual PRD.

Low priority. Doesn't affect any agent reading PRD or CLAUDE.md, only an agent who reaches §16 expecting it to match.

**N-Mi2. The bd-block message in PRD L52–54 ("Pre-read PRD/GLOSSARY/CONVENTIONS/CLAUDE.md required") prescribes a specific bd-issue label/blocker that is not documented anywhere.** Is "Pre-read PRD/GLOSSARY/CONVENTIONS/CLAUDE.md required" a standardised bd block label? A free-text note? An expected `bd dep` target on a new issue type? A literal-minded agent will not know what they're meant to type. CLAUDE.md L29–30 (echoing the same instruction) inherits the same ambiguity. Two-sentence operational clarification in CLAUDE.md §Beads would resolve this and is exempt-from-review.

**N-Mi3. The new "Phase-0 exception" (PRD L56–58) says "lifts at P1.10".** P1.10 is "GLOSSARY checkpoint" (per MIGRATION_PLAN — verify). Worth one-time-checking that this phase reference is correct, because the lift trigger is the natural object for a future agent to inspect when deciding whether the exception still applies. If MIGRATION_PLAN renumbers Phase 1 (likely; many steps), this reference will silently rot. Mitigation: rephrase as "lifts when GLOSSARY contains its first canonical entry (per MIGRATION_PLAN Phase 1 completion)."

**N-Mi4. The bd-block sentence "Pre-read PRD/GLOSSARY/CONVENTIONS/CLAUDE.md required" *enumerates the canonical four* and is thus a stronger statement of the gate than the "1–4" ordinal.** If the recommendation in N-C1 is taken, this sentence becomes the canonical formulation. Consider just lifting it out of the parenthetical and making it the headline of the rule.

---

## Updated cross-document consistency status

| Item | Prior pass | This pass |
|---|---|---|
| Read-gate "1–4" vs "1–3" | PRD says 1–4, CLAUDE.md says 1–3 (C1) | Both say 1–4, but referents differ across PRD, CLAUDE.md, MIGRATION_PLAN §16 (N-C1) |
| Version scheme | PRD self-contradictory (C2) | Single self-consistent block (Addressed) |
| Canonical artifacts vs existence | PRD silent on scaffold state (C3) | Status line at L84–86 (Addressed) |
| summary.tex description | PRD self-conflicting (Mi10) | PRD self-consistent; conflict migrated to CLAUDE.md L23 vs MIGRATION_PLAN L419 |
| Stop-conditions list completeness | PRD's enumeration incomplete (M3) | PRD defers to CLAUDE.md, but parenthetical advertises items not in CLAUDE.md (N-M1) |
| Three Hilbert-space framings | PRD silent (M6) | Triply present in PRD; clean |
| GitHub CI rule | PRD silent (M5) | Scope: out has the line; clean |

---

## On the hardening proposals from the prior review

The prior pass listed four hardening proposals for the "refuse to add content" gate (define "mathematical content" by enumeration; define "refuse" operationally; add Phase-0 exception; session-start acknowledgement). **Three of the four have landed in v0.1** without my expecting them to:

- Enumeration: PRD L49–52 ("any new claim, definition, lemma, proof, equation, F-matrix entry, F-symbol value, gauge choice, indexing convention, citation footnote, or prose that asserts or implies one of these").
- Operational "refuse": PRD L52–54 ("file a bd issue describing the proposed work, mark it blocked on '...', and stop").
- Phase-0 exception: PRD L56–58, plus parenthetical at CLAUDE.md L34–35.

Only the session-start acknowledgement (commit-message pre-read hash) is unimplemented, which is fine — it's a harness change, not a doc change.

Good. The author has internalised the hardening recommendations beyond the explicit fixes.

---

## Verdict

**APPROVE WITH MINOR EDITS** — *conditional on N-C1 being fixed in the same commit as the PRD landing (or in the immediate next commit).*

Why not REVISE AND RESUBMIT: 17 of 20 explicit checklist items are Addressed; 3 are Partial with reasoning (and one of those, Mi8, is *better* than the prior review's suggestion). The author has done the work. The new Critical (N-C1) is a small, mechanical edit — drop the read-order from CLAUDE.md, refer to PRD by name; rephrase the gate by enumerated file names rather than ordinal — that should not require another full review round.

Why not unconditional APPROVE: N-C1 is a genuine Critical — the same load-bearing-rule disagreement that triggered the prior REVISE verdict, just relocated. Letting it ship would be the second pass at letting it ship. The fix is mechanical and exempt from review, but it must happen.

Why not REJECT: the structure is right, the cross-references are tight, the prose is competent, the hardening proposals were absorbed beyond what was asked, and the C/M findings are addressed.

**Re-review trigger:** if N-C1 is fixed by either (a) deferring the read-order from CLAUDE.md to PRD with named-file enumeration, or (b) any other resolution that makes the four pre-read files unambiguous across all three docs — then no further hostile review is needed for the v0 line. A future v1 review at P1.11 will pick up M3-residual and the §16 outline drift; both can wait.

**Re-review NOT triggered by:** N-M1 (Stop-conditions forwarding mismatch) on its own — fix it in the same commit-pass as N-C1 if convenient, but it is not a blocker on its own.

---

## Recommended edit list (concrete, actionable)

1. **PRD.md L48–54 and CLAUDE.md L19–35**: refactor the read-gate to use named-file enumeration rather than ordinal references. Recommended target text (place in PRD; CLAUDE.md defers):

   PRD: *"You must refuse to add mathematical content unless you have read all four of: `PRD.md`, `GLOSSARY.md`, `CONVENTIONS.md`, `CLAUDE.md` (or its identical twin `AGENTS.md`). 'Mathematical content' means..."*

   CLAUDE.md: replace L19–35 with *"Read order: see `PRD.md` §Read order. Gate: as defined in `PRD.md` — refuse to add mathematical content unless PRD, GLOSSARY, CONVENTIONS, and CLAUDE.md have all been read."*

   Resolves N-C1.

2. **CLAUDE.md §Stop conditions**: add the three items PRD now advertises ("Mathlib version pin would need to change for an import", "bd sync conflict prevents issue filing", "review subagent gives non-actionable verdict"). Three short bullets. Resolves N-M1.

3. **stocktake/MIGRATION_PLAN.md §16 L390–415**: add a one-line header "(Superseded by `PRD.md` v0 as of P0.8; this outline is historical.)" — *or* update items 5, 12, and add a 13th to track the actual PRD shape. Resolves N-Mi1.

4. **PRD.md L56–58**: rephrase the Phase-0-exception lift trigger as "lifts when GLOSSARY contains its first canonical entry (per MIGRATION_PLAN Phase 1)". Resolves N-Mi3.

5. **(Optional, low priority)** PRD.md L88 vs CLAUDE.md L23 vs MIGRATION_PLAN.md L419: pick one description of `summary.tex` ("guiding conceptual mathematical statement" recommended; appears in two of three already). Resolves Mi10 cleanly.

Edits 1, 2, 3 are mechanical / cross-document syncs — exempt from re-review per CLAUDE.md Rule 4. Edit 4 is a one-line clarification. Edit 5 is cosmetic.

---

## On the load-bearing read-gate (continued reflection)

The prior review noted four ways the gate could be rationalised around. The v0.1 PRD has hardened against three of them (enumeration, operational "refuse", Phase-0 bootstrapping). The fourth — "have not read" is unverifiable — remains. The session-start-acknowledgement proposal (commit-message hash assertion) is the natural fix and is genuinely out of scope for a doc-level review. Flagging for the v1 review.

A new observation: now that the gate has *two* phrasings (PRD's enumeration of bd-block content, CLAUDE.md's "Per PRD's hardening" parenthetical at L29–35), an agent that reads only one will not be primed to look for the other. The N-C1 fix above (deferring CLAUDE.md to PRD) eliminates this risk entirely.

---

## Word count

PRD body: 1221 words (under the 1500 cap bumped in `bb1b3fb`). Recommended edits in this report add ~30 words and cut ~50, net ~−20. Will remain comfortably under cap.

---

**End of re-review.**
