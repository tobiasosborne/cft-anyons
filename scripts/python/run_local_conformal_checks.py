"""Produce the exact-identity and rejected-mutation evidence bundle.

Command: python3 scripts/python/run_local_conformal_checks.py
No model, finite-size physics computation, network or Git operation.
"""
from pathlib import Path
import hashlib
import json
import os
import re
import subprocess
import sys
import sympy

root = Path(__file__).resolve().parents[2]
output = root / "runs/2026-10-21-local-conformal-consistency"
output.mkdir(parents=True, exist_ok=True)
test = root / "scripts/python/test_local_conformal_identities.py"
records = []
for mutation in ("", "hoch_sign", "ward_sign", "circle_sign", "taylor_factor", "mixed_sign", ""):
    tag = mutation or ("green_restored" if records else "green_initial")
    environment = os.environ.copy()
    environment["CFT_IDENTITY_MUTATION"] = mutation
    process = subprocess.run([sys.executable, str(test)], cwd=root,
                             env=environment, capture_output=True, text=True,
                             timeout=30)
    transcript = process.stdout + process.stderr
    (output / f"{tag}.txt").write_text(transcript)
    count = re.search(r"Ran (\d+) tests", transcript)
    assert count and int(count.group(1)) == 11, (tag, transcript)
    if mutation:
        failures = re.findall(r"^FAIL: (\w+)", transcript, re.MULTILINE)
        expected = {
            "hoch_sign": {"test_hochschild_square_zero_on_one_cochain",
                          "test_hochschild_square_zero_on_two_cochain",
                          "test_first_and_second_order_obstruction_signs"},
            "ward_sign": {"test_ward_equation_propagates_through_sewing"},
            "circle_sign": {"test_circle_exponential_bracket_sign"},
            "taylor_factor": {"test_taylor_ward_coefficient_matches_differentiation"},
            "mixed_sign": {"test_hochschild_differential_is_equivariant"},
        }[mutation]
        assert process.returncode == 1 and set(failures) == expected, (tag, transcript)
        assert "ERROR:" not in transcript, (tag, transcript)
    else:
        failures = []
        assert process.returncode == 0 and transcript.rstrip().endswith("OK"), transcript
    records.append({"case": tag, "returncode": process.returncode,
                    "tests": 11, "expected_failures": failures})

producers = [Path(__file__).resolve(), test, root / "scripts/python/local_conformal_identities.py"]
result = {"scope": "Universal formal identities; no CFT existence or lattice convergence claim",
          "python": sys.version.split()[0], "sympy": sympy.__version__, "cases": records,
          "sha256": {str(path.relative_to(root)): hashlib.sha256(path.read_bytes()).hexdigest()
                     for path in producers}}
(output / "results.json").write_text(json.dumps(result, indent=2) + "\n")
print("11 exact symbolic tests pass; five mutations rejected; restored run passes.")
