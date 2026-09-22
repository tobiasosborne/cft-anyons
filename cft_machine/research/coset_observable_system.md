# A strict finite-algebra coset OAR system and its local reconstruction

Status: proved finite-algebra construction, with a specified local continuum
reconstruction. It is a nonlocal descendant encoding, not a finite-range
spatial lattice realization. Conventions (aa),(ab) precede this construction.
All proofs use the existing exact coset polynomials; no target matrix elements
or continuum character coefficients are supplied to the finite algorithm.

Sources and dependencies, with exact repository-relative anchors:

- OAR: `literature/md/2010.11121/2010.11121.md:101–111,126–180` requires
  coherent unital injective *-maps, state pullbacks, horizontal limits and GNS.
- Soft: `literature/md/2306.16063/2306.16063.md:185–208,568–593`,
  Definitions 9/33: contractive connecting maps, norm-asymptotic composition
  and multiplicativity; the null ideal consists of norm-null sequences.
- CW: `references/cft-machine/coset-symmetry/CarpiWeiner2004/source.tex:700–788,864–880,939–976`:
  positive-energy mode bounds, smooth stress essential self-adjointness on
  finite-energy vectors, and strong resolvent/exponential continuity.
- KL: `references/cft-machine/realisation/KawahigashiLongo2002/source.tex:624–635,1008–1024,1106–1178`:
  vacuum Virasoro nets, diagonal-coset identification and all DHR sectors.
- L: `references/cft-machine/coset-observables/Landsman1998/source.tex:2481–2523`:
  closed ideals, isometric injective C*-homomorphisms and closed images.
- FR: `references/qft/FewsterRejzner2019/source/AQFTIMPRS-Oct2019.tex:359–461,1255–1268`:
  GNS and represented local weak closures.
- CR-1/CR-2 in `cft_machine/research/coset_route.md` prove the affine/coset
  normalization and eventual exact equality on every finite free-energy core.
  The source GKO Eq. (2.20), registered in `references/cft-machine/virasoro/`,
  supplies the unitary vacuum-coset representation used in the identification.

## CO-1. Computable descendant spaces and a genuine strict OAR tower

ASSUME integer k>=1 and the existing coset-polynomial recipe. Let V_b be
spanned by the vacuum and all C_-n1 ... C_-nr Omega with n_j>=1 and
sum n_j<=b, in the common sea representation; H is the closure of their union.
PROVE finite algebras A_b=B(V_b) direct-sum C, the maps and states below
form a strict OAR system with inductive limit K(H)+C1 and GNS Hilbert space H.

<1>1. Every V_b and its metric are computable from finite microscopic data.
  <2>1. There are finitely many such words. Use R_b=2b+1,M_b=16(b+1).
  CR-2's inequalities hold for each intermediate grade<=b and |n|<=b,
  so the word vectors equal their continuum representatives exactly.
  <2>2. Exact complex-rational Gram elimination selects a basis and its
  positive metric. Linear dependencies are removed by exact arithmetic,
  not a numerical rank tolerance. Exact sea maps preserve these word vectors.
  <2>3. Hence V_b embeds isometrically in V_B for B>=b, with maps J_Bb
  that compose. No continuum character is needed to compute a rank.
  QED BY <2>1–<2>2 and CR-2.

<1>2. Define the independent-scalar augmentation
  alpha_Bb(a,lambda)=(J_Bb a J_Bb*+lambda(1-J_Bb J_Bb*),lambda).
  <2>1. The two first-coordinate terms have orthogonal supports. Products
  have first coordinate J_Bb aa' J_Bb*+lambda lambda'(1-J_Bb J_Bb*).
  Thus multiplication and adjoints are preserved and (1,1) maps to (1,1).
  <2>2. Compressing the first coordinate by J_Bb* recovers a; the second
  coordinate recovers lambda. Thus alpha_Bb is injective and isometric BY L.
  <2>3. For b<=B<=D, the shell projections split as
  1-J_Db J_Db*=(1-J_DB J_DB*)+J_DB(1-J_Bb J_Bb*)J_DB*.
  Substitution proves exact composition.
  <2>4. QED BY <2>1–<2>3. This satisfies the OAR source's algebra definition.

<1>3. The limit algebra is K(H)+C1 in its standard representation.
  <2>1. Write i_b:V_b→H and P_b=i_b i_b*. The compatible embeddings are
  iota_b(a,lambda)=i_b(a-lambda 1)i_b*+lambda 1_H.
  They are faithful because H is infinite-dimensional and V_b is finite.
  <2>2. Infinite dimension follows within the c>0 vacuum representation:
  ||C_-n Omega||²=c(n³-n)/12>0 for n>=2, at distinct grades.
  <2>3. Their union consists of scalars and finite matrices supported in
  some V_b. Since the union V_b is dense, its norm closure is K(H)+C1.
  <2>4. QED BY <2>1–<2>3. The extra scalar is not a vacuum expectation
  substituted for lambda; that substitution would destroy multiplicativity.

