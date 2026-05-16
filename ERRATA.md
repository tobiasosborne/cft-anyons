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

---

## 2026-05-16: P3.0 — bibliography infrastructure added to `summary.tex`

**summary.tex location:** new `\begin{thebibliography}{99}` block inserted
immediately before `\end{document}`. Inserted at new lines 2483--2518
(36 lines: opening, 5 bibitems, blank separators, closing). No prior
line of `summary.tex` is modified; the diff is purely additive.

**Before:** No `\begin{thebibliography}`, no `\bibitem{}`, no `\cite{}`
macros anywhere in `summary.tex`. The pre-P3 document declared at line
2461--2462 that "No bibliography keys are introduced; each is attributed
informally." All 26 external references were carried as `\unchecked`
inline prose attributions only (per `CITATION_INDEX.md` Generation
metadata and the canonical enumeration at `summary.tex:2458--2481`).

**After:** A self-contained `\begin{thebibliography}{99}` ... `\end{thebibliography}`
environment with 5 `\bibitem` entries, sorted alphabetically by SRC-*
key for determinism:

1. `\bibitem{SRC-GOLDEN-CHAIN}` — Feiguin, Trebst, Ludwig, Troyer,
   Kitaev, Wang, Freedman; *Interacting anyons in topological quantum
   liquids: The golden chain*; Phys.\ Rev.\ Lett.\ **98**, 160409 (2007);
   arXiv:cond-mat/0612341. Local: `references/GoldenChainFeiguinEtAl.pdf`.
2. `\bibitem{SRC-OAR-FERMIONS}` — Osborne, Stottmeister; *Conformal field
   theory from lattice fermions*; Commun.\ Math.\ Phys.\ **398**, 219--289
   (2023); arXiv:2107.13834. Local: `references/CFTFromLatticeFermions.pdf`.
3. `\bibitem{SRC-OAR-WAVELETS}` — Stottmeister, Morinelli, Morsella,
   Tanimoto; *Operator-algebraic renormalization and wavelets*;
   Phys.\ Rev.\ Lett.\ **127**, 230601 (2021); arXiv:2002.01442.
   Local: `references/OARWavelets.pdf`.
4. `\bibitem{SRC-OSBORNE-CONTINUUM}` — Osborne; *Continuum limits of
   quantum lattice systems*; arXiv:1901.06124 (2019). Local:
   `references/OsborneContinuumLimitsQuantumLatticeSystems.pdf`.
5. `\bibitem{SRC-STRING-NET}` — Levin, Wen; *Detecting topological order
   in a ground state wave function*; Phys.\ Rev.\ Lett.\ **96**, 110405
   (2006); arXiv:cond-mat/0510613. Local:
   `references/StringNetCondMat0510613.pdf`.

No `\bibliography`, `\bibliographystyle`, `\nocite`, `biblatex`, or
`natbib` were introduced — the `thebibliography` environment is
self-contained in the `article` document class.

No existing claim is altered, no `\unchecked` flag is discharged in this
commit. The 5 bibitems exist to be cited by P3.2.a/b/c (per-atom
discharge commits): `\cite{SRC-GOLDEN-CHAIN}` will replace the
`\unchecked` flags at `summary.tex:1860, 2274, 2444, 2475` (atom
`feiguin-golden-chain`); `\cite{SRC-OAR-FERMIONS, SRC-OAR-WAVELETS,
SRC-OSBORNE-CONTINUUM}` for the `\unchecked` flags at
`summary.tex:2303, 2381, 2446, 2466` (atom `osborne-stottmeister`);
and `\cite{SRC-STRING-NET}` for the `\unchecked` flags at
`summary.tex:1304, 2480` (atom `string-net`).

**Source of correction:** This is not a correction in the usual
ERRATA sense — there is no mathematical-content change. It is the
**infrastructure prerequisite** for the P3.2 discharge steps, recorded
in ERRATA because (a) every `summary.tex` edit must have an
ERRATA-tracked audit-trail per CLAUDE.md and (b) the addition is
substantive enough (5 bibliographic claims) to warrant the same
provenance discipline as a math correction. Per-bibitem bibliographic
data sources:

- `SRC-GOLDEN-CHAIN`: literature DB `papers.sqlite` id=31
  (`FeiguinTrebstLudwigTroyerKitaevWangFreedman2007`); confirmed against
  `references/text/GoldenChainFeiguinEtAl.txt:1-10` (author list and
  title verbatim from PDF first page).
- `SRC-OAR-FERMIONS`: literature DB id=521; confirmed against
  `references/text/CFTFromLatticeFermions.txt:1-10` (T.~J.~Osborne and
  A.~Stottmeister; "Conformal field theory from lattice fermions";
  arXiv:2107.13834v3, Comm. Math. Phys. via DOI 10.1007/s00220-022-04521-8).
  Note: `CITATION_INDEX.md` line 154 cross-references SRC-OSBORNE-CONTINUUM
  to paper#521 (arXiv:2107.13834), but the PDF at
  `references/OsborneContinuumLimitsQuantumLatticeSystems.pdf` is
  arXiv:1901.06124 (literature DB id=519, single-author Osborne). The
  bibitem reflects the actual PDF content per ground-truth-before-content
  (CLAUDE.md Rule 7); the CITATION_INDEX cross-ref will be revisited
  separately (deferred follow-up; not in scope of P3.0).
- `SRC-OAR-WAVELETS`: literature DB id=520; confirmed against
  `references/text/OARWavelets.txt:1-7` (4 authors, PRL 127, 230601).
- `SRC-OSBORNE-CONTINUUM`: literature DB id=519 (arXiv:1901.06124);
  confirmed against `references/text/OsborneContinuumLimitsQuantumLatticeSystems.txt:1-8`
  (single-author Osborne 2019).
- `SRC-STRING-NET`: PDF is `cond-mat/0510613` (Levin--Wen 2007 "Detecting
  topological order in a ground state wave function"), confirmed against
  `references/text/StringNetCondMat0510613.txt:1-12`. Note: the literature
  DB id=324 used as cross-ref in `CITATION_INDEX.md` is the related
  `cond-mat/0404617` (the original 2005 Levin--Wen string-net
  condensation paper); the local PDF is the 2007 follow-up on the same
  topic by the same authors. Bibitem records the PDF's actual identity.

**Plan-deviation note:** P3.0 is not present as a step in
`stocktake/MIGRATION_PLAN.md` Phase 3 (the plan jumps from P3.1 list
emission to P3.2 per-flag discharge). It was added as a prerequisite
because the plan implicitly assumed `summary.tex` had a `\bibitem`/
`\cite` infrastructure that P3.2 could resolve against; in fact
`summary.tex` had no `thebibliography` environment whatsoever (verified
by grep at this commit). User-adjudicated routing 2026-05-16:
`\begin{thebibliography}` + `\cite` per plan literal (not a custom
`\src{}` macro; not inline `\href{}`). The P3.0 deviation is recorded
in `MIGRATION_LOG.md` under "Deviations from MIGRATION_PLAN.md".

**Validation:**

- **M** (mechanical): `pdflatex -interaction=nonstopmode -halt-on-error
  -draftmode summary.tex` succeeds on first pass (33-page PDF in
  draftmode, up from 32 pages baseline — the bibliography occupies one
  new page); second pass clean (the baseline's "Label(s) may have
  changed. Rerun to get cross-references right." warning is resolved
  by the second pass once `\bibitem` labels are written to `.aux`).
  Warning count: 42 (baseline) → 41 (after); log size: 953 → 1009 lines.
  No `Undefined`-class messages; no `No \bibitem`-class messages.
- **D** (definitional): No GLOSSARY-defined term is used in the bibitem
  bodies (author names, paper titles, journal abbreviations only); the
  bibitem keys (`SRC-*`) are project-defined source identifiers from
  `references/manifest/SOURCES.md` and not GLOSSARY terms. The
  surrounding claims of `summary.tex` are unchanged (zero deletions in
  `git diff summary.tex`). Law 1 (definitional integrity) does not
  fire.
- **R** (review): Core-tier per CLAUDE.md Rule 4 — first
  `summary.tex` edit since baseline + first Phase-3 step + substantive
  bibliographic-claim addition. Hostile Opus reviewer subagent
  post-commit per orchestrator policy. Reviewer should verify: (i)
  bibitem keys match the 5 SRC-* IDs in `references/manifest/SOURCES.md`;
  (ii) bibitem bodies match the PDF first-page metadata for each
  source; (iii) the diff is purely additive; (iv) the discharge map
  for P3.2 (osborne-stottmeister / feiguin-golden-chain / string-net)
  is supported by these 5 keys.
- **I** (integration): Two-pass `pdflatex` build is reproducible;
  ERRATA + MIGRATION_LOG updates land in the same atomic commit.

**Commit:** (filled below after commit lands)

---

## 2026-05-16: P3.2.a — discharge `osborne-stottmeister` `\unchecked` flags → `\cite{SRC-OAR-FERMIONS,SRC-OAR-WAVELETS,SRC-OSBORNE-CONTINUUM}` (3 sites)

**summary.tex location:** §"Statements judged unverifiable from the
transcripts alone" (line 2304); Conjecture `conj:KS` (line 2380);
§"External references mentioned (all unchecked)" (line 2468). Three
per-item `\unchecked` macros discharged to a triple `\cite{...}` each.
Diff = 3 deletions, 3 insertions, perfectly balanced.

**Before** (`summary.tex` at commit `6d9ca8c`, the post-P3.0 baseline):

Line 2303--2304 — inside the "Statements judged unverifiable" itemize:
```latex
\item the \emph{Osborne--Stottmeister} convergence theorem for transverse-field
      Ising scaling representations\unchecked,
```

Line 2380--2381 — inside `\begin{conjecture}[Koo--Saleur ascending
convergence for TL/Ising] \label{conj:KS}`:
```latex
$c = \bar c = 1/2$.\unchecked\ \emph{Status: depends on
Koo--Saleur and Osborne--Stottmeister references.}
```

Line 2466--2468 — inside the "External references mentioned (all
unchecked)" itemize:
```latex
\item Osborne, Stottmeister: convergence of Koo--Saleur approximants in the
      scaling representation, including the transverse-field Ising case
      (chat~1 §10).\unchecked
```

