# INTEGRATION: H1, worldline net gas (Opus review, 2026-10-27)

Pillars: **P2** first (the C-evaluated spacetime ensemble, and exactly when
it is a probability law), with **P1** inseparable (birth/death/ν reactions,
vacancy flags and occupied unit copies on the indefinite-N carrier).
Setting **any**; data **L0** plus declarations; rung **finite, →R3
ingredient**. No rung is reached. Grades follow REVIEW.md: H1 as posed is
COUNTEREXAMPLE; the corrected H1′ is WEAKER-RESULT-PROVED.

## (a) Statements safe to lift into a report shard

Proposed: one new ~200-line shard at the next free CA number, "Exact
worldline net gas on the pointed carrier: dictionary, traces, conditional
Markov law, sign structure". Cite NOTE.md and REVIEW.md by line.

| # | Statement (general C; tags any / L0 + decl. / finite) | Grade | Lift condition |
|---|---|---|---|
| 1 | Decorated tile dictionary (A1) and exact patch expansion (A2): w = [e^{th^c}]_qp/(g_q g_p), V = (d_a d_b/d_c)^{1/4}u; bare nets carry sums of products | derived | Cite CA-78 Prop. 78.2 as the exactness source; the new part is the pointed dictionary |
| 2 | Vertex-tile norms (ν^R)†ν^R = √(d_a d_b/d_c) P_(v,c); θ = √(d_a d_b d_c); geometric tiles + ν do not span End(O⊗O) in general | derived | — |
| 3 | Ev_C rules: contractible circle = d_a, isometric bubble = δ, F-recoupling; trace identities (B1); E_W is a CP conditional expectation | derived | Name coev_O as the standard solution (REVIEW G1) |
| 4 | Physical Gibbs trace Tr_H = tr_C(J_L ·), J_L = Σ_c d_c^{-1}P_c; only contractible components carry d_a; time-wrapping lines do not | derived (+ negative) | — |
| 5 | Inverse-Gram sewing (C1); exterior functional L_ξ | derived | Disk-like Q only, or the multi-boundary form (G2) |
| 6 | Boundary-tensor domain Markov law (C2) | conditional (scalar weights ≥ 0, Z > 0, positive marginal) | State: "the exterior acts through the ray [L_ξ]" |
| 7 | Endpoint labels do not determine the conditional law; G^{-1} has negative entries (C3), for every symmetric self-dual a with d > 1 | negative | — |
| 8 | Loop positivity (D1) for oriented-proper or κ = +1 tiles under *planar* closure; phase criterion (D3) | derived | State the closure explicitly (G3) |
| 9 | Coefficient-sign "iff" fails: necessity by occupation gauge; sufficiency by pseudoreal X (D4). The second is invariant over C-covariant presentations | negative | Cite review_holonomy P1 for invariance |
| 10 | Theorem D-F: a nonnegative complete unitary F calculus on ⟨X⟩ exists iff ⟨X⟩ ≅ Hilb_G with [ω] = 0 | derived | Add the relevance caveat: says nothing about the entries a given h uses |
| 11 | Path-gauge (holonomy) criterion for common-diagonal-gauge stoquasticity of all exp(t h_j) | derived | — |
| 12 | Temporal RP does not imply termwise positivity *in a fixed presentation*; termwise positivity does not imply RP; reflected factorisation implies RP | derived / negative | Must say "fixed presentation" (G4; review_d3_rotation) |
| 13 | Exact weight ODE (E1); categorical data cannot fix the anisotropy (h ↦ qh) | derived / negative | — |
| 14 | E-scaling (conformal marked-net law) and E-Markov (limiting kernels) | conjectural | Keep separate from 1–13, as the note does |

Do **not** lift: (D5) as a "criterion" (it is the definition); "→R1" for
H1-A; any claim that H1 supplies SLE/CLE axioms beyond finite, conditional
domain Markov.

## (b) CA-88 grid cells

**Move (finite / ingredient layer only):** add one grid row, "new shard |
any | L0 + decl. (O, h, tile basis (ay), closure (az)) | finite, →R3 |
exact net gas, J_L trace, conditional domain Markov [derived/cond.], sign
classification D-F/D-FS [derived/neg.]". The CA-86/CA-87 row
"any | L0 | finite" stays, and gains an amendment pointer (c1).

**Do not move:** R0^c, R0^u (no tower content), R1 (no limit state), R2 (no
Virasoro modes), R3 (local conformal theory; E2 is conjectural and would be
only an ingredient), R4, R5, and every chiral or full specialisation. The
CA-75 Link (a) status moves only within (a2) (leg cuts, already in CA-80)
and (a3) (E1 as a finite response). (a1) and (a4) stay open.

## (c) Amendments other shards need (dated pointer form)

