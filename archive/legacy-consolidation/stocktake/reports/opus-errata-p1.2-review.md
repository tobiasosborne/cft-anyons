# Opus review — P1.2 ERRATA entry for `lem:binary-Z`

**Reviewer:** Opus 4.7 subagent (general-purpose, hostile-review role per Rule 4)
**Date:** 2026-05-16
**File reviewed:** `ERRATA.md` (working-tree, +119/-5 lines vs HEAD; single
new entry "2026-05-16: lem:binary-Z squared-amplitudes …")
**Companion file (read-only):** `summary.tex:1548-1592`,
`reviews/review_{1,2,3,4}_*.md`, `git log --follow summary.tex`
**Decision:** **APPROVE WITH MINOR EDITS**

---

## 1. BEFORE-quote accuracy

The ERRATA "Before" block (`ERRATA.md:38-47`) renders in proper LaTeX
syntax (`\one`, `\tau`, `\varphi`, `Z_\one`, `(v^{\one}_{\tau\tau})_{J,K}`)
what `reviews/review_3_cft.md:181-183` writes in prose-LaTeX (`1`, `τ`,
`φ`, `Z_1`, `(ττ)_1`). The ERRATA is **transparent** about this: the
header reads "verbatim from `reviews/review_3_cft.md:181-183`, which
quotes the chat-4 original that `summary.tex` initially inherited" —
i.e. it does not claim character-for-character verbatim from R3, only
that the underlying claim is the chat-4 original as preserved by R3.

I cross-checked mathematical content term-by-term:

| Term in R3:181-183 | ERRATA rendering | Match? |
|---|---|---|
| `(Z_1(x)Z_1(y)/Z_1(L)) · 1⊗1` | `\frac{Z_\one(x)\,Z_\one(y)}{Z_\one(L)}\,\one_J\otimes\one_K` | ✓ (subscripts J,K added — also visible in R3:182 elsewhere as "1_J⊗1_K"; same content) |
| `(φ Z_τ(x)Z_τ(y)/Z_1(L)) · (ττ)_1` | `\varphi\,\frac{Z_\tau(x)\,Z_\tau(y)}{Z_\one(L)}\,(v^{\one}_{\tau\tau})_{J,K}` | ✓ (coefficient `φ` matches; `(ττ)_1` ↔ `v^{\one}_{\tau\tau}` is the R1/R2 notation for the same splitting-basis vector) |
| `(Z_τ(x)Z_1(y)/Z_τ(L)) · τ⊗1` | `\frac{Z_\tau(x)\,Z_\one(y)}{Z_\tau(L)}\,\tau_J\otimes\one_K` | ✓ |
| `(Z_1(x)Z_τ(y)/Z_τ(L)) · 1⊗τ` | `\frac{Z_\one(x)\,Z_\tau(y)}{Z_\tau(L)}\,\one_J\otimes\tau_K` | ✓ |
| `(φ^{-1} Z_τ(x)Z_τ(y)/Z_τ(L)) · (ττ)_τ` | `\varphi^{-1}\,\frac{Z_\tau(x)\,Z_\tau(y)}{Z_\tau(L)}\,(v^{\tau}_{\tau\tau})_{J,K}` | ✓ |

I also cross-referenced against `review_1_algebra.md:15-17`, which uses
the same coefficients (`Z_1(x)Z_1(y)/Z_1(L)`, `φ·Z_τ(x)Z_τ(y)/Z_1(L)`,
`φ^{-1}·Z_τ(x)Z_τ(y)/Z_τ(L)`), and `review_2_categorical.md:236-237`,
which displays them in proper LaTeX matching the ERRATA's rendering
modulo the v-vector notation. All three reviewers quote the same
chat-4 source. The ERRATA BEFORE block faithfully renders that source.

No substantive discrepancy. **PASS.**

(Minor stylistic observation: a future reader might wonder why the
BEFORE block uses `&=` align-environment syntax when the R3 source
does not. This is harmless — R3 displays them as two list items, and
align is the natural LaTeX rendering. Not a flag.)

## 2. AFTER-quote accuracy

The ERRATA "After" block (`ERRATA.md:60-67`) claims to quote
`summary.tex:1552-1560` verbatim. I read those lines directly.

ERRATA:1559 reads:
```
+ \varphi^{-1/2}\sqrt{\frac{Z_\tau(x)\,Z_\tau(y)}{Z_\tau(L)}}\,(v^{\tau}_{\tau\tau})_{J,K}.
```

