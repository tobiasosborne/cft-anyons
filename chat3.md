ChatGPT

Let's talk about 3- tensors from ope. First carefully read previous chat to understand definitions. Then report back with your concrete understanding of our foundational defining notions 

Thought for 2m 27s

I was able to recover only a limited prior-context trace, but it does confirm the core framework: OPE tensors, fusion rules, and FF-symbol associativity, with an SU(2)3SU(2)3​-style example appearing previously. Here is my concrete understanding of the foundational definitions we are using.
My understanding of “3-tensors from OPE”

A 3-tensor from OPE is not just an arbitrary rank-3 array. It is the coefficient object that appears when two local operators, fields, or anyonic excitations are brought close together and replaced by a sum over effective local sectors.

The schematic OPE is
Oai(x) Obj(0)  ∼  ∑c,k,μCa,i; b,j c,k,μ(x) Ock(0).
Oai​(x)Obj​(0)∼c,k,μ∑​Ca,i;b,jc,k,μ​(x)Ock​(0).

Here:
a,b,c
a,b,c

are anyon / topological / operator-sector labels,
i,j,k
i,j,k

are possible microscopic, internal, descendant, or local-state indices within those sectors, and
μ=1,…,Nabc
μ=1,…,Nabc​

is a fusion-channel multiplicity index when the fusion a×b→ca×b→c occurs in more than one independent way.

After stripping away the purely kinematic or coordinate dependence, the essential OPE datum is a three-legged object
Tabc,μ
Tabc,μ​

or in components
(Tabc,μ)ijk.
(Tabc,μ​)ijk​.

Equivalently, it is a map
Tabc,μ:Va⊗Vb→Vc.
Tabc,μ​:Va​⊗Vb​→Vc​.

So the “3” in “3-tensor” means: two incoming sectors and one outgoing sector, i.e. a trivalent fusion/OPE vertex.
Fusion rules are the support of the OPE tensors

The OPE tensors are constrained by the fusion rules
a×b=∑cNabc c.
a×b=c∑​Nabc​c.

The integer
Nabc
Nabc​

counts the number of independent OPE/fusion channels from a,ba,b into cc.

So:
Nabc=0
Nabc​=0

means the corresponding OPE tensor vanishes:
Tabc,μ=0.
Tabc,μ​=0.

If
Nabc=1,
Nabc​=1,

then there is one independent trivalent tensor, up to normalization or gauge choice.

If
Nabc>1,
Nabc​>1,

then there is a genuine multiplicity space
Vabc≅CNabc,
Vabc​≅CNabc​,

and the OPE tensor carries an additional channel label μμ.
The tensor is a structure constant for operator multiplication

Another equivalent viewpoint is that the local operators form a graded algebra-like object, and the OPE coefficients are its structure constants.

If we write a basis of local operators as OAOA​, where AA packages sector and internal indices, then
OAOB∼∑CCABC OC.
OA​OB​∼C∑​CABC​OC​.

The object
CABC
CABC​

is a rank-3 structure tensor. In anyonic language, the labels A,B,CA,B,C are not plain vector-space labels; they are organized by superselection sectors and fusion rules.

So the OPE 3-tensor is simultaneously:
OPE coefficient=fusion vertex=multiplication structure constant=local short-distance replacement rule.
OPE coefficient=fusion vertex=multiplication structure constant=local short-distance replacement rule.
The vacuum sector acts as the unit

There is a distinguished vacuum / trivial sector, usually denoted
1.
1.

It satisfies
1×a=a,a×1=a.
1×a=a,a×1=a.

At the OPE-tensor level this means there are canonical unit tensors
T1 aa,Ta 1a,
T1aa​,Ta1a​,

which act like identity maps on the sector aa.

In operator language,
O1 Oa∼Oa,Oa O1∼Oa.
O1​Oa​∼Oa​,Oa​O1​∼Oa​.
Duals and annihilation channels

For each anyon type aa, there is typically a dual or antiparticle type
aˉ.
aˉ.

The vacuum appears in
a×aˉ→1.
a×aˉ→1.

So one important OPE channel is the annihilation channel
Taaˉ1.
Taaˉ1​.

This is the categorical analogue of a two-point pairing. If a nondegenerate pairing is chosen, one can lower or raise indices and write the same OPE tensor in different forms, for example
Cabc
Cabc​

or
Cabc.
Cabc​.

Those are not fundamentally different data; they differ by the choice of pairing / metric / duality convention.
Associativity is not automatic: it is controlled by FF-symbols

Given three nearby operators, there are two natural ways to fuse them.

First fuse aa and bb, then fuse the result with cc:
(a×b)×c.
(a×b)×c.

Or first fuse bb and cc, then fuse aa with the result:
a×(b×c).
a×(b×c).

At the tensor level, these correspond to two different contractions of OPE 3-tensors:
Tabe∘Tecd
Tabe​∘Tecd​

versus
Tbcf∘Tafd.
Tbcf​∘Tafd​.

These two bases of the same four-point fusion space are related by an FF-move:
(TabeTecd)=∑f(Fdabc)ef(TbcfTafd).
(Tabe​Tecd​)=f∑​(Fdabc​)ef​(Tbcf​Tafd​).

So the FF-symbols encode the associativity transformation between different OPE expansion channels.

The prior context apparently included an SU(2)3SU(2)3​-type 5×55×5 unitary FF-matrix. In that setting, the important point is that the FF-matrix is not merely decorative: it is the transition matrix between two different trivalent-tensor contraction bases.
Consistency requires the pentagon equation

Because four or more operators can be fused in many orders, the FF-symbols must satisfy the pentagon identity.

Conceptually:
all ways of reassociating (((ab)c)d) to (a(b(cd)))
all ways of reassociating (((ab)c)d) to (a(b(cd)))

must agree.

This is the categorical version of associativity coherence. Without the pentagon equation, the OPE tensors would give ambiguous answers for higher products.

