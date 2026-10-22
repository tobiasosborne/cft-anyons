# INTEGRATION: D5 fidelity and lattice sewing into CA-75

Companion to `REVIEW.md`. All status labels below already reflect the reviewer grades. "Note §"
refers to section headings of `NOTE.md`.

## (a) Replacement paragraph for CA-75's D5 placeholder

Replace `report/sections/75_integration_map.tex:222-223` with:

```latex
\item[D5 fidelity and lattice sewing.] Reconciled 2026-10-22 (\path{explorations/2026-10-22-astra/D5-fidelity-lattice-sewing/}, \path{NOTE.md}, \path{REVIEW.md}).
\emph{Cells.} For unitary fusion \(\Cc\) and site object \(O\), finite brick patches with oriented cuts \(\bigoplus_a\Hom_\Cc(a,W_\gamma)\)
compose exactly with inverse-Gram contraction, and dual block bases change by \(F^{-T}\) already at a lattice cut
(Lemma D5-S, derived; restates LC-9 Lemma FP-D); this answers Link~(a2) for cuts along tile legs only.
\emph{Positivity.} Temporal reflection positivity of exact exponential tiles is equivalent to positivity of each charge block
of the seam operator; it forces \(h=h^\dagger\), not signs of tile coefficients, and the symmetrised row \(A^{1/2}BA^{1/2}\) is
positive and similar to CA-86's \(AB\) (D5-P, D5-R, D5-G, derived; spatial reflection positivity is a Question).
\emph{Ward.} Exact Duhamel and continuity identities show that Link~(a3) requires the \emph{total} Ward residual over a growing
patch to vanish (D5-W, derived; conformality is a Question).
\emph{Fidelity, item 13.} Convergent fusion operators prove nothing: \(D_a=d_a\one\) satisfies every fusion and commutation
identity (D5-D, derived). The proposed certificate is two-sided: a fully faithful, dimension-preserving braided functor
\(\mathsf B\to\mathrm{DHR}_{\mathrm{fin}}(\mathcal A)\) from lattice endpoints (lower bound) and a four-interval index bound
\(\mu_{\mathcal A}\le\operatorname{Dim}\mathsf B\) (upper bound) force completeness through KLM's \(\mu_{\mathcal A}=\sum_\rho d_\rho^2\)
(Theorem D5-F, conditional; deriving the index bound from finite-dimensional Pimsner--Popa bounds is open, REVIEW \S3).
Annular expectations cannot preserve the vacuum (D5-V, derived).
\emph{Modular data.} Modular covariance and Verlinde fix the defect eigencharacters but not their multiplicities (D5-M,
conditional), and for \(c>1\) a modular-positive vacuum character needs infinitely many Virasoro primaries (D5-H, conditional;
sharp form of LC-12~\S5). \emph{Headline.} D5-C, an annularly saturated lattice realisation of every UMTC, contains the
open reconstruction problem; it is a Conjecture, not a pipeline step.
```

Line count inside the block: 19. Macros used: `\Cc`, `\one`, `\Hom`, `\path`, `\mathsf`,
`\operatorname`. CA-75 already uses all of them (75_integration_map.tex:17-18, 66-68, 82).

Also suggested for the CA-75 acceptance contract (a Proposal, no new claim):

- **Item 13 (Fidelity):** add "[C] D5-F lower/upper certificate (conditional); [P] F2 fullness and
  an index bound valid in the limit".
- **Item 12:** add "total Ward residual bound (D5-W)".
- **Examples table:** add the row "Arbitrary \(\Cc\): \(D_a=d_a\one\) | fusion identities without
  charge separation (D5-D)".

## (b) Promote to shard

**Primary: CA-88-TWO-SIDED-FIDELITY-CERTIFICATE**, "A Two-Sided Fidelity Certificate: Endpoint
Functors and Annular Index Bounds". This is the one genuinely new, model-independent mechanism. It
discharges the "exclusion of unintended sectors" in CA-75 item 13 and D6's K11. Promote only after
the D5-F repair in REVIEW §6.1.

Outline:

1. Status, sources (KLM :430-443, :507-556, :688-702, :1719-1729, :1899-1900; B:364-392; MS:175-179;
   AFM-D/AFM-J), dependencies (CA-75 item 13, CA-81, CA-82 as the sourced instance).
