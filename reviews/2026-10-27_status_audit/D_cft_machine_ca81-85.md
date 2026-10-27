# Status D: the CFT machine (`cft_machine/`) and CA-81..CA-85

Read-only audit, 2026-10-27, at HEAD 4db677a. I read every file in scope. I ran no Julia, Python or LaTeX.
Grades are copied as written. Layer tags follow CONVENTIONS (aq) (`CONVENTIONS.md:1524-1544`). Where the
repo already tags a row (CA-88 grid, `report/sections/88_layered_targets.tex:137,145-146`), I reuse its tag. Rows the repo
does not tag carry my tag, marked "aud.".

## 1. What the machine is

`cft_machine/` is a separate workspace started 2026-09-22 (`worklog/014_2026-09-22_cft_machine.md:21-23`). It is
built from two category-free contracts plus a set of calibrations that reach the higher rungs only through cited
theorems.
- **WT-1** (Wilson-triangle state theorem): hypotheses A1-A3. A1 asks for coherent unital injective *-maps, A2 for
  microscopic states ω_n, and A3 for summable dual-norm row drift d_{k,n}. The conclusion is a unique limit state with
  tail bound t_k(n) and compatible GNS maps (`research/wilson_triangle.md:16-107`; `81_cft_machine_oar_contract.tex:49-86`).
  WT-2 is the effective-evaluation corollary; it needs a computable tail and a norm bound B. WT-3 bounds Gram matrices.
- **VR-1** (graph-norm Virasoro transport): hypotheses A1-A4. A1: finite H_N, isometries J_N, a control K_N>=1 with
  exact intertwining K_{N+1}J_N=J_NK_N. A2: uniform one-loss graph bounds C_{n,s}. A3: summable refinement defects
  e_{N,n,s}. A4: two-loss Virasoro residuals q→0, with c and c* kept separate. The conclusion: modes and all finite
  words converge on a dense invariant domain D, satisfy the Virasoro bracket, and have adjoint pairing. Positive energy,
  self-adjointness and integration are not concluded (`research/virasoro_routes.md:50-149`; `81_...:97-108`).
  **VR-2** is a two-dimensional counterexample showing that vacuum-null does not imply operator-null (`virasoro_routes.md:179-192`).
- **Joint clause**: WT-1 and VR-1 must use the *same* state and representation system. WT-1 alone gives no dynamics
  and VR-1 alone gives no local algebras (`81_...:110-114`; `wilson_triangle.md:155-163`).
- **Naming warning**: WT-1's A1-A3 and VR-1's A1-A4 are different hypotheses. Later shards write "WT-1 A3" and
  "VR-1 A3" side by side.
- **Routes** (`virasoro_routes.md:36-48`, graded *proposal*):
  1. integrable/RSOS/anyon chains (ZW);
  2. discrete-holomorphic Sugawara (HKV), where the correlation quotient is not a GNS quotient;
  3. free-fermion currents (OS = Osborne-Stottmeister, `CFTFromLatticeFermions`);
  4. inverse CFT discretisation, which presupposes the target;
  5. categorical anyon words (CA-65-73).

  The recommendation is two-track: the free-fermion route as analytic calibration, and a search of the categorical
  tower for the same certificates (`:44-48`).
- **Relation to the root pipeline.** CA-81 is the OAR/R1-R2 contract that CA-75 merges into its acceptance contract
  (`75_integration_map.tex:4,40-42,85-87`). CA-88 places WT-1 at R1 and VR-1 at R2 (`88_...:104-105,137`). CA-82..85 are
  calibrations that sit beside the categorical tower; they are not instances of it.

## 2. Results table

Abbreviations: cm = `cft_machine/`; RF = `research/realisation_and_fidelity.md`; EQ = `research/equivariant_oar.md`;
CRt = `research/coset_route.md`; CHm = `research/coset_hamiltonian.md`; COs = `research/coset_observable_system.md`;
SCl = `research/smeared_coset_limits.md`; P = `compiler/PROOF.md`; LL = `compiler/LOCAL_LIMIT.md`;
FP = `benchmarks/fermion/PROOF.md`; WP = `benchmarks/fermion/WILSON_PROOF.md`. Run logs are under `<dir>/runs/2026-09-22/`.
"mut" gives a mutation log and its RED count; every final log is green.

