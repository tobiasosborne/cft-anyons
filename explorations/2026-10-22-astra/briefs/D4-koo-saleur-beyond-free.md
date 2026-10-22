# Astra exploration brief — D4-koo-saleur-beyond-free

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
- Write ONLY inside `explorations/2026-10-22-astra/D4-koo-saleur-beyond-free/`. Deliver
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
### D4. Koo-Saleur in categorical tile form and VR-1's hypotheses beyond free fields

Read: `cft_machine/research/virasoro_routes.md` (VR-1 with A1-A4, VR-2),
`cft_machine/benchmarks/fermion/PROOF.md` (KS mode defect bound, the
"no-wrap" lesson), `cft_machine/reviews/virasoro_referee.md:140-170` (the
open objection: the fixed-core estimate is not a uniform graph-norm bound),
CA-14, CA-70, CA-81, CA-83 (coset stress CR-2/CR-3), CA-85 (locality gap),
`references/lattice-symmetry/KooSaleur1993/`,
`references/lattice-symmetry/GransSamuelssonEtAl2020/` (KS for TL chains in
all representations), `references/lattice-symmetry/ZiniWang2018/` and
`HonglerKytolaViklund2022/` if present, `references/cft/AasenFendleyMong2020/`
(topological defect lines), `reconstruction/12_fibonacci_four_port.md`
section 5 (a c>1 target needs an extended chiral algebra).

The problem. VR-1 is a clean conditional theorem with no instance anywhere,
not even for free fermions (fixed-core only). The lattice Virasoro modes are
Koo-Saleur modes built from the Hamiltonian density. For a general C-chain
nothing says how to get A2 (uniform graph-norm bounds), A3 (summable
transport defects under refinement) or A4 (vanishing commutator residuals).
And when the target has c>1 (forced by character growth for many C),
Virasoro modes alone cannot certify fidelity.

Questions (general C, H = -sum_j h_j with h_j in End_C(O (x) O)):

1. Write the KS modes T_{N,n} in tile form for general C (the density
   h_j is a tile combination; the Fourier sum; the velocity and the
   subtraction of the ground-state energy density; the no-wrap
   modification of the fermion proof). State precisely what regularity
   operator K_N (VR-1 A1) is natural: H_N itself shifted, or a Casimir-like
   operator built from the transfer matrix (an integrable line) or from
   the C-defect operators.
2. Attack A2 and A4 in general. Grans-Samuelsson et al. have results for
   TL chains in arbitrary representations: extract the general mechanism
   (what structure of TL makes KS work) and state it as a hypothesis on
   End_C(O (x) O) that a general C-chain could satisfy. Identify EXACTLY
   which step of the free-fermion PROOF.md (independent two-mode blocks /
   quadratic Hamiltonian) fails for an interacting chain and what could
   replace it: Lieb-Robinson plus momentum-sector spectral arguments, an
   integrable-line argument, or conformal perturbation theory around the
   fixed point. Formulate a theorem "if the chain has property P
   (model-independent) then A2, A4 hold" with the strongest P you can justify.
3. A3 and refinement: what does a lattice KS mode do under vacuum
   insertion / placement refinement (CA-68/71)? Compute the transport
   defect T_{N+1,n} J_N - J_N T_{N,n} structurally in the tile basis. Is
   there a refinement for which the KS density is covariant exactly at
   finite N (so A3 is trivial), analogous to the exactly-covariant
   residual transport of CA-73?
4. Beyond Virasoro. When the target chiral algebra is larger than Virasoro
   (c>1), what are the lattice avatars of the extra generators? Candidates:
   (a) the topological defect operators of C acting on the chain
   (Aasen-Fendley-Mong), which commute with H and realise C as a
   categorical symmetry; (b) higher conserved densities on an integrable
   line; (c) lattice currents for an affine symmetry if C is a quantum-group
   category. Formulate the general extended-mode algebra that the limit
   must carry for fidelity, and what VR-1-type hypotheses it would need.

Deliver general statements with proofs or precise conjectures and an honest
list of what remains to be synthesised from C-data. Examples only in the table.