So the foundational package is not only the 3-tensors TabcTabc​, but also their compatibility data:
{Nabc,  Tabc,μ,  Fdabc}.
{Nabc​,Tabc,μ​,Fdabc​}.
Gauge freedom / basis dependence

The individual OPE tensors depend on choices of basis in the fusion spaces
Vabc.
Vabc​.

Changing the basis changes the components of the tensors and the FF-symbols. This is a gauge transformation of the categorical data.

So the raw components
(Tabc,μ)ijk
(Tabc,μ​)ijk​

are generally not absolute physical invariants. Gauge-invariant content comes from consistent contractions, fusion multiplicities, braiding phases, modular data, correlators, or other closed diagrams.

In simple multiplicity-free cases, where
Nabc∈{0,1},
Nabc​∈{0,1},

this gauge freedom often reduces to phase or normalization choices for each trivalent vertex.
Braiding is related but separate

Because the project concerns mobile anyons, exchanging two anyons can matter. That introduces braiding data, usually RR-symbols:
Rabc:a×b→b×a
Rabc​:a×b→b×a

within a fixed fusion channel cc.

But the OPE 3-tensor itself is primarily a fusion/OPE datum, not a braiding datum. Fusion says which effective sector appears when two objects are combined. Braiding says what happens when their order or worldlines are exchanged.

The full anyonic structure usually requires both:
F-symbolsandR-symbols,
F-symbolsandR-symbols,

with compatibility enforced by hexagon equations.
Microscopic interpretation

In the “microscopic mobile anyons” setting, I understand the point to be that we are not merely postulating abstract anyon fusion rules. We are trying to interpret these tensors as arising from microscopic local operator products.

So a microscopic local excitation of type aa near one of type bb can be replaced, at longer distances, by an effective excitation of type cc, with amplitude given by the OPE tensor:
a(x) b(0)⇝∑cTabc c(0).
a(x)b(0)⇝c∑​Tabc​c(0).

Thus, the 3-tensor is the local rule for coarse-graining two nearby mobile anyonic excitations into one effective sector.
My compact definition

The cleanest definition I would use is:
An OPE 3-tensor Tabc,μ is a trivalent fusion coefficient/map encoding the local short-distance replacement OaOb∼∑c,μTabc,μOc, with support determined by Nabc.
An OPE 3-tensor Tabc,μ​ is a trivalent fusion coefficient/map encoding the local short-distance replacement Oa​Ob​∼c,μ∑​Tabc,μ​Oc​, with support determined by Nabc​.​

Equivalently,
Tabc,μ∈Hom⁡(a⊗b,c),dim⁡Hom⁡(a⊗b,c)=Nabc.
Tabc,μ​∈Hom(a⊗b,c),dimHom(a⊗b,c)=Nabc​.​

The foundational notions are therefore:
sectors a,b,c;vacuum 1;duals aˉ;fusion rules Nabc;OPE tensors Tabc,μ;associativity F;basis/gauge freedom;braiding R if mobility/exchange is included.
sectors a,b,c;vacuum 1;duals aˉ;fusion rules Nabc​;OPE tensors Tabc,μ​;associativity F;basis/gauge freedom;braiding R if mobility/exchange is included.​

My main uncertainty is that I do not have the full previous transcript available here, so I may be missing project-specific notation choices. But mathematically, this is the concrete structure I understand us to be using.

I’ll set up Fibonacci Q=1⊕τQ=1⊕τ binary refinement equations, separating exactly solvable topological/isometry/coherence constraints from conformal or Wilsonian inputs that require extra data.

Yes. For Fibonacci, the equations split into three layers:
topological algebra equations
topological algebra equations​
geometry/refinement equations
geometry/refinement equations​
conformal/preholomorphic equations
conformal/preholomorphic equations​

The topological part can be solved exactly. The conformal part has a local linear solution, but a unique global solution needs mesh/boundary/RG input.

I will use the Fibonacci category
Fib⁡={1,τ},τ⊗τ=1⊕τ,
Fib={1,τ},τ⊗τ=1⊕τ,

with
φ=1+52
φ=21+5
​​

and
F:=Fττττ=(φ−1φ−1/2φ−1/2−φ−1).
F:=Fττττ​=(φ−1φ−1/2​φ−1/2−φ−1​).

The chiral Fibonacci primary has
hτ=25.
hτ​=52​.
1. Topological algebra object Q=1⊕τQ=1⊕τ

Let
Q=1⊕τ.
Q=1⊕τ.

The unit is
u:1↪Q.
u:1↪Q.

The multiplication
m:Q⊗Q→Q
m:Q⊗Q→Q

is forced on all channels involving 11:
m(1⊗1)=1,
m(1⊗1)=1,
m(1⊗τ)=τ,m(τ⊗1)=τ.
m(1⊗τ)=τ,m(τ⊗1)=τ.

The only free part is
m∣τ⊗τ.
m∣τ⊗τ​.

Choose normalized basis maps
vττ1:τ⊗τ→1,vτττ:τ⊗τ→τ.
vττ1​:τ⊗τ→1,vτττ​:τ⊗τ→τ.

Write
m∣τ⊗τ=a vττ1+b vτττ.
m∣τ⊗τ​=avττ1​+bvτττ​.​

Associativity on the channel
τ⊗τ⊗τ→τ
τ⊗τ⊗τ→τ

requires
(ab2)=F(ab2).
(ab2​)=F(ab2​).​

Equivalently,
b2=φ−3/2a.
b2=φ−3/2a.​

So the general associative solution is either the degenerate square-zero solution
a=b=0,
a=b=0,

or a nonzero family satisfying
b2=φ−3/2a.
b2=φ−3/2a.

To get the canonical dagger-special normalization, impose
mm†=λ id⁡Q.
mm†=λidQ​.

This gives
1+∣a∣2=2+∣b∣2.
1+∣a∣2=2+∣b∣2.

