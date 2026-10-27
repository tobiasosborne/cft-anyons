# REVIEW: H3, VR-1 non-collapse and the first graph-norm instance (Opus, 2026-10-27)

**GRADE (H3 as posed): WEAKER-RESULT-PROVED.** Parts (a)-non-collapse, (b), (c)
and (d) are proved. One sub-clause of (a) is not proved as posed: "(adjoint
pairing + positivity of L_0) gives c > 0". Read with the linear ledger c, it is
**false** (Negative A.5, a general shifted-target counterexample). Read with
the invariant cubic charge c*, it is proved only under the extra total-vector
condition (PE). From positivity alone it remains open.
**GRADE (corrected statements, the note's ledger): PROOF-COMPLETE.** Every item
marked "proven" survives a step-by-step check. Two minor presentational gaps
(G1, G2 below) do not affect any conclusion. Nothing is graded up.

Reviewer: Opus (sceptical referee, not the prover). Read in full: AGENTS.md,
`briefs/_review_common.md`, `briefs/H3-vr1-noncollapse-instance.md`,
`NOTE.md` (538 lines), `final-message.md`, and all of `checks/`
(graph_certificate.md, same_system.md, README.md, MANIFEST.json, the four
scripts, all outputs and mutations, and the two in-session "reviews").
I also read every cited source at the cited lines (list at the end).

## 0. Re-runs (Law 3) and the independent check

- All nine of the note's commands were re-run with python3 (numpy 1.26, scipy
  1.11, sympy 1.12, no network). Each GREEN command exits 0. Each of the
  five mutations exits 1 at its stated invariant (wrap, normal-order,
  energy, Gram 6h->5h, Wilson covariance sign). `graph_check.py` output is
  byte-identical to `checks/graph_green.json`. Total time is under 3 s.
- **Independent check:** `checks/review_independent_check.py`. Raw output is
  in `review_independent_green.txt` and `review_independent_red_*.txt`; it
  runs in about 2 s with dense matrices of at most 256x256. It shares no code
  with the note's scripts. It works in *physical* occupation coordinates
  (sea r<0 filled), not the note's excitation bitmasks. It builds the
  refinement as the canonical GNS map [a]_M -> [alpha(a)]_2M from CAR words
  on the cyclic vacuum, so no padding signs are chosen by hand. It then
  verifies:
  - A1 and the intertwining of every coarse c_r, c_r^* (M=4->8, 8->16).
  - A2 exact weighted norms against the Lemma Q constant, plus the growth of
    the p=1/2 ratio.
  - The p=1 A3 obstruction on the moving UV particle, many-body, M up to
    4096. The ratios are 0.163, 0.235, 0.256, 0.2618, 0.2632, tending to
    2(sqrt2-1)/pi = 0.2637.
  - Decay of the same ratio at p=2.
  - Exact all-coarse-column weighted A3 defect norms at p=2,3.
  - The A4 ledger through the many-body vacuum residual. It vanishes like
    eps^2 for m=2,3, which confirms **the sign** of the cocycle (c=c*=+1),
    not just its modulus.
  - The global A4 coefficient majorant: |C_M(r)|/(H_mn eps^2 w^4) <= 0.0116
    over |m|,|n|<=3 and M=64..1024.
  - The A5 witness: q_r = 1/(2pi) at M=4, increasing to 1/(2sqrt2), and
    >= kappa at every scale up to M=1024.
- **Mutations (all rejected, exit 1):**
  - `empty-pad`: new labels are inserted empty rather than as sea. A1 fails.
  - `ledger`: c=c*=0. The A4 vacuum residual does not vanish.
  - `collapse`: modes scaled by M0/M, so A1-A4 still hold with zero limits.
    **A5 fails**, which is exactly the clause's purpose.
  - `p1`: demands A3 decay at p=1. This fails.
- Rule-7 notes on the note's checks. They assert real invariants (exact energy
  shift, Schwinger identity, adjoint pairing, refinement squares), not
  "runs". The A4 small-M numbers are pre-asymptotic: the M >= 4(|n|+1)
  threshold exceeds the sizes checked. My first attempt to assert an eps^2
  trend at M <= 10 failed for that reason, so the trend is a calibration,
  not evidence of the rate. The rates rest on the analytic proof, as the note
  says.
- `checks/noncollapse_review.md` and `graph_review.md` were written inside
  the prover's own session. They are not independent reviews in the sense of
  AGENTS.md ("prover and sceptical reviewer are different agents"). The
  NOTE's phrase "independent skeptical audits" (`NOTE.md:398`) overstates them.

