ChatGPT

Goal of project is to *define* hilbert space for system of indefinite number of anyons modelled by fusion category C with finite simples. Idea is direct sum over total charge and direct sum over positions of k charges . What do you concrete understand

Thought for 3m 52s

What I concretely understand is this:

You want an anyon Fock-type Hilbert space whose basis states describe a finite but variable number of mobile anyons. A state should specify:

    how many anyons there are, say kk;

    where they are, e.g. kk distinct lattice sites or kk points in a surface;

    which simple charge sits at each position, say a1,…,ak∈Irr⁡(C)a1​,…,ak​∈Irr(C);

    the total charge, say c∈Irr⁡(C)c∈Irr(C);

    a fusion channel, i.e. an element of the fusion multiplicity space saying how the local charges fuse to total charge cc.

So the missing ingredient beyond “positions and total charge” is the fusion space.

Assume first that CC is a unitary fusion category with finitely many simple objects. Let
I=Irr⁡(C)
I=Irr(C)

be the finite set of simple charges, with vacuum object 11. For a tuple of charges a1,…,aka1​,…,ak​ and a proposed total charge cc, define the fusion Hilbert space
Va1,…,akc:=Hom⁡C(c,  a1⊗⋯⊗ak)
Va1​,…,ak​c​:=HomC​(c,a1​⊗⋯⊗ak​)

or equivalently, depending on convention,
Hom⁡C(a1⊗⋯⊗ak,  c).
HomC​(a1​⊗⋯⊗ak​,c).

These are finite-dimensional Hilbert spaces in the unitary case. A basis is given by fusion trees.

For a finite lattice ΛΛ, with at most one non-vacuum anyon per site, a clean definition is:
HΛ=⨁A⊆Λ  ⨁a:A→I∖{1}  ⨁c∈I  V(ax)x∈Ac.
HΛ​=A⊆Λ⨁​a:A→I∖{1}​⨁​c∈I⨁​V(ax​)x∈A​c​.

Here:

    A⊆ΛA⊆Λ is the finite set of occupied sites;

    ∣A∣=k∣A∣=k is the number of anyons;

    ax∈I∖{1}ax​∈I∖{1} is the charge at site xx;

    c∈Ic∈I is the total charge;

    V(ax)x∈AcV(ax​)x∈A​c​ is the internal fusion space.

To define ax1⊗⋯⊗axkax1​​⊗⋯⊗axk​​, one chooses an ordering of the occupied sites, for example by a fixed ordering of ΛΛ. Different orderings are not canonically equivalent unless additional braiding data is present.

So more explicitly, if A={x1<⋯<xk}A={x1​<⋯<xk​}, then
V(ax)x∈Ac=Hom⁡C(c,  ax1⊗⋯⊗axk).
V(ax​)x∈A​c​=HomC​(c,ax1​​⊗⋯⊗axk​​).

Thus a typical basis vector looks like
∣x1,a1;  x2,a2;  … ;  xk,ak;  c;  μ⟩,
∣x1​,a1​;x2​,a2​;…;xk​,ak​;c;μ⟩,

where μμ indexes a basis vector of
Hom⁡C(c,  a1⊗⋯⊗ak).
HomC​(c,a1​⊗⋯⊗ak​).

The direct sums over different AA, different labels aa, and different total charges cc are orthogonal.

For fixed total charge cc, the sector is
HΛ,c=⨁A⊆Λ  ⨁a:A→I∖{1}V(ax)x∈Ac.
HΛ,c​=A⊆Λ⨁​a:A→I∖{1}​⨁​V(ax​)x∈A​c​.

Then the full Hilbert space is
HΛ=⨁c∈IHΛ,c.
HΛ​=c∈I⨁​HΛ,c​.

Physically, one often fixes c=1c=1, the vacuum sector, especially for a closed system. The direct sum over cc is useful if you want to keep all superselection sectors at once.

For the kk-particle sector, the formula is
HΛ(k)=⨁A⊆Λ∣A∣=k  ⨁a:A→I∖{1}  ⨁c∈IV(ax)x∈Ac.
HΛ(k)​=A⊆Λ∣A∣=k​⨁​a:A→I∖{1}​⨁​c∈I⨁​V(ax​)x∈A​c​.

Then
HΛ=⨁k≥0HΛ(k).
HΛ​=k≥0⨁​HΛ(k)​.

If ΛΛ is finite and hard-core, then the sum over kk only runs from 00 to ∣Λ∣∣Λ∣. If ΛΛ is infinite, one takes the Hilbert direct sum over finite occupied subsets AA, i.e. the ℓ2ℓ2-completion of finite linear combinations of configurations.

The vacuum sector k=0k=0 should be
H(0)=⨁c∈IHom⁡C(c,1).
H(0)=c∈I⨁​HomC​(c,1).

Since Hom⁡C(c,1)HomC​(c,1) is zero unless c=1c=1, this gives
H(0)≅C.
H(0)≅C.

So the empty configuration has total charge 11.

For a continuum space XX, one should not literally take a direct sum over all positions. Instead, one uses L2L2-spaces over configuration spaces. The ordered configuration space is
Conf⁡k(X)={(x1,…,xk)∈Xk:xi≠xj}.
Confk​(X)={(x1​,…,xk​)∈Xk:xi​=xj​}.

Then the continuum analogue is roughly
H(k)=⨁a1,…,ak∈I∖{1}  ⨁c∈IL2 ⁣(Conf⁡k(X),Va1,…,akc).
H(k)=a1​,…,ak​∈I∖{1}⨁​c∈I⨁​L2(Confk​(X),Va1​,…,ak​c​).

So instead of
⨁positions,
positions⨁​,

one uses
L2(configuration space).
L2(configuration space).

This matters because an uncountable direct sum over continuum positions is usually the wrong Hilbert-space construction.

There is also an important structural point: a plain fusion category gives you fusion spaces, but for genuinely mobile anyons in two dimensions, especially if particles can be exchanged, one usually needs a braided fusion category or modular tensor category. The braiding gives the representation of particle exchanges on the fusion spaces. Without braiding, you can define the Hilbert space for ordered labelled configurations, but you do not yet have canonical exchange/braid operators.

So the compact version of the construction is:
H=⨁k≥0  ⨁positions x1,…,xk  ⨁a1,…,ak∈Irr⁡(C)∖{1}  ⨁c∈Irr⁡(C)Hom⁡C(c,  a1⊗⋯⊗ak)
H=k≥0⨁​positions x1​,…,xk​⨁​a1​,…,ak​∈Irr(C)∖{1}⨁​c∈Irr(C)⨁​HomC​(c,a1​⊗⋯⊗ak​)​

with the warning that for continuum positions, the “sum over positions” should be replaced by an L2L2-space over configuration space.

The key point is that an anyonic many-particle Hilbert space is not just
positions×charges.
positions×charges.

It is
positions+local simple labels+total charge+fusion multiplicity space.
positions+local simple labels+total charge+fusion multiplicity space.

That final fusion space is where the nontrivial anyonic internal degrees of freedom live.

I’ll work the Temperley–Lieb/Jones AA-series test case concretely, with Ising/SU(2)2SU(2)2​ as the smallest benchmark. I’ll separate Hilbert space, Hamiltonian, refinement criteria, and Koo–Saleur reconstruction.

I’ll do both the generic Ak+1Ak+1​ formulas and the explicit A3A3​/Ising matrices, starting with the dense σσ-anyon path sector where Jones projections and KS modes are immediate.

Yes. Temperley–Lieb is the right test case because almost every ambiguity collapses to one object, one projector, and one nontrivial FF-move. The cleanest version is:
Temperley–Lieb at δ=2⟹A3 RSOS/TL chain⟹critical transverse-field Ising⟹M(3,4),  c=12.
Temperley–Lieb at δ=2
​⟹A3​ RSOS/TL chain⟹critical transverse-field Ising⟹M(3,4),c=21​.​

This is exactly the toy model where your proposed “canonical microscopic RCFT” mechanism can be tested in full detail.

I will treat the dense TL sector first, because that is the known solved model. It embeds into your indefinite-anyon Hilbert space as the sector in which every site is occupied by the same noninvertible simple object. The fully dilute/indefinite model is the next layer, but the dense TL test is the non-negotiable sanity check.
1. The input RCFT and its defect/fusion category

Take the diagonal Ising RCFT:
M(3,4),c=12.
M(3,4),c=21​.

Its three primary labels are
1,σ,ψ,
1,σ,ψ,

with conformal weights
h1=0,hσ=116,hψ=12.
h1​=0,hσ​=161​,hψ​=21​.

For the full diagonal Ising CFT, the local bulk primaries are usually written
1,Σ,ε,
1,Σ,ε,

with
Δ1=0,ΔΣ=18,Δε=1.
Δ1​=0,ΔΣ​=81​,Δε​=1.

Here ΣΣ is the spin field, while the categorical simple object σσ is the noninvertible Ising defect/anyon. The same symbol is often used for both, but I will write ΣΣ for the bulk spin field when needed.

For the diagonal full CFT, the FRS algebra is simply
A=1.
A=1.

So the defect category is just the Ising fusion category itself:
D=A-BimodRep⁡(Ising)(A)≅Rep⁡(Ising).
D=A-BimodRep(Ising)​(A)≅Rep(Ising).

As a fusion category, this is the Temperley–Lieb–Jones category at
δ=2.
δ=2
​.

The fusion rules are
σ⊗σ≅1⊕ψ,
σ⊗σ≅1⊕ψ,
σ⊗ψ≅σ,
σ⊗ψ≅σ,
ψ⊗ψ≅1.
ψ⊗ψ≅1.

The quantum dimensions are
d1=1,dσ=2,dψ=1.
d1​=1,dσ​=2
​,dψ​=1.

Equivalently,
dσ=2cos⁡π4=2.
dσ​=2cos4π​=2
​.

The single nontrivial FF-matrix needed for the TL chain is
Fσσσσ=12(111−1),
Fσσσσ​=2
​1​(11​1−1​),

where the intermediate fusion channel basis is
1,ψ.
1,ψ.

This is the entire local associativity input in the Ising/TL test case.

A useful modern formulation is that if a fusion category has a noninvertible self-dual object aa with a⊗aa⊗a containing the tensor unit, then the suitably normalized identity-channel projectors give Temperley–Lieb generators; recent work states this explicitly and relates it to Pasquier’s ADE lattice models.
2. Your general Hilbert space, specialized to TL

Your general finite-volume Hilbert space on a 1D lattice ΛL={1,…,L}ΛL​={1,…,L} is
FL(D)=⨁A⊆ΛL  ⨁a:A→Irr⁡(D)∖{1}  ⨁c∈Irr⁡(D)Hom⁡D(c,  ⨂i∈A<ai).
FL​(D)=A⊆ΛL​⨁​a:A→Irr(D)∖{1}⨁​c∈Irr(D)⨁​HomD​(c,i∈A⨂<​ai​).

