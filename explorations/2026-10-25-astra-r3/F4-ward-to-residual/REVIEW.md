GRADE: WEAKER-RESULT-PROVED

# F4 skeptical review — 2026-10-25

Review started 05:24 UTC; the initial grade and skeleton were written within
the first ten minutes. Object: the 767-line `NOTE.md`, SHA256
`5319c0852560ccf2432ac4986d931e9e4f3c299300c48e1774e1e400f12661cc`.
All line numbers below refer to that snapshot. The grade concerns the
proved weaker results, **not** the original F4(a)–(c) conjunction.

## Principal finding

The note is substantially correct about its own limited outcome. I found
no load-bearing false equation in F4.1–F4.8. Its strongest general positive
result is a finite-dimensional analytic lifting lemma under **uniform
physical probe bounds**. Its strongest negative result is a genuine local
KS counterexample to the proposed subcritical-collar converse under the
stated VR-1 control convention. Its fermion result is a diagonal spectral
calibration, with explicit all-size bounds, for the sourced modified modes.

The following boundaries are decisive:

1. **GAP in literal F4(a):** neither probe density nor D2 (19) identifies
   a contour's endpoints with both ordered Hilbert-space products. F4.2
   assumes this in G1, and assumes the cylinder contact comparison in G2.
   It proves telescoping plus a norm estimate; it does not derive G1–G2.
2. **GAP in any wordwise reading:** all normalized linear combinations on
   both sides must share the same constant, after the null quotient and
   Gram correction. The number of errors and their transport factors must
   be included. F4.3 correctly refutes replacing this by fixed-word decay.
3. **FALSE converse as posed:** graph residuals can vanish while every
   fixed subcritical heat exponent has divergent constants. F4.4 realizes
   this with the prescribed nearest-neighbour KS formula, not fitted modes.
   It does not refute a converse additionally assuming physical-energy
   comparison, noncollapse, or the complete D2 certificate.
4. **GAP in F4(c)'s geometric claim:** the backend has no constructed
   metric insertions, contour/product map or chart comparison. Diagonal
   full-Fock estimates for its modified chiral modes do not verify these.

F4.1 largely makes D2-L10's two-loss version and constant explicit; F4.2
packages the still-assumed geometry. These are useful interface results,
not a completed advance through the principal geometric obstruction.

## Per-step verdicts

`1.3/2.1` denotes `<2>1` nested in `<1>3`. VALID means valid under the
displayed assumptions, not that those assumptions have been constructed.

