## Role Debate

A command where roles with different expertise engage in discussions, consider trade-offs, and derive optimal solutions.

### Usage

```bash
/role-debate <role1>,<role2> [topic]
/role-debate <role1>,<role2>,<role3> [topic]
```

### Basic Examples

```bash
# Security vs Performance trade-offs
/role-debate security,performance
"JWT token expiration time settings"

# Usability vs Security balance
/role-debate frontend,security
"UX optimization for two-factor authentication"

# Technology selection discussion
/role-debate architect,mobile
"Choosing between React Native vs Flutter"

# Three-way discussion
/role-debate architect,security,performance
"Pros and cons of microservices architecture"
```

### Basic Principles of Discussion

#### Constructive Discussion Guidelines

- **Mutual Respect**: Respect the expertise and perspectives of other roles
- **Fact-Based**: Arguments based on data and evidence, not emotional responses
- **Solution-Oriented**: Aim for better solutions, not criticism for criticism's sake
- **Implementation-Focused**: Consider feasibility rather than just idealistic proposals

#### Quality Requirements for Arguments

- **Official Documentation**: Reference to standards, guidelines, and official documents
- **Empirical Evidence**: Specific citations of success/failure cases
- **Quantitative Evaluation**: Numerical comparison using metrics where possible
- **Time-Series Consideration**: Impact evaluation in short, medium, and long terms

#### Discussion Ethics

- **Integrity**: Acknowledge limitations in one's own field of expertise
- **Openness**: Flexibility toward new information and perspectives
- **Transparency**: Clear statement of judgment criteria and assumptions
- **Responsibility**: Include implementation risks in proposals

### Discussion Process

### Phase 1: Initial Position Statement

Each role expresses opinions independently from their professional perspective

- Present recommended proposals
- Clearly state supporting standards and documents
- Explain anticipated risks and challenges
- Define success metrics

### Phase 2: Cross-Discussion and Refutation

Cross-discussion between roles

- Constructive counter-arguments to other roles' proposals
- Point out overlooked perspectives
- Clarify trade-offs
- Present alternative proposals

### Phase 3: Compromise Exploration

Search for implementable solutions

- Evaluate importance of each perspective
- Consider Win-Win solutions
- Phased implementation approaches
- Risk mitigation strategy consideration

### Phase 4: Integrated Conclusion

Final recommendation decision

- Agreed-upon solutions
- Implementation roadmap
- Success metrics and measurement methods
- Future review points

### Output Format Examples

### Two-Role Discussion Case

```
Role Debate: Security vs Performance
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Topic: JWT Token Expiration Time Settings

Security Role's Argument:
"Recommend 15-minute short-term expiration"

Evidence:
- Compliant with OWASP JWT Security Cheat Sheet
- Minimize damage window during token leakage
- Limit available time for attackers

Concerns:
- Long-term expiration exponentially increases attack risk
- Compliance requirements (financial sector) mandate short-term

Success Metrics:
- Security incident rate < 0.1%
- Average attack detection time < 5 minutes

Performance Role's Counter-argument:
"Recommend 2-hour expiration time"

Evidence:
- Reference Google OAuth 2.0 Best Practices
- Avoid server load increase from frequent re-authentication
- Minimize user experience interruption (work disruption)

Concerns:
- 15-minute interval re-authentication increases API load 8x
- Frequent connection drops in mobile environments

Success Metrics:
- Maintain API response time < 200ms
- Server CPU usage < 60%

Cross-Discussion:
Security → Performance:
"Business losses from security breaches are more severe than server load.
Example: Equifax incident resulted in $700M loss"

Performance → Security:
"Both goals achievable with refresh token mechanism.
Background updates ensure security without compromising UX"

Security → Performance:
"Refresh tokens are also attack targets. Proper implementation is prerequisite"

Performance → Security:
"Propose staged approach: 30 minutes for normal operations, 15 minutes for sensitive operations"

Compromise Exploration:
Common Understanding:
- Need to balance user experience and security
- Flexible response based on risk levels
- Realistic consideration of implementation and operational costs

Win-Win Elements:
- Utilize refresh token mechanisms
- Gradual introduction of risk-based authentication
- Complement with automatic logout functionality

Integrated Conclusion:
"30-minute expiration + Refresh tokens + Risk-based authentication"

Implementation Details:
1. Access token: 30-minute expiration
2. Refresh token: 7-day expiration
3. High-risk operations: Force re-authentication at 15 minutes
4. Automatic logout after 30 minutes of inactivity

Phased Implementation:
Week 1-2: Basic 30-minute token implementation
Week 3-4: Add refresh token mechanism
Month 2: Introduce risk-based authentication

Success Metrics:
- Security: Incident rate < 0.1%
- Performance: API load increase < 20%
- UX: User satisfaction > 85%

Future Reviews:
- After 3 months: Evaluate actual attack patterns and load conditions
- After 6 months: Consider migration to more sophisticated risk-based authentication
```

