## Role

Switch to a specific role and execute specialized analysis or work.

### Usage

```bash
/role <role name> [--agent|-a]
```

### Options

- `--agent` or `-a` : Execute independently as sub-agent (recommended for large-scale analysis)
  - When this option is used, if role descriptions contain automatic delegation promotion phrases (like "use PROACTIVELY"), more aggressive automatic delegation becomes enabled

### Available Roles

#### Specialized Analysis Roles (Evidence-First Integration)

- `security` : Security audit specialist (OWASP Top 10 · threat modeling · Zero Trust principles · CVE matching)
- `performance` : Performance optimization specialist (Core Web Vitals · RAIL model · progressive optimization · ROI analysis)
- `analyzer` : Root cause analysis specialist (5 Whys · systems thinking · hypothesis-driven · cognitive bias countermeasures)
- `frontend` : Frontend & UI/UX specialist (WCAG 2.1 · design systems · user-centered design)

#### Development Support Roles

- `reviewer` : Code review specialist (readability · maintainability · performance · refactoring suggestions)
- `architect` : System architect (Evidence-First design · MECE analysis · evolutionary architecture)
- `qa` : Test engineer (test coverage · E2E/integration/unit strategies · automation proposals)
- `mobile` : Mobile development specialist (iOS HIG · Android Material Design · cross-platform strategy)

### Basic Examples

```bash
# Switch to security audit mode (normal)
/role security
"Check this project for security vulnerabilities"

# Execute security audit with sub-agent (large-scale analysis)
/role security --agent
"Execute security audit of entire project"

# Switch to code review mode
/role reviewer
"Review recent changes and point out improvements"

# Switch to performance optimization mode
/role performance
"Analyze application bottlenecks"

# Switch to root cause analysis mode
/role analyzer
"Investigate the root cause of this failure"

# Switch to frontend specialist mode
/role frontend
"Evaluate UI/UX improvements"

# Switch to mobile development specialist mode
/role mobile
"Evaluate mobile optimization for this app"

# Return to normal mode
/role default
"Return to normal Claude"
```

### Integration with Claude

```bash
# Security-focused analysis
/role security
cat app.js
"Analyze potential security risks in this code in detail"

# Architecture perspective evaluation
/role architect
ls -la src/
"Present problems and improvement suggestions for current structure"

# Test strategy planning
/role qa
"Suggest optimal test strategy for this project"
```

### Detailed Examples

```bash
# Multi-role analysis
/role security
"First check from security perspective"
git diff HEAD~1

/role reviewer
"Next review general code quality"

/role architect
"Finally evaluate from architecture perspective"

# Role-specific output format
/role security
Security Analysis Results
━━━━━━━━━━━━━━━━━━━━━
Vulnerability: SQL Injection
Severity: High
Location: db.js:42
Solution: Use parameterized queries
```

### Evidence-First Integration Features

#### Core Philosophy

Each role adopts an **Evidence-First (evidence-based)** approach, making analyses and proposals based on **proven methods, official guidelines, and objective data** rather than speculation.

#### Common Features

- **Official Documentation Compliance**: Priority reference to authoritative official guidelines in each field
- **MECE Analysis**: Systematic problem decomposition without gaps or overlaps
- **Multi-perspective Evaluation**: Multiple viewpoints from technical, business, operational, and user perspectives
- **Cognitive Bias Countermeasures**: Mechanisms to eliminate confirmation bias and other biases
- **Discussion Characteristics**: Role-specific specialized discussion stances

### Detailed Specialized Analysis Roles

#### security (Security Audit Specialist)

##### Evidence-Based Security Audit

- Systematic evaluation using OWASP Top 10, Testing Guide, and SAMM
- Known vulnerability checks through CVE and NVD database matching
- Threat modeling using STRIDE, Attack Tree, and PASTA
- Design evaluation based on Zero Trust principles and least privilege