For the Ising/TL category,
Irr⁡(D)={1,σ,ψ}.
Irr(D)={1,σ,ψ}.

So the full indefinite-particle Hilbert space is
FL(Ising)=⨁A⊆{1,…,L}  ⨁ai∈{σ,ψ}  ⨁c∈{1,σ,ψ}Hom⁡(c,  ⨂i∈A<ai).
FL​(Ising)=A⊆{1,…,L}⨁​ai​∈{σ,ψ}⨁​c∈{1,σ,ψ}⨁​Hom(c,i∈A⨂<​ai​).

The known TL/RSOS critical model lives in the dense σσ-sector:
A={1,…,N},a1=⋯=aN=σ.
A={1,…,N},a1​=⋯=aN​=σ.

Thus
HNdense=⨁c∈{1,σ,ψ}Hom⁡D(c,σ⊗N).
HNdense​=c∈{1,σ,ψ}⨁​HomD​(c,σ⊗N).

For fixed total charge cc,
HN(c)=Hom⁡D(c,σ⊗N).
HN​(c)=HomD​(c,σ⊗N).

This is the standard anyonic chain Hilbert space.

A basis vector is a fusion path
x0,x1,…,xN
x0​,x1​,…,xN​

with
x0=1,xN=c,
x0​=1,xN​=c,

and
xi⊂xi−1⊗σ.
xi​⊂xi−1​⊗σ.

Because fusion by σσ obeys
1⊗σ=σ,
1⊗σ=σ,
σ⊗σ=1⊕ψ,
σ⊗σ=1⊕ψ,
ψ⊗σ=σ,
ψ⊗σ=σ,

the allowed path graph is
1  −  σ  −  ψ.
1−σ−ψ.

This is the A3A3​ Dynkin graph.

So we can equivalently label path heights by
hi∈{1,2,3},
hi​∈{1,2,3},

with
1↔1,2↔σ,3↔ψ,
1↔1,2↔σ,3↔ψ,

and the adjacency condition
∣hi−hi−1∣=1.
∣hi​−hi−1​∣=1.

That is the A3A3​ RSOS Hilbert space.

For NN even, starting from x0=1x0​=1, one has
x2r∈{1,ψ},x2r+1=σ.
x2r​∈{1,ψ},x2r+1​=σ.

Hence
dim⁡⨁cHom⁡(c,σ⊗N)=2N/2.
dimc⨁​Hom(c,σ⊗N)=2N/2.

For fixed total charge c=1c=1 or c=ψc=ψ,
dim⁡Hom⁡(c,σ⊗N)=2N/2−1.
dimHom(c,σ⊗N)=2N/2−1.

This is already a spin-chain-sized Hilbert space.
3. The local TL generator as a categorical projector

The unique nontrivial local categorical operation is:
σi⊗σi+1⟶1⟶σi⊗σi+1.
σi​⊗σi+1​⟶1⟶σi​⊗σi+1​.

Let
Pi(1)
Pi(1)​

be the orthogonal projector onto the vacuum fusion channel of the ii-th and (i+1)(i+1)-st σσ-anyons.

Define
ei=δ Pi(1)=2 Pi(1).
ei​=δPi(1)​=2
​Pi(1)​.

Then the eiei​ satisfy the Temperley–Lieb relations
ei2=δei,
ei2​=δei​,
eiei±1ei=ei,
ei​ei±1​ei​=ei​,
eiej=ejei∣i−j∣≥2,
ei​ej​=ej​ei​∣i−j∣≥2,

with
δ=2.
δ=2
​.

This is the categorical heart of the example. The Hamiltonian density is not guessed. It is the identity-channel projector for
σ⊗σ.
σ⊗σ.

In path/height basis, the A3A3​ Perron–Frobenius vector is
v=(v1,v2,v3)=(1,2,1).
v=(v1​,v2​,v3​)=(1,2
​,1).

The local TL operator acts by changing only the middle height hihi​:
(ei)…,hi−1,hi,hi+1,……,hi−1,hi′,hi+1,…=δhi−1,hi+1vhivhi′vhi−1.
(ei​)…,hi−1​,hi​,hi+1​,……,hi−1​,hi′​,hi+1​,…​=δhi−1​,hi+1​​vhi−1​​vhi​​vhi′​​
​​.

Equivalently,
ei=0unlesshi−1=hi+1.
ei​=0unlesshi−1​=hi+1​.

There are only two types of nonzero local blocks.

First, if
hi−1=hi+1=2,
hi−1​=hi+1​=2,

then
hi,hi′∈{1,3},
hi​,hi′​∈{1,3},

and
ei=12(1111).
ei​=2
​1​(11​11​).

This matrix has eigenvalues
2,0,
2
​,0,

so it is indeed
2
2
​

times a rank-one projector.

Second, if
hi−1=hi+1=1orhi−1=hi+1=3,
hi−1​=hi+1​=1orhi−1​=hi+1​=3,

then the middle height is forced to be
hi=2,
hi​=2,

and
ei=[2].
ei​=[2
​].

Thus ei2=2eiei2​=2
​ei​ is immediate block-by-block.

The nontrivial relation
eiei+1ei=ei
ei​ei+1​ei​=ei​

is the local FF-move identity. In this example it is exactly the statement that
Fσσσσ=12(111−1)
Fσσσσ​=2
​1​(11​1−1​)

is unitary and implements reassociation.
4. The canonical TL Hamiltonian

The uniform nearest-neighbor TL Hamiltonian is
HNTL=−∑i=1Nei
HNTL​=−i=1∑N​ei​

for periodic boundary conditions, or
HNTL,open=−∑i=1N−1ei
HNTL,open​=−i=1∑N−1​ei​

for open boundary conditions.

This is the categorical Hamiltonian
H=−2∑iPi(1).
H=−2
​i∑​Pi(1)​.

Up to an additive and multiplicative constant, this is the A3A3​ RSOS Hamiltonian.

The important point is that at the TL level there is essentially no freedom: for two neighboring σσ-anyons,
σ⊗σ=1⊕ψ,
σ⊗σ=1⊕ψ,

so there are only two projectors:
P(1),P(ψ),
P(1),P(ψ),

and
P(1)+P(ψ)=1.
P(1)+P(ψ)=1.

Therefore choosing P(1)P(1) or P(ψ)P(ψ) differs by sign and constant. The local Hamiltonian density is canonical up to this sign/constant convention.
5. Explicit equivalence with the critical Ising spin chain

Now make the A3A3​ path representation completely explicit.

Take a periodic chain with
N=2M
N=2M

TL sites. Work in the sector where the even heights are fixed to
h2r=2,
h2r​=2,

and the odd heights are
h2r−1∈{1,3}.
h2r−1​∈{1,3}.

Define a Pauli spin on each odd site by
∣+⟩r=∣h2r−1=1⟩,
∣+⟩r​=∣h2r−1​=1⟩,
∣−⟩r=∣h2r−1=3⟩.
∣−⟩r​=∣h2r−1​=3⟩.

Let Xr,ZrXr​,Zr​ be Pauli matrices in this basis, with
Zr∣+⟩r=∣+⟩r,Zr∣−⟩r=−∣−⟩r,
Zr​∣+⟩r​=∣+⟩r​,Zr​∣−⟩r​=−∣−⟩r​,

and
Xr∣+⟩r=∣−⟩r,Xr∣−⟩r=∣+⟩r.
Xr​∣+⟩r​=∣−⟩r​,Xr​∣−⟩r​=∣+⟩r​.

Now compute the two types of TL generators.
Odd TL generator

The operator e2r−1e2r−1​ acts on the odd height h2r−1h2r−1​, whose neighbors are both 22:
h2r−2=2,h2r=2.
h2r−2​=2,h2r​=2.

So in the {∣+⟩,∣−⟩}{∣+⟩,∣−⟩} basis,
e2r−1=12(1111)=12(1+Xr).
e2r−1​=2
​1​(11​11​)=2
​1​(1+Xr​).
Even TL generator

The operator e2re2r​ acts on the forced height h2r=2h2r​=2, with neighbors
h2r−1,h2r+1∈{1,3}.
h2r−1​,h2r+1​∈{1,3}.

It is nonzero only when the two neighboring spin variables are equal. Therefore
e2r=2 1+ZrZr+12=12(1+ZrZr+1).
e2r​=2
​21+Zr​Zr+1​​=2
​1​(1+Zr​Zr+1​).

Thus the TL Hamiltonian becomes
H2MTL=−∑r=1Me2r−1−∑r=1Me2r
H2MTL​=−r=1∑M​e2r−1​−r=1∑M​e2r​
=−12∑r=1M(1+Xr)−12∑r=1M(1+ZrZr+1).
=−2
​1​r=1∑M​(1+Xr​)−2
​1​r=1∑M​(1+Zr​Zr+1​).

So
H2MTL=−2 M 1−12∑r=1M(Xr+ZrZr+1).
H2MTL​=−2
​M1−2
​1​r=1∑M​(Xr​+Zr​Zr+1​).

Ignoring the additive constant,
H2MTL∼−12∑r=1M(Xr+ZrZr+1).
H2MTL​∼−2
​1​r=1∑M​(Xr​+Zr​Zr+1​).​

This is exactly the critical transverse-field Ising chain, with equal transverse-field and nearest-neighbor Ising coupling. The rigorous Koo–Saleur/free-fermion scaling-limit results explicitly cover the transverse-field Ising case and its c=12c=21​ Virasoro scaling representation.

This calculation is the microscopic payoff: the TL categorical projector Hamiltonian is not merely in the Ising universality class. In the A3A3​ path representation, it is literally the critical Ising chain.
6. Where the conformal tuning lives

The uniform TL Hamiltonian is
H=−∑iei.
H=−i∑​ei​.

In the spin-chain variables, uniformity of the eiei​’s means equality of the XrXr​ and ZrZr+1Zr​Zr+1​ couplings:
H∼−∑r(Xr+ZrZr+1).
H∼−r∑​(Xr​+Zr​Zr+1​).

If one staggers the TL couplings,
H(m)=−∑r((1+m)e2r−1+(1−m)e2r),
H(m)=−r∑​((1+m)e2r−1​+(1−m)e2r​),

then
H(m)∼−12∑r((1+m)Xr+(1−m)ZrZr+1)+constant.
H(m)∼−2
​1​r∑​((1+m)Xr​+(1−m)Zr​Zr+1​)+constant.

This is the off-critical transverse-field Ising chain. The staggering parameter mm is the thermal mass.

The corresponding lattice energy operator is
εrlat∝e2r−1−e2r.
εrlat​∝e2r−1​−e2r​.

