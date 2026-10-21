# Categorical reconstruction and boundary sewing sources

Acquired 2026-10-21 for Tobias's request to reimagine the programme from
cutting a continuum CFT into boundary cells and reconstructing by gluing.
The discussion is structural, not an investigation of particular models.
These sources do not establish the proposed category-to-lattice-to-OAR machine.

## SRC-BREHM-RUNKEL-2022

- Enrico M. Brehm and Ingo Runkel, *Lattice models from CFT on surfaces
  with holes I: Torus partition function via two lattice cells*.
- arXiv:2112.01563v2; J. Phys. A 55 (2022), 235001.
- DOI: 10.1088/1751-8121/ac6a91.
- Bibliography: https://arxiv.org/abs/2112.01563v2
- Retrieved: https://arxiv.org/src/2112.01563v2
- Retained package: `BrehmRunkel2022/source.tar`.
- Author text: `BrehmRunkel2022/source/main1.tex`.

Anchors in `main1.tex`:

- 110–126: construction from a CFT; initially infinite local state spaces,
  high-energy damping and separate strict truncation.
- 350–367: open-channel factorization and energy truncation.
- 631–654: categorical symmetry survives the energy cutoff.
- Section 3, starting at 658: topological state-sum limit when holes touch.

Import boundary: the input is an existing CFT and its boundary amplitudes.
This is not reconstruction from a bare fusion category, nor a theorem of
Hamiltonian locality or standard Koo–Saleur/OAR convergence.

## SRC-BREHM-RUNKEL-2024

- Enrico M. Brehm and Ingo Runkel, *Lattice models from CFT on surfaces
  with holes II: Cloaking boundary conditions and loop models*.
- arXiv:2410.19938v1.
- Bibliography: https://arxiv.org/abs/2410.19938v1
- Retrieved: https://arxiv.org/src/2410.19938v1
- Retained package: `BrehmRunkel2024/source.tar`.
- Author text: `BrehmRunkel2024/source/main.tex`.

Anchors in `main.tex`:

- 130–154: regulator parameters, order of limits, and explicitly proposed
  stability condition; fixed-cell regulator removal differs from the
  continuum limit with fixed local cutoff and increasing lattice size.
- 334–346: boundary Hilbert spaces and discrete finitely degenerate energy
  spectrum; energy cutoff makes each edge space finite dimensional.
- 365–379: exact preservation of the chosen topological symmetry; ordered
  cutoff/hole-removal limit; touching-hole topological limit.
- 382–415: possible use of circle packings to encode conformal geometry
  combinatorially; the paper does not pursue the resulting lattice models.
- 421–435: conformal rescaling, geometric anomaly factors and descendant
  recursion remain in the cell weights.
- 445–497: categorical projection of boundary-state channels and proposed
  irrelevance/stability criterion; this is not a proved universal RG theorem.

Import boundary: preserving a specified defect category is different from
proving it is the complete sector category of a limiting local CFT. The
stability proposal is kept as a proposal. No model-specific evidence is
used to infer a general reconstruction theorem in this discussion.

## SRC-BDH-CONFORMAL-BLOCKS

- Arthur Bartels, Christopher L. Douglas and Andre Henriques,
  *Conformal nets II: conformal blocks*.
- arXiv:1409.8672; Commun. Math. Phys. 354 (2017), 393–458.
- DOI: 10.1007/s00220-016-2814-5.
- Bibliography: https://arxiv.org/abs/1409.8672
- Retrieved: https://arxiv.org/src/1409.8672
- The endpoint was unversioned; no revision number is inferred.
- Retained package: `BartelsDouglasHenriques2017/source.tar`.
- Author text: `BartelsDouglasHenriques2017/source/CN-modular.tex`.

Anchors in `CN-modular.tex`:

- 556–569: conformal blocks for surfaces with smooth boundary, starting
  with a finite-index conformal net.
- 629–643: factorization along closed one-manifolds.
- 662–688, Theorem 2: interval gluing via Connes fusion, unitary up to
  phase, associativity, and determination by disc vacuum data and gluing.

Import boundary: the theorem uses the conformal net and its interval
algebras. It does not manufacture those algebras or their conformal dynamics
from an abstract fusion category. Topological conformal blocks are not all
the analytic CFT amplitudes.

## SRC-FRS-CORRELATORS-I

- Jurgen Fuchs, Ingo Runkel and Christoph Schweigert,
  *TFT construction of RCFT correlators I: Partition functions*.
- arXiv:hep-th/0204148v2; Nucl. Phys. B646 (2002), 353–497.
- DOI: 10.1016/S0550-3213(02)00744-7.
- Bibliography: https://arxiv.org/abs/hep-th/0204148v2
- Retrieved: https://arxiv.org/src/hep-th/0204148v2
- Retained package: `FuchsRunkelSchweigert2002/source.tar`.
- Author text: `FuchsRunkelSchweigert2002/source/hep.tex`.

Anchors in `hep.tex`:

- 356–370: Frobenius algebra in the underlying chiral theory's MTC;
  boundary conditions as modules and defects as bimodules.
- 487–544: full-CFT construction relative to supplied chiral data.
- 560–575: categorical structure constants, and explicit assumption that
  all chiral information is already supplied.

Import boundary: categorical correlator coefficients and sewing consistency
relative to a supplied chiral theory do not by themselves construct an
analytic unitary chiral theory from a bare MTC.

## Related existing local sources

- `literature/md/1905.04924/1905.04924.md:542–558`: open–closed CFT as
  real-analytic projective sewing functor; `:626–641`: necessary Cardy data,
  stated sufficiency conjecture, and richer vertex tensor structure;
  `:688–718`: internal homs; `:738–756`: unitary assumptions and status.
- `literature/md/1405.7863/1405.7863.md:510–520`, Theorem 4.4:
  Q-system reconstruction of an extension of an existing conformal QFT;
  `:546–552`: finite charged channels versus descendant fields.
- `references/cft-machine/realisation/KawahigashiLongoMuger1999/source.tex:445–453`:
  split inclusions with collars and the conformal trace-class criterion.
- `references/lattice-symmetry/KooSaleur1993/source/9312156.tex:1094–1108`:
  convergence of modes alone does not justify interchanging commutators
  and scaling limits; intermediate states require control.
- `literature/md/2010.11121/2010.11121.md:126–180`: OAR algebra,
  horizontal state limits, compatibility, GNS and dynamics.

## Acquisition and integrity

Packages were fetched with `curl -L --fail --silent --show-error URL -o
PATH`. Python `tarfile` copied regular `.tex`, `.bib`, `.bbl`, `.sty`,
`.cls`, and `.txt` members only, rejecting absolute paths and `..` path
components. Original packages retain figures and other omitted members.
Extracted bytes are unchanged; no OCR, normalization or source execution.
`SHA256SUMS` records the original packages and every extracted text file,
with paths relative to this directory. Verify using
`sha256sum -c SHA256SUMS` from this directory.
