# F2 — Zero modes and lattice chirality without parity

2026-10-25. Initial all-open research ledger written within ten minutes
of the 05:04 UTC start; updated after each proved result.
**Verdict: substantial partial proof, not a proof of F2(a).** The cubic
ledgers balance without parity or current conservation. Commuting limiting
zero modes additionally force both ledgers to agree and all mixed brackets
to vanish. Automatic zero-mode commutation remains unresolved. The proposed
spectral-log identification is false under the stated assumptions, but
that counterexample has ZC=0 and does not refute F2(a).
All paths are repository-relative. No network, commits, root-file changes,
or Julia suite. The task-specific write restriction overrides the repository's
usual convention/worklog/commit workflow; declarations here are note-local.

## Statement and scope

For a general unitary fusion category C, use a declared periodic representation
of self-adjoint translated two-site densities k_j, with non-adjacent densities
commuting, and the standard KS modes of CONVENTIONS (ap), (at). No categorical
identity is needed in the analytic argument: its data tag is category-free;
L0 is sufficient for the categorical finite ingredients. Set

    a_N=N/(4 pi), z=exp(2 pi i/N), Jcal_j=i[k_j,k_(j+1)],
    Qcal_N=sum_j Jcal_j,
    E_n=a_N sum_j z^(nj)(k_j-epsilon_N)+b_N delta_(n,0),
    B_n=a_N sum_j z^(nj)Jcal_j,
    L_n=T_(r,n)=E_n-B_n, S_n=Tbar_(r,-n)=E_n+B_n,
    D_r=L_0-S_0=-2B_0,
    |A|_(s,d)=||K_r^s A K_r^(-s-d)||.

Here Qcal is the total current, not the auxiliary shell grading Q_r; S reverses
the barred index. The brief cites (as), but the applicable parity/KS entry is
actually (at), CONVENTIONS.md:1577-1593; (as) concerns CA-90's unital lift.

F2(a): under CA-91 Theorem 91.1, additionally U_r-covariance of both families
and [U_r,K_r]=0, prove |[L_0,S_0]|_(s,2)->0, equivalently
|N_r^2 [sum_j k_j,Qcal_N]/(8 pi^2)|_(s,2)->0, for each s. Investigate a spectral
logarithm p_r of U_r, without assuming current–momentum identification.

F2(b): remove parity, retain the common two-family VR-1 certificates and
conserved total energy current, and determine whether both anomaly ledgers
must agree. Distinguish the standard nearest-neighbour KS assertion from the
broader proposed no-go for all finite-range finite-site lattice CFT limits.

F2(c): determine whether removing finite range or finite site dimension
supplies a certified unequal-ledger mechanism, and identify all other
hypotheses changed by any proposed example.

Tags throughout: (full/periodic; category-free, or L0 for a categorical
realisation; ->R2 conditional on the specified certificates). No R3 locality,
positive-energy integration, R4 fidelity or R5 functor is implicit in R2.

## Proof plan and dependency ledger

1. Audit the exact KS Fourier identity and the current–momentum inference.
2. Test whether Jacobi, adjoints and translations eliminate C_00.
3. Keep finite weighted-norm decay distinct from vanishing on the limit core.
4. Retain the unequal-ledger term in the mixed-bracket antisymmetry identity.
5. Search only local ground truth for an applicable anomaly theorem.
6. Give Lamport proofs for every implication actually established, and sharp
   remaining lemmas for any unproved clause.

## Theorem F2-G: the missing norm/core equivalence

**Status: proven implication. Tags: (any; category-free; R2 conditional).**
The finite-stage ZC estimate and limiting zero-mode commutation are
equivalent under the full common A1-A3 hypotheses. CA-91:127-131 and
E2 NOTE:346-349 stated only sufficiency; the word-tail estimate supplies
the converse. This observation does not itself establish either condition.

**ASSUME** common A1-A3 for the two mode families, with A2 constants
`C^L_(n,s), C^S_(n,s)` and summable A3 defects
`e^L_(r,n,s), e^S_(r,n,s)`; here `S_(r,n)=Tbar_(r,-n)`.

**PROVE** for each fixed m,n,s, if `[L_m,S_n]=0` on D then

    |[L_(r,m),S_(r,n)]|_(s,2) <= t_(r,m,n,s) -> 0,
    t_(r,m,n,s) = sum_(k>=r) {
       e^L_(k,m,s) C^S_(n,s+1) + C^L_(m,s) e^S_(k,n,s+1)
      +e^S_(k,n,s) C^L_(m,s+1) + C^S_(n,s) e^L_(k,m,s+1) }.

**<1>1.** For v in H_r, apply the two-letter word-tail bound of VR-1
`virasoro_routes.md:115-137` to the words (L_m,S_n) and (S_n,L_m).
Subtract their limiting words. The resulting norm is at most
`t_(r,m,n,s)||K_r^(s+2)v||`. **BY** one-letter telescoping, A1 isometry
on every graph space, and the triangle inequality. This is exactly the
already-proved VR-1 word estimate, with chirality included in the alphabet.

**<1>2.** The limiting commutator annihilates i_r v, since `i_r H_r` lies
in D. The remaining finite-stage vector has norm
`||K_r^s[L_(r,m),S_(r,n)]v||`. Take the supremum over
`||K_r^(s+2)v||=1`. **BY** A1 and <1>1. This proves the displayed bound.

**<1>3.** The tail tends to zero by A3. Conversely, a vanishing finite
bound implies a vanishing limiting commutator by mixed-word convergence
and density on D, as in CA-91:125-139. **QED.**

Thus any genuine counterexample to finite-stage ZC under full A1-A3 must
also have a nonzero limiting zero-mode commutator. A moving high-energy
defect with a vanishing limit cannot evade the uniform word-tail estimate.

## Proposition F2-N: the proposed logarithm identification is not automatic

**Status: negative, proven. Tags: (full; L0 finite realisation;
R2 zero-mode example only).** This is a counterexample to deriving
CA-91(12) from F2(a)'s hypotheses; it is **not** a counterexample to ZC.

**ASSUME/CONSTRUCT** any unitary fusion category C and the unit-multiplicity
site `O=1 direct-sum 1`. On its ordinary multiplicity Hilbert space
`H_r=(C^2)^(tensor N_r)` take even N_r tending to infinity, append-vacuum
isometries, K_r=I, k_j=0, epsilon_N=b_N=0. Let U_r be the ordinary cyclic
site shift and P_r the complex-linear bond-centred site reflection.

