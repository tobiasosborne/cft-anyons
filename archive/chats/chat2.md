ChatGPT

In the previous chat in this project we introduce the hilbert space for an indefinite number of anyons based on an arbitrary fusion cat. Go read it and summarise salient takehome points here

I’ll look up the prior project discussion, then extract the core construction, assumptions, conventions, and consequences of the indefinite-anyon Hilbert space rather than re-deriving it.

I found the project notes from the previous chat. The core construction was a Fock-like Hilbert space for mobile anyons, but with the ordinary tensor-product occupation basis replaced by fusion-category Hom spaces.

The salient takeaways are:
1. The input data is a fusion category

The microscopic anyons are modeled by a fusion category CC. Its simple objects label anyon types:
a,b,c,⋯∈Irr⁡(C),
a,b,c,⋯∈Irr(C),

with vacuum/simple unit object 11. Fusion is encoded by spaces such as
Vabc,
Vabc​,

or equivalently by Hom spaces like
Hom⁡(c,a⊗b)
Hom(c,a⊗b)

depending on convention. The multiplicities
Nabc=dim⁡Vabc
Nabc​=dimVabc​

tell us how many independent fusion channels exist.

For an actual Hilbert space, one usually wants CC to be unitary, or at least to have enough dagger/inner-product structure. Otherwise the same construction gives a state space, but not canonically a Hilbert space.
2. Fixed-particle-number sectors are fusion-tree spaces

For a fixed ordered list of anyons
(a1,…,an),
(a1​,…,an​),

the topological state space is not just
Ca1⊗⋯⊗Can.
Ca1​⊗⋯⊗Can​.

Instead, it is the space of possible fusion channels. For total charge WW, the sector is schematically
H(a1,…,an;W)≃Hom⁡ ⁣(W,a1⊗⋯⊗an),
H(a1​,…,an​;W)≃Hom(W,a1​⊗⋯⊗an​),

or, in the dual convention,
Hom⁡ ⁣(1,a1⊗⋯⊗an⊗W‾).
Hom(1,a1​⊗⋯⊗an​⊗W).

In particular, the vacuum sector is
Hom⁡ ⁣(1,a1⊗⋯⊗an)
Hom(1,a1​⊗⋯⊗an​)

up to convention.

A basis is given by choosing a fusion tree, e.g.
a1⊗a2→c1,c1⊗a3→c2,…,cn−2⊗an→W.
a1​⊗a2​→c1​,c1​⊗a3​→c2​,…,cn−2​⊗an​→W.

Thus basis labels are internal fusion labels cici​, plus multiplicity labels if the category is not multiplicity-free.
3. Indefinite particle number is handled by a direct sum over configurations

The key move was to define a Fock-like space by summing over all finite anyon configurations on a spatial set or lattice ΛΛ.

A configuration is roughly a finite-support assignment
a⃗=(ax)x∈Λ,
a
=(ax​)x∈Λ​,

where each site xx carries an object ax∈Irr⁡(C)ax​∈Irr(C), and all but finitely many sites carry the vacuum 11.

The Hilbert space in a total charge sector WW is then of the form
HC,ΛW=⨁a⃗∈Conf⁡(Λ)Hom⁡ ⁣(W,⨂x∈Λax),
HC,ΛW​=a
∈Conf(Λ)⨁​Hom(W,x∈Λ⨂​ax​),

or equivalently, depending on the chosen convention,
HC,ΛW=⨁a⃗∈Conf⁡(Λ)Hom⁡ ⁣(1,⨂x∈Λax⊗W‾).
HC,ΛW​=a
∈Conf(Λ)⨁​Hom(1,x∈Λ⨂​ax​⊗W).

For the vacuum sector W=1W=1, this reduces to
HC,Λ1=⨁a⃗∈Conf⁡(Λ)Hom⁡ ⁣(1,⨂x∈Λax).
HC,Λ1​=a
∈Conf(Λ)⨁​Hom(1,x∈Λ⨂​ax​).

That was the main structural definition.
4. The order of sites matters as a bookkeeping choice

Because tensor products in a fusion category are not literally unordered, one must choose an ordering of the occupied sites, or more generally choose a fusion tree / parenthesization convention.

For example, if ΛΛ is a one-dimensional lattice, one can order sites from left to right:
x1<x2<⋯<xn,
x1​<x2​<⋯<xn​,

and write
ax1⊗ax2⊗⋯⊗axn.
ax1​​⊗ax2​​⊗⋯⊗axn​​.

Different choices of ordering or parenthesization are related by FF-moves, and if braiding is present, exchanges are implemented by RR-moves/braiding maps. The physical content should not depend on the arbitrary bookkeeping choice, but formulas do.
5. The construction separates spatial mobility from topological fusion data

A configuration a⃗a
records where anyons are and what their types are.

The Hom space
Hom⁡ ⁣(W,⨂xax)
Hom(W,x⨂​ax​)

records the internal topological/fusion state of those anyons.

So each state has two layers:
spatial occupation data+fusion-channel data.
spatial occupation data+fusion-channel data.

This is the anyonic analogue of a Fock basis, but instead of merely saying “there are particles of species a,b,ca,b,c at sites x,y,zx,y,z,” one must also specify how their charges fuse globally.
6. Total charge is a superselection label

The label WW in
HC,ΛW
HC,ΛW​

is the total topological charge of the whole configuration.

Local physical operators generally preserve WW. Therefore the full indefinite-number state space decomposes as
HC,Λ=⨁W∈Irr⁡(C)HC,ΛW,
HC,Λ​=W∈Irr(C)⨁​HC,ΛW​,

but each HC,ΛWHC,ΛW​ is a superselection sector.

The vacuum sector W=1W=1 is especially important for closed systems, because it represents configurations whose total charge fuses to the vacuum.
7. Creation and annihilation are not ordinary bosonic/fermionic operators

Adding an anyon of type aa at a site does not merely tensor by a one-particle vector. It changes the configuration and also changes the relevant fusion Hom space.

Schematically, creation maps between spaces like
Hom⁡ ⁣(W,⨂xax)⟶Hom⁡ ⁣(W′,⨂xax′),
Hom(W,x⨂​ax​)⟶Hom(W′,x⨂​ax′​),

where ax′ax′​ differs from axax​ by the inserted anyon, and W′W′ may be constrained depending on whether one works in a fixed total-charge sector.

In a closed system with fixed total charge WW, physical creation must usually create combinations whose net charge is compatible with preserving WW, for example anyon–anti-anyon pairs in the vacuum sector.
8. Empty sites are encoded by the tensor unit

The finite-support condition can be phrased by saying
ax=1
ax​=1

for all but finitely many x∈Λx∈Λ.

This lets one formally write
⨂x∈Λax,
x∈Λ⨂​ax​,

even though only finitely many nontrivial factors appear. The vacuum object 11 plays the role of “no particle at this site.”
9. The construction is categorical, not tied to a specific anyon model

Nothing in the definition requires choosing Fibonacci, Ising, toric-code, or SU(2)kSU(2)k​ anyons specifically.

Those examples are obtained by plugging in their corresponding fusion categories. The same formalism works for arbitrary fusion rules, including categories with nontrivial fusion multiplicities.
10. Practical takeaway for later microscopic modeling

The main point is that the microscopic Hilbert space for mobile anyons should be thought of as
sum over finite spatial configurations⊗categoricallyfusion-channel degrees of freedom
sum over finite spatial configurations⊗categorically​fusion-channel degrees of freedom​

more precisely:
HC,ΛW=⨁a⃗∈Conf⁡(Λ)Hom⁡ ⁣(W,⨂x∈Λax)
HC,ΛW​=a
∈Conf(Λ)⨁​Hom(W,x∈Λ⨂​ax​)​

up to the chosen Hom-space convention.

So the central lesson was:

Indefinite-number anyon Hilbert spaces are Fock-like direct sums over configurations, but the fiber over each configuration is a fusion-category Hom space, not an ordinary tensor product of one-particle Hilbert spaces.

I’ll compute the toy ascending-channel eigenvalues and compare them with Ising/TL₂ CFT expectations. The key subtlety is that one-vector refinement need not reproduce the full spectrum.

The literal ε-only refinement has only a trivial coarse-sector eigenvalue; meaningful λᵢ require choosing a scale-invariant retained operator space, where σ and ε primaries can appear.

Yes, but with an important distinction:
the toy TL map above determines an ascending channel,
the toy TL map above determines an ascending channel,

but the literal eigenvalues of that tiny channel are not yet the Ising CFT scaling eigenvalues. The toy map only kept one local coarse charge, ϵϵ, and its three fine refinement channels. That is enough to test the σσ→ϵσσ→ϵ OPE amplitude, not enough to recover the full scaling-operator spectrum.

Let b>1b>1 be the RG scale factor and set
ρ=b−1.
ρ=b−1.

For the Ising/TL22​ example we used
Δσ=18,Δϵ=1,Cσσϵ=12,
Δσ​=81​,Δϵ​=1,Cσσϵ​=21​,

which are the exact 2D Ising minimal-model data.

The local refinement of a coarse ϵϵ was
ηϵ(ρ)=12eL+12eR+12ρ3/4sDϵ(ρ),
ηϵ​(ρ)=Dϵ​(ρ)
​2
​1​eL​+2
​1​eR​+21​ρ3/4s​,

where
eL=vϵϵ,1,eR=vϵ1,ϵ,s=vϵσ,σ;ϵ,
eL​=vϵϵ,1​,eR​=vϵ1,ϵ​,s=vϵσ,σ;ϵ​,

and
Dϵ(ρ)=1+14ρ3/2.
Dϵ​(ρ)=1+41​ρ3/2.

The exponent is
Δϵ−2Δσ=1−14=34.
Δϵ​−2Δσ​=1−41​=43​.

