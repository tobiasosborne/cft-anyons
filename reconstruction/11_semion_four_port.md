# LC-11 — An exact multiplicity-aware semion four-port solution

**Status:** checked local derivation and an explicit positive four-port solution,
conditional on the selected lift and additional external multiplicity. This
is a partial realization of the local equations, not a complete CFT.
Conventions: (ah),(ai). No known model or OPE table is imported.

Sources already local and registered:

- `references/cft/Schottenloher2008/Schottenloher2008.md:2925–2947`:
  Virasoro/Shapovalov grade-two form.
- Same source `:2985–3000`, Theorem 6.13(1a): positive semidefiniteness at
  c>=1,h>=0 and quotient by the radical.
- Same source `:5006–5012`, Proposition 9.5: ONLY the global Ward identities
  n=-1,0,1 are used. The unrestricted assertion in Proposition 9.8 at
  :5129–5135 is not used and would be false for ordinary primary correlators.
- Same source `:5093–5105`, equations (9.6),(9.7): primary commutator and
  stress OPE, from which contour deformation yields the L_-2 insertion.
- `references/category-theory/RowellStongWang2009Classification/source/RSWfinal3.tex:2342–2378`:
  semion FS=-1, s*s=1, h=1/4 modulo integers, c=1 modulo8,
  R_1^(ss)=i and F_s^(sss)=-1.
- `reconstruction/08_small_category_stress.md`: selected (c,h)=(1,1/4),
  grade-two null and permitted Virasoro output weights 0,1.

Reproduce with `python3 scripts/python/run_four_port_consistency.py`.
The producer, exact checks, deliberate mutations and run artifacts are
registered in `runs/2026-10-21-four-port-consistency/` and root INDEX.
The derivations below state the exact identities independently.

## Declared analytic and multiplicity choices

Take positive sqrt[z(1-z)] for 0<z<1 and analytic continuation from that
branch. All four primaries have h=1/4 and c=1. Write the infinity-fixed
block as G(z)=<phi_a(infinity) phi_b(1) phi_c(z) phi_d(0)>.
Virasoro blocks are monic at z=0: V0 has exponent -1/2 and zero grade-one
coefficient (vacuum quotient); V1 has exponent +1/2 and leading coefficient1.

Add a CHOSEN external lowest-primary multiplicity W=C^2 with its standard
positive Hermitian metric. This is additional graded-carrier input, not a
deduction from the modular category. Let epsilon_12=1, epsilon_21=-1,
epsilon_11=epsilon_22=0. Define

    E1_abcd=epsilon_ab epsilon_cd,
    E2_abcd=epsilon_ac epsilon_bd,
    E3_abcd=epsilon_ad epsilon_bc.

Their pairing is the ordinary tensor-product Hermitian pairing on W^tensor4.
Use leading s vacuum cup-pair E1/2 and leading t cup-pair E3/2, both norm1.
For a positive adjacent exchange choose the analytic half-path for which
log(prod_(i<j)(xi-xj)) increases by i*pi, with other difference logarithms
continued without an added winding. These choices fix both F and R signs.

W is only a lowest-weight multiplicity space. No tensor functor s->W is
asserted; dim(W)=2 is NOT the categorical quantum dimension d_s=1.

## 1. Null equation and exact scalar solution space

ASSUME the sourced Ward/OPE conditions and positive null quotient.
PROVE the infinity-fixed four-port null ODE is

    G''+(1-2z)/(z(1-z))*G' - G/(4*z^2*(1-z)^2)=0.             (S1)

<1>1. At c=1,h=1/4 the grade-two Gram form is (3/2)[[1,1],[1,1]].
The zero vector in the positive quotient is
(L_-2-L_-1^2)|h>. It is singular:
L1 gives [3-(4h+2)]L_-1|h>=0 and L2 gives (4h+c/2-6h)|h>=0;
all higher positive modes annihilate it by grading.
BY the commutator and the sourced PSD quotient.

<1>2. Contour deformation of the primary stress OPE gives, at any port i,

    [partial_i^2 - sum_(j!=i)(h/(xi-xj)^2
                              +partial_j/(xi-xj))] G4=0.   (S2)

