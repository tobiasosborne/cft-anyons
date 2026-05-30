# Worklog chunk 008 — 2026-05-30

## S4 higher-dimensional cell-current proposal — 2026-05-30

### Context

S4 asked for the \(d=2,3\) stress-current problem to be stated with oriented
cells/faces, local energy currents, momentum densities, stress components,
rotations, and boundary policies.  This needed to stay proposal-level because
no higher-dimensional current convention or tests exist yet.

### What changed

- Delegated S4 to worker `019e79c6-cc6d-7d70-b7ff-5d1e1deaf713` (`Wegener`) and
  reviewed the report-only patch.
- Added CA-32,
  `report/sections/32_gaussian_higher_dimensional_cell_currents.tex`.
- Updated `report.tex`, `report/README.md`, `report/SHARD_CATALOG.md`, CA-23,
  and rebuilt `report.pdf`.

### Why these choices

- The shard treats orientations, incidence signs, boundary faces, energy
  fluxes, momentum densities, and stress currents as compiler payload data.
  That avoids silently installing a global higher-dimensional convention.
- The proposal separates \(T_{0a}\), \(T_{a0}\), and \(T_{ab}\): energy flux
  does not define momentum density, and symmetric stress is a future witness.

### Frictions / dead ends

- No code or tests were added.  The next numerical step must supply actual
  finite open-boundary continuity witnesses or a sourced periodic coordinate
  construction before any higher-dimensional current claim is checked.

### Acceptance

- Parent verified that CA-32 makes no convergence claim, no `T_{a0}=T_{0a}`
  identification, and no stress-symmetry assumption.
- `make check-report-shards` passed.
- `make report` passed.
- `git diff --check` passed.

### Pointers

- Report shard: CA-32.
- Prior stress-energy shards: CA-29--CA-31.
- Higher-dimensional caveat source: CA-13.

## S3 current-symbol equivalence bridge — 2026-05-30

### Context

S3 asked for the first bridge between the A4 real-space \(T_{01}\) current and
the CA-26 flat momentum-symbol/boost-time layer.  The danger was overclaiming an
open-chain momentum generator or periodic first moment.

### What changed

- Delegated S3 to worker `019e79be-23a4-7641-8544-9e982559ba02` (`Faraday`) and
  reviewed the patch.
- Added `nearest_neighbor_integrated_energy_current_symbol` and a
  Klein-Gordon wrapper in `src/GaussianBosonCurrents.jl`.
- Added the "Gaussian boson current-symbol equivalence" Julia tests.
- Added CA-31,
  `report/sections/31_gaussian_current_symbol_equivalence.tex`.
- Updated report maps, CA-28 helper surface, CA-30 acceptance boundary,
  `INDEX.md`, CA-23 roadmap, and `report.pdf`.

### Why these choices

- The checked invariant is narrow and sign-sensitive:
  \[
    -\epsilon b\sin(\epsilon k)
    =
    \frac{\sin(\epsilon k)}{\epsilon}
  \]
  for the Klein-Gordon nearest-neighbour bond \(b=-\epsilon^{-2}\), matching
  the CA-26 boost-time symbol.
- This uses no periodic coordinate and no finite first moment, so it does not
  violate the C4/J1 periodic-branch boundary.

### Frictions / dead ends

- The result is only a translation-invariant symbol bridge.  The finite
  open-chain wave-packet comparison with \(\mathrm d\Gamma(k)\), boundary
  residuals, and continuum convergence remain open.

### Acceptance

- Parent reviewed the sign convention: the existing A4 orientation needs no
  sign flip; reversing the bond sign fails the target comparison.
- `julia --project=. -e 'using Pkg; Pkg.test()'` passed.
- `make check-report-shards` passed.
- `make report` passed.
- `git diff --check` passed.

### Pointers

- Code: `src/GaussianBosonCurrents.jl`.
- Tests: `test/runtests.jl` testset "Gaussian boson current-symbol
  equivalence".
- Report shard: CA-31.

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
