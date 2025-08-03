## Tech Debt

Analyze project technical debt and create prioritized improvement plans.

### Usage

```bash
# Check project structure and analyze technical debt
ls -la
"Please analyze the technical debt of this project and create an improvement plan"
```

### Basic Examples

```bash
# Analyze TODO/FIXME comments
grep -r "TODO\|FIXME\|HACK\|XXX\|WORKAROUND" . --exclude-dir=node_modules --exclude-dir=.git
"Please organize these TODO comments by priority and create an improvement plan"

# Check project dependencies
ls -la | grep -E "package.json|Cargo.toml|pubspec.yaml|go.mod|requirements.txt"
"Please analyze project dependencies and identify outdated ones and risks"

# Detect large files or complex functions
find . -type f -not -path "*/\.*" -not -path "*/node_modules/*" -exec wc -l {} + | sort -rn | head -10
"Please identify oversized files or complex structures and provide improvement suggestions"
```

### Claude Integration

```bash
# Comprehensive technical debt analysis
ls -la && find . -name "*.md" -maxdepth 2 -exec head -20 {} \;
"Please analyze the technical debt of this project from the following perspectives:
1. Code quality (complexity, duplication, maintainability)
2. Dependency health
3. Security risks
4. Performance issues
5. Insufficient test coverage"

# Architecture debt analysis
find . -type d -name "src" -o -name "lib" -o -name "app" | head -10 | xargs ls -la
"Please identify architecture-level technical debt and propose refactoring plans"

# Prioritized improvement plan
"Please evaluate technical debt based on the following criteria and present in table format:
- Impact level (High/Medium/Low)
- Fix cost (time)
- Business risk
- Improvement effects
- Recommended implementation timeline"
```

### Detailed Examples

```bash
# Automatic project type detection and analysis
find . -maxdepth 2 -type f \( -name "package.json" -o -name "Cargo.toml" -o -name "pubspec.yaml" -o -name "go.mod" -o -name "pom.xml" \)
"Based on detected project type, analyze the following:
1. Language and framework-specific technical debt
2. ベストプラクティスからの逸脱
3. モダナイゼーションの機会
4. 段階的な改善戦略」

# コードの品質メトリクス分析
find . -type f -name "*" | grep -E "\.(js|ts|py|rs|go|dart|kotlin|swift|java)$" | wc -l
「プロジェクトのコード品質を分析し、以下のメトリクスを提示：
- 循環的複雑度が高い関数
- 重複コードの検出
- 長すぎるファイル/関数
- 適切なエラーハンドリングの欠如」

# セキュリティ負債の検出
grep -r "password\|secret\|key\|token" . --exclude-dir=.git --exclude-dir=node_modules | grep -v ".env.example"
「セキュリティに関する技術的負債を検出し、修正優先度と対策を提案して」

# テスト不足の分析
find . -type f \( -name "*test*" -o -name "*spec*" \) | wc -l && find . -type f -name "*.md" | xargs grep -l "test"
「テストカバレッジの技術的負債を分析し、テスト戦略を提案して」
```

### 注意事項

- プロジェクトの言語やフレームワークを自動検出し、それに応じた分析を行います
- 技術的負債は「すぐに修正すべき重要な問題」と「長期的に改善する項目」に分類されます
- ビジネス価値と技術的改善のバランスを考慮した現実的な計画を提供します
- 改善による ROI（投資対効果）も考慮に入れます
