## Multi Role

A command that performs parallel analysis of the same target with multiple roles and generates integrated reports.

### Usage

```bash
/multi-role <role1>,<role2> [--agent|-a] [analysis target]
/multi-role <role1>,<role2>,<role3> [--agent|-a] [analysis target]
```

**Important**:

- Place `--agent` option immediately after role specification
- Write messages after `--agent`
- Correct example: `/multi-role qa,architect --agent evaluate the plan`
- Incorrect example: `/multi-role qa,architect evaluate the plan --agent`

### Options

- `--agent` or `-a` : Execute each role as sub-agents in parallel (recommended for large-scale analysis)
  - When this option is used, if each role's description contains automatic delegation promotion phrases (like "use PROACTIVELY"), more aggressive automatic delegation becomes enabled

### Basic Examples

```bash
# Security and performance dual analysis (normal)
/multi-role security,performance
"Evaluate this API endpoint"

# Large-scale system parallel analysis (sub-agents)
/multi-role security,performance --agent
"Comprehensively analyze system-wide security and performance"

# Integrated analysis of frontend, mobile, and performance
/multi-role frontend,mobile,performance
"Consider optimization plans for this screen"

# Multi-perspective evaluation of architecture design (sub-agents)
/multi-role architect,security,performance --agent
"Evaluate the microservices architecture design"
```

### Analysis Process

### Phase 1: Parallel Analysis

Each role independently analyzes the same target

- Execute evaluation from specialized perspectives
- Make judgments based on role-specific criteria
- Generate independent recommendations

### Phase 2: Integrated Analysis

Structure and integrate results

- Organize evaluation results from each role
- Identify overlaps and contradictions
- Clarify complementary relationships

### Phase 3: Integrated Report

Generate final recommendations

- Prioritized action plan
- Clear trade-offs
- Implementation roadmap presentation

### Output Format Examples

### Two-Role Analysis Case

```
Multi-Role Analysis: Security + Performance
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Analysis Target: API endpoint /api/users

Security Analysis Results:
Authentication: JWT validation properly implemented
Authorization: Role-based access control incomplete
Encryption: API keys output in plain text logs

Evaluation Score: 65/100
Importance: High (due to sensitive data access)

Performance Analysis Results:
Response Time: Average 180ms (target under 200ms)
Database Queries: N+1 problem detected
Cache: Redis cache not implemented

Evaluation Score: 70/100
Importance: Medium (currently within acceptable range)

Cross-Correlation Analysis:
Synergy Opportunities:
- Consider encryption simultaneously when implementing Redis cache
- Log output improvements enhance both security and performance

Trade-off Points:
- Authorization check strengthening ↔ Impact on response time
- Log encryption ↔ Reduced debugging efficiency

Integrated Priority:
Critical: Fix API key plain text output
High: Resolve N+1 queries
Medium: Implement Redis cache + encryption
Low: Refine authorization control

Implementation Roadmap:
Week 1: Implement API key masking
Week 2: Database query optimization
Week 3-4: Cache layer design and implementation
Month 2: Gradual authorization control enhancement
```

### Three-Role Analysis Case

```
Multi-Role Analysis: Frontend + Mobile + Performance
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Analysis Target: User profile screen

Frontend Analysis Results:
Usability: Intuitive layout
Accessibility: WCAG 2.1 compliance rate 85%
Responsive: Issues with tablet display

Mobile Analysis Results:
Touch Targets: 44pt+ secured
One-handed Operation: Important buttons placed at top
Offline Support: Not implemented

Performance Analysis Results:
Initial Display: LCP 2.1 seconds (good)
Image Optimization: WebP not supported
Lazy Loading: Not implemented

Integrated Recommendations:
1. Mobile optimization (one-handed operation + offline support)
2. Image optimization (WebP + lazy loading)
3. Tablet UI improvements

Priority: Mobile > Performance > Frontend
Implementation Period: 3-4 weeks
```

### Effective Combination Patterns

### Security-Focused

```bash
/multi-role security,architect
"Authentication system design"

/multi-role security,frontend  
"Login screen security"

/multi-role security,mobile
「モバイルアプリのデータ保護」
```

### パフォーマンス重視

```bash
/multi-role performance,architect
「スケーラビリティ設計」

/multi-role performance,frontend
「Web ページの高速化」

/multi-role performance,mobile
「アプリの動作最適化」
```

### ユーザー体験重視

```bash
/multi-role frontend,mobile
「クロスプラットフォーム UI」

/multi-role frontend,performance
「UX とパフォーマンスのバランス」

/multi-role mobile,performance
「モバイル UX の最適化」
```

### 包括的分析

```bash
/multi-role architect,security,performance
「システム全体の評価」

/multi-role frontend,mobile,performance
「ユーザー体験の総合評価」

/multi-role security,performance,mobile
「モバイルアプリの総合診断」
```

### Claude との連携

```bash
# ファイル分析と組み合わせ
cat src/components/UserProfile.tsx
/multi-role frontend,mobile
「このコンポーネントを複数の視点で評価して」

# 設計ドキュメントの評価
cat architecture-design.md
/multi-role architect,security,performance
「この設計を複数の専門分野で評価して」

# エラー分析
cat performance-issues.log
/multi-role performance,analyzer
「パフォーマンス問題を多角的に分析して」
```

### multi-role vs role-debate の使い分け

### multi-role を使う場面

- 各専門分野の独立した評価が欲しい
- 統合的な改善計画を立てたい
- 矛盾や重複を整理したい
- 実装優先度を決めたい

### role-debate を使う場面

- 専門分野間でトレードオフがある
- 技術選定で意見が分かれそう
- 設計方針を議論で決めたい
- 異なる視点での議論を聞きたい

### サブエージェント並列実行（--agent）

`--agent` オプションを使用すると、各ロールが独立したサブエージェントとして並列実行されます。

#### 自動委任の促進

ロールファイルの description フィールドに以下のようなフレーズが含まれている場合、`--agent` 使用時により積極的な自動委任が有効化されます：

- "use PROACTIVELY"
- "MUST BE USED"
- その他の強調表現

#### 実行フロー

```
通常実行:
ロール 1 → ロール 2 → ロール 3 → 統合
（順次実行、約 3-5 分）

--agent 実行:
ロール 1 ─┐
ロール 2 ─┼→ 統合
ロール 3 ─┘
（並列実行、約 1-2 分）
```

#### 効果的な使用例

```bash
# 大規模システムの総合評価
/multi-role architect,security,performance,qa --agent
「新システムの包括的評価」

# 複数観点での詳細分析
/multi-role frontend,mobile,performance --agent
「全画面の UX 最適化分析」
```

#### パフォーマンス比較

| ロール数 | 通常実行 | --agent 実行 | 短縮率 |
|---------|----------|-------------|-------|
| 2 ロール | 2-3 分 | 1 分 | 50% |
| 3 ロール | 3-5 分 | 1-2 分 | 60% |
| 4 ロール | 5-8 分 | 2-3 分 | 65% |

### 注意事項

- 3 つ以上のロールを同時実行すると出力が長くなります
- 複雑な分析ほど実行時間が長くなる可能性があります
- 相互矛盾する推奨事項が出た場合は、role-debate も検討してください
- 最終的な判断は統合結果を参考にユーザーが行ってください
- **--agent 使用時**: より多くのリソースを使用しますが、大規模分析では効率的です
