# F: integration layer status (CA-75..CA-80, CA-88), audited 2026-10-27

This is a read-only audit; no repo file was changed. Paths are relative to `/home/tobias/Projects/cft-anyons/`.
Shards: `report/sections/75_integration_map.tex` (S75), `76_corner_to_wilson_bridge.tex` (S76), `77_pointed_carrier_invariants.tex` (S77),
`78_categorical_selection_equations.tex` (S78), `79_ks_shell_and_refinement_defect.tex` (S79),
`80_lattice_sewing_and_fidelity_certificate.tex` (S80), `88_layered_targets.tex` (S88).
Round-1 records: `explorations/2026-10-22-astra/D{1..6}/{NOTE,REVIEW,INTEGRATION}.md` (D*R = REVIEW, D*I = INTEGRATION).
Grades are copied exactly as written. Nothing is upgraded.

## 1. The integration map (CA-75), in one paragraph

CA-75 calls itself a **map** that "makes no new mathematical claim" (S75:12). It sets out the pipeline as six typed layers (S75:64-100).
(1) **Carrier**: a site object O, the algebras A_L=End_C(O^{⊗L}), and the number filtration. This is supplied by the variable-N tower (CA-65, CA-66) and by CA-87 Lemma 87.1.
(2) **Dynamics**: h∈End_C(O⊗O), its tile decomposition, and the Trotter history sum. Supplied by the spacetime dictionary (CA-86) and by LC-4 §1.
(3) **Refinement**: the isometries V_φ, the corner maps θ_φ, and GNS descent. Supplied by the tower (CA-68, CA-71, CA-72, CA-73).
(4) **Continuum state and generators**: WT-1 and VR-1. Supplied by the cft_machine OAR contract (CA-81, `wilson_triangle.md`, `virasoro_routes.md`).
(5) **Lattice symmetry**: Koo-Saleur (KS) modes built from the density. Supplied by CA-14, LC-4 §2 and the fermion `PROOF.md`.
(6) **Fidelity**: the sewing and four-port equations, the obstruction complexes and a declared target. Supplied by reconstruction (LC-1..LC-5, LC-9, LC-10, LC-12 §5) and `realisation_and_fidelity.md`.

CA-75 names two unwritten joins, both graded **Question**:
- Link (a), S75:115-139: is the history sum the lattice avatar of the cell equations? Sub-questions a1-a4.
- Link (b), S75:141-164: is the CA-72 defect scalar the input to WT-1's A3? Sub-questions b1-b3.

It merges CA-15, CA-67, CA-81 and LC-4 into one 13-item acceptance contract, graded **Proposal** (S75:168-213). Each item is tagged with the approach that constructs it [C] and the one that carries the proof obligation [P]. Items 10 (covariance) and 11 (analytic completion) have "[C] none" (S75:201-205).

**"Decisions Taken (2026-10-22)"** (S75:246-258) settles chirality, input data and targets with one rule, the layering principle (AGENTS Rule 17):
1. Chiral and full targets are both in scope, and every statement declares its setting (D6 is chiral; D2, D4 and D5 are full).
2. Input data comes in layers: fusion, braided, modular, enriched E.
3. Targets form a ladder: a limit exists → the limit is conformal → the limit is faithful. A chain h is an instance at the rung its certificate reaches; otherwise it is only a candidate.

The headline conjectures are restated on the CA-88 grid.

## 2. The layered grid (CA-88)

The axes are defined in Definitions 88.1-88.3 [proposal] (S88:58-120) and mirrored in CONVENTIONS (aq) (CONVENTIONS.md:1524-1545).
- **Setting**: ch (open chain, chiral net) or full (periodic chain, two-chiral).
- **Data**: L0 fusion, L1 braided, L2 modular, L3 enriched, L4 declared target.
- **Rungs**: R0^c corner tower, R0^u local unital tower, R1 Wilson state, R2 modes on the same GNS system, R3 local conformal theory, R4 faithful (with sub-rungs), R5 functorial.

**Def. 88.3 certificate column, verbatim in substance (S88:102-108):**

