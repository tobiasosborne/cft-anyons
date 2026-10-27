# CA-104 registration package (2026-10-27, round 4)

Prepared for registration; only the shard and this package were written. No canonical
registration, amendment, commit or network action was performed. **Pillar P4** (OAR limit):
non-collapse becomes a quantitative clause of the VR-1 contract, and the strengthened
contract has its first (category-free, nonlocal-refinement) instance. P1--P3 untouched.
NOTE/REVIEW/INTEGRATION below are the files in this H3 directory. Grades follow
`REVIEW.md:1-11,153-252,254-283` and `INTEGRATION.md:16-29`; the overall verdict is
**WEAKER-RESULT-PROVED as posed; corrected statements PROOF-COMPLETE**.
**Numbering:** INTEGRATION's proposed "CA-103" is superseded by the binding shard brief
(`briefs/SHARD-H3-vr1-noncollapse-instance.md`): the shard is **CA-104**.

## 1. `report/SHARD_CATALOG.md` entry

```markdown
## `CA-104-VR1-NONCOLLAPSE-AND-FIRST-INSTANCE`

- Source: `report/sections/104_vr1_noncollapse_first_instance.tex`
- Title: VR-1 Non-Collapse and a First Whole-Carrier Graph-Norm Instance
- Summary: Category-free: under VR-1 A1-A4 a transported coarse-vector witness A5 is equivalent to nonzero limiting stress, with finite certificate |q_a| > d_{a,n}; the collapsing chains CA-95.5 and CA-100.5 fail it, A5 plus (PE) gives c* > 0, and raw T_0 >= 0 does not give c > 0 for the linear ledger.
- Summary: Entrywise Schur certificates and a full-Fock quadratic CAR bound yield the first genuine VR-1 + A5 instance: source-modified fermion modes with K = (1+E)^p satisfy A1-A4 on the whole carrier iff p > 1, kappa = 1/(2 sqrt2 pi), on WS-1's GNS system with zero mixed brackets; the refinement is nonlocal and no categorical cell moves.
- Keywords: VR-1, non-collapse, A5, finite certificate, central charge, c star, PE condition, linear ledger, Schur test, graph norm, whole carrier, CAR quadratic, free fermion calibration, same GNS system, WS-1, WT-1, graph-norm distortion, P4
```

## 2. `report/README.md` include-order row

```markdown
| 104 | `CA-104-VR1-NONCOLLAPSE-AND-FIRST-INSTANCE` | `report/sections/104_vr1_noncollapse_first_instance.tex` | VR-1 Non-Collapse and a First Whole-Carrier Graph-Norm Instance |
```

## 3. `report.tex` include

```latex
\include{report/sections/104_vr1_noncollapse_first_instance}
```
(After the CA-103 include if one lands first; otherwise after CA-102.)

## 4. Proposed `CONVENTIONS.md` entries

Checked (a)-(aw) and (ax). Reused without redefinition: (s) two central constants,
(v) VR-1 graph norms `||v||_{N,s}=||K_N^s v||`, (w) AP circle, no-wrap `A_n`, sea `S=1_(r<0)`,
spinor/Dirac conventions, (al) inner product linear in the second slot, (aq) tags,
(ar) two-scale `|X|_{s,d}`. The entries below cover only notation the shard introduces.
**Merge caveat:** letters (ay)-(bb) are proposals. The SHARD_META packages of CA-101 (G1),
CA-102 (G6), H1 and the round-3 F1/F3/F4/F6 packages all propose letters from (ay) as well, and
(ax) asks for sequential re-lettering from (ay) when the deferred proposals are registered;
re-letter these at merge time in landing order. They are not registered conventions.

