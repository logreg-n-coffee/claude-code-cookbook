# GitHub CI Monitoring

Monitor GitHub Actions CI status and track until completion.

## Usage

```bash
# Check CI status
gh pr checks
```

## Basic Examples

```bash
# Check CI after PR creation
gh pr create --title "Add new feature" --body "Description"
gh pr checks
```

## Integration with Claude

```bash
# Flow from CI check to fixes
gh pr checks
"Analyze CI check results and propose fixes if there are failed items"

# Re-check after fixes
git push origin feature-branch
gh pr checks
"Check CI results after fixes and confirm there are no issues"
```

## Example Output

```
All checks were successful
0 cancelled, 0 failing, 8 successful, 3 skipped, and 0 pending checks

   NAME                                    DESCRIPTION                ELAPSED  URL
○  Build/test (pull_request)                                          5m20s    https://github.com/user/repo/actions/runs/123456789
○  Build/lint (pull_request)                                          2m15s    https://github.com/user/repo/actions/runs/123456789
○  Security/scan (pull_request)                                       1m30s    https://github.com/user/repo/actions/runs/123456789
○  Type Check (pull_request)                                          45s      https://github.com/user/repo/actions/runs/123456789
○  Commit Messages (pull_request)                                     12s      https://github.com/user/repo/actions/runs/123456789
-  Deploy Preview (pull_request)                                               https://github.com/user/repo/actions/runs/123456789
-  Visual Test (pull_request)                                                  https://github.com/user/repo/actions/runs/123456789
```

## Notes

- Check details when failures occur
- Wait for all checks to complete before merging
- Re-run `gh pr checks` as needed
