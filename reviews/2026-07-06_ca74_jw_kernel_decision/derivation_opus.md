# CA-74 derivation note — parity combinatorics and the Jones–Wenzl kernel

**Worker:** Derivation (Opus), fan-out #1 of the CA-74 orchestration
(`ORCHESTRATION.md`).
**Scope:** analytical derivation only. I write **this file only**; I do not
touch `report/`, `worklog/`, `CONVENTIONS.md`, `src/`, `test/`.
**Provenance labels:** every claim carries `[sourced …]`, `[derived here]`, or
`[needs numerical check]`. Fibonacci convention `F_0 = 0, F_1 = 1`
(matches CA-66, `report/sections/66_anyonic_states_variable_n_fock.tex:194`).

## 0. Agreement check with the established data (Law 4)

I **reproduce every established datum** in the task/`worklog/013`:
`dim dTL_L = M_{2L} = 9,51,323` (L=2,3,4); `dim A_L = F_{4L-1} = 13,89,610`;
dilute Tier-1 image `= 9,51,322`; parity-even dim `= 9,51,322`; the L=4 split
`13 = 9+4`, `21 = 9+12`; `ker rho_4` one-dimensional. **No disagreement.** One
*upgrade* not in the prior record: kernel-theorem step (iii) below is not merely
a numerical expectation — it is **analytically forced and locally sourced** from
Iohara–Lehrer–Zhang (SRC-TL-JONES). I flag that as a strengthening, not a
conflict.

## 1. Charge-block multiplicities of `A_L = End_C(O^{⊗L})`

`m_c(L) := dim Hom_C(X_c, O^{⊗L})`, `O = 1 ⊕ τ`, so
`A_L ≅ ⊕_c M_{m_c(L)}(C)`
[sourced `report/sections/66_anyonic_states_variable_n_fock.tex:94`--`:107`].

**Recursion [derived here].** `O^{⊗(L+1)} = O^{⊗L} ⊗ (1 ⊕ τ)`. An intermediate
charge `d` fuses under `⊗O` as `d ⊗ (1⊕τ) = d ⊕ (d⊗τ)`; with `1⊗τ = τ` and
`τ⊗τ = 1 ⊕ τ` [sourced fusion rule, `…/66…tex:187`--`:192`, CONVENTIONS (r)]:

```
m_1(L+1)  = m_1(L) + m_τ(L)
m_τ(L+1)  = m_1(L) + 2 m_τ(L)
```

i.e. `(m_1, m_τ)^T ↦ M_+ (m_1, m_τ)^T`, `M_+ = [[1,1],[1,2]] = I + T`,
`T = [[0,1],[1,1]]` the tensor-with-τ (path) transfer matrix. Seed
`(m_1(1), m_τ(1)) = (1,1)` [`O = 1⊕τ`].

**Closed form [sourced].** `(m_1(L), m_τ(L)) = (F_{2L-1}, F_{2L})`
[sourced `…/66…tex:194`--`:198`, `T66.2`]; this satisfies the recursion since
`F_{2L-1}+F_{2L}=F_{2L+1}` and `F_{2L-1}+2F_{2L}=F_{2L}+F_{2L+1}=F_{2L+2}`.

**`dim A_L` [derived here + sourced].** `dim A_L = m_1^2 + m_τ^2 = F_{2L-1}^2 +
F_{2L}^2 = F_{4L-1}` — the Fibonacci identity `F_m^2 + F_{m+1}^2 = F_{2m+1}` at
`m = 2L-1` [derived here; result sourced `…/66…tex:205`, `T66.3`].

**Table L = 1..6 [derived here].**

| L | m_1 = F_{2L-1} | m_τ = F_{2L} | dim A_L = F_{4L-1} |
|---|---|---|---|
| 1 | 1  | 1   | 2      |
| 2 | 2  | 3   | 13     |
| 3 | 5  | 8   | 89     |
| 4 | 13 | 21  | 610    |
| 5 | 34 | 55  | 4181   |
| 6 | 89 | 144 | 28657  |

(Fibonacci: `F_7=13,F_8=21,F_9=34,F_10=55,F_11=89,F_12=144`; `F_15=610,
F_19=4181, F_23=28657`.)

## 2. Parity refinement by occupied number `N`

