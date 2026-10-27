# Status audit B: CA-23..CA-61 (+CA-63, CA-64): Gaussian-boson and qubit nearest-neighbour programmes

Read-only audit. Paths relative to /home/tobias/Projects/cft-anyons. S = report/sections/. T = test/runtests.jl.
Status labels are quoted from the shard's own "Status:" line (line 13 unless noted; CA-29 line 12). Layer tags are INFERRED (no shard in this range states chirality/data/rung tags in the AGENTS Rule 17 sense; grep found none).

## 1. Summaries per block

### Block (i): Gaussian-boson Lorentz / stress-energy, CA-23..CA-33
Aim (S/23:13-16, 112-): for translation-invariant scalar Gaussian (quadratic q,p) lattice bosons in d=1,2,3, find when the coefficient symbol omega_eps(k)^2 = sum_r V_r e^{i eps k.r} yields the Klein-Gordon/free-scalar Poincare representation, and then give a lattice stress-energy dictionary. Established (all at symbol level, flat L^2(dk), no category data): the boost-time residual is R_a(k) = (1/2) d_a omega^2 - c^2 k_a (S/27:33-50); Hessian/speed/rotation/boost-boost residuals; the Hessian condition is necessary but NOT sufficient (massless sin^2 doubler has 2^d minima on L=4 grids, S/27:150-175; T:903); a real-space density convention (CA-29, "convention, not a theorem"); a checked finite open-chain energy-current continuity T_01 (T:565) and a translation-invariant current-symbol equality with the boost-time symbol (CA-31, T:653); a slope residual that catches wrong speed/orientation (CA-33, T:692). Explicitly NOT done: any many-body representation theorem, periodic first moments, dGamma(k) identification, T_10/T_11, higher-d currents (CA-32 is spec only), BdG/pairing tier, scaling/continuum convergence (S/31:122-137; S/33:143-160; S/25:125-151; S/24:175-180). The 2026-05-30 four-reviewer synthesis (reviews/2026-05-30_gaussian_lorentz/SYNTHESIS.md:12-60) flagged 8 high-severity problems (generator sign map, periodic [X,P], one-particle measure, absent density layer, CA-26 overstating "checked", massless labelled coefficient-only, tolerances, roadmap drift); CA-29, CA-31, CA-33, the Julia hardening (worklog 006) and the "coefficient-only" wording are the responses. This block does not touch qubits or categories; the sole link is as a solvable calibration for the "Lorentz/Poincare from lattice coefficients" question.

