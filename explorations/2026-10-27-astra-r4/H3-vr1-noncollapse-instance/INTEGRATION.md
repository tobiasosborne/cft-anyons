# INTEGRATION: H3 (Opus review, 2026-10-27)

Pillar served: **P4** (the OAR limit). Overall grade: H3 as posed is
WEAKER-RESULT-PROVED; the corrected statements are PROOF-COMPLETE (see
REVIEW.md). Nothing here touches P1, P2 or P3, and no categorical cell moves.
The calibration is a check of the general contract, never its subject.

## (a) Statements safe to lift into a report shard

Proposed home: one new shard, **CA-103 "VR-1 non-collapse and a whole-carrier
graph-norm instance"**. CA-101 and CA-102 are taken by untracked files, so
confirm the number at landing. The full analytic proof of item 7 lives in
`checks/graph_certificate.md` and must be lifted into the shard, not cited as a
check.

| # | Statement (tags: S; L + decl.; R) | Grade |
|---|---|---|
| 1 | Thm A: under VR-1 A1-A4, A5 holds iff some T_n (n≠0) is nonzero. A5 forces every T_n (n≠0) nonzero and T_0 non-scalar. The finite certificate is \|q_a(v,n)\| > d_{a,n}, with d_{a,n} = sum_{j>=a} e_{j,n,0}. (any; category-free; R2 nontrivial) | derived |
| 2 | Cor A.1: the inverse weight K^{-1} may be replaced by K^{-σ} for integer σ>=1 | derived |
| 3 | Prop A.2: CA-95.5 and CA-100.5 satisfy A1-A4 but fail A5 after one refinement / at every scale (any C via unit multiplicities; L0) | negative |
| 4 | Thm A.3 + Cor A.4: with normalized L_n = T_n + δ_{n0}(c*-c)/24, adjoint pairing and (PE) on D, we get c* >= 0, and c* = 0 forces all modes to vanish. So A5 + (PE) gives c* > 0. **No positivity of L_0 is used.** A lower-bounded L_0 with a total eigenvector span in D gives (PE). (any; category-free) | derived |
| 5 | c* > 0 from positivity of the L_0 form alone, on VR-1's D | conjectural (open) |
| 6 | Neg A.5: raw T_0 >= 0 does not give c > 0 for the linear ledger. The shifted unitary highest-weight target (a>1, h>a/24) has c* = a and c = a-24h < 0, with A1-A5 holding through the CA-100.10 cutoffs. (supplied target; L4) | negative |
| 7 | Lemma B / Thm B.1: entrywise row/column bounds of order Q, ε^α Q^{1+α} and ε^β Q^{2+β}, with bounded energy shift and exact Q-transport, give VR-1 for K = Q^p with p >= max(1+α, 1+β/2). There is no dimension or multiplicity factor. (any; category-free + declared bases/energies) | derived |
| 8 | Lemma Q: a quadratic CAR shift with \|d(r)\| <= H(1+\|r\|)^q satisfies \|\|Q^t D Q^{-t-q}\|\| <= H F(q,k)(1+\|k\|)^{t+q} on the full Fock carrier, spectators included (any; category-free CAR) | derived |
| 9 | Calibration: for source-modified no-wrap modes, sea normal ordering, sharp-momentum CAR refinement and E = sum_exc\|r\|, A1-A4 hold on the whole Fock carrier for K = (1+E)^p **iff p > 1**. A3 fails at p = 1 (UV ratio tends to 2(√2-1)/π) and A2 fails for p < 1. The smallest integer is p = 2. The A3 rate ε^{min(p-1,2)} is sharp. (AP circle, one family; category-free) | derived (calibration) |
| 10 | Calibration A5: v = (Ω+w)/√2 with w ∝ T_{-2}Ω at M_0 = 4 gives q_r >= κ = 1/(2√2π) at every scale, so c = c* = 1 | derived (calibration) |
| 11 | Thm C: a cyclic realization satisfying (C.1) for the same states is unitarily the WT-1 GNS tower | derived |
| 12 | Same system: the WS-1 limiting rows P_∞ = (I - sign(r)σ_y)/2 split, in the fixed basis U = (e_+, e_-), as S_- ⊕ S_+. The source (145) modes Q(A_n ⊗ p_+), and their reflected partner, act in that GNS representation with zero mixed brackets. The free-fermion calibration therefore reaches **R1 and R2 on one system**, with R0 unital but spatially nonlocal. (periodic AP; paired full; category-free) | derived (calibration) |

Not liftable as stated: "independent skeptical audits" (`NOTE.md:398`). The
in-session review files are not independent reviews.

## (b) CA-88 grid cells: which move and which do not

**Move:**
- **Def. 88.3, R2 row, "Certificate in repo"** (`88_...tex:105`). Add: "VR-1 +
  A5 first instance: free-fermion calibration (CA-103/H3), category-free,
  sharp-momentum nonlocal refinement, on WS-1's GNS system [derived]".
- **Grid row "WT-1, VR-1 (CA-81)"** (`:137`). Comment becomes: "category-free
  contracts; must share one system; non-collapse clause A5 (H3 Thm A); one
  calibration instance on a common system (H3)".
- **New grid row, recommended:** "Fermion calibration (WS-1 + H3)".
  - S: periodic AP; one family, or the paired full extension.
  - L: none (category-free).
  - R: R1 + R2; R0 unital but nonlocal; no R3.
  - Comment: "R2 by VR-1+A5 alongside R2 by OS Thm 4.11".
  - This is the honest form of "the free-fermion row gains R2 by VR-1".
    **Yes, it gains it**, but the row does not yet exist in CA-88 and must be
    created.

