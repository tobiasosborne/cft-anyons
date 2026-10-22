# D4 integration into CA-75

Source note: `explorations/2026-10-22-astra/D4-koo-saleur-beyond-free/NOTE.md`.
Audit: `REVIEW.md` in this directory. Section numbers (§n) refer to NOTE.md.

## (a) Replacement for the CA-75 placeholder

This replaces `report/sections/75_integration_map.tex:220–221`. It uses the
shard's own macros (`\Cc`, `\one`, `\path`).

```latex
\item[D4 Koo--Saleur beyond free fields.] Reconciled 2026-10-22
(\path{explorations/2026-10-22-astra/D4-koo-saleur-beyond-free/NOTE.md}; audit \path{REVIEW.md}).
For any unitary fusion \(\Cc\) and self-adjoint \(h\in\operatorname{End}_\Cc(O\otimes O)\), the standard KS modes are
finite tile contractions with exact continuity, adjoint and Fourier-bracket identities (D4-T, \S1) [derived]. Layers
(4)--(5): Theorem D4-P [conditional] reduces VR-1 A1--A4 to a \emph{spectral-shell certificate} P0--P3 for an exactly
transported auxiliary grading \(Q_r\). The certificate has three parts: rapid off-diagonal shell decay of the Fourier
tile sums (a uniform lattice energy bound), low-input residual convergence, and low-input transport with polynomial
cutoff loss. The spare power \(K=Q^p\), \(p>1\), turns fixed-core estimates into graph-norm bounds; a counterexample
shows it is needed at \(p=1\) (\S3, D4-B, D4-I) [derived]. No chain, free or interacting, is yet shown to satisfy
P1--P3. Layer (3): the KS refinement defect splits exactly into leakage \(P^\perp T'V\), compression, and
phase/geometry error, and compressed currents carry the leakage term \(F_a^*F_{a+1}-F_{a+1}^*F_a\) (D4-R, \S4)
[derived]. Bare dyadic insertion compresses nearest-neighbour energy to one-site terms (D4-V) [derived]. Exact
full-stage covariance together with A4 leaves only the zero representation (D4-N) [derived; sharpens CA-67 NG5 and
LC-2 Prop.~5], so A3 must be approximate. CA-73's transported densities are local only through a representative,
\(\theta_\varphi(h_j)=S_jP_\varphi\) (\S4). Layer (6): positive modular-character covariance at \(c>1\) excludes
finitely many Virasoro families in \(V_\one\) (D4-G, \S5) [conditional], answering the general-\(c\) question under
row (6). Extended generators obey their limiting mode algebra under VR-1-type bounds with finite losses (D4-X)
[conditional; proof sketch]. Topological defect operators commute with every KS mode and so are never chiral
generators (\S5). Headline D4-C [conjecture; needs reformulation] is inverse discretisation of a supplied sewing
completion; its carrier does not force categorical content.
```

That is 20 lines of prose inside the `description` environment. Every
status label is the one granted in REVIEW.md §5. The paragraph contains no
model detail.

## (b) Promote to shard

There are two candidates. The IDs are provisional (the next free numbers
after CA-87); a sibling reconciler may claim the same numbers, so check
before use.

**CA-88-KS-SHELL-CERTIFICATE: Spectral-shell certificates for Koo–Saleur
graph-norm convergence.** Content: D4-P, D4-B, D4-I and the p=1
counterexample (NOTE §3, lines 238–401).
1. Sources and dependencies: CA-81, VR-1 (`virasoro_routes.md:50–149`), referee boundary (`virasoro_referee.md:153–161`), Carpi–Weiner energy bound (`CarpiWeiner2004/source.tex:727–747`), CONVENTIONS (s), (af).
2. Setting: finite Hilbert tower, isometries J_r, auxiliary grading Q_r with Q_{r+1}J_r=J_rQ_r, dyadic shells E_{r,a}.
3. Why not physical energy: E_N does not intertwine exactly; separate interpretation (E_N) from regularity (Q).
4. Property P0–P3, stated with full-output, low-input norms and r-independent constants.
5. Theorem D4-P (P ⇒ VR-1 A1–A4 with K=Q^p, p>1), as a Lamport proof.
6. Proposition D4-B: P1 plus fixed-block convergence implies P2.
7. Proposition D4-I: iterated relative commutator bounds imply P1 (Sylvester inverse).
8. Counterexample: P1+P2 do not give A4 at p=1, so the spare power is necessary.
9. Boundary: P has no instance yet. Name the free calibration as the first test and interacting chains as the target.
10. Examples table (instances only) and the open obligations list.

