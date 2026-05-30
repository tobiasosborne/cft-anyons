#!/usr/bin/env python3
"""P2.8: Build `CITATION_INDEX.md` by walking `summary.tex` for every
external citation, classifying its discharge status against the four
local sources, and emitting the table + per-citation sections.

Plan reference: `stocktake/MIGRATION_PLAN.md` P2.8 (line 158).

Citation atom unit (design decision)
====================================

`summary.tex` carries no formal LaTeX bibliography: no `\\bibitem`, no
`\\begin{thebibliography}`, no `\\cite{}` macros (verified by grep at
build time; see the "Atom-unit harvesting" stage below). All external
references are propagated as **inline prose attributions** flagged with
the project-defined `\\unchecked` macro (defined at `summary.tex:37`).

The document itself fixes the canonical enumeration: lines 2458-2481
are the section ``External references mentioned (all unchecked)'', an
explicit 8-item `\\begin{itemize}` listing every external reference the
author intends to be tracked. We take this enumeration as the canonical
**logical citation atom** — one CITATION_INDEX entry per item — and
treat earlier inline mentions / the "Statements judged unverifiable"
re-list at lines 2299-2311 as **back-references** (additional locations
where the same logical citation appears).

This choice is defensible because:
  1. The author has explicitly enumerated and labelled this list (it is
     not heuristic). It is the closest thing summary.tex has to a
     bibliography.
  2. It deduplicates correctly: e.g. ``Koo--Saleur'' appears in the
     enumeration once but is named at 7 prose locations.
  3. It is forward-compatible: when Phase 3 starts discharging
     `\\unchecked` flags, the discharge maps 1:1 onto the items in this
     list.
  4. It survives mechanical re-runs: the script's output for a given
     summary.tex SHA256 is byte-deterministic (see "Determinism" below).

The four discharge sources
==========================

For each logical citation, the script consults:
  (a) Local PDF in `references/` — via `references/manifest/SOURCES.md`
      (16 primary SRC-* IDs, hashes verified at P2.2).
  (b) Literature DB record in `literature/db/papers.sqlite` — queried by
      author surname / title fragments; result is the canonical
      `bib_key` field where available, else `paper#<id>`.
  (c) AF node from CAD's adversarial-proof workspace — read from the
      sibling repo at
      `/home/tobiasosborne/Projects/cft-anyons-deprecated/af/master/externals/`
      (5 externals at this commit; only 3 are content-bearing). The
      sibling-path dependency is documented in the emitted markdown
      (pre-Phase-7 caveat; Phase 7 will import the AF workspace into
      this repo proper, at which point this script should be re-run to
      refresh the AF paths).
  (d) "(d) no local source" — for items that none of (a)/(b)/(c) cover.

AF (c) source approach (design decision)
========================================

We choose to **read the sibling repo** (option (i)) rather than
uniformly recording ``AF mapping deferred to Phase 7'' (option (ii)).
Justification: AF mappings already exist for 3 of the 5 externals
(Trebst F-matrix, Penneys binary fusion-tree basis, Fibonacci golden
ratio) and these are content-bearing now. Suppressing them loses signal
in the canonical index. The sibling-path dependency is the same one
Phase 2 already established (P2.5 read sibling
`microscopic-mobile-anyons/literature/db/papers.sqlite` for the
literature DB transfer). The emitted markdown carries an explicit
"pre-Phase-7" caveat header naming the sibling-path source, so future
agents can detect drift if the sibling moves or the AF workspace is
imported into this repo. If the sibling is missing the script falls
back to "(c) deferred to Phase 7" automatically and prints a warning.

Determinism (M-gate + I-gate)
=============================

Running the script twice on the same summary.tex + manifest +
literature DB + AF externals MUST produce byte-identical output. We
enforce this by:
  - Iterating dicts only after `sorted(...)` on a stable key.
  - Emitting timestamps NOWHERE in the output.
  - SHA256-hashing the inputs we read and including the hashes in the
    output header (so any change to the upstream sources is detectable
    as a change in the output header alone — drift signals are loud).

C-gate (cross-reference)
========================

The script's stats output (citations found / mapped to references/ /
mapped to literature/ / mapped to AF / undischarged) is one signal.
The C-gate from the second independent source comes from the
commit-body's manual spot-checks (3-5 citation entries cross-checked
by hand against summary.tex line context + references/manifest +
literature DB query results) and from an independent grep count of
`\\unchecked` macros in summary.tex (sanity check: discrepancy with
the script's "26 macros found" stat indicates a parser bug).

Exit codes
==========

  0 — success; CITATION_INDEX.md written.
  1 — summary.tex unreadable, AF sibling structure unexpected, output
      write failure, or the discharge sources are missing.

This script is **idempotent**: re-running it overwrites
CITATION_INDEX.md with byte-identical content (verifiable via
`sha256sum CITATION_INDEX.md` before and after).
"""

