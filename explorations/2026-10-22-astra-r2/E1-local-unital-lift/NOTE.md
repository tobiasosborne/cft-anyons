# E1 — A local unital lift, its pointed half-braiding hypothesis, and its limits

2026-10-22. **Proved:** the braided assertion (i)–(iii), with exact occupation-degree preservation and support `[2j−1,2k−1]`; the CA-76 drift bound therefore applies. Thus **r=0** works in the question. A compatible all-vacancy state also supplies an elementary R1 instance. **Conditional:** convergence of a prescribed microscopic state sequence still requires WT-1 A3. **Unresolved:** existence or a complete obstruction for *arbitrary* local lifts of a fixed pointed carrier in a non-braided category. The exact sufficient condition and the computable obstruction proved below concern a specified half-braiding construction, not every possible lift. The contiguous-block shuffle has optimal nearest-neighbour depth `L−1`, not uniformly bounded depth.

These are structured mathematical proofs, not proof-assistant proofs. No report statement, convention ledger, worklog, or other exploration is edited. The task's explicit directory/no-commit restriction overrides the usual landing workflow. Read: AGENTS, README, CONVENTIONS, report maps/master, CA-76, D6 NOTE/REVIEW/INTEGRATION and its braided check, D3 NOTE/REVIEW/INTEGRATION, the current worklog and the cited local sources. The R1 sketch being completed is D6 `REVIEW.md:205–225`, promoted only as Proposal 76.5 at CA-76:140–147.

## 1. Data, notation, and exact meaning of the claims

**Setting:** finite open ordered chains; either a future chiral or full target, with neither constructed here. **Input:** a unitary fusion category C and the pointed object `(O,eta)` of CONVENTIONS (am), `O=1⊕X`, including the orthogonal splitting. For the principal result C also has a **specified unitary braiding**. X need not be simple, connected, self-dual, or multiplicity-free, and may contain units. No modularity or ribbon twist is used.

The following choices are confined here because the task forbids editing CONVENTIONS. They supplement (r),(t),(am),(an); they do not select a new repository-wide R gauge.

- Put `W_M=O^⊗M`, `W_0=1`, `A_M=End_C(W_M)`, `p0=eta eta†`, `p1=1−p0`. The faithful carrier is `⊕_c Hom_C(c,W_M)`. A support assertion means **membership** in `1^⊗(j−1)⊗End_C(W_(k−j+1))⊗1^⊗(M−k)`, not merely commuting with single-site observables. Single-site algebras need not generate A_M.
- Tensor powers have the fixed left-associated bracketing. Formulas suppress the corresponding unitary associators and unitors, using Penneys `:319,395–398` and FRS `:806–819`. Tensor interchange, not an assumed Hilbert tensor factorization of charge sectors, is used throughout.
- In the braided case choose the crossing `t_Y=c_(Y,O):Y⊗O→O⊗Y`. Equivalently `z_Y=t_Y^−1:O⊗Y→Y⊗O` is a unitary half-braiding on the ancillary O. The opposite uniform crossing convention gives another valid construction; no mixture of conventions is made.
- Write `N_M=Σ_(j=1)^M p1^(j)`. Degree q means `[N_M,a]=q a`, equivalent to the grading by `Q_(M,n)` in (am). “Preserves grading” below means this algebra grading, **not** preservation of absolute fine occupancy on every complementary representation.
- State norms and `p_n,q_n,tau_n,e_n` have exactly the CA-76/(an) meanings. Length L is distinct from refinement-scale n. A circuit of depth D and range w has D layers of disjoint interval-supported unitary C-morphisms, each interval containing at most w fine sites; geometry is fixed when discussing depth.

The categorical identities used are the following. With all objects Y,Z in a full tensor subcategory containing O, require

    t_1=1_O,
    t_Z (f⊗1_O)=(1_O⊗f)t_Y                    (f:Y→Z),
    t_(Y⊗Z)=(t_Y⊗1_Z)(1_Y⊗t_Z),
    t_Y(1_Y⊗eta)=eta⊗1_Y.                                  (H)

All t_Y are unitary. The first three are the unit, naturality, and tensor identity for the inverse half-braiding; the last makes eta a morphism from the central unit. For a braiding they follow from its axioms and naturality with eta. Local anchors: FRS `:921–924,1023–1125`; the half-braiding/center-morphism definition is `literature/md/1704.04221/1704.04221.md:298–307`. We explicitly impose the unitary and pointed conditions rather than infer them from that source's terminology.