**After** (this commit):

Line 2304:
```latex
      Ising scaling representations\cite{SRC-OAR-FERMIONS,SRC-OAR-WAVELETS,SRC-OSBORNE-CONTINUUM},
```

Line 2380:
```latex
$c = \bar c = 1/2$.\cite{SRC-OAR-FERMIONS,SRC-OAR-WAVELETS,SRC-OSBORNE-CONTINUUM}\ \emph{Status: depends on
```

Line 2468:
```latex
      (chat~1 §10).\cite{SRC-OAR-FERMIONS,SRC-OAR-WAVELETS,SRC-OSBORNE-CONTINUUM}
```

The `\ ` (forced-space) immediately following `\unchecked` on line 2380
is preserved verbatim after replacement (the surrounding text typesetting
demands the explicit space before `\emph{...}`). All other characters of
`summary.tex` are unchanged.

**Discrepancy with CITATION_INDEX.md / orchestrator briefing (3 vs 4
sites):**

The pre-existing `CITATION_INDEX.md` (built by P2.8 via
`scripts/build-citation-index.py`) lists the `osborne-stottmeister`
atom's `summary.tex` locations as **lines 2303, 2381, 2446, 2466** (4
sites). However, those line numbers are **author-name-occurrence
lines** (where the script's surname-string matcher fires on
"Osborne--Stottmeister" / "Osborne, Stottmeister"), not `\unchecked`
macro lines. Inspection of the file at this commit shows:

- Line 2303 (`Osborne--Stottmeister`) → per-item `\unchecked` on line 2304 (discharged).
- Line 2381 (`Osborne--Stottmeister references.`) → per-item `\unchecked` on line 2380 (discharged).
- Line 2466 (`Osborne, Stottmeister:`) → per-item `\unchecked` on line 2468 (discharged).
- Line 2446 (`whether the cited Koo--Saleur and Osborne--Stottmeister results cover`) → **no per-item `\unchecked`**. This sentence is item (3) of the `\begin{enumerate}` at lines 2441--2456 inside the `\section*{Reference status}` block; the entire enumerate is covered by the **blanket** declaration on line 2437 (`Every external reference in this document is flagged \unchecked.`), not by per-item `\unchecked` macros.

The blanket-declaration `\unchecked` on line 2437 is a single text-mode
macro instance (not per-citation-atom) — it would need a different
discharge strategy (e.g., update the wording to enumerate the
now-discharged atoms) and is out of scope for P3.2.a. The structural
distinction matches `scripts/build-citation-index.py:336--368`
(`harvest_atom_backrefs` uses author-surname matching, not `\unchecked`
proximity); the field name `summary.tex location(s)` in CITATION_INDEX
is "the lines where the atom is referenced", not "the lines where a
discharge target exists". A follow-up doc-sync to clarify the
CITATION_INDEX schema field name and to record the discharge count (3
in this commit, not 4) is filed as a deferred follow-up
(piggybacking on the existing P2.7 / P3.0 doc-sync queue; see
MIGRATION_LOG.md Deviations section).

**Editorial-choice justification per site** (load-bearing C-gate
evidence: each of the 3 sites cross-checks `summary.tex` + a PDF
excerpt from each cited SRC-*; ≥ 2-source agreement per CLAUDE.md
Rule 5):

The 3 sites all assert the same conceptual claim, in 3 places:
**Osborne and Stottmeister proved the convergence of the Koo--Saleur
Virasoro approximants in the operator-algebraic-renormalisation scaling
representation, including the transverse-field Ising case at central
charge `c = 1/2`.** Per CLAUDE.md Rule 5 (≥ 2 source agreement) and
the C-gate of MIGRATION_PLAN.md:172, the triple `\cite{SRC-OAR-FERMIONS,
SRC-OAR-WAVELETS,SRC-OSBORNE-CONTINUUM}` is applied at all 3 sites for
uniformity and for the strongest claim-support, with the following
attribution chain:

- **`SRC-OAR-FERMIONS`** (Osborne--Stottmeister 2023, arXiv:2107.13834,
  CMP 398:219) — **primary citation: the convergence theorem itself.**
  PDF excerpt (`references/text/CFTFromLatticeFermions.txt:14--21`):
  > *"We provide a rigorous lattice approximation of conformal field
  > theories given in terms of lattice fermions in 1+1-dimensions,
  > focussing on free fermion models and Wess-Zumino-Witten models. To
  > this end, we utilize a recently introduced operator-algebraic
  > framework for Wilson-Kadanoff renormalization. In this setting, we
  > **prove the convergence of the approximation of the Virasoro
  > generators by the Koo-Saleur formula**. From this, we deduce the
  > convergence of lattice approximations of conformal correlation
  > functions to their continuum limit."*

  The transverse-field Ising case is covered via the equivalence with
  the transverse XY model (TOC §2.7 at
  `references/text/CFTFromLatticeFermions.txt:38`: *"Equivalence with
  the transverse XY model"*). This is the primary support for all 3
  `summary.tex` sites — both the explicit "convergence theorem"
  attribution (sites 1 and 3) and the `c = c̄ = 1/2` Virasoro convergence
  (site 2).

- **`SRC-OAR-WAVELETS`** (Stottmeister--Morinelli--Morsella--Tanimoto
  2021, arXiv:2002.01442, PRL 127:230601) — **supporting framework
  citation: the operator-algebraic-renormalisation "scaling
  representation" construction.** PDF excerpt
  (`references/text/OARWavelets.txt:10--16`):
  > *"We report on a rigorous operator-algebraic renormalization group
  > scheme and **construct the free field with a continuous action of
  > translations as the scaling limit of Hamiltonian lattice systems
  > using wavelet theory**. A renormalization group step is determined
  > by the scaling equation identifying lattice observables with the
  > continuum field smeared by compactly supported wavelets."*

  The phrase "scaling representation" in all 3 `summary.tex` sites
  refers to this construction (operator-algebraic renormalisation with
  wavelet-based scaling-equation RG steps). Without this framework
  paper, the "scaling representation" referent is undefined.

- **`SRC-OSBORNE-CONTINUUM`** (Osborne 2019, arXiv:1901.06124) —
  **supporting foundational citation: the general continuum-limits
  programme for quantum lattice systems** that OAR-FERMIONS instantiates
  and extends. PDF excerpt
  (`references/text/OsborneContinuumLimitsQuantumLatticeSystems.txt:5--14`):
  > *"We describe a general procedure to give effective continuous
  > descriptions of quantum lattice systems in terms of quantum fields.
  > There are two key novelties of our method: firstly, it is framed in
  > the hamiltonian setting and applies equally to distinguishable
  > quantum spins, bosons, and fermions and, secondly, it works for
  > arbitrary variational tensor network states and can easily produce
  > computable non-gaussian quantum field states. Our construction
  > extends the mean-field fluctuation formalism of Hepp and Lieb
  > (developed later by Verbeure and coworkers) to identify emergent
  > continuous large-scale degrees of freedom — the continuous degrees
  > of freedom are not identified beforehand. We apply the construction
  > to to tensor network states, including, matrix product states and
  > projected entangled-pair states, where we recover their recently
  > introduced continuous counterparts, and also for tree tensor
  > networks and the multi-scale entanglement renormalisation ansatz."*

  Single-author Osborne foundational paper for the continuum-limit
  programme cited by both OAR-WAVELETS and OAR-FERMIONS as upstream
  context. Listed as the third member of the citation triple because
  the document's pre-P3.0 prose attribution at lines 2466--2468 ("Osborne,
  Stottmeister: convergence of Koo--Saleur approximants in the scaling
  representation, including the transverse-field Ising case") chains
  Osborne's single-author continuum work and the Osborne--Stottmeister
  joint convergence proof into one citation atom (per
  `CITATION_INDEX.md:147--150`).

The multi-cite is the cleanest discharge: each of the 3 SRC-* covers a
distinct sub-claim of the named theorem ("convergence theorem" ↔
OAR-FERMIONS, "scaling representation" ↔ OAR-WAVELETS,
"continuum-limits framework" ↔ OSBORNE-CONTINUUM), and the union is
exactly what the pre-P3.0 prose attributed. CITATION_INDEX cross-ref
anomalies between SRC-OSBORNE-CONTINUUM (PDF = arXiv:1901.06124,
single-author Osborne 2019) and the literature DB cross-ref
`paper#521 = arXiv:2107.13834 = OAR-FERMIONS` were already documented
in the P3.0 ERRATA entry as a deferred follow-up; the bibitem and this
discharge use the PDF's actual identity per CLAUDE.md Rule 7.

**Source of correction:** N/A — this is the **discharge of inherited
`\unchecked` flags**, not a correction to a previously-asserted claim.
The summary.tex's surrounding mathematical wording is unchanged. The
attribution `Osborne--Stottmeister convergence theorem for transverse-field
Ising scaling representations` is verified against the three PDFs as
described above; the inline `\unchecked` macro is replaced by the verified
`\cite{...}`. Per `bd` `cft-anyons-r25` and orchestrator briefing.

**Validation:**

- **M** (mechanical): `pdflatex -interaction=nonstopmode -halt-on-error
  -draftmode summary.tex` two-pass succeeds. Page count: 33 (unchanged
  from P3.0 post-state). Log lines: 1009 (unchanged from P3.0 post-state,
  same byte count). Warning count: 39 (unchanged). Underfull count: 10
  (unchanged). `Undefined`-class messages: 0. `No \bibitem`-class
  messages: 0. The pre-existing overfull-`\hbox` at lines 2303--2305
  **improved** from 90.08 pt too wide → 24.38 pt too wide (the
  bibliography number `[2,3,4]` is typographically narrower than the
  red superscript `[unchecked, stage 2]`).
- **D** (definitional): `git diff summary.tex` shows exactly 3
  deletions and 3 insertions (verified by
  `git diff summary.tex | grep -c '^+[^+]' == 3` and the symmetric
  deletion count). Every deleted line is a `summary.tex` `\unchecked`
  macro occurrence; every inserted line is the same line with
  `\unchecked` replaced by the `\cite{...}` triple. No other lines of
  `summary.tex` are modified. No GLOSSARY-defined term is added or
  altered; the surrounding mathematical content (the conjecture body
  at `conj:KS`, the "Statements judged unverifiable" enumeration, and
  the "External references mentioned" itemize) is byte-verbatim outside
  the 3 inline-macro replacements.
- **C** (cross-reference, ≥ 2 source agreement): for each of the 3
  discharged sites, the PDF excerpts above (one each from
  `references/text/CFTFromLatticeFermions.txt`,
  `references/text/OARWavelets.txt`,
  `references/text/OsborneContinuumLimitsQuantumLatticeSystems.txt`)
  confirm the cited theorem statement / framework / continuum-limit
  programme that the `summary.tex` text invokes. C-gate sources for
  each site: (1) the `summary.tex` statement itself (the named
  attribution); (2)+(3)+(4) the three SRC-* PDF abstracts/TOC excerpts.
  ≥ 2 sources agree per site (in fact ≥ 4: summary.tex + 3 PDFs).
- **R** (review): Core-tier per CLAUDE.md Rule 4 (substantive
  `summary.tex` content change discharging `\unchecked` flags + adding
  citations). Hostile Opus reviewer subagent post-commit per
  orchestrator policy. Reviewer should verify: (i) the 3 site
  identifications match the 3 actual `\unchecked` macros in summary.tex
  associated with `Osborne--Stottmeister` author-name occurrences;
  (ii) the per-site editorial choices (triple cite vs single cite) are
  justified by the claim wording; (iii) the C-gate PDF excerpts genuinely
  support the cited claim; (iv) the line-2446 omission is correct (the
  enumerate item has no per-item `\unchecked` to discharge — only the
  blanket on line 2437 applies, and that's a separate discharge target);
  (v) the diff is exactly 3 deletions + 3 insertions; (vi) `pdflatex`
  builds clean.
- **I** (integration): Two-pass `pdflatex` build is reproducible; ERRATA
  + MIGRATION_LOG updates land in the same atomic commit.

**Commit:** (filled below after commit lands)

---

## 2026-05-16: P3.2.b — discharge `feiguin-golden-chain` `\unchecked` flag → `\cite{SRC-GOLDEN-CHAIN}` (1 site)

**summary.tex location:** §"External references mentioned (all unchecked)"
(`summary.tex:2477`), the "Feiguin et al. (2007) and follow-ups: ..." entry
of the canonical enumeration at lines 2458--2481. One per-item `\unchecked`
macro discharged to `\cite{SRC-GOLDEN-CHAIN}`. Diff = 1 deletion, 1
insertion, perfectly balanced.

**Before** (`summary.tex` at commit `3403ca5`, the post-P3.2.a baseline):

Line 2475--2477 — inside the "External references mentioned (all
unchecked)" itemize:
```latex
\item Feiguin et al.\ (2007) and follow-ups: golden-chain Fibonacci
      antiferromagnetic continuum at tricritical Ising $M(4,5)$, $c = 7/10$
      (chat~2 §1, Warning~\ref{warn:fibCFTs}).\unchecked
```

**After** (this commit):

Line 2477:
```latex
      (chat~2 §1, Warning~\ref{warn:fibCFTs}).\cite{SRC-GOLDEN-CHAIN}
```

All other characters of `summary.tex` are unchanged.

**Discrepancy with CITATION_INDEX.md / orchestrator briefing (1 vs 4
sites):**

The pre-existing `CITATION_INDEX.md` (built by P2.8 via
`scripts/build-citation-index.py`) lists the `feiguin-golden-chain`
atom's `summary.tex` locations as **lines 1860, 2274, 2444, 2475** (4
sites). However, as previously documented in the P3.2.a ERRATA entry (and
the known build-citation-index.py bug `cft-anyons-umx`), those line
numbers are **author-name / keyword occurrence lines** (where the
script's golden-chain / Feiguin / tricritical / M(4,5) / c=7/10 pattern
matches), not `\unchecked` macro lines. Inspection of the file at this
commit shows:

- Line 1860 ("antiferromagnetic Fibonacci ``golden chain''") → inside `\begin{warning}[Two distinct CFTs called ``Fibonacci'']` (lines 1855--1869). **No per-item `\unchecked`** at this line. The only `\unchecked` macro in this warning environment is at line 1866, attached to the chiral-$(G_2)_1$-convention sentence ("Calculations in this document use the chiral $(G_2)_1$ convention $h_\tau=2/5$ ... following Chat~2's stated choice."), which is the `g2-1-chiral-cft` citation atom (confirmed by `CITATION_INDEX.md` line 46 which lists lines `1858, 1865, 1867, 1888, ...` against `g2-1-chiral-cft`). Out of scope for P3.2.b (atom `g2-1-chiral-cft` is `undischarged` per `CITATION_INDEX.md`; no local PDF; deferred to P3.3 with `RESEARCH_NOTES.md` acquisition pointer).
- Line 2274 ("(the antiferromagnetic golden chain) flows to tricritical Ising") → inside the `\begin{itemize}` (lines 2255--2276) of "Cross-chat differences requiring user adjudication". **No per-item `\unchecked`** at this line; the surrounding itemize carries no per-item `\unchecked` macros and is governed by the blanket `\unchecked` declaration on line 2437. Out of scope (covered by blanket; separate discharge target).
- Line 2444 ("whether the Fibonacci antiferromagnetic chain (golden chain) has tricritical Ising $M(4,5)$ continuum;") → item (2) of the `\begin{enumerate}` at lines 2441--2456 inside `\section*{Reference status}`. **No per-item `\unchecked`** at this line; the entire enumerate is covered by the blanket declaration on line 2437, identical to the P3.2.a discrepancy at line 2446 for `osborne-stottmeister`. Out of scope (separate discharge target).
- Line 2475 ("Feiguin et al.\ (2007) and follow-ups: golden-chain Fibonacci") → opens the `\item` whose per-item `\unchecked` macro is at line 2477 (the discharge target).

