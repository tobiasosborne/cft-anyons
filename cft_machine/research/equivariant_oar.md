# EQ-1 — Finite symmetry reduction through the OAR state construction

**Status:** local conditional derivation. This extends the strict fixed-point
algebra lemma to compatible states and their represented weak closures.
Spatial localization remains an explicit hypothesis in the local version.

Sources/dependencies:

- `realisation_and_fidelity.md`, fixed-point Lemma 2 (strict C*-limit).
- `wilson_triangle.md`, WT-1 (horizontal states and compatible GNS).
- `references/qft/FewsterRejzner2019/source/AQFTIMPRS-Oct2019.tex:1255–1268`
  defines local represented double commutants and identifies their weak closure.
- CONVENTIONS (v), (x), (z); the NS/factorwise-parity specialization is
  specified separately by the compiler, not inferred for arbitrary groups.

## Theorem EQ-1: invariant rows, states and GNS

**ASSUME** WT-1. A fixed finite group G acts by *-automorphisms beta_(k,g)
on A_k; every refinement intertwines these actions; every microscopic
omega_n is invariant. Put B_k=A_k^G. Let A,omega be the limit from WT-1,
and B=A^G the strict fixed-point limit from Lemma 2.

**PROVE** Restriction gives the same Wilson-state construction on B_k,
with no larger row-drift bounds. Its GNS representation is unitarily
equivalent to the restriction of the full representation to the G-invariant
vectors. This says nothing about the category of orbifold sectors by itself.

**PROOF**

`<1>1.` Every row functional is invariant.

`<2>1.` For a in A_k, equivariance gives
`omega_n(alpha_n^k(beta_(k,g)(a)))=omega_n(beta_(n,g)(alpha_n^k(a)))`.

`<2>2.` The last expression equals `omega_n(alpha_n^k(a))` by invariance.
QED BY `<2>1` and the microscopic-state assumption.

`<1>2.` The limiting omega_k and omega are invariant; their restrictions
to B_k,B are the horizontal limits on the fixed-point tower.

`<2>1.` Pass `<1>1` to the norm limits. Restriction has norm at most one,
so each restricted row-drift bound is at most d_(k,n).

`<2>2.` Apply WT-1 and the strict fixed-point algebra lemma. Uniqueness
of the extension from the dense fixed-point union identifies the two states.
QED BY `<2>1`, WT-1, and fixed-point Lemma 2.

`<1>3.` In the full GNS representation, `U_g[a]=[beta_g(a)]` extends to
a unitary representation with `U_g Omega=Omega` and
`U_g pi(a) U_g^*=pi(beta_g(a))`.

`<2>1.` Invariance gives `omega(beta_g(a)^*beta_g(a))=omega(a^*a)`.
Thus the formula is well-defined and isometric on the GNS quotient.

`<2>2.` The inverse is U_(g^-1); composition follows from the group
action. Covariance follows by multiplication on the dense cyclic domain.
QED BY `<2>1`, `<2>2`.

`<1>4.` The orthogonal projection onto invariant vectors is
`P_G=|G|^-1 sum_g U_g`, and `P_G pi(a)Omega=pi(E(a))Omega`,
where `E(a)=|G|^-1 sum_g beta_g(a)`.

`<2>1.` Inversion permutes G, so P_G is self-adjoint. Counting products
in the finite group gives P_G^2=P_G. Its image is fixed by every U_g,
and every fixed vector is unchanged by P_G.

`<2>2.` The cyclic-vector identity follows from `<1>3` and linearity.
QED BY `<2>1`, `<2>2`.

`<1>5.` `closure(pi(B)Omega)=H^G`.

`<2>1.` Each pi(b)Omega, b in B, is fixed by `<1>3`.

`<2>2.` Conversely, pi(A)Omega is dense in H. Apply P_G and use `<1>4`:
each averaged cyclic vector comes from an element E(a) in B.
QED BY `<2>1`, `<2>2`.

`<1>6.` The map `[b]_(omega|B) -> pi(b)Omega` is an isometry with dense
range H^G and intertwines B. QED for EQ-1 BY `<1>2`, `<1>5`, and the
GNS norm identity `||pi(b)Omega||^2=omega(b^*b)`.

## Theorem EQ-2: represented weak closures

**ASSUME** EQ-1. Put M=pi(A)'' in B(H) and let G act on M by Ad U_g.

**PROVE** `pi(B)''=M^G`, as algebras on the full H.

**PROOF**

`<1>1.` `pi(B)` is contained in M^G. The latter is weakly closed:
each equation `U_g X U_g^*=X` is weak-operator closed because its matrix
elements are continuous. Thus `pi(B)''` is contained in M^G.

`<1>2.` For X in M^G choose a net pi(a_i) converging to X in the weak
operator topology. BY the sourced double-commutant/weak-closure statement.

`<1>3.` The finite average `pi(E(a_i))=|G|^-1 sum_g U_g pi(a_i) U_g^*`
converges weakly to X, and each term lies in pi(B).

`<1>4.` Thus X belongs to pi(B)''. QED BY `<1>1`–`<1>3`.

**Representation boundary:** EQ-2 is an identity on the full H, whereas
the vacuum representation of B in EQ-1 lives on H^G. These are distinct
representation statements and must not be conflated when identifying a net.

## Local consequence and the Ising specialization

If named local subalgebras A(I) are preserved by G, the EQ-2 argument applies
to each pi(A(I))'' on the full Hilbert space. A local continuum identification
must separately identify A(I); neither group averaging nor the global GNS
construction manufactures spatial support for a sharp momentum refinement.

For the compiler's real-fermion branch, the proposed local reconstruction
uses smooth supported field samples and their limiting even products. Its
proof must identify this interval net before importing the sourced equality
of the real-fermion even subnet with Vir_(1/2). The universal global circle
algebra is not identified with a plain even CAR algebra by this argument.

For k independent factors, G is `(Z_2)^k`. Averaging only total parity
would retain products of one odd field from each of two factors; independent
averaging removes them. This is why the product-net fidelity construction
keeps factorwise parity and all individual stress families.

## What remains for a general orbifold compiler

EQ-1 and EQ-2 transport a chosen invariant state and a specified represented
algebra. They do not construct twisted sectors, prove complete rationality,
or identify the modular data of an arbitrary orbifold. Those conclusions
require the relevant local-net and sector theorems. Local extensions and
approximate equivariance also require new arguments.
