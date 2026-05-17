# Handoff document: categorical Fock spaces, fine graining, RG amplitudes, and scaling operators

This document is for a coding/formalisation agent with access to Lean, Julia, and Wolframscript. Its purpose is to turn the current project discussion into a precise list of definitions, theorem targets, computational checks, and conjectures.

All theorem-like statements below should be treated as **unproven targets** unless explicitly marked as a definition. The agent’s task is to formalise them, test them computationally, and prove them where possible.

---

## 0. External mathematical facts used

The project uses the following stable background facts.

The Fibonacci fusion category has two simple objects, usually denoted (\mathbf 1) and (\tau), with

[
\tau\otimes\tau \cong \mathbf 1\oplus \tau,
]

and quantum dimension

[
d_\tau=\varphi=\frac{1+\sqrt5}{2}.
]

A standard Fibonacci (F)-matrix is

[
F^{\tau\tau\tau}_{\tau}
=======================

\begin{pmatrix}
\varphi^{-1} & \varphi^{-1/2}\
\varphi^{-1/2} & -\varphi^{-1}
\end{pmatrix}.
]

These facts are standard in the Fibonacci anyon literature. ([THP][1])

For a chiral CFT realisation of Fibonacci-type data, one may use the spin-(1) sector of (\mathrm{SU}(2)_3), where the spin-(1) primary has conformal weight

[
h_\tau=\frac25.
]

Equivalently, Fibonacci-type topological order appears in level-one (G_2) WZW-type constructions; the (h=2/5) datum is part of this standard correspondence. ([BIMSA][2])

For Temperley–Lieb/Jones-type categories at roots of unity, one works with semisimple quotients or reduced categories. The Jones–Wenzl quotient and associated fusion-category interpretation are standard. ([arXiv][3])

For topological fixed-point string-net intuition, the local data are (F)-symbols and quantum dimensions, with fixed-point wavefunctions determined by local relations. ([arXiv][4])

---

# 1. Core categorical setup

## 1.1 Fusion-category input

Work over (\mathbb C).

A **unitary fusion category** (\mathcal C) should be treated, initially, as the following data:

1. A finite set of simple labels

[
\operatorname{Irr}(\mathcal C).
]

2. A distinguished unit/simple vacuum object

[
\mathbf 1\in \operatorname{Irr}(\mathcal C).
]

3. Fusion multiplicities

[
N_{ab}^{c}\in \mathbb N.
]

4. Finite-dimensional Hom spaces

[
\operatorname{Hom}_{\mathcal C}(X,Y).
]

5. A dagger operation

[
(-)^\dagger:\operatorname{Hom}(X,Y)\to\operatorname{Hom}(Y,X)
]

compatible with tensor product and composition.

6. Direct sums/biproducts.

7. Tensor product, associators, unitors, and, optionally, braiding.

For Lean, it may be too ambitious to begin with the full category-theoretic structure. A practical first formalisation can use a **skeletal finite semisimple model**: objects are finite formal sums of simple labels, and morphism spaces are finite-dimensional complex vector spaces assembled from fusion multiplicities and (F)-symbols.

---

## 1.2 The local occupation object

Define

[
Q:=\bigoplus_{a\in \operatorname{Irr}(\mathcal C)} a.
]

Interpretation:

[
Q=\text{“one site may be empty or may contain one simple anyon.”}
]

The vacuum (\mathbf 1\subset Q) means “empty site.”

For (N) ordered sites, define

[
Q^{\otimes N}:=
\underbrace{Q\otimes\cdots\otimes Q}_{N\text{ factors}}.
]

The order of tensor factors matters. Without braiding, no canonical exchange operation exists.

---

# 2. Indefinite-particle Hilbert spaces

## 2.1 Definition

For total charge (W\in \operatorname{Irr}(\mathcal C)), define

[
\mathcal H_N^W
:=
\operatorname{Hom}_{\mathcal C}(W,Q^{\otimes N}).
]

This is the (N)-site, indefinite-particle-number Hilbert space in total-charge sector (W).

If (\mathcal C) is merely fusion, this is a finite-dimensional vector space. If (\mathcal C) is unitary fusion, it is a Hilbert space.

---

## 2.2 Configuration-space expansion

Let

[
\vec a=(a_1,\dots,a_N)\in \operatorname{Irr}(\mathcal C)^N.
]

Define

[
A_{\vec a}:=a_1\otimes\cdots\otimes a_N.
]

Because

[
Q^{\otimes N}
\cong
\bigoplus_{\vec a\in \operatorname{Irr}(\mathcal C)^N}
A_{\vec a},
]

there should be a canonical isomorphism

