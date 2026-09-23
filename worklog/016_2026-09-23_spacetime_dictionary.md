# Worklog chunk 016 — 2026-09-23

## The net case (CA-87): the dilute Fibonacci chain is the golden chain blocked

### Context

Tobias asked for step 3 of the P1 plan, the Fibonacci net gas with the
trivalent vertex on. The plan was to define the six-coupling dilute
Hamiltonian, derive its spacetime net gas via CA-86, and look for exact
leverage on where it is critical.

### What changed and what was discovered

- Acquired three sources under `references/string-net/` (Fidkowski et al.
  2006, Fendley–Krushkal 2008, Fendley 2008) for the chromatic-polynomial
  evaluation of Fibonacci nets and the Potts low-temperature expansion.
- CONVENTIONS (ad): vertex tile normalisation (isotropic, `Δ†Δ = √φ`).
- Solving the Temperley–Lieb relations in `End(O⊗O)` by hand gives a unique
  reflection-symmetric flip generator `F = φ(|u><u| ⊕ |w><w|)`; the python
  check (`scripts/python/net_tl_representation_check.py`, run bundle
  `runs/2026-09-23-net-tl-representation/`) confirms every TL relation to
  1e-16 for L = 3..6, and then shows `H = -Σ e_i` on L dilute sites is
  **exactly isospectral** to the golden chain on 2L sites, all digits.
- That forced the real theorem (Lemma 87.1): `1 ⊕ τ ≅ τ ⊗ τ`, so the dilute
  Fibonacci chain of L sites *is* the dense golden chain of 2L sites with
  sites paired; nearest-neighbour dilute = pair-aligned range-four dense.
  The "vertex tile outside dTL" of CA-74 is a TL generator across a pair
  boundary. For Fibonacci there is no net gas beyond loops.
- Proposition 87.3: the isotropic Fibonacci net gas with vertex fugacity
  `φ^{-3/4}` equals `φ^{-2} Z_Potts(Q = φ+1, K = x)` (from the sourced
  `<G>_τ` formula, Euler's relation, one-point unions, and the sourced Potts
  expansion). Critical in the c = 7/10 class; the honeycomb critical
  coupling still needs a local source (the sourced `e^{βJ}-1 = √Q` is the
  square-lattice value).
- Table of six calibrated critical points of the dilute Fibonacci chain,
  all with c ∈ {7/10, 4/5}.

### Why these choices

The blocking lemma is what the numerics were telling me; it is more useful
than the "net representation of TL" I set out to construct, because it says
where the net question is real: categories with `1 ⊕ X` not of the form
`Y ⊗ Ȳ`, Haagerup being the case at hand (dimension argument in the shard).
It also resolves the CA-69/CA-74 thread conceptually.

### Frictions and dead ends

- First version of the check demanded all four sign gauges pass; the cup
  sign is tied to the F-gauge (b) and the opposite sign fails at 0.76, so
  the criterion was wrong, not the algebra. Fixed; the expected-failure is
  now asserted.
- The golden-chain cross-check first built the dilute basis for 2L = 18
  sites (75025-dim dense matrices, 42 GB); rewritten in the dense basis.
- numpy had to be pip-installed in the container. Julia port pending.
- I nearly wrote the shard as "a new critical point with the vertex on";
  the isospectrality caught that before it was written. Rule 4.

### Acceptance

- `python3 scripts/python/net_tl_representation_check.py` exits 0: TL
  relations PASS for cup sign +, FAIL (as expected) for cup sign −; mutation
  RED (3e-3); net and golden spectra identical for N = 5..15.
- Guard: 82 shards pass. No PDF rebuild (no LaTeX here).

### Pointers and open threads

- CA-87; CONVENTIONS (ad) + addendum; INDEX rows for the script and run.
- Next: the Haagerup dilute chain `1 ⊕ ρ` (not blocked): enumerate
  `End(O⊗O)`, look for algebra structure and a critical Hamiltonian; then
  the holomorphicity condition. Resolve the HLOTT/Wolf contradiction first.
