# Hostile CFT/RG Review of `summary.tex` and chats 1–4

Reviewer scope: scaling dimensions, OPE coefficients, central charges, F-symbols, CFT identifications, and RG/blocking arithmetic. Format: per claim, what's claimed / where / standard fact / verdict / fix. Severity ratings at the end.

---

## 1. Ising minimal model M(3,4): central charge c = 1/2

**Claimed:** `summary.tex` def:isingcft (lines 1495–1502): "The diagonal Ising minimal model M(3,4) has central charge c=1/2." Chats 1, 2 repeatedly say "c=12" or "c=21" (OCR garbage for c=1/2).

**Standard fact:** c = 1 - 6/(m(m+1)) for the unitary minimal series M(m,m+1). For m=3, c = 1 - 6/12 = 1/2.

**Verdict:** CORRECT. The summary's correction of OCR-mangled "c=12"/"c=21" to c=1/2 is unambiguously justified.

**OCR audit:** chat1 carries "c=12" / "c=21" on lines 140, 142, 150, 151, 501, 582–583, 674, 797, 816, 1006, 1023, 1049, 1074, 1526; chat3 line 813 has "c=145" for c=14/5 (Fibonacci). Every single occurrence of "c=12"/"c=21" in chats genuinely means c=1/2. The summary's "OCR typo theory" is fully borne out.

---

## 2. Ising primaries and chiral weights

**Claimed:** def:isingcft: Primaries 1, σ, ψ with chiral weights h_1=0, h_σ=1/16, h_ψ=1/2.

**Standard fact:** M(3,4) Kac table h_{r,s} = ((4r-3s)² - 1)/48: 
- (1,1) gives 0,
- (1,2) gives 1/16,
- (1,3) gives 1/2.

After identification (r,s) ~ (m-r, m+1-s), the three distinct primaries are 1 (h=0), σ (h=1/16), ψ (h=1/2).

**Verdict:** VERIFIED.

---

## 3. Ising bulk dimensions Δ_Σ = 1/8, Δ_ε = 1

**Claimed:** def:isingcft: Bulk scaling dimensions Δ_1=0, Δ_Σ=1/8, Δ_ε=1.

**Standard fact:** For the diagonal modular invariant, Δ = h + h̄ = 2h: Δ_σ = 2·(1/16) = 1/8, Δ_ε = 2·(1/2) = 1.

**Verdict:** VERIFIED. The factor-2 relation Δ = h + h̄ (diagonal) is correctly invoked.

---

## 4. OPE coefficient C_{σσε} = 1/2

**Claimed:** Throughout chat 1 (lines 570, 571, 887, 888, 1024) and the summary's conjecture KS (line 1946). Summary line 1898 lists this as a "verifiable" mathematical claim.

**Standard fact:** Belavin–Polyakov–Zamolodchikov (1984), Di Francesco–Mathieu–Sénéchal §7.4 / §12, eq. (12.50): In standard 2-point normalization ⟨φ(z)φ(0)⟩ = z^(-4h), the Ising minimal-model OPE structure constant C_{σσε} = 1/2 (or equivalently |C|² = 1/4). The bulk version C_{ΣΣε} carries the same coefficient.

**Verdict:** VERIFIED.

---

## 5. Central-charge check [L_2, L_{-2}] = 4L_0 + c/2 → 1/4 for Ising

**Claimed:** chat1 line 833: "[L_2, L_{-2}] = 4L_0 + c/2 = 4L_0 + 1/4." Summary doesn't carry this Koo–Saleur computation (only mentions it as conj:KS).

**Standard fact:** [L_m, L_n] = (m-n)L_{m+n} + (c/12)·m(m²-1)·δ_{m+n,0}. For m=2, n=-2: (m-n)L_0 = 4L_0; (c/12)·2·(4-1) = 6c/12 = c/2. So [L_2,L_{-2}] = 4L_0 + c/2. For c=1/2: 4L_0 + 1/4.

**Verdict:** VERIFIED.

---

## 6. (G_2)_1 central charge c = 14/5

**Claimed:** summary warn:fibCFTs (lines 1508–1510): "(G_2)_1 with central charge c=14/5". chat 2 line 457 also uses "G_{2,1}".

**Standard fact:** For an affine Lie algebra at level k, c = k·dim(g)/(k+h∨). For G_2: dim(G_2) = 14, dual Coxeter number h∨(G_2) = 4. So c = 1·14/(1+4) = 14/5.

**Verdict:** VERIFIED.

---

## 7. (G_2)_1 primary h_τ = 2/5

**Claimed:** warn:fibCFTs and lem:fib-beta (line 1540): h_τ = 2/5.

**Standard fact:** (G_2)_1 has two integrable highest-weight representations: the vacuum (h=0) and the 7-dimensional rep with highest weight ω_1 (the short fundamental weight). The conformal weight is h = (ω_1, ω_1+2ρ)/(2(k+h∨)). For (G_2)_1 with the standard normalization, this evaluates to h_τ = 2/5. The fusion of two τ's gives 1 ⊕ τ (Fibonacci fusion), confirming this is the "Fibonacci" primary.

