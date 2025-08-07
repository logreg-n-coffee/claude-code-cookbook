## Semantic Commit

Divide large changes into meaningful minimal units and commit sequentially with semantic commit messages. Uses only standard git commands without external tool dependencies.

### Usage

```bash
/semantic-commit [options]
```

### Options

- `--dry-run` : Display only proposed commit divisions without actual commits
- `--lang <language>` : Force specify commit message language (en, ja)
- `--max-commits <number>` : Specify maximum number of commits (default: 10)

### Basic Examples

```bash
# Analyze current changes and commit in logical units
/semantic-commit

# Check division proposal only (no actual commits)
/semantic-commit --dry-run

# Generate commit messages in English
/semantic-commit --lang en

# Divide into maximum 5 commits
/semantic-commit --max-commits 5
```

### Operation Flow

1. **Change Analysis**: Get all changes with `git diff HEAD`
2. **File Classification**: Logically group changed files
3. **Commit Proposal**: Generate semantic commit messages for each group
4. **Sequential Execution**: After user confirmation, commit each group sequentially

### Core Change Division Functionality

#### Detection of "Large Changes"

Detected as large changes under the following conditions:

1. **Number of changed files**: 5 or more files changed
2. **Number of changed lines**: 100 or more lines changed
3. **Multiple features**: Changes spanning 2 or more functional areas
4. **Mixed patterns**: feat + fix + docs mixed together

```bash
# Change scale analysis
CHANGED_FILES=$(git diff HEAD --name-only | wc -l)
CHANGED_LINES=$(git diff HEAD --stat | tail -1 | grep -o '[0-9]\+ insertions\|[0-9]\+ deletions' | awk '{sum+=$1} END {print sum}')

if [ $CHANGED_FILES -ge 5 ] || [ $CHANGED_LINES -ge 100 ]; then
  echo "Large change detected: Division recommended"
fi
```

#### Division Strategy into "Meaningful Minimal Units"

##### 1. Division by Functional Boundaries

```bash
# Identify functional units from directory structure
git diff HEAD --name-only | cut -d'/' -f1-2 | sort | uniq
# → src/auth, src/api, components/ui, etc.
```

##### 2. Separation by Change Type

```bash
# New files vs existing file modifications
git diff HEAD --name-status | grep '^A' # New files
git diff HEAD --name-status | grep '^M' # Modified files
git diff HEAD --name-status | grep '^D' # Deleted files
```

##### 3. Dependency Analysis

```bash
# Detect import relationship changes
git diff HEAD | grep -E '^[+-].*import|^[+-].*require' | \
cut -d' ' -f2- | sort | uniq
```

#### Detailed Analysis by File Unit

```bash
# Get list of changed files
git diff HEAD --name-only

# Analyze changes in each file individually
git diff HEAD -- <file>

# Determine file change type
git diff HEAD --name-status | while read status file; do
  case $status in
    A) echo "$file: New file created" ;;
    M) echo "$file: Modified" ;;
    D) echo "$file: Deleted" ;;
    R*) echo "$file: Renamed" ;;
  esac
done
```

#### Logical Grouping Criteria

1. **Functional Units**: Files related to the same function
   - Files under `src/auth/` → Authentication function
   - Files under `components/` → UI components

2. **Change Type**: Same type of changes
   - Test files only → `test:`
   - Documentation only → `docs:`
   - Configuration files only → `chore:`

3. **Dependencies**: Mutually related files
   - Model + Migration
   - Component + Style

4. **Change Scale**: Maintaining appropriate commit size
   - 10 files or less per commit
   - Group files with high relevance

### Output Example

```bash
$ /semantic-commit

Analyzing changes...
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Detected changes:
• src/auth/login.ts (Modified)
• src/auth/register.ts (New)
• src/auth/types.ts (Modified)
• tests/auth.test.ts (New)
• docs/authentication.md (New)

Proposed commit division:

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Commit 1/3
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Message: feat: implement user registration and login system
Included files:
  • src/auth/login.ts
  • src/auth/register.ts  
  • src/auth/types.ts

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Commit 2/3
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Message: test: add comprehensive tests for authentication system
Included files:
  • tests/auth.test.ts

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Commit 3/3
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Message: docs: add authentication system documentation
Included files:
  • docs/authentication.md

Execute commits with this division plan? (y/n/edit): 
```

