# F6 exact checks

Headline: six exact finite invariant groups pass; three deliberate mutations
fail at their intended assertions. The mathematical proofs are in ../NOTE.md.
No finite enumeration is claimed to classify an infinite group or AF algebra.

From `/home/tobias/Projects/cft-anyons`:

```bash
python3 -I explorations/2026-10-25-astra-r3/F6-what-the-tower-remembers/checks/check_f6.py --mutation trace > explorations/2026-10-25-astra-r3/F6-what-the-tower-remembers/checks/red_trace.txt 2>&1
python3 -I explorations/2026-10-25-astra-r3/F6-what-the-tower-remembers/checks/check_f6.py --mutation support > explorations/2026-10-25-astra-r3/F6-what-the-tower-remembers/checks/red_support.txt 2>&1
python3 -I explorations/2026-10-25-astra-r3/F6-what-the-tower-remembers/checks/check_f6.py --mutation crossing > explorations/2026-10-25-astra-r3/F6-what-the-tower-remembers/checks/red_crossing.txt 2>&1
python3 -I explorations/2026-10-25-astra-r3/F6-what-the-tower-remembers/checks/check_f6.py > explorations/2026-10-25-astra-r3/F6-what-the-tower-remembers/checks/output.txt 2>&1
```

Exit statuses in that order: **1, 1, 1, 0**. The first three commands are
intentionally failing regressions, not setup failures. Their assertions reject
the wrong trace exponent, full stationary support at every rooted level, and
loss of the crossing phase. The restored run follows the red runs.

Executed with Python 3.12.3, standard library only (`itertools`, `fractions`,
`argparse`). No network,
Julia, package installation or large computation. Integer/Fraction arithmetic;
the sparse crossing check uses at most six binary sites (64 basis words).
The normalized coboundary obstruction is proved for every nonzero scalar in
NOTE.md; the finite script only checks sample scalar cancellations.

Source anchors and scoped conventions are at the script top and in NOTE.md.
The file `sha256.txt` records the executed script and the four raw outputs.