```markdown
## (ay) VR-1 non-collapse witness and certificate (2026-10-27)
**Scope:** CA-104 and later statements citing A5.
**Choice:** For a VR-1 tower (v) with A3 errors `e_{r,n,s}`, a unit `v in H_a`, `n != 0`:
`v_r = J_{r<-a} v`, `q_r(v,n) = <v_r, T_{r,n} K_r^{-1} v_r>` (linear in the second slot, (al)),
`d_{a,n} = sum_{j>=a} e_{j,n,0}`. **A5** holds if there are n != 0, a, v, kappa > 0, r_0 >= a with
`|q_r(v,n)| >= kappa` for all r >= r_0. The finite certificate is `|q_a(v,n)| > d_{a,n}`. Only
integer powers `K^{-sigma}` may replace `K^{-1}` (VR-1 defines integer graph orders only).
**Known clash:** `q_r(v,n)` (two arguments) is not VR-1's A4 residual bound `q_{N,m,n,s}`; the
tail `d_{a,n}` is not CA-89's discrepancy norm `d_{r,n,s}` of (ar).
**Source:** `explorations/2026-10-27-astra-r4/H3-vr1-noncollapse-instance/NOTE.md:56-123`;
`REVIEW.md:155-169`; `INTEGRATION.md:96-101`; `cft_machine/research/virasoro_routes.md:55-112`.
**Sweep status:** CA-104 only.

## (az) Normalised modes, ledger naming and (PE) (2026-10-27)
**Scope:** CA-104 and any statement asserting positivity of a central charge.
**Choice:** `L_n = T_n + delta_{n,0} (c* - c)/24`, so
`[L_m, L_n] = (m-n) L_{m+n} + (c*/12)(m^3 - m) delta_{m+n,0}`; this is the shift law of CA-79.1
and keeps (s)'s two constants. The invariant charge is `c*`; a statement "c > 0" must name its
ledger (linear `c` or cubic `c*`). **(PE):** the common domain D contains a Hilbert-total
linear subspace `V_fin` with `L_n v = 0` for all sufficiently large positive n, every v in V_fin.
**Known clash:** none with (s); `L_n` here is not (at)'s `L_n := T_{r,n}` (unnormalised, finite
scale), and the highest weight `h` of Negative 104.7 is not the bond Hamiltonian `h` of (al).
**Source:** `.../H3-vr1-noncollapse-instance/NOTE.md:154-216`; `REVIEW.md:180-191`;
`INTEGRATION.md:102-106`; `report/sections/79_ks_shell_and_refinement_defect.tex:78-80`.
**Sweep status:** CA-104 only.

## (ba) Fermion VR-1 calibration control and refinement (2026-10-27)
**Scope:** CA-104 Proposition 104.11 and later calibrations on the (w) benchmark.
**Choice:** Control `E = sum_exc |r|` (linear excitation energy, never the finite sine zero mode
or the Dirac Hamiltonian), `K = (1+E)^p`, default p = 2; p = 1 is forbidden (A3 fails) and p < 1
fails A2. Refinement is the canonical GNS map `[a]_M -> [alpha(a)]_{2M}` of the sharp-momentum
CAR map; new labels are inserted as sea (excitation vacuum), never empty. Spinor basis
`U = (e_+, e_-)`, `e_pm = (1, pm i)/sqrt2`; `e_+` carries `S_-` and the modes `A_n`, `e_-`
carries `S_+` and `F A_n F`, `F e_r = e_{-r}`. Spectators enter through `E_tot`. Quadratics are
written `:dGamma_S(C):`. Graph norms are those of (v).
**Known clash:** CA-95 Proposition 95.8 writes `Q` for this same `E` (`K = 1+Q`); CA-104 writes
`Q = 1+E`. (at)'s energy mode `E_n` and CA-79's shells are unrelated. The sharp-momentum map
is spatially nonlocal: it is an R0 unital map, not CA-88's local `R0^u`.
**Source:** `.../H3-vr1-noncollapse-instance/checks/graph_certificate.md:10-31,120-169`;
`checks/same_system.md:13-26,91-99`; `INTEGRATION.md:107-115`;
`references/text/CFTFromLatticeFermions.txt:1176-1186,1845-1878,1890-1894`.
**Sweep status:** CA-104 only; (w) is unchanged.

## (bb) Entrywise certificate notation (2026-10-27)
**Scope:** CA-104 Theorem 104.8 and Lemma 104.9.
**Choice:** Declared orthonormal bases with `Q = 1 + e`, `e >= 0`; energy-shift bound `theta`
on nonzero entries; column/row constants `u, u'` at order `gamma`
(`sum_y |X_yx| <= u Q_in(x)^gamma`, `sum_x |X_yx| <= u' Q_out(y)^gamma`); weighted norm
`||Q_out^t X Q_in^{-t-lambda}||`, `lambda >= gamma`. Defect and residual orders
`eps_r^alpha Q^{1+alpha}`, `eps_r^beta Q^{2+beta}`, `eps_r = eps_0 2^{-r}`. In Lemma 104.9,
`F(gamma,k) = (1+|k|)^gamma (3^gamma + |k|)`.
**Known clash:** the NOTE writes `h, u, v, q, d, D` for `theta, u, u', gamma, lambda, X`; the
shard renames them to avoid the bond energy `h`, vectors `v`, the witness `q_r`, the tail `d_{a,n}`
and the domain `D`. `gamma` is the same role as CA-79's shell exponent.
**Source:** `.../H3-vr1-noncollapse-instance/NOTE.md:250-321`; `checks/graph_certificate.md:33-88`;
`INTEGRATION.md:116-119`; `REVIEW.md:204-207`.
**Sweep status:** CA-104 only.
```

## 5. Dated amendment pointers

Each anchor is literal current source text (checked 2026-10-27); append the supplied text
immediately after it. These are pointers, not edits. Source list: `INTEGRATION.md:61-92`,
grid details `:34-59`. The two `cft_machine/` notes are Markdown, so their pointers are
written in Markdown; worklog 023 is frozen and is superseded in the next worklog entry.

### CA-81 VR-1 paragraph

File: `report/sections/81_cft_machine_oar_contract.tex:108` (INTEGRATION's `:56-75` has drifted).
Anchor: `Adjoint pairing on the domain does not prove essential self-adjointness.`

```latex
\emph{Amendment (2026-10-27, round 4):} VR-1 gains the non-collapse clause A5 (CA-104 Theorem 104.1, finite certificate \(|q_a|>d_{a,n}\)); A1--A4 alone admit total collapse (95.5, 100.5; Negative 104.3). Its first instance is the sharp-momentum fermion calibration on WS-1's system with \(K=(1+E)^p\), \(p>1\) (Proposition 104.11), category-free and with a nonlocal refinement.
```

### CA-81 numerical scope

File: `report/sections/81_cft_machine_oar_contract.tex:120` (INTEGRATION's `:77-81` has drifted).
Anchor: `listed in \texttt{INDEX.md} and the benchmark README.`

```latex
\emph{Amendment (2026-10-27, round 4):} The compatible chiral sea is now used as the WT-1 \emph{limit} of the actual Dirac rows (WS-1), not substituted for them; this is the common system of CA-104 (Theorem 104.10, Proposition 104.11).
```

### CA-79 first attackable lemma

File: `report/sections/79_ks_shell_and_refinement_defect.tex:255-256`.
Anchor: `The next general lemma is Proposition 79.4's relative commutator bound for an` / `interacting density.`

