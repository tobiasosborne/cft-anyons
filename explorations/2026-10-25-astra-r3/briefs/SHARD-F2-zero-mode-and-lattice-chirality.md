# Astra round 3 SHARD brief — F2-zero-mode-and-lattice-chirality -> CA-100-ZERO-MODE-LATTICE-CHIRALITY

You are the integrator for one reviewed proof note in the repository at the
current directory (`/home/tobias/Projects/cft-anyons`). Read `AGENTS.md`
first, whole (Rules 5, 9, 11, 16, 17 and the Shards section bind). Then read,
in this order: `report/sections/89_ward_ks_transfer.tex` and
`report/sections/94_number_changing_collision_dynamics.tex` (STYLE MODELS: a
round-2 shard lifted from a reviewed note, with grades carried per statement,
Lamport steps condensed, tags (S; L; R) on every statement),
`report/sections/88_layered_targets.tex` (the grid and the tag vocabulary),
`CONVENTIONS.md` entries (aq)-(aw), the preamble of `report.tex` (the macros
you may use: use ONLY macros defined there), and the package
`explorations/2026-10-25-astra-r3/F2-zero-mode-and-lattice-chirality/`: `NOTE.md` (the proof), `REVIEW.md`
(the sceptical review; its GRADE and per-step verdicts are binding),
`INTEGRATION.md` (what is safe to lift, grid cells, amendments, conventions,
next lemma), and the brief `explorations/2026-10-25-astra-r3/briefs/F2-zero-mode-and-lattice-chirality.md`.

## Deliverable 1: the shard

Write exactly one new file, `report/sections/100_zero_mode_lattice_chirality.tex`, a self-contained LaTeX
shard, **target 220 lines, hard cap 280 lines**, opening with the four-line
comment header

    % SHARD-ID: CA-100-ZERO-MODE-LATTICE-CHIRALITY
    % SHARD-TITLE: <title>
    % SHARD-SUMMARY: <line 1>
    % SHARD-SUMMARY: <line 2>   (the guard REQUIRES 2 or 3 SHARD-SUMMARY lines, each one sentence or two, as in CA-88/CA-94)
    % SHARD-KEYWORDS: <comma list>   (write the literal word KEYWORDS here)

followed by `\section{...}\label{sec:...}`, a "Status, Sources, and
Dependencies" subsection (status sentence with every grade; `% Source:
path:line` comment anchors for every local source used; dependencies by
CA number), then the content: statements numbered 100.1, 100.2, ...
each as `\textbf{Theorem/Proposition/Lemma/Negative/Target 100.k [grade;
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
adds `\begin{document}\input{/home/tobias/Projects/cft-anyons/report/sections/100_zero_mode_lattice_chirality.tex}\end{document}`,
and run `latexmk -pdf -interaction=nonstopmode` (or `pdflatex`) on it there;
fix every error and every undefined macro. Unresolved `\ref` to other shards
is fine (they are warnings in the wrapper). Keep the line count under 280.

## Deliverable 2: the registration package

Write `explorations/2026-10-25-astra-r3/F2-zero-mode-and-lattice-chirality/SHARD_META.md` containing, ready
to paste: (1) the `report/SHARD_CATALOG.md` entry in the exact format of the
`## \`CA-89-WARD-KS-TRANSFER\`` entry there (ID, file, title, summary
mirrored verbatim from the header, keywords); (2) the `report/README.md`
include-order table row in the format used there for CA-94; (3) the
`\include{report/sections/<100_zero_mode_lattice_chirality.tex without .tex>}` line for `report.tex`; (4)
proposed `CONVENTIONS.md` entries in the style of (ar)-(aw), lettered
"(ax)" onward with the date 2026-10-25, ONLY for notation the shard actually
introduces (check (a)-(aw) first; do not duplicate); (5) dated amendment
pointers for other shards, each as: file, anchor text to append after, and
the exact sentence "\emph{Amendment (2026-10-25, round 3):} ...", for the
items INTEGRATION (c) lists; (6) a one-line `INDEX.md` fragment for the
checks bundle; (7) the worklog paragraph: verdict line, headline results
with tags, corrections to the brief that the reviewer found.

## Time budget (binding)

About 35 minutes. Write the header, status subsection and statement list
first (10 minutes), then proofs, then SHARD_META.md; stop at 30 minutes and
make sure the file compiles and is under 280 lines.

## Rules of engagement

Write ONLY `report/sections/100_zero_mode_lattice_chirality.tex` and
`explorations/2026-10-25-astra-r3/F2-zero-mode-and-lattice-chirality/SHARD_META.md` (plus the wrapper in
`$TMPDIR`). No edits to report.tex, catalog, README, CONVENTIONS, other
shards, NOTE/REVIEW/INTEGRATION; no commits; no network. Every claim carries
its grade and its tags; every source is cited path:line; nothing from memory.
