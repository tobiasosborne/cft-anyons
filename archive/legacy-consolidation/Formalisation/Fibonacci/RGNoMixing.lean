import Formalisation.LinearAlgebra.NoMixing

/-!
Finite Fibonacci no-mixing RG rows.

This file packages the two displayed Fibonacci no-mixing rows from the handoff
as finite coordinate vectors. The real scale factors stand for the sourced
powers `rho^(-4/5)` and `rho^(-2/5)`; the exponent arithmetic is proved
separately in `Formalisation/Fibonacci/CFTWeights.lean`.

Port provenance: ported from
`cft-anyons-deprecated/Formalisation/Fibonacci/RGNoMixing.lean` (source
SHA256 `57b4f90419ce74cb575a15fe0fd8bcbebbbd5832484f0cd4c30890b816e9acd1`,
208 LOC) at MIGRATION_PLAN.md:225 (P5.14). The body (from `namespace
CFTAnyons` at source line 12 to EOF source line 208) is byte-identical to
the CAD source body from its `namespace CFTAnyons` onwards. The CAD module
docstring (source lines 3-10) is PRESERVED VERBATIM as the opening
provenance-and-scope block above ("Finite Fibonacci no-mixing RG rows ...
`Formalisation/Fibonacci/CFTWeights.lean`."); the rest of this docstring
is the cft-anyons-canonical provenance + GLOSSARY pre-binding paragraph
+ per-decl correspondence + (G_2)_1 \unchecked status cross-reference
(via P5.12) + 2-way C-gate (Lean ↔ summary.tex) + Wolfram-deferral note
that this P5.14 commit adds.

============================================================================
GLOSSARY pre-binding paragraph — `def:RG-amp` (GLOSSARY.md:1592)
============================================================================

This file is the LOAD-BEARING CAD-side anchor of the Fibonacci-specific
half of the `def:RG-amp` (OPE/RG amplitude ansatz) translation map. The
GLOSSARY entry's CAD translation map at `GLOSSARY.md:1619` is the
PRE-BINDING for this P5.14 commit. **Quoted verbatim** (the load-bearing
CAD-side pre-binding paragraph):

> "CAD: Fibonacci-specific RG-decorated amplitude formulas in
> `Fibonacci/RGNoMixing.lean` (Phase 5 P5.14) — proved for both rows of
> the F-matrix. Abstract polar-decomposition canonical-section framework
> in `LinearAlgebra/Polar.lean` (Phase 4 P4.3) + general no-mixing scalar
> formula in `LinearAlgebra/NoMixing.lean` (P4.10). Per
> `stocktake/reports/cad-lean.md` §5 lines 353, 360, 361."

The pre-binding makes the following promises about this file specifically
(the abstract `Polar.lean` and `NoMixing.lean` halves were already
discharged at P4.3 and P4.10 respectively): (a) "Fibonacci-specific
RG-decorated amplitude formulas", (b) "proved for both rows of the
F-matrix". This file discharges both promises — the two rows are the
VACUUM row (`one` coarse channel; coarse label `mu = one`) with fine
channels `{(one, one), (tau, tau)}` (a 2-element fine index, the
`FibRGVacuumChannel`), and the TAU row (`tau` coarse channel; coarse
label `mu = tau`) with fine channels `{(tau, one), (one, tau), (tau,
tau)}` (a 3-element fine index, the `FibRGTauChannel`). The
"RG-decorated" qualifier refers to the explicit appearance of the real
scale-factor parameters `vacScale` and `tauScale` standing for the
exponent-encoded scale factors `rho^(-4/5)` (vacuum row) and
`rho^(-2/5)` (tau row) — see the (G_2)_1 cross-reference block below
and the 2-way C-gate block below for the per-formula match to
`summary.tex` Lemma `lem:fib-beta` and Example `ex:fib-RG`.

**Per-decl correspondence to the pre-binding promise.** The pre-binding
promises "Fibonacci-specific RG-decorated amplitude formulas proved for
both rows of the F-matrix". Per-decl mapping (decl body line numbers
refer to the destination file):

