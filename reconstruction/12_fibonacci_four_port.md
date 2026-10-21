# LC-12 — Fibonacci four-port equations and a conditional carrier test

**Status:** exact descendant coefficients and necessary functional equations.
No Fibonacci four-port solution or crossing exclusion is claimed. The selected
lift is c=14/5, h_x=2/5; all carrier multiplicities remain unknown.
Conventions: (ah),(ai). This continues LC-8 and the general four-port system.

**Sources and dependencies.**

- `references/category-theory/RowellStongWang2009Classification/source/RSWfinal3.tex:2379–2409`:
  positive Fibonacci fusion, twists, modular S and unitary F.
- `references/cft/Schottenloher2008/Schottenloher2008.md:2790–2818,2985–3000,5092–5105`:
  PBW highest-weight words, c>1,h>0 positivity, primary Ward relation.
- `references/categorical-reconstruction/FuchsRunkelSchweigert2002/source/hep.tex:5786–5815`:
  categorical monodromy data do not specify functional blocks or their values
  on inserted states.
- `references/categorical-reconstruction/BrehmRunkel2024/source/main.tex:1013–1019`:
  its simple OPE/F relation assumes a particular monic block normalization.
- `references/categorical-reconstruction/BrehmRunkel2022/source/main1.tex:528–530`:
  modular S as a character transformation in its supplied rational CFT setting.
  Section 5 below explicitly assumes such character covariance.

## 1. Conditional scalar exchange blocks

**ASSUME:** four scalar primary states of weight h=2/5 at infinity,1,z,0;
an intermediate highest-weight module of weight H; normalized leading
three-point amplitude one; and the initial branch 0<z<1. Use the vacuum
quotient L_-1 Omega=0 when H=0. These hypotheses describe one component,
not the complete categorical carrier. Write

    X(z)|h> = z^(H-2h) sum_(n>=0) z^n v_n,  v_0=|H>.

**PROVE LC-FW:** for m>0,

    L_m v_n = [H+n-m+(m-1)h] v_(n-m).                    (1)

<1>1. Commute L_m past X using the sourced primary Ward equation; L_m
annihilates the highest input ket.
<1>2. At grade n, differentiating contributes H+n-m-2h, and the weight
term contributes (m+1)h. Their sum gives (1).
<1>3. QED by <1>1–2 and equality of formal coefficients.

For a decreasing PBW partition I=(i_1,...,i_k) of n, put r_0=n and
r_j=r_(j-1)-i_j. Let G_H,n be the grade-n Gram matrix on the positive
quotient. Repeated use of (1) gives

    rho_H,n(I)=product_j [H+r_j+(i_j-1)h],
    coordinate(v_n)=G_H,n^(-1) rho_H,n,
    b_H,n=rho_H,n^T G_H,n^(-1) rho_H,n.                  (2)

For the reflected configuration, the left covector is the conjugate of
the right one, so the transpose becomes the Hermitian adjoint. Here all
entries are real. The monic scalar block is

    V_H(z)=z^(H-4/5) sum_(n>=0) b_H,n z^n.

Exact inverse-Gram calculations through grade four yield

| Internal module | b0 | b1 | b2 | b3 | b4 |
|---|---:|---:|---:|---:|---:|
| H=0, vacuum quotient | 1 | 0 | 4/35 | 4/35 | 19/175 |
| H=2/5, Verma | 1 | 1/5 | 11/50 | 26/125 | 34067/173750 |

For example, the charged v2 coordinates are (1/3,-1/12) in the basis
(L_-2|H>,L_-1^2|H>). Negative PBW coordinates do not imply negative norm:
the Gram metric must be retained. The vacuum vectors reproduce LC-8.
These coefficients solve local Ward equations; they do not evaluate a
four-point connection matrix.

The reproducible producer is `scripts/python/run_four_port_consistency.py`,
with inverse-Gram routines in `scripts/python/four_port_sewing.py` and
invariants in `scripts/python/test_four_port_consistency.py`. Its exact
outputs and producer/source hashes belong to
`runs/2026-10-21-four-port-consistency/`; no pass count is asserted here.

## 2. Unknown completed channels and their normalization

Fibonacci has x*x=1+x and, in channel order (1,x),

    F = [[phi^-1,phi^-1/2],[phi^-1/2,-phi^-1]],
    phi=(1+sqrt(5))/2.

An allowed analytic carrier has unknown Virasoro-primary families:

    V_p=direct-sum_mu K_(p,mu) tensor L(c,H_(p,mu)),
    H_(p,mu)=h_p+grade_mu.

The integer grades and finite multiplicities at each energy follow the
declared grading ansatz; they are not determined by the fusion rule. The
lowest external x primaries can also form an unknown multiplicity space.
For fixed external states a,b,c,d, a completed chiral channel involves

    B_s,p[a,b,c,d](z)
      =sum_mu C_L[p,mu;a,b] C_R[p,mu;c,d] V_(H_(p,mu))(z),       (3)

with multiplicity contractions understood. Its intertwiners must satisfy
all Ward, null-descent and reflection equations on arbitrary port states.
Using only V_0 and V_(2/5) is an additional restrictive ansatz.

