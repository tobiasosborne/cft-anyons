# PROVENANCE — what came from where, with hashes

<!--
ROLE: The audit trail of imported content. Every file in the canonical
      repo that originated elsewhere has an entry here recording: source
      path, source SHA256 at import time, the migration step / commit
      that imported it, and any harmonisation applied.
UPDATE POLICY: Append-only on import. If a file is re-imported (e.g.,
      because the source was updated), the new entry references the old
      one but does not delete it.
TRIGGER: Any new file imported from microscopic-mobile-anyons/,
      cft-anyons-deprecated/, or any external source. Every Phase 2+
      step adds entries here.
-->

*Stub. First entries expected in `MIGRATION_PLAN.md` Phase 2 (reference
library and literature DB import).*

## Schema for each entry

```
## <YYYY-MM-DD>: <imported file path in canonical repo>

**Source path:** <absolute path in source project>
**Source SHA256:** <hash>
**Migration step:** <P-step ID>
**Commit:** <hash>
**Harmonisation applied:** <description, or "none">
**Validation passed:** M D C R I (which gates)
**Related GLOSSARY entries:** [[name1]], [[name2]]
```