Using the spin-chain formulas,
e2r−1−e2r=12(Xr−ZrZr+1).
e2r−1​−e2r​=2
​1​(Xr​−Zr​Zr+1​).

In the Ising CFT,
ε
ε

has scaling dimension
Δε=1.
Δε​=1.

Thus the conformal fixed point is selected locally by requiring that the Hamiltonian has zero projection onto the relevant scalar energy perturbation:
coefficient of e2r−1−e2r=0.
coefficient of e2r−1​−e2r​=0.​

Equivalently,
one-site TL translation / Kramers–Wannier self-duality is preserved.
one-site TL translation / Kramers–Wannier self-duality is preserved.​

This is already a prototype for your desired “locally checkable conformal tuning criterion.”

The relevant scalar appears as the odd-even TL staggering. Kill that component, and the remaining uniform TL density is the critical Hamiltonian density.
7. The conformal data that the refinement tensor must reproduce

For the Ising CFT, the local bulk scaling fields have low-lying spectrum
field(h,hˉ)Δ=h+hˉ1(0,0)0Σ(1/16,1/16)1/8ε(1/2,1/2)1T(2,0)2Tˉ(0,2)2
field1ΣεTTˉ​(h,hˉ)(0,0)(1/16,1/16)(1/2,1/2)(2,0)(0,2)​Δ=h+hˉ01/8122​​

The important OPEs are
Σ×Σ=1+ε+⋯ ,
Σ×Σ=1+ε+⋯,
Σ×ε=Σ+⋯ ,
Σ×ε=Σ+⋯,
ε×ε=1+⋯ .
ε×ε=1+⋯.

With standard two-point normalization,
CΣΣ1=1,
CΣΣ1​=1,
CΣΣε=12,
CΣΣε​=21​,
CΣεΣ=12,
CΣεΣ​=21​,
Cεε1=1.
Cεε1​=1.

The stress tensor OPE is
T(z)T(0)∼c/2z4+2T(0)z2+∂T(0)z+⋯ .
T(z)T(0)∼z4c/2​+z22T(0)​+z∂T(0)​+⋯.

For Ising,
c=12,
c=21​,

so
c2=14.
2c​=41​.

Therefore a scale-22 ascending map
A
A

should have eigenoperators satisfying
A(1)=1,
A(1)=1,
A(Σ)=2−1/8Σ,
A(Σ)=2−1/8Σ,
A(ε)=2−1ε,
A(ε)=2−1ε,
A(T)=2−2T,
A(T)=2−2T,
A(Tˉ)=2−2Tˉ.
A(Tˉ)=2−2Tˉ.

This is the sharp local scaling-spectrum check.

But the real criterion is stronger:
A must reproduce not only Δα but also Cαβγ and the TT anomaly c=12.
A must reproduce not only Δα​ but also Cαβγ​ and the TT anomaly c=21​.​

Scaling dimensions alone are too weak. The OPE and stress-tensor normalization are what select the CFT rather than merely a spectrum-shaped impostor.
8. What is the canonical refinement tensor in this example?

Here the answer is unusually concrete.

At the primary-field level, the nontrivial crossing matrix of the Ising CFT for four σσ-fields is
Fσσσσ=12(111−1).
Fσσσσ​=2
​1​(11​1−1​).

This is exactly the same matrix as the TL FF-move.

So the primary-level refinement tensor has the same local algebraic core as the TL path model.

The local associativity/crossing equation is schematically
∑ηCαβηCηγδ=∑η′Fηη′Cβγη′Cαη′δ.
η∑​Cαβη​Cηγδ​=η′∑​Fηη′​Cβγη′​Cαη′δ​.

For the channel
σσσ→σ,
σσσ→σ,

the FF-matrix is the Hadamard matrix above. This is exactly the local relation behind
eiei+1ei=ei.
ei​ei+1​ei​=ei​.

So at the primary/topological level:
TL associativity=Ising crossing for σσσσ.
TL associativity=Ising crossing for σσσσ.​

However, the exact CFT refinement tensor cannot stop at primary labels. It must also include all Virasoro descendants. This is where the central charge enters.

A canonical exact fixed-point tensor for an RCFT can be defined from CFT correlation functions of boundary-changing operators on triangles. In that construction, the primary labels are finite, but the descendant indices are infinite-dimensional; the tensor satisfies crossing and coarse-graining conditions and, for Ising, explicitly recovers scaling dimensions such as 00, 0.1250.125, 11, 22, etc.

For Ising, the tensor indices look like
(a,b,c;α,n;β,m;γ,ℓ),
(a,b,c;α,n;β,m;γ,ℓ),

where
a,b,c∈{1,σ,ψ}
a,b,c∈{1,σ,ψ}

label boundary conditions/defects, while
α,β,γ∈{1,Σ,ε}
α,β,γ∈{1,Σ,ε}

label primary sectors, and
n,m,ℓ
n,m,ℓ

label Virasoro descendants.

A schematic tensor component is
R(α,n)(β,m)(γ,ℓ)abc=⟨Oα,nab(x1)Oβ,mbc(x2)Oγ,ℓca(x3)⟩△,
R(α,n)(β,m)(γ,ℓ)abc​=⟨Oα,nab​(x1​)Oβ,mbc​(x2​)Oγ,ℓca​(x3​)⟩△​,

with a fixed conformal map from the upper half-plane or pair-of-pants geometry to the triangle.

At primary level,
Rαβγabc∼Cαβγabc.
Rαβγabc​∼Cαβγabc​.

At descendant level, the coefficients are fixed by the Virasoro Ward identities, hence by
c=12
c=21​

and the primary weights.

Thus the canonical refinement tensor is not guessed from the Hamiltonian. It is built from the parent RCFT data:
(c,  hα,  Cαβγ,  F-symbols,  Virasoro descendant rules).
(c,hα​,Cαβγ​,F-symbols,Virasoro descendant rules).​

In the Ising/TL case, the topological part is literally the TL FF-symbol, while the descendant part supplies the stress tensor and central charge.

This is precisely the kind of object you were hoping for: a locally checkable refinement tensor whose ascending spectrum and OPE data reproduce the parent RCFT.
9. How this selects the “ground state” without diagonalizing HH

The exact fixed-point tensor determines a state by contraction.

For a circle, contract the tensor network on a disk or annulus. This gives a compatible family of finite-scale states
ωN
ωN​

on the lattice observables. In the thermodynamic/scaling limit,
ωN→ωIsing.
ωN​→ωIsing​.

This is the CFT vacuum state.

The defining properties are local RG properties:
ω∘A=ω,
ω∘A=ω,
A(Σ)=2−1/8Σ,
A(Σ)=2−1/8Σ,
A(ε)=2−1ε,
A(ε)=2−1ε,
A(T)=2−2T,
A(T)=2−2T,
T(z)T(0)∼1/4z4+⋯ .
T(z)T(0)∼z41/4​+⋯.

Thus the state is selected by the fixed-point tensor and the conformal data, not by first diagonalizing HH.

Then HH can be recovered or checked as follows. The local uniform TL density satisfies
e2r−1+e2r=12(21+Xr+ZrZr+1).
e2r−1​+e2r​=2
​1​(21+Xr​+Zr​Zr+1​).

The staggered density is
e2r−1−e2r=12(Xr−ZrZr+1)∼ε.
e2r−1​−e2r​=2
​1​(Xr​−Zr​Zr+1​)∼ε.

So the conformal criterion says:
Hamiltonian density may contain T+Tˉ and identity, but not ε.
Hamiltonian density may contain T+Tˉ and identity, but not ε.

That uniquely picks the self-dual critical point among the nearest-neighbor TL perturbations:
Hcrit=−∑iei.
Hcrit​=−i∑​ei​.​

This resolves the chicken-and-egg problem in the Ising/TL case:
RCFT data⇒fixed-point refinement state⇒vacuum subtraction⇒Koo–Saleur Virasoro.
RCFT data⇒fixed-point refinement state⇒vacuum subtraction⇒Koo–Saleur Virasoro.

The Hamiltonian is then the local TL operator whose relevant scalar projection vanishes.
10. Koo–Saleur reconstruction in the TL example

Now take the periodic TL chain with
N=2M.
N=2M.

Let
δ=2cos⁡γ.
δ=2cosγ.

For Ising/TL,
γ=π4,δ=2.
γ=4π​,δ=2
​.

Define
κ=γπsin⁡γ.
κ=πsinγγ​.

For Ising,
κ=π/4π(2/2)=122.
κ=π(2
​/2)π/4​=22
​1​.

Let
e∞=lim⁡N→∞ωN(ej).
e∞​=N→∞lim​ωN​(ej​).

For the Ising normalization above,
e∞=12(1+2π).
e∞​=2
​1​(1+π2​).

This follows from
e2r−1=12(1+Xr),
e2r−1​=2
​1​(1+Xr​),
e2r=12(1+ZrZr+1),
e2r​=2
​1​(1+Zr​Zr+1​),

and the critical Ising expectations
ω(Xr)=ω(ZrZr+1)=2π.
ω(Xr​)=ω(Zr​Zr+1​)=π2​.

The ground-state energy density for
H=−∑iei
H=−i∑​ei​

is therefore
E0(N)N→−e∞=−12(1+2π).
NE0​(N)​→−e∞​=−2
​1​(1+π2​).

The finite-size correction is
E0(N)=−Ne∞−πvc6N+o(N−1),
E0​(N)=−Ne∞​−6Nπvc​+o(N−1),

with
c=12,
c=21​,

and, in TL-site units,
v=πsin⁡γγ=22.
v=γπsinγ​=22
​.

The Koo–Saleur approximants can be written directly in terms of the TL generators. A standard TL form is
Ln(N)=N4π[−κ∑j=1Ne2πinj/N(ej−e∞+iκ[ej,ej+1])]+c24δn,0,
Ln(N)​=4πN​[−κj=1∑N​e2πinj/N(ej​−e∞​+iκ[ej​,ej+1​])]+24c​δn,0​,

and
Lˉn(N)=N4π[−κ∑j=1Ne−2πinj/N(ej−e∞−iκ[ej,ej+1])]+c24δn,0.
Lˉn(N)​=4πN​[−κj=1∑N​e−2πinj/N(ej​−e∞​−iκ[ej​,ej+1​])]+24c​δn,0​.

This is exactly the kind of formula studied by Koo and Saleur for XXZ/RSOS models and later in TL language. The original Koo–Saleur paper formulated the lattice stress tensor and checked Virasoro relations in XXZ/RSOS scaling limits, including central terms and null vectors; later work writes explicit TL Koo–Saleur generators of the form above.

For Ising,
c=12,κ=122.
c=21​,κ=22
​1​.

In the scaling representation selected by the Ising fixed-point state,
Ln(N)→Ln,Lˉn(N)→Lˉn,
Ln(N)​→Ln​,Lˉn(N)​→Lˉn​,

