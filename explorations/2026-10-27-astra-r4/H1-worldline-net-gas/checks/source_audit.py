"""Offline source audit; run from repository root. Output is a raw search log.

P1/P2: distinguish located probabilistic source statements from missing
general-category net-ensemble theorems. No absence-of-theorem claim is
inferred just from a failed string search.
"""
from pathlib import Path
import subprocess
import sys

ROOT = Path(__file__).resolve().parents[4]
QUERIES = [
    ("Markov", r"\bMarkov\b"),
    ("loop model", r"loop[ -]models?"),
    ("O(n)", r"O\(n\)"),
    ("CLE", r"\bCLE\b"),
    ("Schramm", r"Schramm"),
    ("domain Markov", r"domain[ -]Markov"),
    ("SLE", r"\bSLE\b"),
]
print("OFFLINE SOURCE AUDIT: references/ and literature/md/")
print("Python:", sys.version.split()[0])
print("Command: python3 explorations/2026-10-27-astra-r4/"
      "H1-worldline-net-gas/checks/source_audit.py")
for label, pattern in QUERIES:
    cmd = ["rg", "-n", "-i", "--glob", "*.md", "--glob", "*.tex",
           "--glob", "*.txt", "--", pattern, "references", "literature/md"]
    result = subprocess.run(cmd, cwd=ROOT, capture_output=True, text=True)
    assert result.returncode in (0, 1), (cmd, result.stderr)
    lines = result.stdout.splitlines()
    files = {line.split(":", 1)[0] for line in lines}
    print(f"\nQUERY {label!r}: {len(lines)} matching lines in {len(files)} files")
    print(result.stdout, end="")
print("\nEND: duplicate source/extraction hits and bibliography-only hits retained.")
print("This search is an evidence index, not a completeness proof.")
