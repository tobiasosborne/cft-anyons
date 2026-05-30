# Worklog chunk 007 — 2026-05-30

## A4 open-chain Gaussian energy-current derivation — 2026-05-30

### Context

A4 asked for either a source or a checked local derivation of the harmonic-chain
energy-current formulas needed before the future Gaussian `T_01` stress-energy
proposal.  CA-29 had already fixed the real-space energy-density split.

### What changed

- Delegated A4 to worker `019e79aa-6791-78b0-8cbc-5d97538e9936` (`Hypatia`) and
  reviewed the pushed commit `f3f1705`.
- Added `src/GaussianBosonCurrents.jl`, included from `src/CftAnyons.jl`.
- Added phase-space quadratic commutator helpers for
  \(i[Q(A),Q(B)]\), finite open nearest-neighbour Gaussian density matrices,
  bond currents \(J_{j+1/2}=i[e_j,e_{j+1}]\), closed-form current matrices, and
  continuity residuals.
- Updated CONVENTIONS.md (l), `INDEX.md`, and `test/runtests.jl`.

### Why these choices

- A local derivation is enough for the first `T_01` layer and avoids importing a
  broader harmonic-chain stress-tensor source before the finite density
  convention is tested.
- The quadratic-form representation checks the actual canonical commutator
  algebra rather than restating the first-moment identity.

### Frictions / dead ends

- This does not solve the momentum-current / `T_11` problem.  It only proves the
  finite open-chain energy-continuity identity for the chosen CA-29 density
  split and orientation.

### Acceptance

- Parent reviewed the sign pin
  \(i[q^2/2,p^2/2]=-(qp+pq)/2\), the closed-form bond-current test, and the
  endpoint/interior continuity tests.
- `julia --project=. -e 'using Pkg; Pkg.test()'` passed.
- `make check-report-shards` passed.
- `git diff --check` passed.

### Pointers

- Code: `src/GaussianBosonCurrents.jl`.
- Tests: `test/runtests.jl` testsets "Gaussian quadratic commutator sign
  convention" and "Gaussian open-chain energy current continuity".
- Convention: CONVENTIONS.md (l).

## A3 discrete GFF Virasoro source registration — 2026-05-30

### Context

The Gaussian Lorentz plan needed a local source for the discrete
Gaussian/free-field Virasoro side quest before later stress-energy proposal
shards can say anything precise about lattice conformal generators.

### What changed

- Delegated A3 to worker `019e799c-3578-70f0-93d9-6b026a436206` (`Hegel`) and
  reviewed the registration.
- Added `SRC-HONGLER-JOHANSSON-KYTOLA-2013` under
  `references/lattice-symmetry/`, including the EPFL open-access PDF, a
  `pdftotext` extraction, the version-pinned arXiv `v1` source package, and the
  extracted TeX anchor file.  The original source package is preserved
  unchanged; the extracted TeX copy has trailing horizontal whitespace stripped
  so repository whitespace gates can check it.
- Updated `references/manifest/SOURCES.md`.
- Updated CA-23 only at the source-boundary level: the source supports
  square-grid dGFF change-of-measure Virasoro claims, not harmonic-chain
  stress-energy or continuum Poincare formulas.

### Why these choices

- The arXiv `v1` source TeX gives stable line anchors for the original
  "Lattice Representations of the Virasoro Algebra I" preprint.
- The unversioned arXiv e-print currently resolves to a later expanded work, so
  the manifest records the version pin explicitly.

### Frictions / dead ends

- The useful scope is narrower than the Gaussian harmonic-chain target: it is a
  dGFF-on-square-grid, change-of-measure construction with current modes and
  Sugawara operators.  It is evidence for lattice-level Virasoro structure, not
  for the missing energy-current formulas.

### Acceptance

- Parent verified all four source hashes and inspected the key TeX anchor
  ranges for abstract scope, change-of-measure operators, current modes,
  Heisenberg relations, Sugawara construction, and commuting `c=1` Virasoro
  representations.
- `make check-report-shards` passed.
- `make report` passed.
- `git diff --check` passed.

### Pointers

- Source manifest: `references/lattice-symmetry/SOURCES.md`.
- Source TeX anchors:
  `references/lattice-symmetry/HonglerJohanssonKytola2013/source/vir_20130715.tex`.
