# Source Manifest — `references/cft/`

Conformal-field-theory ground-truth sources. Per AGENTS.md Law 1, every claim
that uses one of these cites a local path + line locator into the extracted
markdown (or a page in the PDF).

## Sources

### SRC-SCHOTTENLOHER-CFT — Schottenloher, *A Mathematical Introduction to CFT*

- **Author:** Martin Schottenloher
- **Title:** A Mathematical Introduction to Conformal Field Theory
- **Series:** Lecture Notes in Physics, vol. 759 (2nd edition)
- **Publisher:** Springer, Berlin Heidelberg, 2008
- **DOI:** 10.1007/978-3-540-68628-6
- **ISBN:** 978-3-540-68625-5 (print) / 978-3-540-68628-6 (online)
- **Local PDF:** `references/cft/Schottenloher2008.pdf` (249 pp)
- **PDF SHA256:** `b81c172da0138c3b8b28483be881a5d035f427aa476dfb2027a304e142b1e97c`
- **Extracted markdown:** `references/cft/Schottenloher2008/Schottenloher2008.md`
  (via `marker`; SHA256 recorded below)
- **Extraction SHA256:** `d718428a2feb94e4f26b1c9c59b3dce3826b68d146f251cb95cde2bbed80cb40`
  (markdown via `marker`; 7740 lines; equations preserved as LaTeX, e.g. the
  Virasoro central-charge commutator and stress-tensor mode expansion).
  Sidecar: `Schottenloher2008_meta.json` + 9 extracted figures (`_page_*.jpeg`).