* **Index types** (the FINE-CHANNEL skeletons):

  * `abbrev FibRGVacuumChannel := Fin 2` (body line 20) + namespace
    members `oneOne : 0`, `tauTau : 1` (body lines 24-25): the 2-element
    fine-channel index for the vacuum (`one`) coarse row. The two
    elements label the binary fine fusion outcomes `(one, one)` and
    `(tau, tau)` that fuse to the vacuum coarse label, matching the
    `summary.tex` Lemma `lem:fib-beta` listing
    `beta^{one}_{one,one} = u_0`, `beta^{one}_{tau,tau} = u_I rho^(-4/5)`.
  * `abbrev FibRGTauChannel := Fin 3` (body line 29) + namespace
    members `tauOne : 0`, `oneTau : 1`, `tauTau : 2` (body lines 33-35):
    the 3-element fine-channel index for the tau coarse row. The three
    elements label the binary fine fusion outcomes `(tau, one)`,
    `(one, tau)`, `(tau, tau)` that fuse to the tau coarse label,
    matching the `summary.tex` Lemma `lem:fib-beta` listing
    `beta^{tau}_{tau,one} = j_L`, `beta^{tau}_{one,tau} = j_R`,
    `beta^{tau}_{tau,tau} = u_tau rho^(-2/5)`.

* **OPE-amplitude (β) defs** (the per-row OPE-amplitude vectors):

  * `def fibRGVacuumBeta (u0 uI : ℂ) (vacScale : ℝ) :
      FibRGVacuumChannel → ℂ` (body line 39): the vacuum-row OPE-
    amplitude vector `beta^{one}`. The two entries are `u_0` (at
    `oneOne`) and `u_I · vacScale` (at `tauTau`); the real
    `vacScale : ℝ` is the parameter standing for `rho^(-4/5)`, embedded
    via `(vacScale : ℂ)`.
  * `def fibRGTauBeta (jL jR uTau : ℂ) (tauScale : ℝ) :
      FibRGTauChannel → ℂ` (body line 43): the tau-row OPE-amplitude
    vector `beta^{tau}`. The three entries are `j_L` (at `tauOne`),
    `j_R` (at `oneTau`), and `u_tau · tauScale` (at `tauTau`); the
    real `tauScale : ℝ` is the parameter standing for `rho^(-2/5)`,
    embedded via `(tauScale : ℂ)`.

* **Denominator-form theorems** (the per-row evaluations of
  `LinearAlgebra.NoMixingDenominator β = ∑ i, |β_i|^2` of P4.10):

  * `theorem fibRGVacuumDenominator` (body line 49):
    `NoMixingDenominator (fibRGVacuumBeta u0 uI vacScale) =
     |u_0|^2 + |u_I|^2 · vacScale^2`. This is the SCALAR per-row
    denominator `∑_ν |β^{one}_ν|^2` evaluated on the vacuum row. With
    `vacScale = rho^(-4/5)` the value matches `summary.tex`
    Example `ex:fib-RG` line `|u_0|^2 + |u_I|^2 rho^(-8/5)` (note the
    `vacScale^2 = rho^(-8/5)` square).
  * `theorem fibRGTauDenominator` (body line 58):
    `NoMixingDenominator (fibRGTauBeta jL jR uTau tauScale) =
     |j_L|^2 + |j_R|^2 + |u_tau|^2 · tauScale^2`. This is the
    SCALAR per-row denominator `∑_ν |β^{tau}_ν|^2` evaluated on the
    tau row. With `tauScale = rho^(-2/5)` the value matches
    `summary.tex` Example `ex:fib-RG` line `|j_L|^2 + |j_R|^2 +
    |u_tau|^2 rho^(-4/5)` (note the `tauScale^2 = rho^(-4/5)` square).

* **Probability infrastructure for the tau-tau outcome** (the
  `|β|^2 / ∑|β|^2` probability of the `(tau, tau)` fine channel
  conditional on the tau coarse row):

  * `def fibRGTauProbabilityDenominator (jL jR uTau : ℂ) (tauScale : ℝ)
    : ℝ` (body line 67): the REAL-valued copy of the tau-row Gram sum
    `|j_L|^2 + |j_R|^2 + |u_tau|^2 · tauScale^2`. Convenient real
    surface for probability statements (avoids `Complex.normSq`'s
    `ℂ → ℝ` coercion in the surface API).
  * `def fibRGTauTauProbability (jL jR uTau : ℂ) (tauScale : ℝ) : ℝ`
    (body line 71): the `(tau, tau)` outcome probability
    `|u_tau|^2 · tauScale^2 / fibRGTauProbabilityDenominator`. Real
    `0 ≤ · ≤ 1` quantity.
  * `theorem fibRGTauProbabilityDenominator_eq` (body line 76):
    the identification `fibRGTauProbabilityDenominator =
    NoMixingDenominator ∘ fibRGTauBeta` (sanity bridge between
    the real-valued and complex-valued denominator surfaces).
  * `theorem fibRGTauProbabilityDenominator_nonneg` (body line 84):
    `0 ≤ fibRGTauProbabilityDenominator`. Standard `nlinarith`
    closure on `Complex.normSq_nonneg` + `sq_nonneg`.
  * `theorem fibRGTauTauProbability_nonneg` (body line 91):
    `0 ≤ fibRGTauTauProbability`. Standard `div_nonneg` closure.
  * `theorem fibRGTauTauProbability_le_one_of_denominator_pos`
    (body line 99): `fibRGTauTauProbability ≤ 1` conditional on
    `0 < fibRGTauProbabilityDenominator` (the obvious side-
    condition for the bound). Proved by `div_le_iff₀` reduction
    + `nlinarith` on `Complex.normSq_nonneg`.

