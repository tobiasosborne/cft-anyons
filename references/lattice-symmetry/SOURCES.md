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

### SRC-JONES-NOGO-2016 -- Jones, no-go theorem for the semicontinuous limit

- **Author:** Vaughan F. R. Jones
- **Title:** A no-go theorem for the continuum limit of a periodic quantum spin
  chain
- **arXiv:** `1607.08769` (`v1`, submitted 2016-07-29; math.OA)
- **Local arXiv source package:**
  `references/lattice-symmetry/Jones2017NoGo/Jones2017NoGo_arxiv_eprint.tar.gz`
- **Source-package SHA256:**
  `a329893915c2bc8e775137ca77a6c5f6fb8596441e881c648f856cfc8f991899`
- **Local arXiv PDF:**
  `references/lattice-symmetry/Jones2017NoGo/Jones2017NoGo_arxiv.pdf`
  (24 PDF pages; 664491 bytes)
- **PDF SHA256:**
  `f5e58461c63bb40d51cbe47a659b65e154715b50bc78343f9ccab5f407f56940`
- **Extracted source TeX:**
  `references/lattice-symmetry/Jones2017NoGo/source/nogo.tex`
  (1198 lines; SHA256
  `a4e13f88fc750fb7fb64762863a2c946fbe3948c576eaedb2ee6cf800021760f`).
  Note: this file trips `grep`'s binary-file heuristic (it has very long,
  non-wrapped lines with an odd byte or two) -- use `grep -a` or read it
  directly rather than assuming zero matches.
- **PDF text extraction:**
  `references/lattice-symmetry/Jones2017NoGo/Jones2017NoGo_pdftotext.txt`
  (1082 lines; SHA256
  `b3a3dbf1a59ee4771514cdc4964b56c2480e56707abc98dce2fb26bd2d7bfdb3`)
- **Retrieval:** fetched from arXiv on 2026-07-05. Legal source URLs:
  `https://arxiv.org/abs/1607.08769`,
  `https://arxiv.org/e-print/1607.08769`, and
  `https://arxiv.org/pdf/1607.08769`.
- **Extraction command:**
  ```bash
  mkdir -p references/lattice-symmetry/Jones2017NoGo/source
  curl -L https://arxiv.org/e-print/1607.08769 \
    -o references/lattice-symmetry/Jones2017NoGo/Jones2017NoGo_arxiv_eprint.tar.gz
  curl -L https://arxiv.org/pdf/1607.08769 \
    -o references/lattice-symmetry/Jones2017NoGo/Jones2017NoGo_arxiv.pdf
  tar -xzf references/lattice-symmetry/Jones2017NoGo/Jones2017NoGo_arxiv_eprint.tar.gz \
    -C references/lattice-symmetry/Jones2017NoGo/source nogo.tex
  pdftotext -layout -enc UTF-8 \
    references/lattice-symmetry/Jones2017NoGo/Jones2017NoGo_arxiv.pdf \
    references/lattice-symmetry/Jones2017NoGo/Jones2017NoGo_pdftotext.txt
  ```
- **Verified anchor ranges:**
  - `source/nogo.tex:61`--`:69` -- title and abstract: the Hilbert space of a
    block-spin renormalization ("semicontinuous limit") construction of a
    cyclic Temperley-Lieb spin chain does not support a chiral CFT whose
    Hamiltonian generates circle translation as a continuum limit of lattice
    rotations.
  - `source/nogo.tex:108`--`:112` -- informal precise statement: for the
    example semicontinuous limit $\mathcal H$, for any $\xi,\eta\in\mathcal H$,
    $\lim_{n\to\infty}\langle\rho_{1/2^n}\xi,\eta\rangle=0$, i.e. dyadic
    rotations are discontinuous even weakly.
  - `source/nogo.tex:951`--`:955` -- **the main (formal) no-go theorem**: for
    $P=P^{TL}$, any normalised $R\in P_2$, any annular Hilbert representation
    $V$ of $P$, and any $\xi$ in the triadic limit $\mathcal H_{R,V}$,
    $|\langle\rho\eta,\eta\rangle|=\langle\eta,\eta\rangle$ for all triadic
    rotations $\rho$ implies $\eta=0$ (proof at `:956`--`:end of section`).
- **Why acquired:** anchors the categorical Borchers-Uhlmann pipeline vision
  shard CA-62's cautionary half -- Jones' own semicontinuous-limit /
  Thompson-group construction (the direct ancestor of the pipeline's lattice
  side) provably fails to produce a continuum rotation generator, which is
  exactly the failure mode the pipeline's symmetry-generator construction must
  route around.

### SRC-ZINI-WANG-2018 -- Zini and Wang, CFTs as scaling limits of anyonic chains

- **Authors:** Modjtaba Shokrian Zini and Zhenghan Wang
- **Title:** Conformal Field Theories as Scaling Limit of Anyonic Chains
- **arXiv:** `1706.08497` (`v1` submitted 2017-06-26, this registration is
  `v4` last revised 2018-08-07; math.QA / math-ph). To appear in
  Communications in Mathematical Physics.
- **Local arXiv source package:**
  `references/lattice-symmetry/ZiniWang2018/ZiniWang2018_arxiv_eprint.tar.gz`
- **Source-package SHA256:**
  `101d64924ce0e1fb1ca4e074bf4627f5772e930131ea7d3e7bd79dc446e6b56b`
- **Local arXiv PDF:**
  `references/lattice-symmetry/ZiniWang2018/ZiniWang2018_arxiv.pdf`
  (83 PDF pages; 725017 bytes)
- **PDF SHA256:**
  `17d2d128724381945d34d2ca1ff77e9f175da7046b49b7b268219a873333c8f2`
- **Extracted source TeX:**
  `references/lattice-symmetry/ZiniWang2018/source/main.tex`
  (2051 lines; SHA256
  `856653c8795b02c3eb160ea8cb40381cdf4af18a2974e97ccf3a137bda866c9a`),
  plus `references/lattice-symmetry/ZiniWang2018/source/main.bbl`.
- **PDF text extraction:**
  `references/lattice-symmetry/ZiniWang2018/ZiniWang2018_pdftotext.txt`
  (4732 lines; SHA256
  `ec14c31fc680d48adfc0b3344606abd3acb067ec47c0befe44de54f25af212b3`)
- **Retrieval:** fetched from arXiv on 2026-07-05 (unversioned e-print/PDF
  endpoints resolve to the latest posted version, `v4`). Legal source URLs:
  `https://arxiv.org/abs/1706.08497`,
  `https://arxiv.org/e-print/1706.08497`, and
  `https://arxiv.org/pdf/1706.08497`.
- **Extraction command:**
  ```bash
  mkdir -p references/lattice-symmetry/ZiniWang2018/source
  curl -L https://arxiv.org/e-print/1706.08497 \
    -o references/lattice-symmetry/ZiniWang2018/ZiniWang2018_arxiv_eprint.tar.gz
  curl -L https://arxiv.org/pdf/1706.08497 \
    -o references/lattice-symmetry/ZiniWang2018/ZiniWang2018_arxiv.pdf
  tar -xzf references/lattice-symmetry/ZiniWang2018/ZiniWang2018_arxiv_eprint.tar.gz \
    -C references/lattice-symmetry/ZiniWang2018/source main.tex main.bbl
  pdftotext -layout -enc UTF-8 \
    references/lattice-symmetry/ZiniWang2018/ZiniWang2018_arxiv.pdf \
    references/lattice-symmetry/ZiniWang2018/ZiniWang2018_pdftotext.txt
  ```
- **Verified anchor ranges:**
  - `source/main.tex:530`--`:587` (subsection 2.1, "Low energy limit of
    quantum theories") -- the double-colimit construction of the scaling
    limit: property (**P**) (limiting spectrum, connecting unitary maps
    $\phi_n^M$, extension), the colimit spaces $\mathcal V^M$, the
    convergence property for $H_n^M\to H^M$, and the second colimit over
    $M$ producing $(\mathcal V, H)$.
  - `source/main.tex:588`--`:590` (`\begin{dfn}\label{dfn3}`) -- **definition
    of the scaling limit**: given $(\mathcal W_n,H_n)$ with connecting maps
    satisfying (**P**), the scaling limit $(\mathcal V,H)$ is the result of
    the double colimit construction, written
    $(\mathcal W_n,H_n)\xrightarrow{SL}(\mathcal V,H)$.
  - `source/main.tex:871`--`:882` (`\begin{cnj}\label{cnj4.3}`) --
    **Conjecture 4.3**: for any unitary minimal model VOA
    $\mathcal V=\mathcal V_{c,0}$ and chiral representation
    $\mathcal V_{c,h}$, there is a sequence of quantum theories with strong
    scaling limit $(\mathcal V_{c,h},L_0)$ such that for each $L_m$ there is a
    sequence $\widetilde L_m\in\mathcal A_n$ that is space-local, shifts
    energy by at most $|m|$, approximates $L_m$ restricted to energy
    $n^{d_\omega}$ up to $O(n^{-g_\omega})+R_n^m$, and has norm $O(n^{e_\omega})$.
  - `source/main.tex:127`, `:425` -- abstract/outline cross-references stating
    Conjecture 4.3 is verified for the Ising minimal model $M(4,3)$ via Ising
    anyonic chains, and is the hinge assumption for extending the paper's
    theorems to higher unitary minimal models $M(k+2,k+1)$.
- **Why acquired:** anchors the categorical Borchers-Uhlmann pipeline vision
  shard CA-62 as the positive counterpart to Jones' no-go result -- it gives a
  worked (partly conjectural) rigorous scaling-limit formalism taking anyonic
  (Temperley-Lieb) chains to chiral CFT/VOA data, which is the closest existing
  template for the pipeline's "microscopic lattice model -> continuum CFT"
  step.

### SRC-OSBORNE-STOTTMEISTER-2021-QSIM -- Osborne and Stottmeister, quantum simulation of CFT

- **Authors:** Tobias J. Osborne and Alexander Stottmeister
- **Title:** Quantum Simulation of Conformal Field Theory
- **arXiv:** `2109.14214` (submitted 2021-09-29; quant-ph)
- **Local arXiv source package:**
  `references/lattice-symmetry/OsborneStottmeister2021QSim/OsborneStottmeister2021QSim_arxiv_eprint.tar.gz`
- **Source-package SHA256:**
  `00504ff3f28955f2e919bbc72bf5ec04e7512e0bf90ac0ada92375e731ba5ada`
- **Local arXiv PDF:**
  `references/lattice-symmetry/OsborneStottmeister2021QSim/OsborneStottmeister2021QSim_arxiv.pdf`
  (26 PDF pages; 2055045 bytes)
- **PDF SHA256:**
  `5281f44857b842c0eb35b50a725d60a3a2b61549647e7cb5fcdbb7aaba70f8b3`
- **Extracted source TeX:**
  `references/lattice-symmetry/OsborneStottmeister2021QSim/source/qscft_2907.tex`
  (580 lines; SHA256
  `fd22182eb3ce70f667162b604199f9d429356fb4756073ba4538fcb0be144438`),
  plus `.../source/qscft_2907.bbl`.
- **PDF text extraction:**
  `references/lattice-symmetry/OsborneStottmeister2021QSim/OsborneStottmeister2021QSim_pdftotext.txt`
  (1040 lines; SHA256
  `5b07cbfc0d10c49a7c72135c83ba151609dd527a502c052c5a6c39f8f1adf6d4`)
- **Retrieval:** fetched from arXiv on 2026-07-05. Legal source URLs:
  `https://arxiv.org/abs/2109.14214`,
  `https://arxiv.org/e-print/2109.14214`, and
  `https://arxiv.org/pdf/2109.14214`.
- **Extraction command:** analogous to the entries above with id
  `2109.14214`; main tex is `qscft_2907.tex` (the style files `Science.bst`
  and `scicite.sty` in the e-print are compile dependencies, not needed for
  line anchors, and were not copied into `source/`).
- **Why acquired:** completes the local record of the owner's own
  Osborne-Alexander-Renner-adjacent (OAR) programme -- this paper is the
  quantum-simulation-facing companion piece to the pipeline's continuum-limit
  goal and is cited for its lattice-to-CFT simulation protocol and error
  bounds.

### SRC-OSBORNE-STOTTMEISTER-2023-ISING -- Osborne and Stottmeister, RG fixed point of 2D Ising at criticality

- **Authors:** Tobias J. Osborne and Alexander Stottmeister
- **Title:** On the renormalization group fixed point of the two-dimensional
  Ising model at criticality
- **arXiv:** `2304.03224` (submitted 2023-04-06; math-ph / quant-ph)
- **Local arXiv source package:**
  `references/lattice-symmetry/OsborneStottmeister2023Ising/OsborneStottmeister2023Ising_arxiv_eprint.tar.gz`
  (this e-print endpoint returns a single gzip-compressed `.tex` file, not a
  tar archive, despite the `.tar.gz` filename convention kept here for
  uniformity; original internal filename `inf-vol-arxiv-v1.tex`)
- **Source-package SHA256:**
  `c556619872c6ff0af05021dd2a58542a031b96388f0369a185cf2345f3cb5286`
- **Local arXiv PDF:**
  `references/lattice-symmetry/OsborneStottmeister2023Ising/OsborneStottmeister2023Ising_arxiv.pdf`
  (12 PDF pages; 271230 bytes)
- **PDF SHA256:**
  `82d6498fbd4e97ec9232d6a765fc3c3f8496818237f6245ece8ee93f011f4078`
- **Extracted source TeX:**
  `references/lattice-symmetry/OsborneStottmeister2023Ising/source/inf-vol-arxiv-v1.tex`
  (1430 lines; SHA256
  `fc560e16a092a8206bcea593e974961920cc923e2d2b504e1afa75c8d46ac0c2`)
- **PDF text extraction:**
  `references/lattice-symmetry/OsborneStottmeister2023Ising/OsborneStottmeister2023Ising_pdftotext.txt`
  (941 lines; SHA256
  `22232a8bf8c5e75d491e4aad783c2aee9131b8a6aba6a09cc4e7bcdf777b20e1`)
- **Retrieval:** fetched from arXiv on 2026-07-05. Legal source URLs:
  `https://arxiv.org/abs/2304.03224`,
  `https://arxiv.org/e-print/2304.03224`, and
  `https://arxiv.org/pdf/2304.03224`.
- **Extraction command:**
  ```bash
  mkdir -p references/lattice-symmetry/OsborneStottmeister2023Ising/source
  curl -L https://arxiv.org/e-print/2304.03224 \
    -o references/lattice-symmetry/OsborneStottmeister2023Ising/OsborneStottmeister2023Ising_arxiv_eprint.tar.gz
  curl -L https://arxiv.org/pdf/2304.03224 \
    -o references/lattice-symmetry/OsborneStottmeister2023Ising/OsborneStottmeister2023Ising_arxiv.pdf
  gunzip -c references/lattice-symmetry/OsborneStottmeister2023Ising/OsborneStottmeister2023Ising_arxiv_eprint.tar.gz \
    > references/lattice-symmetry/OsborneStottmeister2023Ising/source/inf-vol-arxiv-v1.tex
  pdftotext -layout -enc UTF-8 \
    references/lattice-symmetry/OsborneStottmeister2023Ising/OsborneStottmeister2023Ising_arxiv.pdf \
    references/lattice-symmetry/OsborneStottmeister2023Ising/OsborneStottmeister2023Ising_pdftotext.txt
  ```
- **Why acquired:** completes the local OAR programme record -- the paper
  gives a rigorous infinite-volume/RG-fixed-point construction for the
  critical 2D Ising lattice model, the concrete solvable case the pipeline's
  general fusion-category construction should reduce to.

### SRC-OSBORNE-STIEGEMANN-2019 -- Osborne and Stiegemann, quantum fields for Thompson group representations

- **Authors:** Tobias J. Osborne and Deniz E. Stiegemann
- **Title:** Quantum fields for unitary representations of Thompson's groups
  F and T
- **arXiv:** `1903.00318` (`v1` submitted 2019-03-01, this registration is
  `v2` last revised 2020-11-24; math-ph / quant-ph)
- **Local arXiv source package:**
  `references/lattice-symmetry/OsborneStiegemann2019/OsborneStiegemann2019_arxiv_eprint.tar.gz`
- **Source-package SHA256:**
  `793d78dcef67bbdcca3f42cdbdf2cf96ecee7e80c9e50b887f6f2792ba6b4efc`
- **Local arXiv PDF:**
  `references/lattice-symmetry/OsborneStiegemann2019/OsborneStiegemann2019_arxiv.pdf`
  (38 PDF pages; 653252 bytes)
- **PDF SHA256:**
  `f4690ede795714f76f9d94ddd1639ebce5b7ddb238959b8408c426d7ffbb27a7`
- **Extracted source TeX:**
  `references/lattice-symmetry/OsborneStiegemann2019/source/qftg.tex`
  (1721 lines; SHA256
  `73086f2d3a5885ac2d905346756284e5236cf4f0f90fa2e0f5348028d08fb767`),
  plus `.../source/qftg.bbl`. The e-print archive also contains a redundant
  `arxiv v2 submission/` subdirectory duplicating the same files; only the
  top-level `qftg.tex`/`qftg.bbl` were promoted to `source/`.
- **PDF text extraction:**
  `references/lattice-symmetry/OsborneStiegemann2019/OsborneStiegemann2019_pdftotext.txt`
  (2013 lines; SHA256
  `4483f44667a8ddf97252597c2697d47cc5d84f80a74355bddebe2056e93a0057`)
- **Retrieval:** fetched from arXiv on 2026-07-05 (unversioned endpoints
  resolve to the latest posted version, `v2`). Legal source URLs:
  `https://arxiv.org/abs/1903.00318`,
  `https://arxiv.org/e-print/1903.00318`, and
  `https://arxiv.org/pdf/1903.00318`.
- **Extraction command:** analogous to the entries above with id
  `1903.00318`; main tex is `qftg.tex`.
- **Why acquired:** completes the local OAR programme record -- this is the
  Thompson-group / MERA-adjacent construction of quantum fields directly
  relevant to the pipeline's symmetry-generator side, and it is the paper Jones
  (`Jones2017NoGo`, above) cites as the source of the "semicontinuous limit"
  terminology and motivation.

### SRC-KLIESCH-KOENIG-2020 -- Kliesch and Koenig, continuum limits of binary trees and the Thompson group

- **Authors:** Alexander Kliesch and Robert Koenig
- **Title:** Continuum limits of homogeneous binary trees and the Thompson
  group
- **Journal:** Phys. Rev. Lett. 124, 010601 (2020)
- **arXiv:** `1805.04839` (single version; submitted 2018-05-13; quant-ph)
- **DOI:** `10.1103/PhysRevLett.124.010601`
- **Local arXiv source package:**
  `references/lattice-symmetry/KlieschKoenig2020/KlieschKoenig2020_arxiv_eprint.tar.gz`
  (this e-print endpoint returns a single gzip-compressed `.tex` file, not a
  tar archive, despite the `.tar.gz` filename convention kept here for
  uniformity; original internal filename `ms.tex`)
- **Source-package SHA256:**
  `4ac05d209784c84e5c1378e6bf77d4867e112c24113382e4251613c5164e1ff1`
- **Local arXiv PDF:**
  `references/lattice-symmetry/KlieschKoenig2020/KlieschKoenig2020_arxiv.pdf`
  (5 PDF pages; 157690 bytes)
- **PDF SHA256:**
  `7bc58d708cae3a978ca15ab9d72102d615b76c9a76663aef7967b9308f7561c5`
- **Extracted source TeX:**
  `references/lattice-symmetry/KlieschKoenig2020/source/ms.tex`
  (1106 lines; SHA256
  `64ec50068ce30382f046bcb3963294d1045e01be50568ce6dbd25a955b33a994`)
- **PDF text extraction:**
  `references/lattice-symmetry/KlieschKoenig2020/KlieschKoenig2020_pdftotext.txt`
  (302 lines; SHA256
  `d24910b9c47c5d08ae216641f830b9080b79eb3b52070bcb48d09781d8c02094`)
- **Retrieval:** fetched from arXiv on 2026-07-05. Legal source URLs:
  `https://arxiv.org/abs/1805.04839`,
  `https://arxiv.org/e-print/1805.04839`, and
  `https://arxiv.org/pdf/1805.04839`.
- **Extraction command:**
  ```bash
  mkdir -p references/lattice-symmetry/KlieschKoenig2020/source
  curl -L https://arxiv.org/e-print/1805.04839 \
    -o references/lattice-symmetry/KlieschKoenig2020/KlieschKoenig2020_arxiv_eprint.tar.gz
  curl -L https://arxiv.org/pdf/1805.04839 \
    -o references/lattice-symmetry/KlieschKoenig2020/KlieschKoenig2020_arxiv.pdf
  gunzip -c references/lattice-symmetry/KlieschKoenig2020/KlieschKoenig2020_arxiv_eprint.tar.gz \
    > references/lattice-symmetry/KlieschKoenig2020/source/ms.tex
  pdftotext -layout -enc UTF-8 \
    references/lattice-symmetry/KlieschKoenig2020/KlieschKoenig2020_arxiv.pdf \
    references/lattice-symmetry/KlieschKoenig2020/KlieschKoenig2020_pdftotext.txt
  ```
- **Verified anchor ranges:**
  - `source/ms.tex:327`--`:330` -- abstract: extends Jones' no-go example
    (`Jones2017NoGo`, above) from a special planar-algebra isometry to
    generic tree-tensor-network coarse-graining maps, and identifies an
    easily verified necessary condition for a continuous limit to exist.
  - `source/ms.tex:407`--`:409` -- **main theorem**: for all but a
    zero-measure set of isometries $V:\mathbb{C}^d\to\mathbb{C}^d\otimes
    \mathbb{C}^d$, the induced Thompson-group representation $\rho^V$ is
    weakly discontinuous at the identity.
  - `source/ms.tex:420`--`:426` -- **necessary condition / acceptance test**:
    if the isometry's range $\cV=P(\mathbb{C}^d\otimes\mathbb{C}^d)$ (with
    $P=VV^\dagger$) satisfies $(\cV\otimes\mathbb{C}^d)\cap(\mathbb{C}^d
    \otimes\cV)=\{0\}$, then $\rho^V$ is weakly discontinuous at the
    identity; this is the refinement-map acceptance test referenced by
    CA-67.
