# F2 — Zero modes and lattice chirality without parity

2026-10-25. Initial all-open research ledger written within ten minutes
of the 05:04 UTC start; updated after each proved result. Work in progress.
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
Apply F2-B <1>2-<1>5 unchanged. **QED.**

Exact conservation `[H,Qcut]=0` supplies the zero-mode equation because
`[L_0,S_0]=2a_N^2[H,Qcut]`. F2-G supplies loss-two finite mixed bounds.
For rho=1, B^(1)=B=(S-L)/2, so its component bound follows from A2.
For rho>1, bounds on the sum Bcut need not bound each summand by the
triangle inequality in reverse; this extra estimate is explicitly retained.
No general implication from finite range alone to these component bounds
is proved here. This is a concrete sufficient extension, not the universal
finite-range theorem as phrased in the brief.

## Results ledger

- F2(a), loss-two zero-mode certificate from the stated assumptions — open.
- Current–momentum identification from F2(a)'s hypotheses — negative (F2-N); all branches fail even with genuine site translation, while ZC remains true in that example.
- Equivalence of finite (s,2) ZC and limiting zero-mode commutation under A1-A3 — proven (F2-G), with explicit summable-tail bound.
- Limiting zero-mode commutation from the KS algebra alone — open.
- Formal Jacobi/*/parity/Fourier-grade identities alone force the zero mode — negative (F2-Aalg); not a positive-Hilbert or KS counterexample.
- F2(b), parity-free equality of both ledgers for standard nearest-neighbour KS and commuting limiting zero modes — proven (F2-B); applies in particular to conserved total current.
- Finite-range cut-current identities and extension under component graph bounds — proven / conditional respectively (F2-R); component bounds remain extra when rho>1.
- General finite-range finite-site lattice chirality obstruction — open.
- F2(c), certified escape mechanisms and exact hypothesis separation — open.
- Local gravitational-anomaly source audit — open.

## Layer tags

| Setting | Data layer | Rung reached | Rung claimed |
|---|---|---|---|
| full/periodic, both standard KS families | category-free plus supplied common VR-1 system | none newly reached | R2 implications |
| categorical finite ingredients | L0 plus declared local representation and density | none newly reached | ->R0 / ->R2 |
| general chirality obstruction | hypotheses to be audited | none | R3-level interpretation only if separately justified |

## What this gives the integration

Pending. Target cell: CA-88 (full; category-free; R2 conditional), CA-91's
zero-mode and parity hypotheses. No promotion of a categorical instance.
Definition 88.1's S_ch source gap is currently untouched.

## Open problems

All proof-plan obligations are currently open; update after each proved step.

## Examples table

| Instance | Role | Status |
|---|---|---|
| General C, any declared periodic local representation | Main scope | No example-specific assumption |
| Small exact matrices, if used | Falsify algebraic inference, not certify CFT | Pending |

## Sources used

- `CONVENTIONS.md:1505-1543,1577-1593`: modes, layer tags, parity/KS notation.
- `report/sections/91_parity_and_chiral_delineation.tex:64-163,223-246`:
  hypotheses, mixed-bracket reduction, spectral-log gap and named next lemma.
- `report/sections/89_ward_ks_transfer.tex:49-61,86-99,187-205`:
  graph calculus, control warning and two central coefficients.
- `report/sections/81_cft_machine_oar_contract.tex:103-129` and
  `cft_machine/research/virasoro_routes.md:55-177`: VR-1 and its boundaries.
- `report/sections/88_layered_targets.tex:53-125`: settings and target grid.
- `explorations/2026-10-22-astra-r2/E2-parity-and-chirality/NOTE.md:292-420,794-817`;
  `REVIEW.md:89-101,179-212,214-252`; `INTEGRATION.md:123-131`: prior proof and gaps.
- `references/lattice-symmetry/GransSamuelssonEtAl2020/source/Linnea11.5.tex:791-822`:
  energy/current KS prescription, not a general current–translation theorem.
