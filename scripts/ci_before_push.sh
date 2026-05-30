#!/usr/bin/env bash
# Local pre-push quality gate. Skips gracefully when a tool or the git repo is
# absent. There is no remote CI by project policy (AGENTS.md Rule 13).
set -euo pipefail

ROOT="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"
cd "$ROOT"

if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  git diff --check
else
  printf 'ci-before-push: not a git repository, skipping git diff --check\n'
fi

scripts/check_report_shards.sh

if command -v latexmk >/dev/null 2>&1; then
  make report
else
  printf 'ci-before-push: latexmk not found, skipping report build\n'
fi

if command -v julia >/dev/null 2>&1; then
  julia --project=. -e 'using Pkg; Pkg.test()'
else
  printf 'ci-before-push: julia not found, skipping Julia checks\n'
fi
