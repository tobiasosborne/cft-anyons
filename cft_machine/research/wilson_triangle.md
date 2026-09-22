# WT-1 — A quantitative Wilson-triangle construction

**Status:** local conditional derivation, skeptically reviewed. This
constructs states with a computable error bound when the displayed drift
bounds are supplied. It does not synthesize the bounds from category data.

Sources and dependencies:

- `literature/md/2010.11121/2010.11121.md:126–180`, equations (2.8)–(2.12)
  and the following inductive-limit/GNS construction.
- `references/text/CFTFromLatticeFermions.txt:221–247` distinguishes
  finite-energy convergence of modes from construction of the state.
- CONVENTIONS (u), (x); this proof uses unital observable refinements.
  A vacuum-insertion corner map cannot replace them without a new argument.

## Theorem WT-1: constructive horizontal limits

**ASSUME**

A1. `A_k` is a unital C*-algebra for every integer `k>=0`, with coherent
unital injective *-maps `alpha_n^k` for `n>=k`. Write `A_infty` for their
norm inductive limit and `i_k:A_k->A_infty` for the canonical maps.

A2. For every `n`, `omega_n` is a state on `A_n`. It may be a chosen
ground state of a named microscopic Hamiltonian, but the proof does not
assume that every possible choice has the following convergence property.

A3. For each fixed `k`, nonnegative numbers `d_{k,n}`, `n>=k`, satisfy

`||omega_(n+1) o alpha_(n+1)^k - omega_n o alpha_n^k|| <= d_{k,n}`

and `sum_(n>=k) d_{k,n}<infty`. All norms here are dual operator norms.
Let `t_k(n)=sum_(j>=n)d_{k,j}`.

**PROVE** There is a unique state `omega` on `A_infty` whose restriction
`omega_k=omega o i_k` is the horizontal limit of row `k`, with

`||omega_k-omega_n o alpha_n^k|| <= t_k(n)`.

Its compatible GNS system is the OAR representation of this chosen sequence.
This theorem makes no assertion about convergence of dynamics or locality
of a continuum spacetime net.

**PROOF**

`<1>1.` For every `k` and `m>n>=k`, the row difference is bounded by
`sum_(j=n)^(m-1)d_{k,j}`.

`<2>1.` Expand `omega_(k,m)-omega_(k,n)` as the telescoping sum of adjacent
row differences. BY definition `omega_(k,n)=omega_n o alpha_n^k`.

`<2>2.` Bound each summand by A3 and apply the triangle inequality.

`<2>3.` QED BY `<2>1`, `<2>2`.

`<1>2.` Every row has a norm limit `omega_k`, which is a state, and the
claimed tail bound holds.

`<2>1.` The rows are Cauchy BY `<1>1` and summability. The dual of a normed
space is complete, so each row has a continuous-functional norm limit.

`<2>2.` `omega_(k,n)` is positive and takes `1` to `1` BY A1, A2. Passing
these equalities/inequalities to the limit gives the same for `omega_k`.
Thus it is a state; in particular its norm is one.

`<2>3.` Let `m` tend to infinity in `<1>1` to obtain the tail bound.

`<2>4.` QED BY `<2>1`–`<2>3`.

`<1>3.` For `k<=l`, `omega_l o alpha_l^k = omega_k`.

`<2>1.` For every `n>=l`, `omega_(l,n) o alpha_l^k = omega_(k,n)`
BY coherence in A1.

`<2>2.` Pullback by `alpha_l^k` is norm continuous, so passage to the
row limits proves the equation. BY `<1>2`, `<2>1`.

`<2>3.` QED BY `<2>2`.

`<1>4.` The formula `omega(i_k(a))=omega_k(a)` extends uniquely to a
state on `A_infty`.

`<2>1.` Coherence `<1>3` makes the formula independent of the local
representative. It is bounded by `||a||` and unital BY `<1>2`.

`<2>2.` On the algebraic union, positivity follows by writing any element
in one common finite stage and applying positivity of `omega_k`.

