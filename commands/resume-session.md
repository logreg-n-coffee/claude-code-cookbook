## Resume Session

Reload context from a previous Claude Code session in this working directory.

### Usage

```bash
/resume-session [n]
```

- `n` (optional): pick session number directly without showing the menu. Defaults to interactive selection.

### Behavior

1. Run `~/.claude/scripts/list-sessions.sh 10` to enumerate the 10 most recent sessions for `$PWD`. The script reads JSONL transcripts under `~/.claude/projects/<slug>/`.
2. Render the returned markdown table to the user. Each row shows: index, start time (UTC), turn count, first user message (80 char preview), last file touched.
3. Ask the user to choose an index (or use the argument if provided).
4. Read the selected `.jsonl` transcript with the `Read` tool.
5. Produce a **resume brief**:
   - **Goal of last session** — inferred from the first 1–2 user messages.
   - **What was done** — bulleted list of significant tool calls (Edit/Write file paths, Bash commands grouped, PRs created).
   - **Open threads** — anything the assistant said it would do but did not, any unanswered user question, any failing test or error not resolved.
   - **Next step** — one concrete recommendation.
6. Wait for the user to confirm before resuming work.

### Notes

- Do not silently re-execute commands from the prior session. Plan first, execute after confirmation.
- If `list-sessions.sh` returns "_No prior sessions found_", say so and stop.
- For very long transcripts (>500 turns), read the head and tail rather than the full file.
