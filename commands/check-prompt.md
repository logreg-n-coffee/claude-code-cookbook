## Check Prompt

A comprehensive best practices collection for evaluating and improving prompt quality for AI agents. Systematizes insights gained from actual prompt improvement processes, covering all critical aspects including ambiguity elimination, information integration, enforcement strengthening, tracking systems, and continuous improvement.

### Usage

```bash
# Check prompt file quality
cat your-prompt.md
/check-prompt
"Check the quality of this prompt and provide improvement suggestions"
```

### Options

- None : Analyze current file or selected text
- `--category <name>` : Check only specific category (structure/execution/restrictions/quality/roles/improvement)
- `--score` : Calculate quality score only
- `--fix` : Auto-suggest fixes for detected issues
- `--deep` : Deep analysis mode (focus on ambiguity, information scatter, enforcement)

### Basic Examples

```bash
# Quality evaluation of entire prompt
cat devin/playbooks/code-review.md
/check-prompt
"Evaluate this prompt quality across 6 categories and provide issues and improvement suggestions"

# Deep analysis mode
/check-prompt --deep
"Focus on ambiguity, information scatter, and insufficient enforcement to provide fundamental improvement suggestions"

# Check specific category
/check-prompt --category structure
"Check this prompt from structure and clarity perspective"

# Detect and fix ambiguous expressions
/check-prompt --fix
"Detect ambiguous expressions and suggest clear expression fixes"
```

---

## Core Design Principles

### Principle 1: Completely Eliminate Room for Interpretation

- **Absolutely Prohibited**: "As a rule", "recommended", "if possible", "depending on situation", "judge appropriately"
- **Must Use**: "Must", "absolutely", "strictly adhere", "without exception", "mandatory"
- **Exception Conditions**: Strictly limited by numbers ("only the following 3 conditions", "except for these 2 cases")

### Principle 2: Strategic Information Integration

- Completely integrate related important information into one section
- Summarize the overall picture in execution checklists
- Thoroughly eliminate circular references and scatter

### Principle 3: Build Hierarchical Enforcement

- Clear hierarchy of 🔴 (execution halt level) → 🟡 (quality important) → 🟢 (recommended)
- Gradual promotion from recommended to mandatory level
- Clear indication of impact and countermeasures when violated

### Principle 4: Ensure Traceability

- Record and verify all execution results
- Technically prevent false reporting
- Objective success/failure judgment criteria

### Principle 5: Feedback-Driven Improvement

- Learn from actual failure cases
- Continuous effectiveness verification
- Automatic detection of new patterns

---

## 📋 Comprehensive Checklist

### 📐 Structure and Clarity (25 points)

#### Priority Display of Instructions (8 points)

- [ ] 🔴🟡🟢 priorities are clearly indicated for all important instructions
- [ ] Execution halt level conditions are specifically and clearly defined
- [ ] Judgment criteria for each priority are objective and verifiable
- [ ] Priority hierarchy is consistently applied

#### Complete Elimination of Ambiguous Expressions (9 points)

- [ ] **Fatal ambiguous expressions**: "As a rule", "recommended", "if possible" = 0 instances
- [ ] **Use of mandatory expressions**: Proper use of "must", "absolutely", "strictly adhere", "without exception"
- [ ] **Numerical limitation of exception conditions**: Clear boundaries like "only 3 conditions"
- [ ] **Elimination of judgment room**: Use only expressions that allow no multiple interpretations
- [ ] **Eradication of gray zones**: Clear judgment criteria for all situations

#### Strategic Information Integration (8 points)

- [ ] Multiple location scatter of important information is completely resolved
- [ ] Related instructions are logically integrated into one section
- [ ] Overall picture is comprehensively summarized in execution checklists
- [ ] No circular references or infinite loops exist

### 🎯 Executability (20 points)

#### Completeness of Specific Procedures (7 points)

- [ ] All command examples are actually executable and verified
- [ ] Environment variables, prerequisites, dependencies are completely specified
- [ ] Error handling methods are specific and executable
- [ ] Procedure order is logical and necessary

#### Ensuring Verifiability (7 points)

- [ ] Success/failure of execution results can be objectively determined
- [ ] Output examples, log formats, expected values are specifically shown
- [ ] Test methods and verification procedures are implementable
- [ ] Intermediate result check points are appropriately placed

