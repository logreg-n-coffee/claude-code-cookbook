## Commit Message

Generate appropriate commit messages from staged changes (git diff --staged). Does not execute git commands, only generates messages and copies to clipboard.

### Usage

```bash
/commit-message [options]
```

### Options

- `--format <format>` : Specify message format (conventional, gitmoji, angular)
- `--lang <language>` : Force specify message language (en, ja)
- `--breaking` : Detect and include Breaking Changes

### Basic Examples

```bash
# Generate message from staged changes (automatic language detection)
# Main candidate is automatically copied to clipboard
/commit-message

# Force specify language
/commit-message --lang ja
/commit-message --lang en

# Detect Breaking Changes
/commit-message --breaking
```

### Prerequisites

**Important**: This command only analyzes staged changes. You need to stage changes with `git add` beforehand.

```bash
# Warning displayed if nothing is staged
$ /commit-message
No staged changes found. Please run git add first.
```

### Automatic Clipboard Feature

The generated main candidate is automatically copied to the clipboard in the complete `git commit -m "message"` format. You can paste it directly in the terminal and execute.

**Implementation Notes**:

- When passing commit command to `pbcopy`, execute in a separate process from message output
- Use `printf` instead of `echo` to avoid trailing newlines

### Automatic Project Convention Detection

**Important**: When project-specific conventions exist, they take priority.

#### CommitLint Configuration Detection

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
# Search for configuration files
find . -name "commitlint.config.*" -o -name ".commitlintrc.*" | head -1
```

#### Custom Type Detection

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

#### Language Setting Detection

```javascript
// When project uses Japanese messages
export default {
  rules: {
    'subject-case': [0],  // Disabled for Japanese support
    'subject-max-length': [2, 'always', 72]  // Adjusted character limit for Japanese
  }
}
```

#### Existing Commit History Analysis

```bash
# Learn usage patterns from recent commits
git log --oneline -50 --pretty=format:"%s"

# Type usage statistics
git log --oneline -100 --pretty=format:"%s" | \
grep -oE '^[a-z]+(\([^)]+\))?' | \
sort | uniq -c | sort -nr
```

### Automatic Language Detection

Automatically switches between Japanese/English based on the following conditions:

1. **CommitLint configuration** language settings
2. **git log analysis** automatic detection
3. **Project file** language settings
4. **Changed file** comment and string analysis

Default is English. Generates in Japanese when detected as Japanese project.

### Message Formats

#### Conventional Commits (Default)

```
<type>: <description>
```

**Important**: Always generates single-line commit messages. Does not generate multi-line messages.

**Note**: When project has custom conventions, those take priority.

### Standard Types

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

### Output Example (English Project)

```bash
$ /commit-message

📝 Commit Message Suggestions
━━━━━━━━━━━━━━━━━━━━━━━━━

✨ Main Candidate:
feat: implement JWT-based authentication system

📋 Alternatives:
1. feat: add user authentication with JWT tokens
2. fix: resolve token validation error in auth middleware
3. refactor: extract auth logic into separate module

✅ `git commit -m "feat: implement JWT-based authentication system"` copied to clipboard
```

**Implementation Example (Corrected)**:

```bash
# Copy commit command to clipboard first (no newline)
printf 'git commit -m "%s"' "$COMMIT_MESSAGE" | pbcopy

# Then display message
cat << EOF
📝 Commit Message Suggestions
━━━━━━━━━━━━━━━━━━━━━━━━━

✨ Main Candidate:
$COMMIT_MESSAGE

📋 Alternatives:
1. ...
2. ...
3. ...

✅ \`git commit -m "$COMMIT_MESSAGE"\` copied to clipboard
EOF
```

### Output Example (Japanese Project)

```bash
$ /commit-message

📝 コミットメッセージ提案
━━━━━━━━━━━━━━━━━━━━━━━━━

✨ メイン候補:
feat: JWT 認証システムを実装

📋 代替案:
1. feat: JWT トークンによるユーザー認証を追加
2. fix: 認証ミドルウェアのトークン検証エラーを解決
3. docs: 認証ロジックを別モジュールに分離

✅ `git commit -m "feat: JWT 認証システムを実装"` をクリップボードにコピーしました
```

### Operation Overview

1. **Analysis**: Analyze `git diff --staged` content
2. **Generation**: Generate appropriate commit messages
3. **Copy**: Automatically copy main candidate to clipboard

**Note**: This command does not execute git add or git commit. Only generates commit messages and copies to clipboard.

### Smart Features

#### Change Content Auto-Classification (Staged Files Only)

- New file additions → `feat`
- Error fix patterns → `fix`
- Test files only → `test`
- Configuration file changes → `chore`
- README/docs updates → `docs`

#### Project Convention Auto-Detection

- `.gitmessage` file
- Conventions in `CONTRIBUTING.md`
- Past commit history patterns

#### Language Detection Details (Staged Changes Only)

```bash
# Detection Criteria (Priority Order)
1. Detect language from git diff --staged content
2. Analyze comments in staged files
3. Analyze language in git log --oneline -20
4. Project main language settings
```

#### Staging Analysis Details

Information used for analysis (read-only):

- `git diff --staged --name-only` - Changed file list
- `git diff --staged` - Actual change content
- `git status --porcelain` - File status

### Breaking Change Detection

When there are API breaking changes:

**English**:

```bash
feat!: change user API response format

BREAKING CHANGE: user response now includes additional metadata
```

Or

```bash
feat(api)!: change authentication flow
```

**Japanese**:

```bash
feat!: ユーザー API レスポンス形式を変更

BREAKING CHANGE: レスポンスに追加のメタデータが含まれるようになりました
```

Or

```bash
feat(api)!: 認証フローを変更
```

### Best Practices

1. **Match Project**: Follow existing commit language
2. **Conciseness**: Clear within 50 characters
3. **Consistency**: Don't mix (if English, unify in English)
4. **OSS**: English recommended for open source
5. **Single Line**: Always single-line commit messages (supplement detailed explanations in PR if needed)

### Common Patterns

**English**:

```
feat: add user registration endpoint
fix: resolve memory leak in cache manager
docs: update API documentation
```

**Japanese**:

```
feat: ユーザー登録エンドポイントを追加
fix: キャッシュマネージャーのメモリリークを解決
docs: API ドキュメントを更新
```

### Integration with Claude

```bash
# Use with staged changes
git add -p  # Interactive staging
/commit-message
"Generate optimal commit message"

# Stage and analyze specific files only
git add src/auth/*.js
/commit-message --lang en
"Generate appropriate message for authentication-related changes"

# Detect and handle Breaking Changes
git add -A
/commit-message --breaking
"Mark appropriately if there are breaking changes"
```

### Important Notes

- **Prerequisites**: Changes must be staged with `git add` beforehand
- **Limitations**: Unstaged changes are not analyzed
- **Recommendations**: Check project's existing commit conventions beforehand