<1>4. Set omega_b(a,lambda)=<Omega,a Omega>.
  <2>1. This is a state and omega_B alpha_Bb=omega_b, since Omega lies
  in every V_b. Every horizontal Wilson row is therefore constant.
  <2>2. The limit state is the vector state of Omega on K(H)+C1. Its
  GNS is H: [a] maps to a Omega, and finite-rank operators make this cyclic.
  <2>3. QED BY <2>1–<2>2 and the GNS construction in FR.
<1>5. QED BY <1>1–<1>4.

The optional positive Hamiltonian h_b=(E|V_b,b+1) has the vacuum as its
unique ground state: on a descendant of grade l, both E and C_0 act by l,
and grade zero is the vacuum line. Its dynamics commute exactly with alpha:
V_b and its shell are E-invariant, and alpha(a,lambda) is scalar on the shell.
Thus unequal scalar penalties across scales do not obstruct dynamic covariance.
This is a finite, generally nonlocal Hamiltonian in the descendant encoding.

## CO-2. Local smooth stress is an exactly finite compression

ASSUME the unitary vacuum Virasoro identification for H from GKO/KL, with
central charge c=1-6/[(k+2)(k+3)]. Let f be a real smooth interval-supported
vector-field coefficient and T(f)=closure(sum_n fhat_n C_n) on H.
PROVE its finite compressions are computable microscopic operators, and
u_b(f,t)=(exp(i t T_b(f)),1) has represented strong* limit exp(i t T(f)).

<1>1. The vacuum-module identification uses only the known representation,
not its matrices as input. Commuting positive modes to the vacuum determines
all descendant Gram products from c and h=0. CR-1 gives those same products
for the actual microscopic words. Thus their completed cyclic modules agree
isometrically with the unitary vacuum module; KL identifies its local net.
CW's projective-representation hypotheses are applied on this vacuum module,
not on the ambient sum of coset sectors with different rotation phases.

<1>2. T_b(f)=P_b T(f)P_b is exactly
sum_(|n|<=b) fhat_n P_b C_n P_b, interpreted on V_b.
  <2>1. C_n changes grade by -n. Matrix elements between grades in [0,b]
  vanish for |n|>b. The absolutely convergent smooth sum on finite-energy
  vectors is justified by CW:750–788, so the finite compression formula holds.
  <2>2. CR-2 with the CO-1 schedule computes all retained matrix elements
  from finite CAR polynomials. Only 2b+1 Fourier coefficients are required.
  <2>3. The resulting finite matrix is self-adjoint since fhat_-n is the
  conjugate of fhat_n and the compressed modes have paired adjoints.
  QED BY <2>1–<2>3.

<1>3. Zero-extended compressed stresses converge on the finite-energy core.
  <2>1. Write S_b=i_b T_b(f)i_b*. For v in V_e and b>=e,
  S_b v=P_b T(f)v→T(f)v, because P_b→1 strongly.
  <2>2. CW:864–880 makes the union of finite-energy spaces an essential
  self-adjointness core for real smooth f. Each S_b is bounded self-adjoint.
  <2>3. To see resolvent convergence directly, put R_b=(S_b-i)^-1.
  For v in that core, R_b(T(f)-i)v-v=R_b(T(f)-S_b)v→0 and ||R_b||<=1.
  The range (T(f)-i)core is dense; extend this convergence by the uniform
  bound. The same proof works at -i and other nonreal spectral parameters.
  <2>4. The self-adjoint functional-calculus implication gives
  exp(itS_b)→exp(itT(f)) strongly, also with -t, hence strongly*.
  This is the same core→resolvent→unitary implication used explicitly in
  OS `references/text/CFTFromLatticeFermions.txt:3495–3522` and CW:969–976.
  <2>5. QED BY <2>1–<2>4.

<1>4. iota_b(u_b(f,t))=exp(itS_b), because it is identity on 1-P_b.
The corresponding resolvent element is ((T_b(f)-z)^-1,-1/z), not a corner
resolvent missing its complementary scalar. QED BY <1>2–<1>3.

This proves local-smearing unitary convergence without assuming a uniform
microscopic bound on all uncompressed coset modes. A computable f must supply
its finitely requested Fourier coefficients; certified rational approximations
also suffice if the resulting finite-matrix norm error is at most 2^-b.
Such an error leaves CO-2 <1>3 unchanged by the triangle inequality. Finite
matrix norm upper bounds are computable from the retained Gram metric.
Arbitrary real smooth functions are a mathematical domain, not finite
algorithmic input or an effective convergence modulus.

## CO-3. A generated bounded-sequence quotient reconstructs the local net

ASSUME the CO-1 embeddings and CO-2 bounded unitary sequences. Let E consist
of uniformly bounded sequences a_b in iota_b(A_b) that converge strongly
with their adjoints; equip E with the supremum norm and write L(a)=lim a_b.
Let B(I)=C*(1,(iota_b(u_b(f,t)))_b : supp f contained in I, t rational).
PROVE B(I)/ker(L|B(I)) identifies with the C*-algebra generated by the
corresponding target stress unitaries; its vacuum GNS weak closures give Vir_c.

