import Formalisation.Fibonacci.Binary
import Formalisation.Fibonacci.Matrix

/-!
Scalar algebra for the proposed Fibonacci binary-composition candidate.

This file proves only the algebraic identities displayed in the handoff
derivation sketch. It does not prove that the categorical map `eta` is
coassociative; that requires a separate formalisation of the associator
comparison and fusion-tree basis semantics.

Source provenance:
* CAD source: `cft-anyons-deprecated/Formalisation/Fibonacci/Coassoc.lean`.
* CAD source SHA256:
  `79d2e6f323a162ce9bcbd77b37b94f9a406e8c11a02da201d6769e0ca4f14a1b`.
* CAD-internal handoff references (`handoff.md`, `MASTER_PROVENANCE.md`)
  are NOT present in cft-anyons; replaced here with the cft-anyons-canonical
  citations below.
* `summary.tex:1153` (`def:coassoc`, "Coassociative ansatz") — the
  CATEGORICAL coassociativity equation
  `(η ⊗ id) η = (id ⊗ η) η` for the splitting morphism `η`. Listed
  here to be EXPLICITLY DISAVOWED below as the equation that this file
  does NOT realise.
* `summary.tex:1159` (`thm:coassoc`, "Positive coassociative solution")
  — the SCALAR system `(N1) x² + y² = 1; (N2) 2x² + r² = 1; (C1)
  p = q = x; (C2) r² = φ^{-3/2} xy` and the assertion that the
  unique strictly positive real solution is
  `x = φ^{-1}, y = φ^{-1/2}, p = q = φ^{-1}, r = φ^{-3/2}`. The
  named SCALAR theorems of this file (`coassocX_sq_add_x`,
  `coassoc_one_norm`, `coassoc_tau_norm`, `coassoc_r_sq_equation`,
  `coassoc_positive_solution_unique`) realise the SCALAR side of
  `thm:coassoc` for the algebra-parameter triple
  `(coassocX, coassocY, coassocR) = (φ^{-1}, φ^{-1/2}, φ^{-3/2})`.
