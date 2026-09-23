# Source Manifest -- `references/string-net/`

Ground-truth sources for the Levin--Wen string-net construction. Per
AGENTS.md Law 1, report claims cite a local path plus a line locator into an
extraction or source file.

**Provenance note (2026-09-23).** Until this manifest existed, the root
manifest entry `SRC-STRING-NET` (`references/manifest/SOURCES.md`) pointed at
`references/StringNetCondMat0510613.pdf`, which is Levin--Wen 2007,
"Detecting topological order in a ground state wave function"
(cond-mat/0510613), *not* the 2005 string-net condensation paper. The
mislabel was already recorded in
`archive/legacy-consolidation/ERRATA.md:227--231` but never fixed in the live
manifest. The 2005 paper is registered below; the root manifest row is
relabelled `SRC-LEVIN-WEN-2007-TEE`.

## Sources

### SRC-LEVIN-WEN-2005 -- Levin and Wen, string-net condensation

- **Authors:** Michael A. Levin and Xiao-Gang Wen
- **Title:** String-net condensation: A physical mechanism for topological
  phases
- **Journal:** Phys. Rev. B 71, 045110 (2005)
- **arXiv:** `cond-mat/0404617` (e-print fetched is the current arXiv version,
  v2; the source file is dated April 2004)
- **DOI:** `10.1103/PhysRevB.71.045110`
- **Local arXiv source package:**
  `references/string-net/LevinWen2005/LevinWen2005_arxiv_eprint.tar.gz`
- **Source-package SHA256:**
  `9b78132837bc14f6cc93e892987177858a9544629bfcffd0f217875408c835c3`
- **Local arXiv PDF:**
  `references/string-net/LevinWen2005/LevinWen2005_arxiv.pdf` (21 PDF pages)
- **PDF SHA256:**
  `8e31b9ec8ac2e03484c343d7ec54f92a63206ad9e3c0c92306d8522c857e9216`
- **Extracted source TeX:**
  `references/string-net/LevinWen2005/source/strnet.tex`
  (2467 lines; SHA256
  `1a2e9c35af5d98ee86e4fe37fb0a17b4aa02b804bb72b300e3696c1676ebe3b6`)
- **PDF text extraction:** none (no `pdftotext` in the acquiring container);
  the TeX source is the citable extraction. The figures (`*.eps` in the
  e-print package) are the paper's graphical rules and are not transcribed.
- **Retrieval:** fetched from arXiv on 2026-09-23.
  Legal source URLs:
  `https://arxiv.org/abs/cond-mat/0404617`,
  `https://arxiv.org/e-print/cond-mat/0404617`, and
  `https://arxiv.org/pdf/cond-mat/0404617`.
- **Extraction command:**
  ```bash
  mkdir -p references/string-net/LevinWen2005/source
  curl -L https://arxiv.org/e-print/cond-mat/0404617 \
    -o references/string-net/LevinWen2005/LevinWen2005_arxiv_eprint.tar.gz
  curl -L https://arxiv.org/pdf/cond-mat/0404617 \
    -o references/string-net/LevinWen2005/LevinWen2005_arxiv.pdf
  tar -xzf references/string-net/LevinWen2005/LevinWen2005_arxiv_eprint.tar.gz \
    -C references/string-net/LevinWen2005/source strnet.tex
  ```
- **Verified anchor ranges:**
  - `source/strnet.tex:404`--`:420` -- fixed-point wave functions: one
    fixed-point wave function per string-net condensed phase, each associated
    with a six-index `F` satisfying the self-consistency conditions.
  - `source/strnet.tex:426`--`:437` -- the RG motivation: two wave functions
    in the same phase differ only in short-distance details; all states flow
    to a fixed-point wave function.
  - `source/strnet.tex:470`--`:495` -- the fixed-point Hamiltonian is a sum of
    local kinetic terms with no string tension; the ground state is specified
    uniquely by local constraint equations, i.e. linear relations among
    amplitudes of locally differing configurations.
  - `source/strnet.tex:497`--`:524` -- the four local rules (labels
    `topinv`, `clsdst`, `bubble`, `fusion`): topological invariance,
    closed loop `= d_i`, bubble `= delta_{ij}`, and the `F`-move.
  - `source/strnet.tex:548`--`:576` -- motivation of the rules: topological
    invariance of fixed points; scale invariance for the closed-loop rule; the
    bubble rule; the `F`-move as the simplest completing constraint.
  - `source/strnet.tex:588`--`:611` -- the self-consistency conditions
    (label `pent`): normalisation, tetrahedral symmetry, pentagon, with
    `v_i = sqrt(d_i)`.
  - `source/strnet.tex:700`--`:709` -- the exactly soluble Hamiltonian
    `H = -sum_I Q_I - sum_p B_p`, `B_p = sum_s a_s B_p^s` (label `HPi`).
  - `source/strnet.tex:744`--`:770` -- matrix elements of `B_p^s` as a product
    of six `F`-symbols (label `B6F`) and the Hermiticity condition (label
    `unit`).
  - `source/strnet.tex:777`--`:791` -- the terms commute; `N+1` phases
    depending on `a_s`; the choice `a_s = d_s / sum_i d_i^2` is the
    topological phase with a smooth continuum limit whose ground state obeys
    the local rules.
  - `source/strnet.tex:806`--`:813` -- the other `N` phases have no smooth
    continuum limit.
