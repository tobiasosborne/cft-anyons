# Small-category tests of finite sewing

**Status:** exact categorical algebra calculations. These test the finite
binary sewing layer of 03_sewing_deformations.md; they do not construct
conformal excitation spaces or a lattice scaling limit. Conventions are
CONVENTIONS.md (ah). No braided commutativity condition is imposed, and
no R-symbol enters the multiplication calculations.

**Sources and dependencies.**

- FRS, references/categorical-reconstruction/FuchsRunkelSchweigert2002/source/hep.tex:2278–2285,2396–2408:
  algebra objects and associativity in fusion-channel bases.
- RSW, references/category-theory/RowellStongWang2009Classification/source/RSWfinal3.tex:2339,2353–2407:
  unitary gauge, semion associator, Fibonacci fusion and F-matrix.
- references/text/TrebstShortIntroductionFibonacciAnyons.txt:291–292,310–324:
  all other admissible Fibonacci F-symbols are one; channel order is
  \((\mathbf1,\tau)\).
- references/text/PenneysUnitaryFusionCategories.md:614–625:
  Fibonacci cup, zigzag identities and cup norm. Its trivalent-vertex
  normalization is not identified with our orthonormal fusion basis.
- literature/md/1905.04924/1905.04924.md:688–718:
  internal homs and their composition.

## 1. Input and all multiplication coefficients

Use \(\mathbf1,x\) for simple objects, encoded by integer labels \(0,1\).
The comparison \(\mathrm{Vec}_{\mathbb Z_2}\) is the category of graded finite
Hilbert spaces with its ordinary, trivial associator. Semion has the same
fusion rule \(x^2=\mathbf1\), but \(F^{xxx}_x=-1\). Write
\(\sigma=F^{xxx}_x\in\{+1,-1\}\) for these two pointed inputs.

For Fibonacci, \(x^2=\mathbf1+x\), \(\varphi=(1+\sqrt5)/2\), and
\(r=\sqrt\varphi>0\). The only nontrivial F-matrix is

\[
F^{xxx}_x=\begin{pmatrix}r^{-2}&r^{-1}\\r^{-1}&-r^{-2}\end{pmatrix},
\qquad r^4=r^2+1.
\]

Take \(A=\mathbf1+x\) with orthogonal isometric summand inclusions and
isometric fusion vertices. The unit \(\eta\) is the \(\mathbf1\)-summand
inclusion, so \(\eta^\dagger\eta=1\). The unit equations fix
\(m_{\mathbf1\mathbf1}^{\mathbf1}=m_{\mathbf1x}^x=m_{x\mathbf1}^x=1\).
The remaining coefficients are
\(m_{xx}^{\mathbf1}=\alpha\) and, only for Fibonacci, \(m_{xx}^x=\beta\).

The ordered pair channels are \((\mathbf1\mathbf1,xx)\) in total charge
\(\mathbf1\), and \((\mathbf1x,x\mathbf1,xx)\) in total charge \(x\).
Omit the final \(xx\) channel in the pointed case. Thus

\[
m_{\mathbf1}=(1,\alpha),\qquad
m_x=(1,1,\beta)\ \text{or}\ (1,1).
\tag{1}
\]

## 2. Associativity and the F-move Frobenius calculation

**ASSUME:** The input and normalized ansatz of section 1. Use \(F[e,f]\)
to change a left intermediate channel \(e\) into a right channel \(f\).
Set \(\Delta=m^\dagger\).

**PROVE:** The solution and obstruction statements in section 3.

**⟨1⟩1. Associativity.** For triple inputs \(a,b,c\) and total charge \(d\),

\[
m_{ab}^e m_{ec}^d
=\sum_f F_d^{abc}[e,f]m_{bc}^f m_{af}^d.
\tag{2}
\]

Any input \(\mathbf1\) reduces to the unit equations. In the pointed case,
\(xxx\to x\) gives \(\alpha=\sigma\alpha\). For Fibonacci, \(xxx\to\mathbf1\)
is tautological and \(xxx\to x\) gives

