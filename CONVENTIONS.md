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
**Choice (index level — NOT YET FIXED):** the 0- vs 1-indexed enumeration of
`Irr(C)` (a recurring bug in prior work) is a separate question, deferred until a
specific category's simple objects are enumerated.
**Reasoning:** the object-level vacuum is forced by the AND/OR/vacuum grammar
(CA-02): "vacuum = ℂ" is the ⊗-unit, not the ⊕-unit. The index-level convention is
orthogonal and not yet needed.
**Source:** `report/sections/02_and_or_vacuum_grammar.tex` (CA-02, "Two Monoidal
Structures and Their Units"); `references/cft/Schottenloher2008/Schottenloher2008.md:4218`
("H_0 = ℂ with the vacuum Ω := 1 ∈ H_0").
**Sweep status:** CA-02, CA-03 use vacuum `= ℂ` (`\one`) and zero space `= {0}`
(`\zero`) per this convention.

## (b) F-symbol / R-symbol gauge
**Choice:** NOT YET FIXED.
**Reasoning:** unitary vs involutory gauge differ; importing entries across
gauges gives silently-wrong inner products (TensorCategories.jl is involutory).
**Source:** —
**Sweep status:** —

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
**Sweep status:** CA-10--CA-17 use this convention; no periodic-boundary or
higher-dimensional orientation convention is fixed yet.

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
Finite periodic numerical checks use momenta
`k_a = 2 pi n_a / (epsilon L_a)` and the real-space stiffness matrix
`V_{xy} = sum_r V_r 1_{y=x+r mod L}`; its eigenvalue oracle is the list of
symbol values on this Brillouin grid.  The low-energy Hessian residual is
`1/2 Hessian(omega^2)(0) - c^2 I`, equivalently
`-epsilon^2/2 sum_r r_a r_b V_r - c^2 delta_ab`.
At the one-particle local-symbol level, CA-24--CA-26 work on the flat momentum
space `L^2(U, dk)` on a smooth patch `U`, or on the analogous flat finite
momentum grid for numerical symbol checks.  Thus `X_a=i partial_{k_a}` is the
flat-measure differential operator, and the time-zero Lorentz-boost candidate is
the flat-measure symmetric formula
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
Poincare theorem.
**Source:** `literature/md/2010.11121/2010.11121.md:51`--`:58` (harmonic lattice
Hamiltonian and scaling-limit claims), `:598`--`:610` (lattice Hamiltonian,
dispersion, and ground-state two-point function), `:614`--`:623`
(renormalized mass and lattice Klein-Gordon dispersion), `:648`--`:681` (OAR
continuum one-particle scalar product, flat Fock realization, dynamics, speed 1,
and translations), `:1037`--`:1046` (continuum free scalar time evolution and
theorem), `references/cft/Schottenloher2008/Schottenloher2008.md:4186`--`:4244`
(free bosonic QFT/Klein-Gordon/Poincare-covariant construction, including the
natural Poincare action);
`test/runtests.jl` testsets "Gaussian boson Klein-Gordon symbols" and
"Gaussian boson boost-time symbols", "Gaussian boson Lorentz Hessian examples",
and "Gaussian boson finite periodic examples"; CA-23--CA-28.
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