- **Retrieval:** copied 2026-05-30 from the owner's personal library
  (`C:\Users\tobia\Dropbox\Books and Papers\Physics\Quantum field theory\Conformal field theory\`).
  Owner-held copy; not redistributed in this repo's public remote beyond fair
  scholarly use. Re-acquirable via Springer / TIB (LUH institutional access).
- **Why it's here:** the owner's primary CFT reference; designated ground truth
  for the rigorous-CFT target end of the pipeline (CA-01 Stage 5 — conformal
  nets / VOA / Wightman, central charge / Virasoro / OPE conventions).

### SRC-AASEN-MONG-FENDLEY-2016 -- Aasen, Mong, Fendley, topological defects on the lattice I: Ising

- **Authors:** David Aasen, Roger S. K. Mong, Paul Fendley
- **Title:** Topological Defects on the Lattice I: The Ising model
- **arXiv:** `1601.07185` (submitted 2016-01-26; cond-mat.stat-mech). Published
  J. Phys. A: Math. Theor. 49, 354001 (2016).
- **Local arXiv source package:**
  `references/cft/AasenMongFendley2016/AasenMongFendley2016_arxiv_eprint.tar.gz`
- **Source-package SHA256:**
  `55566c1dff494a07414f68d75aa8814ecd94a78c2bbbbe7da0464e8d626932b2`
- **Local arXiv PDF:**
  `references/cft/AasenMongFendley2016/AasenMongFendley2016_arxiv.pdf`
  (45 PDF pages; 2190543 bytes)
- **PDF SHA256:**
  `b5074a4352c092b848b1200928bd5f6a6b7448663b016e7209a80457f4219f79`
- **Extracted source TeX:**
  `references/cft/AasenMongFendley2016/source/Ising-Defects.tex`
  (2927 lines; SHA256
  `b2bffd8a1492d3a144490f7f8c8fb4bb6809871801fb40e844c5a66b1895b26a`),
  plus `.../source/Ising-Defects.bbl`. This is a single-file source (no
  fragment `\input`s); the e-print's ~150 individual figure PDFs were not
  copied into `source/` since they are not needed for text line anchors.
- **PDF text extraction:**
  `references/cft/AasenMongFendley2016/AasenMongFendley2016_pdftotext.txt`
  (2503 lines; SHA256
  `d66235c97cd38b8b6f48183e44d0b92495807fdbd609942327294aed0623927c`;
  `pdftotext` reported and recovered from a damaged xref table in the
  arXiv-produced PDF, `Internal Error: xref num 2450 not found ... try to
  reconstruct` -- the recovered text extraction still looks complete)
- **Retrieval:** fetched from arXiv on 2026-07-05. Legal source URLs:
  `https://arxiv.org/abs/1601.07185`,
  `https://arxiv.org/e-print/1601.07185`, and
  `https://arxiv.org/pdf/1601.07185`.
- **Extraction command:** analogous to the lattice-symmetry entries with id
  `1601.07185`; main tex is `Ising-Defects.tex`.
- **Why acquired:** anchors the lattice-defects end of the categorical
  Borchers-Uhlmann pipeline vision shard CA-62 -- this is the foundational
  paper constructing topological defect lines / duality defects directly on
  the critical Ising lattice from fusion-category data, the template the
  pipeline generalises to arbitrary (unitary) fusion/modular categories.

### SRC-AASEN-FENDLEY-MONG-2020 -- Aasen, Fendley, Mong, topological defects on the lattice: dualities and degeneracies

- **Authors:** David Aasen, Paul Fendley, Roger S. K. Mong
- **Title:** Topological Defects on the Lattice: Dualities and Degeneracies
- **arXiv:** `2008.08598` (submitted 2020-08-19; cond-mat.stat-mech / hep-th)
- **Local arXiv source package:**
  `references/cft/AasenFendleyMong2020/AasenFendleyMong2020_arxiv_eprint.tar.gz`
- **Source-package SHA256:**
  `cbe503e37813340dd7519c254fb15798974975b9e5e4c9922956da532193c98c`
- **Local arXiv PDF:**
  `references/cft/AasenFendleyMong2020/AasenFendleyMong2020_arxiv.pdf`
  (97 PDF pages; 2657435 bytes)
- **PDF SHA256:**
  `a6029e2cd1a2c8e613eac7661afe992cce32dbc3b17005b6b125830693e96a01`
- **Extracted source TeX:** multi-file source, all copied into
  `references/cft/AasenFendleyMong2020/source/`:
  - master `topological_defects_on_the_lattice.tex` (904 lines; SHA256
    `6f1eec13408047de8251414cc83f774139ba79949d72ad03913b82bd0ae7483a`),
    which `\input`s, in order: `_introduction.tex`,
    `_fusion_categories_and_diagrammatics.tex`,
    `_Statistical_mechanics_from_fusion_categories.tex`,
    `_Critical_lattice_models_as_defects_in_Turaev-Viro_theory.tex`,
    `_Topological_defect_lines.tex`, `_trivalent_junctions.tex`,
    `_applications_of_a_single_topological_defect_line.tex`,
    `_applications_of_trivalent_junctions.tex`, `_conclusion.tex`,
    `_appendices.tex`.
  - plus `topological_defects_on_the_lattice.bbl`.
  - All ten body files plus the bbl total 4898 lines. The `figures/`
    subdirectory (many PDFs) was not copied; it is not needed for text line
    anchors.
- **PDF text extraction:**
  `references/cft/AasenFendleyMong2020/AasenFendleyMong2020_pdftotext.txt`
  (5619 lines; SHA256
  `e04c15e9b0fea9ecd730f5ae244bbaff805918cc1eadcc5efbf52a41f89f4e75`)
- **Retrieval:** fetched from arXiv on 2026-07-05. Legal source URLs:
  `https://arxiv.org/abs/2008.08598`,
  `https://arxiv.org/e-print/2008.08598`, and
  `https://arxiv.org/pdf/2008.08598`.
- **Extraction command:** analogous to the entries above with id
  `2008.08598`; the master tex `\input`s the ten fragment files listed above,
  so citations to specific content should identify which fragment file the
  line number is in (fragment files keep their own line numbering, not a
  global one across the concatenated paper).
- **Why acquired:** anchors the lattice-defects end of the categorical
  Borchers-Uhlmann pipeline vision shard CA-62 alongside
  `AasenMongFendley2016` -- this is the general fusion-category (not just
  Ising) sequel giving dualities/degeneracies of topological defect lines on
  the lattice, i.e. the general-category version of the construction the
  pipeline needs.

## Notes

- Cite as, e.g.:
  ```
  % Source: references/cft/Schottenloher2008/Schottenloher2008.md:<line>
  %   "<verbatim statement / equation>"
  ```
- The PDF is the authoritative artifact; the marker markdown is a convenience
  extraction for grep/line-citation. Where they disagree, the PDF wins.
- (2026-07-05 addendum) For the two lattice-defects entries above, the arXiv
  e-print `.tex` sources are the authoritative artifact for line-number
  citations; the PDF and `pdftotext` extraction are cross-checks.
