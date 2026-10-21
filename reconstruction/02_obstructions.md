# Local stress lifts and their obstruction equations

**Status: proposal plus conditional local derivations.** These equations
identify distinct solvability questions for the reconstruction programme.
They neither construct a CFT nor assume that categorical sewing already
supplies stress generators. Conventions are fixed in `CONVENTIONS.md` (ac)–(ae).

**Sources and dependencies.** Precise local anchors:

- `references/cft/Schottenloher2008/Schottenloher2008.md:2200–2285`:
  section defect, central cocycle, splitting, and Lie-algebra H²;
  `:2405–2422`: opposite group/vector-field bracket conventions;
  `:1967–1973,2333–2377`: local sections versus global/topological issues;
  `:3044–3056`: integration in the stated unitary highest-weight setting.
- `references/cft-machine/coset-symmetry/CarpiWeiner2004/source.tex:356–380`:
  interval-local implementation given covariance and Haag duality;
  `:407–445`: invariant mode core, Fourier and exponential conventions.
- The elementary derivations below supply the additional algebraic claims.
  Their symbolic checks are specified in
  `scripts/python/test_local_conformal_identities.py`; execution results
  belong to its run record, not to the assumptions of these propositions.

## 1. The first local equation is internal implementation

**Proposal.** On each chosen cell algebra, prescribe the coordinate response
δ and solve for its generator in the allowed local implementer space:

\[
 \delta_v(ab)=\delta_v(a)b+a\delta_v(b),\quad
 \delta_v(a^*)=\delta_v(a)^*,\quad
 [\delta_v,\delta_w]=\delta_{[v,w]},\qquad
 \delta_v(a)=[A(v),a],\quad A(v)^*=-A(v).
\]

The last equation is substantive: an unrelated global Hilbert-space
implementer does not solve the required local support condition.

**Proposition 1 — algebraic innerness obstruction [derived].**
**ASSUME:** a unital associative algebra B and a declared B-bimodule E;
δ:B→E is linear. Define
\[
 (b_0K)(a)=aK-Ka,\qquad
 (b_1D)(a,b)=aD(b)-D(ab)+D(a)b.
\]
**PROVE:** δ is implemented by an element of E iff its class vanishes in
\(HH^1(B,E):=\ker b_1/\operatorname{im}b_0\), provided \(b_1\delta=0\).

- ⟨1⟩1. Expansion gives \(b_1b_0K=0\). **BY:** bimodule associativity.
- ⟨1⟩2. \(b_1\delta=0\) is exactly the Leibniz equation.
- ⟨1⟩3. \([\delta]=0\) iff \(\delta=-b_0K=[K,\cdot]\) for some K.
  **BY:** definition of the quotient and ⟨1⟩1–2. **QED.**

For E=B with its *-operation, a *-derivation implemented by K also has
skew implementer \((K-K^*)/2\): taking adjoints in its implementation
identity shows that K+K* commutes with B. This is HH¹ of the observable
algebra, not Lie H¹ of the coordinate-variation algebra.

A range-restricted ansatz need not be a bimodule. Without closure under
these products, use the cokernel of the specified commutator map; calling
it HH¹ would be unjustified. For unbounded implementers E, declare a common
invariant domain D on which both B-module products exist. Affiliation alone
does not supply this bimodule. Vanishing of HH¹ does not supply continuous
linear selection v↦A(v), bounded range, energy bounds or self-adjointness.

## 2. A projective anomaly is not the same obstruction

**Proposition 2 — central defect and counterterms [derived].**
**ASSUME:** a real Lie algebra g, a Lie action δ:g→Der(B), and a real-linear
skew lift A:g→B with \(\delta_v=[A(v),\cdot]\). All products exist in B,
or on an explicitly specified common invariant core. Define
\[
 F(v,w)=[A(v),A(w)]-A([v,w]).
\]
**PROVE:** F commutes with B; when F belongs to B, it is a central 2-cocycle.

- ⟨1⟩1. \([F(v,w),a]=([\delta_v,\delta_w]-\delta_{[v,w]})(a)=0\).
  **BY:** operator Jacobi and the Lie-action assumption.