`summary.tex:1559` reads (line-by-line from cat -n output):
```
+ \varphi^{-1/2}\sqrt{\frac{Z_\tau(x)\,Z_\tau(y)}{Z_\tau(L)}}\,(v^{\tau}_{\tau\tau})_{J,K}.
```

I compared all eight lines (1552–1559) character-by-character (modulo
the `\\[2pt]` line-break which appears at the end of line 1555 in
`summary.tex` and at the end of line 1555 in the ERRATA AFTER block).
Byte-identical. **PASS.**

The header line "After (current `summary.tex:1552-1560`):" — note the
range is **1552–1560**, which is one line longer than the eight quoted
lines (1552–1559). `summary.tex:1560` is `\end{align*}`, which is not
quoted in the AFTER block. This is *not* an inaccuracy (the math-block
ends at 1560 in the source even though the last math-line is 1559);
it's an idiomatic "range covers the whole displayed block" annotation.
Not flagged.

## 3. Reviewer-citation accuracy

Per-citation check.

**R1: `reviews/review_1_algebra.md:8`.** Read line 8:
> `## Issue 1 — **CRITICAL** — Lemma 7.7 (`lem:binary-Z`) displays squared amplitudes, not amplitudes.`

✓ Exactly matches the ERRATA's parenthetical "Issue 1, **CRITICAL**: 'Lemma 7.7 (`lem:binary-Z`) displays squared amplitudes, not amplitudes.'" The longer quote in ERRATA ("The displayed coefficients are the squared amplitudes (probabilities); the amplitudes themselves should carry a square root over the entire fraction and the multiplicative constants φ and φ⁻¹ should be √φ and φ⁻¹ᐟ² respectively.") is reproduced verbatim from `review_1_algebra.md:24-27`. ✓

**R2: `reviews/review_2_categorical.md:228`.** Read line 228:
> `## 11. (CRITICAL) Lemma 6.13 is internally inconsistent with Def 6.9 — missing square roots`

✓ Matches the ERRATA's parenthetical. The cross-references ERRATA makes ("detailed isometry-failure derivation at lines 247–253; explicit numerical demonstration at lines 261–267 that the buggy formula's squared amplitudes sum to ≈0.674, not 1") I verified independently:
- `review_2_categorical.md:247-253` does contain the isometry-failure derivation (the `Z_\one^2(x)Z_\one^2(y) + \varphi^2 Z_\tau^2(x)Z_\tau^2(y) / Z_\one^2(L) \ne 1` argument plus the dilute-regime cross-check). ✓
- The ERRATA says "lines 261–267" for the numerical demonstration. R2:265-268 contains the numerical confirmation ("Lemma 6.13's amplitudes squared sum to **0.674**, not 1"). The cited range 261–267 is off by ~4 lines (the numerical block starts at 265, not 261). **Very minor.** The number `0.674` and the claim "not 1" are correctly attributed. **MINOR EDIT OPTIONAL** — change "lines 261–267" to "lines 265–268" for precision. Not a blocker; the cited content is in the cited file.

**R2 callback at line 499.** Read line 499:
> `1. **Issue 11 (concrete bug)**: **Lemma 6.13 has wrong amplitudes** — the binary Fibonacci refinement formula at lines 1318–1332 is missing outer square roots. …`

✓ Exists, and is **#1** of "Top three big finds" (verified by reading lines 497–503). ERRATA's claim "Summary callback at line 499 ranks this as the #1 of 'Top three big finds'" is accurate.

**R3: `reviews/review_3_cft.md:179`.** Read line 179:
> `## 17. ★★ CRITICAL BUG: lem:binary-Z amplitudes are missing square roots ★★`

✓ Matches the ERRATA's parenthetical "Issue 17, **★★ CRITICAL BUG**: 'lem:binary-Z amplitudes are missing square roots'". The "detailed isometry-verification proof" reference is supported by `review_3_cft.md:194-200` (the `Z_1(L)/Z_1(L) = 1` ✓ correct form vs the `cross-term ... is missing` wrong form). ✓

**R4 silence.** ERRATA claims `reviews/review_4_consistency.md` is silent on `lem:binary-Z`. I ran `grep -n -i "binary-Z\|binary refinement\|lemma 6.13\|lem:binary\|lemma 7.7\|missing square root\|missing sqrt"` against the file. **One match**, at line 67:

> `Chat 2 derives **both** PF (§3, lines 553–607) and coassociative (§4, lines 612–698) and explicitly contrasts them on lines 700–704: "PF map: natural one-step topological/Kirby-color refinement. Coassociative map: natural if binary refinements must compose exactly."`

