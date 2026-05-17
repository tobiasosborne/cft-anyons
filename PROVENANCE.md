# PROVENANCE — what came from where, with hashes

<!--
ROLE: The audit trail of imported content. Every file in the canonical
      repo that originated elsewhere has an entry here recording: source
      path, source SHA256 at import time, the migration step / commit
      that imported it, and any harmonisation applied.
UPDATE POLICY: Append-only on import. If a file is re-imported (e.g.,
      because the source was updated), the new entry references the old
      one but does not delete it.
TRIGGER: Any new file imported from microscopic-mobile-anyons/,
      cft-anyons-deprecated/, or any external source. Every Phase 2+
      step adds entries here. P1.10 additionally records the Phase 1
      canonical baseline (in-repo authored content), so the file is a
      complete provenance record from the start of Phase 2 onward.
-->

## Phase 1 canonical baseline (this commit)

Phase 1 (definitional bedrock) closed at this commit (P1.10 PROVENANCE
refresh + P1.11 PRD v1 refresh land back-to-back). The artifacts below
are the **canonical state** of the project's definitional content as of
Phase 1 close; every Phase 2+ import is filtered through them.

**Summary table.** For each artifact: file path, SHA256 at this commit,
last-touch commit (when its content last changed), migration step that
authored / closed it, and source (provenance chain).

| Artifact | SHA256 (this commit) | Last-touch | P-step | Source / provenance chain |
|---|---|---|---|---|
| `summary.tex` | `fa4d2059…` | `7e62d9a` (P0.1) | P0.1 baseline; ERRATA-tracked thereafter | In-repo, immutable except via ERRATA atomic commits. P1.2 ERRATA entry documents the `lem:binary-Z` squared-amplitudes fix — pre-baseline, no `summary.tex` edit applied here. |
| `GLOSSARY.md` | `57526a18…` | `b986495` (P1.9) | P1.1–P1.9 | §A (48 entries): byte-verbatim extraction of `\begin{definition}` / `\begin{convention}` environments from `summary.tex` (P1.1). §B (1 entry, `def:mobile-Fock`): from `stocktake/reports/opus-hilbert-bridge.md` (P1.3). All 49 entries' Translation maps populated by P1.5 (Hilbert framings) / P1.7 (CAD) / P1.8 (MMA). |
| `CONVENTIONS.md` | `39b52805…` | `b986495` (P1.9) | P1.6, refined P1.9 | 10 lettered entries (a)–(j) per `stocktake/MIGRATION_PLAN.md` P1.6 specification + items (g)–(j) from `stocktake/reports/opus-hilbert-bridge.md` §4. P1.9 cleanups: (a) archive-path clarification, (a) Sweep status disambiguation. |
| `ERRATA.md` | `6ef9ec71…` | `0e4592a` (P1.2) | P1.2 | 1 entry: `lem:binary-Z` audit-trail. Sourced from `reviews/review_1_algebra.md:Issue1`, `reviews/review_2_categorical.md:Issue11`, `reviews/review_3_cft.md:Issue17` (3 of 4 reviewers agreed; review_4 silent). Fix pre-baseline; no `summary.tex` edit applied. |
| `CITATION_INDEX.md` | `99e65fab…` | `(this commit)` (P3.4) | P0.1 baseline; P2.8 populated; P3.4 rebuilt | In-repo; lists `\unchecked` flag → discharge-status map. P2.8 emitted 9 citation atoms via `scripts/build-citation-index.py`; mappings to `references/` (3), `literature/` (4), AF sibling (0; 5 fact-discharge externals listed separately), undischarged (5). **P3.4 (this commit) rebuilt** after Phase-3 `summary.tex` edits (P3.0 bibliography skeleton; P3.2.a/b/c discharges; P3.3 acquisition-queue footnotes): `\unchecked`-macro count 26 → 21 (5 instances discharged across the 3 P3.2 atomic commits); per-atom discharge statuses all preserved (`koo-saleur` partial; `osborne-stottmeister`/`feiguin-golden-chain`/`string-net` discharged; `pasquier`/`huse`/`frs`/`anyonic-mera`/`g2-1-chiral-cft` undischarged) — the script's status logic depends on hard-coded SRC-*/lit-DB mappings, NOT on `\unchecked` presence in `summary.tex` (see `bd cft-anyons-umx`). New per-atom `summary.tex lines` entries reflect the P3.0 bibitem-block (lines 2486/2488/2489/2490 for `feiguin-golden-chain`) and P3.3 footnote text (line 2465 for `koo-saleur`; line 1866 for `g2-1-chiral-cft`). |
| `RESEARCH_NOTES.md` | `e553290d…` | various | Multiple | Open-questions / deferred-decisions / acquisition queue; lightly touched throughout Phase 1 (e.g., P1.4-early-B recorded LB-1). |
| `stocktake/reports/opus-hilbert-bridge.md` | `95fa8c48…` | `770d730` (P1.4-early-A) | P1.4-early-A | **Authoritative source** for the three Hilbert-space framings (`H_P^W`, mobile-Fock, `H_N^W`) reconciliation. Synthesised by an Opus 4.7 subagent reading: `summary.tex` §2 (def:HP), `microscopic-mobile-anyons/tex/sections/finegraining.tex` + `src/MobileAnyons/hilbert.jl` (mobile-Fock), `cft-anyons-deprecated/Formalisation/Foundations/ProjectDefinitions.lean` (CAD H_N^W). Used by P1.3 (§B `def:mobile-Fock`), P1.5 (four Hilbert-space Translation maps), P1.6 items (g)–(j). |
| `stocktake/reports/cad-lean.md` | `acb77c3c…` | `7e62d9a` (P0.1 baseline) | Pre-baseline (synthesised by prior session) | **Authoritative source** for P1.7 CAD-Lean Translation map bullets. File-by-file inventory of `cft-anyons-deprecated/Formalisation/` Lean files. §5 has the per-file mapping (CAD `.lean` file ↔ `summary.tex` section). Synthesised by reading `/home/tobias/Projects/cft-anyons-deprecated/Formalisation/`. |
| `stocktake/reports/mma-julia.md` | `5585d9fc…` | `7e62d9a` (P0.1 baseline) | Pre-baseline (synthesised by prior session) | **Authoritative source** for P1.8 MMA-Julia Translation map bullets. File-by-file inventory of `microscopic-mobile-anyons/src/MobileAnyons/` Julia files. §5 has the per-struct mapping. Synthesised by reading `/home/tobias/Projects/microscopic-mobile-anyons/src/MobileAnyons/`. |
| `stocktake/reports/opus-glossary-audit.md` | `44c6502f…` | `b986495` (P1.9) | P1.9 | **Audit deliverable** of Phase 1 definitional gate. Hostile Opus 4.7 review verdict: **APPROVE FOR PHASE 2** (zero CRITICAL, zero MAJOR; 8 MINOR/NIT findings; 5 MINOR applied in the P1.9 commit). Verifies: 48/48 §A canonical bodies byte-verbatim; 43/43 cross-links resolve; 7/7 invoked `[P1.6(letter)]` resolve; 8/8 CLAUDE.md hallucination-risk callouts fire. Phase 2 unblock awaits user read-and-approve. |
| `MIGRATION_LOG.md` | `386daa95…` | `b986495` (P1.9) | All P-steps | Per-step commit log; one row per atomic step. Phase 0 (P0.1–P0.10) + Phase 1 (P1.1–P1.9) rows present at this commit. |
| `stocktake/MIGRATION_PLAN.md` | `993dfeaf…` | `93a2bea` (P1.4-early-C) | Multiple | The phased plan. P1.4-early-C incorporated Opus deep-dive findings (P1.6 expanded 6 → 10 conventions; P1.7/P8.1/P8.4 scope clarifications). |
| `CLAUDE.md` = `AGENTS.md` | `21f41379…` | `7e62d9a` (P0.1) + bd-init P0.1b/c | P0.1, P0.1b, P0.1c | Methodology + 11 Rules + hallucination-risk callouts. Identical pair (verified: both hashes match). |
| `PRD.md` | `3d59ebbf…` (pre-P1.11) | `3f2a25e` (P0.8) | P0.8 (v0); P1.11 refreshes to v1 | Entry-point document; v0 = Phase-0 scaffold. P1.11 (next commit) refreshes to v1 with populated GLOSSARY/CONVENTIONS pointers. |
| `README.md` | `53870e62…` | `5dd5381` (P0.10) | P0.10 | PRD pointer. |
| `stocktake/README.md` | `062a54ef…` | various (pre-baseline) | P0.1 baseline | Inheritance picture from the three source projects. |

**Phase 1 R-gate review reports** (audit artifacts; each commits alongside its
target P-step). All landed at the commit shown; SHA256 stable post-landing.

