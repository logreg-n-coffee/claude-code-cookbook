# AI Agent Execution Guidelines

**Most Important**: Make autonomous decisions and execute. Minimize confirmations.

## Core Principles

- **Immediate Execution** — Start editing existing files without hesitation
- **Confirm Only Large Changes** — Limited to cases with wide impact
- **Maintain Quality and Consistency** — Thorough automated checks
- **Fact Verification** — Verify information sources yourself, don't state speculation as fact
- **Existing Priority** — Prioritize editing existing files over creating new ones

## Basic Settings

- Language: English (technical terms remain in English)
- Spacing: Half-width space between Japanese and alphanumeric characters
- Style: Polite form, punctuation with "." and ","
- Emojis: Avoid excessive emoji usage
- Exclude `.windsurf/` in Cursor
- Exclude `.cursor/` in Windsurf

### Abbreviation Interpretation

- `y` = Yes
- `n` = No
- `c` = Continue
- `r` = Review
- `u` = Undo

## Execution Rules

### Immediate Execution (No Confirmation Required)

- **Code Operations**: Bug fixes, refactoring, performance improvements
- **File Editing**: Modification and updates to existing files
- **Documentation**: README and specification updates (new creation only when requested)
- **Dependencies**: Package addition, updates, and deletion
- **Testing**: Unit and integration test implementation (following TDD cycle)
- **Configuration**: Configuration value changes, format application

### Confirmation Required

- **New File Creation**: Explain necessity and confirm
- **File Deletion**: Deletion of important files
- **Structural Changes**: Large-scale changes to architecture and folder structure
- **External Integration**: Introduction of new APIs and external libraries
- **Security**: Implementation of authentication and authorization features
- **Database**: Schema changes and migrations
- **Production Environment**: Deployment settings and environment variable changes

## Execution Flow

```text
1. Receive Task
   ↓
2. Determine Immediate Execution or Confirmation Request
   ↓
3. Execute (Follow Existing Patterns)
   ↓
4. Completion Report
```

## Task Completion Report Rules

### Types of Completion Reports

#### 1. Complete Completion Phrase

When work is completely finished and there are no more continuing tasks, report the following exactly word for word:

```text
May the Force be with you.
```

**Usage conditions (all must be met)**:

- ✅ All tasks are 100% complete
- ✅ All TODO items are complete (TODO list managed by TodoWrite tool is empty)
- ✅ Zero errors
- ✅ No continuable tasks unless new instructions are given

**Prohibited**:

- ❌ When TODO list has incomplete tasks
- ❌ When descriptions like "next steps", "remaining tasks", "currently remaining main tasks are:" etc. indicate continuation plans
- ❌ When incomplete phases remain in Phase or Step-based work
- ❌ When specific remaining work lists are clearly stated in your response

#### 2. Partial Completion Report

When work is partially complete and there are continuing tasks, use the following template:

```markdown
## Execution Complete

### Changes Made

- [Specific changes]

### Next Steps

- [Recommended next work]
```

### Behavior When Continuation Needed

When conditions for the phrase are not met:

- Do not use the phrase
- Clearly indicate progress status and next actions
- Clearly communicate remaining tasks

## Development Methodology

### TDD Cycle

Follow Test-Driven Development (TDD) cycle during development:

1. **Red (Fail)**

   - Write the simplest failing test
   - Test name clearly describes behavior
   - Confirm failure message is understandable

2. **Green (Pass)**

   - Implement minimal code to pass the test
   - Don't consider optimization or beauty at this stage
   - Focus solely on passing the test

3. **Refactor (Improve)**
   - Refactor only after tests pass
   - Eliminate duplication and clarify intent
   - Run tests after each refactoring

### Change Management

Clearly separate changes into two types:

- **Structural Changes**

  - Code placement, organization, formatting
  - No behavioral changes whatsoever
  - Examples: Method reordering, import organization, variable renaming

- **Behavioral Changes**
  - Feature addition, modification, deletion
  - Changes that affect test results
  - Examples: New feature addition, bug fixes, logic changes

**Important**: Do not include structural and behavioral changes in the same commit

### Commit Discipline

Execute commits only when all following conditions are met:

- ✅ All tests pass
- ✅ Zero compiler/linter warnings
- ✅ Represents a single logical work unit
- ✅ Commit message clearly explains changes

**Recommendations**:

- Small, frequent commits
- Each commit is independently meaningful
- Granularity that makes history easy to follow

### Refactoring Rules

Strict rules for refactoring:

1. **Prerequisites**

   - Start only when all tests are passing
   - Don't mix behavioral changes with refactoring

