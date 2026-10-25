# F6 skeptical review — 2026-10-25

GRADE: WEAKER-RESULT-PROVED

The corrected unmarked AF theorem is proved, including its scaled ordered
K_0 classification; I found no material false step in those proofs. The
original brief's stationary formula and exact fusion-ring recovery are
false. Its simultaneous interval/dilation reconstruction question is not
answered. F6-C3 instead recovers a supplied H from a substantially richer
marked record. That distinction prevents an overall PROOF-COMPLETE grade
against the brief; it is not an undisclosed gap in the claims the NOTE marks
proved. No counterexample to those corrected claims was found.

The initial INCOMPLETE skeleton was saved within ten minutes of the 05:28 UTC
start and replaced by this audit. NOTE.md was not edited. Its reviewed hash,
script hashes, commands, exit statuses and output hashes are recorded in
`checks/review_manifest.json`. Two read-only skeptical collaborators checked
the AF and refinement arguments; the judgments below were checked against
the actual files, not accepted from their reports alone.

## Per-step verdicts

Locators in this table refer to NOTE.md. Each nested step is listed separately.
VALID for a conditional implication means its assumptions are retained; it
does not mean those assumptions have been constructed on a lattice.

| Block / step | Line | Verdict and reason |
|---|---:|---|
| A `<1>1` | 81 | VALID. Orthogonal simple decomposition gives actual inclusion multiplicities, not just algebra dimensions; reversing the source's Hom direction uses dagger. |
| A `<1>2` | 95 | VALID. Nonzero O and positive dimensions prevent any source block from disappearing; the finite-block norm proves isometry. |
| A `<1>3` | 107 | VALID. Stable projection classes are precisely nonnegative block ranks, with identity vector m_L. |
| A `<1>4` | 115 | VALID, by its four explicit substeps. No K-theory continuity theorem is silently imported. |
| A `<2>1` | 119 | VALID. Spectral cutoff gives a finite-stage projection within 2 epsilon of p. Intrinsic and ambient spectra agree here: a nonzero finite spectral projection would obstruct an ambient inverse. |
| A `<2>2` | 125 | VALID. z−1=(q−p)(2p−1), zp=qz and polar normalization give the required unitary equivalence. |
| A `<2>3` | 133 | VALID. Both corner products are invertible; the finite polar partial isometry has initial p and final q. Stabilization is explicitly allowed. |
| A `<2>4` | 142 | VALID. Representatives and equivalences occur at finite stages; group completion and the positive cone therefore have the stated limit. |
| A `<1>5` | 148 | VALID. Common-stage witnesses prove directedness, unperforation and interpolation, even if group connecting maps have kernels. |
| A' `<1>1` | 170 | VALID. Zero-extension is compatible; eventual equality and eventual coordinate positivity prove injectivity and order reflection. |
| A' `<1>2` | 177 | VALID. A common later stage for both inequalities forces all coordinates outside S_K to vanish. |
| A' `<1>3` | 185 | VALID. Primitivity and absence of zero rows give an eventually full supported tail. |
| A' `<1>4` | 191 | VALID. The stationary d_y² measure turns no outgoing edges into no incoming edges, forcing dual closure. Pointing makes supports increase; reciprocity then proves primitivity. No commutative-ring assumption is used. |
| A' `<1>5` | 212 | VALID counterexample. An invertible cyclic generator gives C at every stage, whereas the unrestricted permutation system has group Z^q. |
| A' `<1>6` | 221 | VALID. Tensor generation alone does not make the chosen root an order unit of the full stationary group. |
| T `<1>1` | 240 | VALID. d^T N=lambda d^T fixes positivity, normalization and compatibility. The trace is unnormalized within each block. |
| T `<1>2` | 247 | VALID. Minimal-projection weights obey w_L=N^T w_(L+1); full support is used only eventually. |
| T `<1>3` | 252 | VALID. The convex-combination lower bound for m_L/lambda^L gives a uniform bound on r_L. |
| T `<1>4` | 266 | VALID. Oscillation contracts by 1−s delta<1; the s delta=1 case is separately covered. |
| T `<1>5` | 274 | VALID. Normalization fixes the constant to one; compatibility fixes earlier stages. |
| B0 `<1>1` | 307 | VALID. Matrix units identify every finite representation as copies of the defining representations. |
| B0 `<1>2` | 315 | VALID. Tb=c is exactly unitality; matching multiplicities give target-unitary conjugacy. |
| B1 `<1>1` | 326 | VALID. A unit-preserving based-ring isomorphism preserving [O] preserves all rooted incidence data. |
| B1 `<1>2` | 329 | VALID. Preserving block labels is essential and explicitly imposed before target inner conjugation. |
| B1 `<1>3` | 335 | VALID. The compatible isometric maps extend to the completion; no simultaneous interval marks are claimed preserved. |
| B2 `<1>1` | 354 | VALID. A surjective *-isomorphism preserves the unit and stable projection data. |
| B2 `<1>2` | 359 | VALID. Lift finitely many positive columns, then kill the finite-stage unit discrepancy later. Injectivity of the stage K_0 map is not assumed. |
| B2 `<1>3` | 369 | VALID. Finitely many column equalities hold at one later stage; B0 upgrades them to unitary conjugacy of finite algebra maps. |
| B2 `<1>4` | 375 | VALID by the ensuing zigzag construction, for finite-dimensional building blocks as used throughout this section. |
| B2 `<2>1` | 388 | VALID. Lifting the inverse group map and then conjugating the new target makes the first triangle exact. |
| B2 `<2>2` | 395 | VALID. Alternating lifts and conjugations produce increasing, hence cofinal, stage indices. |
| B2 `<2>3` | 402 | VALID. A new target conjugation leaves completed triangles unchanged; the next triangle proves injectivity of each map. |
| B2 `<1>5` | 409 | VALID. Exact triangles give inverse maps on the dense cofinal unions and therefore on the completions. |
| N1 `<1>1` | 438 | VALID for every finite group. Exactly one g solves xg=y; N=J_q is not a commutativity accident. |
| N1 `<1>2` | 445 | VALID. q^(-L) sum v is well-defined, surjective and order-reflecting; its zero-sum kernel is killed in one step. |
| N1 `<1>3` | 451 | VALID. Block-diagonal inclusion and diagonal replication give both exact interleaving triangles. |
| N1 `<1>4` | 462 | VALID. Vec with q unit summands has the same matrix limit but a rank-one fusion ring. All the advertised strengthened hypotheses hold. |
| N1 `<1>5` | 471 | VALID. The q^k matrix tower is a cofinal subsequence of the q tower; [O] is not recovered. |
| N2 `<1>1` | 484 | VALID. Simple-object permutation is a group isomorphism; normalized tensorator scalars force the displayed coboundary relation. |
| N2 `<1>2` | 501 | VALID. The stipulated cohomology obstruction rules out monoidal equivalence. Morita inequivalence is not claimed. |
| N2 `<1>3` | 505 | VALID. B1 matches the stage towers, and matching dimension weights also matches their traces. |
| C1 `<1>1` | 533 | VALID. Moving the last old strand first preserves crossing order on every shared strand; only disjoint crossings are interchanged. Associators are coherently retained. |
| C1 `<1>2` | 548 | VALID. The remaining factor acts outside the first L factors and cancels in conjugation. This is the required trailing square, not merely dyadic composability. |
| C1 `<1>3` | 554 | VALID. Inner conjugacy acts trivially on projection classes, so delta_*[v,L]=[N^L v,2L]=[v,L]. Trace invariance also follows. |
| C2 `<1>1` | 566 | VALID. U_(n+1)=j_n(U_n)B_n^dagger gives (9) exactly. The cofinal interpretation uses positive initial length L_0. |
| C2 `<1>2` | 579 | VALID. Compare with trailing diagrams only when both H data exist. There is no automatic-H assertion. |
| C2 `<1>3` | 584 | VALID. E-H and E-F supply actual witnesses. The isomorphisms need not preserve the extra simultaneous interval/trailing data. |
| C3 `<1>1` | 613 | VALID. Naturality for eta in the first variable, rather than the pointed condition in the second, gives t_O(eta tensor 1)=1 tensor eta. |
| C3 `<1>2` | 617 | VALID. h moves the first strand into the vacancy; Bj=jt_O and j^dagger j=1 prove the typed compression (10). |
| C3 `<1>3` | 622 | VALID. Tensoriality fixes t on powers; naturality fixes summands and direct sums. A' supplies positive-power exhaustion. |
| D `<1>1` | 659 | VALID. This is classification of the selected unmarked trailing output, not classification of every R0 construction. |
| D `<1>2` | 668 | VALID. An isomorphism-invariant decoder cannot distinguish two monoidally inequivalent inputs with identical marked-by-stages-and-trace outputs. |
| D `<1>3` | 679 | VALID. Rich R0 tensor marks already carry F; (10) carries H. The canonical trace alone does not restore F. |
| D `<1>4` | 688 | VALID conditional implication. Read CA-93's hypotheses literally, on the actual four-interval inclusion of its declared completely rational chiral net. No new R3/R4 instance follows. |
| D `<1>5` | 701 | VALID. CA-93's auxiliary normal state is not an AF trace or a physical vacuum certificate; the other analytic rungs remain independent. |
| E-F `<1>1` | 857 | VALID. The normalized cocycle pentagon and both scalar snakes check. The chosen rigidity maps are explicitly not substituted for the canonical positive spherical trace. |
| E-F `<1>2` | 867 | VALID. Every normalized coboundary is +1 at (1,1,1), but the cocycle ratio is −1; C_2 has no relabelling escape. |
| E-F `<1>3` | 872 | VALID. The only nontrivial tensor identity is 1=−i²; unitarity, naturality and the central point follow as stated. |
| E-F `<1>4` | 887 | VALID. Applies the general counterexample and diagram-isomorphism results without adding interval preservation. |
| E-H `<1>1` | 894 | VALID. The sign is bilinear, and a pointed block-scalar unitary cancels in the transport equation; it cannot change the g,g sign. |
| E-H `<1>2` | 902 | VALID. The chosen hop has opposite coefficients in the two crossings; direct matrix-entry rerun confirms them. |
| E-H `<1>3` | 908 | VALID counterexample. The mixed-length square fails despite each lengthwise map satisfying the finite construction. |

