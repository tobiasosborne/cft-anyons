# Hostile review — `PRD.md` v0 (P0.8 draft, 2026-05-16)

**Reviewer:** Opus 4.7 (hostile-reviewer brief)
**Target:** `/home/tobias/Projects/cft-anyons/PRD.md` (814 words)
**Baseline:** `stocktake/MIGRATION_PLAN.md` §16 outline; `CLAUDE.md` / `AGENTS.md`; `stocktake/README.md`
**Verdict (see end):** REVISE AND RESUBMIT.

The PRD is competently structured and very nearly there. It covers all 12 outline sections, the prose is tight, and the cross-references to CLAUDE.md and MIGRATION_PLAN.md are mostly clean. But several load-bearing rules are misstated or weaker than CLAUDE.md, and the version number is internally inconsistent — both serious for a document that is the *first thing every future agent reads*. The rest is fixable in a single editorial pass.

---

## Severity-ranked findings

### Critical (must fix before merging)

**C1. The "refuse to add content" gate is weaker in PRD than in CLAUDE.md, and contradicts CLAUDE.md.**
PRD line 42: "If you have not read 1–4, you must refuse to add mathematical content." CLAUDE.md line 28: "If you have not read 1–3, you must refuse to add mathematical content."
Two problems:
1. The two documents disagree on whether reading CLAUDE.md itself is a precondition. PRD says yes (steps 1–4 include CLAUDE.md); CLAUDE.md says no (steps 1–3 stop before itself).
2. As a load-bearing rule of the project (per the user's question 10), this MUST be identical across both files or one will silently win. A literal-minded agent reading PRD first will believe it must read CLAUDE.md before adding content; an agent reading CLAUDE.md after a /clear will believe it can skip.
This single mismatch is the most dangerous thing in the PRD. CLAUDE.md is also weaker than PRD: an agent could conform to CLAUDE.md by reading GLOSSARY+CONVENTIONS but never reading the methodology rules.
**Fix:** Pick one canonical formulation, write it once, and have both files state it identically. I recommend PRD's "1–4" (i.e., methodology is a precondition for content). Then file a one-line edit to CLAUDE.md (atomic, mechanical, exempt from review per CLAUDE.md Rule 4) to match.

**C2. The version string is self-contradictory.**
Line 15: "Version: **v0** (P0.8, 2026-05-16)". Line 130: "Current: **v0.3, mid-consolidation**".
What is the document's version? `v0` or `v0.3`? Nothing in PRD, MIGRATION_PLAN, or CLAUDE.md defines a `v0.3` notion or a minor-version scheme. The MIGRATION_PLAN explicitly defines only `v0` (P0.8), `v1` (P1.11), `final` (P11.4). The "v0.3" appears to be a hallucinated artefact — possibly the author was thinking of "Phase 0, sub-step 3" and got confused. This will provoke "what version am I supposed to be reading?" doubt in the first agent who notices.
**Fix:** Replace "v0.3, mid-consolidation" on line 130 with "v0 (Phase 0 of MIGRATION_PLAN in progress)". If a sub-version scheme is genuinely wanted, define it in this section.

**C3. PRD lists canonical artifacts as if they exist; most are empty stubs or absent.**
Lines 60–74 enumerate `summary.tex`, `GLOSSARY.md`, `CONVENTIONS.md`, `ERRATA.md`, `Formalisation/`, `src/MobileAnyons/`, `scripts/{julia,wolfram}/`, `references/`, `literature/`, `reviews/`, `PROVENANCE.md`, `CITATION_INDEX.md`. Of these, at P0.8:
- `Formalisation/`, `src/MobileAnyons/`, `references/`, `literature/` are empty.
- `GLOSSARY.md`, `CONVENTIONS.md`, `ERRATA.md`, `PROVENANCE.md`, `CITATION_INDEX.md`, `RESEARCH_NOTES.md` are docstring-only stubs.
- `scripts/{julia,wolfram}/` contain only `.gitkeep`.
- Only `summary.tex` and `reviews/` have substantive content.
An agent reading PRD will naturally read CONVENTIONS.md before adding content (per the read order) and find it empty — and will then either give up, or worse, treat the silence as licence to invent conventions. The PRD must say loudly that these are scaffold-state.
**Fix:** Add one line at the top of "Canonical artifacts": "**Status (P0.8):** most artifacts are scaffolded stubs; see `MIGRATION_LOG.md` for population status. Treat 'absence of a GLOSSARY entry' as 'stop and ask', not 'free to invent'." Or split into "Exists and substantive" / "Stub, populated in Phase N" sub-lists.

### Major (fix before this PRD goes to production)

**M1. "Substantive addition" is left undefined in PRD; the definition lives in CLAUDE.md Rule 4.**
PRD line 84: "any substantive addition (CLAUDE.md Rule 4)". An agent who has not yet read CLAUDE.md (entirely possible if they're reading PRD top-to-bottom for the first time) cannot tell whether their change is substantive. Since reviewer-gating is the load-bearing quality control (per user question 10), the trigger criterion belongs in PRD itself.
**Fix:** Add one parenthetical: "(substantive = adds mathematical content, code, conventions, GLOSSARY entries, ERRATA entries, sections, or prose; see CLAUDE.md Rule 4 for the exemption list)." Roughly 20 words; fits the budget if M2 is also applied.

**M2. The read order steps 1–7 are subtly wrong on priorities.**
Steps 5 and 6 are conditional ("only if doing consolidation work", "only if you need the inheritance picture"). But step 5 is `summary.tex`, which has no conditional — yet for many tasks (e.g., touching the Julia backend with no new math) reading the whole `summary.tex` is overkill. Conversely, the actual ordering of priorities is: PRD → GLOSSARY → CONVENTIONS → CLAUDE.md → *the bd issue / task description* → relevant artifact. The "relevant artifact" can be summary.tex, a Lean file, a script, or a literature note. By singling out summary.tex as step 5, the PRD pushes agents toward LaTeX-first reading even for code work. Also, steps 6–7 should arguably swap (stocktake/README is the inheritance picture; the migration plan operationalises it — read README first to know whether you even need the plan).
**Fix:** Rewrite step 5 as "the artifact relevant to your task (typically `summary.tex` § for math, a Lean module for formalisation, a script for verification)"; swap 6 and 7 (`stocktake/README.md` before `MIGRATION_PLAN.md`).

**M3. Stop-condition list is missing several foreseeable stuck-states from CLAUDE.md and the project's risk register.**
Compare PRD lines 96–103 against CLAUDE.md "Stop conditions" §348–365 and MIGRATION_PLAN §12 risk register. PRD does not list:
- "An external Lean dependency would be added to Mathlib pinning" (risk: drifts the 0-sorry invariant).
- "Two independent agents (Opus checks) disagree on a translation rule" (CLAUDE.md has this; PRD has a weaker version).
- "A review subagent gives a non-actionable verdict" (e.g., 'looks ok' with no per-claim signoff) — neither doc covers this.
- "A bd issue cannot be filed because of cross-device sync conflict" (this happens; CLAUDE.md beads section implies it but doesn't say "stop").
- "The Mathlib version pin would need to change for an import" (CLAUDE.md §251 says "verified by lake build against Mathlib d6dab93, Lean v4.30.0-rc2"; PRD is silent on what to do if an import requires drift).
**Fix:** Either expand PRD's list, or replace it with "see CLAUDE.md §Stop-conditions for the full list" and prune PRD's enumeration to the top 3 most-common cases. Mixed half-lists are worse than either extreme.

**M4. The hallucination-risk callouts in CLAUDE.md are not surfaced in PRD; some are project-critical and would catch errors *before* CLAUDE.md is read.**
CLAUDE.md §202–254 contains 7 specific risk callouts: vacuum index, F-matrix gauge, "coassociativity" overload, "dagger-special" vs "Frobenius-special", three Hilbert-space framings, `\unchecked` discharge status, Lean 0-sorry invariant, and "chats are archived for a reason." These are exactly the things an agent who has *not yet* read CLAUDE.md will trip over.
Two of these are already implicit in PRD's "Known limitations" (coassociativity, no-local-PDF list, sorry-axiom invariant). The other five are project-critical and PRD-absent. A new agent who reads only PRD will not know that "chat1–4.md" are deep storage, will not know vacuum-index has historically been a bug source, will not know about the F-matrix gauge translation rule.
**Fix:** Add a 5-line "Pre-read warnings" subsection (or fold into Known Limitations): "Before touching any imported content, read CLAUDE.md's Hallucination-risk callouts. Specifically: vacuum-index, F-matrix gauge, coassociativity overload, three Hilbert-space framings, the archived chats." This is roughly 50 words.

**M5. PRD says nothing about the "do not push, do not CI" rule.**
CLAUDE.md Rule 9 ("No GitHub CI, no automated remote runs") is project-critical. A new agent (especially one inheriting habits from other repos) will reflexively propose `.github/workflows/` or "let me add a CI badge". PRD never mentions this, so the agent will look in CLAUDE.md only if they've already been told to look. Promoting this to PRD as a one-line "Out of scope: CI/CD; quality gates run locally only (see CLAUDE.md Rule 9)" prevents the predictable mistake.
**Fix:** One line, in "Scope: out".

**M6. The Hilbert-space three-framings problem is the dominant definitional risk per `stocktake/README.md` §2 and MIGRATION_PLAN §0.1, but PRD does not mention it.**
PRD's "Mission" line 26 says "indefinite-particle Hilbert spaces of mobile anyons" — singular noun, as if there is one canonical Hilbert space. There is not one (yet); there are three formulations and a translation map that does not yet exist (P1.4 is unstarted). An agent who tries to add math without knowing this will pick one framing and produce content that silently violates the others. This SHOULD be in PRD because GLOSSARY does not yet have the entries (per stub state in C3).
**Fix:** Either add a line to "Mission" ("formalised via three equivalent framings — see GLOSSARY"), or add to Known Limitations.

### Minor

**Mi1. "v0 (P0.8, 2026-05-16)" in line 15 vs "v0, P0.8" referenced in HTML comment line 7.** Pick one notation. Suggest `v0 (drafted at P0.8, 2026-05-16)`.

**Mi2. CLAUDE.md is identical to AGENTS.md per CLAUDE.md line 3, but PRD says "`CLAUDE.md` / `AGENTS.md`" (line 37) without explaining the relationship.** A first-read agent has to make an inference. One parenthetical: "(identical pair; edit both in the same commit)" matches the language CLAUDE.md uses.

**Mi3. PRD mentions "RESEARCH_NOTES.md" three times (lines 117, 119, 123) but it is missing from the canonical artifacts list (lines 60–74).** Either add it to the list, or stop linking it. Same applies to `MIGRATION_LOG.md` (line 16: "read MIGRATION_LOG.md for execution status"; not in canonical artifacts list).

**Mi4. "five gates (M / D / C / R / I)" — only the names are given. D and R are load-bearing.** Per the user's question 6: D and R should be expanded in PRD. R in particular is the reviewer-gating policy (CLAUDE.md Rule 4) which deserves a sentence in-place. Currently PRD points to MIGRATION_PLAN §0.3 but the reviewer-policy text is in CLAUDE.md Rule 4, not MIGRATION_PLAN. So even an agent who follows the pointer learns the wrong thing.
**Fix:** "**R** reviewer subagent (independent of the author; required for substantive additions; see CLAUDE.md Rule 4 for what counts as substantive and for tier-based effort budgets)" — replace the existing R line.

**Mi5. PRD line 116 says "Categorical coassociativity (`(η⊗id)η = (id⊗η)η`) not formalised — only scalar version proved in CAD Lean."** This is the post-P5.11 state, not the current state. At P0.8, no Lean has been migrated; CAD is still in `cft-anyons-deprecated/`. Either qualify ("when Lean migration completes, scalar version will be available; categorical not formalised anywhere") or move this to Known Limitations once Phase 5 lands. Subtle but matters: an agent might look in `Formalisation/` for the scalar proof and find nothing.

**Mi6. "Adding content outside scope is a stop condition — escalate to the user." (line 57-58)** Good rule, but ambiguous trigger: is "adding a new convention to handle imported MMA content" outside scope? The MIGRATION_PLAN explicitly says yes-it-is-in-scope. The PRD's scope statement is at the *subject-matter* level (anyons, fusion categories) but agents will misapply it to procedural questions. Add: "Scope is at the subject-matter level; consolidation-procedural additions (CONVENTIONS entries, ERRATA, translation maps) are governed by `MIGRATION_PLAN.md`."

**Mi7. "Substantive prose" in CLAUDE.md Rule 4 is undefined; PRD inherits the ambiguity.** Is a one-paragraph clarification to a docstring "substantive prose"? Is a typo fix to a section header substantive? CLAUDE.md gives examples but no precise rule. This is more a CLAUDE.md problem than a PRD problem, but PRD's "any substantive addition" inherits the fuzziness.

**Mi8. PRD says (line 67) "**`Formalisation/`** — Lean 4. Invariants: `lake build` passes; zero `sorry`; zero `axiom`."** At P0.8, `Formalisation/` is empty. `lake build` on an empty package is trivially true. The invariant is meaningful only post-Phase 4. Suggest: "Invariants (once content is present): ...".

**Mi9. PRD has no "what this PRD covers / does not cover" meta-paragraph.** A reader who hits an edge case wants to know whether the answer is in PRD or somewhere else. Currently the implicit rule is "read 1–4, then ask"; making this explicit ("If your question is about *what* / *what scope*, this PRD is canonical. If it's about *how* / *what process*, see CLAUDE.md. If it's about *what's next* / *what's the plan*, see MIGRATION_PLAN.") would prevent a lot of misrouting.

**Mi10. Step 5 of the read-order ("relevant section of summary.tex — the canonical mathematical narrative") and the canonical-artifacts entry for summary.tex (line 62) describe summary.tex differently.** Step 5 calls it "the canonical mathematical narrative"; line 62 calls it "guiding conceptual mathematical statement." These are different claims (narrative vs statement). Pick one.

**Mi11. PRD's "Escalation" §122–126 is shorter than CLAUDE.md's escalation (CLAUDE.md §348–368). PRD omits "the specific reproducible command" requirement and the "two-reviewer disagreement → user adjudicates" detail is buried.** Compress consistently or expand consistently.

### Nitpick

**N1.** Line 15: "Status: mid-consolidation." Redundant with line 130's "Current: v0.3, mid-consolidation". Pick one.

**N2.** Line 47: "Anyons in unitary fusion categories; partition Hilbert spaces; cellwise isometric refinement maps; ..." semi-colons could be commas — list reads as run-on. Cosmetic.

**N3.** "Garjani–Ardonne" appears in scope (line 50) without any reader explanation. A new agent has no idea what this is. The mission paragraph already mentions "OAR (operator-algebraic-renormalisation)" with parenthetical expansion — apply the same treatment to Garjani–Ardonne, or drop the proper name and just say "pair-creation isometries".

**N4.** The HTML comments at the top (lines 3–13) are great metadata but are not visible in the rendered file. Consider adding the "UPDATE POLICY" as a visible section so agents who view the rendered MD on GitHub see it.

**N5.** "v1.0-consolidated after MIGRATION_PLAN Phase 11 completes" (line 132–133) — but Phase 11 is called "Final consistency sweep" not "Consolidation". A pedantic agent might object. Suggest "v1.0-consolidated after the canonical repo passes the Phase 11 consistency sweep."

**N6.** Line 92: "Red-green TDD by default; port-and-verify for migration of proven content (CLAUDE.md Rule 5)." Useful, but the *what* is buried in a 2-word phrase. New agents won't know "port-and-verify" without reading CLAUDE.md Rule 5. Add: "(port = copy faithfully; verify = mutation-prove tests catch regressions)".

**N7.** Word count: 814 vs ≤800 target. Trivially over. The fixes proposed in this report add ~150 words and cut about ~80. Net: about +70. PRD will be ~880 words; the user has to decide whether the ≤800 cap is firm. Recommend: bump the cap to 1000 in MIGRATION_PLAN §16, since the current PRD is already information-dense.

---

## Recommended edits (concrete, actionable)

Format: line-number → action.

1. **L15 + L130** — replace the version block with a single self-consistent statement. Use: `**Version: v0 (drafted at P0.8, 2026-05-16). Status: scaffold; Phase 0 of MIGRATION_PLAN.md in progress.**` Then delete the "Versioning" section (L128–134) entirely or compress to a 2-line milestone-tag note.

2. **L37 + L42 + CLAUDE.md L28** — make the read-order count consistent. Recommended: PRD lists 7 items, the "refuse-to-add-content" rule says "1–4" (i.e., must read methodology), and CLAUDE.md line 28 is updated to "1–4" in the same atomic commit. (CLAUDE.md edit is mechanical; exempt from review.)

3. **L46 (after "Read order for any agent")** — insert a 1-line note: "If your question is about scope, this PRD is canonical. For how-to-work questions, see CLAUDE.md. For what-comes-next, see MIGRATION_PLAN.md."

4. **L38 (step 5)** — rewrite as: "The artifact relevant to your task (typically `summary.tex` § for math; a Lean module for formalisation; a Julia/Wolfram script for verification)."

5. **L39, L40 (steps 6–7)** — swap: put `stocktake/README.md` first (inheritance picture; lighter), `MIGRATION_PLAN.md` second (only if doing consolidation work).

6. **L57** — change "Adding content outside scope is a **stop condition**" to "Adding mathematical / domain content outside the subject-matter scope is a **stop condition**. Consolidation-procedural additions (CONVENTIONS, ERRATA, translation maps) are governed by `MIGRATION_PLAN.md`." Resolves Mi6.

7. **L57 (Scope: out)** — append: "Also: GitHub CI, automated remote test runs, `.github/workflows/`. Quality gates run locally only — see CLAUDE.md Rule 9." Resolves M5.

8. **L60 (Canonical artifacts) — prepend a status line.** "**Status (Phase 0):** most artifacts below are scaffolded stubs (see `MIGRATION_LOG.md`). 'GLOSSARY entry absent' means STOP, not 'invent one'." Resolves C3.

9. **L66 (RESEARCH_NOTES.md missing) and L16 (MIGRATION_LOG.md missing)** — add both to the canonical-artifacts list. Resolves Mi3.

10. **L84 (R gate)** — replace with: "**R** reviewer subagent (independent of the author; required for substantive additions = any commit that adds mathematical content, code, conventions, GLOSSARY entries, ERRATA, new sections, or substantive prose; see CLAUDE.md Rule 4 for tier-based budgets and the mechanical-exemption list)." Resolves M1 and Mi4.

11. **After L94 (new subsection "Pre-read warnings" or fold into "Known limitations")** — 5 lines: "Before touching imported content, read CLAUDE.md's Hallucination-risk callouts. Specifically: vacuum-index convention is the historical STL-1 bug; the F-matrix gauge is involutory in `TensorCategories.jl` and unitary in `summary.tex`; 'coassociativity' is overloaded (scalar vs categorical); three Hilbert-space framings exist with a translation map; `chat1–4.md` in `archive/chats/` are deep storage — do not read." Resolves M4 and M6 partly.

12. **L95–103 (Stop conditions)** — either expand to cover the gaps in M3, or replace with "Stop and ask when any condition in CLAUDE.md §Stop-conditions applies. The most common: GLOSSARY conflict; local source disagrees with `summary.tex`; build fails after import; would need `sorry`/`axiom`; MIGRATION_PLAN says 'STOP and ask user'. See CLAUDE.md for the full list." Resolves M3.

13. **L37 ("CLAUDE.md / AGENTS.md")** — append parenthetical: "(identical pair; edits go to both in the same commit)". Resolves Mi2.

14. **L67 (Formalisation invariants)** — change to: "Invariants (post-Phase 4): `lake build` passes; zero `sorry`; zero `axiom`." Resolves Mi8.

15. **L92 (TDD line)** — append: "(port-and-verify = copy proven content faithfully, capture invariants in tests, mutation-prove the tests catch regressions)". Resolves N6.

16. **L116** — qualify: "Categorical coassociativity not formalised anywhere; scalar version proved in CAD Lean and to be migrated in Phase 5." Resolves Mi5.

17. **L62 vs L38** — pick one description of `summary.tex` (either "canonical mathematical narrative" or "guiding conceptual mathematical statement"). Resolves Mi10.

18. **MIGRATION_PLAN §16 word cap** — raise from 800 to 1000 words. The current PRD is already at 814 with information-dense content; the fixes above push it to ~880–950 and there is no obvious section to cut. Better to relax the cap than to amputate the warnings.

---

## Cross-document consistency conflicts found

- PRD "1–4" vs CLAUDE.md "1–3" for the refuse-to-add gate. (C1.)
- PRD "v0.3" vs MIGRATION_PLAN's three-version scheme (v0 / v1 / final). (C2.)
- PRD line 67 declares `lake build` invariant; at P0.8 the directory is empty so the invariant is vacuously true. (Mi8.)
- PRD line 62 "guiding conceptual mathematical statement" vs PRD line 38 "canonical mathematical narrative" vs MIGRATION_PLAN line 419 "the guiding conceptual mathematical statement" — three slightly different framings of what `summary.tex` is. (Mi10.)
- PRD line 51 lists "Lean + Julia + Wolfram" as matching numerical and formal-proof checks; CLAUDE.md line 156–159 lists the same triple. Consistent, but PRD does not mention CLAUDE.md's stronger requirement that scripts mirror Lean modules 1:1 (per CHECKS.md convention). Worth flagging.
- PRD line 26 implies a single "Hilbert space" framing; CLAUDE.md and stocktake/README.md and MIGRATION_PLAN make clear there are three. (M6.)
- PRD says nothing about `bd` (beads); CLAUDE.md devotes a whole section. Probably OK — bd is *how* not *what* — but a 1-line "task tracking: bd (see CLAUDE.md)" in Escalation would help orient new agents.

---

## On the load-bearing "refuse to add content" gate

The user's question 10 — could an agent rationalise around the gate? Yes, in several ways:

- **"Mathematical content" is underdefined.** Is adding a TikZ macro definition mathematical content? Is adding a docstring to a Lean stub mathematical content? Is adding a citation footnote to summary.tex mathematical content? An agent eager to be productive will lean toward "no" on each of these.
- **"Refuse" is verb without consequence.** What happens if the agent refuses? Does it report to the user? Does it block all work? Does it just skip to a "small" task? The rule is currently absolute but operationally vague. CLAUDE.md is no better on this.
- **"Have not read" is unverifiable.** An agent claiming "I have read GLOSSARY" cannot be checked — and after a /clear, the agent's previous claim about reading is meaningless. The harness should track this, but the documents do not.
- **The Phase-0 trap.** Currently GLOSSARY is empty. By the literal rule, ZERO mathematical content can be added until GLOSSARY has entries. But P1.1 is "extract definitions from summary.tex into GLOSSARY" — which IS adding content. The bootstrapping case is unaddressed in PRD; CLAUDE.md Law 1 has the same problem.

**Recommended hardening:**
- Define "mathematical content" by enumeration in PRD: any new claim, definition, lemma, proof, statement, equation, F-matrix entry, F-symbol value, gauge choice, indexing, citation, or any prose that asserts or implies one of these.
- Define what "refuse" means operationally: the agent files a bd issue describing the proposed work, marks itself blocked on "reader has not completed PRD/GLOSSARY/CONVENTIONS/CLAUDE.md", and stops.
- Add a Phase-0 exception: until GLOSSARY is populated (P1.10 complete), additions to GLOSSARY are *the* permitted form of "mathematical content addition", subject to the per-entry validation in P1.1.
- Add a session-start acknowledgement: agent's first commit of a session should include `Pre-read: PRD@<hash> GLOSSARY@<hash> CONVENTIONS@<hash> CLAUDE.md@<hash>` in the commit message, asserting the agent has read those file versions. This is checkable; the harness can validate.

These hardening proposals are out of scope for a v0 PRD review; mention them for the next revision (PRD v1, P1.11).

---

## Verdict

**REVISE AND RESUBMIT.**

Why not APPROVE WITH MINOR EDITS: the C1 read-order mismatch with CLAUDE.md, the C2 version self-contradiction, and the C3 "artifacts that don't exist yet" issue are each independently sufficient to mislead an agent who reads this PRD as their first encounter with the repo. They are all easily fixable, but they need to be fixed before this is the entry point.

Why not REJECT: the structure is right; all 12 MIGRATION_PLAN §16 outline sections are present; the prose is competent; the cross-references to CLAUDE.md are mostly clean; the choice of what to include and exclude is sound. A 30–60 minute editorial pass addressing the Critical and Major findings plus 8–10 of the Minor ones will produce an approvable v0.

**Re-review trigger:** when the author submits a v0.1 PRD addressing C1, C2, C3, M1–M6 (and ideally most Minor findings), I will re-review. Expected outcome at that point: APPROVE WITH MINOR EDITS or APPROVE.
