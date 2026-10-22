# E3 — Integration package (spatial seams, reflection positivity, finite OS)

Basis: `NOTE.md` as checked in `REVIEW.md` (grade WEAKER-RESULT-PROVED).
Tags follow CONVENTIONS (aq) and CA-88. They are corrected from the note's
"L3 over L0": a seam pairing is a microscopic declaration (CA-88:49-51), not
enrichment. Nothing here edits the report; this file only proposes edits.

## (a) The theorem as established, for general C

```latex
\textbf{Theorem 91.1 (E3-S, E3-L) [derived, conditional on a declared seam pairing;
setting: full (untwisted reflection), chiral only with a declared twisted reflection;
data: $\mathsf L0$ plus the declaration $s$; rung: finite, $\to\mathsf R3$].}
Let $\Cc$ be unitary fusion, $O\neq0$ a site object with dual $(\bar O,\mathrm{ev}_O,\mathrm{coev}_O)$
from the unitary spherical structure, $W_+=O\otimes\bar O$, $W_-=\bar O\otimes O$, and
$s:W_+\to W_-$ a unitary morphism with $s\,\mathrm{coev}_O=\mathrm{ev}_O^\dagger$
(it exists iff $\dim\Hom(a,W_+)=\dim\Hom(a,W_-)$ for all $a$; this holds for self-dual $O$, and fails for
$O=\one\oplus(12)\oplus(123)$ in $\mathrm{Vec}_{S_3}$).  For a tile $T\in\operatorname{End}_\Cc(O\otimes O)$ put
$\mathrm{rot}(T)=(1_{\bar O}\otimes1_O\otimes\mathrm{coev}_O^\dagger)(1_{\bar O}\otimes T\otimes1_{\bar O})
(\mathrm{ev}_O^\dagger\otimes1_O\otimes1_{\bar O})$ (associators inserted) and $K_s(T)=s^\dagger\mathrm{rot}(T)\in
\operatorname{End}_\Cc(W_+)$.  (i) For one crossing tile, with half-insertions spanning
$\bigoplus_a\Hom(a,W_+)$ and the reflected half evaluating to the adjoint half-amplitude,
spatial reflection positivity holds iff every block $K^a_{\mu\nu}=d_a^{-1}\mathrm{tr}_\Cc(v_{a,\mu}^\dagger K_s(T)
v_{a,\nu})$ is positive semidefinite; its entries are finite sums of products of $F$-symbols,
pivotal cups and $s$, with all multiplicities.  (ii) $K_s(1)=\mathrm{coev}_O\mathrm{coev}_O^\dagger$.  For the
linear history $T=1+th$, with $e=\mathrm{coev}_O/\sqrt{d_O}$, $Q=1-|e\rangle\langle e|$, $A=K_s(h)$, $a=\langle e,Ae\rangle$,
$b=QAe$, $C=QAQ$: positivity for all $0<t<\varepsilon$ holds iff $A=A^\dagger$, $C\ge0$ and $b\in\operatorname{Ran}C$,
and at a given $t$ iff in addition $d_O+t(a-b^\dagger C^+b)\ge0$.  $\varepsilon$ depends only on single-tile data, so it is
uniform in chain length and row number.  (iii) If several crossing tiles carry tensor-compatible pairings and all
other tiles occur in reflected pairs, PSD of each $K_s$ implies all-patch spatial RP.
\textbf{Negative [derived].}  Self-adjointness of $h$ is neither necessary nor sufficient. For the flip pairing,
$h=-Z\otimes Z$ with $Z=P_\one-P_X$ fails (checked for $O=\one\oplus\one$ in any $\Cc$ and for $O=\one\oplus g$ in
pointed $\Cc$ with a cocycle; general $X$ needs $s$ natural for $\operatorname{End}(O)$), and $h=E_{01}\otimes E_{10}$ on a
unit-multiplicity corner passes.
Neither is PSD of $K_s(h)$ necessary ($h=-1$).  The witnesses depend on $s$: twisting by an on-site symmetry
can restore positivity.
\textbf{Finite OS (category-free) [derived].}  A positive form $q_0$ and a translate $q_1(f,g)=q_0(f,\tau g)$ with
$0\le q_1\le q_0$ give a positive contraction on $V/\mathrm{rad}\,q_0$, and $E=-a^{-1}\log T\ge0$ if $T$ is injective.
```

Status: (i)-(iii) are derived and conditional on the declared pairing s and
on spanning. The negative clauses are derived. Finite OS is standard. Not
established: the existence of a coherent s for the whole brick grammar; a
crossing relation between the two directional transfers; lattice OS axioms
beyond the contraction lemma; anything at R1-R5.

## (b) Destination

CA-80 is 266 lines, so an amendment there would pass the 280-line cap.
**New shard, proposed CA-91** (E-order, as in E6's INTEGRATION:37-38; the
integrator assigns): `CA-91-SPATIAL-SEAMS-AND-REFLECTION-POSITIVITY`,
*Spatial Seams, Reflection Pairings and a Finite Osterwalder-Schrader Lemma*.
Outline, about 200 lines:

1. Status, sources, dependencies: CA-80 (Lemmas 80.1-80.2, coverage
   paragraph :137-140), CA-86 Lemma 86.1, CA-78 Props. 78.1-78.2, 78.7;
   Penneys :398-430, :682-708, :992-1030; D5 NOTE:231-239 (crossing kernel
   precursor); tags.
