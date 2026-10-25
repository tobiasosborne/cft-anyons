# CA-97 registration package — 2026-10-25

Review verdict: **WEAKER-RESULT-PROVED** (`REVIEW.md:3-12`). These fragments are proposals for the final integrator; none of the registration destinations or existing shards was edited. The shard retains the brief's literal `SHARD-F6-what-the-tower-remembersWORDS` header key and also supplies a canonical `SHARD-KEYWORDS` alias after the section heading for the existing guard. Both carry the same value. The two summary lines below mirror the header verbatim.

## 1. `report/SHARD_CATALOG.md` entry

```markdown
## `CA-97-WHAT-THE-TOWER-REMEMBERS`

- Source: `report/sections/97_what_the_tower_remembers.tex`
- Title: What the Tower Remembers: Rooted AF Invariants and Marked Refinements
- Summary: The trailing unital AF limit is classified by its rooted scaled ordered K_0, which can forget the fusion ring, site class and associator even with its canonical trace and stages.
- Summary: Fixed-H dyadic shuffles descend with identity K_0 action; abstract diagrams forget H, named finite compressions recover it, and interval/dilation reconstruction remains open.
- Keywords: AF algebra, rooted Bratteli diagram, scaled ordered K0, fusion ring, trace, half-braiding, dyadic refinement, marked reconstruction, fidelity, F6
```

## 2. `report/README.md` include-order row

```markdown
| 97 | `CA-97-WHAT-THE-TOWER-REMEMBERS` | `report/sections/97_what_the_tower_remembers.tex` | What the Tower Remembers: Rooted AF Invariants and Marked Refinements |
```

## 3. `report.tex` include

```latex
\include{report/sections/97_what_the_tower_remembers}
```

## 4. Proposed `CONVENTIONS.md` additions

Checked against (a)-(aw), particularly (r), (am), (aq), (as), (av). The entries below add the rooted group and retained-record notation actually used in CA-97. They reuse the existing dagger, left association, positive spherical structure, layer tags, crossing orientation and expectation cost; they do not redefine those conventions. Letters (ax)-(bb) are proposed here, to be coordinated with other round-3 packages when registered.

