# D3 refinement meets dynamics: sceptical reconciliation

Reviewer: Opus reconciler, 2026-10-22. Scope: `NOTE.md` (797 lines) and `checks/`,
read against the brief `../briefs/D3-refinement-meets-dynamics.md`, CA-75
(`report/sections/75_integration_map.tex`) and the cited sources. No Julia, no
latexmk. Files written: this file, `INTEGRATION.md`,
`checks/review_check_pointed.py` and its output `checks/review_check_pointed_output.txt`.
`NOTE.md` is cited as `N:line`.

**Bottom line.** The finite-volume mathematics is correct. I re-derived every
step of D3-1 to D3-6, (3.3), (4.3), (4.4), the spectral-flow identity, (5.1)–(5.2), (6.2),
(7.1)–(7.3), (8.2) and the centering identity, and found no error. The
`SHA256SUMS` bundle verifies. `check_drift.py` reruns with all eleven groups
passing. A new reviewer check, `checks/review_check_pointed.py`, confirms D3-5 on a
constrained carrier with a non-self-dual simple and multiplicity two.

The problem is the headline. D3-C (N:10–75) is unrefuted and well posed. It is
a short-imaginary-time locality statement in the UV, and by the note's own §7
and D3-6 it cannot address the infrared obstruction that blocks WT-1 drift at
criticality. The note's useful content for the programme is the conditional
bridge D3-1/D3-4 into CA-75 Link (b), together with the corrections to CA-72 and CA-73.

## 1. Citation audit

Every cited anchor was opened. All `SHA256SUMS` entries verify. They are as claimed, except for the following.

| # | Note location | Claim | Finding |
|---|---|---|---|
| C1 | N:777–785 (S9, S9b, S10) | CA-86, CA-87 and Levin–Wen "exist in the local Git object database, not the current working tree" | **Stale.** All three were merged at `a120439` and are in the working tree. A diff against `1f402aaf` shows the cited line ranges are unchanged. The only changes are convention-label renames: (ac)→(ak) in CA-86 (`86_…tex:21,61,154`) and (ad)→(aj) in CA-87. The content claims hold: `86_…tex:61–110` gives the anisotropic weights (Cor. 86.2), and `87_…tex:55–69` is Lemma 87.1. |
| C2 | N:148–153 | "CA-72:166–182 proves … Its following interpretation as the sourced soft C*-condition needs an additional argument" | The anchor is right for Thm 72.7. The criticised reading is Cor. 72.8 at `72_…tex:184–196`, which should be cited explicitly. The substance is **correct**: the operator-norm defect is \|cov_χ\|·‖1−P‖. Source (29) is operator-norm (`literature/md/2306.16063/2306.16063.md:570–574`). D1 found the same (D1 REVIEW.md:126). CA-75:146–147 repeats the Cor. 72.8 reading ("modulus of softness"), so CA-75 inherits the qualification. |
| C3 | N:139 | CA-73:159–172 "three-site support reading" | Exact (`73_…tex:169–172`). The correction is valid: `θ(h_j)` also contains vacancy projectors on every other inserted site. |
| C4 | N:317–319 and the examples row at N:746 | Energy/gap version of D3-4 | The inequality `1−|⟨Ω,ψ⟩|² ≤ (E_ψ−E_0)/Δ` is stated in the source, `references/refinement/HaegemanEtAl2018Wavelet/source/latticefermions.tex:487–491`. The note cites it only as "motivation" in the examples table and not at the statement. The note should attribute it there. |
| C5 | N:625–634, (8.2) | Labelled "proven" | Correct, but it is the same telescoping identity as VR-1 `<1>3 <2>2` (`cft_machine/research/virasoro_routes.md:125–131`). The note says only "exactly the obligation in VR-1". It should cite the identity as existing. |
| C6 | N:140–142 and `checks/check_drift.py:75–80` | Distant-support witness is an "inserted-site flip" | The flip `|1⟩↔|X⟩` is a morphism only when X contains 1. The check is the case C = Vec with O = 1⊕1. For general X the categorical witness is a two-site hop `h^+` of CONVENTIONS (ak), which fails to commute with the distant vacancy projector. The conclusion survives. Only the witness is instance-specific. |
| C7 | N:179–201 vs D6 NOTE.md:287–303 | D3-1 second bound | This is a duplicate of D6 P2 (concurrent, independent). Both are correct. Cite one from the other when promoted. |
| C8 | N:82–85 and LC-4 | Open chains with endpoints | LC-4's KS tier is periodic (`reconstruction/04_cutoff_oar.md:22–24`). This is an interface mismatch, not a citation error, but LC-4 consumption (N:702) needs either an open-chain KS tier or a periodic version of D3. |