There is no numbered proof step to grade for the intermediate reconstruction
question: NOTE.md:636–644,811–827 explicitly leave it open. Treating either
(9) or (10) as a proof of that question would be **NOT A PROOF**. No such
inference is made in the NOTE. The conditional fidelity passage is likewise
not an existence proof for its assumptions.

## Corrected statement and honest tags

Let C be unitary fusion, O nonzero, D=<O>, W_0=1 and W_L=O^tensor L.
Use left-associated words and column incidence N[y,x]=dim Hom(y,x tensor O).
Put m_L=N^L e_1 and S_L=supp(m_L). Then:

1. **Derived (any; L0 plus declared O/open trailing geometry; R0^u).**
   The unital trailing AF algebra has scaled ordered group
   `lim (Z^{S_L}, Z_+^{S_L}, m_L; N restricted to S_(L+1) x S_L)`.
   Equivalently it is the order ideal generated by u=[e_1,0] in the full
   stationary group, with unit u. This invariant classifies the **unmarked
   limit**, not the marked filtration. For a pointed site, or a primitive N,
   the full stationary group is valid because the supported tail is full.
2. **Derived (any; L0; R0 with a compatible trace).** The rank-one trace
   weight is d_x/d_O^L; the block-identity weight is m_L[x]d_x/d_O^L.
   Primitivity gives uniqueness. On the fixed-H dyadic schedule the same
   family gives a zero-drift R1 instance, with no criticality or conformality.