and
[Lm,Ln]=(m−n)Lm+n+124m(m2−1)δm+n,0.
[Lm​,Ln​]=(m−n)Lm+n​+241​m(m2−1)δm+n,0​.

Because
c12=124.
12c​=241​.

For example,
[L2,L−2]=4L0+c2=4L0+14.
[L2​,L−2​]=4L0​+2c​=4L0​+41​.

On the vacuum,
L0Ω=0,
L0​Ω=0,

so
⟨Ω,[L2,L−2]Ω⟩=14.
⟨Ω,[L2​,L−2​]Ω⟩=41​.

That is the first nontrivial central-charge check.

The rigorous free-fermion/OAR result is especially relevant here: Osborne–Stottmeister prove convergence of Koo–Saleur approximants in the scaling-limit representation, emphasize the need for subtracting vacuum/ground-state expectations, and explicitly cover the transverse-field Ising model via the fermionic scaling limit.

So in this example the blocker you identified is solved:
e∞ and the reference representation are supplied by the conformal fixed-point state, not by ad hoc diagonalization.
e∞​ and the reference representation are supplied by the conformal fixed-point state, not by ad hoc diagonalization.​
11. The full scaling Hilbert space

The diagonal Ising full CFT Hilbert space is
HIsing=(V0⊗Vˉ0)⊕(V1/2⊗Vˉ1/2)⊕(V1/16⊗Vˉ1/16).
HIsing​=(V0​⊗Vˉ0​)⊕(V1/2​⊗Vˉ1/2​)⊕(V1/16​⊗Vˉ1/16​).

Equivalently,
ZIsing=∣χ0∣2+∣χ1/2∣2+∣χ1/16∣2.
ZIsing​=∣χ0​∣2+∣χ1/2​∣2+∣χ1/16​∣2.

On the lattice, the corresponding sectors come from boundary conditions, total charge, and topological flux sectors of the annular/periodic TL representation.

This is where your original direct sum over total charge matters. If one fixes a single total charge or a single boundary sector, one usually sees only part of the CFT state space. If one keeps the full categorical direct sum, one has the right microscopic precursor of the full diagonal modular invariant.

So in the TL/Ising case:
⨁c∈{1,σ,ψ}Hom⁡(c,σ⊗N)
c∈{1,σ,ψ}⨁​Hom(c,σ⊗N)​

is the natural anyonic precursor of the full Ising sector decomposition.
12. The local “conformal selection” criterion in TL form

For this example, the locally checkable criterion can be stated very explicitly.

A candidate scale-invariant refinement/ascending structure is acceptable if:
A(1)=1,
A(1)=1,
A(Σ)=2−1/8Σ,
A(Σ)=2−1/8Σ,
A(ε)=2−1ε,
A(ε)=2−1ε,
A(T)=2−2T,A(Tˉ)=2−2Tˉ,
A(T)=2−2T,A(Tˉ)=2−2Tˉ,

and the OPE coefficients satisfy
CΣΣ1=1,
CΣΣ1​=1,
CΣΣε=12,
CΣΣε​=21​,
CΣεΣ=12,
CΣεΣ​=21​,
Cεε1=1.
Cεε1​=1.

The stress tensor must satisfy
T(z)T(0)∼1/4z4+2T(0)z2+∂T(0)z+⋯ .
T(z)T(0)∼z41/4​+z22T(0)​+z∂T(0)​+⋯.

On the microscopic TL lattice, the key local identifications are
εrlat∼e2r−1−e2r,
εrlat​∼e2r−1​−e2r​,
hrlat∼e2r−1+e2r−2e∞1,
hrlat​∼e2r−1​+e2r​−2e∞​1,
prlat∼i[er,er+1].
prlat​∼i[er​,er+1​].

So the local conformal condition on a nearest-neighbor TL Hamiltonian is:
No component along e2r−1−e2r.
No component along e2r−1​−e2r​.​

Equivalently, the Hamiltonian must be uniform in the TL generators:
H=−∑iei.
H=−i∑​ei​.​

This is exactly the critical Ising point.
13. General AmAm​ Temperley–Lieb version

The Ising case is A3A3​. The whole AA-series works similarly.

Let
m≥3,
m≥3,

and define
δm=2cos⁡πm+1.
δm​=2cosm+1π​.

The semisimple TLJ category has simple labels
0,1,…,m−1,
0,1,…,m−1,

with generator X=1X=1, fusion graph AmAm​, and Jones–Wenzl truncation
fm=0.
fm​=0.

The AmAm​ RSOS heights are
hi∈{1,2,…,m},
hi​∈{1,2,…,m},

with adjacency
∣hi−hi+1∣=1.
∣hi​−hi+1​∣=1.

The Perron–Frobenius vector is
va=sin⁡πam+1,a=1,…,m.
va​=sinm+1πa​,a=1,…,m.

The TL generator acts by
(ei)…,hi−1,hi,hi+1,……,hi−1,hi′,hi+1,…=δhi−1,hi+1vhivhi′vhi−1.
(ei​)…,hi−1​,hi​,hi+1​,……,hi−1​,hi′​,hi+1​,…​=δhi−1​,hi+1​​vhi−1​​vhi​​vhi′​​
​​.

The Hamiltonian is again
HN(m)=−∑iei.
HN(m)​=−i∑​ei​.

The scaling limit is the unitary Virasoro minimal model
M(m,m+1),
M(m,m+1),

with
cm=1−6m(m+1).
cm​=1−m(m+1)6​.

The primary weights are
hr,s(m)=((m+1)r−ms)2−14m(m+1),
hr,s(m)​=4m(m+1)((m+1)r−ms)2−1​,

where
1≤r≤m−1,1≤s≤m,
1≤r≤m−1,1≤s≤m,

with the usual Kac-table identification.

For m=3m=3,
c3=1−63⋅4=12,
c3​=1−3⋅46​=21​,

and one gets Ising.

For m=4m=4,
c4=1−64⋅5=710,
c4​=1−4⋅56​=107​,

and one gets tricritical Ising.

The ABF/RSOS critical points are historically one of the standard lattice realizations of the unitary minimal models; Huse identified the ABF critical points with the Friedan–Qiu–Shenker unitary minimal series.

For general mm, set
γ=πm+1,δ=2cos⁡γ.
γ=m+1π​,δ=2cosγ.

Then the TL Koo–Saleur generators use
κ=γπsin⁡γ,
κ=πsinγγ​,

and the continuum central charge is
c=1−6γ2π(π−γ)=1−6m(m+1).
c=1−π(π−γ)6γ2​=1−m(m+1)6​.

So the TL family gives an entire known class of canonical microscopic RCFT realizations.
14. What this example proves for your program

The TL/Ising case supports your proposed strategy in a very strong way.

The data flow is:
Ising RCFT⇒Ising/TL fusion category⇒dense σ-anyon Hilbert space⇒TL projectors ei⇒H=−∑iei⇒critical Ising⇒Koo–Saleur Virasoro with c=12.
Ising RCFT⇒Ising/TL fusion category⇒dense σ-anyon Hilbert space⇒TL projectors ei​⇒H=−i∑​ei​⇒critical Ising⇒Koo–Saleur Virasoro with c=21​.

But the more conceptually relevant flow is:
Ising RCFT data⇒exact fixed-point/refinement tensor⇒vacuum/scaling state ω⇒e∞=ω(ei)⇒Koo–Saleur Ln,Lˉn.
Ising RCFT data⇒exact fixed-point/refinement tensor⇒vacuum/scaling state ω⇒e∞​=ω(ei​)⇒Koo–Saleur Ln​,Lˉn​.

That directly addresses your chicken-and-egg problem.

The Hamiltonian is still central, but in this example the ground-state reference can be selected by conformal scaling data:
A(Σ)=2−1/8Σ,
A(Σ)=2−1/8Σ,
A(ε)=2−1ε,
A(ε)=2−1ε,
A(T)=2−2T,
A(T)=2−2T,
TT OPE has c=12,
TT OPE has c=21​,
CΣΣε=12.
CΣΣε​=21​.

The Hamiltonian is then the uniform TL density whose relevant εε-component vanishes.

So, in the simplest nontrivial case, the hoped-for mechanism works:
categorical local data+RCFT scaling/OPE dataselects the critical state,
categorical local data+RCFT scaling/OPE dataselects the critical state,​

and then
Koo–Saleur reconstructs the Virasoro representation.
Koo–Saleur reconstructs the Virasoro representation.​
15. The important caveat

This does not mean that the bare TL fusion category alone determines the Ising CFT.

The fusion category gives
σ⊗σ=1⊕ψ
σ⊗σ=1⊕ψ

and the FF-matrix. But it does not by itself give the conformal weights
hσ=116,hψ=12,
hσ​=161​,hψ​=21​,

nor the central charge
c=12.
c=21​.

Those come from the parent RCFT data.

So the correct conclusion is:
TL fusion category+Ising RCFT conformal data⇒canonical TL microscopic realization.
TL fusion category+Ising RCFT conformal data⇒canonical TL microscopic realization.​

Not:
TL fusion category alone⇒unique CFT.
TL fusion category alone⇒unique CFT.

The exact refinement tensor necessarily uses descendant data and hence knows cc. Finite primary-label TL data is the topological skeleton; the Virasoro descendant tower is the conformal flesh.
16. How I would state the TL test theorem

For the Ising case, the desired theorem should look like this:
\boxed{ \begin{minipage}{0.88\linewidth} Let \(\mathcal D=\operatorname{Rep}(\mathrm{Ising})\cong \mathrm{TLJ}_{\sqrt2}\), and let \(\sigma\in\mathcal D\) be the noninvertible simple object. On the dense anyonic Hilbert space \[ \mathcal H_N=\bigoplus_c\operatorname{Hom}(c,\sigma^{\otimes N}),

define
ei=2 Pi(1),HN=−∑iei.
ei​=2
​Pi(1)​,HN​=−i∑​ei​.

Then eiei​ satisfy the Temperley--Lieb relations at δ=2δ=2
​, HNHN​ is equivalent to the critical transverse-field Ising Hamiltonian, and the Koo--Saleur approximants built from ei−e∞ei​−e∞​ and [ei,ei+1][ei​,ei+1​] converge in the Ising scaling representation to two commuting Virasoro algebras with c=cˉ=12c=cˉ=21​. The required reference state is equivalently obtained as the fixed state of the Ising RCFT refinement tensor whose local ascending spectrum and OPE coefficients reproduce ΔΣ=18ΔΣ​=81​, Δε=1Δε​=1, CΣΣε=12CΣΣε​=21​, and the TTTT anomaly c=12c=21​.
\end{minipage}
}
]

That is the complete TL proof-of-concept.

