# Source anchors for CA-74-JW-KERNEL-DECISION

Prepared by the source-anchor worker, 2026-07-06. Per AGENTS.md Law 1 / Rule 5:
every citation below is a local path + line locator + short verbatim quote from
`references/` or `literature/md/`. Quotes were read with the `Read` tool
directly against the files (verbatim), not from Bash `grep` output.

**Extraction caveat (important for anyone re-checking these).** Two independent
extraction issues affect these files:
1. Some `.tex`/`.txt` sources (notably `DiluteTL2014/.../Dtl_pgl_ell.06.tex`)
   contain embedded NUL bytes, so plain `grep` treats them as binary and prints
   nothing — use `grep -a` or the `Read` tool.
2. The `pdftotext` extraction
   `references/text/TemperleyLiebRootsJonesQuotient.txt` occasionally mangles
   inline fractions/superscripts (e.g. the quantum-integer line 149 renders
   `[m]x = xx−x −1` for `(x^m − x^{-m})/(x − x^{-1})`). Prose and displayed
   math elsewhere in that file are clean and faithful.

Primary sources used:
- **ILZ** = K. Iohara, G. I. Lehrer, R. B. Zhang, *Temperley-Lieb at roots of
  unity, a fusion category and the Jones quotient*, arXiv:1707.01196
  (`references/text/TemperleyLiebRootsJonesQuotient.txt`; registered
  `SRC-TL-JONES` in `references/manifest/SOURCES.md`).
- **EM-M** = C. Edie-Michell, S. Morrison, *A field guide to categories with
  A_n fusion rules*, arXiv:1710.07362 (`literature/md/1710.07362/1710.07362.md`).
- **RS07** = N. Read, H. Saleur, *Enlarged symmetry algebras of spin chains,
  loop models, and S-matrices*, cond-mat/0701259
  (`references/lattice-symmetry/ReadSaleur2007/source/ensymsh.tex`).
- **dTL** = *The principal indecomposable modules of the dilute Temperley-Lieb
  algebra* (`references/lattice-symmetry/DiluteTL2014/source/Dtl_pgl_ell.06.tex`).
- **dTL-fus** = dilute-TL fusion paper
  (`references/lattice-symmetry/DiluteTLFusion2015/source/Full.01.tex`).
- **Penneys** = D. Penneys, *Unitary fusion categories* lecture notes
  (`references/text/PenneysUnitaryFusionCategories.md`).
- **RSW** = Rowell, Stong, Wang, *On classification of modular tensor
  categories* (`references/category-theory/RowellStongWang2009Classification/source/RSWfinal3.tex`).

---

## Claim 1 — Definition of the Jones-Wenzl projector p_n and the Wenzl recursion

Best anchor (recursion, diagrammatic form of the Wenzl recursion):

    % Source: literature/md/1710.07362/1710.07362.md:30-33 --
    %   "Here f^{(k+1)} is the (k+1)-th Jones-Wenzl projection, defined
    %    recursively so f^{(0)} is the identity on 1 and
    %    (1.1)  f^{(k+1)} = f^{(k)} - \frac{[k]_q}{[k+1]_q} [cup-cap diagram]"

Supporting anchor (uniqueness + the defining "kills e_i" property, at the
root-of-unity index):

    % Source: references/text/TemperleyLiebRootsJonesQuotient.txt:135-137 --
    %   "Suppose the order of q^2 is ℓ. Then there is a unique idempotent
    %    E_{ℓ−1} ∈ TL_{ℓ−1} (the Jones-Wenzl idempotent) such that
    %    f_i E_{ℓ−1} = E_{ℓ−1} f_i = 0 for 1 ≤ i ≤ ℓ − 2."

Supporting anchor (JW projector = idempotent of TL_k, built recursively):

    % Source: references/lattice-symmetry/ReadSaleur2007/source/ensymsh.tex:849-853 --
    %   "where P^\bullet (P_\bullet) is the (Jones-Wenzl) projection operator to
    %    the ``traceless'' sector ... which can be constructed recursively using
    %    the TL_k(q) algebra in these spaces"

Strength: **Adjacent-to-exact.** EM-M:33 is the Wenzl recursion in its standard
diagrammatic form; the last factor `p_k e_k p_k` appears in the source as a
cup-cap (turn-back) diagram = `e_k`, dropped by the markdown extraction, so the
explicit scalar `[k]/[k+1]` and structure are verbatim but the `e_k` factor is
only implicit. No local source states the fully explicit *algebraic* form
`p_{k+1} = p_k − ([k]/[k+1]) p_k e_k p_k`. EM-M:33 + ILZ:135-137 + RS07:849-853
together pin the definition and recursion unambiguously.

