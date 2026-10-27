# Worklog chunk 023 — 2026-10-27: status overview of all results

## Context

- Tobias (2026-10-27): after landing the recovered round-3 shards, "obtain a
  status overview of results ... explain where we are and assess where we can
  go." Eight read-only audits (Sonnet/Opus subagents, grades carried as
  written, `file:line` on every row) are banked in
  `reviews/2026-10-27_status_audit/`; this chunk is the synthesis. The
  synthesising session read CA-75, CA-81, CA-88, CA-90, CA-93, CA-94, CA-97
  and the audits' sharpest claims directly (stale CA-88 lines, G1.3, G6-B,
  the scan's negative speeds, the open/periodic split) before writing.
- Layer tags as in CONVENTIONS (aq): setting (open/ch, periodic/full, any);
  data L0 fusion, L1 braided, L2 modular, L3 enriched, L4 declared target;
  rung R0 tower (R0^c corner, R0^u unital), R1 limit state, R2 Virasoro
  modes, R3 local conformal theory, R4 faithful, R5 functorial.

## 1. Where we stand on the ladder (general unitary fusion C, pointed O)

| Rung | Reached for general C? | By what | Instances / caveats |
|---|---|---|---|
| R0^c | yes (open; L0) | CA-68/71/72: placement isometries compose exactly, GNS descent with defect 2(1-sqrt(omega(P))) | Julia checks are Fibonacci-only instances of general claims |
| R0^u | yes (open; L0 + relative half-braiding, so any braided C) | CA-90 Thm 90.1: alpha_L = Ad B_L(. x 1), unital, injective, support [2j-1,2k-1], exact occupation degree | bare L0: only the CA-96 families (noncentral Vec_G sites, Vec_A^omega for abelian p-groups); general C open (96.10); periodic seam open (90:242) |
| R1 | no | WT-1 (CA-81) is a category-free contract; drift bound 76.1 | only trivial states: vacuum product (90.V), spherical trace (97.5). No non-product state family with summable drift on any categorical tower |
| R2 | no | VR-1 (CA-81) is a category-free contract; Ward-to-KS transfer 89.1/95 and ledger balance 100.3-100.4 are conditional on it | **VR-1 has no instance anywhere**, not even the free fermion (fixed-core bounds only; D §4, CA-79:268, CA-95:224). The only "A1-A4 satisfied" chains have zero limiting modes (95.5, 100.5) or a declared target with no local tower (100.10) |
| R3 | no | ingredients only: temporal RP 80.2-80.5 (derived), spatial RP 92.3/92.5 and 98.7 (conditional on a seam pairing and RH / G1-G3) | no categorical instance; whole-history RP unverified for any (C,O,h) |
| R4 | no | 93.8: fully faithful endpoint functor + index bound => braided equivalence, **given R3** | only Ising (CA-82) at L4, by cited net theorems; it reads no F, R and imports its fidelity. 97.9-97.10: the bare AF tower provably forgets F and [O] |
| R5 | no | none | D6-C clause only |

Rounds 2 and 3 (12 shards, 12 Astra notes, 12 reviews) moved exactly one
cell: R0^u. Everything else landed as an ingredient, a conditional
implication, a finite lemma, an off-ladder result (CA-94/99, z=2) or a
negative. That is the honest headline.

## 2. The asset list (proved for general C unless marked)

- **Carrier and tower (L0).** Anyonic word algebra A_L = End_C(O^L), variable-N
  Fock carrier, Bratteli rule (CA-65/66); exact placement composition
  V_psi V_phi = V_{psi phi} (71); GNS descent Thm 72.3; residual transport (73);
  dual-pair blocking lemma 87.1 and its generalisation 77.5 (1+X = Y x Ybar
  makes dilution a blocked dense chain); configuration Fock carrier 77.8.
- **Lifts.** 90.0/90.1 (half-braiding => local unital dyadic lift, WT-1 A1);
  96: transport on a tensor power O^b gives lifts with slack 2b-1 on the
  original algebras; 97.11-97.13: fixed-H shuffles descend to an endomorphism
  delta with delta_* = id, and the named compression marks recover H.
- **Contracts (category-free).** WT-1 (summable drift => unique limit state
  with tail bound); VR-1 (A1-A4 => limiting modes and Virasoro bracket on a
  common domain, c and c* separate); VR-2 (vacuum-null is not operator-null);
  the same-system clause (Remark 88.4: separately certified R1 and R2 do not
  compose).
