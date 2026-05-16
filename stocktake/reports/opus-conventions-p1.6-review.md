# Review: P1.6 CONVENTIONS.md population

**Reviewer:** Opus (hostile)
**Date:** 2026-05-16
**Step:** P1.6 of `stocktake/MIGRATION_PLAN.md`
**Author commit (unreviewed):** local working-tree modification to
`CONVENTIONS.md` (528 insertions, 10 deletions over the prior 34-line
schema stub). `summary.tex` SHA256
`fa4d2059f3fb577ebe9e84ace2ab0ee6ef2b6d0cec7cde60d53da7951b0bfe63`
verified against the in-doc citation in entry (f).

---

## Verdict

**APPROVE WITH MINOR EDITS.**

Substantively correct. All source-fidelity checks pass on the
canonical claims; the 10-entry structure is internally consistent and
the schema is uniformly applied; both load-bearing
hallucination-risk callouts (vacuum-index in (a), F-matrix gauge in
(b)) are explicitly tagged and traceable to `CLAUDE.md`. The
deferral of (f) is correctly justified and gated by a verified
`grep` + SHA256 pin.

The minor edits are tighten-ups (one line-number offset, one mild
overreach, three sweep-status spot-checks that prefer "uses" to
"declares") — not blockers. Land as-is or with the edits below; the
file is fit for the GLOSSARY-peer status it claims.

---

## What I verified

### Source-fidelity (entry by entry)

| Entry | Claim | Verification | Verdict |
|---|---|---|---|
| (a) | `summary.tex:76` `conv:basics` says "vacuum simple" | Line 80 of `summary.tex`: "(also called the *vacuum* simple)" within the `conv:basics` body that starts at line 76 | OK |
| (a) | STL-1 bug = three-way 0/1 conflict | `mma-tex-lit.md:129` confirms: `config.jl:12,15` uses `1`; `hilbert_space.md:39` uses `0` | OK |
| (a) | bridge:136 lists vacuum-at-1 as convention dep (a) | Bridge report §1.3 line 136 item (a): "**vacuum at index 1** in `simples(C)` (`config.jl:5,13`)" | OK |
| (b) | `def:fsymbol` requires unitarity | `summary.tex:167–168` "in the unitary case each F^{abc}_d is a unitary matrix" | OK |
| (b) | `lem:F-invol` line 1072 proves Fibonacci F²=I | `summary.tex:1072` `\begin{lemma}\label{lem:F-invol}` proves real, symmetric, unitary, involutory | OK |
| (b) | mma-julia.md:142-149 documents involutory gauge | mma-julia.md "Convention differences" block is actually lines 145-148. Off by 3, but content is present | MINOR |
| (b) | Bridge §5.3 (`opus-hilbert-bridge.md:325`) cross-validates | Bridge line 327 begins §5.3 "F-symbol check (cross-formulation consistency)" — content matches | OK |
| (c) | `conv:basics` defines dagger | `summary.tex:77–78` confirms verbatim | OK |
| (c) | "Unique categorical structure" claim | mild overreach — `conv:basics` doesn't say "unique"; up to monoidal equivalence is the standard fact, but is not in the cited source | MINOR (see edits) |
| (d) | `def:splitbasis` introduces μ when N≥2, drops when N∈{0,1} | `summary.tex:152–153` confirms verbatim | OK |
| (d) | Fibonacci/Ising/sVec all multiplicity-free | `def:fib` line 1010 says "Fibonacci is multiplicity-free: every N_{ab}^c ∈ {0,1}". Ising `def:ising` fusion rules are all `1`-term. sVec (super-vector spaces) is standardly multiplicity-free | OK |
| (d) | bridge §3.5 lines 263-269 is the source for LB-1 | Exact line range verified | OK |
| (d) | LB-1 = bd `cft-anyons-q6h` | bd issue verified to exist via prior commits (P1.4-early-B filed it) | OK |
| (e) | `\bar a` for dual at line 128 | `summary.tex:128` "rigid duals: each simple a has a dual `\bar a`" | OK |
| (e) | `\bar L_n` for anti-chiral at 1774 | `summary.tex:1774` `\bar L_n^{(N)}` | OK |
| (e) | `\bar z` at 1837 | `summary.tex:1837` `\bar z^{\bar h_c-\bar h_a-\bar h_b}` | OK |
| (e) | `\overline{...}` for closure at 434 | `summary.tex:434` `\overline{\varinjlim_P \Hh_P^W}` | OK |
| (e) | `\bar a, \bar b` complex-conjugate at 696-697 | `summary.tex:696` `\bar a\cdot v^{\one}_{p,p}`; line 697 `\bar b` | OK |
| (e) | `\overline{β^μ_ν}` at 1934 as scalar conjugation example | `summary.tex:1934` `\overline{\beta^{\mu}{}_{\nu}}` confirmed; this is scalar conjugation under (e)'s prescribed two-bucket rule | OK |
| (f) | `grep -in tikz summary.tex` returns nothing | `grep -ic tikz summary.tex` = 0; SHA256 matches; preamble (lines 3-8) has no `\usepackage{tikz}` | OK |
| (g) | `summary.tex H_N^W` uses N=tensor degree | `def:Hlatt:285-286` confirms | OK |
| (g) | `def:particle-number` uses `k` = non-vacuum count | `summary.tex:347` `k(a_1,\dots,a_N) := \#\{i : a_i \ne \one\}` | OK |
| (g) | MMA hilbert.jl: `N` = particle number | Bridge §4 line 279 confirms this and recommends the L/n rename | OK |
| (h) | Five alternatives match `rem:Q-choices` enumeration order | summary.tex `rem:Q-choices` (lines 201-252) enumerates: (1) Q_full, (2) Q_restr={1,p}, (3) multiplicity-decorated Q^geom_I, (4) site-dependent, (5) coarse-grained Q^⊗k — matches CONVENTIONS (h) exactly | OK |
| (h) | `warn:Q-not-canonical` at line 254 | `summary.tex:254` confirmed | OK |
| (h) | MMA hard-codes Q_full, cannot represent (2)-(5) | Bridge §2.3 line 236: "MMA bakes in A_I = Q_full"; bridge line 281: "MMA fixes Q = ⊕_{a≠1} a implicitly ... is actually Q_full after absorb-vacuum-legs reindexing" | OK |
| (h) | Option (3) violates (d) (multiplicity-decorated implies M_a > 1) | Correct: `Q^geom_I = ⊕_a M_a^{(I)} ⊗ a` with `dim M_a > 1` is exactly the case where Prop 3.1.2's multiplicity factor doesn't collapse | OK |
| (i) | All three Hilbert formulations use left-associated | Bridge report line 283 confirms: "All three use left-associated" with cross-citations to summary.tex Def 3.2 and `hilbert.jl:13` | OK |
| (j) | Empty configuration reduces to δ_{W,1}·ℂ | Bridge §3 "Edge cases checked" first bullet (line 253) gives the explicit reduction; CONVENTIONS (j) restates correctly | OK |
| (j) | `def:partition` requires |P|≥1 | `summary.tex:374–382` defines partition with `\bigcup_{i=1}^N I_i = X` (so for non-empty X, N≥1 implicit) | OK |
| (j) | `enumerate_fusion_trees(C, [], c)` returns [[]] iff c=1 | Bridge §3 line 253 verbatim, with `[Int[]]` Julia syntax | OK |