[
\operatorname{Hom}(W,Q^{\otimes N})
\cong
\bigoplus_{\vec a\in \operatorname{Irr}(\mathcal C)^N}
\operatorname{Hom}(W,A_{\vec a}).
]

### Theorem target 2.2.1

Formalise and prove:

[
\boxed{
\mathcal H_N^W
\cong
\bigoplus_{(a_1,\dots,a_N)}
\operatorname{Hom}(W,a_1\otimes\cdots\otimes a_N).
}
]

If the category is unitary and the direct-sum inclusions are chosen as isometries, this isomorphism is unitary.

---

## 2.3 Particle number

A tuple

[
(a_1,\dots,a_N)
]

has particle number

[
#{i:a_i\neq \mathbf 1}.
]

Thus

[
\mathcal H_N^W
]

contains sectors with particle number

[
0,1,\dots,N.
]

This is the categorical analogue of a Fock space, except the fibre over a configuration is a fusion Hom space, not a tensor product of one-particle Hilbert spaces.

---

# 3. Braiding and exchange

## 3.1 Non-braided case

If (\mathcal C) is only a fusion category, (Q^{\otimes N}) is an ordered object. The construction still makes sense, but no canonical exchange of neighbouring sites exists.

Fine-graining maps in a non-braided category should therefore be order-preserving unless the construction avoids crossings entirely.

---

## 3.2 Braided case

If (\mathcal C) is braided, with braiding

[
c_{X,Y}:X\otimes Y\to Y\otimes X,
]

then

[
c_{Q,Q}:Q\otimes Q\to Q\otimes Q
]

defines neighbouring exchange maps

[
B_i
===

\operatorname{id}*Q^{\otimes(i-1)}
\otimes c*{Q,Q}
\otimes
\operatorname{id}_Q^{\otimes(N-i-1)}.
]

### Theorem target 3.2.1

Prove that the (B_i) satisfy braid relations:

[
B_iB_{i+1}B_i=B_{i+1}B_iB_{i+1},
]

[
B_iB_j=B_jB_i
\qquad |i-j|\geq 2.
]

Therefore (Q^{\otimes N}), and hence

[
\operatorname{Hom}(W,Q^{\otimes N}),
]

carries a representation of the braid group (B_N).

---

# 4. Fine-graining maps

## 4.1 Global definition

For (M>N), a fine-graining map should be a categorical isometry

[
E_{N\to M}:Q^{\otimes N}\to Q^{\otimes M}
]

satisfying

[
\boxed{
E_{N\to M}^\dagger E_{N\to M}
=============================

\operatorname{id}_{Q^{\otimes N}}.
}
]

The induced Hilbert-space map in total-charge sector (W) is

[
V_{N\to M}^W:
\operatorname{Hom}(W,Q^{\otimes N})
\to
\operatorname{Hom}(W,Q^{\otimes M})
]

defined by

[
V_{N\to M}^W(f)
===============

E_{N\to M}\circ f.
]

### Theorem target 4.1.1

If

[
E^\dagger E=\operatorname{id},
]

then

[
V^W
]

is an isometry for every (W).

Conversely, if (V^W) is an isometry for all simple (W), then

[
E^\dagger E=\operatorname{id}
]

under a semisimplicity/separating-Hom assumption.

---

## 4.2 Component form

Using

[
Q^{\otimes N}\cong \bigoplus_{\vec a}A_{\vec a},
\qquad
Q^{\otimes M}\cong \bigoplus_{\vec b}B_{\vec b},
]

define components

[
E_{\vec b,\vec a}
:=
\pi_{\vec b}E\iota_{\vec a}
\in
\operatorname{Hom}(A_{\vec a},B_{\vec b}).
]

### Theorem target 4.2.1

The isometry condition is equivalent to

