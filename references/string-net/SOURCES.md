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

### SRC-FIDKOWSKI-ETAL-2006 -- Fidkowski, Freedman, Nayak, Walker, Wang, from string nets to nonabelions

- **Authors:** Lukasz Fidkowski, Michael Freedman, Chetan Nayak, Kevin Walker,
  Zhenghan Wang
- **Title:** From String Nets to Nonabelions
- **Journal:** Commun. Math. Phys. 287, 805 (2009)
- **arXiv:** `cond-mat/0610583`
- **Local arXiv source package:**
  `references/string-net/FidkowskiEtAl2006/FidkowskiEtAl2006_arxiv_eprint.tar.gz`
  (SHA256 `8350c0a10faeef88c9c7ce64d58053f63c31291300671b37b7841df5601fa44d`)
- **Local arXiv PDF:** `references/string-net/FidkowskiEtAl2006/FidkowskiEtAl2006_arxiv.pdf`
  (13 pages; SHA256 `67302d8588477943756ba9f9cc8abecbc24a1c4f6c665cffe7ff77564f94709a`)
- **Extracted source TeX:**
  `references/string-net/FidkowskiEtAl2006/source/string_nets-10-8-LF-2.tex`
  (1020 lines; SHA256 `f5165cdce484ba4cecc174be971d026f040594f3f71c86740ce5716a71e521e9`)
- **Retrieval:** arXiv e-print and PDF, 2026-09-23 (`https://arxiv.org/abs/cond-mat/0610583`).
- **Verified anchor ranges:**
  - `:92`--`:102` -- Tutte's formula connects DFib to the `Q = tau+2` Potts
    model; the exactly solvable point is the high-temperature limit of the
    low-temperature expansion; conjectured one-parameter family with a bond
    fugacity.
  - `:547`--`:556` -- chromatic polynomial, delete-contract recursion.
  - `:700`--`:747` -- `<G>_tau = tau^{-5} tau^{(3/2)V(Ghat)} chi_Ghat(tau+1)`
    (eq. `tp1`), Tutte's golden identity, Theorem: `<G>_tau^2 = chi_Ghat(tau+2)/(tau+2)`
    for any planar net; note on vertex fugacity from non-unitary normalisation.
  - `:775`--`:790` -- Fortuin-Kasteleyn; `0 < Q <= 4` critical precisely at the
    self-dual point `gamma = sqrt(Q)`; loop gas with weight `d^2` per loop is
    critical iff `d <= sqrt 2`.
  - `:803`--`:824` -- low-temperature expansion `Z = sum_G chi_Ghat(Q) (e^{-beta J})^L`
    over trivalent graphs; criticality condition `e^{beta_c J} - 1 = sqrt Q`
    (square-lattice self-dual value); `Psi(G) = <G>_tau` is the isotopy-invariant
    wave function.
  - `:846`--`:848` -- identification of the Levin-Wen ground state with
    `Psi(G) = <G>_tau`.

### SRC-FENDLEY-KRUSHKAL-2008 -- Fendley and Krushkal, Tutte chromatic identities from the Temperley-Lieb algebra

- **Authors:** Paul Fendley and Vyacheslav Krushkal
- **Title:** Tutte chromatic identities from the Temperley-Lieb algebra
- **Journal:** Geom. Topol. 13, 709 (2009)
- **arXiv:** `0711.0016`
- **Local arXiv source package:**
  `references/string-net/FendleyKrushkal2008/FendleyKrushkal2008_arxiv_eprint.tar.gz`
  (SHA256 `82a5fbd22c79feaaf28c5a6790f3bbfef8b9536333bccee9768e52f3939c3972`)
- **Local arXiv PDF:** `references/string-net/FendleyKrushkal2008/FendleyKrushkal2008_arxiv.pdf`
  (25 pages; SHA256 `b8b5a2f40c4562fb7af18c188d68bdaca1241d2df7b4a9891982dbdaba4fe348`)
- **Extracted source TeX:** `references/string-net/FendleyKrushkal2008/source/Tutte-new.tex`
  (1999 lines; SHA256 `62881978e32e8aad0bae8861dcb15ed45122ec39ad84777a3be807f2bfebf03c`)
- **Retrieval:** arXiv e-print and PDF, 2026-09-23 (`https://arxiv.org/abs/0711.0016`).
- **Verified anchor ranges:**
  - `:115`--`:135` -- Tutte's golden identity
    `chi_T(phi+2) = (phi+2) phi^{3V(T)-10} chi_T(phi+1)^2` and the linear
    relation at `Q = phi+1`.
  - `:225`--`:235`, `:270`--`:280` -- the chromatic algebra at `Q = phi+1` and
    the Jones-Wenzl projector `P^{(4)}` generating its unique proper ideal.
  - `:315`--`:325` -- physics application to Fibonacci quantum loop models.
  - `:915`--`:925` -- `chi_Ghat(phi+2)/(phi+2)` evaluates in the product of
    two chromatic algebras at `phi+1` as `phi^{-4} chi_Ghat(phi+1)^2`.

### SRC-FENDLEY-2008 -- Fendley, topological order from quantum loops and nets

- **Authors:** Paul Fendley
- **Title:** Topological order from quantum loops and nets
- **Journal:** Ann. Phys. 323, 3113 (2008)
- **arXiv:** `0804.0625`
- **Local arXiv source package:**
  `references/string-net/Fendley2008/Fendley2008_arxiv_eprint.tar.gz`
  (SHA256 `f284ee1afd49da3e994c57865f1b59a6e02d9388d6fbc53a690e76f38c264584`)
- **Local arXiv PDF:** `references/string-net/Fendley2008/Fendley2008_arxiv.pdf`
  (29 pages; SHA256 `5e28c7af96be83f7f0369a03b4a3922110e64f36a9d11800c95dd749363988dd`)
- **Extracted source TeX:** `references/string-net/Fendley2008/source/nets-rev.tex`
  (2368 lines; SHA256 `c061414d297ee5f24afa7c23c8fc762134d4fb422bc8cadaa88f4acd78b46ac2`)
- **Retrieval:** arXiv e-print and PDF, 2026-09-23 (`https://arxiv.org/abs/0804.0625`).
- **Verified anchor ranges:**
  - `:185`--`:210` -- the `d = sqrt 2` barrier for quantum loop models; nets
    with chromatic-polynomial weights as the way past it.
  - `:424`--`:441` -- completely packed loops are the `Q = d^4` Potts model at
    its self-dual point, critical only for `Q <= 4`.
  - `:640`--`:656` -- the Fibonacci case `k = 3`, `d = phi`; Tutte's golden
    identity implies the classical loop model is critical.
  - `:1030`--`:1082` -- `<N|Psi> = alpha (d^2-1)^{-L_N/2} chi_Nhat(d^2)`
    (eq. `netchrome`), the dual graph, and the Potts low-temperature expansion
    `Z_Potts = sum_N K^{L_N} chi_Nhat(Q)` (eq. `ZPotts`) with `K` the weight per
    unit length of domain wall.