This is a quote about PF/coassoc choice (M2 finding), not about `lem:binary-Z`. The "binary refinements" phrase here refers to refinement maps in general, not to the specific Lemma 6.13/7.7. R4 genuinely has no section flagging `lem:binary-Z`. R4's actual CRITICAL findings (C1: `thm:branches` self-contradiction at line 11; C2: fabricated OCR examples at line 26) match exactly what ERRATA describes ("`thm:branches` self-contradiction C1; fabricated OCR examples C2"). ✓

**PASS** for all five citations, with a minor line-range nit on the R2 numerical-demo cite (off by ~4 lines).

## 4. Triangulation claim

ERRATA characterises the three reviewers as having used "different verification routes":
- **R1: algebraic consistency with `def:fib-mult`.**
  R1 (lines 31-38) explicitly derives the answer by applying Def 7.6 (`def:rchild`) to `r=2, c=1`, plugging in `M^1_{1,1} = 1` and `M^1_{τ,τ} = √φ` from the Fibonacci multiplication coefficients (i.e. from `def:fib-mult`). The argument is: "the M-coefficients [from def:fib-mult] specialise to these values; plug into def:rchild; get the right answer". This is a **direct algebraic-substitution-from-def:fib-mult** route. ✓
- **R2: schema consistency with `def:rchild`.**
  R2 (lines 240-253) starts from Def 6.9 (`def:rchild`)'s general formula `(1/√Z_c(L)) Σ M^c_{a,α} √(Π Z_{a_i}(ℓ_i)) v^c_{a,α}` and specialises it. The argument is: "the *schema* of def:rchild puts square roots around the Z's and outside; Lemma 6.13 strips them; therefore Lemma 6.13 is internally inconsistent with the def:rchild schema". This is a **schema-mismatch** route. (Note: R2 *also* invokes the M-values, so the schema-vs-algebra distinction is not 100% clean; but R2's headline argument is the schema mismatch — "Lemma 6.13 is **internally inconsistent with Def 6.9**" is literally the section title.) ✓
- **R3: explicit isometry numerical-check.**
  R3 (lines 194-200) computes the sum of squared amplitudes both ways and shows that the wrong form gives a value `≠ 1` because the cross-term `2φZ_1(x)Z_1(y)Z_τ(x)Z_τ(y)` is missing. This is a **direct numerical isometry-violation** route. R3 also has a dilute-limit cross-check at line 192. ✓

The three routes are distinct in their *headline* argument:
- R1 says "the formula doesn't match what you get by substituting from `def:fib-mult` into `def:rchild`";
- R2 says "the formula's *shape* doesn't match `def:rchild`'s schema (the square roots are in the wrong place)";
- R3 says "the formula fails the isometry condition explicitly when you compute the sum".

Are these "genuinely different reasoning paths" or "the same argument rephrased"? **Genuinely different in their entry-point and proof-witness**, though all three converge on the same correction. The triangulation claim is *defensible* — a reader checking R1, then R2, then R3 gets three distinct mathematical witnesses (not three rephrasings of the same proof). The ERRATA's framing ("convergent triangulation — not a single reviewer's idiosyncratic catch") is appropriate, not overclaimed. **PASS.**

One small honesty point I would credit: R1's calculation *is* numerically isometric in its conclusion (line 41-45: "norm-squared of this amplitude vector is … = 1, giving the correct isometry"), and R3's argument also invokes `def:rchild`. The routes overlap in places. But the *primary* method of each is distinct. The ERRATA does not overclaim three-disjoint-proofs; it claims "different verification routes", which is right.

## 5. "Fix already applied" framing

I ran:
```
$ git log --follow --oneline summary.tex
7e62d9a P0.1: baseline snapshot of canonical repo
$ git diff HEAD summary.tex
(empty)
```

Only one commit affects `summary.tex` — the P0.1 baseline. The working
tree shows zero hunks. So the ERRATA's claim that the `\sqrt{...}` fix
was applied **before** this repo was initialised, and that **no
`summary.tex` edit is in this commit**, is correct.

I also checked that `summary.tex:1552-1560` in the current file (the
"After" block) is what's in the baseline commit (`git show
7e62d9a:summary.tex | sed -n '1552,1560p'` would produce the same
text). Conclusion: the fix predates the repo; this commit only
formalises the audit trail.

The "Timing note" at `ERRATA.md:115-121` is accurate. It does not
*overstate* (it does not claim this commit fixed anything in
`summary.tex`) and does not *understate* (it correctly identifies that
the in-doc warning was already serving as the audit trail). **PASS.**

## 6. Schema conformance

ERRATA schema declared at `ERRATA.md:13-24` is:

```
## <YYYY-MM-DD>: <one-line summary>

