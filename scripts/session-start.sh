#!/bin/bash
#
# SessionStart hook — runs once when a session begins.
#
# Responsibilities:
#   1. Bootstrap the auto-memory directory layout (memory/, MEMORY.md).
#      Modern Claude Code expects these to exist; create them if missing.
#   2. Inject lightweight project context (git status, recent commits, TODO.md)
#      via the "additionalContext" hook output so the session starts grounded.
#
# Output: JSON with hookSpecificOutput.additionalContext.
# Hook input on stdin: { cwd, session_id, transcript_path, ... }

set -u

input=$(cat)
cwd=$(printf '%s' "$input" | jq -r '.cwd // empty' 2>/dev/null)
[ -z "$cwd" ] && cwd="$PWD"

# --- 1. memory bootstrap (project-scoped) ---
project_slug=$(printf '%s' "$cwd" | sed 's|/|-|g')
mem_dir="$HOME/.claude/projects/$project_slug/memory"
mem_index="$mem_dir/MEMORY.md"
mkdir -p "$mem_dir" 2>/dev/null
[ -f "$mem_index" ] || printf '# Memory Index\n\n_Add one-line pointers to memory files here._\n' >"$mem_index"

# --- 2. project context ---
context=""
if [ -d "$cwd/.git" ]; then
  branch=$(git -C "$cwd" symbolic-ref --short HEAD 2>/dev/null || echo "detached")
  status=$(git -C "$cwd" status --short 2>/dev/null | head -20)
  recent=$(git -C "$cwd" log --oneline -5 2>/dev/null)
  context+="## Git context\n\n- Branch: \`$branch\`\n\n### Status (top 20)\n\`\`\`\n${status:-clean}\n\`\`\`\n\n### Recent commits\n\`\`\`\n${recent}\n\`\`\`\n\n"
fi

if [ -f "$cwd/TODO.md" ]; then
  todo=$(head -40 "$cwd/TODO.md")
  context+="## TODO.md (head)\n\`\`\`\n${todo}\n\`\`\`\n"
fi

[ -z "$context" ] && context="(no git repo and no TODO.md at session start)"

jq -n --arg ctx "$context" '{hookSpecificOutput: {hookEventName: "SessionStart", additionalContext: $ctx}}'
