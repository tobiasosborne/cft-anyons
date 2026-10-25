GRADE: COUNTEREXAMPLE

# F5 contact classification — skeptical review, 2026-10-25

The grade is against **the original F5 conjecture**. The NOTE's replacement
T4 is **PROOF-COMPLETE for its exact family (F) and N<=2 Galerkin compression**.
No false or unjustified numbered step was found in that replacement. This does
not certify arbitrary fixed densities, signed reacting full-Fock dynamics,
or arbitrary range-r densities.

Reviewed working-tree NOTE: 1130 lines, SHA256
`c1f6537614c6345743bf12443d5851e0f580752f12cd15ff8a9ee786db766aa7`.
The initial GRADE/skeleton was saved within ten minutes and refined in place.
The operator interruption did not change the scope. No NOTE edit, network,
Julia suite, repository-wide edit, commit or push was performed.

## Principal findings and attempted refutations

Spectral diving does not prevent nonreal strong-resolvent convergence. N1 proves
this on the whole nonreacting Fock carrier by Schur elimination and an exact
squeezed-grid spectrum. T3 proves the stronger arbitrary-sign, arbitrary-rate
result on the compressed reacting carrier. Its adjacent-row overwrite is exact:
no uncontrolled `|alpha_eps| eps` remainder survives.

I checked both endpoint rows, the collision-corner cutoff core, outgoing source
potentials, complex adjoints, kinetic coefficient t, collapsed face measure and
the necessity argument. L1 supplies global strong trace compactness; CA-94's
weak local trace result alone would not justify a negative trace-norm term.
An independent read-only analytical referee also checked L1/T3/T4 and found no
blocker. The verdict rests on computations and sources, not on agreement.

## Per-step verdicts

Line numbers below refer to the reviewed NOTE. Nested step identifiers include
their parent. Each numbered step is covered. VALID is under its stated
hypotheses; it does not promote a conditional extension.

### Exact algebra and counterexamples

| Step / line | Verdict | Reason |
|---|---|---|
| A1 <1>1 / 103 | VALID | CA-94:86-97,177-195 gives exactly the square expansions and moments; the excess replaces a by alpha_eps. |
| A1 <1>2 / 108 | VALID | Box factors give face weight eps and the exact left-anchored source. |
| A1 <1>3 / 115 | VALID | Principal compression keeps lower diagonals into N=3,4; empty-bond count is L+O(n); Q_b defects occupy the specified strips. |
| A1 <1>4 / 125 | VALID | D1-T7:483-516 includes smooth recovery and outgoing sources. No liminf is claimed here. |
| N1 <1>1 / 155 | VALID | Unordered edges and degree <=2n give norm <=4nt eps^-2, with identity fibre action. |
| N1 <1>2 / 166 | VALID | A>=1 on B; the kinetic perturbation leaves the claimed separation for either sign. |
| N1 <1>3 / 175 | VALID | Schur elimination and nonreal resolvent norm <=1 give all three block estimates without a common lower bound. |
| N1 <1>4 / 189 | VALID | The squeeze is bijective. Keeping the principal diagonal gives the exterior-power path matrix, not a newly reflecting graph. |
| N1 <1>5 / 200 | VALID | Centre-node cosines satisfy endpoint rows; ordered determinants have norm one. No extra n! enters the measure. |
| N1 <1>6 / 210 | VALID | Original box embeddings converge on fixed determinants; odd spatial extension proves completeness without imposing categorical statistics. |
| N1 <1>7 / 224 | VALID | The eigenbasis domain is self-adjoint; zero-trace H1 gluing identifies the mixed-boundary form. Density and the resolvent bound prove convergence. |
| N1 <1>8 / 238 | VALID | Number conservation permits finite-sector approximation; all resolvent norms are <=1. No n-uniform energy estimate is needed. |
| N1 <1>9 / 245 | VALID | (1,2) has one outgoing hop for L>=3, giving the stated diving Rayleigh quotient despite convergence. |
| N1 extension <1>1 / 255 | VALID | The growth assumption dominates the kinetic block at each fixed n. |
| N1 extension <1>2 / 257 | VALID | Replacing 2eps^6 by 2eps/|alpha_eps| gives Schur error 32n^2t^2/(|alpha_eps|eps^3)->0. |
| N1 extension <1>3 / 260 | VALID | The Q spectrum and finite-sector density argument are unchanged; only sufficiency is claimed. |
| N2 <1>1 / 277 | VALID | Orthogonal Y+Y copies give an internal projection; two half-bonds give a bulk offset difference eps^-2. |
| N2 <1>2 / 285 | VALID | A compactly supported high-band packet avoids endpoints and has a uniformly bounded difference remainder. |
| N2 <1>3 / 292 | VALID | Its resolvent response vanishes on a nonzero limiting vector, contradicting injectivity of a self-adjoint resolvent on the full carrier. |