| Rung | Min data | Certificate in repo (as CA-88 states it) |
|---|---|---|
| R0^c | L0 | CA-68, CA-71 [derived] |
| R0^u | L0 + half-braiding on ⟨O⟩ (so L1) | 76.2 unital, nonlocal; 76.4 all C; CA-90 local [derived] |
| R1 | none | WT-1 (CA-81); drift via 76.1, 76.6, 90.W [cond.]; 90.V trivial vacuum only |
| R2 | none (Vir); L3 (extended) | VR-1; 79.2 via P0-P3 [cond.]; 89.1 [cond.]; 91.1, 91.5 [cond.]; 78.13 [proposal, split by CA-89] |
| R3 | none | D2-C's conclusion; ingredients 80.2-80.5, 92.3/92.5, 78.9-78.11; **no categorical instance** |
| R4 | L0+L4 sectors; L1+L4 braided; L3 T/chars | 80.9 + 93.8 [cond. on R3 + 93.11/93.12]; 93.2 closes the PP gap; 80.8: fusion operators never reach R4 |
| R5 | L3 | D6-C clause; **none** |

**"Existing Results on the Grid" (S88:131-158), rows × (S; L; R), grades from the source shard:**

| Result | S | L | R | Comment / grade |
|---|---|---|---|---|
| CA-71..74, CA-68 | open | L0 | R0^c | July tower, nonunital (S88:136) |
| WT-1, VR-1 (CA-81) | any | none | R1; R2 | category-free contracts; must share one system (:137) |
| 76.1-76.4, 76.9 | open | L0 | →R1 | drift from corner weight; unital extension; local tangent (:138) |
| 76.6-76.7 | open | L0 | →R1 | gap route [cond.]; 76.5 superseded by CA-90 (:139) |
| 76.10 (D3-C); 76.12 | open | L0 | →R0, R1 | UV locality [conj.]; dichotomy (G)/(L) [open] (:140) |
| CA-77 | any | L0 | R0^c | pointed carrier, grading, blocking, Fock carrier (:141) |
| CA-78 | any (D2-C full) | L0 (L1 for 78.8) | →R2, R3 | finite selection eqs; interface lemmas [cond.]; D2-C (:142) |
| CA-79 | full | L0; 79.9 L3 | →R2; →R4 | shell certificate 79.2 [cond.]; no-go 79.8; c>1 growth (:143) |
| CA-80 | any; 80.9 ch | L0; 80.9 L2/L3 | →R3; →R4 | sewing, RP [derived]; 80.9 assumes (F1)=R3 (:144) |
| CA-82 | ch | L4 | R4 | Ising calibration; reads no F,R (:145) |
| CA-83..85 | ch | L4 | R2-R3 | coset calibrations, scalar-augmented (:146) |
| CA-86, CA-87 | any | L0 | finite | no tower, no limit (:147) |
| CA-89 | full/family | none | →R2 | 89.1(i-iii) [cond.]; 89.3, 89.7 [negative] (:148) |
| CA-90 | any | L0+t (L1) | R0^u | local unital lift [derived]; 90.2 [negative] (:149) |
| CA-91 | full | none; L0 for 91.11-15 | R2 [cond.]; →R0 | (:150) |
| CA-92 | full (ch: twisted) | L0 + decl. s | finite, →R3 | seam kernel [derived, cond. on s]; negatives (:151) |
| CA-93 | any; 93.8 ch; 93.9 full | none; L0/L1+L4; L2+L4 | →R4; R4 given R3 | 93.2 [derived]; EP/AN [cond.] (:152) |
| CA-94 | any (open) | L0 + decl. | R0^c + z=2 | D1-C proved for tuned family [derived]; N1-N3 [negative] (:153) |
| LC-1..3, LC-5..13 | ch | L2-L3 | →R3, R4 | continuum equations only (:154) |
| LC-4 | full | L0 | →R1, R2 | periodic KS tier (:155) |

**Round-2 verdicts** (S88:230-243):
- E1→CA-90 PROOF-COMPLETE.
- E5→CA-93 PROOF-COMPLETE.
- E6→CA-94 COUNTEREXAMPLE to E6 as posed, plus the proof-complete Theorem 94.6.
- E2→CA-91, E3→CA-92 and E4→CA-89 WEAKER-RESULT-PROVED.
- Verdict: "No cell moved up a rung except R0^u (reached at L0+half-braiding, so at L1)" (:242-243).

**Round-3 verdicts** (S88:244-246):
- F1→CA-96 COUNTEREXAMPLE (Target 90.T superseded).
- F5→CA-99 COUNTEREXAMPLE (Target 94.16 refuted).
- F2→CA-100, F3→CA-98, F4→CA-95 and F6→CA-97 WEAKER-RESULT-PROVED.
- Verdict: "No cell moved up a rung; R0^u is now reached at bare L0 for the group-graded families of CA-96."

