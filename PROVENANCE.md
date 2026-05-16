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
| `CITATION_INDEX.md` | `0975a557…` | `7e62d9a` (P0.1) | P0.1 baseline | In-repo; lists `\unchecked` flag → discharge-status map. Phase 1 did not touch this file. Phase 3 (discharge `\unchecked` flags) will refresh. |
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
