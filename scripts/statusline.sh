#!/bin/bash
#
# Claude Code statusLine renderer.
# Reads a JSON payload on stdin and emits ONE line of text.
# Payload fields used: cwd, model.display_name, transcript_path, output_style.name.
#
# Output format:
#   <model> | <branch> | <cwd-basename> | <turns> turns | <style>
#
# Designed to finish in <300ms. No network calls.

set -u

input=$(cat)

model=$(printf '%s' "$input" | jq -r '.model.display_name // .model.id // "claude"' 2>/dev/null)
cwd=$(printf '%s' "$input" | jq -r '.cwd // empty' 2>/dev/null)
transcript=$(printf '%s' "$input" | jq -r '.transcript_path // empty' 2>/dev/null)
style=$(printf '%s' "$input" | jq -r '.output_style.name // "default"' 2>/dev/null)

cwd_short="${cwd##*/}"
[ -z "$cwd_short" ] && cwd_short="~"

branch="-"
if [ -n "$cwd" ] && [ -d "$cwd/.git" ]; then
  branch=$(git -C "$cwd" symbolic-ref --short HEAD 2>/dev/null || echo "detached")
fi

turns=0
if [ -n "$transcript" ] && [ -f "$transcript" ]; then
  turns=$(wc -l <"$transcript" | tr -d ' ')
fi

printf '%s | %s | %s | %s turns | %s\n' "$model" "$branch" "$cwd_short" "$turns" "$style"
