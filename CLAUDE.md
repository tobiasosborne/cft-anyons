# CLAUDE.md — cft-anyons

`AGENTS.md` is the authoritative instruction file for this repository. **Read it
top to bottom at the start of every session, and again after any context
compression.**

Short version: this is a fresh-start, reproducible research lab book with one
**north star** — take a (unitary) fusion / modular tensor category (+ OPE /
conformal data as needed) and construct a family of **microscopic lattice models
and symmetry generators whose continuum limit provably yields a rigorous QFT/CFT
that realises the input category and carries a full projective-unitary
representation of the symmetries** (target: at least rational CFTs). It is
written as **~200-line LaTeX shards** (rooted at `report.tex`) with **Julia**
checks for reproducible evidence. Strict provenance: every claim cites a local
source, a checked derivation, or a reproducible run. The papers under
`references/` and `literature/` are the kept ground truth.

Work is governed by **three Laws** (ground truth before claims · conventions
before derivations · reproducibility is part of the result) and the numbered
Rules in `AGENTS.md`. Institutional memory lives in `worklog/`. Keep it light:
**no beads, no multi-gate validation, no mandatory reviewer-gating, no CI** — the
heavy apparatus of the previous project was archived on purpose
(`archive/legacy-consolidation/`). Read `AGENTS.md` and `README.md` for the full
stance.