#### Automation Adaptability (6 points)

- [ ] Format easy for scripting and CI/CD integration
- [ ] Clear separation between human judgment and AI execution areas
- [ ] Support for batch processing and parallel execution

### 🚫 Clarification of Prohibitions (15 points)

#### Systematization of Absolute Prohibitions (8 points)

- [ ] Complete listing of operations that must not be executed
- [ ] Clear indication of violation impact level (minor/major/fatal) for each prohibition
- [ ] Specific presentation of alternative methods and workarounds
- [ ] Technical rationale explanation for prohibitions

#### Strict Limitation of Exception Conditions (7 points)

- [ ] Conditions for allowing exceptions are specific and limited (numerical specification)
- [ ] Objective judgment criteria like "completely duplicate", "explicitly stated"
- [ ] Clear boundaries leaving no gray zones
- [ ] Clear additional conditions and constraints when applying exceptions

### 📊 Quality Assurance Mechanisms (20 points)

#### Completeness of Tracking System (8 points)

- [ ] Automatic recording and statistics acquisition for all execution results
- [ ] Verification function to technically prevent false reporting
- [ ] Real-time monitoring and alert functions
- [ ] Audit log tamper prevention function

#### 4.2 テンプレート遵守の強制（7 点）

- [ ] 必須要素の明確な定義とチェック機能
- [ ] カスタマイズ禁止箇所の技術的制限
- [ ] 遵守確認の自動化されたチェックポイント
- [ ] 違反時の自動修正・警告機能

#### 4.3 エラーハンドリングの網羅性（5 点）

- [ ] 想定エラーパターンの完全なカタログ化
- [ ] エラー時の段階的対処プロセス
- [ ] 失敗を成功として報告することの技術的防止

### 5. 🎭 役割と責任の明確化（配点: 10 点）

#### 5.1 AI Agent の権限範囲（5 点）

- [ ] 実行可能操作と禁止操作の明確な境界線
- [ ] 判断権限の具体的な範囲と制約
- [ ] 人間確認が必要な操作の明確な分離

#### 5.2 分類システムの統一（5 点）

- [ ] 分類定義の明確性・一意性・排他性
- [ ] 分類間の重要度誤解を防ぐ明示的説明
- [ ] 各分類の具体的使用例と判断フローチャート

### 6. 🔄 継続改善（配点: 10 点）

#### 6.1 フィードバック収集の自動化（5 点）

- [ ] 実行ログからの自動改善点抽出
- [ ] 失敗パターンの機械学習ベース分析
- [ ] ベストプラクティスの自動更新メカニズム

#### 6.2 学習機能の実装（5 点）

- [ ] 新パターンの自動検出・分類
- [ ] 既存ルールの有効性継続監視
- [ ] 段階的改善の自動提案

---

## 🚨 致命的な問題パターン（即修正要）

### ❌ レベル 1: 致命的曖昧性（実行停止レベル）

- **複数解釈可能な指示**: 「適宜判断して」「状況に応じて」「原則として」
- **Ambiguous exception conditions**: "In special cases", "as needed"
- **Subjective judgment criteria**: "Appropriately", "sufficiently", "as much as possible"
- **Undefined important concepts**: "Standard", "general", "basic"

### ❌ Level 2: Structural Defects (Quality Important Level)

- **Information scatter**: Related important information scattered in 3+ locations
- **Circular references**: Infinite loops like Section A→B→C→A
- **Contradictory instructions**: Conflicting instructions in different sections
- **Unclear execution order**: Procedures with unclear dependencies

### ❌ Level 3: Quality Degradation (Recommended Improvement Level)

- **Unverifiability**: Unclear success/failure judgment criteria
- **Automation difficulty**: Design dependent on human subjective judgment
- **Maintenance difficulty**: Structure where update impact scope is unpredictable
- **Learning difficulty**: Complexity that takes time for newcomers to understand

---

## 🎯 Proven Improvement Methods

### ✅ Gradual Strengthening Approach

