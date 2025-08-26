# PR Auto Update

## Overview

A command that automatically updates Pull Request descriptions and labels. Analyzes Git changes to generate and set appropriate descriptions and labels.

## Usage

```bash
/pr-auto-update [options] [PR number]
```

### Options

- `--pr <number>` : Specify target PR number (auto-detected from current branch if omitted)
- `--description-only` : Update description only (don't change labels)
- `--labels-only` : Update labels only (don't change description)
- `--dry-run` : Display generated content only without actual updates
- `--lang <language>` : Specify language (ja, en)

### Basic Examples

```bash
# Auto-update PR for current branch
/pr-auto-update

# Update specific PR
/pr-auto-update --pr 1234

# Update description only
/pr-auto-update --description-only

# Confirm with dry run
/pr-auto-update --dry-run
```

## Feature Details

### Automatic PR Detection

Auto-detect corresponding PR from current branch:

```bash
# Search for PR from branch
gh pr list --head $(git branch --show-current) --json number,title,url
```

### Change Content Analysis

Collect and analyze the following information:

- **File Changes**: Added, deleted, and modified files
- **Code Analysis**: Changes in import statements, function definitions, class definitions
- **Tests**: Presence and content of test files
- **Documentation**: Updates to README, docs
- **Configuration**: Changes to package.json, pubspec.yaml, configuration files
- **CI/CD**: Changes to GitHub Actions, workflows

### Automatic Description Generation

#### Template Processing Priority

1. **Existing PR Description**: **Completely inherit** already written content
2. **Project Template**: Get structure from `.github/PULL_REQUEST_TEMPLATE.md`
3. **Default Template**: Fallback when above doesn't exist

#### Existing Content Preservation Rules

**Important**: Do not change existing content

- Preserve written sections
- Only fill empty sections
- Preserve functional comments (Copilot review rules, etc.)

#### Using Project Templates

```bash
# Analyze structure of .github/PULL_REQUEST_TEMPLATE.md
parse_template_structure() {
  local template_file="$1"
  
  if [ -f "$template_file" ]; then
    # Extract section structure
    grep -E '^##|^###' "$template_file"
    
    # Identify comment placeholders
    grep -E '<!--.*-->' "$template_file"
    
    # Completely inherit existing template structure
    cat "$template_file"
  fi
}
```

### Automatic Label Assignment

#### Label Retrieval Mechanism

**Priority Order**:

1. **`.github/labels.yml`**: Get from project-specific label definitions
2. **GitHub API**: Get existing labels with `gh api repos/{OWNER}/{REPO}/labels --jq '.[].name'`

#### Automatic Detection Rules

**File Pattern Based**:

- Documentation: `*.md`, `README`, `docs/` → Labels containing `documentation|docs|doc`
- Tests: `test`, `spec` → Labels containing `test|testing`
- CI/CD: `.github/`, `*.yml`, `Dockerfile` → Labels containing `ci|build|infra|ops`
- Dependencies: `package.json`, `pubspec.yaml`, `requirements.txt` → Labels containing `dependencies|deps`

**Change Content Based**:

- Bug fixes: `fix|bug|error|crash` → Labels containing `bug|fix`
- New features: `feat|feature|add|implement` → Labels containing `feature|enhancement|feat`
- Refactoring: `refactor|clean` → Labels containing `refactor|cleanup|clean`
- Performance: `performance|perf|optimize` → Labels containing `performance|perf`
- Security: `security|secure` → Labels containing `security`

#### Constraints

- **Maximum 3**: Upper limit on automatically selected label count
- **Existing Labels Only**: Creating new labels is prohibited  
- **Partial Match**: Determined by whether keywords are contained in label names

#### Practical Usage Examples

**When `.github/labels.yml` exists**:

```bash
# Auto-retrieve from label definitions
grep "^- name:" .github/labels.yml | sed "s/^- name: '\?\([^']*\)'\?/\1/"

# Example: Use project-specific label system
```

**When retrieving from GitHub API**:

```bash
# Get list of existing labels
gh api repos/{OWNER}/{REPO}/labels --jq '.[].name'

# Example: Use standard labels like bug, enhancement, documentation
```

### Execution Flow

```bash
#!/bin/bash

# 1. PR Detection/Retrieval
detect_pr() {
  if [ -n "$PR_NUMBER" ]; then
    echo $PR_NUMBER
  else
    gh pr list --head $(git branch --show-current) --json number --jq '.[0].number'
  fi
}

# 2. Change Content Analysis
analyze_changes() {
  local pr_number=$1
  
  # Get file changes
  gh pr diff $pr_number --name-only
  
  # Content analysis
  gh pr diff $pr_number | head -1000
}

# 3. Description Generation
generate_description() {
  local pr_number=$1
  local changes=$2
  
  # Get current PR description
  local current_body=$(gh pr view $pr_number --json body --jq -r .body)
  
  # Use existing content if available
  if [ -n "$current_body" ]; then
    echo "$current_body"
  else
    # Generate from template
    local template_file=".github/PULL_REQUEST_TEMPLATE.md"
    if [ -f "$template_file" ]; then
      generate_from_template "$(cat "$template_file")" "$changes"
    else
      generate_from_template "" "$changes"
    fi
  fi
}

# Generation from Template
generate_from_template() {
  local template="$1"
  local changes="$2"
  
  if [ -n "$template" ]; then
    # Use template as-is (preserve HTML comments)
    echo "$template"
  else
    # Generate with default format
    echo "## What does this change?"
    echo ""
    echo "$changes"
  fi
}

# 4. Label Determination
determine_labels() {
  local changes=$1
  local file_list=$2
  local pr_number=$3
  
  # Get available labels
  local available_labels=()
  if [ -f ".github/labels.yml" ]; then
    # Extract label names from labels.yml
    available_labels=($(grep "^- name:" .github/labels.yml | sed "s/^- name: '\?\([^']*\)'\?/\1/"))
  else
    # Get labels from GitHub API
    local repo_info=$(gh repo view --json owner,name)
    local owner=$(echo "$repo_info" | jq -r .owner.login)
    local repo=$(echo "$repo_info" | jq -r .name)
    available_labels=($(gh api "repos/$owner/$repo/labels" --jq '.[].name'))
  fi
  
  local suggested_labels=()
  
  # Generic pattern matching
  analyze_change_patterns "$file_list" "$changes" available_labels suggested_labels
  
  # Limit to maximum 3
  echo "${suggested_labels[@]:0:3}"
}

# Determine labels from change patterns
analyze_change_patterns() {
  local file_list="$1"
  local changes="$2"
  local -n available_ref=$3
  local -n suggested_ref=$4
  
  # Determination by file type
  if echo "$file_list" | grep -q "\.md$\|README\|docs/"; then
    add_matching_label "documentation\|docs\|doc" available_ref suggested_ref
  fi
  
  if echo "$file_list" | grep -q "test\|spec"; then
    add_matching_label "test\|testing" available_ref suggested_ref
  fi
  
  # Determination by change content
  if echo "$changes" | grep -iq "fix\|bug\|error\|crash"; then
    add_matching_label "bug\|fix" available_ref suggested_ref
  fi
  
  if echo "$changes" | grep -iq "feat\|feature\|add\|implement"; then
    add_matching_label "feature\|enhancement\|feat" available_ref suggested_ref
  fi
}

# Add matching labels
add_matching_label() {
  local pattern="$1"
  local -n available_ref=$2
  local -n suggested_ref=$3
  
  # Skip if already have 3
  if [ ${#suggested_ref[@]} -ge 3 ]; then
    return
  fi
  
  # Add first label matching pattern
  for available_label in "${available_ref[@]}"; do
    if echo "$available_label" | grep -iq "$pattern"; then
      # Duplicate check
      local already_exists=false
      for existing in "${suggested_ref[@]}"; do
        if [ "$existing" = "$available_label" ]; then
          already_exists=true
          break
        fi
      done
      
      if [ "$already_exists" = false ]; then
        suggested_ref+=("$available_label")
        return
      fi
    fi
  done
}

# Keep for compatibility with old functions
find_and_add_label() {
  add_matching_label "$@"
}

# 5. PR Update
update_pr() {
  local pr_number=$1
  local description="$2"
  local labels="$3"
  
  if [ "$DRY_RUN" = "true" ]; then
    echo "=== DRY RUN ==="
    echo "Description:"
    echo "$description"
    echo "Labels: $labels"
  else
    # Get repository information
    local repo_info=$(gh repo view --json owner,name)
    local owner=$(echo "$repo_info" | jq -r .owner.login)
    local repo=$(echo "$repo_info" | jq -r .name)
    
    # Update body using GitHub API (preserve HTML comments)
    # Properly handle JSON escaping
    local escaped_body=$(echo "$description" | jq -R -s .)
    gh api \
      --method PATCH \
      "/repos/$owner/$repo/pulls/$pr_number" \
      --field body="$description"
    
    # Labels work fine with regular gh command
    if [ -n "$labels" ]; then
      gh pr edit $pr_number --add-label "$labels"
    fi
  fi
}
```

## Configuration File (For Future Extensions)

`~/.claude/pr-auto-update.config`:

```json
{
  "language": "ja",
  "max_labels": 3
}
```

## Common Patterns

### Flutter Projects

```markdown
## What does this change?

{Feature name} has been implemented. Resolves user {issue}.

### Main Changes

- **UI Implementation**: Created new {screen name}
- **State Management**: Added Riverpod providers
- **API Integration**: Implemented GraphQL queries and mutations
- **Testing**: Added widget tests and unit tests

### Technical Specifications

- **Architecture**: {Used pattern}
- **Dependencies**: {Newly added packages}
- **Performance**: {Optimization details}
```

### Node.js Projects

```markdown
## What does this change?

{API name} endpoint has been implemented. Supports {use case}.

### Main Changes

- **API Implementation**: Created new {endpoint}
- **Validation**: Added request validation logic
- **Database**: Implemented operations on {table name}
- **Testing**: Added integration tests and unit tests

### Security

- **Authentication**: JWT token validation
- **Authorization**: Role-based access control
- **Input Validation**: SQL injection countermeasures
```

### CI/CD Improvements

```markdown
## What does this change?

Improved GitHub Actions workflow. Achieves {effect}.

### Improvements

- **Performance**: Reduced build time by {time}
- **Reliability**: Enhanced error handling
- **Security**: Improved secret management

### Technical Details

- **Parallelization**: Parallel execution of {job name}
- **Caching**: Optimized caching strategy for {cache target}
- **Monitoring**: Added monitoring for {metrics}
```

## Important Notes

1. **Complete Preservation of Existing Content**:
   - **Do not change even a single character** of already written content
   - Only fill empty comment sections and placeholders
   - Respect content intentionally written by users

2. **Template Priority Order**:
   - Existing PR description > `.github/PULL_REQUEST_TEMPLATE.md` > Default
   - Completely inherit project-specific template structure

3. **Label Constraints**:
   - Use `.github/labels.yml` if it exists
   - Get existing labels from GitHub API if it doesn't exist
   - Creating new labels is prohibited
   - Maximum 3 automatically selected

4. **Safe Updates**:
   - Recommend pre-confirmation with `--dry-run`
   - Display warnings for changes containing sensitive information
   - Save original description as backup

5. **Consistency Maintenance**:
   - Match existing PR style of the project
   - Unify language (Japanese/English)
   - Inherit labeling conventions

## Troubleshooting

### Common Issues

1. **PR not found**: Check association between branch name and PR
2. **Permission error**: Check GitHub CLI authentication status
3. **Cannot set labels**: Check repository permissions
4. **HTML comments are escaped**: Due to GitHub CLI specification, `<!-- -->` converts to `&lt;!-- --&gt;`

### GitHub CLI HTML Comment Escaping Issue

**Important**: GitHub CLI (`gh pr edit`) automatically escapes HTML comments. Also, invalid strings like `EOF < /dev/null` may be mixed in through shell redirect processing.

#### Fundamental Solutions

1. **Use GitHub API --field option**: Use `--field` for proper escape processing
2. **Simplify shell processing**: Avoid complex redirect and pipe processing
3. **Simplify template processing**: Abolish HTML comment removal processing and preserve completely
4. **Proper JSON escape processing**: Handle special characters correctly

### Debug Options

```bash
# Detailed log output (to be added during implementation)
/pr-auto-update --verbose
```
