# Hostile Categorical Review of `summary.tex`

Adversarial categorical critique of `/home/tobias/Projects/cft-anyons/summary.tex` against `chat1.md`–`chat4.md`. Focus: foundations, definitions, coherence, conventions. Anything ambiguous is treated unfavourably.

---

## 1. (CRITICAL) The remark "dagger-special = Frobenius-special" is wrong as stated

**(a) Summary's claim.** Remark following Def. 4.1 (lines 380–392):

> "[Dagger-specialness] is the categorical sibling of the 'Frobenius-special' condition used in 2D rational CFT (the FRS programme); a Frobenius-special algebra is one which is simultaneously a special algebra and a special coalgebra with compatible structure."

This is reinforced by the introduction to §4 (line 354): "the correct categorical name for that extra structure is an *algebra object* in $\Cc$" — and the entire chapter is built on the dagger-special algebra $(A,m,u)$, never mentioning the Frobenius axiom explicitly.

**(b) Location.** `summary.tex` lines 363–417 (Def. 4.1, Remark, Prop. 4.4).

**(c) Why it is wrong.** "Dagger-special" only requires the triple $(A,m,u)$ with $m m^\dagger = \lambda\,\id_A$ (a scalar). A **(special) Frobenius algebra** in a monoidal category requires, in addition to algebra and coalgebra structure, the **Frobenius identity**
$$
(\id_A\otimes m)\circ(\Delta\otimes \id_A) \;=\; \Delta\circ m \;=\; (m\otimes\id_A)\circ(\id_A\otimes\Delta),
$$
which couples $m$ and $\Delta$. With $\Delta := m^\dagger$, this becomes a non-trivial constraint on $m$ alone (not implied by associativity of $m$). The summary never states or invokes this identity, never proves it for the Fibonacci $(A=\one\oplus\tau, m)$ of Def. 6.10, and yet refers to a "Frobenius-special" object as the standard name.

For Fibonacci specifically the algebra likely *is* Frobenius (it is the regular algebra / "vacuum-charge" algebra), but the summary nowhere checks this — Lemma 6.11 only checks associativity, and Lemma 6.12 only checks dagger-specialness ($mm^\dagger = \varphi^2\id$). The Frobenius identity is asserted-by-name without proof or definition.

**(d) Correct statement.** Either:
1. Drop the Frobenius vocabulary and call the structure "(symmetric/dagger-)special algebra" (sometimes called a "non-Frobenius special algebra"), and don't claim equivalence with the FRS Frobenius algebras; or
2. Add the Frobenius identity to Def. 4.1, prove it in Lemma 6.11 for Fibonacci, and verify the FRS terminology is appropriate.

Without either, the FRS-programme parallel in Remark 4.3(b) is unsupported and the term "Frobenius-special" is misused.

---

## 2. (CRITICAL) "Δ is an isometric *co*multiplication" is overreach in the same remark

**(a) Summary's claim.** Remark 4.3(a): "[Dagger-specialness] makes the rescaled adjoint $\Delta:=\lambda^{-1/2}m^\dagger$ into an isometric *co*multiplication."

**(b) Location.** Lines 383–386.

**(c) Why it is wrong.** The proof of Prop. 4.4 (lines 407–415) only establishes $\Delta^\dagger\Delta = \id$, i.e. that $\Delta$ is an **isometry**. It never proves coassociativity of $\Delta$. To call $\Delta$ a "comultiplication" requires checking
$$
(\Delta\otimes\id)\circ\Delta \;=\; (\id\otimes\Delta)\circ\Delta
$$
up to the associator. This is a separate axiom that does **not** follow from $mm^\dagger=\lambda\id_A$ alone. In general, even if $m$ is associative, $m^\dagger$ need not be coassociative unless additional structure (e.g. Frobenius, or that $m$ comes from a symmetric Frobenius pairing) is imposed.

The hidden assumption: in a unitary fusion category, if $m$ is associative then $m^\dagger$ is coassociative *as a morphism* because dagger is a contravariant strict-monoidal functor reversing composition; it sends associativity diagrams to coassociativity diagrams. So Δ IS coassociative as a consequence of $m$ being associative + $\dagger$ being strict monoidal. But this is *not* what the proof shows, and it relies on assumptions about the dagger structure (specifically that the associator is *unitary*) that the summary leaves implicit.

**(d) Correct statement.** The remark/proposition pair should:
1. State explicitly that $\Delta := m^\dagger$ is automatically a comultiplication because $\dagger$ is a contravariant monoidal functor; this uses unitarity of the associator (Convention 2.1 implicitly).
2. Distinguish "isometric" (a Hilbert-space-theoretic property of $\Delta$ as a linear map) from "comultiplicative" (the coalgebra axiom).
3. Either prove or assume the Frobenius axiom separately if it's needed downstream.

---

## 3. (CRITICAL) The "non-degenerate Fibonacci" algebra is never shown to be Frobenius, yet `\Delta = \varphi^{-1} m^\dagger` is identified with the **coassociative** isometric splitting

**(a) Summary's claim.** Cor 6.7 (lines 1207–1227): "$\Delta := \varphi^{-1} m^\dagger$ is the coassociative isometric splitting of Theorem 6.5."

**(b) Location.** Lines 1207–1227.

**(c) Why it is suspect.** The proof simply reads off components and notes they match Theorem 6.5's numerical values $x=\varphi^{-1}, y=\varphi^{-1/2}, p=q=\varphi^{-1}, r=\varphi^{-3/2}$. Theorem 6.5 establishes these are the unique solution of the **coassociativity equations (C1)–(C2)** plus normalisation. Cor 6.7 claims this matches "$\varphi^{-1} m^\dagger$" where $m$ is the multiplication from Def 6.10.

But Theorem 6.5 imposed: $(\eta\otimes\id)\eta = (\id\otimes\eta)\eta$ (coassociativity of $\eta$), and reduced this to the F-fixed-point equation. The same equation $r^2 = \varphi^{-3/2} xy$ arose. Now $\Delta = \varphi^{-1} m^\dagger$ automatically satisfies coassociativity *if and only if* $m^\dagger$ is coassociative, which (as in Issue 2) requires $m$ associative + unitary associator + the dagger reversing associativity. Lemma 6.11 only shows $m$ associative. The unitarity of the associator is implicit. So the identification is morally correct, but the chain of reasoning is **not laid out**.

