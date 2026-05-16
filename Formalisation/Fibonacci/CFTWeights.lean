import Mathlib

/-!
Exact rational checks for the Fibonacci conformal-weight input.

Source provenance:
* `references/text/IsingLikeFibonacciAnyonsKZ.txt`, lines 999-1003, identifies
  the Fibonacci category with the level 3 SU(2) Wess-Zumino-Witten spin-1
  sector.
* The same local PDF, page 17 of the paper body / PDF page 18, displays the
  table row `j(spin)=1`, `lambda=2 omega_1`, `h=2/5`.
* `references/text/IsingLikeFibonacciAnyonsKZ.txt`, line 1020, identifies the
  Fibonacci anyon field tau with the spin 1 field.
* `references/text/PoilblancOneDimensionalItinerantInteractingAnyons.txt`,
  lines 375-379, states that conformal scaling dimension is the sum of left
  and right conformal weights.

This file proves only exact rational arithmetic. It does not formalise the
Wess-Zumino-Witten construction or the source-table extraction.

Port provenance: ported from
`cft-anyons-deprecated/Formalisation/Fibonacci/CFTWeights.lean` (source
SHA256 `af8dfbf51b950def1c1fdbb4b20e59bb7ec54c66a68cb1a41a5ebb8fc1df6e9f`,
114 LOC) at MIGRATION_PLAN.md:223 (P5.12). The body (from `namespace
CFTAnyons` at source line 22 to EOF source line 114) is byte-identical to
the CAD source body from its `namespace CFTAnyons` onwards. The CAD module
docstring (source lines 3-20) is PRESERVED VERBATIM as the opening
provenance-and-scope block above ("Exact rational checks ... source-table
extraction."); the rest of this docstring is the cft-anyons-canonical
provenance + GLOSSARY-cross-reference + 2-way C-gate + (G_2)_1 unchecked-
status flag extension that this P5.12 commit adds.

============================================================================
CRITICAL — `(G_2)_1` is `\unchecked` in `summary.tex` (CITATION_INDEX status)
============================================================================

The numeric value `tauChiralConformalWeight = 2/5` proved in this file
depends on the choice of `(G_2)_1` as the CFT for the Fibonacci anyon model.
That choice is `\unchecked` in `summary.tex`:

* `summary.tex:1855-1869` (`warn:fibCFTs`, "Two distinct CFTs called
  Fibonacci") explicitly flags `(G_2)_1` with `\unchecked` and a footnote
  pointing to `RESEARCH_NOTES.md` acquisition-queue entry
  `aq:g2-1-chiral-cft`.
* `CITATION_INDEX.md:97-109` records `g2-1-chiral-cft` as `undischarged`
  with no local PDF, no literature-DB record, no Lean proof, no AF node.
  Per-citation entry text (CITATION_INDEX.md:99): "summary.tex location(s):
  lines 1858, 1865, 1866, 1867, 1888, 1944, 2272, 2442".
* `RESEARCH_NOTES.md:151-180` (`aq:g2-1-chiral-cft`) records the
  acquisition target (Goddard-Kent-Olive 1985 for the level-1 WZW
  central-charge formula; Di Francesco-Mathieu-Senechal or Fuchs for the
  Fibonacci modular data via `\widehat{su(2)}_3 \to (G_2)_1` truncation).
  Expected discharge: P3.2-style at `summary.tex:1866`. None acquired yet.

**Critical scope distinction.** The Lean theorems below are mathematically
true UNCONDITIONALLY — they are exact rational-arithmetic identities on the
formula `h = spin · (spin+1) / (level + 2)` (the standard `su(2)_k`
WZW conformal weight) at `(level, spin) = (3, 1)`. What the `\unchecked`
flag concerns is the **PHYSICAL IDENTIFICATION**: namely the choice to
interpret the chiral Fibonacci CFT as `(G_2)_1` with `c = 14/5` and `tau`
weight `h_tau = 2/5` (the value computed here at level 3 spin 1 of
`su(2)_k` via the `\widehat{su(2)}_3 \to (G_2)_1` coset truncation). The
alternative interpretation (antiferromagnetic golden chain, continuum limit
the tricritical Ising minimal model `M(4,5)` with `c = 7/10` and a
different `h_tau`) is documented at `summary.tex:1860-1863` and is NOT the
choice used here, following `warn:fibCFTs`'s stated convention "Calculations
in this document use the chiral `(G_2)_1` convention `h_tau=2/5` whenever
the Fibonacci CFT is invoked, following Chat~2's stated choice".

The Lean theorem `tau_chiral_conformal_weight : tauChiralConformalWeight =
2/5` is therefore a CONDITIONAL realisation of the SCALAR conformal-weight
data IF the `(G_2)_1` choice is the correct CFT. The rational identity is
unconditional; the physical naming `tauChiralConformalWeight` carries the
`\unchecked` interpretive load via `warn:fibCFTs` per CITATION_INDEX
discharge status. Any downstream consumer (notably `lem:fib-beta` at
`summary.tex:1888-1902` whose entire derivation depends on `h_one = 0`,
`h_tau = 2/5`) inherits the same `\unchecked` interpretive status. Per
PRD.md's pre-read warning, "`\unchecked` flags ... never silently treat
an undischarged flag as discharged" — this file MUST NOT be cited as
discharge of the `(G_2)_1` choice; it discharges only the rational
arithmetic GIVEN that choice.

============================================================================
Cross-references to GLOSSARY.md
============================================================================

This file provides the SCALAR rational-arithmetic case of TWO pre-existing
GLOSSARY entries whose CAD translation maps explicitly name this file.

-- GLOSSARY: def:primary (GLOSSARY.md:1474) — Primary, conformal weight,
   scaling dimension. The GLOSSARY entry's CAD translation map at
   `GLOSSARY.md:1497` is the PRE-BINDING for this P5.12 commit.
   **Quoted verbatim** (the load-bearing CAD-side pre-binding paragraph):

   > "CAD: Fibonacci-specific case in `Fibonacci/CFTWeights.lean`
   > (Phase 5 P5.12) — `τ` chiral weight `2/5`, descendant weights proved.
   > General 2D CFT primary structure (Virasoro-pair representation,
   > conformal weights `(h, h̄)`) not formalised in CAD. Per
   > `stocktake/reports/cad-lean.md` §5 line 351."

   **Per-promise correspondence.** The pre-binding makes TWO promises:
   (i) the `tau` chiral weight value `2/5`, and (ii) the descendant
   weights. Per-decl mapping:

   * Promise (i) — `tau` chiral weight `2/5` — realised by the following
     SCALAR theorem on the WZW formula at `(level, spin) = (3, 1)`:

       - `theorem su2_level3_spin1_weight` (body line 34):
         `su2WZWSpinWeight 3 1 = 2/5`. This is the exact rational
         arithmetic identity `1 · (1+1) / (3+2) = 2/5` realising the
         su(2)_3 conformal weight at spin 1.
       - `theorem tau_chiral_conformal_weight` (body line 38):
         `tauChiralConformalWeight = 2/5`. This is the per-name reduction
         lemma identifying `tauChiralConformalWeight` (defined at body
         line 28 as `su2WZWSpinWeight 3 1`) with the literal value `2/5`.
         LOAD-BEARING for `summary.tex:1859` (`h_tau = 2/5`) GIVEN the
         `(G_2)_1` choice — see `\unchecked` flag block above.

   * Promise (ii) — descendant weights — realised by the following
     SCALAR theorems on the descendant-level addition formula `h + n`:

       - `theorem tau_chiral_descendant_weight` (body line 89):
         `tauChiralDescendantWeight n = 2/5 + n` for any `n : ℕ`. The
         `tau` chiral descendants at level `n` have weight `h_tau + n =
         2/5 + n`.
       - `theorem vacuum_chiral_descendant_weight` (body line 98):
         `vacuumChiralDescendantWeight n = n` for any `n : ℕ`. The
         vacuum (identity) chiral descendants at level `n` have weight
         `0 + n = n`.
       - `theorem tau_chiral_descendant_scaling_exponent` (body line 93):
         `chiralScalingExponent (tauChiralDescendantWeight n) =
         -(2/5 + n)`. Per-descendant scaling exponent.
       - `theorem vacuum_chiral_descendant_scaling_exponent` (body line
         102): `chiralScalingExponent (vacuumChiralDescendantWeight n) =
         -n`. Per-descendant scaling exponent for the vacuum tower.

   **Supporting infrastructure** that is NOT itself a `def:primary`
   realisation (per the P5.7+P5.8+P5.9+P5.10+P5.11 reviewer lessons
   against over-claiming GLOSSARY slugs):

       * `def su2WZWSpinWeight (level spin : ℚ) : ℚ :=
         spin * (spin + 1) / (level + 2)` (body line 25): the GENERIC
         su(2)_k WZW conformal-weight formula on rational `level` and
         `spin`. Standard CFT formula; `def:primary` is about the
         per-CFT primary-weight assignment, not the WZW closed-form
         expression. NOT a `def:primary` realisation — formula plumbing.
       * `def tauChiralConformalWeight : ℚ := su2WZWSpinWeight 3 1`
         (body line 28): the AMPLITUDE-VALUE definition naming the
         specific weight at level 3 spin 1. NOT a `def:primary`
         realisation per se — it is the AMPLITUDE-VALUE definition that
         the `tau_chiral_conformal_weight` theorem reduces to `2/5`.
       * `def vacuumChiralConformalWeight : ℚ := 0` (body line 31):
         the AMPLITUDE-VALUE definition for the vacuum weight
         `h_one = 0`. NOT a `def:primary` realisation per se.
       * `def leftRightScalingDimension (left right : ℚ) : ℚ :=
         left + right` (body line 42): the GENERIC left+right scaling-
         dimension formula `Delta = h + bar h` per `def:primary`'s
         "scaling dimension is Delta := h + bar h". Used in
         `tau_diagonal_scaling_dimension` below. NOT a `def:primary`
         realisation — formula plumbing.
       * `def chiralScalingExponent (weight : ℚ) : ℚ := -weight` (body
         line 75): the sign-flipped weight used as a power-law exponent
         in the OPE / RG amplitude per `def:RG-amp` at
         `summary.tex:1875`. NOT a `def:primary` realisation per se.
       * `def tauChiralDescendantWeight (n : ℕ) : ℚ :=
         tauChiralConformalWeight + n` (body line 78): the level-`n`
         descendant tower over the `tau` primary. AMPLITUDE-VALUE
         definition.
       * `def vacuumChiralDescendantWeight (n : ℕ) : ℚ :=
         vacuumChiralConformalWeight + n` (body line 81): the level-`n`
         descendant tower over the vacuum.

-- GLOSSARY: def:OPE (GLOSSARY.md:1530) — OPE coefficient. The GLOSSARY
   entry's CAD translation map at `GLOSSARY.md:1551` is the SECOND
   PRE-BINDING for this P5.12 commit. **Quoted verbatim** (the load-
   bearing CAD-side scope-distinction paragraph):

   > "CAD: not formalised. `Fibonacci/CFTWeights.lean` (Phase 5 P5.12)
   > handles individual primaries' weights but not the general OPE
   > coefficient structure (per `stocktake/reports/cad-lean.md` §5)."

   **Per-promise correspondence.** The pre-binding makes ONE positive
   promise and ONE negative scope-statement:

   * Positive promise — "handles individual primaries' weights" — is
     realised by the same `su2_level3_spin1_weight` +
     `tau_chiral_conformal_weight` + `tau_chiral_descendant_weight` +
     `vacuum_chiral_descendant_weight` named theorems as the
     `def:primary` pre-binding above. Per-primary weight values for
     `tau` (`2/5`) and `one` (`0`), plus their descendants.

   * Negative scope-statement — "but not the general OPE coefficient
     structure" — is EXPLICITLY DISAVOWED here: no decl of this file
     defines, computes, or constructs OPE coefficients `C_{abc}`.
     `def:OPE` at `summary.tex:1834` defines `C_{abc}` as the
     normalisation-dependent coefficient in the short-distance product
     `Phi_a(z) Phi_b(0) ~ sum_c C_{abc} z^{h_c-h_a-h_b} ... Phi_c(0)`.
     This file provides the weight values `h_a`, `h_b`, `h_c` that
     would enter the exponent `z^{h_c-h_a-h_b}` IF an OPE-coefficient
     computation were performed; it does NOT compute the prefactor
     coefficients `C_{abc}` themselves. The OPE-coefficient structure
     remains UNFORMALISED in this repo per the pre-binding.

   **Per-decl scope.** The downstream consumer `lem:fib-beta`
   (`summary.tex:1888-1902`) USES this file's `tau_chiral_conformal_weight`
   (`h_tau = 2/5`) in conjunction with `vacuum_chiral_conformal_weight`
   (`h_one = 0`) to derive the binary blocking-coefficient exponents
   `rho^{h_one - 2 h_tau} = rho^{-4/5}` (i.e. `beta^one_{tau tau}`) and
   `rho^{h_tau - 2 h_tau} = rho^{-2/5}` (i.e. `beta^tau_{tau tau}`).
   The named theorems `vacuum_to_tau_tau_chiral_exponent` (body line
   55, value `-4/5`) and `tau_to_tau_tau_chiral_exponent` (body line
   60, value `-2/5`) are the LOAD-BEARING per-exponent identities for
   `lem:fib-beta` — see the 2-way C-gate block below.

   **Dependency cross-references**:

   * `[[def:fib]]` (GLOSSARY.md:961) — the Fibonacci fusion category.
     The labels `one` (vacuum) and `tau` (the non-trivial primary) are
     the two simple objects of the Fibonacci fusion category, already
     FULLY discharged at P5.9 via `Fibonacci/FusionRules.lean`'s
     `FibLabel`. This file uses the names `vacuumChiralConformalWeight`
     and `tauChiralConformalWeight` for the per-primary weights without
     re-introducing the label type — the binding is by primary NAME
     ("one" / "tau") at the conformal-weight level, NOT by typed
     `FibLabel` argument. NOT a D-gate pre-binding for `def:fib` —
     this is a notational cross-reference. (The same naming style is
     used in `lem:fib-beta`'s `h_one` and `h_tau` subscripts in
     `summary.tex:1889`.)

   * `[[def:isingcft]]` (GLOSSARY.md:1558) — Diagonal Ising data.
     SIBLING CFT-data entry (`c = 1/2`, `h_sigma = 1/16`, `h_psi =
     1/2`) discharged at P5.15's `Ising/Basic.lean` (per `GLOSSARY.md:
     1583`). The CAD source NO-OPS the relationship; this file's
     `(G_2)_1` `h_tau = 2/5` is NUMERICALLY DISTINCT from any Ising
     primary weight. The two CFTs are different objects per
     `warn:fibCFTs` at `summary.tex:1855` (Fibonacci `(G_2)_1` `c =
     14/5`; diagonal Ising `M(3,4)` `c = 1/2`); the antiferromagnetic-
     golden-chain alternative reads `M(4,5)` tricritical Ising
     `c = 7/10` (also distinct). NOT a D-gate pre-binding — this is a
     SIBLING-CFT-data cross-reference.

   **Documentation cross-references** (NOT D-gate pre-bindings):

   * `def:RG-amp` (`GLOSSARY.md:1592`; `summary.tex:1875`) — the
     OPE/RG amplitude ansatz consuming this file's
     `chiralScalingExponent` (`-weight`) in the form `rho^{h_a -
     sum_i h_{b_i}}`. The five chiral-exponent theorems
     (`tau_diagonal_scaling_dimension` at body line 45,
     `doubled_tau_chiral_weight` at body line 51,
     `vacuum_to_tau_tau_chiral_exponent` at body line 55,
     `tau_to_tau_tau_chiral_exponent` at body line 60,
     `vacuum_rg_norm_exponent` at body line 64,
     `tau_rg_norm_exponent` at body line 70) are
     `def:RG-amp`-CONSUMER-SIDE rational-arithmetic identities, NOT
     `def:RG-amp` realisations per se. The `def:RG-amp` GLOSSARY entry
     is currently scheduled for the Phase-5 `LinearAlgebra/NoMixing.lean`
     framework (per `GLOSSARY.md:1619`, P4.10 anchored the "no-mixing
     scalar formula") — that is a different file. NOT a `def:RG-amp`
     pre-binding.

   * `def:phi` (`GLOSSARY.md:997`) — NOT consumed in this file. This
     file is RATIONAL arithmetic only (`ℚ`, never `ℝ`); the golden
     ratio `phi = (1+sqrt 5)/2` is irrational and absent. NOT a
     dependency. (Contrast with `Fibonacci/Basic.lean` P5.7 which is
     the `phi`-arithmetic anchor.)

   * Vacuum-index convention (`CONVENTIONS.md` §(a), `GLOSSARY.md:131`):
     NOT applicable to this file. The CLAUDE.md hallucination-risk
     callout #1 ("vacuum-index convention; MMA archive/v0 vacuum at
     both index 0 and index 1") concerns the LABEL-SET INDEXING of
     the vacuum primary in fusion-category code — it is about WHICH
     INTEGER (0 or 1) names the vacuum in `FibLabel`/equivalent. This
     file uses no label-set indexing at all; the vacuum and `tau`
     primaries are referred to by NAME (`vacuumChiralConformalWeight`,
     `tauChiralConformalWeight`) with `ℚ`-valued weights. The vacuum-
     index convention does not fire here.

============================================================================
2-way C-gate (Lean ↔ summary.tex warn:fibCFTs at summary.tex:1855-1869
              + lem:fib-beta at summary.tex:1888-1902)
============================================================================

MIGRATION_PLAN.md:223 prescribes `M, D` for P5.12 — the lightest gate
set in Phase 5, reflecting that this file is pure rational arithmetic on
the `(G_2)_1` choice's weight values rather than a high-stakes definitional
disambiguation. Nevertheless, per the established P5.7 + P5.8 + P5.9 +
P5.10 + P5.11 canonical pattern (3-way for Fibonacci content; Wolfram leg
deferred to Phase 6), the 2-way C-gate (Lean ↔ summary.tex) is executed
here in full. The Wolfram leg is tracked as a Phase-6 bd follow-up filed
in this commit; the Wolfram check is largely redundant for rational
identities (the symbolic check `2/5 == 2/5` is trivial) but should at
minimum verify the `(G_2)_1` literature claim (`c = 14/5`, `h_tau = 2/5`)
against Wolfram's WZW database, providing an independent cross-check on
the (G_2)_1 literature claim itself (NOT a discharge of the `\unchecked`
flag — that requires acquired literature per `aq:g2-1-chiral-cft`).

`warn:fibCFTs` at `summary.tex:1858-1859` (verbatim transcription of the
relevant claim):

  "(a) the chiral CFT `(G_2)_1` with central charge `c = 14/5` and primaries
   of weight `h_tau = 2/5`"

Per-sub-claim Lean correspondence:

* Sub-claim "`h_tau = 2/5`":
  Lean: `theorem tau_chiral_conformal_weight : tauChiralConformalWeight
  = 2/5` (body line 38).
  MATCH (CONDITIONAL on the `(G_2)_1` choice). The Lean realisation
  computes the `su(2)_3` spin-1 WZW weight via
  `tauChiralConformalWeight := su2WZWSpinWeight 3 1` (body line 28)
  and proves `2/5` by `norm_num`. The interpretive identification of
  this `su(2)_3` weight with the `(G_2)_1` `tau` primary follows the
  `\widehat{su(2)}_3 \to (G_2)_1` coset truncation cited in
  `aq:g2-1-chiral-cft` (RESEARCH_NOTES.md:166-169); the literature
  citation for this coset relationship is the `\unchecked`-flagged
  part of the chain. No drift in the RATIONAL ARITHMETIC of the
  weight value GIVEN the choice; `\unchecked` status preserved for
  the choice itself.

* Sub-claim "`c = 14/5`" (central charge):
  Lean: NOT formalised in this file. The central charge `c` does not
  appear as a Lean def or theorem. The `aq:g2-1-chiral-cft`
  acquisition-queue entry references the Goddard-Kent-Olive 1985
  central-charge formula `c = k · dim(g) / (k + h^v)` evaluating to
  `c[(G_2)_1] = 14/5` via `k = 1`, `dim(G_2) = 14`, `h^v_{G_2} = 4`;
  formalising that formula would require Lie-algebra infrastructure
  beyond this file's scope (and beyond the CAD source). NO DRIFT
  because no Lean claim is made about `c`; the central-charge value
  is asserted in `summary.tex:1858` but is `\unchecked` and out of
  this file's scope per the CAD source's "It does not formalise the
  Wess-Zumino-Witten construction or the source-table extraction"
  disclaimer at source line 19.

`lem:fib-beta` at `summary.tex:1888-1902` (verbatim transcription of the
binary blocking-coefficient exponents):

  "With `h_one = 0`, `h_tau = 2/5`, the binary blocking coefficients are
     beta^one_{one one}   = u_0,
     beta^one_{tau tau}   = u_I · rho^{-4/5},
     beta^tau_{tau one}   = j_L,
     beta^tau_{one tau}   = j_R,
     beta^tau_{tau tau}   = u_tau · rho^{-2/5}.
   ...
   Exponent derivation: `h_one - 2 h_tau = 0 - 4/5 = -4/5` and
   `h_tau - 2 h_tau = -2/5`, applied to Definition `def:RG-amp` with
   `r = 2`."

Per-exponent Lean correspondence:

* Input `h_one = 0`:
  Lean: `def vacuumChiralConformalWeight : ℚ := 0` (body line 31)
  MATCH. The Lean def is the AMPLITUDE-VALUE definition naming the
  vacuum weight as the rational literal `0`. The proof obligation
  `vacuumChiralConformalWeight = 0` is the definitional `rfl` and is
  consumed wherever the value is used.

* Input `h_tau = 2/5`:
  Lean: `theorem tau_chiral_conformal_weight :
  tauChiralConformalWeight = 2/5` (body line 38)
  MATCH per above.

* Derived exponent `h_one - 2 h_tau = -4/5`:
  Lean: `theorem vacuum_to_tau_tau_chiral_exponent :
  vacuumChiralConformalWeight - 2 * tauChiralConformalWeight = -4/5`
  (body line 55) MATCH. Exact rational identity proved by `norm_num`.
  LOAD-BEARING for `lem:fib-beta`'s `beta^one_{tau tau}` exponent
  `rho^{-4/5}`.

* Derived exponent `h_tau - 2 h_tau = -2/5`:
  Lean: `theorem tau_to_tau_tau_chiral_exponent :
  tauChiralConformalWeight - 2 * tauChiralConformalWeight = -2/5`
  (body line 60) MATCH. Exact rational identity proved by `norm_num`.
  LOAD-BEARING for `lem:fib-beta`'s `beta^tau_{tau tau}` exponent
  `rho^{-2/5}`.

* Derived doubled-weight identity `2 · h_tau = 4/5`:
  Lean: `theorem doubled_tau_chiral_weight :
  2 * tauChiralConformalWeight = 4/5` (body line 51) MATCH. Used in
  the diagonal scaling-dimension calculation
  `Delta_tau,tau = h_tau + h_tau = 4/5`.

* Derived diagonal scaling dimension `Delta = h_tau + h_tau = 4/5`:
  Lean: `theorem tau_diagonal_scaling_dimension :
  leftRightScalingDimension tauChiralConformalWeight
  tauChiralConformalWeight = 4/5` (body line 45) MATCH. The
  GENERIC `def leftRightScalingDimension (left right : ℚ) := left
  + right` (body line 42) instantiated at `(h_tau, h_tau)`. Per
  `def:primary`'s "scaling dimension is `Delta := h + bar h`" — the
  diagonal case `bar h = h` evaluates to `2/5 + 2/5 = 4/5`.

* Doubled chiral scaling exponents (RG normalisation):
  Lean: `theorem vacuum_rg_norm_exponent :
  2 * (vacuumChiralConformalWeight - 2 * tauChiralConformalWeight) =
  -8/5` (body line 64) MATCH (`2 · (-4/5) = -8/5`).
  Lean: `theorem tau_rg_norm_exponent :
  2 * (tauChiralConformalWeight - 2 * tauChiralConformalWeight) =
  -4/5` (body line 70) MATCH (`2 · (-2/5) = -4/5`). These are the
  two-cell composition exponents (cf. `def:RG-amp` with two
  applications).

* Per-primary scaling exponent (single-cell, sign-flipped):
  Lean: `theorem tau_primary_chiral_scaling_exponent :
  chiralScalingExponent tauChiralConformalWeight = -2/5` (body line
  84) MATCH (`-h_tau = -2/5`).

* Descendant weights at level `n` (for any `n : ℕ`):
  Lean: `theorem tau_chiral_descendant_weight (n : ℕ) :
  tauChiralDescendantWeight n = 2/5 + n` (body line 89) MATCH.
  Lean: `theorem vacuum_chiral_descendant_weight (n : ℕ) :
  vacuumChiralDescendantWeight n = n` (body line 98) MATCH.

* Descendant scaling exponents at level `n`:
  Lean: `theorem tau_chiral_descendant_scaling_exponent (n : ℕ) :
  chiralScalingExponent (tauChiralDescendantWeight n) = -(2/5 + n)`
  (body line 93) MATCH.
  Lean: `theorem vacuum_chiral_descendant_scaling_exponent (n : ℕ) :
  chiralScalingExponent (vacuumChiralDescendantWeight n) = -n`
  (body line 102) MATCH.

* Diagonal scaling exponent (RG with `Delta` rather than `h`):
  Lean: `theorem tau_diagonal_scaling_exponent :
  chiralScalingExponent (leftRightScalingDimension
    tauChiralConformalWeight tauChiralConformalWeight) = -4/5`
  (body line 106) MATCH.

C-gate result: CLEARED for the SCALAR (rational-arithmetic) side of
`warn:fibCFTs (a)` + `lem:fib-beta`. All named theorems map verbatim to
`summary.tex` sub-claims at the rational-arithmetic level. C-gate
STATUS-CONDITIONAL on the `(G_2)_1` choice per the `\unchecked` flag —
the choice itself is NOT discharged by this file; the `\unchecked`
status of `aq:g2-1-chiral-cft` is PRESERVED. The Wolfram leg is
deferred to Phase 6 (`scripts/wolfram/fibonacci_cft_weights.wls`),
tracked in a bd follow-up filed in this commit; the Wolfram script
should additionally cross-check the literature claim `(G_2)_1` `c =
14/5` against Wolfram's WZW database (providing independent
verification of the central-charge value — NOT discharge of the
`\unchecked` flag, which still requires acquired PDF literature per
`aq:g2-1-chiral-cft`).

End of P5.12 docstring extension.
-/

namespace CFTAnyons
namespace Fibonacci

def su2WZWSpinWeight (level spin : ℚ) : ℚ :=
  spin * (spin + 1) / (level + 2)

def tauChiralConformalWeight : ℚ :=
  su2WZWSpinWeight 3 1

def vacuumChiralConformalWeight : ℚ :=
  0

theorem su2_level3_spin1_weight :
    su2WZWSpinWeight 3 1 = 2 / 5 := by
  norm_num [su2WZWSpinWeight]

theorem tau_chiral_conformal_weight :
    tauChiralConformalWeight = 2 / 5 := by
  norm_num [tauChiralConformalWeight, su2WZWSpinWeight]

def leftRightScalingDimension (left right : ℚ) : ℚ :=
  left + right

theorem tau_diagonal_scaling_dimension :
    leftRightScalingDimension tauChiralConformalWeight
      tauChiralConformalWeight = 4 / 5 := by
  norm_num [leftRightScalingDimension, tauChiralConformalWeight,
    su2WZWSpinWeight]

theorem doubled_tau_chiral_weight :
    2 * tauChiralConformalWeight = 4 / 5 := by
  norm_num [tauChiralConformalWeight, su2WZWSpinWeight]

theorem vacuum_to_tau_tau_chiral_exponent :
    vacuumChiralConformalWeight - 2 * tauChiralConformalWeight = -4 / 5 := by
  norm_num [vacuumChiralConformalWeight, tauChiralConformalWeight,
    su2WZWSpinWeight]

theorem tau_to_tau_tau_chiral_exponent :
    tauChiralConformalWeight - 2 * tauChiralConformalWeight = -2 / 5 := by
  norm_num [tauChiralConformalWeight, su2WZWSpinWeight]

theorem vacuum_rg_norm_exponent :
    2 * (vacuumChiralConformalWeight - 2 * tauChiralConformalWeight) =
      -8 / 5 := by
  norm_num [vacuumChiralConformalWeight, tauChiralConformalWeight,
    su2WZWSpinWeight]

theorem tau_rg_norm_exponent :
    2 * (tauChiralConformalWeight - 2 * tauChiralConformalWeight) =
      -4 / 5 := by
  norm_num [tauChiralConformalWeight, su2WZWSpinWeight]

def chiralScalingExponent (weight : ℚ) : ℚ :=
  -weight

def tauChiralDescendantWeight (n : ℕ) : ℚ :=
  tauChiralConformalWeight + n

def vacuumChiralDescendantWeight (n : ℕ) : ℚ :=
  vacuumChiralConformalWeight + n

theorem tau_primary_chiral_scaling_exponent :
    chiralScalingExponent tauChiralConformalWeight = -2 / 5 := by
  norm_num [chiralScalingExponent, tauChiralConformalWeight,
    su2WZWSpinWeight]

theorem tau_chiral_descendant_weight (n : ℕ) :
    tauChiralDescendantWeight n = 2 / 5 + n := by
  rw [tauChiralDescendantWeight, tau_chiral_conformal_weight]

theorem tau_chiral_descendant_scaling_exponent (n : ℕ) :
    chiralScalingExponent (tauChiralDescendantWeight n) =
      -(2 / 5 + n) := by
  rw [chiralScalingExponent, tau_chiral_descendant_weight]

theorem vacuum_chiral_descendant_weight (n : ℕ) :
    vacuumChiralDescendantWeight n = n := by
  simp [vacuumChiralDescendantWeight, vacuumChiralConformalWeight]

theorem vacuum_chiral_descendant_scaling_exponent (n : ℕ) :
    chiralScalingExponent (vacuumChiralDescendantWeight n) = -n := by
  rw [chiralScalingExponent, vacuum_chiral_descendant_weight]

theorem tau_diagonal_scaling_exponent :
    chiralScalingExponent
      (leftRightScalingDimension tauChiralConformalWeight
        tauChiralConformalWeight) = -4 / 5 := by
  norm_num [chiralScalingExponent, leftRightScalingDimension,
    tauChiralConformalWeight, su2WZWSpinWeight]

end Fibonacci
end CFTAnyons
