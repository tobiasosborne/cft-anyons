#!/usr/bin/env python3
"""Capture exact checks, rejected mutations, restored run and source hashes."""
from datetime import datetime, timezone
import hashlib
from pathlib import Path
import subprocess
import sys

here = Path(__file__).resolve().parent
repo = here.parents[3]
check = here / 'exact_checks.py'
record = [f'UTC: {datetime.now(timezone.utc).isoformat()}',
          'Headline: 8 exact structural check groups pass; 2 mutations rejected.',
          'No chain simulation. Largest matrix 8x8. No network.']
runs = [('baseline', [], None),
        ('RED brick ordering', ['--mutate-brick-order'],
         'brick commutator oracle failed'),
        ('RED Gram inversion', ['--mutate-gram-inverse'],
         'Gram inverse oracle failed'),
        ('restored', [], None)]
for name, flags, expected in runs:
    cmd = [sys.executable, str(check), *flags]
    result = subprocess.run(cmd, cwd=repo, capture_output=True, text=True)
    record.extend(['', name, '$ python3 '+str(check.relative_to(repo))
                   +(' '+' '.join(flags) if flags else ''),
                   result.stdout.rstrip(), result.stderr.rstrip(),
                   f'exit={result.returncode}'])
    if expected:
        assert result.returncode != 0 and expected in result.stderr, name
    else:
        assert result.returncode == 0, name
        assert 'ALL 8 EXACT CHECK GROUPS PASSED' in result.stdout, name

paths = [Path(__file__), check, here.parent/'NOTE.md']
paths += [repo/p for p in [
    'references/text/PenneysUnitaryFusionCategories.md',
    'references/cft/AasenFendleyMong2020/source/_Statistical_mechanics_from_fusion_categories.tex',
    'references/cft/AasenFendleyMong2020/source/_Topological_defect_lines.tex',
    'references/cft/AasenFendleyMong2020/source/_fusion_categories_and_diagrammatics.tex',
    'references/lattice-symmetry/KooSaleur1993/source/9312156.tex',
    'references/lattice-symmetry/ZhouBatchelor1997/source/9611156.tex',
    'references/lattice-symmetry/ChelkakGlazmanSmirnov2016/source/StressTensor.tex',
    'literature/md/1408.1282/1408.1282.md',
    'literature/md/1608.04927/1608.04927.md']]
record.append('\nSHA256 current local artifacts:')
for path in paths:
    record.append(hashlib.sha256(path.read_bytes()).hexdigest()
                  +'  '+str(path.relative_to(repo)))
revision = '1f402aaf96d2ffb9d8efb0684836d4771bbd5f60'
record.append('\nSHA256 local Git blobs, revision '+revision+':')
for path in ['references/string-net/LevinWen2005/source/strnet.tex',
             'report/sections/86_spacetime_trotter_dictionary.tex',
             'report/sections/87_dilute_fibonacci_is_blocked_golden.tex']:
    blob = subprocess.run(['git','show',revision+':'+path], cwd=repo,
                          capture_output=True, check=True).stdout
    record.append(hashlib.sha256(blob).hexdigest()+'  '+path)
(here/'run.txt').write_text('\n'.join(record)+'\n')
print('PASS: baseline, 2 rejected mutations, restored run; wrote checks/run.txt')