The dense TL sector is not the final indefinite-anyon model, but it is the canonical first checkpoint. If the broader program is right, the fully mobile/dilute construction should reduce to this TL chain after imposing dense σσ-occupation or adding a chemical potential that selects the dense sector.

You were vague on the precise point I think is crucial: "a locally checkable refinement tensor whose ascending spectrum and OPE data reproduce the parent RCFT". How is this tensor defined with respect to the microscopic anyon hilbert space? On what does it act? Neighbouring sites? 

I’ll make the refinement tensor precise as maps between finite anyonic Hilbert spaces, emphasizing block coarse-graining versus operators on a fixed chain.

For TL/Ising, the new point is that refinement must use a two-σσ unit cell: σ↛σ⊗σσ→σ⊗σ, but two σσ’s can refine to four preserving boundary channel.

Yes — the refinement tensor has to be an inter-scale map between your microscopic anyon Hilbert spaces. It is not first a Hamiltonian term, and it is not first an operator on the CFT Hilbert space.

The clean formulation is:
RN:HN⟶H2N
RN​:HN​⟶H2N​​

where RNRN​ refines a chain of NN coarse cells into a chain of 2N2N fine cells. Locally, it is built from a tensor
w:Q⟶Q⊗Q
w:Q⟶Q⊗Q​

possibly together with nearest-neighbor disentanglers
u:Q⊗Q⟶Q⊗Q.
u:Q⊗Q⟶Q⊗Q.​

Here QQ is the one-site categorical object encoding the allowed microscopic charges at a lattice cell.
1. Package the indefinite-anyon Hilbert space as Hom⁡(c,Q⊗N)Hom(c,Q⊗N)

Instead of writing the direct sum over occupied subsets every time, define
Q=⨁a∈Irr⁡(C)a.
Q=a∈Irr(C)⨁​a.

The vacuum object 11 is the empty site. Then
Q⊗N=⨁a1,…,aN∈Irr⁡(C)a1⊗⋯⊗aN.
Q⊗N=a1​,…,aN​∈Irr(C)⨁​a1​⊗⋯⊗aN​.

So the finite-chain Hilbert space is
HN(c)=Hom⁡C(c,  Q⊗N),
HN​(c)=HomC​(c,Q⊗N),

and the full total-charge-summed space is
HN=⨁c∈Irr⁡(C)Hom⁡C(c,  Q⊗N).
HN​=c∈Irr(C)⨁​HomC​(c,Q⊗N).

Expanding Q⊗NQ⊗N, this is exactly
HN=⨁a1,…,aN⨁cHom⁡C(c,  a1⊗⋯⊗aN).
HN​=a1​,…,aN​⨁​c⨁​HomC​(c,a1​⊗⋯⊗aN​).

So your indefinite-particle Hilbert space is just the QQ-chain Hilbert space, with 11 interpreted as vacancy.
2. The elementary refinement tensor is w:Q→Q⊗Qw:Q→Q⊗Q

A binary refinement tensor is a categorical morphism
w:Q⟶Q⊗Q.
w:Q⟶Q⊗Q.

Its components are
wabc,μ∈C
wabc,μ​∈C

multiplying basis morphisms
τabc,μ:a⟶b⊗c,μ=1,…,Nbca.
τabc,μ​:a⟶b⊗c,μ=1,…,Nbca​.

So
w∣a=∑b,c,μwabc,μ τabc,μ.
w∣a​=b,c,μ∑​wabc,μ​τabc,μ​.

Equivalently,
w=∑a,b,c,μwabc,μ τabc,μ.
w=a,b,c,μ∑​wabc,μ​τabc,μ​.

This is the precise local tensor.

It acts on one coarse site and replaces it by two neighboring fine sites:
coarse cell carrying a↦fine pair carrying b,c with a⊂b⊗c.
coarse cell carrying a↦fine pair carrying b,c with a⊂b⊗c.​

Its adjoint
w†:Q⊗Q→Q
w†:Q⊗Q→Q

acts on two neighboring fine sites and coarse-grains them into one coarse site.

So: yes, the adjoint coarse-graining acts on neighboring sites. The refinement itself acts from one site to a neighboring pair.

The local isometry condition is
w†w=id⁡Q.
w†w=idQ​.

In components, this says that for each coarse charge aa, the allowed splittings a→b⊗ca→b⊗c define an orthonormal vector in
⨁b,cHom⁡(a,b⊗c).
b,c⨁​Hom(a,b⊗c).

This condition is entirely local.
3. The global refinement map RN:HN→H2NRN​:HN​→H2N​

Given
ξ∈Hom⁡(c,Q⊗N),
ξ∈Hom(c,Q⊗N),

define
RN(0)ξ=αN∘w⊗N∘ξ.
RN(0)​ξ=αN​∘w⊗N∘ξ.

Here
w⊗N:Q⊗N→(Q⊗Q)⊗N
w⊗N:Q⊗N→(Q⊗Q)⊗N

and
αN:(Q⊗Q)⊗N→Q⊗2N
αN​:(Q⊗Q)⊗N→Q⊗2N

is the fixed associativity/rebracketing convention.

Thus
RN(0):Hom⁡(c,Q⊗N)⟶Hom⁡(c,Q⊗2N).
RN(0)​:Hom(c,Q⊗N)⟶Hom(c,Q⊗2N).

This preserves total charge cc. It also respects the anyonic fusion constraints automatically because ww is a morphism in CC.

So the first answer is:
RN is obtained by inserting one copy of w:Q→Q⊗Q at every coarse site.
RN​ is obtained by inserting one copy of w:Q→Q⊗Q at every coarse site.​
4. MERA version: add nearest-neighbor disentanglers uu

A pure tree tensor network would use only ww. A MERA layer also includes local unitaries
u:Q⊗Q⟶Q⊗Q.
u:Q⊗Q⟶Q⊗Q.

In categorical components, uu is block diagonal by total charge. For each xx, define
Kx=⨁a,bHom⁡(x,a⊗b).
Kx​=a,b⨁​Hom(x,a⊗b).

Then
ux:Kx→Kx
ux​:Kx​→Kx​

must be unitary.

In components,
u=∑x∑a,b,a′,b′∑μ,νUa′b′ν,  abμx  τxa′b′,ν(τxab,μ)†.
u=x∑​a,b,a′,b′∑​μ,ν∑​Ua′b′ν,abμx​τxa′b′,ν​(τxab,μ​)†.

The condition is
Ux∈U(Kx)
Ux∈U(Kx​)

for every total charge xx.

This uu acts on two neighboring fine sites, usually across the boundary between two blocks. So a binary MERA refinement layer is
RN=UN∘RN(0),
RN​=UN​∘RN(0)​,

where
UN=∏iu2i,2i+1.
UN​=i∏​u2i,2i+1​.

The product is over disjoint neighboring fine-site pairs. For periodic chains there is also the wrap-around disentangler.

Thus
RN=(∏iu2i,2i+1)∘αN∘w⊗N.
RN​=(i∏​u2i,2i+1​)∘αN​∘w⊗N.​

This is the anyonic version of a scale-invariant MERA layer. Existing anyonic MERA constructions use precisely this kind of charge-compatible tensor-network dictionary, and scaling operators are obtained from the corresponding anyonic scaling superoperator.
5. Local observables and the ascending map

A local observable supported on rr consecutive microscopic cells is a morphism
O∈End⁡C(Q⊗r).
O∈EndC​(Q⊗r).

As an operator on
HN(c)=Hom⁡(c,Q⊗N),
HN​(c)=Hom(c,Q⊗N),

it acts by postcomposition:
ξ⟼(id⁡Q⊗j⊗O⊗id⁡Q⊗N−j−r)∘ξ.
ξ⟼(idQ⊗j​⊗O⊗idQ⊗N−j−r​)∘ξ.

The refinement RNRN​ induces an operator RG map by sandwiching:
A(O)=Rloc† O Rloc.
A(O)=Rloc†​ORloc​.

Here RlocRloc​ is the part of the MERA layer lying in the causal cone of OO.

For a pure TTN with only ww, the simplest local formula is
A1:End⁡(Q⊗Q)→End⁡(Q),
A1​:End(Q⊗Q)→End(Q),
A1(O)=w†Ow.
A1​(O)=w†Ow.​

So a two-site fine operator becomes a one-site coarse operator.

With a MERA disentangler, a typical two-block formula is
A2(O)=(w†⊗w†) Ucone† O Ucone (w⊗w),
A2​(O)=(w†⊗w†)Ucone†​OUcone​(w⊗w),​

where UconeUcone​ is the finite product of nearby uu’s touching the support of OO.

In a scale-invariant MERA, one chooses a stable local operator space, for example
Ar=End⁡(Q⊗r),
Ar​=End(Q⊗r),

large enough that the causal cone maps rr-site operators back to rr-site operators. Then
A:Ar→Ar
A:Ar​→Ar​

is a finite local linear map.

The scaling operators are eigenoperators:
A(Φα)=2−ΔαΦα.
A(Φα​)=2−Δα​Φα​.​

This is the precise meaning of “the ascending spectrum reproduces the CFT scaling dimensions.” Scale-invariant MERA uses exactly this logic: the scaling superoperator identifies relevant perturbations and local scaling operators, and finite-bond MERA retains only finitely many low-dimension fields, while an exact description requires infinite bond dimension.
6. Where the state comes from

The state is the fixed point of the dual channel.

If
A:Ar→Ar
A:Ar​→Ar​

acts on observables, its dual
D:Ar∗→Ar∗
D:Ar∗​→Ar∗​

acts on local density matrices or local states.

The local fixed state satisfies
D(ρ)=ρ.
D(ρ)=ρ.​

Equivalently, in expectation-value notation,
ω(O)=ω(A(O)).
ω(O)=ω(A(O)).

This is the ground-state facsimile. It is not obtained by diagonalizing a Hamiltonian. It is obtained by solving a local fixed-point equation for the descending channel.

Then the nn-point functions are computed by repeatedly applying AA and evaluating against ρρ.
7. OPE coefficients from the same local tensor

Once we have scaling eigenoperators
Φα,Φβ,Φγ,
Φα​,Φβ​,Φγ​,

their OPE coefficients are computed by multiplying two local scaling operators, pulling the result back through the same local RG map, and projecting onto the scaling basis.

Define an inner product using the fixed density matrix:
⟨O1,O2⟩ρ=tr⁡ρ(O1†O2).
⟨O1​,O2​⟩ρ​=trρ​(O1†​O2​).

Then the finite tensor-network contraction
M(Φα,Φβ)
M(Φα​,Φβ​)

means: place ΦαΦα​ and ΦβΦβ​ in a fixed short-distance configuration inside a causal cone, multiply them as local operators, and coarse-grain back to the stable operator space.

