"""Rerun the author's six cases without overwriting any author artifact.
Run: PYTHONDONTWRITEBYTECODE=1 python3 <this file>
Only writes review_* alongside this file; 120-second cap per child.
"""
import hashlib
import json
import os
from pathlib import Path
import subprocess
import sys
from datetime import datetime, timezone

HERE = Path(__file__).resolve().parent
ROOT = HERE.parents[3]
CASES = [
    ('check_core.py', [], 'review_core_output.txt', None),
    ('check_pointed.py', [], 'review_pointed_output.txt', None),
    ('check_nonpointed.py', [], 'review_nonpointed_output.txt', None),
    ('check_core.py', ['--mutate-dagger'], 'review_mutation_dagger.txt',
     'kernel adjoint equation E01'),
    ('check_pointed.py', ['--mutate-cup'], 'review_mutation_cup.txt',
     'first oriented snake'),
    ('check_nonpointed.py', ['--mutate-fs'], 'review_mutation_fs.txt',
     'FS-correct identified zigzag'),
    ('review_duality.py', [], 'review_duality_output.txt', None),
    ('review_duality.py', ['--mutate-dual'], 'review_duality_mutation.txt',
     'E1 cup equation needs conjugate dual'),
    ('review_history.py', [], 'review_history_output.txt', None),
    ('review_history.py', ['--mutate-history'], 'review_history_mutation.txt',
     'temporal OS form from exact contraction'),
    ('review_hexagons.py', [], 'review_hexagons_output.txt', None),
]
SOURCES = [
    'AGENTS.md', 'CONVENTIONS.md',
    'references/text/PenneysUnitaryFusionCategories.md',
    'literature/md/2201.00192/2201.00192.md',
    'references/category-theory/RowellStongWang2009Classification/source/RSWfinal3.tex',
    'references/cft/AasenFendleyMong2020/source/_fusion_categories_and_diagrammatics.tex',
    'report/sections/80_lattice_sewing_and_fidelity_certificate.tex',
    'report/sections/86_spacetime_trotter_dictionary.tex',
    'report/sections/88_layered_targets.tex',
    'report/sections/92_spatial_seams_and_reflection_positivity.tex',
    'report/sections/75_integration_map.tex',
    'report/sections/91_parity_and_chiral_delineation.tex',
]


def digest(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def main():
    protected = [p for p in HERE.iterdir() if p.is_file()
                 and not p.name.startswith('review_')] + [HERE.parent/'NOTE.md']
    before = {str(p.relative_to(ROOT)): digest(p) for p in protected}
    runs = []
    for script, args, name, failure in CASES:
        cmd = [sys.executable, '-B', str(HERE/script), *args]
        p = subprocess.run(cmd, cwd=ROOT,
                           env={**os.environ, 'PYTHONDONTWRITEBYTECODE': '1'},
                           capture_output=True, text=True, timeout=120)
        raw = p.stdout + p.stderr
        (HERE/name).write_text(raw)
        if failure is None:
            assert p.returncode == 0, (script, raw)
            assert 'PASS' in raw and 'Traceback' not in raw
        else:
            assert p.returncode != 0, (script, 'mutation survived')
            assert 'AssertionError: ' + failure in raw, raw
        runs.append(dict(command=cmd, exit_code=p.returncode,
                         output=name, expected_failure=failure))
        print('PASS', script, args, 'exit', p.returncode, flush=True)
    after = {str(p.relative_to(ROOT)): digest(p) for p in protected}
    assert before == after, 'author files changed during rerun'
    artifacts = sorted(p for p in HERE.glob('review_*') if p.is_file()
                       and p.name not in {'review_rerun_manifest.json', 'review_rerun_output.txt'})
    artifacts += [HERE.parent/'REVIEW.md', HERE.parent/'INTEGRATION.md']
    record = dict(utc=datetime.now(timezone.utc).isoformat(), python=sys.version,
                  runs=runs, protected_sha256=before,
                  source_sha256={p: digest(ROOT/p) for p in SOURCES},
                  review_sha256={str(p.relative_to(ROOT)): digest(p) for p in artifacts})
    (HERE/'review_rerun_manifest.json').write_text(json.dumps(record, indent=2)+'\n')
    print('PASS six normal cases, five expected mutations; author artifacts unchanged; manifest written')


if __name__ == '__main__':
    main()
