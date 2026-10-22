# INTEGRATION — D6 functor and obstruction theory → CA-75

Reconciler: Opus, 2026-10-22. Basis: `NOTE.md` and `REVIEW.md` (this directory).
Nothing here is committed. Section numbers (§) refer to `NOTE.md`.

## (a) Replacement paragraph for CA-75's D6 placeholder

Replaces `report/sections/75_integration_map.tex:224-225`. It uses the shard's
macros (`\Cc`, `\Alg`, `\mathsf E`) and has no model detail.

```latex
\item[D6 functor and obstruction theory.] Audited
(\path{explorations/2026-10-22-astra/D6-functor-and-obstruction-theory/NOTE.md}; review \path{REVIEW.md} there).
\textbf{Types [Proposal].} Sources are \((\Cc,\mathsf E,\mathsf B)\) with declared chirality, energy lift, carriers, fields and fidelity, and arrows unitary braided equivalences transporting \(\mathsf E\) (\S1).
Targets are towers \((\Alg_n,\alpha_n,h_n,\sigma_n,T_{n,k})\) with defect and certificate data; morphisms are state-preserving unital \(*\)-maps with graph-norm mode comparison (\S2--3).
Certified continuum passage factors through the localisation at limit-onto morphisms [Conditional, P5; the continuum target category is not yet typed].
\textbf{Contract.} K0--K12 (\S2) refine the list above by adding dynamics convergence in the same GNS system (K8), typed defect bimodules (K10) and effective coherent transport (K12).
\textbf{Link (b) [Derived].} If a unital \(*\)-map satisfies \(\alpha_n(a)W_n=W_na\), then \(d_{k,n}\le p_ne_n+2(1-p_n)\), where \(p_n=\sigma_{n+1}(W_nW_n^\dagger)\) and \(e_n\) is the normalised-pullback mismatch (P2, \S4).
A unital reducing extension exists iff an integer multiplicity condition holds (P1); vacuum insertion meets that condition for every \(\Cc\), so locality is what remains open.
\textbf{[Negative]} For \(P\neq1\), the completion defect of Theorem~72.7 has operator norm \(|\chi(ab)-\chi(a)\chi(b)|\) (N1), so Corollary~72.8's softness claim needs operator-norm control.
\textbf{Link (a) [Derived, fixed mesh].} Exact gate histories form a finite sewing map, and \(m\)-cell Ward residuals are bounded by \(M^2\sum_j\|W_j\|\) (P3, \S5); comparison with LC-1 at the same geometry is open.
\textbf{Obstructions [Derived, formal].} A declared presentation complex gives an exact order-by-order class in its \(H^2\), reducing to HH\(^3\) on the binary fragment (P4, \S6).
No cohomology-only existence test follows (N2, N3). Positivity, rates, sector completeness, the \(8\mathbb Z\)-torsor of charge lifts and coherent selection (a group-\(H^2\)/splitting problem) are separate obligations (\S7).
\textbf{Headline [Conjecture, to be reformulated].} D6-C asks for an effective, coherent compiler for every unitary modular \(\Cc\). It contains the open realisation problem, and its chiral-limit clause should become a full two-chiral target (review A1).
```

(19 lines inside the `\item`.)

**Required companion edits elsewhere in CA-75 (for the integrator, not part of the paragraph):**
1. `75_integration_map.tex:145-147`: delete "and the modulus of softness of
   the unital completion (Corollary 72.8)", or qualify it as "in GNS seminorm
   only". N1 is confirmed in REVIEW §3 and independently by D3.
2. `:149-152` (b1): add that for braided C a local unital lift is proposed
   (REVIEW R1, sketch). If R1 is confirmed, (b1) is answered without a soft
   variant and only (b3) remains.
3. `:154-155` (b2): answered in the strict tier by P2 (the bound above).
4. Contract item 7 / CONVENTIONS: record that (af) uses `H=+Σh` and (ak) uses
   `H=-Σh`, so `h^(af)=-h^(ak)`.
