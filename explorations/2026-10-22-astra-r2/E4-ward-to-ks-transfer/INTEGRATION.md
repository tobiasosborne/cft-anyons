# E4 — Integration package (Ward-to-KS transfer)

Basis: `NOTE.md`, as checked in `REVIEW.md` (grade WEAKER-RESULT-PROVED).
Tags follow CONVENTIONS (aq). Nothing here edits the report; this file only
proposes edits.

## (a) The theorem as established, for general C

```latex
\textbf{Theorem 89.1 (E4-T/E4-A/E4-C) [conditional; full, one chiral family at a
time; category-free (applies verbatim to any unitary fusion $\Cc$ with a declared
periodic representation and translation); $\to\mathsf R2$].}
Let $(H_r,J_r,K_r)$ satisfy VR-1 A1, with $\min\operatorname{spec}K_r=1$ and a unitary
translation commuting with $K_r$ and covariant for the KS modes $T_{r,n}$ of (79-ks).
(i) \emph{Transfer.} If geometric modes $S_{r,n}$ satisfy A2 and A4 (two losses) and
$d_{r,n,s}=\|K^s(T_{r,n}-S_{r,n})K^{-s-1}\|\to0$, then $T$ satisfies A2 and A4 with the
same central term, with the explicit bound (12).
(ii) \emph{Refinement.} If holomorphic metric families $B_{r,n}(\eta)$ with
$B'_{r,n}(0)=S_{r,n}$ have $\sum_r\sup_{|\eta|=\rho_{r,n}}|B_{r+1,n}J_r-J_rB_{r,n}|_{s,1}/\rho_{r,n}<\infty$,
$J_r$ independent of $\eta$, and $d$ is summable, then $T$ satisfies A3 with bound (14).
(iii) \emph{Contact cocycle.} If A2 holds and A4-type residuals with convergent scalars
$z^{(r)}_{mn}\to z_{mn}$ vanish in $|\cdot|_{s,2}$, then
$z_{mn}=\delta_{m+n,0}(m^3c^*-mc)/12$ with $c^*=2(a_2-2a_1)$, $c=2a_2-16a_1$.
If, in addition, the scalar contacts are first- and third-derivative Ward contacts
$\kappa_1,\kappa_3$ (cylinder chart) with zero-mode shift $b$, then
$c^*=12\kappa_3$ and $c=24b-12\kappa_1$.
\textbf{Negative [derived].} (N1) Summable insertion errors do not bound commutators
without a product bound. (N2) Summable real gate errors do not bound metric
derivatives. (R-A2) A2 fails for $K=1+(H-E_0)/v$ whenever its spectral width stays
bounded below. (R-N3$'$) Under translation covariance, A3 cannot hold for every
gate-intertwining refinement unless $c^*=0$.
\textbf{Not established:} that any discrete Ward identity (D2 (19)) implies the
two-loss operator estimate A4. Assumption W2 of NOTE \S2 is equivalent to A4 up to the
explicit finite-size multiplier $\beta_N$ (REVIEW F1).
```

Status: (i)–(iii) are conditional and proved; the negative lemmas are
derived. Only c* is a Ward output. The linear constant c also records the
declared b.

## (b) Destination

**New shard CA-89-WARD-KS-TRANSFER**, "Ward-to-KS transfer: graph-norm
interfaces, derivative matching and the contact cocycle". If another
round-2 package takes 89 first, use the next free ID. Outline, about 200
lines:

1. Status, sources, dependencies: CA-78 Target 78.13, CA-79 (79-ks, 79.1,
   79.2), VR-1, D2 NOTE (19) and L9–L10, LC-W. Tags.
2. Graph-norm calculus (2)–(3). Correction to the energy warning: R-A2,
   which says that the brief's K is not an admissible A2 control, and which
   controls are (1+E_N, Q^p).
3. Theorem 89.1(i) with bound (12), and N1 as the reason for A2.
4. The β_N lemma (E4-W, demoted): summation by parts plus the bound (9). One
   remark that W2 is a near-A4 hypothesis (F1).
5. Theorem 89.1(ii) with bound (14). N2 (gate values do not control
   derivatives). Connection terms when J depends on η.
6. R-N3′: the "any refinement" clause is false when c* ≠ 0. A3 needs
   coordinate-resolved matching.
