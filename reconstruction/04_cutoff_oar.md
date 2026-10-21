# LC-4 — Microscopic and analytic conditions, separate from formal sewing

**Status:** explicit proposed sufficient certificates for parts of the
programme, not a proved universal sufficiency/existence theorem.
Conventions: (ac)–(af). The ideal equations in LC-1–LC-3 do not impose exact
nonzero-central-charge Virasoro relations on finite matrices.

**Sources:** `literature/md/2010.11121/2010.11121.md:126–180` (OAR states,
GNS and dynamics); `references/lattice-symmetry/KooSaleur1993/source/9312156.tex:543–568,1094–1108`
(local density identification and products in scaling limits);
`references/lattice-symmetry/GransSamuelssonEtAl2020/source/Linnea11.5.tex:791–820`
(prescribed KS form). Conditional telescoping derivations: CA-81 WT-1 and
`cft_machine/research/virasoro_routes.md`, VR-1. These analytic lemmas do
not select a microscopic backend or supply missing categorical data.

## 1. Finite unknowns and actual local Hamiltonians

At cutoff n choose a finite categorical observable algebra A_n with a
declared local support structure, translation tau_n, Hermitian density h_n,
and local unital injective refinement alpha_n:A_n->A_(n+1). A finite range
in lattice sites must be specified; non-factorizing fusion constraints are
allowed. Circle circumference is fixed while site count N_n grows.
The displayed periodic nearest-neighbour tier starts at N_n>=4, so the
two neighbouring terms are distinct and there is no coincident-wrap case.

One sufficient local transfer construction uses finite-support factors
G_(n,j)(t) with G_(n,j)(0)=1. The row transfer is their ordered product.
Differentiating at zero gives H_n^raw=sum_j h_(n,j), with
h_(n,j)=-G'_(n,j)(0). This is the product rule, not an assertion that the
logarithm of an arbitrary finite-time transfer operator has finite range.
Reflection/positivity and semigroup-limit estimates remain necessary.

For the nearest-neighbour tier (af), define

    h_(n,j)=tau_n^j(h_n), J_(n,j)=i[h_(n,j),h_(n,j+1)].

Disjoint-support commutativity gives exactly

    delta_n(h_(n,j))=J_(n,j-1)-J_(n,j),
    delta_n(a)=i[H_n^raw,a].

Search also for bounded-support flux q_n, improvement u_n, and residuals
r_n,s_n such that, with D=1-tau_n^(-1),

    delta_n(J_n)=-D q_n+r_n,  q_n-h_n=D u_n+s_n.

These last two equations are candidate stress/conservation constraints;
their exact finite-cutoff versions are NOT asserted necessary for every CFT
limit. Residuals must be controlled in physical rescaled units.
For fixed h_n and declared finite patch ansatz spaces, the flux obstruction is

    [delta_n(J_n)] in coker(D:allowed flux coefficients -> residual patch).

A compatible infinite-patch presentation, if additionally supplied, permits
the larger quotient A_loc/D A_loc. A finite ring by itself does not certify
uniformly bounded support. The finite patch condition is a linear range
problem. This is a spatial-divergence quotient: delta_n^2 need not vanish, so delta_n is
not a cochain differential. A density improvement changes nonzero KS modes
even when it leaves the periodic total Hamiltonian unchanged.

## 2. Standard KS operators are determined by the density

Use exactly the normalized nearest-neighbour tier of (af):

    L_(n,m) = N_n/(4*pi) sum_j exp(2*pi*i*m*j/N_n)
               (h_(n,j)-e_n*1-J_(n,j)) + b_n delta_(m,0)*1,
    Lbar_(n,m) = N_n/(4*pi) sum_j exp(-2*pi*i*m*j/N_n)
               (h_(n,j)-e_n*1+J_(n,j)) + b_n delta_(m,0)*1.

The source displays this form after its model's velocity normalization;
here it specifies a candidate tier. e_n and b_n are real and cutoff
dependent. The geometrically derived insertions must equal these densities
or have explicitly bounded discrepancies. Modes are not free fit variables.