So the σσ→ϵσσ→ϵ amplitude scales as
ρ3/4=b−3/4,
ρ3/4=b−3/4,

and the corresponding probability scales as
ρ3/2=b−3/2.
ρ3/2=b−3/2.

That is the first check: the toy fine-graining map matches the expected CFT/OPE data in the σσ→ϵσσ→ϵ channel.
1. Literal ascending channel for the toy ϵϵ-block

The ascending channel is
Aϵ(X)=ηϵ†Xηϵ.
Aϵ​(X)=ηϵ†​Xηϵ​.

Since the coarse ϵϵ-sector here is one-dimensional,
End⁡(ϵ)≅C,
End(ϵ)≅C,

this channel maps fine operators on
span⁡{eL,eR,s}
span{eL​,eR​,s}

to a scalar multiple of the coarse ϵϵ-identity.

For the three diagonal projectors,
PL=∣eL⟩⟨eL∣,PR=∣eR⟩⟨eR∣,Ps=∣s⟩⟨s∣,
PL​=∣eL​⟩⟨eL​∣,PR​=∣eR​⟩⟨eR​∣,Ps​=∣s⟩⟨s∣,

we get
Aϵ(PL)=12Dϵ(ρ) id⁡ϵ,
Aϵ​(PL​)=2Dϵ​(ρ)1​idϵ​,​
Aϵ(PR)=12Dϵ(ρ) id⁡ϵ,
Aϵ​(PR​)=2Dϵ​(ρ)1​idϵ​,​

and
Aϵ(Ps)=14ρ3/2Dϵ(ρ) id⁡ϵ.
Aϵ​(Ps​)=Dϵ​(ρ)41​ρ3/2​idϵ​.​

So the probability that the refined ϵϵ is seen in the σσσσ-splitting channel is
pσσ→ϵ(ρ)=14ρ3/21+14ρ3/2.
pσσ→ϵ​(ρ)=1+41​ρ3/241​ρ3/2​.​

For a binary scale factor b=2b=2, so ρ=1/2ρ=1/2,
Dϵ(1/2)=1+14 2−3/2≈1.08839,
Dϵ​(1/2)=1+41​2−3/2≈1.08839,

and therefore
pσσ→ϵ(1/2)≈0.08121.
pσσ→ϵ​(1/2)≈0.08121.

The unnormalized OPE prediction would give
(12ρ3/4)2=14ρ3/2=14 2−3/2≈0.08839,
(21​ρ3/4)2=41​ρ3/2=41​2−3/2≈0.08839,

and the small reduction to 0.081210.08121 is just the isometric normalization denominator.
2. What are the literal λiλi​ of this tiny channel?

If we compose ascending and canonical lifting,
Pϵ=Lϵ∘Aϵ,
Pϵ​=Lϵ​∘Aϵ​,

then
Pϵ(X)=ηϵ(ηϵ†Xηϵ)ηϵ†.
Pϵ​(X)=ηϵ​(ηϵ†​Xηϵ​)ηϵ†​.

This is a rank-one projection on the fine operator space. Therefore its eigenvalues are
λ=1
λ=1​

on the code operator
∣ηϵ⟩⟨ηϵ∣,
∣ηϵ​⟩⟨ηϵ​∣,

and
λ=0
λ=0​

on the eight-dimensional kernel
{X∈End⁡(span⁡{eL,eR,s}):ηϵ†Xηϵ=0}.
{X∈End(span{eL​,eR​,s}):ηϵ†​Xηϵ​=0}.

So the literal eigenvalues of this tiny projected channel are
1,0,0,0,0,0,0,0,0.
1,0,0,0,0,0,0,0,0.​

Those are not the Ising CFT scaling eigenvalues. They only say that the isometry preserves the embedded code subspace and discards orthogonal fine-block data.
3. Expected Ising CFT scaling eigenvalues

For a genuine scale-invariant RG ascending channel, the scaling operators satisfy
Ab(Oi)=λiOi,
Ab​(Oi​)=λi​Oi​,

with
λi=b−Δi.
λi​=b−Δi​.​

For the nonchiral 2D Ising CFT primaries,
1,σ,ϵ,
1,σ,ϵ,

the expected eigenvalues are
λ1=1,
λ1​=1,​
λσ=b−1/8,
λσ​=b−1/8,​
λϵ=b−1.
λϵ​=b−1.​

For binary refinement b=2b=2,
λ1=1,
λ1​=1,
λσ=2−1/8≈0.91700,
λσ​=2−1/8≈0.91700,
λϵ=2−1=0.5.
λϵ​=2−1=0.5.

Those are the expected linearized RG eigenvalues near the Ising fixed point. The paper I cited above also identifies the 2D Ising point in (Δσ,Δϵ)(Δσ​,Δϵ​)-space as (1/8,1)(1/8,1).

If instead one is using the chiral Ising/TL/SU(2)2(2)2​ data, then the weights are
h1=0,hσ=116,hϵ=12,
h1​=0,hσ​=161​,hϵ​=21​,

and the chiral radial eigenvalues would be
b−hi.
b−hi​.

But in the previous toy calculation we were using the nonchiral 2D Ising scaling dimensions.
4. So does the toy TL map match the expected RG data?

It matches the OPE/RG channel data, not the full scaling-spectrum data.

The CFT prediction for the σσ→ϵσσ→ϵ OPE contribution is
βσσϵ(ρ)∝Cσσϵ ρΔϵ−2Δσ.
βσσϵ​(ρ)∝Cσσϵ​ρΔϵ​−2Δσ​.

Plugging in the Ising values gives
βσσϵ(ρ)=12ρ3/4
βσσϵ​(ρ)=21​ρ3/4

in the minimal normalization. That is exactly the coefficient used in
ηϵ(ρ)=12eL+12eR+12ρ3/4s1+14ρ3/2.
ηϵ​(ρ)=1+41​ρ3/2
​2
​1​eL​+2
​1​eR​+21​ρ3/4s​.

So the match is:
Cσσϵ=12⇒splitting amplitude prefactor 12,
Cσσϵ​=21​⇒splitting amplitude prefactor 21​,​
Δϵ−2Δσ=34⇒splitting amplitude scales as b−3/4,
Δϵ​−2Δσ​=43​⇒splitting amplitude scales as b−3/4,​
2(Δϵ−2Δσ)=32⇒splitting probability scales as b−3/2.
2(Δϵ​−2Δσ​)=23​⇒splitting probability scales as b−3/2.​

That is the correct OPE-level RG check.
5. What is missing to get λσ,λϵλσ​,λϵ​ from the channel?

To recover
λσ=b−1/8,λϵ=b−1,
λσ​=b−1/8,λϵ​=b−1,

the fine-graining map must act not merely on topological charge channels, but on a chosen operator basis carrying the CFT scaling fields.

That means the coarse label should be something like
μ=(a,O,n),
μ=(a,O,n),

where
a
a

is the TL/topological sector and
O,n
O,n

are CFT primary/descendant labels.

Then the RG blocking matrix has the schematic form
Bb:fine operators⟶coarse operators,
Bb​:fine operators⟶coarse operators,

and in the scaling basis,
Bb(Oifine)=b−ΔiOicoarse+mixing with descendants/irrelevants.
Bb​(Oifine​)=b−Δi​Oicoarse​+mixing with descendants/irrelevants.

After constructing
Eb=Bb†(BbBb†)−1/2,
Eb​=Bb†​(Bb​Bb†​)−1/2,

the ascending channel has the desired eigenvalues.

So:
topological TL data
topological TL data​

fixes allowed fusion/splitting channels;
OPE data
OPE data​

fixes nonlinear/splitting amplitudes such as
σσ→ϵ;
σσ→ϵ;
linearized RG/scaling data
linearized RG/scaling data​

fixes the eigenvalues
λi=b−Δi.
λi​=b−Δi​.

The toy ηϵηϵ​ has the second ingredient, but not the full third ingredient.
Bottom line

For the simplest TL22​/Ising toy block:
literal channel eigenvalues=1,0,…,0.
literal channel eigenvalues=1,0,…,0.​

Those are code-projection eigenvalues, not CFT scaling eigenvalues.

The expected Ising RG eigenvalues are
λ1=1,λσ=b−1/8,λϵ=b−1.
λ1​=1,λσ​=b−1/8,λϵ​=b−1.​

The toy map does match the expected CFT/OPE data because its splitting amplitude obeys
Aσσ→ϵ∼12 b−3/4,
Aσσ→ϵ​∼21​b−3/4,​

and the corresponding splitting probability obeys
Pσσ→ϵ∼14 b−3/2.
Pσσ→ϵ​∼41​b−3/2.​

So the answer is: yes for the OPE/splitting data; no, not by itself for the full scaling eigenvalue spectrum. To get the latter, the fine-graining map must be built from the full Wilsonian/CFT operator RG matrix, not only from the TL charge-refinement amplitudes.

lets do an even simpler example: fibonacci. I want all the details. Step by step apply all the info to the amplitudes and derive the fine graining maps as far as possible. then use full CFT operator RG info to rederive the scaling operators. do not skip steps. concrete claims only

I’ll fix the Fibonacci category with simples 1,τ1,τ and τ2=1+ττ2=1+τ, then separate topological amplitudes from CFT/RG-dependent scaling data.

Below I take Fibonacci to mean the unitary rank-2 Fibonacci fusion category
Irr⁡(Fib)={1,τ},τ⊗τ≃1⊕τ.
Irr(Fib)={1,τ},τ⊗τ≃1⊕τ.

For the CFT realization I use the simplest chiral Fibonacci RCFT, namely the affine VOA G2,1G2,1​, whose two irreducible modules have conformal weights
h1=0,hτ=25.
h1​=0,hτ​=52​.

