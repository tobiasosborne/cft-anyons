ChatGPT

Understood. I will use this as the standing framework for the project.

The core convention is:
HNW:=Hom⁡C(W,Q⊗N),Q:=⨁a∈Irr⁡(C)a.
HNW​:=HomC​(W,Q⊗N),Q:=a∈Irr(C)⨁​a.

A basis/configuration expansion is therefore
HNW≅⨁(a1,…,aN)∈Irr⁡(C)NHom⁡C(W,a1⊗⋯⊗aN).
HNW​≅(a1​,…,aN​)∈Irr(C)N⨁​HomC​(W,a1​⊗⋯⊗aN​).

I will treat:
1⊂Q
1⊂Q

as the empty-site state, and
ai≠1
ai​=1

as site ii being occupied by an anyon of type aiai​.

Thus an NN-site state is not merely a function on occupation strings. It is a section over the configuration space whose fibre over
(a1,…,aN)
(a1​,…,aN​)

is the fusion space
Hom⁡C(W,a1⊗⋯⊗aN).
HomC​(W,a1​⊗⋯⊗aN​).

Equivalently, the microscopic Hilbert space is a fixed-lattice, indefinite-particle-number anyonic Fock-type space, with particle number
∣a∣=#{i:ai≠1}.
∣a∣=#{i:ai​=1}.

A few conventions I will keep explicit when needed:

    Ordering matters.
    The tuple (a1,…,aN)(a1​,…,aN​) is ordered. Without a braiding there is no canonical neighboring-site exchange. If CC is braided, exchange operators can be built from the braiding cQ,QcQ,Q​.

    Fusion-space fibres may be higher-dimensional.
    Even for a fixed occupation configuration, the fibre
    Hom⁡(W,a1⊗⋯⊗aN)
    Hom(W,a1​⊗⋯⊗aN​)

    can have dimension greater than one. In multiplicity-free categories this comes only from different intermediate fusion channels; with fusion multiplicities, additional vertex labels μμ appear.

    Bases require choices.
    To write explicit vectors, one chooses a parenthesization/fusion tree and orthonormal bases of elementary trivalent spaces, for example
    Hom⁡(c,a⊗b)
    Hom(c,a⊗b)

    for splitting vertices. Different tree bases are related by FF-moves.

    The Hilbert structure is categorical.
    For simple WW, the inner product is induced by the dagger:
    f†g∈End⁡(W)≅C,
    f†g∈End(W)≅C,

    so
    ⟨f,g⟩
    ⟨f,g⟩

    is the scalar multiplying id⁡WidW​.

    Example: Fibonacci.
    With simples {1,τ}{1,τ},
    Q=1⊕τ,τ⊗τ≅1⊕τ.
    Q=1⊕τ,τ⊗τ≅1⊕τ.

    The NN-site space is
    HNW=Hom⁡(W,(1⊕τ)⊗N),
    HNW​=Hom(W,(1⊕τ)⊗N),

    and configurations are binary strings of empty/ττ-occupied sites, but the fibre over a given string is still the corresponding Fibonacci fusion space.

I will use this language consistently: configuration labels plus fusion-space fibres, with local OPE/fusion tensors as the elementary 3-valent building blocks.

In this project We are working with this, and related, hilbert spaces. Currently I am trying to understand the role of *geometry* and *fine graining* vs *coarse graining* between such spaces: Evaluate critically the following: Geometry enters through partitions

Let X be an oriented line segment, say

X=[0,L],

equipped with Lebesgue measure ℓ(−).

A finite ordered partition is

P={I
1
	​

<I
2
	​

<⋯<I
N
	​

},

where the I
i
	​

 are intervals covering X.

One cell equals one site. So to a partition P, assign the categorical object

A
P
	​

:=A
I
1
	​

	​

⊗A
I
2
	​

	​

⊗⋯⊗A
I
N
	​

	​

.

The order of the tensor factors is the spatial order of the cells. No braiding is needed on the line as long as refinement is order-preserving.

The mobile Hilbert space in charge sector W is

H
P
W
	​

:=Hom
C
	​

(W,A
P
	​

).
	​


This is the same old construction, but now the tensor factors are not abstractly numbered. They are attached to actual spatial cells.

3. Refinements form a directed set

Say P
′
 refines P, written

P⪯P
′
,

if every fine cell J∈P
′
 lies inside a unique coarse cell I∈P.

For each I∈P, define its children in P
′
 by

Ch
P
′
	​

(I)={J∈P
′
:J⊂I}.

The set of finite partitions is directed because two partitions always admit a common refinement.

So the continuum Hilbert space should be a direct limit over partitions:

H
∞
W
	​

=
P
lim
	​

	​

H
P
W
	​

	​

.

But to define this, we need refinement maps

E
P→P
′
	​

:H
P
W
	​

→H
P
′
W
	​

.

Equivalently, object-level maps

E
P→P
′
	​

:A
P
	​

→A
P
′
	​


and then

f↦E
P→P
′
	​

∘f.
4. Purely topological refinement is not enough

For a single coarse cell I split into r fine cells

I=J
1
	​

∪⋯∪J
r
	​

,

the purely topological square-zero refinement would be

1
I
	​

↦1
J
1
	​

	​

⊗⋯⊗1
J
r
	​

	​

,

and

p
I
	​

↦
r
	​

1
	​

j=1
∑
r
	​

1
J
1
	​

	​

⊗⋯⊗p
J
j
	​

	​

⊗⋯⊗1
J
r
	​

	​

.

This is fine for equal subdivisions.

But it is geometrically wrong for arbitrary partitions. If a cell of length 1 is split into lengths 0.99 and 0.01, equal amplitudes give probabilities 1/2 and 1/2, which ignores the geometry.

So the algebra object gives the allowed support:

p↦one p in one child cell,

but geometry must determine the weights.

5. Geometry-correct square-zero refinement

For a coarse interval I and its fine children J⊂I, define weights

β
J∣I
	​

=
ℓ(I)
ℓ(J)
	​

	​

.
	​


Then define the local fine-graining map

E
I→Ch(I)
	​

:A
I
	​

→
J⊂I
⨂
	​

A
J
	​


by

E
I
	​

(1
I
	​

)=
J⊂I
⨂
	​

1
J
	​

,
	​


and

E
I
	​

(p
I
	​

)=
J⊂I
∑
	​

ℓ(I)
ℓ(J)
	​

	​

1⊗⋯⊗p
J
	​