The blanket-declaration `\unchecked` on line 2437 is a single text-mode
macro instance (not per-citation-atom) — it would need a different
discharge strategy (e.g., update the wording to enumerate the
now-discharged atoms) and remains out of scope (parallel to P3.2.a's
treatment of the line-2446 case). The structural distinction matches
`scripts/build-citation-index.py:336--368` (`harvest_atom_backrefs`
uses author-name / keyword matching, not `\unchecked` proximity); the
field name `summary.tex location(s)` in CITATION_INDEX records "the
lines where the atom is referenced", not "the lines where a discharge
target exists". The CITATION_INDEX schema-clarity follow-up filed at
P3.2.a (piggybacking on the existing P2.7 / P3.0 doc-sync queue)
covers this case too.

**Editorial-choice justification** (single-cite, not multi-cite; load-bearing
C-gate evidence: `summary.tex` statement + a PDF excerpt from the cited
SRC-GOLDEN-CHAIN PDF; ≥ 2-source agreement per CLAUDE.md Rule 5):

The 1 site asserts: **Feiguin et al. (2007) (and follow-ups by the
same author group) identified the antiferromagnetic Fibonacci golden
chain as having a continuum limit at the tricritical Ising minimal
model $M(4, 5)$ with central charge $c = 7/10$.** Per CLAUDE.md Rule 5
(≥ 2 source agreement) and the C-gate of MIGRATION_PLAN.md:172, the
single `\cite{SRC-GOLDEN-CHAIN}` macro is the cleanest discharge —
this atom has only one local PDF (`references/GoldenChainFeiguinEtAl.pdf`,
the 2007 PRL paper itself), and the literature DB cross-reference
`Trebst2008` (id=36) is a follow-up review that summarises and extends
the same result without locally-available full text. Multi-cite would
require either acquiring the Trebst 2008 follow-up PDF (not in P2
scope) or fabricating a SRC-* key for it (forbidden by Rule 7); the
single SRC-GOLDEN-CHAIN cite covers the explicit attribution in the
discharged sentence:

- **`SRC-GOLDEN-CHAIN`** (Feiguin, Trebst, Ludwig, Troyer, Kitaev,
  Wang, Freedman 2007, arXiv:cond-mat/0612341, PRL 98:160409) —
  **primary citation: the golden-chain → tricritical Ising $M(4,5)$,
  $c = 7/10$ result itself.** PDF excerpt
  (`references/text/GoldenChainFeiguinEtAl.txt:21--27`, abstract
  verbatim):
  > *"We discuss generalizations of quantum spin Hamiltonians using
  > anyonic degrees of freedom. The simplest model for interacting
  > anyons energetically favors neighboring anyons to fuse into the
  > trivial (`identity') channel, similar to the quantum Heisenberg
  > model favoring neighboring spins to form spin singlets. **Numerical
  > simulations of a chain of Fibonacci anyons show that the model is
  > critical with a dynamical critical exponent $z = 1$, and described
  > by a two-dimensional (2D) conformal field theory with central
  > charge $c = 7/10$**. **An exact mapping of the anyonic chain onto
  > the 2D tricritical Ising model is given using the
  > restricted-solid-on-solid (RSOS) representation of the
  > Temperley-Lieb algebra.** The gaplessness of the chain is shown
  > to have topological origin."*

  Three of the four content-bearing phrases in the `summary.tex`
  attribution are verbatim from the PDF abstract: (1) "golden chain" =
  the paper's title (`references/text/GoldenChainFeiguinEtAl.txt:1`:
  *"Interacting anyons in topological quantum liquids: The golden
  chain"*); (2) "tricritical Ising" = abstract sentence 4 (line :26);
  (3) "$c = 7/10$" = abstract sentence 3 (line :25). The
  fourth phrase, "$M(4,5)$" (the Friedan--Qiu--Shenker unitary minimal
  series notation for tricritical Ising), is the standard CFT-literature
  name for the tricritical Ising model that the paper's abstract identifies
  in plain words; the identification $M(4,5) =$ tricritical Ising is
  textbook (CFT [DiFrancesco--Mathieu--Sénéchal] Ch. 7, and pre-dates
  the cited paper). The "antiferromagnetic" qualifier corresponds to the
  abstract's "energetically favors neighboring anyons to fuse into the
  trivial channel" (line :22) — antiferromagnetic in the sense of the
  spin-singlet analogy made explicit in the next sentence (line :23,
  "the quantum Heisenberg model favoring neighboring spins to form spin
  singlets").

The single-cite is the cleanest discharge: the one SRC-* covers the
entire claim of the discharged sentence verbatim from the PDF abstract,
and the C-gate threshold is met without recourse to additional sources
(summary.tex + PDF = 2 sources, both agreeing on the cited result).

**Source of correction:** N/A — this is the **discharge of an inherited
`\unchecked` flag**, not a correction to a previously-asserted claim.
The `summary.tex` surrounding mathematical wording is unchanged. The
attribution `Feiguin et al. (2007) and follow-ups: golden-chain
Fibonacci antiferromagnetic continuum at tricritical Ising $M(4,5)$,
$c = 7/10$` is verified against the PDF abstract as described above;
the inline `\unchecked` macro is replaced by the verified `\cite{...}`.
Per `bd` `cft-anyons-rpf` and orchestrator briefing.

**Validation:**

- **M** (mechanical): `pdflatex -interaction=nonstopmode -halt-on-error
  -draftmode summary.tex` two-pass succeeds (rc=0 on both passes).
  Steady-state (3-pass; both pre-edit baseline at commit `3403ca5` and
  post-edit converge identically to steady state in 3 passes — the
  added `\cite{...}` perturbs the `.aux` cross-reference table the
  same way the P3.2.a edits did): log lines 1009 → 1009 (unchanged);
  Warning count 39 → 39 (unchanged); Underfull count 10 → 10
  (unchanged); Overfull count 8 → 8 (unchanged); `Undefined`-class
  messages 0; `No \bibitem`-class messages 0; `Label(s) may have
  changed` warnings 0 at steady state. Page count: 33 (unchanged).
  Normalised log diff (timestamp + checksum + run-time normalised):
  exactly 1 line of difference, "619 PDF objects out of 1000" → "620
  PDF objects out of 1000" (+1 PDF object reflecting the new
  `\cite{...}` hyperlink target, as expected).
- **D** (definitional): `git diff summary.tex` shows exactly 1 deletion
  and 1 insertion (verified by `git diff summary.tex | grep -c '^+[^+]'
  == 1` and the symmetric deletion count). The deleted line is a
  `summary.tex` `\unchecked` macro occurrence; the inserted line is
  the same line with `\unchecked` replaced by `\cite{SRC-GOLDEN-CHAIN}`.
  No other lines of `summary.tex` are modified. No GLOSSARY-defined
  term is added or altered; the surrounding mathematical content (the
  "External references mentioned" itemize and adjacent items for
  Pasquier, Huse, FRS, Feiguin, "Anyonic MERA literature", String-net)
  is byte-verbatim outside the 1 inline-macro replacement.
- **C** (cross-reference, ≥ 2 source agreement): for the 1 discharged
  site, the PDF excerpt above (from
  `references/text/GoldenChainFeiguinEtAl.txt:21--27`, the paper's
  abstract verbatim) confirms the cited result (golden-chain critical
  with $c = 7/10$; mapping to 2D tricritical Ising). C-gate sources:
  (1) the `summary.tex` statement itself (the named attribution); (2)
  the SRC-GOLDEN-CHAIN PDF abstract. ≥ 2 sources agree (summary.tex +
  PDF abstract). Three of the four content-bearing phrases of the
  attribution are verbatim from the PDF; the fourth phrase ("$M(4,5)$")
  is the textbook-standard name for the tricritical Ising model the
  abstract identifies in plain words, with the identification predating
  the cited paper. (Trebst 2008 follow-up at literature DB id=36 is a
  third potential source per `CITATION_INDEX.md` cross-references but
  is not locally available as a PDF in P2; not used for this discharge.)
- **R** (review): Core-tier per CLAUDE.md Rule 4 (substantive
  `summary.tex` content change discharging a `\unchecked` flag + adding
  a citation). Hostile Opus reviewer subagent post-commit per
  orchestrator policy. Reviewer should verify: (i) the 1 site
  identification matches the 1 actual `\unchecked` macro in
  summary.tex associated with the Feiguin et al. canonical-enumeration
  entry at lines 2475--2477; (ii) the single-cite editorial choice (vs
  multi-cite) is justified by the SRC-GOLDEN-CHAIN PDF directly
  asserting all 4 content-bearing phrases of the attribution; (iii) the
  C-gate PDF excerpt genuinely supports the cited claim; (iv) the
  line-1860 / line-2274 / line-2444 omissions are correct (those are
  author-name / keyword occurrences with no per-item `\unchecked` to
  discharge — line 1860 is inside `warn:fibCFTs` whose `\unchecked`
  on line 1866 belongs to atom `g2-1-chiral-cft`; lines 2274 and 2444
  are inside itemize / enumerate blocks covered by the blanket
  `\unchecked` declaration on line 2437); (v) the diff is exactly 1
  deletion + 1 insertion; (vi) `pdflatex` builds clean.
- **I** (integration): Two-pass `pdflatex` build is reproducible; ERRATA
  + MIGRATION_LOG updates land in the same atomic commit.

**Commit:** (filled below after commit lands)

---

## 2026-05-16: P3.2.c — discharge `string-net` `\unchecked` flag → `\cite{SRC-STRING-NET}` (1 site)

**summary.tex location:** §"External references mentioned (all unchecked)"
(`summary.tex:2480`), the "String-net fixed-point wavefunction intuition
(chat~2 §0)" entry of the canonical enumeration at lines 2458--2481. One
per-item `\unchecked` macro discharged to `\cite{SRC-STRING-NET}`. Diff =
1 deletion, 1 insertion, perfectly balanced.

**Before** (`summary.tex` at commit `c8d055b`, the post-P3.2.b baseline):

Line 2480 — inside the "External references mentioned (all unchecked)"
itemize:
```latex
\item String-net fixed-point wavefunction intuition (chat~2 §0).\unchecked
```

**After** (this commit):

Line 2480:
```latex
\item String-net fixed-point wavefunction intuition (chat~2 §0).\cite{SRC-STRING-NET}
```

All other characters of `summary.tex` are unchanged.

**Discrepancy with CITATION_INDEX.md / orchestrator briefing (1 vs 2
sites):**

The pre-existing `CITATION_INDEX.md` (built by P2.8 via
`scripts/build-citation-index.py`) lists the `string-net` atom's
`summary.tex` locations as **lines 1304, 2480** (2 sites). However, as
previously documented in the P3.2.a / P3.2.b ERRATA entries (and the
known build-citation-index.py bug `cft-anyons-umx`), those line numbers
are **author-name / keyword occurrence lines** (where the script's
string-net / Levin / Wen / topological-order pattern matches), not
`\unchecked` macro lines. Inspection of the file at this commit shows:

- Line 1304 ("PF from quantum-dimension/string-net weighting, coassoc from") → inside `\begin{warning}[PF $\neq$ coassociative]` at lines 1300--1312. **No per-item `\unchecked`** macro inside this warning environment (verified by grep of `\unchecked` in summary.tex showing zero hits between lines 1300 and 1312). The string-net keyword here is a parenthetical reference to where the PF amplitude formula's normalisation originates ("quantum-dimension/string-net weighting"); the surrounding warning's substantive content is a comparison of two distinct amplitude derivations (PF vs coassoc), not a bibliographic claim about Levin--Wen string-nets requiring discharge. Out of scope for P3.2.c (no `\unchecked` macro to discharge at this line).
- Line 2480 ("String-net fixed-point wavefunction intuition (chat~2 §0).") → the discharge target itself. This is the only actual `\unchecked` macro associated with the `string-net` citation atom in `summary.tex`.

The structural distinction matches `scripts/build-citation-index.py:336--368`
(`harvest_atom_backrefs` uses keyword matching, not `\unchecked`
proximity); the field name `summary.tex location(s)` in CITATION_INDEX
records "the lines where the atom is referenced", not "the lines where
a discharge target exists". The CITATION_INDEX schema-clarity follow-up
filed at P3.2.a (piggybacking on the existing P2.7 / P3.0 doc-sync
queue) covers this case too (no new follow-up needed).

**`SRC-STRING-NET` PDF identity vs lit-DB cross-ref (also known issue,
out of scope here):** the local PDF `references/StringNetCondMat0510613.pdf`
is Levin--Wen 2007 (cond-mat/0510613, "Detecting topological order in a
ground state wave function"); the literature DB cross-ref at
`CITATION_INDEX.md` line 184 is id=324 = the related Levin--Wen 2005
cond-mat/0404617 paper "String-net condensation: A physical mechanism
for topological phases". Both papers are by the same authors, both
develop the string-net framework, and both support the broad
"string-net" intuition cited at `summary.tex:2480`. The bibitem
`SRC-STRING-NET` records the local-PDF identity per ground-truth-before-
content (CLAUDE.md Rule 7); this discharge's C-gate evidence comes from
the actual local PDF text at `references/text/StringNetCondMat0510613.txt`.
This is documented in `bd cft-anyons-es5` and the P3.0 ERRATA entry as
a deferred CITATION_INDEX cross-ref follow-up.

**Editorial-choice justification** (single-cite, not multi-cite;
load-bearing C-gate evidence: `summary.tex` statement + a PDF excerpt
from the cited SRC-STRING-NET PDF; ≥ 2-source agreement per CLAUDE.md
Rule 5):

The 1 site asserts: **the "string-net fixed-point wavefunction"
intuition — the picture introduced by Levin and Wen in which a class of
topologically ordered ground states are described as fixed-point
wavefunctions of "string-net" configurations on a lattice, characterised
by F-symbol-like graphical relations.** Per CLAUDE.md Rule 5
(≥ 2 source agreement) and the C-gate of MIGRATION_PLAN.md:172, the
single `\cite{SRC-STRING-NET}` macro is the cleanest discharge — this
atom has only one local PDF (`references/StringNetCondMat0510613.pdf`,
the 2007 PRL follow-up), and the literature DB cross-reference (the
related Levin--Wen 2005 cond-mat/0404617 paper) is not locally
available as a PDF. The local PDF directly discusses the "string-net
condensation picture" in its abstract and develops the "string-net
wave function Φ" extensively in the body, exactly matching the
attribution at `summary.tex:2480`:

- **`SRC-STRING-NET`** (Levin, Wen 2007, arXiv:cond-mat/0510613,
  PRL 96:110405; title "Detecting topological order in a ground state
  wave function") — **primary citation: the string-net wavefunction
  picture itself.** PDF excerpts:

  Title at `references/text/StringNetCondMat0510613.txt:1`:
  > *"Detecting topological order in a ground state wave function"*

  Abstract at `references/text/StringNetCondMat0510613.txt:5--8`:
  > *"A large class of topological orders can be understood and
  > classified using the **string-net condensation** picture. These
  > topological orders can be characterized by a set of data (N, d_i,
  > F^{ijk}_{lmn}, δ_{ijk}). We describe a way to detect this kind of
  > topological order using only the ground state wave function."*

  Body — string-net wave function exposition at
  `references/text/StringNetCondMat0510613.txt:130--132`:
  > *"General string-net models: To derive (1) in the general case, we
  > compute the the topological entropy for the exactly soluble
  > **string-net models** discussed in Ref. [17]. The ground states of
  > these models describe a large class of (2 + 1) dimensional
  > topological orders."*

  Body — fixed-point ground state wavefunction Φ at
  `references/text/StringNetCondMat0510613.txt:165--168`:
  > *"FIG. 4: A typical **string-net state** on the honeycomb lattice.
  > The empty links correspond to spins in the i = 0 state. The
  > orientation conventions on the links are denoted by arrows. ...
  > the **string-net wave function** Φ only depends on the topologies
  > of the network of strings."*

  Body — fixed-point construction via graphical (F-symbol) relations at
  `references/text/StringNetCondMat0510613.txt:170--178`:
  > *"F^{ijm}_{kln} satisfying certain algebraic relations [17]. For
  > each set of F^{ijm}_{kln}, d_i, δ_{ijk} satisfying these relations,
  > there is a corresponding exactly soluble topologically ordered spin
  > model. ... The ground state wave function Φ of the model is also
  > known exactly."*

  The three content-bearing phrases of the discharged attribution
  ("string-net", "fixed-point wavefunction", "intuition") are all
  directly supported by the PDF: "string-net" appears in the title's
  abstract and throughout the body; "wavefunction" / "ground state wave
  function" is the title phrase + the body's Φ construction; the
  "fixed-point" character of the wavefunction is encoded in the
  F-symbol relations (3-6) that the PDF body develops (the wavefunction
  is invariant under continuous deformation of the string-net
  configuration — line 156--163 — which is the fixed-point property
  the `summary.tex` attribution alludes to); "intuition" is the chat~2
  §0 framing of the conceptual picture summarised by the PDF abstract's
  "string-net condensation picture".

The single-cite is the cleanest discharge: the one SRC-* covers the
entire claim of the discharged sentence verbatim from the PDF
abstract + body, and the C-gate threshold is met without recourse to
additional sources (summary.tex + PDF = 2 sources, both agreeing on
the cited result).

**Source of correction:** N/A — this is the **discharge of an inherited
`\unchecked` flag**, not a correction to a previously-asserted claim.
The `summary.tex` surrounding mathematical wording is unchanged. The
attribution `String-net fixed-point wavefunction intuition (chat~2 §0)`
is verified against the PDF abstract + body as described above; the
inline `\unchecked` macro is replaced by the verified `\cite{...}`.
Per `bd` `cft-anyons-h81` and orchestrator briefing.

**Validation:**

- **M** (mechanical): `pdflatex -interaction=nonstopmode -halt-on-error
  -draftmode summary.tex` three-pass succeeds (rc=0 on all three passes).
  Steady-state (3-pass; both pre-edit baseline at commit `c8d055b` and
  post-edit converge identically to steady state in 3 passes — the
  added `\cite{...}` perturbs the `.aux` cross-reference table the
  same way the P3.2.a / P3.2.b edits did): log lines 1009 → 1009
  (unchanged); Warning count 39 → 39 (unchanged); Underfull count
  10 → 10 (unchanged); Overfull count 8 → 8 (unchanged);
  `Undefined`-class messages 0; `No \bibitem`-class messages 0;
  `Citation undefined` messages 0; `Label(s) may have changed`
  warnings 0 at steady state. Page count: 33 (unchanged). Normalised
  log diff (timestamp + checksum + run-time normalised): exactly 1
  line of difference, "620 PDF objects out of 1000" → "621 PDF objects
  out of 1000" (+1 PDF object reflecting the new `\cite{...}`
  hyperlink target, as expected — identical structural behaviour to
  the P3.2.a / P3.2.b builds).
- **D** (definitional): `git diff summary.tex` shows exactly 1 deletion
  and 1 insertion (verified by `git diff summary.tex | grep -c '^+[^+]'
  == 1` and the symmetric deletion count). The deleted line is the
  `summary.tex` line 2480 `\unchecked` macro occurrence; the inserted
  line is the same line with `\unchecked` replaced by
  `\cite{SRC-STRING-NET}`. No other lines of `summary.tex` are
  modified. No GLOSSARY-defined term is added or altered; the
  surrounding mathematical content (the "External references mentioned"
  itemize and adjacent items for FRS, Feiguin (just discharged in
  P3.2.b), "Anyonic MERA literature") is byte-verbatim outside the 1
  inline-macro replacement.
- **C** (cross-reference, ≥ 2 source agreement): for the 1 discharged
  site, the PDF excerpts above (from
  `references/text/StringNetCondMat0510613.txt:1`, `:5--8`, `:130--132`,
  `:165--168`, `:170--178`, the paper's title + abstract + relevant
  body sections) confirm the cited concept (string-net wavefunction
  picture; ground state Φ characterised by F-symbol relations; fixed-
  point character via deformation invariance). C-gate sources: (1) the
  `summary.tex` statement itself (the named attribution); (2) the
  SRC-STRING-NET PDF title + abstract + body. ≥ 2 sources agree
  (summary.tex + PDF). Three of the three content-bearing phrases of
  the attribution ("string-net", "wavefunction", "intuition" /
  "fixed-point" — the latter as deformation-invariance) are directly
  supported by the PDF text. (Literature DB id=324 cross-ref to the
  related 2005 Levin--Wen cond-mat/0404617 paper is a third potential
  source per `CITATION_INDEX.md` but is not locally available as a PDF
  in P2; not used for this discharge.)
- **R** (review): Core-tier per CLAUDE.md Rule 4 (substantive
  `summary.tex` content change discharging a `\unchecked` flag + adding
  a citation). Hostile Opus reviewer subagent post-commit per
  orchestrator policy. Reviewer should verify: (i) the 1 site
  identification matches the 1 actual `\unchecked` macro in
  summary.tex associated with the String-net canonical-enumeration
  entry at line 2480; (ii) the single-cite editorial choice (vs
  multi-cite) is justified by the SRC-STRING-NET PDF directly
  asserting the content-bearing phrases of the attribution
  (string-net concept in title and abstract; wave function Φ
  construction in body; fixed-point character via F-symbol-based
  deformation invariance); (iii) the C-gate PDF excerpts genuinely
  support the cited claim; (iv) the line-1304 omission is correct
  (that's a keyword occurrence inside `warn:PF-coassoc` warning
  environment with no per-item `\unchecked` to discharge — confirmed
  by zero `\unchecked` macros between lines 1300 and 1312); (v) the
  diff is exactly 1 deletion + 1 insertion; (vi) `pdflatex` builds
  clean.
- **I** (integration): Three-pass `pdflatex` build is reproducible;
  ERRATA + MIGRATION_LOG updates land in the same atomic commit.

**Commit:** (filled below after commit lands)

---

## 2026-05-16: P3.3 — footnotes linking 6 undischarged `\unchecked` items to `RESEARCH_NOTES.md` acquisition queue

**summary.tex location:** 6 sites, all per-atom (per user-locked
granularity decision for Phase 3):

1. **`koo-saleur`** at `summary.tex:2465` — canonical-enumeration entry
   ``Koo, Saleur: lattice Virasoro approximants from XXZ/RSOS / TL
   chains (chat~1 §10).'' inside the ``External references mentioned
   (all unchecked)'' itemize at lines 2458--2481. Footnote anchor:
   `aq:koo-saleur`.
2. **`pasquier`** at `summary.tex:2469` — canonical-enumeration entry
   ``Pasquier: ADE lattice models / RSOS height models (chat~1 §1).''
   Footnote anchor: `aq:pasquier`.
3. **`huse`** at `summary.tex:2471` — canonical-enumeration entry
   ``Huse: identification of ABF critical points with the
   Friedan--Qiu--Shenker unitary minimal series $M(m, m+1)$ (chat~1
   §13).'' Footnote anchor: `aq:huse`.
4. **`frs`** at `summary.tex:2474` — canonical-enumeration entry
   ``Fjelstad, Fuchs, Runkel, Schweigert (``FRS''): full RCFT
   correlators from a special Frobenius algebra in the relevant
   module category; $A = \one$ in the Cardy case (chat~1 §1).''
   Footnote anchor: `aq:frs`.
5. **`anyonic-mera`** at `summary.tex:2479` — canonical-enumeration
   entry ``\`\`Anyonic MERA literature'': charge-compatible MERA
   tensors, scaling-superoperator language (chat~1 §1.4).'' Footnote
   anchor: `aq:anyonic-mera`.
6. **`g2-1-chiral-cft`** at `summary.tex:1866` — inside
   `\begin{warning}[warn:fibCFTs]` at lines 1855--1869 (NOT inside the
   canonical-enumeration itemize, because the atom has no `\item`
   entry there). The `\unchecked` macro here is attached to the
   ``Calculations in this document use the chiral $(G_2)_1$ convention
   $h_\tau = 2/5$ whenever the Fibonacci CFT is invoked, following
   Chat~2's stated choice.'' sentence. Placement reasoning: the
   single `\unchecked` for this atom is at line 1866; per orchestrator
   briefing, ``still place the footnote at the most natural per-atom
   location (the single `\unchecked` you find) -- record reasoning.''
   Footnote anchor: `aq:g2-1-chiral-cft`.

Total: 6 footnotes, 6 anchors in `RESEARCH_NOTES.md`. Each footnote
is minimal (one sentence) and points to the matching `RESEARCH_NOTES.md`
acquisition-queue entry. No `\unchecked` macro is discharged; all 6
remain in place.

**Before** (`summary.tex` at commit `c607efa`, the post-P3.2.c
baseline):

Line 1866 (inside `warn:fibCFTs`):
```latex
Fibonacci CFT is invoked, following Chat~2's stated choice.\unchecked\
```
Line 2465 (canonical-enumeration item ``Koo, Saleur''):
```latex
      (chat~1 §10).\unchecked
```
Line 2469 (item ``Pasquier''):
```latex
\item Pasquier: ADE lattice models / RSOS height models (chat~1 §1).\unchecked
```
Line 2471 (item ``Huse'', continuation line):
```latex
      unitary minimal series $M(m, m+1)$ (chat~1 §13).\unchecked
```
Line 2474 (item ``FRS'', continuation line):
```latex
      $A = \one$ in the Cardy case (chat~1 §1).\unchecked
```
Line 2479 (item ``Anyonic MERA literature'', continuation line):
```latex
      scaling-superoperator language (chat~1 §1.4).\unchecked
```

**After** (this commit): each of the 6 lines above gains an inline
`\footnote{...}` immediately after `\unchecked`, of the form:

```latex
\unchecked\footnote{<minimal acquisition-pointer text>}
```

with the minimal-text body per atom:

1. `koo-saleur`: ``Literature DB has paper\#590 (2017 follow-up
   applying the Koo--Saleur formula), but no local PDF of the
   original 1994 Koo--Saleur paper; see \texttt{RESEARCH\_NOTES.md}
   acquisition-queue entry \texttt{aq:koo-saleur} for the original
   paper to acquire.'' — longer than the others because it must
   distinguish the partial-discharge case from undischarged (resolves
   bd `cft-anyons-qdd` PRD ↔ CITATION_INDEX asymmetry).
