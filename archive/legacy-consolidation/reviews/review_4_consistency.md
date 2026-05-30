# Consistency review of `summary.tex` against `chat1.md` – `chat4.md`

## Executive summary

The summary is largely faithful to the source chats for arithmetic-level claims (Fibonacci F-matrix entries, PF amplitudes, coassociative amplitudes, Ising/TL → TFI reduction, algebra-derived Δ = m†/√λ). However, the document is **internally inconsistent in two places**: Theorem 4.10 ("Solution branches") calls branch (a) a "solution branch" of the joint system while admitting in the same statement that branch (a) does *not* satisfy the second equation of the system; and Remark 4.11 is labelled `rem:three-sq-zero` and is cited as distinguishing "three distinct objects" while actually distinguishing only two. There are at least two clearly fabricated examples in §15 ("143/45 for 14/5"; "27 for 2/7") — neither string appears anywhere in the chats. The summary also omits chat 3's central distinction between the L²-half-density refinement weight √(ℓ(J)/ℓ(I)) and the CFT-primary refinement weight (ℓ(J)/ℓ(I))^{1−h}, glossing over the Gram-form discussion. Cross-references are mostly correct; one term ("Frobenius") is added gratuitously, several attributions to "Chat 2" vs "Chat 4" are misleading because chat 2 already contains the so-called "chat 4 derivation". Bibliography is absent (only flagged inline). The Koo–Saleur explicit formulas, e_∞, finite-size correction, and OAR/TL energy density discussion from chat 1 §10 are all dropped without comment.

---

## CRITICAL findings

### C1. Theorem `thm:branches` is internally self-contradictory
*Location: `summary.tex` lines 597–616.*

**Summary says:** "the joint system (A) `b² = φ⁻³/²·a`, (S) `1+|a|² = 2+|b|²` admits exactly two real solution branches. (a) Degenerate (`a = b = 0`). Associativity (A) is satisfied trivially. *However, dagger-specialness (S) fails*: the 1-block scalar of mm† is 1, while the p-block scalar is 2, and 1 ≠ 2. So no single λ exists: the trivial multiplication is associative but not dagger-special."

**Discrepancy:** A "solution branch of the joint system (A)+(S)" must satisfy both equations. The summary explicitly notes (S) fails on branch (a). So branch (a) is **not** a solution branch. The theorem statement is wrong: there is exactly **one** real solution branch of the joint system (namely (b)), and there is one additional solution of (A) alone (namely a = b = 0).

**Source-chat status:** Chat 3 line 310 correctly says "the general associative solution is either the degenerate square-zero solution `a = b = 0` *or* a nonzero family satisfying `b² = φ⁻³/²·a`" — i.e. chat 3 frames a = b = 0 as a solution of associativity alone (it does not say it satisfies dagger-specialness). The summary distorts this by lumping it into the "joint system" and then noting the contradiction without retracting the framing.

**Suggested correction:** Restate the theorem as "The associativity equation (A) has two real branches: degenerate `a = b = 0` and a one-parameter family `b² = φ⁻³/²·a`. Imposing additionally (S), the degenerate branch is excluded (S fails on it), and the family collapses to the unique positive solution `a = √φ, b = φ⁻¹/²`." Then call the degenerate "square-zero" choice a *non-solution* of the dagger-special system that is nonetheless meaningful as an associative-only algebra.

**Severity: CRITICAL** — this is the central technical theorem of the entire new §4, and as written it is logically self-contradictory.

---

### C2. Summary fabricates OCR examples not present in any chat
*Location: `summary.tex` lines 1857–1858 (Subsection "Likely transcription artifacts").*

**Summary says:** "The source transcripts contain mangled fractions (e.g. `c=12` or `c=21` for `c=1/2`; `143/45` for `14/5`; `27` for `2/7`). These have been silently corrected here."

**Discrepancy:**
- `grep -c "143" chat1.md chat2.md chat3.md chat4.md` → 0 hits. `143/45` appears nowhere in the chats.
- `grep -c "2/7" chat1.md chat2.md chat3.md chat4.md` → 0 hits. `2/7` appears nowhere either; the only "27" instances in the chats are `Thought for 2m 27s` and `Thought for 3m 27s`.
- The actual OCR-mangled form of "14/5" in chat 3 is `c=145` (line 813), not `143/45`. The summary mislabels the actual mangling.