⊗⋯⊗1.
	​


The coefficient is chosen so that

J⊂I
∑
	​

ℓ(I)
ℓ(J)
	​

=1.

Hence

∥E
I
	​

(p
I
	​

)∥
2
=1.

So E
I
	​

 is an isometry on the one-site object A
I
	​

=1⊕p.

For a full partition refinement P⪯P
′
, define

E
P→P
′
	​

=
I∈P
⨂
	​

E
I→Ch
P
′
	​

(I)
	​

.
	​


This is the local, order-preserving, geometry-compatible refinement map.

6. The corresponding blocking map

The adjoint map

B
P←P
′
	​

:=E
P→P
′
†
	​


is the coarse-graining/blocking map.

For one parent cell I, it acts by

B
I
	​

(
J⊂I
⨂
	​

1
J
	​

)=1
I
	​

,
B
I
	​

(1⊗⋯⊗p
J
	​

⊗⋯⊗1)=
ℓ(I)
ℓ(J)
	​

	​

p
I
	​

,

and

B
I
	​

(two or more p’s inside I)=0.
	​


That last line is exactly the square-zero rule:

p⋅p=0.

Two particles inside the same coarse block do not coarse-grain to a single p. They are projected out by this square-zero blocking channel.

7. Coherence under repeated refinement

This is the key compatibility condition.

Suppose

P⪯P
′
⪯P
′′
,

with

K⊂J⊂I.

Then the weights multiply:

ℓ(I)
ℓ(J)
	​

	​

ℓ(J)
ℓ(K)
	​

	​

=
ℓ(I)
ℓ(K)
	​

	​

.

Therefore

E
P
′
→P
′′
	​

E
P→P
′
	​

=E
P→P
′′
	​

.
	​


Also

E
P→P
	​

=id.

So the refinement maps form an honest direct system of Hilbert spaces.

This is precisely where geometry enters. The square-root length factor is not arbitrary; it is what makes arbitrary refinement coherent.

8. Single-particle sector

The clean one-particle Hilbert space over a partition P is spanned by basis states

∣I⟩,I∈P,

where ∣I⟩ means “there is one p-particle in cell I.”

The refinement map is

∣I⟩
P
	​

↦
J⊂I
∑
	​

ℓ(I)
ℓ(J)
	​

	​

∣J⟩
P
′
	​

.
	​


This is the usual L
2
-compatible refinement rule.

The vacuum maps by

∣Ω⟩
P
	​

↦∣Ω⟩
P
′
	​

.

So the zero-or-one-particle sector is

K
P
≤1
	​

=C∣Ω⟩⊕
I∈P
⨁
	​

C∣I⟩.
	​


For total charge W=p, the vacuum piece is absent and the one-particle piece is

K
P
1,p
	​

≅C
∣P∣
.
9. Continuum limit gives L
2
(X)

Identify the cell basis vector with the normalized indicator function

∣I⟩⟷
ℓ(I)
	​

χ
I
	​

	​

.
	​


Then under refinement,

ℓ(I)
	​

χ
I
	​

	​

=
J⊂I
∑
	​

ℓ(I)
ℓ(J)
	​

	​

ℓ(J)
	​

χ
J
	​

	​

.

This is exactly the same formula as the categorical refinement map.

Therefore the direct limit of the one-particle spaces is

P
lim
	​

	​

K
P
1
	​

≅step functions in L
2
(X),
	​


and after completion,

P
lim
	​

	​

K
P
1
	​

	​

≅L
2
(X).
	​


The zero-or-one-particle continuum Hilbert space is therefore

C∣Ω⟩⊕L
2
(X).
	​


So the square-zero algebra plus geometric partition refinement recovers the ordinary single-particle Hilbert space.

10. Multi-particle square-free sector

If we keep more than one occupied cell, a basis vector is a finite subset

S={I
i
1
	​

	​

,…,I
i
k
	​

	​

}⊂P

with at most one p per cell.

Write this state as

∣S⟩
P
	​

.

Then refinement sends

∣S⟩
P
	​

↦
J
i
	​

⊂I
i
	​

I
i
	​

∈S
	​

∑
	​

(
I
i
	​

∈S
∏
	​

ℓ(I
i
	​

)
ℓ(J
i
	​

)
	​

	​

)∣{J
i
	​

:I
i
	​

∈S}⟩
P
′
	​

.
	​

I’ll treat the intended refinement amplitude as ℓ(J)/ℓ(I)ℓ(J)/ℓ(I)
​, then evaluate functoriality, isometry, categorical assumptions, and the actual continuum limit beyond the one-particle sector.

Overall verdict: the construction is mathematically sound as a kinematic inductive-limit model for square-free mobile anyons on an oriented interval, provided the length factors are the L2L2-normalized square-root factors. But it should not be read as a fully general anyonic coarse-graining theory. It is a particular number-preserving, hard-core, projection-type refinement scheme.

The most important correction is this:
wJ∣I=ℓ(J)ℓ(I).
wJ∣I​=ℓ(I)ℓ(J)​
​.

If the displayed factor is literally ℓ(I)/ℓ(J)ℓ(I)/ℓ(J)
​, or ℓ(J)/ℓ(I)ℓ(J)/ℓ(I) without the square root, the normalization and the L2L2 identification fail. The coherent L2L2-compatible coefficient is
wJ∣I=ℓ(J)ℓ(I).
wJ∣I​=ℓ(I)ℓ(J)​
​.​

With that convention, the proposal is largely correct.
1. What the construction is really doing

For a partition
P={I1<⋯<IN}
P={I1​<⋯<IN​}

one attaches
AP=AI1⊗⋯⊗AIN.
AP​=AI1​​⊗⋯⊗AIN​​.

In the square-zero one-species case,
AI=1⊕p.
AI​=1⊕p.

The state 11 means “no resolved particle in cell II,” and pp means “one resolved pp-particle in cell II.”

For fixed total charge WW,
HPW=Hom⁡C(W,AP).
HPW​=HomC​(W,AP​).

This is exactly the same categorical Hilbert-space construction as before, except that the tensor factors are now indexed by spatial cells rather than abstract site numbers.

This is a good move. It separates:
categorical charge/fusion data
categorical charge/fusion data

from
geometric localization data.
geometric localization data.

The line orientation gives a canonical order of tensor factors, so no braiding is needed for refinement maps that preserve order.
2. Correct local refinement map

