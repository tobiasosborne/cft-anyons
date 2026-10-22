# Astra exploration brief — D3-refinement-meets-dynamics

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
- Write ONLY inside `explorations/2026-10-22-astra/D3-refinement-meets-dynamics/`. Deliver
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
### D3. Refinement meets dynamics: synthesising WT-1's drift hypothesis from category data

Read: `cft_machine/research/wilson_triangle.md` (WT-1..3),
`cft_machine/benchmarks/fermion/WILSON_PROOF.md` (the only instance; note its
nonlocal sharp refinement and non-uniformity in M), CA-68 (vacuum insertion,
the dressed family W_L = U_L V_L, the open dynamical-vacuum condition
J_L Omega_L ~ Omega_{2L}), CA-71 (placements), CA-72 (GNS descent, defect
scalar 2(1-sqrt(omega(P))), CP completion defect), CA-73 (residual
transport), `reconstruction/04_cutoff_oar.md` (LC-4 certificates),
CONVENTIONS (u), (x), (ac)-(af); `literature/md/2010.11121/2010.11121.md`
(Osborne-Stottmeister OAR). Also any local source on MERA / entanglement
renormalisation / wavelets / Lieb-Robinson bounds / local indistinguishability
of gapped or critical ground states (grep `literature/md` and `references/`).

The problem. WT-1 assumes summable drift d_{k,n} = ||omega_{n+1} o alpha_{n+1}^k
- omega_n o alpha_n^k||. Nothing in the repo derives such a bound from a
Hamiltonian family H_n and a refinement alpha_n built from category data.
The July machinery (CA-68/71/72) provides general refinements and an exact
descent theory but has never been evaluated against any dynamics.

Questions (general C, general site object, general H_n in the tile space):

1. Set the problem up exactly. Let H_n be a translation-invariant local
   Hamiltonian on A_n = End_C(O^{(x)N_n}), omega_n its ground state (or a
   chosen low-energy state), alpha_n a local charge-preserving refinement
   (vacuum insertion, possibly dressed by a bounded-depth circuit U_n).
   Express d_{k,n} in terms of (i) the vacuum defect of CA-72,
   (ii) the local energy of the refined state, and (iii) a
   local-indistinguishability property of omega_{n+1}. Prove a general
   inequality d_{k,n} <= f(spectral data, support size of the k-th algebra,
   defect scalar, Lieb-Robinson constants).
2. The dynamical-vacuum condition as an RG fixed point. Formulate
   J_n Omega_n ~ Omega_{n+1} as: the refined dynamics on A_{n+1} agrees
   with H_{n+1} up to a bounded-depth circuit and a controlled error. State
   a theorem: if the family (H_n, alpha_n) satisfies a quasi-adiabatic /
   circuit-conjugacy condition with summable errors, then WT-1's A3 holds.
   Which part is a genuine analytic obstruction for critical (gapless)
   chains, where local indistinguishability degrades polynomially? Can
   summability be rescued by a dyadic regularisation (the fermion
   WILSON_PROOF uses dyadic tails)?
3. Which dressing U_n is forced? CA-68 proposes W_n = U_n V_n with U_n a
   bounded-depth charge-preserving circuit. Derive conditions on U_n from
   the drift bound. Is there a canonical choice built from the tile
   Hamiltonian itself: imaginary-time evolution for a fixed short time, or
   the history sum of CA-86 on a half-infinite strip, which maps boundary
   carriers to states? Is the Levin-Wen fixed-point wavefunction (the
   isotropic history sum) the canonical refined vacuum? Formulate and assess.
4. Give the precise list of what would still have to be derived from
   C-data to turn your theorem into a certificate for LC-4 and WT-1, and
   where the CA-73 stretched-vs-fine dichotomy enters.

Deliver general theorems with structured proofs and an honest obstruction
list. Examples only in the table.