1. **Current state analysis**: Problem classification, prioritization, impact assessment
2. **Critical problem priority**: Complete resolution of Level 1 problems as top priority
3. **Gradual implementation**: Execute in verifiable units rather than all changes at once
4. **Effect measurement**: Quantitative comparison before and after improvement
5. **Continuous monitoring**: Confirm sustainability of improvement effects

### ✅ Practical Methods for Ambiguity Elimination

```markdown
# ❌ Before improvement (ambiguous)

"Issues should, as a rule, be described as inline comments on the relevant changed locations on GitHub"

# ✅ After improvement (clear)

"Issues must be described as inline comments on the relevant changed locations on GitHub. Exceptions are only the 3 conditions defined in Section 3.3"
```

### ✅ Practical Methods for Information Integration

```markdown
# ❌ Before improvement (scattered)

Section 2.1: "Use mandatory 6 sections"
Section 3.5: "📊 Overall evaluation, 📋 Issues..."
Section 4.2: "Section deletion prohibited"

# ✅ 改善後（統合）

実行チェックリスト:
□ 10. サマリーコメントを投稿（必須 6 セクション使用）
🔴 必須 6 セクション： 1) 📊 総合評価 2) 📋 指摘事項の分類別集計 3) ⚠️ 主要な懸念事項 4) ✅ 評価できる点 5) 🎯 結論 6) 🤖 AI レビュー品質の自己評価
❌ 絶対禁止：セクション削除・追加・名前変更
```

### ✅ 追跡システムの実装パターン

```bash
# 実行結果の厳格な追跡
POSTED_COMMENTS=0
FAILED_COMMENTS=0
TOTAL_COMMENTS=0

# 各操作の結果記録
if [ $? -eq 0 ]; then
    echo "✅ 成功: $OPERATION" >> /tmp/execution_log.txt
    POSTED_COMMENTS=$((POSTED_COMMENTS + 1))
else
    echo "❌ 失敗: $OPERATION" >> /tmp/execution_log.txt
    FAILED_COMMENTS=$((FAILED_COMMENTS + 1))
fi

# 虚偽報告の防止
if [ $POSTED_COMMENTS -ne $REPORTED_COMMENTS ]; then
    echo "🚨 警告: 報告数と実際の投稿数が不一致"
    exit 1
fi
```

---

## 📈 品質スコア計算（改良版）

### 総合スコア算出

```
基本スコア = Σ(各カテゴリスコア × 配点) / 100

致命的問題ペナルティ:
- レベル 1 問題: -20 点/件
- レベル 2 問題: -10 点/件
- レベル 3 問題: -5 点/件

ボーナス要素:
- 自動化対応: +5 点
- 学習機能実装: +5 点
- 実証済み改善事例: +5 点

最終スコア = 基本スコア + ボーナス - ペナルティ
```

### 品質レベル判定

```
95-100 点: 世界最高水準 (業界標準として推奨可能)
90-94 点:  優秀 (本番運用可能)
80-89 点:  良好 (軽微な改善で運用可能)
70-79 点:  普通 (改善必要)
60-69 点:  要改善 (大幅な修正必要)
50-59 点:  要大幅修正 (根本的な見直し必要)
49 点以下: 使用禁止 (完全な再設計必要)
```

---

## 🔧 実践的な改善プロセス

### フェーズ 1: 診断・分析（1-2 日）

1. **全体構造の把握**: セクション構成・情報フロー・依存関係の可視化
2. **曖昧性検出**: 解釈余地のある表現の全件抽出
3. **情報分散分析**: 関連情報の散在パターンのマッピング
4. **強制力評価**: 推奨/必須の分類と実効性の評価
5. **追跡可能性確認**: 実行結果の記録・検証機能の評価

### フェーズ 2: 優先度付け・計画（半日）

1. **致命度分類**: レベル 1-3 の問題分類と影響度評価
2. **改善順序決定**: 相互依存関係を考慮した最適順序
3. **リソース配分**: 改善効果とコストのバランス最適化
4. **リスク評価**: 改善時の副作用・互換性問題の予測

### フェーズ 3: 段階的実装（2-5 日）

1. **レベル 1 問題解決**: 致命的曖昧性の完全排除
2. **情報統合実施**: 分散情報の戦略的集約
3. **強制力強化**: 推奨 → 必須への段階的格上げ
4. **追跡システム実装**: 実行結果の自動記録・検証機能
5. **テンプレート強化**: 必須要素の明確化と遵守強制