So the summary invents at least two specific "examples" of OCR mangling that do not occur. The `c=12`/`c=21` example *is* genuine.

**Suggested correction:** Either remove the fabricated examples, or replace with real ones from the source: e.g. `c=145` for `c=14/5` (chat 3 line 813); `hσ=116` for `h_σ = 1/16` (chat 1 line 158, chat 2 line 336); `mττ1=ϕ` (which OCRs sqrt(φ) as φ, chat 4 line 1609) — these are the actual artifacts.

**Severity: CRITICAL** — this is a misrepresentation/hallucination presented in a section ("Likely transcription artifacts") whose entire purpose is the catalogue of artifacts.

---

## MAJOR findings

### M1. Chat 3's CFT-Gram-form refinement weight is omitted
*Source: `chat3.md` lines 503–564.*

**Chat says:** "For a chiral primary of weight h = 2/5, define a smeared field τ̃_I = ∫_I τ(z)dz. Its norm scales like ‖τ̃_I‖ ∼ |I|^{1−h} = |I|^{3/5}. So define the normalized cell field τ_I = |I|^{−3/5} τ̃_I. … The conformal one-τ geometry coefficient is `a_{J|I}^conf = (|J|/|I|)^{3/5}`. … *Important: this is not an isometry for the diagonal orthonormal cell basis*. For an equal binary split, 2|a|² = 2·2⁻⁶/⁵ = 2⁻¹/⁵ ≠ 1. Therefore the conformal refinement is an isometry only with respect to the CFT Gram form, not the naive diagonal L² form. The right equation is `E†_{P→P'} G_{P'} E_{P→P'} = G_P`, where G_P is the CFT two-point Gram matrix."

**Summary says:** Only the algebra-derived refinement (with √(ℓ(J)/ℓ(I)) dilute limit) and the length-weighted square-zero refinement (with the same √-weight). The CFT-Gram-form distinction is entirely absent. The string "Gram" in summary refers only to the Gram obstruction in the non-tree chat 1 setting (Lemma 9.2), not to chat 3's CFT Gram form.

**Discrepancy:** Chat 3 makes a sharp conceptual point — that "square-root length weights give ordinary particle kinematics; CFT primary weights require a different Gram form" — which is exactly the kind of subtlety the summary's stated mission is to capture. It is missing.

**Suggested correction:** Add a subsection or warning explicitly stating chat 3's distinction: the L²-half-density refinement gives ordinary particle kinematics (recovers L²(X)); the CFT-primary-of-weight-h refinement uses weight (ℓ(J)/ℓ(I))^{1−h} and is isometric only with respect to the CFT Gram matrix G_P, not the cell-orthonormal basis.

**Severity: MAJOR** — the summary's chapter on "Geometry, descendants, and the 1D-vs-2D distinction" omits the CFT-Gram-form half of chat 3's main conclusion.

---

### M2. Summary mis-attributes the PF/coassoc choice between chats
*Location: `summary.tex` lines 1122–1132 (Warning `warn:PF-coassoc`).*

**Summary says:** "Chat~2 selects one [PF] for the 'natural quantum-dimension splitting'; Chat~4 derives the coassociative one from a different principle (the Frobenius algebra Δ = φ⁻¹ m†)."

**Chat says:**
- Chat 2 derives **both** PF (§3, lines 553–607) and coassociative (§4, lines 612–698) and explicitly contrasts them on lines 700–704: "PF map: natural one-step topological/Kirby-color refinement. Coassociative map: natural if binary refinements must compose exactly."
- Chat 3 lines 327–342 derives the coassociative one explicitly as the dagger-special algebra Δ = φ⁻¹ m†. This is **chat 3**, not chat 4.
- Chat 4 §5 (lines 1588 onward) re-derives the algebra construction (in slightly different language) but the original algebra derivation is chat 3.

**Suggested correction:** "Chat 2 derives both choices side-by-side and contrasts them; chat 3 §1 first derives the coassociative one via a dagger-special algebra; chat 4 generalises the algebra approach to arbitrary partitions with Z-weights." Currently the summary's reader would think chats 2 and 4 are in disagreement, whereas they actually agree, and chat 3 (which originated the algebra derivation) is overlooked.

**Severity: MAJOR** — this misrepresents both the genealogy and the agreement structure of the chats.

