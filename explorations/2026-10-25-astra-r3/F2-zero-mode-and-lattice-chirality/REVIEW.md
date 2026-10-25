GRADE: WEAKER-RESULT-PROVED

# F2 round-3 skeptical review — 2026-10-25

The main requested zero-mode lemma F2(a) is neither proved nor refuted.
The note says so. Its substantive advances survive review: parity-free
cubic-ledger balance; equality of both ledgers and mixed commutation given
the zero-mode equation; and equivalence of the finite weighted-norm
certificate with the limiting equation. These are conditional R2 results,
not a general lattice-chirality theorem. The broad F2(b) and sharp F2(c)
remain open in this record.

Review began at 05:42 UTC; the provisional grade/skeleton was written
within five minutes. All citations below refer to the reviewed 890-line
NOTE.md, SHA256
`f0e072a0e90c9fe864074158a11f377bc3dba4455d1cf9de01b7cfb94f75e3cd`.
I read the brief and note in full, the cited report shards, and every
listed source passage with surrounding context. An independent algebra
reviewer recomputed B1–B5, C1–C3, the formal algebra and the range formulas;
its conclusions were checked against the displayed computations. Prior
reviews and numerical outputs were not treated as proofs.

## 1. Defects and boundaries that must survive integration

**D1 — Missing spatial-support hypothesis in the standalone F2-R statement.**
NOTE:463–465 assumes finite *commutation* range of density labels. The claim
at :475 that Jcut is spatially finite-range additionally needs a declared
uniform support bound for k_j. The opening nearest-neighbour setting may
have been intended to supply locality, but F2-R changes that setting and
must state its own support hypothesis. The finite identities and analytic
implication do not need that additional hypothesis.

Here is a checked counterexample to the isolated inference from commutation
range to spatial range. At every site put two qubits, use unprimed Pauli
matrices, and set, on an N-site ring (N>=5),

    G = product_l Z'_l,
    h_j = X_j X_(j+1) + Z_j,
    k_j = h_j (1+G).

These translated densities are self-adjoint and commute at nonadjacent
labels. Since G commutes with all h_j and `(1+G)^2=2(1+G)`,

    i[k_j,k_(j+1)] = 4 X_j Y_(j+1) (1+G).

This current fails to commute with X'_l at *every* primed site, however
far away. Its spatial support is not uniformly bounded. The exact Pauli
calculation is in `checks/review_f2.py`; it is checked at N=7,11 without
large matrices. This is a general support warning, not a claimed KS/VR-1
counterexample to F2(a). Adding uniformly bounded density support repairs
it immediately: each current term is supported on the union of two bounded
supports, and fixed rho bounds the finite union defining Jcut.

**D2 — Carry the nonzero-system assumption into F2-Cubic explicitly.**
F2-B assumes a nonzero common system at NOTE:157. F2-Cubic's separate
ASSUME at :286–287 does not repeat this, while :352 uses it. If “common
hypotheses” imports F2-B's nonzero requirement, the argument is valid. As a
standalone statement with only VR-1 A1–A4, it has a literal gap: all H_r=0
satisfy those conditions for arbitrary ledgers. The corrected theorem below
states H!=0. This is an easily repaired hypothesis omission, not a
counterexample on a normalized GNS system.

**D3 — No unrestricted no-go or sharpness promotion.** The inverse cutoff
F2-Spec supplies target-compressed modes, not the standard KS prescription
for a specified nonlocal density. It therefore changes the stress
prescription as well as locality. The example cannot prove that dropping
*only* range is sufficient. No infinite-site-dimension-only example is
constructed. The note's own caveats at :643–654 and :825–849 are essential.
Its periodic nonlocal regulator should also be named explicitly: it is not
the open-chain setting used to define S_ch in CA-88:59, even though its
declared target has one chiral stress family.

**D4 — Precise citation/scope qualifications.** Carpi–Weiner :714–747
works in the positive-energy Diff-representation setting established at
:701–713. It is not an existence theorem for arbitrary formal Virasoro
relations. F2-Spec is safe because its energy bound is explicitly assumed;
the fermion example applies the bound sectorwise. The fermion source's
explicit nonlocality sentence is at :1892–1894, just outside the note's
:1843–1889 anchor (the kernel formula at :1881–1889 supports the calculation).
Use the wider anchor in a report. No load-bearing citation was found to
contradict the use actually made of it.

## 2. Every Lamport step