| Report | SHA256 | Step | Commit | Verdict |
|---|---|---|---|---|
| `opus-prd-v0-review.md` | `b6337a44…` | P0.9 (round 1) | `3f2a25e` (P0.8) | APPROVE WITH MINOR EDITS conditional |
| `opus-prd-v0.1-review.md` | `ec9718a2…` | P0.9 (round 2) | `3f2a25e` (P0.8) | Condition met |
| `opus-glossary-p1.1-review.md` | `f00c21f4…` | P1.1 | `8640f1e` | APPROVE WITH MINOR EDITS |
| `opus-errata-p1.2-review.md` | `2ab9cc94…` | P1.2 | `0e4592a` | APPROVE WITH MINOR EDITS |
| `opus-glossary-p1.3-review.md` | `f79e68e1…` | P1.3 | `99749cf` | APPROVE WITH MINOR EDITS |
| `opus-glossary-p1.5-review.md` | `a6463425…` | P1.5 | `40c0a22` | APPROVE WITH MINOR EDITS |
| `opus-conventions-p1.6-review.md` | `8b765658…` | P1.6 | `8226003` | APPROVE WITH MINOR EDITS |
| `opus-glossary-p1.7-review.md` | `cae0993d…` | P1.7 | `d8c0a40` | APPROVE WITH MINOR EDITS |
| `opus-glossary-p1.8-review.md` | `1a943454…` | P1.8 | `fe96ec7` | APPROVE WITH MINOR EDITS |
| `opus-glossary-audit.md` | `44c6502f…` | P1.9 | `b986495` | **APPROVE FOR PHASE 2** |

**Hash recomputation.** All SHA256 values above are computable from the
working tree at this commit:
```bash
sha256sum summary.tex GLOSSARY.md CONVENTIONS.md ERRATA.md \
  stocktake/reports/opus-*.md stocktake/reports/cad-lean.md \
  stocktake/reports/mma-julia.md MIGRATION_LOG.md \
  stocktake/MIGRATION_PLAN.md CLAUDE.md AGENTS.md PRD.md
```

---

## Per-artifact provenance (Tier 1: core canonical content)

The following per-file blocks follow the schema below. Tier 1 = the
files that future content must be validated against (GLOSSARY,
CONVENTIONS) + their summary.tex / ERRATA backing.

---

## 2026-05-16: `summary.tex`

**Source path:** `(this repo)` — `summary.tex` (in-repo, immutable
  except via ERRATA atomic commits; per CLAUDE.md commit discipline)
**Source SHA256:** `fa4d2059f3fb577ebe9e84ace2ab0ee6ef2b6d0cec7cde60d53da7951b0bfe63`
**Migration step:** P0.1 baseline (file inherited; not edited in Phase 0
  or Phase 1)
**Commit:** `7e62d9a` (P0.1 baseline)
**Harmonisation applied:** none — `summary.tex` is the canonical
  mathematical statement. The P1.2 ERRATA entry (`lem:binary-Z`
  squared-amplitudes bug) documents a pre-baseline fix; no `summary.tex`
  edit was applied in this repo.
**Validation passed:** M (build via `pdflatex summary.tex`), I (file
  hash stable from baseline through Phase 1 close)
**Related GLOSSARY entries:** every §A entry (48 of 49); each cites
  `summary.tex:<line>` in its **Source** field.

---

## 2026-05-16: `GLOSSARY.md`

**Source path:** `(this repo)` — `GLOSSARY.md` (in-repo authored;
  §A entries are byte-verbatim from `summary.tex`, §B entries cite
  in-repo `stocktake/reports/`)
**Source SHA256:** `57526a18f3fc170ac03eb74387e7dd7bcf7a409fff64b76e7c9382eb3259131b`
**Migration step:** P1.1 (§A extraction), P1.3 (§A/§B split + first §B
  entry `def:mobile-Fock`), P1.5 (4 Hilbert Translation maps), P1.7
  (49 CAD bullets), P1.8 (45 MMA bullets + `conv:basics` Aliases),
  P1.9 (Status refresh + 7 future-tense forward-pointer fixes)
**Commit:** `b986495` (P1.9; cumulative through Phase 1)
**Harmonisation applied:** the §A/§B split (P1.3) was the structural
  harmonisation; the §B schema variant (multiple Canonical blocks)
  was added then per `opus-glossary-p1.3-review.md`. The reviewer
  minor-edit pattern (P1.5/P1.7/P1.8/P1.9) folded into the same
  atomic commits per CLAUDE.md Rule 4.
**Validation passed:** M, D, R (Opus 4.7 reviewer × 6 for content steps
  + audit at P1.9), cross-link integrity (43/43 unique slugs resolve;
  P1.9 audit verified end-to-end)
**Related GLOSSARY entries:** 49 entries — see GLOSSARY.md itself.
  Provenance chains for §A: each entry's **Source** field points to
  `summary.tex:<line>`. For §B (`def:mobile-Fock`): sources
  `stocktake/reports/opus-hilbert-bridge.md` (which in turn quotes
  `microscopic-mobile-anyons/tex/sections/finegraining.tex:8-13` and
  synthesises from `src/MobileAnyons/hilbert.jl:75-98`).

---

## 2026-05-16: `CONVENTIONS.md`

**Source path:** `(this repo)` — `CONVENTIONS.md` (in-repo authored;
  10 entries (a)–(j) sourced from `stocktake/MIGRATION_PLAN.md` P1.6
  specification + `stocktake/reports/opus-hilbert-bridge.md` §4 for
  items (g)–(j))
**Source SHA256:** `39b52805d2b7bc235c4d9e3c7e7cca4ec7a9865d74ae62e0b600bccaa68d84b8`
**Migration step:** P1.6 (initial populate); P1.9 (two MINOR cleanups
  to (a) — archive-path clarification + Sweep status disambiguation)
**Commit:** `b986495` (P1.9; cumulative through Phase 1)
**Harmonisation applied:** Letter (a)–(j) keying matches
  `MIGRATION_PLAN.md` P1.6 list. Item (f) (TikZ) is **deferred** —
  declared as a pre-registered hook; no `summary.tex` TikZ content
  exists at Phase 1 close.
**Validation passed:** M, D, R (Opus 4.7 reviewer at P1.6 + P1.9 audit)
**Related GLOSSARY entries:** 7 invoked `[P1.6(letter)]` forward-pointers
  from GLOSSARY entries `def:HP`, `def:Hlatt`, `def:indlim`,
  `def:mobile-Fock`, `def:Q`, `def:splitbasis`, `def:dense` (verified
  by P1.9 audit; 7/7 PASS). Letters (c), (e), (f) declared but
  uninvoked by design.

---

## 2026-05-16: `ERRATA.md`

**Source path:** `(this repo)` — `ERRATA.md` (in-repo authored)
**Source SHA256:** `6ef9ec714a32d409b105327c8b772d03e40d312a281a68340619e87a320b2442`
**Migration step:** P1.2
**Commit:** `0e4592a` (P1.2)
**Harmonisation applied:** none — single entry recording the
  pre-baseline `lem:binary-Z` fix as an audit-trail; no `summary.tex`
  edit applied.
**Validation passed:** M, D, C (3 of 4 reviewers concur per the
  3-citation cross-reference: `reviews/review_1_algebra.md:Issue1`,
  `reviews/review_2_categorical.md:Issue11`,
  `reviews/review_3_cft.md:Issue17`), R (Opus reviewer at P1.2),
  I (entry is hash-stable post-landing)
**Related GLOSSARY entries:** none directly (the fix is internal to a
  `summary.tex` lemma body). Cross-validates the unitary qualifier in
  [[def:fuscat]] and the dagger convention in [[conv:basics]].

---

## Per-artifact provenance (Tier 2: authoritative stocktake source reports)

These reports were synthesised pre-baseline or in early Phase 1; they
are the **bridges** between `summary.tex` and the external CAD / MMA
projects. Phase 1's `GLOSSARY.md` + `CONVENTIONS.md` content cites
these reports as authoritative.

---

## 2026-05-16: `stocktake/reports/opus-hilbert-bridge.md`

**Source path:** `(this repo)` — synthesised by an Opus 4.7 subagent
  in step P1.4-early-A by reading: `summary.tex` §2 (for `def:HP`),
  `/home/tobias/Projects/microscopic-mobile-anyons/tex/sections/finegraining.tex`
  + `/home/tobias/Projects/microscopic-mobile-anyons/src/MobileAnyons/hilbert.jl`
  (for mobile-Fock), and
  `/home/tobias/Projects/cft-anyons-deprecated/Formalisation/Foundations/ProjectDefinitions.lean`
  (for CAD `H_N^W` coordinate skeleton).