---

### M3. Summary's "two distinct constructions" remark vs critique's "three distinct objects" claim
*Location: `summary.tex` line 686 (label `rem:three-sq-zero`), line 1821 (cross-reference).*

**Summary line 686:** Remark titled "Two distinct constructions both called 'square-zero'" with explicit enumeration of two items (the degenerate algebra structure, and the kinematic Fock construction).

**Summary line 1821:** "Remark~\ref{rem:three-sq-zero} distinguishes the **three distinct objects all called 'square-zero'**."

**Discrepancy:** The remark labelled `rem:three-sq-zero` enumerates two objects, not three. Either the title and label were originally meant to enumerate three things (and one got dropped during editing), or the cross-reference is wrong.

**Suggested correction:** Either expand the remark to genuinely enumerate three constructions (e.g. add "(3) Square-zero as the cumulative interpretation `p · p = 0` arising in chat 4 §6, where Bᵢ(two p's in I) = 0 is the blocking-channel meaning, distinct from the algebra and from the kinematic Fock model"), or change line 1821 to "distinguishes the two distinct objects".

**Severity: MAJOR** — the inconsistency between definition (two) and citation (three) is a literal contradiction within the document.

---

### M4. The chat 1 Koo–Saleur details and TL ground-state energy formulas are silently dropped
*Source: `chat1.md` §10, lines 737–846.*

**Chat says:** Concrete formulas for the Ising TL chain:
- κ = γ/(π sin γ) = 1/(2√2) for Ising;
- e_∞ = ½√2 (1 + 2/π);
- E_0(N)/N → −e_∞;
- E_0(N) = −N e_∞ − π v c/(6N) + o(N⁻¹), with v = π sin γ/γ = π√2/4, c = 1/2;
- Explicit Koo–Saleur lattice generators: L_n^(N) = (N/4π)[ −κ Σ_j exp(2πinj/N) (e_j − e_∞ + iκ[e_j, e_{j+1}]) ] + (c/24) δ_{n,0};
- First nontrivial central-charge check ⟨Ω, [L_2, L_{−2}] Ω⟩ = c/2 = 1/4.

**Summary says:** Nothing of this. Conjecture KS (`summary.tex` line 1941) only mentions "Koo–Saleur approximants built from e_j − e_∞ and [e_j, e_{j+1}] converge in the Ising scaling representation" — no formulas, no κ, no e_∞, no finite-size correction.

**Discrepancy:** The summary's stated brief includes "every acronym is expanded at first use; derivations are presented without skipped steps" — but a substantial half of chat 1 is dropped entirely without explanation, including the only place in the chats where the Koo–Saleur lattice generators are written down.

**Suggested correction:** Add a subsection in §7 (Ising/TL) containing the explicit κ value, e_∞, finite-size energy formula, and explicit L_n^(N) and L̄_n^(N) formulas. If the omission is intentional (because the program later abandons KS in favour of refinement-tensor methods), say so explicitly.

**Severity: MAJOR** — this is the substantial piece of chat 1 that is missing from the summary.

---

### M5. Chat 2's literal toy ε-block ascending-channel eigenvalues are absent
*Source: `chat2.md` §1, lines 226–301.*

**Chat says:** For the Ising/TL₂ toy ε-block refinement η_ε(ρ) with three fine channels (e_L, e_R, s), the literal channel eigenvalues are explicitly computed to be `{1, 0, 0, 0, 0, 0, 0, 0, 0}` (one eigenvalue 1, eight kernel zeros), and chat 2 stresses that these "are not the Ising CFT scaling eigenvalues. They only say that the isometry preserves the embedded code subspace and discards orthogonal fine-block data."

**Summary says:** Warning `warn:charge-only` (`summary.tex` lines 1615–1624) gives the *Fibonacci* one-site charge-only channel computation (eigenvalues `{1, X−P}`), but not the Ising/TL₂ ε-block analog.

**Discrepancy:** The Ising/TL₂ calculation is a more direct test of CFT recovery (because the OPE coefficient C_σσε = 1/2 enters explicitly), and it makes the same point as the Fibonacci charge-only warning but for the worked example most discussed in chat 1. Either include both for symmetry, or note the omission.

**Severity: MAJOR** — the only Ising/TL CFT-RG-check calculation in chat 2 is dropped.

---

## MINOR findings

