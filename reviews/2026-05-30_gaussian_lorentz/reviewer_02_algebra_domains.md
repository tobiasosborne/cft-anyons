# Reviewer 02: Algebra, Signs, Domains, and Stress-Energy Notes

## Scope Read

Reviewed for algebraic signs, operator domains, finite-periodic branch issues,
Gaussian second quantization, and stress-energy implications:

- `CONVENTIONS.md:142`-`161`, `CONVENTIONS.md:194`-`235`
- `report/sections/10_lattice_symmetry_motivation.tex:31`-`119`
- `report/sections/11_continuum_bulk_symmetry_target.tex:29`-`108`
- `report/sections/12_lattice_boost_current_1d.tex:24`-`104`
- `report/sections/13_position_dependent_bulk_generators.tex:26`-`100`
- `report/sections/14_koo_saleur_prototype.tex:31`-`99`
- `report/sections/15_lattice_symmetry_acceptance_tests.tex:29`-`104`
- `report/sections/16_lattice_symmetry_compiler_interface.tex:24`-`98`
- `report/sections/17_lattice_symmetry_examples_queue.tex:24`-`113`
- `report/sections/23_gaussian_boson_lorentz_roadmap.tex:29`-`151`
- `report/sections/24_gaussian_boson_symbol_calculus.tex:28`-`165`
- `report/sections/25_gaussian_boson_diagonalization.tex:30`-`139`
- `report/sections/26_gaussian_boson_generator_algebra.tex:27`-`171`
- `report/sections/27_gaussian_boson_residual_conditions.tex:27`-`151`
- `report/sections/28_gaussian_boson_numerical_suite.tex:25`-`121`

I also checked the referenced local computational surface:
`src/CftAnyons.jl:110`-`178`, `src/GaussianBosons.jl:9`-`117`,
`src/GaussianBosonNumerics.jl:1`-`147`, and `test/runtests.jl:96`-`222`.
No tests were run; this is a review-only pass.

## Findings Ordered By Severity

1. **High: the conversion from vector-field Poincare brackets to self-adjoint
   quantum commutators is not fixed, but the Gaussian block uses one specific
   sign table.**

   CA-11 defines the continuum vector fields with
   `M_{\mu\nu}=x_\mu partial_\nu-x_\nu partial_\mu` at
   `report/sections/11_continuum_bulk_symmetry_target.tex:50`-`55` and records
   `[M_{01},P_0]=-P_1`, `[M_{01},P_1]=-P_0` at
   `report/sections/11_continuum_bulk_symmetry_target.tex:86`-`90`. It then
   states `[K_a,P_0]=-P_a` and explicitly leaves active/passive and
   self-adjoint-generator normalization signs open at
   `report/sections/11_continuum_bulk_symmetry_target.tex:92`-`102`.

   Later, CA-24 and CA-26 use a definite self-adjoint algebra:
   `i[H,K_a]=P_a` at
   `report/sections/24_gaussian_boson_symbol_calculus.tex:115`-`119`,
   `i[P_b,K_a]=delta_ab H` at
   `report/sections/26_gaussian_boson_generator_algebra.tex:75`-`90`, and
   `i[K_a,K_b]=J_ab + ...` at
   `report/sections/26_gaussian_boson_generator_algebra.tex:128`-`149`.
   This is internally recognizable as a physics self-adjoint sign convention,
   but the report has not stated the map
   `vector field X -> self-adjoint generator A_X`.

   This is not pedantic. `CONVENTIONS.md:146`-`156` fixes observable
   derivations as `delta_A(B)=i[A,B]` while also citing the Stone convention
   `U(t)=exp(-itA)`, and CA-10 writes `U(t)=exp(-itH)` at
   `report/sections/10_lattice_symmetry_motivation.tex:33`-`39`.
   Schottenloher's translation convention used locally is instead
   `U(q,1)=exp i(q^0P_0 - q^1P_1 - ...)`, cited in
   `CONVENTIONS.md:152`-`158` and visible at
   `references/cft/Schottenloher2008/Schottenloher2008.md:4113`-`4117`.
   A consistent convention can be chosen, but it is not yet in
   `CONVENTIONS.md`. Until it is, the residuals are formal algebraic filters,
   not checked Poincare-sign filters.