| Statement / step | Verdict | Reason, using NOTE line anchors |
|---|---|---|
| F4.1, 1.1 | VALID | :74–76: a finite-dimensional dense linear span equals the whole quotient. No infinite-dimensional completion theorem is being smuggled in. |
| F4.1, 1.2 | VALID | :78–82: self-adjoint K moves from the first slot to the output; the uniform two-vector supremum is the operator norm. |
| F4.1, 1.3 | VALID | :84–100: precisely D2-L10's two-loss variant, not its one-loss formula with an unchanged exponent. |
| F4.1, 1.3/2.1 | VALID | :88–90: spectral gamma integral gives K^(-s-2)/(normalization 1), with factorial (s+1)!. |
| F4.1, 1.3/2.2 | VALID | :92–93: the small-t integrand is t^(-alpha); alpha<1 is essential. |
| F4.1, 1.3/2.3 | VALID | :95–100: factor the input heat operator at t=1; K>=1 bounds the tail. The tail constant is sum_(j=0)^(s+1)1/j!. |
| F4.1, 1.4 | VALID | :102–103: adding the two integrals gives exactly F2, uniformly in scale at fixed s,alpha. |
| F4.1, Gram paragraph | VALID | :105–111: for a form matrix B the metric correction is G^(-1/2) B G^(-1/2). D2-L9 instead treats an operator-coordinate matrix. Independently mutation-tested. |
| F4.2, 1.1 | VALID | :150–151: finite telescoping, with the sweep and its identities assumed. |
| F4.2, 1.2 | VALID | :153–158: G1 and G2 give F5 with the stated endpoint sign. The contact formula F3 is an assumption here. |
| F4.2, 1.3 | VALID | :160–163: triangle inequality gives the accumulated F1 constant only because G3 includes physical transport, Fourier weights and counts. |
| F4.2, 1.4 | VALID | :165–166: F4.1 yields W2. No geometric realization follows in reverse. |
| F4.2a, unnumbered corollary | VALID, conditional | :168–173: A2 controls the beta_N-to-(m-n) correction; convergence of contacts and one-loss KS discrepancy lets CA-89 transfer apply. A3 and mixed brackets remain separate. |
| Literal F4(a) application | GAP | :175–183: G1, the chart part of G2 and the accumulated uniform certificate are not consequences proved from the literal brief. The note acknowledges this correctly. |
| F4.3, 1.1 | VALID | :192–194: moving rank-one support eventually misses each fixed finite-support vector. |
| F4.3, 1.2 | VALID | :195–197: matrix units acting on e_0 give the required dense span. |
| F4.3, 1.3 and QED | VALID | :198–201: the projection has norm one; this refutes only the word-dependent interpretation, not uniform D2-L10. |
| F4.4, 1.1 | VALID | :231–240: the active block is a(I+X tensor Z), positive with eigenvalues 0,2a; vacancy blocks vanish. Matrix-unit cyclicity does not require a faithful vector state. |
| F4.4, 1.2 | VALID | :242–256: the recursive control construction is coherent. |
| F4.4, 1.2/2.1 | VALID | :244–248: even-only and odd-only occupation spaces meet only on the vacuum; their nonvacuum parts are orthogonal. |
| F4.4, 1.2/2.2 | VALID | :250–252: the transported controls agree on that intersection. |
| F4.4, 1.2/2.3 | VALID | :254–256: U swaps the two pieces and U_f^2 J=J U_r; induction proves translation invariance and exact K transport. |
| F4.4, 1.3 | VALID | :258–263: self-adjoint densities annihilating both insertion ranges preserve their orthogonal complement. All mode support has K=lambda_N. |
| F4.4, 1.4 | VALID | :265–294: its three estimates follow on that supported block. |
| F4.4, 1.4/2.1 | VALID | :267–276: J_j=-2a^2 XYZ_j and the mode norm bound F7 have the correct sign and factor. Both were independently checked from dense matrices. |
| F4.4, 1.4/2.2 | VALID | :278–289: divide respectively by lambda and lambda^2. F8 follows with B_mn=2|m|+|m+n|. Real self-adjoint densities also give T_n^*=T_-n as A2 requires. |
| F4.4, 1.4/2.3 | VALID | :291–294: fine modes kill J; exact control transport leaves the coarse one-loss bound. The dyadic errors are summable and the limiting modes are zero. |
| F4.4, 1.5 | VALID | :296–327: the five-site witness defeats every fixed alpha<1. |
| F4.4, 1.5/2.1 | VALID | :298–311: only distance-two current pairs produce XYYYZ. Their commutator is 8i a^4 times that word; the Fourier factor gives F9. |
| F4.4, 1.5/2.2 | VALID | :313–317: normalized Pauli trace bounds the operator norm from below; the sine chord bound applies for N>=8. |
| F4.4, 1.5/2.3 | VALID asymptotically | :319–327: t=p/lambda_N is allowed for all sufficiently large N at each fixed s,alpha. Substitution gives exp(2(1-alpha)N^2)N^(-2-3alpha). Add this finite-scale qualifier when lifting. |
| F4.4, 1.6 | VALID | :329–340: an accumulated F1 bound on the same residual contradicts F10. The nonphysical control and collapsed stress limit are expressly outside stronger physical converse hypotheses. |
| F4.5, 1.1 | VALID | :347–355: weighted duality gives F11 in both directions with a single uniform constant. It concerns the assembled algebraic residual. |
| F4.5, 1.2 | VALID | :357–365: max x^p exp(-x)=(p/e)^p gives exponent s+2, i.e. alpha=1. Its gamma-integral majorant diverges at zero. |
| F4.5, 1.3 | VALID | :367–381: geometric interpolation of the two scalar majorants gives the stated theta and alpha; uniform subcritical regularity is a genuine extra hypothesis. |
| F4.5, 1.4 and QED | VALID | :383–388: finitely many fixed Fourier labels permit a finite sum; growing support and local contour uniformity do not follow. |
| F4.6, 1.1 | VALID | :447–450: the sourced complex-CAR cocycle identity and opposite shifts make the residual diagonal, commuting with Q. |
| F4.6, 1.2 | VALID | :452–464: the sine-square difference gives F18; the coefficient 7n^3/12 is correct. |
| F4.6, 1.3 | VALID | :466–473: at most one edge transition is removed for M>2n. Its square and the minimum edge momentum give precisely Cconst_n, including M=8,n=3. |
| F4.6, 1.4 | VALID | :475–480: only n Fermi crossings contribute. Factoring squared coefficients gives Bconst=(0,7/24,35/12). |
| F4.6, 1.5 and QED | VALID | :482–486: summing absolute excitation contributions and sum r^2<=Q^2 yields a full finite-Fock bound; no low-input compression is used here. |
| F4.6a, 1.1 | VALID | :495–497: the interior bracket has magnitude <=2 and the missing edge term obeys the stated linear envelope. |
| F4.6a, 1.2 | VALID | :498–500: the scalar error fits inside H_n K, yielding uniform exponent s+1. |
| F4.6a, 1.3 and QED | VALID | :501–504: interpolation with F17 gives F19 and O(M^(-1/2)) for each fixed n in {1,2,3},s. These are spectral, not contour, constants. |
| F4.7, 1.1 | VALID | :511–514: the particle-hole vector is neutral and even, with E_chiral=2e_M. |
| F4.7, 1.2 | VALID | :515–519: the two missing outward transitions give -2u_M^2-4e_M; the n=1 Schwinger term is exactly zero. |
| F4.7, 1.3 and QED | VALID | :520–524: the diagonal weighted quotient tends to one. The witness moves with M and does not refute fixed-core strong convergence. |
| F4.8, displayed derivation | VALID, inherited | :595–627: F20 is exactly CA-79:65–70, including both velocity powers and the physical minus sign. CA-78 supplies the complete coefficient algebra, not a universal nine-tile basis or a Ward certificate. |