### m1. "Frobenius" is summary's own term, not the chats'
*Location: `summary.tex` lines 387–391 (Remark), line 1128 (warn:PF-coassoc).*

The summary repeatedly invokes "Frobenius-special algebra" and "the Frobenius algebra Δ = φ⁻¹ m†" — but the word "Frobenius" appears in the chats only in the phrase "Perron–Frobenius". Chat 3 uses "dagger-special", chat 4 uses "special" without "Frobenius". The technical claim ("Fibonacci algebra is Frobenius-special / FRS-algebra-sibling") is plausible but is the summary's own insertion, not propagation. It should be either flagged \unchecked or attributed properly.

**Severity: MINOR**.

---

### m2. Garbled equation in the algebra-object remark
*Location: `summary.tex` lines 383–386.*

The remark says: "It makes the rescaled adjoint Δ := λ^{−1/2} m† into an isometric comultiplication: `Δ†Δ = λ⁻¹ m m† · λ^{−1/2·2}…` — see Proposition~\ref{prop:Delta-isom} for the clean statement."

The expression `λ⁻¹ m m† · λ^{−1/2·2}` is mathematically incoherent: the `λ^{−1/2·2}` is at best redundant (since the `λ⁻¹` factor is already there from `λ⁻¹ m m†`) and the dots after it are dangling. This is a clear unfinished/sloppy edit. The clean proof in Proposition 4.3 makes the omission obvious.

**Severity: MINOR**.

---

### m3. Bibliography section is missing
*Location: `summary.tex` line 1999–2014 ("Reference status").*

The summary has *no* explicit bibliography. References are flagged inline with `\unchecked` only. The prompt mentions "Does the bibliography list (Koo–Saleur, Osborne–Stottmeister, FRS, etc.) include all external references actually used in the chats?" — but there is no bibliography to compare against. The "Reference status" section lists six attributed authors/papers (Koo–Saleur, Osborne–Stottmeister, FRS, Pasquier, Huse, MERA literature) and four explicit Stage-2 questions. The set is consistent with what the chats actually cite. But no formal citations exist.

**Severity: MINOR** — this is a stylistic/format issue but reasonable to flag for a Stage-2 plan.

---

### m4. Convention `conv:1op` says `p` simple but no chat actually requires `p ≠ τ`
*Location: `summary.tex` lines 455–461.*

The summary uses a "generic simple `p`" notation for §4.3 (algebra constraints for A = 1 ⊕ p), then specialises to p = τ. This is presented as a generalisation, but is in fact entirely scenario-bound to the case p ⊗ p ≅ 1 ⊕ p (which is the Fibonacci-type rule). No chat works with a generic `p` distinct from τ in this way. Minor; the generalisation is harmless.

**Severity: MINOR/NITPICK**.

---

### m5. Summary's algebra-object section uses a different basis convention from chat 3 in one place
*Location: `summary.tex` lines 488–495 (Proposition `prop:assoc-F`).*

Summary writes the associativity constraint as `F · (a, b²)ᵀ = (a, b²)ᵀ`. Chat 3 line 303 writes it as `(a, b²)ᵀ = F · (a, b²)ᵀ`. These are the same equation, of course (F is an involution by the F-involution lemma, so F·v = v ⟺ v = F·v). But the summary's "(a, b²)" notation in `\begin{pmatrix}` form leaves slightly ambiguous which row is which: is the first entry `a` (corresponding to the 1-channel) or `b²` (τ-channel)? Chat 3 follows the convention that the first entry corresponds to the intermediate-1 channel `e_1` and the second to `e_τ`; the algebra derivation in chat 3 explicitly identifies the second row of F with the τ-channel. Summary's proof on line 533–540 uses the second row first and the first row second, which gives the same answer but is a notational reversal worth checking.

**Severity: MINOR/NITPICK** — the algebra is right, the notational order shifts.

---

### m6. Summary's `def:fib-mult` puts the algebra components a, b directly in m, not in m^†
*Location: `summary.tex` lines 1143–1158.*

Summary defines m on τ⊗τ with `m¹_{ττ} = √φ`, `m^τ_{ττ} = φ⁻¹/²`. Chat 3 line 339–340 says "the exact Fibonacci algebra multiplication is `τ · τ = √φ 1 + φ⁻¹/² τ`". Chat 4 line 1609 says `m^1_{ττ} = √φ, m^τ_{ττ} = φ⁻¹/²`. Match.