2. **High: the finite periodic "core" for `X_a=i partial_{k_a}` and
   `P_a=k_a` is not a well-defined exact finite-periodic object.**

   CA-26 allows either `C_c^\infty(U)` or "the corresponding
   trigonometric-polynomial core on a finite periodic Brillouin grid" at
   `report/sections/26_gaussian_boson_generator_algebra.tex:27`-`35`, then uses
   `[X_a,p_b]=i delta_ab` at
   `report/sections/26_gaussian_boson_generator_algebra.tex:56`-`70`.
   This cannot be literal on a finite grid: no finite-dimensional matrices can
   satisfy `[X,P]=iI`, since taking traces gives `0=i dim`. On a Brillouin
   torus, multiplication by `k_a` is also branch-dependent and not a smooth
   periodic multiplier.

   The report already knows this at the real-space level:
   `report/sections/12_lattice_boost_current_1d.tex:87`-`89` says periodic
   chains need an extra position convention,
   `report/sections/16_lattice_symmetry_compiler_interface.tex:81`-`88` says
   the compiler must fail without a periodic branch convention, and
   `report/sections/23_gaussian_boson_lorentz_roadmap.tex:121`-`124` warns
   that first moments on periodic lattices need a branch or sawtooth.
   The Gaussian one-particle layer reintroduces the same branch problem by using
   `P_a=k_a` and `X_a=i partial_{k_a}` on periodic momentum space.

   This should be split: low-energy open patches may use `C_c^\infty(U)` away
   from Brillouin cuts; finite periodic tests may check symbols and spectra; but
   finite periodic grids should not be described as carrying the exact canonical
   differential commutator unless a branch/interpolation convention and its
   boundary defect are explicitly part of the object.

3. **High: the one-particle Hilbert-space measure is not fixed, so the boost
   formula is not yet tied to the sourced Poincare representation.**

   CA-24 defines `X_a=i partial_{k_a}` and
   `K_a=1/2(X_a omega + omega X_a)` at
   `report/sections/24_gaussian_boson_symbol_calculus.tex:80`-`93`. CA-25
   summarizes the output as a "one-particle momentum Hilbert space on the chosen
   Brillouin zone" with `h_epsilon=omega_epsilon(k)` at
   `report/sections/25_gaussian_boson_diagonalization.tex:96`-`107`, but it
   does not specify the measure. CA-26 repeats the differential formulas at
   `report/sections/26_gaussian_boson_generator_algebra.tex:27`-`52`.

   The source base is measure-sensitive. The OAR scalar source defines a
   continuum one-particle scalar product with `gamma_m^{-1/2}` and
   `gamma_m^{1/2}` weights at
   `literature/md/2010.11121/2010.11121.md:648`-`650` and then realizes the
   representation on a mass-independent Fock space at
   `literature/md/2010.11121/2010.11121.md:667`-`670`. Schottenloher's free
   boson Poincare construction is a mass-shell construction with a natural
   Poincare action on Fock space, cited by the report at
   `report/sections/23_gaussian_boson_lorentz_roadmap.tex:26`-`27` and
   described at
   `references/cft/Schottenloher2008/Schottenloher2008.md:4244`.

   The symmetric boost `1/2(X omega + omega X)` is plausible on a flat
   `L^2(dk)` realization after a unitary change of variables. It is not the
   same statement as the Lorentz-invariant mass-shell representation unless the
   unitary equivalence and measure convention are written down. This is a
   current provenance gap, not just a missing detail.

