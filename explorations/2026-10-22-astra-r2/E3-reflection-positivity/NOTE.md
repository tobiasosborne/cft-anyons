# E3 — Spatial seams, reflection data, and finite OS reconstruction

**2026-10-22. Status: E3 as stated is false; corrected finite theorems below.**
The new result is a typed, multiplicity-resolved spatial-seam compiler and
its exact positivity criterion. Reconstruction and commuting-transfer results
require additional hypotheses, listed explicitly. No continuum construction,
Euclidean covariance, or categorical fidelity is proved.

**Scope of edits.** The brief confines this round to this directory. Thus
the following local conventions and the verification record replace changes
to the root conventions, INDEX and worklog for this exploration only.
No report changes, commits, network access or Julia runs are made.

## 1. Conventions and input contract, before the derivation

Use CONVENTIONS (b),(r),(ak),(al),(ao): orthonormal fusion vertices,
left-associated tree coordinates, dagger = conjugate transpose, positive
spherical duality, raw cups, all charges and multiplicities, and
`H = -sum h_j`. The site O is nonzero. Inner products are linear in the second slot.
Let `bar O` denote the chosen dual, with
`ev_O:bar O tensor O -> 1` and `coev_O:1 -> O tensor bar O`.
Their squared norms are `d_O`. They are distinct oriented cups/caps;
no self-duality or Frobenius–Schur sign is suppressed.
Primary basis/duality sources: [P]:398–430,530–568,992–1030.

Distinguish the **linear history** tile `T(t)=1+t h` (identity included)
from the **exact** tile `T(t)=exp(t h)`. CA-86:80–93 only identifies the
first with the exponential circuit up to a remainder. Use CA-78:56–68
for exact coefficients `w_alpha(t)`. Positivity of a truncated expression
does not establish positivity of its unspecified remainder.

Local notation introduced here:

- `W_+=O tensor bar O`, `W_-=bar O tensor O`.
- `rot` is the complex-linear quarter-turn in (1), with its displayed
  orientation. It is not a dagger and is not presumed an endomorphism.
- A **reflection pairing** includes a specified unitary
  `s:W_+ -> W_-` with `s coev_O = ev_O^dagger` and a rule pairing all
  non-seam tiles/outer boundaries with their reflected adjoints.
  For larger seams the specified pairing must tensor and reassociate
  compatibly; it is not chosen separately to make each tile positive.
  This is additional lattice reflection data. Its existence is not assumed
  for every `(C,O)`. In an oriented doubled construction one may instead
  supply matched dual ports; the test below then uses those actual ports.
  The reflection rule is assumed anti-linear, involutive and compatible with dagger
  and sewing; the reverse seam uses `s^dagger`. A unitary satisfying only
  the displayed cup equation is not asserted to supply this whole rule.
- `K_s(T)=s^dagger rot(T)` acts on `W_+`.
  `v_(a,mu):a -> W_+` are isometric inclusions, with
  `v_(a,mu)^dagger v_(b,nu)=delta_(a,b)delta_(mu,nu) id_a` and
  `sum v_(a,mu)v_(a,mu)^dagger=1`.
- Reflection positivity (RP) means positivity for **all linear combinations
  of half-patch insertions**, not positivity of the scalar partition sum.
  Every iff specifies the accessible half-boundary space. A single fixed
  boundary state need not detect a negative seam eigenvector.
- `t>0` and the OS step `a>0` are real. Exact symbolic checks use no
  floating-point rank or positivity tolerance.

**Layer convention for every result below.** Setting: both candidate
chiral and full targets, with no chirality selected at this finite stage.
Underlying category data: L0 unitary fusion. Rung: R0 finite lattice data
and a prerequisite for R3, not R1 or R3 itself. Results requiring `s`,
translation/normalisation or a transfer closure are conditional on those
declared geometric/dynamical enrichments (L3), not claims from bare L0.
No L1 braiding, L2 modular data or L4 target theory is silently supplied.

## 2. Why the proposed statement cannot be true

The dagger-pair condition in E3(a) is exactly `h=h^dagger` when the
`D_alpha` form a dagger-paired basis (CA-80:97–104). It cannot simultaneously
be necessary and make self-adjointness unnecessary. Moreover its proposed
matrix must concern the complete transfer tile, including the identity,
not just the coefficient vector of the generator.

The following sections give explicit counterexamples, then the replacement
theorems. They use unit multiplicities available in every unitary fusion
category, not an accident of a distinguished model.

**Proposition E3-N (negative; both / L0 with the indicated pairing / R0).**
ASSUME any unitary fusion C; choose `O=1 direct-sum 1`. Its morphisms on
these summands are ordinary matrices. Fix the ordinary flip pairing of the
two mixed oriented ports. PROVE self-adjointness is insufficient for spatial
RP; after removing the premise `h=h^dagger`, it is unnecessary; positivity
of the reshuffled generator is unnecessary even for linear tiles.

