# LC-13 — Conditional selection of the semion primary doublet

**Status:** checked conditional necessary condition for the declared ansatz.
Conventions: (ah),(ai). Reproduce with
`python3 scripts/python/run_four_port_consistency.py`; exact artifacts live
in `runs/2026-10-21-four-port-consistency/`.

## Assumptions and scope

Retain c=1,h_external=1/4, the external positive null quotient, all-port
BPZ equation and branch of LC-11. Let W=C^d be the entire chosen external
lowest-primary multiplicity space. Assume a nondegenerate real orthogonal
skew matrix epsilon on W:

    epsilon^T=-epsilon, epsilon^T epsilon=I.

Consequently epsilon^2=-I and J=epsilon conjugation has J^2=-I.
Use the same pair reflection as convention(ai), and the chosen normalized
s/t leading tensors E1/d,E3/d. Here E1_abcd=epsilon_ab epsilon_cd and
E3_abcd=epsilon_ad epsilon_bc. Both tensors have norm d, so the leading
normalized tensors have norm1.

Require the prescribed scalar semion connection Bs=-Bt. The categorical
intermediate label is the unit. Assume its carrier has nonnegative integer
L0 grading and a unique normalized weight-zero vacuum. Its higher-primary
multiplicities are unrestricted. The analytic blocks must admit positive graded Hilbert
sewing after the declared pair reflection: for each intermediate energy,
the coefficient operator on W tensor W is a Gram sum of transition maps
with their Hilbert adjoints on the positive null quotient.

This final condition is stronger than a positive scalar norm, a positive
sesquilinear block-space pairing, or pointwise K(Bs(z))>=0 at real z.
It is exactly the positive intermediate-state sewing condition; it must
not be inferred from BPZ+F alone.

## Proposition

Within these assumptions, a nonzero sewn four-port function is possible
only when d=2. At d=2, the coefficient kernels agree with LC-11. This
selects the doublet within this finite multiplicity/duality ansatz. It
does not deduce the whole carrier or a CFT from the category alone.

## Structured proof

<1>1. The null ODE gives every component as a linear numerator divided by
r=sqrt[z(1-z)]. The most general s/t normalized functions are

    Bs=(E1/d+z C)/r,
    Bt=(E3/d+(1-z)D)/r.

BY LC-11(S1), independently derived from the sourced primary stress OPE
and the null vector of the positive c=1,h=1/4 module.

<1>2. Bs=-Bt forces C=D=-(E1+E3)/d. Therefore

    Bs=[(1-z)E1-zE3]/(d r)
       =A0 V0+A1 V1,
    A0=E1/d,
    A1=-(E1/2+E3)/d.                                    (D1)

BY coefficient comparison and the exact V0,V1 of LC-11.
No Schouten identity is used: E1-E2+E3=0 is special to d=2 and is false
for the canonical nondegenerate epsilon at d=4.

<1>3. Let e be the vector in W tensor W with components e_ab=epsilon_ab.
Then ||e||^2=d. Write P_e=e e^dagger/d; this is the rank-one orthogonal
projection onto the epsilon direction. For any four-tensor define

    K(A)_(alpha beta,cd)
      =-sum_(a,b) epsilon_(a beta) epsilon_(b alpha) A_abcd.

Directly contracting epsilon^T epsilon=I and epsilon^T=-epsilon gives

    K(E1)=e e^dagger=d P_e,
    K(E3)=-I_(W tensor W).                               (D2)

The second identity is the identity on dimension d^2, not dimension d.
For example its matrix element is -delta_(alpha,c)delta_(beta,d).

<1>4. Consequently

    K(A0)=P_e,
    K(A1)=I/d-P_e/2.                                    (D3)

The latter has eigenvalue 1/d-1/2 on e and eigenvalue1/d on its
orthogonal complement of dimension d^2-1. BY <1>3.

<1>5. Positive graded Hilbert sewing requires K(A1)>=0.

<2>1. V0=z^(-1/2)(1+O(z^2)); V1=z^(1/2)(1+O(z)). Thus K(A1) is exactly
the coefficient of intermediate energy1, not a mixture with an energy0
level-one descendant. BY the vacuum quotient L_-1 Omega=0.

