# Coset symmetry and second-pass OAR audit sources

## SRC-CARPI-WEINER-2004

Sebastiano Carpi and Mihály Weiner, *On the uniqueness of diffeomorphism
symmetry in Conformal Field Theory*, arXiv:math/0407190v1 (11 July 2004).
Published in Communications in Mathematical Physics 258 (2005), 203–221;
DOI 10.1007/s00220-005-1335-4.

- Canonical URL: https://arxiv.org/abs/math/0407190
- Retrieved 2026-09-22 from https://arxiv.org/src/math/0407190 .
- Original payload: `CarpiWeiner2004/source.tar` (despite the extension,
  this is a gzip-compressed single author TeX file, not a tar archive).
- Extracted append-only author source: `CarpiWeiner2004/source.tex`,
  produced by `gzip -dc source.tar > source.tex`.
- Payload SHA256:
  `c91f93e231172c4f80cb3e9fb5d0ed0cc02c1296d09b221aa8078ec90db81bd6`.
- TeX SHA256:
  `afaaba8721f08895f2f24fb96daa1e20aa5603da6f18ddb17aefa61ac74837ad`.

Precise TeX anchors:

| Lines | Content used |
|---|---|
| 390–445 | Positive-energy Virasoro representation and smooth stress exponentials |
| 700–747 | Reducible representation discussion; mode energy bound, constant depending only on c |
| 750–788 | Weighted Fourier sums on Dom L0 and approximation on its graph domain |
| 864–936 | Essential self-adjointness for conjugate-symmetric weighted Fourier coefficients |
| 939–976 | Weighted Fourier norm, strong resolvent continuity and strong exponentials |

Representation caution: the source starts with a projective Diff(S1)
representation, for which the full rotation phase is scalar. An ambient
coset Hilbert direct sum with different lowest weights must use these
statements sectorwise; the source must not be cited as making the ambient
rotation phase scalar.

## Existing sources reused without new retrieval

- `references/text/CFTFromLatticeFermions.txt`, registered in
  `references/manifest/SOURCES.md` and
  `references/cft-machine/fermion/SOURCES.md`: equations (86)–(94),
  Definition 3.1, Definition 3.9, Proposition 3.6, and Corollaries 4.12–4.17.
- `references/cft-machine/virasoro/GoddardKentOlive1986/source.txt`,
  registered in that topic's SOURCES.md: equations (2.5)–(2.20), including
  coset stress, positivity/highest weights, and integrable branching.
- `references/cft-machine/realisation/KawahigashiLongo2002/source.tex`,
  registered in that topic's SOURCES.md: vacuum Virasoro nets and the
  diagonal coset identification.

Local derivations and exact import scope are recorded in
`cft_machine/research/smeared_coset_limits.md` and
`cft_machine/reviews/second_pass_ising.md`.