<1>1. In tensor coordinates the bent kernel is

    K(T)_(i k),(j l) = T_(i l),(k j),
    K(A tensor B) = vec(A) vec(B^dagger)^dagger,                 (N1)

where `vec(A)_(ik)=A_ik`. BY the contraction (1) below; independently,
`checks/check_seams.py` compares all sixteen matrix units with cups/caps.

<1>2. Put `Z=diag(1,-1)` and `h=-Z tensor Z`. Then `h=h^dagger` and
`T(t)=1+t h>0` for `0<t<1`. However

    K(T(t))=|vec(1)><vec(1)|-t |vec(Z)><vec(Z)|,
    <vec(Z),K(T(t))vec(Z)>=-4t<0.

The exact exponential fails too: since `(Z tensor Z)^2=1`, its kernel is
`cosh(t)|vec(1)><vec(1)|-sinh(t)|vec(Z)><vec(Z)|`. BY its power series and
`<vec(1),vec(Z)>=0`. The single crossing tile and this half-boundary vector
are an explicit negative reflected patch; temporal positivity survives.

<1>3. Put `A=E_01` and `h=A tensor A^dagger`. Then `h!=h^dagger`,
`h^2=0`, and
`K(exp(t h))=K(1+t h)=|vec(1)><vec(1)|+t|vec(A)><vec(A)|>=0` for `t>=0`.
The spatially reflected partner of `A tensor B` is `B^dagger tensor A^dagger`;
this h is fixed by that operation, not by dagger alone. BY (N1).
This witness addresses the brief's “not necessary” assertion only after
dropping its contradictory initial self-adjointness assumption.

<1>4. For `h=-1`, `K(h)=-|vec(1)><vec(1)|` is not PSD, whereas
`K(1+t h)=(1-t)|vec(1)><vec(1)|>=0` for `0<=t<=1` and
`K(exp(t h))=exp(-t)|vec(1)><vec(1)|>=0` always. BY (N1).

<1>5. QED BY <1>1–4. These witnesses work inside every C and therefore
also refute a universal claim restricted to modular categories.

## 3. The spatial kernel, including all F and pivotal factors

**Theorem E3-S (proven conditional on the reflection pairing; both / L3 over
L0 / R0).** ASSUME §1, a single crossing tile `T=sum w_alpha D_alpha`, and
arbitrary half insertions spanning `H(W_+)=direct-sum_a Hom(a,W_+)`.
PROVE spatial RP for the paired patch iff each matrix in (2) is PSD.
Define, with associators inserted to respect the named parenthesizations,

    rot(T) = (1_barO tensor 1_O tensor coev_O^dagger)
             (1_barO tensor T tensor 1_barO)
             (ev_O^dagger tensor 1_O tensor 1_barO)
           : O tensor barO -> barO tensor O.                    (1)

The **precise coefficient matrix** is

    K^a_(mu nu)(w) = sum_alpha w_alpha R^a_(mu nu),alpha,
    R^a_(mu nu),alpha = d_a^(-1) tr_C[
        v_(a,mu)^dagger s^dagger
        (1_barO tensor 1_O tensor coev_O^dagger)
        (1_barO tensor D_alpha tensor 1_barO)
        (ev_O^dagger tensor 1_O tensor 1_barO) v_(a,nu)].         (2)

This is a finite, explicit formula in the supplied categorical presentation;
it does not mean “choose some matrix of paired coefficients.” For clarity,
the following is an entrywise F-symbol evaluation prescription for (2):

1. Expand each occurrence of O and bar O into its specified simple summands.
   Retain every copy index and every fusion-vertex index. Resolve every
   intermediate object by the isometric tree inclusions `i_b` and
   `sum_b i_b i_b^dagger=1`; the simple summand label is part of b.
2. In each fixed total-charge block, tensor placement on a non-adjacent
   subtree is `F_path^dagger (1 tensor D_alpha tensor 1) F_path`.
   `F_path` is the ordered product of elementary associators taking the
   declared left tree to the tree in which that slot is adjacent. Its
   entries are sums of products of the supplied F-symbols; inverse moves
   use conjugate transpose. This is the placement rule of CA-78:44–53.
3. Insert the supplied evaluation/coevaluation matrices in their actual
   oriented slots. On a simple raw cup their norms are `sqrt(d_i)`;
   their phases and pivotal identifications remain those of the input.
   Multiply by `s^dagger`, not an unprovided braiding. If a source vertex
   has Penneys' normalization (3.5.14), divide it by
   `(d_i d_j/d_k)^(1/4)` before using it as an isometry [P]:530–568.
4. Equivalently, write B, A_alpha, E for the complete tree-coordinate
   matrices of the right, middle and left factors of (1), including the
   preceding F transports. The scalar entries in (2) are exactly

       R^a_(mu nu),alpha
       = sum_(r,p,q) (s^dagger)^a_(mu r) E^a_(r p)
                     A_alpha^a_(p q) B^a_(q nu).              (3)

   Here all matrix indices include their allowed fusion multiplicities;
   `E,B` use different oriented cups. Formula (3), or the closed diagram
   (2), determines each entry without a multiplicity-free 6j convention.
   In arbitrary cut bases use the inverse Gram resolution of CA-80:70–81.