Then
Cαβγ=⟨Φγ,M(Φα,Φβ)⟩ρ.
Cαβγ​=⟨Φγ​,M(Φα​,Φβ​)⟩ρ​.​

This is local: it involves only ww, uu, FF-moves, and the fixed local density matrix ρρ. The standard scale-invariant MERA literature uses this same structure to extract correlators and OPE data from the scaling superoperator.

So the conformal check is not a global spectral check. It is a set of finite tensor equations:
A(Φα)=2−ΔαΦα,
A(Φα​)=2−Δα​Φα​,
Cαβγ=Cαβγ,RCFT,
Cαβγ​=Cαβγ,RCFT​,
D(ρ)=ρ.
D(ρ)=ρ.
8. Charged and defect sectors

Neutral local fields live in
End⁡(Q⊗r).
End(Q⊗r).

But a full RCFT also has fields living in defect sectors. For those, the correct local operator spaces are charged intertwiner spaces, schematically
Ar(yL,yR)=Hom⁡C(yL⊗Q⊗r,  Q⊗r⊗yR).
Ar​(yL​,yR​)=HomC​(yL​⊗Q⊗r,Q⊗r⊗yR​).

The labels yL,yRyL​,yR​ are topological charges entering and leaving the local operator. The ascending map preserves or fuses these charge labels according to the category.

This is important: the scaling fields are not merely ordinary operators. They can be defect-changing or charge-carrying operators. In anyonic MERA computations, local scaling operators are classified by external charge labels on the causal cone, and those charge sectors can correspond to different CFT sectors, including chiral sectors.

So the full local scaling problem is:
AyL,yR:Ar(yL,yR)→Ar(yL,yR),
AyL​,yR​​:Ar​(yL​,yR​)→Ar​(yL​,yR​),

with
AyL,yR(Φα)=2−ΔαΦα.
AyL​,yR​​(Φα​)=2−Δα​Φα​.
9. What this means in the Temperley–Lieb / Ising example

For Ising/TL,
Irr⁡(C)={1,σ,ψ}.
Irr(C)={1,σ,ψ}.

For the full mobile anyon Hilbert space, take
Q=1⊕σ⊕ψ.
Q=1⊕σ⊕ψ.

Then
HN(c)=Hom⁡(c,  Q⊗N).
HN​(c)=Hom(c,Q⊗N).

The local refinement tensor is
w:Q→Q⊗Q.
w:Q→Q⊗Q.

Its allowed components are determined by Ising fusion.

For a=1a=1,
1→1⊗1,
1→1⊗1,
1→σ⊗σthrough the 1 channel,
1→σ⊗σthrough the 1 channel,
1→ψ⊗ψ.
1→ψ⊗ψ.

For a=σa=σ,
σ→1⊗σ,
σ→1⊗σ,
σ→σ⊗1,
σ→σ⊗1,
σ→ψ⊗σ,
σ→ψ⊗σ,
σ→σ⊗ψ.
σ→σ⊗ψ.

But
σ↛σ⊗σ,
σ→σ⊗σ,

because
σ⊗σ=1⊕ψ
σ⊗σ=1⊕ψ

does not contain σσ.

For a=ψa=ψ,
ψ→1⊗ψ,
ψ→1⊗ψ,
ψ→ψ⊗1,
ψ→ψ⊗1,
ψ→σ⊗σthrough the ψ channel.
ψ→σ⊗σthrough the ψ channel.

So in the full mobile Hilbert space, ww literally says how a coarse cell carrying 1,σ,ψ1,σ,ψ refines into two adjacent fine cells.

Notably, w1w1​ can include
1→σ⊗σ,
1→σ⊗σ,

which is neutral pair creation under refinement. That is exactly the kind of operation your indefinite-particle Hilbert space was designed to allow.
10. Dense TL needs blocking

In the dense TL chain, every microscopic site carries σσ:
HNdense(c)=Hom⁡(c,σ⊗N).
HNdense​(c)=Hom(c,σ⊗N).

But there is no nonzero map
σ→σ⊗σ.
σ→σ⊗σ.

Therefore a binary refinement cannot act directly as
σ↦σσ.
σ↦σσ.

So for the dense TL model, the correct scale-2 refinement acts after blocking two σσ-sites into one coarse cell:
Qblk=σ⊗σ≅1⊕ψ.
Qblk​=σ⊗σ≅1⊕ψ.

Then
Hom⁡(c,Qblk⊗M)≅Hom⁡(c,σ⊗2M).
Hom(c,Qblk⊗M​)≅Hom(c,σ⊗2M).

The blocked refinement tensor is
wblk:Qblk→Qblk⊗Qblk.
wblk​:Qblk​→Qblk​⊗Qblk​.

Since
Qblk=1⊕ψ,
Qblk​=1⊕ψ,

this is essentially a Z2Z2​-graded splitting tensor. At the topological level,
1→1⊗1orψ⊗ψ,
1→1⊗1orψ⊗ψ,
ψ→1⊗ψorψ⊗1.
ψ→1⊗ψorψ⊗1.

Thus one blocked coarse cell, i.e. two original σσ-anyons, refines into two blocked fine cells, i.e. four original σσ-anyons.

So in the dense TL case:
wblk† acts on two neighboring blocked cells, i.e. four neighboring original σ sites.
wblk†​ acts on two neighboring blocked cells, i.e. four neighboring original σ sites.​

The TL Hamiltonian density
ei=2 Pi(1)
ei​=2
​Pi(1)​

is a separate local observable acting on two neighboring original σσ-sites. It is not the refinement tensor. It is one of the local operators whose scaling behavior is tested under the ascending map generated by wblkwblk​ and uu.
11. What is actually “locally checkable”?

Given ww, uu, and the fixed associator/FF-symbols, every check is finite.

The local data are:
w:Q→Q⊗Q,
w:Q→Q⊗Q,
u:Q⊗Q→Q⊗Q,
u:Q⊗Q→Q⊗Q,
ρ∈Ar∗,
ρ∈Ar∗​,

and candidate scaling operators
Φα∈Ar(yL,yR).
Φα​∈Ar​(yL​,yR​).

The equations are:
w†w=id⁡Q,
w†w=idQ​,
u†u=uu†=id⁡Q⊗Q,
u†u=uu†=idQ⊗Q​,
D(ρ)=ρ,
D(ρ)=ρ,
A(Φα)=2−ΔαΦα,
A(Φα​)=2−Δα​Φα​,
Cαβγ=Cαβγ,RCFT,
Cαβγ​=Cαβγ,RCFT​,

and for the stress tensor,
CTT1=c2.
CTT1​=2c​.

All of these are finite contractions of the same local tensors.

For Ising, one would require
ΔΣ=18,
ΔΣ​=81​,
Δε=1,
Δε​=1,
ΔT=2,
ΔT​=2,
CΣΣε=12,
CΣΣε​=21​,
CTT1=14,
CTT1​=41​,

because
c=12.
c=21​.

The exact RCFT fixed-point tensor literature gives a complementary Euclidean construction: the fixed-point tensor can be defined as a correlation function of boundary-changing operators on triangles, and for Ising-type examples it recovers scaling dimensions from that tensor. But for the Hamiltonian/Koo–Saleur program, the object you want is the isometric refinement RN:HN→H2NRN​:HN​→H2N​, because it directly gives the fixed state and the local observable RG map.
12. The key correction to my earlier vagueness

The tensor is not just an abstract “CFT tensor.”

For the microscopic anyon Hilbert space, the precise object is:
w:Q→Q⊗Q
w:Q→Q⊗Q​

plus optionally
u:Q⊗Q→Q⊗Q.
u:Q⊗Q→Q⊗Q.​

It acts as follows:
refinement: one coarse site → two neighboring fine sites;
refinement: one coarse site → two neighboring fine sites;​
coarse-graining: two neighboring fine sites → one coarse site;
coarse-graining: two neighboring fine sites → one coarse site;​
MERA disentangler: two neighboring fine sites → two neighboring fine sites.
MERA disentangler: two neighboring fine sites → two neighboring fine sites.​

Then the global inter-scale embedding is
RN=(∏iu2i,2i+1)∘αN∘w⊗N:HN→H2N.
RN​=(i∏​u2i,2i+1​)∘αN​∘w⊗N:HN​→H2N​.​

The scaling dimensions and OPE data are not properties of ww alone. They are properties of the induced local ascending channel
A(O)=Rloc†ORloc.
A(O)=Rloc†​ORloc​.​

That is the precise bridge from the microscopic anyon Hilbert space to the RCFT conformal data.

so this is all what I would call obvious. In particular Q and the ascending channels etc. What I want is tosolver these equations for temperley lieb. I don't mind if I ahve to write a computer program. I am not sold on needing MERA. 
*Actually* What I *really* want is a refinement map which is not a tree at all. For a single scalr function this is easy: interpolation. It is effectively canonical. What I would love is a many-particle anyon version of interpolation. It is not so ridiculous: single tau particles stay around. The only mechanism to create particles is the vacuum to tau tau channel

I’ll switch to an interpolation-style refinement on the mobile-anyon Hilbert space: old particles persist under lattice doubling, and only neutral pairs are inserted in new gaps. For Temperley–Lieb/Fibonacci this becomes a finite algebraic ansatz with amplitudes you can solve numerically.

Yes — the refinement object you want is not a MERA tensor and not a one-site tree map. It is a subdivision/interpolation kernel
JN:HN⟶H2N
JN​:HN​⟶H2N​

whose matrix element is nonzero exactly when a fine configuration is obtained from a coarse one by:
old τ particles persist+extra particles are inserted only as neutral ττ pairs.
old τ particles persist+extra particles are inserted only as neutral ττ pairs.​

That is the correct anyonic analogue of scalar interpolation.

I will spell it out for the Temperley–Lieb/Fibonacci case
τ⊗τ≅1⊕τ,
τ⊗τ≅1⊕τ,

with
dτ=φ=1+52.
dτ​=φ=21+5
​​.

For Ising/TL A3A3​, replace ττ by σσ, dτdτ​ by 22
​, and τ⊗τ=1⊕ψτ⊗τ=1⊕ψ. The formulas are almost identical, but your wording “ττ” naturally points to Fibonacci/TL A4A4​.
1. The microscopic Hilbert spaces

Take a finite 1D lattice of NN sites. Each site is either vacant or occupied by one ττ-anyon. Write
0≡1,1≡τ.
0≡1,1≡τ.

For an occupancy string
q=(q1,…,qN)∈{0,1}N,
q=(q1​,…,qN​)∈{0,1}N,

let
∣q∣=#{i:qi=1}.
∣q∣=#{i:qi​=1}.

The fusion space in total charge c∈{1,τ}c∈{1,τ} is
HN(q;c)=Hom⁡C(c,  τ⊗∣q∣).
HN​(q;c)=HomC​(c,τ⊗∣q∣).

