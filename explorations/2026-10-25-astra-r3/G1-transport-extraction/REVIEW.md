GRADE: COUNTEREXAMPLE

2026-10-27, independent sceptical referee of `NOTE.md` (458 lines, SHA256
`ba56db52a306f7baf520b35ec3be39521fe844a8161ca83168f7a1a175e12c30`; not edited).
The grade is **to Conjecture G1 as posed in the brief and to CA-96 Target 96.10
exactly as stated**. The counterexample G1.3 holds up under every step audit and
under an independent exact/numerical re-check with six intended RED mutations. The positive
general theorem G1.1 and the finite statements G1.4, G1.5 are proved at their
stated scope. No load-bearing step is FALSE. The defects are presentational and
evidential (unfilled sections, an unreferenced check bundle, one vacuous mutation)
plus one remark-level GAP. Writes: this file, `INTEGRATION.md`, `checks/review_*`.
No network, commits, Julia suite or edits elsewhere.

## Is G1.3 a counterexample to Target 96.10 *as stated*? Yes.

CA-96 defines its condition (a) at `report/sections/96_blocked_dyadic_lifts.tex:55-56`:
> "The brief's labels mean (a) all-L unital injective *-lifts of V_L with one finite
> interval slack;"

and states the target at `:270-275`:
> "Target 96.10 [conjectural; any; L0; ->R0^u] ... Assume exactly (a) for arbitrary
> unitary fusion C and pointed O: all L, exact V_L, and one finite slack in
> (eq:96-lift). Prove or refute the existence of a finite b and pointed unitary
> transport on (O^{(x)b}, eta^{(x)b}) over full <O>. No unchanged-side, occupation or
> translation hypothesis may be added."

G1.3 (NOTE:171-278) supplies, in untwisted unitary `Vec_{D_m}` (m>=3), `O=1+a+b+ab`,
`eta=e_1`, `D=<O>=C`: for **every** L a unital injective *-map `alpha_L` with
`alpha_L(a)V_L=V_La` exactly and `alpha_L(A_[j,k]) ⊂ A_[2j-1,2k] ⊂ A_[2j-2,2k]`
(slack 1). That is literally (a), each quantifier matched: arbitrary unitary fusion
C is instantiated by a unitary fusion category; "pointed" by the isometry `e_1`;
"full <O>" by C itself; dyadic composites are compositions (CA-96:114). And no
`O^n`, n>=1, carries *any* relative half-braiding on `<O>`, pointed or not, unitary
or not, because `[O]^n` is not central in `K(C)=Z[D_m]` (NOTE:253-278; CA-90 (90.6),
`90_local_unital_lift.tex:183-189`). So the implication "(a) => exists b with pointed
transport on O^b" is false: 96.10's conjectured positive answer is **refuted**, not
merely a stronger reading of it. The refutation uses none of the forbidden added
hypotheses; it would also survive one natural strengthening: the G1.3 lifts satisfy
CA-97's trailing descent square (97.11 form) on all matrix units for L=1,2, m=3,4
(finite check below). It would **not** survive an occupation-degree hypothesis:
`alpha_2` violates the (am) degree on 276 (m=3) / 244 (m=4) matrix-unit entries. So
the D1-C-type "occupation-compatible" variant of 96.10 is untouched (and open).

## Per-step verdicts

Locations are NOTE.md lines. VALID means valid at the written hypotheses.

