# Algebra & Derivation Review of `summary.tex`

Hostile, independent verification of every algebraic step.
All checks are computed from scratch in this document.

---

## Issue 1 — **CRITICAL** — Lemma 7.7 (`lem:binary-Z`) displays squared amplitudes, not amplitudes.

### What the summary claims

`/home/tobias/Projects/cft-anyons/summary.tex` lines 1318–1331 (Lemma 7.7
"Binary refinement, $I=J\cup K$") asserts:
```
E_{I→(J,K)}(1) = [Z_1(x)Z_1(y)/Z_1(L)] · 1_J⊗1_K + [φ·Z_τ(x)Z_τ(y)/Z_1(L)] · v^1_{ττ}
E_{I→(J,K)}(τ) = [Z_τ(x)Z_1(y)/Z_τ(L)] · τ_J⊗1_K + [Z_1(x)Z_τ(y)/Z_τ(L)] · 1_J⊗τ_K
                + [φ^{-1}·Z_τ(x)Z_τ(y)/Z_τ(L)] · v^τ_{ττ}
```
and the prose immediately after the lemma asserts the dilute-limit one-particle
amplitudes reduce to `√(ℓ(J)/ℓ(I))`.

### Why this is wrong

The displayed coefficients are the **squared amplitudes** (probabilities); the
amplitudes themselves should carry a square root over the entire fraction and
the multiplicative constants `φ` and `φ^{-1}` should be `√φ` and `φ^{-1/2}`
respectively.

### Independent calculation

Apply Definition 7.6 (`def:rchild`) for `r = 2`, `c = 1`:
```
E_{I→(J,K)}(1) = (1/√Z_1(L)) Σ_{a,α} M^1_{a,α} √(Π Z_{a_i}(ℓ_i)) v^1_{a,α}
```
The Fibonacci `M`-coefficients (square roots of structure-constant moduli are
NOT taken; `M` is the multiplication coefficient itself):
* `a = (1,1)`: `M^1_{1,1} = 1`. Contribution: `(1/√Z_1(L)) · √(Z_1(x)Z_1(y))` on `1⊗1`.
* `a = (τ,τ)` in 1-channel: `M^1_{τ,τ} = √φ`. Contribution: `(1/√Z_1(L)) · √φ · √(Z_τ(x)Z_τ(y))` on `v^1_{ττ}`.

The norm-squared of this amplitude vector is
```
Z_1(x)Z_1(y)/Z_1(L) + φ·Z_τ(x)Z_τ(y)/Z_1(L)
  = [Z_1(x)Z_1(y) + φ Z_τ(x)Z_τ(y)] / Z_1(L)
  = Z_1(L) / Z_1(L) = 1   (using the convolutional identity, line 1263)
```
giving the correct isometry. The amplitudes are therefore
```
c_{11}  = √[ Z_1(x)Z_1(y) / Z_1(L) ]
c_{ττ}^1 = √[ φ·Z_τ(x)Z_τ(y) / Z_1(L) ]
```
which contain square roots — not what Lemma 7.7 displays.

Dilute limit (`Z_τ(ℓ)~ρℓ`, `Z_1(ℓ)~1`):
* Lemma 7.7's literal formula gives `Z_τ(x)Z_1(y)/Z_τ(L) ~ ρx/(ρL) = x/L`.
* The correct (square-rooted) formula gives `√(x/L) = √(ℓ(J)/ℓ(I))`, matching
  Definition 6.1 (`def:lenref`) and the prose after Lemma 7.7.

### Conclusion

Lemma 7.7 is **inconsistent with its own surrounding text** (with both
Definition 7.6 immediately above and with the dilute-limit prose immediately
below). It propagated unchanged from `chat4.md` lines 1765–1775, where the
same error exists. (Chat 4's "These coefficients are normalized because of the
convolution identities" is only true in the sense of *probabilities summing to
1*, not amplitudes.)

This is a real, propagated algebra bug.

---

## Issue 2 — **MAJOR** — Theorem 7.5 (`thm:coassoc`), Step 1 skips a derivation despite the document's promise.

### What the summary claims

`summary.tex` lines 1022–1028, in the proof of Theorem 7.5: "On any channel
with at least one `1` leg, the splitting basis vector is uniquely `1`-tensored
with the identity, so left- and right-grouping agree without invoking F. This
forces the boundary amplitudes to match, yielding `p = q = x`..."

