## PR List

Display the list of open PRs in the current repository with prioritization.

### Usage

```bash
# Request to Claude
"Display the list of open PRs with prioritization"
```

### Basic Examples

```bash
# Get repository information
gh repo view --json nameWithOwner | jq -r '.nameWithOwner'

# Get open PR information and request to Claude
gh pr list --state open --draft=false --json number,title,author,createdAt,additions,deletions,reviews --limit 30

"Organize the above PRs by priority and display them with a 2-line summary for each PR. Generate URLs using the repository name obtained above"
```

### Display Format

```
Open PR List (Priority Order)

### High Priority
#number Title [Draft/DNM] | Author | Time since open | Approved count | +additions/-deletions
      ├─ Summary line 1
      └─ Summary line 2
      https://github.com/owner/repo/pull/number

### Medium Priority
(Same format)

### Low Priority
(Same format)
```

### Priority Criteria

#### High Priority

- `fix:` Bug fixes
- `release:` Release work

#### Medium Priority

- `feat:` New features
- `update:` Feature improvements
- Other regular PRs

#### Low Priority

- PRs containing DO NOT MERGE
- Draft PRs with `test:`, `build:`, `perf:`

### Notes

- GitHub CLI (`gh`) is required
- Only shows open PRs (excludes drafts)
- Displays up to 30 PRs
- Elapsed time is from when the PR was opened
- PR URLs are automatically generated from the actual repository name