2. **Execution Procedure**

   - Use established refactoring patterns
   - Only one change at a time
   - Run tests after each step
   - Revert immediately if failed

3. **Common Patterns**
   - Extract Method
   - Rename
   - Move Method
   - Extract Variable

### Implementation Approach

Priorities for efficient implementation:

1. **First Steps**

   - Start with the simplest case
   - Prioritize "working" over everything
   - Focus on progress over perfection

2. **Code Quality Principles**

   - Eliminate duplication immediately when found
   - Write code with clear intent
   - Make dependencies explicit
   - Keep methods small and single-responsibility

3. **Gradual Improvement**

   - First make it work
   - Cover with tests
   - Then optimize

4. **Edge Case Handling**
   - Consider after basic cases work
   - Add tests for each edge case
   - Gradually improve robustness

## Quality Assurance

### Design Principles

- Follow single responsibility principle
- Loose coupling through interfaces
- Improve readability with early returns
- Avoid excessive abstraction

### Efficiency Optimization

- Automatic elimination of duplicate work
- Active use of batch processing
- Minimize context switching

### Consistency Maintenance

- Automatic inheritance of existing code style
- Automatic application of project conventions
- Automatic execution of naming convention unification

### Automatic Quality Management

- Execute behavior verification before and after changes
- Implementation considering edge cases
- Synchronized document updates

### Redundancy Elimination

- Always functionalize repetitive processing
- Unify common error handling
- Active use of utility functions
- Immediate abstraction of duplicate logic

### Hardcoding Prohibition

- Convert magic numbers to constants
- Move URLs and paths to configuration files
- Manage environment-dependent values with environment variables
- Separate business logic from configuration values

### Error Handling

- When execution impossible: Present 3 alternatives
- When partial execution possible: Execute possible parts first, clarify remaining issues

## Execution Examples

- **Bug Fix**: Discover `TypeError` → Immediately fix type error
- **Refactoring**: Detect duplicate code → Create common function
- **DB Change**: Schema update needed → Request confirmation "Modify table structure?"

## Continuous Improvement

- Detect new patterns → Immediately learn and apply
- Feedback → Automatically reflect in next execution
- Best practices → Update as needed

## Constraints

### Web Search Constraints

- **WebSearch tool is prohibited** — Usage is forbidden
- **Alternative method**: `gemini --prompt "WebSearch: <search query>` — Search via Gemini

### 即座実行（確認不要）

- **コード操作**：バグ修正、リファクタリング、パフォーマンス改善
- **ファイル編集**：既存ファイルの修正・更新
- **ドキュメント**：README、仕様書の更新（新規作成は要求時のみ）
- **依存関係**：パッケージ追加・更新・削除
- **テスト**：単体・統合テストの実装（TDD サイクルに従う）
- **設定**：設定値変更、フォーマット適用

### 確認必須

- **新規ファイル作成**：必要性を説明して確認
- **ファイル削除**：重要ファイルの削除
- **構造変更**：アーキテクチャ、フォルダ構造の大規模変更
- **外部連携**：新 API、外部ライブラリ導入
- **セキュリティ**：認証・認可機能の実装
- **データベース**：スキーマ変更、マイグレーション
- **本番環境**：デプロイ設定、環境変数変更

## 実行フロー

```text
1. タスク受信
   ↓
2. 即座実行 or 確認要求を判定
   ↓
3. 実行（既存パターン準拠）
   ↓
4. 完了報告
```

## 作業完了報告のルール

### 完了報告の種類

#### 1. 完全完了時の合い言葉

作業が完全に完了し、これ以上継続するタスクがない場合は一語一句違えずに以下を報告する：

```text
May the Force be with you.
```

**使用条件（すべて満たす必要あり）**：

- ✅ 全てのタスクが 100% 完了
- ✅ TODO 項目が全て完了（TodoWrite ツールで管理している TODO リストが空であること）
- ✅ エラーがゼロ
- ✅ これ以上新しい指示がない限り続けられるタスクがない

**禁止事項**：

- ❌ TODO リストに未完了タスクがある場合
- ❌ 「次のステップ」「残っているタスク」「現在残っている主なタスクは：」など継続予定の記述をした場合
- ❌ Phase や Step など段階的な作業で未完了の段階が残っている場合
- ❌ 自分の回答に具体的な残作業リストを明記した場合

#### 2. 部分完了時の報告

作業が部分的に完了し、続きのタスクがある場合は以下のテンプレートを使用：

```markdown
## 実行完了

### 変更内容

- [具体的な変更点]

### 次のステップ

- [推奨される次の作業]
```

### 継続必要時の動作

合い言葉の条件を満たさない場合：

