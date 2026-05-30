# Opus review — P1.3 GLOSSARY: §A/§B split + `def:mobile-Fock` + cross-links

**Reviewer:** Opus 4.7 subagent (general-purpose, hostile-review role per Rule 4)
**Date:** 2026-05-16
**File reviewed:** `GLOSSARY.md` (working-tree, +176/-28 lines vs HEAD; 49 entries: 48 in §A, 1 new in §B = `def:mobile-Fock`; cross-link edits in `def:HP`, `def:Hlatt`, `def:indlim` Notes)
**Companion files (read-only):** `stocktake/reports/opus-hilbert-bridge.md`, `stocktake/MIGRATION_PLAN.md`, `summary.tex:374-391`, `.beads/issues.jsonl` (for `cft-anyons-q6h`)
**Decision:** **APPROVE WITH MINOR EDITS**

---

## Per-area findings

### 1. Bridge-report fidelity (Canonical blocks)

I extracted both `Canonical` blocks programmatically and diffed line-by-line against `stocktake/reports/opus-hilbert-bridge.md`.

**First Canonical block (LaTeX quote from MMA `finegraining.tex`).**
Compared GLOSSARY lines 1587–1593 against bridge lines 114–120 (the indented content of the bridge's code block at lines 112–121, *excluding* the `% microscopic-mobile-anyons/tex/sections/finegraining.tex:8-13` comment-marker line). Result: **7/7 lines byte-identical**. The author correctly stripped the bridge-internal source-marker comment (which would have been ambiguous in the GLOSSARY context) while preserving the quoted MMA prose verbatim. PASS.

**Second Canonical block (pseudocode for `H_MMA(L)`).**
Compared GLOSSARY lines 1600–1601 against bridge lines 128–129. Result: **1/2 lines byte-identical; one minor difference.**

```
bridge:129   ⊕_{fusion_tree of (config.labels) → c} ℂ.    [trailing period]
glossary:1601 ⊕_{fusion_tree of (config.labels) → c} ℂ     [no trailing period]
```

The trailing `.` in the bridge report ("…ℂ.") is dropped in the GLOSSARY rendering ("…ℂ"). This is a single-character deviation in a block the entry implicitly claims to render verbatim (the surrounding text says "synthesised by the bridge report" — softer than "verbatim", so this is not strictly a verbatim-claim violation, but it's still a small drift worth flagging). **MINOR EDIT REQUESTED**: append the trailing period, or change the prose to make explicit that the rendering is a minor reformat.

### 2. Convention-dependency claim ("verbatim from bridge report §1.3 lines 134-136")

This claim is **doubly wrong** and is the most substantive finding of this review.

**Line range wrong.** Bridge `§1.3` content runs from line 108 to ~138. The actual "Convention dependencies:" prose is a single line: bridge `line 136`. Bridge `line 134` is the **Domain** field (`L ∈ ℕ`, …), bridge `line 135` is blank, bridge `line 137` is blank, bridge `line 138` is the Cardinality field. So citing "lines 134-136" claims a 3-line range when the relevant content is on line 136 alone, AND includes a line (134) whose content is unrelated to convention dependencies.

**"Verbatim" wrong.** The GLOSSARY's 6-item numbered list paraphrases bridge:136 substantively. Each of bridge's `(a)`–`(f)` inline bullets is restructured into a numbered list item, paraphrased lightly, and **augmented** with content not in bridge:136 at all:
- "Forward-pointer: P1.6(a)…" annotations — not in bridge.
- GLOSSARY cross-links `[[def:Hlatt]]`, `[[def:HP]]`, `[[def:splitbasis]]` — not in bridge.
- Mention of LB-1 / `cft-anyons-q6h` in item 3 — not in bridge:136 (the LB-1 finding is in bridge §3.5 line 263–269, separately cited).
- Item 6's parenthetical "contrast with [[def:Hlatt]]/[[def:HP]], which grade by $W \in \Irr(\Cc)$" — not in bridge:136.

A "verbatim" claim demands character-for-character match. The list is **accurate paraphrase plus annotations**, not verbatim. **MINOR EDIT REQUESTED**: change "verbatim from bridge report §1.3 lines 134-136" to "adapted from bridge report §1.3 line 136 (with added forward-pointers and GLOSSARY cross-links)".

**Content per-item check (item-by-item, separate from the wording-of-claim issue).** Every dependency claim in the 6 items is supported by bridge:136 modulo the paraphrase:

| Bridge:136 item | GLOSSARY item | Citation match | Content match |
|---|---|---|---|
| (a) vacuum at index 1, `config.jl:5,13` | 1. Vacuum at index 1, `config.jl:5,13` | ✓ | ✓ |
| (b) labels nonvacuum-only, `config.jl:36` uses `2:d` | 2. Labels enumerate non-vacuum simples only, `config.jl:36` uses `2:d` | ✓ | ✓ |
| (c) hard-core via Combinations, `config.jl:35` | 3. Hard-core occupancy via Combinations, `config.jl:35` | ✓ | ✓ |
| (d) F-matrix involutory, `mma-julia.md:142-149` | 4. Involutory F-matrix gauge, `mma-julia.md:142-149` | ✓ | ✓ |
| (e) left-associated fusion-tree basis, `hilbert.jl:13-15` | 5. Left-associated fusion-tree basis, `hilbert.jl:13-15` | ✓ | ✓ |
| (f) `c` summed over all simples | 6. Total charge $c$ summed over all simples, not held as superselection | ✓ | ✓ (plus added GLOSSARY cross-links) |

All file/line citations resolve. The claim is correct in **content** but mis-described as **verbatim**.

**P1.6 sub-item forward-pointers.** Cross-checked against `stocktake/MIGRATION_PLAN.md:130`:

| GLOSSARY forward-pointer | P1.6 sub-item in MIGRATION_PLAN | Match? |
|---|---|---|
| P1.6(a) vacuum-index convention | (a) vacuum index convention | ✓ |
| P1.6(b) F-matrix gauge convention | (b) F-matrix gauge | ✓ |
| P1.6(i) fusion-tree ordering convention | (i) fusion-tree basis ordering | ✓ |
| P1.6(j) empty partition / N=0 boundary | (j) empty-configuration / N=0 boundary | ✓ |

All four forward-pointers are accurate to the migration plan's lettering. PASS.

### 3. N = 0 boundary claim

GLOSSARY (lines 1662–1668):

> Also: the **`N = 0` boundary** in mobile-Fock agrees with [[def:Hlatt]]'s $N=0$ specialisation ($H_0^W = \delta_{W,1}\cdot\mathbb{C}$); see bridge report §2.4 line 253. Partition formulation [[def:HP]] does **not** technically permit $|P| = 0$ (a partition covers `X`, requiring at least one cell). P1.6(j) will lift "empty partition / $N=0$ boundary" to a CONVENTIONS entry so the three formulations agree at the absolute boundary.

**Section reference wrong.** Bridge `§2.4` **does not exist**. Bridge §2 has subsections 2.1, 2.2, 2.3 only (per `grep -n '^### ' opus-hilbert-bridge.md`). The N=0 content actually lives in bridge §3 (Equivalence verdicts), under "Edge cases checked:", as the first bulleted edge case at bridge:253. **MINOR EDIT REQUESTED**: change "bridge report §2.4 line 253" to "bridge report §3 ('Edge cases checked' bullet), line 253".

**Line number correct.** Bridge:253 IS the N=0 boundary content. The substantive claims are accurate to bridge:253:

- "Hlatt N=0 = δ_{W,1}·ℂ" — matches bridge:253 ("N-tensor: N = 0 gives H_0^W = Hom(W, Q^⊗0) = Hom(W, 1) = δ_{W,1} · ℂ"). ✓
- "Partition does not technically permit |P|=0 (a partition covers X, requiring at least one cell)" — matches bridge:253 ("Partition: |P| = 0 is technically not allowed by summary.tex:374-382 (an ordered partition is a finite chain that covers X; N ≥ 1 implicit)"). I additionally verified `summary.tex:374-382` directly: the partition is defined as `\{I_1 < ... < I_N\}` with `\bigcup_{i=1}^N I_i = X`; setting `N = 0` yields an empty union, contradicting `= X` (unless `X = ∅`, which it isn't since `X = [0, L]`). ✓

### 4. LB-1 caveat accuracy

GLOSSARY (lines 1670–1678):

> **LB-1 caveat (latent bug, blocked on Phase 8):** the MMA function `enumerate_fusion_trees` at `microscopic-mobile-anyons/src/MobileAnyons/hilbert.jl:42-68` undercounts the basis for fusion categories with $\dim\Hom(a\otimes b, c) > 1$. Filed as bd `cft-anyons-q6h`. The three currently-used categories ([[def:fib]], [[def:ising]], sVec) are all multiplicity-free, so the bug is **latent for present scope** but blocks any future extension to extended Haagerup, certain quantum groups at non-prime levels, etc. See bridge report §3.5 line 263–269 for full discussion.

**Line range correct.** Bridge `§3.5` opens at line 263; substantive content runs 265–267; trailing `---` is at 269. The cited range 263–269 covers the whole §3.5 block. ✓

**bd ticket exists.** Verified against `.beads/issues.jsonl:6` — `cft-anyons-q6h` is filed with title "LB-1: MMA enumerate_fusion_trees incomplete for non-multiplicity-free categories", status open, priority 2. ✓

**Content claim accurate.** "Undercounts the basis for fusion categories with $\dim\Hom(a\otimes b, c) > 1$" matches bridge:265 exactly: "treats `dim Hom(X_{current_charge} ⊗ X_{labels[k]}, X_s)` as a 0/1 indicator … **undercounts the basis** by a factor of the product of multiplicities along the tree." The example categories named (extended Haagerup, certain quantum groups at non-prime levels) match bridge:265 verbatim. ✓

**Scope claim accurate.** "Fibonacci, Ising, sVec are all multiplicity-free" matches bridge:265 ("Fibonacci, Ising, and sVec — all multiplicity-free"). The GLOSSARY adds GLOSSARY cross-links `[[def:fib]]`, `[[def:ising]]` (`def:fib` and `def:ising` both exist in §A — verified via `grep`); sVec has no GLOSSARY entry, which is consistent with PRD scope (sVec is mentioned but not yet a §A entry). ✓

PASS for area 4.

### 5. Cross-link updates to `def:HP`, `def:Hlatt`, `def:indlim`

**`def:Hlatt` Notes update (lines 397–404).** Added `[[def:mobile-Fock]]` plus a new sentence: "Mobile-Fock [[def:mobile-Fock]] differs from this entry by additionally summing over particle number $N$ and total charge $c$ (not held as superselection labels) — see the bridge report §2.2." Bridge §2.2 IS the N-tensor ↔ Mobile-Fock section, so the reference is correct. The substantive claim "differs by additionally summing over N and c" matches bridge:215 (`H_MMA(L) ≅ ⊕_{W ∈ Irr(C)} ⊕_{N=0}^L H_N^W`). ✓

**`def:HP` Notes update (lines 488–496).** Two changes worth noting:
- Adds `[[def:mobile-Fock]]` cross-link in the three-framings sentence.
- **Corrects a prior inaccuracy** in the P1.1 text. The old text said "MMA's mobile-Fock (continuum direct limit [[def:indlim]])", which conflated mobile-Fock with the inductive-limit closure. The new text correctly separates them: "MMA's mobile-Fock formulation [[def:mobile-Fock]] (special case $A_I = Q_{\mathrm{full}}$ + …). The continuum direct limit of this construction is [[def:indlim]]." This silent correction is the right call — `def:indlim` is the *continuum completion* (`Hh_∞^W = \overline{\varinjlim_P Hh_P^W}`, per the entry's own Canonical), whereas mobile-Fock is a *discrete* `H_MMA(L)` at fixed lattice length L; bridge §1.3 ↔ bridge §2.3 confirms this.

**Caveat on `def:HP` phrasing (MINOR — feeds back into the P1.6(g) disambiguation that the entry itself flags).** The new `def:HP` characterisation says mobile-Fock is "special case $A_I = Q_{\mathrm{full}}$ + direct sum over particle number $N$ + direct sum over total charge $c$". In the partition formulation, the partition size `|P|` is a chosen parameter, not summed. Mobile-Fock recovers from partition by additionally summing over `|P| = 0, …, L` (= partition sizes / tensor degrees), and over W. The phrase "direct sum over particle number $N$" uses `N` in MMA's local convention (where `N` IS the particle number) — but `def:HP` itself uses no `N`, and the convention disambiguation P1.6(g) explicitly flags that "particle number" can mean different things across the source projects. Using "particle number $N$" here, in a Note for `def:HP`, is on the wrong side of the very disambiguation the entry forward-points to. **MINOR EDIT POSSIBLE**: re-phrase as "(special case: choose $A_I = Q_{\mathrm{full}}$; mobile-Fock additionally sums over partition size $0 \le |P| \le L$ and over total charge $c \in \Irr(\Cc)$)" — or wait until P1.5 writes the explicit translation map and the disambiguation is in CONVENTIONS.

**`def:indlim` Notes update (lines 582–590).** Added: "The continuum limit here is the analytical completion of the partition-canonical [[def:HP]] tower; MMA's mobile-Fock [[def:mobile-Fock]] is the discrete (lattice-cut-off-$L$) analogue of the same direct sum structure. All three discrete framings ([[def:HP]], [[def:Hlatt]], [[def:mobile-Fock]]) and this inductive-limit closure reconcile per `stocktake/reports/opus-hilbert-bridge.md`." Accurate: `def:indlim` IS the analytical completion of the partition tower (per its own Canonical), and mobile-Fock IS its discrete-at-finite-L analogue (per bridge §1.3 → §2.3). ✓

This update also addresses the prior-review minor edit #2 from `opus-glossary-p1.1-review.md` ("def:indlim Notes: append one sentence pointing back to the three-Hilbert-space-framings reconciliation"). Good — the prior review's open minor edit is now discharged for `def:indlim`. *(Open question: were the other two P1.1 minor edits — `def:KS-Ln` line-number nit, `def:Q` vacuum-index callout — addressed in this commit? Not according to the diff. They remain outstanding; not a P1.3 blocker, but worth flagging as carry-forward.)*

**No collateral damage check.** I ran `git diff HEAD --unified=0 GLOSSARY.md | grep '^@@'` to enumerate all 8 changed hunks: 5 hunks affect the Status/Schema preamble (lines 19, 36, 41, 57, 66); 3 hunks affect the three updated Notes fields (lines 367, 456, 547); 1 hunk adds the new §B + `def:mobile-Fock` (line 1530). No §A canonical payload is touched. I additionally ran a programmatic D-gate replay (parse each §A entry, extract `\begin{...}…\end{...}` from `summary.tex` at the cited line, compare byte-for-byte): **48/48 §A entries pass D-gate after the changes**. The P1.1 D-gate has been preserved. PASS.

### 6. Status block accuracy

Cross-checked the new Status block (`GLOSSARY.md:17-57`) against the actual file state and against `stocktake/MIGRATION_PLAN.md`:

| Status claim | File state / plan reality | Match? |
|---|---|---|
| P1.1 past tense ("48 entries from `summary.tex`, all in §A") | §A entry count: 48 (44 def + 4 conv) — programmatically confirmed | ✓ |
| P1.1 D-gate preserved ("`Canonical` payloads are copied **verbatim**") | D-gate replay: 48/48 byte-identical to source | ✓ |
| P1.2 past tense ("no GLOSSARY change") | `git log` shows P1.2 commit (`0e4592a`) modifies `ERRATA.md` only; no GLOSSARY change | ✓ |
| P1.3 ("this commit"): "added one entry from outside `summary.tex`: `def:mobile-Fock`" | §B has exactly 1 entry, `def:mobile-Fock` | ✓ |
| P1.3: "Declared the partition formulation [[def:HP]] as canonical (already so from P1.1; re-affirmed)" | `def:HP` Notes contained "**This is the canonical Hilbert-space formulation…**" already at P1.1 (verified in `opus-glossary-p1.1-review.md:160-169`); P1.3 only re-affirms via cross-links | ✓ (honest accounting — explicitly says "already so from P1.1") |
| P1.3: "Added cross-links in [[def:HP]], [[def:Hlatt]], [[def:indlim]] Notes" | Diff confirms exactly these three Notes-field hunks | ✓ |
| P1.3: "Translation-map fields stubbed 'TBD pending P1.5'" | `def:mobile-Fock` Translation-map: three bullets all read "TBD pending P1.5" or "TBD pending P1.7" | ✓ (the CAD bullet correctly defers to P1.7 per the plan) |
| Remaining: P1.5, P1.6, P1.7, P1.8, P1.9 | Migration plan rows: P1.5, P1.6, P1.7, P1.8, P1.9 all open; P1.4 already discharged (P1.4-early-A `770d730`); P1.10, P1.11 also still open but described in the file's "Remaining Phase 1 work" header as "populates stub fields", which is the right characterisation of P1.5–P1.9 | ✓ (P1.10/P1.11 PROVENANCE/PRD-refresh tasks are out of scope of the "populates stub fields" framing — they could be listed but the omission is defensible since they don't touch GLOSSARY) |

All Status-block claims verified. PASS.

**One observation (not edit-requested):** the new Status block's "Remaining" list does not mention P1.10 (PROVENANCE update) or P1.11 (PRD v0 → v1 refresh). Those steps don't populate GLOSSARY stub fields, so omission from a "remaining Phase 1 work that populates stub fields" list is defensible. A future agent who reads the Status block in isolation might think Phase 1 ends at P1.9, which would be wrong — but the prior agent has explicitly delimited the scope ("Remaining Phase 1 work that populates stub fields"), so the framing is honest. Not flagging.

### 7. Schema deviation justification

The new entry has **two** `Canonical (…):**` blocks (one ```latex, one ```text):

```
**Canonical (LaTeX quote from MMA `finegraining.tex`, as preserved in
the bridge report):**

```latex
…
```

**Canonical (full MMA basis structure, synthesised by the bridge report
from the Julia code `hilbert.jl:75-98`):**

```text
…
```
```

This deviates from §A's pattern of one `**Canonical:**` block.

**The prompt claims this is "flagged explicitly in the entry."** Reading the entry: the deviation is NOT explicitly flagged. The two parenthetical qualifiers ("LaTeX quote from …" and "full MMA basis structure, synthesised by the bridge report from …") *describe the contents* of each block, but do not say "this entry uses two Canonical blocks instead of one because the MMA source has both a prose definition and a Julia-code implementation, and the GLOSSARY needs both."

**The updated schema doc does NOT authorise multiple Canonical blocks.** The schema documentation block (lines 61–80) describes a single `**Canonical:**` field with one ```latex fence. The §A/§B distinction (lines 82–94) talks about the Source field's allowed origins, not about whether §B may have multiple Canonical blocks.

The deviation is **defensible** (MMA's framing genuinely has two complementary canonical descriptions — a prose-LaTeX definition and a code-derived enumeration formula — and conflating them into a single block would obscure either the textual source or the implementation specificity). But it is **not yet authorised by the schema doc or explicitly flagged by the entry**.

**MINOR EDIT REQUESTED**: either (a) extend the schema doc's §B description to explicitly allow multiple `**Canonical (description):**` blocks when an external source has multiple canonical representations, or (b) add one sentence to `def:mobile-Fock` saying "Schema note: §B entries may have multiple `**Canonical (…)**` blocks when the external source's definition straddles prose and code; both are quoted here per `stocktake/reports/opus-hilbert-bridge.md` §1.3."

I prefer (a) — the schema doc is the right place for schema authorisation. (b) is a localised band-aid.

### 8. Slug-of-convenience disclosure

Compared `def:mobile-Fock`'s disclosure to the prior pattern set by `conv:unitary-default`:

**`conv:unitary-default` (lines 220–224):**
> **Source:** `summary.tex:137` (NB: this `\begin{convention}` has **no `\label{...}`** in the source; the slug `conv:unitary-default` is assigned here in GLOSSARY for cross-reference only and is **not** a citable label in `summary.tex` itself.)

**`def:mobile-Fock` (lines 1607–1615):**
> **Source:** `stocktake/reports/opus-hilbert-bridge.md:108-138` … **The slug `def:mobile-Fock` is GLOSSARY-internal; it is not the literal `\label` of any LaTeX environment in the MMA source.**

The two disclosures are **consistent in intent**: both clearly say "this slug is GLOSSARY-internal, not a citable label in the external source." Tone is similar. `def:mobile-Fock`'s rendering is slightly bolder (`**…**`) but no less clear. **PASS.**

(Minor stylistic observation: `conv:unitary-default` puts the disclosure inside parentheses appended to the Source field's line-number; `def:mobile-Fock` puts it as the final sentence of a multi-sentence Source field. Either pattern is fine. Not flagging.)

### 9. Misleading-to-future-agent (global)

I read the new entry top-to-bottom imagining a future agent landing in P1.5, P1.6, or P8.1 with only this entry to go on. Three concerns surface:

**(a) The "verbatim from bridge report §1.3 lines 134-136" claim** (area 2) is misleading. A future agent who trusts the verbatim label might patch a typo in the GLOSSARY into the bridge report (or vice versa), or might cite the GLOSSARY's numbered list as if it were the bridge report's original prose. **MINOR EDIT REQUESTED — already raised in area 2.**

**(b) The "bridge report §2.4 line 253" reference** (area 3) is misleading because §2.4 does not exist. A future agent who tries to read §2.4 will be confused. The line number (253) is correct; the section label (§2.4) is not. **MINOR EDIT REQUESTED — already raised in area 3.**

**(c) The partition-vs-mobile-Fock relationship characterisation in `def:HP` Notes** (area 5 caveat) uses "particle number $N$" in MMA's local convention while the entry's own Translation map forward-points to P1.6(g) which is the convention that disambiguates this exact term. A future agent reading `def:HP` Notes before reading the (not-yet-written) P1.6(g) CONVENTIONS entry might internalise the wrong convention. **MINOR EDIT POSSIBLE — already raised in area 5.**

**No load-bearing misrepresentation found.** The substantive claims (LB-1 caveat, N=0 boundary, four-way Hilbert-space relationship, cross-link integrity, schema split) are accurate. The errors are all in *citations* (line ranges, section labels, "verbatim" claims) rather than in *mathematical content* — which is the right kind of error to find (easy to fix; doesn't poison downstream content).

The author has explicitly disclosed the slug-of-convenience nature of `def:mobile-Fock`, has honestly stated "Declared the partition formulation [[def:HP]] as canonical (already so from P1.1; re-affirmed)", and has stubbed translation-map fields rather than fabricating them — all signs of the same discipline visible in the P1.1 and P1.2 commits.

---

## Verdict

**APPROVE WITH MINOR EDITS.** The entry passes the substantive checks:

| Check | Verdict |
|---|---|
| 1. Bridge-report fidelity (Canonical blocks) | PASS for block 1 (7/7 byte-identical); MINOR for block 2 (one-char trailing-period drop) |
| 2. Convention-dependency citation accuracy | CONTENT PASS (all 6 items + all P1.6 forward-pointers accurate); CITATION MINOR ("verbatim … lines 134-136" both wrong) |
| 3. N=0 boundary claim | CONTENT PASS (substantive claims correct, verified against bridge:253 and summary.tex:374-382); CITATION MINOR (§2.4 does not exist) |
| 4. LB-1 caveat accuracy | PASS (line range 263–269 correct; bd ticket exists; content matches bridge:265) |
| 5. Cross-link updates | PASS for `def:Hlatt` and `def:indlim`; PASS for `def:HP` (also silently corrects a prior P1.1 conflation of mobile-Fock with indlim); MINOR-POSSIBLE caveat on `def:HP` "particle number $N$" phrasing |
| 6. Status block accuracy | PASS (all claims verified against file state and migration plan) |
| 7. Schema deviation (two Canonical blocks) | PASS (deviation is defensible) but MINOR (not authorised by schema doc; not explicitly flagged by entry) |
| 8. Slug-of-convenience disclosure | PASS (consistent with `conv:unitary-default` pattern) |
| 9. Misleading-to-future-agent | PASS at the load-bearing level; three citation/phrasing nits noted under areas 2/3/5 |

The mathematical content of the entry is correct and the structural decisions (canonical = partition, mobile-Fock in §B, slug-of-convenience disclosed, translation map stubbed for P1.5) are sound. The errors are concentrated in **citation accuracy** (line ranges, section labels, "verbatim" claims) and are easily fixable without touching mathematical content.

## Minor edits requested

These are quality-of-life, not correctness-of-content. None blocks the commit.

1. **`GLOSSARY.md:1601` (second Canonical block, pseudocode for `H_MMA(L)`):** the last line drops the trailing period that bridge:129 has. Either append the `.` to match bridge verbatim, or soften the framing ("synthesised" already softens this; minor).

2. **`GLOSSARY.md:1635-1636` (Convention dependencies header):** change "verbatim from bridge report §1.3 lines 134-136" to "adapted from bridge report §1.3 line 136 (with added forward-pointers and GLOSSARY cross-links)". The current claim is both wrong about the line range (134-136 should be 136) and wrong about "verbatim" (the list is paraphrased, restructured into numbered items, and augmented with forward-pointers + cross-links not in the bridge report).

3. **`GLOSSARY.md:1664` (N=0 boundary section reference):** change "bridge report §2.4 line 253" to "bridge report §3 ('Edge cases checked', first bullet), line 253". Bridge §2.4 does not exist; the N=0 content lives in §3.

4. **`GLOSSARY.md:62-94` (schema doc) OR `GLOSSARY.md:1583` (def:mobile-Fock):** extend the schema doc's §B description to explicitly allow multiple `**Canonical (description):**` blocks when an external source's definition straddles prose and code. Or add one sentence to `def:mobile-Fock` flagging the deviation. Preference: the schema-doc extension (longer-term clarity for future §B entries).

5. **`GLOSSARY.md:491-495` (def:HP Notes, mobile-Fock characterisation):** the phrase "direct sum over particle number $N$" uses `N` in MMA's local convention, while the entry's own translation-map forward-points to P1.6(g), which is the disambiguation that locks `N`'s meaning. Re-phrase as "direct sum over partition size $0 \le |P| \le L$" (or wait until P1.5 writes the explicit map). **Optional** — can be folded into P1.5.

6. **Carry-forward (from P1.1 review):** the two P1.1 minor edits not addressed in this commit — `def:KS-Ln` Notes line-number nit (P1.1 review item #1) and `def:Q` vacuum-index callout (P1.1 review item #3) — remain outstanding. Not a P1.3 blocker; consider folding into P1.5 or filing as a `bd` issue if they fall out of immediate scope.

## Recommended commit-message `Review:` line

```
Review: Opus 4.7 subagent, APPROVE WITH MINOR EDITS — Canonical block 1
(LaTeX quote) verified byte-identical to bridge report §1.3; D-gate replay
of all 48 §A entries passes after edits; cross-link updates accurate and
def:HP silently corrects a prior P1.1 conflation of mobile-Fock with
def:indlim. Minor edits: (a) trailing period dropped from second
Canonical block; (b) "verbatim from bridge report §1.3 lines 134-136" is
both line-range-wrong and not-actually-verbatim; (c) §2.4 reference for
N=0 boundary does not exist (content is at §3, line 253 — line is right);
(d) schema doc does not authorise two Canonical blocks for §B entries.
Full report: stocktake/reports/opus-glossary-p1.3-review.md.
```
