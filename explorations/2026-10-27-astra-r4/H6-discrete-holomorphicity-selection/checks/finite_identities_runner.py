#!/usr/bin/env python3
"""Run finite_identities.py with two mutations; write only its adjacent log."""
from pathlib import Path
import subprocess
import sys
root = Path(__file__).resolve().parent
out = []
for flags, expected in [((),0), (('--mutate-prefix',),1),
                        (('--mutate-shared-edge',),1), ((),0)]:
    p = subprocess.run([sys.executable, str(root/'finite_identities.py'), *flags],
                       capture_output=True, text=True, timeout=45)
    out.extend(['COMMAND: python3 finite_identities.py '+' '.join(flags),
                p.stdout, p.stderr, f'EXIT {p.returncode}; EXPECTED {expected}'])
    assert p.returncode == expected, '\n'.join(out)
out.append('PASS: baseline GREEN; both mutations RED; restored baseline GREEN')
log = '\n'.join(out)+'\n'
(root/'finite_identities.txt').write_text(log)
print(log)