In the positive real gauge, the solution is
a=φ,b=φ−1/2.
a=φ
​,b=φ−1/2.​

Then
λ=φ2,
λ=φ2,

so
mm†=φ2 id⁡Q.
mm†=φ2idQ​.​

Thus the exact Fibonacci algebra multiplication is
τ⋅τ=φ 1+φ−1/2τ.
τ⋅τ=φ
​1+φ−1/2τ.​

This is the canonical nontrivial algebra object structure on
Q=1⊕τ
Q=1⊕τ

in the underlying fusion category.
2. Topological fine-graining from m†m†

The canonical topological fine-graining is the normalized adjoint of multiplication:
Etop=φ−1m†:Q→Q⊗Q.
Etop=φ−1m†:Q→Q⊗Q.​

Therefore
Etop(1)=φ−1 v111+φ−1/2 vττ1,
Etop(1)=φ−1v111​+φ−1/2vττ1​,​

and
Etop(τ)=φ−1 vτ1τ+φ−1 v1ττ+φ−3/2 vτττ.
Etop(τ)=φ−1vτ1τ​+φ−1v1ττ​+φ−3/2vτττ​.​

Here I am using splitting-tree basis maps
vabc:c→a⊗b.
vabc​:c→a⊗b.

The isometry equations are
φ−2+φ−1=1,
φ−2+φ−1=1,

and
2φ−2+φ−3=1.
2φ−2+φ−3=1.

Both hold because
φ2=φ+1.
φ2=φ+1.

So
(Etop)†Etop=id⁡Q.
(Etop)†Etop=idQ​.​
3. Equivalent direct fine-graining equations

Instead of deriving EE from m†m†, write the most general binary fine-graining ansatz:
η(1)=x v111+y vττ1,
η(1)=xv111​+yvττ1​,
η(τ)=p vτ1τ+q v1ττ+r vτττ.
η(τ)=pvτ1τ​+qv1ττ​+rvτττ​.

In positive real gauge, isometry gives
x2+y2=1,
x2+y2=1,​
p2+q2+r2=1.
p2+q2+r2=1.​

Exact binary coherence/coassociativity,
(η⊗id⁡)η=α−1(id⁡⊗η)η,
(η⊗id)η=α−1(id⊗η)η,

gives
p=q=x,
p=q=x,​

and the nontrivial Fibonacci FF-equation
(xyr2)=F(xyr2).
(xyr2​)=F(xyr2​).​

Equivalently,
r2=φ−3/2xy.
r2=φ−3/2xy.​

So the full positive system is
x2+y2=1,
x2+y2=1,
2x2+r2=1,
2x2+r2=1,
r2=φ−3/2xy.
r2=φ−3/2xy.

The unique positive solution is
x=φ−1,y=φ−1/2,p=q=φ−1,r=φ−3/2.
x=φ−1,y=φ−1/2,p=q=φ−1,r=φ−3/2.​

Thus
η=Etop.
η=Etop.​

So the canonical topological fine-graining is exactly the coassociative solution.
4. Why this is not yet the Fibonacci CFT

The topological solution has no length scale, no conformal weight, and no holomorphic equation.

The chiral Fibonacci CFT has
h1=0,hτ=25.
h1​=0,hτ​=52​.

So a conformal refinement must know that a ττ-field scales like a chiral primary of weight 2/52/5. The topological EtopEtop only knows the fusion rule
τ×τ=1+τ.
τ×τ=1+τ.

It does not know the powers
ρ−4/5,ρ−2/5,
ρ−4/5,ρ−2/5,

which come from the OPE.
5. Add the CFT/RG blocking coefficients

For a binary local block with dimensionless fine separation
ρ=fine separationcoarse scale,
ρ=coarse scalefine separation​,

the chiral Fibonacci OPE exponents are
h1−2hτ=−45,
h1​−2hτ​=−54​,

and
hτ−2hτ=−25.
hτ​−2hτ​=−52​.

So the most basic RG blocking coefficients are
β111=u0,
β111​=u0​,​
βττ1=uI ρ−4/5,
βττ1​=uI​ρ−4/5,​
βτ1τ=jL,β1ττ=jR,
βτ1τ​=jL​,β1ττ​=jR​,​
βτττ=uτ ρ−2/5.
βτττ​=uτ​ρ−2/5.​

Here
u0,uI,jL,jR,uτ
u0​,uI​,jL​,jR​,uτ​

are Wilsonian data: normalizations, blocking-kernel constants, and scheme-dependent finite-scale coefficients.

The canonical isometric fine-graining is obtained by polar decomposition:
ERG=B†(BB†)−1/2.
ERG=B†(BB†)−1/2.​

Because the 11 and ττ output sectors do not mix, the solution is scalar-normalized in each sector:
η1RG(ρ)=u0‾ v111+uI‾ρ−4/5 vττ1∣u0∣2+∣uI∣2ρ−8/5.
η1RG​(ρ)=∣u0​∣2+∣uI​∣2ρ−8/5
​u0​​v111​+uI​​ρ−4/5vττ1​​.​

And
ητRG(ρ)=jL‾ vτ1τ+jR‾ v1ττ+uτ‾ρ−2/5 vτττ∣jL∣2+∣jR∣2+∣uτ∣2ρ−4/5.
ητRG​(ρ)=∣jL​∣2+∣jR​∣2+∣uτ​∣2ρ−4/5
​jL​​vτ1τ​+jR​​v1ττ​+uτ​​ρ−2/5vτττ​​.​

These automatically satisfy
(η1RG)†η1RG=1,
(η1RG​)†η1RG​=1,

and
(ητRG)†ητRG=1.
(ητRG​)†ητRG​=1.

So the RG-deformed solution has the same categorical support as the topological Fibonacci algebra, but now includes the CFT scaling powers.
6. Geometry/refinement equation for the ττ primary

Now attach cells to geometry.