**PROVE** all hypotheses of F2(a) hold, ZC holds identically, but every
self-adjoint p_r with `exp(2 pi i p_r/N_r)=U_r` satisfies
`|D_r-p_r|_(s,1)>=N_r/2`; hence the proposed current–momentum identification
cannot be forced by those hypotheses.

**<1>1.** The multiplicity carrier and scalar zero morphisms are available
for every C by the simple unit and orthogonal sums (CA-91:200-207;
`references/text/PenneysUnitaryFusionCategories.md:219-237,442`).
The append-vacuum maps are isometries and exactly transport I. All modes,
currents and ledgers are zero, so A2-A4 hold with zero errors. P and U
commute with K and act covariantly. **BY** the definitions, with no
category-specific identity.

**<1>2.** The one-excitation subspace has orthonormal vectors e_j,
`Ue_j=e_(j+1)`. Its Fourier vectors have all N-th roots of unity as
eigenvalues, including -1 when N is even. **BY** summing the finite
geometric progression, or directly translating the Fourier vector.

**<1>3.** By spectral functional calculus, p commutes with U and has an
eigenvalue in `N(1/2+Z)` on a nonzero -1 eigenspace. Thus `||p||>=N/2`.
Since D=0 and K=I, this is precisely the claimed graph-norm lower bound.
This argument even allows different lifts inside a repeated phase
eigenspace; requiring p to be a spectral function of U only restricts it.
**BY** <1>2 and `exp(2 pi ix/N)=-1 iff x in N(1/2+Z)`. **QED.**

The separating hypothesis is an actual estimate on `D_r-p_r`, or an
alternative commutator estimate. No choice of logarithm branch repairs
this example. Conversely, its nonzero translation sectors carry zero
stress, so it says nothing against direct proofs of ZC.
In general, covariance only gives blocks
`H=direct-sum_theta H_theta`, `Qcal=direct-sum_theta Q_theta` and
`p=direct-sum_theta p_theta I`. The exact equalities `[p,H]=[p,Qcal]=0`
leave `[H,Qcal]=direct-sum_theta[H_theta,Q_theta]` undetermined.
The missing estimate concerns these internal phase-sector blocks.

## Theorem F2-B: parity-free balance given the zero-mode equation

**Status: proven implication. Tags: (full; category-free; R2 conditional).**
This strengthens CA-91 Theorem 91.5 by removing its equal-ledger hypothesis.
It does not assume microscopic parity, a logarithm of translation, positive
energy, or a tensor-product site representation.

**ASSUME** the standard nearest-neighbour KS setting above and both VR-1
certificates on one nonzero common system. Let L_n,S_n denote the limits on
the common invariant domain D. Assume only `[L_0,S_0]=0` on D; finite-stage
ZC, and in particular exact conservation of Qcal_N, is sufficient for this.

**PROVE** `c_L=c_R`, `c_L*=c_R*`, and `[L_m,S_n]=0` on D for all m,n.

The limiting internal brackets, including the reversed barred signs, are

    [L_m,L_n]=(m-n)L_(m+n)+z^L_mn I,
    [S_m,S_n]=(n-m)S_(m+n)-z^R_mn I.

**<1>1. Retain the central difference in the KS identity.**
Define the note-local scalar abbreviation

    gamma_m = (m^3(c_R*-c_L*)-m(c_R-c_L))/12,
    C_mn=[L_m,S_n], X_q=C_q0.

Thus gamma is odd and gamma_0=0. At finite stage, CA-79 Lemma 79.1
and expansion of `[L_m+S_m,L_n+S_n]` give

    C_mn-C_nm = (4 kappa_mn-2(n-m))B_(m+n)
                -F^L_mn-F^R_(-m,-n)+delta_(m+n,0)gamma_m I,
    kappa_mn=-i a_N(z^n-z^m).

The first three terms tend to zero in (s,2), by A2, A4 and the
`2 pi(m^2+n^2)/N` coefficient bound in CA-91:118-123.
Mixed-word convergence follows from CA-91:85-89 / VR-1:115-137,
independently of parity. Therefore on D,

    C_mn-C_nm=delta_(m+n,0)gamma_m I.                     (B1)

**BY** the cited exact Fourier identity, the displayed expansion, and VR-1.

**<1>2. The entire mixed bracket is a symmetric part plus half this scalar.**

**<2>1.** L-Jacobi gives

    [L_m,C_nk]-[L_n,C_mk]=(m-n)C_(m+n),k.

Its cyclic sum has zero left side: each remaining commutator is with
`C_ab-C_ba`, a scalar by (B1). Hence

    (m-n)C_(m+n),k+(n-k)C_(n+k),m+(k-m)C_(k+m),n=0.      (B2)

**BY** Jacobi on the common invariant D; internal central terms commute.

**<2>2.** Set k=0 in (B2). For m!=n,

    (m-n)(X_(m+n)-C_mn)-n delta_(m+n,0)gamma_m I=0.

When m+n=0 and m!=n, `-n/(m-n)=1/2`; otherwise the scalar is zero.
Thus `C_mn=X_(m+n)+(1/2)delta_(m+n,0)gamma_m I` off the diagonal.
**BY** (B1), (B2) and displayed division only when m!=n.

**<2>3.** For n!=0 use the triple `(p,n-p,n)` in (B2), with
`p` outside `{0,n,n/2}`. The other two entries are off-diagonal and all
have total index 2n!=0, so the scalar terms vanish. This gives
`(2p-n)(C_nn-X_(2n))=0`. For n=0 the same assertion is the definition
`C_00=X_0`. Consequently

    C_mn=X_(m+n)+(1/2)delta_(m+n,0)gamma_m I             (B3)

for every pair. **BY** <2>2 and the specified nonzero coefficient.

**<1>3. Use X_0=0 to determine the two actions on X.**

**<2>1.** Put `A_q=[L_0,X_q]`. Since `X_q=C_0q` by (B1), Jacobi gives

    [L_p,X_q]=p X_(p+q)+A_(p+q)
                       +(p/2)delta_(p+q,0)gamma_p I.

Set q=0. The left side is zero by the zero-mode hypothesis; the scalar
also vanishes. Thus `A_p=-p X_p`, and

    [L_p,X_q]=-q X_(p+q)+(p/2)delta_(p+q,0)gamma_p I.    (B4)

**BY** (B3), `[L_p,L_0]=pL_p` and the displayed calculation.

**<2>2.** Put `B'_q=[S_0,X_q]` (prime distinguishes this abbreviation
from the finite current mode B_q). Using `X_q=[L_q,S_0]`,
`[S_p,S_0]=-pS_p` and oddness of gamma, Jacobi gives

    [S_p,X_q]=-p X_(p+q)+B'_(p+q)
                       +(p/2)delta_(p+q,0)gamma_p I.