The following were checked and accurate: S1 (`2010.11121.md:101–124,126–180,198–220,1078–1101,1632`); S2 (`latticefermions.tex:434–491`); S3; S4 (`wilson_triangle.md:18–105,109–153,155–167`); S5 (`68_…tex:49–105,139–149`; `71_…tex:53–146`); S6 (`72_…tex:56–109,140–196`); S8 (`04_cutoff_oar.md:16–31,84–155`; `01_cells.md:63–99`); S10 (`strnet.tex:487–552`, rules (topinv)–(fusion)); S11 (`84_…tex:94–125`, CO-1); S12 (`EvansGannon2018/source.tex:334`, c mod 8); S13 (`WILSON_PROOF.md:18–98`); S14. The CONVENTIONS use is consistent: (h) uses `H=Σh_j` (CONVENTIONS.md:163–172), and (ak) uses `H=−Σh_j` (CONVENTIONS.md:1397–1400), as N:91–93 says.

## 2. Adversarial pass

### 2.1 Attempts to refute D3-C (all failed)

- **Degenerate inputs.**
  - O = 1 (X = 0) makes V unitary and W = V, which is trivial.
  - For C = Vec with O = 1⊕1 (an ordinary qubit chain), D3-C reduces to a statement about the polar part of `e^{-tH}V` with V a product of local pins. No counterexample: at small t this is a high-temperature-type quasi-locality statement.
- **Pointed, cocycle, non-self-dual and multiplicity cases.** D3-5's proof (N:454–468) uses only two facts: operators on disjoint intervals commute (the interchange law in End_C, no braiding), and `P_Z V = V`. I tested Z/3 with O = 1⊕g⊕g, total charge g² ≠ 1, fine block dimension 252 (`checks/review_check_pointed.py`). The tangent, isometry, energy derivative and pair-locality all pass to 1e-6.
  - A nontrivial 3-cocycle only adds F-phases inside interval operators and does not touch either fact.
  - No self-duality, multiplicity-freeness or braiding is used.
- **Non-braided C.** Nothing in D3-C or D3-5 needs braiding: the chain is planar and ordered.
- **Global conditioning.** `G=V*e^{-2tH}V` has a condition number exponential in volume (N:515–516). This kills naive norm expansions. It is not a counterexample, because the local tangent-extension lemma (N:483–504) sidesteps G at first order.
- **Hidden hypothesis found, not a counterexample.** At t > 0 the outside-vacancy argument fails: `P_t=W W*` is no longer a product of local projectors. An all-orders proof therefore needs a quasi-local replacement for `P_Z`. The note flags this at N:506–518.

**Verdict.** No counterexample was found. D3-C is plausibly provable for t ≤ t_0 by short-imaginary-time analyticity or cluster expansion plus the local-extension lemma (6.3). Candidate sources are high-temperature effective-Hamiltonian quasi-locality and 1D Gibbs analyticity; none is local, so this is **not** asserted (Law 1).

### 2.2 Step-by-step checks of proven and conditional statements