```markdown
## (ax) Rooted trailing AF invariant (2026-10-25)
**Scope:** CA-97; extends the trailing part of (am) to nonzero, not necessarily pointed, O.
**Choice:** Set W_0 = 1, D = <O>, I = Irr(D), and A_L = End_C(O^{⊗L}). Require O != 0.
Column incidence is N[y,x] = dim Hom(y,x⊗O), m_0 = e_1, m_L = N^L e_1,
S_L = {x : m_L[x] > 0}; omit zero-size matrix blocks. The rooted diagram has vertices S_L
at level L and N[y,x] edges from x to y. Reversing Hom direction by dagger does not transpose N.
An AF algebra means a norm completion of an increasing finite-dimensional union. K_0 is the
Grothendieck group of stable Murray–von Neumann projection classes, with the projection cone;
"scaled" retains the identity class [1] = [m_L,L]. For G_N = lim (Z^I,Z_+^I;N), put
u = [e_1,0] and I_u = {g : -n u <= g <= n u for some natural n}. The root u need not be an
order unit of G_N; the invariant is I_u with its inherited cone and unit. Classification in
97.8 concerns sequential unital AF limits of finite-dimensional stages, not an effective
algorithm for deciding arbitrary dimension-group isomorphism.
**Known clash:** S_L is a support set; the shuffle factor in 97.11 is Sigma_L, not S_L.
**Source:** `explorations/2026-10-25-astra-r3/F6-what-the-tower-remembers/NOTE.md:20-39,67-222,344-413`;
`explorations/2026-10-25-astra-r3/F6-what-the-tower-remembers/REVIEW.md:100-110,139-142,291-293`.
**Sweep status:** CA-97 only; CA-77's pointed and corner conventions remain unchanged.

## (ay) AF block trace weights (2026-10-25)
**Scope:** CA-97's block-coordinate expression of the spherical trace already fixed in (am).
**Choice:** Ordinary matrix Tr is unnormalised, with rank-one value one; lambda = d_O > 0.
The compatible state is tau_L(a) = lambda^(-L) sum_x d_x Tr(a_x). Its rank-one weight in
block x is d_x/lambda^L, while its block-identity weight is m_L[x]d_x/lambda^L.
The uniqueness proof uses arbitrary rank-one trace weights w_L and r_L[x] = lambda^L w_L[x]/d_x;
P[x,y] = N[y,x]d_y/(lambda d_x) is its row-stochastic matrix, delta_0 = min(P^p) when N^p > 0.
This proof-local P differs from the column-stochastic left-multiplication matrix in 97.2.
**Known clash:** delta_0 is a scalar contraction parameter, not the AF endomorphism delta;
lambda is a dimension here, not a Hamiltonian coupling. The trace is not CA-93's auxiliary
normal state on a represented four-interval inclusion, and is not a conformal-vacuum choice.
**Source:** `explorations/2026-10-25-astra-r3/F6-what-the-tower-remembers/NOTE.md:226-287,701-707`;
`explorations/2026-10-25-astra-r3/F6-what-the-tower-remembers/REVIEW.md:44-48,111-114,131-137`.
**Sweep status:** CA-97; the spherical normalization of (am) and the auxiliary-state distinction of (av) are reused.

## (az) Trailing maps, fixed-H dilation and abstract dyadic diagrams (2026-10-25)
**Scope:** CA-97's simultaneous use of the two towers in (am)/(as).
**Choice:** i_L(a) = a⊗1_O denotes trailing insertion; kappa_L is its limit embedding.
Reserve alpha_L(a) = B_L(a⊗1_{W_L})B_L^dagger for (as)'s dyadic map. H denotes the whole
pointed relative half-braiding (t_Y), not a Hamiltonian; one H is fixed at every length.
Sigma_L: O⊗W_L -> W_L⊗O moves the last old strand across the first L new ones, so
B_(L+1) = (B_L⊗1_O⊗1_O)(1_{W_L}⊗Sigma_L⊗1_O).
The trailing square is alpha_(L+1)(a⊗1_O) = alpha_L(a)⊗1_O⊗1_O. Its descended endomorphism
delta satisfies delta kappa_L = kappa_(2L) alpha_L. Powers of delta form a discrete semigroup;
there is no continuous flow parameter. For the abstract dyadic diagram, L_n = 2^n L_0 with
L_0 >= 1, j_n(a) = a⊗1_{W_(L_n)}, U_0 = 1, U_(n+1) = j_n(U_n)B_(L_n)^dagger.
The diagram conjugacies Ad(U_n) do not, by definition, retain simultaneous interval/trailing marks.
**Known clash:** (am)'s alpha_L names trailing insertion; CA-97 deliberately calls that map i_L.
The unsubscripted placement i in (ba) is different from the algebra map i_L; j is different from j_n.
**Source:** `explorations/2026-10-25-astra-r3/F6-what-the-tower-remembers/NOTE.md:20-28,511-588`;
`explorations/2026-10-25-astra-r3/F6-what-the-tower-remembers/REVIEW.md:70-75,121-130,291-293`.
**Sweep status:** CA-97 only; no renaming in CA-77 or CA-90 is implied.

## (ba) Retained records and typed crossing compression (2026-10-25)
**Scope:** CA-97's information statements and Target 97.16.
**Choice:** Distinguish five outputs: the unmarked AF algebra; that algebra with its named trailing
stages; the abstract dyadic directed diagram; the simultaneous record
R = (A_infinity,{A_[j,k]}_(1<=j<=k),delta); and the fully marked pointed tensor record of CA-77.
A stage isomorphism preserves each named stage and its trailing inclusion; a diagram isomorphism
intertwines only the diagram arrows. An R-isomorphism maps every named interval algebra onto its
counterpart and intertwines delta, retaining no eta, corner-identification or concatenation marks.
For 97.13 only, retain the tensor structure, point, placements, adjoints and boundary compressions:
r = eta⊗1_O, l = 1_O⊗eta: O -> W_2; h = r l^dagger in A_2;
i = 1_O⊗1_O⊗eta⊗eta, j = eta⊗1_O⊗1_O⊗eta: W_2 -> W_4.
Then t_O = j^dagger alpha_2(h)i for the supplied-H formula. These named typed identifications
are extra retained data, not assumed recoverable from R. Isomorphisms of the full marked record
transport the point and tensor/compression structure. K_0 classification concerns none of these
additional markings. Here h is a placement hop, not the energy density of (ak).
**Source:** `explorations/2026-10-25-astra-r3/F6-what-the-tower-remembers/NOTE.md:511-518,590-644,811-827`;
`explorations/2026-10-25-astra-r3/F6-what-the-tower-remembers/REVIEW.md:126-130,196-214`.
**Sweep status:** CA-97 only; the interval-support definition in (as) and CA-77's richer reconstruction are reused.

## (bb) Scoped exact witnesses for tower information loss (2026-10-25)
**Scope:** CA-97 Examples (Instances Only); no global F/R convention or model restriction.
**Choice:** For a finite group G of order q, the regular-site family is Hilb_fd(G,omega),
O = direct sum of all g, with normalized unitary 3-cocycle omega and J_q the all-ones matrix.
Use (partial beta)(a,b,c) = beta(b,c)beta(a,bc)/(beta(ab,c)beta(a,b)) for normalized tensorator
cochains. In the C_2 instance labels a,b,c,d are group elements 0,1, not Julia array indices;
omega_+ = 1, omega_-(a,b,c) = (-1)^(abc). The declared H crossing scalar is r_+ = 1 and
r_- = 1 except r_-(1,1) = i. In the untwisted C_2 witness t^±(a,b) = (±1)^(ab) swap.
All scalar gauges are confined to these witnesses; the canonical positive spherical trace remains (am)/(ay).
The review's additional C_3/root-of-unity gauge remains private to its check script and is not used as shard notation.
**Known clash:** r_± are witness scalars, not the typed placement r of (ba); i in r_-(1,1) is the imaginary unit.
**Source:** `explorations/2026-10-25-astra-r3/F6-what-the-tower-remembers/NOTE.md:422-508,839-914`;
`explorations/2026-10-25-astra-r3/F6-what-the-tower-remembers/REVIEW.md:62-69,84-90`.
**Sweep status:** CA-97's counterexample family and examples only; no other category gauge changes.
```

