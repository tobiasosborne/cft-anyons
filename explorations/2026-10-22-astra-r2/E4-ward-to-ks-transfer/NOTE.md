# E4 — Ward-to-Koo–Saleur transfer: a conditional theorem with explicit losses

2026-10-22. **Status: partial resolution.** The quantitative transfer theorems
below are proved. The brief's implication from its stated C1/C3 and an
undifferentiated gate error is **not proved**. Two purported intermediate
implications are false, with explicit counterexamples below. No counterexample
to a fully specified categorical certificate satisfying all of D2's original
C1–C5 is claimed. In particular, this note does not relabel the missing
contour-to-Hilbert-space reconstruction as a proof.

The result is general in the unitary fusion category. It constructs neither
its geometric certificate nor a continuum CFT. All new notation is scoped to
this note: the instruction to write only here precludes changing the canonical
convention ledger. No source acquisition, network, Julia run, or commit is used.

## 1. Exact question, source audit, and conventions

The numbering in the brief differs materially from the sources:

* CA-78 C1 identifies the geometric stress with energy/current **after the
  full KS normalization**; C3 supplies one-sided differentiated collar bounds;
  C4 supplies Ward contacts. See `report/sections/78_categorical_selection_equations.tex:233–250`.
* D2 C3 already requests summable *differentiated* transport and vanishing
  two-insertion errors, not merely convergent contact coefficients:
  `explorations/2026-10-22-astra/D2-selection-principle/NOTE.md:639–653`.
* D2 (19) is an identity in correlation functions on separated contours.
  Its conversion to KS operator commutators is expressly open at
  `explorations/2026-10-22-astra/D2-selection-principle/NOTE.md:655–701`.
* The reconciled target is C1 **and** C3 **and** the contour identity of C4,
  `explorations/2026-10-22-astra/D2-selection-principle/INTEGRATION.md:110–115`.
  The brief's weaker wording cannot inherit the omitted estimates.

Use (ak), (al), (ap), with no change of KS prescription. At scale r, N=N_r,
in a specified periodic representation of the categorical chain, set

\[
 k_j=-h_{r,j}/v_r,\quad {\cal J}_j=i[k_j,k_{j+1}],\quad
 T_{r,n}={N\over4\pi}\sum_j e^{2\pi inj/N}(k_j-\varepsilon_r-{\cal J}_j)
             +b_r\delta_{n0}.                                      \tag{1}
\]

The barred family has negative Fourier phase and the opposite current sign.
All multiplicities, charge sectors, and specified port transports are retained.
The current identity, adjoints, and the exact refinement leakage formula are
already proved in CA-79, respectively
`report/sections/79_ks_shell_and_refinement_defect.tex:73–81,159–176`;
they are used, not rederived here. The source recipe is
`references/lattice-symmetry/GransSamuelssonEtAl2020/source/Linnea11.5.tex:791–820`.

For finite Hilbert spaces and K_r>=1 define, for an operator X from scale r
to scale t and integers s,d>=0,

\[
 |X|_{s,d}^{t\leftarrow r}
 :=\|K_t^s X K_r^{-s-d}\|.                              \tag{2}
\]

Omit the superscripts within one scale. All constants in what follows are
independent of r, but may depend on the fixed mode labels and s. Convergence
and summability are over r, not automatically over every integer site count.
These are the graph norms of (v), `CONVENTIONS.md:801–810` and VR-1
`cft_machine/research/virasoro_routes.md:55–76`. The elementary product rule is

\[
 |XY|_{s,d+e}\le |X|_{s,d}|Y|_{s+d,e}.                  \tag{3}
\]

BY insertion of K^{-s-d}K^{s+d} between X and Y. Also
|X|_{s,d+1}<=|X|_{s,d}, since K^{-1} is contractive.

**Energy normalization warning, not a new convention.** If the brief's H is
the raw Hamiltonian and K=1+(H-E_0)/v, (1) gives, with
\(\varepsilon_r=E_0/(Nv)\),
\[
 T_{r,0}+\bar T_{r,0}={N\over2\pi}(K_r-1)+2b_r.
\]
Thus A2 for this K is an additional, generally very strong condition: on an
energy eigenvector with K-eigenvalue x it requires a bound on
\(|N(x-1)/(2\pi)+2b_r|/x\). It is not the usual conformally rescaled
energy control. CA-79 explicitly distinguishes these controls at
`report/sections/79_ks_shell_and_refinement_defect.tex:85–90`.
Changing K to a stronger auxiliary grading is a different assertion.

## 2. A precise discrete Ward hypothesis that suffices

**E4-W [conditional theorem; full, category-free applicable at L0, ->R2].**
The following statement specifies the additional operator meaning of a
discrete contour identity. Its proof is finite algebra plus uniform bounds.

