# CONVENTIONS — cft-anyons

<!--
ROLE: Notational, gauge, indexing, and other modelling-convention choices.
      Where GLOSSARY defines WHAT a term means, CONVENTIONS defines HOW
      it is represented (which gauge, which index base, which sign
      convention, etc.).
UPDATE POLICY: New conventions appended with explicit reasoning. Changing
      an existing convention is a Core-tier change requiring hostile
      review AND a sweep of every file that follows the convention.
TRIGGER: Any new representational choice; any imported content that uses
      a non-canonical convention; any hallucination-risk callout in
      CLAUDE.md referring to a convention.
-->

## Status

**P1.6** (`8226003`, 2026-05-16): 10 conventions declared per
`MIGRATION_PLAN.md` P1.6 (the 6-item base plus 4 items
(g)–(j) added by P1.4-early per
`stocktake/reports/opus-hilbert-bridge.md` §4). Item (f) (TikZ macro
source) is **deferred** — no TikZ usage in `summary.tex` at this
commit; the entry serves as a pre-registered hook for when the first
TikZ figure is introduced.

The (a)–(j) lettering matches `MIGRATION_PLAN.md`'s P1.6 list. The
seven distinct letters currently invoked from GLOSSARY (P1.6(a), (b),
(d), (g), (h), (i), (j)) all resolve to a `## (letter)` entry below;
the invoker entries are `def:HP`, `def:Hlatt`, `def:indlim`,
`def:mobile-Fock`, `def:Q`, `def:splitbasis`. Letters (c), (e), (f)
are declared but not currently invoked by a forward-pointer — they
remain in scope for any new content that introduces dagger, complex
conjugation, or TikZ.

**P1.9 (this commit):** definitional gate audit (Opus 4.7 subagent)
re-validated this file end-to-end; 7/7 invoked letter forward-pointers
resolve to entries below; no internal inconsistencies. Two MINOR
cleanups applied in this commit: (a) Reasoning + Translation rules
clarified that `archive/mma-archive-v0-snapshot/` is a placeholder
directory pending snapshot import (ground-truth file currently lives
at `microscopic-mobile-anyons/archive/v0/docs/hilbert_space.md:39`);
(a) Sweep status rephrased to distinguish [[def:Q]] (generic
definition, any `Q∈C`) from CONVENTIONS (h) (canonical default
`Q_full = ⊕_a a`). Report at `stocktake/reports/opus-glossary-audit.md`.

## Schema for each entry

```
## (<letter>) <convention-name>

**Choice:** <the canonical decision>
**Reasoning:** <why this choice; what was rejected; relevant
  hallucination-risk callout if any>
**Source:** <summary.tex / bridge report / external reference, with
  line numbers>
**Translation rules:**
  - MMA: <how content imported from MMA is translated>
  - CAD: <how content imported from CAD is translated>
**Sweep status:** <GLOSSARY entries and files known to follow this
  convention; outliers flagged>
```

The (a)–(j) lettering keys each entry to `MIGRATION_PLAN.md` P1.6
so GLOSSARY forward-pointers like "[P1.6(a) vacuum-index convention]"
resolve unambiguously.

---

## (a) Vacuum index convention

**Choice:** The **categorical unit object** `1 ∈ Irr(C)` is the vacuum.
When `Irr(C)` is enumerated as a sequence `{X_1, X_2, …, X_d}` for
indexing purposes (numerical code, fusion-tree algorithms), the
**vacuum is at index 1** (1-indexed, with `X_1 = 1_C`).

Two compatible statements:
- **Abstract / categorical:** `1` (typeset `\one` in `summary.tex`)
  denotes the unit object of the fusion category. This is the
  notation in [[conv:basics]].
- **Concrete / numerical:** when `Irr(C)` becomes an enumerated
  sequence in code, the vacuum is the **first** entry. Julia's
  1-indexed arrays make this `index 1`. MMA's `config.jl:5,13` fixes
  this convention.