Acquisition (for the explicit algebraic recursion + full JW theory):
Kauffman–Lins, *Temperley–Lieb Recoupling Theory and Invariants of 3-Manifolds*
(book, no arXiv); or, arXiv-available, S. Morrison, *A formula for the
Jones–Wenzl projections*, arXiv:1503.00384; original: H. Wenzl, *On sequences of
projections*, C. R. Math. Rep. Acad. Sci. Canada 9 (1987) 5–9 (pre-arXiv).

---

## Claim 2 — Quantum integers [n]_q; at β = 2cos(π/5) = φ (q = e^{iπ/5}), [5]_q = 0
##            while [2],[3],[4] ≠ 0; p_4 is the FIRST negligible JW projector
##            (quantum/Markov trace zero)

Quantum-integer definition (clean):

    % Source: literature/md/1710.07362/1710.07362.md:71 --
    %   "Our conventions for quantum integers are [n] = (s^{2n} − s^{-2n})/(s^2
    %    − s^{-2}), and we write [n]! for the quantum factorial [n][n−1]···[2][1]."
    % (Same definition appears, extraction-mangled, at
    %  references/text/TemperleyLiebRootsJonesQuotient.txt:149.)

β = quantum dimension = 2cos(π/(k+2)) = φ at Fibonacci (k = 3, i.e. SU(2)_3):

    % Source: references/text/TrebstShortIntroductionFibonacciAnyons.txt:216-217 --
    %   "In the Fibonacci theory, the quantum dimension of τ is the golden ratio
    %    ϕ = (1+√5)/2."
    % Source: references/text/TrebstShortIntroductionFibonacciAnyons.txt:1031 --
    %   "d = 2 cos[π/(k + 2)]."   (k = 3 ⇒ d = 2cos(π/5) = φ)
    % Source: references/text/IsingLikeFibonacciAnyonsKZ.txt:999 --
    %   "the quantum dimension of τ is the golden ratio φ = ... One of the
    %    realizations of this anyon is level 3 SU(2)."   (⇒ ℓ = k+2 = 5, q = e^{iπ/5})

"p_4 is the FIRST negligible JW projector" — the radical of the trace first
appears at n = ℓ−1, generated by the JW idempotent (for Fibonacci ℓ = 5 ⇒
E_4 ∈ TL_4):

    % Source: references/text/TemperleyLiebRootsJonesQuotient.txt:63-67 --
    %   "If q is a root of unity, and the order |q^2| = ℓ, then τ_n has a radical
    %    of dimension 1 if n = ℓ − 1, the generating element being the
    %    Jones-Wenzl idempotent E_ℓ ∈ TL_{ℓ−1}(q). ... for any n ≥ ℓ − 1, the
    %    radical R_n(q) of tr_n is generated by E_ℓ ∈ TL_{ℓ−1}(q) ⊆ TL_n(q)."
    % Source: references/text/TemperleyLiebRootsJonesQuotient.txt:139-141 --
    %   "tr_n is non-degenerate if and only if n ≤ ℓ − 2, where ℓ = |q^2|. ...
    %    but TL_{ℓ−1} is semisimple."

"Negligible = quantum/Markov trace zero" (the characterization of what is
quotiented out):

    % Source: references/text/TemperleyLiebRootsJonesQuotient.txt:950-952 --
    %   "the tilting modules T_q(m) with 0 ≤ m ≤ ℓ − 2 are precisely those
    %    tilting modules which have endomorphisms with non-zero quantum trace."
    % Source: references/text/TemperleyLiebRootsJonesQuotient.txt:62 --
    %   "The algebra TL_n(q) has a trace tr_n, identified by Jones, whose
    %    associated bilinear form is generically non-degenerate."   (Markov trace)

Strength: **Strong for the general/structural statement; the Fibonacci numerics
are derivable, not verbatim.** ILZ gives verbatim: quantum-trace radical first
nonzero at n = ℓ−1 = 4, generated by the JW idempotent E_4 ∈ TL_4 — i.e. p_4 is
the first negligible (trace-zero) JW projector. The specific arithmetic
"[5]_q = 0 while [2],[3],[4] ≠ 0" is *not stated verbatim* in any local source;
it follows immediately from the quantum-integer definition at q = e^{iπ/5}
(|q^2| = ℓ = 5) plus the ILZ statement that non-degeneracy holds exactly for
n ≤ ℓ−2 = 3. Recommend citing ILZ:63-67,139-141 + EM-M:71 and doing the
one-line [n]_q evaluation as a checked derivation in the shard.