BY <1>1 and (9.7). This does not assume a vanishing all-n primary Ward sum.

<1>3. After sending x1 to infinity and setting (x2,x3,x4)=(1,z,0),
translation and dilation give

    partial_1 G=-zG'-2hG,
    partial_0 G=(z-1)G'+2hG.

Here partial_1 means differentiation of the insertion at coordinate1,
not differentiation with respect to x1 at infinity. The infinity insertion
is normalized by lim_(R->infinity) R^(2h)phi(R); its contribution to dilation
is -2hG. BY the n=-1,0 global Ward identities.

<1>4. Substitute <1>3 into (S2) at z. On the right side of the equation
for G'', the derivative coefficient is (2z-1)/(z(1-z)) and the value
coefficient is h/[z^2(1-z)^2]. Move both to the left and set h=1/4
to obtain (S1). QED.

<1>5. Substituting G=P(z)/sqrt[z(1-z)] makes the left side of (S1)
exactly P''/sqrt[z(1-z)]. Hence P=a+bz, with no logarithmic solution.
The vacuum quotient removes the z^(+1/2) coefficient in its vacuum block.
Therefore the two monic Virasoro blocks are

    V0=(1-z/2)/sqrt[z(1-z)],
    V1=z/sqrt[z(1-z)].                                    (S3)

Their series are

    V0=z^(-1/2)[1+z^2/8+z^3/8+15z^4/128+...],
    V1=z^(+1/2)[1+z/2+3z^2/8+5z^3/16+...].

These are two Virasoro channels of weights0,1. They are not two categorical
fusion channels: the categorical output remains the single unit sector.

## 2. Exact connection matrix and positive Virasoro pairing

Let V=(V0,V1)^T. Direct substitution yields

    V(1-z)=M V(z),
    M=[[1/2,3/4],[1,-1/2]],  M^2=I.                        (S4)

A diagonal nonnegative block pairing D=diag(d0,d1), d0>0, is invariant
exactly when d1=3d0/4. Normalize d0=1:

    D=diag(1,3/4),   M^T D M=D.                            (S5)

Equivalently U=(V0,sqrt(3)V1/2) has orthogonal connection
[[1/2,sqrt(3)/2],[sqrt(3)/2,-1/2]]. Neither this 2x2 matrix nor M is the
categorical 1x1 associator -1. In particular the initial scalar
vacuum-only ansatz fails crossing: V0(1-z)=V0(z)/2+3V1(z)/4. This is a
failure of that ansatz, not a failure of the semion category.

The positive scalar sesquilinear pairing is

    H(z,zbar)=|V0|^2+(3/4)|V1|^2
             =(1-Re(z)+|z|^2)/|z(1-z)|.                  (S6)

It obeys H(1-z)=H(z) and H(z)=|z|^(-1)H(1/z), appropriate for four
identical bulk weights(h,hbar)=(1/4,1/4). Monodromy of both chiral blocks
around either0 or1 is -I, so H is single valued away from collisions.
This is positive local block sewing, not an all-n reflection-positivity theorem.

## 3. Actual prescribed semion F=-1 with external multiplicity

The alternating tensor identity, checked component by component, is

    E1-E2+E3=0.                                           (S7)

ASSUME the chosen leading cup tensors and prescribed semion F=-1.
PROVE these determine the following tensor-valued blocks within (S1):
Here the covector transformation F^(-T) also equals -1, so the distinction
between tree coefficients and dual analytic blocks in (ai) changes no sign.

<2>1. The general normalized numerators are E1/2+zC and
E3/2+(1-z)D. BY (S1) and the two leading cup choices.

<2>2. Their required connection B_s=-B_t gives C=D and
C=-(E1+E3)/2=-E2/2. QED BY coefficient comparison and (S7).

Consequently the normalized channel blocks are

    B_s(z)=(E1-zE2)/(2*sqrt[z(1-z)]),
    B_t(z)=(E3-(1-z)E2)/(2*sqrt[z(1-z)]).                 (S8)

