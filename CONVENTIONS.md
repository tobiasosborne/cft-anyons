# CONVENTIONS — cft-anyons

Where the lab book defines *what* a term means, this file fixes *how* it is
represented: which gauge, which index base, which sign, which normalization.
**Law 2 (AGENTS.md): record a convention here before you rely on it.** This
subject is convention-dense; silent drift is the dominant source of
wrong-but-plausible results.

Changing an existing convention is a Core-tier change (AGENTS.md Rule 12): it
needs a sweep of every shard/file that follows it.

## Claim-status labels

Used throughout the lab book (referenced by CA-00). They are part of the record.

- **Question** — an open question; no commitment.
- **Proposal** — a hypothesis/construction proposed but not yet supported.
- **Source-local** — backed by a cited local source (`references/...:line`).
- **Checked** — backed by a passing test, derivation, or reproducible run.
- **Rejected** — tried and found wrong; kept so it is not re-attempted.

## Schema for each convention entry

```
## (<letter>) <name>
**Choice:** <the canonical decision>      (or: NOT YET FIXED — fix at first use)
**Reasoning:** <why; what was rejected; relevant hallucination-risk callout>
**Source:** <references/...:line | report shard ID | external ref>
**Sweep status:** <which shards/files follow this; outliers flagged>
```

---

## Convention slots (to be fixed at first use)

These are the known convention-sensitive choices (AGENTS.md
"Convention-sensitivity"). Each is **NOT YET FIXED** — the first shard that needs
it must fix it here, with a source, in the same change. The archived
`archive/legacy-consolidation/CONVENTIONS.md` worked several of these out in
detail and is useful as *reference prior art* (dead, not canonical — re-derive
and re-cite).