Suppose a coarse interval II is subdivided into children
I=J1∪⋯∪Jr,J1<⋯<Jr.
I=J1​∪⋯∪Jr​,J1​<⋯<Jr​.

Define
wJ∣I:=ℓ(J)ℓ(I).
wJ∣I​:=ℓ(I)ℓ(J)​
​.

Then
∑J⊂I∣wJ∣I∣2=∑J⊂Iℓ(J)ℓ(I)=1.
J⊂I∑​∣wJ∣I​∣2=J⊂I∑​ℓ(I)ℓ(J)​=1.

The local refinement map should be
EI:AI⟶⨂J⊂IAJ
EI​:AI​⟶J⊂I⨂​AJ​

with
EI(1I)=⨂J⊂I1J,
EI​(1I​)=J⊂I⨂​1J​,

and
EI(pI)=∑J⊂Iℓ(J)ℓ(I) 1⊗⋯⊗pJ⊗⋯⊗1.
EI​(pI​)=J⊂I∑​ℓ(I)ℓ(J)​
​1⊗⋯⊗pJ​⊗⋯⊗1.

Equivalently, a coarse particle in II is refined into a normalized superposition of being in one of the child cells, with probability proportional to child length.

For an equal subdivision into rr children,
ℓ(J)=ℓ(I)r,
ℓ(J)=rℓ(I)​,

so
wJ∣I=1r,
wJ∣I​=r
​1​,

recovering the usual equal-amplitude refinement.
3. Why the square-root factor is forced

The square-root length factor is not cosmetic. It is forced by three requirements:

    Isometry:
    EI†EI=id⁡AI.
    EI†​EI​=idAI​​.

    Geometric probability:
    Pr⁡(p lies in J∣p lies in I)=ℓ(J)ℓ(I).
    Pr(p lies in J∣p lies in I)=ℓ(I)ℓ(J)​.

    Coherence under repeated refinement:

    if
    K⊂J⊂I,
    K⊂J⊂I,

    then
    wJ∣IwK∣J=ℓ(J)ℓ(I)ℓ(K)ℓ(J)=ℓ(K)ℓ(I)=wK∣I.
    wJ∣I​wK∣J​=ℓ(I)ℓ(J)​
    ​ℓ(J)ℓ(K)​
    ​=ℓ(I)ℓ(K)​
    ​=wK∣I​.

So the geometry enters through the measure ratio
ℓ(J)ℓ(I),
ℓ(I)ℓ(J)​,

while Hilbert-space normalization forces the square root.

More generally, replacing Lebesgue measure ℓℓ by another positive measure μμ would give
wJ∣I=μ(J)μ(I)
wJ∣I​=μ(I)μ(J)​
​

and the one-particle limit would be L2(X,μ)L2(X,μ).
4. Global refinement map

For a refinement P⪯P′P⪯P′, define
Ch⁡P′(I)={J∈P′:J⊂I}.
ChP′​(I)={J∈P′:J⊂I}.

Then
EP→P′=⨂I∈PEI→Ch⁡P′(I).
EP→P′​=I∈P⨂​EI→ChP′​(I)​.

This gives
EP→P′:AP⟶AP′.
EP→P′​:AP​⟶AP′​.

On Hilbert spaces,
HPW=Hom⁡(W,AP)
HPW​=Hom(W,AP​)

embeds by
f⟼EP→P′∘f.
f⟼EP→P′​∘f.

If each local EIEI​ is an isometry, then the induced map on HPWHPW​ is also an isometry:
⟨Ef,Eg⟩=f†E†Eg=f†g.
⟨Ef,Eg⟩=f†E†Eg=f†g.

Thus the family
{HPW,EP→P′}
{HPW​,EP→P′​}

forms an honest inductive system of Hilbert spaces.

Strictly, the continuum Hilbert space should be written as the Hilbert completion of the algebraic inductive limit:
H∞W=lim→⁡PHPW‾.
H∞W​=P
lim​​HPW​​.

The overline matters. The algebraic direct limit gives step-function-type states; the Hilbert completion gives the full L2L2-type continuum space.
5. Correct blocking map

The blocking map is the adjoint
BP←P′:=EP→P′†.
BP←P′​:=EP→P′†​.

For one parent cell II, the local adjoint satisfies
BI(⨂J⊂I1J)=1I,
BI​(J⊂I⨂​1J​)=1I​,

and
BI(1⊗⋯⊗pJ⊗⋯⊗1)=ℓ(J)ℓ(I) pI.
BI​(1⊗⋯⊗pJ​⊗⋯⊗1)=ℓ(I)ℓ(J)​
​pI​.

The coefficient is the same square-root factor, not its inverse.

Also,
BI(two or more p’s inside I)=0.
BI​(two or more p’s inside I)=0.

So
BP←P′EP→P′=id⁡HPW,
BP←P′​EP→P′​=idHPW​​,

but
EP→P′BP←P′
EP→P′​BP←P′​

is only the orthogonal projection onto the embedded coarse subspace inside the fine Hilbert space.

This is a crucial interpretive point: BB is not an inverse refinement map on all fine states. It is a projection/blocking map that discards fine configurations not representable at the coarse resolution.
6. The single-particle sector really does give L2(X)L2(X)

Let
∣I⟩P
∣I⟩P​

denote the normalized state with one pp-particle in cell II. The refinement rule is
∣I⟩P⟼∑J⊂Iℓ(J)ℓ(I)∣J⟩P′.
∣I⟩P​⟼J⊂I∑​ℓ(I)ℓ(J)​
​∣J⟩P′​.

Identify
∣I⟩P⟷χIℓ(I).
∣I⟩P​⟷ℓ(I)
​χI​​.

Then
χIℓ(I)=∑J⊂Iℓ(J)ℓ(I)χJℓ(J).
ℓ(I)
​χI​​=J⊂I∑​ℓ(I)ℓ(J)​
​ℓ(J)
​χJ​​.

So the categorical refinement map is exactly the inclusion of coarser step functions into finer step functions inside L2(X)L2(X).

Therefore
lim→⁡PKP1,p‾≅L2(X).
P
lim​​KP1,p​​≅L2(X).

For fixed total charge W=pW=p, the one-particle sector is
L2(X)⊗Hom⁡(p,p)≅L2(X),
L2(X)⊗Hom(p,p)≅L2(X),

assuming pp is simple.

The vacuum sector appears only in total charge W=1W=1, since
Hom⁡(W,1)
Hom(W,1)

