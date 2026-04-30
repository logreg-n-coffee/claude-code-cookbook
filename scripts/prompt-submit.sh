#!/bin/bash
#
# UserPromptSubmit hook — runs each time the user submits a message.
#
# Responsibilities:
#   1. Light secret scan — flag suspected API keys / tokens in the prompt
#      (does NOT block; just adds a warning to additionalContext).
#   2. Tag the prompt with an ISO-8601 timestamp so the auto-memory feature
#      can record absolute dates without asking.
#
# Hook input on stdin: { prompt, session_id, transcript_path, ... }
# Output: JSON with hookSpecificOutput.additionalContext.

set -u

input=$(cat)
prompt=$(printf '%s' "$input" | jq -r '.prompt // empty' 2>/dev/null)
ts=$(date -u +%Y-%m-%dT%H:%M:%SZ)

warnings=""

# Heuristic secret patterns (broad on purpose, low false-negative).
if printf '%s' "$prompt" | grep -qE '(sk-[a-zA-Z0-9]{20,}|ghp_[a-zA-Z0-9]{20,}|AKIA[0-9A-Z]{16}|-----BEGIN [A-Z ]*PRIVATE KEY-----)'; then
  warnings+="⚠️  Possible secret detected in user prompt — do NOT echo it back, write it to a file, or log it.\n"
fi

context="_submitted_at: ${ts}_"
[ -n "$warnings" ] && context+="\n\n$warnings"

jq -n --arg ctx "$context" '{hookSpecificOutput: {hookEventName: "UserPromptSubmit", additionalContext: $ctx}}'
