# Virasoro route sources — 2026-09-22

The initial route-comparison branch reused existing append-only sources.
The later coset branch acquired the original GKO paper, registered below.
The initial manifest records the precise reused artifacts and
their original registration locations. Claims and equation anchors appear in
`cft_machine/research/virasoro_routes.md`.

| Source | Authoritative URL | Existing local registration |
|---|---|---|
| T. J. Osborne, A. Stottmeister, *Conformal Field Theory from Lattice Fermions*, CMP (2023), DOI 10.1007/s00220-022-04521-8 | https://arxiv.org/abs/2107.13834 | `references/manifest/SOURCES.md`, SRC-OAR-FERMIONS |
| M. Shokrian Zini, Z. Wang, *Conformal Field Theories as Scaling Limit of Anyonic Chains* | https://arxiv.org/abs/1706.08497 | `references/lattice-symmetry/SOURCES.md`, ZiniWang2018 |
| C. Hongler, K. Kytölä, F. Viklund, *Conformal Field Theory at the Lattice Level: Discrete Complex Analysis and Virasoro Structure*, CMP (2022), DOI 10.1007/s00220-022-04475-x | https://arxiv.org/abs/1307.4104 | `references/lattice-symmetry/SOURCES.md`, SRC-HONGLER-KYTOLA-VIKLUND-2022 |
| Wavelet OAR framework | https://arxiv.org/abs/2010.11121 | `literature/md/2010.11121/2010.11121.md` |
| Soft inductive-limit framework | https://arxiv.org/abs/2306.16063 | `literature/md/2306.16063/2306.16063.md` |

Primary arXiv and publisher search results were checked on 2026-09-22 for the
OS and ZW scope. This is a verification date, not a new artifact retrieval
date. Existing extraction provenance remains authoritative. The result uses
no external-only theorem: every load-bearing source is already local.

## Reused artifact SHA256 values
139c2477e4287f714d5d3cb371a3f6a29d5a24c0b0ea15079d8ecc166504ff25  references/text/CFTFromLatticeFermions.txt
856653c8795b02c3eb160ea8cb40381cdf4af18a2974e97ccf3a137bda866c9a  references/lattice-symmetry/ZiniWang2018/source/main.tex
3524807e85b0a1f4aa6052973799f6ca2c8875d40c6211205913c1558769319f  references/lattice-symmetry/HonglerKytolaViklund2022/source/lattice-virasoro-updates-final.tex
90750880b5191b6756e8b24f9f3a63f1b20bb32ede2fb198b06932a493962eea  literature/md/2010.11121/2010.11121.md
ebff239c174706b3e2297a744df5c25cfe27d1a0f54ed4367cb5cc95e482680f  literature/md/2306.16063/2306.16063.md

## SRC-GKO-1986 — original Sugawara/coset construction

- Authors: P. Goddard, A. Kent, D. Olive.
- Title: *Unitary representations of the Virasoro and super-Virasoro algebras*.
- Journal: Communications in Mathematical Physics **103** (1986), 105–119.
- DOI: `10.1007/BF01464283`.
- Publisher acquisition URL:
  `https://link.springer.com/content/pdf/10.1007/BF01464283.pdf`.
- Retrieved 2026-09-22. No e-print source found for this pre-arXiv paper.
- Local original: `GoddardKentOlive1986/source.pdf` (15 pages).
- Local extraction: `GoddardKentOlive1986/source.txt`, generated with
  `pdftotext -layout source.pdf source.txt`.
- Visually checked original printed pages 107–108 (PDF pages 3–4):
  Eq. (2.5) coefficient is **1/(2 beta)**, not 1/beta (OCR loses the 2);
  Eq. (2.7) beta=k_aff+c_adj/2; Eq. (2.9) central charge;
  Eqs. (2.12)–(2.14) stress difference and diagonal-current commutation.
- Extraction anchors: `source.txt:123–153` for affine/Sugawara conventions;
  `:165–186` for semisimple stress sum and coset difference;
  `:195–217` for SU(2) level normalization and minimal-series central charge.
  Normal ordering Eq. (2.6) was also checked visually on printed page 108.
- Project Euclid's legal original URL returned an access-protection HTML
  page, not a PDF. That diagnostic is retained locally but ignored by Git.

SHA256:
51cdb29224c74adcc5aa969574781e5cfed7d8925637f80f9e2b49892be603a3  references/cft-machine/virasoro/GoddardKentOlive1986/source.pdf
3cb950ac9f6386622308c4f59ededc0ec777c06b8e4e0b5aa7484ff19de4c3c9  references/cft-machine/virasoro/GoddardKentOlive1986/source.txt