<1>1. Equation (1) is type correct: the intermediate word is
`barO tensor O tensor O tensor barO`; the central T acts on the two O's,
and the last cap removes `O tensor barO`. Thus rot is complex-linear into
`Hom(W_+,W_-)`, not generally an endomorphism. BY [P]:398–430 and (1).

<1>2. Resolve all intermediate identities as in the prescription. Ordinary
matrix multiplication gives (3); the scalar endomorphism of a in (2) has
trace `d_a` times that scalar. Thus (2) is exactly the block matrix of
`K_s(T)`. BY <1>1, the isometry identities and [P]:1010–1019.

<1>3. Bend the seam ports by (1) and identify the reflected port by s.
All remaining cuts now run along tile legs. The prescribed reflected
half-patch evaluates to the adjoint half-amplitude. CA-80 Lemma 80.1
therefore gives the mixed form `q(x,y)=<x,K_s(T)y>`. This is the new
spatial extension; the leg-cut sewing theorem itself is not re-proved.

<1>4. Apply CA-80 Lemma 80.2 to this explicitly computed seam operator.
The spanning assumption gives RP iff `K_s(T)>=0`, equivalently (2) PSD
for every a. The positive `d_a` factors of spherical closure do not alter
this test. Without spanning, only the accessible compression is tested.

<1>5. QED BY <1>1–4. In particular the Hermiticity equations are
`sum_alpha w_alpha R^a_(mu nu),alpha =
 sum_alpha conjugate(w_alpha R^a_(nu mu),alpha)`.
They are the **spatial** equations, not the temporal dagger-pair equations.

**Several crossing tiles.** ASSUME their ports and s pairings tensor
compatibly, they are disjoint along the seam, all other tensors occur in
reflected pairs, and any additional boundary/seam insertion is positive.
Then PSD of every K implies all-patch spatial RP.
<1>1. Write `K_i=B_i^dagger B_i` in the finite categorical endomorphism
algebra (blockwise spectral square roots). Their tensor product is
`(tensor B_i)^dagger(tensor B_i)>=0`.
<1>2. Reassociation is unitary; any admissible charge restriction or
half-patch attachment gives a compression `V^dagger(tensor K_i)V>=0`.
<1>3. Additional positive seam factors must be inserted as part of this
reflected factorization, not as an arbitrary noncommuting ordered product.
Apply the same factorization to their square roots. QED.
Necessity follows only if the admitted patches include the single-tile
full-span tests. A single fixed rectangle/partition sum gives no such iff.

**The missing reflection input is real.** The multiplicities
`dim Hom(a,W_+)` and `dim Hom(a,W_-)` must agree if s exists; a unitary
isomorphism preserves them. The explicit noncommutative graded-category
counterexample in the Examples table violates this equality. Dagger itself
reverses arrows, not the tensor order; taking a dual reverses tensor order
and changes labels. Neither supplies an endomorphism-valued spatial mirror
of an arbitrary unlabelled O-chain. [P]:682–708,917,992–1019.
An arbitrary category may still admit an oriented reflected/doubled lattice;
failure of this particular s is not a no-go for every construction.
For a more general reflection pairing specified directly on half-diagram
Hilbert spaces, the same positivity proof applies to its actual induced
matrix; it need not arise from a categorical morphism s. The obstruction
here is to the stated endomorphism-valued repair, not to every Hilbert
pairing of reflected charge sectors.

## 4. Sharp small-step criterion for the linear history

**Theorem E3-L (proven; both / L3 over L0 / R0).** ASSUME E3-S's pairing
and full-span tests. Let `u=coev_O`, considered as a vector in the vacuum
block of `H(W_+)`, and `e=u/sqrt(d_O)`. Write `P=|e><e|`, `Q=1-P`,
`A=K_s(h)`. PROVE there is an `epsilon>0` such that `1+t h` is spatially
RP for every `0<=t<epsilon` iff

    A=A^dagger,   C=Q A Q|_(QH)>=0,
    b=Q A e belongs to Ran(C).                                 (4)

For a specified `t>0`, with `a=<e,Ae>` and C^+ the inverse on Ran(C),
the exact criterion is (4) and

    d_O + t (a - b^dagger C^+ b) >= 0.                         (5)

All blocks, including non-vacuum charges, enter C.

<1>1. At T=1, (1) becomes `ev_O^dagger coev_O^dagger`. Since
`s coev_O=ev_O^dagger`, `K_s(1)=u u^dagger=d_O P`. BY (1) and §1.
Thus the exact linear seam is the block matrix

    K_s(1+t h) = [[d_O+t a, t b^dagger], [t b, t C]].           (6)

