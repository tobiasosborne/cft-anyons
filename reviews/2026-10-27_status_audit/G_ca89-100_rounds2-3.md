# Status audit: CA-89..CA-100 (Astra rounds 2-3), 2026-10-27

Read-only audit. Every shard 89-100 was read in full, along with AGENTS.md, CONVENTIONS (aq)-(ax),
the E*/F* REVIEW headlines, the G1/G6 notes (ledgers and key proofs) and worklog 021/022.
Grades are given exactly as the shards write them. Nothing has been upgraded.

**Abbreviations.** `NN:L` means `report/sections/NN_<slug>.tex` at line L.
E1..E6 = `explorations/2026-10-22-astra-r2/E{1..6}-*/`. F1..F6 and G1, G6 = `explorations/2026-10-25-astra-r3/*/`.
Tags follow (aq): setting; data; rung. "cf" = category-free. "decl." = declared data.
"H" = pointed unitary relative half-braiding (Def. 90.H). "ZC" = finite zero-mode commutator certificate.
"RH" = reflected-half hypothesis. Every check is Python (SymPy/NumPy, sometimes Float64) inside the exploration
dirs. None is ported to `scripts/` with a run bundle (90:19-20; worklog 022 open threads).

## 1. Results table

### CA-89 Ward-to-KS transfer
Parent REVIEW (E4): WEAKER-RESULT-PROVED (89:12). Checks: E4 `checks/run_checks.py` (five groups, five mutations rejected)
and `checks/review/review_checks.py` R1-R4 PASS (89:22-24). These checks verify finite identities only, not W1/W2.

| # | Statement for general C (extra data) | Grade as written | Tags | Check | Loc |
|---|---|---|---|---|---|
| Conj E4 | Gate-derivative + Ward contacts => A4, A3 for any refinement, c = contact | conjectural as posed; (b) FALSE, (a) unproved | full; L0; R2 | - | 89:63 |
| 89.1(i) | Geometric modes with A2+A4 and vanishing discrepancy d -> 0 => KS modes A2, A4 (explicit bound) | conditional | full/one family; cf; ->R2 | - | 89:73,103 |
| 89.1(ii) | Holomorphic metric families with Cauchy bound (89-holo) => A3 | conditional | same | - | 89:77,152 |
| 89.1(iii) | A2 + A4-type residuals + periodic translation U_r (decl.; Z(C) datum if non-braided) => z_mn = (m^3 c* - m c)/12; c* = 12 kappa_3, c = 24b - 12 kappa_1 | conditional | same | R4 | 89:80,189 |
| 89.2 | Graph-norm product/loss calculus | derived | any; cf | - | 89:88 |
| 89.3 | Literal control K = 1+(H-E0)/v violates A2 | negative, derived (reviewer) | full; cf; ->R2 | R2 (0.849, 2.072, 3.119) | 89:92 |
| 89.4 | Summable insertion error does not bound commutators | negative, derived | any; cf | - | 89:117 |
| 89.5 | W0-W3 => A4 for geometric modes ("beta_N-A4 => A4") | conditional (demoted) | full; cf; ->R2 | - | 89:122 |
| Rem F1 | W2 *is* A4 with beta_N; the local route is "plausibly never satisfied" | derived (reviewer) | - | R1 (4e-15) | 89:136 |
| 89.6 | Uniformly close gate families need not have close metric derivatives | negative, derived | any; cf | - | 89:165 |
| 89.7 | A3 for J and for the translated J' together => c* = 0 | negative, conditional reductio (reviewer) | full; cf; ->R2 | R4 | 89:172 |
| 89.8 | Plane residue formula for z_mn; kappa dictionary | derived, formal | both; cf; ->R2 | - | 89:207 |
| 89.L | Probe-word Ward-to-residual => W2 | proposal | full; cf; ->R2 | - | 89:225 |
| First gap | Operator lift W2 of D2 contour identity (19) | open | - | - | 89:219 |

### CA-90 Local unital lifts
Parent REVIEW (E1): PROOF-COMPLETE for the braided headline; non-braided converse WEAKER-RESULT-PROVED, sharpened by R-1 (90:15-17).
Checks: E1 `checks/output.txt`, `red_phase_free.txt` (phase-free crossing RED, 0.786), `review_pointed_lift_output.txt`,
`review_one_gap_obstruction_output.txt`. These are Float64 calibrations (90:54-55).

| # | Statement | Grade | Tags | Check | Loc |
|---|---|---|---|---|---|
| 90.H | Pointed unitary relative half-braiding of (O, eta) on full <O> | definition | L0 + decl. | - | 90:69 |
| 90.R | Braiding gives H; Z(C) lift stronger; central eta needed | derived (contains a Law-1 gap: c_{Y,1} = id not cited) | L0/L1 | review_pointed:12 | 90:79 |
| 90.0 | One-gap lift beta is unital, injective, intertwines, support pattern (90.1) | derived | any; L0+H; R0^u | output.txt | 90:89 |
| 90.1 | Dyadic lift alpha_L = B_L(a (x) 1)B_L^dag: unital, injective, extends V_L, support [2j-1, 2k-1] (r = 0), exact degree, natural, WT-1 A1 | derived; PROOF-COMPLETE | any (open chain); L0+H (so L1 suffices); R0^u | output.txt, red_phase_free | 90:110 |
| 90.N | N_2L - alpha(N_L) has norm L; no bounded absolute-number shift | derived, negative | same | - | 90:149 |
| 90.W | Drift d_kn <= p_n e_n + 2(1-p_n) | derived | any; L0+H, decl. states; ->R1 | - | 90:155 |
| 90.V | (a) Vacuum product state gives an R1 limit; (b) alternating vacuum/occupied gives drift 2 | derived; (b) negative | any; L0+H; R1 (trivial vacuum only) | - | 90:162 |
| 90.2(a) | H <=> finite system (90.5); [O][x] = [x][O] in K(<O>) is necessary | derived | any; L0; ->R0^u | - | 90:175 |
| 90.2(b) | (90.6) obstructs every one-gap lift with unchanged-side pattern | derived (reviewer R-1); negative | any; L0 | one_gap_obstruction | 90:193 |
| Boundary | Arbitrary local dyadic lifts at L0 | open | - | - | 90:210 |
| 90.3 | B_L has depth L-1; any range-w depth-D circuit has D(w-1) >= L-1 | derived | any; L0+H; R0^u impl. | - | 90:215 |
| 90.D | Supplied circuit U => slack r = 2D(w-1) | derived implication | +supplied U | - | 90:232 |
| 90.T | Bratteli obstruction survives slack, or a Vec_S3 lift | proposal | any; L0; ->R0^u | - | 90:245 |