| Step; lines | Verdict | Referee justification |
|---|---|---|
| Conventions; 21-35 | VALID (minor stale) | Support = interval membership (as); inclusion-matrix orientation declared (30-31), consistent with 90.2(b) and 96.4. "(ax)-(az) proposed" (25) is stale since CONVENTIONS (ax) was registered 2026-10-27 with another meaning (`CONVENTIONS.md:1644-1665`). The (ar)->(as) correction of the brief is right. |
| G1.1 `<1>1`; 54-64 | VALID | Lemma 90.0 (`90_local_unital_lift.tex:89-105`) and its heterogeneous form (F1 NOTE:105-112, accepted at F1 REVIEW:51) use only (H) for the inserted object and full-D naturality on the suffix. Replacing P by an arbitrary pointed K with transport on D is well typed: each new K crosses only old O-strands, so no self-crossing of K is needed. |
| G1.1 `<1>2`; 66-70 | VALID | `B_L(1⊗kappa^L)` is the interleaved kappa-insertion by the point axiom; (A) cell by cell gives `T_L(1⊗kappa^L)=V_L`; unitarity of T then gives `T_L^†V_L=1⊗kappa^L`, hence intertwining. |
| G1.1 `<1>3`; 72-77 | VALID | Before u: image in heterogeneous positions 2j-1..2k-1 (90.1 case analysis); cell-u conjugation enlarges only to cell k's second slot: `[2j-1,2k]`, inside slack 1. Membership, not commutation. |
| G1.1 `<1>4`; 79-85 | VALID | `Hom(d,W_L⊗K^L)=⊕_c Hom(c,W_L)⊗Hom(d,c⊗K^L)`; conjugation preserves multiplicities. Penneys:195-237 (orthogonal splittings) and twocolour.tex:897-913 (restriction multiplicities) say what is used. |
| G1.2 `<1>1`; 100-110 | VALID | K=N·1 with flip transport satisfies (H) trivially; (C) is a grade-preserving bijection; ENO:45 and Penneys:277-288 give the untwisted tensor rule. |
| G1.2 `<1>2`; 112-128 | VALID | Formula (D) and the cellwise identity (E) follow because K's transport is trivial. |
| G1.2 `<1>3`; 130-140 | VALID | Every F1.1b map is `Q(a⊗1_{P^m}⊗1_Q)Q^†`, `P^mQ≅O^L`, then Ad U_L; so its inclusion matrix is fusion by O^L, independent of b and t. |
| G1.2 `<1>4`; 142-150 | VALID | Word count: `Λ^alt=N^Lδ`, `Λ^tr=N^{L-1}`. Re-derived from an actual CA-90 conjugation lift at L=1,2 in G=S_3 (review check). |
| G1.2 `<1>5`; 152-161 | VALID | Unitary conjugation preserves Λ; automorphisms permute blocks and preserve centrality, and N^Lδ vs constant N^{L-1} cannot be permuted into each other. |
| G1.2 scope; 163-169 | VALID | Correctly says O=R itself has transport; refutes only the classification clause. |
| G1.3 `<1>1`; 189-201 | VALID | D=C. The class {r,r^-1} is conjugation-stable and r≠r^-1 for m>=3, so rho is a well-defined permutation action fixing E_0,E_1; (H) is the standard Z(Vec_G) form. Re-checked exactly (1376 tensor instances). |
| G1.3 `<2>1`-`<2>3`; 222-235 | VALID | I transcribed the table **by name** and checked bijectivity, grade preservation in a *different* model of D_m (permutations of Z/m) and the point rows, m=3..6. The identities hold in the free product of two involutions, so m-independence is genuine. |
| G1.3 `<1>3`; 237-251 | VALID | Formula (J) agrees with the literal schedule: K_i crosses O_L,...,O_{i+1}, acquiring `rho(g_{i+1})...rho(g_L)=rho(x_i)`. My check builds T_L by literal adjacent crossings (no closed form) and re-verifies morphism, bijection, exact V, *-hom and slack-1 membership on dense random elements. |
| G1.3 `<1>4`; 253-272 | VALID | A,B,R give a 2-dim representation; `M=(I+A)(I+B)`, `M^2=λM`, `[M,A]_{12}=4 sinθ`, all re-verified symbolically in θ (sympy), with the addition law giving R^m=I. Hence `[M^n,A]≠0` for all n. |
| G1.3 `<1>5`; 274-278 | VALID | Any half-braiding on O^n gives `O^n⊗x≅x⊗O^n` for all simple x, hence `[O]^n` central. CA-90:183-189 is stated for O; it applies verbatim to O^n and needs only invertibility. |
| G1.3 structural; 280-287 | VALID | `(1+b)(1+a)(1+b)=(1+b)(2+ab+ba)` expands correctly; M singular explains why s cannot be cancelled. |
| G1.4 `<1>1`; 310-315 | VALID | P=V V^† reduces alpha (CA-76:120-123, 76.1 `<1>3`); the dimension identity is unitality. |
| G1.4 `<1>2`; 317-327 | VALID | Equal complement multiplicities give a unitary intertwiner W on `(1-P)`; U=P+W fixes V. Global only, as stated. Essentially CA-76.3 plus its converse. |
| G1.4 `<1>3`; 329-338 | VALID | Restriction multiplies inclusion matrices. Tautological but correct; correctly located as "where Bratteli data enters". |
| G1.4 `<1>4`; 340-347 | GAP (remark-level) | "Using the latter formula ... is a false inference, witnessed by an actual local lift": no T^alpha for G1.3 is computed, and 90.2(b) concerns one-gap maps M→M+1, not dyadic ones. The conclusion (the identification is unavailable) is correct by the hypotheses of 90.2(b); the "witnessed" claim is an argument by contradiction with (K) that is not written out. Not load-bearing. |
| G1.5 `<1>1`; 370-385 | VALID | 90.2(a) (`90_local_unital_lift.tex:175-192`) applies to any pointed P∈D; orientation of z matches (90.5). Finite polynomial system, no tolerance. |
| G1.5 `<1>2`; 387-395 | VALID | 96.8 transports blocked H; a unitary w∈End(O) with wη=η' transports H by w^{⊗b} and preserves the point. |
| G1.5 `<1>3`-`<1>4`; 397-408 | VALID | Min b=∞ in G1.3 with slack 1; no decidability claim is made. Honest. |
| Ledger/tags/integration; 410-434 | VALID | Tags match the proofs; no rung inflation. |
| Open problems; 436-439 | NOT A DELIVERABLE | Stale skeleton text ("All five proof-plan items are initially open") contradicts the ledger. |
| Examples table; 441-443 | NOT A DELIVERABLE | Empty placeholder ("to be added"); the brief required it. |

