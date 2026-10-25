# CA-95 registration package — 2026-10-25

Prepared from `NOTE.md:49–627,658–745`, `REVIEW.md:1–225` and
`INTEGRATION.md:9–172` in this directory. Review verdict:
**WEAKER-RESULT-PROVED**. This file contains proposed registration text;
the destination files have not been edited. No commit or network operation
is part of this lift.

The shard preserves the brief's literal fourth header key
`SHARD-F4-ward-to-residualWORDS`; the identical canonical `SHARD-KEYWORDS`
alias appears after the section label for the repository guard. The four
opening comment lines, title, summary and keyword values are retained below.

## 1. `report/SHARD_CATALOG.md` entry

```markdown
## `CA-95-PROBE-WORD-WARD-LIFTING`

- Source: `report/sections/95_probe_word_ward_lifting.tex`
- Title: Probe-Word Ward Lifting: Uniform Bounds, the Geometric Gap, and a False Converse
- Summary: Uniform physical probe bounds give an explicit two-loss estimate; contour-to-W2 and KS transfer remain conditional on endpoint, cylinder-contact and accumulated-error data. A local KS counterexample refutes the subcritical-collar converse; modified-fermion diagonal bounds are calibrations only. No general target rung advances.
- Keywords: Ward identity, probe words, positive quotient, Gram correction, two-loss norm, subcritical collar, endpoint realization, Koo-Saleur, VR-1, fermion calibration, F4
```

## 2. `report/README.md` include-order row

```markdown
| 95 | `CA-95-PROBE-WORD-WARD-LIFTING` | `report/sections/95_probe_word_ward_lifting.tex` | Probe-Word Ward Lifting: Uniform Bounds, the Geometric Gap, and a False Converse |
```

## 3. `report.tex` include line

```latex
\include{report/sections/95_probe_word_ward_lifting}
```

## 4. Proposed `CONVENTIONS.md` additions

Checked the existing (a)–(aw) entries for the notation introduced here.
Reuse (al)'s second-slot-linear pairing, (v)/(ar)'s graph norms,
(ap)/(ar)'s KS/Fourier/contact conventions, (m)'s Pauli normalization,
(w)'s no-wrap AP modes, sea and self-dual factor, and (ao)'s complete
coefficient compiler. The additions below supply only the new probe/error
semantics, counterexample declarations and calibration controls/constants.
The proposed letters start at (ax), as requested; reconcile letters with
other pending round-3 packages when registering them together.