### Block (ii): qubit nearest-neighbour symmetry programme, CA-34..CA-61 (+CA-63, CA-64)
Aim (S/34:13-17; worklog 009): in the Pauli basis h = sum h_ab sigma_a (x) sigma_b, derive finite necessary equations a 1+1D (and 2+1D) density must satisfy for a Poincare/Witt/Virasoro route, turn them into (a) a Pauli-word residual calculus, (b) a moment-matrix SDP exclusion hierarchy (JuMP + Mosek), (c) a 99-point candidate scan, then (d) relax the gates after the scan fails. Established:
- Checked algebra: the adjacent current i[h12,h23] vanishes for symmetric fully on-site and classical commuting densities (S/35:13, 72-100; T:118). Fixed-route necessary equations A(h)=Du, B(h)-u-v^2(h-eI)=Dw (S/39:46-138; S/45:25-35). Fixed-h moment SDP builds and Mosek solves tiny cases (T:213; runs/2026-05-31-qubit-sdp-smoke/README.md:11-14, results.toml:3-5: zero-residual "not_excluded_at_level"; artificial I=0 and forced ZZ=0 "excluded").
- SCAN RESULT (runs/2026-05-31-qubit-candidate-scan/README.md:11-17; summary.toml:4-8, 44-47; S/60:23-33): 99 samples; 9 excluded_current_collapsed, 27 excluded_no_conservation_witness, 63 excluded_no_boost_witness. **No point reaches not_excluded_algebraic; no point passed the exact symmetry gates.** All 99 rows have sdp_status "not_run" (results.toml, 99/99), so the SDP layer excluded no real Hamiltonian; only the two artificial smoke cases were excluded.
- Sentinels: classical ZZ and on-site X fail by current collapse; fake/generic dense fail conservation; self-dual TFIM (-ZZ - (XI+IX)/2) is currentful, conserved, and fails exact boost (residual 1.8257418583505538, speed2 = -2.0; summary.toml:72-93); isotropic Heisenberg (residual 29.39, speed2 -16, summary.toml:49-66) and XXZ delta=0 (11.31, speed2 -8, summary.toml:95-116) also fail boost. The shard's own reading is that the exact boost witness is "too strict" (S/60:45-47; README.md:15-17), not that these critical chains lack a CFT limit.
- Relaxed re-scan (CA-64; runs/2026-07-05-qubit-relaxed-scan/summary.toml:7-18): same 9/27/63 reproduced; relaxed verdicts 9 current-collapsed (hard), 27 queued_conservation_profile, 63 queued_gns_scaling. TFIM boost profile sqrt(6) -> 1.8257 -> 1.5275 -> 1.3416 for support 2..5, speed2 = -2 throughout (worklog/011:232-234; INDEX.md:53). Sentinel SDP tier (summary.toml:20-53, window length 2): classical_zz and onsite_x = 0.0; tfim_self_dual -0.4737, heisenberg_iso -1.7778, xxz_delta_0.5 -2.254 normalized; worklog/011:221-225 says these negative level-2 values are vacuous lower bounds (box-bounded; R*R spans up to 7 sites, outside the PSD window), i.e. NO exclusion certificate. "queued_gns_scaling" means "not terminally excluded", not evidence for symmetry (S/64:116-117).
- CA-63 (S/63:13-19): exact monotone full-window feasibility implies a genuine state on the quasi-local algebra with pi_omega(R)=0 (compactness argument), turning CA-44 from exclusion-only into an exact alternative; explicitly no uniqueness/ground state/continuum/Virasoro (S/63:177-183).
Answer to "did ANY qubit NN Hamiltonian pass the symmetry gates?": **No.** In the exact scan zero of 99 passed; in the relaxed scan nothing is "passed" either, 90 are merely queued and 9 hard-excluded. Nothing was ever shown to carry Poincare/Witt/Virasoro symmetry. The Witt/Virasoro (CA-37/42) and 2+1D (CA-36/41) parts have no code and no run.

Observation not stated in any shard as a finding (mine, checkable in results.toml): every one of the 99 rows has speed2 <= 0 or NaN (no positive-v^2 boost witness anywhere, including critical TFIM/XXZ/Heisenberg). Worklog 011:123-125 records "optimizing speed v^2=-2 (sign open)". This suggests the B-relation ansatz (S/39, B=i[p_j,h_{j+1}]+2i[p_j,h_{j+2}]) may carry a convention/sign problem rather than being merely "too strict"; unresolved locally.

## 2. Shard table
Columns: ID | claim | status AS STATED | layer tags (inferred: setting; data; rung) | backing | key line.
Gaussian layer default (inferred): non-chiral scalar field, d=1..3; coefficient data only (no categorical input); rung below "limit exists" (symbol/one-particle level).
Qubit layer default (inferred): 1+1D (2+1D proposal) full non-chiral qubit chain; Pauli coefficients only, no categorical input; necessary-condition filter, below "limit exists".

