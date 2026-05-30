import Mathlib
import Formalisation.Fibonacci.Basic
import Formalisation.Fibonacci.FusionRules

/-!
Coordinate-level binary Fibonacci fine-graining maps.

This file formalises the finite matrix calculation behind the
Perron-Frobenius (PF) binary refinement isometry `η : Q → A ⊗ A` for
the Fibonacci fusion category, after choosing the orthogonal fusion-tree
basis:

* domain basis: coarse charges `1`, `τ`, represented by `Fin 2`;
* codomain basis: the allowed binary channels
  `1 → 1 1`, `1 → τ τ`, `τ → τ 1`, `τ → 1 τ`, `τ → τ τ`,
  represented by `Fin 5`.

Source provenance:
* `references/text/FibonacciAnyonModels.txt:211-219` (Rowell, "A Short
  Introduction to Fibonacci Anyon Models") — Perron–Frobenius
  characterisation of the quantum dimension `d_τ = φ` and the
  total quantum order `D² = ∑_i d_i²`. The PF amplitudes
  `A^a_{bc} = sqrt(d_b d_c / (d_a D²))` derive from this; for
  Fibonacci they reproduce the five entries `(1/D, φ/D, 1/D, 1/D,
  sqrt(φ)/D)` used in this file.
* `summary.tex:1114` (`def:PF`, "PF amplitudes") — the canonical
  abstract definition with the five Fibonacci specialisations listed
  verbatim (`x_PF = 1/D`, `y_PF = φ/D`, `p_PF = 1/D`, `q_PF = 1/D`,
  `r_PF = sqrt(φ)/D`). Verbatim listed below as the 2-way C-gate target.
* `summary.tex:1127` (`lem:PF-isom`, "PF is isometric") — the canonical
  `η^†η = id_Q` claim for the PF amplitudes; proof at
  `summary.tex:1131-1145` expands the squared-amplitude row sums
  identical to those discharged here by `pf_vacuum_normalisation` /
  `pf_tau_normalisation` (P5.7) and their `_sqrt_normalisation`
  refinements below.
* `summary.tex:1548` (`lem:binary-Z`, "Binary refinement, I = J ∪ K") —
  cell-length-parametrised binary refinement formulas that pair the
  PF schema `m^c_{ab} / sqrt(Z_c)` (cf. `summary.tex:1488`,
  `def:rchild`) with the cell partition functions `Z_one`/`Z_tau` of
  `def:Zfunc`. The PF (cell-length-degenerate) limit of `lem:binary-Z`
  collapses to the PF amplitudes of `def:PF` realised here;
  see the "Historical ERRATA cross-reference" paragraph below.
* `ERRATA.md:28-143` ("2026-05-16: lem:binary-Z squared-amplitudes
  (probabilities) → amplitudes (with √)") — formal audit-trail of the
  historical squared-amplitudes-vs-amplitudes bug in `lem:binary-Z`
  (the related but separate cell-length-parametrised lemma at
  `summary.tex:1548`). The PF schema landed in CAD (and ported here)
  encodes the AMPLITUDE form already; see the "Historical ERRATA
  cross-reference" paragraph below for the explicit audit that the
  bug pattern is AVOIDED in this file.

Port provenance: ported from
`cft-anyons-deprecated/Formalisation/Fibonacci/Binary.lean` (source
SHA256 `1663a7565b32f1f226257cf34ced4b14edc14e4f4a741c59f3979a70d387eba2`,
169 LOC) at MIGRATION_PLAN.md:221 (P5.10). The body (from `namespace
CFTAnyons` to EOF) is byte-identical to the CAD source body from its
`namespace CFTAnyons` onwards. The CAD source's docstring reference to
"`MASTER_PROVENANCE.md`" (a CAD-internal artifact NOT present in
cft-anyons) is replaced here with the cft-anyons-canonical citations
`references/text/FibonacciAnyonModels.txt:211-219` + `summary.tex:1114`
(`def:PF`) + `summary.tex:1127` (`lem:PF-isom`) + `summary.tex:1548`
(`lem:binary-Z`) + `ERRATA.md:28-143` for the historical fix.

Cross-references to GLOSSARY.md
================================

-- GLOSSARY: def:PF (GLOSSARY.md:1061) — Perron-Frobenius amplitudes
   `A^a_{bc} = sqrt(d_b d_c / (d_a D²))`. The canonical statement at
   `summary.tex:1114-1125` defines the abstract `A^a_{bc}` and lists
   the five Fibonacci specialisations `x_PF = 1/D`, `y_PF = φ/D`,
   `p_PF = 1/D`, `q_PF = 1/D`, `r_PF = sqrt(φ)/D`. This file is the
   GLOSSARY-pre-registered canonical CAD anchor for `def:PF` —
   verbatim per the Translation map CAD section at GLOSSARY.md:1089:

     "CAD: `Fibonacci/Binary.lean::PFBinaryEta` (Phase 5 P5.10) — the
     PF binary refinement amplitudes (and the PF isometry lemma
     `η†η = id_Q`). Per `stocktake/reports/cad-lean.md` §5 line 349."

   Per-promise correspondence (every load-bearing claim of the
   pre-binding mapped to a specific named decl realising it):

   * "the PF binary refinement amplitudes" → five named real-valued
     amplitude theorems together with the `PFBinaryEta` instance:
       - `theorem pfAmplitude_one_one_one`
         (body line 89): `A^{1}_{1,1} = 1/sqrt(D²) = 1/D`. Computes
         the outer-sqrt amplitude `sqrt(d_1 d_1 / (d_1 D²))`
         simplified to `1/sqrt(D²)`. This realises `x_PF` of `def:PF`.
       - `theorem pfAmplitude_one_tau_tau`
         (body line 97): `A^{1}_{τ,τ} = φ/sqrt(D²) = φ/D`. Computes
         the outer-sqrt amplitude `sqrt(d_τ d_τ / (d_1 D²)) =
         sqrt(φ²/D²) = φ/sqrt(D²)` (where the outer sqrt collapses
         because `φ > 0` (hence `φ ≥ 0`) gives `sqrt(φ²) = φ`).
         This realises `y_PF` of `def:PF`.
       - `theorem pfAmplitude_tau_tau_one`
         (body line 105): `A^{τ}_{τ,1} = 1/sqrt(D²) = 1/D`.
         Realises `p_PF`.
       - `theorem pfAmplitude_tau_one_tau`
         (body line 114): `A^{τ}_{1,τ} = 1/sqrt(D²) = 1/D`.
         Realises `q_PF`.
       - `theorem pfAmplitude_tau_tau_tau`
         (body line 123): `A^{τ}_{τ,τ} = sqrt(φ)/sqrt(D²) = sqrt(φ)/D`.
         Computes the outer-sqrt amplitude `sqrt(d_τ d_τ / (d_τ D²))
         = sqrt(φ/D²)`. Realises `r_PF`.
       - `def PFBinaryEta` (body line 131): the assembled
         `5×2` matrix `Matrix BinaryChannel FibCharge ℂ` whose five
         non-zero entries are the five PF amplitudes (cast `ℝ → ℂ`).
         This is the load-bearing GLOSSARY-named anchor `PFBinaryEta`.
       - `def PFBinaryEtaFromDimensions` (body line 147) and
         `theorem PFBinaryEtaFromDimensions_eq_PFBinaryEta` (body
         line 154): an alternative construction built directly from
         `pfAmplitude` (rather than from the per-channel constants),
         together with the consistency theorem proving the two
         constructions agree. Witnesses that the five amplitude
         theorems and the matrix entries of `PFBinaryEta` are
         interlocked.

   * "PF isometry lemma `η†η = id_Q`" → `theorem PFBinaryEta_isometry`
     (body line 138): `PFBinaryEta.conjTranspose * PFBinaryEta = 1`,
     i.e. `η^†η = id_Q`. Realises `lem:PF-isom` (`summary.tex:1127`)
     for the binary `r = 2` case. Proof: reduces via
     `BinaryEta_isometry_of_norms` to the two squared-modulus row
     sums discharged by `pf_vacuum_sqrt_normalisation` /
     `pf_tau_sqrt_normalisation`. A second instance
     `PFBinaryEtaFromDimensions_isometry` (body line 161) lifts the
     same isometry to the `PFBinaryEtaFromDimensions` construction by
     rewriting through `PFBinaryEtaFromDimensions_eq_PFBinaryEta`.

   Explicit disavowals (supporting infrastructure that this file
   provides but that is NOT a `def:PF` realisation; per the
   P5.7/P5.8/P5.9 reviewer lesson against over-claiming GLOSSARY
   slugs):

   * `abbrev FibCharge := Fin 2` (body line 28): the coarse-charge
     domain carrier `Q ≅ 1 ⊕ τ` as a 2-dimensional indexed type. This
     is the orthogonal-fusion-tree coordinate basis of the `def:Q`
     object — NOT a `def:PF` realisation. See "Vacuum-index
     disambiguation" below.
   * `abbrev BinaryChannel := Fin 5` (body line 30): the codomain
     carrier for the five allowed `c → a b` channels with `N^c_{a,b}
     = 1`. The labelling order `(1→11, 1→ττ, τ→τ1, τ→1τ, τ→ττ)` is
     fixed in the docstring and matches the five amplitude tuples
     `(x, y, p, q, r)` of `summary.tex:1102-1103` and `def:PF`'s five
     specialisations. NOT a `def:PF` realisation per se — supporting
     infrastructure.
   * `def BinaryEta (x y p q r : ℂ)` (body line 32): the generic
     5-parameter Eta matrix `Matrix BinaryChannel FibCharge ℂ` with
     unspecified amplitude tuple `(x, y, p, q, r)`. This is the
     gauge-agnostic skeleton — `PFBinaryEta` is the PF-specific
     specialisation `(1/sqrt D², φ/sqrt D², 1/sqrt D², 1/sqrt D²,
     sqrt(φ)/sqrt D²)`. NOT a `def:PF` realisation per se —
     supporting infrastructure for the named anchor `PFBinaryEta`.
   * `theorem BinaryEta_isometry_iff` (body line 35) and
     `theorem BinaryEta_isometry_of_norms` (body line 54): the
     generic isometry characterisation for `BinaryEta`,
     `(BinaryEta x y p q r)^† * BinaryEta x y p q r = 1 ↔
       (|x|² + |y|² = 1) ∧ (|p|² + |q|² + |r|² = 1)`. This is the
     pair of squared-modulus row-sum constraints from
     `summary.tex:1108`. The `_iff` form is the bi-implication;
     `_of_norms` is the easy direction used by `PFBinaryEta_isometry`.
     NOT a `def:PF` realisation per se — generic gauge-agnostic
     infrastructure (the squared-modulus form ITSELF prevents the
     squared-amplitudes-vs-amplitudes confusion: an amplitude `a`
     contributes `|a|² = star a * a` to the sum, so substituting
     squared amplitudes where amplitudes are expected would fail the
     sum-to-one test loudly).
   * `theorem pf_vacuum_sqrt_normalisation` (body line 61) and
     `theorem pf_tau_sqrt_normalisation` (body line 71): the
     PF-specific squared-modulus row sums for the two domain charges,
     unfolded once through `Real.sqrt`. These reduce to the
     `pf_vacuum_normalisation` / `pf_tau_normalisation` theorems of
     `Formalisation/Fibonacci/Basic.lean` (P5.7) which are
     PF-eigenvector squared-norm identities `1/D² + φ²/D² = 1` and
     `1/D² + 1/D² + φ/D² = 1`. NOT a `def:PF` realisation per se —
     they are the PER-CHANNEL sqrt-substituted lemmas that
     `PFBinaryEta_isometry` consumes via `BinaryEta_isometry_of_norms`.
   * `def pfAmplitude (a b c : FibLabel) : ℝ` (body line 86): the
     general schematic amplitude formula
     `sqrt(fibDim b * fibDim c / (fibDim a * Dsq))`, with `fibDim`
     from P5.9 and `Dsq` from P5.7. This is the generic schematic
     formula; the five named `pfAmplitude_*` theorems EVALUATE it at
     the five `(a, b, c)` triples allowed by Fibonacci fusion. The
     `def` itself is the schematic SUPPORTING infrastructure — only
     the five evaluation theorems are `def:PF`-promise realisations.
   * `def PFBinaryEtaFromDimensions` (body line 147) and theorems
     `PFBinaryEtaFromDimensions_eq_PFBinaryEta` (body line 154) +
     `PFBinaryEtaFromDimensions_isometry` (body line 161): explicit
     disavowals — these are the alternative-construction
     consistency-and-isometry pair. The CONSISTENCY of the two
     constructions (the matrix entries via per-channel real constants
     vs. via the schematic `pfAmplitude` formula evaluated at the
     five PF triples) is a cross-validation, not an additional
     `def:PF` realisation: `PFBinaryEta` IS the `def:PF` anchor;
     `PFBinaryEtaFromDimensions` is a corroborating restatement.

   Vacuum-index disambiguation (CONVENTIONS.md (a) at CONVENTIONS.md:69):

   The `abbrev FibCharge := Fin 2` is internally 0-indexed: the
   `Fin 2` element `(0 : Fin 2)` and `(1 : Fin 2)`. The semantic
   pairing with the GLOSSARY-canonical `FibLabel` of P5.9
   (`inductive FibLabel where | one | tau`, where `FibLabel.one` is
   the categorical vacuum per CONVENTIONS.md (a)) is the natural
   first-constructor-first ordering: `(0 : FibCharge) ↦ FibLabel.one`
   (vacuum) and `(1 : FibCharge) ↦ FibLabel.tau`. Per
   CONVENTIONS.md:74 ("vacuum is at index 1, 1-indexed, with `X_1 =
   1_C`") this matches the 1-indexed SEMANTIC convention "vacuum =
   first entry". The `BinaryChannel := Fin 5` labelling
   `(0, 1, 2, 3, 4) ↦ (1→11, 1→ττ, τ→τ1, τ→1τ, τ→ττ)` is
   declared in the file docstring and consistently consumed by
   `pfAmplitude_*`, `PFBinaryEta`, and `PFBinaryEtaFromDimensions`.
   This file does NOT regress on the historical STL-1 bug
   (CLAUDE.md hallucination-risk callout #1): the (a) convention is
   internalised consistently throughout.

   Dependency cross-references:

   * `def:fib-mult` (GLOSSARY.md:1132) — the Fibonacci multiplication
     amplitudes `m^{1}_{ττ} = sqrt(φ)`, `m^{τ}_{ττ} = φ^{-1/2}`. The
     PF amplitudes `A^a_{bc}` of this file are NOT identically the
     multiplication amplitudes `m^c_{ab}` (they live in different
     normalisations: the PF schema includes the
     quantum-dimension-weighted `sqrt(d_b d_c / (d_a D²))` factor,
     while `m^c_{ab}` are the bare algebra structure constants), but
     the two are consistent: in the cell-length-degenerate
     (`Z_c ≡ 1`) limit of `lem:binary-Z`'s general formula
     `m^c_{ab} sqrt(Z_b Z_c / Z_a)` the PF amplitudes appear as the
     `sqrt(d)`-weighted PF-eigenvector restatement. The two
     `tau-tau-tau` entries are the key cross-check:
     `m^{τ}_{ττ} = φ^{-1/2}` (`def:fib-mult`) and
     `r_PF = A^{τ}_{ττ} = sqrt(φ)/D` (`def:PF`) — both contain a
     `sqrt` of a φ-power, i.e. AMPLITUDES (not squared
     probabilities). See the "Historical ERRATA cross-reference"
     paragraph below.
   * `def:phi` (GLOSSARY.md:997) — golden ratio
     `φ := (1 + sqrt 5)/2`. Consumed throughout via P5.7's
     `Formalisation/Fibonacci/Basic.lean::φ`, `phi_pos`,
     `phi_ne_zero`, `phi_sq`, and the squared-normalisation
     identities `pf_vacuum_normalisation` /
     `pf_tau_normalisation`. Already FULLY discharged at P5.7.
   * `def:fib` (GLOSSARY.md:961) — Fibonacci fusion category.
     Consumed via P5.9's `inductive FibLabel where | one | tau` and
     `def fibDim : FibLabel → ℝ`. Already FULLY discharged at P5.9.
   * `def:qdim` (GLOSSARY.md:391) — quantum dimension `d_a` /
     total quantum order `D² = ∑ d_a²`. Consumed via P5.7's
     `Dsq := 1 + φ²` and `Dsq_pos` and P5.9's `fibDim`. The
     `pfAmplitude` schema `sqrt(d_b d_c / (d_a D²))` is verbatim the
     `A^a_{bc}` formula of `def:PF`.

   Documentation cross-references (NOT D-gate pre-bindings):

   * CONVENTIONS.md (a) vacuum-index at CONVENTIONS.md:69 — see
     "Vacuum-index disambiguation" paragraph above.
   * CONVENTIONS.md (b) F-matrix gauge at CONVENTIONS.md (the
     involutory-vs-unitary gauge translation rule) — NOT exercised
     in this file. The PF amplitudes `A^a_{bc}` are gauge-INVARIANT
     (they depend only on quantum dimensions, not on F-symbol
     entries), so the F-matrix gauge question does not arise here.

2-way C-gate (Lean ↔ summary.tex def:PF at summary.tex:1114 +
              lem:PF-isom at summary.tex:1127)
============================================================

MIGRATION_PLAN.md:221 prescribes `M, D, C` for P5.10 without naming a
specific Wolfram script. Per the established P5.7 + P5.8 + P5.9
canonical pattern (3-way for Fibonacci content; Wolfram leg deferred
to Phase 6), the 2-way C-gate (Lean ↔ summary.tex) is executed here in
full. The Wolfram leg is tracked as a Phase-6 bd follow-up filed in
this commit.

`def:PF` at `summary.tex:1114-1125` (verbatim transcription of the
five Fibonacci specialisations):

  x_PF = A^{one}_{one,one}   = 1/D,                 (sub-claim x)
  y_PF = A^{one}_{tau,tau}   = phi/D,               (sub-claim y)
  p_PF = A^{tau}_{tau,one}   = 1/D,                 (sub-claim p)
  q_PF = A^{tau}_{one,tau}   = 1/D,                 (sub-claim q)
  r_PF = A^{tau}_{tau,tau}   = sqrt(phi)/D.         (sub-claim r)

Per-sub-claim Lean correspondence (recalling D = sqrt(D²) and the CAD
choice `Dsq := 1 + φ²` of P5.7 so `Dsq = D²`):

* Sub-claim x: `theorem pfAmplitude_one_one_one`:
  `pfAmplitude FibLabel.one FibLabel.one FibLabel.one
    = (1 : ℝ) / Real.sqrt Dsq`.
  MATCH: the schema `sqrt(d_b d_c / (d_a D²))` at `(b,c,a) =
  (one,one,one)` is `sqrt(1·1/(1·D²)) = 1/sqrt(D²) = 1/D`. No drift.

* Sub-claim y: `theorem pfAmplitude_one_tau_tau`:
  `pfAmplitude FibLabel.one FibLabel.tau FibLabel.tau
    = φ / Real.sqrt Dsq`.
  MATCH: the schema at `(b,c,a) = (tau,tau,one)` is
  `sqrt(φ·φ/(1·D²)) = sqrt(φ²/D²) = sqrt(φ²)/sqrt(D²) = φ/sqrt(D²) =
  φ/D`. The outer `Real.sqrt` of the schema collapses to multiply by
  `φ` (not `sqrt φ`) BECAUSE `φ² = (sqrt φ)⁴` and the outer sqrt
  takes the square root once. This IS the AMPLITUDE form, not the
  squared-amplitude form. The outer sqrt is present in the
  `pfAmplitude` definition (`Real.sqrt (fibDim b * fibDim c /
  (fibDim a * Dsq))`); the RHS `φ / sqrt Dsq` is its SIMPLIFIED value
  after `sqrt(φ²) = φ`. No drift.

* Sub-claim p: `theorem pfAmplitude_tau_tau_one`:
  `pfAmplitude FibLabel.tau FibLabel.tau FibLabel.one
    = (1 : ℝ) / Real.sqrt Dsq`.
  MATCH: schema at `(b,c,a) = (tau,one,tau)` is
  `sqrt(φ·1/(φ·D²)) = sqrt(1/D²) = 1/sqrt(D²) = 1/D`. No drift.

* Sub-claim q: `theorem pfAmplitude_tau_one_tau`:
  `pfAmplitude FibLabel.tau FibLabel.one FibLabel.tau
    = (1 : ℝ) / Real.sqrt Dsq`.
  MATCH: schema at `(b,c,a) = (one,tau,tau)` is
  `sqrt(1·φ/(φ·D²)) = sqrt(1/D²) = 1/sqrt(D²) = 1/D`. No drift.

* Sub-claim r: `theorem pfAmplitude_tau_tau_tau`:
  `pfAmplitude FibLabel.tau FibLabel.tau FibLabel.tau
    = Real.sqrt φ / Real.sqrt Dsq`.
  MATCH: schema at `(b,c,a) = (tau,tau,tau)` is
  `sqrt(φ·φ/(φ·D²)) = sqrt(φ/D²) = sqrt(φ)/sqrt(D²) = sqrt(φ)/D`.
  The RHS contains `Real.sqrt φ` (not raw `φ`) BECAUSE the outer
  sqrt of `φ/D²` does NOT collapse: `sqrt(φ)` is the AMPLITUDE
  value, `φ` would be the squared-amplitude (probability) value.
  This IS the AMPLITUDE form. No drift.

`lem:PF-isom` at `summary.tex:1127-1145` (verbatim claim:
"η^PF satisfies η†η = id_Q"; proof at lines 1131-1145 reduces to
the two squared-amplitude sums `x² + y² = 1/D² + φ²/D² = (1+φ²)/D²
= D²/D² = 1` and `p² + q² + r² = 1/D² + 1/D² + φ/D² = (2+φ)/D² =
D²/D² = 1`):

* `theorem PFBinaryEta_isometry`:
  `PFBinaryEta.conjTranspose * PFBinaryEta = 1`.
  MATCH: literal `η†η = id_Q` for the binary-channel matrix.
  Proof: `BinaryEta_isometry_of_norms` applied to the two PF row
  sums, each pushed through the `ℝ → ℂ` cast and reduced to
  `pf_vacuum_sqrt_normalisation` (vacuum-row squared sum
  `1/D² + φ²/D² = 1`) and `pf_tau_sqrt_normalisation` (τ-row
  squared sum `1/D² + 1/D² + φ/D² = 1`), which in turn unfold to
  `pf_vacuum_normalisation` / `pf_tau_normalisation` from
  `Fibonacci/Basic.lean` (P5.7). No drift.

C-gate result: CLEARED. No discrepancy between any of the five
`pfAmplitude_*` theorems and the corresponding `def:PF` sub-claim,
and no discrepancy between `PFBinaryEta_isometry` and `lem:PF-isom`.
The Wolfram leg is deferred to Phase 6
(`scripts/wolfram/fibonacci_binary.wls`), tracked in a bd follow-up
filed in this commit.

Historical ERRATA cross-reference (`ERRATA.md:28-143`,
"2026-05-16: lem:binary-Z squared-amplitudes (probabilities) →
amplitudes (with √)")
============================================================

`lem:binary-Z` at `summary.tex:1548-1564` is a SEPARATE but RELATED
lemma to `def:PF` realised here: it gives the cell-length-parametrised
binary refinement `E_{I→(J,K)}(c)` combining the algebra
multiplication amplitudes `m^c_{ab}` of `def:fib-mult` with the cell
partition functions `Z_c` of `def:Zfunc`. The historical bug
(documented in ERRATA.md) was that the inherited chat-4 source
displayed `lem:binary-Z`'s coefficients as SQUARED amplitudes
(probabilities) rather than AMPLITUDES (with outer `sqrt`); two
distinct errors compounded — outer fraction missing `sqrt(...)` AND
multiplicative `v_{ττ}` coefficients given as `|m^c_{ab}|²` (`φ` and
`φ⁻¹`) instead of `m^c_{ab}` (`sqrt(φ)` and `φ^{-1/2}`). The
corrected `summary.tex:1552-1560` has the AMPLITUDE form.

This file (the CAD-ported `Fibonacci/Binary.lean`) avoids the bug
pattern STRUCTURALLY:

1. The `pfAmplitude` definition (body line 86) has the outer
   `Real.sqrt` PRESENT: `Real.sqrt (fibDim b * fibDim c / (fibDim a *
   Dsq))`. This is the AMPLITUDE form, not the probability form.
   Substituting probabilities (without the outer sqrt) would change
   every `pfAmplitude_*` RHS and break `PFBinaryEta_isometry`.

2. The five `pfAmplitude_*` theorem RHS values (`1/sqrt D²`,
   `φ/sqrt D²`, `1/sqrt D²`, `1/sqrt D²`, `sqrt(φ)/sqrt D²`) match
   the AMPLITUDE values `(1/D, φ/D, 1/D, 1/D, sqrt(φ)/D)` of
   `def:PF` at `summary.tex:1120-1124`. The two φ-dependent entries
   are `φ/D` (not `φ²/D²`) and `sqrt(φ)/D` (not `φ/D²`) — i.e. the
   PRESENT-sqrt amplitude form, not the absent-sqrt probability
   form.

3. The isometry characterisation `BinaryEta_isometry_iff` requires
   `star x * x + star y * y = 1` etc., i.e. `|x|² + |y|² = 1`, the
   SQUARED-modulus sum-to-one condition. This matches
   `summary.tex:1108` verbatim and forces the `(x, y, p, q, r)` to
   be AMPLITUDES (not probabilities): if one substituted probability
   values, the squared sums would be `(prob)² = prob⁴` and would not
   normalise — the isometry test would FAIL loudly.

The squared-amplitudes-vs-amplitudes confusion is therefore AVOIDED
in this file by construction and by the isometry test that Lean
discharges. The ERRATA-flagged bug pattern (`lem:binary-Z`'s
cell-length-parametrised analogue) is NOT regenerated here, and any
attempt to substitute squared values for amplitudes would be caught
mechanically by `lake build` failing on `PFBinaryEta_isometry`. The
P5.10 mutation proof (perturbing `pfAmplitude_one_tau_tau`'s RHS
from `φ / Real.sqrt Dsq` to e.g. `Real.sqrt φ / Real.sqrt Dsq`)
directly tests this guard.
-/

namespace CFTAnyons
namespace Fibonacci

noncomputable section

open Matrix

abbrev FibCharge := Fin 2

abbrev BinaryChannel := Fin 5

def BinaryEta (x y p q r : ℂ) : Matrix BinaryChannel FibCharge ℂ :=
  !![x, 0; y, 0; 0, p; 0, q; 0, r]

theorem BinaryEta_isometry_iff (x y p q r : ℂ) :
    (BinaryEta x y p q r).conjTranspose * BinaryEta x y p q r = 1 ↔
      star x * x + star y * y = 1 ∧
        star p * p + star q * q + star r * r = 1 := by
  constructor
  · intro h
    constructor
    · have h00 := congr_fun (congr_fun h (0 : FibCharge)) (0 : FibCharge)
      simpa [BinaryEta, Matrix.mul_apply, Fin.sum_univ_five] using h00
    · have h11 := congr_fun (congr_fun h (1 : FibCharge)) (1 : FibCharge)
      simpa [BinaryEta, Matrix.mul_apply, Fin.sum_univ_five] using h11
  · intro h
    rcases h with ⟨h0, h1⟩
    ext i j
    fin_cases i <;> fin_cases j <;>
      simp [BinaryEta, Matrix.mul_apply, Fin.sum_univ_five]
    · simpa using h0
    · simpa using h1

theorem BinaryEta_isometry_of_norms
    {x y p q r : ℂ}
    (h_one : star x * x + star y * y = 1)
    (h_tau : star p * p + star q * q + star r * r = 1) :
    (BinaryEta x y p q r).conjTranspose * BinaryEta x y p q r = 1 :=
  (BinaryEta_isometry_iff x y p q r).mpr ⟨h_one, h_tau⟩

theorem pf_vacuum_sqrt_normalisation :
    ((1 : ℝ) / Real.sqrt Dsq) ^ 2 + (φ / Real.sqrt Dsq) ^ 2 = 1 := by
  have hs : (Real.sqrt Dsq) ^ 2 = Dsq := Real.sq_sqrt (le_of_lt Dsq_pos)
  calc
    ((1 : ℝ) / Real.sqrt Dsq) ^ 2 + (φ / Real.sqrt Dsq) ^ 2 =
        (1 : ℝ) / Dsq + φ ^ 2 / Dsq := by
          rw [div_pow, div_pow, hs]
          ring
    _ = 1 := pf_vacuum_normalisation

theorem pf_tau_sqrt_normalisation :
    ((1 : ℝ) / Real.sqrt Dsq) ^ 2 + ((1 : ℝ) / Real.sqrt Dsq) ^ 2 +
      (Real.sqrt φ / Real.sqrt Dsq) ^ 2 = 1 := by
  have hsD : (Real.sqrt Dsq) ^ 2 = Dsq := Real.sq_sqrt (le_of_lt Dsq_pos)
  have hsφ : (Real.sqrt φ) ^ 2 = φ := Real.sq_sqrt (le_of_lt phi_pos)
  calc
    ((1 : ℝ) / Real.sqrt Dsq) ^ 2 + ((1 : ℝ) / Real.sqrt Dsq) ^ 2 +
        (Real.sqrt φ / Real.sqrt Dsq) ^ 2 =
        (1 : ℝ) / Dsq + 1 / Dsq + φ / Dsq := by
          rw [div_pow, div_pow, hsD, hsφ]
          ring
    _ = 1 := pf_tau_normalisation

/-- The handoff Perron-Frobenius coefficient formula
`sqrt(d_b d_c / (d_a D^2))` for Fibonacci labels. -/
def pfAmplitude (a b c : FibLabel) : ℝ :=
  Real.sqrt (fibDim b * fibDim c / (fibDim a * Dsq))

theorem pfAmplitude_one_one_one :
    pfAmplitude FibLabel.one FibLabel.one FibLabel.one =
      (1 : ℝ) / Real.sqrt Dsq := by
  unfold pfAmplitude fibDim
  rw [show (1 : ℝ) * 1 / (1 * Dsq) = (1 : ℝ) / Dsq by ring]
  rw [Real.sqrt_div (show (0 : ℝ) ≤ 1 by norm_num)]
  simp

theorem pfAmplitude_one_tau_tau :
    pfAmplitude FibLabel.one FibLabel.tau FibLabel.tau =
      φ / Real.sqrt Dsq := by
  unfold pfAmplitude fibDim
  rw [show φ * φ / ((1 : ℝ) * Dsq) = φ ^ 2 / Dsq by ring]
  rw [Real.sqrt_div (sq_nonneg φ)]
  rw [Real.sqrt_sq (le_of_lt phi_pos)]

theorem pfAmplitude_tau_tau_one :
    pfAmplitude FibLabel.tau FibLabel.tau FibLabel.one =
      (1 : ℝ) / Real.sqrt Dsq := by
  unfold pfAmplitude fibDim
  rw [show φ * 1 / (φ * Dsq) = (1 : ℝ) / Dsq by
    field_simp [phi_ne_zero]]
  rw [Real.sqrt_div (show (0 : ℝ) ≤ 1 by norm_num)]
  simp

theorem pfAmplitude_tau_one_tau :
    pfAmplitude FibLabel.tau FibLabel.one FibLabel.tau =
      (1 : ℝ) / Real.sqrt Dsq := by
  unfold pfAmplitude fibDim
  rw [show (1 : ℝ) * φ / (φ * Dsq) = (1 : ℝ) / Dsq by
    field_simp [phi_ne_zero]]
  rw [Real.sqrt_div (show (0 : ℝ) ≤ 1 by norm_num)]
  simp

theorem pfAmplitude_tau_tau_tau :
    pfAmplitude FibLabel.tau FibLabel.tau FibLabel.tau =
      Real.sqrt φ / Real.sqrt Dsq := by
  unfold pfAmplitude fibDim
  rw [show φ * φ / (φ * Dsq) = φ / Dsq by
    field_simp [phi_ne_zero]]
  rw [Real.sqrt_div (le_of_lt phi_pos)]

def PFBinaryEta : Matrix BinaryChannel FibCharge ℂ :=
  BinaryEta (((1 : ℝ) / Real.sqrt Dsq : ℝ) : ℂ)
    ((φ / Real.sqrt Dsq : ℝ) : ℂ)
    (((1 : ℝ) / Real.sqrt Dsq : ℝ) : ℂ)
    (((1 : ℝ) / Real.sqrt Dsq : ℝ) : ℂ)
    ((Real.sqrt φ / Real.sqrt Dsq : ℝ) : ℂ)

theorem PFBinaryEta_isometry :
    PFBinaryEta.conjTranspose * PFBinaryEta = 1 := by
  unfold PFBinaryEta
  apply BinaryEta_isometry_of_norms
  · simpa [pow_two] using congrArg (fun x : ℝ => (x : ℂ)) pf_vacuum_sqrt_normalisation
  · simpa [pow_two] using congrArg (fun x : ℝ => (x : ℂ)) pf_tau_sqrt_normalisation

/-- The PF binary coordinate matrix obtained directly from the
quantum-dimension amplitude formula. -/
def PFBinaryEtaFromDimensions : Matrix BinaryChannel FibCharge ℂ :=
  BinaryEta (((pfAmplitude FibLabel.one FibLabel.one FibLabel.one : ℝ) : ℂ))
    (((pfAmplitude FibLabel.one FibLabel.tau FibLabel.tau : ℝ) : ℂ))
    (((pfAmplitude FibLabel.tau FibLabel.tau FibLabel.one : ℝ) : ℂ))
    (((pfAmplitude FibLabel.tau FibLabel.one FibLabel.tau : ℝ) : ℂ))
    (((pfAmplitude FibLabel.tau FibLabel.tau FibLabel.tau : ℝ) : ℂ))

theorem PFBinaryEtaFromDimensions_eq_PFBinaryEta :
    PFBinaryEtaFromDimensions = PFBinaryEta := by
  unfold PFBinaryEtaFromDimensions PFBinaryEta
  rw [pfAmplitude_one_one_one, pfAmplitude_one_tau_tau,
    pfAmplitude_tau_tau_one, pfAmplitude_tau_one_tau,
    pfAmplitude_tau_tau_tau]

theorem PFBinaryEtaFromDimensions_isometry :
    PFBinaryEtaFromDimensions.conjTranspose * PFBinaryEtaFromDimensions = 1 := by
  rw [PFBinaryEtaFromDimensions_eq_PFBinaryEta]
  exact PFBinaryEta_isometry

end

end Fibonacci
end CFTAnyons