- **D3-1 (N:157–206).** (2.1), (2.2), the composition `<1>6` and the direct-sum dual norm (2.3) are all correct. The scalar-collapse diagnostic is correct.
- **D3-2 (N:210–224).** Correct. The constant 2 is sharp (check saturates at 8/5).
- **D3-3 (N:226–260).** The proof is correct, including the Hermitian-functional norm step `<1>4`.
  - **Overlooked limitation.** For the augmented system (2.2) or a bare corner, τ cannot be small. If b = θ(a) = a′⊗P_far and b_B is supported near a, testing on vectors with the far pins satisfied and violated gives `‖θ(a)−b_B‖ ≥ ‖a‖/2`. So D3-3 applies **only** with a local unital lift (open problem 1, N:712–715) or in the corner form (3.2a). (3.2a) carries the global `2q_n`.
  - **Expected limitation (not proved).** With the natural witness `K_B=H_B−E_0(H_B)` at criticality, `E_ω` stays O(1) (surface energy) while `λ_B` is the finite-size gap, roughly `|B|^{-1}`. Then (3.2) is ≥ 2 and says nothing. A state-adapted witness, e.g. a spectral projection of the reduced density, is needed. N:257–260 hints at this but does not say it.
- **(3.3) (N:279–299).** The Duhamel derivation is correct, with `‖b_0‖≤1` implicit. Categorical LR is a hypothesis, as the note says. The abstract LR proof uses only disjoint-support commutativity, so it should port. That is not checked here.
- **D3-4 (N:303–341).** Correct, including the augmented route: σ̂_n(b,z):=σ_n(b) satisfies σ̂_nα̂_n=ω̂_n, because ψ∈Ran P.
  - **Reviewer corollary (non-collapse), derived here.** Fix phases so that ⟨Ω_{j+1},W_jΩ_j⟩ ≥ 0. Then `‖W_jΩ_j−Ω_{j+1}‖ ≤ √2 ε_j/Δ_{j+1}`. Telescoping gives `‖W_n^kΩ_k−Ω_n‖ ≤ s_k := √2 Σ_{j≥k} ε_j/Δ_{j+1}`. Hence `ω_n(P_n^k) ≥ (1−s_k²/2)²`.
  - Consequences of the corollary:
    - Under (4.1) the scalar-collapse alternative of D3-1 (N:199–201) cannot occur.
    - D1-T5b's sufficient condition `Σ√(1−p_n)<∞` (D1 NOTE.md:381–384) holds.
- **(4.3) (N:343–358).** Correct. The volume factor and the 2ζ energy-origin cost are both right.
- **Spectral flow (N:360–376).** The identity `d/ds(U*SU)=U*(Ṡ−[A,S])U` is correct. The bound 2∫e + 2η is correct, using the vector distance for the circuit term.
- **(4.4) (N:378–393).** The Sylvester-equation integral argument is correct, and the Duhamel corollary is correct.
- **§5.** The eigenvector perturbation formula is correct. (5.1) and the u > 1+z arithmetic are correct.
- **D3-5 (N:443–518).** All identities were verified, including (6.2) and the pair locality: `V*h_Z(1−P)h_YV = V*h_Z(1−P_Z)(1−P_Y)h_YV`, which vanishes when no inserted site of Y lies in Z. Disconnected factorisation uses `(f⊗g)^{-1/2}=f^{-1/2}⊗g^{-1/2}` for commuting positive invertibles, which is correct.
- **D3-6 (N:571–612).** The Schur complement, (7.3) and the 3×3 counterexample are correct (det = −t²/2).
- **(7.1) and the commuting-corner identity (N:541–557).** Correct.
- **§8.** The centering identity is correct: `ω((p−P)²)=pq`.

### 2.3 Contradictions with and duplications of the repo

- The note **contradicts** CA-72 Cor. 72.8 (`72_…tex:184–196`) and CA-75:146–147 on the topology of the softness modulus. The note is right.
- It **qualifies** CA-73 Lemma 73.1 (`73_…tex:169–172`) on support and unit. The note is right, and D1 and D4 concur.
- It does not contradict any convention.
- **Duplications.**
  - D3-1's augmentation is the generalisation of CA-84 CO-1 (cited).
  - D3-1's second bound is D6 P2.
  - D3-4's energy version is in S2:487–491.
  - (8.2) is VR-1's telescoping.