### Runtime Options

- `y` : Execute with proposed commit division
- `n` : Cancel
- `edit` : Edit commit messages individually
- `merge <number 1> <number 2>` : Merge specified commits
- `split <number>` : Further divide specified commit

### Dry Run Mode

```bash
$ /semantic-commit --dry-run

Analyzing changes... (DRY RUN)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

[Commit division proposal display]

ℹ️  DRY RUN mode: Actual commits will not be executed
💡 To execute, run again without the --dry-run option
```

### Smart Analysis Features

#### 1. Understanding Project Structure

- Determine project type from `package.json`, `Cargo.toml`, `pom.xml`, etc.
- Infer functional units from folder structure

#### 2. Change Pattern Recognition

```bash
# Bug fix pattern detection
- Keywords like "fix", "bug", "error"
- Addition of exception handling
- Conditional branch fixes

# New feature pattern detection  
- New file creation
- New method addition
- API endpoint addition
```

#### 3. Dependency Analysis

- Import statement changes
- Type definition additions/modifications
- Relationship with configuration files

### Technical Implementation

#### Sequential Commit Implementation Using Standard Git Commands

##### 1. Preprocessing: Save Current State

```bash
# Reset unstaged changes temporarily
git reset HEAD
git status --porcelain > /tmp/original_state.txt

# Check working branch
CURRENT_BRANCH=$(git branch --show-current)
echo "Working branch: $CURRENT_BRANCH"
```

##### 2. Execute Sequential Commits by Group

```bash
# Load division plan
while IFS= read -r commit_plan; do
  group_num=$(echo "$commit_plan" | cut -d':' -f1)
  files=$(echo "$commit_plan" | cut -d':' -f2- | tr ' ' '\n')
  
  echo "=== Executing commit $group_num ==="
  
  # Stage only relevant files
  echo "$files" | while read file; do
    if [ -f "$file" ]; then
      git add "$file"
      echo "Staging: $file"
    fi
  done
  
  # Check staging status
  staged_files=$(git diff --staged --name-only)
  if [ -z "$staged_files" ]; then
    echo "Warning: No files staged"
    continue
  fi
  
  # Generate commit message (LLM analysis)
  commit_msg=$(generate_commit_message_for_staged_files)
  
  # User confirmation
  echo "Proposed commit message: $commit_msg"
  echo "Staged files:"
  echo "$staged_files"
  read -p "Execute this commit? (y/n): " confirm
  
  if [ "$confirm" = "y" ]; then
    # Execute commit
    git commit -m "$commit_msg"
    echo "✅ Commit $group_num completed"
  else
    # Cancel staging
    git reset HEAD
    echo "❌ Commit $group_num skipped"
  fi
  
done < /tmp/commit_plan.txt
```

##### 3. Error Handling and Rollback

```bash
# Handle pre-commit hook failures
commit_with_retry() {
  local commit_msg="$1"
  local max_retries=2
  local retry_count=0
  
  while [ $retry_count -lt $max_retries ]; do
    if git commit -m "$commit_msg"; then
      echo "✅ Commit successful"
      return 0
    else
      echo "❌ Commit failed (attempt $((retry_count + 1))/$max_retries)"
      
      # Incorporate automatic fixes by pre-commit hooks
      if git diff --staged --quiet; then
        echo "Changes were automatically fixed by pre-commit hooks"
        git add -u
      fi
      
      retry_count=$((retry_count + 1))
    fi
  done
  
  echo "❌ Commit failed. Please check manually."
  return 1
}

# Recovery from interruption
resume_from_failure() {
  echo "Interrupted commit process detected"
  echo "Current staging status:"
  git status --porcelain
  
  read -p "Continue processing? (y/n): " resume
  if [ "$resume" = "y" ]; then
    # Resume from last commit position
    last_commit=$(git log --oneline -1 --pretty=format:"%s")
    echo "Last commit: $last_commit"
  else
    # Complete reset
    git reset HEAD
    echo "Process has been reset"
  fi
}
```