**Headline conjectures as restated (S88:160-228; all restatements are [proposal]):**

| Conj. | Tags as written (S; L; reached / claimed) | Restated at | First attackable lemma |
|---|---|---|---|
| D1-C (:167-177) | open; L0 + reaction morphisms + contact tuning; carrier 77.8 + z=2 limit (CA-94) / z=2 limit, off-ladder | (L0, any, R0^u+R1): coherent local unital refinements of a number-changing field algebra on the 77.8 carrier, with one WT-1 state family | A unital local lift of the dressed refinement R=U(id⊗η) that commutes with N̂ (open; CA-90 is the bare-insertion version). The former N≤2 collision lemma is superseded by 94.5. |
| D2-C (:179-188) | full; L0 + C1-C6; none / R3 | Split. (i) Ward-to-KS transfer, category-free, →R2 (Thm 89.1; false for arbitrary refinements if c*≠0, 89.7). (ii) Selection proper is a question, category-blind at L0. | Probe-word Ward-to-residual Lemma 89.L, first on the free-fermion benchmark with K=1+E_N |
| D3-C (:190-196) | open; L0, pointed O; first order by 76.9 / uniform locality →R0 | (L0, open, →R0) UV locality lemma (Conj. 76.10); the IR question is dichotomy 76.12 | A locally summable generator for the t² coefficient, via (6.3) and pair locality |
| D4-C (:198-206) | full, diagonal; L4; →R2 by 79.2 [cond.] / R4 | Relative inverse discretisation (L4, full, R4), strengthening Zini-Wang Conj. 4.3. Attackable core: P0-P3 (L0, any, →R2). | P0-P3 for the sourced quasi-free calibration |
| D5-C (:208-216) | full; L2 + E1-E7; none / R4 uniformly | (L2; declared chiral subnet; R4 given R3) two-sided fidelity 80.9, gap closed by 93.2, layer lowered to L0/L1+L4 (93.8); universality clause dropped | The annular approximant lemma of CA-93, then EP/AN (93.11-93.12); the old compatible-CP lemma is superseded |
| D6-C (:218-228) | chiral; L2 → selects L3; none / R5 | (a) enrichment synthesis L2→L3 (open, contains the realisation problem); (b) relative D4-C; (c) coherent selection R5 with automorphism lifting | Braided vacancy tower Ad_U∘B(·⊗id)B† is strict local OAR with d_{k,n}≤p_n e_n+2(1−p_n). Proved for U_n=1 (90.1, 90.W); local dressing only for supplied circuits (90.D). |

## 3. Results table, CA-76..CA-80

Columns:
- Tags (S; L; R) follow CA-88's row for the shard unless the statement itself differs.
- "Check" means an exploration Python bundle. **None has been ported to Julia or `scripts/`**: S76:20-21, S78:17, S80:20, worklog 020:229-230, and `grep` of `scripts/ test/ src/` finds nothing.
- "mut" means at least one mutation was shown RED.

**CA-76** (open; L0; →R1)

