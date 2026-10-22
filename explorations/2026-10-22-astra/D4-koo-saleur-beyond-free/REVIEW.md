# D4 review: sceptical reconciliation of `NOTE.md`

Reviewer: Opus reconciler, 2026-10-22. Scope: `NOTE.md` (722 lines) and
`checks/` only. No Julia, no latexmk, no file outside this directory edited,
no commit. Below, `NOTE:n` means
`explorations/2026-10-22-astra/D4-koo-saleur-beyond-free/NOTE.md:n`.

## 0. Summary verdict

The finite algebra (D4-T, D4-R, D4-V, D4-N) and the analytic reductions
(D4-P, D4-B, D4-I, D4-G) hold up under step-by-step checking. They are
stated for a general unitary fusion category and do not quietly use a TL
quotient, self-duality, multiplicity-freeness or braiding. Every
model-specific fact sits either in the examples table or in an explicitly
negative scope discussion. Rule 16 is respected.

The headline conjecture D4-C is the weak point. Its labelling is honest, but
as a statement *about C* it needs reformulation (sections 3 and 6). Its input
already contains the complete rigorous CFT. Its carrier lets unit
multiplicities and site objects that grow with the cutoff turn any spin
chain into a "C-chain". It is a strengthened inverse-discretisation
conjecture, and the note does not place it against the closest prior art in
the repo (Zini–Wang Conj. 4.3 and Rmk. 9; the virasoro_routes "inverse CFT
discretization" row). D4-N is correct, but it partly restates three uncited
results already in the repo.

## 1. Citation audit

Each anchor was opened and compared with the note's reading.

| Note anchor | Claim in note | Verdict |
|---|---|---|
| NOTE:130, GS `Linnea11.5.tex:791–820` | Standard KS generators: forward current with positive phase, prefactor N/4π | **OK.** I checked the sign independently. With k=-h/v=𝒽 (GS's energy density, velocity one), the note's (1) `k-e-j`, `j=i[k_j,k_(j+1)]`, reproduces GS's `e_j-e_∞+(iγ/π sinγ)[e_j,e_(j+1)]` times `-γ/(π sinγ)`. Hence e_N=-γe_∞/(π sinγ). |
| NOTE:130, CONVENTIONS:1196–1217 (af) | Forward-current convention, separate e,b,c,c* | **OK.** The note's k is (af)'s velocity-one h; the sign map k=-h/v is stated at NOTE:84–87. |
| NOTE:177–180, KS `9312156.tex:596–601` | TL relations reduce local products | **OK.** The source has e_j²=√Q e_j; the note writes δ. Harmless. |
| NOTE:180–181, KS:727–744 | Transfer-matrix logarithm gives energy, commutator current, higher charges | **OK** (KS:730–744, `\hi`, `\geneh`). |
| NOTE:184–186, KS:816–830 | Other representations: "can be defined", stress interpretation only believed | **OK** ("we believe", KS:826–828). |
| NOTE:186–187, GS:672 | Genericity qualification; representation-dependent gluing | **OK.** |
| NOTE:188–189, GS:2504–2526, :3258 | Convergence left unproved; intermediate states restricted | **OK** (GS:2504 "beyond the scope"; :2510–2526 double limit; :3258). |
| NOTE:190–192, GS:3191–3213 | c* conjecture concerns commutators; ZW phase change does not remove the anomaly | **OK** (GS:3201, :3210–3211). |
| NOTE:205–209, `fermion/PROOF.md:50–65, 82–117` | Weighted-shift norm; finite crossings of the central term | **OK** (PROOF.md:59–60, :108–113). |
| NOTE:210–214, `WILSON_PROOF.md:52–79` | The two-mode block argument lives here, not in PROOF.md | **OK.** The note correctly fixes a misattribution in the brief (brief line 151). |
| NOTE:536–539, AFM `_Topological_defect_lines.tex:186–212` | D_a commutes with each local projector (any amplitudes); D_aD_b=ΣN D_c | **OK** (eqs. PDDP, TDDT, DDeqD). |
| NOTE:552–553, AFM `_fusion_categories_and_diagrammatics.tex:175–184` | Self-dual, multiplicity-free, FS=+1 restrictions | **OK.** |
| NOTE:556–558, HKV:565–605 | Exact algebras on lattice fields modulo null fields | **OK.** |
| NOTE:558–559, ZW `main.tex:894–895` | Approximants needed for every Hermitian generator | **OK** (Rmk. 9, ZW:895). See the omission below. |
| NOTE:571–572, SCH `Schottenloher2008.md:6418–6426` | Borcherds commutator; :6420 lacks b | **OK.** :6420 reads `(a_(k))_(m+n-k)` with b missing; :6424 is intact. |
| NOTE:703, LC-12 `12_fibonacci_four_port.md:169–203` | Finite-primary obstruction at one c | **OK** (:169–195). |
| NOTE:720, CA-68:51–103, CA-71:56–158 | Bare insertion, placements, isometry, corner | **OK.** |
| NOTE:456–463 vs CA-73 `73_categorical_residual_set.tex:168–172` | Global corner image θ(h_j) pins *all* spectator vacancies; local support needs a representative | **The note is right and CA-73 is imprecise.** CA-73:169–171 says θ_φ(h_j) is "supported on fine sites {2j−1,2j,2j+1} with the inserted site pinned to vacuum". In fact θ_φ(h_j)=V h_j V*=S_j P_φ, with P_φ projecting every vacancy. This is confirmed by `checks/check.py:110–114` and by my own computation. **This mismatch in the repo should be fixed in CA-73**, without changing Lemma 73.1's algebra. |
| NOTE:719, `virasoro_referee.md:153–161` | The fixed-core estimate is not a uniform graph-norm bound | **OK.** D4-P's spare power p>1 is the "stronger auxiliary regularity weight" that referee:157–160 asks for. The note never says this in so many words. |
| NOTE:722, CA-86:66–121, CA-87:54–70 (branch commit) | Tile expansion; blocking lemma | **OK in content.** After the merge (HEAD 992b0df) the anchors are CA-86:80–96 (Lemma 86.1) and CA-87:55–70. This is minor anchor drift. |
| NOTE:712–717 registry lines | SOURCES.md entries | **OK** (spot-checked KS :9, GS :966, ZW :277, HKV :1666, SCH :9). |

**Mismatches.** No claim misreads its anchor. Four anchors in "Sources
used" (KS:1068–1108 and :1623–1673, ZW:437–442, SCH:5533–5555) back no
statement in the body. They are harmless padding.

**Omissions: relevant local sources and repo results the note should cite.**
1. **D4-N has uncited prior art in the repo** (section 2, D4-N):
   - GS `Linnea11.5.tex:2489` gives the trace-cyclicity argument against a finite-N central term.
   - LC-2 Proposition 5 (`reconstruction/02_obstructions.md:210–219`) shows that an exact finite-matrix central term is a coboundary.
   - CA-67:104–109 and NG5 (`67_refinement_requirements_obstructions.tex:134`) state "no exact-implementer formulation" for c≠0.

   D4-N's genuinely new parts are step <1>1 (exact covariance plus A4 forces the exact relations already at stage r) and the conclusion that only the zero representation survives.
2. **Zini–Wang Conj. 4.3 and Rmk. 9** (`ZiniWang2018/source/main.tex:871–895`) is the nearest local prior art for the headline. It conjectures that a chiral unitary rational CFT is a scaling limit of anyonic chains, with approximants for every generator. `cft_machine/research/virasoro_routes.md:41` names "inverse CFT discretization" as a route. D4-C strengthens both: full diagonal theory, OAR/WT-1, standard KS, P. The note does not say so.
3. **Milsted–Vidal 2017** (`references/lattice-symmetry/MilstedVidal2017/source/extraction_koo_saleur.tex:64,115,194,437`) is local and registered (`references/lattice-symmetry/SOURCES.md:1784–1830`). It is the only local source that applies standard KS modes to a *non-integrable* chain, and it observes low-block selection rules consistent with P1. The brief's question 2 is about interacting chains, yet the note never cites this source.
4. **Carpi–Weiner energy bound** (`references/cft-machine/coset-symmetry/CarpiWeiner2004/source.tex:727–747`): ‖L_n v‖ ≤ r(1+|n|^{3/2})‖(1+L_0)v‖. P1 is exactly the lattice version of this bound, uniform in r, with Q in the role of 1+L_0. Citing it would anchor P1 as the natural target rather than an arbitrary hypothesis.

## 2. Step-by-step check of proven and conditional statements

- **D4-T** (NOTE:132–147). <1>1–<1>2 re-derived: the coefficient
  `z_m^j z_n^(j+1) − z_m^(j+1) z_n^j = z_(m+n)^j (z_n − z_m)` times −i j_j
  gives (3). It needs only that tiles on disjoint factors commute, which is
  the interchange law in any monoidal category, and N≥3 (the note assumes
  N≥4). No braiding is used. **Confirmed.**
- **(4) and the zero-mode shift** (NOTE:154–165). Re-derived: T_0+T̄_0 =
  (N/2π)(H/v − Ne) + 2b. A shift d gives a central term
  (m³c* − m(c+24d))/12. This agrees with GS:3226–3228, which the note does
  not cite there. **Confirmed.**
- **No-wrap (5)** (NOTE:222–236). Adjoint pairing re-derived by the
  substitution q′=q−n. The scaffold label is right. Note that (5) filters
  *total* many-body momentum, a different object from the benchmark's
  one-particle filter. The note says this implicitly ("not a local tile
  Fourier sum"). **Confirmed as scaffold.**
- **D4-P** (NOTE:301–349). Each step re-derived.
  - <1>1: the block (a,b) of Q^tTQ^{−t−1} is ≤ 2^t C 2^{t(a−b)} 2^{−d|a−b|} ≤ 2^t C 2^{−(d−t)|a−b|}. The Schur test with row and column sums is valid with no multiplicity factor.
  - <1>2: K^sTK^{−s−1} = (Q^{ps}TQ^{−ps−1})Q^{−(p−1)}, which is correct.
  - <1>3–<1>4: splitting the input at Λ is correct, and the high part gains Λ^{−2(p−1)}.
  - <1>5: P3 plus exact transport of Q gives (12). The choice Λ=2^{θr} with θγ<α makes both terms geometric.

  The A1–A4 forms match VR-1 exactly (`virasoro_routes.md:57–76`). **Conditional-ok.**
- **D4-B** (NOTE:351–364). The convolution envelope with D>d+2 holds by the
  triangle inequality. Orthogonal output shells control the tail, and a
  finite rectangle of full blocks remains. **Conditional-ok.**
- **p=1 counterexample** (NOTE:366–375). Re-derived:
  R=2^{2r}(|a⟩⟨a|−|b⟩⟨b|), with Q-weighted norm 1 and K-weighted norm
  2^{−2(p−1)r}. Other residuals, such as R_{2,−1}=−3T_1, are harmless. P1
  and P2 hold. **Confirmed** (also in `checks/check.py:130–138`).
- **D4-I** (NOTE:377–389). The Sylvester-inverse bound 1/g, with
  g ≥ 2^a − 2^{b+1} ≥ 2^{a−1}, was checked numerically (scratch script). The
  sign of the integral representation is right, and the reverse direction
  follows by adjoints. **Conditional-ok.**
- **D4-R** (NOTE:412–435). Inserting P+P⊥ is correct. I verified (13) to
  1e−15 for a *generic* random isometry on qutrit sites, so it holds for any
  isometry, not only placements. (16) follows from S_jV=Vk_j. **Confirmed.**
- **D4-V** (NOTE:465–482). I re-verified it on an O=𝟙⊕X carrier with
  dim X=2, on a **ring**. The compression is a one-site sum to 2e−16.
  **Confirmed.** It needs the unit summand to be isometrically included
  (CA-68:62–64). Unit multiplicity is irrelevant once ι is fixed.
- **D4-N** (NOTE:484–506). <1>1 is correct: transported norms agree, and A4
  makes them tend to zero. <1>2: second − 2×first = c*D/2. <1>3: finite
  spectral diameter, then the bracket (2a−k)T_k. This does not even need
  unitarity. **Confirmed.** Prior art is uncited (section 1).
- **D4-G** (NOTE:510–527). Upper bound: PBW gives
  M e^{βc/24} exp(Σ_k 1/(k(e^{βk}−1))), and the sum is ≤ π²/(6β) (checked
  numerically at β=0.01, 0.1, 1). Lower bound: S_{00}e^{π²c/(6β)} from the
  vacuum term after S. This needs nonnegative χ_a and S_{0a}>0, both
  hypotheses. The threshold c>1 is sharp for this argument. It sharpens
  LC-12 §5, whose crude 2/β bound would need c>24/π²≈2.43 and was used only
  at a single c. **Conditional-ok.** It also answers the open question in
  CA-75:108–111 ("general-c form … not written (Question, D5)").
- **(17)** (NOTE:561–574). The conformal-index shift k=m+n was re-derived from
  SCH:6424 with W^a_m=a_(m+d_a−1). The stress specialisation gives (m−n) and
  c(m³−m)/12. **Confirmed.**
- **D4-X** (NOTE:576–612). The hypotheses are explicit and reasonable: losses
  ℓ_a, uniform composite tails, residual loss L independent of r and of the
  truncation. The proof is a four-line sketch deferring to VR-1 ("exactly as
  VR-1 does"). Generalising VR-1's word telescoping (`virasoro_routes.md:118–137`)
  to losses ℓ_a only shifts graph orders, so the sketch is credible. It is
  still a sketch, and the cutoff-removal step <1>3 is asserted, not written
  out. **Conditional-ok (proof sketch).**

**Checks bundle.** I verified the SHA256 of `check.py` and `run_checks.py`
against `manifest.json`. The 20 PASS lines and 5 RED mutations match
NOTE:623–625. Limitation: every matrix check uses ordinary qubit tensor
sites (`check.py:4–6`), which is the degenerate category Vec with O=𝟙⊕𝟙. No
F-symbol, multiplicity index or non-self-dual object is exercised. This is
acceptable only because the identities checked are formal consequences of
the interchange law and linear algebra.

## 3. Adversarial pass on the headline D4-C

Attempts that **failed to refute** it:
- **C=Vec.** Then S is holomorphic: the trivial c=0 theory, or c≡0 mod 8
  (E8, Moonshine). The c=0 case is consistent with D4-N (the zero
  representation is allowed). For c≥8, D4-C asserts a local lattice
  realisation of the full diagonal holomorphic theory. This is bold but
  not contradicted by anything local. The diagonal choice removes the
  chiral-central-charge obstruction (NOTE:22–23).
- **Pointed or abelian MTCs C(A,q) and Vec_G^ω.** Only the modular cases are
  in scope, and none of D4-C's clauses uses self-duality or
  multiplicity-freeness. No contradiction.
- **Categories with fusion multiplicity and non-self-dual simples.** All
  finite identities (D4-T, D4-R, D4-V) hold with multiplicity indices and
  dagger mates (NOTE:79–83). Re-checked: nothing in §§1, 3, 4 uses N≤1 or
  a≅a*.
- **Non-braided fusion C.** The finite identities and the reductions survive
  (NOTE:66–69, confirmed). The headline itself requires a UMTC. Fusion-only
  input must supply a braided target (`realisation_and_fidelity.md:25–27`).
  Consistent.
- **Bounded N with growing site object** ("N≥4, typically growing",
  NOTE:76–77). Raw KS modes alias with period N, which forces
  R_{N,−N} = −2N T_0 − z ≠ 0. So P2 fails unless N_r→∞. This loophole is
  closed by the KS requirement.

Hidden assumptions and **real problems** with D4-C:
1. **The categorical content is optional.** Item 1 (NOTE:29–31) allows
   finite unit multiplicities and site objects that grow with the cutoff,
   and NOTE:63–65 concedes that ordinary spin chains are admissible. So D4-C
   is equivalent to "every effectively presented positive rational diagonal
   CFT is an OAR/KS limit of local spin chains", with C entering only
   through the fidelity clause. It is a lattice-realisability conjecture
   for RCFTs, not a C→lattice construction.
2. **Its input is the north star's output.** S is a complete rigorous unitary
   chiral theory with sector category C (NOTE:13–21). The conjecture is
   therefore a *discretisation* step, the bottom edge of the Wilson
   triangle. That is a legitimate and useful target, but it does not
   address the existence of S from C (acknowledged at NOTE:694–695).
3. **Uncontrolled growth of the site object.** Nothing ties dim O_r to N_r
   or to locality of the refinement. Item 3 asks for "local refinement
   maps", but bounded support growth (CA-75 contract item 4,
   `75_integration_map.tex:179–181`) is not stated. With fast-growing O_r,
   each site can absorb an arbitrary spectral compression of the target.
   The exclusion of compressions (NOTE:36–37) is then only verbal.
4. **Prior art is not positioned.** See section 1, item 2. The
   strengthening over Zini–Wang is real (full theory, OAR, standard KS, P)
   but should be stated.
5. **No first lemma is attackable.** D4-C bundles P, WT-1, net
   identification, integration and full fidelity. Not one component has an
   instance, not even P for the free calibration (examples table,
   NOTE:701).

## 4. Rule 16 audit

| Place | Model leaned on | Does the general statement survive without it? |
|---|---|---|
| NOTE:174–201 (§2 TL scope) | Temperley–Lieb / KS–GS chains | Yes. TL appears only as the source being *bounded* (negative scope). The general replacement is stated at NOTE:194–199 with no TL relation. D4-T says explicitly that it uses no TL (NOTE:147). |
| NOTE:203–221 (quadratic benchmark, CA-83/85) | Free fermion, CAR currents | Yes. Used only to locate which proof step fails for interacting chains. No general claim depends on it. |
| NOTE:534–555 (defect operators) | AFM projector family (self-dual, multiplicity-free) | Yes. The general point (anything commuting with E is a zero mode) is model-free. AFM's restrictions are flagged (NOTE:552–555). |
| NOTE:556–559 (HKV, ZW) | dGFF/Ising lattice fields; Ising anyonic chain | Yes. Cited only for scope and carrier type. |
| NOTE:527, 703 (LC-12) | Fibonacci four-port, c=14/5 | Yes. D4-G is the model-free lift, and model detail stays in the table. |
| `checks/check.py:57–61` | Qubit sites (Vec, O=𝟙⊕𝟙) | Yes, the identities are formal. Weakness: no genuinely categorical carrier is exercised. |
| Examples table NOTE:697–704 | Free fermion, coset, Fibonacci, Ising/dGFF | This is the permitted place. |

**Rule 16 violations: 0.** No model name carries model-specific detail into a
general statement outside the table.

## 5. Results-ledger grades (NOTE:636–652)

| Ledger line | Note's label | Grade | Reason |
|---|---|---|---|
| D4-C | conjectural | **overstated** (as a statement about C) | The label "conjectural" is honest. But "universal … for every effectively sewing-realizable C" overstates its categorical content: it allows spin-chain carriers, unconstrained site growth and target-as-input. It needs reformulation (section 3). |
| D4-T | proved | **confirmed** | Re-derived; interchange law only. |
| Energy-origin identity (4) | proved | **confirmed** | Re-derived; matches GS:3226–3228. |
| TL scope | source-local/negative | **confirmed** | Every anchor checked (section 1). |
| No-wrap (5) | scaffold | **confirmed** (as scaffold) | Adjoint pairing re-derived; locality and comparison are unproved, as stated. |
| D4-P | proved conditional | **conditional-ok** | All steps re-derived; A1–A4 match VR-1 verbatim. P has no instance. |
| D4-B | proved conditional | **conditional-ok** | Envelope and tail argument verified. |
| D4-I | proved conditional | **conditional-ok** | Sylvester bound verified. |
| Spare-regularity counterexample | proved negative | **confirmed** | Re-derived; also in checks. |
| D4-R | proved | **confirmed** | Holds for any isometry (numerical check, qutrit carrier). |
| D4-V | proved negative | **confirmed** | Open and ring, O=𝟙⊕X with dim X=2. |
| D4-N | proved negative | **confirmed** (prior art uncited) | The maths is correct. It partly duplicates GS:2489, LC-2 Prop. 5 and CA-67:104–109; the new part is step <1>1 plus the zero-representation conclusion. |
| D4-G | proved conditional | **conditional-ok** | Verified; sharp threshold c>1; answers CA-75:108–111. |
| D4-X | proved conditional | **conditional-ok** (proof sketch) | Hypotheses explicit; proof deferred to VR-1 in four sketch steps. |
| Open items | open | **confirmed** | Nothing in the ledger claims more. |

## 6. Recommended changes before lifting

1. Restate D4-C with a carrier constraint, for example O_r = 𝟙⊕X_r with
   X_r having no unit summand, plus bounded support growth of the
   refinement. Alternatively, retitle it explicitly as "lattice
   realisability of a supplied RCFT". Position it against Zini–Wang Conj.
   4.3 and Rmk. 9 and `virasoro_routes.md:41`.
2. Cite GS:2489, LC-2 Prop. 5 and CA-67 NG5 at D4-N.
3. Cite Carpi–Weiner (CW:727–747) at P1 and Milsted–Vidal at §3.
4. Propagate the CA-73 support correction (CA-73:168–172) into the shard.