| ID | claim | status (stated) | backing | key line |
|---|---|---|---|---|
| CA-23 | Roadmap for Gaussian-boson Lorentz block; end goal symbol->KG Poincare | "roadmap shard with checked seed" | Julia plan items 1-3 via CA-24 | S/23:13-16 |
| CA-24 | Dispersion symbol; boost-time symbol = (1/2)grad omega^2; KG limit | "sourced model class plus checked flat local derivation" | T:617 "Gaussian boson Klein-Gordon symbols", T:634 "...boost-time symbols"; src/GaussianBosons.jl | S/24:13-18, 175-180 |
| CA-25 | Oscillator-mode diagonalisation of scalar tier; BdG deferred | "sourced template plus flat local coefficient derivation" | none dedicated | S/25:13-18, 125-139 |
| CA-26 | One-particle H,P,J,K on smooth core; exact brackets, omega-dependent residuals | "flat local derivation with limited Julia checks" | T:523, T:554, T:769, T:728 (symbol/residual samples only, not commutators) | S/26:13-19 |
| CA-27 | Taylor/Hessian residual conditions; necessary not sufficient; doubler witness | "checked local coefficient calculus" | T:806, T:769, T:886, T:903 | S/27:13-18, 150-175 |
| CA-28 | Julia invariant suite; periodic stiffness vs symbol | "checked Julia shard" | T:826, T:841, T:886 (src/GaussianBosonNumerics.jl:51-272) | S/28:13-19, 38-39 |
| CA-29 | Real-space energy-density split convention | "convention, not a theorem" (line 12) | none | S/29:12-16 |
| CA-30 | 1D stress-energy dictionary; T_01 only checked | "proposal with checked T_01 seed" | T:565 "Gaussian open-chain energy current continuity" | S/30:13-16, 38 |
| CA-31 | Integrated current symbol = boost-time symbol (1D NN) | "checked translation-invariant symbol bridge" | T:653 (src/GaussianBosonCurrents.jl:162-192) | S/31:13-20, 122-137 |
| CA-32 | d=2,3 cell-current compiler-input spec | "proposal and compiler-input specification" | none | S/32:13-18 |
| CA-33 | Open-chain T_01 continuity suite + slope residual | "checked local-current numerical suite" | T:565, T:692 (src/GaussianBosonCurrents.jl:126-235) | S/33:13-19, 143-160 |
| CA-34 | Opens qubit NN quest in Pauli coefficients | "programme shard with checked seed" | T:118 | S/34:13-17 |
| CA-35 | Adjacent-current polynomial; on-site/classical densities have zero current | "checked local derivation" | T:118 "qubit Pauli nearest-neighbour current obstructions"; src/QubitPauliLattice.jl | S/35:13-15, 152-161 |
| CA-36 | 2+1D plaquette/edge-density rejection filters | "proposal diagnostics" | none | S/36:13-16 |
| CA-37 | 1+1D Witt/Virasoro finite diagnostics | "proposal with local derivation targets" | none (no Witt/Virasoro test: grep of T finds none) | S/37:13-18 |
| CA-38 | Pauli-word calculus; coboundary quotient Du | "checked local framework" | T:118; src/QubitPauliLattice.jl, QubitPauliResiduals.jl | S/38:13-17 |
| CA-39 | 1D Poincare necessary equations (current, A=Du, B-u-v^2(h-eI)=Dw) | "local derivation, partly checked" | T:118 | S/39:13-16, eqs 46-138 |
| CA-40 | Residual computer-algebra engine | "checked" | T:118 | S/40:13-14 |
| CA-41 | 2+1D edge-density equation schema | "proposal-level local schema" | none (no 2D code; S/45:79-87) | S/41:13-15 |
| CA-42 | Exact finite Fourier-mode algebra; chiral residuals as necessary filter | "exact finite algebra plus proposal residuals" | none in T | S/42:13-15 |
| CA-43 | Pauli-word moment constraints omega(X*RY)=0 | "proposal-level SDP interface backed by sourced state/GNS architecture" | T:213 (via CA-46) | S/43:13-15 |
| CA-44 | Monotone SDP exclusion hierarchy; infeasible => exclude (fixed h, named route); feasible proves nothing | "rigorous proposal" | smoke run (below) | S/44:13-15, 85-102 |
| CA-45 | Roadmap/implementation plan; open gaps (central charge unfixed, 2D unimplemented) | "implementation plan" | n/a | S/45:13-14, 79-87 |
| CA-46 | Julia API/solver contract for fixed-h hierarchy | "checked implementation contract" | T:213 "qubit Pauli moment SDP hierarchy" | S/46:13-14 |
| CA-47 | Positioned Pauli words, translation-canonical moments | "checked" | T:213; src/QubitPauliWords.jl | S/47:13-14 |
| CA-48 | Moment matrix M_uv, realified PSD in JuMP | "checked" | T:213; src/QubitMomentSDP.jl | S/48:13-14 |
| CA-49 | Residual relation compiler, witness solvers | "checked local implementation" | T:213; src/QubitPoincareWitnesses.jl | S/49:13-14 |
| CA-50 | SDP levels and Mosek status map | "checked implementation" | runs/2026-05-31-qubit-sdp-smoke/results.toml; scripts/julia/qubit_sdp_smoke.jl | S/50:13-14 |
| CA-51 | Sentinel Hamiltonians for gate testing | "checked sentinels" (not criticality claims) | T:213; src/QubitHamiltonianScreening.jl | S/51:13-14 |
| CA-52 | Candidate-selection roadmap; feasibility = survival only | "roadmap" | n/a | S/52:13-14 |
| CA-53 | Scan API, schema, scoped verdicts | "checked implementation" | T:400 "qubit Hamiltonian candidate scan"; src/QubitCandidateScan.jl | S/53:13-19 |
| CA-54 | Family sign/coefficient conventions (TFIM, XY, XXZ, Heis., grids) | "checked implementation convention" | T:400 | S/54:13-21 |
| CA-55 | Source audit: TFIM, transverse XY, XXZ/Heisenberg sourced; XYZ/DM/compass/clock/Potts not | "source audit" | local refs only | S/55:13-20 |
| CA-56 | Synthetic grid families | "checked implementation input" | runs/.../inputs.toml; src/QubitHamiltonianFamilies.jl | S/56:13-20 |
| CA-57 | Three algebraic gates (current, conservation, boost) | "checked scan gates" | T:400; src/QubitCandidateScan.jl | S/57:13-14 |
| CA-58 | Optional SDP layer in scan | "implemented option, unused by the first broad run" | none run | S/58:13-14 |
| CA-59 | Run-bundle format | "checked run bundle" | runs/2026-05-31-qubit-candidate-scan/ | S/59:13-16 |
| CA-60 | 99-point result: 9/27/63, none survive | "checked run result" | summary.toml:44-47 | S/60:13-14, 23-33 |
| CA-61 | Hand-off: do not retry exact boost gate; go to Koo-Saleur/OAR; relax SDP | "roadmap from checked failures" | n/a | S/61:13-14, 24-36 |
| CA-63 | Exact full-window feasibility => state with pi_omega(R)=0 | "derived compactness theorem, conditional on standard C*-algebra facts" | T:305 "qubit full-window moment compactness witnesses" (finite witnesses of proof ingredients only, S/63:191-194); src/QubitMomentStateWitnesses.jl | S/63:13-19; two source GAPs 30-33 |
| CA-64 | Residual profiles + fixed-residual GNS-norm SDP replace exact gates | "proposal with checked finite pieces" | T:939, T:1004, T:1044 (CA-64); runs/2026-07-05-qubit-relaxed-scan/ | S/64:13-17; GAPs 28-31 |

