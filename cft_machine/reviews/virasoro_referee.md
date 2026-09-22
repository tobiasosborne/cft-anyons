# Independent skeptical review: realisation and fidelity

Reviewer: the Virasoro-routes worker, reviewing another worker's material.
Date: 2026-09-22. This review does not review or approve VR-1.
Reviewed file: `cft_machine/research/realisation_and_fidelity.md`, 203-line
version present at review time. Source TeX checked directly, not inferred
from source manifests. Verdict: algebraic lemmas accepted; one major compiler
scope correction and one wording correction before treating the route as an
implementation specification. No blocker to publishing it as conditional
research with those corrections.

## Accepted claims

1. **Lemma 1, lines 106–121:** correct. Equivariance gives inclusion of fixed
   points, bijectivity gives every fixed preimage, and algebraic structure
   restricts. No positivity, representation, or locality conclusion is used.
2. **Lemma 2, lines 123–147:** correct under the stated fixed finite group,
   injective unital morphisms, and exact equivariance. The induced action is
   well-defined and isometric; averaging is contractive and preserves each
   finite-stage image; density proves surjectivity of the isometric canonical
   map. The proof does not silently interchange weak and norm closure.
3. **Lines 149–153 and 175–185:** correctly separate this C*-algebra result
   from changing states, local von Neumann closures, stress operators, and
   complete sector reconstruction. Restricting an untwisted vacuum space is
   expressly not promoted to the complete orbifold sector theorem.
4. **Lines 66–87:** EG Theorem 3 is correctly stated as a continuum existence
   theorem, with its finite-group extension, cohomology, permutation orbifold,
   and local-extension construction. Directly checked
   `references/cft-machine/realisation/EvansGannon2018/source.tex:865–867`
   and `:1482–1496`. The c-divisible-by-24 anomaly condition is present in
   its Theorem 2 at `:840`.
5. **Lines 89–95:** pointed and metaplectic/Tambara–Yamagami realization
   claims match EG `:256–260` and
   `references/cft-machine/realisation/Bischoff2018/source.tex:452–473`.
   The distinction between Euclidean lattices defining conformal theories
   and microscopic chains is explicit and essential; it survives review.
6. **Lines 40–53:** nonuniqueness by holomorphic tensor factors and failure
   of modular-data completeness are correctly supported by B `:374–381`
   and `references/cft-machine/realisation/MignardSchauenburg2017/source/paper.tex:122–124,175–179`.
   The note correctly says some inequivalent categories share the data,
   without claiming every category in the exhibited family shares it.
7. **Lines 194–199:** the strange-correlator caution is supported by
   `literature/md/1801.05959/1801.05959.md:13–27`, explicitly including the
   source's lack of a positivity guarantee and alternatives of criticality
   and symmetry breaking. No universal constructive result is asserted.

## Major M1 — propagate the actual central charge through the recipe

Location: lines 32–38 versus 70–87 and 155–180.
The input asks for an actual real central charge, character/energy data and
possibly analytic fields. EG's selected construction starts with c=24 and a
k-fold tensor power; the permutation orbifold and local extension leave
output c=24k. This does not generally match a separately requested lift,
even when the resulting modular category matches exactly. In particular,
category-level existence cannot discharge the enriched conformal-data input.

Evidence: EG `:849–855` explicitly gives the tensor/permutation charge nc;
EG `:338–340` defines local extension as retaining the same central charge;
EG `:1492–1496` selects the c=24 seed and its tensor-power extension.
This is a genuine branch-selection condition, not a no-go for some other
realization algorithm.

Concrete fix: state `c_out=24k` for this recipe; require comparison with any
supplied c, characters, and field data, and reject/return unresolved when
incompatible. If only categorical/modular fidelity is requested, allow the
recipe to choose its own compatible conformal lift and report it. Do not
claim arbitrary lift or OPE control from EG Theorem 3.

## Minor m1 — distinguish fixed-point algebra from a local orbifold net

Location: lines 165–166.
“Identifies this algebra with a target orbifold whenever the seed continuum
identification is equivariant” can be read as a net-identification claim.
An equivariant global C*-isomorphism in Lemma 1 contains no interval map,
state identification, or normality statement. Hence its direct conclusion
is only an identification of the two fixed-point C*-algebras.