By convention (ai), abstract analytic blocks transform by F^(-T), whereas
tree-value columns transform by F. For this real symmetric involutory
matrix both are F. Thus the four-port functional equation in compatible
categorical frames is

    B_s,e[a,b,c,d](z)=sum_f F[e,f] B_t,f[a,b,c,d](z).            (4)

The t channel includes the specified leg permutation and coordinate
transports. It cannot automatically be replaced by the same scalar
function at 1-z for a chosen external tensor component.

Monic analytic and categorical block bases may differ. If B_s=D_s g_s
and B_t=D_t g_t, their connection matrix is

    g_s=D_s^(-1) F D_t g_t.                                   (5)

Even in multiplicity-free channels the nonzero normalization factors are
unknown. LC-6's finite algebra coefficients alpha,beta do not fix them.
Positive reflection pairings must transform with these same basis maps;
an orthonormal categorical basis is not automatically a monic analytic one.

## 3. Exact midpoint hierarchy in a specified symmetric chart

**ASSUME:** the leg transports and external tensor permutations have been
fixed so that (4) becomes B(z)=F B(1-z) for the same column B. This is an
additional symmetric recoupling chart, not an equation on every scalar
component with external labels suppressed.

**PROVE LC-FM:** for every k>=0,

    [I-(-1)^k F] B^(k)(1/2)=0.                                (6)

<1>1. Differentiate B(z)=F B(1-z) k times. The chain rule contributes
(-1)^k.
<1>2. Set z=1/2. This gives (6). QED by <1>1.

For a nonzero derivative vector the component ratios are

    B_x^(k)/B_1^(k)=phi^(-3/2)   if k is even,
    B_x^(k)/B_1^(k)=-phi^(3/2)   if k is odd.                  (7)

Indeed the first row of the eigenvector equation gives
(lambda-phi^-1)/phi^-1/2, with lambda=+1 or -1. A zero vector satisfies
(6) without a ratio. Unknown diagonal normalization cancels from the
following necessary identity when B=Dg with the same D in both channels
and the displayed values and derivatives are nonzero:

    (g_x'/g_x)(1/2)=-phi^3 (g_1'/g_1)(1/2).                   (8)

Equations (6)–(8) are exact functional tests, not finite Taylor tests.

## 4. What would certify a crossing failure

Let B_s^(Lambda),B_t^(Lambda) be truncations and assume proved bounds
||B_s-B_s^(Lambda)||<=epsilon_s and similarly for t at a test point.
Unitarity of F and (4) imply

    ||B_s^(Lambda)-F B_t^(Lambda)||<=epsilon_s+epsilon_t.        (9)

**DERIVATION:** subtract (4) from the truncated residual and use the
triangle inequality and ||F||=1. In monic gauge the second tail has the
factor ||D_s^(-1) F D_t|| instead.

A residual larger than a certified bound excludes the declared ansatz.
A nonzero residual from the grade-four Taylor polynomials alone does not.
Expansion about the other OPE point involves infinitely many original
coefficients. Midpoint derivatives likewise require the completed functions
or rigorous tail control. No such tail bound is provided by the present run.

## 5. Separate conditional genus-one obstruction to finite primary content

This diagnostic assumes more than (4): convergent ordinary characters
chi_p(tau)=Tr_(V_p) exp(2*pi*i*tau*(L0-c/24)) transform by the supplied
Fibonacci S. It is not asserted from an abstract fusion category alone.

**ASSUME:** V_1 has only M<infinity unitary Virasoro highest-weight
families, counted with multiplicity. Their weights are nonnegative. The
vacuum has weight zero. **PROVE:** contradiction at c=14/5.

<1>1. PBW spanning bounds, for beta>0,

    chi_1(i*beta/(2*pi))
      <=M exp(beta*c/24) product_(n>=1)(1-exp(-beta*n))^(-1).

<1>2. Positive series expansion bounds the logarithm of the product by

    sum_(k>=1) 1/[k*(exp(beta*k)-1)]
      <= beta^-1 sum_(k>=1) k^-2 < 2/beta.

The last bound follows from 1+integral_1^infinity x^-2 dx=2.
Putting beta=2*pi/t gives log chi_1(i/t)<=t/pi+O(1).

<1>3. The positive vacuum row S_11=1/sqrt(2+phi),
S_1x=phi/sqrt(2+phi), and modular covariance give

    chi_1(i/t)>=S_11 chi_1(it)>=S_11 exp(pi*c*t/12).

<1>4. At c=14/5, pi*c/12=7*pi/30>1/pi. Letting t tend to infinity
contradicts <1>2. QED by <1>1–3.

Under this explicit modular-character hypothesis, even the vacuum carrier
must have infinitely many Virasoro-primary families. This rejects the
one-module-per-category-sector ansatz at genus one. It does not constitute
a four-port crossing failure or determine the additional primary content.

## 6. Remaining reconstruction work

The complete graded carriers, compatible intertwiners and their analytic
convergence remain unknown. Then the machine must produce cutoff-dependent
finite-range Hamiltonians, identify their standard Koo–Saleur generators,
and prove a shared OAR/state limit with complete category fidelity.
The displayed Ward coefficients and conditional obstruction supply neither
a known-model substitution nor a completed branch of that pipeline.