<1>2. Positivity for any t>0 implies Hermiticity of A, since the constant
matrix is Hermitian, and positivity of its lower-right compression C.
If `z in ker C`, positivity forces `q(e,z)=0`: otherwise the quadratic
form on `lambda e+z` has an arbitrarily signed linear term as lambda tends
to zero. Hence `b^dagger z=0`; in finite dimension this is `b in Ran C`.

<1>3. Under these conditions, for scalar alpha and `y in QH`, completing
the square gives

    <(alpha,y),K_s(1+t h)(alpha,y)>
      = t || C^(1/2)(y+C^+ b alpha) ||^2
        + (d_O+t a-t b^dagger C^+b)|alpha|^2.

BY expansion and `C C^+b=b`. Thus (5) is necessary and sufficient;
necessity follows by setting `y=-C^+b alpha`.

<1>4. Because `d_O>0` and all matrices are finite, (5) holds for all
sufficiently small positive t exactly when (4) holds. QED BY <1>1–3.

This is an explicit generator-coefficient condition via (2), but it is not
`K_s(h)>=0`. It applies to the **linear history only**. For exact exponentials
the complete criterion remains `K^a(w(t))>=0`, using CA-78's coefficient
ODE. Differentiation implies `K_s(h)` Hermitian and `Q K_s(h) Q>=0` if
exact RP holds near zero; the linear-pencil range condition cannot be
inferred without controlling the higher-order terms. For example the
positive matrix `[[1,t],[t,t^2]]` has derivative `[[0,1],[1,0]]`, whose
linear pencil fails the range test. This illustrates the analytic issue;
it is not asserted to be a categorical exponential gate.

## 5. What a finite OS reconstruction actually proves

**Theorem E3-OS (conditional; both / L3 / R0).** ASSUME a finite vector
space V of half-insertions, a shift `tau:V->V`, a nonzero positive form q0,
and the one-step form `q1(f,g)=q0(f,tau g)` satisfying

    0 <= q1 <= q0.                                             (7)

PROVE the quotient `H=V/rad(q0)` has a positive contraction
`T[f]=[tau f]`. If T is injective, it has a positive Hamiltonian
`E=-a^(-1)log T` and `T^n=exp(-na E)`. If `tau 1=1` and `q0(1,1)=1`,
the distinguished vector `Omega=[1]` is a normalized zero-energy vector.

<1>1. For any PSD form q, `q(z,z)=0` implies `q(f,z)=0`: apply
positivity to `z+lambda f` and vary complex lambda. Thus its zero-norm
space is its radical. Quotienting q0 gives a positive definite finite
inner product. BY the displayed quadratic-form argument.

<1>2. If z is q0-null, (7) implies `q1(z,z)=0`, hence `q1(f,z)=0`.
The defining equation for q1 gives `q0(f,tau z)=0` for all f. Therefore
tau preserves the radical and T is well-defined. BY <1>1.

<1>3. On the quotient,
`<[f],T[g]>=q1(f,g)` is Hermitian and between zero and q0 on the diagonal.
Consequently `T=T^dagger` and `0<=T<=1`. BY polarization and (7).

<1>4. Diagonalize T. Under injectivity its eigenvalues lie in `(0,1]`;
define E to have eigenvalues `-log(lambda)/a>=0`. The claimed exponential
and vacuum equations follow eigenvalue by eigenvalue. QED BY <1>1–3.

<1>5. Discrete multi-time kernels are positive:
`sum_ij <v_i,T^(n_i+n_j)v_j>=||sum_i T^n_i v_i||^2>=0`.
This proves the finite semigroup/reflected-kernel part of reconstruction,
not covariance, locality, regularity of fields or a continuum limit.

**How this connects to histories, without hiding an assumption.**
E3-S and CA-80 supply q0 from a specified seam. A second reflection
test for the one-step translated seam can supply q1>=0. The upper bound
in (7), shift closure of V, and compatibility of the two forms must be
proved for the chosen strip. Alternatively, if the full-span seam of an
endomorphic strip is already a nonzero positive transfer S, set
`T=S/rho`, `rho>=||S||`; this is a declared per-step scalar normalization,
or energy shift. With half-amplitudes in Ran(S^(1/2)), the quotient
`q0(f,g)=<f,Sg>` identifies isometrically via `[f]->S^(1/2)f`; the normalized
translation `tau=S/rho` descends to `T|support(S)`.
These statements follow by diagonalizing S; they do not force a generic
unsymmetrized brick product to be Hermitian. Use CA-80 Lemma 80.4's
reflected schedule when it applies.

**Strictness cannot be omitted.** For T=1 on `O tensor O` in the unit
multiplicity tier of E3-N, the spatial transfer is `K(1)=|vec(1)><vec(1)|`.
It is PSD with a nontrivial kernel for `dim O>1`. It cannot equal
`exp(-aE)` on the entire cut space for a finite self-adjoint E, since that
exponential has no zero eigenvalues. Restricting to its support is permitted
only if the chosen OS quotient/observables justify it; it changes general
zero-time boundary data. A site-reflection Gram alone is also insufficient
for positive one-step translation: `q0=1`, `tau=-1` is a counterexample
until (7)'s lower bound is imposed.