[
\boxed{
\sum_{\vec b}
E_{\vec b,\vec a}^{\dagger}E_{\vec b,\vec a'}
=============================================

\delta_{\vec a,\vec a'}\operatorname{id}*{A*{\vec a}}.
}
]

This is the categorical orthogonality and normalisation condition on fine-graining amplitudes.

---

## 4.3 Physical interpretation of components

A component

[
E_{\vec b,\vec a}
\in
\operatorname{Hom}(a_1\otimes\cdots\otimes a_N,
b_1\otimes\cdots\otimes b_M)
]

is nonzero only if the fine configuration (\vec b) has total charge compatible with the coarse configuration (\vec a).

This allows:

1. ordinary interpolation of a particle from coarse site (i) to a fine spatial distribution;
2. vacuum pair production;
3. particle splitting;
4. short-distance fusion/collision;
5. virtual neutral dressing clouds.

---

# 5. Local block fine graining

## 5.1 Arbitrary (M>N)

Do **not** restrict to (M=2N).

Choose an ordered partition

[
{1,\dots,M}
===========

B_1\sqcup\cdots\sqcup B_N
]

with

[
|B_i|=r_i,\qquad r_i\geq 1,
\qquad
\sum_i r_i=M.
]

Choose local isometries

[
\eta_i:Q\to Q^{\otimes r_i}.
]

Define

[
E_{N\to M}^{\mathrm{block}}
===========================

\eta_1\otimes\cdots\otimes\eta_N.
]

### Theorem target 5.1.1

If

[
\eta_i^\dagger\eta_i=\operatorname{id}_Q
]

for all (i), then

[
(E_{N\to M}^{\mathrm{block}})^\dagger
E_{N\to M}^{\mathrm{block}}
===========================

\operatorname{id}_{Q^{\otimes N}}.
]

---

## 5.2 Dressing unitary

More generally,

[
E_{N\to M}
==========

U_M(\eta_1\otimes\cdots\otimes\eta_N),
]

where

[
U_M:Q^{\otimes M}\to Q^{\otimes M}
]

is unitary.

### Theorem target 5.2.1

If each (\eta_i) is isometric and (U_M) is unitary, then (E_{N\to M}) is isometric.

Interpretation:

[
\boxed{
\text{local categorical splitting}
+
\text{fine-scale RG dressing unitary}.
}
]

---

# 6. RG blocking and canonical fine graining

## 6.1 Blocking map

The natural RG object is a coarse-graining or blocking map

[
B_{N\leftarrow M}:Q^{\otimes M}\to Q^{\otimes N}.
]

For a local (r)-site block,

[
B^{(r)}:Q^{\otimes r}\to Q.
]

If the retained coarse subspace is fixed, then the canonical isometric section is

[
\boxed{
E_{N\to M}
==========

B_{N\leftarrow M}^{\dagger}
\left(
B_{N\leftarrow M}B_{N\leftarrow M}^{\dagger}
\right)^{-1/2}.
}
]

This requires

[
B_{N\leftarrow M}B_{N\leftarrow M}^{\dagger}
]

to be positive and invertible on the retained coarse subspace.

### Theorem target 6.1.1

For finite-dimensional Hilbert spaces, prove:

If (B:H_{\mathrm{fine}}\to H_{\mathrm{coarse}}) has full rank onto (H_{\mathrm{coarse}}), then

[
E:=B^\dagger(BB^\dagger)^{-1/2}
]

satisfies

[
E^\dagger E=\operatorname{id}*{H*{\mathrm{coarse}}}.
]

This is the polar-decomposition fine-graining map.

---

## 6.2 Amplitude formula

Choose orthonormal coarse and fine bases. Write

[
B|\nu\rangle_{\mathrm{fine}}
============================

\sum_{\mu}
\beta_{\mu\nu}|\mu\rangle_{\mathrm{coarse}}.
]

Define

[
G_{\mu\mu'}
:=
(BB^\dagger)_{\mu\mu'}
======================

\sum_\nu
\beta_{\mu\nu}\overline{\beta_{\mu'\nu}}.
]

Then

[
E|\mu\rangle
============

\sum_\nu
A_{\nu\mu}|\nu\rangle
]

with

[
\boxed{
A_{\nu\mu}
==========

\sum_{\mu'}
\overline{\beta_{\mu'\nu}}
,
G^{-1/2}_{\mu'\mu}.
}
]

### Theorem target 6.2.1

Prove the matrix amplitude formula above from the polar-decomposition definition.

### No-mixing corollary target

If the coarse label (\mu) does not mix with other coarse labels, then

[
\boxed{
A_\nu^\mu
=========

\frac{
\overline{\beta_{\mu\nu}}
}{
\sqrt{\sum_{\nu'}|\beta_{\mu\nu'}|^2}
}.
}
]

---

# 7. CFT/RG input

## 7.1 Blocking coefficients from OPE data

Let (b>1) be an RG scale factor and

[
\rho=b^{-1}
]

a dimensionless fine separation in coarse units.

For chiral CFT data, a leading OPE/blocking coefficient has the schematic form

[
\beta^a_{b_1\cdots b_r}(\rho)
\sim
\Gamma^a_{b_1\cdots b_r}
,
\rho^{h_a-\sum_i h_{b_i}}.
]

For nonchiral data, replace conformal weights (h) by scaling dimensions

[
\Delta=h+\bar h.
]

The constants

[
\Gamma^a_{b_1\cdots b_r}
]

include:

1. OPE coefficients;
2. field normalisations;
3. wavefunction renormalisations;
4. blocking-kernel data;
5. regulator/counterterm data;
6. descendant and irrelevant-operator mixing.

### Important modelling decision

In formalisation, do **not** pretend that CFT scaling dimensions alone determine finite-scale amplitudes.

Treat

[
\beta_{\mu\nu}(\rho)
]

as RG input data, with CFT imposing constraints such as powers of (\rho), selection rules, and possibly known OPE coefficients.

---

## 7.2 Scaling operators

A full operator RG channel at scale factor (b) has scaling operators

[
\mathcal O_i
]

satisfying

[
\boxed{
\mathsf A_b(\mathcal O_i)=\lambda_i\mathcal O_i
}
]

with

[
\boxed{
\lambda_i=b^{-\Delta_i}
}
]

in a nonchiral theory, or

[
\lambda_i=b^{-h_i}
]

in a chiral theory.

### Critical warning

The **charge-only** categorical fine-graining map generally does **not** recover the CFT scaling spectrum. To recover scaling operators, the formalisation must enlarge labels from topological charge alone to something like

[
\mu=(a,\mathcal O,n),
]

where

[
a
]

is a topological sector,

[
\mathcal O
]

is a CFT primary or scaling operator, and

[
n
]

encodes descendant or mixing data.

---

# 8. Operator channels induced by fine graining

Let

[
E:Q^{\otimes N}\to Q^{\otimes M}
]

be an isometry.

## 8.1 State embedding

On total-charge sector (W),

[
V^W(f)=Ef.
]

The state embedding is

[
\rho_N\mapsto V^W\rho_N(V^W)^\dagger.
]

---

## 8.2 Ascending observable channel

For a fine observable (O_M), define

[
\boxed{
\mathsf A_{M\to N}^W(O_M)
=========================

(V^W)^\dagger O_M V^W.
}
]

Categorically, if

[
T_M\in \operatorname{End}(Q^{\otimes M}),
]

then

[
\boxed{
T_N
===

E^\dagger T_M E
\in \operatorname{End}(Q^{\otimes N}).
}
]

### Theorem target 8.2.1

Prove that (\mathsf A) is:

1. unital:

[
\mathsf A(\mathbf 1_M)=\mathbf 1_N;
]

2. completely positive;

3. (*)-preserving;

4. expectation-value preserving against embedded states.

---

## 8.3 Logical lift

For a coarse observable (O_N), define its canonical fine representative

[
\boxed{
\mathsf L_{N\to M}(O_N)
=======================

V O_N V^\dagger.
}
]

This satisfies

[
V^\dagger \mathsf L(O_N)V=O_N.
]

But

[
\mathsf L(\mathbf 1_N)=VV^\dagger,
]

the projector onto the code subspace, not the full fine identity.

---

# 9. Fibonacci worked specification

This is the simplest concrete category to implement first.

## 9.1 Exact algebraic constants

Use the exact field

[
\mathbb Q(\sqrt5).
]

Define

[
\varphi:=\frac{1+\sqrt5}{2}.
]

Useful identities:

[
\varphi^2=\varphi+1,
]

[
\varphi^{-1}=\varphi-1,
]

[
\varphi^{-2}=2-\varphi.
]

Quantum dimensions:

[
d_{\mathbf 1}=1,
\qquad
d_\tau=\varphi.
]

Total quantum dimension:

[
D:=\sqrt{1+\varphi^2}.
]

Since

[
1+\varphi^2=2+\varphi,
]

we have

[
D^2=2+\varphi.
]

---

## 9.2 Fusion rules

[
\mathbf 1\otimes\mathbf 1=\mathbf 1,
]

[
\mathbf 1\otimes\tau=\tau,
]

[
\tau\otimes\mathbf 1=\tau,
]

[
\tau\otimes\tau=\mathbf 1\oplus\tau.
]

Multiplicity-free.

---

## 9.3 (F)-matrix

The only nontrivial (F)-move needed initially is

[
F^{\tau\tau\tau}_{\tau}
=======================

\begin{pmatrix}
\varphi^{-1} & \varphi^{-1/2}\
\varphi^{-1/2} & -\varphi^{-1}
\end{pmatrix}.
]

### Theorem target 9.3.1

Prove exactly:

[
F^\dagger F=I.
]

Since the entries are real, this is

[
F^T F=I.
]

Also prove:

[
F^2=I.
]

This is easy with

[
\varphi^{-2}+\varphi^{-1}=1.
]

---

## 9.4 General binary fine graining

Let

[
\eta:Q\to Q\otimes Q
]

with

[
Q=\mathbf 1\oplus\tau.
]

Write

[
\eta_{\mathbf 1}
================

x,v^{\mathbf 1}*{\mathbf 1\mathbf 1}
+
y,v^{\mathbf 1}*{\tau\tau},
]

and

[
\eta_\tau
=========

p,v^\tau_{\tau\mathbf 1}
+
q,v^\tau_{\mathbf 1\tau}
+
r,v^\tau_{\tau\tau}.
]

Here (v^a_{bc}:a\to b\otimes c) is the unique normalised fusion-tree basis morphism whenever (N_{bc}^a=1).

### Theorem target 9.4.1

The isometry condition

[
\eta^\dagger\eta=\operatorname{id}_Q
]

is equivalent to

[
|x|^2+|y|^2=1,
]

[
|p|^2+|q|^2+|r|^2=1.
]

No cross-condition exists between the (\mathbf 1) and (\tau) sectors because

[
\operatorname{Hom}(\mathbf 1,\tau)=0.
]

---

## 9.5 Topological Perron–Frobenius amplitudes

A natural topological one-step choice is

[
A^a_{bc}
========

\sqrt{
\frac{d_b d_c}{d_aD^2}
}
]

for allowed channels.

For Fibonacci this gives:

[
\boxed{
\eta_{\mathbf 1}^{\mathrm{PF}}
==============================

\frac1D,v^{\mathbf 1}*{\mathbf 1\mathbf 1}
+
\frac{\varphi}{D},v^{\mathbf 1}*{\tau\tau}.
}
]

For the (\tau) sector:

[
\boxed{
\eta_\tau^{\mathrm{PF}}
=======================

\frac1D,v^\tau_{\tau\mathbf 1}
+
\frac1D,v^\tau_{\mathbf 1\tau}
+
\frac{\sqrt\varphi}{D},v^\tau_{\tau\tau}.
}
]

### Theorem target 9.5.1

Prove that (\eta^{\mathrm{PF}}) is isometric.

Explicitly:

[
\frac{1}{D^2}+\frac{\varphi^2}{D^2}=1,
]

and

[
\frac1{D^2}+\frac1{D^2}+\frac{\varphi}{D^2}=1.
]

### Numerical probabilities

Vacuum:

[
P(\mathbf 1\to\mathbf 1\mathbf 1)=\frac1{D^2},
]

[
P(\mathbf 1\to\tau\tau)=\frac{\varphi^2}{D^2}.
]

Tau:

[
P(\tau\to\tau\mathbf 1)=\frac1{D^2},
]

[
P(\tau\to\mathbf 1\tau)=\frac1{D^2},
]

[
P(\tau\to\tau\tau)=\frac{\varphi}{D^2}.
]

---

## 9.6 Strict binary-composition candidate

Impose a stronger condition:

[
(\eta\otimes\operatorname{id})\eta
==================================

\alpha\circ(\operatorname{id}\otimes\eta)\eta,
]

where (\alpha) is the associator.

In strict notation:

[
(\eta\otimes\operatorname{id})\eta
==================================

(\operatorname{id}\otimes\eta)\eta.
]

Using the Fibonacci (F)-move to compare parenthesisations, the positive real solution found by hand is:

[
\boxed{
\eta_{\mathbf 1}^{\mathrm{coassoc}}
===================================

\varphi^{-1}v^{\mathbf 1}*{\mathbf 1\mathbf 1}
+
\varphi^{-1/2}v^{\mathbf 1}*{\tau\tau},
}
]

[
\boxed{
\eta_\tau^{\mathrm{coassoc}}
============================

\varphi^{-1}v^\tau_{\tau\mathbf 1}
+
\varphi^{-1}v^\tau_{\mathbf 1\tau}
+
\varphi^{-3/2}v^\tau_{\tau\tau}.
}
]

### Derivation sketch to formalise

Assume

[
x,y,p,q,r>0.
]

The channels involving (\mathbf 1) force

[
p=x,
\qquad
q=x.
]

The nontrivial (\tau\to\tau\tau\tau) comparison gives

[
\begin{pmatrix}
xy\
r^2
\end{pmatrix}
=============

F^{\tau\tau\tau}_{\tau}
\begin{pmatrix}
xy\
r^2
\end{pmatrix}.
]

Equivalently,

[
r^2=\varphi^{-3/2}xy.
]

Together with isometry,

[
x^2+y^2=1,
]

[
2x^2+r^2=1,
]

the positive solution should be

[
x=\varphi^{-1},
\qquad
y=\varphi^{-1/2},
\qquad
r=\varphi^{-3/2}.
]

### Theorem target 9.6.1

Formalise and prove the above claim.

### Important caveat

This is not necessarily the same as the PF topological one-step map. The PF map is natural from quantum dimensions/string-net fixed-point weighting. The coassociative map is natural from exact binary subdivision. The project should keep these distinct.

---

## 9.7 Fibonacci RG/CFT amplitudes

Use chiral Fibonacci CFT data with

[
h_{\mathbf 1}=0,
\qquad
h_\tau=\frac25.
]

Let

[
\rho=b^{-1}.
]

The allowed local blocking coefficients are:

[
\beta^{\mathbf 1}_{\mathbf 1\mathbf 1}=u_0,
]

[
\beta^{\mathbf 1}_{\tau\tau}
============================

u_I\rho^{-4/5},
]

[
\beta^\tau_{\tau\mathbf 1}=j_L,
]

[
\beta^\tau_{\mathbf 1\tau}=j_R,
]

[
\beta^\tau_{\tau\tau}
=====================

u_\tau\rho^{-2/5}.
]

Explanation of exponents:

[
h_{\mathbf 1}-2h_\tau
=====================

-\frac45,
]

[
h_\tau-2h_\tau
==============

-\frac25.
]

The constants

[
u_0,u_I,j_L,j_R,u_\tau
]

are Wilsonian RG data.

The resulting canonical isometric fine graining is:

[
\boxed{
\eta_{\mathbf 1}^{\mathrm{RG}}(\rho)
====================================

\frac{
\overline{u_0},v^{\mathbf 1}*{\mathbf 1\mathbf 1}
+
\overline{u_I}\rho^{-4/5}v^{\mathbf 1}*{\tau\tau}
}{
\sqrt{|u_0|^2+|u_I|^2\rho^{-8/5}}
}.
}
]

[
\boxed{
\eta_\tau^{\mathrm{RG}}(\rho)
=============================

\frac{
\overline{j_L},v^\tau_{\tau\mathbf 1}
+
\overline{j_R},v^\tau_{\mathbf 1\tau}
+
\overline{u_\tau}\rho^{-2/5}v^\tau_{\tau\tau}
}{
\sqrt{|j_L|^2+|j_R|^2+|u_\tau|^2\rho^{-4/5}}
}.
}
]

### Theorem target 9.7.1

Assuming the (\beta)-coefficients above, derive these amplitudes from

[
E=B^\dagger(BB^\dagger)^{-1/2}.
]

### Computational experiment 9.7.A

In Julia, allow symbolic or high-precision values for

[
u_0,u_I,j_L,j_R,u_\tau,\rho.
]

Check:

[
\eta_{\mathbf 1}^\dagger\eta_{\mathbf 1}=1,
]

[
\eta_\tau^\dagger\eta_\tau=1.
]

Plot probabilities versus (b) or (\rho), e.g.

[
P(\tau\to\tau\tau)
==================

\frac{|u_\tau|^2\rho^{-4/5}}
{|j_L|^2+|j_R|^2+|u_\tau|^2\rho^{-4/5}}.
]

---

## 9.8 Fibonacci scaling operators

For the chiral Fibonacci CFT:

[
\mathcal O_{\mathbf 1}=\mathbf 1,
\qquad
h_{\mathbf 1}=0,
\qquad
\lambda_{\mathbf 1}=1.
]

[
\mathcal O_\tau=\Phi_\tau,
\qquad
h_\tau=\frac25,
\qquad
\lambda_\tau=b^{-2/5}.
]

Descendants have

[
\lambda_{\tau,n}=b^{-(2/5+n)}.
]

Vacuum descendants have

[
\lambda_{\mathbf 1,n}=b^{-n}.
]

For a diagonal nonchiral theory, replace

[
h_\tau=\frac25
]

by

[
\Delta_\tau=\frac45.
]

Then

[
\lambda_\tau=b^{-4/5}.
]

### Theorem target 9.8.1

If the full operator RG matrix is diagonal in the CFT scaling basis with entries

[
b^{-h_i}
]

or

[
b^{-\Delta_i},
]

then the ascending channel has the corresponding scaling eigenoperators and eigenvalues.

### Warning to formalise as a negative example

The charge-only two-dimensional operator space

[
\operatorname{End}(Q)
]

does not recover the full CFT scaling spectrum. A one-site charge projector contrast generally has eigenvalue determined by the chosen categorical fine-graining amplitudes, not by (b^{-2/5}).

---

# 10. Temperley–Lieb / Ising note

This part is secondary but useful for cross-checks.

For (\mathsf{TL}_2), or Ising-type fusion rules, use simple labels

[
\mathbf 1,\sigma,\epsilon
]

with

[
\sigma\otimes\sigma=\mathbf 1\oplus\epsilon,
]

[
\sigma\otimes\epsilon=\sigma,
]

[
\epsilon\otimes\epsilon=\mathbf 1.
]

A binary refinement of (\epsilon) has channels

[
\epsilon\to\epsilon\otimes\mathbf 1,
]

[
\epsilon\to\mathbf 1\otimes\epsilon,
]

[
\epsilon\to\sigma\otimes\sigma
\quad\text{in the }\epsilon\text{ channel}.
]

Using nonchiral Ising CFT data

[
\Delta_\sigma=\frac18,
\qquad
\Delta_\epsilon=1,
]

the OPE exponent for

[
\sigma\sigma\to\epsilon
]

is

[
\Delta_\epsilon-2\Delta_\sigma
==============================

\frac34.
]

With symmetric interpolation and minimal normalisation, the toy refinement is

[
\eta_\epsilon(\rho)
===================

\frac{
\frac1{\sqrt2}v_\epsilon^{\epsilon,\mathbf 1}
+
\frac1{\sqrt2}v_\epsilon^{\mathbf 1,\epsilon}
+
\frac12\rho^{3/4}v_\epsilon^{\sigma,\sigma;\epsilon}
}{
\sqrt{1+\frac14\rho^{3/2}}
}.
]

This toy map tests OPE-level amplitude scaling, not the full Ising scaling spectrum.

---

# 11. Direct-limit continuum structure

For a sequence or directed system of refinements, require:

[
E_{N\to N}=\operatorname{id},
]

[
E_{M\to L}E_{N\to M}=E_{N\to L}.
]

Then define a continuum Hilbert space as a completed direct limit:

[
\mathcal H_\infty^W
===================

\overline{\varinjlim_N \mathcal H_N^W}.
]

### Conjecture 11.1

A physically correct continuum fine-graining scheme should be a coherent family

[
\eta^{(r)}:Q\to Q^{\otimes r},
\qquad r=1,2,3,\dots,
]

compatible with arbitrary ordered subdivisions.

This likely has an operadic or (A_\infty)-coalgebra flavour, possibly up to local RG dressing unitaries.

### Conjecture 11.2

For topological fixed points, the coherent family can be expressed purely using (F)-symbols, quantum dimensions, and local string-net/Pachner identities.

### Conjecture 11.3

Away from topological fixed points, the coherent family is determined by the full Wilsonian RG trajectory, not by the fusion category alone.

---

# 12. Formalisation plan

## 12.1 Lean phase 1: finite matrix model

Do not begin with full category theory. Begin with a finite skeletal model.

Define:

```lean
structure FusionData where
  Label : Type
  finiteLabel : Fintype Label
  one : Label
  N : Label → Label → Label → Nat
```

Then define:

1. formal words of labels;
2. allowed fusion trees;
3. dimensions of Hom spaces;
4. basis vectors as combinatorial fusion trees;
5. linear maps as matrices over (\mathbb C) or over an exact algebraic field.

For Fibonacci, define:

```lean
inductive FibLabel
| one
| tau
```

with fusion multiplicities.

Then implement:

[
Q=\mathbf 1\oplus\tau
]

as the finite type `FibLabel`.

---

## 12.2 Lean phase 2: Hilbert-space statements

Prove:

1. (Q^N) configurations are functions

[
{1,\dots,N}\to \operatorname{Irr}(\mathcal C).
]

2. The Fock space is a direct sum over configurations.

3. Isometry equations reduce to matrix equations.

4. (E^\dagger E=I\Rightarrow V^\dagger V=I).

5. (A=\beta^\dagger(\beta\beta^\dagger)^{-1/2}) is an isometry.

For the polar-decomposition part, Lean may need finite-dimensional matrices and positive definite square roots. If this becomes hard, first formalise the no-mixing scalar case:

[
A_\nu=\frac{\overline{\beta_\nu}}{\sqrt{\sum_\mu|\beta_\mu|^2}}.
]

---

## 12.3 Lean phase 3: Fibonacci exact proofs

Prove exact identities:

[
\varphi^2=\varphi+1,
]

[
D^2=2+\varphi,
]

[
F^T F=I,
]

[
(\eta^{\mathrm{PF}})^\dagger\eta^{\mathrm{PF}}=I,
]

[
(\eta^{\mathrm{coassoc}})^\dagger\eta^{\mathrm{coassoc}}=I.
]

Then prove the coassociativity candidate, using the (F)-move.

---

## 12.4 Julia phase

Use Julia for exploratory computation.

Implement:

1. fusion rings;
2. fusion-tree basis generation;
3. (F)-move matrices;
4. local (\eta)-maps;
5. block maps (E);
6. isometry checks;
7. ascending channels;
8. numerical spectra.

For Fibonacci:

1. test PF amplitudes;
2. test coassociative amplitudes;
3. test RG amplitudes as functions of (\rho);
4. diagonalise simple ascending channels;
5. demonstrate failure of charge-only channel to recover (b^{-2/5});
6. demonstrate recovery when a full CFT operator RG matrix is inserted by definition.

---

## 12.5 Wolframscript phase

Use Wolframscript for exact symbolic solving.

Tasks:

1. Solve the Fibonacci coassociativity equations:

[
x^2+y^2=1,
]

[
2x^2+r^2=1,
]

[
r^2=\varphi^{-3/2}xy.
]

2. Verify the positive solution:

[
x=\varphi^{-1},
\qquad
y=\varphi^{-1/2},
\qquad
r=\varphi^{-3/2}.
]

3. Verify PF normalisation identities.

4. Derive eigenvalues of simple (2\times 2) or (3\times 3) ascending matrices.

---

# 13. Main conjectures to investigate

## Conjecture A: categorical fine graining as universal isometry

Every physically admissible finite-lattice fine-graining map is, at the categorical level, an isometry

[
E_{N\to M}:Q^{\otimes N}\hookrightarrow Q^{\otimes M}.
]

The induced maps on all charge sectors are given by postcomposition.

---

## Conjecture B: RG determines amplitudes by polar decomposition

Given the full Wilsonian blocking map

[
B_{N\leftarrow M}:Q^{\otimes M}\to Q^{\otimes N},
]

the canonical fine-graining amplitudes are uniquely determined by

[
E=B^\dagger(BB^\dagger)^{-1/2},
]

up to:

1. gauge choices of fusion bases;
2. unitary rotations in exactly degenerate retained operator subspaces;
3. arbitrary choices outside the code subspace if the polar-decomposition section is not imposed;
4. changes of RG scheme if (B) itself is not fixed.

---

## Conjecture C: topology gives allowed channels, RG gives weights

The fusion category determines:

[
\text{which }E_{\vec b,\vec a}\text{ may be nonzero}.
]

It does not, by itself, determine all amplitudes.

The RG/CFT data determines:

[
\text{the finite-scale coefficients }\beta_{\mu\nu}.
]

Isometry then determines:

[
\text{the fine-graining amplitudes }A_{\nu\mu}.
]

---

## Conjecture D: coherent continuum limit is operadic

A non-dyadic continuum limit should not be based only on a binary map

[
Q\to Q\otimes Q.
]

It should be based on a coherent family

[
\eta^{(r)}:Q\to Q^{\otimes r}
]

for all (r\geq 1), compatible with refinement of partitions.

This family likely forms an (A_\infty)-coalgebra-like structure, possibly strict at topological fixed points and only up to local unitaries along nontrivial RG flows.

---

## Conjecture E: braiding is required for order-changing interpolation

If a fine-graining interpolation allows particles to exchange spatial order, then the category must be braided, and the order-change components must use the braiding.

Without braiding, admissible fine-graining maps should be order-preserving or explicitly avoid crossings.

---

# 14. Immediate next formalisation targets

Prioritise the following.

1. **Fibonacci finite model.**
   Implement ({\mathbf 1,\tau}), fusion rules, (Q), binary channels, and exact (\varphi)-arithmetic.

2. **Isometry proof for general binary Fibonacci map.**
   Show

   [
   |x|^2+|y|^2=1,
   \qquad
   |p|^2+|q|^2+|r|^2=1
   ]

   is equivalent to (\eta^\dagger\eta=I).

3. **PF map proof.**
   Prove exact isometry.

4. **Coassociative candidate proof.**
   Use the (F)-matrix and prove the positive solution.

5. **RG amplitude formula.**
   Formalise no-mixing polar-decomposition amplitudes.

6. **Ascending channel.**
   Prove

   [
   \mathsf A(X)=E^\dagger X E
   ]

   is unital and positive.

7. **Charge-only negative example.**
   Show the simple charge-only Fibonacci channel does not generally yield (\lambda=b^{-2/5}).

8. **Full CFT operator RG axiomatisation.**
   Define an abstract operator RG matrix with eigenvalues

   [
   b^{-h_i}
   ]

   and prove that diagonalising it recovers the scaling operators.

This should give a clean Lean/Julia/Wolframscript roadmap: first prove the categorical and finite-dimensional linear algebra skeleton, then instantiate Fibonacci exactly, then add RG data as explicit matrices.

[1]: https://www.thp.uni-koeln.de/trebst/pubs/FibonacciAnyonModels.pdf?utm_source=chatgpt.com "A Short Introduction to Fibonacci Anyon Models"
[2]: https://bimsa.net/doc/publication/5294.pdf?utm_source=chatgpt.com "Ising-like and Fibonacci Anyons from KZ-equations"
[3]: https://arxiv.org/abs/1707.01196?utm_source=chatgpt.com "Temperley-Lieb at roots of unity, a fusion category and the Jones quotient"
[4]: https://arxiv.org/pdf/cond-mat/0510613?utm_source=chatgpt.com "arXiv:cond-mat/0510613v2 [cond-mat.str-el] 13 Feb 2007"