##### 4. Post-completion Verification

```bash
# Check if all changes have been committed
remaining_changes=$(git status --porcelain | wc -l)
if [ $remaining_changes -eq 0 ]; then
  echo "✅ All changes have been committed"
else
  echo "⚠️  Uncommitted changes remain:"
  git status --short
fi

# Display commit history
echo "Created commits:"
git log --oneline -n 10 --graph
```

##### 5. Suppress Automatic Push

```bash
# Note: Do not perform automatic push
echo "📝 Note: Automatic push is not executed"
echo "Push with the following command if needed:"
echo "  git push origin $CURRENT_BRANCH"
```

#### Detailed Division Algorithm

##### Step 1: Initial Analysis

```bash
# Get and classify all changed files
git diff HEAD --name-status | while read status file; do
  echo "$status:$file"
done > /tmp/changes.txt

# Change statistics by functional directory
git diff HEAD --name-only | cut -d'/' -f1-2 | sort | uniq -c
```

##### Step 2: Initial Grouping by Functional Boundaries

```bash
# Directory-based grouping
GROUPS=$(git diff HEAD --name-only | cut -d'/' -f1-2 | sort | uniq)
for group in $GROUPS; do
  echo "=== Group: $group ==="
  git diff HEAD --name-only | grep "^$group" | head -10
done
```

##### Step 3: Change Content Similarity Analysis

```bash
# Analyze change type for each file
git diff HEAD --name-only | while read file; do
  # Detect addition of new functions/classes
  NEW_FUNCTIONS=$(git diff HEAD -- "$file" | grep -c '^+.*function\|^+.*class\|^+.*def ')
  
  # Detect bug fix patterns
  BUG_FIXES=$(git diff HEAD -- "$file" | grep -c '^+.*fix\|^+.*bug\|^-.*error')
  
  # Determine if it's a test file
  if [[ "$file" =~ test|spec ]]; then
    echo "$file: TEST"
  elif [ $NEW_FUNCTIONS -gt 0 ]; then
    echo "$file: FEAT"
  elif [ $BUG_FIXES -gt 0 ]; then
    echo "$file: FIX"
  else
    echo "$file: REFACTOR"
  fi
done
```

##### Step 4: Adjustment by Dependencies

```bash
# Import relationship analysis
git diff HEAD | grep -E '^[+-].*import|^[+-].*from.*import' | \
while read line; do
  echo "$line" | sed 's/^[+-]//' | awk '{print $2}'
done | sort | uniq > /tmp/imports.txt

# Related file grouping
git diff HEAD --name-only | while read file; do
  basename=$(basename "$file" .js .ts .py)
  related=$(git diff HEAD --name-only | grep "$basename" | grep -v "^$file$")
  if [ -n "$related" ]; then
    echo "Related file group: $file <-> $related"
  fi
done
```

##### Step 5: Commit Size Optimization

```bash
# Group size adjustment
MAX_FILES_PER_COMMIT=8
current_group=1
file_count=0

git diff HEAD --name-only | while read file; do
  if [ $file_count -ge $MAX_FILES_PER_COMMIT ]; then
    current_group=$((current_group + 1))
    file_count=0
  fi
  echo "Commit $current_group: $file"
  file_count=$((file_count + 1))
done
```

##### Step 6: Final Group Decision

```bash
# Split result verification
for group in $(seq 1 $current_group); do
  files=$(grep "Commit $group:" /tmp/commit_plan.txt | cut -d':' -f2-)
  lines=$(echo "$files" | xargs git diff HEAD -- | wc -l)
  echo "Commit $group: $(echo "$files" | wc -w) files, $lines line changes"
done
```

### Conventional Commits Compliance

#### Basic Format