```markdown
## (ax) Physical probe forms and accumulated Ward errors (2026-10-25)
**Scope:** CA-95, especially 95.1–95.7 and Target 95.12; supplements (v)/(ar).
**Choice:** `D_r` is the linear span of reflected probes in a finite positive quotient `H_r`;
density means `D_r=H_r`. The form `rho_r(u,v)=<u,R_r v>` descends through both null spaces and
uses (al)'s pairing. A probe bound is uniform over arbitrary linear combinations on both sides:
`|rho_r(K_r^s u,exp(-t K_r)v)| <= b_(r,s) t^(-s-1-alpha_s) ||u|| ||v||`, for integer `s>=0`,
`0<t<=1`, with `0<=alpha_s<1` fixed independently of r. For an independent probe basis with
Gram G and sesquilinear-form matrix B, the physical form norm is `||G^(-1/2) B G^(-1/2)||`;
null coordinates are removed first. This does not replace the operator-coordinate rule in D2-L9.
The explicit two-loss constant is `C_(s,alpha)=1/((s+1)!(1-alpha))+sum_(j=0)^(s+1) 1/j!`.
G1 names the two-ordering endpoint/product realization; G2 the transported cylinder contact
comparison with (ar)'s z; G3 the accumulated physical error bound. Its constant is
`B_(r,m,n,s)=b_end+b_chart+sum_i |a_i| b_i`, including all quotient/Gram, port, Fourier and
counting factors, or a directly proved bound on the assembled form. Write
`mathcal R_(r,m,n)=[S_(r,m),S_(r,n)]-beta_N S_(r,m+n)-z^(r)_(mn) I`.
For the analytic converse, `q_(r,s)=|R_r|_(s,2)`, `A_p=(p/e)^p`, and
`theta=(alpha-alpha0)/(1-alpha0)` with `0<=alpha0<alpha<1`; the additional subcritical
envelope has a scale-independent constant B_s. Target 95.12 uses quotient-descending
endpoint errors `e_r^+`, `e_r^-` and bounds the sum of their absolute pairings.
**Known clash:** `D_r` here is a probe span, not (ar)'s discrepancy `D_(r,n)` or (at)'s mode
difference. The form matrix B, accumulated B_(r,m,n,s), and envelope B_s are distinct;
`b_(r,s)` is an error constant, not the zero-mode shift b_r. `A_p` is a scalar maximum,
not (w)'s one-particle mode A_n. No geometric identity follows from this notation.
**Source:** `explorations/2026-10-25-astra-r3/F4-ward-to-residual/NOTE.md:53-111,120-166,344-388`;
`explorations/2026-10-25-astra-r3/F4-ward-to-residual/REVIEW.md:51-64,83-86,213-225`.
**Sweep status:** proposed for CA-95 only; CA-78/89 receive dated pointers, not changed hypotheses.

## (ay) Auxiliary-control local KS counterexample (2026-10-25)
**Scope:** CA-95 Negative 95.5 only; not a new global admissibility condition.
**Choice:** The three-dimensional site is a distinguished vacancy `|0>` plus an active `C^2`;
P projects onto the active block, and the Pauli matrices of (m) extend by zero on the vacancy.
Set `N_r=8*2^r`, `a_r=exp(N_r^2)`, `lambda_r=a_r^2 N_r^3` and
`k_j=a_r(P_j P_(j+1)+X_j Z_(j+1))`, with `h_j=-k_j`, `v_r=1`, `epsilon_r=b_r=0`.
Both KS families and the forward current use (ap). U shifts one site; J retains old sites at
even zero-based fine positions and inserts vacancies at odd positions, equivalent to (t)'s
odd one-based placement. Start K_0 at 1 on the vacuum and lambda_0 on its orthogonal complement.
At each refinement, transport K_r by J on F_+=ran J and by UJ on F_-=U ran J, agreeing on
their common vacuum line; put K_(r+1)=lambda_(r+1) I on `(F_++F_-)^perp`.
The control is nonphysical. `L_N=N^2 a_N^2/pi` is the mode-norm envelope,
`B_mn=2|m|+|m+n|`, and `c_N=N^2 a_N^4 sin(4*pi/N)/pi^2` is the XYYYZ coefficient of
`E=[T_1,T_-1]-beta_N T_0`. For fixed `p=s+1+alpha`, use `t=p/lambda_N` only for sufficiently
large N that t<=1. The symbols with subscript N mean their values at N=N_r.
**Known clash:** a_r is the coupling, not (ap)'s Fourier prefactor N/(4pi); c_N is a Pauli
coefficient, not a central charge; P is the active-site projection, not a shell cutoff.
**Source:** `explorations/2026-10-25-astra-r3/F4-ward-to-residual/NOTE.md:212-340`;
`explorations/2026-10-25-astra-r3/F4-ward-to-residual/REVIEW.md:68-82`.
**Sweep status:** proposed for CA-95 only; physical-energy comparison/noncollapse remain extra hypotheses.

## (az) Modified-CAR graph and collar calibration (2026-10-25)
**Scope:** CA-95 95.8–95.10 and the F4 checks bundle; supplements (w), not (ap)'s standard local modes.
**Choice:** Keep (w)'s source-modified no-wrap AP prescription and complex sea. The tag
"AP chiral CAR" denotes one chiral family on an antiperiodic circle, not an open-chain realization.
Write `L_n=:dGamma(A_n):`, `Q=sum_exc |r|`, `K=1+Q`; the sum is over particle/hole excitations.
Distinguish `E_chiral=:dGamma(A_0):=sum_exc |sin(epsilon*r)|/epsilon` from
`E_D=sum_exc 2|sin(epsilon*r/2)|/epsilon`, which is only a dispersion proxy on the same chiral sea,
not the finite two-component Dirac GNS energy. For even M>=8 and n=1,2,3,
`R_(n,-n)=[L_n,L_-n]-2n L_0-(n^3-n)I/12`, `C_n=[A_n,A_-n]-2n A_0`,
`a_n=c_S(A_n,A_-n)`, `delta_n=a_n-(n^3-n)/12`; `q_1=|R_(1,-1)|_(0,2)` in the examples.
The bound constants (NOTE's Cconst, Bconst) are written
`C_n^bd=pi*(n+7n^3/24)+(n-1)^2/(pi*(4.5-n)^2)`,
`B_n^bd=sum_(r=1/2,3/2,...,n-1/2) ((r-n/2)^4/3+n^2*(r-n/2)^2/8)`,
`U_n(epsilon)=C_n^bd*epsilon+B_n^bd*epsilon^2`, and
`H_n=4n+(n-1)^2/2+B_n^bd*pi^2/16`. `sinc(x)=sin(x)/x` with sinc(0)=1.
In the ultraviolet witness `r_+=M/2-1/2`, `r_-=-r_+`, `e_M=sin(epsilon/2)/epsilon`,
`u_M=cos^2(epsilon/4)*sin(epsilon)/epsilon`. The two-mode ledger estimators are
`c_M^*=2(a_2-2a_1)`, `c_M=2a_2-16a_1`; they need not fit a_3 at finite M.
Diagonal n=1,2,3 estimates concern the full finite Fock space; off-diagonal checks use all
Q<=4 input occupations with every generated output retained. Numerical checks are Float64,
not intervals: absolute tolerance 1e-10 for the CAR check, 2e-9 for the author's sparse KS
check, 1e-10 for its qutrit reviewer, 1e-9 for the independent review. These scoped tolerances
do not change (w)'s original 1e-11 checks and are not analytic hypotheses.
**Known clash:** Q starts at zero and is not (ap)'s positive auxiliary Q_r; C_n is a
one-particle residual, C_n^bd a bound, H_n a constant rather than a Hamiltonian.
The source's separate self-dual factor remains (w); it supplies no Majorana full-Fock graph estimate here.
**Source:** `explorations/2026-10-25-astra-r3/F4-ward-to-residual/NOTE.md:390-591`;
`explorations/2026-10-25-astra-r3/F4-ward-to-residual/INTEGRATION.md:124-132`;
`references/text/CFTFromLatticeFermions.txt:881-892,3383-3414`.
**Sweep status:** proposed for CA-95 and the F4 bundle only; no geometric Ward certificate registered.
```

