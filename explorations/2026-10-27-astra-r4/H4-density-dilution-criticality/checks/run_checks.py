#!/usr/bin/env python3
"""Reproduce the H4 check bundle and record intentional RED mutations.

Run from any directory: OPENBLAS_NUM_THREADS=1 python3 <this file>
Writes only beside this file. Each subprocess is capped at 90 seconds.
"""
import hashlib
import json
import os
from pathlib import Path
import platform
import subprocess
import sys
import time

import numpy
import sympy

root = Path(__file__).resolve().parent
env = dict(os.environ, OPENBLAS_NUM_THREADS="1", OMP_NUM_THREADS="1",
           PYTHONDONTWRITEBYTECODE="1")
specs = {
    "algebra_checks.py": ["number", "pullback", "refill"],
    "spectral_checks.py": ["laplacian", "quartic", "twist"],
    "ks_checks.py": ["sine", "current"],
}
record = {
    "python": platform.python_version(),
    "numpy": numpy.__version__,
    "sympy": sympy.__version__,
    "environment": {key: env[key] for key in
                    ["OPENBLAS_NUM_THREADS", "OMP_NUM_THREADS", "PYTHONDONTWRITEBYTECODE"]},
    "max_dense_dimension": 256,
    "source_sha256": {},
    "runs": [],
}
for script, mutations in specs.items():
    record["source_sha256"][script] = hashlib.sha256((root / script).read_bytes()).hexdigest()
    for mutation in [None] + mutations:
        command = [sys.executable, script]
        if mutation is not None:
            command += ["--mutate", mutation]
        start = time.monotonic()
        result = subprocess.run(command, cwd=root, env=env, text=True,
                                stdout=subprocess.PIPE, stderr=subprocess.STDOUT,
                                timeout=90, check=False)
        label = Path(script).stem + ("_green" if mutation is None else "_red_" + mutation)
        output = root / (label + ".txt")
        output.write_text(result.stdout)
        expected = 0 if mutation is None else 1
        run = {"command": command, "expected_exit": expected,
               "actual_exit": result.returncode, "output": output.name,
               "output_sha256": hashlib.sha256(output.read_bytes()).hexdigest(),
               "elapsed_seconds": round(time.monotonic() - start, 3)}
        record["runs"].append(run)
        (root / "manifest.json").write_text(json.dumps(record, indent=2) + "\n")
        assert result.returncode == expected, (label, result.returncode, result.stdout)
        if mutation is not None:
            assert "AssertionError" in result.stdout, (label, result.stdout)
        print(f"PASS {label}: exit {result.returncode}, {run['elapsed_seconds']:.3f}s", flush=True)

print("ALL 3 GREEN RUNS PASSED; ALL 8 MUTATIONS CAUGHT; MAX DENSE DIMENSION 256")