**Do not move:**
- Every categorical row: CA-71–74, 68, 76, 77, 78, 79, 89, 90, 91, 92, 93,
  94, 95 and LC-1–LC-13.
- R3, R4 and R5 everywhere.
- CA-82–85.
- The R1 row (WS-1 predates H3).
- Rem. 88.4's requirement is now *met* for the calibration, but no
  categorical system carries both an R1 and an R2 certificate.

## (c) Amendments other shards need (dated pointer form)

- **CA-81** (`81_...tex:56-75`). *Amendment (2026-10-27, H3/CA-103):* VR-1
  gains the non-collapse clause A5 (Thm A, with finite certificate
  |q_a| > d_{a,n}). A1-A4 alone admit total collapse (95.5, 100.5). Its first
  instance is the sharp-momentum fermion calibration on WS-1's system, with
  K = (1+E)^p, p > 1.
- **CA-81 numerical scope** (`:77-81`). *Amendment (2026-10-27):* the
  compatible chiral sea is now used as the WT-1 *limit* of the actual Dirac
  rows (WS-1), not substituted for them. This is the common system of H3.
- **CA-79** "First attackable lemma" (`79_...tex:250-256`). *Amendment
  (2026-10-27):* answered for the calibration by an entrywise certificate
  (Lemma B/Q) rather than P0–P3 shells. The control is K = (1+E)^p for any
  p > 1; the "γ≈3" suggestion is superseded, and p = 1 fails A3.
- **CA-88 D2-C first lemma** (`88_...tex:185-186`, "with K = 1+E_N").
  *Amendment (2026-10-27):* in the calibration tower K = 1+E fails A3 (H3).
  Test Lemma 89.L with K = (1+E)^2.
- **CA-95** §What This Does Not Claim (`95_...tex:224-226`). *Amendment
  (2026-10-27):* a nontrivial common-system VR-1 certificate with all-bracket
  fermion estimates now exists for the calibration (CA-103). 95.8's
  K = 1+Q is not a VR-1 control, because A3 fails at p = 1. Standard local
  KS and categorical items remain unclaimed.
- **CA-75** item "Generator convergence" (`75_...tex:198-200`, "[C] VR-1 (no
  instance)"). *Amendment (2026-10-27):* one category-free calibration
  instance (CA-103); no categorical instance.
- **worklog 023** §1, R2 row and §4.3 ("VR-1 has no instance anywhere").
  Supersede this in the next worklog entry. Do not edit the frozen chunk.
- **`cft_machine/research/virasoro_routes.md`** after `:149`. Add A5 and
  Thm A as a corollary. Record that "c > 0" must name its ledger.
- **`cft_machine/reviews/virasoro_referee.md:155-161`.** Pointer: the
  fixed-core boundary is answered for this calibration by H3 Lemma Q with
  p > 1.

## (d) CONVENTIONS entries needed ((ax) is taken)

- **(ay) Non-collapse witness.**
  - q_r(v,n) = <v_r, T_{r,n} K_r^{-1} v_r>, with v_r = J_{r<-a}v, v a unit
    vector in H_a, n ≠ 0.
  - d_{r,n} = sum_{j>=r} e_{j,n,0}.
  - A5 means there exist κ > 0 and r_0 with |q_r| >= κ for all r >= r_0.
  - Inner product linear in the second slot, as in (al).
- **(az) Normalized modes and the charge statement.**
  - L_n = T_n + δ_{n0}(c*-c)/24, so the bracket is (m-n)L_{m+n} +
    (c*/12)(m³-m)δ.
  - "c > 0" must name the ledger. The invariant is c*.
  - (PE): a Hilbert-total V_fin ⊂ D with L_n v = 0 for all large n.
- **(ba) Fermion VR-1 calibration control and refinement.**
  - Control: E = sum_exc|r| (the linear excitation energy, never the sine
    zero mode). K = (1+E)^p; the default is p = 2, and p = 1 is forbidden.
  - The refinement is the canonical GNS map of the sharp-momentum CAR map.
    New labels are inserted as sea, i.e. excitation vacuum.
  - Spinor basis U = (e_+, e_-) with e_± = (1, ±i)/√2. e_+ carries S_- and
    the modes A_n; e_- carries S_+ and F A_n F.
  - Spectators are included through E_tot.
  - Graph norm: ||v||_{N,s} = ||K_N^s v||, as in VR-1.
- **(bb) Entrywise certificate notation** (Lemma B).
  - Declared orthonormal bases with Q = 1+e.
  - Energy-shift bound h; row and column constants u, v at order q.
  - The weighted norm is ||Q_out^t D Q_in^{-t-d}||, with d >= q.

## (e) The next lemma

**VR-1 with summable graph-norm distortion** (category-free, P4). Replace
exact K-intertwining by
sup_s max(||K_{N+1}^s J_N K_N^{-s}||, ||K_N^{s} J_N^* K_{N+1}^{-s}||) <= 1 + δ_N
with sum δ_N < ∞, and prove that A1'-A4 + A5 still give the limiting
representation and non-collapse. This extension is named and left unproved at
`virasoro_routes.md:167-171`.
- It is the gate for moving the instance from the nonlocal sharp-momentum
  tower to a local (wavelet) fermion tower.
- It is also the gate for any categorical local unital lift (CA-90/96), where
  no physical control is transported exactly.
- Runner-up: c* > 0 from L_0 positivity alone (H3 open problem 1).