### Why this is suspect

The argument is hand-wavy: it is not literally true that "left- and
right-grouping agree without invoking F" on these channels. The claim
`p = q = x` requires explicit coassociativity computations on the configurations
`τ → τ⊗1⊗1`, `τ → 1⊗1⊗τ`, and `τ → 1⊗τ⊗1`, not a "boundary amplitude" appeal.
The summary's abstract states "Derivations are presented without skipped
steps," but the C1 derivation is precisely such a skip.

### Independent calculation (filling the gap)

Coassociativity at `τ → τ⊗1⊗1`:

* `(η⊗id)η_τ`: contributions
  - From `p v^τ_{τ,1}` (η on first τ): `η(τ) = p τ1 + q 1τ + r v^τ_{ττ}`,
    only `p τ1` has first slot τ and middle slot 1, giving `p·p · τ11`. So
    coefficient is `p²`.
  - From `q v^τ_{1,τ}`: `η(1) ⊗ τ` has slot 3 = τ, not 1. No contribution.
  - From `r v^τ_{τ,τ}`: slot 3 = τ. No contribution.

  Coefficient on `τ11`: `p²`.

* `(id⊗η)η_τ`: contributions
  - From `p v^τ_{τ,1}`: `τ ⊗ η(1) = τ ⊗ (x 11 + y v^1_{ττ})`. The `x` piece
    gives `x τ11`. Coefficient `p·x`.
  - From `q v^τ_{1,τ}`: first slot 1, no contribution.
  - From `r v^τ_{τ,τ}`: `τ ⊗ η(τ)`. To get `τ11` need slots 2-3 = `11`. From
    `η(τ)` only `q 1τ` has slot 1 = 1, but slot 2 = τ. No.

  Coefficient on `τ11`: `p·x`.

  Coassociativity: `p² = px`, so `p = x` (assuming `p ≠ 0`). Similarly,
  considering `τ → 1⊗1⊗τ` forces `q = x`.

This works out correctly, but the actual derivation requires the explicit
configuration-by-configuration check above — not the unsupported "boundary
amplitudes" hand wave.

---

## Issue 3 — **MINOR** — The "remark" inside the proof of Step 2 (line 1056–1064) is garbled.

### What the summary writes

Line 1056–1064:
```
(The first row gives the same identity; rederive it:
xy = φ^{-1}xy + φ^{-1/2}r², so xy(1-φ^{-1}) = φ^{-1/2}r², i.e. xy·φ^{-2}·φ^1
= xy·φ^{-1} = φ^{-1/2}r². Using 1-φ^{-1} = φ^{-2}·φ^? — check directly:
1-φ^{-1} = (φ-1)·φ^{-1}·φ^1 - φ^{-1} — simpler: by Lemma fib-arith
φ^{-1}+φ^{-2}=1, hence 1-φ^{-1}=φ^{-2}. Thus xy·φ^{-2} = φ^{-1/2}r²,
so r² = xy·φ^{-3/2}. Same identity.)
```

### Why this is bad

The middle of this parenthetical is incoherent: "`xy·φ^{-2}·φ^1 = xy·φ^{-1}`"
contains an apparently incorrect chain (`xy·φ^{-1}` would be the RHS,
not the LHS, after pulling out the `1-φ^{-1}`), and `(φ-1)·φ^{-1}·φ^1 - φ^{-1}`
makes no sense as an attempted manipulation. The author abandons the
manipulation mid-stream and recovers via `φ^{-1}+φ^{-2}=1`. The final
result `r² = xy·φ^{-3/2}` is correct, but the displayed derivation is
broken and would not survive any careful proofreading.

### Verification of the correct fact

`xy(1 - φ^{-1}) = φ^{-1/2} r²`. Since `1 - φ^{-1} = φ^{-2}` (from
`φ^{-1} + φ^{-2} = 1`), get `xy φ^{-2} = φ^{-1/2} r²`, hence
`r² = φ^{-3/2} xy`. ✓

So the conclusion is right; the displayed scratch work is garbage that should
be cleaned up.

---

## Issue 4 — **MINOR** — Theorem 8.7 proof requires periodic boundary conditions to be valid; the index range is mis-stated for open BCs.

### What the summary claims

Theorem 8.7 (`thm:TFI`) at line 1444–1463 writes:
```
H = -Σ_{r=1}^M e_{2r-1} - Σ_{r=1}^M e_{2r}
```
on `N = 2M` TL sites under "periodic boundary conditions" (line 1412).