**Source SHA256:** `95fa8c48dd65f7be11a84a9a9a28bf6c2afc7de92401b3048f94c083e84be857`
**Migration step:** P1.4-early-A
**Commit:** `770d730`
**Harmonisation applied:** none beyond the synthesis itself (the report
  produces a bidirectional bijection on basis elements + 7 enumerated
  convention dependencies). Verdict YELLOW (reconcilable with
  convention work; no plan revision needed).
**Validation passed:** M (report produced), R (user-read-and-acknowledged
  per MIGRATION_LOG)
**Related GLOSSARY entries:** [[def:HP]], [[def:Hlatt]], [[def:indlim]],
  [[def:mobile-Fock]] — the four Hilbert-space-framing entries.

---

## 2026-05-16: `stocktake/reports/cad-lean.md`

**Source path:** synthesised by a prior session by reading
  `/home/tobias/Projects/cft-anyons-deprecated/Formalisation/` (all Lean
  files in `Foundations/`, `LinearAlgebra/`, `Fibonacci/`, `Ising/`).
**Source SHA256:** `acb77c3ccc7c769f4380af3f9ce82a456b57f2708624ac99b7190c6306a4bd01`
**Migration step:** Pre-baseline (file landed with P0.1 baseline `7e62d9a`)
**Commit:** `7e62d9a` (P0.1)
**Harmonisation applied:** none — read-only static analysis output.
  §5 (per-file mapping CAD `.lean` ↔ `summary.tex` section) is the
  authoritative source for P1.7 CAD-bullet content.
**Validation passed:** M, I (file hash stable from baseline)
**Related GLOSSARY entries:** every entry whose CAD Translation map
  bullet cites a CAD `.lean` file (~21 substantive CAD-mapped entries).
  Notable: [[def:fuscat]] ← `SkeletalFusion.lean`; [[def:Hlatt]] ←
  `ProjectDefinitions.lean::IndefiniteParticleSectorCoordinates`;
  [[def:refmap]] ← `LinearAlgebra/FineGraining.lean::FiniteFineGraining`;
  [[def:fib]] ← `Fibonacci/FusionRules.lean`.

---

## 2026-05-16: `stocktake/reports/mma-julia.md`

**Source path:** synthesised by a prior session by reading
  `/home/tobias/Projects/microscopic-mobile-anyons/src/MobileAnyons/`
  (11 `.jl` source files in `src/MobileAnyons/` + 18 `.jl` test files
  in `test/` + `Project.toml`).
**Source SHA256:** `5585d9fc09787fdc75250fc3a3c1261ef980d0893bfbee6ef84ae8379b9f1f5a`
**Migration step:** Pre-baseline (file landed with P0.1 baseline `7e62d9a`)
**Commit:** `7e62d9a` (P0.1)
**Harmonisation applied:** none — read-only static analysis output.
  §5 (overlap with `cft-anyons/summary.tex`, per-struct mapping) is the
  authoritative source for P1.8 MMA-bullet content. §3 (key concepts)
  and §2 (file-by-file inventory) are cross-validators.
**Validation passed:** M, I (file hash stable from baseline)
**Related GLOSSARY entries:** every entry whose MMA Translation map
  bullet cites an MMA Julia file (~22 substantive MMA-mapped entries).
  Plan-named primary targets: [[def:partition]] ←
  `src/MobileAnyons/config.jl::LabelledConfig`; [[def:refmap]] ←
  `src/MobileAnyons/finegraining.jl::normalized_product_isometry`;
  [[def:TL-cat]] ← `src/MobileAnyons/interaction.jl::interaction_hamiltonian`.

---

## 2026-05-16: `stocktake/reports/opus-glossary-audit.md`

**Source path:** `(this repo)` — produced by an Opus 4.7 hostile-audit
  subagent in P1.9 reading `GLOSSARY.md` + `CONVENTIONS.md`
  end-to-end with cross-references to `summary.tex`, `ERRATA.md`,
  `CLAUDE.md`, `stocktake/reports/opus-hilbert-bridge.md`,
  `CITATION_INDEX.md`.
**Source SHA256:** `44c6502f7e5d38e4f872e3816a7393f7ddbdb868db6ab75df6b3c9e3bd4ab732`
**Migration step:** P1.9
**Commit:** `b986495`
**Harmonisation applied:** 5 MINOR cleanups folded into the same P1.9
  commit (GLOSSARY Status refresh, CONVENTIONS Status refresh,
  7 future-tense → past-tense forward-pointers, CONVENTIONS (a)
  archive-path clarification, CONVENTIONS (a) Sweep status
  disambiguation). 3 NITs deferred as optional polish.
**Validation passed:** M (audit produced), R (this audit IS the
  R-gate for Phase 1 definitional integrity)
**Verdict:** **APPROVE FOR PHASE 2** (zero CRITICAL, zero MAJOR).
  Phase 2 unblock awaits user read-and-approve.

---

## Phase 2 imports

Phase 2 imports the external validators (PDFs, bibliography, hostile
reviews) before any new mathematical content. Each artifact below has
its source path, import commit, verifier script, and hashes recorded
here so future agents can detect drift cheaply (without re-running the
full P2.2 / P2.4 imports).

### `references/` (P2.1, P2.2)

Bulk-imported in P2.1 (`a9a3095`) from
`/home/tobiasosborne/Projects/cft-anyons-deprecated/references/` via
`cp -a` (38 files, 28M; `diff -rq` zero divergence vs source at
import). SHA256-verified in P2.2 (`4b2147f`): 33/33 PASS (16 primary
local sources + 17 extracted text files) against the per-file hashes
in `references/manifest/SOURCES.md`. The per-file manifest is the
authoritative record; this section is a pointer to it, not a
duplication.

- **Manifest (per-file SHA256 table):** `references/manifest/SOURCES.md`.
- **Verifier script:** `scripts/check-references-sha256.py` —
  re-runs the P2.2 verification (computes SHA256 for every primary
  source + every extracted text, compares against the manifest, exits 0
  on full PASS / 1 on any mismatch). NOTE: pre-existing path bug
  (bd `cft-anyons-wfr`) — line 17 hard-codes `/home/tobias/Projects/cft-anyons`;
  on devices with a different user-home prefix the script will not find
  the manifest. Workaround until fixed: edit the path or run the
  verification ad-hoc per `MIGRATION_LOG.md` P2.2 notes.
- **Line-locator audit:** `scripts/check-references-line-locators.py`
  scans canonical content for `references/text/<file>:<line>` citations
  and reports per-locator PASS/FAIL/EMPTY. P2.3 (`f921991`) reports
  0 locators in present canonical content (vacuous PASS); the gate
  fires in earnest from Phase 3 onward.

### `literature/` (P2.4, P2.5, P2.6, P2.7)

Bulk-imported in P2.4 (`e975def`) from
`/home/tobiasosborne/Projects/microscopic-mobile-anyons/literature/`
via `cp -a` (`diff -rq` zero divergence vs source at import).

- **Files under version control:** 387 (excludes the gitignored DB
  stack — see next bullet).
- **Total size of versioned content:** 107541244 bytes (~103 MiB).
- **Roll-up SHA256 digest:**
  `0861d623d0dca63c8f75e3fbabde8053a1077c180f3be6a2a32264c6c8809e22`.
  Construction: enumerate every file under `literature/` excluding
  the gitignored DB stack, sort lexicographically, SHA256 each file,
  SHA256 the resulting `<hash>  <path>` lines. Reproducible at this
  commit via `python3 scripts/check-literature-tree.py`.
- **Verifier script:** `scripts/check-literature-tree.py` (new in
  P2.7) — recomputes the roll-up digest from a portable repo root
  (`Path(__file__).resolve().parents[1]`); excludes the gitignored DB
  stack; prints per-file count + total size + roll-up digest; always
  exits 0 (audit tool, not a gate). Drift detection: any change to a
  versioned literature file changes the roll-up digest; future agents
  compare against this PROVENANCE entry to spot drift.
- **`literature/db/papers.sqlite`:** per-machine local cache
  (gitignored per `.gitignore:61`); content varies by device and
  curation epoch. **Source on this device (P2.5 transfer):**
  `/home/tobiasosborne/Projects/microscopic-mobile-anyons/literature/db/papers.sqlite`,
  SHA256
  `8b6db8ff3a7dd4d5147ea6a8bc22fa6688cd12c2b8f0ed7a36bc752dcc2e6520`,
  524288 bytes. **P2.5 verifier:** `scripts/check-literature-db.py`
  (commit `36189d5`); `PRAGMA integrity_check` PASS; row counts
  papers=630, citations=702, authors=29, paper_authors=31,
  crawl_log=17, seeds=10, file_provenance=47 — all matching the
  `literature/SYNTHESIS.md:20-21` baseline (630 papers, 702 citation
  edges) verbatim.