## Evidence audit (Law 3, Rule 7)

* Re-ran `checks/dihedral_lift.py` and both mutations: identical to the stored
  outputs (`checks/review_author_rerun.txt`). The GREEN run asserts real invariants.
* **The NOTE never cites its own checks**: no command, output path or headline
  appears in NOTE.md. The bundle has no README. Law-3 defect, easy to repair.
* **`--mutate-point` is vacuous.** It swaps the E_0/E_1 rows of u and fails only
  the literal assertion `u[g,0]==(g,0)`. But E_1 is also rho-fixed, so the swapped
  table is another *valid* lift with point E_1. My replay
  (`--mutate authorpoint`) stays GREEN, V-intertwining included. The genuine point
  mutation (reflections exchange E_0↔E_1, a grade-correct unitary action that no longer fixes
  kappa) is RED at `alpha(a)V != Va`.
* `--mutate-transport` fails at grade preservation, not locality. No author mutation shows
  that the interval test discriminates. My `--mutate dress` (a grade-preserving
  unitary fixing range V_L, coupling sites 1,2,4) leaves V exact and is RED at
  `alpha(A_[1,1]) not in A_[1,2]`.
* G1.2 had no check. My script reproduces (G) from an actual CA-90 lift.

Independent check `checks/review_g1_independent.py` (448 lines; numpy 1.26.4,
sympy 1.12; ~2 s). Command `python3 -B checks/review_g1_independent.py`, output
`checks/review_g1_independent_output.txt`. Mutations `--mutate {K,u,transport,point,
dress,centralO}` are each RED at the named assertion (`checks/review_g1_red_*.txt`).
`--mutate authorpoint` is GREEN (`checks/review_g1_green_authorpoint.txt`).
Float64 tolerance 1e-9 is used only for dense random-element tests; group-ring,
table, T_L, descent and class enumerations are exact. These checks calibrate the
proofs. They do not prove the all-m or all-L quantifiers; the proofs do that.

## Hunting for drift, hidden hypotheses and accidents

* F gauge / associators: none in G1.2-G1.3 (untwisted Vec_G); G1.1 inherits
  Lemma 90.0's coherence. Dagger vs dual: only daggers occur. Crossing orientation
  `t_Y:Y⊗K→K⊗Y` matches (as)/90.H; z in G1.5 matches (90.5). Support per (as).
* Letter collision: `r` is both a group element and the slack. The NOTE flags it
  (181-182) but it should not be carried into a shard.
* Group-graded accident? The **existence** content (G1.3) is necessarily an
  instance: a counterexample to a universal statement. The positive results G1.1,
  G1.4, G1.5 are general. G1.2 is written as an instance but has a general core
  (corrected statement C2 below). G1.3's mechanism is also general: G1.1-type data force
  `[O]([K]-[O])=0` with `[K]` central, so a non-central `[O]` must be a zero divisor in
  `K(D)⊗C` (singular in some irreducible representation of the fusion algebra).
  The NOTE observes this only for the instance (284-287).