Let II be a parent interval and let
I=⋃J⊂IJ
I=J⊂I⋃​J

be a refinement.

For a chiral primary of weight
h=25,
h=52​,

define a smeared field
τ~I=∫Iτ(z) dz.
τ
I​=∫I​τ(z)dz.

Its norm scales like
∥τ~I∥∼∣I∣1−h=∣I∣3/5.
∥τ
I​∥∼∣I∣1−h=∣I∣3/5.

So define the normalized cell field
τI=∣I∣−3/5τ~I.
τI​=∣I∣−3/5τ
I​.

Because
τ~I=∑J⊂Iτ~J,
τ
I​=J⊂I∑​τ
J​,

the refinement equation is
τI=∑J⊂I(∣J∣∣I∣)3/5τJ.
τI​=J⊂I∑​(∣I∣∣J∣​)3/5τJ​.​

Thus the conformal one-ττ geometry coefficient is
aJ∣Iconf=(∣J∣∣I∣)3/5.
aJ∣Iconf​=(∣I∣∣J∣​)3/5.​

This is coherent under repeated refinement:
(∣J∣∣I∣)3/5(∣K∣∣J∣)3/5=(∣K∣∣I∣)3/5.
(∣I∣∣J∣​)3/5(∣J∣∣K∣​)3/5=(∣I∣∣K∣​)3/5.

So
aK∣JconfaJ∣Iconf=aK∣Iconf.
aK∣Jconf​aJ∣Iconf​=aK∣Iconf​.​

Important: this is not an isometry for the diagonal orthonormal cell basis. For an equal binary split,
aL∣I=aR∣I=2−3/5,
aL∣I​=aR∣I​=2−3/5,

and
2∣a∣2=2⋅2−6/5=2−1/5≠1.
2∣a∣2=2⋅2−6/5=2−1/5=1.

Therefore the conformal refinement is an isometry only with respect to the CFT Gram form, not the naive diagonal L2L2 form.

The right equation is
EP→P′†GP′EP→P′=GP,
EP→P′†​GP′​EP→P′​=GP​,​

where GPGP​ is the CFT two-point Gram matrix of the smeared ττ-fields.
7. Preholomorphic equation for the Fibonacci ττ field

The Fibonacci ττ primary has chiral spin
s=hτ=25.
s=hτ​=52​.

On an embedded two-dimensional mesh, assign a ττ-channel amplitude
ψe
ψe​

to each oriented edge or medial edge ee. Let
θe=arg⁡(e).
θe​=arg(e).

A spin-2/52/5 preholomorphic equation around each face ff is
∑e∈∂fωe(2/5)ψe=0,
e∈∂f∑​ωe(2/5)​ψe​=0,​

where one convenient convention is
ωe(2/5)=∣e∣ e−i(2/5)θe.
ωe(2/5)​=∣e∣e−i(2/5)θe​.​

So explicitly,
∑e∈∂f∣e∣e−2iθe/5ψe=0.
e∈∂f∑​∣e∣e−2iθe​/5ψe​=0.​

This is the local discrete ∂ˉ∂ˉ-equation for the Fibonacci chiral ττ-amplitude.

It is linear. For a face with edges
e1,…,en,
e1​,…,en​,

the local solution is
ψen=−1∣en∣e−2iθen/5∑r=1n−1∣er∣e−2iθer/5ψer.
ψen​​=−∣en​∣e−2iθen​​/51​r=1∑n−1​∣er​∣e−2iθer​​/5ψer​​.​

So one edge value is determined by the others.

Globally, the solution space is
ker⁡∂ˉδ(2/5).
ker∂ˉδ(2/5)​.​

Boundary conditions select a particular solution.

For Fibonacci with fusion structure included, the scalar ψeψe​ becomes a vector of channel amplitudes, and the equation becomes
∑e∈∂f∣e∣e−2iθe/5 UeFib Ψe=0.
e∈∂f∑​∣e∣e−2iθe​/5UeFib​Ψe​=0.​

Here
UeFib
UeFib​

is the categorical transport needed to compare the different fusion-tree bases around the face. It is built from Fibonacci FF-moves, and if crossings/exchanges are present, also RR-moves.

In a purely order-preserving line refinement, UeFibUeFib​ is trivial. In a genuinely two-dimensional mobile-anyon geometry, it is not.
8. The solved Fibonacci equation package

Putting the pieces together, the Fibonacci refinement datum should satisfy:
Topological support
1↦11and1↦ττ in the 1 channel,
1↦11and1↦ττ in the 1 channel,
τ↦τ1,τ↦1τ,τ↦ττ in the τ channel.
τ↦τ1,τ↦1τ,τ↦ττ in the τ channel.
Topological exact solution
η1top=φ−1v111+φ−1/2vττ1.
η1top​=φ−1v111​+φ−1/2vττ1​.​
ητtop=φ−1vτ1τ+φ−1v1ττ+φ−3/2vτττ.
ητtop​=φ−1vτ1τ​+φ−1v1ττ​+φ−3/2vτττ​.​
RG/CFT-deformed solution
η1RG(ρ)=u0‾ v111+uI‾ρ−4/5 vττ1∣u0∣2+∣uI∣2ρ−8/5.
η1RG​(ρ)=∣u0​∣2+∣uI​∣2ρ−8/5
​u0​​v111​+uI​​ρ−4/5vττ1​​.​
ητRG(ρ)=jL‾ vτ1τ+jR‾ v1ττ+uτ‾ρ−2/5 vτττ∣jL∣2+∣jR∣2+∣uτ∣2ρ−4/5.
ητRG​(ρ)=∣jL​∣2+∣jR​∣2+∣uτ​∣2ρ−4/5
​jL​​vτ1τ​+jR​​v1ττ​+uτ​​ρ−2/5vτττ​​.​
Geometry/conformal one-field refinement

