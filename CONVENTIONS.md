# CONVENTIONS — cft-anyons

Where the lab book defines *what* a term means, this file fixes *how* it is
represented: which gauge, which index base, which sign, which normalization.
**Law 2 (AGENTS.md): record a convention here before you rely on it.** This
subject is convention-dense; silent drift is the dominant source of
wrong-but-plausible results.

Changing an existing convention is a Core-tier change (AGENTS.md Rule 12): it
needs a sweep of every shard/file that follows it.

## Claim-status labels

Used throughout the lab book (referenced by CA-00). They are part of the record.

- **Question** — an open question; no commitment.
- **Proposal** — a hypothesis/construction proposed but not yet supported.
- **Source-local** — backed by a cited local source (`references/...:line`).
- **Checked** — backed by a passing test, derivation, or reproducible run.
- **Rejected** — tried and found wrong; kept so it is not re-attempted.

## Schema for each convention entry

```
## (<letter>) <name>
**Choice:** <the canonical decision>      (or: NOT YET FIXED — fix at first use)
**Reasoning:** <why; what was rejected; relevant hallucination-risk callout>
**Source:** <references/...:line | report shard ID | external ref>
**Sweep status:** <which shards/files follow this; outliers flagged>
```

---

## Convention slots (to be fixed at first use)

These are the known convention-sensitive choices (AGENTS.md
"Convention-sensitivity"). Each is **NOT YET FIXED** — the first shard that needs
it must fix it here, with a source, in the same change. The archived
`archive/legacy-consolidation/CONVENTIONS.md` worked several of these out in
detail and is useful as *reference prior art* (dead, not canonical — re-derive
and re-cite).

## (a) Vacuum / unit-object index
**Choice (object level — FIXED, CA-02):** The **vacuum is the complex line `ℂ`**,
i.e. the monoidal unit of the tensor product `⊗` and the degree-0 (zero-particle)
sector. It is a one-dimensional space carrying the unit vacuum vector `Ω`. It is
**distinct from the zero space `{0}`**, which is the unit of the direct sum `⊕`
(empty `⊗` = `ℂ`; empty `⊕` = `{0}`).
**Choice (index level — NOT YET FIXED):** the 0- vs 1-indexed enumeration of
`Irr(C)` (a recurring bug in prior work) is a separate question, deferred until a
specific category's simple objects are enumerated.
**Reasoning:** the object-level vacuum is forced by the AND/OR/vacuum grammar
(CA-02): "vacuum = ℂ" is the ⊗-unit, not the ⊕-unit. The index-level convention is
orthogonal and not yet needed.
**Source:** `report/sections/02_and_or_vacuum_grammar.tex` (CA-02, "Two Monoidal
Structures and Their Units"); `references/cft/Schottenloher2008/Schottenloher2008.md:4218`
("H_0 = ℂ with the vacuum Ω := 1 ∈ H_0").
**Sweep status:** CA-02, CA-03 use vacuum `= ℂ` (`\one`) and zero space `= {0}`
(`\zero`) per this convention.

## (b) F-symbol / R-symbol gauge
**Choice:** NOT YET FIXED.
**Reasoning:** unitary vs involutory gauge differ; importing entries across
gauges gives silently-wrong inner products (TensorCategories.jl is involutory).
**Source:** —
**Sweep status:** —

## (c) Fusion-tree bracketing and label order
**Choice:** NOT YET FIXED.
**Reasoning:** left- vs right-associated trees relate by an F-move; entries must
be stated in one convention.
**Source:** —
**Sweep status:** —

## (d) CFT normalizations
**Choice:** NOT YET FIXED.
**Reasoning:** central charge, Virasoro mode convention, OPE-coefficient
normalization, chiral vs full — record before use.
**Source:** —
**Sweep status:** —

## (e) Lattice conventions
**Choice:** NOT YET FIXED.
**Reasoning:** Hamiltonian sign, orientation, boundary type, star/plaquette
naming.
**Source:** —
**Sweep status:** —

## (f) Symmetry data in the Hilbert-space grammar
**Choice:** A symmetry on a Hilbert carrier is recorded as a strongly continuous
unitary representation `U : G -> U(H)`. A projective symmetry is handled, in this
pre-work grammar, by replacing it with an honest unitary representation of a
specified central extension `E -> G`; no cocycle-level calculus is used until a
later convention fixes multipliers. The vacuum sector `C` carries the trivial
action, and the zero space carries the unique action. Grammar propagation uses
direct sums for OR and tensor products for AND. Fock-style notation is derived,
not primitive grammar: from `(H,U)` it denotes the graded Hilbert direct sum of
tensor-power representation sectors `⊕̂_{n>=0} (H^⊗̂n, U^⊗̂n)`, with finite
truncations as finite ORs of tensor powers.
**Reasoning:** this keeps the syntax inside ordinary Hilbert-space
representation theory while still supporting the project's projective-unitary
north star. It also avoids silently tensoring projective multipliers with
incompatible cocycles.
**Source:** `references/cft/Schottenloher2008/Schottenloher2008.md:1524`
(unitary representation), `:1528` (projective representation), `:1570` and
`:1618` (central-extension lift); `references/text/PenneysUnitaryFusionCategories.md:323`
(`Rep^\dagger(G)`); CA-05.
**Sweep status:** CA-04--CA-08 use this convention.

## (g) Sector, projection, and quotient semantics
**Choice:** A sector of a compiled Hilbert carrier is represented first by an
orthogonal projection `P^2 = P = P^*`; its Hilbert space is `Ran(P)` with the
inherited inner product. A quotient presentation is admitted only when the
closed relation subspace is named. For a finite group action, the invariant
quotient is `H / span{U(g)v - v}` and is identified with `Ran(P_G)` through the
averaging projection `P_G = |G|^{-1} sum_g U(g)`. More generally, for a finite
group action and a one-dimensional unitary character `chi`, the character sector
uses `P_chi = |G|^{-1} sum_g conj(chi(g)) U(g)`; the invariant sector is
`chi = 1`. Observable algebras must be named explicitly: full `B(H)`,
block-preserving, tensor-local, invariant, or compressed `P A P` on `Ran(P)`.
**Reasoning:** "symmetry = quotient" is too imprecise: the Hilbert quotient is
controlled by a closed relation subspace, and the computationally stable object
is the projection. Explicit observable policies prevent confusing
`B(H \oplus K)` with `B(H) \oplus B(K)` or a tensor-local subalgebra.
**Source:** `references/text/PenneysUnitaryFusionCategories.md:219` (orthogonal
direct sums give projections), `:235` (orthogonal projections and splittings);
CA-06 local derivation and `test/runtests.jl` finite-group invariant check;
CA-07--CA-08 for one-dimensional exchange-character sectors.
**Sweep status:** CA-04--CA-08 and `src/CftAnyons.jl` finite projector helpers.