**Two directions and rotation.** Apply E3-OS separately to temporal and
spatial insertion spaces when their hypotheses hold. This gives energies
`E_t>=0` and `E_x>=0` on *two* Hilbert spaces, often of different dimensions.
Neither is thereby the physical momentum in the other's quantization.
Tangential translations preserving q0 and having inverse translations
descend to unitaries: their norm equality and surjectivity prove this.
A logarithm requires a branch, and its momentum need not be positive.
Indeed `J P J^dagger=-P` and `P>=0` would imply both `P>=0` and `P<=0`,
forcing `P=0`. Positive energy and signed momentum agree with [SC]:4113–4117,
4150–4172; covariance is a separate OS axiom [SC]:4620–4636.

Quarter-turning is (1), followed by coordinate changes involving F and the
declared pivotal identifications. It is complex-linear. “F composed with
dagger” is conjugate-linear, hence cannot equal it on a nonzero complex
morphism space. Nor is it a similarity: the identity tile has full temporal
rank and rank-one spatial K in E3-N. Equal ranks under similarity contradict
this example. Relating the two complete directional transfers requires
matching cut objects, geometry, weights and boundaries, not just an F-move.
Consequently the full E3(b) and the claimed discretized OS axioms do not
follow. The finite theorem above is the precise replacement.

## 6. Integrability: the corrected statement and the actual commutator

E3(c)'s perpendicular commutator has no meaning before identifying its
two cut Hilbert spaces. Even on one space, local YBE does not imply that
arbitrary brick sweeps commute. This is already CA-78 Proposition 78.7
and its erratum, not a new result to re-derive. The source is explicit:
[KS]:603 defines the brick row; :716–718 says it does not commute;
:725 instead gives the **sequential** product
`tau_D(u)=product_(j=1)^L [X_(2j)(u) X_(2j+1)(u)]`, with that source's
periodic representation and boundaries. Grouping all even factors first
changes the operator. [KS]:729–738 supplies its Hamiltonian expansion.
Those statements are about a parameter family on one cut, not about the
two perpendicular transfers of an arbitrary categorical history.

**Theorem E3-Y (conditional; both / L3 over L0 / R0).** ASSUME one physical
fusion cut Hilbert space H, specified finite auxiliary carriers A,B and
operators `L_(aj)(u),L_(bj)(v)` on `A tensor B tensor H`. Each L_(aj)
acts trivially on B and each L_(bj) acts trivially on A. No tensor
factorization of H into physical sites is assumed. Let R be invertible on
`A tensor B`, extended by the identity on H. Assume

    [L_(aj),L_(bk)]=0 for j!=k,
    R L_(aj) L_(bj) = L_(bj) L_(aj) R.                          (8)

Let `M_a=L_(aN)...L_(a1)` and similarly for b. Supply a linear closure
`Cl:End(A tensor B tensor H)->End(H)` with

    Cl(M_a M_b)=t(u)t(v),   Cl(M_b M_a)=t(v)t(u),
    Cl(R^(-1) X R)=Cl(X).                                     (9)

PROVE `[t(u),t(v)]=0`. The L's, R and closure are the typed train data
to be verified from a chosen spectral YBE solution and boundary grammar.
They are not asserted to exist from fusion data alone. [Y]:156–170 is a
local precedent for face-model YBE and properly closed transfer matrices.

<1>1. Disjoint-site cross commutation in (8) regroups `M_a M_b` as
`A_N...A_1`, where `A_j=L_(aj)L_(bj)`; similarly `M_b M_a=B_N...B_1`,
`B_j=L_(bj)L_(aj)`. BY moving only factors with different site indices.

<1>2. Apply `R A_j=B_j R` successively for j=N down to 1:
`R M_a M_b=M_b M_a R`. BY (8) and <1>1.

<1>3. Multiply by `R^(-1)` and apply (9). This gives
`t(u)t(v)=Cl(R^(-1)M_b M_a R)=t(v)t(u)`. QED.

<1>4. Ordinary auxiliary trace is one valid closure: with boundary twists
K_a,K_b and `[R,K_a tensor K_b]=0`, set
`t_a=Tr_A(K_a M_a)`, `t_b=Tr_B(K_b M_b)` and
`Cl(X)=Tr_AB[(K_a tensor K_b tensor 1_H)X]`. The stated auxiliary
support assumptions give the product property. Partial trace is invariant
under this auxiliary conjugation and has the product property. Expanding
in matrix units on A and B verifies both statements; R has scalar
auxiliary entries, so this does not incorrectly cycle physical operators.
A categorical face closure instead must verify (9) with its own seam
labels, Gram factors, dimension weights and boundary twists.

