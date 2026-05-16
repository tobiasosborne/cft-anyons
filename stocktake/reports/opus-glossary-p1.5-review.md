# Opus review — P1.5 GLOSSARY: translation-map population in `def:Hlatt`, `def:HP`, `def:indlim`, `def:mobile-Fock`

**Reviewer:** Opus 4.7 subagent (general-purpose, hostile-review role per Rule 4)
**Date:** 2026-05-16
**Files reviewed:** `GLOSSARY.md` (working-tree, +136/-25 lines vs HEAD; four entries' Translation-map fields populated, plus minimal Notes-field touch-up on `def:Hlatt`)
**Companion files (read-only):** `stocktake/reports/opus-hilbert-bridge.md`, `stocktake/reports/opus-glossary-p1.3-review.md`, `stocktake/MIGRATION_PLAN.md`
**Decision:** **APPROVE WITH MINOR EDITS**

---

## Per-area findings

### 1. Bridge-report fidelity of the maps

#### 1a. `def:Hlatt` MMA bullet → bridge §2.2

The headline claim `H_MMA(L) ≅ ⊕_{W} ⊕_{N=0}^L H_N^W` matches **bridge line 215** verbatim. The "index match $c$ (MMA) $\leftrightarrow W$ (summary)" matches **bridge line 218**. The `N \to \mathrm{MF}` bullet faithfully restates bridge:195-203 (the reindexing of a label sequence into positions + non-vacuum labels, with the "tensoring with 1 is the identity functor" collapse). The `\mathrm{MF} \to N` bullet matches bridge:220-222 (length-$L$ label sequence reconstruction + `fusion_tree` as coordinate). The "MMA's `enumerate_fusion_trees` already iterates only over the non-vacuum labels, which is the inverse of vacuum absorption" claim matches **bridge:224** verbatim. The "Neither is 'more general'" claim matches **bridge:228** verbatim. PASS.

**Spot-check on bridge §2.2 line range (181-230).** Bridge §2.2 starts at line 181 (heading) and ends at line 230 (the Convention requirements paragraph), with §2.3 starting at line 232. The cited range 181-230 is exactly correct. PASS.

#### 1b. `def:HP` MMA bullet → bridge §2.3

The "Partition $\to$ MF" bullet matches bridge:236 (set `A_I = Q_full` on every cell, take `|P| = L`, sum over W, absorb vacuum legs). The "MF $\to$ partition" bullet matches bridge:236 (decompose `H_MMA(L)` by total charge `c`). The "Partition is strictly more general for two reasons" matches bridge:236 verbatim:
- (i) per-cell `A_I` → bridge:236 ("Partition is strictly more general than MMA because it allows per-cell `A_I`").
- (ii) `W` as superselection → bridge:236 ("Partition is also more general because it summands over `W` separately (charge sectors are superselection), whereas MMA's `H_MMA(L)` includes the direct sum over all `c`").

The entry adds a cross-reference to "Remark `rem:Q-choices`(4) at `summary.tex:233-236`" for the blocked / coarse-grained motivation — this is additional information not in bridge:236 but is itself sourced (and the summary.tex line reference is in scope of the P1.5 task).

**Spot-check on bridge §2.3 line range (232-238).** Bridge §2.3 starts at line 232 (heading) and ends at line 238 (Convention requirements). The cited range 232-238 is exactly correct. PASS.

#### 1c. `def:indlim` MMA bullet — "discrete fixed-$L$ analogue, not equivalent"

The cardinality citation at "bridge report §1.3 line 138" matches: bridge:138 is the `H_MMA(L)` cardinality formula. ✓

The headline verdict "discrete fixed-$L$ analogue, not equivalent" is a *sound inference* but not a verbatim bridge statement:

- Bridge §6 (line 345) declares the partition formulation canonical and "strictly most general of the three" — but does not directly compare `def:indlim` to mobile-Fock.
- Bridge §1.3 (line 138) shows mobile-Fock is finite-dimensional for fixed `L`.
- `def:indlim`'s own canonical (`summary.tex:427`) defines it as the Hilbert completion of an infinite direct limit (`Hh_\infty^W = \overline{\varinjlim_P Hh_P^W}`).

A finite-dimensional space cannot be isomorphic to a Hilbert completion of an infinite direct limit, so "not equivalent" follows directly. The entry then constructs the half-bijection ("MMA $\to$ inductive limit" embeds as the $|P| = L$ slice; "Inductive limit $\to$ MMA" has no canonical inverse), which is exactly the right structural statement. PASS.

**Minor stylistic observation (not edit-requested):** the verdict word "not equivalent" is slightly stronger than necessary — the entry already says "no canonical inverse" in the "Inductive limit $\to$ MMA" sub-bullet, which is more precise. A future agent might read the headline "not equivalent" and conclude that the half-direction "MMA $\to$ inductive limit" is also blocked, but the entry then provides exactly that map. The "not equivalent" claim is correct for the *full* bijection question; the half-direction works.

#### 1d. `def:mobile-Fock` Translation-map (partition + N-tensor) — round-trip directions

The directions are inverted correctly:
- `def:HP` says "Partition $\to$ MF: take $|P| = L$ ... sum over $W$ ... absorb vacuum legs" ↔ `def:mobile-Fock` says "MF $\to$ partition: pick any partition $P$ with $|P| = L$ ... decompose $H_{\mathrm{MMA}}(L)$ by total charge $c$ to recover $\bigoplus_W \Hh_P^W$."
- `def:HP` says "MF $\to$ partition: pick any partition $P$ ... decompose by total charge $c$" ↔ `def:mobile-Fock` says "Partition $\to$ MF: take $|P| = L$, set $A_I = Q_{\mathrm{full}}$, sum over $W$, absorb vacuum legs."

Round-trip is consistent. The "pick any partition" wording in both entries faithfully captures bridge §2.1 line 175's observation that the N → P direction is not strict ("any partition with `|P'| = |P|` works"); this is the same non-uniqueness that the entries explicitly note ("cell lengths arbitrary"). It is NOT silently misclaimed as a strict bijection. PASS.

### 2. Round-trip / composition consistency

Bridge §2.2 line 226: "N → MF → N sends a basis element to itself. MF → N → MF is the identity by the same reasoning. Both directions are bijective on basis elements once the conventions are aligned."

`def:Hlatt` and `def:mobile-Fock` both characterise N-tensor ↔ MF as "Equivalent" / "Neither is more general", which is consistent with bridge:226+228. Neither entry overstates strictness — both flag the "conventions required" caveat (vacuum-index, hard-core, left-associated, multiplicity-free).

`def:HP` and `def:mobile-Fock` both characterise Partition ↔ MF as MF being a "special case" of Partition with `A_I = Q_full` etc.; the inverse direction (P → MF) requires the convention choices to align. The "pick any partition" wording in both correctly admits the cell-length forgetting in the MF → P direction. PASS.

### 3. Convention-list completeness

#### 3a. `def:Hlatt` vs bridge §2.2 line 230

Bridge:230 lists: vacuum-index; F-matrix gauge; hard-core. The entry's list:
1. vacuum at index 1 [P1.6(a)] ✓
2. hard-core (automatic — a site is either vacuum or one simple) ✓ (with the bridge:230 justification "is automatic if you only count non-vacuum labels")
3. left-associated fusion-tree basis [P1.6(i)] ✓
4. multiplicity-free assumption [P1.6(d)] ✓

**Gap noticed:** The entry **omits F-matrix gauge** from the conventions list. Bridge:230 explicitly lists it ("F-matrix gauge (MMA involutory, summary unitary — conversion is well-defined; the bijection on basis elements is gauge-independent because we're not yet computing anything that depends on F-symbol entries)"). The bridge's *own* caveat justifies omission for the *basis-element bijection*; but the bridge nonetheless names F-matrix gauge as a "convention requirement" for the pairing.

`def:mobile-Fock` Translation map handles this differently and correctly: it lists "F-matrix gauge translation [P1.6(b)] (relevant for any computation that uses F-symbol entry values; not relevant for the basis-element bijection itself, which is gauge-independent)" — explicit, with caveat.

The two entries diverge on whether to mention F-matrix gauge in the conventions list for the N-tensor ↔ MF pairing. The asymmetry is mild but is the kind of drift that should be levelled.

**MINOR EDIT REQUESTED:** Add to `def:Hlatt`'s Conventions list a fifth bullet: "F-matrix gauge translation [P1.6(b)] (relevant for any computation using F-symbol entry values, not for the basis-element bijection itself)." This mirrors the wording in `def:mobile-Fock` and harmonises the two entries' treatment of the same pairing.

#### 3b. `def:HP` vs bridge §2.3 line 238

Bridge:238 lists: vacuum-index alignment; multiplicity-free assumption; fusion-tree basis ordering (left-associated).

`def:HP`'s list: vacuum at index 1 [P1.6(a)]; left-associated [P1.6(i)]; multiplicity-free [P1.6(d)]; plus $Q = Q_{\mathrm{full}}$ uniform across cells [P1.6(h)].

The Q_full requirement is implicit in bridge:236 ("Partition is strictly more general than MMA because it allows per-cell `A_I`, while MMA bakes in `A_I = Q_full`"). The entry correctly surfaces this as a P1.6(h) forward-pointer. PASS — convention list matches bridge:238 + the inferred Q_full requirement.

#### 3c. `def:mobile-Fock` Conventions list

Lists: vacuum at index 1 [P1.6(a)]; left-associated [P1.6(i)]; multiplicity-free [P1.6(d)]; choice $Q = Q_{\mathrm{full}}$ [P1.6(h)]; F-matrix gauge translation [P1.6(b)] (with caveat). All P1.6 sub-item letters match the migration plan's lettering (verified against `MIGRATION_PLAN.md:130`). PASS.

### 4. Worked-example citation accuracy

**§5 line ranges** (verified via grep `^### ` against the bridge report):
- §5 header: line 291.
- §5.1: starts line 295, ends line 316 (just before §5.2).
- §5.2: starts line 317, ends line 325 (the closing paragraph about the bijection).
- §5.3: starts line 327, ends line 339 (the `**Result:**` paragraph), with `---` at 340.

The entries' citations:
- `def:Hlatt` cites "bridge report §5.1–§5.3 (`opus-hilbert-bridge.md:291-339`)" → range covers §5 header (291) through end of §5.3 (339). ✓
- `def:HP` cites "bridge report §5.1–§5.2 (`opus-hilbert-bridge.md:291-325`)" → covers §5 header through end of §5.2 (325). ✓
- `def:mobile-Fock` cites "bridge report §5.1–§5.3 (`opus-hilbert-bridge.md:291-339`)" → same as `def:Hlatt`. ✓

**`dim = 3` claim.** Bridge §1.4 line 148 explicitly states `H_P^τ = 0+1+1+1 = 3` for Fibonacci `L=2`. Both `def:Hlatt`'s "Fibonacci $\Hh_2^\tau$ has $\dim = 3$" and `def:HP`'s "Fibonacci $\Hh_P^\tau$ with $|P| = 2$ and $A_I = Q_{\mathrm{full}} = \one \oplus \tau$ has $\dim = 3$" match. ✓ PASS.

**Minor stylistic observation (not edit-requested):** `def:HP` cites only §5.1–§5.2 because §5.3 is about `H_3^τ` (a different example used for the F-symbol cross-check, not the worked dim=3 bijection). `def:Hlatt` and `def:mobile-Fock` cite §5.1–§5.3 because §5.3's F-symbol consistency argument is relevant cross-formulation. Both framings are defensible; the slight asymmetry is harmless because the *line range* in each case correctly demarcates what's being claimed.

### 5. Internal consistency between the four entries

**Index match (c MMA ↔ W summary):**
- `def:Hlatt`: "with index match $c$ (MMA) $\leftrightarrow W$ (summary)" ✓
- `def:mobile-Fock`: "with index match $c$ (MMA) $\leftrightarrow W$ (summary)" ✓

Both worded identically. PASS.

**Partition strictly more general, two reasons:**
- `def:HP`: "(i) per-cell $A_I$ are allowed ... (ii) total charge $W$ is treated as a superselection label, not summed."
- `def:mobile-Fock`: "partition formulation is strictly more general (allows per-cell $A_I$ and treats total charge $W$ as a superselection label rather than summing over it)."

Both list the same two reasons in the same order. PASS.

**N-tensor ↔ MF "neither more general":**
- `def:Hlatt`: "Neither is 'more general': the two are identifications of the same Hom-space under different geometric framings."
- `def:mobile-Fock`: "Equivalent (bijective on basis elements; neither is more general — they are identifications of the same Hom-space under different geometric framings)."

Identical content, slightly different wording. PASS.

**No drift detected across the four entries on the substantive verdicts.** The asymmetry in the F-matrix gauge mention (area 3a) is the only flag.

### 6. Notes-field touch-up on `def:Hlatt`

Diff for `def:Hlatt` Notes (lines 427-432):
- Removed: "Mobile-Fock [[def:mobile-Fock]] differs from this entry by additionally summing over particle number $N$ and total charge $c$ (not held as superselection labels) — see the bridge report §2.2."
- Added: "The continuum analytical closure is [[def:indlim]]."

The removed sentence's content is now present in the Translation map (the `\to$ MF` direction explicitly says `H_{\mathrm{MMA}}(L) \cong \bigoplus_{W} \bigoplus_{N=0}^L \Hh_N^W` — i.e., sums over both W and N). The added sentence about continuum closure is a forward-pointer to `def:indlim`, which makes the four-way reconciliation visible from `def:Hlatt`'s Notes.

The Notes field reads coherently. No orphaned references, no broken pronouns:
- Sentence 1: "Equivalent to [[def:HP]] when all $A_I = Q$ ..." — stand-alone.
- Sentence 2: "The three discrete Hilbert-space framings (this one, [[def:HP]], and MMA's mobile-Fock [[def:mobile-Fock]]) all reconcile per `stocktake/reports/opus-hilbert-bridge.md`; the partition formulation [[def:HP]] is declared canonical." — stand-alone.
- Sentence 3: "The continuum analytical closure is [[def:indlim]]." — stand-alone.

The previously prior-review-flagged P1.1 minor edit "def:HP Notes 'particle number $N$' phrasing" (P1.3 review minor edit 5) was addressed by the P1.3 commit; the new wording in `def:HP` Notes is at lines 549-558 and uses "$|P|$" (partition size) instead of "$N$" with an explicit parenthetical justification. ✓ PASS.

### 7. Bridge line citations spot-check

Verified the following bridge line references in the new content:
- bridge §2.2 lines 181–230: 181 = "### 2.2 N-tensor ↔ Mobile-Fock"; 230 = the Convention requirements paragraph (last line of §2.2 before §2.3 starts at 232). ✓
- bridge §2.3 lines 232–238: 232 = "### 2.3 Partition ↔ Mobile-Fock"; 238 = Convention requirements paragraph (last line before `---` separator at 240). ✓
- bridge §1.3 line 138: cardinality formula `dim H_MMA(L) = Σ_{N=0}^{L} Σ_{c ∈ Irr(C)} C(L,N) · ...`. ✓
- bridge §3 line 253: N=0 boundary edge case bullet. (Note: this is in `def:mobile-Fock` and was previously corrected in P1.3 from §2.4 → §3.) ✓
- bridge §3.5 lines 263–269: LB-1 caveat section. ✓ (Carried from P1.3.)

All line citations resolve. No drift detected.

### 8. Global misleading-to-future-agent assessment

Reading the four entries top-to-bottom imagining a future agent landing in P1.6, P1.7, P1.8, P5.6, or P8.1:

**(a) Convention-list asymmetry on F-matrix gauge** (area 3a) — `def:Hlatt` omits F-matrix gauge from its N-tensor ↔ MF convention list, while `def:mobile-Fock` lists it. A future agent reading `def:Hlatt` first might internalise an incomplete convention set, missing that F-matrix gauge IS a *named* convention for this pairing (even though it's gauge-independent at the basis-element level). **MINOR EDIT REQUESTED — already raised in area 3a.**

**(b) "Not equivalent" framing in `def:indlim`** (area 1c) — the headline word "not equivalent" is correct at the bijection-of-Hilbert-spaces level (a finite-dim space cannot be isomorphic to a Hilbert completion of an infinite direct limit), but a future agent might miss that the half-direction "MMA $\to$ inductive limit" IS well-defined (as the $|P| = L$ slice embedding). The entry's sub-bullets do then give exactly that map. **Not edit-requested** — the entry is internally complete; the headline is just slightly stronger than needed.

**(c) "Pick any partition" non-uniqueness** (area 1d) — both `def:HP` and `def:mobile-Fock` use the wording "pick any partition $P$" / "cell-length geometry is arbitrary" / "cell lengths arbitrary — they are not relevant for the Hilbert space itself" to faithfully capture bridge §2.1 line 175's "any partition with `|P'| = |P|` works". A careful reader will catch this; a careless reader might think the inverse map is a strict bijection. The entry does NOT make any false strictness claim — the wording is honest. No edit requested.

**No load-bearing misrepresentation.** The substantive content (translation maps, conventions, worked examples, F-matrix consistency claims) is accurate against the bridge report. The one minor citation/wording asymmetry (area 3a) is in the convention-list completeness and is easily fixed.

### 9. Carry-forward from prior reviews

**From P1.3 review:**
1. ✓ Trailing period drop in second Canonical block — FIXED in P1.5 (line 1685 ends with `ℂ.`).
2. ✓ "Verbatim from bridge report §1.3 lines 134-136" wording — FIXED in P1.5 (rewritten to "adapted from bridge report §1.3 line 136 ... not a verbatim quote", lines 1756-1759).
3. ✓ §2.4 reference for N=0 boundary — FIXED in P1.5 (rewritten to "bridge report §3 ('Edge cases checked', first bullet), line 253", line 1786).
4. ✓ Schema doc not authorising two Canonical blocks — FIXED in P1.5 (schema doc extended at lines 94-98 to explicitly authorise "Schema variant for §B").
5. ✓ `def:HP` Notes "particle number $N$" phrasing — FIXED in P1.5 (rewritten to "$|P|$" partition size, with explicit parenthetical at lines 554-558).

**From P1.1 review (still outstanding per P1.3 review observation):**
- `def:KS-Ln` line-number nit (P1.1 review item #1).
- `def:Q` vacuum-index callout (P1.1 review item #3).

These remain outstanding. Not a P1.5 blocker but worth folding into P1.6 (which will lock the vacuum-index convention) or a separate cleanup bd ticket.

---

## Verdict

**APPROVE WITH MINOR EDITS.** The four translation-map populations pass the substantive checks:

| Check | Verdict |
|---|---|
| 1a. `def:Hlatt` MMA bullet → bridge §2.2 | PASS (headline claim, index match, both directions, "neither more general" all verbatim) |
| 1b. `def:HP` MMA bullet → bridge §2.3 | PASS (both directions, two strict-generality reasons match bridge:236) |
| 1c. `def:indlim` MMA bullet → §1.3+§6 inference | PASS ("not equivalent" verdict is sound; half-direction map correctly provided) |
| 1d. `def:mobile-Fock` partition + N-tensor bullets | PASS (round-trip directions inverted correctly; non-uniqueness wording faithful) |
| 2. Round-trip / composition consistency | PASS (no entry overstates strict bijectivity) |
| 3a. `def:Hlatt` Conventions vs bridge:230 | MINOR (F-matrix gauge omitted; `def:mobile-Fock` correctly mentions it) |
| 3b. `def:HP` Conventions vs bridge:238 | PASS (matches bridge:238 + correctly inferred Q_full requirement) |
| 3c. `def:mobile-Fock` Conventions | PASS (all P1.6 sub-item forward-pointers correct) |
| 4. Worked-example citations | PASS (§5 line ranges accurate; dim=3 claim verified against bridge:148) |
| 5. Internal consistency between entries | PASS (no drift on substantive verdicts) |
| 6. `def:Hlatt` Notes-field touch-up | PASS (reads coherently after the removal) |
| 7. Bridge line citation spot-check | PASS (all line references resolve) |
| 8. Misleading-to-future-agent | PASS at the load-bearing level; one MINOR (area 3a) |
| 9. P1.3 carry-forward minor edits | All 5 ADDRESSED |

The mathematical content of all four translation maps is correct, internally consistent, and faithful to the bridge report. The single MINOR edit request is a wording-harmonisation (add F-matrix gauge to `def:Hlatt`'s conventions list, mirroring `def:mobile-Fock`'s treatment).

## Minor edit requested

1. **`GLOSSARY.md:416-420` (`def:Hlatt` Conventions required, N-tensor ↔ MF bullet):** Add a fifth bullet: "**F-matrix gauge translation** [P1.6(b)] (relevant for any computation using F-symbol entry values, not for the basis-element bijection itself, which is gauge-independent)." This mirrors the wording in `def:mobile-Fock`'s Conventions list at lines 1743-1746 and harmonises the two entries' treatment of the same pairing. Bridge:230 explicitly names F-matrix gauge as a convention requirement for this pairing (with the gauge-independence caveat).

## Recommended commit-message `Review:` line

```
Review: Opus 4.7 subagent, APPROVE WITH MINOR EDITS — translation maps
in all four entries verified against bridge report §2.2 (181-230),
§2.3 (232-238), §1.3:138, §5.1-§5.3 (291-339). All P1.6 forward-pointers
match MIGRATION_PLAN.md:130 lettering. Round-trip directions inverted
correctly between def:HP and def:mobile-Fock. No strict-bijection
over-claims; "pick any partition" non-uniqueness faithfully captured.
Internal consistency across four entries verified on: index match,
two strict-generality reasons, "neither more general" for N↔MF, dim=3.
Cross-link integrity: 41 referenced slugs, 49 defined, 0 missing. All
5 P1.3 minor edits addressed. Notes-field touch-up on def:Hlatt reads
coherently. Minor edit: def:Hlatt Conventions list omits F-matrix gauge
that bridge:230 names (and def:mobile-Fock correctly mentions with the
gauge-independence caveat) — request fifth bullet for symmetry. Full
report: stocktake/reports/opus-glossary-p1.5-review.md.
```
