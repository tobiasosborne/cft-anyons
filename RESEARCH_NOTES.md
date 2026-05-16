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

## Acquisition queue (Phase 3 undischarged citations)

These are the 6 `\unchecked` citation atoms from `summary.tex` for which
no local PDF exists in `references/`. Each entry records (i) what the
cited claim asserts, (ii) the paper(s) that need to be acquired, and
(iii) the expected discharge path once a local PDF lands. Footnotes in
`summary.tex` (added at P3.3, see ERRATA) link each `\unchecked` site
to the matching anchor below.

Anchor naming convention: `aq:<atom-slug>`, where `<atom-slug>` matches
the citation-atom slug in `CITATION_INDEX.md`.

### `aq:pasquier` — Pasquier: ADE lattice models / RSOS height models

**Cited claim** (`summary.tex:2469`, also referenced at lines 2305,
2453): the family of ADE lattice models (height/RSOS) introduced by
Pasquier, used as the lattice realisation underlying Fibonacci /
Temperley--Lieb / golden-chain constructions; provides the
configuration spaces that Huse later identifies with the
Friedan--Qiu--Shenker unitary minimal series (see `aq:huse`).

**Acquisition target:** V. Pasquier, *Two-dimensional critical systems
labelled by Dynkin diagrams*, Nucl.\ Phys.\ B **285** [FS19] 162--172
(1987); and the companion *Operator content of the ADE lattice
models*, J.\ Phys.\ A **20** 5707--5717 (1987). Either is sufficient
to discharge the citation, but ideally both should be in
`references/`. Not yet in the literature DB.

**Expected discharge path:** acquire PDF → SHA256 + manifest entry in
`references/manifest/SOURCES.md` → `\bibitem{SRC-PASQUIER-ADE}` in
`summary.tex` thebibliography → P3.2-style discharge of the
`\unchecked` at `summary.tex:2469` → `\cite{SRC-PASQUIER-ADE}` (and
remove the matching P3.3 footnote in the same commit). The other two
sites (2305, 2453) are blanket-coverage and out of P3.2 scope.

### `aq:huse` — Huse: ABF critical points $\leftrightarrow$ Friedan--Qiu--Shenker unitary minimal series

**Cited claim** (`summary.tex:2470--2471`, also referenced at lines
2306--2307, 2453--2454): identification of the critical points of the
Andrews--Baxter--Forrester (ABF) RSOS height models with the unitary
minimal series $M(m, m+1)$ classified by Friedan, Qiu, and Shenker.
This is what fixes the continuum CFT of the golden chain to
tricritical Ising $M(4,5)$ for the $\widehat{su(2)}_3$ /
Fibonacci-related case.

**Acquisition target:** D. A. Huse, *Exact exponents for infinitely
many new multicritical points*, Phys.\ Rev.\ B **30** 3908--3915
(1984). Also relevant (and currently absent): D. Friedan, Z. Qiu,
S. Shenker, *Conformal invariance, unitarity, and critical exponents
in two dimensions*, Phys.\ Rev.\ Lett.\ **52** 1575--1578 (1984) for
the unitary-minimal-series classification side of the identification.
Neither is in the literature DB.

**Expected discharge path:** acquire either Huse alone (sufficient for
the identification claim) or the Huse + Friedan--Qiu--Shenker pair
(stronger; discharges both halves of the assertion) → SHA256 +
manifest entries → bibitems `SRC-HUSE-ABF` and (if FQS acquired)
`SRC-FQS-MINIMAL` → P3.2-style discharge at `summary.tex:2471`.

### `aq:frs` — Fjelstad--Fuchs--Runkel--Schweigert (``FRS''): full RCFT correlators from a special Frobenius algebra; $A = \one$ in the Cardy case

**Cited claim** (`summary.tex:2472--2474`, also referenced at lines
100, 497, 515, 2308, 2451): the FRS reconstruction of rational CFT
correlators on arbitrary world-sheets from a symmetric special
Frobenius algebra object $A$ in a modular tensor category, with the
specialisation that $A = \one$ recovers the Cardy (diagonal) case.
Used in `summary.tex` as an analogy for the role of algebra objects
in the categorical refinement story; explicitly NOT claimed
equivalent to the dagger-special structure used here (see
`summary.tex` warn:not-Frobenius at line 511, and CLAUDE.md
hallucination-risk callout on ``dagger-special $\neq$
Frobenius-special'').