2. Declared target: E1 (B = C versus Z(C) versus defect target), and the D1 proposal of a full
   theory with a tested chiral subnet.
3. Negative lemma: scalar fusion representation D_a = d_a·1. Fusion-operator convergence is not
   fidelity (D5-D).
4. Bounded defect transport lemma, with its limits (D5-D proof). Endpoints need localised
   endomorphisms, not global D_a.
5. Four-interval inclusion N ⊂ M and μ_A. Statement of F1–F3, with F3 in a repaired form (normal
   limit expectation or infinite-factor approximants).
6. Theorem: lower plus upper bound forces braided equivalence onto the complete sector category
   (D5-F, Lamport proof).
7. Lemma: no vacuum-preserving annular expectation unless μ = 1 (D5-V).
8. Lemma: the finite-probe repair estimate gives M = ∨M_k (D5-A), with b_r exact.
9. Necessary modular tests: Verlinde eigencharacters and multiplicity freedom (D5-M), and the c > 1
   growth obstruction (D5-H). Neither is sufficient.
10. Open obligations, the examples table (scalar falsifier, LC-12, LC-13 instances), and the
    boundary.

**Secondary (optional, lower priority): CA-89-LATTICE-CELL-CALCULUS**, "Exact Lattice Cells,
Temporal Reflection Positivity and Ward Residuals". This would collect D5-S/P/R/G/W as the partial
answer to CA-75 Link (a): typing at cuts, leg-cut sewing, temporal RP criterion, symmetrised row,
spectral positivity, total Ward residual. It is mostly standard. A subsection of CA-75 or a merge
into a D2 selection shard may suffice. Rename e_j first (REVIEW §2.2).

## (c) Links

- **D6 (functor and obstruction theory): overlaps and feeds.**
  - D6-C (`D6-functor-and-obstruction-theory/NOTE.md`, headline) is essentially the same universal
    algorithmic conjecture as D5-C. Both have the near-vacuous uniformity clause (REVIEW §4.8).
  - D6's K11 completeness row ("finite μ-index and identification of all irreducible DHR sectors")
    is the item D5-F discharges via lower plus upper bounds.
  - Small mismatch: D6 selects a rational c lift, while D5 E2 allows real c_L,c_R. Not a
    contradiction; the integration should fix one convention.
- **D4 (Koo–Saleur beyond free): depends on.**
  - D5-C item 2 and E6 need VR-1-type graph-norm bounds for the KS modes. D4 is where these would
    come from.
  - D4-C takes as *input* an "effective positive rational conformal sewing completion" whose sector
    category is ribbon-equivalent to C. That is exactly D5's E3/E4 plus the conclusion of D5-F.
    D5-F turns D4's input-side fidelity into a checkable lattice-side certificate.
- **D3 (refinement meets dynamics): depends on.**
  - D5-C item 2 requires WT-1 drift (E6). D3's polar refinement W_L(t) = T_L G_L^{-1/2} with
    G_L(t) = V* e^{-2tH} V is a positive Gram construction of the D5-G/D5-R type.
  - D5-D's transport hypothesis (summable ||D_{n+1}J_n − J_n D_n||) requires D3's refinements to
    intertwine the C-defects. D3 should check that its polar maps commute with the pulling-through
    defects.
- **D2 (selection principle): depends on and is consistent with.**
  - D5-C requires a dynamics whose complete chiral category is exactly C. AFM-J:123-128 warns this
    generically fails, so a selection principle is indispensable.
  - D2's geometric stress certificate (C1–C6, contact Ward equations, positive blocking) contains
    D5-W's total Ward residual obligation and D5-P's temporal RP.
  - D2's "No entrywise positivity of diagram coefficients is assumed" (D2 NOTE.md:65) agrees with
    D5-P.
- **D1 (carrier theory): feeds.**
  - D5's endpoint/junction construction (E7, F2) needs the carrier on which localised charged
    endomorphisms live.
  - D1's tensor-generation requirement on O matches D5-C item 1.
- **Contradictions:** none found with D1–D4 or D6, or with CA-75, CA-82, CA-86 or PLAN D1.

## (d) Headline verdict

**needs-reformulation.**

- D5-C as stated is correctly labelled a conjecture, but it is not a research target one can
  attack. It strictly contains the open UMTC reconstruction problem (B:364-372), adds the whole
  OAR/KS analytic layer, and has a uniformity clause that proof search trivialises.