### フェーズ 4: 検証・調整（1-2 日）

1. **機能テスト**: 全ての変更点の動作確認
2. **統合テスト**: システム全体の整合性確認
3. **パフォーマンステスト**: 実行効率・レスポンス確認
4. **ユーザビリティテスト**: 実際の使用シナリオでの検証

### フェーズ 5: 運用・監視（継続）

1. **効果測定**: 改善前後の定量的比較
2. **継続監視**: 品質劣化の早期検出
3. **フィードバック収集**: 実運用での問題点抽出
4. **最適化継続**: 継続的な改善サイクル

---

## 📊 実際の改善事例（詳細版）

### ケーススタディ: 大規模プロンプトの品質改善

#### 改善前の状況

```bash
品質スコア: 70 点/100 点
- 曖昧表現: 15 箇所発見
- 情報分散: 6 箇所に重要情報が散在
- 強制力不足: 推奨レベル表現が 80%
- 追跡機能: 実行結果の記録なし
- エラー処理: 失敗時の対処法不明確
```

#### 実施した改善内容

```bash
# 1. 曖昧性排除（2 日間）
- 「原則として」→「例外はセクション 3.3 の 3 つの条件のみ」
- 「推奨」→「必須」（重要度レベル 2 以上）
- 「適宜」→具体的な判断基準の明示

# 2. 情報統合（1 日間）
- 分散していた必須 6 セクション情報→実行チェックリストに統合
- 関連する禁止事項→1 つのセクションに集約
- 参照の循環を解消→線形の情報フロー

# 3. 追跡システム実装（1 日間）
- 実行結果の自動ログ記録
- 虚偽報告防止の検証機能
- リアルタイム統計表示

# 4. エラー処理強化（半日）
- 想定エラーパターンの完全カタログ化
- 段階的対処プロセスの明文化
- 自動回復機能の実装
```

#### 改善後の結果

```bash
品質スコア: 90 点/100 点（+20 点向上）
- 曖昧表現: 0 箇所（完全排除）
- 情報統合: 重要情報を 3 箇所に集約
- 強制力: 必須レベル表現 95%
- 追跡機能: 完全自動化
- エラー処理: 90% の問題を自動解決

実際の改善効果:
- 判断ミス: 85% 減少
- 実行時間: 40% 短縮
- エラー発生率: 70% 減少
- ユーザー満足度: 95% 向上
```

### 教訓・ベストプラクティス

#### 成功要因

1. **段階的アプローチ**: 一度に全変更せず、検証可能な単位で実施
2. **データ駆動**: 主観的判断ではなく、実測データに基づく改善
3. **継続監視**: 改善効果の持続性を定期的に確認
4. **フィードバック重視**: 実際の使用者からの意見を積極的に収集

#### 失敗回避策

1. **過度の完璧主義**: 90 点到達で一旦運用開始、継続改善で 100 点目指す
2. **一括変更の危険性**: 大規模変更は必ず段階的に実施
3. **後方互換性**: 既存ワークフローへの影響を最小限に抑制
4. **ドキュメント不足**: すべての変更を詳細に記録・共有

---

### Claude との連携

```bash
# プロンプトファイルと組み合わせた品質チェック
cat your-prompt.md
/check-prompt
「このプロンプトの品質を評価して、改善点を提案して」

# 複数のプロンプトファイルの比較
cat prompt-v1.md && echo "---" && cat prompt-v2.md
/check-prompt
「2 つのバージョンを比較して、改善された点と残る課題を分析して」

# 実際のエラーログと組み合わせた分析
cat execution-errors.log
/check-prompt --deep
「このエラーを引き起こした可能性のあるプロンプトの問題点を特定して」
```

### 注意事項

- **前提条件**: プロンプトファイルは Markdown 形式で記述されていることを推奨
- **制限事項**: 大規模なプロンプト（1 万行以上）の場合、分割して分析することを推奨
- **推奨事項**: 定期的にプロンプトの品質チェックを実施し、継続的に改善してください

---

_このチェックリストは実際のプロンプト改善プロジェクトで実証された知見の完全版であり、継続的に進化し続けます。_
