# E1 calibration bundle

Headline: the sourced non-pointed F/R implementation passes all finite
invariants; replacing R by phase-free crossings fails block naturality.
The all-category mathematical proof is in `../NOTE.md`, not inferred from
these numerical tests.

Run from the repository root:

```bash
OPENBLAS_NUM_THREADS=1 python3 -I explorations/2026-10-22-astra-r2/E1-local-unital-lift/checks/check_lift.py --phase-free > explorations/2026-10-22-astra-r2/E1-local-unital-lift/checks/red_phase_free.txt 2>&1
OPENBLAS_NUM_THREADS=1 python3 -I explorations/2026-10-22-astra-r2/E1-local-unital-lift/checks/check_lift.py > explorations/2026-10-22-astra-r2/E1-local-unital-lift/checks/output.txt 2>&1
```

The first command was run **first** and is expected to exit 1 with an
`AssertionError` at block naturality. The second exits 0. The mutation is
an explicit CLI switch, so restoration does not alter the script. No
randomness, external downloads, Julia, or large-system computations occur.

Recorded environment: Python 3.12.3, NumPy 1.26.4. Maximum four site objects
O=1⊕tau, with faithful carrier dimensions 2,5,13,34. These are small
calibrations permitted by the task, not scaling data. No diagonalization.
All equalities use maximum absolute entry residual ≤2e-12, rtol=0;
no asymptotic conclusions or rigorous roundoff bounds are inferred.

The script independently builds a local tensor embedding using the F
associator, then builds the proposed braid from F and R. It checks F and
braid unitarity, the braid relation, block naturality for all 13 two-site
matrix units, all 169 matrix-unit products under alpha, adjoints,
unitality, isometric V, intertwining, occupation degree, one-site images,
and an explicit three-site representative. Endpoint commutators reject
length-two support. Naturality, rather than the global conjugation formula
alone, is the discriminating invariant for the phase-free mutation.

Input provenance: the local RSW source at
`references/category-theory/RowellStongWang2009Classification/source/RSWfinal3.tex:2379–2407`
supplies F and R together in the same gauge. Unit-label and orthonormal
left-associated path conventions follow CONVENTIONS (b),(r),(ah).
Only this check uses concrete numerical braid phases; no root R-symbol
convention is changed.

SHA256 at execution:

| File | SHA256 |
|---|---|
| `check_lift.py` | `11559bb9574096511592dce1ad559f33f1771c63cbd3f799728e45e0bd4e14ad` |
| RSW `source/RSWfinal3.tex` | `3f9c46b17c102e733ef0a12388783e5cdc864202ba9274aa089bcbe37c361a38` |
| root `CONVENTIONS.md` | `9fea8d735839ed83f5e7177d596768badcbcd7858fd832db164b10107ca1e246` |

The raw outputs are `output.txt` (GREEN) and `red_phase_free.txt` (RED).
Their exact numerical precision is evidence of the stated run only.
