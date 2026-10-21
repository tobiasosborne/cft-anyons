# Exact cohomology of the two small categorical algebras

**Status: derived local result.** Both positive algebra objects selected
below have vanishing normalized categorical Hochschild cohomology in every
positive degree. An explicit separability morphism supplies a contracting
homotopy, so this includes a proof of H³=0 without numerical rank fitting.
The result concerns binary sewing with fixed category, associator and unit.
It does not construct a stress tensor or a CFT. Conventions: (ae), (ah).

**Sources and dependencies.**

- `references/text/TrebstShortIntroductionFibonacciAnyons.txt:287–324`:
  unit-channel associators and unitary Fibonacci F-matrix, eqs. (2.2)–(2.4).
- `references/category-theory/RowellStongWang2009Classification/source/RSWfinal3.tex:2379–2409`:
  independent Fibonacci fusion and F-data.
- `references/categorical-reconstruction/FuchsRunkelSchweigert2002/source/hep.tex:2820–2862`:
  Frobenius compatibility and specialness definitions.
- The differential, splitting and contraction are derived below. Their
  deformation interpretation is the binary fragment of
  [03_sewing_deformations.md](03_sewing_deformations.md), distinct from
  [05_mixed_complex.md](05_mixed_complex.md) and geometric reconstruction.

## 1. The objects and the actual cochain spaces

Use A=1⊕x with strict unit coefficients
\(m_{11}^1=m_{1x}^x=m_{x1}^x=1\). Write \(m_{xx}^1=\alpha\), and
in Fibonacci additionally \(m_{xx}^x=\beta\). Fusion vertices are orthonormal;
source trees are left associated. The two choices are

| Category | Fusion | Positive coefficients |
|---|---|---|
| Untwisted Vec_Z2 | x²=1 | α=1 |
| Fibonacci | x²=1+x | α=√φ, β=1/√φ |

Here \(\varphi=(1+\sqrt5)/2\). Vec_Z2 explicitly has trivial associator;
it is not being identified with the semion modular category. For Fibonacci,
\[
 F=\begin{pmatrix}p&q\\q&-p\end{pmatrix},\qquad
 p=\varphi^{-1},\quad q=\varphi^{-1/2}.
\]
The nontrivial associative constraint is
\(F(\alpha,\beta^2)^T=(\alpha,\beta^2)^T\); the total-output-1
constraint is αβ=βα. Inputs containing the unit satisfy associativity by
normalization. The stated positive coefficients solve these equations.

Normalized categorical cochains are morphisms A^⊗n→A vanishing on any
unit input. Hence
\[
 C^n=\operatorname{Hom}_{\mathcal C}(x^{\otimes n},A),\quad n\ge1.
\]
These are categorical Hom spaces, not multilinear maps on an assumed
underlying vector space for x. The differential is the alternating sum of
outer multiplication and adjacent multiplication, with the fixed associators
inserted. Its square vanishes by associative coherence. Also
\(C^0=\operatorname{Hom}_{\mathcal C}(1,A)=\mathbb C\eta\) and d₀=0.
Including or omitting C⁰ therefore does not change positive-degree cohomology.

For Vec_Z2, dim Cⁿ=1 for every n. The Fibonacci fusion recurrence gives
\((\dim C^1,\dim C^2,\dim C^3,\dim C^4)=(1,2,3,5)\).

## 2. Low-degree differentials and categorical derivations

**Proposition 1 [derived].** **ASSUME:** the Fibonacci algebra above.
A normalized unary cochain is \(\xi|_x=u\,\mathrm{id}_x\). Use binary
coordinates (a,b) on xx→1 and xx→x. Order C³ by output 1, then output x
with left intermediate charge 1,x. **PROVE:**
\[
 d_1u=\binom{2\alpha u}{\beta u},\qquad
 d_2=\begin{pmatrix}0&0\\p-1&2\beta q\\q&-2\beta(p+1)\end{pmatrix},
 \qquad \operatorname{rank}d_1=\operatorname{rank}d_2=1.
\]

- ⟨1⟩1. In \(d_1\xi=m(\xi\otimes1)+m(1\otimes\xi)-\xi m\),
  the output-1 coefficient is 2αu and the output-x coefficient is βu.
  **BY:** the unit normalization and the stated components of m.
- ⟨1⟩2. The first variation of the associator residual is
  \((I-F)(a,2\beta b)^T\) in output x and zero in output 1.
  The Hochschild differential has the negative residual sign, giving d₂.
  **BY:** convention (ae) and the displayed associativity equation.
- ⟨1⟩3. d₁≠0. Also F−I has rank one because p²+q²=1, tr F=0 and
  q≠0; multiplication by diag(1,2β) does not change rank.
  **BY:** the exact scalar identities and β≠0.
- ⟨1⟩4. \(\ker d_2=\mathbb C(2\alpha,\beta)=\operatorname{im}d_1\).
  **BY:** p+1=φ, α/β=φ, and ⟨1⟩3. **QED.**

Thus H¹=H²=0 already follows in these degrees. In Vec_Z2 the normalized
one-dimensional differentials alternate d₁=2,d₂=0,d₃=2,d₄=0,...:
all middle products become unit inputs and vanish; the two outer terms
add for odd degree and cancel for even degree.

A categorical derivation D:A→A must vanish on η. Since 1 and x are
nonisomorphic simples, its remaining component is \(D|_x=u\,\mathrm{id}_x\).
The derivation equation is d₁D=0, which forces u=0 in **both** positive
solutions. This is stronger than saying that its cohomology class is zero:
the categorical derivation itself vanishes because d₀=0.

## 3. An explicit separability morphism

