# Exact-F signed divergent contacts: graph approximation on N<=2

Collaborator derivation, 2026-10-25. Setting: general unitary fusion category,
open interval, declared data and the **exact** Galerkin family (F) of F5 NOTE.
This is a nonrelativistic resolvent result. No whole-Fock reacting extension
or assertion about an arbitrary diagonal density is included.

Local dependencies: F5 NOTE A1 for the exact cross terms and remnant
potentials W0,W1,W2; `checks/analytic_lemma.md` §§B-C for the Dirichlet operator
and flux D=partial_x-partial_y; F5 NOTE N1 steps 5-7 for cosine completeness
and the Dirichlet-collision/Neumann-outer Laplacian. This supplement is a
direct finite-difference derivation, without an imported analytic theorem.

## Statement and core

Let alpha_eps be real and |alpha_eps|->infinity, with arbitrary signs and no
rate restriction. The exact family on N<=2 converges in projected nonreal
resolvents to the occupation-diagonal operator

```
(H_D^W u)0=W0 u0,
(H_D^W u)1=-t u1''+W1 u1,
(H_D^W u)2=-t Delta u2+W2 u2,
Tu2=0, with Neumann outer faces.
```

All fusion fibres are carried along unchanged; the constant Hermitian fibre
matrices Wn include the Q_b and gamma remnants. In particular, the limiting
cross reactions vanish even when beta and nu are nonzero.

ASSUME this exact family and |alpha_eps|->infinity. PROVE the statement.

`<1>1.` A core for H_D^W can be chosen as follows: u0 is arbitrary, u1 is a
finite sum of cosine modes, and u2 is a finite sum of cosine determinants
times smooth radial cutoffs vanishing near (0,0) and (1,1). The cutoffs are
symmetric under coordinate exchange. All components have arbitrary allowed
fusion-fibre coefficients. Every chosen u2 extends smoothly across x=y,
antisymmetrically, and obeys outer Neumann conditions.

`<2>1.` Without cutoffs, the cosine determinants form an operator core by
their complete eigenbasis and square-summability domain; finite coefficient
truncation converges in graph norm. A constant matrix W2 preserves that
core, since it is bounded and acts on the fibre only.
`<2>2.` At either collision endpoint a cosine determinant is O(rho^2),
and its gradient is O(rho), where rho is distance to the endpoint. Its
constant term cancels, and each cosine has no linear term at an endpoint.
`<2>3.` Choose a radial cutoff theta(rho/delta), zero for rho<=delta and
one for rho>=2delta. It preserves antisymmetry. On the relevant outer
wall its normal derivative vanishes because the normal derivative of rho
vanishes there. Thus outer Neumann conditions are preserved.
`<2>4.` The commutator with the Laplacian contains Delta(theta)u and
2 grad(theta).grad(u). Each is O(1) on an annulus of area O(delta^2), so
its L2 norm is O(delta). The other graph-norm errors also tend to zero.
Letting delta->0 proves the asserted cutoff core. No cutoff is needed at
the third triangle corner (0,1), where the two Neumann walls meet.

## Construction of lattice approximants

Fix one such core vector. Put s=(x+y)/2, r=y-x, and

```
g(s)=partial_r u2(s,0),
S(s)=B_beta u1(s)+V_nu u0,
Sbar(x,y)=B_beta [u1(x)+u1(y)]/2+V_nu u0.
```

Here the fibre maps are those of F5 A1. Since the collision flux is
D=-2 partial_r, the intended small trace is (2t g+S)/alpha_eps.

`<1>2.` The function g is smooth with compact support in (0,1). Choose
an even smooth chi(r), equal to one for |r| sufficiently small, so that
`G(x,y)=g((x+y)/2)chi(y-x)` is supported away from the outer faces x=0
and y=1. This is possible by choosing the r-support narrower than the
support margin of g. Sbar is symmetric under coordinate exchange, has
trace S, and satisfies outer Neumann conditions.

`<1>3.` Set, for off-diagonal grid configurations,

```
F_eps(x,y)=u2(x,y)+(2t/alpha_eps-eps)G(x,y)+Sbar(x,y)/alpha_eps.
```

Sample this function at the centres x_j=(j-1/2)eps on all gap>=2 pairs.
On adjacent pairs overwrite the sample **exactly** by

`a_j=(2t g(j eps)+S(j eps))/alpha_eps`, j=1,...,L-1.

The normalised lattice amplitudes are eps times these two-particle values,
sqrt(eps)u1(x_j) in occupation one, and u0 in occupation zero.

`<1>4.` On adjacent pair j the midpoint is s=j eps and r=eps. Oddness
of u2 in r, constancy of chi near zero, and symmetry of Sbar give

```
u2(s,eps)=eps g(s)+O(eps^3),
G(s,eps)=g(s),
Sbar(s,eps)=S(s)+O(eps^2),
F_eps(s,eps)-a_j=O(eps^3+eps^2/|alpha_eps|).
```

All constants, including a fixed finite number of derivatives, depend on
the fixed core vector and its cutoff, and are uniform in eps once
|alpha_eps|>=1. It follows directly by sampling that K_eps v_eps->u.

