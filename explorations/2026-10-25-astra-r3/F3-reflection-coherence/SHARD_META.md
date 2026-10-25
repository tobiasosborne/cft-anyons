# CA-98 registration package — 2026-10-25

Prepared for later integration; none of the destination files below was edited.
Review verdict: **WEAKER-RESULT-PROVED** (`REVIEW.md:1-10`). Grades and the
reviewer's explicit OS repair are preserved. F3-S1–S9 map to 98.1–98.9;
F3-S10 is the examples table. The single next target is 98.10.

## 1. Paste into report/SHARD_CATALOG.md

```markdown
## `CA-98-CANONICAL-SEAMS-REFLECTION-COHERENCE`

- Source: `report/sections/98_canonical_seams_reflection_coherence.tex`
- Title: Canonical Seams, Reflection Defects, and Conditional Spatial Positivity
- Summary: A canonical natural algebraic seam is derived at L1, with exact dual-oriented sewing, self-duality defects and a separate L0 self-duality seam; reflection coherence remains conditional, finite positive translated forms admit scalar normalization, and identity histories refute unitary conjugacy of directional transfers, including explicitly defined even-torus OS quotients.
- Keywords: canonical seam, reflection coherence, conjugate duality, Frobenius-Schur sign, pivotal twist, bent kernel, spatial reflection positivity, Osterwalder-Schrader quotient, directional transfer, F3
```

## 2. Paste into report/README.md

```markdown
| 98 | `CA-98-CANONICAL-SEAMS-REFLECTION-COHERENCE` | `report/sections/98_canonical_seams_reflection_coherence.tex` | Canonical Seams, Reflection Defects, and Conditional Spatial Positivity |
```

## 3. Paste into report.tex

```latex
\include{report/sections/98_canonical_seams_reflection_coherence}
```

## 4. Proposed CONVENTIONS.md entries

Checked the (a)–(aw) catalog and the overlapping entries (b), (c), (r),
(ai), (ak)–(am), (as), (at), (au). These scoped additions reuse raw cups,
unitary spherical duality, the inverse-Gram convention, the existing bend
and layer tags. They do not repeat their definitions as new conventions.
Letters (ax) onward are paste-ready proposals for this isolated shard;
coordinate lettering with other round-3 packages at registration.