**ASSUME W0.** N_r tends to infinity. Boundary metric insertions Q_{r,j},
j modulo N, are operators on the physical positive quotient Hilbert space.
Define \(\theta_j=2\pi j/N\), \(f_m(j)=e^{im\theta_j}\), and
\[
 S_{r,m}=N^{-1}\sum_j f_m(j)Q_{r,j}+b_r\delta_{m0},\qquad
 D_NF(j)={F(j+1)-F(j-1)\over2i\ell_N},\quad\ell_N=2\pi/N.
                                                               \tag{4}
\]
This normalization means the microscopic comparator for Q_j is
\(N^2(k_j-\varepsilon_r-{\cal J}_j)/(4\pi)\).
There is no fitted replacement for (1). Write d_N(m)=sin(m ell_N)/ell_N.

**ASSUME W1 (contour realization and contact identity).** The positively
oriented enclosing contour \({\cal C}_{r,m}(Q_j)\) is represented on this
same Hilbert space. For every m and j,
\[
\begin{split}
 [S_{r,m},Q_{r,j}]&={\cal C}_{r,m}(Q_{r,j})+X_{r,m,j},\\
 {\cal C}_{r,m}(Q_{r,j})&=f_m(j)D_NQ_{r,j}
                  +2(D_Nf_m)(j)Q_{r,j}\\
 &\quad+[\kappa_{3,r}D_N^3f_m(j)+\kappa_{1,r}D_Nf_m(j)]1
                 +W_{r,m,j}.                                  \tag{5}
\end{split}
\]
The first line is the **exchange of two nested contours with products**,
including its error X; the second is the local Ward contact rule with error W.
They must hold on all boundary vectors, after invariant null spaces have
been quotiented. An identity only in vacuum expectations is insufficient.
This is a cylinder-coordinate version of the contact hypothesis, declared
here rather than silently equated to D2's plane formula (19).

**ASSUME W2 (assembled, one-sided error control).** Put
\[
 E_{r,m,n}=N^{-1}\sum_j f_n(j)(X_{r,m,j}+W_{r,m,j}),\qquad
 |E_{r,m,n}|_{s,2}\le w_{r,m,n,s}\longrightarrow0.              \tag{6}
\]
The coefficients kappa_3,r, kappa_1,r, b_r are real and converge to
kappa_3, kappa_1, b. A concrete sufficient local bound in (6) is
\(N^{-1}\sum_j(|X_{r,m,j}|_{s,2}+|W_{r,m,j}|_{s,2})\le w_{r,m,n,s}\).
If a contour residual is a sum over more cells, those counts are included
before applying this bound; coefficient bounds in nonorthonormal bases must
first include the Gram factors of D2-L9, D2 NOTE:549–573.

**ASSUME W3 (A2 for geometric modes).** For all m,s,
\(|S_{r,m}|_{s,1}\le M_{m,s}<\infty\), uniformly in r.

**PROVE.** The geometric modes satisfy A4, with
\[
 z_{mn}=\delta_{m+n,0}\{\kappa_3m^3+(\kappa_1-2b)m\}
       ={\delta_{m+n,0}\over12}(m^3c^*-mc),\quad
 c^*=12\kappa_3,\quad c=24b-12\kappa_1.                       \tag{7}
\]

<1>1. Discrete summation by parts gives the operator-valued contact term.

  <2>1. \(D_N f_m=d_N(m)f_m\), and
  \(\sum_j A_jD_NB_j=-\sum_j(D_NA)_jB_j\) when A_j is scalar.
  BY shifting the two finite periodic sums in (4).

  <2>2. Multiply (5) by f_n(j)/N and sum. Since f_m f_n=f_{m+n},
  the two nonscalar terms sum to
  \([2d_N(m)-d_N(m+n)](S_{r,m+n}-b_r\delta_{m+n,0})\).
  BY <2>1 and (4). No discrete Leibniz rule is assumed.

  <2>3. For fixed m,n and all sufficiently large N>|m+n|, the scalar
  Fourier average is delta_{m+n,0}. Consequently, writing
  \(\beta_N=2d_N(m)-d_N(m+n)\),
  \[
  [S_{r,m},S_{r,n}]=\beta_NS_{r,m+n}+z^{(r)}_{mn}1+E_{r,m,n},
  \quad z^{(r)}_{mn}=\delta_{m+n,0}
    [\kappa_{3,r}d_N(m)^3+(\kappa_{1,r}-2b_r)d_N(m)].       \tag{8}
  \]
  BY <2>2, the geometric sum, and beta_N(m,-m)=2d_N(m).
  The finite-size alias delta is not discarded before the fixed-mode limit.

