# H3 — Non-collapse and a uniform graph-norm certificate

Initial all-open ledger written within the first ten minutes on 2026-10-27
(session began 13:10 UTC); updated as the proofs below were established.
**Outcome:** non-collapse and a whole-carrier VR-1 certificate are proved,
with a common Wilson/GNS realization. The positivity-only central-charge
clause remains conditional on a precisely stated domain lemma. No general-C
cell advances. Proofs are structured mathematical proofs, not proof-assistant
certificates; independent skeptical reviews and finite checks are in `checks/`.

## Scope and statements addressed

**Pillar P4:** strengthen the category-free VR-1 OAR contract by a detectable
non-collapse witness, and test the whole-Hilbert graph estimates on the
existing sourced calibration. The general construction for arbitrary unitary
fusion C and pointed site object remains the object of study.

**Tags:** any setting for the operator theorem, periodic/full per declared
family for its KS application; category-free analytic data, or L0 plus declared
categorical densities, states, refinements and controls; conditional R2,
with no R3–R5 conclusion. A one-family circle calculation does not assert a
full two-family theory. CA-88's same-system requirement remains explicit.

**A. Non-collapse theorem.** Under VR-1 A1–A4, a uniform positive
lower bound on a fixed transported coarse-vector matrix element of a weighted
nonzero mode implies nonzero limiting stress. Determine an eventual converse,
show precisely why the CA-95/100 collapsing families fail the witness, and
audit the extra hypotheses needed for a positive genuine central charge.

**B. Graph certificate.** Formulate uniform finite-window quadratic
estimates on the entire excitation Fock space, with compatible control
K=(1+E)^p. Determine the threshold in p for the one-loss refinement defect,
all-bracket two-loss residuals, and a non-collapse witness. The specific
source-modified complex CAR specialization belongs in `checks/` and the
examples table; it is a check of the contract, not a categorical result.

**C. Same-system identification.** Compare the Wilson row limit,
its GNS refinements, and the representation carrying the quadratic modes.
Prove the identification or isolate it as a sharp missing lemma.

**D. Boundary of the result.** Record the categorical density compilation,
Ward and periodic KS data still needed for a general C-chain at R2.

## Local conventions for this exploration

Existing conventions (s), (v), (w), (af), (ap), (aq), (ar) are retained.
Inner products are linear in the second slot, as in (al). Any additional
notation is declared here or in its scoped supplemental proof before use: the user restricts edits to this
directory, so no global convention or report file is modified. In particular,
the two central coefficients c,c* are not silently identified.

## Proofs

### A. A finite certificate for non-collapse

**Theorem A [proven implication; any; category-free; nontrivial R2 given
A1–A4].** ASSUME VR-1 A1–A4 exactly as in
`cft_machine/research/virasoro_routes.md:55–82`. Write
`d_(r,n)=sum_(j>=r)e_(j,n,0)`. The control K is the block-diagonal positive
operator on the inductive limit constructed there, not an assumed physical
Hamiltonian. For a unit vector v in H_a, write v_r=J_(r<-a)v and

`q_r(v,n)=<v_r,T_(r,n) K_r^(-1) v_r>`.

**A5:** there are n≠0, a, such a v, κ>0 and r₀≥a with
`|q_r(v,n)|≥κ` for every r≥r₀. One may absorb the finite initial prefix by
starting the tower at r₀. PROVE A5 is equivalent to nonzero limiting stress
(some T_n, n≠0, is nonzero), and a sufficient finite certificate is
`|q_a(v,n)|>d_(a,n)`. In fact every nonzero-index mode is then nonzero.

<1>1. B_n=T_n K^(-1) extends to a bounded operator on H, and its microscopic
weighted matrix elements have the error bound

`|q_r(v,n)-<i_a v,B_n i_a v>| ≤ d_(r,n)`.

  <2>1. A1 implies `K_r^(-1)v_r=J_(r<-a)K_a^(-1)v` by diagonalizing the
  finite self-adjoint controls on the reducing embedded subspaces. BY A1
  and VR-1's graph-space construction, `:84–109`.

  <2>2. Apply the VR-1 tail bound at graph order zero to K_r^(-1)v_r.
  Its order-one norm is exactly 1. Pair the output with the unit v_r.
  BY `virasoro_routes.md:111–112` and Cauchy–Schwarz. A2 gives the bounded
  extension B_n with norm at most C_(n,0). No moving-vector compactness is used.

