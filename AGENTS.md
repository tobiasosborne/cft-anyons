# AGENTS.md — cft-anyons (ARCHIVED repo)

Read this once. It is short on purpose.

## Status: this repo is wound down

The old consolidation (LaTeX statement, Lean formalisation, Julia backend, and a
heavy multi-gate / reviewer / beads process) was archived on 2026-05-30 as
low-value. It now lives under `archive/legacy-consolidation/` and is **dead**:
do not extend it, do not cite it as canonical, do not mine it for "next steps."

**The only live asset is the papers** under `references/` and `literature/`.
That is the reusable result of a literature round. Treat those as ground truth.

## Do NOT reintroduce the old ceremony

There is no beads tracker, no `bd` workflow, no GLOSSARY hard-gate, no
M/D/C/R/I validation gates, no mandatory hostile-reviewer subagent per commit,
no migration plan, no remote CI. All of that was deliberately removed. Do not
add it back, do not file "re-add CI / re-add beads" tasks, do not write an
8000-line log. If you find yourself building process instead of content, stop.

## If asked to do new work

Start fresh and keep it light (the workflow that works well in the sibling
project `../arithmetic-quantum-mechanics`):

- **Shards.** One self-contained ~200-line file per idea. Give it a small header
  (id / title / 1–2 line summary / keywords) so future lookups are a grep.
- **Inline local provenance.** Every nontrivial claim cites a local path + line
  range. Need a source that isn't here? Fetch it into `references/` (record
  where it came from), or record the gap and move on. Nothing from memory.
- **Cheap, real checks.** A claim earns its place via a mechanical check or a
  red-green invariant test (asserting a real value/identity, not "ran without
  error") — not via review ritual. Run the relevant build/test as you go.
- **Conventions when you make a choice**, recorded briefly at the point of use.
- **Land work simply:** commit with a clear message; push. No multi-stage gate.

That's the whole contract. Lightness is the point.