- **Answers to CA-75 Link (b):**
  - **(b2):** yes, `d ≤ p r + q` or `p r + 2q`, and there is no bound by q alone.
  - **(b1):** a strict, not soft, unital tower exists by scalar augmentation. It is global.
  - **(b3):** still open.

### 2.4 The structural gap the note under-states

D3-4 and (3.2a) both control drift through **global** quantities: `q_n = 1−ω(P_n)` and `ε_n/Δ_{n+1}` with an O(N_n) volume factor (N:352–356).

- Summability needs density mismatch o(a_n^{1+z}) (N:413–416).
- For any dressing of fixed local accuracy, S2:478–479 states that local-accuracy approximations are expected to become orthogonal to the true ground state as volume grows. So the global route is expected to fail unless dressing accuracy improves with n.
- The only global-fidelity-free route is D3-3, and it requires a local unital lift (open problem 1) that no direction has yet built (D1 NOTE.md:623, 639).

Hence: **no route in the note is presently non-vacuous for a critical family.** The note is honest about each piece, but it never states this conjunction. CA-75 should record it (INTEGRATION.md (a)).

## 3. Rule 16 audit

| Place | Model leaned on | Does the general statement survive without it? |
|---|---|---|
| Body N:1–739 | None named. "Critical chain" and "dynamical exponent z" are generic hypotheses. | Yes. |
| N:140–142, `check_drift.py:75–83` | The inserted-site flip exists only for C = Vec, O = 1⊕1 (C6). | Yes: use a hop tile, and the reviewer check covers a constrained carrier. |
| `check_drift.py` overall | Ordinary two-level tensor carriers | Calibration only. Every checked identity is proved categorically in the note. `review_check_pointed.py` adds a non-tensor-factorised charge block. |
| N:435–439 [S13] | Free-fermion instance mentioned, with detail deferred to the table | Yes. It is cited only as the existence of one fixed-row instance. |
| N:566–569 | Levin–Wen fixed point | This is a general construction, not a model. The negative conclusion is general. |
| Examples table N:741–748 | Free fermion, wavelet MERA, Vec qubits, O ≅ Y⊗Ȳ | Correctly confined. No model-specific fact feeds a general claim. |

The only standing restriction is that a pointed site object O ⊇ 1 is required. Vacuum insertion is the mechanism, so dense site objects are out of scope. CA-68 and CA-71 declare this, and it is not a hyperfixation. **Rule 16 violations: 0.**

## 4. Results-ledger grades

| Ledger line (N:666–687) | Note label | Grade | Reason |
|---|---|---|---|
| D3-C | conjectural | **unverifiable** (honestly labelled) | No proof and no counterexample (§2.1). Plausible. It is off-target for WT-1 at criticality (§2.4). |
| D3-1 | proven | **confirmed** | §2.2. It duplicates D6 P2 and generalises CA-84 CO-1. |
| D3-2 | proven | **confirmed** | The sharp constant was verified. It is the standard gentle-projection bound. |
| D3-3 | conditional | **conditional-ok** | The hypotheses are explicit. It is inapplicable to the augmented or bare-corner maps (τ ≥ ‖a‖/2), and natural witnesses are expected to fail at criticality (§2.2). |
| (3.3) | conditional derivation | **conditional-ok** | The derivation is correct. Categorical LR is not proved locally. |
| D3-4 and (4.4) | conditional | **conditional-ok** | The proof is correct, and the reviewer adds a non-collapse corollary. (4.1) is a global-fidelity hypothesis (§2.4). The energy version is in S2:487–491 (C4). |
| (5.1)–(5.2) | proven arithmetic | **confirmed** | |
| D3-5 | proven | **confirmed** | It was re-verified on the pointed Z/3 multiplicity-two carrier. It is first order only. |
| D3-6 | proven reduction/negative | **confirmed** | |
| (7.1) and the commuting corner | proven negative | **confirmed** | |
| (8.2) and centering | proven | **confirmed** | (8.2) is pre-existing in VR-1 (C5). |
| §1 interface corrections (not in the ledger) | (asserted) | **confirmed** | These concur with D1 (D1 REVIEW.md:126,130). |