### Why this is borderline OK but worth noting

For open BCs, TL generators are `e_1, ..., e_{N-1} = e_{2M-1}`. There is no
`e_{2M}` for open BCs. The summary states periodic BCs, so `e_{2M}` is
defined (wraps around to use `h_0 = h_{2M}`), and `Z_M Z_{M+1}` is read with
`Z_{M+1} = Z_1`. With periodic BCs the count `M` even-indexed generators
balances the `M` odd-indexed generators, and the derivation is correct.

The text is consistent, but a reader who reads only Lemma 8.5–8.6 (which look
local and innocent) and then Theorem 8.7 might miss the necessity of periodic
BCs. The proof of Theorem 8.7 itself does not invoke the BCs explicitly.

---

## Issue 5 — **NITPICK** — Lemma 7.6 isometry "follows from convolutional identities by induction on r": not actually fleshed out.

### What the summary claims

Proposition 7.7 (`prop:rchild`) Part (i): isometry of `E_{I→(J_1,...,J_r)}`
"follows from (7.4)–(7.5) by induction on r".

### Comment

The base case `r=2` is direct from the convolutional identities. The inductive
step requires showing that the r-ary `|M^c_{a,α}|² Π Z_{a_i}` sum can be
rewritten using two successive applications of the binary identity. While
plausible (and morally correct because Fibonacci multiplication is associative),
the actual induction is not written down, and the gluing of `M^c` coefficients
across two refinement steps depends on the F-symbol behaving compatibly — a
nontrivial point that should be at least sketched. As stated, this is an
unproven assertion, not a derivation.

---

## Issue 6 — **MINOR** — Inner-product / coefficient sign conventions for `m^†`.

### What the summary claims

Proposition 5.5 (`prop:dagger-special-eq`) writes:
```
m^† 1 = 1·(1⊗1) + ā · v^1_{p,p}
m^† p = 1·(1⊗p) + 1·(p⊗1) + b̄ · v^p_{p,p}
```

### Verification

For the standard convention `⟨αx, y⟩ = ᾱ⟨x,y⟩`, if `m|_{p⊗p} = a·(v^1_{pp})† +
b·(v^p_{pp})†`, then for orthonormal `v^1_{pp}` we get
`⟨m^† 1, v^1_{pp}⟩ = ⟨1, m v^1_{pp}⟩ = ⟨1, a·1⟩ = a`. Writing
`m^† 1 = c·v^1_{pp} + (1⊗1 part)` gives `⟨c·v^1_{pp}, v^1_{pp}⟩ = c̄`, so
`c̄ = a`, i.e., `c = ā`. ✓

The displayed `ā` is correct, and `mm^† 1 = (1 + |a|²) 1` follows. VERIFIED;
the convention is self-consistent.

For real positive a, b (which the summary uses in Theorem 5.10), `ā = a` and
`b̄ = b`, so all calculations reduce to the real case without sign ambiguity.

---

## Issue 7 — **NOT A BUG, but stated misleadingly** — Corollary 5.7's "b=0 forces a=0" is symmetric: also "a=0 forces b=0".

### What the summary says

Corollary 5.7 (`cor:b-zero-forces-a-zero`) states: "The associativity equation
b² = φ^{-3/2}·a has the unique b=0 solution a = 0. There is no nonzero
'pure-1-channel' associative algebra structure on A = 1⊕τ."

### Verification

From `b² = φ^{-3/2} a`:
* If `b = 0`, then `0 = φ^{-3/2} a`, so `a = 0`. ✓
* If `a = 0`, then `b² = 0`, so `b = 0`. ✓

So actually setting *either* `a = 0` or `b = 0` (alone) forces the other to
be zero, and only the trivial `a = b = 0` is associative without the
non-degenerate parametrization. The summary's framing is correct but
asymmetric; both directions hold. Theorem 5.10 then correctly enumerates the
two branches.

### Specifically addressing the prompt's challenge

The user asks whether setting `a = 0` alone (keeping `b` free) gives a valid
associative solution. **No**: associativity then forces `b² = 0`, so `b = 0`
too.

VERIFIED — Theorem 5.10's branch enumeration is complete.

---

## Verification of items the user asked about (no bugs found)

The following claims I checked independently and found correct:

### Golden-ratio identities (Lemma 7.1)
* `φ⁻¹ = φ - 1` ✓ (from `φ² = φ + 1` divide by `φ`).
* `φ⁻² = 2 - φ` ✓ (squaring `φ - 1`).
* `φ⁻² + φ⁻¹ = (2-φ) + (φ-1) = 1` ✓.
* `2φ⁻² + φ⁻³`: with `φ⁻³ = φ⁻¹·φ⁻² = (φ-1)(2-φ) = 2φ - 3`,
  `2φ⁻² + φ⁻³ = 2(2-φ) + (2φ-3) = 4 - 2φ + 2φ - 3 = 1` ✓.

VERIFIED.

### Fibonacci F-matrix involution (Lemma 7.3)

`F = [[φ⁻¹, φ⁻¹ᐟ²], [φ⁻¹ᐟ², -φ⁻¹]]`. I recomputed all four entries of `F²`:
* `(F²)_{11} = φ⁻² + φ⁻¹ = 1` ✓
* `(F²)_{12} = φ⁻¹φ⁻¹ᐟ² + φ⁻¹ᐟ²(-φ⁻¹) = 0` ✓
* `(F²)_{21} = 0` ✓
* `(F²)_{22} = φ⁻¹ + φ⁻² = 1` ✓

The negative sign on `F_{22}` is *required* for involutivity. VERIFIED.

### Fibonacci multiplication (Definitions 7.10, Lemmas 7.11 & 7.12)
`m^1_{ττ} = √φ`, `m^τ_{ττ} = φ⁻¹ᐟ²`. Associativity verifies via F-fixed
point: `F (√φ, φ⁻¹)^T = (√φ, φ⁻¹)^T`. I rechecked both rows manually.

VERIFIED.

`mm^† = φ² id_A`:
* 1-block: `1 + (√φ)² = 1 + φ = φ²` ✓
* τ-block: `1 + 1 + (φ⁻¹ᐟ²)² = 2 + φ⁻¹ = φ + 1 = φ²` (using `φ = 1 + φ⁻¹`) ✓

VERIFIED.

### Δ = φ⁻¹m^† gives the correct splitting amplitudes
* `Δ(1) = φ⁻¹·1⊗1 + φ⁻¹·√φ·v^1_{ττ} = φ⁻¹·1⊗1 + φ⁻¹ᐟ²·v^1_{ττ}` ✓
* `Δ(τ) = φ⁻¹·1⊗τ + φ⁻¹·τ⊗1 + φ⁻¹·φ⁻¹ᐟ²·v^τ_{ττ} = φ⁻¹·1⊗τ + φ⁻¹·τ⊗1 + φ⁻³ᐟ²·v^τ_{ττ}` ✓
* Norms: `φ⁻² + φ⁻¹ = 1` ✓ and `2φ⁻² + φ⁻³ = 1` ✓.

VERIFIED.

### Associativity equation b² = φ⁻³ᐟ²·a (Proposition 5.4)

I redid this from scratch (computing left- and right-bracketing amplitudes for
`τ⊗τ⊗τ → τ`, both giving the vector `(a, b²)`). The F-fixed-point yields, from
the second row, `a·φ⁻¹ᐟ² = b²·(1 + φ⁻¹) = b²·φ`, hence `b² = φ⁻³ᐟ²·a`.

The user asked whether the equation might actually be `b² = φ⁻³ᐟ²·ab`. It is
**not**: the second amplitude in both bases is `b·b = b²`, not `a·b`, because
the τ-channel of the left pair contributes `b` and the subsequent τ-channel
fusion with the third leg also contributes `b`.

VERIFIED — the summary's form `b² = φ⁻³ᐟ²·a` is correct.

### Quadratic `a² - φ⁻³ᐟ²·a - 1 = 0` has root `a = √φ`

`(√φ)² - φ⁻³ᐟ²·√φ - 1 = φ - φ⁻¹ - 1 = (φ² - 1)/φ - 1 = ((φ+1)-1)/φ - 1 = 1 - 1 = 0`. ✓

VERIFIED.

### Coassociative system (Theorem 7.5)
Independent verification:
* N1: `φ⁻² + φ⁻¹ = 1` ✓
* N2: `2φ⁻² + φ⁻³ = 1` ✓
* C2: `r² = φ⁻³ = φ⁻³ᐟ²·φ⁻¹·φ⁻¹ᐟ² = φ⁻³ᐟ²·xy` ✓
* Quadratic: I redid steps 3 and 4 (verifying `A = 1+2φ`, the test
  `x² = φ⁻²` ≡ `u = 2-φ` annihilates `Au² - Au + 1`).