5. Contract mapping (CA-75 item → K-axiom): 1→K0, 2→K1, 3→K3, 4→K1+K2,
   5→K4, 6→K5, 7→K3, 8→K3/K6 residual ledger (no separate K-row; keep CA-75's),
   9→K6, 10→K9 (covariance part), 11→K9, 12→K7, 13→K11 (+K10).
   Not in CA-75: K8 (dynamics), K10 (typed defects), K12 (effectivity/coherence).
   These should be added as items 14–16.

## (b) Promote to shard

**Primary — `CA-88-CORNER-TO-WILSON-BRIDGE`** (ID proposed; renumber if
other reconcilers claim it). Title: *Corner Weight, Unital Lifts and the
Wilson Drift Bound*. Status mix: derived plus one proposal. ~200 lines.

1. Sources/dependencies: CA-68, CA-71, CA-72, CA-73, WT-1 (`wilson_triangle.md:20-38`), 2306.16063 eq. (29).
2. Setting for general finite multi-matrix algebras: isometry W, corner θ, P=WW†.
3. Lemma P1 [derived]: unital reducing extension iff integer complement multiplicities exist.
4. Corollary [derived, R2]: vacuum insertion with `1⊂O` satisfies P1 for every C.
5. Proposition [proposal, R1]: braided C gives a local unital lift via the interleaving braid, of range 3 and with no physical support growth. Fusion C needs a half-braiding on O. Include a non-pointed check.
6. Theorem P2 [derived]: `‖σα−ρ‖≤p‖τ−ρ‖+2(1−p)`; WT-1 row bound `d_{k,n}≤p_ne_n+2(1−p_n)`; relation to CA-72's `v_n²`.
7. Remark: Σ(1−p_n)<∞ is a *global* fidelity requirement on extensive insertion (exact-RG strength).
8. Negative N1 [derived]: CP completion defect in operator norm; correction of CA-72 Cor. 72.8.
9. Correction of CA-73 Lemma 73.1: polynomials with constants transport with unit P.
10. Boundary and check: what remains is CA-75 (b3), the attainability of summable p_n for critical states, plus the Julia/py check bundle (P2 sharpness 32/25, N1 example).

**Secondary (optional) — `CA-89-TYPED-COMPILER-AND-OBSTRUCTION-LEDGER`.** D1–D3,
OAR localization and P5 (with the continuum category typed), P4's
presentation complex, and the §7 obstruction table. Promote only after
D6-C is reformulated (A1) and P5's target category is defined. Otherwise
CA-75 plus this INTEGRATION file already carry the content.

## (c) Links to D1–D5

- **D1 (carrier theory)**
  - *Depends on and agrees with D6.* D1-T1 proves that trailing insertion `α_L(a)=a⊗id_O` is unital and distinct from θ, and that "calling vacuum insertion a unital inclusion is false" (`../D1-carrier-theory/NOTE.md:126-151`). Trailing insertion is the simplest instance of P2's hypothesis.
  - D1-T5b derives the same scalar `2(1−√p)` as the GNS overlap (`:376-385`).
  - D1's marked tensor structure is what R1's half-braiding condition (O lifts to Z(C)) would refine.
- **D2 (selection principle)**
  - *Feeds* K3 (critical coupling) and K7 (Ward equations, geometric stress certificate).
  - *Contradicts D6-C's chiral clause.* D2-C's target is a two-dimensional theory with two Diff actions.
  - D2's condition C5, "coherent, support-controlled, unital injective *-maps" (`../D2-selection-principle/NOTE.md:678-682`), is exactly K2. R1 would supply it for braided C.
- **D3 (refinement meets dynamics)**
  - *Duplicates and corroborates.* D3-1's second inequality is P2. D3 §1 independently gives N1 ("Softness topology") and the corner-unit correction of CA-73.
  - *Feeds P2.* D3-C's polar refinement `W_L(t)` is a concrete dressed `W_n` whose corner weight `p_n` and mismatch `e_n` P2 converts into WT-1 drift.
  - D3 lists "construct a local unital lift" as open; R1 answers it for braided C.
- **D4 (Koo–Saleur beyond free)**
  - *Is the relative version of D6-C.* D4-C *supplies* an effective positive sewing completion S and constructs the lattice discretisation. D6-C explicitly forbids that input (`NOTE.md:40-42`).
  - So D6-C ⇔ (Lemma 1 of §8: positive conformal enrichment, the open realisation problem) + D4-C + coherent selection (§7).
  - D4 targets the diagonal full theory "so that the regulator has no imposed chiral imbalance", which *contradicts* D6-C's chiral limit.
  - D4 feeds K6 (VR-1 instances).
- **D5 (fidelity and lattice sewing)**
  - *Feeds* K10/K11: the endpoint/junction DHR functor `C→DHR_fin(A_L)` and annular saturation give the completeness certificate that D6 leaves as a bare obligation.
  - *Feeds* Link (a) beyond P3: reflected-positive exact-exponential cells.
  - D5-C's full two-chiral target *contradicts* D6-C's chiral clause.
  - D5-C's "single procedure on promised-valid presentations returning computable enrichment" is D6-C's effectivity clause without the coherent-functoriality part.

## (d) Headline verdict

**Verdict: needs reformulation.** As stated, D6-C is (i) at least as hard as
the open realisation problem for all unitary modular categories
(`references/cft-machine/realisation/Bischoff2018/source.tex:368-373`),
(ii) in tension with a one-dimensional regulator, because it asks for a
chiral net as the OAR limit, contradicting D2/D4/D5 and the note's own
K3/K6, and (iii) silent on whether braided autoequivalences lift to net
automorphisms. A reformulation that makes it a real target would have
three parts:
- (1) a full two-chiral target whose left chiral subnet realises C
  braided-equivalently;
- (2) a split into "enrichment synthesis" (open, continuum) and
  "discretisation of a supplied enrichment" (D4-C), with D6 contributing
  the typed contract, the localisation and coherent selection;
- (3) an explicit automorphism-lifting hypothesis in the functorial clause.

**First attackable lemma.** R1 + P2 for braided C (proposed CA-88):
*for a unitary braided C and `O=1⊕X`, the dyadic vacancy tower with
braided lifts `α_n=Ad_{U_n}∘B_n(·⊗id)B_n†` is a strict local OAR tower
with no physical support growth, and its WT-1 drift obeys
`d_{k,n}≤p_ne_n+2(1−p_n)`.* The algebraic half is a short naturality
proof. The rest of CA-75 Link (b) then reduces to the single question (b3).

**One computation that most reduces uncertainty.** An exact check of R1 on a
**non-pointed** braided instance, with F and R taken from a local source,
for example `references/text/Trebst.txt` per the AGENTS.md example, at L≤4.
Verify unitality, multiplicativity, `α V=V α`, range 3, and that the result
differs from the phase-free interleave. The existing pointed check cannot
discriminate. If it passes, K1+K2 hold for every modular C, which removes
the main unital-map gap shared by CA-68, CA-72, D2, D3 and D6.
Runner-up (source acquisition): a rigorous local reference on whether a
1+1D local lattice system can have a chiral continuum limit (c_L≠c_R).
This would settle A1 instead of leaving it as a reformulation by caution.

## (e) Hypotheses still to be synthesised from category data

1. **Energy enrichment**: c>0 lifting c_top mod 8, and h_i lifting twists,
   with positive integer character multiplicities (E.energy, E.carriers).
2. **Chiral field content** (E.fields): a vacuum chiral algebra beyond
   stress, with positive all-grade sewing (LC-1–3, LC-9–10). This is the
   open realisation problem.
3. **Chirality typing**: a full target with identified left/right chiral nets, and which
   one realises C; for a chiral output, a local extraction of the chiral subnet.
4. **K3**: a bounded-range self-adjoint critical density h_n; velocity normalisation;
   e_n, b_n, and the energy origin consistent with b_n→c/24.
5. **K1–K2**: local unital injective refinements α_n with summable support slack.
   For braided C, R1 (pending check); for fusion C, a half-braiding on O or another route.
6. **K4 via P2**: dressings W_n=U_nV_n and microscopic states with Σ_n(e_n+1−p_n)<∞
   and computable tails. Global corner weight → 1 is exact-RG strength.
7. **K5**: the same GNS system used for every estimate; D3 tower morphisms need exact
   state preservation σ'_nβ_n=σ_n.
8. **K6**: VR-1 A1–A4 with polynomial mode growth, and two central coefficients → the
   declared c (no scalar retuning: `c→c+24a` changes only the linear one).
9. **K7**: a same-geometry comparison of exact-gate histories with LC-1 cells, with local
   errors beating the cell count in bound (3).
10. **K8**: convergence of the refined dynamics; the limit generator equals the normalised
    stress energy.
11. **K9**: positive L0, unique Möbius vacuum, essential self-adjointness, integration to
    projective Diff_+(S¹), local covariance.
12. **K10–K11**: persistent defect bimodules or charged sectors with junctions and
    braiding; split property; finite μ-index; exhaustion of all DHR sectors;
    braided equivalence with C.
13. **K12 / functoriality**: computable error moduli; braided autoequivalences of (C,E)
    induced by net automorphisms; vanishing of the group-H² class, or a splitting,
    of the stabiliser action.
14. **Formal layer (P4/P6)**: an initial exact solution x₀ of a declared grammar, killed
    classes [b_N], and bounded right inverses with tame constants on independent
    equation charts.
