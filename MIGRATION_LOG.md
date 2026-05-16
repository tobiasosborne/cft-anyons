# MIGRATION_LOG — per-step commit log of the consolidation

<!--
ROLE: A flat, ordered table of every atomic step executed against
      MIGRATION_PLAN.md. One row per atomic step / commit. Tracks: step
      ID, date, commit hash, what was done, validation passed, reviewer
      (if any), any deviations from the plan.
UPDATE POLICY: Append-only. Each commit that completes a P-step appends
      one row in the same atomic commit. Never reorder; never delete
      rows; corrections go into a separate "Corrections" section below.
TRIGGER: Every atomic migration step. Initialised retroactively for
      P0.1–P0.2 in P0.7.
-->

## Step log

| Step ID  | Date       | Commit   | Summary                                            | Validation | Reviewer  | Notes |
|----------|------------|----------|----------------------------------------------------|------------|-----------|-------|
| P0.1     | 2026-05-16 | 7e62d9a  | Baseline snapshot of canonical repo                 | M, I       | mechanical | git init -b main; .gitignore in place |
| P0.1b    | 2026-05-16 | 36a730d  | bd init (embedded Dolt backend; per-machine local)  | M, I       | mechanical | auto-committed by bd init; modified CLAUDE/AGENTS/.gitignore |
| P0.1c    | 2026-05-16 | cd6e108  | Reconcile CLAUDE/AGENTS beads section with actual backend | M, I       | mechanical | removed bd's auto-added duplicate sections; corrected backend description |
| P0.2     | 2026-05-16 | 17706f4  | Directory skeleton with .gitkeep placeholders       | M, I       | mechanical | archive/, reviews/, references/, literature/, Formalisation/, scripts/{julia,wolfram}/, results/, src/, tests/, af/, docs/ |
| P0.3     | 2026-05-16 | ef57c17  | Stub meta files (PRD/GLOSSARY/CONVENTIONS/ERRATA/RESEARCH_NOTES/PROVENANCE/CITATION_INDEX/MIGRATION_LOG) | M, I | mechanical | docstrings only; bodies populated in later phases |
| P0.4     | 2026-05-16 | 9dabdab  | Move chat1-4.md → archive/chats/ + add archive/README.md | M, I | mechanical | deep-storage warning README |
| P0.5     | 2026-05-16 | 35d939b  | Move review_*.md → reviews/                         | M, I       | mechanical | reviews accessible (validators), not deep-storage |
| P0.6     | —          | —        | SUBSUMED by P0.1 (.gitignore present from baseline) | —          | —         | see Deviations section |
| P0.7     | 2026-05-16 | 637a8ec  | Backfill P0.4/P0.5/P0.6 rows in MIGRATION_LOG       | M, I       | mechanical | log was initialised in P0.3; this catches up the table |
| P0.8-pre-a | 2026-05-16 | bb1b3fb | Bump PRD word cap in MIGRATION_PLAN §16 (800 → 1500) | M, I       | mechanical | per P0.9 reviewer recommendation |
| P0.8-pre-b | 2026-05-16 | 64549da | Sync CLAUDE/AGENTS read-order rule with PRD ("1-3" → "1-4") | M, I | mechanical | per P0.9 C1 finding |
| P0.8     | 2026-05-16 | 3f2a25e  | Ship PRD.md v0 (post-2-round hostile review)        | M, D, C, R | Opus × 2 (APPROVE WITH MINOR EDITS conditional, condition met) | bundled named-file gate fix (N-C1) + new stop conditions + Mi10 summary.tex description harmonise |
| P0.9     | 2026-05-16 | (folded into P0.8) | Hostile Opus reviews of PRD v0 (2 rounds) | R       | self     | reports in stocktake/reports/opus-prd-v0-review.md + opus-prd-v0.1-review.md |
| P0.10    | 2026-05-16 | 5dd5381  | README.md as PRD pointer + final Phase 0 commit     | M, I       | mechanical (user-verbatim) | bd snapshot to JSONL + Phase 1 issue filed |
| P1.4-early-A | 2026-05-16 | 770d730  | Hilbert-space three-framings deep-dive (Opus): YELLOW verdict, canonical = partition | R | Opus | full report at stocktake/reports/opus-hilbert-bridge.md; verdict YELLOW (reconcilable with convention work, no plan revision needed); P1.5 stop condition does not trigger |
| P1.4-early-B | 2026-05-16 | 1008cd8  | File LB-1 (MMA enumerate_fusion_trees multiplicity bug) | M, I | mechanical | bd issue cft-anyons-q6h filed; RESEARCH_NOTES entry added; P8.4 TODO marker scheduled |
| P1.4-early-C | 2026-05-16 | 93a2bea  | Incorporate Opus deep-dive findings into MIGRATION_PLAN | M, D | self | P1.6 expanded 6 → 10 convention items; P1.7/P8.1/P8.4 scope clarifications |
| P1.1     | 2026-05-16 | 8640f1e  | Extract 48 def/conv entries from summary.tex into GLOSSARY.md (verbatim) | M, D, C, R, I | Opus (APPROVE WITH MINOR EDITS, all applied) | 4 conv + 44 def; schema enforced; cross-link graph closes; review at stocktake/reports/opus-glossary-p1.1-review.md; bd issue cft-anyons-k3s.1 closed; parent epic reopened (10 Phase-1 steps remain) |
| P1.2     | 2026-05-16 | (this)   | ERRATA entry for lem:binary-Z squared-amplitudes bug (audit-trail for pre-baseline fix) | M, D, C, R, I | Opus (APPROVE WITH MINOR EDITS, both applied) | summary.tex unchanged (fix pre-dates this repo); ERRATA formalises 3 reviewer citations (R1 Issue 1, R2 Issue 11, R3 Issue 17); R4 silent; in-doc warning summary.tex:1583-1592 was prior audit trail. Review at stocktake/reports/opus-errata-p1.2-review.md |

## Corrections

*None yet.*

## Deviations from MIGRATION_PLAN.md

- **P0.6 subsumed by P0.1.** Plan had P0.6 as "add .gitignore + remove tracked build artifacts." Because P0.1 wrote `.gitignore` before `git add`, no build artifacts were ever tracked, so the `git rm --cached` step is unnecessary. P0.6 is marked subsumed.
- **P0.1b added.** `bd init` auto-creates files and auto-commits. Recorded as its own step.
- **P0.1c added.** Reconciliation of bd's auto-added CLAUDE/AGENTS sections with the user-approved Beads section.