* I also independently checked that `u_+ = φ⁻¹` (the other root) leads to
  `r² = 1 - 2φ⁻¹ < 0`, ruling it out.

VERIFIED.

### PF amplitudes (Lemma 7.5–7.6)
* Vacuum: `1/D² + φ²/D² = (1+φ²)/D² = D²/D² = 1` ✓
* τ: `1/D² + 1/D² + φ/D² = (2+φ)/D² = D²/D² = 1` ✓

VERIFIED.

### Length-weighted isometry (Lemma 6.2)
`Σ_J ℓ(J)/ℓ(I) = 1` is trivially the partition identity. So the squared
amplitudes sum to 1.

VERIFIED.

### Length-weighted coherence (Lemma 6.3)
`w_{J|I} · w_{K|J} = √(ℓ(J)/ℓ(I)) · √(ℓ(K)/ℓ(J)) = √(ℓ(K)/ℓ(I)) = w_{K|I}` ✓.

VERIFIED.

### Continuum L²(X) identification (Theorem 6.4)
The identification `|I⟩ ↔ ℓ(I)^{-1/2} χ_I` correctly intertwines the
length-weighted refinement with the trivial refinement of `χ_I = Σ_J χ_J`,
because `ℓ(I)^{-1/2}·χ_J = √(ℓ(J)/ℓ(I))·ℓ(J)^{-1/2}·χ_J = w_{J|I}·ℓ(J)^{-1/2}·χ_J`.

VERIFIED.

### Z-function convolution + exponential solution (Definition 7.5)
I expanded the exponential ansatz `Z_1 = φ⁻²A + φ⁻¹B`, `Z_τ = φ⁻²(A - B)`
with `A = e^{ρφL}`, `B = e^{-ρL}`, and verified:
* `Z_1(x+y) = Z_1(x)Z_1(y) + φ Z_τ(x)Z_τ(y)`: coefficient of `A_xA_y` is `φ⁻²`
  ✓; coefficient of `B_xB_y` is `φ⁻² + φ⁻³ = φ⁻¹` ✓; cross-terms vanish ✓.
* `Z_τ(x+y) = Z_τ(x)Z_1(y) + Z_1(x)Z_τ(y) + φ⁻¹ Z_τ(x)Z_τ(y)`: coefficient of
  `A_xA_y` is `2φ⁻⁴ + φ⁻⁵ = φ⁻⁵(2φ+1) = φ⁻⁵·φ³ = φ⁻²` ✓; coefficient of
  `B_xB_y` is `-2φ⁻³ + φ⁻⁵ = φ⁻⁵(1-2φ²) = -φ⁻²` ✓; cross-terms vanish (using
  `φ² - φ - 1 = 0`) ✓.

VERIFIED.

### Ising / TL identifications (Lemmas 8.5, 8.6)
With PF vector `(1, √2, 1)`:
* `e_{2r-1}`: `h_{i±1} = 2` fixed, so the matrix in `{|h=1⟩,|h=3⟩}` basis is
  `(1/√2)·[[1,1],[1,1]] = (1/√2)(1 + X_r)` ✓.
* `e_{2r}`: `h_i = 2` forced, nonzero only when `h_{i-1} = h_{i+1}`, with weight
  `√(v_2·v_2)/v_{h_{i-1}} = √2/1 = √2`. So `e_{2r} = √2 · projector` =
  `√2 · (1 + Z_r Z_{r+1})/2 = (1 + Z_r Z_{r+1})/√2` ✓.

VERIFIED.

### TFI Hamiltonian (Theorem 8.7)
`H = -Σ e_{2r-1} - Σ e_{2r} = -(1/√2)Σ(1+X_r) - (1/√2)Σ(1+Z_rZ_{r+1})
= -√2·M - (1/√2)Σ(X_r + Z_rZ_{r+1})`. ✓

VERIFIED. (See Issue 4 for the BC subtlety.)

### Polar decomposition isometry (Theorem 9.1)
`E^†E = (BB^†)^{-1/2}·BB^†·(BB^†)^{-1/2} = (BB^†)^{-1/2}·(BB^†)^{1/2}·(BB^†)^{1/2}·(BB^†)^{-1/2} = id`. ✓