- **Ward to Koo-Saleur (full; category-free).** 89.1: W2 + A2 + coordinate-
  resolved matching => VR-1 A3/A4 with c* = 12 kappa_3 [cond.]; 95.1: uniform
  probe-form two-loss estimate with explicit constants [derived]; 100.3:
  any nonzero common standard-KS VR-1 system has c_L* = c_R* without parity;
  100.4: ZC <=> all mixed brackets vanish <=> equal ledgers; 100.1 explicit
  A3 tails.
- **Euclidean side.** 80: exact sewing along tile legs, temporal RP, Ward
  product rule [derived]; 92.2/92.3: seam pairing exists iff O x Obar and
  Obar x O have equal multiplicities; bent kernel decides one-tile spatial RP
  blockwise [cond. on s]; 98.1: canonical seam s_can from braiding and
  spherical duals at L1 [derived]; 98.8 finite OS normalisation.
- **Fidelity.** 93.2 normal limit expectation (no commutants, no CP)
  [derived]; 93.8 two-sided fidelity implication at L0+L4 / L1+L4 [derived
  implication, no instance]; 93.10: the diagonal LR extension has trivial
  DHR category, Z(C) lives in the doubled net; 80.8: fusion operators never
  reach R4 (scalar falsifier).
- **Information at R0.** 97.1-97.8: the trailing AF limit is classified by its
  rooted scaled ordered K_0 [derived]; 97.9-97.10: it forgets the fusion
  ring, [O] and the associator even with canonical trace and stages.
- **Collision dynamics (off-ladder, z=2).** 94.6: the tuned D1 family has a
  projected strong-resolvent limit on the whole Fock carrier [derived]; 99.1:
  complete signed scalar-contact classification on N<=2 (Robin / Dirichlet)
  [derived]; 94.11: fusion rules bound the attainable range-r number change.
- **Instances that reach a rung by citation (L4).** Ising compiler CA-82
  (R4); GKO cosets CA-83-85 (R2 on the ambient space, nonlocal R3); free
  fermion benchmark (R2 via Osborne-Stottmeister Thm 4.11; nontrivial R1 via
  WS-1 Wilson rows, the only nontrivial WT-1 instance in the repo).

## 3. Load-bearing negatives (each closes a route)

- 90.2(b): one-gap lifts of CA-90's support pattern need [O] central in
  K(<O>); 96.3/96.7: centrality is neither necessary nor sufficient.