### Three-Role Discussion Case

```
Role Debate: Architect vs Security vs Performance
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Topic: Pros and Cons of Microservices Architecture

Architect Role's Argument:
"Recommend gradual microservices adoption"
Evidence: Domain boundary clarification, independent deployment, technology choice freedom

Security Role's Concerns:
"Complexity of inter-service communication security"
Evidence: Management costs of API Gateway, mTLS, distributed authentication

Performance Role's Concerns:
"Increased latency from network communication"
Evidence: N+1 problems from internal API calls, distributed transactions

Three-way Discussion:
Architect → Security: "Centralized control possible through API Gateway"
Security → Architect: "Risk of single point of failure"
Performance → Architect: "Service separation granularity is critical"
...(discussion continues)

Integrated Conclusion:
"Domain-driven design with gradual separation + Security-first design"
```

### Effective Discussion Patterns

### Technology Selection

```bash
/role-debate architect,performance
"Database choice: PostgreSQL vs MongoDB"

/role-debate frontend,mobile
"UI framework: React vs Vue"

/role-debate security,architect
"Authentication method: JWT vs Session Cookie"
```

### Design Decisions

```bash
/role-debate security,frontend
"User authentication UX design"

/role-debate performance,mobile
"Data synchronization strategy optimization"

/role-debate architect,qa
"Testing strategy and architecture design"
```

### Trade-off Issues

```bash
/role-debate security,performance
"Encryption level vs processing speed"

/role-debate frontend,performance
"Rich UI vs page load speed"

/role-debate mobile,security
"Convenience vs data protection level"
```

### Role-specific Discussion Characteristics

#### 🔒 Security Role

```yaml
Discussion Stance:
  - Conservative approach (risk minimization)
  - Compliance emphasis (cautious about deviating from standards)
  - Worst-case assumptions (attacker perspective)
  - Long-term impact focus (security as technical debt)

Typical Arguments:
  - "Security vs convenience" trade-offs
  - "Compliance requirements must be met"
  - "Attack cost vs defense cost comparison"
  - "Thorough privacy protection"

Evidence Sources:
  - OWASP guidelines
  - NIST frameworks
  - Industry standards (ISO 27001, SOC 2)
  - Actual attack cases and statistics

Discussion Strengths:
  - Risk assessment accuracy
  - Regulatory requirements knowledge
  - Understanding of attack methods

Potential Biases:
  - Excessive conservatism (innovation hindrance)
  - Insufficient UX consideration
  - Underestimating implementation costs
```

#### ⚡ Performance Role

```yaml
Discussion Stance:
  - Data-driven decisions (measurement-based)
  - Efficiency focus (cost-effectiveness optimization)
  - User experience priority (perceived speed emphasis)
  - Continuous improvement (gradual optimization)

Typical Arguments:
  - "Performance vs security"
  - "ROI of optimization cost vs effect"
  - "Current vs future scalability"
  - "User experience vs system efficiency"

Evidence Sources:
  - Core Web Vitals metrics
  - Benchmark results and statistics
  - User behavior impact data
  - Industry performance standards

Discussion Strengths:
  - Quantitative evaluation capability
  - Bottleneck identification
  - Optimization technique knowledge

Potential Biases:
  - Undervaluing security
  - Insufficient maintainability consideration
  - Premature optimization
```

#### 🏗️ Architect Role

```yaml
Discussion Stance:
  - Long-term perspective focus (system evolution consideration)
  - Balance pursuit (overall optimization)
  - Gradual changes (risk management)
  - Standards compliance (proven pattern priority)

Typical Arguments:
  - "Short-term efficiency vs long-term maintainability"
  - "Technical debt vs development speed"
  - "Microservices vs monolith"
  - "New technology adoption vs stability"

Evidence Sources:
  - Architecture pattern collections
  - Design principles (SOLID, DDD)
  - Large-scale system cases
  - Technology evolution trends

Discussion Strengths:
  - Overall perspective capability
  - Design pattern knowledge
  - Long-term impact prediction

Potential Biases:
  - Excessive generalization
  - Conservatism toward new technologies
  - Insufficient understanding of implementation details
```

#### 🎨 Frontend Role

```yaml
Discussion Stance:
  - User-centered design (UX top priority)
  - Inclusive approach (diversity consideration)
  - Intuition emphasis (learning cost minimization)
  - Accessibility standards (WCAG compliance)

Typical Arguments:
  - "Usability vs security"
  - "Design consistency vs platform optimization"
  - "Functionality vs simplicity"
  - "Performance vs rich experience"

Evidence Sources:
  - UX research and usability test results
  - Accessibility guidelines
  - Design system standards
  - User behavior data

Discussion Strengths:
  - User perspective advocacy
  - Design principle knowledge
  - Accessibility requirements

Potential Biases:
  - 技術制約への理解不足
  - セキュリティ要件の軽視
  - パフォーマンス影響の過小評価
```

