## Export Chat

Export the current Claude Code session as a markdown file with a summary header.

### Usage

```bash
/export-chat [path]
```

- `path` (optional): output file path. Defaults to `./chat-export-<UTC-timestamp>.md`.

### Behavior

1. Resolve the active session's transcript path. The most reliable source is the latest `.jsonl` modified under `~/.claude/projects/<cwd-slug>/`. Use:
   ```bash
   ls -t ~/.claude/projects/$(pwd | sed 's|/|-|g')/*.jsonl | head -1
   ```
2. Run `~/.claude/scripts/transcript-to-md.sh <transcript> <out>` — this writes the **Full transcript** section deterministically (collapses tool calls, drops thinking blocks).
3. Read the transcript yourself and **prepend** two sections to the file before the existing `# Chat transcript` heading:

   ```markdown
   # TL;DR

   - <3–5 bullets of what was accomplished, in past tense>

   # Key decisions

   - **<decision>** — <one-line rationale, 'why' over 'what'>
   - <repeat for each non-obvious call: tradeoffs taken, alternatives ruled out>

   ---
   ```

4. Confirm the output path back to the user.

### Notes

- The TL;DR is the only part you author. The transcript section comes from the script — do not regenerate it by hand.
- Skip secrets: if any tool result contained an API key or token, redact it as `<REDACTED>` before writing.
- If the session has fewer than 4 turns, omit the **Key decisions** section.
- This command does not delete or modify the original transcript.
