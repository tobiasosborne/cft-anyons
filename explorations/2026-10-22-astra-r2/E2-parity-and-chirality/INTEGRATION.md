# E2 — Integration package (parity, mixed KS brackets, chiral/full delineation)

Basis: `NOTE.md`, as checked in `REVIEW.md` (grade WEAKER-RESULT-PROVED).
Tags follow CONVENTIONS (aq) and CA-88. This file proposes edits only; it changes nothing outside this directory.

## (a) The theorem as established, for general C

```latex
\textbf{Theorem 90.1 (E2-P/E2-Z/E2-M/E2-C) [conditional; full (periodic, two
families), with the chiral-versus-full delineation as corollary; category-free:
applies verbatim to any unitary fusion $\Cc$, site object $O$ and declared periodic
representation; $\mathsf R2$ given the certificates].}
Let $k_j$ be self-adjoint translated densities with $[k_j,k_l]=0$ unless $j,l$ are
equal or adjacent, and let $T_{r,n},\bar T_{r,n}$ be the standard KS modes
\eqref{eq:79-ks}. Suppose both families satisfy VR-1 A1--A4 on one system
$(H_r,J_r,K_r)$, with separate ledgers $(c_L,c_L^*)$, $(c_R,c_R^*)$.
(i) \emph{Anomaly balance.} If a complex-linear unitary $P_r$ with $[P_r,K_r]=0$
satisfies $P_rk_jP_r^*=k_{-j}$, then $c_L=c_R$ and $c_L^*=c_R^*$; no convergence of
$P_r$ is needed. If in addition $P_r^2=1$ and $P_{r+1}J_r=J_rP_r$ (PC), a limiting
unitary involution satisfies $PT_nP^*=\bar T_n$ on $D$. An antiunitary reflection
(site reflection with the dagger) instead satisfies $\Theta T_n\Theta^*=T_n+O(|n|/N)$
and constrains nothing.
(ii) \emph{Mixed commutation.} With equal ledgers, all limiting mixed brackets vanish
on $D$ iff $[T_0,\bar T_0]=0$ there. A sufficient finite certificate is
$\|N^2[H_N,Q_N]\|_{(s,2)}\to0$, with $Q_N=\sum_j i[k_j,k_{j+1}]$. Another is the
current--momentum identification $\|(T_{r,0}-\bar T_{r,0})-p_r\|_{(s,1)}\to0$ for a
spectral logarithm $p_r$ of the translation.
The stronger Ward bound $\|[T_{r,0}-\bar T_{r,0},\bar T_{r,n}]-n\bar T_{r,n}\|_{(s,2)}\to0$
gives explicit decay of $[T_{r,m},\bar T_{r,n}]$ with graph loss four.
(iii) \emph{Delineation.} Under (i), if $\bar T_n=t\,\delta_{n,0}$ on $D$, then
$T_n=t\,\delta_{n,0}$ and $c^*_{L}=c^*_R=0$, $c_L=c_R=24t$.
\textbf{Negative [derived].} The specified $P_r$ need not converge (E2-P0). A1--A4
for two families alone do not give mixed commutation (E2-V, not a KS chain).
\textbf{Finite ingredients ($\mathsf L0$, $\to\mathsf R0$).} $Q_N$ is a parity-odd
categorical perturbation whenever $Q_N\neq0$. On $O\otimes(\one\oplus\one)$ a nonzero one
always exists. A conjugate-dual mirror gives a linear reflection without
self-duality. A current tilt does not delete a stress family (E2-T).
\textbf{Not claimed:} that ZC follows from the other hypotheses; that chiral targets
require parity-breaking densities; any categorical edge-discard functor; R3--R5.
```

Status line for the catalogue: conditional R2 theorem with three derived negatives
and finite L0 ingredients. Reproducibility: `checks/check_e2.py` (exact SymPy) and
`checks/review_e2_checks.py` (reviewer, numpy, Vec_Z3 non-self-dual instance).

## (b) Destination

**New shard, proposed `CA-90-PARITY-MIXED-KS-AND-CHIRALITY`** (E-order numbering as
suggested by E6; E4 and E5 both proposed CA-89; the integrator assigns). Title:
*Parity, Mixed Koo--Saleur Brackets, and the Chiral/Full Delineation*. Outline, about 200 lines:

1. Status, sources and dependencies: VR-1 (`virasoro_routes.md:55-150`); CA-79
   (79-ks), Lemma 79.1, Thm 79.2 line on mixed residuals; CONVENTIONS (s), (v), (ap),
   (aq); Penneys:145, 682-698, 992-999; D6 REVIEW:71-93.
2. Setting and range qualification (nearest-neighbour commutation; range-R is open).
3. Theorem 90.1(i) with the proof of (3) and the ledger argument; Remark: an
   antiunitary reflection preserves chirality (REVIEW refutation 4); E2-P0.
4. Identity (6) and Theorem 90.1(ii): the E2-Z Jacobi reduction (about 25 lines) and
   the Z0 formula; the E2-M rate stated, with the proof pointing to the NOTE.