No displayed conditional proof above is merely a sketch. Conversely,
promoting G1/G2, all-bracket fermion bounds, or a local Ward realization to
proved would be **NOT A PROOF**: no such derivations are supplied.

## Convention and citation audit

No F/R-symbol, unit-label, bracketing or dagger/dual substitution drives a
proof here. The analytic statements are category-free; the categorical
compiler retains all charge and multiplicity matrix units. The Vec qutrit
example falsifies a universal implication; the fermion section is explicitly
an instance. Neither is passed off as a general categorical construction.

The current orientation, h-to-k sign, Fourier normalization, beta_N,
zero-mode shift and independent c,c* agree with (ap),(ar) and CA-79/89.
The three fermion energies are explicitly distinguished. Changing to
K=1+Q is a declared calibration choice, not a proof for an unspecified E_N.
Likewise the no-wrap prescription is actually present in source Eq. (197),
not a reviewer-approved numerical filter. The changed check tolerances are
declared locally and must be registered before report integration.

**Minor locator defect:** `NOTE.md:758` ends its combined convention
locator at `CONVENTIONS.md:1550`, before the difference multiplier and
contact dictionary at **1551–1556**. Extend that range through 1562 when
integrating. The named convention (ar), CA-89:123–134 and the displayed
formulas independently support the mathematics, so this is not a proof gap.
All other checked citation uses support their stated, restricted role.
In particular, CGS is only a scope warning; Schottenloher supplies continuum
algebra/formal OPE, not a lattice chart-change theorem.

## Corrected statement and layer tags

**Forward statement.** On finite positive quotients H_r with K_r>=1,
let reflected probe spans equal H_r and let all residual forms descend to
the quotient. For each fixed s choose alpha_s<1 independent of r. If the
physical, two-sided probe supremum satisfies F1, then F2 holds. If a
specified contour sweep additionally satisfies G1–G2 and its complete
accumulated error satisfies G3, then W2 holds with
`w_(r,m,n,s)<=C_(s,alpha_s) B_(r,m,n,s)`. A2 for S, convergent real contacts
and b, and a vanishing one-loss discrepancy to the prescribed KS modes
give their A4 with `c*=12 kappa_3`, `c=24b-12 kappa_1`.

**Converse statement.** W2 gives the uniform weighted pairing bound F11
and critical heat bound F12. A uniform subcritical envelope F13 repairs
the analytic converse with any strictly worse subcritical exponent via
F14. It still does not reconstruct spatial Ward identities or geometry.
Without that envelope, the local periodic qutrit construction refutes the
converse even with A1–A4 and a graph-dense cyclic probe family.