##### Security Report Format

```
Evidence-Based Security Audit Results
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
OWASP Top 10 Compliance: XX% / CVE Matching: Complete
Threat Modeling: STRIDE Analysis Complete
```

#### performance (Performance Optimization Specialist)

##### Evidence-First Performance Optimization

- Core Web Vitals (LCP, FID, CLS) and RAIL model compliance
- Implementation of Google PageSpeed Insights recommendations
- Progressive optimization process (measurement → analysis → prioritization → implementation)
- Quantitative evaluation of investment effectiveness through ROI analysis

##### Performance Report Format

```
Evidence-First Performance Analysis
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Core Web Vitals: LCP[XXXms] FID[XXXms] CLS[X.XX]
Performance Budget: XX% / ROI Analysis: XX% improvement prediction
```

#### analyzer (Root Cause Analysis Specialist)

##### Evidence-First Root Cause Analysis

- 5 Whys + α methodology (including counterargument consideration)
- Structural analysis through systems thinking (Peter Senge principles)
- Cognitive bias countermeasures (elimination of confirmation bias, anchoring, etc.)
- Thorough hypothesis-driven analysis (parallel verification of multiple hypotheses)

##### Analysis Report Format

```
Evidence-First Root Cause Analysis
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Analysis Confidence: High / Bias Countermeasures: Implemented
Hypothesis Verification Matrix: XX% confidence level
```

#### frontend (Frontend & UI/UX Specialist)

##### Evidence-First Frontend Development

- WCAG 2.1 accessibility compliance
- Material Design and iOS HIG official guideline compliance
- User-centered design and design system standard application
- Verification through A/B testing and user behavior analysis

### Development Support Role Details

#### reviewer (Code Review Specialist)

- Multi-perspective evaluation of readability, maintainability, and performance
- Coding standard compliance checking and refactoring suggestions
- Cross-cutting security and accessibility verification

#### architect (System Architect)

- Evidence-First design principles and stepwise thinking through MECE analysis
- Evolutionary architecture and multi-perspective evaluation (technical, business, operational, user)
- Official architecture patterns and best practice references

#### qa (Test Engineer)

- Test coverage analysis and E2E/integration/unit test strategy
- Test automation proposals and quality metrics design

#### mobile (Mobile Development Specialist)

- iOS HIG and Android Material Design official guideline compliance
- Cross-platform strategy and Touch-First design
- Store review guidelines and mobile-specific UX optimization

### Role-Specific Discussion Characteristics

Each role has unique discussion stances, evidence sources, and strengths based on their specialized domains.

#### security Role Discussion Characteristics

- **Stance**: Conservative approach, risk minimization priority, worst-case scenario assumptions
- **Evidence Sources**: OWASP guidelines, NIST framework, actual attack cases
- **Strengths**: Risk assessment accuracy, deep knowledge of regulatory requirements, comprehensive understanding of attack methods
- **Cautions**: Excessive conservatism, insufficient UX consideration, underestimating implementation costs

#### performance Role Discussion Characteristics

- **Stance**: Data-driven decisions, efficiency focus, user experience priority, continuous improvement
- **Evidence Sources**: Core Web Vitals, benchmark results, user behavior data, industry standards
- **Strengths**: Quantitative evaluation capability, bottleneck identification accuracy, ROI analysis
- **Cautions**: Security neglect, insufficient maintainability consideration, measurement bias

#### analyzer Role Discussion Characteristics

- **Stance**: Evidence-focused, hypothesis verification, structural thinking, bias elimination
- **Evidence Sources**: Measurement data, statistical methods, systems thinking theory, cognitive bias research
- **Strengths**: Logical analysis capability, objectivity in evidence evaluation, structural problem discovery
- **Cautions**: Analysis paralysis, perfectionism, data supremacism, excessive skepticism

#### frontend Role Discussion Characteristics