\[
\binom{\alpha}{\beta^2}
=F^{xxx}_x\binom{\alpha}{\beta^2},
\qquad \beta^2=r^{-3}\alpha.
\tag{3}
\]

**DEPENDENCIES:** sourced channel associativity, section 1, \(r^4=r^2+1\).
These exhaust the admissible triple-channel equations.

**⟨1⟩2. Frobenius maps.** One side of the Frobenius identity is
\(L=(1\otimes m)F(m^\dagger\otimes1)\). The other side is \(L^\dagger\).
It suffices to verify \(L=m^\dagger m\), since the latter is self-adjoint.
Splitting the first input, reassociating, and multiplying the last two gives

\[
L_d[(p,k),(a,b)]
=\sum_q\overline{m_{pq}^a}\,F_d^{pqb}[a,k]\,m_{qb}^k.
\tag{4}
\]

**DEPENDENCIES:** orthonormal fusion bases and dagger convention in section 1.
The sum includes only allowed fusion paths; it retains the F-symbols.

**⟨2⟩1. Pointed blocks.** Substitution into (4) gives

\[
L_{\mathbf1}=\begin{pmatrix}1&\alpha\\\bar\alpha&1\end{pmatrix},
\quad (m^\dagger m)_{\mathbf1}
=\begin{pmatrix}1&\alpha\\\bar\alpha&|\alpha|^2\end{pmatrix},
\]
\[
L_x=\begin{pmatrix}1&1\\\sigma|\alpha|^2&1\end{pmatrix},
\quad (m^\dagger m)_x=\begin{pmatrix}1&1\\1&1\end{pmatrix}.
\tag{5}
\]

**⟨2⟩2. Fibonacci blocks.** The corresponding matrices are

\[
L_{\mathbf1}=\begin{pmatrix}1&\alpha\\\bar\alpha&1+|\beta|^2\end{pmatrix},
\quad (m^\dagger m)_{\mathbf1}
=\begin{pmatrix}1&\alpha\\\bar\alpha&|\alpha|^2\end{pmatrix},
\]
\[
L_x=\begin{pmatrix}
1&1&\beta\\
|\alpha|^2/r^2&1&\alpha\bar\beta/r\\
\bar\alpha\beta/r&\bar\beta&1-|\beta|^2/r^2
\end{pmatrix},
\quad (m^\dagger m)_x=\begin{pmatrix}
1&1&\beta\\1&1&\beta\\\bar\beta&\bar\beta&|\beta|^2
\end{pmatrix}.
\tag{6}
\]

**DEPENDENCIES:** ⟨1⟩2 and the specified F-data, for both substeps.

**⟨1⟩3. Complex solutions and gauge.** Equation (5) requires
\(|\alpha|^2=1=\sigma|\alpha|^2\). Equation (6) is equivalent to

\[
|\alpha|^2=\varphi,\qquad |\beta|^2=\varphi^{-1},\qquad
\alpha\bar\beta/r=\beta.
\tag{7}
\]