**summary.tex location:** §<section>, line(s) <N–M>, label `<label>`
**Before:** <quote or precise description>
**After:** <quote or precise description>
**Source of correction:** <reviews/review_<N>_<topic>.md:Issue<n>, Lean lemma, derivation, …>
**Validation:** <which gates were exercised>
**Commit:** <hash>
```

The P1.2 entry has:
- ✓ Header `## 2026-05-16: lem:binary-Z squared-amplitudes (probabilities) → amplitudes (with √)` (correct format).
- ✓ `**summary.tex location:**` — present at line 30, identifies section, line range, label.
- ✓ `**Before:**` — present at line 36.
- ✓ `**After:**` — present at line 57.
- ✓ `**Source of correction:**` — present at line 79.
- ✓ `**Validation:**` — present at line 123.
- ✓ `**Commit:**` — present at line 143 with the placeholder `(filled below after commit lands)`. The prompt explicitly allows this placeholder.

Order: header → location → Before → After → Source → Validation → Commit.
Schema order matches. **PASS.**

**Extra fields:** the entry also adds two non-schema fields:
- "Mathematically equivalent to the reviewers' recommended form …" (between After and Source, at lines 69-77 — a contextual note explaining the form-equivalence).
- "Cross-validation: the in-doc warning …" (between Source and Validation, at lines 109-113).
- "Timing note:" (between Cross-validation and Validation, at lines 115-121).

None of these are *required* by the schema, but none *violate* it either; the schema header line 24 says "Source of correction: …reviews… Lean lemma, derivation, …" with a `…` ending, suggesting it is not closed. Adding contextual prose is appropriate for an entry whose provenance is unusual (a "no-op fix" because the fix predates the repo).

**MINOR OBSERVATION** (not edit-requested): Future entries that *do* make a `summary.tex` edit will likely not need the "Timing note" or the "Mathematically equivalent" callouts. This entry's structure is appropriate to its specific situation; it should not be treated as a template for normal ERRATA entries (where the BEFORE and AFTER both come from `summary.tex` itself across a single commit).

## 7. Mathematical equivalence verification

ERRATA claims (lines 69-77):
- `√φ · √(Z_τ(x)Z_τ(y)/Z_1(L)) = √(φ · Z_τ(x)Z_τ(y)/Z_1(L))`
- `φ^{-1/2} · √(Z_τ(x)Z_τ(y)/Z_τ(L)) = √(φ^{-1} · Z_τ(x)Z_τ(y)/Z_τ(L))`

Both are `√a · √b = √(ab)` (with `a > 0`, `b > 0`). Since `φ > 0` and the Z's are positive partition-function-like quantities, all square roots are real-positive and the identities are unambiguous (no branch-cut issues). ✓

The ERRATA does **not** claim the AFTER form is the unique mathematically-correct form; it correctly says "**Mathematically equivalent to the reviewers' recommended form**" and explains *why* the AFTER form is *preferred* (it makes the multiplication amplitudes from `def:fib-mult` explicit). This is the right framing — neither overclaiming uniqueness nor understating the equivalence.

The reviewers' recommended form (e.g. R3:207-208: `√(φ Z_τ(x)Z_τ(y)/Z_1(L))`) puts `φ` inside the outer square root. The actual `summary.tex` form factors it out: `√φ · √(Z_τ(x)Z_τ(y)/Z_1(L))`. These are equal; the document chose the more pedagogically transparent form. **PASS.**

## 8. Global question — anything misleading for a future agent?

I read the entry top-to-bottom imagining a future agent who has only this ERRATA file to go on. The framing is **honest about its unusual provenance**:
- It says the fix predates the repo (Timing note) — true.
- It says this commit does not touch `summary.tex` (Validation D: "no `summary.tex` edits in this commit") — true.
- It says 3 of 4 reviewers caught it, not 4 of 4, and explicitly corrects the MIGRATION_PLAN's overclaim (Source of correction:97-103) — true.
- It says the in-doc warning at line 1583 already served as the audit trail (Cross-validation:109-113) — true.