### CA-91 Parity and chiral/full delineation
Parent REVIEW (E2): WEAKER-RESULT-PROVED, no invalid step (91:13). Checks: E2 `checks/check_e2.py` (exact; six mutations
rejected) and `review_e2_checks.py` (numpy; includes a Vec_Z3 instance) (91:25-27).

| # | Statement | Grade | Tags | Check | Loc |
|---|---|---|---|---|---|
| 91.1 | Both KS families VR-1 + complex-linear parity P with [P,K] = 0 => c_L = c_R and c*_L = c*_R; common domain | conditional | full; cf; R2 | raw_output | 91:85 |
| 91.2 | Adding PC (P^2 = 1, PJ = JP) gives a limiting unitary involution | conditional | same | - | 91:101 |
| 91.3 | Specified P_r need not converge (O = 1+1) | derived, negative | cf | - | 91:106 |
| 91.4 | Antiunitary (dagger-type) reflection preserves chirality and constrains nothing | derived (reviewer) | cf | review_raw:7-8 | 91:111 |
| Identity | Antisymmetrised mixed bracket -> 0 (equal ledgers) | derived | full; cf | exact | 91:118 |
| 91.5 | Equal ledgers: all mixed brackets vanish iff [T0, Tbar0] = 0; ZC sufficient | conditional | full; cf; R2 | - | 91:125 |
| 91.6 | +MW => explicit loss-4 mixed bounds | conditional | full; cf; R2 | - | 91:141 |
| 91.7 | Current-momentum (12) + (13) => MW; (12) is the gap | conditional | full; cf; ->R2 | - | 91:152 |
| 91.8 | A1-A4 alone do not give mixed commutation (Witt shifts) | derived, negative | cf, not KS | review_raw:9-10 | 91:165 |
| 91.9 | Exact ZC depends on the density split | numerical (reviewer) | - | review_raw:3-6 | 91:172 |
| 91.10 | Absent right stress + parity => scalar left stress, c* = 0, c = 24t | conditional | full (delineation); cf; R2 | - | 91:179 |
| 91.11 | H(lambda) = sum k - lambda Q breaks P iff lambda Q != 0 | derived | any; L0; ->R0 | - | 91:195 |
| 91.12 | No parity breaking on O = 1 | derived, negative | any; L0 | - | 91:200 |
| 91.13 | Flags O (x) (1+1) always allow parity-odd terms | derived | any; L0; ->R0 | raw_output:2 | 91:203 |
| 91.14 | Tilt lambda: a tilt is not deletion of a family | conditional | full; cf; R2 (fixed rep.) | - | 91:209 |
| 91.15 | Conjugate-dual mirror carrier gives linear parity for non-self-dual O | derived | any; L0 + unitary spherical duality; ->R0 | review (Vec_Z3) | 91:215 |
| Next lemma | Zero-mode/current-momentum lemma | conjectural target | full; cf | - | 91:233 |

### CA-92 Spatial seams and RP
Parent REVIEW (E3): WEAKER-RESULT-PROVED (92:12). Checks: E3 `checks/check_seams.py`, `check_categories.py` (with mutations),
`review_checks.py` (19 PASS) (92:20-21).

| # | Statement | Grade | Tags | Check | Loc |
|---|---|---|---|---|---|
| 92.1 | Seam pairing s: W+ -> W-, s coev = ev^dag | declaration | L0 + decl. s | - | 92:61 |
| 92.2 | s exists iff O(x)Obar and Obar(x)O have equal multiplicities | derived | L0 | review:37-40 | 92:69 |
| (RH) | Reflected half-patch read through s = adjoint | hypothesis, not derived | - | - | 92:96 |
| 92.3 | Single-tile spatial RP iff every block K^a of K_s(T) is PSD | derived, conditional on s and (RH) | full (twisted for chiral); L0+s; finite ->R3 | - | 92:99 |
| 92.4 | Multi-tile sufficiency under compatible tensoring | conditional | same | - | 92:113 |
| 92.5 | Linear history 1+th: exact Schur criterion, uniform in N, M | derived, conditional on s, (RH), one tile | same | review:31-32 | 92:128 |
| 92.6 | Self-adjointness neither necessary nor sufficient; witnesses depend on s | derived, negative | full; L0; finite | seams:2-5 | 92:157 |
| 92.7 | Hermiticity iff h = P h^dag P | derived in Vec/flip; conjectural in general | - | review:33 | 92:173 |
| 92.8 | Finite OS contraction lemma | derived | any; cf; finite ->R3 | - | 92:181 |
| 92.9 | E3(b) crossing and E3(c) commutator ill-typed; no single-tile similarity | derived, negative | full; L0 | - | 92:199 |
| 92.10 | YBE-closure commutation; defect sum; third-order commutator | derived under hypotheses | any; cf | seams:7 | 92:209 |
| Coherence | Reflection-coherence lemma (L0+psi or L1) | proposal | full; L0+psi/L1 | - | 92:229 |

