# G6 sceptical review — 2026-10-27

GRADE: COUNTEREXAMPLE

The positive form of Conjecture G6 (brief:152-159), which is CA-97 Target 97.16
(`report/sections/97_what_the_tower_remembers.tex:265-272`), is **refuted**.
G6-B constructs an explicit record isomorphism. It carries every named interval
algebra onto its counterpart and intertwines delta exactly, between pointed
inputs that admit no tensor equivalence carrying O to O'. I found no false step
in G6-A, G6-B, G6-B1, G6-B2 or G6-C1. The grade is not PROOF-COMPLETE because of
four defects. (i) The note calls the counterexample a "general mechanism", but
it is proved only for abelian Hilb_fd(G) with trivial associator and the flip
transport. (ii) The brief's requested F6 same-ring/different-associator
calibration (G6-D) and the ladder consequence (G6-E) are left open. (iii) The
mark inventory G6-C2 has one dangling citation and one overstated row. (iv) The
Examples table omits the very instances the proof says it holds. The
counterexample is narrow but decisive. It shows that the **point**, i.e. the
vacancy/unit block of O = 1 (+) X, is not recorded by R. It shows nothing yet
about F or H once that point is named.

NOTE.md was not edited (sha256 `5355042762f48ef9...`, see `checks/review_g6_*`).

## 1. Does G6-B refute Target 97.16 exactly as stated?

Target 97.16 (97:266-272), verbatim in substance: "For arbitrary pointed
tensor-generating inputs (D,O,eta,H), retain exactly R=(A_infinity,{A_[j,k]}_{1<=j<=k},delta),
where A_[j,k]=kappa_k(1_{W_{j-1}} (x) End_C(W_{k-j+1})) ... Record isomorphisms must
carry each named interval algebra onto its counterpart and intertwine delta; no
point, corner, h,i,j or concatenation marks remain. Prove that record
isomorphism forces a unitary tensor equivalence transporting eta,H ... or give
an explicit counterexample preserving *all* these constraints simultaneously."

NOTE:28-31 sets the same obligation, and NOTE:17-26 sets the same record. The
note writes End_D, the shard writes End_C. They agree because D=<O> is a full
subcategory (CA-90:62-63).

The G6-B isomorphism Phi satisfies the following.
- **A *-isomorphism of A_infinity.** It is built from isometric stage maps
  compatible with trailing inclusion (G6.2 first line). Its inverse comes from
  U^dagger. VALID.
