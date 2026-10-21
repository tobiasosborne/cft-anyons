# Four-port positivity, coefficient hierarchy and local obstructions

**Status:** conditional local derivations for the proposed LC-9 equations.
Conventions: CONVENTIONS (ae), (ag), (ai). Formal deformation order,
boundary-energy grade, Taylor order in geometry, and microscopic cutoff
are distinct indices. No convergence or CFT existence theorem is inferred
from their finite truncations.

**Sources and dependencies.**

- [09_four_port_equations.md](09_four_port_equations.md), equations (1)–(11):
  typed cells, full carriers, invariant null quotients, dual block bases.
- [01_cells.md](01_cells.md), C1–C6: reflected cells, Ward equations,
  analytic hypotheses and internal stress; [03_sewing_deformations.md](03_sewing_deformations.md),
  section 4: gauge linearization and the distinction between a cokernel
  and a verified deformation complex.
- `references/categorical-reconstruction/FuchsRunkelSchweigert2002/source/hep.tex:2495–2515,5786–5815`:
  four-boundary sewing and the functional/state-dependent data absent from
  the categorical local system.
- `references/categorical-reconstruction/BrehmRunkel2024/source/main.tex:728–776,799–807,1013–1019`:
  pairings, cutting sums and normalization dependence.
- The algebraic identities below are locally derived; no cited source is
  claimed to prove this proposed system's existence or sufficiency.

## 1. Positive reflected sewing versus a positive channel metric

For collared partial cells P_r with a common outgoing Hilbert space and
external data x_r require geometric reflection sewing to give

    Q_rs=Z_reflect(P_r)sew(P_s)(x_r,x_s)
        =<Z_P_r x_r,Z_P_s x_s>.                               (1)

Thus every finite matrix Q must be PSD, for every allowed reflected
configuration and choice of external states. Line/coordinate reflection
identifications are included. For a reflection-compatible block kernel,
one may write `G=b_L^dagger H_L b_L`, with H_L PSD. LC-9's recoupling gives

    H_R=U_cat^dagger H_L U_cat.                                (2)

For compatible loop continuation require `M^dagger H M=H`, including the
specified projective/anomaly-line transport. No global trivialization of
that line or automatic single-valuedness of individual chiral blocks is
assumed. Monic normalization changes the matrix by the same basis
congruence; the normalization maps need not be unitary.

**Lemma FP-P [derived].** **ASSUME:** the Hilbert-space expression in (1)
and an invertible block change `b_L=U b_R`. **PROVE:** positivity of Q
and the positive-kernel basis conversion (2).

- ⟨1⟩1. For finite scalars a_r,
  `sum_rs conjugate(a_r) Q_rs a_s=||sum_s a_s Z_P_s x_s||^2>=0`.
  BY the inner-product axioms and (1).
- ⟨1⟩2. Substitution yields
  `b_L^dagger H_L b_L=b_R^dagger U^dagger H_L U b_R`.
  BY the block change.
- ⟨1⟩3. `y^dagger U^dagger H_L U y=(Uy)^dagger H_L(Uy)>=0`.
  BY H_L PSD. Invertibility gives the converse conversion too.
- ⟨1⟩4. QED by ⟨1⟩1–⟨1⟩3.

A positive channel matrix establishes this particular algebraic kernel
condition. It does not establish positivity of all geometric reflected
amplitudes, state-field reconstruction, domains, analytic locality or a
unitary CFT. Generic four-point functions with unrelated external fields
need not have a PSD coefficient matrix. Neither a diagonal H nor a
modulus square for every correlator is imposed. Scalar equality of one
positive kernel also does not identify the full state-valued block change
with the prescribed categorical F-matrix.

## 2. A countable analytic hierarchy at a common regular point

Fix the discrete carrier dimensions, countable homogeneous bases and a
countable cell grammar/chart presentation. Choose a common regular chart
point q0, for example z0=1/2 on (ai)'s initial branch. Include coordinate
and anomaly-line transport to fixed fibres in the definition of the
residual R(q). Assume the transported residual is analytic on a common
neighbourhood, with all state sums and derivatives locally uniformly
convergent. Different channel series may initially converge in different
sewing charts; their continuation paths to this neighbourhood are data.

For each external basis tuple impose the ordinary Taylor equations

    R_alpha=(1/alpha!) partial^alpha R(q0)=0                   (3)

for all multi-indices alpha. Include the analogous coefficient equations
for block recoupling, Ward/internal-stress, unit and null descent. PSD
Gram and reflected kernels add inequalities. Thus this specified
presentation gives countably many coefficient constraints, rather than
claiming a finite universal presentation or a countable search over all
possible dimension sequences.

**Lemma FP-T [conditional].** **ASSUME:** the common analytic chart and
convergence hypotheses just stated. **PROVE:** all equations (3) are
equivalent to vanishing of R in that analytic germ.

