"""Run exact F3 calibrations and mutation regressions; writes only this checks/.
Usage from repo root: PYTHONDONTWRITEBYTECODE=1 python3 <this file>
Each child has a two-minute cap. Normal largest four-leg matrix is 16x16.
"""
import hashlib
import json
import os
from pathlib import Path
import subprocess
import sys
from datetime import datetime,timezone

HERE=Path(__file__).resolve().parent
ROOT=HERE.parents[3]
TASKS=[
    ('check_core.py',[], 'core_output.txt',None),
    ('check_pointed.py',[], 'pointed_output.txt',None),
    ('check_nonpointed.py',[], 'nonpointed_output.txt',None),
    ('check_core.py',['--mutate-dagger'],'mutation_dagger.txt','kernel adjoint equation E01'),
    ('check_pointed.py',['--mutate-cup'],'mutation_cup.txt','first oriented snake'),
    ('check_nonpointed.py',['--mutate-fs'],'mutation_fs.txt','FS-correct identified zigzag'),
]
SOURCES=[
 'references/text/PenneysUnitaryFusionCategories.md',
 'literature/md/2201.00192/2201.00192.md',
 'references/category-theory/RowellStongWang2009Classification/source/RSWfinal3.tex',
 'references/cft/AasenFendleyMong2020/source/_fusion_categories_and_diagrammatics.tex',
 'report/sections/80_lattice_sewing_and_fidelity_certificate.tex',
 'report/sections/86_spacetime_trotter_dictionary.tex',
 'report/sections/88_layered_targets.tex',
 'report/sections/92_spatial_seams_and_reflection_positivity.tex',
]


def main():
    runs=[]
    for script,args,output,failure in TASKS:
        cmd=[sys.executable,'-B',str(HERE/script),*args]
        p=subprocess.run(cmd,cwd=ROOT,env={**os.environ,'PYTHONDONTWRITEBYTECODE':'1'},
                         text=True,stdout=subprocess.PIPE,stderr=subprocess.STDOUT,timeout=120)
        (HERE/output).write_text(p.stdout)
        if failure is None:
            assert p.returncode==0,(script,p.stdout)
            assert 'PASS' in p.stdout and 'Traceback' not in p.stdout
        else:
            assert p.returncode!=0 and 'AssertionError: '+failure in p.stdout,(script,p.stdout)
        runs.append({'command':cmd,'exit_code':p.returncode,'output':output,
                     'expected_assertion':failure})
        print('PASS',script,*args,'normal' if failure is None else 'mutation rejected',flush=True)
    digest=lambda f:hashlib.sha256(f.read_bytes()).hexdigest()
    files=[ROOT/s for s in SOURCES]+sorted(HERE.glob('*.py'))+sorted(p for p in HERE.glob('*output.txt') if p.name!='acceptance_output.txt')+sorted(HERE.glob('mutation_*.txt'))
    record={'created_utc':datetime.now(timezone.utc).isoformat(),'python':sys.version,
            'commands':runs,'sha256':{str(p.relative_to(ROOT)):digest(p) for p in files}}
    (HERE/'provenance.json').write_text(json.dumps(record,indent=2)+'\n')
    print('PASS three normal runs and three detected mutations; provenance.json written')


if __name__=='__main__':
    main()