## 2. The one-gap lemma — the locality argument

**Lemma E1.1 [proven; open/either target; L0 plus (H); R0].**
**ASSUME** (H), an M-site chain, and `0≤s≤M`. Define

    b_(M,s)=1_(W_s)⊗t_(W_(M−s)) : W_M⊗O → W_(M+1),
    beta_(M,s)(a)=b_(M,s)(a⊗1_O)b_(M,s)†.

The output order is old sites 1,…,s, the new site, then old sites s+1,…,M.
Let `v_(M,s)` insert eta in that gap.
**PROVE:** beta is a unital injective *-homomorphism, `beta(a)v=v a`, and for `a` supported in `[j,k]` its support is contained in

    [j,k]       if s≥k;
    [j+1,k+1]   if s<j;
    [j,k+1]     if j≤s<k.                                  (1)

`<1>1.` beta is a unital *-homomorphism. BY unitarity of b and tensor interchange: `(a⊗1)(a'⊗1)=aa'⊗1`, and tensoring respects dagger (Penneys `:319`). It is injective: compression of `a⊗1` by `1_(W_M)⊗eta` returns a. BY `eta†eta=1`.

`<1>2.` `b(1_(W_M)⊗eta)=v`. BY the last identity in (H), applied to the suffix `W_(M−s)`. Hence `beta(a)v=b(a⊗1)(1⊗eta)=b(1⊗eta)a=v a`. BY `<1>1` and tensor interchange.

`<1>3.` If `s≥k`, b acts only on old sites after s and the appended ancilla; it commutes past a. Thus beta(a) is the same a tensored with identities in the stated output positions. BY disjoint tensor factors. This includes `s=k`: insertion *after* an endpoint does not enlarge the interval.

`<1>4.` If `s<j`, write `a=1_(W_s)⊗a_tail`, where `a_tail` is an endomorphism of the **entire suffix**, supported in its subinterval `[j−s,k−s]`. Naturality in (H) gives

    t_(W_(M−s))(a_tail⊗1)t_(W_(M−s))† = 1⊗a_tail.

Thus the support shifts by one. BY naturality for an arbitrary suffix morphism, not an expansion into single-site operators.

`<1>5.` If `j≤s<k`, put `A=W_(j−1)`, `J=W_(s−j+1)`, `R=W_(k−s)`, `C'=W_(M−k)`. Write a as `1_A⊗a_JR⊗1_C'`; no factorization of a_JR is assumed.

`<2>1.` In the input order `A J R C' O`, factor the crossing by (H):

    b=(1_AJ⊗t_R⊗1_C')(1_AJR⊗t_C').

`<2>2.` The second factor acts on `C' O`, disjoint from a_JR. Its conjugation therefore cancels, leaving

    beta(a)=1_A ⊗ [(1_J⊗t_R)(a_JR⊗1_O)(1_J⊗t_R†)] ⊗ 1_C'.

`<2>3.` The bracket is an endomorphism of `J O R`, of length `k−j+2`. Its interval is `[j,k+1]`. BY the displayed formula. In particular no global vacancy projectors occur.

`<1>6.` QED BY `<1>1`–`<1>5`. This is an actual interval-algebra identity on the full categorical algebra.

## 3. Dyadic theorem, grading, and naturality

**Theorem E1.2 [proven; open/either target; L1; R0 unital tower].**
**ASSUME** the pointed unitary braided input of §1. At step i, `1≤i≤L`, set

    M_i=L+i−1,    s_i=2i−1,
    alpha_L=beta_(M_L,s_L) ... beta_(M_1,s_1).

Equivalently, let B_L interleave `old_1...old_L,new_1...new_L` into `old_1,new_1,...,old_L,new_L`, crossing old_j with new_i by t_O exactly when i<j. Then

    alpha_L(a)=B_L(a⊗1_(W_L))B_L†.                         (2)

**PROVE:** (i) `alpha_L(a)V_L=V_L a`; (ii) the exact support bound `[2j−1,2k−1]`; (iii) exact occupation-degree covariance; and pointed braided-equivalence naturality. The maps and their scale composites satisfy WT-1 A1.

`<1>1.` At step i, old site i occupies position `2i−1`; all earlier ancillas lie before it, and the suffix consists of old sites i+1,…,L. Thus the prescribed beta inserts immediately after old i. Repeated application gives the stated order and crossings in (2). BY the definition of b and the tensor identity (H), which expands each suffix crossing into adjacent crossings. In composing beta maps, each previously introduced map is tensored with the identity on the next ancillary object; their conjugating unitaries therefore compose to B_L.