**Reasoning:** matches `summary.tex` (which never indexes simples
numerically — it uses the symbol `\one`) and MMA (which is 1-indexed).
The three-way conflict between MMA-v0's 0-indexed `hilbert_space.md:39`
(ground-truth file currently at
`microscopic-mobile-anyons/archive/v0/docs/hilbert_space.md:39`;
scheduled for snapshot import into `archive/mma-archive-v0-snapshot/`,
where the in-repo directory is presently a `.gitkeep` placeholder) and
1-indexed `config.jl:12` was the historic **STL-1 bug** flagged in
`CLAUDE.md`'s hallucination-risk callouts. Locking 1-indexed prevents
re-introduction of the conflict.

**Source:** `summary.tex:76` ([[conv:basics]]: `\one denotes the
categorical unit object … (vacuum simple)`); `stocktake/reports/opus-hilbert-bridge.md:136`
item (a); `CLAUDE.md` § "Hallucination-risk callouts".

**Translation rules:**
- **MMA (current Julia):** 1-indexed; no translation needed.
- **archive/mma-archive-v0-snapshot:** if reading those files for
  reference, **shift any 0-indexed simple reference by +1** to align.
  These files are **read-only**; do not import directly. The in-repo
  `archive/mma-archive-v0-snapshot/` directory is currently a
  `.gitkeep` placeholder pending the deprecated-MMA snapshot import;
  the ground-truth file is
  `microscopic-mobile-anyons/archive/v0/docs/hilbert_space.md:39`.
  [[def:Q]] Notes uses the bare `hilbert_space.md:39` shorthand for
  the same file.
- **CAD:** `LocalOccupationModel.vacuum : label` is unconstrained
  (`ProjectDefinitions.lean:3-13`); the canonical instance picks the
  first simple as the vacuum.
- **summary.tex:** never indexes simples numerically; uses `\one`.

**Sweep status:** [[conv:basics]] declares the abstract `\one`
notation; [[def:fuscat]] defines `1 ∈ Irr(C)` as the unit; [[def:Q]]
is the abstract definition (any object `Q∈C`) and **does not** itself
fix the enumeration — CONVENTIONS (h) declares the canonical default
`Q_full = ⊕_{a∈Irr(C)} a` with this 1-indexed enumeration, and
[[def:HP]] / [[def:Hlatt]] / [[def:mobile-Fock]] all use that
canonical default per their respective Translation maps;
[[def:mobile-Fock]] convention dep #1 references the index-1
convention explicitly. All four Hilbert-space Translation maps cite
"vacuum at index 1 [P1.6(a)]".

---

## (b) F-matrix gauge convention

**Choice:** **Unitary gauge is canonical** (matches `summary.tex` end
to end). The **involutory gauge** (TensorCategories.jl convention,
used by MMA) is permitted as a translatable secondary representation
when computing with F-symbol entry values.

