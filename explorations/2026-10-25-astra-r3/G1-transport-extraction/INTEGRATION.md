# G1 integration package: ancilla transport and the refutation of Target 96.10

2026-10-27. Review grade: **COUNTEREXAMPLE** to Conjecture G1 as posed and to
CA-96 Target 96.10 as stated (REVIEW.md, verdict section). The positive general
theorem (ancilla transport) and the finite extraction statements are accepted as
derived. This file only proposes integration; no report, CONVENTIONS, worklog or
index file was changed. Pillar: **P1** (the unital refinement of the
vacancy-carrying, indefinite-number tower), feeding **P4** (WT-1 A1 input to OAR).

## (a) Statements safe to lift, with grades

Use one short shard (proposed: after CA-100, ID to be assigned at integration).
Put the general ancilla theorem first and the dihedral family in a "negative" block.
Keep the S_3 and Vec_G instances in the examples table. Do not use `r` for a group
element; write the rotation as `ρ_0` or `c`, and keep `r` for the slack.

| Statement (source) | Grade | Tags and boundary |
|---|---|---|
| **Ancilla transport theorem.** For pointed (K,κ) with pointed unitary relative transport `t_Y:Y⊗K→K⊗Y` on full D=<O> and pointed unitary `u:O⊗K→O⊗O`, `u(1⊗κ)=1⊗η`: all-L unital injective *-lifts on the original A_L, exact V_L, `α_L(A_[j,k])⊂A_[2j-1,2k]`, dyadic composites, `Λ_{c,d}(L)=dim Hom(d,c⊗K^L)`. NOTE:37-89; REVIEW C1. | **derived** | any (open ordered chain); L0 + declared (K,κ,t,u); R0^u. CA-90 is K=O, u=1. A theorem under supplied data; K∈D is automatic from O⊗K≅O⊗O. |
| **Inclusion-matrix gauge invariant.** Λ_α(L) is invariant under V-compatible output unitary gauge (and under *-automorphisms up to block relabelling). F1.1b lifts have Λ = fusion by O^L, ancilla lifts fusion by K^L. Equal Λ ⇔ global conjugacy by U∈A_{2L} with UV_L=V_L. NOTE:130-161, 295-327; REVIEW C2. | **derived** | any; L0; finite →R0^u. Global only: no support bound on U. |
| **Gauge classification fails** (Vec_G, O=R, K=N·1: Λ=N^Lδ vs N^{L-1}). NOTE:91-169. | **negative** (instance of the invariant above) | any; bare L0, untwisted Vec_G, |G|>1; R0^u. Not a transport no-go: R itself transports. |
| **No transportable tensor power, yet local lifts.** Untwisted Vec_{D_m}, m≥3, O=1⊕a⊕b⊕ab, K=1⊕1⊕c⊕c^{-1} (c=ab): slack-1 lifts for all L, while no O^n carries any relative half-braiding on <O>=C since [O]^n is never central. NOTE:171-287; REVIEW C3. | **negative** to Target 96.10 and G1(a)-(c); **derived** R0^u witness | any; bare L0 within the dihedral family; R0^u reached. Lifts violate (am) occupation degree; they satisfy trailing descent in finite checks only. |
| Restriction identity `Σ_c N_ij^c Λ_{c,d} = T^α_{(ij),d}`. Locality does not supply 90.2(b)'s unchanged-side T. NOTE:329-347. | **derived** (identity); remark-level GAP in the "witnessed" sentence | any; L0; finite →R0^u. |
| Fixed-b transport equations (90.5 for P=O^b) and invariance of min b under pointed unitary tensor equivalence and choice of point. NOTE:361-395. | **derived** | any; L0 + finite associator/dagger data; finite →R0^u. min b = ∞ is compatible with lifts. No decision procedure for "some b" is claimed. |
| Lengthwise mix-and-match: (a) relates no two lengths, so no single datum can classify all α_L. REVIEW R1. | **derived** remark (negative to single-datum classification) | any; L0; →R0^u. Any future extraction target must add uniformity in L. |
| S_3 carrier O=1⊕g⊕h: no b admits pointed transportable K with `O^b⊗K≅O^{2b}`, not even in K(C) (`6γ=3^b-(-1)^b`, never divisible by 3). REVIEW R2. | **derived** (instance); **negative** to all repository constructions for this carrier | any; bare L0, Vec_{S_3}; →R0^u. R0^u for this carrier remains **open**. |
| Trailing descent of the dihedral lifts (L=1,2; m=3,4). REVIEW R3. | **finite check only** | Do not state as derived until the 97.11-style proof is written. |