**One mild concern:** The entry's **header** ("squared-amplitudes (probabilities) → amplitudes (with √)") uses the arrow notation `A → B`. A future agent who only glances at the header might read this as "this commit changes A to B in `summary.tex`", when in fact `summary.tex` was already B at the baseline. The body fully clarifies this within the first few lines (the parenthetical at lines 32-33: "The proof at lines 1566–1581 and the in-doc audit warning at lines 1583–1592 are untouched by this fix — they were already consistent with the corrected formulas"), and the Timing note settles it definitively. So the risk of misreading is low if the agent reads beyond the header. Still, the arrow header is a small attractive nuisance.

**MINOR EDIT OPTIONAL** (and only if low-friction): consider re-wording the header to make the audit-trail-formalisation nature explicit, e.g. `## 2026-05-16: lem:binary-Z squared-amplitudes → amplitudes (audit trail for pre-baseline fix)` or `(formalises pre-baseline √-correction)`. Not blocking; the body is clear.

**No load-bearing misrepresentation found.** The entry is more careful about its own provenance than I expected — it explicitly corrects the MIGRATION_PLAN's "all 4 reviewers flagged it" overclaim rather than silently importing it. That's a good sign of the author's discipline.

---

## Verdict

**APPROVE WITH MINOR EDITS.** The entry passes all eight focus-area
checks:

| Check | Verdict |
|---|---|
| 1. BEFORE quote accuracy | PASS (notation-translated faithfully; ERRATA transparent about this) |
| 2. AFTER quote accuracy | PASS (byte-identical to `summary.tex:1552-1559`) |
| 3. Reviewer-citation accuracy | PASS (5/5 cites land on the correct section headers; R4 silence is real; only nit is R2's numerical-demo line range off by ~4) |
| 4. Triangulation claim | PASS (three routes genuinely distinct in their headline argument) |
| 5. "Fix already applied" framing | PASS (git log confirms one-commit history; working tree shows zero diff) |
| 6. Schema conformance | PASS (all required fields present in the right order; placeholder `Commit:` is allowed; extra contextual fields do not violate schema) |
| 7. Mathematical equivalence | PASS (correct application of `√a·√b = √(ab)`; no over-claim of uniqueness) |
| 8. Misleading-to-future-agent | PASS (entry is *more* careful than its source MIGRATION_PLAN text; explicit about its unusual provenance) |

The author has done the right thing: instead of silently fixing
`summary.tex` (which would have been incorrect — the file is already
fixed) and silently parroting the MIGRATION_PLAN's "all 4 reviewers"
claim (which would have been incorrect — only 3 of 4 flag this bug),
they formalised the audit trail honestly. This is the *kind* of
commit Phase 1 needs.

## Minor edits requested

These are quality-of-life, not correctness-of-content. None blocks
the commit.

1. **`ERRATA.md:89` (R2 numerical-demo cite range):** the entry says
   "explicit numerical demonstration at lines 261–267". The actual
   numerical block is at `review_2_categorical.md:265-268`. Update
   the line range to `265–268` (or `265-267` if you prefer to match
   the original three-line bullet count). Off-by-~4 line citation;
   not load-bearing because the cited claim (`squared amplitudes sum
   to ≈0.674`) is correctly attributed.

2. **`ERRATA.md:28` (header):** consider adding a parenthetical to
   the header making it explicit that this entry formalises a
   pre-baseline fix, e.g.:
   ```
   ## 2026-05-16: lem:binary-Z squared-amplitudes → amplitudes (with √) [audit-trail for pre-baseline fix]
   ```
   so that a future agent skimming ERRATA's table of contents does not
   misread this as "the commit changed `summary.tex` here". The body
   is clear; only the header is mildly ambiguous in isolation.

3. **(optional, observation only)** Future ERRATA entries that *do*
   carry a `summary.tex` edit in their own commit should probably
   omit the "Timing note" field (which is specific to this
   audit-trail-formalisation case). The schema does not currently
   distinguish "fix-in-this-commit" vs "formalise-pre-baseline-fix"
   entries; consider whether ERRATA's preamble (`ERRATA.md:3-11`)
   should be extended to note that audit-trail-only entries are
   admissible and how they should be marked. Not a P1.2 concern;
   a P1.* note.

## Recommended commit-message `Review:` line

```
Review: Opus 4.7 subagent, APPROVE WITH MINOR EDITS — BEFORE/AFTER quotes
verified against reviews/review_3_cft.md and summary.tex:1552-1559;
3-of-4 triangulation confirmed; R4 silence verified; timing note matches
git log --follow summary.tex (one commit, P0.1 baseline). Minor nits:
R2 numerical-demo line range 261–267 should be 265–268; header could
flag "audit-trail for pre-baseline fix" for clarity. Full report:
stocktake/reports/opus-errata-p1.2-review.md.
```