- ⟨1⟩2. If F∈B then F∈Z(B). **BY:** ⟨1⟩1 and the definition of center.
- ⟨1⟩3. Substitute \([A(v),A(w)]=A([v,w])+F(v,w)\) into operator
  Jacobi. Centrality removes commutators with F, while Jacobi in g removes
  the remaining A terms. Thus
  \[
   F(u,[v,w])+F(v,[w,u])+F(w,[u,v])=0.
  \]
  **BY:** ⟨1⟩2 and Jacobi. **QED.**

Scalarity \(F=i\kappa\mathbf1\), with κ real, requires scalar center or
an explicitly chosen scalar central character. Testing Ward identities
only on C⊂B yields merely \(F\in C'\cap B\). This relative commutant need
not be central. For unbounded operators, core commutation alone does not
prove strong commutation, affiliation or scalarity of the closures.

With scalarity established and the trivial-coefficient convention (ae),
\[
 A'(v)=A(v)+i\lambda(v)\mathbf1
 \quad\Longrightarrow\quad
 \kappa'=\kappa+d\lambda,\qquad
 (d\lambda)(v,w)=-\lambda([v,w]).
\]
This follows by expanding the commutator; it agrees with the splitting
criterion at Schottenloher `:2236–2264`.

Consequently [κ]∈H²(g,ℝ) obstructs eliminating the anomaly, whereas
projective symmetry permits a nonzero class. For a declared target cocycle,
[κ−κ_target] is the obstruction to matching it by scalar counterterms.
Two matching corrections differ by a 1-cocycle; with trivial action the
1-coboundaries vanish, so this ambiguity is H¹(g,ℝ). These statements use
the **same** coefficient module and cochain complex throughout. Continuous
or local cochains must form a subcomplex; an abstract primitive need not
be an allowed local counterterm.

Here dκ is a 3-cochain required to vanish. This is a 2-cocycle condition,
not a demonstrated nonzero H³ obstruction. Once A exists in an associative
operator algebra, Jacobi enforces it. A genuine H³ lifting obstruction
requires another explicitly defined lifting problem and coefficient module.

## 3. The circle sign fixed by the stress convention

**Proposition 3 — sourced mode convention [derived].**
**ASSUME:** Carpi–Weiner's common-core mode relations,
\(T(f)=\sum_n\widehat f_nL_n\), \(A(f)=iT(f)\), initially for Fourier
polynomials. **PROVE:** with \([f,g]_* = f'g-fg'\),
\[
 [A(f),A(g)]-A([f,g]_*)
 =-\frac c{12}\sum_m(m^3-m)\widehat f_m\widehat g_{-m}\mathbf1
 =-\frac{ic}{24\pi}\int_0^{2\pi}(f'''+f')g\,d\theta\,\mathbf1.
\]

- ⟨1⟩1. For Fourier monomials indexed by m,n,
  \([f,g]_* =i(m-n)e^{i(m+n)\theta}\), so
  \(A([f,g]_*)=-(m-n)L_{m+n}\). **BY:** differentiation and linearity.
- ⟨1⟩2. \([iL_m,iL_n]=-[L_m,L_n]\) gives the displayed mode defect.
  **BY:** sourced Virasoro relation and ⟨1⟩1.
- ⟨1⟩3. The Fourier integral of \((f'''+f')g\), divided by 2π, is
  \(-i\sum_m(m^3-m)\widehat f_m\widehat g_{-m}\).
  **BY:** Fourier orthogonality. Together with ⟨1⟩2 this proves the formula.
  **QED.**

This conditional calculation fixes the target sign; it does not impose
exact Virasoro relations at finite cutoff. Smooth smearing needs additional
convergence/domain control. The opposite derivation bracket fg′−f′g cannot
be silently combined with A=iT and a homomorphism convention.

## 4. Cell Ward connections and sewing curvature

**Proposition 4 — local integrability equations [derived].**
**ASSUME:** a smooth geometry patch Q, locally trivialized carriers with
constant positive Gram forms, and metric-compatible connections ∇=d+B.
Matrices B_X are skew relative to these forms. Every derivative/product
below exists on the chosen common domain. A cell has type
\(Z_P:D_{in}\to D_{out}\otimes L_P\), with Hermitian anomaly line L_P
and connection one-form b_P. **PROVE:** the following Ward and curvature
conditions hold for a parallel cell map.

This metric-compatible tier applies to unitary coordinate directions, not
arbitrary collar/modulus variations. The algebraic curvature identities
also hold for non-metric connections, but their unitarity interpretation
does not. Inhomogeneous stress-insertion Ward equations need the additional
derivatives of their right-hand sides; see LC-1 C4.

- ⟨1⟩1. Expanding the induced Hom connection gives the Ward equation
  \[
   XZ_P+(B_{out,X}\otimes1+1\otimes b_{P,X})Z_P-Z_PB_{in,X}=0.
  \]
  **BY:** induced tensor and dual connections. Boundary tensor products
  carry the sum of their factor connections.
- ⟨1⟩2. Expansion on a section yields
  \[
   [\nabla_X,\nabla_Y]-\nabla_{[X,Y]}=F_B(X,Y),\quad
   F_B(X,Y)=XB_Y-YB_X-B_{[X,Y]}+[B_X,B_Y].
  \]
  **BY:** the product rule.
- ⟨1⟩3. Apply ⟨1⟩2 to the parallel Hom section in ⟨1⟩1:
  \[
   (F_{out}\otimes1+1\otimes F_{L_P})Z_P-Z_PF_{in}=0.
  \]
  If all curvatures are scalar and Z_P≠0, their real coefficients obey
  \(f_{out}+f_{L_P}=f_{in}\). **BY:** induced curvature and scalarity.
- ⟨1⟩4. Operator Jacobi and ⟨1⟩2 give Bianchi:
  \[
   \mathop{\rm cyclic}_{X,Y,Z}
   \{XF_B(Y,Z)+[B_X,F_B(Y,Z)]-F_B([X,Y],Z)\}=0.
  \]
  For \(F_B=if\mathbf1\), this is df=0. **QED.**

**Proposal.** Sewing must include specified connection-compatible anomaly
line identifications. Solve these Ward equations on arbitrary boundary
states, not merely vacuum expectations. At cutoff use named residuals and
prove their disappearance along the refinement/domain schedule. Bianchi
holds for any defined connection; it does not force its noncentral curvature
to vanish. Fixed-fibre A and geometric B are distinct: if the prescribed
response is \(XO=[A_X,O]\), then the observable Ward connection uses B=−A.

## 5. Gauge, topology and the finite-dimensional distinction

**Derived identities.** Under s′=Us for unitary U,
\[
 B'=UBU^{-1}-(dU)U^{-1},\qquad F'=UFU^{-1}.
\]
These follow by applying \(\nabla'=U\nabla U^{-1}\) to a section.
A scalar change B↦B+iλ1 gives f↦f+dλ when F=if1. A phase gauge
U=e^{iχ} has λ=−dχ and leaves curvature unchanged. Thus a scalar counterterm
is more general than a change of phase frame. Lie CE cohomology, de Rham
cohomology on Q, and overlap cohomology of projective transition functions
are different complexes. No identification between them is asserted.
Local exactness of a curvature form supplies neither an invariant CE
primitive nor a global symmetry lift; the cited topology/integration
sources do not establish general infinite-dimensional integration here.

**Proposition 5 — finite-matrix limitation [derived].**
**ASSUME:** a linear A:g→u(V), dim V=r<∞, and the exact identity
\([A(v),A(w)]-A([v,w])=i\kappa(v,w)1\) for every v,w.
**PROVE:** κ is a scalar CE coboundary.

- ⟨1⟩1. \(ir\kappa(v,w)=-\operatorname{tr}A([v,w])\).
  **BY:** the trace of a matrix commutator vanishes.
- ⟨1⟩2. Set \(a(v)=\operatorname{tr}A(v)/(ir)\), which is real by
  skewness. Then \(\kappa(v,w)=-a([v,w])=da(v,w)\).
  **BY:** ⟨1⟩1 and convention (ae). **QED.**

A finite-rank connection instead has tr F=d tr B: its derivative terms
permit nonzero scalar curvature, locally satisfying ir f=d tr B. This
follows by tracing Proposition 4, ⟨1⟩2; it is not an exact finite-matrix
realization of a nontrivial central Lie-algebra class.

**Open obligations.** The generators must arise from the same categorical
cell data and cutoff-dependent local Hamiltonian, agree asymptotically with
the standard KS prescription, and satisfy the OAR/state/domain estimates.
Neither these local equations nor vanishing algebraic obstructions establish
positive energy, projective-unitary integration, or categorical fidelity.