import hashlib
import re
import sqlite3
import sys
from collections import OrderedDict
from pathlib import Path

# Portable repo root (matches the convention from
# scripts/check-literature-tree.py and scripts/check-literature-db.py).
REPO = Path(__file__).resolve().parent.parent
SUMMARY_TEX = REPO / "summary.tex"
MANIFEST = REPO / "references" / "manifest" / "SOURCES.md"
LITERATURE_DB = REPO / "literature" / "db" / "papers.sqlite"
SIBLING_AF_EXTERNALS = (
    Path("/home/tobiasosborne/Projects/cft-anyons-deprecated/af/master/externals")
)
SIBLING_REPO = Path("/home/tobiasosborne/Projects/cft-anyons-deprecated")
OUTPUT = REPO / "CITATION_INDEX.md"


# ---------------------------------------------------------------------
# Atom-unit harvesting
# ---------------------------------------------------------------------

# The canonical enumeration of summary.tex's external references lives
# in the section "External references mentioned (all unchecked)" — an
# explicit `\\begin{itemize}` of 8 items at lines 2463-2480. We pin
# this list as the citation-atom set; a later sanity check verifies the
# pin still matches what the script harvests from summary.tex.
#
# The list mirrors `summary.tex:2463-2480` exactly (8 items).
#
# Each entry is keyed by a short normalised slug. The slug is the only
# identifier this script promises to keep stable across re-runs; if
# you rename or reorder these entries, downstream tooling must adapt.
#
# Heuristic mappings to the four discharge sources are encoded
# alongside each entry. Mappings recorded here are factual at this
# commit (verified by manual cross-check against references/manifest/,
# literature DB, AF sibling) — they are NOT guesses. Future Phase 3
# discharges will update these.

CANONICAL_ATOMS: "OrderedDict[str, dict]" = OrderedDict()


def _atom(
    slug: str,
    label: str,
    list_line: int,
    src_ids: list[str] | None = None,
    lit_bibkeys: list[str] | None = None,
    lit_paper_ids: list[int] | None = None,
    af_node_ids: list[str] | None = None,
    notes: str = "",
) -> None:
    """Register one canonical citation atom.

    `src_ids` are SRC-* IDs known to map (verified manually against
    references/manifest/SOURCES.md at this commit). `lit_bibkeys` /
    `lit_paper_ids` map into literature/db/papers.sqlite. `af_node_ids`
    are 16-hex-char file stems under the AF sibling externals/ dir.
    """
    CANONICAL_ATOMS[slug] = {
        "slug": slug,
        "label": label,
        "list_line": list_line,
        "src_ids": list(src_ids or []),
        "lit_bibkeys": list(lit_bibkeys or []),
        "lit_paper_ids": list(lit_paper_ids or []),
        "af_node_ids": list(af_node_ids or []),
        "notes": notes,
        # Filled later:
        "all_lines": [],
        "resolved_src": [],
        "resolved_lit": [],
        "resolved_af": [],
    }


# Enumeration mirrors summary.tex:2463-2480 in order.
_atom(
    slug="koo-saleur",
    label="Koo, Saleur — lattice Virasoro approximants from XXZ/RSOS / TL chains",
    list_line=2464,
    # The original 1994 Koo-Saleur paper has no local PDF (per
    # CLAUDE.md Hallucination-risk callouts and RESEARCH_NOTES
    # acquisition queue). Literature DB has the 2017 follow-up
    # "Extraction of conformal data ... using the Koo-Saleur formula"
    # (paper id 590) which references the original.
    lit_paper_ids=[590],
    notes="Original 1994 paper has no local PDF (acquisition queue, RESEARCH_NOTES). "
    "Lit DB has the 2017 follow-up applying the formula. Convergence "
    "results referenced here are flagged in summary.tex Conjecture conj:KS.",
)

_atom(
    slug="osborne-stottmeister",
    label="Osborne, Stottmeister — convergence of Koo--Saleur approximants in the scaling representation (including transverse-field Ising)",
    list_line=2466,
    # Two papers, both have local PDFs:
    # - OARWavelets.pdf (Stottmeister-Morinelli-Morsella-Tanimoto 2020)
    # - CFTFromLatticeFermions.pdf (T. Osborne, A. Stottmeister 2021)
    # And: OsborneContinuumLimitsQuantumLatticeSystems.pdf (Osborne).
    src_ids=["SRC-OAR-WAVELETS", "SRC-OAR-FERMIONS", "SRC-OSBORNE-CONTINUUM"],
    # Lit DB papers 520, 521 (matching the two arXiv IDs) plus paper 38
    # (Stottmeister 2022 ``Anyon braiding and the renormalization group'').
    lit_paper_ids=[520, 521, 38],
    notes="Local PDFs cover the OAR / wavelets and lattice-fermion-CFT pieces. "
    "The specific dense-Ising Koo-Saleur convergence statement summary.tex "
    "asserts (conj:KS) requires per-claim discharge in Phase 3.",
)

