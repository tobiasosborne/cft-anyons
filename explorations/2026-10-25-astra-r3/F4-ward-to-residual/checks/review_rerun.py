"""Rerun author checks unchanged; redirect only their artifact destinations.

Run from repo root with PYTHONDONTWRITEBYTECODE=1 OPENBLAS_NUM_THREADS=1.
All writes are review_* in this directory. No existing artifact is replaced.
"""
import hashlib
import json
import os
from pathlib import Path
import subprocess
import sys

HERE = Path(__file__).resolve().parent
CHILD = r'''
from pathlib import Path
import runpy, sys
script = Path(sys.argv[1]).resolve()
base = script.parent
original_write_text = Path.write_text
def redirected_write_text(self, data, *args, **kwargs):
    target = self.resolve()
    assert target.parent == base, f"unexpected artifact destination: {target}"
    return original_write_text(base / ("review_rerun_" + target.name),
                               data, *args, **kwargs)
Path.write_text = redirected_write_text
sys.path.insert(0, str(base))
sys.argv = [str(script)] + sys.argv[2:]
runpy.run_path(str(script), run_name="__main__")
'''


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def main():
    protected = [HERE.parent / "NOTE.md"] + sorted(
        p for p in HERE.iterdir() if not p.name.startswith("review_"))
    protected = [p for p in protected if p.is_file()]
    before = {str(p): sha(p) for p in protected}
    cases = [
        ("fermion", "fermion_check.py", [], 0),
        ("ks", "ks_converse_check.py", [], 0),
        ("qutrit", "reviewer_qutrit.py", [], 0),
        ("wrap_red", "fermion_check.py", ["--mutate-wrap"], 1),
        ("collar_red", "fermion_check.py", ["--mutate-collar"], 1),
        ("current_red", "ks_converse_check.py", ["--mutate-current-factor"], 1),
    ]
    records = []
    for name, filename, args, expected in cases:
        command = [sys.executable, "-B", "-c", CHILD, str(HERE / filename), *args]
        env = dict(os.environ, PYTHONDONTWRITEBYTECODE="1", OPENBLAS_NUM_THREADS="1")
        run = subprocess.run(command, capture_output=True, text=True, env=env,
                             timeout=60)
        output = run.stdout + run.stderr
        (HERE / f"review_rerun_{name}.txt").write_text(output)
        assert run.returncode == expected, (name, run.returncode, output)
        if expected:
            assert "AssertionError" in output, (name, output)
        records.append(dict(case=name, script=filename, args=args,
                            returncode=run.returncode, source_sha256=sha(HERE / filename)))
        print(f"PASS {name}: returncode={run.returncode}, raw=review_rerun_{name}.txt")
    assert before == {str(p): sha(p) for p in protected}, "original artifact changed"
    (HERE / "review_rerun_manifest.json").write_text(json.dumps(
        dict(cases=records, protected_sha256=before,
             artifact_policy="Path.write_text destinations redirected; script source unchanged"),
        indent=2) + "\n")
    print("PASS original NOTE.md, scripts and original artifacts unchanged")


if __name__ == "__main__":
    main()