| Label | One-line statement | Grade as written | Tags (setting; data; rung) | Backing check | file:line |
|---|---|---|---|---|---|
| WT-1 | Summable dual-norm drift on a coherent unital tower gives a unique limit state, tail bound, compatible GNS | "local derivation"/"local conditional derivation, skeptically reviewed" | any; category-free; R1 (CA-88) | proof only; reviews/fermion_referee.md:6; specialised by WS-1 below | 81:49-86; wilson_triangle.md:16-107 |
| WT-2 | Computable tail + norm bound B gives limit expectations to any error η | "effective corollary" | any; cat-free; R1 | none | 81:88-93; wilson_triangle.md:109-129 |
| WT-3 | ‖G_n-G‖ <= t_k(n)Σ‖a_i‖²; Gram convergence does not fix kernels | derived (boundary example) | any; cat-free; R1 | none | wilson_triangle.md:131-153 |
| VR-1 | A1-A4 give a common smooth domain, limiting modes, all words, Virasoro bracket, adjoint pairing | "conditional local theorem"; note: "research proposal with a conditional local derivation" | any; cat-free; R2 (CA-88) | proof only; reviews/fidelity_referee.md:7-10 "valid ... under A1-A4" | 81:97-108; virasoro_routes.md:50-149 |
| VR-2 | R Ω=0 but ‖RBΩ‖=1: vacuum-only residual control is insufficient | obstruction (negative) | any; cat-free; — | none (2x2 calculation) | virasoro_routes.md:179-192 |
| Routes table | Five generator mechanisms and their missing bridges | "research proposal" | — | none | virasoro_routes.md:29-48 |
| RF Lemma 1 | An equivariant *-isomorphism restricts to fixed-point algebras | "proved conditional algebra lemma" | any; cat-free (finite G); R0^u-level | none; virasoro_referee.md:7 "algebraic lemmas accepted" | RF:106-121 |
| RF Lemma 2 | Fixed points commute with a strict inductive limit for finite G | same | any; cat-free; R0^u-level | none | RF:123-147 |
| RF orbifold compiler | Seed library + tensor power/orbifold/extension following EG; c_out=24k | "Proposal" | aud.: any; L2/L3 target; →R4 | none | RF:155-196 |
| RF functoriality | Start from decoration-preserving equivalences | "Functoriality proposal" | aud.: any; L3; →R5 | none | RF:198-203 |
| EQ-1 | Invariant rows/states restrict; fixed-tower GNS is H^G | "local conditional derivation" | any; cat-free; R1 | none | EQ:16-80 |
| EQ-2 | π(B)''=M^G on the full H | same | any; cat-free; →R3 | none | EQ:82-104 |
| IC-1 | Exact Cyclo16 recognition of Ising (S,Θ,N,c=1/2) up to unit-preserving relabelling; KL gives Vir_1/2 the same data; KLM gives products | "supported construction using source theorems" | ch; L4; R4 (CA-88:145, "reads no F,R") | compiler/test.jl; test.txt (115+85+15 green); mut cyclotomic (10 RED), twist-guard (1 RED) | P:32-76; CA-82:31-44,113-122 |
| IC-2 | Emitted sine H is a nearest-neighbour quadratic Majorana H; the sea is its ground state; CAR refinement exact, Wilson rows constant | structured proof | ch; L4; R0^u+R1 (trivial drift) | same tests | P:78-120; CA-82:46-64 |
| IC-3 | OS Thm 4.11 / Cor 4.17 give strong mode and unitary convergence; local net = even real-Fermi = Vir_1/2; products keep factor stresses | theorem application | ch; L4; R2-R4 by citation | same | P:122-142; CA-82:107-122 |
| LL-1 | Sampled smooth test sections converge in L², so CAR fields converge in norm | structured proof | ch; L4; →R3 | sample test (exact ‖f‖²=128π/315) | LL:10-54; CA-82:81-96 |
| LL-2 | Reconstructed local algebra = NS even real-Fermi interval net | structured proof | ch; L4; R3 | none beyond LL-1 test | LL:56-97 |
| LL-3 | Factorwise (Z2)^k parity gives tensor powers of Vir_1/2; total parity would be wrong | structured proof | ch; L4; R3/R4 | test of odd⊗odd exclusion (compiler README:46-49) | LL:99-124 |
| Lemma A2 | Every uniformly bounded local even weak limit lies in A(I), by Haag duality (KL:403-407) | "[Lamport proof]" | ch; L4; R3 | none; reviews/second_pass_ising.md:66-108 | cm/report/sections/03_ising_audit_and_numerics.tex:12-33 |
| UV-edge audit | Edge excitations with energy →s exist and are discarded by the sharp RG | derived (qualification) | ch; L4; — | none | 03_...:39-57; second_pass_ising.md:116-144 |
| Fermion Prop. (refinement/modes) | Zero-padding isometries compose; A_n*=A_-n; continuum Witt relation; fixed-core defect <= D_M=ε²(…|q|³…), O(4^-N) dyadic | local proof | ch; L4 (declared free fermion); →R2 | benchmarks/fermion/test.jl 548 green; mut wrap (33 RED) | FP:19-76 |
| Fermion Schwinger | c_S(B_n,B_-n)=(n³-n)/12 (c=1); finite no-wrap cocycles converge to it; periodic wrap rejected | local proof | ch; L4; →R2 | same; README table M=8,16,32 | FP:78-123 |
| Fermion boundary | OS Lemma 4.10 / Thm 4.11 / Cor 4.12-4.13 supply strong convergence | "existing theorem applications" | ch; L4; R2 (by OS) | — | FP:125-142 |
| Majorana spec. | Self-dual admissibility; even quadratic recipe; half cocycle (n³-n)/24 (c=1/2) | local proof | ch; L4; →R2 | test.jl 96 green; mut majorana-factor (12 RED) | FP:144-193 |
| WS-1 | Actual Dirac ground-state rows: nonzero drift; dual-state-norm tail ε_QΣ|r|/2, the only nontrivial WT-1 A3 | "local derivation ... finite checked instances" | aud.: full (two-component Dirac); L4; R1 | test_wilson.jl 116 green; mut sea-sign (48 RED) | WP:16-93 |
| CR-1 | No-wrap currents have level 1; levels add; GKO c=1-6/((k+2)(k+3)) | structured proof + GKO application | ch; L4 (coset declared by k); →R2 | coset/test.jl (54+4+69 green); mut Sugawara 1/(l+3) (16 RED) | CRt:56-83; CA-83:52-59 |
| CR-2 | (C_{M,n,R}-C_n)P_e=0 exactly if R>e+|n| and M/2-1/2>e+2R; all words; finite adjoints | "[local derivation]" | ch; L4; →R2 | same; reviews/check_coset.jl 18/18 | CRt:85-167; CA-83:63-98 |
| CR-2 neg. control | Periodic wrap gives ‖J_1Ω‖²=1/2 contribution, breaking CR-2 | local calculation (negative) | ch; L4; — | mut embedding-phase (13 RED) is a separate guard | CRt:200-208 |
| CR-3 | Smaller vacuum window R>=n, M/2-1/2>n gives C_{M,-n,R}Ω=C_-nΩ | corollary | ch; L4; finite | coset/test.jl; table c(n³-n)/12 at k=1,2 | CRt:210-224; CA-83:100-122 |
| CH-1 | ⟨v,C_{M,0,R}v⟩=-(M-R)(M-R-1)/12 <0: raw quartic zero mode not positive | "[structured calculation]" (negative) | ch; L4; finite | coset_hamiltonian/test.jl 16 green; exact values -5/3,-1,-13,-11 | CHm:21-60; CA-84:29-58 |
| CH-2 | Vacuum-descendant spaces V_b computable exactly at R_b=2b+1, M_b=16(b+1); nested isometrically | theorem (local) | ch; L4; →R1 | test.jl 245 green (b<=3 only, via CR-3 windows) | CHm:62-116; CA-84:62-83 |
| CH-3 | H_b=P_bEP_b+(b+1)(1-P_b) is positive with unique vacuum; nonlocal | theorem (local) | ch; L4; finite | mut negative-penalty (32 RED) | CHm:118-143; CA-84:85-92 |
| CH ambient | Penalised resolvents → P(E+i)^{-1}P, which has a kernel on charged sectors | derived (obstruction) | ch; L4; — | charged-state penalty test | CHm:161-177 |
| CO-1 | A_b=B(V_b)⊕C with independent-scalar maps is a strict unital OAR tower; limit K(H)+C1; vacuum GNS | "Proof CO-1"/"proved finite-algebra construction" | ch; L4; R0^u+R1 (constant rows; nonlocal) | unitized_oar/test.jl 19 green; test_descendants.jl 212 green; mut scalar-character (1 RED) | COs:30-85; CA-84:96-125 |
| CO-2 | T_b(f)=P_bT(f)P_b is an exact finite compression; (e^{itT_b},1) → e^{itT(f)} strongly* | structured proof | ch; L4; R2 (unitary symmetry, vacuum module) | none (analytic); reviews/oar_second_pass_referee.md:9 | COs:87-140; CA-85:86-103 |
| CO-3 | Sequence algebra B(I)/ker L ≅ C*(stress unitaries); vacuum weak closures = Vir_c net, with KL sectors | structured proof | ch; L4; R3 (CA-88 says R2-R3; see §6) | none | COs:142-183; CA-85:105-115 |
| CO no-go | Finite compressions lose interval support; same-label refinement impossible | derived (negative) | ch; L4; — | test_descendants.jl rejects exact same-smearing refinement | COs:207-222; CA-85:117-123 |
| SC-1 | Ambient finite-energy space = ⊕ unitary h.w. coset modules; CW bound ‖T(f)ξ‖<=r_c‖f‖_{3/2}‖(1+C_0)ξ‖; D a core | "Common-core lemma" | ch; L4; →R2 | none | SCl:63-124; CA-85:38-54 |
| SC-2 | A_M(f) → T(f) on the core, in strong resolvent sense, and as compact-t unitaries (K_M=M/16, R_M=M/8) | "THEOREM SC-2 (proved below)"/"[structured proof]" | ch; L4; R2 (ambient) | none | SCl:126-170; CA-85:56-84 |
| Fusion-space target | Five-item specification for a local fusion-space realisation | "research target, not a claimed theorem" | aud.: any; L0+; →R0..R4 | none | cm/report/sections/06_fusion_space_frontier.tex:105-125 |
| Minimal-model frontend | m=4 recogniser | "Proposed ... not implemented" | — | none | compiler_minimal/README.md:1-17 |