| Result | S | L | R reached / limitation |
|---|---|---|---|
| F4.1, F4.3, F4.5 | any | category-free | finite analytic implication or obstruction, ->R2 |
| F4.2–F4.2a | full, per family | category-free plus declared geometric/state/control data | conditional W2/A4, ->R2; no nontrivial common-domain representation constructed |
| F4.4 | full, both KS families | category-free; Vec realizes the example | trivial zero-mode representation under VR-1; negative converse, not progress toward a nonzero conformal theory |
| F4.6–F4.7 | one chiral CAR family on an AP circle, not an open-chain realization | category-free, declared CAR sea and control | diagonal spectral bounds/obstruction, ->R2 only |
| F4.8 | any locally; full only with declared closure | L0 plus microscopic declarations | existing finite compiler, ->R2; no h-selection, conformal limit or fidelity |

The AP chiral calibration must retain that explicit setting description;
it is not evidence for CA-88's open-chain chiral construction cell. A1/A3,
all mode pairs and the mixed family on the same system are still needed
for the intended nontrivial R2 certificate; R3–R5 do not follow.

## What the brief got wrong

The brief correctly insists on all probes and category-free scope, but
overstates what those premises settle. Density is not a uniform norm
estimate or a quotient-descent proof. D2 (19) is a plane correlation
identity, while the requested conclusion concerns equal-time products
and cylinder contacts. The old D2 and E4 notes explicitly leave that bridge
open; calling it Lemma 89.L does not supply it.

Part (b) also confuses two-loss graph control with strictly stronger
subcritical heat regularity, and spectral brackets with geometric local
Ward identities. The exact obstruction F4.4 applies to “admissible” in the
actual VR-1 sense; if physical comparison or D2 C1–C6 was intended, that
is a different, still-open conjecture. Part (c) assumes unavailable
geometric objects and leaves E_N ambiguous. The available backend uses
the source-modified, no-wrap chiral modes; the standard local two-family
KS formula cannot be silently substituted. Consequently the requested
CA-88 upgrade “W2 proved conditional only on contour identity” is unjustified.

## Independent checks and reproducibility

All commands are from the repository root, prefixed by
`PYTHONDONTWRITEBYTECODE=1 OPENBLAS_NUM_THREADS=1`; no Julia/network calls.
Use directory `explorations/2026-10-25-astra-r3/F4-ward-to-residual/checks/`:

- `python3 <directory>/review_rerun.py` reruns the three author entrypoints
  and their three mutation flags. Only `Path.write_text` artifact destinations
  are redirected to `review_rerun_*`; original source and inputs execute
  unchanged. Raw outputs and hashes: `review_rerun_output.txt`,
  `review_rerun_manifest.json`, `review_rerun_{fermion,ks,qutrit}.txt` and
  `review_rerun_{wrap_red,collar_red,current_red}.txt`. Green exits: 0,0,0.
  Red exits: 1,1,1, each at the intended invariant, not an unrelated crash.
- `python3 <directory>/review_independent.py`: independent dense construction
  of actual KS densities/currents at N=8, active-block dimension 256; complex
  nonorthogonal Gram test; exact scalar heat-threshold check. It imports no
  author check implementation. Raw: `review_independent_green.txt`.
- Its `--mutate-half-current` and `--mutate-drop-gram` runs were made before
  the restored green run and failed the coefficient and physical-norm
  assertions respectively. Raw: `review_independent_current_red.txt` and
  `review_independent_gram_red.txt`. The former gives 13.5399145264 instead
  of the independent F9 value 54.1596581055; the latter gives 0.1715598038
  instead of physical norm 3.9177122442.

The fermion rerun verifies normal ordering against an independent 16x16
CAR oracle, full-Fock diagonal extrema against all M=8 occupations, and
retains full outputs for restricted-input off-diagonal checks. Those checks
assert real invariants. Its full-Fock diagonal DP and analytic envelopes
are valid, but none tests G1–G2. Three sizes establish no fitted asymptotic
rate; F17/F19, rather than the table, supply the all-size bounds.
An independent read-only GPT-6.1 xhigh audit of F4.6–F4.7 agreed; this review
also checked their equations and source passages directly.

## Single sharpest next lemma

