# Reviewer 03 -- Numerics and Examples Review

All paths below are relative to `/home/tobiasosborne/Projects/cft-anyons`.

## Scope Read

- Read `src/GaussianBosons.jl:1-117` and `src/GaussianBosonNumerics.jl:1-147`.
- Read Gaussian tests in `test/runtests.jl:151-223`, with nearby lattice-current tests at `test/runtests.jl:111-148`.
- Read relevant conventions in `CONVENTIONS.md:142-161` and `CONVENTIONS.md:194-235`.
- Read Gaussian Lorentz shards `report/sections/23_gaussian_boson_lorentz_roadmap.tex:1-151`, `report/sections/24_gaussian_boson_symbol_calculus.tex:1-165`, `report/sections/25_gaussian_boson_diagonalization.tex:1-139`, `report/sections/26_gaussian_boson_generator_algebra.tex:1-171`, `report/sections/27_gaussian_boson_residual_conditions.tex:1-151`, and `report/sections/28_gaussian_boson_numerical_suite.tex:1-121`.
- Also read the prior density/compiler context needed for the stress-energy proposal: `report/sections/12_lattice_boost_current_1d.tex:24-103`, `report/sections/14_koo_saleur_prototype.tex:31-92`, `report/sections/16_lattice_symmetry_compiler_interface.tex:24-98`, and `report/sections/17_lattice_symmetry_examples_queue.tex:61-99`.
- Ran `julia --project=. -e 'using Pkg; Pkg.test()'`; the current suite passed.

## Findings Ordered By Severity

1. **High: the periodic momentum grid is valid for symbol spectra but unsafe for momentum-generator and residual tests.**
   `periodic_momentum_grid` returns representatives `0, 2*pi/(epsilon L), ..., 2*pi(L-1)/(epsilon L)` in `src/GaussianBosonNumerics.jl:94-99`. That is enough for periodic symbol eigenvalues, but not for tests that compare to the continuum momentum generator `P_a = k_a` in `CONVENTIONS.md:212-218` and `report/sections/26_gaussian_boson_generator_algebra.tex:37-45`. The mode with integer label `n=L-1` is the small negative momentum `-2*pi/(epsilon L)`, but the current helper reports it as a large positive momentum near `2*pi/epsilon`. This will create false failures or false passes once `report/sections/28_gaussian_boson_numerical_suite.tex:112-117` adds boost/rotation residual norms. Add a centered dual-label grid before using finite periodic data for `P`, `J`, `K`, or low-energy windows.

2. **High: the finite periodic test compares only sorted eigenvalues, so it does not pin the Fourier convention.**
   The matrix uses `target_tuple = site_tuple + offset mod L` in `src/GaussianBosonNumerics.jl:124-132`, while symbol values are evaluated independently in `src/GaussianBosonNumerics.jl:107-108`. The test then checks only `sort(eigvals(Symmetric(stiffness))) ≈ sort(symbols)` in `test/runtests.jl:212-217`. This catches many coefficient errors, but it does not verify that the Fourier vector with a given dual label is the eigenvector with that same symbol. It also cannot catch sign/order mistakes hidden by real symmetric symbols, because `omega(k)^2 = omega(-k)^2`. `report/sections/28_gaussian_boson_numerical_suite.tex:112-116` correctly lists eigenvector tests as the next milestone; until that is implemented, the periodic convention is under-tested.

3. **High: the finite periodic sizes include aliasing cases that make the stencil less representative.**
   The test sizes include `[3, 2, 2]` in `test/runtests.jl:207-208`. With nearest-neighbour offsets, the `+e_a` and `-e_a` targets coincide when `L_a=2`, so the finite matrix aliases both bonds onto the same entry. The sorted-spectrum oracle still passes because the symbol aliases in the same way, but this is a weak stress test of locality, orientation, and density support. Periodic numerical tests meant to validate real-space stencils should include sizes with every `L_a > 2R` for interaction range `R`, plus separate small-torus alias tests if those are intentional.

