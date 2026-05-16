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

**P1.1 (this commit):** populated by mechanical extraction of every
`\begin{definition}` and `\begin{convention}` in `summary.tex` (4 conv + 44
def = 48 entries). "Canonical" payloads are copied **verbatim** (full
environment, from `\begin{...}` through `\end{...}`) inside ```latex code
fences to preserve LaTeX syntax exactly. "Source" gives the
`\begin{...}` line in `summary.tex`. "Aliases" and "Translation map"
fields are stubbed; they are populated in later Phase 1 steps:

- **P1.3:** Hilbert-space translation map (`def:Hlatt`, `def:HP`, plus
  the mobile-Fock variant from MMA — see `stocktake/reports/opus-hilbert-bridge.md`).
- **P1.6:** new `CONVENTIONS.md` entries derived from but not literally
  identical to `summary.tex` conventions (vacuum index, F-matrix gauge,
  multiplicity-free assumption, fusion-tree ordering, `N=0` boundary,
  etc.).
- **P1.7:** CAD-Lean translation map (per-file mapping in
  `stocktake/reports/cad-lean.md` §5).
- **P1.8:** MMA-Julia translation map (per `stocktake/reports/mma-julia.md` §5).
- **P1.9:** definitional-gate audit (Opus subagent reads this file end-to-end
  and flags any undefined term or internal inconsistency).

Lemmas, propositions, theorems, corollaries, remarks, warnings, and
examples in `summary.tex` are **not** in scope for P1.1 — only
`\begin{definition}` and `\begin{convention}` environments. The
unanimous `lem:binary-Z` amplitudes-vs-probabilities bug is filed for
P1.2 (separate atomic commit + ERRATA entry).

## Schema for each entry

```
## <label> — <term name>

**Canonical:**
\`\`\`latex
\begin{definition}[<term name>]\label{<label>}
<body, verbatim>
\end{definition}
\`\`\`

**Source:** `summary.tex:<line>`
**Aliases:** <synonyms used in MMA, CAD, or the literature; or TBD>
**Translation map:**
  - MMA: <equivalent or "TBD pending P1.8">
  - CAD: <equivalent or "TBD pending P1.7">
  - other: <…>
**Notes:** <pitfalls, related GLOSSARY entries via [[label]], etc.>
```

Entries below are ordered by source-line in `summary.tex`.

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
**Aliases:** TBD pending P1.7/P1.8.
**Translation map:**
  - MMA: TBD pending P1.8.
  - CAD: TBD pending P1.7.
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
  - MMA: TBD pending P1.8.
  - CAD: TBD pending P1.7.
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
  - MMA: TBD pending P1.8 (Julia FusionCategory struct).
  - CAD: TBD pending P1.7 (Lean `FiniteSkeletalFusionData` — note the CAD
    side is the *skeletal* coordinate slice, not the abstract categorical
    definition; see `stocktake/reports/cad-lean.md` §4).
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
  - MMA: TBD pending P1.8.
  - CAD: TBD pending P1.7.
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
  - MMA: TBD pending P1.8 (MMA's `Hom(c, X_{a1}\otimes\cdots\otimes X_{an})`
    bases use the same splitting-vertex convention; see
    `stocktake/reports/opus-hilbert-bridge.md` §2).
  - CAD: TBD pending P1.7.
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
  - MMA: TBD pending P1.8. **Caution:** TensorCategories.jl-derived F-matrix
    entries use an **involutory** gauge ($F^2 = I$, $F^\dagger \ne F^{-1}$
    in general), whereas `summary.tex` implicitly assumes the unitary
    case. The translation rule must be documented at P1.6/P1.8; see
    `CLAUDE.md` hallucination-risk callouts.
  - CAD: TBD pending P1.7 (Lean `FibF`; see `Fibonacci/Matrix.lean` per
    `stocktake/reports/cad-lean.md` §5).
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
  - MMA: TBD pending P1.8.
  - CAD: TBD pending P1.7.
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
  - MMA: TBD pending P1.8. MMA's "absorbed vacuum" convention is the
    $Q_{\mathrm{full}} = \bigoplus_a a$ default; see
    `stocktake/reports/opus-hilbert-bridge.md` §3 and the planned P1.6
    item (h) ("local cell object Q choice — five named options").
  - CAD: TBD pending P1.7.
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
  - MMA: TBD pending **P1.3** (mobile-Fock formulation reconciliation;
    see `stocktake/reports/opus-hilbert-bridge.md` §2: MMA's mobile-Fock
    is the inductive limit / direct sum over configurations, equivalent
    via the partition `H_P^W` bridge).
  - CAD: TBD pending **P1.7**. Lean side is
    `IndefiniteParticleSectorCoordinates` at the coordinate-skeleton level
    (not categorical); see `stocktake/reports/cad-lean.md` §5.
