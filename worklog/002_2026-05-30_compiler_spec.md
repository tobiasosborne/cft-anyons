# Worklog chunk 002 — 2026-05-30

## Session log — 2026-05-30 — Correction: Fock and exchange statistics are representation-sector data

### Context

Tobias corrected the compiler framing: Fock space should not be a special grammar
form, and symmetric/antisymmetric statistics should not be specialised grammar
either.  Fock is a derived graded representation built from tensor powers, while
symmetric and antisymmetric sectors are consequences of choosing irreps of the
exchange representation.

### What changed

- Updated CONVENTIONS.md (f): Fock-style notation is derived, not primitive
  grammar; it denotes the graded Hilbert direct sum of tensor-power
  representation sectors.
- Revised CA-03: the full Fock space is explicitly the completion of ordinary
  tensor-power expressions; exchange \emph{sector selection}, not symmetry in
  general, is what comes later.
- Revised CA-05: the full-Fock action is a derived graded representation, not a
  new grammar constructor.
- Revised CA-07: Bose/Fermi are the trivial/sign irrep choices for the \(S_n\)
  exchange representation; the projector comes from the chosen character.
- Revised CA-08: the surface language now has only `0`, `1`, atoms, `OR`,
  `AND`, and generic `Sector_{G,chi}`.  Fock/truncation are derived macros;
  symmetric/antisymmetric sectors are examples of exchange-irrep projection.

### Acceptance

- `make ci-before-push`: PASS after the correction (shard guard + report build
  + Julia tests, 23 tests total).

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
  - fixes the first surface language: `0`, `1`, atom, `OR`, `AND`, and generic
    finite representation sectors;
  - gives constructor rules for carriers, gradings, symmetry propagation,
    finite dimensions, sector projections, quotient witnesses, and observable
    policies;
  - works through six examples: maybe qubit, two distinguishable qubits,
    derived tensor-power closure, two-qubit exchange-irrep sectors, a finite
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