For the chiral ττ-primary,
aJ∣Iconf=(∣J∣∣I∣)3/5.
aJ∣Iconf​=(∣I∣∣J∣​)3/5.​

This solves refinement coherence and CFT scaling.
Preholomorphicity

For spin
s=25,
s=52​,

the local equation is
∑e∈∂f∣e∣e−2iθe/5 UeFibΨe=0.
e∈∂f∑​∣e∣e−2iθe​/5UeFib​Ψe​=0.​

With no categorical transport, this reduces to
∑e∈∂f∣e∣e−2iθe/5ψe=0.
e∈∂f∑​∣e∣e−2iθe​/5ψe​=0.​

The local solution is
ψen=−(∣en∣e−2iθen/5)−1∑r=1n−1∣er∣e−2iθer/5ψer.
ψen​​=−(∣en​∣e−2iθen​​/5)−1r=1∑n−1​∣er​∣e−2iθer​​/5ψer​​.​
9. Main conclusion

For Fibonacci, the exact topological fine-graining is
η1=φ−1v111+φ−1/2vττ1,
η1​=φ−1v111​+φ−1/2vττ1​,​
ητ=φ−1vτ1τ+φ−1v1ττ+φ−3/2vτττ.
ητ​=φ−1vτ1τ​+φ−1v1ττ​+φ−3/2vτττ​.​

This is the unique positive coassociative/isometric topological solution.

To make it Fibonacci-CFT-like rather than merely topological, deform the coefficients by Wilson/OPE powers:
ρ−4/5andρ−2/5,
ρ−4/5andρ−2/5,

and impose the spin-2/52/5 preholomorphic equation
∂ˉδ(2/5)Ψ=0.
∂ˉδ(2/5)​Ψ=0.​

The category gives the channels. The FF-matrix solves the topological associativity. The conformal weight hτ=2/5hτ​=2/5 gives the refinement exponent 3/53/5 for smeared one-field geometry and the spin-2/52/5 discrete holomorphicity equation.

there is a conceptual disconnect between kinematic *hilbert* space picture 1d space and this 2d grid you mentioned

You are right: I conflated two geometries. The Hilbert space is built on a 1D spatial slice; any 2D grid belongs to Euclidean spacetime/correlator or transfer-matrix data.

Yes. That disconnect is real.

I mixed two different constructions:
1D spatial Hilbert-space kinematics
1D spatial Hilbert-space kinematics​

versus
2D Euclidean spacetime / worldsheet CFT
2D Euclidean spacetime / worldsheet CFT​

The mobile Hilbert space lives on a spatial slice. Preholomorphicity lives naturally on a two-dimensional Euclidean lattice or surface. These are related, but they are not the same object.
1. The correct 1D Hilbert-space picture

For a spatial line or circle XX, take a finite ordered partition
P={I1<I2<⋯<IN}.
P={I1​<I2​<⋯<IN​}.

Attach one categorical site object to each interval:
AP=AI1⊗⋯⊗AIN.
AP​=AI1​​⊗⋯⊗AIN​​.

Then the Hilbert space is
HPW=Hom⁡C(W,AP).
HPW​=HomC​(W,AP​).​

This is purely a spatial object. It has no time, no Euclidean plane, no holomorphic coordinate.

For the square-zero example
A=1⊕p,p2=0,
A=1⊕p,p2=0,

the geometry-compatible refinement of one interval II into children J⊂IJ⊂I is
pI↦∑J⊂I∣J∣∣I∣ pJ.
pI​↦J⊂I∑​∣I∣∣J∣​
​pJ​.​

This gives the direct-limit one-particle Hilbert space
L2(X).
L2(X).​

That is a kinematic continuum Hilbert space.

But it is not yet a CFT.
2. Why preholomorphicity does not belong directly on this 1D Hilbert space

Holomorphicity requires a complex coordinate
z=x+it.
z=x+it.

A spatial partition only sees
x.
x.

So there is no literal ∂ˉ∂ˉ-operator on the 1D Hilbert space
HPW.
HPW​.

The 1D analogue of holomorphicity is not “preholomorphicity.” It is something more like:
diffeomorphism covariance / Virasoro covariance / conformal covariance of the spatial Hilbert system.
diffeomorphism covariance / Virasoro covariance / conformal covariance of the spatial Hilbert system.​

So if we stay strictly in the Hilbert-space-on-a-line formalism, the right equations are not discrete Cauchy-Riemann equations. They are refinement, scale, and Virasoro compatibility equations.
3. Where the 2D grid properly enters

The 2D grid should be interpreted as a Euclidean spacetime discretization, not as the Hilbert space itself.

A 2D cellulation of a strip, annulus, disk, or pair of pants gives a linear map between boundary Hilbert spaces:
Z(Σ):H∂inΣ→H∂outΣ.
Z(Σ):H∂in​Σ​→H∂out​Σ​.​

The boundaries are 1D partitions. The bulk is 2D.

So the correct relation is:
1D partition P⟼Hilbert space HP
1D partition P⟼Hilbert space HP​​
2D cobordism/cellulation Σ:Pin→Pout⟼linear map Z(Σ):HPin→HPout.
2D cobordism/cellulation Σ:Pin​→Pout​⟼linear map Z(Σ):HPin​​→HPout​​.​

Then preholomorphicity is a condition on the bulk amplitudes / observables defining Z(Σ)Z(Σ), not directly on the static Hilbert space HPHP​.

That is the clean bridge.
4. Two possible programs

There are now two distinct routes.
Program A: stay purely 1D / Hamiltonian

Then we should not use preholomorphicity language. We should impose conformal covariance on the directed Hilbert system.

The data are:
P↦HPW,
P↦HPW​,

refinement maps
EP→P′:HPW→HP′W,
EP→P′​:HPW​→HP′W​,

