# F3 — Integration package, 2026-10-25

Basis: `NOTE.md`, independently audited in `REVIEW.md`.
**Overall grade: WEAKER-RESULT-PROVED.** Verified counterexamples refute
F3(b) and universal unitary conjugacy of directional transfers. Whole-history RP remains
conditional. This file proposes integration; it changes no report source,
root convention, index or worklog. Statement grades below are not upgrades
of the original conjecture.

## (a) Statements safe to lift

Use stable local labels F3-S1–S10 below until the integrator assigns shard
numbers. In all rows, “finite →R3” means **no rung reached**. Microscopic
choices are declarations at a layer, not L3 conformal enrichment.

| ID | Statement and indispensable qualifiers | Grade | S; L; R reached |
|---|---|---|---|
| F3-S1 | For unitary braided C, nonzero O and specified unitary spherical duals, `lambda_a=d_a^{-1} ev_a c_(a,Da) coev_a`, `t_O=sum lambda_a^{-1}p_a`, `s_can=c_(O,DO)(t_O tensor 1)` give a unitary cup-normalized algebraic seam, natural under unitary braided equivalences. The correction is uniquely determined within this construction; arbitrary seams are not unique. `t_O=u_O^{-1}j_O`, with u the stated Drinfeld morphism. | derived | any; L1; finite →R3 |
| F3-S2 | `D(f)=(f^vee)^dagger` is covariant, conjugate-linear and anti-monoidal; it induces antiunitaries `Hom(a,W)->Hom(Da,DW)`, preserves inverse-Gram leg sewing, and has `D²(f)=j_W f j_a^dagger`. It changes the external labels. | derived | any; L0; finite →R3 |
| F3-S3 | Given typed unitary r_X, `rho_X=r_X^dagger D(-)r_X`, `z_X=r_X^dagger D(r_X^dagger)j_X` satisfy `rho_X²=Ad(z_X)`. The square is identity on End_C(X) iff z_X is central; for a smaller algebra use its commutant. On identified simple-charge cuts, `J_(a,W)²(f)=z_W f z_a^dagger`. | derived | any; L0+declared identifications/algebra; finite |
| F3-S4 | Any unitary self-duality psi gives `s_psi=psi tensor [j_O^dagger D(psi)]`, a unitary with `s_psi coev=ev^dagger`. This is an algebraic seam; it neither equals s_can in general nor proves central defects. | derived | any; L0+psi; finite →R3 |
| F3-S5 | The oriented bend is a linear bijection, with inverse F2. Thus `sharp_s=K_s^{-1} dagger K_s` is a conjugate-linear involution and exactly characterizes Hermitian K_s(h). No composition law or graph interpretation follows from this definition. | derived | any; L0+s (s_can supplied at L1); finite →R3 |
| F3-S6 | Arbitrary unitary psi need not have scalar/central square. Canonical-seam Hermiticity and conjugate-dual invariance differ even for self-adjoint categorical h. A same-algebra conjugate-linear involution with the **all-complex-h** fixed-point iff must equal sharp_s; the braided witness shows that either composition variance can fail. | negative | any; L0 for square/flip witnesses, L1 for canonical braided witness; finite |
| F3-S7 | Disjoint crossing tiles satisfying the uniform linear Schur certificate give all-insertion spatial RP **provided** the reflected half-amplitude identity and the same tensor/reassociation/charge/boundary identification hold, exactly G1–G3. Automatic coherence at L1 is not proved. | conditional | full (chiral only with a supplied twist/certificate); L0+G1–G3; finite →R3 |
| F3-S8 | Finite nonzero PSD q0, a shift tau on the same insertion space, and PSD `q1(f,g)=q0(f,tau g)` give a positive quotient transfer. Dividing by `rho>=max(1,||T||)` makes it contractive. A logarithm on the whole quotient needs injectivity. Construction/positivity of q1 from histories remains separate. | derived; categorical application conditional | any; category-free; finite →R3 |
| F3-S9 | Whole identity histories on `O=1^direct-sum d`, d>=2, have `T_t=1` and the specified column transfer `T_x=vv^dagger`, rank one, while both contractions equal d^N. Hence universal unitary conjugacy fails, even when N=M. For the explicit even-torus all-half-history forms of REVIEW §3, OS dimensions are d^N and 1. | negative, with derived reviewer repair for the OS clause | periodic/full finite torus; L0, already symmetric L1; finite |
| F3-S10 | The exact finite calibrations and mutations are reproducible. Nonzero Z3 H^3 classes tested here admit no braiding; the nonconstant coboundary is the actual braided test. The Q8 witness checks a self-dual non-pointed categorical tile and its FS bookkeeping. | derived finite calibrations | named instances only; no rung |