<1>2. A5 implies B_n≠0 and T_n≠0 on the common invariant domain D.
BY <1>1, the q_r converge to a scalar with modulus at least κ; i_a v and
K^(-1)i_a v belong to D. Thus the representation furnished by VR-1 is
nontrivial. No assertion about positivity or group integration is used.

<1>3. Conversely T_n≠0 implies A5 for a transported coarse vector.

  <2>1. B_n≠0: if B_n vanished, T_n would vanish on H_1 and hence on D.
  The algebraic coarse union U is dense in H. If `<w,B_nw>=0` for every
  w∈U, then B_n=0: expand the four quadratic forms at u+w, u−w, u+iw,
  u−iw to recover every `<u,B_nw>`, and use boundedness and density.
  BY the displayed expansion and VR-1 `:84–109`.

  <2>2. Choose unit v in a single finite stage with
  `b=|<i_a v,B_n i_a v>|>0`. Since d_(r,n)→0, <1>1 gives
  `|q_r(v,n)|≥b/2` eventually. This is A5 with κ=b/2.

<1>4. The finite certificate is both sufficient and eventually necessary.

  <2>1. For every r≥a, telescoping A3 gives
  `|q_r−q_a|≤sum_(j=a)^(r−1)e_(j,n,0)≤d_(a,n)`.
  Hence `κ=|q_a|−d_(a,n)>0` proves A5 from scale a onward. BY A1/A3,
  or the same telescope as VR-1 `:99–104` applied to K_a^(-1)v.

  <2>2. If A5 holds, choose r so large that d_(r,n)<κ; then
  `|q_r|>d_(r,n)` at that finite scale. Computing the tail majorant is
  substantive input, not something a finite observed decay trend supplies.

<1>5. If any T_k with k≠0 vanished, every nonzero-index mode would vanish.
For j≠0,2k, the bracket `[T_k,T_(j−k)]=(2k−j)T_j` gives T_j=0.
In particular T_(3k)=T_(-k)=0, and their bracket gives 4k T_(2k)=0.
BY VR-1 `:78–80`; all these brackets avoid the central term. This contradicts
<1>2. Thus all nonzero-index modes are nonzero. Also T_0 cannot be scalar,
since `[T_0,T_n]=−nT_n`. QED BY <1>1–<1>5.

**Corollary A.1 [proven; same tags].** A fixed exponent σ≥1 may replace
the inverse K in A5 by K^(-σ); the scalar tail is at most
`d_(r,n)||K_a^(1−σ)v||`. Nonzero T_n still has an eventual witness: K^(-σ)
maps D bijectively to D and T_nK^(-σ) is bounded. BY the same proof.

**Proposition A.2 [proven negative boundary; any C, L0 plus the indicated
microscopic declarations; no new rung].** A1–A4 alone do not exclude
collapse for general pointed categorical carriers; the known constructions
fail A5 in an exact, finite-stage way.

<1>1. In CA-95.5, `T_(r+1,n)J_r=0` (both mode families), so for every
fixed coarse v and every r>a, `T_(r,n)K_r^(-1)J_(r<-a)v=0` by A1.
All the A5 matrix elements are eventually zero. BY
`report/sections/95_probe_word_ward_lifting.tex:102–131`, especially :121.
The construction uses only unit multiplicities and their matrix units, so
its carrier O=1⊕1⊕1 embeds in any unitary fusion C; the general failure is
not restricted to its displayed matrix realization.

<1>2. CA-100.5 has all modes identically zero for every unitary fusion C,
O=1⊕1, so every A5 matrix element is zero at every scale. BY
`report/sections/100_zero_mode_lattice_chirality.tex:142–150`.

<1>3. QED BY <1>1–<1>2. Necessity means equivalence to nonzero limiting
stress and rejection of these collapsing systems, not that a preselected
vacuum or an arbitrary preselected vector must detect a nonzero mode.

