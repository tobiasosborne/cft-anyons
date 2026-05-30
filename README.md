# cft-anyons — ARCHIVED

**This repository has been wound down.** As of **2026-05-30**, the previous
"consolidation" effort (a sharded LaTeX statement, a Lean 4 formalisation, a
Julia computational backend, and a large process/provenance scaffold) was judged
to have **marginal-to-nonexistent value** and was archived wholesale.

## The only thing here worth keeping: the papers

The literature round — finding, fetching, and extracting the relevant sources —
is real, reusable value. It is **kept and live**:

- **`references/`** — curated, hand-named anyon/CFT source PDFs with text
  extractions and a provenance manifest (`references/manifest/`).
- **`literature/`** — the bibliography work: `references.bib`, the markdown
  extractions under `literature/md/` (~330 papers), the `papers.sqlite` seed +
  schema under `literature/db/`, and `SURVEY.md` / `SYNTHESIS.md`.

> A larger raw-PDF backup of the literature (from sibling source projects) is
> kept **locally only** under `literature/_imported/` and is git-ignored — it is
> reacquirable from arXiv and is not pushed.

## Everything else is dead

All former math/code/process content lives under
**`archive/legacy-consolidation/`** (plus the older `archive/` snapshots). It is
retained for history only. See `archive/legacy-consolidation/ARCHIVED.md`.
**Do not extend it, cite it as canonical, or treat it as a foundation.**

## If you (a human or agent) want to start real work here

Start from zero. Do **not** resurrect the abandoned process. The lesson learned,
distilled from the sibling project `arithmetic-quantum-mechanics` (which is
pleasant to work in), is a light, fast, accretive workflow:

1. **Work in small shards.** One self-contained ~200-line unit per idea, with a
   short header (id, title, 1–2 line summary, keywords) so it is findable.
2. **Cite local ground truth inline.** Every nontrivial claim points to a local
   file + line range (the papers above are exactly this ground truth). If a
   source isn't local, fetch it into `references/` first or mark the gap.
3. **Prefer a mechanical check + a red-green invariant test** over human/LLM
   review ceremony. A deterministic script and a build are the gate.
4. **No heavy apparatus.** No reviewer-gating tiers, no five-gate (M/D/C/R/I)
   ceremony, no GLOSSARY hard-gate, no beads, no migration log, no remote CI.
   Keep the governing docs short.

See `AGENTS.md` for the agent-facing version of this stance.

## License

Original text/code under AGPL-3.0 (`LICENSE`). Third-party papers under
`references/` and `literature/` retain their original licenses; provenance is
recorded in the manifests.
