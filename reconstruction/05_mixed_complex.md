# A mixed complex for product and coordinate-action deformations

**Status: derived algebraic fragment, proposed reconstruction diagnostic.**
This note couples the associative sewing fragment to an already specified
Lie action by derivations. It does not solve internal stress implementation,
geometric sewing with changing coordinates, positivity or continuum limits.
Its conventions are registered in `CONVENTIONS.md` (ae),(ag).
The parameter t is formal, not lattice spacing.

**Sources and dependencies.** The proofs below are local algebraic
derivations from the product, Leibniz and Lie-action equations.
`references/cft/Schottenloher2008/Schottenloher2008.md:2409–2422` fixes the
Leibniz and commutator notions; `:2200–2285` supplies the distinct central
extension problem. The innerness and projective-anomaly distinctions are
in `reconstruction/02_obstructions.md`. No cited source is asserted to
establish the entire mixed complex. Symbolic cross-checks are assigned to
`scripts/python/test_local_conformal_identities.py`; consult its run record
for their execution status.

## 1. The specified algebraic problem

**ASSUME:** a real Lie algebra g; a unital complex associative algebra B
with product μ; and a real-linear Lie action δ:g→Der(B) by complex-linear
maps. Thus
\[
 \delta_v(ab)=\delta_v(a)b+a\delta_v(b),\qquad
 [\delta_v,\delta_w]=\delta_{[v,w]}.
\]
All expressions are algebraic. Operator realizations require a common
invariant domain; completing this complex continuously requires additional
specified topologies. No boundedness or *-preservation theorem is inferred.

Define, for p≥0 and q≥1,
\[
 C^{p,q}=\operatorname{Alt}_{\mathbb R}^{p}
   (\mathfrak g,\operatorname{Hom}_{\mathbb C}(B^{\otimes q},B)).
\]
Fix units by using cochains that vanish when any B-input is 1. In particular,
ξ(1)=0 and ψ_v(1)=0. Because δ_v(1)=0, both differentials below preserve
this normalization. Omitting q=0 is deliberate: there is no additional
inner-generator column in this particular problem.

For a q-cochain f define the Hochschild differential b=d_HH by
\[
 \begin{split}
 (bf)(a_1,\ldots,a_{q+1})={}&a_1f(a_2,\ldots,a_{q+1})\\
 &+\sum_{j=1}^{q}(-1)^j
 f(a_1,\ldots,a_ja_{j+1},\ldots,a_{q+1})\\
 &+(-1)^{q+1}f(a_1,\ldots,a_q)a_{q+1}.
 \end{split}
\]
It acts pointwise on the g-inputs. The coefficient action is
\[
 (\mathcal L_vf)(a_1,\ldots,a_q)
 =\delta_v(f(a_1,\ldots,a_q))
   -\sum_jf(a_1,\ldots,\delta_va_j,\ldots,a_q).
\]

The CE differential d=d_CE is fixed explicitly by
\[
 \begin{split}
 (dF)(v_0,\ldots,v_p)={}&\sum_i(-1)^i\mathcal L_{v_i}
 F(v_0,\ldots,\widehat v_i,\ldots,v_p)\\
 &+\sum_{i<j}(-1)^{i+j}
 F([v_i,v_j],v_0,\ldots,\widehat v_i,\ldots,\widehat v_j,\ldots,v_p).
 \end{split}
\]
In the second sum the bracket occupies the first slot; the remaining
arguments retain their original order. In particular,
\((d\psi)(v,w)=\mathcal L_v\psi_w-\mathcal L_w\psi_v-\psi_{[v,w]}\).

## 2. Why these differentials form a complex

**Proposition 1 [derived].** **ASSUME:** the setting of §1.
**PROVE:** \([\mathcal L_v,\mathcal L_w]=\mathcal L_{[v,w]}\),
\([\mathcal L_v,b]=0\), and on total degree p+q,
\[
 D|_{C^{p,q}}=d+(-1)^p b,\qquad D^2=0.
\]

- ⟨1⟩1. Split \(\mathcal L_v\) into output composition with δ_v and
  the negative sum of input compositions. Output and input compositions
  commute with each other. On any input slot, reversal of the order under
  precomposition gives the negative commutator; different slots commute.
  Hence their combined commutator is output δ_[v,w] minus all input
  δ_[v,w]. **BY:** \([\delta_v,\delta_w]=\delta_{[v,w]}\).
- ⟨1⟩2. Apply \(\mathcal L_v\) to each term of bf. At every multiplied
  adjacent pair, Leibniz splits δ_v(a_ja_{j+1}) into its two input terms.
  At the two outer multiplication terms, the same splitting cancels the
  action on the outer factor, leaving the action on f. The terms left are
  exactly \(b\mathcal L_vf\). **BY:** the displayed b and Leibniz.
