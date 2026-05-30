# P1.9 audit: GLOSSARY + CONVENTIONS end-to-end

**Date:** 2026-05-16
**Auditor:** Opus 4.7 hostile-audit subagent (general-purpose)
**Files under audit:** GLOSSARY.md (49 entries, 2053 lines post-P1.8), CONVENTIONS.md (10 entries, 552 lines)
**Authoritative sources:** summary.tex (2483 lines), ERRATA.md, CLAUDE.md, stocktake/reports/opus-hilbert-bridge.md, CITATION_INDEX.md, MIGRATION_LOG.md

## Verdict

**APPROVE FOR PHASE 2** (with MINOR cleanup recommended, none blocking).

Zero CRITICAL findings. Zero MAJOR findings. The 8 MINOR findings are all editorial / state-staleness (Status sections written at P1.3/P1.6 commit time now lag the actual MIGRATION_LOG state; some forward-pointers use future tense for steps that have already landed; one in-repo cited path points to a placeholder `.gitkeep` instead of a real file). None of these creates definitional drift or risks silent contradiction during Phase 2 imports. Definitional integrity is intact: 48/48 byte-verbatim §A canonical bodies (spot-checked 13/48), 43/43 unique cross-link slugs resolve to defined headers, 7/7 in-use CONVENTIONS letter-forward-pointers resolve, all hallucination-risk callouts fire where expected.

## Findings (numbered, each with severity)

### Finding 1: GLOSSARY Status section is stale (post-P1.3 history not captured)  [severity: MINOR]

**Location:** `GLOSSARY.md:17-57`

**Description:** The Status section is structured per-commit and shows P1.1, P1.2, and "**P1.3 (this commit):**", then lists P1.5–P1.9 as "**Remaining Phase 1 work that populates stub fields:**". Per `MIGRATION_LOG.md`, P1.5 (commit `40c0a22`), P1.6 (`8226003`), P1.7 (`d8c0a40`), and P1.8 (recent) have all landed. A new agent reading this Status section without consulting `MIGRATION_LOG.md` will think Translation maps are still stubbed "TBD pending P1.5/P1.7/P1.8" — they aren't (they're populated).

**Required action / recommended edit:** Append a `**P1.5:**` / `**P1.6:**` / `**P1.7:**` / `**P1.8:**` / `**P1.9 (this commit):**` block to the Status section, each one-sentence summarising what landed (e.g., "P1.5: filled the four Hilbert-space Translation maps with explicit bidirectional bijections from bridge §2.1–§2.3"). Move P1.5/P1.6/P1.7/P1.8 from the "Remaining Phase 1 work" list, and update the remaining list to P1.9/P1.10/P1.11.

**Justification:** `MIGRATION_LOG.md` rows P1.5–P1.8 are landed and committed. Stale Status risks an agent rewriting already-populated bullets thinking they're empty.

---

### Finding 2: CONVENTIONS Status section uses "(this commit)" but P1.6 is no longer "this"  [severity: MINOR]

**Location:** `CONVENTIONS.md:18`

**Description:** Status line reads `**P1.6 (this commit):** 10 conventions declared`. Per `MIGRATION_LOG.md`, P1.6 landed at commit `8226003` (4 commits ago at the time of this audit). After P1.7 and P1.8 also touched GLOSSARY's CONVENTIONS-referencing cross-links, the "(this commit)" language no longer applies to the current HEAD.

**Required action / recommended edit:** Change `**P1.6 (this commit):**` to `**P1.6:**` (and date if useful: `2026-05-16`). Optionally add a `**P1.9 (this commit):**` block noting the audit's verdict.

**Justification:** Same as Finding 1 — Status is a state descriptor, not a template; should not lie about which commit is "this".

---

### Finding 3: Future-tense forward-pointers to P1.5/P1.6 (all landed)  [severity: MINOR]