3. **Derived/negative (any; L0; R0 information-loss theorem).** The output
   is computed from the based ring and [O], but does not reconstruct either.
   Same-ring inputs with matched site class [O] have isomorphic stage-filtered
   trailing towers; examples with inequivalent F also match the trace.
   This obstructs a universal
   tensor-category decoder through that record, not an enriched construction.
4. **Derived (any; L0+fixed pointed H; R0^u).** The CA-90 shuffle descends
   to an injective endomorphism delta of the trailing limit, delta_*=id and
   tau delta=tau. The abstract dyadic diagram, at L_n=2^n L_0 with L_0>=1,
   is isomorphic to the trailing cofinal diagram. Its bare limit adds no H/F
   discrimination. No continuous one-parameter family is supplied.
5. **Derived with marks (any; L0+H+pointed tensor/placement/compression
   record; R0^u).** For the fixed-H formula, `t_O=j^dagger alpha_2(h)i`
   and the marked tensor structure then determines H. This is not a converse
   reconstructing H from an arbitrary local lift, nor from interval algebras
   and delta alone. Both weaker-record questions remain open.
6. **Conditional (chiral or named chiral subnet; L0+L4 tensor,
   L1+L4 braided; R4 sector sub-rung conditional on R3).** On the same
   represented system, CA-93's fully faithful endpoint functor and normal
   expectation/exhaustion certificate with cost bound Dim(C) imply complete
   sector fidelity. The declared net is on a separable Hilbert space and the
   inclusions are its actual four-interval inclusion. No enriched characters,
   central-charge lift, particular CFT synthesis, or R5 coherence is obtained.

