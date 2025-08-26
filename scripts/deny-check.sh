#!/bin/bash

# Read JSON input and extract command and tool name
input=$(cat)
command=$(echo "$input" | jq -r '.tool_input.command' 2>/dev/null || echo "")
tool_name=$(echo "$input" | jq -r '.tool_name' 2>/dev/null || echo "")

# Check only Bash commands
if [ "$tool_name" != "Bash" ]; then
  exit 0
fi

# Read deny patterns from settings.json
settings_file="$HOME/.claude/settings.json"

# Get all deny patterns for Bash commands
deny_patterns=$(jq -r '.permissions.deny[] | select(startswith("Bash(")) | gsub("^Bash\\("; "") | gsub("\\)$"; "")' "$settings_file" 2>/dev/null)

# Function to check if command matches deny pattern
matches_deny_pattern() {
  local cmd="$1"
  local pattern="$2"

  # Remove leading and trailing whitespace
  cmd="${cmd#"${cmd%%[![:space:]]*}"}" # Remove leading whitespace
  cmd="${cmd%"${cmd##*[![:space:]]}"}" # Remove trailing whitespace

  # Glob pattern matching (wildcard support)
  [[ "$cmd" == $pattern ]]
}

# First check the entire command
while IFS= read -r pattern; do
  # Skip empty lines
  [ -z "$pattern" ] && continue

  # Check if entire command matches pattern
  if matches_deny_pattern "$command" "$pattern"; then
    echo "Error: Command denied: '$command' (pattern: '$pattern')" >&2
    exit 2
  fi
done <<<"$deny_patterns"

# Split command by logical operators and check each part
# Split by semicolon, && and || (don't split pipe | and single &)
temp_command="${command//;/$'\n'}"
temp_command="${temp_command//&&/$'\n'}"
temp_command="${temp_command//\|\|/$'\n'}"

IFS=$'\n'
for cmd_part in $temp_command; do
  # Skip empty parts
  [ -z "$(echo "$cmd_part" | tr -d '[:space:]')" ] && continue

  # Check against each deny pattern
  while IFS= read -r pattern; do
    # Skip empty lines
    [ -z "$pattern" ] && continue

    # Check if this command part matches pattern
    if matches_deny_pattern "$cmd_part" "$pattern"; then
      echo "Error: Command denied: '$cmd_part' (pattern: '$pattern')" >&2
      exit 2
    fi
  done <<<"$deny_patterns"
done

# Allow command
exit 0