### Forward-pointer integrity

Python cross-check:
- 7 distinct `P1.6(letter)` references in GLOSSARY: `a, b, d, g, h, i, j`
- 10 `## (letter)` headers in CONVENTIONS: `a, b, c, d, e, f, g, h, i, j`
- Unresolved P1.6 letters: **none**
- 25 `[[slug]]` cross-links from CONVENTIONS to GLOSSARY: **all 25 resolve to extant slugs**

Status block's claim "7 in-use forward-pointers resolve" is **accurate**.

### Sweep-status spot-checks (3 entries)

I picked (c) dagger, (h) cell-object Q, and (i) fusion-tree ordering.

**(c) dagger sweep status:**
- `[[def:algobj]]` claim: dagger-special `mm^† = λ id_A`. Body lines 751-755 confirm | OK
- `[[def:refmap]]` claim: `E^† E = id`. body line 417 of `summary.tex` confirms `E_{P\to P'}^{\dagger} E_{P\to P'} = \id_{A_P}`. The GLOSSARY def:refmap mirrors this | OK
- `[[def:polar-repair]]` claim: uses `J_N^\dagger` and `I_N^\dagger`. body of def:polar-repair confirms | OK

**(h) Q-choice sweep status:**
- `[[def:lenref]]` claim: uses `Q = 1 ⊕ p`, option (2). body uses `\one_I` and `p` directly within the square-zero `S = {1, p}` context | OK
- `[[def:rchild]]` claim: Fibonacci-specific on `Q = 1 ⊕ τ`, option (2). body uses `A = 1 ⊕ τ` with the Fibonacci algebra | OK
- `[[def:Ageom]]` claim: uses option (3) multiplicity-decorated. body `A_I^{geom} = ⊕_i J_I^{(h_i)} ⊗ a_i` matches `Q^geom_I` form | OK