**Notes:** Equivalent to [[def:HP]] when all $A_I = Q$ (per the remark
following `def:HP`). The three Hilbert-space framings (this one,
[[def:HP]], and MMA's mobile-Fock) all reconcile per
`stocktake/reports/opus-hilbert-bridge.md`; the partition formulation
[[def:HP]] is declared canonical.

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
  - MMA: TBD pending P1.8. **Caution:** P1.6(g) flags that `summary.tex`
    uses $N$ for tensor degree / lattice length / cell count and lower-case
    $k$ (here) or $n$ for the count of non-vacuum legs, whereas MMA uses
    `N` for the latter. Disambiguation required at P1.6.
  - CAD: TBD pending P1.7.
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
  - MMA: TBD pending P1.8 (MMA's `LabelledConfig` is the partition +
    label data per `stocktake/reports/mma-julia.md` §5).
  - CAD: TBD pending P1.7.
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
  - MMA: TBD pending **P1.3** (mobile-Fock = direct limit over $P$;
    `stocktake/reports/opus-hilbert-bridge.md` §2.)
  - CAD: TBD pending **P1.7**.
**Notes:** **This is the canonical Hilbert-space formulation per
`stocktake/reports/opus-hilbert-bridge.md`**. Three equivalent framings:
this one ([[def:HP]]); the fixed-lattice [[def:Hlatt]] (special case
$A_I = Q$); and MMA's mobile-Fock (continuum direct limit
[[def:indlim]]). [[def:Ageom]] is the geometry-enriched extension.
P1.5 will write the explicit translation map into the relevant entries.

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
  - MMA: TBD pending P1.8.
  - CAD: TBD pending P1.7.
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
  - MMA: TBD pending P1.8 (`normalized_product_isometry` ↔ $E_{P\to P'}$
    per `stocktake/reports/mma-julia.md` §5).
  - CAD: TBD pending P1.7.
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
  - MMA: TBD pending P1.8 (MMA's mobile-Fock direct sum
    $H = \bigoplus_N \bigoplus_{\text{configs}}\Hom(c, X_{a_1}\otimes\cdots\otimes X_{a_n})$
    is the discrete analogue of this continuum limit; see
    `stocktake/reports/opus-hilbert-bridge.md` §2.)
  - CAD: TBD pending P1.7.
**Notes:** Compatibility = associativity-of-refinement. Cf. [[def:HP]],
[[def:refmap]]. The Hilbert-completion step is the load-bearing step
analytically. The continuum limit here is the third of the three
Hilbert-space framings reconciled in
`stocktake/reports/opus-hilbert-bridge.md` (alongside the fixed-lattice
[[def:Hlatt]] and the partition-canonical [[def:HP]]); MMA's mobile-Fock
is its discrete analogue.

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
  - MMA: TBD pending P1.8.
  - CAD: TBD pending P1.7.
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
  - MMA: TBD pending P1.8.
  - CAD: TBD pending P1.7 (Lean `Kraus channels` infrastructure in
    `LinearAlgebra/`; cf. `stocktake/reports/cad-lean.md` §3).
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
  - MMA: TBD pending P1.8.
  - CAD: TBD pending P1.7 (`Foundations/SkeletalFusion.lean` and the
    algebra-object content of `Fibonacci/`; see
    `stocktake/reports/cad-lean.md` §5).
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
  - MMA: TBD pending P1.8.
  - CAD: TBD pending P1.7.
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
  - MMA: TBD pending P1.8.
  - CAD: TBD pending P1.7.
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
  - MMA: TBD pending P1.8.
  - CAD: TBD pending P1.7 (Lean `Fibonacci/FusionRules.lean` per
    `stocktake/reports/cad-lean.md` §5).
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
  - MMA: TBD pending P1.8.
  - CAD: TBD pending P1.7.
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
  - MMA: TBD pending P1.8. **Caution (CLAUDE.md hallucination-risk):**
    TensorCategories.jl uses an **involutory** gauge; entries match here
    coincidentally (Lemma `lem:F-invol`: $F^2 = I$) but more generally
    the unitary-vs-involutory translation rule must be invoked. P1.6(b)
    will declare unitary as canonical.
  - CAD: TBD pending P1.7 (Lean `Fibonacci/Matrix.lean` `FibF` per
    `stocktake/reports/cad-lean.md` §5).
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
  - MMA: TBD pending P1.8.
  - CAD: TBD pending P1.7.
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
  - MMA: TBD pending P1.8.
  - CAD: TBD pending P1.7.
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
  - MMA: TBD pending P1.8.
  - CAD: TBD pending P1.7.
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
  - MMA: TBD pending P1.8.
  - CAD: TBD pending P1.7.
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
  - MMA: TBD pending P1.8.
  - CAD: TBD pending P1.7.
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
  - MMA: TBD pending P1.8.
  - CAD: TBD pending P1.7 (Lean `Ising/Basic.lean`; note CAD's Ising is
    not yet connected to `FiniteSkeletalFusionData` per
    `stocktake/reports/cad-lean.md` §4).
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
  - MMA: TBD pending P1.8 (gauge caveats as for [[def:fib-F]]).
  - CAD: TBD pending P1.7.
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
  - MMA: TBD pending P1.8.
  - CAD: TBD pending P1.7.
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
  - MMA: TBD pending P1.8 (MMA's `interaction_hamiltonian` $\sum_j P_j$
    ↔ $e_i / d_\sigma$ per `stocktake/reports/mma-julia.md` §5).
  - CAD: TBD pending P1.7.
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
  - MMA: TBD pending P1.8.
  - CAD: TBD pending P1.7.
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
  - MMA: TBD pending P1.8.
  - CAD: TBD pending P1.7.
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
  - MMA: TBD pending P1.8.
  - CAD: TBD pending P1.7.
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
  - MMA: TBD pending P1.8.
  - CAD: TBD pending P1.7.
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
  - MMA: TBD pending P1.8.
  - CAD: TBD pending P1.7.
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
  - MMA: TBD pending P1.8.
  - CAD: TBD pending P1.7.
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
  - MMA: TBD pending P1.8.
  - CAD: TBD pending P1.7.
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
  - MMA: TBD pending P1.8.
  - CAD: TBD pending P1.7.
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
  - MMA: TBD pending P1.8.
  - CAD: TBD pending P1.7.
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
  - MMA: TBD pending P1.8.
  - CAD: TBD pending P1.7.
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
  - MMA: TBD pending P1.8.
  - CAD: TBD pending P1.7.
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
  - MMA: TBD pending P1.8.
  - CAD: TBD pending P1.7 (CAD's `LinearAlgebra/Polar.lean` per
    `stocktake/reports/cad-lean.md` §3 has the polar-decomposition
    infrastructure).
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
  - MMA: TBD pending P1.8.
  - CAD: TBD pending P1.7.
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
  - MMA: TBD pending P1.8.
  - CAD: TBD pending P1.7.
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
  - MMA: TBD pending P1.8.
  - CAD: TBD pending P1.7.
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
  - MMA: TBD pending P1.8.
  - CAD: TBD pending P1.7.
**Notes:** Geometry-enriched extension of [[def:Q]] (specifically, the
multiplicity-decorated choice of Remark `rem:Q-choices`(3) with
$M_a^{(I)} = J_I^{(h_a)}$). The "jet $J_I^{(h)}$" is the
finite-dimensional smearing space encoding derivative-descendant data
per [[def:smear]] / Lemma `lem:moments`. The relevant Hilbert space for
this enriched site object is constructed analogously to [[def:HP]] with
$A_I = A_I^{\mathrm{geom}}$.