- 94.1: no fixed pure-hop density has a full-Fock limit after any scalar
  subtraction; tuning is necessary (so D1-C's "universal" clause is dead).
- 97.9-97.10: no decoder from the bare AF limit (even with trace and stages)
  can recover F; "F first enters at R1" is false in both directions.
- 100.5: current-logarithm identification fails for every logarithm branch;
  100.6: formal Jacobi/dagger/parity/grading do not force X_0 = 0.
- 95.5 (= 89.3): a local KS chain can satisfy A1-A4 with all limiting modes
  zero; 89.7: A3 for arbitrary gate-intertwining refinements is false when
  c* != 0.
- 98.9: two positive directional transfers need not be unitarily conjugate;
  92: F o dagger is antilinear and cannot be the crossing.
- 99: the attractive no-limit branch of F5 is refuted; negative total contact
  has no common Fock lower bound.
- 91.4: an antiunitary parity constrains nothing; only complex-linear parity
  forces c_L = c_R.
- CA-60: 0/99 qubit nearest-neighbour densities pass the exact first-moment
  gates (critical TFIM, XXZ, Heisenberg fail the boost witness; all three
  sentinel squared speeds are negative, "sign open", worklog 011:123).
- LC-6: the pointed algebra 1+s on the semion has no associative product;
  LC-12 §5 / 79.9 / 80.12: for c > 1 the vacuum carrier is not a finite sum
  of Virasoro families.
- Unreviewed but explicit (G1.3, G6-B): dihedral Vec_G with O = 1+a+b+ab has
  local lifts but no transportable tensor power (refutes Target 96.10 as
  posed); translating the charge origin in abelian Hilb(G) preserves the
  interval/dilation record but changes the input (refutes the positive form
  of Target 97.16). Both need a review before they are lifted.

## 4. Structural diagnosis

1. **The two halves never meet.** Every tower/lift result (CA-68..74, 90, 96,
   97) is on an open chain. Every Koo-Saleur, zero-mode and Ward result
   (CA-89, 91, 95, 100, LC-4) is on a periodic chain. The periodic seam for
   the lift is open (90:15, 90:242, 96:250). Remark 88.4 says R1 and R2 only
   count on one system, so today no system carries both a tower and modes.
2. **The category never enters the dynamics.** No shard selects
   h in End_C(O x O) from categorical data: CA-78 gives rejection tests only,
   VR-1 and the whole R2 thread are category-free, CA-82 reads no F/R, the
   cosets are L4. F and R enter only through the lift (half-braiding) and the
   seams (92, 98). An "algorithm from C" needs a selection principle; none
   exists, and at L0 the problem is category-blind (Vec admits every qudit
   chain, D2 REVIEW:79).
3. **R2 has no genuine instance.** VR-1 is unverified for any chain. The
   fermion benchmark reaches R2 by Osborne-Stottmeister, not by VR-1. The
   three chains satisfying A1-A4 are degenerate (§1). A non-collapse
   condition is missing from the contract itself.
4. **Fidelity cannot be recovered; it must be carried.** 97.9-97.10 and G6-B
   show the algebraic record of the tower (even with intervals and dilation)
   forgets the input. The pointed tensor marks of CA-77/97.13 do retain H.
   So the pipeline must transport categorical marks along the tower as
   declared structure, and fidelity at R4 is an identification of carried
   marks with limit sectors (93.8), never a reconstruction from the limit.
5. **The sewing equations have continuum unknowns.** LC-1..5, 9, 10 are a
   correct general formulation, but the unknowns (graded carriers V_i, a
   vertex algebra with conformal vector, analytic blocks) are the chiral CFT
   itself; there is no finite presentation to attack. The genuine cohomology
   statements are for frozen fragments, and the binary H^3 vanishes on every
   separable algebra (LC-7 Prop. 3). The four-port arc then drifted into
   semion/Fibonacci instances; its one positive solution uses the semion's
   degenerate c = 1 null (E §4).
6. **History.** Four restarts of the same north star (worklog 020:62-68);
   each sank into a model. The May-July blocks CA-00..64 are infrastructure
   and calibrations with no downstream consumer except CA-02/03/09 (carrier),
   CA-14/15 (source boundary) and CA-63/64 (residual semantics reused by 73).

## 5. What each approach uniquely brings (the integration view)

- Variable-N tower: the only general-C refinement maps with exact
  composition and quantified GNS descent; now unital and local (90/96).
- cft_machine: the only quantitative acceptance contracts (WT-1, VR-1) and
  the only end-to-end calibrations (fermion, Ising, cosets); exact core
  stabilisation and scalar unitalisation (84, generalised by 76.2).
- Spacetime dictionary (86): the only category-native dynamics: the history
  sum is Ev_C(Gamma) times plaquette weights for any C (Lemma 86.1); the
  brick-wall Trotter rectangle is a finite categorical cell.
- Reconstruction (LC): the only statement of what "the stress generates the
  coordinate changes" means as equations (C4-C7, LC-W propagation law).
- Rounds 2-3: the only proofs that transfer Ward data to VR-1 (89/95), the
  only chirality theorem (100), the only RP kernels (92/98), the only
  fidelity theorem (93.8) and the only information-theoretic bound (97).
- CA-75 Link (a) (history sum as lattice avatar of the cell equations) and
  Link (b3) (summable drift from a dressed family) are still the two
  unwritten joins. Neither round attacked them directly.

## 6. Where we can go (ranked; tags setting; data; rung; cost)

1. **Periodic seam for the CA-90/96 lift** (periodic; L0+H; R0^u). Closes
   diagnosis 1 so one system can carry tower and KS modes. Finite categorical
   algebra, Lamport-provable, laptop-free. Prerequisite for every R1/R2 claim
   on a categorical tower. Likely needs the 92.2 multiplicity condition or the
   98.1 canonical seam, which is why it belongs at L1 first.
2. **Lattice cell equations at finite cutoff** (full; L0 tile grammar; ->R2).
   CA-75 Link (a1)-(a3) made concrete: cells = CA-86 Trotter rectangles in
   End_C(O^l), cuts typed by the (al) cut spaces, sewing by the 92/98 seams,
   C4 residual = anisotropy derivative minus the standard KS density. Then
   C2-C4 are finite residual equations at each N for arbitrary C; LC-W is
   their propagation law and their decay is exactly the W2/A4 estimate that
   89/95 need. This is also the only candidate for a **selection principle**
   (diagnosis 2): demand the leading-order lattice Ward residual vanish
   (isotropy of the history sum, Cor. 86.2) and read off conditions on h and
   the weights. Joins reconstruction, 86, 80, 92/98, 89/95 in one shard.
3. **A first genuine VR-1 instance** (periodic; category-free; R2). Build the
   graph-norm certificate for the source-modified free-fermion modes on the
   same system as the WS-1 Wilson rows (named by CA-79, CA-89, audits D, F).
   Cheap, laptop-scale, and it tests whether the contract is satisfiable at
   all (audit D's unchecked observation: K = 1+E may fail A3 near the window
   edge; K = (1+E)^3 may absorb it). Add a non-collapse clause to VR-1.
4. **Non-trivial R1 on the lift tower** (open then periodic; L0+H + declared
   h; R1). Summable vacuum residual eps_n/Delta_{n+1} (Thm 76.6) for one
   dressed family W_n = U_n V_n built from the 90/96 lifts on a blocked dense
   TL-type chain (audit C's pick, G's pick). Needs 1 and a chosen h.
5. **Review G1 and G6, launch G2** (any/open; L0; R0). G1.3 and G6-B refute
   96.10 and the positive 97.16 if they survive; G2 (coarse-vector zero mode,
   Target 100.12) is the cheapest open R2 lemma and has a written brief.
6. **Decide the two routes explicitly.** Top-down (L4 declared target, prove
   a lattice realises it: 82-85) is provable but imports fidelity. Bottom-up
   (L0 tower + certificates) is general but has no instance above R0. The
   programme's realistic provable target for rational CFT is the coset/free-
   field family at L4 with categorical marks carried (diagnosis 4); a bare
   L0-to-R4 algorithm would have to solve the realisation problem (88:
   Bischoff:364-373) and nothing in the repo suggests a mechanism. State this
   as the current conjecture ladder in CA-88's successor.

Not recommended: more four-port instances (E), more qubit/Gaussian scans
(B), more Fibonacci-only Julia (C) until a general statement needs them.

## 7. Housekeeping surfaced by the audits

- Fixed now: CA-88:117-118 and :263 still called Target 90.T open after
  round 3 superseded it (now points to 96.10).
- Open (cheap): CA-71:150-178 "forest image / Thompson V action" refuted by
  CA-77 (b),(c), no inline erratum; CA-65:240 stray Markdown fence; CA-65/66
  say the spherical structure is unsourced though (r) closed it; CA-66 "no
  Julia test" though runtests.jl:1095 exists; CA-64 says its bundle is
  unregistered; CA-86 Prop. 86.4 cites "worklog 016" (now 019) and has no
  committed script; CA-87 bundle has no README/hashes and exceeded the L=4
  cap without recorded sign-off; CA-100 cites no checks (F2 bundle has
  check_f2.py with mutations); 99.13 is an open target graded "conditional";
  CA-95..100 are not rows in the CA-88 grid table; CA-88 uses "open" as a
  setting tag outside the (aq) vocabulary; 88:154 tags LC-2/5 as L2-L3 though
  they are category-free; amendment pointers not appended into CA-77/90/91/
  92/94; round-3 conventions unregistered ((ax)); AGENTS.md:310 memory path.
- Open (structural): exploration checks of rounds 1-3 not ported to
  `scripts/` with run bundles; SURVEY.md and references.bib are stale
  (no Koo-Saleur, Jones, Zini-Wang, Haegeman entries); CA-88 at the line cap.

## Acceptance

- `make check-report-shards`: 101 shards; `make report` builds after the
  CA-88 fix. Audit files under `reviews/2026-10-27_status_audit/`.

## Pointers

- Audits A-H (see bundle README); CA-75, CA-81, CA-88 (grid), CA-90, CA-93,
  CA-94, CA-96, CA-97, CA-100; worklog 020:62-68 (restarts), 022 (round 3).
