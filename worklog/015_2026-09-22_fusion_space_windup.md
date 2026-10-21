# Worklog chunk 015 — 2026-09-22–2026-10-21

## 2026-10-21 — Fresh conceptual start: categorical boundary sewing

### Context

After a read-only orientation, Tobias expressed dissatisfaction with the
project and requested a fresh conceptual start. His goal remains categorical
data plus explicit conditions producing refining lattice Hilbert spaces and
local Hamiltonians, whose **standard Koo–Saleur prescription** has a rigorous
OAR CFT limit realizing the input data. He expressly forbids reasoning from
model-specific examples: do not redirect this discussion into the existing
Ising/coset implementation or an example-driven search.

His proposed organizing argument starts with a rigorous Hamiltonian CFT,
cuts space into cells with boundary-CFT data, regulates recursively until
categorical/module-category structure remains, and seeks to reverse the
gluing. The present task is synthesis and identification of rigorous paths,
not a request to implement or archive the old project.

During the discussion Tobias explicitly confirmed that lattice quantities
must be allowed to depend on the cutoff. CONVENTIONS (ac) records this:
local dimensions, couplings and refinement data may run along a declared
joint lattice/truncation schedule; no fixed cell truncation is assumed.

### What changed

Acquired four primary source packages under
`references/categorical-reconstruction/`, with unchanged author texts,
precise anchors, scope limitations and SHA256 checks:

- Brehm–Runkel I and II: the directly relevant boundary-hole lattice
  construction, regulator removal, and the explicitly proposed stability
  condition for a lattice continuum limit.
- Bartels–Douglas–Henriques II: factorization along circles and intervals
  via Connes fusion, starting with a finite-index conformal net.
- Fuchs–Runkel–Schweigert I: categorical boundary/full-CFT sewing data
  relative to supplied chiral information.

Indexed the source manifest in `references/manifest/SOURCES.md`.
No implementation, report shard, PDF, or accepted theorem changed.
CONVENTIONS (ac) records the user's subsequent cutoff-dependence direction.
Two Astra collaborators independently examined the sewing route and the
reverse argument; their source anchors were checked directly by the parent.

### Why these choices

The source search follows the user's structural argument. It separates
categorical sewing channels, their analytic realizations, and quantitative
regulator/refinement control. Information loss is not itself an objection
to selecting **some** realization; it does prevent treating categorical
compression as an already-proved lossless inverse.

Prospective directions discussed, not adopted or proved here: a finite
presentation of positive cell amplitudes; local Hamiltonians from a regular
anisotropic transfer family; one-step refinement estimates implying summable
errors; and a Ward-identity bridge to the ordinary KS density prescription.
Supplying an entire target CFT would solve a conditional discretization
problem, not the original categorical realization problem.

### Frictions and source cautions

- Brehm–Runkel distinguish removing the cutoff/holes on a fixed cellulation
  from taking a lattice continuum limit at fixed local truncation. Their
  proposed irrelevance criterion must not be promoted to a general theorem.
- Kong–Zheng's existing local source `1905.04924.md:639–641` explicitly
  flags analytic sewing sufficiency and the richer vertex tensor structure;
  its physical classification statements have their own status labels.
- Q-system extension results already assume an ambient conformal QFT;
  Connes-fusion factorization already assumes a conformal net.
- Locality of a transfer operator does not supply a locality proof for its
  logarithm. Standard KS convergence is an independent requirement, including
  control of intermediate/high-energy states in products and commutators.

### Acceptance and pointers

All twelve package/extraction SHA256 records verified; report structure
guard still passes for 80 shards. This source-only change requires no new
numerical run and no report rebuild. The preceding orientation separately
reran 215 compiler assertions, 19 generic scalar-OAR assertions and the
package load; these do not validate the new research proposal.

Primary navigation: `references/categorical-reconstruction/SOURCES.md`.
The conceptual discussion and the user's no-example constraint supersede
the old wind-up entry's suggested next implementation task. There is no
new general realization theorem or selected reconstruction architecture.

## Continuation results and requested pdflatex wind-up

### Context

