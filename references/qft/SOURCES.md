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

### SRC-FEWSTER-REJZNER-2019 -- Fewster and Rejzner, AQFT -- an introduction

- **Authors:** Christopher J. Fewster and Kasia Rejzner
- **Title:** Algebraic Quantum Field Theory -- an introduction
- **arXiv:** `1904.04051` (`v1` submitted 2019-04-08, this registration is
  `v2` last revised 2019-11-18; math-ph / gr-qc / hep-th). To appear in
  *Progress and Visions in Quantum Theory in View of Gravity -- Bridging
  Foundations of Physics and Mathematics* (eds. F. Finster, D. Giulini,
  J. Kleiner, J. Tolksdorf).
- **Local arXiv source package:**
  `references/qft/FewsterRejzner2019/FewsterRejzner2019_arxiv_eprint.tar.gz`
  (this e-print endpoint returns a single gzip-compressed `.tex` file, not a
  tar archive, despite the `.tar.gz` filename convention kept here for
  uniformity; original internal filename `AQFTIMPRS-Oct2019.tex`)
- **Source-package SHA256:**
  `acb734dbb96f5d3f657de79ae0dbeb63f7d9c931e0cb0521ae35fa09d8776d8b`
- **Local arXiv PDF:**
  `references/qft/FewsterRejzner2019/FewsterRejzner2019_arxiv.pdf`
  (47 PDF pages; 517551 bytes)
- **PDF SHA256:**
  `304eb17e60b44848a2f00e751d0243ae106878eef7cba8625651550a25565d16`
- **Extracted source TeX:**
  `references/qft/FewsterRejzner2019/source/AQFTIMPRS-Oct2019.tex`
  (2231 lines; SHA256
  `dc9a3df3f109d948c1414a828f955272579b4810b4ad1af65b911ef43c5b2293`)
- **PDF text extraction:**
  `references/qft/FewsterRejzner2019/FewsterRejzner2019_pdftotext.txt`
  (2470 lines; SHA256
  `da95ff6227dea6462bfb98fdd2add63a1ddf4c7e312e5469c69126687c0d500f`)
- **Retrieval:** fetched from arXiv on 2026-07-05 (unversioned endpoints
  resolve to the latest posted version, `v2`). Legal source URLs:
  `https://arxiv.org/abs/1904.04051`,
  `https://arxiv.org/e-print/1904.04051`, and
  `https://arxiv.org/pdf/1904.04051`.
- **Extraction command:**
  ```bash
  mkdir -p references/qft/FewsterRejzner2019/source
  curl -L https://arxiv.org/e-print/1904.04051 \
    -o references/qft/FewsterRejzner2019/FewsterRejzner2019_arxiv_eprint.tar.gz
  curl -L https://arxiv.org/pdf/1904.04051 \
    -o references/qft/FewsterRejzner2019/FewsterRejzner2019_arxiv.pdf
  gunzip -c references/qft/FewsterRejzner2019/FewsterRejzner2019_arxiv_eprint.tar.gz \
    > references/qft/FewsterRejzner2019/source/AQFTIMPRS-Oct2019.tex
  pdftotext -layout -enc UTF-8 \
    references/qft/FewsterRejzner2019/FewsterRejzner2019_arxiv.pdf \
    references/qft/FewsterRejzner2019/FewsterRejzner2019_pdftotext.txt
  ```
- **Verified anchor -- field algebra of test functions:** the text never uses
  the historical name "Borchers-Uhlmann algebra" verbatim (checked: zero hits
  for `[Bb]orchers` in both the tex source and the pdftotext extraction), but
  it explicitly constructs the same object under the name "algebra
  $\mathcal A(M)$" / "field algebra":
  - `source/AQFTIMPRS-Oct2019.tex:724` -- generators $\Phi(f)$ labelled by test
    functions $f\in C_0^\infty(M)$, with relations imposed for all test
    functions $f,g$ (linearity, hermiticity $\Phi(f)^*=\Phi(\overline f)$,
    field equation, CCR/covariant commutation relations), and a pointer to
    Appendix `appx:presentation` for the full construction.
  - `source/AQFTIMPRS-Oct2019.tex:889` -- the resulting algebras
    $\mathcal F(\mathcal O)$ are named explicitly as "local field algebras".
  - `source/AQFTIMPRS-Oct2019.tex:1901`--`:1920` (Appendix "Construction of an
    algebra from generators and relations") -- the precise
    Borchers-Uhlmann-style construction: the free unital $*$-algebra
    $\mathcal U$ on the $\Phi(f)$'s and their finite products, the two-sided
    $*$-ideal $\mathcal I$ generated by the relations, and
    $\mathcal A(M):=\mathcal U/\mathcal I$.
  - No substitution was needed: the construction matches the Borchers-Uhlmann
    /free-field-algebra-of-test-functions object exactly, just without that
    specific historical name attached.
- **Why acquired:** anchors the Borchers-Uhlmann / field-algebra-of-test-
  functions leg of the categorical pipeline vision shard CA-62 by name (via
  its "algebra from generators and relations" construction) -- the pedagogical
  AQFT reference the report cites for the abstract field-algebra formalism
  the continuum limit is required to land in.

## Notes

- The targeted OCR is an anchor convenience, not an authoritative replacement
  for the DjVu page image. OCR around equations is visibly noisy; report prose
  that depends on exact signs, indices, or tensor components must be checked
  against the DjVu page image before being promoted.
- (2026-07-05 addendum) For `FewsterRejzner2019`, the arXiv e-print `.tex`
  source is the authoritative artifact for line-number citations; the PDF and
  `pdftotext` extraction are cross-checks.
