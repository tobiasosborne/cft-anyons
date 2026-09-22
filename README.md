# cft-anyons

A reproducible research lab book pursuing one concrete goal — the **north star**:

> Discover an **algorithm, or functor**, from fusion/modular tensor category
> data to concrete **lattice systems and microscopic Virasoro generators**
> whose continuum limit through **operator-algebraic renormalisation (OAR)
> and Wilson's triangle** is a mathematically rigorous CFT with the starting
> category's modular data. Additional conformal input must be explicit.

The working belief is that this is achievable at least for **rational CFTs**, and
perhaps for all QFTs. The two non-negotiable success criteria are **provability**
of the continuum limit (rigorous, not heuristic) and **fidelity** (the realised
content faithfully reproduces the input category; the symmetry rep is full and
projective-unitary).

This is a **programme, not a finished theory**. It is a working notebook with
strict provenance: every definition, convention, claim, and number points to a
local source, a checked derivation, a reproducible run, or an explicitly marked
open question.

## How it's organised

- **`cft_machine/`** — the broader constructive investigation, initiated
  2026-09-22. It develops alternative mechanisms alongside the variable-number
  anyon route, with Lamport structured proofs and executable benchmarks.

- **`report.tex` + `report/sections/*.tex`** — the lab book, written as
  self-contained **~200-line shards**. `report/SHARD_CATALOG.md` is the
  searchable map (grep by keyword → stable shard ID → one short file);
  `report/README.md` is the include-order map.
- **`references/` + `literature/`** — the kept papers, the project's ground
  truth (curated PDFs + extractions + manifest; bib + ~330 markdown extractions
  + bibliography DB seed + survey/synthesis). Carried over from the prior effort.
- **`src/` + `test/`** — Julia package for reproducible checks (`make test`).
- **`worklog/`** — the project's institutional memory across sessions and agents
  (there is no issue tracker — read the latest chunk for current state).
- **`CONVENTIONS.md`**, **`INDEX.md`** — convention choices; script/run manifest.
- **`archive/legacy-consolidation/`** — the dead previous project, kept for
  history only. **Not canonical**; do not build on it.

## Build & check (local only — no CI)

```bash
make check-report-shards    # deterministic shard-structure guard (the gate)
make report                 # build report.pdf via latexmk
# Run the touched Julia testset standalone; full Pkg.test is suspended.
```

## Working here

Agents: read **`AGENTS.md`** (authoritative) top to bottom every session. It is a
light, provenanced, accretive workflow — three Laws (ground truth before claims ·
conventions before derivations · reproducibility is part of the result) plus
numbered Rules. Deliberately **no beads, no multi-gate validation, no mandatory
reviewer-gating, no CI** — the heavy apparatus of the previous project was
archived on purpose.

The CFT-machine checks are documented in `cft_machine/README.md`. Respect
the laptop compute limits and the full-suite suspension in `AGENTS.md`.

## License

Original text/code under AGPL-3.0 (`LICENSE`). Third-party papers under
`references/` and `literature/` retain their original licenses; provenance is in
the manifests.