| Label | Statement | Grade as written | Check | file:line |
|---|---|---|---|---|
| Corr 76.A | The CA-72 completion defect has operator norm \|cov_χ(S,T)\| whenever P≠1, so Cor 72.8 is not an operator-norm softness claim | derived | D3 `output.txt:5` (M2→M4 witness); D3 red_*.txt mut | S76:64 |
| Corr 76.B | θ_n pins every inserted site; Lemma 73.1 support holds only for the local representative | derived | D3 check "global corner support" | S76:75 |
| Corr 76.C | Constants transport to multiples of P; centering mismatch has seminorm \|m\|√(pq) | derived | D3 "centering variance=p*q" | S76:83 |
| Prop 76.1 | **Drift bound**: (i) ‖σθ−ρ‖≤p‖τ−ρ‖+q; (iv) for intertwining unital α_n, d_{k,n}≤p_n e_n+2q_n (sharp, 32/25); no bound by q_n alone; Σq_n<∞ is a global, exact-RG-strength demand | derived | D6 `raw_output.txt:5`; D6 check_d6.py, 4 mut | S76:90-112 |
| Prop 76.2 | Scalar augmentation A⊕C gives a strict unital injective tower, drift in [2q_n, p_n e_n+2q_n]; scalar collapse if ω_n(P^k_n)→0; **nonlocal** | derived | D3 "scalar augmentation" | S76:114 |
| Prop 76.3 | A unital reducing extension of θ exists iff an integer block condition holds | derived | none specific | S76:123 |
| Cor 76.4 | The 76.3 condition holds for vacuum insertion in every C; the remaining gap is locality | derived | none | S76:133 |
| Prop 76.5 | Braided interleave B(T⊗id)B† is a local unital lift | proposal (superseded by CA-90 Thm 90.1) | D6 `review_braided_lift_output.txt:2-4`, range-2 mut, pointed only, phase-blind | S76:140 |
| Thm 76.6 | Unique gapped fine vacuum with residual ε_n: d_{k,n}≤min(2,2ε_n/Δ_{n+1}), q_n≤(ε_n/Δ)²; summability gives WT-1 A3 | conditional (conditional-ok) | D3 `output.txt:13` (zero-variance) | S76:153 |
| Cor 76.7 | Non-collapse: ω_n(P^k_n)≥(1−s_k²/2)² | conditional | none | S76:172 |
| Rem 76.8 | Geometric tail if Δ≳a^z and ε≲a^{z+y}; circuit comparison needs u>1+z | "derived arithmetic on conditional inputs" (the status line lists it as conditional) | none | S76:182 |
| Prop 76.9 | Polar heat refinement W(t) is isometric; exactly local first tangent Σ[P_Z,h_Z]V; energy derivative ≤0 | derived (also verified on a Z/3 multiplicity-two carrier) | D3 `review_check_pointed_output.txt`; red_polar.txt mut | S76:190 |
| Conj 76.10 | D3-C: uniform quasi-locality of the polar dressing for t≤t_0 | conjecture (well posed, unverifiable) | none | S76:207 |
| Neg 76.11 | (a) [H,P]=0 ⇒ W(t)=V; (b) short time does not beat a closing gap; (c) a UV shell gap does not select the IR vacuum; (d) bare insertion is not KS-covariant | derived | D3 `output.txt:12` | S76:222 |
| Q 76.12 | Dichotomy: (G) global fidelity at o(a_n^{1+z}), or (L) local unital lift plus witnesses; Link (b3) open | question | n/a | S76:238 |

**CA-77** (any; L0; R0^c). Its check `carrier_checks.py` has 4 GREEN groups and 4 RED mutations. The groups are refinement, grid (box maps), corner and reactions (D1 `checks/raw_output.txt:3-12`). **No group exercises 77.4 or 77.5.**

| Label | Statement | Grade | Check | file:line |
|---|---|---|---|---|
| Prop 77.1 | Unital tower a⊗id versus corner tower θ_φ; coherent placements V_ψV_φ=V_ψφ | derived | partial (corner group) | S77:62 |
| Prop 77.2 | The tower, θ, concatenation and partial isometries reconstruct the Cauchy completion of ⟨O⟩; algebras plus θ alone do not suffice; braiding must be marked separately | derived; **near-tautological** (D1R:165) | none | S77:75 |
| Prop 77.3 | The unmarked corner limit is ⊕_c K(H_∞,c) | negative | none | S77:83 |
| Prop 77.4 | Occupation Z-grading; two-site count 2s+4t+4z; all-scale parity criterion | derived | none | S77:93 |
| Thm 77.5 | Dual-pair blocking O≅Y⊗Ȳ is a finite integer system (decidable), with η transported to d_Y^{-1/2}coev; generalises Lemma 87.1 | derived | **none executed** | S77:124 |
| Prop 77.6 | The Morita class of O⊗Ō is constant over all O | negative; strengthened. The FRS part is source-local, and the FRS authors defer the proof. | none | S77:164 |
| Prop 77.7 | Representing bijection; GNS defect 2(1−√p); τ_l(P_φ)=d_O^{k−l}; completion defect has norm \|cov\| | derived | corner group, mut | S77:175 |
| Qualifications | (a)-(e) on CA-72 Cor 72.8, CA-71 caret/Thompson-V, CA-73 pins, CA-68 deficit | derived | n/a | S77:192 |
| Thm 77.8 | **Box maps**: length-weighted R refinements are exact and coherent; the box maps K_π extend to a unitary onto the ordered configuration Fock carrier F_{C,X}, with fusion fibres retained. Caveat: Ad R is a corner, so this is a Hilbert carrier only. | derived | refinement and grid groups, 2 mut | S77:216 |
| Prop 77.9 | Bare dyadic insertion has an atomic limit; translations are not strongly continuous | negative | none | S77:228 |
| D1-C | Collision-sewing resolvent limit | conjectural, framing overstated; amended: proved for the tuned family in CA-94 | `review_contact_output.txt:4-7` (no mut) | S77:235-251 |
| Open problem | Categorical second quantisation with WT-1 | Question | n/a | S77:253 |