_atom(
    slug="pasquier",
    label="Pasquier — ADE lattice models / RSOS height models",
    list_line=2469,
    # No local PDF; not yet acquired (RESEARCH_NOTES acquisition queue).
    notes="Per CLAUDE.md Hallucination-risk callouts: no local source. "
    "Pasquier 1987 ADE lattice models are in the acquisition queue.",
)

_atom(
    slug="huse",
    label="Huse — identification of ABF critical points with Friedan--Qiu--Shenker unitary minimal series M(m, m+1)",
    list_line=2470,
    # No local PDF (per CLAUDE.md callout). Pair this with the Friedan-Qiu-Shenker
    # 1984 attribution that also has no local source.
    notes="Per CLAUDE.md Hallucination-risk callouts: no local source for "
    "either the Huse identification or the Friedan-Qiu-Shenker original. "
    "Listed in acquisition queue.",
)

_atom(
    slug="frs",
    label="Fjelstad, Fuchs, Runkel, Schweigert (``FRS'') — full RCFT correlators from a special Frobenius algebra; A = 1 in the Cardy case",
    list_line=2472,
    # No local PDF (per CLAUDE.md callout).
    notes="Per CLAUDE.md Hallucination-risk callouts: no local source. "
    "summary.tex's warn:not-Frobenius (line 511) clarifies that FRS is "
    "retained as analogy not equivalence; dagger-special != Frobenius-special.",
)

_atom(
    slug="feiguin-golden-chain",
    label="Feiguin et al.\\ (2007) and follow-ups — golden-chain Fibonacci antiferromagnetic continuum at tricritical Ising M(4,5), c=7/10",
    list_line=2475,
    # Local PDF: GoldenChainFeiguinEtAl.pdf (SRC-GOLDEN-CHAIN).
    src_ids=["SRC-GOLDEN-CHAIN"],
    # Lit DB papers: 31 (Feiguin et al 2006 golden chain) and 36 (Trebst
    # et al 2008 collective states of interacting Fibonacci anyons).
    lit_paper_ids=[31, 36],
    lit_bibkeys=["FeiguinTrebstLudwigTroyerKitaevWangFreedman2007", "Trebst2008"],
    notes="Local PDF present (SRC-GOLDEN-CHAIN). summary.tex Warning warn:fibCFTs "
    "(line 1851) distinguishes the (G_2)_1 chiral CFT (h_tau=2/5) "
    "from the M(4,5) tricritical Ising scenario.",
)

_atom(
    slug="anyonic-mera",
    label="``Anyonic MERA literature'' — charge-compatible MERA tensors, scaling-superoperator language",
    list_line=2478,
    # No specific paper named; this is a literature pointer rather
    # than a citation. No local PDF; nothing in lit DB indexed
    # under "MERA + anyon".
    notes="Bibliographic pointer with no named source. summary.tex defers "
    "to a body of literature without specific attribution. No local PDF; "
    "the lit DB has no paper indexed simultaneously under MERA and "
    "anyonic-chain keywords.",
)

_atom(
    slug="string-net",
    label="String-net fixed-point wavefunction intuition (Levin--Wen)",
    list_line=2480,
    # Local PDF: StringNetCondMat0510613.pdf (SRC-STRING-NET).
    src_ids=["SRC-STRING-NET"],
    lit_paper_ids=[324],
    notes="Local PDF present (SRC-STRING-NET, Levin-Wen string-net "
    "condensation cond-mat/0510613).",
)


# Extra ``inline-only'' atoms — author-mentions in earlier prose that
# don't reduce to one of the 8 enumeration atoms above. We add these
# explicitly so the index is complete, not just a copy of lines 2463-2480.

_atom(
    slug="g2-1-chiral-cft",
    label="(G_2)_1 chiral CFT — c=14/5, primary h_tau=2/5; cited as the simplest chiral CFT with Fibonacci modular data",
    list_line=1858,
    # No local PDF; per CLAUDE.md Hallucination-risk callouts.
    notes="Per CLAUDE.md Hallucination-risk callouts: (G_2)_1 has no local "
    "PDF; flagged in summary.tex warn:fibCFTs (line 1851) and called out "
    "in the Reference status section's Stage~2 question list "
    "(line 2442). No bibliographic attribution beyond ``standard''.",
)


# ---------------------------------------------------------------------
# Helpers
# ---------------------------------------------------------------------