### Global trace lemma

| Step / line | Verdict | Reason |
|---|---|---|
| L1 <1>1 / 337 | VALID | The specified reflected/fill-in square has mass <=4N_eps and energy <=6E_eps. |
| L1 <1>1.<2>1 / 350 | VALID | Off-diagonal entries occur twice; diagonal entries repeat a triangle entry at most twice. |
| L1 <1>1.<2>2 / 352 | VALID | Legal edge-disjoint two-edge routes give the factor-six estimate. |
| L1 <1>2 / 359 | VALID | Affine interpolation with clamped half-cells has the stated H1 and approximation bounds. |
| L1 <1>2.<2>1 / 370 | VALID | Triangle integrals give four half-weight edges; boundary strips supply the missing half-weights. |
| L1 <1>2.<2>2 / 375 | VALID | Integrated barycentric weights per vertex are <=2eps^2. |
| L1 <1>2.<2>3 / 378 | VALID | Two-edge routes and at-most-six neighbourhood multiplicity give the conservative interpolation-error bound. |
| L1 <1>3 / 385 | VALID | The exact half-cell integral is eps/12. The d/eps case split covers every eta, including coarse meshes. |
| L1 <1>4 / 406 | VALID | Cell-average approximation proves compactness for fixed finite-dimensional E; weak gradients identify H1. |
| L1 <1>5 / 422 | VALID | The infinitesimal trace bound applied to differences gives strong traces; absolute continuity controls the last cell. |
| L1 <1>6 / 432 | VALID | Omitted diagonal half-box mass is (eps/2)||B_eps||^2, so both embeddings have the same limit. |

The outer-row corollary (:441-452) is VALID: use the extended full row and then
restrict to i<L. The one-dimensional bounded endpoint trace gives
eps|f_L|^2->0. Dimension-independent constants do not assert compactness for
a changing or infinite-dimensional fibre.

### Finite contact and generator

| Step / line | Verdict | Reason |
|---|---|---|
| T1 <1>1 / 466 | VALID | L1 absorbs bounded negative contact and bounded source maps; a large shift gives a complete equivalent H1 form norm. |
| T1 <1>2 / 476 | VALID | The variational resolvent and adjoint-domain argument are explicitly supported by E6:271-289. |
| T1 <1>3 / 485 | VALID | Bounded shifted energies bound graph energy; strong bulk and full trace convergence justify signed and mixed terms. |
| T1 <1>4 / 494 | VALID | L1 kills the missing Q_b strips; the gamma error is uniformly O_n(eps). |
| T1 <1>5 / 503 | VALID | CA-94:127-128 supplies the exact kinetic liminf coefficient, not the interpolation constant six; smooth density gives recovery. |
| T1 <1>6 / 511 | VALID | Strict convexity gives strong minimizer convergence; E6:123-131 justifies passage to nonreal resolvents. |
| B1 <1>1 / 536 | VALID | Second-slot-linear polarization gives B_beta^* and the integrated V_nu^* vacuum source. |
| B1 <1>2 / 543 | VALID | D/sqrt(2) and sqrt(2)dy cancel. Boundary equations remain variational without extra regularity. |
| B1 <1>3 / 551 | VALID | Scalar upper contact is imposed by (F); reactions and insertion potentials remain categorical and possibly nonscalar. |

The unnumbered affine conversion (:559-570) is VALID: alpha=kappa for total
contact, alpha=delta+a for contact specified before adding the reaction squares;
Robin coefficient alpha/t for flux D, alpha/(sqrt(2)t) for unit normal.
Occupation changes iff aggregate beta or nu is nonzero, not iff an individual
reaction map is nonzero.

### Divergent contact