**Consequences and limit of the integrable-line claim.** For a correctly
closed diagonal family satisfying (8)–(9), normalize `t(0)=1` and write
`t'(0)=-H`. Differentiating the proved identity gives `[H,t(v)]=0`.
Applied to the sourced sequential diagonal transfer, this is precisely
CA-78:165–174's corrected conclusion with the derivative in [KS]:731–738.
If a crossing-and-boundary theorem additionally identifies the two
directional transfers as `t(u)` and `t(v)` on this same H, they commute
by E3-Y. That additional identification is **unproved for general C**;
neither the source nor local YBE supplies it. It is the exact missing
hypothesis in the requested integrable-line assertion.

**Proposition E3-D (proven residual; both / L3 / R0).** Keep the typing,
disjoint commutations and closure (9), but replace the local equality in
(8) by defects `D_j=R A_j-B_j R`. PROVE

    D_global := R M_a M_b - M_b M_a R
      = sum_(k=1)^N B_N...B_(k+1) D_k A_(k-1)...A_1,
    [t(u),t(v)] = Cl(R^(-1) D_global).                         (10)

<1>1. For N=1 this is the definition. For general N, substitute
`R A_N=B_N R+D_N` and repeat on the remaining product; this gives the
displayed sum with the stated endpoint orders. BY induction.
<1>2. Multiply by `R^(-1)`, apply (9), and subtract the two product
closures. QED. Nonzero defects may cancel in the sum or vanish under
Cl; there is no converse “off-line implies noncommuting.”
CA-78:150–160 already proves a stronger negative witness: mutually
commuting gates that violate additive YBE under every nontrivial analytic
reparametrization. It remains a counterexample to the off-line assertion;
its spectral gates are not exponentials of one fixed generator.

**Proposition E3-T (proven Taylor formula; both / declared common carrier /
R0).** ASSUME differentiable finite transfers on the same H, with expansions
`T_t(delta)=T_t0+delta T_t1+O(delta^2)` and similarly for x. PROVE

    [T_t(delta),T_x(delta)] = [T_t0,T_x0]
      + delta ([T_t1,T_x0]+[T_t0,T_x1]) + O(delta^2).            (11)

<1>1. Multiply the two expansions in each order and subtract. This proves
(11) and controls the remainder in any finite matrix norm.
<1>2. In particular `U(delta)=1-delta H+O(delta^2)` gives
`[U(delta),V]=-delta[H,V]+O(delta^2)` for a fixed V.
If both transfers start at 1, the entire first-order coefficient is zero;
the leading possible term is `delta^2[T_t1,T_x1]`.
<1>3. Two reorderings of the same regular gates have the same first
derivative `sum h_j=-H`, so even this quadratic term vanishes.
For opposite exponential sweeps, set `A=sum_odd h_j`, `B=sum_even h_j`.
Their quadratic coefficients are `(A+B)^2/2 +/- [A,B]/2`.
Expansion therefore gives

    [exp(delta A)exp(delta B),exp(delta B)exp(delta A)]
      = -delta^3 [A+B,[A,B]] + O(delta^4).                     (12)

BY the coefficients just displayed; `check_seams.py` verifies the sign
and order with exact noncommuting matrices. QED.

Commutation is consequently not a criterion for Euclidean rotation
covariance. Even scalar anisotropic tiles have commuting transfers, while
their one-step horizontal and vertical amplitudes may differ. Conversely
the same partition tensor can be contracted in two directions with
different carrier dimensions, making a commutator undefined. Rotation
covariance asks for equality after transporting geometry, fields and
boundaries; CA-78 Lemma 78.4 concerns metric response and does not identify
that condition with (11).

## 7. Verification and research record

The category-specific computations are confined to `checks/` and the
Examples table. They construct their finite representations, oriented
cups and fusion intertwiners explicitly from the generic category
definitions in [P]. They do not import unsourced F tables. In particular
the multiplicity test checks a full complex 7-by-7 recoupling block by
reconstructing each tree and checking F-transformed placements of all four
matrix units in a
two-dimensional fusion-multiplicity block. Positivity is verified by
exact Gram factorizations and exact blocks, not numerical eigenvalue signs.

Commands, from the repository root:

```bash
PYTHONDONTWRITEBYTECODE=1 python3 explorations/2026-10-22-astra-r2/E3-reflection-positivity/checks/check_seams.py
PYTHONDONTWRITEBYTECODE=1 python3 explorations/2026-10-22-astra-r2/E3-reflection-positivity/checks/check_categories.py
```

The first run intentionally failed before implementing the kernel
(`checks/red_output.txt`). Restored passing outputs are
`checks/seams_output.txt` and `checks/categories_output.txt`.
Mutations `--mutate-reshuffle` on the first script and `--mutate-f` on the
second must fail; their retained outputs record the detecting assertions.
The second mutation preserves unitarity and is caught by tree
reconstruction, demonstrating why unitarity alone is an inadequate F test.
`checks/run_checks.py` runs both scripts and mutations and writes
`checks/provenance.json` with producer/source hashes and software versions.
The largest explicit operator matrix is 81-by-81; no asymptotic numerical
claim is inferred. Theorems (4)–(12) are proved algebraically above;
finite checks calibrate signs, typing and multiplicities, not their
universal quantifiers.