Proof locations: N §A/A4 (S1), §C (S2), §D (S3), §E (S4), §F (S5/S6),
§B and examples (S6), §G (S7), §H (S8), §I plus REVIEW §3 (S9).
The exact repair of S9 must be lifted with its **defined q0 forms**, not
by identifying transfer kernel with OS radical without an argument.
The crossing no-go is for intertwiners on cut carriers: a unitary reshuffling
on Hilbert–Schmidt matrix space can change operator rank (REVIEW §2), so
that distinct interpretation of the brief is not refuted by S9.

Do not lift as a theorem: “canonical seam gives a reflection of the whole
history”; “any unitary psi squares to an FS sign”; “D(h)=h iff K_s_can(h)
is Hermitian”; “two positive directional transfers are unitarily conjugate.”
The first is still conditional; the other unrestricted assertions are false.

A compact integration can use two roughly 200-line shards: one for S1–S6
(algebraic seams and reflection defects), one for S7–S9 (conditional RP and
finite transfer boundaries). Examples and scripts remain calibrations.
Assign numbers centrally; do not assume an unused CA-95 slot.

## (b) Exact CA-88 cells that change and those that do not

Locators refer to `report/sections/88_layered_targets.tex`.

| Cell / passage | Proposed change | What must remain unchanged |
|---|---|---|
| Existing-results table, CA-92 row, line 151: data/comment cells | Split algebraic construction from RP interpretation. Add `(any; L1; finite →R3): S1/S5 [derived]`, with s_can determined by the supplied braiding and spherical duality. Add the L0+psi branch S4. | The full-history RP entry remains `(full; L0+coherent reflected pairing; finite →R3) [conditional]`. At L1 it still needs G1/G2. |
| Existence comparison, lines 119–120 | Replace “expected at L1 (ribbon identity not locally sourced)” by S1's **proved individual seam** and its precise formula. | The multiplicity iff at L0 and the non-braided obstruction remain. No assertion of automatic coherent s. |
| Main target grid, R3 row, line 106, certificate column | Add pointers to S7 [conditional] and S8 [derived finite normalization], alongside 80.2–80.5 and 92.3/92.5. | R3 is still not reached; its minimum-data column and analytic/net requirements are unchanged. |
| Existing-results table: finite OS item within line 151 | Separate `(any; category-free; finite →R3)` S8 from the categorical seam data column. | No positive spatial translation has been constructed for general histories. |
| Round-2 E3 item, line 239 | Add a dated round-3 pointer: individual L1 seam proved; old automatic reflection target refuted/qualified; new target below. | Retain the historical round-2 grade. Do not rewrite history as if E3 had proved coherence. |
| R0^c/R0^u rows, lines 102–103; CA-90 row, line 149 | No change. | A seam is not a half-braiding or a local unital refinement. |
| R1/R2 rows, lines 104–105 | No change. | No Wilson state, KS convergence or mode certificate. |
| CA-80 row, line 144 | At most a dated cross-reference to S2 for dual-oriented leg sewing. | Its temporal positivity and conditional fidelity claims are unchanged. |
| R4/R5 rows, lines 107–108 and fidelity sub-rungs 112–115 | No change. | No fidelity or functorial pipeline. Naturality of one seam is not R5. |

No cell moves upward in R. The actual improvement is discharge of the
**individual-seam declaration at L1**, plus exact defect/Hermiticity
obstructions and a finite normalization simplification.

## (c) Dated amendment pointers other shards need

These are suggested short insertions; no edits are performed here.

- **CA-92:77–79:** “Amendment 2026-10-25: the algebraic L1 seam and its
  positive twist sign are proved in F3-S1 (N §A; REVIEW §2). This closes
  the local ribbon-formula gap only; RH remains extra data.”
- **CA-92:173–177 and 228–240:** “Amendment 2026-10-25: the proposed
  automatic conjugate-dual coherence is false as stated (F3-S3/S6).
  Distinguish dual-oriented mirror, fixed-cut identifications and sharp_s;
  the replacement target is the real-self-duality two-tile lemma.”
- **CA-92:181–195:** “Amendment 2026-10-25: at fixed finite volume the
  upper bound q1<=q0 may be achieved by scalar normalization once q1 is
  positive and compatible (F3-S8). Shift closure and positivity/compatibility
  of the translated form remain unproved for a general strip.”
- **CA-92:199–205:** “Amendment 2026-10-25: identity histories refute
  unitary similarity of complete directional transfers, including the
  explicitly defined even-torus OS quotients (F3-S9; REVIEW §3).
  Equality of the same closed network's contractions remains valid.”
