# Astra exploration brief — D6-functor-and-obstruction-theory

You are an exploratory research mathematician working in the repository at the
current directory (`/home/tobias/Projects/cft-anyons`). Read `AGENTS.md` first,
top to bottom. The Three Laws and the numbered Rules bind you. **Rule 16 and
the north-star paragraph "Models are examples, never the subject" bind you
with special force in this task**: Tobias has stated that hyperfixation on a
model example (Fibonacci, Ising, semion, golden chain, a coset) is THE failure
mode that stalled this project repeatedly. Work for a general unitary fusion /
modular tensor category C with declared extra data. A specific category may
appear only in a single examples table at the end of your note, or inside a
small check, to calibrate or falsify a general statement. If you catch
yourself deriving a model-specific fact that does not feed the general
construction, stop and lift it or drop it.

**Aim high.** Tobias's words: "if anyone can land a big conjecture it would be
Astra." Your note must state ONE headline conjecture of theorem-grade
ambition for general C (precise hypotheses, precise conclusion), and give the
strongest partial proof, reduction, or structural evidence you can for it,
with the gap between what is proved and what is conjectured stated exactly.
Supporting lemmas with full proofs are welcome; the headline is mandatory.

## The programme and the integration goal (2026-10-22)

North star (AGENTS.md): a constructive, provable pipeline from category data
to local lattice models with lattice Virasoro (Koo-Saleur) generators, whose
operator-algebraic-renormalisation (OAR) continuum limit is a rigorous CFT
realising the input modular data with full projective-unitary symmetry.

Several approaches have been investigated separately and must now be aligned
and integrated. Each brings a layer the others lack:

- Variable-N categorical tower (report shards CA-62..CA-74, `src/*.jl` July
  modules): site object O = 1 (+) X, chain algebra A_L = End_C(O^{(x)L}),
  vacuum-insertion refinement isometries, placement category, GNS descent
  with vacuum-defect scalar 2(1-sqrt(omega(P))), categorical residuals.
  Exact finite-L lemmas, no dynamics.
- Spacetime / Levin-Wen Trotter dictionary (shards CA-86, CA-87 on the git
  branch `origin/claude/festive-franklin-rl8kty`; read with
  `git show origin/claude/festive-franklin-rl8kty:report/sections/86_spacetime_trotter_dictionary.tex`
  and `git show origin/claude/festive-franklin-rl8kty:report/sections/87_dilute_fibonacci_is_blocked_golden.tex`):
  brick-wall Trotter expansion of a Hamiltonian H = -sum_j h_j, h_j in
  End_C(O (x) O), is a sum over string-net histories whose amplitude is
  Ev_C(history) (obeys Levin-Wen rules 2-4) times anisotropic tile weights
  (breaks rule 1, isotopy). CA-87 Lemma 87.1: if O = Y (x) Ybar then the
  O-chain is the dense Y-chain with sites paired (a blocking criterion).
- OAR contracts from the previous Astra session (`cft_machine/research/wilson_triangle.md`
  WT-1: summable dual-norm drift of refined states gives an inductive-limit
  state; `cft_machine/research/virasoro_routes.md` VR-1: graph-norm bounds
  A1-A4 on lattice modes give a Virasoro representation on a common domain;
  `cft_machine/benchmarks/fermion/WILSON_PROOF.md`, `PROOF.md`: the only
  quantitative instances, free fields only). VR-1 has NO instance in the repo.
- Local conformal sewing / fidelity equations (`reconstruction/01_cells.md`
  .. `13_semion_multiplicity.md`, especially 01-05, 09, 10, 04): cell
  amplitudes, Ward/stress equations, obstruction complexes, four-port sewing
  with graded positivity, LC-4's list of microscopic certificates. Continuum
  side only; no lattice object.
- `cft_machine/research/realisation_and_fidelity.md`: an MTC fixes c only
  mod 8; the compiler must take enriched data. `reconstruction/12_fibonacci_four_port.md`
  section 5: a c>1 target needs an extended chiral algebra beyond Virasoro.

Read the files named in YOUR direction below before writing. You may read
anything else in the repo. `references/` and `literature/` are the kept
ground truth; cite them by path:line. Do not paraphrase a paper from memory;
if a needed source is not local, record the gap.

## Rules of engagement

- Hard, speculative, analytic work is wanted. Propose theorems, prove what
  you can with Lamport-style structured proofs (explicit ASSUME / PROVE,
  numbered steps <1>1, <2>1, ...), and label every statement honestly:
  proven / conditional (hypotheses listed) / conjectural / scaffold /
  negative. Say explicitly which hypotheses would still have to be
  synthesised from category data.