### CA-93 Normal limit expectations and fidelity
Parent REVIEW (E5): PROOF-COMPLETE under the stated hypotheses (93:17-18). Checks: E5 `check_expectations.py` (four groups,
five mutations rejected) and `review_check.py` (X1, X2, calibration) (93:19-20).

| # | Statement | Grade | Tags | Check | Loc |
|---|---|---|---|---|---|
| 93.1 | Cost lower semicontinuity under positive approximation | derived | any; cf; ->R4 | - | 93:68 |
| 93.2 | Bounded exhaustion + common normal state faithful on N + liminf K(E_k) = b => unique normal E >= b^-1 id | derived | any; cf; ->R4 | raw_output | 93:77 |
| 93.3 | Jones projections converge (consequence) | derived | any; cf | - | 93:113 |
| 93.4 | Compatible case: exact extension criterion, K(E) = lim K(E_k) | derived | any; cf | - | 93:119 |
| 93.5 | X1: compatible, cost-2 stages, no normal extension | derived, negative | cf | review | 93:134 |
| 93.6 | X2: Jones convergence without exhaustion underestimates index | derived, negative | cf | review | 93:142 |
| 93.7 | R(x)1 in R(x)M_n: bound attained | derived (review) | cf | review_raw:6 | 93:149 |
| 93.8 | Completely rational net (R3, assumed) + fully faithful C -> DHR_fin + 93.2 with b <= Dim C => mu = Dim C, equivalence; braided at L1 => C modular | derived implication | chiral; L0+L4 / L1+L4; R4 given R3 | - | 93:158 |
| 93.9 | Doubled net has DHR = C (x) C^rev = Z(C) | derived | full (doubled net); L2+L4; R4 | - | 93:185 |
| 93.10 | Diagonal LR extension has trivial DHR; "DHR = Z(C)" false | derived, negative | full; L2+L4 | - | 93:196 |
| 93.11 | Endpoint operators => functor (F2) | conditional | chiral; L2+L4 | - | 93:207 |
| 93.12 | Annular finite inclusions => (F3'') | conditional | chiral; L2+L4 | - | 93:214 |
| 93.13 | Combination => 93.8 applies | conditional | chiral; L2+L4; R3->R4 | - | 93:220 |
| Next | Annular approximant lemma | proposal | any; cf, then L0+L4 | - | 93:230 |

### CA-94 Number-changing collision dynamics
Parent REVIEW (E6): COUNTEREXAMPLE (verified) to E6, with a proof-complete replacement (94:15). Checks: E6 `check_e6.py`
(five groups GREEN, three mutations RED), `review_N1_N3.py`, `review_tuned_convergence.py`. Finite algebra only (94:19-20).
Common tags: any (open interval); L0 + declared reactions and contact tuning.

| # | Statement | Grade | Rung | Check | Loc |
|---|---|---|---|---|---|
| 94.1 | Fixed pure-hop density: no full-Fock projected-resolvent limit after any scalar subtraction | negative | - | review_N1_N3:1-4 | 94:64 |
| 94.2 | Correct scalings: hop eps^-2, contact eps^-1, fusion cross eps^-1/2, pair cross eps^0 | derived | ->z=2 | tuned:6 (mutation) | 94:86 |
| 94.3 | Face-trace continuity H^1 -> L^2 | derived | ->z=2 | - | 94:108 |
| 94.4 | Collision form q is closed, with a core and a unique H | derived | ->z=2 | - | 94:113 |
| 94.5 | Collision-trace Mosco lower bound | derived | ->z=2 | - | 94:124 |
| 94.6 | Tuned D1-C family converges (projected resolvent) on the whole Fock carrier | derived | R0^c + off-ladder z=2 | tuned_convergence | 94:141 |
| 94.7 | Number change iff beta != 0 or nu != 0 | derived | z=2 | - | 94:155 |
| 94.8 | Interior-boundary equations on regular vectors | derived on regular vectors; global H^2 conditional | z=2 | - | 94:162 |
| 94.9 | Limit is not an extension of A_min | negative | - | - | 94:169 |
| 94.10 | Coefficient image is a finite PSD block cone | derived | z=2 | - | 94:177 |
| 94.11 | (G_r) forces every range-r limit to conserve occupation | negative | - | review_N1_N3:5-8 | 94:199 |
| 94.12 | Naturality under tensor equivalence (not R5) | derived | L0 nat. | - | 94:214 |
| 94.13 | Range-r extension under listed hypotheses | derived estimate; range r conditional | ->z=2 | - | 94:218 |
| 94.14 | No H^1 triple-trace (codim 2) | negative | - | - | 94:224 |
| 94.15 | C enters only via fibres, Hom spaces, cones and (G_r); estimates category-inert | derived | - | - | 94:229 |
| 94.16 | Contact trichotomy (Robin / Dirichlet / no limit) | conjectural; REFUTED by 99.7 | same | - | 94:240 |

### CA-95 Probe-word Ward lifting
Parent REVIEW (F4): WEAKER-RESULT-PROVED (95:11). Checks: F4 `fermion_check.py`, `review_independent.py`; review rerun
three GREEN, three RED (95:239-243). Float64.