c1. **CA-86 Cor. 86.2** (`86_spacetime_trotter_dictionary.tex:93–110`).
*Amendment 2026-10-27 (H1 review):* "a closed X-loop evaluates to d_X" and
"isotopy holds for Ev_C" require oriented proper duality or κ_X = +1. For
pseudoreal X with raw unoriented cups v, v†, a W-shaped loop evaluates to
κ_X d_X (H1 NOTE (D4); `checks/review_holonomy.py` P1).
c2. **CA-86 Lemma 86.1 / Def. of history** (:72–92). *Pointer 2026-10-27:*
the exact, decorated version is H1-A (A2). With multiplicities a bare net's
coefficient is a sum of products.
c3. **CA-80** after Cor. 80.3 (:97–104). *Pointer 2026-10-27:* temporal RP
vs termwise net positivity is H1-D3 (fixed presentation). The Z_P display
(:63) ranges over decorated nets.
c4. **CA-75 Link (a)** (:115–138). *Pointer 2026-10-27:* finite P2 object
H1-A–C. (a2) is answered for leg cuts only (CA-80); (a3) gets E1. Nothing
new for (a1) or (a4).
c5. **CONVENTIONS (ak)** (`CONVENTIONS.md:1397–1430`). Replace "normalisation
NOT YET FIXED" for ν, ν† by a pointer to (ay).
c6. **worklog 023:37–44 and :54–58**, in the next worklog entry (frozen
shards are not edited). "SLE/CLE appears once" is wrong: CGS:527–532 and
:784–796, MorinDuchesnePearce2019 and VernierJacobsenSaleur2014:2525–2527
all bear on it. "The quantum dimensions as loop weights" holds only for
contractible loops under the physical trace (J_L). AFM-S:39–89 and :128–139
already state the W = A·eval_C geometric ensemble.
c7. **references/lattice-symmetry/SOURCES.md**: record the acquisition lead
Sheffield–Werner, Ann. Math. 176 (2012) 1827, arXiv:1006.2374 (CLE
Markovian characterisation; SG1), with the local pointer above. Acquire only
when Tobias authorises network use.

## (d) CONVENTIONS entries needed (lettered from (ay))

**(ay) Pointed tile dictionary and vertex normalisation (general C).**
Isometric vertices u^{ab}_{c,μ}; isotropic vertices V = (d_a d_b/d_c)^{1/4}u
(Penneys:528–547; specialises (aj)); raw cup V^{aā}_1, with V†V = d_a.
Tiles D^c_qp = g_q g_p s_q s_p†, g_p = (d_{a_i}d_{a_j}/d_c)^{1/4}; exact tile
weights w = [e^{th^c}]_qp/(g_q g_p). Keep the vacancy flag v distinct from
occupied unit copies (1, r), and never write the vacancy flag with the
raw-cup letter v without a declared type.

**(az) Trace and closure declaration.** Tr_H on H_L = ⊕_c Hom(c, O^L) equals
tr_C(J_L ·), with J_L = Σ_c d_c^{-1}P_c central. "Physical Gibbs" means
Tr_H. "Categorically traced" means tr_C (charge weights d_c). A
fixed-charge trace uses P_c/d_c. The rule "closed component = d_a" applies
only to contractible components of Ev_C.

**(ba) Loop-tile orientation, FS rule and path holonomy.** Unoriented raw
cup/cap calculus is allowed only for κ_X = +1. Otherwise use oriented
*proper* cups: both snakes are trivial, so for Vec_G^ω with X ⊇ g ⊕ g^{-1}
the ratio is θ_-/θ_+ = ω(g,g^{-1},g). Tile coefficients refer to these
cups. "Holonomy" of a presentation means the U(1) phase product of a cycle
in the path multigraph of all off-diagonal entries of the h_j, parallel
edges included. "Stoquastic up to gauge" means all holonomies are 1.

## (e) Next lemma

**Ordinary-trace positivity of the loop sector, for arbitrary C**
(REVIEW §7). Hypotheses: C unitary fusion; O = 1 ⊕ X with X closed under
duality; κ = +1 on every self-dual simple summand; h a nonnegative
combination of nonbranching geometric tiles with proper oriented cups. Claim:
for every L the fusion-path basis of ⊕_c Hom(c, O^L) admits a diagonal phase
gauge in which all exp(t h_j), t ≥ 0, are entrywise nonnegative, so the
physical Gibbs state is a probability law on worldline histories. Also
determine the J_L weight of time-wrapping components. Tags: any; L0 +
(ay)–(ba); finite; →R3 ingredient; pillars P2 and P1. The hypothesis is
sharp: κ = −1 is a forced obstruction (D-FS). Evidence: the pointed
instances in `checks/review_holonomy.py` (P2). Strategy: at fixed outer
charge the cup-cap block is rank one, so the content is the cross-bond
cocycle condition on the local phase gauges. Follow-up: the same question
with ν-vertex tiles.
