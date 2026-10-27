# Astra explorations, round 4 — 2026-10-27

Six Codex explorers (gpt-6-astra, xhigh, ~70 min each), one per pillar gap
identified in the status overview (worklog 023 §0, §4) after Tobias's
four-pillars ruling (AGENTS.md "The four pillars", Rule 18). Reviews are
**Opus** subagents (`briefs/_review_common.md`), per Tobias's instruction
"use astras to prove statements; opus to review". Generality rule: results
are formulated for arbitrary C and only checked in examples. Nothing here is a
result until a review and the worklog record it.

| Dir | Pillar | Conjecture | Layer tags |
|---|---|---|---|
| H1-worldline-net-gas | P2+P1 | exact labelled worldline net-gas representation of the Gibbs state for any C; Levin-Wen rules exactly; domain Markov property; sign structure; conformal invariance stated as a precise conjecture | any; L0+decl.; finite ingredient |
| H2-lattice-cell-equations | P3 on P2 | LC-1's cell/Ward equations posed at finite cutoff on the CA-80/86 cells; lattice LC-W; first-order Ward selection system and its F-dependence; the finite-cutoff system is a cochain complex | full/open(module cat.); L0(+L1 seam); ->R2/R3 |
| H3-vr1-noncollapse-instance | P4 | non-collapse clause A5 for VR-1; first genuine uniform graph-norm instance (free fermion as the check); same-system clause | periodic; category-free; R2 |
| H4-density-dilution-criticality | P1+P4 | zero density forces z=2; c!=0 needs finite worldline density; vacancy insertion halves density exactly, so the bare lift tower carries no critical Wilson state; what a dressing must do | any; L0+decl.; R1 obstruction |
| H5-coarse-vector-zero-mode | P4 | Target 100.12 (round-3 G2 brief, never launched) | full; category-free; ->R2 |
| H6-discrete-holomorphicity-selection | P3 on P2 | Z(C)-defect-endpoint observable; discrete holomorphicity as a finite linear system on tile weights depending on F and the half-braiding; Nienhuis weights as the TL-type check; the first categorical selection equation for h | periodic/full; L0+Z(C)-datum; ->R2/R3 |

Launch (from the repo root; `--approve-for-me` implies the workspace-write
sandbox and must not be combined with `-s`; append `< /dev/null`):

    codex exec -m gpt-6-astra -c model_reasoning_effort=xhigh --approve-for-me \
      --skip-git-repo-check -o explorations/2026-10-27-astra-r4/KEY/final-message.md \
      "$(cat explorations/2026-10-27-astra-r4/briefs/KEY.md)" < /dev/null

Quota at launch (quota CLI, 14:05 local): Codex weekly 14% used, today's pace
allowance 13% -> 31%; Claude weekly 92%, Fable weekly 93%, both reset 16:59;
Opus reviews are scheduled after that reset.