**Verdict:** VERIFIED (this is a standard result tabulated, e.g., in Di Francesco et al §15.A.5 or any WZW reference).

**Side note:** the summary correctly flags this as `\unchecked` even though it is in fact a standard textbook result.

---

## 8. Antiferromagnetic golden chain → tricritical Ising c = 7/10

**Claimed:** warn:fibCFTs (lines 1511–1513): "the antiferromagnetic Fibonacci 'golden chain' has continuum limit M(4,5) tricritical Ising with c=7/10." Chat 2 line 461 also asserts this. The summary correctly notes c = 1 - 6/(4·5) = 7/10.

**Standard fact:** Feiguin, Trebst, Ludwig, Troyer, Kitaev, Wang, Freedman, PRL 98, 160409 (2007). The H = +Σ P^1_{i,i+1} antiferromagnetic golden chain (projecting on the trivial channel with positive coupling) flows to tricritical Ising M(4,5), c = 7/10. The ferromagnetic chain flows to Z_3 parafermion (c=4/5).

**Verdict:** VERIFIED. The M(4,5) tricritical Ising identification c=7/10 = 1 - 6/20 = 14/20 is arithmetically correct, and the physical identification matches the literature.

---

## 9. Δ = h + h̄ identity (diagonal CFT)

**Claimed:** def:primary (line 1469–1476): "Its scaling dimension is Δ := h + h̄."

**Standard fact:** For a diagonal CFT with primary of weights (h, h̄), the rotational and dilatational eigenvalues split as 2-momentum (spin) s = h - h̄ and scaling dimension Δ = h + h̄.

**Verdict:** VERIFIED.

---

## 10. Temperley–Lieb at δ=√2 and Ising

**Claimed:** def:dense / lem:path-adj / thm:TL-rel: TL generators e_i = √2 P_i^(1) satisfy e_i² = √2 e_i, the path graph is A_3, and TL at δ=√2 maps to the dense σ-anyon Ising chain.

**Standard fact:** For σ⊗σ = 1 ⊕ ψ with d_σ = √2 (from d_σ² = 1+1), the projector e_i := d_σ · P_i^{(1)} = √2 P_i^{(1)} satisfies e_i² = d_σ² P_i^{(1)} = √2 · (√2 P_i^{(1)}) = √2 e_i = δ e_i with δ = √2. Path graph 1—σ—ψ is indeed A_3 Dynkin.

**Verdict:** VERIFIED.

---

## 11. TL → critical TFI mapping (Theorem thm:TFI)

**Claimed:** lem:e-odd and lem:e-even: e_{2r-1} = (1+X_r)/√2, e_{2r} = (1+Z_rZ_{r+1})/√2. Summing: H_2M^TL = -√2 M - (1/√2) Σ (X_r + Z_r Z_{r+1}). Dropping the constant, this is the critical TFI Hamiltonian up to factor 1/√2.

**Standard fact:** The standard mapping of A_3 RSOS / TL_{√2} to the critical transverse-field Ising chain is well-known (Bashilov-Pokrovsky, Pasquier 1987, see also Klümper-Pearce 1991). The factor of 1/√2 prefactor relative to the conventional H_TFI = -Σ(X_r + ZZ) is the standard one (it rescales the sound velocity).

**Verdict:** VERIFIED. The Perron–Frobenius vector v = (1, √2, 1) is correct for A_3 (PF eigenvalue 2cos(π/4)=√2), and the spin-chain reduction is arithmetically clean.

---

## 12. F^{τττ}_τ Fibonacci matrix

**Claimed:** def:fib-F (lines 906–916):
F^{τττ}_τ = (( φ^{-1}, φ^{-1/2} ), ( φ^{-1/2}, -φ^{-1} ))

