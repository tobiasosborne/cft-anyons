# Report Source Map

Read this file first when navigating the lab-book source. The compiled report is
rooted at `report.tex`, but that file holds **only** the preamble and the
`\include` order. Body prose lives in `report/sections/*.tex`.

For rapid lookup, use `report/SHARD_CATALOG.md`: it assigns each shard a stable
label, gives 2–3 summary lines, and lists search keywords. The same metadata
appears in a `% SHARD-*` comment header at the top of every shard.

The target shard size is about **200 lines**; the local guard allows larger
topic-preserving shards up to `REPORT_SHARD_MAX_LINES` (default **280**). Run
`make check-report-shards` after editing report structure and `make report`
before treating report edits as complete.

## Shard Order

| Order | Label | Source | Title |
|---:|---|---|---|
| 0 | `CA-00-FRONTMATTER` | `report/sections/00_frontmatter.tex` | Frontmatter, North Star, and Claim Status |
| 1 | `CA-01-PROGRAMME-MAP` | `report/sections/01_programme_map.tex` | Programme Map |
| 2 | `CA-02-AND-OR-VACUUM-GRAMMAR` | `report/sections/02_and_or_vacuum_grammar.tex` | Many-Particle Hilbert Spaces: the AND/OR/Vacuum Grammar |
| 3 | `CA-03-INDEFINITE-PARTICLE-FOCK` | `report/sections/03_indefinite_particle_fock.tex` | Indefinite Particle Number: the Full Fock Completion |
| 4 | `CA-04-HILBERT-SPACE-COMPILER-CONTRACT` | `report/sections/04_hilbert_space_compiler_contract.tex` | A Hilbert-Space Compiler Contract |
| 5 | `CA-05-SYMMETRY-DECORATED-GRAMMAR` | `report/sections/05_symmetry_decorated_grammar.tex` | Symmetry-Decorated Many-Particle Grammar |
| 6 | `CA-06-SECTORS-PROJECTIONS-QUOTIENTS` | `report/sections/06_sectors_projections_quotients.tex` | Sectors, Projections, Subspaces, and Quotients |
| 7 | `CA-07-EXCHANGE-STATISTICS-LAYER` | `report/sections/07_exchange_statistics_layer.tex` | Exchange Symmetry and Statistics as Sector Selection |

## Adding a shard

1. Create `report/sections/NN_slug.tex` with a `% SHARD-ID: CA-NN-SLUG` header
   plus `SHARD-TITLE`, 2–3 `SHARD-SUMMARY` lines, and `SHARD-KEYWORDS`.
2. Open it with a short **"Sources and dependencies"** block citing the exact
   `references/...:line` anchors and the prior shard IDs it builds on.
3. Add an `\include{report/sections/NN_slug}` line to `report.tex`.
4. Add a row to the table above **and** an entry to `report/SHARD_CATALOG.md`
   (id, file, title, the summary lines verbatim, keywords).
5. Run `make check-report-shards` (must pass) and `make report`.
