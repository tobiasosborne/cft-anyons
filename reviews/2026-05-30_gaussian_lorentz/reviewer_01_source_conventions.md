# Scope Read

Reviewed source/provenance/convention discipline for:

- `report/sections/10_lattice_symmetry_motivation.tex` through `report/sections/17_lattice_symmetry_examples_queue.tex`.
- `report/sections/23_gaussian_boson_lorentz_roadmap.tex` through `report/sections/28_gaussian_boson_numerical_suite.tex`.
- `CONVENTIONS.md`, especially lattice convention (h) and Gaussian convention (j).
- `INDEX.md`.
- `src/GaussianBosons.jl`, `src/GaussianBosonNumerics.jl`, and Gaussian-relevant parts of `test/runtests.jl`.

Cross-checked cited local anchors in:

- `literature/md/2010.11121/2010.11121.md`, especially lines 13, 51--61, 241--243, 274--293, 598--623, 648--681, 1037--1046, and 1540--1556.
- `references/cft/Schottenloher2008/Schottenloher2008.md`, especially lines 578--599, 790, 1297, 4040--4117, 4186, and 4244.
- `references/text/OARWavelets.txt`, especially lines 10--14 and 389--406.
- `references/text/CFTFromLatticeFermions.txt`, especially lines 88--95, 378--389, 395--402, 2128--2197, 2233--2257, and 2258--2264.
- `references/text/OsborneContinuumLimitsQuantumLatticeSystems.txt:328` and `references/text/GaugingDefectsQuantumSpinSystems.txt:674--684`.

# Findings Ordered By Severity

1. **CA-26 overstates its checked status.**
   `report/sections/26_gaussian_boson_generator_algebra.tex:13--16` says the shard is a "checked local derivation on a common core", and line 25 cites only `test/runtests.jl`, testset "Gaussian boson boost-time symbols". That testset is `test/runtests.jl:168--185`; it checks `1/2 grad omega^2` for KG coefficients and a small-spacing norm. It does not check the boost-momentum bracket (`report/sections/26...:75--93`), the rotation-Hamiltonian residual (`:112--126`), the boost-boost residual (`:128--152`), or the second-quantization commutator transport (`:154--171`). These may be valid local derivations, but the evidence label should not imply Julia coverage beyond the boost-time residual.

2. **Continuum stress-energy / angular-momentum density formulas are used before they are sourced.**
   `report/sections/13_position_dependent_bulk_generators.tex:75--87` writes
   `J_ab = int (x_a p_b(x)-x_b p_a(x)) dx` and then proposes lattice rotations from local momentum-density/current candidates. The shard's source block (`:19--24`) only anchors Euclidean vector fields and motions in Schottenloher, not QFT stress-energy, Noether currents, momentum density, or angular-momentum density. CA-23 correctly admits the gap at `report/sections/23_gaussian_boson_lorentz_roadmap.tex:107--112`, but CA-13 and CA-16 already use the formula as if the continuum density dictionary were available. This must remain proposal-level until a source/convention fixes stress-energy tensor normalization and improvement ambiguity.

3. **The real-space energy-density convention needed for stress-energy proposals is not fixed.**
   `CONVENTIONS.md:194--235` fixes a translation-invariant scalar symbol convention, but not a real-space local density convention `h_x` for the Gaussian Hamiltonian. CA-23 explicitly flags the ambiguity `h_x -> h_x + div b_x` at `report/sections/23_gaussian_boson_lorentz_roadmap.tex:114--119`; CA-24 then refers to real-space locality of `K_a=sum_x x_a h_x` as deferred at `report/sections/24_gaussian_boson_symbol_calculus.tex:160--165`. Therefore the current Gaussian block cannot yet support a lattice stress-energy density proposal, only one-particle symbol residuals.

4. **The sign map between continuum vector-field boosts and quantum Gaussian boosts is still implicit.**
   CA-11 derives `[K_a,P_0]=-P_a` for vector fields (`report/sections/11_continuum_bulk_symmetry_target.tex:92--102`). CA-24/CA-26 use the quantum target `i[H,K_a]=P_a` and `i[P_b,K_a]=delta_ab H` (`report/sections/24...:115--119`, `report/sections/26...:87--90`). `CONVENTIONS.md:142--161` says lattice signs are internal and global signs are explicit, but convention (j) (`CONVENTIONS.md:212--218`) does not say whether the Gaussian `K_a` represents `M_0a`, `-M_0a`, or a Stone-convention-adjusted self-adjoint generator. This is a convention gap for any future Poincare/stress-energy generator theorem.

