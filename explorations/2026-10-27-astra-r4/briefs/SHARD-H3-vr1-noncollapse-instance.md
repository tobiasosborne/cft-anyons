# Round 4 SHARD brief (Opus) — explorations/2026-10-27-astra-r4/H3-vr1-noncollapse-instance -> @@CA-104-VR1-NONCOLLAPSE-AND-FIRST-INSTANCE@@

You are the integrator for one reviewed proof note in the repository at the
current directory (`/home/tobias/Projects/cft-anyons`). Read `AGENTS.md`
first, whole (Rules 5, 9, 11, 16, 17, 18 and the Shards section bind; and Tobias's generality rule of 2026-10-27: every statement is formulated for an arbitrary unitary fusion category C and examples appear only as checks in the examples table; name the pillar P1-P4 the shard serves in its status subsection). Then read,
in this order: `report/sections/89_ward_ks_transfer.tex` and
`report/sections/94_number_changing_collision_dynamics.tex` (STYLE MODELS: a
round-2 shard lifted from a reviewed note, with grades carried per statement,
Lamport steps condensed, tags (S; L; R) on every statement),
`report/sections/88_layered_targets.tex` (the grid and the tag vocabulary),
`CONVENTIONS.md` entries (aq)-(ax), the preamble of `report.tex` (the macros
you may use: use ONLY macros defined there), and the package
`explorations/2026-10-27-astra-r4/H3-vr1-noncollapse-instance/`: `NOTE.md` (the proof), `REVIEW.md`
(the sceptical review; its GRADE and per-step verdicts are binding),
`INTEGRATION.md` (what is safe to lift, grid cells, amendments, conventions,
next lemma), and the brief `explorations/2026-10-27-astra-r4/briefs/H3-vr1-noncollapse-instance.md`.

## Deliverable 1: the shard

Write exactly one new file, `report/sections/104_vr1_noncollapse_first_instance.tex`, a self-contained LaTeX
shard, **target 220 lines, hard cap 280 lines**, opening with the four-line
comment header

    % SHARD-ID: CA-104-VR1-NONCOLLAPSE-AND-FIRST-INSTANCE
    % SHARD-TITLE: <title>
    % SHARD-SUMMARY: <line 1>
    % SHARD-SUMMARY: <line 2>   (the guard REQUIRES 2 or 3 SHARD-SUMMARY lines, each one sentence or two, as in CA-88/CA-94)
    % SHARD-KEYWORDS: <comma list>   (write the literal word KEYWORDS here)

followed by `\section{...}\label{sec:...}`, a "Status, Sources, and
Dependencies" subsection (status sentence with every grade; `% Source:
path:line` comment anchors for every local source used; dependencies by
CA number), then the content: statements numbered 104.1, 104.2, ...
each as `\textbf{Theorem/Proposition/Lemma/Negative/Target 104.k [grade;
S; L; R] (NOTE:lines; REVIEW:lines).}` with grade in {derived, conditional,
conjectural, negative, proposal} carried VERBATIM from REVIEW/INTEGRATION
(never promote; a reviewer GAP makes the step conditional), condensed Lamport
steps `\par\(\langle1\rangle k\).` as in CA-89/CA-94 for the load-bearing
proofs, the counterexamples with their exact data, then subsections "Effect
on other shards" (dated pointer text, do not edit those shards), "What This
Does Not Claim", "Examples (Instances Only)" (a small table; instances never
the subject), and the single next target with its tags. State at the top
which CA-88 cell moves and which does not, as INTEGRATION (b) says.

Compile check: do NOT edit `report.tex`. Build a wrapper in `$TMPDIR` that
copies the preamble of `report.tex` (everything before `\begin{document}`),
adds `\begin{document}\input{/home/tobias/Projects/cft-anyons/report/sections/104_vr1_noncollapse_first_instance.tex}\end{document}`,
and run `latexmk -pdf -interaction=nonstopmode` (or `pdflatex`) on it there;
fix every error and every undefined macro. Unresolved `\ref` to other shards
is fine (they are warnings in the wrapper). Keep the line count under 280.

## Deliverable 2: the registration package

Write `explorations/2026-10-27-astra-r4/H3-vr1-noncollapse-instance/SHARD_META.md` containing, ready
to paste: (1) the `report/SHARD_CATALOG.md` entry in the exact format of the
`## \`CA-89-WARD-KS-TRANSFER\`` entry there (ID, file, title, summary
mirrored verbatim from the header, keywords); (2) the `report/README.md`
include-order table row in the format used there for CA-94; (3) the
`\include{report/sections/<104_vr1_noncollapse_first_instance.tex without .tex>}` line for `report.tex`; (4)
proposed `CONVENTIONS.md` entries in the style of (ar)-(aw), lettered
"(ay)" onward ((ax) is taken) with the date 2026-10-27, ONLY for notation the shard actually
introduces (check (a)-(aw) first; do not duplicate); (5) dated amendment
pointers for other shards, each as: file, anchor text to append after, and
the exact sentence "\emph{Amendment (2026-10-27, round 4):} ...", for the
items INTEGRATION (c) lists; (6) a one-line `INDEX.md` fragment for the
checks bundle; (7) the worklog paragraph: verdict line, headline results
with tags, corrections to the brief that the reviewer found.