The summary further claims (Corollary `cor:Delta-coassoc`) that Δ = φ⁻¹ m† gives `Δ(τ) = φ⁻¹ τ⊗1 + φ⁻¹ 1⊗τ + φ⁻³/² v^τ_{ττ}`. Check: (Δ(τ))_{ττ channel} = φ⁻¹ · b = φ⁻¹ · φ⁻¹/² = φ⁻³/². ✓.

Match — but only after working out: the prose of `cor:Delta-coassoc` is correct.

**Severity: NITPICK** (no actual issue, just verification).

---

### m7. Summary does not include chat 4's three-child explicit example
*Source: `chat4.md` lines 1791–1862 (3-child Fibonacci computation).*

Chat 4 walks through a full three-cell I = A ∪ B ∪ C computation with cell amplitudes (z_A, z_B, z_C, u_A, u_B, u_C) and explicit equality of the two groupings A|(BC) and (AB)|C using `F · (√φ, φ⁻¹) = (√φ, φ⁻¹)`. The summary mentions this implicitly via Proposition `prop:rchild` (coherence under regrouping) but does not reproduce the explicit three-child amplitude formulas. These would be a good illustrative worked example to include.

**Severity: NITPICK**.

---

### m8. Mangled OCR fraction `hσ=116` for `h_σ = 1/16` is silently un-flagged
*Source: `chat1.md` line 158, `chat2.md` line 336.*

The chats consistently render `h_σ = 1/16` as `hσ=116`. The summary uses the correct `h_σ = 1/16` (`summary.tex` line 1499) without commenting that this involved OCR de-mangling. This is a legitimate de-mangling that the summary lists as among the artifacts in §15 (in the "(e.g. c=12)" group), but the specific `116` → `1/16` case isn't mentioned as one of the examples even though it's a real, present-in-source artifact (unlike the fabricated `143/45`).

**Severity: NITPICK**.

---

### m9. Summary claims "every acronym expanded at first use" but does not consistently flag definitions
*Location: `summary.tex` line 56 (intro), §2.2 acronym list.*

Summary's intro says "every acronym is expanded at first use". The Convention 2.2 list expands all acronyms in one place. But e.g. "OAR" appears in chat 1 line 846 ("free-fermion/OAR result") — not expanded in chat 1 and the summary simply omits it. (It is the only occurrence of "OAR".)

**Severity: NITPICK**.

---

## CONFLICTS BETWEEN CHATS (and how summary handles them)

### B1. Chat 1 vs Chat 2 vs Chat 3 vs Chat 4 on the meaning of the unit `1 ⊂ Q`

- Chat 1 (line 1110): "The vacuum object 1 is the empty site."
- Chat 2: Same. "Empty sites are encoded by the tensor unit" (lines 142–148).
- Chat 3: Initially same; then chat 3 §1 derives the algebra structure on Q = 1 ⊕ τ where 1 is the algebra unit.
- Chat 4 §4 (lines 1523–1587): Decisively retracts the "1 = empty" reading: "If 1 is forced to mean 'empty and nothing else,' then coherent τ → ττ splitting fails." Says 1 must mean "total vacuum charge sector" allowing unresolved ττ pairs.

**Summary handling:** Warning `warn:vac` (lines 1231–1254) correctly captures this. The "Genuine reformulations" critique section (line 1823–1830) explicitly states "Empty-site vs vacuum-charge meaning of `1 ⊂ Q`. Chats 1–3 (mostly) treat 1 as 'empty'. Chat 4 §4 derives a strict no-go." 

**However**: the summary does **not** explicitly track that chat 3 already started using 1 as the algebra unit (i.e. the algebra had to be `A = 1 ⊕ τ` where 1 is the algebra unit), which is closer to chat 4's "total vacuum charge sector" reading than to chats 1–2's "empty site". Chat 3 §1 (line 280) treats `m(1 ⊗ 1) = 1` as the algebra unit axiom, which is compatible with chat 4's reading. So chat 3 is closer to chat 4 than chats 1–2.

**Severity: MINOR** — the summary's "Chats 1–3 (mostly)" is fair, with "mostly" doing some work.

---

### B2. Chat 2 vs Chat 3 vs Chat 4 on which CFT to use for Fibonacci