That is a convention for this calculation. The nearest-neighbor golden chain of Fibonacci anyons has different continuum fixed points, for example the antiferromagnetic chain is associated with tricritical Ising c=7/10c=7/10, so its scaling dimensions are not the same as the chiral G2,1G2,1​ Fibonacci RCFT. The calculation below is the rank-2 Fibonacci-category/CFT calculation. The Fibonacci fusion rules, quantum dimension dτ=φdτ​=φ, and the standard Fibonacci FF-matrix are the usual ones.
1. Topological input

The simple objects are
1,τ,
1,τ,

with fusion rules
1⊗1=1,
1⊗1=1,
1⊗τ=τ⊗1=τ,
1⊗τ=τ⊗1=τ,
τ⊗τ=1⊕τ.
τ⊗τ=1⊕τ.

The quantum dimensions are
d1=1,dτ=φ=1+52.
d1​=1,dτ​=φ=21+5
​​.

The total quantum dimension is
D=d12+dτ2=1+φ2.
D=d12​+dτ2​
​=1+φ2
​.

Numerically,
φ≈1.6180339887,D≈1.9021130326.
φ≈1.6180339887,D≈1.9021130326.

The only nontrivial FF-matrix is
Fττττ=(φ−1φ−1/2φ−1/2−φ−1),
Fττττ​=(φ−1φ−1/2​φ−1/2−φ−1​),

in the basis where the intermediate channel is either 11 or ττ. This matrix is real, unitary, symmetric, and satisfies
(Fττττ)2=1.
(Fττττ​)2=1.
2. The local object QQ

As before,
Q=1⊕τ.
Q=1⊕τ.

A binary local fine-graining map is a categorical isometry
η:Q⟶Q⊗Q.
η:Q⟶Q⊗Q.

Since Q=1⊕τQ=1⊕τ, this is equivalent to two maps
η1:1→Q⊗Q,
η1​:1→Q⊗Q,
ητ:τ→Q⊗Q.
ητ​:τ→Q⊗Q.

Choose normalized basis morphisms
vbca:a→b⊗c
vbca​:a→b⊗c

whenever Nbca=1Nbca​=1. Fibonacci is multiplicity-free, so there is only one basis vector per allowed channel.

The allowed channels are:
1→1⊗1,1→τ⊗τin the vacuum channel,
1→1⊗1,1→τ⊗τin the vacuum channel,

and
τ→τ⊗1,τ→1⊗τ,τ→τ⊗τin the τ channel.
τ→τ⊗1,τ→1⊗τ,τ→τ⊗τin the τ channel.

Therefore the most general binary local fine graining is
η1=x v111+y vττ1,
η1​=xv111​+yvττ1​,

and
ητ=p vτ1τ+q v1ττ+r vτττ.
ητ​=pvτ1τ​+qv1ττ​+rvτττ​.

The isometry condition
η†η=id⁡Q
η†η=idQ​

is simply
∣x∣2+∣y∣2=1,
∣x∣2+∣y∣2=1,
∣p∣2+∣q∣2+∣r∣2=1.
∣p∣2+∣q∣2+∣r∣2=1.

There are no off-diagonal constraints between 11 and ττ, because
Hom⁡(1,τ)=0=Hom⁡(τ,1).
Hom(1,τ)=0=Hom(τ,1).

So before imposing RG or refinement-composition constraints, Fibonacci leaves five complex amplitudes subject to two norm constraints, modulo phase gauge.
3. Pure topological one-step amplitudes

A common topological fixed-point choice is the Perron–Frobenius or quantum-dimension splitting rule
Abca=dbdcdaD2for Nbca=1.
Abca​=da​D2db​dc​​
​for Nbca​=1.

Apply this to Fibonacci.

For the vacuum,
xPF=1D,
xPF​=D1​,
yPF=φD.
yPF​=Dφ​.

Thus
η1PF=1D v111+φD vττ1.
η1PF​=D1​v111​+Dφ​vττ1​.​

The probabilities are
P(1→11)=1D2≈0.276393,
P(1→11)=D21​≈0.276393,
P(1→ττ)=φ2D2≈0.723607.
P(1→ττ)=D2φ2​≈0.723607.

For a coarse ττ,
pPF=qPF=1D,
pPF​=qPF​=D1​,
rPF=φD.
rPF​=Dφ
​​.

Therefore
ητPF=1D vτ1τ+1D v1ττ+φD vτττ.
ητPF​=D1​vτ1τ​+D1​v1ττ​+Dφ
​​vτττ​.​

The probabilities are
P(τ→τ1)=P(τ→1τ)=1D2≈0.276393,
P(τ→τ1)=P(τ→1τ)=D21​≈0.276393,
P(τ→ττ)=φD2=15≈0.447214.
P(τ→ττ)=D2φ​=5
​1​≈0.447214.

This map is exactly isometric:
1D2+φ2D2=1,
D21​+D2φ2​=1,

and
1D2+1D2+φD2=2+φD2=1,
D21​+D21​+D2φ​=D22+φ​=1,

because
D2=1+φ2=2+φ.
D2=1+φ2=2+φ.

This is a clean one-step topological fine-graining map. It uses only the Fibonacci quantum dimensions.
4. Extra constraint: exact binary composition

Now impose a stronger requirement: binary refinement should be exactly compatible with repeated binary refinement.

That is,
(η⊗id⁡)η=α∘(id⁡⊗η)η,
(η⊗id)η=α∘(id⊗η)η,

where αα is the associator. In a strict notation, this is the coassociativity condition
(η⊗id⁡)η=(id⁡⊗η)η,
(η⊗id)η=(id⊗η)η,

but in Fibonacci we must compare the two sides using the FF-move.

Write again
η1=x v111+y vττ1,
η1​=xv111​+yvττ1​,
ητ=p vτ1τ+q v1ττ+r vτττ.
ητ​=pvτ1τ​+qv1ττ​+rvτττ​.

Assume y≠0y=0 and r≠0r=0, so vacuum pair-production and τ→τττ→ττ splitting are both present.

The channels involving at least one 11 force
p=x,q=x.
p=x,q=x.

The nontrivial condition comes from the channel
τ→τ⊗τ⊗τ.
τ→τ⊗τ⊗τ.

In the left-associated basis, the two amplitudes are indexed by the intermediate channel
m∈{1,τ}.
m∈{1,τ}.

The left refinement gives the vector
(xyr2).
(xyr2​).

The right refinement gives the same vector, but expressed in the other parenthesization, so after applying the FF-move the condition is
(xyr2)=Fττττ(xyr2).
(xyr2​)=Fττττ​(xyr2​).

Using
Fττττ=(φ−1φ−1/2φ−1/2−φ−1),
Fττττ​=(φ−1φ−1/2​φ−1/2−φ−1​),

this gives
xy=φ−1xy+φ−1/2r2,
xy=φ−1xy+φ−1/2r2,
r2=φ−1/2xy−φ−1r2.
r2=φ−1/2xy−φ−1r2.

Both equations are equivalent to
r2=φ−3/2xy.
r2=φ−3/2xy.

Now impose isometry:
x2+y2=1,
x2+y2=1,
2x2+r2=1,
2x2+r2=1,

for real positive amplitudes. The positive solution is
x=φ−1,
x=φ−1,
y=φ−1/2,
y=φ−1/2,
p=q=φ−1,
p=q=φ−1,
r=φ−3/2.
r=φ−3/2.

So the exactly binary-composable positive fine graining is
η1coassoc=φ−1v111+φ−1/2vττ1,
η1coassoc​=φ−1v111​+φ−1/2vττ1​,​

and
ητcoassoc=φ−1vτ1τ+φ−1v1ττ+φ−3/2vτττ.
ητcoassoc​=φ−1vτ1τ​+φ−1v1ττ​+φ−3/2vτττ​.​

The probabilities are
P(1→11)=φ−2≈0.381966,
P(1→11)=φ−2≈0.381966,
P(1→ττ)=φ−1≈0.618034,
P(1→ττ)=φ−1≈0.618034,

and
P(τ→τ1)=P(τ→1τ)=φ−2≈0.381966,
P(τ→τ1)=P(τ→1τ)=φ−2≈0.381966,
P(τ→ττ)=φ−3≈0.236068.
P(τ→ττ)=φ−3≈0.236068.

This map is different from the Perron–Frobenius one-step map. The distinction matters:
PF map: natural one-step topological/Kirby-color refinement.
PF map: natural one-step topological/Kirby-color refinement.​
Coassociative map: natural if binary refinements must compose exactly.
Coassociative map: natural if binary refinements must compose exactly.​

For a continuum construction with arbitrary M>NM>N, the most robust object is not necessarily one binary ηη. It is a coherent family
η(r):Q→Q⊗r,r=1,2,3,…,
η(r):Q→Q⊗r,r=1,2,3,…,

satisfying subdivision identities. The binary coassociative solution is the strictest version of that requirement.
5. Add CFT/RG data

Now choose the chiral Fibonacci CFT G2,1G2,1​. It has two irreducible modules with conformal weights
h1=0,hτ=25,
h1​=0,hτ​=52​,

and its representation category has Fibonacci fusion type.

For a binary RG block, let
ρ=fine separationcoarse scale=b−1,
ρ=coarse scalefine separation​=b−1,

where b>1b>1 is the scale factor.

The CFT/OPE contribution to a blocking coefficient has the form
βbca(ρ)∼Γbca ρha−hb−hc,
βbca​(ρ)∼Γbca​ρha​−hb​−hc​,

where ΓbcaΓbca​ contains the OPE coefficient, the regulator, the blocking kernel, field normalizations, and possible finite-scale counterterms.

For Fibonacci, the nontrivial OPE channels are
τ×τ→1,
τ×τ→1,

and
τ×τ→τ.
τ×τ→τ.

Their exponents are:
h1−2hτ=0−45=−45,
h1​−2hτ​=0−54​=−54​,

and
hτ−2hτ=−25.
hτ​−2hτ​=−52​.

