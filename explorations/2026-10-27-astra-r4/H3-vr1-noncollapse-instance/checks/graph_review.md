# Independent hostile review of the whole-carrier certificate

**Pillar P4.** Category-free analytic calibration; one complex chiral CAR
family on the AP circle. The object being reviewed is a nonzero instance of
VR-1, not a category-to-CFT construction. No network access or repository
commits were used. This reviewer changed only the three `graph_review*`
files in this exploration's `checks/` directory, with explicit parent
authorization for the reproducible supplemental script and output.

**Verdict:** the whole-carrier A1--A4 proof withstands review. Integer p=2
works, real p>1 works, and p=1 fails A3 for the stated tower. No substantive
analytic blocker was found. The separately reviewed same-system
two-component identification is accepted in section 7 below.

## 1. Ground truth and scope

The source formula is the **modified, no-wrap** complex-CAR mode:
`references/text/CFTFromLatticeFermions.txt:3379--3414`, particularly
Eqs. (197)--(199). Root `CONVENTIONS.md:830--851` fixes orthonormal momenta,
circle length 2pi, the shift r->r-n and sea S=1_(r<0). Thus no hidden factor
2pi or change of chirality appears in the reviewed scalar coefficient.

Normal ordering and the complex-CAR cocycle are exactly source
`:848--855,881--892`. The Majorana cocycle is one half, by `:892`.
The source itself gives c=1 for the complex NS chiral factor at
`:2794--2823`. This review does not turn that source's fixed-core theorem
into a whole-carrier estimate: Lemma Q and the global coefficient estimates
are the new local derivation that supplies the stronger statement.

VR-1 hypotheses are `cft_machine/research/virasoro_routes.md:55--76`.
The common-domain conclusions and explicit boundaries are `:78--82` and
`:160--177`. In particular, auxiliary K is allowed; it need not be the
physical Hamiltonian. Substitution of sine energy would invalidate A1.

## 2. Schur argument and exact energy shift

ASSUME the finite sea excitation representation and the shift coefficient
bound in graph_certificate, Lemma Q. PROVE the claimed bound.

<1>1. In physical occupations, E=sum r c_r^*c_r - sum_(r<0)r. A permitted
move r->r-k changes E by -k. For k=0 the subtraction is scalar. Thus
`[E,D]=-kD`, including pair creation and pair annihilation. This conclusion
does not assume excitation number preservation.

<1>2. Same-sign positive moves require an input particle; same-sign negative
moves require an output hole already present in the input. These two lists
charge distinct particle/hole excitations. Their absolute coefficient sum
is bounded by the asserted constant times E^q, using q>=1 and
`sum x_j^q <= (sum x_j)^q`. At most |k| edges cross zero; their contribution
is independent of the number of other excitations. At k=0 normal ordering
cancels the whole filled-sea diagonal before this estimate is made.

<1>3. The adjoint row estimate incurs a coefficient factor
`(1+|k|)^q`, because d(r+k) replaces d(r). In the weighted matrix, write
Qout^t/Qin^(t+q) using the **output** energy for the row bound; the additional
ratio costs `(1+|k|)^(t+q)`. Consequently column and row bounds are
`HF(1+|k|)^t` and `HF(1+|k|)^(t+2q)`. Their geometric mean is exactly B.
The proof does not silently omit a row factor or grow with Fock dimension.

<1>4. QED by the row/column Cauchy--Schwarz estimate. Each occupation state
has only finitely many allowed transitions for fixed k, also in the infinite
finite-excitation carrier, so completion is legitimate.

## 3. Missing edges, refinement and exponent threshold

The global cubic estimate covers every omitted input/output edge: at
M>=4(|n|+1), either missing window indicator implies |r|>=M/4, which implies
epsilon^2(1+|r|)^2>1. Interpolation between the linear and cubic estimates
therefore applies to the UV rows as well as the interior. There is no
fixed-core substitution here.

Refinement is exterior-Fock zero padding of **excitations**. Negative new
physical modes are filled, by source Eq. (9), `:752--755`. It preserves the
linear excitation energy exactly. The physical CAR intertwining equations
`c_fine(r)J=Jc_coarse(r)` and their adjoints were checked directly for all
coarse labels in M=4->8. This rejects the empty-physical-sea interpretation.
Source CAR scaling is unital (`:1855--1857`), whereas the many-body corner
map a->JaJ* is not; the certificate distinguishes them correctly.

For A3, coefficient degree 1+alpha fits one graph loss p exactly when
alpha<=p-1. Taking alpha=min(p-1,2) gives a summable dyadic bound for every
p>1. At p=1, the n=0 one-particle UV state r=M/4-1/2 has normalized defect
converging to `2(sqrt(2)-1)/pi>0`; graph-order factors cancel because n=0.
It follows that **every** valid A3 majorant has nonzero liminf. Hence p=2
is the least admissible integer. This is necessity for this declared
linear-energy power family, not an obstruction to all conceivable controls.
The added optimal-rate argument is also correct: the same UV vector forces
M^(1-p), and a fixed positive label forces a nonzero epsilon^2 term.

## 4. All-bracket A4

