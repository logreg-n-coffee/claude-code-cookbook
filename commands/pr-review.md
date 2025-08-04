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
├─ Implementation intent confirmation
├─ Design decision background
└─ Best practice sharing
```

### Review Perspectives

#### 1. Code Accuracy

- **Logic Errors**: Boundary values, null checks, exception handling
- **Data Integrity**: Type safety, validation
- **Error Handling**: Comprehensiveness, appropriate processing

#### 2. Security

- **Authentication & Authorization**: Proper checks, permission management
- **Input Validation**: SQL injection, XSS prevention
- **Sensitive Information**: Log output prohibition, encryption

#### 3. Performance

- **Algorithms**: Time complexity, memory efficiency
- **Database**: N+1 queries, index optimization
- **Resources**: Memory leaks, cache utilization

#### 4. Architecture

- **Layer Separation**: Dependency direction, proper separation
- **Coupling**: Loose coupling, interface utilization
- **SOLID Principles**: Single responsibility, open-closed, dependency inversion

### Review Flow

1. **Pre-check**: PR information, change diff, related issues
2. **Systematic Check**: Security → Accuracy → Performance → Architecture
3. **Constructive Feedback**: Specific improvement suggestions and code examples
4. **Follow-up**: Fix verification, CI status, final approval

### Effective Comment Examples

#### Security Issues

```markdown
**critical.must.** Password is stored in plain text

```javascript
// Suggested fix
const bcrypt = require('bcrypt');
const hashedPassword = await bcrypt.hash(password, 12);
```

Hashing is required to prevent security risks.

```

#### Performance Improvement
```markdown
**high.imo.** N+1 query problem will occur

```javascript
// Improvement suggestion: Eager Loading
const users = await User.findAll({ include: [Post] });
```

Query count can be significantly reduced.

```

#### Architecture Violation
```markdown
**high.must.** Layer violation is occurring

Domain layer directly depends on infrastructure layer.
Please introduce interfaces using dependency inversion principle.
```

### Notes

- **Constructive Tone**: Collaborative rather than aggressive communication
- **Specific Suggestions**: Provide solutions, not just problem identification
- **Prioritization**: Respond in order of Critical → High → Medium → Low
- **Continuous Improvement**: Turn review results into knowledge base
