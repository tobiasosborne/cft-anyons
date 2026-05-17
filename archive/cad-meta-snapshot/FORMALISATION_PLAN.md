# Formalisation Plan

This project formalises the definitions, theorem targets, and conjectures in
`handoff.md`. The standard of acceptance is deliberately high: every accepted
definition or external mathematical fact must be tied to local source material,
and every accepted theorem should pass three independent checks wherever the
claim is suitable for all three tools.

## Non-Negotiable Rules

1. Ground truth must be local.
   Every admitted definition, external theorem, equation, or standard fact must
   string-match a claim or equation in a locally downloaded PDF, extracted text
   file, or paper markdown file. Project definitions may be introduced, but they
   must be explicitly marked as project definitions rather than external facts.

2. AF proof trees are the source of proof workflow truth.
   Each theorem target and conjecture gets an `af` proof tree or an indexed node
   in a shared `af` proof workspace. The tree records definitions, references,
   computational evidence, Lean files, proof gaps, verifier challenges, and final
   status.

3. Verifiers must be fresh subagents, used serially.
   For every verification job, spawn a fresh new verifier subagent. Use one
   verifier subagent per job, and never have more than one subagent alive,
   working, or queued at a time. Work serially. Verifiers must be told
   explicitly that finding counterexamples, gaps, ambiguous definitions,
   missing provenance, and errors are high-value successful outcomes.

4. Three independent checks are required for acceptance when applicable.
   The target acceptance bar is:
   - Julia: numerical examples, random finite-dimensional checks, or exhaustive
     small finite cases.
   - WolframScript: exact symbolic algebra or independent symbolic solving.
   - Lean: formal theorem statement and proof, or a precisely documented reason
     the result remains pending in Lean.
   If a claim cannot sensibly be checked by all three tools, the provenance entry
   must explain why. Such a claim remains weaker than a fully accepted theorem.

5. Lean-worthiness is the default.
   Prefer finite-dimensional, skeletal, matrix, and combinatorial formulations
   that can be stated and proved in Lean. Avoid informal category-theoretic
   shortcuts unless they are quarantined as documentation or conjectural
   scaffolding.

6. No silent admissions.
   Any use of an external result must appear in the master provenance document
   with source path, source quote or string-match locator, hash, and dependency
   list. Any unproved step must be labelled pending, conjectural, assumed, or
   admitted.

7. Continue through compaction.
   Maintain durable files so work can continue after context compaction:
   `FORMALISATION_PLAN.md`, `MASTER_PROVENANCE.md`, AF ledgers, Lean files,
   Julia/Wolfram scripts, generated check outputs, and the final LaTeX document.

8. Do not stop for ordinary uncertainty.
   Continue working through routine gaps by reducing statements, proving finite
   special cases, or marking precise pending lemmas. Stop or escalate only when a
   major blocker completely halts progress.

## Repository Structure

Planned durable structure:

```text
.
├── FORMALISATION_PLAN.md
├── MASTER_PROVENANCE.md
├── handoff.md
├── references/
│   ├── *.pdf
│   └── text/
├── af/
│   ├── master/
│   └── theorem-*/
├── Formalisation/
│   ├── Basic.lean
│   ├── LinearAlgebra.lean
│   ├── FusionData.lean
│   ├── Fibonacci.lean
│   ├── FineGraining.lean
│   ├── RG.lean
│   └── OperatorChannels.lean
├── scripts/
│   ├── julia/
│   └── wolfram/
├── results/
│   ├── julia/
│   ├── lean/
│   └── wolfram/
└── tex/
    └── formalisation.tex
```

## Source Corpus Plan

Initial local sources already present in this repository:

- `references/FibonacciAnyonModels.pdf`
- `references/IsingLikeFibonacciAnyonsKZ.pdf`
- `references/TemperleyLiebRootsJonesQuotient.pdf`
- `references/StringNetCondMat0510613.pdf`
- extracted text under `references/text/`

Additional local source material from `../microscopic-mobile-anyons` should be
copied or referenced with hashes, then extracted into this repository as needed:

- Penneys unitary fusion category notes.
- Etingof-Nikshych-Ostrik, "On fusion categories".
- Bridgeman-Hahn-Osborne-Wolf, "Gauging defects in quantum spin systems".
- Feiguin et al., "Interacting anyons in topological quantum liquids: The
  golden chain".
- Garjani-Ardonne, "Anyon chains with pairing terms".
- Hollands, "Anyonic Chains, alpha-Induction, CFT, Defects, Subfactors".
- Stottmeister, "Anyon braiding and the renormalization group".
- Osborne and Stottmeister OAR and wavelet papers.
- Poilblanc/itinerant anyon papers if needed for mobile-anyon Hilbert-space
  comparisons.

Each imported source gets:

- original path or URL,
- local path,
- SHA256 hash,
- extracted text path,
- role in this project,
- exact claims supported.

## Master Provenance Document

Create `MASTER_PROVENANCE.md` with one entry per claim. Each entry has:

```text
Claim ID:
Kind: external fact | project definition | theorem | conjecture | computation
Statement:
Source requirement:
Local source path:
String-match locator:
Source hash:
AF workspace/node:
Lean file/theorem:
Julia check:
WolframScript check:
Dependencies:
Status: pending | challenged | accepted | rejected | conjectural
Notes:
```

No theorem in the LaTeX document may appear without a provenance entry.

