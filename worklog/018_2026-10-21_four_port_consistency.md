# Worklog chunk 018 — 2026-10-21

## Four-port equations and small-category illustrations

### Context

Tobias requested the four-port problem, keeping the same sequence of goals:
formulate consistency equations, then illustrate them with the small inputs.
The eventual target remains categorical data to cutoff-dependent local
Hamiltonians, their standard KS generators and a rigorous OAR CFT limit.

He explicitly requested GPT-6.1 at xhigh for delegated work. The initial
Astra tasks were interrupted and three GPT-6.1-xhigh collaborators took
over the general equations, semion calculation and Fibonacci/audit tasks.
He briefly requested stopping for laptop shutdown, then explicitly resumed.
Work resumed at the existing files and fifteen passing tests. Network sync
and pushing remain deferred; local commits are authorized.

### What changed

Added LC-9--LC-13 and convention (ai), exact helpers/tests and a run bundle.

- LC-9 writes the typed four-port cell, intermediate boundary labels,
  full graded carriers, null descent and inverse-Gram sewing. It separates
  categorical coefficient equations from the analytic state-valued block
  embedding absent from an MTC. The explicit dual basis map is F^(-T),
  not automatically the same numerical F in a monic analytic basis.
- LC-10 gives reflected PSD kernels, countable common-chart Taylor
  equations and the actual linearized residual, including inverse-metric,
  collar and basis-gauge variations. A finite ansatz's cokernel obstruction
  is not a universal category exclusion.
- LC-11 derives the semion c=1,h=1/4 four-port null ODE and two exact
  Virasoro functions. Their monic connection is [[1/2,3/4],[1,-1/2]];
  the invariant positive channel metric is diag(1,3/4).
- A chosen external primary doublet with antisymmetric epsilon combines
  those two scalar functions into ONE tensor-valued semion channel with
  B_s=-B_t and the declared positive braid R=i. All four null ports and
  the global Möbius Ward identities are checked as rational identities.
- The explicitly oriented reflected coefficient kernels are P_antisym
  and P_sym/2, of ranks one and three. This is local graded/pair sewing
  positivity, not an all-n Osterwalder--Schrader theorem.
- LC-12 gives exact Fibonacci scalar coefficients through grade four,
  full-carrier unknowns and normalization-aware functional crossing.
  In the explicitly symmetric transported chart, midpoint derivatives
  lie in alternating F eigenspaces. No crossing failure is inferred from
  finite OPE Taylor polynomials without tail estimates.
- LC-12 also records a separate conditional genus-one diagnostic: if
  ordinary characters transform by Fibonacci S at c=14/5, the vacuum
  carrier cannot be a finite sum of Virasoro highest-weight families.
  This is not a four-port exclusion or a generic conformal-net assertion.
- LC-13 derives a stronger conditional semion result. Vary the external
  multiplicity dimension d with a nondegenerate real orthogonal skew
  duality, normalize leading cups by 1/d and impose the same BPZ/F
  equations. The weight-one reflected coefficient is I/d-P_epsilon/2.
  Positive graded Hilbert sewing forces d<=2; nonzero skew duality gives
  even d>=2, hence d=2 within this ansatz.

### Why these choices

The concrete four-port requirement is agreement after sewing through all
positive-quotient states, with explicit coordinate and anomaly transport.
An F-matrix by itself fixes the change of categorical channel but does not
supply the block functions or their evaluation on external states. The
semion tensor calculation demonstrates how multiple Virasoro families can
live inside one categorical channel without changing its fusion rule.

The doublet-selection result is conditional on a stated local analytic and
duality ansatz, but it is more informative than inserting the doublet by
hand: an energy-resolved positivity condition rejects larger finite d.
At d=4 the normalized epsilon-direction expectation is exactly -1/4.
The whole pointwise kernel at z=1/2 is nevertheless I/4+P_epsilon>0;
pointwise positivity would miss the obstruction.

### Frictions, source care and review

- The left-module convention requires composition D_bc tensor D_ab -> D_ac.
  Ignoring this would reverse categorical input order.
- A complex F sanity check detects the dual-basis conjugation issue hidden
  by real involutory small-category F matrices.
- Brehm--Runkel's oriented bilinear disc pairing has coordinate signs.
  Hermitian inverse-Gram sewing is used only after explicit reflected/dual
  identification, not by silently substituting the Shapovalov form.
- The internal c=1,H=1 Verma module has a grade-three null. The new code
  requires both sewing covectors to annihilate its radical before solving
  the Gram system; a pseudoinverse cannot hide inconsistent null coupling.
- The semion global null check differentiates before affine-fixing two
  points. Two remaining coordinates stay symbolic, and affine covariance
  supplies the general-position interpretation.
- The scalar vacuum-only semion block is not closed under crossing. This
  excludes that restricted block ansatz, not the semion category.
- Original conditional proof notes and code were independently reviewed by
  the GPT-6.1-xhigh collaborator who did not author them. Fifteen exact
  tests are parent-run; the earlier fourteen-test suite was also rerun by
  the skeptical collaborator. The multiplicity-selection extension and
  separate Fibonacci character argument received additional review. The
  final fifteen-test suite was independently rerun; the Fibonacci table
  was also recomputed using a separate commutator-word implementation.

### Acceptance

`python3 scripts/python/run_four_port_consistency.py`: fifteen exact test
groups pass, five deliberate errors are rejected, restored run passes.
Mutations cover dual basis conversion, null descent, inverse-metric sign,
pair reflection sign and Ward weight. Raw outputs, exact matrices/functions,
software versions and ten source/dependency/producer hashes are retained.
No network, full package test, chain diagonalization or numerical crossing
fit was used. No report source/PDF changed; the report guard remains the
structural check. Work is committed locally, without push.

### Open work and pointers

`reconstruction/09_four_port_equations.md` through
`13_semion_multiplicity.md`; CONVENTIONS (ai);
`runs/2026-10-21-four-port-consistency/`; root INDEX and reconstruction map.

Semion: the exact local four-port tensor solution and conditional doublet
selection still need complete graded carriers, all higher sewing and
operator/locality bounds. Fibonacci: completed analytic channels and
positive four-port sewing remain unknown; the finite coefficients and
midpoint hierarchy do not solve them. For both, constructing local
Hamiltonians, identifying standard KS and proving the OAR/state/category
limit remain the same overarching goal.