Verdicts concern the stated conditional result, not whether a categorical
model is known to satisfy its assumptions. All line numbers in this
section refer to NOTE.md. Parent steps with nested arguments are included.

### F2-G — finite/core equivalence

| Step / lines | Verdict | Audit |
|---|---|---|
| <1>1, 82–87 | VALID | VR-1's word telescope permits a mixed alphabet. The two orderings have the four displayed errors at graph orders s and s+1. |
| <1>2, 89–92 | VALID | Every finite-stage vector embeds in the smooth domain; exact A1 transport preserves the output graph norm. Taking the full unit-ball supremum is legitimate. |
| <1>3, 94–96 | VALID | A3 makes the tail vanish. Conversely, mixed-word convergence and uniform loss-two bounds pass a vanishing finite commutator to the limit. |

A4 is unnecessary for this transport lemma itself. This is stronger than
mere strong convergence on each fixed vector; the uniform A3 tails are what
exclude a moving high-energy defect. The independent positive and negative
controls below test this distinction.

### F2-N — logarithm counterexample

| Step / lines | Verdict | Audit |
|---|---|---|
| <1>1, 119–125 | VALID | Unit multiplicities give ordinary matrix carriers for every C. Zero densities satisfy A2–A4 exactly; append-vacuum maps satisfy A1. Neither coherent translation nor coherent parity transport is an F2(a) assumption. |
| <1>2, 127–130 | VALID | The one-excitation representation of the genuine cyclic shift contains the phase -1 for every even N. |
| <1>3, 132–137 | VALID | Any self-adjoint logarithm preserves U's eigenspaces and has an eigenvalue N(1/2+k) on the nonzero -1 block. K=I gives the lower bound N/2. |

This refutes the *automatic logarithm-identification route*, not ZC.
For the subsequent block argument (:143–146), p must be a spectral function
of U, as the displayed scalar-per-phase formula indicates; an arbitrary
logarithm inside degenerate phase blocks need not commute with H or Q.
The all-branch lower bound in the proposition does not require that
extra restriction.

### F2-B — both ledgers and all mixed brackets, given X_0=0

| Step / lines | Verdict | Audit |
|---|---|---|
| <1>1, 168–188 | VALID | Expanding `[L+S,L+S]` yields `4 kappa B`; the two internal brackets give `2(n-m)B + zL-zR + FL+FR`. The residual and gamma signs are correct. A2/A4 remove the remainder. |
| <1>2, 190–219 | VALID | The three substeps establish B3 for every integer pair, including the diagonal. |
| <1>2/<2>1, 192–201 | VALID | In the cyclic Jacobi sum, the remaining terms are commutators with scalar antisymmetric parts of C, so they vanish. |
| <1>2/<2>2, 203–209 | VALID | Division is only by m-n!=0. At total index zero the correction is exactly gamma_m/2. |
| <1>2/<2>3, 211–219 | VALID | The forbidden choices of p are exactly those making the other entries diagonal or the coefficient zero; n=0 is handled separately. |
| <1>3, 221–246 | VALID | Both actions require X_0=0 and use it explicitly, not implicitly in B1–B3. |
| <1>3/<2>1, 223–233 | VALID | Jacobi with L_0 gives the stated A action. Putting q=0 fixes A_p=-pX_p; the possible scalar is zero there. |
| <1>3/<2>2, 235–246 | VALID | Opposite-Witt signs and odd gamma give the plus scalar in B5. The S_0 action is B'_p=pX_p. |
| <1>4, 248–259 | VALID | The double action gives 2qX_q. Outer scalar terms have total index q, so none survive for q!=0; this includes q=1,-1. |
| <1>5, 261–269 | VALID | X=0 and q=-p force gamma_p=0 on the nonzero system. Indices 1,2 independently kill both ledger differences. |

No parity, positive-energy spectrum, finite site dimension or tensor-product
factorization enters the limiting algebra proof. The microscopic KS identity
and common product domain do enter; dropping them changes the theorem.

### F2-Cubic — cubic balance without ZC