**Location:** Across GLOSSARY entries — concretely:
- `GLOSSARY.md:143` (conv:basics Notes): "P1.6 will lift the F-matrix gauge and multiplicity-free assumption from implicit-here to declared `CONVENTIONS.md` items."
- `GLOSSARY.md:412` (def:Q Notes): "P1.6(h) will declare $Q_{\mathrm{full}}$ as the canonical default."
- `GLOSSARY.md:418` (def:Q Notes): "P1.6(a) will lock the canonical choice in `CONVENTIONS.md`."
- `GLOSSARY.md:612` (def:HP Notes): "P1.5 will write the explicit translation map into the relevant entries."
- `GLOSSARY.md:614` (def:HP Notes): "P1.6(g) will lock $N$ to *tensor degree / lattice length / cell count*."
- `GLOSSARY.md:1328` (def:dense Notes): "P1.6(i) will lock this ordering as the canonical fusion-tree convention."
- `GLOSSARY.md:2041` (def:mobile-Fock Notes): "P1.6(j) will lift 'empty partition / $N=0$ boundary' to a CONVENTIONS entry so the three formulations agree at the absolute boundary."

**Description:** All seven sentences are written in future tense ("P1.X will lock") but the referenced steps have all landed (P1.5 via `40c0a22`, P1.6 via `8226003`). A reader following these forward-pointers may assume the canonical decision is still pending, when in fact it's already in `CONVENTIONS.md` and discoverable via the bracketed `[P1.6(letter)]` tags elsewhere in the same entries.

**Required action / recommended edit:** Change each "P1.X will" to "P1.X locked" / "per [P1.X(letter)]" / "see [P1.X(letter)]"; or simply delete the sentence when the same content already appears in a different Notes paragraph (e.g., conv:basics Notes already mentions the F-matrix gauge work).

**Justification:** These are state assertions, not template placeholders. Keeping them in future tense is a tiny but real drift risk: an agent who reads only Notes (not the body+aliases+translation-map) may think the lock hasn't happened.

---

### Finding 4: In-repo citation `archive/mma-archive-v0-snapshot/.../hilbert_space.md:39` points to a directory containing only `.gitkeep`  [severity: MINOR]

**Location:** `CONVENTIONS.md:88`