## 5. Dated amendment pointers

Each anchor is literal existing text, followed by the exact append-only LaTeX text. These implement all items in `INTEGRATION.md:70-114`, including the optional boundary pointers. No existing proof is replaced.

### CA-77 — trailing versus marked/corner records

File: `report/sections/77_pointed_carrier_invariants.tex:86`.
Append after: `the unmarked corner limit retains only block Hilbert dimensions.`

```latex
\emph{Amendment (2026-10-25, round 3):} CA-97, 97.1--97.4 and 97.7--97.10 (derived/negative; any; \(\mathsf L0\); trailing \(\mathsf R0^u\)) identify the rooted scaled ordered \(K_0\) invariant, justify the full stationary formula for pointed sites, and show that the bare AF limit can forget the fusion ring and \([O]\), while even its canonical trace and trailing stages can forget \(F\); Proposition 77.2's concatenation, placement and partial-isometry marks belong to a richer reconstruction record, and the corner limit 77.3 is unchanged.
```

### CA-90 — fixed-H descent and marked extraction

File: `report/sections/90_local_unital_lift.tex:211`.
Append after: `from an arbitrary \(\alpha\).  Existence or a complete obstruction for arbitrary local dyadic unital lifts at \(\mathsf L0\) is open.`

```latex
\emph{Amendment (2026-10-25, round 3):} CA-97, 97.11--97.14 (derived/negative; any, open; \(\mathsf L0+H\); \(\mathsf R0^u\)) prove the trailing square for one fixed \(H\), its descended endomorphism \(\delta\) with \(\delta_*=\mathrm{id}\), and inner-gauge equivalence of abstract dyadic and trailing cofinal diagrams; retaining the named pointed tensor/compression marks gives \(t_O=j^\dagger\alpha_2(h)i\), which recovers supplied \(H\) without resolving the arbitrary-lift converse or the simultaneous interval/dilation question (Target 97.16).
```

### CA-90 — self-Yang–Baxter correction

File: `report/sections/90_local_unital_lift.tex:224`.
Append after: `identifies the schedule with \(B_L\) (the combinatorial lemma made explicit at REVIEW:92--97).`

```latex
\emph{Amendment (2026-10-25, round 3):} The parenthetical claim that \(H\) need not supply self-Yang--Baxter on \(O\) is withdrawn: tensoriality and naturality for \(t_O\) imply \(t_{12}t_{23}t_{12}=t_{23}t_{12}t_{23}\) (derived; any; \(\mathsf L0+H\); finite \(\mathsf R0\) ingredient; CA-97, 97.11; F6 REVIEW:259--265), while the shuffle proof uses only disjoint commutations and requires no additional braid axiom.
```

### CA-80 — fidelity insufficiency

File: `report/sections/80_lattice_sewing_and_fidelity_certificate.tex:159`.
Append after: `fullness (NOTE.md:374--381).`

```latex
\emph{Amendment (2026-10-25, round 3):} CA-97, 97.9--97.10 (negative; any; \(\mathsf L0\); \(\mathsf R0\) obstruction) extend this insufficiency warning to the complete unmarked trailing AF output, even with its canonical trace and stage filtration; endpoint fullness and the independent annular certificate of Theorem 80.9 remain necessary parts of the conditional fidelity route.
```

