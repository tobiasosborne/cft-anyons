# Astra round 4 SHARD brief — explorations/2026-10-25-astra-r3/G1-transport-extraction -> @@CA-101-ANCILLA-TRANSPORT-LIFTS@@

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
`explorations/2026-10-25-astra-r3/G1-transport-extraction/`: `NOTE.md` (the proof), `REVIEW.md`
(the sceptical review; its GRADE and per-step verdicts are binding),
`INTEGRATION.md` (what is safe to lift, grid cells, amendments, conventions,
next lemma), and the brief `explorations/2026-10-25-astra-r3/briefs/G1-transport-extraction.md`.

## Deliverable 1: the shard

Write exactly one new file, `report/sections/101_ancilla_transport_lifts.tex`, a self-contained LaTeX
shard, **target 220 lines, hard cap 280 lines**, opening with the four-line
comment header

    % SHARD-ID: CA-101-ANCILLA-TRANSPORT-LIFTS
    % SHARD-TITLE: <title>
    % SHARD-SUMMARY: <line 1>
    % SHARD-SUMMARY: <line 2>   (the guard REQUIRES 2 or 3 SHARD-SUMMARY lines, each one sentence or two, as in CA-88/CA-94)
    % SHARD-KEYWORDS: <comma list>   (write the literal word KEYWORDS here)

followed by `\section{...}\label{sec:...}`, a "Status, Sources, and
Dependencies" subsection (status sentence with every grade; `% Source:
path:line` comment anchors for every local source used; dependencies by
CA number), then the content: statements numbered 101.1, 101.2, ...
each as `\textbf{Theorem/Proposition/Lemma/Negative/Target 101.k [grade;
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
adds `\begin{document}\input{/home/tobias/Projects/cft-anyons/report/sections/101_ancilla_transport_lifts.tex}\end{document}`,
and run `latexmk -pdf -interaction=nonstopmode` (or `pdflatex`) on it there;
fix every error and every undefined macro. Unresolved `\ref` to other shards
is fine (they are warnings in the wrapper). Keep the line count under 280.

## Deliverable 2: the registration package

Write `explorations/2026-10-25-astra-r3/G1-transport-extraction/SHARD_META.md` containing, ready
to paste: (1) the `report/SHARD_CATALOG.md` entry in the exact format of the
`## \`CA-89-WARD-KS-TRANSFER\`` entry there (ID, file, title, summary
mirrored verbatim from the header, keywords); (2) the `report/README.md`
include-order table row in the format used there for CA-94; (3) the
`\include{report/sections/<101_ancilla_transport_lifts.tex without .tex>}` line for `report.tex`; (4)
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

Write ONLY `report/sections/101_ancilla_transport_lifts.tex` and
`explorations/2026-10-25-astra-r3/G1-transport-extraction/SHARD_META.md` (plus the wrapper in
`$TMPDIR`). No edits to report.tex, catalog, README, CONVENTIONS, other
shards, NOTE/REVIEW/INTEGRATION; no commits; no network. Every claim carries
its grade and its tags; every source is cited path:line; nothing from memory.


## Package-specific notes

The REVIEW grade is COUNTEREXAMPLE to Conjecture G1 as posed and to CA-96
Target 96.10 exactly as stated; carry it. Lift as derived: G1.1 (ancilla
transport datum (K, kappa, t, u) gives local unital lifts; inclusion matrix
fusion-by-K^L), G1.2 (the gauge classification is false; the inclusion-matrix
gauge invariant), G1.4 (exact algebraic extraction, with the reviewer's GAP at
<1>4 marked conditional), G1.5 (fixed-b feasibility equations, min-b
invariance; NO decidability claim); as negative: G1.3 (for every finite
dihedral group the site O = 1+a+b+ab in untwisted Vec_G has local unital lifts
of V_L with slack 1 for every L, but no tensor power O^n admits any relative
half-braiding on <O>, since [O]^n is never central), the reviewer's R1 and R2
(open S_3 carrier: no b admits a blocked or ancilla datum). State G1.3 as a
general-C negative (the mechanism: a lift family need not come from any
transport datum; the inclusion matrix of a lift is a gauge invariant that
distinguishes it from every transport-induced lift) with the dihedral family
in the examples table only. Record that the dihedral lifts do NOT preserve the
(am) occupation degree, so the occupation-graded variant of 96.10 is open.
Pillar: P1 (refinement of the indefinite-particle tower), feeding P4. The
single next target is the reviewer's blocked-ancilla extraction lemma
(INTEGRATION (e)). Write SHARD_META.md into the G1 package directory.