Per-shard notes:
- No Gaussian shard is explicitly a "negative"; no qubit shard other than CA-60/61 carries negative results, and CA-60's "checked run result" is a route-scoped negative (S/60:45-47).
- CA-64 line 28-29 "GAP: register a run bundle for the longer-support residual-profile numbers" is STALE: runs/2026-07-05-qubit-relaxed-scan/ now exists and is cited in INDEX.md:53 and worklog 011:95,193-197, but S/64:157-158 still says the values are not quoted because no bundle is registered. The bundle has no README (only inputs/summary/results.toml).
- CA-44 says "No solver is implemented yet" (S/44:14-15) though CA-46..50 implemented one the same day; the status line was not updated.

## 3. Load-bearing for the general construction vs calibration / dead end

Cited later (grep of CA-62+ shards, cft_machine/, reconstruction/):
- Only CA-38, 39, 42, 43, 44, 57, 60, 61, 63, 64 are cited by later shards: CA-62 (S/62:19-20,144-152,195-198,230-244), CA-65/66/68 (CA-63/64 as dependencies), CA-70 (CA-42, CA-64; S/70:18,136), CA-72 (CA-63; S/72:22), and CA-73 (S/73:14-22,86-107,151-153,212,240) which explicitly TRANSPORTS the CA-38/39/42 residual calculus and the CA-43/44/63/64 semantics onto a categorical tower ("transport lemma is exact but says nothing about ..." S/73:240). cft_machine/ cites only the range summaries (cft_machine/report/sections/01_programme_and_baseline.tex:55-62; CA-23, CA-34); no cft_machine code uses these modules. src/ code using the qubit modules: only src/CftAnyons.jl and QubitRelaxedScan.jl/scripts; no categorical-side Julia imports them.
- CA-23..CA-33 (Gaussian): zero citations from CA-62 onward (only the cft_machine range blurb). Dead end for the north star as a pipeline stage; useful only as a calibration of how to state "symbol vs representation vs continuum" layers and as the template for the density/current/improvement ambiguity warnings.