Occupied number `N =` number of τ-summand sites `= |S|` for the occupied set
`S ⊆ [L]` [CONVENTIONS (r): "occupied" is the `X=τ` summand]. Parity is
`N mod 2`. This is the same grading as the dilute vacancy/occupied-parity ideal
`dTL_L = edTL_L ⊕ odTL_L`
[sourced `references/lattice-symmetry/DiluteTL2014/source/Dtl_pgl_ell.06.tex:773`--`:776`,
CA-69 `report/sections/69_dilute_tl_word_algebra.tex:51`--`:56`]. **Convention
watch (Rule 3):** `m_c^p` are *dimensions* (ranks of Hom-spaces), hence
**gauge-independent** — the unitary-gauge F-symbol choice of CONVENTIONS (b)
does not enter; only the fusion rule and the (r) definition of `N` do.

Because `Hom_C(X_c, τ^{⊗S})` depends on `S` only through `N = |S|`,

```
m_c(L) = Σ_{N=0}^{L} C(L,N) h_c(N),     h_c(N) := dim Hom_C(X_c, τ^{⊗N})
```

[derived here from the occupied-subset expansion, `…/66…tex:76`--`:83`], with the
τ-chain path counts `h_1(N) = F_{N-1}`, `h_τ(N) = F_N` (`h_1(0)=1=F_{-1}`)
[derived here; τ-path recursion `h_1(N+1)=h_τ(N)`, `h_τ(N+1)=h_1(N)+h_τ(N)`,
i.e. `(h_1,h_τ)^T = T^N (1,0)^T`].

### 2a. Transfer-matrix recursion for the four refined counts

Write `(e1,o1,eτ,oτ)(L) = (m_1^even, m_1^odd, m_τ^even, m_τ^odd)(L)`. Appending
one site: the `1`-summand keeps `N` (same parity); the `τ`-summand raises `N` by
1 (flips parity) and fuses the charge. This gives [derived here]:

```
m_1^even(L+1) = m_1^even(L) + m_τ^odd(L)
m_1^odd (L+1) = m_1^odd (L) + m_τ^even(L)
m_τ^even(L+1) = m_τ^even(L) + m_1^odd(L) + m_τ^odd(L)
m_τ^odd (L+1) = m_τ^odd (L) + m_1^even(L) + m_τ^even(L)
```

Seed `(e1,o1,eτ,oτ)(1) = (1,0,0,1)` (charge 1 from the vacuum summand, `N=0`
even; charge τ from the τ summand, `N=1` odd). Consistency: summing the two
charge-1 rows gives `m_1(L+1)=m_1+m_τ`, the two charge-τ rows give
`m_τ(L+1)=m_1+2m_τ` — matches §1 [derived here].

### 2b. Closed forms

Set the alternating sums `M_c^-(L) := Σ_N C(L,N)(-1)^N h_c(N) =
[(I-T)^L (1,0)^T]_c`. Then `m_c^even = (m_c + M_c^-)/2`,
`m_c^odd = (m_c - M_c^-)/2` [derived here, `(1±(-1)^N)/2` split]. The recursion
`u(L+1) = (I-T)u(L)`, `I-T = [[1,-1],[-1,0]]`, gives
`M_1^-(L+1) = M_1^-(L) + M_1^-(L-1)` (a Fibonacci recursion) with
`M_1^-(0)=1, M_1^-(1)=1`, and `M_τ^-(L) = -M_1^-(L-1)`. Hence [derived here]

```
M_1^-(L) = F_{L+1},     M_τ^-(L) = -F_L,
```

and therefore the **closed forms**

```
m_1^even(L) = (F_{2L-1} + F_{L+1})/2      m_1^odd(L) = (F_{2L-1} - F_{L+1})/2
m_τ^even(L) = (F_{2L}   - F_L  )/2        m_τ^odd(L) = (F_{2L}   + F_L  )/2
```

The eigenvalues of `I-T` are `φ, -1/φ` (char. poly `λ²-λ-1`), so the parity
*asymmetry* `M_c^-` grows like `φ^L`, subdominant to `m_c ~ φ^{2L}`: even/odd
split becomes near-equal as `L→∞` [derived here].

### 2c. Table L = 1..6 [derived here]