**Reasoning:** `summary.tex def:fsymbol` requires unitarity ("in the
unitary case each `F^{abc}_d` is a unitary matrix") for unitary
fusion categories. For the multiplicity-free single-non-trivial-fusion-channel
cases currently in scope ([[def:fib]], [[def:ising]]), the F-matrix
happens to be **both unitary and involutory** (real symmetric matrix
satisfying `F² = I`) — so the two gauges coincide. `summary.tex`
`lem:F-invol` (line 1072) proves this for Fibonacci; bridge report
§5.3 (`opus-hilbert-bridge.md:325`) cross-validates against MMA.

For categories beyond current scope (multi-channel or
non-multiplicity-free), the gauges differ. Generically, any unitary
`F` can be related to the involutory `F` by a diagonal phase matrix
arising from the splitting-basis-vector phase choice (formal
correspondence documented in TensorCategories.jl; pointer in
`stocktake/reports/mma-julia.md:145-148`).

**Importantly:** the basis-element bijection between the three
Hilbert-space formulations [[def:HP]] / [[def:Hlatt]] /
[[def:mobile-Fock]] is **gauge-independent** — it relabels basis
vectors but does not invoke F-symbol entry values. Gauge translation
becomes load-bearing only when one performs a computation that uses
F-symbols numerically (e.g., evaluating an OPE coefficient or a
braiding phase).

This is a CLAUDE.md hallucination-risk callout: importing
TensorCategories.jl-derived F-matrix entries without applying the
gauge translation produces silently-wrong inner products.

**Source:** `summary.tex def:fsymbol` (line 156); `summary.tex def:fib-F`
(line 1060) and `lem:F-invol` (line 1072); `summary.tex def:ising-F`
(line 1609); bridge report §5.3 (`opus-hilbert-bridge.md:325-340`);
`CLAUDE.md` § "Hallucination-risk callouts".

**Translation rules:**
- **MMA-imported F-matrix entries (Julia):** assumed **involutory**.
  In current Fibonacci/Ising scope, **no translation needed** —
  matrices coincide. For future categories beyond scope: translate
  via the TensorCategories.jl rule before use.
- **CAD's Lean F-matrices:** `Fibonacci/Matrix.lean`'s `FibF` is the
  unitary form per `stocktake/reports/cad-lean.md` (verified by
  `FibF_orthogonal`). No translation needed.

**Sweep status:** [[def:fsymbol]] (abstract definition);
[[def:fib-F]], [[def:ising-F]] (specific instances — both unitary
under this convention, with the involutory-coincidence noted in
[[def:fib-F]]'s Notes); [[def:mobile-Fock]] convention dep #4; all
four Hilbert-space Translation maps cite "F-matrix gauge [P1.6(b)]"
or "F-matrix gauge translation [P1.6(b)]"; [[def:rsymbol]] Notes #3
(R-symbol gauge inherits from F-symbol gauge transitively via the
`B = F R F` composite); [[def:braid-H]] Notes #3 (the Hermitian
braiding-Hamiltonian construction sits on top of the R/B-symbol
gauge handling and therefore inherits [P1.6(b)] transitively).

---

## (c) Dagger / adjoint convention

**Choice:** The dagger `f^\dagger` denotes:
- the **categorical adjoint** when `C` is a unitary fusion category;
- the **complex-conjugate transpose** for matrices.

These two semantics agree on Hom-space matrices once an orthonormal
basis is fixed (so the convention is consistent across the abstract
and concrete settings used throughout the project).

**Reasoning:** matches `summary.tex conv:basics` (line 76) directly.
The dagger is the canonical categorical structure on a unitary fusion
category, satisfying `⟨f, g⟩ id_X = f^† ∘ g` for simple `X` (per
`def:fuscat`'s unitarity clause). (`summary.tex` does not claim
uniqueness; in practice it is well-defined up to monoidal
equivalence of the unitary structure.)

**Source:** `summary.tex:76` ([[conv:basics]], specifically: "The
dagger `f^\dagger` denotes the categorical adjoint when `C` is
unitary, and complex conjugate transpose for matrices").

**Translation rules:**
- **MMA (Julia):** matrix dagger via `adjoint()` or postfix `'`;
  categorical dagger is implicit in the unitary fusion category
  framework. Same semantics.
- **CAD (Lean / Mathlib):** `dagger` / `star` typeclass on the
  relevant categorical or matrix-algebra structures. Same semantics.

**Sweep status:** pervasive — every entry that uses `†` or
`^\dagger`. Specifically invoked by [[def:algobj]] (dagger-special
condition `m m^† = λ id_A`), [[def:refmap]] (isometry condition
`E^† E = id`), [[def:blocking]] (`B = E^†`), [[def:ascending]]
(`A(O) = E^† O E`), [[def:polar-repair]], and many more.

---

## (d) Multiplicity index notation + multiplicity-free assumption

**Choice:** Per `summary.tex def:splitbasis`: the multiplicity index
`μ = 1, …, N^c_{ab}` is **explicit when `N^c_{ab} ≥ 2`** and
**dropped (implicit)** when `N^c_{ab} ∈ {0, 1}`.

**Project-wide assumption:** every fusion category currently in use
is **multiplicity-free** (every `N^c_{ab} ∈ {0, 1}`):
- [[def:fib]] (Fibonacci): multiplicity-free per its canonical
  statement.
- [[def:ising]] (Ising): multiplicity-free.
- sVec (super-vector spaces, mentioned in MMA but not yet a GLOSSARY
  entry): multiplicity-free.

**Consequence:** the multiplicity index `μ` is always dropped in
current scope. Code and definitions need not carry it explicitly.

**LB-1 latent bug** (bd `cft-anyons-q6h`): MMA's
`enumerate_fusion_trees` at `hilbert.jl:42-68` treats `dim Hom > 0` as
a Boolean rather than counting multiplicity. **For multiplicity-free
categories the bug is invisible**; for any future extension to
non-multiplicity-free categories (e.g., extended Haagerup, certain
quantum groups at non-prime levels), the bug becomes active. **Blocked
on Phase 8 (MMA migration) for fix.**

**Reasoning:** keeps notation light when not needed; flags the
load-bearing scope assumption explicitly so silent breakage cannot
occur if scope expands.

**Source:** `summary.tex def:splitbasis` (line 145); bridge report
§3.5 (`opus-hilbert-bridge.md:263-269`); bd `cft-anyons-q6h`.

**Translation rules:**
- **MMA:** implicitly assumes multiplicity-free (LB-1). No
  translation needed for current scope; **flag if scope expands** —
  fix LB-1 first.
- **CAD:** `sectorBasis : Config label n → Type` is an arbitrary
  finite type, accommodating arbitrary multiplicity. To use a
  non-multiplicity-free category in CAD, choose `sectorBasis`
  as an enumerated type indexed by `(splitting tree, multiplicity index)`.

**Sweep status:** [[def:splitbasis]] (the source definition);
[[def:fsymbol]] (`F`-symbol indices include `μ` when needed);
[[def:ope3]] (`OPE 3-tensor` has multiplicity-index support).
[[def:fib]], [[def:ising]] both state the multiplicity-free
assumption explicitly in their canonical bodies. [[def:mobile-Fock]]
convention dep #3 references LB-1.

---

## (e) Complex-conjugation notation

**Choice:**
- **Overline `\bar{z}`** (rendered `z̄`) denotes complex conjugation
  for scalars `z ∈ ℂ`.
- **`\overline{...}`** is reserved for **Hilbert-space closure** (e.g.,
  `\overline{\varinjlim_P H_P^W}` for the completion of the algebraic
  inductive limit, `summary.tex def:indlim` line 434), **except** when
  it appears around a scalar expression — in which case it is
  conjugation (e.g., `summary.tex:1934`: `\overline{β^μ{}_ν}`).

**Established overloadings of `\bar`** (preserved from `summary.tex`,
not removed):
- `\bar a` for the **dual object** of a simple `a` in a fusion
  category — `summary.tex def:fuscat` rigid-duals clause
  (`summary.tex:128`).
- `\bar L_n`, `\bar h`, `\bar c`, `\bar z` for **anti-chiral /
  right-moving** quantities in CFT — Virasoro generators, weights,
  central charge, anti-chiral coordinate (`summary.tex def:primary`,
  `def:OPE`, `def:KS-Ln`).
- `\bar a`, `\bar b` for **complex conjugates of algebra parameters**
  (`summary.tex:696-697`, `prop:dagger-special-eq`).

Context disambiguates in practice: `\bar a` for `a ∈ Irr(C)` is a
dual object; `\bar a` for a complex number `a ∈ ℂ` is a conjugate.
**No rename is proposed.** Future agents writing new content must
take care: if introducing a new symbol, avoid `\bar` if the symbol's
type would be ambiguous in context.

**Reasoning:** matches `summary.tex` usage exactly. The overloading
is established mathematical practice; any rename would diverge from
the canonical document.

**Source:** `summary.tex:128` (rigid duals, `\bar a` for dual);
`summary.tex:1774` (Virasoro anti-chiral `\bar L_n`); `summary.tex:1837`
(`\bar z` in OPE definition); `summary.tex:434` (`\overline{...}` for
Hilbert closure); `summary.tex:696-697` (`\bar a, \bar b` for complex
conjugates of algebra parameters).

**Translation rules:**
- **MMA (Julia):** `conj(z)` for scalar complex conjugation; explicit
  `dual(a)` calls for fusion-category duals. No notational conflict.
- **CAD (Lean / Mathlib):** `starRingEnd` / `.conj` for scalars;
  Mathlib categorical-dual notation for fusion-category duals. No
  conflict.

**Sweep status:** not localised to specific GLOSSARY entries —
pervasive throughout `summary.tex` and any future prose. Listed here
so future agents do not introduce yet another `\bar`-overloading.

---

## (f) TikZ macro source

**Choice:** **DEFERRED.** No TikZ figures or macros are currently
used in the project. `summary.tex` contains no `\usepackage{tikz}` and
no `\begin{tikzpicture}` block (verified `2026-05-16` via
`grep -in 'tikz' summary.tex`).

This convention is a **pre-registered hook**: when the first TikZ
figure is introduced (in `summary.tex` or any other LaTeX artifact),
this entry must be updated to declare the canonical TikZ-macro source
file. The introducer's commit must:

1. Update this convention entry with the canonical macros source path
   (e.g., `tex/tikz-macros.sty` or similar).
2. Add the appropriate `\usepackage{tikz}` and `\input{<macros>}` to
   `summary.tex`'s preamble via an ERRATA-tracked atomic commit.

**Reasoning:** declaring a canonical source for an unused asset
would be premature optimisation. Pre-registering the convention slot
ensures any future TikZ-introducer is forced to update this entry
before importing figures, preventing fragmentation across multiple
ad-hoc macro definitions.

**Source:** verified by `grep -in 'tikz' summary.tex` (returns
nothing) against `summary.tex` SHA256
`fa4d2059f3fb577ebe9e84ace2ab0ee6ef2b6d0cec7cde60d53da7951b0bfe63` on
2026-05-16.

**Translation rules:** N/A until first introduction.

**Sweep status:** N/A.

---

## (g) Particle-number disambiguation

**Choice:** For the rest of this project's documentation:
- **`L`** denotes **tensor degree / lattice length / cell count** —
  the number of "sites" in a state vector, regardless of how many of
  them are vacuum.
- **`n`** denotes **particle number** = the **count of non-vacuum
  legs** in a configuration.
- **`N`** is **deprecated as a standalone symbol** for either
  quantity in new content. When `N` appears in citations to existing
  sources, use context to disambiguate as documented below.

**Existing inconsistent usage** (read carefully when consulting the
sources):
- `summary.tex H_N^W` ([[def:Hlatt]]): `N` = tensor degree = our `L`.
- `summary.tex def:particle-number`: `k(a_1, …, a_N) :=
  #{i : a_i ≠ 1}` = our `n` (uses `k`, not `n`, for the
  particle-number quantity).
- MMA `hilbert.jl`: `N` = particle number (count of non-vacuum
  anyons) = our `n`; the lattice length is named `L` (Julia
  variable) = our `L`. So MMA already uses `L` for the canonical
  meaning, but conflicts with `summary.tex` on `N`.
- CAD handoff: `H_N^W` matches `summary.tex` (`N` = tensor degree).

**Reasoning:** load-bearing convention identified in bridge report §4
(`opus-hilbert-bridge.md:279`). The same letter `N` for two different
quantities is the dominant source of cross-project confusion.
Adopting `L` (tensor degree) and `n` (particle number) is the
explicit bridge recommendation.

**Source:** `summary.tex def:Hlatt` (uses `N` = tensor degree);
`summary.tex def:particle-number` (uses `k` = non-vacuum count); MMA
`hilbert.jl` (uses `N` = non-vacuum count); bridge report §4 line 279.

**Translation rules:**
- **Reading MMA Julia:** local `N` = our `n`; local `L` = our `L`.
- **Reading `summary.tex H_N^W`:** `N` = our `L`. The Hilbert space
  `H_N^W = Hom(W, Q^⊗N)` has `N` tensor factors regardless of how
  many are vacuum.
- **Reading CAD:** matches `summary.tex`.
- **Writing new content:** use `L` and `n` exclusively; do not
  introduce new `N`-as-standalone usage.

**Sweep status:** [[def:Hlatt]] (uses `summary.tex`'s `N` = our `L`
in its canonical body — the body is verbatim from `summary.tex` per
P1.1 rules so cannot be edited here; the convention applies to
*future content* and to *Notes/Translation map* fields);
[[def:particle-number]] (uses `summary.tex`'s `k` = our `n`);
[[def:mobile-Fock]] (uses MMA's `N` = our `n`; lattice length `L` =
our `L`); [[def:HP]] Translation map intentionally avoids the symbol
`N` (rephrased in P1.3/P1.5 per this convention, using `|P|` and
`L`); [[def:mobile-Fock]] Notes explicitly forward-point here.

---

## (h) Local cell object `Q` choice

**Choice:** **Canonical default: `Q = Q_full = ⊕_{a ∈ Irr(C)} a`** —
the direct sum of all simple objects, each with multiplicity 1.

Five alternative choices are catalogued in `summary.tex` Remark
`rem:Q-choices` (line 201) and are all permitted as **modelling
inputs** (not wrong — just non-default). When an entry, file, or
computation uses a non-default `Q`, the choice **must** be declared
in the entry or the file's docstring.

The five named alternatives (in `summary.tex` enumeration order):

1. **`Q_full = ⊕_a a`** — canonical default. MMA's "absorbed-vacuum"
   convention is equivalent (index 1 for the vacuum-`1` summand;
   non-vacuum simples at indices 2..d). The multiplicity-free
   assumption (d) applies.
2. **`Q_restr = ⊕_{a ∈ S} a`** for `S ⊆ Irr(C)` — restricted-charge
   subobject. Used in `summary.tex sec:square-zero` with
   `S = {1, p}` (the chat-4 length-weighted square-zero model).
3. **`Q^geom_I = ⊕_a M_a^{(I)} ⊗ a`** — multiplicity-decorated with
   finite-dim multiplicity spaces `M_a^{(I)}`. Used in
   [[def:Ageom]] with `M_a^{(I)} = J_I^{(h_a)}` (jet/smearing
   spaces); [[def:Ageom]]'s canonical body sums over *primaries*
   `i` (primaries = simples for the fusion categories in current
   scope, so no semantic conflict; this matters only if scope
   expands to CFTs where the primary spectrum is a proper subset
   of `Irr(C)`). **Violates the multiplicity-free assumption (d)**
   — flag explicitly when used; the LB-1 caveat applies if
   importing to MMA.
4. **Site-dependent `A_I`** — different cells carry different cell
   objects. Allowed by [[def:HP]]; not by [[def:Hlatt]] (which
   fixes a single `Q`). Required for blocked / coarse-grained
   refinements.
5. **`Q_coarse = Q^⊗k`** or any subobject thereof — coarse-grained
   / blocked object. Used in `summary.tex chat~1 §10` for
   `Q_blk = σ⊗σ ≅ 1⊕ψ` in Ising.

**Reasoning:** declaring a canonical default lets the bulk of the
project use `Q_full` implicitly. Explicitly enumerating the alternatives
ensures any non-default choice is documented at use-site rather than
silently assumed. The warning `warn:Q-not-canonical` (`summary.tex:254`)
is the in-doc statement of this principle.

**Source:** `summary.tex def:Q` (line 194); `rem:Q-choices` (line 201);
warning `warn:Q-not-canonical` (line 254); bridge report §1.3 + §2.3
(`opus-hilbert-bridge.md:236`).

**Translation rules:**
- **MMA:** hard-codes `Q_full`. Cannot represent options (2)–(5)
  without code changes.
- **CAD:** `LocalOccupationModel` and the `sectorBasis` parameter
  allow arbitrary `Q` via the `label` type and `Hom`-fibre
  specification; the canonical instance uses `Q_full`.

**Sweep status:** [[def:Q]] (the abstract definition); [[def:Hlatt]]
(uniform `Q`); [[def:HP]] (per-cell `A_I` — uses (4) when cells
differ); [[def:Ageom]] (geometry-decorated, uses (3)); [[def:lenref]]
(uses `Q = 1 ⊕ p`, option (2)); [[def:rchild]] (Fibonacci-specific
algebra-derived refinement on `Q = 1 ⊕ τ`, option (2));
[[def:mobile-Fock]] (`Q_full` baked in, convention dep #1 references
this entry's P1.6(h) tag).

---

## (i) Fusion-tree basis ordering

**Choice:** **Left-associated fusion-tree basis.** For a multi-leg
morphism `Hom_C(c, X_{a_1} ⊗ X_{a_2} ⊗ … ⊗ X_{a_n})`, the canonical
basis is indexed by sequences of intermediate charges in the
left-associated bracketing:

```
(((X_{a_1} ⊗ X_{a_2}) ⊗ X_{a_3}) ⊗ … ⊗ X_{a_n})
```

with intermediate charge `s_k` = total charge of `X_{a_1} ⊗ … ⊗ X_{a_k}`
for `k = 2, …, n−1`. The terminal charge is `c`.

**Reasoning:** all three Hilbert-space formulations (partition,
N-tensor, mobile-Fock) already use this ordering — [[def:splitbasis]]
constructs the basis recursively from `Hom(a, b ⊗ c)` splitting
vertices (which is the left-associated case), and MMA's
`enumerate_fusion_trees` (`hilbert.jl:42-68`) explicitly iterates
`labels[k]` in increasing `k`. Locking the convention prevents
accidental introduction of right-associated trees in future content,
which would require F-symbol changes-of-basis on import.

**Source:** [[def:splitbasis]] (the categorical basis); bridge
report §1.3 line 136 item (e); MMA `hilbert.jl:13-15`.

**Translation rules:**
- **MMA:** matches canonical (left-associated by construction).
- **CAD:** `Fibonacci/FusionRules.lean` etc. use the same ordering.
- **Right-associated content** (currently none in scope): apply the
  F-symbol `F^{abc}_d` ([[def:fsymbol]]) to convert between
  bracketings. The F-symbol entries themselves are stated in the
  left-associated convention.

**Sweep status:** [[def:splitbasis]] (the categorical basis);
[[def:fsymbol]] (the F-matrix relates left- and right-associated
bases); [[def:dense]] (fusion path is left-associated by
construction); [[def:fib-F]], [[def:ising-F]] (matrix entries are in
the left-associated convention); [[def:mobile-Fock]] convention dep
#5. All four Hilbert-space Translation maps cite "left-associated
[P1.6(i)]".

---

## (j) Empty-configuration / `N = 0` boundary

**Choice:** the empty configuration is conventionally identified with
the **trivial Hilbert space**:

```
H_∅^W  =  Hom_C(W, 1_C^{⊗0})  =  Hom_C(W, 1_C)  =  δ_{W, 1} · ℂ.
```

That is: at `N = 0` (in [[def:Hlatt]]) or `|P| = 0` (in [[def:HP]],
extended by this convention) or `n = 0` (in [[def:mobile-Fock]]), the
Hilbert space is **one-dimensional if and only if the total charge
`W` is the unit `1`**; zero-dimensional otherwise.

**Reasoning:** required so that all three Hilbert-space framings
agree at the absolute boundary. The reduction follows from the
categorical identities: the empty tensor product is the unit object
(`Q^⊗0 = 1_C`), and `Hom_C(W, 1_C) = δ_{W,1} · ℂ` by simplicity of
`W` and the assumption that `1` is itself simple.

**Framing-specific status:**
- [[def:Hlatt]]: allows `N ≥ 0` explicitly (`summary.tex:286` — "For
  each integer `N ≥ 0`"); the `N = 0` case yields the displayed
  identity directly from the canonical body.
- [[def:HP]]: does **not** technically permit `|P| = 0` (a partition
  covers `X = [0, L]`, requiring at least one cell —
  `summary.tex:374-382`). This convention extends the partition
  formulation conventionally to admit the empty partition with the
  displayed trivial Hilbert space.
- [[def:mobile-Fock]]: the `n = 0` case is admitted (called `N = 0`
  in MMA's source per `config.jl:32` — MMA's `N` = our `n` per (g)
  above); `enumerate_fusion_trees(C, [], c)` returns `[[]]` iff
  `c = 1` (`hilbert.jl:47`), else empty. Match with the displayed
  identity.

**Source:** [[def:Hlatt]] (canonical body explicit on `N ≥ 0`);
[[def:partition]] (`summary.tex:374-382` requires `|P| ≥ 1`); bridge
report §3 ("Edge cases checked", first bullet, line 253);
`MIGRATION_PLAN.md` P1.6(j).

**Translation rules:**
- **MMA:** agrees with the convention via its `enumerate_fusion_trees`
  empty-list behaviour.
- **CAD:** `ProjectDefinitions.lean` admits `n = 0`; the trivial
  Hom-space is the empty-tuple type.
- **summary.tex partition:** requires this convention to extend
  `|P| = 0` (otherwise undefined). Any computation that uses
  `|P| = 0` must cite this convention explicitly.

**Sweep status:** [[def:Hlatt]] (canonical body includes `N = 0`);
[[def:HP]] (extended by convention); [[def:mobile-Fock]] (in its
convention-dependencies Notes); [[def:indlim]] (the inductive
system's initial element is the `|P| = 0` boundary by this
convention).