Concrete fix: replace “target orbifold” by “target fixed-point C*-algebra”
and add “a local-net identification additionally requires intervalwise,
state-compatible identifications and the corresponding GNS/closure result.”
The existing lines 177–178 already recognize this gap; aligning the earlier
sentence will remove the ambiguity.

## Acceptance boundary

The two displayed lemmas are proved mathematical progress. They are not a
proof that an arbitrary MTC has a microscopic realization, that a strict
fixed-point algebra has the desired local representation category, or that
any listed seed has already been discretized. A future claim of a working
orbifold compiler must show the local microscopic seed and extension step,
not only invoke these accepted lemmas.

# Independent skeptical review: complex-fermion benchmark

Reviewed `cft_machine/benchmarks/fermion/{PROOF.md,FermionBenchmark.jl,test.jl,run.jl,README.md}`
(the base complex-fermion version; Majorana additions not yet reviewed).
Independent command:
`OPENBLAS_NUM_THREADS=1 JULIA_NUM_THREADS=1 timeout 60 julia --project=. cft_machine/benchmarks/fermion/test.jl`.
Result: **548/548 passed**, 6.7 seconds reported test runtime. No source or
benchmark implementation was modified by this reviewer.

## Accepted base claims

- `PROOF.md:12–17`: the modified shift coefficient and removed wrap match
  `references/text/CFTFromLatticeFermions.txt:3379–3420`, Eqs. (197)–(199),
  after the declared orthonormal-coordinate and L=pi normalization. A bare
  finite one-particle commutator is not being used as a central extension.
- `PROOF.md:21–38`: exact inclusions and reverse-transition adjointness hold;
  the two polynomial product coefficients yield the stated Witt bracket.
  The finite test restricts to columns with no boundary crossing.
- `PROOF.md:40–55`: the Taylor bound is correct, as is its weighted-shift
  operator norm and the sum of the two scale errors on a fixed safe core.
  Summability concerns that fixed core after a finite boundary threshold.
- `PROOF.md:57–64`: the negative-momentum sea restricts exactly through the
  momentum inclusions. The code and prose explicitly distinguish it from
  the finite two-component Dirac ground-state covariance.
- `PROOF.md:68–94`: the cocycle sign and occupied/unoccupied blocks match
  source Eq. (27). Its nonzero trace contains exactly the n Fermi-surface
  transitions; the rational sum is (n^3-n)/12. There is no incorrect doubling
  or halving of the complex-fermion central term.
- `PROOF.md:104–119`: the nearest-neighbor AP hopping oracle and squared
  Dirac dispersion are independent useful invariants. Source
  `:3459–3530` really supplies the stated modified-cutoff convergence on
  finite-excitation Fock vectors and the corollaries on unitary/Bogoliubov
  convergence. The note correctly retains the separate local-net interface.

## Major scope gap M2 — the implemented triangle is not the full state triangle

`PROOF.md:19–64` and `run.jl` compute a mode-refinement defect and the
restriction of an already-selected continuum chiral sea. They do not yet
calculate coarse observables in the actual finer-lattice Dirac ground state,
then pass the fine scale to infinity at fixed coarse scale. The source
convergence theorem may supply this elsewhere, but it is not the displayed
finite diagnostic. No false vacuum identification is present: lines 62–64
explicitly guard against it. The issue is the heading “Wilson triangle” and
whether the benchmark is reported as checking the whole requested triangle.

Concrete fix: call the present quantity the **generator/refinement square**;
label the missing Wilson-state branch explicitly. If it is implemented,
compute the negative-spectral projector of the displayed finite Dirac symbol,
transport it with the full two-component refinement, and compare its
fixed-coarse limit with the appropriately represented continuum covariance.
Keep that covariance's spinor/chiral basis and AP boundary convention explicit.
A compatible chiral sea alone is not a substitute for that limit.

## Minor m2 — complete the requested structured-proof syntax

`PROOF.md:19–100` uses hierarchical step numbers but lacks explicit
ASSUME/PROVE and QED statements for the propositions, required by convention
(u). Add proposition-level assumptions and conclusions, and final QED lines
with their dependencies. This does not change the mathematical verdict.

## Boundary relevant to the conditional analytic theorem

The accepted M^-2 estimate is on each fixed finite momentum core. It must
not be advertised as an already-verified uniform graph-operator estimate on
all lattice vectors. At ultraviolet momenta proportional to M, the relative
mode error with first-order weight 1+|r| need not decay. A stronger auxiliary
regularity weight or another full-domain estimate would be required before
claiming the benchmark instantiates a graph-norm certificate. This is a
cross-interface warning, not a review or approval of the reviewer's own VR-1.