```markdown
## (ax) Conjugate-dual mirrors and pointed-check orientation (2026-10-25)
**Scope:** CA-98; extends (r), (al), (as), (au) without changing their gauges.
**Choice:** `D(X)=X^vee`, `D(f)=(f^vee)^dagger`, with the unitary anti-monoidal
tensorator oriented to reverse cut-word order; `j_X:X->D²X` is the canonical
pivotal unitary. D is covariant and conjugate-linear on morphisms. Its cut
map goes from `Hom(a,W)` to `Hom(Da,DW)`; neither external label is silently
identified. The supplied braiding uses `c_(X,Y):X⊗Y->Y⊗X`, extending (as)'s
displayed direction; use its inverse only where written. The examples use
 `alpha_(a,b,c):a⊗(b⊗c)->(a⊗b)⊗c=omega(a,b,c)` on labels `0,1,2` modulo 3,
`zeta=exp(2 pi i/3)`. Their omega, beta and r are exactly the displayed
calibration data, not a global F/R table.
**Known clash:** D is not the (ak)/(ao) tile basis D_alpha or (ar)'s discrepancy.
The categorical mirror is not the complex-linear parity P of (at); the
pointed example's braiding r(a,b) is not a self-duality r_X.
**Source:** `explorations/2026-10-25-astra-r3/F3-reflection-coherence/NOTE.md:33-46,215-259,643-649`;
`REVIEW.md:71-74,172-190`; `references/text/PenneysUnitaryFusionCategories.md:259-288,682-715,992-1008`.
**Sweep status:** CA-98 only; no global change to (b)'s earlier scoped R-data.

## (ay) Canonical cup correction and the two algebraic seams (2026-10-25)
**Scope:** CA-98, using (au)'s W_±, oriented cups and algebraic seam equation.
**Choice:** `lambda_a=d_a^(-1) ev_a c_(a,Da) coev_a`, `p_a` the canonical
isotypic projection of O, `t_O=sum_a lambda_a^(-1) p_a`, and
`s_can=c_(O,DO)(t_O⊗1_DO)`. The typed Drinfeld map is
`u_O=(ev_O⊗1_(D²O))(c_(O,DO)⊗1_(D²O))(1_O⊗coev_(DO))`;
`t_O=u_O^(-1)j_O`. In the stated self-dual ribbon convention,
`lambda_a=nu_a R_1^(aa)` and `t_a=nu_a (R_1^(aa))^(-1)=theta_a`.
For a separately declared unitary `psi:O->DO`, use instead
`s_psi=psi⊗[j_O^dagger D(psi)]`. Both seams are fixed independently of h;
“algebraic seam” includes only unitarity and the cup equation, never RH.
**Known clash:** t_O is a cup correction, not time step t or the relative
half-braiding t_Y of (as). u_O is the Drinfeld morphism, distinct from the
raw cup u=coev_O used in CA-92/CA-98. Uniqueness concerns the cup correction,
not the residual seam gauge of (au). The two seam choices need not agree.
**Source:** `explorations/2026-10-25-astra-r3/F3-reflection-coherence/NOTE.md:56-152,310-329`;
`REVIEW.md:56-65,79-81`; `literature/md/2201.00192/2201.00192.md:264-268`;
`references/category-theory/RowellStongWang2009Classification/source/RSWfinal3.tex:2311-2314`.
**Sweep status:** CA-98 only; proposed pointers to CA-92, CA-88.

## (az) Self-duality defects and source-charge comparison (2026-10-25)
**Scope:** CA-98, typed self-dual objects/words and their named observable algebras.
**Choice:** For unitary `r_X:X->DX`, set `rho_X(A)=r_X^dagger D(A) r_X` and
`z_X=r_X^dagger D(r_X^dagger) j_X`. Observable involutivity means
`rho_X²=Ad(z_X)` acts identically on the named algebra: centrality in
`End_C(X)`, or membership in the commutant of a smaller declared algebra.
For identified self-dual simple-charge cuts,
`J_(a,W)(f)=r_W^dagger D(f) r_a`, `J_(a,W)²(f)=z_W f z_a^dagger`.
The FS sign `nu_X` is the (r) simple-object sign, not a new normalization;
where both defects are signs the cut square is their ratio. Non-self-dual
external charges use explicitly paired comparisons, never an invented r_a.
Each admitted word W needs its own observable-defect check. “Real
self-duality” in Target 98.10 means unitary psi with `psi^vee j_O=psi`.
**Known clash:** rho_X is a conjugate-dual action, not a state; z_X is a square
defect, not a Fourier phase or Virasoro cocycle. These are distinct from the
normalization scalar varrho in (bc).
**Source:** `explorations/2026-10-25-astra-r3/F3-reflection-coherence/NOTE.md:261-308`;
`REVIEW.md:75-78,192-208`; `references/text/PenneysUnitaryFusionCategories.md:917-941`.
**Sweep status:** CA-98 only; mirror/parity distinction retained in CA-91.

## (ba) Intrinsic seam-Hermiticity involution (2026-10-25)
**Scope:** CA-98; K_s and rot retain (au)'s meaning.
**Choice:** `sharp_s=K_s^(-1) ∘ dagger ∘ K_s`, where `K_s^(-1)` is the inverse
linear map between categorical morphism spaces, not inversion of one bent
kernel matrix. sharp_s is a conjugate-linear involution; no multiplicative
variance or geometric sewing action is part of its definition. In the
examples, un-subscripted sharp means sharp_(s_can), E_(ij,kl) is the matrix
unit from ket(kl) to ket(ij), and P_ij=E_(ij,ij). Coordinate conjugation K_0,
factor swap P, conjugate-dual D_2 and sharp_flip are separate maps.
**Known clash:** This sharp is not the Gram-metric adjoint a^sharp of (aa).
The all-complex-tile fixed-point iff in 98.6 is stronger than an iff on a
restricted physical tile grammar.
**Source:** `explorations/2026-10-25-astra-r3/F3-reflection-coherence/NOTE.md:182-212,331-384,648`;
`REVIEW.md:68-70,82-86,100-108`.
**Sweep status:** CA-98 only; proposed clarification of CA-92 Remark 92.7.

## (bb) Whole-history reflected-pairing certificate (2026-10-25)
**Scope:** CA-98 Proposition 98.7 and proposed applications of CA-92 Proposition 92.4.
**Choice:** G1 is the reflected-half-amplitude adjoint identity RH. G2 is
compatibility of the disjoint crossing identifications under tensoring,
reassociation and charge restriction with the same cut identification,
using (al)'s inverse Gram and the adjoint reverse identification. Include
all boundary and flux labels. G3 fixes the linear tile 1+t h independently
of N,M, or a family with a common Schur step bound; extra seam insertions
belong inside positive reflected factorizations, and bulk/outer boundaries
are paired by G1. The Schur variables e,Q,A,a,b,C,C^+ retain CA-92:125-135's
meaning. This certificate concerns linear histories, not exact exponentials.
**Known clash:** G1–G3 name hypotheses; G without a numeral remains the cut
Gram matrix. A braiding supplies s_can, not G1/G2.
**Source:** `explorations/2026-10-25-astra-r3/F3-reflection-coherence/NOTE.md:386-422`;
`REVIEW.md:87-88`; `report/sections/92_spatial_seams_and_reflection_positivity.tex:96-149`.
**Sweep status:** CA-98 only; no automatic coherence asserted for CA-86 histories.

## (bc) Finite OS normalization (2026-10-25)
**Scope:** CA-98 Lemma 98.8; finite, category-free.
**Choice:** Start with finite insertion space V, nonzero PSD Hermitian q_0,
shift tau:V->V and PSD compatible q_1(f,g)=q_0(f,tau g). On
V/rad(q_0), T[f]=[tau f]; normalize tau and T by
`varrho >= max(1,||T||)` to obtain a positive contraction. This scalar is
finite-volume data: no uniform bound and no prescribed zero-energy vacuum
are part of the convention. A logarithm on the whole quotient requires
injectivity; otherwise only the positive spectral support admits it, with
no claim about preserving arbitrary zero-time probes.
**Known clash:** varrho is unrelated to rho_X of (az). Positive q_0 alone
is not a compatible translated-form certificate.
**Source:** `explorations/2026-10-25-astra-r3/F3-reflection-coherence/NOTE.md:424-454`;
`REVIEW.md:89-91`; `report/sections/92_spatial_seams_and_reflection_positivity.tex:181-195`.
**Sweep status:** CA-98 only; proposed weakening of CA-92's finite upper-bound hypothesis.

## (bd) Identity-history OS counterexample conventions (2026-10-25)
**Scope:** CA-98 Negative 98.9 only; these are local example choices, not global restrictions.
**Choice:** O=1^(direct-sum d), d>=2, h=0, periodic N sites and M slices;
for the OS repair require even N,M. Raw unnormalised weight is
`w(sigma)=product_(x,r) delta_(sigma[x,r],sigma[x,r+1])`, all indices periodic.
Insertions are all indicator functions of half histories; reflections are
`x -> N-1-x` and `r -> M-1-r`. For spatial halves, c(a) is one iff each
column is constant in time; `q_(0,x)(a,b)=c(a)c(b)`. Read the second temporal
half in reflected time order, set c_t(a) to enforce constant columns within
that half, and use `q_(0,t)(a,b)=delta_(a,b)c_t(a)`. Their quotient dimensions
are 1 and d^N by the explicit contractions, not by identifying transfer rank
with an OS radical. The symmetric raw column transfer uses
`v_sigma=product_r delta_(sigma_r,sigma_(r+1))`, `T_x=v v^dagger`.
**Known clash:** c(a), c_t(a) are indicator functions, not a braiding or a
central charge; v is a column-history vector, not the categorical cup v of
CA-98's general proofs. The obstruction concerns carrier intertwiners,
not unitary reshuffling on Hilbert–Schmidt matrix space.
**Source:** `explorations/2026-10-25-astra-r3/F3-reflection-coherence/NOTE.md:456-502`;
`REVIEW.md:92-140`; `checks/review_history.py` and `checks/review_history_output.txt:2-20`
in the same exploration package.
**Sweep status:** CA-98 only; no assertion about arbitrary OS forms, odd sizes,
fixed-plane insertions or changed boundary conditions.
```

