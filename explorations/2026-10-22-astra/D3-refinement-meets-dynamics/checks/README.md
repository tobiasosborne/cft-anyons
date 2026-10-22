# D3 finite checks and run record

**Headline:** eleven exact invariant groups pass; five deliberately incorrect
formula choices fail assertions. Largest matrix: 16×16. This verifies finite
identities and counterexamples, not the uniform-locality conjecture or any
critical-chain scaling claim.

From the repository root:

```bash
python3 explorations/2026-10-22-astra/D3-refinement-meets-dynamics/checks/check_drift.py
```

The retained standard-output/stderr capture is `output.txt`. The environment
reported by the producer is Python 3.12.3 and SymPy 1.14.0. All arithmetic is
exact; there is no random seed, numerical tolerance, external dataset, network
request, or Julia invocation. Runtime is below one second on this environment;
that observation is not a performance guarantee.

The eleven groups cover:

1. CA-72 squared vector defect and its relation to corner leakage.
2. Strict scalar augmentation: unit, multiplication, composition.
3. Nonvanishing operator-norm CP defect with zero selected GNS seminorm.
4. Independent-state drift and the vacuum-centering correction.
5. Distant support of global corner images and their correct unit.
6. Sharp factor-two energy/gap and residual/gap state-distance bounds.
7. Polar-frame tangent and negative effective-energy derivative.
8. Local tangent assembly from three noncommuting densities, plus vanishing
   of a disconnected pair contribution.
9. Local anti-Hermitian extension of a tangent with between-patch cancellation.
10. Failure of a fixed UV gap to control a closing IR vacuum.
11. Failure of zero energy variance to identify the ground state.

Mutation runs use the same command with `--mutate NAME`; every listed run
exited with status 1 at a mathematical assertion. Their unedited output and
tracebacks are retained individually:

| NAME | Raw output | Deliberate error |
|---|---|---|
| factor | `red_factor.txt` | Replace the sharp state-distance factor 2 by 1. |
| complement | `red_complement.txt` | Put P where the augmentation needs 1-P. |
| unit | `red_unit.txt` | Treat a global corner's unit as the full identity. |
| polar | `red_polar.txt` | Reverse the polar tangent's commutator sign. |
| local | `red_local.txt` | Reverse the assembled local dressing generator. |

The factor mutation was run before the initial passing run. The local mutation
was run before the expanded passing run. Other mutations followed; the restored
producer passed again. A separate research collaborator independently reran all
eleven groups and reviewed the complete note without editing files. Review is
mathematical assistance, not formal verification.

`SHA256SUMS` records this producer, the final note and run outputs, and the
working-tree source files used in the note. From the repository root verify it
with:

```bash
sha256sum -c explorations/2026-10-22-astra/D3-refinement-meets-dynamics/checks/SHA256SUMS
```

`git-source-hashes.json` separately records SHA256 values of the four source
blobs read from local revision `1f402aaf96d2ffb9d8efb0684836d4771bbd5f60`.
They were read using `git show REV:path`; they are not copied into the working
tree. Compare each recorded hash to `git show REV:path | sha256sum`.
`audit.txt` records source-anchor, heading-order, size and mutation-log checks.
Regenerate the audit and hashes from the repository root with:

```bash
python3 explorations/2026-10-22-astra/D3-refinement-meets-dynamics/checks/record_bundle.py
```

The audit checks that source line ranges exist; their mathematical relevance
was inspected while writing and reviewing the note. The first audit draft
mistakenly counted the conjecture's repeated ledger label as a second headline;
the recorded producer now checks the actual headline declaration.

Only files in the requested D3 directory were written. Root report sources and
the root worklog were not edited; no report build or commit was performed.