Load-bearing, model-independent ideas (reused by CA-62/73):
1. The conceptual stack "local residual density modulo coboundary -> finite moment equations omega(X*RY)=0 -> GNS-norm residual nu_N" (CA-38/43/64). Generic in the local algebra; CA-73 ports it to categorical towers.
2. CA-63 compactness theorem (exact full-window feasibility <=> existence of a reference state satisfying all residual relations). Stated for the qubit UHF algebra; CA-73:153 notes its boundary for the transport. This is the most reusable theorem in the range (still conditional on two source GAPs).
3. The exclusion semantics (infeasible => route-scoped exclusion; feasible/queued => survival, never evidence): CA-44, CA-53, CA-64 (S/64:116-117).
4. The bilinear obstruction: witness + moment joint optimisation is not an SDP (S/44:93-100; S/64:119-125); certified bounds need fixed witnesses.
5. The negative lesson from the scan (S/62:195-198, S/61:24-28): exact finite-support UV boost/Virasoro relations are too strict; approximate/asymptotic intertwining is required. This justified the soft-inductive-system framing in CA-67/68.

Calibration / model-specific / dead end (Rules 16-17):
- Everything 2-site Pauli-coefficient specific: CA-35 adjacent-current polynomial, the 99-point grid and its family constructors (CA-54..56), sentinels (CA-51), TFIM/XXZ/Heisenberg verdicts (CA-60). These are qubit instances, not the general construction.
- CA-36/41 (2+1D), CA-37/42 (Witt/Virasoro modes): proposals only, no code; CA-42's mode algebra is used by CA-70/73 as a template but the central charge/normalisation convention (CONVENTIONS (d)) is unfixed (S/45:80-83).
- The exact first-moment boost route (CA-39 B-relation) is closed as a candidate filter by the project's own conclusion (S/61:24).
- Mosek backend (CA-46..50, 58) is infrastructure with only two artificial exclusions as evidence.

## 4. Explicit gaps and negatives

Ruled out (route-scoped, not absolute):
- Fully on-site (symmetric split) and classical commuting densities: zero first-moment current, so no nonzero-speed Poincare route of this form (S/35:72-100; S/45:35-40). Conditional on the symmetric density-split convention (S/35:152-157): asymmetric splits fake currents and are caught only by the conservation residual.
- Exact first-moment boost witness as universal filter: 63 samples fail incl. every sourced critical family point reaching it (S/60).
- 27 samples have no conservation witness A=Du (incl. all 24 generic_bilinear_field and 3 heisenberg_field points, summary.toml:13-14, 41-42).
- SDP: only artificial contradictions (I=0, forced ZZ=0) excluded; no real Hamiltonian excluded by SDP; level-2 sentinel SDP tier gives no certificate (worklog 011:221-225).

