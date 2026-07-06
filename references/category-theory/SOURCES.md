# Source Manifest -- `references/category-theory/`

Ground-truth sources for fusion-/modular-tensor-category structure theory used
by the categorical word-algebra pipeline: pivotal/spherical structures on
unitary and pseudo-unitary fusion categories, positivity of quantum
dimensions, and Frobenius-Schur indicators of self-dual simple objects
(in particular the Fibonacci `tau`). Per AGENTS.md Law 1, report claims cite a
local path plus a line locator into an extraction or source file. This manifest
is append-only.

Sources here were fetched on **2026-07-06** from arXiv. Unversioned
e-print/PDF endpoints (`https://arxiv.org/e-print/<id>`,
`https://arxiv.org/pdf/<id>`) resolve to the latest posted version; where a
paper has multiple versions this is noted.

This directory was created for task A1 of
`reviews/2026-07-06_pipeline_consistency_scoping/PLAN.md`, to close the two
source gaps flagged in `CONVENTIONS.md` entry (r): (1) unitary fusion category
=> canonical spherical structure / positive quantum dimensions, and (2) the
Frobenius-Schur indicator `kappa_tau = +1` for the Fibonacci `tau`. Gap (1) is
already covered by two sources registered in `references/manifest/SOURCES.md`
(see "Related local sources" below); the source registered here newly closes
gap (2).

## Sources

### SRC-ROWELL-STONG-WANG-2009-CLASSIFICATION -- Rowell, Stong, and Wang, On classification of modular tensor categories

- **Authors:** Eric Rowell, Richard Stong, and Zhenghan Wang
- **Title:** On classification of modular tensor categories
- **Journal:** Communications in Mathematical Physics 292 (2009), no. 2,
  343--389 (arXiv `journal_ref`).
- **arXiv:** `0712.1377` (submitted 2007-12-09; latest `v4` posted 2009-11-09;
  primary math.QA, cross-list cond-mat.mes-hall / math.GT). Four arXiv versions
  (`v1`--`v4`); the e-print/PDF endpoints resolve to `v4`, whose single TeX
  source file is internally named `RSWfinal3.tex`.
- **DOI (arXiv/DataCite):** `10.48550/arXiv.0712.1377`. (The arXiv API record
  exposes no publisher DOI; the CMP journal reference above is recorded as
  provided by arXiv `journal_ref`, not independently resolved here.)
- **Local arXiv source package:**
  `references/category-theory/RowellStongWang2009Classification/RowellStongWang2009Classification_arxiv_eprint.tar.gz`
  (single gzip-compressed `.tex`, original internal filename `RSWfinal3.tex`;
  60644 bytes)
- **Source-package SHA256:**
  `62ce46a7a6afd205891c102f1e85041ff1de1f14e88c9fad55f010afef178f69`
- **Local arXiv PDF:**
  `references/category-theory/RowellStongWang2009Classification/RowellStongWang2009Classification_arxiv.pdf`
  (53 PDF pages; 496141 bytes)
- **PDF SHA256:**
  `f1d3dc4156025b8fd1e77c35cae54a982a42ecee7aa29fbf9eb31e496244f3ed`
- **Extracted source TeX:**
  `references/category-theory/RowellStongWang2009Classification/source/RSWfinal3.tex`
  (4369 lines; SHA256
  `3f9c46b17c102e733ef0a12388783e5cdc864202ba9274aa089bcbe37c361a38`)
- **PDF text extraction:**
  `references/category-theory/RowellStongWang2009Classification/RowellStongWang2009Classification_pdftotext.txt`
  (2715 lines; SHA256
  `8c6e8eb7c60dc1d1f7650283f9c7660c4f058c58fb13b849813a42b68030a2cf`)
- **Retrieval:** fetched from arXiv on 2026-07-06. Legal source URLs:
  `https://arxiv.org/abs/0712.1377`,
  `https://arxiv.org/e-print/0712.1377`, and
  `https://arxiv.org/pdf/0712.1377`.
- **Extraction command:**
  ```bash
  mkdir -p references/category-theory/RowellStongWang2009Classification/source
  curl -L https://arxiv.org/e-print/0712.1377 \
    -o references/category-theory/RowellStongWang2009Classification/RowellStongWang2009Classification_arxiv_eprint.tar.gz
  curl -L https://arxiv.org/pdf/0712.1377 \
    -o references/category-theory/RowellStongWang2009Classification/RowellStongWang2009Classification_arxiv.pdf
  gunzip -c references/category-theory/RowellStongWang2009Classification/RowellStongWang2009Classification_arxiv_eprint.tar.gz \
    > references/category-theory/RowellStongWang2009Classification/source/RSWfinal3.tex
  pdftotext -layout -enc UTF-8 \
    references/category-theory/RowellStongWang2009Classification/RowellStongWang2009Classification_arxiv.pdf \
    references/category-theory/RowellStongWang2009Classification/RowellStongWang2009Classification_pdftotext.txt
  ```
