# E2 exact checks

Run from the repository root:

```sh
python3 -B explorations/2026-10-22-astra-r2/E2-parity-and-chirality/checks/check_e2.py > explorations/2026-10-22-astra-r2/E2-parity-and-chirality/checks/raw_output.txt
```

Environment used: `/usr/bin/python3`, Python 3.12.3; SymPy 1.14.0.
SymPy is already installed in the user site; `python3 -I` excludes it and
failed at import. No dependency was downloaded or installed. `-B` prevents
bytecode writes. All computation is exact integer/rational/symbolic arithmetic;
there are no floating tolerances, fitted slopes or convergence claims.

**Headline:** reflection and KS residual identities, off-diagonal/diagonal
Jacobi reductions, the E2-Z cyclic reduction, ancillary current and the
E2-V Witt polynomial pass. Six wrong mutations are rejected before or
alongside the restored identities. Raw output is `raw_output.txt`.

The 16 by 16 matrices are N=4 tensor-unit multiplicity flags, permitted in
every unitary fusion category; no model-specific F or R data are used.
Arbitrary 3 by 3 integer matrices independently check the Jacobi rearrangements.
The script does not assert the finite flag matrices satisfy VR-1 or that the
flag chain is chiral. The all-scale E2-V bounds and E2-P/M/Z/S conclusions
are the structured proofs in `../NOTE.md`.

Provenance: NOTE equations (3), (6), (9), (11), (17) and E2-Z/E2-V;
`report/sections/79_ks_shell_and_refinement_defect.tex:52-81`;
`CONVENTIONS.md:444-474,1502-1522` (matrix/current and KS conventions).
The six mutations reverse the current sign, reverse the reflection Fourier
phase, omit the KS scalar remainder, and omit the W/F terms in three
different off-diagonal Jacobi identities. Each is asserted to fail loudly.