| Step / lines | Verdict | Audit |
|---|---|---|
| <1>1, 292–298 | VALID | B1–B3 precede the first use of X_0=0. |
| <1>2, 300–307 | VALID | C1 is the unreduced Jacobi action; A and B' remain independent. |
| <1>3, 309–327 | VALID | Recomputed double Jacobi: the A and B' terms cancel, `[S_0,A_u]-[L_0,B'_u]=-[X_0,X_u]`, and the remaining scalar is `-mn(gamma_m+gamma_n)/2` at u=0. |
| <1>4, 329–344 | VALID | At q=-m-n only `[X_0,X_0]`, not X_0 itself, is discarded. The (2,2) and (1,3) evaluations of F_4 give `3(gamma_1-2gamma_2+gamma_3)/2`. |
| <1>5, 346–354 | GAP in standalone hypotheses | The polynomial combination equals Delta c*. Extracting a scalar coefficient requires H!=0; repeat the F2-B assumption (D2). With that explicit repair the step is valid. |

The original script checks the two F_4 paths, not the derivation of C2.
The latter was independently recomputed during this review. Physical
`c=c*` is an additional normalization condition, not a VR-1 consequence.

### F2-Aalg — formal obstruction

| Step / lines | Verdict | Audit |
|---|---|---|
| <1>1, 395–409 | VALID | L and S are representations of the two opposite Witt actions and commute on V; the polynomial shift is essential. |
| <1>2, 411–419 | VALID | The two cocycle equations follow from the displayed linear coefficient differences. Together with pure Witt and abelian V they exhaust generator triples. |
| <1>3, 421–438 | VALID | Dagger reverses brackets and conjugates coefficients; R is complex-linear. Their polynomial substitutions square to identity and commute. No dagger/dual confusion occurs. |
| <1>4, 440–445 | VALID | The declared degree is additive; the extension by P respects dagger and R. This is a derivation, not an implemented translation. |
| <1>5, 447–448 | VALID | X_0 is an independent nonzero vector in the underlying vector space; the verified cocycle introduces no quotient killing it. |

The negative result is about formal relations only. There is no positive
Hilbert-space or microscopic realization in this argument.

### F2-R — finite commutation range

| Step / lines | Verdict | Audit |
|---|---|---|
| <1>1, 493–498 | VALID | The cut-current difference telescopes; N>2rho avoids double-counting an antipodal pair. Integrated multiplicity is d. |
| <1>2, 500–504 | VALID | Pairwise Fourier expansion gives the stated kappa^d and h_d, including the cyclic seam. |
| <1>3, 506–518 | VALID | Taylor remainders give both constants in R4; the h_d estimate sums ell exactly. |
| <1>4, 520–527 | VALID | Fixed rho and separate component graph bounds make the remainder vanish. A2 for their sum is not substituted for bounds on components. |

The unnumbered assertion of **spatial** finite range at :475 is GAP as a
standalone implication, with the literal stronger inference refuted by D1.
The four numbered steps need only commutation range. Uniformly supported
input densities suffice for the additional spatial claim.

### F2-Spec — inverse spectral construction

| Step / lines | Verdict | Audit |
|---|---|---|
| <1>1, 570–572 | VALID | Nested orthogonal projections commuting with E reduce the graph weights. They need not be scalar functions of E on degenerate eigenspaces. |
| <1>2, 574–582 | VALID | Each input energy goes to e-n; distinct energies give orthogonal outputs. The shift ratio is bounded and the spare power is `(1+e)^(1-p)`. |
| <1>3, 584–590 | VALID | Leakage vanishes for e<=Lambda_r-|n| even if P_r includes extra high-energy states. The high-input estimate is summable on geometric Lambda_r. |
| <1>4, 592–600 | VALID | The compressed bracket has precisely the two signed leakage terms S3. Two modes cost `(1+e)^2`, while the two graph losses give `(1+e)^(-2p)`. |
| <1>5, 602–605 | VALID | Fixed finite-energy vectors eventually see the target modes exactly, identifying the VR-1 limit. No local observable refinement is supplied. |

The finite-rank projection hypotheses are substantive. A declared target
representation and its bound S1 are input, not output from C. “R2” here is
the mode-representation result; it is not a compatible R0–R4 construction.

### F2-Kernel — spectral derivative

| Step / lines | Verdict | Audit |
|---|---|---|
| <1>1, 627–631 | VALID | Differentiating the finite AP geometric sum gives the sign `-i(-1)^d` and factor 1/2; symmetry gives zero diagonal. |
| <1>2, 633–636 | VALID | The asserted limit is at fixed lattice separation after multiplication by epsilon. The resulting absolute 1/abs(d) tail is not summable. |

This does not assert a continuum interaction theorem or operator-norm
convergence of infinite kernels. The AP-to-circulant phase conjugation
preserves coefficient magnitudes, as claimed.

### Unnumbered conclusions and example

- **F2-B0 (:271–277): VALID.** `[L_0,S_0]=2a_N^2[H,Qcal]`, so exact
  current conservation suffices. Arbitrary finite range needs F2-R's
  corrected prescription and extra estimate.
- **F2-absent (:356–363): VALID on a nonzero system.** Right scalar stress
  has `c_R*=0`, `c_R=24t`; the left cubic anomaly vanishes and F2-B supplies
  the equal linear ledger. Scalar left stress is not established without
  parity; the note correctly refrains from asserting it.
- **General locality no-go / sharp F2(c): GAP, explicitly open.** Neither
  the logarithm counterexample nor the formal algebra is a physical
  counterexample. The spectral example also changes the KS hypothesis.
- **Fermion example (:818–849): VALID as the declared-target example.**
  Normal ordering and the cited Schwinger calculation give c=c*=1;
  h=0 describes the vacuum, not every charged sector. The outside-window
  excitation cost gives the required spectral containment, and the
  fixed-c sectorwise energy bound controls their orthogonal sum. The
  Fourier/qubit presentation has long-range couplings/strings, and the
  stress is still target-compressed. It supplies no arbitrary-C fidelity.
- **Source audit (:656–690): VALID with search scope retained.** The
  quoted passages are nearby assertions or restricted theorems, not an
  applicable proved microscopic no-go. Absence of a found source is not a
  proof that no such theorem exists anywhere in the local collection.

## 3. Corrected statement safe to use

**Conditional theorem (full/periodic; category-free; R2 restriction).**
Let a **nonzero** common finite-dimensional Hilbert tower satisfy VR-1
A1–A4 for both standard nearest-neighbour KS families, with the density,
current, Fourier, velocity and scalar-shift conventions (ap),(at). No
parity is required. Then:

1. `c_L*=c_R*`.
2. The following are equivalent: finite ZC for every nonnegative integer
   s; `[L_0,S_0]=0` on the common smooth domain; and `[L_m,S_n]=0` there
   for every integer m,n. Under these conditions also `c_L=c_R`.
3. Once the mixed limits vanish, the finite loss-two mixed commutators
   obey precisely the four-term A3-tail bound of F2-G (:77–80).
4. Exact total-current conservation supplies ZC. The original hypotheses
   of F2(a), without such a certificate, have not been shown to do so.

The more general algebraic form needs only the two internal brackets,
B1 on a common invariant domain, and a nonzero identity. The KS/VR-1
hypotheses are a sufficient microscopic supplier of that algebraic data.
For the finite-range extension, require R1's cut current and the component
bounds (or directly a vanishing coefficient-weighted remainder); declare
bounded density support separately if spatial locality is asserted.

The categorical finite realization needs only L0 plus declared carriers
and periodic action. No F/R numerical values or model-specific fusion
identity enters. F2-G is setting-independent and uses only A1–A3. F2-Aalg
reaches no Hilbert-space R2. F2-Spec uses a supplied target representation
(L4-type input) and reaches abstract mode R2 only. No result here reaches
R3, R4 or R5, and none certifies a nontrivial local categorical instance.

## 4. What the brief itself got wrong

- CONVENTIONS (as) is the unital-lift entry; the parity/KS entry is **(at)**.
- Its F2(a) prose calls the commutator one of “total momentum” with current.
  The displayed ZC quantity is `[H,Qcal]`, with `H=sum k_j`. For a spectral
  function p(U), `[p,Qcal]=0` is automatic but is not the required equation.
- A spectral logarithm does not automatically approximate D. F2-N disproves
  this route under the stated assumptions, including genuine translation.
- F2(b)'s “equivalently” is unjustified. Arbitrary physical lattice limits
  need not supply the standard two-family KS certificates on one retained
  system; finite range also changes the current formula. R2 alone supplies
  neither positive energy nor a local conformal net.
- The requested CA-91 chain with nonzero limiting C_00 would refute the
  automatic-ZC claim, not the current-conserving version of F2(b). Indeed
  exact current conservation excludes that counterexample, while parity
  already supplies ledger balance in the F2(a) setting.
- F2(c) is an additional sharpness claim, not a logical consequence of a
  no-go. Merely dropping site dimension does not evade the algebraic proof
  if its common-domain identities remain. A non-summable kernel must not
  be called quasi-local in an absolutely summable-interaction sense.

## 5. Reproducible verification

Run from the repository root; `P` below abbreviates
`explorations/2026-10-25-astra-r3/F2-zero-mode-and-lattice-chirality/checks`.
All actual executions used the full path and `python3 -B` (no bytecode files).

| Command after the path abbreviation | Raw output in checks/ | Exit / asserted result |
|---|---|---|
| `python3 -B P/check_f2.py` | `review_rerun_f2.txt` | 0; polynomial, ledger, Fourier and cyclic-shift invariants |
| `OPENBLAS_NUM_THREADS=1 python3 -B P/check_range_and_kernel.py` | `review_rerun_range_kernel.txt` | 0; errors 6.98e-15 and 2e-15, below 1e-10 |
| `python3 -B P/check_f2.py --mutate shift` | `review_rerun_mutation_shift.txt` | 1; LL-module assertion rejects omitted polynomial shift |
| `python3 -B P/check_f2.py --mutate central` | `review_rerun_mutation_central.txt` | 1; finite B1 assertion rejects reversed scalar difference |
| `python3 -B P/check_f2.py --mutate cubic` | `review_rerun_mutation_cubic.txt` | 1; two F4 paths reject altered coefficient |
| `OPENBLAS_NUM_THREADS=1 python3 -B P/review_f2.py --mutate omit-shifted-tail` | `review_mutation_shifted_tail.txt` | 1; fails with true norm 2, defective bound 1 |
| `OPENBLAS_NUM_THREADS=1 python3 -B P/review_f2.py` | `review_output.txt` | 0; 81 weighted-norm cases, moving-block control and exact support witness |

The independent mutation was run **before** the successful baseline.
Its positive example has `J_r=I`, `K=diag(1,M)`, `L_r=2^-r X`, `S_r=K`.
The limiting commutator is zero, the exact finite norm is
`2^-r (M-1) M^s`, and the full tail is `2^-r (M+1) M^s`.
Dropping the term with the shifted graph order s+1 destroys the bound.
The moving-block control has limiting zero action on fixed coarse vectors
but weighted commutator norm 2 and nonsummable transport defect 1. It
violates A3 and therefore demonstrates why that hypothesis cannot be
replaced by fixed-vector convergence. None of these checks infers an
unknown continuum limit from finite data.

The original polynomial test uses a particular cubic polynomial f; the
universal module assertion rests on the displayed arbitrary-f algebra,
not on that one test. No Julia suite, network, report build, commit or
root-file edit was used for this review. Existing changes by other sessions
were left untouched.

## 6. Single sharpest next lemma

**Fixed-coarse-vector KS zero-mode lemma** (full; category-free, L0 for finite
categorical ingredients; conditional R2 target): under the original F2(a)
nearest-neighbour KS/common A1–A4/complex-linear parity hypotheses, with
the prescribed translation covariance and `[U_r,K_r]=0`, prove, for every
fixed stage a and v in H_a,

    lim_(r->infinity) || (N_r^2/(8 pi^2)) [H_r,Qcal_r] J_(r<-a) v || = 0.

Here H_r in the displayed commutator denotes the Hamiltonian sum, not the
Hilbert space. This is only an unweighted, fixed-coarse-vector assertion.
Mixed-word convergence identifies its limit with `[L_0,S_0]i_a v`;
density of the coarse union in the graph spaces and A2 extend zero to D.
F2-G then supplies all uniform `(s,2)` ZC bounds. Alternatively exhibit an
actual tower and a coarse vector with a nonzero limiting commutator.
This lemma remains open. Do not add
`D_r-p_r -> 0` as if it followed from a branch choice, and do not replace
this task by a formal Lie-algebra example. The missing input is a
positive-Hilbert/microscopic argument beyond the verified formal identities.

## 7. Sources checked

Paths are repository-relative. Ranges identify the passages checked for the
claim at issue; report shards CA-79,81,88,89,91 were read in full. This list
does not claim to have re-proved the source papers.

- `AGENTS.md:1-425` (whole file), `README.md:1-72`, `report/README.md:1-125`,
  `report/SHARD_CATALOG.md:713-735,790-822`, `report.tex:1-154`,
  `worklog/022_2026-10-25_round3_sprint.md:1-53`: rules and current map.
- `explorations/2026-10-25-astra-r3/briefs/F2-zero-mode-and-lattice-chirality.md:1-107`:
  task and conjectures; reviewed note `NOTE.md:1-890` in this directory.
- `CONVENTIONS.md:44-104,444-471,704-738,801-869,1505-1543,1577-1593`:
  unit/dagger/gauge, separate central constants, graph norms, AP modes,
  normalized KS modes, layer tags and linear parity.
- `report/sections/91_parity_and_chiral_delineation.tex:50-163,176-207,223-246`:
  inherited hypotheses, old equal-ledger/ZC boundary and next target.
- `report/sections/79_ks_shell_and_refinement_defect.tex:52-96,163-175`:
  exact energy-current Fourier identity, scalar shifts and leakage.
- `report/sections/89_ward_ks_transfer.tex:49-61,86-115,187-205`:
  graph calculus, same-system transfer and independent ledger coefficients.
- `report/sections/81_cft_machine_oar_contract.tex:91-120` and
  `cft_machine/research/virasoro_routes.md:55-177`: A1–A4, smooth domain,
  word-tail proof, and exclusions of positivity/locality/integration.
- `report/sections/88_layered_targets.tex:53-125,127-155,233-243`:
  setting definitions, exact target cells and compatibility qualification.
- `explorations/2026-10-22-astra-r2/E2-parity-and-chirality/NOTE.md:292-420,794-817`,
  `explorations/2026-10-22-astra-r2/E2-parity-and-chirality/REVIEW.md:89-101,179-252`,
  `explorations/2026-10-22-astra-r2/E2-parity-and-chirality/INTEGRATION.md:123-131`:
  earlier proof, unproved ledger removal and genuine zero-mode target.
- `references/lattice-symmetry/GransSamuelssonEtAl2020/source/Linnea11.5.tex:791-822`:
  source KS prescription. Its model formulas motivate the normalized tier;
  no universal current/logarithm theorem is stated there.
- `references/text/PenneysUnitaryFusionCategories.md:219-237,442`:
  orthogonal sums, isometries and simple unit; supports all-C multiplicities.
- `references/cft-machine/coset-symmetry/CarpiWeiner2004/source.tex:701-747`
  and `references/cft-machine/coset-symmetry/SOURCES.md:3-36`:
  representation scope and energy-bound constant independent of lowest weight.
- `references/text/CFTFromLatticeFermions.txt:879-892,1843-1894,2790-2823,3480-3499`
  and `references/cft-machine/fermion/SOURCES.md:1-37`:
  complex normal ordering, momentum cutoff/nonlocality, vacuum c=1 and
  common-core continuum construction. The source's finite sine KS modes
  are not silently identified with F2-Spec's target compressions.
- `cft_machine/benchmarks/fermion/PROOF.md:12-17,78-115`:
  continuum one-particle shift and explicit Schwinger-sum derivation.
- `references/lattice-symmetry/LiLinMcGreevyShiKim2024/source/revised-emergence-of-virasoro.tex:738-746,1046`
  and `references/lattice-symmetry/SOURCES.md:1895-1956`:
  nearby anomaly assertion, thickened-edge context and unproved stress OPE.
- `references/lattice-symmetry/LiLinMcGreevyShiKim2024/LiLinMcGreevyShiKim2024_pdftotext.txt:4020-4021`:
  identifies the Hellerman–Orlando–Watanabe reference 2101.03320.
  Filename/identifier search found this citation, not a local primary copy.
- `references/lattice-symmetry/Jones2017NoGo/source/nogo.tex:586-622`:
  restricted planar-algebra/refinement rotation obstruction; not the broad no-go.
- `literature/md/1903.12334/1903.12334.md:195-197` and additionally
  `literature/md/1905.04924/1905.04924.md:363-367`:
  boundary-bulk consistency language; neither inspected passage proves the
  needed microscopic implication with stated lattice hypotheses.
- `references/lattice-symmetry/ZiniWang2018/source/main.tex:125-129,449-462`:
  chiral nonperiodic Ising result and explicitly conjectural generalization.
- `references/lattice-symmetry/KooSaleur1993/source/9312156.tex:428-450`:
  stress/metric variation, used only for background scope.
- `references/lattice-symmetry/SOURCES.md:9-36,277-306,966-1044`:
  Koo–Saleur, Zini–Wang and Grans–Samuelsson registration.
- `reconstruction/README.md:1-40` and `reconstruction/04_cutoff_oar.md:16-160`:
  integration destination, prescribed local support, common GNS system,
  mixed residuals and R3 exclusions.
