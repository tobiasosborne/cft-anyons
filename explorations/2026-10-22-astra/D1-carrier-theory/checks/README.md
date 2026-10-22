# D1 exact finite checks

Run from the repository root:

```bash
python3 explorations/2026-10-22-astra/D1-carrier-theory/checks/carrier_checks.py
```

Recorded run: `raw_output.txt`; Python 3.12.3, SymPy 1.14.0.
Headline: four invariant groups pass; four deliberate mutations are rejected
before the corresponding restored implementation passes.

The groups check local spreading and unequal-length coherence; normalized
configuration embeddings; corner compression and GNS/CP defects; and collision
scaling with an independent enumeration of constant-sector energies at 3–6 sites.
No large matrices or numerical diagonalisation are used.

The script prints its own SHA256. `manifest.json` records the note, producer,
raw output and read source/dependency hashes after the final audit.
The mathematical conventions and proofs are in `../NOTE.md`.
These checks do not establish the conjectured collision-trace lower bound.