Not liftable: NOTE:436-443 (stale "Open problems" text and the empty examples
table). The integrator writes the examples table from REVIEW's checks, as instances.

Core text for the shard:

> **Theorem (ancilla transport) [derived; any; L0+(K,κ,t,u); R0^u].** Let C be
> unitary fusion, (O,η) pointed, D=<O> full, and let (K,κ) be pointed with pointed
> unitary transport t on D and a pointed unitary u:O⊗K→O⊗O, u(1⊗κ)=1⊗η. Then
> `α_L(a)=T_L(a⊗1_{K^L})T_L^†`, `T_L=u^{⊗L}B_L^K`, is a unital injective
> *-homomorphism A_L→A_{2L} with α_L(a)V_L=V_La and α_L(A_[j,k])⊂A_[2j-1,2k].
>
> **Negative (Target 96.10) [negative; any; bare L0, dihedral family; R0^u witness].**
> In Vec_{D_m}, m≥3, O=1⊕a⊕b⊕ab satisfies CA-96 (a) with slack 1. No tensor power of
> O admits a relative half-braiding on <O>.

## (b) CA-88 grid cells that move and that do not

Locators: `report/sections/88_layered_targets.tex`.

| Cell / locator | Change licensed |
|---|---|
| Definition 88.3, R0^u row :103 ("Min. data: L0+half-braiding on <O> (so L1)") | **Correct the minimal-data entry.** A half-braiding on O, or on any O^b, is sufficient, not minimal. Replace with "L0 + transport datum (on O, on O^b (CA-96), or on an ancilla K with O⊗K≅O⊗O (new)); necessity refuted (new shard)". Add the ancilla theorem as a derived certificate. |
| (any; bare L0; R0^u), prose :117-118 | "needs only a relative half-braiding on <O>" becomes a sufficient condition. Add the dihedral family as a derived bare-L0 witness with **no** power transport. General existence stays **open**: not characterised, universal or obstructed. Replace "(96.10)" by the new target. |
| :245-246 round-3 verdict line, :263 "(Target 96.10; 90.T superseded)" | Pointer: 96.10 refuted (G1, COUNTEREXAMPLE); new target below. |
| (any; L0+declared transport; R0^u), CA-90 row :149 | Unchanged rung. The certificate broadens by the ancilla datum. |
| (any; L1; R0^u) | Unchanged: CA-90's r=0 stands. |
| R0^c (:102), R1 (:104), R2-R5 (:105-108), full/periodic (:155) | Unchanged. No state, mode, seam, conformal or fidelity content. |
| D1-C occupation-compatible target (:167-176) | Unchanged and still open. The dihedral lifts violate the (am) degree, so they say nothing about it. |

Ranked by pillar, not by cells: the substantive gain is for P1. Refinement of the
vacancy tower is strictly more flexible than transport of the site object.

## (c) Amendments other shards need (dated pointer form)

- `report/sections/96_blocked_dyadic_lifts.tex:11-12` status line:
  **"Amendment (2026-10-27, G1): 96.10 is refuted (negative); see <new shard>."**
- CA-96 `:248` ("necessity of finite-power transport ... remain conjectural/open"):
  **"Amendment (2026-10-27, G1): necessity of finite-power transport is false.
  Vec_{D_m}, O=1⊕a⊕b⊕ab, has slack-1 lifts and no transportable power
  (<new shard>). Classification of all local lifts stays open; a single-datum
  classification is impossible without a uniformity-in-L hypothesis."**
- CA-96 `:253` (S_3 carrier undecided): **"Amendment (2026-10-27): still undecided.
  No blocked or ancilla transport datum exists for O=1⊕g⊕h at any b, even in K(C)
  (<new shard>, G1 REVIEW R2), so every repository construction is excluded."**
- CA-96 `:268-275`, Target 96.10. Mark it **[refuted, 2026-10-27]**, keep its text, and
  add: **"Answered negatively by G1.3 (<new shard>); exactly (a) as stated, no
  added hypothesis. Replaced by Target <new>.N (blocked-ancilla extraction under
  uniformity in L)."** The restated target is given in (e).