Their leading terms are respectively z^(-1/2)E1/2 and
(1-z)^(-1/2)E3/2. Every component solves (S1), since each numerator is
linear. The exact connection equation is

    B_s=-B_t.                                             (S9)

BY (S7). Their common span is a one-dimensional candidate categorical
channel line with the prescribed semion associator -1. There are two scalar
Virasoro functions inside its W^tensor4 evaluation. No equality of a
categorical block dimension with a Virasoro block dimension is assumed.

The decomposition is

    B_s=A0 V0+A1 V1,
    A0=E1/2,   A1=(E1-2E2)/4.

Exact contraction over the external indices gives

    <A0,A0>=1, <A0,A1>=0, <A1,A1>=3/4.                     (S10)

Consequently ||B_s||^2=H=||B_t||^2. The positive pairing and categorical
minus sign coexist explicitly. Discarding V1 would violate (S5), while
identifying scalar positivity with a sign condition on B_s=-B_t would
incorrectly discard the alternating external pairing.

The same coefficient tensors admit explicitly positive internal kernels.
Use the reflected-pair orientation fixed in (ai):

    K(A)_(alpha beta,cd)
      =-sum_(a,b) epsilon_(a beta) epsilon_(b alpha) A_abcd.

Let S swap the two factors of W^tensor2 and P_antisym=(I-S)/2,
P_sym=(I+S)/2. Direct contraction gives

    K(A0)=P_antisym,   K(A1)=P_sym/2.                      (S11)

Both are positive semidefinite, of ranks1 and3. Thus this chosen local
reflection admits one vacuum-primary direction and three weight-one
primary directions, with positive coefficients. The three symmetric
directions are inside the categorical vacuum output, not three new
categorical sectors. This is coefficient-level Hilbert sewing. It does
not prove all higher null quotients, all-n reflection positivity, or a
complete graded carrier. Omitting the leg reversal or its duality sign
would change this positivity check.

## 4. All four null ports and braiding sign

For distinct positions, set Q=prod_(i<j)(xi-xj) and P1=(x1-x3)(x2-x4),
P2=(x1-x2)(x3-x4). The global version is

    B(x1,x2,x3,x4)=[E1 P1-E2 P2]/(2*sqrt(Q)).             (S12)

Its infinity limit is B_s. Under a Möbius map each external coordinate
contributes its primary factor of weight1/4: numerator has one factor per
port, sqrt(Q) has three halves per port. The two polynomial components
P1/sqrt(Q), P2/sqrt(Q) satisfy (S2) at ALL four ports. Exact verification
uses l_i=-(1/2)sum_(j!=i)1/(xi-xj) and differentiates P Q^(-1/2):

    sqrt(Q)*partial_i^2(P/sqrt(Q))
      =partial_i^2 P+2*l_i*partial_i P+(partial_i l_i+l_i^2)P.

The null residual vanishes as a rational function; it is enough to set
x2=1,x4=0 after differentiation by affine covariance, retaining x1,x3 free.

The numerator E1 P1-E2 P2 is alternating under each adjacent simultaneous
exchange of a coordinate and its external index. Check this using (S7)
and P1-P2=(x1-x4)(x2-x3). For the selected positive half-path sqrt(Q)
picks up i, so the tensor block picks up (-1)/i=i: the prescribed
R_1^(ss)=i. Two such exchanges give -1, matching the monodromy in section2.

The chosen epsilon also supplies an antiunitary J=epsilon composed with
complex conjugation, with J^2=-I. This implements the skew-duality/FS=-1
sign at the chosen multiplicity level. It does not turn W into the complete
sector Hilbert space or prove the categorical duality axioms at all grades.

## Boundary of the result

The exact null/Ward/four-port/F/R and positive pairing equations have an
explicit compatible solution at the selected semion lift, after declaring
the external doublet. The category did not by itself select this doublet.
The complete graded carriers, all higher sewing, extension/locality,
operator energy bounds, local lattice Hamiltonian, standard KS generators
and shared OAR limit remain unconstructed. The same result provides no
Fibonacci four-port solution: its selected Verma module has no grade-two
null that could supply this ODE.