vanishes unless W≅1W≅1. Thus the statement
C∣Ω⟩⊕L2(X)
C∣Ω⟩⊕L2(X)

is correct for the unresolved zero-or-one-particle kinematic space, but in a fixed total-charge sector it decomposes as:
W=1:C∣Ω⟩,
W=1:C∣Ω⟩,
W=p:L2(X),
W=p:L2(X),

with no vacuum contribution in the W=pW=p sector.
7. Multi-particle square-free sector

For kk particles in distinct cells
I1<⋯<Ik,
I1​<⋯<Ik​,

write
∣I1,…,Ik⟩P.
∣I1​,…,Ik​⟩P​.

The refinement rule is
∣I1,…,Ik⟩P⟼∑Jm⊂Imm=1,…,k(∏m=1kℓ(Jm)ℓ(Im))∣J1,…,Jk⟩P′.
∣I1​,…,Ik​⟩P​⟼Jm​⊂Im​m=1,…,k​∑​(m=1∏k​ℓ(Im​)ℓ(Jm​)​
​)∣J1​,…,Jk​⟩P′​.

This matches the L2L2 identification
∣I1,…,Ik⟩P⟷χI1×⋯×Ikℓ(I1)⋯ℓ(Ik)
∣I1​,…,Ik​⟩P​⟷ℓ(I1​)⋯ℓ(Ik​)
​χI1​×⋯×Ik​​​

on the ordered configuration chamber
X<k:={(x1,…,xk)∈Xk:x1<⋯<xk}.
X<k​:={(x1​,…,xk​)∈Xk:x1​<⋯<xk​}.

Hence, for one species pp, the kk-particle continuum sector should be
H∞,kW,p≅L2(X<k)⊗Hom⁡C(W,p⊗k).
H∞,kW,p​≅L2(X<k​)⊗HomC​(W,p⊗k).

Summing over kk, the square-free continuum space is
H∞W,p≅⨁k≥0L2(X<k)⊗Hom⁡C(W,p⊗k)
H∞W,p​≅k≥0⨁​L2(X<k​)⊗HomC​(W,p⊗k)​

with the convention
X<0={pt},p⊗0=1.
X<0​={pt},p⊗0=1.

Thus the k=0k=0 term is
Hom⁡(W,1).
Hom(W,1).

For the full occupation object
Q=⨁a∈Irr⁡(C)a,
Q=a∈Irr(C)⨁​a,

the analogous square-free continuum space is
H∞W≅⨁k≥0  ⨁a1,…,ak∈Irr⁡(C)∖{1}L2(X<k)⊗Hom⁡C(W,a1⊗⋯⊗ak).
H∞W​≅k≥0⨁​a1​,…,ak​∈Irr(C)∖{1}⨁​L2(X<k​)⊗HomC​(W,a1​⊗⋯⊗ak​).​

This is the clean continuum version of the original fixed-lattice anyonic Fock-type space.

The ordered chamber X<kX<k​ is appropriate because the line has a canonical left-to-right order. If one later wants exchange statistics, quotienting, or braid actions, that requires extra structure beyond order-preserving refinement.
8. Major caveat: square-zero is not categorical fusion

The notation
p⋅p=0
p⋅p=0

must not be confused with the categorical tensor product
p⊗p.
p⊗p.

In a fusion category, if p≠0p=0, then p⊗pp⊗p is generally nonzero. For example, in Fibonacci,
τ⊗τ≅1⊕τ.
τ⊗τ≅1⊕τ.

So the square-zero rule is not a fusion rule. It is an auxiliary local occupation rule saying:
one cell may contain at most one resolved p-particle.
one cell may contain at most one resolved p-particle.

Multiple pp-particles in different cells are still allowed, and their total charge is governed by the genuine fusion space
Hom⁡(W,p⊗k).
Hom(W,p⊗k).

Thus:
p⋅p=0
p⋅p=0

means “two pp-particles cannot occupy the same coarse cell in this square-free lattice model,” not “two pp-anyons fuse to zero.”

This distinction is essential.
9. Major caveat: the blocking map is lossy

The adjoint blocking map kills configurations with two or more particles inside the same coarse block:
BI(two or more p’s in I)=0.
BI​(two or more p’s in I)=0.

This is mathematically consistent with the square-free finite-cell model, but physically it is a strong projection.

For example, suppose two fine pp-particles lie in distinct fine cells J1,J2⊂IJ1​,J2​⊂I. Then from the viewpoint of the coarse partition PP, both particles lie inside the same coarse interval II. The square-free coarse Hilbert space has no state representing “two unresolved particles inside II.” Therefore the adjoint blocking map sends that fine state to zero.

That is not the same as saying the two-particle state has no physical effect. It only says the chosen coarse Hilbert space cannot represent it.

So the finite space
HPW=Hom⁡(W,AP)
HPW​=Hom(W,AP​)

with
AI=1⊕p
AI​=1⊕p

is not a faithful coarse-grained description of arbitrary fine states at resolution PP. It is a hard-core truncation: at most one resolved particle per coarse cell.

A more faithful coarse-grained Hilbert space would need local cell objects that allow multiple unresolved particles in one interval, for example something schematically like
AIfull∼⨁k≥0L2(Conf⁡k(I))⊗p⊗k,
AIfull​∼k≥0⨁​L2(Confk​(I))⊗p⊗k,

or a categorical analogue thereof.

The square-zero model avoids that complexity by projecting away same-block multi-particle data.
10. General anyonic refinement requires more than geometry

The proposed refinement map is number-preserving:
pI⟼∑J⊂Iℓ(J)ℓ(I) 1⊗⋯⊗pJ⊗⋯⊗1.
pI​⟼J⊂I∑​ℓ(I)ℓ(J)​
​1⊗⋯⊗pJ​⊗⋯⊗1.

It says that a coarse pp-particle refines into one fine pp-particle located somewhere inside II.

But a genuinely anyonic fine-graining could be more general. A coarse charge cc inside II might refine into several child charges
b1,…,br
b1​,…,br​

whose total fusion charge is cc. Categorically, this would require components
EIb1,…,br;c∈Hom⁡C(c,b1⊗⋯⊗br).
EIb1​,…,br​;c​∈HomC​(c,b1​⊗⋯⊗br​).

Then one would need an isometry condition
EI†EI=id⁡AI,
EI†​EI​=idAI​​,

and a coherence condition under repeated refinement.