- `report/sections/90_local_unital_lift.tex:210-211` (Boundary) and `:245-250` (90.T):
  **"Amendment (2026-10-27): local dyadic lifts exist beyond transport of any
  O^b; ancilla transport suffices (<new shard>). Arbitrary-lift existence remains
  open at L0."**
- `report/sections/97_what_the_tower_remembers.tex:213` ("recovers supplied H, not H
  from arbitrary local lifts"): **"Amendment (2026-10-27): sharp. For the dihedral
  ancilla lifts of <new shard> no H on any O^b exists. The mark formula
  j^†α_2(h)i returns a non-unitary rank-8 endomorphism of O⊗O (m=3; G1
  `checks/review_g1_independent_output.txt`)."**
- `report/sections/88_layered_targets.tex:103,117-118,245-246,263`: as in (b).
- `report/sections/76_corner_to_wilson_bridge.tex:145-149` and
  `75_integration_map.tex:149-155` (Link (b1)): optional pointer, **"local unital
  typing also holds with an ancilla transport datum (<new shard>); Link (b3) and
  the state conditions of 76.12 stay open."**
- Worklog: record the vacuous author mutation and its replacement (REVIEW, evidence
  audit) as a gotcha: a mutation that relabels a point to another fixed vector is
  not a mutation.

No amendment to CA-91..CA-95, CA-98..CA-100.

## (d) CONVENTIONS entries needed

(ax) is taken. It declares round-3 notation shard-scoped and asks registrations to
be lettered sequentially from (ay), resolving clashes. Proposed:

**(ay) Ancilla transport datum (2026-10-27).** *Scope:* the new shard and any later
lift statement. *Choice:* an ancilla datum is (K,κ,t,u). Here κ:1→K is an isometry;
`t_Y:Y⊗K→K⊗Y` for **every Y in full D=<O>** satisfies (H) of 90.H with point κ,
oriented as (as). u:O⊗K→O⊗O is a unitary morphism with u(1_O⊗κ)=1_O⊗η. New
strand K_i is inserted after old site i and crosses only the old suffix
(K strands never cross each other). Output support for an old interval [j,k] is
[2j-1,2k] (slack 1, membership per (as)). The blocked variant replaces O by O^b in u's
source and inserts after each b-block, as in CA-96. *Known clash:* CA-96's P=O^b is the
special case K=O^b. The F1/F6 SHARD_META proposals reuse `t`, `rho`, `r`. Here `r`
is **only** the slack, never a group element.

**(az) Inclusion-matrix convention for lifts (2026-10-27).** Λ_{c,d}(L) = number of
copies of input simple block c of A_L inside output block d of A_{2L} under α_L
(rows = input, as in 90.2(b) and 96.4). "Gauge" means conjugation by a unitary of
A_{2L} fixing V_L. Without a stated support bound it is global. Λ is the invariant.

If the deferred CA-95..CA-100 registrations under (ax) are lettered first, take the
next two free letters instead and update this file's pointers.

## (e) The next lemma

**Target (blocked-ancilla extraction under uniformity) [conjectural; any, open;
L0; →R0^u].** Let C be unitary fusion, (O,η) pointed, D=<O> full. Assume CA-96 (a)
together with **one** uniformity hypothesis in L: a fixed b with
`α_{L+b}(a⊗1_{W_b})=α_L(a)⊗1_{W_{2b}}` for all L, a, the 97.11 form. Prove or refute
the following. There exist b'≥1, a pointed (K,κ) with pointed unitary transport on D,
and a pointed unitary u:O^{b'}⊗K→O^{2b'} with u(1⊗κ)=V_{b'}, such that the
blocked-ancilla construction reproduces α_L up to conjugation by V-fixing unitaries
of uniformly bounded support. No occupation, translation or unchanged-side hypothesis
may be added. Two steps come first, both general: (i) sufficiency of the blocked
ancilla form (combine the ancilla theorem with 96.2 `<1>2`-`<1>4`); (ii) the
necessary class condition `[O]^{b'}([K]-[O]^{b'})=0` with [K] central in K(D).
The calibrating instance is the S_3 carrier: a positive answer, combined with REVIEW R2,
makes it the first genuine bare-L0 R0^u no-go. A lift for it would be a counterexample
beyond every known construction. Either outcome is informative. The instance only
calibrates the general statement.