Locator correction: the shard cites `CONVENTIONS.md:1486–1562`, including
(ar)'s multiplier/contact dictionary at 1551–1556. This corrects the
short locator in `NOTE.md:758` without editing the note (REVIEW:120–124).

## 5. Dated amendment pointers

Each block gives the destination, exact current anchor text, and the text
to append. These are pointers to CA-95, not replacements for old theorem
statements. Preserve the round-2 grade/date. Sources for the list:
`INTEGRATION.md:67–108`; for CA-88's cells, `:44–65`.

### CA-89 — Lemma 89.L

File: `report/sections/89_ward_ks_transfer.tex`.
Append after the sentence ending at line 231:
`(\path{cft_machine/benchmarks/fermion/}; D2 INTEGRATION:117--121) with \(K=1+E_N\), at the laptop budget.`

```latex
\emph{Amendment (2026-10-25, round 3):} CA-95 Lemma 95.1 proves uniform physical probe-form lifting with an explicit two-loss constant; its application to D2 (19) still needs endpoint/product realization G1, cylinder contact comparison G2 and uniform accumulated errors G3 (95.2--95.3), while A1--A4 do not imply subcritical collars for arbitrary admissible auxiliary controls (95.5, with zero limiting stress), so Lemma 89.L is not yet proved as stated and the next target is 95.12.
```

### CA-89 — contact discussion

File: `report/sections/89_ward_ks_transfer.tex`.
Append after `estimate is open.` at line 215 (the last sentence of 89.8).

```latex
\emph{Amendment (2026-10-25, round 3):} CA-95 Proposition 95.10 is a spectral central calibration, supplying neither a lattice chart-change theorem nor measured geometric contacts; retain \(c^*=12\kappa_3\), \(c=24b-12\kappa_1\) with the declared zero-mode origin.
```

### CA-78 — Lemma 78.11

File: `report/sections/78_categorical_selection_equations.tex`.
Append after `uniformly in \(n\), yet \(\|X_n(1+E_n)^{-p}\ket0\|=e^{\sqrt n}\) for every \(p\).` at line 229.

```latex
\emph{Amendment (2026-10-25, round 3):} CA-95 Lemma 95.1 supplies the explicit two-loss constant for uniform bounds on normalized physical probe combinations; form matrices use \(G^{-1/2}BG^{-1/2}\), unlike operator-coordinate matrices, and fixed-word decay alone is insufficient (95.4).
```

### CA-78 — Target 78.13

File: `report/sections/78_categorical_selection_equations.tex`.
Append after `open core: the operator lift W2 (Lemma 89.L).` at line 253.

