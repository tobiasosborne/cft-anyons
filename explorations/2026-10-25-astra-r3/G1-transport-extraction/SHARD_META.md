# CA-101 registration package (2026-10-27, round 4)

Prepared for registration; only the shard and this package are written. No canonical
registration, amendment, commit or network action is performed. **P1**, refinement
of the indefinite-particle vacancy tower, feeds **P4**, the unital WT-1 A1 input.
NOTE/REVIEW/INTEGRATION below are the files in this G1 directory. Grades follow
`REVIEW.md:126-170`; the overall verdict is **COUNTEREXAMPLE** (`REVIEW.md:1-42`).

## 1. `report/SHARD_CATALOG.md` entry

```markdown
## `CA-101-ANCILLA-TRANSPORT-LIFTS`

- Source: `report/sections/101_ancilla_transport_lifts.tex`
- Title: Ancilla Transport Lifts and the Failure of Finite-Power Extraction
- Summary: For any unitary fusion C, a declared pointed ancilla transport datum gives local unital vacancy refinements; inclusion matrices classify global point-fixing gauge and distinguish these lifts from site-power transport lifts.
- Summary: Local lifts need not imply transport on any tensor power, refuting G1 and Target 96.10; fixed-power feasibility remains distinct from decidability, occupation-compatible extraction stays open, and blocked-ancilla extraction under uniformity is the next target.
- Keywords: ancilla transport, local unital lift, indefinite particle number, inclusion matrix, relative half-braiding, finite-power extraction, occupation degree, blocked ancilla, Target 96.10, G1, P1, P4
```

## 2. `report/README.md` include-order row

```markdown
| 101 | `CA-101-ANCILLA-TRANSPORT-LIFTS` | `report/sections/101_ancilla_transport_lifts.tex` | Ancilla Transport Lifts and the Failure of Finite-Power Extraction |
```

## 3. `report.tex` include

```latex
\include{report/sections/101_ancilla_transport_lifts}
```

## 4. Proposed `CONVENTIONS.md` entries

Checked the existing (a)-(aw) entries and (ax). Reuse (r)/(t)/(am) for the
carrier, point, placement and occupation; (aq) for tags; (as) for crossing
orientation and interval membership. CA-96 §Setting, §Block Construction and
Proposition 96.4 already define blocked `P,xi` and the restriction convention;
(ax) keeps those symbols shard-scoped. The following extend that notation only.
Letters (ay), (az) are proposals, not registrations; re-letter if another deferred
package is registered first. No independent convention is needed for 101.6's
`z_i=t_{s_i}^{-1}` or minimum over b, which reuse CA-90 (90.5) and CA-96.