## 1. Attack points demanded by the brief

**(i) Is A2 proved on the whole space with exact K-intertwining?** Yes.
- The carrier at scale M is the full CAR Fock space F(l^2(Gamma_M)), dimension
  2^M, with spectator F(l^2(Gamma_M)) in the paired case. It is the GNS
  space of the pure quasi-free limiting row state. Since the finite CAR
  algebra is a full matrix algebra, this is unitarily the lattice Hilbert
  space.
- The control is E = sum_exc|r|, which is a quadratic algebra element. The
  canonical GNS map satisfies J E_M = alpha(E_M) J = E_2M J, because
  E_2M - alpha(E_M) annihilates Ran J. This gives A1 exactly for every p, and
  I verified it independently.
- Lemma Q (`graph_certificate.md:33-88`) bounds **every** occupation-basis
  column and row, including Pauli-blocked, sign-crossing and normal-ordered
  diagonal terms.
- I re-derived the four cases (particle move, hole move, crossing, k=0). The
  k=0 case needs the *combined* particle+hole sum <= e^q, and the proof uses
  exactly that (`:60-68`). A separate bound per list would fail at q=1:
  2e > 1+e.
- The Schur test (`:75-84`) is correct, with constant
  sqrt(uv) = H F (1+|k|)^{t+q}.
- These are operator norms on the full carrier, not fixed cores and not
  diagonal matrix elements.

**(ii) Is the A3 defect summable in the VR-1 norms?** Yes, and there is no
convention defect.
- VR-1 (`virasoro_routes.md:57-76,85`) uses ||v||_{N,s} = ||K_N^s v||. A2 and
  A3 lose one power of K and A4 loses two, for all n and all integer s >= 0.
  A3 needs sum_N e_{N,n,s} < infinity; A4 needs only q -> 0.
- The certificate uses K^s = Q^{ps} with input weights Q^{-ps-p} (A2, A3) and
  Q^{-ps-2p} (A4). The scales are M_N = 2^N M_0, so eps_N is geometric.
- The A3 defect is exactly Q_S(A^{2M}-A^M_ext)J, because
  J T_M = alpha(T_M) J and alpha(Q_S(A)) = Q_S(A_ext) with the same normal
  ordering constant. The global (edge-inclusive) coefficient bound
  `:101-118` covers deleted transitions.
- The p=1 obstruction (`:151-160`) is correct and reproduced. It sits in the
  coarse interior at eps r -> pi/2, not at the window edge audit D suspected.
- The sharp rate eps^min(p-1,2) is supported by two n=0 lower bounds: the UV
  vector gives M^{1-p}, and a fixed low label gives eps^2 r^3/8 (I checked
  the Taylor coefficient 1/6 - 1/24 = 1/8).

**(iii) Does A4 cover all finite products?** VR-1 does not ask for that.
- A4 is a bracket hypothesis (`virasoro_routes.md:72-76`). Words are
  constructed from A2+A3 by the telescoping identity (`:118-137`). VR-2's
  warning (`:179-192`) concerns vacuum-only residuals, while here A4 is a
  full graph-operator norm.
- The note's A4 is the *full* residual: normal-ordered part plus scalar,
  with ledger z_mn = (m^3 c* - m c)/12 and c=c*=1. I verified the identity
  C_M = d_m A_n + B_m d_n - d_n A_m - B_n d_m - (m-n)d_{m+n} by hand. I also
  verified the crossing-sum cocycle, including its sign, against
  `CFTFromLatticeFermions.txt:886-892` and independently.

**(iv) "Same system": identification or parallel construction?** It is an
identification.
- WS-1 (`WILSON_PROOF.md:28-41`) proves that the actual Dirac rows converge
  to P_inf(r) = (I - sign(r) sigma_y)/2. That limit is WT-1's state (CA-81
  <1>4).
- With the fixed spinor basis U = (e_+, e_-), this limit is S_- (+) S_+.
  I checked the sign against source (59)-(60): `:1150-1166` gives
  S_0 = P^(-), and P^(+) is the a a^dagger kernel. Source (61)-(62)
  `:1176-1186` and (w) `CONVENTIONS.md:842-860` agree.
- The modes are fixed elements of the same scale-M CAR algebras:
  normal-ordered quadratics with a scalar subtraction relative to the limit
  state. They act in the GNS representation of that state, and the
  refinements are the same CAR maps J_momentum (x) I_2.
