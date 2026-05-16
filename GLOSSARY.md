# GLOSSARY — cft-anyons

<!--
ROLE: The definitional bedrock. Every term used in any canonical artifact
      (summary.tex, Formalisation/, src/, scripts/, prose docs) must have
      an entry here. Per CLAUDE.md Law 1, adding mathematical content
      that uses a term not yet in GLOSSARY is forbidden.
UPDATE POLICY: New entries appended; existing entries updated only via
      atomic commits with explicit cross-references to every affected
      file. Removing or renaming a term is a CROSS-FILE change requiring
      a Core-tier commit (hostile review).
TRIGGER: Any new term encountered in any addition; any aliased term in
      the source projects; any term flagged by a hallucination-risk
      callout in CLAUDE.md.
-->

## Status

**P1.1:** populated by mechanical extraction of every `\begin{definition}`
and `\begin{convention}` in `summary.tex` (4 conv + 44 def = 48
entries). "Canonical" payloads are copied **verbatim** (full environment,
from `\begin{...}` through `\end{...}`) inside ```latex code fences to
preserve LaTeX syntax exactly. "Source" gives the `\begin{...}` line in
`summary.tex`.

**P1.2:** ERRATA entry for the `lem:binary-Z` amplitudes-vs-probabilities
bug (no `summary.tex` edit — the `\sqrt{}` fix was pre-baseline; see
`ERRATA.md`). No GLOSSARY change.

**P1.3 (this commit):** added one entry from **outside `summary.tex`**:
`def:mobile-Fock`, the MMA Hilbert-space formulation, sourced from
`stocktake/reports/opus-hilbert-bridge.md` (the in-repo authoritative
description of MMA's framing; MMA itself imports in Phase 8). Declared
the partition formulation [[def:HP]] as canonical (already so from P1.1;
re-affirmed in the new entry's cross-references). Added cross-links in
[[def:HP]], [[def:Hlatt]], [[def:indlim]] Notes so the four-way
relationship is explicit. Translation-map fields stubbed "TBD pending
P1.5" per the plan.

Remaining Phase 1 work that populates stub fields:

- **P1.5:** write the explicit translation map (already de-risked: bridge
  report §2 has constructive bijections in both directions for all three
  formulations).
- **P1.6:** new `CONVENTIONS.md` entries derived from but not literally
  identical to `summary.tex` conventions (vacuum index, F-matrix gauge,
  multiplicity-free assumption, fusion-tree ordering, `N=0` boundary,
  etc.).
- **P1.7:** CAD-Lean translation map (per-file mapping in
  `stocktake/reports/cad-lean.md` §5).
- **P1.8:** MMA-Julia translation map (per `stocktake/reports/mma-julia.md` §5).
- **P1.9:** definitional-gate audit (Opus subagent reads this file
  end-to-end and flags any undefined term or internal inconsistency).

Lemmas, propositions, theorems, corollaries, remarks, warnings, and
examples in `summary.tex` are **not** in scope for P1.1 — only
`\begin{definition}` and `\begin{convention}` environments.

## Schema for each entry

```
## <label> — <term name>

**Canonical:**
\`\`\`latex
\begin{definition}[<term name>]\label{<label>}
<body, verbatim>
\end{definition}
\`\`\`

**Source:** `<tracked-file>:<line>` (typically `summary.tex:<line>` for
  entries from §A; for entries from external sources in §B, the source
  is an in-repo report or imported file)
**Aliases:** <synonyms used in MMA, CAD, or the literature; or TBD>
**Translation map:**
  - MMA: <equivalent or "TBD pending P1.8">
  - CAD: <equivalent or "TBD pending P1.7">
  - other: <…>
**Notes:** <pitfalls, related GLOSSARY entries via [[label]], etc.>
```

The entries are split into two sections:

- **§A. Entries from `summary.tex`** — ordered by source-line in
  `summary.tex`. Canonical payloads copied verbatim from
  `\begin{definition}` / `\begin{convention}` environments.
- **§B. Entries from outside `summary.tex`** — added when an
  external-but-load-bearing definition must be in GLOSSARY before its
  source project is imported (e.g. MMA's mobile-Fock framing imported
  for P1.3, before MMA itself imports in Phase 8). Each such entry
  names its in-repo source (typically a `stocktake/reports/` file that
  quotes the external source verbatim) and explicitly notes that any
  slug is GLOSSARY-internal, not a citable `\label` in the external
  source. **Schema variant for §B:** an entry may have **multiple
  `**Canonical (description):**` blocks** when the external source's
  definition straddles prose and code (e.g. a LaTeX prose definition
  plus a code-derived enumeration). In that case, each block carries a
  parenthetical describing what the block contains and where it comes
  from. §A entries always use a single `**Canonical:**` block.

---

## §A. Entries from `summary.tex` (source-line order)

---

## conv:basics — Notation and conventions (basic)

**Canonical:**
```latex
\begin{convention}\label{conv:basics}
Vector spaces are complex unless otherwise stated. The dagger $f^\dagger$
denotes the categorical adjoint when $\Cc$ is unitary, and complex conjugate
transpose for matrices. The symbol $\one$ denotes the categorical unit
object (also called the \emph{vacuum} simple); $\vac$ denotes the empty
configuration as a state vector. For a finite-dimensional vector space $V$,
$\End(V) = \Hom(V,V)$. Tensor products are written $\otimes$ and are
associative up to a fixed associator, which we suppress in displays where
strict ordering is the only structure used.
\end{convention}
```

**Source:** `summary.tex:76`
**Aliases:** N/A — this entry defines its own notations. The component
notations have external counterparts catalogued in the per-concept entries:
the categorical adjoint $f^\dagger$ in [[def:fuscat]] (unitary qualifier)
and [[def:fsymbol]] (gauge interplay); the unit $\one$ / vacuum simple in
[[def:Q]] (cell-object choice) and [[conv:1op]] ($A = \one\oplus p$ algebra
ansatz); the tensor product $\otimes$ in [[def:fuscat]]. MMA-side
realisations are in this entry's Translation map.
**Translation map:**
  - MMA: notational convention; MMA inherits Julia/TensorCategories
    conventions — dagger via complex-conjugate transpose; vacuum at index 1
    in `simples(C)` (`config.jl:5,13`, per `stocktake/reports/mma-julia.md`
    §3); tensor products realised by Julia matrix operations on Hom-space
    coordinates rather than an abstract `\otimes`.
  - CAD: not directly formalised — `conv:basics` is a notation block, not a definition. The dagger / adjoint substance maps to Mathlib's `star` typeclass via CAD's `LinearAlgebra/` infrastructure; the `\one` notation maps to `Foundations/ProjectDefinitions.lean::LocalOccupationModel.vacuum` (which is unconstrained — the user supplies the choice).
**Notes:** The dagger/adjoint and vacuum/`\one` conventions are restated and
extended in [[conv:1op]] (specifically for `A = \one\oplus p`). The
"categorical unit object = vacuum simple" identification is load-bearing
for the [[def:HP]] discussion; cf. the Hilbert-space deep-dive at
`stocktake/reports/opus-hilbert-bridge.md` §4 on the `\one`/empty-configuration
distinction. P1.6 will lift the F-matrix gauge and multiplicity-free
assumption from implicit-here to declared `CONVENTIONS.md` items.

---

## conv:acro — Acronyms

**Canonical:**
```latex
\begin{convention}\label{conv:acro}
Acronyms used in this document, expanded at first use:
\textbf{CFT} (Conformal Field Theory),
\textbf{OPE} (Operator Product Expansion),
\textbf{RCFT} (Rational Conformal Field Theory),
\textbf{TL} (Temperley--Lieb algebra),
\textbf{TLJ} (Temperley--Lieb--Jones category),
\textbf{RSOS} (Restricted Solid-on-Solid lattice model),
\textbf{ABF} (Andrews--Baxter--Forrester family of lattice models),
\textbf{MERA} (Multi-scale Entanglement Renormalisation Ansatz),
\textbf{RG} (Renormalisation Group),
\textbf{WZW} (Wess--Zumino--Witten conformal model),
\textbf{VOA} (Vertex Operator Algebra),
\textbf{FRS} (Fjelstad--Fuchs--Runkel--Schweigert construction of full RCFT
correlators)\unchecked,
\textbf{MPO} (Matrix Product Operator),
\textbf{TTN} (Tree Tensor Network),
\textbf{PF} (Perron--Frobenius, used for a quantum-dimension splitting rule).
\end{convention}
```

**Source:** `summary.tex:87`
**Aliases:** N/A (the entry itself is an aliases table).
**Translation map:**
  - MMA: not formalised (acronym table — no mathematical content to
    formalise).
  - CAD: not formalised (acronym table — no mathematical content to formalise).
**Notes:** The `\unchecked` on FRS reflects that the FRS construction is
cited but not locally discharged — see `CITATION_INDEX.md`.

---

## def:fuscat — Fusion category

**Canonical:**
```latex
\begin{definition}[Fusion category]\label{def:fuscat}
A \emph{fusion category} $\Cc$ over $\mathbb{C}$ consists of:
\begin{enumerate}[label=(\roman*)]
\item a finite set $\Irr(\Cc)$ of \emph{simple objects}, denoted by lower-case
      letters $a,b,c,\dots$;
\item a distinguished simple \emph{unit object} $\one \in \Irr(\Cc)$;
\item finite-dimensional complex \emph{Hom-spaces} $\Hom_\Cc(X,Y)$ for each
      pair of objects $X,Y$, composing associatively;
\item a bilinear \emph{tensor product} $\otimes$ with associator and unitors
      making $(\Cc,\otimes,\one)$ monoidal;
\item \emph{biproducts} (finite direct sums), so every object is a finite
      sum of simples;
\item nonnegative integer \emph{fusion multiplicities}
      \[ N_{ab}^{c} := \dim_{\mathbb{C}}\Hom_\Cc(c,\,a\otimes b), \]
      so that $a\otimes b \cong \bigoplus_{c\in\Irr(\Cc)} c^{\oplus N_{ab}^c}$;
\item rigid duals: each simple $a$ has a dual $\bar a$ with evaluation and
      coevaluation morphisms satisfying the snake identities.
\end{enumerate}
A fusion category is \emph{unitary} if every Hom-space is a Hilbert space and
$\otimes,\circ$ are compatible with a dagger structure
$(\,\cdot\,)^\dagger:\Hom(X,Y)\to\Hom(Y,X)$ satisfying $\langle f,g\rangle
\,\id_X = f^\dagger\circ g$ for $X$ simple.
\end{definition}
```

**Source:** `summary.tex:113`
**Aliases:** "Unitary fusion category" (the unitary qualifier is the default
throughout per [[conv:unitary-default]]).
**Translation map:**
  - MMA: TensorCategories.jl `FusionCategory` type. The three exemplars
    `fibonacci_category()`, `ising_category()`, and
    `TensorCategories.graded_vector_spaces(Z/2)` (= sVec) are
    TensorCategories.jl exports (not MMA-defined constructors); MMA's `src/`
    accepts any such category via a generic `C` parameter and uses it
    throughout `hilbert.jl`, `fsymbols.jl`, `interaction.jl`, `braiding.jl`.
    The three named categories are exercised in
    `test/test_categories.jl:7,26,44`. Provides finite simples via
    `simples(C)`; multiplicities queried indirectly via
    `dim(Hom(S[a] \otimes S[b], S[c]))` (see e.g. `hilbert.jl:58`,
    `fsymbols.jl:75`); F-symbols via `six_j_symbols` (wrapped by
    `FSymbolCache` per `fsymbols.jl`). No MMA-specific wrapper struct. Per
    `stocktake/reports/mma-julia.md` §3 lines 71-75 and §2.
  - CAD: `Foundations/SkeletalFusion.lean::FiniteSkeletalFusionData` (Phase 5 migration step P5.1). Coordinate-skeleton level: a finite label set, distinguished vacuum, integer multiplicity table. No associators, no duals, no Hom-spaces — the categorical content is supplied separately at instantiation. Per `stocktake/reports/cad-lean.md` §5 line 344 and §2.1 lines 35-48.
**Notes:** This is the project's foundational definition; nearly every other
entry depends on it. The unitary qualifier propagates via [[conv:unitary-default]].

---

## conv:unitary-default — Unitary default and recurring examples (no label in source)

**Canonical:**
```latex
\begin{convention}
Throughout this document $\Cc$ is unitary unless stated otherwise. Two
recurring examples are $\Cc = \Fib$ (\S\ref{sec:fib-data}) and $\Cc = \Ising$
(\S\ref{sec:ising-data}).
\end{convention}
```