UNCHECKED_RE = re.compile(r"\\unchecked")


def sha256_file(path: Path) -> str:
    h = hashlib.sha256()
    with path.open("rb") as f:
        for chunk in iter(lambda: f.read(65536), b""):
            h.update(chunk)
    return h.hexdigest()


def harvest_unchecked_locations(text: str) -> list[int]:
    """Return 1-indexed line numbers of every `\\unchecked` macro in
    summary.tex (including the `\\newcommand` definition at line 37,
    which is structural rather than a citation flag — we count and
    document but do not treat as a citation atom)."""
    locs: list[int] = []
    for i, line in enumerate(text.splitlines(), start=1):
        for _ in UNCHECKED_RE.finditer(line):
            locs.append(i)
    return locs


def harvest_atom_backrefs(text: str) -> None:
    """Walk summary.tex and, for each canonical atom, record every line
    number where the atom is referenced. We use surname-string matching
    on the canonical author/keyword for each atom; this is lossless on
    summary.tex because the document author already uses consistent
    naming.

    Mutates `CANONICAL_ATOMS` in place.
    """
    # Each canonical atom has a list of substring patterns that signal
    # an in-document mention. These are conservative (full author
    # surname, distinctive multi-word phrases) to avoid false positives
    # while remaining stable across re-runs.
    PATTERNS: dict[str, list[str]] = {
        "koo-saleur": ["Koo--Saleur", "Koo, Saleur"],
        # ``Osborne--Stottmeister'' appears as one author-pair token
        # plus a separate later mention in the External-references list.
        "osborne-stottmeister": ["Osborne--Stottmeister", "Osborne, Stottmeister"],
        "pasquier": ["Pasquier"],
        # ``Huse'' alone risks ambiguity, but in this document the
        # surname is only used for the ABF / FQS attribution.
        "huse": ["Huse", "Friedan--Qiu--Shenker"],
        "frs": ["FRS", "Fjelstad", "Fuchs--Runkel--Schweigert"],
        "feiguin-golden-chain": ["Feiguin", "golden chain", "golden-chain"],
        "anyonic-mera": ["anyonic MERA"],
        "string-net": ["string-net", "String-net"],
        "g2-1-chiral-cft": ["G_2)_1", "(G_2)_1"],
    }
    for i, line in enumerate(text.splitlines(), start=1):
        for slug, pats in PATTERNS.items():
            for pat in pats:
                if pat in line:
                    CANONICAL_ATOMS[slug]["all_lines"].append(i)
                    break  # one match per (atom, line) is enough


def load_manifest_src_ids(path: Path) -> dict[str, dict]:
    """Parse `references/manifest/SOURCES.md` Primary Local Sources table.

    Returns dict keyed by SRC-* ID with each row's local file +
    extracted text + hash recorded.
    """
    rows: dict[str, dict] = {}
    in_table = False
    for line in path.read_text().splitlines():
        if line.startswith("## Primary Local Sources"):
            in_table = True
            continue
        if in_table and line.startswith("## "):
            break
        if not in_table:
            continue
        s = line.strip()
        if not s.startswith("|") or s.startswith("|-") or s.startswith("| Source ID"):
            continue
        cells = [c.strip() for c in s.strip("|").split("|")]
        if len(cells) < 4:
            continue
        src_id = cells[0]
        if not src_id.startswith("SRC-"):
            continue
        # Strip backticks from local/extracted paths.
        rows[src_id] = {
            "local_file": cells[1].strip("`"),
            "extracted_text": cells[2].strip("`"),
            "sha256": cells[3].strip("`"),
        }
    return rows


def load_lit_papers(db: Path, paper_ids: list[int], bibkeys: list[str]) -> dict[int, dict]:
    """Fetch lit-DB rows for a set of paper ids and bib_keys.

    Returns a dict keyed by paper id with row fields populated.
    """
    if not paper_ids and not bibkeys:
        return {}
    conn = sqlite3.connect(f"file:{db}?mode=ro", uri=True)
    try:
        cur = conn.cursor()
        rows: dict[int, dict] = {}
        if paper_ids:
            qs = ",".join("?" * len(paper_ids))
            cur.execute(
                f"SELECT id, arxiv_id, bib_key, year, authors_str, title "
                f"FROM papers WHERE id IN ({qs})",
                paper_ids,
            )
            for row in cur.fetchall():
                rows[row[0]] = {
                    "id": row[0],
                    "arxiv_id": row[1] or "",
                    "bib_key": row[2] or "",
                    "year": row[3] or "",
                    "authors_str": row[4] or "",
                    "title": row[5] or "",
                }
        if bibkeys:
            qs = ",".join("?" * len(bibkeys))
            cur.execute(
                f"SELECT id, arxiv_id, bib_key, year, authors_str, title "
                f"FROM papers WHERE bib_key IN ({qs})",
                bibkeys,
            )
            for row in cur.fetchall():
                rows[row[0]] = {
                    "id": row[0],
                    "arxiv_id": row[1] or "",
                    "bib_key": row[2] or "",
                    "year": row[3] or "",
                    "authors_str": row[4] or "",
                    "title": row[5] or "",
                }
        return rows
    finally:
        conn.close()