At q=0 this yields `B'_p=pX_p`; therefore

    [S_p,X_q]=q X_(p+q)+(p/2)delta_(p+q,0)gamma_p I.     (B5)

**BY** (B3), X_0=0 and the displayed calculation.

**<1>4. The nonzero X modes vanish.**
For q!=0, (B4)-(B5) and Jacobi give

    [[L_1,S_-1],X_q]
      =[L_1,[S_-1,X_q]]-[S_-1,[L_1,X_q]]
      =-q(q-1)X_q+q(q+1)X_q=2qX_q.

Scalar terms from the inner commutators disappear on commuting again;
scalar terms from the outer commutators have support q=0, excluded here.
But (B3) and X_0=0 give `[L_1,S_-1]=(gamma_1/2)I`, so the left side is
zero. Hence X_q=0 for q!=0, and X_0=0 by assumption.
**BY** (B3)-(B5) and the displayed computation.

**<1>5. The scalar defect vanishes, including both ledger coefficients.**
For p!=0, use q=-p in (B4):

    0=[L_p,X_-p]=pX_0+(p/2)gamma_p I=(p/2)gamma_p I.

The representation is nonzero, so gamma_p=0. In particular gamma_1=0
and gamma_2=0 give `Delta c*=Delta c` and `8Delta c*=2Delta c`; hence
both differences vanish. Equation (B3) now gives every mixed bracket zero.
**BY** <1>4 and the two scalar equations. **QED.**

**Corollary F2-B0 [proven implication; full; category-free; ->R2].**
Exact conservation `[sum_j k_j,Qcal_N]=0` at every stage supplies X_0=0
by CA-91:125-139. Therefore the nearest-neighbour, standard-KS version
of F2(b) holds without parity. The same proof applies under asymptotic
ZC, or simply the limiting zero-mode equation. The assertion for every
finite-range density needs a correct longer-range current/Fourier identity;
it is not a consequence of calling the adjacent-current formula “standard”.

## Theorem F2-Cubic: cubic anomaly balance without parity or ZC

**Status: proven implication. Tags: (full; category-free; R2 conditional).**
This result removes current conservation as well as parity for the cubic
coefficient. It does not assert equality of the independent linear ledger
coefficients without the additional hypothesis in F2-B.

**ASSUME** the common two-family VR-1 hypotheses and the nearest-neighbour
standard KS prescription. Do not assume `[L_0,S_0]=0` or equal ledgers.

**PROVE** `c_L*=c_R*`. Consequently, if each family is separately in the
physical normalization `c_L=c_L*`, `c_R=c_R*`, then `c_L=c_R` as well.

**<1>1.** Equations (B1)-(B3) hold without using X_0=0: that hypothesis
was first used in F2-B <1>3. Thus

    C_mn=X_(m+n)+(1/2)delta_(m+n,0)gamma_m I,
    X_q=C_q0=C_0q,  X_0=[L_0,S_0].

**BY** F2-B <1>1-<1>2, with their assumption dependencies made explicit.

**<1>2.** Set `A_q=[L_0,X_q]`, `B'_q=[S_0,X_q]`. Before the q=0
specialization used in F2-B, Jacobi gives

    [L_p,X_q]=pX_(p+q)+A_(p+q)+(p/2)delta_(p+q,0)gamma_p I,
    [S_p,X_q]=-pX_(p+q)+B'_(p+q)+(p/2)delta_(p+q,0)gamma_p I.           (C1)

**BY** <1>1 and exactly the two unreduced Jacobi computations in
F2-B <1>3. No action of X_0 is set to zero.