**Source-number audit.** The brief's CA-89.3 is not CA-95.5: current
CA-89.3 is the physical-control A2 obstruction
(`report/sections/89_ward_ks_transfer.tex:92–99`). Current fermion diagonal,
wrong-energy and categorical-compiler statements are CA-95.8, 95.9 and
95.11 respectively, not 95.6, 95.7 and 95.8. CA-100.10 is a supplied-target
cutoff construction, not a collapsing counterexample. These distinctions
are retained throughout this note.

### A.3. The central-charge clause: normalization and domains

**Local convention.** Define the genuinely normalized modes by
`L_n=T_n+delta_(n,0)(c*−c)I/24`. Substitution gives
`[L_m,L_n]=(m−n)L_(m+n)+(c*/12)(m³−m)delta_(m+n,0)I`.
This is the shift law of CA-79.1, `:78–81`; the invariant central charge is
c*. The statement c>0 means this invariant only after declaring c=c*.

**Theorem A.3 [proven implication; any; category-free; R2 restriction].**
ASSUME the normalized relations and adjoint pairing on a common invariant
dense D. Assume D contains a Hilbert-total linear subspace V_fin with

`for every v in V_fin, L_n v=0 for all sufficiently large positive n`. (PE)

PROVE c*≥0, and if c*=0 then all normalized modes vanish. Thus A5 and
(PE) imply c*>0, and imply c>0 when c=c*. No group integration is assumed.

<1>1. For nonzero v∈V_fin and sufficiently large k,
`||L_(-k)v||²=2k μ+(c*/12)(k³−k)||v||²`, where μ=`<v,L_0v>` is real.
BY adjoint pairing, L_kv=0, and the bracket. Negative c* makes the
right-hand side negative at large k, so c*≥0.

<1>2. If c*=0, let ν=`||L_0v||²`. The Gram matrix of
`u=L_(-2k)v/k`, `w=L_(-k)²v/k²` is

```text
G = [ 4μ/k          6μ/k            ]
    [ 6μ/k          8ν/k²+4μ/k     ].
```

  <2>1. `||L_(-2k)v||²=4kμ` and
  `<L_(-2k)v,L_(-k)²v>=6k²μ` follow from
  `[L_(2k),L_(-k)]=3kL_k` and `[L_k,L_(-k)]=2kL_0`.

  <2>2. `[L_0,L_(-k)]=kL_(-k)` and `L_k L_0v=0` give
  `L_k² L_(-k)²v=(8k²L_0²+4k³L_0)v`. Pair with v and divide by k⁴.
  BY the same brackets and invariant D. This proves every entry of G;
  no highest-weight/eigenvector assumption was used.

  <2>3. Positivity of G gives μ≥0 and
  `det G=4μ(8ν−5kμ)/k³≥0`. If μ>0, sufficiently large k violates this.
  Therefore μ=0 for every v∈V_fin. BY the displayed determinant.

<1>3. Consequently L_(-k)v=0 for all sufficiently large k, as well as
L_kv=0. For any fixed integer m choose k so large that both L_k and
L_(m−k) kill v and 2k≠m. Their bracket gives `(2k−m)L_m v=0`.
BY <1>1 at c*=0 and (PE). Thus every mode kills V_fin.

<1>4. For u∈V_fin, v∈D, `<u,L_mv>=<L_(-m)u,v>=0`.
Totality gives L_mv=0. This contradicts A5. QED BY <1>1–<1>4.
The primary-vector specialization agrees with the level-two Gram entries in
`references/cft/Schottenloher2008/Schottenloher2008.md:2937–2947`;
the displayed derivation avoids the nearby extraction's erroneous strict
positivity sign. Exact word-algebra checks are in `checks/noncollapse_symbolic.py`.

**Corollary A.4 [proven implication; same tags].** A lower bound for the
L_0 quadratic form on D, together with a Hilbert-total span of L_0
eigenvectors in D, supplies (PE). For L_0v=hv and lower bound b,
`L_0L_nv=(h−n)L_nv`; n>h−b forces L_nv=0. BY the bracket and the lower
bound; compare Schottenloher `:2762–2766`. Finite multiplicities and a global
lowest eigenvalue are unnecessary. A self-adjoint L_0 with a total set of
bounded-energy vectors in D and proved spectral support covariance supplies
the same condition.

