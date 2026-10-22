# Worklog chunk 020 — 2026-10-22

## Integration sprint: survey, CA-86/87 merge, six Astra explorations, CA-76--CA-80

### Context

- **Directive (Tobias, 2026-10-22).** Model hyperfixation is the project's
  principal failure mode: work stalled repeatedly when it narrowed onto one
  example (Fibonacci, Ising, golden chain, semion, a coset). Recorded as the
  north-star paragraph "Models are examples, never the subject"
  (`AGENTS.md:78-94`) and Rule 16 (`AGENTS.md:231-236`), commit `399dae3`.
  The stated goal is to **align and integrate** the existing approaches: the
  variable-N tower CA-62--74, the spacetime dictionary CA-86/87, the
  `cft_machine/` OAR contracts, and the `reconstruction/` sewing and fidelity
  equations. They should become one model-independent pipeline for a general
  unitary fusion or modular category with declared extra data.
- **Repo survey (read-only).** Twelve Sonnet/Haiku readers, three Opus judges
  and one Opus synthesis. The full synthesis is in the session scratchpad
  (`accretion-overview-2026-10-22.md`). It is **not in the repo**, and
  nothing below depends on it beyond this summary. Its verdicts, briefly:
  - **Four restarts of the same north star.** Each has its own pipeline
    definition (CA-01, CA-62, CA-81, `reconstruction/README`) and its own
    acceptance contract (CA-15, CA-67, CA-81, LC-4). No seam was closed
    across eras.
  - **Nothing goes end to end** from category data to a local lattice model
    to an OAR limit with fidelity. The CA-82 Ising compiler is a calibration:
    it uses S/T lookup, reads no F/R, and imports its fidelity.
  - **Keep-core:** CA-00/01 (spine statement), CA-14/15 (KS anchor and
    contract skeleton), CA-71--74 plus the July `src/` chain (the only F-symbol
    lattice operators), CA-81 WT-1/VR-1 with the fermion `WILSON_PROOF`/`PROOF`,
    LC-4 (`reconstruction/04_cutoff_oar.md`), LC-12 §5, `scripts/python` with
    the October runs, `worklog/`, `references/`, and `CONVENTIONS.md`.
  - **Archive (proposed, not done):**
    - the Galilean block CA-18--22;
    - the Gaussian block CA-23--33;
    - the never-built compiler spec CA-04/05/07/08/16/17;
    - the qubit SDP block CA-34--61 and CA-63/64, including the Mosek
      dependency (the reason `Pkg.test` is suspended);
    - the derived `cft_machine/report.*` and `compiler_minimal/`;
    - `literature/SURVEY.md`;
    - raw process logs.
  - **Freeze:** CA-70, CA-84 CH-3/CO-1--3, and `archive/legacy-consolidation`.
  - **Merge:** CA-38/39/42--44 into CA-73; CA-62/65/66/68 prose; CA-67 into
    one contract; LC-1--3 and LC-5--8.
  - **Open questions for Tobias:** chiral vs full target; bare MTC vs enriched
    input; whether a generic F-symbol chain counts as a forbidden "known
    model"; delegation policy; archiving approvals.
- **Merge of the 2026-09-23 branch.** `a120439` and `992b0df` brought in CA-86
  (string-net histories as Trotter expansions) and CA-87 (blocking lemma).
  Branch convention labels were relabelled to avoid clashes with the October
  entries: **(ac)→(ak)** (spacetime tile dictionary) and **(ad)→(aj)**
  (vertex tile normalisation). The branch worklog chunk was renumbered
  016→019.
- **Six Astra explorations.** Location: `explorations/2026-10-22-astra/`.
  Codex model gpt-6-astra at reasoning xhigh, one per direction D1--D6. Each
  produced a `NOTE.md` with checks, and each received an Opus sceptical
  reconciliation review (`REVIEW.md`) and integration package
  (`INTEGRATION.md`). **All six headlines were graded "needs reformulation"**
  (INTEGRATION.md §(d) in each directory):
  - **D1-C** (collision-sewing limit): category analytically inert. The
    number-changing continuum exists only through a tuned contact term, and
    the limit is z=2 nonrelativistic with no Wilson, KS or fidelity content.
  - **D2-C** (certificate C1--C6 suffices): sufficiency, not selection.
    Category-blind; no verified instance.
  - **D3-C** (polar heat dressing is quasi-local): a UV locality lemma. It
    cannot by itself give summable WT-1 drift at criticality.
  - **D4-C** (inverse discretisation): not a statement about C. Any spin chain
    fits the carrier, the input is the full CFT, and site growth is
    unconstrained.
  - **D5-C** (annularly saturated lattice realisation of every UMTC):
    contains the open UMTC reconstruction problem, is degenerate unless c > 0,
    and nearly duplicates D6-C.
  - **D6-C** (effective coherent compiler): contains the open realisation
    problem; its chiral-limit clause conflicts with D2/D4/D5, and automorphism
    lifting is unstated.

