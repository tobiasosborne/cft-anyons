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
