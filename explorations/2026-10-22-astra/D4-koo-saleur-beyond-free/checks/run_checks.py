"""Retain rejected mutations, a restored run, and the exact producer hashes."""
import hashlib
import json
import os
from pathlib import Path
import subprocess
import sys

root = Path(__file__).resolve().parent
env = dict(os.environ, OPENBLAS_NUM_THREADS="1", OMP_NUM_THREADS="1",
           MKL_NUM_THREADS="1", PYTHONDONTWRITEBYTECODE="1")
mutations = ["fourier_sign", "leakage_sign", "central_shift",
             "regularity_power", "ope_index"]
results = []
# Deliberately run RED before the restored implementation; each must assert.
for mutation in mutations + ["none"]:
    completed = subprocess.run([sys.executable, str(root/"check.py"),
                                "--mutation", mutation], capture_output=True,
                               text=True, env=env, timeout=60)
    filename = "restored.txt" if mutation == "none" else f"red_{mutation}.txt"
    (root/filename).write_text(completed.stdout+completed.stderr)
    if mutation == "none":
        assert completed.returncode == 0, completed.stdout+completed.stderr
        assert "ALL EXACT CHECKS PASSED" in completed.stdout
    else:
        assert completed.returncode != 0 and "AssertionError" in completed.stderr, filename
    results.append({"mutation": mutation, "exit_code": completed.returncode,
                    "raw_output": filename})
    print(f"{mutation}: {'restored PASS' if mutation == 'none' else 'rejected RED'}", flush=True)

hashes = {p.name: hashlib.sha256(p.read_bytes()).hexdigest()
          for p in [root/"check.py", root/"run_checks.py"]}
(root/"manifest.json").write_text(json.dumps({
    "command": "python3 explorations/2026-10-22-astra/D4-koo-saleur-beyond-free/checks/run_checks.py",
    "headline": "Five mutations rejected; exact algebra and scalar checks pass after restoration.",
    "maximum_matrix_dimension": 16, "producer_sha256": hashes,
    "results": results}, indent=2)+"\n")
