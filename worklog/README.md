# Worklog — institutional memory

This directory is the project's memory across sessions and across agents (there
is no beads tracker — AGENTS.md Rule 14). Read the **highest-numbered** chunk for
the current state; it doubles as the session handoff.

## Format

- Files are `NNN_YYYY-MM-DD_slug.md`, ~200–280 lines each. Highest `NNN` is most
  recent. **Prepend** new entries to the top of the current chunk; start a new
  chunk when it passes ~280 lines.
- Each entry: **Context → What changed → Why these choices → Frictions / dead
  ends → Acceptance (what check passed) → Pointers (shard IDs, files, sources).**
- Be honest about frictions and dead ends — those are the load-bearing parts a
  future agent cannot reconstruct from the diff.

Cross-session insight that is *not* repo-specific (a user preference, a recurring
gotcha) goes to agent memory under
`~/.claude/projects/-home-tobiasosborne-Projects-cft-anyons/memory/`, not here.

## Index

| Chunk | Span | Topics |
|---|---|---|
| `023_2026-10-27_status_overview.md` | 2026-10-27 | Status overview of all results, corrected by Tobias's four-pillars ruling (section 0; AGENTS.md Rule 18): ladder table (only R0^u reached for general C), asset list, load-bearing negatives, six-point structural diagnosis (open/periodic split, no selection principle, no VR-1 instance, fidelity must be carried, continuum unknowns, four restarts), ranked next targets; eight audits banked in `reviews/2026-10-27_status_audit/` |
| `022_2026-10-25_round3_sprint.md` | 2026-10-25 (landed 2026-10-27) | Round 3 Astra sprint: F1-F6 explorers, Astra reviews and shard writers; verdicts F1/F5 COUNTEREXAMPLE with proof-complete replacements, F2/F3/F4/F6 WEAKER-RESULT-PROVED; CA-95--CA-100 landed (97-100 recovered from the laptop backup after the 07:08 failure); G1/G6 unreviewed; CONVENTIONS (ax) deferred registration |
| `021_2026-10-22_round2_proofs.md` | 2026-10-22 | Round 2: six Codex (gpt-6-astra xhigh) proof notes E1-E6 + six Opus reviews; verdicts E1, E5 PROOF-COMPLETE, E6 COUNTEREXAMPLE with proof-complete positive theorem, E2/E3/E4 WEAKER-RESULT-PROVED; CA-89--CA-94 written and registered; dated amendments to CA-68, CA-75--CA-80; CA-88 grid + Round-2 Verdicts (R0^u reached at L0+half-braiding); brief corrections (antiunitary parity, false A3 clause, E6 universality, seam-pairing dependence); CONVENTIONS (ar)-(aw); Codex quota 32% -> 40% weekly |
| `020_2026-10-22_integration_sprint.md` | 2026-10-22 | Integration sprint: no-model-hyperfixation directive (Rule 16); 12-reader/3-judge repo survey (synthesis in session scratchpad, not repo); CA-86/87 merge ((ac)->(ak), (ad)->(aj)); six Astra explorations D1-D6 with Opus reviews, all headlines needs-reformulation; CA-76--CA-80 written and registered; errata to CA-72/73/86; CONVENTIONS (al)-(ap); July testsets 565/565 standalone; open decisions (chiral vs full, bare vs enriched input, what counts as an instance) |
| `019_2026-09-23_spacetime_dictionary.md` | 2026-09-23 (work date; merged 2026-10-22) | Records 2026-09-23 work merged on 2026-10-22 (renumbered from 016; CONVENTIONS (ac)/(ad) -> (ak)/(aj)). Intent realignment (principle, not target CFT); CA-86 spacetime Trotter dictionary; dense/dilute TL calibration and the u = λ honeycomb reduction to Nienhuis's x_c; CA-87 net case: 1⊕τ ≅ τ⊗τ so the dilute Fibonacci chain is the golden chain blocked, isotropic net gas = Q = φ+1 Potts; Levin–Wen 2005 and three chromatic-polynomial sources acquired |
| `018_2026-10-21_four_port_consistency.md` | 2026-10-21 | Four-port equations and linearization; exact semion tensor F/R and graded positivity; conditional doublet selection; Fibonacci functional hierarchy; fifteen exact checks/five mutations; local commit, no push |
| `017_2026-10-21_small_category_inputs.md` | 2026-10-21 | Local commit of prior work; explicit VecZ2/Fibonacci sewing solutions, semion ansatz obstruction, categorical cohomology contraction, selected-lift Ward/null checks; no push |
| `016_2026-10-21_local_conformal_reconstruction.md` | 2026-10-21 | Concrete cell/Ward/Taylor equations; innerness, anomaly, associative and mixed product/action complexes; explicit KS/OAR conditions; eleven symbolic checks and five rejected mutations; Git deferred offline |
| `015_2026-09-22_fusion_space_windup.md` | 2026-09-22–2026-10-21 | Latest: fresh categorical boundary-sewing discussion, standard KS requirement and no-example constraint; earlier: coset/Ising advances and pdflatex wind-up |
| `014_2026-09-22_cft_machine.md` | 2026-09-22 | Broader algorithm/functor north star; exact Ising modular compiler and local OAR reconstruction; quantitative Wilson and graph-norm proofs; exact sparse coset stress route; Astra cross-referees; CA-81–CA-83 |
| `013_2026-07-06_categorical_residuals.md` | 2026-07-06 | CA-73 categorical residual set, exact transport/stretched dichotomy; Fibonacci local-operator machinery; L=4 dilute image = parity-even = 322 < 323 (1-dim JW kernel); Pkg.test suspension + laptop compute budget |
| `012_2026-07-06_pipeline_consistency_scoping.md` | 2026-07-06 | Consistency-layer scoping: four pipeline seams, forest-functor composability, GNS-descent lemma, filling flow, two-constant KS closure; 11 sources; plan in reviews/2026-07-06_pipeline_consistency_scoping/ |
| `011_2026-07-05_qubit_relaxed_gates.md` | 2026-07-05 | Categorical Borchers-Uhlmann pipeline block CA-62--CA-70: vision, state-existence theorem, relaxed gates + re-scan, anyonic word algebra, refinement maps, dilute-TL Koo-Saleur |
| `010_2026-05-31_qubit_candidate_scan.md` | 2026-05-31 | Qubit candidate Hamiltonian families, algebraic scan, and fixed-SDP scan contract |
| `009_2026-05-31_qubit_nn_symmetry.md` | 2026-05-31 | Qubit nearest-neighbour lattice-symmetry diagnostics and Pauli current obstruction |
| `008_2026-05-30_gaussian_stress_energy_candidates.md` | 2026-05-30 | Gaussian stress-energy candidate shards and follow-up checks |
| `007_2026-05-30_gaussian_source_acquisition.md` | 2026-05-30 | Source acquisition and A4 current derivation for Gaussian Lorentz stress-energy follow-ups |
| `006_2026-05-30_gaussian_action_plan_julia_hardening.md` | 2026-05-30 | Julia/test hardening for the Gaussian Lorentz action plan |
| `005_2026-05-30_gaussian_action_plan_report_fixes.md` | 2026-05-30 | Report-only containment fixes for the Gaussian Lorentz action plan |
| `004_2026-05-30_gaussian_action_plan.md` | 2026-05-30 | Serial execution of the Gaussian Lorentz action plan |
| `003_2026-05-30_gaussian_boson_lorentz.md` | 2026-05-30 | CA-23--CA-24 Gaussian boson Lorentz roadmap and symbol calculus |
| `002_2026-05-30_compiler_spec.md` | 2026-05-30 | CA-08 compiler spec; Fock/sector correction; CA-09 Fibonacci kinematic sector; CA-10--CA-17 lattice bulk-symmetry candidates |
| `001_2026-05-30_reboot.md` | 2026-05-30 | Reboot: archive of old project, north star, lab-book scaffold |
