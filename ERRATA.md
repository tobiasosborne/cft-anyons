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