`<1>2.` Each beta is unital, injective, and *-preserving; their composite has these properties. Each intertwines its one-gap isometry. Their composite is exactly the dyadic V_L. BY E1.1 and the placement-composition identity of CA-71 `:103–123`, with dyadic convention (t). Consequently `alpha_L(a)V_L=V_La`.

`<1>3.` For an initial interval `[j,k]`, insertions with i<j shift both endpoints by one; those with j≤i<k increase only its right endpoint; those with i≥k are after the current right endpoint. BY (1). There are j−1 shifts and k−j interior insertions. The final interval is

    [j+(j−1), k+(j−1)+(k−j)] = [2j−1,2k−1].             (3)

Its length is `2(k−j+1)−1`. In the question's nonnegative-slack convention take **r=0**, uniformly even in `(C,O)`. This improves the requested length `2(k−j+1)`. For a singleton, naturality gives the actual formula `alpha_L(f^(j))=f^(2j−1)` for every f∈End_C(O).

`<1>4.` B_L transports occupation projectors with their individual strands.

`<2>1.` Naturality in Y gives `t_O(p_e⊗1)=(1⊗p_e)t_O`, for e=0,1.

`<2>2.` The last identity of (H), unitarity, and its adjoint give `t_Y(1_Y⊗p0)t_Y†=p0⊗1_Y`; subtract from the identity for p1. This is precisely where pointed compatibility is needed for the ancillary occupation.

`<2>3.` Sum the transported single-strand projections to obtain

    N_(2L) B_L = B_L(N_L⊗1+1⊗N_L).
    [N_(2L),alpha_L(a)] = alpha_L([N_L,a]).                (4)

BY `<2>1`–`<2>2` and (2); `a⊗1` commutes with the ancillary number operator. Thus `alpha_L(A_L^(q))⊂A_(2L)^(q)`: degree shift **zero**, even for occupation-changing morphisms.

`<1>5.` Naturality holds under the correctly typed equivalences.

`<2>1.` Let F:C→C' be a unitary braided strong monoidal equivalence, with unitary `u:F(O)→O'` carrying `F(eta)` and F's unit constraint to eta'. Use its iterated tensorator and `u^⊗M` to obtain `J_M:F(W_M)→W'_M`. Define `F_M(a)=J_M F(a)J_M†`. BY the tensorator definition (Penneys `:325–348`).

`<2>2.` Braided means exactly that these tensorators carry `F(c_(Y,Z))` to `c'_(F(Y),F(Z))`. Applying F to the defining finite composition of B_L therefore gives B'_L after J-identifications. Dagger, tensor products, units and eta are preserved. BY the stipulated properties of F, and (2).

`<2>3.` Hence `F_(2L) alpha_L = alpha'_L F_L`, and the analogous square holds for V_L. Tensorator coherence makes transport compatible with composition of pointed equivalences and with monoidal natural isomorphisms. BY `<2>1`–`<2>2`. This proves naturality of the *tower construction*; it is not R5 functorial synthesis of CFTs.

`<1>6.` For `L_n=2^n L_0`, define `alpha_n=alpha_(L_n)` and `alpha_n^k=alpha_(n−1)...alpha_k`, with identity at n=k. The cocycle equation follows by associativity of composition, and all maps are unital injective *-maps. Thus WT-1 A1 holds, including its norm inductive limit. BY `<1>2` and `literature/md/2010.11121/2010.11121.md:164–176`. This does not assert path independence across different placement forests, which A1 does not require.

`<1>7.` QED BY `<1>1`–`<1>6`.

**Absolute number is a different statement.** Equation (3) gives `alpha_L(N_L)=Σ_j p1^(2j−1)`, so `N_(2L)−alpha_L(N_L)=Σ_j p1^(2j)`. If X≠0 its norm is L: the all-occupied-even-sites subobject is nonzero, and each summand is a commuting projection. Thus an alternative reading of (iii) as a uniformly bounded *absolute-number difference* is false. The hypothesis separating the claims is the (am) **endomorphism-degree** interpretation specified above.

## 4. The Wilson consequence and the exact R1 boundary

**Corollary E1.3 [proven bridge; open/either target; L1 plus chosen states; R0, conditionally R1].**
**ASSUME** E1.2 and states omega_n on A_(L_n), with p_n>0 and the CA-76 quantities.
**PROVE**

    ||omega_(n+1) alpha_(n+1)^k − omega_n alpha_n^k||
       ≤ p_n e_n + 2(1−p_n),                 k≤n.          (5)

