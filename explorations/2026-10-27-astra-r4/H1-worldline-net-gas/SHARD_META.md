# CA-103 registration package (2026-10-27, round 4)

Prepared for registration; only the shard `report/sections/103_worldline_net_gas.tex`
and this package are written. No canonical registration, amendment, commit or
network action is performed. **P2** (the C-evaluated spacetime worldline ensemble,
and exactly when it is a probability law), with **P1** inseparable (vacancy flags,
occupied unit copies, birth/death/nu reactions on the indefinite-N carrier).
NOTE/REVIEW/INTEGRATION below are the files in this H1 directory. Grades follow
`REVIEW.md:3-15` (H1 as posed: **COUNTEREXAMPLE**; corrected statements:
**WEAKER-RESULT-PROVED**) and the lift table `INTEGRATION.md:10-35`.

## 1. `report/SHARD_CATALOG.md` entry

```markdown
## `CA-103-WORLDLINE-NET-GAS`

- Source: `report/sections/103_worldline_net_gas.tex`
- Title: The Worldline Net Gas on the Pointed Carrier: Exact Dictionary, Physical Trace, Conditional Markov Law and Sign Structure
- Summary: For any unitary fusion C and pointed O = 1 + X, exact tiles exp(th) expand into decorated C-evaluated spacetime nets; the physical Gibbs trace is tr_C(J_L .), J_L = sum_c P_c/d_c, so only contractible loops carry d_a, and inverse-Gram sewing gives a domain Markov law for disk sub-patches conditional on nonnegative weights.
- Summary: The coefficient-sign "iff" fails both ways (occupation gauge; pseudoreal X, kappa = -1); a nonnegative complete unitary F calculus exists iff the generated subcategory is Hilb_G with trivial associator class; temporal RP and termwise positivity of a fixed presentation are independent. Scaling is conjectural; next is loop-sector positivity under the physical trace.
- Keywords: worldline net gas, spacetime string-net, Levin-Wen rules, exact tile expansion, pointed carrier, vacancy flag, physical Gibbs trace, J_L, Markov trace, inverse Gram sewing, domain Markov, Frobenius-Schur indicator, kappa, F-positivity, stoquastic, holonomy, reflection positivity, CLE, H1, P2, P1
```

## 2. `report/README.md` include-order row

```markdown
| 103 | `CA-103-WORLDLINE-NET-GAS` | `report/sections/103_worldline_net_gas.tex` | The Worldline Net Gas on the Pointed Carrier: Exact Dictionary, Physical Trace, Conditional Markov Law and Sign Structure |
```

## 3. `report.tex` include

```latex
\include{report/sections/103_worldline_net_gas}
```

## 4. Proposed `CONVENTIONS.md` entries

