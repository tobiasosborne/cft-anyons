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

### SRC-HONGLER-JOHANSSON-KYTOLA-2013 -- discrete GFF lattice Virasoro

- **Authors:** Clement Hongler, Fredrik Johansson Viklund, and Kalle Kytola
- **Title:** Lattice Representations of the Virasoro Algebra I: Discrete
  Gaussian Free Field
- **Venue/status:** arXiv preprint, version `v1` dated 2013-07-15; EPFL
  Infoscience record lists the item as an open-access preprint with issue year
  2015.
- **arXiv:** `1307.4104v1`
- **Local EPFL PDF:**
  `references/lattice-symmetry/HonglerJohanssonKytola2013/HonglerJohanssonKytola2013_EPFL.pdf`
  (26 PDF pages; 3382812 bytes)
- **PDF SHA256:**
  `376f25895a2a5be0a7db1ab1337fab69fc11efc1601e69e7b4c2b438bb82b24d`
- **PDF MD5 / EPFL ETag cross-check:**
  `16eed1a3ee21f1458ccf7485f84d6254`
- **Local arXiv v1 source package:**
  `references/lattice-symmetry/HonglerJohanssonKytola2013/HonglerJohanssonKytola2013_arxiv_v1_eprint.tar.gz`
- **Source-package SHA256:**
  `266499038dad01ee7d2e349e6eefe9f58e8e9f6924395901b3107467099eb7d0`
- **Extracted source TeX:**
  `references/lattice-symmetry/HonglerJohanssonKytola2013/source/vir_20130715.tex`
  (2097 lines; SHA256
  `b0f27bc9a89c18ebf7583333c074e839c1fd39741b8e11c684e6cdc1e0deea1b`;
  after stripping trailing horizontal whitespace from the extracted copy only)
- **PDF text extraction:**
  `references/lattice-symmetry/HonglerJohanssonKytola2013/HonglerJohanssonKytola2013_pdftotext.txt`
  (1192 lines; SHA256
  `c363df9b4632cce537f0cc046146b05252750a8288437ad07b52824a23bbde3a`)
- **Retrieval:** fetched on 2026-05-30. Legal source URLs:
  `https://infoscience.epfl.ch/entities/publication/85dca64b-7343-4f74-80f5-6539bb99a504`,
  `https://infoscience.epfl.ch/record/200327/files/Lattice%20Representations%20of%20the%20Virasoro%20Algebra%20I%20%20-%20Discrete%20Gaussian%20Free%20Field.pdf`,
  `https://arxiv.org/abs/1307.4104v1`, and
  `https://arxiv.org/e-print/1307.4104v1`.
- **Extraction command:**
  ```bash
  mkdir -p references/lattice-symmetry/HonglerJohanssonKytola2013/source
  curl -L --fail --show-error -A 'Mozilla/5.0' \
    'https://infoscience.epfl.ch/record/200327/files/Lattice%20Representations%20of%20the%20Virasoro%20Algebra%20I%20%20-%20Discrete%20Gaussian%20Free%20Field.pdf' \
    -o references/lattice-symmetry/HonglerJohanssonKytola2013/HonglerJohanssonKytola2013_EPFL.pdf
  pdftotext -layout -enc UTF-8 \
    references/lattice-symmetry/HonglerJohanssonKytola2013/HonglerJohanssonKytola2013_EPFL.pdf \
    references/lattice-symmetry/HonglerJohanssonKytola2013/HonglerJohanssonKytola2013_pdftotext.txt
  curl -L --fail --show-error -A 'Mozilla/5.0' \
    https://arxiv.org/e-print/1307.4104v1 \
    -o references/lattice-symmetry/HonglerJohanssonKytola2013/HonglerJohanssonKytola2013_arxiv_v1_eprint.tar.gz
  tar -xzf references/lattice-symmetry/HonglerJohanssonKytola2013/HonglerJohanssonKytola2013_arxiv_v1_eprint.tar.gz \
    -C references/lattice-symmetry/HonglerJohanssonKytola2013/source vir_20130715.tex
  perl -0pi -e 's/[ \t]+$//mg' \
    references/lattice-symmetry/HonglerJohanssonKytola2013/source/vir_20130715.tex
  ```