VERIFIED.

### No-mixing scalar formula (Corollary 9.2)
For singleton `μ` block: `(BB^†)_{μμ} = Σ_ν |β^μ_ν|²`, inverse-square-root is
`1/√Σ |β|²`, and `E^ν_μ = (B^†)_{νμ}·(BB^†)^{-1/2}_{μμ} = β̄^μ_ν/√Σ|β|²`. ✓

VERIFIED.

### Gram overlap φ⁻¹ (Lemma 11.3)
The two basis vectors are `e_1 = (ττ)_1⊗τ` (left bracket, intermediate 1) and
`f_1 = τ⊗(ττ)_1` (right bracket, intermediate 1). Their inner product equals
`F_{11} = φ⁻¹`, the (1,1) entry of the F-matrix in the `τ` total-charge
sector. ✓

VERIFIED.

### Sidelobe amplitudes (Definition 11.6 proof)
* `|b|² + 2|a|² = 1` (single-particle norm: `b·|2i⟩ + a·|2i-1⟩ - a·|2i+1⟩`)
* `⟨S|i⟩, S|i+1⟩⟩ = -|a|²` (the only non-zero contribution is the `|2i+1⟩` overlap with
  itself, with coefficients `-a` and `+a`).
* Combined with the pair-overlap cancellation `-|a|² + |b|²·|λ|²·φ⁻¹ = 0`:
  - `|a|² = |b|²·|λ|²/φ`
  - `|b|²(1 + 2|λ|²/φ) = 1`, so `|b|² = φ/(φ+2|λ|²)`, `|a|² = |λ|²/(φ+2|λ|²)`.

VERIFIED.

---

## Summary of severity

| ID | Severity | Description |
|----|----------|-------------|
| 1 | **CRITICAL** | Lemma 7.7 binary refinement formulas are squared amplitudes, not amplitudes. Internally inconsistent with Definition 7.6 and with the dilute-limit prose in the same lemma. Propagated from chat 4. Should be square-rooted throughout (and the `φ`, `φ⁻¹` constants replaced by `√φ`, `φ⁻¹ᐟ²`). |
| 2 | **MAJOR** | Theorem 7.5 Step 1 (`p = q = x`) is asserted by hand-waving rather than derived, in violation of the document's stated promise "Derivations are presented without skipped steps." The omitted derivation is the explicit coassociativity check at the `τ→τ11`/`τ→1τ1`/`τ→11τ` configurations. |
| 3 | **MINOR** | The parenthetical "verification of the first F-row" in the proof of Theorem 7.5 Step 2 (line 1056–1064) contains garbled algebra (`xy·φ⁻²·φ¹ = xy·φ⁻¹` is wrong as a chain, and `(φ-1)·φ⁻¹·φ¹ - φ⁻¹` is meaningless). The final conclusion is correct, but the intermediate algebra is broken and should be rewritten. |
| 4 | **MINOR** | Theorem 8.7 silently relies on periodic boundary conditions; the index range `r = 1, ..., M` for even generators would be wrong for open BCs (since `e_{2M}` does not exist). The text states periodic BCs but the dependency on this in the proof is implicit. |
| 5 | **MINOR** | Proposition 7.7(i) cites "induction on r" without writing it out; the inductive step gluing M-coefficients across two refinements depends nontrivially on the F-symbol and is not justified. |
| 6 | **NITPICK** | Conjugation conventions on `m^†` are correct (`ā` and `b̄` carrying the right complex conjugates) and self-consistent. VERIFIED, not a bug. |
| 7 | **NITPICK** | Corollary 5.7's phrasing is asymmetric ("b=0 forces a=0"). Actually `a=0` also forces `b=0`. The branch enumeration in Theorem 5.10 is still complete and correct. No bug, only stylistic. |

The **CRITICAL bug (Issue 1)** is the only one that would affect a downstream
numerical calculation. The others are either skipped derivations, garbled
intermediate algebra, or implicit assumptions that should be made explicit.

All other algebraic identities I sampled — golden-ratio identities, F²=I,
dagger-special derivation, PF amplitudes, coassociative system, length-weighted
isometry, L² continuum identification, Z-function exponential ansatz, Ising/TL
generator formulas, TFI Hamiltonian, polar decomposition, Gram overlap, and
sidelobe amplitudes — checked out exactly.