So the CFT scaling predicts
βττ1(ρ)∼Γττ1ρ−4/5,
βττ1​(ρ)∼Γττ1​ρ−4/5,

and
βτττ(ρ)∼Γτττρ−2/5.
βτττ​(ρ)∼Γτττ​ρ−2/5.

The constants ΓΓ are not determined by the fusion category alone. In CFT, OPE coefficients and conformal-block normalizations have gauge dependence; only the physical correlation functions are invariant. The RG blocking kernel and normalization convention must be fixed before these become numerical amplitudes.
6. The RG blocking matrix

Write the local RG blocking map
Bρ(2):Q⊗Q→Q.
Bρ(2)​:Q⊗Q→Q.

In the normalized Fibonacci splitting basis,
Bρ(2)=∑a,b,cβbca(ρ)(vbca)†.
Bρ(2)​=a,b,c∑​βbca​(ρ)(vbca​)†.

The allowed coefficients are
β111,βττ1,
β111​,βττ1​,

and
βτ1τ,β1ττ,βτττ.
βτ1τ​,β1ττ​,βτττ​.

The CFT/RG form is
β111=u0,
β111​=u0​,
βττ1=uI ρ−4/5,
βττ1​=uI​ρ−4/5,
βτ1τ=jL,
βτ1τ​=jL​,
β1ττ=jR,
β1ττ​=jR​,
βτττ=uτ ρ−2/5.
βτττ​=uτ​ρ−2/5.

Here:
u0
u0​

is the vacuum-to-vacuum blocking coefficient,
uI
uI​

is the properly normalized identity-channel ττ→1ττ→1 RG/OPE coefficient,
jL,jR
jL​,jR​

are the ordinary one-particle interpolation/blocking coefficients, and
uτ
uτ​

is the properly normalized ττ→τττ→τ RG/OPE coefficient.

The CFT fixes the exponents
−45,−25.
−54​,−52​.

The full Wilsonian RG scheme fixes the finite constants
u0,uI,jL,jR,uτ.
u0​,uI​,jL​,jR​,uτ​.
7. Fine graining as the normalized adjoint

The isometric fine-graining map is
ηρ(2)=(Bρ(2))†(Bρ(2)(Bρ(2))†)−1/2.
ηρ(2)​=(Bρ(2)​)†(Bρ(2)​(Bρ(2)​)†)−1/2.

Because Fibonacci is multiplicity-free and because 11 and ττ do not mix, this reduces to scalar normalization in each coarse charge sector.

For the vacuum sector,
G1(ρ)=∣β111∣2+∣βττ1∣2=∣u0∣2+∣uI∣2ρ−8/5.
G1​(ρ)=∣β111​∣2+∣βττ1​∣2=∣u0​∣2+∣uI​∣2ρ−8/5.

Therefore
η1RG(ρ)=u0‾ v111+uI‾ ρ−4/5vττ1∣u0∣2+∣uI∣2ρ−8/5.
η1RG​(ρ)=∣u0​∣2+∣uI​∣2ρ−8/5
​u0​​v111​+uI​​ρ−4/5vττ1​​.​

For the ττ sector,
Gτ(ρ)=∣jL∣2+∣jR∣2+∣uτ∣2ρ−4/5.
Gτ​(ρ)=∣jL​∣2+∣jR​∣2+∣uτ​∣2ρ−4/5.

Thus
ητRG(ρ)=jL‾ vτ1τ+jR‾ v1ττ+uτ‾ ρ−2/5vτττ∣jL∣2+∣jR∣2+∣uτ∣2ρ−4/5.
ητRG​(ρ)=∣jL​∣2+∣jR​∣2+∣uτ​∣2ρ−4/5
​jL​​vτ1τ​+jR​​v1ττ​+uτ​​ρ−2/5vτττ​​.​

These are the fine-graining amplitudes as far as they can be determined from topology plus CFT scaling. The exponents are universal. The constants are Wilsonian RG data.
8. Minimal symmetric example

Take the simplest symmetric interpolation convention
jL=jR=12,
jL​=jR​=2
​1​,

and set
u0=uI=uτ=1
u0​=uI​=uτ​=1

as a normalization convention. This is not universal physics; it is the simplest concrete scheme.

Then
η1min(ρ)=v111+ρ−4/5vττ11+ρ−8/5,
η1min​(ρ)=1+ρ−8/5
​v111​+ρ−4/5vττ1​​,

and
ητmin(ρ)=12vτ1τ+12v1ττ+ρ−2/5vτττ1+ρ−4/5.
ητmin​(ρ)=1+ρ−4/5
​2
​1​vτ1τ​+2
​1​v1ττ​+ρ−2/5vτττ​​.

For binary scaling,
b=2,ρ=12.
b=2,ρ=21​.

Then
ρ−4/5=24/5≈1.74110,
ρ−4/5=24/5≈1.74110,

so in the ττ-sector,
P(τ→ττ)=ρ−4/51+ρ−4/5=24/51+24/5≈0.635183.
P(τ→ττ)=1+ρ−4/5ρ−4/5​=1+24/524/5​≈0.635183.

Also
P(τ→τ1)=P(τ→1τ)=1/21+24/5≈0.182408.
P(τ→τ1)=P(τ→1τ)=1+24/51/2​≈0.182408.

For the vacuum,
P(1→ττ)=ρ−8/51+ρ−8/5=28/51+28/5≈0.751949.
P(1→ττ)=1+ρ−8/5ρ−8/5​=1+28/528/5​≈0.751949.

This illustrates a sharp point: because hτ=2/5hτ​=2/5, the OPE channels involving ττττ are relevant and grow under coarse graining. The normalized fine-graining adjoint therefore gives substantial ττττ dressing unless the Wilsonian constants uI,uτuI​,uτ​ suppress it.
9. General rr-site Fibonacci refinement

For a block of rr fine sites,
ηa(r):a→Q⊗r
ηa(r)​:a→Q⊗r

has the expansion
ηa(r)=∑ν∈Br(a)Aνa vνa,
ηa(r)​=ν∈Br​(a)∑​Aνa​vνa​,

where Br(a)Br​(a) is the set of admissible Fibonacci fusion trees with total charge aa. The basis vector
vνa:a→b1⊗⋯⊗br
vνa​:a→b1​⊗⋯⊗br​

is nonzero only when
a⊂b1⊗⋯⊗br.
a⊂b1​⊗⋯⊗br​.

The isometry condition is
∑ν∈Br(a)∣Aνa∣2=1.
ν∈Br​(a)∑​∣Aνa​∣2=1.

The RG blocking coefficients are
βνa(ρ),
βνa​(ρ),

and the fine-graining amplitudes are
Aνa(ρ)=βνa(ρ)‾∑μ∈Br(a)∣βμa(ρ)∣2.
Aνa​(ρ)=∑μ∈Br​(a)​∣βμa​(ρ)∣2
​βνa​(ρ)​​.​

The CFT scaling part of ββ is
βνa(ρ)∼Γνa ρha−∑ihbi,
βνa​(ρ)∼Γνa​ρha​−∑i​hbi​​,

plus descendant and irrelevant-operator corrections. For Fibonacci G2,1G2,1​,
h1=0,hτ=25.
h1​=0,hτ​=52​.

So if the fine cluster contains nτnτ​ ττ-charges and has total coarse charge aa, then the primary-channel exponent is
ha−25nτ.
ha​−52​nτ​.

That is the direct rr-site generalization.
10. The charge-only ascending channel

Now compute the simple local ascending channel from a binary isometry.

Take a diagonal one-site operator
O=o1P1+oτPτ∈End⁡(Q).
O=o1​P1​+oτ​Pτ​∈End(Q).

Define the averaged one-site ascending map
A(O)=12η†(O⊗1)η+12η†(1⊗O)η.
A(O)=21​η†(O⊗1)η+21​η†(1⊗O)η.

For amplitudes
η1=xv111+yvττ1,
η1​=xv111​+yvττ1​,
ητ=pvτ1τ+qv1ττ+rvτττ,
ητ​=pvτ1τ​+qv1ττ​+rvτττ​,

this gives
o1′=∣x∣2o1+∣y∣2oτ,
o1′​=∣x∣2o1​+∣y∣2oτ​,

and
oτ′=∣p∣2+∣q∣22o1+(∣p∣2+∣q∣22+∣r∣2)oτ.
oτ′​=2∣p∣2+∣q∣2​o1​+(2∣p∣2+∣q∣2​+∣r∣2)oτ​.

For symmetric amplitudes p=qp=q, write
X=∣x∣2,P=∣p∣2=∣q∣2.
X=∣x∣2,P=∣p∣2=∣q∣2.

Then the matrix is
A=(X1−XP1−P).
A=(XP​1−X1−P​).

Its eigenvalues are
λ0=1,
λ0​=1,

and
λcharge=X−P.
λcharge​=X−P.

Now check the two topological maps.

For the PF map,
X=1D2,P=1D2,
X=D21​,P=D21​,

so
λcharge=0.
λcharge​=0.

For the coassociative map,
X=φ−2,P=φ−2,
X=φ−2,P=φ−2,

so again
λcharge=0.
λcharge​=0.

Therefore:
the topological charge-only one-site channel does not reproduce the CFT scaling eigenvalue.
the topological charge-only one-site channel does not reproduce the CFT scaling eigenvalue.​

It only says that the nontrivial local charge contrast is washed out under this crude one-site topological averaging.

This is not a contradiction. The CFT scaling operator is not merely the diagonal projector difference
Pτ−P1.
Pτ​−P1​.

It is a genuine CFT operator living in a full module, with spatial profile, descendants, and RG normalization.
11. Full CFT operator RG and scaling operators

The full operator RG channel acts on CFT operators, not only on the two charge projectors.

In the chiral G2,1G2,1​ Fibonacci RCFT, the primary sectors are
1,τ.
1,τ.