| L | m_1^even | m_1^odd | (=m_1) | m_τ^even | m_τ^odd | (=m_τ) |
|---|---|---|---|---|---|---|
| 1 | 1  | 0  | 1  | 0  | 1  | 1   |
| 2 | 2  | 0  | 2  | 1  | 2  | 3   |
| 3 | 4  | 1  | 5  | 3  | 5  | 8   |
| 4 | **9** | **4** | 13 | **9** | **12** | 21 |
| 5 | 21 | 13 | 34 | 25 | 30 | 55  |
| 6 | 51 | 38 | 89 | 68 | 76 | 144 |

### 2d. The L=4 split and which parity carries which number

`13 = 9 + 4` (charge 1: **even = 9, odd = 4**) and `21 = 9 + 12` (charge τ:
**even = 9, odd = 12**) — reproduces `{13 = 9+4, 21 = 9+12}` exactly
[derived here; sourced target `worklog/013…md:52`--`:56`, CA-73].

**Which parity, and why [derived here].** The signs in §2b are the mechanism:
- Charge 1 gets a positive even-excess `M_1^- = +F_{L+1}` (at L=4, `+F_5 = +5`),
  so **charge 1 is even-heavy**: `9 > 4`. Root cause: the all-vacuum
  configuration (`N=0`, even) is a charge-1 state and always present, plus every
  `τ⊗τ→1` fusion consumes an even count of τ's toward the vacuum channel.
- Charge τ gets a negative even-excess `M_τ^- = -F_L` (at L=4, `-F_4 = -3`),
  so **charge τ is odd-heavy**: `12 > 9`. Root cause: the elementary
  charge-τ states are single-τ occupations (`N=1`, odd).

This is *not* a strict superselection between `N mod 2` and charge (both
`h_1(N)=F_{N-1}` and `h_τ(N)=F_N` are nonzero for `N≥2`); it is a computed bias
of size `F_{L+1}` (charge 1) / `F_L` (charge τ).

## 3. Parity-even (parity-preserving) subalgebra dimension

The parity-**preserving** subalgebra of `A_L` is
`⊕_c (M_{m_c^even} ⊕ M_{m_c^odd})`, of dimension
`P(L) := Σ_c ((m_c^even)² + (m_c^odd)²)` [derived here; this is the block content
of a homomorphism that preserves both charge `c` and `N mod 2`].

**Verification [derived here]:**
- `P(2) = (2²+0²) + (1²+2²) = 4 + 5 = 9` ✓
- `P(3) = (4²+1²) + (3²+5²) = 17 + 34 = 51` ✓
- `P(4) = (9²+4²) + (9²+12²) = 97 + 225 = 322` ✓
  (matches `9,51,322` of CA-73 / `worklog/013…md:51`).

**Predictions [derived here]:**
- `P(5) = (21²+13²) + (25²+30²) = 610 + 1525 = 2135`
- `P(6) = (51²+38²) + (68²+76²) = 4045 + 10400 = 14445`

Cross-check against the full algebra: `dim A_L - P(L) = Σ_c 2 m_c^even m_c^odd`
(the parity-*odd* off-diagonal blocks). L=4: `610-322 = 288 = 2(9·4+9·12)` ✓;
L=5: `4181-2135 = 2046 = 2(21·13+25·30)` ✓; L=6: `28657-14445 = 14212 =
2(51·38+68·76)` ✓ [derived here].

## 4. Kernel identification theorem at L = 4

**Setup.** `rho_4 : dTL_4(φ) → A_4 = End_C(O^{⊗4})` is the CA-69 evaluation map
[sourced `report/sections/69…tex:70`--`:86`]. `A = {1,2,3,4}`, `π_A =
∏_{i∈A, j∉A} x_j e_i` is the fully-occupied idempotent, and
`ι : TL_4 ≅ π_A dTL_4 π_A` the dense-corner isomorphism
[sourced `…/Dtl_pgl_ell.06.tex:891`--`:895`, Prop.; CA-69 `…/69…tex:58`--`:61`].
`p_4` is the Jones–Wenzl (JW) projector of `TL_4(φ)`.

