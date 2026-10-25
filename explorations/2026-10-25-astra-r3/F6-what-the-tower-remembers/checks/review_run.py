"""Reproduce the review's RED/GREEN runs without changing author artifacts.

Run from any cwd: python3 -I <path>/checks/review_run.py
Writes only checks/review_*. Original checks and outputs remain untouched.
"""
from datetime import datetime, timezone
from hashlib import sha256
import json
from pathlib import Path
import subprocess
import sys

BASE = Path(__file__).resolve().parent
ROOT = BASE.parents[3]


def digest(path):
    return sha256(path.read_bytes()).hexdigest()


def run():
    records = []
    for name, script, mutation, expected, marker in (
        ('original_trace', 'check_f6.py', 'trace', 1, 'trace normalization'),
        ('original_support', 'check_f6.py', 'support', 1, 'full stationary vertices'),
        ('original_crossing', 'check_f6.py', 'crossing', 1, 'marked alpha2 crossing extraction'),
        ('original_green', 'check_f6.py', None, 0, 'GREEN: 6 invariant groups'),
        ('twisted_dagger', 'review_twisted_refinement.py', 'dagger', 1, 'trailing square (7)'),
        ('twisted_extraction', 'review_twisted_refinement.py', 'extraction', 1, 'compression (10)'),
        ('twisted_green', 'review_twisted_refinement.py', None, 0, '54 matrix units'),
    ):
        command = [sys.executable, '-I', str(BASE/script)]
        if mutation:
            command += ['--mutation', mutation]
        result = subprocess.run(command, cwd=ROOT, capture_output=True, text=True, timeout=60)
        raw = result.stdout + result.stderr
        output = BASE / f'review_{name}.txt'
        output.write_text(raw)
        assert result.returncode == expected, (name, result.returncode, raw)
        assert marker in raw, (name, 'expected assertion/invariant marker absent')
        records.append({'command': command, 'exit_status': result.returncode,
                        'output': output.name, 'sha256': digest(output)})
        print(f'PASS {name}: exit {expected}; verified {marker}')

    # Verify, rather than silently trust, the original supplied hash inventory.
    for row in (BASE/'sha256.txt').read_text().splitlines():
        expected, name = row.split(maxsplit=1)
        path = ROOT/name if '/' in name else BASE/name
        assert digest(path) == expected, ('author artifact hash mismatch', name)
    print('PASS original supplied SHA256 inventory')
    manifest = {
        'utc': datetime.now(timezone.utc).isoformat(),
        'python': sys.version,
        'note_sha256': digest(BASE.parent/'NOTE.md'),
        'inputs': {name: digest(BASE/name) for name in
                   ('check_f6.py', 'review_twisted_refinement.py', 'review_run.py')},
        'runs': records,
        'scope': 'Exact finite calibrations only; proofs and source audit are in ../REVIEW.md.'
    }
    (BASE/'review_manifest.json').write_text(json.dumps(manifest, indent=2)+'\n')
    print('GREEN: 2 restored runs, 5 intended assertion failures, original hashes verified')


if __name__ == '__main__':
    run()