What is genuinely conflated: the F-fixed-point equation is the **same** for $m$ associative as for $m^\dagger$ coassociative because both translate to the matrix being fixed by $F$. So the equations match by coincidence of the F-symbol being F-invariant on $(x,y,r^2) = (\sqrt\varphi, \varphi^{-1})$. The summary should either prove this directly or cite it as a fact.

**(d) Correct statement.** Should explicitly invoke: in a unitary fusion category, $m$ associative ⟺ $m^\dagger$ coassociative (because $\dagger$ is a monoidal involution and the associator is unitary). Then Cor 6.7 follows from Lemma 6.11.

---

## 4. (MAJOR) The summary misstates the "splitting basis" orthonormality

**(a) Summary's claim.** Def 3.2 (lines 145–154):
> "For each ordered triple $(a,b,c)$ with $N^a_{bc}\ge 1$, fix an orthonormal basis $\{v^a_{b,c;\mu}\}\subset\Hom_\Cc(a,\,b\otimes c)$."

The inner product on $\Hom_\Cc(a, b\otimes c)$ is given by Conv 2.1 only "for $X$ simple", where $X$ here is the *source* $a$. So this works (source $a$ is simple), and orthonormality means $(v^a_{b,c;\mu})^\dagger v^a_{b,c;\mu'} = \delta_{\mu\mu'} \id_a$.

**(b) Location.** Lines 132–134 (inner product convention), lines 145–154 (splitting basis).