- **Verified anchor ranges (into `source/RSWfinal3.tex`):**
  - `:697`--`:699` -- **definition of the Frobenius-Schur indicator** of a
    label `k` in a modular datum (Proposition `modularprop`, part (3)):
    `nu_k = (1/D^2) sum_{i,j} n_{k,j}^i d_i d_j (theta_i^2 / theta_j^2)`, which
    is `0` unless `k` is self-dual (`k = hat{k}`) and `+-1` when `k` is
    self-dual. (Bantay-type formula; braided/ribbon = MTC-level definition.)
  - `:2311`--`:2314` -- the braiding relation tying the FS indicator to the
    twist: for trivial `c` and self-dual `a`, `R_1^{aa} = nu_a theta_a^{-1}`,
    where `nu_a` is the Frobenius-Schur indicator of `a`. (Lets one read
    `nu_a` off the explicit `R_1^{aa}` and `theta_a` data.)
  - `:2349`--`:2350` -- **global FS statement over all listed prime MTCs:**
    "In the following data, only the semion `s` and the `(A_1,2)` non-abelian
    anyon `sigma` have Frobenius-Schur indicator = -1." Every other listed
    self-dual simple object -- the Fibonacci `tau` included -- therefore has
    FS indicator `+1`.
  - `:2379`--`:2409` -- **the Fibonacci MTC explicit data:** anyon types
    `{1, tau}`, fusion `tau^2 = 1 + tau`, quantum dimensions `{1, phi}`
    (`phi = (1+sqrt 5)/2`), twist `theta_tau = e^{4 pi i / 5}`, braiding
    `R_1^{tau tau} = e^{-4 pi i / 5}`, realizations `(A_1,3)_{1/2}`, `(G_2,1)`,
    conj. `(F_4,1)`. Combined with `:2311`--`:2314`:
    `nu_tau = R_1^{tau tau} * theta_tau = e^{-4 pi i/5} * e^{4 pi i/5} = +1`.
  - `:2831`--`:2833` -- **classification of the Fibonacci fusion rule:** the
    unitary MTCs realizing it are the Fibonacci MTC and its `S -> -S` /
    complex-conjugate images (no splitting into `+-1` FS-indicator families,
    unlike the Ising fusion rule at `:2839`--`:2851`). Fixes what "the
    Fibonacci category" (`d_tau = phi > 0`) means.
- **Why acquired:** closes gap (2) of `CONVENTIONS.md` (r) -- the FS indicator
  `kappa_tau` of the Fibonacci `tau`. RSW give both a direct statement
  (`:2349`--`:2350`: only semion and `(A_1,2) sigma` are `-1`) and a
  self-contained computation from the explicit Fibonacci data
  (`nu_tau = R_1^{tau tau} theta_tau = +1`). CONVENTION CAVEAT: `nu_tau` here
  is the *braided/ribbon* (MTC-level) FS indicator; the repo's `kappa_tau` in
  (r) is the *fusion-categorical* self-duality sign (Penneys' `lambda`, real
  = `+1` / pseudoreal = `-1`, `references/text/PenneysUnitaryFusionCategories.md:1032`--`:1045`).
  For a unitary modular category these coincide, so RSW's `nu_tau = +1`
  certifies `tau` is symmetrically self-dual (real), hence `kappa_tau = +1` in
  the (r) sense. RSW register the Fibonacci category as unitary (`:324`,
  `:2831`), matching the repo's unitary hypothesis.

## Related local sources (already registered in `references/manifest/SOURCES.md`)

Gap (1) of `CONVENTIONS.md` (r) -- unitary/pseudo-unitary fusion category =>
canonical spherical structure and positive quantum dimensions -- is covered by
two sources already registered under `SRC-ENO` and `SRC-PENNEYS-UFC` in
`references/manifest/SOURCES.md`. Anchors (verified 2026-07-06):

- **SRC-ENO** (Etingof-Nikshych-Ostrik, "On fusion categories", math/0203060) --
  `references/text/EtingofNikshychOstrikFusionCategories.txt`:
  - `:1700`--`:1703` -- Section 8.4: a fusion category is *pseudo-unitary* if
    `dim(C) = FPdim(C)`; "This property is automatically satisfied for unitary
    categories, which occur in the theory of operator algebras" (bridge:
    unitary => pseudo-unitary).
  - `:1704`--`:1706` -- Proposition 8.23: "Any pseudo-unitary fusion category
    `C` admits a unique pivotal (in fact, spherical) structure, with respect to
    which the categorical dimensions of all simple objects are positive, and
    coincide with their Frobenius-Perron dimensions."
  - `:233`--`:242` -- Proposition 2.9 / Corollary 2.10: dimension formulas in
    pivotal/spherical categories.
- **SRC-PENNEYS-UFC** (Penneys, "Unitary fusion categories" lecture notes) --
  `references/text/PenneysUnitaryFusionCategories.md`:
  - `:1017`--`:1019` -- Remark 3.8.5 + Exercise 3.8.6: a unitary multitensor
    category has a *unique unitary dual functor* whose canonical pivotal
    structure is spherical (the "unique unitary spherical structure",
    attrib. [LR97, Yam04, BDH14]). States gap (1) directly for *unitary* `C`.
  - `:1015` -- Exercise 3.8.4: for a unitary dual functor the pivotal traces
    are positive and "the corresponding quantum dimensions are always strictly
    positive" (gap (1) positivity, unitary hypothesis).
  - `:1032`--`:1047` -- Exercise 3.8.7 + Remark 3.8.9: for self-dual simple
    `c`, the zig-zag scalar `lambda = (v^dagger tensor id) o (id tensor v)`
    equals `+-1`, with `c` real iff `lambda = +1`; physicists' raw cup/cap
    convention has the zig-zag hold only up to this scalar (the repo's
    `kappa_X` / raw-cup bookkeeping).
  - `:610`--`:625` -- Example 3.6.4: Fibonacci `d_tau = phi`, raw cup
    `v^dagger v = phi id_1` (cup-cap = quantum dimension).