**Source:** `summary.tex:137` (NB: this `\begin{convention}` has **no
`\label{...}`** in the source; the slug `conv:unitary-default` is assigned
here in GLOSSARY for cross-reference only and is **not** a citable label
in `summary.tex` itself.)
**Aliases:** "unitarity assumption", "default unitarity".
**Translation map:**
  - MMA: not separately formalised (notational); the three TensorCategories.jl
    exemplars (`fibonacci_category()`, `ising_category()`,
    `graded_vector_spaces(Z/2)`) exercised by MMA in
    `test/test_categories.jl:7,26,44` are all unitary fusion categories,
    matching this convention. Per `stocktake/reports/mma-julia.md` §3.
  - CAD: not formalised (notational convention — the unitarity assumption is implicit in CAD's Mathlib-borne dagger structures).
**Notes:** This convention is the reason [[def:fuscat]] is usually invoked
with implicit unitarity; see also [[def:fib]] and [[def:ising]] as the
two recurring instantiations.

---

## def:splitbasis — Splitting basis

**Canonical:**
```latex
\begin{definition}[Splitting basis]\label{def:splitbasis}
For each ordered triple $(a,b,c)\in\Irr(\Cc)^3$ with $N_{bc}^{a}\ge 1$,
fix an orthonormal basis
\[
\{ v_{b,c;\mu}^{a} \;:\; \mu = 1,\dots,N_{bc}^{a} \}
\subset \Hom_\Cc(a,\;b\otimes c).
\]
The element $v_{b,c;\mu}^{a}$ is called a \emph{splitting vertex}. When
$N_{bc}^a \in\{0,1\}$ (the multiplicity-free case) the index $\mu$ is dropped.
\end{definition}
```

**Source:** `summary.tex:145`
**Aliases:** "fusion vertex" (categorical), "trivalent vertex". The dual
"fusion basis" of $\Hom_\Cc(b\otimes c, a)$ is implicitly co-defined.
**Translation map:**
  - MMA: `src/MobileAnyons/hilbert.jl::FusionTree` struct and the
    `enumerate_fusion_trees` enumerator realise the left-associated
    splitting-tree basis of $\Hom(X_c, X_{a_1}\otimes\cdots\otimes X_{a_N})$
    as a sequence of intermediate charges, per `stocktake/reports/mma-julia.md`
    §3 lines 71-76 and the [[def:mobile-Fock]] "left-associated fusion-tree
    basis" convention dependency. No separate `SplittingVertex` struct; the
    multiplicity index $\mu$ is dropped because the three currently-used
    categories ([[def:fib]], [[def:ising]], sVec) are multiplicity-free.
    **LB-1 caveat (`cft-anyons-q6h`):** `enumerate_fusion_trees` undercounts
    the basis when $\dim\Hom(a\otimes b, c) > 1$; latent for present scope,
    blocks any extension to extended Haagerup etc.
  - CAD: not formalised at the categorical splitting-basis level. CAD's `FiniteFineGraining` (`LinearAlgebra/FineGraining.lean`, Phase 4 P4.11) works at the matrix-algebra level — basis is presumed but not named as a splitting basis. The Fibonacci splitting basis is implicit in `Fibonacci/Binary.lean::PFBinaryEta` (Phase 5 P5.10).
**Notes:** The "$\mu$ dropped in the multiplicity-free case" remark is the
implicit-vs-explicit multiplicity index distinction that powers the latent
LB-1 bug in MMA (see `cft-anyons-q6h` in bd). All currently-used categories
([[def:fib]], [[def:ising]]) are multiplicity-free. P1.6 (item d) lifts this
to a declared `CONVENTIONS.md` item.

---

## def:fsymbol — F-symbol (F-matrix)

**Canonical:**
```latex
\begin{definition}[F-symbol]\label{def:fsymbol}
For a four-leaf splitting tree $d\to a\otimes b\otimes c$ with two natural
parenthesisations $(a\otimes b)\otimes c$ and $a\otimes(b\otimes c)$, the
change-of-basis matrix between the corresponding splitting bases is the
\emph{F-symbol} (or F-matrix) $F^{abc}_d$:
\[
v_{a,b;\mu}^{e}\otimes v_{e,c;\nu}^{d}
\;=\; \sum_{f,\rho,\sigma}
\bigl(F^{abc}_d\bigr)_{(e,\mu,\nu),(f,\rho,\sigma)}\,
v_{a,f;\sigma}^{d}\otimes v_{b,c;\rho}^{f}.
\]
F-symbols satisfy the \emph{pentagon equation}; in the unitary case each
$F^{abc}_d$ is a unitary matrix.
\end{definition}
```

**Source:** `summary.tex:156`
**Aliases:** "F-matrix", "associator coefficient", "6j-symbol" (in some
literatures, with sign/normalisation differences).
**Translation map:**
  - MMA: `src/MobileAnyons/fsymbols.jl::FSymbolCache` (built via
    `build_fsymbol_cache`, queried via `f_matrix(cache, a, b, c, d)` and
    `f_symbol(cache, a, b, c, d, e, f)`); wraps `TensorCategories.six_j_symbols`
    per `stocktake/reports/mma-julia.md` §3 lines 71-75. Numerical conversion
    of number-field elements via `_physical_embedding` heuristic (largest
    real part of generator). **Caution (CLAUDE.md hallucination-risk):**
    TensorCategories.jl uses an **involutory** gauge ($F^2 = I$,
    $F^\dagger \ne F^{-1}$ in general); MMA compensates for the resulting
    non-projector behaviour with Hermitian projectors $P_H = vv^\dagger/|v|^2$
    in `interaction.jl` and `braiding.jl` (per `mma-julia.md` §2 line 37 and
    §3 lines 76-78). The unitary-vs-involutory translation rule is locked at
    [P1.6(b)].
  - CAD: not formalised abstractly. The specific Fibonacci instance is at `Fibonacci/Matrix.lean::FibF` (see [[def:fib-F]] CAD entry); CAD does not have a general categorical F-symbol structure (per `stocktake/reports/cad-lean.md` §5 'Notable gaps').
**Notes:** Concrete instance [[def:fib-F]] for Fibonacci; [[def:ising-F]]
for Ising. The unitary qualifier here is governed by [[conv:unitary-default]].

---

## def:qdim — Quantum dimension

**Canonical:**
```latex
\begin{definition}[Quantum dimension]\label{def:qdim}
For each $a\in\Irr(\Cc)$, the \emph{quantum dimension} $d_a$ is the unique
positive real number satisfying
\[
d_a\,d_b \;=\; \sum_{c\in\Irr(\Cc)} N_{ab}^{c}\, d_c,
\qquad d_\one = 1.
\]
The \emph{total quantum dimension} is
\[
D \;:=\; \sqrt{\sum_{a\in\Irr(\Cc)} d_a^{2}}.
\]
\end{definition}
```

**Source:** `summary.tex:173`
**Aliases:** "FP-dimension" (Frobenius--Perron dimension), "categorical
dimension", "intrinsic dimension".
**Translation map:**
  - MMA: not separately formalised; quantum dimensions are provided by
    TensorCategories.jl via `dim(a)` for each simple `a`. Used implicitly in
    `src/MobileAnyons/interaction.jl::interaction_hamiltonian` normalisation:
    MMA's bond projector $\sum_j P_j$ equals $\sum_j e_j / d_\sigma$ in
    `summary.tex`'s TL normalisation, per [[def:TL-cat]] and
    `stocktake/reports/mma-julia.md` §5 line 137.
  - CAD: Fibonacci-specific case in `Fibonacci/Basic.lean` (Phase 5 P5.7) — `d_τ = φ`, `D² = 2+φ` proved. The abstract `d_a d_b = Σ_c N^c_{ab} d_c, d_1 = 1` is not formalised as a general categorical statement (per `stocktake/reports/cad-lean.md` §5 'Notable gaps: §5 algebra objects').
**Notes:** The "PF" acronym in [[conv:acro]] and the "PF amplitudes"
[[def:PF]] both refer to "Perron--Frobenius" splittings derived from
quantum dimensions. Concrete instances: Fibonacci $d_\tau = \varphi$
(Lemma `lem:fib-qdim`); Ising $d_\sigma = \sqrt 2$ in [[def:ising]].

---

## def:Q — Local cell object

**Canonical:**
```latex
\begin{definition}[Local cell object]\label{def:Q}
A \emph{local cell object} is any object $Q\in\Cc$. The Hilbert spaces of
Definitions~\ref{def:Hlatt}--\ref{def:HP} are built from a chosen $Q$ via
$Q^{\otimes N}$ and $\Hom_\Cc(W,\,Q^{\otimes N})$ irrespective of how $Q$ was
constructed.
\end{definition}
```

**Source:** `summary.tex:194`
**Aliases:** "occupation object" (chats 1--2), "site object", "$A_I$" (in
the partition formulation [[def:HP]] when sites carry independent cell
objects).
**Translation map:**
  - MMA: not an explicit named struct; the canonical
    $Q_{\mathrm{full}} = \bigoplus_{a\in\Irr(\Cc)} a$ choice is baked into
    MMA's basis enumeration — every site may carry any label in `simples(C)`,
    with vacuum legs absorbed into the hard-core position list
    (`config.jl:5,13` per [[def:mobile-Fock]] convention dependency #2 and
    `stocktake/reports/mma-julia.md` §3). The "five named options" of P1.6(h)
    reduce to this single canonical choice in MMA.
  - CAD: `Foundations/ProjectDefinitions.lean::LocalOccupationModel` (Phase 5 P5.6). `LocalOccupationModel.vacuum : label` is unconstrained — the choice of `Q` (and which simple is vacuum) is supplied by the user at instantiation. For the canonical `Q_full` default (P1.6(h)), supply the full label set. Per `stocktake/reports/cad-lean.md` §5 line 358.
**Notes:** This is one of the project's most-overloaded symbols. Five
distinct natural choices are catalogued in `summary.tex` Remark
`rem:Q-choices` ($Q_{\mathrm{full}}$, $Q_{\mathrm{restr}}$,
$Q^{\mathrm{geom}}_I$ (multiplicity-decorated), site-dependent $A_I$,
coarse-grained $Q^{\otimes k}$); P1.6(h) will declare $Q_{\mathrm{full}}$
as the canonical default. The warning `warn:Q-not-canonical`
(`summary.tex:254`) is the explicit guard against assuming $Q$ has any one
form. **Separately note** the vacuum-index 0-vs-1 drift hazard from
`CLAUDE.md` ("Vacuum-index convention" callout — three-way conflict
between MMA's `hilbert_space.md:39` (0-indexed) and MMA's `config.jl:12`
(1-indexed) was the STL-1 bug): P1.6(a) will lock the canonical choice
in `CONVENTIONS.md`. See also [[def:Ageom]] for the geometry-enriched
extension.

---

## def:Hlatt — N-site Hilbert space, fixed lattice

**Canonical:**
```latex
\begin{definition}[$N$-site Hilbert space, fixed lattice]\label{def:Hlatt}
Fix a local cell object $Q\in\Cc$ (Definition~\ref{def:Q}). For each integer
$N\ge 0$ and each simple total charge $W\in\Irr(\Cc)$, the
\emph{$N$-site Hilbert space in charge sector $W$} is
\[
\Hh_N^{W} \;:=\; \Hom_\Cc\!\bigl(W,\;Q^{\otimes N}\bigr).
\]
The full $N$-site space is $\Hh_N = \bigoplus_{W\in\Irr(\Cc)} \Hh_N^{W}$.
\end{definition}
```

**Source:** `summary.tex:285`
**Aliases:** "$H_N^W$", "fixed-lattice Hilbert space".
**Translation map:**
  - MMA / mobile-Fock [[def:mobile-Fock]]: equivalent via the bijection
    in bridge report §2.2 (lines 181–230). Concretely
    $H_{\mathrm{MMA}}(L) \cong \bigoplus_{W\in\Irr(\Cc)}
    \bigoplus_{N=0}^{L} \Hh_N^{W}$, with index match $c$ (MMA) $\leftrightarrow
    W$ (summary). The bijection on basis elements is:
    - **$N \to \mathrm{MF}$**: reindex the label sequence
      $(a_1,\dots,a_N)\in\Irr(\Cc)^N$ as
      $(\,\text{positions } x_p \text{ of non-vacuum legs},\ \text{non-vacuum labels } b_p = a_{x_p}\,)$;
      the fusion fibre $\Hom(W, a_1\otimes\cdots\otimes a_N)$
      collapses canonically onto $\Hom(W, b_1\otimes\cdots\otimes b_n)$
      because tensoring with $\one$ is the identity functor (vacuum
      legs absorb).
    - **$\mathrm{MF} \to N$**: build the length-$L$ label sequence
      $(a_x = b_p \text{ if } x = x_p,\ a_x = \one \text{ else})$; use
      `fusion_tree` (sequence of intermediate charges in the
      left-associated basis) as the coordinate in
      $\Hom(c, a_1\otimes\cdots\otimes a_L)$ — MMA's
      `enumerate_fusion_trees` already iterates only over the
      non-vacuum labels, which is the inverse of vacuum absorption.
    - **Neither is "more general"**: the two are identifications of
      the same Hom-space under different geometric framings.
    - **Conventions required** (locked at P1.6 per the plan): vacuum
      at index 1 [P1.6(a)]; hard-core (automatic — a site is either
      vacuum or one simple); left-associated fusion-tree basis
      [P1.6(i)]; multiplicity-free assumption [P1.6(d)] (each simple
      appears with multiplicity 1 in $Q$); F-matrix gauge translation
      [P1.6(b)] (relevant for any computation using F-symbol entry
      values, not for the basis-element bijection itself, which is
      gauge-independent).
    - **Worked example**: Fibonacci $\Hh_2^\tau$ has $\dim = 3$ in
      both formulations; basis-vector-level bijection given in bridge
      report §5.1–§5.3 (`opus-hilbert-bridge.md:291-339`).
  - CAD: `Foundations/ProjectDefinitions.lean::IndefiniteParticleSectorCoordinates(sectorBasis)` (Phase 5 P5.6). **Coordinate-skeleton level**, not categorical Hom-space. User must supply `sectorBasis : Config label n → Type`; once supplied, the bijection is `IndefiniteParticleSectorCoordinates(sectorBasis) = Hom(W, Q^⊗N)` coordinatised by enumerating `(config, basis element of Hom-fibre over that config)`. Per `stocktake/reports/cad-lean.md` §5 line 358 and bridge report §3 'CAD Lean ↔ summary' row (`opus-hilbert-bridge.md:249`). Supporting CAD constructions on the same `H_N^W` skeleton: `Foundations/DirectSumCoordinates.lean` (Phase 5 P5.2) for the Σ↔Π sum equivalence; `Foundations/ConfigurationSpace.lean` (P5.4) for `summary.tex` §4.2 sector expansion; `Foundations/FockSpace.lean` (P5.5) for `summary.tex` §4.3 truncated-Fock-space view.
**Notes:** Equivalent to [[def:HP]] when all $A_I = Q$ (per the remark
following `def:HP`). The three discrete Hilbert-space framings (this
one, [[def:HP]], and MMA's mobile-Fock [[def:mobile-Fock]]) all
reconcile per `stocktake/reports/opus-hilbert-bridge.md`; the partition
formulation [[def:HP]] is declared canonical. The continuum
analytical closure is [[def:indlim]].

---

## def:particle-number — Particle number

**Canonical:**
```latex
\begin{definition}[Particle number]\label{def:particle-number}
On the basis $(a_1,\dots,a_N)$ in Proposition~\ref{prop:conf-decomp} the
\emph{particle number} is
\[
k(a_1,\dots,a_N) \;:=\; \#\{i \in\{1,\dots,N\} : a_i \neq \one\}.
\]
Each basis vector $(a_1,\dots,a_N)$ carries an internal \emph{fusion fibre}
$\Hom_\Cc(W, a_1\otimes\cdots\otimes a_N)$, plus the multiplicity factor
$\bigotimes_i M_{a_i}$ from $Q$'s decomposition
(Proposition~\ref{prop:conf-decomp}). For the default
$Q = \bigoplus_a a$ (each $M_a$ either $\mathbb{C}$ or $0$), the
multiplicity factor is trivial.
\end{definition}
```

**Source:** `summary.tex:344`
**Aliases:** "$k$", "$n$ (in MMA's notation; conflict with $N$ — see P1.6(g))".
**Translation map:**
  - MMA: MMA's `N` parameter in `src/MobileAnyons/config.jl::LabelledConfig`
    and `enumerate_configs_hc(L, N, C)` is the count of non-vacuum legs,
    i.e. `summary.tex`'s $k$ here (also called $n$ in this entry's Aliases).
    Per `stocktake/reports/mma-julia.md` §3 and §5 "Convention differences"
    (line 146). **Disambiguation per P1.6(g):** `summary.tex` uses `N` for
    tensor degree / lattice length / cell count (= MMA's `L`); MMA reuses
    `N` for the non-vacuum count.
  - CAD: `Foundations/Configurations.lean` (Phase 5 P5.3) — particle number defined in the coordinate skeleton. **Caveat per `stocktake/reports/cad-lean.md` §6**: Configurations.lean currently imports `Fibonacci.FusionRules`; must be reverse-decoupled before migration (P5.3 covers this).
**Notes:** "Fusion fibre" is implicitly defined here; not a separate entry
because the definition is contained in this body. Depends on
[[def:Hlatt]] and [[def:Q]].

---

## def:partition — Ordered partition of a segment

**Canonical:**
```latex
\begin{definition}[Ordered partition of a segment]\label{def:partition}
Let $X = [0,L]$ be an oriented closed interval with Lebesgue measure $\ell$.
An \emph{ordered partition} is a finite chain
\[
P = \{ I_1 < I_2 < \cdots < I_N \}, \qquad
\bigcup_{i=1}^{N} I_i = X,\quad \text{interiors disjoint}.
\]
We write $|P| = N$ and $\ell(I)$ for the length of cell $I\in P$.
\end{definition}
```

**Source:** `summary.tex:374`
**Aliases:** "partition $P$", "cell decomposition".
**Translation map:**
  - MMA: `src/MobileAnyons/config.jl::LabelledConfig` (struct with
    `positions::Vector{Int}` and `labels::Vector{Int}`) is the MMA realisation
    of the partition + label data, per `stocktake/reports/mma-julia.md` §5
    line 131. MMA indexes hard-core configurations on a 1D lattice of $L$
    sites: this is the **mobile** version of `summary.tex`'s partition — cells
    are single lattice sites ordered by position, so $|P| = L$ and cell-length
    geometry is degenerate (every cell has unit length). `enumerate_configs_hc(L, N, C)`
    enumerates all hard-core configs with $N$ non-vacuum particles on $L$
    sites; the partition order $I_1 < I_2 < \cdots < I_N$ matches MMA's
    `positions` field. Per `mma-julia.md` §2 line 33 and §3.
  - CAD: not formalised. CAD has only the N-tensor (fixed-lattice) coordinate skeleton via [[def:Hlatt]]'s CAD entry; the partition data structure (per-cell objects, partition-refinement order) is not in CAD scope.
**Notes:** Underlying the partition Hilbert space [[def:HP]] and the
refinement infrastructure ([[def:refine]], [[def:refmap]], [[def:indlim]],
[[def:blocking]]).

---

## def:HP — Partition Hilbert space

**Canonical:**
```latex
\begin{definition}[Partition Hilbert space]\label{def:HP}
For each cell $I\in P$ choose a local cell object $A_I\in\Cc$
(Definition~\ref{def:Q}); the $A_I$ may differ across cells. Set
\[
A_P \;:=\; A_{I_1}\otimes A_{I_2}\otimes\cdots\otimes A_{I_N}, \qquad
\Hh_P^{W} \;:=\; \Hom_\Cc(W,\,A_P).
\]
\end{definition}
```

**Source:** `summary.tex:384`
**Aliases:** "$H_P^W$", "spatial-partition Hilbert space".
**Translation map:**
  - MMA / mobile-Fock [[def:mobile-Fock]]: special case via the chain
    in bridge report §2.3 (= compose §2.1 partition↔N-tensor and §2.2
    N-tensor↔mobile-Fock).
    - **Partition $\to$ MF**: take $|P| = L$ (lattice cut-off equals
      cell count); set $A_I = Q_{\mathrm{full}} = \bigoplus_{a\in\Irr(\Cc)} a$
      on every cell; identify with N-tensor $\Hh_N^W$
      ($N = |P|$); then sum over $W \in \Irr(\Cc)$ (recovering MMA's
      total-charge direct sum) and absorb the vacuum legs into a
      sparse hard-core position list.
    - **MF $\to$ partition**: pick any partition $P$ of size $|P| = L$
      (cell lengths arbitrary — they are not relevant for the
      Hilbert space itself, only for refinement maps [[def:refmap]]);
      fix $A_I = Q_{\mathrm{full}}$ on every cell; decompose
      $H_{\mathrm{MMA}}(L)$ by total charge $c$ to recover
      $\bigoplus_W \Hh_P^W$.
    - **Partition is strictly more general** for two reasons:
      (i) per-cell $A_I$ are allowed (required for blocked /
      coarse-grained refinements where a coarse cell carries a
      larger object than a fine cell — see Remark `rem:Q-choices`(4)
      at `summary.tex:233-236`); (ii) total charge $W$ is treated as
      a superselection label, not summed.
    - **Conventions required** (locked at P1.6): same as
      [[def:Hlatt]] above — vacuum at index 1 [P1.6(a)];
      left-associated fusion-tree basis [P1.6(i)]; multiplicity-free
      [P1.6(d)]; plus the choice $Q = Q_{\mathrm{full}}$ uniform
      across cells, which is the MMA convention [P1.6(h)].
    - **Worked example**: Fibonacci $\Hh_P^\tau$ with $|P| = 2$ and
      $A_I = Q_{\mathrm{full}} = \one \oplus \tau$ has $\dim = 3$;
      basis-vector-level bijection to MMA's
      $(\text{config}, \text{fusion\_tree}, c)$ tuples given at
      bridge report §5.1–§5.2 (`opus-hilbert-bridge.md:291-325`).
  - CAD: **not directly formalised** as the partition formulation. CAD has only the fixed-lattice `H_N^W` skeleton (via [[def:Hlatt]]'s CAD entry), which is the special case `|P| = N`, `A_I = Q` of [[def:HP]]. The per-cell `A_I` generality (required for blocked / coarse-grained refinements) is NOT in CAD scope.
**Notes:** **This is the canonical Hilbert-space formulation per
`stocktake/reports/opus-hilbert-bridge.md`**. Three equivalent framings:
this one ([[def:HP]]); the fixed-lattice [[def:Hlatt]] (special case
$A_I = Q$); and MMA's mobile-Fock formulation [[def:mobile-Fock]]
(special case: choose $A_I = Q_{\mathrm{full}} = \bigoplus_a a$ on
every cell; mobile-Fock additionally sums over partition size $|P|$
(running $0 \le |P| \le L$) and over total charge $c \in \Irr(\Cc)$).
The continuum direct limit of this construction is [[def:indlim]].
[[def:Ageom]] is the geometry-enriched extension. P1.5 will write the
explicit translation map into the relevant entries. (Avoiding the
notation "particle number $N$" here because P1.6(g) will lock $N$ to
*tensor degree / lattice length / cell count* — `summary.tex`'s
convention — whereas MMA uses $N$ for the non-vacuum-leg count;
disambiguation pending.)

---

## def:refine — Refinement of partitions

**Canonical:**
```latex
\begin{definition}[Refinement of partitions]\label{def:refine}
Given partitions $P,P'$ of $X$, we say $P'$ \emph{refines} $P$, written
$P\preceq P'$, if every cell $J\in P'$ is contained in a unique cell
$I\in P$. The \emph{children} of $I\in P$ in $P'$ are
$\mathrm{Ch}_{P'}(I) := \{J\in P' : J\subset I\}$. Any two partitions
$P_1,P_2$ admit a common refinement; hence $(P,\preceq)$ is a directed set.
\end{definition}
```

**Source:** `summary.tex:403`
**Aliases:** "$P \preceq P'$", "subdivision".
**Translation map:**
  - MMA: not formalised as a partition-refinement order. The only
    refinement instance in MMA is the dyadic lattice doubling $L \to 2L$
    implemented by `fine_graining_isometry` and `normalized_product_isometry`
    in `src/MobileAnyons/finegraining.jl` (per `stocktake/reports/mma-julia.md`
    §3 line 81 and §5 line 133: MMA "doubles the lattice ($L \to 2L$) via
    wavelet scaling rather than refining a partition interval"). The general
    $P \preceq P'$ directed-set structure is absent; only the specific
    doubling case is realised.
  - CAD: not formalised as a partition-refinement order. CAD's coherent-refinement structure (`LinearAlgebra/CoherentSystem.lean`, Phase 4 P4.12) implements the categorical compatible-family axioms abstractly but does not implement the partition combinatorics.
**Notes:** The directed-set structure is what enables the inductive limit
[[def:indlim]]. Implementation of $E_{P\to P'}$ is [[def:refmap]].

---

## def:refmap — Refinement map

**Canonical:**
```latex
\begin{definition}[Refinement map]\label{def:refmap}
A \emph{refinement map} associated with $P\preceq P'$ is a (linear)
morphism
\[
E_{P\to P'}:\; A_P \;\longrightarrow\; A_{P'},
\]
required to be an \emph{isometry} (i.e.\ $E_{P\to P'}^{\dagger} E_{P\to P'} = \id_{A_P}$)
and to be \emph{cellwise local} in the sense
\[
E_{P\to P'} \;=\; \bigotimes_{I\in P} E_{I\to\mathrm{Ch}_{P'}(I)},
\qquad
E_{I\to(J_1,\dots,J_r)}: A_I \to A_{J_1}\otimes\cdots\otimes A_{J_r}.
\]
For $f\in\Hh_P^{W}$ the induced refinement is $V_{P\to P'}(f) := E_{P\to P'}\circ f$.
\end{definition}
```

**Source:** `summary.tex:411`
**Aliases:** "$E_{P\to P'}$", "isometric splitting", "cellwise refinement
morphism".
**Translation map:**
  - MMA: `src/MobileAnyons/finegraining.jl::normalized_product_isometry`
    ↔ $E_{P\to P'}$ for the dyadic doubling case $L \to 2L$, per
    `stocktake/reports/mma-julia.md` §5 lines 133-135 and §3 line 83.
    Universal column-normalised product map; tested isometric across Haar/D4
    wavelet filters for Fibonacci, Ising, sVec in `test/test_finegraining_*.jl`.
    Variants in the same file: `fine_graining_isometry` (raw product map;
    isometric for Haar, fails for D4 — explicitly tested with
    `@test iso_err > 0.01`); `trivial_embedding` ($j \mapsto 2j-1$; always
    isometric — the strict-persistence realisation, cf. [[def:persist]]);
    `categorical_determinant_isometry` (braiding-weighted Slater generalisation;
    exported with "partial correction only (non-abelian)" comment — `mma-julia.md`
    §4 line 112); `fine_graining_isometry_svec` (Slater determinant lift;
    correct only for sVec). **Structural difference per `mma-julia.md` §5
    lines 133-135**: MMA's construction is **geometric** (wavelet-derived
    column normalisation); `summary.tex`'s $E_{P\to P'}$ is **algebraic**
    (derived from algebra-object comultiplication $\Delta = m^\dagger/\sqrt\lambda$
    per [[def:algobj]]). The closer `summary.tex` analog is the length-weighted
    [[def:lenref]] (`mma-julia.md` §5 line 151).
  - CAD: `LinearAlgebra/FineGraining.lean::FiniteFineGraining` (Phase 4 P4.11) — captures the `E†E = id` isometry condition + all channel properties (unital, *-preserving, completely positive). Works at the matrix-algebra level; instantiation requires choosing bases for source and target. Supporting infrastructure: `LinearAlgebra/Isometry.lean` (Phase 4 P4.2) for general isometry lemmas (`E^†E = I` ⇒ `E` is bijective onto its image, etc.); `LinearAlgebra/Postcompose.lean` (P4.8) and `LinearAlgebra/Component.lean` (P4.9) for compositional structure. The tensor-product structure of the cellwise-local condition is in `LinearAlgebra/Tensor.lean` (P4.4), `TensorPower.lean` (P4.5), `HeterogeneousTensor.lean` (P4.6). Per `stocktake/reports/cad-lean.md` §5 line 359 and §2.4.
**Notes:** Concrete instances: [[def:lenref]] (length-weighted, the
square-zero kinematic model); [[def:rchild]] (algebra-derived for
Fibonacci); [[def:Jinterp]] (non-tree interpolation). The
isometry + cellwise-locality constraints are the load-bearing axioms.

---

## def:indlim — Inductive limit

**Canonical:**
```latex
\begin{definition}[Inductive limit]\label{def:indlim}
A \emph{compatible family} of refinement maps satisfies
$E_{P\to P} = \id$ and, for $P\preceq P'\preceq P''$,
$E_{P'\to P''}\,E_{P\to P'} = E_{P\to P''}$. The \emph{continuum Hilbert
space in charge sector $W$} is the Hilbert completion of the algebraic
direct limit
\[
\Hh_\infty^{W} \;:=\; \overline{\varinjlim_{P}\,\Hh_P^{W}}.
\]
\end{definition}
```

**Source:** `summary.tex:427`
**Aliases:** "$H_\infty^W$", "continuum Hilbert space", "direct limit",
"thermodynamic limit Hilbert space".
**Translation map:**
  - MMA / mobile-Fock [[def:mobile-Fock]]: **discrete fixed-$L$
    analogue, not equivalent.** Mobile-Fock
    $H_{\mathrm{MMA}}(L) \cong \bigoplus_W \bigoplus_{N=0}^L \Hh_N^W$
    is finite-dimensional for fixed $L$ — see bridge report §1.3
    line 138 for the cardinality formula. The inductive-limit
    closure here takes the partition tower
    $\{\Hh_P^W, E_{P\to P'}\}$ over the directed set $(P, \preceq)$
    of refinements ([[def:refine]], [[def:refmap]]) and forms the
    Hilbert completion of the algebraic direct limit; MMA itself has
    no continuum counterpart (it lives at fixed lattice cut-off $L$).
    The translation is therefore:
    - **MMA $\to$ inductive limit**: $H_{\mathrm{MMA}}(L)$ embeds as
      the $|P| = L$ slice (with $A_I = Q_{\mathrm{full}}$, summed
      over $W$) of the inductive system, before the $L \to \infty$
      Hilbert completion.
    - **Inductive limit $\to$ MMA**: no canonical inverse — the
      continuum limit drops the lattice cut-off, which MMA requires.
      One can restrict to $\Hh_P^W$ for a specific $|P| = L$ and then
      compose with the partition $\leftrightarrow$ mobile-Fock map
      (per [[def:HP]] Translation map) to recover the MMA basis.
    - **Conventions required**: same as [[def:HP]] / [[def:Hlatt]] at
      each finite $L$ slice; the continuum closure additionally
      requires the cellwise-local-isometry condition on the
      refinement maps [[def:refmap]] (the inductive system must be
      compatible: $E_{P\to P}=\id$ and
      $E_{P'\to P''}E_{P\to P'}=E_{P\to P''}$).
  - CAD: `LinearAlgebra/CoherentSystem.lean` (Phase 4 P4.12) — compatible-family axioms (`E_{P→P}=id`, `E_{P'→P''} ∘ E_{P→P'} = E_{P→P''}`) proved. Hilbert completion of the algebraic direct limit not in CAD scope (CAD is finite-dim coordinate-only). Per `stocktake/reports/cad-lean.md` §5 line 363.
**Notes:** Compatibility = associativity-of-refinement. Cf. [[def:HP]],
[[def:refmap]]. The Hilbert-completion step is the load-bearing step
analytically. The continuum limit here is the analytical completion of
the partition-canonical [[def:HP]] tower; MMA's mobile-Fock
[[def:mobile-Fock]] is the discrete (lattice-cut-off-$L$) analogue of
the same direct sum structure. All three discrete framings ([[def:HP]],
[[def:Hlatt]], [[def:mobile-Fock]]) and this inductive-limit closure
reconcile per `stocktake/reports/opus-hilbert-bridge.md`.

---

## def:blocking — Blocking map

**Canonical:**
```latex
\begin{definition}[Blocking map]\label{def:blocking}
The \emph{blocking map} (\emph{coarse-graining map}) is the adjoint
\[
B_{P\leftarrow P'} \;:=\; E_{P\to P'}^{\dagger}: A_{P'} \to A_P.
\]
Isometry of $E_{P\to P'}$ is equivalent to
$B_{P\leftarrow P'}\,E_{P\to P'} = \id_{A_P}$. The other composition
$E_{P\to P'}\,B_{P\leftarrow P'}$ is in general only an orthogonal projection
onto the embedded coarse subspace (a strict projection, not the identity).
\end{definition}
```

**Source:** `summary.tex:438`
**Aliases:** "coarse-graining map", "$B_{P\leftarrow P'}$".
**Translation map:**
  - MMA: not a named function. Realised implicitly as `adjoint(V)` for
    `V = normalized_product_isometry` (where $V: H_L \to H_{2L}$); the
    $B \circ E = \id$ identity is verified indirectly by
    `test/test_finegraining_*.jl`'s `V'V ≈ I` checks (per
    `stocktake/reports/mma-julia.md` §2 line 57).
  - CAD: the `B = E†` adjoint relationship is implicit in `LinearAlgebra/FineGraining.lean` (Phase 4 P4.11) via the isometry condition. Not separately formalised as a distinct `def:blocking` structure.
**Notes:** The "strict projection, not the identity" remark is what makes
$E \circ B$ a proper coarse-graining (non-injective on the fine side).
The dual of [[def:refmap]]. Composed instances: [[def:ascending]].

---

## def:ascending — Ascending observable channel

**Canonical:**
```latex
\begin{definition}[Ascending observable channel]\label{def:ascending}
Given a fine observable $O\in\End(A_{P'})$, its image under coarse-graining
is the \emph{ascending channel}
\[
\Aa_{P'\to P}(O) \;:=\; E_{P\to P'}^{\dagger}\,O\,E_{P\to P'} \;\in\; \End(A_P).
\]
This map is unital ($\Aa(\id_{A_{P'}}) = \id_{A_P}$ because $E^\dagger E = \id$),
$\ast$-preserving, and completely positive (it is a conjugation by an isometry).
\end{definition}
```

**Source:** `summary.tex:449`
**Aliases:** "$\Aa$", "ascending channel", "RG ascending map", "Kraus
ascending channel".
**Translation map:**
  - MMA: not a named channel struct. The construction $\Aa(O) = V^\dagger O V$
    appears concretely in `test/test_convergence.jl` and `test/test_finegraining_*.jl`
    for `V = normalized_product_isometry`: tests verify Hamiltonian intertwining
    $V^\dagger H_{2L} V \approx a H_L + b\,I$ (per
    `stocktake/reports/mma-julia.md` §2 line 65). Unital / *-preserving /
    completely-positive properties are inherited from $V^\dagger V = I$ but
    not separately verified.
  - CAD: the ascending-channel construction `A(O) = E† O E` is the channel-property infrastructure in `LinearAlgebra/Trace.lean` (Phase 4 P4.7) and `LinearAlgebra/FineGraining.lean` (P4.11) — completely positive, unital, *-preserving. The 'charge-only' specialisation (`summary.tex warn:charge-only`) is in `LinearAlgebra/ChargeOnly.lean` (P4.14) + `DiagonalScaling.lean` (P4.13); the categorical 'charge-only fails CFT spectrum' Warning is documented but NOT a CAD theorem.
**Notes:** Eigenoperators are [[def:scalop]]. The "charge-only" subcase
of [[def:ascending]] (operator basis = charge projectors) is the
restricted version warned about in `warn:charge-only`
(`summary.tex:1964`).

---

## def:algobj — Algebra object in C

**Canonical:**
```latex
\begin{definition}[Algebra object in $\Cc$]\label{def:algobj}
An \emph{algebra object} in the unitary fusion category $\Cc$ is a triple
$(A, m, u)$ where $A\in\Cc$, $m\in\Hom_\Cc(A\otimes A,\,A)$ is a
\emph{multiplication}, and $u\in\Hom_\Cc(\one,\,A)$ is a \emph{unit},
satisfying:
\begin{enumerate}[label=(\roman*)]
\item \textbf{Unit:} $m\circ(u\otimes\id_A) = \id_A = m\circ(\id_A\otimes u)$.
\item \textbf{Associativity:} $m\circ(m\otimes\id_A)
      = m\circ(\id_A\otimes m)\circ\alpha$, where $\alpha$ is the associator.
\end{enumerate}
If in addition there exists a scalar $\lambda>0$ with
\[
m\,m^{\dagger} \;=\; \lambda\,\id_A,
\]
then $(A,m,u)$ is called \emph{dagger-special} (or \emph{$\lambda$-special}).
\end{definition}
```

**Source:** `summary.tex:474`
**Aliases:** "$(A,m,u)$", "monoid in $\Cc$", "algebra in $\Cc$".
"Dagger-special" is also called "$\lambda$-special".
**Translation map:**
  - MMA: **not implemented in MMA.** Per `stocktake/reports/mma-julia.md`
    §5 line 135: "MMA never constructs an algebra object in the fusion
    category or derives refinement maps from it." MMA's refinement
    `normalized_product_isometry` (per [[def:refmap]]) is purely geometric.
  - CAD: not formalised (per `stocktake/reports/cad-lean.md` §5 'Notable gaps: §5 algebra objects, comultiplication ∆ = m†/√λ: no Lean formalisation').
**Notes:** **Critical hallucination-risk callout (CLAUDE.md):
"dagger-special" ≠ "Frobenius-special".** Frobenius-special additionally
requires the Frobenius identity, not assumed here. See `summary.tex`
Warning `warn:not-Frobenius` (line 511) and Remark `rem:dagger-special-scope`
(line 491). Concrete instance: [[def:fib-mult]]. The square-zero
degenerate algebra ($a=b=0$) satisfies associativity but **not**
dagger-specialness — this is the content of `warn:sq-zero-is-special`.

---

## conv:1op — Notation for A = 1 ⊕ p

**Canonical:**
```latex
\begin{convention}\label{conv:1op}
$A := \one\oplus p$ with $p$ simple, $p\otimes p\cong\one\oplus p$. Fix
orthonormal splitting basis vectors
$v^{\one}_{p,p}\in\Hom(\one,\,p\otimes p)$ and
$v^{p}_{p,p}\in\Hom(p,\,p\otimes p)$.
\end{convention}
```

**Source:** `summary.tex:580`
**Aliases:** "$A = \one\oplus p$ ansatz", "smallest non-trivial algebra
ansatz".
**Translation map:**
  - MMA: not applicable — the $A = \one \oplus p$ algebra-object ansatz
    is the input to `summary.tex`'s algebra-derived refinement, and MMA
    never constructs an algebra object (per [[def:algobj]] MMA bullet and
    `stocktake/reports/mma-julia.md` §5 line 135).
  - CAD: not formalised (notational convention for the algebra ansatz `A = \one ⊕ p`).
**Notes:** $p = \tau$ is the Fibonacci instantiation per [[def:fib]];
generically applies to any unitary fusion category with a simple $p$
satisfying $p\otimes p \cong \one \oplus p$. The convention fixes the
specific splitting-basis vectors used in subsequent algebra-parameter
derivations (Propositions `prop:m-form`, `prop:assoc-F`,
`prop:dagger-special-eq`).

---

## def:lenref — Length-weighted refinement

**Canonical:**
```latex
\begin{definition}[Length-weighted refinement]\label{def:lenref}
For $I = J_1\cup\cdots\cup J_r$, $J_1<\cdots<J_r$, define
\[
w_{J\mid I} \;:=\; \sqrt{\frac{\ell(J)}{\ell(I)}}, \qquad J\subset I,
\]
and set $E_I(\one_I) := \bigotimes_{J\subset I}\one_J$,
\[
E_I(p_I) \;:=\; \sum_{J\subset I} w_{J\mid I}\;
\one_{J_1}\otimes\cdots\otimes p_{J}\otimes\cdots\otimes\one_{J_r}.
\]
The map $E_I$ ignores the algebraic structure of $p\otimes p$ entirely; its
amplitudes are dictated by cell-length geometry.
\end{definition}
```

**Source:** `summary.tex:874`
**Aliases:** "kinematic refinement", "$L^2$ refinement", "geometric
refinement" (chat 4 §1--13).
**Translation map:**
  - MMA: not formalised verbatim. **Closest MMA analog**:
    `src/MobileAnyons/finegraining.jl::normalized_product_isometry` (per
    [[def:refmap]]). Per `stocktake/reports/mma-julia.md` §5 line 151, MMA's
    geometric column-normalisation and `summary.tex`'s length-weighted
    refinement here are in the same spirit — both "abandon the algebra-derived
    refinement in favour of a kinematic Fock construction." MMA uses
    wavelet-derived weights (Haar/D4) rather than $\sqrt{\ell(J)/\ell(I)}$
    directly.
  - CAD: not formalised (per `stocktake/reports/cad-lean.md` §5 'Notable gaps: §6 square-zero worked example: not formalised').
**Notes:** This is the chat-4 square-zero kinematic-Fock refinement (cf.
[[def:algobj]] degenerate branch — the $a = b = 0$ algebra is associative
but not dagger-special, so the canonical algebra-derived
$\Delta = m^\dagger / \sqrt{\lambda}$ is undefined; the workaround is
this length-weighted prescription). The continuum limit is $L^2(X)$. The
generalisation to weight $h \ne 1/2$ (CFT primaries) is the conformal
refinement noted in `warn:`-tagged remark after `summary.tex:2136`.

---

## def:fib — Fibonacci fusion category

**Canonical:**
```latex
\begin{definition}[Fibonacci fusion category]\label{def:fib}
$\Fib$ has $\Irr(\Fib) = \{\one,\tau\}$ with fusion rules
\[
\one\otimes\one = \one, \quad
\one\otimes\tau = \tau\otimes\one = \tau, \quad
\tau\otimes\tau = \one\oplus\tau.
\]
Fibonacci is multiplicity-free: every $N_{ab}^{c}\in\{0,1\}$.
\end{definition}
```

**Source:** `summary.tex:1003`
**Aliases:** "$\Fib$", "Fibonacci anyon model", "Yang--Lee category"
(modular-data-equivalent to one chirality of the non-unitary Yang--Lee
minimal model; not used in this project).
**Translation map:**
  - MMA: `fibonacci_category()` (a TensorCategories.jl export, called in
    `test/test_categories.jl:7` and `test/test_golden_chain.jl:11`) returns
    the `FusionCategory` instance for Fibonacci, consumed by MMA's `src/`
    modules via a generic category parameter. Two simples (vacuum at index 1,
    $\tau$ at index 2); fusion rule $\tau\otimes\tau = \one\oplus\tau$
    verified by `test/test_categories.jl` (per `stocktake/reports/mma-julia.md`
    §2 line 48 and §3 line 75). Vacuum-index convention per
    [[def:mobile-Fock]] convention dependency #1.
  - CAD: `Fibonacci/FusionRules.lean::fibSkeletalFusionData` (Phase 5 P5.9) — the unique instance of [[def:fuscat]]'s CAD equivalent for Fibonacci. Per `stocktake/reports/cad-lean.md` §5 line 345: fusion rules complete; post-decoupling required for `Foundations/Configurations.lean` circular import (handled by P5.3 before P5.9). Peripheral: `Fibonacci/BraidMatrices.lean` (Phase 5 P5.13) proves the Fibonacci-specific braid-relation check (not a named claim in `summary.tex`, but covered for completeness — per `stocktake/reports/cad-lean.md` §5 line 352).
**Notes:** Specific instance of [[def:fuscat]]. Multiplicity-free, so per
P1.6(d) the latent LB-1 bug (`cft-anyons-q6h`) does not currently affect
Fibonacci. The quantum dimension $d_\tau = \varphi$ uses [[def:phi]]. The
F-symbol is [[def:fib-F]]; the multiplication is [[def:fib-mult]].

---

## def:phi — Golden ratio

**Canonical:**
```latex
\begin{definition}[Golden ratio]\label{def:phi}
\[
\varphi \;:=\; \frac{1+\sqrt 5}{2}, \qquad
\varphi^{2} \;=\; \varphi + 1.
\]
\end{definition}
```

**Source:** `summary.tex:1013`
**Aliases:** "$\varphi$", "golden mean", "golden section".
**Translation map:**
  - MMA: not separately defined; $\varphi = (1+\sqrt 5)/2$ appears
    implicitly in the Fibonacci F-matrix entries returned by
    `f_matrix(cache, \tau, \tau, \tau, \tau)` (involutory-gauge versions
    of $\varphi^{-1}, \varphi^{-1/2}$ per [[def:fib-F]]) and in the Fibonacci
    quantum dimension `dim(\tau) = \varphi` via TensorCategories.jl.
  - CAD: `Fibonacci/Basic.lean` (Phase 5 P5.7) — all golden-ratio identities from `summary.tex lem:fib-arith` proved (`φ^{-1} = φ − 1`, `φ^{-2} = 2 − φ`, `φ^{-2} + φ^{-1} = 1`, `2φ^{-2} + φ^{-3} = 1`). Per `stocktake/reports/cad-lean.md` §5 line 347.
**Notes:** Identities Lemma `lem:fib-arith` (`summary.tex:1020`):
$\varphi^{-1} = \varphi - 1$, $\varphi^{-2} = 2 - \varphi$,
$\varphi^{-2} + \varphi^{-1} = 1$, $2\varphi^{-2} + \varphi^{-3} = 1$.

---

## def:fib-F — Fibonacci F-matrix

**Canonical:**
```latex
\begin{definition}[Fibonacci F-matrix]\label{def:fib-F}
The only non-trivial F-symbol on Fibonacci is $F^{\tau\tau\tau}_{\tau}$,
acting on the two-dimensional space $\Hom(\tau,\tau\otimes\tau\otimes\tau)$
in the standard basis where the intermediate channel is either $\one$ or
$\tau$:
\[
F^{\tau\tau\tau}_{\tau} \;=\;
\begin{pmatrix} \varphi^{-1} & \varphi^{-1/2}\\[2pt]
                \varphi^{-1/2} & -\varphi^{-1}\end{pmatrix}.
\]
\end{definition}
```

**Source:** `summary.tex:1060`
**Aliases:** "$F^{\tau\tau\tau}_\tau$", "Fibonacci 6j-symbol".
**Translation map:**
  - MMA: `f_matrix(cache, \tau, \tau, \tau, \tau)` for
    `cache = build_fsymbol_cache(fibonacci_category())` returns the
    (involutory-gauge) Fibonacci F-matrix per `src/MobileAnyons/fsymbols.jl`
    and `stocktake/reports/mma-julia.md` §2 line 51. Tested by
    `test/test_fsymbols.jl`: size $2 \times 2$, involutory $F^2 = I$, trivial
    vacuum factors $= 1$. **Caution (CLAUDE.md hallucination-risk):**
    TensorCategories.jl uses an **involutory** gauge; for Fibonacci specifically
    the entries coincide with `summary.tex`'s unitary gauge by Lemma
    `lem:F-invol` ($F^2 = I$), but in general the unitary-vs-involutory
    translation rule [P1.6(b)] must be invoked.
  - CAD: `Fibonacci/Matrix.lean::FibF` (Phase 5 P5.8). The 2×2 matrix entries match `summary.tex Def 7.5` verbatim; `FibF_involutive` proves `F² = I`; `FibF_orthogonal` proves `F^T F = I`. Matches `summary.tex`'s unitary gauge (involutory coincides for Fibonacci per [P1.6(b)]). Per `stocktake/reports/cad-lean.md` §5 line 348.
**Notes:** Specific instance of [[def:fsymbol]]. Real, symmetric, unitary,
and involutory (Lemma `lem:F-invol`). Used in the algebra-parameter
fixed-point equation `prop:assoc-F` and elsewhere.

---

## def:PF — PF amplitudes

**Canonical:**
```latex
\begin{definition}[PF amplitudes]\label{def:PF}
Set
\[
A^{a}_{bc} \;:=\; \sqrt{\frac{d_b\,d_c}{d_a\,D^{2}}} \qquad \text{(when $N_{bc}^a = 1$).}
\]
For Fibonacci this gives:
$x_{\mathrm{PF}} = A^{\one}_{\one\one} = 1/D$,
$y_{\mathrm{PF}} = A^{\one}_{\tau\tau} = \varphi/D$,
$p_{\mathrm{PF}} = A^{\tau}_{\tau\one} = 1/D$,
$q_{\mathrm{PF}} = A^{\tau}_{\one\tau} = 1/D$,
$r_{\mathrm{PF}} = A^{\tau}_{\tau\tau} = \sqrt{\varphi}/D$.
\end{definition}
```

**Source:** `summary.tex:1114`
**Aliases:** "Perron--Frobenius splitting", "quantum-dimension splitting",
"$A^a_{bc}$".
**Translation map:**
  - MMA: not a named struct. The PF amplitudes
    $A^a_{bc} = \sqrt{d_b d_c / (d_a D^2)}$ are derivable from TensorCategories'
    `dim` function but are not separately computed in MMA — MMA's fine-graining
    uses geometric (wavelet) normalisation, not PF normalisation (per
    [[def:refmap]] structural difference and `stocktake/reports/mma-julia.md`
    §5 lines 133-135).
  - CAD: `Fibonacci/Binary.lean::PFBinaryEta` (Phase 5 P5.10) — the PF binary refinement amplitudes (and the PF isometry lemma `η†η = id_Q`). Per `stocktake/reports/cad-lean.md` §5 line 349.
**Notes:** "PF" = Perron--Frobenius per [[conv:acro]]. Derived from
[[def:qdim]] alone; the $D^2$ is the total quantum dimension squared.
Compatible with [[def:fib]] data: Lemma `lem:PF-isom` (`summary.tex:1127`)
confirms isometry $\eta^\dagger \eta = \id_Q$.

---

## def:coassoc — Coassociative ansatz

**Canonical:**
```latex
\begin{definition}[Coassociative ansatz]\label{def:coassoc}
$\eta$ is \emph{coassociative} if $(\eta\otimes\id)\eta = (\id\otimes\eta)\eta$
(up to the associator, which in Fibonacci is the F-symbol of
Definition~\ref{def:fib-F}).
\end{definition}
```

**Source:** `summary.tex:1153`
**Aliases:** "categorical coassociativity (for $\eta$)".
**Translation map:**
  - MMA: **not implemented in MMA.** As with [[def:algobj]] and
    [[def:fib-mult]], MMA never constructs an algebra object or comultiplication,
    so the categorical coassociativity equation for $\eta$ does not arise.
    (This MMA-absent entry is the **categorical** coassoc — independent of the
    CLAUDE.md hallucination-risk callout #3 scalar-vs-categorical-coassoc
    overloading; see Notes.)
  - CAD: `Fibonacci/Coassoc.lean` (Phase 5 P5.11). **Critical scope disambiguation**: CAD proves **scalar coassociativity** (the F-symbol fixed-point equation on algebra parameters `(a, b)` per [[conv:1op]]) — NOT the categorical equation `(η⊗id)η = (id⊗η)η`. This is the CLAUDE.md hallucination-risk callout #3 (scalar-vs-categorical coassoc overloading). P5.11's docstring must preserve this disambiguation. Per `stocktake/reports/cad-lean.md` §5 line 350 and §3 (which explicitly notes 'categorical proof gap explicitly noted').
**Notes:** **Critical hallucination-risk callout (CLAUDE.md):
"coassociativity" is overloaded.** This entry is for the *categorical*
coassociativity of a splitting morphism $\eta$. By contrast, CAD's Lean
file `Fibonacci/Coassoc.lean` proves *scalar* coassociativity (the
F-symbol fixed-point equation on algebra parameters $a,b$ in
[[conv:1op]]) — that is **not** the categorical equation above. P5.11
will preserve this disambiguation in the Lean module docstring. The
unique strictly positive real solution to the joint system
(normalisation + coassociativity) is Theorem `thm:coassoc`
(`summary.tex:1159`): $x = \varphi^{-1}$, $y = \varphi^{-1/2}$,
$p = q = \varphi^{-1}$, $r = \varphi^{-3/2}$.

---

## def:fib-mult — Fibonacci multiplication

**Canonical:**
```latex
\begin{definition}[Fibonacci multiplication]\label{def:fib-mult}
On $A = \one\oplus\tau$, define $m:A\otimes A\to A$ by
\[
m(\one\otimes\one)=\one,\quad
m(\one\otimes\tau)=\tau,\quad
m(\tau\otimes\one)=\tau,
\]
and on $\tau\otimes\tau$, decompose by the splitting basis:
\[
m\big|_{\tau\otimes\tau}
\;=\;
m^{\one}_{\tau\tau}\,(v^{\one}_{\tau,\tau})^{\dagger}
+ m^{\tau}_{\tau\tau}\,(v^{\tau}_{\tau,\tau})^{\dagger},
\qquad
m^{\one}_{\tau\tau} = \sqrt{\varphi},\quad m^{\tau}_{\tau\tau} = \varphi^{-1/2}.
\]
\end{definition}
```

**Source:** `summary.tex:1323`
**Aliases:** "Chat 3 Fibonacci multiplication", "non-degenerate Fibonacci
algebra".
**Translation map:**
  - MMA: **not implemented in MMA.** Algebra-object multiplications
    $m: A \otimes A \to A$ are absent (per [[def:algobj]]); the specific
    Fibonacci multiplication on $\one \oplus \tau$ is not constructed.
  - CAD: not formalised (per `stocktake/reports/cad-lean.md` §5 'Notable gaps: §7.4 Fibonacci as dagger-special algebra; the uniqueness theorem: not formalised'). `Fibonacci/Coassoc.lean` covers only scalar coassociativity constraints.
**Notes:** Concrete instance of [[def:algobj]] satisfying both
associativity (Lemma `lem:fib-assoc`) and dagger-specialness with
$\lambda = \varphi^2$ (Lemma `lem:fib-special`). The unique
non-degenerate dagger-special algebra structure on $\one \oplus \tau$ in
Fibonacci, per Theorem `thm:branches`. Corollary `cor:Delta-coassoc`
identifies the derived $\Delta = \varphi^{-1} m^\dagger$ with the
coassociative isometric splitting of [[def:coassoc]] / Theorem
`thm:coassoc`.

---

## def:Zfunc — Cell partition functions

**Canonical:**
```latex
\begin{definition}[Cell partition functions]\label{def:Zfunc}
Pair the algebra $A = \one\oplus\tau$ with positive real-valued functions
$Z_\one,Z_\tau:[0,\infty)\to(0,\infty)$ satisfying $Z_\one(0)=1$,
$Z_\tau(0)=0$, and the convolutional identities
\begin{align}
Z_\one(x+y) &= Z_\one(x)Z_\one(y) + \varphi\,Z_\tau(x)Z_\tau(y),
\label{eq:Z1conv}\\
Z_\tau(x+y) &= Z_\tau(x)Z_\one(y) + Z_\one(x)Z_\tau(y) + \varphi^{-1}Z_\tau(x)Z_\tau(y).
\label{eq:Ztconv}
\end{align}
A one-parameter solution is
\begin{equation}\label{eq:Zexp}
Z_\one(L) = \varphi^{-2}e^{\rho\varphi L} + \varphi^{-1}e^{-\rho L}, \qquad
Z_\tau(L) = \varphi^{-2}\bigl(e^{\rho\varphi L} - e^{-\rho L}\bigr),
\end{equation}
with $\rho>0$ a density scale.
\end{definition}
```

**Source:** `summary.tex:1461`
**Aliases:** "$Z_\one, Z_\tau$", "Fibonacci cell partition functions",
"per-cell weight".
**Translation map:**
  - MMA: **not implemented in MMA.** The cell partition functions
    $Z_\one(L), Z_\tau(L)$ encode cell-length geometry; MMA's cells are all
    unit-length lattice sites (per [[def:partition]] MMA bullet), so the
    convolutional content collapses to the trivial $L = 1$ case.
  - CAD: not formalised (per `stocktake/reports/cad-lean.md` §5 'Notable gaps: §6 square-zero ...').
**Notes:** The convolutional identities encode the multiplication
structure constants of [[def:fib-mult]] (per the remark at
`summary.tex:1479`); the exponential one-parameter solution is the
geometric input for [[def:rchild]].

---

## def:rchild — r-child Fibonacci refinement

**Canonical:**
```latex
\begin{definition}[$r$-child Fibonacci refinement]\label{def:rchild}
Let $I = J_1\cup\cdots\cup J_r$ with $\ell_i := \ell(J_i)$, $L := \ell(I)$.
For each $a = (a_1,\dots,a_r)\in\{\one,\tau\}^{r}$ and each splitting-basis
vector $v^{c}_{a,\alpha}\in\Hom(c,a_1\otimes\cdots\otimes a_r)$, let
$M^{c}_{a,\alpha}$ be the matrix elements of the $r$-ary Fibonacci
multiplication $m^{(r)}:A^{\otimes r}\to A$ in the splitting basis. Define
\[
E_{I\to(J_1,\dots,J_r)}(c)
\;:=\;
\frac{1}{\sqrt{Z_c(L)}}\,
\sum_{a,\alpha} M^{c}_{a,\alpha}
\sqrt{\prod_{i=1}^{r} Z_{a_i}(\ell_i)}\;v^{c}_{a,\alpha}.
\]
\end{definition}
```

**Source:** `summary.tex:1488`
**Aliases:** "geometry-coherent Fibonacci refinement",
"$E_{I\to(J_1,\dots,J_r)}$".
**Translation map:**
  - MMA: **not implemented in MMA.** Built on [[def:fib-mult]] (absent
    per [[def:algobj]]) and [[def:Zfunc]] (absent — cell-length geometry
    degenerate in MMA).
  - CAD: not formalised (per `stocktake/reports/cad-lean.md` §5 'Notable gaps: §6 square-zero ...'). The general r-child Fibonacci refinement is built on `def:fib-mult` (also not in CAD scope).
**Notes:** Concrete instance of [[def:refmap]]. Combines the algebra
multiplication [[def:fib-mult]] with the geometric weights [[def:Zfunc]];
Proposition `prop:rchild` (`summary.tex:1503`) verifies isometry + coherence.

---

## def:ising — Ising fusion category

**Canonical:**
```latex
\begin{definition}[Ising fusion category]\label{def:ising}
Ising has $\Irr(\Ising) = \{\one, \sigma, \psi\}$ with fusion
\[
\sigma\otimes\sigma = \one\oplus\psi, \qquad
\sigma\otimes\psi = \psi\otimes\sigma = \sigma, \qquad
\psi\otimes\psi = \one.
\]
Quantum dimensions: $d_\one=d_\psi=1$, $d_\sigma=\sqrt 2$ (from $d_\sigma^{2} = 1+1$),
total quantum dimension $D = \sqrt{1+2+1} = 2$.
\end{definition}
```

**Source:** `summary.tex:1598`
**Aliases:** "$\Ising$", "Ising anyon model", "TLJ at $\delta = \sqrt 2$"
(the Temperley--Lieb--Jones category at the Ising point).
**Translation map:**
  - MMA: `ising_category()` (a TensorCategories.jl export, called in
    `test/test_categories.jl:26`) returns the `FusionCategory` instance for
    Ising, consumed by MMA's `src/` modules via a generic category parameter.
    Three simples (vacuum $\one$ at index 1, $\sigma$ at index 2, $\psi$ at
    index 3; per the standard `simples(ising_category())` ordering); fusion
    table verified by `test/test_categories.jl` (per
    `stocktake/reports/mma-julia.md` §2 line 48). The dense $\sigma$-sector
    ([[def:dense]]) is realised as
    `enumerate_configs_hc(L, L, ising_category())` (all sites labelled
    $\sigma$); the golden-chain-type interaction Hamiltonian uses
    `interaction_hamiltonian` per [[def:TL-cat]]. Quantum dimension
    $d_\sigma = \sqrt 2$ via TensorCategories' `dim(\sigma)`.
  - CAD: `Ising/Basic.lean` (Phase 5 P5.15) — fusion table proved; conformal weights `Δ_σ = 1/8`, `Δ_ε = 1` proved. **Caveat per `stocktake/reports/cad-lean.md` §5 line 346 + §4 'State Assessment'**: CAD's Ising file is NOT currently connected to `FiniteSkeletalFusionData` (no `isingSkeletalFusionData` instance analogous to `fibSkeletalFusionData`). P5.15 must either add the connection or file a follow-up task.
**Notes:** Specific instance of [[def:fuscat]]. Multiplicity-free per
P1.6(d). Quantum dimensions via [[def:qdim]]. The F-symbol is
[[def:ising-F]]. The dense $\sigma$-sector is [[def:dense]]; the
TL generator is [[def:TL-cat]].

---

## def:ising-F — Ising F-symbol

**Canonical:**
```latex
\begin{definition}[Ising F-symbol]\label{def:ising-F}
The single nontrivial F-symbol relevant to the Temperley--Lieb chain is
\[
F^{\sigma\sigma\sigma}_{\sigma}
\;=\;
\frac{1}{\sqrt 2}\begin{pmatrix} 1 & 1\\ 1 & -1\end{pmatrix},
\]
acting on $\Hom(\sigma,\sigma\otimes\sigma\otimes\sigma)\cong\mathbb{C}^{2}$ with the
intermediate channels $\{\one,\psi\}$.
\end{definition}
```

**Source:** `summary.tex:1609`
**Aliases:** "Ising 6j-symbol", "$F^{\sigma\sigma\sigma}_\sigma$".
**Translation map:**
  - MMA: `f_matrix(cache, \sigma, \sigma, \sigma, \sigma)` for
    `cache = build_fsymbol_cache(ising_category())` returns the $2 \times 2$
    Hadamard-type F-matrix from TensorCategories per `src/MobileAnyons/fsymbols.jl`.
    **Caution** as for [[def:fib-F]] regarding involutory-vs-unitary gauge
    [P1.6(b)].
  - CAD: not directly formalised. `Ising/Basic.lean` (Phase 5 P5.15) has the fusion table but not an explicit F-matrix struct (per `stocktake/reports/cad-lean.md` §5 — no Ising F-matrix row).
**Notes:** Specific instance of [[def:fsymbol]]. Equals the
2×2 Hadamard matrix up to normalisation.

---

## def:dense — Dense sector

**Canonical:**
```latex
\begin{definition}[Dense sector]\label{def:dense}
Take a one-dimensional lattice $\{1,\dots,N\}$ and restrict to the
configuration $a_1=\cdots=a_N=\sigma$. The \emph{dense $\sigma$-Hilbert
space in charge sector $c$} is
\[
\Hh_N^{\mathrm{dense}}(c) \;:=\; \Hom_{\Ising}(c,\,\sigma^{\otimes N}).
\]
A basis is a \emph{fusion path} $(x_0,x_1,\dots,x_N)$ with $x_0=\one$,
$x_N=c$, and $x_i\subset x_{i-1}\otimes\sigma$.
\end{definition}
```

**Source:** `summary.tex:1622`
**Aliases:** "dense $\sigma$-anyon chain", "$A_3$ RSOS chain" (cf. Lemma
`lem:path-adj`), "Temperley--Lieb chain at $\delta = \sqrt 2$".
**Translation map:**
  - MMA: realised as the all-$\sigma$ labelled sector:
    `enumerate_configs_hc(L, L, ising_category())` returns a single config
    with `labels = [\sigma, \sigma, \ldots, \sigma]`; `enumerate_fusion_trees`
    then enumerates the fusion-path basis $(x_0 = \one, x_1, \ldots, x_L = c)$
    with $x_i \subset x_{i-1} \otimes \sigma$. **No existing MMA test
    exercises this dense Ising sector** — the related test files
    `test/test_golden_chain.jl` and `test/test_golden_chain_cft.jl` cover
    the analogous **Fibonacci** golden chain (c = 7/10 tricritical Ising
    fixed point, per `stocktake/reports/mma-julia.md` §2 lines 52-53),
    not the categorical Ising dense $\sigma$-chain defined here (which
    would flow to c = 1/2 critical Ising per [[def:isingcft]]).
  - CAD: not formalised (per `stocktake/reports/cad-lean.md` §5 'Notable gaps: §8.2–8.4 (TL generators, dense Ising chain, Koo–Saleur): not formalised').
**Notes:** Specific configuration of [[def:Hlatt]] in $\Ising$. The
fusion-path basis is the left-associated multiplicity-free splitting tree
([[def:splitbasis]]); P1.6(i) will lock this ordering as the canonical
fusion-tree convention. Path-adjacency = $A_3$ Dynkin (Lemma
`lem:path-adj`).

---

## def:TL-cat — Categorical Temperley--Lieb generator

**Canonical:**
```latex
\begin{definition}[Categorical TL generator]\label{def:TL-cat}
Let $P_{i}^{(\one)}$ be the orthogonal projector onto the
$\one$-fusion channel of $\sigma_i\otimes\sigma_{i+1}$. Define
\[
e_i \;:=\; \sqrt 2 \;P_i^{(\one)} \;=\; d_\sigma\,P_i^{(\one)}.
\]
\end{definition}
```

**Source:** `summary.tex:1648`
**Aliases:** "$e_i$", "TL generator", "$d_\sigma P_i^{(\one)}$" (the
explicit form), "Jones projection (scaled)".
**Translation map:**
  - MMA: `src/MobileAnyons/interaction.jl::interaction_hamiltonian`
    (and the sector variant `interaction_hamiltonian_sector`) builds
    $H = \sum_j P_j$ where each $P_j$ is the **Hermitian** vacuum-channel
    projector at bond $j$ (projecting $\sigma_j \otimes \sigma_{j+1}$ onto
    $\one$), per `stocktake/reports/mma-julia.md` §5 line 137. Translation:
    $P_j = e_j / d_\sigma$ where $e_j$ is the categorical TL generator here;
    i.e., MMA's $H = \sum_j P_j$ equals $\sum_j e_j / d_\sigma$ in
    `summary.tex`'s TL normalisation. For Ising $d_\sigma = \sqrt 2$; for
    Fibonacci the analogous golden-chain Hamiltonian uses $d_\tau = \varphi$.
    **Gauge fix**: because TensorCategories.jl uses an involutory F-matrix
    gauge, MMA uses the Hermitian projector $P_H = vv^\dagger / |v|^2$ rather
    than the raw $F$-column projector (per `mma-julia.md` §2 line 37 and §3
    lines 76-78). Tested by `test/test_golden_chain.jl` and
    `test/test_fibonacci_spectra.jl` (Fibonacci t-J model + dense-limit
    recovery).
  - CAD: not formalised (per `stocktake/reports/cad-lean.md` §5 'Notable gaps: §8.2–8.4 ...').
**Notes:** $d_\sigma = \sqrt 2$ from [[def:ising]]. Theorem `thm:TL-rel`
verifies the standard Temperley--Lieb relations.

---

## def:KS-scalars — Koo--Saleur scalars at TL parameter γ

**Canonical:**
```latex
\begin{definition}[Koo--Saleur scalars at TL parameter $\gamma$]\label{def:KS-scalars}
For the TL chain at $\delta = 2\cos\gamma$, let
\[
\kappa \;:=\; \frac{\gamma}{\pi\sin\gamma}, \qquad
v \;:=\; \frac{\pi\sin\gamma}{\gamma},
\]
the latter being the sound velocity in TL-site units. For Ising
$\gamma = \pi/4$ and $\delta = \sqrt 2$, computation gives
$\sin(\pi/4) = \sqrt 2 / 2$, so
\[
\kappa_{\mathrm{Ising}} \;=\; \frac{\pi/4}{\pi\cdot \sqrt 2/2}
\;=\; \frac{1}{2\sqrt 2}, \qquad
v_{\mathrm{Ising}} \;=\; \frac{\pi\cdot\sqrt 2/2}{\pi/4} \;=\; 2\sqrt 2.
\]
\end{definition}
```

**Source:** `summary.tex:1737`
**Aliases:** "$\kappa, v$", "Koo--Saleur constants".
**Translation map:**
  - MMA: not separately named. The Koo-Saleur constants $\kappa, v$
    appear implicitly in `src/MobileAnyons/virasoro.jl::hamiltonian_fourier_modes`
    (which builds $H_n = \sum_{j=1}^{L-1} \sin(\pi n j / L)\, P_j$); MMA's
    OBC sine-transform variant skips the explicit $\kappa$ normalisation.
    Per `stocktake/reports/mma-julia.md` §3 line 89 and §5 line 139.
  - CAD: not formalised (per `stocktake/reports/cad-lean.md` §5 'Notable gaps: §9 Koo–Saleur lattice Virasoro approximants: not formalised').
**Notes:** Underlying source (Koo--Saleur 1994) is flagged `\unchecked`
in `summary.tex` per `CITATION_INDEX.md`. The $v$ here is sound velocity,
distinct from "splitting vertex $v^c_{ab}$" in [[def:splitbasis]] —
context disambiguates.

---

## def:KS-Ln — Koo--Saleur lattice Virasoro approximants

**Canonical:**
```latex
\begin{definition}[Koo--Saleur lattice Virasoro approximants]\label{def:KS-Ln}
\unchecked\ In chat~1's normalisation, the lattice approximants to the
chiral and anti-chiral Virasoro generators are
\begin{align*}
L_n^{(N)} &= \frac{N}{4\pi}\Bigl[-\kappa\sum_{j=1}^{N}e^{2\pi i n j/N}\bigl(e_j - e_\infty
                + i\kappa\,[e_j, e_{j+1}]\bigr)\Bigr] + \tfrac{c}{24}\delta_{n,0},\\
\bar L_n^{(N)} &= \frac{N}{4\pi}\Bigl[-\kappa\sum_{j=1}^{N}e^{-2\pi i n j/N}\bigl(e_j - e_\infty
                - i\kappa\,[e_j, e_{j+1}]\bigr)\Bigr] + \tfrac{c}{24}\delta_{n,0}.
\end{align*}
For Ising, $\kappa = 1/(2\sqrt 2)$ and $c = 1/2$.
\end{definition}
```

**Source:** `summary.tex:1768`
**Aliases:** "$L_n^{(N)}, \bar L_n^{(N)}$", "lattice Virasoro generators".
**Translation map:**
  - MMA: `src/MobileAnyons/virasoro.jl::hamiltonian_fourier_modes` builds
    an **OBC sine-transform** variant $H_n = \sum_{j=1}^{L-1} \sin(\pi n j / L)\, P_j$
    — a different (weaker) approximant from `summary.tex`'s PBC
    complex-exponential $L_n^{(N)}$ defined here. Per
    `stocktake/reports/mma-julia.md` §5 line 139: "they differ in boundary
    conditions (OBC sine vs PBC exponential) and normalisation, so they are
    not the same operator." The companion `virasoro_commutator_check` returns
    `c_estimate = NaN` (stub — `mma-julia.md` §4 line 113). Actual $c = 7/10$
    extraction is performed via Cardy finite-size fit in
    `test/test_golden_chain_cft.jl`, not via algebraic commutator check.
    `summary.tex`'s `\unchecked` flag on Conjecture `conj:KS` remains
    undischarged.
  - CAD: not formalised (per `stocktake/reports/cad-lean.md` §5 'Notable gaps: §9 ...').
**Notes:** Body carries `\unchecked` as part of the definition itself —
the Koo--Saleur convergence is in Conjecture `conj:KS` (defined at
`summary.tex:2375-2376`; referenced at line 1735) per `summary.tex`'s
flag, and the central-charge check (Remark following) is also
`\unchecked`. Uses $\kappa$ from [[def:KS-scalars]] and the TL
generators [[def:TL-cat]].

---

## def:primary — Primary, conformal weight, scaling dimension

**Canonical:**
```latex
\begin{definition}[Primary, conformal weight, scaling dimension]\label{def:primary}
A two-dimensional CFT is specified by a (graded, projective) representation
of two commuting Virasoro algebras with generators $L_n,\bar L_n$ and central
charges $c,\bar c$. A \emph{primary} field $\Phi$ of weights $(h,\bar h)$
satisfies $L_n\Phi = 0$ for $n>0$, $L_0\Phi = h\Phi$ (and analogously for
$\bar L$). Its \emph{scaling dimension} is $\Delta := h+\bar h$. In a
\emph{chiral} CFT only $h$ appears and $\Delta := h$.
\end{definition}
```

**Source:** `summary.tex:1818`
**Aliases:** "primary field", "$h, \bar h$", "$\Delta$" (scaling dimension).
**Translation map:**
  - MMA: not formalised as a categorical-CFT structure. Conformal weights
    $h$ appear only numerically in `test/test_golden_chain_cft.jl`'s Cardy
    finite-size fit (3-parameter least-squares for $c$ and the leading primary
    weight from $L = 4\ldots 12$ spectra; per `stocktake/reports/mma-julia.md`
    §2 line 54 and §3 line 93). No symbolic representation of primaries or
    Virasoro-pair representations.
  - CAD: Fibonacci-specific case in `Fibonacci/CFTWeights.lean` (Phase 5 P5.12) — `τ` chiral weight `2/5`, descendant weights proved. General 2D CFT primary structure (Virasoro-pair representation, conformal weights `(h, h̄)`) not formalised in CAD. Per `stocktake/reports/cad-lean.md` §5 line 351.
**Notes:** Standard 2D CFT definition. Instances: [[def:isingcft]]
(diagonal Ising primaries with weights $h_\one = 0$, $h_\sigma = 1/16$,
$h_\psi = 1/2$); the chiral $(G_2)_1$ Fibonacci with $h_\tau = 2/5$
(Warning `warn:fibCFTs`, `summary.tex:1855` — and $(G_2)_1$ is flagged
`\unchecked` per `CITATION_INDEX.md`).

---

## def:stress — Stress tensor

**Canonical:**
```latex
\begin{definition}[Stress tensor]\label{def:stress}
$T(z) := \sum_n L_n z^{-n-2}$ has OPE
\[
T(z)T(0) \;\sim\; \frac{c/2}{z^{4}} + \frac{2T(0)}{z^{2}} + \frac{\partial T(0)}{z} + \cdots
\]
\end{definition}
```

**Source:** `summary.tex:1827`
**Aliases:** "$T(z)$", "energy--momentum tensor".
**Translation map:**
  - MMA: not implemented. The stress tensor $T(z)$ is a continuum-CFT
    object; MMA realises only the lattice approximant via
    `hamiltonian_fourier_modes` per [[def:KS-Ln]].
  - CAD: not formalised (no general stress-tensor / OPE infrastructure in CAD per `stocktake/reports/cad-lean.md` §5 gaps; CFT data is per-instance only).
**Notes:** Standard 2D CFT definition. Generates the [[def:primary]]
algebra; $T = L_{-2}\one$ per Remark `rem:Virasoro` (line 2113).

---

## def:OPE — OPE coefficient

**Canonical:**
```latex
\begin{definition}[OPE coefficient]\label{def:OPE}
Given two primaries $\Phi_a, \Phi_b$, their short-distance product expands as
\[
\Phi_a(z)\,\Phi_b(0) \;\sim\; \sum_c C_{abc}\,z^{h_c-h_a-h_b}\,\bar z^{\bar h_c-\bar h_a-\bar h_b}\,\Phi_c(0) + (\text{descendants}),
\]
with $C_{abc}$ the (normalisation-dependent) OPE coefficient.
\end{definition}
```

**Source:** `summary.tex:1834`
**Aliases:** "$C_{abc}$", "structure constant" (in some literatures),
"operator-product expansion coefficient".
**Translation map:**
  - MMA: not implemented. OPE coefficients $C_{abc}$ are continuum-CFT
    data; MMA has no extraction infrastructure beyond the central-charge
    Cardy fit in `test/test_golden_chain_cft.jl` (per
    `stocktake/reports/mma-julia.md` §3 line 93).
  - CAD: not formalised. `Fibonacci/CFTWeights.lean` (Phase 5 P5.12) handles individual primaries' weights but not the general OPE coefficient structure (per `stocktake/reports/cad-lean.md` §5).
**Notes:** Uses [[def:primary]]. Specific values for the diagonal Ising
model in [[def:isingcft]] and (with $h_\tau = 2/5$) for chiral $(G_2)_1$
Fibonacci.

---

## def:isingcft — Diagonal Ising data

**Canonical:**
```latex
\begin{definition}[Diagonal Ising data]\label{def:isingcft}
The diagonal Ising minimal model $M(3,4)$ has central charge $c=1/2$.
Its primaries are $\one,\sigma,\psi$ with chiral weights $h_\one=0$,
$h_\sigma=1/16$, $h_\psi=1/2$, and nonchiral scaling dimensions
$\Delta_\one=0$, $\Delta_\Sigma=1/8$, $\Delta_\varepsilon=1$ in the bulk
(here $\Sigma$ is the bulk spin field and $\varepsilon$ the bulk energy
field).
\end{definition}
```

**Source:** `summary.tex:1844`
**Aliases:** "$M(3,4)$", "Ising minimal model", "$c = 1/2$ minimal model".
**Translation map:**
  - MMA: not formalised symbolically. **Closest MMA result**:
    `test/test_golden_chain_cft.jl` extracts $c = 7/10$ via Cardy
    finite-size fit on $L = 4\ldots 12$ spectra at the **tricritical**
    Ising point (loose tolerance `< 0.15`) — this corresponds to
    `summary.tex`'s chiral $(G_2)_1$ / Fibonacci data, not the diagonal
    $c = 1/2$ Ising of this entry. Per `stocktake/reports/mma-julia.md`
    §2 line 54 and §3 line 93. The diagonal Ising data $c = 1/2$,
    $h_\sigma = 1/16$, $h_\psi = 1/2$ is not separately verified in MMA.
  - CAD: `Ising/Basic.lean` (Phase 5 P5.15) — `Δ_σ = 1/8`, `Δ_ε = 1` proved. Central charge `c = 1/2` asserted via the same file. Bulk-field labels `Σ, ε` (this entry's Notes) are distinct from categorical labels `σ, ψ` in CAD as well.
**Notes:** Diagonal $\ne$ chiral. The categorical [[def:ising]] and this
CFT data are different objects — the categorical Ising is the fusion
category, this is the 2D CFT. The bulk field labels $\Sigma, \varepsilon$
are distinct from the categorical labels $\sigma, \psi$; this potential
notational confusion is flagged in the definition body.

---

## def:RG-amp — OPE/RG amplitude ansatz

**Canonical:**
```latex
\begin{definition}[OPE/RG amplitude ansatz]\label{def:RG-amp}
Fix an RG scale factor $b>1$ and let $\rho := b^{-1}$ be a dimensionless
fine separation in coarse units. For a chiral CFT, the OPE/blocking
coefficient connecting fine fusion configuration $(b_1,\dots,b_r)$ to coarse
charge $a$ is taken in the form
\[
\beta^{a}_{b_1\cdots b_r}(\rho) \;\sim\; \Gamma^{a}_{b_1\cdots b_r}\,
\rho^{h_a - \sum_i h_{b_i}}.
\]
The exponents are universal CFT data; the constants $\Gamma$ are
Wilsonian/scheme-dependent.
\end{definition}
```

**Source:** `summary.tex:1875`
**Aliases:** "$\beta^a_{b_1\cdots b_r}(\rho)$", "RG ansatz", "OPE
ansatz", "Wilsonian blocking coefficient".
**Translation map:**
  - MMA: not implemented. The RG amplitude ansatz
    $\beta^a_{b_1\cdots b_r}(\rho) \sim \Gamma^a_{b_1\cdots b_r}\rho^{h_a - \sum h_{b_i}}$
    requires symbolic CFT weights and Wilsonian RG infrastructure absent in
    MMA (which works only in the lattice/Cardy-numerical regime per
    [[def:primary]] MMA bullet).
  - CAD: Fibonacci-specific RG-decorated amplitude formulas in `Fibonacci/RGNoMixing.lean` (Phase 5 P5.14) — proved for both rows of the F-matrix. Abstract polar-decomposition canonical-section framework in `LinearAlgebra/Polar.lean` (Phase 4 P4.3) + general no-mixing scalar formula in `LinearAlgebra/NoMixing.lean` (P4.10). Per `stocktake/reports/cad-lean.md` §5 lines 353, 360, 361.
**Notes:** Exponents come from [[def:primary]] weights. Specific
binary-blocking instance for Fibonacci-$(G_2)_1$ at Lemma `lem:fib-beta`.
The canonical isometric refinement from this ansatz is via Theorem
`thm:polar` (polar decomposition); see [[def:polar-repair]] for the
non-tree analogue.

---

## def:scalop — Scaling operator

**Canonical:**
```latex
\begin{definition}[Scaling operator]\label{def:scalop}
A \emph{scaling operator} of the ascending channel $\Aa$ at RG scale factor
$b$ is an eigenoperator $\Phi_i$ with eigenvalue $\lambda_i = b^{-\Delta_i}$
(nonchiral) or $b^{-h_i}$ (chiral).
\end{definition}
```

**Source:** `summary.tex:1958`
**Aliases:** "eigenoperator", "scaling field".
**Translation map:**
  - MMA: not implemented as a named object. Eigenvalues of the lattice
    ascending channel $V^\dagger H V$ appear implicitly in
    `test/test_convergence.jl`'s spectral convergence checks (per
    `stocktake/reports/mma-julia.md` §2 line 65); per-eigenvalue
    identification with CFT scaling dimensions $b^{-\Delta_i}$ is not
    performed.
  - CAD: `LinearAlgebra/ChargeOnly.lean` (Phase 4 P4.14) + `LinearAlgebra/DiagonalScaling.lean` (P4.13) — eigenvalue structure of the charge-only specialisation proved. The 'charge-only fails CFT spectrum' Warning §8.5 (`summary.tex warn:charge-only`) is documented but NOT a CAD theorem.
**Notes:** "Ascending channel" is [[def:ascending]]. Eigenvalues are
controlled by [[def:primary]] scaling dimensions. Warning
`warn:charge-only` (`summary.tex:1964`) is the key caveat: charge-only
operator bases generically miss the CFT spectrum.

---

## def:persist — Strict persistence embedding

**Canonical:**
```latex
\begin{definition}[Strict persistence embedding]\label{def:persist}
For a 1D lattice $\{1,\dots,N\}\subset\{1,\dots,2N\}$, the embedding
$E_N:\Hh_N\to\Hh_{2N}$ places each occupied $\tau$ on the even sublattice
and inserts vacancies at the odd refinement sites; the fusion path is
preserved.
\end{definition}
```

**Source:** `summary.tex:1982`
**Aliases:** "$E_N$", "persistence", "even-sublattice embedding".
**Translation map:**
  - MMA: closest realisation is
    `src/MobileAnyons/finegraining.jl::trivial_embedding` ($j \mapsto 2j-1$)
    — places each particle on the odd sublattice of the doubled lattice with
    vacancies at even refinement sites. The even/odd parity differs from
    `summary.tex`'s "even-sublattice" convention here by an overall site-shift,
    but the structural content (strict-persistence placement on a sublattice
    of the refined lattice) coincides. Always isometric. Per
    `stocktake/reports/mma-julia.md` §3 line 82.
  - CAD: not formalised (per `stocktake/reports/cad-lean.md` §5 'Notable gaps: §11 non-tree / pair-creation interpolation: not formalised').
**Notes:** Building block for [[def:Jinterp]] (the non-tree
interpolation kernel). Concrete instance of [[def:refmap]] restricted to
the strict-persistence ansatz, before pair-creation [[def:pair-create]]
augmentation.

---

## def:pair-create — Local pair-creation

**Canonical:**
```latex
\begin{definition}[Local pair-creation]\label{def:pair-create}
Insertion of a neutral $\tau\tau$ pair after the $r$-th particle in a fusion
path is the categorical map
\[
C_r:\Hom(c,\tau^{\otimes k})\to\Hom(c,\tau^{\otimes(k+2)}),
\qquad
C_r\,|x_0,\dots,x_k\rangle \;=\; \sum_z A_{x_r,z}\,|x_0,\dots,x_r,z,x_r,\dots,x_k\rangle.
\]
The coefficients $A_{x,z}$ come from the F-matrix:
\[
A_{\one,\tau} = 1, \qquad A_{\tau,\one} = \varphi^{-1}, \qquad A_{\tau,\tau} = \varphi^{-1/2}.
\]
These satisfy $|A_{\tau,\one}|^{2}+|A_{\tau,\tau}|^{2}
= \varphi^{-2}+\varphi^{-1} = 1$ (Lemma~\ref{lem:fib-arith}).
\end{definition}
```

**Source:** `summary.tex:1989`
**Aliases:** "$C_r$", "neutral $\tau\tau$ pair insertion",
"$\one\to\tau\tau$ coevaluation".
**Translation map:**
  - MMA: `src/MobileAnyons/paircreation.jl::pair_creation_operator` and
    `dual_pairs` realise the cross-sector $N \to N+2$ operator via F-symbol
    vacuum column (per `stocktake/reports/mma-julia.md` §2 line 39 and §3).
    Internal helper `_build_pair_intermediates`. Tested by
    `test/test_paircreation.jl`: sVec amplitudes $= +1$, Hermiticity, total
    charge preserved, Fibonacci nontrivial amplitudes. The Hermitian variant
    `pair_hamiltonian` builds $\Delta(h^\dagger + h)$.
  - CAD: not formalised (per `stocktake/reports/cad-lean.md` §5 'Notable gaps: §11 ...').
**Notes:** F-matrix coefficients come from [[def:fib-F]]; identity uses
`lem:fib-arith` ($\varphi^{-2}+\varphi^{-1}=1$). Component of the
non-tree interpolation kernel [[def:Jinterp]].

---

## def:Jinterp — Non-tree interpolation kernel

**Canonical:**
```latex
\begin{definition}[Non-tree interpolation kernel]\label{def:Jinterp}
Sum over (disjoint, non-crossing) matchings $\mathcal{M}$ of vacant
nearest-neighbour fine edges with a per-edge amplitude $\lambda_e$:
\[
J_N \;=\; \sum_{\mathcal{M}}\Bigl(\prod_{e\in\mathcal{M}}\lambda_e\Bigr)\,
              \Bigl(\prod_{e\in\mathcal{M}}C_e\Bigr)\circ E_N.
\]
``Old $\tau$ particles persist; the only new particles come from
$\one\to\tau\tau$.''
\end{definition}
```

**Source:** `summary.tex:2005`
**Aliases:** "$J_N$", "non-tree refinement", "persistence +
pair-creation kernel".
**Translation map:**
  - MMA: not assembled as the matching-sum $J_N$. Building block
    `pair_creation_operator` (per [[def:pair-create]]) exists in
    `src/MobileAnyons/paircreation.jl`. Closest experimental realisation is
    the number-changing isometry $V = V_0 + V_2$ in
    `test/test_number_changing_finegraining.jl` (constructed via Löwdin
    orthogonalisation; can return `nothing` if the Gram matrix is
    near-singular; **not exported** from the module — per
    `stocktake/reports/mma-julia.md` §4 line 116). This remains unfinished
    work.
  - CAD: not formalised (per `stocktake/reports/cad-lean.md` §5 'Notable gaps: §11 ...').
**Notes:** Combines [[def:persist]] ($E_N$) with [[def:pair-create]]
($C_e$). Generically **not** an isometry (Lemma `lem:Gram`, the F-matrix
$(1,1)$ entry $\varphi^{-1}$ produces a leading Gram-obstruction
overlap); repair routes are [[def:polar-repair]] and [[def:sidelobe]].

---

## def:polar-repair — Polar repair

**Canonical:**
```latex
\begin{definition}[Polar repair]\label{def:polar-repair}
Define $G_N := J_N^{\dagger}J_N$ and let
$I_N := J_N G_N^{-1/2}$. Then $I_N^{\dagger}I_N=\id$ by the
polar-decomposition argument of Theorem~\ref{thm:polar}.
\end{definition}
```

**Source:** `summary.tex:2037`
**Aliases:** "$I_N$", "polar-decomposition repair", "Gram-square-root
correction".
**Translation map:**
  - MMA: not formalised under this name. **Same operation**: Löwdin
    (symmetric) orthogonalisation $A \mapsto A(A^\dagger A)^{-1/2}$ is used
    in `src/MobileAnyons/wavelets.jl::one_particle_scaling_map` (lines 63-67)
    for OBC boundary correction of the one-particle R matrix per
    `stocktake/reports/mma-julia.md` §2 line 40 and §5 line 143 — this is
    exactly the polar decomposition $I_N := J_N G_N^{-1/2}$ here. MMA does
    not connect the operation to `summary.tex` §8.1's polar-decomposition
    framework.
  - CAD: the polar-decomposition framework is in `LinearAlgebra/Polar.lean` (Phase 4 P4.3) — matrix algebra complete; **existence of positive square root NOT proved (this is a Mathlib gap at time of writing); the inverse-square-root matrix `B^{-1/2}` is assumed given as input to the polar-section theorems** (per `stocktake/reports/cad-lean.md` §2.4 line 190 and §4 lines 327–328). The specific [[def:Jinterp]] polar repair is NOT in CAD scope (def:Jinterp itself isn't formalised per `stocktake/reports/cad-lean.md` §5 '§11 not formalised').
**Notes:** Repairs the Gram-obstructed [[def:Jinterp]] via Theorem
`thm:polar`. Alternative repair: [[def:sidelobe]] (different design
philosophy — local stencil, not non-local Gram).

---

## def:sidelobe — Sidelobe stencil

**Canonical:**
```latex
\begin{definition}[Sidelobe stencil]\label{def:sidelobe}
Replace strict persistence by the stencil
\[
S|i\rangle \;=\; b\,|2i\rangle + a\,|2i-1\rangle - a\,|2i+1\rangle.
\]
Then $\langle S|i\rangle, S|i+1\rangle\rangle = -|a|^{2}$.
Solving for cancellation of the $|\lambda|^{2}\varphi^{-1}$ overlap at first
order gives, with $|b|^{2}+2|a|^{2}=1$ (one-particle normalisation),
\[
|a|^{2} = \frac{|\lambda|^{2}}{\varphi+2|\lambda|^{2}}, \qquad
|b|^{2} = \frac{\varphi}{\varphi+2|\lambda|^{2}}.
\]
\end{definition}
```

**Source:** `summary.tex:2043`
**Aliases:** "$S$", "sidelobe-corrected persistence", "local stencil
repair".
**Translation map:**
  - MMA: not implemented. Conceptually nearest MMA structures are the
    Daubechies D4 filter taps in `src/MobileAnyons/wavelets.jl::daubechies_filter`
    ($K = 2$ — per `mma-julia.md` §3 line 80) — these are multi-site stencils
    but not the specific cancellation-of-$|\lambda|^2\varphi^{-1}$-overlap
    construction defined here.
  - CAD: not formalised (per `stocktake/reports/cad-lean.md` §5 'Notable gaps: §11 ...').
**Notes:** Alternative to [[def:polar-repair]] for the same Gram
obstruction. Replaces the strict-persistence [[def:persist]] with a
three-site stencil chosen so that next-neighbour overlaps cancel to
leading order.

---

## def:ope3 — OPE 3-tensor

**Canonical:**
```latex
\begin{definition}[OPE 3-tensor]\label{def:ope3}
An \emph{OPE 3-tensor} is a morphism $T^{c,\mu}_{a,b}\in\Hom_\Cc(a\otimes b, c)$,
or, equivalently after dualising, a vector in
$\Hom_\Cc(c,a\otimes b)$. Its support is exactly $\{(a,b,c):N_{ab}^{c}\ge 1\}$;
when $N_{ab}^{c}\ge 2$ a multiplicity index $\mu=1,\dots,N_{ab}^{c}$ is
required. The combined object $\{N_{ab}^{c}, T^{c,\mu}_{a,b}, F^{abc}_{d}\}$
satisfies the pentagon equation, controlling associativity of repeated
trivalent fusion.
\end{definition}
```

**Source:** `summary.tex:2071`
**Aliases:** "trivalent OPE tensor", "$T^{c,\mu}_{a,b}$", "fusion tensor"
(in some literatures).
**Translation map:**
  - MMA: structurally the same data as MMA's splitting-vertex content
    (per [[def:splitbasis]] MMA bullet) — `FusionTree` in
    `src/MobileAnyons/hilbert.jl` encodes the splitting morphism
    $v^a_{b,c} \in \Hom_\Cc(a, b\otimes c)$, which is the dualised OPE
    3-tensor $T^a_{b,c}$. Not separately named as a 3-tensor. The
    multiplicity index $\mu$ is absent because MMA's three categories are
    multiplicity-free (cf. LB-1 caveat per [[def:mobile-Fock]]).
  - CAD: not formalised (per `stocktake/reports/cad-lean.md` §5 'Notable gaps: §12 three-tensors from OPE: not formalised').
**Notes:** Dual presentation of [[def:splitbasis]] (splitting vertex
$v^a_{b,c;\mu}$ is the morphism in $\Hom_\Cc(a, b\otimes c)$ — same
data after dualising). The multiplicity index $\mu$ is required for
$N^c_{ab} \ge 2$; multiplicity-free [[def:fib]] and [[def:ising]] do not
need it. Pentagon = associativity = [[def:fsymbol]] cocycle condition.

---

## def:smear — Smeared cell field

**Canonical:**
```latex
\begin{definition}[Smeared cell field]\label{def:smear}
For a primary $\Phi$ of weight $h$ and a cell $I$ with test function $f_I$,
\[
\Phi_I[f_I] \;:=\; \int_I f_I(x)\,\Phi(x)\,dx.
\]
Taylor expand $\Phi(x)$ about the centre $x_I$:
\[
\Phi(x) = \sum_{n\ge 0}\frac{(x-x_I)^{n}}{n!}\,\partial^{n}\Phi(x_I).
\]
\end{definition}
```

**Source:** `summary.tex:2092`
**Aliases:** "$\Phi_I[f_I]$", "smeared primary", "moment expansion of
primary".
**Translation map:**
  - MMA: not implemented. Smeared cell fields $\Phi_I[f_I]$ are
    continuum-CFT objects; MMA has no continuum primary fields
    (cf. [[def:primary]] MMA bullet).
  - CAD: not formalised (no smeared-cell-field infrastructure in CAD per `stocktake/reports/cad-lean.md` §5).
**Notes:** Uses [[def:primary]]. Derivative descendants appear as moments
of the smearing geometry (Lemma `lem:moments`); the full Virasoro
descendant tower requires the stress-tensor Ward identities
(Remark `rem:Virasoro`). Underlies the geometry-enriched site object
[[def:Ageom]].

---

## def:Ageom — Geometry-enriched site object

**Canonical:**
```latex
\begin{definition}[Geometry-enriched site object]\label{def:Ageom}
Following Chat~3's reformulation, replace $Q$ by
\[
A_I^{\mathrm{geom}} \;:=\; \bigoplus_{\text{primaries } i} J_I^{(h_i)} \otimes a_i,
\]
where $J_I^{(h)}$ is a geometry-dependent jet/smearing space attached to
cell $I$, transforming under refinement by Taylor/conformal-coordinate
geometry weighted by $h$. The categorical fusion controls primary channels;
descendants are reproduced by jet geometry plus Ward identities.
\end{definition}
```

**Source:** `summary.tex:2175`
**Aliases:** "$A_I^{\mathrm{geom}}$", "jet-decorated site object",
"multiplicity-decorated $Q$ with jet content".
**Translation map:**
  - MMA: not implemented. The geometry-enriched site object
    $A_I^{\mathrm{geom}}$ requires jet/smearing-space decoration of each
    cell; MMA has no jet infrastructure and only flat lattice sites
    (cf. [[def:Q]] MMA bullet — MMA bakes in the un-enriched
    $Q_{\mathrm{full}}$ default).
  - CAD: not formalised (the geometry-enriched extension is not in CAD scope per `stocktake/reports/cad-lean.md` §5).
**Notes:** Geometry-enriched extension of [[def:Q]] (specifically, the
multiplicity-decorated choice of Remark `rem:Q-choices`(3) with
$M_a^{(I)} = J_I^{(h_a)}$). The "jet $J_I^{(h)}$" is the
finite-dimensional smearing space encoding derivative-descendant data
per [[def:smear]] / Lemma `lem:moments`. The relevant Hilbert space for
this enriched site object is constructed analogously to [[def:HP]] with
$A_I = A_I^{\mathrm{geom}}$.

---

## §B. Entries from outside `summary.tex`

Each entry below names its in-repo source explicitly. The slug is
GLOSSARY-internal — it is **not** a citable `\label` in the external
source.

---

## def:mobile-Fock — Mobile-Fock Hilbert space (MMA formulation)

**Canonical (LaTeX quote from MMA `finegraining.tex`, as preserved in
the bridge report):**

```latex
Let C be a fusion category with simple objects X_1 = 1, X_2, ..., X_d.
We consider N hard-core anyons on an L-site lattice with open boundary
conditions. The Hilbert space decomposes as
    H_N(L) = ⊕_{positions x_1 < ... < x_N, labels a_1,...,a_N}
             Mor(X_c, X_{a_1} ⊗ ... ⊗ X_{a_N})
where the direct sum runs over all hard-core configurations and all
label assignments from the non-vacuum simples.
```

**Canonical (full MMA basis structure, synthesised by the bridge report
from the Julia code `hilbert.jl:75-98`):**

```text
H_MMA(L) = ⊕_{N=0}^{L} ⊕_{c ∈ simples(C)} ⊕_{config ∈ enumerate_configs_hc(L,N,C)}
           ⊕_{fusion_tree of (config.labels) → c} ℂ.
```

Each `(config, fusion_tree, c)` is one basis vector; `Mor(X_c, …) =
Hom_C(X_c, …)`.

**Source:** `stocktake/reports/opus-hilbert-bridge.md:108-138` — the
in-repo authoritative description of MMA's framing. The bridge report
itself quotes `microscopic-mobile-anyons/tex/sections/finegraining.tex:8-13`
verbatim (the first block above) and synthesises the second block from
`microscopic-mobile-anyons/src/MobileAnyons/hilbert.jl:75-98`. MMA is
scheduled to import into this repo in Phase 8; until then, the bridge
report is the canonical in-repo source for this entry. **The slug
`def:mobile-Fock` is GLOSSARY-internal; it is not the literal `\label`
of any LaTeX environment in the MMA source.**
**Aliases:** "MMA Hilbert space", "`H_MMA(L)`", "mobile anyons Fock
space", "hard-core-anyon Fock space on an `L`-site lattice".
**Translation map:**
  - **Summary.tex / partition [[def:HP]]**: per bridge report §2.3
    (lines 232–238). Mobile-Fock is a special case of the partition
    formulation; the partition formulation is strictly more general
    (allows per-cell $A_I$ and treats total charge $W$ as a
    superselection label rather than summing over it). Bidirectional
    map (see [[def:HP]] Translation map for the full algorithm):
    - **MF $\to$ partition**: pick any partition $P$ with $|P| = L$
      (cell-length geometry is arbitrary at the level of the Hilbert
      space alone); fix $A_I = Q_{\mathrm{full}} = \bigoplus_a a$ on
      every cell; decompose $H_{\mathrm{MMA}}(L)$ by total charge $c$
      to recover $\bigoplus_W \Hh_P^W$.
    - **Partition $\to$ MF**: take $|P| = L$, set $A_I =
      Q_{\mathrm{full}}$, sum over $W \in \Irr(\Cc)$, absorb vacuum
      legs (labels $a_i = \one$) into a sparse hard-core position
      list.
  - **Summary.tex / N-tensor [[def:Hlatt]]**: per bridge report §2.2
    (lines 181–230). **Equivalent** (bijective on basis elements;
    neither is more general — they are identifications of the same
    Hom-space under different geometric framings):
    $H_{\mathrm{MMA}}(L) \cong \bigoplus_{W\in\Irr(\Cc)}
    \bigoplus_{N=0}^L \Hh_N^W$, with index match $c$ (MMA) $\leftrightarrow
    W$ (summary). The bijection on basis elements uses vacuum-leg
    absorption (see [[def:Hlatt]] Translation map for the full
    algorithm).
  - **Summary.tex / inductive-limit closure [[def:indlim]]**: not
    equivalent — mobile-Fock is the discrete fixed-$L$ analogue;
    inductive-limit takes $L \to \infty$ via the cellwise-local
    isometries [[def:refmap]] and forms the Hilbert completion. See
    [[def:indlim]] Translation map.
  - **Worked example** (all three pairings): Fibonacci $\Hh_2^\tau$
    has $\dim = 3$ in each formulation; bridge report §5.1–§5.3
    (`opus-hilbert-bridge.md:291-339`) gives the explicit
    basis-vector-level bijection and verifies F-symbol-change-of-basis
    consistency (which acts identically across all three formulations
    for Fibonacci because the F-matrix [[def:fib-F]] is involutory in
    both the unitary `summary.tex` gauge and MMA's TensorCategories.jl
    gauge — they coincide for Fibonacci).
  - **Conventions required** (summary, locked at P1.6): vacuum at
    index 1 [P1.6(a)]; left-associated fusion-tree basis [P1.6(i)];
    multiplicity-free [P1.6(d)]; choice $Q = Q_{\mathrm{full}}$
    uniform across cells [P1.6(h)]; F-matrix gauge translation
    [P1.6(b)] (relevant for any computation that uses F-symbol entry
    values; not relevant for the basis-element bijection itself, which
    is gauge-independent).
  - **CAD**: not directly formalised — CAD has the `H_N^W` coordinate skeleton (via [[def:Hlatt]]'s CAD entry), which translates to mobile-Fock via the §2.2 bijection (vacuum-leg absorption) the same way `summary.tex`'s [[def:Hlatt]] does. No separate mobile-Fock instance in CAD.
**Notes:** The third of the three discrete Hilbert-space framings
reconciled in `stocktake/reports/opus-hilbert-bridge.md` (alongside the
partition-canonical [[def:HP]] and the fixed-lattice [[def:Hlatt]]);
the continuum direct-limit closure of the partition tower is
[[def:indlim]]. Per the bridge verdict, all three discrete framings are
equivalent and mutually inter-translatable; the partition formulation
is strictly more general and therefore canonical.

**Convention dependencies** (adapted from bridge report §1.3 line 136
— the inline `(a)`–`(f)` enumeration there — with added forward-pointers
to P1.6 `CONVENTIONS.md` items, GLOSSARY cross-links, and the LB-1
reference; **not** a verbatim quote):

1. **Vacuum at index 1** in `simples(C)` (per `config.jl:5,13`).
   Forward-pointer: P1.6(a) vacuum-index convention.
2. **Labels enumerate non-vacuum simples only** (Julia uses `2:d`
   per `config.jl:36`). Forward-pointer: also P1.6(a) (consistent
   indexing scheme).
3. **Hard-core occupancy** enforced via `Combinations`, not
   multisets (`config.jl:35`). Forward-pointer: not a CONVENTIONS
   item per se; the hard-core constraint is part of the MMA model
   definition. See also the [[def:splitbasis]] Notes on the latent
   LB-1 multiplicity bug (bd `cft-anyons-q6h`), which is independent
   of hard-core but lives in the same `hilbert.jl` enumerator.
4. **Involutory F-matrix gauge** (TensorCategories.jl convention; MMA
   compensates with Hermitian projectors `vv†/|v|²` in
   `interaction.jl` and `braiding.jl`; documented in
   `stocktake/reports/mma-julia.md:142-149`). Forward-pointer:
   P1.6(b) F-matrix gauge convention.
5. **Left-associated fusion-tree basis** (`hilbert.jl:13-15`).
   Forward-pointer: P1.6(i) fusion-tree ordering convention.
6. **Total charge $c$ summed over all simples**, **not** treated as
   a superselection label (contrast with [[def:Hlatt]]/[[def:HP]],
   which grade by $W \in \Irr(\Cc)$). This is a structural difference
   absorbed by the translation map (P1.5), not a CONVENTIONS item.

Also: the **`N = 0` boundary** in mobile-Fock agrees with [[def:Hlatt]]'s
$N=0$ specialisation ($H_0^W = \delta_{W,1}\cdot\mathbb{C}$); see
bridge report §3 ("Edge cases checked", first bullet), line 253.
Partition formulation [[def:HP]] does
**not** technically permit $|P| = 0$ (a partition covers `X`, requiring
at least one cell). P1.6(j) will lift "empty partition / $N=0$
boundary" to a CONVENTIONS entry so the three formulations agree at
the absolute boundary.

**LB-1 caveat (latent bug, blocked on Phase 8):** the MMA function
`enumerate_fusion_trees` at
`microscopic-mobile-anyons/src/MobileAnyons/hilbert.jl:42-68` undercounts
the basis for fusion categories with $\dim\Hom(a\otimes b, c) > 1$.
Filed as bd `cft-anyons-q6h`. The three currently-used categories
([[def:fib]], [[def:ising]], sVec) are all multiplicity-free, so the
bug is **latent for present scope** but blocks any future extension to
extended Haagerup, certain quantum groups at non-prime levels, etc.
See bridge report §3.5 line 263–269 for full discussion.