**Description:** CONVENTIONS (a) Translation rules lists `**archive/mma-archive-v0-snapshot:**` as the source for "0-indexed simple reference" content that an agent might import. The in-repo `archive/mma-archive-v0-snapshot/` directory currently contains only `.gitkeep` — the actual `hilbert_space.md:39` (with `X_0 = 1`) lives at `/home/tobias/Projects/microscopic-mobile-anyons/archive/v0/docs/hilbert_space.md:39`. The cited file does not yet exist in this repo. (CLAUDE.md's file map at line 472 reserves this directory for "MMA's v0 with known bugs (reference only)", consistent with the placeholder; per `MIGRATION_PLAN.md` the snapshot is staged for a later phase.)

**Required action / recommended edit:** Either (a) add a parenthetical noting "(directory placeholder until snapshot import — see file at `microscopic-mobile-anyons/archive/v0/docs/hilbert_space.md:39` for ground truth)" to clarify; or (b) leave as-is but note in `RESEARCH_NOTES.md` / `bd` that the convention sweep must re-validate this citation post-snapshot-import. GLOSSARY def:Q already uses the shorthand path `hilbert_space.md:39` without the misleading `archive/mma-archive-v0-snapshot/` prefix, so the simplest fix is to align CONVENTIONS' wording with GLOSSARY's.

**Justification:** No agent action is blocked by this — the rule "shift any 0-indexed simple reference by +1" still makes sense as a translation rule. But an auditor pointed at the file path will not find it, which weakens the audit-traceability of the convention.

---

### Finding 5: Sweep-status assertion misstates def:Q  [severity: MINOR]

**Location:** `CONVENTIONS.md:97-99`

**Description:** CONVENTIONS (a) Sweep status reads: `[[def:Q]] uses Q_full = ⊕_{a ∈ Irr(C)} a (the enumeration is canonical 1-indexed);`. But the def:Q canonical body says explicitly: "A *local cell object* is any object $Q\in\Cc$". def:Q does NOT pick $Q_{\mathrm{full}}$; it allows any object. CONVENTIONS (h) (which is also in scope, and which the sweep status doesn't fully cite) declares $Q_{\mathrm{full}}$ as the *canonical default*, and the Q entry's Notes correctly catalog the five options from `rem:Q-choices`.

**Required action / recommended edit:** Rephrase as `[[def:Q]] is the abstract definition; CONVENTIONS (h) declares the canonical default Q_full = ⊕_a a (1-indexed enumeration); [[def:HP]]/[[def:Hlatt]]/[[def:mobile-Fock]] all use the canonical default per their respective Translation maps.` This is a one-line fix.

**Justification:** Sweep status is meant to be a map from "this convention" to "entries that follow it". Misstating def:Q as "uses Q_full" obscures that Q is generic and that the canonical-default choice is a separate convention.

---

### Finding 6: def:RG-amp, def:stress entries are not cross-linked from any other entry  [severity: MINOR]

**Location:** Entry headers at `GLOSSARY.md:1483` (def:stress), `GLOSSARY.md:1569` (def:RG-amp)

**Description:** def:stress and def:RG-amp are both legitimate `\begin{definition}` extractions from summary.tex with full Translation maps and Notes. But no other GLOSSARY entry uses `[[def:stress]]` or `[[def:RG-amp]]` as a cross-link in its body / Aliases / Translation map / Notes. Other "leaf" CFT entries (def:primary, def:OPE, def:isingcft) are cross-linked from at least two entries each.

For comparison: def:primary is cross-linked from def:scalop, def:stress, def:OPE, def:RG-amp, def:smear, def:Ageom, def:isingcft. def:stress is cross-linked nowhere even though it generates the [[def:primary]] algebra (def:stress Notes mentions "Generates the [[def:primary]] algebra").

**Required action / recommended edit:** Add backlinks in cross-relevant Notes:
- def:primary Notes could mention "Stress tensor [[def:stress]] generates the Virasoro algebra; OPE coefficients [[def:OPE]] specialise scattering data."
- def:KS-Ln Notes could mention "Continuum analogue of the stress tensor [[def:stress]]; central charge appears in both [[def:stress]] OPE and [[def:KS-Ln]] body."
- def:isingcft / def:scalop could optionally backlink to [[def:RG-amp]].

Not load-bearing — the entries are still definitionally sound, just orphaned from the cross-link graph.

**Justification:** Cross-link graph helps an agent navigate; orphaned entries are slightly harder to discover. This is the smallest of the MINOR findings.

---

### Finding 7: Schema template at GLOSSARY.md:76-77 still references "TBD pending P1.7/P1.8"  [severity: NIT]

**Location:** `GLOSSARY.md:76-77`

**Description:** The schema-for-each-entry template box reads:
```
**Translation map:**
  - MMA: <equivalent or "TBD pending P1.8">
  - CAD: <equivalent or "TBD pending P1.7">
```

Per `HANDOFF.md:111`, this is deliberate: it's a `<placeholder>` template, not a state descriptor, and the bulk-edit script for P1.7 was explicitly designed to preserve it. The MIGRATION_LOG corroborates: this is the documented schema, not a stale forward-pointer.

**Required action / recommended edit:** None required. Optionally update the template to `"TBD pending Phase 8 (MMA imports)"` / `"TBD pending Phase 5 (CAD imports)"` for new §B-class entries that need them, since P1.7 and P1.8 are now complete and future TBDs would more naturally relate to actual content imports.

**Justification:** Per HANDOFF.md explicit guidance, this is by design. Flagged as a NIT only because a future Phase-2 reviewer might re-flag it.

---

### Finding 8: Asymmetric cross-link graph — many entries reference [[def:primary]] / [[def:isingcft]] without those targets backlinking  [severity: NIT]

**Location:** Across `GLOSSARY.md` (multiple Notes blocks)

**Description:** Beyond Finding 6, several Notes-section cross-links are unidirectional where bidirectional would aid navigation. Examples:
- [[def:scalop]] → [[def:ascending]] (forward only)
- [[def:smear]] → [[def:Ageom]] (forward only)
- [[def:pair-create]] → [[def:fib-F]] (forward only — but def:fib-F doesn't backlink, possibly fine since fib-F is a general-purpose F-matrix used in many places)

**Required action / recommended edit:** None required. Cross-link bidirectionality is a "polish" issue; the current asymmetry doesn't break any agent's ability to find the related entry by sequential read.

**Justification:** Nice-to-have; not a defect.

---

## Per-priority summary

| Priority | Description | Status |
|---|---|---|
| 1 | Undefined terms | **PASS** — all 43 unique `[[slug]]` refs resolve to defined headers; `[[label]]` at line 79 is the schema template, expected. All lemma/theorem references resolve to actual `\label{...}` in summary.tex (spot-checked 25+). All MMA struct/function names verified findable in `microscopic-mobile-anyons/src/` and `test/` (spot-checked 7); all CAD `.lean` structs verified (spot-checked 5). |
| 2 | Internal inconsistencies | **PASS** — `normalized_product_isometry`, `FusionTree`, `LabelledConfig`, etc. consistently mapped across multi-entry references. Convention dependency forward-pointers all align with CONVENTIONS letter assignments. No double-assignment of MMA structs detected. Exception: Finding 5 (def:Q sweep status mistake) is a minor inconsistency between CONVENTIONS sweep claim and def:Q canonical body. |
| 3 | Conflicts with summary.tex | **PASS** — 13/48 §A canonical bodies spot-checked byte-verbatim: conv:basics (line 76), conv:unitary-default (line 137 with no-label noted), def:fuscat (113), def:Q (194), def:Hlatt (285), def:partition (374), def:HP (384), def:ascending (449), def:algobj (474), def:fib-mult (1323) — includes corrected √φ/φ⁻¹ᐟ² values matching ERRATA, def:dense (1622), def:KS-Ln (1768 — including verbatim `\unchecked` token), def:smear (2092), def:Ageom (2175), def:pair-create (1989), def:Jinterp (2005). All matched verbatim. Surrounding-paragraph context in summary.tex does not contradict any Notes/Translation map content checked. |
| 4 | Coverage gaps | **PASS** — 48 `\begin{definition}/\begin{convention}` in summary.tex (verified via `grep -c`) ↔ 48 GLOSSARY §A entries. §B has 1 entry (def:mobile-Fock) per plan. CONVENTIONS (c), (e), (f) declared but currently uninvoked — per CONVENTIONS Status block, this is by design (declared as pre-registered hooks). |
| 5 | Hallucination-risk callouts | **PASS** — vacuum-index 0-vs-1 (fires in def:Q Notes lines 415-419, conv:basics MMA bullet line 133, def:mobile-Fock convention dep #1, CONVENTIONS (a)); F-matrix gauge involutory-vs-unitary (fires in def:fsymbol Notes lines 333-340, def:fib-F Notes lines 1027-1030, def:TL-cat Gauge-fix bullet line 1360, def:mobile-Fock dep #4, CONVENTIONS (b)); coassociativity overloading (fires in def:coassoc Notes lines 1095-1100); dagger-special ≠ Frobenius-special (fires in def:algobj Notes lines 856-862, cites warn:not-Frobenius at line 511); Hilbert-space framings reconciled across def:HP / def:Hlatt / def:indlim / def:mobile-Fock (all four entries explicitly cross-link via bridge report); `\unchecked` flag honesty (conv:acro FRS noted, def:KS-Ln body preserves `\unchecked`, def:KS-scalars Notes flags Koo–Saleur 1994, def:primary Notes flags (G_2)_1 — all matching CITATION_INDEX expectations); archived chats not cited as sources (chat references inherited from summary.tex canonical bodies are acceptable, no `archive/chats/chat*.md` paths used as Source); Lean 0-sorry/0-axiom invariant respected (no GLOSSARY entry claims a CAD struct exists where the cad-lean.md §5 'Notable gaps' would forbid it). |
| 6 | Forward-pointer integrity | **PASS with cleanup** — letter pointers `P1.6(a)`, `(b)`, `(d)`, `(g)`, `(h)`, `(i)`, `(j)` all resolve to CONVENTIONS entries; letters `(c)`, `(e)`, `(f)` declared but uninvoked per CONVENTIONS Status. Future-tense pointers to landed P1.X steps (Finding 3) cited but not blocking. Forward-pointers to P5.X, P4.X (CAD-side migration steps) — all in scope, not yet landed, correctly future-tensed. No P1.10 / P1.11 references in entry Notes (those are tracked in MIGRATION_LOG and HANDOFF only). |
| 7 | def:mobile-Fock §B compliance | **PASS** — slug-is-GLOSSARY-internal disclosure present (line 1950); two `Canonical (description):` blocks per §B schema, each with parenthetical describing source; first block byte-verbatim from bridge report `:108-120` (which itself quotes finegraining.tex:8-13); second block synthesised from hilbert.jl:75-98 per bridge report. Translation map cross-references to def:HP, def:Hlatt, def:indlim all resolve. Convention dependencies #1–#5 forward-point to CONVENTIONS letters (a)/(b)/(d)/(i)/(h), all resolve. LB-1 caveat present and references bd `cft-anyons-q6h`. |

## Recommended follow-ups (not blocking; for future steps)

1. **bd issue: schedule a single sweep-pass to refresh GLOSSARY/CONVENTIONS Status blocks after every multi-step Phase commit-set** (covers Findings 1, 2). Priority 3.
2. **bd issue: convert all "P1.X will" future-tense forward-pointers to past-tense or [P1.X(letter)] anchors in one mechanical pass** (covers Finding 3). Priority 3.
3. **bd issue (post Phase-2 file imports): re-validate `archive/mma-archive-v0-snapshot/` cited paths in CONVENTIONS once the snapshot lands as a real file** (covers Finding 4). Priority 4. Blocked on the relevant import step.
4. **bd issue: micro-cleanup of CONVENTIONS sweep statuses to distinguish "defines X" vs "uses canonical default for X"** (covers Finding 5). Priority 4.
5. **bd issue: backlink polish for def:stress / def:RG-amp / def:primary cluster** (covers Findings 6, 8). Priority 4.
6. **bd issue: when scoping P1.10 (PROVENANCE refresh), include this audit report in the per-entry provenance ledger so future audits can read the prior verdict**. Priority 3.

## Spot-check confirmations

- **D-gate (canonical bodies byte-verbatim from summary.tex)**: 13/48 entries spot-checked verbatim against summary.tex:
  - conv:basics (76) ✓
  - conv:unitary-default (137, no-label) ✓
  - def:fuscat (113) ✓
  - def:Q (194) ✓
  - def:Hlatt (285) ✓
  - def:partition (374) ✓
  - def:HP (384) ✓
  - def:ascending (449) ✓
  - def:algobj (474) ✓
  - def:fib-mult (1323) — including corrected `\sqrt{\varphi}` and `\varphi^{-1/2}` amplitudes per ERRATA ✓
  - def:dense (1622) ✓
  - def:KS-Ln (1768) — including verbatim `\unchecked` token ✓
  - def:smear (2092) ✓
  - def:Ageom (2175) ✓
  - def:pair-create (1989) ✓
  - def:Jinterp (2005) ✓
  Plus def:stress (1827), def:OPE (1834), def:phi (1013) referenced for `lem:fib-arith` validation.
  Status: PASS (16 spot-checks, all verbatim; P1.8 reviewer's prior 48/48 verdict re-validated on the most load-bearing subset).
- **Cross-link resolution**: 43 unique `[[slug]]` refs in GLOSSARY+CONVENTIONS spot-checked end-to-end against entry headers. All 43 resolve. Plus all `[[label]]` at GLOSSARY:79 confirmed to be the schema template (not a real link).
- **Forward-pointer [P1.6(x)] resolution**: 7/7 invoked letters (a, b, d, g, h, i, j) resolve to actual CONVENTIONS headers. Letters c, e, f declared but uninvoked (per CONVENTIONS Status — by design).
- **§A entry count vs summary.tex `\begin{definition}/\begin{convention}`**: GLOSSARY has 48 §A entries; summary.tex has 48 such environments (44 def + 4 conv), verified via `grep -c`. Exact match. §B has 1 entry (def:mobile-Fock).
- **Hallucination-risk callout firing**: 8/8 CLAUDE.md callouts confirmed to fire in at least one GLOSSARY entry or CONVENTIONS item (vacuum-index, F-matrix gauge, coassoc overloading, dagger-special ≠ Frobenius, Hilbert-space framings, `\unchecked` honesty, archived-chats-not-cited-as-source, Lean 0-sorry/0-axiom).
- **CAD/MMA struct existence spot-checks**: 5/5 CAD references (`FiniteFineGraining`, `LocalOccupationModel`, `FibF`, `fibSkeletalFusionData`, `IndefiniteParticleSectorCoordinates`) found in cft-anyons-deprecated tree; 7/7 MMA references (`LabelledConfig`, `enumerate_configs_hc`, `enumerate_fusion_trees`, `FusionTree`, `normalized_product_isometry`, `build_fsymbol_cache`, `interaction_hamiltonian`) found in microscopic-mobile-anyons tree. Line-number citation `config.jl:5,13` verified.
