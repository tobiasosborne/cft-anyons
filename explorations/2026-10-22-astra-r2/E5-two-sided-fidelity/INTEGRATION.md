# E5 integration package

Basis: `NOTE.md` and `REVIEW.md` in this directory, with grade PROOF-COMPLETE under the note's
stated hypotheses. Tags follow CONVENTIONS (aq).

## (a) The theorem as established (LaTeX-ready)

\textbf{Lemma 89.1 [proved; any; category-free; $\to\mathsf R4$] (normal limit expectation).}
\textbf{Assume}:
\begin{itemize}
\item increasing unital finite (or arbitrary) von Neumann inclusions $\mathcal N_k\subset\mathcal M_k$ with
  $\mathcal N_k\subset\mathcal N$ and $\mathcal M_k\subset\mathcal M$, where every element of $\mathcal N$
  (respectively $\mathcal M$) is a bounded strong$^*$ limit of elements of $\mathcal N_k$
  (respectively $\mathcal M_k$);
\item normal conditional expectations $E_k:\mathcal M_k\to\mathcal N_k$;
\item a normal state $\psi$ on $\mathcal M$, faithful on $\mathcal N$, with $\psi\circ E_k=\psi|_{\mathcal M_k}$;
\item $b:=\liminf_k K(E_k)<\infty$, where $K(E)=\inf\{\beta:E(x)\ge\beta^{-1}x,\ x\ge0\}$.
\end{itemize}
\textbf{Then} there is a unique $\psi$-preserving normal expectation $E:\mathcal M\to\mathcal N$. It satisfies
$E(x)\ge b^{-1}x$, $\psi$ is faithful, and $E_k(x_k)\to E(x)$ strong$^*$ in the GNS representation of $\psi$,
together with the Jones projections (NOTE E5-L, E5-J).

For compatible $E_k$ the common state may be replaced by the exact criterion that $\varphi\circ E_0$
extends normally. The cost is then $K(E)=\sup_kK(E_k)$ (E5-N). Neither commutants nor complete
positivity of $E_k-\lambda\,\mathrm{id}$ is used.

Sharpness:
\begin{itemize}
\item compatible maps with uniform cost 2 and full exhaustion need not extend (E5-X1);
\item Jones convergence without ambient exhaustion underestimates the index (E5-X2);
\item the bound is attained by $R\otimes1\subset R\otimes M_n$ with costs $n\min(2^k,n)\uparrow n^2$ (REVIEW §3.4).
\end{itemize}

\textbf{Theorem 89.2 [proved given (F1); ch; L0+L4 / L1+L4; R4] (two-sided fidelity).}
\textbf{Assume}:
\begin{itemize}
\item $\Alg$ is a completely rational conformal net on a separable Hilbert space;
\item $\Cc$ is a unitary fusion category with a fully faithful unitary tensor functor
  $\Phi:\Cc\to\mathrm{DHR}_{\mathrm{fin}}(\Alg)$;
\item Lemma 89.1 holds for the four-interval inclusion with $b\le\operatorname{Dim}\Cc$.
\end{itemize}
\textbf{Then} $\Phi$ is a tensor equivalence, $\mu_\Alg=\operatorname{Dim}\Cc$, and there are no further sectors.
Dimensions are preserved automatically ($d=\mathrm{FPdim}$, Bischoff:622--626). If $\Cc$ is braided and $\Phi$ is
braided (L1), then $\Phi$ is a braided equivalence and $\Cc$ is modular (KLM c23). This is NOTE E5-F with its
data layer lowered (REVIEW §4).

\textbf{Corollary 89.3 [proved; full; L2+L4].} The doubled chiral net $\Alg\otimes\Alg^{\mathrm o}$ has sector
category $\Cc\boxtimes\Cc^{\mathrm{rev}}\simeq Z(\Cc)$ of dimension $D^2$. Its canonical LR (diagonal) extension
has \emph{trivial} finite DHR category (KLM p18, c23). The diagonal theory's defect category is $\Cc$, with centre
$Z(\Cc)$.

Status: the analytic lemma is complete. The lattice obligations (EP, AN) are conditional and unconstructed for any
$\Cc$.

## (b) Destination

**New shard, proposed CA-89** (or the next free ID if E1–E4/E6 claim it first):
`CA-89-NORMAL-LIMIT-EXPECTATIONS`, title *Normal Limit Expectations and the Repaired Two-Sided
Fidelity Certificate*. CA-80 is at 266/280 lines and cannot absorb this.