* Hidden hypothesis in G1/96.10 (not in the NOTE): the hypotheses relate
  **no two lengths**. Each α_L may be chosen independently. In Vec_G with O=R, take the
  G1.2 lift at even L and an F1.1b lift at odd L: still (a), r=1, with Λ(L)
  alternating between N^Lδ and N^{L-1}J. So any "single datum reproduces α_L for all
  L" classification (G1(a)) is false for a reason that has nothing to do with
  dihedral groups. Any extraction target needs a uniformity-in-L hypothesis.

## Corrected statements with honest tags

C1 (= G1.1) **derived** (any, open chain; L0 + supplied pointed (K,κ), pointed
unitary relative transport t of K on full D, pointed unitary u:O⊗K→O⊗O with
u(1⊗κ)=1⊗η; R0^u). Gives all-L lifts on the original A_L, exact V_L,
`α_L(A_[j,k])⊂A_[2j-1,2k]`, dyadic composites, and `Λ_{c,d}(L)=dim Hom(d,c⊗K^L)`.
CA-90 is the case K=O, u=1.

C2 (general core of G1.2) **derived** (any; L0 + the data; finite →R0^u). The
inclusion matrix Λ_α(L) is invariant under output unitary conjugation and, up to
block relabelling, under input/output *-automorphisms. F1.1b lifts have Λ = fusion by
O^L and C1 lifts have Λ = fusion by K^L. Whenever these differ on occurring blocks, the
lifts are not gauge equivalent at that L. By G1.4(2), equal Λ is equivalent to *global*
V-fixing conjugacy. Instance: Vec_G, O=R, K=N·1.

C3 (= G1.3) **negative** to G1(a),(b),(c) and to Target 96.10; **derived** R0^u
witness (any, open; bare L0 within untwisted Vec_{D_m}, m>=3, O=1+a+b+ab; R0^u
reached, slack 1). No O^n carries any relative half-braiding on <O>.

C4 (= G1.4) **derived** (any; L0; finite →R0^u), with `<1>4` read as a remark.

C5 (= G1.5) **derived** (any; L0 + finite associator/dagger data; finite →R0^u).
It gives the fixed-b equations and the invariance of min b. It is **not** a criterion
for lifts, and no decision procedure for "some b" is claimed.

R1 (reviewer) **derived remark**: G1/96.10 impose no cross-L relation, so
lengthwise mix-and-match defeats every single-datum classification (above).

R2 (reviewer; any; bare L0 within Vec_{S_3}, O=1+g+h, gh≠hg; →R0^u) **derived
negative to all known constructions**. No b>=1 admits a pointed transportable K with a
unitary `O^b⊗K≅O^{2b}`, not even at class level. *Proof.* Such K has [K] central,
`[K]=α+βC_3+γC_2` (C_3 rotation, C_2 reflection class sums), and
`[O]^b[K]=[O]^{2b}`. Evaluate in the two 1-dim representations, where [O] is a nonzero
scalar and cancels: trivial ([O]↦3) gives `α+2β+3γ=3^b`; sign ([O]↦-1) gives
`α+2β-3γ=(-1)^b`. Hence
`6γ=3^b-(-1)^b`, which is ≢0 mod 3, so γ∉Z. ∎ The enumeration in the check confirms this for
b≤5, with the positive control `O=1+a+b+r` finding K=2+r+r^-1 and K=1+C_2. In
particular no O^b is central there (F1.1b excluded), and the C1-type ancilla and its
blocked generalisation are excluded. The original CA-90/CA-96 S_3 carrier therefore
escapes every sufficient construction in the repository. Its R0^u status is undecided.

R3 (reviewer finite check, not a proof; any; bare L0 instance) The G1.3 lifts satisfy
`α_{L+1}(a⊗1)=α_L(a)⊗1⊗1` on all matrix units for L=1,2, m=3,4 (92 units). They
violate (am) occupation-degree covariance. An all-L proof of descent should follow
97.11 `<1>1` with K in place of the new O. That proof is a GAP until written.

## Pillar served