**(c) Why it is suspect.** The inner product convention only addresses the case of equal source and target *simple*. The general formula $\langle f, g\rangle\id_X = f^\dagger \circ g$ requires $f, g: X \to Y$ for some target $Y$ — so it gives inner product on $\Hom(X, Y)$ when $X$ is simple. Good. But the summary never explicitly defines what "orthonormal" means across **different channels** $c \neq c'$:
$$
(v^a_{b,c})^\dagger v^a_{b,c'} \;\stackrel{?}{=}\; 0 \quad\text{when } c\neq c'?
$$
This is needed for the Prop 4.8 computation ("$m\circ v^{\one}_{p,p} = a\,\id_\one$" while using orthogonality of $v^{\one}_{p,p}$ from $v^p_{p,p}$). Strictly, $v^{\one}_{p,p}: \one \to p\otimes p$ and $v^p_{p,p}: p \to p\otimes p$ have *different sources*, so $(v^p)^\dagger v^{\one}: \one \to p$, which lives in $\Hom(\one, p) = 0$. So the cross-overlap **automatically** vanishes. But the summary writes this as if it were an additional convention.

More importantly: in Prop 4.7, the splitting vector $v^{\one}_{p,p}\in\Hom(\one, p\otimes p)$ is normalised so that $(v^{\one}_{p,p})^\dagger v^{\one}_{p,p} = \id_\one$. But the dagger requires choosing an inner product on $\Hom(\one, p\otimes p)$ as a vector space. The space $\Hom_\Cc(\one, p\otimes p)$ has dimension $N^{\one}_{p,p} = 1$, so this is a one-dimensional Hilbert space and the normalisation is just "pick a unit vector". This is implicit.

**(d) Correct statement.** Either:
1. Convention should explicitly state: for $X$ semisimple, the canonical inner product on $\Hom(W, X)$ for $W$ simple is induced by the dagger structure; splitting basis vectors $v^a_{b,c;\mu}$ for different $(a, \mu)$ live in distinct vector spaces $\Hom(a, b\otimes c)$ with orthogonality between them being vacuous; within a single Hom-space, $\mu$ runs over an orthonormal basis.
2. The "orthogonality" claim in Prop 4.8 (line 583: "$v^1_{p,p}$ as a dagger pair") should be stated more carefully — the dagger pair structure between simple-source splitting and simple-target fusion vectors is what's being used.

---

## 5. (MAJOR) The occupation object $Q = \bigoplus_a a$ has a coherence trap not addressed

**(a) Summary's claim.** Def 3.4 (lines 188–199): $Q := \bigoplus_{a\in\Irr(\Cc)} a$.

**(b) Location.** Lines 188–199, plus the entire usage of $Q^{\otimes N}$ throughout.

**(c) Why it is suspect.** A "direct sum of all simples" $Q$ is a well-defined object in any semisimple category. But for the construction to be canonical we need:
1. A *chosen* family of inclusions $\iota_a: a \hookrightarrow Q$ that are isometries in the unitary case.
2. The biproduct structure must be coherent: $\pi_b\circ\iota_a = \delta_{ab}\id_a$.

The summary states "choosing the biproduct inclusions $a\hookrightarrow Q$ as isometries makes the decomposition unitary" (line 234) but this is a *choice* that should be fixed once at the start. Without it, the splitting-basis $\{v^a_{b,c;\mu}\}$ and the configuration-decomposition Prop 4.2 inherit gauge ambiguities — for example, $v^a_{b,c}$ is only defined up to a phase. This phase ambiguity propagates into F-symbols (which are gauge-dependent) and into the algebra structure constants $a, b$ in §5.

The summary does not state the gauge convention. It then computes specific numerical amplitudes ("$a = \sqrt\varphi$, $b = \varphi^{-1/2}$") which are gauge-dependent and only have meaning relative to a fixed splitting-basis gauge.

Note Remark 8.2 (line 1735) acknowledges this for F-symbols but not for splitting bases or the algebra constants $a, b$.

**(d) Correct statement.** A Convention should fix: choice of inclusion isometries $\iota_a:a\hookrightarrow Q$; choice of basis vectors $v^a_{b,c;\mu}\in\Hom(a,b\otimes c)$; then F-symbols, $a, b$ in §5, and all numerical amplitudes are derived in that gauge. Currently the summary computes in an unspecified gauge.

---

## 6. (MAJOR) The "vacuum-charge re-interpretation" is categorically muddled

**(a) Summary's claim.** Warning 6.8 (lines 1231–1254): "if $E(\one) = $ empty only $\Rightarrow$ no coherent nonzero $\tau\to\tau\otimes\tau$ splitting." The conclusion: $\one\subset Q$ must be "total vacuum charge", including unresolved $\tau\tau$ pairs.

**(b) Location.** Lines 188–199 (Def 3.4), 1229–1254 (Warning 6.8), 1823–1830 (critique section).

**(c) Why it is suspect.** $\one$ is the unit object of the fusion category $\Cc$. It is, by definition, simple. The phrase "$\one$ contains unresolved $\tau\tau$ pairs" is, at the categorical level, **nonsense**: $\one$ is the unit object, not a state space. What is going on is a confusion of two different roles:

- The **categorical object** $\one\subset Q$, which is the unit of $\otimes$. It is unconditionally simple in a fusion category.
- The **state vector** in $A_I = \one\oplus p$ corresponding to the $\one$-summand at cell $I$, which the summary names $\one_I$ informally.

The "reinterpretation" is about the latter, not the former. The summary should never write "$\one$ contains unresolved content" — it should write "$\one_I$ (the $\one$-summand of $A_I$) represents the *total vacuum charge* of cell $I$, including the possibility of unresolved $\tau\tau$ pairs". 

Worse, the boxed conclusion (line 1248–1251) literally says "$E(\one) = \text{empty only} \Rightarrow$ no coherent nonzero $\tau\to\tau\otimes\tau$ splitting". This conflates:
- $E$ defined on the *summand* $\one$ of $A_I$;
- the categorical unit object $\one$.

These are not the same. Categorically, the morphism $E:A_I \to A_J\otimes A_K$ when restricted to the $\one$-summand gives a morphism $\one\to A_J\otimes A_K = (\one\oplus p)\otimes(\one\oplus p)$ whose components in the $\one\otimes\one, \one\otimes p, p\otimes\one, p\otimes p$ summands are independent morphisms (some forced to vanish by $\Hom(\one,p) = 0$, etc.).

The actual content of Warning 6.8 is: if the morphism $E|_\one$ has non-zero component only in $\one\otimes\one$ (i.e. doesn't create a vacuum pair), then the three-cell coherence fails. This is a valid observation, but framing it as "$\one$ means total vacuum charge" is confused.

**(d) Correct statement.** The warning should read: "On the local algebra $A_I = \one\oplus p$, the component $E_{I\to(J,K)}|_{\one\text{-summand}}:\one\to A_J\otimes A_K$ must have a non-zero component in the $p_J\otimes p_K$ summand (the vacuum-channel pair) for the three-cell associativity to be coherent." This is just the statement that the *coefficient* $y$ in the splitting ansatz $\eta_\one = x v^\one_{\one\one} + y v^\one_{\tau\tau}$ must be non-zero — exactly Theorem 6.5 with $y = \varphi^{-1/2} \neq 0$.

The "$\one$ means vacuum charge" gloss is at best informal physics language; categorically it is not a re-interpretation of the unit object.

---

## 7. (MAJOR) The inductive limit Hilbert-space construction is incomplete

**(a) Summary's claim.** Def 4.3 (lines 316–325):
> "A *compatible family* of refinement maps satisfies $E_{P\to P} = \id$ and, for $P\preceq P'\preceq P''$, $E_{P'\to P''}\,E_{P\to P'} = E_{P\to P''}$. The continuum Hilbert space ... is the Hilbert completion of the algebraic direct limit $\Hh_\infty^W := \overline{\varinjlim_P \Hh_P^W}$."

**(b) Location.** Lines 316–325.

**(c) Why it is incomplete.** A directed system of Hilbert spaces $\{\Hh_P, E_{P\to P'}\}_P$ with **isometric** linking maps does indeed have a Hilbert-space inductive limit, and it equals the closure of the algebraic union. But:

1. The "directed set" structure of partitions $(P, \preceq)$ requires showing **two partitions admit a common refinement** (line 297 asserts this without proof). For arbitrary partitions with continuous endpoints, this is fine for piecewise-disjoint partitions but the cell endpoints need to be chosen compatibly.

2. The compatibility condition $E_{P'\to P''}E_{P\to P'} = E_{P\to P''}$ is the **functoriality** of $P\mapsto E_{P\to\cdot}$ on the poset of partitions. It is a 1-categorical (strict) condition. The summary tacitly assumes equality on the nose, which works for the length-weighted square-zero example (Lemma 5.4) and the $Z$-weighted Fibonacci scheme (Prop 6.10) but is checked only for those instances.

3. More worryingly, **the linking maps $E_{P\to P'}$ are defined morphism-wise** (Def 4.2 line 304–313): $E_{P\to P'}: A_P \to A_{P'}$. The induced map on Hilbert spaces is $V_{P\to P'}(f) := E_{P\to P'}\circ f$ for $f\in\Hh_P^W = \Hom(W, A_P)$. But the inductive limit isn't of $A_P$ (categorical objects), it's of $\Hom(W, A_P)$ (vector spaces). The two limits need not commute or even both exist. The summary says "compatible family of refinement maps" for $E_{P\to P'}: A_P\to A_{P'}$ but the limit is taken on the $\Hh_P^W$ level — these are different functors and the compatibility transfers cleanly only because $\Hom(W, -)$ is functorial. This should be stated.

4. **Bidirectional consistency**: the user's question. The construction uses only the forward $E_{P\to P'}$. For an honest projective system in the Hilbert-space category one often needs the adjoints $B_{P\leftarrow P'} = E_{P\to P'}^\dagger$ to commute with refinement in a compatible way — but they don't (Def 4.5 line 333: "$E_{P\to P'}\,B_{P\leftarrow P'}$ is in general only an orthogonal projection"). The inductive limit is fine without them, but the *projective* dual structure (descending channels, scaling operators, fixed states) requires more.

**(d) Correct statement.** The construction is a Hilbert-space inductive system with isometric linking maps, OK as stated. But:
- Common-refinement claim needs a sentence of justification.
- The dichotomy "$E$ direct system on objects vs $\Hh^W$ vector-space direct system" should be mentioned.
- The compatibility of $\Aa^*$ (descending channel, mentioned in Conj 9.11) with the inductive structure should be addressed if scaling-fixed states are to be discussed.

---

## 8. (MAJOR) The "completely positive" claim for ascending channel is asserted without Stinespring

**(a) Summary's claim.** Def 4.6 (lines 338–346):
> "$\Aa_{P'\to P}(O) := E_{P\to P'}^\dagger O E_{P\to P'} \in \End(A_P)$. This map is unital ($\Aa(\id) = \id$ because $E^\dagger E = \id$), $\ast$-preserving, and completely positive (it is a conjugation by an isometry)."

**(b) Location.** Lines 338–346.

**(c) Why it is OK (verified) but needs justification.** "Conjugation by an isometry is CP" follows from Stinespring: any map of the form $O \mapsto V^* O V$ for $V$ an isometry between Hilbert spaces is unital (when $V^*V = \id$) and CP. This is standard. **The claim is correct**, but the summary just asserts it. For a reader not steeped in operator-algebra, the connection "isometric Kraus operator ⇒ CP" should be at least cited.

More important: $\End(A_P)$ here is to be interpreted as the C*-algebra of $\End_\Cc(A_P)$ with the dagger from Conv 2.1. To call $\Aa$ a "CP map" one needs to specify the *target* C*-algebra structure, which is the same dagger. The summary should clarify the C*-structure on $\End_\Cc(A_P)$ that's being used. (Categorically, $\End_\Cc(A_P)$ is a finite-dimensional C*-algebra because the category is unitary fusion; this is implicit.)

**(d) Correct statement.** **VERIFIED** (modulo making explicit the C*-structure on $\End_\Cc(A_P)$ and citing/sketching that conjugation by an isometry is CP).

---

## 9. (MAJOR) The chat-4 $Z$-function "convolution identity" doesn't determine the algebra constants

**(a) Summary's claim.** Def 6.9 (lines 1258–1274) gives convolutional identities
$$
Z_\one(x+y) = Z_\one(x)Z_\one(y) + \varphi Z_\tau(x)Z_\tau(y), \qquad
Z_\tau(x+y) = Z_\tau(x)Z_\one(y) + Z_\one(x)Z_\tau(y) + \varphi^{-1}Z_\tau(x)Z_\tau(y),
$$
and says "the convolutional identities are exactly the multiplication structure constants of $m$".

**(b) Location.** Lines 1258–1283.

**(c) Why it is suspect.** The structure constants of $m$ in Def 6.10 are $m^\one_{\tau\tau} = \sqrt\varphi$ and $m^\tau_{\tau\tau} = \varphi^{-1/2}$. The convolutional identities (4.13)/(4.14) use $\varphi$ and $\varphi^{-1}$ respectively — which are the squares of the structure constants! The remark (line 1276–1283) says "with amplitudes given by the splitting basis squared $|m^c_{ab}|^2$".

But this is **not just a rescaling** — the $Z$-function approach is **summing probabilities** ($|m|^2$), not amplitudes ($m$). For a unitarily-defined algebra-derived refinement $\Delta = \varphi^{-1} m^\dagger$, the **amplitudes** are $\varphi^{-1}\bar m^c_{ab}$, and the per-channel probabilities are $\varphi^{-2}|m^c_{ab}|^2$. The summary's $Z$-functions track probabilities (with overall $\varphi$-factors absorbed into $Z_c$), not amplitudes.

The proposition 6.10 claim that "isometry on each charge sector $c$ is equivalent to the identity $Z_c(L) = \sum_{a,\alpha} |M^c_{a,\alpha}|^2 \prod_i Z_{a_i}(\ell_i)$" treats $Z$-functions as **partition functions** (sums of squared moduli), but at the same time uses $M^c_{a,\alpha}$ (the algebra multiplication structure constants, **complex amplitudes**) in Def 6.9. There's a subtle slippage: the convolution identities (4.13)/(4.14) involve $\varphi$ (a real positive number arising as $|m^\one_{\tau\tau}|^2 = \varphi$), while the "associativity by $m$" of Prop 6.10(ii) requires composing the complex amplitudes $M^c_{a,\alpha}$.

In the **multiplicity-free real-positive-gauge** Fibonacci case both work out, because the F-fixed-point amplitudes are real-positive. But the statement "convolutional identities are exactly the multiplication structure constants" is false: they are the **squared moduli of** the structure constants.

**(d) Correct statement.** Either:
1. State the $Z$-function recursion as a *probability* recursion explicitly: $|M^c|^2 + $ sum-over-children gives total probability 1.
2. Note that the $Z_c$ themselves should be thought of as boundary partition functions of an interval with charge $c$, satisfying a transfer-matrix recursion whose kernel matrix elements are $|m^c_{ab}|^2$, not $m^c_{ab}$.

The current phrasing conflates amplitudes and probabilities.

---

## 10. (MAJOR) The "non-degenerate solution branch" and the "Chat 3 gauge" are gauge-ambiguous

**(a) Summary's claim.** Theorem 5.3(b) (lines 613–615): "Non-degenerate (Fibonacci): $a = \sqrt\varphi$, $b = \varphi^{-1/2}$. Both (A) and (S) hold, with $\lambda = \varphi^2$." Remark 5.5 (lines 650–658) notes the other quadratic root "corresponds to the same algebra structure up to a sign change in the splitting basis $v^\one_{p,p}\mapsto -v^\one_{p,p}$; not a genuinely new solution."

**(b) Location.** Lines 597–658.

**(c) Why it is underspecified.** The numerical values $(a, b) = (\sqrt\varphi, \varphi^{-1/2})$ are gauge-dependent: they depend on the choice of orthonormal splitting basis $v^\one_{p,p}, v^p_{p,p}$. The summary implicitly fixes a "real positive gauge" but does not state this. The "Chat 3 gauge" referenced in §6.4 (line 1140: "in the Chat 3 gauge") is never defined.

More importantly: the gauge transformation rule for the splitting basis vectors is not stated. A gauge transformation
$$
v^c_{a,b} \mapsto e^{i\theta^c_{a,b}} v^c_{a,b}
$$
changes the algebra constants by a phase, and changes the F-symbol entries by combinations of these phases. The Fibonacci F-symbol $F^{\tau\tau\tau}_\tau$ in Def 6.4 is in a *specific* gauge — the standard Fibonacci gauge with real-symmetric F. Other gauge choices would give complex F-symbols and complex algebra constants $a, b$.

The negative root $a_- < 0$ is dismissed as "$v^\one_{p,p}\mapsto -v^\one_{p,p}$" gauge — but this sign change *also* changes the F-symbol entries involving the $\one$-channel. The summary should track this consistently.

**(d) Correct statement.** Either:
1. Add a Convention fixing the splitting-basis gauge (e.g. real-positive matrix elements where possible; specifically that $\langle v^\one_{p,p}, \cdot\rangle$ is real-positive).
2. Make the gauge transformation rule explicit and show that the dagger-special algebra is unique *up to gauge*, with the negative-root solution being the same in another gauge.

---

## 11. (CRITICAL) Lemma 6.13 is internally inconsistent with Def 6.9 — missing square roots

**(a) Summary's claim.** Def 6.9 (lines 1285–1297) defines amplitudes
$$
E_{I\to(J_1,\ldots,J_r)}(c) = \frac{1}{\sqrt{Z_c(L)}}\sum_{a,\alpha} M^c_{a,\alpha}\sqrt{\prod_i Z_{a_i}(\ell_i)}\,v^c_{a,\alpha}.
$$
Lemma 6.13 (binary $r=2$, lines 1318–1332) writes:
$$
E_{I\to(J,K)}(\one) = \frac{Z_\one(x)Z_\one(y)}{Z_\one(L)}\,\one_J\otimes\one_K + \frac{\varphi Z_\tau(x)Z_\tau(y)}{Z_\one(L)}\,(v^\one_{\tau\tau})_{J,K}.
$$

**(b) Location.** Def 6.9 lines 1285–1297; Lemma 6.13 lines 1318–1332.

**(c) Why it is wrong.** Specialise Def 6.9 to $r=2, c=\one$. The two non-vanishing channels are $a = (\one,\one)$ with $M^\one_{\one,\one} = 1$, and $a = (\tau,\tau)$ with $M^\one_{\tau,\tau} = \sqrt\varphi$. Then
$$
E_{I\to(J,K)}(\one) = \frac{1\cdot\sqrt{Z_\one(x)Z_\one(y)}}{\sqrt{Z_\one(L)}}\,\one_J\one_K + \frac{\sqrt\varphi\cdot\sqrt{Z_\tau(x)Z_\tau(y)}}{\sqrt{Z_\one(L)}}\,(v^\one_{\tau\tau})_{J,K}.
$$
The amplitudes are $\sqrt{Z_\one(x)Z_\one(y)/Z_\one(L)}$ and $\sqrt{\varphi Z_\tau(x)Z_\tau(y)/Z_\one(L)}$. Squared sum: $\frac{Z_\one(x)Z_\one(y) + \varphi Z_\tau(x)Z_\tau(y)}{Z_\one(L)} = 1$ by the convolution (4.13). Good — Def 6.9 gives the correct isometric amplitudes.

But **Lemma 6.13** writes the same amplitudes **without the outer square root**: $\frac{Z_\one(x)Z_\one(y)}{Z_\one(L)}$ and $\frac{\varphi Z_\tau(x)Z_\tau(y)}{Z_\one(L)}$. If these were amplitudes, their squared sum would be $\frac{Z_\one^2(x)Z_\one^2(y) + \varphi^2 Z_\tau^2(x)Z_\tau^2(y)}{Z_\one^2(L)}$, which is **not generally equal to 1**.

**The summary contains its own internal consistency check that betrays the bug.** The last sentence of Lemma 6.13 (line 1329–1331) says: "In the dilute regime $Z_\tau(\ell)\sim\rho\ell$, $Z_\one(\ell)\sim 1$, the one-particle localisation amplitudes reduce to $\sqrt{\ell(J)/\ell(I)}$."

Checking: using Lemma 6.13's formula, $\frac{Z_\tau(x)Z_\one(y)}{Z_\tau(L)} \sim \frac{\rho x\cdot 1}{\rho(x+y)} = \frac{x}{x+y} = \frac{\ell(J)}{\ell(I)}$ — **NOT** $\sqrt{\ell(J)/\ell(I)}$. So Lemma 6.13's stated dilute limit is inconsistent with Lemma 6.13's stated amplitudes.

Using Def 6.9's formula, the amplitude is $\sqrt{Z_\tau(x)Z_\one(y)/Z_\tau(L)} \sim \sqrt{x/(x+y)} = \sqrt{\ell(J)/\ell(I)}$ — **matches**.

So Def 6.9 is correct; Lemma 6.13 is missing square roots in its amplitudes. The summary's own dilute-regime cross-check confirms the bug.

Chat 4 contains the same bug: chat 4's general formula (line 1730–1733) matches Def 6.9 (with square roots); chat 4's binary formula (1765–1775) drops the square roots like Lemma 6.13. So the bug is faithfully imported, and the summary did not catch it.

**(d) Correct statement.** Lemma 6.13 should read:
$$
E_{I\to(J,K)}(\one) = \sqrt{\frac{Z_\one(x)Z_\one(y)}{Z_\one(L)}}\,\one_J\otimes\one_K + \sqrt{\frac{\varphi Z_\tau(x)Z_\tau(y)}{Z_\one(L)}}\,(v^\one_{\tau\tau})_{J,K},
$$
and analogously for $E(\tau)$. The missing square roots in lines 1322, 1323, 1325, 1326, 1327 of the summary need to be reinstated, and then the dilute-regime statement is automatically consistent.

**Numerical confirmation.** Using $\rho = 1$, $x = 0.3$, $y = 0.5$, $L = 0.8$:
- Convolution (4.13) holds: $Z_\one(x)Z_\one(y) + \varphi Z_\tau(x)Z_\tau(y) = Z_\one(L) = 1.6715$. ✓
- Lemma 6.13's amplitudes squared sum to **0.674**, not 1. **Not isometric.**
- Def 6.9's amplitudes squared sum to **1.0000**. ✓ Isometric.

---

## 12. (MAJOR) The non-tree interpolation kernel coefficients have a sign issue

**(a) Summary's claim.** Def 8.2 (lines 1640–1654):
> "$A_{\one,\tau} = 1$, $A_{\tau,\one} = \varphi^{-1}$, $A_{\tau,\tau} = \varphi^{-1/2}$. These satisfy $|A_{\tau,\one}|^2 + |A_{\tau,\tau}|^2 = \varphi^{-2}+\varphi^{-1} = 1$."

**(b) Location.** Lines 1640–1654.

**(c) Why it is suspect.** The pair-creation coefficients $A_{x,z}$ for ambient charge $x$ and intermediate channel $z$ are read off from the F-symbol $F^{\tau\tau\tau}_\tau$:
$$
F^{\tau\tau\tau}_\tau = \begin{pmatrix}\varphi^{-1} & \varphi^{-1/2}\\ \varphi^{-1/2} & -\varphi^{-1}\end{pmatrix}.
$$
For the inserted vacuum pair $1\to\tau\tau$ with ambient charge $\tau$, the two possible intermediate channels are $z = \one$ (with amplitude from $F_{1,1} = \varphi^{-1}$, going via $(\tau\otimes\tau)_\one$) and $z = \tau$ (with amplitude from $F_{1,\tau} = \varphi^{-1/2}$ or $F_{2,2} = -\varphi^{-1}$, depending on convention).

The summary says $A_{\tau,\tau} = \varphi^{-1/2}$. But the F-symbol entry $F_{1,2} = \varphi^{-1/2}$, while $F_{2,2} = -\varphi^{-1}$.

The chat 1 source (lines 1663–1664) reads:
> "$A_{\tau,1} = \varphi^{-1}$, $A_{\tau,\tau} = \varphi^{-1/2}$."

So summary matches chat 1. But the **sign** of $F_{2,2}$ in the F-symbol is **negative** ($-\varphi^{-1}$), while a "pair insertion" amplitude should pick out the $(2,2)$ matrix element (going $\tau\to\tau$ through the $\tau$ channel). The summary/chat are picking $F_{1,2}$, not $F_{2,2}$. 

This is a **labelling ambiguity**: "$A_{x,z}$" could mean either "the amplitude to insert a pair into an ambient channel $x$ via intermediate channel $z$" with $z$ being the *fused* channel of the inserted pair (in which case the F-symbol entry depends on whether we're transposing the F-matrix indices), or the conjugate convention.

The check $|\varphi^{-1}|^2 + |\varphi^{-1/2}|^2 = \varphi^{-2}+\varphi^{-1} = 1$ works regardless of sign. But the **sign matters** for the inner product $\langle (\tau\tau)_\one \tau\,|\,\tau\,(\tau\tau)_\one\rangle = \varphi^{-1}$ in Lemma 8.3.

The summary computes the latter overlap and says it's the $(1,1)$ entry of $F^{\tau\tau\tau}_\tau = \varphi^{-1}$. The actual entry $F_{1,1} = \varphi^{-1}$ is correct. But the matrix entry being **positive** $\varphi^{-1}$ is a gauge choice; in a different basis the entry might be negative. The summary doesn't track gauge.

**(d) Correct statement.** Either pick the gauge once and state it ("we use the standard Fibonacci gauge with $F$ real-symmetric, with $F_{1,1}=\varphi^{-1}, F_{1,2}=F_{2,1}=\varphi^{-1/2}, F_{2,2}=-\varphi^{-1}$"), or work with absolute values. The current $A_{x,z}$ assignment is ambiguous between picking $F_{1,2}$ vs $F_{2,2}$.

---

## 13. (MINOR) The fusion-multiplicity-free assumption is implicit but not stated

**(a) Summary's claim.** Def 3.1(vi) (lines 125–128) defines $N^c_{ab} := \dim\Hom(c, a\otimes b)$, allowing arbitrary non-negative integers. The splitting basis Def 3.2 indexes $\mu = 1,\ldots,N^a_{bc}$. The F-symbol Def 3.3 includes multiplicity indices $\mu, \nu, \rho, \sigma$.

**(b) Location.** Lines 113–169.

**(c) Why it is suspect.** The general setup admits multiplicity, but every worked example (Fibonacci, Ising, square-zero $\one\oplus p$) is multiplicity-free. The summary nowhere flags that the formal apparatus has been verified only in the multiplicity-free case. The "OPE 3-tensor" of Def 8.1 explicitly retains multiplicity, but Conjecture 9.10 (operadic limit) doesn't comment on whether multiplicities make it more involved.

In particular, the F-symbol "pentagon equation" mentioned (line 167) is never written out, and for non-multiplicity-free categories it has multiplicity indices summing — the summary's notation $(F^{abc}_d)_{(e,\mu,\nu),(f,\rho,\sigma)}$ is informal.

**(d) Correct statement.** Either restrict to multiplicity-free, or add a remark that the structure extends to non-multiplicity-free with appropriate index management, and explicitly note pentagon-equation indices.

---

## 14. (MINOR) Conjectures are vague enough to be falsified by trivial examples

**(a) Summary's claim.** Conjectures A–E (lines 1906–1948).

**(b) Location.** Lines 1906–1948.

**(c) Why they are suspect.**
- **Conj A** ("every physically admissible finite-lattice fine-graining map is, at the categorical level, an isometry"). "Physically admissible" is undefined. Counterexample: any *non-isometric* contraction (Markov-chain coarse-graining map) is physically meaningful. As stated, Conj A is just a definition of what "physically admissible" means — it's tautological once you decide that "admissible" includes isometry.
- **Conj B** is conditional on choosing the polar-decomposition section, which is one of many. The conclusion "uniquely determined by $E = B^\dagger(BB^\dagger)^{-1/2}$ up to gauge" is true *by construction* once you adopt this choice. So Conj B is also near-tautological.
- **Conj C** ("Topology gives channels; RG gives weights"). True but underspecified — what does "the fusion category determines" mean precisely?
- **Conj D** ("coherent continuum limit is operadic"). $A_\infty$-coalgebra is mentioned without precise statement. Hard to falsify.
- **Conj E** ("braiding required for order-changing interpolation"). Reasonable but trivially true if we're working with $\Cc$ braided to begin with. If $\Cc$ has no braiding, then there is no canonical way to "interpolate with order-change", which is the conjecture.

**(d) Correct statement.** Conjectures should be sharpened. In particular, Conj A should be replaced by a definition (call this property "isometric refinement"), and the actual content (what fails for *non*-isometric refinements) made into a separate statement.

---

## 15. (MINOR) The "vacuum-charge" gloss vs categorical content for the splitting reading is muddled in critique §9

**(a) Summary's claim.** §9.1 (lines 1808–1822) lists "square-zero is a degenerate algebra branch", with "[two distinct objects] all called 'square-zero'" enumerated in Remark 5.4. The vacuum-charge interpretation is asserted as forced (Warning 6.8).

**(b) Location.** Critical evaluation section.

**(c) Why it is incomplete.** The critique correctly notes the three "square-zero" usages and the vacuum-charge re-interpretation. But it doesn't address the categorical question: when we say "$\one$ now means total vacuum charge", **what categorical object are we working with?** Are we still in the fusion category $\Cc$ (Fibonacci)? Or are we in a different category (e.g. some module category over the Fibonacci algebra)? The chats don't make this clear, and the summary inherits the muddle.

If we're still in Fib, then $\one$ is still the unit object, simple, and "contains nothing". The phrase "$\one$ contains an unresolved $\tau\tau$ pair" is then an informal physicist's shorthand for the fact that the *state* corresponding to a $\one$-summand of $A_I$ has a component in the $\tau\otimes\tau$ fusion channel under refinement. This is a statement about the morphism $E$, not about the object $\one$.

**(d) Correct statement.** Either:
1. Make explicit that "vacuum charge" is informal physics language for "the categorical $\one$-summand of $A_I$ has a non-trivial refinement morphism component in $p\otimes p$", and that this involves no change of category.
2. Explicitly introduce the module category over the algebra $(A, m, u)$ and discuss the structure there.

The current text repeatedly suggests the latter ("re-interpret $\one$ to mean...") without doing the work.

---

## 16. (NITPICK) The unitary-fusion-category definition is non-standard

**(a) Summary's claim.** Def 3.1 condition for unitary (lines 131–135):
> "A fusion category is *unitary* if every Hom-space is a Hilbert space and $\otimes, \circ$ are compatible with a dagger structure $(\,\cdot\,)^\dagger:\Hom(X,Y)\to\Hom(Y,X)$ satisfying $\langle f,g\rangle\,\id_X = f^\dagger\circ g$ for $X$ simple."

**(b) Location.** Lines 131–135.

**(c) Why it is suspect.** The standard definition of a unitary fusion category (Galindo, Hagge-Hong, Penneys, etc.) requires:
1. A C* or *-tensor category structure: dagger $\dagger$ contravariant, anti-linear, involutive, monoidal, and *positive* ($f^\dagger f = 0 \Rightarrow f = 0$).
2. Compatibility of $\dagger$ with associator and unitors (unitary associator/unitors).
3. Often: a spherical structure with $\dim_q(a) > 0$ for all simples (so quantum dimensions are positive reals).
4. Often: pivotal/spherical compatible with $\dagger$.

The summary's condition omits positivity of $\dagger$, unitarity of the associator (Convention 2.1 mentions associator is "suppressed in displays" without committing to it being unitary), and pivotal/spherical structure. These are needed for quantum dimensions to be positive reals (used in Def 3.4) and for the splitting/dagger pairing to behave well.

**(d) Correct statement.** Should reference a standard definition (e.g. Etingof–Gelaki–Nikshych–Ostrik, Chapter 9, or Penneys' survey on unitary fusion categories), and either define carefully or cite.

---

## 17. (NITPICK) Particle number is well-defined only on the basis decomposition

**(a) Summary's claim.** Def 4.2 (lines 237–246): "On the basis $(a_1,\ldots,a_N)$ ... the *particle number* is $k(a_1,\ldots,a_N) := \#\{i:a_i\neq\one\}$."

**(b) Location.** Lines 237–246.

**(c) Why it is incomplete.** Particle number is a function on basis labels, but the Hilbert space $\Hh_N^W$ is a direct sum over these labels. A general state is a superposition, so "particle number" is generally not sharp; it's an observable (a Hermitian operator with eigenvalues $k$, eigenspaces the configuration subspaces).

The summary doesn't make explicit that "particle number" is an operator $\hat k = \sum_{(a_1,\ldots,a_N)} k(\vec a) P_{\vec a}$ where $P_{\vec a}$ is the projector onto the configuration subspace. Without this, the phrase is ambiguous.

**(d) Correct statement.** "Particle number is the observable $\hat k\in\End_\Cc(Q^{\otimes N})$ with eigenvalue $k(\vec a)$ on the configuration subspace $\Hom(W, a_1\otimes\cdots\otimes a_N)$."

---

## 18. (NITPICK) `B_i satisfy braid relations` is not actually stated in the summary

The user asked about a claim "if $\Cc$ is braided, the $B_i$ satisfy braid relations". This claim appears in chat 2 (Theorem Target 3.2.1), but **does not appear in the summary**. The summary only has Conjecture E (line 1935–1939: "braiding for order-changing interpolation") which is much weaker. So this is **not in summary** to be wrong about, but a chat-versus-summary fidelity issue.

If it were stated, it would be VERIFIED — braiding $c_{Q,Q}$ at adjacent sites does satisfy braid relations in any braided monoidal category, by the hexagon equation.

---

## 19. (NITPICK) The "1D-vs-2D" treatment in §7 is consistent with Chat 3's retraction

**(a) Summary's claim.** Warning 7.3 (lines 1784–1802) correctly distinguishes Program A (1D Hilbert) and Program B (2D Euclidean cobordism). This is faithful to chat 3's retraction (lines 684–981).

**(b) Status.** **VERIFIED** as a faithful representation of chat 3's evolution.

---

## 20. (NITPICK) The non-tree interpolation account is faithful to Chat 1

**(a) Summary's claim.** §8 (lines 1626–1715) reproduces the Gram obstruction, sidelobe stencil, and polar repair.

**(b) Status.** **VERIFIED** as faithful to chat 1's lines 1561–2228 — the formulas $|a|^2 = |\lambda|^2/(\varphi + 2|\lambda|^2)$, $|b|^2 = \varphi/(\varphi + 2|\lambda|^2)$ match exactly.

---

## 21. (NITPICK) The $r$-fold splitting scalar coherence is correct

**(a) Summary's claim.** Lemma 4.5 (lines 432–445).

**(b) Status.** **VERIFIED** — the exponent algebra is correct.

---

## 22. (NITPICK) Fibonacci F-matrix involution `F² = I` is correctly proved

**(a) Summary's claim.** Lemma 6.3 (lines 918–937).

**(b) Status.** **VERIFIED** — straightforward but right.

---

## 23. (NITPICK) Templates around `\textbf{Frobenius-special}` mismatch with chat content

Chat 3 (lines 313–337) explicitly says "the canonical nontrivial algebra object structure" and uses "dagger-special" or just "special". Neither "Frobenius" nor "FRS" appears in chats 3 or 4 in the context of the $A = \one\oplus\tau$ algebra. The Frobenius name appears only in chat 1 (FRS algebra A=1 for Ising) in a different context. The summary's importation of "Frobenius-special" terminology in §4 is editorial — not directly sourced from the chats. **This is a fabrication of terminology** that should be flagged.

---

## 24. (NITPICK) FRS A=1 for diagonal Ising — categorical interpretation

**(a) Summary's claim.** Listed in §9 (line 1874) as "the FRS algebra statement that 'for diagonal Ising $A = \one$'".

**(b) User's question.** "Is this really what FRS says? Or is it that the algebra A is the unit object 1 in the bimodule category?"

**(c) Verdict.** **VERIFIED** in interpretation: in the FRS construction, one chooses a **Frobenius algebra** $A$ in the modular tensor category $\Cc$. The **Cardy case** (diagonal modular invariant) corresponds to $A = \one$, the unit object of $\Cc$ itself — not "the unit object in the bimodule category". The user's parenthetical is a separate (more sophisticated) statement about the role of the bimodule category $A\text{-Bimod}_\Cc$, where indeed $\one_\Cc$ as an $A$-bimodule (with $A = \one$) is the unit of that bimodule category.

The summary's wording is acceptable but the flag is appropriate.

---

## 25. (MAJOR) The summary's claim about "the canonical algebra-derived refinement is undefined for square-zero" needs sharper categorical content

**(a) Summary's claim.** Warning 5.4 (lines 660–684): "the canonical algebra-derived refinement $\Delta = \lambda^{-1/2}m^\dagger$ ... is *undefined* for square-zero: there is no scalar $\lambda$ to plug in."

**(b) Location.** Lines 660–684.

**(c) Categorical content.** For $a = b = 0$, $mm^\dagger$ is **not a scalar** — it's a diagonal matrix $\diag(1, 2)$ (in the $\one\oplus p$ decomposition). This means $m$ is **not dagger-special**. The phrase "no $\lambda$ exists" is correct.

But the summary stops there. A more interesting categorical observation would be: there is **no rescaling of $m$** (i.e., no $m' = \mu m$ for any scalar $\mu$) that makes the resulting $m'$ dagger-special when $a = b = 0$, because $m'm'^\dagger = |\mu|^2 \diag(1, 2)$ is still not a scalar multiple of $\id_A$.

Stronger: the "$a=b=0$ algebra" is associative but **not normalisable** to a special algebra. This is the real categorical obstruction. It would mean: the only algebra structures on $A = \one\oplus p$ in Fib that can be made special are those with $(a, b) \neq (0, 0)$.

**(d) Correct statement.** The block scalars 1 and 2 differ, so no scalar rescaling of $m$ produces $m'm'^\dagger$ proportional to $\id_A$. Hence the *zero multiplication* is associative but cannot be made dagger-special by any rescaling. This is the genuine categorical obstruction (which the summary correctly identifies but doesn't fully articulate).

---

## Severity ratings

### CRITICAL (likely real categorical bugs)
- **1**: Dagger-special ≠ Frobenius-special; conflation of terminology.
- **2**: Δ is "isometric *co*multiplication" — comultiplication-claim relies on assumptions not made explicit.
- **3**: Cor 6.7 identifies algebra-derived Δ with coassociative splitting without proving the F-fixed-point correspondence between $m$-associativity and $\Delta$-coassociativity.
- **11**: **Lemma 6.13 has wrong amplitudes** — missing square roots; inconsistent with Def 6.9; the summary's own dilute-regime cross-check exposes the bug.

### MAJOR (substantive issues affecting clarity or correctness of secondary statements)
- **4**: Splitting basis orthonormality conventions implicit.
- **5**: Occupation object $Q$ lacks gauge-fixing convention.
- **6**: "Vacuum-charge reinterpretation" conflates categorical unit object with state vector.
- **7**: Inductive limit construction is correct but skips justifications (common refinement, $\Hom(W,-)$ functoriality).
- **9**: $Z$-functions as "structure constants" conflate amplitudes and probabilities.
- **10**: "Chat 3 gauge" is undefined; sign-ambiguous algebra constants.
- **12**: Pair-creation $A_{x,z}$ sign convention ambiguous between $F_{1,2}$ and $F_{2,2}$.
- **25**: Square-zero obstruction underdescribed.

### MINOR
- **13**: Multiplicity-free assumption implicit.
- **14**: Conjectures too vague.
- **15**: Vacuum-charge gloss vs categorical content.

### NITPICK
- **16**: Non-standard unitary fusion category definition.
- **17**: Particle number is an operator, not a function.
- **18**: User's "$B_i$ braid relations" claim not in summary.
- **23**: "Frobenius-special" terminology not sourced from chats.

### VERIFIED (non-obvious correct claims)
- **8**: CP claim for ascending channel is correct (Stinespring).
- **19**: §7 treatment of 1D-vs-2D faithful to chat 3.
- **20**: §8 non-tree interpolation faithful to chat 1.
- **21**: Lemma 4.5 $r$-fold scalar coherence is correct.
- **22**: Fibonacci F² = I correct.
- **24**: FRS A=1 for diagonal Ising is the standard Cardy-case statement.

---

## Top three "big finds"

1. **Issue 11 (concrete bug)**: **Lemma 6.13 has wrong amplitudes** — the binary Fibonacci refinement formula at lines 1318–1332 is missing outer square roots. Def 6.9 (lines 1285–1297) gives the correct general formula with $1/\sqrt{Z_c(L)}$ prefactor and $\sqrt{\prod Z_{a_i}(\ell_i)}$ inside the sum; Lemma 6.13's specialisation drops both square roots. The summary's own dilute-regime cross-check at line 1329–1331 ("amplitudes reduce to $\sqrt{\ell(J)/\ell(I)}$") exposes the bug — Lemma 6.13's formula evaluated in the dilute regime gives $\ell(J)/\ell(I)$, not $\sqrt{\ell(J)/\ell(I)}$. Chat 4 has the same bug (line 1765 vs line 1730), and the summary faithfully imported it without flagging.

2. **Issue 1+2+3 (related)**: The entire algebra-object framework (§4–§6.4) relies on a tacit identification "dagger-special algebra ⟺ (special) Frobenius algebra" plus "$m$ associative ⟹ $m^\dagger$ coassociative". The first identification is false in general — a (special) Frobenius algebra additionally requires the Frobenius identity $(m\otimes\id)(\id\otimes\Delta) = \Delta m$, which is never stated or proved. The second requires monoidality of $\dagger$ and unitarity of the associator, which are implicit but not stated. The Fibonacci example happens to satisfy these, but the general framework is unsound as written. The Remark 4.3(b) name "Frobenius-special = simultaneously special algebra and special coalgebra with compatible structure" is editorial; the chats use "dagger-special" without the Frobenius vocabulary.

3. **Issue 6+15 (related)**: The "vacuum-charge reinterpretation of $\one$" is not a coherent categorical move. $\one$ is the unit object of a fusion category; "reinterpreting" it does not change its properties. The actual content is that the morphism $E:A_I\to A_J\otimes A_K$ restricted to the $\one$-summand of $A_I$ must have non-zero $p\otimes p$ component, which is a statement about $E$ rather than about $\one$. The summary (following the chats) frames this as a re-interpretation of the unit object, which is misleading.
