# Launch record — round 3 (2026-10-25)

Launched 2026-10-25T06:04:05+01:00 from the repo root, six concurrent explorers.
Recovery after a network outage: each explorer writes NOTE.md incrementally into its directory,
and its Codex session is persisted; resume with

    codex exec resume <session-id> "Continue: finish NOTE.md per the brief and the time budget."

| Dir | session id | log (scratchpad, this session only) |
|---|---|---|
| F1-dyadic-lift-characterisation | 01a17171-cd1a-7071-8c02-a5685579dca9 | /tmp/claude-1000/-home-tobias-Projects-cft-anyons/1e7bf440-570e-43d2-b8fb-e585fb4611e2/scratchpad/F1-dyadic-lift-characterisation.log |
| F2-zero-mode-and-lattice-chirality | 01a17171-ce10-7893-bab4-3c23b0fa9a43 | /tmp/claude-1000/-home-tobias-Projects-cft-anyons/1e7bf440-570e-43d2-b8fb-e585fb4611e2/scratchpad/F2-zero-mode-and-lattice-chirality.log |
| F3-reflection-coherence | 01a17171-ce13-7b30-8ca9-1506f93189fe | /tmp/claude-1000/-home-tobias-Projects-cft-anyons/1e7bf440-570e-43d2-b8fb-e585fb4611e2/scratchpad/F3-reflection-coherence.log |
| F4-ward-to-residual | 01a17171-ce04-7cc2-9af5-c1e16c3a0ffc | /tmp/claude-1000/-home-tobias-Projects-cft-anyons/1e7bf440-570e-43d2-b8fb-e585fb4611e2/scratchpad/F4-ward-to-residual.log |
| F5-contact-trichotomy | 01a17171-cf3c-7090-af97-85b441c0557e | /tmp/claude-1000/-home-tobias-Projects-cft-anyons/1e7bf440-570e-43d2-b8fb-e585fb4611e2/scratchpad/F5-contact-trichotomy.log |
| F6-what-the-tower-remembers | 01a17171-cf50-7fc3-9a2c-caf49fdbacb8 | /tmp/claude-1000/-home-tobias-Projects-cft-anyons/1e7bf440-570e-43d2-b8fb-e585fb4611e2/scratchpad/F6-what-the-tower-remembers.log |

Reviewer runs (Astra) are appended below when launched.

| REVIEW F4-ward-to-residual | 01a17184-0075-7bf3-8f8e-186945356159 | /tmp/claude-1000/-home-tobias-Projects-cft-anyons/1e7bf440-570e-43d2-b8fb-e585fb4611e2/scratchpad/REVIEW-F4-ward-to-residual.log | launched 06:24 |
| REVIEW F1-dyadic-lift-characterisation | 01a17185-536d-70d0-94fa-535084b00288 | /tmp/claude-1000/-home-tobias-Projects-cft-anyons/1e7bf440-570e-43d2-b8fb-e585fb4611e2/scratchpad/REVIEW-F1-dyadic-lift-characterisation.log | launched 06:25 |
| REVIEW F6-what-the-tower-remembers | 01a17187-f82e-7fb1-a009-01d22136084c | /tmp/claude-1000/-home-tobias-Projects-cft-anyons/1e7bf440-570e-43d2-b8fb-e585fb4611e2/scratchpad/REVIEW-F6-what-the-tower-remembers.log | launched 06:28 |
| REVIEW F3-reflection-coherence | 01a1718d-035b-7032-bbdb-a12454ab1f70 | /tmp/claude-1000/-home-tobias-Projects-cft-anyons/1e7bf440-570e-43d2-b8fb-e585fb4611e2/scratchpad/REVIEW-F3-reflection-coherence.log | launched 06:34 |
| REVIEW-F5-contact-trichotomy | 01a17193-ea55-7e81-87fd-c05af703372c | /tmp/claude-1000/-home-tobias-Projects-cft-anyons/1e7bf440-570e-43d2-b8fb-e585fb4611e2/scratchpad/REVIEW-F5-contact-trichotomy.log | launched 06:42 |
| SHARD-F4-ward-to-residual | 01a17196-4ac3-7fb0-b490-cc85724a494a (relaunched 06:46; first launch hung on stdin) | /tmp/claude-1000/-home-tobias-Projects-cft-anyons/1e7bf440-570e-43d2-b8fb-e585fb4611e2/scratchpad/SHARD-F4-ward-to-residual.log | launched 06:42 |
| REVIEW-F2-zero-mode-and-lattice-chirality | 01a17194-6e6f-7323-bda1-9954dbe23298 | /tmp/claude-1000/-home-tobias-Projects-cft-anyons/1e7bf440-570e-43d2-b8fb-e585fb4611e2/scratchpad/REVIEW-F2-zero-mode-and-lattice-chirality.log | launched 06:42 |
| SHARD-F1-dyadic-lift-characterisation | 01a17194-6f03-7d32-b15a-64d6e57ded4b | /tmp/claude-1000/-home-tobias-Projects-cft-anyons/1e7bf440-570e-43d2-b8fb-e585fb4611e2/scratchpad/SHARD-F1-dyadic-lift-characterisation.log | launched 06:42 |
| REVIEW F5 (resumed after operator mistake) | 01a17193-ea55-7e81-87fd-c05af703372c | /tmp/claude-1000/-home-tobias-Projects-cft-anyons/1e7bf440-570e-43d2-b8fb-e585fb4611e2/scratchpad/REVIEW-F5-contact-trichotomy.resume.log | resumed 06:44 |
| SHARD-F6-what-the-tower-remembers (CA-97) | 01a1719b-c3ba-7051-aedc-c304a9e828c7 | /tmp/claude-1000/-home-tobias-Projects-cft-anyons/1e7bf440-570e-43d2-b8fb-e585fb4611e2/scratchpad/SHARD-F6-what-the-tower-remembers.log | launched 06:50 |
| G1-transport-extraction | 01a171a2-1038-7de2-acbc-4d159bb3f6aa | /tmp/claude-1000/-home-tobias-Projects-cft-anyons/1e7bf440-570e-43d2-b8fb-e585fb4611e2/scratchpad/G1-transport-extraction.log | launched 06:57 (45-min budget) |
| G6-record-faithfulness | 01a171a2-103c-7962-b8a1-5d0f63cf1c27 | /tmp/claude-1000/-home-tobias-Projects-cft-anyons/1e7bf440-570e-43d2-b8fb-e585fb4611e2/scratchpad/G6-record-faithfulness.log | launched 06:57 (45-min budget) |
| SHARD-F3-reflection-coherence (CA-98) | 01a171a2-75e1-7441-b5df-fe57eb0d5516 | /tmp/claude-1000/-home-tobias-Projects-cft-anyons/1e7bf440-570e-43d2-b8fb-e585fb4611e2/scratchpad/SHARD-F3-reflection-coherence.log | launched 06:57 |
| SHARD-F5-contact-trichotomy (CA-99) | 01a171a5-f83a-7ec3-8786-f4345071a484 | /tmp/claude-1000/-home-tobias-Projects-cft-anyons/1e7bf440-570e-43d2-b8fb-e585fb4611e2/scratchpad/SHARD-F5-contact-trichotomy.log | launched 07:01 |
| SHARD-F2-zero-mode-and-lattice-chirality (CA-100) | 01a171a8-1778-71c0-a446-77ebcd83b89b | /tmp/claude-1000/-home-tobias-Projects-cft-anyons/1e7bf440-570e-43d2-b8fb-e585fb4611e2/scratchpad/SHARD-F2-zero-mode-and-lattice-chirality.log | launched 07:03 |