## 5. Dated amendment pointers

All are proposals, with exact existing anchor text. Append at the indicated
sentence or cell (inside the cell before its row terminator where stated).
Keep the existing theorem/review grades. Each amendment inherits the
explicit tags and grades of the cited CA-98 statement.

### CA-92: individual seam

File: `report/sections/92_spatial_seams_and_reflection_positivity.tex`

Anchor text to append after:
```latex
Self-duality need not exist (Penneys:917).
```
Exact sentence:
```latex
\emph{Amendment (2026-10-25, round 3):} Theorem 98.1 derives the individual algebraic seam at \(\mathsf L1\), with the positive pivotal-twist correction, closing this formula gap while leaving (RH) extra data.
```

### CA-92: Hermiticity reflection

File: `report/sections/92_spatial_seams_and_reflection_positivity.tex`

Anchor text to append after:
```latex
``full; chiral only with a twisted reflection'' (REVIEW.md:248--254; E2 link: INTEGRATION.md:100--105).
```
Exact sentence:
```latex
\emph{Amendment (2026-10-25, round 3):} Statements 98.2--98.6 separate the dual-oriented mirror, fixed-cut square defects and \(\sharp_s\); the proposed automatic conjugate-dual Hermiticity iff is false, and Target 98.10 supplies the narrower real-self-duality two-tile target.
```

