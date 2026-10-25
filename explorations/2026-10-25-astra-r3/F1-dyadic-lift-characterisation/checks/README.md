# F1 exact checks and proof audit

Headline: finite blocking gives local dyadic lifts for noncentral sites;
associator obstructions on a single site do not obstruct every such lift.
The all-category proofs and their limits are in `../NOTE.md`. All scripts
use Python's standard library and exact integers; no numerical tolerance,
Julia, network, dense large matrices or external packages are used.

From the repository root, run:

```bash
python3 -I explorations/2026-10-25-astra-r3/F1-dyadic-lift-characterisation/checks/run_checks.py
```

The runner records every exact command, expected exit code, duration,
Python version and SHA256 hashes in `manifest.json`. All writes stay here.
Each mutation runs before its restored baseline. A successful runner has
four GREEN baselines and four **expected** RED failures. Raw tracebacks in
the red files are evidence of rejected mutations, not unfinished failures.
The laptop budget is a few minutes; each subprocess is capped at 180 seconds.

| Script / raw outputs | Scope and asserted invariant |
|---|---|
| `check_blocked_lift.py`; `blocked_lift_output.txt`, `blocked_lift_red.txt` | Four-letter S3 calibration, b=2, L=1,2,3; actual categorical permutation, exact V, unitality, dagger/products, every interval matrix unit in the tensor interval algebra; omitting the vacancy correction fails exact V |
| `review_block_exact.py`; `review_block_output.txt`, `review_block_red.txt` | Independent seven-letter regular-plus-involution construction; L<=3, all interval matrix units; membership requires identical local entries for every exterior basis context; removing the correction fails exact V |
| `associator_exact.py`; `associator_output.txt`, `associator_red.txt` | Trilinear p=2,3 pentagons and slant cocycles, p=2 explicit Pauli hexagons, tensor-power multiplicities; phase erasure destroys the stated commutator obstruction |
| `associator_general_exact.py`; `associator_general_output.txt`, `associator_general_red.txt` | Formal 12-term monomial identity; a nonbilinear fourth-root cocycle; regular projective matrices; elementary and non-elementary abelian p-group coefficient congruences; a sign error fails the formal identity |

Direct commands are `python3 -I SCRIPT` for baselines. Mutation flags are,
respectively, `--omit-vacancy-shuffle`, `--mutate-shuffle`,
`--mutate-associator`, and `--mutate-sign`. The manifest stores absolute
commands, while the command above is portable from the repository root.

The group permutations compose as p(q(i)); the vacuum is letter 0. In the
twisted checks all phases are represented by integer exponents, and Pauli
matrices have exact integer entries. Left-associated products and the
half-braiding orientation are specified in the note and script headers.
The scripts check finite instances only; the proofs handle all L, arbitrary
interval morphisms, incomplete final blocks and supplied associators.

## Derivations and review

- `AUDIT-BLOCKING.md`: independently derived vacancy swap, block theorem,
  support bound, counterexample and finite-order extension.
- `associator_proof.md`: general abelian matrix criterion, determinant
  obstruction, trilinear family and smaller Pauli realization.
- `associator_general.md`: arbitrary-cocycle slant identity, regular
  representations, coefficient congruence and abelian p-group extension.
- `REVIEW.md`: hostile proof audit, tensorator/composition details and
  explicit qualifications; its grade does not certify a classification.

Ground-truth anchors are listed precisely in each derivation and in
`../NOTE.md` under Sources used. The checks' mathematical inputs are
derived there; there are no unregistered downloaded data or sources.
