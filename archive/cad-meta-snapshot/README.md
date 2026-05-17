# archive/cad-meta-snapshot/ — CAD project meta-document snapshot

## Scope

This directory contains **snapshot copies** of selected meta-documents
from the `cft-anyons-deprecated/` repo (the "CAD" project — one of the
three source projects feeding this consolidation, per
`stocktake/README.md`). The copies were captured at Phase 7 (steps
P7.3 + P7.4) for **historical reference only**.

- **P7.3** (top-level meta): `handoff.md`, `MASTER_PROVENANCE.md`,
  `NEXT_AGENT_HANDOFF.md`, `FORMALISATION_PLAN.md`.
- **P7.4** (tex snapshot): `tex/cft_anyons_formalisation.tex` and
  the matching `tex/cft_anyons_formalisation.pdf` build.

## Status: NON-CANONICAL

The canonical mathematical statement of **this** repo is
[`summary.tex`](../../summary.tex), governed by
[`GLOSSARY.md`](../../GLOSSARY.md) (terminology),
[`CONVENTIONS.md`](../../CONVENTIONS.md) (notation / gauge / indexing),
and [`ERRATA.md`](../../ERRATA.md) (corrections applied since
archival). The canonical provenance ledger is
[`PROVENANCE.md`](../../PROVENANCE.md); the citation-discharge status
lives in [`CITATION_INDEX.md`](../../CITATION_INDEX.md).

CAD's `handoff.md` / `MASTER_PROVENANCE.md` / `NEXT_AGENT_HANDOFF.md`
/ `FORMALISATION_PLAN.md` / `tex/cft_anyons_formalisation.{tex,pdf}`
**predate this consolidation** and may contain definitions, claims,
or section pointers that have since been superseded, harmonised, or
explicitly corrected here. Treat any apparent conflict between these
files and the canonical artifacts above as resolved **in favour of
the canonical artifacts**, not in favour of these snapshots.

## Source

- Source repo: `cft-anyons-deprecated/` at sibling path
  `/home/tobiasosborne/Projects/cft-anyons-deprecated/`.
- Snapshot date: 2026-05-17 (Phase 7, P7.3 + P7.4).
- Capture method: `cp` preserving byte-identical content; SHA256 of
  source and destination verified equal for every file.

## SHA256 manifest (6 files)

| Destination (relative to repo root)                              | SHA256                                                             |
|------------------------------------------------------------------|--------------------------------------------------------------------|
| `archive/cad-meta-snapshot/handoff.md`                           | `a11d5a0e25bc05f51d2a2916ef38b6cb4a3aeaf0f9266c435f1b92c4ef702f71` |
| `archive/cad-meta-snapshot/MASTER_PROVENANCE.md`                 | `2f2a89debcaf0de27baedd44a53d060c9ab8da96b1544744b81712c2fa1969d1` |
| `archive/cad-meta-snapshot/NEXT_AGENT_HANDOFF.md`                | `24edea56f31d505dce27be84318336bea2de0ebc28c7093d1b8dfc94eba57b9a` |
| `archive/cad-meta-snapshot/FORMALISATION_PLAN.md`                | `70f08801111d1b6b46eeda127ece80013d6cb9a8de78209b32bed116d642861d` |
| `archive/cad-meta-snapshot/tex/cft_anyons_formalisation.tex`     | `2d5d95ffc11102b26c7ceb4ac083ae18f2e8e06fcf85671a9304a43eafd01d02` |
| `archive/cad-meta-snapshot/tex/cft_anyons_formalisation.pdf`     | `cb9f1e89c98977c042b69534df0e5d65a90416edd32daba289f2d4529224c38a` |

Each row's hash equals the SHA256 of the original under
`/home/tobiasosborne/Projects/cft-anyons-deprecated/` at capture time
(verified by the P7.3+P7.4 commit; see `MIGRATION_LOG.md`).

## Cross-references

- **CAD af workspace**, constructed from CAD's `af/` tree per the
  P7.2a port mapping: see [`af/master/`](../../af/master/), populated
  in P7.2c at commit `946b646`.
- **Stocktake synthesis reports** that analyse the CAD project in
  depth (and were the basis for what was kept vs. dropped from these
  meta-docs during consolidation):
  - [`stocktake/reports/cad-af.md`](../../stocktake/reports/cad-af.md)
    — CAD's adversarial-proof workspace structure and node graph.
  - [`stocktake/reports/cad-meta.md`](../../stocktake/reports/cad-meta.md)
    — CAD's meta-document set (the files now archived here).
  - [`stocktake/reports/cad-lean.md`](../../stocktake/reports/cad-lean.md)
    — CAD's Lean formalisation, ported into `Formalisation/`.

## Reading guidance

Do **not** use these files as authoritative on definitions, gauge
choices, indexing conventions, or proof status — defer to
[`GLOSSARY.md`](../../GLOSSARY.md),
[`CONVENTIONS.md`](../../CONVENTIONS.md), and the live
[`Formalisation/`](../../Formalisation/) tree. Their value is purely
**historical context**: what the CAD project believed about Fibonacci
anyons / TL algebras / RG amplitudes / the formalisation plan in May
2026, before this repo's consolidation harmonised conventions across
CAD + MMA + MMA-archive-v0.

If you find yourself reaching for these files to settle a current
question, stop and re-read the relevant canonical artifact instead.