### CA-92: old coherence target

File: `report/sections/92_spatial_seams_and_reflection_positivity.tex`

Anchor text to append after:
```latex
\(\mathsf R0^u\) (CA-88:104).
```
Exact sentence:
```latex
\emph{Amendment (2026-10-25, round 3):} An individual seam is derived in 98.1/98.4, but arbitrary self-duality and automatic canonical-seam reflection are obstructed by 98.3/98.6; replace this target by the conjectural real-self-duality two-tile Target 98.10, retaining G1/G2 in the conditional history result 98.7.
```

### CA-92: finite OS normalization

File: `report/sections/92_spatial_seams_and_reflection_positivity.tex`

Anchor text to append after:
```latex
a separate axiom (:4616--4642).
```
Exact sentence:
```latex
\emph{Amendment (2026-10-25, round 3):} Lemma 98.8 derives \(q_1\le q_0\) after finite scalar normalization once \(q_1\) is positive and compatible; shift closure and construction of that translated form remain unproved for a general strip.
```

### CA-92: whole-history directional transfers

File: `report/sections/92_spatial_seams_and_reflection_positivity.tex`

Anchor text to append after (before clause (iii)):
```latex
E3(b) is false only in its literal clause (REVIEW.md:174--184).
```
Exact sentence:
```latex
\emph{Amendment (2026-10-25, round 3):} Negative 98.9 refutes unitary conjugacy of complete directional transfers on cut carriers, including the explicitly defined even-torus all-insertion OS quotients, while equality of closed-network contractions and the distinct possibility of Hilbert--Schmidt unitary reshuffling survive.
```

### CA-80: coverage of spatial sewing

File: `report/sections/80_lattice_sewing_and_fidelity_certificate.tex`