* **Per-channel `NoMixingAmplitude` evaluations** (the closed-form
  canonical-section amplitudes `star (β_i) / sqrt(∑_ν |β_ν|^2)` of
  P4.10 evaluated on each channel of each row):

  * `theorem fibRGVacuumAmplitude_oneOne` (body line 108):
    `NoMixingAmplitude (fibRGVacuumBeta u0 uI vacScale) oneOne =
     star u0 / (Real.sqrt (|u_0|^2 + |u_I|^2 vacScale^2) : ℂ)`. The
    closed-form amplitude on the vacuum row at the `(one, one)`
    fine channel — the first entry of the no-mixing-corollary
    formula at `summary.tex` Example `ex:fib-RG` line
    `eta_one^RG = (bar u_0 v^{one}_{one,one} + bar u_I rho^(-4/5)
    v^{one}_{tau,tau}) / sqrt(|u_0|^2 + |u_I|^2 rho^(-8/5))`.
  * `theorem fibRGVacuumAmplitude_tauTau` (body line 117): the
    closed-form amplitude on the vacuum row at the `(tau, tau)`
    fine channel — the second entry of the same Example.
  * `theorem fibRGTauAmplitude_tauOne` (body line 127):
    `NoMixingAmplitude (fibRGTauBeta jL jR uTau tauScale) tauOne =
     star jL / (Real.sqrt (|j_L|^2 + |j_R|^2 + |u_tau|^2 tauScale^2)
     : ℂ)`. The closed-form amplitude on the tau row at the
    `(tau, one)` fine channel — the first entry of `summary.tex`
    Example `ex:fib-RG` line `eta_tau^RG = (bar j_L v^{tau}_{tau,one}
    + bar j_R v^{tau}_{one,tau} + bar u_tau rho^(-2/5)
    v^{tau}_{tau,tau}) / sqrt(|j_L|^2 + |j_R|^2 + |u_tau|^2
    rho^(-4/5))`.
  * `theorem fibRGTauAmplitude_oneTau` (body line 137): the
    closed-form amplitude on the tau row at the `(one, tau)`
    fine channel — the second entry of the same Example.
  * `theorem fibRGTauAmplitude_tauTau` (body line 147): the
    closed-form amplitude on the tau row at the `(tau, tau)`
    fine channel — the third entry of the same Example.

* **Sanity identity probability ↔ amplitude squared modulus**:

  * `theorem fibRGTauTauProbability_eq_amplitude_normSq` (body line
    159): `Complex.normSq (NoMixingAmplitude (fibRGTauBeta ...)
    tauTau) = fibRGTauTauProbability ...`. The probability-amplitude
    Born-rule identification on the tau-tau channel: the squared
    modulus of the canonical-section amplitude equals the
    `fibRGTauTauProbability` real value defined above. This is the
    LOAD-BEARING per-channel verification that the
    `fibRGTauTauProbability` real surface (used for probability-bound
    statements) is the genuine `|A|^2` of the canonical-section
    amplitude.

* **Per-row normalisation theorems** (the matrix-level `E^† E = id`
  scalar specialisation: `∑_ν star(A_ν) · A_ν = 1`):

  * `theorem fibRGVacuumAmplitude_normalised` (body line 183):
    `∑ i, star (NoMixingAmplitude (fibRGVacuumBeta ...) i) ·
     NoMixingAmplitude (fibRGVacuumBeta ...) i = 1` conditional on
    `NoMixingDenominator (fibRGVacuumBeta ...) ≠ 0`. This is the
    per-row normalisation of the canonical-section amplitude on the
    vacuum row — the SCALAR isometry equation `E^† E = id_{coarse}`
    at the per-row level, exactly the application of
    `LinearAlgebra.noMixingAmplitude_normalised` (P4.10) to the
    Fibonacci vacuum-row OPE-amplitude vector.
  * `theorem fibRGTauAmplitude_normalised` (body line 194): the
    analogous normalisation on the tau row.

