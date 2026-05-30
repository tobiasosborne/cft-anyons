# Worklog chunk 002 — 2026-05-30

## Session log — 2026-05-30 — CA-08 Hilbert-space compiler scope/spec

### Context

The user asked for the next shard to scope and specify the Hilbert-space/QM
system compiler, with all derivations and intermediate steps in the report and a
sequence of small examples.  The existing base was CA-04--CA-07: compiler
contract, symmetry-decorated atoms, projection/subspace/quotient sectors, and
ordinary exchange-statistics sectors.

### What changed

- Added **CA-08** (`report/sections/08_hilbert_space_compiler_spec.tex`):
  - defines a partial compile judgement with successful and failed outcomes;
  - fixes the first surface language: `0`, `1`, atom, `OR`, `AND`, `Fock`,
    finite truncation, symmetric/antisymmetric exchange sectors, and finite
    invariant sectors;
  - gives constructor rules for carriers, gradings, symmetry propagation,
    finite dimensions, sector projections, quotient witnesses, and observable
    policies;
  - works through six examples: maybe qubit, two distinguishable qubits,
    truncated distinguishable Fock, two-qubit exchange sectors, a finite
    invariant quotient, and an incompatible-projective-symmetry compile error;
  - records implementation acceptance criteria and a hard boundary excluding
    fusion-category data, anyonic braid data, Hamiltonians, continuum limits,
    conformal nets, and VOA data until their conventions/invariants exist.
- Updated `report.tex`, `report/README.md`, and `report/SHARD_CATALOG.md` for
  the new shard.
- Extended `test/runtests.jl` with:
  - fail-loud checks for empty/nonunitary finite-group averaging input;
  - a two-qubit `S_2` exchange projector test checking symmetric/antisymmetric
    projectors, orthogonality, trace/rank, and basis-vector behaviour.
- Updated `INDEX.md` to mention the new exchange-projector check.

### Why these choices

- CA-08 is a specification shard, not a premature implementation.  That keeps the
  compiler semantics inspectable while the mathematical grammar is still growing.
- The compiler is explicitly partial: a failed compile judgement is a specified
  output when requested structure is ill typed or unsupported.  This prevents
  carrier-only success from masquerading as a symmetry- or observable-complete
  result.
- Only finite matrix examples were promoted to checked status.  Fusion data,
  anyonic braid projectors, Hamiltonians, and continuum targets remain out of
  scope because their conventions are not fixed.

### Frictions / dead ends

- A subagent pass confirmed the overclaim risks: do not conflate carriers with
  observable algebras, invariant subspaces with quotient slogans, or full Fock
  with Bose/Fermi Fock.  It also recommended the two-qubit exchange projector
  test, which was added.
- The first report build had a small overfull line in the finite-dimension
  display; splitting the display fixed it.
- The shard is close to the 280-line guard limit (278 lines), so the next compiler
  expansion should be a new shard rather than appending to CA-08.

### Acceptance

- `julia --project=. -e 'using Pkg; Pkg.test()'`: PASS, 23 tests total.
- `make check-report-shards`: PASS, 9 shards included, labelled, cataloged,
  all <= 280 lines.
- `make report`: PASS, `report.pdf` rebuilt cleanly.

### Pointers

- Shard: CA-08.
- Checked examples: `test/runtests.jl`, testsets `finite symmetry sector
  projectors` and `two-qubit exchange projectors`.
- Dependencies: CA-02--CA-07; `CONVENTIONS.md` (f), (g);
  `literature/md/1910.10619/1910.10619.md:39,41,57,59`;
  `references/cft/Schottenloher2008/Schottenloher2008.md:1524,1528,1570`;
  `references/text/PenneysUnitaryFusionCategories.md:219,235`.
- **Next**: either implement a minimal in-memory typed compiler for the finite
  grammar, or add a follow-up shard on observable-algebra policies before
  moving toward category-labelled atoms.