- ⟨1⟩3. \(b^2=0\): expanding produces each pair of distinct multiplications
  twice with opposite signs. Overlapping multiplications agree by
  associativity; the endpoint cases use the left/right B-module laws.
  **BY:** associativity of μ and the explicit signs in b.
- ⟨1⟩4. \(d^2=0\): in the expansion, two coefficient actions combine to
  \([\mathcal L_v,\mathcal L_w]-\mathcal L_{[v,w]}\); terms involving
  three Lie inputs combine to Jacobi. Both vanish.
  **BY:** ⟨1⟩1 and Jacobi in g.
- ⟨1⟩5. \(db=bd\): coefficient-action terms commute by ⟨1⟩2, and
  bracket-input terms commute because b acts only on B-inputs.
- ⟨1⟩6. For F∈C^{p,q},
  \(D^2F=d^2F+(-1)^pdbF+(-1)^{p+1}bdF+b^2F=0\).
  **BY:** ⟨1⟩3–5. **QED.**

The truncated total degree-one space is C^{0,1}; total degree two is
C^{0,2}⊕C^{1,1}. No implicit C^{1,0} or C^{2,0} data are being included.

## 3. Simultaneous first-order equations and gauge

**Proposition 2 [derived].** **ASSUME:** §1 and formal deformations
\(\mu_t=\mu+t\phi\), \(\delta_{t,v}=\delta_v+t\psi_v\), considered
modulo t², with normalized φ∈C^{0,2} and ψ∈C^{1,1}.
**PROVE:** associativity, the derivation rule and the Lie-action equation
hold modulo t² iff
\[
 b\phi=0,\qquad \mathcal L_v\phi=b\psi_v,\qquad d\psi=0,
 \quad\text{equivalently}\quad D(\phi+\psi)=0.
\]

- ⟨1⟩1. The coefficient of t in
  \(\mu_t(\mu_t(a,b),c)-\mu_t(a,\mu_t(b,c))\) is
  \(\phi(ab,c)+\phi(a,b)c-\phi(a,bc)-a\phi(b,c)=-b\phi(a,b,c)\).
  **BY:** expansion of the associator with its specified orientation.
- ⟨1⟩2. The coefficient of t in the derivation residual
  \(\delta_{t,v}\mu_t(a,b)-\mu_t(\delta_{t,v}a,b)
     -\mu_t(a,\delta_{t,v}b)\) is
  \(\mathcal L_v\phi(a,b)-(b\psi_v)(a,b)\).
  **BY:** product expansion and the definitions in §1.
- ⟨1⟩3. The coefficient of t in
  \([\delta_{t,v},\delta_{t,w}]-\delta_{t,[v,w]}\) is
  \([\delta_v,\psi_w]-[\delta_w,\psi_v]-\psi_{[v,w]}=d\psi(v,w)\).
  **BY:** the q=1 coefficient action.
- ⟨1⟩4. The three bidegrees of D(φ+ψ) are
  \(b\phi\in C^{0,3}\), \(d\phi-b\psi\in C^{1,2}\), and
  \(d\psi\in C^{2,1}\). Their separate vanishing is exactly ⟨1⟩1–3.
  **BY:** the total differential. **QED.**

**Proposition 3 [derived].** **ASSUME:** Proposition 2 and a formal change
of coordinates \(g_t=1+t\xi\), ξ∈C^{0,1}. Transport by
\[
 \mu'_t(a,b)=g_t^{-1}\mu_t(g_ta,g_tb),\qquad
 \delta'_{t,v}=g_t^{-1}\delta_{t,v}g_t.
\]
**PROVE:** \(\phi'=\phi+b\xi\), \(\psi'=\psi+d\xi\).

- ⟨1⟩1. Using \(g_t^{-1}=1-t\xi\pmod{t^2}\), the product correction is
  \(\phi(a,b)+\xi(a)b+a\xi(b)-\xi(ab)=\phi+b\xi\).
- ⟨1⟩2. The action correction is
  \(\psi_v+\delta_v\xi-\xi\delta_v=\psi_v+\mathcal L_v\xi\).
- ⟨1⟩3. Together these give \((\phi+\psi)'=\phi+\psi+D\xi\).
  **BY:** ⟨1⟩1–2. Its cocycle condition is preserved by Proposition 1.
  **QED.**

Thus H² of this **specified truncated total complex** parametrizes the
first-order pairs modulo these infinitesimal coordinate changes. This is
an actual coupled tangent problem: separate product/action complexes would
miss the mixed equation \(\mathcal L_v\phi=b\psi_v\).

**Boundary.** No A(v) occurs here: δ remains an external derivation action
until the innerness equation of note 02 is solved. The complex does not
include changing cell domains, anomaly-line identifications or all geometric
sewing operations. It does not prove positive Hilbert completion, local
stress affiliation, a standard-KS realization or OAR convergence. Its degree
three alone is not a theorem that every nonlinear reconstruction obstruction
lies in H³: that requires the full nonlinear equations and their identified
higher compatibility operations.
