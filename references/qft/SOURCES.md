# Source Manifest -- `references/qft/`

Quantum-field-theory ground-truth sources. Per AGENTS.md Law 1, every claim
that uses one of these cites a local path plus a line locator into an extraction
or an explicitly named page in the source file.

## Sources

### SRC-WEINBERG-QFT1 -- Weinberg, *The Quantum Theory of Fields*, Vol. I

- **Author:** Steven Weinberg
- **Title:** The Quantum Theory of Fields, Volume I: Foundations
- **Publisher:** Cambridge University Press, 1995
- **ISBN:** 0-521-55001-7
- **Local DjVu:** `references/qft/Weinberg1995_QFT1.djvu` (634 DjVu pages)
- **DjVu SHA256:**
  `39fdcaeb42d073b60442866f793589555ad4a4c772b56a17915add9d6c5829df`
- **Bibliographic anchors:**
  `references/qft/Weinberg1995/Weinberg1995_QFT1_A1_ocr.txt:1`--`:41`
  (title, volume, author, publisher, copyright year, first publication year,
  ISBN).
- **Retrieval / registration:** copied and registered on 2026-05-30 from the
  owner's local sibling-project library:
  `/home/tobiasosborne/Projects/Lyr.jl/docs/references/Steven Weinberg-The Quantum Theory Of Fields. Foundations. 1-Cambridge University Press (1995).djvu`.
  Owner-held local copy; re-acquisition should use Cambridge University Press or
  institutional library access. No DOI or arXiv identifier is recorded in the
  local source copy.
- **Embedded text extraction:** `references/qft/Weinberg1995/Weinberg1995_QFT1_djvutxt.txt`
  via
  `djvutxt references/qft/Weinberg1995_QFT1.djvu > references/qft/Weinberg1995/Weinberg1995_QFT1_djvutxt.txt`;
  SHA256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`.
  This file has 0 lines: the registered DjVu has no usable embedded text layer.
- **Targeted A1 OCR extraction:** `references/qft/Weinberg1995/Weinberg1995_QFT1_A1_ocr.txt`
  (705 lines; pages 3--5, 23, and 331--342; SHA256
  `1ee7392e7cf955227051769448db00816a33b5f1c215dcd29b7ea21f03cb64a9`).
  Extraction command:
  ```
  mkdir -p /tmp/weinberg1995_qft1_a1_ocr
  for p in 3 4 5 23 $(seq 331 342); do
    ddjvu -format=tiff -page=$p -scale=300 \
      references/qft/Weinberg1995_QFT1.djvu \
      /tmp/weinberg1995_qft1_a1_ocr/p${p}.tif
  done
  tesseract /tmp/weinberg1995_qft1_a1_ocr/p3.tif \
    /tmp/weinberg1995_qft1_a1_ocr/p3 -l eng --psm 3
  tesseract /tmp/weinberg1995_qft1_a1_ocr/p4.tif \
    /tmp/weinberg1995_qft1_a1_ocr/p4 -l eng --psm 3
  convert /tmp/weinberg1995_qft1_a1_ocr/p5.tif -rotate 180 \
    /tmp/weinberg1995_qft1_a1_ocr/p5_rot.tif
  tesseract /tmp/weinberg1995_qft1_a1_ocr/p5_rot.tif \
    /tmp/weinberg1995_qft1_a1_ocr/p5_rot -l eng --psm 6
  for p in 23 $(seq 331 342); do
    tesseract /tmp/weinberg1995_qft1_a1_ocr/p${p}.tif \
      /tmp/weinberg1995_qft1_a1_ocr/p${p} -l eng --psm 3
  done
  # Then concatenate the page text files with "===== DjVu page N =====" markers,
  # using the rotated page-5 OCR text, into the targeted extraction path above.
  ```
- **A1 anchor ranges:**
  - `Weinberg1995_QFT1_A1_ocr.txt:46`--`:64` -- notation page: spatial and
    spacetime index ranges, `x^0` as time coordinate, metric-sign convention
    (OCR is symbol-noisy; check the DjVu page before promoting exact tensor
    formulas).
  - `:87`--`:97` -- Noether-theorem setup: conserved current and constant of
    motion for each infinitesimal symmetry.
  - `:260`--`:280` -- spacetime translations give four conserved currents
    grouped as the energy-momentum tensor, and translation generators are
    spatial integrals of the time components.
  - `:300`--`:355` -- spatial translation generator, time-translation generator
    `P^0=H`, and canonical energy-momentum tensor formula derived from a
    Lagrangian density.
  - `:357`--`:361` -- warning that the raised canonical tensor is not generally
    symmetric and that the symmetric tensor introduced next is the
    gravitational source.
  - `:465`--`:492` -- Lorentz invariance gives conserved Lorentz currents whose
    time-component integrals define time-independent tensors; these are the
    homogeneous Lorentz generators.
  - `:552`--`:589` -- Belinfante tensor construction: it is conserved, has the
    same integrated translation generators as the canonical tensor, is
    symmetric, and is the gravitational source.
  - `:590`--`:633` -- conserved angular-momentum tensor, rotation generator,
    boost generator as a spatial integral, and displayed commutators with
    `H` and `P`.
  - `:675`--`:684` -- conditions under which the `P^mu` and `J^{mu nu}` satisfy
    the inhomogeneous Lorentz-group commutation relations, with caveats for
    boost generators in the presence of auxiliary fields.
- **Improvement status:** the registered anchors support the canonical-to-
  Belinfante divergence/superpotential step and equality of the integrated
  translation generators. A broader stress-tensor improvement ambiguity is not
  yet sourced by this registration and must not be filled in from memory.

## Notes

- The targeted OCR is an anchor convenience, not an authoritative replacement
  for the DjVu page image. OCR around equations is visibly noisy; report prose
  that depends on exact signs, indices, or tensor components must be checked
  against the DjVu page image before being promoted.
