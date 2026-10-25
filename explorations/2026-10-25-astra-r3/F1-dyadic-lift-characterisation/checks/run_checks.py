#!/usr/bin/env python3
"""Reproduce the exact F1 checks, expected mutations first, with a manifest.

Run from any directory: python3 -I /absolute/path/to/checks/run_checks.py
Only this checks directory is written. No network or external packages.
Mathematical conventions and scope: ../NOTE.md and README.md.
"""

import hashlib
import json
import platform
import subprocess
import sys
import time
from datetime import datetime, timezone
from pathlib import Path


root = Path(__file__).resolve().parent
cases = [
    ("check_blocked_lift.py", "--omit-vacancy-shuffle", "blocked_lift_red.txt",
     "exact dyadic V fails"),
    ("check_blocked_lift.py", None, "blocked_lift_output.txt", "GREEN:"),
    ("associator_exact.py", "--mutate-associator", "associator_red.txt",
     "associator obstruction disappeared"),
    ("associator_exact.py", None, "associator_output.txt", "PASS:"),
    ("associator_general_exact.py", "--mutate-sign", "associator_general_red.txt",
     "G1 formal monomial identity failed"),
    ("associator_general_exact.py", None, "associator_general_output.txt", "PASS:"),
    ("review_block_exact.py", "--mutate-shuffle", "review_block_red.txt",
     "exact dyadic point identity failed"),
    ("review_block_exact.py", None, "review_block_output.txt", "PASS:"),
]
records = []
for script, mutation, output, sentinel in cases:
    command = [sys.executable, "-I", str(root / script)]
    if mutation:
        command.append(mutation)
    start = time.monotonic()
    result = subprocess.run(command, cwd=root, text=True, stdout=subprocess.PIPE,
                            stderr=subprocess.STDOUT, timeout=180, check=False)
    elapsed = round(time.monotonic() - start, 3)
    (root / output).write_text(result.stdout)
    expected_code = 1 if mutation else 0
    assert result.returncode == expected_code, (script, result.returncode, output)
    assert sentinel in result.stdout, (script, "missing invariant sentinel", output)
    records.append({"command": command, "returncode": result.returncode,
                    "expected_mutation_failure": bool(mutation),
                    "elapsed_seconds": elapsed, "output": output})
    print(f"{'RED expected' if mutation else 'GREEN'}: {script} "
          f"({elapsed}s; exit {result.returncode})", flush=True)

files = sorted(path for path in root.iterdir()
               if path.is_file() and path.suffix in (".py", ".txt", ".md"))
manifest = {
    "utc": datetime.now(timezone.utc).isoformat(),
    "python": platform.python_version(),
    "arithmetic": "Exact standard-library integers, symbolic monomials, sparse permutations",
    "claim_boundary": "Finite checks calibrate the proofs in ../NOTE.md; no all-L inference from cutoff",
    "runs": records,
    "sha256": {path.name: hashlib.sha256(path.read_bytes()).hexdigest() for path in files},
}
(root / "manifest.json").write_text(json.dumps(manifest, indent=2) + "\n")
print("PASS: four baselines and four discriminating mutations; manifest.json written")