> **Convention bridge (Rule 3, recorded).** SRC-TL-JONES writes `TL_n(q)` on `n`
> strands with `f_i² = -(q+q^{-1})f_i`; its loop parameter is `-(q+q^{-1})` and
> `ℓ := |q²|`. Our CA-69 diagram algebra uses loop value `β = +φ`
> (`e_j² = φ e_j`, CONVENTIONS (r), CA-73 checked). The unitary Fibonacci point
> `β = φ = 2cos(π/5)` is `q = e^{iπ/5}`, `q² = e^{2πi/5}`, so **`ℓ = 5`**; the
> overall loop sign is a Frobenius–Schur/gauge choice (`κ_τ = +1` is sourced,
> CONVENTIONS (r)) and does not touch JW existence, trace-vanishing, or any
> dimension below. The identification "`ℓ=5` = our Fibonacci β=φ" is pinned by
> the source's own `ℓ=5` example, whose Jones-algebra module dimensions are
> exactly our path counts `a_i = F_{2i+1}`, `b_i = F_{2i}`
> [sourced `references/text/TemperleyLiebRootsJonesQuotient.txt:679`--`:722`].
> In the source's notation `p_4 = E_{ℓ-1} = E_4 ∈ TL_4`.

**Claim.** `ker rho_4 = span{ ι(p_4) }`.

### (i) `p_4` exists at β = φ and is negligible

Quantum integers at `q = e^{iπ/5}`, `[k] = sin(kπ/5)/sin(π/5)`:
`[1]=1, [2]=[3]=φ, [4]=1, [5]=0` [derived here via `[k+1]=[2][k]-[k-1]`,
`φ²=φ+1`]. **Existence:** the JW idempotent `E_{ℓ-1}=E_4 ∈ TL_4(φ)` exists and
is the *unique* idempotent with `f_i E_4 = E_4 f_i = 0` for `i = 1,2,3`
[sourced `…/TemperleyLiebRootsJonesQuotient.txt:135`--`:137`, Prop. 3.1;
explicit Graham–Lehrer formula `:142`--`:161`]; equivalently, Wenzl's recursion
runs because `[2],[3],[4] ≠ 0`. **Negligibility:** the Markov/Jones trace obeys
`tr_4(E_4) = 0`
[sourced `…/TemperleyLiebRootsJonesQuotient.txt:818` ("`trℓ−1(Eℓ−1) = 0`");
`:62`--`:69`, `:138`--`:141`: at `n = ℓ-1 = 4` the trace form is degenerate with
a **1-dimensional** radical generated by `E_4`, and non-degenerate for
`n ≤ ℓ-2 = 3`]. In quantum-integer terms `tr(E_4) ∝ [5] = 0` [derived here,
standard JW trace `= [n+1]`; the exact value `0` is the sourced statement].
**Status: analytical + sourced.**

### (ii) `ι(p_4) ≠ 0` in `dTL_4`

`ι` is an injective algebra map (isomorphism onto the corner subalgebra)
[sourced `…/Dtl_pgl_ell.06.tex:891`--`:895`]. `p_4 = E_4 ≠ 0` in `TL_4` (its
diagram expansion has **coefficient 1 on the identity diagram** `I^{⊗4}`
[sourced `…/TemperleyLiebRootsJonesQuotient.txt:792`], and TL diagrams are a
linear basis). An injective map sends nonzero to nonzero, so `ι(p_4) ≠ 0`;
concretely `ι(p_4) = π_A p_4 π_A` has coefficient 1 on the fully-occupied
identity diagram `π_A`, a genuine dilute basis diagram [sourced dilute diagrams
are a basis, `…/Dtl_pgl_ell.06.tex:41`--`:47`; CA-69 registration]. **Status:
analytical + sourced.**

### (iii) `rho_4(ι(p_4)) = 0`

The corner restriction `rho_4 ∘ ι : TL_4(φ) → End_C(τ^{⊗4})` is the standard
dense-TL (anyonic Fibonacci) representation: `π_A` maps to the projection onto
`P_τ O^{⊗4} ≅ τ^{⊗4}`, through-strings to `id_τ`, cup/cap to the raw
coev/ev of weight `d_τ = φ`, so the TL generator `e_i ↦` the local
identity-channel projector on sites `i,i+1` [sourced CA-69 `…/69…tex:70`--`:86`,
`:163`--`:181`; CA-73 checked `e_j²=φe_j` and braid `e_je_{j±1}e_j=e_j` **on the
dense corner**, `report/sections/73…tex:214`--`:223`].

*The reason it must vanish (two independent arguments):*