**Open domain lemma.** Positivity of the L_0 form alone, on VR-1's D,
has not been shown here to supply (PE) or the spectral covariance just
described. VR-1 proves adjoint pairing, not essential self-adjointness or
spectral projections preserving D (`virasoro_routes.md:143–146,173–177`).
Consequently the positivity-only version of the normalized central-charge
clause remains conditional. It is not declared false. This is the precise
unproved part of H3(a); non-collapse itself is fully proved by Theorem A.

**Negative A.5 [proven; any; L4 supplied target, category-free contract;
R2 counterexample to positivity of the unnormalized linear ledger].**
ASSUME any unitary highest-weight target with charge a>1 and lowest weight
h>a/24. Such a general family is supplied by Schottenloher `:2985–3004`;
the integrated setting is `:3044–3054`. Put T_n=L_n for n≠0 and
T_0=L_0−hI≥0. PROVE c*=a but c=a−24h<0, while A1–A5 hold in the
supplied-target cutoff construction.

<1>1. Substitute T_0 into the normalized bracket: the scalar ledger is
`(am³−(a−24h)m)/12`. Adjoint pairing and positivity of T_0 persist.
<1>2. Use CA-100.10's finite spectral cutoffs, exact energy control and
p>1 certificate (`report/sections/100_zero_mode_lattice_chirality.tex:212–226`).
The constant shift changes neither A3 nor the nonzero modes, and its
effect on A4 is exactly the ledger change of <1>1.
<1>3. If Omega is unit primary, put
`w=L_(-1)Omega/sqrt(2h)`, `v=(Omega+w)/sqrt(2)`, `K=(1+L_0)^p`.
The bracket and energy grading give
`<v,T_1 K^(-1)v>=sqrt(2h)/(2(h+2)^p)>0`.
Cutoffs containing Omega,w preserve this value exactly. Thus A5 holds.
QED BY <1>1–<1>3. This refutes literal c>0 without genuine normalization,
not positivity of c*. No local categorical realization is asserted.

### B. An entrywise certificate independent of the category and its multiplicities

**Lemma B [proven; any; category-free; ingredient for R2].** ASSUME finite
input/output Hilbert spaces with declared orthonormal bases x,y and controls
`Q_in(x)=1+e_x`, `Q_out(y)=1+e_y`, e_x,e_y≥0. Let D be a matrix, and suppose
every nonzero entry has `|e_y−e_x|≤h`. Suppose its absolute column and row
sums obey, for q≥0,

`sum_y |D_yx| ≤ u Q_in(x)^q`,
`sum_x |D_yx| ≤ v Q_out(y)^q`.

PROVE for every t≥0 and d≥q,

`||Q_out^t D Q_in^(−t−d)|| ≤ sqrt(uv) (1+h)^(t+d/2)`.       (B.1)

<1>1. On every supported entry both energy ratios lie in
`[(1+h)^−1,1+h]`. BY nonnegativity of the energies and the shift bound.

<1>2. The weighted matrix has maximum absolute column sum at most
`u(1+h)^t`: factor its weight as `(Q_out/Q_in)^t Q_in^−d`, sum a
column, and use `Q_in^(q−d)≤1`. Its maximum absolute row sum is at most
`v(1+h)^(t+d)`: instead factor the weight as
`(Q_out/Q_in)^(t+d) Q_out^−d` and sum a row. BY <1>1.

<1>3. If a matrix Y has absolute row sum ≤a and column sum ≤b, then
`sum_y |sum_x Y_yx z_x|² ≤ a sum_(y,x)|Y_yx||z_x|² ≤ ab||z||²`.
BY Cauchy–Schwarz within each row, then the column bound. Apply with the
bounds of <1>2, take the square root, and obtain (B.1). QED.

**Theorem B.1 [proven implication; any; category-free or L0 plus declared
realization; R2 conditional on the entrywise hypotheses].** ASSUME finite
Hilbert spaces H_r, compatible isometries J_r, positive diagonal controls
Q_r≥1 in declared orthonormal bases, and `Q_(r+1)J_r=J_rQ_r`. Assume
adjoint-paired modes T_(r,n). For each fixed n,m, uniformly in r, assume:

- Modes have bounded energy shifts and absolute row/column sums of order
  Q, with constants independent of r.
