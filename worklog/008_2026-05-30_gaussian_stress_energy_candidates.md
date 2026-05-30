# Worklog chunk 008 — 2026-05-30

## S2 one-dimensional stress-energy candidate shard — 2026-05-30

### Context

After S1 confirmed CA-29 as the real-space density convention and A4 supplied a
checked finite open-chain energy-current identity, S2 asked for the first
1+1-dimensional lattice stress-energy candidate shard.

### What changed

- Delegated S2 to worker `019e79b7-67f8-75f3-bab1-61384f352692` (`Planck`) and
  reviewed the new shard.
- Added CA-30,
  `report/sections/30_gaussian_boson_1d_stress_candidates.tex`.
- Updated `report.tex`, `report/README.md`, `report/SHARD_CATALOG.md`, and
  rebuilt `report.pdf`.
- Parent synchronized CA-23 so the roadmap lists CA-30 as landed and leaves S3
  onward as the remaining queue.

### Why these choices

- CA-30 uses continuum stress-energy sources only as motivation and caveat
  anchors.  The lattice claim surface is instead tied to CA-29 and the A4
  finite open-chain continuity tests.
- The shard defines only the checked \(T_{01}\) seed.  \(T_{10}\) is reserved
  for the S3 current-vs-symbol comparison, and \(T_{11}\) is reserved for a
  future momentum-current witness.

### Frictions / dead ends

- Weinberg OCR remains noisy around exact tensor formulas, so CA-30 does not
  import exact component signs from OCR.
- Periodic first moments remain blocked by the missing periodic coordinate
  branch/sawtooth/interpolation convention.

### Acceptance

- Parent reviewed the shard boundary: no convergence theorem, no Virasoro
  claim, no \(T_{10}=T_{01}\) identification, and no tracelessness-derived
  \(T_{11}\).
- `make check-report-shards` passed.
- `make report` passed.
- `git diff --check` passed.

### Pointers

- Report shard: CA-30.
- Density convention: CA-29 and CONVENTIONS.md (l).
- Checked current witness: `src/GaussianBosonCurrents.jl` and
  `test/runtests.jl` testset "Gaussian open-chain energy current continuity".