These nine theorems (two denominator forms + five per-channel amplitudes
+ probability Born-rule identification + two per-row normalisations,
not counting the four probability-supporting lemmas) collectively
discharge the GLOSSARY `def:RG-amp` translation-map promise
"Fibonacci-specific RG-decorated amplitude formulas proved for both
rows of the F-matrix" — for both the vacuum row (2-channel) and the
tau row (3-channel) of the F-matrix block-decomposition.

============================================================================
CRITICAL — `(G_2)_1` `\unchecked` flag cross-reference (via P5.12)
============================================================================

The PHYSICAL CONTENT of the `vacScale` and `tauScale` real scale-factor
parameters is `rho^(-4/5)` and `rho^(-2/5)` respectively. Those values
are sourced from the chiral `(G_2)_1` conformal-weight choice
(`h_one = 0`, `h_tau = 2/5`) per `summary.tex` Lemma `lem:fib-beta`
(line 1888): `beta^{one}_{tau,tau} = u_I rho^(h_one - 2 h_tau) =
u_I rho^(-4/5)` and `beta^{tau}_{tau,tau} = u_tau rho^(h_tau - 2 h_tau)
= u_tau rho^(-2/5)`. The conformal-weight values themselves are proved
SCALAR-LEVEL at `Formalisation/Fibonacci/CFTWeights.lean` (P5.12).

Per the P5.12 docstring's `(G_2)_1` `\unchecked`-flag block (Phase-5
canonical pattern), the `(G_2)_1` choice is `\unchecked` in
`summary.tex`:

* `summary.tex:1855-1869` (`warn:fibCFTs`, "Two distinct CFTs called
  Fibonacci") explicitly flags `(G_2)_1` with `\unchecked` and a
  footnote pointing to `RESEARCH_NOTES.md` acquisition-queue entry
  `aq:g2-1-chiral-cft`.
* `CITATION_INDEX.md:97-109` records `g2-1-chiral-cft` as `undischarged`
  with no local PDF, no literature-DB record, no Lean proof, no AF
  node.
* `RESEARCH_NOTES.md:151-180` (`aq:g2-1-chiral-cft`) records the
  acquisition target. None acquired yet.

**Critical scope distinction (inherited from P5.12).** The Lean
theorems below are mathematically true UNCONDITIONALLY — they are
exact algebraic identities on per-row Gram sums and canonical-section
amplitudes parameterised by abstract complex amplitudes `u_0, u_I,
j_L, j_R, u_tau : ℂ` and abstract real scale factors `vacScale,
tauScale : ℝ`. The Lean theorems make NO claim about the SPECIFIC
numerical values `vacScale = rho^(-4/5)` and `tauScale = rho^(-2/5)`
— those identifications belong to `summary.tex` Lemma `lem:fib-beta`,
which depends on the `(G_2)_1` `\unchecked` choice via P5.12's
`tau_chiral_conformal_weight`. Per `PRD.md`'s pre-read warning,
"`\unchecked` flags ... never silently treat an undischarged flag as
discharged" — this file MUST NOT be cited as discharge of the
`(G_2)_1` choice; it discharges the SCALAR ALGEBRAIC IDENTITIES of
the no-mixing-corollary application to a parameterised binary
fine-channel Fibonacci row family, with the per-row scale factors
left as free real parameters. Downstream consumers that instantiate
`vacScale := rho^(-4/5)` and `tauScale := rho^(-2/5)` (e.g.
`summary.tex` Example `ex:fib-RG` at line 1944) inherit the
`(G_2)_1` `\unchecked` interpretive status via P5.12's
`tau_chiral_conformal_weight`.

============================================================================
2-way C-gate (Lean ↔ summary.tex Lemma `lem:fib-beta` + Example
`ex:fib-RG` + Corollary `cor:nomix`)
============================================================================

`MIGRATION_PLAN.md:225` prescribes `M, D` for P5.14 — no C-gate. The
2-way C-gate executed here is voluntary extra cross-checking per the
established Phase-5 canonical pattern (P5.7–P5.13 all executed
voluntary 2-way C-gates).

**`summary.tex` named claims this file matches.** Three:

1. **Lemma `lem:fib-beta`** (`summary.tex:1888-1897`) — the
   Fibonacci-`(G_2)_1` binary blocking coefficients (verbatim):

   > With `h_one = 0`, `h_tau = 2/5`, the binary blocking coefficients
   > are:
   > `beta^{one}_{one,one} = u_0`,
   > `beta^{one}_{tau,tau} = u_I rho^(-4/5)`,
   > `beta^{tau}_{tau,one} = j_L`,
   > `beta^{tau}_{one,tau} = j_R`,
   > `beta^{tau}_{tau,tau} = u_tau rho^(-2/5)`.

   Lean correspondence: `def fibRGVacuumBeta (u0 uI : ℂ)
   (vacScale : ℝ) : FibRGVacuumChannel → ℂ` (body line 39) +
   `def fibRGTauBeta (jL jR uTau : ℂ) (tauScale : ℝ) :
   FibRGTauChannel → ℂ` (body line 43). MATCH (algebraic) with the
   following abstractions:
   * `u_0, u_I, j_L, j_R, u_tau : ℂ` are free complex parameters
     (Lean matches `summary.tex` exactly).
   * `vacScale : ℝ` and `tauScale : ℝ` are free real parameters
     embedded into the complex outputs via `(vacScale : ℂ)` and
     `(tauScale : ℂ)`; with the instantiation
     `vacScale := rho^(-4/5)` and `tauScale := rho^(-2/5)` the Lean
     defs MATCH the displayed values
     `beta^{one}_{tau,tau} = u_I rho^(-4/5)` and
     `beta^{tau}_{tau,tau} = u_tau rho^(-2/5)`. The specific value
     identifications `vacScale := rho^(-4/5)` and `tauScale :=
     rho^(-2/5)` carry the `(G_2)_1` `\unchecked` interpretive load
     per the block above.

2. **Corollary `cor:nomix`** (`summary.tex:1930-1936`) — the
   no-mixing scalar amplitude formula (verbatim):

   > If the coarse label `mu` does not mix with any other coarse
   > label under `B`, then the canonical isometric fine-graining
   > amplitude is `A^{nu}{}_{mu} = overline(beta^{mu}_{nu}) /
   > sqrt(sum_{nu'} |beta^{mu}_{nu'}|^2)`.

   Lean correspondence: the per-channel evaluations
   `theorem fibRGVacuumAmplitude_oneOne` / `_tauTau` (body lines 108,
   117) and `theorem fibRGTauAmplitude_tauOne` / `_oneTau` /
   `_tauTau` (body lines 127, 137, 147) MATCH the corollary's closed
   form `star(beta_nu) / sqrt(sum_nu' |beta_nu'|^2)` evaluated on each
   fine channel of each row. The abstract corollary is provided by
   `LinearAlgebra.NoMixingAmplitude` (P4.10) — those five theorems
   evaluate it Fibonacci-specifically. The per-row normalisation
   theorems `fibRGVacuumAmplitude_normalised` (body line 183) and
   `fibRGTauAmplitude_normalised` (body line 194) MATCH the
   no-mixing-corollary specialisation of `summary.tex` Thm
   `thm:polar`'s `E^† E = id_{coarse}` to the scalar single-coarse-
   label case, applied per Fibonacci row.

3. **Example `ex:fib-RG`** (`summary.tex:1944-1954`) — the
   Fibonacci-`(G_2)_1` RG-decorated splitting (verbatim, abridged for
   ASCII transcription):

   > Applying Corollary `cor:nomix` to Lemma `lem:fib-beta`:
   > `eta_one^RG(rho) = (bar u_0 v^{one}_{one,one} + bar u_I rho^(-4/5)
   > v^{one}_{tau,tau}) / sqrt(|u_0|^2 + |u_I|^2 rho^(-8/5))`,
   > `eta_tau^RG(rho) = (bar j_L v^{tau}_{tau,one} + bar j_R
   > v^{tau}_{one,tau} + bar u_tau rho^(-2/5) v^{tau}_{tau,tau}) /
   > sqrt(|j_L|^2 + |j_R|^2 + |u_tau|^2 rho^(-4/5))`.

   Lean correspondence: per-channel amplitude theorems above
   (`fibRGVacuumAmplitude_oneOne` / `_tauTau`,
   `fibRGTauAmplitude_tauOne` / `_oneTau` / `_tauTau`) PLUS denominator
   theorems `fibRGVacuumDenominator` (body line 49) +
   `fibRGTauDenominator` (body line 58). MATCH (algebraic) with the
   following:
   * Numerator entries match per-channel after the instantiation
     `vacScale := rho^(-4/5)`, `tauScale := rho^(-2/5)`.
   * Denominator entries match after the instantiation: the
     vacuum-row denominator `|u_0|^2 + |u_I|^2 vacScale^2` becomes
     `|u_0|^2 + |u_I|^2 rho^(-8/5)` (`vacScale^2 = (rho^(-4/5))^2 =
     rho^(-8/5)`), matching the example display; the tau-row
     denominator `|j_L|^2 + |j_R|^2 + |u_tau|^2 tauScale^2` becomes
     `|j_L|^2 + |j_R|^2 + |u_tau|^2 rho^(-4/5)` (`tauScale^2 =
     (rho^(-2/5))^2 = rho^(-4/5)`), matching the example display.
   * Outer assembly of the canonical-section amplitude `eta_mu^RG(rho)
     = sum_nu A_nu v^{mu}_nu` from per-channel `A_nu = star(beta_nu)
     / sqrt(denominator)` is OUTSIDE this file's scope — this file
     supplies the per-channel `A_nu` and per-row denominators that
     the example then assembles into the basis-vector sum
     `sum_nu A_nu v^{mu}_nu`. The basis-vector / `v^{mu}_nu` /
     fusion-tree assembly is the JOB of
     `Foundations/ProjectDefinitions.lean` (P5.6) +
     `Fibonacci/FusionRules.lean` (P5.9) +
     `Fibonacci/Binary.lean` (P5.10); this file performs only the
     SCALAR amplitude + denominator computation underneath that
     assembly.

C-gate result: CLEARED for the three named `summary.tex` items above
(Lemma `lem:fib-beta`, Corollary `cor:nomix` per-row specialisation,
Example `ex:fib-RG`) at the algebraic level — Lean theorems MATCH the
displayed formulas under the documented `vacScale := rho^(-4/5)` and
`tauScale := rho^(-2/5)` instantiations. The specific value
identifications `vacScale := rho^(-4/5)` and `tauScale := rho^(-2/5)`
carry the `(G_2)_1` `\unchecked` interpretive load via P5.12; the Lean
theorems themselves are unconditional algebraic identities on free real
scale-factor parameters. The C-gate is 2-way Lean ↔ summary.tex.

The Wolfram leg is deferred to Phase 6
(`scripts/wolfram/fibonacci_rg_no_mixing.wls`), tracked as a bd
follow-up filed in this commit; the Wolfram script should symbolically
verify (a) the per-row denominator forms `|u_0|^2 + |u_I|^2
rho^(-8/5)` and `|j_L|^2 + |j_R|^2 + |u_tau|^2 rho^(-4/5)` at
`vacScale := rho^(-4/5)`, `tauScale := rho^(-2/5)`, (b) the per-
channel amplitudes `A_nu = star(beta_nu) / sqrt(denominator)` for all
five fine channels, (c) the per-row normalisation
`sum_nu |A_nu|^2 = 1` symbolically, (d) the Born-rule identification
`|A_{tau,tau}|^2 = fibRGTauTauProbability` on the tau-tau channel.

============================================================================
End of P5.14 docstring extension.
============================================================================
-/

namespace CFTAnyons
namespace Fibonacci

noncomputable section

open BigOperators
open scoped ComplexConjugate

abbrev FibRGVacuumChannel := Fin 2

namespace FibRGVacuumChannel

abbrev oneOne : FibRGVacuumChannel := 0
abbrev tauTau : FibRGVacuumChannel := 1

end FibRGVacuumChannel

abbrev FibRGTauChannel := Fin 3

namespace FibRGTauChannel

abbrev tauOne : FibRGTauChannel := 0
abbrev oneTau : FibRGTauChannel := 1
abbrev tauTau : FibRGTauChannel := 2

end FibRGTauChannel

def fibRGVacuumBeta (u0 uI : ℂ) (vacScale : ℝ) :
    FibRGVacuumChannel → ℂ := fun i =>
  if i = FibRGVacuumChannel.oneOne then u0 else uI * (vacScale : ℂ)

def fibRGTauBeta (jL jR uTau : ℂ) (tauScale : ℝ) :
    FibRGTauChannel → ℂ := fun i =>
  if i = FibRGTauChannel.tauOne then jL
  else if i = FibRGTauChannel.oneTau then jR
  else uTau * (tauScale : ℂ)

theorem fibRGVacuumDenominator
    (u0 uI : ℂ) (vacScale : ℝ) :
    LinearAlgebra.NoMixingDenominator (fibRGVacuumBeta u0 uI vacScale) =
      Complex.normSq u0 + Complex.normSq uI * vacScale ^ 2 := by
  rw [LinearAlgebra.NoMixingDenominator]
  rw [Fin.sum_univ_two]
  simp [fibRGVacuumBeta, FibRGVacuumChannel.oneOne,
    Complex.normSq_mul, Complex.normSq_ofReal, pow_two]

theorem fibRGTauDenominator
    (jL jR uTau : ℂ) (tauScale : ℝ) :
    LinearAlgebra.NoMixingDenominator (fibRGTauBeta jL jR uTau tauScale) =
      Complex.normSq jL + Complex.normSq jR + Complex.normSq uTau * tauScale ^ 2 := by
  rw [LinearAlgebra.NoMixingDenominator]
  rw [Fin.sum_univ_three]
  simp [fibRGTauBeta, FibRGTauChannel.tauOne, FibRGTauChannel.oneTau,
    Complex.normSq_mul, Complex.normSq_ofReal, pow_two]

def fibRGTauProbabilityDenominator
    (jL jR uTau : ℂ) (tauScale : ℝ) : ℝ :=
  Complex.normSq jL + Complex.normSq jR + Complex.normSq uTau * tauScale ^ 2

def fibRGTauTauProbability
    (jL jR uTau : ℂ) (tauScale : ℝ) : ℝ :=
  Complex.normSq uTau * tauScale ^ 2 /
    fibRGTauProbabilityDenominator jL jR uTau tauScale

theorem fibRGTauProbabilityDenominator_eq
    (jL jR uTau : ℂ) (tauScale : ℝ) :
    fibRGTauProbabilityDenominator jL jR uTau tauScale =
      LinearAlgebra.NoMixingDenominator
        (fibRGTauBeta jL jR uTau tauScale) := by
  rw [fibRGTauDenominator]
  rfl

theorem fibRGTauProbabilityDenominator_nonneg
    (jL jR uTau : ℂ) (tauScale : ℝ) :
    0 ≤ fibRGTauProbabilityDenominator jL jR uTau tauScale := by
  unfold fibRGTauProbabilityDenominator
  nlinarith [Complex.normSq_nonneg jL, Complex.normSq_nonneg jR,
    Complex.normSq_nonneg uTau, sq_nonneg tauScale]

theorem fibRGTauTauProbability_nonneg
    (jL jR uTau : ℂ) (tauScale : ℝ) :
    0 ≤ fibRGTauTauProbability jL jR uTau tauScale := by
  unfold fibRGTauTauProbability
  exact div_nonneg
    (mul_nonneg (Complex.normSq_nonneg uTau) (sq_nonneg tauScale))
    (fibRGTauProbabilityDenominator_nonneg jL jR uTau tauScale)

theorem fibRGTauTauProbability_le_one_of_denominator_pos
    (jL jR uTau : ℂ) (tauScale : ℝ)
    (hden : 0 < fibRGTauProbabilityDenominator jL jR uTau tauScale) :
    fibRGTauTauProbability jL jR uTau tauScale ≤ 1 := by
  unfold fibRGTauTauProbability
  rw [div_le_iff₀ hden]
  unfold fibRGTauProbabilityDenominator
  nlinarith [Complex.normSq_nonneg jL, Complex.normSq_nonneg jR]

theorem fibRGVacuumAmplitude_oneOne
    (u0 uI : ℂ) (vacScale : ℝ) :
    LinearAlgebra.NoMixingAmplitude
        (fibRGVacuumBeta u0 uI vacScale) FibRGVacuumChannel.oneOne =
      star u0 /
        (Real.sqrt (Complex.normSq u0 + Complex.normSq uI * vacScale ^ 2) : ℂ) := by
  simp [LinearAlgebra.NoMixingAmplitude, fibRGVacuumDenominator,
    fibRGVacuumBeta]

theorem fibRGVacuumAmplitude_tauTau
    (u0 uI : ℂ) (vacScale : ℝ) :
    LinearAlgebra.NoMixingAmplitude
        (fibRGVacuumBeta u0 uI vacScale) FibRGVacuumChannel.tauTau =
      star uI * (vacScale : ℂ) /
        (Real.sqrt (Complex.normSq u0 + Complex.normSq uI * vacScale ^ 2) : ℂ) := by
  simp [LinearAlgebra.NoMixingAmplitude, fibRGVacuumDenominator,
    fibRGVacuumBeta, FibRGVacuumChannel.oneOne, div_eq_mul_inv, mul_comm,
    mul_assoc]

theorem fibRGTauAmplitude_tauOne
    (jL jR uTau : ℂ) (tauScale : ℝ) :
    LinearAlgebra.NoMixingAmplitude
        (fibRGTauBeta jL jR uTau tauScale) FibRGTauChannel.tauOne =
      star jL /
        (Real.sqrt
          (Complex.normSq jL + Complex.normSq jR +
            Complex.normSq uTau * tauScale ^ 2) : ℂ) := by
  simp [LinearAlgebra.NoMixingAmplitude, fibRGTauDenominator, fibRGTauBeta]

theorem fibRGTauAmplitude_oneTau
    (jL jR uTau : ℂ) (tauScale : ℝ) :
    LinearAlgebra.NoMixingAmplitude
        (fibRGTauBeta jL jR uTau tauScale) FibRGTauChannel.oneTau =
      star jR /
        (Real.sqrt
          (Complex.normSq jL + Complex.normSq jR +
            Complex.normSq uTau * tauScale ^ 2) : ℂ) := by
  simp [LinearAlgebra.NoMixingAmplitude, fibRGTauDenominator, fibRGTauBeta]

theorem fibRGTauAmplitude_tauTau
    (jL jR uTau : ℂ) (tauScale : ℝ) :
    LinearAlgebra.NoMixingAmplitude
        (fibRGTauBeta jL jR uTau tauScale) FibRGTauChannel.tauTau =
      star uTau * (tauScale : ℂ) /
        (Real.sqrt
          (Complex.normSq jL + Complex.normSq jR +
            Complex.normSq uTau * tauScale ^ 2) : ℂ) := by
  simp [LinearAlgebra.NoMixingAmplitude, fibRGTauDenominator, fibRGTauBeta,
    FibRGTauChannel.tauOne, FibRGTauChannel.oneTau, FibRGTauChannel.tauTau,
    div_eq_mul_inv, mul_comm, mul_assoc]

theorem fibRGTauTauProbability_eq_amplitude_normSq
    (jL jR uTau : ℂ) (tauScale : ℝ) :
    Complex.normSq (LinearAlgebra.NoMixingAmplitude
        (fibRGTauBeta jL jR uTau tauScale) FibRGTauChannel.tauTau) =
      fibRGTauTauProbability jL jR uTau tauScale := by
  rw [fibRGTauAmplitude_tauTau]
  unfold fibRGTauTauProbability fibRGTauProbabilityDenominator
  have hden_nonneg :
      0 ≤ Complex.normSq jL + Complex.normSq jR +
          Complex.normSq uTau * tauScale ^ 2 := by
    nlinarith [Complex.normSq_nonneg jL, Complex.normSq_nonneg jR,
      Complex.normSq_nonneg uTau, sq_nonneg tauScale]
  have hsqrt_mul :
      Real.sqrt (Complex.normSq jL + Complex.normSq jR +
          Complex.normSq uTau * tauScale ^ 2) *
        Real.sqrt (Complex.normSq jL + Complex.normSq jR +
          Complex.normSq uTau * tauScale ^ 2) =
        Complex.normSq jL + Complex.normSq jR +
          Complex.normSq uTau * tauScale ^ 2 := by
    simpa [pow_two] using Real.sq_sqrt hden_nonneg
  rw [Complex.normSq_div, Complex.normSq_mul, Complex.normSq_ofReal,
    Complex.normSq_ofReal, hsqrt_mul]
  simp [pow_two]

theorem fibRGVacuumAmplitude_normalised
    (u0 uI : ℂ) (vacScale : ℝ)
    (hβ : LinearAlgebra.NoMixingDenominator
        (fibRGVacuumBeta u0 uI vacScale) ≠ 0) :
    ∑ i, star (LinearAlgebra.NoMixingAmplitude
        (fibRGVacuumBeta u0 uI vacScale) i) *
        LinearAlgebra.NoMixingAmplitude (fibRGVacuumBeta u0 uI vacScale) i =
      1 := by
  exact LinearAlgebra.noMixingAmplitude_normalised
    (fibRGVacuumBeta u0 uI vacScale) hβ

theorem fibRGTauAmplitude_normalised
    (jL jR uTau : ℂ) (tauScale : ℝ)
    (hβ : LinearAlgebra.NoMixingDenominator
        (fibRGTauBeta jL jR uTau tauScale) ≠ 0) :
    ∑ i, star (LinearAlgebra.NoMixingAmplitude
        (fibRGTauBeta jL jR uTau tauScale) i) *
        LinearAlgebra.NoMixingAmplitude (fibRGTauBeta jL jR uTau tauScale) i =
      1 := by
  exact LinearAlgebra.noMixingAmplitude_normalised
    (fibRGTauBeta jL jR uTau tauScale) hβ

end

end Fibonacci
end CFTAnyons