Previous goal turn was **progress**, landed as 7a501fe: exact Ising branch,
coset stress recipe, source proofs and benchmarks. The next investigation
targeted the missing coset observable/Hamiltonian interface. Current worktree
and sources were re-read; no full-suite or large-matrix runs were resumed.

Tobias then clarified locality: globally constrained spaces can simply be
fusion spaces, with constraints built into the Hilbert space. The desired
direction is local models on those fusion spaces. He subsequently requested
that work wind up and all work/results be summarized in a detailed pdflatex
report. New investigations were stopped, current proofs/checks finalized,
and the synthesis prepared. The general goal is not declared achieved.

### What changed and what was discovered

- `reviews/second_pass_ising.md` audits the Ising branch against the exact
  OS alpha-convergence definitions. New A2 proves an upper inclusion for
  **all uniformly bounded interval-supported even lattice sequences with a
  represented WOT limit**: complementary sampled fields converge in norm,
  finite locality passes to the limit, and Ising Haag duality finishes.
  Together with the existing sampled-generator lower inclusion this
  identifies the full local limit algebra in that stated sense.
- The audit also records ultraviolet-edge doubling, including even pairs
  of bounded energy. Their moving momentum labels do not converge under
  the chosen sharp RG. The result is the specified chiral OAR limit, not
  convergence of the entire low-energy spectrum. The wavelet-only local
  interval theorem is not attributed to the sharp construction.
- `research/smeared_coset_limits.md`, SC-1/SC-2, closes smooth-symmetry
  convergence in the ambient CAR theory. The coordinated schedules
  K_M=floor(M/16), R_M=floor(M/8) yield simultaneous CR-2 exact equality
  on each fixed free-energy core. A sourced Carpi--Weiner Fourier-energy
  bound controls the remaining continuum tail. Core, strong-resolvent,
  compact-time strong-unitary and finite-unitary-product convergence follow.
  Sectorwise application avoids falsely making the ambient rotation phase
  scalar across distinct lowest weights.
- `research/coset_hamiltonian.md`, CH-1, proves the raw finite zero mode
  is not positive: for k=1 and the polarized two-copy state,
  expectation = -(M-R)(M-R-1)/12. Exact witnesses are -5/3, -1, -13, -11
  at (M,R)=(8,3),(8,4),(16,3),(16,4). No diagonalization was used.
- CH-2 constructs finite vacuum-descendant spaces from actual finite CAR
  words using the analytic safe schedule R_b=2b+1, M_b=16(b+1), exact Gram
  elimination and sea embeddings. CH-3 constructs a different positive
  Hamiltonian with unique vacuum by retaining grade energy on V_b and
  adding penalty b+1 on its complement. Large safe-schedule instances
  were not computed; low-grade witnesses use the proved smaller windows.
- `research/coset_observable_system.md`, CO-1, supplies genuine unital
  finite maps on A_b=B(V_b) direct-sum C:
  (a,lambda) -> (J a J*+lambda(1-JJ*),lambda).
  The scalar is independent, not a vacuum character. Maps compose,
  vacuum states are compatible, and dynamics intertwine exactly although
  the finite Hamiltonians themselves need not. Norm limit is K(Hvac)+C,
  with vacuum GNS Hvac.
- CO-2 computes smooth stresses from only |n|<=b after compression and
  proves resolvent/unitary convergence. CO-3 identifies the represented
  local net by bounded generated field sequences. It explicitly does not
  replace strict OAR by an arbitrary strong*-null quotient or confuse
  that ideal with the norm-null ideal in the soft-system source.
- The new constrained maps are generally **not restrictions of the original
  CAR refinement**. The ambient penalized resolvent has a kernel on the
  excluded sectors and is not a self-adjoint resolvent on all ambient H;
  the new GNS/vacuum-module identification is essential.
- `benchmarks/coset_hamiltonian/`: actual sparse bases, Gram matrices,
  raw negative witnesses and positive extracted dynamics.
- `benchmarks/unitized_oar/`: exact Gram-coordinate matrix algebras and
  actual computed descendant integration. Metric adjoints are used; an
  exact checked LDL* factorization certifies each supplied positive Gram.
- Added CA-84 and CA-85, root report maps, source manifests and INDEX entries.
  The standalone `cft_machine/report.pdf` is a 26-page pdflatex synthesis,
  with source `cft_machine/report.tex` and eight short summary sections.

