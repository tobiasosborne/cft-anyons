# Opus review — P1.1 GLOSSARY population

**Reviewer:** Opus 4.7 subagent (general-purpose)
**Date:** 2026-05-16
**File reviewed:** `GLOSSARY.md` (commit-staged, 1520 lines, 48 substantive entries)
**Decision:** **APPROVE WITH MINOR EDITS**

## Per-area findings

### 1. Schema conformance

I re-ran a programmatic schema check against all 48 entries (Python regex
parsed each `## slug — name` block, then asserted presence of all six
fields: header, `**Canonical:**` + ```latex fence + `\end{...}` close,
`**Source:**`, `**Aliases:**`, `**Translation map:**` (with `MMA:` and
`CAD:` bullets), `**Notes:**`). Result: **48/48 conforming**.

I additionally spot-checked the 8 entries the prompt requested:

| Slug | Section | Schema | Notes |
|---|---|---|---|
| `conv:basics` | early conv | OK | cross-link `[[conv:1op]]`, `[[def:HP]]` |
| `conv:1op` | early conv (later index) | OK | propositions `prop:m-form`, `prop:assoc-F`, `prop:dagger-special-eq` referenced |
| `def:HP` | Hilbert-space | OK | declares canonical role, references opus-hilbert-bridge |
| `def:fib-F` | Fibonacci | OK | hallucination callout present |
| `def:ising-F` | Ising | OK | concise, gauge caveat by reference |
| `def:OPE` | CFT | OK | cross-links primary, isingcft |
| `def:Jinterp` | non-tree | OK | cross-links persist + pair-create |
| `def:Ageom` | late entry | OK | depends on smear, Q, lemma `lem:moments` |

No deviations.

### 2. Verbatim spot-check

I verified three entries by eye against `summary.tex`:

- `def:algobj` (`summary.tex:474-489`): byte-for-byte match including
  `\textbf{Unit:}`, `\textbf{Associativity:}`, the displayed
  `mm^{\dagger} = \lambda\id_A`, and the closing `(or $\lambda$-special)`.
- `def:fsymbol` (`summary.tex:156-169`): exact match including the
  parenthesisation phrasing, the multi-line `\sum_{f,\rho,\sigma}`
  display, and trailing "unitary case each $F^{abc}_d$ is a unitary
  matrix."
- `def:Ageom` (`summary.tex:2175-2184`): exact match.

I then ran a full programmatic byte-for-byte D-gate replay (extract each
`\begin{...}...\end{...}` from `summary.tex` by line number, compare to
the GLOSSARY ```latex block). Result: **48/48 match after rstrip**. The
script confirmed the prior D-gate.

### 3. Factual claims in Notes

I spot-checked five claims against their cited locations:

1. **`def:algobj` Notes: "see warning `warn:not-Frobenius` (line 511) and
   Remark `rem:dagger-special-scope` (line 491)."** Verified:
   `summary.tex:491` is `\begin{remark}[What dagger-specialness gives...]\label{rem:dagger-special-scope}`,
   and `summary.tex:511` is `\begin{warning}[Earlier text overclaimed]\label{warn:not-Frobenius}`.
   ✓ correct.

2. **`def:Hlatt` Notes: "Equivalent to [[def:HP]] when all $A_I = Q$."**
   Verified: `summary.tex:393-399` is an unlabelled remark stating exactly
   "Definition~\ref{def:HP} reduces to Definition~\ref{def:Hlatt} when
   all $A_I = Q$ are equal." ✓ correct.

3. **`def:coassoc` Notes: "the unique strictly positive real solution to
   the joint system (normalisation + coassociativity) is Theorem
   `thm:coassoc` (`summary.tex:1159`): $x = \varphi^{-1}$, $y =
   \varphi^{-1/2}$, $p = q = \varphi^{-1}$, $r = \varphi^{-3/2}$."**
   Verified: `summary.tex:1159` opens `thm:coassoc`, and `cor:Delta-coassoc`
   at `summary.tex:1387-1407` confirms the same four numerical values
   ("which match Theorem~\ref{thm:coassoc} ($x=\varphi^{-1}$,
   $y=\varphi^{-1/2}$, $p=q=\varphi^{-1}$, $r=\varphi^{-3/2}$)"). ✓ correct.