Still conjectural / open:
- Whether ANY NN qubit density realises Poincare/Virasoro symmetry beyond (non-closing) finite diagnostics: untouched; the CFT status of TFIM/XXZ rests on external sources (CA-55; Koo-Saleur/free-fermion/OAR), not on anything computed here.
- Meaning of speed2 < 0 in every boost-failed row (no real speed); worklog 011:125 "sign open". Possible convention issue in B not ruled out.
- Scaling statement sup nu_N(r_mn) -> 0 on a growing window K_N/N -> 0 (S/64:129-140): defined, never computed; longer-support profiles only to L=4 broadly and L=5 for sentinels (worklog 011:218-220), SDP window length 2.
- Central charge extraction (CONVENTIONS (d) unfixed); 2+1D checker; periodic first moments; T_10/T_11; BdG/pairing; dGamma(k) identification; many-body Gaussian representation theorems; all continuum convergence (CA-15 payload).
- Joint h/witness/moment optimisation (polynomial lift) - not implemented, no convention.

No local citation / source gaps:
- CA-63: Banach-Alaoglu state-space compactness; product-trace conditional expectations onto finite tensor factors (S/63:30-33).
- CA-64: theorem converting coefficient-tail decay into a continuum statement (S/64:30-31); run-bundle GAP is stale (above).
- Gaussian: harmonic-chain energy-current source, Weinberg/Koo-Saleur originals were queued in the synthesis (SYNTHESIS.md ~100-123); CA-23 lists the dGFF source as covering only the square-grid change of measure (S/23:156-160). CA-29/30 cite the A4 finite open-chain test and CONVENTIONS (j),(k),(l), local derivation rather than a harmonic-chain source.
- Status-line staleness: CA-44 "No solver is implemented yet"; CA-64 run-bundle GAP; CA-34 lists CA-36/37 as proposal-level and they remain so.
- Test-backing weakness: CA-43/44 SDP semantics only exercised on toy/artificial cases; CA-63 testset checks proof ingredients on finite examples, not the theorem; Gaussian CA-25, 29, 32 have no tests; CA-26's commutator identities are checked only as symbol/residual samples (S/26:13-20), matching the reviewers' criticism.

## 5. Honest assessment
- The Gaussian block (CA-23..33) is a careful, well-hedged calibration of "symbol-level Lorentz residuals and a lattice T_01" for a free scalar. It contributes nothing that later pipeline shards cite and its own status lines concede no representation or continuum theorem. Treat as closed unless a Gaussian/free-boson instance is wanted as a falsification test of the general construction.
- The qubit block delivered one valuable machine-checked pattern (residual-modulo-coboundary -> Pauli-word moment SDP -> route-scoped exclusion) and one theorem (CA-63) that CA-73 reuses for categorical towers. Its direct physics result is negative: 0/99 NN qubit densities pass the exact first-moment gates; critical TFIM/XXZ/Heisenberg fail the exact boost witness, and the relaxed re-scan only moves them to a queue with no certificate either way.
- Close: the exact first-moment qubit scan (CA-53..61) and the 99-point grid; further sweeps of this grid add nothing (S/61:24 already says so). Close the 2+1D (CA-36/41) and Witt/Virasoro (CA-37/42) qubit proposals as "unimplemented, not pursued" unless re-lifted to the general categorical residual set (CA-73).
- Keep open (and reusable): CA-38/43/44/63/64 semantics, the unresolved negative-v^2 puzzle (cheap to settle before trusting "too strict"), and the scaling-window definition (S/64:129-140).
- The central missing piece for the north star is not here: nothing in CA-23..64 constructs a model, a symmetry generator that closes, or a limit; it only shows how to filter and how to define approximate-symmetry diagnostics. The next real content (variable-N tower, CA-65..74, CA-73) depends on these shards only through the CA-63/64 formalism.
- Rule 16 check: the qubit programme is the "model hyperfixation" failure mode in miniature (a 99-point grid on a specific model class); the project corrected it (CA-62, CA-73), but the block should be read as a calibration appendix, not as progress toward the category-to-CFT pipeline.
