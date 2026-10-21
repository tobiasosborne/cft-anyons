# Worklog chunk 017 — 2026-10-21

## Small categorical inputs and their first conformal constraints

### Context

Tobias requested a local commit of the preceding work and explicitly no
push on the slow connection. That work was committed as `f91f8ed`, with
source provenance, checked scripts, reconstruction notes and worklog.
No fetch, pull or push was performed. Pre-existing `.beads/` and
`summary.pdf` were not included.

He then explicitly asked whether the equations work with small category
inputs such as Z2 and Fibonacci, while retaining the general machine as
the goal. This authorizes these probes despite the earlier no-example
restriction. The task is to apply the new equations, not substitute a
known lattice model or a by-hand CFT construction.

### What changed

Added LC-6--LC-8 under `reconstruction/`, exact Python/SymPy checks, a run
bundle, and convention (ah) before the new calculations.

- Compared untwisted VecZ2 and semion separately: they share the fusion
  rule x*x=1 but have F^(xxx)_x=+1 and -1 respectively. This distinction
  matters in the actual associativity equations.
- For A=1+x with normalized unit, solved the multiplication equations.
  VecZ2 has alpha=1; Fibonacci has alpha=sqrt(phi), beta=1/sqrt(phi).
  All triple-channel associativity, both dagger Frobenius maps and
  specialness are checked exactly in Q(sqrt(phi)). Complex phase/gauge
  freedom and the canonical inner-end normalization are derived in LC-6.
- Semion associativity forces alpha=0 for this ansatz. Dagger Frobenius
  fails, and a separate bimodule-section argument proves nonseparability.
  A=1 remains an allowed alternative; no obstruction to semion CFT claimed.
- An explicit separability element and categorical contracting homotopy
  prove HH^n_C(A,A)=0 for every n>=1 in both positive examples. Low-degree
  matrices and h2*d1=1 are checked independently. This is a fixed-category
  binary algebra result, not vanishing of the full conformal obstruction.
- Categorical derivations of these connected A are zero. This concerns
  categorical morphisms preserving m; microscopic End_C(A^tensor L) matrix
  algebras still have nonzero inner derivations. The distinction is explicit.
- Selected the smallest nonnegative modular lifts (c,h)=(1,1/4) for
  positive semion and (14/5,2/5) for positive Fibonacci. These are choices,
  not unique exact energies supplied by the category.
- Built exact Virasoro normal ordering and Gram matrices through grade4.
  Semion has the grade-two null (L_-2-L_-1^2)v; Fibonacci's selected Verma
  module is positive definite by the sourced c>1,h>0 theorem.
- Derived and solved a normalized vacuum-exchange Ward recurrence through
  grade4. Stress coefficients v2 are 1/2 and 2/7; all positive-mode Ward
  equations through the declared grade are checked.
- Derived the three-point null-descent polynomial h_out*(1-h_out) for two
  semion-weight primaries. It permits weights0 and1; it does not require a
  weight1 field or identify that weight with a new categorical sector.

### Why these choices

The tests expose precisely what the finite categorical equations do:
they can solve positive binary sewing, distinguish associators, and give
explicit cohomological primitives. They do not choose the entire graded
carrier or geometric stress response. The local Ward/null probes reach
one step into that missing analytic structure without importing an existing
Hamiltonian or a known CFT's complete OPE constants.

Keeping semion separate from VecZ2 avoids assigning modular data to a bare
fusion rule. Keeping category objects separate from Virasoro modules avoids
discarding additional primary multiplets inside each categorical carrier.
The selected stress probes are one vacuum-channel component, not a claim
that all four-port categorical sewing has been solved.

### Frictions, reviews and repairs

- Three Astra collaborators independently derived binary solutions,
  cohomology contraction and source-controlled conformal constraints.
  Parent checked them and implemented fresh exact tests. A skeptical
  collaborator reviewed the combined notes and code before landing.
- Schottenloher has a printed level-one Gram h where the commutator gives
  2h, and a strict determinant inequality where PSD permits zero. The code
  derives entries from Virasoro and checks exact nonnegative principal
  minors, rather than importing those typos.
- FRS uses an opposite twist convention in one passage. Conformal weights
  here follow the explicitly selected positive RSW twists, and no FRS
  theta/weight identification is imported.
- Exact finite-matrix Virasoro is not imposed: the code evaluates finitely
  many words in formal highest-weight modules. The positive-level cutoff
  only limits the computation, not the defining algebra.
- Formal categorical rigidity is modulo invertible unit-preserving maps,
  not necessarily unitary maps preserving a fixed Gram form.

### Acceptance

`python3 scripts/python/run_small_category_inputs.py`: ten test groups
pass; all four deliberate mutations are rejected; restored run passes.
Mutations: Fibonacci product coefficient, semion associator sign, Virasoro
central coefficient, and Ward weight coefficient. Raw outputs, exact data,
versions and source/producer hashes are retained in the run bundle.
No network, chain diagonalization, full Julia test suite or Fibonacci
calculation beyond four inputs was used. No report source/PDF changed.

### Pointers and open work

`reconstruction/06_small_category_sewing.md` through
`08_small_category_stress.md`; CONVENTIONS (ah);
`runs/2026-10-21-small-category-inputs/`; root INDEX.

The unresolved next test is positive four-port sewing against the specified
F-matrix, with complete graded carriers and all null quotients. Then come
local-Hamiltonian/standard-KS identification and a shared OAR/state limit.
No completed category-to-CFT branch is claimed by this experiment. The work
will be committed locally; pushing remains explicitly deferred.