The amendment to CA-80 is three lines in "The gap, explicitly" (around lines 187–204):
- append "Closed along route (ii) in CA-89 (Lemma 89.1), with a common normal state replacing
  compatibility; route (i)/(iii) unnecessary";
- change Theorem 80.9's status note to "[conditional on (F1) only, given the 89.1 certificate]".

Also update the R4 row of CA-88's Def. 88.3 table ("80.9 two-sided [cond., PP gap]" → "80.9 +
89.2 [cond. on R3]").

Outline of CA-89 (about 200 lines):
1. Status, sources (KLM:430–443, 507–556, 1719–1729, 1578–1587, 1861–1879; B:604–664; CA-80)
   and dependencies.
2. Scoped definitions: cost K(E), q, bounded exhaustion, auxiliary normal state (not the vacuum).
3. Lemma 89.1(a): the positive-graph passage (E5-G).
4. Lemma 89.1(b): construction of the normal limit (E5-L), Lamport proof.
5. Corollary: Jones/expectation convergence (E5-J). Proposition: the compatible iff criterion
   (E5-N) and the selection certificate (O).
6. Counterexamples X1 and X2, plus the sharp calibration R⊗1⊂R⊗M_n.
7. Theorem 89.2 at L0/L1 (the lowered layer), with the dimension-redundancy remark.
8. Corollary 89.3: doubled subnet versus LR extension. Correction of the "Z(C) = DHR of the
   diagonal theory" reading.
9. Lattice obligations EP/AN as conditional lemmas, plus the vacuum exclusion (Lemma 80.10).
10. Open problems and examples table (Vec, generic UMTC, calibration).

## (c) CA-88 grid cells

- **R4 row (braided sector fidelity, L2):** the "PP gap" annotation is removed. The cell becomes
  "80.9+89.2, conditional on R3 plus lattice certificates EP/AN".
- **R4 sub-rung "fusion-level / defect" at L0:** Theorem 89.2 gives *sector* tensor equivalence
  at L0+L4. This is stronger than the defect-only entry, and it needs a declared net.
- **D5-C restatement in CA-88:** its "first lemma" (compatible, CP-difference E_k) is
  **superseded**. Neither compatibility nor CP is needed. The new first lemma is EP/AN (see (e)).
- **S_full definition (Def. 88.1):** Cor. 89.3 sharpens it. Bulk Z(C) belongs to the *doubled
  chiral subnet* or the defect centre, not to DHR of the full extension.

## (d) Links and conflicts

- **E2 (parity/chirality):** E2-C/E2-P show that a parity-paired standard KS limit carries both
  stress families. A chiral target for 89.2 therefore needs parity breaking (E2-D/E2-A) or must
  be read as the left chiral subnet of a full limit. Cor. 89.3 gives the matching full-setting
  statement. Conflict: none. 89.2's setting tag "ch" must be read with E2's caveat.
- **E3 (reflection positivity / OS):** this feeds (F1)=R3 upstream. No conflict.
- **E4 (Ward-to-KS) and E1 (local unital lift):** these feed R2 and R0^u/R1. 89.2 consumes R3 and
  does not replace these. No conflict.
- **E6 (number-changing continuum):** nonrelativistic, below R3. No direct link.
- **Round 1:**
  - The result repairs D5-F / CA-80 Thm 80.9 exactly as the D5 review proposed, via repair
    route (ii), and strengthens it: no compatibility, no CP.
  - Prop. 80.8 (the scalar falsifier) and Lemma 80.10 (vacuum) stay in force. The common state
    must be non-vacuum.
  - Consistent with CONVENTIONS (u): minimum target versus braided equivalence.

## (e) The single next lemma

**Annular approximant lemma (any; category-free, then L0+L4 calibration).** Construct, for a
sourced completely rational net (first CA-82's instance, then a general one), increasing
finite-dimensional N_k⊂M_k inside the four-interval inclusion with the following properties:
- bounded exhaustion of both N_k⊂N and M_k⊂M;
- a non-vacuum normal state ψ preserved by expectations E_k;
- K(E_k)→μ_A. This is forced to be exact, because the limit expectation is unique.

Equivalently, show that the minimal-cost expectations of some exhausting family preserve one
normal state. This is the non-vacuity of Lemma 89.1 for type III_1 inclusions. Without it,
Theorem 89.2 is a correct implication with no known instance.
