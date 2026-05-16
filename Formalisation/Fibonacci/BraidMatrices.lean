import Mathlib

/-!
Finite coordinate braid-matrix algebra.

This file proves the exact `2 x 2` algebraic braid relation appearing in the
local KZ/Fibonacci source after the displayed parameters have been abstracted
to scalars `q` and `s` with `q * s^2 = q^2 + q + 1`.

Port provenance: ported from
`cft-anyons-deprecated/Formalisation/Fibonacci/BraidMatrices.lean` (source
SHA256 `f21e57d7d407ca6b2076e743637829aded333222235f02dd6527c5fdce4bf890`,
63 LOC) at MIGRATION_PLAN.md:224 (P5.13). The body (from `namespace
CFTAnyons` at source line 11 to EOF source line 63) is byte-identical to the
CAD source body from its `namespace CFTAnyons` onwards. The CAD module
docstring (source lines 3-9) is PRESERVED VERBATIM as the opening
provenance-and-scope block above ("Finite coordinate braid-matrix algebra
... `q * s^2 = q^2 + q + 1`."); the rest of this docstring is the
cft-anyons-canonical provenance + GLOSSARY peripheral-citation paragraph +
peripheral status disavowal + 2-way C-gate (Lean ↔ KZ/Fibonacci source
paper) + Wolfram-deferral note that this P5.13 commit adds.

============================================================================
PERIPHERAL inclusion — explicit framing (NOT a primary slug realisation)
============================================================================

This file is a **PERIPHERAL** Phase-5 port — it is NOT a primary realisation
of any GLOSSARY slug. Specifically:

* The MAIN `def:fib` CAD pre-binding at `GLOSSARY.md:989` names
  `Fibonacci/FusionRules.lean::fibSkeletalFusionData` (Phase 5 P5.9, already
  landed) as the unique CAD realisation of the Fibonacci fusion category.
  That P5.9 port is the LOAD-BEARING `def:fib` anchor.

* The SAME `def:fib` translation-map entry at `GLOSSARY.md:989`
  additionally mentions THIS file as a PERIPHERAL completeness check.
  **Quoted verbatim** (the peripheral portion of `GLOSSARY.md:989`):

  > "Peripheral: `Fibonacci/BraidMatrices.lean` (Phase 5 P5.13) proves the
  > Fibonacci-specific braid-relation check (not a named claim in
  > `summary.tex`, but covered for completeness — per
  > `stocktake/reports/cad-lean.md` §5 line 352)."

The peripheral framing is LOAD-BEARING: per the reviewer lessons accumulated
across P5.7+P5.8+P5.9+P5.10+P5.11+P5.12 (conservative slug labels), this
P5.13 docstring is EVEN MORE conservative — there is no per-decl
`def:fib`-realisation correspondence here. The four decls below are a
parameterised algebraic identity (`B_{12}`, `B_{23}`, `B_{12} B_{23} B_{12}
= B_{23} B_{12} B_{23}`) verified at the level of `2 x 2` complex matrices
parameterised by `q, s : ℂ` satisfying `q * s^2 = q^2 + q + 1`. The
identification of this algebraic relation with the Fibonacci CFT braid
generators is the JOB of `Fibonacci/FusionRules.lean::fibSkeletalFusionData`
(P5.9) + `Fibonacci/Matrix.lean::FibF` (P5.8); this file does NOT redo
that identification, it only verifies the resulting algebraic relation.

**Explicit DISAVOWAL.** This file:
* does NOT introduce any new GLOSSARY-pre-bound def or theorem;
* does NOT realise `def:fib` (P5.9's `fibSkeletalFusionData` does);
* does NOT realise `def:fib-F` (P5.8's `FibF` does);
* does NOT realise any slug whose translation-map names this file as the
  primary anchor — no such slug exists.

It is a Fibonacci-specific PERIPHERAL completeness check whose addition to
the consolidation is justified solely by the GLOSSARY.md:989 peripheral
clause quoted above. Per `MIGRATION_PLAN.md:224`, the validation gates are
`M, D` (minimal — no C-gate prescribed) — reflecting the peripheral, no-
summary.tex-named-claim status. Nevertheless, per the P5.7+...+P5.12
canonical pattern (Wolfram leg deferred to Phase 6), a 2-way C-gate (Lean
↔ source paper) is executed here in full per the block below; the C-gate is
2-way Lean ↔ source-paper rather than the usual Lean ↔ summary.tex because
NO `summary.tex` named lemma corresponds to this content.

============================================================================
2-way C-gate (Lean ↔ KZ/Fibonacci source paper)
============================================================================

`MIGRATION_PLAN.md:224` prescribes `M, D` for P5.13 — no C-gate. The
2-way C-gate executed here is voluntary extra cross-checking per the
established canonical pattern.

**Source paper.** `references/text/IsingLikeFibonacciAnyonsKZ.txt`
(Ising-like Fibonacci anyons KZ paper, local extraction). The relevant
braid-matrix data is in section §4.1.4 "4-point braiding matrices for
Fibonacci anyons" (PDF body around p.18-19 of the paper, text-extract
around line 1140-1280). Three identities to match:

* **B_{12} (KZ eq 4.16)** — `references/text/IsingLikeFibonacciAnyonsKZ.txt`
  line 1149-1151 (verbatim transcription, ASCII rendition of the displayed
  matrix):
  >       exp(-4πi/5)         0            q^2  0
  > B_12 =                              =
  >          0          -exp(-2πi/5)         0  -q
  >
  > where q = exp(-2πi/5).

  Lean: `def fibB12 (q : ℂ) : Matrix (Fin 2) (Fin 2) ℂ :=
  ![![q ^ 2, 0], ![0, -q]]` (body line 19).
  MATCH (algebraic). The Lean def parameterises the displayed diagonal
  matrix `diag(q^2, -q)` by the complex scalar `q : ℂ`; the specific
  numerical choice `q = exp(-2πi/5)` of the paper is the (unique) WZW
  level-3 root-of-unity that realises the Fibonacci anyon CFT, but the
  Lean theorem is GENERIC over `q : ℂ` (so it is the algebraic identity,
  not the spectroscopic identification).

* **B_{23} (KZ eq 4.30)** — `references/text/IsingLikeFibonacciAnyonsKZ.txt`
  line 1271-1274 (verbatim transcription, ASCII rendition of the displayed
  matrix):
  >              q       -1     q√φ
  > B_23 =  --------- ·
  >          q + 1      q√φ    q^2
  >
  > where we have used the fact that φ = q + q^{-1} + 1
  > [KZ source line 1276]

  Lean: `def fibB23 (q s : ℂ) : Matrix (Fin 2) (Fin 2) ℂ :=
  (q / (q + 1)) • ![![-1, q * s], ![q * s, q ^ 2]]` (body line 25).
  MATCH (algebraic). The Lean def names the source's `√φ` factor as the
  abstract scalar `s : ℂ`; the source identity `φ = q + q^{-1} + 1`
  multiplied by `q` gives `q * φ = q^2 + q + 1`, i.e. the abstract
  hypothesis `q * s^2 = q^2 + q + 1` of the theorem below (since
  `s^2 = φ`). The prefactor `q / (q + 1)` is exact.

* **Braid relation (KZ eq 4.31)** —
  `references/text/IsingLikeFibonacciAnyonsKZ.txt` line 1278 (verbatim):
  >  B_12 B_23 B_12 − B_23 B_12 B_23 = 0    (4.31)

  Lean: `theorem fibB12_fibB23WithScalar_braid_relation
  {c q s : ℂ} (hc : c * (q + 1) = q) (hs : q * s ^ 2 = q ^ 2 + q + 1) :
  fibB12 q * fibB23WithScalar c q s * fibB12 q =
    fibB23WithScalar c q s * fibB12 q * fibB23WithScalar c q s`
  (body line 40).
  MATCH (algebraic, with one additional abstraction). The theorem is
  stated in terms of `fibB23WithScalar c q s` (body line 31), which is
  `fibB23` with the scalar prefactor `q / (q + 1)` ABSTRACTED to a free
  `c : ℂ` satisfying `c * (q + 1) = q` (hypothesis `hc`). This means the
  theorem is slightly more general than `B_12 B_23 B_12 = B_23 B_12 B_23`
  for the specific `B_23` of eq 4.30 — it covers ANY scalar `c` satisfying
  `c * (q + 1) = q`, of which `c = q / (q + 1)` is the canonical solution
  (modulo `q ≠ -1`). The hypothesis `hs : q * s^2 = q^2 + q + 1` is the
  source's `φ = q + q^{-1} + 1` after `q^{-1}` clearance, exactly as the
  module docstring states.

  **Why the `c` abstraction.** The Lean proof discharges the four `Fin 2 ×
  Fin 2` matrix entries with `linear_combination` certificates polynomial
  in `c, q, s` and the two hypotheses (`hc`, `hs`); leaving `c` free makes
  the polynomial-identity machinery cleaner (the prefactor `q / (q + 1)`
  involves division-by-`(q + 1)` which would otherwise need a `q + 1 ≠ 0`
  side-condition). The abstraction is FAITHFUL to the source identity — it
  RECOVERS the source identity by substituting `c := q / (q + 1)` and using
  `(q / (q + 1)) * (q + 1) = q` (which requires `q + 1 ≠ 0`, the implicit
  side-condition of the source's eq 4.30 displayed form).

Per-decl summary of decls in this file:

* `def fibB12 (q : ℂ)` (body line 19) — peripheral / KZ eq 4.16
  algebraic skeleton. NOT a GLOSSARY-bound def.

* `def fibB23 (q s : ℂ)` (body line 25) — peripheral / KZ eq 4.30
  algebraic skeleton (with `s` standing for `√φ`). NOT a GLOSSARY-bound
  def.

* `def fibB23WithScalar (c q s : ℂ)` (body line 31) — `fibB23` with the
  prefactor `q / (q + 1)` abstracted to a free `c`; used as the LHS / RHS
  of the braid-relation theorem to avoid division-by-`(q + 1)` in the
  polynomial certificates. NOT a GLOSSARY-bound def.

* `theorem fibB12_fibB23WithScalar_braid_relation` (body line 40) — the
  peripheral KZ eq 4.31 algebraic braid relation `B_12 B_23 B_12 =
  B_23 B_12 B_23`. Proved by `ext` + `fin_cases` + `simp` +
  `linear_combination` per-entry, using the two hypotheses `hc` and `hs`.
  NOT a `summary.tex` named lemma — it is the peripheral completeness
  check named in `GLOSSARY.md:989`'s peripheral clause.

C-gate result: CLEARED for the algebraic identities `B_12`, `B_23`, and
the braid relation `B_12 B_23 B_12 = B_23 B_12 B_23`. All three Lean
constructs match the corresponding KZ/Fibonacci source identities (eq
4.16, eq 4.30, eq 4.31) at the level of complex-matrix algebra with the
documented `s = √φ` and `c = q / (q + 1)` abstractions. NO `summary.tex`
named lemma corresponds (explicit; the GLOSSARY.md:989 peripheral clause
states "not a named claim in summary.tex"); the C-gate is 2-way Lean ↔
KZ/Fibonacci source paper rather than the usual Lean ↔ summary.tex.

The Wolfram leg is deferred to Phase 6
(`scripts/wolfram/fibonacci_braid_matrices.wls`), tracked as a bd
follow-up filed in this commit; the Wolfram script should symbolically
verify (a) the matrix entries of `fibB12` and `fibB23`, (b) the
`q * s^2 = q^2 + q + 1` ↔ `φ = q + q^{-1} + 1` reduction with
`s^2 = φ`, and (c) the braid relation `B_12 B_23 B_12 = B_23 B_12 B_23`
at the symbolic level via `Together` / `Factor` / `Simplify`.

============================================================================
End of P5.13 docstring extension.
============================================================================
-/

namespace CFTAnyons
namespace Fibonacci

noncomputable section

open Matrix

/-- The sourced two-dimensional Fibonacci braid generator `B_12`. -/
def fibB12 (q : ℂ) : Matrix (Fin 2) (Fin 2) ℂ :=
  ![![q ^ 2, 0],
    ![0, -q]]

/-- The sourced two-dimensional Fibonacci braid generator `B_23`, with `s`
standing for the displayed `sqrt(phi)` factor. -/
def fibB23 (q s : ℂ) : Matrix (Fin 2) (Fin 2) ℂ :=
  (q / (q + 1)) •
    ![![-1, q * s],
      ![q * s, q ^ 2]]

/-- The same `B_23` matrix with the prefactor abstracted. -/
def fibB23WithScalar (c q s : ℂ) : Matrix (Fin 2) (Fin 2) ℂ :=
  c •
    ![![-1, q * s],
      ![q * s, q ^ 2]]

/-- Algebraic core of the displayed Fibonacci braid relation.  The source uses
`s = sqrt(phi)` and `phi = q + q^{-1} + 1`; after clearing `q^{-1}`, this is the
assumption `q * s^2 = q^2 + q + 1`.  The prefactor condition
`c * (q + 1) = q` abstracts the displayed scalar `q / (q + 1)`. -/
theorem fibB12_fibB23WithScalar_braid_relation
    {c q s : ℂ} (hc : c * (q + 1) = q)
    (hs : q * s ^ 2 = q ^ 2 + q + 1) :
    fibB12 q * fibB23WithScalar c q s * fibB12 q =
      fibB23WithScalar c q s * fibB12 q * fibB23WithScalar c q s := by
  ext i j
  fin_cases i <;> fin_cases j
  · simp [fibB12, fibB23WithScalar, Matrix.mul_apply, Fin.sum_univ_two]
    ring_nf at hc hs ⊢
    linear_combination c ^ 2 * q ^ 2 * hs + c * q ^ 3 * hc
  · simp [fibB12, fibB23WithScalar, Matrix.mul_apply, Fin.sum_univ_two]
    ring_nf at hc ⊢
    linear_combination c * q ^ 3 * s * hc
  · simp [fibB12, fibB23WithScalar, Matrix.mul_apply, Fin.sum_univ_two]
    ring_nf at hc ⊢
    linear_combination c * q ^ 3 * s * hc
  · simp [fibB12, fibB23WithScalar, Matrix.mul_apply, Fin.sum_univ_two]
    ring_nf at hc hs ⊢
    linear_combination -c ^ 2 * q ^ 3 * hs - c * q ^ 3 * hc

end

end Fibonacci
end CFTAnyons
