# ERRATA — corrections applied to `summary.tex`

<!--
ROLE: Append-only log of corrections to summary.tex made after the
      consolidation began. Per CLAUDE.md, summary.tex edits happen ONLY
      via ERRATA-tracked commits.
UPDATE POLICY: Strict append. Each entry: date, summary.tex line(s),
      what was wrong, what it now says, source of the correction (review
      file, derivation, Lean proof, etc.), commit hash.
TRIGGER: Any change to summary.tex beyond pure formatting.
-->

## Schema for each entry

```
## <YYYY-MM-DD>: <one-line summary>

**summary.tex location:** §<section>, line(s) <N–M>, label `<label>`
**Before:** <quote or precise description>
**After:** <quote or precise description>
**Source of correction:** <reviews/review_<N>_<topic>.md:Issue<n>, Lean lemma, derivation, …>
**Validation:** <which gates were exercised>
**Commit:** <hash>
```

---

## 2026-05-16: lem:binary-Z squared-amplitudes (probabilities) → amplitudes (with √) [audit-trail for pre-baseline fix]

**summary.tex location:** §"Concrete two-child Fibonacci formulae", lines
1548–1564, label `lem:binary-Z`. (The proof at lines 1566–1581 and the
in-doc audit warning at lines 1583–1592 are untouched by this fix — they
were already consistent with the corrected formulas.)

**Before** (verbatim from `reviews/review_3_cft.md:181-183`, which
quotes the chat-4 original that `summary.tex` initially inherited):

```latex
E_{I\to(J,K)}(\one)
&= \frac{Z_\one(x)\,Z_\one(y)}{Z_\one(L)}\,\one_J\otimes\one_K
\;+\; \varphi\,\frac{Z_\tau(x)\,Z_\tau(y)}{Z_\one(L)}\,(v^{\one}_{\tau\tau})_{J,K},
\\
E_{I\to(J,K)}(\tau)
&= \frac{Z_\tau(x)\,Z_\one(y)}{Z_\tau(L)}\,\tau_J\otimes\one_K
+ \frac{Z_\one(x)\,Z_\tau(y)}{Z_\tau(L)}\,\one_J\otimes\tau_K
+ \varphi^{-1}\,\frac{Z_\tau(x)\,Z_\tau(y)}{Z_\tau(L)}\,(v^{\tau}_{\tau\tau})_{J,K}.
```

Two distinct errors propagated together: (a) the outer fraction is the
**squared amplitude** (probability) rather than the amplitude — no
`\sqrt{...}`; (b) the multiplicative coefficients on the
$v_{\tau\tau}$-channels are $\varphi$ and $\varphi^{-1}$, which are
$|m^c_{ab}|^2$ rather than $m^c_{ab}$. The correct coefficients are
$\sqrt\varphi$ and $\varphi^{-1/2}$ from
[[def:fib-mult]] (`summary.tex:1337`).

**After** (current `summary.tex:1552-1560`):

```latex
E_{I\to(J,K)}(\one)
&= \sqrt{\frac{Z_\one(x)\,Z_\one(y)}{Z_\one(L)}}\,\one_J\otimes\one_K
\;+\; \sqrt\varphi\,\sqrt{\frac{Z_\tau(x)\,Z_\tau(y)}{Z_\one(L)}}\,(v^{\one}_{\tau\tau})_{J,K},\\[2pt]
E_{I\to(J,K)}(\tau)
&= \sqrt{\frac{Z_\tau(x)\,Z_\one(y)}{Z_\tau(L)}}\,\tau_J\otimes\one_K
+ \sqrt{\frac{Z_\one(x)\,Z_\tau(y)}{Z_\tau(L)}}\,\one_J\otimes\tau_K
+ \varphi^{-1/2}\sqrt{\frac{Z_\tau(x)\,Z_\tau(y)}{Z_\tau(L)}}\,(v^{\tau}_{\tau\tau})_{J,K}.
```