`<1>1.` E1.2 supplies exactly `alpha_n(a)V_n=V_na` and the strict maps assumed by CA-76 Proposition 76.1(iii)–(iv), `:90–108`. Apply that established proposition with W_n=V_n. This proves (5); its mixture proof is not re-derived here.

`<1>2.` If p_n=0, tau_n and e_n are undefined; use the bound 2 directly, or define only the product `p_n e_n` to be zero at this endpoint. BY the norm bound for differences of states. At p_n=1 the bound is e_n, not zero without a mismatch estimate.

`<1>3.` If these upper bounds are summable, WT-1 A3 holds, and WT-1 `:18–107` supplies the horizontal limit and its tail bound. A computable tail is required for WT-2 `:109–129`. QED BY `<1>1`–`<1>2`, E1.2 `<1>6`, and the cited WT-1/WT-2 theorems.

**Proposition E1.4 [proven existence and negative universality; open/either target; L1; R1].**
**ASSUME** E1.2. **PROVE:** the all-vacancy states are exactly compatible; but for X≠0 there are microscopic states with p_n=1 at every step and no horizontal limit.

`<1>1.` Put `e_M=eta^⊗M:1→W_M` and `omega_M^vac(a)=e_M†a e_M`. This is a scalar state: positivity is `(a e_M)†(a e_M)≥0`, and normalization is `e_M†e_M=1`. BY the simple unit and tensor dagger.

`<1>2.` `e_(2M)=V_M e_M`; hence `omega_(2M)^vac alpha_M=omega_M^vac` by E1.2(i). Here p_n=1 and e_n=0. WT-1 gives a compatible limit state with zero drift. BY `<1>1`, (5). This is an R1 existence statement without a criticality claim.

`<1>3.` For X≠0 choose a simple x and an isometry `u:x→X`, and define `f_M=(iota u)⊗eta^⊗(M−1):x→W_M`. The scalar functional `omega_M^occ(a)=f_M†a f_M` is a state by the same computation. Both families satisfy `f_(2M)=V_M f_M`, so both are separately compatible. BY tensor composition and E1.2(i).

`<1>4.` Choose omega_n alternately from these two families. All inserted even sites are vacant, so p_n=1. On the observable `2p0^(1)−1` of norm one, every row's adjacent pullbacks alternate between +1 and −1. BY E1.2's singleton formula, or the separate compatibility in `<1>2`–`<1>3`. Thus every adjacent drift is exactly 2, e_n=2, and the row has no limit.

`<1>5.` QED BY `<1>1`–`<1>4`. This explicitly refutes an unconditional *prescribed-state* R0→R1 interpretation of E1(iv), while proving both its stated A1 assertion and its finite drift inequality. No summability hypothesis is hidden in braiding.

## 5. Non-braided input: what the proof actually needs

**Theorem E1.5 [proven sufficient condition; open/either target; L0 plus declared transport; R0 and E1.3/E1.4].**
**ASSUME** C is unitary fusion, `D=⟨O⟩` is its full fusion subcategory generated by O, and O has a specified unitary half-braiding z with D for which eta is a central morphism. **PROVE:** E1.1–E1.4 hold with `t=z^−1`, with the same support and grading bounds. Naturality now refers to equivalences transporting this pointed half-braiding.

`<1>1.` This data is exactly (H), on objects and morphisms of D. In particular all W_M and **all** their endomorphisms belong to D because it is full. BY the definition of D and of a half-braiding.

`<1>2.` E1.1 and E1.2 `<1>1`–`<1>4,<1>6` use only (H). Their proofs therefore apply verbatim. The transport square follows by preserving z in place of c. BY inspection of the displayed identities, not a claim that D inherits an ambient braiding.

`<1>3.` E1.3–E1.4 use only the resulting maps/intertwiners. QED BY `<1>1`–`<1>2`.

An object of Z(C) with a **central pointed inclusion** is sufficient but stronger: its restriction supplies this data. Likewise a specified unitary braiding on the full generated D suffices, whether or not C is braided. These are extra input structures at the fusion layer, not braidings silently inferred from L0. Equivalently one may supply `(X,z^X)` in Z(D) and take the direct sum with the central unit. Conversely a central eta splits O in Z(D), since unitarity makes p0 and p1 central. BY the projector calculation E1.2 `<2>2` and the given orthogonal splitting.