5. **Several source anchors point to incomplete lines rather than the full claim.**
   Examples:
   - `report/sections/14_koo_saleur_prototype.tex:28--29` cites `references/text/CFTFromLatticeFermions.txt:2233` and `:2247`, but the convergence claim continues through `:2234--2235` and the exponentials/automorphic convergence through `:2256--2257`.
   - `report/sections/15_lattice_symmetry_acceptance_tests.tex:24` and `report/sections/16_lattice_symmetry_compiler_interface.tex:22` cite `references/text/OARWavelets.txt:405`; the actual "Lorentz/conformal convergence requires further work" sentence spans `references/text/OARWavelets.txt:405--406`.
   - CA-23 discusses OAR warnings at `report/sections/23_gaussian_boson_lorentz_roadmap.tex:107--112`, but its source block `:21--27` does not cite `references/text/OARWavelets.txt:405--406`.

6. **Numerical tolerances are used without a convention entry.**
   Law 2 requires tolerances to be recorded before relying on them. Gaussian code uses `1e-10` imaginary-part cutoffs in `src/GaussianBosons.jl:92` and `:113`, `atol=1e-10` for minima in `src/GaussianBosonNumerics.jl:138--146`, and a hand tolerance `5e-4` in `test/runtests.jl:180--183`. The tests also use Julia default `isapprox` tolerances throughout `test/runtests.jl:151--221`. `CONVENTIONS.md` has no numerical tolerance policy for Gaussian symbol checks.

7. **Mass and zero-mode policy is deferred but the code surface does not enforce the boundary.**
   The main local free-boson sources assume positive mass: `references/cft/Schottenloher2008/Schottenloher2008.md:4186` says `m > 0`, and `literature/md/2010.11121/2010.11121.md:623` gives the massive lattice dispersion. CA-24 and CA-25 defer massless zero-mode policy (`report/sections/24...:50--51`, `report/sections/25...:59--61`). The code accepts any `mass` and squares it (`src/GaussianBosons.jl:15--18`, `:61--66`; `src/GaussianBosonNumerics.jl:34--39`), and the doubler test uses `mass = 0` (`test/runtests.jl:220--221`). This is fine as coefficient algebra, but not as sourced Fock/Klein-Gordon representation evidence until the massless policy is fixed and the signed/nonnegative mass convention is recorded.

8. **Periodic momentum-grid convention is underspecified and differs from the centered source convention.**
   The local source uses centered dual lattices `{-r,...,r-1}` in `literature/md/2010.11121/2010.11121.md:274--293`. The code uses an uncentered grid `2*pi*(site-1)/(spacing*dims[axis])` in `src/GaussianBosonNumerics.jl:94--99`, matching `CONVENTIONS.md:206--208` but without saying the branch is uncentered. This is harmless for the current even-symbol eigenvalue comparisons (`test/runtests.jl:207--218`) but not for odd quantities such as boost-time residuals or low-energy-window tests.

9. **Coefficient validity is assumed more strongly in prose than in code.**
   The Gaussian convention requires real symmetric coefficients and stable nonnegative symbols (`CONVENTIONS.md:199--205`, `:219--223`). The helpers do not validate coefficient symmetry, positivity, finite range, or decay. `scalar_quadratic_symbol` only errors if the sampled value has imaginary part above `1e-10` (`src/GaussianBosons.jl:84--93`), and `periodic_stiffness_matrix` only checks offset dimension/reality (`src/GaussianBosonNumerics.jl:117--134`). This is acceptable for low-level helpers, but a compiler-facing claim must add fail-closed validators and tests.

10. **CA-23 roadmap is stale relative to the actual shard layout.**
    `report/sections/23_gaussian_boson_lorentz_roadmap.tex:86--101` says CA-27 will be real-space densities, CA-28 residuals, CA-29 KG, CA-30 counterexamples, and CA-31 numerical suite. The actual files are CA-27 residual/counterexamples and CA-28 numerical suite (`report/README.md:43--48`). This is not a mathematical error, but it degrades source navigation for future reviewers.

# Counterexamples/Failure Modes

- **Density-improvement ambiguity:** CA-23's `h_x -> h_x + div b_x` (`report/sections/23...:114--119`) changes first moments by boundary/current terms. A lattice stress-energy proposal that does not fix this can produce different boosts from the same total Hamiltonian.
- **Periodic first moments:** CA-17 notes `x_j=j` is not single-valued on a circle (`report/sections/17...:61--68`); CA-23 repeats that periodic first moments need a branch/sawtooth/Fourier convention (`report/sections/23...:121--124`). Any periodic finite-size stress-energy test using first moments without that convention is invalid.
- **Anisotropic cones:** CA-27's speeds `c_a` example (`report/sections/27...:98--115`) and `test/runtests.jl:198--204` show positive scalar coefficients can pass basic symbol checks while failing a single Lorentz cone.
- **Doublers:** CA-27's `sin^2(epsilon k)` example (`report/sections/27...:117--131`) and `test/runtests.jl:220--221` show correct Hessian at one point is not sufficient; patch/species data are required.
- **Finite symbol checks do not prove generator convergence:** CA-28 is clear that its checks are finite algebraic witnesses (`report/sections/28...:13--16`), while OAR explicitly leaves Lorentz/conformal convergence as further work (`references/text/OARWavelets.txt:405--406`).
- **Common-core algebra is not self-adjoint generator theory:** CA-26 states the caveat at `report/sections/26...:150--152`; the present tests do not close that analytic gap.