Mathematically equivalent to the reviewers' recommended form ($\sqrt\varphi
\cdot \sqrt{Z_\tau(x)Z_\tau(y)/Z_\one(L)} = \sqrt{\varphi\,Z_\tau(x)Z_\tau(y)/Z_\one(L)}$
and similarly $\varphi^{-1/2}\sqrt{Z_\tau(x)Z_\tau(y)/Z_\tau(L)}
= \sqrt{\varphi^{-1}\,Z_\tau(x)Z_\tau(y)/Z_\tau(L)}$). The current
`summary.tex` form is preferred because it makes the multiplication
amplitudes $m^\one_{\tau\tau} = \sqrt\varphi$ and
$m^\tau_{\tau\tau} = \varphi^{-1/2}$ explicit, matching
[[def:fib-mult]] and the schema $E \sim m^{(r)} / \sqrt{Z}$ of
[[def:rchild]].

**Source of correction:**

- `reviews/review_1_algebra.md:8` (Issue 1, **CRITICAL**: "Lemma 7.7
  (`lem:binary-Z`) displays squared amplitudes, not amplitudes. … The
  displayed coefficients are the squared amplitudes (probabilities); the
  amplitudes themselves should carry a square root over the entire
  fraction and the multiplicative constants φ and φ⁻¹ should be √φ and
  φ⁻¹ᐟ² respectively.")
- `reviews/review_2_categorical.md:228` (Issue 11, **CRITICAL**: "Lemma
  6.13 is internally inconsistent with Def 6.9 — missing square roots".
  Detailed isometry-failure derivation at lines 247–253; explicit
  numerical demonstration at lines 265–268 that the buggy formula's
  squared amplitudes sum to ≈0.674, not 1. Summary callback at line 499
  ranks this as the #1 of "Top three big finds".)
- `reviews/review_3_cft.md:179` (Issue 17, **★★ CRITICAL BUG**:
  "lem:binary-Z amplitudes are missing square roots" — includes
  detailed isometry-verification proof that the original formula fails
  $\eta^\dagger\eta = \id$).
- **`reviews/review_4_consistency.md`: silent on this lemma.** Review 4
  flagged different inconsistencies (`thm:branches` self-contradiction
  C1; fabricated OCR examples C2). The MIGRATION_PLAN's P1.2 text
  ("`reviews/review_4_consistency.md:<line>`") used `<line>` as a
  placeholder; review 4 is not a 4th independent source on this
  specific bug. **3 of 4 hostile reviews independently identified the
  bug** (and the 3 reviews used different verification routes:
  algebraic consistency with [[def:fib-mult]] (R1), schema consistency
  with [[def:rchild]] (R2), explicit isometry numerical-check (R3).
  Convergent triangulation — not a single reviewer's idiosyncratic
  catch.)

Cross-validation: the in-doc warning `\begin{warning}[Amplitudes, not
probabilities]` at `summary.tex:1583-1592` already acknowledged the bug
and asserted "The square-rooted formulas above are the corrected version."
This ERRATA entry formalises the warning's claim into the project's
audit-tracked correction log.

**Timing note:** The `\sqrt{...}` fix was applied to `summary.tex` at
some point **before** this repo was initialised (the file was already in
its corrected form at the baseline commit `7e62d9a` of 2026-05-16, and
this repo has no prior history of `summary.tex` edits). The in-doc
warning at line 1583 served as the audit trail in the absence of an
ERRATA file. P1.2 closes that loop: ERRATA now carries the formal
provenance.

**Validation:**

- **M** (mechanical): `pdflatex summary.tex` builds (32-page PDF;
  unchanged from prior build per
  `git diff <prev>..<this>` summary.tex showing zero hunks — the
  `summary.tex` file is byte-identical to its state before this commit).
- **D** (definitional): no `summary.tex` edits in this commit (the fix
  was pre-existing). The BEFORE/AFTER comparison above is between the
  reviewer-quoted chat-4 original and the current `summary.tex` form;
  the AFTER text is the verbatim file content.
- **C** (cross-check): 3 of 4 independent hostile reviews agree on the
  bug, each via a different verification route. The in-doc warning
  (4th independent author, in the document itself) also agrees.
- **R** (review): Opus subagent verified the ERRATA entry's BEFORE/AFTER
  quotes against the reviews and against current `summary.tex`, and
  confirmed the schema. Verdict in commit message.
- **I** (integration): no integration step beyond the build check —
  this commit modifies only `ERRATA.md` (and `MIGRATION_LOG.md` in the
  follow-on commit).

**Commit:** (filled below after commit lands)