The primary scaling operators satisfy
Ab(Oi)=λiOi,
Ab​(Oi​)=λi​Oi​,

with
λi=b−hi.
λi​=b−hi​.

Therefore
O1=1,λ1=1.
O1​=1,λ1​=1.​

For the Fibonacci primary,
Oτ=Φτ,λτ=b−2/5.
Oτ​=Φτ​,λτ​=b−2/5.​

For binary scaling b=2b=2,
λτ=2−2/5≈0.757858.
λτ​=2−2/5≈0.757858.​

Descendants have eigenvalues shifted by their level. For a chiral descendant at level nn,
Oτ,n∼L−n1⋯L−nkΦτ,n=n1+⋯+nk,
Oτ,n​∼L−n1​​⋯L−nk​​Φτ​,n=n1​+⋯+nk​,

the eigenvalue is
λτ,n=b−(2/5+n).
λτ,n​=b−(2/5+n).​

Vacuum descendants have
λ1,n=b−n.
λ1,n​=b−n.

For example, a chiral current of weight 11, when present in the vacuum module, has
λ=b−1,
λ=b−1,

and the stress tensor has
λ=b−2.
λ=b−2.

If instead one uses the diagonal nonchiral CFT, the corresponding scalar primary has
Δτ=hτ+hˉτ=45,
Δτ​=hτ​+hˉτ​=54​,

so the nonchiral eigenvalue is
λτnonchiral=b−4/5.
λτnonchiral​=b−4/5.​

For b=2b=2,
λτnonchiral=2−4/5≈0.574349.
λτnonchiral​=2−4/5≈0.574349.
12. Consistency between amplitudes and scaling operators

The same conformal weight
hτ=25
hτ​=52​

appears in both places.

For the operator RG,
λτ=b−2/5.
λτ​=b−2/5.

For the OPE/fine-graining coefficients,
τ×τ→τ
τ×τ→τ

has exponent
hτ−2hτ=−25,
hτ​−2hτ​=−52​,

so
βτττ(ρ)∼ρ−2/5=b2/5.
βτττ​(ρ)∼ρ−2/5=b2/5.

Likewise,
τ×τ→1
τ×τ→1

has exponent
h1−2hτ=−45,
h1​−2hτ​=−54​,

so
βττ1(ρ)∼ρ−4/5=b4/5.
βττ1​(ρ)∼ρ−4/5=b4/5.

Thus the CFT data is internally consistent:
operator eigenvalue: b−2/5
operator eigenvalue: b−2/5​

and
OPE coefficient growth for ττ→τ: b2/5.
OPE coefficient growth for ττ→τ: b2/5.​

They are inverse-looking because one describes the scaling of a single primary operator, while the other describes the short-distance OPE coefficient needed to collapse two fine ττ insertions into one coarse ττ.
13. Final fine-graining maps

The three useful Fibonacci maps are therefore:
Topological PF one-step map
η1PF=1D v111+φD vττ1,
η1PF​=D1​v111​+Dφ​vττ1​,​
ητPF=1D vτ1τ+1D v1ττ+φD vτττ.
ητPF​=D1​vτ1τ​+D1​v1ττ​+Dφ
​​vτττ​.​
Strict binary-composition map
η1coassoc=φ−1v111+φ−1/2vττ1,
η1coassoc​=φ−1v111​+φ−1/2vττ1​,​
ητcoassoc=φ−1vτ1τ+φ−1v1ττ+φ−3/2vτττ.
ητcoassoc​=φ−1vτ1τ​+φ−1v1ττ​+φ−3/2vτττ​.​
CFT/RG-driven map
η1RG(ρ)=u0‾ v111+uI‾ ρ−4/5vττ1∣u0∣2+∣uI∣2ρ−8/5,
η1RG​(ρ)=∣u0​∣2+∣uI​∣2ρ−8/5
​u0​​v111​+uI​​ρ−4/5vττ1​​,​
ητRG(ρ)=jL‾ vτ1τ+jR‾ v1ττ+uτ‾ ρ−2/5vτττ∣jL∣2+∣jR∣2+∣uτ∣2ρ−4/5.
ητRG​(ρ)=∣jL​∣2+∣jR​∣2+∣uτ​∣2ρ−4/5
​jL​​vτ1τ​+jR​​v1ττ​+uτ​​ρ−2/5vτττ​​.​

The first two are topological choices. The third is the actual finite-scale RG fine graining once the Wilsonian constants are known.

The corresponding primary scaling operators of the chiral Fibonacci G2,1G2,1​ CFT are
1,λ=1,
1,λ=1,​

and
Φτ,λ=b−2/5.
Φτ​,λ=b−2/5.​

For the diagonal nonchiral version, replace
25
52​

by
45.
54​.

So the conclusion is:
Fibonacci topology fixes the allowed channels and F-move constraints.
Fibonacci topology fixes the allowed channels and F-move constraints.​
Isometry fixes normalization.
Isometry fixes normalization.​
Exact binary composition fixes a special topological solution.
Exact binary composition fixes a special topological solution.​
Full CFT/RG data fixes the scale-dependent amplitudes and scaling eigenoperators.
Full CFT/RG data fixes the scale-dependent amplitudes and scaling eigenoperators.​

The topological charge-only map by itself does not reproduce the CFT scaling eigenvalue b−2/5b−2/5. The full CFT operator RG does, because the scaling field ΦτΦτ​ is a CFT primary, not merely the one-site charge projector PτPτ​.

i want to formalise all of this with a coding agent who has access to lean, julia, wolframscript. please write me a handoff doc which summarises carefully the foundational definitions, the basic results (phrased as unproven) and conjectures. The coding agent will be tasked with formalising and proving these results

I’ll write this as a formalization handoff: definitions, theorem targets, conjectural RG/CFT assumptions, concrete Fibonacci/TL examples, and a Lean/Julia/Wolfram task split.
Handoff document: categorical Fock spaces, fine graining, RG amplitudes, and scaling operators

This document is for a coding/formalisation agent with access to Lean, Julia, and Wolframscript. Its purpose is to turn the current project discussion into a precise list of definitions, theorem targets, computational checks, and conjectures.

All theorem-like statements below should be treated as unproven targets unless explicitly marked as a definition. The agent’s task is to formalise them, test them computationally, and prove them where possible.
0. External mathematical facts used

The project uses the following stable background facts.

The Fibonacci fusion category has two simple objects, usually denoted 11 and ττ, with
τ⊗τ≅1⊕τ,
τ⊗τ≅1⊕τ,

and quantum dimension
dτ=φ=1+52.
dτ​=φ=21+5
​​.

A standard Fibonacci FF-matrix is
Fττττ=(φ−1φ−1/2φ−1/2−φ−1).
Fττττ​=(φ−1φ−1/2​φ−1/2−φ−1​).

These facts are standard in the Fibonacci anyon literature.

For a chiral CFT realisation of Fibonacci-type data, one may use the spin-11 sector of SU(2)3SU(2)3​, where the spin-11 primary has conformal weight
hτ=25.
hτ​=52​.

Equivalently, Fibonacci-type topological order appears in level-one G2G2​ WZW-type constructions; the h=2/5h=2/5 datum is part of this standard correspondence.

For Temperley–Lieb/Jones-type categories at roots of unity, one works with semisimple quotients or reduced categories. The Jones–Wenzl quotient and associated fusion-category interpretation are standard.

For topological fixed-point string-net intuition, the local data are FF-symbols and quantum dimensions, with fixed-point wavefunctions determined by local relations.
1. Core categorical setup
1.1 Fusion-category input

Work over CC.

A unitary fusion category CC should be treated, initially, as the following data:

    A finite set of simple labels

Irr⁡(C).
Irr(C).

    A distinguished unit/simple vacuum object

1∈Irr⁡(C).
1∈Irr(C).

    Fusion multiplicities

Nabc∈N.
Nabc​∈N.

    Finite-dimensional Hom spaces

Hom⁡C(X,Y).
HomC​(X,Y).

    A dagger operation

(−)†:Hom⁡(X,Y)→Hom⁡(Y,X)
(−)†:Hom(X,Y)→Hom(Y,X)

compatible with tensor product and composition.

    Direct sums/biproducts.

    Tensor product, associators, unitors, and, optionally, braiding.

For Lean, it may be too ambitious to begin with the full category-theoretic structure. A practical first formalisation can use a skeletal finite semisimple model: objects are finite formal sums of simple labels, and morphism spaces are finite-dimensional complex vector spaces assembled from fusion multiplicities and FF-symbols.
1.2 The local occupation object

Define
Q:=⨁a∈Irr⁡(C)a.
Q:=a∈Irr(C)⨁​a.

Interpretation:
Q=“one site may be empty or may contain one simple anyon.”
Q=“one site may be empty or may contain one simple anyon.”

The vacuum 1⊂Q1⊂Q means “empty site.”

For NN ordered sites, define
Q⊗N:=Q⊗⋯⊗Q⏟N factors.
Q⊗N:=N factors
Q⊗⋯⊗Q​​.

The order of tensor factors matters. Without braiding, no canonical exchange operation exists.
2. Indefinite-particle Hilbert spaces
2.1 Definition

For total charge W∈Irr⁡(C)W∈Irr(C), define
HNW:=Hom⁡C(W,Q⊗N).
HNW​:=HomC​(W,Q⊗N).

This is the NN-site, indefinite-particle-number Hilbert space in total-charge sector WW.

If CC is merely fusion, this is a finite-dimensional vector space. If CC is unitary fusion, it is a Hilbert space.
2.2 Configuration-space expansion

Let
a⃗=(a1,…,aN)∈Irr⁡(C)N.
a
=(a1​,…,aN​)∈Irr(C)N.

Define
Aa⃗:=a1⊗⋯⊗aN.
Aa
​:=a1​⊗⋯⊗aN​.

