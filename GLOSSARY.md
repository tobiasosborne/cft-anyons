# GLOSSARY — cft-anyons

<!--
ROLE: The definitional bedrock. Every term used in any canonical artifact
      (summary.tex, Formalisation/, src/, scripts/, prose docs) must have
      an entry here. Per CLAUDE.md Law 1, adding mathematical content
      that uses a term not yet in GLOSSARY is forbidden.
UPDATE POLICY: New entries appended; existing entries updated only via
      atomic commits with explicit cross-references to every affected
      file. Removing or renaming a term is a CROSS-FILE change requiring
      a Core-tier commit (hostile review).
TRIGGER: Any new term encountered in any addition; any aliased term in
      the source projects; any term flagged by a hallucination-risk
      callout in CLAUDE.md.
-->

*Stub. Populated in `MIGRATION_PLAN.md` Phase 1 (steps P1.1–P1.10) by
extracting every `\begin{definition}` and `\begin{convention}` from
`summary.tex` and adding translation-map fields for the variants used
in MMA and CAD.*

## Schema for each entry

```
## <term>

**Canonical:** <statement, verbatim from summary.tex or new>
**Source:** <file:line — must be a tracked file>
**Aliases:** <synonyms used in MMA, CAD, or the literature>
**Translation map:**
  - MMA: <equivalent or "N/A">
  - CAD: <equivalent or "N/A">
  - other: <…>
**Notes:** <pitfalls, related GLOSSARY entries via [[name]], etc.>
```