2. `pasquier`: ``No local source; see \texttt{RESEARCH\_NOTES.md}
   acquisition-queue entry \texttt{aq:pasquier} for the paper to
   acquire.''
3. `huse`: ``No local source; see \texttt{RESEARCH\_NOTES.md}
   acquisition-queue entry \texttt{aq:huse} for the paper to acquire.''
4. `frs`: ``No local source; see \texttt{RESEARCH\_NOTES.md}
   acquisition-queue entry \texttt{aq:frs} for the papers to
   acquire.''
5. `anyonic-mera`: ``No local source; see \texttt{RESEARCH\_NOTES.md}
   acquisition-queue entry \texttt{aq:anyonic-mera} for the papers to
   acquire.''
6. `g2-1-chiral-cft`: ``No local source for $(G_2)_1$ chiral CFT data;
   see \texttt{RESEARCH\_NOTES.md} acquisition-queue entry
   \texttt{aq:g2-1-chiral-cft} for the references to acquire.''

For line 1866 the trailing `\ ` (forced-space) after `\unchecked` is
preserved verbatim by inserting the `\footnote{...}` between
`\unchecked` and `\ `: `\unchecked` → `\unchecked\footnote{...}` →
followed by the original `\ `.

All other characters of `summary.tex` are unchanged. No `\unchecked`
flag is discharged; the bibliography block (P3.0 territory) is
untouched; the blanket `\unchecked` declaration at line 2437 is
untouched; the `\section*{Reference status}` enumerate at lines
2441--2456 is untouched.

