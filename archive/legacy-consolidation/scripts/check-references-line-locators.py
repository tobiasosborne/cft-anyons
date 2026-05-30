#!/usr/bin/env python3
"""P2.3 gate: verify every `references/text/<file>:<line>` line-locator
citation in canonical content actually points to a real line.

**Plan-vs-reality note.** MIGRATION_PLAN P2.3 says "for each SRC-* line
locator in references/manifest/SOURCES.md, verify the cited line in the
cited file contains the cited text." But the manifest carries only file
paths + SHA256 hashes — not per-line locators. Line-locators live in
canonical content (when they exist) and informally in
`stocktake/reports/cad-aux.md` §5. This script is the pre-registered
verification infrastructure; it fires in earnest once Phase 3
(`\\unchecked` discharge) starts adding `references/text/<file>:<line>`
citations in summary.tex / GLOSSARY entries.

Canonical content scanned:
  - summary.tex
  - GLOSSARY.md, CONVENTIONS.md, ERRATA.md, CITATION_INDEX.md, PROVENANCE.md
  - MIGRATION_LOG.md (in case discharge citations end up there)

Skipped (template / example references):
  - CLAUDE.md / AGENTS.md (the example template at Rule 7)
  - PRD.md (only structural mentions, not per-line citations)
  - stocktake/ (reports, not canonical content)
  - HANDOFF.md (session-end pointer, not canonical)
  - archive/ (deep storage)

Locator format detected: `references/text/<file>:<line>` where the line
number is a positive integer and the file matches one of the .txt/.md
entries in references/text/.

Output: per-locator PASS/FAIL plus a summary line. Exit 0 on all PASS
(or zero locators found); exit 1 on any FAIL.
"""

import re
from pathlib import Path

REPO = Path("/home/tobias/Projects/cft-anyons")

CANONICAL_FILES = [
    "summary.tex",
    "GLOSSARY.md",
    "CONVENTIONS.md",
    "ERRATA.md",
    "CITATION_INDEX.md",
    "PROVENANCE.md",
    "MIGRATION_LOG.md",
]

# Pattern: references/text/<file>:<lineno>
# Optional surrounding `backticks` or quoting.
LOCATOR_RE = re.compile(r"references/text/([A-Za-z0-9_./-]+):(\d+)")


def scan_file(rel_path: str) -> list[tuple[str, int, str, int]]:
    """Return list of (canonical_file, line_in_canonical, ref_file, ref_line)."""
    p = REPO / rel_path
    if not p.exists():
        return []
    locs: list[tuple[str, int, str, int]] = []
    for i, line in enumerate(p.read_text().splitlines(), start=1):
        for m in LOCATOR_RE.finditer(line):
            ref_file = m.group(1)
            ref_line = int(m.group(2))
            locs.append((rel_path, i, ref_file, ref_line))
    return locs


def verify_locator(ref_file: str, ref_line: int) -> tuple[bool, str]:
    target = REPO / "references" / "text" / ref_file
    if not target.exists():
        return False, f"file not found: references/text/{ref_file}"
    lines = target.read_text().splitlines()
    if ref_line < 1 or ref_line > len(lines):
        return False, f"line {ref_line} out of range (file has {len(lines)} lines)"
    content = lines[ref_line - 1].strip()
    if not content:
        return False, f"line {ref_line} is empty / whitespace only"
    snippet = content[:80] + ("..." if len(content) > 80 else "")
    return True, snippet


def main() -> int:
    all_locs: list[tuple[str, int, str, int]] = []
    for cf in CANONICAL_FILES:
        all_locs.extend(scan_file(cf))

    if not all_locs:
        print("=== P2.3 gate ===")
        print(f"Scanned canonical files: {', '.join(CANONICAL_FILES)}")
        print("Locators found: 0")
        print("Verdict: VACUOUS PASS (gate fires in earnest when Phase 3")
        print("         starts adding `references/text/<file>:<line>` citations).")
        return 0

    passes = 0
    failures: list[str] = []
    print("=== P2.3 gate ===")
    print(f"Locators found: {len(all_locs)}")
    for cf, cl, ref_file, ref_line in all_locs:
        ok, msg = verify_locator(ref_file, ref_line)
        if ok:
            passes += 1
            print(f"  PASS  {cf}:{cl}  ->  references/text/{ref_file}:{ref_line}  '{msg}'")
        else:
            failures.append(f"{cf}:{cl} -> references/text/{ref_file}:{ref_line}: {msg}")
            print(f"  FAIL  {cf}:{cl}  ->  references/text/{ref_file}:{ref_line}  ({msg})")

    print(f"\n=== Summary: {passes}/{len(all_locs)} PASS, {len(failures)} FAIL ===")
    if failures:
        return 1
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