In that setting, geometry alone does not determine EIEI​. One also needs dynamical or OPE data specifying the amplitudes for a coarse charge to resolve into several microscopic charges.

The square-zero map is therefore a special case: it only allows the child configurations
(1,…,1)
(1,…,1)

for the vacuum and
(1,…,p,…,1)
(1,…,p,…,1)

for a single pp-particle.

It forbids local pair creation, neutral pairs, and composite internal structure inside a coarse interval.
11. What the proposal gets exactly right

The proposal correctly identifies the central mechanism:
topology/order gives allowed refinement patterns,
topology/order gives allowed refinement patterns,

while
measure geometry gives the L2-normalization weights.
measure geometry gives the L2-normalization weights.

The topological square-zero support rule says:
pI↦one p in one child cell.
pI​↦one p in one child cell.

The geometric refinement says:
pI↦∑J⊂Iℓ(J)ℓ(I) pJ.
pI​↦J⊂I∑​ℓ(I)ℓ(J)​
​pJ​.

That is precisely the passage from a combinatorial site model to a continuum L2L2-particle model.

So the slogan is good:
Geometry enters through measure-compatible refinement maps.
Geometry enters through measure-compatible refinement maps.​

But I would sharpen it:
Partitions give resolution; the measure gives the Hilbert-space normalization; the category gives the fusion fibres.
Partitions give resolution; the measure gives the Hilbert-space normalization; the category gives the fusion fibres.​
12. Final assessment

The construction is valid and useful if interpreted as follows:
an order-preserving, measure-compatible, square-free inductive system of anyonic Hilbert spaces.
an order-preserving, measure-compatible, square-free inductive system of anyonic Hilbert spaces.

Its continuum completion is, for one species pp,
H∞W,p≅⨁k≥0L2(X<k)⊗Hom⁡C(W,p⊗k),
H∞W,p​≅k≥0⨁​L2(X<k​)⊗HomC​(W,p⊗k),

and for general simple labels,
H∞W≅⨁k≥0⨁a1,…,ak≠1L2(X<k)⊗Hom⁡C(W,a1⊗⋯⊗ak).
H∞W​≅k≥0⨁​a1​,…,ak​=1⨁​L2(X<k​)⊗HomC​(W,a1​⊗⋯⊗ak​).

That is a strong and natural continuum version of the fixed-lattice anyonic Fock-type construction.

The limitations are equally important:

    The square-zero rule is a local occupancy constraint, not a fusion rule.

    The blocking map is a projection, not a faithful physical coarse-graining of all fine states.

    Same-block multi-particle data is discarded at coarse resolution.

    More general anyonic fine-graining would require OPE/fusion-channel amplitudes, not just length weights.

    The construction uses only measure geometry; metric/differential geometry enters later through dynamics, Hamiltonians, Laplacians, contact conditions, or transport/exchange data.

So the proposal is correct as a kinematic square-free continuum limit, but incomplete as a full theory of anyon coarse-graining.

I want to precisely understand coherence for anyone theories where particles can split. Take fib and work these out precisely and correctly.  Do not obsess over binary map, this should work for any partition refinement, eg 1 cell divided into arbitrary partition

Thought for 16m 20s

The right way to formulate “coherent splitting” is not to start with a binary refinement rule and hope it extends. For Fibonacci, one should specify all multi-child refinement maps
EI→(J1,…,Jr):AI⟶AJ1⊗⋯⊗AJr
EI→(J1​,…,Jr​)​:AI​⟶AJ1​​⊗⋯⊗AJr​​

for every finite ordered subdivision
I=J1∪⋯∪Jr,J1<⋯<Jr,
I=J1​∪⋯∪Jr​,J1​<⋯<Jr​,

and then impose compatibility under regrouping of the children. The binary maps are just the r=2r=2 special case.

Below I will take
C=Fib,Irr⁡(Fib)={1,τ},τ⊗τ≅1⊕τ.
C=Fib,Irr(Fib)={1,τ},τ⊗τ≅1⊕τ.

The key conclusion is:
Nontrivial Fibonacci splitting is coherent only after one treats 1 as a vacuum charge sector, not as literally empty.
Nontrivial Fibonacci splitting is coherent only after one treats 1 as a vacuum charge sector, not as literally empty.​

If 11 is forced to mean “empty and nothing else,” then coherent τ→τττ→ττ splitting fails.
1. General arbitrary-refinement form

Let
AI=1⊕τ
AI​=1⊕τ

for every interval II. For a subdivision
I=J1∪⋯∪Jr,
I=J1​∪⋯∪Jr​,

a local refinement map is a morphism
EI→J:AI→AJ1⊗⋯⊗AJr,J=(J1,…,Jr).
EI→J​:AI​→AJ1​​⊗⋯⊗AJr​​,J=(J1​,…,Jr​).

Decompose it into simple-charge components. For
c∈{1,τ},a=(a1,…,ar)∈{1,τ}r,
c∈{1,τ},a=(a1​,…,ar​)∈{1,τ}r,

define
Eca(I;J)∈Hom⁡Fib(c,a1⊗⋯⊗ar).
Eca​(I;J)∈HomFib​(c,a1​⊗⋯⊗ar​).

Choose an orthonormal splitting-tree basis
{va,αc:c→a1⊗⋯⊗ar}α=1Nac.
{va,αc​:c→a1​⊗⋯⊗ar​}α=1Nac​​.

Then
Eca(I;J)=∑αCa,αc(I;J) va,αc.
Eca​(I;J)=α∑​Ca,αc​(I;J)va,αc​.

The isometry condition is
EI→J†EI→J=id⁡AI.
EI→J†​EI→J​=idAI​​.

Equivalently, for each parent charge cc,
∑a,α∣Ca,αc(I;J)∣2=1.
a,α∑​
​Ca,αc​(I;J)
​2=1.

The nontrivial condition is coherence under regrouping.

Suppose
I=B1∪⋯∪Bs,
I=B1​∪⋯∪Bs​,

and each block is further subdivided as
Bq=Jq,1∪⋯∪Jq,rq.
Bq​=Jq,1​∪⋯∪Jq,rq​​.

Then the direct refinement must agree with the two-step refinement:
EI→{Jq,m}=(⨂q=1sEBq→(Jq,1,…,Jq,rq))∘EI→(B1,…,Bs).
EI→{Jq,m​}​=(q=1⨂s​EBq​→(Jq,1​,…,Jq,rq​​)​)∘EI→(B1​,…,Bs​)​.​