4. **High: common-core identities are correctly caveated in places, but later
   phrasing still overpromotes them toward self-adjoint representation
   statements.**

   CA-15 correctly requires domains/topology for unbounded limits at
   `report/sections/15_lattice_symmetry_acceptance_tests.tex:38`-`39` and
   `report/sections/15_lattice_symmetry_acceptance_tests.tex:66`-`72`. CA-26
   also says commutators are identities on `D_0` and self-adjoint generator
   statements require a separate domain theorem at
   `report/sections/26_gaussian_boson_generator_algebra.tex:53`-`54`, and again
   at `report/sections/26_gaussian_boson_generator_algebra.tex:150`-`152`.

   The overclaim is in the transition language. CA-25 says all later generators
   "can be constructed first on the one-particle smooth momentum core and then
   second-quantized" at
   `report/sections/25_gaussian_boson_diagonalization.tex:133`-`139`. CA-26
   says second-quantized commutators reproduce one-particle commutators and the
   compiler can "lift the checked residuals to the Gaussian Fock space" at
   `report/sections/26_gaussian_boson_generator_algebra.tex:154`-`171`.

   For unbounded differential operators this is too fast. A symmetric
   first-order operator on `C_c^\infty(U)` is generally not essentially
   self-adjoint if the Hamiltonian vector-field flow reaches the boundary of
   `U` in finite time. On a bounded low-energy patch, boundary conditions or a
   maximal-flow construction are part of the operator. For `dGamma(A)`, one
   also needs `A` self-adjoint, a finite-particle core invariant under the
   relevant products, and a domain on which the commutators are meaningful.
   The algebra is good formal evidence, but it is not yet a Fock-space
   representation theorem.

5. **High: the massless zero-mode policy is deferred, but massless examples are
   already used in the Gaussian block.**

   CA-24 says nonnegative symbols need a separate zero-mode policy in the
   massless case at
   `report/sections/24_gaussian_boson_symbol_calculus.tex:50`-`51`. CA-25 says
   the one-particle formulas assume `omega_epsilon(k)>0` on the patch at
   `report/sections/25_gaussian_boson_diagonalization.tex:55`-`61`. CA-26 also
   starts on a connected patch where `omega(k)>0` at
   `report/sections/26_gaussian_boson_generator_algebra.tex:27`-`35`.

   However, the doubler counterexample is explicitly discussed with minima at
   zeros of the symbol at
   `report/sections/27_gaussian_boson_residual_conditions.tex:117`-`131`, and
   the test uses `mass = 0` at `test/runtests.jl:220`-`221`. The OAR source
   warns directly that massless fields have a zero-mode obstruction: the inverse
   dispersion is undefined at `k=0` and must be avoided, possibly by excluding
   the zero mode or using twisted boundary conditions, at
   `literature/md/2010.11121/2010.11121.md:1626`-`1628`.

   The massless examples are fine as rejection witnesses, but the text should
   not let them enter the same one-particle boost/domain pipeline as the
   massive `omega>0` case. For `m=0`, `omega=|k|` is non-smooth at `k=0` and
   the complex-structure factors involving `omega^{-1}` are singular.

6. **Medium: the lattice Hamiltonian-density normalization is not fixed at the
   level needed for stress-energy density claims.**

   The Gaussian convention uses
   `H = 1/2 sum_x p_x^2 + 1/2 sum_{x,r} q_x V_r q_{x+r}` at
   `CONVENTIONS.md:199`-`205` and
   `report/sections/24_gaussian_boson_symbol_calculus.tex:35`-`40`.
   The sourced lattice scalar Hamiltonian includes an `epsilon_N^d` factor and
   specific field/Weyl scaling powers at
   `literature/md/2010.11121/2010.11121.md:598`-`607`.

   This may be harmless for dimensionless symbol algebra if all variables have
   already been rescaled, but that rescaling is not recorded in
   `CONVENTIONS.md`. It becomes serious the moment `h_x` is read as an energy
   density `T_00(x)`: one must know whether `h_x` is an energy per site, an
   energy per physical cell, or an already-rescaled density. The same problem
   affects first moments `sum_x x_a h_x`, currents, and any proposed
   stress-energy tensor.