`<2>3.` Extend continuously to the norm closure. For any `b` in that
closure choose local `b_j->b`; positivity on `b_j^*b_j` gives positivity
on `b^*b`. Density also gives uniqueness.

`<2>4.` QED BY `<2>1`–`<2>3`.

`<1>5.` The GNS maps are compatible isometries preserving cyclic vectors.

`<2>1.` Define `[a]_k -> [alpha_l^k(a)]_l`. The squared norm of the image
is `omega_l(alpha_l^k(a^*a))=omega_k(a^*a)` BY `<1>3` and A1. Thus the
map descends through null vectors and extends to an isometry.

`<2>2.` Multiplicativity gives representation intertwining; unitality
gives preservation of cyclic vectors; coherence gives composition.

`<2>3.` QED BY `<2>1`, `<2>2`. These are exactly the sourced compatible
GNS maps following equation (2.12).

`<1>6.` QED BY `<1>2`–`<1>5`.

## WT-2: an effective finite-observable algorithm

**ASSUME** WT-1 and computable finite-scale expectations, refinement maps,
a computable tail bound tending to zero for the selected row, and a
computable finite upper bound `B>=||a||` for the supplied observable.

**PROVE** For a finite observable `a in A_k` and requested error `eta>0`,
its limit expectation can be evaluated to that error.

`<1>1.` Choose `n` so `t_k(n)B<eta/2`. BY the tail modulus and norm bound.

`<1>2.` Evaluate `omega_n(alpha_n^k(a))` within `eta/2`, including errors
from representing `a` and the map. BY the computability assumption.

`<1>3.` Total error is below `eta`. BY WT-1 and the triangle inequality.

`<1>4.` QED BY `<1>1`–`<1>3`.

This is a partial algorithm with explicit analytic input. Giving it a guessed
tail bound would invalidate its guarantee. Existence of an OAR subsequential
limit alone does not supply the computable modulus assumed here.

## WT-3: finite Gram matrices and the null-space boundary

For fixed `a_1,...,a_p in A_k`, let `G_n[i,j]=omega_(k,n)(a_i^*a_j)`
and `G[i,j]=omega_k(a_i^*a_j)`.

**PROVE** `||G_n-G|| <= t_k(n) sum_i ||a_i||^2`.

`<1>1.` The matrices are Hermitian BY positivity of the states.

`<1>2.` For a coefficient vector `z`, put `b=sum_i z_i a_i`. Then
`|z^*(G_n-G)z| <= t_k(n)||b||^2` BY WT-1.

`<1>3.` `||b|| <= ||z||_2 (sum_i||a_i||^2)^(1/2)` BY triangle and
Cauchy–Schwarz inequalities.

`<1>4.` Take the supremum over unit `z`. QED BY `<1>1`–`<1>3`.

**Boundary:** Gram convergence alone does not identify kernels or sector
multiplicities. For example, the positive matrices `diag(1,1/n)` converge
in norm to `diag(1,0)` while their kernel dimensions change in the limit.
Nor does a bound only on `omega(R^*R)` show `pi_omega(R)=0` as an operator:
one needs nullness on the relevant dense family of probe vectors. See VR-2
in `virasoro_routes.md` for an explicit counterexample.

## How this enters the machine

The Wilson-state constructor consumes actual scale-dependent microscopic
states and uniform row-drift bounds. The generator constructor VR-1 consumes
compatible representation data plus graph-norm bounds and mode defects.
These interfaces fit only after the same limiting state is used in both.
The finite examples in `benchmarks/fermion/` test the sourced free-fermion
specialization; a general categorical constructor still has to synthesize
the state, refinement, and generator bounds jointly.

Full projective-unitary integration, positive energy, local-net axioms,
rationality, and modular fidelity are further proof obligations. None is
deduced solely from WT-1 or the finite Gram estimate.

Review: `cft_machine/reviews/fermion_referee.md`; WT-2 now explicitly
requires a computable norm upper bound, as requested by the referee.
