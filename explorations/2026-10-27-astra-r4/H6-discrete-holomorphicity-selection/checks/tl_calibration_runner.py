#!/usr/bin/env python3
"""Run the exact calibration and require each independent mutation to fail.

Command (repo root):
python3 explorations/2026-10-27-astra-r4/H6-discrete-holomorphicity-selection/checks/tl_calibration_runner.py
Writes only tl_calibration.txt next to this file.
"""

from pathlib import Path
import subprocess
import sys

directory = Path(__file__).resolve().parent
script = directory / "tl_calibration.py"
runs = [((), 0), (("--mutate-weight",), 1),
        (("--mutate-spin",), 1), (("--mutate-loop-sign",), 1), ((), 0)]
output = []
for flags, expected in runs:
    command = [sys.executable, str(script), *flags]
    result = subprocess.run(command, capture_output=True, text=True, timeout=30)
    output.extend(["COMMAND: python3 " + script.name + " " + " ".join(flags),
                   result.stdout.rstrip(), result.stderr.rstrip(),
                   f"EXIT: {result.returncode}; EXPECTED: {expected}", ""])
    assert result.returncode == expected, "\n".join(output)
output.append("PASS: baseline GREEN; all three mutations RED; restored baseline GREEN")
log = "\n".join(output) + "\n"
(directory / "tl_calibration.txt").write_text(log)
print(log)