**P1 (indefinite particle number)**: α_L is the unital refinement of the
vacancy-carrying tower `W_L=O^{⊗L}`, `O=1⊕X`. Each new site enters as the vacancy η
(exact V_L). G1 shows that the existence of such refinements is not controlled by
transport of O or of any power of O. It is controlled at least by transportable
*ancillas* K that the vacancy-pointed u converts into fresh sites. It also feeds
**P4 (OAR)**: local unital WT-1 A1 towers are the input of CA-76/90.W drift bounds
(no state estimate is supplied). The NOTE names no pillar (the rule postdates it).
G1.3's lifts do not preserve occupation degree, which matters for P1's
number-changing dynamics (D1-C).

## What the brief got wrong

1. It cited "(ar)" for transport; (as) is meant (NOTE:26 caught this).
2. G1(a) demanded reproduction of α_L by one datum without any coherence in L. This is
   ill-posed independently of G1.2/G1.3 (R1).
3. G1(c)'s dichotomy assumed "no tensor power transports ⇒ no lift exists". G1.3
   refutes the implication itself, so neither branch of the dichotomy is the outcome.
4. "b ≤ r+1 expected" fails maximally (b=∞ at r=1).
5. It conflated finiteness of the fixed-b equations with decidability of "some b".
6. Its three-way CA-88 choice (characterised / universal / obstructed) omits the
   actual outcome: existence is wider than finite-power transport and still open.

## Single sharpest next lemma

**Blocked-ancilla extraction under uniformity (conjectural; any, open; L0; →R0^u).**
Let C be unitary fusion, (O,η) pointed, D=<O> full. Assume (a) of CA-96 **plus** a
uniformity hypothesis in L. The trailing square `α_{L+b}(a⊗1_{W_b})=α_L(a)⊗1_{W_{2b}}`
for one fixed b is the 97.11 form, satisfied by CA-90 and (finitely) by G1.3.
Prove that there exist b'≥1, a pointed (K,κ) with pointed unitary transport on D,
and a pointed unitary u:O^{b'}⊗K→O^{2b'} with u(1⊗κ)=V_{b'}, such that the blocked
C1 construction reproduces α_L up to a uniformly local V-fixing unitary. Otherwise
give a counterexample. Two steps come first: sufficiency of the blocked form (combine
the C1 proof with 96.2 `<1>2`-`<1>4`) and the necessary class condition
`[O]^{b'}([K]-[O]^{b'})=0`, [K] central. A positive answer plus R2 would make
`Vec_{S_3}`, O=1+g+h, the first genuine bare-L0 R0^u no-go.

## Sources checked (path:line)

- `AGENTS.md` whole; `CONVENTIONS.md:1450-1471` (am), `:1524-1544` (aq),
  `:1564-1576` (as), `:1644-1665` (ax).
- `explorations/2026-10-25-astra-r3/briefs/_common_g.md:1-60`;
  `.../briefs/G1-transport-extraction.md:1-114` (conjecture G1 at :61-114).
- `report/sections/90_local_unital_lift.tex:57-77` (H), `:89-105` (90.0),
  `:110-141` (90.1), `:175-211` (90.2, boundary), `:245-250` (90.T), `:274` (S_3 row).
- `report/sections/96_blocked_dyadic_lifts.tex:48-59` ((a)-(c)), `:75-116` (96.2),
  `:120-150` (96.3-96.4), `:210-228` (96.8), `:247-253`, `:268-275` (96.10).
- `report/sections/97_what_the_tower_remembers.tex:176-213` (97.11-97.13).
- `report/sections/76_corner_to_wilson_bridge.tex:90-136` (76.1, 76.3, 76.4).
- `report/sections/88_layered_targets.tex:96-125,240-263`.
- `explorations/2026-10-25-astra-r3/F1-dyadic-lift-characterisation/NOTE.md:23-53,91-135,615-632`;
  `REVIEW.md:1-120,211-222`; `INTEGRATION.md:1-167` (esp. :145-155).
- `references/text/PenneysUnitaryFusionCategories.md:195-237,277-288,317-321` (splittings,
  Vec_G/Vec_G^ω, unitary Hilb(G,ω)); `references/text/EtingofNikshychOstrikFusionCategories.md:39-51`
  (:45 untwisted Vec_G tensor rule), `:1221-1225` (K(Z(C))→Z(K(C)));
  `references/lattice-symmetry/BubbleAlgebra2003/source/twocolour.tex:895-915` (restriction / Bratteli).
- Local citation gap (inherited, not new): the definition of relative half-braiding
  rests on `literature/md/1704.04221/1704.04221.md:298-307` via CA-90:76, not
  re-read here.