4. **`def:Zfunc` Notes: "the convolutional identities encode the
   multiplication structure constants of [[def:fib-mult]] (per the
   remark at `summary.tex:1479`)."** Verified: `summary.tex:1479-1486` is
   exactly the unlabelled remark linking the convolutional identities to
   `def:fib-mult` modulo `lem:fib-special`. ✓ correct.

5. **`def:KS-Ln` Notes: "the Koo--Saleur convergence is in Conjecture
   `conj:KS` (line ~1735) per `summary.tex`'s flag."** Partially correct:
   `summary.tex:1735` is the *reference* `Conjecture~\ref{conj:KS}` —
   not the conjecture's own definition. The `\begin{conjecture}...
   \label{conj:KS}` itself lives at `summary.tex:2375-2376`. The "line
   ~1735" wording is misleading; should be either "referenced at line 1735;
   labelled at line 2375" or just "Conjecture `conj:KS`". **MINOR EDIT
   REQUESTED.**

I additionally cross-checked `lem:F-invol` (referenced by `def:fib-F` Notes
without line number — present at `summary.tex:1072`); `warn:charge-only`
referenced by `def:scalop` (`summary.tex:1964` ✓); `warn:Q-not-canonical`
referenced by `def:Q` (`summary.tex:254` ✓). All other line numbers
asserted in Notes are accurate. No factual errors in technical claims.

### 4. Term hygiene (P1.9 preview)

Three entries surveyed for undefined-term hazards.

**`def:fuscat` (lines 140-162):**
- "biproducts": category-theory standard, no GLOSSARY entry needed. (b)
- "rigid duals", "snake identities", "evaluation/coevaluation": same. (b)
- "associator", "unitors", "monoidal": same. (b)
- All clean — no project-specific term is invoked without its own entry.

**`def:fsymbol` (lines 239-252):**
- "pentagon equation": named but not defined here, and not in GLOSSARY.
  Standard fusion-category background. (b) acceptable for Phase 1.
  Could be promoted in P1.9 if a future entry depends on the precise
  equation; for now it is used only as a label.
- "parenthesisation", "splitting tree": informal, OK.
- "change-of-basis matrix": standard linear-algebra term.

**`def:HP` (lines 432-440):**
- "local cell object": defined in `def:Q` ✓ (a).
- "cell": no separate entry, but defined inside `def:partition`. (a).
- "$A_P$": notation only; def is local.

No project-specific terms are used without their own entry. Two
standard-background terms ("pentagon equation", "charge sector") appear
in multiple definitions without their own entries; this is acceptable
under Phase 1 scope (the Status block explicitly defers convention work
to P1.6 and audit work to P1.9).

### 5. Hallucination-risk callouts

Per-item check against `CLAUDE.md` "Hallucination-risk callouts" list:

- **`def:algobj` "dagger-special ≠ Frobenius-special":** **PRESENT.**
  Notes opens with "**Critical hallucination-risk callout (CLAUDE.md):
  'dagger-special' ≠ 'Frobenius-special'.**" with full citation to
  `warn:not-Frobenius` (line 511) and `rem:dagger-special-scope` (line
  491). Strong, explicit.

- **`def:fib-F` involutory-gauge warning:** **PRESENT in Translation
  map** ("Caution (CLAUDE.md hallucination-risk): TensorCategories.jl
  uses an involutory gauge"). Also present in Translation map of
  `def:fsymbol`. Two locations, consistent message.

- **`def:splitbasis` multiplicity-free assumption:** **PRESENT in
  Notes** with explicit reference to LB-1 bug (`cft-anyons-q6h` in bd)
  and forward-pointer to P1.6(d). Strong.

- **`def:Q` vacuum-index / Q overloading:** **PRESENT in Notes** —
  five named choices catalogued, warning `warn:Q-not-canonical`
  referenced, forward-pointer to P1.6(h). However, the **vacuum-index
  callout itself** (0 vs 1; the original STL-1 bug per CLAUDE.md) is
  *not* explicitly mentioned in any entry. The Notes for `def:Q` and
  `def:splitbasis` discuss multiplicity indices but not the
  vacuum-index drift. P1.6 will lift this to a `CONVENTIONS.md` item;
  flagging here for the author's awareness. **MINOR EDIT POSSIBLE** —
  add a sentence to `def:Q` Notes acknowledging vacuum-index drift
  hazard and pointing forward to P1.6(a).

- **`def:coassoc` scalar-vs-categorical overloading:** **PRESENT in
  Notes** with explicit reference to CAD's `Fibonacci/Coassoc.lean` and
  the P5.11 preservation plan. Cross-verified against
  `stocktake/reports/cad-lean.md:121-132` — accurate.

- **`def:HP`, `def:Hlatt`, `def:indlim` three-Hilbert-space-framings:**
  `def:HP` Notes contains a strong, explicit "**This is the canonical
  Hilbert-space formulation per `stocktake/reports/opus-hilbert-bridge.md`**"
  with reference to all three framings. `def:Hlatt` Notes is equally
  strong. `def:indlim` Notes is **weaker**: it only references opus-hilbert-bridge
  in the Translation map (MMA bullet), not in the Notes proper, and
  does not flag the three-framings reconciliation. **MINOR EDIT
  POSSIBLE** — add a line to `def:indlim` Notes pointing back to the
  same three-framings reconciliation that `def:HP` and `def:Hlatt`
  already flag.

### 6. Unlabelled convention slug choice

The `summary.tex:137-141` unlabelled `\begin{convention}` ("Throughout
this document $\Cc$ is unitary...") is assigned slug `conv:unitary-default`
in GLOSSARY. The Source field explicitly discloses: "(NB: this
`\begin{convention}` has **no `\label{...}`** in the source; the slug
`conv:unitary-default` is assigned here in GLOSSARY for cross-reference
only and is **not** a citable label in `summary.tex` itself.)"

This is the right disclosure: future agents will not be misled into
writing `\ref{conv:unitary-default}` in `summary.tex`. The slug is
descriptive (matches the content), follows the `conv:*` namespace, and
is unambiguous. **APPROVE.**

(Note: the canonical long-term fix is to add `\label{conv:unitary-default}`
in `summary.tex` — but that would be a `summary.tex` edit, which per
CLAUDE.md is allowed only via ERRATA-tracked atomic commits. This is
appropriate deferred work, not P1.1 scope.)

### 7. Schema documentation accuracy

`GLOSSARY.md:17-43` (the "Status" block) makes specific claims about
P1.1's scope and forward-pointers. I cross-checked against
`stocktake/MIGRATION_PLAN.md:117-139` (the canonical Phase 1 table):

| GLOSSARY Status claim | MIGRATION_PLAN match | OK? |
|---|---|---|
| P1.1: extract every `\begin{definition}` and `\begin{convention}` | "Read `summary.tex` end-to-end. For each `\begin{definition}` and each `\begin{convention}`..." (P1.1) | ✓ |
| "4 conv + 44 def = 48 entries" | not stated in plan, but my own grep confirms 4+44=48 | ✓ |
| "Canonical payloads copied verbatim" | "definitions copied verbatim, not paraphrased" (P1.1 validation D-gate) | ✓ |
| P1.3: Hilbert-space translation map | "Document GLOSSARY entries for: Hilbert space variants" (P1.3) | ✓ |
| P1.6: new CONVENTIONS.md entries | "Add `CONVENTIONS.md` entries for: (a) vacuum index ... (b) F-matrix gauge ... (c) dagger/adjoint ... (d) multiplicity-free ... (e) complex conjugation ... (f) TikZ ... (g) particle-number ... (h) Q choice ... (i) fusion-tree ordering ... (j) N=0 boundary" (P1.6) | ✓ representative |
| P1.7: CAD-Lean translation | "Add GLOSSARY translation map entries for CAD Lean..." (P1.7) | ✓ |
| P1.8: MMA-Julia translation | "Add GLOSSARY translation map entries for MMA..." (P1.8) | ✓ |
| P1.9: Opus audit | "Spawn an Opus agent to read GLOSSARY + CONVENTIONS in full..." (P1.9) | ✓ |
| "binary-Z bug is filed for P1.2" | P1.2: "ERRATA entries for ... `lem:binary-Z` squared-amplitudes bug" | ✓ |
| "Lemmas, propositions, theorems, corollaries, remarks, warnings, examples are NOT in scope for P1.1" | implicit in P1.1's scope ("each `\begin{definition}` and each `\begin{convention}`") | ✓ (good explicit clarification) |

All Status claims are accurate. The explicit out-of-scope list is a
helpful extension beyond the plan's literal wording and reduces
ambiguity for future agents.

### 8. One global change

**None.** The file is a competent definitional bedrock as-is. The
schema is consistent, the verbatim discipline is enforced (and gates
have been replayed), the cross-link graph closes, the hallucination
callouts land in the right places, and the forward-pointers to P1.3/
P1.6/P1.7/P1.8/P1.9 explicitly defer the work that does not belong in
P1.1.

If I had to name one stretch goal beyond minor edits: I would consider,
in a future Phase-1 step (not P1.1), elevating the per-entry "Notes"
prose into a **structured "Pitfalls" subfield** — most entries already
contain a Pitfalls-class warning, but it lives mixed in with
cross-references and informal commentary. A separate `**Pitfalls:**`
field (empty for most, populated for ~10 entries) would make
hallucination-risk callouts grep-able and machine-checkable. This is a
**P1.9-or-later** consideration, not a blocker for P1.1.

## Verdict

**APPROVE WITH MINOR EDITS.** The file passes all five focus-area
checks (schema, verbatim, factual, term-hygiene, hallucination-callouts)
and the two cross-cutting checks (unlabelled-convention disclosure,
status-doc accuracy). The minor edits below are quality-of-life, not
correctness-of-content.

## Minor edits requested

1. **`GLOSSARY.md:1126-1130` (def:KS-Ln Notes):** rewrite "the
   Koo--Saleur convergence is in Conjecture `conj:KS` (line ~1735)" to
   "the Koo--Saleur convergence is in Conjecture `conj:KS` (defined at
   `summary.tex:2375-2376`; referenced at line 1735)" — to avoid the
   ambiguity that "line ~1735" is the reference site, not the
   conjecture's definition.

2. **`GLOSSARY.md:540-543` (def:indlim Notes):** append one sentence
   pointing back to the three-Hilbert-space-framings reconciliation in
   `stocktake/reports/opus-hilbert-bridge.md`, so that all three of
   `def:HP` / `def:Hlatt` / `def:indlim` carry the same forward-pointer
   to the bridge report. Currently only the Translation map's MMA
   bullet mentions it; Notes proper should too.

3. **`GLOSSARY.md:324-331` (def:Q Notes):** consider adding one
   sentence acknowledging the vacuum-index drift hazard
   (CLAUDE.md's "Vacuum-index convention" callout) and pointing
   forward to P1.6(a). The current Notes covers Q-overloading but not
   the vacuum-index 0-vs-1 hazard that powered the original STL-1 bug.

None of these is blocking. The file as committed is fit for purpose as
the definitional bedrock for the rest of Phase 1.