**<1>3.** Double Jacobi determines a consistency identity among the X's.
For u=m+n+q, first compute

    [L_m,B'_(n+q)]=[X_m,X_(n+q)]+m B'_u+[S_0,A_u],
    [S_n,A_(m+q)]=-[X_n,X_(m+q)]-n A_u+[L_0,B'_u],
    [S_0,A_u]-[L_0,B'_u]=-[X_0,X_u].

**BY** Jacobi, (C1), and `[L_m,S_0]=X_m`, `[S_n,L_0]=-X_n`.
Now substitute (C1) into
`[[L_m,S_n],X_q]=[L_m,[S_n,X_q]]-[S_n,[L_m,X_q]]`.
The A_u and B'_u terms cancel, leaving

    [X_(m+n),X_q]=[X_m,X_(n+q)]+[X_n,X_(m+q)]-[X_0,X_u]
       -(mn/2)delta_(u,0)(gamma_m+gamma_n)I.             (C2)

The two scalar terms come from `-n[L_m,X_(n+q)]` and
`-m[S_n,X_(m+q)]`; scalar terms already inside inner commutators commute
and disappear. **BY** the displayed substitutions. All four-letter words
are defined on the same invariant D by VR-1.

**<1>4.** Put `F_n=[X_n,X_-n]` (this note-local F is not an A4 residual)
and q=-m-n in (C2). The term `[X_0,X_0]` is zero by antisymmetry, without
assuming X_0=0. Hence

    F_(m+n)=F_m+F_n-(mn/2)(gamma_m+gamma_n)I.            (C3)

In particular, suppressing I on scalars,

    F_2=2F_1-gamma_1,
    F_3=3F_1-2gamma_1-gamma_2,
    F_4=4F_1-2gamma_1-4gamma_2                   [m=n=2],
    F_4=4F_1-(7/2)gamma_1-gamma_2-(3/2)gamma_3   [m=1,n=3].

Equality of the last two expressions gives
`(3/2)(gamma_1-2gamma_2+gamma_3)I=0`.
**BY** (C3), using only the indicated integer indices.

**<1>5.** Directly from the defined cubic-minus-linear ledger,

    gamma_1-2gamma_2+gamma_3
      =[(1-16+27)(c_R*-c_L*)-(1-4+3)(c_R-c_L)]/12
      =c_R*-c_L*.

The common Hilbert space is nonzero, so this difference vanishes.
The final assertion follows by the two stated normalization equalities.
**QED.**

**Corollary F2-absent [proven implication; full; category-free; R2].**
If the limiting right stress is `S_n=t delta_(n,0)I`, its own two ledger
equations give `c_R*=0`, `c_R=24t` (CA-91:179-184). F2-Cubic therefore
excludes any nonzero left cubic anomaly even without parity. Moreover
X_0=0 automatically, so F2-B gives the equal linear ledger too. This
does not prove that the remaining left stress is scalar: that stronger
part of CA-91 Corollary 91.10 uses parity. No positive-energy conclusion
is smuggled into the present R2 statement.

## Proposition F2-Aalg: a formal obstruction to a Jacobi-only proof of (a)

**Status: negative, proven at the formal algebra layer only.
Tags: (full Fourier grading; category-free; diagnostic ->R2, no R2 reached).**
There is a nonzero *-Lie algebra with two zero-central-charge internal
Virasoro/Witt brackets, symmetric mixed brackets, a complex-linear parity,
and the required spatial grading, but with `[L_0,S_0]!=0`.
It has **no asserted positive Hilbert representation, microscopic densities,
or VR-1 certificate**. It refutes only an argument using those formal
identities alone. It is not the nearest-neighbour chain requested in F2(a).

**ASSUME/CONSTRUCT** the complex vector space

    g = span{L_n,S_n : n in Z} direct-sum V,
    V = direct-sum_(q in Z) C[t] X_q,

where the X_q are independent module symbols and V is abelian. Define

    [L_m,L_n]=(m-n)L_(m+n),
    [S_m,S_n]=-(m-n)S_(m+n),
    [L_m,S_n]=X_(m+n),
    [L_p,f(t)X_q]=(t+p)f(t+p)X_(q+p),
    [S_p,f(t)X_q]=(t+q)f(t)X_(q+p).                      (A1)

All sums are finite sums of polynomial-labelled basis symbols; no formal
infinite vector or distribution is being treated as a Hilbert vector.

**PROVE** these brackets satisfy Jacobi, admit the stated involutions and
grading, and have nonzero `[L_0,S_0]=X_0`.

**<1>1.** The L and S actions on V are representations of the Witt and
opposite-Witt brackets and commute with each other. At final index q+m+n,
the L-action commutator on f has coefficient

    [(t+m)(t+m+n)-(t+n)(t+m+n)]f(t+m+n)
      =(m-n)(t+m+n)f(t+m+n).

The S-action commutator has coefficient

    [(t+q+n)(t+q)-(t+q+m)(t+q)]f(t)
      =(n-m)(t+q)f(t).

The two compositions L_m S_n and S_n L_m both have coefficient
`(t+m)(t+m+q)f(t+m)`. **BY** (A1). This proves Jacobi for triples with
one entry in V; with two entries in V it is automatic because V is abelian.

**<1>2.** The L,L,S cocycle equation is

    [L_m,X_(n+k)]-[L_n,X_(m+k)]=(m-n)X_(m+n+k),

since its coefficient is `(t+m)-(t+n)=m-n`. The S,S,L equation is
`[S_m,X_(k+n)]-[S_n,X_(k+m)]=(n-m)X_(k+m+n)`, since its coefficient is
`(t+k+n)-(t+k+m)=n-m`. Pure L or S Jacobi is the ordinary Witt
polynomial identity. **BY** (A1) and these displayed computations.
Together with <1>1 this exhausts all generator triples, proving Jacobi.

**<1>3.** Define the conjugate-linear dagger and the complex-linear parity R by

    L_n^dagger=L_-n, S_n^dagger=S_-n,
    (f(t)X_q)^dagger=-conj(f(-t))X_-q,
    R L_n=S_-n, R S_n=L_-n,
    R(f(t)X_q)=-f(t-q)X_-q.                             (A2)

Here conj conjugates coefficients only and t is a real formal variable.
They square to the identity and commute. The mixed-bracket check is
`[L_m,S_n]^dagger=-X_-m-n=[S_-n,L_-m]`, and
`R[L_m,S_n]=-X_-m-n=[S_-m,L_-n]`. For the V actions,
dagger gives coefficients `(t-p)conj(f(-t+p))` for L and
`(t-q)conj(f(-t))` for S, equal to the reversed brackets.
Parity gives `-(t-q)f(t-q)` for the L action and
`-(t-p)f(t-q-p)` for the S action, equal to the exchanged actions.
The pure L/S brackets transform as required by their opposite signs.
**BY** substitution in (A1)-(A2); all cases are also polynomial-checked
in `checks/check_f2.py`.

**<1>4.** The assignment of degree -n to L_n,S_n and -q to `f(t)X_q`
is additive under every bracket in (A1). It defines a derivation P with
`[P,L_n]=-nL_n`, `[P,S_n]=-nS_n`, `[P,fX_q]=-q fX_q`.
Set `P^dagger=P`, `RP=-P`; these choices preserve (A2).
**BY** the displayed indices and direct substitution. This is a formal
momentum derivation, not a spectral logarithm or an implemented unitary.

**<1>5.** X_0 is a nonzero basis symbol of V. Thus the mixed zero bracket
is nonzero despite all the listed formal relations. **QED.**

The actual remaining obstruction is therefore analytic/microscopic: a proof
of F2(a) must use more than Jacobi, the adjoint *relations*, parity and
Fourier grading. A positive-inner-product realization of (A1) satisfying
the KS density identities is neither constructed nor ruled out here.

## Proposition F2-R: the finite-range current and the extra estimate

**Status: proven finite identities and a conditional R2 implication.
Tags: (full; category-free; finite identities / ->R2); categorical local
instances need L0 and their declared periodic representation.**
This makes explicit the finite-range qualification in CA-91:70-71.
The nearest-neighbour case is rho=1 and needs no added component estimate.

**ASSUME** translated self-adjoint densities with
`[k_j,k_l]=0` when the cyclic density-label distance exceeds a fixed rho,
and N>2rho. All subscripts are cyclic. Introduce note-local symbols

    C_(j,d)=i[k_j,k_(j+d)],             1<=d<=rho,
    Jcut_j=sum_(d=1)^rho sum_(ell=0)^(d-1) C_(j-ell,d),
    B_n^(d)=a_N sum_j z^(nj) C_(j,d),
    h_d(w)=sum_(ell=0)^(d-1) w^ell,
    Bcut_n=sum_d h_d(z^n)B_n^(d),
    L_n=E_n-Bcut_n, S_n=E_n+Bcut_n.                    (R1)

Jcut_j is the current across the cut between the density labels j,j+1.
It is self-adjoint and finite-range; no physical site position different
from the declared density-label origin is silently chosen.

**PROVE** (i) exact local continuity and integrated current,

    i[H,k_j]=Jcut_(j-1)-Jcut_j,
    Qcut=sum_j Jcut_j=sum_(j,d) d C_(j,d);              (R2)

(ii) the corrected KS Fourier identity,

    [E_m,E_n]=sum_d kappa^d_mn B_(m+n)^(d),
    kappa^d_mn=-i a_N(z^(nd)-z^(md));                  (R3)

(iii) if the corrected modes obey both common VR-1 certificates, each
`|B_n^(d)|_(s,1)<=M_(d,n,s)` uniformly in r, and the limiting zero modes
commute, then both ledgers agree and every mixed bracket vanishes. No
parity or finite site dimension is used in this implication.

**<1>1.** The difference of the two d-sums in Jcut_(j-1)-Jcut_j telescopes
to `C_(j-d,d)-C_(j,d)`. Sum over d; these are exactly the commutators
`i[k_(j-d),k_j]+i[k_(j+d),k_j]` in `i[H,k_j]`.
Summing Jcut_j over j counts every C_(j,d) exactly d times, including
across the cyclic seam. **BY** the finite sums in (R1), N>2rho and the
assumed range. This proves (R2).

**<1>2.** The pair `(j,j+d)` contributes
`z^((m+n)j)(z^(nd)-z^(md))[k_j,k_(j+d)]` to the energy bracket.
Multiply by a_N^2 and use `C=i[k,k]` to obtain (R3). Translating
`j-ell` in the Fourier sum of Jcut gives its coefficient h_d(z^n).
**BY** pairwise expansion and substitution. Scalars in E commute.

**<1>3.** With q=m+n, the mixed antisymmetry identity has coefficient

    r^d_(N,m,n)=4 kappa^d_mn-2(n-m)h_d(z^q).

The exponential Taylor remainder and a telescoping bound on h_d give

    |4kappa^d_mn-2(n-m)d| <= 2pi(m^2+n^2)d^2/N,
    |h_d(z^q)-d| <= pi|q|d(d-1)/N,
    |r^d_(N,m,n)| <= (2pi/N) [ (m^2+n^2)d^2
                                      +|n-m||m+n|d(d-1) ].              (R4)

**BY** `|exp(ix)-1-ix|<=x^2/2`, `|exp(ix)-1|<=|x|`, and summing
ell=0,...,d-1. These are the same elementary estimates used in CA-91:121.

**<1>4.** Expand the two internal brackets exactly as in F2-B <1>1.
Their difference from (B1) is
`sum_d r^d_(N,m,n) B_(m+n)^(d)-F^L_mn-F^R_(-m,-n)`.
Its (s,2) norm tends to zero by (R4), the finitely many component bounds,
A4 and `|A|_(s,2)<=|A|_(s,1)`. Thus (B1) holds in the limit.
Apply F2-B <1>2-<1>5 unchanged. Without the zero-mode assumption,
F2-Cubic still applies and gives equality of the cubic coefficients.
**QED.**

Exact conservation `[H,Qcut]=0` supplies the zero-mode equation because
`[L_0,S_0]=2a_N^2[H,Qcut]`. F2-G supplies loss-two finite mixed bounds.
For rho=1, B^(1)=B=(S-L)/2, so its component bound follows from A2.
For rho>1, bounds on the sum Bcut need not bound each summand by the
triangle inequality in reverse; this extra estimate is explicitly retained.
No general implication from finite range alone to these component bounds
is proved here. This is a concrete sufficient extension, not the universal
finite-range theorem as phrased in the brief.

## Part (c): an inverse spectral mechanism, and its exact boundary

### Proposition F2-Spec: arbitrary declared chiral targets admit nonlocal R2 cutoffs

**Status: proven implication from declared target data.
Tags: (chiral target, two-family algebra with right family zero; L4; R2).**
This is a general target-first construction. It supplies no local R0 tower
and reads no fusion/modular data. It is not a category-to-CFT algorithm.

**ASSUME** a declared nonzero positive-energy Virasoro representation
`(H,E=L_0,L_n)` with finite-dimensional energy eigenspaces, discrete
nonnegative spectrum, adjoint pairing, a common smooth domain containing
the finite-energy eigenspaces, and

    [E,L_n]=-nL_n,
    ||L_n v||<=a_n||(1+E)v||.                          (S1)

The fixed-mode bound (S1) is sourced, for the positive-energy Virasoro
representations under discussion, at
`references/cft-machine/coset-symmetry/CarpiWeiner2004/source.tex:714-747`.
Let nested finite-rank orthogonal P_r commute with E, tend strongly to I,
and contain the full spectral subspace E<=Lambda_r, where
`Lambda_r>=a 2^r` for some a>0. Use H_r=P_rH, inclusion isometries,
`K_r=(1+E|_(H_r))^p` for an integer p>1, and

    T_(r,n)=P_r L_n P_r|_(H_r),    Tbar_(r,n)=0.         (S2)

**PROVE** common VR-1 holds, with the left target ledger and zero right
ledger. Fixed-mode errors satisfy `e_(r,n,s)=O(Lambda_r^(1-p))` and
`q_(r,m,n,s)=O(Lambda_r^(2-2p))`. Thus a target with nonzero central
charge gives unequal ledgers outside the standard local KS class.

**<1>1.** A1 and finite adjoints hold because the P_r are nested spectral
commuting projections and the K's are restrictions of one (1+E)^p.
**BY** functional calculus and the target adjoints.

**<1>2.** On an energy-e eigenspace a mode has output energy e-n and norm
at most a_n(1+e). Consequently, for fixed n,s,

    ||K^s L_n K^(-s-1)|| <= a_n(1+|n|)^(ps),

since the remaining energy power is `(1+e)^(1-p)<=1`.
Different input energies give orthogonal output energies, so this bound
holds on their Hilbert direct sum. Compression by P_r is contractive in
every graph norm. **BY** (S1) and p>1. This is A2.

**<1>3.** The refinement defect is
`(P_(r+1)-P_r)L_nP_r`. It vanishes on input energies
`e<=Lambda_r-|n|`, since the output then belongs to P_rH. The preceding
bound on its remaining energy support is
`C_(n,s)(1+Lambda_r-|n|)^(1-p)` once Lambda_r>|n|.
This is summable in r; the finitely many earlier scales are harmless.
**BY** (S1), nesting, spectral containment and <1>2. This is A3.

**<1>4.** The finite residual is exactly

    -P_r L_m(1-P_r)L_nP_r+P_r L_n(1-P_r)L_mP_r.         (S3)

It vanishes below energy `Lambda_r-|m|-|n|`. Each two-mode product has
norm at most `C_(m,n)(1+e)^2` on energy e, and graph weights contribute
`(1+e)^(-2p)` up to a fixed shift ratio. Hence (S3) has (s,2) norm
`O(Lambda_r^(2-2p))`. **BY** expanding the compressed commutator,
the exact target bracket, and two applications of (S1). This is A4.

**<1>5.** VR-1 applies. On every fixed finite-energy vector the cutoff
operators eventually equal the target operators, so the limit is the
declared target, not an inferred CFT. The right family is identically zero.
**QED.**

This proof is a direct application of the compression/leakage mechanism in
CA-79:164-175 and VR-1, with an explicitly supplied target energy bound.
It proves no spatial locality of P_r or of (S2). In particular F2-Cubic
implies that nonzero-charge (S2) cannot also satisfy the vanishing KS
Fourier remainder used in (B1).

### Lemma F2-Kernel: the non-summable spatial cost of a spectral derivative

**Status: proven finite identity and fixed-separation limit.
Tags: (periodic Fourier discretization; category-free; finite ingredient).**
Use the AP grid of CONVENTIONS (w), even N, epsilon=2pi/N, and define
the spectral derivative matrix in position coordinates by

    D_(xy)=(1/N)sum_(r=-N/2+1/2)^(N/2-1/2) r exp(2pi i r(x-y)/N).

**PROVE** for integer d=x-y with 0<|d|<N,

    D_(xy)=-i(-1)^d/[2 sin(pi d/N)],   D_(xx)=0,
    epsilon D_(x,x-d) -> -i(-1)^d/d   (fixed d!=0).       (S4)

**<1>1.** The finite geometric series is
`sum_r exp(ir theta)=sin(N theta/2)/sin(theta/2)`.
Differentiate and evaluate at theta=2pi d/N. Multiplication by 1/(iN)
gives (S4); symmetry of the r-grid gives D_xx=0.
**BY** finite summation/differentiation, with no limiting interchange.

**<1>2.** Use `sin(pi d/N)/(pi d/N)->1` for the fixed-d limit.
Every separation has a nonzero coefficient, and the limiting absolute
coefficients 1/|d| are not summable: each dyadic block from 2^j to
2^(j+1)-1 contributes at least 1/2. **QED.**

Thus “decaying kernel” is accurate here; “quasi-local” must not be read as
an absolutely summable interaction. A position phase exp(pi i x/N)
changes the AP matrix into a circulant matrix using integer Fourier labels
r+1/2; this preserves coefficient magnitudes and the failure of finite range.

The table below gives the sourced fermion instance of F2-Spec, with finite
site dimension and the kernel (S4). Its modes are target spectral
compressions, **not certified to equal the KS modes of a chosen nonlocal
density/current prescription**. It therefore proves an outside-KS escape
mechanism, not sharpness of F2(b) while every other hypothesis is retained.

Dropping finite site dimension alone supplies no loophole in F2-B or
F2-Cubic once their common-domain identities exist: neither proof uses it.
An infinite-site-dimension example must identify which analytic/domain or
KS Fourier-identity assumption changes. None is constructed here; the
infinite-dimensional finite-stage version of VR-1 would itself need stated
domains. The unrestricted sharpness assertion F2(c) remains unproved.

## Local source audit of the broader chirality claim

**Status: source-local scope audit; tags: (full versus chiral; category-free;
no new R3 theorem).** Searches of local `references/` and `literature/md/`
included “chiral central charge”, “gravitational anomaly”, “thermal Hall”,
“Kitaev” and “Kapustin”; no network or source acquisition was used.

- `references/lattice-symmetry/LiLinMcGreevyShiKim2024/source/revised-emergence-of-virasoro.tex:738-746`
  explicitly states a standalone one-dimensional tensor-product obstruction
  and cites Witten/Hellerman. It does not give the needed theorem with
  precise microscopic hypotheses there. Its `:1046` explains the thickened
  edge and separately says its proposed density has no proved stress OPE.
  The cited Hellerman 2101.03320 source was not found by filename/identifier
  search in the local ground-truth trees. This is a concrete acquisition
  gap, not permission to import the theorem from memory.
- `literature/md/1903.12334/1903.12334.md:195-197` presents a boundary-bulk
  consistency principle with “should satisfy”, rather than the requested
  microscopic theorem.
- `references/lattice-symmetry/Jones2017NoGo/source/nogo.tex:586-622`
  proves a specified refinement/rotation-discontinuity obstruction; its
  restricted family is explicit at `:594-599`. It is not a general
  finite-range Hamiltonian no-go.
- `references/lattice-symmetry/ZiniWang2018/source/main.tex:125-129,449-462`
  treats a chiral scaling-limit construction with boundary geometry and
  separately describes the general case as conjectural. It cannot be
  substituted for the present periodic two-family assumptions.

The broad claim in F2(b) introduced by “equivalently” is not established as
an equivalence: a physical lattice continuum limit need not come equipped
with both *standard* KS VR-1 certificates on the same retained system,
and arbitrary finite range needs the explicit estimate in F2-R. Conversely
R2 by itself gives neither positive energy nor local conformal algebras
(`virasoro_routes.md:154-177`). No inference of nonlocality from a fusion
constraint is made; F2-B and F2-Cubic use only the stated local commutator
identities and apply to constrained fusion spaces satisfying them.

## Verification and rejected routes

Two research collaborators and an independent skeptical reviewer checked
the substantive new arguments using the requested GPT-6.1, xhigh setting.
The reviewer independently checked F2-G, F2-N, F2-B, F2-Cubic, F2-Aalg,
F2-Spec and F2-Kernel; the second collaborator also checked every sign
and the range qualification in F2-R. Their reports were checked against
the equations and local sources before incorporation. No reviewer wrote
outside this directory, or any files at all.

`checks/check_f2.py` checks exact polynomial Jacobi/dagger/parity identities,
central bookkeeping, the cubic consistency calculation, an independent
16-by-16 nearest-neighbour KS matrix identity, and genuine cyclic shifts.
`checks/check_range_and_kernel.py` checks the range-two continuity/Fourier
identities and spectral kernel with absolute tolerance 1e-10 and matrices
of dimension at most 128. Run commands, versions, raw outputs and three
rejected mutations are in `checks/README.md`; both unmutated scripts pass.
These are finite invariant checks, not numerical evidence for an unknown
continuum limit.

Rejected routes: a branch choice cannot fix F2-N; a nonzero formal X_0 is
not a positive-Hilbert lattice counterexample; a moving high-energy defect
cannot violate ZC while its limiting commutator vanishes under full A3
(F2-G); a scalar-field heuristic for the formal cocycle lacked a common
operator domain and was discarded. No large chain search or unverified
spectral fit was substituted for proof. The complete F2(a) remains open.

## Results ledger

- F2(a), automatic loss-two ZC under its full stated hypotheses — **conjectural**: neither proved nor refuted; no actual nearest-neighbour KS counterexample constructed.
- F2-N, automatic current–spectral-log identification — **negative**: all logarithm branches fail in an exact genuine-translation tower; its ZC nevertheless holds.
- F2-G, finite (s,2) ZC iff limiting zero-mode commutation under common A1-A3 — **proven**: explicit summable word-tail bound; strengthens CA-91's sufficiency-only statement.
- F2-B, parity-free equality of both ledgers and all mixed commutation given limiting C_00=0 — **proven**: settles standard nearest-neighbour F2(b), since conserved total current supplies C_00=0.
- F2-Cubic, cubic ledger balance without parity or current conservation — **proven**: also gives c_L=c_R if each family's c=c* normalization is assumed.
- F2-absent, absent right stress excludes nonzero left cubic anomaly without parity — **proven**: scalarity of the remaining left stress is not concluded at R2.
- F2-Aalg, formal Jacobi/dagger/parity/Fourier grading force X_0=0 — **negative**: explicit formal *-Lie algebra; no positive-Hilbert/KS realization asserted.
- F2-R(i)-(ii), finite-range cut-current and Fourier identities — **proven**: exact for fixed rho and N>2rho.
- F2-R(iii), finite-range parity-free balance — **conditional**: component graph bounds suffice; not derived from finite range alone.
- F2-Spec, inverse spectral cutoff with unequal left/right ledgers for a nonzero target ledger — **proven** from a declared positive-energy target and (S1); an R2 construction outside the local KS class.
- F2-Kernel, spectral derivative has non-summable 1/r spatial tail — **proven**: exact finite formula and fixed-separation asymptotic.
- General finite-range, finite-site physical lattice chirality no-go — **conjectural** in this record: not equivalent to the proved KS-specific implication.
- F2(c), sharpness under dropping only range or only site dimension while retaining every other hypothesis — **conjectural**: the proved spectral mechanism also changes the stress prescription; no infinite-site-only example supplied.
- Local source audit — **proven** as an audit of the displayed passages: a nearby anomaly assertion is local, but its applicable primary microscopic theorem remains a source gap.

## Layer tags

| Statements / setting | Data layer | Rung reached | Rung claimed |
|---|---|---|---|
| F2-G; any common two-family system | category-free | R2 implication from A1-A3 | same |
| F2-B, F2-Cubic, F2-absent; full periodic KS | category-free plus supplied certificates | conditional R2 restrictions; no new categorical instance | R2, not R3 |
| F2-N; full zero-density tower | L0 unit multiplicities | trivial R2 counterexample to the logarithm inference | no nonzero CFT |
| F2-Aalg; full Fourier grading | category-free | formal algebra only, no Hilbert R2 | diagnostic ->R2 |
| F2-R; full finite-range representation | category-free; L0 for a categorical realisation | finite identities, conditional ->R2 | no universal finite-range theorem |
| F2-Spec; declared chiral target with zero right copy | L4, not bare L0/L2 | inverse R2 cutoff; no local R0 supplied | no category-derived R3/R4/R5 |
| F2-Kernel; periodic spectral matrix | category-free | finite ingredient | explicit failure of finite range |
| Original F2(a), general physical no-go, sharp F2(c) | declared microscopic data; analytic gaps remain | none newly certified | conditional R2 / broader R3 interpretation |

## What this gives the integration

The **(full; category-free; R2 conditional)** cell is sharpened at the same
rung. CA-91's cubic ledger equality needs neither parity nor current
conservation. Its equal-ledger hypothesis can be removed entirely from
the mixed-bracket reduction: with two standard KS certificates, all
mixed brackets vanish iff the limiting zero modes commute, and in that
case both ledgers agree. F2-G makes this equivalent to finite ZC and
provides loss-two bounds on every mixed bracket in terms of A3 tails.

CA-79 and LC-4 may therefore request **one zero-mode certificate** for
mixed commutation, without a separate parity/equal-ledger certificate.
Under physical c=c* normalization the central-charge balance already
follows from the two certificates and the KS Fourier identity alone.
CA-89's common-system transfer can use these conditional conclusions;
none supplies its missing Ward-to-operator estimate or any chain's A2-A4.
F2-R provides a precise finite-range current and the extra estimate needed
to transfer this conclusion beyond adjacent densities.

**Definition 88.1's S_ch source gap is narrowed, not closed.** A nonzero
net cubic anomaly is now excluded in the certified standard-KS setting
without parity. A local source discussing the broader anomaly obstruction
has been identified, but its primary theorem and the bridge to arbitrary
fusion-space lattice limits have not been imported/proved. Chiral subnets,
boundary/open-chain targets and changed stress/retention prescriptions are
not excluded. No cell moves up a rung, no category-faithful construction
is obtained, and R1/R3/R4/R5 still need their own compatible certificates.

## Open problems

1. **Automatic zero-mode lemma (original F2(a)).** For the full stated
   nearest-neighbour KS tower prove `[L_0,S_0]=0` on D, or construct a
   positive-Hilbert nearest-neighbour tower violating it. F2-G then settles
   the requested (s,2) norm statement in either direction. A proof must use
   positive-Hilbert realizability or further microscopic information:
   F2-Aalg rules out a purely formal Jacobi/star/grade/parity proof.
2. **A usable current–momentum hypothesis.** Supply a justified retained
   carrier/control for which CA-91(12) holds, or give a genuinely weaker
   commutator estimate. F2-N proves that no branch-selection lemma alone
   can establish (12) on all towers in F2(a).
3. **Linear ledger without ZC.** After F2-Cubic, determine whether the
   remaining linear difference is forced to vanish by the full microscopic
   hypotheses. Do not identify c with c* unless normalization is declared.
4. **Finite-range analytic estimate.** For the currents (R1), prove that
   the coefficient-weighted remainder in F2-R <1>4 tends to zero on the
   common core. Uniform component graph bounds suffice; they remain an
   additional obligation for rho>1.
5. **Sharp long-range and infinite-site cases.** Identify the actual
   density/current stress for a nonlocal chiral regulator and compare it
   to (S2), or construct an infinite-site-dimension example with all domain
   hypotheses. The present inverse cutoff does not settle either stronger
   claim with the other assumptions unchanged.
6. **Primary anomaly theorem and physical completion.** Acquire and check
   the cited Hellerman source or another applicable theorem when network
   acquisition is permitted. State its locality/factorization/scaling-limit
   assumptions, then verify them for the proposed tower. Positive energy,
   integrated symmetry, local conformal algebras and fidelity remain
   distinct from the R2 commutator statement.

## Examples table

| Instance | Tags and established fact | Exact limitation |
|---|---|---|
| Any C, O=1 direct-sum 1, zero densities | (full; L0; trivial R2): F2-N, every log has norm >=N/2 | ZC=0; not a counterexample to F2(a) |
| Unit-multiplicity matrices, arbitrary asymmetric density, N=4 | (full; L0; finite): exact unequal-ledger Fourier identity | No VR-1/continuum assertion |
| Unit-multiplicity matrices, density commutation range two, N=7 | (full; L0; finite): cut continuity/Fourier checks, max error 6.98e-15 | Finite oracle only; no graph bounds inferred |
| Polynomial module F2-Aalg | (formal full grading; category-free; no R2): X_0!=0 with dagger/parity | No positive Hilbert or microscopic KS realization |
| Declared complex chiral fermion sea, N Fourier modes | (chiral target; L4; inverse R2): F2-Spec gives c_L=c_L*=1, right ledger 0; N two-state sites with kernel (S4) | Infinite range and target-compressed stress; no standard-KS density/current match or faithfulness to arbitrary C |

**Verification of the last row [example only].** Use the continuum
half-integer shifts `B_n e_r=(r-n/2)e_(r-n)` and the negative sea of
CONVENTIONS (w). Their normal-ordered complex CAR representation has
c=c*=1, h=0 (`references/text/CFTFromLatticeFermions.txt:879-892,2790-2823`;
the finite Schwinger sum is already proved in
`cft_machine/benchmarks/fermion/PROOF.md:78-115`, not re-derived here).

Let P_N retain exactly the states with no particle/hole excitation outside
the N-mode window. Its space is the full exterior Fock space on N modes,
of dimension 2^N; choosing an ordered occupation basis identifies it with
N two-state sites. The Fourier transform changes the CAR site basis but
not this dimension. Negative occupied modes have their sea energy
subtracted, so `E_N=sum_r r(a_r^dagger a_r-1_(r<0))` is the sum of the
positive costs |r| of particles and holes. An excitation outside the
window costs at least N/2+1/2; hence P_N contains every E<=N/2 state,
commutes with E, and is nested under filled-sea embeddings. Along dyadic
N, these are exactly F2-Spec's projection hypotheses. The source's
positive-energy mode bound applies sectorwise with the same c=1 constant
(Carpi-Weiner:729-745); the direct-sum bound follows by orthogonality.
Thus F2-Spec certifies these cutoffs, not just convergence on sampled vectors.

The spatial Hamiltonian matrix is (S4), or its circulant phase conjugate.
Second quantizing the one-particle phases `z^(r+1/2)` gives U_N^N=I and
the required opposite Fourier covariance (the right family is zero);
it commutes with the energy control. In the ordered occupation basis,
moving a fermion between two sites contributes the exterior-algebra sign
`(-1)^(sum of intermediate occupations)`, an operator on the intervening
interval. Thus the qubit presentation also has unbounded-range strings;
no claim of spin-local finite range is made. This is a concrete finite-site,
nonlocal, target-first mechanism; its spectral modes have deliberately
changed the KS-prescription hypothesis. Unit multiplicities allow the
same finite matrices in any C, but this ignores C and supplies no R4.

## Sources used

- `CONVENTIONS.md:1505-1543,1577-1593`: modes, layer tags, parity/KS notation.
- `report/sections/91_parity_and_chiral_delineation.tex:64-163,223-246`:
  hypotheses, mixed-bracket reduction, spectral-log gap and named next lemma.
- `report/sections/89_ward_ks_transfer.tex:49-61,86-99,187-205`:
  graph calculus, control warning and two central coefficients.
- `report/sections/81_cft_machine_oar_contract.tex:91-120` and
  `cft_machine/research/virasoro_routes.md:55-177`: VR-1 and its boundaries.
- `report/sections/88_layered_targets.tex:53-125`: settings and target grid.
- `explorations/2026-10-22-astra-r2/E2-parity-and-chirality/NOTE.md:292-420,794-817`;
  `REVIEW.md:89-101,179-212,214-252`; `INTEGRATION.md:123-131`: prior proof and gaps.
- `references/lattice-symmetry/GransSamuelssonEtAl2020/source/Linnea11.5.tex:791-822`:
  energy/current KS prescription, not a general current–translation theorem.
- `report/sections/79_ks_shell_and_refinement_defect.tex:52-81,164-175`:
  finite KS identity and compression/leakage formula.
- `references/text/PenneysUnitaryFusionCategories.md:219-237,442`:
  orthogonal sums and the simple unit for the general-C multiplicity test.
- `references/cft-machine/coset-symmetry/CarpiWeiner2004/source.tex:714-747`:
  representation scope and energy bound (uniform in lowest weight at fixed c).
- `references/cft-machine/coset-symmetry/SOURCES.md:3-36`:
  provenance and representation-scope caution for that source.
- `references/text/CFTFromLatticeFermions.txt:879-892,1843-1889,2790-2823,3480-3499`:
  complex normal ordering, momentum-cutoff maps/nonlocality, c=1 sea target,
  source common-core construction; not an assertion that (S2) is its finite sine KS prescription.
- `references/cft-machine/fermion/SOURCES.md:1-37`:
  source registration and anchors; `CONVENTIONS.md:830-869`: AP/Fourier/CAR conventions.
- `cft_machine/benchmarks/fermion/PROOF.md:12-17,78-115`:
  existing continuum-shift and Schwinger-sum derivations used only in the example.
- `references/lattice-symmetry/LiLinMcGreevyShiKim2024/source/revised-emergence-of-virasoro.tex:738-746,1046`:
  nearby anomaly assertion and its limitation; registration in
  `references/lattice-symmetry/SOURCES.md:1895-1956`.
- `references/lattice-symmetry/Jones2017NoGo/source/nogo.tex:586-622` and
  `literature/md/1903.12334/1903.12334.md:195-197`: scope of the other nearby no-go passages.
- `references/lattice-symmetry/ZiniWang2018/source/main.tex:125-129,449-462`:
  boundary/chiral scaling-limit scope, not a periodic two-family no-go.
- `references/lattice-symmetry/SOURCES.md:9-36,277-306,966-1044`:
  Koo-Saleur, Zini-Wang and Grans-Samuelsson source registration.
- `references/lattice-symmetry/KooSaleur1993/source/9312156.tex:428-450`:
  background stress/metric discussion read for scope; not used as a general anomaly theorem.