### What changed

- **Five new shards**, each written by a separate agent from the reviewed
  notes. Review grades are carried per statement and nothing is promoted.
  Registered in `report.tex`, `report/README.md` (order 76--80; later rows
  renumbered so that order now equals the CA number) and
  `report/SHARD_CATALOG.md`:
  - **CA-76** corner-to-Wilson bridge (D3, D6, D1 §4):
    - Corrections 76.A--C to CA-72/73;
    - strict-lift drift bound 76.1 (`d_{k,n} <= p_n e_n + 2q_n`, sharp,
      derived);
    - scalar augmentation 76.2;
    - unital-extension criterion 76.3/76.4;
    - braided local lift 76.5 (proposal);
    - gap route 76.6 (conditional-ok);
    - polar tangent 76.9;
    - D3-C as Conjecture 76.10;
    - the dichotomy behind Link (b3), Question 76.12.
  - **CA-77** pointed carriers (D1): unital vs corner towers, occupation
    grading and parity criterion, decidable dual-pair blocking (generalises
    Lemma 87.1), constant Morita class, configuration Fock carrier, and D1-C
    with its caveat.
  - **CA-78** categorical selection equations (D2): coefficient compiler,
    exact gate ODE, blocking leakage, cubic cokernel test, YBE vs brick sweep
    (repaired converse), erratum to Prop. 86.3, and conditional interface
    lemmas.
  - **CA-79** KS tiles, shell certificate and refinement defect (D4): tile
    modes; P0--P3 ⇒ VR-1 (conditional); defect split; exact-covariance no-go;
    sharp c > 1 character threshold (conditional).
  - **CA-80** lattice sewing and fidelity certificate (D5): exact sewing
    along tile legs, temporal reflection positivity, Ward product rule, scalar
    falsifier `D_a = d_a 1`, and the two-sided certificate 80.9 (conditional;
    the index limit step is open).
- **CA-75 integration map** (now 277 lines):
  - The six exploration placeholders are replaced by compact status entries
    that point to CA-76--80 and carry the headline grades.
  - Row (2) is qualified per the Prop. 86.3 erratum.
  - Link (b) now says "GNS-seminorm defect" in place of "modulus of
    softness", and records: (b2) answered in the strict case (76.1); (b1)
    reduced to a *local* unital lift (76.2--76.5); (b3) open (76.12).
  - The fidelity row records the sharp c > 1 threshold.
  - New subsection "Decisions Required (2026-10-22)".
  - The stale "unmerged branch" boundary sentence is fixed.
- **Errata**, appended as dated paragraphs; theorem bodies untouched:
  - **CA-72:** Cor. 72.8 is not an operator-norm soft-C* claim.
  - **CA-73:** Lemma 73.1's support reading holds via the local
    representative `S_j`, and constants transport with `P`.
  - **CA-86:** Prop. 86.3's attribution. The brick sweep is Koo–Saleur's
    row-to-row `tau-hat`, and the commuting family is `tau-hat_D` (KS
    `9312156.tex:603`, `:717-725`). The ground-state claim also needs
    nondegeneracy.
- **CONVENTIONS (al)--(ap)** (2026-10-22):
  - (al) bond energy `k_j := -h_j`, exact tiles, cut and index notation;
  - (am) pointed site object (X may contain 1) and ordered configuration
    carrier, amending (r);
  - (an) corner-weight/Wilson-drift notation;
  - (ao) coefficient compiler;
  - (ap) KS tile modes and shell grading.

  The shard dependency lines of CA-76--80 were updated to cite them.
- **INDEX.md:** rows for `explorations/2026-10-22-astra/` and for the July
  testset verification note.