Context: E3 was intended to close CA-75 Link (a2). The main friction was
that the proposed mirror and perpendicular commutator were not typed for
general C. A universal PSD test directly on generator coefficients also
lost the identity tile. The retained repair keeps the precise reflection
input visible and proves a finite linear-pencil criterion. A skeptical
GPT-6.1 collaborator independently checked the rotation typing, OS quotient,
train residual, and first-order commutator. No existing CA-78/80 result is
promoted into a stronger reconstruction theorem.
The final audit corrected the auxiliary-support/linearity hypotheses of
the trace closure, made the anti-linear reflection involution explicit,
and distinguished the check's right-to-left F matrix from the canonical
left-to-right placement matrix. The strengthened check now exercises the
F placement itself; it does not merely test F unitarity. All requested
outputs and mutation failures are retained inside this directory.

## Results ledger

- E3(a), as stated — **negative:** contradictory dagger necessity, omitted identity/step dependence, and missing oriented reflection data.
- E3-N — **proven:** explicit spatial-RP counterexamples and identity-offset obstruction in every C using unit multiplicities.
- E3-S, equations (1)–(3) — **conditional:** proved exact F/pivotal compiler and blockwise iff once the typed reflection pairing and accessible insertions are specified.
- Multi-tile seam positivity — **conditional:** proved under compatible tensor pairings and reflected factorization; necessity needs single-tile full-span tests.
- E3-L, equations (4)–(6) — **proven:** sharp small-positive-step criterion for the linear history under E3-S's data.
- E3-OS, equation (7) — **conditional:** proved finite positive-contraction reconstruction; injectivity needed for a Hamiltonian on the entire quotient.
- E3(b), as stated — **negative:** rotation is not F+dagger or similarity; RP alone supplies neither full OS axioms nor positive physical momentum.
- E3-Y, equations (8)–(9) — **conditional:** proved commutation of a properly closed train family on one carrier; general perpendicular identification is unproved.
- E3-D and E3-T, equations (10)–(12) — **proven:** residual and Taylor identities under their explicitly stated finite typing hypotheses.
- E3(c), as stated — **negative:** perpendicular commutator can be undefined; integrable brick sweeps need not commute; non-YBE families can commute.
- Category checks — **proven:** exact listed finite identities, negative grading obstruction and mutation rejection; no R1–R5 consequence.

## Layer tags

| Statement | Setting | Input layer | Rung reached |
|---|---|---|---|
| Algebraic rotation and counterexamples | Both | L0 fusion with dagger and canonical spherical duality; the witness pairing is explicit | R0 finite prerequisite |
| Spatial RP and linear-pencil criterion | Both | L0 plus chosen site, coefficients, boundary probes and coherent reflection pairing; L3 when that enrichment is counted | R0; Euclidean positivity prerequisite for R3 |
| Finite OS reconstruction | Both | L3: translated forms, normalization, null descent, injectivity if a full-space logarithm is wanted | R0 finite reconstruction only |
| Closed YBE family / residual | Both | L0 plus spectral gates and explicit auxiliary/face closure, hence L3 | R0; no conformal or faithful limit |
| Perpendicular identification / continuum OS / fidelity | Target not yet selected | Additional geometric/analytic data; L4 if a particular theory is named | Not reached: R1, R2, R3, R4, R5 |

## What this gives the integration

CA-75 Link (a2) gains a finite spatial-seam operator (1) and an exact test
(2), including non-self-dual and multiplicity data, plus the sharp generator
test (4) for its linear history. It extends CA-80's leg-cut result only
after the necessary reflection pairing has been supplied. LC-4 gains a
precise finite reconstruction contract (7), rather than an assertion that
two-axis RP supplies the whole OS theorem. CA-78's diagonal/brick erratum
is preserved; (10) gives an exact obstruction after the correct closure.

## Open problems

1. **Reflection-existence lemma:** characterize the site/boundary data for
   which an involutive, dagger-compatible spatial reflection of the whole
   oriented brick grammar exists, with compatible s on every seam. The
   equality of the two boundary multiplicity lists is necessary, not a
   proof of full coherence. Alternatively construct and check a doubled
   oriented grammar and its relation to the original chain.
2. **Exact-gate lemma:** characterize h with `K_s(exp(t h))>=0` for every
   t in a prescribed interval, including all higher-order null-space
   effects. The complete pointwise matrix test is proved; (4) does not
   solve this semigroup-preservation problem.
3. **Strip-translation lemma:** derive (7), shift closure, a nonzero vacuum
   and any required injectivity from the same two-axis history functional
   and boundary schedule. State exactly which site/bond reflection cuts
   are available. No generic proof is claimed here.
