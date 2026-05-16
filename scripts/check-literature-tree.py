#!/usr/bin/env python3
"""P2.7 audit: compute the roll-up SHA256 digest of `literature/`.

`literature/` was imported in P2.4 (`e975def`) from the source project's
`microscopic-mobile-anyons/literature/`. Unlike `references/` (which carries
a per-file SHA256 manifest at `references/manifest/SOURCES.md`), the
literature tree has no per-file manifest — 387 files of mixed kinds
(SURVEY/SYNTHESIS markdown, per-paper subdirs under `md/`, PDFs under
`pdfs/`, archived metadata under `_archive/`, the bibliography
`references.bib`, plus the gitignored DB stack under `db/`).

This script computes a single **roll-up digest** that future agents (and
future Phase-2+ verifications) can use to spot drift cheaply, without
bloating PROVENANCE.md with 387 per-file rows. The digest construction:

    1. Enumerate every file under `literature/` EXCEPT the gitignored
       SQLite DB stack (`db/papers.sqlite`, `db/papers.sqlite-shm`,
       `db/papers.sqlite-wal`). These are per-machine caches not under
       version control (see `.gitignore:61`); their content varies by
       device and curation epoch.
    2. Sort the file paths lexicographically (deterministic ordering).
    3. SHA256 each file → list of `<hash>  <path>` lines.
    4. SHA256 of that combined list → the roll-up digest.

This is an audit tool, not a gate: it always exits 0. The roll-up
digest goes into `PROVENANCE.md` so future agents can re-run this
script and notice any drift in the imported literature tree.

Plan reference: MIGRATION_PLAN.md P2.7 (line 157).
"""

import hashlib
from pathlib import Path

REPO = Path(__file__).resolve().parent.parent
LITERATURE = REPO / "literature"

# Gitignored per .gitignore:61 — per-machine local cache, not under
# version control. Exclude from the roll-up digest so the digest is
# stable across devices.
EXCLUDED_NAMES = {
    "papers.sqlite",
    "papers.sqlite-shm",
    "papers.sqlite-wal",
    "papers.sqlite-journal",
}


def file_sha256(path: Path) -> str:
    h = hashlib.sha256()
    with path.open("rb") as f:
        for chunk in iter(lambda: f.read(65536), b""):
            h.update(chunk)
    return h.hexdigest()


def main() -> int:
    if not LITERATURE.is_dir():
        print(f"FAIL: {LITERATURE} not found (expected per P2.4 import).")
        # Audit-only: still exit 0 (this is not a gate). Surface the
        # missing-tree case clearly so a future agent can notice.
        return 0

    files: list[Path] = []
    excluded: list[Path] = []
    for p in sorted(LITERATURE.rglob("*")):
        if not p.is_file():
            continue
        # Exclude the gitignored DB stack under db/.
        if p.parent.name == "db" and p.name in EXCLUDED_NAMES:
            excluded.append(p)
            continue
        files.append(p)

    total_bytes = sum(p.stat().st_size for p in files)

    # Per-file lines: "<sha256>  <repo-relative path>\n"
    lines: list[bytes] = []
    for p in files:
        rel = p.relative_to(REPO).as_posix()
        digest = file_sha256(p)
        lines.append(f"{digest}  {rel}\n".encode("utf-8"))

    # Roll-up digest: SHA256 of the concatenated per-file lines.
    rollup = hashlib.sha256(b"".join(lines)).hexdigest()

    print(f"literature/ roll-up audit (P2.7)")
    print(f"--------------------------------")
    print(f"Tree root         : {LITERATURE}")
    print(f"Files included    : {len(files)}")
    print(f"Files excluded    : {len(excluded)}  "
          f"(gitignored DB stack per .gitignore:61)")
    if excluded:
        for p in excluded:
            print(f"  - {p.relative_to(REPO).as_posix()}")
    print(f"Total size (incl.): {total_bytes} bytes")
    print(f"Roll-up SHA256    : {rollup}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
