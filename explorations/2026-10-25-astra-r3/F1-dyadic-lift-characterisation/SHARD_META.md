# CA-96 registration package — 2026-10-25

Prepared from the reviewed F1 package. Only the new shard and this registration
package are written; the following canonical-file fragments are not applied.
The shard retains the brief's literal four-line opening, including
`SHARD-F1-dyadic-lift-characterisationWORDS`; a `SHARD-KEYWORDS` discovery alias
after the source comments supplies the same value for the existing guard.

## 1. `report/SHARD_CATALOG.md` entry

```markdown
## `CA-96-BLOCKED-DYADIC-LIFTS`

- Source: `report/sections/96_blocked_dyadic_lifts.tex`
- Title: Blocked Dyadic Lifts: Finite-Power Transport and the Failure of Single-Site Centrality
- Summary: Pointed transport on a fixed tensor power O^b over full <O> gives local unital dyadic lifts on the original algebras and exact vacancy insertion, with slack 2b-1. Noncentral group-graded sites and twisted abelian p-group families reach R0^u at bare L0; single-site centrality is neither necessary for lifts nor sufficient for transport. General characterization and higher rungs remain open.
- Keywords: blocked transport, dyadic lift, relative half-braiding, pointed object, vacancy swap, interval locality, Bratteli inclusion matrix, associator obstruction, finite abelian p-group, naturality, R0^u, Target 90.T, F1
```

## 2. `report/README.md` include-order row

```markdown
| 96 | `CA-96-BLOCKED-DYADIC-LIFTS` | `report/sections/96_blocked_dyadic_lifts.tex` | Blocked Dyadic Lifts: Finite-Power Transport and the Failure of Single-Site Centrality |
```

## 3. `report.tex` include

```latex
\include{report/sections/96_blocked_dyadic_lifts}
```

## 4. Proposed `CONVENTIONS.md` additions

Checked against (a)–(aw). Reuse (am)'s pointed object and projections, (r)'s
left bracketing, (t)'s odd-site placement, (as)'s interval-algebra support and
inverse-crossing direction, (aq)'s tags, and (an),(x)'s drift quantities.
The entries below add only the block, associator-coordinate and transported-choice
notation used in CA-96. They do not change an F/R gauge or a continuum convention.