- Their refinement defects `Δ_(r,n)=T_(r+1,n)J_r−J_rT_(r,n)` have bounded
  energy shifts and row/column sums at most constants times
  `ε_r^α Q^(1+α)`, for some α>0.
- Their full residuals with a fixed declared scalar ledger, including the
  identity term, have bounded energy shifts and row/column sums at most
  constants times `ε_r^β Q^(2+β)`, for some β>0.
- `ε_r=ε_0 2^−r`. Finite initial exceptions to the asymptotic coefficient
  bounds are allowed and explicitly bounded by their finite matrix norms.

PROVE VR-1 A1–A4 for `K_r=Q_r^p` whenever
`p≥1+α` and `2p≥2+β`. In particular α=1, β=2 give integer p=2,
A3 `O(ε_r)` and A4 `O(ε_r²)`, with explicit constants supplied by (B.1).

<1>1. A1 follows by finite spectral calculus from exact Q-intertwining.
<1>2. For A2 apply (B.1) with t=ps, q=1, d=p.
<1>3. For A3 apply (B.1) to the rectangular defect, with t=ps,
q=1+α, d=p. Both row and column constants contain ε_r^α, so their
geometric mean does too. Its dyadic series sums to
`C ε_0^α/(1−2^−α)`; the tail from r is `C ε_r^α/(1−2^−α)`.
<1>4. For A4 apply (B.1) with t=ps, q=2+β, d=2p. The bound is
`C ε_r^β→0`. Scalar central terms are part of the assumed residual;
testing only the one-particle commutator would not verify this hypothesis.
<1>5. Apply VR-1. QED BY <1>1–<1>4 and
`cft_machine/research/virasoro_routes.md:78–149`.

There is no Hilbert-dimension or fusion-multiplicity factor in (B.1).
The basis, energy and bounds are microscopic declarations, not consequences
of fusion data. This is an entrywise sufficient certificate complementing
CA-79.2's shell certificate; it does not redo CA-79 or supply its hypotheses
for a general C-chain. A5 is still separately required for non-collapse.

The supplemental `checks/graph_certificate.md` verifies the coefficient
and full-carrier hypotheses analytically, including deleted transitions
at the momentum-window boundary. Its exact constants precede the numerical
calibrations. The threshold and instance-specific conclusions appear only
in the examples table below; the p=1 obstruction there is not asserted for
every possible categorical tower.

### C. Identifying the state and representation system

**Theorem C [proven implication; any; category-free; joins R1 and R2 on
one declared system].** ASSUME a unital injective algebra tower
`(A_r,alpha_(r+1)^r)` with compatible states omega_r, for example WT-1's
limiting row states. Suppose a proposed analytic realization has cyclic
triples `(pi'_r,H'_r,Omega'_r)` for these same states and isometries J'_r
such that

`J'_r Omega'_r=Omega'_(r+1)`,
`J'_r pi'_r(a)=pi'_(r+1)(alpha_(r+1)^r(a))J'_r` for every a∈A_r. (C.1)

PROVE it is unitarily the compatible GNS tower. Therefore a VR-1/A5
certificate on this realization and WT-1 on the algebra/state tower meet
CA-81's same-system clause, including all graph domains carried by the
unitary identification.

<1>1. Define `U_r[a]=pi'_r(a)Omega'_r` on GNS classes.
`||pi'_r(a)Omega'_r||²=omega_r(a*a)` shows that null vectors map to zero
and that U_r is isometric. Cyclicity makes its range dense; completion
therefore makes U_r unitary. BY the state identity and the GNS quotient.

<1>2. For every cyclic class [a],
`U_(r+1)J_r[a]=pi'_(r+1)(alpha(a))Omega'_(r+1)
 =J'_r pi'_r(a)Omega'_r=J'_rU_r[a]`.
BY (C.1). Density gives equality on the whole H_r.

<1>3. The U_r induce a unitary of completed inductive limits. Transport
controls and modes by U_r; their graph norms and defect/residual norms
are unchanged. Thus the limiting operators and their common domain belong
to this same GNS system. BY <1>1–<1>2 and unitary invariance of all norms.
QED. The underlying construction is the local OAR source
`literature/md/2010.11121/2010.11121.md:148–180` and WT-1,
`report/sections/81_cft_machine_oar_contract.tex:80–83`.