### Why these choices

The strict finite-algebra construction is a concrete advance beyond merely
naming a stress subnet. It has real unital connecting maps, states and
Hamiltonians. Its current presentation nevertheless does not prove local
fusion-space interactions. Global admissibility is not itself nonlocality;
the unsolved identification is V_b with categorical fusion paths and a
bounded-range action/refinement on that presentation.

This distinction now appears in AGENTS.md, the workspace README, research
notes and the synthesis. The pending locality preference was answered by
the user's fusion-space clarification, not treated as permission to replace
the goal with arbitrary globally projected spin systems.

An exact tricritical modular-input frontend was proposed but stopped before
implementation when wind-up was requested. `compiler_minimal/README.md`
marks it unimplemented; no code, source acquisition or passing test is
claimed for that frontend. Existing c=7/10 results concern the actual
coset/descendant constructions.

### Referees, frictions, and repairs

- Astra agents continued independent work and cross-refereeing. The A2
  locality proof and SC-1/SC-2 passed `oar_second_pass_referee.md` after
  direct source checks. CO-1--CO-3 were independently accepted in the
  separate CO section of `second_pass_ising.md`.
- CH helper and the parent's finite scalar-OAR code were reviewed
  separately. `unitized_oar_referee.md` accepts the metric algebra and
  computed-space integration within their scope.
- The first scalar-character mutation unexpectedly remained green: the
  product sentinel accidentally satisfied omega(ab)=omega(a)omega(b).
  The reviewer flagged the green artifact. A nonmultiplicative input pair
  fixed the sentinel; the mutation now fails one assertion (18 pass), with
  raw RED output retained. The correct implementation was restored and
  final 19/19 is green. This was a test-design defect, not proof that the
  character completion was multiplicative.
- The first integrated descendant run hit its 60-second timeout because
  sparse actions were recomputed inside the matrix-entry loop. Each
  necessary action is now computed once; the proved [E,C_n]=-n C_n rule
  skips exactly zero compressed columns. Final 212 assertions passed
  inside the original cap, without changing the operator or compute budget.
- Generic Stage admits any positive Gram-compatible grading; unique vacuum
  is asserted only for actual CH stages, whose single grade-zero vector is
  checked. The generic constructor is not overstated.
- The requested summary uses pdflatex, not a Word conversion. Its sources
  are canonical report shards plus dedicated synthesis sections. Poppler
  rendered all pages; every page was visually inspected. Source-path
  wrapping was fixed with xurl; final synthesis has no overfull boxes,
  unresolved references or missing glyphs.

### Acceptance

- Existing verified main suites remain 548 complex + 96 Majorana + 116
  Dirac Wilson + 215 Ising compiler + 127 sparse coset assertions.
- New sparse Hamiltonian suite: 261/261; wrong-penalty mutation 32 failures,
  restored; peak 2744 sparse states under 5000 guard.
- New finite scalar-OAR suites: 19/19 generic, 212/212 actual descendants;
  scalar-character mutation fails as described. Eight exact stage records
  and seven producer hashes are retained in its run bundle.
- New sources: Carpi--Weiner for energy/core bounds and Landsman for
  C*-algebra quotient/image results, append-only packages and hashes.
- Final guard: 80 shards pass; root report is rebuilt (184 pages).
  Standalone synthesis: 26 pages, two pdflatex passes, all PNG renders
  inspected, no overfull boxes/unresolved references/missing glyphs.
- Parent reran the 261 Hamiltonian checks and both unitized suites; package
  load passes. All seven unitized producer hashes and new CW/Landsman
  source hashes match. Git landing completes this entry. No full Pkg.test
  or expensive many-body operation.

### Pointers and wind-up state

`cft_machine/report.pdf` is the requested detailed synthesis; its source and
reproduction commands are in `cft_machine/report/README.md`. Root lab-book
record: CA-81--CA-85. The source manifests and INDEX link every run.

The general category-to-CFT machine remains unproved. The next intended
direction, if resumed, is a local categorical fusion-space realization of
the constructed descendant/OAR machinery. Work is being paused at the
user-requested wind-up boundary after the report is delivered and pushed;
this is not a completion claim for the general research goal.