- **`scripts/lit/lit.py`:** literature CLI, ported in P2.6 (`2ecf220`)
  from
  `/home/tobiasosborne/Projects/microscopic-mobile-anyons/scripts/lit.py`
  with a one-line `REPO_ROOT` adjustment
  (`parent.parent` → `parents[2]`) for the extra `lit/` subdirectory
  required by the plan's `scripts/lit/` target. Source SHA256
  `a8105d2350499941d53804d48ed833608d8a225b3fb482c5e4d83be423ce3c2f`;
  destination SHA256
  `119c3f0f06b63fe343f647771cde9d1f147d96dd06f702c7e5376ee27600eaa5`.
  Mutation-proven (revert REPO_ROOT → FAIL on `lit status`; restore →
  PASS). Stdlib-only imports; no helper files copied.

---

## Phase 4 imports — Lean infrastructure (`Formalisation/LinearAlgebra/`)

Phase 4 ports the 13 abstract `LinearAlgebra/` Lean files from
`cft-anyons-deprecated/Formalisation/LinearAlgebra/` into this
repo's `Formalisation/LinearAlgebra/`. All 13 files contain only
finite-dimensional matrix lemmas (isometry/coisometry, polar,
Kronecker tensor, tensor-power, heterogeneous tensor, trace,
postcompose, component projection, no-mixing, fine-graining,
coherent-system, diagonal scaling, charge-only); no fusion-category
content, Mathlib-only dependencies, Mathlib pin
`d6dab93da86c64219ab1497ffadce1a66aa04701`, toolchain
`leanprover/lean4:v4.30.0-rc2`. Each per-file commit also appended
one `import Formalisation.LinearAlgebra.<file>` line to
`Formalisation.lean` (the P4.1 placeholder; 11-line comment block
+ 1 blank + 13 imports = 25-line file at P4.14 close).

Each per-file commit (P4.2–P4.14) is a single-file atomic port
with `lake build` green, mutation-proof PASS, zero `sorry` / zero
`axiom`, and a docstring block extending the source with
`-- GLOSSARY: <slug>` cross-references to already-existing
GLOSSARY entries. The body of every file is byte-for-byte verbatim
from the source from `namespace CFTAnyons` to EOF; the only
diff between source and destination is the added docstring block
(which is why source and destination SHA256s differ per file).

**Source root:** `/home/tobiasosborne/Projects/cft-anyons-deprecated/Formalisation/LinearAlgebra/`
(13 `.lean` files; pre-existing in the source repo, no in-source
edits performed in this consolidation).

**Destination root:** `Formalisation/LinearAlgebra/` in this repo.

**Per-file SHA256 table.** Source SHA256 = pre-existing source hash
at port time; Destination SHA256 = post-port hash (differs from
source by the added docstring block). Both hashes were recorded
verbatim in each P4.X commit message at port time and are
re-verified in this commit (13/13 match for both source and
destination).

| P-step | File | Source SHA256 | Destination SHA256 | Commit |
| --- | --- | --- | --- | --- |
| P4.2  | `Isometry.lean`            | `c50b83eea32ca55fcbc024ee98bb71d7e3c231694c0d360914105e80b09da6b1` | `c409f590310b03631b854d5ed662ad98d7ae3fa1e4b17129ce1043df1c7647fc` | `8c04ada` |
| P4.3  | `Polar.lean`               | `3ea66a65dae65ac2428cbef1ae7d9d0d0677e78e9de4fd185c35f820d60f1f61` | `cf7851c4dedb31524190c892fda30ab9c7535d83a50d4cae41d5f0a7cce685c0` | `a413ff1` |
| P4.4  | `Tensor.lean`              | `31bcddbd604c0442b9d17ae7a9ec8807019cab5b9c126b748f46a39a0e9a6afd` | `66dd43925f6b84d0882686a4c02e2d2c7542943abac48e90d9d352c459c135c6` | `626230e` |
| P4.5  | `TensorPower.lean`         | `9180306ffbed970610445f8a196f00e16383e30ed2d4b46506cb4ac904b38e7a` | `9264053f0f6a2b286b45bc603eb628503f6abd61a37f12c0b160c7d0964e2154` | `1c4e41a` |
| P4.6  | `HeterogeneousTensor.lean` | `2249954c8b084576e611010b6cf51998d4bf6574c26dd2261fc1166ff66fb0f4` | `f304c59d61e5878e528a0d2645ce2195648bb7e3062e8a7b77f59454c5ade11f` | `3f5443d` |
| P4.7  | `Trace.lean`               | `e82354c21b04ef7671d540c040483946f7994b5f22a3879891ef3de68c8c5e5c` | `e6fc54c55e97b0503492057435df6efe094d2ca7b58cde0983b66fcca6711ae8` | `832fcf3` |
| P4.8  | `Postcompose.lean`         | `7601cbc4451da5a480e44de22af0f270c73fdd4af6193e27efdf7b76a07b4bcf` | `77711cf5ea218445c5d336e06b4a810e02b1c720176f4644b1566d9a12176666` | `9c88cb2` |
| P4.9  | `Component.lean`           | `8eccc6e05ea527bbbfb110cf418ffb8bad1a6cd3791a1311fadf9e0e3f483136` | `c2dbd2b5a5c81e237335a88af5b2b299237bb229595d83a2c217903411ae72e8` | `5e02be7` |
| P4.10 | `NoMixing.lean`            | `63f6cd10136d3b56f181dba919ccbf79e3fcde4d612454623782d76d32ad4027` | `82622f7568d9068d7129dda351b652cb9809083e313e7635cdfb35458da6c046` | `180e87b` |
| P4.11 | `FineGraining.lean`        | `e02b98f8d80994e5c05bf103f267c91f08641d5fd5c453397456fa02383bab62` | `f5e194e5d8229cc59e1fbd5634ee9b07586c59da919c0b3350742e16c25fd7ba` | `1e93a90` |
| P4.12 | `CoherentSystem.lean`      | `729f2f430b2b57e9568e0a77d898ace9863f8eca4a7f5fc32985f67bae2c4d7a` | `edc121dcfa22cbecda1da1ca802cf8d7c522fc65e09d0ccc11d47bfd5b2e3770` | `b890772` |
| P4.13 | `DiagonalScaling.lean`     | `798caa5ba56ea7818f10d6651870370bc4e3bf2b6eadc24cf598f1b0d4624832` | `f13a34c09100ba641cc4fa04d4026ce553957eb85490eef8b501ae0a54ece776` | `9a741fc` |
| P4.14 | `ChargeOnly.lean`          | `9b9646d9a12da7619c2cdd62f6d79aa7c8c17381d24f946489c3920e67b2e439` | `8f6e53141c9d8736eef682c4160144c100dfd2c4ccc3ef01144ead9635a616b4` | `e80e6fd` |

**Harmonisation applied per file:** docstring block extended with
`-- GLOSSARY: <slug>` cross-references (D-gate); body verbatim
from source from `namespace CFTAnyons` onward. No semantic edits
to declarations, no proof modifications, no new GLOSSARY entries
added (every cross-referenced slug pre-existed at port time).
Specific GLOSSARY slugs cross-referenced are recorded per-commit
in each P4.X commit message body (`GLOSSARY changes: none (N
existing slugs cross-referenced; no new entries)`).

**Validation passed per port:** M (lake build green), D (GLOSSARY
slugs cross-referenced and verified pre-existing), I (file hash
stable post-landing). R-gate exercised post-commit by hostile Opus
reviewer per orchestrator policy (Core-tier port-and-verify mode;
each port carries a verdict in its commit-attached review record
under `bd cft-anyons-99c.<N>`).

**Mutation-proof per port:** each P4.X commit demonstrates that the
lake build catches semantic edits to proof bodies (typical
mutation: rename an identifier in the proof body → FAIL; restore
→ PASS), per CLAUDE.md Rule 5 port-and-verify discipline. Mutations
were NOT committed.