**(iii-a) Sourced kernel identity.** The image of this representation is the
Jones algebra `Q_4(5) = TL_4(φ)/⟨E_4⟩ ≅ End_{U_q(sl2)}(Δ_q(1)^{⊗4}) =
End_C(τ^{⊗4})`, and the kernel is exactly the ideal `⟨E_4⟩`, which at
`n = ℓ-1 = 4` is the **1-dimensional radical** `= span{E_4}`
[sourced `…/TemperleyLiebRootsJonesQuotient.txt:74`--`:80` (Q_n ≅ End of the
tilting module), `:171`--`:187` (Q_n = TL_n/⟨E_{ℓ-1}⟩ semisimple),
`:62`--`:69`/`:135`--`:141` (radical dim 1 at n=ℓ-1)]. Dimension ledger
[derived here, triple-checked]: `dim TL_4 = C_4 = 14`; `dim End_C(τ^{⊗4}) =
h_1(4)² + h_τ(4)² = F_3² + F_4² = 2² + 3² = 13`; `14 - 13 = 1 = dim⟨E_4⟩`.
The source's own `ℓ=5` module formulas give `dim Q_4(5) = 2² + 3² = 13`
[sourced `…/TemperleyLiebRootsJonesQuotient.txt:679`--`:722`]. Since
`p_4 = E_4 ∈ ⟨E_4⟩ = ker(rho_4∘ι)`, we get `rho_4(ι(p_4)) = 0`.

**(iii-b) Positivity/quantum-trace argument [derived here].** `rho_4∘ι` is a
unital `*`-representation (unitary gauge, CONVENTIONS (b)), so `rho_4(ι(p_4))`
is a self-adjoint idempotent (orthogonal projection). Its categorical quantum
trace equals the Markov trace `tr_4(E_4) = 0` [sourced `:818`]. In a unitary
category with **positive** quantum dimensions `d_1=1, d_τ=φ>0`
[sourced CONVENTIONS (r), Penneys/ENO anchors], a nonzero orthogonal projection
has strictly positive quantum trace; trace `0` forces `rho_4(ι(p_4)) = 0`.