- **Why acquired:** generic-discontinuity obstruction and necessary condition
  for continuous limits of tree-tensor-network refinement maps; provides the
  acceptance test used by the CA-67 block, and is the direct generic-isometry
  extension of Jones' no-go result already recorded in `Jones2017NoGo`.

### SRC-KOENIG-BILGIN-2010 -- Koenig and Bilgin, anyonic entanglement renormalization

- **Authors:** Robert Koenig and Ersen Bilgin
- **Title:** Anyonic entanglement renormalization
- **Journal:** Phys. Rev. B 82, 125118 (2010)
- **arXiv:** `1006.2478` (`v1` submitted 2010-06-12, this registration is
  `v2` last revised 2010-09-28; quant-ph / cond-mat.str-el)
- **DOI:** `10.1103/PhysRevB.82.125118`
- **Local arXiv source package:**
  `references/lattice-symmetry/KoenigBilgin2010/KoenigBilgin2010_arxiv_eprint.tar.gz`
- **Source-package SHA256:**
  `3beb7301fcd3ffc0d4baa60f4f2dbfd56fe2adaecc56a4c473b4d958fd1fe804`
- **Local arXiv PDF:**
  `references/lattice-symmetry/KoenigBilgin2010/KoenigBilgin2010_arxiv.pdf`
  (19 PDF pages; 728959 bytes)
- **PDF SHA256:**
  `5a1bbab935e0e773ea88fea5c5f20e00ff3d838d2e24528e472f45d22274db96`
- **Extracted source TeX:**
  `references/lattice-symmetry/KoenigBilgin2010/source/main.tex`
  (1314 lines; SHA256
  `67faa7a80596120e7b3ce9398b04016e19dce9bbc1138e2bdb5e79e8d006fa8f`),
  plus `references/lattice-symmetry/KoenigBilgin2010/source/main.bbl`
  (SHA256 `93031fe162a9b9a1f811ac2e152b5db22672999266df249aa8e4fdb8efef36d6`).
- **PDF text extraction:**
  `references/lattice-symmetry/KoenigBilgin2010/KoenigBilgin2010_pdftotext.txt`
  (1434 lines; SHA256
  `c299b4830606f80fbca345f2a7f2caff8b904e71fa2e005662e1a41c32c0fc3f`)
- **Retrieval:** fetched from arXiv on 2026-07-05 (unversioned e-print/PDF
  endpoints resolve to the latest posted version, `v2`). Legal source URLs:
  `https://arxiv.org/abs/1006.2478`,
  `https://arxiv.org/e-print/1006.2478`, and
  `https://arxiv.org/pdf/1006.2478`.
- **Extraction command:**
  ```bash
  mkdir -p references/lattice-symmetry/KoenigBilgin2010/source
  curl -L https://arxiv.org/e-print/1006.2478 \
    -o references/lattice-symmetry/KoenigBilgin2010/KoenigBilgin2010_arxiv_eprint.tar.gz
  curl -L https://arxiv.org/pdf/1006.2478 \
    -o references/lattice-symmetry/KoenigBilgin2010/KoenigBilgin2010_arxiv.pdf
  tar -xzf references/lattice-symmetry/KoenigBilgin2010/KoenigBilgin2010_arxiv_eprint.tar.gz \
    -C references/lattice-symmetry/KoenigBilgin2010/source main.tex main.bbl
  pdftotext -layout -enc UTF-8 \
    references/lattice-symmetry/KoenigBilgin2010/KoenigBilgin2010_arxiv.pdf \
    references/lattice-symmetry/KoenigBilgin2010/KoenigBilgin2010_pdftotext.txt
  ```
- **Verified anchor ranges:**
  - `source/main.tex:572`--`:574` -- abstract: variational MERA ansatz for
    chains of anyons exploiting the fusion-tree Hilbert space structure.
  - `source/main.tex:850`--`:854` -- definition of $\Omega_{\textrm{eff}}
    \subset\Omega$, the subset of anyon labels allowed per site, and the
    resulting chain Hilbert space $\bigoplus_{\vec a\in\Omega_{\textrm{eff}}^n}
    V_{\textrm{periodic}}^{\vec a}$; the golden-chain case is
    $\Omega_{\textrm{eff}}=\{a\}$ (single occupied anyon per site), while
    $\Omega_{\textrm{eff}}=\Omega$ (including the vacuum/trivial charge)
    allows creation and destruction of particles on sites.
  - `source/main.tex:871`--`:891` -- definition of the charge-conserving
    isometric MERA tensors $\Xisometry\in\End(\bigoplus_{\vec a}V^{\vec a},
    \bigoplus_{\vec a'}V^{\vec a'})$ on fusion-tree spaces, their block
    decomposition $\Xisometry=\bigoplus_c\Xisometry(c)$ by total charge
    sector, and the isometry property $\Xisometry(c)^\dagger\Xisometry(c)=
    \id$.
  - `source/main.tex:827`--`:831` -- definition of the vacuum/trace
    coefficient $[X]_{\textrm{vac}}$ as the coefficient of the empty graph
    (trivial-flux sector) in a formal superposition of trivalent labeled
    graphs; this is the $\Omega_{\textrm{eff}}$-with-vacuum bookkeeping
    convention referenced by CA blocks on anyonic MERA.
- **Why acquired:** charge-conserving MERA isometries on fusion-tree spaces
  with the $\Omega_{\textrm{eff}}$ / vacuum-coefficient bookkeeping
  conventions that the pipeline's anyonic-lattice constructions are expected
  to reuse.

### SRC-PFEIFER-ETAL-2010 -- Pfeifer, Corboz, Buerschaper, Aguado, Troyer, Vidal, simulation of anyons with tensor networks

- **Authors:** Robert N. C. Pfeifer, Philippe Corboz, Oliver Buerschaper,
  Miguel Aguado, Matthias Troyer, and Guifre Vidal
- **Title:** Simulation of anyons with tensor network algorithms
- **Journal:** Physical Review B 82, 115126 (2010)
- **arXiv:** `1006.3532` (`v1` submitted 2010-06-17, this registration is
  `v3` last revised 2010-09-30; cond-mat.str-el)
- **DOI:** `10.1103/PhysRevB.82.115126`
- **Local arXiv source package:**
  `references/lattice-symmetry/PfeiferEtAl2010/PfeiferEtAl2010_arxiv_eprint.tar.gz`
- **Source-package SHA256:**
  `bf6a847ba33f087c9ffd5a6263576a37ce8d57b51b40f6281cf9de7d0a20b281`
- **Local arXiv PDF:**
  `references/lattice-symmetry/PfeiferEtAl2010/PfeiferEtAl2010_arxiv.pdf`
  (16 PDF pages; 655118 bytes)
- **PDF SHA256:**
  `d4b1cc9db6899e6e0edbcc1990b16c96b306aefccff20ac05788150d13dcce32`
- **Extracted source TeX:**
  `references/lattice-symmetry/PfeiferEtAl2010/source/AnyonMERA.tex`
  (1199 lines; SHA256
  `d31d7303a88881fb7ced7746b6616e8080d24cead26c33cc57b7133c10d45f85`),
  plus `references/lattice-symmetry/PfeiferEtAl2010/source/AnyonMERA.bbl`
  (SHA256 `84bf176b147ba832a28a87db04f937d598060d080b241551c48278d40237ccc7`).
- **PDF text extraction:**
  `references/lattice-symmetry/PfeiferEtAl2010/PfeiferEtAl2010_pdftotext.txt`
  (1228 lines; SHA256
  `d5cfdda724efd011dd9185aa8706b7d78d479b2173b3159caa9b58eea750301c`)
- **Retrieval:** fetched from arXiv on 2026-07-05 (unversioned e-print/PDF
  endpoints resolve to the latest posted version, `v3`). Legal source URLs:
  `https://arxiv.org/abs/1006.3532`,
  `https://arxiv.org/e-print/1006.3532`, and
  `https://arxiv.org/pdf/1006.3532`.
- **Extraction command:**
  ```bash
  mkdir -p references/lattice-symmetry/PfeiferEtAl2010/source
  curl -L https://arxiv.org/e-print/1006.3532 \
    -o references/lattice-symmetry/PfeiferEtAl2010/PfeiferEtAl2010_arxiv_eprint.tar.gz
  curl -L https://arxiv.org/pdf/1006.3532 \
    -o references/lattice-symmetry/PfeiferEtAl2010/PfeiferEtAl2010_arxiv.pdf
  tar -xzf references/lattice-symmetry/PfeiferEtAl2010/PfeiferEtAl2010_arxiv_eprint.tar.gz \
    -C references/lattice-symmetry/PfeiferEtAl2010/source AnyonMERA.tex AnyonMERA.bbl
  pdftotext -layout -enc UTF-8 \
    references/lattice-symmetry/PfeiferEtAl2010/PfeiferEtAl2010_arxiv.pdf \
    references/lattice-symmetry/PfeiferEtAl2010/PfeiferEtAl2010_pdftotext.txt
  ```
- **Verified anchor ranges:**
  - `source/AnyonMERA.tex:56`--`:58` -- abstract: adapting existing tensor
    network algorithms (including MERA) to anyonic systems, applied to
    infinite chains of interacting Fibonacci anyons with scaling dimensions
    matching CFT predictions.
  - `source/AnyonMERA.tex:908`--`:928` -- construction of the 1-D ternary
    anyonic MERA from anyonic isometries and disentanglers on fusion trees,
    the coarse-graining identification of lattices $\mathcal L_{\tau-1}\to
    \mathcal L_\tau$, and the requirement that charges/degeneracies on the
    final row of isometries match the physical lattice.