L0 includes F and dagger; it does not mean fusion coefficients alone. The
general proofs use no Fibonacci identity, self-duality or multiplicity-free
assumption. No periodic seam is constructed. Classification here is an
isomorphism theorem, not an asserted effective decision procedure.

## What the brief got wrong

- It omitted O!=0 and replaced the rooted supports by all simples at every
  level. An invertible cyclic generator gives K_0=Z, not Z^q.
- It conflated "computed from the fusion ring" with "recovers that ring".
  The regular-object family has the same q-type matrix limit as Vec with
  O=q·1; even [O] is lost under cofinal blocking q→q^k.
- It mixed the CA-71 corner placements with the trailing unital tower.
  CA-77:63–86 already distinguishes their incidence and their limits.
- The alpha_L have different finite source/target algebras. A simultaneous
  endomorphism needs square (7); dyadic composability alone does not give it.
  Powers of the resulting delta give a discrete semigroup, not a flow.
- "R0 remembers exactly the ring" and "F/R first enter at R1" are both
  false universal statements. Rich finite tensor marks already contain F/H,
  whereas the canonical trace can be identical for inequivalent associators.
- CA-93's state is auxiliary and normal on a specified von Neumann inclusion;
  it is not a generic prescription to encode F in an AF limit state.
- Convention (ar) is Ward-to-KS notation. The relevant crossing convention is
  (as). Canonical positive spherical dimensions are fixed by the based ring;
  arbitrary additional pivotal/ribbon marks are a separate issue.

## Reproducible checks and limits

Command from repository root:

```bash
python3 -I explorations/2026-10-25-astra-r3/F6-what-the-tower-remembers/checks/review_run.py
```

`checks/review_run_output.txt:1–9` records two restored runs with exit 0 and
five intended assertion failures with exit 1. The author's six invariant
groups reproduce; its trace/support/crossing mutations fail at the intended
assertions. Its original SHA256 inventory also verifies. Author outputs were
not overwritten.