Let |11⟩ and |xx;1⟩ denote the normalized vacuum-channel inclusions
1→A⊗A. For Fibonacci put d=φ²=1+φ and
\[
 e=\frac{|11\rangle+\alpha|xx;1\rangle}{d}:1\longrightarrow A\otimes A.
\]

**Proposition 2 [derived].** **ASSUME:** the multiplication and F-data of
§1. **PROVE:**
\[
 me=\eta,\qquad
 (m\otimes1)(1\otimes e)=(1\otimes m)(e\otimes1).                 \tag{S}
\]
All products here include their required associators.

- ⟨1⟩1. \(me=(1+\alpha^2)\eta/d=\eta\).
  **BY:** α²=φ and d=1+φ.
- ⟨1⟩2. Both sides of the second equation restrict to e on input 1.
  **BY:** the unit equations.
- ⟨1⟩3. On input x, order output channels (1x,x1,xx→x). On the left,
  |11⟩ contributes 1/d to x1. Recoupling x(xx→1) uses F-column (p,q),
  giving α²p/d=1/d on 1x and αβq/d=β/d on xx→x.
- ⟨1⟩4. On the right, |11⟩ contributes 1/d to 1x; F-row (p,q) gives
  1/d on x1 and β/d on xx→x. **BY:** F=Fᵀ and the same identities.
- ⟨1⟩5. Both restrictions are (1,1,β)/d. The morphisms agree on both
  simple summands of A. **BY:** ⟨1⟩2–4. **QED.**

Set s=(m⊗1)(1⊗e). Associativity makes s left A-linear; the other expression
in (S) makes it right A-linear. Also ms=id_A by me=η and associativity.
Its two input-channel vectors are (1,α)/d and (1,1,β)/d, exactly those of
m†/d. Consequently Δ=m† obeys the FRS Frobenius identity, and
\[
 mm^\dagger=(1+\alpha^2)\mathrm{id}_1\oplus(2+\beta^2)\mathrm{id}_x
            =d\,\mathrm{id}_A.
\]
Coassociativity and counit η† follow by taking daggers of associativity and
the unit equations. For Vec_Z2 the same verification uses d=2 and
\(e=(|11\rangle+|xx;1\rangle)/2\), with x-output coefficients (1,1)/2.

## 4. A contraction in every positive degree

**Proposition 3 [derived].** **ASSUME:** an associative unital algebra
object m with a morphism e satisfying (S). Define, for n≥1,
\[
 h_n(f)=m(1_A\otimes f)(e\otimes1_A^{\otimes(n-1)}).
\]
**PROVE:** \(d_{n-1}h_n+h_{n+1}d_n=\mathrm{id}_{C^n}\).

In this proof \(\sum_i x_i\otimes y_i=e\) is only notation for inserting
the morphism e. It is not a pure-tensor expansion in a fiber functor.
Each expression below denotes the corresponding composed morphism, with
associators inserted.

- ⟨1⟩1. Expanding h_(n+1)d_n f, its first term is f, because the
  adjacent product of the two e legs is me=η.
- ⟨1⟩2. Its next term is \(-\sum_i x_i f(y_i a_1,a_2,\ldots,a_n)\).
  The first term of d_(n−1)h_n f is
  \(\sum_i a_1x_i f(y_i,a_2,\ldots,a_n)\). They cancel by the second
  equation (S), which moves the a₁ multiplication between the two e legs.
- ⟨1⟩3. Each remaining adjacent multiplication in h d has the opposite
  sign to its counterpart in d h. The final terms have signs (−1)^(n+1)
  and (−1)^n and cancel. **BY:** the alternating differential and
  associativity; coherence identifies the intervening parentheses.
- ⟨1⟩4. Only f remains. **BY:** ⟨1⟩1–3. **QED.**

For n≥2, h preserves normalization: any external unit argument remains a
unit argument of f. For n=1 it lands in C⁰; in our two examples d₀=0.
Thus the contraction proves injectivity of d₁ as well as exactness in
all higher normalized degrees. Every closed f has explicit primitive h_n f.

As a low-degree normalization check, the Fibonacci contraction has
\[
 h_2=\begin{pmatrix}\beta/d&\beta/d\end{pmatrix},\qquad
 h_2d_1=(2\alpha\beta+\beta^2)/d=1.
\]
Indeed, inserting e and recoupling gives coefficients αp/d=β/d and
αβq/d=β/d. This tests the actual contraction, not only d₂d₁=0.

**Conclusion [derived].** For both algebras,
\(HH^n_{\mathcal C}(A,A)=0\) for every n≥1. For Fibonacci, exactness
forces ranks d₁,d₂,d₃,d₄ to be 1,1,2,3 from the stated cochain dimensions.
In particular H³=0 is proved by contraction, not estimated by matrix rank.

## 5. What this solves, and what remains

This supplies categorical binary associativity primitives and formal
rigidity modulo unit-preserving invertible categorical coordinate changes.
Those changes need not preserve a fixed Gram form, so this is not a
classification of metric-preserving or dagger-preserving deformations.
It does not establish acyclicity of the full mixed or geometric complex.

The vanishing categorical derivations do **not** imply vanishing dynamics
on the microscopic observable algebra End_C(A^⊗L). Fusion already gives,
at L=2, End(A²)≅M₂⊕M₂ in Vec_Z2 and M₂⊕M₃ in Fibonacci. These ordinary
matrix algebras admit nonzero inner derivations [K,·] for noncentral K.
They are different objects from categorical derivations of (A,m).
No choice of local Hamiltonian or stress generator has been made by this
cohomology calculation. Descendant carriers, internal conformal response,
positive energy, standard KS matching, OAR convergence and category fidelity
remain additional reconstruction problems.