**CA-78** (any, D2-C full; L0, 78.8 L1; →R2, R3). Checks: `exact_checks.py` with `run.txt` (8 groups pass, 2 mutations RED) and `review_checks.py --mutate` RED.

| Label | Statement | Grade | Check | file:line |
|---|---|---|---|---|
| Prop 78.1 | Coefficient compiler: positive-definite Gram, dual functionals, structure constants; no self-duality used | derived | Gram group | S78:44 |
| Prop 78.2 | Exact gate ODE; Trotter products are exact history sums (upgrades Lemma 86.1) | derived | none specific | S78:56 |
| Lemma 78.3 | Lossless fixed-carrier blocking forces d_O=1, so blocking leaks | derived (confirmed) | blocking Jacobian group | S78:79 |
| Lemma 78.4 | Metric-independent functional ⇒ all separated stress insertions vanish | negative, derived | none | S78:90 |
| Thm 78.5 | Analytic additive YBE with R'(0)=h ⇒ [h12+h23,[h12,h23]]=K23−K12 (cubic cokernel test) | derived and checked | `exact_checks.py:69-81` | S78:110 |
| Lemma 78.6 | TL Baxterisation residual formula | derived as algebra | `exact_checks.py:51-58` | S78:134 |
| Prop 78.7 | YBE does not imply brick commutativity, and commuting gates do not imply YBE (repaired converse) | negative, derived and checked | `run.txt:20-29` mut; `review_checks.py:21-31` mut | S78:147 |
| Erratum 86.3 | The brick sweep is KS row-to-row τ̂, which does not commute; the ground-state claim needs nondegeneracy | (erratum) | n/a | S78:165 |
| Prop 78.8 | Braided linear ansatz works iff b²−αb=β | derived and checked | `exact_checks.py:84-89` | S78:176 |
| Lemma 78.9 | Defect relations survive strong limits: faithful, not full | conditional (conditional-ok) | none | S78:197 |
| Lemma 78.10 | Normalisation bound feeds WT-1 A3 | conditional | none | S78:209 |
| Lemma 78.11 | One-sided collar ⇒ VR-1 A2 shape; two-sided nuclear bounds insufficient (counterexample) | conditional; the counterexample is negative, derived | none | S78:218 |
| Conj 78.12 | D2-C sufficiency C1-C6 ⇒ local conformal net | conjectural | none | S78:233 |
| Target 78.13 | Ward-to-KS transfer | proposal, split by CA-89 | none | S78:248 |

**What the selection equations select:** nothing yet. CA-78 says "No selection theorem and no selected coupling for any C" (S78:262).
- (78.3) is a necessary *rejection* test for analytic additive YBE, valid for any unitary fusion C with d_O≠0. It is not sufficient and not a criticality test (S78:127-131).
- 78.6 needs a self-dual summand and the FS sign.
- 78.8 needs braided C.
- Defect symmetry imposes no equation on c (S78:192-195).
- CA-75 row (2) agrees: "CA-78 gives rejection tests only" (S75:77).

**CA-79** (full; L0, 79.9 at L3; →R2, →R4). Check: `run_checks.py`, 20 exact checks with 5 RED mutations (red_*.txt). It runs on qubits only (C=Vec), so it verifies formal identities (S79:22-24).