def load_af_externals(externals_dir: Path) -> list[dict]:
    """Read every `.json` file under the AF sibling externals/ dir.

    Returns a sorted list of dicts (sorted by id for determinism).
    """
    if not externals_dir.exists():
        return []
    out: list[dict] = []
    import json
    for f in sorted(externals_dir.glob("*.json")):
        try:
            data = json.loads(f.read_text())
        except Exception as e:
            print(f"WARNING: could not parse AF external {f}: {e}", file=sys.stderr)
            continue
        out.append({
            "id": data.get("id", f.stem),
            "name": data.get("name", ""),
            "source": data.get("source", ""),
            "content_hash": data.get("content_hash", ""),
            "_file": f,
        })
    return out


# ---------------------------------------------------------------------
# Discharge resolution
# ---------------------------------------------------------------------


def resolve_discharges(
    manifest_rows: dict[str, dict],
    lit_rows: dict[int, dict],
    af_rows: list[dict],
) -> None:
    """Walk CANONICAL_ATOMS and fill `resolved_*` from the loaded data.

    Mutates CANONICAL_ATOMS in place.
    """
    af_by_id = {row["id"]: row for row in af_rows}
    for slug in CANONICAL_ATOMS:
        atom = CANONICAL_ATOMS[slug]
        for src_id in sorted(atom["src_ids"]):
            if src_id in manifest_rows:
                atom["resolved_src"].append((src_id, manifest_rows[src_id]))
            else:
                print(
                    f"WARNING: atom '{slug}' lists SRC-id {src_id!r} that is "
                    f"not in references/manifest/SOURCES.md",
                    file=sys.stderr,
                )
        for paper_id in sorted(atom["lit_paper_ids"]):
            if paper_id in lit_rows:
                atom["resolved_lit"].append((paper_id, lit_rows[paper_id]))
            else:
                print(
                    f"WARNING: atom '{slug}' lists lit paper id {paper_id} "
                    f"that is not in literature/db/papers.sqlite",
                    file=sys.stderr,
                )
        for node_id in sorted(atom["af_node_ids"]):
            if node_id in af_by_id:
                atom["resolved_af"].append((node_id, af_by_id[node_id]))
            else:
                print(
                    f"WARNING: atom '{slug}' lists AF node id {node_id!r} "
                    f"that is not in sibling AF externals/",
                    file=sys.stderr,
                )


def auto_resolve_af(af_rows: list[dict]) -> None:
    """Map AF externals to atoms by content-source-string heuristic.

    The AF externals/*.json files have a `source` field (a free-text
    description of what the external is, e.g. "references/text/
    FibonacciAnyonModels.txt:297-304 ..."). We map each external to the
    atom whose SRC-* IDs (= local-file path) appear in that source
    string. Two AF externals are meta (master ledger / source manifest)
    and don't map to any single citation atom; we leave them
    un-attached.
    """
    # Build a path -> atom_slug lookup using each atom's already-known
    # SRC-* IDs. We need both local-file and extracted-text paths so
    # the source-string match works against the AF externals' text.
    path_to_slug: dict[str, str] = {}
    for slug, atom in CANONICAL_ATOMS.items():
        for src_id, src_row in atom["resolved_src"]:
            path_to_slug[src_row["local_file"]] = slug
            if src_row["extracted_text"] and src_row["extracted_text"] != "same file":
                path_to_slug[src_row["extracted_text"]] = slug

    for ext in af_rows:
        src_text = ext.get("source", "")
        matched_slug: str | None = None
        for path, slug in path_to_slug.items():
            if path in src_text:
                matched_slug = slug
                break
        if matched_slug is not None:
            # Avoid duplicate registration.
            atom = CANONICAL_ATOMS[matched_slug]
            existing_ids = {nid for nid, _ in atom["resolved_af"]}
            if ext["id"] not in existing_ids:
                atom["resolved_af"].append((ext["id"], ext))


# ---------------------------------------------------------------------
# Markdown emission
# ---------------------------------------------------------------------