**Acquisition target:** any of the FRS series is acceptable as
discharge; the canonical entry-point is J. Fjelstad, J. Fuchs,
I. Runkel, C. Schweigert, *TFT construction of RCFT correlators V:
Proof of modular invariance and factorisation*, Theor.\ Appl.\ Categ.\
**16** 342--433 (2006), arXiv:hep-th/0503194. The companion paper
J. Fuchs, I. Runkel, C. Schweigert, *TFT construction of RCFT
correlators I: Partition functions*, Nucl.\ Phys.\ B **646**
353--497 (2002), arXiv:hep-th/0204148 contains the algebra-object
formalism and the Cardy-case ($A = \one$) statement most directly.
Neither is in the literature DB.

**Expected discharge path:** acquire PDF(s) → SHA256 + manifest entry
→ bibitem(s) (e.g.\ `SRC-FRS-I`, optionally `SRC-FRS-V`) → P3.2-style
discharge at `summary.tex:2474`. Per CLAUDE.md callout, the discharge
must preserve `warn:not-Frobenius` and not assert FRS-style
Frobenius-specialness for the dagger-special algebras used here.

### `aq:anyonic-mera` — ``Anyonic MERA literature'': charge-compatible MERA tensors, scaling-superoperator language

**Cited claim** (`summary.tex:2478--2479`, also referenced at line
2310): the body of literature extending the Multi-scale Entanglement
Renormalisation Ansatz (MERA) to anyonic / charge-compatible tensors
with scaling-superoperator analysis of fixed-point scale invariance.
Bibliographic pointer rather than a named result: `summary.tex`
defers to a body of literature without specific attribution.

**Acquisition target:** the canonical entry-point papers are
R. N. C. Pfeifer, G. Evenbly, G. Vidal, *Entanglement renormalization,
scale invariance, and quadratic gauge transformations*, Phys.\ Rev.\
A **82** 050301(R) (2010), arXiv:1006.1278 (general MERA scaling
superoperator); and A. J. Ferris, *Fourier transform for fermionic
systems and the spectral tensor network*, Phys.\ Rev.\ Lett.\ **113**
010401 (2014), arXiv:1310.7605, or N. Bultinck, M. Mariën,
D. J. Williamson, M. B. Şahinoğlu, J. Haegeman, F. Verstraete,
*Anyons and matrix product operator algebras*, Annals Phys.\ **378**
183--233 (2017), arXiv:1511.08090 (charge-compatible / anyonic MERA-
adjacent constructions). Because `summary.tex` cites a body of
literature rather than a specific paper, the acquisition target is
flexible: any 1--2 of these (or equivalent canonical works such as
Pfeifer--Buerschaper--Trebst--Troyer--Aguado--Vidal 2012 on Fibonacci
MERA, arXiv:1006.3532) suffices.

**Expected discharge path:** acquire 1--2 representative PDFs →
SHA256 + manifest entries → bibitem(s) (e.g.\
`SRC-MERA-SCALING-SUPEROP`, `SRC-ANYONIC-MERA`) → P3.2-style discharge
at `summary.tex:2479`. The discharged text should preserve the
``literature'' framing of the original attribution rather than upgrade
it to a single-paper claim.

### `aq:g2-1-chiral-cft` — $(G_2)_1$ chiral CFT: $c = 14/5$, primary $h_\tau = 2/5$, Fibonacci modular data

**Cited claim** (`summary.tex:1866`, also referenced at lines 1858,
1865, 1867, 1888, 1944, 2272, 2442): the chiral conformal field
theory $(G_2)_1$ (level-1 affine $G_2$) has central charge $c = 14/5$
and a single non-trivial primary of conformal weight $h_\tau = 2/5$,
with the modular data ($S$ and $T$ matrices) of the Fibonacci fusion
category. Used in `summary.tex` warn:fibCFTs to distinguish the
``chiral $(G_2)_1$'' meaning of ``Fibonacci CFT'' from the
``antiferromagnetic golden chain $\to M(4,5)$'' meaning.

**Acquisition target:** the standard primary source is
P. Goddard, A. Kent, D. Olive, *Virasoro algebras and coset space
models*, Phys.\ Lett.\ B **152** 88--92 (1985) for the level-1 WZW
central-charge formula (giving $c[(G_2)_1] = 14/5$ via
$c = k \cdot \dim\mathfrak g / (k + h^\vee)$ with $k = 1$,
$\dim G_2 = 14$, $h^\vee_{G_2} = 4$); plus any standard exposition of
the Fibonacci modular data via the truncation
$\widehat{su(2)}_3 \to (G_2)_1$ (e.g.\ Di Francesco--Mathieu--Sénéchal
Ch.\ 18 / 17, *Conformal Field Theory* Springer 1997 — book; or
J. Fuchs, *Affine Lie Algebras and Quantum Groups*, Cambridge 1992).
None of these is in the literature DB.

