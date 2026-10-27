# Launch record — round 4 (2026-10-27)

Launched 2026-10-27T14:08 local from the repo root, six concurrent Astra explorers
(gpt-6-astra, xhigh, ~70 min budget each). Each writes `NOTE.md` incrementally
into its directory; a cut session resumes with

    codex exec resume <session-id> "Continue: finish NOTE.md per the brief and the time budget."

| Dir | session id | log (scratchpad, this session only) |
|---|---|---|
| H1-worldline-net-gas | 01a17d7b-435d-7f02-ba25-7fa0e152e453 | scratchpad/H1-worldline-net-gas.log |
| H2-lattice-cell-equations | 01a17d7b-4387-7081-bfc0-1b10e6876d36 | scratchpad/H2-lattice-cell-equations.log |
| H3-vr1-noncollapse-instance | 01a17d7b-439a-7b13-9a44-5bd274ccb2df | scratchpad/H3-vr1-noncollapse-instance.log |
| H4-density-dilution-criticality | 01a17d7b-43da-7b43-a9d2-3365435f9b56 | scratchpad/H4-density-dilution-criticality.log |
| H5-coarse-vector-zero-mode | 01a17d7b-4415-7e33-ab19-dd54a0962e0b | scratchpad/H5-coarse-vector-zero-mode.log |
| H6-discrete-holomorphicity-selection | 01a17d7b-4435-7db3-a079-c350c3e746e1 | scratchpad/H6-discrete-holomorphicity-selection.log |

Scratchpad: `/tmp/claude-1000/-home-tobias-Projects-cft-anyons/aa559625-0d7d-413f-b9b3-f86daf8716b9/scratchpad/`.

Reviews are Opus subagents (Claude Code Agent tool, `briefs/_review_common.md`),
launched per completed note. In parallel at 14:08 two Opus reviewers were
launched on the round-3 notes G1 and G6 (writing into
`explorations/2026-10-25-astra-r3/G{1,6}-*/REVIEW.md`, `INTEGRATION.md`,
`checks/review_*`), to use the Claude weekly quota ahead of its 16:59 reset as
Tobias asked.

Quota at launch (quota CLI 14:08): Claude 5-hour 16%, Claude weekly 92%, Fable
weekly 93% (reset 16:59); Codex weekly 15%, today's allowance 13% -> 30%.