In a non-strict monoidal convention, associators are inserted. In Fibonacci, those associators are exactly the FF-symbols.

In coefficient form, this says
Ca,αc(I;{Jq,m})=∑b,γ,βFα;(b,γ,β) Cb,γc(I;B1,…,Bs)∏q=1sCa(q),βqbq(Bq;Jq,1,…,Jq,rq).
Ca,αc​(I;{Jq,m​})=b,γ,β∑​Fα;(b,γ,β)​Cb,γc​(I;B1​,…,Bs​)q=1∏s​Ca(q),βq​bq​​(Bq​;Jq,1​,…,Jq,rq​​).

Here:
b=(b1,…,bs)
b=(b1​,…,bs​)

are the intermediate charges of the blocks,
a(q)=(aq,1,…,aq,rq)
a(q)=(aq,1​,…,aq,rq​​)

are the fine charges inside BqBq​, and Fα;(⋯ )Fα;(⋯)​ is the Fibonacci recoupling matrix from the grouped tree basis to the direct tree basis.

That is the exact arbitrary-partition coherence law.
2. Fibonacci fusion-space dimensions

If aa contains kk copies of ττ, then identities can be ignored, so
Hom⁡(c,a1⊗⋯⊗ar)≅Hom⁡(c,τ⊗k).
Hom(c,a1​⊗⋯⊗ar​)≅Hom(c,τ⊗k).

The dimensions are Fibonacci numbers:
dim⁡Hom⁡(1,τ⊗k)=Fk−1,
dimHom(1,τ⊗k)=Fk−1​,
dim⁡Hom⁡(τ,τ⊗k)=Fk,
dimHom(τ,τ⊗k)=Fk​,

with the convention
F0=0,F1=1.
F0​=0,F1​=1.

So, for example:
Hom⁡(τ,τ)=C,
Hom(τ,τ)=C,
Hom⁡(τ,τ⊗τ)=C,
Hom(τ,τ⊗τ)=C,

but
Hom⁡(τ,τ⊗τ⊗τ)≅C2.
Hom(τ,τ⊗τ⊗τ)≅C2.

The first genuinely nontrivial coherence problem already appears for three ττ-leaves.
3. The Fibonacci FF-matrix

Use the standard unitary Fibonacci convention
ϕ=1+52.
ϕ=21+5
​​.

For three ττ-anyons with total charge ττ, the nontrivial FF-matrix is
Fττττ=(ϕ−1ϕ−1/2ϕ−1/2−ϕ−1).
Fττττ​=(ϕ−1ϕ−1/2​ϕ−1/2−ϕ−1​).

Let
e1=((ττ)1τ)τ,eτ=((ττ)ττ)τ
e1​=((ττ)1​τ)τ​,eτ​=((ττ)τ​τ)τ​

be the left-paired basis, and
f1=(τ(ττ)1)τ,fτ=(τ(ττ)τ)τ
f1​=(τ(ττ)1​)τ​,fτ​=(τ(ττ)τ​)τ​

be the right-paired basis. Then
(f1fτ)=Fττττ(e1eτ).
(f1​fτ​​)=Fττττ​(e1​eτ​​).

In particular,
fτ=ϕ−1/2e1−ϕ−1eτ.
fτ​=ϕ−1/2e1​−ϕ−1eτ​.

This one equation is where naive splitting rules usually fail.
4. Why “vacuum equals empty” forbids coherent splitting

Suppose one insists that the 11-summand means literally empty, so that
E(1)=1⊗⋯⊗1
E(1)=1⊗⋯⊗1

for every refinement. Then 11 cannot refine into a ττττ pair.

Now suppose one also wants a nonzero splitting channel
τ⟶τ⊗τ
τ⟶τ⊗τ

in the ττ-fusion channel.

Consider a cell II split into three ordered children
A<B<C.
A<B<C.

There are two ways to obtain the three-child refinement.

First group as
A∣(BC).
A∣(BC).

If 11 cannot split into ττττ, then the only way to produce the final configuration
τA,τB,τC
τA​,τB​,τC​

is through the intermediate charge
(BC)τ.
(BC)τ​.

So the resulting vector lies in the line
Cfτ.
Cfτ​.

Now group instead as
(AB)∣C.
(AB)∣C.

Again, if 11 cannot split into ττττ, the resulting vector lies in
Ceτ.
Ceτ​.

Coherence would require the same vector to lie in both lines:
Cfτ=Ceτ.
Cfτ​=Ceτ​.

But
fτ=ϕ−1/2e1−ϕ−1eτ
fτ​=ϕ−1/2e1​−ϕ−1eτ​

is not proportional to eτeτ​. Therefore the only coherent possibility is that the three-ττ component vanishes. For arbitrary nonzero pair splitting, it does not vanish.

So:
E(1)=empty only⟹no coherent nonzero τ→ττ splitting.
E(1)=empty only⟹no coherent nonzero τ→ττ splitting.​

This is not a technicality. It is forced by the Fibonacci FF-move.

To allow genuine splitting, the 11-label must mean:
total vacuum charge,
total vacuum charge,

not necessarily literal emptiness. A vacuum-charge cell may contain an unresolved ττττ pair.
5. A coherent Fibonacci splitting datum

A clean way to get coherent splitting is to use the standard positive special Fibonacci algebra
A=1⊕τ.
A=1⊕τ.

Define a multiplication
m:A⊗A→A
m:A⊗A→A

by
m(1⊗1)=1,
m(1⊗1)=1,
m(1⊗τ)=τ,m(τ⊗1)=τ,
m(1⊗τ)=τ,m(τ⊗1)=τ,

and on
τ⊗τ≅1⊕τ
τ⊗τ≅1⊕τ

set
mττ1=ϕ,mτττ=ϕ−1/2.
mττ1​=ϕ
​,mτττ​=ϕ−1/2.

Associativity is exactly the Fibonacci FF-constraint. For the τττ→ττττ→τ channel, the left-associated multiplication vector is
(ϕϕ−1)
(ϕ
​ϕ−1​)

in the basis (e1,eτ)(e1​,eτ​). This vector is FF-invariant:
Fττττ(ϕϕ−1)=(ϕϕ−1).
Fττττ​(ϕ
​ϕ−1​)=(ϕ
​ϕ−1​).

For the τττ→1τττ→1 channel, both bracketings give the scalar
ϕ⋅ϕ−1/2=1.
ϕ
​⋅ϕ−1/2=1.

Thus mm is associative.