4. **High: the report status says more generator algebra is checked than the tests actually check.**
   `report/sections/26_gaussian_boson_generator_algebra.tex:13-16` calls the shard a "checked local derivation" and its header says it derives exact commutators and residuals in `report/sections/26_gaussian_boson_generator_algebra.tex:3-5`. The only explicit check cited there is the boost-time symbol test at `report/sections/26_gaussian_boson_generator_algebra.tex:25`. The Julia tests cover boost-time symbols in `test/runtests.jl:168-185`, Hessians in `test/runtests.jl:187-205`, and periodic spectra in `test/runtests.jl:207-222`; they do not test the boost-momentum bracket in `report/sections/26_gaussian_boson_generator_algebra.tex:75-93`, the rotation-Hamiltonian residual in `report/sections/26_gaussian_boson_generator_algebra.tex:112-126`, or the boost-boost residual in `report/sections/26_gaussian_boson_generator_algebra.tex:128-152`. The status should be narrowed or the missing numerical/symbolic checks should be added.

5. **Medium-high: Hessian residual tests are necessary-only and currently allow stability false positives.**
   `low_energy_hessian_from_coefficients` computes only Taylor data at `k=0` in `src/GaussianBosonNumerics.jl:57-69`; `lorentz_hessian_residual` wraps it in `src/GaussianBosonNumerics.jl:77-81`. This does not check symbol non-negativity, single-patch structure, or a spectral gap away from the chosen patch, even though stability and zero-mode policy are stated in `report/sections/25_gaussian_boson_diagonalization.tex:55-61` and patch data are required in `report/sections/27_gaussian_boson_residual_conditions.tex:133-151`. A concrete 1D finite-range counterexample is coefficients `V_0=0`, `V_{+1}=V_{-1}=1`, `V_{+2}=V_{-2}=-0.5` at `epsilon=1`: the Hessian residual at `k=0` is zero for speed 1, but the symbol is `-3` at `k=pi`, so the oscillator is unstable.

6. **Medium: anisotropic and doubler examples are under-asserted.**
   The anisotropic test checks `diag(hessian) ≈ 2 .* speeds .^ 2` and then only `norm(residual) > 1` in `test/runtests.jl:198-204`. It should assert the full residual matrix, e.g. `residual ≈ Diagonal(speeds.^2 .- 1)`, so a wrong target-speed subtraction or off-diagonal bug cannot pass accidentally. The doubler test only checks `count_periodic_symbol_minima(doubler, [4, 4]) == 4` in `test/runtests.jl:220-221`; it does not verify that the doubler also passes the Hessian condition claimed in `report/sections/27_gaussian_boson_residual_conditions.tex:119-127`, nor does it check the locations of the minima or the `d=1` and `d=3` cases.

7. **Medium: coefficient preconditions are implicit rather than validated.**
   The scalar tier requires real symmetric coefficients `V_r=V_{-r}` in `CONVENTIONS.md:199-203` and `report/sections/24_gaussian_boson_symbol_calculus.tex:35-40`. The helpers mostly check dimensions and positive spacing: `_check_k_vector` is `src/GaussianBosons.jl:5-7`, `scalar_quadratic_symbol` checks dimensions and an imaginary residual only at the evaluated point in `src/GaussianBosons.jl:84-93`, and `periodic_stiffness_matrix` checks real coefficients but not paired offsets in `src/GaussianBosonNumerics.jl:127-132`. Before these helpers become compiler gates, add an explicit `validate_scalar_coefficients` check for integer offsets, common dimension, real coefficients, `V_r=V_{-r}`, finite range metadata, positivity on the chosen grid/window, and minimum locations.

8. **Low-medium: absolute imaginary tolerances are brittle.**
   `scalar_quadratic_symbol` and `boost_time_symbol_from_coefficients` reject imaginary parts with fixed `1e-10` thresholds in `src/GaussianBosons.jl:92` and `src/GaussianBosons.jl:113`. With small spacing, large coefficients scale like `epsilon^-2`; cancellation noise can exceed a fixed absolute tolerance even when the relative error is harmless. Use scale-aware `isapprox(imag(total), 0; atol, rtol)` or validate symmetry structurally before evaluating.

