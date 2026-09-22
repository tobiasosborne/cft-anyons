# Coset observable-system source manifest

## Landsman1998

- N. P. Landsman, *Lecture notes on C*-algebras, Hilbert C*-modules, and quantum mechanics*.
- arXiv: math-ph/9807030; https://arxiv.org/abs/math-ph/9807030
- Retrieved 2026-09-22 from https://arxiv.org/e-print/math-ph/9807030
- No revision number inferred from the unversioned endpoint.
- Original package retained; TeX extracted without edits. SHA256:
  - `Landsman1998/source.tar`: `9bf88d6e420b47ee563e13773d1da81c0a552245cf42d0d968e5815261b37f5e`
  - `Landsman1998/source.tex`: `ad3f686b4a932e8fde7694feba4d26b62e93bc9fdfa3f759008dede5d2d4279d`

## Precise anchors and reused sources

- Landsman `source.tex:2481–2493`: closed kernel and quotient algebra.
- Landsman `source.tex:2496–2508`: injective C*-morphisms are isometric.
- Landsman `source.tex:2509–2523`: every C*-morphism has closed image;
  the quotient by its kernel maps isometrically onto that image.
- `literature/md/2010.11121/2010.11121.md:101–111,126–180`: strict OAR
  connecting maps, Wilson-state limits, GNS, and represented dynamics.
- `literature/md/2306.16063/2306.16063.md:185–208,568–593`: soft maps
  and their norm-null ideal. Strong*-null is not this source's null notion.
- The Carpi–Weiner source and its provenance are in
  `references/cft-machine/coset-symmetry/SOURCES.md`.
- The KL source and its provenance are in
  `references/cft-machine/realisation/SOURCES.md`.
- GKO and existing current-limit sources are registered in
  `references/cft-machine/virasoro/SOURCES.md`.

Extraction: Python `tarfile.open` retaining only regular TeX/BibTeX members
with relative paths and no `..` components; when the payload is instead a
single gzipped TeX file, `gzip.decompress` writes `source.tex`. No OCR or
changes to the acquired author source were used.
