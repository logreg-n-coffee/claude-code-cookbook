#!/bin/bash

# Debug log
DEBUG_LOG="/tmp/claude_permissions_debug.log"

# Temporary file to save permissions
PERMISSIONS_CACHE="/tmp/claude_file_permissions.txt"

# Read JSON from standard input
input_json=$(cat)

# Extract necessary information from JSON
hook_type=$(echo "$input_json" | jq -r '.hook_event_name // ""')
tool_name=$(echo "$input_json" | jq -r '.tool_name // ""')
file_path=$(echo "$input_json" | jq -r '.tool_input.file_path // ""')

# Record debug information
echo "[$(date)] Hook: $hook_type, Tool: $tool_name, File: $file_path" >>"$DEBUG_LOG"

# Target only file operation tools
case "$tool_name" in
Write | Edit | MultiEdit) ;;
*)
  # Pass through without doing anything
  echo "$input_json"
  exit 0
  ;;
esac

# Pass through if file path is empty
if [ -z "$file_path" ]; then
  echo "$input_json"
  exit 0
fi

if [ "$hook_type" = "PreToolUse" ]; then
  # Record current permissions if file exists
  if [ -f "$file_path" ]; then
    # Get permissions (octal format)
    current_perms=$(stat -f "%OLp" "$file_path" 2>/dev/null || stat -c "%a" "$file_path" 2>/dev/null)
    if [ -n "$current_perms" ]; then
      # Save file path and permissions
      echo "${file_path}:${current_perms}" >>"$PERMISSIONS_CACHE"
      echo "Saved permissions for $file_path: $current_perms" >&2
      echo "[$(date)] PreToolUse: Saved $file_path with permissions $current_perms" >>"$DEBUG_LOG"
    fi
  fi

elif [ "$hook_type" = "PostToolUse" ]; then
  # Restore saved permissions if available
  if [ -f "$PERMISSIONS_CACHE" ]; then
    # Search for permissions of the target file
    saved_entry=$(grep "^${file_path}:" "$PERMISSIONS_CACHE" | tail -1)
    if [ -n "$saved_entry" ]; then
      saved_perms=$(echo "$saved_entry" | cut -d: -f2)
      if [ -n "$saved_perms" ] && [ -f "$file_path" ]; then
        chmod "$saved_perms" "$file_path" 2>/dev/null
        if [ $? -eq 0 ]; then
          echo "Restored permissions for $file_path: $saved_perms" >&2
          echo "[$(date)] PostToolUse: Restored $file_path to permissions $saved_perms" >>"$DEBUG_LOG"

          # Wait 3 seconds in background then set permissions again
          (
            sleep 3
            chmod "$saved_perms" "$file_path" 2>/dev/null
            if [ $? -eq 0 ]; then
              echo "[$(date)] PostToolUse: Re-restored $file_path to permissions $saved_perms (delayed 3s)" >>"$DEBUG_LOG"
            fi
          ) &

          # Remove the entry from cache
          grep -v "^${file_path}:" "$PERMISSIONS_CACHE" >"${PERMISSIONS_CACHE}.tmp" || true
          mv "${PERMISSIONS_CACHE}.tmp" "$PERMISSIONS_CACHE" 2>/dev/null || true
        else
          echo "Failed to restore permissions for $file_path" >&2
        fi
      fi
    fi
  fi
fi

# Output input as-is (no changes)
echo "$input_json"