```
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

#### Standard Types

**Required Types**:

- `feat`: New features (user-visible feature additions)
- `fix`: Bug fixes

**Optional Types**:

- `build`: Changes to build system or external dependencies
- `chore`: Other changes (not affecting releases)
- `ci`: Changes to CI configuration files or scripts
- `docs`: Documentation-only changes
- `style`: Changes that don't affect code meaning (whitespace, formatting, semicolons, etc.)
- `refactor`: Code changes that neither fix bugs nor add features
- `perf`: Performance improvements
- `test`: Adding or correcting tests

#### Scope (Optional)

Indicates the scope of impact of changes:

```
feat(api): add user authentication endpoint
fix(ui): resolve button alignment issue
docs(readme): update installation instructions
```

#### Breaking Change

When there are API breaking changes:

```
feat!: change user API response format

BREAKING CHANGE: user response now includes additional metadata
```

Or

```
feat(api)!: change authentication flow
```

#### Automatic Project Convention Detection

**Important**: When project-specific conventions exist, they take priority.

##### CommitLint Configuration Detection

Auto-detect settings from the following files:

- `commitlint.config.js`
- `commitlint.config.mjs`
- `commitlint.config.cjs`
- `commitlint.config.ts`
- `.commitlintrc.js`
- `.commitlintrc.json`
- `.commitlintrc.yml`
- `.commitlintrc.yaml`
- `package.json` `commitlint` section

```bash
# Configuration file example verification
cat commitlint.config.mjs
cat .commitlintrc.json
grep -A 10 '"commitlint"' package.json
```

##### Custom Type Detection

Project-specific type examples:

```javascript
// commitlint.config.mjs
export default {
  extends: ['@commitlint/config-conventional'],
  rules: {
    'type-enum': [
      2,
      'always',
      [
        'feat', 'fix', 'docs', 'style', 'refactor', 'test', 'chore',
        'wip',      // Work in progress
        'hotfix',   // Emergency fix
        'release',  // Release
        'deps',     // Dependency updates
        'config'    // Configuration changes
      ]
    ]
  }
}
```

##### Language Setting Detection

```javascript
// When project uses Japanese messages
export default {
  rules: {
    'subject-case': [0],  // Disabled for Japanese support
    'subject-max-length': [2, 'always', 72]  // Adjusted character limit for Japanese
  }
}
```

#### Automatic Analysis Flow

1. **Configuration File Search**

   ```bash
   find . -name "commitlint.config.*" -o -name ".commitlintrc.*" | head -1
   ```

2. **Existing Commit Analysis**

   ```bash
   git log --oneline -50 --pretty=format:"%s"
   ```

3. **Type Usage Statistics**

   ```bash
   git log --oneline -100 --pretty=format:"%s" | \
   grep -oE '^[a-z]+(\([^)]+\))?' | \
   sort | uniq -c | sort -nr
   ```

#### Project Convention Examples

##### Angular Style

```
feat(scope): add new feature
fix(scope): fix bug
docs(scope): update documentation
```

##### Gitmoji Combined Style

```
✨ feat: add user registration
🐛 fix: resolve login issue
📚 docs: update API docs
```

##### Japanese Projects

```
feat: Add user registration functionality
fix: Fix login process bug
docs: Update API documentation
```

### Language Detection

Language detection logic completed within this command:

1. **CommitLint Configuration** language setting verification

   ```bash
   # Detect Japanese if subject-case rule is disabled
   grep -E '"subject-case".*\[0\]|subject-case.*0' commitlint.config.*
   ```

2. **git log analysis** automatic detection

   ```bash
   # Analyze language of recent 20 commits
   git log --oneline -20 --pretty=format:"%s" | \
   grep -E '^[あ-ん]|[ア-ン]|[一-龯]' | wc -l
   # Japanese mode if 50% or more are Japanese
   ```

3. **Project file** language settings

   ```bash
   # README.md language verification
   head -10 README.md | grep -E '^[あ-ん]|[ア-ン]|[一-龯]' | wc -l
   
   # package.json description verification
   grep -E '"description".*[あ-ん]|[ア-ン]|[一-龯]' package.json
   ```

4. **Comment and string analysis in changed files**

   ```bash
   # Verify comment language in changed files
   git diff HEAD | grep -E '^[+-].*//.*[あ-ん]|[ア-ン]|[一-龯]' | wc -l
   ```

#### Decision Algorithm

```bash
# Language detection score calculation
JAPANESE_SCORE=0