| # | Statement | Grade | Tags | Check | Loc |
|---|---|---|---|---|---|
| 95.1 | Uniform physical probe bound (alpha_s < 1) => abs(R)_{s,2} <= C_{s,alpha} b | derived | any; cf; ->R2 | review_independent | 95:38 |
| 95.2 | G1 (endpoints), G2 (contacts), G3 (errors) => W2 | conditional | full/family; cf; ->R2 | - | 95:58 |
| 95.3 | +A2 + discrepancy -> 0 => KS A4, c* = 12 kappa_3, c = 24b - 12 kappa_1 | conditional | same | - | 95:79 |
| 95.4 | Fixed-word decay cannot replace a uniform bound | negative | any; cf | - | 95:87 |
| 95.5 | Local KS chain with A1-A4 and dense probes, but divergent subcritical collar constants; limiting stress zero | negative | full; cf; trivial R2 | - | 95:93 |
| 95.6 | W2 <=> uniform assembled pairing bound; critical heat exponent | derived | any; cf | - | 95:135 |
| 95.7 | Extra uniform regularity repairs the analytic converse | conditional | any; cf | - | 95:147 |
| 95.8 | AP chiral CAR (modified modes), n = 1,2,3: explicit O(1/M) graph bounds | derived | AP chiral CAR; cf; ->R2 | fermion_green | 95:156 |
| 95.9 | Same CAR with K = 1+E_chiral: residual >= 1 | negative | same | - | 95:184 |
| 95.10 | Spectral cocycle estimators -> c = c* = 1 (1/2 self-dual) | derived | same | - | 95:195 |
| 95.11 | Explicit L0 insertion k - eps - J in a dagger-stable tile basis | derived | any locally/full; L0; ->R2 | - | 95:202 |
| 95.12 | Quantitative two-ordering endpoint realization | conjectural | full; cf; ->R2 | - | 95:250 |

### CA-96 Blocked dyadic lifts
Parent REVIEW (F1): COUNTEREXAMPLE to the brief's equivalence; all 35 steps accepted (96:10-13). Checks: F1 four
baseline/mutation pairs plus `review_r3_multiblock.py` (and its `_red`) (96:25-26, 42-44).

| # | Statement | Grade | Tags | Check | Loc |
|---|---|---|---|---|---|
| 96.1 | Vacancy swap S = S^dag = S^-1; U_s(1 (x) eta^s) = V_s | derived | any; L0 pointed; ->R0^u | - | 96:63 |
| 96.2 | Pointed transport ("blocked H") on P = O^b over full <O> => local unital dyadic lifts on the original A_L, exact V_L, slack 2b-1 | derived | any (open); L0 + blocked H; R0^u | multiblock (Vec_Z2, b = 3, L <= 7) | 96:75 |
| 96.3 | Vec_G with G nonabelian, O = R + g (g noncentral): lifts exist although (b) and (c) fail | negative (with derived R0^u witness) | any; bare L0; R0^u | - | 96:120 |
| 96.4 | One-gap restriction equation concerns P, not O; extrapolation to dyadic cuts fails | derived | any; L0; ->R0^u | - | 96:137 |
| 96.5 | Vec_A^omega: transport <=> twisted projective rho_g; kappa^{m_g} = 1 | derived | any; L0 abelian graded | - | 96:152 |
| 96.6 | (F_p)^3 with trilinear omega: (b) holds, (c) fails, (a) holds | negative (witness via 96.7) | any; bare L0; R0^u | - | 96:173 |
| 96.7 | Any abelian p-group A, any omega, any pointed O: b = p^{e+d-1} gives transport, hence lifts | derived | any; bare L0; R0^u | - | 96:187 |
| 96.8 | Naturality under pointed unitary monoidal equivalences (not R5) | derived | L0 + transported H | - | 96:210 |
| 96.9 | Drift bound for blocked lifts | conditional | L0 + blocked H + decl. states; ->R1 | - | 96:230 |
| 96.10 | (a) => finite-power transport on some O^b | conjectural | any; L0; ->R0^u | - | 96:270 |

### CA-97 What the tower remembers
Parent REVIEW (F6): WEAKER-RESULT-PROVED (97:11). Checks: F6 `check_f6.py` (six groups), `review_twisted_refinement.py`,
and five intended assertion failures (97:39-45).

| # | Statement | Grade | Tags | Check | Loc |
|---|---|---|---|---|---|
| 97.1 | Trailing tower i_L(a) = a (x) 1_O is local, unital, AF; K_0 = rooted reachable unfolding of N | derived | any; L0; R0^u (trailing) | check_f6 | 97:59 |
| 97.2 | K_0 = order ideal I_u of G_N; pointed O gives primitive N and I_u = G_N | derived | any; L0; R0^u | - | 97:80 |
| 97.3 | Invertible generator: rooted K_0 = Z, but G_N = Z^q | negative | any; L0; R0 | - | 97:94 |
| 97.4 | Spherical trace tau is compatible; unique if N is primitive | derived | any; L0; R0 + trace | - | 97:102 |
| 97.5 | tau is invariant under the fixed-H shuffle: zero drift | derived | any (open); L0+H; R1 tracial only | - | 97:114 |
| 97.6 | Unital *-maps of multimatrix algebras <=> integer T with Tb = c | derived | cf; ->R0 | - | 97:119 |
| 97.7 | Based-ring isomorphism carrying [O] gives a trailing-tower isomorphism | derived | any; L0; R0^u | - | 97:127 |
| 97.8 | Sequential unital AF limits are classified by scaled ordered K_0 (no local primary source; proof given inline) | derived | cf; ->R0 | - | 97:134 |
| 97.9 | Regular site in Hilb(G, omega) and Vec with q1 have the same AF limit | negative | any; L0; R0 | - | 97:151 |
| 97.10 | Inequivalent cocycles give isomorphic stage-filtered towers with the same trace: F is not decodable | negative | any; L0; R0 | review_twisted | 97:165 |
| 97.11 | Fixed H: dyadic square, delta endomorphism, delta_* = id, tau delta = tau | derived | any (open); L0+H; R0^u | - | 97:183 |
| 97.12 | Abstract dyadic diagram is isomorphic to the trailing one (forgets H, F) | derived | L0+H; R0^u | - | 97:199 |
| 97.13 | Named marks h, i, j recover t_O and hence all of H | derived | L0+H + marks; R0^u | - | 97:206 |
| 97.14 | Lengthwise CA-90 axioms do not imply the square (E-H) | negative | L0; R0 | - | 97:220 |
| 97.15 | Restatement of 93.2 + 93.8 | conditional | chiral; L0+L4 / L1+L4; R4 given R3 | - | 97:225 |
| 97.16 | Interval/dilation record forces equivalence transporting eta, H | conjectural | any (open); L0+H; R0 info | - | 97:265 |