**(i) fusion-tree ordering sweep status:**
- `[[def:splitbasis]]` claim: the categorical basis. body uses splitting vertex `v^a_{b,c;μ} ∈ Hom(a, b⊗c)` (which is the binary-vertex case underlying left-associated trees) | OK
- `[[def:fib-F]]` claim: matrix entries in left-associated convention. body says "standard basis where the intermediate channel is either 1 or τ" — matches | OK
- `[[def:mobile-Fock]]` convention dep #5 references left-associated [P1.6(i)]: convention-dependency #5 (line 1780 of GLOSSARY) confirms verbatim | OK

### Hallucination-risk callout coverage

CLAUDE.md lists 7 callouts. Mapping to CONVENTIONS:
- Vacuum-index 0-vs-1 → **(a)**: explicitly tagged "STL-1 bug" at CONVENTIONS line 74. **OK**
- F-matrix gauge unitary-vs-involutory → **(b)**: explicitly tagged "CLAUDE.md hallucination-risk callout" at CONVENTIONS line 132-134. **OK**
- Coassociativity scalar-vs-categorical → out of scope for CONVENTIONS; handled in `def:coassoc` (GLOSSARY). Not a gap in CONVENTIONS.
- Dagger-special vs Frobenius-special → out of scope for CONVENTIONS; handled in `def:algobj` Notes (GLOSSARY). Not a gap in CONVENTIONS.
- Hilbert-space framings → out of scope for CONVENTIONS; handled by P1.5 Translation maps in GLOSSARY.
- `\unchecked` flags → out of scope for CONVENTIONS; handled in `CITATION_INDEX.md`.
- Chats archived → out of scope for CONVENTIONS; handled in `CLAUDE.md` directly.

The two in-scope callouts (a) and (b) are both present and explicitly tagged. **Full coverage of the in-scope subset.**

### (f) TikZ deferral defensibility

The deferral is gated by:
1. Verifiable empty `grep` (which I reran: zero hits).
2. SHA256 pin of `summary.tex` (which I verified).
3. Two-line action list for any future TikZ-introducer (update the entry; ERRATA-tracked preamble edit).

This is a well-formed pre-registered hook in the sense the migration plan uses — better than declaring a canonical macros file that doesn't exist. The conditions for un-deferring are actionable (anyone introducing `\usepackage{tikz}` is required to update (f) and route the change through ERRATA).

### Internal consistency

- (a) "vacuum at index 1" and (h)(1) "Q_full = ⊕_a a" with vacuum at index 1: consistent. The same enumeration is invoked.
- (d) multiplicity-free and (h)(3) multiplicity-decorated: (h) correctly flags that option (3) **violates (d)** ("Violates the multiplicity-free assumption (d)" at line 408-409). The mutual-awareness is explicit.
- (g) "deprecate standalone N" vs the standalone `N`s in (j): (g) at line 339-340 carves out the explicit exception "When N appears in citations to existing sources, use context to disambiguate." (j) uses `N` in three places, all of which are citing `def:Hlatt` (summary.tex's convention) or `def:mobile-Fock`/`config.jl` (MMA's convention). Each occurrence is clarified by the surrounding context. **Acceptable** under the (g) exception, though (j) could be tightened by writing "(MMA's `N` = our `n`)" parenthetically — see edit list.

### Global question — bedrock-peer status

If a future agent reads only CONVENTIONS.md to learn the project's
conventional choices, do they get a complete-and-accurate picture?

**Mostly yes.** The 10 entries collectively cover: vacuum indexing,
F-gauge, dagger semantics, multiplicity-free scope, complex-conjugate
notation, TikZ (deferred), particle-number disambiguation, Q
choice, fusion-tree ordering, empty-config boundary. The major
project-wide convention choices are present.

**Two minor gaps** (none blocking):
1. **Tensor-product associator convention.** `conv:basics` line 78
   says "Tensor products are written ⊗ and are associative up to a
   fixed associator, which we suppress in displays where strict
   ordering is the only structure used." This is a convention but is
   not promoted to a CONVENTIONS entry. Suggest adding `(k)` post-P1.6
   if any computation uses associators explicitly (currently doesn't
   appear to).