| Label | Statement | Grade | Check | file:line |
|---|---|---|---|---|
| Lemma 79.1 (D4-T) | Continuity identity, adjoint pairing, Fourier commutator of densities; energy-origin shift c→c+24d fixes c* | derived. Note: it is a **Lemma**, not a "Thm 79.1". | continuity, Fourier and origin checks, mut | S79:73 |
| Property P | P0 exact Q-transport; P1 shell decay; P2 residual → 0; P3 summable transport | hypothesis ("not synthesised from C") | none | S79:98 |
| Thm 79.2 (D4-P) | **Spectral-shell certificate**: P0-P3 with K=Q^p, p>1 ⇒ VR-1 A1-A4 | conditional (conditional-ok) | "spare-power" check | S79:116 |
| Prop 79.3 | P1 plus fixed-block residual → 0 ⇒ P2 | conditional | none | S79:140 |
| Prop 79.4 | Relative ad_Q bounds ⇒ P1 | conditional | none | S79:147 |
| Ex 79.5 | p=1 fails, so the spare power is needed | negative | `red_regularity_power.txt` | S79:155 |
| Lemma 79.6 | KS refinement defect splits into leakage, compression and phase parts | derived | leakage/transport checks, mut | S79:167 |
| Lemma 79.7 | Bare dyadic insertion compresses NN energy to one-site sums | derived; negative | dyadic check | S79:182 |
| Thm 79.8 | Exact full-stage covariance ⇒ zero representation | derived; negative | trace-obstruction check | S79:192 |
| Prop 79.9 | c>1 plus modular characters ⇒ V_1 is not finitely Virasoro-generated (sharp) | conditional | character-sum check | S79:209 |
| Pos 79.10 | Extended generators are declared data; defects are zero modes | derived argument under stated assumptions | none | S79:221 |
| D4-C | Inverse discretisation from a sewing completion | conjectural (overstated as a statement about C) | none | S79:236 |
| First lemma | P0-P3 for the quasi-free calibration | proposal | **not done** | S79:249 |

**CA-80** (any, 80.9 chiral; L0, 80.9 at L2/L3; →R3, →R4). Checks: `check_cells.py` (6 groups, 5 mutations rejected) and `review_pp_constant.py`.

| Label | Statement | Grade | Check | file:line |
|---|---|---|---|---|
| Lemma 80.1 | Exact sewing along tile legs with inverse Gram; dual bases transform by F^{-T} | derived | dual_basis, inverse_gram, mut | S80:70 |
| Lemma 80.2 | Temporal RP ⇔ Σ≥0 blockwise | derived | reflected_row, mut | S80:87 |
| Cor 80.3 | RP forces h=h†; no sign rule on c_α | derived | none | S80:97 |
| Lemma 80.4 | Strang symmetrisation: AB is similar to a positive R | derived | none | S80:106 |
| Lemma 80.5 | Energy-resolved positivity; pointwise positivity is not enough | derived | graded_positivity, mut (det −1/8) | S80:118 |
| Lemma 80.6 | Duhamel and Ward product rule | derived finite identities | energy_continuity, mut | S80:127 |
| Lemma 80.7 | Convergent fusion-defect operators | conditional (conditional-ok) | none | S80:144 |
| Prop 80.8 | **Scalar falsifier** D_a=d_a·1 satisfies every fusion relation for every C, so fusion operators cannot certify fidelity | derived, negative | fusion_idempotents (Z2, calibration) | S80:153 |
| Thm 80.9 | Two-sided certificate (F1)+(F2)+(F3′) ⇒ braided equivalence, μ=Dim B | conditional; the original form was graded "overstated" (D5R:126) | `review_pp_constant_output.txt:1-3` (n vs n²) | S80:168 |
| Lemma 80.10 | A vacuum-preserving annular expectation forces M=N | derived, negative | none | S80:208 |
| Lemma 80.11 | Verlinde defect projections, B=C only | conditional | none | S80:216 |
| Lemma 80.12 | c>1 character growth (D5-H, sharp) | conditional | none | S80:226 |
| Conj 80.C | D5-C | conjectural | none | S80:236 |

**What was wrong with 80.9, later "repaired" in CA-93.** Prop 80.8 needed no repair. The problem was in the D5-F route to step ⟨1⟩1, μ≤Dim B.
- The note's *finite-dimensional* hypothesis E_k≥(Dim B+ε_k)^{-1}·id was passed to the limit through KLM Prop. p3(a).
- KLM proves p3(a) "after taking commutants", which uses commutant-invariance of the index.
- That invariance fails for Pimsner-Popa constants of finite type-I inclusions. C1⊂M_n has index n, while its commutant inclusion has index n² (S80:187-197; checked exactly for n=2,3).
- The finite form also assumed neither compatible E_k nor a preserved state, so no normal limit expectation was ever built.
- CA-93 Lemma 93.2 [derived] closes repair route (ii). It uses bounded exhaustions of both N and M, plus a normal state ψ that is faithful on N and preserved by every E_k (compatibility not needed). These give a unique normal E with E≥b^{-1}·x (93:77-86).
- By Lemma 80.10 that state cannot be the vacuum.
- Theorem 93.8 then lowers the data layer to L0+L4 or L1+L4 (93:158-162).
- Caveat: no instance of the 93.2 hypotheses is known for a type III_1 four-interval inclusion, and the certifying costs must hit μ_A exactly (93:224-228).