The independent `checks/review_twisted_refinement.py:1–146` imports no author
code. It constructs each crossing by reassociation, local transport and
inverse reassociation, then builds the shuffle by adjacent swaps. In two
gauges of a three-grade cocycle instance it checks 81 pentagons, 27 H
identities, equation (8) on all 729 six-site words, square (7) on all 27
two-site categorical matrix units, and all 81 compression entries of (10).
All phases are exact exponents modulo 9; the second gauge has non-cancelling
associator factors. A missing conjugation fails (7); replacing the recovered
crossing by its inverse fails (10). Raw outputs are
`checks/review_twisted_green.txt:1–7`, `checks/review_twisted_dagger.txt:1–9` and
`checks/review_twisted_extraction.txt:1–9`. These are finite regression witnesses,
not proofs of AF classification, trace uniqueness or infinite reconstruction.

The author's finite integer-vector tests likewise do not compute an infinite
dimension group by enumeration; N1's kernel/order calculation supplies that
proof. No Julia, network, report rebuild or repository-wide mutation was used.

## Single sharpest next lemma

**Intermediate-record faithfulness (open; any/open geometry; L0+fixed H;
R0 information, no continuum rung).** For arbitrary pointed tensor-generating
inputs (D,O,eta,H), form
`R(D,O,eta,H)=(A_infinity, {A_[j,k]}_(1<=j<=k), delta)` using the trailing
limit and fixed-H shuffle. A record isomorphism is a *-isomorphism carrying
every named interval algebra onto its counterpart and intertwining delta.
No eta, h, i, j, corner-identification or concatenation marks are retained.
Prove that such an isomorphism forces equivalence of the pointed H inputs
(unitary tensor equivalence transporting the point and H), or exhibit two
inequivalent inputs with an explicit record isomorphism. To use (10), a
positive proof must first recover its missing marks up to that gauge.

This is one precise faithfulness question for a general class of inputs;
small categories may test it, but cannot replace its formulation. B2's AF
classification and delta_*=id do not answer it. A negative proof must preserve
all interval inclusions and delta simultaneously; separate diagram conjugacies
are insufficient. This is sharper than asking vaguely what "refinements add".

## Sources checked

All paths below are repository-relative. The cited shards were read whole;
the primary/research-source passages were inspected at the indicated anchors.
No load-bearing citation in the NOTE was found to assert a different result.

- `references/text/PenneysUnitaryFusionCategories.md:219–237`: orthogonal sums,
  polar decompositions and splittings; `:470–478,484–487`: semisimple blocks,
  fusion graph and reciprocity. The source uses Hom(x tensor O,y), while the
  NOTE uses Hom(y,x tensor O); dagger gives equal dimensions, not a transpose
  of the declared column incidence matrix.
- Same source `:277–288,319–338`: cocycle-twisted graded categories, unitary
  tensor structure and tensorator coherence; `:394–419`: coherent suppression
  of associators and ordinary duality; `:1010–1019`: positive spherical traces.
  These support the roles assigned; they are not AF classification sources.
- `references/text/EtingofNikshychOstrikFusionCategories.txt:1435–1450,1459–1487`:
  Perron statement, positive dimension character and uniqueness; `:1700–1706`:
  unitary implies pseudo-unitary, positive dimensions equal FP dimensions.
  The NOTE proves its own primitive contraction instead of importing a
  spectral-gap theorem absent from the first range.
- `references/text/EtingofNikshychOstrikFusionCategories.md:39–51`: fusion
  definition and twisted graded examples. `references/manifest/SOURCES.md:34–35,55–57`
  registers the ENO/Penneys sources and extractions.
- `literature/md/2010.11121/2010.11121.md:164–180`: strict norm inductive
  systems, compatible states and GNS. This supplies no conformal-vacuum claim.
- `literature/md/2306.16063/2306.16063.md:49` and
  `literature/md/2102.04562/2102.04562.md:184–192,391`: AF/Bratteli mentions
  only. A fresh local search found no Elliott/dimension-group classification
  statement. B2's finite-stage proof removes the mathematical dependency,
  not the historical attribution gap.