---

## Claim 3 — Kernel of the dense evaluation TL_n(φ) → End(τ^{⊗n}) is the
##            negligible ideal (generated by p_4); dim TL_4 = C_4 = 14 vs
##            dim End(τ^{⊗4}) = 13; TL at root of unity → fusion-category quotient

Best anchor (the ideal generated by the JW idempotent = radical of the trace;
quotient is the semisimple fusion category = an endomorphism algebra):

    % Source: references/text/TemperleyLiebRootsJonesQuotient.txt:135-137 --
    %   "there is a unique idempotent E_{ℓ−1} ∈ TL_{ℓ−1} (the Jones-Wenzl
    %    idempotent) ... Moreover for n ≥ ℓ the radical of tr_n is generated as
    %    ideal of TL_n by E_{ℓ−1}."
    % Source: references/text/TemperleyLiebRootsJonesQuotient.txt:68-69 --
    %   "for n ≥ ℓ, the algebra TL_n(q) has the canonical semisimple quotient
    %    Q_n(ℓ) := TL_n(q)/R_n(q), which we refer to as the Jones algebra."
    % Source: references/text/TemperleyLiebRootsJonesQuotient.txt:24-25 (abstract) --
    %   "We show Q_n(ℓ) is the endomorphism algebra of a certain module in Cred
    %    and use this fact to recover a dimension formula for Q_n(ℓ)."

dim TL_n = Catalan (⇒ dim TL_4 = C_4 = 14):

    % Source: references/lattice-symmetry/DiluteTL2014/source/Dtl_pgl_ell.06.tex:2985 --
    %   "The dimension of TL_n is the Catalan number C_{n+1} = \frac{1}{n+1}\binom{2n}{n}."
    %   (their C_{n+1} is the standard n-th Catalan number; n=4 ⇒ 14)

Supporting (no JW projector exactly when the TL module is not simple / algebra
not semisimple — the obstruction is the negligible/radical part):

    % Source: references/lattice-symmetry/ReadSaleur2007/source/ensymsh.tex:3818-3822 --
    %   "the algebras, and some of the standard modules, are not semisimple; the
    %    problem occurs whenever the k/2th standard TL module over TL_k(q) is not
    %    simple, in which case there is no corresponding Jones-Wenzl projector (an
    %    idempotent element of the TL_k(q) algebra) onto that module."

Supporting context (root-of-unity truncation of quantum-group categories gives
the unitary fusion categories):

    % Source: references/category-theory/RowellStongWang2009Classification/source/RSWfinal3.tex:3778-3780 --
    %   "When q = e^{±πi/ℓ}, H. Wenzl showed that the quantum group type
    %    categories are unitary, and they are known to be modular."

Strength: **Strong for "kernel = ideal generated by the JW idempotent, quotient
= semisimple fusion / endomorphism algebra"; the specific 14-vs-13 numerics are
derivable, not verbatim.** ILZ states verbatim that the kernel of the trace form
is the two-sided ideal generated by the JW idempotent E_{ℓ−1} (for Fibonacci,
E_4 = p_4), and that TL_n / (that ideal) is the semisimple fusion-category
quotient realised as an endomorphism algebra — exactly Claim 3 at the structural
level. `dim TL_4 = 14` is verbatim-derivable from dTL:2985. `dim End(τ^{⊗4}) = 13`
is **not** stated in any local source; it follows as 14 − 1 (the radical has
dimension 1 at n = ℓ−1 = 4, ILZ:64) = 13, equivalently 2² + 3² (squares of the
Fibonacci Hom-space dimensions, cf. Claim 5). Recommend a checked derivation in
the shard rather than a verbatim citation.

