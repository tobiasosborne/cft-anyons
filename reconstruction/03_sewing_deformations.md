# Sewing multipliers and formal deformation obstructions

**Status:** sourced categorical setting; checked formal algebraic fragment;
proposed extension to geometric sewing. Conventions: `CONVENTIONS.md` (ae).
The parameter \(t\) below is formal, **not a regulator cutoff or lattice spacing**.

**Sources and dependencies.** The cell system is in `01_cells.md`.
FRS, `references/categorical-reconstruction/FuchsRunkelSchweigert2002/source/hep.tex:2278–2285`,
defines algebra objects; `:2396–2408` expresses their associativity using the
fixed categorical F-matrices. Its `:8930–8936` discusses invariant pairings and
cyclic cohomology without supplying a full conformal deformation theorem.
Brehm–Runkel,
`references/categorical-reconstruction/BrehmRunkel2024/source/main.tex:680–692,2362–2370`,
supplies the Weyl anomaly factor and its additive cocycle identity.
The identities derived here are checked in
`scripts/python/test_local_conformal_identities.py`.

## 1. Projective sewing in local anomaly-line frames

The cell map is \(Z_P:D_{\rm in}\to D_{\rm out}\otimes L_P\), with the
Hermitian anomaly line and sewing identifications of (ae). In local frames,
write a composable sewing as

\[
Z_{Q\circ P}=\lambda(Q,P)Z_QZ_P,\qquad \lambda(Q,P)\ne0.
\]

Coherence of the **line identifications** under triple sewing requires

\[
\lambda(R,Q\circ P)\lambda(Q,P)
=\lambda(R\circ Q,P)\lambda(R,Q). \tag{1}
\]

Indeed, the two bracketings give respectively the two displayed scalar
coefficients multiplying \(Z_RZ_QZ_P\). Coherence is imposed on the lines
themselves; a vanishing composite amplitude cannot determine the scalar
identity by cancellation. Normalize identity sewings to have multiplier one.