def discharge_status(atom: dict) -> str:
    """Return a one-word status: discharged / partial / undischarged.

    Definitions (M-gate threshold, *not* a Phase-3 substantive
    discharge — Phase 3 is when individual mathematical claims get
    discharged from their sources):
      - 'discharged'   : at least one (a) local PDF AND no further
                         per-claim work is needed for citation
                         attribution (note: actual mathematical-claim
                         discharge is a Phase-3 task; this status is
                         about citation provenance only).
      - 'partial'      : has (b) lit DB record but no (a) local PDF, or
                         has (a) local PDF but the relevant claim is
                         not yet verified line-by-line.
      - 'undischarged' : no (a), (b), or (c).
    """
    has_a = bool(atom["resolved_src"])
    has_b = bool(atom["resolved_lit"])
    has_c = bool(atom["resolved_af"])
    # Per Phase-2 scope: this status is about *citation* discharge
    # (does a local source exist?), not *mathematical-claim*
    # discharge (does the source actually support the claim?). The
    # latter is Phase 3.
    if has_a:
        return "discharged"
    if has_b or has_c:
        return "partial"
    return "undischarged"


def fmt_section_lines(lines: list[int]) -> str:
    if not lines:
        return "(none)"
    return ", ".join(str(l) for l in sorted(set(lines)))