The explicit calibration identification is proved in `checks/same_system.md`:
it supplies the fixed spinor basis change, the full spectator carrier and
control, the cyclic intertwining (C.1), and the exact correspondence of the
microscopic quadratic modes. It uses the **limiting rows** produced from
the actual microscopic states. WT-1 does not require those original
finite-scale ground-state vectors themselves to be exactly compatible.
This distinction is part of the proof, not an unresolved identification.

### D. General-C boundary

For an arbitrary unitary fusion C and pointed O, the strengthened analytic
contract reaches nontrivial **R2 only when it holds on the same GNS system
as the declared Wilson state** (any/periodic per family; category-free
analysis, L0 plus explicit h, v, density subtraction, zero-mode origin,
boundary representation, states and refinements for a categorical instance).
It does not construct the categorical realization of the stress insertion:
CA-95.11's compiler formula must be evaluated in the actual positive
carrier, with all charge and multiplicity indices. If Ward geometry is the
chosen supplier of the estimates, CA-89's W2 and differentiated
coordinate-resolved matching, and CA-95.2's endpoint/cylinder/accumulation
data G1–G3, remain unproved for a general C-chain; Ward data are not an
additional logical prerequisite after A1–A4 are independently proved.
LC-4's prescribed periodic energy/current modes and declared ledgers still
need to be the very modes being certified. Generality does not follow
from the calibration or from categorical evaluation alone. Positive energy,
integration and local-net axioms are R3 obligations; faithful sector content
and target identification require their separately declared L1–L4 data for
R4. Sources: CA-95 `:196–225`, CA-89 `:51–84,144–160,201–231`,
`reconstruction/04_cutoff_oar.md:38–134`, CA-81 `:105–125`.

## Results ledger

- A1, weighted transported witness implies non-collapse: proven (Theorem A).
- A2, eventual witness converse and rejection of collapsing families: proven (A, A.1–A.2).
- A3, positive invariant central charge: proven with (PE), conditional under positivity alone (A.3–A.4); the literal unnormalized c>0 assertion is negative (A.5).
- B1, whole-Hilbert A1/A2 and admissible control: proven (B.1; supplemental certificate).
- B2, sharp p threshold and summable A3: proven for the declared calibration; integer minimum 2, real threshold p>1 (supplemental certificate).
- B3, all-bracket A4 and explicit A5: proven (supplemental certificate; κ=1/(2√2π)).
- C1, Wilson/GNS/mode same-system identification: proven for the declared sharp-momentum calibration (C; checks/same_system.md).
- D1, categorical integration boundary: proven logical scope statement (D); no general-C R2 instance is supplied.

## Layer tags

Setting: any (analytic implication), declared periodic/full per family (KS).
Data: category-free; L0 only when supplied a categorical microscopic realization.
Declarations: Hilbert tower, compatible K, modes and ledgers, states and GNS
maps when claiming a common Wilson system. Rung reached: none yet. Rung
claimed: nontrivial R2 conditionally; no categorical cell moves by calibration.

## Pillar served

P4: detect loss of stress under refinement and verify graph-norm transport
without substituting estimates on a fixed momentum core.

## What this gives the integration

Open: identify the CA-88 cell and CA-75 link after proof audit. The intended
change is to the analytic certificate and its calibration, not general-C R2.

## Open problems

All proof obligations above remain open in this initial ledger.

## Examples table

| Instance (checks only) | Status |
|---|---|
| Source-modified complex CAR, AP circle | Whole-Hilbert certificate open |
| CA-95.5 / CA-100.5 collapse witnesses | A5 rejection to be checked |

## Sources used

- `cft_machine/research/virasoro_routes.md`, VR-1 (precise anchors to follow).
- `report/sections/81_cft_machine_oar_contract.tex:95–125`, contract boundary.
- `report/sections/95_probe_word_ward_lifting.tex`, 95.5, 95.8–95.11.
- `worklog/023_2026-10-27_status_overview.md`, §§0,1,4.
- `CONVENTIONS.md:801–869,1505–1562`, graph, calibration and layer conventions.