## 4. Round-1 verdicts (D1..D6)

Every headline got "Needs reformulation" in INTEGRATION §(d), confirmed in worklog 020:99. The REVIEW ledger grades differ in wording:

| Dir | REVIEW grade of headline (anchor) | Main objection | Survived into CA-76..80 |
|---|---|---|---|
| D1 | "conditional-ok (label accurate); framing overstated" (D1R:163); "Needs reformulation" (D1I:94) | R1 hidden tuning: D_hop†D_hop adds a contact attraction −2ε⁻²n_jn_{j+1}, so the number-changing limit is non-universal. R2 the category is analytically inert. The limit is z=2 nonrelativistic (D1R:78-98) | All of CA-77: T1-T6 and N1-N4 are graded confirmed (D1R:164-177); the corrections went to CA-76 (76.B/C) |
| D2 | "conjectural label correct; headline needs reformulation" (D2R:202; also :19) | Sufficiency, not selection; category-blind (C=Vec, O=C^n admits every qudit chain, D2R:79); no instance of C1-C6 (D2R:88-98) | CA-78; the D2-L5 converse was repaired (D2R:209) |
| D3 | "unverifiable (honestly labelled)" (D3R:120); "Needs reformulation" (D3I:78) | UV-only. No route is non-vacuous for a critical family. Global q_n/ε_n routes carry an O(N_n) factor (D3R:93-101) | CA-76 (76.1, 76.2, 76.6, 76.9, 76.11, 76.12) |
| D4 | "overstated (as a statement about C)" (D4R:213; summary :18) | Any spin chain fits (unit multiplicities, growing O). The input is the full CFT. Zini-Wang prior art was not cited (D4R:13-26) | CA-79 (T, P, B, I, R, V, N, G); D4-X stays in the note |
| D5 | "unverifiable" (D5R:115); "needs-reformulation" (D5I:113) | Contains the open UMTC realisation problem; degenerate unless c>0; nearly duplicates D6-C. D5-F "overstated" (D5R:126, :144-163) | CA-80 (S, P, R, G, W, D, F repaired form, V, M, H) |
| D6 | "unverifiable (open); statement needs reformulation" (D6R:243) | A1 chirality: it asks a 1D tower for a chiral net, against D2/D4/D5 and its own K3/K6 (D6R:76-98). It also contains Bischoff's realisation problem, and automorphism lifting is unstated (D6R:11-31) | No shard. P1, P2, N1 and R1 went into CA-76 (76.3, 76.1, 76.A, 76.5); K0-K12, P3, P4, N2 and N3 remain in the note (S75:239-243) |

## 5. Gaps

**Empty or unpopulated grid cells**, from S88:102-108 and :136-155:
- **R5**: "none" at any data layer.
- **R3**: "no categorical instance" in any setting. R3 is only an assumption: (F1) of 80.9/93.8 and the conclusion of D2-C.
- **R4 at L0..L3 with categorical input**: empty. The only R4 entry is CA-82 Ising at L4, which "reads no F,R" (S88:273).
- **R2**: no instance of VR-1 anywhere. P0-P3 are not verified even for the free fermion (S79:18, :258). CA-91's "R2 [cond.]" is conditional.
- **R1 at L0..L3 on a categorical tower**: only conditional ingredients (76.1, 76.6, 90.W). 90.V covers only the trivial vacuum. The only WT-1 instance is the free-fermion one, which is nonlocal and not uniform in row (S76:268).
- **S_ch at L0/L1 above R0**: empty. The LC continuum rows are at L2-L3 and reach only →R3/R4.

**Empty pipeline stages in CA-75**:
- Contract item 10 (covariance) and item 11 (analytic completion) have "[C] none" (S75:201-205).
- Item 9 (generator convergence) has "VR-1 (no instance)" (S75:199).
- Link (a): only a2 is partly answered, for cuts along tile legs (S80:137-140) and for the CA-92 one-tile seam. a1 (typing) and a4 (limit) are "untouched" (S80:140).
- Link (b3) is **open** (S76:247-249).
- The open/periodic interface is unresolved. CA-76/77 use open chains, while LC-4's KS tier is periodic (S76:251-253; worklog 020:224-225).