2. Seam pairing as a microscopic declaration: definition of s, the
   multiplicity criterion for existence, the gauge freedom `s∘W` with `Wu=u`,
   and the Vec_S3 obstruction (instance).
3. The bent kernel (1)-(3) and Theorem 91.1(i), with the CA-78 placement
   rule for F-paths.
4. Theorem 91.1(ii): `K_s(1)=uu†` and the Schur criterion; uniformity;
   exact gates only pointwise (CA-78 ODE) plus the derivative constraints.
5. Theorem 91.1(iii), multi-tile sufficiency, with the compatibility
   hypotheses listed. Necessity only under single-tile spanning.
6. Negative results (E3-N), including the pairing dependence (X-twist).
   Remark: Hermitian `K_s(h)` ⇔ Θ_x(h)=h, proved in Vec and conjectured in
   general.
7. Finite OS lemma (E3-OS) and what it does not give: covariance, locality,
   momentum positivity (J P J† = −P).
8. Two directions: typing of the perpendicular transfers, the rank argument
   against a single-tile similarity, and the train lemma E3-Y/E3-D as the
   correct one-carrier statement. KS diagonal reading as in CA-78 erratum.
9. Open lemmas (reflection coherence, exact-gate semigroup, strip
   translation, crossing-and-closure, continuum), and the examples table
   (Vec_Z3, Rep(A4), Vec_S3, Vec_{Z2}^ω; instances only).

Companion one-line edits: CA-80:137-140 should append "spatial RP for a
declared seam pairing: CA-91". The CA-75 Link (a2) row should note that the
seam *operator* exists (CA-91 §3) while the sewing/anomaly-line question
stays open.

## (c) CA-88 grid

- New row: `CA-91 | full (chiral: twisted reflection) | L0 + declared s | →R3 (finite) | spatial seam kernel, Schur criterion [derived, cond. on s]; finite OS [derived]; F∘dagger crossing and perpendicular commutator ill-typed [negative]`.
- R3 row, "Certificate in repo": add "91.1 (spatial RP, finite)" beside
  80.2-80.5. This adds the second Euclidean direction at finite size. It does
  not certify R3.
- The CA-80 row is unchanged. Its "reflection positivity [derived]" remains
  temporal only.
- No cell moves rung. The L-column gains one observation: a coherent s is
  automatic at L1 (the braiding supplies it; ribbon identity not yet locally
  sourced) and for self-dual O at L0, and it can fail for non-self-dual O in
  non-braided C. This is the same L0/L1 split as R0^u (CA-88:104; E1).

## (d) Links and conflicts

- **E2 (parity).** Same typing problem: E2's map (20) is E3's antilinear
  `X ↦ (X^∨)^†`, which sends O to Ō. E2-R's mirror carrier is a candidate
  for E3's "doubled oriented grammar" (Open Problem 1). Hermitian `K_s(h)`
  forces Θ_x-invariant h, so untwisted spatial RP sits in the parity-symmetric
  (c = c̄) regime that E2 claims. No conflict, but E3's "setting: both" must
  become "full; chiral only with a twisted reflection".
- **E4 (Ward-to-KS).** E4's W1 needs a "physical positive quotient"
  (E4 INTEGRATION:100-103). E3-OS is the finite quotient lemma, and E3-S
  supplies the seam form. E4 needs the strip-translation lemma (Open Problem
  3) to make the quotient carry the KS modes. No conflict.
- **E5 (fidelity).** E5 assumes (F1) = R3. E3 supplies one finite Euclidean
  ingredient upstream. No conflict.
- **E1 (local unital lift).** Parallel L0/L1 dichotomy: braiding supplies
  both the local unital lift (E1) and the seam pairing s (E3). For
  non-braided C both need extra declared data (a half-braiding, or a
  self-duality or mirror). No conflict.
- **E6.** No direct link (z = 2, nonrelativistic), as E6's INTEGRATION:94-95
  states.
- **Round 1 / shards.** E3 extends D5-P/CA-80 Lemma 80.2 to plaquette seams
  and makes D5 NOTE:231-239's crossing kernel precise. It keeps the CA-78
  diagonal/brick erratum and does not contradict CA-78 Lemma 78.4. **One
  conflict to fix:** the note's layer tags ("L3 over L0", "R0") contradict
  CA-88 Defs. 88.2-88.3 and CA-88:49-51. Use the tags in (a).

## (e) The single next lemma

**Reflection-coherence lemma.** Let C be unitary fusion, O a site object
with a declared unitary self-duality ψ: O → Ō (L0), or C braided (L1). The
antilinear anti-monoidal functor `X ↦ (X^∨)^†`, composed with ψ, then
defines an antiunitary Θ_x on every brick-patch cut space. Prove three
things. (i) Θ_x is compatible with CA-80 Lemma 80.1 sewing, and Θ_x² acts
trivially on observables. (ii) The induced seam pairing satisfies
`s coev_O = ev_O†`, with Frobenius-Schur phases tracked. (iii)
`K_s(h)` is Hermitian iff Θ_x(h) = h. Together with Theorem 91.1(iii), this
turns the conditional single-tile criterion into spatial RP of the whole
CA-86 linear history for every self-dual site. It is the first step that
makes E3(a) a statement about (C, O, h) rather than (C, O, h, s).
