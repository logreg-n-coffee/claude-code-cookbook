## PR Create

Achieves efficient Pull Request workflow with automatic PR creation based on Git change analysis.

### Usage

```bash
# Automatic PR creation through change analysis
git add . && git commit -m "feat: implement user authentication feature"
"Please analyze the changes and create a Draft PR with appropriate description and labels"

# Update while preserving existing template
cp .github/PULL_REQUEST_TEMPLATE.md pr_body.md
"Please completely preserve the template structure and supplement the change content"

# Gradual quality improvement
gh pr ready
"After quality check completion, please change to Ready for Review"
```

### Basic Examples

```bash
# 1. Branch creation and commit
git checkout main && git pull
git checkout -b feat-user-profile
git add . && git commit -m "feat: implement user profile feature"
git push -u origin feat-user-profile

# 2. PR creation
"Please create a PR with the following steps:
1. Check changes with git diff --cached
2. Create description using .github/PULL_REQUEST_TEMPLATE.md
3. Select up to 3 appropriate labels based on changes
4. Create as Draft PR (preserve HTML comments)"

# 3. Ready after CI confirmation
"Please change PR to Ready for Review after CI passes"
```

### Execution Steps

#### 1. Branch Creation

```bash
# Naming convention following guidelines: {type}-{subject}
git checkout main
git pull
git checkout -b feat-user-authentication

# Branch confirmation (display current branch name)
git branch --show-current
```

#### 2. Commit

```bash
# Stage changes
git add .

# Commit message following guidelines
git commit -m "feat: implement user authentication API"
```

#### 3. Push to Remote

```bash
# Initial push (set upstream)
git push -u origin feat-user-authentication

# Subsequent pushes
git push
```

#### 4. Draft PR Creation through Automatic Analysis

##### Step 1: Change Content Analysis

```bash
# Get file changes (check staged changes)
git diff --cached --name-only

# Content analysis (up to 1000 lines)
git diff --cached | head -1000
```

##### Step 2: Automatic Description Generation

```bash
# Template processing priority
# 1. Existing PR description (complete preservation)
# 2. .github/PULL_REQUEST_TEMPLATE.md
# 3. Default template

cp .github/PULL_REQUEST_TEMPLATE.md pr_body.md
# Supplement only empty sections while preserving HTML comments and separators
```

##### Step 3: Automatic Label Selection

```bash
# Get available labels (non-interactive)
"Please get available labels from .github/labels.yml or GitHub repository and automatically select appropriate labels based on change content"

# Automatic selection through pattern matching (up to 3)
# - Documentation: *.md, docs/ → documentation|docs
# - Test: test, spec → test|testing
# - Bug fix: fix|bug → bug|fix
# - New feature: feat|feature → feature|enhancement
```

##### Step 4: PR Creation via GitHub API (Preserve HTML Comments)

```bash
# PR creation
"Please create a Draft PR with the following information:
- Title: Auto-generated from commit message
- Description: Properly filled using .github/PULL_REQUEST_TEMPLATE.md
- Labels: Auto-selected from change content (up to 3)
- Base branch: main
- HTML comments completely preserved"
```

##### Method B: GitHub MCP (Fallback)

```javascript
// PR creation with HTML comment preservation
mcp_github_create_pull_request({
  owner: 'organization',
  repo: 'repository',
  base: 'main',
  head: 'feat-user-authentication',
  title: 'feat: implement user authentication',
  body: prBodyContent, // Complete content including HTML comments
  draft: true,
  maintainer_can_modify: true,
});
```

### Automatic Label Selection System

#### File Pattern-Based Detection

- **Documentation**: `*.md`, `README`, `docs/` → `documentation|docs|doc`
- **Testing**: `test`, `spec` → `test|testing`
- **CI/CD**: `.github/`, `*.yml`, `Dockerfile` → `ci|build|infra|ops`
- **Dependencies**: `package.json`, `pubspec.yaml` → `dependencies|deps`

#### Change Content-Based Detection

- **Bug fixes**: `fix|bug|error|crash` → `bug|fix`
- **New features**: `feat|feature|add|implement` → `feature|enhancement|feat`
- **Refactoring**: `refactor|clean` → `refactor|cleanup|clean`
- **Performance**: `performance|perf|optimize` → `performance|perf`
- **Security**: `security|secure` → `security`

#### Constraints

- **Up to 3 maximum**: Upper limit for automatic selection
- **Existing labels only**: No new label creation
- **部分マッチ**: キーワード含有による判定

### プロジェクトガイドライン

#### 基本姿勢

1. **必ず Draft で開始**: すべての PR は Draft 状態で作成
2. **段階的品質向上**: Phase 1（基本実装）→ Phase 2（テスト追加）→ Phase 3（ドキュメント更新）
3. **適切なラベル**: 最大 3 種類のラベルを必ず付与
4. **テンプレート使用**: `.github/PULL_REQUEST_TEMPLATE.md` を必ず使用
5. **日本語スペース**: 日本語と半角英数字間に必ず半角スペース

#### ブランチ命名規則

```text
{type}-{subject}

例:
- feat-user-profile
- fix-login-error
- refactor-api-client
```

#### コミットメッセージ

```text
{type}: {description}

例:
- feat: ユーザー認証 API の実装
- fix: ログイン エラーの修正
- docs: README の更新
```

### テンプレート処理システム

#### 処理優先順位

1. **既存 PR 説明**: 既に記述されている内容を**完全に踏襲**
2. **プロジェクトテンプレート**: `.github/PULL_REQUEST_TEMPLATE.md` 構造を維持
3. **デフォルトテンプレート**: 上記が存在しない場合

#### 既存内容保持ルール

- **一文字も変更しない**: 既に記述されている内容
- **空セクションのみ補完**: プレースホルダー部分を変更内容で埋める
- **機能的コメント保持**: `<!-- Copilot review rule -->` などを維持
- **HTML コメント保持**: `<!-- ... -->` を完全に保持
- **区切り線保持**: `---` などの構造を維持

#### HTML コメント保持の対処法

**重要**: GitHub CLI (`gh pr edit`) は HTML コメントを自動エスケープし、シェル処理で `EOF < /dev/null` などの不正な文字列が混入する場合があります。

**根本的解決策**:

1. **GitHub API の --field オプション使用**: 適切なエスケープ処理で HTML コメント保持
2. **テンプレート処理の簡素化**: 複雑なパイプ処理やリダイレクトを避ける
3. **完全保持アプローチ**: HTML コメント削除処理を廃止し、テンプレートを完全保持

### レビューコメント対応

```bash
# 変更後の再コミット
git add .
git commit -m "fix: レビュー フィードバックに基づく修正"
git push
```

### 注意事項

#### HTML コメント保持の重要性

- **GitHub CLI 制限**: `gh pr edit` は HTML コメントをエスケープ、不正文字列混入
- **根本的回避策**: GitHub API の `--field` オプションで適切なエスケープ処理
- **テンプレート完全保持**: HTML コメント削除処理を廃止し、構造を完全維持

#### 自動化の制約

- **新規ラベル禁止**: `.github/labels.yml` 定義外のラベル作成不可
- **最大 3 ラベル**: 自動選択の上限
- **既存内容優先**: 手動で記述された内容は一切変更しない

#### 段階的品質向上

- **Draft 必須**: すべての PR は Draft で開始
- **CI 確認**: `gh pr checks` で状態確認
- **Ready 移行**: 品質確認完了後に `gh pr ready`
- **テンプレート完全遵守**: プロジェクト固有の構造を維持