<1>2. The difference between beta_N and m-n has a uniform explicit bound.

  <2>1. \(|\sin x-x|\le |x|^3/6\). BY integrating
  \(|1-\cos t|\le t^2/2\), itself obtained by twice integrating
  \(|\cos t|\le1\).

  <2>2. Therefore
  \[
  |\beta_N-(m-n)|\le {\ell_N^2\over6}
                        (2|m|^3+|m+n|^3)=:a_{N,m,n}.        \tag{9}
  \]
  BY <2>1 applied to d_N(m) and d_N(m+n).

<1>3. Subtract the asserted bracket from (8). Its two-loss graph norm is
\[
 q^S_{r,m,n,s}\le w_{r,m,n,s}
                +a_{N,m,n}M_{m+n,s}+|z^{(r)}_{mn}-z_{mn}|\longrightarrow0.
                                                               \tag{10}
\]
BY (2), W2, W3 and (9); |1|_{s,2}=||K^{-2}||<=1. This is the
first precise use of A2: a small scalar error multiplying a mode is not
small in the required graph norm without a mode bound.

<1>4. QED BY <1>1–<1>3. In this theorem Virasoro form is an output of the
**specified first- and third-derivative contacts**, not of convergence of
unspecified coefficients. No refinement or limit representation was used.
At finite N the multiplier beta_N is not generally antisymmetric in m,n;
even beta_N(m,m) can be nonzero. Thus X+W must retain the corresponding
finite-difference correction: (5) is not advertised as an exact finite-size
Virasoro algebra with X=W=0.

**What is still conditional in W1.** A finite contour sweep can be listed as
diagrams A_0,...,A_M: if each difference is its prescribed contact plus a
transported local residual, then A_M-A_0 is their sum, by telescoping.
Internal oriented edges cancel. To apply this to (5), the two end diagrams
must be the two operator products on the positive quotient, and all
transported local errors must satisfy (6). These are substantive extra
requirements. LC-W proves the propagation law, but explicitly does not bound
its growing sum (`reconstruction/01_cells.md:164–195`). Neither it nor D2
(19) alone identifies the end diagrams with equal-time Hilbert products.

## 3. Transfer to the prescribed KS modes, with A2 exposed

**E4-T [conditional theorem; full, L0 plus analytic certificates, ->R2].**

**ASSUME** W0–W3, and write T_{r,n}=S_{r,n}+D_{r,n}, where
\(d_{r,n,s}:=|D_{r,n}|_{s,1}\) is summable over r for every n,s.
The modes T are exactly (1). **PROVE** T satisfies A2 and A4 with (7).

<1>1. A2 holds with \(C_{n,s}=M_{n,s}+\sup_r d_{r,n,s}\).
BY the triangle inequality; a summable nonnegative sequence is bounded.
Conversely, A2 for T plus these discrepancy bounds would imply W3.

<1>2. Expand the commutator, retaining both orders of every mixed product:
\[
 R^T_{mn}=R^S_{mn}+[D_m,S_n]+[S_m,D_n]+[D_m,D_n]-(m-n)D_{m+n}.
                                                               \tag{11}
\]
BY T=S+D; no unbounded-limit multiplication has been performed.

<1>3. Each product is controlled on consecutive graph spaces. Specifically,
\[
\begin{split}
q^T_{r,m,n,s}\le q^S_{r,m,n,s}
 &+d_{r,m,s}M_{n,s+1}+M_{n,s}d_{r,m,s+1}\\
 &+M_{m,s}d_{r,n,s+1}+d_{r,n,s}M_{m,s+1}\\
 &+d_{r,m,s}d_{r,n,s+1}+d_{r,n,s}d_{r,m,s+1}
   +|m-n|d_{r,m+n,s}\longrightarrow0 .                       \tag{12}
\end{split}
\]
BY (3), (10), (11), and boundedness and decay of each d sequence.
This is the second indispensable use of A2 in this proof. Summability of
d is stronger than needed for A4; its mere convergence to zero suffices here.

<1>4. QED BY <1>1–<1>3. Apply the same argument to the barred family.
For the **full** two-chiral conclusion additionally assume the mixed
contour has zero contact term and a vanishing two-loss error. Expansion
(11) with one barred factor then gives [T_m,bar T_n]->0. The unbarred
Ward equation alone supplies no mixed assertion or equality c_L=c_R.

**E4-N1 [negative lemma; any, category-free, ->R2].** A summable
one-insertion error alone does not control its commutator with an unbounded
family. **ASSUME** K=1 on C^2, A=diag(1,0),
B=\(\begin{pmatrix}0&1\\1&0\end{pmatrix}\),
S_r=2^r A, D_r=2^{-r}B. **PROVE** sum_r |D_r|_{s,1}<infinity but
|[S_r,D_r]|_{s,2}=1 for every r,s.