**Proposition E1.6 [proven finite criterion and computable obstruction for this construction; open/either target; L0; R0 feasibility].**
**ASSUME** the finite fusion, associator, dagger and pointed data are presented, and let `s_i` be all simples of D, with unit included. Fix complete orthonormal isometric embeddings `f_(ij;k,mu):s_k→s_i⊗s_j`, retaining every multiplicity mu.
**PROVE:** pointed unitary half-braidings are exactly the solutions of this finite system:

    z_i:O⊗s_i→s_i⊗O unitary,             z_1=1_O,
    z_i(eta⊗1_i)=1_i⊗eta,
    (f_(ij;k,mu)⊗1_O) z_k
      = (1_i⊗z_j)(z_i⊗1_j)(1_O⊗f_(ij;k,mu)).             (6)

The fixed associators are understood on both sides. In matrix coordinates these are polynomial equations in entries and their conjugates. A necessary, computable integer obstruction is

    Delta_(i,c)=dim Hom(c,O⊗s_i)−dim Hom(c,s_i⊗O).        (7)

Any nonzero entry excludes (6).

`<1>1.` Necessity of (6) is naturality on each f, the half-braiding tensor identity, unitarity, and centrality of eta. Necessity of (7)=0 follows because a unitary is an isomorphism in every simple charge block. BY semisimplicity. Its entries are finite sums of the supplied fusion coefficients weighted by O's multiplicities. This is also the ring-centrality obstruction in ENO `:1221`.

`<1>2.` Conversely choose a solution of (6). For any object Y of D, choose complete isometric simple embeddings `v_(i,mu):s_i→Y` and define

    z_Y=Σ_(i,mu) (v_(i,mu)⊗1_O) z_i (1_O⊗v_(i,mu)†).

`<2>1.` Orthogonality and completeness of the v's make z_Y unitary. Changing the orthonormal basis in a multiplicity space mixes the v's by a unitary matrix; summing its two coefficients gives the same expression. BY matrix multiplication. Thus the definition is independent of decomposition choices.

`<2>2.` Every morphism Y→Z is a matrix of scalars between equal simples and zero between distinct simples. Substitution in the displayed formula proves naturality for every morphism. BY finite semisimplicity.

`<2>3.` On Y=s_i⊗s_j choose the complete embeddings f in (6). Summing (6) after right multiplication by `1_O⊗f†` proves `z_(s_i⊗s_j)=(1_i⊗z_j)(z_i⊗1_j)`. Expanding arbitrary Y,Z into simple summands and using `<2>2` proves the same tensor identity for all Y,Z. The unit and eta identities likewise extend from simples. BY completeness and (6).

`<1>3.` The family therefore satisfies all the required axioms. QED BY `<1>1`–`<1>2`. Exact solutions can be checked from the finite equations; no claim of numerical tolerance deciding exact solvability is made. Vanishing of (7) alone is only necessary: the associator-dependent equations (6) remain.

**Boundary of the converse.** E1(i)–(iii) constrain endomorphism-algebra maps, not crossings with every object of D or naturality on every fusion embedding. We have not reconstructed z from an arbitrary alpha. Thus (7) is **not** a no-go for arbitrary local unital lifts, and (6) is **not** asserted equivalent to their existence. Nor is full ambient Z(C)-liftability necessary; the example at the end demonstrates why testing simples outside D would falsely reject a valid construction. The requested universal non-braided alternative remains partially solved, not promoted to a theorem by calling (7) an obstruction. CA-76 Corollary 76.4 already supplies global unital extensions for every C; its arithmetic is not re-proved or mistaken for locality.

## 6. Circuit depth, and what D3 can consume

**Theorem E1.7 [proven; open/either target; L1; R0 implementation].**
**ASSUME** E1.2, X≠0, the fixed 2L-site metric, and the contiguous input representation `a↦a⊗1_(W_L)`. **PROVE:** B_L has a nearest-neighbour unitary C-morphism circuit with depth L−1 and `L(L−1)/2` gates. Any range-w circuit U implementing this same alpha by `U(a⊗1)U†` obeys

    D(w−1) ≥ L−1.                                        (8)

In particular its nearest-neighbour depth is optimal, and no fixed depth and fixed range implement this family.

`<1>1.` Label strands old_j and new_i. For layer t=1,…,L−1 put a t_O crossing at positions

    p=L−t+2i−1, p+1,           i=1,…,t.

