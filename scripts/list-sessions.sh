#!/bin/bash
#
# Enumerate Claude Code sessions for the current working directory.
#
# Output: markdown table — index | started | turns | first user message | last file touched
#
# Used by the /resume-session slash command. Reads JSONL transcripts under
# ~/.claude/projects/<slug>/. The slug is the cwd with "/" replaced by "-".
#
# Usage: list-sessions.sh [limit]   # default 10

set -u

limit=${1:-10}
cwd=$PWD
slug=$(printf '%s' "$cwd" | sed 's|/|-|g')
proj_dir="$HOME/.claude/projects/$slug"

if [ ! -d "$proj_dir" ]; then
  echo "_No prior sessions found for_ \`$cwd\`."
  exit 0
fi

printf '| # | started (UTC) | turns | first user message | last file touched |\n'
printf '|---|---|---|---|---|\n'

i=0
# shellcheck disable=SC2012
ls -t "$proj_dir"/*.jsonl 2>/dev/null | head -"$limit" | while read -r f; do
  i=$((i + 1))
  started=$(jq -r 'select(.message.role=="user") | .timestamp // empty' "$f" 2>/dev/null | head -1)
  turns=$(wc -l <"$f" | tr -d ' ')
  first_msg=$(jq -r 'select(.message.role=="user") | .message.content[0].text // empty' "$f" 2>/dev/null \
    | head -1 | tr '\n' ' ' | cut -c1-80)
  last_file=$(jq -r '.message.content[]?.input.file_path // empty' "$f" 2>/dev/null \
    | grep -v '^$' | tail -1)
  printf '| %s | %s | %s | %s | %s |\n' \
    "$i" \
    "${started:-?}" \
    "$turns" \
    "${first_msg:-_(no user text)_}" \
    "${last_file:-—}"
done

printf '\n_Transcripts in_ \`%s\`\n' "$proj_dir"