### CA-93 — AF trace versus represented auxiliary state

File: `report/sections/93_normal_limit_expectations_and_fidelity.tex:179`.
Append after: `there (REVIEW.md:165--167).  \(T\), characters and a central-charge lift remain \(\mathsf L3\) data (CONVENTIONS (u)).`

```latex
\emph{Amendment (2026-10-25, round 3):} CA-97, 97.4--97.5 and 97.15 distinguish the compatible categorical AF trace (derived; any; \(\mathsf L0\), adding fixed pointed \(H\) for the dyadic tracial \(\mathsf R1\) instance) from Lemma 93.2's represented four-interval exhaustions and common normal auxiliary state; no new instance of Theorem 93.8 is supplied, and its conditional \(\mathsf R3\) assumption and \(\mathsf L0+L4\)/\(\mathsf L1+L4\) sector-fidelity tags are unchanged.
```

### CA-88 — exact grid changes

File: `report/sections/88_layered_targets.tex:125`.
Append after: `separately obtained \(\mathsf R1\) and \(\mathsf R2\) certificates do not compose.`

```latex
\emph{Amendment (2026-10-25, round 3):} CA-97 (review grade WEAKER-RESULT-PROVED) separates the classified unmarked trailing AF output (derived/negative; any; \(\mathsf L0\); trailing \(\mathsf R0^u\)), the abstract dyadic diagram and marked finite extraction (derived; any; \(\mathsf L0+H\); dyadic \(\mathsf R0^u\)), and the open interval/dilation record (Target 97.16); \(\mathsf L1\) supplies \(H\), but \(H\) need not supply \(\mathsf L1\), and the canonical tracial \(\mathsf R1\) instance is added only on its declared fixed-\(H\) schedule, with no \(\mathsf R0^c\), periodic/full, \(\mathsf L3\)-fidelity or \(\mathsf R2\)--\(\mathsf R5\) attainment upgrade.
```

### CA-71 — optional corner boundary pointer

File: `report/sections/71_refinement_placement_category.tex:123`.
Append after: `(the CA-68 corner statement, now closed under composition).`

```latex
\emph{Amendment (2026-10-25, round 3):} The rooted fusion-incidence AF theorem of CA-97, 97.1 (derived; any; \(\mathsf L0\); trailing \(\mathsf R0^u\)) concerns \(i_L(a)=a\otimes1_O\), distinct from these placement/corner maps as already separated by CA-77, 77.1--77.3; it changes no corner qualification here.
```

### CA-72 — optional corner boundary pointer

File: `report/sections/72_gns_descent_corner_calculus.tex:78`.
Append after: `invariance is claimed here.`

```latex
\emph{Amendment (2026-10-25, round 3):} CA-97, 97.1--97.4 (derived; any; \(\mathsf L0\); trailing \(\mathsf R0^u\) with trace) classify the distinct unital insertion system \(a\mapsto a\otimes1_O\); its rooted incidence and compatible trace do not replace the corner-weight normalization or GNS qualifications of this shard (CA-77, 77.1--77.3).
```

### CA-73 — optional corner-unit boundary pointer

File: `report/sections/73_categorical_residual_set.tex:256`.
Append after: `CA-79 Lemma~79.6).`

```latex
\emph{Amendment (2026-10-25, round 3):} CA-97, 97.1 (derived; any; \(\mathsf L0\); trailing \(\mathsf R0^u\)) gives fusion-graph incidence for the separate unital inclusion \(a\mapsto a\otimes1_O\), not for \(\theta_\varphi\); the support and corner-unit qualifications above remain unchanged (CA-77, 77.1--77.3).
```

CA-74: **no amendment**, as required by `INTEGRATION.md:109`; no model-specific Jones–Wenzl result is used.

### CA-94 — optional dynamics boundary pointer

File: `report/sections/94_number_changing_collision_dynamics.tex:236`.
Append after: `vacancy; these bulk sources lie outside the D1 family and T1, and a fixed-density classification must include them.`

```latex
\emph{Amendment (2026-10-25, round 3):} CA-97, 97.9--97.10 (negative; any; \(\mathsf L0\); unmarked trailing \(\mathsf R0\) obstruction) do not assert forgetting for dynamics retaining named reaction morphisms and coherent local insertions, whose tensor marks may already contain \(F\); naturality of either finite construction remains distinct from \(\mathsf R5\).
```

## 6. `INDEX.md` checks-bundle fragment