Its remaining entry follows from \(\varphi^2=\varphi+1\); (7) also implies
(3). Hence \(\beta=r^{-1}e^{i\theta}\), \(\alpha=re^{2i\theta}\).
Under \(g=1_{\mathbf1}\oplus u1_x\), \(|u|=1\), and
\(m'=g^{-1}m(g\otimes g)\), the coefficients become
\(\alpha'=u^2\alpha,\ \beta'=u\beta\). Taking \(u=e^{-i\theta}\) gives the
positive representative. For the positive pointed case, a square-root phase
choice similarly sets \(\alpha=1\).
**DEPENDENCIES:** ⟨2⟩1–⟨2⟩2, (3).

**⟨1⟩4. Specialness.** The rows (1) give
\((mm^\dagger)_{\mathbf1}=1+|\alpha|^2\) and
\((mm^\dagger)_x=2+|\beta|^2\), omitting the beta term for pointed fusion.
Thus the specialness scalars are \(2\) and \(\varphi^2\), respectively.
**DEPENDENCIES:** ⟨1⟩3 and \(\varphi^{-1}=\varphi-1\).

**⟨1⟩5. QED.** Dependencies: ⟨1⟩1–⟨1⟩4.

## 3. What succeeds and what the semion obstruction excludes

| Input | Positive representative | \(mm^\dagger\) |
|---|---|---|
| \(\mathrm{Vec}_{\mathbb Z_2}\), \(A=\mathbf1+x\) | \(\alpha=1\) | \(2\,1_A\) |
| Fibonacci, \(A=\mathbf1+x\) | \(\alpha=\sqrt\varphi,\ \beta=\varphi^{-1/2}\) | \(\varphi^2\,1_A\) |
| Semion, \(A=\mathbf1+x\) | No dagger Frobenius solution | — |

For each successful row, \(m^\dagger\) divided by the specialness scalar is
a bimodule section of \(m\), proving separability.

For semion, associativity forces \(\alpha=0\). This associative solution is
not separable, even without prescribing a dagger:

**ASSUME:** A bimodule right inverse \(s:A\to A\otimes A\) of \(m\).
**PROVE:** Contradiction.
**⟨1⟩1.** Since \(ms=1_A\), write
\(s(\mathbf1)=|\mathbf1\mathbf1\rangle+v|xx\rangle\).
**⟨1⟩2.** Left module compatibility gives \(s(x)=|x\mathbf1\rangle\);
the second term vanishes because \(m_{xx}=0\).
**⟨1⟩3.** Right module compatibility gives \(s(x)=|\mathbf1x\rangle\).
**⟨1⟩4. QED.** These are independent pair channels.
Dependencies: section 1, ⟨1⟩1–⟨1⟩3. Reassociation cannot revive the zero term.

This excludes this algebra ansatz, not semion CFTs or all boundary data.
The alternative \(A=\mathbf1\) has \(m=\eta=1\), is dagger Frobenius and
special with scalar one in **all three categories**. That elementary
alternative by itself supplies no missing conformal realization.

## 4. Normalized inner-end interpretation for Fibonacci

The sourced internal end \([x,x]\) in the regular module category is
\(x\otimes x^*=\mathbf1+x\). Take
\(\eta_0=\operatorname{coev}\) and
\(m_0=1_x\otimes\operatorname{ev}\otimes1_{x^*}\), with associators inserted.
The zigzag identities give unitality; the two disjoint evaluations give
associativity. Dagger reflection gives the Frobenius identity, and the
closed evaluation/coevaluation loop gives

\[
\eta_0^\dagger\eta_0=\varphi,\qquad
m_0m_0^\dagger=\varphi\,1_A.
\]

Normalize \(\eta=\eta_0/r,\ m=rm_0\). The unit identities are preserved and
\(\eta^\dagger\eta=1,\ mm^\dagger=\varphi^2\,1_A\).
In orthonormal summand bases these maps satisfy the preceding block
equations; their single unitary gauge orbit identifies them with the positive
representative. This derives the normalization rather than treating the
categorical cup as an isometric vacuum vertex.

## 5. Verification and remaining reconstruction problem

Verification entry points are scripts/python/small_category_sewing.py and
scripts/python/test_small_category_inputs.py. The finite checks enumerate
all admissible triple channels, use the F-move formula (4), and compare
specialness scalars exactly. In the Fibonacci field, \(r>0\) and
\(r^4-r^2-1=0\) determine the chosen algebraic branch.

The result distinguishes inputs having identical fusion rules but different
associators at the finite sewing layer. It does not supply a local stress
field, graded boundary excitations, convergent geometric sewing, a microscopic
Hamiltonian, standard Koo–Saleur convergence, or category-faithful OAR limits.