Moreover,
m m†=ϕ2 id⁡A.
mm†=ϕ2idA​.

Therefore
Δ:=ϕ−1m†
Δ:=ϕ−1m†

is an isometric coassociative splitting map
Δ:A→A⊗A.
Δ:A→A⊗A.

Explicitly,
Δ(1)=ϕ−1 1⊗1+ϕ−1/2 (τ⊗τ)1,
Δ(1)=ϕ−11⊗1+ϕ−1/2(τ⊗τ)1​,

and
Δ(τ)=ϕ−1 τ⊗1+ϕ−1 1⊗τ+ϕ−3/2 (τ⊗τ)τ.
Δ(τ)=ϕ−1τ⊗1+ϕ−11⊗τ+ϕ−3/2(τ⊗τ)τ​.

The norms check:
ϕ−2+ϕ−1=1,
ϕ−2+ϕ−1=1,

and
2ϕ−2+ϕ−3=1.
2ϕ−2+ϕ−3=1.

For rr children, define
E(r)=ϕ−(r−1)(m(r))†,
E(r)=ϕ−(r−1)(m(r))†,

where
m(r):A⊗r→A
m(r):A⊗r→A

is the rr-ary multiplication. Associativity of mm implies that m(r)m(r) is independent of the parenthesization, up to the Fibonacci FF-moves. The scalar satisfies
ϕ−(r−1)=ϕ−(s−1)∏q=1sϕ−(rq−1)
ϕ−(r−1)=ϕ−(s−1)q=1∏s​ϕ−(rq​−1)

whenever r=r1+⋯+rsr=r1​+⋯+rs​. Therefore
E(r)=(E(r1)⊗⋯⊗E(rs))E(s).
E(r)=(E(r1​)⊗⋯⊗E(rs​))E(s).

This gives a fully coherent, arbitrary-refinement splitting system.

However, this version ignores interval lengths. It is topological, not geometric.
6. Geometry-compatible Fibonacci splitting

To include geometry, introduce positive length-dependent weights
Z1(L),Zτ(L).
Z1​(L),Zτ​(L).

These are local partition functions for an interval of length LL with total charge 11 or ττ.

For Fibonacci splitting with the above algebra constants, require
Z1(x+y)=Z1(x)Z1(y)+ϕ Zτ(x)Zτ(y),
Z1​(x+y)=Z1​(x)Z1​(y)+ϕZτ​(x)Zτ​(y),

and
Zτ(x+y)=Zτ(x)Z1(y)+Z1(x)Zτ(y)+ϕ−1Zτ(x)Zτ(y).
Zτ​(x+y)=Zτ​(x)Z1​(y)+Z1​(x)Zτ​(y)+ϕ−1Zτ​(x)Zτ​(y).

A natural one-parameter solution is
Z1(L)=ϕ−2eρϕL+ϕ−1e−ρL,
Z1​(L)=ϕ−2eρϕL+ϕ−1e−ρL,
Zτ(L)=ϕ−2(eρϕL−e−ρL),
Zτ​(L)=ϕ−2(eρϕL−e−ρL),

where ρ>0ρ>0 is a density scale.

These satisfy
Z1(0)=1,Zτ(0)=0,
Z1​(0)=1,Zτ​(0)=0,

and for small LL,
Zτ(L)∼ρL.
Zτ​(L)∼ρL.

Thus the one-particle part reduces locally to the usual L2L2-type length weighting.
7. Arbitrary rr-child refinement formula

Let
I=J1∪⋯∪Jr,ℓi:=ℓ(Ji),L:=ℓ(I).
I=J1​∪⋯∪Jr​,ℓi​:=ℓ(Ji​),L:=ℓ(I).

For
a=(a1,…,ar)∈{1,τ}r,
a=(a1​,…,ar​)∈{1,τ}r,

let
ma→c(r):a1⊗⋯⊗ar→c
ma→c(r)​:a1​⊗⋯⊗ar​→c

be the rr-ary Fibonacci multiplication component. Expand it in the dual splitting basis:
ma→c(r)=∑αMa,αc (va,αc)†.
ma→c(r)​=α∑​Ma,αc​(va,αc​)†.

Then define
EI→(J1,…,Jr)(c)=1Zc(L)∑a,αMa,αc(∏i=1rZai(ℓi))va,αc.
EI→(J1​,…,Jr​)​(c)=Zc​(L)
​1​a,α∑​Ma,αc​(i=1∏r​Zai​​(ℓi​)
​)va,αc​.​

This is the direct arbitrary-partition refinement map.

It is not derived by choosing a binary tree. The rr-ary coefficients Ma,αcMa,αc​ are well-defined because the Fibonacci multiplication is associative. Different trees are related by FF-moves and give the same morphism.

The isometry condition follows from
Zc(L)=∑a,α∣Ma,αc∣2∏i=1rZai(ℓi).
Zc​(L)=a,α∑​
​Ma,αc​
​2i=1∏r​Zai​​(ℓi​).

The coherence condition follows because the intermediate ZZ-factors cancel in a two-step refinement, while the MM-coefficients compose associatively.

So for
I=B1∪⋯∪Bs,Bq=Jq,1∪⋯∪Jq,rq,
I=B1​∪⋯∪Bs​,Bq​=Jq,1​∪⋯∪Jq,rq​​,

one gets exactly
EI→{Jq,m}=(⨂qEBq→(Jq,1,…,Jq,rq))EI→(B1,…,Bs).
EI→{Jq,m​}​=(q⨂​EBq​→(Jq,1​,…,Jq,rq​​)​)EI→(B1​,…,Bs​)​.

This is the desired coherence for arbitrary finite refinements.
8. Explicit binary formulas

Although the construction is not fundamentally binary, the r=2r=2 formulas are useful.

Let
I=J∪K,x=ℓ(J),y=ℓ(K),L=x+y.
I=J∪K,x=ℓ(J),y=ℓ(K),L=x+y.

Then
EI→(J,K)(1)=Z1(x)Z1(y)Z1(L) 1J1K+ϕ Zτ(x)Zτ(y)Z1(L) (τJτK)1.
EI→(J,K)​(1)=Z1​(L)Z1​(x)Z1​(y)​
​1J​1K​+Z1​(L)ϕZτ​(x)Zτ​(y)​
​(τJ​τK​)1​.

