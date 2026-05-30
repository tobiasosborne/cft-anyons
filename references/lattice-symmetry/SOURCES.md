# Source Manifest -- `references/lattice-symmetry/`

Ground-truth sources for lattice symmetry-generator constructions. Per
AGENTS.md Law 1, report claims cite a local path plus a line locator into an
extraction or source file.

## Sources

### SRC-KOO-SALEUR-1994 -- Koo and Saleur, lattice Virasoro generators

- **Authors:** W. M. Koo and H. Saleur
- **Title:** Representations of the Virasoro algebra from lattice models
- **Journal:** Nucl. Phys. B426 (1994) 459--504
- **arXiv:** `hep-th/9312156`
- **DOI:** `10.1016/0550-3213(94)90018-3`
- **Local arXiv source package:**
  `references/lattice-symmetry/KooSaleur1993/KooSaleur1993_arxiv_eprint.tar.gz`
- **Source-package SHA256:**
  `77cbae8a1bdb1b57bd384ec477001855e8a7c2f217195bdac18f50ab325b2992`
- **Local arXiv PDF:**
  `references/lattice-symmetry/KooSaleur1993/KooSaleur1993_arxiv.pdf`
  (61 PDF pages)
- **PDF SHA256:**
  `eb02c6fcd94cbbd1a95d51a162c3fe98d08612417d4023956103174cc7aa0d2b`
- **Extracted source TeX:**
  `references/lattice-symmetry/KooSaleur1993/source/9312156.tex`
  (3410 lines after EOF-whitespace normalization; SHA256
  `d87cf8c312ae8dad82394a1bd436db0474a6bb22cbd3d211dd67534eb88d36ce`)
- **PDF text extraction:**
  `references/lattice-symmetry/KooSaleur1993/KooSaleur1993_pdftotext.txt`
  (2327 lines; SHA256
  `a2292ea3d89d18146f66d94f7a26b1a28dc5dd0adde46c66258020e29e01fae1`)
- **Retrieval:** fetched from arXiv on 2026-05-30.
  Legal source URLs:
  `https://arxiv.org/abs/hep-th/9312156`,
  `https://arxiv.org/e-print/hep-th/9312156`, and
  `https://arxiv.org/pdf/hep-th/9312156`.
- **Extraction command:**
  ```bash
  mkdir -p references/lattice-symmetry/KooSaleur1993
  curl -L https://arxiv.org/e-print/hep-th/9312156 \
    -o references/lattice-symmetry/KooSaleur1993/KooSaleur1993_arxiv_eprint.tar.gz
  curl -L https://arxiv.org/pdf/hep-th/9312156 \
    -o references/lattice-symmetry/KooSaleur1993/KooSaleur1993_arxiv.pdf
  mkdir -p references/lattice-symmetry/KooSaleur1993/source
  tar -xzf references/lattice-symmetry/KooSaleur1993/KooSaleur1993_arxiv_eprint.tar.gz \
    -C references/lattice-symmetry/KooSaleur1993/source 9312156.tex
  pdftotext -layout -enc UTF-8 \
    references/lattice-symmetry/KooSaleur1993/KooSaleur1993_arxiv.pdf \
    references/lattice-symmetry/KooSaleur1993/KooSaleur1993_pdftotext.txt
  ```
- **Verified anchor ranges:**
  - `source/9312156.tex:36`--`:45` -- scope and status from the abstract:
    scaling limit of XXZ/RSOS models, conjectural lattice stress-energy tensor,
    Bethe-ansatz control, and mostly numerical results.
  - `source/9312156.tex:224`--`:230` -- start of the lattice stress-energy
    tensor construction for Temperley-Lieb-based critical lattice models.
  - `source/9312156.tex:606`--`:648` -- Hamiltonian limit and the
    ground-state-subtracted density term
    `e_{2j} + e_{2j-1} - 2 e_infty` mapping to `T_xx`.
  - `source/9312156.tex:704`--`:712` -- the second stress-tensor component
    involves nearest-neighbour commutators of Temperley-Lieb generators.
  - `source/9312156.tex:740`--`:793` -- conserved Hamiltonians generated from
    the diagonal transfer matrix and their expected continuum `L_0` /
    `\bar L_0` combinations.
  - `source/9312156.tex:877`--`:925` -- weighted/free-fermion Hamiltonians,
    Fourier expansion of the test function, ground-state subtraction, and
    normal ordering.
  - `source/9312156.tex:949`--`:976` -- a single Fourier component maps in the
    double scaling limit to `L_n +/- \bar L_{-n}` combinations.
  - `source/9312156.tex:1030`--`:1062` -- commutator calculation, central-term
    contribution, and the finite-`L` non-closure caveat.
  - `source/9312156.tex:1068`--`:1108` -- definition of the scaling-limit
    process and warning that the scaling limit of a commutator is not generally
    the commutator of scaling limits.
  - `source/9312156.tex:1129`--`:1150` -- definitions of lattice `H(f)` and
    `P(f)` and their leading commutator relation.
  - `source/9312156.tex:1623`--`:1673` -- main vertex-model conjecture: the
    lattice `l_n` and `\bar l_{-n}` formulas are Fourier sums of
    `e_j-e_infty` plus/minus commutator corrections, and their restricted
    double limit is conjectured to give Virasoro representations.
  - `source/9312156.tex:2219`--`:2266` -- corresponding RSOS conjecture with
    the same lattice quantities and a Hermitian-form claim in the limit.
  - `source/9312156.tex:2327`--`:2336` -- fixed-boundary lattice formula and
    numerical-check/convergence caveat.
  - `source/9312156.tex:2380`--`:2396` -- conclusion: numerical evidence,
    need for exact Bethe-ansatz reproduction, and conjectured large-generator
    homomorphism from Virasoro enveloping algebra to Temperley-Lieb.

## Notes

- The arXiv source TeX is the preferred line-anchor file for formulas. The full
  source package also contains the figure files; only `9312156.tex` was unpacked
  because the figures are not needed for line anchors. The unpacked TeX anchor
  file has trailing EOF whitespace removed; the untouched arXiv source package
  above is the exact source artifact. The PDF and `pdftotext` extraction are
  registered as rendered-source cross-checks.
- This source supports the original Koo--Saleur proposal/conjecture and its
  numerical/analytic checks in XXZ, RSOS, and Temperley-Lieb settings. It does
  not by itself prove the later rigorous OAR/free-fermion convergence theorem;
  keep those claims cited to the existing lattice-fermion/OAR source.