- Source (145) `:2372-2384` projects with the *fixed* p_+-, so
  T = Q(A (x) p_+) is the source's chiral mode with the no-wrap (197)
  modification. It is not a re-chosen representation.
- Theorem C only identifies the concrete excitation-Fock realisation with
  the abstract GNS tower. My check reconstructs J as the GNS map and finds it
  agrees.
- Caveat, stated in the note: the finite Dirac states enter only through the
  limit. The VR-1 certificate does not see them.

**(v) Is A5 category-free, and are the general statements general?** Yes.
- Theorem A, A.3, A.4, Lemma B, B.1 and C are category-free operator theory.
  The fermion appears only in `checks/` and the examples table.
- Honest weight: Theorem A is close to a reformulation (A5 <=> T_n != 0).
  Its operational content is the finite certificate |q_a| > d_{a,n} and the
  "one vanishes => all vanish" bracket argument.
- B.1 is a Schur test and C is GNS uniqueness. The hard analytic content is
  the CAR calibration (Lemma Q and the coefficient lemma). This matches the
  brief's request; it is not hyperfixation. Integration must still not
  advertise B.1/C as deep general results.

## 2. Per-step verdicts

**Theorem A** (`NOTE.md:56-118`).
- <1>1 VALID. <2>1 (A1 => K_r^{-1}J = J K_a^{-1}) is valid. <2>2 applies the
  VR-1 tail at s=0 to K_r^{-1}v_r, whose order-one norm is 1, and the bounded
  extension of B_n = T_n K^{-1} follows from A2 at s=0.
- <1>2 VALID. K^{-1} i_a v lies in the algebraic union, which is in D.
- <1>3 VALID. The algebraic union is a linear subspace, so polarisation
  applies. K maps D to D, so T_n != 0 implies B_n != 0.
- <1>4 VALID. The telescope gives |q_r - q_a| <= sum_{j=a}^{r-1} e_{j,n,0}.
- <1>5 VALID. [T_k, T_{j-k}] = (2k-j) T_j with no central term for j != 0.
  T_2k follows from [T_3k, T_-k] = 4k T_2k, and T_0 is non-scalar.

**Corollary A.1** VALID.
- G1 (minor): "K^{-sigma} maps D bijectively to D" for non-integer sigma uses
  graph spaces of real order, which VR-1 does not define. The tail estimate
  itself needs only K_a^{-sigma}v in H_a, so this is harmless.

**Proposition A.2** VALID.
- 95.5: T_{r+1,n}J_r = 0 (`95_...tex:121`), so q_r = 0 for r > a.
- 100.5: all modes are zero (`100_...tex:142-150`).
- Both carriers are unit-multiplicity, so the failure holds for every C.

**Source-number audit** (`NOTE.md:146-152`) VALID. CA-89.3 is the A2
obstruction (`89_...tex:92-99`). The brief's 95.6/95.7/95.8 are now 95.8,
95.9 and 95.11. CA-100.10 is a supplied-target construction, not a collapse.

**Theorem A.3** VALID. I re-derived everything by hand:
- ||L_{-k}v||^2 = 2k mu + (c*/12)(k^3-k).
- G_12 = 6 mu/k via L_{2k}L_{-k}^2 v = 6k^2 L_0 v.
- L_k^2 L_{-k}^2 v = (8k^2 L_0^2 + 4k^3 L_0) v. This uses L_k L_0 v = 0.
- det G = 4 mu (8 nu - 5k mu)/k^3.
- Then (2k-m) L_m v = 0 and totality.

Positivity of L_0 is *not used*: (PE) alone gives c* >= 0, with c* = 0
forcing collapse. This is stronger than the brief asked. The shift law
L_0 = T_0 + (c*-c)/24 agrees with CA-79.1 (`79_...tex:78-80`).

**Corollary A.4** VALID. A lower bound plus an eigenvector span gives (PE).

**Open domain lemma** is honestly open. VR-1 gives adjoint pairing only
(`virasoro_routes.md:143-146`).

**Negative A.5** VALID, at layer L4. T_0 = L_0 - h >= 0 gives c = a - 24h < 0
with c* = a.
- Existence comes from Schottenloher Thm 6.13 (`:2985-3004`) and the GW
  integration (`:3044-3054`).
- The energy bounds come from CW `:701-747`, through CA-100.10
  (`100_...tex:212-226`).
- The A5 value sqrt(2h)/(2(h+2)^p) checks: L_1 w = sqrt(2h) Omega.