The full finite Hilbert space is
HN(c)=⨁q∈{0,1}NHom⁡(c,τ⊗∣q∣).
HN​(c)=q∈{0,1}N⨁​Hom(c,τ⊗∣q∣).​

Then
HN=HN(1)⊕HN(τ).
HN​=HN​(1)⊕HN​(τ).

A basis vector is
∣q;x0,x1,…,xk⟩,
∣q;x0​,x1​,…,xk​⟩,

where k=∣q∣k=∣q∣, and
xj∈{1,τ}
xj​∈{1,τ}

is the cumulative fusion channel after fusing the first jj occupied sites in increasing order. The path starts at
x0=1
x0​=1

and ends at
xk=c.
xk​=c.

The allowed transitions are
1→ττ,
1τ
​τ,
τ→τ1,τ→ττ.
ττ
​1,ττ
​τ.

Equivalently, there are no two consecutive 11’s in the fusion path.
2. The elementary TL pair-creation map

The only allowed particle-number-changing operation is the coevaluation
coev⁡τ:1⟶τ⊗τ,
coevτ​:1⟶τ⊗τ,

with the ττττ pair in the vacuum fusion channel.

Suppose we have a fusion path
x0,…,xk.
x0​,…,xk​.

Insert a neutral adjacent ττττ pair after the rr-th existing ττ-particle. This gives a map
Cr:Hom⁡(c,τ⊗k)⟶Hom⁡(c,τ⊗(k+2)).
Cr​:Hom(c,τ⊗k)⟶Hom(c,τ⊗(k+2)).

The action is:
Cr∣x0,…,xk⟩=∑zAxr,z  ∣x0,…,xr,z,xr,xr+1,…,xk⟩.
Cr​∣x0​,…,xk​⟩=z∑​Axr​,z​∣x0​,…,xr​,z,xr​,xr+1​,…,xk​⟩.​

The coefficient Ax,zAx,z​ is determined by the Fibonacci FF-matrix. Explicitly,
A1,τ=1,
A1,τ​=1,

and
Aτ,1=φ−1,Aτ,τ=φ−1/2.
Aτ,1​=φ−1,Aτ,τ​=φ−1/2.

These satisfy
∣Aτ,1∣2+∣Aτ,τ∣2=φ−2+φ−1=1.
∣Aτ,1​∣2+∣Aτ,τ​∣2=φ−2+φ−1=1.

So CrCr​ is an isometric pair-insertion map.

This is the first crucial nontrivial TL formula. When the ambient cumulative charge is 11, the inserted pair is forced:
1⟶τ⟶1.
1⟶τ⟶1.

When the ambient cumulative charge is ττ, the inserted vacuum pair has two possible left-associated expansions:
τ⟶1⟶τ,
τ⟶1⟶τ,

and
τ⟶τ⟶τ.
τ⟶τ⟶τ.

The amplitudes are
φ−1andφ−1/2.
φ−1andφ−1/2.

Diagrammatically, this is just the FF-move
Fττττ=(φ−1φ−1/2φ−1/2−φ−1).
Fττττ​=(φ−1φ−1/2​φ−1/2−φ−1​).

The adjoint
Cr†
Cr†​

annihilates an adjacent ττττ pair only in the vacuum channel.

The local vacuum-pair projector is
Pr(1)=CrCr†.
Pr(1)​=Cr​Cr†​.

The corresponding TL generator is
er=dτPr(1)=φPr(1).
er​=dτ​Pr(1)​=φPr(1)​.

Thus
er2=φer.
er2​=φer​.
3. The non-tree interpolation map

The tree map would independently refine each coarse site. That is not what we want.

Instead define the subdivision map in two stages:
JN=B2N EN.
JN​=B2N​EN​.​

Here ENEN​ is the strict persistence embedding, and B2NB2N​ creates neutral ττττ pairs on the refined lattice.
3.1 Strict persistence embedding

The map
EN:HN→H2N
EN​:HN​→H2N​

places each old ττ on the even sublattice and inserts vacancies at the new sites:
qi=1↦q~2i=1,
qi​=1↦q
​2i​=1,
qi=0↦q~2i=0,
qi​=0↦q
​2i​=0,

and
q~2i+1=0.
q
​2i+1​=0.

The fusion path is unchanged.

So old ττ-particles do not split. They stay around.
3.2 Pair creation on the fine lattice

Now define
B2N
B2N​

by summing over matchings of empty neighboring fine sites.

Let MM be a collection of disjoint nearest-neighbor fine edges
e=(j,j+1)
e=(j,j+1)

such that both endpoints are vacant before insertion. For each such edge, insert a neutral ττττ pair using the coevaluation map CeCe​.

Then
B2N=∑M(∏e∈Mλe)CM,
B2N​=M∑​(e∈M∏​λe​)CM​,​

where
CM=∏e∈MCe.
CM​=e∈M∏​Ce​.

The product is taken in increasing spatial order. Since the pairs are disjoint and noncrossing, no braiding is needed.

Thus
JN=∑M(∏e∈Mλe)CMEN.
JN​=M∑​(e∈M∏​λe​)CM​EN​.​

This is the many-particle anyon interpolation kernel.

It has the exact structure you asked for:
old τ particles persist;
old τ particles persist;​
the only new particles come from 1→ττ.
the only new particles come from 1→ττ.​

And it is not a tree if the allowed edges ee include both intra-cell and inter-cell fine edges.

The tree/dimerized version would only allow, say,
e=(2i,2i+1).
e=(2i,2i+1).

The non-tree interpolation also allows
e=(2i+1,2i+2).
e=(2i+1,2i+2).

That is the first place where the construction becomes genuinely different from a product of one-site refinement tensors.
4. The first nontrivial TL obstruction: overlaps

Now comes the crucial point.

If pair creation is allowed across all fine nearest-neighbor edges, then the map JNJN​ is generally not automatically isometric.

This is not a bug. It is exactly analogous to ordinary interpolation: the interpolation map is local and canonical, but its image basis is not automatically orthonormal. One then has a Gram matrix, or “mass matrix,” to deal with.

The TL overlap already appears in the smallest nontrivial example.

Consider two neighboring coarse one-ττ states:
∣i⟩,∣i+1⟩.
∣i⟩,∣i+1⟩.

Under strict persistence,
∣i⟩↦∣τ at 2i⟩,
∣i⟩↦∣τ at 2i⟩,
∣i+1⟩↦∣τ at 2i+2⟩.
∣i+1⟩↦∣τ at 2i+2⟩.

Now allow pair creation on all fine nearest-neighbor edges.

The final fine configuration
τ  τ  τ
τττ

at sites
2i,  2i+1,  2i+2
2i,2i+1,2i+2

can arise in two different ways.

From ∣i⟩∣i⟩, the old ττ is on the left, and the created vacuum pair is on the right:
τ⊗(ττ)1.
τ⊗(ττ)1​.

From ∣i+1⟩∣i+1⟩, the created vacuum pair is on the left, and the old ττ is on the right:
(ττ)1⊗τ.
(ττ)1​⊗τ.

These two states are not orthogonal. Their inner product is the Fibonacci FF-matrix entry
⟨(ττ)1τ|τ(ττ)1⟩=φ−1.
⟨(ττ)1​τ∣τ(ττ)1​⟩=φ−1.​

Therefore, if the pair-creation amplitudes are uniform,
λe=λ,
λe​=λ,

then
⟨JN∣i⟩,JN∣i+1⟩⊃∣λ∣2φ−1.
⟨JN​∣i⟩,JN​∣i+1⟩⊃∣λ∣2φ−1.​

So strict persistence plus non-tree uniform pair creation gives
JN†JN≠1
JN†​JN​=1

unless
λ=0
λ=0

or unless one adds compensating interpolation side-lobes / Gram orthogonalization.

This is the precise TL equation that was hidden in the vague “refinement tensor” discussion.

The non-tree interpolation is possible, but the FF-symbols force a nontrivial Gram matrix.
5. Two ways to solve the Gram problem

There are two reasonable routes.
Route A: accept non-orthogonal interpolation and use the Gram matrix

Define
GN=JN†JN.
GN​=JN†​JN​.

Then the true isometric refinement is
IN=JNGN−1/2.
IN​=JN​GN−1/2​.​

This is exactly analogous to finite-element interpolation: the local interpolation basis has a mass matrix, and the Hilbert-space embedding uses that mass matrix.

The pullback of a fine observable OO is then
AN(O)=GN−1/2JN†OJNGN−1/2.
AN​(O)=GN−1/2​JN†​OJN​GN−1/2​.​

Equivalently, using the non-orthogonal interpolation directly,
AN(O)=GN−1JN†OJN
AN​(O)=GN−1​JN†​OJN​

in a Galerkin convention.

This is probably the cleanest route. It does not force an artificial tree structure.

The practical question is whether GN−1/2GN−1/2​ is local or quasi-local. Since JNJN​ is a finite-range TL/MPO map, GNGN​ is a finite-range positive MPO on the coarse lattice. If its transfer matrix is gapped, then GN−1/2GN−1/2​ should be exponentially local. Numerically, this is directly checkable.
Route B: build orthogonality into the interpolation filter

Instead of strict persistence
∣i⟩↦∣2i⟩,
∣i⟩↦∣2i⟩,

allow a one-particle interpolation stencil
S∣i⟩=∑rsr∣2i+r⟩.
S∣i⟩=r∑​sr​∣2i+r⟩.

This still preserves the number of old particles: one old ττ becomes one fine ττ, not two. The extra particles still only come from neutral pair creation.

A minimal reflection-odd side-lobe stencil is
S∣i⟩=b∣2i⟩+a∣2i−1⟩−a∣2i+1⟩.
S∣i⟩=b∣2i⟩+a∣2i−1⟩−a∣2i+1⟩.​

Then
⟨S∣i⟩,S∣i+1⟩=−∣a∣2.
⟨S∣i⟩,S∣i+1⟩=−∣a∣2.

This negative overlap can cancel the positive TL pair-overlap
∣λ∣2φ−1.
∣λ∣2φ−1.

In the one-pair truncation, the local isometry equations become
−∣a∣2+∣b∣2∣λ∣2φ−1=0,
−∣a∣2+∣b∣2∣λ∣2φ−1=0,

and
∣b∣2+2∣a∣2=1.
∣b∣2+2∣a∣2=1.

Solving gives
∣a∣2=∣λ∣2φ+2∣λ∣2,
∣a∣2=φ+2∣λ∣2∣λ∣2​,​
∣b∣2=φφ+2∣λ∣2.
∣b∣2=φ+2∣λ∣2φ​.​

For a general TL object of quantum dimension dd, the same local calculation gives
∣a∣2=∣λ∣2d+2∣λ∣2,∣b∣2=dd+2∣λ∣2.
∣a∣2=d+2∣λ∣2∣λ∣2​,∣b∣2=d+2∣λ∣2d​.​

