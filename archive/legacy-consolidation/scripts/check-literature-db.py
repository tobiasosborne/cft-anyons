#!/usr/bin/env python3
"""P2.5 gate: verify literature/db/papers.sqlite integrity and row counts.

Runs `PRAGMA integrity_check;` (must return `ok`) and enumerates every
table in the DB via `sqlite_master`, reporting row counts. The C-gate
specifically requires:

    papers     >= 630
    citations  >= 702

per the SYNTHESIS.md anchor (the lower bound — if curation has grown the
DB on a different device beyond the SYNTHESIS-claimed baseline that is
still a PASS; an under-count is the FAIL):

    literature/SYNTHESIS.md:20-21
      "As of 2026-04-27 the SQLite-backed DB has **630 papers,
       702 citation edges, 350+ local PDFs, 16 anchor seeds**."

Exit 0 on PASS (integrity_check = ok AND both count thresholds met);
exit 1 on FAIL. Mirrors the `scripts/check-references-sha256.py`
exit-code convention.

Note: `literature/db/papers.sqlite` is gitignored (.gitignore:61). The
DB is a per-machine local cache populated from the source project's
copy at `microscopic-mobile-anyons/literature/db/papers.sqlite`; see
HANDOFF.md Phase-2 section for the cross-device transfer story. This
script reads the local copy at the repo-relative path; it does not
fetch / sync anything.

Plan reference: MIGRATION_PLAN.md P2.5 (line 155).
"""

import sqlite3
from pathlib import Path

REPO = Path(__file__).resolve().parent.parent
DB = REPO / "literature" / "db" / "papers.sqlite"

# C-gate thresholds (lower bounds per SYNTHESIS.md:20-21).
THRESHOLDS = {
    "papers": 630,
    "citations": 702,
}


def main() -> int:
    if not DB.exists():
        print(f"FAIL: DB not found at {DB}")
        print(
            "  Expected per HANDOFF.md: cp the populated DB from\n"
            "  microscopic-mobile-anyons/literature/db/papers.sqlite into\n"
            "  literature/db/papers.sqlite (gitignored per .gitignore:61).",
        )
        return 1

    conn = sqlite3.connect(DB)
    cur = conn.cursor()

    # --- integrity_check ------------------------------------------------
    cur.execute("PRAGMA integrity_check;")
    integrity = cur.fetchall()
    integrity_ok = integrity == [("ok",)]

    print(f"DB: {DB}")
    print(f"PRAGMA integrity_check: {integrity}  [{'PASS' if integrity_ok else 'FAIL'}]")

    # --- enumerate every table via sqlite_master ------------------------
    cur.execute(
        "SELECT name FROM sqlite_master WHERE type='table' "
        "AND name NOT LIKE 'sqlite_%' ORDER BY name",
    )
    tables = [row[0] for row in cur.fetchall()]

    counts: dict[str, int] = {}
    for t in tables:
        # Identifier comes from sqlite_master; not user input. Quote
        # defensively against any odd table names so SQL parser is happy.
        cur.execute(f'SELECT COUNT(*) FROM "{t}"')
        counts[t] = cur.fetchone()[0]

    # --- per-table table ------------------------------------------------
    print("\n=== Row counts (all tables) ===")
    name_w = max((len(t) for t in tables), default=8)
    print(f"  {'table'.ljust(name_w)}  {'rows':>10}")
    print(f"  {'-' * name_w}  {'-' * 10}")
    for t in tables:
        print(f"  {t.ljust(name_w)}  {counts[t]:>10}")

    # --- C-gate threshold check ----------------------------------------
    print("\n=== C-gate thresholds (per SYNTHESIS.md:20-21) ===")
    gate_failures: list[str] = []
    for table, threshold in THRESHOLDS.items():
        actual = counts.get(table)
        if actual is None:
            gate_failures.append(f"{table}: table missing from DB")
            print(f"  FAIL {table}: table not present (expected >= {threshold})")
            continue
        if actual >= threshold:
            print(f"  PASS {table}: {actual} >= {threshold}")
        else:
            gate_failures.append(
                f"{table}: {actual} < {threshold} (under-count)",
            )
            print(f"  FAIL {table}: {actual} < {threshold} (under-count)")

    # --- overall summary -----------------------------------------------
    all_pass = integrity_ok and not gate_failures
    print("\n=== Summary ===")
    print(f"  integrity_check : {'PASS' if integrity_ok else 'FAIL'}")
    print(f"  C-gate counts   : {'PASS' if not gate_failures else 'FAIL'}")
    print(f"  Overall         : {'PASS' if all_pass else 'FAIL'}")

    if not all_pass:
        print("\nFAILURES (stop condition per MIGRATION_PLAN P2.5):")
        if not integrity_ok:
            print(f"  PRAGMA integrity_check returned: {integrity}")
        for f in gate_failures:
            print(f"  {f}")
        return 1
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