**Lemma B and Theorem B.1** VALID. The ratio bounds lie in
[(1+h)^-1, 1+h], the column/row factorisations are correct, d >= q, and the
Schur test holds. The exponent bookkeeping (p >= 1+alpha, 2p >= 2+beta) is
correct.

**`graph_certificate.md`**:
- Lemma Q VALID (see (i)). The coefficient lemma is VALID: the
  Taylor/sin^2 bounds hold, the missing-edge bound
  eps^2 w^2 >= pi^2/4 > 1 at M >= 4(|n|+1), and the min-interpolation
  exponent is 1+alpha.
- A1-A3 VALID, as is the p=1 failure.
- p<1 fails A2: VALID, and reproduced.
- A4 is VALID for p >= 2 and its real-p extension. The finite-scale A4
  bound uses the A2 constants, which is legitimate.
- The diagonal witness is VALID:
  - <v, T_-2 K^-1 v> = b_M/2, with no K factor because E Omega = 0 and the
    E=4 output is orthogonal;
  - cos^2(eps/2) >= 1/2 and sin x >= 2x/pi;
  - hence kappa = 1/(2 sqrt2 pi).

**Theorem C** VALID (GNS uniqueness and (C.1)).

**`same_system.md`**:
- <1>1 is VALID (checked against the source and (w)).
- <1>2 is VALID with gap G2 (minor). The intertwining of odd generators of
  the *second* factor carries the parity twist, and only the note's
  8-generator check covers it. My GNS check covers one factor. The
  certificate is unaffected, because even quadratics do not see the twist.
- <1>3 VALID. Fixed p_+ is source (145); the spectator energy is handled by
  E_active <= E_tot.
- <1>4 VALID. F A_n F matches (197)'s "-" component, and the mixed brackets
  of even quadratics in different factors are exactly zero.

**Section D** VALID as a boundary statement. It matches CA-95.11 and the
CA-89 gaps.

**Layer-tag check.**
- The calibration's R0 is the source's unital injective sharp-momentum CAR
  map, which is **spatially nonlocal** (`:1892-1894`). It is therefore not
  CA-88's local R0^u.
- The note says so (`NOTE.md:466`), but its layer-tag table should carry it
  in the rung column. The tag reads "R1 + R2 on one system, with R0 unital
  but nonlocal".
- K = (1+E)^p is an auxiliary control, not the Hamiltonian. CA-89.3 shows
  the physical control fails A2.
- No R3 claim. No inflation found otherwise.

**Pillar drift:** none. P4 throughout. The calibration is what the brief
asked for, and the general clauses are stated first.

## 3. Corrected statements with honest tags

1. **Thm A (non-collapse).** Setting: any. Data: category-free. Rung: R2
   nontrivial given VR-1.
   - Under A1-A4, A5 holds iff some T_n (n != 0) is nonzero.
   - A5 then makes every T_n (n != 0) nonzero and T_0 non-scalar.
   - |q_a(v,n)| > d_{a,n} is a finite sufficient certificate, and it is
     eventually necessary.
2. **Prop A.2 (negative).** Data: L0, any C. CA-95.5 and CA-100.5 satisfy
   A1-A4 and fail A5 at every scale beyond the first.
3. **Thm A.3 / Cor A.4.** Setting: any. Data: category-free plus (PE). With
   adjoint pairing and the normalized relations on D, (PE) gives c* >= 0, and
   c* = 0 gives all modes zero. Hence A5 + (PE) gives c* > 0. Positivity of
   L_0 is not needed. Lower-bounded L_0 with an eigenvector span gives (PE).
   - **Open:** c* > 0 from positivity of the L_0 form alone.
   - **Negative A.5** (L4): T_0 >= 0 does not give c > 0 for the linear
     ledger.
4. **Lemma B / Thm B.1.** Setting: any. Data: category-free plus declared
   bases and energies. Entrywise row/column bounds with bounded energy
   shift, at defect orders eps^alpha Q^{1+alpha} and residual orders
   eps^beta Q^{2+beta}, give VR-1 for K = Q^p with p >= max(1+alpha, 1+beta/2).