## The operator residual

All pointwise residuals below use **rescaled** function amplitudes, so that
their squared two-particle L2 weight is eps^2 per pair.

`<1>5.` On gap>=2 configurations, the hopping row is the usual centred
finite-difference Laplacian, with its Neumann endpoint row when a particle
lies at an outer endpoint cell. Before overwrite, F_eps satisfies outer
Neumann conditions and differs from u2 in each fixed C^k norm by
O(eps+1/|alpha_eps|). Taylor expansion therefore gives the target kinetic
action with pointwise error O(eps+1/|alpha_eps|). An overwritten neighbour
changes the row by O(eps^{-2}) times the error in `<1>4`, namely
O(eps+1/|alpha_eps|). There are at most two such neighbours per row.

`<1>6.` At an interior adjacent pair, s=j eps, its two legal neighbours
have (s,r)=(s-eps/2,2eps) and (s+eps/2,2eps). Taylor expansion gives

```
F_eps(s-eps/2,2eps)+F_eps(s+eps/2,2eps)
 =4eps g(s)+2(2t/alpha_eps-eps)g(s)+2S(s)/alpha_eps
   +O(eps^3+eps^2/|alpha_eps|).
```

Consequently the adjacent graph row is

`t eps^{-2}[2a_j-F_left-F_right]
 =-2t g(s)/eps+O(eps+1/|alpha_eps|).`

The total contact row and exact reaction source row are

```
(alpha_eps/eps)a_j=(2t g(s)+S(s))/eps,
-S_eps,j/eps,  S_eps,j=B_beta u1(x_j)+V_nu u0.
```

Since x_j=s-eps/2, S(s)-S_eps,j=O(eps). The singular terms thus cancel,
leaving a bounded O(1+1/|alpha_eps|) residual on the entire adjacent strip.
That strip has total box volume O(eps), so its L2 residual is O(sqrt(eps)).
No bound on |alpha_eps|eps or its inverse was used: this is the reason
for the exact overwrite rather than an approximate boundary correction.

`<1>7.` At j=1 or L-1 there is only one legal graph neighbour. For small
eps, g and u2 vanish on that entire corner neighbourhood. Thus only
Sbar/alpha_eps remains in F_eps. At j=1,

`S(eps)-Sbar(eps/2,5eps/2)=O(eps^2)`

by u1'(0)=0; the right endpoint is identical using u1'(1)=0. The graph
row is O(1/|alpha_eps|), while [S(j eps)-S_eps,j]/eps=O(eps).
This controls the two exceptional rows with their actual degree one.

`<1>8.` The exact two-particle lower-source potential differs from W2 only
on the adjacent or right-endpoint strips, plus a uniformly O(eps) pair-count
error. The functions F_eps and a_j are uniformly bounded. Thus this
potential residual is O(sqrt(eps)) in L2. This step retains the source
squares from deleted occupations three and four; deleting those squares
would instead produce different Wn.

`<1>9.` In occupation one the b feedback, after division by sqrt(eps), is
exactly -B_beta^*a_j at site j<L, and zero at the last site. It is
O(1/|alpha_eps|) in L2. The vacuum pair feedback is exactly
`-eps sum_{j<L} V_nu^*a_j`, also O(1/|alpha_eps|).
The one-particle kinetic samples have the Neumann cosine limit. Their
Q_b potential defect occupies only the last cell and is O(sqrt(eps));
the pair-count error in each lower sector is O(eps).

`<1>10.` Combine `<1>4-9`, including the ordinary sampling error for the
smooth target H_D^W u and the omitted same-cell triangle strips. For a
constant C_u depending on the fixed core vector but not on eps or alpha,

`||K_eps v_eps-u||+||K_eps H_eps v_eps-H_D^W u||
 <= C_u(sqrt(eps)+1/|alpha_eps|) ->0.`

## Resolvents and classification

`<1>11.` If f=(H_D^W-i)u with u in the chosen core, put
f_eps=(H_eps-i)v_eps. Then K_eps f_eps->f and

```
||K_eps(H_eps-i)^{-1}K_eps^*f-u||
 <= ||K_eps^*f-f_eps||+||K_eps v_eps-u||
 <= ||f-K_eps f_eps||+||K_eps v_eps-u|| ->0.
```

The second inequality uses K_eps^*K_eps=I. Such f are dense because the
chosen vectors form an operator core of the self-adjoint H_D^W. The uniform
self-adjoint nonreal resolvent bound one extends convergence to every input.
This proves the theorem without a common lower bound. QED.

Combined with the finite-alpha result, this gives an unrestricted exact-F
N<=2 classification for nonzero X: a projected nonreal resolvent limit
exists iff alpha_eps converges to a finite real alpha **or**
|alpha_eps|->infinity. This is convergence in the one-point compactification
of R, with both signs of infinity identified. Every subsequence has such
a clusterpoint; finite parameters give distinct Robin forms and the
infinite point has the distinct Dirichlet form domain. Distinct self-adjoint
operators have distinct nonreal resolvents. The zero-X contact-free case
is excluded from this necessity statement.