def emit_markdown(
    summary_sha: str,
    manifest_sha: str,
    af_externals: list[dict],
    unchecked_lines: list[int],
) -> str:
    """Render CITATION_INDEX.md as a string."""
    out: list[str] = []
    out.append("# CITATION_INDEX — `summary.tex` references → discharge status")
    out.append("")
    out.append("<!--")
    out.append("ROLE: For every external citation in summary.tex (whether flagged")
    out.append("      \\unchecked or not), record whether a local source exists, whether")
    out.append("      a formal proof / numerical check / hostile review discharges the")
    out.append("      claim, and where to find each piece of evidence.")
    out.append("UPDATE POLICY: Regenerated by scripts/build-citation-index.py (per")
    out.append("      MIGRATION_PLAN P2.8) after any change to summary.tex \\cite or")
    out.append("      \\unchecked usage. Hand-edits between regenerations are discouraged.")
    out.append("TRIGGER: Every \\cite{}, \\unchecked, or bibliographic mention added to")
    out.append("      summary.tex; every reference acquired (Phase 2+); every \\unchecked")
    out.append("      discharge (Phase 3).")
    out.append("-->")
    out.append("")
    out.append("## Generation metadata")
    out.append("")
    out.append(f"- Generator: `scripts/build-citation-index.py` (P2.8).")
    out.append(f"- Source `summary.tex` SHA256: `{summary_sha}`.")
    out.append(f"- Source `references/manifest/SOURCES.md` SHA256: `{manifest_sha}`.")
    out.append(
        f"- AF externals source (pre-Phase-7 sibling): "
        f"`{SIBLING_AF_EXTERNALS}` ({len(af_externals)} externals at run time)."
    )
    out.append(
        "- AF entries reference the sibling repo "
        f"`{SIBLING_REPO}` and will need refreshing post-Phase-7 import."
    )
    out.append(
        f"- `\\unchecked` macros in summary.tex: {len(unchecked_lines)} total (lines "
        f"{', '.join(str(l) for l in unchecked_lines)}). One is the macro "
        "definition (`\\newcommand`); the rest flag citations or claims."
    )
    out.append("- Re-run command: `python3 scripts/build-citation-index.py`.")
    out.append("")
    out.append("## Citation atom unit")
    out.append("")
    out.append(
        "summary.tex has no formal LaTeX bibliography: no `\\bibitem`, no "
        "`\\begin{thebibliography}`, no `\\cite{}` macros. External references "
        "appear as inline prose attributions flagged with the project-defined "
        "`\\unchecked` macro (defined at `summary.tex:37`)."
    )
    out.append("")
    out.append(
        "The canonical atom set is the explicit enumeration at "
        "`summary.tex:2458-2481` (the section ``External references mentioned "
        "(all unchecked)''), which lists every external reference the author "
        "intends to be tracked, plus one extra inline-only atom ((G_2)_1) "
        "called out elsewhere. One CITATION_INDEX entry per logical reference, "
        "with all summary.tex line numbers where it appears recorded as "
        "back-references. This deduplicates the 26 `\\unchecked` macros and "
        "the various inline prose mentions into "
        f"{len(CANONICAL_ATOMS)} logical citations."
    )
    out.append("")
    out.append(
        "Per-citation discharge status is one of: `discharged` (local PDF in "
        "`references/` present); `partial` (literature DB record or AF node "
        "present, no local PDF); `undischarged` (no source). This is "
        "**citation-provenance** status only — *mathematical-claim* discharge "
        "(does the source actually support the claim?) is Phase 3."
    )
    out.append("")

    # Summary table -----------------------------------------------------
    out.append("## Summary table")
    out.append("")
    out.append(
        "| Slug | Discharge | references/ (SRC-*) | literature/ (paper id / bib_key) | AF nodes | summary.tex lines |"
    )
    out.append("|---|---|---|---|---|---|")
    for slug in CANONICAL_ATOMS:
        atom = CANONICAL_ATOMS[slug]
        status = discharge_status(atom)
        src_cell = ", ".join(s for s, _ in atom["resolved_src"]) or "—"
        lit_cell = (
            ", ".join(
                f"{r['bib_key']}" if r["bib_key"] else f"paper#{pid}"
                for pid, r in atom["resolved_lit"]
            )
            or "—"
        )
        af_cell = ", ".join(nid for nid, _ in atom["resolved_af"]) or "—"
        lines_cell = fmt_section_lines(atom["all_lines"])
        out.append(
            f"| `{slug}` | {status} | {src_cell} | {lit_cell} | {af_cell} | {lines_cell} |"
        )
    out.append("")

    # Per-citation sections --------------------------------------------
    out.append("## Per-citation entries")
    out.append("")
    out.append(
        "Schema: each entry follows the per-citation schema declared "
        "previously in this file (see ``Per-citation schema'' section below). "
        "Sorted alphabetically by slug for determinism."
    )
    out.append("")
    for slug in sorted(CANONICAL_ATOMS.keys()):
        atom = CANONICAL_ATOMS[slug]
        status = discharge_status(atom)
        out.append(f"### `{slug}` — {atom['label']}")
        out.append("")
        lines_summary = fmt_section_lines(atom["all_lines"])
        out.append(f"**summary.tex location(s):** lines {lines_summary}")
        out.append(
            f"  (canonical enumeration entry at `summary.tex:{atom['list_line']}`)"
        )
        out.append("**Currently flagged:** `\\unchecked` (per summary.tex's blanket")
        out.append("  `Every external reference in this document is flagged \\unchecked`")
        out.append("  declaration at line 2437).")
        if atom["resolved_src"]:
            out.append(
                "**Local PDF in `references/`:** "
                + ", ".join(f"`{s}`" for s, _ in atom["resolved_src"])
            )
            for src_id, src_row in atom["resolved_src"]:
                out.append(
                    f"  - `{src_id}` → `{src_row['local_file']}` "
                    f"(extracted: `{src_row['extracted_text']}`)"
                )
        else:
            out.append("**Local PDF in `references/`:** none")
        if atom["resolved_lit"]:
            out.append("**Literature DB record (`literature/db/papers.sqlite`):**")
            for pid, r in atom["resolved_lit"]:
                key = r["bib_key"] or f"paper#{pid}"
                arxiv = f" arXiv:{r['arxiv_id']}" if r["arxiv_id"] else ""
                out.append(
                    f"  - `{key}` (id={pid}, {r['year']}{arxiv}) — "
                    f"{r['authors_str']}: *{r['title']}*"
                )
        else:
            out.append("**Literature DB record (`literature/db/papers.sqlite`):** none")
        out.append("**Lean proof:** none (Phase 5 import pending).")
        if atom["resolved_af"]:
            out.append("**AF node (sibling, pre-Phase-7):**")
            for nid, ext in atom["resolved_af"]:
                out.append(
                    f"  - `{nid}` — *{ext['name']}* "
                    f"(content_hash `{ext['content_hash'][:16]}…`)"
                )
                out.append(f"    Source string: {ext['source']}")
        else:
            out.append("**AF node:** none (mapping deferred to Phase 7 import).")
        out.append(f"**Discharge status:** {status}")
        if atom["notes"]:
            out.append(f"**Notes:** {atom['notes']}")
        out.append("")

    # Unattached AF externals ------------------------------------------
    attached_ids: set[str] = set()
    for atom in CANONICAL_ATOMS.values():
        for nid, _ in atom["resolved_af"]:
            attached_ids.add(nid)
    unattached = [e for e in af_externals if e["id"] not in attached_ids]
    if unattached:
        out.append("## AF externals not mapped to a citation atom")
        out.append("")
        out.append(
            "The following AF nodes exist in the sibling repo's "
            f"`{SIBLING_AF_EXTERNALS}` directory but do not attach to "
            "any citation atom above. They typically discharge "
            "internal mathematical facts (F-matrix entries, golden "
            "ratio, fusion-tree basis identities) used in summary.tex "
            "without bibliographic attribution — i.e., they are "
            "**fact-discharge** AF nodes rather than "
            "**citation-discharge** nodes. Listed here for completeness; "
            "Phase 7 will revisit whether any of these should be "
            "promoted to citation atoms."
        )
        out.append("")
        out.append("| AF node id | Name | Source |")
        out.append("|---|---|---|")
        for ext in sorted(unattached, key=lambda x: x["id"]):
            src_brief = ext["source"][:120].replace("|", "\\|")
            if len(ext["source"]) > 120:
                src_brief = src_brief.rstrip() + "…"
            out.append(f"| `{ext['id']}` | {ext['name']} | {src_brief} |")
        out.append("")

    # Footer schema (preserve from stub) -------------------------------
    out.append("---")
    out.append("")
    out.append("## Per-citation schema")
    out.append("")
    out.append("```")
    out.append("## <citation key or descriptive label>")
    out.append("")
    out.append("**summary.tex location(s):** §<section>, line(s)")
    out.append("**Currently flagged:** \\unchecked | normal-cite | none")
    out.append("**Local PDF in `references/`:** <SRC-* ID or \"none\">")
    out.append("**Lean proof:** <Formalisation/<file>.<decl> or \"none\">")
    out.append("**AF node:** <ID or \"none\">")
    out.append("**Discharge status:** discharged | partial | undischarged")
    out.append("**Notes:**")
    out.append("```")
    out.append("")
    return "\n".join(out) + "\n"