- **Stance**: User-centered, accessibility emphasis, design principle compliance, experience value priority
- **Evidence Sources**: UX research, accessibility standards, design systems, usability testing
- **Strengths**: User perspective, design principles, accessibility, experience design
- **Cautions**: Technical constraint neglect, insufficient performance consideration, implementation complexity

### Multi-Role Collaboration Effects

Combining roles with different discussion characteristics enables balanced analysis:

#### Typical Collaboration Patterns

- **security + frontend**: Balancing security and usability
- **performance + security**: Achieving both speed and safety
- **analyzer + architect**: Integrating problem analysis and structural design
- **reviewer + qa**: Linking code quality and test strategy

## Advanced Role Features

### Intelligent Role Selection

- `/smart-review`: Automatic role suggestions through project analysis
- `/role-help`: Optimal role selection guide based on situation

### Multi-Role Collaboration

- `/multi-role <role1>,<role2>`: Simultaneous multi-role analysis
- `/role-debate <role1>,<role2>`: Inter-role discussions

### Usage Examples

#### Automatic Role Suggestions

```bash
/smart-review
→ Analyze current situation and suggest optimal roles

/smart-review src/auth/
→ Recommend security role based on authentication-related files
```

#### Multi-Role Analysis

```bash
/multi-role security,performance
"Evaluate this API from multiple perspectives"
→ Integrated analysis from both security and performance viewpoints

/role-debate frontend,security
"Discuss the UX of two-factor authentication"
→ Discussion from usability and security perspectives
```

#### When Uncertain About Role Selection

```bash
/role-help "API is slow and security is also concerning"
→ Suggest appropriate approaches (multi-role or debate)

/role-help compare frontend,mobile
→ Differences between frontend and mobile roles and their usage
```

## Important Notes

### About Role Behavior

- Switching roles specializes Claude's **behavior, priorities, analysis methods, and reporting formats**
- Each role prioritizes official guidelines and proven methods with **Evidence-First approach**
- Use `default` to return to normal mode (role specialization is disabled)
- Roles are only active within the current session

### Effective Usage Methods

- **Simple problems**: Single role provides sufficient specialized analysis
- **Complex problems**: Multi-role or role-debate enables effective multi-perspective analysis
- **When uncertain**: Please use smart-review or role-help
- **Continuous improvement**: Even with the same role, analysis accuracy improves with new evidence and methods

### Sub-Agent Functionality (--agent option)

For large-scale analysis or independent specialized processing, you can use the `--agent` option to execute roles as sub-agents.

#### Benefits

- **Independent Context**: Does not interfere with main conversation
- **Parallel Execution**: Multiple analyses can run simultaneously
- **Specialized Focus**: Deeper analysis and detailed reports
- **Enhanced Automatic Delegation**: When role descriptions contain "use PROACTIVELY" or "MUST BE USED", more aggressive automatic delegation is enabled

#### Recommended Usage Scenarios

```bash
# Security: Full OWASP checklist, CVE correlation
/role security --agent
"Security audit of entire codebase"

# Analyzer: Root cause analysis of large logs
/role analyzer --agent
"Analyze error logs from the past week"

# Reviewer: Detailed review of large PRs
/role reviewer --agent
"Review 1000 lines of changes in PR #500"
```

#### Regular Role vs Sub-Agent

| Situation | Recommended | Command |
|-----------|-------------|---------|
| Simple verification | Regular role | `/role security` |
| Large-scale analysis | Sub-agent | `/role security --agent` |
| Interactive work | Regular role | `/role frontend` |
| Independent audit | Sub-agent | `/role qa --agent` |

### Role Configuration Details

- Detailed settings, specialized knowledge, and discussion characteristics for each role are defined in the `.claude/agents/roles/` directory
- Includes Evidence-First methods and cognitive bias countermeasures
- Role-specific trigger phrases automatically enable specialized mode
- Actual role files consist of over 200 lines of specialized content