- The attackable research target inside the note is: **two-sided fidelity, meaning that a fully
  faithful endpoint functor plus an index upper bound of Dim B, both obtained from lattice data,
  imply complete braided fidelity of the continuum net.**
- **First attackable lemma:** a finite-stage index lemma that provably passes to the limit. If
  N_k ⊂ M_k are finite-dimensional with compatible expectations E_k that preserve a faithful normal
  state, and E_k − λ_k·id is completely positive with λ_k → 1/D, then there is a normal expectation
  E: M → N with E ≥ (1/D)·id, so μ_A ≤ D. This repairs D5-F <1>1. It is pure operator algebra, has
  no model content, and is checkable against index theory.
- **The one acquisition that most reduces uncertainty:**
  - Acquire, into `references/` (Law 1), Pimsner–Popa 1986, *Entropy and index for subfactors*,
    and a source on index for non-factor and finite-dimensional inclusions and its commutant
    behaviour. Candidates: Kosaki's index book/notes, Baillet–Denizeau–Havet 1988, Frank–Kirchberg
    on complete PP constants.
  - These settle whether F3's checkable finite form can carry the upper bound at all.
  - The cheapest follow-up computation is to evaluate finite PP constants of a four-interval
    approximant in the one sourced local limit (CA-82's instance), as a calibration of whether F3
    is even satisfiable.

## (e) Hypotheses still to be synthesised from category data

None of these follows from (C, F, R, dagger) alone. Each is declared input or a synthesis
obligation.

1. **E1 target:** the D1 choice (B = C, B = Z(C) with half-braidings, or a defect target), the
   module/boundary category, and the left/right chiral subnet identification.
2. **E2 conformal lift:** c_L, c_R > 0 with c ≡ topological charge mod 8 (EG:334), the weights
   h_i lifting θ_i, vacuum and Casimir subtractions, velocity, and the anomaly line.
3. **E3 extension:** complete characters, the vacuum chiral algebra (for c > 1 it must have
   infinitely many Virasoro primaries by D5-H), branching and Q-system data.
4. **E4 full sewing:** the modular invariant M (Cardy M = 1 in the right-dual convention) plus all
   higher sewing data. MS = SM and MT = TM are only necessary (FRS:487-502).
5. **E5 microscopic data:**
   - a site object O_n containing 1 and tensor-generating C;
   - a self-adjoint bounded-range h_n at criticality on the correct branch (the selection
     principle);
   - seam and trace policy, cutoff schedule, refinements and states;
   - a renamed energy-density normalisation.
6. **D5-P spanning:** half-patch insertions span each cut Hilbert space. Spatial reflection
   positivity, if OS reconstruction needs it.
7. **D5-W/LC-4:**
   - the bounded-support flux and improvement equations δ(J) = −Dq + r and q − e = Du + s;
   - vanishing **total** Ward residual over growing patches;
   - scalar curvature.
8. **E6 analytic:**
   - WT-1 summable drift with unital injective refinements (CA-75 Link b);
   - VR-1 graph-norm bounds for modes, endpoints and products on the same GNS system;
   - trace-norm convergence of heat kernels (D5-M, M2);
   - positive energy, self-adjointness, projective integration.
9. **F1:** irreducibility, strong additivity, split property and covariance of the limit net. None
   of these follows from WT-1 or VR-1.
10. **F2 / E7 lower bound:**
    - oriented pulling-through of C-defects for the chosen O and tiles, with multiplicities and FS
      data;
    - localised, locally normal, transportable endpoint endomorphisms;
    - convergent junctions and tensorators;
    - preservation of braiding, twist and orientation;
    - **fullness** of Hom maps; Gram lower bounds give only injectivity.
11. **F3 / D5-A upper bound:**
    - represented annular inclusions N_k ⊂ M_k exhausting N and M;
    - an index bound of Dim B in a form that passes to the limit (repair pending);
    - the uniform repair estimate (A) with b_r exact.
12. **D5-D transport:** summable operator-norm intertwining errors of the defects and their adjoints
    under the refinements, plus strong convergence of the dynamics.
13. **D5-M:**
    - resolved modular covariance on the sesquilinear block space (M1);
    - identification of the lattice defect algebra with B's fusion algebra (M3; meaningful for
      B = C);
    - identification of the idempotents p_i with chiral sectors.