**Quantitative two-ordering endpoint realization** (full per family;
category-free; ->R2). For a specified metric-dependent local gate family,
positive reflected boundary quotient and coherent port transports,
construct a finite contour sweep and prove that its two endpoint maps
represent S_m S_n and S_n S_m, respectively, up to errors whose sum has
the uniform physical F1 bound with a constant tending to zero after every
cell count, Fourier factor and transport. The maps and the bound must be
derived from those finite gate/Gram data, not defined by the desired
commutator residual. This discharges G1. G2's cylinder comparison remains
an explicit subsequent obligation. Prove it for the same prescribed-KS
comparison system, not an independently chosen continuum realization.

## Sources checked

Repository-relative; direct cited passages checked, with all five cited
report shards read in full. These are support locators, not claims to have
reaudited every theorem in the cited books or shards.

- `report/sections/89_ward_ks_transfer.tex:51–61,73–84,103–142,187–231` — W2, transfer, contacts, open lemma.
- `report/sections/78_categorical_selection_equations.tex:37–68,218–253` — full coefficient algebra, exact gates, collar bound and open D2-C.
- `report/sections/79_ks_shell_and_refinement_defect.tex:51–107,116–138,249–261` — prescribed modes, auxiliary control, shell theorem and benchmark boundary.
- `report/sections/81_cft_machine_oar_contract.tex:95–120` — common-system contract and exclusions.
- `report/sections/88_layered_targets.tex:58–80,96–125,148,179–188,240–243` — setting, cells and no promotion.
- `explorations/2026-10-22-astra/D2-selection-principle/NOTE.md:549–594,612–701` — Gram, two-loss version, C1–C6, plane identity and explicit open bridge.
- `explorations/2026-10-22-astra-r2/E4-ward-to-ks-transfer/NOTE.md:33–69,90–204,369–410,526–547` — finite multiplier, assumed endpoints, formal contacts and missing geometry.
- `explorations/2026-10-22-astra-r2/E4-ward-to-ks-transfer/REVIEW.md:8–36,74–98,199–240` — previous grade and W2 tautology warning.
- `explorations/2026-10-22-astra-r2/E4-ward-to-ks-transfer/INTEGRATION.md:79–136` — cells and original proposed next lemma; its old mixed-family suggestion is already qualified by CA-89:113–115.
- `cft_machine/research/virasoro_routes.md:55–80,151–192` — actual admissible-control convention, exclusions, VR-2.
- `CONVENTIONS.md:444–461,695–718,801–810,830–869,1397–1448,1450–1469,1486–1562` — signs, Gram, independent central constants, modes, layers; corrected ar locator.
- `references/lattice-symmetry/GransSamuelssonEtAl2020/source/Linnea11.5.tex:791–820,3191–3198,3220–3229` — KS formula and explicitly conjectural modified central bracket.
- `references/lattice-symmetry/KooSaleur1993/source/9312156.tex:1095–1108` — intermediate-state caveat.
- `references/cft/Schottenloher2008/Schottenloher2008.md:2507–2517,2552–2589,2610–2634,5069–5087` — continuum cocycle recurrence and formal TT OPE.
- `references/lattice-symmetry/ChelkakGlazmanSmirnov2016/source/StressTensor.tex:527–532` — proved n=1 scope only.
- `references/text/CFTFromLatticeFermions.txt:881–892,2813–2823,2887–2897,3383–3414,3482–3498` — CAR, central normalizations, actual no-wrap modification, fixed-core theorem.
- `references/cft-machine/fermion/SOURCES.md:1–37`; `references/cft/SOURCES.md:9–31`; `references/lattice-symmetry/SOURCES.md:9–38,966–997,1732–1757` — local provenance.
- `cft_machine/benchmarks/fermion/PROOF.md:12–17,50–74,78–142`; `cft_machine/benchmarks/fermion/runs/2026-09-22/results.toml:1` (whole file) — definitions, earlier derivations and nine cocycle oracles.
- Relative to this directory: `checks/fermion_core.py:18–157`, `checks/fermion_check.py:23–194`, `checks/fermion_collar.py:1–53`, `checks/ks_converse_check.py:1–230`, `checks/reviewer_qutrit.py:1–111`; associated original JSON/results/manifests and new `review_*` raw outputs — implementations and reproducibility evidence.

No edits outside the permitted directory; NOTE.md and original check
artifacts were preserved. No commits, pushes, report build or Julia suite.