### CA-98 Canonical seams and reflection coherence
Parent REVIEW (F3): WEAKER-RESULT-PROVED (98:12). Checks: F3 six scripts; five targeted mutations fail (98:27-30).

| # | Statement | Grade | Tags | Check | Loc |
|---|---|---|---|---|---|
| 98.1 | Canonical seam s_can = c_{O,DO}(t_O (x) 1), natural under braided equivalences | derived | any; L1; finite ->R3 | core/pointed | 98:61 |
| 98.2 | D gives antiunitary cut mirrors respecting inverse-Gram sewing | derived | any; L0; ->R3 | duality | 98:87 |
| 98.3 | Self-duality defects z_X; cut square nu_W / nu_a | derived | L0 + identifications | nonpointed | 98:98 |
| 98.4 | Any unitary psi: O -> DO gives a seam s_psi | derived | any; L0+psi; ->R3 | - | 98:112 |
| 98.5 | Seam-Hermiticity involution sharp_s; K_s(h) Hermitian iff sharp_s h = h | derived | L0+s (L1 for s_can) | - | 98:122 |
| 98.6 | Arbitrary self-duality gives no observable involution; no tile reflection works with either variance | negative | L0 (L1 witness) | pointed:18-40 | 98:139 |
| 98.7 | G1-G3 + local Schur certificate => whole-patch spatial RP, uniform in brick count | conditional | full; L0+G1-G3; ->R3 | - | 98:162 |
| 98.8 | Finite OS normalization without q1 <= q0 | derived (categorical application conditional) | any; cf; ->R3 | core | 98:182 |
| 98.9 | Identity histories: no unitary conjugacy of transfers; explicit OS quotients of dim 1 vs d^N | negative (reviewer repair derived) | full torus; L0 | history | 98:195 |
| 98.10 | Real-self-duality two-tile reflection | conjectural | L0 + real psi; ->R3 | - | 98:269 |

### CA-99 Signed contact classification
Parent REVIEW (F5): COUNTEREXAMPLE to F5; exact-family replacement PROOF-COMPLETE (99:12). Checks: F5 reviewer outputs,
`review_manifest.json`, caught mutations (99:252-253). Common tags: any (open); L0 + declared family; R0^c + off-ladder z=2.

| # | Statement | Grade | Check | Loc |
|---|---|---|---|---|
| 99.1 | N <= 2 Galerkin: a projected-resolvent limit exists iff alpha_eps -> alpha finite, or abs(alpha_eps) -> infinity (sign oscillation allowed) | derived | graph_core | 99:64 |
| 99.2 | Limit form q_alpha with retained W_n; compressed resolvent != resolvent of compression | derived | - | 99:79 |
| 99.3 | Signed-trace absorption and compactness (cf, fixed fibre) | derived | trace_invariants | 99:103 |
| 99.4 | Finite alpha: closed form, resolvent convergence to H_alpha | derived | - | 99:121 |
| 99.5 | Domain and Robin collision equation | derived | - | 99:133 |
| 99.6 | abs(alpha) -> infinity, either sign: Dirichlet, sectors decouple, W_n retained | derived | graph_core | 99:151 |
| 99.7 | c = -6t: Dirichlet limit despite spectral diving; refutes 94.16 | negative | - | 99:174 |
| 99.8 | Nonreacting full Fock, s_L eps^-6 of either sign: Dirichlet chamber Laplacians | derived | - | 99:182 |
| 99.9 | Positive family, alpha >= a: full-Fock convergence | derived | - | 99:199 |
| 99.10 | Fixed total alpha < 0: no common lower bound | negative | - | 99:209 |
| 99.11 | Internal diagonals defeat the scalar classification, even under (G_r) | negative | - | 99:219 |
| 99.12 | Range-r extension under listed hypotheses | conditional | - | 99:234 |
| 99.13 | Signed reacting full-Fock realization (an open target, labelled "conditional") | conditional (open) | - | 99:268 |

### CA-100 Zero modes and lattice chirality
Parent REVIEW (F2): WEAKER-RESULT-PROVED (100:11). Checks: **the shard cites none.** The bundle exists:
F2 `checks/check_f2.py` with `--mutate shift/central/cubic` (rejected), `check_range_and_kernel.py`, `review_f2.py`
(F2 REVIEW:281-296).

| # | Statement | Grade | Tags | Check | Loc |
|---|---|---|---|---|---|
| 100.1 | Common A1-A3: [L_m, S_n] = 0 on D iff finite loss-2 bracket -> 0; explicit A3 tail | derived | any; cf; ->R2 | - | 100:58 |
| 100.2 | C_mn - C_nm = delta gamma_m I; C_mn = X_{m+n} + ... (no parity, no ZC) | conditional | full; cf; R2 restriction | - | 100:77 |
| 100.3 | A nonzero common standard-KS system has c*_L = c*_R | conditional | same | check_f2 (F_4 paths) | 100:96 |
| 100.4 | X_0 = 0 <=> ZC <=> all mixed brackets vanish; both ledgers equal | conditional | same | - | 100:123 |
| 100.5 | For any C, O = 1+1: F2(a) hypotheses hold, but every logarithm p_r has abs(D - p)_{s,1} >= N/2 | negative | full; L0; trivial R2 | - | 100:142 |
| 100.6 | A formal *-Lie algebra with parity and grading has X_0 != 0 | negative | full grading; cf; formal | --mutate shift | 100:153 |
| 100.7 | Range-rho cut current and Fourier identity | derived | periodic; cf; finite | range_kernel | 100:174 |
| 100.8 | Corrected modes + component bounds => 100.3, 100.4 | conditional | full; cf; ->R2 | - | 100:188 |
| 100.9 | Commutation range does not bound spatial support | negative | periodic; cf (L0 realisation) | review_f2 | 100:203 |
| 100.10 | Declared positive-energy target compressed gives VR-1 with zero right ledger | conditional | declared chiral; L4; abstract R2, no local tower | - | 100:212 |
| 100.11 | AP Fourier kernel ~ 1/abs(d), not summable | derived | periodic; cf | range_kernel | 100:228 |
| 100.12 | Coarse-vector zero-mode limit under F2(a) | conjectural | full; cf; ->R2 | - | 100:268 |