4. **Crossing-and-closure lemma:** identify a perpendicular transfer with
   a member of the same correctly closed diagonal family, with explicit
   oriented boundary isometries and spectral-parameter transformation.
   Local YBE and F alone do not prove it.
5. **Continuum lemma:** prove compatible limits of all reflected Gram
   matrices, semigroups, local observables and Euclidean-covariance
   identities, with quantitative bounds. LC-4:140–160 explains the
   additional domain, locality and fidelity work. No missing lattice OS
   theorem is silently imported; a stronger general theorem would need
   a locally registered source or a new proof.

## Examples table

| Instance (calibration only) | Explicit check / result | Scope |
|---|---|---|
| Every C, `O=1+1` | `h=-Z tensor Z`: temporal-positive gate with negative spatial vector; `h=E_01 tensor E_10`: spatial-positive exact gate without self-adjoint h | Universal-claim falsifiers E3-N, exact output in `checks/seams_output.txt` |
| Unitary `Vec_(Z/3)`, trivial associator, `O=1+g`, `bar g=g^2!=g` | `T=1+Swap/2`, s the graded mixed-port flip; F=1, raw cups norm squared 2. K blocks are `[[3/2,1],[1,3/2]]`, `[1/2]`, `[1/2]` | Non-self-dual category and non-self-dual site; exact charge-preserving kernel check |
| `Rep^dagger(A4)`, real irreducible V of dimension 3 | The order-12 tetrahedral matrix group, its characters and intertwiners are derived in `check_categories.py`; `N_VV^V=2`. The printed complex unitary 7-by-7 `F_RtoL` converts right to left coordinates; the canonical left-to-right `F_path` is its adjoint. For `T=1+Swap/2`, K blocks are `[7/2]`, `[1/2]`, `[1/2]`, `(1/2)I_2` | Genuine simple fusion multiplicity, not merely repeated copies of the site. All four multiplicity matrix units, F placements and oriented cup contraction checked |
| Unitary `Vec_S3`, trivial associator, `O=1+(12)+(123)` | `O barO=3·1+2(12)+(123)+(132)+2(13)`, while `barO O=3·1+2(12)+(123)+(132)+2(23)` | No categorical s exists for these mixed ports. Explicit permutation multiplication in the retained script; no no-go for alternative reflected/doubled constructions |

## Sources used

All anchors are local. Particular category matrices in the table are new
finite constructions verified in the scripts, not recalled F-symbol data.

- **[P]** `references/text/PenneysUnitaryFusionCategories.md:277–294,319–323`: graded and unitary representation category constructions; `:398–430`: coherence, oriented duality and Frobenius reciprocity; `:530–568`: vertex normalization and multiplicity-bearing F matrices; `:682–708,917`: anti-monoidal dual and nonautomatic self-duality; `:992–1030`: unitary pivotal structure, positive traces and raw duality normalization. Registration: `references/manifest/SOURCES.md:35,69–71`, `references/category-theory/SOURCES.md:112–139`.
- **[KS]** `references/lattice-symmetry/KooSaleur1993/source/9312156.tex:598–603,716–738`: brick row, noncommutation, sequential diagonal transfer and its logarithmic expansion. Registration: `references/lattice-symmetry/SOURCES.md:9–50`.
- **[Y]** `literature/md/1408.1282/1408.1282.md:149–170`: spectral face YBE and correctly closed commuting transfer, used as precedent, not a general-C closure theorem.
- **[SC]** `references/cft/Schottenloher2008/Schottenloher2008.md:4113–4117,4150–4172,4616–4642`: self-adjoint momentum versus positive energy; covariance, locality and RP as separate axioms. Registration: `references/cft/SOURCES.md:9–24`.
- `CONVENTIONS.md:62–87,631–694,1397–1448,1483–1500`: gauge, site/duality, tile and exact-coefficient conventions.
- `report/sections/80_lattice_sewing_and_fidelity_certificate.tex:50–115,137–140`: exact tiles, cut spaces, leg-cut sewing, temporal RP, reflected row and stated spatial gap.
- `report/sections/78_categorical_selection_equations.tex:44–68,90–108,147–174`: coefficient compiler, exact gate ODE, metric response, YBE and transfer erratum.
- `report/sections/86_spacetime_trotter_dictionary.tex:61–93`; `report/sections/75_integration_map.tex:115–138`: first-order history and Link (a2).
- `explorations/2026-10-22-astra/D5-fidelity-lattice-sewing/NOTE.md:71–100,138–285`, `REVIEW.md:130–142`, `INTEGRATION.md:153–160`: reflection conventions, previous finite results and unresolved spatial seam.
- `explorations/2026-10-22-astra/D2-selection-principle/NOTE.md:52–89,249–397`, `REVIEW.md:119–142`, `INTEGRATION.md:28–36`: oriented ports, YBE limitations and corrected transfer reading.
- `reconstruction/04_cutoff_oar.md:16–31,140–160`: semigroup/reflection requirements and analytic boundary of reconstruction.