```markdown
| `explorations/2026-10-25-astra-r3/F6-what-the-tower-remembers/checks/` | CA-97 / F6, 2026-10-25, WEAKER-RESULT-PROVED: `python3 -I explorations/2026-10-25-astra-r3/F6-what-the-tower-remembers/checks/check_f6.py` and `python3 -I explorations/2026-10-25-astra-r3/F6-what-the-tower-remembers/checks/review_twisted_refinement.py`; six author invariant groups GREEN, independent two-gauge refinement checks GREEN, three author and two reviewer mutations rejected (`output.txt`, `review_run_output.txt`, `review_twisted_green.txt`, `sha256.txt`, `review_manifest.json`); finite identities only, with AF and reconstruction proofs in `../NOTE.md` and verdicts in `../REVIEW.md`. |
```

## 7. Worklog paragraph ready to prepend

**Verdict (2026-10-25): F6 → CA-97, WEAKER-RESULT-PROVED.** **Context:** lift the reviewed tower-information note into one shard while retaining every grade. **What changed:** 97.1--97.4, 97.6--97.10 give the rooted scaled ordered AF invariant, a finite-stage classification proof, compatible trace with primitive uniqueness, and fusion-ring/site/associator information-loss obstructions (derived/negative; any, open trailing geometry; L0, category-free for the finite/AF lemmas; R0^u or ingredients); 97.11--97.14 give fixed-H trailing compatibility, identity K_0 action, abstract-diagram forgetting and marked crossing recovery (derived/negative; any, open; L0+pointed H; R0^u); 97.5 adds only a tracial zero-drift R1 instance on the declared fixed-H dyadic schedule. The fidelity restatement 97.15 is conditional (chiral/named chiral subnet; L0+L4 or L1+L4; R4 sector fidelity given R3); Target 97.16 leaves simultaneous interval/dilation faithfulness open (conjectural; any, open; L0+H; R0 information only). **Why / corrections to the brief:** O must be nonzero; rooted supports replace all-vertex stationary groups unless the root is an order unit; rank-one and block trace weights differ; a quotient invariant computed from the fusion ring need not recover the ring or [O]; trailing unital, corner, abstract dyadic and marked records are distinct; dyadic composability does not imply the trailing square; delta gives a discrete semigroup, not a flow; rich R0 tensor marks can already contain F/H, whereas a trace need not restore F; CA-93's state is auxiliary and normal on a specified inclusion, not an AF-vacuum prescription; the crossing convention is (as), not (ar). **Frictions / dead ends:** no local primary AF-classification source was found, so the reviewed elementary finite-stage proof is retained without an Elliott dependency; the intermediate marked-record question and arbitrary-lift converse remain open. The reviewer also corrects CA-90's inherited self-Yang--Baxter parenthetical; finite-dimensional stages and L_0>=1 are made explicit. **Acceptance:** isolated wrapper copied the unchanged report preamble and compiled with `latexmk -pdf -interaction=nonstopmode`; both original exact check scripts were rerun successfully, with mutation regressions verified separately; the shard stays below 280 lines. **Pointers:** `report/sections/97_what_the_tower_remembers.tex`; F6 `NOTE.md`, `REVIEW.md`, `INTEGRATION.md`, `checks/`; registration, proposed conventions and append-only amendments in `SHARD_META.md`. This integration task writes only the shard and this package; registration and the root PDF build remain for the final integrator, with no commits or network actions here.

## Local acceptance record

Wrapper directory: `/tmp/ca97-wrapper-tgl_m2yu`; `ca97.tex` copies everything before `\begin{document}` in `report.tex`, then inputs only the new shard by absolute path. Build command: `latexmk -pdf -interaction=nonstopmode ca97.tex` in that directory. `build-output.txt`, `ca97.log` and `ca97.pdf` are temporary artifacts, not repository additions. The root shard guard cannot be the acceptance gate for this intentionally unregistered shard; the canonical keyword alias and two mirrored summaries prepare it for registration without changing any shared map.

Final checks: **272 shard lines; six-page wrapper PDF; zero LaTeX errors, undefined controls, warnings or overfull/underfull boxes**. All 16 numbered statements have grades, three tags and NOTE/REVIEW locators; there is exactly one next target. The catalogue title, both summary lines and keywords mirror the shard, all ten amendment anchors match the current files literally, and every source-comment path and line range resolves. Both exact check scripts pass; all five mutations exit 1 at their intended assertions. The NOTE SHA256 and all three review input hashes match `checks/review_manifest.json`. No existing check output was overwritten.
