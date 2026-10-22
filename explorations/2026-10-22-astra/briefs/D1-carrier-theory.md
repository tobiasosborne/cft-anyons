# Astra exploration brief — D1-carrier-theory

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
- Write ONLY inside `explorations/2026-10-22-astra/D1-carrier-theory/`. Deliver
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
### D1. Intrinsic theory of the variable-N carrier and the blocking criterion

Read: CA-65, CA-66, CA-68, CA-69, CA-71, CA-72, CA-73 (report/sections/65..73),
CA-87 (branch, see above), CONVENTIONS (r), (b); `references/text/PenneysUnitaryFusionCategories.md`
(unitary fusion categories, algebra objects, module categories, if present);
anything under `references/` or `literature/md/` on algebra objects, Morita
equivalence, Q-systems, Jones towers, anyon chains / RSOS models.

Questions (general C, general site object O, with special attention to
O = 1 (+) X but NOT restricted to it):

1. Lemma 87.1 says: if O = Y (x) Ybar then End_C(O^{(x)L}) is the dense
   Y-chain algebra on 2L sites with sites paired. Generalise and
   intrinsify. Formulate precisely what "the variable-N tower for site
   object O" is as a categorical invariant: a tower of algebras with
   inclusions A_L -> A_{L+1} (vacuum insertion), with a number filtration.
   Is the tower determined by the Morita class of the algebra object
   O (x) Obar, or by the module category C_O? When are two site objects
   O, O' equivalent (isomorphic towers compatible with refinement)?
2. The number grading. Vacuum insertion makes N (number of X-occupied
   sites) a filtration, and the Hamiltonian need not preserve it. Give the
   intrinsic meaning of the number-changing part of End_C(O (x) O): as a
   bimodule, as the "off-diagonal" part relative to the decomposition
   O (x) O = 1 (+) 2X (+) X (x) X. Characterise categories/site objects for
   which there is a genuinely new structure beyond blocked dense chains
   (CA-87 says: whenever 1 (+) X is not of the form Y (x) Ybar). Is the
   obstruction to being of that form a computable invariant (a dimension
   condition, a Frobenius-Perron condition, an algebra-object condition)?
3. Refinement intrinsically. CA-68's vacuum insertion V_L and CA-71's
   placement category: describe them as functors or natural
   transformations of the tower, and identify the universal property (if
   any) of vacuum insertion among local charge-preserving isometries
   A_L -> A_{2L}. Is the Jones basic construction / conditional expectation
   structure of the algebra object the right language, so that the tower
   of refinements is a Jones tower? What does the CA-72 defect scalar
   2(1-sqrt(omega(P))) become in that language?
4. Speculate (clearly labelled) on whether the variable-N carrier is the
   right lattice avatar of a continuum "indefinite particle number" Fock
   structure for an anyonic field theory, and what general theorem would
   express that. Tobias holds that indefinite anyon number is central to
   progress; your job is to find the precise general statement that would
   make that true or show what it must mean.

Deliver general statements with proofs or precise conjectures; put every
specific category in the examples table.