The expansion of `[A_m,A_n]-(m-n)A_(m+n)` into four delta terms and the
linear delta term is exact on finite support. The two continuum quadratic
product coefficients differ by `(m-n)(r-(m+n)/2)`; the corrected citation
is `cft_machine/benchmarks/fermion/PROOF.md:40--45`.

Each delta term has degree3 times degree1 and rate epsilon^2 globally,
including intermediate cutoff edges. Lemma Q with q=4 therefore fits two
graph losses for p=2. The displayed H_mn accounts for the shifted input
label in each product. For 1<p<2, alpha=2p-2 replaces degree4 by degree2p.
The explicit real-p H and Z constants in the revised certificate are valid.

The cocycle sign agrees with source Eq. (27). For m>0,n=-m, its surviving
trace is the positive sum of m crossing coefficients squared. The continuum
sum is `(m^3-m)/12`, so both ledger coefficients are 1. Nonopposite shifts
have zero diagonal trace. The degree and scalar bounds give the claimed
all-bracket rate; the finite initial-scale bounds supplied in the revision
are sufficient. No vacuum-only conclusion replaces A4.

## 5. Non-collapse and remaining wording issue

The fixed two-excitation direction w is transported exactly, has E=2,
and detects T_-2 Omega with limiting amplitude 1/sqrt(2). In the added
diagonal witness v=(Omega+w)/sqrt(2), only T_-2 acting on Omega contributes
to `<v,T_-2 Q^-p v>`, so the value is b_M/2. The stated uniform kappa
follows from the elementary sine chord bound. This is a fixed coarse-vector
witness, unlike the deliberately moving UV vector used to refute p=1.

Minor wording correction requested: graph_certificate.md's phrase
“contains exactly two particle/hole pairs” should say “is a superposition
of two one-particle/one-hole configurations”. Each summand has excitation
number two; there are not two pairs simultaneously in each summand.

Theorem A in NOTE was also reviewed: its bounded weighted mode, complex
polarization converse, tail certificate and bracket propagation from one
nonzero mode to all nonzero-index modes are valid under VR-1. No argument
there establishes positive energy or a positive genuine cubic coefficient.

## 6. Reproducible checks and their limits

`python3 checks/graph_check.py` passed from this directory. All three
mutations failed at their intended invariants: wrap at line116,
normal-order at line115, energy at line120 (line numbers at review time).
The output already records finite norms; those samples alone prove no rate.

Reviewer supplemental run:

```sh
python3 checks/graph_review_check.py > checks/graph_review_check.json
```

Passed: 224 saturated signed polynomial Schur checks (q=1,1.5,2,4;
t=0,0.5,2,4; full M=4,8 carriers), 8 physical CAR generator intertwiners
for M=4->8, and 65,856 scalar all-bracket majorant checks, including
missing-window edges and alpha=0.5,1,2. The supplemental script reuses the
reviewed basis constructors; it independently constructs coefficient
families and the scalar A4 products. The infinite-scale proof remains the
analytic argument above, not these finite observations.

## 7. Separate audit of `same_system.md`

**Verdict: accepted.** The file's explicit two-component construction closes
the WS-1/mode representation identification at the stated nonlocal
sharp-momentum layer. The actual finite microscopic states remain P_Q;
the VR-1 maps are the GNS maps of their compatible **horizontal row
limits**, precisely as required by WT-1. This does not assert an isometry
intertwining the distinct finite Dirac vacuum vectors.

The fixed U and p_± agree with source equations (61)--(62),
`references/text/CFTFromLatticeFermions.txt:1178--1186`. Direct multiplication
gives the two complementary seas; U commutes with every momentum inclusion.
The block diagonal limiting covariance determines the even product state
by the source determinant formula. The explicitly stated parity factor
ensures that odd CAR generators from the two factors anticommute. Their
quadratics are even and therefore act as ordinary commuting tensor factors.

The excitation-padding implementation intertwines every old physical CAR
generator and sends vacuum to vacuum. On its cyclic orbit it is therefore
exactly WT-1's GNS map, with no unresolved phase. Normal-order traces are
invariant under the same U, so the microscopic source projected quadratic
becomes precisely the certified operator on the first factor.

The spectator extension uses E_total, rather than silently using a control
that ignores spectator energy. Each active row/column bound remains valid
because E_active<=E_total, and exact energy shifts persist. Thus full-carrier
A1--A4 and the fixed A5 witness extend with the displayed constants.
Momentum reflection carries the second source family to the first; its
cocycle sign is positive and agrees with source equation (145),
`:2372--2384`. Mixed quadratic commutators vanish at every finite scale.

Two presentation clarifications were sent to the author, without affecting
acceptance: the interleaved matrix becomes A tensor diag(1,0), then A
direct-sum 0 after the canonical regrouping; and positivity of the limiting
zero mode can be made explicit by pointwise f_0^M(r)->r on every finite
excitation configuration, giving the positive linear excitation energy.
The distinction from finite Dirac vacua and the spatial nonlocality caveat
are explicit and correct (`same_system.md:121--137`; source
`:1198--1205,1892--1894`). No categorical R2 or R3 conclusion follows.