- **Verified anchor ranges:**
  - `source/vir_20130715.tex:96`--`:111` -- title/authors and abstract:
    dGFF on the square grid, explicit Virasoro representations acting on
    Gibbs measures, and the algebraic CFT structure present at lattice level.
  - `source/vir_20130715.tex:132`--`:138` and `:161`--`:166` -- source
    boundary: CFT applications to lattice models often assume scaling limits,
    and passing to scaling limits is named as a difficulty.
  - `source/vir_20130715.tex:217`--`:242` -- measure-theoretic framework:
    complex Gibbs measures, changes of measure, and change-of-measure
    operators are the operator surface.
  - `source/vir_20130715.tex:270`--`:286` -- central object and domain:
    whole-plane dGFF on the square grid, pinned at zero.
  - `source/vir_20130715.tex:354`--`:374` -- main dGFF theorem statement:
    a space of changes of measure and parity-preserving `L_n` operators give
    a `c=1` Virasoro representation, with a conjugate commuting copy.
  - `source/vir_20130715.tex:409`--`:429` -- proof roadmap: current modes,
    contour-integral insertions, lift to change-of-measure operators,
    Heisenberg relations, Sugawara construction, and commuting Virasoro
    representations.
  - `source/vir_20130715.tex:448`--`:460` -- discrete analogues of
    `partial phi`, monomials, and contour integrals; definition of the
    discrete current `J(z)`.
  - `source/vir_20130715.tex:498`--`:536` -- discrete current modes act on
    field insertions by contour integrals; contour independence holds at the
    level of expected insertions, not pointwise realizations.
  - `source/vir_20130715.tex:583`--`:593` -- Sugawara finiteness boundary:
    truncation is for insertions of cylinder functions, and action on
    interesting Gibbs measures is not recovered as a finite quadratic
    expression in the current-mode operators.
  - `source/vir_20130715.tex:1062`--`:1076` -- pinned dGFF construction from
    the massless limit of the massive field after subtracting the value at the
    origin.
  - `source/vir_20130715.tex:1079`--`:1106` -- discrete current
    `J(z)=[partial phi](z)` and its two-point correlations.
  - `source/vir_20130715.tex:1138`--`:1162` -- definition of discrete current
    modes on finite-subgraph insertions by contour integrals.
  - `source/vir_20130715.tex:1209`--`:1222` -- contour independence for the
    iterated current-mode insertion integrals under radial ordering.
  - `source/vir_20130715.tex:1305`--`:1338` -- current modes induce
    change-of-measure operators on the Gibbs-measure space.
  - `source/vir_20130715.tex:1375`--`:1424` -- unique current-mode operators
    `a_n` and their Heisenberg commutation relations.
  - `source/vir_20130715.tex:1513`--`:1566` -- Sugawara definition of
    `mathfrak L_n`, finite action on cylinder-function insertions, and lift
    to `L_n`, `bar L_n` change-of-measure operators.
  - `source/vir_20130715.tex:1621`--`:1637` -- theorem: the `L_n` and
    conjugate `bar L_n` families yield commuting `c=1` Virasoro
    representations.
- **Boundary notes:**
  - This is the original dGFF `v1` source. The unversioned arXiv e-print
    endpoint currently resolves to a later expanded paper titled "Conformal
    Field Theory at the Lattice Level: Discrete Complex Analysis and Virasoro
    Structure"; it was not used for the anchor list above.
  - The source supports lattice-level Virasoro/change-of-measure claims for the
    dGFF on the square grid. It does not by itself supply the missing continuum
    stress-energy/Poincare-generator source or harmonic-chain energy-current
    formulas.