For Ising/TL A3A3​, d=2d=2
​. For Fibonacci/TL A4A4​, d=φd=φ.

This is not the full solution, because two-pair and longer-overlap diagrams also contribute. But it is the first nontrivial local TL equation, and it already shows what the solution must look like: non-tree pair creation forces wavelet-like side-lobes or a Gram correction.
6. The exact object to solve for

A good finite-range ansatz is therefore:
JN(θ)=B2N(λeven,λodd,… ) EN(S).
JN​(θ)=B2N​(λeven​,λodd​,…)EN​(S).​

Here EN(S)EN​(S) moves each old ττ by a one-particle interpolation stencil SS, and B2NB2N​ inserts neutral pairs.

For example,
S∣i⟩=∑r=−RRsr∣2i+r⟩,
S∣i⟩=r=−R∑R​sr​∣2i+r⟩,

with the order of particles preserved.

The pair part is
B2N=∑M(∏e∈Mλe)CM.
B2N​=M∑​(e∈M∏​λe​)CM​.

A minimal translation-covariant choice is
λe=λ
λe​=λ

for all fine nearest-neighbor edges.

A less symmetric but easier choice is
λ2i,2i+1=λin,
λ2i,2i+1​=λin​,
λ2i+1,2i+2=λout.
λ2i+1,2i+2​=λout​.

Tree refinement is the special case
λout=0.
λout​=0.

The non-tree interpolation you want has
λout≠0.
λout​=0.​

The parameters to solve for are
θ={sr,λe}.
θ={sr​,λe​}.

The equations are:
GN(θ)=JN(θ)†JN(θ)≈1
GN​(θ)=JN​(θ)†JN​(θ)≈1​

if one wants a directly isometric interpolation, or else compute
IN(θ)=JN(θ)GN(θ)−1/2.
IN​(θ)=JN​(θ)GN​(θ)−1/2.

Then define the ascending map
Aθ(O)=IN(θ)†OIN(θ).
Aθ​(O)=IN​(θ)†OIN​(θ).​

Equivalently,
Aθ(O)=GN−1/2JN†OJNGN−1/2.
Aθ​(O)=GN−1/2​JN†​OJN​GN−1/2​.

Scaling operators satisfy
Aθ(Φα)=2−ΔαΦα.
Aθ​(Φα​)=2−Δα​Φα​.​

The OPE constants are computed by local contractions:
Cαβγ(θ)=⟨Φγ,Mθ(Φα,Φβ)⟩ρθ.
Cαβγ​(θ)=⟨Φγ​,Mθ​(Φα​,Φβ​)⟩ρθ​​.​

Here ρθρθ​ is the fixed local density matrix of the descending channel:
ρθ=Dθ(ρθ).
ρθ​=Dθ​(ρθ​).

So the numerical problem is:
Find θ such that Spec⁡(Aθ) and Cαβγ(θ) match the parent RCFT.
Find θ such that Spec(Aθ​) and Cαβγ​(θ) match the parent RCFT.​

No MERA is needed. This is a subdivision/interpolation inductive system.
7. The local TL formulas needed for a program

The following is the core implementation.

Use labels
0=1,1=τ.
0=1,1=τ.

The Fibonacci pair-insertion coefficients are:

from math import sqrt

phi = (1 + sqrt(5)) / 2

A = {
    0: {1: 1.0},                 # 1 -> tau -> 1
    1: {0: 1/phi, 1: 1/sqrt(phi)} # tau -> 1 -> tau and tau -> tau -> tau
}

A fusion path is a tuple such as

(0, 1, 0, 1, 1)

meaning
x0=1,x1=τ,x2=1,x3=τ,x4=τ.
x0​=1,x1​=τ,x2​=1,x3​=τ,x4​=τ.

Pair insertion after the rr-th particle is:

def insert_pair(path, r):
    """
    Insert a neutral tau-tau pair after particle r.
    path = (x_0,...,x_k), with x_j in {0,1}.
    r ranges from 0 to k.
    Returns list of (new_path, coefficient).
    """
    x = path[r]
    out = []
    for z, coeff in A[x].items():
        new_path = path[:r+1] + (z, x) + path[r+1:]
        out.append((new_path, coeff))
    return out

The allowed path transitions are:

def allowed_next(x):
    if x == 0:
        return [1]
    return [0, 1]

Path enumeration:

def fusion_paths(k, total):
    """
    All Fibonacci fusion paths of k tau particles ending in total charge `total`.
    0 = 1, 1 = tau.
    """
    paths = [(0,)]
    for _ in range(k):
        new = []
        for p in paths:
            for y in allowed_next(p[-1]):
                new.append(p + (y,))
        paths = new
    return [p for p in paths if p[-1] == total]

The local vacuum-pair projector on two adjacent ττ-particles is built from the same vector AA. If the cumulative charge before the two adjacent particles is xx, then the vacuum-pair vector over the intermediate channel zz is
Ax,z.
Ax,z​.

Thus, for x=τx=τ, the projector matrix in the basis z=1,τz=1,τ is
P(1)=(φ−2φ−3/2φ−3/2φ−1).
P(1)=(φ−2φ−3/2​φ−3/2φ−1​).

The TL generator is
e=φP(1).
e=φP(1).

So for x=τx=τ,
e=(φ−1φ−1/2φ−1/21).
e=(φ−1φ−1/2​φ−1/21​).

For x=1x=1, the block is just
e=[φ].
e=[φ].

This gives the exact local TL matrices.
8. What to compute first

The first serious computation should not be the Virasoro algebra. It should be the Gram matrix of the interpolation.

For a chosen ansatz θθ, build
JN(θ):HN→H2N
JN​(θ):HN​→H2N​

for small NN, say N=4,5,6,7,8N=4,5,6,7,8.

Compute
GN(θ)=JN(θ)†JN(θ).
GN​(θ)=JN​(θ)†JN​(θ).

Check whether
GN(θ)≈1.
GN​(θ)≈1.

If not, compute
IN(θ)=JN(θ)GN(θ)−1/2.
IN​(θ)=JN​(θ)GN​(θ)−1/2.

Then build local operators, for example:
nj=projector onto site j occupied by τ,
nj​=projector onto site j occupied by τ,
Cj+Cj†=pair creation/annihilation on edge (j,j+1),
Cj​+Cj†​=pair creation/annihilation on edge (j,j+1),
ej=φPj,j+1(1)=TL projector on adjacent ττ vacuum channel,
ej​=φPj,j+1(1)​=TL projector on adjacent ττ vacuum channel,

and hopping operators
Tj:τ0↔0τ.
Tj​:τ0↔0τ.

These generate the dilute TL local algebra.

Then compute the ascending channel
Aθ(O)=IN(θ)†OIN(θ)
Aθ​(O)=IN​(θ)†OIN​(θ)

on a finite local operator basis.

The scaling spectrum is extracted from
Aθ(Φα)=2−ΔαΦα.
Aθ​(Φα​)=2−Δα​Φα​.

For the Fibonacci/TL A4A4​ minimal-model target, the dense TL critical theory is tricritical Ising,
c=710.
c=107​.

The diagonal bulk dimensions are
Δ=0,340,15,78,65,3,…
Δ=0,403​,51​,87​,56​,3,…

depending on the sector. More generally, for the unitary minimal model M(m,m+1)M(m,m+1),
c=1−6m(m+1)
c=1−m(m+1)6​

and
hr,s=((m+1)r−ms)2−14m(m+1).
hr,s​=4m(m+1)((m+1)r−ms)2−1​.

For the diagonal full CFT,
Δr,s=2hr,s.
Δr,s​=2hr,s​.

So the numerical condition is
eig⁡(Aθ)≈2−Δr,s.
eig(Aθ​)≈2−Δr,s​.
9. The important conceptual point

The interpolation map should be viewed as a kernel
K(Y,β;X,α)
K(Y,β;X,α)

between coarse and fine anyon configurations:
(JNψ)(Y,β)=∑X,αK(Y,β;X,α)ψ(X,α).
(JN​ψ)(Y,β)=X,α∑​K(Y,β;X,α)ψ(X,α).

The kernel is nonzero only when YY can be obtained from XX by:

    moving each old ττ to one fine ττ, often just the same physical point on the even sublattice;

    inserting extra ττ’s in neutral adjacent pairs;

    evaluating the categorical amplitude by TL/Fibonacci FF-moves.

That is the anyonic interpolation rule.

The TL data enters exactly through local overlaps such as
⟨(ττ)1τ|τ(ττ)1⟩=φ−1.
⟨(ττ)1​τ∣τ(ττ)1​⟩=φ−1.

This is the local recoupling number that replaces the ordinary scalar overlap of interpolation basis functions.

So the “equations to solve” are not abstract MERA equations. They are:
TL Gram equations+ascending-spectrum equations+OPE equations.
TL Gram equations+ascending-spectrum equations+OPE equations.​

The first one is already nontrivial and completely local.
10. The concrete minimal research problem

The clean first test is:
JN(λ)=(∑Mλ∣M∣CM)EN.
JN​(λ)=(M∑​λ∣M∣CM​)EN​.​

Here ENEN​ strictly preserves old particles, and MM ranges over all disjoint nearest-neighbor vacant fine edges.

Then compute:
GN(λ)=JN(λ)†JN(λ).
GN​(λ)=JN​(λ)†JN​(λ).

The first local obstruction is
⟨JN∣i⟩,JN∣i+1⟩⊃∣λ∣2φ−1.
⟨JN​∣i⟩,JN​∣i+1⟩⊃∣λ∣2φ−1.

Therefore the strict-persistence map is not an isometry for λ≠0λ=0.

Then either:
IN(λ)=JN(λ)GN(λ)−1/2,
IN​(λ)=JN​(λ)GN​(λ)−1/2,

or use a side-lobe interpolation stencil
S∣i⟩=b∣2i⟩+a∣2i−1⟩−a∣2i+1⟩
S∣i⟩=b∣2i⟩+a∣2i−1⟩−a∣2i+1⟩

with, at first order,
∣a∣2=∣λ∣2φ+2∣λ∣2,∣b∣2=φφ+2∣λ∣2.
∣a∣2=φ+2∣λ∣2∣λ∣2​,∣b∣2=φ+2∣λ∣2φ​.

That is the first actual TL solution.

The full solution is obtained by including all multi-pair overlaps and solving
JN(θ)†JN(θ)=1
JN​(θ)†JN​(θ)=1

or by keeping the Gram correction and solving the conformal equations for
Aθ.
Aθ​.

This is exactly the many-particle anyon analogue of interpolation: the old particles persist, the fine-scale degrees of freedom are filled in by local neutral pair creation, and the recoupling theory supplies the overlap/mass matrix.


