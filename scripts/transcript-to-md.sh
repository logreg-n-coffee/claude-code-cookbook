#!/bin/bash
#
# Convert a Claude Code JSONL transcript to readable markdown.
#
# Tool calls collapse to one line: `tool: ToolName(<arg-summary>)`.
# Text blocks are preserved verbatim. Thinking blocks are skipped.
#
# Usage: transcript-to-md.sh <transcript.jsonl> [output.md]
#        transcript-to-md.sh -      # read jsonl from stdin
#
# If <output.md> is omitted, writes to stdout.

set -u

src=${1:-}
[ -z "$src" ] && {
  echo "usage: transcript-to-md.sh <transcript.jsonl|-> [output.md]" >&2
  exit 2
}
out=${2:-/dev/stdout}

if [ "$src" = "-" ]; then
  feed=$(cat)
else
  [ -f "$src" ] || {
    echo "not found: $src" >&2
    exit 1
  }
  feed=$(cat "$src")
fi

{
  printf '# Chat transcript\n\n'
  printf '_exported_: %s\n\n' "$(date -u +%Y-%m-%dT%H:%M:%SZ)"
  printf -- '---\n\n'

  printf '%s' "$feed" | jq -r '
    select(.message.role == "user" or .message.role == "assistant") |
    "\n## " + (.message.role | ascii_upcase) + "\n\n" +
    ([.message.content[]? |
      if .type == "text" then .text
      elif .type == "tool_use" then
        "`tool:` **" + .name + "** " +
        ((.input // {}) | tostring | .[0:120])
      elif .type == "tool_result" then
        "`tool_result:` " + ((.content // "" | tostring) | .[0:200])
      else empty end
    ] | join("\n\n"))
  '
} >"$out"