**CA-89-KS-REFINEMENT-DEFECT: Koo–Saleur modes under categorical
refinement: leakage, compression, and the exact-covariance no-go.**
Content: D4-T, D4-R, D4-V, D4-N and the CA-73 support correction (NOTE §§1, 4).
1. Sources and dependencies: CA-14, CA-68, CA-71, CA-73, CA-86, LC-2 Prop. 5, CA-67 NG5, GS:2489, CONVENTIONS (af), (t).
2. Tile form of the KS modes for general C; velocity and the 1/v, 1/v² coefficients; e, b, c, c* bookkeeping.
3. Lemma D4-T: continuity, Fourier bracket, adjoint pairing (interchange law only).
4. The zero-mode shift changes c by 24d and leaves c*: no energy-origin repair of a cubic anomaly.
5. Lemma D4-R: compression/leakage formula (13) and the three-part defect (14)–(16) for any isometry.
6. Support remark: θ_φ(h_j)=S_jP_φ. Correction note for CA-73:168–172.
7. Lemma D4-V: bare dyadic insertion compresses nearest-neighbour energy to one-site sums, so T_0+T̄_0 cannot be exactly covariant.
8. Theorem D4-N: exact full-stage covariance plus A4 forces c*=0 and the zero representation.
9. Consequence for A3: summable approximate transport is the only target; the role of dressing (CA-68 W=UV, D3).
10. Checks pointer (`checks/run_checks.py`) and an examples table.

D4-G does not get its own shard; it is about 25 lines. It belongs in
whichever shard carries the D5 modular and character constraints. Until
that shard exists, it can replace the "(Question, D5)" sentence at
CA-75:108–111. D4-X and (17) stay in the note until D5's sewing
coefficients give them a consumer.

## (c) Links to D1–D6