```markdown
## (ax) Blocked pointed transport and dyadic geometry (2026-10-25)
**Scope:** CA-96, extending the supplied-transport construction of (as).
**Choice:** Fix `b >= 1` independently of chain length L, `P = W_b = O^{⊗b}`,
`xi = eta^{⊗b}`. Blocked H is the unitary family `t_Y: Y⊗P -> P⊗Y` on every
object and morphism of the full `D = <O>`, satisfying CA-90's unit, naturality,
tensor and point axioms with `(P,xi)` in place of `(O,eta)`. It is not merely
centrality of `[P]` or transport restricted to `<P>`.
Use block origin old site 1, `L = mb+q`, `0 <= q < b`, and `Q = W_q`.
The map `gamma_L` inserts P after each old P block, transporting across the
entire suffix including Q, then appends Q by tensoring its identity;
`v_block` denotes the corresponding pointed insertion. The categorical vacancy
swap is `T = (eta⊗1_O)p1(1_O⊗eta^dagger)` and
`S = p0⊗p0+p1⊗p1+T+T^dagger`. A fixed stable adjacent interleaving schedule
defines `U_s(1_{W_s}⊗eta^{⊗s}) = V_s`; no braid relation for S is assumed.
Let `U_L` be the product of the U_b on disjoint output cells and the U_q
on the final cell (omit q=0); `alpha_L = Ad(U_L) gamma_L`.
For support tracking write `f(s)=s+b floor((s-1)/b)`, `i(s)=floor((s-1)/b)`,
`a(s)=s-bi(s)`. The sufficient symmetric slack is `r=2b-1`, with output
interval endpoints clipped to `[1,2L]`; support retains (as)'s membership
meaning. At b=1 the sharper CA-90 bound r=0 remains available.
Coherence here means composition along dyadic scales, not compatibility with
arbitrary boundary extensions or placements. Blocked H includes no occupation,
translation, reflection or periodic-seam compatibility.
**Known clash:** P is a tensor-power object, not a corner projection P_n of
(an), and not the dual-pair root Y of (am). T and S here are finite vacancy
morphisms, not stress modes or modular matrices. The local regular object R
in Negative 96.3 is not braiding data.
**Source:** `explorations/2026-10-25-astra-r3/F1-dyadic-lift-characterisation/NOTE.md:38-53,59-176`;
`explorations/2026-10-25-astra-r3/F1-dyadic-lift-characterisation/REVIEW.md:48-57,84-115`.
**Sweep status:** CA-96 only; CA-90's single-site construction and its grading
statement retain their existing conventions and scope.

## (ay) Twisted abelian transport coordinates (2026-10-25)
**Scope:** CA-96 Theorems 96.5, 96.7 and Negative 96.6.
**Choice:** In unitary `Vec_A^omega` for finite abelian A, use additive grades;
0 labels the unit simple, never the zero object. The normalized unitary
3-cocycle `omega: A^3 -> U(1)` gives the associator
`(g⊗x)⊗y -> g⊗(x⊗y)` by multiplication by `omega(g,x,y)`.
Write `O = direct-sum_g M_g⊗g`, `m_g = dim M_g`, with `eta in M_0`.
The simple crossing `z_x: O⊗x -> x⊗O = t_x^{-1}` has blocks `rho_g(x)`;
matrix products act right first. Set
`beta_g(x,y)=omega(g,x,y)omega(x,y,g)/omega(x,g,y)` and use
`rho_g(y)rho_g(x)=beta_g(x,y)rho_g(x+y)`, `rho_g(0)=1`, `rho_0(x)eta=eta`.
The commutator phase is `kappa=beta_g(x,y)/beta_g(y,x)`.
For the construction put `c_g(x,y)=beta_g(y,x)` and
`R_g(x)v_t=c_g(x,t)v_(x+t)` on the |A|-dimensional regular basis.
`Q(a,b,c,d)` denotes the multiplicative pentagon quotient displayed in 96.7,
equal to 1; this is an exact monomial identity, not a logarithmic convention.
For |A|=p^d and exponent p^e, the sufficient block length is `b=p^(e+d-1)`;
`s=sum_g m_g[g]` is the group-ring element and `n=sum_g m_g` its total
multiplicity. The trilinear family uses `zeta=exp(2 pi i/p)`,
`omega(a,b,c)=zeta^(a_1 b_2 c_3)` on `(F_p)^3`.
**Known clash:** beta_g is a scalar multiplier, not CA-90's one-gap algebra
map beta_(M,s); Q(a,b,c,d) is not the tail object Q of (ax). The exponent
parameter d and the local order of kappa in 96.5 have separate scopes.
**Source:** `explorations/2026-10-25-astra-r3/F1-dyadic-lift-characterisation/NOTE.md:278-445`;
`explorations/2026-10-25-astra-r3/F1-dyadic-lift-characterisation/REVIEW.md:65-77,117-118`;
`references/text/PenneysUnitaryFusionCategories.md:284-288,319-321`;
`references/text/EtingofNikshychOstrikFusionCategories.md:45-51`.
**Sweep status:** CA-96 only; no R-symbol convention or category braiding is introduced.

## (az) Transported block choices under unitary equivalences (2026-10-25)
**Scope:** CA-96 Proposition 96.8.
**Choice:** F is a linear dagger-preserving strong monoidal equivalence with
unitary `T_(Y,Z):F(Y)⊗F(Z)->F(Y⊗Z)` and `T_0:1'->F(1)`. A unitary
`u:F(O)->O'` satisfies `eta'=u F(eta)T_0`. Keep b and transport the blocked H
datum and fixed schedule; multiplicity identifications are choices, not a
canonical selector. Set `J_0=T_0^dagger`, `J_1=u`,
`J_(L+1)=(J_L⊗u)T_(W_L,O)^dagger`, and `F_L(a)=J_L F(a)J_L^dagger`.
The transported crossing on image objects is
`t'_(F(Y))=(J_b⊗1)T_(P,Y)^dagger F(t_Y)T_(Y,P)(1⊗J_b^dagger)`;
extension is to every object of `D'=<O'>`, not to undeclared objects outside
that generated subcategory. Composition uses point identification `v G(u)`;
a pointed unitary monoidal isomorphism `lambda:F=>G` obeys `u_G lambda_O=u_F`.
**Known clash:** J_L here compares functor images of categorical words; it
is not a Hilbert-scale refinement J_N or an analytic control in (v).
**Source:** `explorations/2026-10-25-astra-r3/F1-dyadic-lift-characterisation/NOTE.md:452-517`;
`explorations/2026-10-25-astra-r3/F1-dyadic-lift-characterisation/REVIEW.md:78-82,104-106`;
`references/text/PenneysUnitaryFusionCategories.md:233,325-348`.
**Sweep status:** CA-96 only. This is covariance of chosen microscopic data,
not a new R5 selection or CFT-realization claim.
```

## 5. Dated amendment pointers

These seven pointers implement `INTEGRATION.md:70-111`. Each anchor is literal
text in the current named file. The CA-88 pointer consolidates its table/prose
locators (:103, :117–118, :149, :235, :260) in one paragraph outside a table;
the CA-76 pointer also covers Question 76.12 (:236–249). Keep the existing
theorems, (90.5), (90.6), grading statement and r=0 bound intact.

### CA-90 — Target 90.T

File: `report/sections/90_local_unital_lift.tex`.
Append after this anchor (end of Target 90.T):

```latex
\(\mathsf L0\) up to the associator equations (90.5).
```

```latex
\emph{Amendment (2026-10-25, round 3):} the proposed finite-slack deduction of \([O]\)-centrality is false: pointed transport on \(O^{\otimes b}\) over full \(\langle O\rangle\) suffices with \(r=2b-1\) on the original carrier, and the regular-plus-\(g\) family is a counterexample (CA-96, 96.2--96.4); general characterization and the original three-summand \(S_3\) carrier remain open, with finite-power transport extraction now Target 96.10.
```

### CA-90 — unchanged-side converse boundary

File: `report/sections/90_local_unital_lift.tex`.
Append after:

```latex
internal placement, where the left/right images are only lifts with unknown inclusion matrices (REVIEW:165--168).
```

```latex
\emph{Amendment (2026-10-25, round 3):} Proposition 90.2(b) retains its exact unchanged-side one-gap scope; its obstruction does not extend to all finite-slack dyadic lifts (CA-96, Negative 96.3 and Proposition 96.4).
```

### CA-88 — certificate, grid and next-target pointer

File: `report/sections/88_layered_targets.tex`.
Append after:

```latex
\(\mathsf R0^u\) at bare \(\mathsf L0\) is open (Target 90.T).
```

```latex
\emph{Amendment (2026-10-25, round 3):} finite-power pointed transport on full \(\langle O\rangle\) broadens the \(\mathsf R0^u\) certificate, bare-\(\mathsf L0\) existence is derived for the untwisted regular-plus-\(g\) and twisted finite abelian \(p\)-group classes, and single-site centrality is not necessary (CA-96, 96.2--96.7); Target 90.T's centrality deduction is refuted and its next-target pointer becomes Target 96.10, with no general characterization, new higher rung, periodic seam or occupation-compatible D1-C refinement established.
```

### CA-76 — local strict lift and state boundary

File: `report/sections/76_corner_to_wilson_bridge.tex`.
Append after the existing round-2 amendment:

```latex
\(\langle O\rangle\) suffices, no lift to \(Z(\Cc)\); one-gap lifts are obstructed when \([O]\) is not central (Proposition 90.2).
```

```latex
\emph{Amendment (2026-10-25, round 3):} CA-96 supplies local strict lifts under blocked H and in its specified bare-\(\mathsf L0\) families (96.2, 96.3, 96.7); Proposition 76.1 applies unchanged (96.9), while the state/witness conditions of Question 76.12 remain open.
```

### CA-75 — Link (b1)

File: `report/sections/75_integration_map.tex`.
Append after:

```latex
half-braiding on \(\langle O\rangle\) (CA-90 Thm.~90.1; braided \(\Cc\) suffices); (b1) is closed there, open at bare \(\mathsf L0\).
```

```latex
\emph{Amendment (2026-10-25, round 3):} local unital typing also holds with pointed transport on a fixed tensor power over full \(\langle O\rangle\), including the specified bare-\(\mathsf L0\) non-braided families (CA-96, 96.2, 96.3, 96.7); this does not close Link (b3).
```

### CA-68 — literal insertion

File: `report/sections/68_variable_n_refinement_maps.tex`.
Append after:

```latex
a local unital extension for pointed \(O\) with a relative half-braiding on \(\langle O\rangle\) is derived in CA-90 (Theorem 90.1).
```

```latex
\emph{Amendment (2026-10-25, round 3):} CA-96 Theorem 96.2 extends the local unital completion certificate to pointed blocked H on full \(\langle O\rangle\), preserving this literal \(V_L\) and the original algebras.
```

### CA-77 — field-algebra/state compatibility still open

File: `report/sections/77_pointed_carrier_invariants.tex`.
Append after:

```latex
with one state family satisfying WT-1 (CA-81).  Corner maps do not solve this.
```

```latex
\emph{Amendment (2026-10-25, round 3):} pointed blocked transport gives additional unital lifts of bare \(V\) (CA-96, Theorem 96.2), but does not solve this number-changing field-algebra/state-compatible refinement problem.
```

No amendment to CA-91–CA-94, fidelity equations or conformal sewing is licensed.
See `INTEGRATION.md:109-111`.

## 6. One-line `INDEX.md` fragment

```markdown
| `explorations/2026-10-25-astra-r3/F1-dyadic-lift-characterisation/checks/` | CA-96 finite-block dyadic lifts: exact Python baseline/mutation pairs (`run_checks.py`, `review_r3_rerun.py`; commands and hashes in `manifest.json`, `review_r3_rerun_manifest.json`) plus independent `review_r3_multiblock.py` (`review_r3_manifest.json`); four baselines and four intended failures recorded, and b=3 checks of 832 interval units/803076 entries with a tail-transport mutation rejected by locality despite exact V. Finite calibrations, not all-L proofs; scope/cutoffs in `README.md:22-39` and `../REVIEW.md:168-209`. |
```

## 7. Worklog fragment

**Verdict — 2026-10-25, CA-96:** **COUNTEREXAMPLE** to the brief's F1 equivalence;
the replacement sufficient theorem and family results are **derived**
(`REVIEW.md:1-9`, `INTEGRATION.md:17-29`); no load-bearing proof gap was found in the review.

**Context:** integrate the reviewed F1 note into one bounded report shard.
**What changed:** CA-96 records the vacancy swap and all-L finite-block theorem,
including exact original V, the q-tail and interval-membership bound r=2b−1
(derived; any/open; L0+blocked H; R0^u); regular-plus-g noncentral sites refute
(a)⇒(b),(c), and the trilinear associator family refutes (b)⇒(c) (negative;
any/open; bare L0 in the stated classes; derived R0^u witnesses). Every pointed
object over a normalized unitary twisted finite abelian p-group has a lift
with b=p^(e+d−1) (derived; any/open; bare L0 within that class; R0^u).
Transported-choice covariance is derived at R0^u, not R5; the CA-76 state
consequence remains conditional (any; L0+blocked H+states; →R1). The single
next target is finite-power transport extraction (96.10; conjectural; any;
L0; →R0^u). **Why these choices:** retain the original algebras and insertion,
state every grade and tag, and keep the full-D and all-L obligations visible.
**Frictions/corrections:** the brief needs a pointed O and pointed transport,
uses (ar) where (as), with (am),(t), is intended, extrapolates an unchanged-side
one-gap argument to refined sides, incorrectly treats single-site centrality
as necessary, and offers a false “characterization or needs L1” dichotomy;
the original three-summand S3 carrier remains open (`REVIEW.md:149-166`).
The reviewer also corrects NOTE:579's periodic/symmetry/canonical variants to
open/conjectural and restricts transported objects explicitly to D'=<O'>
(`REVIEW.md:99-115`). **Acceptance:** the standalone wrapper using only the
root preamble compiles; all ten statement headings carry the reviewed grades,
S/L/R tags and NOTE/REVIEW anchors. Existing mathematical-check evidence was
read, not rerun or overwritten. **Pointers:** CA-96; this SHARD_META package;
NOTE/REVIEW/INTEGRATION and the exact `checks/` bundle. Canonical registration,
the root PDF and the full report guard are deferred to the aggregate integration,
as explicitly required by this shard-only brief; no commit or network action.

## Wrapper validation

Wrapper directory: `/tmp/ca96-wrapper-dq93g5ko/`. The wrapper copies exactly
the part of `report.tex` before `\begin{document}`, then inputs the absolute
CA-96 shard path inside a document environment. Compile command from that directory:

```bash
latexmk -pdf -interaction=nonstopmode -halt-on-error ca96.tex
```

The delivered shard has 274 lines (hard cap 280). No new command definitions
or package declarations are introduced by the shard. Final validation passed:
`latexmk` exit 0, five PDF pages, no errors, undefined commands, overfull boxes
or underfull boxes. The metadata mirrors the header exactly; ten sequential
statement headings preserve the reviewed grades and all three tags; all seven
literal amendment anchors and the cited source ranges were checked. The first
anchor check caught a superscript-bracing mismatch in the CA-88 pointer; the
literal anchor was corrected and the complete check then passed.

The current NOTE SHA256 matches the version audited in REVIEW:
`fdd74095a2c9ea76651761dd1c2f4c535d09eca4f5585dfbe1ffffee79b27ed7`.
