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
| P0.3     | 2026-05-16 | (this)   | Stub meta files (PRD/GLOSSARY/CONVENTIONS/ERRATA/RESEARCH_NOTES/PROVENANCE/CITATION_INDEX/MIGRATION_LOG) | M, I | mechanical | docstrings only; bodies populated in later phases |
| P0.4     |            |          | Move chat1-4.md → archive/chats/                    |            |           |       |
| P0.5     |            |          | Move review_*.md → reviews/                         |            |           |       |
| P0.6     |            |          | (subsumed by P0.1 .gitignore already in place)      |            |           |       |
| P0.7     |            |          | (this file)                                          |            |           |       |
| P0.8     |            |          | Draft PRD.md v0                                      |            |           |       |
| P0.9     |            |          | Hostile Opus review of PRD v0                        |            |           |       |
| P0.10    |            |          | README.md as PRD pointer; final P0 commit            |            |           |       |

## Corrections

*None yet.*

## Deviations from MIGRATION_PLAN.md

- **P0.6 subsumed by P0.1.** Plan had P0.6 as "add .gitignore + remove tracked build artifacts." Because P0.1 wrote `.gitignore` before `git add`, no build artifacts were ever tracked, so the `git rm --cached` step is unnecessary. P0.6 is marked subsumed.
- **P0.1b added.** `bd init` auto-creates files and auto-commits. Recorded as its own step.
- **P0.1c added.** Reconciliation of bd's auto-added CLAUDE/AGENTS sections with the user-approved Beads section.
