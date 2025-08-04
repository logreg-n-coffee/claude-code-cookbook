## Issue List

Display current repository's open issues with priority ranking.

### Usage

```bash
# Request to Claude
"Display open issue list with priority ranking"
```

### Basic Examples

```bash
# Get repository information
gh repo view --json nameWithOwner | jq -r '.nameWithOwner'

# Get open issue information and request to Claude
gh issue list --state open --json number,title,author,createdAt,updatedAt,labels,assignees,comments --limit 30

"Organize the above issues by priority and display with 2-line summary for each issue. Generate URLs using the repository name obtained above"
```

### Display Format

```
Open Issue List (Priority Order)

### High Priority
#number Title [Labels] | Author | Time since opened | Comment count | Assignee
      ├─ Summary line 1
      └─ Summary line 2
      https://github.com/owner/repo/issues/number

### Medium Priority
(Same format)

### Low Priority
(Same format)
```

### Priority Determination Criteria

#### High Priority

- Issues with `bug` label
- Issues with `critical` or `urgent` label
- Issues with `security` label

#### Medium Priority

- Issues with `enhancement` label
- Issues with `feature` label
- Issues with assigned assignees

#### Low Priority

- Issues with `documentation` label
- Issues with `good first issue` label
- Issues with `wontfix` or `duplicate` labels

### Label-based Filtering

```bash
# Get only issues with specific label
gh issue list --state open --label "bug" --json number,title,author,createdAt,labels,comments --limit 30

# Filter with multiple labels (AND condition)
gh issue list --state open --label "bug,high-priority" --json number,title,author,createdAt,labels,comments --limit 30
```

### Important Notes

- GitHub CLI (`gh`) is required
- Displays only open issues
- Displays maximum 30 issues
- Elapsed time is from when issue was opened
- Issue URLs are auto-generated from actual repository name
