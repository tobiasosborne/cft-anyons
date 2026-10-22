# Astra exploration brief — D5-fidelity-lattice-sewing

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
- Write ONLY inside `explorations/2026-10-22-astra/D5-fidelity-lattice-sewing/`. Deliver
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
### D5. Fidelity: the lattice avatar of the sewing equations and the role of topological defect lines

Read: `reconstruction/01_cells.md`, `02_obstructions.md`, `03_sewing_deformations.md`,
`09_four_port_equations.md`, `10_four_port_linearization.md`,
`12_fibonacci_four_port.md` section 5 (character growth), `13_semion_multiplicity.md`
(graded vs pointwise positivity), `cft_machine/research/realisation_and_fidelity.md`
(an MTC fixes c only mod 8; enriched data), `reviews/2026-07-06_pipeline_consistency_scoping/PLAN.md`
(decision D1: chiral vs full CFT), CA-86 (branch; the history sum),
`references/cft/AasenFendleyMong2020/` (topological defect lines on C-chains),
CA-67 (OAR requirements, no-go checklist), any local source on conformal
nets / sector categories / DHR / Kawahigashi-Longo-Mueger, and on
modular invariance / Verlinde / Cardy conditions (grep `literature/md` and
`references/`).

The problem. The reconstruction notes formulate continuum sewing / Ward /
four-port equations for carriers labelled by C, but no lattice object
realises them. CA-86 gives a lattice imaginary-time path integral whose
amplitudes are C-evaluations of string-net histories. And fidelity (the
limit realises C, not merely some CFT) has never been formulated as a
checkable condition on a lattice construction.

Questions (general C, declared extra data):

1. Lattice cells. Define a lattice cell as a finite spacetime patch of the
   brick lattice of CA-86 with boundary carriers (the boundary labels of
   the string-net histories cut by the patch boundary), and the cell
   amplitude as the partial history sum. Show that sewing = composition of
   patches, and write the lattice analogues of LC-1's C0-C7 (typing,
   positivity via reflection, sewing, Ward identity with a discrete
   stress tensor, curvature). Which continuum equations have exact lattice
   versions and which only hold asymptotically? Where does the
   categorical dual-basis issue of LC-9 (F^{-T} vs F) appear on the lattice?
2. Fidelity as a theorem shape. The chain carries C as topological defect
   lines commuting with H (Aasen-Fendley-Mong, general for any C-chain).
   Formulate the general claim: if the OAR limit exists (WT-1) and the
   defect operators converge (VR-1-type bounds), then the continuum net
   carries a C-action by localised endomorphisms / defects, hence its
   sector category contains (a braided-equivalent copy of) C's Drinfeld
   centre or C itself. Be precise about chiral vs full: a C-chain of a
   modular C realises what? This is decision D1. State what extra data
   (c mod 8 lift, characters, extension by a chiral algebra) must be
   declared and where it enters.
3. Modular bootstrap on the lattice. The torus partition function of the
   history sum at finite size, in the scaling limit, must be a modular
   invariant combination of characters of the target chiral algebra.
   Formulate the general constraint that C's modular data imposes
   (Verlinde; existence of a modular invariant for the chosen extension)
   and how the lattice defect lines give the Verlinde lines whose spectrum
   is fixed by S. Write it as a lemma with hypotheses.
4. Positivity. LC-13 shows graded Hilbert positivity differs from pointwise
   positivity. On the lattice, reflection positivity of the history sum
   (CA-86 tile weights) is the avatar. Formulate reflection positivity of
   the brick-lattice history sum for general C in terms of the tile
   coefficients c_alpha and the dagger structure of C; derive the
   constraints on c that it imposes. Relate to the OS-type reconstruction
   that LC-4 needs.

Deliver general lemmas/theorems with structured proofs, the explicit list of
declared extra data, and open problems. Examples only in the table.