Absent locally: the fusion-category-theoretic term **"negligible morphism /
negligible ideal"** (Hom quotient by morphisms of zero categorical trace) is
NOT defined in any local source — every `grep` hit for "negligible" in
`references/` and `literature/md/` is the physics sense ("negligible
contribution"). The local vocabulary is instead "radical of the (Markov/Jones)
trace form" (ILZ). If the shard wants the categorical framing verbatim,
acquire: EGNO, *Tensor Categories* (AMS 2015, the "negligible morphisms /
semisimplification" material; book) or V. Turaev, *Quantum Invariants of Knots
and 3-Manifolds* (book). arXiv-available adjacent: F. Goodman, H. Wenzl, *The
Temperley-Lieb algebra at roots of unity*, Pac. J. Math. 161 (1993) 307–334
(cited by both ILZ and dTL, **not** locally held — pre-arXiv; this is the
canonical explicit "TL at roots of unity → semisimple quotient" reference and is
the single most useful acquisition for this claim).

---

## Claim 4 — Structure of the DILUTE TL algebra at roots of unity
##            (cellular / standard-module structure, ideals, radical, corner iso)

Filtration by two-sided ideals (diagrammatic):

    % Source: references/lattice-symmetry/DiluteTL2014/source/Dtl_pgl_ell.06.tex:885-887 --
    %   "the linear span I_k ⊂ dTL_n of all n-diagrams a such that c(a) ≤ k is an
    %    ideal of dTL_n and [filtration eq:filtrationByIdeals]"

Semisimple exactly off the root-of-unity locus:

    % Source: references/lattice-symmetry/DiluteTL2014/source/Dtl_pgl_ell.06.tex:2331 --
    %   "The dilute standard module U_{n,k} is irreducible if q is not a root of unity."
    % Source: references/lattice-symmetry/DiluteTLFusion2015/source/Full.01.tex:951 --
    %   "When q is not a root of unity different from ±1, the algebras TL_n and
    %    dTL_n are semi-simple and the standard modules S_{n,i} are all
    %    irreducible and projective."

Structure AT a root of unity — cellular algebra + non-semisimple:

    % Source: references/lattice-symmetry/DiluteTL2014/source/Dtl_pgl_ell.06.tex:2681,2685 --
    %   "The structure of dTL_n at a root of unity. ... In this section, q is a
    %    root of unity and ℓ the smallest positive integer such that q^{2ℓ}=1."
    % Source: references/lattice-symmetry/DiluteTL2014/source/Dtl_pgl_ell.06.tex:2689 --
    %   "when q is a root of unity, some of them will be reducible, yet
    %    indecomposable. ... the algebra dTL_n is not always semisimple. To probe
    %    its structure the first subsection first shows that dTL_n is a cellular
    %    algebra"
    % Source: references/lattice-symmetry/DiluteTL2014/source/Dtl_pgl_ell.06.tex:2728 --
    %   "The dilute Temperley-Lieb algebra dTL_n(β) is cellular. Its cell modules
    %    S_k, k∈{0,1,…,n}, are isomorphic to the standard modules U_{n,k} ..."

Radical structure (dilute radical built from ordinary TL radicals — which are
generated by JW idempotents, cf. Claim 2/3):

    % Source: references/lattice-symmetry/DiluteTL2014/source/Dtl_pgl_ell.06.tex:2314-2318 --
    %   "The dilute radical dr_{n,k} decomposes as [⊕'_p C(n,k+2p) R_{k+2p,k}] as
    %    vector spaces, where R_{n,k} is the radical of the Gram bilinear form on
    %    the TL_n-module V_{n,k} ..."

Corner / idempotent-truncation isomorphism to ordinary TL (the "corner iso" the
task asked about — the dilute analogue of extracting TL_k):

    % Source: references/lattice-symmetry/DiluteTL2014/source/Dtl_pgl_ell.06.tex:2413 --
    %   "set π_z = |z z̄| ∈ dTL_n ... The set T_z = π_z dTL_n π_z is spanned by
    %    n-diagrams that have precisely (n−k) vacancies ... The vector space T_z
    %    is a subalgebra of dTL_n isomorphic to TL_k."
    % Source: references/lattice-symmetry/DiluteTL2014/source/Dtl_pgl_ell.06.tex:2417 --
    %   "π_z π_z = π_z so that π_z, z∈X_{n,k}, acts as a projector."

Global relation to ordinary TL (Morita equivalence — relevant to how dense/TL
data restricts through the dilute algebra):

    % Source: references/lattice-symmetry/DiluteTL2014/source/Dtl_pgl_ell.06.tex:2904 --
    %   "it can be shown that dTL_n and the direct sum TL_n ⊕ TL_{n−1} are
    %    Morita-equivalent when β ≠ 0."

Chebyshev/fusion at a root of unity:

    % Source: references/lattice-symmetry/DiluteTLFusion2015/source/Full.01.tex:2806 --
    %   "When q is a root of unity, they behave like a polynomial ring, with a
    %    basis of Chebyshev polynomials of the second kind:"

Strength: **Strong and directly on-point for cellular/standard-module/ideal/
radical/corner structure.** These verify and substantially extend the CA-69
anchors (208-213 = definition; 636-640, 773-776 = generators; 891-895 =
symmetric-vacancy subset; 1020-1033 = link-basis correspondence with the TL_{2m}
standard module; 2339 = "Structure of dTL_n for q generic ... semisimple" — all
confirmed in `Dtl_pgl_ell.06.tex`). Note: the dilute papers contain **no**
occurrence of "Jones-Wenzl" or "negligible" outside the bibliography; the dilute
*analogue* of the negligible/JW structure is realised through (i) the two-sided
ideal filtration I_k (:885-887), (ii) the corner iso π_z dTL_n π_z ≅ TL_k
(:2413) — under which ordinary-TL JW/negligible data restricts — and (iii) the
dilute-radical = ⊕ ordinary-TL-radicals decomposition (:2314-2318). This is the
honest bridge; state it as such rather than claiming a verbatim "dilute JW
projector."

---

## Claim 5 (bonus) — dim End(τ^{⊗n}) counted by Fibonacci numbers;
##            dim TL_n = Catalan number

dim TL_n = Catalan (verbatim):

    % Source: references/lattice-symmetry/DiluteTL2014/source/Dtl_pgl_ell.06.tex:2985 --
    %   "The dimension of TL_n is the Catalan number C_{n+1} = \frac{1}{n+1}\binom{2n}{n}."

Fibonacci-number counting of fusion / Hom spaces:

    % Source: references/text/IsingLikeFibonacciAnyonsKZ.txt:1390-1391 --
    %   "The dimension of conformal block spaces of m-point Fibonacci anyons for
    %    arbitrary positive integer m is the (m − 1)-th Fibonacci number f_{m−1}
    %    (f1 = f2 = 1, f3 = 2, ...)."
    % Source: references/cft/AasenFendleyMong2020/source/_fusion_categories_and_diagrammatics.tex:113 --
    %   "The reason for the name Fibonacci is apparent from the non-trivial fusion
    %    rule ...; continually fusing τ elements together gives multiplicities of
    %    the Fibonacci numbers."
    % Source: references/text/PenneysUnitaryFusionCategories.md:631,633 --
    %   "a decomposition of id_{τ⊗τ} into a sum of minimal central projections in
    %    End(τ ⊗ τ) ≅ C^2 ... Fib(τ → τ ⊗ τ ⊗ τ) is also 2-dimensional"

Strength: **Strong for both halves, with a nuance.** `dim TL_n = C_n` is
verbatim (dTL:2985). The Fibonacci half is verbatim for *fusion/Hom-space*
dimensions being Fibonacci numbers (IsingKZ:1391, AFM:113, Penneys:631-633). The
exact quantity `dim End(τ^{⊗n})` is a *sum of squares* of these Fibonacci
Hom-dimensions (e.g. dim End(τ^{⊗4}) = 2² + 3² = 13), which no local source
prints as a closed formula; cite the Fibonacci counting above and note the
sum-of-squares step as a one-line derivation.

---

## One-line summary (single best anchor per claim)

1. `literature/md/1710.07362/1710.07362.md:30-33` (Wenzl recursion, diagrammatic;
   explicit algebraic `p_k e_k p_k` form ABSENT — acquisition: Morrison
   arXiv:1503.00384 or Kauffman–Lins book).
2. `references/text/TemperleyLiebRootsJonesQuotient.txt:63-67` (radical/JW
   idempotent first appears at n = ℓ−1; [n]_q def at
   `literature/md/1710.07362/1710.07362.md:71`; Fibonacci "[5]=0" numerics
   derivable, not verbatim).
3. `references/text/TemperleyLiebRootsJonesQuotient.txt:135-137` + `:24-25`
   (kernel = ideal generated by JW idempotent; quotient = semisimple fusion /
   endomorphism algebra). Categorical word "negligible" and the 14-vs-13
   numerics ABSENT/derivable — acquisition: Goodman–Wenzl, Pac. J. Math. 161
   (1993) 307–334, and/or EGNO *Tensor Categories*.
4. `references/lattice-symmetry/DiluteTL2014/source/Dtl_pgl_ell.06.tex:2681-2728`
   (root-of-unity section: dTL_n cellular, non-semisimple) + `:2413` (corner iso
   π_z dTL_n π_z ≅ TL_k) + `:2314-2318` (dilute radical = ⊕ TL radicals). Present
   and strong.
5. `references/lattice-symmetry/DiluteTL2014/source/Dtl_pgl_ell.06.tex:2985`
   (dim TL_n = Catalan) + `references/text/IsingLikeFibonacciAnyonsKZ.txt:1391`
   (Fibonacci-number fusion-space dimensions).