Anchor text to append after:
```latex
(a1) and (a4) are untouched.
```
Exact sentence:
```latex
\emph{Amendment (2026-10-25, round 3):} Theorems 98.1--98.2 derive an individual \(\mathsf L1\) seam and dual-oriented leg sewing, while whole-history spatial RP remains conditional on (RH) and compatible cut identifications in 98.7.
```

### CA-75: Link (a2)

File: `report/sections/75_integration_map.tex`

Anchor text to append after:
```latex
positivity, CA-92 Thm.~92.3 [cond.\ on \(s\), (RH)]; this sewing question stays open.)
```
Exact sentence:
```latex
\emph{Amendment (2026-10-25, round 3):} Theorem 98.1 removes the individual-seam declaration at \(\mathsf L1\), without closing this spatial-sewing or anomaly-line limit question.
```

### CA-91: antiunitary reflection

File: `report/sections/91_parity_and_chiral_delineation.tex`

Anchor text to append after:
```latex
nothing.  Checked exactly at \(N=5,6\) (\path{review_raw_output.txt}:7--8).
```
Exact sentence:
```latex
\emph{Amendment (2026-10-25, round 3):} The dual-oriented mirror in 98.2 respects leg sewing, but 98.3/98.6 prevent its automatic identification with the canonical-seam reflection; it does not replace Theorem 91.1's complex-linear parity or imply anomaly balance.
```

### CA-91: conjugate-dual mirror

File: `report/sections/91_parity_and_chiral_delineation.tex`

Anchor text to append after:
```latex
It doubles the theory; it supplies no state or mode estimate.
```
Exact sentence:
```latex
\emph{Amendment (2026-10-25, round 3):} Theorem 98.2 supplies the inverse-Gram leg-sewing comparison, while 98.3/98.6 distinguish this oriented mirror from an automatically involutive canonical-seam reflection, without changing the complex-linear parity requirement.
```

### CA-88: CA-92 data/comment cell and category-free OS

File: `report/sections/88_layered_targets.tex`

