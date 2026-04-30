#!/bin/bash
#
# PreCompact hook — runs immediately before Claude Code compacts context.
#
# Responsibilities:
#   - Snapshot recent assistant text turns to a per-project memory file so
#     decisions and rationale survive compaction.
#
# Hook input on stdin: { transcript_path, cwd, session_id, ... }
# This hook does not need to write to stdout — exit 0.

set -u

input=$(cat)
transcript=$(printf '%s' "$input" | jq -r '.transcript_path // empty' 2>/dev/null)
cwd=$(printf '%s' "$input" | jq -r '.cwd // empty' 2>/dev/null)
[ -z "$cwd" ] && cwd="$PWD"
[ -z "$transcript" ] || [ ! -f "$transcript" ] && exit 0

project_slug=$(printf '%s' "$cwd" | sed 's|/|-|g')
snap_dir="$HOME/.claude/projects/$project_slug/memory"
mkdir -p "$snap_dir" 2>/dev/null
snap_file="$snap_dir/precompact-$(date -u +%Y%m%dT%H%M%SZ).md"

{
  printf '# Pre-compaction snapshot\n\n'
  printf '_session_: %s\n' "$(basename "$transcript" .jsonl)"
  printf '_at_: %s\n\n' "$(date -u +%Y-%m-%dT%H:%M:%SZ)"
  printf '## Last 20 assistant text turns\n\n'
  tail -n 200 "$transcript" \
    | jq -r 'select(.message.role=="assistant") | [.message.content[]? | select(.type=="text") | .text] | join("\n")' 2>/dev/null \
    | grep -v '^$' \
    | tail -20 \
    | sed 's/^/> /'
} >"$snap_file" 2>/dev/null

exit 0