Because
Q⊗N≅⨁a⃗∈Irr⁡(C)NAa⃗,
Q⊗N≅a
∈Irr(C)N⨁​Aa
​,

there should be a canonical isomorphism
Hom⁡(W,Q⊗N)≅⨁a⃗∈Irr⁡(C)NHom⁡(W,Aa⃗).
Hom(W,Q⊗N)≅a
∈Irr(C)N⨁​Hom(W,Aa
​).
Theorem target 2.2.1

Formalise and prove:
HNW≅⨁(a1,…,aN)Hom⁡(W,a1⊗⋯⊗aN).
HNW​≅(a1​,…,aN​)⨁​Hom(W,a1​⊗⋯⊗aN​).​

If the category is unitary and the direct-sum inclusions are chosen as isometries, this isomorphism is unitary.
2.3 Particle number

A tuple
(a1,…,aN)
(a1​,…,aN​)

has particle number
#{i:ai≠1}.
#{i:ai​=1}.

Thus
HNW
HNW​

contains sectors with particle number
0,1,…,N.
0,1,…,N.

This is the categorical analogue of a Fock space, except the fibre over a configuration is a fusion Hom space, not a tensor product of one-particle Hilbert spaces.
3. Braiding and exchange
3.1 Non-braided case

If CC is only a fusion category, Q⊗NQ⊗N is an ordered object. The construction still makes sense, but no canonical exchange of neighbouring sites exists.

Fine-graining maps in a non-braided category should therefore be order-preserving unless the construction avoids crossings entirely.
3.2 Braided case

If CC is braided, with braiding
cX,Y:X⊗Y→Y⊗X,
cX,Y​:X⊗Y→Y⊗X,

then
cQ,Q:Q⊗Q→Q⊗Q
cQ,Q​:Q⊗Q→Q⊗Q

defines neighbouring exchange maps
Bi=id⁡Q⊗(i−1)⊗cQ,Q⊗id⁡Q⊗(N−i−1).
Bi​=idQ⊗(i−1)​⊗cQ,Q​⊗idQ⊗(N−i−1)​.
Theorem target 3.2.1

Prove that the BiBi​ satisfy braid relations:
BiBi+1Bi=Bi+1BiBi+1,
Bi​Bi+1​Bi​=Bi+1​Bi​Bi+1​,
BiBj=BjBi∣i−j∣≥2.
Bi​Bj​=Bj​Bi​∣i−j∣≥2.

Therefore Q⊗NQ⊗N, and hence
Hom⁡(W,Q⊗N),
Hom(W,Q⊗N),

carries a representation of the braid group BNBN​.
4. Fine-graining maps
4.1 Global definition

For M>NM>N, a fine-graining map should be a categorical isometry
EN→M:Q⊗N→Q⊗M
EN→M​:Q⊗N→Q⊗M

satisfying
EN→M†EN→M=id⁡Q⊗N.
EN→M†​EN→M​=idQ⊗N​.​

The induced Hilbert-space map in total-charge sector WW is
VN→MW:Hom⁡(W,Q⊗N)→Hom⁡(W,Q⊗M)
VN→MW​:Hom(W,Q⊗N)→Hom(W,Q⊗M)

defined by
VN→MW(f)=EN→M∘f.
VN→MW​(f)=EN→M​∘f.
Theorem target 4.1.1

If
E†E=id⁡,
E†E=id,

then
VW
VW

is an isometry for every WW.

Conversely, if VWVW is an isometry for all simple WW, then
E†E=id⁡
E†E=id

under a semisimplicity/separating-Hom assumption.
4.2 Component form

Using
Q⊗N≅⨁a⃗Aa⃗,Q⊗M≅⨁b⃗Bb⃗,
Q⊗N≅a
⨁​Aa
​,Q⊗M≅b
⨁​Bb
​,

define components
Eb⃗,a⃗:=πb⃗Eιa⃗∈Hom⁡(Aa⃗,Bb⃗).
Eb
,a
​:=πb
​Eιa
​∈Hom(Aa
​,Bb
​).
Theorem target 4.2.1

The isometry condition is equivalent to
∑b⃗Eb⃗,a⃗†Eb⃗,a⃗′=δa⃗,a⃗′id⁡Aa⃗.
b
∑​Eb
,a
†​Eb
,a
′​=δa
,a
′​idAa
​​.​

This is the categorical orthogonality and normalisation condition on fine-graining amplitudes.
4.3 Physical interpretation of components

A component
Eb⃗,a⃗∈Hom⁡(a1⊗⋯⊗aN,b1⊗⋯⊗bM)
Eb
,a
​∈Hom(a1​⊗⋯⊗aN​,b1​⊗⋯⊗bM​)

is nonzero only if the fine configuration b⃗b
has total charge compatible with the coarse configuration a⃗a
.

This allows:

    ordinary interpolation of a particle from coarse site ii to a fine spatial distribution;

    vacuum pair production;

    particle splitting;

    short-distance fusion/collision;

    virtual neutral dressing clouds.

5. Local block fine graining
5.1 Arbitrary M>NM>N

Do not restrict to M=2NM=2N.

Choose an ordered partition
{1,…,M}=B1⊔⋯⊔BN
{1,…,M}=B1​⊔⋯⊔BN​

with
∣Bi∣=ri,ri≥1,∑iri=M.
∣Bi​∣=ri​,ri​≥1,i∑​ri​=M.

Choose local isometries
ηi:Q→Q⊗ri.
ηi​:Q→Q⊗ri​.

Define
EN→Mblock=η1⊗⋯⊗ηN.
EN→Mblock​=η1​⊗⋯⊗ηN​.
Theorem target 5.1.1

If
ηi†ηi=id⁡Q
ηi†​ηi​=idQ​

for all ii, then
(EN→Mblock)†EN→Mblock=id⁡Q⊗N.
(EN→Mblock​)†EN→Mblock​=idQ⊗N​.
5.2 Dressing unitary

More generally,
EN→M=UM(η1⊗⋯⊗ηN),
EN→M​=UM​(η1​⊗⋯⊗ηN​),

where
UM:Q⊗M→Q⊗M
UM​:Q⊗M→Q⊗M

is unitary.
Theorem target 5.2.1

If each ηiηi​ is isometric and UMUM​ is unitary, then EN→MEN→M​ is isometric.

Interpretation:
local categorical splitting+fine-scale RG dressing unitary.
local categorical splitting+fine-scale RG dressing unitary.​
6. RG blocking and canonical fine graining
6.1 Blocking map

The natural RG object is a coarse-graining or blocking map
BN←M:Q⊗M→Q⊗N.
BN←M​:Q⊗M→Q⊗N.

For a local rr-site block,
B(r):Q⊗r→Q.
B(r):Q⊗r→Q.

If the retained coarse subspace is fixed, then the canonical isometric section is
EN→M=BN←M†(BN←MBN←M†)−1/2.
EN→M​=BN←M†​(BN←M​BN←M†​)−1/2.​

This requires
BN←MBN←M†
BN←M​BN←M†​

to be positive and invertible on the retained coarse subspace.
Theorem target 6.1.1

For finite-dimensional Hilbert spaces, prove:

If B:Hfine→HcoarseB:Hfine​→Hcoarse​ has full rank onto HcoarseHcoarse​, then
E:=B†(BB†)−1/2
E:=B†(BB†)−1/2

satisfies
E†E=id⁡Hcoarse.
E†E=idHcoarse​​.

This is the polar-decomposition fine-graining map.
6.2 Amplitude formula

Choose orthonormal coarse and fine bases. Write
B∣ν⟩fine=∑μβμν∣μ⟩coarse.
B∣ν⟩fine​=μ∑​βμν​∣μ⟩coarse​.

Define
Gμμ′:=(BB†)μμ′=∑νβμνβμ′ν‾.
Gμμ′​:=(BB†)μμ′​=ν∑​βμν​βμ′ν​​.

Then
E∣μ⟩=∑νAνμ∣ν⟩
E∣μ⟩=ν∑​Aνμ​∣ν⟩

with
Aνμ=∑μ′βμ′ν‾ Gμ′μ−1/2.
Aνμ​=μ′∑​βμ′ν​​Gμ′μ−1/2​.​
Theorem target 6.2.1

Prove the matrix amplitude formula above from the polar-decomposition definition.
No-mixing corollary target

If the coarse label μμ does not mix with other coarse labels, then
Aνμ=βμν‾∑ν′∣βμν′∣2.
Aνμ​=∑ν′​∣βμν′​∣2
​βμν​​​.​
7. CFT/RG input
7.1 Blocking coefficients from OPE data

Let b>1b>1 be an RG scale factor and
ρ=b−1
ρ=b−1

a dimensionless fine separation in coarse units.

For chiral CFT data, a leading OPE/blocking coefficient has the schematic form
βb1⋯bra(ρ)∼Γb1⋯bra ρha−∑ihbi.
βb1​⋯br​a​(ρ)∼Γb1​⋯br​a​ρha​−∑i​hbi​​.

For nonchiral data, replace conformal weights hh by scaling dimensions
Δ=h+hˉ.
Δ=h+hˉ.

The constants
Γb1⋯bra
Γb1​⋯br​a​

include:

    OPE coefficients;

    field normalisations;

    wavefunction renormalisations;

    blocking-kernel data;

    regulator/counterterm data;

    descendant and irrelevant-operator mixing.

Important modelling decision

In formalisation, do not pretend that CFT scaling dimensions alone determine finite-scale amplitudes.

Treat
βμν(ρ)
βμν​(ρ)

as RG input data, with CFT imposing constraints such as powers of ρρ, selection rules, and possibly known OPE coefficients.
7.2 Scaling operators

A full operator RG channel at scale factor bb has scaling operators
Oi
Oi​

satisfying
Ab(Oi)=λiOi
Ab​(Oi​)=λi​Oi​​

with
λi=b−Δi
λi​=b−Δi​​

