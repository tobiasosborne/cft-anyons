# Coset Hamiltonian source map — 2026-09-22

No new external paper is required for this branch. The finite negativity,
Gram extraction, and positive regularization are local derivations from the
already sourced CAR/coset prescription. Original source files remain in their
registered append-only locations.

- `references/cft-machine/virasoro/GoddardKentOlive1986/source.txt:123–153`
  supplies affine/Sugawara normalization, `:165–186` the stress difference,
  and `:195–217` the diagonal SU(2) minimal-series central charges. Original
  publisher PDF and SHA256 are registered in `../virasoro/SOURCES.md`.
- `references/text/CFTFromLatticeFermions.txt:694–714` supplies canonical CAR
  and Fock wedge signs; `:738–745` the quasi-free filled-sea states;
  `:879–892` normal ordering and Schwinger terms;
  `:1843–1889` the sharp momentum refinements and spatial nonlocality.
  Its source hash is registered in `references/manifest/SOURCES.md`.
- `references/cft-machine/realisation/KawahigashiLongo2002/source.tex:1008–1024`
  identifies the continuum coset Virasoro net. It does not prove a finite
  Hamiltonian or a spatially local refinement of vacuum-descendant cutoffs.

Local derivation dependency: `cft_machine/research/coset_route.md`, CR-1–CR-3.
The new branch only uses its proved finite-core identities at declared safe
windows; finite numerical tests do not replace those cutoff conditions.
