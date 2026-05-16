# cft-anyons

Canonical consolidated repo for the mathematics, formalisation,
computational backend, and literature for indefinite-particle Hilbert
spaces of mobile anyons in unitary fusion categories, with refinement
maps to OAR continuum limits.

## **Read [PRD.md](PRD.md) first.**

Everything else reads outward from there. PRD names the canonical
artifacts, the read order, the scope, and the validation methodology.

## Directory map

```
PRD.md                       entry point — read this first
GLOSSARY.md                  canonical definitions (definitional bedrock)
CONVENTIONS.md               notational / gauge / indexing choices
CLAUDE.md, AGENTS.md         methodology + rules for agents (identical pair)

summary.tex                  guiding conceptual mathematical statement
ERRATA.md                    append-only log of corrections to summary.tex

RESEARCH_NOTES.md            open questions, acquisition queue
PROVENANCE.md                imported-file audit trail (hashes)
CITATION_INDEX.md            summary.tex citation → discharge status
MIGRATION_LOG.md             per-step commit log of the consolidation

Formalisation/               Lean 4 proofs (lake build; zero sorry/axiom)
src/MobileAnyons/            Julia computational backend
tests/                       Julia tests
scripts/julia/               Julia triple-check scripts
scripts/wolfram/             Wolfram triple-check scripts
results/CHECKS.md            triple-check command log

references/                  local PDFs + SHA256 manifest
literature/                  bibliography DB (630 papers, SQLite)
reviews/                     hostile audits of canonical content

stocktake/                   provenance of the consolidation:
  README.md                    synthesis from inheritance of 3 prior projects
  MIGRATION_PLAN.md            the phased plan
  reports/                     per-slice exploration reports + hostile reviews

archive/                     deep storage — do not read unless asked:
  chats/                       chat1-4.md (superseded source transcripts)
  cad-meta-snapshot/           CAD heavy meta docs (post-Phase 7)
  mma-archive-v0-snapshot/     MMA v0 with known indexing bugs (post-Phase 10)

af/                          adversarial-proof workspace (optional, post-Phase 7)
docs/                        long-form docs (af quickref, etc.)
```

## Status

**v0, Phase 0 of MIGRATION_PLAN.md in progress.** See
[`MIGRATION_LOG.md`](MIGRATION_LOG.md) for the per-step log and
[`stocktake/README.md`](stocktake/README.md) for the inheritance
picture from the three source projects.

## License

[TBD by user — flag this in `RESEARCH_NOTES.md` if relevant before
publication.]