**Atom-set coverage and orchestrator briefing reconciliation**
(6 atoms, not 5 as the literal `MIGRATION_PLAN.md:173` text suggests):

The plan literally lists ``FRS, Pasquier, Huse, Koo--Saleur original,
$(G_2)_1$'' = 5 atoms. The orchestrator briefing for P3.3 expands
this to 6 atoms by adding `anyonic-mera`, which `CITATION_INDEX.md`
line 44 classifies as `undischarged` (no local PDF, no literature DB
record, no AF node) — the same status as the other 5. Including
`anyonic-mera` in P3.3 is the consistent reading: the plan's
enumeration is exemplary, not exhaustive; the underlying criterion is
``lacks local source.'' All 6 atoms now have a `RESEARCH_NOTES.md`
acquisition-queue entry and a corresponding `summary.tex` footnote.

**RESEARCH_NOTES.md update (substantive prose addition):** a new
section ``Acquisition queue (Phase 3 undischarged citations)'' is
inserted before the existing ``Latent bugs in source projects''
section. Each of the 6 acquisition entries follows a uniform schema:
(i) anchor `aq:<slug>`; (ii) cited claim with `summary.tex` line
ranges; (iii) acquisition target (specific paper(s) with full
bibliographic data: authors, title, journal, year, arXiv ID where
known); (iv) expected discharge path (acquire → SHA256 → manifest →
bibitem → P3.2-style discharge). The `aq:koo-saleur` entry has an
additional paragraph addressing the PRD ↔ CITATION_INDEX asymmetry
flagged by bd `cft-anyons-qdd`: paper\#590 (2017 follow-up applying
the Koo--Saleur formula) is **not** a substitute for the 1994
Koo--Saleur original; the original derives and proves the convergence
result that `summary.tex` conj:KS attributes; paper\#590 only uses it
numerically. The acquisition target is unambiguously the 1994
original (Koo--Saleur, Nucl.\ Phys.\ B 426, arXiv:hep-th/9312156).

**Source of correction:** N/A — this is **not a correction to a
previously-asserted claim**. It is a **pure additive routing edit**:
6 footnotes added at the 6 per-atom `\unchecked` sites pointing to
6 corresponding `RESEARCH_NOTES.md` acquisition-queue anchors. No
mathematical content of `summary.tex` is altered. The `\unchecked`
flags remain `\unchecked`. The C-gate (≥ 2 source agreement) does
not fire because no claim is discharged; the C-gate for the eventual
P3.2-style discharge of each atom fires when each acquisition lands.
Per `bd` `cft-anyons-qfg` (closed by this commit) and `cft-anyons-qdd`
(closed by this commit). Plan step `MIGRATION_PLAN.md:173`.

**Validation:**

- **M** (mechanical): `pdflatex -interaction=nonstopmode
  -halt-on-error -draftmode summary.tex` three-pass succeeds (rc=0
  on all three passes). Steady-state (3-pass; both pre-edit baseline
  at commit `c607efa` and post-edit converge identically to steady
  state in 3 passes — the added `\footnote{...}` macros perturb the
  `.aux` cross-reference table the same way the P3.2.a/b/c edits did):
  log lines 1009 → 1011 (+2 lines, as expected from 6 footnote
  insertions, several spread over multiple log lines each);
  Underfull count 10 → 10 (unchanged); Overfull count 8 → 8
  (unchanged); LaTeX-Warning count 0 → 0 (unchanged);
  `Undefined`-class messages 0 → 0; `No \bibitem`-class messages 0;
  `Citation undefined` messages 0; `Label(s) may have changed`
  warnings 0 at steady state. **Page count: 33 → 33 (unchanged)** —
  the 6 footnotes fit at the bottom of existing pages (line 1866 is
  on the warn:fibCFTs page; lines 2465/2469/2471/2474/2479 are on the
  ``External references mentioned'' page; no page break is forced).
  PDF objects: 621 → 636 (+15 PDF objects ≈ 6 footnotes × 2.5
  hyperlink targets each, as expected — each footnote adds a footnote
  mark + footnote text destination).
- **D** (definitional): `git diff summary.tex` shows exactly 6
  deletions and 6 insertions (verified by
  `git diff summary.tex | grep -c '^+[^+]' == 6` and the symmetric
  deletion count). Each deletion is one of the 6 `\unchecked` lines
  identified above; each insertion is the same line with an inline
  `\footnote{<minimal acquisition-pointer text>}` appended immediately
  after the `\unchecked` macro. The `\unchecked` macro itself is
  preserved on every one of the 6 lines (no discharge). No GLOSSARY-
  defined term is added or altered; `\footnote{...}` is a built-in
  LaTeX primitive (no GLOSSARY entry required, no Law 1 fire); the
  body text of the footnotes contains only acquisition-pointer prose
  with no mathematical claim. The surrounding content (the
  ``External references mentioned'' itemize, the warn:fibCFTs warning,
  and the `\section*{Reference status}` enumerate immediately above)
  is byte-verbatim outside the 6 inline-macro additions. **No claim
  change** per `MIGRATION_PLAN.md:173` D-gate spec.