```latex
\emph{Amendment (2026-10-25, round 3):} CA-95 leaves the geometric operator lift conditional and isolates quantitative two-ordering endpoint realization as Target 95.12; the existing fermion backend verifies no geometric Ward certificate.
```

### CA-79 — first calibration target

File: `report/sections/79_ks_shell_and_refinement_defect.tex`.
Append after `interacting density.` at line 256 (end of the first-attackable-lemma paragraph).

```latex
\emph{Amendment (2026-10-25, round 3):} CA-95 Proposition 95.8 proves full-Fock residual and collar bounds for the source-modified no-wrap CAR diagonal pairs \((n,-n)\), \(n=1,2,3\), relative to \(1+Q\); this neither proves all P0--P3 nor adopts those modes as standard local KS, and replacing \(Q\) by the actual modified chiral zero-mode energy fails the two-loss test (95.9).
```

### CA-81 — generator-contract boundary (optional)

File: `report/sections/81_cft_machine_oar_contract.tex`.
Append after `verified applications of existing theorems.` at line 114.

```latex
\emph{Amendment (2026-10-25, round 3):} CA-95 distinguishes graph-residual convergence, subcritical collar regularity and geometric Ward realization (95.2, 95.5--95.7); these remain separate requirements, with no correction to VR-1 itself.
```

### CA-88 — R2 certificate cell

File: `report/sections/88_layered_targets.tex`.
Append inside the R2 certificate cell after `78.13 [proposal, split by CA-89]` at line 105, before the row terminator.

```latex
\emph{Amendment (2026-10-25, round 3):} CA-95 adds uniform probe-form lifting [derived, 95.1], W2 from G1--G3 [conditional, 95.2] and the false subcritical-collar converse [negative, 95.5], without advancing a general target rung.
```

### CA-88 — CA-89 results-table comment

File: `report/sections/88_layered_targets.tex`.
Append inside the comment cell after `89.3, 89.7 [negative]` at line 148, before the row terminator.

```latex
\emph{Amendment (2026-10-25, round 3):} CA-95 supplies conditional G1--G3 lifting and a negative collar converse; the placement remains (full per family; category-free; \(\to\mathsf R2\)).
```

### CA-88 — D2-C first lemma

File: `report/sections/88_layered_targets.tex`.
Append after `\(K=1+E_N\) (D2 INTEGRATION:117--121).` at line 186.

```latex
\emph{Amendment (2026-10-25, round 3):} The first lemma is now CA-95 Target 95.12, quantitative two-ordering endpoint realization; 95.8 supplies only a diagonal modified-CAR calibration, so W2 remains an assumption of transfer, selection proper stays open, and D2-C reaches no \(\mathsf R3\).
```

### CA-88 — optional CA-78/79 calibration pointers

File: `report/sections/88_layered_targets.tex`.
Append inside CA-78's comment after `finite selection equations; interface lemmas [cond.]; D2-C` at line 142.

```latex
\emph{Amendment (2026-10-25, round 3):} See CA-95 Lemma 95.1 for the explicit two-loss form constant and uniform physical probe interpretation; the layer and rung tags are unchanged.
```

Same file. Append inside CA-79's comment after `shell certificate 79.2 [cond.]; no-go 79.8; \(c>1\) growth` at line 143.

```latex
\emph{Amendment (2026-10-25, round 3):} CA-95 95.8--95.9 adds diagonal modified-fermion calibration and a control obstruction, leaving all P0--P3 unverified and the rung tags unchanged.
```

Same file. Append after `lemma:} P0--P3 for the sourced quasi-free calibration (INTEGRATION:103--111).` at lines 204–205.

```latex
\emph{Amendment (2026-10-25, round 3):} CA-95's three diagonal modified-CAR bounds are available for this first test, but are not an all-bracket P0--P3 certificate or an \(\mathsf R2\)/\(\mathsf R4\) promotion.
```

### CA-88 — preserve round-2 verdict, add round-3 pointer

File: `report/sections/88_layered_targets.tex`.
Append after `Next: probe-word Ward-to-residual Lemma 89.L.` at line 240, within that item.

```latex
\emph{Amendment (2026-10-25, round 3):} F4 retains the separate verdict WEAKER-RESULT-PROVED (CA-95; F4 REVIEW:1--42), with G1--G2 still open, the subcritical-collar converse false and Target 95.12 next; the round-2 grade and date above are unchanged.
```