- **Why acquired:** direct companion piece to `KoenigBilgin2010`'s anyonic
  MERA -- gives the independently-constructed tensor-network-algorithm
  perspective on the same charge-conserving isometry/disentangler
  formalism.

### SRC-AYENI-ETAL-2016 -- Ayeni, Singh, Pfeifer, Brennen, simulation of braiding anyons using MPS

- **Authors:** Babatunde M. Ayeni, Sukhwinder Singh, Robert N. C. Pfeifer,
  and Gavin K. Brennen
- **Title:** Simulation of braiding anyons using Matrix Product States
- **Journal:** Phys. Rev. B 93, 165128 (2016)
- **arXiv:** `1509.00903` (`v1` submitted 2015-09-02, this registration is
  `v2` last revised 2016-01-20; cond-mat.str-el / quant-ph)
- **DOI:** `10.1103/PhysRevB.93.165128`
- **Local arXiv source package:**
  `references/lattice-symmetry/AyeniEtAl2016/AyeniEtAl2016_arxiv_eprint.tar.gz`
- **Source-package SHA256:**
  `f63e7b571f523761fc9d4a8584bb57e075ce7b4b03e62f2d7fa4d3c8d567c887`
- **Local arXiv PDF:**
  `references/lattice-symmetry/AyeniEtAl2016/AyeniEtAl2016_arxiv.pdf`
  (20 PDF pages; 464819 bytes)
- **PDF SHA256:**
  `d9746fd622aca7cc252e43f55a4139ae975126cd87afd40bd7cfbe914afa3813`
- **Extracted source TeX:**
  `references/lattice-symmetry/AyeniEtAl2016/source/MPSBraidedAnyons.tex`
  (955 lines; SHA256
  `9e5ae7a2c8c6143faa9f2c757d7469cd81c422834dd612140d63f61c347b0228`),
  plus `references/lattice-symmetry/AyeniEtAl2016/source/MPSBraidedAnyons.bbl`
  (SHA256 `8150bab067efe573f6e55f4fd656f1e1d3a29369860a37941d0df692a632638b`).
- **PDF text extraction:**
  `references/lattice-symmetry/AyeniEtAl2016/AyeniEtAl2016_pdftotext.txt`
  (1475 lines; SHA256
  `e735fe36c11a484ec782b22e7782b6f69772eb7340f76774bd0c6baf58ab2d1e`)
- **Retrieval:** fetched from arXiv on 2026-07-05 (unversioned e-print/PDF
  endpoints resolve to the latest posted version, `v2`). Legal source URLs:
  `https://arxiv.org/abs/1509.00903`,
  `https://arxiv.org/e-print/1509.00903`, and
  `https://arxiv.org/pdf/1509.00903`.
- **Extraction command:**
  ```bash
  mkdir -p references/lattice-symmetry/AyeniEtAl2016/source
  curl -L https://arxiv.org/e-print/1509.00903 \
    -o references/lattice-symmetry/AyeniEtAl2016/AyeniEtAl2016_arxiv_eprint.tar.gz
  curl -L https://arxiv.org/pdf/1509.00903 \
    -o references/lattice-symmetry/AyeniEtAl2016/AyeniEtAl2016_arxiv.pdf
  tar -xzf references/lattice-symmetry/AyeniEtAl2016/AyeniEtAl2016_arxiv_eprint.tar.gz \
    -C references/lattice-symmetry/AyeniEtAl2016/source MPSBraidedAnyons.tex MPSBraidedAnyons.bbl
  pdftotext -layout -enc UTF-8 \
    references/lattice-symmetry/AyeniEtAl2016/AyeniEtAl2016_arxiv.pdf \
    references/lattice-symmetry/AyeniEtAl2016/AyeniEtAl2016_pdftotext.txt
  ```
- **Verified anchor ranges:**
  - `source/MPSBraidedAnyons.tex:112`--`:117` -- abstract: combining U(1)
    particle-number symmetry with anyonic MPS to simulate itinerant/braiding
    anyons at any specified rational filling fraction.
  - `source/MPSBraidedAnyons.tex:154`--`:155` -- the combined Anyon$\times$
    U(1) symmetric MPS is the first construction allowing simulation at an
    arbitrary specified rational particle-number density, with Hilbert space
    sectors enumerated jointly by anyonic charge and particle number.
  - `source/MPSBraidedAnyons.tex:294`--`:299` -- start of "Anyon $\times$
    U(1)-symmetric MPS": the composite charge spectrum
    $\mathcal A\times\mathcal U=\{(a,n)\}$ combining the anyonic charge
    spectrum $\mathcal A$ with the U(1) (particle-number) spectrum
    $\mathcal U$.
  - `source/MPSBraidedAnyons.tex:308` -- **variable-filling bookkeeping**:
    hardcore anyonic particles have vacuum composite charge $(\mathbb I,0)$
    (empty/vacant site) versus occupied composite charge $(a,1)$ for
    $a\in\mathcal A\setminus\{\mathbb I\}$; this is the itinerant-anyon
    variable-$N$ bookkeeping template.
- **Why acquired:** Anyon$\times$U(1) variable-filling itinerant-anyon
  construction -- the template for variable-particle-number bookkeeping
  (vacuum/vacant vs. occupied composite charges) that the pipeline's
  variable-$N$ lattice models are expected to reuse.

### SRC-BELLETETE-SAINTAUBIN-2014 -- Belletete and Saint-Aubin, principal indecomposable modules of the dilute Temperley-Lieb algebra

- **Authors:** Jonathan Belletete and Yvan Saint-Aubin
- **Title:** The principal indecomposable modules of the dilute
  Temperley-Lieb algebra
- **Journal:** J. Math. Phys. 55, 111706 (2014)
- **arXiv:** `1310.4791` (`v1` submitted 2013-10-17, this registration is
  `v2` last revised 2014-11-17; math-ph)
- **DOI:** `10.1063/1.4901546`
- **Local arXiv source package:**
  `references/lattice-symmetry/DiluteTL2014/DiluteTL2014_arxiv_eprint.tar.gz`
  (this e-print endpoint returns a single gzip-compressed `.tex` file, not a
  tar archive, despite the `.tar.gz` filename convention kept here for
  uniformity; original internal filename `Dtl_pgl_ell.06.tex`)
- **Source-package SHA256:**
  `b6babcee6c09340a736737db26a7a89ed8311e80cea12fd90fb76691ae31bdaf`
- **Local arXiv PDF:**
  `references/lattice-symmetry/DiluteTL2014/DiluteTL2014_arxiv.pdf`
  (45 PDF pages; 466981 bytes)
- **PDF SHA256:**
  `c6ef6c085884b0915484354f7aac6af7c730d43b63069e268e226ef1e734db06`
- **Extracted source TeX:**
  `references/lattice-symmetry/DiluteTL2014/source/Dtl_pgl_ell.06.tex`
  (3814 lines; SHA256
  `ee6d4db674a69a429e39ee0fd7e8f09547f09d27bdb11cda6c2fc0b89c132fab`).
  Note: like `Jones2017NoGo/source/nogo.tex`, this file trips `grep`'s
  binary-file heuristic under a plain `grep` invocation -- use `grep -a` or
  read it directly.
- **PDF text extraction:**
  `references/lattice-symmetry/DiluteTL2014/DiluteTL2014_pdftotext.txt`
  (2295 lines; SHA256
  `b590969a56e65c3c10c63af64ba59edaad7c810f143f996750fe56e59a9700a3`)
- **Retrieval:** fetched from arXiv on 2026-07-05 (unversioned e-print/PDF
  endpoints resolve to the latest posted version, `v2`). Legal source URLs:
  `https://arxiv.org/abs/1310.4791`,
  `https://arxiv.org/e-print/1310.4791`, and
  `https://arxiv.org/pdf/1310.4791`.
- **Extraction command:**
  ```bash
  mkdir -p references/lattice-symmetry/DiluteTL2014/source
  curl -L https://arxiv.org/e-print/1310.4791 \
    -o references/lattice-symmetry/DiluteTL2014/DiluteTL2014_arxiv_eprint.tar.gz
  curl -L https://arxiv.org/pdf/1310.4791 \
    -o references/lattice-symmetry/DiluteTL2014/DiluteTL2014_arxiv.pdf
  gunzip -c references/lattice-symmetry/DiluteTL2014/DiluteTL2014_arxiv_eprint.tar.gz \
    > references/lattice-symmetry/DiluteTL2014/source/Dtl_pgl_ell.06.tex
  pdftotext -layout -enc UTF-8 \
    references/lattice-symmetry/DiluteTL2014/DiluteTL2014_arxiv.pdf \
    references/lattice-symmetry/DiluteTL2014/DiluteTL2014_pdftotext.txt
  ```
- **Verified anchor ranges:**
  - `source/Dtl_pgl_ell.06.tex:150`--`:162` -- abstract: diagrammatic
    definition of the dilute Temperley-Lieb algebra $\dtl n(\beta)$ (points
    on the sides of a diagram may be left free of strings, unlike ordinary
    $\tl n$), and the paper's goal of constructing its principal
    indecomposable modules.
  - `source/Dtl_pgl_ell.06.tex:2339`--`:2345` -- **Theorem (structure of
    $\dtl n$ for $q$ generic)**: for $q$ not a root of unity, $\dtl n$ is
    semisimple with a complete set of non-isomorphic irreducible modules
    $\{\U{n,k}\}$ and an explicit left-module decomposition.
  - `source/Dtl_pgl_ell.06.tex:2693`--`:2744` -- the dilute Temperley-Lieb
    algebra shown to satisfy the axioms of a cellular algebra (Graham-Lehrer),
    giving a structural handle on principal indecomposable modules at roots
    of unity.
  - `source/Dtl_pgl_ell.06.tex:2788` (`\begin{Thm}[Structure of $\dtl n$ for
    $q$ a root of unity]\label{prop.struct.dtln}`) -- main root-of-unity
    structure theorem for the principal indecomposable modules.
- **Why acquired:** dilute-Temperley-Lieb structure theory -- the expected
  algebraic home of $\End((1\oplus X)^{\otimes L})$ for a single non-trivial
  object $X$ plus vacuum, i.e. the relevant endomorphism algebra for
  itinerant/dilute anyonic lattice models.

### SRC-BELLETETE-2015 -- Belletete, fusion rules for the Temperley-Lieb algebra and its dilute generalisation

- **Author:** Jonathan Belletete
- **Title:** Fusion rules for the Temperley-Lieb algebra and its dilute
  generalisation
- **Journal:** J. Phys. A: Math. Theor. 48, 395205 (2015)
- **arXiv:** `1505.02112` (single version; submitted 2015-05-08; math-ph)
- **DOI:** `10.1088/1751-8113/48/39/395205`
- **Local arXiv source package:**
  `references/lattice-symmetry/DiluteTLFusion2015/DiluteTLFusion2015_arxiv_eprint.tar.gz`
  (this e-print endpoint returns a single gzip-compressed `.tex` file, not a
  tar archive, despite the `.tar.gz` filename convention kept here for
  uniformity; original internal filename `Full.01.tex`)
- **Source-package SHA256:**
  `72e953fc2054763c53827b1175adcabc49c2d98cb2c0a9a2fbfc53090b590907`
- **Local arXiv PDF:**
  `references/lattice-symmetry/DiluteTLFusion2015/DiluteTLFusion2015_arxiv.pdf`
  (61 PDF pages; 519459 bytes)
- **PDF SHA256:**
  `39091bb7edef748dae2e7502cb13339ad7f3565ccea0dcc8b350f73196aa4c70`
- **Extracted source TeX:**
  `references/lattice-symmetry/DiluteTLFusion2015/source/Full.01.tex`
  (3274 lines; SHA256
  `1b1bff2f471ac9f0c0a93b71f515071af817d530cf4f12f7d8a7cbf9bb0ff1d0`).
  Note: like `Jones2017NoGo/source/nogo.tex`, this file trips `grep`'s
  binary-file heuristic under a plain `grep` invocation -- use `grep -a` or
  read it directly.
- **PDF text extraction:**
  `references/lattice-symmetry/DiluteTLFusion2015/DiluteTLFusion2015_pdftotext.txt`
  (3778 lines; SHA256
  `9d94653a8785302937db1760583a62964b8feb1b818284bd96f62c40a233e912`)
- **Retrieval:** fetched from arXiv on 2026-07-05. Legal source URLs:
  `https://arxiv.org/abs/1505.02112`,
  `https://arxiv.org/e-print/1505.02112`, and
  `https://arxiv.org/pdf/1505.02112`.
- **Extraction command:**
  ```bash
  mkdir -p references/lattice-symmetry/DiluteTLFusion2015/source
  curl -L https://arxiv.org/e-print/1505.02112 \
    -o references/lattice-symmetry/DiluteTLFusion2015/DiluteTLFusion2015_arxiv_eprint.tar.gz
  curl -L https://arxiv.org/pdf/1505.02112 \
    -o references/lattice-symmetry/DiluteTLFusion2015/DiluteTLFusion2015_arxiv.pdf
  gunzip -c references/lattice-symmetry/DiluteTLFusion2015/DiluteTLFusion2015_arxiv_eprint.tar.gz \
    > references/lattice-symmetry/DiluteTLFusion2015/source/Full.01.tex
  pdftotext -layout -enc UTF-8 \
    references/lattice-symmetry/DiluteTLFusion2015/DiluteTLFusion2015_arxiv.pdf \
    references/lattice-symmetry/DiluteTLFusion2015/DiluteTLFusion2015_pdftotext.txt
  ```
- **Verified anchor ranges:**
  - `source/Full.01.tex:83`--`:93` -- abstract: Read-Saleur/Gainutdinov-
    Vasseur style fusion product for the Temperley-Lieb family, extended
    here to the dilute Temperley-Lieb (dTL) family, with new fusion rules
    computed via induction.
  - `source/Full.01.tex:111`--`:121` -- introduction and outline: the
    conjectured Virasoro-module structure of the $\tl n$ family in the
    continuum limit, the Read-Saleur fusion-product definition (join two
    spin chains at an extremity and let them evolve), and the section-by-
    section roadmap for projective/standard/irreducible dTL and TL fusion
    rules.
- **Why acquired:** dilute Temperley-Lieb fusion rules, extending
  `DiluteTL2014`'s module-structure results with the fusion product expected
  to correspond to CFT operator-product/fusion data in the continuum limit.

### SRC-GRIMM-MARTIN-2003 -- Grimm and Martin, the bubble algebra (two-colour Temperley-Lieb)

- **Authors:** Uwe Grimm and Paul P. Martin
- **Title:** The Bubble Algebra: Structure of a Two-Colour Temperley-Lieb
  Algebra
- **Journal:** ESI preprint 1337 (2003); J. Phys. A: Math. Gen. 36 (2003)
  10551
- **arXiv:** `math-ph/0307017` (`v1` submitted 2003-07-08, this registration
  is `v3` last revised 2003-10-09)
- **DOI:** `10.1088/0305-4470/36/42/010`
- **Metadata correction:** the task brief named the authors "Grimm & Pearce";
  the arXiv abstract page and the paper itself give the true author list as
  **Uwe Grimm and Paul P. Martin** (not Pearce). Registered below under the
  true metadata.
- **Local arXiv source package:**
  `references/lattice-symmetry/BubbleAlgebra2003/BubbleAlgebra2003_arxiv_eprint.tar.gz`
- **Source-package SHA256:**
  `5be90eb12dd41b14a9d17e72c7254b909837e27f220a8e7dad14bfc7ecd63c74`
- **Local arXiv PDF:**
  `references/lattice-symmetry/BubbleAlgebra2003/BubbleAlgebra2003_arxiv.pdf`
  (24 PDF pages; 334725 bytes)