- Chat 2 line 457: G_{2,1} chiral CFT, h_τ = 2/5; mentions tricritical Ising as alternative for golden chain (c = 7/10).
- Chat 3 line 813: hτ=2/5, c=14/5 OR appropriate chiral realisation.
- Chat 4: never specifies which CFT; uses h_τ = 2/5 (line 510).

**Summary handling:** Warning `warn:fibCFTs` (lines 1506–1520) addresses this properly. The summary's "calculations in this document use the chiral (G_2)_1 convention" decision is explicit. Good handling.

---

### B3. Chat 1 vs Chat 2 vs Chat 4 on the kind of refinement map

- Chat 1: Tree map w: Q → Q⊗Q, possibly with disentanglers u (MERA). User then asks for "interpolation" → §3 develops non-tree interpolation kernel J_N with persistence and pair-creation, plus Gram repair.
- Chat 2: Strict binary w: Q → Q ⊗ Q, with PF or coassociative choice; ascending channel computations.
- Chat 4: Arbitrary-partition r-child refinement E_{I → (J_1, …, J_r)} via Z-weights and algebra components.

**Summary handling:** The Critique section line 1831–1838 explicitly captures these as "different valid frameworks". `prop:rchild` is the chat 4 generalisation. Chat 1's non-tree kernel J_N appears in §9 (`sec:non-tree`). Reasonable handling.

---

### B4. Chat 3 (later) vs Chat 3 (early) on preholomorphicity

- Chat 3 §7 first proposes the spin-2/5 preholomorphic equation `Σ_e |e| e^{-2iθ_e/5} ψ_e = 0` for the Fibonacci τ field on a 2D mesh.
- User then complains about the 1D Hilbert space / 2D grid conflation.
- Chat 3 then retracts: "preholomorphicity is not the primary equation for the 1D Hilbert space."

**Summary handling:** Warning `warn:preholo` line 1784 captures this correctly with "Program A" (1D Hilbert) vs "Program B" (2D Euclidean cobordism). Good.

---

## What the summary omits but should arguably include

1. **Chat 1 explicit Koo–Saleur generators and e_∞ formula** (see M4).
2. **Chat 2 toy ε-block ascending channel calculation** (see M5).
3. **Chat 3 CFT-Gram-form discussion** (see M1).
4. **Chat 1 multipoint formulas: A_m-series central charges c_m = 1 − 6/(m(m+1))**, Kac-table identification, and the κ = γ/(π sin γ) formula for KS at the m-th unitary minimal model. None of this generality appears in the summary.
5. **Chat 1 explicit fusion path dimensions**: dim ⊕_c Hom(c, σ^{⊗N}) = 2^{N/2} on the dense Ising chain.
6. **Chat 1 lossy blocking phrasing for the dense σ-chain**: chat 1 §10 (line 1431ff) explains why dense TL needs *blocked* refinement (because σ → σ⊗σ is not allowed in Ising fusion). This is a chat 1 insight not echoed in summary, though the summary's algebra-object framework gives a different ground for the same conclusion.
7. **Chat 4 explicit three-child Fibonacci computation** (see m7).
8. **Chat 1 explicit Fibonacci numbers for fusion-space dimensions on the dense τ-chain**: dim Hom(1, τ^{⊗k}) = F_{k−1}, dim Hom(τ, τ^{⊗k}) = F_k (chat 4 line 1473–1483, similar). The summary mentions Fibonacci arithmetic but not these dimension counts.
9. **Chat 1 §13 general A_m TL family construction** (m = 4 gives tricritical Ising c = 7/10, etc.). Summary mentions tricritical Ising only as an alternative CFT for Fibonacci anyons.
10. **The non-trivial check `⟨Ω, [L_2, L_{−2}] Ω⟩ = 1/4`** as a Virasoro central-charge consistency test (chat 1 line 842).

These omissions are not contradictions, but they substantially reduce the substantive content carried over from the chats.

---

## Verified arithmetic-level matches between summary and chats

These all check out:

- Fibonacci F-matrix entries `((φ⁻¹, φ⁻¹/²), (φ⁻¹/², −φ⁻¹))` (chat 1 line 1689, chat 2 line 492, chat 3 line 260, chat 4 line 1503 ↔ `summary.tex` def `def:fib-F`). ✓
- Fibonacci PF amplitudes y_PF = φ/D, r_PF = √φ/D (chat 2 line 562–580 ↔ summary `def:PF`). ✓
- Fibonacci coassociative amplitudes x = φ⁻¹, y = φ⁻¹/², p = q = φ⁻¹, r = φ⁻³/² (chat 2 line 670–678, chat 3 line 421 ↔ summary `thm:coassoc`). ✓
- Fibonacci algebra amplitudes a = √φ, b = φ⁻¹/², λ = φ² (chat 3 line 327, chat 4 line 1609 ↔ summary `thm:branches`(b)). ✓
- Fibonacci convolutional identities for Z_1, Z_τ (chat 4 lines 1687–1692 ↔ summary `eq:Z1conv`, `eq:Ztconv`). ✓
- Fibonacci Z-formulas Z_1(L) = φ⁻²e^{ρφL} + φ⁻¹e^{−ρL}, Z_τ(L) = φ⁻²(e^{ρφL} − e^{−ρL}) (chat 4 line 1695, 1697 ↔ summary `eq:Zexp`). ✓ Manually verified that these satisfy the convolutions using 2φ⁻² + φ⁻³ = 1.
- Wilsonian blocking coefficients β¹_{11} = u_0, β¹_{ττ} = u_I ρ⁻⁴/⁵, etc. (chat 2 line 776–783, chat 3 line 461–468 ↔ summary `lem:fib-beta`). ✓
- Fibonacci-(G_2)_1 RG-decorated splitting (chat 2 line 824–836, chat 3 line 481–488 ↔ summary `ex:fib-RG`). ✓
- Ising F-symbol F^σσσ_σ = (1/√2) ((1,1),(1,−1)) (chat 1 line 203, 391, 617 ↔ summary `def:ising-F`). ✓
- Ising TL → critical TFI reduction (chat 1 lines 482–502 ↔ summary `thm:TFI`). ✓
- Square-zero L²(X) continuum limit (chat 4 lines 730–820 ↔ summary `thm:L2`). ✓
- Chat 1 pair-insertion coefficients A_{1,τ} = 1, A_{τ,1} = φ⁻¹, A_{τ,τ} = φ⁻¹/² (chat 1 line 1659–1664 ↔ summary `def:pair-create`). ✓
- Polar decomposition section formula E = B†(BB†)⁻¹/² (chat 2 §6.1 ↔ summary `thm:polar`). ✓
- Gram obstruction `⟨(ττ)_1 τ | τ (ττ)_1⟩ = φ⁻¹` (chat 1 line 1828 ↔ summary `lem:Gram`). ✓
- Sidelobe |a|² = |λ|²/(φ + 2|λ|²), |b|² = φ/(φ + 2|λ|²) (chat 1 line 1913–1916 ↔ summary `def:sidelobe`). ✓
- d_σ = √2 from σ⊗σ = 1 ⊕ ψ (chat 1 line 194, chat 2 line 1198 etc. ↔ summary `def:ising`). ✓
- F^σσσ_σ involutive, real, symmetric (chat 1 line 622 ↔ summary `lem:F-invol`). ✓
- 2φ⁻² + φ⁻³ = 1 (chat 3 line 372, chat 4 line 1656 ↔ summary `lem:fib-arith`). ✓
- Chat 4 sidelobe condition / Gram condition with `J_N` non-tree map (chat 1 line 1828, summary `lem:Gram`). ✓

---

## Summary of severity counts

| Severity | Count | Items |
|---|---|---|
| CRITICAL | 2 | C1 (thm:branches self-contradiction), C2 (fabricated OCR examples) |
| MAJOR | 5 | M1 (CFT Gram form), M2 (PF/coassoc attribution), M3 (rem:three-sq-zero), M4 (Koo–Saleur details), M5 (chat 2 ε-block) |
| MINOR | 5 | m1–m5 |
| NITPICK | 4 | m6–m9 |

The summary is technically careful on arithmetic and largely faithful on framework structure. The principal issues are (a) the central theorem of the new algebra-object section is mis-stated as a "joint system" theorem when only one branch is actually a joint solution; (b) the "Likely transcription artifacts" section invents specific artifacts that are not in the chats; (c) a substantial amount of content from chat 1 (Koo–Saleur, ground-state energy formulas) and chat 3 (CFT Gram form) is dropped without comment.