```latex
\emph{Amendment (2026-10-27, round 4):} Answered for the calibration by an entrywise certificate (CA-104 Theorem 104.8, Lemma 104.9) rather than P0--P3 shells: the control is \(K=(1+E)^p\) for any \(p>1\); the ``\(\gamma\approx3\)'' suggestion is superseded, and \(p=1\) fails A3 (Proposition 104.11). The categorical P0--P3 instance remains open.
```

### CA-88 D2-C first lemma

File: `report/sections/88_layered_targets.tex:186`.
Anchor: `\(K=1+E_N\) (D2 INTEGRATION:117--121).`

```latex
\emph{Amendment (2026-10-27, round 4):} In the calibration tower \(K=1+E\) fails A3 (CA-104 Proposition 104.11); test Lemma 89.L with \(K=(1+E)^2\).
```

### CA-88 Definition 88.3 (R2 certificate column)

File: `report/sections/88_layered_targets.tex:108-111`.
Anchor (last row and close of the target-rung table):

```latex
\(\mathsf R5\) & coherent/functorial over enrichment-preserving equivalences & \(\mathsf L3\) & D6-C clause; none \\
\bottomrule
\end{tabular}
\end{center}
```

Append (after CA-101's pending amendment at the same anchor, if that lands first):

```latex
\emph{Amendment (2026-10-27, round 4):} The \(\mathsf R2\) ``Certificate in repo'' entry gains: VR-1\(+\)A5 first instance, the free-fermion calibration (CA-104 Proposition 104.11), category-free, sharp-momentum nonlocal refinement, on WS-1's GNS system [derived (calibration)]. Remark 88.4 is met for this calibration only; no categorical system carries both an \(\mathsf R1\) and an \(\mathsf R2\) certificate.
```

### CA-88 grid (WT-1/VR-1 row comment and new calibration row)

File: `report/sections/88_layered_targets.tex:155-158`.
Anchor (last row and close of the grid table):

```latex
LC-4 & full & \(\mathsf L0\) & \(\to\mathsf R1\), \(\mathsf R2\) & periodic KS tier; both chiral families \\
\bottomrule
\end{tabular}
\end{center}
```

```latex
\emph{Amendment (2026-10-27, round 4):} Row ``WT-1, VR-1 (CA-81)'' reads: category-free contracts; must share one system; non-collapse clause A5 (CA-104 Theorem 104.1); one calibration instance on a common system (104.11). New row, to be created: ``Fermion calibration (WS-1 + CA-104)'' \(\mid\) periodic AP, one family or paired full \(\mid\) none (category-free) \(\mid\) \(\mathsf R1+\mathsf R2\); \(\mathsf R0\) unital but nonlocal; no \(\mathsf R3\) \(\mid\) \(\mathsf R2\) by VR-1\(+\)A5 alongside \(\mathsf R2\) by OS Thm.~4.11. No categorical row, no \(\mathsf R3\)--\(\mathsf R5\) entry and not the \(\mathsf R1\) row moves.
```

### CA-95 What This Does Not Claim

File: `report/sections/95_probe_word_ward_lifting.tex:226`.
Anchor: `category fidelity or functoriality is constructed (REVIEW:21--42,148--178). The general construction remains the target.`

```latex
\emph{Amendment (2026-10-27, round 4):} A nontrivial common-system VR-1 certificate with all-bracket fermion estimates now exists for the calibration (CA-104 Proposition 104.11); 95.8's \(K=1+Q\) is not a VR-1 control, because A3 fails at \(p=1\). Standard local KS and categorical items remain unclaimed.
```

### CA-75 generator convergence

File: `report/sections/75_integration_map.tex:199-200`.
Anchor: `[C] VR-1 (no instance); [P] LC-4 \S4,` / `CA-68 compatibility target, CA-81.`

```latex
\emph{Amendment (2026-10-27, round 4):} VR-1 now has one category-free calibration instance on a common GNS system (CA-104 Proposition 104.11, nonlocal sharp-momentum refinement); no categorical instance.
```

### `cft_machine/research/virasoro_routes.md` after `:149`

Anchor: `<1>5. QED BY <1>1–<1>4.`

```markdown
*Amendment (2026-10-27, round 4):* A5 (non-collapse) and its corollary are CA-104 Theorem 104.1: under A1-A4, A5 holds iff some T_n (n != 0) is nonzero, with finite certificate |q_a| > d_{a,n}. Any "c > 0" statement must name its ledger: the invariant is c* (CA-104 Theorem 104.4, Negative 104.7).
```

### `cft_machine/reviews/virasoro_referee.md:155-161`

Anchor: `cross-interface warning, not a review or approval of the reviewer's own VR-1.`

```markdown
*Amendment (2026-10-27, round 4):* The fixed-core boundary is answered for this calibration by the full-carrier bound CA-104 Lemma 104.9 with K = (1+E)^p, p > 1; p = 1 fails A3 at eps r -> pi/2 (Proposition 104.11).
```

### worklog 023 §1 (R2 row) and §4.3

`worklog/023_2026-10-27_status_overview.md:76` ("**VR-1 has no instance anywhere**") is frozen:
supersede it in the next worklog entry (paragraph 7 below). Do not edit the chunk.

No amendments to CA-89--CA-94, CA-96--CA-102 or LC files are licensed by this package.

## 6. One-line `INDEX.md` checks-bundle fragment

For the Run Bundles table (`Run bundle | Producer | Headline finding`):

```markdown
| `explorations/2026-10-27-astra-r4/H3-vr1-noncollapse-instance/checks/` | from its parent: `python3 checks/review_independent_check.py` (`--mutation {empty-pad,ledger,collapse,p1}`); note's nine commands in `checks/README.md:8-45` | CA-104: whole-Fock fermion VR-1 A1-A4 + A5 PASS for K=(1+E)^2 (`review_independent_green.txt`), p=1 A3 ratio -> 2(sqrt2-1)/pi, kappa=1/(2sqrt2 pi); four reviewer and five note mutations RED; finite sizes calibrate, rates rest on the analytic proofs. |
```

## 7. Worklog paragraph (paste-ready)

**2026-10-27 — CA-104, pillar P4. Verdict: H3 as posed WEAKER-RESULT-PROVED; corrected
statements PROOF-COMPLETE (Opus review).** **Context →** integrate the reviewed H3 note:
non-collapse for VR-1 and the first genuine graph-norm instance. **What changed →** Theorem
104.1: under VR-1 A1-A4, A5 holds iff some T_n (n != 0) is nonzero, forces all nonzero-index
modes nonzero and T_0 non-scalar, with finite certificate |q_a| > d_{a,n} [derived; any;
category-free; R2 nontrivial given VR-1]. Negative 104.3: CA-95.5 and CA-100.5 satisfy A1-A4
and fail A5 for every C [negative; any; L0; trivial R2]. Theorem 104.4/Cor. 104.5: A5 + (PE)
gives c* > 0, without positivity of L_0 [derived; any; category-free + (PE)]; c* > 0 from
positivity alone is open (104.6) [conjectural]; Negative 104.7: raw T_0 >= 0 does not give
c > 0 for the linear ledger [negative; supplied target; L4]. Theorem 104.8 (Schur entrywise
certificate) and Lemma 104.9 (full-Fock quadratic CAR bound) [derived; any; category-free];
Theorem 104.10 (same-system GNS uniqueness) [derived]. Proposition 104.11: the source-modified
fermion modes with K = (1+E)^p satisfy A1-A4 on the whole Fock carrier iff p > 1, sharp A3
rate eps^min(p-1,2), kappa = 1/(2 sqrt2 pi), c = c* = 1, on WS-1's GNS system with zero mixed
brackets [derived (calibration); periodic AP; category-free; R1 + R2 on one system, R0 unital
but nonlocal]. **"VR-1 has no instance anywhere" (worklog 023 §1, §4.3) is superseded** for
the category-free calibration; no categorical instance exists. **Why these choices →** the
reviewer's weight warning is carried: the general theorems are thin (104.1 near a
reformulation, 104.8 a Schur test, 104.10 GNS uniqueness); the instance carries the hard
content. CA-88: the R2 certificate column and the WT-1/VR-1 row comment move, and a new
fermion-calibration row must be created; no categorical cell, no R3-R5 entry moves.
**Corrections to the brief found by the reviewer →** "CA-95.5 (= CA-89 Neg. 89.3)" is wrong
(89.3 is the A2 obstruction); 95.6/95.7/95.8 are now 95.8/95.9/95.11; CA-100.10 is a
supplied-target cutoff, not a collapse; "p = 3 may absorb it" is unnecessary (every p > 1
works, p = 3 only buys the eps^2 A3 rate), and the p = 1 failure is at eps r -> pi/2 in the
coarse interior, not at the window edge; "(adjoint pairing + positivity of L_0) gives c > 0" is
false for the linear c and the wrong hypothesis for c* ((PE) is right, positivity unneeded);
CA-88 has no "free-fermion row"; A5 is close to tautological, the non-trivial content is
104.4. The NOTE's "independent skeptical audits" (in-session reviews) are not independent.
Minor gaps: G1 (real sigma in Cor. 104.2; restricted to integer sigma), G2 (odd generators of
the second factor; marked conditional in 104.11, certificate unaffected). **Next →** Target
104.12, VR-1 with summable graph-norm distortion (`virasoro_routes.md:167-171`) [conjectural;
any; category-free; ->R2], the gate for local (wavelet) refinements and for CA-90/96;
runner-up 104.6. **Acceptance →** shard 234 lines; isolated preamble-copy wrapper compiled
with `latexmk -pdf -interaction=nonstopmode` (5 pages, zero errors, no undefined macros, no
overfull boxes). **Pointers →** `report/sections/104_vr1_noncollapse_first_instance.tex`;
H3 `NOTE.md`, `REVIEW.md`, `INTEGRATION.md`, `checks/graph_certificate.md`,
`checks/same_system.md`, `checks/review_independent_green.txt`; this `SHARD_META.md`.