```markdown
## (ay) Ancilla transport datum (2026-10-27)
**Scope:** CA-101 and later lifts explicitly using its ancilla datum.
**Choice:** An ancilla datum is `(K,kappa,t,u)`: `kappa: 1 -> K` is an isometry,
`t_Y: Y ⊗ K -> K ⊗ Y` is pointed unitary relative transport for every object and
morphism of full `D=<O>`, with (H) of CA-90 oriented as in (as), and
`u: O ⊗ K -> O ⊗ O` is a unitary morphism with `u(1_O ⊗ kappa)=1_O ⊗ eta`.
`B_L^K` inserts `K_i` after old site i, crossing only the old suffix; ancillas
never cross each other. `T_L=u^{⊗L} B_L^K` implements the lift by conjugating
`a ⊗ 1_{K^{⊗L}}`; interval membership is `[2j-1,2k]`, slack one per (as).
The target's blocked variant uses `u: O^{⊗b'} ⊗ K -> O^{⊗2b'}` with
`u(1 ⊗ kappa)=V_{b'}` (literal dyadic insertion, not trailing insertion).
`K` is a supplied categorical object; it need not equal O or a power of O.
**Known clash:** `K` is not the graph-norm control `K_r` of (v) or the expectation
cost `K(E)` of (av); `K(D)` is the fusion ring. `r` denotes only locality slack.
In the examples table the dihedral rotation is `rho_0=ab`, while `rho(x)` is the
conjugation action on K's homogeneous basis; these are not CA-96's rho coordinates.
The target's blocked construction is conjectural as a classification, and no
occupation-degree preservation is included in this datum.
**Source:** `explorations/2026-10-25-astra-r3/G1-transport-extraction/NOTE.md:21-35,37-89,171-251`;
`explorations/2026-10-25-astra-r3/G1-transport-extraction/REVIEW.md:50-54,107-111,128-132,198-208`;
`explorations/2026-10-25-astra-r3/G1-transport-extraction/INTEGRATION.md:102-111,123-133`.
**Sweep status:** proposed; CA-101 defines the datum inline. Existing (as) is unchanged.

## (az) Inclusion matrices and point-fixing gauge for lifts (2026-10-27)
**Scope:** CA-101; extends the matrix orientation of CA-90 Proposition 90.2(b)
and CA-96 Proposition 96.4 to arbitrary dyadic lifts.
**Choice:** `Lambda_{c,d}(L)` is the number of copies of input simple matrix block
c of `A_L` in output charge block d of `A_{2L}` under the chosen lift alpha_L:
rows input, columns output, and only occurring blocks. It is not the rank of a
central projection. `m_c(L)=dim Hom(c,W_L)`; at a cut `L=s+t`,
`T^alpha_{(ij),d}` is the multiplicity of the actually restricted representation
of `End(W_s) ⊗ End(W_t)` in output d. It carries no unchanged-side identification.
`Lambda^K` means fusion by `K^{⊗L}`; `Lambda^tr` means fusion by `O^{⊗L}`.
Point-fixing gauge means `Ad_U` with `U in A_{2L}` unitary and `U V_L=V_L`.
It is global unless a support bound is supplied. Output unitary conjugation
preserves Lambda; arbitrary input/output *-automorphisms allow block relabelling.
**Known clash:** the cut multiplicity `T^alpha` and the implementing unitary `T_L`
of (ay) are different objects; neither denotes the modular T matrix or KS modes.
**Source:** `explorations/2026-10-25-astra-r3/G1-transport-extraction/NOTE.md:30-33,130-161,295-347`;
`explorations/2026-10-25-astra-r3/G1-transport-extraction/REVIEW.md:67-70,134-145`;
`references/lattice-symmetry/BubbleAlgebra2003/source/twocolour.tex:897-913`.
**Sweep status:** proposed; used inline in CA-101. Equal matrices certify only global gauge.
```

## 5. Dated amendment pointers

Each anchor is literal current source text; append the supplied LaTeX immediately
after it. These are pointers, not edits. The CA-88 table amendment belongs after
the complete table, not inside a row. Keep all existing target text as history.
Sources for this list: `INTEGRATION.md:61-95`, with grid details at `:44-56`.

### CA-96 status

File: `report/sections/96_blocked_dyadic_lifts.tex:12`.
Anchor: `\(\mathsf R0^u\) witnesses; 96.9 is \emph{conditional}; 96.10 is \emph{conjectural}.`

```latex
\emph{Amendment (2026-10-27, round 4):} Target 96.10 is refuted exactly as stated by CA-101 Negative 101.3 (G1 review grade COUNTEREXAMPLE); its replacement is Target 101.9, blocked-ancilla extraction under uniformity.
```

### CA-96 necessity and classification boundary

File: `report/sections/96_blocked_dyadic_lifts.tex:249`.
Anchor: `\emph{conjectural/open} (any; \(\mathsf L0\); \(\to\mathsf R0^u\)).`

```latex
\emph{Amendment (2026-10-27, round 4):} Necessity of finite-power transport is false (CA-101 Negative 101.3 and its exact examples table); classification of arbitrary local lifts remains open, and the lengthwise hypotheses do not supply the uniformity needed for single-datum extraction (101.7).
```

### CA-96 unresolved carrier

File: `report/sections/96_blocked_dyadic_lifts.tex:253`.
Anchor: `three-summand \(\mathrm{Vec}_{S_3}\) carrier remains undecided; the different carriers below do not decide it.`

```latex
\emph{Amendment (2026-10-27, round 4):} This carrier remains undecided, but no blocked or ancilla transport datum exists at any block size, even at the fusion-ring level (CA-101 Negative 101.8 and its final examples-table row, G1 REVIEW R2); all these sufficient constructions are excluded.
```

### CA-96 Target 96.10

File: `report/sections/96_blocked_dyadic_lifts.tex:275`.
Anchor: `the unknown side inclusions and associator coherence must be reconstructed (INTEGRATION:145--155).`

```latex
\emph{Amendment (2026-10-27, round 4):} \textbf{Target 96.10 is refuted (2026-10-27):} CA-101 Negative 101.3 satisfies exactly (a), with no added hypothesis, yet no tensor power transports; Target 101.9 replaces the positive extraction conjecture by blocked-ancilla extraction under a stated uniformity hypothesis.
```

### CA-90 Boundary

File: `report/sections/90_local_unital_lift.tex:211`.
Anchor: `from an arbitrary \(\alpha\).  Existence or a complete obstruction for arbitrary local dyadic unital lifts at \(\mathsf L0\) is open.`

```latex
\emph{Amendment (2026-10-27, round 4):} Local dyadic lifts exist beyond transport of every site power (CA-101 Negative 101.3), while ancilla transport suffices (Theorem 101.1); arbitrary-lift existence at bare \(\mathsf L0\) remains open and the one-gap hypotheses of 90.2(b) remain essential.
```

### CA-90 Target 90.T

File: `report/sections/90_local_unital_lift.tex:250`.
Anchor: `\(\mathsf L0\) up to the associator equations (90.5).`

```latex
\emph{Amendment (2026-10-27, round 4):} After CA-96's refutation of the single-site centrality deduction, CA-101 Negative 101.3 also refutes the necessity of transport on any site power; the sufficient ancilla construction is 101.1 and the next extraction target is 101.9, with arbitrary local-lift existence still open.
```

### CA-97 supplied-H qualification

File: `report/sections/97_what_the_tower_remembers.tex:218` (the integration locator `:213` has drifted).
Anchor: `independent of splitting, and direct sums finish. QED. This recovers supplied \(H\), not \(H\) from arbitrary local lifts.`

```latex
\emph{Amendment (2026-10-27, round 4):} This supplied-\(H\) qualification is sharp: CA-101's negative witnesses admit no transport on any \(O^b\), and the examples-table check at \(m=3\) returns a nonunitary rank-8 endomorphism of \(O\otimes O\) from \(j^\dagger\alpha_2(h)i\) (G1 \path{checks/review_g1_independent_output.txt}:7); trailing descent for those witnesses is only finitely checked.
```

### CA-88 Definition 88.3 (including the R0^u row)

File: `report/sections/88_layered_targets.tex:108-110`.
Anchor (the last row and close of the target-rung table):

```latex
\(\mathsf R5\) & coherent/functorial over enrichment-preserving equivalences & \(\mathsf L3\) & D6-C clause; none \\
\bottomrule
\end{tabular}
\end{center}
```

Append:

```latex
\emph{Amendment (2026-10-27, round 4):} Read the \(\mathsf R0^u\) data entry as sufficient transport data on \(O\), \(O^b\) (CA-96), or an ancilla \(K\) with a pointed unitary \(O\otimes K\cong O^2\) (CA-101 Theorem 101.1); necessity of transport on any \(O^b\) is refuted by 101.3, while the CA-90 rung, \(\mathsf L1/\mathsf R0^u\), \(\mathsf R0^c\), \(\mathsf R1\)--\(\mathsf R5\), full/periodic entries and the occupation-compatible D1-C target are unchanged.
```

### CA-88 bare-L0 paragraph

File: `report/sections/88_layered_targets.tex:118`.
Anchor: `\([O]\) is not central in \(K(\langle O\rangle)\) (90.2); reached at bare \(\mathsf L0\) for the CA-96 families, open for general \(\Cc\) (96.10).`

```latex
\emph{Amendment (2026-10-27, round 4):} Relative transport is a sufficient condition; CA-101 adds bare-\(\mathsf L0\) witnesses with no transportable site power, refuting 96.10, while general existence remains open rather than characterized, universal or obstructed; the replacement extraction question is Target 101.9.
```

### CA-88 verdict pointer

File: `report/sections/88_layered_targets.tex:246`.
Anchor: `No cell moved up a rung; \(\mathsf R0^u\) is now reached at bare \(\mathsf L0\) for the group-graded families of CA-96 (single-site centrality is neither necessary nor sufficient).`

```latex
\emph{Amendment (2026-10-27, round 4):} G1 has review grade COUNTEREXAMPLE to its conjecture and Target 96.10 exactly as stated; CA-101 derives the ancilla certificate and finite inclusion-matrix extraction without a higher-rung promotion, and names Target 101.9 as the next question.
```

### CA-88 remaining open-target pointer

File: `report/sections/88_layered_targets.tex:263`.
Anchor: `\(\mathsf R0^u\) at bare \(\mathsf L0\) for general \(\Cc\) is open (Target 96.10; 90.T superseded).`

```latex
\emph{Amendment (2026-10-27, round 4):} General bare-\(\mathsf L0\) existence is still open, but 96.10 is refuted by CA-101 Negative 101.3; Target 101.9 asks for blocked-ancilla extraction under uniformity, and the occupation-compatible variant remains open.
```

### CA-76 local typing pointer (optional in INTEGRATION)

File: `report/sections/76_corner_to_wilson_bridge.tex:149`.
Anchor: `\(\langle O\rangle\) suffices, no lift to \(Z(\Cc)\); one-gap lifts are obstructed when \([O]\) is not central (Proposition 90.2).`

```latex
\emph{Amendment (2026-10-27, round 4):} Local unital typing also holds with a declared ancilla transport datum (CA-101 Theorem 101.1); Proposition 76.1 applies unchanged, while Link (b3) and the state/witness conditions of 76.12 remain open.
```

### CA-75 Link (b1) pointer (optional in INTEGRATION)

File: `report/sections/75_integration_map.tex:155`.
Anchor: `half-braiding on \(\langle O\rangle\) (CA-90 Thm.~90.1; braided \(\Cc\) suffices); (b1) is closed there, open at bare \(\mathsf L0\).`

```latex
\emph{Amendment (2026-10-27, round 4):} Local unital typing also holds with a declared ancilla transport datum (CA-101 Theorem 101.1), including bare-\(\mathsf L0\) instances beyond site-power transport; Link (b3) and the state conditions of CA-76 Question 76.12 remain open.
```

No amendments to CA-91--CA-95 or CA-98--CA-100 are licensed by this package.

## 6. One-line `INDEX.md` checks-bundle fragment

For the Run Bundles table (`Run bundle | Producer | Headline finding`):

```markdown
| `explorations/2026-10-25-astra-r3/G1-transport-extraction/checks/` | `python3 -B checks/review_g1_independent.py` from its parent; `--mutate {K,u,transport,point,dress,centralO,authorpoint}` | CA-101: independent dihedral lift and inclusion-matrix checks PASS (`review_g1_independent_output.txt`); six genuine mutations RED (`review_g1_red_*.txt`), point-relabel control GREEN (`review_g1_green_authorpoint.txt`); occupation degree fails, trailing descent finite only; arbitrary local-lift existence remains open. |
```

## 7. Worklog paragraph (paste-ready)

**2026-10-27 — CA-101, P1 feeding P4. Verdict: COUNTEREXAMPLE to G1 and Target
96.10 exactly as stated.** **Context →** integrate the independently reviewed
G1 proof into one shard, preserving its finite/conditional boundaries.
**What changed →** CA-101 Theorem 101.1 gives ancilla-transport local unital
refinement with exact vacancy insertion and slack one [derived; any;
L0+(K,kappa,t,u); R0^u]. Proposition 101.2 and Lemma 101.4 give the inclusion
invariant, global point-fixing conjugacy criterion, dimension equation and actual
cut restriction identity [derived; any; L0; finite ->R0^u]. Negative 101.3 refutes
site-power extraction with explicit all-L witnesses [negative, derived witnesses;
any; bare L0; R0^u]. Proposition 101.6 gives fixed-b feasibility and minimum-b
invariance [derived; any; L0+finite associator/dagger data; finite ->R0^u], without
decidability. Reviewer R1/R2 become 101.7/101.8 [negative; any; L0; ->R0^u]:
lengthwise choices defeat the requested single-site-power-datum classification,
and one still-open carrier has no blocked/ancilla datum at any b. All instances
and exact counterexample data are confined to the examples table. **Why these
choices →** P1 is the substantive gain: the vacancy tower has more local unital
refinements than site-power transport permits; P4 gets only WT-1 A1, with no state
estimate. CA-88 gains a sufficient certificate and bare-L0 witnesses, not a higher
rung or a classification. **Frictions / dead ends →** the brief's `(ar)` means
`(as)`; `(ax)` is already occupied; no cross-L hypothesis supported G1(a)'s
classification; absence of a transportable power does not imply absence of lifts;
`b<=r+1` fails with minimum b infinite and slack one; finite fixed-b equations do
not decide some b; the brief's three-way grid choice omitted the actual outcome.
NOTE G1.4 step <1>4's uncomputed witness/one-gap comparison stays conditional in
101.5. The negative family violates occupation degree (checked m=3,4), so the
occupation-compatible problem stays open; trailing descent is finite evidence
only. The author's point mutation just changes to another fixed vector and stays
GREEN; the reviewer's genuine point-action mutation fails exact V, while the
dressing mutation independently catches interval-membership failure. The next
target is 101.9 [conjectural; any; L0; ->R0^u], blocked-ancilla extraction with a
fixed trailing-square hypothesis; a no-go deduced from it concerns families with
that hypothesis, not arbitrary lifts. **Acceptance →** independent reviewer
baseline and mutation checks rerun (six RED, point-relabel control GREEN); isolated
preamble-copy wrapper compiled with `latexmk -pdf -interaction=nonstopmode`
(five pages, no warnings or undefined macros); shard 260 lines, metadata mirrored,
all 13 amendment anchors checked against current sources. **Pointers →**
`report/sections/101_ancilla_transport_lifts.tex`; G1 `NOTE.md:37-408`,
`REVIEW.md:1-208`, `INTEGRATION.md:17-137`, `checks/review_g1_independent_output.txt`;
registration and dated amendments in G1 `SHARD_META.md`. Only the two requested
files were written; canonical registration and amendments remain to be applied
in the integrating session, with no commit or network action in this task.