<1>1. ||A||=||B||=1 and [A,B]=\(\begin{pmatrix}0&1\\-1&0\end{pmatrix}\)
has norm 1. BY multiplication.
<1>2. [S_r,D_r]=[A,B], while ||D_r||=2^{-r}. BY their definitions.
<1>3. QED BY <1>1–<1>2 and the geometric series.
This refutes a proof step that bounds (11) by d alone. It is an operator
counterexample, not a categorical chain with a conformal Ward certificate.
Special cancellation can replace A2, but must itself be a proved product bound.

## 4. Differentiated refinement, not gate values, gives A3

**E4-A [conditional theorem; full, category-free applicable at L0, ->R2].**

**ASSUME** isometries J_r with K_{r+1}J_r=J_rK_r. For each mode n, specify
assembled, normalized metric families B_{r,n}(eta), with
\(B'_{r,n}(0)=S_{r,n}\). For each adjacent pair, both B_{r,n} and
B_{r+1,n} are holomorphic on a neighborhood of the **same** closed disk
|eta|<=rho_{r,n}. Fourier factors, cell counts, velocity, anomaly
line, and zero-mode origins are part of this family. J_r is independent of
eta in the declared coordinate trivialization. Put
\[
 F_{r,n}(\eta)=B_{r+1,n}(\eta)J_r-J_rB_{r,n}(\eta),\qquad
 \sup_{|\eta|=\rho_{r,n}}|F_{r,n}(\eta)|_{s,1}\le u_{r,n,s},\quad
 \sum_r u_{r,n,s}/\rho_{r,n}<\infty.                       \tag{13}
\]
Also assume the discrepancies of E4-T. **PROVE** A3, quantitatively
\[
 e_{r,n,s}\le u_{r,n,s}/\rho_{r,n}+d_{r+1,n,s}+d_{r,n,s}.   \tag{14}
\]

<1>1. Integrating the power series of the finite matrix F around the circle
selects its linear coefficient:
\(F'(0)=(2\pi i)^{-1}\oint F(\eta)\eta^{-2}d\eta\).
BY the elementary integral of eta^k; convergence is uniform on this circle
because the family is holomorphic on a neighborhood of the closed disk.
The fixed graph weights in (2) can be taken through this finite integral.

<1>2. Consequently |S_{r+1,n}J_r-J_rS_{r,n}|_{s,1}
<=u_{r,n,s}/rho_{r,n}. BY <1>1 and the triangle inequality for the integral.

<1>3. Exact K transport and isometry imply
\(|D_{r+1,n}J_r|_{s,1}\le d_{r+1,n,s}\) and
\(|J_rD_{r,n}|_{s,1}\le d_{r,n,s}\).
BY functional calculus on the invariant, hence reducing, range of J_r.

<1>4. Add these two differences to <1>2 and sum over r. QED BY
<1>2–<1>3, (13), and summability of d. A2 is not used in this A3 proof.
Exact K transport is an additional assumption, absent from E4's gate-error
wording. A1 plus E4-T and E4-A lets VR-1 apply without redoing its proof
(`cft_machine/research/virasoro_routes.md:78–149`).

One may replace (13) by a directly certified summable bound on F'(0), or by
D2-L10's one-sided collars for this derivative (D2 NOTE:575–594). Ordinary
gate errors do not supply any of these. If J depends on eta, differentiating
also produces \(B_{r+1,n}(0)J'_r(0)-J'_r(0)B_{r,n}(0)\); those connection
terms must be included, not silently deleted.

**E4-N2 [negative lemma; any, category-free, ->R2].** Even uniformly close,
positive, regular, entire gate families on all **real** metric parameters
need not have close metric derivatives.

**ASSUME** A is any nonzero orthogonal projection, epsilon_r=2^{-r-2},
and on t>=0, eta real set
\[
 G_r(t,\eta)=\exp[-t(1+\epsilon_r\sin(\eta/\epsilon_r^2))A],
 \qquad G(t,\eta)=e^{-tA}.                                  \tag{15}
\]
**PROVE** sup_{0<=t<=1,eta real}||G_r-G||<=epsilon_r, whereas
\(||\partial_\eta(G_r-G)(1,0)||=e^{-1}/\epsilon_r\).

<1>1. The coefficient of A lies in [1-epsilon_r,1+epsilon_r], so both
families are positive contractions and G_r(0,eta)=1. BY spectral calculus
for the projection A; they are entire in eta.
<1>2. On Ran A, the mean-value bound for e^{-t x}, x>=0, is
\(|e^{-t x}-e^{-t}|\le t|x-1|\le\epsilon_r\); on Ker A the difference is zero.
BY the scalar derivative bound t e^{-t x}<=t.
<1>3. Differentiation at eta=0 gives
\(\partial_\eta G_r(t,0)=-t\epsilon_r^{-1}e^{-t}A\).
BY differentiating the scalar exponential on Ran A.
<1>4. QED BY <1>1–<1>3. The real gate errors are summable, their derivatives
diverge. A uniform complex bound divided by its analytic radius, as in (13),
is precisely an added hypothesis. This counterexample addresses the proposed
gate-to-derivative inference; it does not assert that (15) satisfies C1's KS
identification and the conformal Ward contacts simultaneously.

**E4-N3 [conditional obstruction; full, L0, ->R2].** If “intertwines gates”
means only homogeneous global time evolution, it cannot mean **any** such
refinement. **ASSUME** translation commutes with K (automatic for the physical
K), isometry and exact K transport, even fine sizes, and vanishing original
mode transport. For one odd mode n, assume unit inputs v_r have bounded
(s+1)-graph norm and \(\liminf_r\|T_{r,n}v_r\|_s>0\).
**PROVE** a modified refinement has the same global time-gate error but
nonvanishing n-mode transport.

<1>1. Translation U_N commutes with the homogeneous H and satisfies
\(U_NT_nU_N^*=e^{-2\pi in/N}T_n\), BY (1) and the translated density.

<1>2. W_r=U_{N_{r+1}}^{N_{r+1}/2} preserves global time-gate error norms
when J_r is replaced by W_rJ_r. BY commutation with the fine time gate,
unitarity, and [W_r,K_{r+1}]=0. For odd n,
\[
 T_{r+1,n}W_rJ_r-W_rJ_rT_{r,n}
 =-W_r(T_{r+1,n}J_r-J_rT_{r,n})-2W_rJ_rT_{r,n}.            \tag{16}
\]
BY T_n W_r=-W_r T_n, which follows from <1>1.

<1>3. The reverse triangle inequality in (16) bounds the modified output
norm below by \(2\|T_{r,n}v_r\|_s-\|\Delta_{r,n}v_r\|_s\), where
Delta_{r,n}=T_{r+1,n}J_r-J_rT_{r,n}.
BY the graph isometry of W_rJ_r. The lower limit is positive by the assumptions.

<1>4. QED BY <1>1–<1>3. This is a conditional obstruction whenever a nontrivial
certificate exists, not a supplied example of such a certificate. Coordinate-
resolved differentiated gate matching excludes this freedom. Matching a
specified odd/even Trotter sweep requires a translation preserving that sweep.

## 5. The central coefficient: contact formula and independent rigidity

**E4-P [proved formal extraction; both, category-free, ->R2].** In the
plane convention (ad), suppose the scalar part of the ordered contact is
\(\sum_{k\ge1}a_k(w)(z-w)^{-k}1\), finitely many singular terms.
With f_m(z)=z^{m+1}, g_n(w)=w^{n+1}, the exact formal contact coefficient is
\[
 z_{mn}=\operatorname{Res}_w g_n(w)
       \sum_{k\ge1}{a_k(w)\over(k-1)!}\partial_w^{k-1}f_m(w).
                                                               \tag{17}
\]
**ASSUME/PROVE:** the stated singular part / formula (17).
<1>1. Taylor-expand f_m(z) formally about w, allowing Laurent powers of w.
The coefficient of (z-w)^{-1} in f_m(z)(z-w)^{-k} is
f_m^{(k-1)}(w)/(k-1)!. BY multiplication of formal series.
<1>2. Take the second residue with g_n. QED BY <1>1.

**Corollary [same tags]. ASSUME** the formal D2 (19) contacts and plane
normalization (ad). **PROVE** the Ward central charge and zero-mode shift formula.

<1>1. In (17), a_4=c_W/2 and other scalar a_k vanish. Therefore
\(z_{mn}=\delta_{m+n,0}c_W(m+1)m(m-1)/12\).
BY differentiating z^{m+1} three times and taking the residue.

<1>2.
The nonscalar residues are
\(\operatorname{Res}g_n(f_m\partial T+2f'_mT)
=\operatorname{Res}(g_nf'_m-g'_nf_m)T=(m-n)L_{m+n}\),
BY formal integration by parts (the residue of a derivative is zero).
If the second- and first-pole coefficients were instead A_2 and A_1,
the multiplier would be
\((A_2-A_1)(m+1)-A_1(n+1)\): the Ward values A_2=2,A_1=1 are essential.
Convergence of arbitrary contact coefficients does not fix this normalization.

<1>3. After a shift T_n=L_n+b delta_{n0}, the scalar changes by
-2mb delta_{m+n,0}. Thus c*=c_W, c=c_W+24b. The cubic central charge is
the Ward coefficient; equality c*=c additionally requires the declared
zero-mode normalization b=0 relative to these plane modes.
BY substituting L_{m+n}=T_{m+n}-b delta_{m+n,0} in <1>1–<1>2.

<1>4. QED BY <1>1–<1>3. This agrees with
CA-79:79–81 and the source's distinction
`references/lattice-symmetry/GransSamuelssonEtAl2020/source/Linnea11.5.tex:3191–3198,3220–3229`.
This is formal residue extraction, not an assertion of discrete contour convergence.

**E4-C [conditional theorem; full, category-free applicable at L0, ->R2].**
Even without positing the derivative orders in (5), consistent scalar
contacts must have the form (7) under the following operator hypotheses.

**ASSUME** A2, adjoint pairing, K_r>=1 with min spec K_r=1, N_r->infinity,
unitary translations U_r commuting with K_r, U_r^{N_r}=1, and
\(U_rT_{r,n}U_r^*=e^{-2\pi in/N_r}T_{r,n}\).
Suppose for every m,n there are convergent scalar contacts z^{(r)}_{mn}->z_{mn}
such that
\[
 |[T_{r,m},T_{r,n}]-(m-n)T_{r,m+n}-z^{(r)}_{mn}1|_{s,2}\to0. \tag{18}
\]
**PROVE** z_{mn}=delta_{m+n,0}(m^3 c*-m c)/12 for real c*,c, uniquely
\[
 c^*=2(a_2-2a_1),\qquad c=2a_2-16a_1,\quad a_m=z_{m,-m}.   \tag{19}
\]
This theorem classifies contacts; (18) must first come from a Ward estimate
such as E4-W/T. It is not offered as a substitute for that estimate.
The diagonal cocycle recurrence is established prior art:
`references/cft/Schottenloher2008/Schottenloher2008.md:2507–2517,2552–2589,2610–2634`.
The proof below retains its linear coboundary instead of setting a_1=0,
and supplies the finite-graph-norm passage to the cocycle equation.

<1>1. The scalar limits are antisymmetric and diagonal.

  <2>1. Add the residuals for (m,n) and (n,m). Their operator parts cancel.
  Since ||K_r^{-2}||=1, z_{mn}+z_{nm}=0 in the limit. BY (18).

  <2>2. Average conjugation by U_r^j, j=0,...,N_r-1. If m+n is nonzero
  and N_r>|m+n|, the average of the operator part of (18) is zero, by its
  Fourier character. The scalar part remains -z^{(r)}_{mn}1. Averaging is
  contractive in (2), because U_r commutes with K_r. Thus
  |z^{(r)}_{mn}|<=the residual norm, and z_{mn}=0. BY (18).

  <2>3. For (m,-m) the operator part is self-adjoint. Take its expectation
  on a unit K_r-eigenvector of eigenvalue 1. The imaginary part of
  z^{(r)}_{m,-m} tends to zero. BY adjoint pairing and (18) at s=0.
  Hence a_m is real, a_{-m}=-a_m and a_0=0.

<1>2. Finite-matrix Jacobi forces the scalar cocycle identity in the limit.

  <2>1. Replace the converging contacts by their limits in (18); denote
  the resulting residuals R_{r,m,n}, with norms q_{r,m,n,s}->0.
  BY ||K^{-2}||<=1.

  <2>2. A2 and (3) give
  \[
  |[T_l,R_{mn}]|_{s,3}
  \le C_{l,s}q_{r,m,n,s+1}+q_{r,m,n,s}C_{l,s+2}\to0.       \tag{20}
  \]
  This is the further use of A2 needed to pass Jacobi, without assuming
  convergence of the modes or a limiting representation.

  <2>3. Expand the finite-matrix Jacobi identity using
  [T_m,T_n]=(m-n)T_{m+n}+z_{mn}1+R_{mn}.
  The coefficients of T_{l+m+n} cancel algebraically. The remaining scalar is
  \((m-n)z_{l,m+n}+(n-l)z_{m,n+l}+(l-m)z_{n,l+m}\).
  All remaining operator terms are linear residuals or (20), hence tend
  to zero in |.|_{s,3}. Because ||K^{-3}||=1, that scalar must be zero.
  BY finite Jacobi, <2>1–<2>2, and min spec K=1.

<1>3. Solve this identity, without invoking a cohomology classification.

  <2>1. Taking a triple (m,1,-m-1) gives
  \[
  (m-1)a_{m+1}=(m+2)a_m-(2m+1)a_1\quad(m>=2).             \tag{21}
  \]
  BY <1>1 and <1>2.

  <2>2. The sequence
  \(a_m=(a_2-2a_1)(m^3-m)/6+a_1m\) has the initial values a_1,a_2
  and satisfies (21), by expanding its two polynomials. Induction gives
  every positive m; oddness gives the negative m and a_0=0.

  <2>3. Rewrite this polynomial as (m^3 c*-m c)/12, obtaining (19).
  QED BY <1>1–<1>3.

The low-energy anchor min spec K=1 matters: otherwise the weighted norm
of a scalar identity may tend to zero, and weighted-small residuals cannot
determine a central coefficient. The brief's physical K has this anchor.
For full targets the same proof applies separately to the barred copy;
vanishing mixed contacts remain a separate hypothesis.

## 6. Acceptance, limitations, and the remaining sharp lemmas

**Acceptance.** Run from the repository root:
```
python3 explorations/2026-10-22-astra-r2/E4-ward-to-ks-transfer/checks/run_checks.py
```
Five groups of exact SymPy checks pass: finite periodic Ward contraction,
formal plane residues/cocycle classification, the full commutator expansion,
positive-gate differentiation, and rectangular graph transport. All five
deliberate mutations are rejected by assertions; the restored run passes.
The largest matrix is 3 by 3. Raw outputs are `checks/baseline.txt`,
`checks/ward_weight.txt`, `checks/shift_sign.txt`, `checks/mixed_product.txt`,
`checks/recurrence.txt`, `checks/derivative.txt`, `checks/restored.txt`;
`checks/manifest.json` records commands' outcomes and source hashes.
These checks verify the displayed finite identities, not W1 or existence
of a categorical certificate. A GPT-6.1 xhigh skeptical collaborator audited
the actual proof and identified the common analytic disk, explicit translation
hypotheses, and graph-isometry qualifications now included above.

The proofs above concern fixed integer modes and all integer graph orders.
They assert no polynomial uniformity in mode number, smooth smearing,
positive conformal energy, essential self-adjointness, local conformal net,
projective unitary integration, or categorical fidelity. VR-1 itself makes
these exclusions (`cft_machine/research/virasoro_routes.md:151–177`).
The continuum Carpi–Weiner bound is not a proof of lattice A2:
`references/cft-machine/coset-symmetry/CarpiWeiner2004/source.tex:727–747`.

For a general category, the unresolved part is now the following list of
sharp lemmas. All are **full / L0 plus declared geometric and analytic data /
->R2**, not bare consequences of fusion data.

1. **Contour realization.** Construct the positive quotient and boundary
   product interpretation for the same categorical Trotter gates. Prove
   the first line of (5), including removal of collars on both product
   orderings, with an error satisfying (6). D2 (19) alone is a correlation
   identity; LC-W alone is a product rule.
2. **Uniform Ward errors.** Bound every transported local Ward/collision
   error after Gram conditioning and all cell/Fourier counts in the
   one-sided two-loss norm (6). Convergence of scalar coefficients says
   nothing about this norm. The separate Ward error w in (10) is not
   bounded by the geometric-minus-KS error d without an additional theorem.
3. **Regularity.** Prove W3 for the chosen K, or supply explicit bounds for
   each product in (11) and (20). If only fixed-window estimates are
   available, CA-79's P0–P3 theorem uses a stronger control Q^p, p>1;
   it does not establish the brief's chosen K (CA-79:112–155).
4. **Differentiated matching.** Prove (13), or its direct derivative/collar
   alternative, with all coordinates, subtractions, and leakage fixed;
   establish K transport. CA-79 D4-R already shows why compressed currents
   cannot be obtained by taking commutators of compressed densities.
5. **Geometric change of chart and both chiralities.** Show that D2's plane
   contacts produce (5) with the declared cylinder zero mode, and verify
   the barred and zero-mixed identities. E4-P computes the formal answer
   but proves no lattice chart-change estimate.

The local source scope is consistent with these limitations: the original
KS paper warns that commutators require intermediate-state control
(`references/lattice-symmetry/KooSaleur1993/source/9312156.tex:1095–1108`);
the geometric-stress source proves convergence only in its specified
calibration, not for general categorical chains
(`references/lattice-symmetry/ChelkakGlazmanSmirnov2016/source/StressTensor.tex:527–532`).
No missing outside theorem has been silently imported.

## Results ledger

* E4 as stated — **conjectural / unresolved**: its reduced wording does not specify the operator and differentiated estimates used here.
* E4-W — **conditional**: (4)–(6) and A2 imply the explicit A4 estimate (10).
* E4-T — **conditional**: summable geometric-minus-KS error plus A2 transfers A4, with bound (12).
* E4-A — **conditional**: complex metric-defect control and exact K transport imply A3, with bound (14).
* E4-P — **proven**: scalar residue formula (17), canonical Ward charge, and zero-mode shift bookkeeping.
* E4-C — **conditional**: A2, translation, a low-energy anchor and vanishing operator residuals force the two-constant Virasoro form, by finite Jacobi.
* E4-N1 — **negative**: summable insertion error alone does not control commutator error.
* E4-N2 — **negative**: summable real analytic gate errors alone do not control derivatives, even for positive contraction gates.
* E4-N3 — **conditional**: global time intertwining cannot select all coordinate-compatible refinements in a nontrivial tower.
* Full categorical example satisfying W0–W3 and (13) — **conjectural / not constructed**.

## Layer tags

**Setting:** periodic/full; individual chiral calculations apply to either
copy, with mixed hypotheses explicitly separate. **Data layer:** categorical
carrier L0; all analytic certificates and coordinate choices declared in
addition. No braiding, modular data, central-charge lift, characters, or
declared target CFT is assumed. The graph-transfer and cocycle proofs
themselves are category-free, as allowed by `CONVENTIONS.md:1521–1534`.
**Rung:** ->R2 for the proved interfaces; R2 conditional on their hypotheses
plus VR-1 A1. No R1 state construction, R3, R4, or R5 conclusion.

## What this gives the integration

A reusable, explicit interface from a **quantified operator Ward certificate**
to standard KS A4, and from **differentiated** gate matching to A3. It separates
the three errors that the expected route conflates: local Ward/exchange error,
geometric-to-KS identification error, and refinement derivative error.
The central charge c*=12 kappa_3 is extracted from the Ward contacts; the
linear constant also records the chosen energy origin. These are conditional
outputs of a microscopic certificate, not numbers extracted from C alone.

## Open problems

Prove the five lemmas of section 6 for a general categorical construction;
provide one nontrivial verified certificate; establish mode-number bounds
needed beyond fixed-mode R2. No existing CA-76–CA-80 proof is repeated as a
new result. Existence and fidelity remain separate layers.

## Examples table

| Instance | Role and exact boundary |
|---|---|
| Any unitary fusion C with declared periodic realization | E4-W/T/A; no category-specific fusion identity enters. |
| A two-dimensional multiplicity block of the tensor unit | E4-N1/N2 finite matrix checks; not a full conformal categorical certificate. Such blocks can be placed in arbitrary C by using unit multiplicities. |
| Any nontrivial translation-covariant certificate, if supplied | E4-N3 tests the phrase “any refinement”; no existence claim. |
| CGS's n=1 calibration | Local source proves its stress convergence; this note does not claim it verifies W0–W3 or (13). |

## Sources used

Paths are repository-relative; ranges were read locally. Equations (2)–(21)
are verified here; source precedent for the cocycle recurrence is credited.

* `CONVENTIONS.md:704–718,801–810,1099–1115,1196–1215,1397–1448,1483–1519,1521–1534` — central constants, graph norms, OPE and exact KS/tile conventions, layer tags.
* `report/sections/78_categorical_selection_equations.tex:218–251` — collar bridge, actual C1–C6, transfer target.
* `report/sections/79_ks_shell_and_refinement_defect.tex:50–81,85–155,159–176` — standard KS, energy scaling, shell theorem and counterexample, exact leakage.
* `explorations/2026-10-22-astra/D2-selection-principle/NOTE.md:423–465,549–604,606–701` — separating probes, metric derivative, counts/Grams, collars, Ward formula and open operator bridge.
* `explorations/2026-10-22-astra/D2-selection-principle/REVIEW.md:76–97,149–157` — certificate limitations and verified collar interface.
* `explorations/2026-10-22-astra/D2-selection-principle/INTEGRATION.md:104–125` — precise reconciled transfer target.
* `cft_machine/research/virasoro_routes.md:50–177,179–192` — A1–A4, proved graph transport theorem, vacuum-null obstruction and scope.
* `reconstruction/01_cells.md:101–161,164–195` — stress as the same internal generator, Ward propagation and its unbounded accumulation gap.
* `references/lattice-symmetry/GransSamuelssonEtAl2020/source/Linnea11.5.tex:791–820,3191–3198,3220–3229` — KS normalization and two central constants; source's limiting bracket is labelled conjectural there.
* `references/lattice-symmetry/KooSaleur1993/source/9312156.tex:1095–1108` — intermediate-state/commutator caveat.
* `references/cft-machine/coset-symmetry/CarpiWeiner2004/source.tex:727–747` — continuum energy bound, not a lattice certificate.
* `references/cft/Schottenloher2008/Schottenloher2008.md:2507–2517,2552–2589,2610–2634` — cocycle diagonal reduction and cubic recurrence; here the linear coboundary is retained.
* `references/lattice-symmetry/ChelkakGlazmanSmirnov2016/source/StressTensor.tex:527–532,603–626` — geometric stress and restricted scope of established convergence.
* `references/lattice-symmetry/SOURCES.md:966–999,1731–1778`; `references/cft-machine/coset-symmetry/SOURCES.md:3–29`; `references/cft/SOURCES.md:9–30` — provenance for the inspected sources.