## Time budget (binding)

About 35 minutes. Write the header, status subsection and statement list
first (10 minutes), then proofs, then SHARD_META.md; stop at 30 minutes and
make sure the file compiles and is under 280 lines.

## Rules of engagement

Write ONLY `report/sections/104_vr1_noncollapse_first_instance.tex` and
`explorations/2026-10-27-astra-r4/H3-vr1-noncollapse-instance/SHARD_META.md` (plus the wrapper in
`$TMPDIR`). No edits to report.tex, catalog, README, CONVENTIONS, other
shards, NOTE/REVIEW/INTEGRATION; no commits; no network. Every claim carries
its grade and its tags; every source is cited path:line; nothing from memory.


## Package-specific notes

REVIEW grades: WEAKER-RESULT-PROVED as posed (only the sub-clause 'adjoint pairing + positivity of L_0 gives c > 0' fails: Negative A.5 for the linear ledger; c* > 0 only under (PE)); corrected statements PROOF-COMPLETE. Headline (pillar P4): the non-collapse clause A5 (equivalent to nonzero limiting stress; finite certificate |q_a| > d_{a,n}; the collapsing chains of CA-95.5 and CA-100.5 violate it); and the FIRST GENUINE VR-1 INSTANCE in the repository: the source-modified free-fermion modes with control K = (1+E)^p satisfy A1-A4 on the whole Fock carrier for every real p > 1 (p = 1 fails A3 at eps r -> pi/2, not at the window edge), sharp rate eps^min(p-1,2), kappa = 1/(2 sqrt2 pi), on the same GNS system as the WS-1 Wilson rows with zero mixed brackets. The reviewer insists the general theorems are thin (Theorem A near a reformulation, B.1 a Schur test, C GNS uniqueness) and that the hard content is the instance: say so in the status subsection and do not oversell. The R0 rung of the instance is the source's sharp-momentum map (unital, spatially nonlocal), NOT CA-88's local R0^u: tag it so. Effect on other shards: CA-81, CA-79 (first attackable lemma answered), CA-88 (D2-C: K = 1+E fails A3; the R2 certificate column and WT-1/VR-1 row comment; a free-fermion calibration row must be created), CA-95 (95.8's K = 1+Q is not a VR-1 control), CA-75, worklog 023 §1/§4.3 ('VR-1 has no instance anywhere' superseded). Single next target: VR-1 with summable graph-norm distortion in place of exact K-intertwining (virasoro_routes.md:167-171), the gate for local refinements and for the categorical CA-90/96 towers; runner-up c* > 0 from L_0 positivity alone. The fermion is the check, never the subject: keep its data in the examples table and one calibration paragraph. Write SHARD_META.md into the H3 package directory; letter CONVENTIONS from (ay) with the merge caveat.