# 1. CommitLint configuration (+3 points)
if grep -q '"subject-case".*\[0\]' commitlint.config.* 2>/dev/null; then
  JAPANESE_SCORE=$((JAPANESE_SCORE + 3))
fi

# 2. git log analysis (max +2 points)
JAPANESE_COMMITS=$(git log --oneline -20 --pretty=format:"%s" | \
  grep -cE '[あ-ん]|[ア-ン]|[一-龯]' 2>/dev/null || echo 0)
if [ $JAPANESE_COMMITS -gt 10 ]; then
  JAPANESE_SCORE=$((JAPANESE_SCORE + 2))
elif [ $JAPANESE_COMMITS -gt 5 ]; then
  JAPANESE_SCORE=$((JAPANESE_SCORE + 1))
fi

# 3. README.md verification (+1 point)
if head -5 README.md 2>/dev/null | grep -qE '[あ-ん]|[ア-ン]|[一-龯]'; then
  JAPANESE_SCORE=$((JAPANESE_SCORE + 1))
fi

# 4. Changed file content verification (+1 point)
if git diff HEAD 2>/dev/null | grep -qE '^[+-].*[あ-ん]|[ア-ン]|[一-龯]'; then
  JAPANESE_SCORE=$((JAPANESE_SCORE + 1))
fi

# Decision: Japanese mode if 3 or more points
if [ $JAPANESE_SCORE -ge 3 ]; then
  LANGUAGE="ja"
else
  LANGUAGE="en"
fi
```

### Automatic Configuration File Loading

#### Runtime Behavior

Configuration verification follows this order during command execution:

1. **CommitLint configuration file search**

   ```bash
   # Search in the following order and use the first found file
   commitlint.config.mjs
   commitlint.config.js  
   commitlint.config.cjs
   commitlint.config.ts
   .commitlintrc.js
   .commitlintrc.json
   .commitlintrc.yml
   .commitlintrc.yaml
   package.json (commitlint section)
   ```

2. **Configuration content analysis**
   - Extract list of available types
   - Check for scope restrictions
   - Get message length limits
   - Verify language settings

3. **Existing commit history analysis**

   ```bash
   # Learn usage patterns from recent commits
   git log --oneline -100 --pretty=format:"%s" | \
   head -20
   ```

#### Configuration Example Analysis

**Standard commitlint.config.mjs**:

```javascript
export default {
  extends: ['@commitlint/config-conventional'],
  rules: {
    'type-enum': [
      2,
      'always',
      ['feat', 'fix', 'docs', 'style', 'refactor', 'perf', 'test', 'chore']
    ],
    'scope-enum': [
      2,
      'always',
      ['api', 'ui', 'core', 'auth', 'db']
    ]
  }
}
```

**Japanese language support configuration**:

```javascript
export default {
  extends: ['@commitlint/config-conventional'],
  rules: {
    'subject-case': [0],  // Disabled for Japanese language
    'subject-max-length': [2, 'always', 72],
    'type-enum': [
      2,
      'always',
      ['feat', 'fix', 'docs', 'style', 'refactor', 'test', 'chore']
    ]
  }
}
```

**Configuration with custom types**:

```javascript
export default {
  extends: ['@commitlint/config-conventional'],
  rules: {
    'type-enum': [
      2,
      'always',
      [
        'feat', 'fix', 'docs', 'style', 'refactor', 'test', 'chore',
        'wip',      // Work in Progress
        'hotfix',   // Emergency fix
        'release',  // Release preparation
        'deps',     // Dependency updates
        'config'    // Configuration changes
      ]
    ]
  }
}
}
```

#### Fallback Behavior

When configuration file is not found:

1. **Automatic inference through git log analysis**

   ```bash
   # Extract types from recent 100 commits
   git log --oneline -100 --pretty=format:"%s" | \
   grep -oE '^[a-z]+(\([^)]+\))?' | \
   sort | uniq -c | sort -nr
   ```

2. **Use Conventional Commits standard as default**

   ```
   feat, fix, docs, style, refactor, perf, test, chore, build, ci
   ```

3. **Language detection**
   - Japanese commits 50% or more → Japanese mode
   - Otherwise → English mode

### Prerequisites

- Execute within Git repository
- Uncommitted changes must exist
- Staged changes will be temporarily reset

### Important Notes

- **No automatic push**: Manual execution of `git push` required after commit
- **No branch creation**: Commits to current branch
- **Backup recommended**: Use `git stash` for backup before important changes

### Project Convention Priority

Priority during commit message generation:

1. **CommitLint configuration** (highest priority)
   - Configuration in `commitlint.config.*` files
   - Custom type and scope restrictions
   - Message length and case restrictions

2. **Existing commit history** (2nd priority)
   - Statistics of actually used types
   - Message language (Japanese/English)
   - Scope usage patterns

3. **Project type** (3rd priority)
   - `package.json` → Node.js project
   - `Cargo.toml` → Rust project  
   - `pom.xml` → Java project

4. **Conventional Commits standard** (fallback)
   - Standard behavior when configuration not found

#### Convention Detection Examples

**Automatic scope detection in Monorepo**:

```bash
# Infer scope from packages/ folder
ls packages/ | head -10
# → Propose api, ui, core, auth, etc. as scope
```

**Framework-specific conventions**:

```javascript
// For Angular projects
{
  'scope-enum': [2, 'always', [
    'animations', 'common', 'core', 'forms', 'http', 'platform-browser',
    'platform-server', 'router', 'service-worker', 'upgrade'
  ]]
}

