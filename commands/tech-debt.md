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
2. Deviations from best practices
3. Modernization opportunities
4. Staged improvement strategy"

# Code quality metrics analysis
find . -type f -name "*" | grep -E "\.(js|ts|py|rs|go|dart|kotlin|swift|java)$" | wc -l
"Analyze the project's code quality and provide the following metrics:
- Functions with high cyclomatic complexity
- Duplicate code detection
- Files/functions that are too long
- Lack of proper error handling"

# Security debt detection
grep -r "password\|secret\|key\|token" . --exclude-dir=.git --exclude-dir=node_modules | grep -v ".env.example"
"Detect security-related technical debt and propose fix priorities and countermeasures"

# Insufficient testing analysis
find . -type f \( -name "*test*" -o -name "*spec*" \) | wc -l && find . -type f -name "*.md" | xargs grep -l "test"
"Analyze technical debt in test coverage and propose testing strategy"
```

### Notes

- Automatically detects project language and framework and provides appropriate analysis
- Technical debt is classified into "critical issues that should be fixed immediately" and "items to improve long-term"
- Provides realistic plans considering the balance between business value and technical improvements
- Also considers ROI (return on investment) from improvements