- **CA-80:137–140:** “Amendment 2026-10-25: F3 gives a canonical individual
  seam at L1 and the dual-oriented leg-sewing comparison; spatial RP of
  a general history still requires RH and compatible cut identifications.”
- **CA-75:126–130:** “Amendment 2026-10-25: F3-S1 removes a declaration
  for the individual seam at L1. It does not close the spatial-sewing or
  anomaly-line limit question in Link (a2).”
- **CA-91:111–116,215–221:** add a pointer to F3-S2/S3/S6 explaining that
  the conjugate-dual mirror is compatible with leg sewing, but is not
  automatically the canonical-seam reflection. Do not substitute it for
  Theorem 91.1's **complex-linear** parity or deduce anomaly balance from s.
- **CA-86:** no theorem needs alteration. Its identity history is the
  input to S9; the positive/negative transfer conclusions belong in the
  new shard, not in an unrelated model calibration.
- **CA-88:** use the exact changes in (b), with a dated pointer to the
  final assigned F3 shard numbers. Prior E3 INTEGRATION:93–96's phrase
  “coherent s automatic” must not be copied forward.

The existing CA-92 is near its cap; keep amendments as short pointers and
put full proofs in the new shard(s). No root report rebuild belongs to
this isolated review; the later integrator must run the ordinary gates.

## (d) CONVENTIONS entries needed before report use

Do not silently reuse (at), which concerns parity. Extend (au) or add a
new scoped entry, with pointers to N and REVIEW, for:

1. **Braiding/duality direction.** `c_(X,Y):X tensor Y -> Y tensor X`,
   the inverse only where displayed; `D(X)=X^vee`, `D(f)=(f^vee)^dagger`,
   its unitary anti-monoidal tensorator, and `j_X:X->D²X`. Keep the pointed
   associator arrow `a(bc)->(ab)c=omega`; do not import an inverse-omega
   implementation without changing every cup and rebracketing consistently.
2. **Two algebraic seams.** Declare s_can and s_psi separately by S1/S4;
   `t_O` is the cup correction, not the positive time step t. If named theta,
   it is `u_O^{-1}j_O`, hence the positive twist convention in A4.
   Both seams are fixed independently of h; neither name includes RH.
3. **Defects and observables.** r_X, z_X, rho_X and the cut formula D3,
   including the source-charge comparison. Centrality is relative to the
   declared categorical observable algebra; a smaller algebra uses a
   commutant. Simple-object FS signs are not arbitrary-object scalars.
4. **Hermiticity transport.** `K_s^{-1}` means inverse linear map between
   morphism spaces, not inversion of an individual matrix. sharp_s is a
   conjugate-linear involution without presumed multiplicative variance.
   Keep dagger, dual, conjugation and linear parity distinct.
5. **History reflection.** G1/G2 explicitly include boundary/flux labels,
   inverse Gram, disjoint crossing geometry and adjoint reverse seam; G3
   concerns a fixed linear tile or common step bound, not an exact exponential.
6. **Finite OS normalization.** q0, tau, compatible q1 and the quotient
   precede normalization by rho. The quotient norm bound is finite-volume;
   no vacuum energy or uniform-in-volume scalar is inferred.
7. **Reviewer S9 repair.** Raw torus weight, even N,M, all half-history
   indicator insertions and the two bond reflections as in REVIEW §3.
   These are local example conventions; do not make them global limits on
   the construction. General odd/fixed-plane/boundary versions remain separate.

No F/R table, vacuum index, Hamiltonian sign or raw-cup normalization is
changed. Keep (am)'s allowed unit multiplicities and (aq)'s layer definitions.
Register the review scripts/raw outputs in INDEX during later integration;
source and author-input hashes are in `checks/review_rerun_manifest.json`.

## (e) The next lemma

Use **exactly REVIEW §6's real-self-duality two-tile reflection lemma** as
the single next target, grade conjectural: unitary psi with
`psi^vee j_O=psi`; seam s_psi rather than s_can; word identifications built
from the unitary dual tensorator. Prove the all-tile adjoint identity
`K_(s_psi)(rho_2(h))=K_(s_psi)(h)^dagger`, then the adjacent two-brick
sewing overlap with explicit inverse Gram and reflected boundary maps.
State the generating moves required to extend it to whole patches.

Tags: `(any algebraically / full for RP; L0+declared real self-duality;
finite →R3, no rung yet)`. This target avoids the known arbitrary-psi square
and canonical-seam composition counterexamples, but is not certified by
that avoidance. Only after its graph-coherence part is proved can S7's
hypotheses be discharged for the corresponding history grammar. Positive
translated forms and continuum reconstruction remain later lemmas.