7. **Medium: higher-dimensional momentum and stress densities are only total
   currents, not local tensor densities.**

   CA-13 gives the scalar-ramp response as an unordered overlapping-pair sum
   after choosing an orientation at
   `report/sections/13_position_dependent_bulk_generators.tex:43`-`57` and
   says boosts give direction-current candidates at
   `report/sections/13_position_dependent_bulk_generators.tex:63`-`71`.
   Rotations are then built from a local momentum-density layer at
   `report/sections/13_position_dependent_bulk_generators.tex:73`-`87`, but the
   shard ends by saying no cell-orientation, periodic wrapping, or
   higher-dimensional convergence convention is fixed at
   `report/sections/13_position_dependent_bulk_generators.tex:96`-`100`.

   The total formula `P_a^{lat}=i[H,sum_r r^a h_r]` in
   `report/sections/16_lattice_symmetry_compiler_interface.tex:50`-`54` does not
   yet produce a local density `p_a(r)`. It produces an oriented bond/pair
   current total. To define a stress tensor, one needs a discrete continuity
   equation assigning bond currents to cells/faces and then a second continuity
   equation for momentum density. That allocation is exactly where improvement
   terms and lattice anisotropies live.

8. **Medium: the "single minimum + isotropic Hessian" target statement is still
   weaker than a Poincare scaling theorem.**

   CA-23 states the theorem-shaped goal using locality, positivity, a single
   low-energy minimum, and isotropic Klein-Gordon Taylor data at
   `report/sections/23_gaussian_boson_lorentz_roadmap.tex:74`-`83`.
   CA-27 correctly says Hessian data are necessary but not sufficient at
   `report/sections/27_gaussian_boson_residual_conditions.tex:117`-`131` and
   records residual/patch data at
   `report/sections/27_gaussian_boson_residual_conditions.tex:133`-`151`.

   The remaining risk is that the high-level roadmap phrase can be read as
   promising too much. One also needs convergence of the dispersion on shrinking
   physical momentum windows, control of spectral weight outside the patch,
   scaling maps and states, and local observable covariance. CA-15 already
   requires those at
   `report/sections/15_lattice_symmetry_acceptance_tests.tex:66`-`84`; CA-23
   should keep that qualification adjacent to the theorem-shaped statement.

9. **Low/medium: the finite periodic numerical suite verifies symbol spectra,
   not generator algebra.**

   CA-28 checks the stiffness matrix eigenvalues against Brillouin-grid symbol
   values at `report/sections/28_gaussian_boson_numerical_suite.tex:37`-`59`,
   and the implemented tests do exactly that at `test/runtests.jl:207`-`222`.
   This is a good invariant, but it does not test finite boosts, finite
   rotations, branch choices, or commutator closure. CA-28 acknowledges next
   milestones at `report/sections/28_gaussian_boson_numerical_suite.tex:110`-`121`.
   Until those exist, references to "finite periodic examples" should remain
   symbol/eigenvalue examples only.

## Derivation Checks

- **CA-12 nearest-neighbour current.** The algebra at
  `report/sections/12_lattice_boost_current_1d.tex:49`-`70` is correct for a
  finite open chain with density terms that commute beyond nearest neighbours:
  each unordered adjacent pair contributes
  `(x_{j+1}-x_j)i[h_j,h_{j+1}]`. The self-adjointness sentence at
  `report/sections/12_lattice_boost_current_1d.tex:72`-`73` is correct for
  bounded finite-dimensional terms. For unbounded densities it needs a common
  invariant domain, which the shard defers at
  `report/sections/12_lattice_boost_current_1d.tex:101`-`104`.

- **CA-24 boost-time symbol.** On a smooth flat-measure core and with
  `K_a=1/2(X_a omega + omega X_a)`, `X_a=i partial_a`, the computation at
  `report/sections/24_gaussian_boson_symbol_calculus.tex:97`-`113` is correct:
  `i[omega,K_a]=omega partial_a omega=1/2 partial_a omega^2`. The sign is an
  internal convention; the missing part is tying that convention to CA-11 and
  Schottenloher.

- **CA-26 boost-momentum bracket.** The derivation at
  `report/sections/26_gaussian_boson_generator_algebra.tex:75`-`90` is
  algebraically correct on the same core:
  `[p_b,K_a]=-i delta_ab h`, hence `i[p_b,K_a]=delta_ab h`.

- **CA-26 rotation residual.** The formula
  `i[h,J_ab]=k_b partial_a omega - k_a partial_b omega` at
  `report/sections/26_gaussian_boson_generator_algebra.tex:112`-`126` is correct
  on a non-periodic momentum patch. On a Brillouin torus, `k_a` is a branch
  coordinate, so the formula is patch-local only.