**Status: analytical + sourced** (upgrade over the prior "needs numerics"
labelling). **Independent numerical confirmation** `rho_4(ι(p_4)) = 0` to machine
precision is being produced by the parallel codex worker (`ORCHESTRATION.md` #2);
[needs numerical check] only as a cross-verification, not as the ground of the
claim.

### (iv) Rank–nullity

`dim dTL_4 = M_8 = 323`
[sourced `…/Dtl_pgl_ell.06.tex:1020`--`:1033`; CA-69 `…/69…tex:92`--`:99`].
Two analytical upper bounds on the rank: `image(rho_4) ⊆` parity-preserving
subalgebra (dilute diagrams preserve `N mod 2`), so `rank ≤ P(4) = 322`
[derived here + sourced parity `…/Dtl…:773`--`:776`]; and `ι(p_4) ∈ ker` from
(ii)+(iii), so `rank ≤ 322` again. The **one numerical input** is surjectivity
onto the parity-even subalgebra, `rank rho_4 = 322` (dim image `= 322`)
[needs numerical check — the CA-73 datum, `worklog/013…md:51`, rerun this
session]. Then `dim ker rho_4 = 323 - 322 = 1`, and since `ι(p_4)` is a nonzero
kernel element, **`ker rho_4 = span{ι(p_4)}`.** ∎

### (iv′) Exactly which inputs are numerical vs analytical

| Ingredient | Status |
|---|---|
| `p_4` exists, `tr(p_4)=0`, coeff-1-on-identity | **analytical + sourced** (SRC-TL-JONES) |
| `ι(p_4) ≠ 0` | **analytical + sourced** (corner iso injective) |
| `rho_4(ι(p_4)) = 0` | **analytical + sourced** (dense kernel `=⟨E_4⟩`; positivity); numerics confirm |
| `image ⊆ parity-even`, `rank ≤ 322` | **analytical + sourced** (parity ideal) |
| `dim dTL_4 = 323` | **analytical + sourced** (Motzkin) |
| `rank rho_4 = 322` (surjective onto parity-even) | **numerical** (CA-73; the *only* essential numerical input) |

So the theorem holds **modulo one numerical fact** (surjectivity of `rho_4` onto
the 322-dim parity-even subalgebra); everything else, including the *identity* of
the kernel element, is analytical and locally sourced.

## 5. Upgraded general-L conjecture (refines CA-69)

**Conjecture [proposal].** For Fibonacci `O = 1⊕τ` and all `L ≥ 1`, `rho_L`
maps `dTL_L(φ)` **onto** the parity-preserving subalgebra of `A_L`, with kernel
the two-sided ideal generated by the corner embeddings of the JW projector
`p_4`:
```
ker rho_L = ⟨ ι_A(p_4) : A ⊆ [L], |A| = 4 ⟩   (the negligible ideal of dTL_L(φ)).
```
Support: exact at L ≤ 3 (image = parity-even, no kernel — `M_{2L}=P(L)`), and at
L=4 by §4 (image = parity-even, `ker = span{ι(p_4)}` and the ideal `⟨ι(p_4)⟩`
coincides with it since the two-sided ideal inside the 1-dim kernel of an algebra
map cannot be larger) [derived here].

**Predicted kernel dimensions [derived here], assuming surjectivity:**
`dim ker rho_L = M_{2L} - P(L)`.

| L | `dim dTL_L = M_{2L}` | `P(L)` (parity-even) | predicted `dim ker rho_L` |
|---|---|---|---|
| 2 | 9    | 9     | 0    |
| 3 | 51   | 51    | 0    |
| 4 | 323  | 322   | **1**  |
| 5 | 2188 | 2135  | **53** |
| 6 | 15511| 14445 | **1066** |

(`M_10 = 2188`, `M_12 = 15511` [sourced `…/Dtl_pgl_ell.06.tex:1031`--`:1033`].)
The L=4 entry `= 1` matches §4 exactly [derived here].

**Analytical strength of these numbers [derived here].** Because
`image(rho_L) ⊆ parity-even` is *proved* (parity ideal, sourced), the entries are
rigorous **lower bounds**: `dim ker rho_5 ≥ 53`, `dim ker rho_6 ≥ 1066`. They are
*equalities* iff `rho_L` is surjective onto the parity-even subalgebra (the
conjecture). So the only open half at L≥5 is surjectivity.

**Independent bound on the ideal `⟨ι(p_4)⟩` [partial; derived here].** In the
dense case the negligible ideal `ker(TL_n(φ)→End_C(τ^{⊗n})) = ⟨E_4⟩` has
dimension `C_n - F_{2n-1}` (`=1,8,43` for `n=4,5,6`) [sourced kernel identity
SRC-TL-JONES; `C_5-34=8`, `C_6-89=43` derived here]. The dilute negligible ideal
is strictly larger because `dTL_L` carries `C(L,·)`-many dense corners
`TL_{|A|}` glued by the non-symmetric-vacancy diagrams; I do **not** have a
closed form for `dim⟨ι(p_4)⟩` from local sources, and I do not assert one. What
is clean is the combinatorial prediction `M_{2L}-P(L)` above and its lower-bound
status.

**What an L=5 verification would need (compute budget respected).** Matrix
computations at L=5 are **banned** (`AGENTS.md` platform note; `MEMORY.md`
laptop budget). A pure-combinatorial confirmation of `dim ker rho_5 = 53` would
require, *without* forming any `2188×2188` matrix:
(a) a combinatorial proof that `rho_5` surjects onto the parity-even subalgebra
(e.g. an explicit set of dilute words realising matrix units in every
`(c, parity)` block, counted to `P(5)=2135`), and/or
(b) a structural computation that the negligible ideal `⟨ι_A(p_4)⟩` has
dimension exactly `M_10 - P(5) = 53` — plausibly via the cellular/standard-module
theory of `dTL` at a root of unity (registered but not yet worked:
`…/Dtl_pgl_ell.06.tex:2339` semisimplicity criterion; the periodic/standard-module
apparatus of DiluteA22 sources). Both are combinatorial and within budget; the
`322`-style rank check is not.

## 6. Gram-rank / kernel-dictionary deferral

The Gram-rank kernel-dictionary work — descendant Gram matrices `G_L^a` with
shadow rank `G_L → rank G^{Vir}_{c,h_a}`, and the JW↔null-vector reading — is
**W2.3** and stays deferred behind the endpoint-closing ledger **W1.5 / tension
T1** [sourced `reviews/2026-07-06_pipeline_consistency_scoping/PLAN.md:222`--`:224`
("`W2.3 … [needs W1.3 + W1.5]`") and `:195`--`:199` (W1.5 endpoint-closing rule);
tension `:36`--`:37` ("`T1 occupied-subset vs fusion-tree bases beyond L=2 —
missing endpoint-closing rule`")]. The reason is precise: Gram matrices require a
**canonical ONB inside each fixed-`S` charge sector** (a fusion-tree basis with a
fixed endpoint-closing convention). Beyond L=2 no such canonical basis is fixed —
that is exactly what W1.5/CA-75 must supply — so any descendant-Gram rank would
be basis-arbitrary and non-comparable across scales. CA-74's kernel result, by
contrast, is a **rank/dimension** statement and is basis-independent
[sourced `PLAN.md:188`--`:193`, W1.4 "nothing basis-dependent enters"], so it
proceeds now; the Gram-rank dictionary waits for W1.5.

---

## Summary (for the orchestrator)

**Parity-refined multiplicity table (L=1..6)** `(m_1^even, m_1^odd | m_τ^even,
m_τ^odd)`:

```
L=1:  1,0 | 0,1        L=4:  9,4  | 9,12
L=2:  2,0 | 1,2        L=5:  21,13| 25,30
L=3:  4,1 | 3,5        L=6:  51,38| 68,76
```

Closed forms: `m_1^{even/odd} = (F_{2L-1} ± F_{L+1})/2`,
`m_τ^{even/odd} = (F_{2L} ∓ F_L)/2`. **L=4 split reproduced:** `13 = 9+4`
(charge 1: even-heavy, `+F_5`), `21 = 9+12` (charge τ: odd-heavy, `-F_4`).

**Parity-even subalgebra dims:** `9, 51, 322` (L=2,3,4, verified);
**predictions `P(5)=2135`, `P(6)=14445`.**

**Predicted kernel dims** `M_{2L}-P(L)`: L=4 `=1` (matches), **L=5 `=53`,
L=6 `=1066`** — analytically these are *lower bounds* on `dim ker rho_L`
(parity), equalities under the surjectivity conjecture.

**Kernel theorem status (`ker rho_4 = span{ι(p_4)}`):**
- (i) `p_4` exists / negligible (`tr=0`): **proved + sourced** (SRC-TL-JONES).
- (ii) `ι(p_4) ≠ 0`: **proved + sourced** (corner iso injective, coeff-1 identity).
- (iii) `rho_4(ι(p_4)) = 0`: **proved + sourced** (dense kernel `= ⟨E_4⟩`, and a
  positivity/quantum-trace argument); numerics confirm in parallel.
- (iv) rank–nullity ⇒ 1-dim kernel = `span{ι(p_4)}`: **the single numerical input
  is `rank rho_4 = 322`** (surjectivity onto parity-even); all else analytical.

**Gaps / surprises.**
1. **Surprise (upgrade):** step (iii) is not merely numerical — the local
   registered source SRC-TL-JONES (Iohara–Lehrer–Zhang) gives
   `ker(TL_4(φ)→End_C(τ^{⊗4})) = span{E_4}` outright. The theorem's only
   essential numerical dependency is surjectivity, `rank = 322`.
2. **Gap:** no closed form for `dim⟨ι(p_4)⟩` in `dTL_L(φ)` at general L from local
   sources; the `53`/`1066` predictions rest on the surjectivity conjecture
   (rigorous as lower bounds; equalities conjectural). L=5 confirmation must be
   combinatorial (matrix rank at L=5 is budget-banned).
3. **Convention caveat (recorded, Rule 3):** SRC-TL-JONES uses loop
   `-(q+q^{-1})` on `n`-strand `TL_n`, `ℓ=|q²|`; our `β=+φ` is its `ℓ=5` point.
   Load-bearing facts (JW existence, `tr=0`, dims, kernel) are sign-robust;
   `κ_τ=+1` (sourced) fixes the honest positive loop `d_τ=φ`. One data line in the
   source (`:666`, "dim Q_8 = F_13 = 233") is inconsistent with the paper's own
   `ℓ=5` module formulas (which give `dim Q_8 = 13²+21² = 610 = F_15`) and with
   three independent recomputations — I treat `:666` as an extraction typo and do
   **not** rely on it; the only value used (`dim Q_4(5) = 13`) is internally
   consistent and triple-checked.
```
