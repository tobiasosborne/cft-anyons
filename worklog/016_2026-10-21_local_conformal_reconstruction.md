# Worklog chunk 016 — 2026-10-21

## Local commit and next investigation

Tobias now explicitly requests committing this work locally, with **no push**
on the slow connection. This supersedes the previous no-Git instruction;
no fetch/pull is needed for the authorized local commit. He also explicitly
requests testing the equations on small category inputs such as Z2 and
Fibonacci. This supersedes the earlier no-example restriction for this task,
while preserving the general reconstruction goal: use small inputs to test
the equations and expose missing data, not to replace the machinery by
unrelated model-specific constructions. Results of that investigation will
be recorded separately.

## Concrete cell equations and obstruction calculations

### Context

Tobias requested actual consistency equations, possibly countably infinite,
separating their formulation from solving them. He particularly wants cell
locality and cohomological obstructions to local solvability. The offline,
no-Git and no-model-example directions remain active.

### What changed

Created `reconstruction/` with five short, cross-linked research notes and
an overview. Root README and INDEX point to the new investigation.
Conventions (ae)–(ag) were recorded before the derivations and checks.

- LC-1 gives explicit categorical boundary carriers, unknown cell maps and
  anomaly lines, positivity/collar equations, sewing relations, coordinate
  Ward equations, curvature compatibility, local field/stress constraints
  and the standard KS identification requirement. It includes a coefficient
  recurrence for a local Taylor solution and a structured proof that Ward
  identities propagate through sewing, including residuals.
- LC-2 derives the algebraic local-innerness obstruction in HH^1 for a
  declared implementer bimodule; central Lie cocycles and their shifts;
  geometric curvature/Bianchi; and the exact finite-matrix limitation.
- LC-3 gives the explicit fixed-associator binary sewing deformation
  complex. Its H^2 tangent and H^3 formal extension statements have local
  structured proofs. The full conformal deformation complex is not claimed.
- LC-4 fixes an explicit nearest-neighbour normalized KS tier and a finite
  patch divergence obstruction, then records positivity, Wilson-state/GNS
  compatibility and energy-weighted cross-scale conditions. It imports only
  the abstract WT-1/VR-1 estimates, not an old model-specific backend.
- LC-5 derives an actual mixed CE/Hochschild complex for an associative
  algebra with a Lie derivation action. It proves the commuting-differential
  identity, total square-zero condition, coupled first-order equations and
  gauge quotient. This couples two formal fragments; internal stress and
  full geometric sewing remain outside that complex.
- Added exact free-expression/polynomial tests and a local run producer;
  its bundle contains versions, producer hashes and raw mutation output.

### Why these choices

The core is an internal stress response, so a coordinate connection cannot
be unrelated extra data. Categorical channels, analytic carrier spaces,
stress action and lattice Hamiltonian must be connected by equations.
The first carrier ansatz takes C as a candidate chiral sector category;
fusion-only data would need a braided completion. A defect-category input
is not silently identified with a chiral-sector category.

The obstructions have different meanings. HH^1 tests algebraic innerness,
H^2 permits the projective anomaly rather than demanding its removal, and
H^3 controls formal extension only in the explicitly derived associative
fragment. General residuals define a cokernel problem; a full complex
requires actual identities between equations. Locality restrictions and
analytic topology cannot be erased by naming an abstract cohomology group.

### Frictions, skeptical review and repairs

Three Astra collaborators supplied separate obstruction/sewing/analytic
analyses. Parent checked sources and derivations; the skeptical collaborator
reviewed the assembled four notes and then rechecked repairs.

- The reviewer caught a substantive overconstraint: metric-compatible
  horizontal maps cannot describe arbitrary Euclidean collar evolution.
  C4 now separates unitary coordinate directions from positive collar
  propagation and genuine-modulus stress-insertion right-hand sides.
  A full geometry-to-insertion rule for arbitrary moduli remains a schema
  to specify, not a completed equation presentation.
- Coincident periodic neighbours invalidate the naive continuity identity
  on a two-site ring. The explicit candidate tier starts at N>=4.
- An infinite local-density quotient was initially not defined. The main
  obstruction now uses the actual finite patch divergence cokernel; an
  infinite-patch quotient is allowed only if its presentation is supplied.
- Reviewer required the carrier ansatz and vacuum algebra to be linked:
  V_unit=V, all V_i use the same V action and stress, and module/intertwiner
  compatibility is part of the unknown coefficient system.
- The exp(+iT) convention requires the opposite coefficient-vector-field
  bracket f'g-fg'. This sign is registered, derived and mutation-checked.