<2>2. The unique weight-zero vacuum has L_-1 norm squared 2h=0 in
the positive quotient. With integer grading, the energy-one space has no
other lower-primary descendant contribution. BY [L1,L_-1]=2L0 and the
stated vacuum-carrier input.

<2>3. At energy1 a reflected sewing coefficient is T1^dagger T1, or a
sum of such positive operators over primary multiplets. Null vectors
have already been removed. Hence K(A1)>=0. BY the positive sewing
assumption. This argument does not bound the number of weight-one
primaries; it constrains their total Gram operator.

<1>6. The epsilon-direction expectation gives 1/d-1/2>=0, or d<=2.
The invertible skew matrix has even d: taking determinants in
 epsilon^T=-epsilon gives det(epsilon)=(-1)^d det(epsilon).
Thus d is even and nonzero, so d>=2. Therefore d=2. QED.

At d=2, P_e is the whole antisymmetric projector and
K(A1)=(I-P_e)/2=P_sym/2, recovering the positive rank-three kernel.
At d=4 choose epsilon=diag([[0,1],[-1,0]],[[0,1],[-1,0]]) and normalized
w=e/2. Exact arithmetic gives

    <w,K(A1)w>=1/4-1/2=-1/4.                             (D4)

This is an explicit negative spectral coefficient witness.

## Why extra weight-one primaries do not repair the contradiction

They are already allowed in T1. Their squared transition maps must sum
to the unique coefficient K(A1) fixed by BPZ, F and the leading cups.
A sum of positive operators cannot have expectation -1/4 on w.
Adding another analytic block with zero leading s and t tensors does
not change this conclusion: its numerator is linear and vanishes at
both0 and1, so it is identically zero.

An evasion must change an assumption, for example the lift/null ODE,
the nondegenerate skew top pairing, the leading vacuum tensors, the
one-dimensional categorical channel/normalization identification, or
the positive reflected sewing prescription. Adding fields at other
external weights is not a change of this fixed W; those do not alter
this same-external-primary four-point coefficient without extra mixing
that changes the ansatz. An infinite multiplicity carrier is also
outside this finite normalized-cup calculation.

A common positive overall rescaling of both leading cups scales (D3)
positively and does not change the d<=2 conclusion.

## Pointwise positivity is insufficient

For every even d>=2 and 0<z<1, (D1) nevertheless gives

    K(Bs)=P_e V0+(I/d-P_e/2)V1.

Its eigenvalues are

    [1-z+z/d]/sqrt[z(1-z)]   on e,
    z/[d sqrt[z(1-z)]]      on e-perpendicular.

Both are strictly positive. Thus a test checking only pointwise positive
matrices would miss d=4. The failing invariant is positivity of the
separate intermediate-energy coefficient required by Hilbert sewing.

## Independent braid obstruction

The generalized global numerator is N=E1 P3-E3 P2, where
P2=(x1-x2)(x3-x4), P3=(x1-x4)(x2-x3), and P1=P2+P3. Under the adjacent
coordinate/index exchange of ports2,3, direct substitution gives
N_prime+N=(E1-E2+E3)P3. The prescribed R=i with sqrt(Q) acquiring i
requires N_prime=-N. Thus it additionally requires E1-E2+E3=0. At d=4
the component (a,b,c,d)=(1,2,3,4) is1, so this fails. At d=2 it vanishes
by LC-11. This is a separate braid obstruction consistent with positivity;
no d>2 candidate is claimed to pass the entire braid system first.

## Provenance

The calculation is local linear algebra plus LC-11's checked BPZ equation.
The representation inputs are the sourced Virasoro commutator, positive
quotient and primary stress OPE in
`references/cft/Schottenloher2008/Schottenloher2008.md:2925–2947,2985–3000,5093–5105`.
Semion F=-1 and FS=-1 are sourced at
`references/category-theory/RowellStongWang2009Classification/source/RSWfinal3.tex:2342–2378`.
The generalized d assumption and graded-positivity distinction are
registered in convention(ai). The producing checks include d4's exact
normalized -1/4 witness and the pointwise-positive countercheck.
