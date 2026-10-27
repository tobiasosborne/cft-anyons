# Astra round 4 SHARD brief — explorations/2026-10-25-astra-r3/G6-record-faithfulness -> @@CA-102-RECORD-FORGETS-THE-POINT@@

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
`explorations/2026-10-25-astra-r3/G6-record-faithfulness/`: `NOTE.md` (the proof), `REVIEW.md`
(the sceptical review; its GRADE and per-step verdicts are binding),
`INTEGRATION.md` (what is safe to lift, grid cells, amendments, conventions,
next lemma), and the brief `explorations/2026-10-25-astra-r3/briefs/G6-record-faithfulness.md`.

## Deliverable 1: the shard

Write exactly one new file, `report/sections/102_record_forgets_the_point.tex`, a self-contained LaTeX
shard, **target 220 lines, hard cap 280 lines**, opening with the four-line
comment header

    % SHARD-ID: CA-102-RECORD-FORGETS-THE-POINT
    % SHARD-TITLE: <title>
    % SHARD-SUMMARY: <line 1>
    % SHARD-SUMMARY: <line 2>   (the guard REQUIRES 2 or 3 SHARD-SUMMARY lines, each one sentence or two, as in CA-88/CA-94)
    % SHARD-KEYWORDS: <comma list>   (write the literal word KEYWORDS here)

followed by `\section{...}\label{sec:...}`, a "Status, Sources, and
Dependencies" subsection (status sentence with every grade; `% Source:
path:line` comment anchors for every local source used; dependencies by
CA number), then the content: statements numbered 102.1, 102.2, ...
each as `\textbf{Theorem/Proposition/Lemma/Negative/Target 102.k [grade;
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
adds `\begin{document}\input{/home/tobias/Projects/cft-anyons/report/sections/102_record_forgets_the_point.tex}\end{document}`,
and run `latexmk -pdf -interaction=nonstopmode` (or `pdflatex`) on it there;
fix every error and every undefined macro. Unresolved `\ref` to other shards
is fine (they are warnings in the wrapper). Keep the line count under 280.

## Deliverable 2: the registration package

Write `explorations/2026-10-25-astra-r3/G6-record-faithfulness/SHARD_META.md` containing, ready
to paste: (1) the `report/SHARD_CATALOG.md` entry in the exact format of the
`## \`CA-89-WARD-KS-TRANSFER\`` entry there (ID, file, title, summary
mirrored verbatim from the header, keywords); (2) the `report/README.md`
include-order table row in the format used there for CA-94; (3) the
`\include{report/sections/<102_record_forgets_the_point.tex without .tex>}` line for `report.tex`; (4)
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

Write ONLY `report/sections/102_record_forgets_the_point.tex` and
`explorations/2026-10-25-astra-r3/G6-record-faithfulness/SHARD_META.md` (plus the wrapper in
`$TMPDIR`). No edits to report.tex, catalog, README, CONVENTIONS, other
shards, NOTE/REVIEW/INTEGRATION; no commits; no network. Every claim carries
its grade and its tags; every source is cited path:line; nothing from memory.


## Package-specific notes

The REVIEW grade is COUNTEREXAMPLE to the positive form of CA-97 Target 97.16
exactly as worded (97:265-272); carry it. Lift as derived: G6-A (cut relative
commutant formula; tag L0+H, not L0: the reviewer's correction), G6-C1 (some
marks are not natural), the reviewer's R-1 (any bicharacter H transparent to
the translating invertible s works) and R-3 (the pointed record R^p = (R,{p_j})
distinguishes the tested instances by the block holding p_1..p_L); as
negative: G6-B/B1/B2 (an invertible-object translation of the charge origin
gives a record isomorphism Phi = Ad U^{(x)L} preserving every interval algebra
and intertwining delta while the pointed inputs are inequivalent; B1 by
dim Hom(1,O) = 2 vs 1, B2 by element orders, needing G with elements of
different order, e.g. Z_4, Z_6). State the general mechanism honestly: it is
proved for abelian Hilb_fd(G) with trivial associator and translation-compatible
H, i.e. for every C containing a suitable invertible object acting on the site;
"general mechanism" beyond that is NOT proved (reviewer §3), and R-2 (Deligne
product extension) has a Law-1 source gap: mark conditional. The headline for
general C: **the record R forgets the point** (the vacancy projections p_j and
everything built from them: corners, h, i, j), not F or H, which are untouched
by G6-B (both sides use the same category). Pillar: P1 (the vacancy in O = 1+X
must be carried as declared structure along the tower) and the R4 fidelity
insufficiency note of CA-88. Single next target: the reviewer's 97.16' (does
the pointed record R^p force an equivalence transporting eta and H?). Record
the amendment to worklog 023 §4.4 in "Effect on other shards" (the integrator
will apply it). Write SHARD_META.md into the G6 package directory.
