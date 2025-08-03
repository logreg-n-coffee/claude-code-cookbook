## PR Feedback

Efficiently handles Pull Request review comments and addresses root causes using a 3-stage error analysis approach.

### Usage

```bash
# Get and analyze review comments
gh pr view --comments
"Please classify review comments by priority and create a response plan"

# Detailed analysis of error-related comments
gh pr checks
"Please analyze CI errors using the 3-stage approach to identify root causes"

# Quality check after fixes are complete
npm test && npm run lint
"Fixes are complete, please check regression tests and code quality"
```

### Basic Examples

```bash
# Execute comment classification
gh pr view 123 --comments | head -20
"Please classify review comments into must/imo/nits/q and determine response order"

# Collect error information
npm run build 2>&1 | tee error.log
"Please identify the root cause of build errors and suggest appropriate fixes"

# Verify fix implementation
git diff HEAD~1
"Please evaluate whether this fix appropriately resolves the review concerns"
```

### Comment Classification System

```
🔴 must: Required fixes
├─ Security issues
├─ Functional bugs
├─ Design principle violations
└─ Convention violations

🟡 imo: Improvement suggestions
├─ Better implementation methods
├─ Performance improvements
├─ Readability improvements
└─ Refactoring suggestions

🟢 nits: Minor points
├─ Typo corrections
├─ Indentation adjustments
├─ Comment additions
└─ Minor naming adjustments

🔵 q: Questions/Confirmations
├─ Implementation intent confirmation
├─ Specification clarification
├─ Design decision background
└─ Alternative option consideration
```

### 3-Stage Error Analysis Approach

#### Stage 1: Information Gathering

##### Required Execution

- Complete error message retrieval
- Stack trace verification
- Reproduction condition identification

##### Recommended Execution

- Environment information collection
- Recent change history
- Related log verification

#### Stage 2: Root Cause Analysis

- Apply 5 Whys analysis
- Track dependencies
- Check environment differences
- Create minimal reproduction code

#### Stage 3: Solution Implementation

- Immediate response (hotfix)
- Fundamental solution (essential fix)
- Prevention measures (recurrence prevention)

### Response Flow

1. **Comment Analysis**: Classification by priority
2. **Fix Planning**: Determine response order
3. **Staged Fixes**: Critical → High → Medium → Low
4. **Quality Verification**: Test, lint, build
5. **Progress Report**: Explain specific fix content

### Post-Fix Verification

```bash
# Basic checks
npm test
npm run lint
npm run build

# Regression testing
npm run test:e2e

# Code quality
npm run test:coverage
```

### Response Templates

#### Fix Completion Report

```markdown
@reviewer Thank you for your feedback.
Fixes have been completed:

- [Specific fix content]
- [Test results]
- [Verification method]
```

#### Technical Decision Explanation

```markdown
Implementation background: [Reason]
Considered alternatives: [Options and decision rationale]
Benefits of adopted approach: [Advantages]
```

### Important Notes

- **Priority Adherence**: Respond in order Critical → High → Medium → Low
- **Test First**: Verify regression tests before fixes
- **Clear Reporting**: Describe fix content and verification methods specifically
- **Constructive Dialogue**: Polite communication based on technical evidence