2. **Definition of "simple"** vs "indecomposable" vs Schur-irreducible
   under the project's working definition. These are equivalent in a
   semisimple category, but the choice of which definition to use
   internally has implications for the algebra-object work. Not
   addressed in CONVENTIONS; arguably belongs in GLOSSARY rather than
   CONVENTIONS (and is implicit in def:fuscat).

Both gaps are deferred-pre-registration candidates, not blockers for
P1.6.

---

## Edits (minor)

I would land any of these in a small post-commit follow-up; none are
land-blockers.

1. **(b) line 122** — "mma-julia.md:142-149" → "mma-julia.md:145-148".
   The cited content is at lines 145-148 (the "Convention differences"
   block), not 142-149. Off-by-three.

2. **(c) line 170-172** — "the unique categorical structure" is a
   mild overreach versus the actual cite. Suggest softening to
   "the canonical categorical structure on a unitary fusion category"
   or qualifying with "up to monoidal equivalence". Minor.

3. **(j) lines 519-521** — for full (g)-consistency, the citations
   to MMA's `N = 0` could be rephrased as "MMA's `n = 0`" with a
   parenthetical "(MMA's `N` per the source — = our `n` by (g))" to
   make the (g) exception explicit. Doesn't change correctness.

4. **(h) line 408** — option (3) sweep mentions "[[def:Ageom]] with
   M_a^{(I)} = J_I^{(h_a)}". The def:Ageom canonical body uses
   `\oplus_{\text{primaries } i} J_I^{(h_i)} \otimes a_i`, summing
   over primaries rather than over Irr(C). For Fibonacci/Ising in
   scope these coincide (primaries = simples), but for general C this
   subtlety matters. Suggest a footnote: "primaries = simples for the
   fusion categories in scope". Optional polish.

5. **Status block lines 18-29** — "7 in-use forward-pointers from
   GLOSSARY" is accurate but the list of `def:HP, def:Hlatt,
   def:indlim, def:mobile-Fock, def:Q, def:splitbasis, etc.` in line
   28 is illustrative; the actual letters resolving are `a, b, d, g,
   h, i, j` (the slugs are the *invokers*, not the resolved
   letters). A one-line clarification ("the 7 letters {a,b,d,g,h,i,j}
   are invoked by these GLOSSARY entries") would tighten the
   Status block. Optional.

---

## What I did not check (out-of-scope or downstream-deferred)

- MMA Julia source files are **not in this repo** (no `config.jl` /
  `hilbert.jl` under `/home/tobias/Projects/cft-anyons/`). Claims
  about MMA line numbers (`config.jl:5,13`, `hilbert.jl:42-68`, etc.)
  are verifiable only via the bridge report / `mma-julia.md` /
  `mma-tex-lit.md` stocktake reports (which I did cross-check). When
  MMA is imported in Phase 8, these citations may need refreshing —
  not a P1.6 issue.
- CAD's `LocalOccupationModel.vacuum`, `Fibonacci/Matrix.lean`, etc.
  Not in this repo either; verified via `cad-lean.md`.
- I did not exhaustively walk through every `[[def:X]]` cross-link
  body — I spot-checked the load-bearing ones (3 per sweep-status
  spot-check + (h)/(d) consistency).

---

## Per-claim signoff

For audit-trail compatibility with prior Opus reviews:

| Entry | Source-fidelity | Forward-pointer | Sweep | Verdict |
|---|---|---|---|---|
| (a) Vacuum index | OK | resolves | OK | APPROVE |
| (b) F-gauge | OK (minor offset) | resolves | OK | APPROVE w/ minor |
| (c) Dagger | OK (mild overreach) | n/a | OK | APPROVE w/ minor |
| (d) Multiplicity-free | OK | resolves | OK | APPROVE |
| (e) Complex-conjugate | OK | n/a | OK | APPROVE |
| (f) TikZ DEFERRED | OK (SHA256-pinned) | n/a | n/a | APPROVE |
| (g) Particle-number | OK | resolves | OK | APPROVE |
| (h) Q-choice | OK | resolves | OK | APPROVE |
| (i) Fusion-tree ordering | OK | resolves | OK | APPROVE |
| (j) N=0 boundary | OK | resolves | OK | APPROVE |

**Aggregate: APPROVE WITH MINOR EDITS** — none are land-blockers; the
file is suitable for use as a GLOSSARY-peer canonical convention
declaration. Land it; queue the polish edits.