# Follow-up review: actual Wilson states and self-dual Majorana recipe

Reviewed newly landed `WilsonStates.jl`, `WILSON_PROOF.md`, `test_wilson.jl`,
and the self-dual additions to `FermionBenchmark.jl`/`PROOF.md`/`test.jl`.
Independent reruns used the same single-thread/60-second command above:
`test_wilson.jl`: **116/116**, 3.5 seconds;
`test.jl`: **548/548** base, 10.2 seconds, and **96/96** self-dual, 3.9 seconds.
No benchmark or source files were changed by this referee.

## Wilson-state verdict: accepted; closes the previous M2 gap

- `WilsonStates.jl:7–15` uses the **negative** spectral projection of the
  actual source Dirac symbol. Direct comparison with source
  `references/text/CFTFromLatticeFermions.txt:1020–1055`, Eqs. (45)–(48),
  confirms the off-diagonal phase and the sigma_y sign. Dividing the Pauli
  vector by its positive energy gives the vector in `WILSON_PROOF.md:22–24`.
- `WILSON_PROOF.md:18–40` correctly computes direct and adjacent covariance
  distances using half the chord length on the Pauli unit sphere. The
  sine arguments differ by the required factor of two. Full spinor-block
  inclusion preserves actual coarse/fine pullback composition.
- **The state-norm step is valid**, not an illicit covariance/state-norm
  identification. Each retained two-component momentum block is a complete
  rank-one occupied-orbital projector, so its two-mode CAR state is pure and
  has density `0 direct-sum P direct-sum 0`. Its density is parity-even.
  Ordering the momentum blocks gives the graded tensor-product state;
  parity evenness and the block-diagonal covariance give the quasi-free
  product state. The determinant characterization in source `:734–745`,
  Eq. (7), fixes all CAR monomials and hence the whole finite state.
- `WILSON_PROOF.md:57–81`: a block's density trace distance is twice its
  rank-one projector operator distance. Tensor-product telescoping with
  unit trace-norm state factors proves the sum bound for the actual dual
  state norm. Summing dyadic spacings gives the stated tail
  `epsilon_Q * sum_(r in Gamma_M)|r| / 2`. The lack of a uniform-in-M claim
  and the possibility of bounds greater than two are correctly disclosed.
- The remaining locality limitation is preserved at `:83–86`: this is a
  sharp-momentum CAR refinement, not by itself the missing local-net proof.

## Majorana verdict: accepted within the displayed sourced scope

- Reflection combined with complex conjugation is an antiunitary Gamma;
  `Gamma S Gamma=1-S` and `Gamma A_n^* Gamma=-A_n` satisfy the self-dual
  conditions of source `:825–840`, Eqs. (19)–(20). The implementation uses
  reflection times the transpose, correctly representing Gamma A* Gamma.
- The recipe's factor one-half and subtraction `-Tr(S A_n)/2` agree with
  source Eqs. (20), (26) at `:833–840,:879–881`. Its returned polynomials
  are parity-even; that assertion is independent of sector-category claims.
- The factor one-half in the Schwinger cocycle is **sourced**, not a fitted
  replacement of complex central charge. Source Eq. (28), `:890–892`,
  applies after the checked self-dual constraint; the exact finite trace
  gives `(n^3-n)/24`. The extension of Theorem 4.11 to this setting is
  explicitly present at source `:3480–3485`.
- `PROOF.md:156–160` appropriately stops short of identifying the whole
  graded field algebra with an Ising observable net or its sector category.
  This accepted recipe does not alone approve any separate Ising compiler
  or local-net identification elsewhere in the repository.

## Resolution tracking

- M1 central-charge gate and m1 fixed-point-algebra wording: **resolved** in
  the fidelity note; the added paragraphs explicitly propagate `c_out=24k`
  and distinguish an algebra identification from a local-net identification.
- M2 actual microscopic Wilson rows: **resolved** by the reviewed addition.
- m2 ASSUME/PROVE/QED completion: still pending in the benchmark proof files
  at this review instant; parent reports the worker is applying the style fix.
  This is a presentation issue, not an unproved estimate.

No new mathematical blocker or major issue was found in this follow-up.