and then additional conformal/RG structure:
GP=CFT Gram form on HP,
GP​=CFT Gram form on HP​,
HP=discrete Hamiltonian,
HP​=discrete Hamiltonian,
Ln,P=discrete Virasoro generators.
Ln,P​=discrete Virasoro generators.

The equations should be:
EP→P′†GP′EP→P′=GP
EP→P′†​GP′​EP→P′​=GP​​

for inner-product compatibility,
EP′→P′′EP→P′=EP→P′′
EP′→P′′​EP→P′​=EP→P′′​​

for refinement coherence,
Ln,P′EP→P′≈EP→P′Ln,P
Ln,P′​EP→P′​≈EP→P′​Ln,P​​

for Virasoro covariance under refinement, and
[Lm,P,Ln,P]≈(m−n)Lm+n,P+c12m(m2−1)δm+n,0
[Lm,P​,Ln,P​]≈(m−n)Lm+n,P​+12c​m(m2−1)δm+n,0​​

in the continuum limit.

This is the correct purely Hilbert-space version.

For Fibonacci CFT, this means adding at least
hτ=25,c=145 or the appropriate chiral realisation,
hτ​=52​,c=514​ or the appropriate chiral realisation,

depending on which Fibonacci chiral theory is being targeted, plus the actual operator/state content and OPE coefficients.

The algebra object alone does not contain these.
Program B: use a 2D Euclidean lattice/cobordism

Then preholomorphicity makes sense.

The Hilbert spaces still live on 1D boundaries:
HPW.
HPW​.

But a 2D mesh between boundaries defines transfer/RG maps:
Z(Σ):HPinW→HPoutW.
Z(Σ):HPin​W​→HPout​W​.

Discrete holomorphicity then becomes a bulk equation, for example
∑e∈∂f∣e∣e−isθeΨe=0
e∈∂f∑​∣e∣e−isθe​Ψe​=0​

around each 2D face ff.

For Fibonacci’s chiral ττ-field,
s=hτ=25,
s=hτ​=52​,

so the local spin-twisted equation would be
∑e∈∂f∣e∣e−2iθe/5Ψe=0.
e∈∂f∑​∣e∣e−2iθe​/5Ψe​=0.​

But this is a condition on the Euclidean bulk observable or transfer tensor, not on the 1D Hilbert space by itself.
5. The key correction

For the spatial direct-limit Hilbert space, the line refinement rule
pI↦∑J⊂I∣J∣∣I∣ pJ
pI​↦J⊂I∑​∣I∣∣J∣​
​pJ​

is an L2L2-half-density rule.

It says:
a particle wavefunction refines as an L2 state.
a particle wavefunction refines as an L2 state.​

A chiral CFT primary of weight hh, however, is not an L2L2 particle wavefunction. It is an operator-valued distribution satisfying
Φ(z)↦(f′(z))hΦ(f(z)).
Φ(z)↦(f′(z))hΦ(f(z)).

If we smear over an interval,
ΦI=∫IΦ(x) dx,
ΦI​=∫I​Φ(x)dx,

then scaling gives roughly
ΦI∼∣I∣1−h.
ΦI​∼∣I∣1−h.

For Fibonacci,
hτ=25,
hτ​=52​,

so a smeared ττ-field scales like
∣I∣3/5.
∣I∣3/5.

That is different from the square-root L2L2 scaling
∣I∣1/2.
∣I∣1/2.

So:
square-root length weights give ordinary particle kinematics;
square-root length weights give ordinary particle kinematics;​
CFT primary weights require a different Gram form and operator interpretation.
CFT primary weights require a different Gram form and operator interpretation.​

This is probably the heart of the conceptual issue.
6. Revised role of the algebra object

The algebra object AA gives the topological local state/channel skeleton.

For Fibonacci,
A=Q=1⊕τ
A=Q=1⊕τ

has topological multiplication
τ⋅τ=φ 1+φ−1/2τ.
τ⋅τ=φ
​1+φ−1/2τ.

This gives a canonical topological blocking/fine-graining map.

But to recover the Fibonacci CFT, the line Hilbert system must be enriched by CFT data:
topological sector a
topological sector a​

plus
field label i, conformal weight hi, descendants, and OPE constants.
field label i, conformal weight hi​, descendants, and OPE constants.​

So the site object should eventually look more like
A^=⨁iMi⊗ai,
A
=i⨁​Mi​⊗ai​,

where
i=(ai,hi,primary/descendant/composite label).
i=(ai​,hi​,primary/descendant/composite label).

The algebra object gives allowed fusion channels. The CFT data gives the scaling and operator algebra.
7. The corrected roadmap

For the 1D Hilbert/direct-limit formalism, the right next equations are:
HPW=Hom⁡(W,AP)
HPW​=Hom(W,AP​)​

with refinement maps
EP→P′:HPW→HP′W.
EP→P′​:HPW​→HP′W​.​

Then impose:
EP→P′†GP′EP→P′=GP
EP→P′†​GP′​EP→P′​=GP​​

using the correct CFT Gram matrix GPGP​, not necessarily the naive orthonormal particle basis.

Then impose:
EP′→P′′EP→P′=EP→P′′.
EP′→P′′​EP→P′​=EP→P′′​.​

Then impose conformal covariance:
UP′(f)EP→P′≈EfP→fP′UP(f)
UP′​(f)EP→P′​≈EfP→fP′​UP​(f)​

for spatial conformal transformations ff, or infinitesimally,
Lv,P′EP→P′≈EP→P′Lv,P.
Lv,P′​EP→P′​≈EP→P′​Lv,P​.​

That is the line-only substitute for preholomorphicity.

For the 2D Euclidean/CFT formalism, add cellulated surfaces ΣΣ and maps
Z(Σ):H∂inΣ→H∂outΣ.
Z(Σ):H∂in​Σ​→H∂out​Σ​.​

Then preholomorphicity is imposed in the bulk:
∂ˉδΨ=0
∂ˉδ​Ψ=0​