# Stress-Energy Density Proposal Notes

For **1+1 dimensions**, the clearest sourced material is the Koo-Saleur/OAR precedent:

- Continuum CFT on the circle has a Hamiltonian density `h(x)` as a local quantum field (`references/text/CFTFromLatticeFermions.txt:2128--2134`).
- That density is expressed through chiral and anti-chiral stress tensors (`references/text/CFTFromLatticeFermions.txt:2133--2138`), and its Fourier modes are linear combinations of Virasoro generators (`references/text/CFTFromLatticeFermions.txt:2163--2170`).
- Lattice KS approximants are built from Fourier modes of lattice Hamiltonian density plus commutator corrections (`references/text/CFTFromLatticeFermions.txt:2182--2197`).
- In the cited free massless lattice Dirac setting, smeared approximants converge to smeared Virasoro generators (`references/text/CFTFromLatticeFermions.txt:2233--2235`) and the unitary/automorphic actions converge (`references/text/CFTFromLatticeFermions.txt:2247--2257`).
- Vacuum subtraction / normal ordering and the correct scaling representation are load-bearing (`references/text/CFTFromLatticeFermions.txt:378--389`), and energy shifts/rescalings are explicitly allowed (`references/text/CFTFromLatticeFermions.txt:2258--2264`).

For **1D Lorentz boost-current prework**, CA-12 gives a checked finite identity:

- Open-chain `K_x=sum_j x_j h_j` gives `i[H,K_x]=sum_j (x_{j+1}-x_j)i[h_j,h_{j+1}]` under the nearest-neighbour commutation assumption (`report/sections/12_lattice_boost_current_1d.tex:24--73`).
- This supports a candidate energy-current/momentum-current layer, not a continuum stress-energy theorem (`report/sections/12...:99--104`).

For **higher dimensions**, the current record is not enough:

- Schottenloher sources continuum geometry and Poincare implementation, not local stress-energy density formulas for arbitrary QFTs (`references/cft/Schottenloher2008/Schottenloher2008.md:4092--4117`, `:4244`).
- CA-13's rotation-density formula needs a source for `T^{0a}`/momentum density, angular momentum currents, tensor conventions, and improvement terms.
- The Gaussian block gives one-particle symbol residuals, not real-space stress-energy density convergence.
- OAR/free-scalar sources cover translation/time dynamics and free-field scaling; they explicitly do not supply Lorentz/conformal convergence (`references/text/OARWavelets.txt:405--406`).

# Source/Convention Gaps

- Exact continuum stress-energy/Poincare-generator source with line anchors, including signs, metric, normalization, and improvement ambiguity.
- Real-space Gaussian Hamiltonian-density convention: site vs bond/cell density, symmetrization of `q_x V_r q_{x+r}`, vacuum subtraction, and boundary terms.
- Momentum-density/current convention in `d>1`, including orientation and support assignment for unordered overlapping density pairs.
- Periodic first-moment convention: branch, sawtooth, Fourier-mode replacement, or explicit "not available".
- Brillouin-zone branch convention: centered vs uncentered grids and how low-energy patches are selected.
- Mass convention: `mass > 0`, `mass >= 0`, or signed parameter with `mass^2`; separate massless zero-mode treatment.
- Numerical tolerance convention for symbol imaginary parts, eigenvalue comparisons, minima counting, and small-spacing asymptotics.
- Evidence labels distinguishing "locally derived in prose" from "covered by Julia tests".

# Recommended Fixes

1. Demote CA-26's status wording or add tests for boost-momentum, rotation-Hamiltonian, boost-boost, and second-quantization commutator identities. If left as prose derivation, cite it as "local derivation" rather than "checked" beyond the boost-time residual.
2. Add a `CONVENTIONS.md` entry for Gaussian numerical tolerances and update `src/GaussianBosons.jl`, `src/GaussianBosonNumerics.jl`, and tests to reference it.
3. Add a `CONVENTIONS.md` entry for Gaussian mass/zero-mode policy. Mark `mass=0` doubler tests as coefficient-only until the Fock/domain policy exists.
4. Add validators/tests for coefficient symmetry, sampled positivity, and dimension/offset consistency before compiler-level use.
5. Fix source anchor ranges in CA-14, CA-15, CA-16, CA-17, and CA-23 as noted above.
6. Update CA-23's shard roadmap to match the actual CA-27/CA-28 layout.
7. Before proposing a lattice stress-energy density, register a source for continuum stress-energy generators and add conventions for density improvement, normal ordering/vacuum subtraction, boundary policy, and higher-dimensional orientation.