- Report: CA-23 source-boundary update.

## A2 original Koo-Saleur source registration — 2026-05-30

### Context

CA-14 had used a later lattice-fermion/OAR treatment as the rigorous
Koo--Saleur precedent while keeping the original Koo--Saleur paper as an
acquisition target.  A2 was the source-acquisition step for the original paper.

### What changed

- Delegated A2 to worker `019e7990-12ad-7151-a8e4-5604d5e29783` (`Feynman`) and
  reviewed the registration.
- Added `SRC-KOO-SALEUR-1994` under `references/lattice-symmetry/`, including
  the arXiv source package, arXiv PDF, extracted TeX anchor file, and PDF text
  extraction.
- Updated `references/manifest/SOURCES.md`.
- Updated CA-14, CA-10, CA-17, and `report/SHARD_CATALOG.md` to remove the
  stale acquisition-target wording while keeping the claim boundary explicit.

### Why these choices

- The arXiv source TeX gives stable line anchors for formulas, so it is the
  preferred citation target over PDF OCR.
- The original source supports the lattice Virasoro prototype and its
  conjectural/numerical checks; the later rigorous free-fermion/OAR convergence
  theorem remains a separate sourced claim.

### Frictions / dead ends

- The original source itself warns that finite-\(L\) lattice quantities do not
  close as the Virasoro algebra and that scaling limits of commutators need not
  be commutators of scaling limits.  Those caveats are now part of the report
  boundary, not hidden in the source manifest.

### Acceptance

- Parent verified the source TeX hash and inspected the key anchor ranges:
  abstract scope, Hamiltonian-density subtraction, commutator stress component,
  Fourier modes, Virasoro-mode mapping, finite-\(L\) non-closure, scaling-limit
  caveat, vertex/RSOS formulas, fixed-boundary formula, and conclusion limits.
- `make check-report-shards` passed.
- `make report` passed.
- `git diff --check` passed.

### Pointers

- Source manifest: `references/lattice-symmetry/SOURCES.md`.
- Source TeX anchors:
  `references/lattice-symmetry/KooSaleur1993/source/9312156.tex`.
- Report: CA-14, with source-boundary updates in CA-10 and CA-17.

## A1 continuum stress-energy source registration — 2026-05-30

### Context

The Gaussian Lorentz action plan moved from Julia hardening into source
acquisition.  A1 needed a local, line-citable continuum source for stress-energy
tensors and Poincare generators before the stress-energy proposal shards can
promote formulas beyond proposal status.

### What changed

- Delegated A1 to worker `019e7984-d92f-7940-9a7e-09ba5930619a` (`Hilbert`) and
  reviewed the registration.
- Registered Weinberg, *The Quantum Theory of Fields*, Volume I, under
  `references/qft/`.
- Added the copied DJVU source, an empty embedded-text extraction proving the
  DjVu has no usable text layer, and a targeted OCR extraction for the A1 pages.
- Updated `references/qft/SOURCES.md` and the central
  `references/manifest/SOURCES.md` index.

### Why these choices

- The source was already present in Tobias's local sibling-project library, so
  registration could proceed without network or paywalled acquisition.
- The OCR is good enough for line anchors but visibly noisy around equations, so
  the manifest explicitly requires page-image checking before exact formula
  promotion.

### Frictions / dead ends

- `djvutxt` produced a 0-line extraction; targeted OCR was necessary.
- General stress-tensor improvement ambiguity remains unsourced.  The current
  anchors support the canonical-to-Belinfante divergence/superpotential step and
  equality of integrated translation generators only.

### Acceptance

- Parent verified the DJVU, OCR, and empty extraction SHA256 hashes.
- Parent verified the main anchor families with `rg`: Noether setup,
  translation currents and generators, canonical stress tensor, Belinfante
  tensor, rotation/boost generators, and Lorentz commutator caveats.
- `make check-report-shards` passed.
- `git diff --check` passed.

### Pointers

- Source manifest: `references/qft/SOURCES.md`.
- Central source index: `references/manifest/SOURCES.md`.
- OCR anchors:
  `references/qft/Weinberg1995/Weinberg1995_QFT1_A1_ocr.txt`.