**Source gaps CA-88 and the shards list**:
- Def 88.1 general chirality source gap: no local source on whether a 1D local tower can have a c_L≠c_R chiral limit; nearest is 1903.12334:76 (S88:73-80).
- Ribbon identity for seam pairing at L1 "not locally sourced" (S88:120).
- Reshetikhin-condition attribution for (78.3): "LOCAL SOURCE MISSING" (S78:33, :131-132).
- Quasi-locality and cluster-expansion sources for D3-C are not local (S76:216-217).
- PP 1986 and finite-dimensional index sources (repair route iii) are a Law 1 gap, now bypassed by 93.2 (S80:200).
- The Mosco-convergence source for D1-C was cited only from memory (D1I:113-116).
- The FRS Morita statement is "stated; proof deferred by the authors" (S77:37, :167-168).

**Stated without check or citation, or internally inconsistent**:
1. S88:263 still says "R0^u at bare L0 is open (Target 90.T)", and S88:117-118 says "arbitrary dyadic lifts open (Target 90.T)". The round-3 paragraph at S88:245-246 says Target 90.T is superseded and R0^u is reached at bare L0 for CA-96 group-graded families. The Def. 88.3 R0^u row ("so L1", S88:103) is also stale.
2. The CA-88 grid table has **no rows for CA-95..CA-100**; they appear only in the verdict sentence.
3. CA-88 uses the setting tag "open", which is not in the (aq) vocabulary {chiral, full, both, any} (CONVENTIONS.md:1527-1528).
4. The CA-76 status line lists Remark 76.8 as conditional, but the body says "derived arithmetic on conditional inputs" (S76:14 vs :182).
5. CA-75 Link (b) writes ε_n for the quantity CA-76 calls q_n. The clash is acknowledged (S76:59-60), but CA-75 still also uses r_n for the mismatch.
6. Theorem 77.5, the decidable blocking test, has no executed check. The CA-77 bundle covers only refinement, grid, corner and reactions.
7. All CA-76..80 evidence is exploration Python. No Julia port and no `runs/` bundle exist (Law 3 is only partly met).

## 6. Honest assessment

Partly. The integration is real at the level of citations and notation, but not yet at the level of proofs.
- **Citation and notation**: the later shards do cite several approaches at once.
  - CA-76 combines the CA-72 tower defect with cft_machine WT-1, and names the LC-4 interface.
  - CA-79 ties CA-14 KS modes and VR-1 to CA-68/71 refinements and LC-12.
  - CA-80 ties CA-86 history sums to LC-9 FP-D and KLM index theory.
  - CONVENTIONS (al)-(aq) give them a single sign and tag system.
- **The two joins that make it one pipeline are still Questions.** Link (a) has a1/a4 untouched. Link (b) has b2 answered by 76.1, b1 answered locally only with extra data (CA-90/CA-96), and b3 open.
- **No two rung certificates exist on the same system.** Remark 88.4 requires one (S88:122-125), so nothing composes yet.
- **What moved since 2026-10-22:**
  - R0^u became reachable: first at L0+relative half-braiding (CA-90, round 2), then at bare L0 for group-graded families (CA-96, round 3).
  - The 80.9 index gap closed via 93.2, with the data layer lowered to L0/L1+L4. It is still conditional on R3 and has no instance.
  - D1-C was proved for the tuned family (CA-94). That is an off-ladder z=2 result.
  - CA-88 itself says no other cell moved up a rung in rounds 2 and 3 (S88:242-246).
- **Highest-leverage empty cell: R1 at L0/L1 on the local unital tower of CA-90/CA-96** (Link b3). It is the one cell where the tower, the WT-1 drift bounds (76.1, 76.6) and the dynamics (CA-78/86) must meet on one system, and R2 cannot be stacked until it exists.
- **Cheapest unblocker: P0-P3 for the quasi-free calibration** (S79:249-256). It is category-free, but it would give the first VR-1 instance and test whether the R2 interface is even satisfiable.
- **Two hygiene items** would make the grid trustworthy as a status board:
  - fix CA-88's stale R0^u/90.T sentences and add the CA-95..100 rows;
  - port the round-1 check bundles to Julia.