## 3. Ising compiler (CA-82) and coset block (CA-83..85)

**What "supported" means.** "Supported" is a domain restriction. The compiler accepts exactly one input: the
three-object chiral Ising datum with c=1/2, up to the single nontrivial unit-preserving permutation, or an
explicitly declared finite tensor product of copies of it. Everything else raises `UnsupportedCategory`
(`compiler/ModularInput.jl:51-61`; `CA-82:44,124-127`).

**What it reads.** `ModularDatum` holds labels, S, θ, fusion N and a rational c (`ModularInput.jl:7-12`). It reads
**no F- or R-symbols** and checks no coherence (`compiler/README.md:54-57`; `P:26-28`; CA-88:145).
- Matching is exact equality against a hard-coded table (`ModularInput.jl:27-36,54-58`).
- The character phase e^{-2πic/24} is stored separately as an exponent (`P:72-74`).

**What carries it to R4.** Cited continuum theorems:
- OS Thm 4.11, Cor 4.17 and Eq. 197 for the modes;
- LMR:1165-1168 for even real Fermi = Vir_1/2;
- BO:324-355, 563-588 for the even CAR algebra and the NS vacuum;
- KL:1026-1157 for complete rationality, all sectors, fusion and twists;
- KLM:969-977, 1518-1551 for products;
- RSW:689-690 and :2441-2474 for the balancing identity and the reference data (`P:34-76,122-140`; `CA-82:18-29`).

