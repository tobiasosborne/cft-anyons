#!/usr/bin/env python3
"""Record baseline, rejected mutations, restoration, and source hashes locally."""
import hashlib
import json
from pathlib import Path
import platform
import subprocess
import sys
import sympy

here = Path(__file__).resolve().parent
script = here / "check.py"
mutations = ["ward_weight", "shift_sign", "mixed_product", "recurrence", "derivative"]
records = []
for name in ["baseline", *mutations, "restored"]:
    command = [sys.executable, str(script)]
    if name in mutations:
        command += ["--mutate", name]
    result = subprocess.run(command, text=True, capture_output=True, check=False)
    expected = 1 if name in mutations else 0
    log = (f"COMMAND: {' '.join(command)}\nEXIT: {result.returncode}\n"
           + result.stdout + result.stderr)
    (here / f"{name}.txt").write_text(log)
    assert result.returncode == expected, f"Unexpected status for {name}: {log}"
    if name in mutations:
        assert "AssertionError:" in result.stderr, f"Mutation failed for wrong reason: {log}"
    records.append({"case": name, "exit": result.returncode,
                    "artifact": f"{name}.txt"})
    print(f"PASS {name}: expected exit {expected}")

paths = [script, here / "run_checks.py", here.parent / "NOTE.md"]
manifest = {"python": platform.python_version(),
            "sympy": sympy.__version__,
            "headline": "Five exact groups pass; five mathematical mutations rejected; restored pass.",
            "scope": "Finite identities and isolated obstruction witnesses, not full E4 proof.",
            "runs": records,
            "sha256": {str(p.relative_to(here.parent)): hashlib.sha256(p.read_bytes()).hexdigest()
                       for p in paths}}
(here / "manifest.json").write_text(json.dumps(manifest, indent=2) + "\n")