5. **Calibration, AP chiral CAR and its paired full extension.** Data:
   category-free, source-modified no-wrap modes, sea normal ordering,
   sharp-momentum CAR refinement, E = sum_exc|r|. Rung: R1 (WS-1) and R2 on
   one GNS system; R0 nonlocal; no R3.
   - A1-A4 hold on the full Fock carrier for K = (1+E)^p **iff p > 1**:
     A3 fails at p = 1 and A2 fails for p < 1. The smallest integer is p = 2.
   - The A3 rate is eps^min(p-1,2) and the A4 rate is eps^min(2,2p-2).
   - A5 holds with kappa = 1/(2 sqrt2 pi), and c = c* = 1.
   - The paired families have zero mixed brackets.

## 4. What the brief got wrong

- Numbering: "CA-95 Prop. 95.5 (= CA-89 Neg. 89.3)" is wrong; 89.3 is the
  A2 obstruction. "95.6 fermion diagonal bounds" and "95.7 wrong-energy" are
  now 95.8 and 95.9, and "95.8 compiler" is 95.11. "CA-100.10 another
  [collapse]" is wrong: 100.10 is a supplied-target cutoff.
- "p = 3 may absorb it": p = 3 is unnecessary. Every p > 1 works, and p = 3
  only buys the eps^2 A3 rate. Audit D's worry was right in substance (p = 1
  fails) but wrong in location: the failure is at eps r ~ pi/2, not at the
  window edge.
- "(adjoint pairing + positivity of L_0) gives c > 0": false for the
  unnormalized c, and the wrong hypothesis for c*. The right hypothesis is
  (PE), and positivity is not needed.
- "the free-fermion row of CA-88" does not exist. CA-88's grid
  (`88_...tex:131-158`) has no fermion row. The fermion status lives in the
  R2 certificate column of Def. 88.3 (`:105`) and in worklog 023 §1/§4.3.
  INTEGRATION (b) names the actual cells.
- The proposed A5 is close to tautological. The non-trivial content the brief
  wanted ("c > 0") lives in A.3 and needs (PE).

## 5. The single sharpest next lemma (P4, category-free)

**VR-1 with summable graph-norm distortion.** Replace exact
K_{N+1}J_N = J_N K_N by
sup_s ||K_{N+1}^s J_N K_N^{-s}||_{H_N -> H_{N+1}} <= 1 + delta_N with
sum delta_N < infinity (and the dual bound), and prove A1'-A4 + A5 give the
same conclusions.
- `virasoro_routes.md:167-171` names this as "a possible extension, not
  proved here".
- It is the gate for every *local* refinement: wavelet fermion refinements
  (`CFTFromLatticeFermions.txt:1880-1894`) and the categorical local unital
  lifts CA-90/96. Physical energies there are never transported exactly.
- Without it, the present instance cannot be moved off the nonlocal
  sharp-momentum tower, and P4 cannot meet P1's local carrier.
- Runner-up: the positivity-only c* > 0 domain lemma (NOTE open problem 1).

## Sources checked (path:line)

- `cft_machine/research/virasoro_routes.md:50-192`: VR-1 A1-A4, the proof,
  exclusions and VR-2.
- `cft_machine/benchmarks/fermion/PROOF.md:12-123`;
  `WILSON_PROOF.md:9-98`.
- `cft_machine/reviews/virasoro_referee.md:155-161, 172-196`.
- `references/text/CFTFromLatticeFermions.txt`:
  - `:1130-1166` (eqs. 57-60, covariance S_0 = P^(-));
  - `:1170-1205` (61-65);
  - `:2360-2384` (143-145, fixed p_+-);
  - `:3375-3418` (197-199, no-wrap).
- `report/sections/81_cft_machine_oar_contract.tex:47-120`: WT-1, VR-1 and
  the same-system clause.
- `report/sections/88_layered_targets.tex:96-158`: Def. 88.3, Rem. 88.4 and
  the grid.
- `report/sections/89_ward_ks_transfer.tex:88-99`.
- `report/sections/95_probe_word_ward_lifting.tex:55-226`.
- `report/sections/100_zero_mode_lattice_chirality.tex:135-150, 205-226`.
- `report/sections/79_ks_shell_and_refinement_defect.tex:74-84, 95-140,
  246-262`.
- `report/sections/75_integration_map.tex:128-139, 196-201`.
- `CONVENTIONS.md:695-728` (s); `:830-870` (w); `:1644` (ax).
- `references/cft/Schottenloher2008/Schottenloher2008.md:2935-2948,
  2980-3006, 3040-3056`.
- `references/cft-machine/coset-symmetry/CarpiWeiner2004/source.tex:701-747`.
- `worklog/023_2026-10-27_status_overview.md:15-80, 160-182, 230-245`.
