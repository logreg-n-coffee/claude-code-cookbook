## PR Review

Ensure code quality and architectural soundness through systematic Pull Request reviews.

### Usage

```bash
# Comprehensive PR review
gh pr view 123 --comments
"Please systematically review this PR and provide feedback from code quality, security, and architecture perspectives"

# Security-focused review
gh pr diff 123
"Please review with focus on security risks and vulnerabilities"

# Architecture perspective review
gh pr checkout 123 && find . -name "*.js" | head -10
"Please evaluate architecture from layer separation, dependencies, and SOLID principles perspectives"
```

### Basic Examples

```bash
# Numerical evaluation of code quality
find . -name "*.js" -exec wc -l {} + | sort -rn | head -5
"Please evaluate code complexity, function size, and duplication level and point out areas for improvement"

# Security vulnerability check
grep -r "password\|secret\|token" . --include="*.js" | head -10
"Please check risks of sensitive information leakage, hardcoding, and authentication bypass"

# Architecture violation detection
grep -r "import.*from.*\.\./\.\." . --include="*.js"
"Please evaluate layer violations, circular dependencies, and coupling issues"
```

### Comment Classification System

```text
🔴 critical.must: Critical issues
├─ Security vulnerabilities
├─ Data integrity problems
└─ System failure risks

🟡 high.imo: High priority improvements
├─ Functional failure risks
├─ Performance issues
└─ Significant maintainability degradation

🟢 medium.imo: Medium priority improvements
├─ Readability improvements
├─ Code structure improvements
└─ Test quality improvements

🟢 low.nits: Minor points
├─ Style unification
├─ Typo corrections
└─ Comment additions

🔵 info.q: Questions and information
├─ 実装意図の確認
├─ 設計判断の背景
└─ ベストプラクティスの共有
```

### レビュー観点

#### 1. コード正確性

- **ロジックエラー**: 境界値、Null チェック、例外処理
- **データ整合性**: 型安全性、バリデーション
- **エラーハンドリング**: 網羅性、適切な処理

#### 2. セキュリティ

- **認証・認可**: 適切なチェック、権限管理
- **入力検証**: SQL インジェクション、XSS 対策
- **機密情報**: ログ出力禁止、暗号化

#### 3. パフォーマンス

- **アルゴリズム**: 時間計算量、メモリ効率
- **データベース**: N+1 クエリ、インデックス最適化
- **リソース**: メモリリーク、キャッシュ活用

#### 4. アーキテクチャ

- **レイヤー分離**: 依存方向、適切な分離
- **結合度**: 疑結合、インターフェース活用
- **SOLID 原則**: 単一責任、開放閉鎖、依存性逆転

### レビューフロー

1. **事前確認**: PR 情報、変更差分、関連 Issue
2. **体系的チェック**: セキュリティ → 正確性 → パフォーマンス → アーキテクチャ
3. **建設的フィードバック**: 具体的な改善案とコード例
4. **フォローアップ**: 修正確認、CI 状態、最終承認

### 効果的なコメント例

**セキュリティ問題**

```markdown
**critical.must.** パスワードが平文で保存されています

```javascript
// 修正案
const bcrypt = require('bcrypt');
const hashedPassword = await bcrypt.hash(password, 12);
```

セキュリティリスクを防ぐためハッシュ化が必須です。

```

**パフォーマンス改善**
```markdown
**high.imo.** N+1 クエリ問題が発生します

```javascript
// 改善案: Eager Loading
const users = await User.findAll({ include: [Post] });
```

クエリ数を大幅に削減できます。

```

**アーキテクチャ違反**
```markdown
**high.must.** レイヤー違反が発生しています

ドメイン層がインフラ層に直接依存しています。
依存性逆転の原則でインターフェースを導入してください。
```

### 注意事項

- **建設的トーン**: 攻撃的ではなく協調的なコミュニケーション
- **具体的提案**: 問題の指摘だけでなく解決案を提示
- **優先度付け**: Critical → High → Medium → Low の順で対応
- **継続改善**: レビュー結果をナレッジベース化