- **July testsets green.** The five testsets of `test/runtests.jl:1095-1937`
  (word algebra, CA-71, CA-72, CA-73, CA-74) were extracted to a
  scratchpad script and run standalone with `using CftAnyons` on Julia
  1.12.5: **565/565 pass in 26 s**. This is a verification note only, with
  no run bundle and the script not committed. It confirms that the July
  F-symbol chain (the survey's keep-core code) is live.

### Why these choices

- **Separate shards, not a CA-75 expansion.** The reviewed paragraphs total
  about 110 lines and would have pushed CA-75 to about 350. CA-75 stays a map
  that cites statement numbers. The full reviewed paragraphs remain in each
  `INTEGRATION.md` §(a).
- **Errata as appended paragraphs.** This follows the explorations'
  wording: the corrected statements are qualifications, not retractions.
  Thm 72.7, the transport identity of 73.1, and the conditional implication
  of 86.3 all stand.
- **Convention ordering.** (al) is the shared `k = -h^(ak)` sign, used by
  CA-76/78/79/80. CA-80 already cited it as "(al)". All five shard agents had
  proposed "(al)"; they were relabelled (am)--(ap) at integration.
- **D6 has no shard.** P1, P2 and N1 live in CA-76. The typed contract
  K0--K12, P3/P4 and N2/N3 stay in the note until the chiral-vs-full decision
  fixes the target category.

### Frictions / dead ends

- **ID collisions:**
  - `PLAN.md` (07-06) had reserved "CA-78 DILUTE-KS-ON-WORD-SECTORS" for a
    W2.2 shard that was never written. CA-78 now means the selection
    equations.
  - D2 and D6 INTEGRATION each proposed "CA-88" for different content.
  - Neither reservation is live; future agents should not resurrect them.
- **Notation clashes** (each entry is shard-scoped):
  - CA-75 Link (b)'s `ε_n` is CA-76's `q_n`. CA-75 now says so.
  - CA-76's `e_n` (pullback mismatch) is written `r_n` in CA-75, to avoid
    (af)'s `e_n`.
  - CA-79's `ε_N` is the (af) density subtraction, while CA-76's `ε_n` is a
    vacuum residual.
  - CA-79 divides `k` by a velocity; (ap) declares it.
- **Character-growth constant.** D4 REVIEW.md:120-121 says LC-12 §5's crude
  bound needs c > 24/π². Recomputing from LC-12:183-195 gives c > 12/π², in
  agreement with D5 REVIEW.md:105-106. CA-79 uses 12/π² and cites D5. The
  D4 review line is therefore wrong; it was left unedited because it is the
  reviewer's record.
- **Unsupported attributions:**
  - The "Reshetikhin condition" attribution for the cubic cokernel test has
    no local source (Law 1 gap, flagged in CA-78).
  - The quasi-locality sources that could prove D3-C are not local.
  - Pimsner–Popa 1986 and finite-dimensional index sources, needed to repair
    D5-F step <1>1, are not local.
- **Interface mismatch:** CA-76/77 work on open chains with declared
  endpoints, but LC-4's KS tier is periodic. Not resolved.
- **Checks not ported.** Exploration checks are Python bundles inside
  `explorations/` and have not been ported to `scripts/` with `runs/` bundles.
- **Overfull boxes.** The new shards and CA-75's dependency line produce
  overfull hbox warnings. They are cosmetic and not fixed.

### Open decisions for Tobias

1. **Chiral vs full target.** `PLAN.md` D1 (`reviews/2026-07-06_pipeline_consistency_scoping/PLAN.md:244-247`)
   has been open since 07-06. D6 asks for a chiral limit net, while D2, D4
   and D5 target full two-chiral theories (CA-80 open-decision paragraph).
2. **Bare MTC vs enriched input.** Are the central-charge lift (an MTC fixes
   c only mod 8), the sector weights and the generating fields part of the
   declared data E, or must the pipeline synthesise them? See D4
   INTEGRATION.md:137, D6 INTEGRATION.md:84, :105-106, :130, and
   `cft_machine/research/realisation_and_fidelity.md`.
3. **Instances.** Does a generic chain `h in End_C(O⊗O)` on a categorical
   carrier (a generic F-symbol chain) count as an instance of C? The D2 and
   D4 headlines admit every spin chain.
4. **Survey follow-ups** (scratchpad synthesis, not in repo):
   - archiving approvals (qubit/Mosek, Gaussian, Galilean, compiler spec);
   - Python as a sanctioned check layer;
   - delegation and model-tier policy;
   - the `.beads/` directory and the root `summary.pdf`, both untracked.

### Acceptance

- `make check-report-shards`:
  `report shard check: 88 shards included, labeled, cataloged, all <= 280 lines`.
- `make report` (latexmk, 3 pdflatex passes): `report.pdf`, 221 pages. No
  errors, no undefined references or citations, and no rerun warning on the
  final pass.
- July testsets: 565/565 standalone (see above). Full `Pkg.test()` was not
  run (suspended).
- No commit was made in this step.

### Pointers

- Shards: CA-75, CA-76--CA-80 (new), errata in CA-72, CA-73 and CA-86.
- `explorations/2026-10-22-astra/D{1..6}/{NOTE,REVIEW,INTEGRATION}.md`; briefs
  in `briefs/`.
- CONVENTIONS (aj), (ak) (relabelled at merge) and (al)--(ap) (new).
- First attackable lemmas (from INTEGRATION §(d)):
  - D3: second-order step of D3-C;
  - D4: P0--P3 for the quasi-free calibration;
  - D5: finite-stage index lemma passing to the limit;
  - D6/R1: braided local lift on a non-pointed instance with sourced F, R;
  - D2: Ward-to-KS transfer (Target 78.13).