- **PDF SHA256:**
  `ad761e8e97f1305fe9a8731c6b9c86cbd2ff5b7132481710f10cd497dff70570`
- **Extracted source TeX:**
  `references/lattice-symmetry/BubbleAlgebra2003/source/twocolour.tex`
  (1589 lines; SHA256
  `06f82289321bf7f09b2bfca37bf5e77823e43488f1228f0df1497deed23c455e`)
- **PDF text extraction:**
  `references/lattice-symmetry/BubbleAlgebra2003/BubbleAlgebra2003_pdftotext.txt`
  (1042 lines; SHA256
  `4ec5512f4ccd778e8f9c60dab07bb66208d86e48a779efe01102ff99807b4078`)
- **Retrieval:** fetched from arXiv on 2026-07-05 (unversioned e-print/PDF
  endpoints resolve to the latest posted version, `v3`). Legal source URLs:
  `https://arxiv.org/abs/math-ph/0307017`,
  `https://arxiv.org/e-print/math-ph/0307017`, and
  `https://arxiv.org/pdf/math-ph/0307017`.
- **Extraction command:**
  ```bash
  mkdir -p references/lattice-symmetry/BubbleAlgebra2003/source
  curl -L https://arxiv.org/e-print/math-ph/0307017 \
    -o references/lattice-symmetry/BubbleAlgebra2003/BubbleAlgebra2003_arxiv_eprint.tar.gz
  curl -L https://arxiv.org/pdf/math-ph/0307017 \
    -o references/lattice-symmetry/BubbleAlgebra2003/BubbleAlgebra2003_arxiv.pdf
  tar -xzf references/lattice-symmetry/BubbleAlgebra2003/BubbleAlgebra2003_arxiv_eprint.tar.gz \
    -C references/lattice-symmetry/BubbleAlgebra2003/source twocolour.tex
  pdftotext -layout -enc UTF-8 \
    references/lattice-symmetry/BubbleAlgebra2003/BubbleAlgebra2003_arxiv.pdf \
    references/lattice-symmetry/BubbleAlgebra2003/BubbleAlgebra2003_pdftotext.txt
  ```
- **Verified anchor ranges:**
  - `source/twocolour.tex:53`--`:67` -- abstract: new diagram algebras
    (multiparameter generalisations of the Temperley-Lieb algebra) giving a
    rigorous foundation for the "multi-colour algebras" of Grimm, Pearce and
    others; generic representation theory determined and nongeneric
    (root-of-unity) cases located.
  - `source/twocolour.tex:1128`--`:1159` -- "On the exceptional structure of
    $T^2_n$": the $rb$-sequence/$rb$-part decomposition of the standard
    basis, the factorization of the Gram determinant into colour-blocks,
    and the reduction of two-colour Gram-determinant roots to the known
    roots-of-unity structure of the single-colour Temperley-Lieb Gram
    determinants.
- **Why acquired:** two-colour/dilute Temperley-Lieb structure theory --
  companion algebraic-structure reference alongside `DiluteTL2014` and
  `DiluteTLFusion2015` for the dilute/multi-colour Temperley-Lieb family
  expected to underlie $\End((1\oplus X)^{\otimes L})$-type endomorphism
  algebras.

## Notes (2026-07-05 addendum)

- The five entries above were acquired in the same session as
  `references/cft/AasenMongFendley2016`, `references/cft/AasenFendleyMong2020`,
  and `references/qft/FewsterRejzner2019`; see those `SOURCES.md` files for the
  lattice-defect and AQFT ends of the same acquisition batch.

## Notes (2026-07-05 addendum, second batch)

- The seven entries directly above (`KlieschKoenig2020` through
  `BubbleAlgebra2003`) were acquired in a second batch on 2026-07-05,
  targeting the discontinuity/no-go acceptance-test literature
  (`KlieschKoenig2020`), the anyonic-MERA literature
  (`KoenigBilgin2010`, `PfeiferEtAl2010`), the variable-filling
  itinerant-anyon literature (`AyeniEtAl2016`), and the dilute/two-colour
  Temperley-Lieb structure-theory literature (`DiluteTL2014`,
  `DiluteTLFusion2015`, `BubbleAlgebra2003`).
- `math-ph/0307017` was requested under the author attribution "Grimm &
  Pearce"; the true authors, confirmed from the arXiv abstract page and the
  paper itself, are Uwe Grimm and Paul P. Martin. See the metadata-correction
  note in the `SRC-GRIMM-MARTIN-2003` entry above.

### SRC-GRANS-SAMUELSSON-ETAL-2020 -- Grans-Samuelsson, Jacobsen, and Saleur, Virasoro action in quantum spin chains I

- **Authors:** Linnea Grans-Samuelsson, Jesper Lykke Jacobsen, Hubert Saleur
- **Title:** The action of the Virasoro algebra in quantum spin chains. I. The
  non-rational case
- **Journal:** J. High Energy Phys. **02** (2021) 130
- **arXiv:** `2010.12819` (`v1` submitted 2020-10-24; `v2` last revised
  2021-02-22; hep-th / cond-mat.stat-mech / math-ph)
- **DOI:** `10.1007/JHEP02(2021)130`
- **Local arXiv source package:**
  `references/lattice-symmetry/GransSamuelssonEtAl2020/GransSamuelssonEtAl2020_arxiv_eprint.tar.gz`
- **Source-package SHA256:**
  `46b49c2d488bb0f487eda5fff9d20dc09d652d6d40acf61914a1bd72374fa45e`
- **Local arXiv PDF:**
  `references/lattice-symmetry/GransSamuelssonEtAl2020/GransSamuelssonEtAl2020_arxiv.pdf`
  (61 PDF pages; 2066383 bytes)
- **PDF SHA256:**
  `ddc0493d60d48e7715c32d73c23542052966a2f5f3b4fc07094845ecb059fe63`
- **Extracted source TeX:**
  `references/lattice-symmetry/GransSamuelssonEtAl2020/source/Linnea11.5.tex`
  (5624 lines; SHA256
  `64efb94033d283801c10b2d952e640571a563215f43055140f96944221513ac3`).
  Note: the e-print also contains a `BOONDOX-cal.sty` style file and ~30 PNG
  figure files; only the main `.tex` was copied into `source/` since the
  figures are not needed for line anchors.
- **PDF text extraction:**
  `references/lattice-symmetry/GransSamuelssonEtAl2020/GransSamuelssonEtAl2020_pdftotext.txt`
  (4110 lines; SHA256
  `77e2b21122c27fbf97f5edf1f3381a2882a3bf985a5cbc4b84699ef5a2f03914`)
- **Retrieval:** fetched from arXiv on 2026-07-05 (unversioned e-print/PDF
  endpoints resolve to the latest posted version, `v2`). Legal source URLs:
  `https://arxiv.org/abs/2010.12819`,
  `https://arxiv.org/e-print/2010.12819`, and
  `https://arxiv.org/pdf/2010.12819`.
- **Extraction command:**
  ```bash
  mkdir -p references/lattice-symmetry/GransSamuelssonEtAl2020/source
  curl -L https://arxiv.org/e-print/2010.12819 \
    -o references/lattice-symmetry/GransSamuelssonEtAl2020/GransSamuelssonEtAl2020_arxiv_eprint.tar.gz
  curl -L https://arxiv.org/pdf/2010.12819 \
    -o references/lattice-symmetry/GransSamuelssonEtAl2020/GransSamuelssonEtAl2020_arxiv.pdf
  tar -xzf references/lattice-symmetry/GransSamuelssonEtAl2020/GransSamuelssonEtAl2020_arxiv_eprint.tar.gz \
    -C references/lattice-symmetry/GransSamuelssonEtAl2020/source Linnea11.5.tex
  pdftotext -layout -enc UTF-8 \
    references/lattice-symmetry/GransSamuelssonEtAl2020/GransSamuelssonEtAl2020_arxiv.pdf \
    references/lattice-symmetry/GransSamuelssonEtAl2020/GransSamuelssonEtAl2020_pdftotext.txt
  ```
