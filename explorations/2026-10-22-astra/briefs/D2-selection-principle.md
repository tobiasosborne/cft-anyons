# Astra exploration brief — D2-selection-principle

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
- Write ONLY inside `explorations/2026-10-22-astra/D2-selection-principle/`. Deliver
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
### D2. A model-independent selection principle for the Hamiltonian from the history sum

Read: CA-86 and CA-87 (branch, see above), CA-14 and CA-70 (Koo-Saleur
prototypes), `git show origin/claude/festive-franklin-rl8kty:references/string-net/LevinWen2005/source/strnet.tex`,
`references/cft/AasenFendleyMong2020/` (weights sum_chi A(chi) P^(chi),
topological defect lines commuting with the Hamiltonian), the Koo-Saleur and
Zhou-Batchelor sources under `references/lattice-symmetry/`, and
`references/lattice-symmetry/ChelkakGlazmanSmirnov2016/` (discrete
holomorphicity / lattice stress tensor).

The problem. For general C and site object O, a nearest-neighbour Hamiltonian
is a point c = (c_alpha) in the finite-dimensional space End_C(O (x) O)
(tile basis). The history sum of CA-86 gives the imaginary-time path integral
as (topological C-evaluation) x (geometric tile weights). Nothing in the repo
says which point c to choose, except by importing a known model. Find the
principle, as equations on c for arbitrary C.

Questions:

1. Isotropy restoration / scale invariance. Levin-Wen's rules are motivated
   by scale invariance of a fixed point. Formulate "the history sum becomes
   isotropic (rule 1) in the continuum" as a renormalisation condition on
   the tile weights: define a coarse-graining map on tile ensembles
   (blocking 2x2 plaquettes of the brick lattice, re-expanding the
   composed morphism in tiles) and write the fixed-point / linearised
   fixed-point equations. Which c are fixed points? What is the role of
   the C-evaluation (Ev_C is coarse-graining invariant by construction)?
2. Integrability as a selection principle. A commuting transfer family
   (Proposition 86.3) is equivalent to a solution R(u) in End_C(O (x) O)
   of the Yang-Baxter equation on O^{(x)3} (categorical YBE, a finite
   polynomial system in the tile coefficients, with Ev_C supplying the
   structure constants: F-symbols). Write the general equations. When does
   the TL quotient (loop case) exhaust the solutions and when are there
   genuinely new ones (vertex tiles)? What continuum data (central charge,
   spectrum) does a YBE solution predict in terms of C-data, via the
   sourced results on TL/RSOS? Is Baxterisation of the braid group
   representation furnished by the R-matrix of a braided C a general
   solution? Treat this carefully: it is model-independent only if stated
   for the braided C.
3. Lattice holomorphicity. Chelkak-Glazman-Smirnov give a discrete
   holomorphic observable whose existence pins the critical weights. Is
   there a categorical version: an element of End_C(O (x) O) (or a
   two-point morphism) whose discrete Cauchy-Riemann relation under the
   history sum holds iff c sits at a critical point? Formulate.
4. Topological symmetry as a constraint. Aasen-Fendley-Mong: every C-chain
   carries C as topological defect lines commuting with any H built from
   C-morphisms. Explain, in general, why this makes the continuum limit's
   symmetry category contain C, and what this constrains about c. Keep
   this as a bridge to D5.

Deliver: the general equations (with Ev_C structure constants), what is
provable about their solution sets, and a ranked list of which principle is
most likely to be sufficient. Examples only in the table.