## 2. The three threads

**(a) LIFT/TOWER (CA-90 -> CA-96 -> CA-97, with G1 and G6).**
- 90.1: a local unital injective dyadic lift on the open chain, for any C and pointed O = 1 + X carrying H on full <O>
  (a braiding suffices). Support [2j-1, 2k-1], exact degree, WT-1 A1. 90.2 gives the finite H-equations and the
  necessary centrality [O][x] = [x][O]; centrality obstructs only one-gap lifts with unchanged sides.
- CA-96 drops the single-site requirement: transport on a fixed power O^b gives slack 2b-1 (96.2). Hence R0^u at bare
  L0 for Vec_G with a noncentral site (96.3) and for every Vec_A^omega, A an abelian p-group (96.7). Centrality is
  neither necessary for lifts (96.3) nor sufficient for transport (96.6); 90.T's deduction is refuted.
- G1 (unreviewed): any transportable pointed ancilla K with u: O (x) K -> O (x) O gives slack-1 lifts (G1.1); gauge
  classification is false (G1.2); dihedral Vec_G with O = 1 + a + b + ab has lifts but no power O^n has transport
  (G1.3). If this holds, 96.10 is refuted. The Vec_S3 carrier 1 + (12) + (123) stays undecided.
- CA-97: the trailing AF limit is classified by rooted scaled ordered K_0 (97.1, 97.8). It forgets [O], the fusion ring
  (97.9) and F, even with the canonical trace (97.10). The abstract dyadic diagram forgets H (97.12); named finite marks
  recover it (97.13). G6 (unreviewed): interval/dilation records do not fix (O, eta, H) (G6-B).
- Net: R0 is reached but unfaithful. The only zero-drift states are the vacuum product state (90.V) and the trace
  (97.5), both trivial. Every tower is open-chain; there is no periodic seam (90:242-243; 96:250-251).

**(b) KS/VIRASORO (CA-89 -> CA-91 -> CA-95 -> CA-100).** All category-free conditional interfaces into VR-1.
- 89.1: transfer of A2/A4 from geometric modes, A3 from holomorphic coordinate-resolved matching, forced cocycle
  c* = 12 kappa_3, c = 24b - 12 kappa_1 (only c* is a Ward output). Remark F1: W2 *is* A4.
- 95.1-95.3 reduce W2 to uniform probe bounds plus G1-G3 (endpoints, cylinder contacts, accumulated error), none
  verified. 95.5: a local KS chain meets A1-A4 with zero limiting stress, so VR-1 does not exclude collapse.
- 91.1: a complex-linear parity forces c_L = c_R; an antiunitary one does nothing (91.4). With equal ledgers, all
  mixed brackets vanish iff the zero-mode commutator does (91.5).
- CA-100 removes parity and equal ledgers: on a nonzero common standard-KS system the cubic ledgers agree (100.3), and
  ZC <=> X_0 = 0 <=> all mixed brackets vanish, giving equal ledgers (100.1, 100.4). Automatic ZC is open (100.12);
  100.5 (logarithm), 100.6 (formal algebra, X_0 != 0) and 100.9 (support) block the easy routes.
- Chirality: absent right stress forces c*_L = 0 (100.4), so no nonzero-anomaly chiral target arises from a periodic
  standard-KS common system. The only escape shown leaves the KS class (100.10/100.11: declared L4 target, nonlocal
  regulator). The only nontrivial calibration is modified-mode CAR, three diagonal brackets (95.8-95.10).

**(c) EUCLIDEAN/RP (CA-92 -> CA-98) and FIDELITY/COLLISION (CA-93; CA-94 -> CA-99).**
- RP: a seam exists iff O(x)Obar and Obar(x)O have matching multiplicities (92.2); canonical at L1 (98.1), and at
  L0+psi (98.4). One-tile RP (92.3) and the linear-history Schur criterion (92.5) are conditional on (RH); whole
  histories on G1-G3 (98.7). No coherent reflection exists for any brick grammar. Negatives 92.6, 98.6, 98.9; OS
  only as the finite lemmas 92.8, 98.8.
- Fidelity: 93.2 (normal limit expectation from finite data) and 93.8 (two-sided fidelity at L0+L4, braided at L1+L4)
  are proof-complete but have no instance (93:224-228). 93.10 kills "DHR(diagonal) = Z(C)".