**Expected discharge path:** acquire 1--2 PDFs (or extract relevant
chapters from a textbook scan) → SHA256 + manifest entry → bibitem
`SRC-G2-1-CHIRAL-CFT` (or split: `SRC-GKO-COSETS` + a Fibonacci-data
source) → P3.2-style discharge at `summary.tex:1866`. The discharged
text should preserve the warn:fibCFTs distinction between the two
``Fibonacci CFT'' meanings.

### `aq:koo-saleur` — Koo, Saleur: lattice Virasoro approximants from XXZ/RSOS / TL chains (1994 original)

**Cited claim** (`summary.tex:2464--2465`, also referenced at lines
1729, 1731, 1737, 1768, 2302, 2314, 2375, 2377, 2381, 2446, 2466):
the Koo--Saleur lattice approximants $L_n^{\mathrm{latt}}$ to the
Virasoro generators built from local densities of the
XXZ / RSOS / Temperley--Lieb chains, with the convergence claim that
these reproduce (in a suitable scaling limit) the continuum Virasoro
algebra at the appropriate central charge. The asserted convergence
result is the core technical ingredient behind
`summary.tex` conj:KS.

**PRD ↔ CITATION_INDEX asymmetry (resolved here per bd
`cft-anyons-qdd`):** the PRD §Known limitations lists ``Koo--Saleur
1994 original'' as undischarged; the `CITATION_INDEX.md` summary
table marks the `koo-saleur` atom as `partial` discharge because
literature/db has `paper#590` (arXiv:1706.01436, ``Extraction of
conformal data in critical quantum spin chains using the Koo--Saleur
formula'', 2017). Both classifications are internally coherent —
paper\#590 is a 2017 follow-up that *uses* the Koo--Saleur formula
numerically, not the 1994 paper that *derives and proves* it. **For
the convergence claim cited at `summary.tex:2465` (and conj:KS), the
1994 Koo--Saleur original is the acquisition target; paper\#590 is
NOT a substitute** because it does not contain the convergence proof
or the original lattice-Virasoro derivation that the citation
attribution names.

**Acquisition target:** W. M. Koo, H. Saleur, *Representations of the
Virasoro algebra from lattice models*, Nucl.\ Phys.\ B **426**
459--504 (1994), arXiv:hep-th/9312156. The closely related
H. Saleur, M. Bauer, *On some relations between local height
probabilities and conformal invariance*, Nucl.\ Phys.\ B **320**
591--624 (1989) and the original Koo--Saleur lattice-Virasoro
construction in W. M. Koo, *Doctoral thesis*, Yale University (1992)
are background, not direct substitutes. The 1994 paper is the
canonical citation.

**Expected discharge path:** acquire 1994 PDF → SHA256 + manifest
entry → bibitem `SRC-KOO-SALEUR-1994` → P3.2-style discharge at
`summary.tex:2465` → `\cite{SRC-KOO-SALEUR-1994}` (and remove the
matching P3.3 footnote in the same commit). Once acquired, the
existing `paper#590` (2017 follow-up) can be added as a supporting
multi-cite (analogous to the P3.2.a `osborne-stottmeister`
multi-cite pattern), and the CITATION_INDEX atom status moves from
`partial` to `discharged`. The PRD ↔ CITATION_INDEX asymmetry
collapses at that point.

---

## Latent bugs in source projects

### LB-1: MMA `enumerate_fusion_trees` is incomplete for non-multiplicity-free fusion categories

**Source:** `microscopic-mobile-anyons/src/MobileAnyons/hilbert.jl:42-68` (function `enumerate_fusion_trees`).

**Bug:** Line 58 checks `iszero(dim Hom(S[current_charge] ⊗ S[labels[k]], S[s]))` as a Boolean gate; when `dim Hom > 1` (multiplicity > 1 in the fusion category), the function still pushes only one intermediate index per channel rather than enumerating the `dim Hom` distinct multiplicity-vertex basis vectors. Result: fusion-tree basis is **undercounted** by the product of multiplicities along the tree.

**Bite radius:** Invisible for Fibonacci, Ising, and sVec (all multiplicity-free; every `dim Hom` ≤ 1). Triggered the moment MMA is extended to e.g. extended Haagerup or quantum groups at non-prime levels.

**Status:** Latent; blocked by Phase 8 (MMA Julia backend migration). Fix during P8.4 when porting `hilbert.jl`; add a `# TODO multiplicity-free assumption` marker per the recommendation in §7 of `stocktake/reports/opus-hilbert-bridge.md`. After Phase 8, file as its own bd ticket to extend `enumerate_fusion_trees` to general fusion categories.

**bd ticket:** *(filed in the same commit as this entry; see issues.jsonl)*

**Source of finding:** `stocktake/reports/opus-hilbert-bridge.md` §3.5.