## Test Adequacy

The current tests are useful seed invariants, not yet a robust numerical verification layer.

- Covered well: nearest-neighbour KG coefficients reproduce the closed-form lattice dispersion in `test/runtests.jl:151-166`; boost-time symbols from coefficients match the closed form in `test/runtests.jl:168-185`; nearest-neighbour Hessians match `2I` in `test/runtests.jl:187-196`; finite periodic stiffness spectra match symbol values in `test/runtests.jl:207-218`.
- Partly covered: anisotropic cones and doublers are present, but the anisotropic residual is only thresholded in `test/runtests.jl:203-204`, and the doubler is tested only by one minimum count in `test/runtests.jl:220-221`.
- Not covered: centered finite momenta, Fourier eigenvectors, finite-difference derivative oracles for `1/2 grad omega^2`, rotation residuals, boost-boost residuals, positivity/stability, single-patch exclusion, mutation checks, open-boundary first-moment checks for the Gaussian system, and any density-level continuity equation.
- The test plan in `report/sections/23_gaussian_boson_lorentz_roadmap.tex:131-143` says the Julia layer should stay at invariant level; that is correct. The next invariants should be independent oracles, not more comparisons between helpers that share the same convention.

## Counterexamples/Failure Modes

- **Uncentered-momentum false residual:** for `L=4`, the current grid is `[0, pi/2, pi, 3pi/2]` at unit spacing by `src/GaussianBosonNumerics.jl:94-99`; the last entry should be treated as `-pi/2` for a low-energy continuum momentum branch. Any finite periodic residual comparing `sin(k)` to `k` over the raw grid will be meaningless near that point.
- **Small-torus aliasing:** the `[3, 2, 2]` test in `test/runtests.jl:207-208` wraps `+e_a` and `-e_a` onto the same target for the two-site directions. This is a separate finite-volume model, not a clean test of a nearest-neighbour infinite-lattice stencil.
- **Hessian-passing unstable symbol:** `V_0=0`, `V_{\pm1}=1`, `V_{\pm2}=-0.5` has `1/2 Hessian(omega^2)(0)-1=0` but negative symbol value at `k=pi`. It should be a required rejection witness for any Lorentz compile gate based on `src/GaussianBosonNumerics.jl:77-81`.
- **Hessian-passing multi-species symbol:** the doubler coefficients in `src/GaussianBosonNumerics.jl:34-49` are the right example class, but the tests should assert both Hessian success and multiple minima. This documents exactly why `report/sections/27_gaussian_boson_residual_conditions.tex:119-131` says Hessian data are not sufficient.
- **Hypercubic rotation artifact:** nearest-neighbour KG is isotropic only to quadratic order. `report/sections/24_gaussian_boson_symbol_calculus.tex:143-158` and `report/sections/26_gaussian_boson_generator_algebra.tex:112-126` identify the rotation residual, but no test measures its `O(epsilon^2 |k|^4)` low-energy scaling or verifies failure away from the low-energy patch.

## Stress-Energy Density Numerical Proposal

The next numerical layer should not jump directly from one-particle symbols to "stress tensor realized." It should first choose a lattice density convention and test local conservation identities.

1. **Fix the density convention first.**
   `CONVENTIONS.md:194-218` fixes the scalar Hamiltonian and one-particle boost-symbol convention, but not a local split of `H` into site/bond energy densities. `report/sections/23_gaussian_boson_lorentz_roadmap.tex:114-124` already flags density ambiguity and periodic first-moment ambiguity. Pick one KG density split, record it, and make all current/stress tests depend on that exact split.