- **D2 (feeds D2; D2 is needed for D4's hypotheses).** D2-C (`D2-selection-principle/NOTE.md:13–26`) *concludes* that the standard Hamiltonian-density KS modes converge on a common core. D4-P is the analytic interface: D2's certificate C1–C6 must imply P0–P3, or else supply VR-1 A2–A4 by another route. Both use root (af) with velocity-one density (D2 NOTE:86; D4 NOTE:84–87). D2 is also where D4's open hypothesis "the Hamiltonian density and velocity v_N" must come from.
- **D3 (D4 depends on D3 for P3).** D3-C (`D3-refinement-meets-dynamics/NOTE.md:9–40`) proposes local polar dressing of the CA-71 dyadic placement. D4-V shows that undressed insertion cannot carry two-site energy. D4-R/(16) give the exact defect that the dressing must make summable in Q-graph norm (P3), in the same GNS system as WT-1.
- **D5 (D4 supplies the general-c statement CA-75 assigned to D5; D4-X consumes D5).** D5-M (`D5-fidelity-lattice-sewing/NOTE.md:525–535`) assumes M1-type convergent modular characters. Under exactly such a hypothesis, D4-G forces infinitely many Virasoro families in V_𝟙 at c>1. D4-X transports extended generators only once D5's sewing data supply their OPE coefficients (17).
- **D6 (complementary; tension in scope).** D6-C (`D6-functor-and-obstruction-theory/NOTE.md:9–25`) is the *forward* functor: it selects the enrichment and outputs a conformal net whose standard KS modes converge (K3, D6 NOTE:147). D4-C is the *inverse* discretisation from a supplied completion. D6-C's KS clause would be certified via D4-P. D4-C alone does not imply D6-C, because it presupposes the completion S that D6-C must select.
- **D1 (mild tension).** D1-C (`D1-carrier-theory/NOTE.md:6–16`) works with the pointed site O=𝟙⊕X and studies blocking (D1 §3, :249–286). D4-C allows unit multiplicities and site objects that grow with the cutoff, which makes D1's carrier classification irrelevant to D4-C. REVIEW.md §6 recommends adopting D1's pointed carrier in a reformulated D4-C. D4-R and D4-V apply directly to D1's placements.
- **No direct contradiction** with any sibling note was found.

## (d) Headline verdict

**Needs reformulation.** As stated, D4-C is a real and important target:
lattice realisability, with standard-KS convergence and full fidelity, of
an effectively supplied positive rational diagonal CFT. But it is not a
statement *about C*:
- its carrier lets any spin chain qualify;
- its input is the full continuum theory;
- site-object growth is unconstrained relative to locality;
- it is not placed against Zini–Wang Conj. 4.3 and Rmk. 9 (`ZiniWang2018/source/main.tex:871–895`).

A reformulation should do three things:
1. Fix a pointed categorical carrier with bounded support growth.
2. Separate the KS-certificate part ("P holds for the standard modes") from the fidelity part.
3. State the strengthening over Zini–Wang.

**First attackable lemma.** Prove P0–P3 for the sourced quasi-free
calibration (`cft_machine/benchmarks/fermion/PROOF.md:12–76`). Take Q =
1 + the normal-ordered one-particle |momentum| grading. Zero-padding
refinement transports Q exactly, and the second-quantised mode changes Q by
at most |n|, so P1 holds with a finite band. The defect D_M(n,r)=O(ε_M²|r|³)
of PROOF.md:50–64 suggests P3 with γ≈3, α=2. Through D4-P this would give
the **first instance of VR-1** (CA-75 row (4), "any instance of VR-1"). It
would also resolve the referee boundary (`virasoro_referee.md:155–161`). The
first *general* lemma after that is D4-I's relative commutator bound for an
interacting density, which can be attacked by Lieb–Robinson bounds plus a
uniform low-energy estimate.

**The single most uncertainty-reducing computation.** An exact rational
evaluation, for the free calibration, of the shell blocks
‖E_a T_n E_b‖, the residual blocks and the low-input transport defect
‖Q^t Δ P(Λ)‖ along M=2^N M_0. It needs only one-particle symbols and small
Fock shells, so it fits the laptop budget. This decides whether P is
satisfiable at all in the only sourced case. If P fails there, D4-P is the
wrong interface.

The cheapest source step needs no acquisition: read the already-local
Milsted–Vidal 2017 (`references/lattice-symmetry/MilstedVidal2017/`) for
non-integrable low-block KS selection rules as P1 evidence.

## (e) Hypotheses still to be synthesised from category data

1. The density h (tile coefficients c_α), the velocity v_N, the subtraction e_N and the zero-mode shift b_N (NOTE:84–99, 154–165). This is D2's selection problem.
2. A periodic categorical representation: seam, translation U_N with U_N^N=1, sector policy, and disjoint-interval commutativity (NOTE:88–92; open problem 3).
3. An exactly transported auxiliary grading Q_r ≥ 1, compared uniformly with the physical energy E_N (NOTE:242–259, P0).
4. P1, the uniform shell decay of the Fourier tile sums, or the D4-I iterated-commutator bounds (NOTE:270–277, 377–389).
5. P2, low-input residual convergence including the mixed residuals R^{+−}, with c*=c in the chosen origin (NOTE:279–287, 301–304).
6. P3, low-input transport with geometric rate. This needs dressed local refinements (D3), not bare insertion (D4-V) (NOTE:289–299, 465–482).
7. The same J_r arising as GNS maps of unital local refinements with WT-1 summable state drift (NOTE:38–40; CA-75 Link (b)).
8. If (5) is used, the no-wrap comparison bound ‖T_n − T_n^nw‖ in graph norm, including products and transport (NOTE:222–236).
9. The enrichment: a central-charge lift c, sector weights, a finite Hermitian strong generating set and its OPE coefficients (the completion S itself; NOTE:13–21, 561–574). This is D5/D6.
10. Lattice avatars of every extra strong generator, with bounds (18), composite-tail control and null descent (NOTE:576–612; open problem 5).
11. Energy positivity, essential self-adjointness, integration and local-net identification (NOTE:607–612).
12. Complete sector correspondence and braided equivalence with C, not just a defect fusion ring (NOTE:610–612; open problem 6).