| Step / line | Verdict | Reason |
|---|---|---|
| T2 <1>1 / 579 | VALID | Square completion forces the adjacent trace to zero while retaining lower potentials. |
| T2 <1>2 / 586 | VALID | Odd gluing, even outer reflection and symmetric mollification give trace-zero H1 density. |
| T2 <1>3 / 595 | VALID | Exact zeroing of O(eps^-1) samples of size O(eps) costs O(eps) graph energy, regardless of contact growth. |
| T2 <1>4 / 604 | VALID | Recovery and the variational argument identify the decoupled form with W_n retained. |
| T3 <1>1 / 620 | VALID | The subsidiary steps establish a genuine operator core. |
| T3 <1>1.<2>1 / 625 | VALID | Complete cosine-determinant spans are a graph core; bounded constant W_n preserve graph-norm density. |
| T3 <1>1.<2>2 / 629 | VALID | Quadratic corner vanishing makes cutoff Laplacian errors O(1) on area O(d^2), hence O(d) in L2; radial cutoffs preserve outer Neumann data. |
| T3 <1>2 / 640 | VALID | G can avoid outer walls; symmetric Sbar preserves Neumann data. Exact adjacent overwrites tend to zero for either sign. |
| T3 <1>3 / 662 | VALID | Oddness/symmetry give O(eps^3+eps^2/|alpha_eps|) overwrite error and O(eps+|alpha_eps|^-1) kinetic error. |
| T3 <1>4 / 671 | VALID | The -2tg/eps flux cancels exact contact/source singularities; residual O(1) is confined to area O(eps). |
| T3 <1>5 / 696 | VALID | Degree-one endpoint rows are handled explicitly using u1'(0)=u1'(1)=0; other rows have Neumann finite-difference consistency. |
| T3 <1>6 / 708 | VALID | Feedback is -B_beta^*a_j and -eps sum V_nu^*a_j, both O(|alpha_eps|^-1); outgoing diagonals survive. |
| T3 <1>7 / 717 | VALID | Box-volume counting gives O(sqrt(eps)+|alpha_eps|^-1) for each fixed core vector. Uniformity over the entire core is unnecessary. |
| T3 <1>8 / 729 | VALID | Resolvent norm <=1 and density of (H_D^W-i)D extend convergence to every input, with no semibound assumption. |

### Necessity, full-Fock boundary and range

| Step / line | Verdict | Reason |
|---|---|---|
| T4 <1>1 / 763 | VALID | T1 and T3 prove sufficiency. |
| T4 <1>2 / 765 | VALID | Rigidity and orthogonal splitting give X^2!=0; contacts are detectable and V_D is a proper subdomain of V. |
| T4 <1>3 / 774 | VALID | The variational supremum recovers the form and its domain from the positive resolvent; E6:670-677 supplies form density. |
| T4 <1>4 / 790 | VALID | Subsequence compactness and distinct limiting operators exclude multiple finite cluster points or mixed finite/infinite ones. |
| C1 <1>1 / 813 | VALID | With inherited nonnegative D1 weights, alpha>=a adds a nonnegative trace square; closedness and form-core arguments apply. |
| C1 <1>2 / 822 | VALID | Positive finite exhaustion and diagonal recovery work also when alpha_eps approaches a from above. |
| C1 <1>3 / 831 | VALID | Every fixed trace vanishes; lower squares survive. At fixed n exact-zero recovery costs O_n(eps). No signed classification follows. |
| C2 <1>1 / 871 | VALID | Nonzero tensor powers supply fibres; sqrt(n!) normalizes the ordered-chamber product. |
| C2 <1>2 / 879 | VALID | Summing duplicate-coordinate ranks gives n!/(n-2)!=n(n-1); kinetic energy is tn l^2 A. |
| C2 <1>3 / 886 | VALID | Cross terms vanish on a pure sector; optimizing l gives negative cubic growth and O(n) remnants. This only excludes a common lower bound. |
| D1 <1>1 / 917 | VALID | Multiplicity copies allow a channel projection; its added w/eps contact gives Dirichlet on that channel and Robin on its complement. |
| D1 <1>2 / 928 | VALID | Direct-sum amplification preserves G_r while permitting internal endomorphisms; conservation implies neither scalarity nor band alignment. |
| D1 <1>3 / 938 | VALID | CA-94.13 supplies precisely a conditional positive-form interface; arbitrary-range coercivity and signed boundary consistency remain assumptions. |

An unconditional signed reacting full-Fock classification, global H2 theorem,
or renormalized triple-contact construction would have a **GAP**. The NOTE
correctly leaves these open/conditional/conjectural; none is needed for T4.
No numbered proof is a sketch mislabelled as a proof.

## Corrected statement and honest layer tags