7. Theorem 89.1(iii): the cocycle classification by translation averaging,
   the low-energy anchor and finite Jacobi. The κ-to-(c*, c) dictionary
   and E4-P's plane residues. Chart change left open.
8. Open lemmas: contour realization, uniform Ward errors, regularity,
   differentiated matching, chart change and both chiralities.
9. What this does not claim: no instance, no R2, no c = c*.
10. Examples table (instances only): Vec qubit calibration for R-A2; the
   2×2 witnesses of N1/N2; CGS n = 1 marked "not verified to satisfy W2".

**Amendments to existing shards.**
* **CA-78, Target 78.13** (end of the paragraph at :248–251). Add: "Split
  by CA-89. A4 transfers from geometric modes given A2 (89.1(i)). A3 needs
  differentiated, coordinate-resolved matching (89.1(ii)). It is false for
  arbitrary gate-intertwining refinements when c* ≠ 0 (R-N3′). The open
  core is the operator lift of (19)."
* **CA-79, after Lemma 79.1** (:79–81). One sentence: with
  K = 1+(H−E_0)/v, A2 fails at n = 0 (R-A2). This is why 79.2 uses an
  auxiliary Q^p.

## (c) CA-88 grid cells

* **Results table:** add the row
  `CA-89 | full (per family) | none | →R2 | transfer 89.1(i) [cond.]; derivative A3 89.1(ii) [cond.]; cocycle 89.1(iii) [cond.]; R-A2, R-N3′ [negative]`.
* **Definition 88.3, R2 row**, certificate column: add "89.1 (transfer
  interfaces; Virasoro form forced by consistency)". The minimal-data entry
  stays "none".
* **D2-C (i) restatement:** replace "implies VR-1 A3/A4" with "the operator
  lift W2 of the contour identity, plus A2 and differentiated matching,
  implies A3/A4 (89.1); A3 for arbitrary gate-intertwining J is false".
  Its first lemma becomes the next lemma in (e).
* No cell moves up a rung: everything stays →R2, with no instance.

## (d) Links and conflicts

* **E2 (parity and chirality).** E4-T's two-chiral clause assumes zero
  mixed contacts. E2 proves mixed brackets vanish from locality plus two
  VR-1 certificates plus current conservation. E2 therefore supplies that
  hypothesis and should replace it in 89.1. E4-C's anchor and translation
  argument applies to each family separately. E2's parity argument, which
  gives c = c̄, is complementary. No conflict.
* **E3 (reflection positivity).** C3's positive boundary forms and the
  positive quotient that W1 requires are E3's seam and OS objects. The
  contour-realization lemma needs E3's reconstruction to identify the end
  diagrams with Hilbert-space products.
* **E1 (local unital lift).** The J_r of 89.1(ii) are GNS isometries. A
  local unital lift (E1, R0^u) is what makes them observable refinements
  rather than corner maps (VR-1 "what this does not buy"). E1 is braided
  (L1); 89.1 is category-free. No conflict.
* **E5 (fidelity).** It sits downstream at R4 and needs R3. No interaction
  beyond the requirement of a shared system (CA-88 Remark 88.4).
* **E6 (number-changing).** Nonrelativistic, below R2. No interaction.
* **Round 1.** CA-79 Theorem 79.2 is an alternative route to A2–A4 through
  shells. 89.1(i) can take Q^p as its K. CA-79 D4-R (compressed currents)
  is the concrete source of the connection and leakage terms in 89.1(ii).
  VR-2 (vacuum-null is not operator-null) is why the next lemma below must
  use all probe words.
* **Conflict:** the brief's E4 and CA-88's D2-C (i) wording ("A3 for any
  refinement" or "implies A3") are false or too strong per R-N3′, and
  should be amended as in (b).

## (e) Single next lemma

**Probe-word Ward-to-residual lemma** [conditional target; full;
category-free; →R2].

ASSUME:
* D2's contour identity (19) holds with residuals R_n(f, y, A) for every
  probe word A in a family whose reflected boundary vectors are dense in
  each graph space;
* the residuals and the collar insertions obey the one-sided two-loss
  bound (18) with constants tending to zero (D2-L10).

PROVE the operator estimate W2:
|[S_m,S_n] − β_N S_{m+n} − z^{(r)}_{mn}|_{s,2} → 0.

First test: the in-repo free-fermion benchmark (D2 INTEGRATION:117–121),
with K = 1+E_N, at the laptop budget.