Anchor text to append after (in the CA-92 row's final cell):
```latex
\(F\circ\dagger\) crossing, perpendicular commutator ill-typed [negative]
```
Exact sentence:
```latex
\emph{Amendment (2026-10-25, round 3):} Split this entry into 98.1/98.5 (any; \(\mathsf L1\); finite \(\to\mathsf R3\), derived), 98.4 (any; \(\mathsf L0+\psi\); finite \(\to\mathsf R3\), derived), 98.7 (full; \(\mathsf L0\)+coherent reflected pairing; finite \(\to\mathsf R3\), conditional even at \(\mathsf L1\)), and 98.8 (any; category-free; finite \(\to\mathsf R3\), derived normalization only).
```

### CA-88: formerly unsourced L1 seam

File: `report/sections/88_layered_targets.tex`

Anchor text to append after:
```latex
expected at \(\mathsf L1\) (ribbon identity not locally sourced); it can fail for non-self-dual \(O\) in non-braided \(\Cc\) (\(\mathrm{Vec}_{S_3}\)).
```
Exact sentence:
```latex
\emph{Amendment (2026-10-25, round 3):} The individual seam at \(\mathsf L1\) is now derived by 98.1 as \(s_{\mathrm{can}}=c_{O,DO}(t_O\otimes1)\), \(t_O=u_O^{-1}j_O\); the \(\mathsf L0\) multiplicity criterion and non-braided obstruction persist, and full reflection coherence still needs G1/G2 of 98.7.
```

### CA-88: R3 certificate cell

File: `report/sections/88_layered_targets.tex`

Anchor text to append after (in the R3 certificate cell):
```latex
D2-C's conclusion; ingredients 80.2--80.5, 92.3/92.5 (spatial RP, finite), 78.9--78.11; no categorical instance
```
Exact sentence:
```latex
\emph{Amendment (2026-10-25, round 3):} Add conditional spatial RP 98.7 and derived finite normalization 98.8 as ingredients only; \(\mathsf R3\) and its analytic/net requirements remain unestablished here.
```

### CA-88: historical E3 verdict

File: `report/sections/88_layered_targets.tex`

Anchor text to append after (inside the E3 item):
```latex
Next: reflection-coherence lemma.
```
Exact sentence:
```latex
\emph{Amendment (2026-10-25, round 3):} CA-98 preserves this historical grade, derives the individual \(\mathsf L1\) seam, refutes the automatic reflection clauses in 98.6, retains conditional whole-history RP in 98.7, and replaces the next target by conjectural Target 98.10.
```

CA-86 needs **no amendment**: it supplies the identity histories used in 98.9.
For CA-88, leave the R0^c/R0^u and CA-90 cells, R1/R2, R4/R5 and fidelity
sub-rungs unchanged; no cell moves up a rung. CA-80's temporal positivity
and fidelity grades are unchanged. Do not copy the older E3 package's
“coherent s automatic” phrase. CA-92 is near its cap: during global
registration keep these as short pointers or consolidate them, rather than
exceeding 280 lines. The proof details belong in CA-98.

## 6. One-line INDEX.md fragment

```markdown
| `explorations/2026-10-25-astra-r3/F3-reflection-coherence/checks/` | CA-98 finite seam/duality/FS, Schur, composition and directional-transfer calibrations: `PYTHONDONTWRITEBYTECODE=1 python3 -B explorations/2026-10-25-astra-r3/F3-reflection-coherence/checks/review_rerun.py`; six normal checks and five rejected mutations, author and independent `*_output.txt` / mutation outputs, `provenance.json` and `review_rerun_manifest.json`; explicit even-torus OS repair, no whole-history coherence or continuum certificate. |
```

## 7. Worklog paragraph and acceptance record

**Verdict (2026-10-25): WEAKER-RESULT-PROVED, CA-98.** Context: lift the reviewed
F3 note without changing its grades or the shared integration files. What
changed: one shard and this paste-ready registration package. Headline:
98.1 derives the individual canonical seam (any; L1; finite ->R3), 98.2–98.5
derive oriented sewing, exact square defects, the L0+psi seam and intrinsic
Hermiticity; 98.6 refutes automatic involutivity/Hermiticity/composition
claims (any; L0/L1; finite); 98.7 remains conditional (full; L0+G1–G3;
finite ->R3); 98.8 derives finite normalization (any; category-free;
finite ->R3), with categorical application conditional; 98.9 refutes
carrier-level unitary crossing (full; L0, already symmetric L1; finite),
including the reviewer's explicitly defined even-torus OS forms. Why:
keep algebraic seam, dual-oriented mirror and pulled-back adjoint distinct;
no CA-88 cell rises a rung. Corrections/frictions: the brief conflates
these maps, arbitrary psi can have a noncentral square, charge-cut signs
are ratios, conjugate duality is covariant, and the no-go does not refute
Hilbert–Schmidt unitary reshuffling; nonzero Z3 H^3 classes are not braided
calibrations, and the seam convention is (au), not (at). The note's
post-OS gap is repaired only for the specified all-half-history forms,
never by transfer rank alone. Acceptance: temporary preamble-only wrapper
compiles; six normal check outputs match retained files byte-for-byte and
five mutations fail at their intended assertions, using read-only reruns.
Only the requested shard and metadata were written in the repository;
no root report build, registration edits, commits or network. Pointers:
CA-98; F3 NOTE/REVIEW/INTEGRATION; the checks bundle; conjectural Target
98.10 is exactly the real-self-duality two-tile reflection target, with
translated forms and continuum reconstruction still open.

Wrapper command (run in the temporary directory, not at the repository root):
`latexmk -pdf -interaction=nonstopmode -halt-on-error wrapper.tex`.
The wrapper copies everything before `\begin{document}` from root
`report.tex` and inputs only the absolute CA-98 path. Wrapper artifacts:
`/tmp/ca98-wrapper-_l1e1gls/`. The registration fragments above remain pending;
the full report and shard-registration guard are global-integration gates,
not claimed to have passed in this isolated task.