// For React projects  
{
  'scope-enum': [2, 'always', [
    'components', 'hooks', 'utils', 'types', 'styles', 'api'
  ]]
}
```

**Company and team-specific conventions**:

```javascript
// Common pattern seen in Japanese companies
{
  'type-enum': [2, 'always', [
    'feat', 'fix', 'docs', 'style', 'refactor', 'test', 'chore',
    'wip',      // Work in progress (for pull requests)
    'hotfix',   // Emergency fix
    'release'   // Release preparation
  ]],
  'subject-case': [0],  // Japanese language support
  'subject-max-length': [2, 'always', 72]  // Set longer for Japanese
}
```

### Best Practices

1. **Respect project conventions**: Follow existing settings and patterns
2. **Small change units**: One commit for one logical change
3. **Clear messages**: Make it clear what was changed
4. **Emphasize relevance**: Group functionally related files
5. **Separate tests**: Test files in separate commits
6. **Utilize configuration files**: Introduce CommitLint to unify conventions across the team

### Actual Split Examples (Before/After)

#### Example 1: Large-scale authentication system addition

**Before (one massive commit):**

```bash
# Changed files (15 files, 850 line changes)
src/auth/login.js          # New file
src/auth/register.js       # New file  
src/auth/password.js       # New file
src/auth/types.js          # New file
src/api/auth-routes.js     # New file
src/middleware/auth.js     # New file
src/database/migrations/001_users.sql  # New file
src/database/models/user.js            # New file
tests/auth/login.test.js   # New file
tests/auth/register.test.js # New file
tests/api/auth-routes.test.js # New file
docs/authentication.md    # New file
package.json              # Dependencies added
README.md                 # Usage added
.env.example             # Environment variable examples added

# Traditional problematic commit
feat: implement complete user authentication system with login, registration, password reset, API routes, database models, tests and documentation
```

**After (split into 5 meaningful commits):**

```bash
# Commit 1: Database foundation
feat(db): add user model and authentication schema

Included files:
- src/database/migrations/001_users.sql
- src/database/models/user.js
- src/auth/types.js

Reason: Database structure is the foundation for other features, so commit first

# Commit 2: Authentication logic
feat(auth): implement core authentication functionality  

Included files:
- src/auth/login.js
- src/auth/register.js
- src/auth/password.js
- src/middleware/auth.js

Reason: Batch commit of core business logic for authentication

# Commit 3: API endpoints
feat(api): add authentication API routes

Included files:
- src/api/auth-routes.js

Reason: API layer depends on authentication logic, so commit later

# Commit 4: Comprehensive tests
test(auth): add comprehensive authentication tests

Included files:
- tests/auth/login.test.js
- tests/auth/register.test.js  
- tests/api/auth-routes.test.js

Reason: Add tests in batch after implementation completion