## (a) Vacuum / unit-object index
**Choice (object level — FIXED, CA-02):** The **vacuum is the complex line `ℂ`**,
i.e. the monoidal unit of the tensor product `⊗` and the degree-0 (zero-particle)
sector. It is a one-dimensional space carrying the unit vacuum vector `Ω`. It is
**distinct from the zero space `{0}`**, which is the unit of the direct sum `⊕`
(empty `⊗` = `ℂ`; empty `⊕` = `{0}`).
**Choice (index level — FIXED, CA-65/CA-66 block):** enumerations of `Irr(C)`
list the **unit object first**; Julia implementations use 1-based indexing with
the unit at index 1 (so Fibonacci is `[1, τ]`, matching the central-edge basis
order `{1, τ}` of the sourced F-matrix in (b)).
**Reasoning:** the object-level vacuum is forced by the AND/OR/vacuum grammar
(CA-02): "vacuum = ℂ" is the ⊗-unit, not the ⊕-unit. The index-level convention is
orthogonal and not yet needed.
**Source:** `report/sections/02_and_or_vacuum_grammar.tex` (CA-02, "Two Monoidal
Structures and Their Units"); `references/cft/Schottenloher2008/Schottenloher2008.md:4218`
("H_0 = ℂ with the vacuum Ω := 1 ∈ H_0").
**Sweep status:** CA-02, CA-03 use vacuum `= ℂ` (`\one`) and zero space `= {0}`
(`\zero`) per this convention.

## (b) F-symbol / R-symbol gauge
**Choice (F-symbols — FIXED, CA-65/CA-66 block):** the categorical word-algebra
block uses the **unitary gauge**: fusion-tree vertex spaces carry orthonormal
bases, every F-matrix is unitary, and the dagger of a morphism is the entrywise
conjugate transpose of its fusion-tree matrix presentation.  Trivial-label
F-symbols are `F^{1ττ} = F^{τ1τ} = F^{ττ1} = 1`-type identities.  For Fibonacci
the single nontrivial matrix, in central-edge basis `{1, τ}`, is
`F^{τττ}_τ = [[φ⁻¹, φ^{-1/2}], [φ^{-1/2}, -φ⁻¹]] = (F^{τττ}_τ)† = (F^{τττ}_τ)⁻¹`
with `φ = (√5+1)/2`.
**Choice (R-symbols — NOT YET FIXED):** no braiding/R-symbol convention is
fixed; no shard may use R-data yet.
**Reasoning:** only in a unitary gauge is the *-operation of the anyonic word
algebra (CA-65) the naive conjugate transpose of matrix presentations; an
involutory gauge (TensorCategories.jl) presents the same abstract *-algebra
with a star that is NOT conjugate-transpose, so importing entries across gauges
silently corrupts inner products.  For Fibonacci the nontrivial block is
simultaneously unitary and involutory (real symmetric orthogonal), so the
ambiguity bites only trivial-label normalizations and cup/cap conventions —
exactly where drift would be invisible; see (r) for the cup normalization.
**Source:** `references/text/TrebstShortIntroductionFibonacciAnyons.txt:310`--`:311`
(trivial-label F's, eq. 2.2), `:318`--`:324` (unitary `F^{τττ}_τ`, eq. 2.4);
`references/text/FibonacciAnyonModels.txt:299`--`:302` (same matrix, eq. 2.4);
`references/text/PenneysUnitaryFusionCategories.md:610`--`:631` (unitary Fib data).
**Sweep status:** CA-65/CA-66 use this convention.  CA-09 is kinematic-only
(no F-data) and is unaffected.  Any import from TensorCategories.jl must be
gauge-converted and checked against this entry first.

## (c) Fusion-tree bracketing and label order
**Choice (kinematic path basis — FIXED, CA-09):** Fibonacci path-count examples
use the left-associated fusion tree. For `n` physical `tau` atoms, write
`x_0 = 1` and let `x_i in {1,tau}` be the cumulative charge after successively
fusing the first `i` atoms from left to right; fixing `x_n = c` fixes the total
charge sector. This is only a basis convention for kinematic sector counting.
**Choice (coherence / F-symbol level — NOT YET FIXED):** no `F`-symbol gauge,
`R`-symbol gauge, or canonical identification of different fusion-tree bases is
fixed yet.
**Reasoning:** the path-count recurrence uses only one chosen fusion tree and
the fusion-rule admissibility projector. Different fusion orders are related by
F-moves, so the tensor-category compiler will need coherent `F`-data before it
can identify or transform between such bases.
**Source:** `references/text/FibonacciAnyonModels.txt:227`--`:235` (different
fusion orders give fusion-tree bases related by an F-move); CA-09.
**Sweep status:** CA-09 uses the kinematic path-basis convention; no shard may
use this as an `F/R` convention.

## (d) CFT normalizations
**Choice:** NOT YET FIXED.
**Reasoning:** central charge, Virasoro mode convention, OPE-coefficient
normalization, chiral vs full — record before use.
**Source:** —
**Sweep status:** —

## (e) Lattice conventions
**Choice:** NOT YET FIXED.
**Reasoning:** Hamiltonian sign, orientation, boundary type, star/plaquette
naming.
**Source:** —
**Sweep status:** —

## (f) Symmetry data in the Hilbert-space grammar
**Choice:** A symmetry on a Hilbert carrier is recorded as a strongly continuous
unitary representation `U : G -> U(H)`. A projective symmetry is handled, in this
pre-work grammar, by replacing it with an honest unitary representation of a
specified central extension `E -> G`; no cocycle-level calculus is used until a
later convention fixes multipliers. The vacuum sector `C` carries the trivial
action, and the zero space carries the unique action. Grammar propagation uses
direct sums for OR and tensor products for AND. Fock-style notation is derived,
not primitive grammar: from `(H,U)` it denotes the graded Hilbert direct sum of
tensor-power representation sectors `⊕̂_{n>=0} (H^⊗̂n, U^⊗̂n)`, with finite
truncations as finite ORs of tensor powers.
**Reasoning:** this keeps the syntax inside ordinary Hilbert-space
representation theory while still supporting the project's projective-unitary
north star. It also avoids silently tensoring projective multipliers with
incompatible cocycles.
**Source:** `references/cft/Schottenloher2008/Schottenloher2008.md:1524`
(unitary representation), `:1528` (projective representation), `:1570` and
`:1618` (central-extension lift); `references/text/PenneysUnitaryFusionCategories.md:323`
(`Rep^\dagger(G)`); CA-05.
**Sweep status:** CA-04--CA-08 use this convention.

## (g) Sector, projection, and quotient semantics
**Choice:** A sector of a compiled Hilbert carrier is represented first by an
orthogonal projection `P^2 = P = P^*`; its Hilbert space is `Ran(P)` with the
inherited inner product. A quotient presentation is admitted only when the
closed relation subspace is named. For a finite group action, the invariant
quotient is `H / span{U(g)v - v}` and is identified with `Ran(P_G)` through the
averaging projection `P_G = |G|^{-1} sum_g U(g)`. More generally, for a finite
group action and a one-dimensional unitary character `chi`, the character sector
uses `P_chi = |G|^{-1} sum_g conj(chi(g)) U(g)`; the invariant sector is
`chi = 1`. Observable algebras must be named explicitly: full `B(H)`,
block-preserving, tensor-local, invariant, or compressed `P A P` on `Ran(P)`.
**Reasoning:** "symmetry = quotient" is too imprecise: the Hilbert quotient is
controlled by a closed relation subspace, and the computationally stable object
is the projection. Explicit observable policies prevent confusing
`B(H \oplus K)` with `B(H) \oplus B(K)` or a tensor-local subalgebra.
**Source:** `references/text/PenneysUnitaryFusionCategories.md:219` (orthogonal
direct sums give projections), `:235` (orthogonal projections and splittings);
CA-06 local derivation and `test/runtests.jl` finite-group invariant check;
CA-07--CA-08 for one-dimensional exchange-character sectors.
**Sweep status:** CA-04--CA-08 and `src/CftAnyons.jl` finite projector helpers.

## (h) Lattice bulk-symmetry candidate generators
**Choice:** Lattice-symmetry motivation shards use finite open chains unless a
periodic boundary is explicitly named. A local Hamiltonian is written
`H = sum_j h_j` with self-adjoint finite-range density terms. Candidate
generators are self-adjoint operators; their infinitesimal action on observables
is `delta_A(B) = i[A,B]`. For a one-dimensional boost ansatz, site positions
are real numbers `x_j` and `K_x = sum_j x_j h_j`. If non-neighbouring density
terms commute, the candidate bulk momentum density produced by `i[H,K_x]` has
nearest-neighbour coefficients `x_{j+1} - x_j`; for unit spacing this is
`sum_j i[h_j,h_{j+1}]`, up to endpoint and sign conventions.
**Reasoning:** Schottenloher fixes Stone's theorem with `U(t)=exp(-itA)`, while
the Wightman/Poincare discussion uses translation generators with its own sign
choice. For the lattice pre-work, the robust object is the self-adjoint
commutator expression `i[H,K]`; global signs are kept explicit and not silently
identified across active/passive conventions.
**Source:** `references/cft/Schottenloher2008/Schottenloher2008.md:4040`--`:4050`
(Stone convention), `:4113`--`:4117` (translation generators and `P_0=H`);
CA-12 local derivation; `test/runtests.jl` lattice current coefficient check.
**Sweep status:** CA-10--CA-17 use this convention; no periodic-boundary
first-moment or higher-dimensional orientation convention is fixed yet.  The
finite Gaussian periodic grids in (j) are symbol/eigenvalue checks, not a
periodic position convention.

## (i) Galilean symmetry candidates and mass density
**Choice:** Galilean follow-up shards use Newtonian coordinates
`(t,x_1,...,x_d)` and vector fields
`H = partial_t`, `P_a = partial_a`, `G_a = t partial_a`, and
`J_ab = x_a partial_b - x_b partial_a` for `1 <= a < b <= d`.  With this
active vector-field convention,
`[H,G_a] = P_a`,
`[J_ab,P_c] = delta_{bc} P_a - delta_{ac} P_b`, and the same rotation law holds
for `G_c`.  The unextended vector-field bracket has `[G_a,P_b]=0`.  The
projective quantum layer may require a mass central extension; in the checked
canonical-commutator convention, a one-particle boost at `t=0` is represented by
`m X_a` and obeys `[mX_a,P_b] = i m delta_{ab}`.  Therefore Galilean lattice
boost candidates are first moments of a conserved mass/particle-number density,
not first moments of the energy density.  The Lorentzian lattice boost ansatz
`sum_x x_a h_x` from (h) is not reused for Galilean boosts unless an additional
nonrelativistic source or derivation identifies energy and mass density in the
model.
**Reasoning:** Schottenloher records the Galilei group as the classical symmetry
for free nonrelativistic particles and supplies the projective-representation
and central-extension framework.  The detailed bracket table here is a local
vector-field derivation checked by the Julia test suite.  The mass central
coefficient is checked only as a canonical-commutator calculation; this
repository still lacks a registered source specifically for the named Bargmann
mass extension of the Galilei group.
**Source:** `references/cft/Schottenloher2008/Schottenloher2008.md:1440`--`:1447`
(Galilei group example), `:1524`--`:1532` (unitary/projective representations),
`:1548`--`:1577` (central-extension lift), `:4040`--`:4050` (Stone convention);
`test/runtests.jl` testsets "Galilei vector-field brackets" and "Galilei mass
central coefficient"; CA-18--CA-22.
**Sweep status:** CA-18--CA-22 use this convention.

## (j) Translation-invariant Gaussian boson symbols
**Choice:** The Gaussian-boson Lorentz block uses spatial dimensions
`d in {1,2,3}` and continuum target dimension `D=d+1`.  The default finite
numerical model is a periodic hypercubic lattice; the default algebraic model is
the corresponding translation-invariant infinite-lattice or Brillouin-zone
symbol.  The first tier is a scalar real canonical boson with fields `q_x,p_x`
obeying `[q_x,p_y]=i delta_xy` and Hamiltonian
`H = 1/2 sum_x p_x^2 + 1/2 sum_{x,r} q_x V_r q_{x+r}`, with real symmetric
quasi-local coefficients `V_r=V_{-r}`.  Its Fourier symbol is
`omega(k)^2 = sum_r V_r exp(i epsilon k.r)`.  The nearest-neighbour lattice
Klein-Gordon example has
`omega_{epsilon,m}(k)^2 = m^2 + 2 epsilon^{-2} sum_a (1-cos(epsilon k_a))`.
The Gaussian helper keyword `mass` is a nonnegative physical mass label
`m >= 0`; there is no signed-mass convention.  Positive-dispersion generator
statements, including the oscillator complex structure, Fock bookkeeping, and
flat boost formula below, are used only on patches where `omega(k)>0`.  The
sourced free-boson Wightman example assumes `m>0`, and the OAR lattice source
flags the massless zero mode because `gamma_m(k)^{-1}` is then undefined at
`k=0`.  Thus `mass=0` examples are coefficient-level symbol/residual tests
until a zero-mode policy is fixed; they are not evidence for the current
positive-dispersion generator theorem.  Negative numeric masses are outside the
documented Gaussian API even though current coefficient formulas only contain
`mass^2`; validation is deferred to the planned coefficient-validator step.
Finite periodic numerical checks use momenta
`k_a = 2 pi n_a / (epsilon L_a)` and the real-space stiffness matrix
`V_{xy} = sum_r V_r 1_{y=x+r mod L}`; its eigenvalue oracle is the list of
symbol values on this Brillouin grid.  The finite Fourier vector for integer
dual label `n` has components
`|Lambda|^{-1/2} exp(2 pi i sum_a n_a x_a / L_a)` in zero-based site
coordinates, so the `x+r` stiffness convention gives eigenvalue
`sum_r V_r exp(2 pi i n.r / L)`.  These finite periodic checks are
symbol/eigenvector/eigenvalue checks only.  They do not introduce finite
matrices `X_a, P_b` satisfying the exact differential commutator
`[X_a,P_b]=i delta_ab`; in finite dimension the trace of a commutator is zero,
while the trace of `i delta_ab I` is not.  Any finite periodic first-moment,
position-coordinate, or momentum-coordinate generator test must first name a
branch, sawtooth, Fourier-interpolation, or other periodic coordinate
convention.
For low-energy window selection only, the helper
`centered_periodic_momentum_grid` uses centered integer dual representatives
`n_a in {-floor(L_a/2), ..., ceil(L_a/2)-1}` and physical representatives
`k_a = 2 pi n_a / (epsilon L_a)`.  This is a momentum-label branch for finite
symbol sampling; it is not a periodic position-coordinate convention and does
not by itself define finite boost or rotation generators.
Gaussian numerical helpers use explicit named tolerances rather than default
`isapprox`.  The nearly-real symbol validators use
`GAUSSIAN_SYMBOL_IMAG_ATOL = 1e-10` and
`GAUSSIAN_SYMBOL_IMAG_RTOL = 1e-10`, applied as a scale-aware comparison of the
complex symbol with its real part after the dimension and spacing preconditions
have been checked.  Exact symbol/Hessian value checks use
`GAUSSIAN_SYMBOL_VALUE_ATOL = 1e-10` and
`GAUSSIAN_SYMBOL_VALUE_RTOL = 1e-10`.  Finite periodic eigenvalue comparisons
use `GAUSSIAN_EIGENVALUE_ATOL = 1e-10` and
`GAUSSIAN_EIGENVALUE_RTOL = 1e-10`.  Periodic minima counts use
`GAUSSIAN_MINIMUM_COUNT_ATOL = 1e-10` and
`GAUSSIAN_MINIMUM_COUNT_RTOL = 1e-10`, so a near-degenerate minimum is counted
only if it is numerically equal to the minimum under that scale-aware policy.
The small-spacing sample residual uses
`GAUSSIAN_SMALL_SPACING_RESIDUAL_ATOL = 5e-4` and
`GAUSSIAN_SMALL_SPACING_RESIDUAL_RTOL = 1e-10`; this is a named finite-sample
test tolerance, not a continuum error bound.
The low-energy Hessian residual is
`1/2 Hessian(omega^2)(0) - c^2 I`, equivalently
`-epsilon^2/2 sum_r r_a r_b V_r - c^2 delta_ab`.
At the one-particle local-symbol level, CA-24--CA-26 work on the flat momentum
space `L^2(U, dk)` on a smooth open patch `U`.  Thus
`X_a=i partial_{k_a}` is the flat-measure differential operator, and the
time-zero Lorentz-boost candidate is the flat-measure symmetric formula
`K_a = 1/2 (X_a omega + omega X_a)`.  Then
`i[H,K_a]` has multiplication symbol `1/2 partial_a omega(k)^2`; the continuum
Klein-Gordon condition with speed `c=1` is that this tends to `k_a`, equivalently
`omega(k)^2 = m^2 + |k|^2 + higher irrelevant lattice corrections` near
`k=0`.  The speed-`c` variant replaces this by `c^2 k_a`.  These commutator
signs use the vector-field-to-Stone-generator map in (k).

This is not yet identified with the weighted OAR one-particle Hilbert space
`\mathfrak h_L`, whose sourced scalar product uses
`gamma_m^{-1/2} q + i gamma_m^{1/2} p`, nor with Schottenloher's sourced
mass-shell/free-boson Poincare representation.  No unitary equivalence or
intertwining theorem between the flat local-symbol formula and either sourced
representation is claimed until it is derived locally or cited from a registered
source.
**Reasoning:** The source base already proves/records free scalar lattice fields,
their dispersion, and the Klein-Gordon/free-field scaling limit for the standard
nearest-neighbour model.  The one-particle boost-symbol calculation is a local
derivation that turns the Lorentz algebra, with the sign map in (k), into
explicit differential conditions on `omega^2`, hence on the Hamiltonian
coefficients.  The boost formula is measure-sensitive, so the current safe
status is a flat local symbol algebra rather than the sourced OAR or mass-shell
Poincare theorem.  The zero-mode restriction is kept explicit because the
one-particle complex structure uses `omega^{-1}` and the OAR source names the
massless zero mode as a separate problem.
**Source:** `literature/md/2010.11121/2010.11121.md:51`--`:58` (harmonic lattice
Hamiltonian and scaling-limit claims), `:274`--`:293` (finite torus lattice,
centered dual lattice, and discrete Fourier transform), `:598`--`:610` (lattice
Hamiltonian, dispersion, and ground-state two-point function), `:614`--`:623`
(renormalized mass and lattice Klein-Gordon dispersion), `:648`--`:681` (OAR
continuum one-particle scalar product, flat Fock realization, dynamics, speed 1,
and translations), `:1037`--`:1046` (continuum free scalar time evolution and
theorem), `:1626`--`:1628` (massless zero-mode warning),
`references/cft/Schottenloher2008/Schottenloher2008.md:4186`--`:4244`
(free bosonic QFT/Klein-Gordon/Poincare-covariant construction, including the
natural Poincare action); `src/GaussianBosonNumerics.jl:102`--`:130`
(`centered_periodic_momentum_grid`), `:139`--`:160`
(`periodic_fourier_vector`);
`src/GaussianBosons.jl:9`--`:25` (Gaussian tolerance constants and real-symbol
validator), `src/GaussianBosonNumerics.jl:168`--`:180` (minima-count
validator),
`test/runtests.jl` testsets "Gaussian boson Klein-Gordon symbols" and
"Gaussian boson boost-time symbols", "Gaussian boson Lorentz Hessian examples",
and "Gaussian boson finite periodic massive coefficient spectra" plus
"Gaussian boson numerical tolerance policy" and "Gaussian boson massless doubler
coefficient rejection"; CA-23--CA-28.
**Sweep status:** CA-23--CA-28 use this convention; the full bosonic BdG/pairing
convention is not yet fixed.

## (k) Poincare vector fields to self-adjoint commutators
**Choice:** CA-11 uses active coordinate vector fields
`P_mu = partial_mu` and `M_mu_nu = x_mu partial_nu - x_nu partial_mu`.
When those brackets are translated to self-adjoint quantum-generator notation,
use Stone one-parameter groups `U_X(t)=exp(-it A_X)` and implement the active
spacetime flow passively, by pullback along the inverse flow.  Equivalently, the
skew-adjoint infinitesimal operator is the negative of the CA-11 vector field;
on a common invariant core this gives
`i[A_X,A_Y] = A_{[X,Y]}`.  Keep Schottenloher's translation names
`P_0=H` and spatial `P_a`, and set
`H=A_{P_0}`, `P_a=A_{P_a}`, `K_a=A_{M_{0a}}`, while the self-adjoint spatial
rotation used in the Gaussian shards is `J_ab=-A_{M_{ab}}`
(`1 <= a < b <= d`, extended by `J_ba=-J_ab`).

With this convention the target self-adjoint commutator table is
`i[H,P_a]=0`, `i[P_a,P_b]=0`,
`i[H,K_a]=P_a`,
`i[P_b,K_a]=delta_ab H`,
`i[H,J_ab]=0`,
`i[P_c,J_ab]=delta_ac P_b - delta_bc P_a`,
`i[K_c,J_ab]=delta_ac K_b - delta_bc K_a`,
`i[K_a,K_b]=J_ab`, and
`i[J_ab,J_cd]=delta_bc J_ad - delta_ac J_bd + delta_ad J_bc - delta_bd J_ac`.
**Reasoning:** Schottenloher supplies the Stone sign `U(t)=exp(-itA)` and names
the self-adjoint translation generators with `P_0=H`; CA-11 supplies the checked
active vector-field brackets.  The passive/pullback choice fixes the remaining
active/passive ambiguity.  The minus sign in `J_ab=-A_{M_ab}` compensates the
lowered spatial-index convention in CA-11 and is the sign for the Gaussian
orbital operator `J_ab=X_aP_b-X_bP_a`.
**Source:** `references/cft/Schottenloher2008/Schottenloher2008.md:4040`--`:4050`
(Stone convention), `:4113`--`:4117` (translation generators and `P_0=H`);
CA-11 local vector-field derivation; `test/runtests.jl` testset "Poincare
vector-field brackets".
**Sweep status:** CA-11 states the vector-field table; CA-24--CA-26 use this
entry for the self-adjoint `i[.,.]` Poincare target signs.  CA-12--CA-17 still
keep finite-lattice sign choices explicit under (h).

## (l) Gaussian real-space energy-density split
**Choice:** In the scalar Gaussian block, `h_x` denotes a physical real-space
energy density attached to the cell at site `x`, not an already integrated
cell-energy term.  For lattice spacing `epsilon` in spatial dimension `d`, the
cell volume is `epsilon^d` and
`H_epsilon = epsilon^d sum_x h_x`.  When interfacing with the generic
first-moment notation of (h), use the site energy
`e_x = epsilon^d h_x`, so that `H_epsilon = sum_x e_x`.

For a real symmetric translation-invariant scalar kernel `V_r = V_-r`, write
the total Hamiltonian as
`H_epsilon = epsilon^d (1/2 sum_x Pi_x^2
  + 1/2 sum_{x,r} Phi_x V_r Phi_{x+r})`.
The default local split is the equal-endpoint bond split
`h_x = 1/2 Pi_x^2 + 1/2 V_0 Phi_x^2
  + 1/4 sum_{r != 0} V_r
    (Phi_x Phi_{x+r} + Phi_{x-r} Phi_x)`.
Thus every nonzero displacement bond is shared equally between its two endpoint
cells.  In the cell-normalized `q,p` notation of CA-24--CA-28, the same formula
defines `e_x` and the physical density is `h_x = e_x / epsilon^d`.

Boundary policy: the default exact identities are for infinite lattices with
summable tails or for finite periodic lattices as total-energy expressions.
For finite open restrictions, include only bonds present in the named finite
Hamiltonian and share each included bond equally between its included endpoints;
no ghost sites, half-bonds outside the region, or boundary counterterms are
implicit.  Periodic wrap-around bonds are included in the total density split,
but periodic first moments still require the coordinate-branch policy fixed
separately in (j).

For the finite open one-dimensional nearest-neighbour scalar chain, the local
energy-current orientation is
`J_{j+1/2}=i[e_j,e_{j+1}]`, with endpoint convention
`J_{1/2}=J_{N+1/2}=0`, so the checked finite continuity identity is
`i[H,e_j]=J_{j-1/2}-J_{j+1/2}`.  This is only a local quadratic-density current
convention for future `T_01` candidates; it is not a continuum stress tensor or
`T_11` claim.

Vacuum-energy policy: the split above is bare.  No subtraction is implicit.
After a state `Omega` or `omega` is named, an expectation-subtracted density may
be written `:h_x:_omega = h_x - omega(h_x) 1`.  Such a subtraction changes the
Hamiltonian by a scalar and is invisible to commutators, but it is part of any
claim about absolute energies, expectation values, or Fourier modes of
quadratic densities.  The local source for vacuum/ground-state subtraction is a
free-fermion Koo-Saleur precedent, not a Gaussian-scalar theorem.

Improvement policy: the default density has no divergence improvement.  In
symbols, the default is `b=0` in any rewrite
`h'_x = h_x + (nabla_epsilon . b)_x`.  A later improved density must separately
name the discrete divergence, the edge field `b`, and the boundary convention.
Even when the total energy is unchanged on a periodic lattice or under decaying
boundary conditions, first moments of the density change by a discrete
summation-by-parts term, so improvements are not interchangeable for
position-weighted generators.
**Reasoning:** The OAR scalar-field source writes the lattice Hamiltonian with
an explicit cell-volume factor and a nearest-neighbour quadratic potential, but
it does not choose a unique local site density for arbitrary later first
moments.  The equal-endpoint split is a convention that preserves the sourced
total Hamiltonian and makes the bond assignment deterministic before any
position-weighted generator uses it.
**Source:** `literature/md/2010.11121/2010.11121.md:598`--`:603` (sourced
lattice scalar Hamiltonian and dispersion), `:614`--`:623` (physical mass and
renormalized lattice dispersion);
`references/text/CFTFromLatticeFermions.txt:378`--`:389` (vacuum/ground-state
subtraction as a normal-ordering requirement in the free-fermion Koo-Saleur
setting); `src/GaussianBosonCurrents.jl` and `test/runtests.jl` testsets
"Gaussian quadratic commutator sign convention" and
"Gaussian open-chain energy current continuity" (finite open-chain local
current derivation); CA-29.
**Sweep status:** CA-29 defines and uses this convention.  CA-24--CA-28 use only
the total scalar symbol and finite periodic stiffness checks; any later
real-space first-moment or quadratic-density mode must cite this entry or
replace it with an explicitly recorded convention sweep.

## (m) Qubit nearest-neighbour Pauli densities
**Choice:** A qubit nearest-neighbour two-site density is represented by a real
coefficient matrix `h_{alpha beta}` in the Pauli basis
`sigma_0=I`, `sigma_1=X`, `sigma_2=Y`, `sigma_3=Z`, with
`h = sum_{alpha,beta=0}^3 h_{alpha beta}
sigma_alpha otimes sigma_beta`.  The coefficient normalization is
`h_{alpha beta} = Tr((sigma_alpha otimes sigma_beta) h) / 4`, using
`Tr(sigma_alpha sigma_beta)=2 delta_{alpha beta}`.  Real coefficients are the
default self-adjoint density tier.

For a one-dimensional translation-invariant open chain, the default bond
density is placed on the oriented bond `(j,j+1)` as the same two-site operator
on neighbouring tensor factors.  The CA-12 adjacent-density current is
`J(h)=i[h_{12},h_{23}]`.  In Pauli coefficients its three-site coefficients
are
`J_{a e d}(h) = -2 sum_{b,c=1}^3 h_{a b} h_{c d} epsilon_{b c e}`,
where the displayed indices are zero-based Pauli labels and `epsilon` is the
usual three-dimensional Levi-Civita symbol on `1,2,3`.

A translation-invariant one-site Hamiltonian density
`A=sum_alpha a_alpha sigma_alpha` is embedded into this two-site bond tier by
the symmetric split
`h_onsite = (A otimes I + I otimes A) / 2`.  With this split
`i[(h_onsite)_{12},(h_onsite)_{23}]=0`, so the CA-12 first-moment boost ansatz
produces zero bulk momentum.  This is the checked local meaning of the
"fully local Hamiltonians are ruled out" diagnostic; asymmetric encodings of
the same on-site total Hamiltonian are density-split artifacts until a separate
convention justifies them.

For two spatial dimensions, no final edge/cell density convention is fixed yet.
The proposal-level diagnostic tier uses separate horizontal and vertical
two-site Pauli matrices only after an edge orientation, edge midpoint, boundary
policy, and bulk-projection rule are named.
**Reasoning:** The Pauli coefficient tier makes the user's proposed input
explicit and turns the CA-12 adjacent-current obstruction into polynomial
conditions on the coefficient matrix.  The symmetric on-site split prevents a
pure density-gauge choice from manufacturing spurious adjacent currents for a
single-site Hamiltonian.
**Source:** `references/text/CFTFromLatticeFermions.txt:80`--`:100` (finite
lattice Hilbert spaces, local finite-support Hamiltonian terms), `:1033`--`:1038`
(Pauli matrices in the qubit setting), `:1355`--`:1357` (Pauli algebra/qubit
mapping); `references/text/GaugingDefectsQuantumSpinSystems.txt:674`--`:684`
(pairwise neighbouring Hamiltonian terms); CA-12 local derivation;
`src/QubitPauliLattice.jl` and `test/runtests.jl` testset "qubit Pauli
nearest-neighbour current obstructions".
**Sweep status:** CA-34--CA-35 use this convention.  CA-36 may use the
proposal-level two-dimensional extension only after naming the missing
orientation and bulk-projection data.  No existing Gaussian or category shard
uses this convention.

## (n) Qubit infinite-chain residual quotient and vacuum moments
**Choice:** The qubit exclusion block works first with the fixed
one-dimensional first-moment route
`H=sum_j h_j`, `K=sum_j j h_j`,
`P=sum_j p_j`, `p_j=i[h_j,h_{j+1}]`, using the Pauli density convention (m).
Formal equality of translation-invariant local sums is tested modulo the
one-dimensional coboundary
`D u = u_j-u_{j+1}`.  In Pauli coefficients, if `u` has support length `n`,
then
`(D u)_{a_0...a_n}
 = u_{a_0...a_{n-1}} delta_{a_n,0}
 - delta_{a_0,0} u_{a_1...a_n}`.
The scalar components of coboundary witnesses are gauge variables and are set
only by an explicit gauge choice.

The named necessary \(1+1\)-dimensional coefficient equations are:
the current definition \(p=i[h_j,h_{j+1}]\), translation conservation
`A_j=i[h_j+h_{j+1},p_j]=D u`, and the boost-translation relation
`B_j-u_j-v^2 \bar h_j = D w`, where
`B_j=i[p_j,h_{j+1}]+2i[p_j,h_{j+2}]` and
`\bar h=h-e I` allows an explicit scalar energy-origin subtraction.  Raw
coefficientwise zero residuals are stronger optional filters, not the default.

For a candidate vacuum layer, use finite Pauli-word moments
`y_s=omega(P_s)`, normalized by `y_emptyset=1`, constrained by positivity of
the finite moment matrix `omega(P_u^* P_v)`, translation invariance, and linear
moment annihilation of the chosen residual relations.  Infeasibility of such a
finite SDP excludes the fixed generator route for the fixed Hamiltonian
coefficients; feasibility proves no continuum symmetry.
**Reasoning:** Infinite formal sums identify densities that differ by a
telescoping boundary term, and commutators cannot detect the scalar
Hamiltonian-origin shift.  The moment layer is only the finite restriction of
the state/GNS data; it is an outer hierarchy, not a proof of a vacuum.
**Source:** `references/text/CFTFromLatticeFermions.txt:80`--`:100` (local
finite-support Hamiltonian terms and observable algebra);
`literature/md/2010.11121/2010.11121.md:126`--`:180` (inductive/projective
limit states and GNS), `:204`--`:243` (local algebras, vacuum invariance, and
Poincare-covariance warning); CA-38--CA-44 local derivations;
`src/QubitPauliLattice.jl`, `src/QubitPauliResiduals.jl`, and `test/runtests.jl`
testset "qubit Pauli nearest-neighbour current obstructions".
**Sweep status:** CA-38--CA-40, CA-43--CA-45 use this convention.  CA-35 is
kept as the adjacent-current obstruction and now points to this entry for the
full residual quotient.

## (o) Proposal-level square-lattice qubit edge residuals
**Choice:** The two-dimensional qubit diagnostic shard uses a proposal-level
square-lattice edge tier on \(\mathbb Z^2\): horizontal and vertical densities
`h^x_r` and `h^y_r` live on positively oriented edges
`(r,r+\hat x)` and `(r,r+\hat y)`.  Around a vertex the incident edges are
ordered `W,S,E,N` with midpoint offsets
`(-1/2,0)`, `(0,-1/2)`, `(1/2,0)`, `(0,1/2)`.  Ramp-generated momentum
densities are formed from pairwise incident-edge commutators weighted by
midpoint-coordinate differences.  Residual equalities are tested modulo a
finite-support square-lattice divergence
`R=(1-tau_{-\hat x})U_x+(1-tau_{-\hat y})U_y`.
**Reasoning:** The midpoint/edge-orientation data are needed before the
first-moment boost ansatz becomes an explicit finite coefficient system in
\(2+1\) dimensions.  This is not yet a canonical cell stress tensor, rotation
density, or continuum Poincare theorem.
**Source:** CA-13 and CA-36 for the proposal boundary; CA-41 local coefficient
schema.  No Julia checker for the two-dimensional edge residuals exists yet.
**Sweep status:** CA-41 uses this proposal-level convention only.  Later
two-dimensional implementation must either keep this convention or record a
sweep before using different edge/cell data.

## (p) Qubit SDP implementation levels
**Choice:** The implemented qubit SDP hierarchy uses actual positioned Pauli
words as moment-matrix rows and columns.  Translation invariance is imposed only
on moment variables by replacing every product word with the canonical
representative whose first non-identity site is 0.  Since each phase-free Pauli
word is self-adjoint, canonical moment variables are real.  Complex phases from
Pauli products are represented by realifying a Hermitian moment matrix
`M=A+iB` as `[A -B; B A] >= 0`.

The first implemented solver tier is fixed-`h`: residual coefficient terms are
fixed before model construction.  Algebraic witness solvers may first solve
`A=Du` and `B-u-lambda*h+mu*I=Dw`, but the JuMP SDP does not optimize over
`h`, `u`, `w`, `lambda`, or `mu`.  The Mosek-backed status map is
`OPTIMAL -> :not_excluded_at_level`,
`INFEASIBLE` or `INFEASIBLE_OR_UNBOUNDED -> :excluded`, and any other status
`-> :solver_unknown`.
**Reasoning:** Actual row/column words preserve the finite local GNS probe
space, while quotienting only moment variables encodes translation invariance.
The realification keeps the problem in a standard real semidefinite cone.  The
fixed-`h` boundary is what keeps the first hierarchy a genuine SDP rather than
a polynomial moment relaxation.
**Source:** CA-46--CA-52 local derivations and implementation documentation;
`src/QubitPauliWords.jl`, `src/QubitPoincareWitnesses.jl`,
`src/QubitMomentSDP.jl`, `src/QubitHamiltonianScreening.jl`;
`runs/2026-05-31-qubit-sdp-smoke/results.toml`.
**Sweep status:** CA-46--CA-52 and the qubit SDP Julia tests use this
convention.  Future variable-`h` scans must record a new polynomial-relaxation
convention before using solver statuses as exclusion evidence.

## (q) Qubit candidate-scan families and verdicts
**Choice:** Candidate scans use the same two-site Pauli coefficient convention
as (m): row/column order `(I,X,Y,Z)` and symmetric one-site fields, so a field
`f_a sigma^a_j` is encoded in a bond density by
`h[a+1,1]=h[1,a+1]=f_a/2`.  The implemented named constructors are:
`qubit_tfim_density(coupling=J, field=g)` giving `-J ZZ - g X` after the
symmetric field split; `qubit_xy_density(jx,jy,field_z)`;
`qubit_xxz_density(exchange,delta)` giving `J(XX+YY+delta ZZ)`;
`qubit_heisenberg_density(exchange)` as the `delta=1` XXZ specialization; and
synthetic `XYZ`, compass, Dzyaloshinskii--Moriya-style, field, and deterministic
generic grids.

Only `TFIM`, transverse `XY`, and `XXZ`/Heisenberg labels are treated as
locally sourced physical families in the scan.  `XYZ`, `DM`, compass, and
generic labels are synthetic stress tests unless a later source manifest
registers physical claims for them.  The scan verdicts are scoped to the
fixed first-moment route:
`excluded_current_collapsed`, `excluded_no_conservation_witness`,
`excluded_no_boost_witness`, `excluded_zero_speed`, `excluded_by_sdp`,
`not_excluded_algebraic`, `not_excluded_at_level`, and `solver_unknown`.
The word "excluded" here always means excluded for that named route and gate,
not excluded from all possible CFT or scaling-limit constructions.
**Reasoning:** The scan must compare real candidate families and broad
stress-test grids without silently importing physics folklore.  In particular,
the locally sourced self-dual transverse-Ising point is a known critical model,
but it fails the exact local boost-witness gate implemented here; that failure
is evidence that this exact first-moment route is too strict for that model,
not evidence against the Ising scaling limit.
**Source:** `references/text/GaugingDefectsQuantumSpinSystems.txt:1487`--`:1496`
and `:1513`--`:1515` (transverse-Ising Hamiltonian and critical-theory claim);
`literature/md/1112.5950/1112.5950.md:55`--`:57` (critical TFIM / Ising CFT);
`references/text/CFTFromLatticeFermions.txt:396`--`:402` and
`:1351`--`:1403` (TFIM/XY scaling and Jordan--Wigner XY form);
`literature/md/2302.14081/2302.14081.md:56`--`:64`, `:928`--`:952`, and
`:1057`--`:1059` (XXZ Hamiltonian and continuum/gapless anchors);
`src/QubitHamiltonianFamilies.jl`, `src/QubitCandidateScan.jl`,
`scripts/julia/qubit_candidate_scan.jl`, and
`runs/2026-05-31-qubit-candidate-scan/summary.toml`.
**Sweep status:** CA-53--CA-61 and the Julia testset
"qubit Hamiltonian candidate scan" use this convention.  Future scans over
longer-range, three-site, qutrit, anyonic, or variable-`h` families need a new
convention entry before their verdicts are compared with this qubit scan.

## (r) Anyonic site object and word-algebra conventions
**Choice:** The categorical word-algebra block (CA-65/CA-66) works on a
one-dimensional lattice of **sites**, where a site is one tensor factor
carrying the **site object** `Y` of a unitary fusion category `C`.  The default
hard-core mobile tier uses the **maybe-object** `Y = 1 ⊕ X`, with `X` the
allowed species object (`X = τ` for Fibonacci; `X = ⊕_{a≠1} X_a` for all
species); the summand `1` means "site empty", `X` means "site occupied", and
at most one anyon occupies a site (hard-core is built into `Y`, not imposed as
a dynamical constraint).  For a finite interval `I` the local observable
algebra is `A(I) = End_C(Y^{⊗|I|})` with **left-associated** bracketing
(extending (c) from counting-only to the matrix-presentation level), involution
`f* = f†`, inclusions by tensoring identities on added sites, lattice shift by
one site, and quasi-local algebra the C*-inductive (AF) limit.  Charge sectors
of the interval Hilbert space are `Mor(X_c, Y^{⊗L})` with the unit-first
enumeration of (a).  Open chain is the default; periodic variants need a new
entry.  **Cup normalization:** pair creation uses the **raw** coevaluation
`v ∈ C(1 → X_a ⊗ X_{ā})` with `v†v = d_a · id_1` (for Fibonacci `v†v = φ·id_1`);
the normalized partial isometry is `d_a^{-1/2} v` and any script must say which
it uses.  **Frobenius–Schur flag:** for self-dual species the FS indicator
`κ_X = ±1` must be recorded before cup/cap identifications are used; `τ` is
self-dual (zig-zag relations hold for `v, v†`), but `κ_τ = +1` has **no local
source yet** — flagged as a gap, do not rely on it.  The canonical spherical
structure / positivity of quantum dimensions for unitary C is likewise used
only through the sourced Fibonacci instance (`d_τ = φ > 0`); the general
theorem has **no local source yet**.
**Reasoning:** the site object, not the bare category, fixes vacancies, mobile
species, and boundary type, so the compiler input is the pair `(C, Y)`.  The
maybe-object is the categorical lift of the sourced "maybe quantum spin"
`C ⊕ C^d`, and for `C = Hilb` the construction recovers the quasi-local spin
algebra, which anchors the qubit block as a special case.  Raw-cup bookkeeping
keeps quantum dimensions visible in invariants (cup-cap = d_a), which is what
the Julia checks assert.
**Source:** `references/text/GaugingDefectsQuantumSpinSystems.txt:177`--`:191`
(maybe-spin `F_{≤1}(C^d) ≅ C ⊕ C^d` and `(C ⊕ C^d)^{⊗N}`, eqs. (4)-(5));
`references/text/PenneysUnitaryFusionCategories.md:610`--`:625` (Fib: `d_τ = φ`,
normalized `v, Δ`, zig-zag/self-duality, `v†v = φ·id_1`, `Δ†Δ = √φ`-relation,
minimal central projections in `End(τ⊗τ)`);
`references/text/HollandsAnyonicChainsAlphaInduction.txt:15`--`:35` (anyonic
chain Hilbert space from a unitary fusion category); CONVENTIONS (a), (b), (c).
**Sweep status:** CA-65/CA-66 use this convention.  No earlier shard uses a
site object; the qubit block (m)--(q) is the `C = Hilb`, `Y = C²` degenerate
case but keeps its own independent conventions.
