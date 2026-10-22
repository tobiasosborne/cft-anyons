"""Audit structure/source locators and record hashes. Run from repo root.

This checks that cited locations exist; it does not validate their meaning.
Writes only the present D3 folder. No network or Git mutation.
"""
from pathlib import Path
import hashlib
import json
import re
import subprocess

base = Path('explorations/2026-10-22-astra/D3-refinement-meets-dynamics')
rev = '1f402aaf96d2ffb9d8efb0684836d4771bbd5f60'
anchors = {
    'literature/md/2010.11121/2010.11121.md':
        [(101, 124), (126, 180), (198, 220), (1078, 1101), (1632, 1632)],
    'references/refinement/HaegemanEtAl2018Wavelet/source/latticefermions.tex':
        [(434, 491)],
    'references/refinement/SOURCES.md': [(234, 293)],
    'literature/md/2306.16063/2306.16063.md': [(568, 583)],
    'cft_machine/research/wilson_triangle.md': [(18, 105), (109, 153), (155, 167)],
    'report/sections/68_variable_n_refinement_maps.tex': [(49, 105), (139, 149)],
    'report/sections/71_refinement_placement_category.tex': [(53, 146)],
    'report/sections/72_gns_descent_corner_calculus.tex': [(56, 109), (140, 196)],
    'report/sections/73_categorical_residual_set.tex': [(150, 200)],
    'reconstruction/04_cutoff_oar.md': [(16, 31), (84, 155)],
    'reconstruction/01_cells.md': [(63, 99)],
    'report/sections/84_coset_hamiltonian_and_oar.tex': [(94, 125)],
    'references/cft-machine/realisation/EvansGannon2018/source.tex': [(333, 335)],
    'cft_machine/research/realisation_and_fidelity.md': [(23, 61)],
    'cft_machine/benchmarks/fermion/WILSON_PROOF.md': [(18, 98)],
    'cft_machine/research/virasoro_routes.md': [(55, 82), (118, 177)],
    'CONVENTIONS.md': [(631, 827), (871, 884), (1072, 1217)],
}
git_anchors = {
    'report/sections/86_spacetime_trotter_dictionary.tex': [(61, 110)],
    'report/sections/87_dilute_fibonacci_is_blocked_golden.tex': [(55, 69)],
    'references/string-net/LevinWen2005/source/strnet.tex': [(487, 552)],
    'references/string-net/SOURCES.md': [(19, 90)],
}
log = []
for path, ranges in anchors.items():
    lines = Path(path).read_text().splitlines()
    assert all(1 <= a <= b <= len(lines) for a, b in ranges), path
log.append(f'PASS all anchor ranges exist in {len(anchors)} working-tree source files')
blobs = []
for path, ranges in git_anchors.items():
    raw = subprocess.check_output(['git', 'show', f'{rev}:{path}'])
    assert all(1 <= a <= b <= len(raw.splitlines()) for a, b in ranges), path
    blobs.append({'revision': rev, 'path': path,
                  'sha256': hashlib.sha256(raw).hexdigest(), 'line_ranges': ranges})
(base/'checks/git-source-hashes.json').write_text(json.dumps(blobs, indent=2)+'\n')
log.append('PASS all anchor ranges exist in four recorded local Git source blobs')
note = (base/'NOTE.md').read_text()
closing = ['Results ledger', 'What this gives the integration',
           'Open problems', 'Examples table', 'Sources used']
headings = re.findall(r'^## (.+)$', note, re.M)
assert headings[0] == 'Headline conjecture' and headings[-5:] == closing, headings
assert 300 <= len(note.splitlines()) <= 800, len(note.splitlines())
# The results ledger repeats the label; count the actual headline declaration.
assert note.count('**D3-C — Uniform local polar refinement,') == 1
log.append(f'PASS headline first, closing sections in order; NOTE.md {len(note.splitlines())} lines')
for name in ('factor', 'complement', 'unit', 'polar', 'local'):
    raw = (base/f'checks/red_{name}.txt').read_text()
    assert 'Traceback' in raw and 'AssertionError' in raw, name
log.append('PASS five recorded mutations fail at assertions')
assert 'ALL 11 invariant groups PASS' in (base/'checks/output.txt').read_text()
log.append('PASS restored run records eleven exact invariant groups; largest matrix 16x16')
assert len((base/'checks/check_drift.py').read_text().splitlines()) < 200
log.append('PASS check producer remains below 200 lines')
(base/'checks/audit.txt').write_text('\n'.join(log)+'\n')
paths = [Path(p) for p in anchors]
paths += [p for p in base.rglob('*') if p.is_file() and p.name != 'SHA256SUMS']
assert not any('__pycache__' in str(p) for p in paths)
records = [f'{hashlib.sha256(p.read_bytes()).hexdigest()}  {p}' for p in sorted(set(paths))]
(base/'checks/SHA256SUMS').write_text('\n'.join(records)+'\n')
print('\n'.join(log))
print(f'Recorded {len(records)} SHA256 entries and four Git source hashes')