**Sorry/axiom invariant per port:**
`grep -n 'sorry\|axiom' Formalisation/LinearAlgebra/<file>.lean`
returns empty for every file (load-bearing invariant per CLAUDE.md
hallucination-risk callout: "Lean `0 sorry, 0 axiom` is a
load-bearing invariant").

**Verifier (re-runnable).** All 26 hashes above are computable from
the working tree at this commit:
```bash
for f in Isometry Polar Tensor TensorPower HeterogeneousTensor \
         Trace Postcompose Component NoMixing FineGraining \
         CoherentSystem DiagonalScaling ChargeOnly; do
  sha256sum \
    "/home/tobiasosborne/Projects/cft-anyons-deprecated/Formalisation/LinearAlgebra/$f.lean" \
    "Formalisation/LinearAlgebra/$f.lean"
done
```
(Source-path is the absolute path on the device where the ports
were performed; on a fresh clone, edit the source root or skip
the source hashes — destination hashes alone suffice for drift
detection within this repo.)

**Cross-validation at this commit (P4.15).** All 13 × 2 = 26
SHA256s computed in this commit match the SHA256s recorded in the
respective P4.X commit messages verbatim. No drift detected.

**`lakefile.lean` / `lean-toolchain` / `lake-manifest.json`.** Not
re-recorded here — already documented at the P4.1 row of
`MIGRATION_LOG.md` (commit `bf2b088`) where they were copied
verbatim from `cft-anyons-deprecated/` with hashes
`4d7def06125182f9c615b86abdc0fa7836f0443cd0c0f944e99f30af902e49ae`
/ `ce4c4e3d87434b9663f46de25ce34b48a0cf0d392e0a320a0787b4674a2d7b61`
/ `9622a638b3bba50584b56136b05be6e52aafde26db59ffa6b3d1468a9e2d8623`.
The P4.1 lake skeleton + Mathlib cache + minimal
`Formalisation.lean` placeholder are the precondition for the 13
ports recorded above.

**Phase 4 close.** With P4.15 (this commit), all 14 P-step
children of `bd cft-anyons-99c` are closed; the Phase 4 epic
closes genuinely (not re-opened — last child landed).

---

## Phase 5 imports — Lean fusion-category content (`Formalisation/{Foundations,Fibonacci,Ising}/`)

Phase 5 ports the 15 fusion-category Lean files from
`cft-anyons-deprecated/Formalisation/{Foundations,Fibonacci,Ising}/`
into this repo's corresponding `Formalisation/` sub-directories:
6 `Foundations/` files (P5.1–P5.6), 8 `Fibonacci/` files (P5.7–P5.14),
and 1 `Ising/` file (P5.15). Same Mathlib pin
`d6dab93da86c64219ab1497ffadce1a66aa04701` and toolchain
`leanprover/lean4:v4.30.0-rc2` as Phase 4. Each per-file commit
also appended one `import Formalisation.<subdir>.<file>` line to
`Formalisation.lean` (which grew from the P4.14 close at 25 lines
to 40 lines at P5.15 close).

Each per-file commit (P5.1–P5.15) is a single-file atomic port
with `lake build` green at the corresponding job count (8449 →
8463 over the 15 commits), mutation-proof PASS, zero `sorry` /
zero `axiom`, hostile Opus reviewer verdict PASS (with per-commit
recommendations applied in-commit per CLAUDE.md Law 2), and an
extended docstring containing GLOSSARY pre-binding citations
(verbatim quotes from the relevant translation maps) plus per-decl
correspondence audits. The body of every file is byte-for-byte
verbatim from the source from `namespace CFTAnyons` to EOF, EXCEPT
for the 4 decoupling-refactor ports P5.3/P5.4/P5.5/P5.6 (which
DROPPED Fibonacci-specific second namespaces from CAD's
`Foundations/` files; deferred decls tracked in `cft-anyons-5tm.3`)
and the 5 reviewer-driven additive named-theorem ports P5.7/P5.8/
P5.10/... (which ADDED named theorems honouring GLOSSARY
pre-binding promise text literally; never modified existing CAD
proofs or statements).

**Source root:** `/home/tobiasosborne/Projects/cft-anyons-deprecated/Formalisation/{Foundations,Fibonacci,Ising}/`
(15 `.lean` files; pre-existing in the source repo, no in-source
edits performed in this consolidation).

**Destination root:** `Formalisation/{Foundations,Fibonacci,Ising}/`
in this repo (the `Fibonacci/` and `Ising/` sub-directories were
newly created at P5.7 and P5.15 respectively; `Foundations/` was
newly created at P5.1).

**Per-file SHA256 table.** Source SHA256 = pre-existing source
hash at port time; Destination SHA256 = post-port hash (differs
from source by the docstring extension, plus the body changes
noted above for refactor/reviewer-additive ports). All hashes
recorded verbatim in each P5.X commit message at port time and
re-verified in this commit (15/15 match for both source and
destination).

| P-step | File | Source SHA256 | Destination SHA256 | Commit |
| --- | --- | --- | --- | --- |
| P5.1  | `Foundations/SkeletalFusion.lean`       | `fc6428cea8aa6b325887f6264386bfa61009f4b4e5bb1a8cd5e9079851494b79` | `364cfbe634fd1713428d7ec3b5d307e8b721ad61ad66127031f6ba1c50f578b7` | `eb337ff` |
| P5.2  | `Foundations/DirectSumCoordinates.lean` | `57393ff23e276cb89e45c5a462b1a96453ee825d4b06fb50f894028bd29394ee` | `e8603096ba732f9c0aba7464f02433d40ad651bd9cc09b09174df3fc965dcde3` | `8f3f1b2` |
| P5.3  | `Foundations/Configurations.lean`       | `915878be0f0f5891b06e0820cfba93e38620c557604acef08f4383d7280a0d1b` | `2747e50de48d0cc71ed90bad61b7bacaaeddd059c2f38707aa028150745493cb` | `7601c78` |
| P5.4  | `Foundations/ConfigurationSpace.lean`   | `9d979b292817da08b743ded868c88787c8cbb4a8719d52804364173d7ebcfd23` | `f3765245942d388a35c9254ed570b21e13679dd9df76f68846e872ec7ed3bd6e` | `a896156` |
| P5.5  | `Foundations/FockSpace.lean`            | `6762d9f6c3aa28e9b69916e71f86a7450531fcd62be8a7a7660b30c9deb8ad67` | `9cf2f2b643835cf51e73a2247ec81e45ece9c0b25d3c9b2c8766954bf7b2c5f0` | `2706c88` |
| P5.6  | `Foundations/ProjectDefinitions.lean`   | `bd8bcae29dc81371eb89c8a2f5901ce1d722aa4c12a9d77b684c47360de2dbaf` | `b5b14f14ac066678bb8b94fba20add646cef14f773efe16d5962ab2021033bc5` | `05516c1` |
| P5.7  | `Fibonacci/Basic.lean`                  | `24fd79e3ffaef9c029dd161ccd94b39a3ff1351e4cafd50f1bed0e4c38bb3443` | `a444b4eb328806109ef01aa2f515439b138701e1b04b8dcc281865affa79e5d9` | `91db405` |
| P5.8  | `Fibonacci/Matrix.lean`                 | `824e8563832b86747b58c2300c8b8c0ec8bdc5b2d6a2308f243e8933048e499d` | `36b25deb800e3bc2b0a43aadfab569b22d6263d053ddb42b6809c4f0b3e46720` | `4ae7c8f` |
| P5.9  | `Fibonacci/FusionRules.lean`            | `667e41f1fb7b64246237198b927eee0b77a19764abb13dc5c142d19b169fbfc9` | `d6b2e19880103b444b6d823303365331b232e13711211efac1e6e8a79b849fac` | `f9c8b3e` |
| P5.10 | `Fibonacci/Binary.lean`                 | `1663a7565b32f1f226257cf34ced4b14edc14e4f4a741c59f3979a70d387eba2` | `3f924ee15b76750a4188dad30e02a659cb753552c785ea266852dd44c3f87b50` | `483bcd8` |
| P5.11 | `Fibonacci/Coassoc.lean`                | `79d2e6f323a162ce9bcbd77b37b94f9a406e8c11a02da201d6769e0ca4f14a1b` | `0c76c2f397a4592ee599eb0be839b0b7581fa72741612911a8fb2a8788da8849` | `9a17b02` |
| P5.12 | `Fibonacci/CFTWeights.lean`             | `af8dfbf51b950def1c1fdbb4b20e59bb7ec54c66a68cb1a41a5ebb8fc1df6e9f` | `25263aeb1d7f95c7f1f6d96ff093c1f126424f2669a403ec72c039eced6ae22c` | `79baabd` |
| P5.13 | `Fibonacci/BraidMatrices.lean`          | `f21e57d7d407ca6b2076e743637829aded333222235f02dd6527c5fdce4bf890` | `c848b9a7aaf8cfaf9e7c5cb55392e5bee0c97fbcf79acd1e43971a0c8ea0610a` | `461e033` |
| P5.14 | `Fibonacci/RGNoMixing.lean`             | `57b4f90419ce74cb575a15fe0fd8bcbebbbd5832484f0cd4c30890b816e9acd1` | `39f278a84469d18ddff62ba00dc86bfa13fcd1c81f161f705b6fb43fa8422dd7` | `0e1372d` |
| P5.15 | `Ising/Basic.lean`                      | `a8c43300f9da46f548981ae042ebcff8e360b9dfcee05ae3372ea11e9c0486cb` | `4e0b1b5211c57e134afead5618671b26f9bfca1663c4c4774d20316e3cda93b4` | `90b6b39` |

**Harmonisation applied per file.** Five distinct patterns:

(i) *Verbatim port + docstring extension* (P5.1, P5.2, P5.7, P5.8,
P5.9, P5.10, P5.11, P5.12, P5.13, P5.14, P5.15): body byte-identical
to CAD source; docstring extended with GLOSSARY pre-binding citations
(verbatim translation-map quotes), per-decl correspondence, 2-way
C-gate, Wolfram-leg deferral notes.

(ii) *Decoupling refactor* (P5.3, P5.4, P5.5, P5.6): CAD's
`Foundations/` files mixed generic and Fibonacci-specific namespaces;
each refactor DROPPED the `Fibonacci*` namespace, deferring those
declarations to `cft-anyons-5tm.3`. Body is byte-equivalent
modulo the dropped block.

(iii) *Reviewer-additive named theorems* (P5.7 + P5.8 + P5.10):
hostile Opus reviewer (per `feedback_reviewer_deep_d_gate.md`)
required additional named theorems to honour GLOSSARY pre-binding
text literally (e.g., P5.7 added `two_phi_inv_sq_plus_phi_inv_cubed`
for `lem:fib-arith` sub-claim D; P5.8 added 4 `FibF_entry_*` lemmas
+ `FibF_transpose`). These additions never modified existing CAD
proofs.

(iv) *Critical scope disambiguation* (P5.11): the file proves
SCALAR coassociativity; the docstring explicitly disavows the
CATEGORICAL equation `(η⊗id)η = (id⊗η)η` per CLAUDE.md
hallucination-risk callout #3 (4× disavowal in docstring).

(v) *Decision step with deferral* (P5.15): orchestrator chose
option (b) per MIGRATION_PLAN.md §P5.15 — port verbatim, defer
the `isingSkeletalFusionData` FiniteSkeletalFusionData connection
to follow-up `cft-anyons-5tm.25` (documented in
RESEARCH_NOTES.md DD-1).

**Validation passed per port.** M (lake build green at the
expected job count), D (GLOSSARY pre-bindings honoured per-promise;
hostile Opus reviewer's deep D-gate audit cleared), C (2-way
C-gate Lean ↔ summary.tex executed in docstring per-sub-claim;
3-way Wolfram leg deferred to Phase 6 via 9 bd follow-ups —
cft-anyons-5tm.9, .11, .13, .15, .17, .19, .21, .23, .26),
I (zero sorry / zero axiom load-bearing invariant). R-gate
exercised explicitly for P5.1 (R required per plan) and P5.11
(R-tier per plan); other ports exercised R-gate implicitly via
the per-commit hostile reviewer.

**Mutation-proof per port.** Each P5.X commit demonstrates that
the lake build catches semantic edits (typical mutation: perturb
an equational-RHS or a fusion-multiplicity entry → FAIL with a
specific named-decl diagnostic; restore → PASS). Mutations were
NOT committed. Notable: P5.10's mutation specifically tested the
amplitude-vs-squared-amplitude bug pattern (perturbing
`pfAmplitude_one_tau_tau`'s sqrt collapse → 2 cascading errors),
honouring CLAUDE.md Rule 2 and ERRATA.md 2026-05-16.

**Sorry/axiom invariant per port.**
`grep -nE '\bsorry\b|\baxiom\b' Formalisation/{Foundations,Fibonacci,Ising}/<file>.lean`
returns empty for every file (load-bearing invariant per CLAUDE.md
hallucination-risk callout).

**Verifier (re-runnable).** All 30 hashes above are computable
from the working tree at this commit:
```bash
for d in Foundations Fibonacci Ising; do
  for f in /home/tobiasosborne/Projects/cft-anyons-deprecated/Formalisation/$d/*.lean; do
    fn=$(basename "$f")
    sha256sum "$f" "Formalisation/$d/$fn"
  done
done
```
(Source-path is the absolute path on the device where the ports
were performed; destination hashes alone suffice for drift
detection within this repo.)

**Cross-validation at this commit (P5.16).** All 15 × 2 = 30
SHA256s computed in this commit match the SHA256s recorded in the
P5.1–P5.15 commit message bodies. Final lake build verified green
at 8463 jobs.

**Phase 5 close.** With P5.16 (this commit), all 16 P-step
children of `bd cft-anyons-5tm` are closed (P5.1–P5.15 + P5.16);
the Phase 5 epic remains OPEN until 9 Wolfram-followup bd issues
(cft-anyons-5tm.{9,11,13,15,17,19,21,23,26}) + the deferred
decls follow-up (cft-anyons-5tm.3 — 11 cumulative deferred decls
from P5.3–P5.6 refactors) + the FiniteSkeletalFusionData connection
(cft-anyons-5tm.25) are addressed. These follow-ups are Phase-6
work; Phase 5's PRIMARY content scope (per-file ports + GLOSSARY
pre-binding discharge + 2-way C-gates) is now complete.

---

## Phase 6 imports — triple-check scripts (`scripts/{julia,wolfram}/`, `results/CHECKS.md`)

Phase 6 ports the 51-file CAD triple-check infrastructure from
`cft-anyons-deprecated/scripts/{julia,wolfram}/` and
`cft-anyons-deprecated/results/CHECKS.md` into this repo. The
infrastructure consists of 25 Julia cross-check scripts (one per
abstract Lean module + the fusion-category and CFT-weight modules)
+ 25 Wolfram exact-symbolic counterparts (same coverage, exact
arithmetic rather than floating-point) + the dated `CHECKS.md`
historical pass log carrying the 2026-05-14 / 2026-05-15 CAD-original
run records. Together with the Lean files ported in Phases 4 and 5,
these scripts supply the **3-way C-gate** (Lean / Julia / Wolfram)
discipline declared by `CLAUDE.md` Rule 5 (port-and-verify mode) +
`CONVENTIONS.md` for the cross-validation triangle.

P6.1+P6.2 (commit `8b680b2`) was a MECHANICAL `cp -a` port — `diff -r`
empty across all three trees / files, full 51-file SHA256 manifest
recorded in the commit body. P6.3 / P6.4 ran one Julia / one Wolfram
script as infrastructure smoke tests (commits `f42a0c1` / `4c2c0b1`).
P6.5 / P6.6 scaled to all 25 of each (commits `2a3eb44` / `6da4aab`),
appending dated `CHECKS.md` sections per `MIGRATION_PLAN.md:243-244`
append-don't-overwrite rule. P6.7 (this commit) aggregates the
per-file SHA256s + per-step rerun records + `CHECKS.md` growth into
this Phase-6 block.

**Source root:** `/home/tobiasosborne/Projects/cft-anyons-deprecated/{scripts/julia,scripts/wolfram,results}/`
(51 files; pre-existing in the source repo, no in-source edits
performed in this consolidation).

**Destination root:** `scripts/{julia,wolfram}/` + `results/CHECKS.md`
in this repo (the `scripts/julia/`, `scripts/wolfram/`, and `results/`
directories pre-existed at P6.1 with `.gitkeep` placeholders; those
placeholders were removed in the P6.1+P6.2 commit when real content
arrived).

**Per-file SHA256 manifest.** Source and destination hashes are
identical at import time (mechanical `cp -a`; `diff -r` empty across
both script trees and the `CHECKS.md` file). For the 50 script files
the hash remains stable post-import through this commit (verified by
`sha256sum scripts/julia/*.jl scripts/wolfram/*.wls` at P6.7 — 50/50
match the P6.1 manifest exactly, NO drift). For `results/CHECKS.md`
the **at-import** hash is recorded below (canonical PROVENANCE record
matching the Phase-5 convention); subsequent dated-section appends at
P6.3/P6.4/P6.5/P6.6 mutate the live file but are tracked separately
in the growth log further down.

| P-step | Destination | Source = Destination SHA256 (at P6.1 import) |
| --- | --- | --- |
| P6.1 | `scripts/julia/cft_weight_checks.jl`              | `dc3e6d53b3a0e9bca73c9383d034972a2ffa22719f4e26587db3f93be19f48ce` |
| P6.1 | `scripts/julia/charge_only_negative_checks.jl`    | `d87fe325bc61da047e0bf07d2b97efb225f66fd90e77560c250cb2a622e99ee1` |
| P6.1 | `scripts/julia/coassoc_unique_checks.jl`          | `531678a0413ff3f639cbd453d7f519566fce7dd074621843d96188d4d881a6d3` |
| P6.1 | `scripts/julia/coherent_system_checks.jl`         | `2c986715e209b47cb50f730c873401813d81590d454bd6b5f49554efdf8cf0fb` |
| P6.1 | `scripts/julia/component_orthogonality_checks.jl` | `66a11bbdfc868837d8e01a41f63f4b713e54a97be04ff4ab8f86611df0f5772f` |
| P6.1 | `scripts/julia/configuration_checks.jl`           | `1b38dde1027597dc9b1f709c0f7f24eedbb0adb1569bc2bbc88299059b6cbc40` |
| P6.1 | `scripts/julia/configuration_space_checks.jl`     | `85d6fe80a33406eba5dcc93e8fa4a0588868709531bfacc1b7b22ce913cea29a` |
| P6.1 | `scripts/julia/diagonal_scaling_checks.jl`        | `989893995d5088b34fe643ef4514ca6f4df0349a1ee020a13d5f56a4c9741d20` |
| P6.1 | `scripts/julia/direct_sum_coordinate_checks.jl`   | `42f3f7ea6b58f723933afcf062c6daec9338ce197d7b6ef7ecd7949895f7a46d` |
| P6.1 | `scripts/julia/direct_sum_orthogonal_checks.jl`   | `579cfea294fb1268dfb7ef62e21607152a4505f5af8478b89d669988f7c6ebad` |
| P6.1 | `scripts/julia/direct_sum_projection_checks.jl`   | `9d82cd07bc86f819e3822cecc3cbfbe00ab3143934e4e19a543a313477b01c74` |
| P6.1 | `scripts/julia/fibonacci_braid_checks.jl`         | `e18883a4851e5143fe75389c3041435121a69542d51c7d843dc5a9c2cea767ab` |
| P6.1 | `scripts/julia/fibonacci_braid_unitarity_checks.jl` | `89d84df4d0a3746d25bdbf83f2c885a73638f8d9b187ee73c98ff32b6abddf38` |
| P6.1 | `scripts/julia/fibonacci_checks.jl`               | `a3653656bfeb9f2ab1df970d6bf57258cb070a37ebf8fae3e4223b2fd9fe85a5` |
| P6.1 | `scripts/julia/fine_graining_definition_checks.jl` | `a883b81fda445a0a3f134fd3d84e6201ca224e8326ce97f1609c51ba1eaba153` |
| P6.1 | `scripts/julia/fusion_rules_checks.jl`            | `94ad2f5efc246e9a3a342951f58ca780168ea1eb4fc3cfc7f9eebbc5ea1d0a03` |
| P6.1 | `scripts/julia/ising_toy_checks.jl`               | `71f2a7fd6c9764459f52c0f783af4787812f865a94f1c4218b6224380d2728eb` |
| P6.1 | `scripts/julia/linear_algebra_checks.jl`          | `fb37c1a8b2a4fe9aceab6b915a2d303c5cc9304e9d6b9d497ae001784de3360b` |
| P6.1 | `scripts/julia/linear_algebra_trace_checks.jl`    | `cf19b2aef003a15bcadbda81d34d3337ceac545fea77e2ac2b0e3874fcbbb8ea` |
| P6.1 | `scripts/julia/polar_section_checks.jl`           | `1670155218eb57f7d8d60fd8af5812b77bacc43dd64f74a546c3aef678304dc9` |
| P6.1 | `scripts/julia/postcompose_isometry_checks.jl`    | `2a8df527f01110b9a808a381ae86b2add858f54f31b08ff5eb91adf1e78c43af` |
| P6.1 | `scripts/julia/project_definition_checks.jl`      | `d9d102e7a3d1ae0cb8d25d2f6ee83c8f359eef0bdfdeaaf01e23e559bb9c4eae` |
| P6.1 | `scripts/julia/tensor_isometry_checks.jl`         | `e8df456e032386ab34d4fbea34238faf9c0ae0417e2c2ad777cd5e5ff85ae9fd` |
| P6.1 | `scripts/julia/tensor_power_checks.jl`            | `d64754812ae46e4c628314feae8b85a3e8917a6668cf3dd7b3ec8681545769b0` |
| P6.1 | `scripts/julia/truncated_fock_checks.jl`          | `9847904e756567a1d8c20f61e8ceda6f0c9f9394fb946220eb9a3f52009b0a15` |
| P6.1 | `scripts/wolfram/cft_weight_exact.wls`            | `8f07d9a0d31ff24c6a25445518faac69e6bd3fcc4e9f1c3ad46cfa172e63d797` |
| P6.1 | `scripts/wolfram/charge_only_negative_exact.wls`  | `e4343272c46ef71e485df981350c5c862b6086014591100ecd39bd644384200d` |
| P6.1 | `scripts/wolfram/coassoc_unique_exact.wls`        | `15f70edd37afc2af4f98c1f7d70bc3ecd8b6d3d2a4cfd09802bb18a7c3474017` |
| P6.1 | `scripts/wolfram/coherent_system_exact.wls`       | `f32cfca02bb165189e2e30222473f8a12d30a826186f74c63a48db4013ccb8b5` |
| P6.1 | `scripts/wolfram/component_orthogonality_exact.wls` | `c6275497d4e381a4f298c69c16e457352ee0daf40cb16300d0b97ef6fb26519b` |
| P6.1 | `scripts/wolfram/configuration_exact.wls`         | `6d84f5dbd7185773d74931b32a23fc1f9229e99ccd06dede4e269fd448442b56` |
| P6.1 | `scripts/wolfram/configuration_space_exact.wls`   | `83fbd54e2ec49cc3f1717d68a24fffd72cf4c2eb295a19245093e51207456933` |
| P6.1 | `scripts/wolfram/diagonal_scaling_exact.wls`      | `dc9f28e4b63e1d01fb160e4bb5212badf98cf7216e3deb089c6447ee2de998cc` |
| P6.1 | `scripts/wolfram/direct_sum_coordinate_exact.wls` | `00debe972601203b8279670516b45fb71463da44b95a0d3d7c1663efc2956979` |
| P6.1 | `scripts/wolfram/direct_sum_orthogonal_exact.wls` | `84a6daed9e1379a5828b7b7690a42ddaf5d88a13fd2a09a12c41bd59c57e0398` |
| P6.1 | `scripts/wolfram/direct_sum_projection_exact.wls` | `78a74546b4dce8d960ebb431fbad507e6095622d40ae6de34376b21bafcea247` |
| P6.1 | `scripts/wolfram/fibonacci_braid_exact.wls`       | `a5a9c88bb35fee476ed304deeae08d50e82c245e45afd12cbbbbee43f99a58f2` |
| P6.1 | `scripts/wolfram/fibonacci_braid_unitarity_exact.wls` | `898bb795c8692e2fc4a59c9ed654718af13fd13aaf9325f9165f0e06946d1a38` |
| P6.1 | `scripts/wolfram/fibonacci_exact.wls`             | `e036cd0e18b1fc3274d927196a5f553124a099fa529a787d1f451ab4b68b7d2e` |
| P6.1 | `scripts/wolfram/fine_graining_definition_exact.wls` | `7a510d9e096e4c4a7d0608633fdbdb71e0b0a8d9f781a6e2d56d2ee9bd950f82` |
| P6.1 | `scripts/wolfram/fusion_rules_exact.wls`          | `230e3213fc49baa1fa07bd04f19bae083376e0723ed7959ffa51042c091c28f8` |
| P6.1 | `scripts/wolfram/ising_toy_exact.wls`             | `5e4fc6be86c9661d62c535be290e45986a3f9df6d6014a3c3c7478ba2f0aa122` |
| P6.1 | `scripts/wolfram/linear_algebra_exact.wls`        | `66bbb539ed219e343f3df9b6d9ed4de6cc972a7bfdac3aa1b03e4b9d7bf57fac` |
| P6.1 | `scripts/wolfram/linear_algebra_trace_exact.wls`  | `7e277bae8ca3cb576e647f77479e1e8ef4148c27e8974315c9be3dfac8418e47` |
| P6.1 | `scripts/wolfram/polar_section_exact.wls`         | `f874808b025a75d920c689481b28a638d3e9f0268bdddc953a24df3faf96cbae` |
| P6.1 | `scripts/wolfram/postcompose_isometry_exact.wls`  | `e95616b7b629b15274b3505dddb8cc3179d55f3f086b53004a3afea7d34eeb42` |
| P6.1 | `scripts/wolfram/project_definition_exact.wls`    | `597c58987681beda976e212c71fb8d499397698f89e22f9df202d4e7e7954355` |
| P6.1 | `scripts/wolfram/tensor_isometry_exact.wls`       | `7e8d048c769aa9befc2156e960fde95de6e6ca39b42bb370439120f023bec1bf` |
| P6.1 | `scripts/wolfram/tensor_power_exact.wls`          | `fa84e55310b3b61aa3a1c156fbf5c7ce7e667fdb259235dcb0f77dc0df7ba2b6` |
| P6.1 | `scripts/wolfram/truncated_fock_exact.wls`        | `1546fe79da9cde814d83ddc414f6b26e775d601bb5d5d761db1f949b90f401d1` |
| P6.2 | `results/CHECKS.md` (at-import, 1034 lines)       | `4aec2fd0c7874ca97ba5031fd1d84560bac341f7b7a96f4a4af9e5629fef826c` |

**Phase-6 rerun records.** Each rerun appended a dated section to
`results/CHECKS.md`; together they constitute the canonical-repo
re-validation of the ported infrastructure (the CAD originals were
last validated 2026-05-14 / 2026-05-15 per the at-import `CHECKS.md`).

| Step | Date | Scope | Aggregate result | Wall time | Commit |
| --- | --- | --- | --- | --- | --- |
| P6.3 | 2026-05-17 | 1 Julia smoke (`direct_sum_orthogonal_checks.jl`)             | 1/1 PASS, exit 0  | <1s    | `f42a0c1` |
| P6.4 | 2026-05-17 | 1 Wolfram smoke (`direct_sum_orthogonal_exact.wls`) via TIB VPN | 1/1 PASS, exit 0  | 9.013s | `4c2c0b1` |
| P6.5 | 2026-05-17 | 25 Julia full-suite (`for f in scripts/julia/*.jl; do julia "$f"`) | 25/25 PASS, exit 0 | ~37s   | `2a3eb44` |
| P6.6 | 2026-05-17 | 25 Wolfram full-suite (`for f in scripts/wolfram/*.wls; do wolframscript -file "$f"`) via TIB VPN | 25/25 PASS, exit 0 | ~133s  | `6da4aab` |

**Aggregate across the four reruns: 52 script invocations, 52 PASS,
0 FAIL, 0 timeouts, 0 retries, 0 license-server hiccups.** Every
script emitted its expected `all <name> passed` (Julia) or
`all exact <name> passed` (Wolfram) final-line confirmation; no
floating-point tolerance accepted on the Wolfram leg (exact-symbolic
arithmetic throughout).

**`results/CHECKS.md` growth log.**

| Stage | Line count | Delta | Section header appended |
| --- | --- | --- | --- |
| P6.2 import       | 1034 | (baseline)   | (carry-over from CAD; 19 dated sections) |
| Post-P6.3 append  | 1073 | +39          | `## 2026-05-17: Phase 6 P6.3 — Julia infrastructure smoke test (canonical repo)` (CHECKS.md line 1036) |
| Post-P6.4 append  | 1120 | +47          | `## 2026-05-17: Phase 6 P6.4 — Wolfram infrastructure smoke test (canonical repo)` (CHECKS.md line 1074) |
| Post-P6.5 append  | 1196 | +76          | `## 2026-05-17: Phase 6 P6.5 — Julia full-suite rerun (25 scripts, canonical repo)` (CHECKS.md line 1122) |
| Post-P6.6 append  | 1372 | +176         | `## 2026-05-17: Phase 6 P6.6 — Wolfram full-suite rerun (25 scripts, canonical repo)` (CHECKS.md line 1198) |

Cumulative Phase-6 delta: **+338 lines (1034 → 1372)**; the pre-import
historical record (1034 lines) is preserved intact per the
`MIGRATION_PLAN.md:243-244` append-don't-overwrite rule. The current
working-tree SHA256 of `results/CHECKS.md` is
`9d3e9db2937b38f041666616a7e026b675055cde5f70f7524cc2215248dc1a7e`
(this commit; differs from the at-import hash `4aec2fd0…` by exactly
the four appended dated sections).

**Harmonisation applied.** Five distinct patterns:

(i) *Mechanical port at P6.1+P6.2*: `cp -a` from
`cft-anyons-deprecated/`; `diff -r` empty across both script trees
and the CHECKS.md file. All 51 source/destination SHA256s identical
at import time per the manifest above; 50/50 still match at this
commit (only `results/CHECKS.md` has changed by design — see growth
log).

(ii) *Infrastructure smoke tests at P6.3 + P6.4*: P6.3 confirmed the
Julia stdlib `LinearAlgebra` suffices for the smallest script (no
`Project.toml` required at repo root; canonical state preserved).
P6.4 confirmed the TIB-VPN-routed Wolfram license server is reachable
for `wolframscript -file` invocations (pre-check `wolframscript -code
"1+1"` → `2` returned in <1s before each VPN-requiring run).

(iii) *Full-suite reruns at P6.5 + P6.6*: each appended one
per-script pass-status table to `results/CHECKS.md` (P6.5 +76 lines;
P6.6 +176 lines — larger because the Wolfram section additionally
documents the 9 Phase-5 follow-up C-gate discharges). No failures
across 50 script runs.

(iv) *3-way C-gate discharge at P6.6 for 9 Phase-5 follow-ups*: when
the Phase-5 Lean ports landed (P5.7–P5.15), 9 of them carried a
Wolfram-leg deferral filed as `cft-anyons-5tm.{9,11,13,15,17,19,21,23,26}`
because the canonical `scripts/wolfram/` infrastructure had not yet
been ported (that landed at P6.1, commit `8b680b2`). P6.6 supplied
the missing Wolfram leg by running the matching scripts (`fibonacci_exact.wls`
for `.9`/`.15`/`.23`; `fibonacci_braid_unitarity_exact.wls` for `.11`;
`fusion_rules_exact.wls` for `.13`; `coassoc_unique_exact.wls` for
`.17`; `cft_weight_exact.wls` for `.19`; `fibonacci_braid_exact.wls`
+ `fibonacci_braid_unitarity_exact.wls` for `.21`;
`polar_section_exact.wls` (supporting) for `.23`; `ising_toy_exact.wls`
for `.26`); mapping is by topic-coverage since the bd-issue
descriptions used hypothetical script names at filing time (e.g.
`fibonacci_F_matrix.wls`) that don't match the actual P6.1 naming
convention. Full mapping table recorded in `results/CHECKS.md`
§ P6.6. All 9 followups closed; Phase-5 epic `cft-anyons-5tm`
auto-closed at the same commit (5tm.26 was its last open child).

(v) *Aggregation at P6.7* (this commit): pure docs operation; no
script reruns, no `lake build`, no semantic content.

**Validation passed per Phase-6 step.** P6.1+P6.2: M, I (diff -r
empty; SHA256 manifest byte-identical; cp -a idempotent). P6.3, P6.4,
P6.5, P6.6: M (per-script pass-strings + exit 0; CHECKS.md append
text-only), I (re-running produces same outputs; appending another
dated section is the next-day operation). P6.7 (this commit): M, I
(mechanical aggregation; SHA256s recomputed at this commit and
verified against P6.1 manifest = 50/50 match for the script files;
CHECKS.md at-import-vs-current hashes both recorded).

**Mutation-proof per phase.** The triple-check infrastructure IS the
mutation-proof discipline for Phases 4/5 — Lean ports' `lake build`
catches Lean semantic edits, Julia scripts catch numerical drift
in the implementation, Wolfram scripts catch symbolic drift in the
exact-arithmetic identities. P6's reruns confirmed all 50 ported
scripts execute correctly in the canonical repo (no syntactic or
environmental drift introduced by the `cp -a` migration).

**Verifier (re-runnable).** All 50 script SHA256s above are
computable from the working tree at this commit:
```bash
sha256sum scripts/julia/*.jl scripts/wolfram/*.wls
# (compare against the per-row hashes in the manifest above;
#  50/50 should match exactly. The 51st row,
#  results/CHECKS.md, records the AT-IMPORT hash and is
#  EXPECTED to differ from the current working-tree hash by
#  the four appended dated sections — see growth log.)
```

**Cross-validation at this commit (P6.7).** All 50 script-file
SHA256s recomputed at this commit match the SHA256s recorded in
the P6.1+P6.2 commit body (commit `8b680b2`) verbatim. No drift
detected on the script files. `results/CHECKS.md` has drifted from
`4aec2fd0…` (at-import, 1034 lines) to
`9d3e9db2937b38f041666616a7e026b675055cde5f70f7524cc2215248dc1a7e`
(this commit, 1372 lines) by exactly the four appended dated
sections per the growth log — drift is expected and append-only.

**Phase 6 close.** With P6.7 (this commit), all 7 P-step children of
`bd cft-anyons-cb1` are closed (P6.1, P6.2, P6.3, P6.4, P6.5, P6.6,
P6.7); the Phase 6 epic `cft-anyons-cb1` auto-closes as `cft-anyons-s3o`
(P6.7) was its last open child (per HANDOFF gotcha #37). The earlier
P6.6 commit (`6da4aab`) already auto-closed Phase 5's epic
`cft-anyons-5tm` (by closing its last open child, `5tm.26`); this
commit completes the parallel auto-close for Phase 6.

---

## Schema for each entry (future Phase 2+ imports)

```
## <YYYY-MM-DD>: <imported file path in canonical repo>

**Source path:** <absolute path in source project>
**Source SHA256:** <hash>
**Migration step:** <P-step ID>
**Commit:** <hash>
**Harmonisation applied:** <description, or "none">
**Validation passed:** M D C R I (which gates)
**Related GLOSSARY entries:** [[name1]], [[name2]]
```

Phase 1's per-artifact entries above adapt this schema: in-repo
authored content uses `(this repo) — <path>` as **Source path**;
synthesised reports name the read-only external project(s) consulted.
External imports starting in Phase 2 use the schema directly.