or, for Fibonacci ττ,
∑e∈∂f∣e∣e−2iθe/5Ψe=0.
e∈∂f∑​∣e∣e−2iθe​/5Ψe​=0.​
Bottom line

The 1D mobile Hilbert space is the state space on a spatial slice.

The 2D grid is only appropriate when we are building Euclidean evolution/correlation maps between such slices.

So the corrected slogan is:
1D partitions give Hilbert spaces.
1D partitions give Hilbert spaces.​
Refinement maps give kinematic continuum structure.
Refinement maps give kinematic continuum structure.​
Conformal CFT recovery requires either Virasoro covariance on the 1D direct system,
Conformal CFT recovery requires either Virasoro covariance on the 1D direct system,​

or
a 2D Euclidean cobordism theory whose bulk amplitudes satisfy preholomorphic/Ward equations.
a 2D Euclidean cobordism theory whose bulk amplitudes satisfy preholomorphic/Ward equations.​

So yes: preholomorphicity is not the primary equation for the 1D Hilbert space. The line-only version should be formulated as refinement coherence plus CFT Gram compatibility plus Virasoro/diffeomorphism covariance.

I believe the descendents are coming from geometry only (when  smoothed they are modified by deriv)

Thought for 3m 27s

Yes, I think that is the right conceptual split.

The refined version is:
primaries/topological sectors are algebraic;descendants are geometric/jets of smearing.
primaries/topological sectors are algebraic;descendants are geometric/jets of smearing.​

More precisely: ordinary derivative descendants are directly produced by changing the smearing geometry. Full Virasoro descendants are produced by changes of local conformal coordinate, i.e. by the geometric action of the Virasoro algebra. So they are not new topological charges and should not usually be treated as independent particle species.
1. Smearing creates derivative descendants

Let Φ(x)Φ(x) be a chiral primary of weight hh. A cell-smeared field is something like
ΦI[f]=∫IfI(x)Φ(x) dx.
ΦI​[f]=∫I​fI​(x)Φ(x)dx.

Choose a center xIxI​. Taylor expand:
Φ(x)=∑n≥0(x−xI)nn! ∂nΦ(xI).
Φ(x)=n≥0∑​n!(x−xI​)n​∂nΦ(xI​).

Then
ΦI[f]=∑n≥0μn(f,I)n! ∂nΦ(xI),
ΦI​[f]=n≥0∑​n!μn​(f,I)​∂nΦ(xI​),

where
μn(f,I)=∫IfI(x)(x−xI)n dx.
μn​(f,I)=∫I​fI​(x)(x−xI​)ndx.

So the coefficients of
Φ,∂Φ,∂2Φ,…
Φ,∂Φ,∂2Φ,…

are literally moments of the smearing geometry.

Thus derivative descendants are not independent categorical labels. They are generated by the geometry of the cell and the chosen test function.
2. Refinement mixes descendants by geometry

If a parent cell II is refined into children J⊂IJ⊂I, then
∫IfI(x)Φ(x) dx=∑J⊂I∫JfI(x)Φ(x) dx.
∫I​fI​(x)Φ(x)dx=J⊂I∑​∫J​fI​(x)Φ(x)dx.

When each child integral is re-expanded around its own center xJxJ​, the parent jet basis and child jet bases are related by Taylor/binomial coefficients.

Schematically,
ΦI,n=∑J⊂I∑m≥0RJ,m; I,n(h) ΦJ,m.
ΦI,n​=J⊂I∑​m≥0∑​RJ,m;I,n(h)​ΦJ,m​.​

Here
ΦI,n∼∂nΦ smeared on I,
ΦI,n​∼∂nΦ smeared on I,

and the matrix
RJ,m; I,n(h)
RJ,m;I,n(h)​

is determined by:
cell lengths, centers, embedding maps, and conformal weight h.
cell lengths, centers, embedding maps, and conformal weight h.

No new fusion rule is involved.

For a primary itself, the leading scaling under interval refinement is
ΦI↦∑J⊂I(∣J∣∣I∣)1−hΦJ
ΦI​↦J⊂I∑​(∣I∣∣J∣​)1−hΦJ​

for the simplest integral-smearing convention.

For Fibonacci,
hτ=25,
hτ​=52​,

so
1−hτ=35,
1−hτ​=53​,

and the leading ττ-primary geometry coefficient is
(∣J∣∣I∣)3/5.
(∣I∣∣J∣​)3/5.​

The derivative descendants then appear when the smearing is not perfectly represented by just the leading cell average.
3. Coordinate changes generate descendant mixing

Under a conformal coordinate change
y=f(x),
y=f(x),

a primary transforms as
Φ(x)=(f′(x))hΦ′(f(x)).
Φ(x)=(f′(x))hΦ′(f(x)).

Taking one derivative gives
∂xΦ(x)=(f′)h+1∂yΦ′(y)+hf′′(f′)h−1Φ′(y).
∂x​Φ(x)=(f′)h+1∂y​Φ′(y)+hf′′(f′)h−1Φ′(y).

So the descendant ∂Φ∂Φ mixes with ΦΦ, and the coefficients are determined by the geometry of ff, namely f′f′ and f′′f′′.

Higher derivatives satisfy the same pattern:
∂xnΦ(x)=∑k=0nCn,k(h;f′,f′′,…,f(n−k+1))∂ykΦ′(y).
∂xn​Φ(x)=k=0∑n​Cn,k​(h;f′,f′′,…,f(n−k+1))∂yk​Φ′(y).

So the whole tower
Φ,∂Φ,∂2Φ,…
Φ,∂Φ,∂2Φ,…

is controlled by local coordinate jets.

That is exactly your point: once fields are smoothed over cells, changing the smoothing geometry modifies them by derivative corrections.
4. Full Virasoro descendants

There is one caveat.

Derivative descendants are the L−1L−1​-tower:
L−1n∣Φ⟩↔∂nΦ.
L−1n​∣Φ⟩↔∂nΦ.