These pairs are disjoint. The crossing exchanges old_j with new_i for `j=L+i−t`. To check adjacency, that old strand has already crossed new_1,…,new_(i−1), while that new strand has already crossed old_L,…,old_(j+1); those are exactly the earlier layers `L+i'−j<t` and `L+i−j'<t`. Their positions are consequently `j+i−1` and `j+i`. This is p,p+1. BY induction on t.

`<1>2.` Every i<j has exactly one crossing at `t=L+i−j`; no other pair crosses. The schedule preserves the order of crossings on each strand. Relative to the sequential suffix expansion defining B_L it only reorders crossings with disjoint strands; tensor interchange identifies the products. The final word is interleaved. Summing t gives the gate count. BY `<1>1` and E1.2 `<1>1`.

`<1>3.` One circuit layer enlarges an interval support by at most w−1 sites at either end: gates disjoint from it commute with the observable; every other gate intersects it and has at most w sites. Induction gives the radius D(w−1). BY the interval-algebra tensor interchange, without a factorization of the full Hilbert carrier.

`<1>4.` The input `p0^(L)⊗1` has support {L}, whereas its image under alpha is `p0^(2L−1)` by E1.2. A projector at a site outside an interval cannot belong to that interval algebra here: compress all other sites to eta, and compare an eta at the omitted site with an isometric simple summand of X there. An interval-supported operator has the same scalar compression in the two cases; p0 gives 1 and 0. BY the simple unit, fullness, and tensor identities. Thus `<1>3` forces (8). QED BY `<1>1`–`<1>4`.

For L=1 the circuit is empty; for X=0 all algebras are scalar and the lower-bound argument intentionally does not apply. With growing gate range (8) gives only the displayed tradeoff.

**Distributed insertion is a different geometry.** The carrier isometry `V_L=⊗_j(1_O⊗eta)` is cellwise local (CA-68:54–75). Calling the relocation of the ancillas free changes the input support convention of (8); it does not contradict it. A unital algebra map is not itself a unitary circuit. In a general fusion category a purported “identity embedding on only odd factors” for every multi-site morphism is precisely part of the construction being sought. A bounded-depth comparison must name a reference unital embedding first. We do not infer a bounded-depth global unital implementation from the depth-one carrier insertion.

**D3 dressing corollary [proven conditional; open/either target; L1 plus circuit; R0].**
**ASSUME** an output circuit U of depth D and range w, and put `W=UV_L`, `alpha^U=Ad_U alpha_L`. **PROVE:** alpha^U intertwines W, and an m-site input has output interval length at most `2m−1+2D(w−1)`; hence the question's bound holds with `r=2D(w−1)`.

`<1>1.` `alpha^U(a)W=U alpha_L(a)V_L=UV_La`. BY E1.2.
`<1>2.` Apply the support-growth proof E1.7 `<1>3` to (3). This proves the length bound. If additionally `[U,N_(2L)]=0`, (4) is preserved; arbitrary U need not preserve occupation degree. QED BY `<1>1`–`<1>2`.

Thus D3's U dresses an already local unital lift; it need not implement the long shuffle B_L. A quasi-local U requires its own tail estimate; an exact finite support r is not supplied by quasi-locality alone. No proof of D3's polar-dressing conjecture is inferred.

## 7. Checks and skeptical audit

`checks/check_lift.py` is a calibration with at most four O sites, largest matrix 34×34. Its local tensor embedding is computed with F, independently of the proposed braid, and tests **all** 13 two-site matrix units, all 169 products, dagger, unitality, `alpha V=Va`, exact grading, one-site images, and an explicit three-site representative. The additional block-naturality test crosses a *whole two-site morphism*, including occupation-changing ones, past a spectator. No large chain calculation, Julia suite, or network access was used.

The phase-free mutation was run first and failed block naturality with entry error `0.7861513777574232`; see `checks/red_phase_free.txt`. Restoring the locally sourced R phases passed; see `checks/output.txt`. This discriminates the defect that the round-1 pointed test did not see. A hopping morphism has nonzero commutators with both fine endpoint vacancy projections, rejecting a universal length-two support for two coarse sites. These floating-point checks calibrate the derivation; no finite test proves the all-category theorem. Exact proofs above do not depend on rounded residuals.

One GPT-6.1 xhigh research collaborator independently checked the one-gap proof, central-point requirement, finite half-braiding equations and circuit schedule. That audit supplied the eta caveat and confirmed the stated converse boundary; it is not a substitute for the displayed proofs or the later Opus review. No collaborator wrote outside this directory.

## Results ledger

