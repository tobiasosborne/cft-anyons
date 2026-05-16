#!/usr/bin/env python3
"""P2.2: verify SHA256 of every file under references/ against the
manifest at references/manifest/SOURCES.md.

Two tables in the manifest:
  1. Primary Local Sources: 16 rows, SHA256 is of the local file
     (PDF in most rows; .md in the SRC-PENNEYS-UFC row).
  2. Extracted Text Hashes: 17 rows, SHA256 is of the text file.

Any mismatch is a stop condition (per MIGRATION_PLAN P2.2).
"""

import hashlib
import re
from pathlib import Path

REPO = Path("/home/tobias/Projects/cft-anyons")
MANIFEST = REPO / "references" / "manifest" / "SOURCES.md"


def file_sha256(path: Path) -> str:
    h = hashlib.sha256()
    with open(path, "rb") as f:
        while chunk := f.read(1024 * 1024):
            h.update(chunk)
    return h.hexdigest()


def parse_manifest() -> tuple[list[tuple[str, str, str]], list[tuple[str, str]]]:
    text = MANIFEST.read_text()
    primary: list[tuple[str, str, str]] = []  # (src_id, local_file, sha256)
    extracted: list[tuple[str, str]] = []  # (text_file, sha256)

    section = None
    for line in text.splitlines():
        if line.startswith("## Primary Local Sources"):
            section = "primary"
            continue
        if line.startswith("## Extracted Text Hashes"):
            section = "extracted"
            continue
        if line.startswith("## Notes"):
            section = None
            continue

        # Match table row: | ... | ... | ... | ... |
        m = re.match(r"^\|\s*(.+?)\s*\|", line)
        if not m or "Source ID" in line or "---" in line or "Text file" in line:
            continue

        cells = [c.strip() for c in line.strip().strip("|").split("|")]
        if section == "primary" and len(cells) == 4:
            src_id, local_file, extracted_text, sha = cells
            local_file = local_file.strip("`")
            sha = sha.strip("`")
            primary.append((src_id, local_file, sha))
        elif section == "extracted" and len(cells) == 2:
            text_file, sha = cells
            text_file = text_file.strip("`")
            sha = sha.strip("`")
            extracted.append((text_file, sha))

    return primary, extracted


def main() -> int:
    primary, extracted = parse_manifest()
    print(f"Parsed manifest: {len(primary)} primary + {len(extracted)} extracted rows")

    failures: list[str] = []
    passes = 0

    print("\n=== Primary Local Sources ===")
    for src_id, local_file, expected_sha in primary:
        path = REPO / local_file
        if not path.exists():
            failures.append(f"{src_id}: MISSING file {local_file}")
            print(f"  FAIL {src_id}: file not found")
            continue
        actual_sha = file_sha256(path)
        if actual_sha == expected_sha:
            passes += 1
            print(f"  PASS {src_id}  ({local_file})")
        else:
            failures.append(f"{src_id}: {local_file} hash mismatch: expected {expected_sha}, got {actual_sha}")
            print(f"  FAIL {src_id}: expected {expected_sha[:16]}..., got {actual_sha[:16]}...")

    print("\n=== Extracted Text Hashes ===")
    for text_file, expected_sha in extracted:
        path = REPO / text_file
        if not path.exists():
            failures.append(f"{text_file}: MISSING file")
            print(f"  FAIL {text_file}: file not found")
            continue
        actual_sha = file_sha256(path)
        if actual_sha == expected_sha:
            passes += 1
            print(f"  PASS {text_file}")
        else:
            failures.append(f"{text_file}: hash mismatch: expected {expected_sha}, got {actual_sha}")
            print(f"  FAIL {text_file}: expected {expected_sha[:16]}..., got {actual_sha[:16]}...")

    total = len(primary) + len(extracted)
    print(f"\n=== Summary: {passes}/{total} PASS, {len(failures)} FAIL ===")
    if failures:
        print("\nFAILURES (stop condition per MIGRATION_PLAN P2.2):")
        for f in failures:
            print(f"  {f}")
        return 1
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
