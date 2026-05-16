# RESEARCH_NOTES — open questions, deferred decisions, acquisition queue

<!--
ROLE: Catch-all for things that don't belong in a code file, a Lean
      docstring, or a bd issue: open mathematical questions, decisions
      deliberately deferred, references still to acquire, methodology
      experiments, agent-to-agent prose notes.
UPDATE POLICY: Append-only by default. Closed/resolved items get a
      "Resolved YYYY-MM-DD: …" footer and stay in place; do not delete.
TRIGGER: Stop-condition surfaced during a migration step; \unchecked
      flag that cannot be discharged from local material; methodology
      debate; "we should consider X later"-type observations.
-->

*Stub. First entries expected in `MIGRATION_PLAN.md` step P3.3 (PDFs to
acquire for FRS, Pasquier, Huse, Koo–Saleur 1994 original, (G_2)_1) and
P5.3 (the Foundations↔Fibonacci reverse dependency to decouple).*

## Sections

- **Acquisition queue** — references needed for discharge
- **Open mathematical questions** — gaps in the canonical narrative
- **Deferred decisions** — choices intentionally postponed, with reason
- **Methodology notes** — agent-to-agent observations on what's working
- **Latent bugs in source projects** — known issues to fix during migration

---

## Latent bugs in source projects

### LB-1: MMA `enumerate_fusion_trees` is incomplete for non-multiplicity-free fusion categories

**Source:** `microscopic-mobile-anyons/src/MobileAnyons/hilbert.jl:42-68` (function `enumerate_fusion_trees`).

**Bug:** Line 58 checks `iszero(dim Hom(S[current_charge] ⊗ S[labels[k]], S[s]))` as a Boolean gate; when `dim Hom > 1` (multiplicity > 1 in the fusion category), the function still pushes only one intermediate index per channel rather than enumerating the `dim Hom` distinct multiplicity-vertex basis vectors. Result: fusion-tree basis is **undercounted** by the product of multiplicities along the tree.

**Bite radius:** Invisible for Fibonacci, Ising, and sVec (all multiplicity-free; every `dim Hom` ≤ 1). Triggered the moment MMA is extended to e.g. extended Haagerup or quantum groups at non-prime levels.

**Status:** Latent; blocked by Phase 8 (MMA Julia backend migration). Fix during P8.4 when porting `hilbert.jl`; add a `# TODO multiplicity-free assumption` marker per the recommendation in §7 of `stocktake/reports/opus-hilbert-bridge.md`. After Phase 8, file as its own bd ticket to extend `enumerate_fusion_trees` to general fusion categories.

**bd ticket:** *(filed in the same commit as this entry; see issues.jsonl)*

**Source of finding:** `stocktake/reports/opus-hilbert-bridge.md` §3.5.