- E1.1 — **proven:** one-gap unital lift with three exact interval-support cases, under (H).
- E1.2 — **proven:** braided dyadic lift, intertwining, support `[2j−1,2k−1]`, r=0, exact algebra-degree preservation, pointed-equivalence naturality and WT-1 A1.
- Absolute-number interpretation of (iii) — **negative:** `||N_(2L)−alpha_L(N_L)||=L` for X≠0; it is not the (am) grading assertion.
- E1.3 — **proven:** CA-76's strict-lift bound applies, with the p=0 endpoint treated separately.
- WT-1 convergence of prescribed states — **conditional:** summable drift, and computable tails for effective evaluation, remain analytic input.
- E1.4 — **proven:** a compatible vacancy-state R1 instance; **negative:** p_n=1 alone permits alternating states of drift 2 with no limit.
- E1.5 — **proven:** pointed unitary half-braiding on full D=⟨O⟩ suffices in non-braided ambient C.
- E1.6 — **proven:** finite equations characterize that transport data; nonzero integer fusion commutators obstruct it, not arbitrary lifts.
- General fixed-carrier non-braided converse — **conjectural/open:** neither universal existence nor a complete invariant for arbitrary local lifts is proved.
- E1.7 — **proven:** contiguous shuffle depth L−1 is optimal for nearest-neighbour gates; no uniform fixed-depth/fixed-range implementation in that geometry.
- D3 circuit dressing — **conditional:** a supplied depth-D range-w U gives r=2D(w−1); grading additionally requires a number-preserving dressing.
- Small numerical check — **conditional** corroboration using ordinary Float64 arithmetic: sourced non-pointed F/R passes and the phase-free mutation fails; no certified interval-arithmetic or proof-assistant claim is made.

## Layer tags

| Statements | Setting / target chirality | Input data | Rung reached |
|---|---|---|---|
| E1.1–E1.2, E1.7 | Open chain; either future target | L1 braided, pointed O | R0 unital local tower and its implementation bounds |
| E1.3 | Open; either | L1 plus microscopic states | R1 conditional on summable drift; no R2 |
| E1.4 | Open; either | L1 pointed, explicitly constructed state | R1 existence; no conformality/fidelity |
| E1.5–E1.6 | Open; either | L0 plus declared pointed relative half-braiding, or its finite equations | R0; state consequences as above |
| D3 dressing | Open; either | L1 plus a supplied circuit (extra construction data) | R0; R1 still needs state estimates |

No theorem reaches R2 modes, R3 local conformal theory, R4 fidelity, or R5 a functor selecting conformal realizations. No L2 modular, L3 conformal enrichment, or L4 declared theory is required for the finite results. The finite tower's naturality is explicitly weaker than the programme's R5.

## What this gives the integration

CA-76 Proposal 76.5 and D3 open problem 1 are answered for every **pointed unitary braided input**: a genuine local unital map exists on the unchanged full A_L, and its range is exact. CA-75 Link (b1) is thereby closed at L1/R0. CA-76 already proved Link (b2); E1 supplies its formerly missing local hypothesis. The unital lift transports constants with unit 1, while the corner still has unit P; these remain different observables.

The full support certificate makes D3's local-witness route available, but supplies none of its witness energies or compressed-unit-ball estimates. Link (b3), critical dynamics, KS convergence and fidelity remain open. For L0 input the sufficient transport structure and its exact finite equations are now explicit; rejecting them must not be reported as rejecting all local refinements.

## Open problems

1. **Fixed-carrier existence lemma:** for arbitrary unitary fusion C and pointed O, construct uniformly local unital alpha_L intertwining V_L without (H), or exhibit a category/carrier for which every such family fails. E1.6 does not decide this.
2. **Transport extraction lemma:** determine which additional placement/coherence or bimodule conditions on alpha force a pointed half-braiding on ⟨O⟩. Those conditions are not consequences of WT-1 A1 as currently stated.
3. **Critical-state lemma:** supply a Hamiltonian/state family and summable, effective bounds in (5), or the local D3 witness bounds. The compatible vacancy example is not a critical-family certificate.
4. **Dressing lemma:** prove the D3 polar map admits the required local/quasi-local U with uniform bounds. E1 only transports a supplied U's locality.
5. **Other geometries:** periodic seam coherence and comparisons to specified distributed-ancilla reference embeddings need separate statements. The open-chain proof makes no periodic assertion.

## Examples table

These are calibrations of the general statements, never substitutes for their hypotheses or proof.