in a nonchiral theory, or
λi=b−hi
λi​=b−hi​

in a chiral theory.
Critical warning

The charge-only categorical fine-graining map generally does not recover the CFT scaling spectrum. To recover scaling operators, the formalisation must enlarge labels from topological charge alone to something like
μ=(a,O,n),
μ=(a,O,n),

where
a
a

is a topological sector,
O
O

is a CFT primary or scaling operator, and
n
n

encodes descendant or mixing data.
8. Operator channels induced by fine graining

Let
E:Q⊗N→Q⊗M
E:Q⊗N→Q⊗M

be an isometry.
8.1 State embedding

On total-charge sector WW,
VW(f)=Ef.
VW(f)=Ef.

The state embedding is
ρN↦VWρN(VW)†.
ρN​↦VWρN​(VW)†.
8.2 Ascending observable channel

For a fine observable OMOM​, define
AM→NW(OM)=(VW)†OMVW.
AM→NW​(OM​)=(VW)†OM​VW.​

Categorically, if
TM∈End⁡(Q⊗M),
TM​∈End(Q⊗M),

then
TN=E†TME∈End⁡(Q⊗N).
TN​=E†TM​E∈End(Q⊗N).​
Theorem target 8.2.1

Prove that AA is:

    unital:

A(1M)=1N;
A(1M​)=1N​;

    completely positive;

    ∗∗-preserving;

    expectation-value preserving against embedded states.

8.3 Logical lift

For a coarse observable ONON​, define its canonical fine representative
LN→M(ON)=VONV†.
LN→M​(ON​)=VON​V†.​

This satisfies
V†L(ON)V=ON.
V†L(ON​)V=ON​.

But
L(1N)=VV†,
L(1N​)=VV†,

the projector onto the code subspace, not the full fine identity.
9. Fibonacci worked specification

This is the simplest concrete category to implement first.
9.1 Exact algebraic constants

Use the exact field
Q(5).
Q(5
​).

Define
φ:=1+52.
φ:=21+5
​​.

Useful identities:
φ2=φ+1,
φ2=φ+1,
φ−1=φ−1,
φ−1=φ−1,
φ−2=2−φ.
φ−2=2−φ.

Quantum dimensions:
d1=1,dτ=φ.
d1​=1,dτ​=φ.

Total quantum dimension:
D:=1+φ2.
D:=1+φ2
​.

Since
1+φ2=2+φ,
1+φ2=2+φ,

we have
D2=2+φ.
D2=2+φ.
9.2 Fusion rules
1⊗1=1,
1⊗1=1,
1⊗τ=τ,
1⊗τ=τ,
τ⊗1=τ,
τ⊗1=τ,
τ⊗τ=1⊕τ.
τ⊗τ=1⊕τ.

Multiplicity-free.
9.3 FF-matrix

The only nontrivial FF-move needed initially is
Fττττ=(φ−1φ−1/2φ−1/2−φ−1).
Fττττ​=(φ−1φ−1/2​φ−1/2−φ−1​).
Theorem target 9.3.1

Prove exactly:
F†F=I.
F†F=I.

Since the entries are real, this is
FTF=I.
FTF=I.

Also prove:
F2=I.
F2=I.

This is easy with
φ−2+φ−1=1.
φ−2+φ−1=1.
9.4 General binary fine graining

Let
η:Q→Q⊗Q
η:Q→Q⊗Q

with
Q=1⊕τ.
Q=1⊕τ.

Write
η1=x v111+y vττ1,
η1​=xv111​+yvττ1​,

and
ητ=p vτ1τ+q v1ττ+r vτττ.
ητ​=pvτ1τ​+qv1ττ​+rvτττ​.

Here vbca:a→b⊗cvbca​:a→b⊗c is the unique normalised fusion-tree basis morphism whenever Nbca=1Nbca​=1.
Theorem target 9.4.1

The isometry condition
η†η=id⁡Q
η†η=idQ​

is equivalent to
∣x∣2+∣y∣2=1,
∣x∣2+∣y∣2=1,
∣p∣2+∣q∣2+∣r∣2=1.
∣p∣2+∣q∣2+∣r∣2=1.

No cross-condition exists between the 11 and ττ sectors because
Hom⁡(1,τ)=0.
Hom(1,τ)=0.
9.5 Topological Perron–Frobenius amplitudes

A natural topological one-step choice is
Abca=dbdcdaD2
Abca​=da​D2db​dc​​
​

for allowed channels.

For Fibonacci this gives:
η1PF=1D v111+φD vττ1.
η1PF​=D1​v111​+Dφ​vττ1​.​

For the ττ sector:
ητPF=1D vτ1τ+1D v1ττ+φD vτττ.
ητPF​=D1​vτ1τ​+D1​v1ττ​+Dφ
​​vτττ​.​
Theorem target 9.5.1

Prove that ηPFηPF is isometric.

Explicitly:
1D2+φ2D2=1,
D21​+D2φ2​=1,

and
1D2+1D2+φD2=1.
D21​+D21​+D2φ​=1.
Numerical probabilities

Vacuum:
P(1→11)=1D2,
P(1→11)=D21​,
P(1→ττ)=φ2D2.
P(1→ττ)=D2φ2​.

Tau:
P(τ→τ1)=1D2,
P(τ→τ1)=D21​,
P(τ→1τ)=1D2,
P(τ→1τ)=D21​,
P(τ→ττ)=φD2.
P(τ→ττ)=D2φ​.
9.6 Strict binary-composition candidate

Impose a stronger condition:
(η⊗id⁡)η=α∘(id⁡⊗η)η,
(η⊗id)η=α∘(id⊗η)η,

where αα is the associator.

In strict notation:
(η⊗id⁡)η=(id⁡⊗η)η.
(η⊗id)η=(id⊗η)η.

Using the Fibonacci FF-move to compare parenthesisations, the positive real solution found by hand is:
η1coassoc=φ−1v111+φ−1/2vττ1,
η1coassoc​=φ−1v111​+φ−1/2vττ1​,​
ητcoassoc=φ−1vτ1τ+φ−1v1ττ+φ−3/2vτττ.
ητcoassoc​=φ−1vτ1τ​+φ−1v1ττ​+φ−3/2vτττ​.​
Derivation sketch to formalise

Assume
x,y,p,q,r>0.
x,y,p,q,r>0.

The channels involving 11 force
p=x,q=x.
p=x,q=x.

The nontrivial τ→ττττ→τττ comparison gives
(xyr2)=Fττττ(xyr2).
(xyr2​)=Fττττ​(xyr2​).

Equivalently,
r2=φ−3/2xy.
r2=φ−3/2xy.

Together with isometry,
x2+y2=1,
x2+y2=1,
2x2+r2=1,
2x2+r2=1,

the positive solution should be
x=φ−1,y=φ−1/2,r=φ−3/2.
x=φ−1,y=φ−1/2,r=φ−3/2.
Theorem target 9.6.1

Formalise and prove the above claim.
Important caveat

This is not necessarily the same as the PF topological one-step map. The PF map is natural from quantum dimensions/string-net fixed-point weighting. The coassociative map is natural from exact binary subdivision. The project should keep these distinct.
9.7 Fibonacci RG/CFT amplitudes

Use chiral Fibonacci CFT data with
h1=0,hτ=25.
h1​=0,hτ​=52​.

Let
ρ=b−1.
ρ=b−1.

The allowed local blocking coefficients are:
β111=u0,
β111​=u0​,
βττ1=uIρ−4/5,
βττ1​=uI​ρ−4/5,
βτ1τ=jL,
βτ1τ​=jL​,
β1ττ=jR,
β1ττ​=jR​,
βτττ=uτρ−2/5.
βτττ​=uτ​ρ−2/5.

Explanation of exponents:
h1−2hτ=−45,
h1​−2hτ​=−54​,
hτ−2hτ=−25.
hτ​−2hτ​=−52​.

The constants
u0,uI,jL,jR,uτ
u0​,uI​,jL​,jR​,uτ​

are Wilsonian RG data.

The resulting canonical isometric fine graining is:
η1RG(ρ)=u0‾ v111+uI‾ρ−4/5vττ1∣u0∣2+∣uI∣2ρ−8/5.
η1RG​(ρ)=∣u0​∣2+∣uI​∣2ρ−8/5
​u0​​v111​+uI​​ρ−4/5vττ1​​.​
ητRG(ρ)=jL‾ vτ1τ+jR‾ v1ττ+uτ‾ρ−2/5vτττ∣jL∣2+∣jR∣2+∣uτ∣2ρ−4/5.
ητRG​(ρ)=∣jL​∣2+∣jR​∣2+∣uτ​∣2ρ−4/5
​jL​​vτ1τ​+jR​​v1ττ​+uτ​​ρ−2/5vτττ​​.​
Theorem target 9.7.1

Assuming the ββ-coefficients above, derive these amplitudes from
E=B†(BB†)−1/2.
E=B†(BB†)−1/2.
Computational experiment 9.7.A

In Julia, allow symbolic or high-precision values for
u0,uI,jL,jR,uτ,ρ.
u0​,uI​,jL​,jR​,uτ​,ρ.

Check:
η1†η1=1,
η1†​η1​=1,
ητ†ητ=1.
ητ†​ητ​=1.

Plot probabilities versus bb or ρρ, e.g.
P(τ→ττ)=∣uτ∣2ρ−4/5∣jL∣2+∣jR∣2+∣uτ∣2ρ−4/5.
P(τ→ττ)=∣jL​∣2+∣jR​∣2+∣uτ​∣2ρ−4/5∣uτ​∣2ρ−4/5​.
9.8 Fibonacci scaling operators

For the chiral Fibonacci CFT:
O1=1,h1=0,λ1=1.
O1​=1,h1​=0,λ1​=1.
Oτ=Φτ,hτ=25,λτ=b−2/5.
Oτ​=Φτ​,hτ​=52​,λτ​=b−2/5.