Fix any unitary fusion C, pointed O=1+X with X!=0, t>0, mu>0, finite reaction
lists b_rho:X->X^2 and v_sigma:1->X^2 with **lambda_rho,kappa_sigma>=0**, and
the moments (a,beta,nu,Q_b,gamma). Use eps=1/L, the no-outer-penalty family
(F), and **H** compressed to N<=2 with outgoing lower squares retained.
Put alpha_eps=(c_eps+2t)/eps.

The K_eps-projected nonreal resolvents converge strongly to a self-adjoint
operator on the entire truncated carrier iff alpha_eps converges to a finite
real alpha or |alpha_eps| tends to infinity. The finite limit is (Q)/(B).
The infinite limit is collision-Dirichlet, outer-Neumann with W_0=gamma,
W_1=mu+Q_b+gamma and W_2=2mu+(Q_b)_1+(Q_b)_2+gamma retained. Both signs and
sign oscillation are allowed. Necessity excludes the contact-invisible X=0.

**Tags:** S=any, open interval; L=L0 plus these microscopic declarations,
with no L1-L4 input; R reached=inherited R0^c plus off-ladder z=2 classification.
R0^u and R1-R5 are not reached. L1's analytic trace lemma is category-free
for a fixed finite fibre. There is no model-specific identity in the proof.

Separate whole-Fock results are C1's eventual alpha_eps>=a sufficient family,
N1's nonreacting deep-contact family and C2's lower-bound obstruction. They do
not establish the signed reacting full-Fock classification.

## What the brief got wrong

1. Spectral diving is not a no-resolvent theorem. Even fixed c_eps=-6t has
   the N<=2 Dirichlet limit while an adjacent-pair Rayleigh quotient dives.
2. The finite-kappa “iff” conflicts with the proposed positive-infinite limit;
   sign oscillation with diverging absolute value is another allowed case.
3. “Hop plus diagonal” imposes neither fibre scalarity nor aligned internal
   bands. N2/D1 refute these extensions by general multiplicity constructions.
4. P(H-z)^-1P is different from (PHP-z)^-1. The old requested check explicitly
   uses the latter (E6 check:6-8); this NOTE correctly follows that interpretation.
5. Uniform eps^-2 scaling of a fixed reaction density is not D1: the cross
   powers are eps^-1/2 for b and eps^0 for v (CA-94:86-97).
6. CA-94.5 explicitly disclaims N-uniform constants (:135-137). Its all-N proof
   uses positivity, finite exhaustion and a core, contrary to F5(c)'s premise.
7. G_r enforces occupation conservation only. It supplies no coercivity,
   scalar collision datum or boundary stencil consistency.
8. Reaching N=3 does not prove a universally necessary three-body counterterm.
   The separately added triple-trace obstruction is CA-94.14, not a tuning law.

## Independent checks and raw output

Both original entry points were rerun with one BLAS/OMP thread, Python -u -B
and PYTHONDONTWRITEBYTECODE=1; both exited 0. The first exercises both imported
helper modules. Original output files were not replaced.

| Raw output in checks/ | Result |
|---|---|
| review_rerun_tuned_output.txt | ALL GREEN, 16.932 s; six caught mutations, exact finite spectra and full-tensor/compressed matrix agreement. |
| review_rerun_graph_core_output.txt | ALL GREEN, 3.365 s; two caught mutations and the preserved underresolution history. |
| review_trace_invariants_output.txt | Independent full-matrix M*G M<=6E and M*M<=4I checks, affine gradient integrals and exact rational eps/12 factor at L=2,3,4,7,11. Zeroing the final diagonal node gives E_triangle=0, E_square=2: mutation caught. |
| review_graph_core_independent_output.txt | Independent raw local-square assembly with t=1.7, complex b/v, unequal weights and nonconstant Neumann u1. Dagger, outward-sign and omitted-mesh-term mutations caught. |

The two new scripts are `review_trace_invariants.py` and
`review_graph_core_independent.py`; neither imports the author's builder.
Run from the repository root with `OPENBLAS_NUM_THREADS=1
PYTHONDONTWRITEBYTECODE=1 python3 -B <script>`. Each records its command,
versions, tolerances and source hash. On L=24,49,96 the independent deep
sign-alternating graph residual is 1.55175, 0.78184, 0.40273; fixed c=-6t gives
2.32779, 1.16690, 0.60186. Slow-contact residuals remain about 13-14 on the
finest grid: these are finite decrease checks, not small-error or rate theorems.
Finite spectral differences do not prove the Cauchy property. Infinite
convergence is established by the analytical proof, not these scans.

## Single sharpest next lemma