<1>1. E is a C*-algebra and L is a contractive unital *-homomorphism.
  <2>1. For two convergent sequences, products converge strongly by
  ||a_b b_b v-abv||<=sup||a_b|| ||(b_b-b)v||+||(a_b-a)bv||.
  Apply the same estimate to adjoints. Sums and adjoints are immediate.
  <2>2. Sup-norm Cauchy sequences have a uniform coordinatewise limit;
  their strong limits are norm-Cauchy because ||L(a)-L(b)||<=||a-b||sup.
  The three-term approximation proves the coordinatewise limit still
  converges strongly with adjoints. Thus E is norm closed in the product.
  <2>3. QED BY <2>1–<2>2. Its kernel is a closed two-sided *-ideal.

<1>2. L(B(I))=C*(1,exp(itT(f)):supp f contained in I,t rational).
  <2>1. One inclusion follows by contractivity and polynomial approximation.
  The image contains every displayed generator, and is norm closed by
  L:2509–2523, so the reverse inclusion holds too.
  <2>2. The quotient is isometrically isomorphic to this image by the
  closed-kernel/faithful-image theorem, L:2481–2523.
  <2>3. QED BY <2>1–<2>2. No extra relation is imposed by hand.

<1>3. Isotony holds at sequence level. For disjoint intervals, commutators
have zero strong* limit by locality of the identified vacuum Virasoro net;
thus locality holds in the quotient. Rational t generate the same weak
closure as real t by strong continuity. Smooth stress exponentials generate
the local Virasoro net (KL:624–635; CW:390–445).

<1>4. On the global generated algebra define rho(a)=lim omega_b(iota_b^-1(a_b)).
  <2>1. This equals <Omega,L(a)Omega>, so it is a state annihilating ker L.
  <2>2. The GNS map [a]→L(a)Omega is isometric and has range dense in H:
  the vacuum is cyclic for the stress representation defining its descendants.
  FR's local weak-closure construction therefore gives precisely the net
  identified in <1>3. Spectator fermions are absent from this representation.
  <2>3. QED BY <2>1–<2>2.
<1>5. QED BY <1>1–<1>4 and CO-2. The resulting projective Diff symmetry
and complete minimal-model DHR modular data are those in KL:1106–1178.

## What is OAR here, and what is still not a local lattice construction?

CO-1 is genuine strict OAR over NEW finite-dimensional algebras, with exact
connecting maps and actual states. It is not a restriction or compatible
quotient of the original CAR refinement: the CAR map tensors a coarse
projector with spectator identity and changes its rank, whereas the new
map embeds its descendant matrix as a corner. Finite CAR calculations
supply the descendant spaces; the new scalar-augmented maps then define
an alternative encoding. CO-3 is its additional represented field-limit
construction; it is not a replacement definition of strict or soft OAR.
The norm limit K(H)+C does not generally contain the stress exponentials.
They live in its represented weak closure B(H), and CO-3 defines the local
field subalgebras there. The choice of microscopic stress sequences carries
the continuum geometry and CFT content; the compact algebra alone does not.

The bare strong*-sequence construction alone is insufficient for OAR.
On an infinite Hilbert space q_b=|e_b><e_b| is strongly*-null but ||q_b||=1.
Therefore its kernel is larger than the norm-null ideal in Soft:201–208.
Dropping initial coordinates in tail algebras yields the norm-null quotient,
not this strong*-null quotient. Naming tail restriction a soft limit would
not fix the mismatch or provide the source's contractive connecting maps.

The finite algebras are global descendant matrices, without tensor-local
spatial sites. For any nonempty interval, finitely many Fourier moments of
smooth supported functions are independently specifiable: otherwise a
nonzero finite trigonometric polynomial would vanish on that interval.
Thus finite compressed stress does not faithfully retain interval support.
Even exact same-label refinement is impossible: choose f with its |n|<=b
moments zero but a higher nonzero moment. One explicit construction applies
D² product_(j=1)^b(D²+j²), D=d/dx, to a nonzero real compactly supported
smooth bump. It kills those Fourier moments; if it vanished identically,
the bump could have only finitely many Fourier modes, contradicting its
nonzero compact support inside a proper interval.
If needed also kill modes +/-1; a remaining coefficient at |n|>=2 gives a
nonzero vacuum descendant since c(n³-n)/12>0. Thus T_b(f)=0 while some
later T_B(f) is nonzero. For some rational t the corresponding unitary is
nontrivial. The maps alpha cannot send every u_b(f,t) to u_B(f,t).
CO-2 proves the appropriate asymptotic operator statement instead.

A free universal-unitary presentation with generator-inclusion maps and
microscopic pullback states would also give a formal strict OAR lift, but its
finite presentation algebras are infinite-dimensional and its physical
representation kernels need not descend. CO-1 improves on that alternative:
it gives actual finite algebras, although still a nonlocal physical encoding.

The construction is finite and source controlled at every cutoff, not an
efficient algorithm with a proved complexity bound. It supplies a positive
nonlocal finite-algebra/minimal-net branch. A finite-range lattice Hamiltonian
and spatially local finite observable realization remain additional work;
this result does not complete the general categorical pipeline.