Changing frames/amplitude representatives by \(Z'_P=b(P)Z_P\) gives

\[
\lambda'(Q,P)=\frac{b(Q\circ P)}{b(Q)b(P)}\lambda(Q,P). \tag{2}
\]

Thus the multiplier is a normalized multiplicative 2-cocycle modulo this
coboundary. In unitary frames for real unitary transformations the relevant
scalars are phases. Euclidean Weyl rescalings can instead have positive real
normalization factors: the cited Weyl cocycle is not identified with a
unitary group multiplier.

A nontrivial multiplier class is **allowed** for projective symmetry.
Consistency requires (1) and compatibility with the prescribed stress action;
it does not require trivializing every anomaly. These are local frame formulas,
not a claim that the anomaly lines admit a global trivialization.

## 2. A binary fragment with a fixed categorical associator

**ASSUME:** A fixed algebra object \((A,m,\eta)\) in a complex linear monoidal
category, with associative \(m\) and fixed unit. Fix the category, associator,
and all other cell data. All parenthesizations below include the corresponding
coherent associator maps. The argument changes multiplication, not F-symbols.

Let \(C^n=\operatorname{Hom}(A^{\otimes n},A)\) for \(n\ge1\), restricted to
cochains that vanish when any argument is the unit. Element notation below
is shorthand for morphism composites. Put \(ab=m(a,b)\) and define

\[
\begin{aligned}
(df)(a_1,\ldots,a_{n+1})={}&a_1f(a_2,\ldots,a_{n+1})\\
&+\sum_{i=1}^{n}(-1)^i
 f(a_1,\ldots,a_i a_{i+1},\ldots,a_{n+1})\\
&+(-1)^{n+1}f(a_1,\ldots,a_n)a_{n+1}.
\end{aligned} \tag{3}
\]

Associativity makes \(d^2=0\): terms with disjoint multiplications cancel in
pairs; the remaining adjacent terms cancel by \((ab)c=a(bc)\). Normalization
is preserved, since inserting the unit cancels the neighboring terms.
Write \(H^n=\ker d/\operatorname{im}d\) for this normalized complex.

Seek \(m_t=m+t\phi+t^2\psi+\cdots\), keeping the unit fixed. With the
left-minus-right associator convention (ae), coefficient comparison gives

\[
d\phi=0,\qquad
d\psi=O_2,\qquad
O_2(a,b,c)=\phi(\phi(a,b),c)-\phi(a,\phi(b,c)). \tag{4}
\]

The sign follows directly: the terms involving \(m\) and a binary cochain
\(f\) in the associator sum to \(-df\).

## 3. Formal obstruction statement and proof

**ASSUME:** Section 2, and normalized cochains \(\phi_1,\ldots,\phi_{N-1}\)
that solve associativity through order \(t^{N-1}\), with \(N\ge2\).
Define

\[
O_N(a,b,c)=\sum_{\substack{p,q\ge1\\p+q=N}}
\bigl[\phi_p(\phi_q(a,b),c)-\phi_p(a,\phi_q(b,c))\bigr]. \tag{5}
\]

**PROVE:** \(dO_N=0\). An extension through order \(t^N\) exists exactly when
\([O_N]=0\in H^3\). First-order solutions modulo infinitesimal unit-preserving
changes of basis are \(H^2\).

**⟨1⟩1.** For any bilinear multiplication \(u\), let
\(R_u(a,b,c)=u(u(a,b),c)-u(a,u(b,c))\). Then

\[
\begin{aligned}
0={}&u(a,R_u(b,c,d))-R_u(u(a,b),c,d)\\
&+R_u(a,u(b,c),d)-R_u(a,b,u(c,d))\\
&+u(R_u(a,b,c),d).
\end{aligned} \tag{6}
\]

**⟨2⟩1.** Expand the five terms into ten nested multiplication words.
Every word occurs once with each sign. No associativity of \(u\) is used.
**DEPENDENCIES:** definition of \(R_u\), bilinearity, fixed coherence maps.

**⟨1⟩2.** Set \(u=m+\sum_{r=1}^{N-1}t^r\phi_r\).
Its lower associator coefficients vanish by assumption, and its coefficient
at order \(N\) is \(O_N\). Taking order \(N\) in (6) therefore gives \(dO_N=0\).
**DEPENDENCIES:** ⟨1⟩1, the lower-order hypothesis, (3), (5).
For \(N=2\), this proves \(d\phi=0\Rightarrow dO_2=0\).

**⟨1⟩3.** Adding \(t^N\phi_N\) changes that associator coefficient to
\(O_N-d\phi_N\). Hence extension is equivalent to \(O_N\in\operatorname{im}d\).
**DEPENDENCIES:** coefficient expansion (4), ⟨1⟩2, definition of \(H^3\).

**⟨1⟩4.** For \(g=1+t\xi+O(t^2)\), with \(\xi\eta=0\), use
\(m'_t=g^{-1}m_t(g\otimes g)\). Expansion gives
\(\phi'_1=\phi_1+d\xi\). Since \(d\phi_1=0\), the quotient is \(H^2\).
**DEPENDENCIES:** (3), first-order associativity, first-order inverse of \(g\).

**⟨1⟩5. QED.** Dependencies: ⟨1⟩2–⟨1⟩4.
This proves a formal extension test around a known associative solution,
not an existence criterion for arbitrary prescribed-category CFTs.

## 4. Linearizing geometric sewing: what is and is not a complex

Collect the cell amplitudes, coordinate actions, stress coefficients and
line identifications as \(x\); denote the chosen equations by \(\mathcal R(x)=0\).
Around an actual solution \(x_0\), define \(D_1=d\mathcal R_{x_0}\).
Infinitesimal allowed changes of bases/frames define \(D_0\). Gauge covariance
implies \(D_1D_0=0\), so the tangent space modulo these gauges is
\(\ker D_1/\operatorname{im}D_0\).

At formal order \(N\), the equation is \(D_1x_N=-b_N\), with \(b_N\) determined
by lower coefficients. Its obstruction is the class of \(b_N\) in
\(\operatorname{coker}D_1\). This uses the actual algebraic range, not its closure.
Checked identities between equations can supply \(D_2D_1=0\) and \(D_2b_N=0\),
placing the obstruction in \(\ker D_2/\operatorname{im}D_1\). Without those
identities, naming a second cohomology group does not construct a complex.
Even checked identities need not form a complete presentation of all relations.

The binary calculation supplies one explicit such fragment. It freezes the
geometric dependence, pairing, adjoints and stress action; deforming these
requires further equations. Rigidity of a finite categorical algebra sector,
if established, would not settle existence of its analytic conformal lift.
Do not infer that this fragment must have nonzero cohomology just because
the full reconstruction is difficult.

Formal solvability does not establish positive all-grade Gram forms,
convergent sewing, Hilbert-space locality, energy bounds or exponentiation.
Nor does it identify the complete sector category with the input or establish
a local lattice Hamiltonian, standard Koo–Saleur limit and OAR compatibility.
These remain distinct obligations of the reconstruction programme.