- Whether the range-four golden-chain family has any critical point outside
  {7/10, 4/5} is open and cheap to probe numerically (dims F_{2L+1}).


## Realignment on intent, and the spacetime Trotter dictionary (CA-86)

### Context

Tobias opened the session dissatisfied: the repo has islands of insight
inside a lot of agent noise, and the recurring failure is carrying physical
intuition through intent to execution. The session was spent first on
alignment, then on one analytical first move. The intuitions, verbatim in
spirit:

1. Levin–Wen's real contribution is that a handful of local RG rules on
   string-net configurations determine the model; the figures are the point.
2. The 2+1 topological order / 1+1 CFT connection has never been made
   rigorous; strange correlators and quantum-group Chern–Simons are the two
   known routes and neither is a compelling physical explanation.
3. Read a Levin–Wen configuration as a *spacetime* (imaginary-time) diagram of
   a 1+1 quantum lattice model; occupied links are anyon worldlines, so the
   model must create and annihilate anyons.
4. Levin–Wen's own continuum limit is a boring TQFT; the job is to put back
   just enough geometry to get conformal symmetry.
5. Conformal invariance can be imposed by (i) RG plus conformal conditions on
   histories, (ii) SLE-type arguments, (iii) isometric/CP RG maps.

**The intent, after two rounds of correction.** The target is a *principle*,
uniform in the category, that determines a critical quantum chain, in the way
Levin–Wen's rules determine the string-net Hamiltonian (even `a_s = d_s/D^2`
is forced by demanding a smooth continuum limit, see the new source
anchors). Which CFT comes out is not prescribed: anything with a projective
unitary conformal action that realises C is by definition acceptable, and it
is unwise to fix the meaning of "realises C" before there is data. The
golden chain, hard hexagons and Potts-from-Tambara–Yamagami are *ad hoc*
Hamiltonians and that ad hoc character is what must be eliminated. Haagerup
is the acid test. Hamiltonian setting preferred throughout: positivity is
manifest and tensor-network / quantum-information tools apply. My first
assessment missed this by treating a specific CFT as the target and calling
the selecting data "a genuine choice"; the correction is recorded here so it
is not repeated.

### What changed

- **CA-86** `report/sections/86_spacetime_trotter_dictionary.tex`:
  - Lemma 86.1: brick-wall Trotter of a chain Hamiltonian built from
    morphisms of C is a sum over spacetime string-net histories with
    amplitude = C-evaluation × product of tile weights. Corollary 86.2: the
    Levin–Wen rules (2)–(4) are automatic; only isotopy (rule 1) is broken,
    by the tile weights. This is Intuition 3 made precise.
  - Proposition 86.3: on an integrable line the Trotter product *is* the
    transfer matrix at small spectral parameter and H commutes with T(u) for
    all u, so the Hamiltonian limit and the isotropic point share eigenvectors
    exactly; no perturbative rate matching needed there.
  - Dense calibration: exp(βe) = 1 + w e exactly; golden chain c = 7/10.
  - Dilute calibration: the sourced nine-tile face operator gives the
    integrable dilute Hamiltonian with every coupling a function of λ alone,
    λ fixed by n = d up to a two-fold branch.
  - Proposition 86.4 (derived): at u = λ the nine-tile model reduces to the
    honeycomb O(n) model with x = 1/(2 cos λ), which equals Nienhuis's
    x_c(n) on branch 1 and 1/sqrt(2 − sqrt(2 − n)) on branch 2. Checked
    numerically for L = 2..5 (python, session scratch; command below).
  - Frontier: the Fibonacci net gas (six couplings, vertex tile outside dTL
    by CA-74); no integrable line known once the vertex is on.
- **CONVENTIONS (ac)**: tile dictionary, brick-wall order, nine-tile ↔ dTL
  identification pinned by u = 0, loop fugacity = quantum dimension.