**Standard fact:** This is the conventional Fibonacci F-symbol (e.g., Bonderson, Wang's notes, Kitaev appendix). It satisfies F² = I, F^T = F, |F|=1.

**Verdict:** VERIFIED. The summary's lem:F-invol proof (using φ^{-2}+φ^{-1}=1) is correct.

---

## 13. F^{σσσ}_σ Ising matrix

**Claimed:** def:ising-F (lines 1349–1358): F = (1/√2)·((1,1),(1,-1)).

**Standard fact:** This is the conventional Ising F-symbol (Hadamard up to normalization).

**Verdict:** VERIFIED.

---

## 14. RG/OPE exponent ansatz β ~ ρ^{h_a − Σh_b}

**Claimed:** def:RG-amp (lines 1526–1537) and lem:fib-beta. For τ×τ→1: ρ^{-4/5}; for τ×τ→τ: ρ^{-2/5}.

**Standard fact:** OPE φ_a(x) φ_b(0) ~ C^c_{ab} |x|^{Δ_c − Δ_a − Δ_b} φ_c(0). For a chiral theory, replace Δ with h. With h_1=0, h_τ=2/5:
- h_1 − 2h_τ = 0 − 4/5 = −4/5
- h_τ − 2h_τ = 2/5 − 4/5 = −2/5

**Verdict:** VERIFIED. The exponents −4/5 and −2/5 are correctly derived.

---

## 15. Polar-decomposition isometry E = B†(BB†)^{−1/2}

**Claimed:** thm:polar (lines 1557–1579): if B has full rank onto the coarse space, E := B†(BB†)^{−1/2} satisfies E†E = id.

**Verdict:** VERIFIED. The 4-line computation in the proof is bulletproof. Note however that the statement of "uniqueness" of the polar-decomposition section is not actually proved in the body; it's asserted.

---

## 16. Charge-only ascending channel eigenvalue is 0 (warn:charge-only)

**Claimed:** warn:charge-only (lines 1615–1624): for the binary Fibonacci ascending channel on End(Q) = span{P_1, P_τ}, eigenvalues are {1, X−P}. For both PF and coassociative, X = P = φ^{-2} or 1/D², so the non-trivial eigenvalue is 0.

**Standard fact:** From chat 2 lines 928–986: A maps (o_1, o_τ) by matrix ((X, 1−X), (P, 1−P)). Trace = 1 + (X−P), Det = X − P. So eigenvalues are 1 and X−P. PF: X = P = 1/D². Coassoc: X = P = φ^{-2}. Both give λ = 0.

**Verdict:** VERIFIED.

The physical interpretation in the summary ("the topological charge averaging washes out") is correct: this just says that for both natural splitting choices, the diagonal projector difference P_τ − P_1 averages to zero under the ascending channel. To recover λ = b^{-2/5} one must enrich the operator basis to include CFT primary/descendant content, which warn:charge-only correctly notes.

---

## 17. ★★ CRITICAL BUG: lem:binary-Z amplitudes are missing square roots ★★

**Claimed:** Summary lem:binary-Z (lines 1318–1332) gives the binary refinement amplitudes
- E_{I→(J,K)}(1) = (Z_1(x)Z_1(y)/Z_1(L)) · 1⊗1 + (φ Z_τ(x)Z_τ(y)/Z_1(L)) · (ττ)_1
- E_{I→(J,K)}(τ) = (Z_τ(x)Z_1(y)/Z_τ(L)) · τ⊗1 + (Z_1(x)Z_τ(y)/Z_τ(L)) · 1⊗τ + (φ^{-1} Z_τ(x)Z_τ(y)/Z_τ(L)) · (ττ)_τ

The "dilute regime" comment then claims these reduce to √(ℓ(J)/ℓ(I)).

**Standard fact / consistency check:** The general formula in summary def:rchild (lines 1290–1298) is
E_{I→(J_1,...,J_r)}(c) = (1/√Z_c(L)) · Σ_{a,α} M^c_{a,α} · √(∏_i Z_{a_i}(ℓ_i)) · v^c_{a,α}

For r=2, c=1, this gives coefficient of v^1_{ττ} = M^1_{ττ} · √(Z_τ(x)Z_τ(y)/Z_1(L)) = **√φ · √(Z_τ(x)Z_τ(y)/Z_1(L)) = √(φ Z_τ(x)Z_τ(y)/Z_1(L))**.

This does NOT match lem:binary-Z's "φ Z_τ(x)Z_τ(y)/Z_1(L)" — both the square root is missing AND the coefficient √φ vs φ. Similarly for the other entries: coefficient of v^τ_{ττ} should be **φ^{-1/2}·√(Z_τ(x)Z_τ(y)/Z_τ(L)) = √(φ^{-1}·Z_τ(x)Z_τ(y)/Z_τ(L))**, not "φ^{-1} Z_τ(x)Z_τ(y)/Z_τ(L)".

**Isometry verification:** With the correct (square-rooted) formula, the sum of squared amplitudes for E(1) is
[Z_1(x)Z_1(y) + φ Z_τ(x)Z_τ(y)] / Z_1(L) = Z_1(L)/Z_1(L) = 1 ✓

With lem:binary-Z's formula (no sqrt), the sum of squared amplitudes would be
[Z_1(x)²Z_1(y)² + φ²Z_τ(x)²Z_τ(y)²] / Z_1(L)² 

which is not equal to 1 (since Z_1(L)² = (Z_1(x)Z_1(y) + φZ_τ(x)Z_τ(y))² ≠ Z_1(x)²Z_1(y)² + φ²Z_τ(x)²Z_τ(y)² — the cross-term 2φZ_1(x)Z_1(y)Z_τ(x)Z_τ(y) is missing).

**Origin:** chat 4 lines 1766–1775 displays the same wrong formula; the summary copies it verbatim.

**Verdict:** WRONG. lem:binary-Z is internally inconsistent with def:rchild and with prop:rchild's own isometry condition. Furthermore, the dilute-regime statement that "one-particle localisation amplitudes reduce to √(ℓ(J)/ℓ(I))" is only consistent with the CORRECTED (square-rooted) formula, not with the displayed formula. The displayed formula would give ℓ(J)/ℓ(I) (no sqrt) in the dilute limit, which the summary's text itself contradicts.

**Recommended fix:** Replace lem:binary-Z with the square-rooted form:
- E_{I→(J,K)}(1) = √(Z_1(x)Z_1(y)/Z_1(L)) · 1⊗1 + √(φ Z_τ(x)Z_τ(y)/Z_1(L)) · (ττ)_1
- E_{I→(J,K)}(τ) = √(Z_τ(x)Z_1(y)/Z_τ(L)) · τ⊗1 + √(Z_1(x)Z_τ(y)/Z_τ(L)) · 1⊗τ + √(φ^{-1} Z_τ(x)Z_τ(y)/Z_τ(L)) · (ττ)_τ

This is the BIG BUG. Severity CRITICAL.

---

## 18. Z-recursion convolutional identities (eq:Z1conv, eq:Ztconv)

**Claimed:** def:Zfunc (lines 1262–1273):
- Z_1(x+y) = Z_1(x)Z_1(y) + φ Z_τ(x)Z_τ(y)
- Z_τ(x+y) = Z_τ(x)Z_1(y) + Z_1(x)Z_τ(y) + φ^{-1} Z_τ(x)Z_τ(y)

**Standard fact / consistency check:** These should correspond to the convolutional identities for sum of squared multiplication amplitudes. With |M^1_{11}|² = 1, |M^1_{ττ}|² = (√φ)² = φ; |M^τ_{τ1}|² = |M^τ_{1τ}|² = 1, |M^τ_{ττ}|² = (φ^{-1/2})² = φ^{-1}. So Z_1 has coefficients 1, φ and Z_τ has coefficients 1, 1, φ^{-1}. ✓

**Verdict:** VERIFIED. The convolution identities are internally consistent with lem:fib-special and def:fib-mult.

---

## 19. Exponential solution for Z (eq:Zexp)

**Claimed:** def:Zfunc (lines 1268–1273):
Z_1(L) = φ^{-2} e^{ρφL} + φ^{-1} e^{−ρL}, Z_τ(L) = φ^{-2}(e^{ρφL} − e^{−ρL})

**Spot check:** At L=0: Z_1(0) = φ^{-2} + φ^{-1} = 1 ✓ (using lem:fib-arith). Z_τ(0) = 0 ✓.

Check Z_1(x+y) = Z_1(x)Z_1(y) + φZ_τ(x)Z_τ(y). Expanding LHS:
Z_1(x+y) = φ^{-2} e^{ρφ(x+y)} + φ^{-1} e^{-(x+y)ρ} = φ^{-2} e^{ρφx}e^{ρφy} + φ^{-1} e^{-ρx}e^{-ρy}

Expanding Z_1(x)Z_1(y):
(φ^{-2} e^{ρφx} + φ^{-1} e^{-ρx})(φ^{-2} e^{ρφy} + φ^{-1} e^{-ρy})
= φ^{-4} e^{ρφ(x+y)} + φ^{-3} e^{ρφx} e^{-ρy} + φ^{-3} e^{-ρx} e^{ρφy} + φ^{-2} e^{-ρ(x+y)}

Expanding φZ_τ(x)Z_τ(y):
φ · φ^{-2}(e^{ρφx} - e^{-ρx}) · φ^{-2}(e^{ρφy} - e^{-ρy})
= φ^{-3} (e^{ρφ(x+y)} - e^{ρφx}e^{-ρy} - e^{-ρx}e^{ρφy} + e^{-ρ(x+y)})

Sum: (φ^{-4} + φ^{-3}) e^{ρφ(x+y)} + (φ^{-2} + φ^{-3}) e^{-ρ(x+y)} + 0·(mixed terms).

For this to equal Z_1(x+y) = φ^{-2}e^{ρφ(x+y)} + φ^{-1}e^{-ρ(x+y)} we need:
φ^{-4} + φ^{-3} = φ^{-2} → φ^{-3}(φ^{-1} + 1) = φ^{-2} → φ^{-3}·φ = φ^{-2} ✓ (since 1+φ^{-1} = φ)
φ^{-2} + φ^{-3} = φ^{-1} → φ^{-3}(1+φ) = φ^{-1} → φ^{-3}·φ² = φ^{-1} ✓ (since 1+φ = φ²)

**Verdict:** VERIFIED. The exponential solution satisfies the convolution identity. (The summary punts on this check, but it works.)

---

## 20. Dilute regime claim Z_τ(ℓ) ~ ρℓ, Z_1(ℓ) ~ 1

**Spot check:** Small-L expansion: Z_τ(L) = φ^{-2}(e^{ρφL} - e^{-ρL}) = φ^{-2}((1+ρφL+...) - (1-ρL+...)) = φ^{-2}(ρφL + ρL + O(L²)) = φ^{-2} ρL(φ+1) = φ^{-2} ρL φ² = ρL ✓. Z_1(L) → φ^{-2}·1 + φ^{-1}·1 = 1 ✓.

**Verdict:** VERIFIED.

---

## 21. Coassociative Fibonacci system has unique positive solution

**Claimed:** thm:coassoc and the elaborate proof (lines 1014–1120). Solution: x = φ^{-1}, y = φ^{-1/2}, p = q = φ^{-1}, r = φ^{-3/2}.

**Spot check independently:** Constraints x²+y²=1; 2x²+r²=1; r²=φ^{-3/2}xy.
- x = φ^{-1} → x² = φ^{-2}. y² = 1 - φ^{-2} = φ^{-1} (using lem:fib-arith). y = φ^{-1/2}. ✓
- r² = 1 - 2x² = 1 - 2φ^{-2} = φ^{-1} - φ^{-2} = φ^{-2}(φ-1) = φ^{-2}·φ^{-1} = φ^{-3}. r = φ^{-3/2}. ✓
- Cross-check r² = φ^{-3/2}xy = φ^{-3/2}·φ^{-1}·φ^{-1/2} = φ^{-3}. ✓

**Verdict:** VERIFIED. The quadratic-in-u algebra in steps 3–4 is correct.

---

## 22. PF (Perron–Frobenius) Fibonacci splitting

**Claimed:** def:PF and lem:PF-isom (lines 958–995). Components: x_PF = 1/D, y_PF = φ/D, p_PF = q_PF = 1/D, r_PF = √φ/D.

**Spot check:** Σ A^a_{bc}² = sum over allowed (b,c) of d_b d_c / (d_a D²).
- a=1: (1·1 + φ·φ)/(1·D²) = (1+φ²)/D² = D²/D² = 1 ✓
- a=τ: (φ·1 + 1·φ + φ·φ)/(φ·D²) = (2φ+φ²)/(φD²) = (2+φ)/D² = 1 ✓

**Verdict:** VERIFIED. Note these are distinct from the coassociative solution (e.g., x_PF = 1/√(2+φ) ≈ 0.526 vs x_coassoc = φ^{-1} ≈ 0.618), as warn:PF-coassoc correctly notes.

---

## 23. Fibonacci dagger-special algebra has λ = φ²

**Claimed:** lem:fib-special (lines 1190–1205): mm† = φ² id_A.

**Spot check:** 1-block: 1 + (√φ)² = 1+φ = φ² ✓. τ-block: 1 + 1 + (φ^{-1/2})² = 2+φ^{-1}. Need 2+φ^{-1} = φ². But φ² = φ+1 and φ = 1+φ^{-1}, so φ+1 = 2+φ^{-1}. ✓

**Verdict:** VERIFIED.

---

## 24. Square-zero "branch a" associativity satisfied but dagger-specialness violated

**Claimed:** thm:branches(a) and warn:sq-zero-is-special: a=b=0 is associative but mm† = block-diag(1, 2) is not a scalar.

**Spot check:** mm†|_1 = 1+|a|² = 1. mm†|_τ = 2+|b|² = 2. Unequal → no scalar λ. ✓

**Verdict:** VERIFIED. This is a sharp categorical observation (and not in chat 4 directly — the summary's synthesis is correct).

---

## 25. Coassociative solution arises as canonical Δ = m†/√λ

**Claimed:** cor:Delta-coassoc (lines 1207–1227): Δ(1) = φ^{-1}·1⊗1 + φ^{-1/2}·v^1_{ττ}; Δ(τ) = φ^{-1}·τ⊗1 + φ^{-1}·1⊗τ + φ^{-3/2}·v^τ_{ττ}.

**Spot check:** Δ = m†/φ. m†|_1 has amplitudes 1 on 1⊗1 and √φ on (ττ)_1. Divide by φ: φ^{-1} and √φ/φ = φ^{-1/2}. ✓
m†|_τ has amplitudes 1 on 1⊗τ, 1 on τ⊗1, φ^{-1/2} on (ττ)_τ. Divide by φ: φ^{-1}, φ^{-1}, φ^{-3/2}. ✓

**Verdict:** VERIFIED. Matches thm:coassoc.

---

## 26. Pair-creation amplitudes A_{x,z} in def:pair-create

**Claimed:** def:pair-create (lines 1640–1654): A_{1,τ}=1, A_{τ,1}=φ^{-1}, A_{τ,τ}=φ^{-1/2}. Check |A_{τ,1}|² + |A_{τ,τ}|² = φ^{-2}+φ^{-1} = 1.

**Standard fact:** These are entries of F^{τττ}_τ used to compute the coevaluation amplitude. They match the standard Fibonacci F-matrix interpretation: when inserting a vacuum (ττ)_1 pair next to an ambient τ, the resulting state in the left-association {e_1, e_τ} basis has component (φ^{-1}, φ^{-1/2}) on the (1, τ) channels respectively.

**Verdict:** VERIFIED.

---

## 27. Gram obstruction φ^{-1} in non-tree pair creation (lem:Gram)

**Claimed:** lem:Gram (lines 1667–1685): ⟨(ττ)_1 τ | τ (ττ)_1⟩ = φ^{-1}.

**Standard fact:** This is the (1,1) entry of F^{τττ}_τ = φ^{-1}. ✓

**Verdict:** VERIFIED.

---

## 28. Sidelobe stencil amplitudes (def:sidelobe)

**Claimed:** def:sidelobe (lines 1694–1715): |a|² = |λ|²/(φ + 2|λ|²), |b|² = φ/(φ + 2|λ|²).

**Spot check:** Constraints |b|² + 2|a|² = 1 and |a|² = |b|²|λ|²/φ. Substituting: |b|²(1 + 2|λ|²/φ) = 1, so |b|² = φ/(φ + 2|λ|²) and |a|² = |λ|²/(φ + 2|λ|²). ✓

**Verdict:** VERIFIED.

---

## 29. Koo–Saleur κ for Ising (chat 1 line 757)

**Claimed:** chat 1 line 757: κ = γ/(π sin γ) = (π/4)/(π·√2/2) = 1/(2√2). The summary itself does not carry this formula explicitly — only conjecture conj:KS mentions Koo–Saleur as unverified.

**Standard fact:** For Ising at γ = π/4: sin γ = √2/2, so γ/(π sin γ) = (π/4)/(π·√2/2) = (π/4)·(2/(π√2)) = 1/(2√2). ✓

**Verdict:** VERIFIED. The chat's arithmetic is correct.

---

## 30. Koo–Saleur velocity v = 2√2 for Ising (chat 1 line 801)

**Claimed:** chat 1 line 801 (OCR-mangled): v = π sin γ / γ = 2√2 for γ = π/4.

**Spot check:** π·sin(π/4)/γ = π·(√2/2)/(π/4) = (π√2/2)·(4/π) = 2√2. ✓

**Standard fact:** The TL/XXZ sound velocity depends on the normalization. Koo–Saleur's original paper has a specific convention. The summary does not commit to this number, only flagging the Koo–Saleur generators as conjectural.

**Verdict:** Arithmetic is consistent; the physical claim is unverifiable from the transcripts alone and is correctly flagged \unchecked. The "v = π sin γ/γ" formula deserves a literature reference at Stage 2.

---

## 31. Mapping ε ~ e_{2r-1} - e_{2r} on the lattice

**Claimed:** chat 1 lines 526–544 (and discussion of conformal tuning by killing the staggered TL coupling): ε^{lat}_r ∝ e_{2r-1} - e_{2r} = (1/√2)(X_r - Z_r Z_{r+1}).

**Spot check:** Using lem:e-odd and lem:e-even:
e_{2r-1} - e_{2r} = (1+X_r)/√2 - (1+Z_r Z_{r+1})/√2 = (X_r - Z_r Z_{r+1})/√2. ✓

This is the lattice version of the energy operator (Δ_ε = 1), and equating its coefficient to zero gives the critical TFI = Kramers–Wannier self-dual point.

**Verdict:** VERIFIED.

---

## 32. Ising labels: chats sometimes use ε for what summary calls ψ

**Audit:** Chat 2 line 1993 writes σ⊗σ = 1 ⊕ ε (using ε for the categorical fermion). Chat 1 lines 153–169 distinguishes σ (categorical simple) from Σ (bulk spin field), and writes the third primary as ψ but also uses "ε" later for the bulk energy field. The summary cleanly resolves this by using ψ for the categorical third simple and Σ, ε for the bulk fields.

**Verdict:** The notation is potentially confusing in the chats but does not lead to incorrect calculations. The summary's renaming is helpful and consistent.

---

## 33. Fibonacci/τ vs Ising/σ confusion check

**Audit:** Searched all chats for confusion between σ⊗σ = 1⊕ψ (Ising) vs τ⊗τ = 1⊕τ (Fibonacci). Found none. The chats and summary consistently distinguish the two examples and apply each fusion rule appropriately.

**Verdict:** CLEAN.

---

## 34. Symmetric example η^min(ρ) probabilities for Fibonacci (chat 2 §8)

**Claimed:** chat 2 lines 854–882: For b=2, ρ=1/2, j_L=j_R=1/√2, u_0=u_I=u_τ=1:
- P(τ→ττ) = ρ^{-4/5}/(1+ρ^{-4/5}) = 2^{4/5}/(1+2^{4/5}) ≈ 0.6352
- P(1→ττ) = ρ^{-8/5}/(1+ρ^{-8/5}) = 2^{8/5}/(1+2^{8/5}) ≈ 0.7519

**Spot check:** 2^{4/5} ≈ 1.7411, 2^{8/5} = (2^{4/5})² ≈ 3.0314.
P(τ→ττ) = 1.7411/(1+1.7411) ≈ 1.7411/2.7411 ≈ 0.6352 ✓
P(1→ττ) = 3.0314/4.0314 ≈ 0.7519 ✓

**Verdict:** VERIFIED.

---

## 35. lem:fib-arith identities

**Claimed:** lem:fib-arith (lines 866–890):
- φ^{-1} = φ-1
- φ^{-2} = 2-φ
- φ^{-2} + φ^{-1} = 1
- 2φ^{-2} + φ^{-3} = 1

**Spot check:**
- φ² = φ+1 → 1 = φ - φ^{-1} → φ^{-1} = φ - 1 ✓
- φ^{-2} = (φ-1)² = φ² - 2φ + 1 = (φ+1) - 2φ + 1 = 2-φ ✓
- φ^{-2} + φ^{-1} = (2-φ) + (φ-1) = 1 ✓
- φ^{-3} = φ^{-1}·φ^{-2} = (φ-1)(2-φ) = 2φ-φ²-2+φ = 3φ-φ-1-2 = 2φ-3. Then 2(2-φ) + (2φ-3) = 4-2φ+2φ-3 = 1 ✓

**Verdict:** VERIFIED.

---

## 36. Total quantum dimension D² = 1+φ² = 2+φ for Fibonacci

**Claimed:** lem:fib-qdim (lines 892–902): D² = 1 + φ² = 2 + φ.

**Spot check:** 1+φ² = 1+(φ+1) = 2+φ. ✓

**Verdict:** VERIFIED.

---

## 37. Quantum dimension d_σ = √2 for Ising

**Claimed:** def:ising (line 1345): d_σ² = 1+1 = 2, so d_σ = √2.

**Standard fact:** d_σ² = d_1 + d_ψ = 1+1 = 2 (from σ⊗σ = 1⊕ψ and the dimension recursion). ✓

**Verdict:** VERIFIED. (Equivalently d_σ = 2cos(π/4) = √2.)

---

## 38. m=3,4 cases of unitary minimal series

**Claimed:** warn:fibCFTs (line 1513): "M(4,5) has c = 1 - 6/(4·5) = 7/10." chat 1 lines 974–984 verifies m=3 gives c=1/2 (Ising) and m=4 gives c=7/10 (tricritical Ising).

**Spot check:** c_m = 1 - 6/(m(m+1)). c_3 = 1 - 6/12 = 1/2 ✓; c_4 = 1 - 6/20 = 14/20 = 7/10 ✓.

**Verdict:** VERIFIED.

---

## 39. General TL → M(m,m+1) Koo–Saleur formula (chat 1 §13)

**Claimed:** chat 1 lines 992–998: For γ = π/(m+1):
c = 1 - 6γ²/(π(π-γ)) = 1 - 6/(m(m+1))

**Spot check:** π - γ = π - π/(m+1) = πm/(m+1). So 6γ²/(π(π-γ)) = 6·(π²/(m+1)²)/(π·πm/(m+1)) = 6/(m(m+1)). ✓

**Verdict:** VERIFIED.

---

## 40. Polar decomposition of the example fine-graining (example:fib-RG)

**Claimed:** ex:fib-RG (lines 1595–1605) gives η_1, η_τ for the no-mixing Fibonacci RG. The denominators are √(|u_0|² + |u_I|²ρ^{-8/5}) and √(|j_L|² + |j_R|² + |u_τ|²ρ^{-4/5}).

**Spot check:** Sum of |β|² for vacuum sector: |β^1_{11}|² + |β^1_{ττ}|² = |u_0|² + |u_I|²ρ^{-8/5}. ✓
Sum for τ sector: |β^τ_{τ1}|² + |β^τ_{1τ}|² + |β^τ_{ττ}|² = |j_L|² + |j_R|² + |u_τ|²ρ^{-4/5}. ✓

**Verdict:** VERIFIED. cor:nomix applied correctly.

---

## 41. Stress tensor OPE T(z)T(0) ~ c/2/z^4 + ...

**Claimed:** def:stress (lines 1478–1483): T(z)T(0) ~ c/(2z^4) + 2T(0)/z² + ∂T(0)/z + ...

**Standard fact:** Standard BPZ form; correct.

**Verdict:** VERIFIED.

---

## 42. Configuration decomposition (prop:conf-decomp)

**Claimed:** prop:conf-decomp (lines 215–235): H_N^W ≅ ⊕_{(a_1,...,a_N)} Hom(W, a_1⊗...⊗a_N).

**Standard fact:** Distributing Hom(W, ·) over the biproduct Q^⊗N follows from semisimplicity. Standard categorical fact.

**Verdict:** VERIFIED.

---

## 43. Length-weighted refinement isometry (lem:sqzero-isom)

**Claimed:** lem:sqzero-isom (lines 734–754): ‖E_I(p_I)‖² = Σ_J ℓ(J)/ℓ(I) = 1.

**Spot check:** Σ_J ℓ(J) = ℓ(I) (disjoint exhaustive partition), so Σ_J ℓ(J)/ℓ(I) = 1. ✓

**Verdict:** VERIFIED.

---

## 44. Refinement coherence (lem:sqzero-coh)

**Claimed:** lem:sqzero-coh (lines 756–773): w_{J|I}·w_{K|J} = √(ℓ(J)/ℓ(I))·√(ℓ(K)/ℓ(J)) = √(ℓ(K)/ℓ(I)) = w_{K|I}.

**Verdict:** VERIFIED. Algebraic identity.

---

## 45. L²(X) recovery (thm:L2)

**Claimed:** thm:L2 (lines 777–797): For W=p single species, H_∞^p ≅ L²(X) under |I⟩_P ↔ ℓ(I)^{-1/2}·χ_I.

**Verdict:** VERIFIED, given the standard inductive-limit construction of L².

---

## 46. ★ MINOR INCONSISTENCY: "Refinement map" σ-conventions across chats

**Audit:** Chat 1 §11 line 1087 says "for TL/Ising, refinement must use a two-σ unit cell". The summary lifts this to lem:path-adj with even heights forced to 2 (= σ) and refinement structure preserving this. There is a subtle bookkeeping issue: the dense σ-Hilbert space H_N^dense = Hom(c, σ^⊗N) only allows fusion paths with σ-σ adjacency, but the binary refinement "σ → σ⊗σ" is impossible since σ ⊄ σ⊗σ. The chats handle this by going to a 2-site unit cell. The summary doesn't make this point explicit.

**Verdict:** MINOR. Documentation gap rather than mathematical error.

---

## 47. Sigma-block CFT identification in the dense sector

**Audit:** The summary's identification of TL_{√2} ↔ M(3,4) is correct, but the role of the categorical σ vs the bulk Σ should be clearer when discussing the dense sector. The chats sometimes loosely call σ the spin field, but the chats and summary both correctly note (chat 1 line 169) that σ is the categorical/defect anyon while Σ is the bulk operator.

**Verdict:** NITPICK. Notation is functional but could be tightened.

---

## 48. Scaling exponent for chiral vs nonchiral CFT

**Audit:** def:scalop (line 1611) correctly distinguishes b^{-Δ_i} (nonchiral, with Δ = h + h̄) from b^{-h_i} (chiral). lem:fib-beta uses the chiral convention (h_τ = 2/5 for (G_2)_1). For the (hypothetical) diagonal Fibonacci CFT, Δ_τ = 4/5, giving λ = b^{-4/5}.

**Verdict:** VERIFIED. Both conventions are correctly handled.

---

## 49. Quantum dimension for Fibonacci d_τ = φ

**Claimed:** lem:fib-qdim (lines 892–902): d_τ² = d_τ + 1 has positive root φ.

**Spot check:** φ² = φ + 1 ✓ (by definition of φ).

**Verdict:** VERIFIED.

---

## 50. (G_2)_1 vs Yang-Lee/M(2,5) — non-unitary alternative?

**Audit:** The Yang-Lee minimal model M(2,5) has c = -22/5 and the only non-trivial primary has h = -1/5. This is a non-unitary CFT, but it has Fibonacci-like fusion (τ_YL ⊗ τ_YL = 1 ⊕ τ_YL) when restricted to scaling structure. The summary uses chiral (G_2)_1 (unitary, c=14/5, h_τ=2/5) and the chats only consider this one. They DO NOT confuse it with Yang-Lee. ✓

**Verdict:** CLEAN.

---

# Severity ratings

## CRITICAL
- **#17 lem:binary-Z missing square roots and wrong coefficient (√φ vs φ, etc.).** This is a real bug in the summary's two-child Fibonacci formula. It is internally inconsistent with the summary's own def:rchild and prop:rchild. The bug propagates from chat 4 lines 1766–1775 verbatim. Fix: insert square roots throughout lem:binary-Z. Recommended replacement provided.

## MAJOR
- None. The other identified items are either correct or notation/documentation issues.

## MINOR
- **#46** dense-sector refinement bookkeeping (σ ⊄ σ⊗σ) underdescribed in summary; should explicitly link to chat 1's "two-σ unit cell" workaround.
- **#30** Koo–Saleur sound-velocity formula v = π sin γ / γ used in chat 1 is plausible but needs a Stage-2 reference; summary correctly punts.

## NITPICK
- **#47** σ vs Σ notation slightly loose in some prose. Notation is consistent enough not to cause errors.
- The summary's "uniqueness" claim in thm:polar is asserted without proof of uniqueness (only existence proved).

# VERIFIED (notable correct claims that required checking)

- **OCR typo theory** (#1): all "c=12"/"c=21" instances in chats genuinely mean c=1/2; correction is exhaustively justified.
- **(G_2)_1 c=14/5** (#6): exactly 1·14/(1+4) by Sugawara formula.
- **h_τ = 2/5 for (G_2)_1** (#7): standard but worth confirming.
- **Antiferromagnetic golden chain → tricritical Ising c=7/10** (#8): matches Feiguin et al PRL 2007.
- **Central charge anomaly check c/2 = 1/4** (#5): correct Virasoro coefficient.
- **κ_Ising = 1/(2√2)** (#29): arithmetic clean.
- **Δ_ε = 1, Δ_Σ = 1/8** (#3): correctly invokes Δ = h + h̄ for diagonal CFT.
- **TL → critical TFI mapping** (#11): A_3 Perron-Frobenius vector (1, √2, 1) correct, factor of 1/√2 correct.
- **C_{σσε} = 1/2** (#4): standard normalization, exact.
- **Convolutional Z-recursions and exponential solution** (#18, #19, #20): full algebraic check confirms internal consistency.
- **Coassociative quartic Au² - Au + 1 with A = 1+2φ** (#21): nontrivial computation checks out.

# Summary

The CFT/RG content of the summary is overwhelmingly correct after the OCR repairs. **The one real bug** is in `lem:binary-Z`: the two-child Fibonacci refinement amplitudes are written without their required square roots and with squared moduli of the multiplication coefficients (e.g. φ instead of √φ). The same bug appears verbatim in chat 4 lines 1766–1775. The bug is detected by:
1. internal inconsistency with the summary's own `def:rchild` (which does have the square roots) and `prop:rchild`;
2. failure of the isometry condition when checked directly;
3. internal inconsistency with the summary's own dilute-regime claim that amplitudes reduce to √(ℓ(J)/ℓ(I)).

All identifications with standard CFT data (Ising, tricritical Ising, (G_2)_1 Fibonacci) are correct. The arithmetic across the F-matrix, Virasoro central-charge anomaly, OPE exponents, and finite-size formulas is clean. The chat-vs-summary notational rationalization (ψ for categorical Ising primary, Σ/ε for bulk fields) is helpful and consistent.
