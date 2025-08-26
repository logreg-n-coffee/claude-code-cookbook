#!/bin/bash
# Trigger-based comment check

input="$CLAUDE_TOOL_INPUT"
file_path=$(echo "$input" | jq -r '.tool_input.file_path // empty')
[ -z "$file_path" ] || [ ! -f "$file_path" ] && exit 0

# Check only when creating new files
if echo "$input" | jq -e '.tool == "Write"' >/dev/null; then
  jq -n '{decision: "block", reason: "Created a new file. For code files, consider adding appropriate docstrings (function, class, and module-level API documentation)."}'
fi

# Check only during extensive edits (when using MultiEdit)
if echo "$input" | jq -e '.tool == "MultiEdit"' >/dev/null; then
  jq -n '{decision: "block", reason: "Made multiple edits. Please check if docstrings or API documentation need to be updated to match the changes."}'
fi