And
EI→(J,K)(τ)=Zτ(x)Z1(y)Zτ(L) τJ1K+Z1(x)Zτ(y)Zτ(L) 1JτK+ϕ−1Zτ(x)Zτ(y)Zτ(L) (τJτK)τ.
EI→(J,K)​(τ)=Zτ​(L)Zτ​(x)Z1​(y)​
​τJ​1K​+Zτ​(L)Z1​(x)Zτ​(y)​
​1J​τK​+Zτ​(L)ϕ−1Zτ​(x)Zτ​(y)​
​(τJ​τK​)τ​.

These coefficients are normalized because of the convolution identities for Z1,ZτZ1​,Zτ​.

In the small-length or dilute regime,
Zτ(ℓ)∼ρℓ,Z1(ℓ)∼1,
Zτ​(ℓ)∼ρℓ,Z1​(ℓ)∼1,

so the single-particle localization terms reduce to
ℓ(J)ℓ(I).
ℓ(I)ℓ(J)​
​.

The extra splitting terms are higher order in the density scale ρρ.
9. Explicit three-child example

Let
I=A∪B∪C,
I=A∪B∪C,

with
uA=Z1(ℓ(A)),zA=Zτ(ℓ(A)),
uA​=Z1​(ℓ(A)),zA​=Zτ​(ℓ(A)),

and similarly for B,CB,C.

For parent charge ττ, the direct three-child refinement contains the one-ττ components
zAuBuCZτ(L) ∣τ11⟩,
Zτ​(L)zA​uB​uC​​
​∣τ11⟩,
uAzBuCZτ(L) ∣1τ1⟩,
Zτ​(L)uA​zB​uC​​
​∣1τ1⟩,
uAuBzCZτ(L) ∣11τ⟩.
Zτ​(L)uA​uB​zC​​
​∣11τ⟩.

It also contains the two-ττ components
ϕ−1/2zAzBuCZτ(L) ∣(ττ)τ1⟩,
ϕ−1/2Zτ​(L)zA​zB​uC​​
​∣(ττ)τ​1⟩,
ϕ−1/2zAuBzCZτ(L) ∣(τ1τ)τ⟩,
ϕ−1/2Zτ​(L)zA​uB​zC​​
​∣(τ1τ)τ​⟩,
ϕ−1/2uAzBzCZτ(L) ∣1(ττ)τ⟩.
ϕ−1/2Zτ​(L)uA​zB​zC​​
​∣1(ττ)τ​⟩.

Finally, the three-ττ component is
zAzBzCZτ(L)(ϕ e1+ϕ−1eτ),
Zτ​(L)zA​zB​zC​​
​(ϕ
​e1​+ϕ−1eτ​),

where
e1=((τAτB)1τC)τ,
e1​=((τA​τB​)1​τC​)τ​,
eτ=((τAτB)ττC)τ.
eτ​=((τA​τB​)τ​τC​)τ​.

Now group instead as
A∣(BC).
A∣(BC).

The same three-ττ component is obtained as
zAzBzCZτ(L)(ϕ f1+ϕ−1fτ),
Zτ​(L)zA​zB​zC​​
​(ϕ
​f1​+ϕ−1fτ​),

where
f1=(τA(τBτC)1)τ,
f1​=(τA​(τB​τC​)1​)τ​,
fτ=(τA(τBτC)τ)τ.
fτ​=(τA​(τB​τC​)τ​)τ​.

Because
(f1fτ)=Fττττ(e1eτ)
(f1​fτ​​)=Fττττ​(e1​eτ​​)

and
Fττττ(ϕϕ−1)=(ϕϕ−1),
Fττττ​(ϕ
​ϕ−1​)=(ϕ
​ϕ−1​),

the two groupings agree exactly.

This is the concrete Fibonacci coherence mechanism.
10. Global refinement of partition Hilbert spaces

For a full partition
P={I1<⋯<IN},
P={I1​<⋯<IN​},

define
AP=AI1⊗⋯⊗AIN,AI=1⊕τ.
AP​=AI1​​⊗⋯⊗AIN​​,AI​=1⊕τ.

If P′P′ refines PP, define
EP→P′=⨂I∈PEI→Ch⁡P′(I).
EP→P′​=I∈P⨂​EI→ChP′​(I)​.

Then
EP→P′:AP→AP′.
EP→P′​:AP​→AP′​.

On the charge-WW Hilbert spaces,
HPW=Hom⁡Fib(W,AP),
HPW​=HomFib​(W,AP​),

the refinement map is
f⟼EP→P′∘f.
f⟼EP→P′​∘f.

Since every local EIEI​ is an isometry,
EP→P′†EP→P′=id⁡AP,
EP→P′†​EP→P′​=idAP​​,

so the induced Hilbert-space map is also an isometry.

For
P⪯P′⪯P′′,
P⪯P′⪯P′′,

the cellwise coherence gives
EP′→P′′EP→P′=EP→P′′.
EP′→P′′​EP→P′​=EP→P′′​.

Thus the HPWHPW​ form an honest directed system.
11. Interpretation

There are two distinct regimes.

The old square-zero model used
1=empty,τ=one resolved particle.
1=empty,τ=one resolved particle.

Then refinement preserves particle number, and the geometry weight is simply
ℓ(J)ℓ(I).
ℓ(I)ℓ(J)​
​.

That model gives the usual L2L2-particle continuum.

The splitting Fibonacci model instead uses
1=total vacuum charge sector,τ=total τ charge sector.
1=total vacuum charge sector,τ=total τ charge sector.

Then a cell labelled 11 may contain an unresolved ττττ pair, and a cell labelled ττ may contain one, two, three, or more microscopic ττ-anyons whose total charge is ττ.

The refinement coefficients are no longer just length ratios. They are
geometry factors×Fibonacci OPE/fusion coefficients.
geometry factors×Fibonacci OPE/fusion coefficients.

Concretely:
Za1(ℓ1)⋯Zar(ℓr)/Zc(L)
Za1​​(ℓ1​)⋯Zar​​(ℓr​)/Zc​(L)
​

is the geometric part, and
Ma,αc
Ma,αc​

is the Fibonacci splitting/OPE part.

So the precise slogan is:
Geometry supplies the Z-weights; Fibonacci supplies the F-coherent OPE tensors.
Geometry supplies the Z-weights; Fibonacci supplies the F-coherent OPE tensors.​

And the main warning is:
If 1 is required to mean literally empty, nonzero coherent Fibonacci splitting is impossible.
If 1 is required to mean literally empty, nonzero coherent Fibonacci splitting is impossible.​