- Write ONLY inside `explorations/2026-10-22-astra/D6-functor-and-obstruction-theory/`. Deliver
  `NOTE.md` (the main note, as long as it needs to be, ~300-800 lines) and,
  if you run any symbolic check, `checks/` with the script and its raw
  output. Do not edit any other file in the repository. Do not commit.
- Compute is a laptop in use for a video call: small SymPy / NumPy checks
  are fine; no Julia test suite, no matrices beyond ~1000x1000, no network.
- Conventions: before relying on a sign, gauge, normalisation or indexing
  choice, check `CONVENTIONS.md` (entries (a)-(ai)); if you need a new
  one, state it in your note under "Conventions proposed" rather than
  editing CONVENTIONS.md.
- Structure `NOTE.md` as: title and status line; "Headline conjecture"
  (first, so a reader sees the ambition immediately); the body; then these
  closing sections in this order: "Results ledger" (one line per statement
  with status), "What this gives the integration" (how your result plugs
  into the other approaches, naming shards/notes), "Open problems",
  "Examples table" (the only place a model name may carry model-specific
  detail), "Sources used" (path:line).
- A sceptical Opus reviewer will try to refute your note and lift it into a
  model-independent integration shard. Write for that reader.

## Your direction
### D6. The functor's type signature and its obstruction theory (integrating skeleton)

Read: `reconstruction/README.md`, `01_cells.md` .. `05_mixed_complex.md`
(obstruction complexes: innerness HH^1, central CE 2-cocycle, sewing H^3,
mixed complex), `06`, `07` (small-category Hochschild computations),
`cft_machine/research/wilson_triangle.md`, `virasoro_routes.md`,
`equivariant_oar.md`, `realisation_and_fidelity.md`, CA-01 (pipeline),
CA-15, CA-67, CA-81 (the four acceptance contracts), CA-62 (BU pipeline
vision), CA-71..73 (placement functoriality, descent), CA-86 (branch),
`reviews/2026-07-06_pipeline_consistency_scoping/PLAN.md` (seams S1-S4,
decisions D1-D4). Also any local source on deformation theory of algebras,
Hochschild/cyclic cohomology, 2-categories of algebras and bimodules,
and on the Osborne-Stottmeister OAR (`literature/md/2010.11121/`).

The problem. The north star asks for "an algorithm, or functor" from
category data to lattice towers with symmetry generators whose limit is a
CFT. Four separate pipeline definitions and four acceptance contracts exist
in the repo and have never been reconciled. The reconstruction notes
compute obstruction classes for fragments of the problem without a
definition of the whole. Define the whole, precisely, and compute what
obstructs it.

Questions:

1. Source and target. Define the source category precisely: objects are
   (C, extra data) where C is a unitary fusion/modular category and the
   extra data is the minimal declared enrichment (c lift, characters or
   chiral algebra extension, chiral/full choice); morphisms are (braided)
   equivalences or something weaker. Define the target: a "lattice tower
   with symmetry" T = (A_n, alpha_n, H_n, omega_n, T_{n,k}, defect
   operators) with the axioms the approaches above impose (locality in a
   declared support structure, refinement isometry, WT-1 drift, VR-1
   bounds, defect-line action). What are the morphisms of targets (so that
   "functor" is meaningful and "two constructions agree" is a statement)?
   What equivalence relation on targets does the continuum limit factor
   through (OAR equivalence)?
2. The reconciled contract. Merge CA-15, CA-67, CA-81 and LC-4 into ONE
   list of axioms on T, each labelled by which approach supplies a
   construction and which supplies a proof obligation, and identify the
   two unwritten links: the history sum (CA-86) as the lattice avatar of
   the sewing equations (LC-1), and the CA-72 defect scalar as the input
   of WT-1's drift bound.
3. Obstruction theory of the whole. Given the target axioms, set up the
   deformation complex of a candidate T (the reconstruction notes have
   fragments: Hochschild for the algebra, CE for the Lie action, a sewing
   complex, a mixed complex; LC-3 says the full complex was not built).
   Build it, or prove it cannot be a single complex (LC-4 notes that
   delta_n is not square-zero). Identify the universal obstruction
   classes: which cohomology group must vanish, or which class must match
   the declared extra data (the central charge as a CE class; the c mod 8
   ambiguity as a torsor), for a functor to exist. Where do the known
   no-gos (CA-67 checklist, Kliesch-Koenig, Jones) sit as obstruction
   classes?
4. Existence strategy. Given the obstruction theory, propose the general
   existence argument: an inductive construction over n with obstructions
   killed at each step by choosing the dressing U_n and the coupling c, or
   a fixed-point argument. State the theorem you would aim to prove and
   the lemmas it needs, mapped to the approaches that would supply them.

Deliver precise definitions, structured proofs where possible, the merged
contract as a table, and the obstruction classes. This note is the
integrating skeleton the Opus reconcilers will build the integration shard
from, so define everything for general C. Examples only in the table.