* `summary.tex:1300` (`warn:PF-coassoc`, "PF ≠ coassociative") — the
  load-bearing numerical separation between the PF and coassoc
  solutions: `x_PF = 1/√(2+φ) ≈ 0.5257` (per
  `def:PF`, P5.10's `Fibonacci/Binary.lean`) versus
  `x_coassoc = φ^{-1} ≈ 0.6180` (per this file's `coassocX`). The
  two are answers to DIFFERENT coherence requirements; conflating
  them is a hallucination risk.
* `summary.tex:497-517` (`rem:dagger-special-scope` +
  `warn:not-Frobenius`) — relevant context: the boilerplate phrase
  "Δ is coassociative" in `summary.tex` is shorthand for
  "the multiplication `m` is associative, and `Δ` is constructed from
  `m^†` by `Δ = λ^{-1/2} m^†`", with categorical coassociativity of
  `Δ` requiring monoidal-dagger compatibility that is ASSUMED but NOT
  AXIOMATICALLY CHECKED. This file's SCALAR scope is consistent with
  that assumption-not-check stance — the categorical equation is
  out-of-scope here, and not proved anywhere in this repo.
* `references/text/FibonacciAnyonModels.txt` lines 272, 297, 301, 304
  — Rowell's F-matrix entries with the `φ^{-1}`/`φ^{-1/2}` algebra
  parameters used here (consistent with CAD's existing dependency on
  `Fibonacci/Matrix.lean` whose `FibF` entries this file's
  `coassoc_F_comparison` consumes).

Port provenance: ported from
`cft-anyons-deprecated/Formalisation/Fibonacci/Coassoc.lean` (source
SHA256 above, 225 LOC) at MIGRATION_PLAN.md:222 (P5.11). The body
(from `namespace CFTAnyons` at source line 13 to EOF source line 225)
is byte-identical to the CAD source body from its `namespace
CFTAnyons` onwards. The CAD module docstring (source lines 4-11) is
PRESERVED VERBATIM as the opening four lines above ("Scalar algebra
... fusion-tree basis semantics."); the rest of this docstring is the
provenance + GLOSSARY-cross-reference + 2-way C-gate + SCALAR-vs-
CATEGORICAL-disavowal extension that this P5.11 commit adds.

============================================================================
CRITICAL — SCALAR vs CATEGORICAL coassociativity (CLAUDE.md
hallucination-risk callout #3)
============================================================================

This file proves **scalar coassociativity**: an algebraic fixed-point
equation on the binary-refinement amplitude parameters
`(coassocX, coassocY, coassocR) = (φ^{-1}, φ^{-1/2}, φ^{-3/2})`
realising the F-symbol consistency condition (the structure-constant
content of `def:coassoc` per the `[[conv:1op]]` algebra-ansatz scope,
specifically the joint system (N1)+(N2)+(C1)+(C2) of `thm:coassoc` at
`summary.tex:1159-1174`).

It does **NOT** prove **categorical coassociativity** — the equation
`(η ⊗ id) η = (id ⊗ η) η` of `def:coassoc` (`summary.tex:1153`,
which is the GLOSSARY-canonical statement at `GLOSSARY.md:1097`) up
to the associator (Fibonacci `F`-symbol of `def:fib-F`). The
categorical equation requires associator-and-fusion-tree-basis
semantics that are NOT constructed here. The categorical
coassociativity for `η` REMAINS UNPROVED IN THIS REPO (per
`PRD.md:244-247` Known Limitations: "Categorical coassociativity
not formalised anywhere; scalar version proved in CAD Lean and to
be migrated in Phase 5.").

Per `warn:PF-coassoc` (`summary.tex:1300-1312`), the coassoc
solution `coassocX = φ^{-1} ≈ 0.6180` of this file is numerically
DISTINCT from the PF solution `x_PF = 1/√(2+φ) ≈ 0.5257` (when
the canonical `def:PF` `1/D` form is converted to the algebra
variable `x` via the Fibonacci `D² = 2+φ` formula) of `def:PF`
(P5.10's `Fibonacci/Binary.lean`). The two are NOT the same
amplitude system: PF is the quantum-dimension/string-net normalisation,
coassoc is the F-symbol fixed-point. CONFLATING THEM IS THE CLAUDE.md
HALLUCINATION-RISK CALLOUT #3. This file's `coassocX = φ^{-1}` and
P5.10's `PFBinaryEta` per-channel constants are answers to DIFFERENT
coherence requirements (F-symbol fixed-point versus
quantum-dimension-weighted PF eigenvector); the choice between them
must be stated explicitly in any downstream computation, per
`warn:PF-coassoc`.

This is the CLAUDE.md hallucination-risk callout #3 ("Coassociativity
is overloaded"). See:
* CLAUDE.md hallucination-risk callouts §3 (the canonical reference
  for the scalar-vs-categorical overloading).
* `PRD.md:208-209` (the pre-read warning enumeration).
* `GLOSSARY.md:1117` (the CAD translation map for `def:coassoc`,
  quoted verbatim below).
* `GLOSSARY.md:1118-1128` (the Notes block for `def:coassoc`, which
  explicitly distinguishes the scalar from the categorical).

============================================================================
Cross-references to GLOSSARY.md
============================================================================

-- GLOSSARY: def:coassoc (GLOSSARY.md:1097) — the CATEGORICAL
   coassociativity equation `(η ⊗ id) η = (id ⊗ η) η` for the
   splitting morphism `η` (up to the F-symbol associator). The
   GLOSSARY entry's CAD translation map at `GLOSSARY.md:1117` is the
   PRE-BINDING for this P5.11 commit. **Quoted verbatim** (the
   load-bearing scope-disambiguation paragraph):

   > "CAD: `Fibonacci/Coassoc.lean` (Phase 5 P5.11). Critical scope
   > disambiguation: CAD proves scalar coassociativity (the F-symbol
   > fixed-point equation on algebra parameters `(a, b)` per
   > [[conv:1op]]) — NOT the categorical equation
   > `(η⊗id)η = (id⊗η)η`. This is the CLAUDE.md hallucination-risk
   > callout #3 (scalar-vs-categorical coassoc overloading). P5.11's
   > docstring must preserve this disambiguation. Per
   > `stocktake/reports/cad-lean.md` §5 line 350 and §3 (which
   > explicitly notes 'categorical proof gap explicitly noted')."

   **Per-promise correspondence**. The pre-binding's first promise
   is the SCALAR realisation; per-decl mapping:

   * "scalar coassociativity (the F-symbol fixed-point equation on
     algebra parameters `(a, b)` per `[[conv:1op]]`)" → realised in
     this file by the following SCALAR named theorems on the
     amplitude triple `(coassocX, coassocY, coassocR) = (φ^{-1},
     φ^{-1/2}, φ^{-3/2})`:

       - `theorem coassocX_sq_add_x` (body line 30):
         `coassocX^2 + coassocX = 1`. This is the golden-ratio
         identity `φ^{-2} + φ^{-1} = 1` (per P5.7's
         `phi_inv_sq_plus_inv`), realising the underlying algebra
         identity that the (C2) F-symbol fixed-point equation
         `r^2 = φ^{-3/2} xy` collapses to at the unique positive
         scalar solution.
       - `theorem coassoc_one_norm` (body line 34):
         `coassocX^2 + coassocY^2 = 1`. This realises (N1) of
         `thm:coassoc` at the unique scalar positive solution
         `(x, y) = (φ^{-1}, φ^{-1/2})`.
       - `theorem coassoc_tau_norm` (body line 38):
         `2 * coassocX^2 + coassocR^2 = 1`. This realises (N2) of
         `thm:coassoc` at `(x, r) = (φ^{-1}, φ^{-3/2})` with
         `p = q = x` (i.e. (C1)) already substituted.
       - `theorem coassoc_r_sq_equation` (body line 44):
         `coassocR^2 = coassocR * coassocX * coassocY`. Together
         with `coassoc_r_eq_xy : coassocR = coassocX * coassocY`
         (body line 42) and `coassocR_sq_eq_x_cubed` (body line 65),
         these encode the SCALAR (C2) F-symbol-fixed-point identity
         `r^2 = φ^{-3/2} xy` at the unique scalar positive solution.
       - `theorem coassoc_positive_solution_unique` (body line 128):
         the SCALAR uniqueness theorem — for any real `(x, y, r)` with
         `x, y, r > 0` satisfying the joint system
         `(x² + y² = 1) ∧ (2x² + r² = 1) ∧ (r² = coassocR * x * y)`,
         we have `x = coassocX ∧ y = coassocY ∧ r = coassocR`. This
         is the SCALAR side of the "unique strictly positive real
         solution" claim of `thm:coassoc` (`summary.tex:1159-1174`),
         restricted to the F-symbol-fixed-point system that follows
         from (C1) and the F-matrix second row.

   * `theorem coassoc_factor_identity_general` (body line 113) and
     `theorem coassoc_factor_identity` (body line 120) are the
     SCALAR polynomial-factorisation lemmas underwriting the
     uniqueness proof: the polynomial
     `(1 - 2u)^2 - a^3 u (1 - u)` factors as
     `(2a + 3)(u - a²)(u - a)` whenever `a^2 + a = 1`. These are
     the algebraic engine behind the proof of
     `coassoc_positive_solution_unique` (via `u = x^2`).

   * `def CoassocBinaryEta` (body line 100) and `theorem
     CoassocBinaryEta_isometry` (body line 106): the COORDINATE-LEVEL
     5×2 matrix `Matrix BinaryChannel FibCharge ℂ` instantiating
     `BinaryEta` (P5.10's generic skeleton) with the coassoc tuple
     `(coassocX, coassocY, coassocX, coassocX, coassocR)`, together
     with its FINITE-COORDINATE isometry theorem. The CAD source
     docstring on `CoassocBinaryEta` itself states (body line 97-99):
     "this is only the coordinate-level matrix encoded by the
     handoff coefficients", and the isometry theorem's docstring
     (body lines 104-105) is explicit: "The handoff coefficient
     choice is an isometry in the fixed finite coordinate basis. This
     does not assert categorical coassociativity." The isometry is a
     finite-coordinate `η^† η = 1` check on the BinaryEta
     parametrisation; it does NOT prove the categorical
     `(η ⊗ id) η = (id ⊗ η) η` equation.

   * `def coassocComparisonVector` (body line 190) and `theorem
     coassoc_F_comparison` (body line 193): the SCALAR F-matrix
     fixed-point check at the unique scalar positive solution —
     the comparison vector `(xy, r²)` is fixed by `FMatrix
     coassocX coassocY` (the Fibonacci F-matrix at the
     `(coassocX, coassocY)` arguments). This realises the (C2)
     equation `(xy, r²) = F^{τττ}_τ · (xy, r²)` displayed at
     `summary.tex:1218-1221` for the scalar positive solution.
     It is a fixed-point check on a 2-vector; it is NOT the
     categorical equation.

   * **Explicit DISAVOWAL** (load-bearing — the canonical
     enforcement of CLAUDE.md hallucination-risk callout #3 in
     this file): **NO decl of this file realises `def:coassoc`'s
     CATEGORICAL equation `(η ⊗ id) η = (id ⊗ η) η`.** The
     categorical equation requires (a) the full splitting morphism
     `η : Q → A ⊗ A` as a morphism in the unitary fusion category
     (not its 5×2 coordinate matrix `CoassocBinaryEta`), (b) the
     tensor-product morphism `η ⊗ id` and `id ⊗ η` as morphisms in
     the iterated tensor `A ⊗ A ⊗ A`, (c) the associator (the
     F-symbol `F^{τττ}_τ` of `def:fib-F`) inserted to reconcile
     the two parenthesisations, and (d) equality of the resulting
     morphisms in `Hom(Q, A ⊗ A ⊗ A)`. None of (a)–(d) is
     constructed here. The file's scope is the algebra-parameter
     SCALAR system (N1)+(N2)+(C1)+(C2) that the categorical
     equation reduces to in the `[[conv:1op]]` algebra ansatz
     after the morphism content is fixed. The remaining gap from
     SCALAR to CATEGORICAL is the morphism-level construction;
     that gap is OPEN in this repo (per `PRD.md:244-247` and
     `GLOSSARY.md:1118-1128`).

     Supporting infrastructure that is NOT a `def:coassoc`
     realisation (per the P5.7+P5.8+P5.9+P5.10 reviewer lessons
     against over-claiming GLOSSARY slugs):

       * `def coassocX : ℝ := φ⁻¹` (body line 20),
         `def coassocY : ℝ := Real.sqrt φ⁻¹` (body line 22),
         `def coassocR : ℝ := coassocX * coassocY` (body line 24)
         — the three SCALAR algebra-parameter constants. Each is a
         single real number, not a categorical morphism. They are
         the AMPLITUDES `(x, y, r) = (φ^{-1}, φ^{-1/2}, φ^{-3/2})`
         specified by the unique positive solution of
         `thm:coassoc`. NOT `def:coassoc` realisations per se —
         they are the AMPLITUDE-VALUE definitions that the
         SCALAR system constrains.
       * `theorem coassocY_sq : coassocY^2 = coassocX` (body line
         26): the square-root-elimination identity
         `(φ^{-1/2})^2 = φ^{-1}`. Used in the (N1) check
         `coassoc_one_norm` and in `coassocR_sq_eq_x_cubed`. NOT
         a `def:coassoc` realisation — algebraic plumbing.
       * `theorem coassoc_r_eq_xy : coassocR = coassocX * coassocY`
         (body line 42): definitional unfolding of `coassocR`. NOT
         a `def:coassoc` realisation — a definitional `rfl`.
       * `theorem coassocX_pos` (body line 49),
         `theorem coassocX_gt_half` (body line 53),
         `theorem coassocY_pos` (body line 57),
         `theorem coassocR_pos` (body line 61): the four
         positivity lemmas. Used to discharge the strict-positivity
         hypotheses of `coassoc_positive_solution_unique`. NOT
         `def:coassoc` realisations — strict-positivity plumbing.
       * `theorem coassocR_sq_eq_x_cubed` (body line 65):
         `coassocR^2 = coassocX^3`. Algebraic consequence of
         `coassocR = coassocX * coassocY` and `coassocY^2 =
         coassocX`. Used in `coassoc_positive_solution_unique`'s
         polynomial manipulation. NOT a `def:coassoc` realisation
         — algebraic plumbing.
       * `theorem coassocY_eq_inv_sqrt_phi` (body line 74),
         `theorem coassocR_eq_phi_inv_mul_inv_sqrt_phi` (body line
         81), `theorem coassocR_sq_eq_phi_inv_cube` (body line 87),
         `theorem coassocR_eq_sqrt_phi_inv_cube` (body line 92):
         four alternative-form lemmas re-expressing the
         `coassocY`, `coassocR`, `coassocR^2` constants in
         standard golden-ratio-power forms (`(√φ)^{-1}`,
         `φ^{-1} (√φ)^{-1}`, `(φ^{-1})^3`, `√((φ^{-1})^3)`)
         matching `summary.tex`'s prose forms `φ^{-1/2}` and
         `φ^{-3/2}`. NOT `def:coassoc` realisations — they are
         the GLOSSARY-side translation aids tying the named
         algebra constants to their `summary.tex` prose forms.

   **Dependency cross-references**:

   * `[[conv:1op]]` (GLOSSARY.md:889) — the `A = 1 ⊕ p` algebra
     ansatz convention. The amplitude triple `(coassocX,
     coassocY, coassocR)` lives INSIDE this convention for
     `p = τ` (Fibonacci instantiation): the SCALAR system that
     this file solves is precisely the F-symbol-fixed-point
     equation on the algebra parameters under this ansatz. The
     convention's "fix orthonormal splitting basis vectors
     `v^{1}_{p,p}, v^{p}_{p,p}`" prescribes the basis indices in
     which `(x, y, r)` are measured. NOT a D-gate pre-binding —
     this is a notational/structural dependency.

   * `[[def:PF]]` (GLOSSARY.md:1061; CAD: P5.10's
     `Fibonacci/Binary.lean::PFBinaryEta`) — the PF amplitude
     system. **CRITICAL CONTRAST**: per `warn:PF-coassoc`
     (`summary.tex:1300`), the coassoc amplitudes of this file
     are NUMERICALLY DISTINCT from the PF amplitudes of P5.10.
     Concretely, this file's `coassocX = φ^{-1} ≈ 0.6180` is NOT
     equal to P5.10's `pfAmplitude FibLabel.one FibLabel.one
     FibLabel.one = 1/√D² = 1/√(2+φ)` (which is `≈ 0.5257` per
     `warn:PF-coassoc`; here `D² = 1 + φ² = 2 + φ` by P5.7's
     `Dsq := 1 + φ²` and `phi_sq`). The two amplitude systems
     are answers to DIFFERENT coherence requirements (F-symbol
     fixed-point versus quantum-dimension-weighted PF
     eigenvector); the dependency on `def:PF` here is the
     `BinaryEta` skeleton-and-isometry-of-norms infrastructure
     of P5.10 (`Formalisation/Fibonacci/Binary.lean::BinaryEta` and
     `BinaryEta_isometry_of_norms`), instantiated at the
     coassoc tuple rather than the PF tuple.

   * `[[def:phi]]` (GLOSSARY.md:997) — golden ratio
     `φ := (1 + √5)/2`. Consumed via P5.7's
     `Formalisation/Fibonacci/Basic.lean::φ`, `phi_pos`,
     `phi_inv_nonneg`, `phi_inv_sq_plus_inv`. Already FULLY
     discharged at P5.7.

   * `[[def:fib-F]]` (GLOSSARY.md:1024; CAD: P5.8's
     `Fibonacci/Matrix.lean::FibF`) — the Fibonacci F-matrix
     `F^{τττ}_τ`. Consumed via the imported
     `Formalisation.Fibonacci.Matrix::FMatrix` (the 2×2 matrix
     parametrised by `(a, b)` with the Fibonacci specialisation
     `(a, b) = (φ^{-1}, √φ^{-1})`); the `coassoc_F_comparison`
     theorem at body line 193 evaluates this matrix at
     `(coassocX, coassocY)` and verifies that the comparison
     vector `(xy, r²)` is fixed. Already FULLY discharged at P5.8
     (the F-matrix construction and entries). NOTE: this file
     uses the imported `FMatrix` (the parametric 2×2 matrix)
     rather than `FibF` directly; the Fibonacci specialisation
     `FibF = FMatrix φ⁻¹ (√φ⁻¹)` is documented at P5.8 and
     consumed here by passing `(coassocX, coassocY)` which equal
     `(φ⁻¹, √φ⁻¹)` definitionally.

   * `[[def:fib]]` (GLOSSARY.md:961) — Fibonacci fusion category.
     Consumed via P5.9's `FibLabel` + `fibDim` and P5.10's
     `BinaryChannel`/`FibCharge`. Already FULLY discharged at
     P5.9/P5.10.

   * `[[def:fib-mult]]` (GLOSSARY.md:1132) — Fibonacci
     multiplication amplitudes `m^{1}_{ττ} = √φ`,
     `m^{τ}_{ττ} = φ^{-1/2}`. NOT FORMALISED in CAD (per
     `GLOSSARY.md:1162`, "not formalised … Fibonacci/Coassoc.lean
     covers only scalar coassociativity constraints"). Conceptual
     companion: `coassocR = φ^{-3/2}` is the AMPLITUDE that the
     derived `Δ = φ^{-1} m^†` lands on the `τ → τ ⊗ τ` channel,
     per `summary.tex:1167-1170` (`cor:Delta-coassoc`); this file
     does NOT construct that derived `Δ` (which would require the
     un-formalised `m` of `def:fib-mult`). The SCALAR uniqueness
     of `coassoc_positive_solution_unique` is consistent with
     `thm:coassoc`'s assertion that the
     `Δ = φ^{-1} m^†` value is the unique scalar positive
     solution.

   **Documentation cross-references** (NOT D-gate pre-bindings):

   * `[[conv:1op]]` vacuum-and-algebra-ansatz convention at
     `CONVENTIONS.md` / `GLOSSARY.md:889`. See "Dependency
     cross-references" above.
   * `CONVENTIONS.md (b)` F-matrix gauge convention — the
     Fibonacci F-matrix is INVOLUTORY (per `summary.tex:1072`,
     `lem:F-invol`), and the unitary and involutory gauges
     COINCIDE for Fibonacci (per `CONVENTIONS.md` §(b)). The
     `coassoc_F_comparison` theorem at body line 193 reads
     correctly in either gauge.
   * The file uses the post-P1.1 GLOSSARY conventions: `def:coassoc`
     is the CATEGORICAL equation (not the SCALAR system); the
     SCALAR system that this file proves is referenced as
     `thm:coassoc`.

============================================================================
2-way C-gate (Lean ↔ summary.tex thm:coassoc at summary.tex:1159 +
              the SCALAR side of def:coassoc per the conv:1op ansatz)
============================================================================

MIGRATION_PLAN.md:222 prescribes `M, D, C, R` for P5.11 with the
explicit note that this is a high-stakes definitional disambiguation.
Per the established P5.7 + P5.8 + P5.9 + P5.10 canonical pattern
(3-way for Fibonacci content; Wolfram leg deferred to Phase 6), the
2-way C-gate (Lean ↔ summary.tex) is executed here in full. The
Wolfram leg is tracked as a Phase-6 bd follow-up filed in this commit.

`thm:coassoc` at `summary.tex:1159-1174` (verbatim transcription of
the unique scalar positive solution):

  joint system on (x, y, p, q, r) > 0:
    (N1)  x² + y² = 1,
    (N2)  2x² + r² = 1,
    (C1)  p = q = x,
    (C2)  r² = φ^{-3/2} xy;
  unique solution:
    x = φ^{-1}, y = φ^{-1/2}, p = q = φ^{-1}, r = φ^{-3/2}.

Per-sub-claim Lean correspondence:

* Sub-claim (N1): `x² + y² = 1` at `(x, y) = (φ^{-1}, φ^{-1/2})`.
  Lean: `theorem coassoc_one_norm : coassocX^2 + coassocY^2 = 1`.
  MATCH: `coassocX = φ^{-1}` (body line 20), `coassocY = √φ⁻¹` (body
  line 22, equal to `φ^{-1/2}` by `Real.sqrt_inv`); the identity
  reduces to `φ^{-2} + φ^{-1} = 1` (P5.7's `phi_inv_sq_plus_inv`).
  No drift.

* Sub-claim (N2): `2x² + r² = 1` at `(x, r) = (φ^{-1}, φ^{-3/2})`.
  Lean: `theorem coassoc_tau_norm : 2 * coassocX^2 + coassocR^2 = 1`.
  MATCH: `coassocR = coassocX * coassocY = φ^{-1} · φ^{-1/2} =
  φ^{-3/2}`; the proof uses `coassocY_sq` and `coassocX_sq_add_x` via
  `nlinarith`. No drift.

* Sub-claim (C1): `p = q = x`.
  Lean: NOT a separately stated theorem; (C1) is INSTANTIATED at the
  matrix level by `CoassocBinaryEta` (body line 100), whose argument
  tuple `(x, y, p, q, r) = (coassocX, coassocY, coassocX, coassocX,
  coassocR)` has `p = q = coassocX = x` literally. The semantic
  content of (C1) is therefore enforced by the tuple structure
  passed to `BinaryEta`, not by a separate `coassocP = coassocX`
  theorem. NOTE: this is a DEVIATION from `thm:coassoc`'s
  presentation (which states (C1) as an equation derived in the
  proof's Step 1); the Lean realisation collapses (C1) into the
  definitional substitution at the `BinaryEta` instantiation. The
  semantic equivalence is direct: any computation reading
  `CoassocBinaryEta` sees `p = q = x = coassocX`. No drift in
  content; presentational difference noted.

* Sub-claim (C2): `r² = φ^{-3/2} xy`.
  Lean: `theorem coassoc_r_sq_equation : coassocR^2 = coassocR *
  coassocX * coassocY`, together with `coassoc_r_eq_xy : coassocR
  = coassocX * coassocY` and `coassocR_sq_eq_x_cubed`. At the
  unique positive solution `(x, y, r) = (φ^{-1}, φ^{-1/2},
  φ^{-3/2})`, the RHS `φ^{-3/2} · φ^{-1} · φ^{-1/2} = φ^{-3}` and
  the LHS `(φ^{-3/2})^2 = φ^{-3}`. MATCH. The Lean form
  `coassocR^2 = coassocR · x · y` is equivalent to
  `coassocR · 1 = x · y` after factoring (i.e. `coassocR = xy`,
  which is `coassoc_r_eq_xy`); both encode the (C2) F-symbol
  fixed-point. No drift.

* Sub-claim (Uniqueness): unique strictly positive real solution
  is `(x, y, p, q, r) = (φ^{-1}, φ^{-1/2}, φ^{-1}, φ^{-1},
  φ^{-3/2})`.
  Lean: `theorem coassoc_positive_solution_unique` (body line
  128): for any `(x, y, r)` with `x, y, r > 0` satisfying the
  scalar joint system (with `r² = coassocR * x * y` taking the
  role of (C2) at the unique solution), we have `x = coassocX ∧
  y = coassocY ∧ r = coassocR`. MATCH (for the (x, y, r) triple;
  (p, q) folded into the `BinaryEta` tuple per (C1) note above).
  The proof uses `coassoc_factor_identity` to factor the (N1)+
  (N2)+(C2)-derived polynomial
  `(1 - 2u)² - coassocX³ u (1 - u) = (2 coassocX + 3)
  (u - coassocX²) (u - coassocX)` with `u = x²`, then discards
  the `u = coassocX` root by `x² < 1/2 < coassocX` (using
  `coassocX_gt_half`). No drift.

* Sub-claim (F-fixed-point structure): the (C2) equation arises
  as `(xy, r²) = F^{τττ}_τ · (xy, r²)`.
  Lean: `theorem coassoc_F_comparison` (body line 193):
  `FMatrix coassocX coassocY * coassocComparisonVector =
  coassocComparisonVector`, where `coassocComparisonVector =
  (coassocX coassocY, coassocR²)`. MATCH. This is the explicit
  F-matrix fixed-point check at the unique scalar positive
  solution, realising the displayed equation at
  `summary.tex:1218-1221`. No drift.

* Sub-claim (Coordinate-level isometry): the binary refinement
  `η` defined by the coassoc amplitudes is an isometry in the
  fixed finite coordinate basis.
  Lean: `theorem CoassocBinaryEta_isometry` (body line 106):
  `CoassocBinaryEta.conjTranspose * CoassocBinaryEta = 1`. MATCH
  at the coordinate-matrix level: this is the SCALAR amplitude
  isometry `(N1) ∧ (N2)` packaged through P5.10's
  `BinaryEta_isometry_of_norms`. As the in-source docstring on
  `CoassocBinaryEta_isometry` makes explicit (body lines 104-105),
  this "does not assert categorical coassociativity" — it is
  the finite-coordinate `η^† η = 1` check on the BinaryEta
  parametrisation, NOT the categorical equation.

`def:coassoc` at `summary.tex:1153-1157` (verbatim transcription of
the CATEGORICAL equation):

  η is coassociative if (η ⊗ id) η = (id ⊗ η) η
  (up to the associator, which in Fibonacci is the F-symbol of
   Definition 7.5).

**Per-sub-claim DISAVOWAL** (load-bearing — the canonical
enforcement of CLAUDE.md hallucination-risk callout #3):

* "(η ⊗ id) η = (id ⊗ η) η (up to the associator)": **NO Lean
  decl of this file realises this equation.** None of the SCALAR
  theorems above (`coassoc_one_norm`, `coassoc_tau_norm`,
  `coassoc_r_sq_equation`, `coassoc_positive_solution_unique`,
  `coassoc_F_comparison`, `CoassocBinaryEta_isometry`) is the
  categorical equation. The CATEGORICAL equation requires the
  morphism-level construction (a)–(d) enumerated above in the
  SCALAR-vs-CATEGORICAL section. That construction is OPEN in
  this repo (per `PRD.md:244-247` and `GLOSSARY.md:1118-1128`).

C-gate result: CLEARED for the SCALAR side
(`thm:coassoc` + its (C2) F-symbol-fixed-point sub-claim + the
coordinate-level isometry; all named theorems map verbatim to
`summary.tex` sub-claims). C-gate not applicable to the
CATEGORICAL side (`def:coassoc`), which is EXPLICITLY DISAVOWED
as out-of-scope per the load-bearing per-sub-claim disavowal
above. The Wolfram leg is deferred to Phase 6
(`scripts/wolfram/fibonacci_coassoc.wls`), tracked in a bd
follow-up filed in this commit. The Wolfram script will exercise
the SCALAR side ONLY; per the same disavowal, it must NOT be
interpreted as a check on the categorical equation.

============================================================================
PF ≠ coassoc audit (warn:PF-coassoc cross-reference)
============================================================================

`warn:PF-coassoc` at `summary.tex:1300-1312` states (verbatim):
"The PF and coassociative solutions are numerically distinct: e.g.
`x_PF = 1/√(2+φ) ≈ 0.5257` while `x_coassoc = φ^{-1} ≈ 0.6180`."

This file's `coassocX = φ^{-1} ≈ 0.6180` is the `x_coassoc` of the
warning. P5.10's `pfAmplitude FibLabel.one FibLabel.one FibLabel.one
= 1/√Dsq = 1/√(1 + φ²) = 1/√(2 + φ)` is the `x_PF` of the warning
(via `Dsq = 1 + φ² = 2 + φ` per P5.7's `phi_sq`).

The numerical separation `φ^{-1} ≠ 1/√(2+φ)` is exhibited
structurally:
* `coassoc_one_norm` (this file): `coassocX^2 + coassocY^2 = 1`
  with `coassocX = φ^{-1}`, giving `coassocX^2 = φ^{-2}`.
* `pf_vacuum_normalisation` (P5.7's `Fibonacci/Basic.lean`):
  `1/Dsq + φ^2/Dsq = 1` with the implicit
  `pfAmplitude_one_one_one^2 = 1/Dsq` (P5.10). The PF first
  amplitude is therefore `1/√Dsq = 1/√(2+φ)`, NOT `φ^{-1}`.

The two amplitude triples solve DIFFERENT systems:
* The PF triple `(1/D, φ/D, 1/D, 1/D, √φ/D)` of P5.10 solves the
  quantum-dimension-weighted PF-eigenvector system (`def:PF`),
  i.e. it is the unique sum-to-one row-of-amplitudes weighted by
  `√(d_b d_c / (d_a D²))`.
* The coassoc triple `(φ^{-1}, φ^{-1/2}, φ^{-1}, φ^{-1}, φ^{-3/2})`
  of THIS FILE solves the joint system (N1)+(N2)+(C1)+(C2) of
  `thm:coassoc`, i.e. it is the unique strictly positive real
  solution to the F-symbol fixed-point equation under the algebra
  ansatz `[[conv:1op]]`.

CONFLATING the two amplitude systems is CLAUDE.md hallucination-risk
callout #3. This file's role in P5 is to land the SCALAR
coassoc-amplitude system as named theorems while P5.10 lands the
PF-amplitude system as named theorems; the two are SIBLING
finite-coordinate matrices `CoassocBinaryEta` and `PFBinaryEta`,
both isometries by `BinaryEta_isometry_of_norms`, but with
DIFFERENT amplitude values. Any downstream computation must state
which one it uses.

End of P5.11 docstring extension.
-/

namespace CFTAnyons
namespace Fibonacci

noncomputable section

open Matrix

def coassocX : ℝ := φ⁻¹

def coassocY : ℝ := Real.sqrt φ⁻¹

def coassocR : ℝ := coassocX * coassocY

theorem coassocY_sq : coassocY ^ 2 = coassocX := by
  unfold coassocY coassocX
  exact Real.sq_sqrt phi_inv_nonneg

theorem coassocX_sq_add_x : coassocX ^ 2 + coassocX = 1 := by
  unfold coassocX
  exact phi_inv_sq_plus_inv

theorem coassoc_one_norm : coassocX ^ 2 + coassocY ^ 2 = 1 := by
  rw [coassocY_sq]
  exact coassocX_sq_add_x

theorem coassoc_tau_norm : 2 * coassocX ^ 2 + coassocR ^ 2 = 1 := by
  unfold coassocR
  nlinarith [coassocY_sq, coassocX_sq_add_x]

theorem coassoc_r_eq_xy : coassocR = coassocX * coassocY := rfl

theorem coassoc_r_sq_equation :
    coassocR ^ 2 = coassocR * coassocX * coassocY := by
  rw [coassoc_r_eq_xy]
  ring

theorem coassocX_pos : 0 < coassocX := by
  unfold coassocX
  exact inv_pos.mpr phi_pos

theorem coassocX_gt_half : (1 / 2 : ℝ) < coassocX := by
  have h := coassocX_sq_add_x
  nlinarith [sq_nonneg (coassocX - 1 / 2), coassocX_pos]

theorem coassocY_pos : 0 < coassocY := by
  unfold coassocY
  exact Real.sqrt_pos.mpr (inv_pos.mpr phi_pos)

theorem coassocR_pos : 0 < coassocR := by
  unfold coassocR
  exact mul_pos coassocX_pos coassocY_pos

theorem coassocR_sq_eq_x_cubed : coassocR ^ 2 = coassocX ^ 3 := by
  unfold coassocR
  calc
    (coassocX * coassocY) ^ 2 = coassocX ^ 2 * coassocY ^ 2 := by ring
    _ = coassocX ^ 2 * coassocX := by rw [coassocY_sq]
    _ = coassocX ^ 3 := by ring

/-- The coefficient written in the handoff as `φ^{-1/2}` is the reciprocal of
the positive square root of `φ`. -/
theorem coassocY_eq_inv_sqrt_phi :
    coassocY = (Real.sqrt φ)⁻¹ := by
  unfold coassocY
  rw [Real.sqrt_inv]

/-- The coefficient written in the handoff as `φ^{-3/2}` is represented in
Lean as `φ^{-1} * (sqrt φ)^{-1}`. -/
theorem coassocR_eq_phi_inv_mul_inv_sqrt_phi :
    coassocR = φ⁻¹ * (Real.sqrt φ)⁻¹ := by
  unfold coassocR coassocX
  rw [coassocY_eq_inv_sqrt_phi]

/-- Squared form of the `φ^{-3/2}` coefficient: `r^2 = (φ^{-1})^3`. -/
theorem coassocR_sq_eq_phi_inv_cube :
    coassocR ^ 2 = φ⁻¹ ^ 3 := by
  simpa [coassocX] using coassocR_sq_eq_x_cubed

/-- Positive-square-root form of the `φ^{-3/2}` coefficient. -/
theorem coassocR_eq_sqrt_phi_inv_cube :
    coassocR = Real.sqrt (φ⁻¹ ^ 3) := by
  rw [← coassocR_sq_eq_phi_inv_cube]
  exact (Real.sqrt_sq (le_of_lt coassocR_pos)).symm

/-- The displayed strict binary-composition candidate as a concrete
coordinate matrix in the fixed five-channel binary basis.  This is only the
coordinate-level matrix encoded by the handoff coefficients. -/
def CoassocBinaryEta : Matrix BinaryChannel FibCharge ℂ :=
  BinaryEta ((coassocX : ℝ) : ℂ) ((coassocY : ℝ) : ℂ)
    ((coassocX : ℝ) : ℂ) ((coassocX : ℝ) : ℂ) ((coassocR : ℝ) : ℂ)

/-- The handoff coefficient choice is an isometry in the fixed finite
coordinate basis.  This does not assert categorical coassociativity. -/
theorem CoassocBinaryEta_isometry :
    CoassocBinaryEta.conjTranspose * CoassocBinaryEta = 1 := by
  unfold CoassocBinaryEta
  apply BinaryEta_isometry_of_norms
  · simpa [pow_two] using congrArg (fun t : ℝ => (t : ℂ)) coassoc_one_norm
  · simpa [pow_two, two_mul] using congrArg (fun t : ℝ => (t : ℂ)) coassoc_tau_norm

theorem coassoc_factor_identity_general {a u : ℝ} (ha : a ^ 2 + a = 1) :
    (1 - 2 * u) ^ 2 - a ^ 3 * u * (1 - u) =
      (2 * a + 3) * (u - a ^ 2) * (u - a) := by
  ring_nf at ha ⊢
  linear_combination
    (-2 * a ^ 2 + a * u ^ 2 + a * u - a - u ^ 2 + 4 * u - 1) * ha

theorem coassoc_factor_identity (u : ℝ) :
    (1 - 2 * u) ^ 2 - coassocX ^ 3 * u * (1 - u) =
      (2 * coassocX + 3) * (u - coassocX ^ 2) * (u - coassocX) := by
  exact coassoc_factor_identity_general coassocX_sq_add_x

/-- Positive uniqueness for the scalar coassociative equations appearing in
the handoff derivation.  This is still scalar algebra only; categorical
coassociativity and associator semantics are not constructed here. -/
theorem coassoc_positive_solution_unique {x y r : ℝ}
    (hx : 0 < x) (hy : 0 < y) (hr : 0 < r)
    (h1 : x ^ 2 + y ^ 2 = 1)
    (h2 : 2 * x ^ 2 + r ^ 2 = 1)
    (h3 : r ^ 2 = coassocR * x * y) :
    x = coassocX ∧ y = coassocY ∧ r = coassocR := by
  have hr2 : r ^ 2 = 1 - 2 * x ^ 2 := by nlinarith [h2]
  have hy2 : y ^ 2 = 1 - x ^ 2 := by nlinarith [h1]
  have hpoly : (1 - 2 * x ^ 2) ^ 2 =
      coassocX ^ 3 * x ^ 2 * (1 - x ^ 2) := by
    calc
      (1 - 2 * x ^ 2) ^ 2 = (r ^ 2) ^ 2 := by rw [hr2]
      _ = (coassocR * x * y) ^ 2 := by rw [h3]
      _ = coassocR ^ 2 * x ^ 2 * y ^ 2 := by ring
      _ = coassocX ^ 3 * x ^ 2 * (1 - x ^ 2) := by
            rw [coassocR_sq_eq_x_cubed, hy2]
  have hzero :
      (2 * coassocX + 3) * (x ^ 2 - coassocX ^ 2) *
          (x ^ 2 - coassocX) = 0 := by
    have hf := coassoc_factor_identity (x ^ 2)
    nlinarith [hf, hpoly]
  have hx2_lt_half : x ^ 2 < 1 / 2 := by
    nlinarith [sq_pos_of_pos hr, h2]
  have hx2_ne_x : x ^ 2 - coassocX ≠ 0 := by
    have hx2_lt_x0 : x ^ 2 < coassocX := by
      nlinarith [hx2_lt_half, coassocX_gt_half]
    nlinarith
  have hcoef_ne : 2 * coassocX + 3 ≠ 0 := by
    nlinarith [coassocX_pos]
  have hx2_eq : x ^ 2 = coassocX ^ 2 := by
    have hz := mul_eq_zero.mp hzero
    cases hz with
    | inl hleft =>
        have hzleft := mul_eq_zero.mp hleft
        cases hzleft with
        | inl hcoef => exact False.elim (hcoef_ne hcoef)
        | inr hxpart => nlinarith [hxpart]
    | inr hright => exact False.elim (hx2_ne_x hright)
  have hx_eq : x = coassocX := by
    have hor := sq_eq_sq_iff_eq_or_eq_neg.mp hx2_eq
    cases hor with
    | inl h => exact h
    | inr hneg => nlinarith [hx, coassocX_pos, hneg]
  have hy_sq_eq : y ^ 2 = coassocY ^ 2 := by
    rw [coassocY_sq]
    nlinarith [h1, hx_eq, coassocX_sq_add_x]
  have hy_eq : y = coassocY := by
    have hor := sq_eq_sq_iff_eq_or_eq_neg.mp hy_sq_eq
    cases hor with
    | inl h => exact h
    | inr hneg => nlinarith [hy, coassocY_pos, hneg]
  have hr_sq_eq : r ^ 2 = coassocR ^ 2 := by
    rw [h3, hx_eq, hy_eq]
    unfold coassocR
    ring
  have hr_eq : r = coassocR := by
    have hor := sq_eq_sq_iff_eq_or_eq_neg.mp hr_sq_eq
    cases hor with
    | inl h => exact h
    | inr hneg => nlinarith [hr, coassocR_pos, hneg]
  exact ⟨hx_eq, hy_eq, hr_eq⟩

def coassocComparisonVector : Matrix Two (Fin 1) ℝ :=
  !![coassocX * coassocY; coassocR ^ 2]

theorem coassoc_F_comparison :
    FMatrix coassocX coassocY * coassocComparisonVector =
      coassocComparisonVector := by
  ext i j
  fin_cases i <;> fin_cases j <;>
    simp [FMatrix, coassocComparisonVector, Matrix.mul_apply]
  · rw [coassoc_r_eq_xy]
    have hx : coassocX + coassocX ^ 2 = 1 := by
      nlinarith [coassocX_sq_add_x]
    calc
      coassocX * (coassocX * coassocY) +
          coassocY * (coassocX * coassocY) ^ 2
          = coassocX * coassocY *
              (coassocX + coassocX * coassocY ^ 2) := by ring
      _ = coassocX * coassocY * (coassocX + coassocX ^ 2) := by
            rw [coassocY_sq]
            ring
      _ = coassocX * coassocY * 1 := by rw [hx]
      _ = coassocX * coassocY := by ring
  · rw [coassoc_r_eq_xy]
    have hx : coassocX - coassocX ^ 3 = coassocX ^ 2 := by
      nlinarith [coassocX_sq_add_x]
    calc
      coassocY * (coassocX * coassocY) -
          coassocX * (coassocX * coassocY) ^ 2
          = coassocY ^ 2 * (coassocX - coassocX ^ 3) := by ring
      _ = coassocY ^ 2 * coassocX ^ 2 := by rw [hx]
      _ = (coassocX * coassocY) ^ 2 := by ring

end

end Fibonacci
end CFTAnyons
