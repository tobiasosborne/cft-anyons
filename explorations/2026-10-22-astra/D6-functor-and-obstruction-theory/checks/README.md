# D6 exact checks and run record

Run date: 2026-10-22. Producer and raw output live in this directory.
No network, Julia, many-body diagonalization or approximate rank decisions.
Largest symbolic array: 32 by 16; physical matrices at most 4 by 4.

From `/home/tobias/Projects/cft-anyons`:

```bash
python3 explorations/2026-10-22-astra/D6-functor-and-obstruction-theory/checks/check_d6.py > explorations/2026-10-22-astra/D6-functor-and-obstruction-theory/checks/raw_output.txt 2>&1
```

Headline finding: four exact groups pass, four deliberate mutations are
rejected, and the restored implementation passes. These are formula checks,
not evidence of a general category-to-CFT construction.

The groups check the off-shell associator identity and its tangent complex;
a second-order lift from an actual change of basis; the corner/state mixture
and sharp drift witness; failure of the CP norm-softness shortcut despite
vanishing cyclic seminorm; the two-central-coefficient scalar shift; the
skew Fourier cocycle sign; and noncommutative Ward propagation.

Mutations change the syzygy sign, gauge-output sign, complementary state
weight, and scalar central-charge shift. Each has to raise an AssertionError;
otherwise the producer itself fails. The raw output retains rejection reasons,
Python/SymPy versions and the SHA256 of the producer. The coefficient
construction is independent of the root test scripts, which were not run.

Provenance: `../NOTE.md` P2, N1, section 7 and
`reconstruction/03_sewing_deformations.md:109–137`,
`reconstruction/01_cells.md:166–186`,
`reconstruction/02_obstructions.md:119–137`.
The exact rational test states and basis convention are declared in the
producer before use. No computed datum depends on a category example.

Session record: the corner and complex claims were independently reviewed;
the final review also caught an invalid cofinal-morphism identification, a
quantifier-order ambiguity in the conjecture, and missing fixed-norm
hypotheses in the assembly reduction. These were corrected in NOTE.md.
No root worklog/INDEX/CONVENTIONS/report edits were made by this task,
honouring the explicit destination restriction. No commit was made.
