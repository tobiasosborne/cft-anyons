#!/usr/bin/env python3
"""Independent review rerun; preserve all author and earlier reviewer outputs.

Command: python3 -I checks/review_r3_rerun.py (from this note directory).
Only review_r3_* files next to this script are written. Exact source
invariants and mutation sentinels are checked, not mere successful exits.
"""
import hashlib
import json
import subprocess
import sys
import time
from datetime import datetime, timezone
from pathlib import Path

root = Path(__file__).resolve().parent
cases = (
    ("check_blocked_lift.py", "--omit-vacancy-shuffle", "exact dyadic V fails", "GREEN:"),
    ("associator_exact.py", "--mutate-associator", "associator obstruction disappeared", "PASS:"),
    ("associator_general_exact.py", "--mutate-sign", "G1 formal monomial identity failed", "PASS:"),
    ("review_block_exact.py", "--mutate-shuffle", "exact dyadic point identity failed", "PASS:"),
)
records = []
for script, mutation, red_sentinel, green_sentinel in cases:
    for flag, sentinel, expected in ((mutation, red_sentinel, 1), (None, green_sentinel, 0)):
        command = [sys.executable, "-I", str(root / script)] + ([flag] if flag else [])
        name = f"review_r3_{Path(script).stem}_{'red' if flag else 'green'}.txt"
        start = time.monotonic()
        result = subprocess.run(command, cwd=root, stdout=subprocess.PIPE,
                                stderr=subprocess.STDOUT, text=True, timeout=180)
        elapsed = time.monotonic() - start
        (root / name).write_text(result.stdout)
        assert result.returncode == expected, (script, flag, result.returncode, name)
        assert sentinel in result.stdout, (script, "invariant sentinel missing", name)
        records.append(dict(command=command, exit=result.returncode,
                            elapsed_seconds=round(elapsed, 3), output=name,
                            sha256_script=hashlib.sha256((root / script).read_bytes()).hexdigest(),
                            sha256_output=hashlib.sha256((root / name).read_bytes()).hexdigest()))
        print(f"{'EXPECTED RED' if flag else 'GREEN'} {script}: {elapsed:.3f}s; {sentinel}", flush=True)
manifest = dict(utc=datetime.now(timezone.utc).isoformat(), runs=records,
                note_sha256=hashlib.sha256((root.parent / "NOTE.md").read_bytes()).hexdigest())
(root / "review_r3_rerun_manifest.json").write_text(json.dumps(manifest, indent=2) + "\n")
print("PASS: four exact baselines and four invariant-specific rejected mutations")