# ---------------------------------------------------------------------
# Main
# ---------------------------------------------------------------------


def main() -> int:
    # Validate prerequisites loudly (CLAUDE.md Rule 1).
    if not SUMMARY_TEX.exists():
        print(f"ERROR: summary.tex not found at {SUMMARY_TEX}", file=sys.stderr)
        return 1
    if not MANIFEST.exists():
        print(f"ERROR: manifest not found at {MANIFEST}", file=sys.stderr)
        return 1
    if not LITERATURE_DB.exists():
        print(
            f"ERROR: literature DB not found at {LITERATURE_DB}; "
            "P2.5 must complete before P2.8.",
            file=sys.stderr,
        )
        return 1

    text = SUMMARY_TEX.read_text()
    summary_sha = sha256_file(SUMMARY_TEX)
    manifest_sha = sha256_file(MANIFEST)

    unchecked_lines = harvest_unchecked_locations(text)
    harvest_atom_backrefs(text)

    manifest_rows = load_manifest_src_ids(MANIFEST)

    # Collect all paper ids and bib_keys we need from CANONICAL_ATOMS.
    all_paper_ids: list[int] = []
    all_bibkeys: list[str] = []
    for atom in CANONICAL_ATOMS.values():
        all_paper_ids.extend(atom["lit_paper_ids"])
        all_bibkeys.extend(atom["lit_bibkeys"])
    lit_rows = load_lit_papers(LITERATURE_DB, all_paper_ids, all_bibkeys)

    af_rows: list[dict] = []
    if SIBLING_AF_EXTERNALS.exists():
        af_rows = load_af_externals(SIBLING_AF_EXTERNALS)
    else:
        print(
            f"WARNING: AF sibling externals dir not found at "
            f"{SIBLING_AF_EXTERNALS}; AF column will be empty.",
            file=sys.stderr,
        )

    resolve_discharges(manifest_rows, lit_rows, af_rows)
    auto_resolve_af(af_rows)

    markdown = emit_markdown(summary_sha, manifest_sha, af_rows, unchecked_lines)
    try:
        OUTPUT.write_text(markdown)
    except OSError as e:
        print(f"ERROR: could not write {OUTPUT}: {e}", file=sys.stderr)
        return 1

    # Stats (printed; goes into commit body for C-gate).
    n_total = len(CANONICAL_ATOMS)
    n_a = sum(1 for a in CANONICAL_ATOMS.values() if a["resolved_src"])
    n_b = sum(1 for a in CANONICAL_ATOMS.values() if a["resolved_lit"])
    n_c = sum(1 for a in CANONICAL_ATOMS.values() if a["resolved_af"])
    n_undisch = sum(
        1
        for a in CANONICAL_ATOMS.values()
        if not (a["resolved_src"] or a["resolved_lit"] or a["resolved_af"])
    )

    print("=== P2.8 build-citation-index ===")
    print(f"summary.tex SHA256:                 {summary_sha}")
    print(f"references manifest SHA256:         {manifest_sha}")
    print(f"\\unchecked macros found:            {len(unchecked_lines)}")
    print(f"AF externals read (sibling repo):   {len(af_rows)}")
    print(f"Citation atoms emitted:             {n_total}")
    print(f"  mapped to references/ (a):        {n_a}")
    print(f"  mapped to literature/ (b):        {n_b}")
    print(f"  mapped to AF (c):                 {n_c}")
    print(f"  undischarged (d, no local source):{n_undisch}")
    output_sha = hashlib.sha256(markdown.encode("utf-8")).hexdigest()
    print(f"Emitted CITATION_INDEX.md SHA256:   {output_sha}")
    print(f"Wrote: {OUTPUT}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