- Test-first import failures were followed by passing exact identities.
  Deliberate mathematical mutations then confirmed that tests detect actual
  sign/factor regressions, rather than merely module availability.

### Acceptance and open work

Eleven symbolic identity tests pass. Five mutations fail the expected tests:
Hochschild final sign (three failures), Ward sign (one), circle bracket
sign (one), Taylor derivative factor (one), mixed action sign (one);
restored run passes. These
are universal expression identities, not model evidence. Producer command:
`python3 scripts/python/run_local_conformal_checks.py`.

No numerical lattice model, report shard, PDF, general CFT existence theorem
or full deformation complex was produced. Consequently no report rebuild
or package test suite was needed. All work remains local; Git was not used.

Next concrete formulation task: give a presentation of marked cells and
independent modulus insertions, derive the combined sewing/Ward/stress
syzygies, and identify its actual deformation complex. Positivity and
all-scale analytic bounds remain separate from formal solvability.

Pointers: `reconstruction/README.md`; notes LC-1–LC-5;
`runs/2026-10-21-local-conformal-consistency/`; CONVENTIONS (ac)–(ag).

## Local conformal transformations generated within the observable theory

### Context

Tobias asks what bare categorical data lack, what extra structure selects
conformal behavior and projective-unitary symmetry, and whether it can be
found by solving local equations. He then identifies the central point:
small local conformal transformations are generated by the stress-energy
density, which is itself a local observable in the same theory.

The discussion remains structural: no model examples, no implementation
branch chosen, all lattice quantities allowed to depend on the cutoff.
Tobias explicitly deferred Git because the connection is extremely slow;
do not retry network synchronization during this offline discussion.
Prior source acquisitions and notes remain local and uncommitted.

### What changed

- Recorded exploratory stress-field and local-implementer conventions (ad).
- Located a precise operator-algebraic version of the user's insight:
  local diffeomorphism implementers belong to the corresponding interval
  algebra under the stated covariance and Haag-duality hypotheses.
- Located local field-generation and conformal-vector criteria in the
  already registered Schottenloher source. These support solving for local
  field data; they do not prove that a finite truncated solution extends
  to a unitary CFT or that it has a prescribed sector category.
- Two Astra collaborators independently checked the sewing/local-field
  formulation and the finite-patch/refinement proposal, read-only and offline.

### Why these choices

The proposed missing structure is an analytic realization of categorical
sewing with an intrinsic stress response. The stress must generate the
actual coordinate variation of the same local fields and must agree with
the eventual Hamiltonian/standard KS construction. Adding a separate
Virasoro representation would not establish that relationship.

A prospective first problem is to formulate differentiated sewing/Ward
identities on elementary patches, as identities for arbitrary boundary
states, and prove that sewing propagates them. Cutoff residuals, state
compatibility, energy bounds and convergence remain part of that task.
This is an investigation direction, not a new existence theorem or a claim
that finitely many local equations universally suffice.

### Frictions and boundaries

- Local field-algebra equations and finite-support lattice equations are
  different notions of locality; a construction must connect them.
- A vertex algebra need not have a positive Hilbert completion. Positivity
  on every descendant grade and spectral/domain conditions are additional.
- Carpi--Weiner's energy-bound section already assumes a positive-energy
  Diff representation; it must not be used as a circular existence proof.
- The conventional stress OPE gives formal Virasoro relations, but full
  projective-unitary covariance and category fidelity require more.
- No categorical input is asserted to have a conformal realization merely
  because its algebraic coherence equations are consistent.

### Acceptance and pointers

Parent read the exact local source statements cited below; no new source
download, numerical computation, report edit, or Git operation occurred.
Notes remain local under the user's offline direction.

- `references/cft-machine/coset-symmetry/CarpiWeiner2004/source.tex:356–380`:
  covariance axioms and interval-local implementers; `:407–445`: common
  cores and stress exponentials; `:739–747`: energy bound in its scope.
- `references/cft/Schottenloher2008/Schottenloher2008.md:5900–5937`:
  generating-field reconstruction; `:6111–6118`: conformal vector;
  `:6473–6504`: local conformal-vector criterion; `:3044–3056`:
  integration for the stated unitary highest-weight representations.
- Same source `:5080–5104`: stress/stress and stress/primary OPEs.
- `literature/md/1905.04924/1905.04924.md:542–558,639–641`:
  geometric sewing and richer vertex tensor structure.
- `references/lattice-symmetry/KooSaleur1993/source/9312156.tex:543–568`:
  global Ward information does not itself identify a local density;
  `:1094–1108`: products and scaling limits require intermediate-state control.