- `CONVENTIONS.md:46–108,631–688,1450–1468,1524–1642`: unit-first labels,
  left association/dagger, positive spherical normalization, pointed sites,
  distinct trailing/dyadic maps, layer tags and (ar)–(aw) scope. Python grade
  labels 0,1,2 are explicitly local group elements, not Julia array indices.
- `report/sections/71_refinement_placement_category.tex:53–123`;
  `report/sections/72_gns_descent_corner_calculus.tex:44–110`;
  `report/sections/73_categorical_residual_set.tex:159–172,245–259`:
  placements/corners and the later corner-unit/support qualification. They
  do not supply trailing Bratteli incidence. CA-74 was read as requested by
  the brief; its model-specific kernel theorem is not used by F6.
- `report/sections/77_pointed_carrier_invariants.tex:47–86,170–193`:
  trailing incidence, richer marked reconstruction, distinct corner limit
  and trace qualifications; the cited use is accurate.
- `report/sections/90_local_unital_lift.tex:60–141,175–230`: H, the shuffle,
  finite coherence equations, converse boundary and circuit argument. Its
  (90.5) is not an AF classification theorem. A nonblocking inherited error
  is the parenthetical at `:223`: H actually implies self-Yang–Baxter on O,
  since tensoriality gives t_(O tensor O)=t_12 t_23 and naturality for t_O
  gives `t_12 t_23 t_12=t_23 t_12 t_23`. The NOTE needs only disjoint
  commutations and correctly says "without an extra braid relation".
- `explorations/2026-10-22-astra-r2/E1-local-unital-lift/NOTE.md:11–117,151–191`;
  same directory `REVIEW.md:23–120,148–168`, `INTEGRATION.md:6–31,55–91`:
  confirms H's full-subcategory hypotheses, the incidence obstruction and
  the unresolved arbitrary-lift converse.
- `report/sections/80_lattice_sewing_and_fidelity_certificate.tex:153–159,168–214`:
  scalar fusion falsifier, conditional fidelity and vacuum exclusion.
- `report/sections/93_normal_limit_expectations_and_fidelity.tex:56–114,160–189,208–237`:
  all normal-limit hypotheses, tensor/braided sector conclusion and lack of
  a supplied lattice instance. These are retained in D, not proved by F6.
- `explorations/2026-10-22-astra-r2/E5-two-sided-fidelity/NOTE.md:35–66,103–191,342–389`;
  same directory `REVIEW.md:125–156,190–217`, `INTEGRATION.md:84–123`:
  confirms the auxiliary-state distinction and lowered conditional layers.
- `report/sections/94_number_changing_collision_dynamics.tex:212–234`;
  `explorations/2026-10-22-astra-r2/E6-number-changing-continuum/NOTE.md:689–719`;
  same directory `REVIEW.md:170–176,224–228`, `INTEGRATION.md:71–117`:
  finite-input naturality and category dependence, explicitly not R5.
- `report/sections/88_layered_targets.tex:84–144` and
  `worklog/021_2026-10-22_round2_proofs.md:56–100`: ladder and inherited
  integration status. Latest `worklog/022_2026-10-25_round3_sprint.md` and the
  repository entry maps were also read; none replaces a proof.
- F6 `checks/check_f6.py:1–132`, `checks/README.md:1–29`,
  `checks/output.txt:1–7`, `checks/red_trace.txt:9`,
  `checks/red_support.txt:10`, `checks/red_crossing.txt:11` and
  `checks/sha256.txt:1–5`: inspected and independently rerun, with hashes verified.

For integration, make explicit the finite-dimensional A_n,B_m in B2 and
L_0>=1 in C2's cofinal diagram. These are clarity fixes to the intended
setting, not discovered counterexamples to the corrected AF theorem.