- ⟨1⟩1. Analyticity gives the convergent expansion
  `R(q)=sum_alpha R_alpha(q-q0)^alpha`. BY the chart hypothesis.
- ⟨1⟩2. If every coefficient vanishes, the sum vanishes throughout its
  convergence neighbourhood. Conversely a vanishing germ has zero
  derivatives. BY ⟨1⟩1 and termwise differentiation.
- ⟨1⟩3. Continuing a zero germ along a specified chain of overlapping
  analytic charts gives zero in each overlap and its continued germ.
  BY repeated uniqueness of the convergent local series.
- ⟨1⟩4. QED. Branches, coordinate transports and anomaly identifications
  cannot be omitted when comparing the continued germs.

Only finitely many Taylor equations are necessary tests: the nonzero
residual `(z-z0)^(N+1)` passes every derivative test through order N.
A descendant expansion truncated at grade four also does not determine
the exact midpoint derivatives: its omitted higher powers generally
contribute at z0=1/2. Exact rational/algebraic ansätze can instead be tested
as complete functions. Numerical partial sums require tail bounds before
claiming an exact crossing residual or its derivatives.

## 3. The actual Jacobian, including metric variation

Work in a chart of fixed discrete dimensions and fixed-rank positive
quotient bundles, with all operations preserving the declared null
subbundles. Collect cell maps, Gram forms, internal stress, analytic block
embeddings, transports and anomaly identifications as x. Fix the category
and its coherence maps. Let R(x)=0 collect the equality constraints,
including LC-9's geometric and categorical equations, about an actual
solution x0. Use real coefficient spaces for equations involving adjoints
or conjugation; a holomorphic subsystem may use complex spaces instead.
Put J=dR_x0, with the corresponding algebraic dual. Differentiate

    delta(B_out P B_in)
      =(delta B_out)P B_in+B_out(delta P)B_in
                                      +B_out P(delta B_in),
    delta(G^-1)=-G^-1(delta G)G^-1.                            (4)

Include differentiated external pairings, line maps and transports.
The second identity follows by differentiating `G G^-1=1` and multiplying
by G^-1. It applies on the positive quotient, not across rank-changing
null strata. On a finite quotient the collar variation is explicitly

    delta exp(-tE)
      =-integral_0^t exp(-(t-s)E)(delta E)exp(-sE) ds.           (5)

Indeed the variation solves `partial_t delta P=-E delta P-(delta E)P`,
`delta P(0)=0`; differentiating the integral verifies that initial-value
equation. Infinite-dimensional use requires a justified common-domain or
bounded-perturbation argument and is not asserted by this calculation.

At fixed categorical normalization, `delta K_L=F_cat delta K_R`.
For a varying analytic basis the block equation instead contributes

    delta b_L-(delta U)b_R-U(delta b_R)=0.                    (6)

Differentiating monic normalization maps determines the relevant delta U;
one must not freeze them while varying their underlying three-point data.
Positivity inequalities and analytic bounds remain separate from J.

## 4. Local obstruction and the limit of a finite test

**Lemma FP-J [conditional formal statement].** **ASSUME:** R(x0)=0 and
an expansion `x(t)=x0+sum_(r>=1) t^r x_r` solving the fixed equality
system through order N-1. **PROVE:** extension at order N is equivalent to

    J x_N=-b_N,   [b_N]=0 in coker J.                         (7)

- ⟨1⟩1. In the order-N coefficient, terms containing x_N are the first
  derivative Jx_N; all nonlinear terms use lower coefficients. Denote
  their sum b_N. BY expansion at x0.
- ⟨1⟩2. This coefficient vanishes exactly when -b_N lies in the actual
  algebraic image of J. BY ⟨1⟩1; this is (7).
- ⟨1⟩3. For a declared finite-dimensional ansatz, im J is the
  annihilator of ker J^T. Hence (7) is equivalent to
  `lambda(b_N)=0` for all left-null covectors `lambda J=0`.
  BY finite-dimensional dual linear algebra.
- ⟨1⟩4. QED. In infinite dimensions replacing im J by its closure changes
  the assertion and requires additional functional-analytic hypotheses.

An obstruction of a finite unknown ansatz excludes that ansatz. Omitted
high-grade variables can repair projected equations unless proved
irrelevant. A small least-squares residual is not an exact solvability
certificate. Gauge covariance at a solution gives JD0=0, so tangent
classes are ker J/im D0. A further verified identity D2J=0 is needed
before interpreting the next obstruction as a higher cohomology class.
LC-7's categorical HH vanishing freezes the analytic carriers, stress and
pairings; it cannot erase (7)'s additional four-port obstruction.

Formal solvability still leaves positive all-grade forms, convergent
sewing, complete sector fidelity and the microscopic construction open.
The downstream target remains bounded-range local Hamiltonians, their
standard KS generators, and a shared rigorous state/OAR CFT limit.