- Collision: 94.6 (tuned D1-C converges), 94.1 (fixed densities do not), 99.1 (N <= 2 scalar contact: finite gives
  Robin, divergent of either sign gives Dirichlet), 99.7 (refutes 94.16's no-limit branch). All R0^c plus an off-ladder
  nonrelativistic z = 2 limit; this branch feeds no conformal rung.

## 3. Strongest positive results (derived or PROOF-COMPLETE, general C)

| Result | Data needed | Rung actually reached |
|---|---|---|
| 90.1 (+90.0, 90.3) | L0 + H on full <O> (braiding suffices) | R0^u, open chain, r = 0 |
| 96.2 | L0 + pointed transport on O^b | R0^u, slack 2b-1 |
| 96.7, 96.3 | bare L0, only for abelian p-group Vec_A^omega and Vec_G with O = R + g | R0^u (families, not general C) |
| 97.1, 97.2, 97.4, 97.8 | L0 | R0^u, *trailing* tower (AF classification) |
| 97.11-97.13 | L0+H | R0^u structure (delta, marked H recovery) |
| 90.V(a), 97.5 | L0+H | R1, trivial non-critical states only |
| 93.2 (PROOF-COMPLETE) | category-free | ->R4 ingredient; no instance |
| 93.8 (derived implication) | L0+L4 / L1+L4, assumes R3 | R4 given R3; vacuous without instance |
| 94.6, 94.10; 99.1, 99.4, 99.6, 99.8, 99.9 | L0 + declared reactions/contacts | R0^c + off-ladder z = 2 (not R1) |
| 98.1, 98.2, 98.4, 92.2 | L1 / L0 / L0+psi | finite ->R3 ingredient |
| 89.2, 95.1, 95.6, 100.1, 100.7 | category-free | ->R2 analytic interfaces |
| 91.11, 91.13, 91.15, 95.11 | L0 (+duality) | finite ->R0 / ->R2 ingredients |

The repo's claim that only R0^u has been reached, at L0 plus half-braiding, is **confirmed** in substance: it is the
only rung moved (88:242-246). Four precisions:
- R0^u is also reached at *bare* L0, but only for the CA-96 families; general bare L0 is open.
- R1 is reached only by trivial states (90:162-168; 97:114-117).
- The "trivial R2" (95.5, 100.5) and "abstract R2" (100.10: declared L4, no local tower) instances are degenerate.
- CA-88 is partly stale: the rung table reads "L0+half-braiding (so L1)" (88:103) and 88:263 still says "R0^u at bare
  L0 is open (Target 90.T)", against 88:246. "(so L1)" also reverses the implication (L1 => H, not the converse);
  CA-90's own tag is "L0+H (in particular L1)" (90:32).

## 4. Load-bearing negatives

| Negative | What it rules out |
|---|---|
| 90.2(b) (scope narrowed by 96.4) | Naive single-site transport for non-commuting fusion rings |
| 90.N | Occupation preserved only as endomorphism degree, not as a bounded absolute shift |
| 90.V(b) | p_n = 1 does not give A3; drift needs genuine state estimates |
| 90.3 | Bounded-depth contiguous-ancilla circuits (depth >= L-1) |
| 96.3, 96.6 | The F1 equivalence; centrality is not the right invariant |
| G1.3 (unreviewed) | 96.10 and any "transport characterises lifts" programme |
| 97.3, 97.9, 97.10, 97.12, 97.14 | Reading [O], the fusion ring, F or H off the bare tower (even with trace and stages); "F, R first enter at R1". Marks (97.13) or represented certificates (93.x) are mandatory. |
| G6-B (unreviewed) | Recovering (O, eta, H) from interval/dilation records |
| 93.5, 93.6 | Index data without a common normal state (no normal extension) or without exhaustion (index underestimated) |
| 93.10 | Z(C) as DHR of the diagonal theory; the full target must be the doubled net or the defect centre |
| 89.3 | K = 1+(H-E0)/v as an A2 control |
| 89.4, 89.6 | Insertion or gate errors controlling commutators or derivatives |
| 89.7 | A3 for arbitrary gate-intertwining refinements (it forces c* = 0); refinements must be coordinate-resolved |
| Remark F1 | A free lunch from local Ward errors |
| 95.4, 95.5 | Fixed-word decay, or VR-1 itself, controlling collars; VR-1 admits collapsed limits, so noncollapse is needed |
| 95.9 | The chiral-energy control for the CAR calibration |
| 91.4, 91.8, 91.12 | Dagger parity; A1-A4 => mixed commutation; parity-odd densities on O = 1 |
| 100.5, 100.6, 100.9 | ZC by logarithm identification; ZC from Jacobi + parity + grading alone; commutation range => spatial support |
| 92.6, 92.9 | s-independent tile positivity (self-adjointness irrelevant); the E3 crossing as typed |
| 98.6 | A canonical observable reflection from self-duality, for all complex tiles with either variance |
| 98.9 | "Categorical crossing makes the transfers conjugate", at carrier level |
| 94.1, 94.9 | Fixed densities having limits; chamber-Laplacian-extension limits |
| 94.11 | Unrestricted range-r number change under (G_r): fusion rules restrict the dynamics |
| 94.14 | Unrenormalised codimension-2 reactions |
| 99.7, 99.10, 99.11 | 94.16's attractive no-limit branch; a common lower bound for negative total contact; scalar classification with internal diagonals |

## 5. Named next targets

| Target | Statement | Status now |
|---|---|---|
| 90.T (90:245) | Slack-r Bratteli obstruction forcing centrality, or a Vec_S3 lift | Superseded: 96.3 refutes the centrality deduction, replaced by 96.10 (96:239). The Vec_S3 carrier 1 + (12) + (123) is still undecided (96:253). |
| 96.10 (96:270) | Lifts with finite slack => finite-power pointed transport on O^b | Conjectural. G1.3 (unreviewed) gives a dihedral counterexample (S_3 at m = 3, but on a four-summand carrier). G1.4: a lift fixes only its inclusion matrices, up to global point-fixing gauge. G1.5: for fixed b, transport is a finite polynomial system and min b is invariant, but min b does not decide lifts. |
| 96 open (96:248-253) | General bare-L0 existence and classification; periodic/symmetric/canonical variants | open/conjectural |
| 97.16 (97:265) | The record (A_inf, intervals, delta) forces an equivalence transporting eta, H | Conjectural. G6-B (unreviewed) refutes the positive form by abelian charge translation (same D on both sides). Recovery of D alone and the E-F/E-H checks are open (G6 :298-304). |
| 98.10 (98:269) | Real self-duality two-tile reflection: K(rho_2 h) = K(h)^dag, and coherence of the two sewing orders | conjectural |
| 100.12 (100:268) | Coarse-vector limit of (N^2/8pi^2)[H, Q] under parity + translation, or a counterexample | Conjectural. Brief G2 written, never launched (worklog 022:141). |
| 94.16 (94:240) | Contact trichotomy | Refuted by 99.7; replaced by 99.1 (99:242) |
| 99.13 (99:268) | Signed reacting full-Fock realization with an operator core, or an obstruction | Open (labelled "conditional") |
| 95.12 (95:250) | Two-ordering endpoint realization with uniform probe bounds | Conjectural; would discharge G1 only, G2-G3 remain |
| 89.L (89:225) | Probe-word Ward-to-residual | Proposal; still conditional after 95 (95:216) |
| 91 next (91:233) | Zero-mode lemma | Partly absorbed by 100.4 (equal ledgers are now an output); ZC itself is 100.12 |
| 93 next (93:230) | Annular approximant lemma (non-vacuity for type III_1) | Proposal; untouched in round 3 |

## 6. Gaps

- **Conditionals with no verified categorical instance** (as the shards admit): 89.1, 89.5 (89:235); 91.1-91.7, 91.10,
  91.14 (91:243-246); 92.3-92.5, where RH is assumed and never derived (92:13-15); 98.7 on G1-G3 (98:180); 93.8, 93.9,
  93.11-93.13, 97.15, with no instance even for type III_1 (93:224-228); 95.2, 95.3, 95.7 (95:13); 96.9 and 90.W, with
  no summable state estimate; 100.2-100.4, 100.8, since no nonzero common standard-KS VR-1 system exists for any C
  (100:16); 94.8 (H^2), 94.13, 99.12, 99.13. 100.10's only example is a declared fermion target with a nonlocal
  regulator (100:262).
- **Source and Law-1 gaps** the shards flag: Li-Lin-McGreevy-Shi-Kim bridge unproved at the cited passage
  (100:251-253); 2D light-ray analogue of KLM c18 unsourced (93:192-194); c_{Y,1} = id uncited (90:81); braided/unitary
  monoidal functors undefined at a cited line, composition compatibility asserted but not proved (90:138-139); L1
  identity ev^dag = c(theta (x) 1)coev unsourced (92:78); no source for Mosco convergence or boundary triples
  (94:32-34), contact classification (99:25-26) or AF classification (97:46); CGS n = 1 not checked against W2 (89:250).
- **Reproducibility and conventions:** CA-100 cites no check, though `F2/checks/` holds mutation-tested scripts. No
  check is ported to `scripts/` (Law 3), and CA-90's are Float64 calibrations. Round-3 notation is unregistered and the
  SHARD_META letters collide (CONVENTIONS:1644-1665; Law 2). Amendment pointers are not appended into
  CA-77/90/91/92/94 (worklog 022:158-163, :176); for example, CA-91 still lists equal ledgers as a hypothesis with no
  pointer to 100.4.
- **Labelling:** CA-88 staleness (§3). 99.13 is an open target graded "conditional" (99:14, 268). CA-90 calls
  Vec_Z3^omega non-braided "by grid search, not a proof" (90:258); CA-98's exact hexagon elimination for omega_p
  (98:245-247) may close this, but the cocycles are not cross-identified. CA-95 and CA-96 repeat their SHARD-KEYWORDS
  lines (95:8; 96:45-46).
- **Structural setting mismatch:** every R0^u tower is open-chain (90:242; 96:19), while every KS/VR-1 and ZC result is
  periodic/full. The two meet nowhere: the periodic seam of B_L and an open-chain chiral KS treatment are both open.
- **Unreviewed:** G1 and G6 are neither reviewed nor lifted (worklog 022:129-141). Their negatives are not established.

## 7. Honest assessment

After rounds 2-3, for general unitary fusion C:

- **(i) Tower.** A local unital injective dyadic tower (R0^u) exists whenever O, or a power O^b, carries a pointed
  unitary relative half-braiding (r = 0 or 2b-1); a braiding suffices. At bare L0 it is proved only for two
  group-graded pointed families. Towers are open-chain only, and no non-trivial state has summable Wilson drift, so R1
  is reached only by product and tracial states.
- **(ii) KS modes.** No categorical chain has a VR-1 certificate. What exists is a sharp category-free interface:
  transfer, cocycle, probe bounds, parity-free cubic balance, ZC <=> mixed commutation. 95.5 shows VR-1 is satisfiable
  by a collapsing system; the only nontrivial calibration is free CAR with modified modes.
- **(iii) RP.** Individual seams exist (canonical at L1, and at L0+psi). One-tile and linear-history criteria hold
  modulo RH. Whole-history RP, coherent reflection and OS reconstruction are unproved; transfer conjugacy is refuted.
- **(iv) Fidelity.** A correct R4 implication exists (93.8) with no instance. The bare tower provably forgets F and
  [O] (97.9-97.10), and probably H even with interval records (G6, unreviewed). Nothing faithful is reached at any rung.
- **Dead claims (CA-88 grid and briefs):** E4(b) and the E4 control; E2 with dagger parity; E3(b)/(c) as posed; E5's
  "DHR(diagonal) = Z(C)"; E6 universality; the 90.T centrality deduction and the F1 equivalence; F4(b); F6's
  fusion-ring recovery and "F, R enter at R1"; F3(b)/(c) as unitary conjugacy; 94.16's no-limit branch. Conditionally
  on review: 96.10 (G1.3) and the positive form of 97.16 (G6-B). None of D1-C..D6-C as restated is fully dead; all
  remain unattained.
- **Most valuable next target:** a *non-trivial R1*, the first unfilled rung on the main ladder. Concretely: a summable
  WT-1 drift bound for a non-product state family (for example ground states of a fixed categorical h) on the
  CA-90/96 dyadic tower, discharging 90.W/96.9, on a system with a periodic seam so it meets the full-setting KS
  results. None of the six named next targets addresses R1, yet every R2-R4 statement presupposes "the same GNS
  system", and 95.5 shows a certificate without a state can collapse. The cheapest in-flight target is 100.12, which
  already has a brief (G2).