- **CA-26 boost-boost residual.** With
  `K_a=i(omega partial_a + 1/2 partial_a omega)`, the computation gives
  `i[K_a,K_b]=J_ab + R_b X_a - R_a X_b`; the zero-order divergence term cancels
  because `R` is a gradient. Thus
  `report/sections/26_gaussian_boson_generator_algebra.tex:128`-`149` is a
  correct formal differential-operator identity. The sign relative to the
  vector-field bracket `[M_{0a},M_{0b}]=-M_{ab}` still depends on the missing
  vector-field-to-self-adjoint convention.

- **CA-27 Hessian residual.** The Hessian calculation at
  `report/sections/27_gaussian_boson_residual_conditions.tex:54`-`75` is
  correct:
  `partial_a partial_b omega^2(0)=-epsilon^2 sum_r r_a r_b V_r`, so
  `1/2 Hessian - c^2 I` is the quadratic speed residual. The nearest-neighbour
  KG and anisotropic examples at
  `report/sections/27_gaussian_boson_residual_conditions.tex:77`-`115` match
  the Julia helpers in `src/GaussianBosonNumerics.jl:52`-`80`.

## Counterexamples/Failure Modes

- **Finite periodic CCR no-go.** If the phrase
  `report/sections/26_gaussian_boson_generator_algebra.tex:32`-`35` is read as
  an exact finite-grid differential core with `[X,p]=i`, it is false by trace:
  finite matrices satisfy `tr([X,p])=0`, while `tr(iI)=i dim`.

- **Brillouin branch defect.** On a periodic Brillouin zone, `p_a=k_a` is a
  sawtooth coordinate after choosing a fundamental domain. Then
  `partial_a k_a=1` only away from the cut; distributionally there is a boundary
  defect. This is the momentum-space version of the real-space warning in
  `report/sections/12_lattice_boost_current_1d.tex:87`-`89`.

- **Massless KG zero mode.** For `m=0`, `omega(k)=|k|` at the continuum point.
  The complex structure uses `omega^{-1}` in the sourced scalar construction
  (`literature/md/2010.11121/2010.11121.md:648`-`650`), and the source warns
  that the zero mode must be excluded or otherwise handled at
  `literature/md/2010.11121/2010.11121.md:1626`-`1628`. The boost core in
  `report/sections/26_gaussian_boson_generator_algebra.tex:27`-`35` explicitly
  assumes `omega>0`, so it does not include the massless zero.

- **Density improvement ambiguity.** CA-23 already flags
  `h_x -> h_x + div b_x` at
  `report/sections/23_gaussian_boson_lorentz_roadmap.tex:114`-`119`. This
  changes first moments by boundary/current terms and can change a proposed
  local stress tensor even when the total Hamiltonian is unchanged.

- **Anisotropic cone.** The anisotropic example at
  `report/sections/27_gaussian_boson_residual_conditions.tex:98`-`115` is a
  valid rejection witness: correct positivity and locality are not enough if
  the Hessian speed matrix is not a scalar multiple of the identity.

- **Doubler species.** The doubler symbol at
  `report/sections/27_gaussian_boson_residual_conditions.tex:117`-`131` is a
  valid rejection witness: correct Hessian at one minimum does not determine a
  single relativistic species. The finite test at `test/runtests.jl:220`-`221`
  catches this on an even periodic grid.

## Stress-Energy Density Proposal Notes

- **Energy density candidate.** The algebra points first to the chosen
  Hamiltonian-density decomposition `H=sum h_j`, not to the black-box operator
  `H`. CA-10 makes this explicit at
  `report/sections/10_lattice_symmetry_motivation.tex:46`-`64`, and CA-16 makes
  a missing density decomposition a compiler failure at
  `report/sections/16_lattice_symmetry_compiler_interface.tex:37`-`39`. For a
  stress-energy proposal, this is the natural lattice `T_00` candidate, but it
  is convention-dependent and must include cell-volume normalization.