- **Verified anchor ranges:**
  - `source/Linnea11.5.tex:791`--`:820` (subsection "Discrete Virasoro
    algebra", `\label{Discrete_Vir_Section}`) -- **the Koo-Saleur generator
    definition used in this paper**: Hamiltonian density
    ${\mathcal h}_j=-\frac{\gamma}{\pi\sin\gamma}e_j$ (line 791) and lattice
    momentum density ${\mathcal p}_j = i[{\mathcal h}_j,\mathcal h_{j-1}] =
    -i(\gamma/\pi\sin\gamma)^2[e_{j-1},e_j]$ (line 792-793, momentum operator
    $\mathcal P_N$ at eq. `P_phi`, line 794-796), combined into
    ${\mathcal T}_j=\frac12(\mathcal h_j+\mathcal p_j)$,
    $\bar{\mathcal T}_j=\frac12(\mathcal h_j-\mathcal p_j)$ (lines 799-806),
    Fourier-transformed into (eq. `generators`, lines 811-820):
    $\KSgen_n[N] = \frac{N}{4\pi}\big[-\frac{\gamma}{\pi\sin\gamma}
    \sum_{j=1}^N e^{inj2\pi/N}\big(e_j-e_\infty+\frac{i\gamma}{\pi\sin\gamma}
    [e_j,e_{j+1}]\big)\big] + \frac{c}{24}\delta_{n,0}$ (line 815) and the
    barred generator $\bar{\KSgen}_n[N]$ (line 817), "first derived by other
    means in [KooSaleur]" (line 822); central charge $c=1-6/(x(x+1))$ at eq.
    `c_value` (line 826). A second, alternative discretization built from the
    "ordinary XXZ" density $f_j$ (dropping the Temperley-Lieb telescoping
    terms) is given later at `source/Linnea11.5.tex:4964`--`:4972` (eq.
    `generators_hi`), and a symmetrized/shifted-phase variant at
    `source/Linnea11.5.tex:3206`--`:3208`.
  - `source/Linnea11.5.tex:2216` -- explicit statement of **the
    commutator-of-limits vs. limit-of-commutators gap**: "the issue of limits
    and commutators was raised already in [KooSaleur], where it was shown
    that the limit of commutators must sometimes differ from the commutators
    of limits," pointing forward to `\S\ref{Anomalies}`.
  - `source/Linnea11.5.tex:2487`--`:2528` -- start of
    `\section{Anomalies, and the convergence of the Koo-Saleur generators}`
    (line 2487) and its subsection "A closer look at limits and commutators"
    (`\label{limits_section}`, line 2528), defining scaling-weak convergence
    (lines 2509-2519) as the precise sense in which
    $\KSgen_n[N]\mapsto L_n$.
  - `source/Linnea11.5.tex:3198` -- **the central-term conclusion**: "We
    conclude that the limit of commutators is the same as the commutator of
    limits up to a modification of the central term," qualified as holding
    for the commutator $[\mathcal L_2,\mathcal L_{-2}]$ itself, not the bare
    product $\mathcal L_2\mathcal L_{-2}$.
  - `source/Linnea11.5.tex:3258` -- conclusion-section restatement: the exact
    nature of the limit/commutator exchange is open in general; conjectured
    that the limit of Koo-Saleur commutators is correct "only up to the
    anomalous central charge term," evidenced but not proved, encompassed in
    conjectures `ndiff0_conj`, `cstar_conjecture`, `chiral-antichiral_conj`
    and result `separate_conj`.
  - `source/Linnea11.5.tex:587`--`:602` (subsection "Physical systems and the
    Temperley-Lieb Hamiltonian") -- **sound-velocity and ground-state
    energy-density inputs**: the Hamiltonian
    $\mathcal H_N=-\frac{\gamma}{\pi\sin\gamma}\sum_{j=1}^N(e_j-e_\infty)$
    (eq. `H_phi`, line 590) whose overall prefactor "is chosen to ensure
    relativistic invariance at low energy," i.e. to fix the sound velocity
    to 1 (line 593, forward reference to the bosonization section); the
    ground-state energy density $e_\infty=\sin\gamma\, I_0$ (eq. `e_inf`,
    lines 596-598) with
    $I_0=\int_{-\infty}^{\infty}\frac{\sinh(\pi-\gamma)t}{\sinh(\pi t)
    \cosh(\gamma t)}\,\mathrm dt$ (eq. `I0-def`, lines 599-602). Line 672
    additionally notes that the XXZ and loop representations "have the same
    ground-state energy and the same `velocity of sound' determining the
    correct multiplicative normalization of the Hamiltonian."
- **Why acquired:** the direct dense-Temperley-Lieb Koo-Saleur technical
  template (form-factor numerics for the Koo-Saleur generators, and the
  first systematic treatment of the commutator-of-limits vs.
  limit-of-commutators / central-term gap) to be adapted to the dilute TL
  algebra for the CA-69+ block.

### SRC-GAINUTDINOV-READ-SALEUR-2013 -- Gainutdinov, Read, and Saleur, associative algebraic approach to bulk LCFT

- **Authors:** A. M. Gainutdinov, N. Read, H. Saleur
- **Title:** Associative algebraic approach to logarithmic CFT in the bulk:
  the continuum limit of the $gl(1|1)$ periodic spin chain, Howe duality and
  the interchiral algebra
- **Journal:** Commun. Math. Phys. **341** (2016) 35--103
- **arXiv:** `1207.6334` (`v1` submitted 2012-07-26; `v2` last revised
  2014-09-30; hep-th / cond-mat.stat-mech / math-ph / math.QA)
- **DOI:** `10.1007/s00220-015-2483-9`
- **Local arXiv source package:**
  `references/lattice-symmetry/GainutdinovReadSaleur2013/GainutdinovReadSaleur2013_arxiv_eprint.tar.gz`
- **Source-package SHA256:**
  `5de76951bc2d8d3ea3bc61d219f611cf5c8d51eeb1035f7248120870d8c0eda1`
- **Local arXiv PDF:**
  `references/lattice-symmetry/GainutdinovReadSaleur2013/GainutdinovReadSaleur2013_arxiv.pdf`
  (69 PDF pages; 1126768 bytes)
- **PDF SHA256:**
  `4dc6e53d14e15143911dde3a7776aa50936121773f0aa18933d70f983ee1bc1a`
- **Extracted source TeX:**
  `references/lattice-symmetry/GainutdinovReadSaleur2013/source/gl11-interchalg-v5-rev3.tex`
  (4198 lines; SHA256
  `590bfd7707679c7595a04967148f7c9f1c79aad2e452bd8c0e699105a1174b6f`).
  Note: the e-print also contains ~9 `.eps`/`.eps_tex` figure files; only the
  main `.tex` was copied into `source/` since the figures are not needed for
  line anchors.
- **PDF text extraction:**
  `references/lattice-symmetry/GainutdinovReadSaleur2013/GainutdinovReadSaleur2013_pdftotext.txt`
  (3895 lines; SHA256
  `7487277244aaabdf21ed72ade75629727ef96cab41559e6f8ddad7d03a9f8b6f`)
- **Retrieval:** fetched from arXiv on 2026-07-05 (unversioned e-print/PDF
  endpoints resolve to the latest posted version, `v2`). Legal source URLs:
  `https://arxiv.org/abs/1207.6334`,
  `https://arxiv.org/e-print/1207.6334`, and
  `https://arxiv.org/pdf/1207.6334`.
- **Extraction command:**
  ```bash
  mkdir -p references/lattice-symmetry/GainutdinovReadSaleur2013/source
  curl -L https://arxiv.org/e-print/1207.6334 \
    -o references/lattice-symmetry/GainutdinovReadSaleur2013/GainutdinovReadSaleur2013_arxiv_eprint.tar.gz
  curl -L https://arxiv.org/pdf/1207.6334 \
    -o references/lattice-symmetry/GainutdinovReadSaleur2013/GainutdinovReadSaleur2013_arxiv.pdf
  tar -xzf references/lattice-symmetry/GainutdinovReadSaleur2013/GainutdinovReadSaleur2013_arxiv_eprint.tar.gz \
    -C references/lattice-symmetry/GainutdinovReadSaleur2013/source gl11-interchalg-v5-rev3.tex
  pdftotext -layout -enc UTF-8 \
    references/lattice-symmetry/GainutdinovReadSaleur2013/GainutdinovReadSaleur2013_arxiv.pdf \
    references/lattice-symmetry/GainutdinovReadSaleur2013/GainutdinovReadSaleur2013_pdftotext.txt
  ```
- **Metadata correction:** this entry was requested under the arXiv id
  `1212.1378`, attributed to "Gainutdinov, Read, Saleur," described as "the
  associativity/continuum-limit-of-TL paper." Verified against the arXiv
  abstract page, `1212.1378` is in fact a *different* paper: A. M.
  Gainutdinov, H. Saleur, I. Yu. Tipunin, "Lattice W-algebras and logarithmic
  CFTs" (no Read as author; about the $U_q sl(2)$ XXZ chain / W-algebra
  centralizer construction, not the associativity/gl(1|1) framework). The
  paper actually matching the requested author list and "associativity"
  description is `1207.6334` (this entry), whose abstract explicitly says it
  "develops the principles of an associative algebraic approach to bulk
  logarithmic conformal field theories," treats the closed $gl(1|1)$ chain
  and its Jones-Temperley-Lieb algebra $JTL_N$, and relies on two companion
  papers -- "Continuum limit and symmetries of the periodic $gl(1|1)$ spin
  chain" and "Bimodule structure in the periodic $gl(1|1)$ spin chain," both
  Nucl. Phys. B **871** (2013) -- which is presumably the source of the
  originally-requested "2013" and "1212.13xx"-adjacent numbering. `1212.1378`
  was **not** fetched; `1207.6334` was fetched in its place under the
  originally-requested directory name `GainutdinovReadSaleur2013` (kept
  as-is per the append-only convention, even though this preprint's own
  `v1`/publication years are 2012/2016).
- **Why acquired:** algebraic continuum-limit framework for (Jones-)
  Temperley-Lieb spin chains -- dense-case prior art for the associativity
  structure (interchiral algebra, Howe duality) expected to generalize to
  the dilute TL / anyonic-chain setting targeted by the pipeline.

## Notes (2026-07-05 addendum, third batch)

- The two entries directly above (`GransSamuelssonEtAl2020`,
  `GainutdinovReadSaleur2013`) were acquired in a third batch on 2026-07-05,
  targeting the Koo-Saleur generator / continuum-limit-of-commutators
  technical template (`GransSamuelssonEtAl2020`) to be adapted to the dilute
  Temperley-Lieb algebra for the CA-69+ block, and the associative-algebraic
  continuum-limit framework for (Jones-)Temperley-Lieb chains
  (`GainutdinovReadSaleur2013`).
- The requested arXiv id `1212.1378` was not the paper described in the
  acquisition request; see the metadata-correction note in the
  `SRC-GAINUTDINOV-READ-SALEUR-2013` entry above for the substitution
  (`1207.6334` fetched instead) and rationale.

### SRC-ZHOU-BATCHELOR-1997 -- Zhou and Batchelor, critical behaviour of dilute O(n)/Izergin-Korepin/dilute A_L face models

- **Authors:** Y.-K. Zhou and M. T. Batchelor
- **Title:** Critical behaviour of the dilute O($n$), Izergin-Korepin and
  dilute $A_L$ face models: Bulk properties
- **Journal:** Nucl. Phys. B **485** (1997) 646--664
- **arXiv:** `cond-mat/9611156` (single version; submitted 1996-11-20;
  cond-mat.stat-mech)
- **DOI:** `10.1016/S0550-3213(96)00654-2`
- **Local arXiv source package:**
  `references/lattice-symmetry/ZhouBatchelor1997/ZhouBatchelor1997_arxiv_eprint.tar.gz`
  (this e-print endpoint returns a single gzip-compressed `.tex` file, not a
  tar archive, despite the `.tar.gz` filename convention kept here for
  uniformity; original internal filename `9611156.tex`)
- **Source-package SHA256:**
  `d4549af9ff780af66152a0f974451a761e27e41f670aa9342adf265734883d6a`
- **Local arXiv PDF:**
  `references/lattice-symmetry/ZhouBatchelor1997/ZhouBatchelor1997_arxiv.pdf`
  (23 PDF pages; 184434 bytes)
- **PDF SHA256:**
  `f6924f926db1b4b3c4467e19351eef59f5122c1877e898e1e12682bdd4c8efef`
- **Extracted source TeX:**
  `references/lattice-symmetry/ZhouBatchelor1997/source/9611156.tex`
  (1345 lines; SHA256
  `c14de0d2c807df7b373b8043b2f266ee26362a55216a969522d2ff01fe039927`)
- **PDF text extraction:**
  `references/lattice-symmetry/ZhouBatchelor1997/ZhouBatchelor1997_pdftotext.txt`
  (1389 lines; SHA256
  `8ee3d564e69407d119756306e3c82d750c49cd04c80f5addc3e5b4e532abc651`)
- **Retrieval:** fetched from arXiv on 2026-07-05. Legal source URLs:
  `https://arxiv.org/abs/cond-mat/9611156`,
  `https://arxiv.org/e-print/cond-mat/9611156`, and
  `https://arxiv.org/pdf/cond-mat/9611156`.
- **Extraction command:**
  ```bash
  mkdir -p references/lattice-symmetry/ZhouBatchelor1997/source
  curl -L https://arxiv.org/e-print/cond-mat/9611156 \
    -o references/lattice-symmetry/ZhouBatchelor1997/ZhouBatchelor1997_arxiv_eprint.tar.gz
  curl -L https://arxiv.org/pdf/cond-mat/9611156 \
    -o references/lattice-symmetry/ZhouBatchelor1997/ZhouBatchelor1997_arxiv.pdf
  gunzip -c references/lattice-symmetry/ZhouBatchelor1997/ZhouBatchelor1997_arxiv_eprint.tar.gz \
    > references/lattice-symmetry/ZhouBatchelor1997/source/9611156.tex
  pdftotext -layout -enc UTF-8 \
    references/lattice-symmetry/ZhouBatchelor1997/ZhouBatchelor1997_arxiv.pdf \
    references/lattice-symmetry/ZhouBatchelor1997/ZhouBatchelor1997_pdftotext.txt
  ```
- **Verified anchor ranges:**
  - `source/9611156.tex:81`--`:92` -- abstract: nonlinear-integral-equation
    finite-size corrections to the transfer-matrix spectra of the critical
    dilute O($n$) model, giving the operator content of the 19-vertex
    Izergin-Korepin model and the conformal weights of the dilute $A_L$ face
    models in all four regimes.
  - `source/9611156.tex:388`--`:400` -- central-charge subsection: the known
    central charges $c=1-3\phi^2/[\pi(\pi-2\lambda)]$ (branches 1 & 2) and
    $c=3/2-3\phi^2/(2\pi\lambda)$ (branches 3 & 4), citing Warnaar-Batchelor-
    Nienhuis (`WBN:92`) as the source of the branch-3/4 result.
  - `source/9611156.tex:785`--`:797` -- **regime-1/2 CFT identification**:
    `ln T(v) = -N f_\infty(v) - (\pi \sin(2i\rho v)/6N)(c-24\Delta)` and the
    resulting closed-form central charge (eq. `c12`) and conformal weights
    $\Delta$ (eq. `res12`) for the dilute O($n$) model and dilute $A_L$ face
    model.
  - `source/9611156.tex:1044`--`:1055` -- **regime-3/4 CFT identification**:
    the analogous central charge (eq. `c34`, $c=3/2-3(\pi-4\lambda)^2/(2\pi
    \lambda)$) and conformal weights (eq. `res34`) including the
    $\Delta_{\rm Ising}\in\{0,\tfrac12\}$ Ising sector, for all four regimes
    of the dilute family.
- **Why acquired:** central-charge and conformal-weight formulas for all four
  regimes of the dilute O($n$)/Izergin-Korepin/dilute $A_L$ face-model family
  -- the CFT-identification ground truth needed to anchor the continuum limit
  of the dilute Koo-Saleur block, and the source that the central charges of
  the dilute A-D-E models (Warnaar-Nienhuis-Seaton, Warnaar-Batchelor-Nienhuis)
  are built on top of.

### SRC-VERNIER-JACOBSEN-SALEUR-2014 -- Vernier, Jacobsen, and Saleur, non-compact CFT and the Izergin-Korepin model in regime III

- **Authors:** Eric Vernier, Jesper Lykke Jacobsen, and Hubert Saleur
- **Title:** Non compact conformal field theory and the $a_2^{(2)}$
  (Izergin-Korepin) model in regime III
- **Journal:** J. Phys. A: Math. Theor. **47** (2014) 285202
- **arXiv:** `1404.4497` (`v1` submitted 2014-04-17, this registration is
  `v2`; math-ph / cond-mat.stat-mech)
- **DOI:** `10.1088/1751-8113/47/28/285202`
- **Local arXiv source package:**
  `references/lattice-symmetry/VernierJacobsenSaleur2014/VernierJacobsenSaleur2014_arxiv_eprint.tar.gz`
- **Source-package SHA256:**
  `9ea1f9280bca54af5385e44a8b01236e4d01c5aff39bcca29c9fce4c2f5baec0`
- **Local arXiv PDF:**
  `references/lattice-symmetry/VernierJacobsenSaleur2014/VernierJacobsenSaleur2014_arxiv.pdf`
  (57 PDF pages; 3385438 bytes)
- **PDF SHA256:**
  `c1f757ad0afa1dfce5b76a474076a0ecb46abf5189fe503ab2b212dc22662da6`
- **Extracted source TeX:**
  `references/lattice-symmetry/VernierJacobsenSaleur2014/source/RegimeIII-v3.tex`
  (2712 lines; SHA256
  `f4fe1334bd2ad4a17dba9dc5d06fb783e68fba62443eb756ae6a4549e1557aac`).
  Note: the e-print also contains ~28 `.pdf` figure files; only the main
  `.tex` was copied into `source/` since the figures are not needed for line
  anchors.
- **PDF text extraction:**
  `references/lattice-symmetry/VernierJacobsenSaleur2014/VernierJacobsenSaleur2014_pdftotext.txt`
  (4163 lines; SHA256
  `5373c7f13093338559f705cd721a30cae3ff193be6d734dba99e97c36f68fb50`)
- **Retrieval:** fetched from arXiv on 2026-07-05 (unversioned e-print/PDF
  endpoints resolve to the latest posted version, `v2`). Legal source URLs:
  `https://arxiv.org/abs/1404.4497`,
  `https://arxiv.org/e-print/1404.4497`, and
  `https://arxiv.org/pdf/1404.4497`.
- **Extraction command:**
  ```bash
  mkdir -p references/lattice-symmetry/VernierJacobsenSaleur2014/source
  curl -L https://arxiv.org/e-print/1404.4497 \
    -o references/lattice-symmetry/VernierJacobsenSaleur2014/VernierJacobsenSaleur2014_arxiv_eprint.tar.gz
  curl -L https://arxiv.org/pdf/1404.4497 \
    -o references/lattice-symmetry/VernierJacobsenSaleur2014/VernierJacobsenSaleur2014_arxiv.pdf
  tar -xzf references/lattice-symmetry/VernierJacobsenSaleur2014/VernierJacobsenSaleur2014_arxiv_eprint.tar.gz \
    -C references/lattice-symmetry/VernierJacobsenSaleur2014/source RegimeIII-v3.tex
  pdftotext -layout -enc UTF-8 \
    references/lattice-symmetry/VernierJacobsenSaleur2014/VernierJacobsenSaleur2014_arxiv.pdf \
    references/lattice-symmetry/VernierJacobsenSaleur2014/VernierJacobsenSaleur2014_pdftotext.txt
  ```
- **Verified anchor ranges:**
  - `source/RegimeIII-v3.tex:144`--`:148` -- abstract: regime III of the
    $a_2^{(2)}$ Izergin-Korepin 19-vertex model has a continuum limit that is
    a **non-compact CFT** (the Witten Euclidian black-hole CFT), giving a
    continuous spectrum of critical exponents and strong scaling corrections;
    Bethe-ansatz numerical evidence including discrete states.
  - `source/RegimeIII-v3.tex:649`--`:650` -- Coulomb-gas argument: the regime
    III continuum limit is a compact plus a **non-compact** boson, adding
    $c=1$ to the central charge from the non-compact degree of freedom.
  - `source/RegimeIII-v3.tex:752`--`:757` -- start of "The black hole sigma
    model and the continuous spectrum": identification with the Witten black
    hole CFT / coset $SL(2,\mathbb R)_k/U(1)$.
  - `source/RegimeIII-v3.tex:802`--`:838` -- central charge of the black-hole
    CFT computed in the flat-region limit, with quantum renormalization
    $k\to k-2$ for the non-compact part.
  - `source/RegimeIII-v3.tex:879`--`:925` -- discrete-states quantum numbers
    of the black-hole CFT and their comparison with the lattice spectrum.
- **Why acquired:** regime-selection warning for the dilute Koo-Saleur target
  -- regime III of the (dilute) Izergin-Korepin family is governed by a
  **non-compact** CFT with a continuous spectrum, not a rational/logarithmic
  minimal model, so any Koo-Saleur-style lattice Virasoro construction on this
  family must avoid regime III or explicitly address the non-compact target.

### SRC-MORIN-DUCHESNE-PEARCE-2019 -- Morin-Duchesne and Pearce, fusion hierarchies, T-systems and Y-systems for the dilute A2(2) loop models

- **Authors:** Alexi Morin-Duchesne and Paul A. Pearce
- **Title:** Fusion hierarchies, $T$-systems and $Y$-systems for the dilute
  $A_2^{(2)}$ loop models
- **Journal:** J. Stat. Mech. (2019) 094007
- **arXiv:** `1905.07973` (single version; submitted 2019-05-20; math-ph /
  cond-mat.stat-mech / hep-th)
- **DOI:** `10.1088/1742-5468/ab3412`
- **Local arXiv source package:**
  `references/lattice-symmetry/MorinDuchesnePearce2019/MorinDuchesnePearce2019_arxiv_eprint.tar.gz`
- **Source-package SHA256:**
  `8eb3b037b4d5c58d32572b7c4ebbec007e97f02182e9e9e49014a8a6d8cca578`
- **Local arXiv PDF:**
  `references/lattice-symmetry/MorinDuchesnePearce2019/MorinDuchesnePearce2019_arxiv.pdf`
  (34 PDF pages; 493719 bytes)
- **PDF SHA256:**
  `ee0bdde3b635301da29728e64f29da5d0d920fc2385cc3ff1c6e6b6d0038fd2a`
- **Extracted source TeX:**
  `references/lattice-symmetry/MorinDuchesnePearce2019/source/DiluteA22Final.tex`
  (3255 lines; SHA256
  `38787028ef03df963b460a376416ec2652d118b3f3c77caac616107f2ca0f150`).
  Note: the e-print also contains `cleveref.sty`, a compile dependency not
  needed for line anchors.
- **PDF text extraction:**
  `references/lattice-symmetry/MorinDuchesnePearce2019/MorinDuchesnePearce2019_pdftotext.txt`
  (2357 lines; SHA256
  `c90d234153c2fc65f2609f591123f837657464f088fc38007a90468629cc86ee`)
- **Retrieval:** fetched from arXiv on 2026-07-05. Legal source URLs:
  `https://arxiv.org/abs/1905.07973`,
  `https://arxiv.org/e-print/1905.07973`, and
  `https://arxiv.org/pdf/1905.07973`.
- **Extraction command:**
  ```bash
  mkdir -p references/lattice-symmetry/MorinDuchesnePearce2019/source
  curl -L https://arxiv.org/e-print/1905.07973 \
    -o references/lattice-symmetry/MorinDuchesnePearce2019/MorinDuchesnePearce2019_arxiv_eprint.tar.gz
  curl -L https://arxiv.org/pdf/1905.07973 \
    -o references/lattice-symmetry/MorinDuchesnePearce2019/MorinDuchesnePearce2019_arxiv.pdf
  tar -xzf references/lattice-symmetry/MorinDuchesnePearce2019/MorinDuchesnePearce2019_arxiv_eprint.tar.gz \
    -C references/lattice-symmetry/MorinDuchesnePearce2019/source DiluteA22Final.tex
  pdftotext -layout -enc UTF-8 \
    references/lattice-symmetry/MorinDuchesnePearce2019/MorinDuchesnePearce2019_arxiv.pdf \
    references/lattice-symmetry/MorinDuchesnePearce2019/MorinDuchesnePearce2019_pdftotext.txt
  ```
- **Verified anchor ranges:**
  - `source/DiluteA22Final.tex:373`--`:383` -- abstract: fusion hierarchy,
    $T$-system and $Y$-system for the generic dilute $A_2^{(2)}$ loop models;
    closure relations at roots of unity $x=e^{i\lambda}$; known central
    charges $c=1-6(p-p')^2/(pp')$, with critical dense polymers
    $\mathcal{DLM}(1,2)$ ($c=-2$) and critical site percolation
    $\mathcal{DLM}(2,3)$ ($c=0$) as prototypical roots-of-unity examples.
  - `source/DiluteA22Final.tex:615`--`:832` -- **section "The periodic dilute
    Temperley-Lieb algebra"**, subsection "Definition of the algebra"
    (`:619`--`:832`): defines $\mathsf{pdTL}_N(\alpha,\beta)$ diagrammatically
    as the unital, associative algebra spanned by connectivity diagrams on a
    periodic (cylinder-slice) rectangle with $N$ top and $N$ bottom nodes,
    vacant-site bookkeeping, and the concatenation product with
    $\alpha^{n_\alpha}\beta^{n_\beta}$ loop-fugacity prefactors; this is the
    explicit periodic dilute TL algebra definition (citing earlier
    appearances in Grimm 2012 and Morin-Duchesne-Pierre-Rasmussen 2018).
  - `source/DiluteA22Final.tex:833`--`:1067` -- subsection "Standard modules":
    the link-state representations of $\mathsf{pdTL}_N(\alpha,\beta)$ used
    to build the transfer-matrix spectrum.
  - `source/DiluteA22Final.tex:3648`--`:3675` (PDF text extraction anchor;
    corresponds to the paper's main $T$-/$Y$-system theorems) -- closure
    relations of the $T$- and $Y$-systems at roots of unity, the paper's
    stated main result.
- **Why acquired:** dilute $A_2^{(2)}$ fusion hierarchy and central-charge
  formulas, and -- directly answering the request to locate a periodic dilute
  TL algebra definition -- this paper (not the 2025 torus paper, which only
  cites it) is where $\mathsf{pdTL}_N(\alpha,\beta)$ is explicitly defined via
  connectivity diagrams on a periodic strip; see `source/DiluteA22Final.tex:615`
  onward.

### SRC-BOILEAU-MORIN-DUCHESNE-SAINT-AUBIN-2022 -- Boileau, Morin-Duchesne, and Saint-Aubin, dilute A2(2) loop models on a strip

- **Authors:** Florence Boileau, Alexi Morin-Duchesne, and Yvan Saint-Aubin
- **Title:** Fusion hierarchies, $T$-systems and $Y$-systems for the dilute
  $A_2^{(2)}$ loop models on a strip
- **Journal:** J. Stat. Mech. (2023) 033102
- **arXiv:** `2211.09017` (single version; submitted 2022-11-16; math-ph /
  cond-mat.stat-mech / hep-th)
- **DOI:** `10.1088/1742-5468/acb7d7`
- **Metadata correction:** the acquisition request tentatively attributed
  this id to "Morin-Duchesne/Pearce area" with directory name
  `DiluteA22Strip2022`. Verified against the arXiv abstract page, the true
  authors are **Florence Boileau, Alexi Morin-Duchesne, and Yvan
  Saint-Aubin** (not Pearce). The directory name `DiluteA22Strip2022` is kept
  as originally requested (append-only convention). The paper is also **not**
  a periodic/PBC construction: it explicitly treats the **strip** (open
  boundary conditions, four boundary-condition combinations SS/CC/SC/CS) and
  states that it "complements" the periodic study of `MorinDuchesnePearce2019`
  (`AMDPP19`/`MDP19` in its own citations) -- so it does not itself supply the
  periodic dilute TL algebra structure that the request's rationale
  anticipated; that structure is in `MorinDuchesnePearce2019` (see above).
- **Local arXiv source package:**
  `references/lattice-symmetry/DiluteA22Strip2022/DiluteA22Strip2022_arxiv_eprint.tar.gz`
- **Source-package SHA256:**
  `7af0c60074f8c4ce4f0c607e60b0b88eac8c8842755d65adc8bdeda9d744c433`
- **Local arXiv PDF:**
  `references/lattice-symmetry/DiluteA22Strip2022/DiluteA22Strip2022_arxiv.pdf`
  (67 PDF pages; 876719 bytes)
- **PDF SHA256:**
  `4a4be06586451c8f19ddf15c05807973f65cd31372ebda85fcbd992c435239f2`
- **Extracted source TeX:**
  `references/lattice-symmetry/DiluteA22Strip2022/source/stripA22.tex`
  (5128 lines; SHA256
  `d622a558b599e078afe050f7fa1454cc67228d3addf90d3fd38286b95c0702c6`).
  Note: the e-print also contains 9 `.eps` figure files; only the main
  `.tex` was copied into `source/` since the figures are not needed for line
  anchors.
- **PDF text extraction:**
  `references/lattice-symmetry/DiluteA22Strip2022/DiluteA22Strip2022_pdftotext.txt`
  (4650 lines; SHA256
  `b4c4c4573f7fa287bb0b6b589fa267f4b961387f8c10dd54649edf49fde8456f`)
- **Retrieval:** fetched from arXiv on 2026-07-05. Legal source URLs:
  `https://arxiv.org/abs/2211.09017`,
  `https://arxiv.org/e-print/2211.09017`, and
  `https://arxiv.org/pdf/2211.09017`.
- **Extraction command:**
  ```bash
  mkdir -p references/lattice-symmetry/DiluteA22Strip2022/source
  curl -L https://arxiv.org/e-print/2211.09017 \
    -o references/lattice-symmetry/DiluteA22Strip2022/DiluteA22Strip2022_arxiv_eprint.tar.gz
  curl -L https://arxiv.org/pdf/2211.09017 \
    -o references/lattice-symmetry/DiluteA22Strip2022/DiluteA22Strip2022_arxiv.pdf
  tar -xzf references/lattice-symmetry/DiluteA22Strip2022/DiluteA22Strip2022_arxiv_eprint.tar.gz \
    -C references/lattice-symmetry/DiluteA22Strip2022/source stripA22.tex
  pdftotext -layout -enc UTF-8 \
    references/lattice-symmetry/DiluteA22Strip2022/DiluteA22Strip2022_arxiv.pdf \
    references/lattice-symmetry/DiluteA22Strip2022/DiluteA22Strip2022_pdftotext.txt
  ```
- **Verified anchor ranges:**
  - `source/stripA22.tex:297`--`:328` -- title/authors/abstract: dilute
    $A_2^{(2)}$ loop models on a strip of width $N$, four boundary-condition
    models (SS/CC/SC/CS), fusion hierarchy and $T$-/$Y$-systems, closure at
    roots of unity, bulk/boundary free energies; explicitly complements the
    periodic study of Morin-Duchesne and Pearce (2019).
  - `source/stripA22.tex:362`--`:658` -- **section "The dilute
    Temperley-Lieb algebra"**, subsection "Definition of the algebra"
    (`:369`--`:515`): the (open, strip) dilute TL algebra
    $\mathsf{dTL}_N(\beta)$ used for this model -- note this is the
    open/strip incarnation, not the periodic one.
  - `source/stripA22.tex:2917`--`:2969` -- subsection "$T$-system and
    $Y$-system": the strip $T$-system (eq. `Tsystem`) and its reduction to a
    $Y$-system identical in form to the periodic-boundary-condition
    $Y$-system of `MorinDuchesnePearce2019`.
  - `source/stripA22.tex:4260`--`:4273` -- conclusion: open question of which
    conformal weights arise in the continuum limit of the strip loop models,
    referencing the non-linear-integral-equation programme
    (Klumper-Pearce) for $c-24\Delta$ and expected boundary-condition-changing
    field insertions.
- **Why acquired:** dilute $A_2^{(2)}$ fusion hierarchy on the strip (open
  boundary conditions) -- companion piece to `MorinDuchesnePearce2019`'s
  periodic construction; see the metadata-correction note above for the
  rationale mismatch (it does not itself define a periodic dilute TL
  algebra).

### SRC-MORIN-DUCHESNE-KLUMPER-PEARCE-2025 -- Morin-Duchesne, Klumper, and Pearce, modular covariant torus partition functions

- **Authors:** Alexi Morin-Duchesne, Andreas Klumper, and Paul A. Pearce
- **Title:** Modular covariant torus partition functions of dense
  $A_1^{(1)}$ and dilute $A_2^{(2)}$ loop models
- **arXiv:** `2501.19288` (single version; submitted 2025-01-31; math-ph /
  cond-mat.stat-mech / hep-th)
- **DOI:** none registered at the arXiv abstract page as of retrieval (arXiv
  DOI `10.48550/arXiv.2501.19288` only; no journal DOI yet).
- **Metadata correction:** the acquisition request tentatively titled this
  "dilute A2(2)/dense A1(1) loop models on the torus." Verified against the
  arXiv abstract page, the actual title is "Modular covariant torus
  partition functions of dense $A_1^{(1)}$ and dilute $A_2^{(2)}$ loop
  models"; authors Morin-Duchesne, Klumper, Pearce are confirmed correct as
  guessed.
- **Local arXiv source package:**
  `references/lattice-symmetry/DiluteA22Torus2025/DiluteA22Torus2025_arxiv_eprint.tar.gz`
- **Source-package SHA256:**
  `1dfc112a4366a0f2967ba1e37d551e02fabe271eeba3cbd2f64c31d29cc22f8f`
- **Local arXiv PDF:**
  `references/lattice-symmetry/DiluteA22Torus2025/DiluteA22Torus2025_arxiv.pdf`
  (33 PDF pages; 673719 bytes)
- **PDF SHA256:**
  `e4aabdb9f95e30cc3831dfa3df5480337eb6fffe056dacbdf57bb9b74f908ea1`
- **Extracted source TeX:**
  `references/lattice-symmetry/DiluteA22Torus2025/source/partition.functions.arxiv.tex`
  (3002 lines; SHA256
  `625580ec0d24322559c6add59684ee023174c8edfcc687e58b1a25808ec3f1fa`).
  Note: the e-print also contains 5 `.eps` figure files; only the main
  `.tex` was copied into `source/` since the figures are not needed for line
  anchors.
- **PDF text extraction:**
  `references/lattice-symmetry/DiluteA22Torus2025/DiluteA22Torus2025_pdftotext.txt`
  (2544 lines; SHA256
  `d096beb97bad8a0ca68e8d9afaa00e6fc86206324eb12aa3393c11e60aec8dc0`)
- **Retrieval:** fetched from arXiv on 2026-07-05. Legal source URLs:
  `https://arxiv.org/abs/2501.19288`,
  `https://arxiv.org/e-print/2501.19288`, and
  `https://arxiv.org/pdf/2501.19288`.
- **Extraction command:**
  ```bash
  mkdir -p references/lattice-symmetry/DiluteA22Torus2025/source
  curl -L https://arxiv.org/e-print/2501.19288 \
    -o references/lattice-symmetry/DiluteA22Torus2025/DiluteA22Torus2025_arxiv_eprint.tar.gz
  curl -L https://arxiv.org/pdf/2501.19288 \
    -o references/lattice-symmetry/DiluteA22Torus2025/DiluteA22Torus2025_arxiv.pdf
  tar -xzf references/lattice-symmetry/DiluteA22Torus2025/DiluteA22Torus2025_arxiv_eprint.tar.gz \
    -C references/lattice-symmetry/DiluteA22Torus2025/source partition.functions.arxiv.tex
  pdftotext -layout -enc UTF-8 \
    references/lattice-symmetry/DiluteA22Torus2025/DiluteA22Torus2025_arxiv.pdf \
    references/lattice-symmetry/DiluteA22Torus2025/DiluteA22Torus2025_pdftotext.txt
  ```
- **Verified anchor ranges:**
  - `source/partition.functions.arxiv.tex:283`--`:323` -- title/authors/
    abstract: dense $A_1^{(1)}$ and dilute $A_2^{(2)}$ loop models on the
    torus with $(h,v)$ periodic/antiperiodic boundary conditions; conjectured
    scaling limits of transfer-matrix traces via Markov traces; conformal
    partition functions coincide for the dense and dilute models at roots of
    unity ($\mathcal{LM}(p,p')$ vs. $\mathcal{DLM}(p,p')$).
  - `source/partition.functions.arxiv.tex:601`--`:602` -- transfer matrix
    $\Tb(u)$ stated as an element of "the enlarged periodic Temperley-Lieb
    algebra" (dense case) and "the enlarged **dilute periodic
    Temperley-Lieb algebra**" (dilute case), **citing `\cite{MDP19}`** --
    i.e. `MorinDuchesnePearce2019` (this SOURCES.md, above) -- rather than
    defining it in this paper.
  - `source/partition.functions.arxiv.tex:684`--`:694` -- standard modules
    $\repW_{N,d,\omega}$ over the (dilute) periodic Temperley-Lieb algebra,
    following the conventions of Morin-Duchesne-Klumper-Pearce 2017/2023
    (`MDKP17`,`MDKP23`), used for the Markov-trace transfer-matrix spectrum.
  - `source/partition.functions.arxiv.tex:345`--`:353`, `:523` -- logarithmic
    (non-rational) CFT identification: central charges and conformal weights
    $\Delta_{r,s}$ of the Kac form, shared with but distinct in
    representation content from the RSOS minimal models $\mathcal M(p,p')$.
- **pdTL grep result (per acquisition request item 5):** the macro
  `\nc{\pdtl}{\mathsf{pdTL}}` is defined at
  `source/partition.functions.arxiv.tex:85` but is **never actually used**
  in the paper body (`grep -n '\\pdtl\b'` matches only line 85). The paper's
  own text spells out "periodic Temperley-Lieb algebra" / "dilute periodic
  Temperley-Lieb algebra" in prose (lines 601-602, 684) and explicitly
  **cites `MorinDuchesnePearce2019` (`\cite{MDP19}`)** for the algebra's
  definition rather than repeating it. **Conclusion: this 2025 torus paper
  does not itself contain a generator/relation presentation of a periodic
  dilute TL algebra; the explicit definition lives in
  `MorinDuchesnePearce2019/source/DiluteA22Final.tex:615`--`:832`** (see that
  entry above).
- **Why acquired:** most recent treatment of the dense/dilute torus
  partition-function problem, confirming the periodic dilute TL algebra is
  used but not redefined here; the definitional anchor was instead traced to
  `MorinDuchesnePearce2019`.

### SRC-ZHOU-PEARCE-GRIMM-1995 -- Zhou, Pearce, and Grimm, fusion of dilute A_L lattice models

- **Authors:** Yu-kui Zhou, Paul A. Pearce, and Uwe Grimm
- **Title:** Fusion of Dilute $A_L$ Lattice Models
- **Journal:** Physica A **222** (1995) 261--306
- **arXiv:** `hep-th/9506108` (single version; submitted 1995-06-17;
  hep-th)
- **DOI:** `10.1016/0378-4371(95)00287-1`
- **Local arXiv source package:**
  `references/lattice-symmetry/ZhouPearceGrimm1995/ZhouPearceGrimm1995_arxiv_eprint.tar.gz`
- **Source-package SHA256:**
  `f76c3d1ccbb053d34dc27bc1ba46998f5df245d6f92bfce73df94a8f6a1d2ae2`
- **Local arXiv PDF:**
  `references/lattice-symmetry/ZhouPearceGrimm1995/ZhouPearceGrimm1995_arxiv.pdf`
  (45 PDF pages; 396952 bytes)
- **PDF SHA256:**
  `10a7021dc604e519d51bc2f39c62318d99d6c83e4c5887e3b4bd8a76698b0446`
- **Extracted source TeX:**
  `references/lattice-symmetry/ZhouPearceGrimm1995/source/9506108.tex`
  (3925 lines; SHA256
  `ccebb0f04c2d2615b603992ee35210cf18cb1db1c4a768d4f8652f81829c4a83`).
  Note: the e-print also contains `su3lev5.ps`, a figure not needed for line
  anchors.
- **PDF text extraction:**
  `references/lattice-symmetry/ZhouPearceGrimm1995/ZhouPearceGrimm1995_pdftotext.txt`
  (2853 lines; SHA256
  `c2e43bcfad44344ed9cc5c0023bd427453ecce8e97513fde31d2ef98f6961c45`)
- **Retrieval:** fetched from arXiv on 2026-07-05. Legal source URLs:
  `https://arxiv.org/abs/hep-th/9506108`,
  `https://arxiv.org/e-print/hep-th/9506108`, and
  `https://arxiv.org/pdf/hep-th/9506108`.
- **Extraction command:**
  ```bash
  mkdir -p references/lattice-symmetry/ZhouPearceGrimm1995/source
  curl -L https://arxiv.org/e-print/hep-th/9506108 \
    -o references/lattice-symmetry/ZhouPearceGrimm1995/ZhouPearceGrimm1995_arxiv_eprint.tar.gz
  curl -L https://arxiv.org/pdf/hep-th/9506108 \
    -o references/lattice-symmetry/ZhouPearceGrimm1995/ZhouPearceGrimm1995_arxiv.pdf
  tar -xzf references/lattice-symmetry/ZhouPearceGrimm1995/ZhouPearceGrimm1995_arxiv_eprint.tar.gz \
    -C references/lattice-symmetry/ZhouPearceGrimm1995/source 9506108.tex
  pdftotext -layout -enc UTF-8 \
    references/lattice-symmetry/ZhouPearceGrimm1995/ZhouPearceGrimm1995_arxiv.pdf \
    references/lattice-symmetry/ZhouPearceGrimm1995/ZhouPearceGrimm1995_pdftotext.txt
  ```
- **Verified anchor ranges:**
  - `source/9506108.tex:1477`--`:1506` -- title/authors/abstract: fusion
    procedure implemented for the dilute $A_L$ lattice models; fusion
    hierarchy of functional equations with an $su(3)$ structure for the
    fused transfer matrices; Bethe ansatz equations; eigenvalue-spectrum/
    central-charge/conformal-weight solution deferred to a subsequent paper.
    Note: this file has a long (~1450-line) macro preamble before
    `\begin{document}` at `:1473`; the title/author macros are redefined at
    `:35`--`:36` and only invoked once, at `:1477`.
  - `source/9506108.tex:1512`--`:1552` -- introduction: dilute $A_L$ RSOS
    models context, prior $A_L$-model fusion/functional-relation results
    (Bazhanov-Reshetikhin), and the explicit statement that this paper
    derives the fusion hierarchy while eigenvalue/central-charge/conformal-
    weight solutions are left to the sequel (`ZhPe:95`, i.e.
    `ZhouBatchelor1997`-adjacent follow-on work).
  - `source/9506108.tex:3648`--`:3675` -- **main theorem** ("$su(3)$ Fusion
    Hierarchy"): functional relations
    $\T^{(n,0)}_0\T^{(1,0)}_n=\T^{(n-1,1)}_0+\T^{(n+1,0)}_0$ and
    $\T^{(n,0)}_0\T^{(0,1)}_n=\T^{(n,1)}_0+f^Y_{n-1}\T^{(n-1,0)}_0$, closure
    $\T^{(n,m)}=0$ for $m+n\ge 2L$, plus the companion symmetry theorem for
    $\T^{(n,m)}_0$ in terms of transposed/shifted fused transfer matrices.
- **Why acquired:** dilute $A_L$ fusion-hierarchy backbone -- the original
  $su(3)$-structured functional-relation derivation that
  `MorinDuchesnePearce2019` and `Boileau-Morin-Duchesne-Saint-Aubin-2022`
  build on for the dilute $A_2^{(2)}$ case specifically.

## Notes (2026-07-05 addendum, fourth batch)

- The six entries directly above (`ZhouBatchelor1997` through
  `ZhouPearceGrimm1995`) were acquired in a fourth batch on 2026-07-05,
  targeting the dilute Koo-Saleur block: central charges/conformal weights
  across all four regimes of the dilute O(n)/Izergin-Korepin/dilute A_L face
  family (`ZhouBatchelor1997`), the regime-III non-compact-CFT
  regime-selection warning (`VernierJacobsenSaleur2014`), the dilute
  A_2^{(2)} fusion hierarchy and the periodic dilute Temperley-Lieb algebra
  definition (`MorinDuchesnePearce2019`), the strip/open-boundary companion
  paper (`SRC-BOILEAU-MORIN-DUCHESNE-SAINT-AUBIN-2022`, directory
  `DiluteA22Strip2022`), the most recent torus partition-function treatment
  (`SRC-MORIN-DUCHESNE-KLUMPER-PEARCE-2025`, directory
  `DiluteA22Torus2025`), and the original dilute $A_L$ fusion-hierarchy
  backbone (`ZhouPearceGrimm1995`).
- **Metadata corrections:** (1) `2211.09017`'s true authors are Florence
  Boileau, Alexi Morin-Duchesne, and Yvan Saint-Aubin (not Pearce as
  tentatively guessed), and the paper treats the **strip** (open boundary
  conditions), not a periodic/PBC construction -- see the
  metadata-correction note in that entry. (2) `2501.19288`'s true title is
  "Modular covariant torus partition functions of dense $A_1^{(1)}$ and
  dilute $A_2^{(2)}$ loop models" (author guesses Morin-Duchesne/Klumper/
  Pearce were correct).
- **pdTL algebra search (item 5 of the acquisition request):** grepping
  `DiluteA22Torus2025/source/partition.functions.arxiv.tex` for
  `periodic dilute`/`pdTL` finds only a macro definition
  (`\nc{\pdtl}{\mathsf{pdTL}}` at line 85, never used in the body) and prose
  citations to `MorinDuchesnePearce2019` (lines 601-602, 684) for the
  algebra itself. The actual generator/diagrammatic-relation presentation of
  the periodic dilute Temperley-Lieb algebra $\mathsf{pdTL}_N(\alpha,\beta)$
  lives in `MorinDuchesnePearce2019/source/DiluteA22Final.tex:615`--`:832`
  (section "The periodic dilute Temperley-Lieb algebra", subsection
  "Definition of the algebra"), acquired in this same batch.
- **Not acquired (flagged for Tobias):** Warnaar, Nienhuis and Seaton, Phys.
  Rev. Lett. **69** (1992) 710, and Warnaar, Batchelor and Nienhuis, J. Phys.
  A **25** (1992) 3077, appear to have **no arXiv e-prints**. These two
  papers define the dilute A-D-E models and the dilute O(n)/Izergin-Korepin
  quantum chains (the explicit Hamiltonians) that `ZhouBatchelor1997` and
  `ZhouPearceGrimm1995` build on and cite as `WNS:92`/`WBN:92`; they must be
  acquired via journal or TIB access rather than arXiv.

### SRC-HONGLER-KYTOLA-VIKLUND-2022 -- CFT at the lattice level (dGFF c=1 AND Ising c=1/2)

- **Authors:** Clement Hongler, Kalle Kytola, Fredrik Johansson Viklund
- **Title:** Conformal Field Theory at the Lattice Level: Discrete Complex
  Analysis and Virasoro Structure
- **Journal:** Commun. Math. Phys. (2022); **DOI** `10.1007/s00220-022-04475-x`
- **arXiv:** `1307.4104` (unversioned/latest posted version -- the expanded,
  published paper; note the arXiv `v1`, "Lattice Representations of the
  Virasoro Algebra I: Discrete Gaussian Free Field", is registered separately
  above as `SRC-HONGLER-JOHANSSON-KYTOLA-2013`. This entry is the LATER,
  MERGED version that adds the Ising `c=1/2` construction alongside the dGFF
  `c=1` one.)
- **Local arXiv source package:**
  `references/lattice-symmetry/HonglerKytolaViklund2022/HonglerKytolaViklund2022_arxiv_eprint.tar.gz`
  (SHA256 `c2f3b94b12149defd00eba7d0774b5b1b551307810fbca4973c9eac28a1d5831`)
- **Local arXiv PDF:**
  `references/lattice-symmetry/HonglerKytolaViklund2022/HonglerKytolaViklund2022_arxiv.pdf`
  (55 PDF pages; 2051757 bytes; SHA256
  `f1a4a1b0796dec9459f0d5e2fc07f3d9e698946c5c7a01eca17868ad6ff27b6f`)
- **Extracted source TeX:**
  `references/lattice-symmetry/HonglerKytolaViklund2022/source/lattice-virasoro-updates-final.tex`
  (5841 lines; SHA256
  `3524807e85b0a1f4aa6052973799f6ca2c8875d40c6211205913c1558769319f`),
  plus `.../source/macros.tex` (259 lines; SHA256
  `1d9e98ee06458fea88c1c02c5b526430f455f4687a40b17fefe10dc061c7acc2`). The
  e-print also contains ~30 figure files; only the two `.tex` files are needed
  for line anchors.
- **PDF text extraction:**
  `references/lattice-symmetry/HonglerKytolaViklund2022/HonglerKytolaViklund2022_pdftotext.txt`
  (3047 lines; SHA256
  `4b1c00b8412f1c25c7fb7bbf768ec5318f52efc556d7220ede1329ea5b08b0a2`)
- **Retrieval:** fetched from arXiv on 2026-07-06 (unversioned e-print/PDF
  endpoints resolve to the latest posted version). Legal source URLs:
  `https://arxiv.org/abs/1307.4104`, `https://arxiv.org/e-print/1307.4104`,
  `https://arxiv.org/pdf/1307.4104`.
- **Verified anchor ranges:**
  - `source/lattice-virasoro-updates-final.tex:136`--`:143` and `:329`--`:331`
    -- abstract/scope: positive answer to whether Virasoro representations of
    CFT can be found within lattice statistical models, for BOTH the discrete
    Gaussian free field and the **Ising model**, by connecting discrete
    complex analysis to Virasoro symmetry.
  - `source/lattice-virasoro-updates-final.tex:593`--`:606` -- **informal main
    theorem**: the Sugawara constructions of the Virasoro modes of the dGFF and
    of the critical Ising model "can be naturally and exactly realized at the
    lattice level" via discrete complex Laurent modes of the lattice current
    (dGFF) resp. lattice fermion (Ising); precise forms are Theorem `thm:gff`
    and Theorem `thm:ising`.
  - `source/lattice-virasoro-updates-final.tex:2900`--`:2901`
    (`\begin{thm}\label{thm:gff}`) -- formal dGFF theorem: the operators
    `L_n^G` form the lattice `c=1` Virasoro representation.
  - `source/lattice-virasoro-updates-final.tex:4062`--`:4063`
    (`\begin{thm}\label{thm:ising}`) -- **formal Ising theorem**: setting
    `L_n^{Ising} := ...` (Sugawara/quadratic in lattice fermion modes) gives a
    lattice representation of the Virasoro algebra of the critical Ising model
    (`c=1/2`).
  - `source/lattice-virasoro-updates-final.tex:2339`
    (`\label{prop:discrete-holomorphicity-fermion-correlations}`) -- discrete
    holomorphicity of the lattice fermion correlations, the key input.
- **Why acquired:** directly answers the "discrete Ward <=> Virasoro for a
  lattice MODEL" sub-question -- the sharpest lattice-level Virasoro
  construction available, covering BOTH the free-field `c=1` (dGFF) and the
  interacting `c=1/2` (critical Ising) cases via discrete complex analysis and
  a lattice Sugawara construction, at the level of finite-lattice objects (not
  merely their scaling limits).

### SRC-CHELKAK-GLAZMAN-SMIRNOV-2016 -- discrete stress-energy tensor, Ising c=1/2 convergence

- **Authors:** Dmitry Chelkak, Alexander Glazman, Stanislav Smirnov
- **Title:** Discrete stress-energy tensor in the loop O(n) model
- **Venue/status:** arXiv preprint (math-ph), no journal reference posted; DOI
  is the arXiv DOI `10.48550/arXiv.1604.06339` only.
- **arXiv:** `1604.06339` (v1 2016-04-21; v2 2016-08-31; v3 2017-08-21;
  **v4 2025-01-04** -- the fetched unversioned endpoint resolves to v4)
- **Local arXiv source package:**
  `references/lattice-symmetry/ChelkakGlazmanSmirnov2016/ChelkakGlazmanSmirnov2016_arxiv_eprint.tar.gz`
  (SHA256 `3bcaac97c770c8d330c0633038b0fa2c0aad3c1af9e30c4fdeda1ba17bc4fb6d`)
- **Local arXiv PDF:**
  `references/lattice-symmetry/ChelkakGlazmanSmirnov2016/ChelkakGlazmanSmirnov2016_arxiv.pdf`
  (50 PDF pages; 1221789 bytes; SHA256
  `1f68cd11804eaf561c4180a46f7cfcee91ec987b4290db2ebe6e535ba219d07c`)
- **Extracted source TeX:**
  `references/lattice-symmetry/ChelkakGlazmanSmirnov2016/source/StressTensor.tex`
  (2875 lines; SHA256
  `99c66affd0476ac0e0ade0bf9356a18dff4cfc07a74a4c49dea005536b08b27c`)
- **PDF text extraction:**
  `references/lattice-symmetry/ChelkakGlazmanSmirnov2016/ChelkakGlazmanSmirnov2016_pdftotext.txt`
  (3312 lines; SHA256
  `857f8891f21681bbcf1561346799b814d16e84eed4c2045d5a1bb2c9ba72109c`)
- **Retrieval:** fetched from arXiv on 2026-07-06. Legal source URLs:
  `https://arxiv.org/abs/1604.06339`, `https://arxiv.org/e-print/1604.06339`,
  `https://arxiv.org/pdf/1604.06339`.
- **Verified anchor ranges:**
  - `source/StressTensor.tex:524`--`:532` -- abstract: geometric construction
    of a discrete stress-energy tensor on the honeycomb lattice via local
    non-planar lattice deformations; for `n in [0,2]` it satisfies part of the
    Cauchy-Riemann equations and is **conjectured** discrete-holomorphic and
    convergent to the continuum stress-energy tensor; **proven for `n=1`
    (Ising)**, where correlations of the discrete stress-energy tensor with
    primary fields converge to their continuous counterparts satisfying the
    OPEs of the `c=1/2` CFT.
  - `source/StressTensor.tex:876` (`\begin{theorem}\label{thm:Ising1}`),
    `:909` (`\label{thm:Ising2}`), `:927` (`\label{thm:Ising3}`) -- the three
    **Ising convergence theorems** (one-point, boundary/two-point, and
    two-point stress-tensor correlations), whose proofs (`Section
    sec:Ising-convergence`) reduce to `C^1`-convergence of discrete fermionic
    observables (s-holomorphicity, `:1458`).
  - `source/StressTensor.tex:1774`, `:2040` -- the `c=1/2` continuum CFT
    correlators with primary dimensions `1/16` (`sigma`) and `1/2`
    (`epsilon`), defined via Riemann-type boundary value problems rather than
    CFT axioms; Schwarzian covariance (`prop:Schwarzian-covariance`) and OPE
    coefficients (`prop:OPE`) appear as corollaries.
- **Why acquired:** the sharpest available "discrete holomorphicity ==>
  Ward/Virasoro" result for an interacting lattice model -- a discrete
  stress-energy tensor (Ikhlef-style lattice deformation observable) whose
  correlations are PROVED (for Ising, `n=1`) to converge to the `c=1/2` CFT
  stress-tensor correlations with the correct OPEs; simultaneously anchors the
  Smirnov / Chelkak-Smirnov discrete-complex-analysis line named in the brief.

### SRC-MILSTED-VIDAL-2017 -- Koo-Saleur conformal-data extraction, nonintegrable chains

- **Authors:** Ashley Milsted, Guifre Vidal
- **Title:** Extraction of conformal data in critical quantum spin chains using
  the Koo-Saleur formula
- **Journal:** Phys. Rev. B **96**, 245105 (2017); **DOI**
  `10.1103/PhysRevB.96.245105`
- **arXiv:** `1706.01436`
- **Local arXiv source package:**
  `references/lattice-symmetry/MilstedVidal2017/MilstedVidal2017_arxiv_eprint.tar.gz`
  (SHA256 `6f6ea5e764640b7fd48911fb21f06ec7927cdbbaf8eed06740455c9be9805f61`)
- **Local arXiv PDF:**
  `references/lattice-symmetry/MilstedVidal2017/MilstedVidal2017_arxiv.pdf`
  (14 PDF pages; 1238383 bytes; SHA256
  `2ec9183787bc2c319bf981e5c2c6ba49a4d9201b7f8248beba055043e8d4885a`)
- **Extracted source TeX:**
  `references/lattice-symmetry/MilstedVidal2017/source/extraction_koo_saleur.tex`
  (1334 lines; SHA256
  `095cbc189dbad661253bd678c3c2aa86e388a550fbc0fc62670bd768642452ae`)
- **PDF text extraction:**
  `references/lattice-symmetry/MilstedVidal2017/MilstedVidal2017_pdftotext.txt`
  (1263 lines; SHA256
  `67a6cbc9f38293572ab2142c98cfdab172c892ff1953c74d7e7abcdf405127ac`)
- **Retrieval:** fetched from arXiv on 2026-07-06. Legal source URLs:
  `https://arxiv.org/abs/1706.01436`, `https://arxiv.org/e-print/1706.01436`,
  `https://arxiv.org/pdf/1706.01436`.
- **Verified anchor ranges:**
  - `source/extraction_koo_saleur.tex:64` -- abstract: automated procedures
    using ONLY the lattice Hamiltonian `H = sum_j h_j` as input, applying the
    Fourier modes `H_n` of the Hamiltonian density (the Koo-Saleur lattice
    Virasoro generators, Koo-Saleur Nucl. Phys. B 426, 459 (1994)) to identify
    primary/quasiprimary states and assign conformal towers; demonstrated in a
    **nonintegrable** spin chain.
  - `source/extraction_koo_saleur.tex:93`--`:98` -- Cardy/Blote/Nightingale/
    Affleck finite-size spectrum matches the CFT spectrum up to subleading
    non-universal `O(N^{-x})` corrections (`x>1` model-specific; logarithmic
    corrections for marginal operators).
  - `source/extraction_koo_saleur.tex:109` -- history/context: Koo-Saleur is
    singled out as the proposal giving lattice analogues of ALL Virasoro
    generators, previously applied mostly to integrable / logarithmic
    (`c=0`) CFTs (cites `read_associative-algebraic_2007`,
    `gainutdinov_lattice_2013`, etc.).
  - `source/extraction_koo_saleur.tex:194` -- lattice momentum density
    `p_j = i[h_j, h_{j-1}]`, chiral/antichiral `T_j = (h_j +/- p_j)/2`, and
    the note that the `L_n`, `\bar L_n` carry ADDITIONAL finite-size
    corrections vs. the bare `H_n` (traced to finite-size energy corrections),
    so numerically the `H_n` modes are preferred.
  - `source/extraction_koo_saleur.tex:115` -- the nonintegrable test case: the
    self-dual ANNNI model (a nonintegrable perturbation of Ising).
- **Why acquired:** the state-of-the-art NUMERICAL status of Koo-Saleur
  generators named in the brief -- the first systematic demonstration that the
  KS `H_n` modes extract conformal data (central charge, scaling dimensions,
  conformal spins, primary/quasiprimary/descendant classification) in a
  NONINTEGRABLE critical chain; the concrete finite-size protocol and its
  `O(N^{-x})` error structure.

### SRC-READ-SALEUR-2007 -- enlarged symmetry algebras = Temperley-Lieb commutant (lattice<->module dictionary origin)

- **Authors:** N. Read, H. Saleur
- **Title:** Enlarged symmetry algebras of spin chains, loop models, and
  S-matrices
- **Journal:** Nucl. Phys. B **777** (2007) 263--315; **DOI**
  `10.1016/j.nuclphysb.2007.03.007`
- **arXiv:** `cond-mat/0701259` (v1, submitted 2007-01-11)
- **Local arXiv source package:**
  `references/lattice-symmetry/ReadSaleur2007/ReadSaleur2007_arxiv_eprint.tar.gz`
  (single gzip-compressed `.tex`, internal name `ensymsh.tex`, kept under the
  `.tar.gz` filename convention; SHA256
  `1b5b82be4f709f25f25b51716dbe4c0ce22f6405149ab939f222422855341308`)
- **Local arXiv PDF:**
  `references/lattice-symmetry/ReadSaleur2007/ReadSaleur2007_arxiv.pdf`
  (35 PDF pages; 596818 bytes; SHA256
  `98b3842e2fe4ac475f8adc51eeecfe05b9a35bde2def76c802082a203d48d469`)
- **Extracted source TeX:**
  `references/lattice-symmetry/ReadSaleur2007/source/ensymsh.tex`
  (4174 lines; SHA256
  `eb61b0f0e3b00c7575776be41c7fe581ceab8c2e4ad84cbda265be57da520455`)
- **PDF text extraction:**
  `references/lattice-symmetry/ReadSaleur2007/ReadSaleur2007_pdftotext.txt`
  (2619 lines; SHA256
  `dc039eeac10e8a7b14ed153854672193099daae0c3b0e0a2b4cda8505606f84e`)
- **Retrieval:** fetched from arXiv on 2026-07-06. Legal source URLs:
  `https://arxiv.org/abs/cond-mat/0701259`,
  `https://arxiv.org/e-print/cond-mat/0701259`,
  `https://arxiv.org/pdf/cond-mat/0701259`.
- **Verified anchor ranges:**
  - `source/ensymsh.tex:28`--`:55` -- title/abstract: `U(m)`-symmetric
    nearest-neighbour spin chains possess a much larger symmetry algebra
    `A_m(2L)` than `U(m)`, causing energy eigenstates to fall into sectors with
    rapidly-growing degeneracies; supersymmetric `gl(m+n|n)` analogue; the
    symmetries carry over to the associated loop models (loops cannot cross).
  - `source/ensymsh.tex:679`--`:693` -- the double-commutant setup: `A_m(2L)`
    is defined as the **commutant (centralizer)** of the Temperley-Lieb
    algebra `TL_{2L}(q)` in the spin-chain representation `V`, and the double
    commutant of `TL` is recovered.
  - `source/ensymsh.tex:822`--`:870` -- **explicit construction of the
    commutant** using **(Jones-Wenzl) projections** `P^bullet`, `P_bullet`
    (`:849`), yielding the statement (`:870`) that this operator algebra "is
    the commutant algebra `A_m(2L)` of `TL_{2L}(q)` in `V`", block-decomposed
    over the `j`th irreducible representations of the commutant.
  - `source/ensymsh.tex:948`--`:973` -- the parity/`n`-even-vs-odd structure of
    which sectors admit the enlarged symmetry, and the linear basis for the
    commutant algebra `B_m`.
- **Why acquired:** the ORIGIN of the lattice-algebra-representation <->
  Virasoro-module dictionary named in the brief (the "Read-Saleur line"). It
  identifies the enlarged lattice symmetry as the Temperley-Lieb COMMUTANT
  built from Jones-Wenzl projections, and matches its sectors to the module
  structure that becomes the (degenerate) Virasoro-module content in the
  continuum limit -- the direct ancestor of `GainutdinovReadSaleur2013`'s
  interchiral-algebra dictionary.

### SRC-LI-LIN-MCGREEVY-SHI-KIM-2024 -- chiral Virasoro generators from a single wavefunction (entanglement bootstrap)

- **Authors:** Isaac H. Kim, Xiang Li, Ting-Chun Lin, John McGreevy, Bowen Shi
  (arXiv author order; the local directory slug `LiLinMcGreevyShiKim2024` was
  fixed at creation and is retained per the append-only convention)
- **Title:** Chiral Virasoro algebra from a single wavefunction
- **Journal:** Ann. Phys. **471** (2024) 169849; **DOI**
  `10.1016/j.aop.2024.169849`
- **arXiv:** `2403.18410`
- **Local arXiv source package:**
  `references/lattice-symmetry/LiLinMcGreevyShiKim2024/LiLinMcGreevyShiKim2024_arxiv_eprint.tar.gz`
  (SHA256 `79b23feb32615bf3b7f42c05d4ec4adfe066255908aff830db08d13738480336`)
- **Local arXiv PDF:**
  `references/lattice-symmetry/LiLinMcGreevyShiKim2024/LiLinMcGreevyShiKim2024_arxiv.pdf`
  (82 PDF pages; 6020188 bytes; SHA256
  `b0f91dad231fb0c5e52eb5c92c4b2a00f08381164ef894c913d159121b4517cf`)
- **Extracted source TeX:**
  `references/lattice-symmetry/LiLinMcGreevyShiKim2024/source/revised-emergence-of-virasoro.tex`
  (2442 lines; SHA256
  `76329accf3782cd0524b8123f0725336e7a6fe21b725f7a9bc8d6be08570e788`),
  plus compile-dependency macro files `.../source/jm-tex-macros-public.tex`
  (SHA256 `f4c25aa9bb5c782c540ec49f57a69b519a9c3a45ef890044b6e2a0be17202c20`)
  and `.../source/no-revtex.tex` (SHA256
  `e04d531384a2507094afadbb067b060958db06337c5705968880414938b1fe09`). The
  top-level `main.tex` is a 14-line wrapper only; the content is in
  `revised-emergence-of-virasoro.tex`.
- **PDF text extraction:**
  `references/lattice-symmetry/LiLinMcGreevyShiKim2024/LiLinMcGreevyShiKim2024_pdftotext.txt`
  (4130 lines; SHA256
  `13bc3235f3136e6760440b41dc996ca00ec634102f3aa6696ebf5782c22c1361`)
- **Retrieval:** fetched from arXiv on 2026-07-06. Legal source URLs:
  `https://arxiv.org/abs/2403.18410`, `https://arxiv.org/e-print/2403.18410`,
  `https://arxiv.org/pdf/2403.18410`.
- **Verified anchor ranges:**
  - `source/revised-emergence-of-virasoro.tex:217` -- abstract: a method to
    systematically extract the generators of a SINGLE (chiral) Virasoro algebra
    from a single 2+1D ground-state wavefunction, using entanglement bootstrap
    plus one CFT input; commutation relations verified numerically.
  - `source/revised-emergence-of-virasoro.tex:277`--`:291` -- the recipe: the
    Virasoro generators are specific linear combinations of modular
    (entanglement) Hamiltonians of a purely chiral state near the edge, a
    special class of "good modular flows"; a hypothesis
    (`assump:chiral-CFT`) relates good-modular-flow generators to CFT
    quantities (proof out of scope, with locally-checkable consequences and a
    dimensional-reduction special-case argument).
  - `source/revised-emergence-of-virasoro.tex:291` -- numerical verification of
    the Virasoro commutation relations on `p+ip` superconductor and chiral
    semion lattice ground states.
  - `source/revised-emergence-of-virasoro.tex:293` -- explicit comparison to
    the Koo-Saleur line: cites `Koo:1993wz` (Koo-Saleur), `Osborne:2021ppp`
    (Osborne-Stottmeister), and the recent tensor-network / Hamiltonian-density
    constructions `Hu:2020suv`, `Wang:2022qxf`, `Zeng:2022swq`; contrasts them
    (Fourier transform of a time-evolution operator / Hamiltonian density,
    two Virasoro copies in 1+1D) with the present single-state, single-chiral-
    copy modular-flow construction.
- **Why acquired:** the newest (2024) recipe "from a symmetry action to
  concrete generators" that departs from the Koo-Saleur Fourier-of-density
  pattern -- extracting chiral Virasoro generators directly from one ground-
  state wavefunction via modular Hamiltonians and entanglement bootstrap; it
  also indexes the 2020-2022 tensor-network/Hamiltonian-density Virasoro
  constructions (Hu; Wang; Zeng) for the "anything newer up to 2026" scan.

## Notes (2026-07-06 addendum, discrete-symmetry frontier batch)

- The five entries directly above (`HonglerKytolaViklund2022`,
  `ChelkakGlazmanSmirnov2016`, `MilstedVidal2017`, `ReadSaleur2007`,
  `LiLinMcGreevyShiKim2024`) were acquired on 2026-07-06 for the discrete-
  symmetry / Koo-Saleur / discrete-Ward literature question (pipeline frontier
  stage 3): the lattice-level Virasoro construction for the Ising `c=1/2` model
  (`HonglerKytolaViklund2022`, extending the already-registered dGFF `c=1`
  `HonglerJohanssonKytola2013`); the discrete stress-energy tensor with a
  PROVED Ising `c=1/2` convergence result (`ChelkakGlazmanSmirnov2016`,
  Smirnov/Chelkak-Smirnov + Ikhlef discrete-holomorphicity line); the Koo-Saleur
  numerical-extraction state of the art in nonintegrable chains
  (`MilstedVidal2017`); the origin of the Temperley-Lieb-commutant / Jones-Wenzl
  <-> module dictionary (`ReadSaleur2007`, the Read-Saleur line ancestral to
  `GainutdinovReadSaleur2013`); and the newest wavefunction/modular-flow
  generator-extraction recipe (`LiLinMcGreevyShiKim2024`).
- **Metadata note:** `LiLinMcGreevyShiKim2024`'s arXiv author order actually
  begins with Isaac H. Kim; the directory slug (fixed at creation) lists
  Li/Lin/McGreevy/Shi/Kim. The slug is retained per the append-only convention.
- **Not fetched (flagged, external-unfetched):**
  (1) Read-Saleur companion `hep-th/0701117`, "Associative-algebraic approach
  to logarithmic conformal field theories" (Nucl. Phys. B 777 (2007) 316) --
  the direct partner of `cond-mat/0701259` on the module side of the
  dictionary; not fetched to keep the batch to the load-bearing minimum, but
  it is the natural next acquisition if the kernel dictionary is pursued.
  (2) Grans-Samuelsson-Liu-He-Jacobsen-Saleur, "The action of the Virasoro
  algebra in the 2D Potts and loop models at generic Q" (`2010.10920`, JHEP
  10 (2020) 109) -- the companion (loop-model) paper to the already-registered
  `GransSamuelssonEtAl2020` (`2010.12819`).
  (3) The 2020-2022 tensor-network Virasoro constructions indexed by
  `LiLinMcGreevyShiKim2024`: Hu et al `Hu:2020suv`, Wang et al `2205.04500`
  (`Wang:2022qxf`), Zeng et al (`Zeng:2022swq`) -- alternative discrete-
  generator recipes not central to the Koo-Saleur/discrete-Ward question.