- **Sources**: the 2005 Levin–Wen paper was **not on disk**; the root manifest
  row `SRC-STRING-NET` pointed at the 2007 topological-entanglement-entropy
  paper (already noted in `archive/legacy-consolidation/ERRATA.md:227–231`,
  never fixed). Acquired cond-mat/0404617 (e-print + PDF) under
  `references/string-net/`, wrote its `SOURCES.md` with anchors, relabelled
  the root row `SRC-LEVIN-WEN-2007-TEE`.
- **Bib fix**: `FinchFrahmGainutdinovKorff2014` (1408.1282) had wrong authors
  and title; corrected to Finch–Flohr–Frahm against the local md. Key kept.
  `literature/SURVEY.md` is DB-generated and still shows the old title; the
  DB seed was not touched (no sqlite in this container).

### Why these choices

P1 (deform the Levin–Wen rules geometrically, keeping (2)–(4)) was chosen as
the first move because the loop case has a complete sourced answer against
which a dictionary can be calibrated before any numerics. The dictionary
shows that for Temperley–Lieb type input the category fixes everything but a
branch: the "geometry" of Intuition 4 is the anisotropy u, not a coupling.
That is a much stronger statement than the perturbative rate comparison
originally planned, and it is exact only because of integrability.

### Frictions and dead ends

- No `latexmk`, `pdflatex` or `julia` in this container: the shard guard
  passes but `report.pdf` is **not rebuilt** and no Julia testset was added.
  Open item: port the Proposition 86.4 identity check to a Julia testset and
  rebuild the PDF on the laptop.
- The numeric check used here (reproduce with `python3`):
  for L in 2..5 and branch b, λ = (π/4)·L/(L+1) (b=1) or (π/4)·(L+2)/(L+1)
  (b=2); n = −2cos4λ; verify n = 2cos(π/(L+1)), 1/(2cosλ) = x_c(n) (b=1) or
  x̃_c(n) (b=2), ρ_2/ρ_1 = x, ρ_4/ρ_1 = x², ρ_4 = ρ_6 = ρ_8, ρ_9(λ) = 0, and
  c = 1 − 6/(h(h−1)) = 1 − 6(g−1)²/g with g = 2(1 − 2λ/π). All pass; L = 2
  branch 2 is degenerate (sin 3λ = 0), consistent with the source's L ≥ 3.
- The dilute chain's integrable cup-cap term is *repulsive* on both branches
  (opposite sign to the golden chain) and the P_XX coupling vanishes on
  branch 1 for Fibonacci (sin 5λ = 0). Not a bug; worth remembering.
- First assessment drafted a "self-duality forces criticality" principle;
  dropped after checking Aasen–Fendley–Mong, who state that critical points
  are self-dual but not conversely.
- Four Opus workers were used for the initial survey and audit; their
  reports are summarised in chat only. Key audit facts worth keeping: the
  spacetime reading appeared nowhere in the repo; Aasen–Fendley–Mong is held
  locally and was uncited; the qubit SDP block (30 shards) is self-rejected
  by CA-60; the coset/cft_machine branch takes a known CFT as input; the
  Haagerup canonical point H = −ΣP_ρ is reported critical (c ≈ 2) in
  `literature/md/2110.03008` and gapped in Wolf's thesis — unresolved
  contradiction, likely a convention (Rule 3).

### Acceptance

- `scripts/check_report_shards.sh`: 81 shards pass (CA-86 ≤ 280 lines,
  header, catalog and README mirrored, included once).
- Proposition 86.4 numerics as above.
- No Julia run, no PDF rebuild (tooling absent).

### Pointers and open threads

- Next shard: a lattice holomorphicity condition on a Z(C)-spin defect
  endpoint for the Fibonacci net gas (P3 of the sweep), first checked
  against the loop case where it must reproduce the integrable weights.
- Resolve the Haagerup contradiction (HLOTT vs Wolf) at the canonical point.
- Fix the vertex-tile normalisation in CONVENTIONS before any net-gas code.
- Triage of the qubit/Gaussian/Galilean/coset blocks was proposed in chat
  and not executed; Tobias has not yet ruled on it.