2. **Open 1D tests should come first.**
   On an open chain, use the CA-12 pattern: `K = sum_j x_j h_j` and `i[H,K] = sum_j (x_{j+1}-x_j)i[h_j,h_{j+1}]` from `report/sections/12_lattice_boost_current_1d.tex:39-89`. For the Gaussian chain, represent quadratic observables as finite matrices on phase space and test:
   - energy conservation, `sum_j dot h_j = 0`;
   - local energy continuity, `dot h_j + j^E_{j+1/2} - j^E_{j-1/2} = endpoint terms`;
   - boost-time relation, `i[H,K]` equals the summed bulk momentum/current candidate plus explicit endpoints;
   - low-energy matrix elements of the current candidate agree with one-particle momentum `k` on centered wave packets.

3. **Periodic 1D tests should use Fourier weights, not raw first moments.**
   Periodic branches are explicitly unresolved in `CONVENTIONS.md:160-161`, `report/sections/12_lattice_boost_current_1d.tex:87-89`, and `report/sections/17_lattice_symmetry_examples_queue.tex:61-68`. For periodic chains, test density Fourier modes `H_n = sum_j exp(2*pi*i*n*j/L) h_j` with vacuum/ground-state subtraction, following the Koo-Saleur pattern in `report/sections/14_koo_saleur_prototype.tex:45-79`. Use centered dual labels and verify finite Fourier continuity equations mode-by-mode.

4. **For `1+1`, the stress-energy target is numerically approachable.**
   Energy density and energy current/momentum density are enough to start: check the two continuity equations for `T^{00}` and `T^{01}`, then in the massless/critical case test the chiral combinations suggested by Koo-Saleur-style modes. Do not promote Virasoro or conformal claims for the Gaussian boson until the missing source acquisition noted in `report/sections/23_gaussian_boson_lorentz_roadmap.tex:107-112` is resolved and zero-mode/compactification policy is fixed.

5. **For `d>1`, require full tensor components and orientation data.**
   Higher-dimensional tests need local momentum densities `T^{0a}` and stress components `T^{ab}` on oriented faces/cells. Start from finite-volume quadratic-form identities:
   - `dot h_x + sum_a nabla^-_a j^E_a(x+e_a/2) = 0`;
   - `dot p_a(x) + sum_b nabla^-_b tau_{ab}(x+e_b/2) = 0`;
   - antisymmetric stress residual controls rotation failure, while trace/improvement terms should be tracked separately.
   This needs the support/orientation convention that is still proposal-level in `report/sections/16_lattice_symmetry_compiler_interface.tex:50-62` and `report/sections/17_lattice_symmetry_examples_queue.tex:70-79`.

## Recommended Fixes

1. Add `centered_periodic_momentum_grid(sizes; spacing)` returning integer dual labels and centered physical representatives; keep the current grid only for periodic symbol evaluation where branch choice is irrelevant.
2. Add Fourier eigenvector tests for `periodic_stiffness_matrix`: for each centered label `n`, build `phi_n(x)` and assert `V * phi_n ≈ omega(k_n)^2 * phi_n`. Use sizes with `L_a > 2R`, mixed odd/even sizes, and at least one off-axis symmetric coefficient such as offsets `(1,1)` and `(-1,-1)`.
3. Add a finite-difference derivative oracle: compare `boost_time_symbol_from_coefficients` against central differences of `scalar_quadratic_symbol` for several generic symmetric finite-range coefficient sets.
4. Strengthen counterexample tests: assert the exact anisotropic residual matrix, assert doubler Hessian success plus minima count/locations in `d=1,2,3`, and add the Hessian-passing unstable-symbol rejection witness above.
5. Add `validate_scalar_coefficients` and `symbol_minimum_data` helpers before using these routines as compiler gates. They should fail loudly on unpaired offsets, non-real coefficients, dimension mismatch, negative finite-grid symbols, and multiple low-energy minima when a single KG species is requested.
6. Add rotation and boost-boost residual helpers with low-energy window tests. For nearest-neighbour KG in `d>1`, verify the expected shrinking-window scaling; for anisotropic and doubler systems, verify deliberate failure.
7. Record a small mutation checklist in the test file comments or worklog when implemented: flip the derivative sign, remove the `1/2`, flip the periodic offset direction, drop one `-r` coefficient, and perturb the doubler offset from `2` to `1`; each mutation should make at least one targeted test fail.