- **Each named interval onto its counterpart.** This is the second line of
  (G6.2). It holds for every categorical b, not only for products of one-site
  operators, and Ad U maps End_D(W_n) *onto* End_D(W'_n) (NOTE:131-141).
- **delta' Phi = Phi delta.** This is (G6.3)-(G6.4). It is exact at every
  length, not only on K_0. The brief's demand at line 161-164 is therefore met.

The inequivalence comes in two forms.
- **B1** (O=R_G(+)1 versus R_G(+)s) uses only dim Hom(1,O)=2 against
  dim Hom(1,O')=1. Any monoidal equivalence has F(1)≅1 (unitor F^1, Penneys:325-348).
  So *no* tensor equivalence D->D' with F(O)≅O' exists. Automorphisms of G are
  irrelevant here, and so are eta and H.
- **B2** (O=R_G(+)a versus R_G(+)b, both connected) uses the permutation of
  invertible simples by a group automorphism (F6 NOTE:484-490, reviewed as
  97.10). The doubled simple must be carried from a to b. Different element
  orders forbid this.

Both arguments are complete. They exclude every tensor equivalence that carries
the site object, which is stronger than excluding a unitary pointed one.

**Verdict: 97.16's positive form is refuted exactly as stated.** It was posed as
a disjunction ("prove ... or give an explicit counterexample"), and the second
branch is now realised. The question 97.16 was *meant* to ask, namely how much
information R carries, is not settled (section 6).

## 2. Per-step verdicts (NOTE.md locators)

| Step | Line | Verdict |
|---|---:|---|
| Statement / tags | 17-35 | VALID. "R0^u information only" is the honest rung. |
| G6-A <1>1 | 61-68 | VALID. The splitting is standard (Penneys:219-237). x(x)y≠0 follows from positive FP dimension (ENO.txt:1459-1487). The categorical-equals-FP identification needs ENO.txt:1700-1706, which is uncited. Minor citation gap. |
| G6-A <1>2 | 70-78 | VALID. The pairs (x,y) with F^z_xy≠0 give inequivalent irreducibles of End V^x (x) End V^y inside each z-block, so the commutant is ⊕ End F^z_xy. |
| G6-A <1>3 | 80-84 | VALID but trivial. Tag drift: it uses delta, so the tag is L0+H, not L0 (line 45). |
| G6-A "insufficiency" | 86-99 | VALID only as a corollary of G6-B for the abelian family. It is not a proof that no commutant computation recovers the unit for general D. |
| G6-B <1>1 | 117-127 | VALID. All four clauses of (H) are checked by hand for the flip. G abelian is used for grade preservation. The trivial associator is used. |
| G6-B <1>2 | 129-141 | VALID. A uniform shift of total charge by s^L preserves the block structure. A *non-uniform* shift breaks it (my mutation `shift_per_site`, RED). |
| G6-B <1>3 | 143-152 | VALID, including the onto claim and concatenation. |
| G6-B <1>4 | 154-163 | VALID. This is the step that needs both a trivial associator and an H compatible with the translation. See section 3. |
| G6-B <1>5 | 165-177 | VALID. The chain in (G6.4) is correct, using 97.11 (= F6 (7)). |
| G6-B <1>6 | 179-184 | VALID. The "if no automorphism ..." clause is a correct sufficient condition. |
| B1 | 186-190 | VALID (unit-multiplicity invariant). |
| B2 | 192-200 | VALID. The sufficient condition (different orders) is correct. It fails for G=Z_2, Z_3, Z_2^2. G=Z_4 (a=1,b=2) and Z_6 are instances. |
| G6-C1 <1>1-<1>2 | 217-237 | VALID. (G6.5) is a genuine extra hypothesis, naturality of t in the O slot. old_1 is never crossed (i<j forces j>=2), so C_2L B = B (C_L (x) u^L). |
| G6-C1 <1>3-<1>4 | 239-259 | VALID. gamma_2(h) = r u l^dagger ≠ h. |
| G6-C1 <1>5 | 261-269 | VALID. The direct-sum extension of H by the unit transport satisfies (H) blockwise. It holds for any (D,O,eta,H), so this is genuinely general. |
| G6-C1, scope | — | It proves **non-naturality** of T, theta, h and concatenation given R plus p_j. It does *not* prove non-recoverability up to a coherent choice. The note says so (NOTE:294-296); correct. |
| G6-C2 row "refinement ... identifications along j->2j-1" | 280 | GAP (overstated). delta restricts to *embeddings* A_[j,k] -> A_[2j-1,2k-1] (Theorem 90.1(ii)), not identifications. |
| G6-C2 row "full tensor-equivalence class" | 286 | FALSE citation. "G6-D below detects a particular associator change": no G6-D exists, and the ledger (line 303) marks it open. |
| G6-C2 other rows | 278-285 | VALID with the note's definition, "transported by every record isomorphism". |
| Ledger G6-D, G6-E | 303-304 | Honestly marked open. The brief's F6 E-F/E-H checks were **not delivered**. |
| Examples table | 325-330 | DEFECT. B2 (line 199) says the small instance "is confined to the Examples table and checks". The table lists only the two open F6 rows. |
| "general counterexample mechanism" | 40-41 | OVERSTATED. See section 3. |

The author's script (`checks/check_translation.py`) reran byte-identically to
`translation_output.txt`. Its three mutations fail as claimed: grade, interval
and dilation. It checks set-valued matrix-unit identities through L=4 (C_2)
and L=2 (C_4), with no phases. Every H it uses is the flip, so it cannot detect
an error in the H-dependence. My check addresses this.

## 3. General mechanism or pointed-group accident?

The proof uses three special features.
1. Every simple is invertible, so a degree-s Hilbert unitary U exists at all.
2. The associator is trivial (B_L is a plain permutation; interval embeddings carry no phases).
3. H is compatible with the translation.

Point 3 is the hidden hypothesis. My `review_g6_checks.py` builds B_L
independently, as a product of adjacent crossings with phases, for H given by a
bicharacter chi (t_Y(y(x)v)=chi(y,v) v(x)y).
- With chi=(-1)^{ab} on Z_4 and s=2, the plain translation still intertwines
  every interval and delta (PASS). Here chi(.,2)=1. The inputs O=R(+)1 and
  O'=R(+)2 are inequivalent by B1's argument.
- With chi=(-1)^{ab} or i^{ab} and s=1, and with i^{ab} and s=2, the same Phi
  **fails** delta-intertwining at L=2. These are expected failures and mutations.

**Reviewer remark R-1 [derived here; any/open; L0+H with H from a bicharacter
chi on abelian G, trivial omega; R0^u info].** If s is chi-transparent
(chi(a,s)=chi(s,a)=1 for all a), then chi(sa,sb)=chi(a,b). Hence
B'_L U_L^{(x)2} = U_{2L} B_L with identical crossing phases, and every step of
G6-B goes through verbatim. This is a one-line extension, checked in
`review_g6_output.txt`. Failure of the *plain* Phi for non-transparent s does
not exclude some other record isomorphism.

**Reviewer conjecture R-2 [sketch only, not graded proved; Law-1 gap: no local
source for Deligne products or graded E-objects].** Let E be any unitary fusion
category with pointed generating (O_E,eta_E,H_E). Let D = E (x) Hilb(G), realised
as G-graded E-objects, and take the site O = O_E ⊠ O_G. Then End(W_L) =
End_E(O_E^L) (x) End_G(O_G^L), and id (x) Ad U_L should give the same
counterexample with Hom(1,O) of different dimensions. If this holds, the defect
is not confined to pointed D. It still needs a transparent invertible object.

**Answer.** G6-B is a legitimate refutation of a universal statement. It is a
family over all finite abelian G, not one model, but it is an
**invertible-object (charge-translation) mechanism**. It says nothing about D
without nontrivial H-transparent invertible objects; Fibonacci-type D are the
natural test, as an *instance*. NOTE:40-41 should read "a counterexample family
for every nontrivial finite abelian G", not "general mechanism".

## 4. What exactly G6-B shows: the point is the missing mark

Phi preserves every interval, trailing inclusion, delta, translation
1(x)b(x)1 and endomorphism concatenation (NOTE:149-152, 288). It fails to
preserve only p_j = (eta eta^dagger)^{(j)} and everything built from it:
corners theta, h, i, j. For a translation sigma(a)=s.phi(a), sigma(e)=s≠e, so
**no translation-type isomorphism ever preserves the points.**

**Reviewer Proposition R-3 [derived for the listed instances; any/open;
L0+H; R0 info].** Let R^p = (R, {p_j}_{j>=1}), with p_j in A_[j,j] as named
elements. The G6-B instances below admit *no* R^p-isomorphism.

Proof. An R^p-isomorphism restricts to a *-isomorphism A_[1,L] -> A'_[1,L].
It carries p_1...p_L, a minimal projection lying in the unit block of size
m_L(e) = dim Hom(1,W_L), to a minimal projection in a block of the same size.
`review_g6_output.txt` gives the (source, target) sizes:
- B1/Z_2: (2,1) at L=1; there, in addition, p_0 is non-central versus central (NOTE:281).
- B2/Z_4 (a=1,b=2): (6,7) at L=2.
- B2/Z_6 (a=1,b=2): (57,58) at L=3.

No general claim is made about R^p.

So the only datum G6-B proves to be absent from R is the vacancy/point. This is
pillar P1's defining feature: O = 1 (+) X with indefinite particle number. The
negative is a statement about P1: the unital interval/dilation tower does not
know where the vacancy is; the vacancy must be declared and carried.

## 5. Corrected statements with honest tags (S; L + declarations; R)

| Id | Statement | Status | S; L; R |
|---|---|---|---|
| G6-A | Formula (G6.0) for the joint relative commutant of adjacent intervals in A_(m+n), for general unitary fusion D. | derived | any/open; L0 (delta-moved cuts: L0+H); R0 finite info |
| G6-B | Abelian G, trivial omega, flip H (or any bicharacter H with s transparent, by R-1), O'=sO. Then R(O)≅R(O') simultaneously on all intervals and delta, also preserving concatenation and translations. The inputs are inequivalent when no automorphism of G matches the multiplicities. | negative, derived | any/open; L0+declared H; R0^u information |
| G6-B1/B2 | Explicit families: unit multiplicity 2 vs 1 (B1); connected sites with a,b of different orders (B2). | negative, derived | same |
| 97.16 (positive) | Refuted by G6-B1/B2. | negative | any/open; L0+H; R0 |
| G6-C1 | Given (G6.5) and noncentral u fixing eta, R plus all p_j has an automorphism that moves T, theta, h and concatenation while fixing their range projections. | derived (naturality obstruction only) | any/open; L0+H+(G6.5); R0 marks |
| G6-C2 | Mark inventory, with rows 280 and 286 corrected as above. | derived (inventory) | any/open; L0+H; R0 |
| R-1 | Transparent-bicharacter extension of G6-B. | derived (reviewer) | as G6-B |
| R-2 | E (x) Hilb(G) extension. | conjectural (sketch, Law-1 gap) | any/open; L0+H; R0 |
| R-3 | Named points separate the tested G6-B instances. | derived for instances only | any/open; L0+H; R0 |

## 6. Pillars served

- **P1 (indefinite particle number), primary.** The vacancy summand of O is
  exactly what R forgets. Any pipeline that keeps only the unital tower,
  intervals and refinement loses where "no particle" is. The point p_j (and the
  corner/placement maps of CA-77) must be carried as declared structure along
  the tower.
- **P4 (OAR limit) / R4 fidelity.** Worklog 023 §4.4 is supported in a
  sharpened form: fidelity marks must be transported, not reconstructed. The
  first mark *proved* necessary is the point. Whether F and H must also be
  carried separately, once the point is carried, is open (section 8). No R1-R5
  rung moves.

## 7. What the brief got wrong

1. Its positive intuition (brief:154-159), "the interval filtration plus delta
   already determine the marks ... information boundary between unmarked AF and
   R", is false. The marks of (10) include eta, and R does not see eta.
2. It aimed the finite checks at "same-ring, different-associator" F6
   instances (brief:175-177). The decisive ambiguity is a **site translation**
   (same D, different [O]), which needs no associator change. Associator
   detection is a separate and still open question.
3. Its part (c) asks for "the marks recovered from R" without distinguishing
   natural recovery (transported by every isomorphism) from recovery up to
   choice. The note's distinction (NOTE:271-274, 294-296) is necessary, and
   G6-C1 lives only on the natural side.
4. 97.16's "by recovering 97.13's missing marks up to that gauge" (97:271) is
   impossible: one of those marks is eta itself.

## 8. Single sharpest next lemma

**Pointed-record faithfulness (open; any/open; L0+fixed pointed H; R0 info).**
Retain R^p = (A_infinity, {A_[j,k]}, delta, {p_j}_{j>=1}), with
p_j = kappa_j(1_{W_{j-1}} (x) eta eta^dagger) named. Two outcomes would settle it.
- *Positive:* show that every R^p-isomorphism can be composed with an
  R^p-automorphism (of G6-C1 type) so that it fixes the hop h = r l^dagger and
  the compressions i, j of 97.13 up to a unitary gauge. Then t_O = j^dagger
  alpha_2(h) i (97.13) transports H, and CA-77 Prop. 77.2 gives the equivalence.
- *Negative:* show the opposite for the F6 pair E-H (H+ versus H- on untwisted
  Z_2, O=1(+)g, points fixed) or E-F (different associators), with an explicit
  R^p-intertwiner. These are instances of the general question, not its subject.

A tempting diagonal gauge D_L = prod_{i<j} (-1)^{a_i a_j} intertwines
alpha^+ with **itself**, not with alpha^-. I checked this by hand: the
interleaved word contains all old/new pairs, giving the factor
(-1)^{|o||n|}, which commutes with a (x) 1. So E-H is not trivially R^p-isomorphic.

## 9. Checks run (laptop, < 30 s total)

- `python3 -I checks/check_translation.py`: identical to `translation_output.txt`.
  Mutations `grade`, `interval`, `dilation`: AssertionError, as claimed.
- `python3 -I checks/review_g6_checks.py` produces `checks/review_g6_output.txt`
  (GREEN, 20 s). It reports an independent dense check of trailing, all
  intervals (onto) and delta for B1/Z_2, B2/Z_4, B2/Z_6, and for the
  transparent (-1)^{ab} instance. The other parts are the three expected
  non-transparent failures, the point-block sizes of R-3, and G6-C1 on
  O=1(+)g(+)1.
- Mutations (`checks/review_g6_mutations.txt`): `chi_both_s1` and
  `chi_target_only` each fail at dilation, L=2. `shift_per_site` fails because
  phi_L does not map into A_L. All three are RED as intended.
- sha256: review_g6_checks.py `5601e2b1...`, review_g6_output.txt `585b47fa...`,
  review_g6_mutations.txt `46f82475...`, check_translation.py `28be0ec0...`.

These are finite identities. The proof of G6-B for all L is the note's
argument; the scripts calibrate it, they do not prove it.

## Sources checked

- `explorations/2026-10-25-astra-r3/G6-record-faithfulness/NOTE.md:1-340` (whole); `checks/check_translation.py:1-137`, `translation_output.txt:1-11`, `red_dilation.txt:1-9`.
- `explorations/2026-10-25-astra-r3/briefs/G6-record-faithfulness.md:121-178`; `_common_g.md:1-60`.
- `report/sections/97_what_the_tower_remembers.tex:1-272` (whole). The 97.11 square is at :183-197, 97.13 at :206-218, 97.16 at :263-272.
- `report/sections/77_pointed_carrier_invariants.tex:45-86` (Prop. 77.2 at :75-81).
- `report/sections/90_local_unital_lift.tex:57-151` (Def. 90.H at :69-77; Thm 90.1 at :110-141; (iv) at :121-122).
- `report/sections/88_layered_targets.tex:96-154`.
- `CONVENTIONS.md:1450-1470` (am), `:1524-1543` (aq), `:1564-1575` (as), `:1644-1665` (ax).
- F6: `NOTE.md:476-660`; `REVIEW.md:1-30,190-293`; `INTEGRATION.md:1-173`; `SHARD_META.md:1-100`.
- `references/text/PenneysUnitaryFusionCategories.md:219-237` (splittings), `:277-288` and `:321` (Vec_fd(G), Hilb_fd(G,omega)), `:325-348` (monoidal functor, unitor F^1), `:394-398` (coherence).
- `references/text/EtingofNikshychOstrikFusionCategories.txt:1459-1487` (positive FP character), `:1700-1706` (unitary => positive categorical dimension).
- `references/manifest/SOURCES.md:34-35,55-57` (registration).
- `worklog/023_2026-10-27_status_overview.md:18-68,161-258` (pillars; §4.4).
- No local source on Deligne products of unitary fusion categories was found by grep (R-2's gap).