But a full chiral CFT also has descendants like
L−2∣Φ⟩,L−3∣Φ⟩,L−2L−1∣Φ⟩,
L−2​∣Φ⟩,L−3​∣Φ⟩,L−2​L−1​∣Φ⟩,

which are not just ordinary derivatives.

However, they are still geometric in the conformal sense: they come from local conformal-coordinate deformations and stress-tensor Ward identities. For example, the stress tensor itself is the vacuum descendant
T=L−21.
T=L−2​1.

So the better statement is:
global derivative descendants come from smearing jets;
global derivative descendants come from smearing jets;​
full Virasoro descendants come from local conformal-coordinate jets / stress-tensor geometry.
full Virasoro descendants come from local conformal-coordinate jets / stress-tensor geometry.​

They are not new topological anyon charges. But to recover them exactly, the formalism must know the Virasoro representation: conformal weights hihi​, central charge cc, and null-vector relations.
5. How this changes the site object

Instead of putting every descendant into the categorical object as an independent species, use something like
AIgeom=⨁primaries iJI(hi)⊗ai.
AIgeom​=primaries i⨁​JI(hi​)​⊗ai​.​

Here:
ai
ai​

is the topological sector, while
JI(hi)
JI(hi​)​

is a geometry-dependent jet or smearing space attached to cell II.

For Fibonacci, the primary-level object is
Aprim=1⊕τ.
Aprim​=1⊕τ.

The geometry-enriched version is more like
AIFib=JI(0)⊗1  ⊕  JI(2/5)⊗τ.
AIFib​=JI(0)​⊗1⊕JI(2/5)​⊗τ.​

The ττ-jet space contains
τ,∂τ,∂2τ,…
τ,∂τ,∂2τ,…

as smearing/jet modes over II.

The vacuum jet space is subtler because ordinary derivatives of the identity vanish, but the full vacuum Virasoro module contains
1,T,∂T,:TT:,…
1,T,∂T,:TT:,…

So if we want full CFT rather than primary kinematics, the neutral sector must include the stress-tensor geometry.
6. Multiplication/OPE with descendants

The primary algebra object gives the topological OPE skeleton:
τ×τ=1+τ.
τ×τ=1+τ.

At the primary level,
τ(z)τ(0)∼Cττ1z−4/51+Cτττz−2/5τ(0)+⋯ .
τ(z)τ(0)∼Cττ1​z−4/51+Cτττ​z−2/5τ(0)+⋯.

The dots are descendants.

But those descendant terms are not arbitrary extra multiplication channels. Their coefficients are fixed by conformal symmetry once the primary OPE coefficients, weights, and central charge are known.

Schematically,
τ(z)τ(0)∼Cττ1z−4/5(1+2hτcz2T(0)+⋯ )+Cτττz−2/5(τ(0)+12z ∂τ(0)+⋯ ).
τ(z)τ(0)∼Cττ1​z−4/5(1+c2hτ​​z2T(0)+⋯)+Cτττ​z−2/5(τ(0)+21​z∂τ(0)+⋯).

For Fibonacci,
hτ=25.
hτ​=52​.

So the descendant corrections are controlled by:
hτ,c,Cττ1,Cτττ,
hτ​,c,Cττ1​,Cτττ​,

plus Ward identities, not by new topological fusion multiplicities.
7. The updated principle

I would formulate the principle as:
Do not enlarge A by arbitrary descendant species.
Do not enlarge A by arbitrary descendant species.​

Instead:
enlarge each primary/topological sector by a geometric jet/smearing module.
enlarge each primary/topological sector by a geometric jet/smearing module.​

So the algebra object controls:
which primary channels are allowed.
which primary channels are allowed.​

Geometry controls:
how descendants are generated under refinement, smoothing, and coordinate change.
how descendants are generated under refinement, smoothing, and coordinate change.​

Conformal Ward identities control:
the descendant coefficients in OPEs.
the descendant coefficients in OPEs.​

Wilsonian data remains necessary for:
choice of blocking kernel, field normalisation, irrelevant non-CFT operators, and finite-scale scheme.
choice of blocking kernel, field normalisation, irrelevant non-CFT operators, and finite-scale scheme.​
8. For our Fibonacci formalism

The clean next ansatz is:
AI=JI(0)⊗1⊕JI(2/5)⊗τ.
AI​=JI(0)​⊗1⊕JI(2/5)​⊗τ.​

The primary multiplication is still
τ⋅τ=φ 1+φ−1/2τ
τ⋅τ=φ
​1+φ−1/2τ

at the topological level.

But the full smeared multiplication is:
mI,J→K=topological Fibonacci vertex  ⊗  geometric/OPE jet map.
mI,J→K​=topological Fibonacci vertex⊗geometric/OPE jet map.

The jet map expands relative positions and smoothing functions into descendant modes.

So a local two-ττ product gives:
τIτJ⇝1-channel jets+τ-channel jets.
τI​τJ​⇝1-channel jets+τ-channel jets.

The channel choice is Fibonacci. The descendant structure is geometry plus conformal Ward identities.
Bottom line

Your intuition is right, with one refinement:
Descendants should be treated as geometric jet data over primary/topological sectors,
Descendants should be treated as geometric jet data over primary/topological sectors,​

not as arbitrary new particle species in the algebra object.

For the line Hilbert-space construction, this means replacing
A=1⊕τ
A=1⊕τ

by a geometry-dependent object
AI=JI(0)⊗1⊕JI(2/5)⊗τ,
AI​=JI(0)​⊗1⊕JI(2/5)​⊗τ,

where the jet spaces JI(h)JI(h)​ transform under refinement by Taylor/conformal-coordinate geometry. The Fibonacci algebra controls the primary fusion channels; the geometry of smoothing produces ∂nτ∂nτ-type descendants; full Virasoro descendants come from local conformal-coordinate variations and the stress tensor.