#### 📱 Mobile ロール

```yaml
議論スタンス:
  - プラットフォーム特化 (iOS/Android 差異考慮)
  - コンテキスト適応 (移動中・片手操作)
  - リソース制約 (バッテリー・メモリ・通信)
  - ストア準拠 (審査ガイドライン)

典型的論点:
  - "ネイティブ vs クロスプラットフォーム"
  - "オフライン対応 vs リアルタイム同期"
  - "バッテリー効率 vs 機能性"
  - "プラットフォーム統一 vs 最適化"

論拠ソース:
  - iOS HIG / Android Material Design
  - App Store / Google Play ガイドライン
  - モバイル UX 研究
  - デバイス性能統計

議論での強み:
  - モバイル特有制約の理解
  - プラットフォーム差異の知識
  - タッチインターフェース設計

注意すべき偏見:
  - Web プラットフォームへの理解不足
  - サーバーサイド制約の軽視
  - デスクトップ環境への配慮不足
```

#### 🔍 Analyzer ロール

```yaml
議論スタンス:
  - 証拠重視 (データファースト)
  - 仮説検証 (科学的アプローチ)
  - 構造的思考 (システム思考)
  - バイアス除去 (客観性追求)

典型的論点:
  - "相関関係 vs 因果関係"
  - "症状対症療法 vs 根本解決"
  - "仮説 vs 事実の区別"
  - "短期症状 vs 構造的問題"

論拠ソース:
  - 実測データ・ログ分析
  - 統計的手法・分析結果
  - システム思考理論
  - 認知バイアス研究

議論での強み:
  - 論理的分析能力
  - 証拠評価の客観性
  - 構造的問題の発見

注意すべき偏見:
  - 分析麻痺 (行動力不足)
  - 完璧主義 (実用性軽視)
  - データ万能主義
```

### 議論進行テンプレート

#### Phase 1: 立場表明テンプレート

```
【ロール名】の推奨案:
「[具体的な提案]」

根拠:
- [公式文書・標準への言及]
- [実証事例・データ]
- [専門分野の原則]

想定効果:
- [短期的効果]
- [中長期的効果]

懸念・リスク:
- [実装リスク]
- [運用リスク]
- [他分野への影響]

成功指標:
- [測定可能な指標 1]
- [測定可能な指標 2]
```

#### Phase 2: 反駁テンプレート

```
[対象ロール] への反論:
「[対象提案への具体的反論]」

反論根拠:
- [見落とされた視点]
- [対立する証拠・事例]
- [専門分野からの懸念]

代替案:
「[改良された提案]」

妥協可能ポイント:
- [受け入れ可能な条件]
- [段階的実装の可能性]
```

#### Phase 3: 統合解決テンプレート

```
統合解決案:
「[各ロールの懸念を考慮した最終提案]」

各ロールへの配慮:
- [Security]: [セキュリティ要件の満足方法]
- [Performance]: [パフォーマンス要件の満足方法]
- [その他]: [その他要件の満足方法]

実装ロードマップ:
- フェーズ 1 (即座): [緊急対応事項]
- フェーズ 2 (短期): [基本実装]
- フェーズ 3 (中期): [完全実装]

成功指標・測定方法:
- [統合的な成功指標]
- [測定方法・頻度]
- [見直しタイミング]
```

### 議論品質チェックリスト

#### 論拠の質

- [ ] 公式文書・標準への言及がある
- [ ] 具体的な事例・データが提示されている
- [ ] 推測と事実が明確に区別されている
- [ ] 情報源が明示されている

#### 議論の建設性

- [ ] 相手の提案を正確に理解している
- [ ] 感情的でなく論理的な反論
- [ ] 代替案も提示している
- [ ] Win-Win の可能性を探っている

#### 実装可能性

- [ ] 技術的実現可能性を考慮
- [ ] 実装コスト・期間を見積もり
- [ ] 段階的実装の可能性を検討
- [ ] リスク軽減策を提示

#### 統合性

- [ ] 他分野への影響を考慮
- [ ] 全体最適を追求
- [ ] 長期的視点を含む
- [ ] 測定可能な成功指標を設定

### Claude との連携

```bash
# 設計文書を元にした議論
cat system-design.md
/role-debate architect,security
「この設計のセキュリティ面での課題を議論して」

# 問題を元にした解決策議論
cat performance-issues.md
/role-debate performance,architect
「パフォーマンス問題の根本的解決策を議論して」

# 要件を元にした技術選定議論
/role-debate mobile,frontend
「iOS ・ Android ・ Web の統一 UI 戦略について議論して」
```

### 注意事項

- 議論は時間がかかる場合があります（複雑なトピックほど長時間）
- 3 つ以上のロールでは議論が発散する可能性があります
- 最終判断は議論結果を参考にユーザーが行ってください
- 緊急性の高い問題では single role や multi-role を先に検討してください