5. Proposition E2-S: momentum-sector form of the certificate, and why (12) is the
   substantive gap.
6. Negative E2-V, with its scope sentence.
7. Corollary 90.1(iii), and the contrapositive as a disjunction.
8. Finite L0 ingredients: E2-D/D0, E2-A, E2-T, the sharp-filter formula (19).
9. Section 7: type of reflection, the non-self-dual case, Lemma E2-R.
10. Layer tags table, open problems (zero-mode, current–momentum, PC, range-R,
    chiral extraction), examples table (O=1, flags, E2-V, CA-82 sine chain).

**Amendments to existing shards (small):**
- CA-79 (270/280 lines), after the Setting sentence at line 92 ("... and to the
  mixed residuals"), add one line. Under equal ledgers, the mixed residuals reduce to
  the single zero-mode commutator `[T_0,Tbar_0]`, which is CA-90's Theorem 90.1(ii).
- CA-88 Definition 88.1, the "Source gap" sentence (lines 66-68): append two lines.
  A restricted no-go is proved in CA-90 (iii): a linear parity plus both standard KS
  families certified on one system exclude `c_L != c_R` and an absent right stress.
  The general lattice-chirality question remains a source gap. Add a grid row in the
  table at lines 115-135:
  `CA-90 & full & none; L0 for ingredients & R2 [cond.]; ->R0 & parity ledger
  balance; mixed brackets <=> ZC; delineation`.
- CA-75 is at 280/280: do not amend; rely on the CA-88 row.

## (c) CA-88 grid cells filled or moved

- **New cell (full; none; R2 conditional):** parity ledger balance and the
  mixed-bracket reduction. This is a *same-rung* refinement: the two-family R2
  certificate now needs, besides the per-family VR-1 certificates, one zero-mode
  estimate plus a linear parity, instead of all mixed residuals.
- **Moved obligation:** the CA-79 row (full; L0; ->R2) and the LC-4 row (full; L0;
  ->R1, R2; both chiral families). Their mixed-residual hypotheses become ZC plus
  equal ledgers. No cell moves up a rung, and no categorical instance is certified.
- **Definition 88.1 source gap:** partially answered in the restricted
  parity-paired standard-KS sense only. S_ch remains a declared tag.
- **R0 ingredient cells (any/full; L0; ->R0):** parity-odd perturbations and the
  conjugate-dual mirror. Finite only.

## (d) Links and conflicts

- **E1 (local unital lift).** PC is a refinement-equivariance condition. A braided
  lift built from c may map under reflection to the lift built from the reverse
  braiding, so PC for E1's tower is a hypothesis to check at L1. It is not
  automatic. Statement (i) without PC is unaffected.
- **E3 (reflection positivity).** E3's spatial reflection "site reflection composed
  with dagger" is conjugate-linear (E3 NOTE:355-357). By refutation 4 such a
  reflection preserves each chirality, so it cannot serve as E2's parity.
  RP reflection and chirality-exchanging parity are distinct data. Consistent, no
  conflict, but the brief for E2 conflated them.
- **E4 (Ward-to-KS).** E4 supplies per-family A3/A4. Its two-chiral clause assumes
  zero mixed contacts, which E2-Z replaces by ZC **plus equal ledgers**.
  *Conflict to fix:* `../E4-ward-to-ks-transfer/INTEGRATION.md:94-96` drops the
  equal-ledger hypothesis (it copies the NOTE abstract's omission). The natural
  route to ZC/(12) is a lattice Ward identity "energy current = momentum density",
  the T^01 = T^10 symmetry, inside E4's contour framework.
- **E5 (two-sided fidelity).** E5 targets a chiral net. E2 (iii) says that from a
  parity-paired periodic chain such a net must arise as a *subnet* of a full limit
  (the D6 REVIEW:94-98 fix), or from a parity-breaking construction. Consistent.
- **E6 (number-changing continuum).** Nonrelativistic, no KS modes, so no direct
  link. E2-D0/E2-A apply to the pointed carrier O=1+X as finite facts only.
- **Round 1 / calibrations.** CA-82's chiral sine Hamiltonian `(F-F*)/(2i eps)` is
  odd under reflection, and it uses modified modes. It therefore evades (iii) through
  the disjunction, consistent with E2. CA-79 Thm 79.8 is unaffected. D6 A1's source
  gap is narrowed, not closed.

## (e) The single next lemma

**Zero-mode (current–momentum) lemma.** Assume Theorem 90.1(i)'s hypotheses, with a
translation U_r covariant for both families and commuting with K_r. Prove
`|| (N_r^2/8pi^2) [H_r, Q_r] ||_(r;s,2) -> 0` for every s. The route is to identify
`T_(r,0) - Tbar_(r,0)` with a spectral logarithm of U_r in (s,1), which is (12).
Alternatively, exhibit a nearest-neighbour chain (any C, even Vec) with both VR-1
certificates whose limit has `[T_0,Tbar_0] != 0`. Either outcome settles the brief's
part (b): it is then proved outright, or it needs ZC as a genuine extra hypothesis.