Descendants have
λτ,n=b−(2/5+n).
λτ,n​=b−(2/5+n).

Vacuum descendants have
λ1,n=b−n.
λ1,n​=b−n.

For a diagonal nonchiral theory, replace
hτ=25
hτ​=52​

by
Δτ=45.
Δτ​=54​.

Then
λτ=b−4/5.
λτ​=b−4/5.
Theorem target 9.8.1

If the full operator RG matrix is diagonal in the CFT scaling basis with entries
b−hi
b−hi​

or
b−Δi,
b−Δi​,

then the ascending channel has the corresponding scaling eigenoperators and eigenvalues.
Warning to formalise as a negative example

The charge-only two-dimensional operator space
End⁡(Q)
End(Q)

does not recover the full CFT scaling spectrum. A one-site charge projector contrast generally has eigenvalue determined by the chosen categorical fine-graining amplitudes, not by b−2/5b−2/5.
10. Temperley–Lieb / Ising note

This part is secondary but useful for cross-checks.

For TL2TL2​, or Ising-type fusion rules, use simple labels
1,σ,ϵ
1,σ,ϵ

with
σ⊗σ=1⊕ϵ,
σ⊗σ=1⊕ϵ,
σ⊗ϵ=σ,
σ⊗ϵ=σ,
ϵ⊗ϵ=1.
ϵ⊗ϵ=1.

A binary refinement of ϵϵ has channels
ϵ→ϵ⊗1,
ϵ→ϵ⊗1,
ϵ→1⊗ϵ,
ϵ→1⊗ϵ,
ϵ→σ⊗σin the ϵ channel.
ϵ→σ⊗σin the ϵ channel.

Using nonchiral Ising CFT data
Δσ=18,Δϵ=1,
Δσ​=81​,Δϵ​=1,

the OPE exponent for
σσ→ϵ
σσ→ϵ

is
Δϵ−2Δσ=34.
Δϵ​−2Δσ​=43​.

With symmetric interpolation and minimal normalisation, the toy refinement is
ηϵ(ρ)=12vϵϵ,1+12vϵ1,ϵ+12ρ3/4vϵσ,σ;ϵ1+14ρ3/2.
ηϵ​(ρ)=1+41​ρ3/2
​2
​1​vϵϵ,1​+2
​1​vϵ1,ϵ​+21​ρ3/4vϵσ,σ;ϵ​​.

This toy map tests OPE-level amplitude scaling, not the full Ising scaling spectrum.
11. Direct-limit continuum structure

For a sequence or directed system of refinements, require:
EN→N=id⁡,
EN→N​=id,
EM→LEN→M=EN→L.
EM→L​EN→M​=EN→L​.

Then define a continuum Hilbert space as a completed direct limit:
H∞W=lim→⁡NHNW‾.
H∞W​=N
lim​​HNW​​.
Conjecture 11.1

A physically correct continuum fine-graining scheme should be a coherent family
η(r):Q→Q⊗r,r=1,2,3,…,
η(r):Q→Q⊗r,r=1,2,3,…,

compatible with arbitrary ordered subdivisions.

This likely has an operadic or A∞A∞​-coalgebra flavour, possibly up to local RG dressing unitaries.
Conjecture 11.2

For topological fixed points, the coherent family can be expressed purely using FF-symbols, quantum dimensions, and local string-net/Pachner identities.
Conjecture 11.3

Away from topological fixed points, the coherent family is determined by the full Wilsonian RG trajectory, not by the fusion category alone.
12. Formalisation plan
12.1 Lean phase 1: finite matrix model

Do not begin with full category theory. Begin with a finite skeletal model.

Define:

structure FusionData where
  Label : Type
  finiteLabel : Fintype Label
  one : Label
  N : Label → Label → Label → Nat

Then define:

    formal words of labels;

    allowed fusion trees;

    dimensions of Hom spaces;

    basis vectors as combinatorial fusion trees;

    linear maps as matrices over CC or over an exact algebraic field.

For Fibonacci, define:

inductive FibLabel
| one
| tau

with fusion multiplicities.

Then implement:
Q=1⊕τ
Q=1⊕τ

as the finite type FibLabel.
12.2 Lean phase 2: Hilbert-space statements

Prove:

    QNQN configurations are functions

{1,…,N}→Irr⁡(C).
{1,…,N}→Irr(C).

    The Fock space is a direct sum over configurations.

    Isometry equations reduce to matrix equations.

    E†E=I⇒V†V=IE†E=I⇒V†V=I.

    A=β†(ββ†)−1/2A=β†(ββ†)−1/2 is an isometry.

For the polar-decomposition part, Lean may need finite-dimensional matrices and positive definite square roots. If this becomes hard, first formalise the no-mixing scalar case:
Aν=βν‾∑μ∣βμ∣2.
Aν​=∑μ​∣βμ​∣2
​βν​​​.
12.3 Lean phase 3: Fibonacci exact proofs

Prove exact identities:
φ2=φ+1,
φ2=φ+1,
D2=2+φ,
D2=2+φ,
FTF=I,
FTF=I,
(ηPF)†ηPF=I,
(ηPF)†ηPF=I,
(ηcoassoc)†ηcoassoc=I.
(ηcoassoc)†ηcoassoc=I.

Then prove the coassociativity candidate, using the FF-move.
12.4 Julia phase

Use Julia for exploratory computation.

Implement:

    fusion rings;

    fusion-tree basis generation;

    FF-move matrices;

    local ηη-maps;

    block maps EE;

    isometry checks;

    ascending channels;

    numerical spectra.

For Fibonacci:

    test PF amplitudes;

    test coassociative amplitudes;

    test RG amplitudes as functions of ρρ;

    diagonalise simple ascending channels;

    demonstrate failure of charge-only channel to recover b−2/5b−2/5;

    demonstrate recovery when a full CFT operator RG matrix is inserted by definition.

12.5 Wolframscript phase

Use Wolframscript for exact symbolic solving.

Tasks:

    Solve the Fibonacci coassociativity equations:

x2+y2=1,
x2+y2=1,
2x2+r2=1,
2x2+r2=1,
r2=φ−3/2xy.
r2=φ−3/2xy.

    Verify the positive solution:

x=φ−1,y=φ−1/2,r=φ−3/2.
x=φ−1,y=φ−1/2,r=φ−3/2.

    Verify PF normalisation identities.

    Derive eigenvalues of simple 2×22×2 or 3×33×3 ascending matrices.

13. Main conjectures to investigate
Conjecture A: categorical fine graining as universal isometry

Every physically admissible finite-lattice fine-graining map is, at the categorical level, an isometry
EN→M:Q⊗N↪Q⊗M.
EN→M​:Q⊗N↪Q⊗M.

The induced maps on all charge sectors are given by postcomposition.
Conjecture B: RG determines amplitudes by polar decomposition

Given the full Wilsonian blocking map
BN←M:Q⊗M→Q⊗N,
BN←M​:Q⊗M→Q⊗N,

the canonical fine-graining amplitudes are uniquely determined by
E=B†(BB†)−1/2,
E=B†(BB†)−1/2,

up to:

    gauge choices of fusion bases;

    unitary rotations in exactly degenerate retained operator subspaces;

    arbitrary choices outside the code subspace if the polar-decomposition section is not imposed;

    changes of RG scheme if BB itself is not fixed.

Conjecture C: topology gives allowed channels, RG gives weights

The fusion category determines:
which Eb⃗,a⃗ may be nonzero.
which Eb
,a
​ may be nonzero.

It does not, by itself, determine all amplitudes.

The RG/CFT data determines:
the finite-scale coefficients βμν.
the finite-scale coefficients βμν​.

Isometry then determines:
the fine-graining amplitudes Aνμ.
the fine-graining amplitudes Aνμ​.
Conjecture D: coherent continuum limit is operadic

A non-dyadic continuum limit should not be based only on a binary map
Q→Q⊗Q.
Q→Q⊗Q.

It should be based on a coherent family
η(r):Q→Q⊗r
η(r):Q→Q⊗r

for all r≥1r≥1, compatible with refinement of partitions.

This family likely forms an A∞A∞​-coalgebra-like structure, possibly strict at topological fixed points and only up to local unitaries along nontrivial RG flows.
Conjecture E: braiding is required for order-changing interpolation

If a fine-graining interpolation allows particles to exchange spatial order, then the category must be braided, and the order-change components must use the braiding.

Without braiding, admissible fine-graining maps should be order-preserving or explicitly avoid crossings.
14. Immediate next formalisation targets

Prioritise the following.

    Fibonacci finite model.
    Implement {1,τ}{1,τ}, fusion rules, QQ, binary channels, and exact φφ-arithmetic.

    Isometry proof for general binary Fibonacci map.
    Show
    ∣x∣2+∣y∣2=1,∣p∣2+∣q∣2+∣r∣2=1
    ∣x∣2+∣y∣2=1,∣p∣2+∣q∣2+∣r∣2=1

    is equivalent to η†η=Iη†η=I.

    PF map proof.
    Prove exact isometry.

    Coassociative candidate proof.
    Use the FF-matrix and prove the positive solution.

    RG amplitude formula.
    Formalise no-mixing polar-decomposition amplitudes.

    Ascending channel.
    Prove
    A(X)=E†XE
    A(X)=E†XE

    is unital and positive.

    Charge-only negative example.
    Show the simple charge-only Fibonacci channel does not generally yield λ=b−2/5λ=b−2/5.

    Full CFT operator RG axiomatisation.
    Define an abstract operator RG matrix with eigenvalues
    b−hi
    b−hi​

    and prove that diagonalising it recovers the scaling operators.

This should give a clean Lean/Julia/Wolframscript roadmap: first prove the categorical and finite-dimensional linear algebra skeleton, then instantiate Fibonacci exactly, then add RG data as explicit matrices.