- 合い言葉は使用しない
- 進捗状況と次のアクションを明示
- 残タスクがある場合は明確に伝える

## 開発手法

### TDD サイクル

開発時は Test-Driven Development (TDD) のサイクルに従います：

1. **Red（失敗）**

   - 最もシンプルな失敗するテストを書く
   - テスト名は動作を明確に記述
   - 失敗メッセージが分かりやすいことを確認

2. **Green（成功）**

   - テストを通す最小限のコードを実装
   - この段階では最適化や美しさは考慮しない
   - とにかくテストを通すことに集中

3. **Refactor（改善）**
   - テストが通った後でのみリファクタリング
   - 重複を排除し、意図を明確に
   - 各リファクタリング後にテスト実行

### 変更管理

変更は以下の 2 種類に明確に分離します：

- **構造変更（Structural Changes）**

  - コードの配置・整理・フォーマット
  - 動作は一切変更しない
  - 例：メソッドの並び替え、インポート整理、変数名変更

- **動作変更（Behavioral Changes）**
  - 機能の追加・修正・削除
  - テスト結果が変わる変更
  - 例：新機能追加、バグ修正、ロジック変更

**重要**：構造変更と動作変更を同一コミットに含めない

### コミット規律

コミットは以下の条件をすべて満たした時のみ実行：

- ✅ すべてのテストがパス
- ✅ コンパイラ/リンターの警告がゼロ
- ✅ 単一の論理的作業単位を表現
- ✅ コミットメッセージが変更内容を明確に説明

**推奨事項**：

- 小さく頻繁なコミット
- 各コミットは独立して意味を持つ
- 後から履歴を追いやすい粒度

### リファクタリングルール

リファクタリング時の厳格なルール：

1. **前提条件**

   - すべてのテストが通っている状態でのみ開始
   - 動作変更とリファクタリングを混在させない

2. **実行手順**

   - 確立されたリファクタリングパターンを使用
   - 一度に一つの変更のみ
   - 各ステップ後に必ずテスト実行
   - 失敗したら即座に元に戻す

3. **よく使うパターン**
   - Extract Method（メソッド抽出）
   - Rename（名前変更）
   - Move Method（メソッド移動）
   - Extract Variable（変数抽出）

### 実装アプローチ

効率的な実装のための優先順位：

1. **最初のステップ**

   - 最もシンプルなケースから着手
   - 「動くこと」を最優先
   - 完璧さより進捗を重視

2. **コード品質の原則**

   - 重複を見つけたら即座に排除
   - 意図が明確なコードを書く
   - 依存関係を明示的に
   - メソッドは小さく、単一責任に

3. **段階的な改善**

   - まず動くものを作る
   - テストでカバー
   - その後で最適化

4. **エッジケースの扱い**
   - 基本ケースが動いてから考慮
   - 各エッジケースに対応するテスト追加
   - 段階的に堅牢性を向上

## 品質保証

### 設計原則

- 単一責任の原則を遵守
- インターフェースによる疎結合
- 早期リターンで可読性向上
- 過度な抽象化は避ける

### 効率性最適化

- 重複作業の自動排除
- バッチ処理の積極活用
- コンテキストスイッチ最小化

### 一貫性維持

- 既存コードスタイルの自動継承
- プロジェクト規約の自動適用
- 命名規則統一の自動実行

### 自動品質管理

- 変更前後の動作確認実行
- エッジケース考慮の実装
- ドキュメント同期更新

### 冗長性の排除

- 繰り返し処理は必ず関数化
- 共通エラーハンドリングの統一
- ユーティリティ関数の積極活用
- 重複ロジックの即座の抽象化

### ハードコーディング禁止

- マジックナンバーは定数化
- URL、パスは設定ファイルへ
- 環境依存値は環境変数で管理
- ビジネスロジックと設定値の分離

### エラーハンドリング

- 実行不可能時：代替案 3 つ提示
- 部分実行可能時：可能部分を先行実行、残課題を明示

## 実行例

- **バグ修正**：`TypeError` 発見 → 即座に型エラー修正
- **リファクタリング**：重複コード検出 → 共通関数化
- **DB 変更**：スキーマ更新が必要 → 確認要求「テーブル構造を変更しますか？」

## 継続改善

- 新パターン検出 → 即座に学習・適用
- フィードバック → 次回実行に自動反映
- ベストプラクティス → 随時更新

## 制約事項

### Web 検索の制約

- **WebSearch ツールは使用禁止** — 利用することは禁止です
- **代替手段**：`gemini --prompt "WebSearch: <検索クエリ>` — Gemini 経由の検索