**Signed reacting full-Fock realization and graph-core lemma.** Fix (F), X!=0,
finite total alpha<0 and beta or nu nonzero. Construct a self-adjoint operator
on the full carrier with the CA-94 local source equations and a dense operator
core D such that each u in D has lattice approximants satisfying
`K_eps u_eps -> u` and `K_eps H_eps u_eps -> H_alpha u`. Alternatively exhibit
a fixed nonzero source obstructing a self-adjoint projected-resolvent limit.
C2 excludes a common lower-bound proof. A finite-sector form core is not
automatically an operator core for reacting boundary conditions, and the N<=2
corrections feed sectors three and four before compression. Tags remain
any/open; L0 plus signed microscopic data; off-ladder z=2. This lemma is open.

## Sources checked

CA-77, CA-88 and CA-94 were read whole. Listed ranges are the checked support
anchors; shorthand E6 below means
`explorations/2026-10-22-astra-r2/E6-number-changing-continuum/`.

- `AGENTS.md:1-425`, `README.md:1-72`, `CONVENTIONS.md:1-1642`, especially
  :47-113,631-694,1397-1467,1524-1543,1621-1642: unit, gauge, bracketing, cup,
  physical sign, carrier, tags and collision conventions.
- `report/README.md`, `report/SHARD_CATALOG.md` CA-77/88/94 entries, `report.tex`,
  `worklog/021_2026-10-22_round2_proofs.md` and latest
  `worklog/022_2026-10-25_round3_sprint.md`: navigation/history only.
- `references/manifest/SOURCES.md:35,57,69-71` and
  `references/category-theory/SOURCES.md:1-25,27-63`: provenance. Penneys is
  registered local lecture-note markdown, not represented as a PDF.
- `references/text/PenneysUnitaryFusionCategories.md:195-237`: semisimplicity,
  orthogonal sums/splittings; :319-321: dagger tensor structure and unitary
  graded examples; :394-398: coherence; :427-430,484-487: reciprocity/duality;
  :470-478: fusion multiplicities; :528-538: isometry inner product and the
  distinct graphical normalization. These support the stated categorical uses.
- Same Penneys file :610-631: Fibonacci dimension row only. The raw cup and
  vertex norms are not imported as orthonormal matrix coordinates.
- `references/category-theory/RowellStongWang2009Classification/source/RSWfinal3.tex:2441-2448`:
  exactly the Ising fusion rules used in the instance row.
- `report/sections/77_pointed_carrier_invariants.tex:93-126,207-251`:
  occupation grading, K maps, carrier measure and historical contact caveat.
- `report/sections/88_layered_targets.tex:54-108,129-155,167-177,230-243`:
  declarations versus layers, target rungs, CA-94 row and D1-C target.
- `report/sections/94_number_changing_collision_dynamics.tex:50-60,64-97,108-167,177-248,268`:
  conventions, powers, trace/core/liminf proofs, generator, moments and range
  limitations. In particular :77-78 supplies inherited nonnegative weights.
- E6 `NOTE.md:18-66,123-188,192-398,402-461,465-598,602-761,828-834`:
  direct analytic derivations, checked rather than relying on the prior grade.
- E6 `REVIEW.md:58-65,69-176,178-242` and `INTEGRATION.md:61-117`:
  prior source caveats, limitations and origin of the false trichotomy. Its
  proposed next lemma is not evidence for F5.
- E6 `checks/review_tuned_convergence.py:1-69`: Galerkin semantics and old check.
- `explorations/2026-10-22-astra/D1-carrier-theory/NOTE.md:483-543`:
  smooth recovery/source bounds, including reactions into omitted sectors.
- `literature/md/girardeau_jmp_1_516_1960/girardeau_jmp_1_516_1960.md:65,88`:
  impenetrable-point discussion only; correctly not used as a Mosco theorem.
- F5 `checks/analytic_lemma.md` and `checks/divergent_contact_graphcore.md`:
  supporting derivations checked against the authoritative NOTE.
- F5 `checks/source_search.txt`: its local rg query reproduces 13 matches.
  No applicable contact-classification theorem was identified; this is a
  search result, not a claim that the entire library lacks analysis.
- F5 original four Python modules and both original output files, plus the
  four reviewer outputs above: finite evidence. Fingerprints and exit statuses
  are recorded in `checks/review_manifest.json`.

No load-bearing citation mismatch was found. Before lifting, explicitly repeat
the inherited nonnegative weights and retain the truncation, total-contact,
regularity and off-ladder qualifiers. These are scope requirements, not an
authorization to generalize the theorem.
