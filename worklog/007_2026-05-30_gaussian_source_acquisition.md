# Worklog chunk 007 — 2026-05-30

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
