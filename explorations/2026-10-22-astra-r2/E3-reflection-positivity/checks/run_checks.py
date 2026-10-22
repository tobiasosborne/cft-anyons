"""Retain exact outputs, expected mutation failures, and provenance locally."""
import hashlib
import json
import os
from pathlib import Path
import platform
import subprocess
import sys
import sympy

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[3]
CASES = [
    ('check_seams.py', [], 'seams_output.txt', 0),
    ('check_categories.py', [], 'categories_output.txt', 0),
    ('check_seams.py', ['--mutate-reshuffle'], 'mutation_reshuffle_output.txt', 1),
    ('check_categories.py', ['--mutate-f'], 'mutation_f_output.txt', 1),
]


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


records = []
for script, flags, output, expected in CASES:
    args = [sys.executable, str(HERE/script), *flags]
    result = subprocess.run(args, cwd=ROOT, text=True, stdout=subprocess.PIPE,
                            stderr=subprocess.STDOUT,
                            env={**os.environ, 'PYTHONDONTWRITEBYTECODE': '1'})
    (HERE/output).write_text(result.stdout+f'\nEXIT_CODE={result.returncode}\n')
    assert result.returncode == expected, (script, flags, result.stdout)
    if expected:
        assert 'AssertionError' in result.stdout, result.stdout
    records.append({'script': script, 'flags': flags, 'output': output,
                    'expected_exit': expected, 'actual_exit': result.returncode})
    print('PASS', script, *flags, 'expected_exit', expected)

sources = [
    'references/text/PenneysUnitaryFusionCategories.md',
    'references/lattice-symmetry/KooSaleur1993/source/9312156.tex',
    'references/cft/Schottenloher2008/Schottenloher2008.md',
    'literature/md/1408.1282/1408.1282.md',
    'report/sections/78_categorical_selection_equations.tex',
    'report/sections/80_lattice_sewing_and_fidelity_certificate.tex',
    'CONVENTIONS.md',
]
files = [HERE.parent/'NOTE.md', *sorted(HERE.glob('*.py')),
         *sorted(HERE.glob('*.txt')), *(ROOT/s for s in sources)]
manifest = {'python': platform.python_version(), 'sympy': sympy.__version__,
            'command': 'PYTHONDONTWRITEBYTECODE=1 python3 '+str(Path(__file__).resolve().relative_to(ROOT)),
            'cases': records,
            'sha256': {str(p.relative_to(ROOT)): sha(p) for p in files}}
(HERE/'provenance.json').write_text(json.dumps(manifest, indent=2)+'\n')
print('HEADLINE: exact spatial seam and category checks pass; two incorrect reshuffle/F choices rejected.')