The local derivations add LL-1..LL-3 and Lemma A2 (local-net upper inclusion). The only lattice-side facts are
finite: a local sine Hamiltonian, exact CAR refinements, constant Wilson rows, and normal-ordering cocycles.

**Template or one-off.** As code it is a one-off: a lookup recogniser plus a fixed Majorana backend.
- What does generalise is the shape: recognise declared data, choose a backend from a library of proved seeds, cite a
  sector theorem for that net, and keep factorwise parity and factor stress families for products (`LL:241-266`; `P:136-139`).
- The repo itself grades it a calibration (`75_...:268`, "calibration, not the general route"; `80_...:263`, "Theorem
  80.9 is the general mechanism it bypasses").
- Caveats:
  - the model is a *chiral* one-component Majorana sine chain, not a transverse-field Ising chain;
  - refinements are sharp momentum maps with sinc tails (`README:58-60`);
  - UV-edge excitations survive in the finite spectra and are discarded by the RG choice (`03_...:39-57`).

**Coset block: what is general and what is one instance.**
- Statements are general in k>=1 for the GKO family SU(2)_k×SU(2)_1/SU(2)_{k+1}, which gives c<1 minimal models:
  CR-1..3, CH-2/3, CO-1..3, SC-1/2.
- CH-1 is k=1 only.
- Finite witnesses: k=1,2 (c=1/2, 7/10), M=8,16, R=3,4, b<=3 (`benchmarks/coset/README.md:22-34`; `CA-84:80-83`).
- The general schedule M_b=16(b+1) was never executed (`CHm:88-89,115-116`).
- The input is an integer k and a coset recipe. No categorical data enters (L4 declared target).

**Exact core stabilization (CR-2).** On each fixed free-energy core P_e, the truncated quartic CAR polynomial
C_{M,n,R} equals the continuum coset mode exactly once R>e+|n| and M/2-1/2>e+2R. The current tail is identically zero
on the core, so no analytic tail estimate is needed (`CRt:114-123`). It is not a VR-1 instance; no such implication is
claimed (`CRt:174-175`).

**Scalar-augmented tower (CO-1).** On computed vacuum-descendant spaces V_b, take A_b=B(V_b)⊕C. The refinement
α(a,λ)=(JaJ*+λ(1-JJ*),λ) uses an independent scalar on the new shell. This makes the maps genuinely unital and
multiplicative, where a corner map would not be. The limit is K(H_vac)+C1 with constant Wilson rows.
- This is a *new* prescription, not the restriction of the CAR refinement (`CA-84:127-133`).
- It is globally nonlocal (`CHm:147-151`).
- CA-76 Prop 76.2 generalises it and shows the scalar can collapse (`76_...:114-121`).

**Smeared limit (SC-2).** Hypotheses: k>=1, ‖f‖_{3/2}<∞ (smooth real f), coordinated cutoffs K_M=⌊M/16⌋ and
R_M=⌊M/8⌋, CR-2, and the Carpi-Weiner energy bound imported modulewise via SC-1.
- Conclusion: the CAR-lifted A_M(f) converges to T(f) on the core, in strong resolvent sense, and as unitaries
  uniformly on compact t, on the *ambient* sea space.
- It does not remove spectator sectors, prove raw positivity, or give finite Diff(S¹) representations (`SCl:181-194`).
- CO-2/CO-3 then reconstruct the Vir_c net in the descendant representation as a represented strong* quotient, which
  is explicitly not the OAR norm limit (`CA-85:112-115`).

## 4. Free-fermion benchmark

**What is proved locally** (`benchmarks/fermion/PROOF.md`):
- exact zero-padding refinement, composition and isometry; adjointness; the continuum Witt relation on finite support;
- a fixed-core Taylor defect bound D_M=ε_M²(|q|³/6+n²|q|/16), hence a summable O(4^-N) dyadic defect on each fixed
  core (`FP:19-76`);
- sea compatibility J*S_QJ=S_M (`FP:67-74`);
- the complex Schwinger term (n³-n)/12, i.e. c=1, h=0 (`FP:78-123`);
- self-dual Majorana admissibility, an explicit even quadratic recipe, and the half cocycle (n³-n)/24, i.e. c=1/2
  (`FP:144-193`).

The two-component Dirac Wilson rows (WS-1, `WP:16-93`) are the only nontrivial instance of WT-1 A3 in the repo.

**Mutations rejected** (logs tracked):
- periodic wrap instead of no-wrap: 33 RED (`runs/2026-09-22/mutation-wrap.txt:1`);
- opposite spectral sea: 48 RED (`mutation-sea-sign.txt`, summary line);
- missing Majorana 1/2: 12 RED (`mutation-majorana-factor.txt:1`).

The final runs are green: 548+96 (`test.txt`) and 116 (`test-wilson.txt`).

**Is it an R2 instance?** Yes, via the Osborne-Stottmeister source theorem. The modes are the source-modified
Koo-Saleur modes (OS Eqs. 197-199), and the convergence statement is OS Lemma 4.10 / Thm 4.11 / Cor 4.12-4.13,
recorded as "existing theorem applications, not conclusions inferred from nine finite matrices" (`FP:135-139`).

It is **not** a VR-1 instance. FP proves only fixed-core defects, not A2/A3 on graph norms.
- CA-79 calls it a "candidate first P instance; not verified" (`79_...:250-254,268`).
- CA-95 states "No nontrivial common-system VR-1 certificate ... is constructed" (`95_...:224-225`).
- CA-100 lists a *declared* complex sea as a conditional "abstract R2" instance (`100_...:262`).
- The local net and the graded-to-bosonic bridge are open for the complex fermion (`FP:140-142,189-193`).

## 5. How the rest of the repo uses this block

Counts from grep over shards 75-100.

| Shard | Use | Load-bearing item |
|---|---|---|
| CA-75 | Merges CA-81 into one acceptance contract; Link (b) asks whether the CA-72 defect feeds WT-1 A3; the row "[C] VR-1 (no instance)"; CA-82 appears in the examples table only | WT-1 A1/A3, VR-1, same-system clause (75:40-42,85-87,141-160,199-205,268) |
| CA-76 | Corner weight → WT-1 drift bound; Prop 76.2 generalises CA-84's scalar augmentation | WT-1 A3; CA-84 (76:3,22,40,114-121,159) |
| CA-77 | Requires one state family satisfying WT-1 | WT-1 (77:256) |
| CA-78 | Selection-equation interfaces: drift <= 2C_k d_n gives WT-1 A3; "shape of VR-1 A2" | WT-1, VR-1 A2-A4 (78:207-252) |
| CA-79 | Reduces VR-1 A1-A4 to a spectral-shell certificate P0-P3; fermion is a candidate | VR-1 (79:3,34,85-134,250-268) |
| CA-80 | CA-82 as instance only; "none of this follows from WT-1/VR-1" | — (80:22,170,263) |
| CA-88 | Grid: WT-1=R1, VR-1=R2; CA-82 (ch;L4;R4), the only R4 instance; CA-83-85 (ch;L4;R2-R3) | WT-1, VR-1 (88:104-105,137,145-146,273) |
| CA-89 | Category-free transfer into VR-1 A2/A4 and derivative A3. Negative: A3 for *every* gate-intertwining refinement forces c*=0 | VR-1, VR-2 (89:3-4,16,37,51-56,230-235) |
| CA-90 | Local unital lift supplies WT-1 A1; only the trivial-vacuum R1 instance | WT-1 A1/A3 (90:15,123,140,159-164) |
| CA-91 | Two VR-1-certified families plus linear parity force c_L=c_R, c*_L=c*_R | VR-1 (91:3,41,66-81); CA-82 instance |
| CA-95 | Probe-word Ward lifting into VR-1; F4(b) false under VR-1's control convention | VR-1 (95:16,20,84,94,224-225) |
| CA-96, CA-99 | Dyadic maps give WT-1 A1; conditional drift | WT-1 (96:114,235; 99:248) |
| CA-100 | Common A1-A4 for two KS families: cubic ledgers agree; A3 not replaceable by fixed-vector convergence | VR-1 (100:3,49-78,262) |

**Verdict on usage.**
- Load-bearing: WT-1 (A1-A3), VR-1 (A1-A4) and the same-system clause of CA-81. Roughly ten later shards rest on them.
- CA-82 is used only as a calibration instance.
- CA-83 and CA-85 are cited nowhere downstream except the CA-88 grid. CA-84 survives only through its
  scalar-augmentation device (CA-76).
- CA-86/87/92/93/94/97/98 do not cite the block.

## 6. Gaps

**What the block itself declares open:**
- No universal construction (`cm/README.md:17-21,77`).
- Neither contract has a category instance: "it does not prove that a general input category supplies those
  certificates" (`virasoro_routes.md:3-5`; `wilson_triangle.md:3-5`).
- VR-1 leaves open: c=c*, positive energy, essential self-adjointness, integration, and a corner map versus a unital
  local map (`virasoro_routes.md:160-177`).
- The coset branch has no local coset observable tower; ambient sectors remain; raw positivity fails; there is no
  local Hamiltonian (`CA-83:124-130`; `CRt:177-198`).
- The descendant spaces are not identified with categorical fusion spaces or a local action (`CA-84:270-273`;
  `CA-85:117-129`; `06_...:97-103`).
- Orbifold route: no microscopic seed, no local extensions, no twisted sectors (`RF:184-196`; `EQ:124-130`).
- Ising: no other chirality, c-lift or general tensor functor (`CA-82:124-127`). The m=4 frontend is unimplemented
  (`compiler_minimal/README.md:1-17`).
- Complexity bounds: none (`COs:230-234`).

**Logs.** The brief's premise that the logs are gitignored does not hold for this block.
- `.gitignore:9` ignores `*.log` globally, but every cft_machine run bundle stores `.txt` copies, and all 25 are
  tracked (`git ls-files cft_machine | grep runs`; rationale at `worklog/014:128-129`).
- No `.log` file exists on disk under `cft_machine/*/runs/`. The claim "Original local logs remain available"
  (`014:129`) is therefore not verifiable.

**Provenance caveats:**
- `compiler/runs/2026-09-22/test.txt:1-5` says it records a referee-reported summary, "not ... a redirected raw
  terminal transcript".
- The unitized-OAR mutation log was originally green (no RED). It was corrected after a referee flag
  (`reviews/unitized_oar_referee.md:52-67`).
- The 212-assertion descendant suite was not rerun by its referee (`:48-50`).
- The analytic results SC-1/SC-2, CO-2/CO-3, LL-2, Lemma A2, EQ-1/2 and VR-1/WT-1 have no executable check. They rest
  on Astra referee reports, and refereeing "does not substitute for proof or tests" (`cm/README.md:56`).

**Uncited assertions.** I found none material. Spot checks matched their anchors: LMR:1165-1168 (even real Fermi =
Vir_1/2), KL:403-407 (Haag duality), KL:1008-1024 (coset = Vir_c). All 13 cited source files exist.

**Grading tension (flagged; I have not upgraded anything).** CO-3 says its vacuum weak closures give "the sourced
minimal-model Virasoro net and its complete sector data" (`COs:182-183`; `CA-85:109-110`). That is R4-by-citation,
the same mechanism CA-88 accepts as R4 for CA-82. CA-88 tags CA-83-85 at R2-R3 only (`88:146`). The lower tag is
defensible: the finite algebras keep no spatial support, so locality comes entirely from the target net. But the
reason should be stated.

**Auditor's observations (not in the repo):**
- CO-1's limit K(H)+C1 arises from *any* finite-dimensional exhaustion of a separable H. All CFT content enters
  through CO-2/CO-3 and the cited KL/CW theorems; COs:196-198 concedes this.
- VR-1 A3 allows one K-loss. With K=1+E, the fermion defect ε²|r|³ is not uniformly small near |r|~M. A polynomial
  control such as K=(1+E)^3 appears to absorb it. Unchecked.

## 7. Honest assessment

1. **General C:** the machine reaches no rung. It supplies conditional, category-free *contracts* for R1 (WT-1) and R2
   (VR-1), but no category-built tower satisfies either nontrivially. CA-90 gives only the trivial-vacuum R1, CA-95
   says no VR-1 certificate exists, and CA-89 shows A3 cannot hold for all gate-intertwining refinements when c*≠0.
2. **Instances:** chiral Ising and its declared tensor powers reach R4 by cited net theorems. That is the only R4
   instance in the repo, and it reads no F or R. The GKO c<1 cosets reach ambient R2 (SC-2) and a represented,
   nonlocal R3 reconstruction. The free fermion reaches R2 via OS and nontrivial R1 via WS-1.
3. **What it uniquely gives the integration:**
   - the only quantitative, checkable interfaces (WT-1/VR-1) on which CA-75..100 hang;
   - the only end-to-end calibrations, which show what a complete output looks like;
   - two devices the categorical tower lacks: exact finite-core stabilization (CR-2), an alternative to summable-defect
     estimates, and independent-scalar unitalisation (CO-1, generalised in CA-76);
   - equivariant transport (EQ-1/2, RF Lemmas 1-2) for orbifold steps.
4. **What it does not give:** any link from F/R data to dynamics.
5. **Single most valuable next step:** build the first nontrivial VR-1 certificate on the *same* system as the WS-1
   Wilson rows. Concretely: the source-modified free-fermion KS modes, with an explicit control K and proved
   A2/A3/A4 constants. CA-79:250-254 and CA-89:230-231 already name this as the first test, and it fits the laptop
   budget. Until VR-1 has one instance, the R2 layer of the whole pipeline is untested. CA-79's P0-P3 and CA-89's
   transfer hypotheses can then be checked against a real case before anything categorical is attempted.
