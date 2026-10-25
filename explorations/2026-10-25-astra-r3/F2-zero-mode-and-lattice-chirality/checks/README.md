# F2 small checks

Run from the repository root. All files and outputs stay in this directory.
No Julia or network. The exact check is SymPy; the second is NumPy float64,
absolute tolerance `1e-10`, at most 128-dimensional matrices. These test
identities used in NOTE.md, not a claimed all-scale numerical CFT certificate.

```bash
python3 explorations/2026-10-25-astra-r3/F2-zero-mode-and-lattice-chirality/checks/check_f2.py
OPENBLAS_NUM_THREADS=1 python3 explorations/2026-10-25-astra-r3/F2-zero-mode-and-lattice-chirality/checks/check_range_and_kernel.py
```

Headline: the exact unequal-ledger KS identity, cubic consistency relation,
polynomial-module Jacobi/dagger/parity relations, and genuine cyclic-shift
obstruction pass; the finite-range current and spectral-kernel oracles agree.

| File | Meaning |
|---|---|
| `output.txt` | Final exact baseline, exit 0 |
| `mutation_shift.txt` | Delete the polynomial shift in the L-module action: fails the LL invariant, exit 1 |
| `mutation_central.txt` | Reverse the central difference in finite KS antisymmetry: fails the independent matrix identity, exit 1 |
| `mutation_cubic.txt` | Change the F4=(2,2) coefficient 4 to 3: fails the two-path cubic test, exit 1 |
| `range_kernel_output.txt` | Independent finite matrix continuity/Fourier and finite Fourier-sum kernel comparison, exit 0 |
| `environment.txt` | Python/SymPy/NumPy versions |

Mutation commands append `--mutate shift`, `--mutate central` or
`--mutate cubic` to the first command. They are deliberately failing runs;
the option does not edit the file. The unmutated baseline was restored and
rerun after changes. Both original shift/central negative controls were run
before the first successful baseline.

Precise mathematical provenance is in NOTE.md's Sources used. New identities
are displayed derivations there. The N=4 and N=7 densities are arbitrary
unit-multiplicity matrix calibrations; no category-specific property enters.