Checked (a)-(aw) and (ax). Reused without redefinition: (r) raw cup `v`,
`v†v = d_a`, and the mandatory FS flag `kappa_X`; (aj) isotropic vertex norm
(Fibonacci case); (ak) `H = -sum h_j`, brick-wall histories; (al) `T_j(t) = exp(t h_j)`,
cut spaces `H_gamma`, Gram `G`, linear-in-second-slot forms; (am) pointed site,
`tau_L = Tr_C/d_O^L`; (aq) tags. The three entries below cover only notation the
shard introduces. **Lettering is provisional:** (ay)-(ba) collide with the other
round-4 proposals (CA-101's G1 SHARD_META proposes (ay)-(az); CA-102's G6 and
CA-104's H3 SHARD_META each propose (ay)-(bb)) and with the
deferred round-3 packages listed in (ax); they must be merged and re-lettered
sequentially with those proposals at registration.

```markdown
## (ay) Pointed tile dictionary and vertex normalisation, general C (2026-10-27)
**Scope:** CA-103; generalises (aj) to arbitrary unitary fusion C and replaces the
"NOT YET FIXED" nu normalisation of (ak).
**Choice:** Flags `I = {∅} ⊔ {(a,r) : 1 <= r <= m_a}` for `X = ⊕_a C^{m_a} ⊗ a`,
`i_∅ = eta`. The vacancy flag is written `∅`; it is distinct from occupied unit
copies `(1,r)` and is never written with the raw-cup letter `v` of (r).
Isometric vertices `u^{ab}_{c,mu}`, `u_mu† u_nu = delta_{mu nu} id_c`; isotropic
vertices `V = (d_a d_b/d_c)^{1/4} u` (so `V_mu† V_nu = delta sqrt(d_a d_b/d_c)`);
raw cup `V^{a abar}_1` with `V†V = d_a`. For `p = (i,j,mu)` in channel c:
`s^c_p = (i_i ⊗ i_j) u^{a_i a_j}_{c,mu}`, `g_p = (d_{a_i} d_{a_j}/d_c)^{1/4}`,
matrix units `E^c_qp = s_q s_p†`, tiles `D^c_qp = g_q g_p E^c_qp`, exact tile weights
`w^c_qp(t) = [exp(t h^c)]_qp/(g_q g_p)`. Vertex tiles
`nu^R = (i_(a,r) ⊗ i_(b,s)) V^{ab}_{c,mu} (eta† ⊗ i_(c,l)†)`, `nu^L` mirrored;
`(nu^R_mu)† nu^R_nu = delta sqrt(d_a d_b/d_c) P_(∅,c,l)`; raw theta graph `sqrt(d_a d_b d_c)`.
Nets are tile-decorated (flags, copies, multiplicities); a bare net's coefficient
is a sum of products.
**Known clash:** `D^c_qp` are (ak)'s tiles `D_alpha` resolved; unrelated to (ar)'s
discrepancy `D_{r,n}` or (aw)'s `D_h, D_b, D_v`. `eta` here is the point of (am);
NOTE's time/space ratio `eta = v_* t/a_x` is renamed `varrho` in CA-103.13-103.14
to avoid that clash.
**Source:** `explorations/2026-10-27-astra-r4/H1-worldline-net-gas/NOTE.md:42-52,61-73,105-118`;
`REVIEW.md:65-77`; `references/text/PenneysUnitaryFusionCategories.md:528-547`.
**Sweep status:** CA-103 only; (aj) is the Fibonacci instance.

## (az) Trace and closure declaration (2026-10-27)
**Scope:** CA-103 and any later statement about Gibbs states as worldline ensembles.
**Choice:** On `H_L = ⊕_c Hom(c, O^{⊗L})` with charge projections `P_c`, the
ordinary Hilbert trace is `Tr_H(T) = Tr_C(J_L T)`, `J_L = sum_c d_c^{-1} P_c`
(central). "Physical Gibbs" means `Tr_H`, i.e. `omega(A) = Tr_C(J_L e^{-beta H} A)/Tr_C(J_L e^{-beta H})`.
"Categorically traced" means `Tr_C` (charge weights `d_c`). A fixed-charge trace
uses `P_c/d_c`. "Planar/categorical closure" is closure inside Ev_C. The rule
"closed component = d_a" applies only to contractible components of Ev_C; a
time-wrapping component is not a circle and its weight must be computed.
**Known clash:** `J_L` is unrelated to the KS current `J_j` of (al)/(ap).
**Source:** `explorations/2026-10-27-astra-r4/H1-worldline-net-gas/NOTE.md:201-221`;
`REVIEW.md:99-103,124-129`.
**Sweep status:** CA-103 only.

## (ba) Loop-tile orientation, FS rule and path holonomy (2026-10-27)
**Scope:** CA-103 and any positivity statement about loop/pair tiles.
**Choice:** The unoriented raw cup/cap calculus of (r) is allowed only for
`kappa_X = +1`. Otherwise use *proper* oriented cups: both snakes trivial; for
`Vec_G^omega` with `X ⊇ g ⊕ g^{-1}` the ratio is `theta_-/theta_+ = omega(g,g^{-1},g)`.
Tile coefficients refer to these cups. "Holonomy" of a presentation means the
U(1) phase product along a cycle of the path multigraph of all nonzero
off-diagonal entries of the `h_j` in a fixed orthonormal fusion-path basis of
`H_L`, parallel edges for different j included. "Stoquastic up to gauge" means
all holonomies are 1 (CA-103.11). "Positive presentation" is always relative to a
fixed presentation unless the allowed class of changes is declared.
**Source:** `explorations/2026-10-27-astra-r4/H1-worldline-net-gas/NOTE.md:356-397,474-508`;
`REVIEW.md:42-56,137-147,166-169`; `references/text/PenneysUnitaryFusionCategories.md:1032-1047`.
**Sweep status:** CA-103 only; CA-86 Cor. 86.2 needs it (amendment below).
```

## 5. Dated amendment pointers

Each anchor is literal current source text; append the supplied text immediately
after it. These are pointers, not edits. Source list: `INTEGRATION.md:51-78`.

### c1. CA-86 Corollary 86.2

File: `report/sections/86_spacetime_trotter_dictionary.tex:110`.
Anchor: `\(O(\delta\tau)\)); isotropy can only emerge in the continuum.`

```latex
\emph{Amendment (2026-10-27, round 4):} ``A closed \(X\)-loop evaluates to \(d_X\)'' and ``isotopy holds for \(\operatorname{Ev}_\Cc\)'' require proper oriented duality or \(\kappa_X=+1\): for pseudoreal \(X\) with raw unoriented cups \(v,v^\dagger\) a W-shaped loop evaluates to \(\kappa_Xd_X=-d_X\) (CA-103 Negative 103.9; H1 \path{checks/review_holonomy_output.txt}:5--13); under the physical trace only contractible loops carry \(d_X\) (Proposition 103.4).
```

### c2. CA-86 Lemma 86.1

File: `report/sections/86_spacetime_trotter_dictionary.tex:93`.
Anchor: `second-order factor on at least one plaquette.  \(\square\)`

```latex
\emph{Amendment (2026-10-27, round 4):} The exact, decorated version without remainder is CA-103 Theorem 103.1; with multiplicities or copies a bare net's coefficient is a sum of products, not a single product.
```

### c3. CA-80 after Corollary 80.3

File: `report/sections/80_lattice_sewing_and_fidelity_certificate.tex:104`.
Anchor: `\(\lambda_{\min}(h^a)\ge-1/t\) on every block (\(t>0\)).`

```latex
\emph{Amendment (2026-10-27, round 4):} Temporal RP versus termwise net positivity is CA-103 Proposition 103.12, valid for a fixed presentation only (a multiplicity rotation can remove the sign on one bond); the \(Z_P\) display of this shard ranges over tile-decorated nets (Theorem 103.1).
```

### c4. CA-75 Link (a)

File: `report/sections/75_integration_map.tex:138`.
Anchor: `cells converge to a solution of C1--C6?`

```latex
(\emph{Amendment 2026-10-27, round 4:} the finite P2 object is CA-103 Theorem 103.1--Proposition 103.6; (a2) is answered for leg cuts only (CA-80, Lemma 103.5, disk sub-patches); (a3) gains the exact finite response 103.13, with no KS identification; nothing new for (a1) or (a4).)
```

### c5. CONVENTIONS (ak)

File: `CONVENTIONS.md:1405`.
Anchor: `normalisation is NOT YET FIXED and must be recorded before first use).`
Append (plain text, after the anchor line, as an inline addendum in the style of (aj)'s
CA-87 addendum):

```markdown
*Amendment (2026-10-27, round 4):* the nu, nu† normalisation is now fixed for general C by the proposed (ay) (isotropic `V = (d_a d_b/d_c)^{1/4} u`, `(nu^R)† nu^R = sqrt(d_a d_b/d_c) P_(∅,c)`), CA-103 Proposition 103.2; the identification "loop fugacity n = d_X" holds for contractible loops under kappa_X = +1 or proper oriented cups (CA-103.8, 103.9).
```

### c6. Worklog 023 (frozen; correct in the next worklog entry, do not edit 023)

Pointer text for the next entry: "*Correction (2026-10-27, round 4, H1 review):* worklog 023:37-44's 'SLE/CLE appears once in the repo' is wrong: CGS:527-532 and :784-796, MorinDuchesnePearce2019 and VernierJacobsenSaleur2014 RegimeIII-v3.tex:2525-2527 all bear on it; AFM-S:39-89, :128-139 already state the W = A·eval_C geometric ensemble. 023:54-58's 'quantum dimensions as loop weights' holds only for contractible loops under the physical trace (CA-103 Proposition 103.4, J_L)."

### c7. `references/lattice-symmetry/SOURCES.md` (acquisition lead; no acquisition now)

File: `references/lattice-symmetry/SOURCES.md:1989` (end of file).
Anchor: `  generator recipes not central to the Koo-Saleur/discrete-Ward question.`

```markdown

## Acquisition lead (2026-10-27, round 4, H1 review; not acquired)

- **SG1 lead:** S. Sheffield and W. Werner, "Conformal loop ensembles: the Markovian characterization and the loop-soup construction", Ann. Math. 176 (2012) 1827, arXiv:1006.2374. Located only as a bibliography entry at `references/lattice-symmetry/VernierJacobsenSaleur2014/source/RegimeIII-v3.tex:2525-2527`; needed for CA-103 Conjecture 103.14 (SG1). Acquire only when Tobias authorises network use.
```

### c8. CA-88 grid row (new row; the CA-86/CA-87 row is unchanged)

File: `report/sections/88_layered_targets.tex:153`.
Anchor (the CA-94 row): `CA-94 & any (open) & \(\mathsf L0\) + decl.\ & \(\mathsf R0^{c}\) + \(z{=}2\) & D1-C proved for tuned family [derived]; N1--N3 [negative]; fixed-\(h\) E6 false; \(\Cc\) not inert: \(G_r\) bounds range-\(r\) number change (94.11) \\`
Insert after it (merge in CA order with any round-3/4 rows registered first):

```latex
CA-103 & any & \(\mathsf L0\) + decl.\ (\(O\), \(h\), tile basis (ay), closure (az)) & finite, \(\to\mathsf R3\) & exact net gas, \(J_L\) physical trace [derived]; disk domain Markov [cond.]; D-F sign classification [derived]; loop-sign iff, RP vs fixed-presentation positivity [negative] \\
```

## 6. `INDEX.md` fragment (checks bundle)

```markdown
| `explorations/2026-10-27-astra-r4/H1-worldline-net-gas/checks/` | Round 4 H1 (worldline net gas): five author scripts (`check_patch.py`, `check_signs.py`, `check_fs_instance.py`, `check_anisotropy.py`, `source_audit.py`) and two Opus reviewer scripts (`review_holonomy.py`, `review_d3_rotation.py`), python3/SymPy/NumPy, exact finite calibrations with raw outputs; eight author and two reviewer mutations rejected. Lifted into CA-103 (REVIEW: COUNTEREXAMPLE as posed, WEAKER-RESULT-PROVED corrected). Not yet ported to `scripts/` with run bundles. |
```

## 7. Worklog paragraph

**H1 worldline net gas → CA-103 (P2, with P1).** *Verdict:* H1 as posed
COUNTEREXAMPLE; corrected statements WEAKER-RESULT-PROVED (Opus review, grades
carried verbatim, gaps G1-G4 written into the statements). *Headline (all any; L0 +
declarations; finite, →R3 ingredient; no rung reached):* exact decorated tile-to-net
dictionary and patch expansion, nu norms fixed for general C [derived, 103.1-103.2];
Ev_C rules, Markov-trace identities, CP conditional expectation with standard
coev_O [derived, 103.3]; physical Gibbs trace Tr_H = Tr_C(J_L ·), only contractible
loops carry d_a [derived + negative, 103.4]; inverse-Gram sewing with exterior
functional on disk sub-patches [derived, 103.5] and the boundary-tensor domain Markov
law [conditional on nonnegative scalar weights, 103.6]; endpoint labels insufficient,
G^{-1} signed [negative, 103.7]; planar-closure loop positivity and phase criterion
[derived, 103.8]; coefficient-sign iff fails both ways (occupation gauge; pseudoreal
X, kappa = -1) [negative, 103.9]; Theorem D-F: nonnegative complete unitary F iff
<X> ≅ Hilb_G with [omega] = 0 [derived, 103.10]; path-holonomy stoquasticity
criterion [derived, 103.11]; temporal RP vs fixed-presentation positivity
[derived/negative, 103.12]; exact weight ODE, anisotropy not fixed by C [derived/negative,
103.13]; E-scaling and E-Markov [conjectural, 103.14], with SG1-SG4 and the
Sheffield-Werner lead recorded as acquisition items. *Next:* Target 103.15,
loop-sector positivity under the physical trace for arbitrary C with kappa = +1 and
proper oriented cups. *Corrections to the brief found by the reviewer:* (a) bare-net
labels are not enough, coefficients are sums of products; (b) "closed worldline = d_a,
decouples" holds only for contractible components of Ev_C, the physical trace needs
J_L, and there is no statistical decoupling; (c) a probabilistic Markov law needs
positivity, and the cut datum is the full boundary functional; (d)(i) the iff fails
both ways and kappa_X (mandated by CONVENTIONS (r)) was omitted, as in CA-86 Cor. 86.2;
(d)(ii) N_XX^X ≠ 0 is the wrong trigger: phases are forced by any noninvertible
simple through F^{a abar a}_a, and F-signs do not imply gas negativity; (e) no L0
relation fixes anisotropy (h ↦ qh); AFM-S already states the W = A·eval_C ensemble,
CA-78 Prop. 78.2 already removed the O(dtau^2) remainder, and SLE/CLE is discussed in
local sources (worklog 023 understates it). "→R1" for H1-A is withdrawn.