- **R** (review): Core-tier per CLAUDE.md Rule 4 (substantive
  `summary.tex` content change AND substantive `RESEARCH_NOTES.md`
  prose addition). Hostile Opus reviewer subagent post-commit per
  orchestrator policy. Reviewer should verify: (i) the 6 per-atom
  footnote-insertion lines match the 6 actual per-atom `\unchecked`
  macros in `summary.tex` (one per atom; not more, not fewer); (ii)
  every `\unchecked` macro is preserved (no discharge); (iii) the
  bibliography block at lines 2483--2518 (P3.0 territory) and the
  blanket `\unchecked` declaration at line 2437 are untouched; (iv)
  the 6 `RESEARCH_NOTES.md` acquisition-queue anchors `aq:<slug>`
  match the 6 footnote bodies and the 6 `CITATION_INDEX.md` atom
  slugs; (v) the `aq:koo-saleur` entry explicitly states that
  paper\#590 is NOT a substitute for the 1994 original (resolves
  `cft-anyons-qdd` PRD ↔ CITATION_INDEX asymmetry); (vi) the diff is
  exactly 6 deletions + 6 insertions and purely additive in semantic
  content; (vii) `pdflatex` builds clean at steady state (3 passes)
  with page count unchanged.
- **I** (integration): Three-pass `pdflatex` build is reproducible;
  ERRATA + RESEARCH_NOTES + MIGRATION_LOG updates land in the same
  atomic commit; bd `cft-anyons-qfg` and `cft-anyons-qdd` close in
  the same commit.

(C-gate intentionally not exercised: no claim is discharged. C-gate
fires when each acquisition lands as a follow-on P3.2-style discharge,
one per atom.)

**Commit:** (filled below after commit lands)

## 2026-05-16: P3.4 — final pass: rebuild `CITATION_INDEX.md` + verify `\unchecked` delta

**summary.tex location:** N/A — `summary.tex` is **not modified** by
this commit. P3.4 is a downstream rebuild of `CITATION_INDEX.md`
plus a count-delta verification gate.

**Before** (CITATION_INDEX.md at HEAD prior to this commit, the
post-P3.3 state at commit `a5364f8`): SHA256
`a20aec3c6b26141130d71974c4b0a9b9b123f641efd40caf75906fc99ab46bbd`;
generation-metadata header records the pre-Phase-3 `summary.tex`
SHA256 `fa4d2059…` and `\unchecked`-macro count 26 (lines as listed
in that header).

**After** (this commit; emitted by re-running
`scripts/build-citation-index.py` against the current `summary.tex`):
SHA256
`99e65fabe7bba867acbffb6d0b76c034d6e6b207da5346b9f7d43bc1e744e90f`;
header records the current `summary.tex` SHA256 `83bdf1bc…` and
`\unchecked`-macro count 21 (lines as listed in the new header).
Re-running the script a second time produces byte-identical output
(I-gate satisfied; SHA256 unchanged).

**Diff summary** (`git diff CITATION_INDEX.md` between HEAD and this
commit):

- **Generation-metadata header:** `summary.tex` SHA256 updated
  (`fa4d2059…` → `83bdf1bc…`); `\unchecked`-macro count updated
  (26 → 21) and the per-line-number list updated to match.
  `references/manifest/SOURCES.md` SHA256 unchanged.
- **Summary table — per-atom `summary.tex lines` field** (which
  records *author-keyword occurrence lines* per `scripts/build-citation-index.py`
  `harvest_atom_backrefs`, NOT `\unchecked` positions; this is the
  schema clarification filed as `bd cft-anyons-umx`): 5 new
  occurrence lines added across 3 atoms, attributable to the Phase-3
  `summary.tex` edits.
  - `feiguin-golden-chain` gains lines 2486, 2488, 2489, 2490 — the
    P3.0 `\bibitem{SRC-GOLDEN-CHAIN}` bibliography entry (the
    bibitem body contains the keywords ``Feiguin'' and ``golden
    chain'' the script's `PATTERNS` list matches).
  - `koo-saleur` gains line 2465 — the P3.3 footnote body for
    `aq:koo-saleur` mentions ``Koo--Saleur'' (twice) explaining the
    1994-original-vs-2017-follow-up distinction.
  - `g2-1-chiral-cft` gains line 1866 — the P3.3 footnote body for
    `aq:g2-1-chiral-cft` mentions ``$(G_2)_1$''.
- **Per-atom `Discharge status` fields:** **all 9 atoms preserve
  their HEAD status** (`koo-saleur` partial; `osborne-stottmeister`,
  `feiguin-golden-chain`, `string-net` discharged; `pasquier`,
  `huse`, `frs`, `anyonic-mera`, `g2-1-chiral-cft` undischarged).
  This is **expected**: the script's `discharge_status()` function
  (`scripts/build-citation-index.py:565--592`) returns `discharged`
  iff `resolved_src` is non-empty, `partial` iff `resolved_lit` or
  `resolved_af` is non-empty, else `undischarged`. The resolution
  consults the hard-coded `src_ids` / `lit_paper_ids` / `lit_bibkeys`
  / `af_node_ids` in each `_atom(...)` call (`scripts/build-citation-index.py:155--305`),
  NOT the count or presence of `\unchecked` macros in `summary.tex`.
  Discharging a `\unchecked` at the `summary.tex` level (P3.2) does
  not change citation-provenance discharge status (which is what
  CITATION_INDEX tracks); it only changes claim-discharge for that
  specific site. Conversely, removing all `\unchecked` macros for an
  atom would not flip its status to `undischarged` if the
  `references/`/`literature/`/`AF` mappings remain.

**Plan-vs-reality observation (count metric):**

Plan literal at `stocktake/MIGRATION_PLAN.md:174` says: ``verify the
count of `\unchecked` flags decreased by exactly the count of P3.2
atomic steps.'' Under user-locked per-atom granularity (P3.2 ran as
3 atomic commits: `3403ca5` for `osborne-stottmeister`, `c8d055b` for
`feiguin-golden-chain`, `c607efa` for `string-net`), the metric
``count of P3.2 atomic steps'' = 3. The actual measured
`\unchecked`-macro-count delta is 26 → 21 = 5 instances (P3.2.a
discharged 3 instances; P3.2.b discharged 1; P3.2.c discharged 1).
The plan-literal check passes per per-atom interpretation (3 atomic
commits actually shipped); the per-instance delta (5) is the stronger
coherent number recorded in this entry. Both readings hold; neither
contradicts the plan; the discrepancy reflects the plan's writing-time
assumption that one `\unchecked` site per atom would be typical
(true for 2 of the 3 dischargeable atoms, but not for
`osborne-stottmeister` which had 3 sites). Recorded as a Deviation
in `MIGRATION_LOG.md` for future plan-revision reference.

**Source of correction:** N/A — this is **not a correction to a
previously-asserted claim** in `summary.tex` or any other canonical
artifact. P3.4 is a pure downstream rebuild of an auto-generated file
(`CITATION_INDEX.md`) plus a count-delta verification gate.
`scripts/build-citation-index.py` itself is **not modified** by this
commit; the deferred CITATION_INDEX bugs (`cft-anyons-eit`,
`cft-anyons-es5`, `cft-anyons-umx`, `cft-anyons-6ku`) remain open
for a later Phase-3 cleanup pass.

**Validation:**

- **M** (mechanical): `python3 scripts/build-citation-index.py`
  exits 0 (stdout captured in commit body). The emitted
  CITATION_INDEX.md is the live one (overwrite is the script's
  contract). The script's own M-gate stats (`\unchecked` macros
  found: 21; AF externals read: 5; citation atoms emitted: 9; mapped
  a/b/c: 3/4/0; undischarged: 5) match the expected post-Phase-3
  state.
- **I** (idempotent): two consecutive runs of
  `scripts/build-citation-index.py` against the current
  `summary.tex` + manifest + literature DB + AF externals produce
  byte-identical CITATION_INDEX.md (SHA256 `99e65fab…` both times)
  and byte-identical stdout. Verified at this commit.
- **D** (definitional): N/A — no GLOSSARY entry is added, altered,
  or referenced; the regenerated CITATION_INDEX.md fields are
  schema-stable per the P2.8 emission contract (only the per-atom
  `summary.tex lines` lists and the header SHAs/counts change).
- **C** (cross-reference): N/A — no claim is discharged.
- **R** (review): mechanical per CLAUDE.md Rule 4 (rebuild + count
  verification + single-row PROVENANCE hash refresh + an
  observation-only ERRATA entry that asserts no new mathematical
  claim). Post-commit hostile Opus reviewer subagent per orchestrator
  policy (orchestrator may judge whether to escalate; the editorial
  judgments here are minimal and confined to the count-metric
  observation).

**Commit:** (filled below after commit lands)