No amendments are proposed to the R0/R1/R3/R4/R5 cells, WT-1/VR-1 row,
same-system rule, chirality setting definition, fidelity or reflection-positivity
theorems. The AP calibration is explicitly a chiral family on a circle, not
an open-chain construction (`INTEGRATION.md:55–65,106–108`).

## 6. One-line `INDEX.md` fragment

```markdown
| `explorations/2026-10-25-astra-r3/F4-ward-to-residual/checks/` | F4 / CA-95: uniform-probe Gram, local KS converse and modified-CAR diagonal calibration; `fermion_check.py`, `ks_converse_check.py`, `reviewer_qutrit.py`, `review_rerun.py`, `review_independent.py`, source hashes/manifests, JSON and GREEN/RED outputs. Verdict WEAKER-RESULT-PROVED: explicit analytic bounds and negative converse; G1–G2 unverified, no general R2 promotion. Commands: F4 NOTE:629–647 and REVIEW:180–211 (Python, `PYTHONDONTWRITEBYTECODE=1 OPENBLAS_NUM_THREADS=1`); existing bundle, not a new run. |
```

## 7. Worklog paragraph and acceptance

**Verdict (2026-10-25): F4 — WEAKER-RESULT-PROVED; lifted as CA-95 with no general target-rung promotion.**

**Context → changes:** lifted the reviewed probe-word Ward package into `report/sections/95_probe_word_ward_lifting.tex` and prepared its registration without editing shared integration files. **Results and choices:** 95.1/95.6 give the explicit uniform probe-form two-loss inequality and the critical analytic converse [derived; any; category-free; ->R2]; 95.2/95.3 give W2/A4 only under G1–G3 and the existing A2/KS-matching hypotheses [conditional; full per family; category-free; ->R2]; 95.4/95.5 refute fixed-word and subcritical-collar converses [negative; any/full; category-free; ->R2 obstruction/trivial zero R2 respectively]; 95.7's interpolation remains conditional on a uniform subcritical envelope. The source-modified AP CAR diagonal bounds and central normalization are calibrations [derived; one chiral AP family; category-free; ->R2], with the exact chiral-energy obstruction [negative, same tags]; the inherited full tile compiler is 95.11 [derived; any locally/full with closure; L0; ->R2]. **Frictions/corrections:** the brief omitted endpoint/product and cylinder-contact geometry, conflated density with uniform quotient/Gram bounds, asserted a false auxiliary-control converse and treated an ambiguous energy and modified chiral backend as a geometric standard-KS certificate. Retained the review's “sufficiently large N” qualifier in the collar witness and extended the (ar) locator through line 1562. **Acceptance:** the copied-preamble temporary wrapper compiles with `latexmk -pdf -interaction=nonstopmode -halt-on-error`; the independent read-only Gram/current/heat checker passes. Full-report registration gates remain for the authorized integrator; no root PDF, shared maps, conventions, other shards, commits or network were touched. **Pointers/open:** F4 `NOTE.md`, `REVIEW.md`, `INTEGRATION.md`, `checks/`, and `SHARD_META.md`; the sole next target is quantitative two-ordering endpoint realization, 95.12 [conjectural; full per family; category-free; ->R2], with cylinder comparison and accumulated Ward errors still separate obligations.

Compile wrapper: `/tmp/ca95-wrapper-6x9gcr_1/wrapper.tex`, copied exactly from
`report.tex` before `\begin{document}` and followed by the absolute shard
input and document end. Build from that directory:

```bash
latexmk -pdf -interaction=nonstopmode -halt-on-error wrapper.tex
```

Independent check rerun (no artifact writes):

```bash
PYTHONDONTWRITEBYTECODE=1 OPENBLAS_NUM_THREADS=1 python3 explorations/2026-10-25-astra-r3/F4-ward-to-residual/checks/review_independent.py
```

The source does not define new LaTeX macros. The displayed finite examples
cite their existing producer and raw bundle; the checks support those
invariants and do not verify G1–G2 or prove asymptotic rates from three sizes.

Final acceptance: **260 shard lines** (cap 280), 12 consecutive statements
with individual grades and all three tags, one next target, mirrored header
metadata and 13 verified amendment anchors. The wrapper produces five pages
with no undefined controls, LaTeX errors, overfull or underfull boxes.
The reviewed NOTE SHA256 remains
`5319c0852560ccf2432ac4986d931e9e4f3c299300c48e1774e1e400f12661cc`.