| Instance | Check or counterexample | Exact boundary |
|---|---|---|
| Non-pointed Fibonacci, O=1⊕tau; sourced RSW F/R | `checks/check_lift.py`: four O sites maximum; all matrix-unit tests pass; phase-free R fails block naturality | Small floating-point witness only; proof is E1.1–E1.2 |
| Any C with X=0 | A_L=C, alpha=id, B_L=id | Trivial case excluded from the depth lower bound |
| Untwisted graded category Vec_G, O=1⊕g, for a finite nonabelian G and noncentral g | The full subcategory on ⟨g⟩ is cyclic graded with trivial associator and has the grade-swap symmetric braiding; E1.5 gives a local lift. For h with gh≠hg, `[O][h]−[h][O]=[gh]−[hg]≠0`, so O cannot lift to Z(Vec_G). Also Vec_G itself has no braiding, since noncommuting simple grades are not isomorphic. | Explicit counterexample to *ambient* Z(C)-liftability being necessary. All claims follow directly from graded morphisms/tensor products (Penneys :321) and the displayed fusion difference. |
| Vec_(Z/2), O=1⊕g, with underlying vacuum summand given a **noncentral point** | Give the vacuum summand half-braiding character chi(g)=−1 and the g summand trivial character. Character multiplicativity gives a unitary half-braiding, but eta is not central. At L=2, B(1⊗eta²)=V D with D=-1 on old `(1,g)` and +1 on `(g,1)`. The allowed hop h between these total-g summands obeys `D h D=−h`, so `alpha(h)V=−Vh` there. | Explicit counterexample to “an arbitrary half-braiding on the underlying O suffices.” Centrality of the **chosen eta**, not unit multiplicity, repairs it. |

## Sources used

All locators are local and repository-relative. Published sources provide axioms; repository results are cited as prior derivations, as required by the task. No theorem from a remote or absent source is invoked.

- `CONVENTIONS.md:631–688,740–761,871–883,1450–1480`: (r),(t),(x),(am),(an), support, occupation, insertion and drift conventions. Entries (ak),(al),(ao),(ap) were read; no Hamiltonian-sign or KS formula is needed here.
- `references/text/PenneysUnitaryFusionCategories.md:219–237,319–350,395–398`: orthogonal splittings, unitary tensor structure, graded categories, tensorators, and associator suppression. Manifest: `references/manifest/SOURCES.md:34–35,57`.
- `references/categorical-reconstruction/FuchsRunkelSchweigert2002/source/hep.tex:806–819,921–924,1023–1125`: coherence and braiding naturality/tensoriality. Provenance: `references/categorical-reconstruction/SOURCES.md:87–106`.
- `literature/md/1704.04221/1704.04221.md:298–307`: half-braiding and center-morphism definitions; no physical reconstruction claims from that paper are used.
- `references/text/EtingofNikshychOstrikFusionCategories.md:1221`: forgetful Grothendieck-ring image lies in the center; (7) also has the direct proof above. Manifest: `references/manifest/SOURCES.md:34`.
- `report/sections/68_variable_n_refinement_maps.tex:54–92` and `report/sections/71_refinement_placement_category.tex:53–123`: vacuum insertion, carrier locality, corner distinction, and exact placement composition.
- `report/sections/76_corner_to_wilson_bridge.tex:90–112,123–147,236–251`: established drift theorem, global extension, proposed braided lift, and the integration boundaries.
- `explorations/2026-10-22-astra/D6-functor-and-obstruction-theory/NOTE.md:262–311`, `REVIEW.md:142–170,205–225`, `INTEGRATION.md:110–123`: predecessor results, caveats and the missing non-pointed check.
- `explorations/2026-10-22-astra/D3-refinement-meets-dynamics/NOTE.md:226–260,712–715`, `REVIEW.md:58–68,93–101`, `INTEGRATION.md:76–84`: local-witness interface and remaining critical-state/dressing problem.
- `cft_machine/research/wilson_triangle.md:18–107,109–129` and `literature/md/2010.11121/2010.11121.md:126–180`: WT-1 A1/A3 distinction, inductive limit, states, and effective tails.
- `references/category-theory/RowellStongWang2009Classification/source/RSWfinal3.tex:2379–2407`: F/R for the calibration only. Provenance: `references/category-theory/SOURCES.md:26–113`.
- `checks/check_lift.py:1–157`, `checks/output.txt:1–6`, `checks/red_phase_free.txt:1–14`: local reproducibility bundle; commands and hashes in `checks/README.md`.