## AF Workflow

Use `af` as follows:

1. Create a master proof workspace for the global dependency map.
2. Create a separate proof workspace for each theorem target when the tree is
   large enough to merit isolation.
3. For each proof node:
   - add definitions with `af def-add`;
   - add local references with `af add-external`;
   - attach Julia, WolframScript, and Lean output with `af attach`;
   - submit proof nodes only after provenance is explicit.
4. Verification rule:
   - spawn one fresh verifier subagent for exactly one verification job;
   - never run more than one subagent at a time;
   - wait for or close the current verifier before starting another verifier;
   - instruct it that counterexamples, gaps, missing assumptions, bad notation,
     and false claims are high-value successes;
   - record its findings as AF challenges or acceptances.

## Lean Strategy

Do not begin with full category theory. Start with finite skeletal data and
finite-dimensional linear algebra.

Phase 1: foundational finite model.

- Define finite labels, unit label, fusion multiplicities.
- Define words/configurations of labels.
- Define formal direct sums and finite component indexing.
- Define Hom dimensions combinatorially when possible.
- Define linear maps as finite matrices.
- Define dagger, identity, composition, isometry, unitary, projection.

Phase 2: general finite-dimensional theorems.

- Direct-sum Hom expansion.
- If `E^\dagger E = I`, then postcomposition by `E` is an isometry.
- Component orthogonality for an isometry between direct sums.
- Tensor/block isometry: tensor product of isometries is an isometry.
- Dressing: unitary after an isometry is an isometry.
- Polar/no-mixing scalar fine-graining formula.
- Ascending channel properties for `A(X) = E^\dagger X E`.

Phase 3: Fibonacci exact model.

- Define labels `one`, `tau`.
- Define fusion rules.
- Define exact algebraic constants for `phi`.
- Prove `phi^2 = phi + 1`, `phi^{-1} = phi - 1`, and related identities.
- Prove the Fibonacci `F` matrix is orthogonal/unitary and involutive.
- Prove general binary Fibonacci isometry conditions.
- Prove Perron-Frobenius amplitude normalisation.
- Prove the coassociative candidate equations or isolate the exact missing
  associator assumptions.
- Prove RG no-mixing normalisations conditionally on input coefficients.

Phase 4: operator/RG structure.

- Formalise finite-dimensional ascending channels.
- Formalise scaling-operator statements as conditional linear algebra:
  if the RG matrix is diagonal in a chosen scaling basis with entries
  `b^{-h_i}` or `b^{-\Delta_i}`, then those basis elements are eigenoperators.
- Formalise the charge-only negative example as a finite matrix counterexample
  or parameterised non-equality.

## Julia Strategy

Julia is used for finite examples and numerical falsification.

Scripts should live under `scripts/julia/` and write results under
`results/julia/`.

Initial checks:

- Fibonacci fusion rules and fusion-tree basis enumeration.
- Exact/numerical `F` matrix checks.
- General binary `eta` isometry checks.
- Perron-Frobenius map normalisation.
- Coassociative candidate comparison.
- RG amplitudes as functions of `rho`.
- Polar-decomposition amplitude formula on random full-rank matrices.
- Ascending-channel unitality and positivity on random matrices.
- Charge-only negative example showing generic mismatch with `b^{-2/5}`.

The deprecated Julia package in `../microscopic-mobile-anyons` can be used as a
reference implementation, but any reused computation must be copied or wrapped
in this repository and recorded in provenance.

## WolframScript Strategy

WolframScript is used for independent exact algebra.

Scripts should live under `scripts/wolfram/` and write results under
`results/wolfram/`.

Initial checks:

- Exact identities in `Q(sqrt(5))`.
- `F^T F = I` and `F^2 = I`.
- Perron-Frobenius normalisation identities.
- Coassociative equation solving under positivity assumptions.
- Scalar polar/no-mixing amplitude derivation.
- Small symbolic ascending-channel spectra.

## LaTeX Deliverable

Create `tex/formalisation.tex`, a self-contained pdflatex document containing:

- all definitions in plain language;
- theorem statements;
- proofs;
- conjectures clearly marked as conjectures;
- provenance references for every external fact;
- no unexplained acronyms or jargon;
- appendix tables for Lean, Julia, WolframScript, and AF status.

The LaTeX document must not promote a pending or conjectural claim to a theorem.

## Priority Order

1. Establish provenance machinery and AF workspace skeleton.
2. Fibonacci exact algebra: constants, fusion rules, `F` matrix.
3. Binary fine-graining isometry conditions.
4. Perron-Frobenius and coassociative Fibonacci maps.
5. General finite-dimensional isometry and component theorems.
6. Polar decomposition and RG amplitude formula.
7. Ascending observable channels.
8. Scaling-operator conditional theorem and charge-only negative example.
9. Braiding/exchange theorem if the required categorical assumptions are pinned
   down enough for a Lean-worthy finite model.
10. Direct-limit and operadic continuum conjectures, clearly labelled.

## Completion Criterion

A theorem is accepted only when:

- the statement is precise and scoped;
- every external input has local string-matched provenance;
- Julia evidence exists where applicable;
- WolframScript exact evidence exists where applicable;
- Lean proof exists where feasible, or a sharply delimited Lean blocker is
  recorded;
- a fresh verifier subagent has reviewed the specific job and either accepted it
  or produced challenges that were resolved in AF.