Define R^(++)_(n;m,k) by subtracting from [L_(n,m),L_(n,k)] the expression

    (m-k)L_(n,m+k)+delta_(m+k,0)*(m^3*c*_n-m*c_n)*1/12.

Define the analogous barred residual and R^(+-)=[L,Lbar]. Require
c_n,c*_n -> c with declared rates and b_n -> c/24 in this normalization.
The same limiting c must match the geometric anomaly. No finite-cutoff
exact central commutator is demanded; LC-2 Proposition 5 explains why.

## 3. Positivity, state limits and the same refinement system

Microscopic states sigma_n and ground energies E_n may be sought through

    sigma_n(1)=1, sigma_n(a* a)>=0,
    H_n^raw-E_n*1>=0, sigma_n((H_n^raw-E_n*1)^2)=0.

These give a ground-state tier, not a mandatory choice of all possible
initial states. E_n, e_n and b_n have different roles. Algebra refinements
must satisfy, in finite bases,

    alpha_n(1)=1, alpha_n(ab)=alpha_n(a)alpha_n(b),
    alpha_n(a*)=alpha_n(a)*,

as well as injectivity and the declared support bound. Let alpha_n^k be
the composite embedding from k to n. A quantitative Wilson condition is

    ||sigma_(n+1) o alpha_(n+1)^k-sigma_n o alpha_n^k|| <= d_(k,n),
    sum_(n>=k) d_(k,n) < infinity,

with a computable tail majorant. The norm is the dual operator norm.
WT-1 then gives compatible states omega_k from the horizontal limits.
Their GNS refinement is specifically

    J_k [a]_(omega_k) = [alpha_k(a)]_(omega_(k+1)).

The comparison Hilbert spaces are these GNS spaces; identification with
any earlier chosen microscopic carriers is separate. Arbitrary Hilbert
isometries do not supply unital observable maps via a->JaJ*: that is
generally a corner map.

## 4. One explicit all-scale operator certificate

Represent the prescribed modes on the foregoing GNS spaces and denote
either chiral family by T_(n,m). Seek positive controls K_n>=1 with
K_(n+1)J_n=J_n K_n. This is a stringent sufficient tier, not a claim that
physical Hamiltonians must intertwine exactly. For integers m,k and s>=0:

    ||K_n^s T_(n,m) K_n^(-(s+1))|| <= C_s(1+|m|)^p_s,

    ||K_(n+1)^s (T_(n+1,m)J_n-J_n T_(n,m)) K_n^(-(s+1))||
       <= epsilon_(n,m,s),   sum_n epsilon_(n,m,s)<infinity,

    ||K_n^s R_(n;m,k) K_n^(-(s+2))|| <= eta_(n;m,k,s) -> 0.

Specify all constants, tails and the mixed-chirality residuals. The
conditional VR-1 telescoping argument controls finite products, not just
individual mode limits. A local recurrence that proves these bounds would
be a useful finite certificate; finite sampled decay is insufficient.
Increasing boundary-state cutoffs along refinement is explicitly allowed.

The cell Ward residual propagation in LC-W explains how to propagate
local errors, but it does not alone yield these energy-weighted bounds.
Growing numbers of cells and intermediate high-energy states must be
included in the majorants.

## 5. What remains beyond these certificates

Even the displayed graph bounds do not by themselves establish positive
conformal energy, self-adjoint stress closures, group integration, local-net
axioms, or categorical completeness. They construct a controlled mode
algebra on a common domain under their hypotheses. For real smearings,
essential self-adjointness and convergence of unitary implementers require
their own domain/commutator estimates or a precisely applicable theorem.

Carpi--Weiner `references/cft-machine/coset-symmetry/CarpiWeiner2004/source.tex:700–747`
starts with a positive-energy Diff representation; it is not an existence
theorem for arbitrary formal solutions. The integration statement in
Schottenloher `:3044–3056` applies to its unitary highest-weight modules.
Formal chiral-field locality is not automatically strong Hilbert-space
locality. Complete category identification must recover all required
sectors and their coherence, and exclude unintended sectors.

This is therefore a layered problem: solve local equations; obtain positive
analytic realizations with certified bounds; construct the same OAR/KS
system; prove the complete local CFT and category identification. No step
is replaced by calling a finite set of matrices "conformal".