# Commit 5: Configuration and documentation
docs(auth): add authentication documentation and configuration

Included files:
- docs/authentication.md
- package.json
- README.md
- .env.example

Reason: Batch commit documentation and configuration at the end
```

#### Example 2: Mixed bug fixes and refactoring

**Before (mixed problematic commit):**

```bash
# Changed files (8 files, 320 line changes)
src/user/service.js       # Bug fix + refactoring
src/user/validator.js     # New file (refactoring)
src/auth/middleware.js    # Bug fix
src/api/user-routes.js    # Bug fix + error handling improvement
tests/user.test.js        # Test addition
tests/auth.test.js        # Bug fix test addition
docs/user-api.md          # Documentation update
package.json              # Dependency update

# Problematic commit
fix: resolve user validation bugs and refactor validation logic with improved error handling
```

**After (split into 3 commits by type):**

```bash
# Commit 1: Emergency bug fixes
fix: resolve user validation and authentication bugs

Included files:
- src/user/service.js (bug fix parts only)
- src/auth/middleware.js
- tests/auth.test.js (bug fix tests only)

Reason: Bugs affecting production environment have top priority

# Commit 2: Validation logic refactoring  
refactor: extract and improve user validation logic

Included files:
- src/user/service.js (refactoring parts)
- src/user/validator.js
- src/api/user-routes.js
- tests/user.test.js

Reason: Structural improvements batched by functional unit

# Commit 3: Documentation and dependency updates
chore: update documentation and dependencies

Included files:
- docs/user-api.md
- package.json

Reason: Development environment maintenance batched at the end
```

#### Example 3: Simultaneous multi-feature development

**Before (massive cross-functional commit):**

```bash
# Changed files (12 files, 600 line changes)
src/user/profile.js       # New feature A
src/user/avatar.js        # New feature A  
src/notification/email.js # New feature B
src/notification/sms.js   # New feature B
src/api/profile-routes.js # API for new feature A
src/api/notification-routes.js # API for new feature B
src/dashboard/widgets.js  # New feature C
src/dashboard/charts.js   # New feature C
tests/profile.test.js     # Tests for new feature A
tests/notification.test.js # Tests for new feature B  
tests/dashboard.test.js   # Tests for new feature C
package.json              # Dependencies for all features

# Problematic commit  
feat: add user profile management, notification system and dashboard widgets
```

**After (split into 4 commits by feature):**

```bash
# Commit 1: User profile feature
feat(profile): add user profile management

Included files:
- src/user/profile.js
- src/user/avatar.js
- src/api/profile-routes.js
- tests/profile.test.js

Reason: Profile feature is an independent functional unit

# Commit 2: Notification system
feat(notification): implement email and SMS notifications

Included files:
- src/notification/email.js
- src/notification/sms.js  
- src/api/notification-routes.js
- tests/notification.test.js

Reason: Notification feature is an independent functional unit

# Commit 3: Dashboard widgets
feat(dashboard): add interactive widgets and charts

Included files:
- src/dashboard/widgets.js
- src/dashboard/charts.js
- tests/dashboard.test.js

Reason: Dashboard feature is an independent functional unit

# Commit 4: Dependencies and infrastructure updates
chore: update dependencies for new features

Included files:
- package.json

Reason: Common dependency updates batched at the end
```

### Split Effect Comparison

| Item | Before (massive commit) | After (proper split) |
|------|---------------------|-------------------|
| **Reviewability** | ❌ Very difficult | ✅ Each commit is small and reviewable |
| **Bug tracking** | ❌ Difficult to identify problem areas | ✅ Instantly identify problematic commits |
| **Revert** | ❌ Need to revert everything | ✅ Pinpoint revert of only problem parts |
| **Parallel development** | ❌ Prone to conflicts | ✅ Easy merging by feature |
| **Deployment** | ❌ Batch deployment of all features | ✅ Gradual deployment possible |

### Troubleshooting

#### When commit fails

- Check pre-commit hooks
- Resolve dependencies
- Retry with individual files

#### When split is inappropriate

- Adjust with `--max-commits` option
- Use manual `edit` mode
- Re-run with finer granularity
