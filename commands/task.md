## Task

Launch dedicated agents to autonomously execute complex search, investigation, and analysis tasks. Large-scale information processing combining multiple tools with emphasis on context efficiency.

### Usage

```bash
# Request Task from Claude
"Please investigate [issue] with Task"
```

### Task Features

**Autonomous Execution**

- Automatic execution combining multiple tools
- Gradual information collection and analysis
- Result integration and structured reporting

**Efficient Information Processing**

- Context consumption optimization
- Large-scale file search and analysis
- Data collection from external information sources

**Quality Assurance**

- Information source reliability checking
- Verification from multiple perspectives
- Automatic completion of missing information

### Basic Examples

```bash
# Complex codebase investigation
"Please investigate which files implement this feature using Task"

# Large-scale file search
"Please identify configuration file inconsistencies using Task"

# External information collection
"Please investigate latest AI technology trends using Task"
```

### Claude Integration

```bash
# Complex problem analysis
"Please analyze the cause of memory leaks using Task. Include profiling results and logs"

# Dependency investigation
"Please investigate vulnerabilities in this npm package using Task"

# Competitive analysis
"Please investigate competitor service API specifications using Task"

# Architecture analysis
"Please analyze the dependencies of this microservice using Task"
```

### 他のコマンドとの使い分け

#### Task vs 他のコマンド

| コマンド | 主な用途 | 実行方式 | 情報収集 |
|---------|---------|----------|----------|
| **Task** | 調査・分析・検索 | 自律的実行 | 複数ソース |
| ultrathink | 深い思考・判断 | 構造化思考 | 既存知識中心 |
| sequential-thinking | 問題解決・設計 | 段階的思考 | 必要に応じて |
| plan | 実装計画立案 | 承認プロセス | 要件分析 |

#### 判断フローチャート

```
情報収集が必要？
├─ Yes → 複数ソース・大規模？
│          ├─ Yes → **Task**
│          └─ No → 通常の質問
└─ No → 深い思考が必要？
          ├─ Yes → ultrathink/sequential-thinking
          └─ No → 通常の質問
```

### 有効なケース・不要なケース

**有効なケース**

- 複雑なコードベース調査（依存関係、アーキテクチャ分析）
- 大規模なファイル検索（特定の実装パターン、設定ファイル）
- 外部情報の収集と整理（技術トレンド、ライブラリ調査）
- 複数のソースからの情報統合（ログ解析、メトリクス分析）
- 反復的な調査作業（セキュリティ監査、技術負債調査）
- コンテキスト消費を避けたい大規模分析

**不要なケース**

- 単純な質問や既存知識で回答可能な内容
- 短時間で完了する単発の作業
- 対話的な確認・相談が必要な作業
- 実装や設計の判断（plan や思考系コマンドが適切）

### カテゴリ別詳細例

#### システム分析・調査

```bash
# 複雑なシステム分析
「EC サイトのボトルネックを Task で特定して。データベース、API、フロントエンドの全体を調査」

# アーキテクチャ分析
「このマイクロサービスの依存関係を Task で分析して。API 通信とデータフローを含めて」

# 技術負債調査
「レガシーコードの技術負債を Task で分析して。リファクタリング優先度を含めて」
```

#### セキュリティ・コンプライアンス

```bash
# セキュリティ監査
「このアプリケーションの脆弱性を Task で調査して。OWASP Top 10 に基づいて」

# ライセンス調査
「プロジェクトの依存関係のライセンス問題を Task で調査して」

# 設定ファイル監査
「セキュリティ設定の不整合を Task で特定して。環境ごとの差分を含めて」
```

#### パフォーマンス・最適化

```bash
# パフォーマンス分析
「アプリケーションの重いクエリを Task で特定して。実行計画と最適化案を含めて」

# リソース使用量調査
「メモリリークの原因を Task で調査して。プロファイリング結果とコード解析を含めて」

# バンドルサイズ分析
「フロントエンドのバンドルサイズ問題を Task で調査して。最適化提案を含めて」
```

#### 外部情報収集

```bash
# 技術トレンド調査
「2024 年の JavaScript フレームワーク動向を Task で調査して」

# 競合分析
「競合サービスの API 仕様を Task で調査して。機能比較表を含めて」

# ライブラリ評価
「State 管理ライブラリの比較を Task で調査して。パフォーマンスと学習コストを含めて」
```

### 実行フローと品質保証

#### Task の実行フロー

```
1. 初期分析
   ├─ 課題の分解と調査範囲の特定
   ├─ 必要なツールと情報源の選定
   └─ 実行計画の立案

2. 情報収集
   ├─ ファイル検索・コード解析
   ├─ 外部情報の収集
   └─ データの構造化

3. 分析・統合
   ├─ 収集した情報の関連性分析
   ├─ パターンや問題点の特定
   └─ 仮説の検証

4. 報告・提案
   ├─ 結果の構造化
   ├─ 改善提案の作成
   └─ 次のアクションの提示
```

#### 品質保証

- **情報源の信頼性チェック**: 複数ソースでの事実確認
- **網羅性の確認**: 調査対象の漏れがないかチェック
- **一貫性の検証**: 矛盾する情報の整合性確認
- **実用性の評価**: 提案の実現可能性と効果の評価

### エラーハンドリングと制約事項

#### よくある制約

- **外部 API の利用制限**: レート制限や認証エラー
- **大容量ファイルの処理制限**: メモリやタイムアウトの制約
- **アクセス権限の問題**: ファイルやディレクトリへのアクセス制限

#### エラー時の対処

- **部分的な結果報告**: 取得できた情報のみでの分析
- **代替手段の提案**: 制約下での代替調査方法
- **段階的実行**: 大規模タスクの分割実行

### 注意事項

- Task は複雑で自律的な調査・分析タスクに最適です
- 単純な質問や即座の回答が必要な場合は、通常の質問形式を使用してください
- 調査結果は参考情報として扱い、重要な判断は必ず検証してください
- 外部情報の収集時は、情報の新しさと正確性に注意してください

### 実行例

```bash
# 使用例
「GraphQL スキーマの問題点を Task で調査して」

# 期待される動作
# 1. 専用エージェントが起動
# 2. GraphQL 関連ファイルの検索
# 3. スキーマ定義の解析
# 4. ベストプラクティスとの比較
# 5. 問題点の特定と改善提案
# 6. 構造化された報告書の作成
```