- **Momentum density/current candidate.** In 1d, the first energy moment
  `K=sum x_j h_j` produces the current sum
  `sum (x_{j+1}-x_j)i[h_j,h_{j+1}]` at
  `report/sections/12_lattice_boost_current_1d.tex:66`-`70`. In higher
  dimensions, CA-13 generalizes this to an oriented overlapping-pair response
  at `report/sections/13_position_dependent_bulk_generators.tex:50`-`57`.
  This suggests that `T_0a` or momentum density should be reconstructed from
  energy-current/continuity data, not simply guessed as an onsite scalar.

- **Stress/current components.** A true lattice stress tensor needs more than
  the total `P_a`. It needs a local continuity equation
  `i[H,h_x] + div j^E_x = 0` for energy current, and then a momentum-continuity
  equation `i[H,p_a(x)] + div T_{ab}(x) = 0`. The reviewed shards currently
  contain the first-moment commutator algebra that suggests `p_a` totals, but
  not the local assignment of bond currents to faces/cells required for
  `T_{ab}`.

- **2d CFT precedent.** CA-14 is the strongest sourced precedent:
  Hamiltonian density is built from chiral and anti-chiral stress tensors at
  `report/sections/14_koo_saleur_prototype.tex:31`-`43`, and Koo-Saleur lattice
  modes are weighted Hamiltonian-density modes plus commutator corrections at
  `report/sections/14_koo_saleur_prototype.tex:45`-`65`. This supports a
  future stress-energy-density proposal in 1+1 dimensions, but it is not yet a
  general d>1 construction.

- **What breaks in d>1.** Rotations require a local vector momentum-density
  layer, not just a scalar energy density; CA-13 states this at
  `report/sections/13_position_dependent_bulk_generators.tex:73`-`87`.
  The missing choices are exactly the hard ones: oriented supports, face/cell
  assignment, improvement terms, branch conventions, and anisotropic lattice
  artifacts. Without those, `J_ab=sum (x_a p_b-x_b p_a)` is only a continuum
  mnemonic, not a checked lattice stress-current construction.

## Recommended Fixes

1. Add a new convention entry fixing the map from continuum vector fields to
   self-adjoint generators. It should state the translation unitary sign,
   whether the Lie algebra map is a homomorphism or anti-homomorphism, and the
   resulting target table for `i[H,K_a]`, `i[P_b,K_a]`, `i[K_a,K_b]`, and
   rotations. Then update CA-11, CA-24, and CA-26 to cite that convention.

2. Split the Gaussian generator algebra into "open low-energy momentum patch"
   and "finite periodic numerical symbol" cases. Remove or qualify the finite
   periodic "trigonometric-polynomial core" language in
   `report/sections/26_gaussian_boson_generator_algebra.tex:32`-`35` unless a
   branch/interpolation convention and its boundary defect are defined.

3. Fix the one-particle Hilbert-space measure in `CONVENTIONS.md (j)`. State
   whether the algebra is on flat `L^2(dk)`, weighted OAR one-particle space,
   or Lorentz-invariant mass-shell measure, and derive
   `K=1/2(X omega + omega X)` from that choice or via an explicit unitary
   transform.

4. Restrict the checked Gaussian boost/domain block to the massive
   `omega>0` case until a massless zero-mode policy is written. Keep massless
   doubler examples as counterexamples/rejection tests, but label them outside
   the current positive-dispersion generator theorem.

5. Downgrade second-quantization language from "lift to Gaussian Fock space" to
   "formal `dGamma` identities on the algebraic finite-particle core" until
   essential self-adjointness, common cores, and exponentiable unitary groups
   are proved or sourced.

6. Add a stress-energy density convention before any proposal shard uses
   `h_x` as `T_00`: site vs cell normalization, epsilon powers, symmetric split
   of `q_x V_r q_{x+r}` over sites/bonds, orientation of bond currents, and
   permitted improvement terms.

7. Add targeted tests or symbolic checks for the sign table and for the finite
   periodic no-go/branch behavior. The existing tests at `test/runtests.jl:151`
   -`222` are good symbol tests, but they do not yet test generator-domain or
   Poincare-sign claims.
